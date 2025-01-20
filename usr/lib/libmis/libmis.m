void *sub_20DBFE4C8(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x5119C9E7uLL);
}

void sub_20DBFE4D8(int a1, void *a2)
{
}

uint64_t MISValidateSignatureAndCopyInfo(const __CFString *a1, const __CFDictionary *a2, void *a3)
{
  return MISValidateSignatureAndCopyInfoWithProgress(a1, a2, a3, 0);
}

uint64_t sub_20DBFE5A8@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v8 = sub_20DC24658();
  uint64_t v24 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_20DC248C8();
  ssize_t v12 = getxattr(a1, (const char *)(v11 + 32), 0, 0, 0, 0);
  uint64_t v13 = swift_release();
  if (v12 < 0)
  {
    uint64_t result = MEMORY[0x2105667F0](v13);
    if (result == 93)
    {
      *a4 = xmmword_20DC288B0;
    }
    else
    {
      int v19 = result;
      uint64_t v20 = sub_20DC24848();
      if ((v20 & 0x100000000) != 0)
      {
        sub_20DC0A13C();
        swift_allocError();
        _DWORD *v22 = v19;
      }
      else
      {
        LODWORD(v25) = v20;
        sub_20DC09CF4(MEMORY[0x263F8EE78]);
        sub_20DC0A190(&qword_26772C870, MEMORY[0x263F06080]);
        sub_20DC246D8();
        sub_20DC24648();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
      }
      return swift_willThrow();
    }
  }
  else
  {
    *(void *)&long long v25 = sub_20DC0A250(v12);
    *((void *)&v25 + 1) = v14;
    swift_bridgeObjectRetain();
    ssize_t v15 = sub_20DC0A2F0((uint64_t *)&v25, a1, a2, a3, v12);
    uint64_t result = swift_bridgeObjectRelease();
    if (v15 < 0)
    {
      int v17 = MEMORY[0x2105667F0](result);
      uint64_t v18 = sub_20DC24848();
      if ((v18 & 0x100000000) != 0)
      {
        sub_20DC0A13C();
        swift_allocError();
        _DWORD *v21 = v17;
      }
      else
      {
        int v26 = v18;
        sub_20DC09CF4(MEMORY[0x263F8EE78]);
        sub_20DC0A190(&qword_26772C870, MEMORY[0x263F06080]);
        sub_20DC246D8();
        sub_20DC24648();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
      }
      swift_willThrow();
      return sub_20DC02730(v25, *((unint64_t *)&v25 + 1));
    }
    else
    {
      *a4 = v25;
    }
  }
  return result;
}

void sub_20DBFEA3C()
{
  uint64_t v1 = sub_20DBFEE7C(&qword_26772C798);
  MEMORY[0x270FA5388](v1 - 8);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C7B0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s18LaunchWarningEntryVMa();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_20DC01EB0())
  {
    uint64_t v30 = v8;
    v28 = v10;
    v29 = v3;
    sub_20DC24918();
    uint64_t v11 = (void *)*sub_20DC01E64();
    sub_20DBFEE7C(qword_26AAF6AD0);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_20DC286F0;
    id v13 = v11;
    uint64_t v14 = sub_20DC24738();
    uint64_t v16 = v15;
    *(void *)(v12 + 56) = MEMORY[0x263F8D310];
    *(void *)(v12 + 64) = sub_20DC01E10();
    *(void *)(v12 + 32) = v14;
    *(void *)(v12 + 40) = v16;
    sub_20DC24838();

    swift_bridgeObjectRelease();
    type metadata accessor for LaunchWarningMark();
    uint64_t v17 = sub_20DC01F40();
    if (v0) {
      return;
    }
    uint64_t v18 = v17;
    if (v17)
    {
      type metadata accessor for LaunchWarningDB();
      uint64_t v12 = (uint64_t)sub_20DC06678(1);
      sub_20DC072F8(v18, (uint64_t)v6);
LABEL_10:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v6, 1, v7) == 1)
      {
        sub_20DC0B918((uint64_t)v6);
        if (objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 0, 0, 0))
        {
LABEL_17:
          swift_release();

          return;
        }
        __break(1u);
      }
      uint64_t v19 = (uint64_t)v28;
      sub_20DC0B978((uint64_t)v6, (uint64_t)v28);
      uint64_t v20 = *(int *)(v7 + 20);
      uint64_t v21 = *(unsigned __int8 *)(v19 + *(int *)(v7 + 24));
      uint64_t v22 = v19 + v20 + *(int *)(type metadata accessor for LaunchWarningDetails() + 36);
      uint64_t v23 = (uint64_t)v29;
      sub_20DC05350(v22, (uint64_t)v29);
      uint64_t v24 = sub_20DC24758();
      uint64_t v25 = *(void *)(v24 - 8);
      int v26 = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) != 1)
      {
        int v26 = (void *)sub_20DC24708();
        (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
      }
      id v27 = [objc_allocWithZone((Class)MISLaunchWarningQueryResult) initWithWarningState:1 withUserOverridden:v21 withKBURL:v26];

      if (v27)
      {
        sub_20DC0B9DC(v19);
        goto LABEL_17;
      }
LABEL_19:
      __break(1u);
      return;
    }
    if (!objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 0, 0, 0))
    {
      __break(1u);
      goto LABEL_10;
    }
  }
  else if (!objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 0, 0, 0))
  {
    __break(1u);
    goto LABEL_19;
  }
}

uint64_t sub_20DBFEE7C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t _s18LaunchWarningEntryVMa()
{
  uint64_t result = qword_26772C8B0;
  if (!qword_26772C8B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20DBFEF0C(uint64_t a1, id *a2)
{
  char v3 = sub_20DC24898();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20DBFEF8C(const __CFDictionary *a1)
{
  uint64_t v1 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F17220]);
  uint64_t v4 = [v1 objectForKeyedSubscript:v2];

  return v4;
}

uint64_t sub_20DBFEFE0(const __SecCode *a1, int a2, int a3, int a4, int a5, void *a6)
{
  id v11 = a6;
  if (a3 == 1) {
    int v12 = 7;
  }
  else {
    int v12 = 8193;
  }
  if (a4) {
    int v13 = 0x20000000;
  }
  else {
    int v13 = 0x10000;
  }
  int v14 = v13 | v12;
  if (a5 == 1) {
    SecCSFlags v15 = v14 | 0x400;
  }
  else {
    SecCSFlags v15 = v14;
  }
  CFErrorRef errors = 0;
  uint64_t v16 = (void *)MEMORY[0x210567610]();
  uint64_t v17 = SecStaticCodeCheckValidityWithErrors(a1, v15, 0, &errors);
  if (errors)
  {
    if (a2 == 1)
    {
      CFDictionaryRef v18 = CFErrorCopyUserInfo(errors);
      if (v18)
      {
        CFDictionaryRef v19 = v18;
        sub_20DC1DED0(v18, (const void *)*MEMORY[0x263F17128], (uint64_t)"resource added");
        sub_20DC1DED0(v19, (const void *)*MEMORY[0x263F17138], (uint64_t)"resource deleted");
        sub_20DC1DED0(v19, (const void *)*MEMORY[0x263F17130], (uint64_t)"resource modified");
        CFRelease(v19);
      }
    }
    CFRelease(errors);
  }
  uint64_t v20 = sub_20DBFF11C(v17);

  return v20;
}

uint64_t sub_20DBFF11C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((int)a1 > -67055)
  {
    switch(a1)
    {
      case 0xFFFEFA12:
        int v2 = 22;
        break;
      case 0xFFFEFA4C:
        int v2 = 18;
        break;
      case 0:
        return v1;
      default:
        goto LABEL_13;
    }
    return v2 | 0xE8008001;
  }
  if (a1 == -67062) {
    return 3892346908;
  }
  if (a1 == -67061) {
    return 3892346905;
  }
LABEL_13:
  if ((a1 - 100001) <= 0x69) {
    return (a1 - 100000) | 0xC000u;
  }
  uint64_t v3 = sub_20DBFFB10();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_error_impl(&dword_20DBFC000, v3, OS_LOG_TYPE_ERROR, "unrecognized status %d from codesigning library", (uint8_t *)v5, 8u);
  }
  uint64_t v1 = 3892346881;

  return v1;
}

uint64_t sub_20DBFF288(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  Value = (void *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F17230]);
  if (!Value) {
    return 0;
  }
  uint64_t v6 = Value;
  uint64_t v7 = 3892346902;
  if (a2 && a3)
  {
    uint64_t v8 = Value;
    if ((unint64_t)objc_msgSend_length(v8, v9, v10, v11) > 7)
    {
      int v13 = (void *)MEMORY[0x263EFF8F8];
      int v14 = v8;
      uint64_t v18 = [v14 v15:v16 v17] + 8;
      uint64_t v22 = [v14 length:v19, v20, v21];
      uint64_t v24 = [v13 dataWithBytesNoCopy:v23 length:v22 - 8 freeWhenDone:0];
      uint64_t v25 = CEManagedContextFromCFData();
      int v26 = (void *)MEMORY[0x263F8BAF0];
      if (v25 == *MEMORY[0x263F8BAF0])
      {
        if (CEQueryContextToCFDictionary() == *v26) {
          uint64_t v7 = 0;
        }
        else {
          CEReleaseManagedContext();
        }
      }
    }
    else
    {
      int v12 = sub_20DBFFB10();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v28) = 0;
        _os_log_error_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_ERROR, "Blob data too small", (uint8_t *)&v28, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = sub_20DBFFB10();
    uint64_t v7 = 3892346881;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v28 = 138412802;
      v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = a2;
      __int16 v32 = 2048;
      uint64_t v33 = a3;
      _os_log_error_impl(&dword_20DBFC000, v8, OS_LOG_TYPE_ERROR, "MISCreateEntitlementsFromBlobData called with invalid arguments: %@, %p, %p", (uint8_t *)&v28, 0x20u);
    }
  }

  return v7;
}

uint64_t MISQueryBlacklistForCdHash(const __CFData *a1, int a2, int a3, _DWORD *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (qword_26AAF6F90 != -1)
  {
    v51 = a4;
    dispatch_once(&qword_26AAF6F90, &unk_26C249670);
    a4 = v51;
  }
  CFStringRef v7 = (const __CFString *)qword_26AAF6F88;
  if (!qword_26AAF6F88)
  {
    uint64_t v16 = sub_20DBFFB10();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v16, OS_LOG_TYPE_ERROR, "Could not get denylist path (this should not happen).", buf, 2u);
    }

    return 0;
  }
  int v54 = a3;
  v53 = a4;
  CFIndex Length = CFStringGetLength((CFStringRef)qword_26AAF6F88);
  CFIndex v9 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v10 = (char *)CFAllocatorAllocate(0, v9, 0);
  if (!v10)
  {
    uint64_t v18 = sub_20DBFFB10();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    CFDictionaryRef v19 = "Could not allocate buffer for denylist path (this should not happen.";
LABEL_19:
    uint64_t v20 = v18;
    uint32_t v21 = 2;
    goto LABEL_20;
  }
  if (!CFStringGetCString(v7, v10, v9, 0x8000100u))
  {
    uint64_t v18 = sub_20DBFFB10();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    CFDictionaryRef v19 = "Denylist path conversion failed (this should not happen.)";
    goto LABEL_19;
  }
  int v11 = open(v10, 0);
  if ((v11 & 0x80000000) == 0)
  {
    int v12 = v11;
    int64_t v13 = lseek(v11, 0, 2);
    if (v13 > 23)
    {
      uint64_t v25 = (unsigned int *)mmap(0, v13, 1, 2, v12, 0);
      if (v25 == (unsigned int *)-1)
      {
        uint64_t v33 = sub_20DBFFB10();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          int v49 = *__error();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v49;
          _os_log_error_impl(&dword_20DBFC000, v33, OS_LOG_TYPE_ERROR, "Could not map denylist, error %{errno}d", buf, 8u);
        }
        uint64_t v15 = -1;
        goto LABEL_35;
      }
      uint64_t v15 = (uint64_t)v25;
      if (*v25 == 1134124660)
      {
        unint64_t v26 = v25[2];
        if (v13 >= v26)
        {
          v38 = (char *)v25 + v26;
          uint64_t v45 = v25[3];
          uint64_t v37 = (uint64_t)&v38[32 * v45];
          unint64_t v46 = v37 + 4 * v45;
          unint64_t v47 = v46 - ((void)v25 + v13);
          if (v46 <= (unint64_t)v25 + v13)
          {
LABEL_42:
            CFAllocatorDeallocate(0, v10);
            uint64_t v17 = v37;
            v39 = v38;
            goto LABEL_43;
          }
          v48 = sub_20DBFFB10();
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v47;
          v29 = "Denylist is %td bytes short for entry count";
          __int16 v30 = v48;
          uint32_t v31 = 12;
        }
        else
        {
          id v27 = sub_20DBFFB10();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            goto LABEL_35;
          }
          unsigned int v28 = *(_DWORD *)(v15 + 8);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v28;
          *(_WORD *)&buf[8] = 2048;
          *(void *)&buf[10] = v13;
          v29 = "Denylist entries offset %u is past denylist size %lld";
          __int16 v30 = v27;
          uint32_t v31 = 18;
        }
      }
      else
      {
        uint64_t v34 = sub_20DBFFB10();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        int v50 = *(_DWORD *)v15;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v50;
        v29 = "Wrong denylist magic (0x08%x)";
        __int16 v30 = v34;
        uint32_t v31 = 8;
      }
      _os_log_error_impl(&dword_20DBFC000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    }
    else
    {
      int v14 = sub_20DBFFB10();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 24;
        _os_log_error_impl(&dword_20DBFC000, v14, OS_LOG_TYPE_ERROR, "Denylist is too short (%lld bytes) for header (%lu bytes)", buf, 0x16u);
      }
      if (v13 < 1) {
        goto LABEL_37;
      }
      uint64_t v15 = 0;
    }
LABEL_35:
    if ((unint64_t)(v15 + 1) >= 2) {
      munmap((void *)v15, v13);
    }
LABEL_37:
    close(v12);
    goto LABEL_38;
  }
  int v22 = *__error();
  uint64_t v23 = sub_20DBFFB10();
  uint64_t v24 = v23;
  if (v22 != 2)
  {
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    int v32 = *__error();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v32;
    CFDictionaryRef v19 = "Could not open denylist, error %{errno}d";
    uint64_t v20 = v24;
    uint32_t v21 = 8;
LABEL_20:
    _os_log_error_impl(&dword_20DBFC000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_38;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_DEBUG, "Denylist does not exist.", buf, 2u);
  }
LABEL_38:
  v35 = sub_20DBFFB10();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20DBFC000, v35, OS_LOG_TYPE_DEBUG, "Using empty denylist.", buf, 2u);
  }
  v36 = (unsigned int *)mmap(0, 0x18uLL, 3, 4098, -1, 0);
  if (v36 == (unsigned int *)-1)
  {
    v52 = sub_20DBFFB10();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v52, OS_LOG_TYPE_ERROR, "Failed to mmap fallback denylist header. Giving up.", buf, 2u);
    }
    abort();
  }
  uint64_t v15 = (uint64_t)v36;
  *((void *)v36 + 2) = 0;
  *(_OWORD *)v36 = xmmword_20DC2A220;
  int64_t v13 = 24;
  mprotect(v36, 0x18uLL, 1);
  uint64_t v37 = 0;
  v38 = 0;
  uint64_t v17 = 0;
  v39 = 0;
  int v12 = -1;
  if (v10) {
    goto LABEL_42;
  }
LABEL_43:
  memset(buf, 0, sizeof(buf));
  int v56 = 0;
  int v57 = a2;
  uint64_t v40 = CFDataGetLength(a1);
  if (v40 >= 28) {
    v41.length = 28;
  }
  else {
    v41.length = v40;
  }
  v41.location = 0;
  CFDataGetBytes(a1, v41, buf);
  v42 = bsearch_b(buf, v39, *(unsigned int *)(v15 + 12), 0x20uLL, &unk_26C249820);
  if (!v42)
  {
LABEL_50:
    uint64_t v17 = 0;
    goto LABEL_54;
  }
  if (v17)
  {
    v43 = v42;
    if (!v54 || !MISBlacklistOverriddenByUser(a1, a2))
    {
      if (v53) {
        _DWORD *v53 = *(_DWORD *)(v17 + 4 * ((v43 - (unsigned char *)v39) >> 5));
      }
      uint64_t v17 = 1;
      goto LABEL_54;
    }
    goto LABEL_50;
  }
LABEL_54:
  if ((unint64_t)(v15 + 1) >= 2)
  {
    munmap((void *)v15, v13);
    if (v12 < 0) {
      return v17;
    }
    goto LABEL_56;
  }
  if ((v12 & 0x80000000) == 0) {
LABEL_56:
  }
    close(v12);
  return v17;
}

id sub_20DBFFB10()
{
  if (qword_26AAF7138 != -1) {
    dispatch_once(&qword_26AAF7138, &unk_26C2496B0);
  }
  if (qword_26AAF7130) {
    uint64_t v0 = (void *)qword_26AAF7130;
  }
  else {
    uint64_t v0 = (void *)MEMORY[0x263EF8438];
  }

  return v0;
}

CFDictionaryRef sub_20DBFFB74(const __CFDictionary *a1, const void *a2, Boolean *a3)
{
  CFBooleanRef BOOLean = 0;
  CFTypeID TypeID = CFBooleanGetTypeID();
  CFDictionaryRef v7 = sub_20DBFFBE4(a1, a2, TypeID, &BOOLean);
  if (!v7 && BOOLean) {
    *a3 = CFBooleanGetValue(BOOLean);
  }
  return v7;
}

CFDictionaryRef sub_20DBFFBE4(const __CFDictionary *result, const void *a2, uint64_t a3, const __CFDictionary **a4)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v6 = result;
      if (CFGetTypeID(result) == a3)
      {
        uint64_t result = 0;
        *a4 = v6;
      }
      else
      {
        return (const __CFDictionary *)49174;
      }
    }
  }
  return result;
}

BOOL sub_20DBFFC40(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  [NSURL fileURLWithPath:a2];
  uint64_t v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v8 = [v4 v5:v6:v7];
  uint64_t v10 = [v8 countByEnumeratingWithState:v9 objects:&v44 count:16];
  if (!v10) {
    goto LABEL_9;
  }
  uint64_t v14 = v10;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v45;
  while (2)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v15 + 1;
    v15 += v14;
    do
    {
      if (*(void *)v45 != v16) {
        objc_enumerationMutation(v8);
      }
      CFDictionaryRef v19 = [*(void **)(*((void *)&v44 + 1) + 8 * v17) v11:v12 v13];
      char isEqualToString = [v19 isEqualToString:v20];

      if (isEqualToString)
      {
        uint64_t v24 = NSURL;
        uint64_t v25 = [v4 pathComponents:v11, v12, v13];
        id v27 = [v25 subarrayWithRange:NSMakeRange(v26, v18 + v17)];
        [v24 fileURLWithPathComponents:v28, (uint64_t)v27, v29];
        CFURLRef v23 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

        if (!v23) {
          goto LABEL_24;
        }
        if (sub_20DC00034((const __CFURL *)v4, v23))
        {
          Unique = (__CFBundle *)_CFBundleCreateUnique();
          if (Unique)
          {
            uint32_t v31 = sub_20DBFFB10();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v49 = v4;
              __int16 v50 = 2112;
              CFURLRef v51 = v23;
              _os_log_impl(&dword_20DBFC000, v31, OS_LOG_TYPE_INFO, "Got bundle for %@ -> %@", buf, 0x16u);
            }

            CFURLRef v32 = CFBundleCopyExecutableURL(Unique);
            CFURLRef v33 = v32;
            if (v32)
            {
              CFURLRef v34 = CFURLCopyAbsoluteURL(v32);
              v35 = sub_20DBFFB10();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                CFStringRef v36 = CFURLGetString((CFURLRef)v4);
                *(_DWORD *)buf = 138412290;
                CFStringRef v49 = v36;
                _os_log_impl(&dword_20DBFC000, v35, OS_LOG_TYPE_INFO, "Ours: %@", buf, 0xCu);
              }

              uint64_t v37 = sub_20DBFFB10();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                CFStringRef v38 = CFURLGetString(v34);
                *(_DWORD *)buf = 138412290;
                CFStringRef v49 = v38;
                _os_log_impl(&dword_20DBFC000, v37, OS_LOG_TYPE_INFO, "Bundle: %@", buf, 0xCu);
              }

              CFComparisonResult v39 = sub_20DC00034((const __CFURL *)v4, v34);
              BOOL v40 = v39 == kCFCompareEqualTo;
              CFRange v41 = sub_20DBFFB10();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v49) = v39 == kCFCompareEqualTo;
                _os_log_impl(&dword_20DBFC000, v41, OS_LOG_TYPE_INFO, "Is main executable: %i", buf, 8u);
              }

              char v42 = 0;
              if (v4) {
                goto LABEL_30;
              }
              goto LABEL_31;
            }
            char v42 = 0;
          }
          else
          {
            char v42 = 0;
            CFURLRef v33 = 0;
          }
        }
        else
        {
          char v42 = 0;
          CFURLRef v33 = 0;
          Unique = 0;
        }
        CFURLRef v34 = 0;
        goto LABEL_29;
      }
      ++v17;
    }
    while (v14 != v17);
    uint64_t v14 = [v8 countByEnumeratingWithState:v11 objects:buf count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_9:

  CFURLRef v23 = 0;
LABEL_24:
  CFURLRef v33 = 0;
  Unique = 0;
  CFURLRef v34 = 0;
  char v42 = 1;
LABEL_29:
  BOOL v40 = 1;
  if (v4) {
LABEL_30:
  }
    CFRelease(v4);
LABEL_31:
  if (v33) {
    CFRelease(v33);
  }
  if (v34) {
    CFRelease(v34);
  }
  if ((v42 & 1) == 0) {
    CFRelease(v23);
  }
  if (Unique) {
    CFRelease(Unique);
  }
  return v40;
}

CFComparisonResult sub_20DC00034(const __CFURL *a1, const __CFURL *a2)
{
  CFStringRef v3 = CFURLGetString(a1);
  CFStringRef v4 = CFURLGetString(a2);

  return CFStringCompare(v3, v4, 0);
}

uint64_t MISValidateSignatureAndCopyInfoWithProgress(const __CFString *a1, const __CFDictionary *a2, void *a3, void *a4)
{
  uint64_t v181 = *MEMORY[0x263EF8340];
  id v154 = a4;
  context = (void *)MEMORY[0x210567610]();
  unsigned int v173 = 0;
  uint64_t v171 = 0;
  CFTypeRef v172 = 0;
  CFTypeRef cf = 0;
  CFDictionaryRef v170 = 0;
  uint64_t v167 = 0;
  CFTypeRef v168 = 0;
  v155 = (const __SecCode *)sub_20DC015DC(a1, (uint64_t)a2, (int *)&v173);
  if (!v155) {
    goto LABEL_4;
  }
  v152 = a3;
  __int16 v166 = 0;
  __int16 v165 = 0;
  __int16 v164 = 0;
  Boolean v163 = 0;
  int64_t valuePtr = 0;
  __int16 v161 = 0;
  __int16 v160 = 0;
  Boolean v159 = 0;
  unsigned int v7 = sub_20DBFFB74(a2, @"UnauthoritativeLaunch", (Boolean *)&v166);
  id v8 = 0;
  CFIndex v9 = 0;
  uint64_t v10 = 0;
  int v11 = 0;
  CFNumberRef v12 = 0;
  CFDataRef v13 = 0;
  uint64_t v14 = 0;
  CFDataRef v15 = 0;
  CFArrayRef v16 = 0;
  CFDictionaryRef v17 = 0;
  unsigned int v173 = v7;
  if (v7) {
    goto LABEL_5;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"AuthoritativeLaunch", (Boolean *)&v166 + 1);
  if (v173) {
    goto LABEL_4;
  }
  int v22 = v166;
  if ((_BYTE)v166 && HIBYTE(v166))
  {
    CFURLRef v23 = sub_20DBFFB10();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v23, OS_LOG_TYPE_ERROR, "Caller specified both unauthoritative and authoritative launch modes.", buf, 2u);
    }

    id v8 = 0;
    CFIndex v9 = 0;
    uint64_t v10 = 0;
    int v11 = 0;
    CFNumberRef v12 = 0;
    CFDataRef v13 = 0;
    uint64_t v14 = 0;
    CFDataRef v15 = 0;
    CFArrayRef v16 = 0;
    CFDictionaryRef v17 = 0;
    unsigned int v24 = -402620376;
    goto LABEL_76;
  }
  if (v166)
  {
    HIBYTE(v165) = 1;
    __int16 v164 = 0;
    Boolean v163 = 0;
    __int16 v161 = 257;
    HIBYTE(v160) = 0;
  }
  if (a2)
  {
    Value = (const UInt8 *)CFDictionaryGetValue(a2, @"ExpectedHash");
    BytePtr = Value;
    if (Value)
    {
      CFTypeID v27 = CFGetTypeID(Value);
      if (v27 != CFDataGetTypeID() || CFDataGetLength((CFDataRef)BytePtr) != 20)
      {
        id v8 = 0;
        CFIndex v9 = 0;
        uint64_t v10 = 0;
        int v11 = 0;
        CFNumberRef v12 = 0;
        CFDataRef v13 = 0;
        uint64_t v14 = 0;
        CFDataRef v15 = 0;
        CFArrayRef v16 = 0;
        CFDictionaryRef v17 = 0;
        unsigned int v24 = 49174;
LABEL_76:
        unsigned int v173 = v24;
        goto LABEL_5;
      }
      BytePtr = CFDataGetBytePtr((CFDataRef)BytePtr);
    }
  }
  else
  {
    BytePtr = 0;
  }
  unsigned int v173 = 0;
  unsigned int v173 = sub_20DBFFB74(a2, @"LogResourceErrors", (Boolean *)&v165);
  if (v173) {
    goto LABEL_4;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"AllowAdHocSigning", (Boolean *)&v164 + 1);
  if (v173) {
    goto LABEL_4;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"ValidateSignatureOnly", (Boolean *)&v165 + 1);
  if (v173) {
    goto LABEL_4;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"UseSoftwareSigningCert", (Boolean *)&v164);
  if (v173) {
    goto LABEL_4;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"OnlineAuthorization", &v163);
  if (v173) {
    goto LABEL_4;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"SkipProfileIdentifierPolicy", (Boolean *)&v160);
  if (v173) {
    goto LABEL_4;
  }
  int v150 = v22;
  __s2 = BytePtr;
  unsigned int v173 = sub_20DBFFB74(a2, @"AllowLaunchWarnings", &v159);
  if (v173) {
    goto LABEL_4;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  unsigned int v173 = sub_20DBFFBE4(a2, @"MainExecutablePath", TypeID, &v170);
  if (v173) {
    goto LABEL_4;
  }
  BOOL v32 = sub_20DBFFC40((uint64_t)a1, v29, v30, v31);
  BOOL v33 = v32;
  int v34 = !v32;
  if ((_BYTE)v160) {
    int v34 = 1;
  }
  int v148 = v34;
  LOBYTE(v160) = v34;
  *(void *)buf = 0;
  CFTypeID v35 = CFNumberGetTypeID();
  unsigned int v173 = sub_20DBFFBE4(a2, @"OnlineCheckType", v35, (const __CFDictionary **)buf);
  if (v173) {
    goto LABEL_4;
  }
  if (*(void *)buf && !CFNumberGetValue(*(CFNumberRef *)buf, kCFNumberCFIndexType, &valuePtr))
  {
    long long v46 = sub_20DBFFB10();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v174 = 0;
      _os_log_error_impl(&dword_20DBFC000, v46, OS_LOG_TYPE_ERROR, "Failure to convert onlineCheckType. (This should not happen.)", v174, 2u);
    }

    unsigned int v173 = -402620415;
    goto LABEL_4;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"RespectUppTrustAndAuthorization", (Boolean *)&v161 + 1);
  if (v173) {
    goto LABEL_4;
  }
  int v147 = HIBYTE(v161);
  if (HIBYTE(v161)) {
    LOBYTE(v161) = 1;
  }
  unsigned int v173 = sub_20DBFFB74(a2, @"HonorBlocklist", (Boolean *)&v161);
  if (v173 || (unsigned int v173 = sub_20DBFFB74(a2, @"TrustCacheOnly", (Boolean *)&v160 + 1)) != 0)
  {
LABEL_4:
    id v8 = 0;
    CFIndex v9 = 0;
    uint64_t v10 = 0;
    int v11 = 0;
    CFNumberRef v12 = 0;
    CFDataRef v13 = 0;
    uint64_t v14 = 0;
    CFDataRef v15 = 0;
    CFArrayRef v16 = 0;
    CFDictionaryRef v17 = 0;
    goto LABEL_5;
  }
  if (v22) {
    BOOL v36 = HIBYTE(v165) == 0;
  }
  else {
    BOOL v36 = 1;
  }
  if (v36) {
    int v37 = 0;
  }
  else {
    int v37 = v148;
  }
  int v38 = v164;
  unsigned int v173 = sub_20DBFEFE0(v155, v165, HIBYTE(v165), v37, v164, v154);
  if (!v33)
  {
    CFComparisonResult v39 = sub_20DBFFB10();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DBFC000, v39, OS_LOG_TYPE_INFO, "DER policy skipped as we're not validating a main executable", buf, 2u);
    }
    goto LABEL_82;
  }
  if (sub_20DC01840()) {
    goto LABEL_83;
  }
  CFComparisonResult v39 = sub_20DC24098();
  BOOL v40 = @"Internal";
  char isEqualToString = [v39 isEqualToString:v41];

  long long v44 = sub_20DBFFB10();
  BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
  if ((isEqualToString & 1) == 0)
  {
    if (v45)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v44, OS_LOG_TYPE_ERROR, "validation failed because of missing DER entitlements", buf, 2u);
    }

    unsigned int v173 = -402620375;
    goto LABEL_4;
  }
  if (v45)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20DBFC000, v44, OS_LOG_TYPE_ERROR, "validation would have failed due to missing DER entitlements", buf, 2u);
  }

LABEL_82:
LABEL_83:
  if (v173 == -402620397)
  {
    uint64_t v142 = 0;
    LODWORD(log) = 1;
  }
  else
  {
    id v8 = 0;
    CFIndex v9 = 0;
    uint64_t v10 = 0;
    int v11 = 0;
    CFNumberRef v12 = 0;
    CFDataRef v13 = 0;
    uint64_t v14 = 0;
    CFDataRef v15 = 0;
    CFArrayRef v16 = 0;
    CFDictionaryRef v17 = 0;
    if (v173) {
      goto LABEL_5;
    }
    LODWORD(log) = 0;
    uint64_t v47 = 4;
    if (!v38) {
      uint64_t v47 = 2;
    }
    uint64_t v142 = v47;
  }
  sub_20DC01D24(v155);
  CFDictionaryRef v146 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v146)
  {
    id v8 = 0;
    CFIndex v9 = 0;
    uint64_t v10 = 0;
    int v11 = 0;
    CFNumberRef v12 = 0;
    CFDataRef v13 = 0;
    uint64_t v14 = 0;
    CFDataRef v15 = 0;
    CFArrayRef v16 = 0;
    CFDictionaryRef v17 = 0;
    unsigned int v24 = -402620407;
    goto LABEL_76;
  }
  if (v159 && _os_feature_enabled_impl())
  {
    __int16 v50 = [NSURL fileURLWithPath:v48];
    CFURLRef v51 = objc_opt_new();
    id v158 = 0;
    v53 = [v51 checkForLaunchWarning:v52 error:&v158];
    id v57 = v158;
    if (v53)
    {
      if (objc_msgSend_length(v53, v54, v55, v56))
      {
        uint64_t v58 = sub_20DBFFB10();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_impl(&dword_20DBFC000, v58, OS_LOG_TYPE_DEFAULT, "New bundle has outstanding launch warning: %@", buf, 0xCu);
        }

        id v145 = v53;
        goto LABEL_106;
      }
    }
    else
    {
      v59 = sub_20DBFFB10();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v57;
        _os_log_error_impl(&dword_20DBFC000, v59, OS_LOG_TYPE_ERROR, "Error checking for launch warning: %@, %@", buf, 0x16u);
      }
    }
    id v145 = 0;
LABEL_106:

    goto LABEL_107;
  }
  id v145 = 0;
LABEL_107:
  char v60 = v161;
  if (!(_BYTE)v161) {
    goto LABEL_127;
  }
  CFDataRef v13 = (const __CFData *)sub_20DC01D90(v146);
  if (_os_feature_enabled_impl())
  {
    v63 = objc_opt_new();
    if (v170)
    {
      v64 = [NSURL fileURLWithPath:v61];
      uint64_t v157 = 0;
      v65 = (id *)&v157;
      uint64_t v67 = [v63 queryExecutableURL:v66 error:&v157];
    }
    else
    {
      v64 = [NSURL fileURLWithPath:v61];
      uint64_t v156 = 0;
      v65 = (id *)&v156;
      uint64_t v67 = [v63 queryAppBundle:v68 error:&v156];
    }
    v69 = (void *)v67;
    id v70 = *v65;

    if (v69)
    {
      if (objc_msgSend_warningState(v69, v71, v72, v73) && (objc_msgSend_isUserOverridden(v69, v74, v75, v76) & 1) == 0)
      {
        v77 = sub_20DBFFB10();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_impl(&dword_20DBFC000, v77, OS_LOG_TYPE_DEFAULT, "Blocking bundle with outstanding launch warning: %@", buf, 0xCu);
        }

        unsigned int v173 = -402620387;
        CFIndex v9 = 0;
        uint64_t v10 = 0;
        int v11 = 0;
        CFNumberRef v12 = 0;
        uint64_t v14 = 0;
        CFDataRef v15 = 0;
        CFArrayRef v16 = 0;
        goto LABEL_163;
      }
    }
    else
    {
      v78 = sub_20DBFFB10();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v70;
        _os_log_error_impl(&dword_20DBFC000, v78, OS_LOG_TYPE_ERROR, "Error checking for launch warning mark: %@, %@", buf, 0x16u);
      }
    }
  }
  if (MISQueryBlacklistForCdHash(v13, 26, 1, 0))
  {
    v79 = CFDataGetBytePtr(v13);
    v80 = sub_20DBFFB10();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      int v81 = *v79;
      int v82 = v79[1];
      int v83 = v79[2];
      int v84 = v79[3];
      int v85 = v79[4];
      int v86 = v79[5];
      int v87 = v79[6];
      int v88 = v79[7];
      *(_DWORD *)buf = 67110912;
      *(_DWORD *)&uint8_t buf[4] = v81;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v82;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v83;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v84;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v85;
      LOWORD(v177) = 1024;
      *(_DWORD *)((char *)&v177 + 2) = v86;
      HIWORD(v177) = 1024;
      LODWORD(v178) = v87;
      WORD2(v178) = 1024;
      *(_DWORD *)((char *)&v178 + 6) = v88;
      _os_log_impl(&dword_20DBFC000, v80, OS_LOG_TYPE_DEFAULT, "The bundle with cdhash %02x%02x%02x%02x%02x%02x%02x%02x... is deny-listed.", buf, 0x32u);
    }

    CFIndex v9 = 0;
    uint64_t v10 = 0;
    int v11 = 0;
    CFNumberRef v12 = 0;
    uint64_t v14 = 0;
    CFDataRef v15 = 0;
    CFArrayRef v16 = 0;
    unsigned int v89 = -402620387;
    goto LABEL_162;
  }
  if (!v13) {
LABEL_127:
  }
    CFDataRef v13 = (const __CFData *)sub_20DC01D90(v146);
  CFArrayRef v90 = sub_20DC01C34(v146, (int *)&v173);
  CFArrayRef v16 = v90;
  unsigned int v91 = v173;
  if (v173 == -402620396)
  {
    if (HIBYTE(v164))
    {
      CFDataRef v15 = 0;
      unsigned int v173 = 0;
      uint64_t v142 = 1;
      goto LABEL_152;
    }
    CFIndex v9 = 0;
    uint64_t v10 = 0;
    int v11 = 0;
    CFNumberRef v12 = 0;
    uint64_t v14 = 0;
    CFDataRef v15 = 0;
    goto LABEL_163;
  }
  if (v90)
  {
    if (CFArrayGetCount(v90))
    {
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v16, 0);
      if (ValueAtIndex)
      {
        v93 = ValueAtIndex;
        CFDataRef v15 = SecCertificateCopyData(ValueAtIndex);
        buf[0] = 0;
        if (!SecCertificateIsSelfSigned() && buf[0])
        {
          v94 = SecCertificateCopyKey(v93);
          CFDataRef v95 = SecKeyCopyExternalRepresentation(v94, 0);
          CFDataRef v99 = (const __CFData *)sub_20DC23DE8((uint64_t)v95, v96, v97, v98);
          CFDataRef v100 = v99;
          if (v99)
          {
            if (v95)
            {
              CFIndex Length = CFDataGetLength(v99);
              if (Length == CFDataGetLength(v95))
              {
                v102 = CFDataGetBytePtr(v100);
                v103 = CFDataGetBytePtr(v95);
                size_t v104 = CFDataGetLength(v100);
                if (!memcmp(v102, v103, v104))
                {
                  LODWORD(log) = 0;
                  unsigned int v173 = 0;
                  uint64_t v142 = 6;
                }
              }
            }
          }
          if (v94) {
            CFRelease(v94);
          }
          if (v95) {
            CFRelease(v95);
          }
          if (v100) {
            CFRelease(v100);
          }
        }
        unsigned int v91 = v173;
        goto LABEL_150;
      }
      v105 = sub_20DBFFB10();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
LABEL_161:

        CFIndex v9 = 0;
        uint64_t v10 = 0;
        int v11 = 0;
        CFNumberRef v12 = 0;
        uint64_t v14 = 0;
        CFDataRef v15 = 0;
        unsigned int v89 = -402620415;
        goto LABEL_162;
      }
      *(_WORD *)buf = 0;
      v106 = "First certificate is NULL (this should not happen).";
    }
    else
    {
      v105 = sub_20DBFFB10();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
        goto LABEL_161;
      }
      *(_WORD *)buf = 0;
      v106 = "Signers array is empty (this should not happen).";
    }
    _os_log_error_impl(&dword_20DBFC000, v105, OS_LOG_TYPE_ERROR, v106, buf, 2u);
    goto LABEL_161;
  }
  CFDataRef v15 = 0;
LABEL_150:
  if (!v91)
  {
LABEL_152:
    uint64_t v14 = sub_20DC01BD4(v146, (int *)&v173);
    if (v173)
    {
      CFIndex v9 = 0;
      uint64_t v10 = 0;
LABEL_157:
      int v11 = 0;
      CFNumberRef v12 = 0;
      goto LABEL_163;
    }
    uint64_t v10 = (void *)sub_20DC01B40(v146, (int *)&v173);
    if (v173 || (unsigned int v173 = sub_20DBFF288(v146, (uint64_t)&v172, (uint64_t)&v171)) != 0)
    {
      CFIndex v9 = 0;
      goto LABEL_157;
    }
    CFIndex v9 = sub_20DC01AC8(v146, &v173);
    if (v173) {
      goto LABEL_157;
    }
    CFNumberRef v12 = (const __CFNumber *)sub_20DC01DD0(v146);
    int v11 = (void *)sub_20DBFEF8C(v146);
    if (!v16 || !log)
    {
LABEL_207:
      *(void *)buf = 0;
      if (!CFNumberGetValue(v12, kCFNumberLongLongType, buf) || *(uint64_t *)buf <= 132095)
      {
        unsigned int v89 = -402620375;
        goto LABEL_162;
      }
      if (!v13) {
        CFDataRef v13 = (const __CFData *)sub_20DC01D90(v146);
      }
      if (!__s2) {
        goto LABEL_218;
      }
      if (v13)
      {
        v117 = CFDataGetBytePtr(v13);
        size_t v118 = CFDataGetLength(v13);
        if (!memcmp(v117, __s2, v118)) {
          goto LABEL_218;
        }
        unsigned int v119 = -402620401;
      }
      else
      {
        unsigned int v119 = -402620415;
      }
      unsigned int v173 = v119;
LABEL_218:
      if (!(_BYTE)v166) {
        goto LABEL_236;
      }
      if (BYTE3(v167)) {
        BOOL v120 = 1;
      }
      else {
        BOOL v120 = BYTE2(v167) == 0;
      }
      if ((!v120 || BYTE1(v167)) && !amfi_developer_mode_status()) {
        unsigned int v173 = -402620373;
      }
      if (CEContextQuery() != *MEMORY[0x263F8BAF0] || amfi_developer_mode_status())
      {
LABEL_236:
        if (v173) {
          goto LABEL_163;
        }
        if (HIBYTE(v160))
        {
          unsigned int v173 = sub_20DC1FD78(v13);
          if (v173) {
            goto LABEL_163;
          }
        }
        if (v168)
        {
          v121 = sub_20DBFFB10();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v168;
            _os_log_impl(&dword_20DBFC000, v121, OS_LOG_TYPE_DEFAULT, "%@ was picked for validation", buf, 0xCu);
          }
        }
        if (!v152) {
          goto LABEL_163;
        }
        v124 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v115, v116];
        if (v124)
        {
          v151 = [NSNumber numberWithUnsignedLongLong:v122];
          if (!v151)
          {
            v133 = sub_20DBFFB10();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20DBFC000, v133, OS_LOG_TYPE_ERROR, "Could not create signer type number?", buf, 2u);
            }

            unsigned int v173 = -402620406;
            goto LABEL_282;
          }
          [v124 setObject:v125 forKeyedSubscript:@"SignerType"];
          uint64_t v127 = MEMORY[0x263EFFA88];
          if (v142 == 3) {
            [v124 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"ValidatedByProfile" log];
          }
          else {
            [v124 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"ValidatedByProfile" log];
          }
          if ((_BYTE)v167) {
            [v124 setObject:v128 forKeyedSubscript:@"ValidatedByUniversalProfile"];
          }
          else {
            [v124 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"ValidatedByUniversalProfile"];
          }
          if (BYTE1(v167)) {
            [v124 setObject:v129 forKeyedSubscript:v127];
          }
          else {
            [v124 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"ValidatedByLocalProfile"];
          }
          if (v15) {
            [v124 setObject:v130 forKeyedSubscript:(uint64_t)v15];
          }
          if (v14) {
            [v124 setObject:v130 forKeyedSubscript:v14];
          }
          if (v10) {
            [v124 setObject:v130 forKeyedSubscript:(uint64_t)v10];
          }
          if (v172) {
            [v124 setObject:v130 forKeyedSubscript:(uint64_t)v172];
          }
          if (v9) {
            [v124 setObject:v130 forKeyedSubscript:(uint64_t)v9];
          }
          if (v13)
          {
            [v124 setObject:v130 forKeyedSubscript:v13];
          }
          else
          {
            v134 = sub_20DBFFB10();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20DBFC000, v134, OS_LOG_TYPE_ERROR, "cdHash is NULL after successful validation? (This should not happen.)", buf, 2u);
            }
          }
          if (v168) {
            [v124 setObject:v131 forKeyedSubscript:(uint64_t)v168];
          }
          if (v145) {
            [v124 setObject:v131 forKeyedSubscript:(uint64_t)v145];
          }
          [v124 setObject:v131 forKeyedSubscript:v12];
          int v138 = [v11 v135:v136:v137];
          if (v138 == 7 || v138 == 2) {
            [v124 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IsNativeForPlatform"];
          }
          else {
            [v124 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"IsNativeForPlatform"];
          }
        }
        void *v152 = v124;
LABEL_282:

        goto LABEL_163;
      }
      unsigned int v89 = -402620373;
LABEL_162:
      unsigned int v173 = v89;
      goto LABEL_163;
    }
    if (!v150)
    {
      uint64_t v144 = sub_20DC1E54C(v16, (uint64_t)v10, (int *)&v173);
      if (v173) {
        goto LABEL_163;
      }
      if (v144 != 2)
      {
        if (v144 != 3)
        {
          v132 = sub_20DBFFB10();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v144;
            _os_log_impl(&dword_20DBFC000, v132, OS_LOG_TYPE_DEFAULT, "Not validly signed for app provisioning (type: %ld).", buf, 0xCu);
          }

          unsigned int v89 = -402620392;
          goto LABEL_162;
        }
        uint64_t v111 = 5;
        goto LABEL_206;
      }
    }
    int v143 = v163;
    if (v163 | v147)
    {
      CFTypeRef cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      if (!cf)
      {
        log = sub_20DBFFB10();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20DBFC000, log, OS_LOG_TYPE_ERROR, "Failed to create list of provisioning profiles", buf, 2u);
        }
      }
    }
    v179 = v11;
    uint64_t v180 = 0;
    *(void *)buf = v15;
    *(void *)&buf[8] = v172;
    *(void *)&buf[16] = v171;
    *(void *)&uint8_t buf[24] = v13;
    v177 = v14;
    *(void *)&long long v178 = v9;
    *((void *)&v178 + 1) = v150;
    BYTE9(v178) = v148;
    if (v143) {
      BOOL v107 = 1;
    }
    else {
      BOOL v107 = v147 == 0;
    }
    char v108 = !v107;
    LOBYTE(v180) = v108;
    BYTE1(v180) = v60;
    unsigned int v173 = sub_20DC1E83C((uint64_t)buf, (uint64_t)&v167);
    if (v173) {
      goto LABEL_163;
    }
    if (!v13) {
      CFDataRef v13 = (const __CFData *)sub_20DC01D90(v146);
    }
    if (v143)
    {
      unsigned int v173 = sub_20DC1EEEC(v13, (CFArrayRef)cf, v12, v10, valuePtr, &v168, a1);
      if (v173)
      {
        v109 = sub_20DBFFB10();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v174 = 67109120;
          unsigned int v175 = v173;
          v110 = "validation failed because of failing online authorization (%d)";
LABEL_203:
          _os_log_impl(&dword_20DBFC000, v109, OS_LOG_TYPE_DEFAULT, v110, v174, 8u);
          goto LABEL_204;
        }
        goto LABEL_204;
      }
      int v147 = HIBYTE(v161);
    }
    if (!v147
      || ((unsigned int v112 = sub_20DC1F43C(v13, (const __CFArray *)cf, v161, &v168), v112 == -402620379)
        ? (BOOL v113 = BYTE2(v167) == 0)
        : (BOOL v113 = 1),
          v113 ? (unsigned int v114 = v112) : (unsigned int v114 = 0),
          (unsigned int v173 = v114) == 0))
    {
      uint64_t v111 = 3;
LABEL_206:
      uint64_t v142 = v111;
      goto LABEL_207;
    }
    v109 = sub_20DBFFB10();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v174 = 67109120;
      unsigned int v175 = v173;
      v110 = "validation failed because of missing trust and/or authorization (0x%x)";
      goto LABEL_203;
    }
LABEL_204:

    goto LABEL_163;
  }
  CFIndex v9 = 0;
  uint64_t v10 = 0;
  int v11 = 0;
  CFNumberRef v12 = 0;
  uint64_t v14 = 0;
LABEL_163:
  id v8 = v145;
  CFDictionaryRef v17 = v146;
LABEL_5:
  uint64_t v18 = v8;
  CFDictionaryRef v19 = v17;
  CEReleaseManagedContext();
  if (cf) {
    CFRelease(cf);
  }
  if (v168) {
    CFRelease(v168);
  }
  if (v155) {
    CFRelease(v155);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v172) {
    CFRelease(v172);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v20 = v173;

  return v20;
}

CFTypeRef sub_20DC015DC(CFStringRef filePath, uint64_t a2, int *a3)
{
  CFDictionaryRef v4 = (const __CFDictionary *)a2;
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t valuePtr = 0;
  int v16 = 0;
  if (!a2) {
    goto LABEL_8;
  }
  CFTypeID TypeID = CFNumberGetTypeID();
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v4, @"UniversalFileOffset");
  if (Value)
  {
    CFNumberRef v8 = Value;
    if (CFGetTypeID(Value) != TypeID)
    {
      int v16 = 49174;
      CFNumberRef v12 = sub_20DBFFB10();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = 49174;
      CFDataRef v13 = "error processing kMISValidationOptionUniversalFileOffset (invalid type?), error 0x%x";
      goto LABEL_15;
    }
    CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
    if (valuePtr < 0)
    {
      int v16 = 49174;
      CFNumberRef v12 = sub_20DBFFB10();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = valuePtr;
      CFDataRef v13 = "invalid kMISValidationOptionUniversalFileOffset %lld";
      uint64_t v14 = v12;
      uint32_t v15 = 12;
      goto LABEL_16;
    }
  }
  CFTypeID v9 = CFDataGetTypeID();
  CFDictionaryRef v10 = (const __CFDictionary *)CFDictionaryGetValue(v4, @"DetachedSignature");
  CFDictionaryRef v4 = v10;
  if (v10 && CFGetTypeID(v10) != v9)
  {
    int v16 = 49174;
    CFNumberRef v12 = sub_20DBFFB10();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = 49174;
    CFDataRef v13 = "error processing kMISValidationOptionDetachedSignature (invalid type?), error 0x%x";
LABEL_15:
    uint64_t v14 = v12;
    uint32_t v15 = 8;
LABEL_16:
    _os_log_error_impl(&dword_20DBFC000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_18;
  }
  int v16 = 0;
  a2 = valuePtr;
LABEL_8:
  CFTypeRef result = sub_20DC01890(filePath, a2, (uint64_t)v4, &v16);
  if (result) {
    goto LABEL_19;
  }
  CFNumberRef v12 = sub_20DBFFB10();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v16;
    _os_log_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_DEFAULT, "Could not copy code signature (error 0x%x).", buf, 8u);
  }
LABEL_18:

  CFTypeRef result = 0;
LABEL_19:
  if (a3) {
    *a3 = v16;
  }
  return result;
}

BOOL sub_20DC01840()
{
  uint64_t IsPresent = SecCodeSpecialSlotIsPresent();
  uint64_t v1 = SecCodeSpecialSlotIsPresent();
  return IsPresent != *MEMORY[0x263EFFB40] || v1 == *MEMORY[0x263EFFB40];
}

CFTypeRef sub_20DC01890(CFStringRef filePath, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t valuePtr = a2;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFURLRef v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x263EFFB08], filePath, kCFURLPOSIXPathStyle, 0);
  if (!v8)
  {
    LODWORD(v11) = -402620406;
    if (!a4) {
      return cf;
    }
    goto LABEL_20;
  }
  CFURLRef v9 = v8;
  if (a2)
  {
    values[0] = CFNumberCreate(v7, kCFNumberLongLongType, &valuePtr);
    CFDictionaryRef v10 = CFDictionaryCreate(v7, MEMORY[0x263F171F0], (const void **)values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFRelease(values[0]);
    uint64_t v11 = SecStaticCodeCreateWithPathAndAttributes(v9, 0, v10, (SecStaticCodeRef *)&cf);
    if (v10) {
      CFRelease(v10);
    }
    if (!v11)
    {
LABEL_6:
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v11 = SecStaticCodeCreateWithPathAndAttributes(v8, 0, 0, (SecStaticCodeRef *)&cf);
    if (!v11) {
      goto LABEL_6;
    }
  }
  CFNumberRef v12 = sub_20DBFFB10();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(values[0]) = 67109120;
    HIDWORD(values[0]) = v11;
    _os_log_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_DEFAULT, "Failure creating static code: %d", (uint8_t *)values, 8u);
  }

  LODWORD(v11) = sub_20DBFF11C(v11);
  if (a3)
  {
LABEL_14:
    uint64_t v13 = SecCodeSetDetachedSignature();
    if (v13)
    {
      int v14 = v13;
      LODWORD(v11) = sub_20DBFF11C(v13);
      if (cf)
      {
        uint32_t v15 = sub_20DBFFB10();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(values[0]) = 67109120;
          HIDWORD(values[0]) = v14;
          _os_log_impl(&dword_20DBFC000, v15, OS_LOG_TYPE_DEFAULT, "Failure setting detached signature: %d", (uint8_t *)values, 8u);
        }

        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
  }
LABEL_19:
  CFRelease(v9);
  if (a4) {
LABEL_20:
  }
    *a4 = v11;
  return cf;
}

const void *sub_20DC01AC8(const __CFDictionary *a1, _DWORD *a2)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F17250]);
  CFDictionaryRef v4 = Value;
  if (Value)
  {
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 != CFStringGetTypeID())
    {
      CFDictionaryRef v4 = 0;
      if (!a2) {
        return v4;
      }
      goto LABEL_5;
    }
    CFRetain(v4);
  }
  if (a2) {
LABEL_5:
  }
    *a2 = 0;
  return v4;
}

const void *sub_20DC01B40(void *a1, int *a2)
{
  CFDictionaryRef v3 = a1;
  if (CFDictionaryContainsKey(v3, (const void *)*MEMORY[0x263F17240]) != 1)
  {
    CFTypeID v5 = 0;
    int v6 = -402620388;
    if (!a2) {
      goto LABEL_8;
    }
LABEL_7:
    *a2 = v6;
    goto LABEL_8;
  }
  CFNumberRef Value = CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263F17258]);
  CFTypeID v5 = Value;
  if (Value) {
    CFRetain(Value);
  }
  int v6 = 0;
  if (a2) {
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

const void *sub_20DC01BD4(const __CFDictionary *a1, int *a2)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F17240]);
  CFDictionaryRef v4 = Value;
  if (!Value)
  {
    int v5 = -402620388;
    if (!a2) {
      return v4;
    }
    goto LABEL_3;
  }
  CFRetain(Value);
  int v5 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v5;
  return v4;
}

CFArrayRef sub_20DC01C34(void *a1, int *a2)
{
  int v3 = -402620415;
  CFDictionaryRef v4 = a1;
  if (CFDictionaryContainsKey(v4, (const void *)*MEMORY[0x263F17240]) != 1)
  {
    CFArrayRef Copy = 0;
    int v3 = -402620388;
    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F17208]);
  CFArrayRef Copy = Value;
  if (!Value)
  {
    int v3 = -402620396;
    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 == CFArrayGetTypeID() && CFArrayGetCount(Copy) >= 1)
  {
    CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], Copy);
    int v3 = 0;
    if (!a2) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  CFArrayRef Copy = 0;
  if (a2) {
LABEL_10:
  }
    *a2 = v3;
LABEL_11:

  return Copy;
}

CFDictionaryRef sub_20DC01D24(const __SecCode *a1)
{
  CFDictionaryRef information = 0;
  int v2 = (void *)MEMORY[0x210567610]();
  LODWORD(a1) = SecCodeCopySigningInformation(a1, 0x23u, &information);
  if (a1) {
    CFDictionaryRef v3 = 0;
  }
  else {
    CFDictionaryRef v3 = information;
  }

  return v3;
}

const void *sub_20DC01D90(const __CFDictionary *a1)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F17260]);
  int v2 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v2;
}

const void *sub_20DC01DD0(const __CFDictionary *a1)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F17248]);
  int v2 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v2;
}

unint64_t sub_20DC01E10()
{
  unint64_t result = qword_26AAF6AC0;
  if (!qword_26AAF6AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAF6AC0);
  }
  return result;
}

uint64_t *sub_20DC01E64()
{
  if (qword_26AAF6F80 != -1) {
    swift_once();
  }
  return &qword_26AAF7140;
}

uint64_t sub_20DC01EB0()
{
  return 1;
}

uint64_t type metadata accessor for LaunchWarningClientOperations()
{
  return self;
}

uint64_t type metadata accessor for LaunchWarningMark()
{
  return self;
}

uint64_t sub_20DC01F40()
{
  uint64_t v2 = sub_20DC02000();
  if (!v0)
  {
    unint64_t v4 = v3;
    if (v3 >> 60 == 15)
    {
      return 0;
    }
    else
    {
      uint64_t v5 = v2;
      type metadata accessor for LaunchWarningMark();
      uint64_t v1 = swift_allocObject();
      sub_20DC041E8(v5, v4);
    }
  }
  return v1;
}

uint64_t sub_20DC01FE4@<X0>(const char *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_20DBFE5A8(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_20DC02000()
{
  sub_20DBFEE7C(&qword_26772C7A8);
  uint64_t result = sub_20DC24718();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_20DC02080()
{
  uint64_t v0 = sub_20DC24758();
  sub_20DC026CC(v0, qword_26772D3D8);
  sub_20DC020E4(v0, (uint64_t)qword_26772D3D8);
  return sub_20DC246F8();
}

uint64_t sub_20DC020E4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_20DC0211C(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_26772C8D0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_20DC24758();
  sub_20DC020E4(v5, (uint64_t)qword_26772D3D8);
  int v6 = (void *)sub_20DC24708();
  v9.receiver = v4;
  v9.super_class = v2;
  id v7 = [super initWithDatabaseURL:v6 readOnly:a1 & 1];

  return v7;
}

uint64_t type metadata accessor for UserTrustDB()
{
  return self;
}

uint64_t sub_20DC02414()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_20DC24758();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [v1 sel_dbURL];
  sub_20DC24728();

  sub_20DC24738();
  id v7 = *(void (**)(char *, uint64_t))(v3 + 8);
  v7(v5, v2);
  uint64_t v8 = sub_20DC248C8();
  swift_bridgeObjectRelease();
  sub_20DC24090((const char *)(v8 + 32));
  swift_release();
  id v9 = [v1 sel_shmURL];
  sub_20DC24728();

  sub_20DC24738();
  v7(v5, v2);
  uint64_t v10 = sub_20DC248C8();
  swift_bridgeObjectRelease();
  sub_20DC24090((const char *)(v10 + 32));
  swift_release();
  id v11 = [v1 sel_walURL];
  sub_20DC24728();

  sub_20DC24738();
  v7(v5, v2);
  uint64_t v12 = sub_20DC248C8();
  swift_bridgeObjectRelease();
  sub_20DC24090((const char *)(v12 + 32));
  return swift_release();
}

id sub_20DC02694()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustDB();
  return [super dealloc];
}

uint64_t *sub_20DC026CC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_20DC02730(uint64_t a1, unint64_t a2)
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

uint64_t sub_20DC02788(uint64_t a1, unint64_t a2)
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

uint64_t sub_20DC027E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = 0u;
  uint64_t v6 = v5 + 16;
  *(_OWORD *)(v5 + 32) = 0u;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20DC0C3F4(0xD000000000000046, 0x800000020DC26390, (uint64_t)sub_20DC02FD0, v7, (uint64_t)sub_20DC02FD4, v5);
  swift_release();
  swift_release();
  if (!v2)
  {
    swift_beginAccess();
    uint64_t v6 = *(void *)(v5 + 16);
    sub_20DC030D0(v6, *(void *)(v5 + 24), *(void *)(v5 + 32), *(void *)(v5 + 40));
  }
  swift_release();
  return v6;
}

uint64_t sub_20DC0293C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v14[0] = a2;
  uint64_t v3 = sub_20DC24828();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  sub_20DBFEE7C(&qword_26772C7D8);
  uint64_t v6 = swift_allocBox();
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for UserTrustedProfileEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v11 + v10, (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  swift_retain();
  uint64_t v12 = v14[5];
  sub_20DC0C3F4(0xD0000000000000BFLL, 0x800000020DC263E0, (uint64_t)sub_20DC03120, v11, (uint64_t)sub_20DC03124, v6);
  swift_release();
  if (v12) {
    return swift_release_n();
  }
  swift_release();
  swift_beginAccess();
  sub_20DC03150(v8, v14[0]);
  return swift_release();
}

void sub_20DC02B6C(uint64_t a1)
{
  uint64_t v2 = sub_20DBFEE7C(&qword_26772C7E8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_20DBFEE7C(&qword_26772C7D8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = swift_projectBox();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 192);
  v8(0);
  uint64_t v10 = v9;
  uint64_t v11 = v8(1);
  unint64_t v13 = v12;
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(2);
  uint64_t v16 = v14;
  unint64_t v17 = v15;
  if (v13)
  {
    sub_20DC02788(v14, v15);
    uint64_t v18 = nullsub_1(v11);
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    unint64_t v13 = v23;
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    sub_20DC03558(v18, v20, v22, v13);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v18 = 0;
  uint64_t v20 = 0;
  uint64_t v22 = 0;
  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  sub_20DC24808();
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_20DC24828();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v4, 1, v24) != 1)
  {
    sub_20DC036B4((uint64_t)v4, v18, v20, v22, v13, (uint64_t)v7);
    sub_20DC02730(v16, v17);
    uint64_t v25 = type metadata accessor for UserTrustedProfileEntry();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 0, 1, v25);
    uint64_t v26 = v27;
    swift_beginAccess();
    sub_20DC035A4((uint64_t)v7, v26);
    return;
  }
LABEL_7:
  sub_20DC03558(v18, v20, v22, v13);
  __break(1u);
}

uint64_t sub_20DC02E2C()
{
  return sub_20DC02E78((uint64_t)&unk_26C2498C8, 0xD000000000000026, 0x800000020DC264A0, (uint64_t)sub_20DC031F0);
}

uint64_t sub_20DC02E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = MEMORY[0x263F8EE78];
  uint64_t v9 = v8 + 16;
  swift_retain();
  sub_20DC0C3F4(a2, a3, 0, 0, a4, v8);
  swift_release();
  if (!v4)
  {
    swift_beginAccess();
    uint64_t v9 = *(void *)(v8 + 16);
    swift_bridgeObjectRetain();
  }
  swift_release();
  return v9;
}

uint64_t sub_20DC02F54()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20DC02F8C()
{
  if (v0[3])
  {
    swift_bridgeObjectRelease();
    sub_20DC02730(v0[4], v0[5]);
  }

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_20DC02FD4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)a1 + 192))(0);
  uint64_t v6 = v5;
  (*(void (**)(uint64_t))(*(void *)a1 + 128))(1);
  if (v6)
  {
    uint64_t v7 = nullsub_1(v4);
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    swift_beginAccess();
    uint64_t v14 = v2[2];
    uint64_t v15 = v2[3];
    uint64_t v16 = v2[4];
    unint64_t v17 = v2[5];
    v2[2] = v7;
    v2[3] = v9;
    v2[4] = v11;
    v2[5] = v13;
    sub_20DC03558(v14, v15, v16, v17);
  }
  else
  {
    __break(1u);
  }
}

void sub_20DC030D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_20DC02788(a3, a4);
  }
}

void sub_20DC03124(uint64_t a1)
{
}

uint64_t sub_20DC03150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DC031B8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_20DC031F0(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)a1 + 192))(0);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(v1 + 16);
    uint64_t v5 = sub_20DC248B8();
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v8 = *v4;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v4 = v8;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_20DC03450(0, *(void *)(v8 + 16) + 1, 1, (char *)v8);
      uint64_t v8 = result;
      *uint64_t v4 = result;
    }
    unint64_t v10 = *(void *)(v8 + 16);
    unint64_t v9 = *(void *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      uint64_t result = (uint64_t)sub_20DC03450((char *)(v9 > 1), v10 + 1, 1, (char *)v8);
      uint64_t v8 = result;
      *uint64_t v4 = result;
    }
    *(void *)(v8 + 16) = v10 + 1;
    unint64_t v11 = v8 + 16 * v10;
    *(void *)(v11 + 32) = v5;
    *(void *)(v11 + 40) = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20DC03314()
{
  uint64_t v1 = sub_20DC24828();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_20DC033A4(uint64_t a1)
{
  sub_20DC24828();
  uint64_t v2 = sub_20DC24818();
  (*(void (**)(uint64_t))(*(void *)a1 + 184))(v2);

  return swift_bridgeObjectRelease();
}

char *sub_20DC03450(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_20DBFEE7C(&qword_26772C7E0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_20DC03558(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    sub_20DC02730(a3, a4);
  }
}

uint64_t sub_20DC035A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DC0360C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)a1 + 184))(*(void *)(v1 + 16), *(void *)(v1 + 24), 1);
}

uint64_t type metadata accessor for UserTrustedProfileEntry()
{
  uint64_t result = qword_26772C8D8;
  if (!qword_26772C8D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20DC036B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_20DC24828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a6, a1, v12);
  uint64_t result = type metadata accessor for UserTrustedProfileEntry();
  uint64_t v14 = (void *)(a6 + *(int *)(result + 20));
  *uint64_t v14 = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TrustedTeamIdEntry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrustedTeamIdEntry(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);

  return sub_20DC02730(v2, v3);
}

void *initializeWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_20DC02788(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

void *assignWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  unint64_t v4 = a2[3];
  sub_20DC02788(v5, v4);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_20DC02730(v6, v7);
  return a1;
}

__n128 initializeWithTake for TrustedTeamIdEntry(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for TrustedTeamIdEntry(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_20DC02730(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedTeamIdEntry()
{
  return &type metadata for TrustedTeamIdEntry;
}

uint64_t *sub_20DC03960(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_20DC24828();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    if (v11)
    {
      *uint64_t v9 = *v10;
      v9[1] = v11;
      uint64_t v12 = v10[2];
      unint64_t v13 = v10[3];
      swift_bridgeObjectRetain();
      sub_20DC02788(v12, v13);
      v9[2] = v12;
      v9[3] = v13;
    }
    else
    {
      long long v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
  }
  return a1;
}

uint64_t sub_20DC03A60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DC24828();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (void *)(a1 + *(int *)(a2 + 20));
  uint64_t result = v5[1];
  if (result)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v5[2];
    unint64_t v8 = v5[3];
    return sub_20DC02730(v7, v8);
  }
  return result;
}

uint64_t sub_20DC03AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20DC24828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  unint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  if (v10)
  {
    *unint64_t v8 = *v9;
    v8[1] = v10;
    uint64_t v11 = v9[2];
    unint64_t v12 = v9[3];
    swift_bridgeObjectRetain();
    sub_20DC02788(v11, v12);
    v8[2] = v11;
    v8[3] = v12;
  }
  else
  {
    long long v13 = *((_OWORD *)v9 + 1);
    *(_OWORD *)unint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v13;
  }
  return a1;
}

uint64_t sub_20DC03BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20DC24828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  unint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  uint64_t v11 = v9[1];
  if (v10)
  {
    if (v11)
    {
      *unint64_t v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = v9[2];
      unint64_t v13 = v9[3];
      sub_20DC02788(v12, v13);
      uint64_t v14 = v8[2];
      unint64_t v15 = v8[3];
      v8[2] = v12;
      v8[3] = v13;
      sub_20DC02730(v14, v15);
    }
    else
    {
      sub_20DC03CB4((uint64_t)v8);
      long long v18 = *((_OWORD *)v9 + 1);
      *(_OWORD *)unint64_t v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v18;
    }
  }
  else if (v11)
  {
    *unint64_t v8 = *v9;
    v8[1] = v9[1];
    uint64_t v16 = v9[2];
    unint64_t v17 = v9[3];
    swift_bridgeObjectRetain();
    sub_20DC02788(v16, v17);
    v8[2] = v16;
    v8[3] = v17;
  }
  else
  {
    long long v19 = *((_OWORD *)v9 + 1);
    *(_OWORD *)unint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v19;
  }
  return a1;
}

uint64_t sub_20DC03CB4(uint64_t a1)
{
  return a1;
}

uint64_t sub_20DC03CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20DC24828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  unint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *unint64_t v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t sub_20DC03D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20DC24828();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  if (!*(void *)(a1 + v7 + 8)) {
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10)
  {
    sub_20DC03CB4(v8);
LABEL_5:
    long long v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    return a1;
  }
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v8 + 16);
  unint64_t v12 = *(void *)(v8 + 24);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
  sub_20DC02730(v11, v12);
  return a1;
}

uint64_t sub_20DC03E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20DC03E3C);
}

uint64_t sub_20DC03E3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20DC24828();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_20DC03F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20DC03F20);
}

uint64_t sub_20DC03F20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_20DC24828();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_20DC03FE0()
{
  uint64_t result = sub_20DC24828();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_20DC04074(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_20DC0408C()
{
  return sub_20DC24A78();
}

uint64_t sub_20DC040D4()
{
  return sub_20DC24A68();
}

uint64_t sub_20DC04100()
{
  return sub_20DC24A78();
}

uint64_t sub_20DC04154(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t sub_20DC04190(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_20DC041E8(a1, a2);
  return v4;
}

uint64_t sub_20DC041E8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = a2 >> 62;
  char v5 = 1;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      if (!v8)
      {
        char v5 = 1;
LABEL_22:
        sub_20DC0448C();
        swift_allocError();
        *uint64_t v26 = v5;
        swift_willThrow();
        sub_20DC02730(a1, a2);
        type metadata accessor for LaunchWarningMark();
        swift_deallocPartialClassInstance();
        return v3;
      }
      if (sub_20DC247C8() != 1)
      {
        char v5 = 0;
        goto LABEL_22;
      }
      if (v4)
      {
        if (v4 == 1)
        {
          LODWORD(v12) = HIDWORD(a1) - a1;
          if (!__OFSUB__(HIDWORD(a1), a1))
          {
            uint64_t v12 = (int)v12;
            goto LABEL_16;
          }
          goto LABEL_31;
        }
        uint64_t v14 = *(void *)(a1 + 16);
        uint64_t v13 = *(void *)(a1 + 24);
        BOOL v11 = __OFSUB__(v13, v14);
        uint64_t v12 = v13 - v14;
        if (v11)
        {
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          sub_20DC246A8();
          __break(1u);
LABEL_37:
          sub_20DC246A8();
          __break(1u);
          JUMPOUT(0x20DC0446CLL);
        }
      }
      else
      {
        uint64_t v12 = BYTE6(a2);
      }
LABEL_16:
      char v5 = 1;
      if (v12 != 9) {
        goto LABEL_22;
      }
      *(unsigned char *)(v3 + 16) = 1;
      uint64_t v15 = sub_20DC044E0(1, 8, a1, a2);
      uint64_t v17 = sub_20DC04564(v15, v16);
      uint64_t v18 = v17;
      unint64_t v20 = v19;
      uint64_t v21 = v17;
      switch(v19 >> 62)
      {
        case 1uLL:
          if ((int)v17 > v17 >> 32) {
            goto LABEL_33;
          }
          uint64_t v22 = sub_20DC24688();
          if (!v22) {
            goto LABEL_37;
          }
          uint64_t v23 = v22;
          uint64_t v24 = sub_20DC246B8();
          uint64_t v25 = (int)v18 - v24;
          if (__OFSUB__((int)v18, v24)) {
            goto LABEL_35;
          }
          sub_20DC246A8();
          uint64_t v21 = *(void *)(v23 + v25);
LABEL_28:
          sub_20DC02730(v18, v20);
          sub_20DC02730(a1, a2);
          *(void *)(v3 + 24) = v21;
          break;
        case 2uLL:
          uint64_t v28 = *(void *)(v17 + 16);
          swift_retain();
          swift_retain();
          uint64_t v29 = sub_20DC24688();
          if (!v29) {
            goto LABEL_36;
          }
          uint64_t v30 = v29;
          uint64_t v31 = sub_20DC246B8();
          BOOL v11 = __OFSUB__(v28, v31);
          uint64_t v32 = v28 - v31;
          if (v11) {
            goto LABEL_34;
          }
          sub_20DC246A8();
          uint64_t v21 = *(void *)(v30 + v32);
          swift_release();
          swift_release();
          goto LABEL_28;
        case 3uLL:
          uint64_t v21 = 0;
          goto LABEL_28;
        default:
          goto LABEL_28;
      }
      return v3;
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_30;
    case 3uLL:
      goto LABEL_22;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_20DC0448C()
{
  unint64_t result = qword_26772C7F0;
  if (!qword_26772C7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C7F0);
  }
  return result;
}

uint64_t sub_20DC044E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)a3;
      uint64_t v4 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a3 + 16);
      uint64_t v4 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = 0;
      uint64_t v4 = BYTE6(a4);
      break;
  }
  if (v5 > a2)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v4 <= a2)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (a2 + 1 < a1)
  {
LABEL_11:
    __break(1u);
    JUMPOUT(0x20DC04554);
  }
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_20DC04564(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F78];
  v28[4] = MEMORY[0x263F06F68];
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v4 = sub_20DC04CB4(v28, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_20DC02788(a1, a2);
      sub_20DC02788(v5, v6);
      uint64_t v8 = (unsigned char *)sub_20DC24688();
      if (v8)
      {
        uint64_t v9 = sub_20DC246B8();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_20DC246A8();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      sub_20DC04C3C(v8, v13, &v27);
      sub_20DC02730(v5, v6);
LABEL_27:
      sub_20DC02730(a1, a2);
      uint64_t v24 = v27;
      sub_20DC04CF8((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_20DC02788(a1, a2);
      swift_retain();
      swift_retain();
      unint64_t v16 = (unsigned char *)sub_20DC24688();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_20DC246B8();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_20DC246A8();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      sub_20DC04C3C(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_20DC02788(a1, a2);
      uint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_20DC02788(a1, a2);
      uint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_20DC04C3C(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_20DC04818(uint64_t a1, uint64_t a2)
{
  v8[3] = MEMORY[0x263F8D3E8];
  v8[4] = MEMORY[0x263F07B80];
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = sub_20DC04CB4(v8, MEMORY[0x263F8D3E8]);
  uint64_t v3 = (unsigned char *)*v2;
  if (*v2 && (uint64_t v4 = (unsigned char *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_20DC04D48(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_20DC04E0C((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      uint64_t v6 = sub_20DC04E88((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_20DC04CF8((uint64_t)v8);
  return v6;
}

uint64_t sub_20DC048D4()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  long long v6 = xmmword_20DC282F0;
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v1 = sub_20DC04818((uint64_t)&v5, (uint64_t)&v6);
  unint64_t v3 = v2;
  sub_20DC247B8();
  sub_20DC02730(v1, v3);
  return v6;
}

uint64_t sub_20DC04978()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 112))();
  if (!v1)
  {
    uint64_t v4 = result;
    unint64_t v5 = v3;
    sub_20DC094A0();
    return sub_20DC02730(v4, v5);
  }
  return result;
}

uint64_t sub_20DC04A1C()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

unint64_t sub_20DC04A30()
{
  unint64_t result = qword_26772C7F8;
  if (!qword_26772C7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C7F8);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for LaunchWarningMarkError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningMarkError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LaunchWarningMarkError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x20DC04BF0);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_20DC04C18(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_20DC04C20(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningMarkError()
{
  return &type metadata for LaunchWarningMarkError;
}

unsigned char *sub_20DC04C3C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
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
    unint64_t result = (unsigned char *)sub_20DC04D48(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_20DC04E0C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_20DC04E88((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_20DC04CB4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_20DC04CF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_20DC04D48(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_20DC04E0C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_20DC246C8();
  swift_allocObject();
  uint64_t result = sub_20DC24678();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_20DC24778();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_20DC04E88(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_20DC246C8();
  swift_allocObject();
  uint64_t result = sub_20DC24678();
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

uint64_t sub_20DC04F0C()
{
  sub_20DC05078();
  uint64_t result = sub_20DC24948();
  qword_26772D3F0 = result;
  return result;
}

uint64_t *sub_20DC04F74()
{
  if (qword_26772CA70 != -1) {
    swift_once();
  }
  return &qword_26772D3F0;
}

uint64_t sub_20DC04FC0()
{
  sub_20DC05078();
  uint64_t result = sub_20DC24948();
  qword_26AAF7140 = result;
  return result;
}

uint64_t sub_20DC05034()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_20DC05044()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for Logger()
{
  return self;
}

unint64_t sub_20DC05078()
{
  unint64_t result = qword_26AAF6AC8;
  if (!qword_26AAF6AC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AAF6AC8);
  }
  return result;
}

uint64_t sub_20DC050B8(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0;
  }
}

void *sub_20DC050D0@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_20DC050F0(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_20DC050FC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_20DC05108(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_20DC05110@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_20DC05124@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_20DC05138@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_20DC0514C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_20DC0517C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_20DC051A8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_20DC051CC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_20DC051E0(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_20DC051F4(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_20DC05208@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_20DC0521C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_20DC05230(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_20DC05244(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_20DC05258()
{
  return *v0 == 0;
}

uint64_t sub_20DC05268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_20DC05280(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_20DC05294@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_20DC052A4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_20DC052B0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20DC052C4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_20DC065D8(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t type metadata accessor for LaunchWarningDetails()
{
  uint64_t result = qword_26772C8C0;
  if (!qword_26772C8C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20DC05350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C798);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DC053B8@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(_DWORD *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 16) = a3;
  char v12 = a5 & 1;
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v14 = a8 + v13[6];
  uint64_t v15 = sub_20DC247F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a4, v15);
  *(unsigned char *)(a8 + v13[7]) = v12;
  *(void *)(a8 + v13[8]) = a6;
  uint64_t v16 = a8 + v13[9];

  return sub_20DC05484(a7, v16);
}

uint64_t sub_20DC05484(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C798);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_20DC054F0()
{
  unint64_t result = qword_26772C800;
  if (!qword_26772C800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C800);
  }
  return result;
}

unint64_t sub_20DC05548()
{
  unint64_t result = qword_26772C808;
  if (!qword_26772C808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C808);
  }
  return result;
}

unint64_t sub_20DC055A0()
{
  unint64_t result = qword_26772C810;
  if (!qword_26772C810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C810);
  }
  return result;
}

unint64_t sub_20DC055F8()
{
  unint64_t result = qword_26772C818;
  if (!qword_26772C818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C818);
  }
  return result;
}

unint64_t sub_20DC05650()
{
  unint64_t result = qword_26772C820;
  if (!qword_26772C820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C820);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LaunchWarningReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x20DC05770);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningReason()
{
  return &type metadata for LaunchWarningReason;
}

ValueMetadata *type metadata accessor for LaunchWarningFlags()
{
  return &type metadata for LaunchWarningFlags;
}

void *sub_20DC057B8(_DWORD *a1, void *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[1];
    unint64_t v8 = a2[2];
    sub_20DC02788(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_20DC247F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[8];
    *((unsigned char *)v4 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *(void *)((char *)v4 + v13) = *(void *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_20DC24758();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_20DBFEE7C(&qword_26772C798);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t sub_20DC05994(uint64_t a1, uint64_t a2)
{
  sub_20DC02730(*(void *)(a1 + 8), *(void *)(a1 + 16));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_20DC247F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  uint64_t v7 = sub_20DC24758();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

uint64_t sub_20DC05AB4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_20DC02788(v6, v7);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_20DC247F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_20DC24758();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_20DC05C40(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_20DC02788(v6, v7);
  uint64_t v8 = *(void *)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  sub_20DC02730(v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_20DC247F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = sub_20DC24758();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_20DC05E3C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_20DC247F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[9];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_20DC24758();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_20DC05FBC(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_20DC02730(v6, v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_20DC247F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = sub_20DC24758();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v10)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t sub_20DC061AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20DC061C0);
}

uint64_t sub_20DC061C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_20DC247F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[6];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 254)
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + a3[7]);
    if (v12 >= 2) {
      return v12 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v13 = sub_20DBFEE7C(&qword_26772C798);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[9];
    return v14(v16, a2, v15);
  }
}

uint64_t sub_20DC062EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20DC06300);
}

uint64_t sub_20DC06300(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_20DC247F8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[6];
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[7]) = a2 + 1;
  }
  else
  {
    uint64_t v13 = sub_20DBFEE7C(&qword_26772C798);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[9];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_20DC06430()
{
  sub_20DC247F8();
  if (v0 <= 0x3F)
  {
    sub_20DC06528();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_20DC06528()
{
  if (!qword_26772C7A0)
  {
    sub_20DC24758();
    unint64_t v0 = sub_20DC24958();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26772C7A0);
    }
  }
}

void type metadata accessor for SecCSDigestAlgorithm()
{
  if (!qword_26772C828)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26772C828);
    }
  }
}

uint64_t sub_20DC065D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_20DC06614()
{
  uint64_t v0 = sub_20DC24758();
  sub_20DC026CC(v0, qword_26772D3F8);
  sub_20DC020E4(v0, (uint64_t)qword_26772D3F8);
  return sub_20DC246F8();
}

id sub_20DC06678(char a1)
{
  char v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_26772CE80 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_20DC24758();
  sub_20DC020E4(v5, (uint64_t)qword_26772D3F8);
  uint64_t v6 = (void *)sub_20DC24708();
  v9.receiver = v4;
  v9.super_class = v2;
  id v7 = [super initWithDatabaseURL:v6 readOnly:a1 & 1];

  return v7;
}

uint64_t type metadata accessor for LaunchWarningDB()
{
  return self;
}

id sub_20DC06970()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for LaunchWarningDB();
  id v1 = [super setupSchema];
  if (v1)
  {
    id v2 = [v0 readSetting:@"databaseSchemaVersion"];
    if (v2)
    {
      int v3 = v2;
      uint64_t v4 = sub_20DC248A8();
      unint64_t v6 = v5;
    }
    else
    {
      id v7 = (void *)sub_20DC24878();
      [v0 executeQuery:v7];

      uint64_t v8 = @"databaseSchemaVersion";
      uint64_t v4 = 49;
      unint64_t v6 = 0xE100000000000000;
      objc_super v9 = (void *)sub_20DC24878();
      [v0 setSetting:v8 toValue:v9];
    }
    if (v4 == 49 && v6 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = sub_20DC249E8();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0) {
        return v1;
      }
    }
    unsigned int v12 = (void *)sub_20DC24878();
    [v0 executeQuery:v12 withBind:0 withResults:0];

    uint64_t v13 = @"databaseSchemaVersion";
    uint64_t v14 = (void *)sub_20DC24878();
    [v0 setSetting:v13 toValue:v14];
  }
  return v1;
}

id sub_20DC06CE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningDB();
  return [super dealloc];
}

uint64_t sub_20DC06D18()
{
  return sub_20DC24A78();
}

uint64_t sub_20DC06D5C()
{
  return sub_20DC24A68();
}

uint64_t sub_20DC06D84()
{
  return sub_20DC24A78();
}

uint64_t sub_20DC06DC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  sub_20DBFEE7C(&qword_26772C798);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v5 = &v36[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v3);
  id v7 = &v36[-v6];
  uint64_t v8 = sub_20DC247F8();
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  char v11 = &v36[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v36[-v12];
  uint64_t v14 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 160);
  unint64_t v15 = v14(0);
  uint64_t v40 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(1);
  unint64_t v41 = v16;
  uint64_t v17 = v14(2);
  uint64_t v18 = v14(3);
  (*(void (**)(uint64_t))(*(void *)a1 + 144))(4);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192))(5);
  if ((v15 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(v15))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v21 = v20;
  char v22 = sub_20DC050B8(v17);
  if (v22 == 2)
  {
    swift_bridgeObjectRelease();
    sub_20DC24928();
    uint64_t v23 = (void *)*sub_20DC04F74();
    sub_20DBFEE7C(qword_26AAF6AD0);
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = MEMORY[0x263F8E5C0];
    *(_OWORD *)(v24 + 16) = xmmword_20DC286F0;
    uint64_t v26 = MEMORY[0x263F8E620];
    *(void *)(v24 + 56) = v25;
    *(void *)(v24 + 64) = v26;
    *(void *)(v24 + 32) = v17;
    id v27 = v23;
    sub_20DC24838();

    swift_bridgeObjectRelease();
    uint64_t v44 = v17;
    uint64_t v28 = sub_20DC249D8();
    uint64_t v30 = v29;
    sub_20DC07240();
    swift_allocError();
    *(_OWORD *)uint64_t v31 = xmmword_20DC28700;
    *(void *)(v31 + 16) = v28;
    *(void *)(v31 + 24) = v30;
    *(unsigned char *)(v31 + 32) = 1;
    swift_willThrow();
    sub_20DC02730(v40, v41);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v42 + 8))(v13, v43);
  }
  else
  {
    uint64_t v38 = v18;
    int v37 = v22 & 1;
    uint64_t v32 = sub_20DC24758();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v7, 1, 1, v32);
    if (v21)
    {
      sub_20DC24748();
      swift_bridgeObjectRelease();
      sub_20DC086A0((uint64_t)v7, &qword_26772C798);
      sub_20DC05484((uint64_t)v5, (uint64_t)v7);
    }
    uint64_t v34 = v42;
    uint64_t v33 = v43;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v42 + 16))(v11, v13, v43);
    uint64_t v35 = nullsub_1(v38);
    sub_20DC07294((uint64_t)v7, (uint64_t)v5, &qword_26772C798);
    sub_20DC053B8(v15, v40, v41, (uint64_t)v11, v37, v35, (uint64_t)v5, v39);
    sub_20DC086A0((uint64_t)v7, &qword_26772C798);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v34 + 8))(v13, v33);
  }
}

unint64_t sub_20DC07240()
{
  unint64_t result = qword_26772C830;
  if (!qword_26772C830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C830);
  }
  return result;
}

uint64_t sub_20DC07294(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_20DBFEE7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20DC072F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_20DBFEE7C(&qword_26772C7B0);
  uint64_t v5 = swift_allocBox();
  uint64_t v7 = v6;
  uint64_t v8 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_20DC24998();
  sub_20DC248E8();
  sub_20DC248E8();
  sub_20DC248E8();
  swift_retain();
  swift_retain();
  sub_20DC0C3F4(0, 0xE000000000000000, (uint64_t)sub_20DC074DC, a1, (uint64_t)sub_20DC07728, v5);
  swift_bridgeObjectRelease();
  swift_release();
  if (v2) {
    return swift_release_n();
  }
  swift_release();
  swift_beginAccess();
  sub_20DC07294(v7, a2, &qword_26772C7B0);
  return swift_release();
}

uint64_t sub_20DC074DC(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 24);
  if ((result & 0x8000000000000000) == 0) {
    return (*(uint64_t (**)(void))(*(void *)a1 + 152))();
  }
  __break(1u);
  return result;
}

uint64_t sub_20DC07534(uint64_t a1)
{
  uint64_t v3 = sub_20DBFEE7C(&qword_26772C7B0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for LaunchWarningDetails();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_projectBox();
  uint64_t result = sub_20DC06DC4(a1, (uint64_t)v8);
  if (!v1)
  {
    char v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(6);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160))(7);
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v12 = result;
      uint64_t v13 = _s18LaunchWarningEntryVMa();
      sub_20DC07744((uint64_t)v8, (uint64_t)v5 + *(int *)(v13 + 20), (uint64_t (*)(void))type metadata accessor for LaunchWarningDetails);
      *uint64_t v5 = v12;
      *((unsigned char *)v5 + *(int *)(v13 + 24)) = v11 & 1;
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 0, 1, v13);
      swift_beginAccess();
      return sub_20DC086FC((uint64_t)v5, v9);
    }
  }
  return result;
}

uint64_t sub_20DC07728(uint64_t a1)
{
  return sub_20DC07534(a1);
}

uint64_t sub_20DC07744(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_20DC077B0()
{
  unint64_t result = qword_26772C838;
  if (!qword_26772C838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C838);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningDBError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for LaunchWarningDBError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x20DC078F4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_20DC0791C()
{
  return 0;
}

ValueMetadata *type metadata accessor for LaunchWarningDBError()
{
  return &type metadata for LaunchWarningDBError;
}

void *sub_20DC07934(void *a1, void *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    *(_DWORD *)((char *)a1 + v7) = *(_DWORD *)((char *)a2 + v7);
    uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
    unint64_t v11 = *(void *)((char *)a2 + v7 + 16);
    sub_20DC02788(v10, v11);
    *((void *)v8 + 1) = v10;
    *((void *)v8 + 2) = v11;
    uint64_t v12 = (int *)type metadata accessor for LaunchWarningDetails();
    uint64_t v13 = v12[6];
    uint64_t v14 = &v8[v13];
    unint64_t v15 = &v9[v13];
    uint64_t v16 = sub_20DC247F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    v8[v12[7]] = v9[v12[7]];
    *(void *)&v8[v12[8]] = *(void *)&v9[v12[8]];
    uint64_t v17 = v12[9];
    uint64_t v18 = &v8[v17];
    int v19 = &v9[v17];
    uint64_t v20 = sub_20DC24758();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = sub_20DBFEE7C(&qword_26772C798);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_20DC07B48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  sub_20DC02730(*(void *)(v2 + 8), *(void *)(v2 + 16));
  uint64_t v3 = type metadata accessor for LaunchWarningDetails();
  uint64_t v4 = v2 + *(int *)(v3 + 24);
  uint64_t v5 = sub_20DC247F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v2 + *(int *)(v3 + 36);
  uint64_t v7 = sub_20DC24758();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

void *sub_20DC07C70(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_20DC02788(v9, v10);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  unint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_20DC247F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = sub_20DC24758();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_20DC07E34(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_20DC02788(v9, v10);
  uint64_t v11 = *((void *)v7 + 1);
  unint64_t v12 = *((void *)v7 + 2);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  sub_20DC02730(v11, v12);
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v14 = v13[6];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_20DC247F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  v7[v13[7]] = v8[v13[7]];
  *(void *)&v7[v13[8]] = *(void *)&v8[v13[8]];
  uint64_t v18 = v13[9];
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  uint64_t v21 = sub_20DC24758();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v7) = v23(v19, 1, v21);
  int v24 = v23(v20, 1, v21);
  if (!v7)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    uint64_t v25 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_20DC08064(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)((char *)a2 + v6 + 8);
  uint64_t v9 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  unint64_t v12 = &v8[v10];
  uint64_t v13 = sub_20DC247F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  v7[v9[7]] = v8[v9[7]];
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  uint64_t v14 = v9[9];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = sub_20DC24758();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_20DC0821C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a1 + v6 + 8);
  unint64_t v10 = *((void *)v7 + 2);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v8 + 8);
  sub_20DC02730(v9, v10);
  uint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails();
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_20DC247F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = sub_20DC24758();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v7) = v21(v17, 1, v19);
  int v22 = v21(v18, 1, v19);
  if (!v7)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    uint64_t v23 = sub_20DBFEE7C(&qword_26772C798);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_20DC08440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20DC08454);
}

uint64_t sub_20DC08454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchWarningDetails();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 2) {
      return ((v12 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_20DC08528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20DC0853C);
}

uint64_t sub_20DC0853C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for LaunchWarningDetails();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
  return result;
}

uint64_t sub_20DC085FC()
{
  uint64_t result = type metadata accessor for LaunchWarningDetails();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20DC086A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_20DBFEE7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20DC086FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C7B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DC08764()
{
  staticCode[1] = *(SecStaticCodeRef *)MEMORY[0x263EF8340];
  staticCode[0] = 0;
  CFURLRef v0 = (const __CFURL *)sub_20DC24708();
  OSStatus v1 = SecStaticCodeCreateWithPath(v0, 0, staticCode);

  if (v1 || !staticCode[0])
  {
    sub_20DC24928();
    uint64_t v10 = (void *)*sub_20DC01E64();
    sub_20DBFEE7C(qword_26AAF6AD0);
    uint64_t v11 = swift_allocObject();
    uint64_t v12 = MEMORY[0x263F8E548];
    *(_OWORD *)(v11 + 16) = xmmword_20DC28820;
    uint64_t v13 = MEMORY[0x263F8E5B0];
    *(void *)(v11 + 56) = v12;
    *(void *)(v11 + 64) = v13;
    *(_DWORD *)(v11 + 32) = v1;
    uint64_t v14 = v10;
    uint64_t v15 = sub_20DC24738();
    uint64_t v17 = v16;
    *(void *)(v11 + 96) = MEMORY[0x263F8D310];
    *(void *)(v11 + 104) = sub_20DC01E10();
    *(void *)(v11 + 72) = v15;
    *(void *)(v11 + 80) = v17;
    sub_20DC24838();

    swift_bridgeObjectRelease();
    sub_20DC08E14();
    swift_allocError();
    *(_DWORD *)uint64_t v18 = v1;
    *(unsigned char *)(v18 + 4) = 0;
    swift_willThrow();
LABEL_28:

    return v14;
  }
  CFDictionaryRef information = 0;
  uint64_t v2 = staticCode[0];
  OSStatus v3 = SecCodeCopySigningInformation(v2, 0x21u, &information);
  if (v3 || (CFDictionaryRef v4 = information) == 0)
  {
    sub_20DC24928();
    uint64_t v19 = (void *)*sub_20DC01E64();
    sub_20DBFEE7C(qword_26AAF6AD0);
    uint64_t v14 = swift_allocObject();
    uint64_t v20 = MEMORY[0x263F8E548];
    *(_OWORD *)(v14 + 16) = xmmword_20DC28820;
    uint64_t v21 = MEMORY[0x263F8E5B0];
    *(void *)(v14 + 56) = v20;
    *(void *)(v14 + 64) = v21;
    *(_DWORD *)(v14 + 32) = v3;
    id v22 = v19;
    uint64_t v23 = sub_20DC24738();
    uint64_t v25 = v24;
    *(void *)(v14 + 96) = MEMORY[0x263F8D310];
    *(void *)(v14 + 104) = sub_20DC01E10();
    *(void *)(v14 + 72) = v23;
    *(void *)(v14 + 80) = v25;
    sub_20DC24838();

    swift_bridgeObjectRelease();
    sub_20DC08E14();
    swift_allocError();
    *(_DWORD *)uint64_t v26 = v3;
    *(unsigned char *)(v26 + 4) = 0;
    swift_willThrow();
LABEL_27:

    goto LABEL_28;
  }
  *(void *)&long long v42 = *MEMORY[0x263F17200];
  id v5 = (id)v42;
  CFDictionaryRef v6 = v4;
  id v7 = v5;
  CFDictionaryRef v8 = v6;
  sub_20DBFEE7C(&qword_26772C7C8);
  id v9 = [(__CFDictionary *)v8 __swift_objectForKeyedSubscript:sub_20DC249F8()];
  swift_unknownObjectRelease();
  if (v9)
  {
    sub_20DC24968();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }
  sub_20DC08E68((uint64_t)&v42, (uint64_t)v44);
  if (!v45)
  {

    sub_20DC08ED0((uint64_t)v44);
LABEL_16:
    sub_20DC24928();
    uint64_t v28 = (void *)*sub_20DC01E64();
    sub_20DBFEE7C(qword_26AAF6AD0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_20DC286F0;
    id v29 = v28;
    uint64_t v30 = sub_20DC24738();
    uint64_t v32 = v31;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 64) = sub_20DC01E10();
    *(void *)(v14 + 32) = v30;
    *(void *)(v14 + 40) = v32;
LABEL_26:
    sub_20DC24838();

    swift_bridgeObjectRelease();
    sub_20DC08E14();
    swift_allocError();
    *(_DWORD *)uint64_t v39 = 0;
    *(unsigned char *)(v39 + 4) = 1;
    swift_willThrow();

    goto LABEL_27;
  }
  sub_20DBFEE7C(&qword_26772C7B8);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_16;
  }

  id v27 = (id)*MEMORY[0x263F17210];
  if ([(__CFDictionary *)v8 __swift_objectForKeyedSubscript:v27])
  {
    sub_20DC24968();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }
  sub_20DC08E68((uint64_t)&v42, (uint64_t)v44);
  if (!v45)
  {

    swift_bridgeObjectRelease();
    sub_20DC08ED0((uint64_t)v44);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v14 = v41;

  if (!*(void *)(v41 + 16) || (unint64_t v33 = sub_20DC08F30(v41), (v34 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_20DC24928();
    uint64_t v35 = (void *)*sub_20DC01E64();
    sub_20DBFEE7C(qword_26AAF6AD0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_20DC286F0;
    id v29 = v35;
    uint64_t v36 = sub_20DC24738();
    uint64_t v38 = v37;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 64) = sub_20DC01E10();
    *(void *)(v14 + 32) = v36;
    *(void *)(v14 + 40) = v38;
    goto LABEL_26;
  }
  sub_20DC02788(*(void *)(*(void *)(v41 + 56) + 16 * v33), *(void *)(*(void *)(v41 + 56) + 16 * v33 + 8));

  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_20DC08E14()
{
  unint64_t result = qword_26772C840;
  if (!qword_26772C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C840);
  }
  return result;
}

uint64_t sub_20DC08E68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C7D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DC08ED0(uint64_t a1)
{
  uint64_t v2 = sub_20DBFEE7C(&qword_26772C7D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20DC08F30(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x2105669E0](*(void *)(v1 + 40), a1, 4);

  return sub_20DC09234(a1, v3);
}

uint64_t initializeBufferWithCopyOfBuffer for CodeSignatureError(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeSignatureError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CodeSignatureError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_20DC08FD8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_20DC08FF4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CodeSignatureError()
{
  return &type metadata for CodeSignatureError;
}

uint64_t destroy for CDHashInfo(uint64_t a1)
{
  return sub_20DC02730(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s3mis10CDHashInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_20DC02788(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_20DC02788(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_20DC02730(v5, v6);
  return a1;
}

__n128 initializeWithTake for CDHashInfo(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_20DC02730(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CDHashInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CDHashInfo(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CDHashInfo()
{
  return &type metadata for CDHashInfo;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_20DC091EC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_20DC09234(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

id sub_20DC092D0()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserTrustDB();
  id v1 = [super setupSchema];
  if (v1)
  {
    id v2 = [v0 readSetting:@"databaseSchemaVersion"];
    if (!v2)
    {
      unsigned int v3 = (void *)sub_20DC24878();
      [v0 executeQuery:v3];

      uint64_t v4 = (void *)sub_20DC24878();
      [v0 executeQuery:v4 withBind:0 withResults:0];

      uint64_t v5 = @"databaseSchemaVersion";
      id v2 = (id)sub_20DC24878();
      [v0 setSetting:v5 toValue:v2];
    }
  }
  return v1;
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_26AAF6F70)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26AAF6F70);
    }
  }
}

uint64_t sub_20DC094A0()
{
  return sub_20DC24718();
}

uint64_t sub_20DC094EC(const char *a1, uint64_t a2, unint64_t a3)
{
  value[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_20DC24658();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v31 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v30 = v6;
      if ((int)a2 > a2 >> 32)
      {
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      sub_20DC02788(a2, a3);
      uint64_t v11 = (char *)sub_20DC24688();
      if (v11)
      {
        uint64_t v12 = sub_20DC246B8();
        if (__OFSUB__((int)a2, v12))
        {
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
        }
        v11 += (int)a2 - v12;
      }
      sub_20DC246A8();
      if (__OFSUB__(HIDWORD(a2), a2))
      {
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
      uint64_t v13 = sub_20DC248C8();
      int v14 = setxattr(a1, (const char *)(v13 + 32), v11, HIDWORD(a2) - (int)a2, 0, 0);
      swift_release();
      uint64_t result = sub_20DC02730(a2, a3);
      uint64_t v6 = v30;
      if (v14 < 0)
      {
LABEL_18:
        int v26 = MEMORY[0x2105667F0](result);
        uint64_t v27 = sub_20DC24848();
        if ((v27 & 0x100000000) != 0)
        {
          sub_20DC0A13C();
          swift_allocError();
          _DWORD *v29 = v26;
        }
        else
        {
          LODWORD(value[0]) = v27;
          sub_20DC09CF4(MEMORY[0x263F8EE78]);
          sub_20DC0A190(&qword_26772C870, MEMORY[0x263F06080]);
          uint64_t v28 = v31;
          sub_20DC246D8();
          sub_20DC24648();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v28, v6);
        }
        return swift_willThrow();
      }
      return result;
    case 2uLL:
      uint64_t v30 = v7;
      uint64_t v16 = v6;
      uint64_t v17 = *(void *)(a2 + 16);
      swift_retain();
      swift_retain();
      uint64_t v18 = (char *)sub_20DC24688();
      if (!v18) {
        goto LABEL_13;
      }
      uint64_t v19 = sub_20DC246B8();
      if (__OFSUB__(v17, v19)) {
        goto LABEL_27;
      }
      v18 += v17 - v19;
LABEL_13:
      uint64_t v6 = v16;
      sub_20DC246A8();
      uint64_t v21 = *(void *)(a2 + 16);
      uint64_t v20 = *(void *)(a2 + 24);
      size_t v22 = v20 - v21;
      uint64_t v7 = v30;
      if (__OFSUB__(v20, v21)) {
        goto LABEL_24;
      }
      uint64_t v23 = sub_20DC248C8();
      int v10 = setxattr(a1, (const char *)(v23 + 32), v18, v22, 0, 0);
      swift_release();
      swift_release();
LABEL_15:
      uint64_t result = swift_release();
      if (v10 < 0) {
        goto LABEL_18;
      }
      return result;
    case 3uLL:
      memset(value, 0, 14);
      uint64_t v24 = sub_20DC248C8();
      int v25 = setxattr(a1, (const char *)(v24 + 32), value, 0, 0, 0);
      uint64_t result = swift_release();
      if (v25 < 0) {
        goto LABEL_18;
      }
      return result;
    default:
      value[0] = a2;
      LOWORD(value[1]) = a3;
      BYTE2(value[1]) = BYTE2(a3);
      BYTE3(value[1]) = BYTE3(a3);
      BYTE4(value[1]) = BYTE4(a3);
      BYTE5(value[1]) = BYTE5(a3);
      uint64_t v9 = sub_20DC248C8();
      int v10 = setxattr(a1, (const char *)(v9 + 32), value, BYTE6(a3), 0, 0);
      goto LABEL_15;
  }
}

uint64_t sub_20DC09940(uint64_t a1, uint64_t a2)
{
  return sub_20DC09A38(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_20DC09958()
{
  sub_20DC248A8();
  sub_20DC248D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_20DC099AC()
{
  sub_20DC248A8();
  sub_20DC24A58();
  sub_20DC248D8();
  uint64_t v0 = sub_20DC24A78();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20DC09A20(uint64_t a1, uint64_t a2)
{
  return sub_20DC09A38(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_20DC09A38(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_20DC248A8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20DC09A7C(uint64_t a1, id *a2)
{
  uint64_t result = sub_20DC24888();
  *a2 = 0;
  return result;
}

uint64_t sub_20DC09AF4@<X0>(uint64_t *a1@<X8>)
{
  sub_20DC248A8();
  uint64_t v2 = sub_20DC24878();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20DC09B38()
{
  uint64_t v0 = sub_20DC248A8();
  uint64_t v2 = v1;
  if (v0 == sub_20DC248A8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_20DC249E8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_20DC09BC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_20DC24878();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20DC09C0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20DC248A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20DC09C38(uint64_t a1)
{
  uint64_t v2 = sub_20DC0A190(&qword_26772C848, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_20DC0A190(&qword_26772C860, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_20DC09CF4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_20DBFEE7C(&qword_26772C878);
  uint64_t v2 = sub_20DC249B8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20DC0A1D8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_20DC09E20(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_20DC0A240(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_20DC09E20(uint64_t a1, uint64_t a2)
{
  sub_20DC24A58();
  sub_20DC248D8();
  uint64_t v4 = sub_20DC24A78();

  return sub_20DC09E98(a1, a2, v4);
}

unint64_t sub_20DC09E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_20DC249E8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_20DC249E8() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_20DC249E8()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_20DC09FE0(const char *a1)
{
  return sub_20DC094EC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

_DWORD *initializeBufferWithCopyOfBuffer for UtilitiesError(_DWORD *result, _DWORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UtilitiesError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UtilitiesError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UtilitiesError()
{
  return &type metadata for UtilitiesError;
}

uint64_t sub_20DC0A064()
{
  return sub_20DC0A190(&qword_26772C850, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_20DC0A0AC()
{
  return sub_20DC0A190(&qword_26772C858, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_20DC0A0F4()
{
  return sub_20DC0A190(&qword_26AAF6F78, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

unint64_t sub_20DC0A13C()
{
  unint64_t result = qword_26772C868;
  if (!qword_26772C868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C868);
  }
  return result;
}

uint64_t sub_20DC0A190(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20DC0A1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20DBFEE7C(&qword_26772C880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_20DC0A240(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_20DC0A250(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_20DC246C8();
      swift_allocObject();
      sub_20DC24698();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_20DC24778();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

ssize_t sub_20DC0A2F0(uint64_t *a1, const char *a2, uint64_t a3, uint64_t a4, size_t a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  switch(v5 >> 62)
  {
    case 1uLL:
      uint64_t v13 = v5 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_20DC288C0;
      swift_bridgeObjectRetain_n();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v15 = v6 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_14;
      }
      if (v15 < (int)v6) {
        goto LABEL_21;
      }
      if (sub_20DC24688() && __OFSUB__((int)v6, sub_20DC246B8())) {
        goto LABEL_22;
      }
      sub_20DC246C8();
      swift_allocObject();
      uint64_t v27 = sub_20DC24668();
      swift_release();
      uint64_t v13 = v27;
      uint64_t v15 = v6 >> 32;
LABEL_14:
      if (v15 < (int)v6) {
        goto LABEL_19;
      }
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_20DC24688();
      if (!v28) {
        goto LABEL_24;
      }
      uint64_t v29 = v28;
      uint64_t v30 = sub_20DC246B8();
      if (__OFSUB__((int)v6, v30)) {
        goto LABEL_20;
      }
      uint64_t v31 = (void *)(v29 + (int)v6 - v30);
      sub_20DC246A8();
      uint64_t v32 = sub_20DC248C8();
      ssize_t v33 = getxattr(a2, (const char *)(v32 + 32), v31, a5, 0, 0);
      swift_bridgeObjectRelease_n();
      swift_release();
      *a1 = v6;
      a1[1] = v13 | 0x4000000000000000;
      ssize_t result = v33;
      break;
    case 2uLL:
      *((void *)&value + 1) = v5 & 0x3FFFFFFFFFFFFFFFLL;
      swift_bridgeObjectRetain_n();
      sub_20DC24768();
      uint64_t v17 = v6;
      uint64_t v16 = *((void *)&value + 1);
      uint64_t v18 = *(void *)(v6 + 16);
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_20DC24688();
      if (!v19)
      {
        __break(1u);
LABEL_24:
        __break(1u);
        JUMPOUT(0x20DC0A734);
      }
      uint64_t v20 = v19;
      uint64_t v21 = sub_20DC246B8();
      if (__OFSUB__(v18, v21))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
      }
      size_t v22 = (void *)(v20 + v18 - v21);
      sub_20DC246A8();
      uint64_t v23 = sub_20DC248C8();
      ssize_t v24 = getxattr(a2, (const char *)(v23 + 32), v22, a5, 0, 0);
      swift_bridgeObjectRelease_n();
      swift_release();
      *a1 = v17;
      a1[1] = v16 | 0x8000000000000000;
      ssize_t result = v24;
      break;
    case 3uLL:
      *(void *)((char *)&value + 7) = 0;
      *(void *)&long long value = 0;
      int v26 = (const char *)(sub_20DC248C8() + 32);
      swift_bridgeObjectRetain_n();
      ssize_t v11 = getxattr(a2, v26, &value, a5, 0, 0);
      swift_bridgeObjectRelease_n();
      swift_release();
      return v11;
    default:
      *(void *)&long long value = *a1;
      WORD4(value) = v5;
      BYTE10(value) = BYTE2(v5);
      BYTE11(value) = BYTE3(v5);
      BYTE12(value) = BYTE4(v5);
      BYTE13(value) = BYTE5(v5);
      BYTE14(value) = BYTE6(v5);
      char v10 = (const char *)(sub_20DC248C8() + 32);
      swift_bridgeObjectRetain_n();
      ssize_t v11 = getxattr(a2, v10, &value, a5, 0, 0);
      swift_bridgeObjectRelease_n();
      swift_release();
      unint64_t v12 = DWORD2(value) | ((unint64_t)BYTE12(value) << 32) | ((unint64_t)BYTE13(value) << 40) | ((unint64_t)BYTE14(value) << 48);
      *a1 = value;
      a1[1] = v12;
      return v11;
  }
  return result;
}

void sub_20DC0A744(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)sub_20DC24708();
  bundle = (__CFBundle *)_CFBundleCreateUnique();

  if (bundle)
  {
    CFURLRef v5 = CFBundleCopyExecutableURL(bundle);
    if (v5)
    {
      CFURLRef v6 = v5;
      sub_20DC24728();
      sub_20DC24918();
      uint64_t v7 = (void *)*sub_20DC01E64();
      sub_20DBFEE7C(qword_26AAF6AD0);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_20DC286F0;
      id v9 = v7;
      uint64_t v10 = sub_20DC24738();
      uint64_t v12 = v11;
      *(void *)(v8 + 56) = MEMORY[0x263F8D310];
      *(void *)(v8 + 64) = sub_20DC01E10();
      *(void *)(v8 + 32) = v10;
      *(void *)(v8 + 40) = v12;
      sub_20DC24838();

      swift_bridgeObjectRelease();

      return;
    }
  }
  uint64_t v13 = sub_20DC24758();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);

  v14(a2, a1, v13);
}

void sub_20DC0A8D8()
{
}

void *sub_20DC0A8F0(uint64_t a1)
{
  char v3 = v1;
  uint64_t v5 = sub_20DC24758();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_20DC01EB0() & 1) == 0)
  {
    uint64_t v16 = [objc_allocWithZone((Class)MISLaunchWarningQueryResult) initWithWarningState:0 withUserOverridden:0 withKBURL:0];
    uint64_t v15 = v16;
    if (v16) {
      return v15;
    }
    __break(1u);
LABEL_6:
    uint64_t v15 = v16;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
    return v15;
  }
  uint64_t v19 = v5;
  v18[3] = sub_20DC24918();
  id v9 = (void *)*sub_20DC01E64();
  sub_20DBFEE7C(qword_26AAF6AD0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_20DC286F0;
  id v11 = v9;
  uint64_t v12 = sub_20DC24738();
  uint64_t v14 = v13;
  *(void *)(v10 + 56) = MEMORY[0x263F8D310];
  *(void *)(v10 + 64) = sub_20DC01E10();
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v14;
  sub_20DC24838();

  swift_bridgeObjectRelease();
  sub_20DC0A744(a1, (uint64_t)v8);
  uint64_t v15 = v3;
  uint64_t v16 = (void *)(*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & *v3) + 0x50))(v8);
  if (!v2) {
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  return v15;
}

id sub_20DC0AC90()
{
  return sub_20DC0AFE0();
}

uint64_t sub_20DC0AE38(char a1, uint64_t a2)
{
  return sub_20DC0B2B0(a1, a2);
}

id sub_20DC0AFAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningClientOperations();
  return [super dealloc];
}

id sub_20DC0AFE0()
{
  v19[1] = *(CFDataRef *)MEMORY[0x263EF8340];
  if ((sub_20DC01EB0() & 1) == 0) {
    return 0;
  }
  sub_20DC24918();
  unint64_t v1 = (void *)*sub_20DC01E64();
  sub_20DBFEE7C(qword_26AAF6AD0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_20DC286F0;
  id v3 = v1;
  uint64_t v4 = sub_20DC24738();
  uint64_t v6 = v5;
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 64) = sub_20DC01E10();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v6;
  sub_20DC24838();

  swift_bridgeObjectRelease();
  unsigned int v7 = sub_20DC08764();
  if (!v0)
  {
    unsigned int v10 = v7;
    uint64_t v11 = v8;
    unint64_t v12 = v9;
    v19[0] = 0;
    sub_20DC02788(v8, v9);
    CFDataRef v13 = (const __CFData *)sub_20DC24798();
    sub_20DC02730(v11, v12);
    id v3 = (id)sub_20DC237A4(v10, v13, v19);

    if (v3)
    {
      sub_20DC24998();
      swift_bridgeObjectRelease();
      *(void *)&long long v18 = 0xD000000000000011;
      *((void *)&v18 + 1) = 0x800000020DC26AE0;
      sub_20DC249D8();
      sub_20DC248E8();
      swift_bridgeObjectRelease();
      id v3 = (id)0x800000020DC26AE0;
      sub_20DC0B8C4();
      swift_allocError();
      *uint64_t v14 = v18;
    }
    else
    {
      if (v19[0])
      {
        CFDataRef v15 = v19[0];
        sub_20DC247A8();
      }
      sub_20DC0B8C4();
      swift_allocError();
      *uint64_t v16 = 0xD000000000000029;
      v16[1] = 0x800000020DC26B30;
    }
    swift_willThrow();
    sub_20DC02730(v11, v12);
  }
  return v3;
}

uint64_t sub_20DC0B2B0(char a1, uint64_t a2)
{
  uint64_t v4 = sub_20DC24758();
  uint64_t v34 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC0A744(a2, (uint64_t)v6);
  sub_20DC24938();
  v33[0] = sub_20DC01E64();
  unsigned int v7 = *(void **)v33[0];
  sub_20DBFEE7C(qword_26AAF6AD0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_20DC28820;
  id v9 = v7;
  uint64_t v10 = sub_20DC24738();
  uint64_t v12 = v11;
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  unint64_t v13 = sub_20DC01E10();
  *(void *)(v8 + 64) = v13;
  uint64_t v14 = MEMORY[0x263F8D4F8];
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 40) = v12;
  uint64_t v15 = MEMORY[0x263F8D530];
  *(void *)(v8 + 96) = v14;
  *(void *)(v8 + 104) = v15;
  *(unsigned char *)(v8 + 72) = a1;
  sub_20DC24838();

  swift_bridgeObjectRelease();
  type metadata accessor for LaunchWarningMark();
  uint64_t v16 = v33[1];
  uint64_t v17 = sub_20DC01F40();
  if (!v16)
  {
    unint64_t v18 = v13;
    uint64_t v19 = (void **)v33[0];
    if (v17)
    {
      int64_t v20 = sub_20DC23674(*(void *)(v17 + 24), a1 & 1);
      if (v20 == 16)
      {
        sub_20DC0B8C4();
        swift_allocError();
        void *v29 = 0;
        v29[1] = 0;
      }
      else
      {
        int64_t v21 = v20;
        if (v20 == 1024)
        {
          (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v35);
          return swift_release();
        }
        unint64_t v36 = 0;
        unint64_t v37 = 0xE000000000000000;
        sub_20DC24998();
        swift_bridgeObjectRelease();
        unint64_t v36 = 0xD000000000000011;
        unint64_t v37 = 0x800000020DC26AE0;
        int64_t v38 = v21;
        sub_20DC249D8();
        sub_20DC248E8();
        swift_bridgeObjectRelease();
        unint64_t v30 = v36;
        unint64_t v31 = v37;
        sub_20DC0B8C4();
        swift_allocError();
        *uint64_t v32 = v30;
        v32[1] = v31;
      }
      swift_willThrow();
      swift_release();
    }
    else
    {
      sub_20DC24928();
      uint64_t v23 = *v19;
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_20DC286F0;
      id v25 = v23;
      uint64_t v26 = sub_20DC24738();
      *(void *)(v24 + 56) = MEMORY[0x263F8D310];
      *(void *)(v24 + 64) = v18;
      *(void *)(v24 + 32) = v26;
      *(void *)(v24 + 40) = v27;
      sub_20DC24838();

      swift_bridgeObjectRelease();
      sub_20DC0B8C4();
      swift_allocError();
      _OWORD *v28 = xmmword_20DC28AC0;
      swift_willThrow();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v6, v35);
}

unint64_t destroy for LaunchWarningClientOperationError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s3mis33LaunchWarningClientOperationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for LaunchWarningClientOperationError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LaunchWarningClientOperationError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for LaunchWarningClientOperationError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchWarningClientOperationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LaunchWarningClientOperationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_20DC0B87C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_20DC0B894(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningClientOperationError()
{
  return &type metadata for LaunchWarningClientOperationError;
}

unint64_t sub_20DC0B8C4()
{
  unint64_t result = qword_26772C888;
  if (!qword_26772C888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26772C888);
  }
  return result;
}

uint64_t sub_20DC0B918(uint64_t a1)
{
  uint64_t v2 = sub_20DBFEE7C(&qword_26772C7B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20DC0B978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DC0B9DC(uint64_t a1)
{
  uint64_t v2 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_20DC0BA38()
{
  qword_26772D410 = -1;
}

uint64_t sub_20DC0BA48()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_20DC0BA7C(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_20DC0BABC())()
{
  return j__swift_endAccess;
}

uint64_t sub_20DC0BB14(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_20DC0BB48(uint64_t a1, unint64_t a2, int a3)
{
  v21[3] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v14 = (int)a1;
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        goto LABEL_16;
      }
      swift_retain();
      sub_20DC02788(a1, a2);
      sub_20DC0C750((int)a1, a1 >> 32, (sqlite3_stmt *)(a2 & 0x3FFFFFFFFFFFFFFFLL), v3, a3);
      uint64_t result = sub_20DC02730(a1, a2);
      break;
    case 2uLL:
      uint64_t v16 = (sqlite3_stmt *)(a2 & 0x3FFFFFFFFFFFFFFFLL);
      uint64_t v17 = *(void *)(a1 + 16);
      uint64_t v18 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      swift_retain();
      sub_20DC0C750(v17, v18, v16, v3, a3);
      swift_release();
      uint64_t result = swift_release();
      break;
    case 3uLL:
      memset(v21, 0, 14);
      uint64_t v19 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 88);
      uint64_t v20 = swift_retain();
      uint64_t v14 = v19(v20);
      if (qword_26772D318 != -1) {
LABEL_16:
      }
        swift_once();
      uint64_t v10 = (void (__cdecl *)(void *))qword_26772D410;
      uint64_t v11 = (sqlite3_stmt *)v14;
      int v12 = a3;
      int v13 = 0;
      goto LABEL_14;
    default:
      v21[0] = a1;
      LOWORD(v21[1]) = a2;
      BYTE2(v21[1]) = BYTE2(a2);
      BYTE3(v21[1]) = BYTE3(a2);
      BYTE4(v21[1]) = BYTE4(a2);
      BYTE5(v21[1]) = BYTE5(a2);
      unsigned int v7 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 88);
      uint64_t v8 = swift_retain();
      uint64_t v9 = v7(v8);
      if (qword_26772D318 != -1) {
        swift_once();
      }
      uint64_t v10 = (void (__cdecl *)(void *))qword_26772D410;
      uint64_t v11 = (sqlite3_stmt *)v9;
      int v12 = a3;
      int v13 = BYTE6(a2);
LABEL_14:
      sqlite3_bind_blob(v11, v12, v21, v13, v10);
      uint64_t result = swift_release();
      break;
  }
  return result;
}

unsigned char *sub_20DC0BE84(int a1)
{
  unint64_t v3 = *(uint64_t (**)(void))(*(void *)v1 + 88);
  uint64_t v4 = (sqlite3_stmt *)v3();
  uint64_t result = sqlite3_column_blob(v4, a1);
  if (result)
  {
    uint64_t v6 = result;
    unsigned int v7 = (sqlite3_stmt *)v3();
    int v8 = sqlite3_column_bytes(v7, a1);
    return (unsigned char *)sub_20DC0C880(v6, v8);
  }
  return result;
}

uint64_t sub_20DC0BF10(uint64_t a1, int a2)
{
  uint64_t result = sub_20DC247E8();
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  sqlite3_int64 v6 = (uint64_t)v5;
  unsigned int v7 = (sqlite3_stmt *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 88))(result);

  return sqlite3_bind_int64(v7, a2, v6);
}

uint64_t sub_20DC0BFC8(int a1)
{
  unint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();
  v4.n128_f64[0] = (double)sqlite3_column_int64(v3, a1);

  return MEMORY[0x270EF0AF0](v4);
}

uint64_t sub_20DC0C038(sqlite3_int64 a1, int a2)
{
  double v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88))();

  return sqlite3_bind_int64(v5, a2, a1);
}

sqlite3_int64 sub_20DC0C0A0(int a1)
{
  unint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();

  return sqlite3_column_int64(v3, a1);
}

uint64_t sub_20DC0C0F8(char a1, int a2)
{
  double v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88))();

  return sqlite3_bind_int64(v5, a2, a1 & 1);
}

BOOL sub_20DC0C160(int a1)
{
  unint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();
  return sqlite3_column_int64(v3, a1) != 0;
}

uint64_t sub_20DC0C1B4(uint64_t result, uint64_t a2, int a3)
{
  if (a2)
  {
    uint64_t v6 = result;
    swift_retain();
    return sub_20DC0C210(v6, a2, v3, a3);
  }
  return result;
}

uint64_t sub_20DC0C210(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_20DC24988();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      double v5 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      double v5 = (const char *)sub_20DC249A8();
    }
    sub_20DC0CE5C(v5);
    return swift_release();
  }
  *(void *)int v8 = a1;
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  unsigned int v7 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)a3 + 88))();
  if (qword_26772D318 != -1) {
    swift_once();
  }
  sqlite3_bind_text(v7, a4, v8, -1, (void (__cdecl *)(void *))qword_26772D410);
  return swift_release();
}

const unsigned __int8 *sub_20DC0C388(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88))();
  uint64_t result = sqlite3_column_text(v3, a1);
  if (result) {
    return (const unsigned __int8 *)sub_20DC248F8();
  }
  return result;
}

uint64_t sub_20DC0C3E4()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_20DC0C3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  uint64_t v20 = (void *)sub_20DC24878();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  uint64_t v26 = sub_20DC0C9AC;
  uint64_t v27 = (void *)v10;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  uint64_t v24 = sub_20DC0C66C;
  id v25 = &unk_26C2496F0;
  uint64_t v11 = _Block_copy(&aBlock);
  sub_20DC0CA54(a3);
  swift_release();
  int v12 = (void *)swift_allocObject();
  v12[2] = a5;
  v12[3] = a6;
  v12[4] = v9;
  uint64_t v26 = sub_20DC0CAAC;
  uint64_t v27 = v12;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  uint64_t v24 = sub_20DC0C6C0;
  id v25 = &unk_26C249718;
  int v13 = _Block_copy(&aBlock);
  sub_20DC0CA54(a5);
  swift_retain();
  swift_release();
  unsigned int v14 = [v21 sel_executeQuery_withBind_withResults_:v20, v11, v13];
  _Block_release(v13);
  _Block_release(v11);

  if (v14)
  {
    sub_20DC07240();
    swift_allocError();
    *(void *)uint64_t v15 = v14;
    *(void *)(v15 + 8) = 0;
    *(void *)(v15 + 16) = 0;
    *(void *)(v15 + 24) = 0;
    *(unsigned char *)(v15 + 32) = 0;
LABEL_5:
    swift_willThrow();
    return swift_release();
  }
  swift_beginAccess();
  uint64_t v16 = *(void **)(v9 + 16);
  if (v16)
  {
    id v17 = v16;
    goto LABEL_5;
  }
  return swift_release();
}

uint64_t sub_20DC0C66C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_20DC0C6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  sub_20DC0CE0C();
  uint64_t v4 = sub_20DC24868();
  swift_retain();
  v3(a2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_20DC0C750(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, sqlite3_stmt *a4, int a5)
{
  uint64_t v10 = (char *)sub_20DC24688();
  if (!v10)
  {
LABEL_4:
    BOOL v12 = __OFSUB__(a2, a1);
    uint64_t v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }
    else
    {
      uint64_t v14 = sub_20DC246A8();
      if (v14 < v13) {
        uint64_t v13 = v14;
      }
      a3 = a4;
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)a4 + 88))();
      if (!v10) {
        uint64_t v13 = 0;
      }
      if (v13 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (v13 <= 0x7FFFFFFF)
        {
          a3 = (sqlite3_stmt *)v15;
          if (qword_26772D318 == -1)
          {
LABEL_12:
            sqlite3_bind_blob(a3, a5, v10, v13, (void (__cdecl *)(void *))qword_26772D410);
            return swift_release();
          }
LABEL_16:
          swift_once();
          goto LABEL_12;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  uint64_t result = sub_20DC246B8();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_20DC0C880(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_20DC04D48(__src, &__src[a2]);
  }
  sub_20DC246C8();
  swift_allocObject();
  sub_20DC24678();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_20DC24778();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_20DC0C934()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_20DC0C96C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20DC0C9AC(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    type metadata accessor for SQLStatement();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_20DC0CE4C((uint64_t)v2);
  }
  return result;
}

uint64_t sub_20DC0CA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_20DC0CA4C()
{
  return swift_release();
}

uint64_t sub_20DC0CA54(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_20DC0CA64()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_20DC0CAAC(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    type metadata accessor for SQLStatement();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_20DC0CE4C((uint64_t)v2);
  }
  return result;
}

uint64_t sub_20DC0CB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for DBError(uint64_t a1)
{
  return sub_20DC0CBB8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_20DC0CBB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_20DC0CB60(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_20DC0CB60(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_20DC0CBB8(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for DBError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DBError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  sub_20DC0CBB8(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DBError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DBError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_20DC0CDC4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_20DC0CDCC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLStatement()
{
  return self;
}

unint64_t sub_20DC0CE0C()
{
  unint64_t result = qword_26772C890;
  if (!qword_26772C890)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26772C890);
  }
  return result;
}

uint64_t sub_20DC0CE4C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_20DC0CE5C(const char *a1)
{
  int v3 = *(_DWORD *)(v1 + 24);
  int v4 = (sqlite3_stmt *)(*(uint64_t (**)(void))(**(void **)(v1 + 16) + 88))();
  if (qword_26772D318 != -1) {
    swift_once();
  }
  return sqlite3_bind_text(v4, v3, a1, -1, (void (__cdecl *)(void *))qword_26772D410);
}

void sub_20DC0CF14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_20DC027E0(a1, a2);
  if (!v2)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    unint64_t v10 = v6;
    if (v4)
    {
      sub_20DC02788(v5, v6);
      uint64_t v11 = (void *)sub_20DC24798();
      sub_20DC02730(v9, v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = [objc_allocWithZone((Class)MISUserTrustSignature) initWithSignature:v11];

    if (v12) {
      sub_20DC03558(v7, v8, v9, v10);
    }
    else {
      __break(1u);
    }
  }
}

uint64_t sub_20DC0D154()
{
  return sub_20DC02E2C();
}

uint64_t sub_20DC0D244()
{
  id v1 = v0;
  uint64_t v2 = sub_20DBFEE7C(&qword_26772C7D8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_20DBFEE7C(&qword_26772C7E8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20DC24828();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20DC24808();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_20DC0293C((uint64_t)v11, (uint64_t)v4);
    if (v0)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    else
    {
      uint64_t v13 = type metadata accessor for UserTrustedProfileEntry();
      id v1 = [objc_allocWithZone(NSNumber) initWithBool:((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v4, 1, v13) != 1)];
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      sub_20DC0D4C0((uint64_t)v4);
    }
    return (uint64_t)v1;
  }
  return result;
}

uint64_t sub_20DC0D4C0(uint64_t a1)
{
  uint64_t v2 = sub_20DBFEE7C(&qword_26772C7D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for UserTrustOperations()
{
  return self;
}

id sub_20DC0D680()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustOperations();
  return [super dealloc];
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = 22;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0;
    uint64_t result = __sandbox_ms();
    if (result) {
      return *__error();
    }
    else {
      *a3 = 0;
    }
  }
  return result;
}

uint64_t amfi_interface_query_bootarg_state(void *a1)
{
  if (!a1) {
    return 22;
  }
  *a1 = 0;
  uint64_t result = __sandbox_ms();
  if (result) {
    return *__error();
  }
  *a1 = 0;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(unsigned char *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22;
  }
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!result) {
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(unsigned char *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22;
  }
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!result) {
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  char v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL)) {
    return 22;
  }
  else {
    return __sandbox_ms();
  }
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2 = 0;
  size_t v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0, 0) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2 = 0;
  size_t v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0, 0) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && (unint64_t)(a3 - 1) <= 0x3FFE) {
    return MEMORY[0x270EDACD0]();
  }
  else {
    return 22;
  }
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (int *)a4;
  v7[128] = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      int v6 = 5;
      if (!v4) {
        uint64_t v4 = &v6;
      }
      if (!__sandbox_ms() && !*v4) {
        return 1;
      }
    }
    else if (a4)
    {
      uint64_t result = 0;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }
  else if (a4)
  {
    uint64_t result = 0;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }
  return 0;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if (result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if (result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if (result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if (result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if (result) {
              return result;
            }
            uint64_t v3 = 0x1000000000;
          }
          else
          {
            uint64_t v3 = 0x800000000;
          }
        }
        else
        {
          uint64_t v3 = 0x400000000;
        }
      }
      else
      {
        uint64_t v3 = 8;
      }
    }
    else
    {
      uint64_t v3 = 3840;
    }
    *(void *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6)) {
      goto LABEL_3;
    }
    time_t v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6)) {
          *(void *)(a1 + 240) |= 0x1000000000uLL;
        }
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(unsigned char *)(v3 + 17)) {
      double result = sub_20DC0E0A0((void *)v3, a2);
    }
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0) {
    goto LABEL_15;
  }
  double result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if (result) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(unsigned char *)(v3 + 16))
  {
    if (*(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!result
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !result)
        || (double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(unsigned char *)(v3 + 16) && *(unsigned char *)(v3 + 17))
    {
      double result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }
  return result;
}

uint64_t sub_20DC0E0A0(void *a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t CTEvaluateAMFICodeSignatureCMS_MaxDigestType(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, void *a7, void *a8, uint64_t *a9, int *a10, _DWORD *a11, void *a12, void *a13)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  memset(&v40[14], 170, 24);
  *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v40[10] = v21;
  *(_OWORD *)&v40[12] = v21;
  *(_OWORD *)&v40[6] = v21;
  *(_OWORD *)&v40[8] = v21;
  *(_OWORD *)&v40[2] = v21;
  *(_OWORD *)&v40[4] = v21;
  *(_OWORD *)uint64_t v40 = v21;
  memset(__b, 170, sizeof(__b));
  *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39[0] = v22;
  v39[1] = v22;
  long long v37 = v22;
  long long v38 = v22;
  v35[4] = v22;
  long long v36 = v22;
  v35[2] = v22;
  v35[3] = v22;
  v35[0] = v22;
  v35[1] = v22;
  long long v34 = v22;
  uint64_t result = sub_20DC0E390((uint64_t)v40, a1, a2, a3, a4, (uint64_t)__b, 0);
  if (result) {
    return result;
  }
  uint64_t result = sub_20DC0E440((uint64_t)v40, (uint64_t)&v34, &v40[15], 0, a6);
  if (result) {
    return result;
  }
  uint64_t v33 = 0;
  unint64_t v30 = 0xAAAAAAAA0000AA01;
  long long v29 = xmmword_20DC29C40;
  BYTE1(v30) = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  int v24 = X509ChainCheckPathWithOptions(29, (uint64_t *)v39 + 1, (uint64_t)&v29, &v33);
  if (a10)
  {
    digest = find_digest((uint64_t)v35 + 8);
    if (!digest) {
      return 327682;
    }
    *a10 = *digest;
  }
  if (!a9 || v24)
  {
    if (!a9) {
      goto LABEL_13;
    }
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = v33;
  }
  *a9 = v26;
LABEL_13:
  if (a8 && a7 && *((void *)&v39[0] + 1))
  {
    uint64_t v27 = *(void *)(*((void *)&v39[0] + 1) + 8);
    *a7 = **((void **)&v39[0] + 1);
    *a8 = v27;
  }
  uint64_t result = 0;
  if (a11 && a12)
  {
    if (a13)
    {
      uint64_t result = 0;
      *a11 = DWORD2(v36);
      uint64_t v28 = *((void *)&v37 + 1);
      *a12 = v37;
      *a13 = v28;
    }
  }
  return result;
}

uint64_t sub_20DC0E390(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(void *)(result + 112) = 0;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(void *)(result + 24) = 0;
  *(_OWORD *)uint64_t result = 0u;
  *(void *)(result + 32) = result + 24;
  *(void *)uint64_t result = 4;
  *(void *)(result + 8) = a6;
  *(_DWORD *)(result + 96) = a7;
  if (a3 < 0)
  {
LABEL_10:
    __break(0x5519u);
    return result;
  }
  uint64_t v9 = result;
  uint64_t result = CMSParseContentInfoSignedData(a2, a3, (unint64_t *)result);
  if (!result)
  {
    if (!a5) {
      return 0;
    }
    uint64_t result = 131091;
    if (!*(void *)(v9 + 72) && !*(void *)(v9 + 80))
    {
      if ((a5 & 0x8000000000000000) == 0)
      {
        uint64_t result = 0;
        *(void *)(v9 + 72) = a4;
        *(void *)(v9 + 80) = a5;
        return result;
      }
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t sub_20DC0E440(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5)
{
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = 1;
  *a3 = 0;
  a3[1] = 0;
  *a3 = a4;
  *(_DWORD *)(a2 + 168) = 458753;
  *((_DWORD *)a3 + 2) = a5;
  uint64_t result = CMSParseSignerInfos(a1, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, long long *))validateSignerInfoAndChain);
  if (!result) {
    return *(unsigned int *)(a2 + 168);
  }
  return result;
}

uint64_t CTEvaluateAMFICodeSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7, uint64_t *a8, int *a9, _DWORD *a10, void *a11, void *a12)
{
  return CTEvaluateAMFICodeSignatureCMS_MaxDigestType(a1, a2, a3, a4, a5, 16, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t CTEvaluateAMFICodeSignatureCMSPubKey(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, _DWORD *a8, void *a9, void *a10)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  memset(&v35[14], 170, 24);
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v35[10] = v18;
  *(_OWORD *)&v35[12] = v18;
  *(_OWORD *)&v35[6] = v18;
  *(_OWORD *)&v35[8] = v18;
  *(_OWORD *)&v35[2] = v18;
  *(_OWORD *)&v35[4] = v18;
  *(_OWORD *)uint64_t v35 = v18;
  memset(__b, 170, sizeof(__b));
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v33 = v19;
  long long v34 = v19;
  long long v31 = v19;
  long long v32 = v19;
  v29[4] = v19;
  long long v30 = v19;
  v29[3] = v19;
  v29[1] = v19;
  v29[2] = v19;
  long long v28 = v19;
  v29[0] = v19;
  uint64_t result = sub_20DC0E390((uint64_t)v35, a1, a2, a3, a4, (uint64_t)__b, 16);
  if (!result)
  {
    v27[0] = a5;
    v27[1] = a6;
    long long v21 = (long long *)oidForPubKeyLength();
    long long v22 = &null_octet;
    if (v21) {
      long long v22 = v21;
    }
    v26[0] = 1;
    v26[1] = 0;
    void v26[3] = v27;
    v26[2] = 0xAAAAAAAA00000000;
    uint64_t v23 = &ecPublicKey;
    if (!v21) {
      uint64_t v23 = &rsaEncryption;
    }
    v26[4] = v23;
    v26[5] = v22;
    v26[6] = 0;
    uint64_t result = sub_20DC0E440((uint64_t)v35, (uint64_t)&v28, &v35[15], (uint64_t)v26, 16);
    if (!result)
    {
      if (a7)
      {
        digest = find_digest((uint64_t)v29 + 8);
        if (!digest) {
          return 327682;
        }
        *a7 = *digest;
      }
      uint64_t result = 0;
      if (a8 && a9)
      {
        if (a10)
        {
          uint64_t result = 0;
          *a8 = DWORD2(v30);
          uint64_t v25 = *((void *)&v31 + 1);
          *a9 = v31;
          *a10 = v25;
        }
      }
    }
  }
  return result;
}

uint64_t CTEvaluateProvisioningProfile(unsigned __int8 *a1, uint64_t a2, char a3, void *a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v10 = -1431655766;
  uint64_t v11 = &null_octet;
  char v7 = 1;
  long long v6 = xmmword_20DC29C50;
  char v8 = a3;
  __int16 v9 = 0;
  id v12 = &null_octet;
  uint64_t v13 = &null_octet;
  uint64_t v14 = &null_octet;
  return CMSVerifyAndReturnSignedData(a1, a2, a4, a5, (uint64_t)&v6);
}

uint64_t CTAmfiInitializeContext(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 16) = a4;
  *(unsigned char *)(a1 + 20) = a5;
  v21[0] = 0xAAAAAAAAAAAAAAAALL;
  v21[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v14 = v6;
  long long v15 = v6;
  v13[6] = v6;
  v13[7] = v6;
  v13[4] = v6;
  v13[5] = v6;
  v13[2] = v6;
  v13[3] = v6;
  v13[0] = v6;
  v13[1] = v6;
  long long v12 = v6;
  memset(v16, 0, sizeof(v16));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v20 = 0;
  uint64_t result = sub_20DC0E8A8((uint64_t)v16, (uint64_t)&v12, (uint64_t)v21, (uint64_t)__b, a1, (uint64_t (*)(uint64_t, uint64_t, long long *))CMSBuildPath);
  if (!result)
  {
    digest = find_digest((uint64_t)v13 + 8);
    if (digest)
    {
      *(_DWORD *)(a1 + 80) = *digest;
      if (*((void *)&v17 + 1))
      {
        uint64_t v9 = v18;
        if ((void)v18)
        {
          *(void *)(a1 + 40) = *((void *)&v17 + 1);
          *(void *)(a1 + 48) = v9;
        }
      }
      uint64_t v10 = *((void *)&v14 + 1);
      uint64_t result = 0;
      if (*((void *)&v14 + 1))
      {
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8);
        *(void *)(a1 + 24) = **((void **)&v14 + 1);
        *(void *)(a1 + 32) = v11;
        *(void *)(a1 + 88) = *(void *)(v10 + 240);
      }
    }
    else
    {
      return 327682;
    }
  }
  return result;
}

uint64_t sub_20DC0E8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, long long *))
{
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = a1 + 24;
  *(void *)a1 = 4;
  *(void *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a5 + 16);
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = 1;
  *(_DWORD *)(a2 + 168) = 327681;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(a5 + 16);
  *(unsigned char *)(a3 + 12) = *(unsigned char *)(a5 + 84);
  uint64_t result = CMSParseContentInfoSignedData(*(unsigned __int8 **)a5, *(void *)(a5 + 8), (unint64_t *)a1);
  if (!result)
  {
    uint64_t result = CMSParseSignerInfos(a1, a3, a6);
    if (!result) {
      return *(unsigned int *)(a2 + 168);
    }
  }
  return result;
}

uint64_t CTAmfiVerifyCMS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v13 = v6;
  long long v14 = v6;
  long long v11 = v6;
  long long v12 = v6;
  v9[5] = v6;
  long long v10 = v6;
  v9[3] = v6;
  v9[4] = v6;
  v9[1] = v6;
  v9[2] = v6;
  v9[0] = v6;
  memset(v15, 0, sizeof(v15));
  uint64_t v16 = 0;
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  uint64_t result = sub_20DC0E8A8((uint64_t)v15, (uint64_t)v9, (uint64_t)v19, (uint64_t)__b, a1, (uint64_t (*)(uint64_t, uint64_t, long long *))validateSignerInfo);
  if (!result)
  {
    *(_DWORD *)(a1 + 56) = DWORD2(v10);
    uint64_t v8 = *((void *)&v11 + 1);
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = v8;
    *(unsigned char *)(a1 + 84) = v13;
  }
  return result;
}

uint64_t CTAmfiVerifyCertificateChain(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = v2;
  v10[1] = v2;
  v9[7] = v2;
  v9[8] = v2;
  v9[5] = v2;
  _OWORD v9[6] = v2;
  v9[3] = v2;
  v9[4] = v2;
  v9[1] = v2;
  v9[2] = v2;
  v9[0] = v2;
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0;
  uint64_t result = sub_20DC0E8A8((uint64_t)v11, (uint64_t)v9, (uint64_t)v13, (uint64_t)__b, a1, (uint64_t (*)(uint64_t, uint64_t, long long *))sub_20DC0EBA4);
  if (!result)
  {
    uint64_t v8 = 0;
    unint64_t v5 = 0xAAAAAAAAAAAAAA01;
    long long v4 = xmmword_20DC29C40;
    BYTE1(v5) = *(unsigned char *)(a1 + 20);
    WORD1(v5) = 0;
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t result = X509ChainCheckPathWithOptions(29, (uint64_t *)v10 + 1, (uint64_t)&v4, &v8);
    if (result)
    {
      *(void *)(a1 + 96) = 0;
      return X509ChainCheckPathWithOptions(29, (uint64_t *)v10 + 1, 0, 0);
    }
    else
    {
      *(void *)(a1 + 96) = v8;
    }
  }
  return result;
}

uint64_t sub_20DC0EBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 12) && *(unsigned __int8 *)(a1 + 12) != *(unsigned __int8 *)(a3 + 144)) {
    return 327710;
  }
  else {
    return CMSBuildPath(a1, a2, a3);
  }
}

uint64_t CTAmfiContextGetLeaf(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  *a2 = *(void *)(a1 + 24);
  *a3 = v3;
  return 0;
}

uint64_t CTAmfiContextGetContent(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  *a2 = *(void *)(a1 + 40);
  *a3 = v3;
  return 0;
}

uint64_t CTAmfiContextGetDigestType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 80);
}

uint64_t CTAmfiContextGetLeafPolicyFlags(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t CTAmfiContextGetChainPolicyFlags(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t CTAmfiContextGetHashAgility(uint64_t a1, _DWORD *a2, void *a3, void *a4)
{
  *a2 = *(_DWORD *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 72);
  *a3 = *(void *)(a1 + 64);
  *a4 = v4;
  return 0;
}

uint64_t CTParseAmfiCMS(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7, _DWORD *a8, void *a9)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  v18[0] = a1;
  v18[1] = a2;
  LODWORD(v19) = a3;
  uint64_t result = CTAmfiInitializeContext((uint64_t)v18, a1, a2, a3, 0);
  if (result) {
    return result;
  }
  if (!a7 || !a6 || (uint64_t v15 = *((void *)&v20 + 1)) == 0 || (v16 = v21) == 0)
  {
    if (!a6 || !a7) {
      goto LABEL_10;
    }
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  *a6 = v15;
  *a7 = v16;
LABEL_10:
  if (a5)
  {
    if (a4)
    {
      if (*((void *)&v19 + 1))
      {
        uint64_t v17 = v20;
        if ((void)v20)
        {
          *a4 = *((void *)&v19 + 1);
          *a5 = v17;
        }
      }
    }
  }
  if (a9) {
    *a9 = *((void *)&v23 + 1);
  }
  if (a8) {
    *a8 = v23;
  }
  return result;
}

uint64_t CTVerifyAmfiCMS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _DWORD *a6, void *a7, void *a8)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  v13[0] = a1;
  v13[1] = a2;
  LODWORD(v14) = a5;
  uint64_t result = CTAmfiVerifyCMS((uint64_t)v13, a3, a4);
  if (!result && a6 && a7)
  {
    if (a8)
    {
      *a6 = DWORD2(v16);
      uint64_t v12 = *((void *)&v17 + 1);
      *a7 = v17;
      *a8 = v12;
    }
  }
  return result;
}

uint64_t CTVerifyAmfiCertificateChain(uint64_t a1, uint64_t a2, char a3, int a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  v7[0] = a1;
  v7[1] = a2;
  LODWORD(v8) = a4;
  BYTE4(v8) = a3;
  uint64_t result = CTAmfiVerifyCertificateChain((uint64_t)v7);
  if (a5)
  {
    if (!result) {
      *a5 = v13;
    }
  }
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw((uint64_t)&dword_26C249740[v2 / 4 + 2], *(const void **)a1, *(void *)(a1 + 8));
    if (!result) {
      break;
    }
    v2 += 32;
    if (v2 == 160) {
      return 0;
    }
  }
  if (v2 <= ~(unint64_t)dword_26C249740) {
    return &dword_26C249740[v2 / 4];
  }
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0;
  while (dword_26C249740[v1 / 4] != result)
  {
    v1 += 32;
    if (v1 == 160) {
      return 0;
    }
  }
  if (v1 <= ~(unint64_t)dword_26C249740) {
    return &dword_26C249740[v1 / 4];
  }
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    long long v6 = &CTOidSha1;
    uint64_t v4 = 5;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    long long v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    long long v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9;
    goto LABEL_11;
  }
  uint64_t v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    long long v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    long long v6 = &CTOidSha384;
    goto LABEL_18;
  }
  uint64_t v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL)) {
      return 0;
    }
    long long v6 = &CTOidSha512;
    goto LABEL_18;
  }
  long long v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0;
  uint64_t v27 = *MEMORY[0x263EF8340];
  char v23 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!result
              || (unint64_t result = sub_20DC0F2E0((uint64_t)&off_2641299A8, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), result))
            {
              unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v21 = a5[9];
              unint64_t v22 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0;
                    }
                    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v26 = -21846;
                    char v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0;
                          }
                          unint64_t result = MEMORY[0x270FA5388](v14);
                          long long v16 = (unint64_t *)((char *)&v20 - v15);
                          unint64_t v17 = 0;
                          *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            uint64_t v19 = &v16[v17 / 8];
                            *(_OWORD *)uint64_t v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *long long v16 = v11;
                            if (ccrsa_import_pub()) {
                              return 0;
                            }
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs()) {
                              return v23 != 0;
                            }
                            unint64_t result = 0;
                            char v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_20DC0F2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0;
  BOOL v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3)) {
      break;
    }
    BOOL v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = sub_20DC0F2E0((uint64_t)&off_264129A28, a5 + 24, a5 + 56), result))
            {
              uint64_t result = sub_20DC0F5CC((int **)(a5 + 72));
              if (result)
              {
                uint64_t v8 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  uint64_t v9 = 24 * v8;
                  BOOL v10 = __CFADD__(v9, 16);
                  unint64_t v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    uint64_t result = MEMORY[0x270FA5388](result);
                    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
                    unint64_t v15 = 0;
                    do
                    {
                      long long v16 = &v14[v15 / 8];
                      *long long v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *uint64_t v14 = result;
                      if (v12 >= 1)
                      {
                        if (!MEMORY[0x2105673B0]())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite()) {
                                return HIBYTE(v17) != 0;
                              }
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_20DC0F5CC(int **a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(void *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793) {
      JUMPOUT(0x210567370);
    }
    return 0;
  }
  uint64_t v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497) {
    JUMPOUT(0x210567380);
  }
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0;
  }
  return MEMORY[0x270ED8AA8]();
}

uint64_t compressECPublicKey(void *a1, int **a2, uint64_t a3, uint64_t a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  BOOL v7 = (void *)sub_20DC0F5CC(a2);
  if (!v7) {
    return 655366;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  uint64_t v10 = 24 * v9;
  BOOL v11 = __CFADD__(v10, 16);
  unint64_t v12 = v10 + 16;
  if (v11 || v12 >= 0xFFFFFFFFFFFFFFF0) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = MEMORY[0x270FA5388](v7);
  long long v16 = (void *)((char *)v19 - v14);
  unint64_t v17 = 0;
  do
  {
    uint64_t v18 = &v16[v17 / 8];
    *uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16;
  }
  while (v14 != v17);
  if (v15 < 0x10) {
    goto LABEL_21;
  }
  *long long v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t result = MEMORY[0x2105673B0](v8, a1[1], *a1, (char *)v19 - v14);
  if (!result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub();
      }
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  int v6 = (uint64_t *)sub_20DC0F5CC(a2);
  if (!v6) {
    return 655366;
  }
  uint64_t v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v8 = 24 * v7;
  BOOL v9 = __CFADD__(v8, 16);
  unint64_t v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  unint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v14 = (void *)((char *)v18 - v12);
  unint64_t v15 = 0;
  do
  {
    long long v16 = &v14[v15 / 8];
    *long long v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10) {
    goto LABEL_24;
  }
  *uint64_t v14 = result;
  if (v12 >= 1)
  {
    uint64_t v17 = ccec_compressed_x962_import_pub();
    if (!v17)
    {
      unint64_t result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = 393220;
          }
          ccec_export_pub();
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(unsigned __int8 *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  long long v28 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  long long v29 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  long long v28 = a1;
  long long v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = sub_20DC1001C(&v28, 0x2000000000000010, (unsigned char *)&v27 + 1, &v26);
  uint64_t result = 65537;
  if (v7)
  {
    char v24 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v25 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    char v24 = v28;
    unint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (compare_octet_string_raw((uint64_t)&off_264129AA8, v24, v26)) {
        return 65539;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      if (!sub_20DC1001C(&v24, 0xA000000000000000, &v27, &v26)) {
        return 65540;
      }
      unint64_t v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      char v23 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      char v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((sub_20DC1001C(&v22, 0x2000000000000010, (unsigned char *)&v31 + 1, v30) & 1) == 0) {
        return 131073;
      }
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080;
      if (&v22[v30[0]] != v23) {
        return 131082;
      }
      unint64_t v10 = a3 + 11;
      if (!ccder_blob_decode_uint64()) {
        return 131074;
      }
      uint64_t result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!sub_20DC11C08(&v22, 0x2000000000000011, 0, 125)) {
          return 131075;
        }
        unsigned __int8 v35 = 0;
        size_t v34 = 0;
        if ((sub_20DC1001C(&v22, 0x2000000000000010, &v35, &v34) & 1) == 0) {
          return 131076;
        }
        long long v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        long long v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        long long v32 = v22;
        long long v33 = &v22[v34];
        if (!ccder_blob_decode_tl()) {
          return 131077;
        }
        if (v33 < v32 || v34 > v33 - v32) {
          goto LABEL_112;
        }
        if (compare_octet_string_raw((uint64_t)&off_264129AB8, v32, v34)) {
          return 131078;
        }
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        BOOL v11 = &v32[v34];
        if (v32 > &v32[v34] || v11 > v33) {
          goto LABEL_112;
        }
        v32 += v34;
        int v12 = v35;
        if (v11 != v33 || v35)
        {
          unsigned __int8 v40 = 0;
          long long v38 = v33;
          unint64_t v39 = 0;
          uint64_t v37 = v11;
          if (sub_20DC1001C(&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
              if (&v37[v39] != v33) {
                return v9;
              }
            }
            if (v37 > v38) {
              goto LABEL_112;
            }
            long long v32 = v37;
            long long v33 = v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            if (v40 && !sub_20DC1001C(&v32, 0x2000000000000004, &v36, &v39)) {
              return 131079;
            }
            unint64_t v41 = 0;
            if (!ccder_blob_decode_tl()) {
              return 131090;
            }
            uint64_t v17 = v32;
            uint64_t v18 = v33;
            if (v33 < v32) {
              goto LABEL_112;
            }
            unint64_t v19 = v41;
            if (v41 > v33 - v32) {
              goto LABEL_112;
            }
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            uint64_t v20 = &v17[v19];
            if (v20 > v18 || v17 > v20) {
              goto LABEL_112;
            }
            long long v32 = v20;
            if ((sub_20DC100BC((unint64_t *)&v32, v36) & 1) == 0) {
              return 131089;
            }
          }
          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }
          if ((sub_20DC100BC((unint64_t *)&v32, v16 != 0) & 1) == 0) {
            return 131088;
          }
          BOOL v11 = v32;
        }
        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        if ((sub_20DC100BC((unint64_t *)&v22, v12 != 0) & 1) == 0) {
          return 131081;
        }
        uint64_t v37 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        long long v38 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        uint64_t v37 = v22;
        long long v38 = v23;
        if ((sub_20DC1001C(&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          unint64_t v13 = v22;
          unint64_t v15 = v23;
          goto LABEL_86;
        }
        long long v32 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        long long v33 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          long long v32 = v37;
          long long v33 = &v37[v30[0]];
          if (!sub_20DC1196C(&v32, a3[1], *a3, a3 + 3, a3 + 2)) {
            return 131085;
          }
          if (!sub_20DC100BC((unint64_t *)&v32, v31)) {
            return 131086;
          }
          unint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            unint64_t v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            char v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              uint64_t v37 = v13;
              long long v38 = v15;
              if (sub_20DC11C08(&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                char v23 = v38;
              }
              if (!sub_20DC11C08(&v22, 0x2000000000000011, (unsigned __int8 **)&v30[1], 125)) {
                return 131083;
              }
              if (v30[2] >= v30[1])
              {
                unint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((sub_20DC100BC((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0) {
                    return 131084;
                  }
                  if (!sub_20DC100BC((unint64_t *)&v22, v27)) {
                    return 65541;
                  }
                  if (v22 <= v25 && v24 <= v22)
                  {
                    char v24 = v22;
                    if (sub_20DC100BC((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543;
                      }
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t sub_20DC1001C(unsigned __int8 **a1, uint64_t a2, unsigned char *a3, unint64_t *a4)
{
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL) {
      return sub_20DC11798(a1, a3, a4);
    }
  }
  return result;
}

uint64_t sub_20DC100BC(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  unint64_t v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1]) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(unsigned __int8 *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, long long *))
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  int v84 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  int v85 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  int v84 = *(unsigned __int8 **)(a1 + 40);
  int v85 = (unsigned __int8 *)(v4 + v3);
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }
  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((sub_20DC1001C(&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }
    v69 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    id v70 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > &v84[v72] || &v84[v72] > v85) {
      goto LABEL_92;
    }
    v69 = v84;
    id v70 = &v84[v72];
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }
    uint64_t v9 = v69;
    int v8 = v70;
    uint64_t v67 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    uint64_t v67 = v69;
    unint64_t v68 = (unint64_t)v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl()) {
      break;
    }
    unint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&long long v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > &v10[v72] || &v10[v72] > v70) {
      goto LABEL_92;
    }
    v69 = &v10[v72];
    if (!ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }
    v63 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    v64 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&long long v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > &v63[v72] || &v63[v72] > v64) {
        goto LABEL_92;
      }
      v69 = &v63[v72];
      id v70 = v64;
    }
    else
    {
      *((void *)&v75 + 1) = 0;
      *(void *)&long long v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL((unint64_t *)&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&long long v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    int v12 = &v69[v72];
    if (v69 > &v69[v72] || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (sub_20DC11C08(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      v69 = v63;
      id v70 = v64;
    }
    if ((sub_20DC100BC((unint64_t *)&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      uint64_t v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if (result != 327710)
        {
          if (result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176 * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              long long v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176 * v29);
                    unint64_t v37 = v35 + 176 * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0) {
                      goto LABEL_92;
                    }
                    long long v40 = v73;
                    long long v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    _OWORD *v36 = v40;
                    long long v42 = v76;
                    long long v43 = v77;
                    long long v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    unsigned char v36[4] = v43;
                    long long v45 = v80;
                    long long v46 = v81;
                    long long v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60)) {
                goto LABEL_93;
              }
              uint64_t v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0) {
                goto LABEL_92;
              }
              long long v21 = v73;
              long long v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *uint64_t v20 = v21;
              long long v23 = v76;
              long long v24 = v77;
              long long v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              long long v26 = v80;
              long long v27 = v81;
              long long v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    int v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }
    if (v69 == v85)
    {
      if (v60) {
        return 0;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0;
        CFURLRef v51 = *(_OWORD **)(a1 + 56);
        long long v52 = v73;
        long long v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        _OWORD *v51 = v52;
        long long v54 = v76;
        long long v55 = v77;
        long long v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        long long v57 = v80;
        long long v58 = v81;
        long long v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v67;
    BOOL v11 = (unsigned __int8 *)v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    v69 = v10;
    id v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v65;
    BOOL v11 = v66;
    goto LABEL_17;
  }
  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3)
  {
    if (*(void *)a3 != 1) {
      return 524289;
    }
    uint64_t v8 = 524293;
    if (!ccder_blob_decode_tl()) {
      return 524290;
    }
    if (!ccder_blob_decode_tl()) {
      return 524291;
    }
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl()) {
          return 524292;
        }
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            uint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              uint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(void *)(a2 + 88) == 1) {
    return 524298;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl())
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }
  uint64_t v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295;
  }
  uint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3 + 24;
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  uint64_t v9 = v8;
  memset(v86, 0, sizeof(v86));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      unint64_t v10 = v86;
      uint64_t v13 = ccdigest();
      unint64_t v11 = *v9;
      if (*v9 >= 0x41) {
        goto LABEL_180;
      }
      goto LABEL_16;
    }
    if (!v10) {
      goto LABEL_144;
    }
  }
  if (*v8 != v11)
  {
LABEL_144:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40) {
    goto LABEL_180;
  }
  uint64_t v13 = __memcpy_chk();
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v15 = (void *)(a3 + 128);
  uint64_t v16 = *(void *)(a3 + 48);
  if (!v16) {
    goto LABEL_159;
  }
  uint64_t v71 = a1;
  long long v79 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v80 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = *(void *)(a3 + 40);
  if (__CFADD__(v17, v16)) {
    goto LABEL_181;
  }
  unint64_t v18 = v17 + v16;
  if (v17 > v18)
  {
LABEL_180:
    __break(0x5519u);
    goto LABEL_181;
  }
  long long v79 = *(char **)(a3 + 40);
  unint64_t v80 = v18;
  unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 < v18)
  {
    int v19 = 0;
    uint64_t v74 = 0x2000000000000010;
    unsigned int v70 = 262146;
    unsigned int v73 = 262147;
    unsigned int v72 = 262148;
    do
    {
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = 262145;
        goto LABEL_176;
      }
      if (__CFADD__(v79, v78)) {
        goto LABEL_181;
      }
      unint64_t v20 = &v79[v78];
      long long v77 = (char *)0xAAAAAAAAAAAAAAAALL;
      long long v76 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (v79 > &v79[v78] || (unint64_t)v20 > v80) {
        goto LABEL_180;
      }
      long long v76 = v79;
      long long v77 = &v79[v78];
      if (!ccder_blob_decode_tl())
      {
        uint64_t result = v70;
        goto LABEL_176;
      }
      uint64_t v22 = v76;
      if (__CFADD__(v76, v78)) {
        goto LABEL_181;
      }
      if (v76 > &v76[v78] || &v76[v78] > v77) {
        goto LABEL_180;
      }
      v76 += v78;
      if (v78 != 9) {
        goto LABEL_147;
      }
      if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 3)
      {
        if (v19) {
          goto LABEL_149;
        }
        *(void *)int v84 = 0xAAAAAAAAAAAAAAAALL;
        int v33 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v33)
        {
          if (sub_20DC11D44(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 1u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 4)
      {
        if ((v19 & 2) != 0) {
          goto LABEL_149;
        }
        *(void *)int v84 = 0xAAAAAAAAAAAAAAAALL;
        int v36 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v36)
        {
          if (sub_20DC11DFC((uint64_t)&v76, v34, v35, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 2u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 2)
      {
        if ((v19 & 0x10) != 0) {
          goto LABEL_149;
        }
        unint64_t v83 = 0xAAAAAAAAAAAAAAAALL;
        int v37 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v37)
        {
          BOOL v38 = v76;
          unint64_t v39 = v77;
          if (v76 >= v77)
          {
LABEL_111:
            if (v38 == v39) {
              uint64_t result = 0;
            }
            else {
              uint64_t result = 262155;
            }
          }
          else
          {
            while (1)
            {
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262157;
                goto LABEL_134;
              }
              memset(v84, 170, 16);
              if (__CFADD__(v76, v83)) {
                goto LABEL_181;
              }
              if (v76 > &v76[v83] || &v76[v83] > v77) {
                goto LABEL_180;
              }
              *(void *)int v84 = v76;
              *(void *)&v84[8] = &v76[v83];
              if ((ccder_blob_decode_tl() & 1) == 0)
              {
                uint64_t result = 262151;
                goto LABEL_134;
              }
              long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
              if (*(void *)&v84[8] < *(void *)v84 || v83 > *(void *)&v84[8] - *(void *)v84) {
                goto LABEL_180;
              }
              long long v81 = *(unsigned char **)v84;
              long long v82 = (unsigned char *)v83;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              if (*(void *)v84 > *(void *)v84 + v83 || *(void *)v84 + v83 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (!ccder_blob_decode_tl())
              {
                uint64_t result = 262152;
                goto LABEL_134;
              }
              uint64_t v41 = *(void *)v84;
              if (__CFADD__(*(void *)v84, v83)) {
                goto LABEL_181;
              }
              unint64_t v42 = *(void *)v84 + v83;
              if (*(void *)v84 > *(void *)v84 + v83) {
                goto LABEL_180;
              }
              uint64_t v43 = *(void *)&v84[8];
              if (v42 > *(void *)&v84[8]) {
                goto LABEL_180;
              }
              *(void *)v84 += v83;
              if (v42 != *(void *)&v84[8]) {
                break;
              }
              long long v44 = find_digest((uint64_t)&v81);
              if (v44)
              {
                unsigned int v45 = *v44;
                if (*v44 > *(_DWORD *)(a3 + 104))
                {
                  unsigned int v46 = *(_DWORD *)(v71 + 8);
                  if (!v46 || v45 <= v46)
                  {
                    *(_DWORD *)(a3 + 104) = v45;
                    unint64_t v47 = v83;
                    if (v83 > v43 - v41) {
                      goto LABEL_180;
                    }
                    *(void *)(a3 + 112) = v41;
                    *(void *)(a3 + 120) = v47;
                  }
                }
              }
              BOOL v38 = *(char **)v84;
              unint64_t v39 = v77;
              if (*(void *)v84 > (unint64_t)v77 || (unint64_t)v76 > *(void *)v84) {
                goto LABEL_180;
              }
              long long v76 = *(char **)v84;
              if (*(void *)v84 >= (unint64_t)v77) {
                goto LABEL_111;
              }
            }
            uint64_t result = 262153;
          }
        }
LABEL_134:
        v19 |= 0x10u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 5)
      {
        if ((v19 & 4) != 0) {
          goto LABEL_149;
        }
        *(void *)int v84 = 0xAAAAAAAAAAAAAAAALL;
        int v48 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v48)
        {
          if (sub_20DC11EF4((unint64_t *)&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 4u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x96463F78648862ALL && v22[8] == 1)
      {
        if ((v19 & 8) != 0) {
          goto LABEL_149;
        }
        *(void *)int v84 = 0xAAAAAAAAAAAAAAAALL;
        int v51 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v51)
        {
          if (sub_20DC11FC4((unint64_t *)&v76, v49, v50, a3)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 8u;
        if (result) {
          goto LABEL_176;
        }
      }
      else if (*(void *)v22 == 0x9010DF78648862ALL && v22[8] == 52)
      {
        if ((v19 & 0x20) != 0)
        {
LABEL_149:
          uint64_t result = 262149;
          goto LABEL_176;
        }
        v19 |= 0x20u;
      }
      else
      {
        uint64_t v29 = *(void *)v22;
        int v30 = v22[8];
        if (v29 != 0x9010DF78648862ALL || v30 != 15)
        {
LABEL_147:
          uint64_t result = 262150;
          goto LABEL_176;
        }
        if ((v19 & 0x40) != 0) {
          goto LABEL_149;
        }
        *(void *)int v84 = 0xAAAAAAAAAAAAAAAALL;
        int v32 = ccder_blob_decode_tl();
        uint64_t result = v73;
        if (v32)
        {
          if (sub_20DC1207C(&v76)) {
            uint64_t result = 0;
          }
          else {
            uint64_t result = v72;
          }
        }
        v19 |= 0x40u;
        if (result) {
          goto LABEL_176;
        }
      }
      if ((unint64_t)v20 > v80 || v79 > v20) {
        goto LABEL_180;
      }
      long long v79 = v20;
    }
    while ((unint64_t)v20 < v80);
    if ((~v19 & 3) == 0)
    {
      uint64_t v53 = ccder_sizeof_tag();
      uint64_t v54 = ccder_sizeof_len();
      BOOL v55 = __CFADD__(v53, v54);
      unint64_t v56 = v53 + v54;
      if (v55) {
        goto LABEL_182;
      }
      if (v56 > 0x14)
      {
        uint64_t result = 327689;
        goto LABEL_176;
      }
      memset(v84, 170, sizeof(v84));
      long long v81 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      long long v82 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v84, v56))
      {
        if (&v84[v56] <= (unsigned char *)&v85 && v84 <= &v84[v56])
        {
          long long v81 = v84;
          long long v82 = &v84[v56];
          uint64_t v57 = ccder_blob_encode_tl();
          if (!v57)
          {
            uint64_t result = 327688;
            goto LABEL_176;
          }
          unint64_t v58 = v9[1];
          BOOL v55 = __CFADD__(v58, 8);
          unint64_t v59 = v58 + 8;
          if (!v55)
          {
            unint64_t v60 = v9[2];
            BOOL v55 = __CFADD__(v59, v60);
            unint64_t v61 = v59 + v60;
            if (!v55)
            {
              BOOL v55 = __CFADD__(v61, 4);
              unint64_t v62 = v61 + 4;
              if (!v55 && v62 < 0xFFFFFFFFFFFFFFF8)
              {
                MEMORY[0x270FA5388](v57);
                v64 = (char *)&v69 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
                memset(v64, 170, ((v65 - 9) & 0xFFFFFFFFFFFFFFF8) + 8);
                ccdigest_init();
                ccdigest_update();
                ccdigest_update();
                uint64_t v13 = ((uint64_t (*)(unint64_t *, char *, _OWORD *))v9[7])(v9, v64, v86);
LABEL_159:
                uint64_t result = CMSBuildPath(v13, (uint64_t)a2, a3);
                switch((int)result)
                {
                  case 524293:
                  case 524295:
                    *(_DWORD *)(a3 + 168) = result;
                    return 0;
                  case 524294:
                    goto LABEL_176;
                  case 524296:
                    if (*(_DWORD *)(a3 + 168) != 458753) {
                      goto LABEL_167;
                    }
                    int v66 = 524296;
LABEL_166:
                    *(_DWORD *)(a3 + 168) = v66;
LABEL_167:
                    unint64_t v67 = *v9;
                    if (*v9 > 0x40) {
                      goto LABEL_180;
                    }
                    v75[0] = v86;
                    v75[1] = v67;
                    uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v75, v6);
                    if (!result || result == 655648 || result == 655632)
                    {
                      int v68 = *(_DWORD *)(a3 + 168);
                      if (!v68 || v68 == 458753 || v68 == 327681) {
                        *(_DWORD *)(a3 + 168) = result;
                      }
                      uint64_t result = 0;
                    }
                    break;
                  case 524297:
                    int v66 = 524297;
                    goto LABEL_166;
                  default:
                    if (result) {
                      goto LABEL_176;
                    }
                    goto LABEL_167;
                }
                goto LABEL_176;
              }
            }
          }
LABEL_182:
          __break(0x5500u);
          JUMPOUT(0x20DC11420);
        }
        goto LABEL_180;
      }
LABEL_181:
      __break(0x5513u);
    }
  }
  uint64_t result = 262156;
LABEL_176:
  if ((_OWORD *)*v15 == v86)
  {
    *unint64_t v15 = 0;
    *(void *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  v9[0] = 0;
  return sub_20DC114F0(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t sub_20DC114F0(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  long long v27 = v19;
  *(void *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if (result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0) {
    return result;
  }
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, long long *))validateSignerInfoAndChain);
  if (!result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v9[0] = 0;
  uint64_t v8 = 0;
  return sub_20DC114F0(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(unsigned __int8 *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  v7[0] = 0;
  return sub_20DC114F0(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t sub_20DC11798(unsigned __int8 **a1, unsigned char *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v4 = (unint64_t)a1[1];
  if ((unint64_t)v3 >= v4) {
    return 0;
  }
  if (v3 == (unsigned __int8 *)-1)
  {
LABEL_42:
    __break(0x5513u);
    JUMPOUT(0x20DC1195CLL);
  }
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
    goto LABEL_42;
  }
  *a1 = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (void)v5) < 1) {
          return 0;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        uint64_t v9 = v3 + 2;
        if (v5 > v9 || (unint64_t)v9 > v4) {
          goto LABEL_41;
        }
        *a1 = v9;
        unint64_t v7 = *v5;
        uint64_t v5 = v9;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (void)v5) < 2) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = (unint64_t)v3[1] << 8;
        uint64_t v12 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (void)v5) < 3) {
          return 0;
        }
        if ((unint64_t)v5 >= v4) {
          goto LABEL_41;
        }
        if (v3 == (unsigned __int8 *)-2) {
          goto LABEL_42;
        }
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4) {
          goto LABEL_41;
        }
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL) {
          goto LABEL_42;
        }
        unint64_t v10 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v10 > v4) {
          goto LABEL_41;
        }
        unint64_t v11 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v12 = v3[3];
LABEL_40:
        unint64_t v7 = v11 | v12;
        *a1 = v10;
        uint64_t v5 = v10;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7) {
    return 0;
  }
  *a3 = v7;
  return 1;
}

uint64_t sub_20DC1196C(unsigned __int8 **a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  int v30 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *a1;
  unint64_t v6 = (unint64_t)a1[1];
  if ((unint64_t)*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  int v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = (unint64_t)v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    long long v27 = (unint64_t **)(a4 + 1);
    long long v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!ccder_blob_decode_tag()) {
        return 0;
      }
      if (!v32) {
        goto LABEL_8;
      }
      if (!sub_20DC11798(&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010) {
        return 0;
      }
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25) {
        goto LABEL_44;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *unint64_t v17 = v15;
        *long long v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        *long long v23 = *a4;
        int v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        long long v20 = v27;
        if (!v7) {
          long long v20 = v19;
        }
        *long long v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }
        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, (unint64_t *)&v30, 0, 0)) {
        return 0;
      }
      if (v6 < (unint64_t)v5) {
        goto LABEL_43;
      }
      long long v21 = v30;
      uint64_t v22 = (unsigned __int8 *)(v30 - v5);
      if (v30 - v5 > v6 - (unint64_t)v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if ((unint64_t)v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = (unsigned __int8 *)v6;
      ++v12;
      if ((unint64_t)v21 < v6)
      {
        v15 += 304;
        uint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }
      goto LABEL_8;
    }
  }
}

uint64_t sub_20DC11C08(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3, int a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = sub_20DC11798(a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = sub_20DC11C08(a1, 0, 0, (char)(a4 - 1));
        if (!result) {
          return result;
        }
        return (sub_20DC100BC((unint64_t *)a1, 1) & 1) != 0;
      }
      return 0;
    }
    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = &v11[v13];
    if (v11 <= &v11[v13] && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_20DC11D44(char **a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if ((unint64_t)*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v3 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (v3 <= v3 - 0x5555555555555556) {
        return compare_octet_string_raw((uint64_t)&off_264129AB8, v3, 0xAAAAAAAAAAAAAAAALL) == 0;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_20DC11DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*(void *)a1 >= 0x5555555555555556uLL)
    {
      __break(0x5513u);
    }
    else if (*(void *)a1 - 0x5555555555555556 == *(void *)(a1 + 8))
    {
      uint64_t result = (uint64_t)find_digest(a4 + 24);
      if (result)
      {
        if (*(void *)(a4 + 136) != 0xAAAAAAAAAAAAAAAALL
          || *(void *)(*(uint64_t (**)(void))(result + 24))() != 0xAAAAAAAAAAAAAAAALL
          || memcmp(*(const void **)(a4 + 128), *(const void **)a1, 0xAAAAAAAAAAAAAAAALL))
        {
          *(_DWORD *)(a4 + 168) = 458754;
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_20DC11EF4(unint64_t *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_10;
  }
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    goto LABEL_7;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return result;
  }
  unint64_t v3 = v4;
  if (v4 > v5) {
LABEL_10:
  }
    __break(0x5519u);
  *a1 = v4;
  a1[1] = v5;
LABEL_7:
  if (v3 < 0x5555555555555556) {
    return v3 - 0x5555555555555556 == a1[1];
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_20DC11FC4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      if (v7 - 0x5555555555555556 != a1[1]) {
        return 0;
      }
      if (*(_DWORD *)(a4 + 104)) {
        return 1;
      }
      if (v7 <= v7 - 0x5555555555555556)
      {
        *(void *)(a4 + 112) = v7;
        *(void *)(a4 + 120) = 0xAAAAAAAAAAAAAAAALL;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_20DC1207C(void *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 >= 0x5555555555555556uLL) {
      __break(0x5513u);
    }
    else {
      return *a1 - 0x5555555555555556 == a1[1];
    }
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if (ccder_blob_decode_tl()) {
    return 0;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      unint64_t v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v11 = *a1;
    unint64_t v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v11;
      if (v16 < v11) {
        goto LABEL_42;
      }
      *a3 = v11;
      a3[1] = 0;
      int v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v12 = *a1;
    unint64_t v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v12;
      if (v17 < v12) {
        goto LABEL_42;
      }
      *a3 = v12;
      a3[1] = 0;
      int v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v13 = *a1;
    unint64_t v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v13;
      if (v18 < v13) {
        goto LABEL_42;
      }
      *a3 = v13;
      a3[1] = 0;
      int v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      int v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v14 = *a1;
    unint64_t v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v14;
      if (v19 < v14) {
        goto LABEL_42;
      }
      *a3 = v14;
      a3[1] = 0;
      int v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v15 = *a1;
    unint64_t v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      unint64_t v7 = v15;
      if (v20 < v15) {
        goto LABEL_42;
      }
      *a3 = v15;
      a3[1] = 0;
      int v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      int v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      _OWORD *v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!result)
  {
    uint64_t result = 720914;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return sub_20DC12ABC(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&unk_264129B18, 2);
}

uint64_t sub_20DC12ABC(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  __b[152] = *MEMORY[0x263EF8340];
  uint64_t result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if (result) {
    return result;
  }
  uint64_t result = 327690;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  uint64_t v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  uint64_t *v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if (result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  long long v24 = oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, (uint64_t)v24, v23 + 16, v23 + 40);
  if (result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0) {
      goto LABEL_35;
    }
    if (compare_octet_string_raw(v23 + 248, a9, a10)) {
      return 590085;
    }
  }
  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0;
  }
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if (result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  uint64_t result = sub_20DC139FC((uint64_t)v27, a7, a8);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return sub_20DC12ABC(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&unk_264129B18, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, unsigned char *a7, uint64_t a8, BOOL *a9)
{
  return sub_20DC12ABC(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&unk_264129B50, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, unsigned char *a9, uint64_t a10, BOOL *a11)
{
  return sub_20DC12ABC(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&unk_264129B88, 0x10000000000);
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, long long *a11)
{
  v41[116] = *MEMORY[0x263EF8340];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if (result) {
    return result;
  }
  if (v35 != v36) {
    return 327690;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    long long v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      long long v21 = &v38[1];
    }
    uint64_t *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    long long v31 = *a11;
    v32[0] = *((unsigned char *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(long long *)((char *)a11 + 24);
      long long v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }
    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      long long v27 = oidForPubKeyLength();
    }
    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        uint64_t result = 0;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      uint64_t v22 = (unsigned char *)v38[2];
      while (v22[265])
      {
        uint64_t v22 = (unsigned char *)*((void *)v22 + 34);
        if (!v22)
        {
          uint64_t v22 = (unsigned char *)v38[2];
          break;
        }
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = v39;
  }
  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, xmmword_264129BC0);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, xmmword_264129BF8);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, xmmword_264129C30);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, xmmword_264129C30);
}

uint64_t CTEvaluatePragueSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_20DC29D60;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v9 = 0xAAAAAAAA0000AA01;
  long long v8 = xmmword_20DC29D70;
  BYTE1(v9) = a5;
  long long v10 = 0u;
  long long v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13) {
          return 327704;
        }
        uint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0;
          uint64_t v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6) {
              return 327705;
            }
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
            if ((unint64_t)--v16 < v4) {
              goto LABEL_23;
            }
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1) {
    goto LABEL_41;
  }
  unint64_t v9 = (unsigned char *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0;
    uint64_t v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4) {
          continue;
        }
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  uint64_t v10 = 0;
LABEL_23:
  if (v10 == a2) {
    return 0;
  }
  else {
    return 589829;
  }
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = 327702;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(void, int *, uint64_t))sub_20DC134C4, (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }
  return v3;
}

uint64_t sub_20DC134C4(uint64_t result, void *a2, unint64_t a3)
{
  if (result != 2) {
    return 1;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  if (&v4[v5] == (char *)-1) {
    goto LABEL_50;
  }
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if (result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1;
        }
        unint64_t v14 = (unsigned char *)*a2;
        if (*(unsigned char *)*a2 != 42) {
          return 1;
        }
        if (v14 != (unsigned char *)-1)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL) {
              uint64_t v16 = (uint64_t)v14;
            }
            uint64_t v17 = -v16;
            uint64_t v18 = 2;
            uint64_t result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1;
                }
                size_t v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }
                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!result) {
                    goto LABEL_48;
                  }
                }
                if (v11 != 46) {
                  return 1;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18) {
                return result;
              }
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      uint64_t result = 0;
      *(unsigned char *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v20 = 0xAAAAAAAA00AAAA01;
  unint64_t v21 = &null_octet;
  long long v19 = xmmword_20DC29D80;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  long long v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!result)
  {
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    _OWORD v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }
  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3)) {
    return 0;
  }
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKTestRootSKID)) {
    return compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&SEKProdRootSKID) == 0;
  }
  return 2;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0, 0, 0, 0, xmmword_264129C68), result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, (uint64_t)&unk_20DC29A64, 97, 0, 0, xmmword_264129C68);
      }
    }
  }
  return result;
}

uint64_t sub_20DC139FC(uint64_t result, unsigned char *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6) {
        continue;
      }
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1) {
    goto LABEL_31;
  }
  unint64_t v8 = v7 + 1;
  int v3 = 327693;
  uint64_t result = 327693;
  if ((unint64_t)(v7 + 1) >= v6) {
    return result;
  }
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (void)v8)) {
    goto LABEL_31;
  }
  if (v6 - (void)v8 != 2 * a3) {
    return (v3 + 1);
  }
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  BOOL v9 = v7 + 2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3]) {
      return result;
    }
    int v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8) {
      goto LABEL_34;
    }
    size_t v12 = &asciiNibbleToByte[*v11];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v12 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v12 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    if (v11 < v7) {
      goto LABEL_34;
    }
    unint64_t v14 = &asciiNibbleToByte[*v9];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v14 >= (unsigned __int8 *)&CTOidAppleImg4Manifest || v14 < asciiNibbleToByte) {
      goto LABEL_34;
    }
    unsigned int v15 = *v12;
    uint64_t result = 327695;
    if (v15 > 0xF) {
      return result;
    }
    unsigned int v16 = *v14;
    if (v16 > 0xF) {
      return result;
    }
    if (v10 < a2) {
      goto LABEL_34;
    }
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9) {
      goto LABEL_31;
    }
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!sub_20DC14508(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (sub_20DC14620() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0 || (sub_20DC146F0(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0) {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (sub_20DC147C0(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (sub_20DC148E8(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (sub_20DC149AC(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (sub_20DC14ABC(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!sub_20DC14B90((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = sub_20DC14C1C((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_20DC14508(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t sub_20DC14620()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t sub_20DC146F0(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = sub_20DC14508(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_20DC147C0(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_20DC148E8(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_20DC149AC(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t sub_20DC14ABC(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_20DC14B90(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      void *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_20DC14C1C(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return sub_20DC16DB8(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)sub_20DC16FDC((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return sub_20DC16B48((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return sub_20DC16C2C();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return sub_20DC16788((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = sub_20DC14508((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return sub_20DC168C4((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return sub_20DC16A5C((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }

  return sub_20DC16E88((unint64_t *)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (!ccder_blob_decode_tl()) {
    return v10;
  }
  if (!ccder_blob_decode_tl()) {
    return 655363;
  }
  if (v14 >= 0x5555555555555556) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl()) {
    return 655362;
  }
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  unint64_t v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  if (!ccder_blob_decode_bitstring()) {
    return 655364;
  }
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15) {
    return 0;
  }
  else {
    return 655365;
  }
}

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = 327691;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v16 = 0uLL;
  long long v15 = 0uLL;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v7 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v16, (unint64_t *)&v15, &v13);
  if (v7) {
    return v7;
  }
  uint64_t v7 = 655632;
  int v9 = compare_octet_string((uint64_t)&v16, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string((uint64_t)&v16, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return 655617;
    }
  }
  unint64_t v12 = v10;
  if (((a1 & 1) == 0 || compare_octet_string_raw(a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw(a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw(a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw(a4, &CTOidSha512, 9uLL)))
  {
    return v7;
  }
  uint64_t result = v13;
  if ((v14 || !v13) && (a3[1] || !*a3))
  {
    if (v12(v13)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10[2] = v6;
  v10[3] = v6;
  v10[0] = v6;
  v10[1] = v6;
  v9[0] = v10;
  v9[1] = 64;
  v8[0] = 0;
  v8[1] = 0;
  uint64_t result = sub_20DC15CDC(a3, a4, (uint64_t)v9, v8);
  if (!result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v9, (uint64_t)v8);
  }
  return result;
}

uint64_t sub_20DC15CDC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if (result) {
    return 656640;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[2] = v7;
  v16[3] = v7;
  v16[0] = v7;
  v16[1] = v7;
  uint64_t v14 = v16;
  uint64_t v15 = 64;
  long long v13 = 0uLL;
  uint64_t v8 = sub_20DC15CDC(a4, a5, (uint64_t)&v14, &v13);
  if (v8) {
    return v8;
  }
  uint64_t v8 = 655617;
  int v9 = compare_octet_string(a2, (uint64_t)&rsaEncryption);
  uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureRSA;
  if (v9)
  {
    int v11 = compare_octet_string(a2, (uint64_t)&ecPublicKey);
    uint64_t v10 = (unsigned int (*)(uint64_t))validateSignatureEC;
    if (v11) {
      return v8;
    }
  }
  uint64_t result = *a1;
  if ((a1[1] || !result) && (!v14 || v15))
  {
    if (v10(result)) {
      return 0;
    }
    else {
      return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0;
    }
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0) {
      break;
    }
    if ((a2(v9[0], &v9[1], a3) & 1) == 0) {
      return 0;
    }
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  uint64_t v6 = 720901;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20) {
        return 720898;
      }
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl()) {
          return 720899;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        if (!ccder_blob_decode_tl()) {
          return 720900;
        }
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(unsigned char *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
              if (!ccder_blob_decode_tl()) {
                return v6;
              }
            }
          }
          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }
        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }
      if (v2 != v7) {
        return 720903;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4) {
    return 720904;
  }
  if (a2[1] && *a2) {
    return 0;
  }
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0;
  v6[1] = *MEMORY[0x263EF8340];
  time_t v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return sub_20DC16664(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x263EF8340];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!result) {
    return sub_20DC16664(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0);

  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  time_t v6[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = 720906;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6)) {
        return 720907;
      }
      if (ccder_blob_decode_Time(v6)) {
        return 0;
      }
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_20DC16664(const char **a1, time_t *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = 720909;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF) {
    return v2;
  }
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }
  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  int v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(void)*a1]) {
      return 720910;
    }
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911;
    }
    uint64_t v2 = 0;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL sub_20DC16788(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t sub_20DC168C4(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_20DC16A5C(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_20DC16B48(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_20DC16C2C()
{
  return 0;
}

uint64_t sub_20DC16DB8(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t sub_20DC16E88(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *sub_20DC16FDC(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if (result) {
        return result;
      }
      if (v10)
      {
        if ((unint64_t)v16 < a2) {
          goto LABEL_30;
        }
        if ((unint64_t)(v14 + 4) > v11) {
          goto LABEL_30;
        }
        unint64_t v17 = (void *)*v13;
        *BOOL v14 = 0;
        v14[1] = v17;
        if (v14 != (void *)272 && (unint64_t)v16 >= v11) {
          goto LABEL_30;
        }
        *unint64_t v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }
      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }
      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
    if (*(void *)(i + 192) && !compare_octet_string(a2, i + 184)) {
      break;
    }
  }
  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      uint64_t v2 = (void *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if (result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (sub_20DC17364(v10, 1)) {
            return 0;
          }
          uint64_t v15 = sub_20DC173FC(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (v15) {
            return 0;
          }
          else {
            return v16;
          }
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }
      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0;
      if (!v14) {
        return result;
      }
    }
    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }
    return 524297;
  }
  return result;
}

uint64_t sub_20DC17364(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!result) {
        return v7;
      }
      if (!--v3) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_20DC173FC(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!result) {
        return v5;
      }
      if (!--v1) {
        return 0;
      }
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  v35[4] = *MEMORY[0x263EF8340];
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208)) {
          return 327701;
        }
        uint64_t v8 = *v6;
      }
    }
  }
  if (v8)
  {
    unint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }
      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(unsigned char *)(a3 + 16))
      {
        uint64_t v20 = sub_20DC17364(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t v20 = sub_20DC173FC(v8 + 168);
      }
      unint64_t v14 = v20;
      v33 |= v20 != 0;
      unint64_t v15 = v20 + 304;
      if (v20) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(unsigned char *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(unsigned char *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }
        if ((*(unsigned char *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }
      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }
      if (*(unsigned char *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        if (compare_octet_string(v8 + 168, v14 + 184)) {
          return v12 | 0x9000Au;
        }
      }
      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(unsigned char *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }
          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40);
        if (result) {
          return result;
        }
      }
      unint64_t v21 = v11 + 1;
      if (v11 == -1) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }
  unint64_t v21 = 0;
  uint64_t v13 = -1;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if (v8)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(void *)a3 != v22) {
      return (v22 << 8) | 0x90006u;
    }
  }
  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(unsigned char *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184;
    if (v8) {
      uint64_t v27 = 168;
    }
    uint64_t v28 = sub_20DC17364(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40))
    {
      goto LABEL_87;
    }
    int v26 = 589836;
    return v24 | v26;
  }
  int v24 = v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(unsigned char *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), v25 + 16, v25 + 40))goto LABEL_72; {
  }
    }
  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }
LABEL_87:
  uint64_t result = 0;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

BOOL sub_20DC1799C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [NSString stringWithUTF8String:a2];
  if (!objc_msgSend_caseInsensitiveCompare_(a1, v6, v5, v7)) {
    return 1;
  }
  unint64_t v10 = 0;
  do
  {
    unint64_t v11 = v10;
    if (v10 == 14) {
      break;
    }
    uint64_t v12 = [NSString stringWithUTF8String:(uint64_t)off_264129CB0[v10 + 1]];
    uint64_t v15 = [a1 caseInsensitiveCompare:v13 options:v12 range:v14];
    unint64_t v10 = v11 + 1;
  }
  while (v15);
  return v11 < 0xE;
}

void sub_20DC17C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20DC17CAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_20DC17CBC(uint64_t a1)
{
}

void sub_20DC17CC4(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = NSNumber;
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  uint64_t v7 = [v3 numberWithLongLong:v5, v4, v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t sub_20DC17DC8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v7 = (const char *)[v3 v4:v5 v6];

  return sqlite3_bind_text(a2, 1, v7, -1, 0);
}

uint64_t sub_20DC17EE0(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = *(id *)(a1 + 32);
  uint64_t v8 = (const char *)[v4 v5 v6 v7];
  sqlite3_bind_text(a2, 1, v8, -1, 0);
  id v9 = *(id *)(a1 + 40);
  uint64_t v13 = (const char *)[v9 v10 v11 v12];

  return sqlite3_bind_text(a2, 2, v13, -1, 0);
}

void sub_20DC180BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20DC180D4(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v7 = (const char *)[v3 v4:v5 v6];

  return sqlite3_bind_text(a2, 1, v7, -1, 0);
}

void sub_20DC18124(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = (uint64_t)sqlite3_column_text(a2, 0);
  if (v3)
  {
    uint64_t v3 = [NSString stringWithUTF8String:v4];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

uint64_t sub_20DC1890C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1;
}

void *MISProfileGetValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (MISProfileValidateSignature_0(v3)
    || (objc_msgSend_payload(v3, v4, v5, v6), uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v12 = [v3 v9:v10 v11];
    uint64_t v7 = [v12 objectForKeyedSubscript:v13];
  }
  return v7;
}

uint64_t MISProfileValidateSignature_0(void *a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  uint64_t v5 = [v1 v2:v3 v4:v4];

  if (!v5)
  {
    uint64_t fixed = 3892346883;
    CFDataRef v8 = (const __CFData *)v1[1];
    if (!v8)
    {
      uint64_t v6 = 3892346884;
      goto LABEL_40;
    }
    if (qword_26772D3A8 != -1) {
      dispatch_once(&qword_26772D3A8, &unk_26C249630);
    }
    id v9 = (id)qword_26772D3A0;
    CFDataRef v12 = sub_20DC1B790(v8);
    if (!v12 || !v9)
    {
      unint64_t v21 = sub_20DBFFB10();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v21, OS_LOG_TYPE_ERROR, "Failure creating profile cache key.", buf, 2u);
      }

      CFDataRef v19 = 0;
      uint64_t v6 = 3892346890;
      goto LABEL_39;
    }
    uint64_t v13 = [v9 objectForKey:v10];
    unint64_t v17 = v13;
    if (v13)
    {
      uint64_t v18 = [v13 v14:v15 v16];
      CFDataRef v19 = sub_20DC1BE9C(v8);
      uint64_t v20 = 0;
    }
    else
    {
      unint64_t v22 = (const void *)SecPolicyCreateiPhoneProvisioningProfileSigning();
      int v23 = sub_20DC1BF7C();
      CFRelease(v22);
      if (v23)
      {
        ApplePinned = (const void *)SecPolicyCreateApplePinned();
        int v25 = sub_20DC1BF7C();
        CFRelease(ApplePinned);
        if (v25)
        {
          OSXProvisioningProfileSigning = (const void *)SecPolicyCreateOSXProvisioningProfileSigning();
          uint64_t v6 = sub_20DC1BF7C();
          CFRelease(OSXProvisioningProfileSigning);
          if (v6)
          {
            uint64_t v18 = 0;
            CFDataRef v19 = 0;
            goto LABEL_23;
          }
          uint64_t v18 = 2;
        }
        else
        {
          uint64_t v18 = 1;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      CFDataRef v19 = sub_20DC1BE9C(v8);
      uint64_t v20 = [NSNumber numberWithInt:v27, v18, v28];
      [v9 setObject:v29 forKey:(uint64_t)v20];
    }

    uint64_t v6 = 0;
LABEL_23:

    if (v6)
    {
LABEL_39:

      goto LABEL_40;
    }
    [v1 setFlavor:v30 flavor:v18 flavor:v31];
    if (!v19)
    {
      uint64_t v6 = 3892346906;
      goto LABEL_40;
    }
    CFErrorRef error = 0;
    if (objc_msgSend_flavor(v1, v32, v33, v34)
      && objc_msgSend_flavor(v1, v35, v36, v37) != 2)
    {
      uint64_t v39 = CFPropertyListCreateWithDERData();
      if (!v39) {
        goto LABEL_38;
      }
      unint64_t v42 = (const void *)v39;
      unint64_t v38 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v40, v39, v41];
      CFRelease(v42);
    }
    else
    {
      unint64_t v38 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v19, 2uLL, 0, &error);
    }
    if (error)
    {
      if (v38) {
        CFRelease(v38);
      }
      unint64_t v43 = sub_20DBFFB10();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v54 = error;
        _os_log_error_impl(&dword_20DBFC000, v43, OS_LOG_TYPE_ERROR, "Error parsing profile payload: %@", buf, 0xCu);
      }

      CFErrorRef v44 = error;
    }
    else
    {
      if (!v38) {
        goto LABEL_38;
      }
      CFTypeID v46 = CFGetTypeID(v38);
      if (v46 == CFDictionaryGetTypeID())
      {
        [v1 setPayload:v47 payloadSize:(uint64_t)v38 payloadType:v48];

        uint64_t fixed = [v1 v49:v50 v51:v51];
        goto LABEL_38;
      }
      CFErrorRef v44 = (CFErrorRef)v38;
    }
    CFRelease(v44);
LABEL_38:
    uint64_t v6 = fixed;
    goto LABEL_39;
  }
  uint64_t v6 = 0;
LABEL_40:

  return v6;
}

MISProfile *MISProfileCreate()
{
  uint64_t v2 = objc_alloc_init(MISProfile);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v0];
    [v2 setPayload:v4 withValue:(uint64_t)v3 forKey:v5];
  }
  return v2;
}

MISProfile *MISProfileCreateWithData(uint64_t a1, const void *a2)
{
  uint64_t v3 = objc_alloc_init(MISProfile);
  if (v3)
  {
    uint64_t v4 = (NSData *)CFRetain(a2);
    signature = v3->signature;
    v3->signature = v4;

    MISProfileValidateSignature_0(v3);
  }
  return v3;
}

MISProfile *MISProfileCreateWithFile(uint64_t a1, const char *a2)
{
  [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a2 options:1 error:0];
  uint64_t result = (MISProfile *)objc_claimAutoreleasedReturnValue();
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = MISProfileCreateWithData((uint64_t)result, result);
    CFRelease(v3);
    return v4;
  }
  return result;
}

MISProfile *MISProfileCreateMutableCopy(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (MISProfileValidateSignature_0(v2))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_alloc_init(MISProfile);
    if (v3)
    {
      uint64_t v7 = [v2 v4:v5 v6:v6];

      if (v7)
      {
        uint64_t v11 = (void *)MEMORY[0x263EFF9A0];
        CFDataRef v12 = [v2 v8:v9 v10];
        uint64_t v15 = [v11 dictionaryWithDictionary:v13];
        [v3 setPayload:v16 withPayloadSize:(uint64_t)v15 withPayloadData:v17];
      }
    }
  }

  return v3;
}

BOOL MISProfileIsMutable(uint64_t a1)
{
  return *(void *)(a1 + 8) == 0;
}

uint64_t MISProfileSignWithKeyAndCertificates(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = 3892346890;
  id v2 = a1;
  uint64_t v6 = v2;
  if (v2[1])
  {
    uint64_t v1 = 3892346883;
  }
  else
  {
    CFErrorRef error = 0;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v8 = [v2 v3:v4 v5];
    CFDataRef v9 = CFPropertyListCreateData(v7, v8, kCFPropertyListXMLFormat_v1_0, 0, &error);

    if (error)
    {
      if (v9) {
        CFRelease(v9);
      }
      uint64_t v10 = sub_20DBFFB10();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v15 = error;
        _os_log_error_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_ERROR, "Failure creating profile payload data: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    else if (v9)
    {
      uint64_t v11 = (void *)v6[1];
      v6[1] = 0;

      CFRelease(v9);
      uint64_t v1 = 49197;
    }
  }

  return v1;
}

uint64_t MISProfileSignWithRSACallBack(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = 3892346890;
  id v2 = a1;
  uint64_t v6 = v2;
  if (v2[1])
  {
    uint64_t v1 = 3892346883;
  }
  else
  {
    CFErrorRef error = 0;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v8 = [v2 v3:v4 v5];
    CFDataRef v9 = CFPropertyListCreateData(v7, v8, kCFPropertyListXMLFormat_v1_0, 0, &error);

    if (error)
    {
      if (v9) {
        CFRelease(v9);
      }
      uint64_t v10 = sub_20DBFFB10();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v15 = error;
        _os_log_error_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_ERROR, "Failure creating profile payload data: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    else if (v9)
    {
      uint64_t v11 = (void *)v6[1];
      v6[1] = 0;

      CFRelease(v9);
      uint64_t v1 = 49197;
    }
  }

  return v1;
}

uint64_t MISProfileCopySignerSubjectSummary(uint64_t a1, CFStringRef *a2)
{
  if (!a2) {
    return 49174;
  }
  uint64_t v3 = 3892346883;
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  int v5 = SecCMSVerify();
  if (v5 == -26275)
  {
LABEL_10:
    CFRelease(BasicX509);
    return v3;
  }
  if (!v5)
  {
    CFArrayRef v6 = SecTrustCopyCertificateChain(0);
    ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v6, 0);
    if (ValueAtIndex)
    {
      uint64_t v3 = 0;
      *a2 = SecCertificateCopySubjectSummary(ValueAtIndex);
    }
    else
    {
      uint64_t v3 = 3892346884;
    }
    CFRelease(v6);
    CFRelease(0);
    goto LABEL_10;
  }
  CFRelease(BasicX509);
  return 3892346906;
}

void *MISProfileCreateDataRepresentation(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (v1) {
    id v2 = v1;
  }
  return v1;
}

uint64_t MISProfileWriteToFile(uint64_t a1, const char *a2)
{
  id v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 3892346884;
  }
  [v2 writeToFile:a2 atomically:0];
  return 0;
}

uint64_t MISProfileSetValue(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v5 = 3892346882;
  CFArrayRef v6 = a1;
  uint64_t v10 = v6;
  if (!v6[1])
  {
    uint64_t v11 = [v6 v7:v8 v9];

    if (v11)
    {
      CFDataRef v12 = (void *)CFRetain(a3);
      uint64_t v16 = [v10 v13:v14 v15];
      [v16 setObject:v17 forKeyedSubscript:(uint64_t)v12];

      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 3892346883;
    }
  }

  return v5;
}

uint64_t MISProfileRemoveValue(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1[1]) {
    return 3892346882;
  }
  CFArrayRef v6 = [a1 a2:a3 a4:a4];
  [v6 removeObjectForKey:v7];

  return 0;
}

uint64_t MISProfileSetPayload(void *a1, uint64_t a2)
{
  if (a1[1]) {
    return 3892346882;
  }
  uint64_t v4 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v5 = a1;
  uint64_t v8 = [v4 dictionaryWithDictionary:a2];
  [v5 setPayload:v9 payloadSize:(uint64_t)v8 payloadData:v10];

  return 0;
}

CFDictionaryRef MISProfileCopyPayload(void *a1)
{
  id v1 = a1;
  if (MISProfileValidateSignature_0(v1))
  {
    CFDictionaryRef Copy = 0;
  }
  else
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    [v1 v2 v3 v4];
    CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef Copy = CFDictionaryCreateCopy(v6, v7);
  }
  return Copy;
}

uint64_t MISProfileGetTypeID()
{
  uint64_t v0 = sub_20DBFFB10();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_fault_impl(&dword_20DBFC000, v0, OS_LOG_TYPE_FAULT, "MISProfileGetTypeID is not supported, the results this function returns is wrong and should not be relied on", v2, 2u);
  }

  return 0;
}

uint64_t MISProfileValidateSignatureWithAnchors()
{
  uint64_t v0 = sub_20DBFFB10();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_fault_impl(&dword_20DBFC000, v0, OS_LOG_TYPE_FAULT, "This function is not supported, and does not behave as you expect. Use MISProfileValidateSignature.", v2, 2u);
  }

  return 3892346884;
}

uint64_t MISProfileValidateSignatureWithAnchorsAndPolicy()
{
  uint64_t v0 = sub_20DBFFB10();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_fault_impl(&dword_20DBFC000, v0, OS_LOG_TYPE_FAULT, "This function is not supported, and does not behave as you expect. Use MISProfileValidateSignature.", v2, 2u);
  }

  return 3892346884;
}

uint64_t MISProfileIsDEREncoded(void *a1)
{
  id v1 = a1;
  if (MISProfileValidateSignature_0(v1))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v1 v2:v3:v4];

    if (v5) {
      uint64_t v5 = [v1 v6:v7:v8] == 1;
    }
  }

  return v5;
}

uint64_t sub_20DC1A1C8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = bswap64(*a2);
  unint64_t v4 = bswap64(*a3);
  if (v3 == v4)
  {
    unint64_t v3 = bswap64(a2[1]);
    unint64_t v4 = bswap64(a3[1]);
    if (v3 == v4)
    {
      unint64_t v3 = bswap64(a2[2]);
      unint64_t v4 = bswap64(a3[2]);
      if (v3 == v4)
      {
        unint64_t v3 = bswap64(a2[3]);
        unint64_t v4 = bswap64(a3[3]);
        if (v3 == v4) {
          return 0;
        }
      }
    }
  }
  if (v3 < v4) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

MISProfile *MISProfileCreateForProvisioning(const __CFAllocator *a1)
{
  id v2 = MISProfileCreate();
  if (v2) {
    sub_20DC1A27C(a1, v2);
  }
  return v2;
}

void sub_20DC1A27C(const __CFAllocator *a1, void *a2)
{
  CFUUIDRef v4 = CFUUIDCreate(a1);
  CFStringRef v5 = CFUUIDCreateString(a1, v4);
  MISProfileSetValue(a2, @"UUID", v5);
  CFRelease(v5);
  CFRelease(v4);
  int valuePtr = 1;
  CFNumberRef v6 = CFNumberCreate(a1, kCFNumberIntType, &valuePtr);
  MISProfileSetValue(a2, @"Version", v6);
  CFRelease(v6);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v8 = CFDateCreate(a1, Current);
  MISProfileSetValue(a2, @"CreationDate", v8);
  CFRelease(v8);
}

MISProfile *MISProvisioningProfileCreateMutableCopy(const __CFAllocator *a1, void *a2)
{
  MutableCFDictionaryRef Copy = MISProfileCreateMutableCopy((uint64_t)a1, a2);
  if (MutableCopy)
  {
    sub_20DC1A27C(a1, MutableCopy);
    CFNumberRef Value = (const __CFNumber *)MISProfileGetValue(MutableCopy, @"TimeToLive");
    if (Value)
    {
      CFNumberRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        unsigned int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if (sub_20DC1A3F8(MutableCopy, valuePtr))
        {
          CFRelease(MutableCopy);
          return 0;
        }
      }
    }
  }
  return MutableCopy;
}

uint64_t sub_20DC1A3F8(void *a1, uint64_t a2)
{
  uint64_t v4 = 3892346883;
  CFNumberRef Value = MISProfileGetValue(a1, @"CreationDate");
  if (Value)
  {
    CFTypeID v6 = Value;
    uint64_t v7 = CFCalendarCopyCurrent();
    CFAbsoluteTime at = MEMORY[0x210566C90](v6);
    CFCalendarAddComponents(v7, &at, 0, "d", a2);
    CFRelease(v7);
    CFAllocatorRef v8 = CFGetAllocator(a1);
    CFDateRef v9 = CFDateCreate(v8, at);
    if (v9)
    {
      CFDateRef v10 = v9;
      uint64_t v4 = MISProfileSetValue(a1, @"ExpirationDate", v9);
      CFRelease(v10);
    }
    else
    {
      return 3892346890;
    }
  }
  return v4;
}

uint64_t MISProvisioningProfileAddProvisionedDevice(void *a1, const void *a2)
{
  uint64_t v2 = 3892346882;
  if (!a1[1])
  {
    CFNumberRef Value = (__CFArray *)MISProfileGetValue(a1, @"ProvisionedDevices");
    if (Value)
    {
      uint64_t v7 = Value;
      CFTypeID v8 = CFGetTypeID(Value);
      if (v8 == CFArrayGetTypeID())
      {
        CFArrayAppendValue(v7, a2);
        return 0;
      }
      else
      {
        return 3892346883;
      }
    }
    else
    {
      CFAllocatorRef v9 = CFGetAllocator(a1);
      Mutable = CFArrayCreateMutable(v9, 0, MEMORY[0x263EFFF70]);
      if (Mutable)
      {
        uint64_t v11 = Mutable;
        CFArrayAppendValue(Mutable, a2);
        uint64_t v2 = MISProfileSetValue(a1, @"ProvisionedDevices", v11);
        CFRelease(v11);
      }
      else
      {
        return 3892346890;
      }
    }
  }
  return v2;
}

uint64_t MISProvisioningProfileAddEntitlement(void *a1, const void *a2, const void *a3)
{
  uint64_t v3 = 3892346882;
  if (!a1[1])
  {
    CFNumberRef Value = (__CFDictionary *)MISProfileGetValue(a1, @"Entitlements");
    if (Value)
    {
      CFAllocatorRef v9 = Value;
      CFTypeID v10 = CFGetTypeID(Value);
      if (v10 == CFDictionaryGetTypeID())
      {
        CFDictionarySetValue(v9, a2, a3);
        return 0;
      }
      else
      {
        return 3892346883;
      }
    }
    else
    {
      CFAllocatorRef v11 = CFGetAllocator(a1);
      Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        uint64_t v13 = Mutable;
        CFDictionarySetValue(Mutable, a2, a3);
        uint64_t v3 = MISProfileSetValue(a1, @"Entitlements", v13);
        CFRelease(v13);
      }
      else
      {
        return 3892346890;
      }
    }
  }
  return v3;
}

uint64_t MISProvisioningProfileIsAppleInternalProfile(void *a1)
{
  uint64_t v2 = MISProvisioningProfileGetTeamIdentifier(a1);
  if (objc_msgSend_caseInsensitiveCompare_(v2, v3, @"243LU875E5", v4)) {
    uint64_t v5 = sub_20DC1A75C(a1, @"AppleInternalProfile");
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

const void *MISProvisioningProfileGetTeamIdentifier(void *a1)
{
  CFArrayRef Value = (const __CFArray *)MISProfileGetValue(a1, @"TeamIdentifier");
  if (!Value) {
    return 0;
  }
  CFArrayRef v2 = Value;
  if (CFArrayGetCount(Value) != 1) {
    return 0;
  }

  return CFArrayGetValueAtIndex(v2, 0);
}

uint64_t sub_20DC1A75C(void *a1, uint64_t a2)
{
  CFBooleanRef Value = (const __CFBoolean *)MISProfileGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFBooleanGetTypeID()) {
    return 0;
  }

  return CFBooleanGetValue(v3);
}

uint64_t MISProvisioningProfileSetProvisionsAllDevices(void *a1)
{
  return MISProfileSetValue(a1, @"ProvisionsAllDevices", (const void *)*MEMORY[0x263EFFB40]);
}

uint64_t MISProvisioningProfileProvisionsAllDevices(void *a1)
{
  return sub_20DC1A75C(a1, @"ProvisionsAllDevices");
}

uint64_t MISProvisioningProfileIncludesDevice(void *a1, const __CFString *a2)
{
  if (sub_20DC1A75C(a1, @"ProvisionsAllDevices")) {
    return 1;
  }
  CFArrayRef Value = (const __CFArray *)MISProfileGetValue(a1, @"ProvisionedDevices");
  if (!Value) {
    return 0;
  }
  CFArrayRef v6 = Value;
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 != CFArrayGetTypeID()) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(v6);
  if (Count < 1) {
    return 0;
  }
  CFIndex v9 = Count;
  CFIndex v10 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v10);
    uint64_t v4 = 1;
    if (CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo) {
      break;
    }
    if (v9 == ++v10) {
      return 0;
    }
  }
  return v4;
}

BOOL MISProvisioningProfileIncludesPlatform(void *a1, const __CFString *a2, uint64_t a3)
{
  CFArrayRef Value = (const __CFArray *)MISProfileGetValue(a1, @"Platform");
  if (Value)
  {
    CFArrayRef v6 = Value;
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount(v6);
      if (Count < 1)
      {
        return 0;
      }
      else
      {
        CFIndex v9 = Count;
        CFIndex v10 = 0;
        BOOL v11 = 1;
        do
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v10);
          if (ValueAtIndex && (CFStringRef v13 = ValueAtIndex, v14 = CFGetTypeID(ValueAtIndex), v14 == CFStringGetTypeID()))
          {
            if (CFStringCompare(v13, a2, 1uLL) == kCFCompareEqualTo) {
              return v11;
            }
          }
          else
          {
            uint64_t v15 = sub_20DBFFB10();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v18 = 0;
              _os_log_impl(&dword_20DBFC000, v15, OS_LOG_TYPE_DEFAULT, "Encountered a null or non-string platform identifier.", v18, 2u);
            }
          }
          BOOL v11 = ++v10 < v9;
        }
        while (v9 != v10);
      }
      return v11;
    }
    else
    {
      uint64_t v16 = sub_20DBFFB10();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DBFC000, v16, OS_LOG_TYPE_DEFAULT, "Encountered a non-array value for 'Platforms'.", buf, 2u);
      }

      return 0;
    }
  }
  return a3;
}

uint64_t MISProvisioningProfileGrantsEntitlement(void *a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x263EF8340];
  CFArrayRef Value = MISProfileGetValue(a1, @"Entitlements");
  if (!Value) {
    return MISProvisioningProfileIsAppleInternalProfile(a1);
  }
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 != CFDictionaryGetTypeID()) {
    return MISProvisioningProfileIsAppleInternalProfile(a1);
  }
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v25 = v9;
  v26[0] = v10;
  CFDataRef v12 = [NSDictionary dictionaryWithObjects:v11 forKeys:(uint64_t)v26 count:(uint64_t)&v25];
  int v24 = 0;
  uint64_t v13 = CESerializeCFDictionary();
  CFTypeID v14 = (void *)MEMORY[0x263F8BAF0];
  if (v13 != *MEMORY[0x263F8BAF0])
  {
    uint64_t v15 = sub_20DBFFB10();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v15, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", buf, 2u);
    }
LABEL_10:
    BOOL v20 = 0;
    goto LABEL_11;
  }
  uint64_t v15 = v24;
  *(void *)buf = 0;
  if (CEManagedContextFromCFData() != *v14)
  {
    CFDataRef v19 = sub_20DBFFB10();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v22 = 0;
      _os_log_error_impl(&dword_20DBFC000, v19, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", v22, 2u);
    }

    goto LABEL_10;
  }
  [objc_msgSend_derEntitlements(v8, v16, v17, v18)];
  BOOL v20 = CEContextIsSubset() == *v14;
  CEReleaseManagedContext();
LABEL_11:

  if (v20) {
    return 1;
  }
  return MISProvisioningProfileIsAppleInternalProfile(a1);
}

uint64_t MISProvisioningProfileSetApplicationIdentifierPrefixes(void *a1, const void *a2)
{
  return MISProfileSetValue(a1, @"ApplicationIdentifierPrefix", a2);
}

CFArrayRef MISProvisioningProfileCopyApplicationIdentifierPrefixes(void *a1)
{
  CFArrayRef result = (CFArrayRef)MISProfileGetValue(a1, @"ApplicationIdentifierPrefix");
  if (result)
  {
    CFArrayRef v2 = result;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    return CFArrayCreateCopy(v3, v2);
  }
  return result;
}

uint64_t MISProvisioningProfileSetTimeToLive(void *a1, unsigned int a2)
{
  unsigned int valuePtr = a2;
  CFAllocatorRef v3 = CFGetAllocator(a1);
  CFNumberRef v4 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  uint64_t v5 = MISProfileSetValue(a1, @"TimeToLive", v4);
  CFRelease(v4);
  if (!v5)
  {
    uint64_t v5 = sub_20DC1A3F8(a1, valuePtr);
    if (v5) {
      MISProfileRemoveValue(a1, (const char *)@"TimeToLive", v6, v7);
    }
  }
  return v5;
}

BOOL MISProvisioningProfileHasPPQExemption(void *a1)
{
  if (sub_20DC1A75C(a1, @"LocalProvision")) {
    return 0;
  }
  if (sub_20DC1A75C(a1, @"ProvisionsAllDevices"))
  {
    CFAllocatorRef v3 = MISProfileGetValue(a1, @"AppAudience");
    uint64_t v6 = v3;
    BOOL v2 = v3
      && objc_msgSend_containsObject_(v3, v4, @"InternalBuild", v5)
      && (CFBooleanRef v7 = (const __CFBoolean *)sub_20DC1AE00(a1)) != 0
      && CFBooleanGetValue(v7) == 0;
  }
  else
  {
    CFBooleanRef v8 = (const __CFBoolean *)sub_20DC1AE00(a1);
    return !v8 || CFBooleanGetValue(v8) == 0;
  }
  return v2;
}

void *sub_20DC1AE00(void *a1)
{
  CFArrayRef Value = MISProfileGetValue(a1, @"PPQCheck");
  BOOL v2 = Value;
  if (Value)
  {
    CFTypeID v3 = CFGetTypeID(Value);
    if (v3 != CFBooleanGetTypeID())
    {
      CFNumberRef v4 = sub_20DBFFB10();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 0;
        _os_log_impl(&dword_20DBFC000, v4, OS_LOG_TYPE_DEFAULT, "Encountered a non-BOOLean value for 'PPQCheck'.", (uint8_t *)v6, 2u);
      }

      return 0;
    }
  }
  return v2;
}

uint64_t MISProvisioningProfileIsForLocalProvisioning(void *a1)
{
  return sub_20DC1A75C(a1, @"LocalProvision");
}

void *MISProvisioningProfileGetAppAudience(void *a1)
{
  return MISProfileGetValue(a1, @"AppAudience");
}

void *MISProvisioningProfileGetExpirationDate(void *a1)
{
  return MISProfileGetValue(a1, @"ExpirationDate");
}

uint64_t MISProvisioningProfileSetName(void *a1, const void *a2)
{
  return MISProfileSetValue(a1, @"Name", a2);
}

void *MISProvisioningProfileGetName(void *a1)
{
  return MISProfileGetValue(a1, @"Name");
}

uint64_t MISProvisioningProfileAddDeveloperCertificate(void *a1, const void *a2)
{
  CFArrayRef Value = (__CFArray *)MISProfileGetValue(a1, @"DeveloperCertificates");
  if (Value)
  {
    uint64_t v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFArrayGetTypeID())
    {
      CFArrayAppendValue(v5, a2);
      return 0;
    }
    else
    {
      return 3892346883;
    }
  }
  else
  {
    CFAllocatorRef v8 = CFGetAllocator(a1);
    Mutable = CFArrayCreateMutable(v8, 0, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      id v10 = Mutable;
      CFArrayAppendValue(Mutable, a2);
      uint64_t v11 = MISProfileSetValue(a1, @"DeveloperCertificates", v10);
      CFRelease(v10);
      return v11;
    }
    else
    {
      return 3892346890;
    }
  }
}

uint64_t MISProvisioningProfileSetDeveloperCertificates(void *a1, const __CFArray *a2)
{
  CFAllocatorRef v4 = CFGetAllocator(a1);
  MutableCFDictionaryRef Copy = CFArrayCreateMutableCopy(v4, 0, a2);
  if (!MutableCopy) {
    return 3892346890;
  }
  CFMutableArrayRef v6 = MutableCopy;
  uint64_t v7 = MISProfileSetValue(a1, @"DeveloperCertificates", MutableCopy);
  CFRelease(v6);
  return v7;
}

void *MISProvisioningProfileGetDeveloperCertificatesHashes(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  CFAllocatorRef v4 = [a1 a2:a3 a4:a4];

  return v4;
}

void *MISProvisioningProfileGetDeveloperCertificates(void *a1)
{
  return MISProfileGetValue(a1, @"DeveloperCertificates");
}

void *MISXMLProvisioningProfileGetDeveloperCertificates(void *a1)
{
  if (MISProfileIsDEREncoded(a1)) {
    return 0;
  }

  return MISProfileGetValue(a1, @"DeveloperCertificates");
}

void *MISProvisioningProfileGetProvisionedDevices(void *a1)
{
  return MISProfileGetValue(a1, @"ProvisionedDevices");
}

void *MISProvisioningProfileGetUUID(void *a1)
{
  return MISProfileGetValue(a1, @"UUID");
}

uint64_t MISProvisioningProfileGetVersion(void *a1)
{
  id v1 = MISProfileGetValue(a1, @"Version");
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v1 v2:v3 v4];
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  return v5;
}

void *MISProvisioningProfileGetCreationDate(void *a1)
{
  return MISProfileGetValue(a1, @"CreationDate");
}

void *MISProvisioningProfileGetEntitlements(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = [a1 a2:a3 a4:a4];

  return v4;
}

void *MISProvisioningProfileGetRawEntitlements(void *a1)
{
  return MISProfileGetValue(a1, @"Entitlements");
}

uint64_t MISProvisioningProfileCheckValidity(void *a1, const __CFString *a2, const __CFDate *a3)
{
  uint64_t v6 = MISProfileValidateSignature_0(a1);
  if (!v6)
  {
    uint64_t v6 = 3892346898;
    if (MISProvisioningProfileGetVersion(a1) != 1) {
      return 3892346896;
    }
    if (!a2 || MISProvisioningProfileIncludesDevice(a1, a2))
    {
      uint64_t v7 = sub_20DC1E494();
      if (sub_20DC1E3FC((uint64_t)v7, a1, @"OSX"))
      {
        CFAllocatorRef v8 = sub_20DC1E494();
        id v9 = sub_20DC1E494();
        id v10 = @"iOS";
        if (!v9) {
          id v10 = 0;
        }
        uint64_t v11 = v10;
        BOOL v12 = sub_20DC1E3FC((uint64_t)v8, a1, v11);

        if (!v12)
        {
          uint64_t v13 = sub_20DBFFB10();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v16 = 0;
            _os_log_error_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_ERROR, "Encountered a provisioning profile that does not provision the current platform.", v16, 2u);
          }

          return v6;
        }
      }
      else
      {
      }
      if (a3
        && (CFDateRef Value = (const __CFDate *)MISProfileGetValue(a1, @"ExpirationDate")) != 0
        && CFDateCompare(a3, Value, 0) != kCFCompareLessThan)
      {
        return 3892346897;
      }
      else
      {
        return 0;
      }
    }
  }
  return v6;
}

void *MISProvisioningProfileGetProvisioningCDHashes(void *a1)
{
  return MISProfileGetValue(a1, @"ProvisioningCDHashes");
}

void *MISProvisioningProfileGetEmbeddedDER(void *a1)
{
  return MISProfileGetValue(a1, @"DER-Encoded-Profile");
}

uint64_t MISProvisioningProfileIsForBetaDeployment(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = [a1 a2:a3 a4:a4];

  if (!v4) {
    return 0;
  }
  CFTypeID v5 = CFGetTypeID(v4);
  if (v5 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFB40];

  return MISEntitlementDictionaryAllowsEntitlementValue((const __CFDictionary *)v4, @"beta-reports-active", v6);
}

uint64_t sub_20DC1B390(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_20DC1B3A0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_20DC1B45C;
  v11[3] = &unk_264129EE0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v9, v11, v10];
}

void sub_20DC1B45C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v27 = a2;
  *a4 = 0;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  [v7 appendString:v9];
  [*(void **)(a1 + 32) appendString:[v11 stringByAppendingString:@"\x1F"]];
  sub_20DC1B524(*(void **)(a1 + 32), v8, *(void **)(a1 + 40));

  id v13 = *(void **)(a1 + 32);
  uint64_t v17 = [v13 v14:v15 v16];
  uint64_t v21 = v17 + ~[v27 v18 v19 v20];
  uint64_t v25 = [v27 length:v22, v23, v24];
  [v13 deleteCharactersInRange:v26 to:v21];
}

void sub_20DC1B524(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sub_20DC1B3A0(v6, v5, v7);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      id v9 = v7;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = sub_20DC1B774;
      v25[3] = &unk_264129F08;
      id v26 = v8;
      id v27 = v9;
      [v6 enumerateObjectsUsingBlock:v10, (uint64_t)v25, v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [NSString stringWithFormat:@"%@%@%@", v13, @"string", v5, v6];
      }
      else
      {
        CFTypeID v14 = CFGetTypeID(v6);
        if (v14 == CFBooleanGetTypeID())
        {
          if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263EFFB40])) {
            [NSString stringWithFormat:@"%@%@%@", v16, @"BOOL", v5, @"true"];
          }
          else {
            [NSString stringWithFormat:@"%@%@%@", v16, @"BOOL", v5, @"false"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            abort();
          }
          uint64_t v20 = NSString;
          uint64_t v24 = [v6 v17:v18 v19];
          [v20 stringWithFormat:@"%@%@%lld", v22, @"number", v5, v24];
        }
      uint64_t v23 = };
      (*((void (**)(id, void *))v7 + 2))(v7, v23);
    }
  }
}

uint64_t sub_20DC1B774(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  return sub_20DC1B524(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

uint64_t sub_20DC1B784(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [*(void **)(a1 + 32) addObject:a2];
}

CFDataRef sub_20DC1B790(const __CFData *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v5, 0, sizeof(v5));
  CC_SHA256_Init(&v5);
  BytePtr = CFDataGetBytePtr(a1);
  CC_LONG Length = CFDataGetLength(a1);
  CC_SHA256_Update(&v5, BytePtr, Length);
  CC_SHA256_Final(md, &v5);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], md, 32);
}

void sub_20DC1B848()
{
  uint64_t v0 = sub_20DBFFB10();
  os_log_with_args();

  abort();
}

void sub_20DC1B89C()
{
  uint64_t v0 = sub_20DBFFB10();
  os_log_with_args();
}

__CFString *sub_20DC1B900(const __CFData *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Length = CFDataGetLength(a1);
  Mutable = CFStringCreateMutable(v2, 2 * Length);
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v6 = CFDataGetLength(a1);
  if (v6 >= 1)
  {
    CFIndex v7 = v6;
    do
    {
      unsigned int v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, @"%02x", v8);
      --v7;
    }
    while (v7);
  }
  return Mutable;
}

uint64_t MISArrayAllowsEntitlementValue(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v7 = 1;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v7 - 1);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 != CFStringGetTypeID()) {
        break;
      }
      CFIndex Length = CFStringGetLength(ValueAtIndex);
      CFIndex v11 = Length - 1;
      if (Length < 1)
      {
        uint64_t HasPrefix = 0;
      }
      else if (CFStringGetCharacterAtIndex(ValueAtIndex, v11) == 42)
      {
        v15.location = 0;
        v15.length = v11;
        CFStringRef v12 = CFStringCreateWithSubstring(v6, ValueAtIndex, v15);
        uint64_t HasPrefix = CFStringHasPrefix(a2, v12);
        CFRelease(v12);
      }
      else
      {
        uint64_t HasPrefix = CFEqual(ValueAtIndex, a2);
      }
      if (v7 < v5)
      {
        ++v7;
        if (!HasPrefix) {
          continue;
        }
      }
      return HasPrefix;
    }
  }
  return 0;
}

uint64_t MISEntitlementDictionaryAllowsEntitlementValue(const __CFDictionary *a1, const void *a2, const __CFString *a3)
{
  if (!a3) {
    return 0;
  }
  CFDateRef Value = (void *)CFDictionaryGetValue(a1, a2);
  values = Value;
  if (!Value) {
    return 0;
  }
  CFIndex v5 = Value;
  if (CFEqual(Value, @"*") != 1)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFBooleanGetTypeID()) {
      return CFEqual(v5, a3);
    }
    CFTypeID v9 = CFGetTypeID(v5);
    if (v9 == CFStringGetTypeID())
    {
      CFTypeID v10 = CFGetTypeID(a3);
      if (v10 == CFStringGetTypeID())
      {
        CFArrayRef v11 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&values, 1, MEMORY[0x263EFFF70]);
        uint64_t v6 = MISArrayAllowsEntitlementValue(v11, a3);
        CFRelease(v11);
        return v6;
      }
    }
    else
    {
      CFTypeID v12 = CFGetTypeID(v5);
      if (v12 == CFArrayGetTypeID())
      {
        CFTypeID v13 = CFGetTypeID(a3);
        if (v13 == CFStringGetTypeID()) {
          return MISArrayAllowsEntitlementValue((const __CFArray *)v5, a3);
        }
        CFTypeID v14 = CFGetTypeID(a3);
        if (v14 == CFArrayGetTypeID())
        {
          CFIndex Count = CFArrayGetCount((CFArrayRef)a3);
          if (Count < 1) {
            return 1;
          }
          CFIndex v16 = Count;
          uint64_t v17 = 1;
          while (1)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a3, v17 - 1);
            CFTypeID v19 = CFGetTypeID(ValueAtIndex);
            if (v19 != CFStringGetTypeID()) {
              break;
            }
            uint64_t v20 = MISArrayAllowsEntitlementValue((const __CFArray *)v5, ValueAtIndex);
            uint64_t v6 = v20;
            if (v17 < v16)
            {
              ++v17;
              if (v20 == 1) {
                continue;
              }
            }
            return v6;
          }
        }
      }
    }
    return 0;
  }
  return 1;
}

CFDataRef sub_20DC1BE9C(const __CFData *a1)
{
  unsigned int v8 = 0;
  CFIndex length = 0;
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v3 = CFDataGetLength(a1);
  if (!CTParseAmfiCMS((uint64_t)BytePtr, v3, 8, 0, 0, &v8, &length, 0, 0)) {
    return CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, length, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  }
  uint64_t v4 = sub_20DBFFB10();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20DBFC000, v4, OS_LOG_TYPE_ERROR, "Could not decode CMS message.", buf, 2u);
  }

  return 0;
}

uint64_t sub_20DC1BF7C()
{
  uint64_t v0 = 3892346883;
  int v1 = SecCMSVerify();
  if (v1 != -26275)
  {
    if (v1)
    {
      return 3892346889;
    }
    else
    {
      BOOL v2 = SecTrustEvaluateWithError(0, 0);
      CFRelease(0);
      if (v2) {
        return 0;
      }
      else {
        return 3892346899;
      }
    }
  }
  return v0;
}

uint64_t sub_20DC1C000()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  int v1 = (void *)qword_26772D3A0;
  qword_26772D3A0 = (uint64_t)v0;

  uint64_t v3 = qword_26772D3A0;

  return MEMORY[0x270F9A6D0](v3, sel_setCountLimit_, 100, v2);
}

uint64_t MISPing(char **a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  sub_20DC1C1E4();
  uint64_t v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "MessageType", "Ping");
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
  if (MEMORY[0x210567EF0]() == MEMORY[0x263EF8708])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "Status");
    if (a1)
    {
      string = xpc_dictionary_get_string(v4, "Payload");
      *a1 = strdup(string);
    }
  }
  else
  {
    uint64_t uint64 = 3892346881;
    if (MEMORY[0x210567EF0](v4) == MEMORY[0x263EF8720])
    {
      uint64_t v6 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
      CFTypeID v7 = sub_20DBFFB10();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        CFArrayRef v11 = v6;
        _os_log_impl(&dword_20DBFC000, v7, OS_LOG_TYPE_DEFAULT, "error sending ping: %s\n", (uint8_t *)&v10, 0xCu);
      }

      uint64_t uint64 = 3892346893;
    }
  }
  xpc_connection_cancel(v2);

  return uint64;
}

_xpc_connection_s *sub_20DC1C1E4()
{
  mach_service = xpc_connection_create_mach_service("com.apple.misagent", 0, 0);
  xpc_connection_set_event_handler(mach_service, &unk_26C249650);
  xpc_connection_resume(mach_service);

  return mach_service;
}

void sub_20DC1C240(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  xpc_object_t v3 = v2;
  if (v2 != (id)MEMORY[0x263EF86A8])
  {
    if (MEMORY[0x210567EF0](v2) == MEMORY[0x263EF8720])
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
      CFTypeID v7 = sub_20DBFFB10();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        CFTypeID v9 = string;
        _os_log_impl(&dword_20DBFC000, v7, OS_LOG_TYPE_DEFAULT, "misagent connection error: %s\n", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      xpc_object_t v4 = (char *)MEMORY[0x210567E00](v3);
      CFIndex v5 = sub_20DBFFB10();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        CFTypeID v9 = v4;
        _os_log_impl(&dword_20DBFC000, v5, OS_LOG_TYPE_DEFAULT, "received unhandled event from misagent: %s\n", (uint8_t *)&v8, 0xCu);
      }

      free(v4);
    }
  }
}

uint64_t MISInstallProvisioningProfile(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t uint64 = 3892346881;
  id v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 3892346884;
  }
  CFDataRef v3 = v2;
  sub_20DC1C1E4();
  xpc_object_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "MessageType", "Install");
  BytePtr = CFDataGetBytePtr(v3);
  size_t Length = CFDataGetLength(v3);
  xpc_dictionary_set_data(v5, "Profile", BytePtr, Length);
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v4, v5);
  if (MEMORY[0x210567EF0]() == MEMORY[0x263EF8708])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "Status");
  }
  else if (MEMORY[0x210567EF0](v8) == MEMORY[0x263EF8720])
  {
    string = xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x263EF86B0]);
    uint64_t v10 = sub_20DBFFB10();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      CFTypeID v13 = string;
      _os_log_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_DEFAULT, "error installing profile: %s\n", (uint8_t *)&v12, 0xCu);
    }

    uint64_t uint64 = 3892346893;
  }
  xpc_connection_cancel(v4);
  CFRelease(v3);

  return uint64;
}

uint64_t MISRemoveProvisioningProfile(const __CFString *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t uint64 = 3892346881;
  CFDataRef v3 = (void *)MEMORY[0x210567610]();
  if (CFStringGetCString(a1, buffer, 37, 0x600u))
  {
    sub_20DC1C1E4();
    xpc_object_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "MessageType", "Remove");
    xpc_dictionary_set_string(v5, "ProfileID", buffer);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    if (MEMORY[0x210567EF0]() == MEMORY[0x263EF8708])
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Status");
    }
    else if (MEMORY[0x210567EF0](v6) == MEMORY[0x263EF8720])
    {
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x263EF86B0]);
      xpc_object_t v8 = sub_20DBFFB10();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        CFArrayRef v11 = string;
        _os_log_impl(&dword_20DBFC000, v8, OS_LOG_TYPE_DEFAULT, "error removing profile: %s\n", (uint8_t *)&v10, 0xCu);
      }

      uint64_t uint64 = 3892346893;
    }
    xpc_connection_cancel(v4);
  }
  return uint64;
}

uint64_t MISCopyInstalledProvisioningProfiles(CFMutableArrayRef *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    CFMutableArrayRef v3 = Mutable;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = sub_20DC1C83C;
    v7[3] = &unk_264129F28;
    v7[4] = Mutable;
    uint64_t v4 = MISEnumerateInstalledProvisioningProfiles(MISProfileEnumerationFlagLegacy, v7);
    if (v4) {
      CFRelease(v3);
    }
    else {
      *a1 = v3;
    }
  }
  else
  {
    xpc_object_t v5 = sub_20DBFFB10();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v5, OS_LOG_TYPE_ERROR, "unable to allocate profiles array", buf, 2u);
    }

    return 3892346890;
  }
  return v4;
}

uint64_t sub_20DC1C83C(uint64_t a1, const void *a2)
{
  return 1;
}

uint64_t MISEnumerateInstalledProvisioningProfiles(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = -402620415;
  sub_20DC1C1E4();
  uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "MessageType", "CopyAll");
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
  if (MEMORY[0x210567EF0]() == MEMORY[0x263EF8708])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Status");
    *((_DWORD *)v20 + 6) = uint64;
    if (uint64) {
      goto LABEL_10;
    }
  }
  else if (MEMORY[0x210567EF0](v6) == MEMORY[0x263EF8720])
  {
    string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x263EF86B0]);
    xpc_object_t v8 = sub_20DBFFB10();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = string;
      _os_log_error_impl(&dword_20DBFC000, v8, OS_LOG_TYPE_ERROR, "error getting installed profiles: %s\n", buf, 0xCu);
    }

    CFTypeID v9 = v20;
    goto LABEL_9;
  }
  CFArrayRef v11 = xpc_dictionary_get_value(v6, "Payload");
  CFTypeID v9 = v20;
  if (!v11)
  {
LABEL_9:
    *((_DWORD *)v9 + 6) = -402620403;
    uint64_t uint64 = 3892346893;
    goto LABEL_10;
  }
  *((_DWORD *)v20 + 6) = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  unint64_t v14[2] = sub_20DC1CB00;
  v14[3] = &unk_264129F50;
  int v12 = v4;
  CFRange v15 = v12;
  uint64_t v17 = &v19;
  uint64_t v18 = a1;
  id v16 = v3;
  xpc_array_apply(v11, v14);
  xpc_connection_cancel(v12);
  uint64_t uint64 = *((unsigned int *)v20 + 6);

LABEL_10:
  _Block_object_dispose(&v19, 8);

  return uint64;
}

void sub_20DC1CADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20DC1CB00(uint64_t a1, int a2, xpc_object_t xstring)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  string_ptr = xpc_string_get_string_ptr(xstring);
  CFStringRef v6 = CFStringCreateWithCString(v4, string_ptr, 0x600u);
  CFTypeID v7 = sub_20DC1CBD4(*(void **)(a1 + 32), v6, *(void *)(a1 + 56) == MISProfileEnumerationFlagLegacy, (int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  if (!v7)
  {
    uint64_t v9 = 0;
    if (!v6) {
      return v9;
    }
    goto LABEL_8;
  }
  xpc_object_t v8 = v7;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  CFRelease(v8);
  if (v6) {
LABEL_8:
  }
    CFRelease(v6);
  return v9;
}

MISProfile *sub_20DC1CBD4(void *a1, const __CFString *a2, BOOL a3, int *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v7 = -402620415;
  xpc_object_t v8 = a1;
  *a4 = -402620415;
  if (!CFStringGetCString(a2, buffer, 37, 0x600u))
  {
    xpc_object_t v9 = 0;
    xpc_object_t v10 = 0;
    id v13 = 0;
LABEL_18:
    CFRange v15 = 0;
    *a4 = v7;
    goto LABEL_19;
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "MessageType", "CopySingle");
  xpc_dictionary_set_string(v9, "ProfileID", buffer);
  xpc_dictionary_set_BOOL(v9, "ForceXML", a3);
  xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v8, v9);
  if (MEMORY[0x210567EF0]() != MEMORY[0x263EF8708])
  {
    if (MEMORY[0x210567EF0](v10) == MEMORY[0x263EF8720])
    {
      string = xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x263EF86B0]);
      int v12 = sub_20DBFFB10();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315394;
        uint64_t v24 = buffer;
        __int16 v25 = 2080;
        id v26 = string;
        _os_log_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_DEFAULT, "error getting profile '%s': %s", (uint8_t *)&v23, 0x16u);
      }
      id v13 = 0;
      goto LABEL_15;
    }
LABEL_10:
    id v16 = xpc_dictionary_get_value(v10, "Payload");
    if (!v16)
    {
      id v13 = 0;
      goto LABEL_17;
    }
    id v13 = v16;
    if (MEMORY[0x210567EF0]() == MEMORY[0x263EF86F8]
      && (CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08],
          bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v13),
          size_t length = xpc_data_get_length(v13),
          (CFDataRef v21 = CFDataCreate(v18, bytes_ptr, length)) != 0))
    {
      CFDataRef v22 = v21;
      CFRange v15 = MISProfileCreateWithData((uint64_t)v21, v21);
      CFRelease(v22);

      if (v15) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    int v12 = sub_20DBFFB10();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315138;
      uint64_t v24 = buffer;
      _os_log_error_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_ERROR, "error getting profile '%s' from fd", (uint8_t *)&v23, 0xCu);
    }
LABEL_15:

LABEL_17:
    int v7 = -402620403;
    goto LABEL_18;
  }
  int uint64 = xpc_dictionary_get_uint64(v10, "Status");
  *a4 = uint64;
  if (!uint64) {
    goto LABEL_10;
  }
  id v13 = 0;
  CFRange v15 = 0;
LABEL_19:

  return v15;
}

uint64_t MISCopyProvisioningProfile(const __CFString *a1, MISProfile **a2)
{
  unsigned int v7 = -402620415;
  CFAllocatorRef v4 = sub_20DC1C1E4();
  *a2 = sub_20DC1CBD4(v4, a1, 0, (int *)&v7);
  xpc_connection_cancel((xpc_connection_t)v4);
  uint64_t v5 = v7;

  return v5;
}

uint64_t MISCopyProvisioningProfileWithConnection(const __CFString *a1, MISProfile **a2, void *a3)
{
  unsigned int v4 = -402620415;
  *a2 = sub_20DC1CBD4(a3, a1, 0, (int *)&v4);
  return v4;
}

uint64_t MISEnumerateMatchingProfiles(const __CFData *a1, const __CFArray *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v5 = 3892346893;
  id v6 = a3;
  uint64_t v34 = 0;
  unint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = -402620415;
  sub_20DC1C1E4();
  unsigned int v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t empty = xpc_array_create_empty();
  xpc_dictionary_set_string(v8, "MessageType", "CopyMatching");
  if (a1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    size_t Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v9, "Cert", BytePtr, Length);
  }
  if (a2)
  {
    for (CFIndex i = 0; i < CFArrayGetCount(a2); ++i)
    {
      CFArrayGetValueAtIndex(a2, i);
      id v14 = objc_claimAutoreleasedReturnValue();
      CFAllocatorRef v18 = (const char *)[v14 v15:v16 v17];
      if (!v18)
      {
        CFDataRef v22 = sub_20DBFFB10();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20DBFC000, v22, OS_LOG_TYPE_ERROR, "Invalid UTF8 string in predicate", buf, 2u);
        }

        *((_DWORD *)v35 + 6) = -402620415;
        xpc_object_t v19 = 0;
        uint64_t v5 = 3892346881;
        goto LABEL_26;
      }
      xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v18);
    }
  }
  xpc_dictionary_set_value(v9, "Predicates", empty);
  xpc_dictionary_set_value(v8, "Payload", v9);
  xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(v7, v8);
  if (MEMORY[0x210567EF0]() == MEMORY[0x263EF8708])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v19, "Status");
    *((_DWORD *)v35 + 6) = uint64;
    if (uint64)
    {
      uint64_t v5 = uint64;
      goto LABEL_26;
    }
  }
  else if (MEMORY[0x210567EF0](v19) == MEMORY[0x263EF8720])
  {
    string = xpc_dictionary_get_string(v19, (const char *)*MEMORY[0x263EF86B0]);
    CFDataRef v21 = sub_20DBFFB10();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v39 = string;
      _os_log_error_impl(&dword_20DBFC000, v21, OS_LOG_TYPE_ERROR, "error getting unauthoritative profile list: %s\n", buf, 0xCu);
    }

    *((_DWORD *)v35 + 6) = -402620403;
    goto LABEL_26;
  }
  uint64_t v24 = xpc_dictionary_get_value(v19, "Payload");
  __int16 v25 = (void *)v24;
  if (v24)
  {
    if (MEMORY[0x210567EF0](v24) == MEMORY[0x263EF86D8])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = sub_20DC1D400;
      applier[3] = &unk_264129F78;
      uint64_t v33 = &v34;
      uint64_t v28 = v7;
      uint64_t v31 = v28;
      id v32 = v6;
      xpc_array_apply(v25, applier);
      xpc_connection_cancel(v28);
      uint64_t v5 = *((unsigned int *)v35 + 6);

      goto LABEL_26;
    }
    id v26 = (char *)MEMORY[0x210567E00](v25);
  }
  else
  {
    id v26 = 0;
  }
  id v27 = sub_20DBFFB10();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v39 = v26;
    _os_log_error_impl(&dword_20DBFC000, v27, OS_LOG_TYPE_ERROR, "Payload is not an array: %s", buf, 0xCu);
  }

  free(v26);
  *((_DWORD *)v35 + 6) = -402620403;

LABEL_26:
  _Block_object_dispose(&v34, 8);

  return v5;
}

void sub_20DC1D3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20DC1D400(void *a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)a1[4];
  id v6 = (void *)a1[5];
  id v7 = v4;
  id v8 = v5;
  xpc_object_t v9 = v6;
  CFTypeRef cf = 0;
  CFTypeRef v29 = 0;
  uint64_t v30 = 0;
  id v10 = v8;
  id v31 = v10;
  if (MEMORY[0x210567EF0](v7) != MEMORY[0x263EF86D8])
  {
    CFArrayRef v11 = (void *)MEMORY[0x210567E00](v7);
    int v12 = sub_20DBFFB10();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      size_t count = (size_t)v11;
      _os_log_error_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_ERROR, "Profile row is not an array: '%s'", buf, 0xCu);
    }
LABEL_4:

    free(v11);
LABEL_15:
    CFStringRef v18 = 0;
    CFDateRef v19 = 0;
    CFDateRef v21 = 0;
    int v23 = -402620403;
    unsigned int v22 = 1;
    goto LABEL_16;
  }
  if (xpc_array_get_count(v7) != 8)
  {
    uint64_t v24 = sub_20DBFFB10();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      size_t count = xpc_array_get_count(v7);
      __int16 v34 = 2048;
      uint64_t v35 = 4;
      _os_log_error_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_ERROR, "Wrong profile row count %ld != expected %ld", buf, 0x16u);
    }

    goto LABEL_15;
  }
  string = xpc_array_get_string(v7, 0);
  id v14 = xpc_array_get_string(v7, 1uLL);
  CFRange v15 = xpc_array_get_string(v7, 2uLL);
  int64_t date = xpc_array_get_date(v7, 3uLL);
  BYTE1(v30) = xpc_array_get_BOOL(v7, 4uLL);
  BYTE3(v30) = xpc_array_get_BOOL(v7, 5uLL);
  BYTE2(v30) = xpc_array_get_BOOL(v7, 6uLL);
  BYTE4(v30) = xpc_array_get_BOOL(v7, 7uLL);
  if (!string)
  {
    id v27 = xpc_array_get_value(v7, 0);
    CFArrayRef v11 = (void *)MEMORY[0x210567E00](v27);

    int v12 = sub_20DBFFB10();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      size_t count = (size_t)v11;
      _os_log_error_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_ERROR, "Profile row has no (or malformed) UUID: '%s'", buf, 0xCu);
    }
    goto LABEL_4;
  }
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef cf = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], string, 0x8000100u);
  if (v14) {
    CFTypeRef v29 = CFStringCreateWithCString(v17, v14, 0x8000100u);
  }
  CFStringRef v18 = CFStringCreateWithCString(v17, v15, 0x8000100u);
  CFDateRef v19 = CFDateCreate(v17, (double)date);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v21 = CFDateCreate(v17, Current);
  LOBYTE(v30) = CFDateCompare(v19, v21, 0) == kCFCompareLessThan;
  unsigned int v22 = v9[2](v9, &cf);
  if (cf) {
    CFRelease(cf);
  }
  int v23 = 0;
LABEL_16:
  if (v29) {
    CFRelease(v29);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v21) {
    CFRelease(v21);
  }

  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = v23;
  if (*(_DWORD *)(*(void *)(a1[6] + 8) + 24)) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = v22;
  }

  return v25;
}

void sub_20DC1D7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MISEnumerateMatchingProfilesUnauthoritative(const __CFData *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = sub_20DC1D8B4;
  v7[3] = &unk_264129FA0;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = MISEnumerateMatchingProfiles(a1, 0, v7);

  return v5;
}

uint64_t sub_20DC1D8B4(uint64_t a1, const __CFString **a2)
{
  CFTypeRef cf = 0;
  int v3 = MISCopyProvisioningProfile(*a2, (MISProfile **)&cf);
  CFTypeRef v7 = cf;
  if (cf) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [cf entitlements:v4, v5, v6];

    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = 1;
    if (!cf) {
      return v9;
    }
  }
  CFRelease(v7);
  return v9;
}

BOOL MISBlacklistOverriddenByUser(const __CFData *a1, int a2)
{
  *(_DWORD *)bytes = a2;
  CFArrayRef v3 = sub_20DC24154();
  if (v3)
  {
    CFArrayRef v4 = v3;
    CFIndex Length = CFDataGetLength(a1);
    MutableCFDictionaryRef Copy = CFDataCreateMutableCopy(0, Length + 4, a1);
    if (MutableCopy)
    {
      CFDataRef v7 = MutableCopy;
      CFDataAppendBytes(MutableCopy, bytes, 4);
      BOOL v8 = sub_20DC1B900(v7);
      if (v8)
      {
        uint64_t v9 = v8;
        BOOL v10 = sub_20DC24378((BOOL)v4, v8);
        CFRelease(v9);
      }
      else
      {
        id v13 = sub_20DBFFB10();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CFRange v15 = 0;
          _os_log_error_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_ERROR, "Could not create lookup key for denylist override check.", v15, 2u);
        }

        BOOL v10 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      int v12 = sub_20DBFFB10();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_error_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_ERROR, "Could not create cdHash for denylist override check.", v16, 2u);
      }

      BOOL v10 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    CFArrayRef v11 = sub_20DBFFB10();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v11, OS_LOG_TYPE_ERROR, "Could not open denylist override list.", buf, 2u);
    }

    return 0;
  }
  return v10;
}

CFStringRef sub_20DC1DB00()
{
  CFStringRef result = sub_20DC1E1B0();
  qword_26AAF6F88 = (uint64_t)result;
  return result;
}

uint64_t MISQueryBlacklistForBundle(const __CFString *a1, uint64_t a2, int a3, _DWORD *a4, CFDataRef *a5, _DWORD *a6)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v23 = 0;
  BOOL v10 = (const __SecCode *)sub_20DC01890(a1, a2, 0, &v23);
  if (v10)
  {
    CFArrayRef v11 = v10;
    sub_20DC01D24(v10);
    CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v13 = v12;
    if (v12)
    {
      CFDataRef v14 = (const __CFData *)sub_20DC01D90(v12);
      if (v14)
      {
        CFDataRef v15 = v14;
      }
      else
      {
        int v23 = -402620415;
        CFDateRef v19 = sub_20DBFFB10();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DBFC000, v19, OS_LOG_TYPE_DEFAULT, "Could not copy code directory hash.", buf, 2u);
        }

        CFDataRef v15 = 0;
      }
    }
    else
    {
      CFDataRef v15 = 0;
      int v23 = -402620407;
    }
    int v17 = v23;
    CFRelease(v11);

    BOOL v18 = v15 == 0;
    if (!v17 && v15)
    {
      if (a5) {
        *a5 = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v15);
      }
      if (a6) {
        *a6 = 26;
      }
      uint64_t v20 = MISQueryBlacklistForCdHash(v15, 26, a3, a4);
LABEL_22:
      CFRelease(v15);
      return v20;
    }
  }
  else
  {
    uint64_t v16 = sub_20DBFFB10();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = v23;
      _os_log_impl(&dword_20DBFC000, v16, OS_LOG_TYPE_DEFAULT, "Could not copy signature, error 0x%x", buf, 8u);
    }

    int v17 = v23;
    CFDataRef v15 = 0;
    BOOL v18 = 1;
  }
  CFDateRef v21 = sub_20DBFFB10();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v25 = v17;
    _os_log_impl(&dword_20DBFC000, v21, OS_LOG_TYPE_DEFAULT, "Could not copy code directory hash (error: 0x%x).", buf, 8u);
  }

  uint64_t v20 = 0;
  uint64_t result = 0;
  if (!v18) {
    goto LABEL_22;
  }
  return result;
}

void MISBlacklistSetOverride(const __CFData *a1, unsigned int a2, BOOL a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  CFDataRef v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_string(v6, "type", "blov");
    BytePtr = CFDataGetBytePtr(a1);
    size_t Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v7, "cdha", BytePtr, Length);
    xpc_dictionary_set_uint64(v7, "haty", a2);
    xpc_dictionary_set_BOOL(v7, "ovrr", a3);
    uint64_t v10 = sub_20DC2324C(v7);
    CFArrayRef v11 = (void *)v10;
    if (v10 && MEMORY[0x210567EF0](v10) != MEMORY[0x263EF8720]) {
      xpc_dictionary_get_int64(v11, "resu");
    }
  }
  else
  {
    CFDictionaryRef v12 = sub_20DBFFB10();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFDictionaryRef v13 = 0;
      _os_log_error_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_ERROR, "Could not create XPC message for setBlacklistOverride", v13, 2u);
    }

    CFArrayRef v11 = 0;
  }
}

void sub_20DC1DED0(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  CFURLRef Value = (const __CFURL *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFURLRef v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFURLGetTypeID())
    {
      CFURLGetFileSystemRepresentation(v5, 1u, buffer, 1024);
      CFDataRef v7 = sub_20DBFFB10();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = a3;
        __int16 v16 = 2080;
        int v17 = buffer;
        _os_log_impl(&dword_20DBFC000, v7, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
      }
LABEL_14:

      return;
    }
    CFTypeID v8 = CFGetTypeID(v5);
    if (v8 != CFArrayGetTypeID())
    {
      CFDataRef v7 = sub_20DBFFB10();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315394;
        CFDateRef v19 = "logResourceError";
        __int16 v20 = 2080;
        uint64_t v21 = a3;
        _os_log_error_impl(&dword_20DBFC000, v7, OS_LOG_TYPE_ERROR, "%s: unexpected object type processing %s errors", buffer, 0x16u);
      }
      goto LABEL_14;
    }
    CFIndex Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0; i != v10; ++i)
      {
        CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v5, i);
        CFURLGetFileSystemRepresentation(ValueAtIndex, 1u, buffer, 1024);
        CFDictionaryRef v13 = sub_20DBFFB10();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v15 = a3;
          __int16 v16 = 2080;
          int v17 = buffer;
          _os_log_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
        }
      }
    }
  }
}

CFURLRef sub_20DC1E10C()
{
  CFURLRef result = CFURLCreateWithFileSystemPath(0, @"/private/var/db/MobileIdentityData", kCFURLPOSIXPathStyle, 1u);
  qword_26AAF6F98 = (uint64_t)result;
  return result;
}

void sub_20DC1E140()
{
  if (qword_26AAF6FA0[0] != -1) {
    dispatch_once(qword_26AAF6FA0, &unk_26C249690);
  }

  JUMPOUT(0x210566F10);
}

CFStringRef sub_20DC1E1B0()
{
  sub_20DC1E140();
  if (!v0)
  {
    CFArrayRef v4 = sub_20DBFFB10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = 0;
      CFURLRef v5 = "Could not create URL for MIS Data path creation (this should not happen).";
      CFTypeID v6 = (uint8_t *)&v10;
      goto LABEL_12;
    }
LABEL_9:

    return 0;
  }
  CFURLRef v1 = v0;
  CFURLRef v2 = CFURLCopyAbsoluteURL(v0);
  CFRelease(v1);
  if (!v2)
  {
    CFArrayRef v4 = sub_20DBFFB10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      CFURLRef v5 = "Could not create absolute URL for MIS Data path creation (this should not happen).";
      CFTypeID v6 = buf;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  CFStringRef v3 = CFURLCopyPath(v2);
  CFRelease(v2);
  if (!v3)
  {
    CFArrayRef v4 = sub_20DBFFB10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = 0;
      CFURLRef v5 = "Could not get path for MIS Data path creation (this should not happen).";
      CFTypeID v6 = (uint8_t *)&v8;
LABEL_12:
      _os_log_error_impl(&dword_20DBFC000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  return v3;
}

uint64_t sub_20DC1E2C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  CFArrayRef v4 = [MEMORY[0x263F08850] a2:a3:a4];
  CFStringRef v5 = sub_20DC1E1B0();
  int v8 = [v4 fileExistsAtPath:v6];
  if (v5) {
    CFRelease(v5);
  }
  if (v8)
  {
    CFStringRef v9 = sub_20DC1E1B0();
    int v12 = [v4 fileExistsAtPath:v10 isDirectory:v9];
    if (v9) {
      CFRelease(v9);
    }
    if (v12)
    {
      CFDictionaryRef v13 = sub_20DBFFB10();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_error_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_ERROR, "Both user trusted UPPs plist and new user trust DB exist (this should never happen).", v15, 2u);
      }
    }
  }

  return v8 ^ 1u;
}

void sub_20DC1E3B8()
{
  os_log_t v0 = os_log_create("com.apple.mis", "mis");
  CFURLRef v1 = (void *)qword_26AAF7130;
  qword_26AAF7130 = (uint64_t)v0;
}

BOOL sub_20DC1E3FC(uint64_t a1, void *a2, void *a3)
{
  CFStringRef v5 = a3;
  int v8 = v5;
  if (!a1)
  {
    BOOL v11 = 0;
    goto LABEL_7;
  }
  int isEqualToString = [v5 isEqualToString:@"xrOS" v7];
  BOOL v10 = MISProvisioningProfileIncludesPlatform(a2, v8, 0);
  if (!isEqualToString) {
    goto LABEL_6;
  }
  if (!v10)
  {
    BOOL v10 = MISProvisioningProfileIncludesPlatform(a2, @"visionOS", 0);
LABEL_6:
    BOOL v11 = v10;
    goto LABEL_7;
  }
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

id sub_20DC1E494()
{
  if (qword_26772D3B0 != -1) {
    dispatch_once(&qword_26772D3B0, &unk_26C2496D0);
  }
  os_log_t v0 = (void *)qword_26772D3B8;

  return v0;
}

MobileIdentityService *sub_20DC1E510()
{
  CFURLRef result = objc_alloc_init(MobileIdentityService);
  qword_26772D3B8 = (uint64_t)result;
  return result;
}

uint64_t sub_20DC1E54C(const __CFArray *a1, uint64_t a2, int *a3)
{
  if (qword_26772D3C8 != -1) {
    dispatch_once(&qword_26772D3C8, &unk_26C249958);
  }
  id v6 = (id)qword_26772D3C0;
  CFURLRef ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(a1, 0);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_20DC21748;
  aBlock[3] = &unk_26412A140;
  aBlock[4] = a1;
  aBlock[5] = a2;
  int v8 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  if (!ValueAtIndex)
  {
    uint64_t v21 = sub_20DBFFB10();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v36 = 0;
      _os_log_error_impl(&dword_20DBFC000, v21, OS_LOG_TYPE_ERROR, "There is no leaf cert (this should not happen).", v36, 2u);
    }

    uint64_t v20 = 0;
    CFDataRef v9 = 0;
    CFDataRef v12 = 0;
    goto LABEL_16;
  }
  CFDataRef v9 = SecCertificateCopyData(ValueAtIndex);
  CFDataRef v12 = sub_20DC1B790(v9);
  if (!v12 || !v6)
  {
    uint64_t v22 = sub_20DBFFB10();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v36 = 0;
      _os_log_error_impl(&dword_20DBFC000, v22, OS_LOG_TYPE_ERROR, "Failure creating profile cache key. This shouldn't happen.", v36, 2u);
    }

    uint64_t v20 = 0;
LABEL_16:
    int v17 = 0;
    goto LABEL_17;
  }
  CFDictionaryRef v13 = [v6 objectForKey:v10];
  int v17 = v13;
  if (v13)
  {
    int v18 = [v13 v14:v15 v16];
    if (v18)
    {
      int v19 = 0;
      uint64_t v20 = v18;
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    uint64_t v24 = sub_20DBFFB10();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v36 = 0;
      _os_log_error_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_ERROR, "Found in cert cache, but cert type is CertTypeError (this should not happen).", v36, 2u);
    }
  }
  uint64_t v25 = SecPolicyCreateiPhoneApplicationSigning();
  if (!v8[2](v8, v25))
  {
    uint64_t v20 = 1;
    [NSNumber numberWithInt:1];
    goto LABEL_30;
  }
  uint64_t v28 = SecPolicyCreateiPhoneVPNApplicationSigning();
  if (!v8[2](v8, v28))
  {
    uint64_t v20 = 3;
    [NSNumber numberWithInt:3];
    goto LABEL_30;
  }
  uint64_t v31 = SecPolicyCreateiPhoneProfileApplicationSigning();
  if (!v8[2](v8, v31))
  {
    uint64_t v20 = 2;
    [NSNumber numberWithInt:v32];
    __int16 v34 = LABEL_30:;
    [v6 setObject:v35 forKey:(uint64_t)v34];

    int v19 = 0;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v20 = 0;
LABEL_17:
  int v19 = -402620392;
  if (a3) {
LABEL_18:
  }
    *a3 = v19;
LABEL_19:

  return v20;
}

uint64_t sub_20DC1E83C(uint64_t a1, uint64_t a2)
{
  CFDataRef v4 = sub_20DC1B790(*(const __CFData **)a1);
  uint64_t v63 = 0;
  unint64_t v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  unint64_t v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v55 = 0;
  char v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  unint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  CFErrorRef v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  CFArrayRef v38 = 0;
  CFArrayRef v38 = sub_20DC24154();
  v33[0] = 0;
  v33[1] = v33;
  void v33[2] = 0x2020000000;
  char v34 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_20DC204E8;
  aBlock[3] = &unk_26412A188;
  aBlock[4] = v33;
  aBlock[5] = &v35;
  void aBlock[6] = &v51;
  aBlock[7] = &v59;
  aBlock[8] = a2;
  aBlock[9] = a1;
  CFStringRef v5 = _Block_copy(aBlock);
  id v6 = *(void **)(a1 + 8);
  CFDataRef v9 = [MEMORY[0x263EFF980] arrayWithCapacity:20 :v8];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = sub_20DC1B784;
  v67[3] = &unk_264129EB8;
  id v10 = v9;
  id v68 = v10;
  uint64_t v11 = v67;
  CFDataRef v14 = [MEMORY[0x263F089D8] stringWithString:v12, @"\x1F", v13];
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v70 = 3221225472;
  uint64_t v71 = sub_20DC1B390;
  unsigned int v72 = &unk_264129E90;
  id v73 = v11;
  uint64_t v15 = v11;
  sub_20DC1B3A0(v6, v14, buf);

  if (*(unsigned char *)(a1 + 48))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    void v30[2] = sub_20DC2096C;
    unint64_t v30[3] = &unk_26412A1B0;
    v31[1] = &v63;
    v31[2] = &v47;
    v31[3] = &v55;
    v31[0] = v5;
    uint64_t v16 = MISEnumerateMatchingProfiles(v4, (const __CFArray *)v10, v30);
    CFDateRef v17 = 0;
    int v18 = 0;
    int v19 = (id *)v31;
  }
  else
  {
    uint64_t v20 = (const void *)MGCopyAnswer();
    int v18 = v20;
    if (!v20)
    {
      uint64_t v24 = sub_20DBFFB10();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_ERROR, "got NULL when querying UDID", buf, 2u);
      }
      CFDateRef v17 = 0;
      int v18 = 0;
      goto LABEL_15;
    }
    CFTypeID v21 = CFGetTypeID(v20);
    uint64_t v16 = 3892346881;
    if (v21 != CFStringGetTypeID())
    {
      uint64_t v25 = sub_20DBFFB10();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v25, OS_LOG_TYPE_ERROR, "got non-string when querying UDID", buf, 2u);
      }

      CFRelease(v18);
      CFDateRef v17 = 0;
      int v18 = 0;
      goto LABEL_25;
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFDateRef v17 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Current);
    if (!v17) {
      goto LABEL_25;
    }
    int v23 = sub_20DBFFB10();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DBFC000, v23, OS_LOG_TYPE_DEFAULT, "Authoritative", buf, 2u);
    }

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_20DC209CC;
    _OWORD v28[3] = &unk_26412A1D8;
    v29[7] = v17;
    v29[8] = v4;
    v29[1] = &v47;
    v29[2] = &v63;
    v29[9] = a1;
    v29[3] = &v43;
    v29[4] = &v39;
    _OWORD v29[5] = &v55;
    v29[6] = v18;
    v29[0] = v5;
    uint64_t v16 = MISEnumerateMatchingProfiles(v4, (const __CFArray *)v10, v28);
    int v19 = (id *)v29;
  }

  if (*((unsigned char *)v60 + 24)) {
    goto LABEL_25;
  }
  if (*((unsigned char *)v48 + 24))
  {
    uint64_t v16 = 3892346897;
    goto LABEL_25;
  }
  if (*((unsigned char *)v52 + 24))
  {
    uint64_t v16 = 3892346916;
    goto LABEL_25;
  }
  if (*((unsigned char *)v44 + 24))
  {
    uint64_t v16 = 3892346922;
    goto LABEL_25;
  }
  if (*((unsigned char *)v40 + 24))
  {
    uint64_t v16 = 3892346924;
    goto LABEL_25;
  }
  if (*((unsigned char *)v64 + 24))
  {
    if (*((unsigned char *)v56 + 24))
    {
      uint64_t v24 = sub_20DBFFB10();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_ERROR, "Invalid profile iteration outcome?", buf, 2u);
      }
LABEL_15:
      uint64_t v16 = 3892346881;

      goto LABEL_25;
    }
    uint64_t v16 = 3892346902;
  }
  else
  {
    uint64_t v16 = 3892346901;
  }
LABEL_25:
  if (v4) {
    CFRelease(v4);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v26 = (const void *)v36[3];
  if (v26) {
    CFRelease(v26);
  }
  if (v10) {
    CFRelease(v10);
  }

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  return v16;
}

void sub_20DC1EE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose((const void *)(v66 - 248), 8);
  _Block_object_dispose((const void *)(v66 - 216), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20DC1EEEC(const __CFData *a1, CFArrayRef theArray, const __CFNumber *a3, void *a4, int64_t a5, CFTypeRef *a6, const __CFString *a7)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 3892346881;
  }
  if (!theArray) {
    return 3892346881;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count < 1) {
    return 3892346881;
  }
  CFIndex v12 = Count;
  uint64_t v35 = a6;
  CFIndex v13 = 0;
  uint64_t v14 = 3892346881;
  while (1)
  {
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(theArray, v13);
    if (!ValueAtIndex)
    {
      uint64_t v24 = sub_20DBFFB10();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      uint64_t v25 = v24;
      uint64_t v26 = "Encountered NULL record!";
      uint32_t v27 = 2;
LABEL_21:
      _os_log_error_impl(&dword_20DBFC000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);
      goto LABEL_34;
    }
    CFArrayRef v16 = ValueAtIndex;
    if (CFArrayGetCount(ValueAtIndex) != 4)
    {
      uint64_t v24 = sub_20DBFFB10();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      CFIndex v28 = CFArrayGetCount(v16);
      *(_DWORD *)buf = 134218242;
      CFIndex v40 = v28;
      __int16 v41 = 2112;
      char v42 = v16;
      uint64_t v25 = v24;
      uint64_t v26 = "Encountered record with %ld != 4 entries: %@";
      uint32_t v27 = 22;
      goto LABEL_21;
    }
    CFStringRef v17 = (const __CFString *)CFArrayGetValueAtIndex(v16, 0);
    CFStringRef v18 = (const __CFString *)CFArrayGetValueAtIndex(v16, 1);
    if (!v17 || (CFStringRef v19 = v18) == 0)
    {
      uint64_t v24 = sub_20DBFFB10();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138412290;
      CFIndex v40 = (CFIndex)v16;
      uint64_t v25 = v24;
      uint64_t v26 = "Encountered record with no UUID or Team ID: %@";
      uint32_t v27 = 12;
      goto LABEL_21;
    }
    CFBooleanRef v20 = (const __CFBoolean *)CFArrayGetValueAtIndex(v16, 2);
    CFBooleanRef v21 = (const __CFBoolean *)CFArrayGetValueAtIndex(v16, 3);
    uint64_t v22 = sub_20DBFFB10();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DBFC000, v22, OS_LOG_TYPE_DEFAULT, "Performing online authorization.", buf, 2u);
    }

    int64_t v23 = sub_20DC22F3C(a1, v17, v19, v20, v21, a3, a4, a5, a7);
    if ((v23 & 0x24) != 0)
    {
      uint64_t v24 = sub_20DBFFB10();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFIndex v40 = (CFIndex)a1;
        __int16 v41 = 2112;
        char v42 = (void *)v17;
        _os_log_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_DEFAULT, "Authorization still pending: %@, %@", buf, 0x16u);
      }
      uint64_t v14 = 0;
      goto LABEL_34;
    }
    int64_t v29 = v23;
    if ((v23 & 0x10) != 0) {
      break;
    }
    if ((v23 & 2) != 0)
    {
      uint64_t v24 = sub_20DBFFB10();
      uint64_t v14 = 3892346904;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 134218498;
      CFIndex v40 = v29;
      __int16 v41 = 2112;
      char v42 = a1;
      __int16 v43 = 2112;
      CFStringRef v44 = v17;
      uint64_t v31 = v24;
      id v32 = "No online authorization (%#llx): %@, %@";
LABEL_33:
      _os_log_impl(&dword_20DBFC000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x20u);
      goto LABEL_34;
    }
    if ((v23 & 8) != 0)
    {
      uint64_t v24 = sub_20DBFFB10();
      uint64_t v14 = 3892346918;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 134218498;
      CFIndex v40 = v29;
      __int16 v41 = 2112;
      char v42 = a1;
      __int16 v43 = 2112;
      CFStringRef v44 = v17;
      uint64_t v31 = v24;
      id v32 = "Online authorization rejected (%#llx), %@, %@";
      goto LABEL_33;
    }
    uint64_t v30 = sub_20DBFFB10();
    uint64_t v24 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFIndex v40 = (CFIndex)a1;
        __int16 v41 = 2112;
        char v42 = (void *)v17;
        _os_log_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_DEFAULT, "Online authorization succeeded: %@, %@", buf, 0x16u);
      }

      if (!v35) {
        return 0;
      }
      if (*v35) {
        CFRelease(*v35);
      }
      uint64_t v14 = 0;
      CFTypeRef *v35 = CFRetain(v17);
      return v14;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFIndex v40 = (CFIndex)a1;
      __int16 v41 = 2112;
      char v42 = (void *)v17;
      _os_log_error_impl(&dword_20DBFC000, v24, OS_LOG_TYPE_ERROR, "Online authorization ambiguous: %@, %@", buf, 0x16u);
    }
    uint64_t v14 = 3892346881;
LABEL_34:

    if (v12 == ++v13) {
      return v14;
    }
  }
  char v34 = sub_20DBFFB10();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    CFIndex v40 = v29 & 0x10;
    _os_log_error_impl(&dword_20DBFC000, v34, OS_LOG_TYPE_ERROR, "Auth agent contact failure (entitlement status %lld)", buf, 0xCu);
  }

  return 3892346893;
}

uint64_t sub_20DC1F43C(const __CFData *a1, const __CFArray *a2, int a3, CFTypeRef *a4)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_opt_new();
  int v12 = sub_20DC1E2C4((uint64_t)v8, v9, v10, v11);
  if (!a1 || !a2)
  {
    CFBooleanRef v21 = sub_20DBFFB10();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unsigned int v89 = 134218240;
      *(void *)&v89[4] = a1;
      *(_WORD *)&v89[12] = 2048;
      *(void *)&v89[14] = a2;
      _os_log_error_impl(&dword_20DBFC000, v21, OS_LOG_TYPE_ERROR, "cdHash (%p) or matchedProfileIDs (%p) NULL in checkTrustAndAuthorization", v89, 0x16u);
    }

    CFStringRef v17 = 0;
    CFStringRef v18 = 0;
    uint64_t v13 = 3892346881;
    goto LABEL_95;
  }
  int v78 = v12;
  uint64_t v13 = 3892346881;
  uint64_t v16 = sub_20DC1FF90(a1, a3);
  CFStringRef v17 = 0;
  CFStringRef v18 = 0;
  switch(v16)
  {
    case 0:
    case 3:
      CFDataRef v77 = a1;
      id v73 = a4;
      if (v78)
      {
        id v82 = 0;
        long long v75 = [v8 getUserTrustedUUIDsAndReturnError:v14, (uint64_t)&v82, v15];
        id v19 = v82;
        if (v19)
        {
          CFStringRef v18 = v19;
          CFBooleanRef v20 = sub_20DBFFB10();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)unsigned int v89 = 138412290;
            *(void *)&v89[4] = v18;
            _os_log_error_impl(&dword_20DBFC000, v20, OS_LOG_TYPE_ERROR, "could not retreive trusted UUIDs: %@", v89, 0xCu);
          }

          uint64_t v13 = 3892346917;
          goto LABEL_94;
        }
        CFArrayRef v24 = 0;
      }
      else
      {
        CFArrayRef v24 = sub_20DC24154();
        long long v75 = 0;
      }
      CFIndex Count = CFArrayGetCount(a2);
      unsigned int v76 = -402620378;
      if (Count < 1) {
        goto LABEL_91;
      }
      CFIndex v25 = 0;
      unsigned int v72 = v8;
      break;
    case 1:
      goto LABEL_95;
    case 2:
      CFStringRef v17 = 0;
      CFStringRef v18 = 0;
      uint64_t v13 = 3892346916;
      goto LABEL_95;
    case 4:
      int64_t v23 = sub_20DBFFB10();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v89 = 0;
        _os_log_error_impl(&dword_20DBFC000, v23, OS_LOG_TYPE_ERROR, "Encountered MISStateBlacklisted in trust and auth check (this should not happen)!", v89, 2u);
      }

      CFStringRef v17 = 0;
      CFStringRef v18 = 0;
      uint64_t v13 = 3892346909;
      goto LABEL_95;
    default:
      uint64_t v22 = sub_20DBFFB10();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unsigned int v89 = 134217984;
        *(void *)&v89[4] = v16;
        _os_log_error_impl(&dword_20DBFC000, v22, OS_LOG_TYPE_ERROR, "appApprovalState returned unknown state %ld!", v89, 0xCu);
      }

      CFStringRef v17 = 0;
      CFStringRef v18 = 0;
      goto LABEL_95;
  }
  while (1)
  {
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(a2, v25);
    CFArrayRef v27 = ValueAtIndex;
    if (!ValueAtIndex)
    {
      unint64_t v60 = sub_20DBFFB10();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v89 = 0;
        uint64_t v61 = v60;
        char v62 = "Encountered NULL record when checking trust and authorization";
LABEL_59:
        uint32_t v64 = 2;
        goto LABEL_60;
      }
LABEL_61:

      goto LABEL_62;
    }
    if (CFArrayGetCount(ValueAtIndex) != 4)
    {
      unint64_t v60 = sub_20DBFFB10();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        CFIndex v63 = CFArrayGetCount(v27);
        *(_DWORD *)unsigned int v89 = 134217984;
        *(void *)&v89[4] = v63;
        uint64_t v61 = v60;
        char v62 = "Encountered record of wrong size (%ld) when checking trust and authorization";
        uint32_t v64 = 12;
LABEL_60:
        _os_log_error_impl(&dword_20DBFC000, v61, OS_LOG_TYPE_ERROR, v62, v89, v64);
        goto LABEL_61;
      }
      goto LABEL_61;
    }
    CFIndex v28 = (__CFString *)CFArrayGetValueAtIndex(v27, 0);
    id v32 = v28;
    if (!v28)
    {
      unint64_t v60 = sub_20DBFFB10();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v89 = 0;
        uint64_t v61 = v60;
        char v62 = "Encountered NULL UUID when checking trust and authorization";
        goto LABEL_59;
      }
      goto LABEL_61;
    }
    if (sub_20DC1799C(v28, v29, v30, v31)) {
      break;
    }
    CFArrayRef v33 = sub_20DC24154();
    uint64_t v83 = 0;
    int v84 = &v83;
    uint64_t v85 = 0x2020000000;
    char v86 = 0;
    CFTypeRef cf = sub_20DC1B900(v77);
    if (cf)
    {
      if (sub_20DC1799C(v32, v34, v35, v36)) {
        goto LABEL_70;
      }
      *(void *)unsigned int v89 = MEMORY[0x263EF8330];
      *(void *)&v89[8] = 3221225472;
      *(void *)&v89[16] = sub_20DC20104;
      CFArrayRef v90 = &unk_26412A200;
      uint64_t v74 = v32;
      unsigned int v91 = &v83;
      v92 = v32;
      v93 = cf;
      CFIndex v37 = CFArrayGetCount(v33);
      if (v37 < 1) {
        goto LABEL_66;
      }
      CFIndex v38 = v37;
      CFIndex v39 = 0;
      CFIndex v80 = v37;
      while (2)
      {
        CFIndex v40 = CFArrayGetValueAtIndex(v33, v39);
        CFTypeID v41 = CFGetTypeID(v40);
        if (v41 == CFDictionaryGetTypeID())
        {
          CFArrayRef v42 = v24;
          CFArrayRef v43 = a2;
          CFArrayRef v44 = v33;
          CFDictionaryRef v45 = (const __CFDictionary *)CFArrayGetValueAtIndex(v33, v39);
          CFURLRef Value = CFDictionaryGetValue(v45, @"upp-uuid");
          uint64_t v47 = CFDictionaryGetValue(v45, @"cdhash");
          uint64_t v48 = CFDictionaryGetValue(v45, @"teamid");
          uint64_t v49 = CFDictionaryGetValue(v45, @"wholeProfile");
          if (Value)
          {
            char v50 = v49;
            CFTypeID v51 = CFGetTypeID(Value);
            if (v51 == CFStringGetTypeID())
            {
              if (v47)
              {
                CFTypeID v52 = CFGetTypeID(v47);
                if (v52 == CFStringGetTypeID())
                {
                  if (v48)
                  {
                    CFTypeID v53 = CFGetTypeID(v48);
                    if (v53 == CFStringGetTypeID())
                    {
                      if (v50)
                      {
                        CFTypeID v54 = CFGetTypeID(v50);
                        if (v54 == CFNumberGetTypeID())
                        {
                          *(_DWORD *)unsigned int valuePtr = 0;
                          if (CFNumberGetValue((CFNumberRef)v50, kCFNumberIntType, valuePtr))
                          {
                            a2 = v43;
                            if (!(*(unsigned int (**)(unsigned char *, const void *, const void *, const void *, BOOL))&v89[16])(v89, Value, v47, v48, *(_DWORD *)valuePtr != 0))
                            {
                              CFArrayRef v24 = v42;
                              CFArrayRef v33 = v44;
LABEL_66:
                              uint64_t v8 = v72;
                              id v32 = v74;
                              if (*((unsigned char *)v84 + 24))
                              {
                                uint64_t v65 = sub_20DBFFB10();
                                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)unsigned int valuePtr = 0;
                                  _os_log_impl(&dword_20DBFC000, v65, OS_LOG_TYPE_DEFAULT, "App is rejected.", valuePtr, 2u);
                                }
                                goto LABEL_69;
                              }
                              goto LABEL_70;
                            }
                          }
                          else
                          {
                            uint64_t v59 = sub_20DBFFB10();
                            a2 = v43;
                            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_20DBFC000, v59, OS_LOG_TYPE_DEFAULT, "rejectionListIterate: could not convert wholeProfile", buf, 2u);
                            }
                          }
                          CFArrayRef v24 = v42;
                          CFIndex v38 = v80;
                          CFArrayRef v33 = v44;
                          goto LABEL_48;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          char v58 = sub_20DBFFB10();
          a2 = v43;
          CFArrayRef v24 = v42;
          CFIndex v38 = v80;
          CFArrayRef v33 = v44;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)unsigned int valuePtr = 0;
            char v56 = v58;
            uint64_t v57 = "rejectionListIterate: malformed row";
LABEL_47:
            _os_log_impl(&dword_20DBFC000, v56, OS_LOG_TYPE_DEFAULT, v57, valuePtr, 2u);
          }
        }
        else
        {
          uint64_t v55 = sub_20DBFFB10();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)unsigned int valuePtr = 0;
            char v56 = v55;
            uint64_t v57 = "rejectionListIterate: row with unknown type";
            goto LABEL_47;
          }
        }
LABEL_48:
        if (v38 == ++v39) {
          goto LABEL_66;
        }
        continue;
      }
    }
    uint64_t v65 = sub_20DBFFB10();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int valuePtr = 0;
      _os_log_error_impl(&dword_20DBFC000, v65, OS_LOG_TYPE_ERROR, "Could not create cdHash hex representation for rejected app check (this should not happen).", valuePtr, 2u);
    }
LABEL_69:

LABEL_70:
    if (v33) {
      CFRelease(v33);
    }
    if (cf) {
      CFRelease(cf);
    }
    int v66 = *((unsigned __int8 *)v84 + 24);
    _Block_object_dispose(&v83, 8);
    if (v66)
    {
      int v67 = -402620378;
LABEL_82:
      unsigned int v76 = v67;
      goto LABEL_62;
    }
    if (!MISExistsIndeterminateApps_0((__CFString *)v77, (uint64_t)v32, 0))
    {
      if (v78)
      {
        if (objc_msgSend_containsObject_(v75, v68, (uint64_t)v32, v69)) {
          goto LABEL_86;
        }
      }
      else if (sub_20DC24378((BOOL)v24, v32))
      {
        goto LABEL_86;
      }
      int v67 = -402620379;
      goto LABEL_82;
    }
LABEL_62:
    if (++v25 == Count) {
      goto LABEL_91;
    }
  }
  uint64_t v70 = sub_20DBFFB10();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v89 = 0;
    _os_log_impl(&dword_20DBFC000, v70, OS_LOG_TYPE_INFO, "UPP is ready, passing through.", v89, 2u);
  }

LABEL_86:
  if (v73)
  {
    if (*v73) {
      CFRelease(*v73);
    }
    unsigned int v76 = 0;
    *id v73 = CFRetain(v32);
  }
  else
  {
    unsigned int v76 = 0;
  }
LABEL_91:
  if (v24) {
    CFRelease(v24);
  }
  CFStringRef v18 = 0;
  uint64_t v13 = v76;
LABEL_94:
  CFStringRef v17 = v75;
LABEL_95:

  return v13;
}

void sub_20DC1FD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20DC1FD78(const __CFData *a1)
{
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  mach_port_t v14;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v17;
  io_connect_t connect;
  uint64_t input;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  uint64_t v22 = *MEMORY[0x263EF8340];
  connect = 0;
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_object_t v5 = MatchingService;
  if (!MatchingService)
  {
    uint64_t v8 = sub_20DBFFB10();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      CFDataRef v9 = "Unable to find AppleMobileFileIntegrity service.";
      uint64_t v10 = v8;
      uint64_t v11 = 2;
      goto LABEL_19;
    }
    goto LABEL_7;
  }
  id v6 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, &connect);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_20DBFFB10();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      CFBooleanRef v21 = v7;
      CFDataRef v9 = "Unable to open AppleMobileFileIntegrity user client: 0x%x";
LABEL_5:
      uint64_t v10 = v8;
      uint64_t v11 = 8;
LABEL_19:
      _os_log_error_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  input = 1;
  uint64_t v14 = connect;
  BytePtr = CFDataGetBytePtr(a1);
  size_t Length = CFDataGetLength(a1);
  CFStringRef v17 = IOConnectCallMethod(v14, 6u, &input, 1u, BytePtr, Length, 0, 0, 0, 0);
  int v12 = v17;
  if (v17)
  {
    if (v17 != -536870160)
    {
      uint64_t v8 = sub_20DBFFB10();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        CFBooleanRef v21 = v12;
        CFDataRef v9 = "AppleMobileFileIntegrity user client call failed: 0x%x";
        goto LABEL_5;
      }
LABEL_7:
      int v12 = 3892346881;

      goto LABEL_8;
    }
    int v12 = 3892346919;
  }
LABEL_8:
  if (connect) {
    IOServiceClose(connect);
  }
  if (v5) {
    IOObjectRelease(v5);
  }
  return v12;
}

uint64_t sub_20DC1FF90(const __CFData *a1, int a2)
{
  CFArrayRef v4 = sub_20DC24154();
  CFArrayRef v5 = sub_20DC24154();
  if (a2 && (MISQueryBlacklistForCdHash(a1, 26, 1, 0) & 1) != 0)
  {
    uint64_t v6 = 4;
  }
  else
  {
    uint64_t v7 = sub_20DC1B900(a1);
    if (v7)
    {
      CFStringRef v8 = v7;
      if (sub_20DC24378((BOOL)v5, v7))
      {
        uint64_t v6 = 3;
      }
      else if (sub_20DC24378((BOOL)v4, v8))
      {
        uint64_t v10 = sub_20DBFFB10();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v12 = 0;
          _os_log_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_DEFAULT, "Previous authorization failed.", v12, 2u);
        }

        uint64_t v6 = 2;
      }
      else
      {
        uint64_t v6 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      CFDataRef v9 = sub_20DBFFB10();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v9, OS_LOG_TYPE_ERROR, "Could not create cdHash hex representation for app approval state (this should not happen).", buf, 2u);
      }

      uint64_t v6 = 1;
    }
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

uint64_t sub_20DC20104(uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4, char a5)
{
  uint64_t v8 = 1;
  if (CFStringCompare(*(CFStringRef *)(a1 + 40), a2, 1uLL) == kCFCompareEqualTo)
  {
    if ((a5 & 1) != 0 || (uint64_t v8 = 1, CFStringCompare(*(CFStringRef *)(a1 + 48), a3, 1uLL) == kCFCompareEqualTo))
    {
      uint64_t v8 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return v8;
}

BOOL MISExistsIndeterminateApps_0(__CFString *a1, uint64_t a2, BOOL *a3)
{
  CFArrayRef v6 = sub_20DC24154();
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 33;
  if (a1 && (a1 = sub_20DC1B900((const __CFData *)a1)) == 0)
  {
    uint64_t v11 = sub_20DBFFB10();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v11, OS_LOG_TYPE_ERROR, "Could not create cdHash hex representation for indeterminate app check (this should not happen).", buf, 2u);
    }

    BOOL v8 = 0;
    a1 = 0;
    if (v6) {
      goto LABEL_19;
    }
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = sub_20DC2037C;
    v13[3] = &unk_26412A228;
    v13[5] = a2;
    v13[6] = a1;
    v13[4] = &v15;
    sub_20DC243FC(v6, (uint64_t)v13);
    int v7 = *((_DWORD *)v16 + 6);
    BOOL v8 = v7 < 1;
    if (v7 <= 0)
    {
      uint64_t v10 = sub_20DBFFB10();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_DEFAULT, "Authorization is pending.", buf, 2u);
      }

      if (!a3)
      {
        BOOL v8 = 1;
        if (!v6) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      BOOL v9 = 0;
      goto LABEL_10;
    }
    if (a3)
    {
      BOOL v9 = v7 < 6;
LABEL_10:
      *a3 = v9;
      if (!v6) {
        goto LABEL_20;
      }
LABEL_19:
      CFRelease(v6);
      goto LABEL_20;
    }
    BOOL v8 = 0;
    if (v6) {
      goto LABEL_19;
    }
  }
LABEL_20:
  if (a1) {
    CFRelease(a1);
  }
  _Block_object_dispose(&v15, 8);
  return v8;
}

void sub_20DC20364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_20DC2037C(void *a1, CFStringRef theString2, __CFString *a3, uint64_t a4, uint64_t a5, const __CFNumber *a6)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFStringRef v10 = (const __CFString *)a1[5];
  if (v10)
  {
    uint64_t v11 = 1;
    if (CFStringCompare(v10, a3, 1uLL)) {
      return v11;
    }
  }
  CFStringRef v12 = (const __CFString *)a1[6];
  if (v12)
  {
    uint64_t v11 = 1;
    if (CFStringCompare(v12, theString2, 1uLL)) {
      return v11;
    }
  }
  if (sub_20DC1799C(a3, (const char *)theString2, (uint64_t)a3, a4)) {
    return 1;
  }
  int valuePtr = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  if (!CFNumberGetValue(a6, kCFNumberIntType, &valuePtr))
  {
    uint64_t v15 = sub_20DBFFB10();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = valuePtr;
      _os_log_error_impl(&dword_20DBFC000, v15, OS_LOG_TYPE_ERROR, "Failure getting value of graceCount for record. Got %d, ignoring.", buf, 8u);
    }

    return 1;
  }
  uint64_t v13 = *(void *)(a1[4] + 8);
  int v14 = *(_DWORD *)(v13 + 24);
  if (v14 >= valuePtr) {
    int v14 = valuePtr;
  }
  *(_DWORD *)(v13 + 24) = v14;
  return *(_DWORD *)(*(void *)(a1[4] + 8) + 24) > 0;
}

uint64_t sub_20DC204E8(void *a1, const __CFString *a2, __CFString *a3, int a4, int a5, int a6, char a7)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    CFIndex v28 = sub_20DBFFB10();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v28, OS_LOG_TYPE_ERROR, "Skipping universal/local profile with NULL UUID.", buf, 2u);
    }

    return 1;
  }
  char v7 = a6;
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24)) {
    BOOL v9 = a6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    return 1;
  }
  if (*(void *)(a1[8] + 16))
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 4, MEMORY[0x263EFFF70]);
    if (!Mutable)
    {
      uint64_t v36 = sub_20DBFFB10();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v36, OS_LOG_TYPE_ERROR, "Profile record creation failed, bailing out!", buf, 2u);
      }

      return 0;
    }
    uint64_t v16 = Mutable;
    if (!a3) {
      a3 = &stru_26C24A5F8;
    }
    CFArrayAppendValue(Mutable, a2);
    CFArrayAppendValue(v16, a3);
    uint64_t v17 = (const void *)*MEMORY[0x263EFFB40];
    int v18 = (const void *)*MEMORY[0x263EFFB38];
    if (a4) {
      int v19 = (const void *)*MEMORY[0x263EFFB40];
    }
    else {
      int v19 = (const void *)*MEMORY[0x263EFFB38];
    }
    CFArrayAppendValue(v16, v19);
    if (a5) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = v18;
    }
    CFArrayAppendValue(v16, v20);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1[8] + 16), v16);
    CFRelease(v16);
  }
  if ((a4 & 1) != 0 || a5)
  {
    int64_t v29 = (char *)a1[8];
    if (*v29) {
      char v30 = 1;
    }
    else {
      char v30 = a4;
    }
    char *v29 = v30;
    if (v29[1]) {
      char v31 = 1;
    }
    else {
      char v31 = a5;
    }
    v29[1] = v31;
    BOOL v32 = sub_20DC24378(*(void *)(*(void *)(a1[5] + 8) + 24), a2);
    CFArrayRef v33 = sub_20DBFFB10();
    char v34 = v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v49 = a2;
        _os_log_impl(&dword_20DBFC000, v34, OS_LOG_TYPE_DEFAULT, "Universal/Local Provisioning Profile '%@' is not viable for validation.", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v49 = a2;
        _os_log_impl(&dword_20DBFC000, v34, OS_LOG_TYPE_INFO, "Accepting Universal/Local Provisioning Profile '%@'.", buf, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = !v32;
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      uint64_t v37 = *(void *)(a1[4] + 8);
      if (*(unsigned char *)(v37 + 24)) {
        char v38 = 1;
      }
      else {
        char v38 = v7;
      }
      *(unsigned char *)(v37 + 24) = v38;
      CFIndex v39 = *(const void **)(a1[8] + 8);
      if (v39) {
        CFRelease(v39);
      }
      *(void *)(a1[8] + 8) = CFRetain(a2);
    }
    if (*(unsigned char *)(a1[9] + 64))
    {
      v46[0] = a2;
      v46[1] = a3;
      uint64_t v40 = MEMORY[0x263EFFA80];
      if (a4) {
        uint64_t v41 = MEMORY[0x263EFFA88];
      }
      else {
        uint64_t v41 = MEMORY[0x263EFFA80];
      }
      if (a5) {
        uint64_t v40 = MEMORY[0x263EFFA88];
      }
      v46[2] = v41;
      v46[3] = v40;
      CFArrayRef v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35, v46, 4];
      uint64_t v47 = v42;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v43, (uint64_t)&v47, count:1];
      CFArrayRef v44 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

      int v45 = sub_20DC1F43C(*(const __CFData **)(a1[9] + 24), v44, *(unsigned __int8 *)(a1[9] + 65), 0);
      if (!v45) {
        return 0;
      }
    }
    return 1;
  }
  CFBooleanRef v21 = sub_20DBFFB10();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v49 = a2;
    _os_log_impl(&dword_20DBFC000, v21, OS_LOG_TYPE_INFO, "Using Provisioning Profile '%@'.", buf, 0xCu);
  }

  uint64_t v22 = a1[8];
  *(unsigned char *)(v22 + 2) = 1;
  *(unsigned char *)(v22 + 3) = a7;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    return 0;
  }
  uint64_t v23 = *(void *)(a1[4] + 8);
  if (*(unsigned char *)(v23 + 24)) {
    char v24 = 1;
  }
  else {
    char v24 = v7;
  }
  *(unsigned char *)(v23 + 24) = v24;
  CFIndex v25 = *(const void **)(v22 + 8);
  if (v25) {
    CFRelease(v25);
  }
  CFTypeRef v26 = CFRetain(a2);
  uint64_t result = 0;
  *(void *)(a1[8] + 8) = v26;
  return result;
}

uint64_t sub_20DC2096C(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  if (*(unsigned char *)(a2 + 16))
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    return 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
}

uint64_t sub_20DC209CC(uint64_t a1, uint64_t a2)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a2 + 16))
  {
    CFStringRef v5 = *(const __CFString **)a2;
    CFArrayRef v6 = *(void **)(a2 + 24);
    *(_DWORD *)buf = -402620415;
    char v7 = sub_20DC1CBD4(v6, v5, 0, (int *)buf);
    BOOL v8 = v7;
    if (v7) {
      BOOL v9 = *(_DWORD *)buf == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      int v15 = MISProvisioningProfileCheckValidity(v7, *(const __CFString **)(a1 + 80), *(const __CFDate **)(a1 + 88));
      if (v15)
      {
        int v19 = v15;
        if (v15 == -402620399) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
        CFStringRef v10 = sub_20DBFFB10();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = v19;
        CFStringRef v12 = "Skipping a profile because of error %#x.\n";
        uint64_t v13 = v10;
        uint32_t v14 = 8;
        goto LABEL_14;
      }
      CFBooleanRef v21 = [v8 v16:v17 v18];

      if (v21)
      {
        v99.size_t length = CFArrayGetCount((CFArrayRef)v21);
        v99.location = 0;
        int v22 = CFArrayContainsValue((CFArrayRef)v21, v99, *(const void **)(a1 + 96));
        uint64_t v3 = 1;
        if (!v22) {
          goto LABEL_17;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      CFURLRef Value = MISProfileGetValue(v8, @"UUID");
      CFArrayRef v27 = [v8 objc_msgSend_entitlements:v24, v25, v26];

      if (v27)
      {
        if (MISProvisioningProfileIsForBetaDeployment(v8, v28, v29, v30))
        {
          CFDictionaryRef v31 = *(const __CFDictionary **)(*(void *)(a1 + 104) + 8);
          if (v31)
          {
            if (CFDictionaryContainsKey(v31, @"application-identifier")
              && !sub_20DC21200(v8, *(const __CFData **)(*(void *)(a1 + 104) + 24), *(void **)(*(void *)(a1 + 104) + 56)))
            {
              uint64_t v80 = *(void *)(a1 + 56);
LABEL_61:
              uint64_t v3 = 1;
              *(unsigned char *)(*(void *)(v80 + 8) + 24) = 1;
              goto LABEL_17;
            }
          }
        }
        uint64_t v83 = (uint64_t)Value;
        int v84 = (void *)a1;
        CFTypeRef cf = v27;
        BOOL v32 = MISProfileGetValue(v8, @"AppAudience");
        uint64_t v85 = v8;
        CFArrayRef v33 = MISProfileGetValue(v8, @"UUID");
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id obj = v32;
        uint64_t v35 = [obj countByEnumeratingWithState:v34 objects:(void *)&v88 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v89;
          char v38 = @"InternalBuild";
          while (2)
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v89 != v37) {
                objc_enumerationMutation(obj);
              }
              id v40 = *(id *)(*((void *)&v88 + 1) + 8 * i);
              id v41 = v33;
              if (objc_msgSend_isEqual_(v40, v42, (uint64_t)v38, v43, cf))
              {
                id v87 = v41;
                uint64_t v46 = v36;
                uint64_t v47 = v38;
                uint64_t v48 = sub_20DC24098();
                CFStringRef v49 = @"Internal";
                int isEqualToString = [v48 isEqualToString:v50];

                int v53 = MGGetBoolAnswer();
                CFTypeID v54 = sub_20DBFFB10();
                int v55 = v53 ^ 1;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t v94 = 138543874;
                  id v95 = v40;
                  __int16 v96 = 1024;
                  *(_DWORD *)uint64_t v97 = isEqualToString;
                  *(_WORD *)&v97[4] = 1024;
                  *(_DWORD *)&v97[6] = v55;
                  _os_log_impl(&dword_20DBFC000, v54, OS_LOG_TYPE_DEFAULT, "Checking %{public}@ App Audience, %d, %d", v94, 0x18u);
                }

                if (((v55 | isEqualToString) & 1) == 0)
                {
                  CFDataRef v77 = sub_20DBFFB10();
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)uint64_t v94 = 138543618;
                    id v95 = v40;
                    __int16 v96 = 2114;
                    *(void *)uint64_t v97 = v33;
                    _os_log_error_impl(&dword_20DBFC000, v77, OS_LOG_TYPE_ERROR, "Denying profile %{public}@ due to %{public}@ App Audience", v94, 0x16u);
                  }

                  int v78 = v84;
                  BOOL v8 = v85;
                  id v41 = v87;
LABEL_58:

                  long long v79 = sub_20DBFFB10();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)uint64_t v94 = 138543618;
                    id v95 = v40;
                    __int16 v96 = 2114;
                    *(void *)uint64_t v97 = v33;
                    _os_log_error_impl(&dword_20DBFC000, v79, OS_LOG_TYPE_ERROR, "App audience %{public}@ from profile %{public}@ not matched", v94, 0x16u);
                  }

                  uint64_t v80 = v78[8];
                  goto LABEL_61;
                }
                char v38 = v47;
                uint64_t v36 = v46;
                id v41 = v87;
              }
              else
              {
                int isEqual = [v40 isEqual:v44 string:@"NoExecute" v45];
                uint64_t v57 = sub_20DBFFB10();
                uint64_t v48 = v57;
                if (isEqual)
                {
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)uint64_t v94 = 138543618;
                    id v95 = v40;
                    __int16 v96 = 2114;
                    *(void *)uint64_t v97 = v33;
                    _os_log_error_impl(&dword_20DBFC000, v48, OS_LOG_TYPE_ERROR, "Denying profile %{public}@ due to %{public}@ App Audience", v94, 0x16u);
                  }
                  int v78 = v84;
                  BOOL v8 = v85;
                  goto LABEL_58;
                }
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t v94 = 138543618;
                  id v95 = v40;
                  __int16 v96 = 2114;
                  *(void *)uint64_t v97 = v33;
                  _os_log_impl(&dword_20DBFC000, v48, OS_LOG_TYPE_DEFAULT, "Ignoring unenforced App Audience: %{public}@ from profile %{public}@", v94, 0x16u);
                }
              }
            }
            uint64_t v36 = [obj countByEnumeratingWithState:(NSFastEnumerationState *)&v88 objects:(id *)buf count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }

        BOOL v8 = v85;
        if (!*(void *)(v84[13] + 8)
          || (uint64_t v62 = objc_msgSend_derEntitlements(v85, v59, v60, v61),
              uint64_t v63 = *(void *)(v84[13] + 16),
              BOOL v64 = MISProvisioningProfileIsAppleInternalProfile(v85) != 0,
              (sub_20DC21534(v62, v63, v83, v64) & 1) != 0))
        {
          if (!sub_20DC1A75C(v85, @"LocalProvision")
            || (uint64_t v65 = v84[13], *(unsigned char *)(v65 + 49))
            || sub_20DC21614(*(void *)(v65 + 32), *(void *)(v65 + 40), cf, v83))
          {
            *(unsigned char *)(*(void *)(v84[9] + 8) + 24) = 1;
            int v66 = sub_20DBFFB10();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v93 = v83;
              _os_log_impl(&dword_20DBFC000, v66, OS_LOG_TYPE_DEFAULT, "Keep going %@", buf, 0xCu);
            }

            uint64_t v67 = v84[4];
            id v68 = MISProfileGetValue(v85, @"UUID");
            TeamIdentifier = MISProvisioningProfileGetTeamIdentifier(v85);
            BOOL v70 = sub_20DC1A75C(v85, @"ProvisionsAllDevices") != 0;
            BOOL v71 = sub_20DC1A75C(v85, @"LocalProvision") != 0;
            BOOL v72 = MISProfileIsDEREncoded(v85) != 0;
            BOOL v76 = MISProvisioningProfileIsForBetaDeployment(v85, v73, v74, v75) != 0;
            uint64_t v3 = (*(uint64_t (**)(uint64_t, void *, const void *, BOOL, BOOL, BOOL, BOOL))(v67 + 16))(v67, v68, TeamIdentifier, v70, v71, v72, v76);
            goto LABEL_17;
          }
          long long v81 = sub_20DBFFB10();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v93 = v83;
            _os_log_impl(&dword_20DBFC000, v81, OS_LOG_TYPE_DEFAULT, "Local Profile '%@' has non-matching application-identifier.", buf, 0xCu);
          }
        }
        *(unsigned char *)(*(void *)(v84[9] + 8) + 24) = 0;
        goto LABEL_16;
      }
      CFStringRef v10 = sub_20DBFFB10();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)Value;
        _os_log_error_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_ERROR, "Skipping profile '%@' because it has no entitlement match list?", buf, 0xCu);
      }
    }
    else
    {
      CFStringRef v10 = sub_20DBFFB10();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v11 = *(const __CFString **)a2;
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)v11;
        CFStringRef v12 = "Skipping a profile %@";
        uint64_t v13 = v10;
        uint32_t v14 = 12;
LABEL_14:
        _os_log_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
LABEL_15:

LABEL_16:
    uint64_t v3 = 1;
LABEL_17:

    return v3;
  }
  uint64_t v3 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return v3;
}

BOOL sub_20DC21200(MISProfile *a1, const __CFData *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CFIndex v28 = a1;
  if (a1)
  {
    CFStringRef v5 = a1;
    CFRetain(a1);
  }
  else
  {
    if (MISCopyProvisioningProfile(0, &v28)) {
      return 0;
    }
    CFStringRef v5 = v28;
  }
  int v9 = [a3 v6:v7:v8];
  CFStringRef v10 = @"OSX";
  switch(v9)
  {
    case 1:
      break;
    case 2:
      CFStringRef v10 = @"iOS";
      break;
    case 3:
      CFStringRef v10 = @"tvOS";
      break;
    case 4:
      CFStringRef v10 = @"watchOS";
      break;
    case 10:
      CFStringRef v12 = sub_20DC1E494();
      uint64_t v13 = @"iOS";
      if (!v12) {
        uint64_t v13 = 0;
      }
      CFStringRef v10 = v13;

      break;
    case 11:
      CFStringRef v10 = @"xrOS";
      break;
    default:
      CFStringRef v11 = sub_20DBFFB10();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v9;
        _os_log_error_impl(&dword_20DBFC000, v11, OS_LOG_TYPE_ERROR, "Invalid platform: %du", buf, 8u);
      }

      CFStringRef v10 = @"invalid";
      break;
  }
  uint32_t v14 = sub_20DC1E494();
  BOOL v15 = sub_20DC1E3FC((uint64_t)v14, v5, v10);

  uint64_t v16 = sub_20DC24098();
  uint64_t v17 = @"Internal";
  int isEqualToString = [v16 isEqualToString:v18];

  if (!v15 && isEqualToString)
  {
    CFBooleanRef v21 = sub_20DBFFB10();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v10;
      _os_log_error_impl(&dword_20DBFC000, v21, OS_LOG_TYPE_ERROR, "TestFlight platform policy failed, the profile did not include the expected platform %@, this would have been a critical failure on a customer build", buf, 0xCu);
    }

    goto LABEL_22;
  }
  if (!v15)
  {
    uint64_t v26 = sub_20DBFFB10();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = v10;
      _os_log_error_impl(&dword_20DBFC000, v26, OS_LOG_TYPE_ERROR, "TestFlight platform policy failed, the profile did not include the expected platform %@", buf, 0xCu);
    }

    return 0;
  }
LABEL_22:

  int v22 = sub_20DC1B900(a2);
  if (!v22)
  {
    BOOL v25 = 1;
    if (!v5) {
      return v25;
    }
    goto LABEL_33;
  }
  CFStringRef v23 = v22;
  CFArrayRef Value = (const __CFArray *)MISProfileGetValue(v5, @"ProvisioningCDHashes");
  if (Value) {
    BOOL v25 = MISArrayAllowsEntitlementValue(Value, v23) != 0;
  }
  else {
    BOOL v25 = 1;
  }
  CFRelease(v23);
  if (v5) {
LABEL_33:
  }
    CFRelease(v5);
  return v25;
}

uint64_t sub_20DC21534(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(v4) = a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (CEContextIsSubset() == *MEMORY[0x263F8BAF0]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v4;
  }
  if ((v4 & 1) == 0)
  {
    CFArrayRef v6 = sub_20DBFFB10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = a3;
      _os_log_error_impl(&dword_20DBFC000, v6, OS_LOG_TYPE_ERROR, "Profile %@ failed to validate entitlements", (uint8_t *)&v8, 0xCu);
    }
  }
  return v4;
}

BOOL sub_20DC21614(uint64_t a1, uint64_t a2, CFTypeRef cf, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFTypeID v8 = CFGetTypeID(cf);
  if (v8 == CFDictionaryGetTypeID())
  {
    [NSString stringWithFormat:@"%@.%@.%@", v9, v10, a2, a1];
    CFStringRef v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = MISEntitlementDictionaryAllowsEntitlementValue((const __CFDictionary *)cf, @"application-identifier", v11) != 0;
  }
  else
  {
    uint64_t v13 = sub_20DBFFB10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = a4;
      __int16 v17 = 2112;
      CFTypeRef v18 = cf;
      _os_log_error_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_ERROR, "Local Profile '%@' entitlement match list is not a dictionary, but '%@'.", buf, 0x16u);
    }

    return 0;
  }
  return v12;
}

uint64_t sub_20DC21748(uint64_t a1, const void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(const void **)(a1 + 32);
  CFDateRef v4 = *(const __CFDate **)(a1 + 40);
  SecTrustRef trust = 0;
  OSStatus v5 = SecTrustCreateWithCertificates(v3, a2, &trust);
  if (v5)
  {
    OSStatus v6 = v5;
    uint64_t v7 = sub_20DBFFB10();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      uint64_t v9 = 3892346904;

      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    CFTypeID v8 = "SecTrustCreateWithCertificates failed: %d";
LABEL_4:
    _os_log_impl(&dword_20DBFC000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 8u);
    goto LABEL_5;
  }
  if (v4)
  {
    OSStatus v11 = SecTrustSetVerifyDate(trust, v4);
    if (v11)
    {
      OSStatus v12 = v11;
      uint64_t v7 = sub_20DBFFB10();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v12;
      CFTypeID v8 = "SecTrustSetVerifyDate failed: %d";
      goto LABEL_4;
    }
  }
  CFTypeRef cf = 0;
  if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v13 = sub_20DBFFB10();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v17 = cf;
      _os_log_impl(&dword_20DBFC000, v13, OS_LOG_TYPE_INFO, "SecTrustEvaluateWithError failed: %@", buf, 0xCu);
    }
    uint64_t v9 = 3892346904;

    CFRelease(cf);
  }
LABEL_6:
  if (trust) {
    CFRelease(trust);
  }
  CFRelease(a2);
  return v9;
}

uint64_t sub_20DC21908()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  CFURLRef v1 = (void *)qword_26772D3C0;
  qword_26772D3C0 = (uint64_t)v0;

  uint64_t v3 = qword_26772D3C0;

  return MEMORY[0x270F9A6D0](v3, sel_setCountLimit_, 100, v2);
}

uint64_t MISValidateSignature(const __CFString *a1, const __CFDictionary *a2)
{
  return MISValidateSignatureAndCopyInfoWithProgress(a1, a2, 0, 0);
}

uint64_t MISAppApprovalState(const __CFString *a1, const __CFDictionary *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  Boolean v48 = 1;
  Boolean v47 = 0;
  if (sub_20DBFFB74(a2, @"HonorBlocklist", &v48))
  {
    CFDateRef v4 = sub_20DBFFB10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v4, OS_LOG_TYPE_ERROR, "MISAppAprovalState failed to check kMISValidationOptionHonorBlocklist option.", buf, 2u);
    }

    Boolean v48 = 1;
  }
  unsigned int v46 = sub_20DBFFB74(a2, @"ReportIndeterminateSoon", &v47);
  if (v46)
  {
    OSStatus v5 = sub_20DBFFB10();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v5, OS_LOG_TYPE_ERROR, "MISAppAprovalState failed to check kMISAppApprovalStateReportIndeterminateSoon option.", buf, 2u);
    }

    Boolean v47 = 0;
  }
  OSStatus v6 = (const __SecCode *)sub_20DC015DC(a1, (uint64_t)a2, (int *)&v46);
  if (!v6)
  {
    uint64_t v9 = sub_20DBFFB10();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v51) = v46;
      _os_log_impl(&dword_20DBFC000, v9, OS_LOG_TYPE_DEFAULT, "Could not copy signature: 0x%x", buf, 8u);
    }
    uint64_t v13 = 1;
    goto LABEL_63;
  }
  uint64_t v7 = v6;
  sub_20DC01D24(v6);
  CFDictionaryRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (!v8)
  {
LABEL_20:
    uint64_t v13 = 1;
    goto LABEL_62;
  }
  CFDataRef v10 = (const __CFData *)sub_20DC01D90(v8);
  if (!v10)
  {
    BOOL v15 = sub_20DBFFB10();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v51) = v46;
      _os_log_impl(&dword_20DBFC000, v15, OS_LOG_TYPE_DEFAULT, "Could not extract cdhash: 0x%x", buf, 8u);
    }

    goto LABEL_20;
  }
  OSStatus v11 = (__CFString *)v10;
  int v12 = v48;
  uint64_t v13 = sub_20DC1FF90(v10, v48);
  if (v13) {
    goto LABEL_13;
  }
  CFDictionaryRef v16 = v9;
  CFArrayRef Value = CFDictionaryGetValue(v16, (const void *)*MEMORY[0x263F171F8]);
  uint64_t v18 = CFDictionaryGetValue(v16, (const void *)*MEMORY[0x263F17218]);
  if (!Value || (uint64_t v19 = v18) == 0)
  {
LABEL_50:

LABEL_51:
    CFArrayRef v35 = sub_20DC01C34(v16, (int *)&v46);
    if (!v35)
    {
      id v41 = sub_20DBFFB10();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v51) = v46;
        _os_log_impl(&dword_20DBFC000, v41, OS_LOG_TYPE_DEFAULT, "Could not extract signer: 0x%x", buf, 8u);
      }

      uint64_t v13 = 1;
      goto LABEL_13;
    }
    CFArrayRef v36 = v35;
    uint64_t v37 = sub_20DC01B40(v16, (int *)&v46);
    if (v46)
    {
      char v38 = sub_20DBFFB10();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v51) = v46;
        CFIndex v39 = "Could not extract signing time: 0x%x";
LABEL_55:
        _os_log_impl(&dword_20DBFC000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 8u);
      }
    }
    else
    {
      uint64_t v42 = sub_20DC1E54C(v36, (uint64_t)v37, (int *)&v46);
      if (v42 == 2)
      {
        buf[0] = 0;
        if (!MISExistsIndeterminateApps_0(v11, 0, (BOOL *)buf))
        {
          if (v47) {
            BOOL v43 = buf[0] == 0;
          }
          else {
            BOOL v43 = 1;
          }
          if (v43) {
            uint64_t v13 = 0;
          }
          else {
            uint64_t v13 = 5;
          }
LABEL_58:
          if (v37) {
            CFRelease(v37);
          }
          CFRelease(v11);
          uint32_t v14 = v36;
          goto LABEL_61;
        }
LABEL_57:
        uint64_t v13 = 1;
        goto LABEL_58;
      }
      if (v42)
      {
        uint64_t v13 = 0;
        goto LABEL_58;
      }
      char v38 = sub_20DBFFB10();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v51) = v46;
        CFIndex v39 = "Could not validate certificate: 0x%x";
        goto LABEL_55;
      }
    }

    goto LABEL_57;
  }
  CFTypeID v20 = CFGetTypeID(Value);
  if (v20 != CFArrayGetTypeID())
  {
    uint64_t v30 = sub_20DBFFB10();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFIndex v51 = (CFIndex)Value;
      uint64_t v31 = "CdHashes are not an array, but %@!";
LABEL_42:
      BOOL v32 = v30;
      uint32_t v33 = 12;
LABEL_43:
      _os_log_error_impl(&dword_20DBFC000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    }
LABEL_49:

    goto LABEL_50;
  }
  CFTypeID v21 = CFGetTypeID(v19);
  if (v21 != CFArrayGetTypeID())
  {
    uint64_t v30 = sub_20DBFFB10();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFIndex v51 = (CFIndex)v19;
      uint64_t v31 = "Algorithms are not an array, but %@!";
      goto LABEL_42;
    }
    goto LABEL_49;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  if (CFArrayGetCount((CFArrayRef)v19) != Count)
  {
    uint64_t v30 = sub_20DBFFB10();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    CFIndex v34 = CFArrayGetCount((CFArrayRef)v19);
    *(_DWORD *)buf = 134218240;
    CFIndex v51 = Count;
    __int16 v52 = 2048;
    CFIndex v53 = v34;
    uint64_t v31 = "CdHashes count (%ld) != Algorithms count (%ld)!\n";
    BOOL v32 = v30;
    uint32_t v33 = 22;
    goto LABEL_43;
  }
  if (Count < 1) {
    goto LABEL_50;
  }
  CFIndex v23 = 0;
  CFDictionaryRef v45 = v16;
  while (1)
  {
    CFArrayRef v24 = (const __CFArray *)Value;
    CFIndex v25 = Count;
    uint64_t v26 = v19;
    CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v19, v23);
    CFTypeID v28 = CFGetTypeID(ValueAtIndex);
    if (v28 != CFNumberGetTypeID())
    {
      uint64_t v30 = sub_20DBFFB10();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        CFIndex v51 = v23;
        __int16 v52 = 2112;
        CFIndex v53 = (CFIndex)ValueAtIndex;
        _os_log_error_impl(&dword_20DBFC000, v30, OS_LOG_TYPE_ERROR, "Algorithm at index %ld is not a number, but %@!", buf, 0x16u);
      }
      CFDictionaryRef v16 = v45;
      goto LABEL_49;
    }
    int valuePtr = 0;
    if (!CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt32Type, &valuePtr))
    {
      uint64_t v29 = sub_20DBFFB10();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        CFIndex v51 = v23;
        __int16 v52 = 2112;
        CFIndex v53 = (CFIndex)ValueAtIndex;
        _os_log_error_impl(&dword_20DBFC000, v29, OS_LOG_TYPE_ERROR, "Could not get numeric value for algorithm at index %ld: %@", buf, 0x16u);
      }

      goto LABEL_35;
    }
    if (valuePtr == 1) {
      break;
    }
LABEL_35:
    ++v23;
    CFIndex Count = v25;
    BOOL v43 = v25 == v23;
    uint64_t v19 = v26;
    CFArrayRef Value = v24;
    CFDictionaryRef v16 = v45;
    if (v43) {
      goto LABEL_50;
    }
  }
  CFArrayRef v44 = CFArrayGetValueAtIndex(v24, v23);
  CFRetain(v44);
  CFDictionaryRef v16 = v45;

  if (!v44) {
    goto LABEL_51;
  }
  uint64_t v13 = sub_20DC1FF90((const __CFData *)v44, v12);
  CFRelease(v44);
  if (v13 != 4 && (v13 & 6) != 2) {
    goto LABEL_51;
  }
LABEL_13:
  uint32_t v14 = v11;
LABEL_61:
  CFRelease(v14);
LABEL_62:
  CFRelease(v7);
LABEL_63:

  return v13;
}

BOOL MISExistsIndeterminateAppsByUPP(uint64_t a1)
{
  return MISExistsIndeterminateApps_0(0, a1, 0);
}

void MISValidateUPP(__CFString *a1, void *a2, void *a3)
{
  OSStatus v5 = a2;
  OSStatus v6 = a3;
  if (sub_20DC1799C(a1, v7, v8, v9))
  {
    v6[2](v6, 3, 0);
  }
  else
  {
    CFArrayRef v10 = sub_20DC24154();
    BOOL v11 = sub_20DC24378((BOOL)v10, a1);
    if (v10) {
      CFRelease(v10);
    }
    if (v11)
    {
      v6[2](v6, 2, 0);
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = sub_20DC221B4;
      v12[3] = &unk_26412A0F8;
      uint32_t v14 = a1;
      uint64_t v13 = v6;
      dispatch_async(v5, v12);
    }
  }
}

void sub_20DC221B4(uint64_t a1)
{
  v6[0] = 0;
  v6[1] = v6;
  time_t v6[2] = 0x2020000000;
  void v6[3] = 0;
  v5[0] = 0;
  v5[1] = v5;
  void v5[2] = 0x2020000000;
  v5[3] = 0;
  CFArrayRef v2 = sub_20DC24154();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_20DC222DC;
  unint64_t v4[3] = &unk_26412A0D0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[5] = v5;
  v4[6] = v3;
  v4[4] = v6;
  sub_20DC243FC(v2, (uint64_t)v4);
  if (v2) {
    CFRelease(v2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v6, 8);
}

void sub_20DC222B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20DC222DC(uint64_t a1, const __CFString *a2, CFStringRef theString2, const __CFString *a4)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (CFStringCompare(*(CFStringRef *)(a1 + 48), theString2, 1uLL)) {
    return 1;
  }
  CFIndex Length = CFStringGetLength(a2);
  uint64_t v8 = Length;
  if (Length)
  {
LABEL_46:
    id v41 = sub_20DBFFB10();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_47:

      return 1;
    }
    *(_DWORD *)buf = 136315138;
    CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
    CFDictionaryRef v45 = "MISValidateUPP: could not process cdhash '%s'";
LABEL_54:
    _os_log_error_impl(&dword_20DBFC000, v41, OS_LOG_TYPE_ERROR, v45, buf, 0xCu);
    goto LABEL_47;
  }
  if (Length >= 0) {
    uint64_t v9 = Length;
  }
  else {
    uint64_t v9 = Length + 1;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  BOOL v11 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v9 | 1, 0);
  if (!CFStringGetCString(a2, v11, v9 | 1, 0x600u)) {
    goto LABEL_37;
  }
  CFIndex v12 = v9 >> 1;
  uint64_t v13 = (UInt8 *)CFAllocatorAllocate(v10, v12, 0);
  uint32_t v14 = v13;
  if (v8 >= 2)
  {
    BOOL v15 = (unsigned __int8 *)(v11 + 1);
    CFDictionaryRef v16 = v13;
    CFIndex v17 = v12;
    do
    {
      int v18 = *(v15 - 1);
      unsigned int v19 = v18 - 48;
      unsigned int v20 = v18 - 97;
      char v21 = v18 - 55;
      BOOL v22 = (v18 - 65) < 6;
      if ((v18 - 65) >= 6) {
        char v21 = 0;
      }
      char v23 = v18 - 87;
      BOOL v24 = v20 > 5;
      int v25 = v20 <= 5 || v22;
      if (v24) {
        char v23 = v21;
      }
      if (v19 < 0xA)
      {
        int v25 = 1;
        char v23 = v19;
      }
      char v26 = 16 * v23;
      int v27 = *v15;
      unsigned int v28 = v27 - 48;
      unsigned int v29 = v27 - 97;
      char v30 = v27 - 55;
      BOOL v31 = (v27 - 65) < 6;
      if ((v27 - 65) >= 6) {
        char v30 = 0;
      }
      char v32 = v27 - 87;
      BOOL v33 = v29 > 5;
      char v34 = v29 <= 5 || v31;
      if (v33) {
        char v35 = v30;
      }
      else {
        char v35 = v32;
      }
      if (v28 >= 0xA) {
        char v36 = v34;
      }
      else {
        char v36 = 1;
      }
      if (v28 >= 0xA) {
        LOBYTE(v28) = v35;
      }
      *CFDictionaryRef v16 = v28 | v26;
      if (!v25 || (v36 & 1) == 0) {
        goto LABEL_36;
      }
      ++v16;
      v15 += 2;
    }
    while (--v17);
  }
  CFDataRef v37 = CFDataCreateWithBytesNoCopy(v10, v14, v12, v10);
  if (!v37 && v14)
  {
LABEL_36:
    CFAllocatorDeallocate(v10, v14);
LABEL_37:
    CFDataRef v37 = 0;
  }
  if (v11) {
    CFAllocatorDeallocate(v10, v11);
  }
  if (!v37) {
    goto LABEL_46;
  }
  int64_t v38 = sub_20DC22F3C(v37, *(const __CFString **)(a1 + 48), a4, 0, 0, 0, 0, 2, 0);
  CFRelease(v37);
  if ((v38 & 1) == 0)
  {
    if ((v38 & 2) != 0)
    {
      BOOL v43 = sub_20DBFFB10();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        CFArrayRef v44 = *(const char **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        CStringPtr = v44;
        _os_log_impl(&dword_20DBFC000, v43, OS_LOG_TYPE_DEFAULT, "Provisioning profile '%@' is banned.", buf, 0xCu);
      }

      uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v40 = 2;
      goto LABEL_52;
    }
    if ((v38 & 8) == 0)
    {
      if ((v38 & 0x34) != 0)
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v38 & 0x34;
        uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v40 = 1;
LABEL_52:
        *(void *)(v39 + 24) = v40;
        return 1;
      }
      id v41 = sub_20DBFFB10();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 134217984;
      CStringPtr = (const char *)v38;
      CFDictionaryRef v45 = "MISValidateUPP: weird answer 0x%llx encountered.";
      goto LABEL_54;
    }
    unsigned int v46 = sub_20DBFFB10();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      Boolean v47 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      CStringPtr = v47;
      _os_log_impl(&dword_20DBFC000, v46, OS_LOG_TYPE_DEFAULT, "Profile '%@' has a rejected app.", buf, 0xCu);
    }
  }
  return 1;
}

uint64_t MISUPPTrusted(const __CFString *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (sub_20DC1E2C4((uint64_t)a1, a2, a3, a4))
  {
    OSStatus v5 = objc_opt_new();
    id v17 = 0;
    uint64_t v7 = [v5 profileEntryExistsWithUuidString:v6 error:&v17];
    id v11 = v17;
    if (v11)
    {
      CFIndex v12 = sub_20DBFFB10();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v19 = a1;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_error_impl(&dword_20DBFC000, v12, OS_LOG_TYPE_ERROR, "could not retrieve profile entry for UUID %@: %@", buf, 0x16u);
      }

      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = [v7 v8:v9 v10];
    }

    return v13;
  }
  else
  {
    CFArrayRef v14 = sub_20DC24154();
    BOOL v15 = sub_20DC24378((BOOL)v14, a1);
    CFRelease(v14);
    return v15;
  }
}

uint64_t MISCopyAuxiliarySignature(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = objc_opt_new();
  id v12 = 0;
  CFDateRef v4 = [v2 getAuxiliarySignatureWithTeamId:a1 error:&v12];
  id v8 = v12;
  if (v8)
  {
    uint64_t v9 = sub_20DBFFB10();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = a1;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl(&dword_20DBFC000, v9, OS_LOG_TYPE_ERROR, "encountered error when retrieving auxiliary signature for teamId %@: %@", buf, 0x16u);
    }

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [v4 v5:v6:v7];
  }

  return v10;
}

uint64_t MISProfileSupportsAuxiliarySignature(void *a1)
{
  CFArrayRef Value = MISProfileGetValue(a1, @"UUID");
  uint64_t result = sub_20DC1A75C(a1, @"ProvisionsAllDevices");
  if (result) {
    return !sub_20DC1799C(Value, v4, v5, v6);
  }
  return result;
}

void MISSetUPPTrust(const __CFString *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4 = (int)a2;
  if (sub_20DC1E2C4((uint64_t)a1, a2, a3, a4))
  {
    CFStringRef v6 = a1;
    if (v4)
    {
      MISSetProfileTrust(a1, 0);
      return;
    }
    int v7 = 0;
    int v8 = 1;
  }
  else
  {
    CFStringRef v6 = a1;
    int v7 = v4;
    int v8 = 0;
  }

  sub_20DC23458(v6, v7, v8, 0, 0);
}

void MISSetProfileTrust(const __CFString *a1, const __CFData *a2)
{
  CFTypeRef cf = 0;
  int v4 = MISCopyProvisioningProfile(a1, (MISProfile **)&cf);
  CFTypeRef v5 = cf;
  if (v4)
  {
    if (!cf) {
      return;
    }
  }
  else
  {
    TeamIdentifier = (__CFString *)MISProvisioningProfileGetTeamIdentifier((void *)cf);
    sub_20DC23458(a1, 1, 1, TeamIdentifier, a2);
    if (!v5) {
      return;
    }
  }

  CFRelease(v5);
}

void MISRemoveProfileTrust(const __CFString *a1)
{
}

void MISEnumerateTrustedUPPs(void *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  CFURLRef v1 = a1;
  if (sub_20DC1E2C4((uint64_t)v1, v2, v3, v4))
  {
    CFTypeRef v5 = objc_opt_new();
    id v33 = 0;
    int v8 = [v5 getUserTrustedUUIDsAndReturnError:v6, (uint64_t)&v33, v7];
    id v9 = v33;
    if (v9)
    {
      uint64_t v10 = sub_20DBFFB10();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v9;
        _os_log_error_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_ERROR, "could not retreive trusted UUIDs: %@", buf, 0xCu);
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v10 = v8;
      uint64_t v20 = [v10 countByEnumeratingWithState:v19 objects:&v29 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v10);
            }
            v1[2](v1, *(void *)(*((void *)&v29 + 1) + 8 * i));
          }
          uint64_t v21 = [v10 countByEnumeratingWithState:v24 objects:&v29 count:16];
        }
        while (v21);
      }
    }
  }
  else
  {
    CFArrayRef v11 = sub_20DC24154();
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    char v26 = sub_20DC22D70;
    int v27 = &unk_26412A120;
    unsigned int v28 = v1;
    CFIndex Count = CFArrayGetCount(v11);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      for (CFIndex j = 0; j != v13; ++j)
      {
        while (1)
        {
          CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex(v11, j);
          CFTypeID v16 = CFGetTypeID(ValueAtIndex);
          if (v16 != CFStringGetTypeID()) {
            break;
          }
          ++j;
          if (((unsigned int (*)(void *, const void *))v26)(v25, ValueAtIndex)) {
            BOOL v17 = j == v13;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17) {
            goto LABEL_17;
          }
        }
        int v18 = sub_20DBFFB10();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DBFC000, v18, OS_LOG_TYPE_DEFAULT, "authListIterate: row with unknown type", buf, 2u);
        }
      }
    }
LABEL_17:
    CFRelease(v11);
    CFTypeRef v5 = v28;
  }
}

uint64_t sub_20DC22D70(uint64_t a1)
{
  return 1;
}

uint64_t MISValidationCopySignatureVersion(const __CFString *a1, const void **a2)
{
  unsigned int v9 = 0;
  uint64_t v3 = (const __SecCode *)sub_20DC015DC(a1, 0, (int *)&v9);
  if (!v3) {
    return 3892346908;
  }
  uint64_t v4 = v3;
  sub_20DC01D24(v3);
  CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v6 = v5;
  if (v5)
  {
    if (a2) {
      *a2 = sub_20DC01DD0(v5);
    }
  }
  else
  {
    unsigned int v9 = -402620407;
  }
  CFRelease(v4);
  uint64_t v7 = v9;

  return v7;
}

void MISDataMigrate(const __CFNumber *a1)
{
  uint64_t valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr);
  uint64_t v1 = valuePtr;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_string(v2, "type", "rqup");
    xpc_dictionary_set_uint64(v3, "phas", v1);
    uint64_t v4 = sub_20DC2324C(v3);
    CFDictionaryRef v5 = (void *)v4;
    if (v4 && MEMORY[0x210567EF0](v4) != MEMORY[0x263EF8720]) {
      xpc_dictionary_get_int64(v5, "resu");
    }
  }
  else
  {
    CFDictionaryRef v6 = sub_20DBFFB10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v6, OS_LOG_TYPE_ERROR, "Could not create XPC message for requestUpgrade", buf, 2u);
    }

    CFDictionaryRef v5 = 0;
  }
}

int64_t sub_20DC22F3C(const __CFData *a1, const __CFString *a2, const __CFString *a3, const __CFBoolean *a4, const __CFBoolean *a5, const __CFNumber *a6, void *a7, int64_t a8, const __CFString *a9)
{
  CFTypeID v16 = sub_20DC231CC(a2);
  if (!v16) {
    goto LABEL_7;
  }
  BOOL v17 = v16;
  int v18 = (char *)sub_20DC231CC(a3);
  if (!v18)
  {
    free(v17);
LABEL_7:
    uint64_t v22 = 0;
    uint64_t v21 = 0;
    int64_t int64 = 4;
    goto LABEL_28;
  }
  CFStringRef v19 = v18;
  if (a9)
  {
    uint64_t v20 = (char *)sub_20DC231CC(a9);
    if (!v20)
    {
      uint64_t v21 = 0;
LABEL_24:
      uint64_t v22 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
  uint64_t v21 = v24;
  if (!v24) {
    goto LABEL_24;
  }
  uint64_t v37 = a7;
  xpc_dictionary_set_string(v24, "type", "auth");
  int v25 = v20;
  BytePtr = CFDataGetBytePtr(a1);
  size_t Length = CFDataGetLength(a1);
  unsigned int v28 = BytePtr;
  uint64_t v20 = (char *)v25;
  xpc_dictionary_set_data(v21, "cdha", v28, Length);
  xpc_dictionary_set_string(v21, "uuid", (const char *)v17);
  xpc_dictionary_set_string(v21, "team", v19);
  xpc_dictionary_set_int64(v21, "ckty", a8);
  if (v25) {
    xpc_dictionary_set_string(v21, "apppath", v25);
  }
  if (a4)
  {
    BOOL v32 = CFBooleanGetValue(a4) != 0;
    xpc_dictionary_set_BOOL(v21, "univ", v32);
  }
  if (a5)
  {
    BOOL v33 = CFBooleanGetValue(a5) != 0;
    xpc_dictionary_set_BOOL(v21, "locl", v33);
  }
  if (a6)
  {
    uint64_t valuePtr = 0;
    if (CFNumberGetValue(a6, kCFNumberLongLongType, &valuePtr)) {
      xpc_dictionary_set_uint64(v21, "cdvr", valuePtr);
    }
  }
  if (v37)
  {
    [v37 timeIntervalSince1970:v29, v30, v31];
    xpc_dictionary_set_int64(v21, "sgnt", (uint64_t)(v34 * 1000.0));
  }
  uint64_t v35 = sub_20DC2324C(v21);
  uint64_t v22 = (void *)v35;
  if (v35 && MEMORY[0x210567EF0](v35) != MEMORY[0x263EF8720])
  {
    int64_t int64 = xpc_dictionary_get_int64(v22, "resu");
    goto LABEL_26;
  }
LABEL_25:
  int64_t int64 = 4;
LABEL_26:
  free(v17);
  free(v19);
  if (v20) {
    free(v20);
  }
LABEL_28:

  return int64;
}

void *sub_20DC231CC(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v4 = malloc_type_malloc(v3, 0x83B3C0F7uLL);
  if (v4 && !CFStringGetCString(a1, (char *)v4, v3, 0x8000100u))
  {
    free(v4);
    return 0;
  }
  return v4;
}

id sub_20DC2324C(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v1 = a1;
  xpc_object_t v2 = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.online-auth-agent.xpc", v2, 0);

  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &unk_26C249978);
    xpc_connection_resume(mach_service);
    xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
  }
  else
  {
    CFDictionaryRef v5 = sub_20DBFFB10();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      int v8 = "com.apple.online-auth-agent.xpc";
      _os_log_error_impl(&dword_20DBFC000, v5, OS_LOG_TYPE_ERROR, "error, could not lookup %s service", (uint8_t *)&v7, 0xCu);
    }

    xpc_object_t v4 = 0;
  }

  return v4;
}

void sub_20DC23384(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x210567EF0](a2) != MEMORY[0x263EF8720])
  {
    CFIndex v3 = sub_20DBFFB10();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = 0;
      xpc_object_t v4 = "unexpected event in handler for referenced item service\n";
      CFDictionaryRef v5 = (uint8_t *)&v7;
LABEL_10:
      _os_log_error_impl(&dword_20DBFC000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a2 != MEMORY[0x263EF86A0] && a2 != MEMORY[0x263EF86A8])
  {
    CFIndex v3 = sub_20DBFFB10();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      xpc_object_t v4 = "unexpected error with online-auth-agent connection\n";
      CFDictionaryRef v5 = buf;
      goto LABEL_10;
    }
LABEL_11:
  }
}

void sub_20DC23458(const __CFString *a1, int a2, int a3, __CFString *a4, const __CFData *a5)
{
  uint64_t v9 = sub_20DC231CC(a1);
  if (!v9)
  {
    BOOL v17 = sub_20DBFFB10();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v17, OS_LOG_TYPE_ERROR, "Could not convert UPP UUID for setUppTrust", buf, 2u);
    }

    goto LABEL_18;
  }
  uint64_t v10 = v9;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    int v18 = sub_20DBFFB10();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFStringRef v19 = 0;
      _os_log_error_impl(&dword_20DBFC000, v18, OS_LOG_TYPE_ERROR, "Could not create XPC message for setUppTrust", v19, 2u);
    }

    free(v10);
LABEL_18:
    CFTypeID v16 = 0;
    id v12 = 0;
    goto LABEL_19;
  }
  id v12 = v11;
  xpc_dictionary_set_string(v11, "type", "trst");
  xpc_dictionary_set_string(v12, "uuid", (const char *)v10);
  xpc_dictionary_set_BOOL(v12, "trst", a2 != 0);
  xpc_dictionary_set_BOOL(v12, "usdb", a3 != 0);
  if (a4)
  {
    a4 = (__CFString *)sub_20DC231CC(a4);
    xpc_dictionary_set_string(v12, "team", (const char *)a4);
  }
  if (a5)
  {
    BytePtr = CFDataGetBytePtr(a5);
    size_t Length = CFDataGetLength(a5);
    xpc_dictionary_set_data(v12, "xsig", BytePtr, Length);
  }
  uint64_t v15 = sub_20DC2324C(v12);
  CFTypeID v16 = (void *)v15;
  if (v15 && MEMORY[0x210567EF0](v15) != MEMORY[0x263EF8720]) {
    xpc_dictionary_get_int64(v16, "resu");
  }
  free(v10);
  if (a4) {
    free(a4);
  }
LABEL_19:
}

int64_t sub_20DC23674(uint64_t a1, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  CFDictionaryRef v5 = v4;
  if (!v4)
  {
    uint64_t v9 = sub_20DBFFB10();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)xpc_object_t v11 = 0;
      _os_log_error_impl(&dword_20DBFC000, v9, OS_LOG_TYPE_ERROR, "Could not create XPC message for setBlacklistOverride", v11, 2u);
    }

    __int16 v7 = 0;
    goto LABEL_8;
  }
  xpc_dictionary_set_string(v4, "type", "lwov");
  xpc_dictionary_set_uint64(v5, "lwid", a1);
  xpc_dictionary_set_BOOL(v5, "ovrr", a2 != 0);
  uint64_t v6 = sub_20DC2324C(v5);
  __int16 v7 = (void *)v6;
  if (!v6 || MEMORY[0x210567EF0](v6) == MEMORY[0x263EF8720])
  {
LABEL_8:
    int64_t int64 = 4;
    goto LABEL_9;
  }
  int64_t int64 = xpc_dictionary_get_int64(v7, "resu");
LABEL_9:

  return int64;
}

int64_t sub_20DC237A4(unsigned int a1, const __CFData *a2, CFDataRef *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  __int16 v7 = v6;
  if (!v6)
  {
    uint64_t v14 = sub_20DBFFB10();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20DBFC000, v14, OS_LOG_TYPE_ERROR, "Could not create XPC message for checkLaunchWarning", buf, 2u);
    }

    xpc_object_t v11 = 0;
    goto LABEL_9;
  }
  xpc_dictionary_set_string(v6, "type", "chlw");
  xpc_dictionary_set_int64(v7, "cdht", a1);
  BytePtr = CFDataGetBytePtr(a2);
  size_t v9 = CFDataGetLength(a2);
  xpc_dictionary_set_data(v7, "cdhd", BytePtr, v9);
  uint64_t v10 = sub_20DC2324C(v7);
  xpc_object_t v11 = (void *)v10;
  if (!v10 || MEMORY[0x210567EF0](v10) == MEMORY[0x263EF8720])
  {
LABEL_9:
    int64_t int64 = 4;
    goto LABEL_10;
  }
  int64_t int64 = xpc_dictionary_get_int64(v11, "resu");
  if (a3)
  {
    size_t length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(v11, "warndata", &length);
    *a3 = CFDataCreate(0, data, length);
  }
LABEL_10:

  return int64;
}

CFStringRef MISCopyErrorStringForErrorCodeUnlocalized(uint64_t a1)
{
  switch(a1)
  {
    case 0xE8008001:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"An unknown error has occurred.";
      goto LABEL_37;
    case 0xE8008002:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"Attempted to modify an immutable provisioning profile.";
      goto LABEL_37;
    case 0xE8008003:
    case 0xE8008005:
    case 0xE8008006:
    case 0xE8008007:
    case 0xE8008008:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"This provisioning profile is malformed.";
      goto LABEL_37;
    case 0xE8008004:
    case 0xE800800E:
    case 0xE8008013:
    case 0xE800801A:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"This provisioning profile does not have a valid signature (or it has a valid, but untrusted signature).";
      goto LABEL_37;
    case 0xE8008009:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The signature was not valid.";
      goto LABEL_37;
    case 0xE800800A:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"Unable to allocate memory.";
      goto LABEL_37;
    case 0xE800800B:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"A file operation failed.";
      goto LABEL_37;
    case 0xE800800C:
    case 0xE800800D:
    case 0xE800801B:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"There was an error communicating with your device.";
      goto LABEL_37;
    case 0xE800800F:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The application's signature is valid but it does not match the expected hash.";
      goto LABEL_37;
    case 0xE8008010:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"This provisioning profile is unsupported.";
      goto LABEL_37;
    case 0xE8008011:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"This provisioning profile has expired.";
      goto LABEL_37;
    case 0xE8008012:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"This provisioning profile cannot be installed on this device.";
      goto LABEL_37;
    case 0xE8008014:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The executable contains an invalid signature.";
      goto LABEL_37;
    case 0xE8008015:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"A valid provisioning profile for this executable was not found.";
      goto LABEL_37;
    case 0xE8008016:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The executable was signed with invalid entitlements.";
      goto LABEL_37;
    case 0xE8008017:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"A signed resource has been added, modified, or deleted.";
      goto LABEL_37;
    case 0xE8008018:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The identity used to sign the executable is no longer valid.";
      goto LABEL_37;
    case 0xE8008019:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The application does not have a valid signature.";
      goto LABEL_37;
    case 0xE800801C:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"No code signature found.";
      goto LABEL_37;
    case 0xE800801D:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"Rejected by policy.";
      goto LABEL_37;
    case 0xE800801E:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The requested profile does not exist (it may have been removed).";
      goto LABEL_37;
    case 0xE800801F:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"Attempted to install a Beta profile without the proper entitlement.";
      goto LABEL_37;
    case 0xE8008020:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"Attempted to install a Beta profile over lockdown connection.";
      goto LABEL_37;
    case 0xE8008021:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The maximum number of apps for free development profiles has been reached.";
      goto LABEL_37;
    case 0xE8008022:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"An error occured while accessing the profile database.";
      goto LABEL_37;
    case 0xE8008023:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"An error occured while communicating with the agent.";
      goto LABEL_37;
    case 0xE8008024:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The provisioning profile is banned.";
      goto LABEL_37;
    case 0xE8008025:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The user did not explicitly trust the provisioning profile.";
      goto LABEL_37;
    case 0xE8008026:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The provisioning profile requires online authorization.";
      goto LABEL_37;
    case 0xE8008027:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The cdhash is not in the trust cache.";
      goto LABEL_37;
    case 0xE8008028:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"Invalid arguments or option combination.";
      goto LABEL_37;
    case 0xE8008029:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The code signature version is no longer supported.";
      goto LABEL_37;
    case 0xE800802A:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The application's signature is valid, but a provisioning profile can not be found that matches this version.";
      goto LABEL_37;
    case 0xE800802B:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"Running this application requires Developer Mode to be enabled.";
      goto LABEL_37;
    case 0xE800802C:
      CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v2 = @"The provisioning profile's App Audience is not suitable for this device.";
LABEL_37:
      CFStringRef result = CFStringCreateCopy(v1, v2);
      break;
    default:
      CFStringRef result = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"An unexpected error was encountered (0x%X)", a1);
      break;
  }
  return result;
}

CFStringRef MISCopyErrorStringForErrorCode(uint64_t a1)
{
  CFStringRef v1 = MISCopyErrorStringForErrorCodeUnlocalized(a1);
  MainBundle = CFBundleGetMainBundle();
  CFStringRef v3 = CFBundleCopyLocalizedString(MainBundle, v1, v1, 0);
  CFRelease(v1);
  return v3;
}

id sub_20DC23DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  xpc_object_t v4 = (void *)qword_26772D3D0;
  if (qword_26772D3D0) {
    goto LABEL_2;
  }
  uint64_t v6 = [MEMORY[0x263EFF990] dataWithLength:97];
  __int16 v7 = (void *)qword_26772D3D0;
  qword_26772D3D0 = v6;

  xpc_object_t v11 = (unsigned char *)[qword_26772D3D0 mutableBytes:v8 length:v9];
  int local_signing_public_key = amfi_interface_get_local_signing_public_key(v11);
  xpc_object_t v4 = (void *)qword_26772D3D0;
  if (!local_signing_public_key)
  {
LABEL_2:
    return v4;
  }
  else
  {
    qword_26772D3D0 = 0;

    return 0;
  }
}

uint64_t sub_20DC23E6C(const char *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a1) {
    __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
  }
  int v4 = open(a1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4 == -1)
  {
    __int16 v7 = sub_20DBFFB10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = *__error();
      *(_DWORD *)buf = 67109378;
      int v16 = v13;
      __int16 v17 = 2080;
      int v18 = a1;
      _os_log_error_impl(&dword_20DBFC000, v7, OS_LOG_TYPE_ERROR, "unable to open file to update permissions: %d, %s", buf, 0x12u);
    }

    return 0;
  }
  int v5 = v4;
  if (fstat(v4, &v14) < 0)
  {
    int v8 = sub_20DBFFB10();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v9 = *__error();
    *(_DWORD *)buf = 67109378;
    int v16 = v9;
    __int16 v17 = 2080;
    int v18 = a1;
    uint64_t v10 = "unable to check filesystem permissions on db: %d, %s";
  }
  else
  {
    if ((v14.st_mode & 0x1FF) == a2 || (fchmod(v5, a2) & 0x80000000) == 0)
    {
      uint64_t v6 = 1;
      if (v5 < 0) {
        return v6;
      }
      goto LABEL_17;
    }
    int v8 = sub_20DBFFB10();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v11 = *__error();
    *(_DWORD *)buf = 67109378;
    int v16 = v11;
    __int16 v17 = 2080;
    int v18 = a1;
    uint64_t v10 = "unable to set filesystem permissions on db: %d, %s";
  }
  _os_log_error_impl(&dword_20DBFC000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
LABEL_16:

  uint64_t v6 = 0;
  if ((v5 & 0x80000000) == 0) {
LABEL_17:
  }
    close(v5);
  return v6;
}

uint64_t sub_20DC24090(const char *a1)
{
  return sub_20DC23E6C(a1, 420);
}

id sub_20DC24098()
{
  id v0 = (void *)MGCopyAnswer();

  return v0;
}

CFArrayRef sub_20DC24154()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  sub_20DC1E140();
  if (v0)
  {
    CFURLRef v1 = v0;
    CFStringRef v2 = CFReadStreamCreateWithFile(0, v0);
    CFStringRef v3 = v2;
    CFErrorRef error = 0;
    if (v2)
    {
      if (CFReadStreamOpen(v2))
      {
        CFArrayRef v4 = (const __CFArray *)CFPropertyListCreateWithStream(0, v3, 0, 0, 0, &error);
        if (v4)
        {
          CFArrayRef v5 = v4;
          CFTypeID v6 = CFGetTypeID(v4);
          if (v6 == CFArrayGetTypeID()) {
            goto LABEL_17;
          }
          __int16 v7 = sub_20DBFFB10();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20DBFC000, v7, OS_LOG_TYPE_DEFAULT, "CreateMISAuthListWithStream: plist root has wrong type", buf, 2u);
          }
          CFRelease(v5);
        }
        else
        {
          uint64_t v10 = sub_20DBFFB10();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFErrorRef v14 = error;
            _os_log_impl(&dword_20DBFC000, v10, OS_LOG_TYPE_DEFAULT, "CreateMISAuthListWithStream: authList parse failed (malformed?), error %@", buf, 0xCu);
          }
        }
LABEL_16:
        CFArrayRef v5 = 0;
LABEL_17:
        if (error) {
          CFRelease(error);
        }
        if (v5) {
          goto LABEL_21;
        }
      }
    }
    else
    {
      int v9 = sub_20DBFFB10();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20DBFC000, v9, OS_LOG_TYPE_ERROR, "CreateMISAuthListWithStream: creating stream failed", buf, 2u);
        goto LABEL_16;
      }
    }
    CFArrayRef v5 = CFArrayCreate(0, 0, 0, MEMORY[0x263EFFF70]);
LABEL_21:
    CFRelease(v1);
    if (v3) {
      CFRelease(v3);
    }
    return v5;
  }
  int v8 = sub_20DBFFB10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20DBFC000, v8, OS_LOG_TYPE_ERROR, "CreateMISAuthListWithFile: url is NULL", buf, 2u);
  }
  return 0;
}

BOOL sub_20DC24378(BOOL result, const __CFString *a2)
{
  if (result)
  {
    CFArrayRef v3 = (const __CFArray *)result;
    CFIndex Count = CFArrayGetCount((CFArrayRef)result);
    CFIndex v5 = Count - 1;
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v6 = 0;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v6);
        CFComparisonResult v8 = CFStringCompare(ValueAtIndex, a2, 1uLL);
        CFStringRef result = v8 == kCFCompareEqualTo;
        if (v8 == kCFCompareEqualTo) {
          break;
        }
      }
      while (v5 != v6++);
    }
  }
  return result;
}

void sub_20DC243FC(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0; i != v4; ++i)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      CFTypeID v7 = CFGetTypeID(ValueAtIndex);
      if (v7 == CFDictionaryGetTypeID())
      {
        CFDictionaryRef v8 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, i);
        CFArrayRef Value = CFDictionaryGetValue(v8, @"cdhash");
        uint64_t v10 = CFDictionaryGetValue(v8, @"upp-uuid");
        int v11 = CFDictionaryGetValue(v8, @"teamid");
        id v12 = CFDictionaryGetValue(v8, @"type");
        CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v8, @"grace");
        if (Value
          && (CFNumberRef v14 = v13, v15 = CFGetTypeID(Value), v15 == CFStringGetTypeID())
          && v10
          && (CFTypeID v16 = CFGetTypeID(v10), v16 == CFStringGetTypeID())
          && v11
          && (CFTypeID v17 = CFGetTypeID(v11), v17 == CFStringGetTypeID())
          && v12
          && (CFTypeID v18 = CFGetTypeID(v12), v18 == CFNumberGetTypeID()))
        {
          if (!v14 || (CFTypeID v19 = CFGetTypeID(v14), v19 != CFNumberGetTypeID()))
          {
            int valuePtr = 0;
            CFNumberRef v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          }
          if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, const void *, CFNumberRef))(a2 + 16))(a2, Value, v10, v11, v12, v14))return; {
        }
          }
        else
        {
          xpc_object_t v24 = sub_20DBFFB10();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v21 = buf;
            uint64_t v22 = v24;
            char v23 = "indeterminateListIterate: malformed row";
            goto LABEL_21;
          }
        }
      }
      else
      {
        uint64_t v20 = sub_20DBFFB10();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = 0;
          uint64_t v21 = (uint8_t *)&v28;
          uint64_t v22 = v20;
          char v23 = "indeterminateListIterate: row with unknown type";
LABEL_21:
          _os_log_impl(&dword_20DBFC000, v22, OS_LOG_TYPE_DEFAULT, v23, v21, 2u);
        }
      }
    }
  }
}

uint64_t sub_20DC24648()
{
  return MEMORY[0x270EEDB78]();
}

uint64_t sub_20DC24658()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_20DC24668()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_20DC24678()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_20DC24688()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_20DC24698()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_20DC246A8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_20DC246B8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_20DC246C8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_20DC246D8()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_20DC246E8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_20DC246F8()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_20DC24708()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_20DC24718()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t sub_20DC24728()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_20DC24738()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_20DC24748()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_20DC24758()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_20DC24768()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_20DC24778()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_20DC24798()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_20DC247A8()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_20DC247B8()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_20DC247C8()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_20DC247E8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_20DC247F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_20DC24808()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_20DC24818()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_20DC24828()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_20DC24838()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_20DC24848()
{
  return MEMORY[0x270FA2C18]();
}

uint64_t sub_20DC24858()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_20DC24868()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_20DC24878()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_20DC24888()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_20DC24898()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_20DC248A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_20DC248B8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_20DC248C8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_20DC248D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_20DC248E8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_20DC248F8()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_20DC24908()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_20DC24918()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_20DC24928()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_20DC24938()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_20DC24948()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_20DC24958()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_20DC24968()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_20DC24988()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_20DC24998()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_20DC249A8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_20DC249B8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_20DC249D8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_20DC249E8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_20DC249F8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_20DC24A08()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_20DC24A18()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_20DC24A28()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_20DC24A38()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_20DC24A48()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_20DC24A58()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20DC24A68()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_20DC24A78()
{
  return MEMORY[0x270F9FC90]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

uint64_t CEContextIsSubset()
{
  return MEMORY[0x270F918A0]();
}

uint64_t CEContextQuery()
{
  return MEMORY[0x270F918A8]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x270F918B0]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x270F918C0]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x270F918C8]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x270F918D0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4550](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x270EE4578](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x270EE46B0](calendar, at, options, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x270EE46C0]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x270EE47D0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x270EE4858](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x270EE49B8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

uint64_t CFPropertyListCreateWithDERData()
{
  return MEMORY[0x270EFD378]();
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE53F8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t SecCMSVerify()
{
  return MEMORY[0x270EFD6D8]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x270EFD7C0](certificate);
}

uint64_t SecCertificateIsSelfSigned()
{
  return MEMORY[0x270EFD840]();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x270EFD8D0](code, *(void *)&flags, information);
}

uint64_t SecCodeSetDetachedSignature()
{
  return MEMORY[0x270EFD8D8]();
}

uint64_t SecCodeSpecialSlotIsPresent()
{
  return MEMORY[0x270EFD8E0]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x270EFDB38]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
}

uint64_t SecPolicyCreateOSXProvisioningProfileSigning()
{
  return MEMORY[0x270EFDB88]();
}

uint64_t SecPolicyCreateiPhoneApplicationSigning()
{
  return MEMORY[0x270EFDBD8]();
}

uint64_t SecPolicyCreateiPhoneProfileApplicationSigning()
{
  return MEMORY[0x270EFDBE8]();
}

uint64_t SecPolicyCreateiPhoneProvisioningProfileSigning()
{
  return MEMORY[0x270EFDBF0]();
}

uint64_t SecPolicyCreateiPhoneVPNApplicationSigning()
{
  return MEMORY[0x270EFDBF8]();
}

OSStatus SecStaticCodeCheckValidityWithErrors(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement, CFErrorRef *errors)
{
  return MEMORY[0x270EFDC80](staticCode, *(void *)&flags, requirement, errors);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x270EFDC88](path, *(void *)&flags, staticCode);
}

OSStatus SecStaticCodeCreateWithPathAndAttributes(CFURLRef path, SecCSFlags flags, CFDictionaryRef attributes, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x270EFDC90](path, *(void *)&flags, attributes, staticCode);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x270EFDDF8](trust, verifyDate);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x270ED7E80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void abort(void)
{
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x270ED87A0](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x270ED8888]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x270ED88B0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x270ED88B8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x270ED88C0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x270ED88E8]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x270ED8918]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x270ED89A0]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x270ED89B8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x270ED8A70]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x270ED8A78]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x270ED8A80]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x270ED8AA0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x270ED8AB8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x270ED8AE0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x270ED8B08]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x270ED8B28]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x270ED8D08]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x270ED8D40]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x270ED8D60]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270ED98A0](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDA9E0]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x270F9B538](a1, *(void *)&ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const char *__cdecl sqlite3_column_origin_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x270F9B5B0](a1, *(void *)&a2);
}

const char *__cdecl sqlite3_column_table_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x270F9B5B8](a1, *(void *)&a2);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return MEMORY[0x270F9B630](db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B650](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x270F9B900](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x270EDB670](a1, a2, a3);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x270EDB938](a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x270EDBD30](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

int64_t xpc_array_get_date(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x270EDBD50](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}