BOOL sub_100000BF0(uint64_t a1, BOOL *a2)
{
  int v4;
  char v5;
  BOOL result;
  char *v7;
  char *v8;
  char *v9;
  char v10;

  v10 = -86;
  if (!a1)
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v7, 13);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015320();
    return 0;
  }
  if (!a2)
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v8, 14);
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000153B0();
    return 0;
  }
  if (!Img4DecodePayloadPropertiesExists(a1, (BOOL *)&v10))
  {
    if (!v10)
    {
      *a2 = 0;
      return 1;
    }
    Img4DecodePayloadPropertyExistsByTag(a1, 0xE000000072646467, a2);
    if (v4 == 1)
    {
      v5 = 0;
      goto LABEL_10;
    }
    if (!v4)
    {
      v5 = 1;
LABEL_10:
      *a2 = v5;
      return 1;
    }
    fprintf(__stderrp, "Img4DecodePayloadPropertyExistsByTag('rddg') returned %d\n", v4);
    return 0;
  }
  v9 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v9, 17);
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100015440();
    return 0;
  }
  return result;
}

BOOL sub_100000D80(uint64_t a1, _DWORD *a2)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  __src = (void *)0xAAAAAAAAAAAAAAAALL;
  if (!a1)
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v7, 57);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000154D0();
    return 0;
  }
  if (!a2)
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v8, 58);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015560();
    return 0;
  }
  Img4DecodeGetRestoreInfoData(a1, 1969448306, &__src, &v13);
  if (v4)
  {
    v9 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v9, 61);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000157A0();
    return 0;
  }
  if (v13 != 588)
  {
    v10 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v10, 63);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015710();
    return 0;
  }
  memcpy(a2, __src, 0x24CuLL);
  a2[147] = 0;
  Img4DecodeGetRestoreInfoData(a1, 1969450862, &__src, &v13);
  if (v5)
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v11, 69);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015680();
    return 0;
  }
  if (v13 == 1324)
  {
    memcpy(a2 + 148, __src, 0x52CuLL);
    return 1;
  }
  v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v12, 70);
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_1000155F0();
    return 0;
  }
  return result;
}

BOOL sub_100000FF0(uint64_t a1, unint64_t a2, void *a3, _DWORD *a4)
{
  if (!a1)
  {
    v10 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v10, 85);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015830();
    return 0;
  }
  if (!a3)
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v11, 86);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000158C0();
    return 0;
  }
  if (!a4)
  {
    v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v12, 87);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015950();
    return 0;
  }
  if (a2 >= 0xFFFFFFE8)
  {
    unint64_t v13 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v13, 89);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_1000159E0();
    return 0;
  }
  *a4 = 1;
  uint64_t v4 = a3[1];
  if (!v4)
  {
    v14 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v14, 93);
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100015A70();
    return 0;
  }
  int v5 = v4 - a1 + 24;
  uint64_t v7 = a3[2];
  uint64_t v6 = a3[3];
  a4[2] = v5;
  a4[3] = v7;
  if (v6)
  {
    uint64_t v8 = a3[4];
    a4[4] = v6 - a1 + 24;
    a4[5] = v8;
    a4[1] = a2 + 24;
    return 1;
  }
  v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v15, 98);
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100015B00();
    return 0;
  }
  return result;
}

void sub_100001244(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

uint64_t sub_100001260(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[2] = v3;
  v11[3] = v3;
  v11[0] = v3;
  v11[1] = v3;
  if (!a1) {
    sub_100015B90();
  }
  int v5 = sub_100001340((uint64_t *)v11, a1, a1 + a2);
  if (v5)
  {
    printf("img4: failed to parse ART: %d\n", v5);
    return 0;
  }
  else
  {
    if (SEPARTCounterFind())
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = 9;
      do
      {
        uint64_t v9 = v8;
        if (v8 == 28) {
          break;
        }
        int v10 = SEPARTCounterFind();
        uint64_t v8 = v9 + 1;
      }
      while (!v10);
      BOOL v7 = (unint64_t)(v9 - 1) < 0x1B;
    }
    return v7 ^ a3 ^ 1u;
  }
}

uint64_t sub_100001340(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  if (!SEPARTExtract(a2, a3, &v8, &v7))
  {
    int v5 = "img4: extract returned NULL";
    goto LABEL_5;
  }
  uint64_t v4 = SEPARTPayloadDecode((uint64_t)a1, a1 + 1, a1 + 2, a1 + 3, a1 + 4, a1 + 5, a1 + 6, a1 + 7, a1 + 8, v8, v7);
  if (v4 != v7)
  {
    int v5 = "img4: payload decode failed";
LABEL_5:
    puts(v5);
    return 1;
  }
  return 0;
}

uint64_t sub_1000013F8(unint64_t a1, unint64_t a2)
{
  printf("raw ART: ");
  if (a1 < a2)
  {
    unint64_t v4 = a2 - a1;
    int v5 = (unsigned __int8 *)a1;
    do
    {
      unsigned int v6 = *v5++;
      printf("%c%c", a0123456789abcd[(unint64_t)v6 >> 4], a0123456789abcd[v6 & 0xF]);
      --v4;
    }
    while (v4);
  }
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v12 = v7;
  long long v13 = v7;
  long long v10 = v7;
  long long v11 = v7;
  putchar(10);
  if (sub_100001340((uint64_t *)&v10, a1, a2))
  {
    puts("img4: failed to parse ART");
    return 1;
  }
  else
  {
    puts("Successfully parsed ART:");
    printf("counter: %lld\n", (void)v10);
    sub_100001560("manifest hash", *((uint64_t *)&v10 + 1), (unsigned __int8 *)v11);
    sub_100001560("sleep hash", *((uint64_t *)&v11 + 1), (unsigned __int8 *)v12);
    sub_100001560("restore nonce", *((uint64_t *)&v12 + 1), (unsigned __int8 *)v13);
    for (uint64_t i = 255; i != -1; --i)
    {
      if (SEPARTCounterFind()) {
        printf("subcounters[%lu]: %llu\n", i, 0xAAAAAAAAAAAAAAAALL);
      }
    }
    return 0;
  }
}

uint64_t sub_100001560(const char *a1, uint64_t a2, unsigned __int8 *a3)
{
  if (!a2) {
    return printf("%s absent\n", a1);
  }
  uint64_t v4 = a2;
  printf("%s (%ld bytes): ", a1, a2);
  do
  {
    unsigned int v5 = *a3++;
    printf("%c%c", a0123456789abcd[(unint64_t)v5 >> 4], a0123456789abcd[v5 & 0xF]);
    --v4;
  }
  while (v4);

  return putchar(10);
}

uint64_t sub_100001618(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int v19 = -1431655766;
  int v15 = -1431655766;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  v20[26] = v2;
  v20[27] = v2;
  v20[24] = v2;
  v20[25] = v2;
  v20[22] = v2;
  v20[23] = v2;
  v20[20] = v2;
  v20[21] = v2;
  v20[18] = v2;
  v20[19] = v2;
  v20[16] = v2;
  v20[17] = v2;
  v20[14] = v2;
  v20[15] = v2;
  v20[12] = v2;
  v20[13] = v2;
  v20[10] = v2;
  v20[11] = v2;
  v20[8] = v2;
  v20[9] = v2;
  v20[6] = v2;
  v20[7] = v2;
  v20[4] = v2;
  v20[5] = v2;
  v20[2] = v2;
  v20[3] = v2;
  v20[0] = v2;
  v20[1] = v2;
  v8[0] = sub_100001B48;
  v8[1] = sub_100001B48;
  v8[2] = sub_100001B48;
  v8[3] = sub_100001B48;
  memset(v7, 0, sizeof(v7));
  v8[5] = 0;
  v8[6] = 0;
  v8[4] = v7;
  long long v13 = 0;
  unsigned int v14 = 0;
  v16 = 0;
  uint64_t v17 = 0;
  int v18 = 0;
  uint64_t v9 = 0;
  long long v10 = 0xAAAAAAAA00000000;
  uint64_t v11 = 0;
  unint64_t v12 = 0xAAAAAAAA00000000;
  if (!sub_100001800((uint64_t)v20, a1, a2, (uint64_t)&v13, (uint64_t)&v9, 0, 0, (uint64_t)v8))
  {
    if (v18)
    {
      sub_100001560("sepi digest", v14, v13);
      sub_100001560("sepi nonce", v17, v16);
      if (!HIDWORD(v17)) {
        goto LABEL_8;
      }
      uint64_t v4 = "sepi allows mix 'n match";
    }
    else
    {
      uint64_t v4 = "sepi absent";
    }
    puts(v4);
LABEL_8:
    if (v12)
    {
      sub_100001560("rsep digest", v10, v9);
      sub_100001560("rsep nonce", v11, *((unsigned __int8 **)&v10 + 1));
      if (!HIDWORD(v11)) {
        return 0;
      }
      unsigned int v5 = "rsep allows mix 'n match";
    }
    else
    {
      unsigned int v5 = "rsep absent";
    }
    puts(v5);
    return 0;
  }
  uint64_t v3 = 1;
  fwrite("img4: img4 parse failed\n", 0x18uLL, 1uLL, __stderrp);
  return v3;
}

uint64_t sub_100001800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, _DWORD *a7, uint64_t a8)
{
  Img4DecodeInit(a2, a3, a1);
  if (v14)
  {
    printf("img4: Img4DecodeInit failed: %d\n", v14);
    return 1;
  }
  else
  {
    long long v18 = off_100020608;
    uint64_t v19 = 0;
    Img4DecodePerformTrustEvaluatationWithCallbacks(0x73657069u, a1, (uint64_t)&v18, a8, a4);
    *(_DWORD *)(a4 + 32) = v16 == 0;
    Img4DecodePerformTrustEvaluatationWithCallbacks(0x72736570u, a1, (uint64_t)&v18, a8, a5);
    *(_DWORD *)(a5 + 32) = v17 == 0;
    if (a8 && a1 && a6)
    {
      if (a7)
      {
        *a6 = a1 + 328;
        *a7 = **(void **)(a8 + 32);
      }
    }
    return 0;
  }
}

uint64_t sub_100001908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  v35 = 0;
  int v34 = 0;
  if (!qword_100024C00) {
    qword_100024C00 = ccsha1_di();
  }
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int v29 = -1431655766;
  int v33 = -1431655766;
  int v22 = -1431655766;
  int v26 = -1431655766;
  v36[0] = v10;
  v36[1] = v10;
  v36[2] = v10;
  v36[3] = v10;
  v36[4] = v10;
  v36[5] = v10;
  v36[6] = v10;
  v36[7] = v10;
  v36[8] = v10;
  v36[9] = v10;
  v36[10] = v10;
  v36[11] = v10;
  v36[12] = v10;
  v36[13] = v10;
  v36[14] = v10;
  v36[15] = v10;
  v36[16] = v10;
  v36[17] = v10;
  v36[18] = v10;
  v36[19] = v10;
  v36[20] = v10;
  v36[21] = v10;
  v36[22] = v10;
  v36[23] = v10;
  v36[24] = v10;
  v36[25] = v10;
  v36[26] = v10;
  v36[27] = v10;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v27 = 0;
  int v28 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  int v32 = 0;
  uint64_t v20 = 0;
  int v21 = 0;
  __s2 = 0;
  uint64_t v24 = 0;
  int v25 = 0;
  *(_OWORD *)int v15 = 0u;
  *(_OWORD *)int v16 = 0u;
  *(_OWORD *)__n = 0u;
  *(_OWORD *)__s1 = 0u;
  uint64_t v19 = 0;
  if (sub_100001800((uint64_t)v36, a1, a2, (uint64_t)&v27, (uint64_t)&v20, &v35, &v34, (uint64_t)kImg4DecodeSecureBootRsa1kSha1))
  {
    LOBYTE(v11) = 0;
    unint64_t v12 = "preflight: FAIL: could not parse img4";
LABEL_5:
    puts(v12);
    return v11 & 1;
  }
  if (a3 && sub_100001340((uint64_t *)v15, a3, a4))
  {
    LOBYTE(v11) = 0;
    unint64_t v12 = "preflight: FAIL: could not parse ART";
    goto LABEL_5;
  }
  int v11 = (HIDWORD(v31) | HIDWORD(v24)) != 0;
  if (HIDWORD(v31) | HIDWORD(v24)) {
    puts("preflight: mix 'n match specified");
  }
  if (__n[1] && __n[1] == v24 && !memcmp(__s1[0], __s2, __n[1]))
  {
    if ((a5 & 2) != 0) {
      int v14 = "preflight: restore nonce matches";
    }
    else {
      int v14 = "preflight: nonce matches, but not checking restore";
    }
    v11 |= (a5 & 2) >> 1;
    puts(v14);
  }
  if (v15[1] && v15[1] == v34 && !memcmp(v16[0], v35, v15[1]))
  {
    if (a5) {
      unint64_t v12 = "preflight: manifest hash matches sepi";
    }
    else {
      unint64_t v12 = "preflight: manifest hash matches, but not checking load";
    }
    LOBYTE(v11) = a5 | v11;
    goto LABEL_5;
  }
  return v11 & 1;
}

uint64_t sub_100001B48()
{
  return 0;
}

uint64_t sub_100001B50(int a1, uint64_t *a2, int a3, uint64_t a4)
{
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = -1431655766;
  if (a1 == 1095585357)
  {
    char v8 = -86;
    if (Img4DecodeGetPropertyBoolean((uint64_t)a2, 1095585357, (BOOL *)&v8))
    {
      puts("img4: couldn't get BOOL property - fatal");
      exit(1);
    }
    if (v8) {
      *(_DWORD *)(a4 + 28) = 1;
    }
  }
  else if (a1 == 1936617326)
  {
    if (!a3 && !Img4DecodeGetPropertyData(a2, 1936617326, &v7, &v6))
    {
      *(void *)(a4 + 16) = v7;
      *(_DWORD *)(a4 + 24) = v6;
    }
  }
  else if (a1 == 1145525076 && a3 == 1 && !Img4DecodeGetPropertyData(a2, 1145525076, &v7, &v6))
  {
    *(void *)a4 = v7;
    *(_DWORD *)(a4 + 8) = v6;
  }
  return 0;
}

uint64_t sub_100001C6C()
{
  v0 = (const char *)qword_100024C40;
  if (!qword_100024C40)
  {
    v0 = "AppleSEPUtil";
    qword_100024C40 = (uint64_t)"AppleSEPUtil";
  }
  fprintf(__stderrp, "Usage: %s ...\n", v0);
  fputc(10, __stderrp);
  fwrite("OPTIONS:\n\n", 0xAuLL, 1uLL, __stderrp);
  fwrite("\tGeneric commands\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--ping                   Send a PING operation to the SEP OS\n", 0x3FuLL, 1uLL, __stderrp);
  fwrite("\t\t--rawlog                 Dump the mailbox message RAW log without decoding\n", 0x4DuLL, 1uLL, __stderrp);
  fwrite("\t\t--securitymode           Request SEP effective production status and security mode\n", 0x55uLL, 1uLL, __stderrp);
  fwrite("\t\t--nap                    Nap the SEP NOW!\n", 0x2CuLL, 1uLL, __stderrp);
  fwrite("\t\t--sleep                  Sleep the SEP NOW!\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--pingflood              Ping SEP endlessly\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--rng-dump <count>       Dump specified count bytes worth of data from TRNG\n", 0x4EuLL, 1uLL, __stderrp);
  fwrite("\t\t--launch-macos-app <ver> Launch MacOS serving app variant for the specified 16-bit hex version\n", 0x61uLL, 1uLL, __stderrp);
  fwrite("\t\t--outfile <path>         Output file path. \"-\" for stdout\n", 0x3CuLL, 1uLL, __stderrp);
  fwrite("\t\t--infile <path>          Input file path if passing in some data\n", 0x43uLL, 1uLL, __stderrp);
  fwrite("\t\t--l4panic                Force an L4 panic\n", 0x2DuLL, 1uLL, __stderrp);
  fwrite("\t\t--sepospanic             Force a SEP/OS panic\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("\t\t--requestpanic           Force a SEP/OS client requested panic\n", 0x41uLL, 1uLL, __stderrp);
  fwrite("\t\t--read-file              Test seputil file reading functionality, Requires infile and outfile\n", 0x60uLL, 1uLL, __stderrp);
  fwrite("\t\t--report-code-coverage   Output a structured data file with coverage data\n", 0x4CuLL, 1uLL, __stderrp);
  fwrite("\t\t--help                   Display this usage\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--process-info           Display information for SEP processes\n", 0x41uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tFirmware commands\n", 0x13uLL, 1uLL, __stderrp);
  fwrite("\t\t--load <file>            Load <file> as the SEP runtime firmware\n", 0x43uLL, 1uLL, __stderrp);
  fwrite("\t\t--restore <file>         Load <file> as the SEP runtime firmware in restore mode\n", 0x53uLL, 1uLL, __stderrp);
  fwrite("\t\t--restore+art <file>     Load <file> as the SEP runtime firmware in restore mode with ART\n", 0x5CuLL, 1uLL, __stderrp);
  fwrite("\t\t--slot <slot id>         Set nonce slot to be used to boot the SEP FW that is being loaded \n", 0x5EuLL, 1uLL, __stderrp);
  fwrite("\t\t--wait <file>            Pause for kernel driver to load before failing\n", 0x4AuLL, 1uLL, __stderrp);
  fwrite("\t\t--preflight              Pre-flight load/restore firmware against ART to pre-check for boot failures\n", 0x67uLL, 1uLL, __stderrp);
  fwrite("\t\t--boot-check <file>      Check whether the installed SEPFW might be bootable WRT the current ART\n", 0x63uLL, 1uLL, __stderrp);
  fwrite("\t\t--dump-fw <file>         Dump measurements of installed SEP FW file \n", 0x47uLL, 1uLL, __stderrp);
  fwrite("\t\t--commit-hash       Commit the SEP hash of the currently loaded firmware. Requires slot to be passed with --slot where nonce slots supported.\n", 0x90uLL, 1uLL, __stderrp);
  fwrite("\t\t--commit-hash-ap    Commit the AP hash of the currently loaded firmware. Requires slot to be passed with --slot where nonce slots supported.\n", 0x8FuLL, 1uLL, __stderrp);
  fprintf(__stderrp, "\tExample: %s --wait --load /path/to/foo\n", (const char *)qword_100024C40);
  fputc(10, __stderrp);
  fwrite("\tROM commands\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t\t--rom status             Get the ROM status\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t\t--rom tz0                Send a ROM TZ0 command\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--rom nop                Send a ROM NOP command\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--new-rom-nonce          Request new ROM nonce. Requires --outfile\n", 0x45uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tART commands\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t\t--art get                Dump current ART from Memory\n", 0x38uLL, 1uLL, __stderrp);
  fwrite("\t\t--art clear              Clear the persisted ART\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--art ctrtest            Counter self-test\n", 0x2DuLL, 1uLL, __stderrp);
  fwrite("\t\t--minblocks <value>      Optional argument to compare \"--art ctrtest\" good pages against\n", 0x5BuLL, 1uLL, __stderrp);
  fwrite("\t\t--art-set <value>        Persist the supplied ART value to storage\n", 0x45uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-nonce              Get current SEP/OS nonce\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--new-nonce              Request new SEP/OS nonce\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--kill-nonce             Request invalidate SEP/OS nonce\n", 0x3BuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tOOL Object commands\n", 0x15uLL, 1uLL, __stderrp);
  fwrite("\t\t--size <size>            Size of object in case requesting object create\n", 0x4BuLL, 1uLL, __stderrp);
  fwrite("\t\t--create <obj>           Create an object in SEP. Requires --size\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--service <srvc>         Service handle with which an object is to be shared\n", 0x4FuLL, 1uLL, __stderrp);
  fwrite("\t\t--share <obj>            Share an object. Requires --service\n", 0x3FuLL, 1uLL, __stderrp);
  fwrite("\t\t--get <obj>              Read obj and write to stdout\n", 0x38uLL, 1uLL, __stderrp);
  fwrite("\t\t--put <obj>              Read stdin and write to obj\n", 0x37uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tPairing commands\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--pair <obj>             Factory pairing commands. Requires: --outfile\n", 0x49uLL, 1uLL, __stderrp);
  fwrite("\t\t                         Valid arguments for <obj>- STCK, SIGN\n", 0x41uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tUnit test commands\n", 0x14uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-run <category>[/<test>]\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t\t                         Run a test or set of tests in a category\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-all               Run all available tests\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-list              List all available tests\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-input <file>      Set testing input data\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-output <file>     Set testing output data\n", 0x33uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-offset <value>    Set data transfer offset within input data (default=0)\n", 0x52uLL, 1uLL, __stderrp);
  fwrite("\t\t--test-timeout <value>   Set the default delay in milliseconds to wait for test completion (default=120000)\n", 0x6EuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\t\tExamples:\n", 0xCuLL, 1uLL, __stderrp);
  fprintf(__stderrp, "\t\t%s --test-run test/pass (run the test 'pass' in the category 'test')\n", (const char *)qword_100024C40);
  fprintf(__stderrp, "\t\t%s --test-run test (run all tests in the category 'test')\n", (const char *)qword_100024C40);
  fputc(10, __stderrp);
  fwrite("\tSystem testing commands\n", 0x19uLL, 1uLL, __stderrp);
  fwrite("\t\t--tunable-check <value>  Enable or disable tunable check mode.\n", 0x41uLL, 1uLL, __stderrp);
  fwrite("\t\t                         'value' should be 'enable' or 'disable'.\n", 0x44uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tDebugging and Diagnostic commands\n", 0x23uLL, 1uLL, __stderrp);
  fwrite("\t\t--list-var <app>                  List all debug variables in app\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-var <app>:<name>            Get value of debug variable\n", 0x40uLL, 1uLL, __stderrp);
  fwrite("\t\t--set-var <app>:<name>:<value>    Set value of debug variable. If the value is out of range of the debug variable (signed or unsigned), throws an error\n", 0x9AuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tCoverage commands\n", 0x13uLL, 1uLL, __stderrp);
  fwrite("\t\t--dump-cov <app>      Dump and reset coverage counters to object\n", 0x43uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tSMC test command\n", 0x12uLL, 1uLL, __stderrp);
  fwrite("\t\t--send-smc-events <count> Send <count> test SMC events to SEP\n", 0x40uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tDynamic Scheme3 test command\n", 0x1EuLL, 1uLL, __stderrp);
  fwrite("\t\t--alloc-dynamic-object \t Request allocation of test Dynamic Scheme3 object\n", 0x4DuLL, 1uLL, __stderrp);
  fwrite("\t\t--dealloc-dynamic-object \t Request deallocation of test Dynamic Scheme3 object\n", 0x51uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tProvisional AP slot commands (only supported where nonce slots supported)\n", 0x4BuLL, 1uLL, __stderrp);
  fwrite("\t\t--set-provisional <value> \tSet the provisional state of AP slot to 1 (provisional) or 0 (not provisional). Requires slot to be passed with --slot.\n", 0x95uLL, 1uLL, __stderrp);
  fwrite("\t\t--get-provisional \tRequires slot to be passed with --slot\n", 0x3CuLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("\tBare words on the commandline are sent to the SEP as a console command\n", 0x48uLL, 1uLL, __stderrp);
  return fprintf(__stderrp, "\tExample: %s help\n\n", (const char *)qword_100024C40);
}

uint64_t start()
{
  int v0 = __chkstk_darwin();
  long long v2 = v1;
  int v3 = v0;
  bzero(__dst, 0x400uLL);
  bzero(v202, 0x400uLL);
  memset(v201, 0, sizeof(v201));
  long long v199 = 0u;
  long long v200 = 0u;
  *(_OWORD *)v197 = 0u;
  long long v198 = 0u;
  *(_OWORD *)v195 = 0u;
  long long v196 = 0u;
  *(void *)v185 = 0;
  uint64_t v192 = 0;
  *(void *)inputStruct = 0;
  int v194 = 0;
  uint64_t v193 = 0;
  memset(uu, 0, sizeof(uu));
  setlinebuf(__stdoutp);
  setlinebuf(__stderrp);
  qword_100024C40 = (uint64_t)basename(*v2);
  if (!qword_100024C40)
  {
    unsigned int v5 = __stderrp;
    int v6 = __error();
    strerror(*v6);
    fprintf(v5, "ERROR: failed to determine utility name: %s\n");
    return *__error();
  }
  if (geteuid())
  {
    fprintf(__stderrp, "%s: must be run as root\n", (const char *)qword_100024C40);
    return 13;
  }
  io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
  if (!v8)
  {
    printf("%s: No SEP present on this device\n", (const char *)qword_100024C40);
    return 0;
  }
  IOObjectRelease(v8);
  if (!strncmp((const char *)qword_100024C40, "init_data_protection", 0x20uLL))
  {
    bzero(v209, 0x400uLL);
    bzero(v208, 0x400uLL);
    unsigned int v188 = 0;
    byte_100024C4D = 1;
    io_registry_entry_t v9 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
    if (!v9)
    {
      fprintf(__stderrp, "%s: can't find arm-io/sep\n", (const char *)qword_100024C40);
      return 2;
    }
    io_object_t v10 = v9;
    unsigned int v189 = -1431655766;
    CFDataRef v11 = (const __CFData *)IORegistryEntrySearchCFProperty(v9, "IODeviceTree", @"sepfw-loaded", kCFAllocatorDefault, 0);
    CFDataRef v12 = v11;
    if (v11)
    {
      CFTypeID v13 = CFGetTypeID(v11);
      if (v13 == CFDataGetTypeID())
      {
        if (CFDataGetLength(v12) == 4)
        {
          BytePtr = CFDataGetBytePtr(v12);
          BOOL v15 = *(_DWORD *)BytePtr != 0;
          int v16 = "was not ";
          if (*(_DWORD *)BytePtr) {
            int v16 = (const char *)&unk_100019A01;
          }
          printf("SEP firmware %spreloaded in memory\n", v16);
LABEL_205:
          if (sub_10000A190("sepfw-load-at-boot"))
          {
            unint64_t v207 = 0xAAAAAAAAAAAAAAAALL;
            *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v206[27] = v55;
            v206[26] = v55;
            v206[25] = v55;
            v206[24] = v55;
            v206[23] = v55;
            v206[22] = v55;
            v206[21] = v55;
            v206[20] = v55;
            v206[19] = v55;
            v206[18] = v55;
            v206[17] = v55;
            v206[16] = v55;
            v206[15] = v55;
            v206[14] = v55;
            v206[13] = v55;
            v206[12] = v55;
            v206[11] = v55;
            v206[10] = v55;
            v206[9] = v55;
            v206[8] = v55;
            v206[7] = v55;
            v206[6] = v55;
            v206[5] = v55;
            v206[4] = v55;
            v206[3] = v55;
            v206[2] = v55;
            v206[1] = v55;
            v206[0] = v55;
            char v187 = -86;
            uint64_t v56 = sub_1000054AC();
            if (v56)
            {
              uint64_t v4 = v56;
              fprintf(__stderrp, "%s: Failed to connect to sep\n", (const char *)qword_100024C40);
LABEL_211:
              v57 = 0;
LABEL_212:
              v58 = 0;
              goto LABEL_213;
            }
            if (sub_10000A190("protected-data-access"))
            {
              uint64_t v59 = sub_1000060B8(0);
              if (v59)
              {
                uint64_t v4 = v59;
                fprintf(__stderrp, "%s: Failed to initialize gigalocker: %d\n", (const char *)qword_100024C40, v59);
                v57 = 0;
                v58 = 0;
                goto LABEL_213;
              }
            }
            if (!v15)
            {
              uint64_t v60 = sub_1000053A8((uint64_t)v209);
              if (v60)
              {
                uint64_t v4 = v60;
                v79 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v79, 4006);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_10001602C();
                }
                goto LABEL_211;
              }
              v61 = malloc_type_malloc(0x2000000uLL, 0x756E0836uLL);
              if (v61)
              {
                v57 = v61;
                uint64_t v62 = sub_1000097E8(v61, 0x2000000uLL, (char *)v209, &v189);
                if (v62)
                {
                  uint64_t v4 = v62;
                  v81 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v81, 4013);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_100015F9C();
                  }
                  goto LABEL_212;
                }
                Img4DecodeInit((uint64_t)v57, v189, (uint64_t)v206);
                if (v63)
                {
                  v82 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v82, 4016);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_100015F0C();
                  }
                }
                else if (sub_100000BF0((uint64_t)v206, (BOOL *)&v187))
                {
                  if (!v187)
                  {
                    v58 = 0;
                    unsigned int v70 = 255;
                    goto LABEL_279;
                  }
                  v64 = malloc_type_malloc(0x40000uLL, 0x29E5207uLL);
                  if (v64)
                  {
                    v58 = v64;
                    uint64_t v65 = sub_1000053A8((uint64_t)v208);
                    if (v65)
                    {
                      uint64_t v4 = v65;
                      v85 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v85, 4027);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100015DEC();
                      }
                      goto LABEL_213;
                    }
                    uint64_t v66 = sub_1000097E8(v58, 0x40000uLL, v208, &v188);
                    if (v66)
                    {
                      uint64_t v4 = v66;
                      v86 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v86, 4031);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100015D5C();
                      }
                      goto LABEL_213;
                    }
                    unint64_t v205 = 0xAAAAAAAAAAAAAAAALL;
                    *(void *)&long long v67 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v204[27] = v67;
                    v204[26] = v67;
                    v204[25] = v67;
                    v204[24] = v67;
                    v204[23] = v67;
                    v204[22] = v67;
                    v204[21] = v67;
                    v204[20] = v67;
                    v204[19] = v67;
                    v204[18] = v67;
                    v204[17] = v67;
                    v204[16] = v67;
                    v204[15] = v67;
                    v204[14] = v67;
                    v204[13] = v67;
                    v204[12] = v67;
                    v204[11] = v67;
                    v204[10] = v67;
                    v204[9] = v67;
                    v204[8] = v67;
                    v204[7] = v67;
                    v204[6] = v67;
                    v204[5] = v67;
                    v204[4] = v67;
                    v204[3] = v67;
                    v204[2] = v67;
                    v204[1] = v67;
                    v204[0] = v67;
                    Img4DecodeInit((uint64_t)v58, v188, (uint64_t)v204);
                    if (v68)
                    {
                      v87 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v87, 4036);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100015CCC();
                      }
                      goto LABEL_280;
                    }
                    int v186 = -1431655766;
                    Img4DecodeGetRestoreInfoInteger((uint64_t)v204, 1936615780, &v186);
                    if (v69)
                    {
                      unsigned int v70 = 2;
                      printf("Didn't find snid in patches IM4R, using default slot %u\n", 2);
                    }
                    else
                    {
                      unsigned int v70 = v186;
                      printf("Found slot %u in patches IM4R\n", v186);
                    }
LABEL_279:
                    printf("Loading SEP FW in %s with slot %u\n", "defaultInit", v70);
                    if (sub_1000099C0((uint64_t)v57, v189, v58, v188, 6u, v70))
                    {
LABEL_280:
                      uint64_t v4 = 0;
                      goto LABEL_213;
                    }
                    fprintf(__stderrp, "%s: auto load failed\n", (const char *)qword_100024C40);
                    uint64_t v4 = 5;
LABEL_213:
                    if (!v12) {
                      goto LABEL_230;
                    }
                    goto LABEL_229;
                  }
                  v84 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v84, 4023);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_100015C3C();
                  }
                }
                else
                {
                  v83 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v83, 4017);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_100015E7C();
                  }
                }
                v58 = 0;
                uint64_t v4 = 1;
                goto LABEL_213;
              }
              v80 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
              printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v80, 4009);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100015BAC();
              }
            }
          }
          else
          {
            puts("Skipping SEP firmware load");
          }
          uint64_t v4 = 0;
          goto LABEL_211;
        }
        fprintf(__stderrp, "%s: Incorrect value size for sepfw-loaded property\n");
      }
      else
      {
        fprintf(__stderrp, "%s: Incorrect sepfw-loaded entry value type\n");
      }
      v58 = 0;
      v57 = 0;
      uint64_t v4 = 33;
LABEL_229:
      CFRelease(v12);
LABEL_230:
      IOObjectRelease(v10);
      if (v57) {
        free(v57);
      }
      if (v58) {
        free(v58);
      }
      return v4;
    }
    BOOL v15 = 0;
    goto LABEL_205;
  }
  if (v3 < 2)
  {
    fprintf(__stderrp, "%s: ERROR: At least one option required\n");
LABEL_11:
    sub_100001C6C();
    return 22;
  }
  int v17 = getopt_long(v3, v2, "a:b:c:d:f:g:hkmno:pq:r:s:t:uv:wx:CDFI:L:NO:PR:ST:W:", (const option *)&off_100024000, 0);
  if (v17 != -1)
  {
    int v182 = 0;
    int v180 = 0;
    int v123 = 0;
    char v160 = 0;
    uint64_t v158 = 0;
    uint64_t v159 = 0;
    int v183 = 0;
    BOOL v18 = 0;
    uint64_t v19 = 0;
    int v165 = 0;
    uint64_t v166 = 0;
    BOOL v133 = 0;
    uint64_t v131 = 0;
    int v132 = 0;
    uint64_t v156 = 0;
    v157 = 0;
    v175 = 0;
    uint64_t v154 = 0;
    uint64_t v155 = 0;
    unsigned int v140 = 0;
    unsigned __int16 v141 = 0;
    char v130 = 0;
    uint64_t v151 = 0;
    uint64_t v152 = 0;
    v153 = 0;
    char v142 = 0;
    char v148 = 0;
    v147 = 0;
    char v146 = 0;
    v144 = 0;
    char v143 = 0;
    unsigned int v129 = 0;
    char v128 = 0;
    unsigned int v120 = 0;
    char v119 = 0;
    unint64_t v20 = 0;
    uint64_t v125 = 0;
    v126 = 0;
    v127 = 0;
    unsigned int v117 = 0;
    unsigned int v124 = 0;
    int v181 = 0;
    uint64_t v138 = 0;
    uint64_t v139 = 0;
    *(void *)v177 = 0;
    unint64_t v118 = 0;
    int v134 = 0;
    int v121 = 0;
    uint64_t v122 = 0;
    uint64_t v135 = 0;
    unint64_t v136 = 0;
    int v161 = 0;
    unint64_t v162 = 0;
    uint64_t v163 = 0;
    uint64_t v173 = 0;
    uint64_t v174 = 0;
    int v137 = 0;
    int v179 = 0;
    uint32_t v178 = 0;
    int v171 = 0;
    unint64_t v167 = 0;
    int v168 = 0;
    int v176 = 0;
    int v172 = 255;
    memset(v164, 170, sizeof(v164));
    v149 = (char *)0xAAAAAAAAAAAAAAAALL;
    v150 = (char *)0xAAAAAAAAAAAAAAAALL;
    v145 = (char *)0xAAAAAAAAAAAAAAAALL;
    int v170 = 255;
    int v169 = 255;
    while (1)
    {
      if (v17 > 767)
      {
        if (v17 <= 1023)
        {
          switch(v17)
          {
            case 768:
              if (!optarg)
              {
                fprintf(__stderrp, "%s: missing UUID \n");
                return 22;
              }
              if (uuid_parse(optarg, uu))
              {
                fprintf(__stderrp, "%s: invalid UUID\n");
                return 22;
              }
              int v123 = 1;
              break;
            case 770:
              v164[2] = optarg;
              HIDWORD(v166) = 1;
              break;
            case 771:
              v164[1] = optarg;
              LODWORD(v166) = 1;
              break;
            case 772:
              byte_100025450 = 1;
              break;
            case 773:
              byte_100025454 = 1;
              break;
            case 774:
              if (!optarg)
              {
                fprintf(__stderrp, "%s: Missing slot ID\n");
                goto LABEL_11;
              }
              if (*optarg)
              {
                v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                int v25 = strtoul(optarg, v209, 10);
                int v26 = v172;
                if (!*v209[0]) {
                  int v26 = v25;
                }
                int v172 = v26;
              }
              break;
            case 775:
              v164[0] = optarg;
              int v165 = 1;
              break;
            case 776:
              if (!optarg)
              {
                fprintf(__stderrp, "%s: Missing set provisional state \n");
                goto LABEL_11;
              }
              v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              unsigned int v24 = strtoull(optarg, v209, 10);
              if (v209[0] != &optarg[strlen(optarg)])
              {
                v75 = "%s: Unable to parse provisional AP slot state\n";
LABEL_306:
                fprintf(__stderrp, v75, qword_100024C40);
                goto LABEL_11;
              }
              if (v24 >= 2)
              {
                v75 = "%s: Invalid value for provisional AP slot state\n";
                goto LABEL_306;
              }
              BOOL v18 = v24 == 1;
              fprintf(__stderrp, "set_provisional_ap_value %d\n", v24 == 1);
              uint64_t v19 = 1;
              break;
            case 777:
              int v183 = 1;
              break;
            default:
              goto LABEL_283;
          }
        }
        else
        {
          switch(v17)
          {
            case 1024:
              v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100005440(optarg, 10, (unint64_t *)v209) || v209[0] > (char *)1)
              {
                fprintf(__stderrp, "%s: Missing or invalid BIS bits per subpixel type value\n");
                goto LABEL_11;
              }
              unsigned int v120 = v209[0];
              char v119 = 1;
              break;
            case 1025:
              v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100005440(optarg, 10, (unint64_t *)v209) || v209[0] > (char *)1) {
                goto LABEL_273;
              }
              unsigned int v129 = v209[0];
              char v128 = 1;
              break;
            case 1026:
              v144 = optarg;
              char v143 = 1;
              break;
            case 1027:
              v147 = optarg;
              char v146 = 1;
              break;
            case 1028:
              LODWORD(v155) = 1;
              break;
            case 1029:
              char v148 = 1;
              break;
            case 1030:
              char v142 = 1;
              break;
            case 1031:
              LOBYTE(v151) = 1;
              break;
            case 1032:
              BYTE4(v159) = 1;
              break;
            case 1033:
              BYTE4(v152) = 1;
              break;
            case 1034:
              v153 = optarg;
              LOBYTE(v152) = 1;
              break;
            case 1035:
              v145 = optarg;
              BYTE4(v151) = 1;
              break;
            case 1036:
              v149 = optarg;
              LOBYTE(v154) = 1;
              break;
            case 1037:
              v150 = optarg;
              BYTE4(v154) = 1;
              break;
            case 1038:
              v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100005440(optarg, 10, (unint64_t *)v209)
                || (unsigned int v140 = v209[0], v209[0] > (char *)0x29))
              {
LABEL_273:
                fprintf(__stderrp, "%s: Missing or invalid gain test set\n");
                goto LABEL_11;
              }
              char v130 = 1;
              break;
            case 1039:
              v175 = optarg;
              BYTE4(v155) = 1;
              break;
            case 1040:
              LOBYTE(v156) = 1;
              break;
            case 1041:
              BYTE4(v156) = 1;
              break;
            case 1042:
              v175 = optarg;
              break;
            case 1043:
              v157 = optarg;
              break;
            case 1044:
              LOBYTE(v158) = 1;
              break;
            case 1045:
              v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100005440(optarg, 10, (unint64_t *)v209) || v209[0] > (char *)2)
              {
                fprintf(__stderrp, "%s: bad corruption type %s\n");
                return 22;
              }
              int v132 = (int)v209[0];
              LOBYTE(v131) = 1;
              break;
            case 1046:
              v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
              if (!sub_100005440(optarg, 10, (unint64_t *)v209) || v209[0] > (char *)1)
              {
                fprintf(__stderrp, "%s: bad gain restriction %s\n");
                return 22;
              }
              BOOL v133 = v209[0] != 0;
              BYTE4(v131) = 1;
              break;
            case 1047:
              BYTE4(v158) = 1;
              break;
            default:
              if (v17 == 1792)
              {
                LOBYTE(v159) = 1;
              }
              else
              {
                if (v17 != 1793)
                {
LABEL_283:
                  fprintf(__stderrp, "%s: ERROR: Invalid option\n");
                  goto LABEL_11;
                }
                char v160 = 1;
              }
              break;
          }
        }
      }
      else
      {
        switch(v17)
        {
          case 'C':
            uint64_t v21 = sub_1000053A8((uint64_t)__dst);
            if (v21) {
              return v21;
            }
            HIDWORD(v138) = 1;
            break;
          case 'D':
            uint64_t v21 = sub_1000053A8((uint64_t)__dst);
            if (v21) {
              return v21;
            }
            LODWORD(v138) = 1;
            break;
          case 'E':
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'Q':
          case 'U':
          case 'V':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '^':
          case '_':
          case 'e':
          case 'i':
          case 'l':
            goto LABEL_283;
          case 'F':
            LODWORD(v173) = 1;
            break;
          case 'I':
            uint64_t v31 = optarg;
            if (strcmp(optarg, "-"))
            {
              int v32 = open(v31, 0);
              int v170 = v32;
              goto LABEL_101;
            }
            int v170 = fileno(__stdinp);
            break;
          case 'L':
            v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
            if (!sub_100005440(optarg, 16, (unint64_t *)v209))
            {
              fprintf(__stderrp, "%s: Missing or invalid version\n");
              goto LABEL_11;
            }
            unsigned __int16 v141 = (unsigned __int16)v209[0];
            if (v209[0] >= (char *)0x10000)
            {
              fprintf(__stderrp, "%s: version argument 0x%lx is not a valid uint16 value\n");
              return 22;
            }
            BYTE4(v122) = 1;
            break;
          case 'N':
            LODWORD(v174) = 1;
            break;
          case 'O':
            int v33 = fileno(__stdinp);
            if (isatty(v33))
            {
              fprintf(__stderrp, "%s: not reading object data from a terminal, re-direct data from another file\n");
              return 22;
            }
            if (!optarg) {
              goto LABEL_268;
            }
            strncpy(v197, optarg, 0x20uLL);
            int v121 = 1;
            break;
          case 'P':
            break;
          case 'R':
            if (!optarg) {
              goto LABEL_269;
            }
            strncpy(v195, optarg, 0x20uLL);
            int v134 = 1;
            break;
          case 'S':
            HIDWORD(v173) = 1;
            break;
          case 'T':
            if (!optarg) {
              goto LABEL_268;
            }
            strncpy(v197, optarg, 0x20uLL);
            LODWORD(v135) = 1;
            break;
          case 'W':
            v35 = optarg;
            if (!strcmp(optarg, "-"))
            {
              int v169 = 1;
            }
            else
            {
              int v32 = creat(v35, 0x1A5u);
              int v169 = v32;
LABEL_101:
              if ((v32 & 0x80) != 0)
              {
                v74 = __stderrp;
                goto LABEL_282;
              }
            }
            break;
          case 'a':
            int v28 = optarg;
            if (!optarg) {
              goto LABEL_269;
            }
            int v29 = (char *)&v199;
            size_t v30 = 32;
            goto LABEL_105;
          case 'b':
            long long v199 = *(_OWORD *)"set";
            long long v200 = unk_100018E92;
            int v28 = optarg;
            if (!optarg)
            {
              fprintf(__stderrp, "%s: Missing value \n");
              goto LABEL_11;
            }
            int v29 = &byte_100024C4E;
            size_t v30 = 2048;
LABEL_105:
            strncpy(v29, v28, v30);
            HIDWORD(v174) = 1;
            break;
          case 'c':
            if (!optarg) {
              goto LABEL_268;
            }
            strncpy(v197, optarg, 0x20uLL);
            HIDWORD(v135) = 1;
            break;
          case 'd':
            int v36 = fileno(__stdoutp);
            if (isatty(v36))
            {
              fprintf(__stderrp, "%s: not writing data to a terminal, re-direct data to another file\n");
              return 22;
            }
            if (!optarg)
            {
LABEL_275:
              fprintf(__stderrp, "%s: Missing count \n");
              goto LABEL_11;
            }
            unint64_t v167 = strtol(optarg, 0, 10);
            int v168 = 1;
            break;
          case 'f':
            if (!optarg) {
              goto LABEL_267;
            }
            strncpy(__dst, optarg, 0x400uLL);
            int v179 = 1;
            uint32_t v27 = 6;
            goto LABEL_77;
          case 'g':
            if (!optarg) {
              goto LABEL_275;
            }
            unint64_t v136 = strtol(optarg, 0, 10);
            break;
          case 'h':
            sub_100001C6C();
            break;
          case 'j':
            int v171 = 1;
            break;
          case 'k':
            LODWORD(v163) = 1;
            break;
          case 'm':
            int v176 = 1;
            break;
          case 'n':
            HIDWORD(v163) = 1;
            break;
          case 'o':
            int v34 = fileno(__stdoutp);
            if (isatty(v34))
            {
              fprintf(__stderrp, "%s: not writing object data to a terminal, re-direct data to another file\n");
              return 22;
            }
            if (!optarg)
            {
LABEL_268:
              fprintf(__stderrp, "%s: Missing name \n");
              goto LABEL_11;
            }
            strncpy(v197, optarg, 0x20uLL);
            LODWORD(v122) = 1;
            break;
          case 'p':
            int v182 = 1;
            break;
          case 'q':
            if (!optarg) {
              goto LABEL_267;
            }
            strncpy(v202, optarg, 0x400uLL);
            break;
          case 'r':
            if (!optarg) {
              goto LABEL_267;
            }
            strncpy(__dst, optarg, 0x400uLL);
            int v179 = 1;
            uint32_t v27 = 7;
            goto LABEL_77;
          case 's':
            if (!optarg)
            {
LABEL_269:
              fprintf(__stderrp, "%s: Missing sub-command\n");
              goto LABEL_11;
            }
            strncpy((char *)v201, optarg, 0x20uLL);
            int v137 = 1;
            break;
          case 't':
            if (!optarg)
            {
LABEL_267:
              fprintf(__stderrp, "%s: Missing file path\n");
              goto LABEL_11;
            }
            strncpy(__dst, optarg, 0x400uLL);
            int v179 = 1;
            uint32_t v27 = 8;
LABEL_77:
            uint32_t v178 = v27;
            break;
          case 'u':
            int v180 = 1;
            break;
          case 'v':
            unint64_t v162 = strtol(optarg, 0, 10);
            break;
          case 'w':
            byte_100024C4D = 1;
            break;
          case 'x':
            int v161 = string_to_handle((unint64_t)optarg);
            break;
          default:
            switch(v17)
            {
              case 257:
                int v22 = optarg;
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing test name\n");
                  goto LABEL_11;
                }
                v23 = strchr(optarg, 47);
                if (v23)
                {
                  char *v23 = 0;
                  unsigned int v117 = string_to_handle((unint64_t)(v23 + 1));
                }
                unsigned int v124 = string_to_handle((unint64_t)v22);
                int v181 = 3;
                goto LABEL_196;
              case 258:
                int v40 = 1;
                goto LABEL_173;
              case 259:
                int v40 = 4;
                goto LABEL_173;
              case 260:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing test input file\n");
                  goto LABEL_11;
                }
                v126 = fopen(optarg, "r");
                if (v126) {
                  goto LABEL_196;
                }
                fprintf(__stderrp, "%s: Couldn't open testing input\n");
                return *__error();
              case 261:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing test output file\n");
                  goto LABEL_11;
                }
                v127 = fopen(optarg, "w");
                if (v127) {
                  goto LABEL_196;
                }
                fprintf(__stderrp, "%s: Couldn't open testing output\n");
                return *__error();
              case 262:
                v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                if (!sub_100005440(optarg, 10, (unint64_t *)v209))
                {
                  fprintf(__stderrp, "%s: Missing or invalid test offset value\n");
                  goto LABEL_11;
                }
                LODWORD(v125) = v209[0];
                goto LABEL_196;
              case 263:
              case 265:
              case 266:
              case 268:
              case 269:
                goto LABEL_283;
              case 264:
                v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                if (!sub_100005440(optarg, 10, (unint64_t *)v209))
                {
                  fprintf(__stderrp, "%s: Missing or invalid test timeout value\n");
                  goto LABEL_11;
                }
                HIDWORD(v125) = v209[0];
                int v40 = 5;
LABEL_173:
                int v181 = v40;
                goto LABEL_196;
              case 267:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing output file\n");
                  goto LABEL_11;
                }
                sub_10000CBFC(optarg);
                goto LABEL_196;
              case 270:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing dump coverage name \n");
                  goto LABEL_11;
                }
                strncpy(&v185[4], optarg, 4uLL);
                byte_100025458 = 1;
                goto LABEL_196;
              case 271:
                if (!optarg)
                {
                  fprintf(__stderrp, "%s: Missing SMC event count \n");
                  goto LABEL_11;
                }
                strtoull(optarg, 0, 10);
                goto LABEL_196;
              case 272:
                if (!optarg) {
                  goto LABEL_270;
                }
                strncpy(v185, optarg, 4uLL);
                *(void *)v177 = 6;
                goto LABEL_196;
              case 273:
                if (!optarg) {
                  goto LABEL_270;
                }
                unint64_t v41 = v20;
                BOOL v42 = v18;
                uint64_t v43 = v19;
                v48 = strtok(optarg, ":");
                strncpy(v185, v48, 4uLL);
                v49 = strtok(0, ":");
                if (!v49) {
                  goto LABEL_277;
                }
                strncpy(inputStruct, v49, 0x1CuLL);
                uint64_t v47 = 7;
                goto LABEL_185;
              case 274:
                if (!optarg)
                {
LABEL_270:
                  fprintf(__stderrp, "%s: Missing arguments \n");
                  goto LABEL_11;
                }
                unint64_t v41 = v20;
                BOOL v42 = v18;
                uint64_t v43 = v19;
                v44 = strtok(optarg, ":");
                strncpy(v185, v44, 4uLL);
                v45 = strtok(0, ":");
                if (!v45)
                {
LABEL_277:
                  fprintf(__stderrp, "%s: Missing debug var name \n");
                  goto LABEL_11;
                }
                strncpy(inputStruct, v45, 0x1CuLL);
                v46 = strtok(0, ":");
                if (!v46)
                {
                  fprintf(__stderrp, "%s: Missing debug var new value \n");
                  goto LABEL_11;
                }
                unint64_t v118 = strtoull(v46, 0, 0);
                uint64_t v47 = 8;
LABEL_185:
                *(void *)v177 = v47;
                uint64_t v19 = v43;
                BOOL v18 = v42;
                unint64_t v20 = v41;
                goto LABEL_196;
              case 275:
                if (!optarg) {
                  goto LABEL_274;
                }
                unint64_t v20 = string_to_handle((unint64_t)optarg);
                byte_100024C48 = 1;
                goto LABEL_196;
              case 276:
                if (!optarg)
                {
LABEL_274:
                  fprintf(__stderrp, "%s: Missing object handle \n");
                  goto LABEL_11;
                }
                unint64_t v20 = string_to_handle((unint64_t)optarg);
                byte_100024C4C = 1;
                goto LABEL_196;
              case 277:
                v50 = optarg;
                if (!strcmp(optarg, "enable"))
                {
                  uint64_t v139 = 0x100000001;
                }
                else
                {
                  if (strcmp(v50, "disable"))
                  {
                    fprintf(__stderrp, "%s: Tunable mode must be 'enable' or 'disable'.\n");
                    return 22;
                  }
                  uint64_t v139 = 0x100000000;
                }
                break;
              default:
                if (v17) {
                  goto LABEL_283;
                }
                goto LABEL_196;
            }
            break;
        }
      }
LABEL_196:
      int v17 = getopt_long(v3, v2, "a:b:c:d:f:g:hkmno:pq:r:s:t:uv:wx:CDFI:L:NO:PR:ST:W:", (const option *)&off_100024000, 0);
      if (v17 == -1) {
        goto LABEL_200;
      }
    }
  }
  int v176 = 0;
  uint64_t v173 = 0;
  uint64_t v174 = 0;
  int v168 = 0;
  unint64_t v167 = 0;
  int v171 = 0;
  uint32_t v178 = 0;
  int v179 = 0;
  uint64_t v138 = 0;
  uint64_t v139 = 0;
  int v137 = 0;
  uint64_t v135 = 0;
  unint64_t v136 = 0;
  unint64_t v162 = 0;
  uint64_t v163 = 0;
  uint64_t v122 = 0;
  int v161 = 0;
  int v121 = 0;
  int v134 = 0;
  unint64_t v118 = 0;
  *(void *)v177 = 0;
  int v181 = 0;
  unsigned int v124 = 0;
  unsigned int v117 = 0;
  v126 = 0;
  v127 = 0;
  uint64_t v125 = 0;
  unsigned __int16 v141 = 0;
  char v142 = 0;
  LODWORD(v20) = 0;
  char v119 = 0;
  unsigned int v120 = 0;
  char v128 = 0;
  unsigned int v129 = 0;
  char v143 = 0;
  v144 = 0;
  char v146 = 0;
  v147 = 0;
  uint64_t v154 = 0;
  uint64_t v155 = 0;
  char v148 = 0;
  uint64_t v151 = 0;
  uint64_t v152 = 0;
  v153 = 0;
  char v130 = 0;
  unsigned int v140 = 0;
  v175 = 0;
  uint64_t v156 = 0;
  v157 = 0;
  uint64_t v158 = 0;
  uint64_t v159 = 0;
  uint64_t v131 = 0;
  int v132 = 0;
  BOOL v133 = 0;
  uint64_t v166 = 0;
  int v165 = 0;
  LODWORD(v19) = 0;
  LOBYTE(v18) = 0;
  int v183 = 0;
  char v160 = 0;
  int v123 = 0;
  int v180 = 0;
  int v182 = 0;
  int v169 = 255;
  int v170 = 255;
  v145 = (char *)0xAAAAAAAAAAAAAAAALL;
  v149 = (char *)0xAAAAAAAAAAAAAAAALL;
  v150 = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(v164, 170, sizeof(v164));
  int v172 = 255;
LABEL_200:
  if (byte_100025459)
  {
    BOOL v116 = v18;
    int v51 = v19;
    int v52 = v183;
    uint64_t v53 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v54 = sub_1000054AC();
    if (v54)
    {
      uint64_t v4 = v54;
      fprintf(__stderrp, "%s: Failed to connect to sep\n");
      return v4;
    }
    BOOL v116 = v18;
    int v51 = v19;
    int v52 = v183;
    uint64_t v53 = 0;
  }
  if (v182 && IOConnectCallScalarMethod(dword_100024C08, 0, 0, 0, 0, 0))
  {
    fprintf(__stderrp, "%s: ping failed\n");
    return 5;
  }
  if (v180 && sub_1000057B0())
  {
    fprintf(__stderrp, "%s: mailbox raw log print failed\n");
    return 5;
  }
  if (v176 && !sub_100005A64())
  {
    fprintf(__stderrp, "%s: security mode query failed\n");
    return 5;
  }
  if (v174 && IOConnectCallScalarMethod(dword_100024C08, 2u, 0, 0, 0, 0))
  {
    fprintf(__stderrp, "%s: Nap failed\n");
    return 5;
  }
  if (HIDWORD(v173) && IOConnectCallScalarMethod(dword_100024C08, 1u, 0, 0, 0, 0))
  {
    fprintf(__stderrp, "%s: Sleep failed\n");
    return 5;
  }
  if (v173)
  {
    sub_100005B0C();
    v71 = __stderrp;
    outputStruct = (void *)qword_100024C40;
    v72 = "%s: pingflood failed\n";
LABEL_256:
    fprintf(v71, v72, outputStruct, v115);
    return 5;
  }
  if (v171 && !sub_100005BE8((char)v170, (char)v169)) {
    return 5;
  }
  if (v168 && (sub_100005D04(v167) & 1) == 0)
  {
    fprintf(__stderrp, "%s: rng-dump %ld failed\n");
    return 5;
  }
  if (dword_100024C10 && !sub_100005F20())
  {
    fprintf(__stderrp, "%s: process info failed\n");
    return 5;
  }
  if (dword_100024C14)
  {
    uint64_t v73 = sub_1000060B8(1);
    if (v73)
    {
      uint64_t v4 = v73;
      fprintf(__stderrp, "%s: Gigalocker initialization failed: %d\n");
      return v4;
    }
    uint64_t v53 = 0;
  }
  if (!dword_100024C18) {
    goto LABEL_315;
  }
  if (!dword_100024C08) {
    sub_100015B90();
  }
  uint64_t v76 = IOConnectCallMethod(dword_100024C08, 0x2Eu, 0, 0, 0, 0, 0, 0, 0, 0);
  uint64_t v53 = 0;
  if (v76)
  {
    uint64_t v4 = v76;
    uint64_t v91 = (int)v76;
    v92 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v91, (const char *)&unk_100019A01, v92, 1978);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000160BC();
    }
  }
  else
  {
LABEL_315:
    BOOL v184 = 0;
    if (sub_10000A8C4(&v184))
    {
      fwrite("Failed to query nonce slot support\n", 0x23uLL, 1uLL, __stderrp);
      return 5;
    }
    if (v179)
    {
      if (v184 && (_BYTE)v172 == 0xFF)
      {
        puts("Boot slot not provided to load SEPFW, setting to default");
        int v172 = 2;
      }
      v77 = v202[0] ? v202 : 0;
      if (!sub_10000646C(__dst, v77, v178, v172))
      {
        fprintf(__stderrp, "%s: failed to load %s in %c%c%c%c mode\n");
        return 5;
      }
    }
    if (dword_100024C1C && !sub_100006970())
    {
      fprintf(__stderrp, "%s: failed to notify SEP/OS about erase install\n");
      return 5;
    }
    if (byte_100025450 == 1)
    {
      if (v184 && (_BYTE)v172 == 0xFF)
      {
        fprintf(__stderrp, "%s: didn't provide slot ID to commit-hash");
        return 22;
      }
      if (!sub_1000069FC(v172, 0))
      {
        fprintf(__stderrp, "%s: failed to commit SEP hash\n");
        return 5;
      }
    }
    if (byte_100025454 == 1)
    {
      if (v184 && (_BYTE)v172 == 0xFF)
      {
        fprintf(__stderrp, "%s: didn't provide slot ID to commit-hash-ap");
        return 22;
      }
      if (!sub_1000069FC(v172, 1u))
      {
        fprintf(__stderrp, "%s: failed to commit AP hash\n");
        return 5;
      }
    }
    if (dword_100024C28)
    {
      if ((v170 & 0x80) != 0) {
        fprintf(__stderrp, "%s: No lcrt file provided\n", (const char *)qword_100024C40);
      }
      if ((sub_100006AC8((char)v170) & 1) == 0)
      {
        fprintf(__stderrp, "%s: lcrt verification failed\n");
        return 5;
      }
    }
    if ((v166 & 0x100000000) != 0 && (sub_100006BE4() & 1) == 0)
    {
      fprintf(__stderrp, "%s: failed to get lynx chip serial number\n");
      return 5;
    }
    if ((v166 & 1) != 0 && (sub_100006D18() & 1) == 0)
    {
      fprintf(__stderrp, "%s: failed to get lynx public key\n");
      return 5;
    }
    if ((v165 & 1) != 0 && (sub_100006E4C(v164[0]) & 1) == 0)
    {
      fprintf(__stderrp, "%s: failed to get lynx app hash\n");
      return 5;
    }
    if (HIDWORD(v138))
    {
      if (dword_10002545C == 2)
      {
        if (sub_100006F54(__dst))
        {
          fprintf(__stderrp, "%s: boot check failed\n");
          return 5;
        }
      }
      else
      {
        puts("bootCheck: Cannot perform boot check on non-ART platform. Assuming OK");
      }
    }
    if (v138)
    {
      uint64_t v78 = sub_100007140(__dst);
      if (v78)
      {
        uint64_t v4 = v78;
        fprintf(__stderrp, "%s: dump firmware failed\n");
        return v4;
      }
      uint64_t v53 = 0;
    }
    if (v137 && (sub_10000721C((const char *)v201) & 1) == 0)
    {
      fprintf(__stderrp, "%s: ROM command %s failed\n");
      return 5;
    }
    if (dword_100024C20 && !sub_100007328((char)v169)) {
      return 5;
    }
    if (HIDWORD(v174) && (sub_100007454((const char *)&v199, v136, v160 & 1) & 1) == 0)
    {
      fprintf(__stderrp, "%s: ART command %s failed\n");
      return 5;
    }
    if (dword_100024C24 && !sub_10000787C())
    {
      fprintf(__stderrp, "%s: ART get nonce request failed\n");
      return 5;
    }
    if (HIDWORD(v163) && (sub_10000793C() & 1) == 0)
    {
      fprintf(__stderrp, "%s: ART new-nonce request failed\n");
      return 5;
    }
    if (v163 && IOConnectCallStructMethod(dword_100024C08, 0x10u, 0, 0, 0, 0))
    {
      fprintf(__stderrp, "%s: ART invalidate nonce request failed\n");
      return 5;
    }
    if ((v122 & 0x100000000) != 0)
    {
      uint64_t v88 = sub_100007A70(v141);
      if (v88)
      {
        v89 = __stderrp;
        outputStruct = (void *)qword_100024C40;
        uint64_t v115 = v88;
        v72 = "%s: Failed to start versioned apps result=0x%x\n";
LABEL_402:
        v71 = v89;
        goto LABEL_256;
      }
    }
    if (HIDWORD(v135))
    {
      if (!v162)
      {
        fprintf(__stderrp, "%s: Invalid/No object size specified\n");
        return 5;
      }
      if (!sub_100007AE4((unint64_t)v197, v162))
      {
        fprintf(__stderrp, "%s: Object create failed\n");
        return 5;
      }
    }
    if (v135)
    {
      if (!v161)
      {
        fprintf(__stderrp, "%s: Invalid/No service handle\n");
        return 5;
      }
      if ((sub_100007C08((unint64_t)v197, v161) & 1) == 0)
      {
        fprintf(__stderrp, "%s: Share %s failed\n");
        return 5;
      }
    }
    if (v122 && (sub_100007D0C((unint64_t)v197) & 1) == 0)
    {
      fprintf(__stderrp, "%s: Get %s failed\n");
      return 5;
    }
    if (v121 && (sub_100007E8C((unint64_t)v197) & 1) == 0)
    {
      fprintf(__stderrp, "%s: Put %s failed\n");
      return 5;
    }
    if (v134 && (sub_100008060((unint64_t)v195, (char)v170, (char)v169) & 1) == 0)
    {
      fprintf(__stderrp, "%s: pairing failed\n");
      return 5;
    }
    if (v123 && !sub_100008308(uu)) {
      return 22;
    }
    if (v181)
    {
      LOBYTE(v209[0]) = -86;
      if (!sepTesting(v181, v126, v125, HIDWORD(v125), v127, v117, v124, v209))
      {
        uint64_t v4 = 5;
        v90 = "%s: test command failed\n";
        goto LABEL_437;
      }
      if (v181 == 3 && !LOBYTE(v209[0]))
      {
        uint64_t v4 = 1;
        v90 = "%s: test returned failure\n";
LABEL_437:
        fprintf(__stderrp, v90, qword_100024C40, v115);
        return v4;
      }
    }
    if (v177[0])
    {
      uint64_t v93 = sepDebugVar(v177[0], v185, inputStruct, v118);
      if (v93)
      {
        v89 = __stderrp;
        outputStruct = *(void **)v177;
        uint64_t v115 = v93;
        v72 = "Debug var command %d failed, ret: 0x%x\n";
        goto LABEL_402;
      }
      uint64_t v53 = 0;
    }
    if ((v139 & 0x100000000) != 0)
    {
      uint64_t v94 = sub_100008394(v139 & 1);
      if (v94)
      {
        v89 = __stderrp;
        outputStruct = (void *)v94;
        v72 = "Failed to update tunable check mode. ret: 0x%x\n";
        goto LABEL_402;
      }
      uint64_t v53 = 0;
    }
    if (v119)
    {
      v209[0] = (char *)v120;
      uint64_t v95 = IOConnectCallScalarMethod(dword_100024C08, 0x30u, (const uint64_t *)v209, 1u, 0, 0);
      if (v95)
      {
        uint64_t v4 = v95;
        fprintf(__stderrp, "%s: Hilo accumulate test pattern failed: 0x%x\n");
        return v4;
      }
      uint64_t v53 = 0;
    }
    uint64_t v4 = v53;
    if (v128)
    {
      v209[0] = (char *)v129;
      uint64_t v96 = IOConnectCallScalarMethod(dword_100024C08, 0x31u, (const uint64_t *)v209, 1u, 0, 0);
      uint64_t v4 = v96;
      int v97 = (v142 & 1) != 0 ? -536870174 : 0;
      if (v96 != v97)
      {
        fprintf(__stderrp, "%s: Hilo gain calculation had unexpected return value: 0x%x, hilo_expect_gain_failure: %d\n");
        return v4;
      }
    }
    if (v143)
    {
      uint64_t v4 = sub_100008410(v144);
      if (v4)
      {
        fprintf(__stderrp, "%s: Hilo get LTH failed: 0x%x\n");
        return v4;
      }
    }
    if (v146)
    {
      int v98 = (v155 & 1) != 0 ? -536870174 : 0;
      uint64_t v4 = sub_1000084D8(v147, v155);
      if (v4 != v98)
      {
        fprintf(__stderrp, "%s: Hilo load LTH had unexpected return value: 0x%x\n");
        return v4;
      }
    }
    if (v148)
    {
      v209[0] = (char *)0xAAAAAAAAAAAAAAAALL;
      uint64_t v99 = sub_1000085F0(v209);
      if (v99)
      {
        uint64_t v4 = v99;
        fprintf(__stderrp, "%s: Couldn't get raw LTH, return value: 0x%x");
        return v4;
      }
      v100 = v209[0];
      char v101 = sub_100008700((uint64_t)v209[0]);
      free(v100);
      if ((v101 & 1) == 0) {
        fprintf(__stderrp, "%s: Raw LTH didn't have expected value", (const char *)qword_100024C40);
      }
      uint64_t v4 = 0;
    }
    if (v151)
    {
      uint64_t v4 = IOConnectCallScalarMethod(dword_100024C08, 0x35u, 0, 0, 0, 0);
      if (v4)
      {
        fprintf(__stderrp, "%s: Hilo update timer failed: 0x%x\n");
        return v4;
      }
    }
    if ((v151 & 0x100000000) != 0)
    {
      uint64_t v4 = sub_100008848(v145);
      if (v4)
      {
        fprintf(__stderrp, "%s: Raw LTH fetch operation failed: 0x%x\n");
        return v4;
      }
    }
    if ((v152 & 1) == 0 || (uint64_t v4 = sub_100008918(v153, BYTE4(v152) & 1), !v4))
    {
      if ((v154 & 1) == 0 || (uint64_t v4 = sub_100008BB0(v149), !v4))
      {
        if ((v154 & 0x100000000) != 0)
        {
          uint64_t v4 = (v155 & 1) != 0 ? 3758097122 : 0;
          uint64_t v102 = sub_100008C64(v150, v155);
          if (v102 != v4)
          {
            uint64_t v103 = v102;
            fprintf(__stderrp, "%s: Hilo load LTH had unexpected return value: 0x%x\n", (const char *)qword_100024C40, v102);
            return v103;
          }
        }
        if ((v130 & 1) == 0
          || (v209[0] = (char *)v140,
              uint64_t v4 = IOConnectCallScalarMethod(dword_100024C08, 0x3Au, (const uint64_t *)v209, 1u, 0, 0),
              !v4))
        {
          if ((v155 & 0x100000000) != 0)
          {
            uint64_t v4 = sub_100008D34(v175);
            if (v4)
            {
              fprintf(__stderrp, "%s: Hilo test LTH transfer attestation had unexpected return value: 0x%x\n");
              return v4;
            }
          }
          if (v156)
          {
            uint64_t v4 = sub_100008EE8((char)v169, (char)v170);
            if (v4)
            {
              fprintf(__stderrp, "%s: Hilo get LTH transfer attestation failed: 0x%x\n");
              return v4;
            }
          }
          if ((v156 & 0x100000000) != 0)
          {
            if (!v175)
            {
              fprintf(__stderrp, "%s: cannot get LTH transfer message without scrt path\n");
              return v4;
            }
            int v104 = open(v175, 0);
            if (v104 < 0)
            {
              v74 = __stderrp;
              goto LABEL_282;
            }
            int v105 = v104;
            if (v157)
            {
              int v106 = open(v157, 0);
              if (v106 < 0)
              {
                v74 = __stderrp;
LABEL_282:
                fprintf(v74, "%s: can't open '%s'\n");
                return *__error();
              }
            }
            else
            {
              int v106 = -1;
            }
            uint64_t v107 = sub_100009058((char)v169, v105, (char)v170, v106);
            if (v107)
            {
              uint64_t v4 = v107;
              fprintf(__stderrp, "%s: Hilo get LTH transfer message failed: 0x%x\n");
              return v4;
            }
          }
          if (v158)
          {
            uint64_t v108 = sub_100009280((char)v170);
            if (v108)
            {
              uint64_t v4 = v108;
              fprintf(__stderrp, "%s: Hilo load LTH transfer message failed: 0x%x\n");
              return v4;
            }
          }
          if ((v131 & 1) != 0 && (sub_100009314((char)v169, (char)v170, v132) & 1) == 0)
          {
            uint64_t v4 = 3758097084;
            fprintf(__stderrp, "%s: Hilo corrupt attestation failed\n");
            return v4;
          }
          if ((v131 & 0x100000000) != 0 && !sub_100009448(v133))
          {
            uint64_t v4 = 3758097084;
            fprintf(__stderrp, "%s: Hilo gain restriction set failed\n");
            return v4;
          }
          if ((v158 & 0x100000000) != 0 && hilo_advance_gain_restriction_phase())
          {
            uint64_t v4 = 3758097084;
            fprintf(__stderrp, "%s: Hilo advance gain restriction phase failed\n");
            return v4;
          }
          if (dword_100024C2C) {
            sub_10000A01C();
          }
          if (dword_100024C30) {
            sub_10000A098();
          }
          if (dword_100024C34) {
            sub_10000A114();
          }
          if ((v159 & 1) != 0 && !sub_100009494())
          {
            uint64_t v4 = 3758097084;
            fprintf(__stderrp, "%s: Purge system token failed\n");
            return v4;
          }
          if ((v159 & 0x100000000) != 0) {
            sub_10000A424();
          }
          if (byte_100025458 == 1 && !sub_100009514((unint64_t)&v185[4]))
          {
            fprintf(__stderrp, "%s: dump coverage failed\n", (const char *)qword_100024C40);
          }
          else
          {
            if (dword_100024C38 && !sub_10000A518()) {
              return 3758097084;
            }
            if ((byte_100024C48 & 1) != 0 || byte_100024C4C) {
              sub_100009578(v20, byte_100024C48);
            }
            if ((v51 | v52))
            {
              if ((_BYTE)v172 == 0xFF)
              {
                fprintf(__stderrp, "%s: Provisional AP command missing slot ID\n");
                return 5;
              }
              if (!sub_1000095F4(v172, v51 & 1, v116))
              {
                fprintf(__stderrp, "%s: Provisional AP command failed\n");
                return 5;
              }
            }
            int v109 = v3 - optind;
            if (v109 >= 1)
            {
              for (uint64_t i = &v2[optind]; ; ++i)
              {
                char v111 = **i;
                if (v111)
                {
                  v112 = (unsigned __int8 *)(*i + 1);
                  while (sub_1000096EC(v111))
                  {
                    int v113 = *v112++;
                    char v111 = v113;
                    if (!v113) {
                      goto LABEL_538;
                    }
                  }
                  fprintf(__stderrp, "%s: ttyin '%c' failed\n");
                  return 5;
                }
LABEL_538:
                if (v109 < 2) {
                  break;
                }
                if (!sub_1000096EC(32))
                {
                  fprintf(__stderrp, "%s: ttyin ' ' failed\n");
                  return 5;
                }
                --v109;
              }
              if (!sub_1000096EC(10))
              {
                fprintf(__stderrp, "%s: ttyin '\\n' failed");
                return 5;
              }
              if (isatty(0)) {
                usleep(0x3D090u);
              }
            }
          }
          return 0;
        }
      }
    }
  }
  return v4;
}

uint64_t sub_1000053A8(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = lookupPathForPersonalizedData();
    if (result)
    {
      fprintf(__stderrp, "%s: error %ld while retrieving path for personalized data\n", (const char *)qword_100024C40, result);
      return 5;
    }
  }
  else
  {
    fprintf(__stderrp, "%s: invalid argument passed to %s\n", (const char *)qword_100024C40, "get_firmware_path");
    return 22;
  }
  return result;
}

BOOL sub_100005440(const char *a1, int __base, unint64_t *a3)
{
  uint64_t v3 = 0;
  if (a1)
  {
    if (a3)
    {
      uint64_t v3 = *(unsigned __int8 *)a1;
      if (*a1)
      {
        __endptr = (char *)0xAAAAAAAAAAAAAAAALL;
        *a3 = strtoul(a1, &__endptr, __base);
        return *__endptr == 0;
      }
    }
  }
  return v3;
}

uint64_t sub_1000054AC()
{
  mach_port_t mainPort = -1431655766;
  if (byte_100025459)
  {
LABEL_2:
    uint64_t v0 = 0;
    goto LABEL_5;
  }
  uint64_t v1 = IOMasterPort(0, &mainPort);
  if (v1)
  {
    uint64_t v0 = v1;
    fprintf(__stderrp, "%s: could not get master port\n");
  }
  else
  {
    CFMutableDictionaryRef v3 = IOServiceMatching("AppleSEPManager");
    if (v3)
    {
      CFDictionaryRef v4 = v3;
      if (signal(2, (void (__cdecl *)(int))sub_100009738) == (void (__cdecl *)(int))-1) {
        fprintf(__stderrp, "%s: Could not register SIGINT handler. We may leak an IOKit iterator if interrupted\n", (const char *)qword_100024C40);
      }
      qword_100025460 = (uint64_t)CFRunLoopGetCurrent();
      qword_100025468 = (uint64_t)IONotificationPortCreate(mainPort);
      unsigned int v5 = (__CFRunLoop *)qword_100025460;
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_100025468);
      CFRunLoopAddSource(v5, RunLoopSource, kCFRunLoopDefaultMode);
      uint64_t v7 = IOServiceAddMatchingNotification((IONotificationPortRef)qword_100025468, "IOServiceFirstMatch", v4, (IOServiceMatchingCallback)sub_100009764, 0, (io_iterator_t *)&dword_100025470);
      if (v7)
      {
        uint64_t v0 = v7;
        fprintf(__stderrp, "%s: could not add async match notification\n");
      }
      else
      {
        sub_100009764(0, dword_100025470);
        if ((byte_100025459 & 1) != 0
          || byte_100024C4D == 1
          && (fprintf(__stderrp, "%s: Waiting %d seconds for AppleSEPManager...\n", (const char *)qword_100024C40, 60),
              CFRunLoopRunInMode(kCFRunLoopDefaultMode, 60.0, 1u),
              (byte_100025459 & 1) != 0))
        {
          io_registry_entry_t v8 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep");
          if (v8)
          {
            io_object_t v9 = v8;
            CFTypeRef v10 = IORegistryEntrySearchCFProperty(v8, "IODeviceTree", @"has-art", kCFAllocatorDefault, 0);
            if (v10)
            {
              CFRelease(v10);
              int v11 = 2;
            }
            else
            {
              int v11 = 1;
            }
            dword_10002545C = v11;
            IOObjectRelease(v9);
            goto LABEL_2;
          }
          fprintf(__stderrp, "%s: find arm-io/sep failed\n", (const char *)qword_100024C40);
          fprintf(__stderrp, "%s: ART query failed\n", (const char *)qword_100024C40);
          uint64_t v0 = 2;
        }
        else
        {
          fprintf(__stderrp, "%s: Timeout trying to connect to the SEP\n", (const char *)qword_100024C40);
          uint64_t v0 = 60;
        }
      }
    }
    else
    {
      fprintf(__stderrp, "%s: could not make matching dictionary for '%s'\n", (const char *)qword_100024C40, "AppleSEPManager");
      uint64_t v0 = 93;
    }
  }
LABEL_5:
  if (dword_100025470)
  {
    IOObjectRelease(dword_100025470);
    dword_100025470 = 0;
  }
  return v0;
}

uint64_t sub_1000057B0()
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v0 = IOConnectCallMethod(dword_100024C08, 0xDu, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if (v0)
  {
    uint64_t v1 = v0;
    fprintf(__stderrp, "%s: getLogSize returned error 0x%x\n", (const char *)qword_100024C40, v0);
  }
  else if (HIDWORD(output))
  {
    return 3758097090;
  }
  else
  {
    size_t v13 = output;
    uint64_t v1 = output & 7;
    if ((output & 7) != 0)
    {
      fprintf(__stderrp, "%s: inconsistent mailbox Log size : %d\n", (const char *)qword_100024C40, output & 7);
    }
    else
    {
      outputStruct = malloc_type_calloc(1uLL, output, 0xCAA10881uLL);
      if (outputStruct)
      {
        CFDictionaryRef v4 = outputStruct;
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        uint32_t outputCnt = 2;
        uint64_t v5 = IOConnectCallMethod(dword_100024C08, 0xEu, 0, 0, 0, 0, &v15, &outputCnt, outputStruct, &v13);
        if (v5)
        {
          uint64_t v1 = v5;
          fprintf(__stderrp, "%s: Get mailbox log failed : %d\n", (const char *)qword_100024C40, v5);
        }
        else
        {
          printf("Kernel message log has %llu entries\n", v15 / v16);
          uint64_t v6 = v15;
          if (v15)
          {
            uint64_t v7 = 0;
            int v8 = 0;
            do
            {
              io_object_t v9 = &v4[v7];
              uint64_t v10 = *v9;
              if (*v9)
              {
                if (v8)
                {
                  printf("<skipped %d empty entries>\n", v8);
                  uint64_t v10 = *v9;
                }
                printf("0x%016llx:\t0x%016llx", &v4[v7], v10);
                if (v16 >= 2)
                {
                  for (unint64_t i = 1; i < v16; ++i)
                    printf("\t0x%016llx", v4[v7 + i]);
                }
                putchar(10);
                int v8 = 0;
                uint64_t v6 = v15;
              }
              else
              {
                ++v8;
              }
              v7 += v16;
            }
            while (v7 < v6);
            if (v8) {
              printf("<skipped %d empty entries>\n", v8);
            }
          }
          uint64_t v1 = 0;
        }
        free(v4);
      }
      else
      {
        fprintf(__stderrp, "%s: Failed to allocate memory for fetching mailbox logs\n", (const char *)qword_100024C40);
        return 12;
      }
    }
  }
  return v1;
}

BOOL sub_100005A64()
{
  kern_return_t v0;
  uint32_t outputCnt;
  uint64_t output;

  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t v0 = IOConnectCallScalarMethod(dword_100024C08, 4u, 0, 0, &output, &outputCnt);
  if (v0) {
    fprintf(__stderrp, "%s: Security mode command error: %x\n", (const char *)qword_100024C40, v0);
  }
  else {
    printf("Production Status = %llu\nSecurity Mode     = %llu\n", output & 1, (output >> 1) & 1);
  }
  return v0 == 0;
}

uint64_t sub_100005B0C()
{
  int v0 = -1;
  unsigned int v1 = 1;
  do
  {
    int v2 = random();
    usleep(v2 % 2000);
    uint64_t result = IOConnectCallScalarMethod(dword_100024C08, 0, 0, 0, 0, 0);
    int v4 = result;
    if (!(v0 + 1000 * (v1 / 0x3E8))) {
      uint64_t result = printf("SEP ping #%d\n", v1);
    }
    --v0;
    ++v1;
  }
  while (!v4);
  return result;
}

uint64_t sub_100005BE8(int a1, int a2)
{
  size_t __nbyte = 0;
  __buf = 0;
  if ((sub_10000A698(&__buf, &__nbyte, 0x400uLL, a1) & 1) == 0) {
    fprintf(__stderrp, "%s: fd_to_buf returned false\n", (const char *)qword_100024C40);
  }
  if (!__buf)
  {
    fprintf(__stderrp, "%s: fd_to_buf returned NULL in read file test\n");
    goto LABEL_9;
  }
  if (__nbyte >= 0x401)
  {
    fprintf(__stderrp, "%s: fd_to_buf read more data than max permissible limit (max_len = %d)\n");
LABEL_9:
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  unint64_t v3 = write(a2, __buf, __nbyte);
  if (v3 < __nbyte)
  {
    fprintf(__stderrp, "%s: Writing to output file failed in read file test\n");
    goto LABEL_9;
  }
  uint64_t v4 = 1;
LABEL_10:
  if (__buf) {
    free(__buf);
  }
  return v4;
}

uint64_t sub_100005D04(unint64_t a1)
{
  int v2 = fileno(__stdoutp);
  if (HIDWORD(a1))
  {
    fprintf(__stderrp, "%s: Data out size missing/out of range\n");
    return 0;
  }
  int v3 = v2;
  memset(__b, 170, sizeof(__b));
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = -1431655766;
  size_t outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = mach_absolute_time();
  if (a1)
  {
    while (1)
    {
      if (a1 >= 0x400) {
        uint64_t v5 = 1024;
      }
      else {
        uint64_t v5 = a1;
      }
      uint64_t output = v5;
      uint32_t outputCnt = 1;
      size_t outputStructCnt = 1024;
      if (IOConnectCallMethod(dword_100024C08, 0x23u, &output, 1u, 0, 0, &output, &outputCnt, __b, &outputStructCnt))
      {
        fprintf(__stderrp, "%s: ERROR: %d\n");
        return 0;
      }
      int v6 = output;
      if (output >= 0x401) {
        break;
      }
      if (output) {
        write(v3, __b, output);
      }
      LODWORD(a1) = a1 - v6;
      if (!a1) {
        goto LABEL_11;
      }
    }
    fprintf(__stderrp, "%s: kSEP_RngDump: returned bad data size %lu");
    return 0;
  }
LABEL_11:
  uint64_t v7 = mach_absolute_time() - v4;
  int v8 = __stderrp;
  io_object_t v9 = (const char *)qword_100024C40;
  unsigned int v10 = dword_100025478;
  if (!dword_100025478)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_100025474);
    unsigned int v10 = dword_100025478;
  }
  fprintf(v8, "\n%s: Time taken: %lld ns\n", v9, v7 * dword_100025474 / v10);
  return 1;
}

BOOL sub_100005F20()
{
  kern_return_t v1;
  uint64_t v2;
  unsigned char *v3;
  uint32_t outputCnt;
  size_t v6;
  uint64_t output;
  uuid_string_t out;
  unsigned char __b[1024];

  memset(__b, 170, sizeof(__b));
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v0;
  *(_OWORD *)&out[16] = v0;
  int v6 = 1024;
  uint64_t output = 1024;
  uint32_t outputCnt = 1;
  unsigned int v1 = IOConnectCallMethod(dword_100024C08, 0x41u, &output, 1u, 0, 0, &output, &outputCnt, __b, &v6);
  if (v1)
  {
    fprintf(__stderrp, "%s: ERROR: %d\n", (const char *)qword_100024C40, v1);
  }
  else if (output >= 0x20)
  {
    int v2 = 0;
    int v3 = __b;
    do
    {
      printf("%u %c%c%c%c\n", *(_DWORD *)v3, (*((int *)v3 + 1) >> 24), ((int)(*((_DWORD *)v3 + 1) << 8) >> 24), ((__int16)*((_DWORD *)v3 + 1) >> 8), (char)*((_DWORD *)v3 + 1));
      uuid_unparse(v3 + 8, out);
      printf("\t UUID: %s\n", out);
      printf("\tSlide: 0x%llx\n", *((void *)v3 + 3));
      ++v2;
      v3 += 32;
    }
    while (v2 < output >> 5);
  }
  return v1 == 0;
}

uint64_t sub_1000060B8(int a1)
{
  BOOL v21 = 0;
  bzero(inputStruct, 0x400uLL);
  memset(&__s, 0, sizeof(__s));
  uint64_t v2 = sub_10000A810(&v21);
  if (v2)
  {
    uint64_t v10 = v2;
    uint64_t v14 = (int)v2;
    uint64_t v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v14, (const char *)&unk_100019A01, v15, 4466);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016424();
    }
  }
  else
  {
    if (!v21)
    {
      printf("%s: xART is not supported on platform, skipping initialization\n", (const char *)qword_100024C40);
      return 0;
    }
    if (a1) {
      sub_10000A978();
    }
    int v3 = sub_10000A988();
    if (stat(v3, &__s) || (__s.st_mode & 0xF000) != 0x4000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000163DC();
      }
      return 20;
    }
    else
    {
      uint64_t v4 = sub_10000ACE0(inputStruct, 0x400uLL, (uint64_t)v3, 1);
      if (v4)
      {
        uint64_t v10 = v4;
        uint64_t v16 = (int)v4;
        int v17 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_100019A01, v17, 4487);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100016338();
        }
      }
      else
      {
        memset_s(&__s, 0x90uLL, 0, 0x90uLL);
        int v5 = stat(inputStruct, &__s);
        int v6 = (const char *)qword_100024C40;
        if (v5)
        {
          uint64_t v7 = __error();
          int v8 = strerror(*v7);
          printf("%s: Gigalocker file (%s) doesn't exist: %s\n", v6, inputStruct, v8);
          if ((a1 & 1) == 0) {
            return *__error();
          }
          uint64_t v9 = sub_10000A9AC(inputStruct, 0x600000uLL);
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = (int)v9;
            CFDataRef v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v11, (const char *)&unk_100019A01, v12, 4504);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100016294();
            }
            return v10;
          }
          goto LABEL_19;
        }
        printf("%s: Gigalocker file (%s) exists\n", (const char *)qword_100024C40, inputStruct);
        if ((unint64_t)__s.st_size >> 21 > 2)
        {
LABEL_19:
          if (!dword_100024C08) {
            sub_100015B90();
          }
          uint64_t v10 = IOConnectCallMethod(dword_100024C08, 0x2Cu, 0, 0, inputStruct, 0x400uLL, 0, 0, 0, 0);
          if (v10)
          {
            BOOL v18 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", (int)v10, (const char *)&unk_100019A01, v18, 4528);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000161F0();
            }
          }
          else
          {
            printf("%s: Gigalocker initialization completed\n", (const char *)qword_100024C40);
          }
          return v10;
        }
        uint64_t v19 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v19, 4508);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100016160();
        }
        return 17;
      }
    }
  }
  return v10;
}

BOOL sub_10000646C(char *a1, char *a2, uint32_t a3, unsigned int a4)
{
  unsigned int v32 = 0;
  unsigned int v33 = -1431655766;
  if (!a1)
  {
    v23 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v23, 3060);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000164C8();
    }
    return 0;
  }
  if (!strcmp(a1, "-"))
  {
    if (a2)
    {
      int v28 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v28, 3063);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100016708();
      }
    }
    else
    {
      size_t v13 = malloc_type_malloc(0x2040001uLL, 0xB4BEE3C7uLL);
      if (v13)
      {
        uint64_t v14 = (uint64_t)v13;
        unint64_t v15 = 0;
        ssize_t v16 = -1;
        while (v16)
        {
          ssize_t v16 = read(0, (void *)(v14 + v15), 33816577 - v15);
          if (v16 == -1)
          {
            fprintf(__stderrp, "%s: error reading from stdin");
            goto LABEL_26;
          }
          v15 += v16;
          if (v15 == 33816577)
          {
            fprintf(__stderrp, "%s: stdin data too large");
LABEL_26:
            BOOL v17 = 0;
            goto LABEL_31;
          }
        }
        unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
        if (Img4DecodeParseLengthFromBuffer(v14, v15, &v35))
        {
          int v29 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v29, 2973);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100016678();
          }
          goto LABEL_26;
        }
        uint64_t v19 = v35;
        if (v15 < v35) {
          sub_100015B90();
        }
        if (v15 == v35)
        {
          size_t v20 = 0;
          BOOL v21 = 0;
        }
        else
        {
          unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
          if (Img4DecodeParseLengthFromBuffer(v14 + v35, v15 - v35, &v34))
          {
            size_t v30 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v30, 2983);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000165E8();
            }
            goto LABEL_26;
          }
          size_t v20 = v15 - v35;
          if (v15 - v35 != v34)
          {
            uint64_t v31 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v31, 2985);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100016558();
            }
            goto LABEL_26;
          }
          BOOL v21 = (const void *)(v14 + v35);
        }
        BOOL v17 = sub_1000099C0(v14, v19, v21, v20, a3, a4);
LABEL_31:
        BOOL v18 = (void *)v14;
        goto LABEL_32;
      }
      fprintf(__stderrp, "%s: could not allocate data buffer", (const char *)qword_100024C40);
    }
    return 0;
  }
  int v8 = malloc_type_malloc(0x2000000uLL, 0x405A0FF5uLL);
  if (!v8)
  {
    unsigned int v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v24, 3070);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016798();
    }
    return 0;
  }
  uint64_t v9 = v8;
  if (sub_1000097E8(v8, 0x2000000uLL, a1, &v33))
  {
    int v25 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v25, 3073);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016948();
    }
LABEL_42:
    free(v9);
    return 0;
  }
  if (a2)
  {
    uint64_t v10 = malloc_type_malloc(0x40000uLL, 0x9B0D6B90uLL);
    if (v10)
    {
      uint64_t v11 = v10;
      if (sub_1000097E8(v10, 0x40000uLL, a2, &v32))
      {
        uint32_t v27 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v27, 3080);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000168B8();
        }
        free(v9);
        BOOL v17 = 0;
        goto LABEL_18;
      }
      size_t v12 = v32;
      goto LABEL_17;
    }
    int v26 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v26, 3077);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016828();
    }
    goto LABEL_42;
  }
  size_t v12 = 0;
  uint64_t v11 = 0;
LABEL_17:
  BOOL v17 = sub_1000099C0((uint64_t)v9, v33, v11, v12, a3, a4);
  free(v9);
  if (v11)
  {
LABEL_18:
    BOOL v18 = (void *)v11;
LABEL_32:
    free(v18);
  }
  return v17;
}

BOOL sub_100006970()
{
  kern_return_t v0;

  if (!dword_100024C08) {
    sub_100015B90();
  }
  long long v0 = IOConnectCallMethod(dword_100024C08, 0xAu, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v0) {
    fprintf(__stderrp, "%s: Erase install notification returned 0x%x\n", (const char *)qword_100024C40, v0);
  }
  return v0 == 0;
}

BOOL sub_1000069FC(unsigned int a1, unsigned int a2)
{
  kern_return_t v2;
  uint64_t input[2];

  input[0] = a1;
  input[1] = a2;
  printf("%s called with slot %u, for_ap %u\n", "sepCommitHash", a1, a2);
  uint64_t v2 = IOConnectCallScalarMethod(dword_100024C08, 9u, input, 2u, 0, 0);
  if (v2) {
    fprintf(__stderrp, "%s: commit hash returned 0x%x\n", (const char *)qword_100024C40, v2);
  }
  return v2 == 0;
}

uint64_t sub_100006AC8(int a1)
{
  size_t v7 = 0;
  int v8 = 0;
  mach_port_t v2 = dword_100024C08;
  if (!dword_100024C08) {
    sub_100015B90();
  }
  if (a1 < 0)
  {
    size_t v3 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    if ((sub_10000A698(&v8, &v7, 0x8000uLL, a1) & 1) == 0)
    {
      fprintf(__stderrp, "%s: can't read in lcrt\n");
      goto LABEL_12;
    }
    size_t v3 = v7;
    if (!v7)
    {
      fprintf(__stderrp, "%s: Zero sized input file\n");
      goto LABEL_12;
    }
    mach_port_t v2 = dword_100024C08;
    uint64_t v4 = v8;
  }
  if (!IOConnectCallMethod(v2, 0x29u, 0, 0, v4, v3, 0, 0, 0, 0))
  {
    uint64_t v5 = 1;
    goto LABEL_13;
  }
  fprintf(__stderrp, "%s: lcrt verification request returned 0x%x\n");
LABEL_12:
  uint64_t v5 = 0;
LABEL_13:
  if (v8) {
    free(v8);
  }
  return v5;
}

uint64_t sub_100006BE4()
{
  long long v0 = (char *)__chkstk_darwin();
  memset(__b, 170, sizeof(__b));
  size_t outputStructCnt = 0x8000;
  if (IOConnectCallMethod(dword_100024C08, 0x2Au, 0, 0, 0, 0, 0, 0, __b, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: lynx get chip serial number returned 0x%x\n");
  }
  else
  {
    if (!sub_100009F1C(__b, outputStructCnt, v0)) {
      return 1;
    }
    fprintf(__stderrp, "%s: couldn't write out Lynx Chip Serial Number\n");
  }
  return 0;
}

uint64_t sub_100006D18()
{
  long long v0 = (char *)__chkstk_darwin();
  memset(__b, 170, sizeof(__b));
  size_t outputStructCnt = 0x8000;
  if (IOConnectCallMethod(dword_100024C08, 0x2Bu, 0, 0, 0, 0, 0, 0, __b, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: lynx get public key returned 0x%x\n");
  }
  else
  {
    if (!sub_100009F1C(__b, outputStructCnt, v0)) {
      return 1;
    }
    fprintf(__stderrp, "%s: couldn't write out Lynx Public Key\n");
  }
  return 0;
}

uint64_t sub_100006E4C(char *a1)
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  outputStruct[0] = v2;
  outputStruct[1] = v2;
  *(void *)uint64_t v4 = 32;
  if (IOConnectCallMethod(dword_100024C08, 0x5Au, 0, 0, 0, 0, 0, 0, outputStruct, (size_t *)v4))
  {
    fprintf(__stderrp, "%s: lynx get app hash returned 0x%x\n");
  }
  else
  {
    if (!sub_100009F1C(outputStruct, *(size_t *)v4, a1)) {
      return 1;
    }
    fprintf(__stderrp, "%s: couldn't write out Lynx app hash\n");
  }
  return 0;
}

uint64_t sub_100006F54(char *a1)
{
  kern_return_t v7;
  const char *v8;
  int v9;
  unsigned int v11;
  size_t outputStructCnt;
  unsigned char __b[2048];

  long long v2 = malloc_type_malloc(0x2000000uLL, 0xF59108FCuLL);
  if (v2)
  {
    size_t v3 = v2;
    uint64_t v11 = -1431655766;
    uint64_t v4 = sub_1000097E8(v2, 0x2000000uLL, a1, &v11);
    if (v4)
    {
      uint64_t v5 = v4;
      fprintf(__stderrp, "%s: failed to read the firmware file\n", (const char *)qword_100024C40);
    }
    else
    {
      uint64_t v6 = v11;
      if (v11)
      {
        memset(__b, 170, sizeof(__b));
        size_t outputStructCnt = 2048;
        size_t v7 = IOConnectCallStructMethod(dword_100024C08, 0x12u, 0, 0, __b, &outputStructCnt);
        if (v7)
        {
          fprintf(__stderrp, "%s: Get ART command error: 0x%x\n", (const char *)qword_100024C40, v7);
          int v8 = "CAN NOT";
        }
        else
        {
          uint64_t v9 = sub_100001908((uint64_t)v3, v6, (uint64_t)__b, (uint64_t)&__b[outputStructCnt], 3);
          int v8 = "CAN NOT";
          if (v9) {
            int v8 = "may";
          }
        }
        printf("bootCheck: SEP %s boot with ART\n", v8);
        uint64_t v5 = 0;
      }
      else
      {
        fprintf(__stderrp, "%s: incorrect file size reported\n", (const char *)qword_100024C40);
        uint64_t v5 = 5;
      }
    }
    free(v3);
  }
  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for '%s'\n", (const char *)qword_100024C40, a1);
    return 12;
  }
  return v5;
}

uint64_t sub_100007140(char *a1)
{
  long long v2 = malloc_type_malloc(0x2000000uLL, 0x4A2D8209uLL);
  if (v2)
  {
    size_t v3 = v2;
    unsigned int v7 = -1431655766;
    uint64_t v4 = sub_1000097E8(v2, 0x2000000uLL, a1, &v7);
    if (v4)
    {
      uint64_t v5 = v4;
      fprintf(__stderrp, "%s: read firmware failed\n");
    }
    else
    {
      uint64_t v5 = sub_100001618((uint64_t)v3, v7);
      if (v5) {
        fprintf(__stderrp, "%s: img4 dump failed\n");
      }
    }
    free(v3);
  }
  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for '%s'\n", (const char *)qword_100024C40, a1);
    return 12;
  }
  return v5;
}

uint64_t sub_10000721C(const char *a1)
{
  kern_return_t v3;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input;

  if (!strcmp(a1, "status"))
  {
    uint64_t v2 = 131583;
  }
  else if (!strcmp(a1, "nop"))
  {
    uint64_t v2 = 66303;
  }
  else
  {
    if (strcmp(a1, "tz0"))
    {
      puts("unknown ROM command");
      return 0;
    }
    uint64_t v2 = 328703;
  }
  uint64_t output = v2;
  input = v2;
  uint32_t outputCnt = 1;
  size_t v3 = IOConnectCallScalarMethod(dword_100024C08, 3u, &input, 1u, &output, &outputCnt);
  if (v3)
  {
    fprintf(__stderrp, "%s: ROM command error: %x\n", (const char *)qword_100024C40, v3);
    return 0;
  }
  printf("SEP status 0x%llx\n", output);
  return 1;
}

uint64_t sub_100007328(int a1)
{
  memset(outputStruct, 170, 20);
  size_t outputStructCnt = 20;
  if (a1 <= 0)
  {
    fprintf(__stderrp, "%s: No/Illegal outfile provided\n");
  }
  else if (IOConnectCallStructMethod(dword_100024C08, 0x43u, 0, 0, outputStruct, &outputStructCnt))
  {
    fprintf(__stderrp, "%s: Failed to generate ROM nonce: %x\n");
  }
  else
  {
    size_t v2 = outputStructCnt;
    if (v2 == write(a1, outputStruct, outputStructCnt)) {
      return 1;
    }
    fprintf(__stderrp, "%s: can't write to output\n");
  }
  return 0;
}

uint64_t sub_100007454(const char *a1, unint64_t a2, int a3)
{
  memset(__b, 170, sizeof(__b));
  if (!strcasecmp(a1, "get"))
  {
    size_t outputStructCnt = 2048;
    uint64_t v6 = IOConnectCallStructMethod(dword_100024C08, 0x12u, 0, 0, __b, &outputStructCnt);
    if (v6)
    {
LABEL_9:
      int v8 = __stderrp;
      uint64_t v23 = qword_100024C40;
      uint64_t v24 = v6;
      uint64_t v9 = "%s: Get ART command error: 0x%x\n";
LABEL_43:
      fprintf(v8, v9, v23, v24);
      return 0;
    }
    sub_1000013F8((unint64_t)__b, (unint64_t)&__b[outputStructCnt]);
    return 1;
  }
  if (!strcasecmp(a1, "set"))
  {
    uint64_t v10 = &byte_100024C4E;
    if (byte_100024C4E == 48 && ((byte_100024C4F - 88) & 0xDF) == 0) {
      uint64_t v10 = (const char *)&unk_100024C50;
    }
    size_t v11 = strlen(v10);
    if (v11 >> 1 > 0x800 || (v11 & 1) != 0 || v11 == 1) {
      goto LABEL_31;
    }
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    unsigned int v14 = 2;
    do
    {
      unsigned int v15 = v10[v13];
      if (v15 - 97 > 5)
      {
        if (v15 - 65 > 5)
        {
          v15 -= 48;
          if (v15 > 9) {
            break;
          }
        }
        else
        {
          LOBYTE(v15) = v15 - 55;
        }
      }
      else
      {
        LOBYTE(v15) = v15 - 87;
      }
      char v16 = 16 * v15;
      __b[v12] = v16;
      unsigned int v17 = v10[v14 - 1];
      if (v17 - 97 > 5)
      {
        if (v17 - 65 > 5)
        {
          v17 -= 48;
          if (v17 > 9) {
            break;
          }
        }
        else
        {
          LOBYTE(v17) = v17 - 55;
        }
      }
      else
      {
        LOBYTE(v17) = v17 - 87;
      }
      __b[v12++] = v17 | v16;
      uint64_t v13 = v14;
      BOOL v18 = v11 - 1 > v14;
      v14 += 2;
    }
    while (v18);
    if ((int)v12 <= 0)
    {
LABEL_31:
      fprintf(__stderrp, "%s: Set ART command error: malformed hex string provided");
      return 0;
    }
    uint64_t v19 = IOConnectCallStructMethod(dword_100024C08, 0x13u, __b, v12, 0, 0);
    if (v19)
    {
      int v8 = __stderrp;
      uint64_t v23 = qword_100024C40;
      uint64_t v24 = v19;
      uint64_t v9 = "%s: Set ART error: 0x%x\n";
      goto LABEL_43;
    }
    int v22 = "ART persisted successfully";
    goto LABEL_46;
  }
  if (!strcasecmp(a1, "clear"))
  {
    uint64_t v20 = IOConnectCallStructMethod(dword_100024C08, 0x14u, 0, 0, 0, 0);
    if (v20)
    {
      int v8 = __stderrp;
      uint64_t v23 = qword_100024C40;
      uint64_t v24 = v20;
      uint64_t v9 = "%s: Clear ART error: 0x%x\n";
      goto LABEL_43;
    }
    int v22 = "ART cleared from storage";
LABEL_46:
    puts(v22);
    return 1;
  }
  if (strcasecmp(a1, "ctrtest"))
  {
    if (!strcasecmp(a1, "has_system_token"))
    {
      size_t outputStructCnt = 2048;
      uint64_t v6 = IOConnectCallStructMethod(dword_100024C08, 0x12u, 0, 0, __b, &outputStructCnt);
      if (!v6) {
        return sub_100001260((uint64_t)__b, outputStructCnt, a3);
      }
      goto LABEL_9;
    }
    return 0;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    fprintf(__stderrp, "%s: minblocks out of range\n");
    return 0;
  }
  size_t outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 2;
  uint64_t v21 = IOConnectCallScalarMethod(dword_100024C08, 0x24u, 0, 0, &outputStructCnt, &outputCnt);
  if (v21 || outputCnt != 2)
  {
    int v8 = __stderrp;
    uint64_t v23 = qword_100024C40;
    uint64_t v24 = v21;
    uint64_t v9 = "%s: Counter self-test error: 0x%x\n";
    goto LABEL_43;
  }
  printf("Counter self-test result: %u/%u good\n", v27, outputStructCnt);
  if (v27 < a2)
  {
    fprintf(__stderrp, "%s: Minimum good blocks criteria not met\n");
    return 0;
  }
  return 1;
}

BOOL sub_10000787C()
{
  kern_return_t v0;
  size_t outputStructCnt;
  void outputStruct[3];

  memset(outputStruct, 170, 20);
  size_t outputStructCnt = 20;
  if (!dword_100024C08) {
    sub_100015B90();
  }
  long long v0 = IOConnectCallStructMethod(dword_100024C08, 0x44u, 0, 0, outputStruct, &outputStructCnt);
  if (v0) {
    fprintf(__stderrp, "%s: Get nonce command error: %x\n", (const char *)qword_100024C40, v0);
  }
  return v0 == 0;
}

uint64_t sub_10000793C()
{
  kern_return_t v0;
  uint32_t outputCnt;
  BOOL v3;
  size_t outputStructCnt;
  uint64_t output;
  void outputStruct[3];

  memset(outputStruct, 170, 20);
  size_t outputStructCnt = 20;
  size_t v3 = 0;
  if (!sub_10000A8C4(&v3))
  {
    if (v3)
    {
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      long long v0 = IOConnectCallMethod(dword_100024C08, 0x53u, 0, 0, 0, 0, &output, &outputCnt, outputStruct, &outputStructCnt);
      if (v0)
      {
LABEL_5:
        fprintf(__stderrp, "%s: New nonce command error: %x\n", (const char *)qword_100024C40, v0);
        return 0;
      }
    }
    else
    {
      long long v0 = IOConnectCallStructMethod(dword_100024C08, 0xFu, 0, 0, outputStruct, &outputStructCnt);
      if (v0) {
        goto LABEL_5;
      }
    }
    return 1;
  }
  fwrite("Failed to query nonce slot support\n", 0x23uLL, 1uLL, __stderrp);
  return 0;
}

uint64_t sub_100007A70(unsigned int a1)
{
  input[0] = a1 >> 8;
  input[1] = a1;
  return IOConnectCallScalarMethod(dword_100024C08, 0x11u, input, 2u, 0, 0);
}

BOOL sub_100007AE4(unint64_t a1, unint64_t a2)
{
  kern_return_t v3;
  BOOL v4;
  int inputStruct;
  uint64_t input;

  LODWORD(input) = string_to_handle(a1);
  if (!input)
  {
    fprintf(__stderrp, "%s: Invalid object name\n");
    return 0;
  }
  if (HIDWORD(a2))
  {
    fprintf(__stderrp, "%s: Object size missing/out of range/invalid\n");
    return 0;
  }
  inputStruct = a2;
  size_t v3 = IOConnectCallMethod(dword_100024C08, 0x1Fu, &input, 1u, &inputStruct, 4uLL, 0, 0, 0, 0);
  uint64_t v4 = v3 == 0;
  if (v3) {
    fprintf(__stderrp, "%s: ERROR: %d\n", (const char *)qword_100024C40, v3);
  }
  else {
    printf("Created '%c%c%c%c' of size %u\n", ((int)input >> 24), ((int)(input << 8) >> 24), ((__int16)input >> 8), (char)input, inputStruct);
  }
  return v4;
}

uint64_t sub_100007C08(unint64_t a1, int a2)
{
  HIDWORD(input) = a2;
  LODWORD(input) = string_to_handle(a1);
  if (input && a2)
  {
    if (!IOConnectCallMethod(dword_100024C08, 0x20u, &input, 1u, (char *)&input + 4, 4uLL, 0, 0, 0, 0))
    {
      printf("Shared '%c%c%c%c' with '%c%c%c%c'\n", ((int)input >> 24), ((int)(input << 8) >> 24), ((__int16)input >> 8), (char)input, (SHIDWORD(input) >> 24), ((int)(HIDWORD(input) << 8) >> 24), (SWORD2(input) >> 8), SBYTE4(input));
      return 1;
    }
    fprintf(__stderrp, "%s: ERROR: %d\n");
  }
  else
  {
    fprintf(__stderrp, "%s: Invalid object/service name\n");
  }
  return 0;
}

uint64_t sub_100007D0C(unint64_t a1)
{
  unsigned int v1 = string_to_handle(a1);
  int v2 = fileno(__stdoutp);
  unsigned int v3 = 0;
  uint64_t v4 = v1;
  while (1)
  {
    memset(__b, 170, sizeof(__b));
    output[0] = v4;
    output[1] = v3;
    size_t __nbyte = 1024;
    uint32_t outputCnt = 3;
    size_t outputStructCnt = 1024;
    if (IOConnectCallMethod(dword_100024C08, 0x21u, output, 3u, 0, 0, output, &outputCnt, __b, &outputStructCnt))
    {
      fprintf(__stderrp, "%s: ERROR: %d\n");
      return 0;
    }
    size_t v5 = __nbyte;
    if (__nbyte >= 0x401) {
      break;
    }
    if (!__nbyte) {
      return 1;
    }
    write(v2, __b, __nbyte);
    if (v5 < 0x400) {
      return 1;
    }
    v3 += v5;
  }
  fprintf(__stderrp, "%s: kSEP_ObjRead: returned bad data size %lu");
  return 0;
}

uint64_t sub_100007E8C(unint64_t a1)
{
  int v1 = string_to_handle(a1);
  int v2 = fileno(__stdinp);
  memset(__b, 170, sizeof(__b));
  ssize_t v3 = read(v2, __b, 0x400uLL);
  if (v3 < 1)
  {
    unsigned int v5 = 0;
LABEL_8:
    if (!ferror(__stdinp))
    {
LABEL_10:
      printf("Copied %u bytes to %c%c%c%C\n", v5, (v1 >> 24), (v1 << 8 >> 24), ((__int16)v1 >> 8), (char)v1);
      return 1;
    }
    fprintf(__stderrp, "%s: error reading data\n");
  }
  else
  {
    ssize_t v4 = v3;
    unsigned int v5 = 0;
    while (1)
    {
      output[0] = v1;
      output[1] = v5;
      ssize_t v9 = v4;
      uint32_t outputCnt = 3;
      if (IOConnectCallMethod(dword_100024C08, 0x22u, output, 3u, __b, v4, output, &outputCnt, 0, 0)) {
        break;
      }
      if (v9 != v4) {
        goto LABEL_10;
      }
      v5 += v4;
      memset(__b, 170, sizeof(__b));
      ssize_t v4 = read(v2, __b, 0x400uLL);
      if (v4 < 1) {
        goto LABEL_8;
      }
    }
    fprintf(__stderrp, "%s: ERROR: %d\n");
  }
  return 0;
}

uint64_t sub_100008060(unint64_t a1, int a2, int a3)
{
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v18 = 0;
  size_t __nbyte = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v5 = string_to_handle(a1);
  uint64_t input = v5;
  if (!v5)
  {
    fprintf(__stderrp, "%s: Invalid pair method\n", (const char *)qword_100024C40);
    uint64_t v12 = 0;
    outputStruct = 0;
    goto LABEL_30;
  }
  int v6 = v5;
  size_t __nbyte = 0x4000;
  unsigned int v7 = malloc_type_malloc(0x4000uLL, 0x796FBE44uLL);
  outputStruct = v7;
  if (!v7)
  {
    fprintf(__stderrp, "%s: Failed to allocate memory for out_buffer\n");
    goto LABEL_29;
  }
  bzero(v7, 0x4000uLL);
  if (v6 <= 1396788559)
  {
    if (v6 != 1280921176 && v6 != 1347636041) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v6 == 1396788560 || v6 == 1397311310)
  {
LABEL_15:
    if (a3 <= 0) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  if (v6 == 1398031179)
  {
    if (a2 < 0)
    {
      fprintf(__stderrp, "%s: No/Illegal infile provided\n");
      goto LABEL_29;
    }
    if (sub_10000A698(&v18, &v17, 0x4000uLL, a2))
    {
      if (a3 > 0)
      {
        mach_port_t v9 = dword_100024C08;
        size_t v11 = v17;
        uint64_t v10 = v18;
        goto LABEL_23;
      }
LABEL_19:
      fprintf(__stderrp, "%s: No/Illegal outfile provided\n");
      goto LABEL_29;
    }
LABEL_20:
    fprintf(__stderrp, "%s: can't read in infile\n");
    goto LABEL_29;
  }
LABEL_16:
  if (a2 < 0)
  {
    size_t v11 = 0;
    uint64_t v10 = 0;
    unint64_t v17 = 0;
  }
  else
  {
    if (!sub_10000A698(&v18, &v17, 0x4000uLL, a2)) {
      goto LABEL_20;
    }
    size_t v11 = v17;
    uint64_t v10 = v18;
  }
  mach_port_t v9 = dword_100024C08;
LABEL_23:
  if (!IOConnectCallMethod(v9, 0x15u, &input, 1u, v10, v11, 0, 0, outputStruct, &__nbyte))
  {
    if (a3 < 1 || (size_t v13 = __nbyte, v13 == write(a3, outputStruct, __nbyte)))
    {
      uint64_t v12 = 1;
      goto LABEL_30;
    }
    fprintf(__stderrp, "%s: can't write out_buffer (to outfile)\n");
  }
LABEL_29:
  uint64_t v12 = 0;
LABEL_30:
  if (v18) {
    free(v18);
  }
  if (outputStruct) {
    free(outputStruct);
  }
  return v12;
}

BOOL sub_100008308(void *inputStruct)
{
  kern_return_t v1;

  if (!dword_100024C08) {
    sub_100015B90();
  }
  int v1 = IOConnectCallMethod(dword_100024C08, 0x28u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
  if (v1) {
    fprintf(__stderrp, "%s: xART OS UUID setup failed: %d\n", (const char *)qword_100024C40, v1);
  }
  return v1 == 0;
}

uint64_t sub_100008394(unsigned int a1)
{
  uint64_t input = a1;
  return IOConnectCallMethod(dword_100024C08, 0x5Bu, &input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_100008410(char *a1)
{
  uint64_t v2 = 3758097098;
  if (sub_10000A308())
  {
    ssize_t v3 = malloc_type_malloc(qword_100025480, 0x7678E66FuLL);
    if (v3)
    {
      ssize_t v4 = v3;
      size_t outputStructCnt = qword_100025480;
      uint64_t v2 = IOConnectCallStructMethod(dword_100024C08, 0x32u, 0, 0, v3, &outputStructCnt);
      if (!v2)
      {
        if (sub_100009F1C(v4, qword_100025480, a1)) {
          uint64_t v2 = 3758097098;
        }
        else {
          uint64_t v2 = 0;
        }
      }
      free(v4);
    }
    else
    {
      return 3758097085;
    }
  }
  return v2;
}

uint64_t sub_1000084D8(char *a1, int a2)
{
  uint64_t v4 = 3758097098;
  if (sub_10000A308())
  {
    unsigned int v5 = malloc_type_malloc(qword_100025480, 0x532A7A12uLL);
    if (v5)
    {
      int v6 = v5;
      int v9 = -1431655766;
      if (!sub_1000097E8(v5, qword_100025480, a1, &v9))
      {
        size_t v7 = qword_100025480;
        if (qword_100025480 != v9)
        {
          uint64_t v4 = 3758097090;
          goto LABEL_12;
        }
        if (a2)
        {
          if ((unint64_t)qword_100025480 <= 0x1000)
          {
            fprintf(__stderrp, "%s: HILO_BYTE_TO_CORRUPT is not within LTH backup\n", (const char *)qword_100024C40);
            uint64_t v4 = 3758097097;
            goto LABEL_12;
          }
          ++v6[4096];
        }
        uint64_t v4 = IOConnectCallStructMethod(dword_100024C08, 0x33u, v6, v7, 0, 0);
      }
LABEL_12:
      free(v6);
      return v4;
    }
    return 3758097085;
  }
  return v4;
}

uint64_t sub_1000085F0(void *a1)
{
  if (!sub_10000A308()) {
    return 5;
  }
  uint64_t v2 = malloc_type_malloc(qword_1000254A8, 0x6F27725FuLL);
  if (v2)
  {
    ssize_t v3 = v2;
    size_t outputStructCnt = qword_1000254A8;
    uint64_t v4 = IOConnectCallStructMethod(dword_100024C08, 0x34u, 0, 0, v2, &outputStructCnt);
    if (v4)
    {
      uint64_t v5 = v4;
      *a1 = v3;
LABEL_10:
      free(v3);
      return v5;
    }
    if (qword_1000254A8 != outputStructCnt)
    {
      fprintf(__stderrp, "%s: unexpected return call size\n", (const char *)qword_100024C40);
      uint64_t v5 = 5;
      goto LABEL_10;
    }
    uint64_t v5 = 0;
    *a1 = v3;
  }
  else
  {
    fprintf(__stderrp, "%s: can't allocate memory for LTH\n", (const char *)qword_100024C40);
    return 12;
  }
  return v5;
}

uint64_t sub_100008700(uint64_t a1)
{
  if (sub_10000A308())
  {
    uint64_t v2 = 0;
    uint64_t v7 = a1;
    uint64_t v8 = a1 + 4 * dword_100025498[0];
    uint64_t v9 = v8 + 4 * dword_10002549C;
    while (1)
    {
      uint64_t v3 = dword_100025498[v2];
      if (v3) {
        break;
      }
LABEL_7:
      if (++v2 == 3) {
        return 1;
      }
    }
    uint64_t v4 = 0;
    unsigned int v5 = v2;
    while (dword_100018DD8[3 * v4 + 3 * (v2 - 5 * (v5 / 5))] == *(_DWORD *)(*(&v7 + v2) + 4 * v4))
    {
      ++v4;
      ++v5;
      if (v3 == v4) {
        goto LABEL_7;
      }
    }
    fprintf(__stderrp, "%s: Channel %d sample %u had bad LTH value (expected %u, got %u)\n");
  }
  else
  {
    fprintf(__stderrp, "%s: No display params when expected!\n");
  }
  return 0;
}

uint64_t sub_100008848(char *a1)
{
  if (!sub_10000A308()) {
    return 3758097098;
  }
  *(void *)int v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = sub_1000085F0(v6);
  if (v2)
  {
    uint64_t v3 = v2;
    fprintf(__stderrp, "%s: Couldn't get raw LTH, return value: 0x%x\n");
  }
  else
  {
    uint64_t v4 = *(void **)v6;
    uint64_t v3 = sub_100009F1C(*(const void **)v6, qword_1000254A8, a1);
    free(v4);
    if (v3) {
      fprintf(__stderrp, "%s: LTH write to %s failed");
    }
  }
  return v3;
}

uint64_t sub_100008918(char *a1, int a2)
{
  if (!sub_10000A308()) {
    return 5;
  }
  uint64_t v4 = (char *)malloc_type_malloc(qword_1000254A8, 0xD9C6DA7DuLL);
  if (v4)
  {
    unsigned int v5 = v4;
    int v14 = -1431655766;
    if (a2)
    {
      if (!sub_10000A308())
      {
        uint64_t v11 = 3758097098;
        fprintf(__stderrp, "%s: Couldn't populate gain test LTH: %d\n");
        goto LABEL_17;
      }
      uint64_t v6 = 0;
      unsigned int v15 = v5;
      char v16 = &v5[4 * dword_100025498[0]];
      unint64_t v17 = &v16[4 * dword_10002549C];
      do
      {
        if (dword_100025498[v6])
        {
          unint64_t v7 = 0;
          uint64_t v8 = (&v15)[v6];
          unsigned int v9 = v6;
          do
          {
            *(_DWORD *)&v8[4 * v7] = dword_100018DD8[3 * v7 + 3 * (v6 - 5 * (v9 / 5))];
            ++v7;
            ++v9;
          }
          while (v7 < dword_100025498[v6]);
        }
        ++v6;
      }
      while (v6 != 3);
      uint64_t v10 = sub_100009F1C(v5, qword_1000254A8, a1);
      if (v10)
      {
        uint64_t v11 = v10;
        fprintf(__stderrp, "%s: Couldn't write gain test LTH to %s\n");
LABEL_17:
        free(v5);
        return v11;
      }
    }
    uint64_t v12 = sub_1000097E8(v5, qword_1000254A8, a1, &v14);
    if (v12)
    {
      uint64_t v11 = v12;
      fprintf(__stderrp, "%s: Couldn't read LTH from %s\n");
    }
    else if (qword_1000254A8 == v14)
    {
      uint64_t v11 = IOConnectCallStructMethod(dword_100024C08, 0x36u, v5, qword_1000254A8, 0, 0);
      if (v11) {
        fprintf(__stderrp, "%s: Couldn't load raw LTH, return value: 0x%x\n", (const char *)qword_100024C40, v11);
      }
    }
    else
    {
      fprintf(__stderrp, "%s: Read LTH size is %u, expected %lu\n", (const char *)qword_100024C40, v14, qword_1000254A8);
      uint64_t v11 = 22;
    }
    goto LABEL_17;
  }
  fprintf(__stderrp, "%s: Couldn't allocate memory for LTH\n", (const char *)qword_100024C40);
  return 12;
}

uint64_t sub_100008BB0(char *a1)
{
  uint64_t v2 = malloc_type_malloc(0x300000uLL, 0x64B2088EuLL);
  if (!v2) {
    return 3758097085;
  }
  uint64_t v3 = v2;
  size_t outputStructCnt = 3145728;
  uint64_t v4 = IOConnectCallStructMethod(dword_100024C08, 0x37u, 0, 0, v2, &outputStructCnt);
  if (!v4)
  {
    if (sub_100009F1C(v3, 0x300000uLL, a1)) {
      uint64_t v4 = 3758097098;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  free(v3);
  return v4;
}

uint64_t sub_100008C64(char *a1, int a2)
{
  uint64_t v4 = 3758097085;
  unsigned int v5 = malloc_type_malloc(0x300000uLL, 0x10B8DC58uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    int v8 = -1431655766;
    if (sub_1000097E8(v5, 0x300000uLL, a1, &v8))
    {
      uint64_t v4 = 3758097098;
    }
    else if (v8 == 3145728)
    {
      if (a2) {
        ++v6[4096];
      }
      uint64_t v4 = IOConnectCallStructMethod(dword_100024C08, 0x38u, v6, 0x300000uLL, 0, 0);
    }
    else
    {
      uint64_t v4 = 3758097090;
    }
    free(v6);
  }
  return v4;
}

uint64_t sub_100008D34(char *a1)
{
  __little[0] = xmmword_100018E50;
  *(_OWORD *)((char *)__little + 9) = *(long long *)((char *)&xmmword_100018E50 + 9);
  uint64_t v2 = malloc_type_malloc(0x8000uLL, 0x86C1582FuLL);
  if (v2)
  {
    uint64_t v3 = v2;
    unsigned int __big_len = -1431655766;
    if (sub_1000097E8(v2, 0x8000uLL, a1, &__big_len))
    {
      fprintf(__stderrp, "%s: readFile of %s failed (%d)");
    }
    else
    {
      unsigned int v5 = (char *)memmem(v3, __big_len, __little, 0x19uLL);
      if (v5)
      {
        if (v5 + 25 - (unsigned char *)v3 < (unint64_t)(__big_len - 64))
        {
          long long v6 = *(_OWORD *)(v5 + 41);
          __big_len_4[0] = *(_OWORD *)(v5 + 25);
          __big_len_4[1] = v6;
          long long v7 = *(_OWORD *)(v5 + 73);
          __big_len_4[2] = *(_OWORD *)(v5 + 57);
          __big_len_4[3] = v7;
          free(v3);
          return IOConnectCallStructMethod(dword_100024C08, 0x3Bu, __big_len_4, 0x40uLL, 0, 0);
        }
        fprintf(__stderrp, "%s: found sik_pub_key_prefix at bad spot in %s");
      }
      else
      {
        fprintf(__stderrp, "%s: couldn't find sik_pub_key_prefix in %s");
      }
    }
    free(v3);
  }
  else
  {
    fprintf(__stderrp, "%s: could not allocate buffer for scrt", (const char *)qword_100024C40);
  }
  fprintf(__stderrp, "%s: hilo_get_sik_pub_key failed", (const char *)qword_100024C40);
  return 3758097098;
}

uint64_t sub_100008EE8(int a1, int a2)
{
  size_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v10 = 0;
  if (sub_10000A698(&v10, &v9, 0x8000uLL, a2))
  {
    size_t v3 = v9 + 176;
    uint64_t v4 = (char *)malloc_type_malloc(v9 + 176, 0x3873A328uLL);
    unsigned int v5 = v4;
    if (v4)
    {
      uint64_t lth_transfer_attestation = hilo_get_lth_transfer_attestation(v4, v10, v9);
      if (lth_transfer_attestation)
      {
        uint64_t v7 = lth_transfer_attestation;
        fprintf(__stderrp, "%s: hilo_get_lth_transfer_attestation failed: 0x%x\n");
      }
      else if (v3 == write(a1, v5, v3))
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = 3758097084;
        fprintf(__stderrp, "%s: can't write attestation (to outfile)\n");
      }
    }
    else
    {
      uint64_t v7 = 3758097084;
      fprintf(__stderrp, "%s: malloc for attestation (%lu) failed\n");
    }
  }
  else
  {
    uint64_t v7 = 3758097084;
    fprintf(__stderrp, "%s: can't read in scrt\n", (const char *)qword_100024C40);
    unsigned int v5 = 0;
  }
  if (v10) {
    free(v10);
  }
  if (v5) {
    free(v5);
  }
  return v7;
}

uint64_t sub_100009058(int a1, int a2, int a3, int a4)
{
  BOOL v18 = 0;
  size_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0;
  int v14 = 0;
  size_t v15 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v13 = 0;
  if (sub_10000A698(&v18, &v16, 0x8000uLL, a2))
  {
    if ((sub_10000A698(&v17, &v15, 0x80B0uLL, a3) & 1) == 0) {
      fprintf(__stderrp, "%s: can't read in attestation\n", (const char *)qword_100024C40);
    }
    if ((a4 & 0x80000000) == 0 && (sub_10000A698(&v14, &v13, 0x4000uLL, a4) & 1) == 0) {
      fprintf(__stderrp, "%s: can't read in LTH transfer manifest\n", (const char *)qword_100024C40);
    }
    size_t v7 = v16 + 3145856;
    int v8 = (char *)malloc_type_malloc(v16 + 3145856, 0x941E7912uLL);
    size_t v9 = v8;
    if (v8)
    {
      uint64_t lth_transfer_message_with_manifest = hilo_get_lth_transfer_message_with_manifest(v8, v18, v16, v17, v15, (uint64_t)v14, v13);
      if (lth_transfer_message_with_manifest)
      {
        uint64_t v11 = lth_transfer_message_with_manifest;
        fprintf(__stderrp, "%s: hilo_get_lth_transfer_message_with_manifest failed: 0x%x\n");
      }
      else if (v7 == write(a1, v9, v7))
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = 3758097084;
        fprintf(__stderrp, "%s: couldn't write out LTH transfer message\n");
      }
    }
    else
    {
      uint64_t v11 = 3758097084;
      fprintf(__stderrp, "%s: malloc for message (%lu) failed\n");
    }
  }
  else
  {
    uint64_t v11 = 3758097084;
    fprintf(__stderrp, "%s: can't read in scrt\n", (const char *)qword_100024C40);
    size_t v9 = 0;
  }
  if (v18) {
    free(v18);
  }
  if (v17) {
    free(v17);
  }
  if (v9) {
    free(v9);
  }
  if (v14) {
    free(v14);
  }
  return v11;
}

uint64_t sub_100009280(int a1)
{
  size_t v3 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = 0;
  if (sub_10000A698(&v4, &v3, 0x308080uLL, a1))
  {
    uint64_t lth_transfer_message = hilo_load_lth_transfer_message(v4, v3);
  }
  else
  {
    fprintf(__stderrp, "%s: can't read in message\n", (const char *)qword_100024C40);
    uint64_t lth_transfer_message = 3758097084;
  }
  if (v4) {
    free(v4);
  }
  return lth_transfer_message;
}

uint64_t sub_100009314(int a1, int a2, int a3)
{
  size_t __nbyte = 0xAAAAAAAAAAAAAAAALL;
  __buf = 0;
  if (sub_10000A698(&__buf, &__nbyte, 0x80B0uLL, a2))
  {
    unsigned int v5 = __buf;
    if (a3 == 2)
    {
      ++*((unsigned char *)__buf + 112);
    }
    else if (a3 == 1)
    {
      ++*((unsigned char *)__buf + 48);
    }
    else
    {
      if (a3)
      {
        fprintf(__stderrp, "%s: unknown corruption type %d\n");
        goto LABEL_13;
      }
      ++*(unsigned char *)__buf;
      unsigned int v5 = __buf;
    }
    size_t v6 = __nbyte;
    if (v6 == write(a1, v5, __nbyte))
    {
      uint64_t v7 = 1;
      goto LABEL_14;
    }
    fprintf(__stderrp, "%s: couldn't write out attestation\n");
  }
  else
  {
    fprintf(__stderrp, "%s: can't read in attestation\n");
  }
LABEL_13:
  uint64_t v7 = 0;
LABEL_14:
  if (__buf) {
    free(__buf);
  }
  return v7;
}

BOOL sub_100009448(unsigned int a1)
{
  uint64_t input = a1;
  return IOConnectCallScalarMethod(dword_100024C08, 0x40u, &input, 1u, 0, 0) == 0;
}

BOOL sub_100009494()
{
  kern_return_t v0;

  if (!dword_100024C08) {
    sub_100015B90();
  }
  long long v0 = IOConnectCallScalarMethod(dword_100024C08, 0x42u, 0, 0, 0, 0);
  if (v0) {
    fprintf(__stderrp, "%s: purge system token failed: 0x%x", (const char *)qword_100024C40, v0);
  }
  return v0 == 0;
}

BOOL sub_100009514(unint64_t a1)
{
  if (!dword_100024C08) {
    sub_100015B90();
  }
  uint64_t input = string_to_handle(a1);
  return IOConnectCallScalarMethod(dword_100024C08, 0x46u, &input, 1u, 0, 0) == 0;
}

uint64_t sub_100009578(unsigned int a1, unsigned int a2)
{
  input[0] = a1;
  input[1] = a2;
  if (!dword_100024C08) {
    sub_100015B90();
  }
  return IOConnectCallScalarMethod(dword_100024C08, 0x52u, input, 2u, 0, 0);
}

BOOL sub_1000095F4(unsigned int a1, int a2, unsigned int a3)
{
  kern_return_t v3;
  kern_return_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  if (a2)
  {
    input[0] = a1;
    input[1] = a3;
    size_t v3 = IOConnectCallScalarMethod(dword_100024C08, 0x5Cu, input, 2u, 0, 0);
  }
  else
  {
    uint64_t output = 0;
    input[0] = a1;
    uint32_t outputCnt = 1;
    unsigned int v5 = IOConnectCallScalarMethod(dword_100024C08, 0x5Du, input, 1u, &output, &outputCnt);
    if (outputCnt != 1) {
      sub_100015B90();
    }
    size_t v3 = v5;
    if (!v5) {
      printf("Slot %u provisional: %d, used: %d\n", a1, output & 1, (output >> 1) & 1);
    }
  }
  return v3 == 0;
}

BOOL sub_1000096EC(int a1)
{
  uint64_t input = a1;
  return IOConnectCallScalarMethod(dword_100024C08, 5u, &input, 1u, 0, 0) == 0;
}

void sub_100009738()
{
  if (dword_100025470)
  {
    IOObjectRelease(dword_100025470);
    dword_100025470 = 0;
  }
  _exit(-1);
}

void sub_100009764(int a1, io_iterator_t iterator)
{
  io_service_t v2 = IOIteratorNext(iterator);
  if (v2)
  {
    io_object_t v3 = v2;
    if (!IOServiceOpen(v2, mach_task_self_, 0, (io_connect_t *)&dword_100024C08))
    {
      byte_100025459 = 1;
      IOObjectRelease(v3);
      uint64_t v4 = (__CFRunLoop *)qword_100025460;
      CFRunLoopStop(v4);
    }
  }
}

uint64_t sub_1000097E8(void *a1, unint64_t a2, char *a3, _DWORD *a4)
{
  if (!a1 || !a3 || !a4)
  {
    fprintf(__stderrp, "%s: invalid argument\n", a3);
    return 22;
  }
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v19.st_blksize = v8;
  *(timespec *)v19.st_qspare = v8;
  v19.st_birthtimespec = v8;
  *(timespec *)&v19.st_size = v8;
  v19.st_mtimespec = v8;
  v19.st_ctimespec = v8;
  *(timespec *)&v19.st_uid = v8;
  v19.st_atimespec = v8;
  *(timespec *)&v19.st_dev = v8;
  int v9 = open(a3, 0);
  if (v9 < 0)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = (const char *)qword_100024C40;
    int v14 = __error();
    size_t v15 = strerror(*v14);
    size_t v16 = __error();
    fprintf(v12, "%s: can't open '%s', errno: %s(%d)\n", v13, a3, v15, *v16);
    return 5;
  }
  int v10 = v9;
  if (fstat(v9, &v19) < 0)
  {
    fprintf(__stderrp, "%s: can't stat '%s'\n");
    return *__error();
  }
  if (v19.st_size < 0)
  {
    fprintf(__stderrp, "%s: unexpected file size (size %lld)", v19.st_size);
    return 22;
  }
  if (v19.st_size > a2)
  {
    fprintf(__stderrp, "%s: '%s' is too large for buffer", (const char *)qword_100024C40, a3);
    return 12;
  }
  ssize_t v17 = read(v10, a1, v19.st_size);
  if (v17 == v19.st_size)
  {
    int v18 = v17;
    uint64_t result = 0;
    *a4 = v18;
    return result;
  }
  fprintf(__stderrp, "%s: can't read '%s'\n");
  return *__error();
}

BOOL sub_1000099C0(uint64_t a1, uint64_t a2, const void *a3, size_t a4, uint32_t a5, unsigned int a6)
{
  kern_return_t v19;
  BOOL v20;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char v32;
  _OWORD v33[28];
  unint64_t v34;
  long long input;
  long long v36;

  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = v6;
  int v36 = v6;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  v33[26] = v6;
  v33[27] = v6;
  v33[24] = v6;
  v33[25] = v6;
  v33[22] = v6;
  v33[23] = v6;
  v33[20] = v6;
  v33[21] = v6;
  v33[18] = v6;
  v33[19] = v6;
  v33[16] = v6;
  v33[17] = v6;
  v33[14] = v6;
  v33[15] = v6;
  v33[12] = v6;
  v33[13] = v6;
  v33[10] = v6;
  v33[11] = v6;
  v33[8] = v6;
  v33[9] = v6;
  v33[6] = v6;
  v33[7] = v6;
  v33[4] = v6;
  v33[5] = v6;
  v33[2] = v6;
  v33[3] = v6;
  v33[0] = v6;
  v33[1] = v6;
  unsigned int v32 = -86;
  if (!a1) {
    sub_100015B90();
  }
  size_t v11 = a2;
  uint64_t v12 = (void *)a1;
  Img4DecodeInit(a1, a2, (uint64_t)v33);
  if (v13)
  {
    int v22 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v22, 2861);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016EE8();
    }
    return 0;
  }
  if (!sub_100000BF0((uint64_t)v33, (BOOL *)&v32))
  {
    uint64_t v23 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v23, 2863);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016E58();
    }
    return 0;
  }
  if (v32 != (a3 != 0))
  {
    uint64_t v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v24, 2864);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016DC8();
    }
    return 0;
  }
  if (a3)
  {
    if (v11 >= 0x2000001)
    {
      int v25 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
      printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v25, 2878);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000169D8();
      }
    }
    else
    {
      *(void *)&uint64_t input = v11 + 24;
      if (a4 > 0x40000)
      {
        int v26 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v26, 2880);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100016A68();
        }
      }
      else
      {
        *((void *)&input + 1) = a4 + 24;
        *(void *)&int v36 = 1916;
        size_t v14 = v11 + a4 + 24 + 1940;
        size_t v15 = malloc_type_malloc(v14, 0x84635430uLL);
        if (v15)
        {
          size_t v16 = v15;
          if (sub_100000FF0((uint64_t)v12, v11, v33, v15))
          {
            memcpy(v16 + 6, v12, v11);
            ssize_t v17 = (_DWORD *)((char *)v16 + v11 + 24);
            if (sub_100000D80((uint64_t)v33, (_DWORD *)((char *)v17 + a4 + 24)))
            {
              Img4DecodeInit((uint64_t)a3, a4, (uint64_t)v33);
              if (v18)
              {
                size_t v30 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v30, 2900);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100016C18();
                }
              }
              else
              {
                if (sub_100000FF0((uint64_t)a3, a4, v33, v17))
                {
                  memcpy(v17 + 6, a3, a4);
                  size_t v11 = v14;
                  uint64_t v12 = v16;
                  goto LABEL_15;
                }
                uint64_t v31 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
                printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v31, 2903);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100016B88();
                }
              }
            }
            else
            {
              int v29 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
              printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v29, 2898);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100016CA8();
              }
            }
          }
          else
          {
            int v28 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v28, 2891);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100016D38();
            }
          }
          uint64_t v20 = 0;
          uint64_t v12 = v16;
LABEL_18:
          free(v12);
          return v20;
        }
        unint64_t v27 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v27, 2887);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100016AF8();
        }
      }
    }
    return 0;
  }
  uint64_t input = v11;
  *(void *)&int v36 = 0;
LABEL_15:
  *((void *)&v36 + 1) = a6;
  stat v19 = IOConnectCallMethod(dword_100024C08, a5, (const uint64_t *)&input, 4u, v12, v11, 0, 0, 0, 0);
  uint64_t v20 = v19 == 0;
  if (v19) {
    fprintf(__stderrp, "%s: load fw returned 0x%x\n", (const char *)qword_100024C40, v19);
  }
  if (a3) {
    goto LABEL_18;
  }
  return v20;
}

uint64_t sub_100009F1C(const void *a1, size_t a2, char *a3)
{
  if (a1 && a3)
  {
    int v5 = open(a3, 1538, 288);
    if (v5 < 0)
    {
      fprintf(__stderrp, "%s: can't open '%s' for writing\n");
    }
    else
    {
      int v6 = v5;
      ssize_t v7 = write(v5, a1, a2);
      if ((v7 & 0x8000000000000000) == 0 && v7 == a2)
      {
        close(v6);
        return 0;
      }
      fprintf(__stderrp, "%s: can't write '%s'\n");
    }
    return *__error();
  }
  else
  {
    fprintf(__stderrp, "%s: invalid argument\n", (const char *)qword_100024C40);
    return 22;
  }
}

uint64_t sub_10000A01C()
{
  if (!dword_100024C08) {
    sub_100015B90();
  }
  uint64_t result = IOConnectCallMethod(dword_100024C08, 0xBu, 0, 0, 0, 0, 0, 0, 0, 0);
  if (result) {
    return fprintf(__stderrp, "%s: L4 panic notification returned 0x%x\n", (const char *)qword_100024C40, result);
  }
  return result;
}

uint64_t sub_10000A098()
{
  if (!dword_100024C08) {
    sub_100015B90();
  }
  uint64_t result = IOConnectCallMethod(dword_100024C08, 0xCu, 0, 0, 0, 0, 0, 0, 0, 0);
  if (result) {
    return fprintf(__stderrp, "%s: SEP/OS panic notification returned 0x%x\n", (const char *)qword_100024C40, result);
  }
  return result;
}

uint64_t sub_10000A114()
{
  if (!dword_100024C08) {
    sub_100015B90();
  }
  uint64_t result = IOConnectCallMethod(dword_100024C08, 0x45u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (result) {
    return fprintf(__stderrp, "%s: SEP/OS panic request returned 0x%x\n", (const char *)qword_100024C40, result);
  }
  return result;
}

uint64_t sub_10000A190(const char *a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (!v2)
  {
    fprintf(__stderrp, "%s: Warning: can't find /chosen\n", (const char *)qword_100024C40);
    return 1;
  }
  io_registry_entry_t v3 = v2;
  CFStringRef v4 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFDataRef v5 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IODeviceTree", v4, kCFAllocatorDefault, 0);
  if (!v5)
  {
    BOOL v8 = 1;
    goto LABEL_12;
  }
  CFDataRef v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 != CFDataGetTypeID())
  {
    fprintf(__stderrp, "%s: Warning: Incorrect %s property value type\n");
LABEL_10:
    BOOL v8 = 1;
    goto LABEL_11;
  }
  if (CFDataGetLength(v6) != 4)
  {
    fprintf(__stderrp, "%s: Warning: Incorrect value size for %s property\n");
    goto LABEL_10;
  }
  BOOL v8 = *(_DWORD *)CFDataGetBytePtr(v6) != 0;
LABEL_11:
  CFRelease(v6);
LABEL_12:
  IOObjectRelease(v3);
  if (v4) {
    CFRelease(v4);
  }
  return v8;
}

uint64_t sub_10000A308()
{
  kern_return_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  size_t outputStructCnt;

  if (byte_100025488) {
    return 1;
  }
  size_t outputStructCnt = 10;
  int v1 = IOConnectCallStructMethod(dword_100024C08, 0x39u, 0, 0, &dword_10002548C, &outputStructCnt);
  BOOL v0 = v1 == 0;
  if (v1)
  {
    fprintf(__stderrp, "%s: HiloGetParams failed: %d\n", (const char *)qword_100024C40, v1);
  }
  else
  {
    io_registry_entry_t v2 = 0;
    io_registry_entry_t v3 = 0;
    CFStringRef v4 = (dword_10002548C + 1) >> 1;
    if (!byte_100025494) {
      CFStringRef v4 = dword_10002548C;
    }
    dword_10002549C = unk_100025490 * dword_10002548C;
    unk_1000254A0 = v4 * unk_100025490;
    dword_100025498[0] = v4 * unk_100025490;
    do
      v3 += dword_100025498[v2++];
    while (v2 != 3);
    qword_1000254A8 = 4 * v3;
    qword_100025480 = 4 * v3 + 32;
    byte_100025488 = 1;
  }
  return v0;
}

void sub_10000A424()
{
}

void sub_10000A454(id a1, _xpc_activity_s *a2)
{
  kern_return_t v2;
  unsigned char v3[256];
  uint64_t vars8;

  if (xpc_activity_get_state(a2))
  {
    io_registry_entry_t v2 = IOConnectCallScalarMethod(dword_100024C08, 0x35u, 0, 0, 0, 0);
    if (v2) {
      sub_100016F78(v3, v2);
    }
    _xpc_transaction_exit_clean();
  }
}

uint64_t sub_10000A518()
{
  if (!dword_100024C08) {
    sub_100015B90();
  }
  size_t outputStructCnt = 2277;
  BOOL v0 = (unsigned __int8 *)malloc_type_malloc(0x8E5uLL, 0x573AD183uLL);
  if (v0)
  {
    int v1 = v0;
    if (IOConnectCallStructMethod(dword_100024C08, 0x47u, 0, 0, v0, &outputStructCnt))
    {
      fprintf(__stderrp, "%s: get endpoint info returned 0x%x\n");
    }
    else
    {
      size_t v3 = outputStructCnt / 9;
      if (outputStructCnt == 9 * (outputStructCnt / 9))
      {
        if (outputStructCnt >= 9)
        {
          CFDataRef v5 = v1 + 4;
          do
          {
            printf("Endpoint %d name '%c%c%c%c' ool_in_pages [%u,%u] ool_out_pages [%u,%u]\n", *v5, (char)*(v5 - 1), (char)*(v5 - 2), (char)*(v5 - 3), (char)*(v5 - 4), v5[1], v5[2], v5[3], v5[4]);
            v5 += 9;
            --v3;
          }
          while (v3);
        }
        uint64_t v2 = 1;
        goto LABEL_9;
      }
      fprintf(__stderrp, "%s: unexpected result size %lu\n");
    }
    uint64_t v2 = 0;
LABEL_9:
    free(v1);
    return v2;
  }
  return 0;
}

uint64_t sub_10000A698(void *a1, void *a2, unint64_t a3, int a4)
{
  uint64_t result = 0;
  if (!a1 || !a2) {
    return result;
  }
  int v9 = 0;
  uint64_t v10 = -256;
  do
  {
    if (v10 + 256 > a3)
    {
      fprintf(__stderrp, "input file too large in fd_to_buf (max size %zu)\n");
      goto LABEL_12;
    }
    size_t v11 = (char *)malloc_type_realloc(v9, v10 + 512, 0x78C34741uLL);
    if (!v11)
    {
      fprintf(__stderrp, "realloc failed in fd_to_buf for size %zu\n");
LABEL_12:
      if (!v9) {
        return 0;
      }
      goto LABEL_16;
    }
    uint64_t v12 = v11;
    ssize_t v13 = read(a4, &v11[v10 + 256], 0x100uLL);
    if (v13 == -1)
    {
      fwrite("read failed in fd_to_buf\n", 0x19uLL, 1uLL, __stderrp);
LABEL_15:
      int v9 = v12;
LABEL_16:
      free(v9);
      return 0;
    }
    v10 += 256;
    int v9 = v12;
  }
  while (v13 > 255);
  if (v13 + v10 > a3)
  {
    fprintf(__stderrp, "input file too large in fd_to_buf (max size %zu)\n", a3);
    goto LABEL_15;
  }
  *a2 = v13 + v10;
  *a1 = v12;
  bzero(&v12[v13 + v10], 256 - v13);
  return 1;
}

uint64_t sub_10000A810(BOOL *a1)
{
  if (a1)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/xART");
    io_registry_entry_t v3 = v2;
    if (v2) {
      IOObjectRelease(v2);
    }
    uint64_t result = 0;
    *a1 = v3 != 0;
  }
  else
  {
    CFDataRef v5 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v5, 158);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100016FC4();
    }
    return 22;
  }
  return result;
}

uint64_t sub_10000A8C4(BOOL *a1)
{
  if (a1)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/Sandcat");
    io_registry_entry_t v3 = v2;
    if (v2) {
      IOObjectRelease(v2);
    }
    uint64_t result = 0;
    *a1 = v3 != 0;
  }
  else
  {
    CFDataRef v5 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v5, 186);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017054();
    }
    return 22;
  }
  return result;
}

void sub_10000A978()
{
  byte_1000254B0 = 1;
}

const char *sub_10000A988()
{
  if (byte_1000254B0) {
    return "/mnt7";
  }
  else {
    return "/private/xarts";
  }
}

uint64_t sub_10000A9AC(const char *a1, unint64_t a2)
{
  v25[0] = 0x300000004;
  v25[1] = 0;
  unint64_t v26 = a2;
  uint64_t v27 = 0;
  if (a1)
  {
    unint64_t v2 = a2;
    int v4 = open(a1, 2562, 384);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v28.f_ffree = v6;
      *(_OWORD *)&v28.f_flag = v6;
      *(_OWORD *)&v28.f_bsize = v6;
      *(_OWORD *)&v28.f_blocks = v6;
      uint64_t v7 = statvfs(a1, &v28);
      if (v7)
      {
        uint64_t v12 = v7;
        uint64_t v16 = (int)v7;
        ssize_t v17 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_100019A01, v17, 291);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100017494();
        }
        int v18 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
        printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v16, (const char *)&unk_100019A01, v18, 322);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000173F0();
        }
      }
      else
      {
        vm_size_t f_frsize = vm_page_size;
        if (v28.f_frsize > vm_page_size) {
          vm_size_t f_frsize = v28.f_frsize;
        }
        if (v2 % f_frsize)
        {
          v2 += f_frsize - v2 % f_frsize;
          unint64_t v26 = v2;
        }
        uint64_t v9 = fcntl(v5, 42, v25);
        if (v9)
        {
          uint64_t v12 = v9;
          uint64_t v19 = (int)v9;
          uint64_t v20 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v19, (const char *)&unk_100019A01, v20, 329);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10001734C();
          }
        }
        else
        {
          uint64_t v10 = ftruncate(v5, v2);
          if (!v10)
          {
            int v11 = close(v5);
            if (!v11) {
              return 0;
            }
            uint64_t v23 = v11;
            uint64_t v24 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
            printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v23, (const char *)&unk_100019A01, v24, 336);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100017204();
            }
            return *__error();
          }
          uint64_t v12 = v10;
          uint64_t v21 = (int)v10;
          int v22 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
          printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", v21, (const char *)&unk_100019A01, v22, 332);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000172A8();
          }
        }
      }
      close(v5);
      return v12;
    }
    size_t v15 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v15, 318);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017174();
    }
    return *__error();
  }
  size_t v14 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v14, 315);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000170E4();
  }
  return 22;
}

uint64_t sub_10000ACE0(char *a1, size_t a2, uint64_t a3, int a4)
{
  if (!a1) {
    sub_100015B90();
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v7;
  *(_OWORD *)&out[16] = v7;
  memset(uu, 0, sizeof(uu));
  v14.tv_sec = 0;
  v14.tv_nsec = 0;
  if (gethostuuid(uu, &v14) < 0)
  {
    uint64_t v9 = __stderrp;
    uint64_t v10 = __error();
    int v11 = strerror(*v10);
    fprintf(v9, "ERR: could not get the machine's unique identifier, reason: %s\n", v11);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000175C8();
    }
    uint64_t v12 = basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
    printf("AssertMacros:(value = 0x%lx), %s file: %s, line: %d\n", 0, (const char *)&unk_100019A01, v12, 355);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017538();
    }
    return 14;
  }
  else
  {
    uuid_unparse_upper(uu, out);
    if (a4) {
      int v8 = snprintf(a1, a2, "%s/%s.gl");
    }
    else {
      int v8 = snprintf(a1, a2, "%s.gl");
    }
    if (v8 < 0)
    {
      return *__error();
    }
    else if (v8 >= (int)a2)
    {
      return 28;
    }
    else
    {
      return 0;
    }
  }
}

uint64_t sub_10000AE98(char *a1)
{
  __argv[0] = "/bin/bash";
  __argv[1] = "-c";
  __argv[2] = a1;
  __argv[3] = 0;
  pid_t v2 = -1431655766;
  int v3 = -1;
  uint64_t result = posix_spawnp(&v2, "/bin/bash", 0, 0, __argv, 0);
  if (!result)
  {
    while (waitpid(v2, &v3, 0) == -1)
      ;
    return v3;
  }
  return result;
}

uint64_t sub_10000AF3C@<X0>(void *a1@<X8>)
{
  values = @"com.apple.driver.AppleSEPManager";
  CFArrayRef v2 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  CFDictionaryRef v3 = (const __CFDictionary *)OSKextCopyLoadedKextInfo();
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, @"com.apple.driver.AppleSEPManager");
  CFRelease(v2);
  CFDataRef v5 = (const __CFData *)CFDictionaryGetValue(Value, @"OSBundleUUID");
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v6;
  *(_OWORD *)&out[16] = v6;
  BytePtr = CFDataGetBytePtr(v5);
  uuid_unparse(BytePtr, out);
  CFRelease(v3);
  unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v59 = v8;
  long long v60 = v8;
  long long v57 = v8;
  long long v58 = v8;
  long long v55 = v8;
  long long v56 = v8;
  long long v53 = v8;
  long long v54 = v8;
  long long v51 = v8;
  long long v52 = v8;
  long long v49 = v8;
  long long v50 = v8;
  v48[2] = v8;
  v48[3] = v8;
  v48[0] = v8;
  v48[1] = v8;
  long long v47 = v8;
  sub_10000B55C((uint64_t)&v47);
  uint64_t v9 = sub_10000D100(v48, (uint64_t)"/usr/local/bin/kpgo", 19);
  uint64_t v10 = sub_10000D100(v9, (uint64_t)" ", 1);
  size_t v11 = strlen(out);
  uint64_t v12 = sub_10000D100(v10, (uint64_t)out, v11);
  ssize_t v13 = sub_10000D100(v12, (uint64_t)" > ", 3);
  sub_10000D100(v13, (uint64_t)"/tmp/sep_manager_coverage.raw", 29);
  std::stringbuf::str();
  if ((SBYTE7(v33[0]) & 0x80u) == 0) {
    timespec v14 = (char *)__p;
  }
  else {
    timespec v14 = (char *)__p[0];
  }
  int v15 = sub_10000AE98(v14);
  if (SBYTE7(v33[0]) < 0) {
    operator delete(__p[0]);
  }
  if (v15)
  {
    sub_10000D100(&std::cout, (uint64_t)"kpgo failed.  Was code coverage enabled at build time? Return code was ", 71);
    uint64_t v16 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
    ssize_t v17 = std::locale::use_facet((const std::locale *)__p, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put();
    std::ostream::flush();
    sub_10000D4EC(a1, (char *)&unk_100019A01);
  }
  else
  {
    unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v44 = v21;
    long long v45 = v21;
    long long v42 = v21;
    long long v43 = v21;
    long long v40 = v21;
    long long v41 = v21;
    long long v38 = v21;
    long long v39 = v21;
    long long v36 = v21;
    long long v37 = v21;
    *(_OWORD *)unint64_t v34 = v21;
    long long v35 = v21;
    v33[2] = v21;
    v33[3] = v21;
    v33[0] = v21;
    v33[1] = v21;
    *(_OWORD *)__p = v21;
    sub_10000B55C((uint64_t)__p);
    int v22 = sub_10000D100(v33, (uint64_t)"/usr/bin/llvm-profdata", 22);
    uint64_t v23 = sub_10000D100(v22, (uint64_t)" merge -o ", 10);
    uint64_t v24 = sub_10000D100(v23, (uint64_t)"/tmp/sep_manager_coverage.profdata", 34);
    int v25 = sub_10000D100(v24, (uint64_t)" ", 1);
    sub_10000D100(v25, (uint64_t)"/tmp/sep_manager_coverage.raw", 29);
    std::stringbuf::str();
    if (v31 >= 0) {
      unint64_t v26 = (char *)&v30;
    }
    else {
      unint64_t v26 = (char *)v30;
    }
    int v27 = sub_10000AE98(v26);
    if (v31 < 0) {
      operator delete(v30);
    }
    if (v27) {
      statvfs v28 = (char *)&unk_100019A01;
    }
    else {
      statvfs v28 = "/tmp/sep_manager_coverage.profdata";
    }
    sub_10000D4EC(a1, v28);
    *(void **)((char *)__p
    *(void *)&v33[0] = v20;
    if (SHIBYTE(v35) < 0) {
      operator delete(v34[1]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    std::ios::~ios();
  }
  *(void *)&long long v47 = v18;
  *(void *)((char *)&v48[-1] + *(void *)(v18 - 24)) = v19;
  *(void *)&v48[0] = v20;
  if (SHIBYTE(v50) < 0) {
    operator delete(*((void **)&v49 + 1));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return std::ios::~ios();
}

void sub_10000B4DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::locale a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t sub_10000B55C(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  *(void *)(a1 + 8) = 0;
  CFDataRef v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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

void sub_10000B80C(_Unwind_Exception *a1)
{
}

uint64_t sub_10000B834(uint64_t a1)
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

std::string *sub_10000B96C@<X0>(std::string *__str@<X0>, std::string *a2@<X8>)
{
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    CFDataRef v5 = (std::string *)__str->__r_.__value_.__r.__words[0];
    std::string::size_type size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    std::string::size_type size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
    CFDataRef v5 = __str;
  }
  uint64_t v6 = (char *)&v5[-1].__r_.__value_.__r.__words[2] + 7;
  while (size)
  {
    int v7 = v6[size--];
    if (v7 == 47)
    {
      std::string::size_type v8 = size + 1;
      return std::string::basic_string(a2, __str, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
    }
  }
  std::string::size_type v8 = 0;
  return std::string::basic_string(a2, __str, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
}

void sub_10000B9D8(const char *a1, const char *a2)
{
  memset(&v58, 0, sizeof(v58));
  memset(__b, 170, sizeof(__b));
  sub_10000C3C4(__b);
  uint64_t v4 = embeddedtest_results_create(1);
  CFDataRef v5 = embeddedtest_test_case_result_create(1, "AppleSEPManager Code Coverage");
  uint64_t v6 = v5;
  if (__b[17])
  {
    uint64_t v36 = (uint64_t)v5;
LABEL_3:
    while (1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)__b + (unint64_t)*(__b[0] - 3)));
      int v7 = std::locale::use_facet(v40, &std::ctype<char>::id);
      unsigned __int8 v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
      std::locale::~locale(v40);
      uint64_t v9 = sub_10000D5A0(__b, (uint64_t)&v58, v8);
      if ((*((unsigned char *)v9 + *(void *)(*v9 - 24) + 32) & 5) != 0) {
        break;
      }
      int64_t size = HIBYTE(v58.__r_.__value_.__r.__words[2]);
      if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        size_t v11 = &v58;
      }
      else
      {
        int64_t size = v58.__r_.__value_.__l.__size_;
        size_t v11 = (std::string *)v58.__r_.__value_.__r.__words[0];
      }
      if (size >= 23)
      {
        uint64_t v12 = (char *)v11 + size;
        ssize_t v13 = v11;
        while (1)
        {
          timespec v14 = (char *)memchr(v13, 83, size - 22);
          if (!v14) {
            break;
          }
          if (*(void *)v14 == 0x2F73656372756F53
            && *((void *)v14 + 1) == 0x504553656C707041
            && *(void *)(v14 + 15) == 0x726567616E614D50)
          {
            if (v14 != v12 && v14 - (char *)v11 != -1)
            {
              unint64_t v57 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v55 = v17;
              long long v56 = v17;
              long long v53 = v17;
              long long v54 = v17;
              long long v51 = v17;
              long long v52 = v17;
              long long v49 = v17;
              long long v50 = v17;
              long long v47 = v17;
              long long v48 = v17;
              long long v45 = v17;
              long long v46 = v17;
              long long v43 = v17;
              long long v44 = v17;
              long long v41 = v17;
              long long v42 = v17;
              *(_OWORD *)&v40[0].__locale_ = v17;
              sub_10000C594((void (__cdecl ***)(std::basic_stringstream<char> *__hidden))v40, &v58, 24);
              memset(&__p, 0, sizeof(__p));
              sub_10000C858((uint64_t *)v40, (uint64_t)&__p);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                sub_10000CFB8(&__str, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else {
                std::string __str = __p;
              }
              sub_10000B96C(&__str, &v38);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              std::string __p = v38;
              *((unsigned char *)&v38.__r_.__value_.__s + 23) = 0;
              v38.__r_.__value_.__s.__data_[0] = 0;
              if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__str.__r_.__value_.__l.__data_);
              }
              std::istream::operator>>();
              std::istream::operator>>();
              uint64_t v18 = sub_10000D100(&std::cout, (uint64_t)"Skipping ", 9);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                p_p = &__p;
              }
              else {
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v20 = __p.__r_.__value_.__l.__size_;
              }
              long long v21 = sub_10000D100(v18, (uint64_t)p_p, v20);
              int v22 = sub_10000D100(v21, (uint64_t)" becuase it doesnt have any regions to cover", 44);
              std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(void *)(*v22 - 24)));
              uint64_t v23 = std::locale::use_facet((const std::locale *)&v38, &std::ctype<char>::id);
              ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
              std::locale::~locale((std::locale *)&v38);
              std::ostream::put();
              std::ostream::flush();
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              v40[0].__locale_ = v35;
              *(std::locale::__imp **)((char *)&v40[0].__locale_ + *((void *)v35 - 3)) = v34;
              *(void *)&long long v41 = v33;
              if (SHIBYTE(v46) < 0) {
                operator delete(*((void **)&v45 + 1));
              }
              std::streambuf::~streambuf();
              std::iostream::~basic_iostream();
              std::ios::~ios();
            }
            goto LABEL_3;
          }
          ssize_t v13 = (std::string *)(v14 + 1);
          int64_t size = v12 - (char *)v13;
          if (v12 - (char *)v13 < 23) {
            goto LABEL_3;
          }
        }
      }
    }
    uint64_t v6 = (void *)v36;
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)__b + (unint64_t)*(__b[0] - 3)), *(_DWORD *)((char *)&__b[4] + (unint64_t)*(__b[0] - 3)) | 4);
    }
    embeddedtest_test_case_result_fail(v36, "Did not see a valid file");
  }
  else
  {
    if (a1[23] < 0) {
      a1 = *(const char **)a1;
    }
    embeddedtest_test_case_result_fail((uint64_t)v5, "Unable to open %s", a1);
  }
  if (embeddedtest_test_case_result_did_pass((uint64_t)v6))
  {
    uint64_t v24 = sub_10000D100(&std::cout, (uint64_t)"Report parsing was successful.  Results will be written to ", 59);
    size_t v25 = strlen(a2);
    unint64_t v26 = sub_10000D100(v24, (uint64_t)a2, v25);
  }
  else
  {
    int v27 = sub_10000D100(&std::cout, (uint64_t)"Report parsing failed. Check ", 29);
    size_t v28 = strlen(a2);
    int v29 = sub_10000D100(v27, (uint64_t)a2, v28);
    unint64_t v26 = sub_10000D100(v29, (uint64_t)" for more detail", 16);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(void *)(*v26 - 24)));
  size_t v30 = std::locale::use_facet(v40, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
  std::locale::~locale(v40);
  std::ostream::put();
  std::ostream::flush();
  embeddedtest_results_add_test_case((uint64_t)v4, (uint64_t)v6);
  embeddedtest_test_case_result_free(v6);
  if (embeddedtest_results_save_to_file((uint64_t)v4, a2))
  {
    char v31 = sub_10000D100(&std::cout, (uint64_t)"Failed to write out the JSON file", 33);
    std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(void *)(*v31 - 24)));
    unsigned int v32 = std::locale::use_facet(v40, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
    std::locale::~locale(v40);
    std::ostream::put();
    std::ostream::flush();
  }
  embeddedtest_results_free(v4);
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v58.__r_.__value_.__l.__data_);
  }
}

void sub_10000C318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,std::locale a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,std::locale a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  sub_10000B834((uint64_t)&a36);
  sub_10000CB30(&a73);
  if (a72 < 0) {
    operator delete(*(void **)(v73 + 288));
  }
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_10000C3C4(void (__cdecl ***a1)(std::ifstream *__hidden this)))(std::ifstream *__hidden this)
{
  *a1 = v3;
  *(void *)((char *)*(v3 - 3) + (void)a1) = v2;
  a1[1] = 0;
  uint64_t v4 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v4, a1 + 2);
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (void)a1), *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_10000C55C(_Unwind_Exception *a1)
{
}

void (__cdecl ***sub_10000C594(void (__cdecl ***a1)(std::basic_stringstream<char> *__hidden this), const std::string *a2, int a3))(std::basic_stringstream<char> *__hidden this)
{
  uint64_t v6 = a1 + 2;
  uint64_t v7 = (uint64_t)(a1 + 3);
  *a1 = v9;
  *(void *)((char *)*(v9 - 3) + (void)a1) = v8;
  a1[1] = 0;
  char v10 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v10, a1 + 3);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  a1[2] = v12;
  *(void *)((char *)*(v12 - 3) + (void)v6) = v11;
  *a1 = v13;
  sub_10000D798(v7, a2, a3);
  return a1;
}

void sub_10000C830(_Unwind_Exception *a1)
{
}

uint64_t *sub_10000C858(uint64_t *a1, uint64_t a2)
{
  char v20 = -86;
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
  uint64_t v7 = std::locale::use_facet(&v19, &std::ctype<char>::id);
  std::locale::~locale(&v19);
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFF7;
  }
  while (1)
  {
    uint64_t v11 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v12 = (unsigned char *)v11[3];
    if (v12 == (unsigned char *)v11[4]) {
      break;
    }
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      int v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    timespec v14 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v15 = v14[3];
    if (v15 == v14[4]) {
      (*(void (**)(void *))(*v14 + 80))(v14);
    }
    else {
      v14[3] = v15 + 1;
    }
    if (v10 == ++v8)
    {
      int v16 = 0;
      uint64_t v8 = 1;
      goto LABEL_23;
    }
  }
  int v13 = (*(uint64_t (**)(void *))(*v11 + 72))(v11);
  if (v13 != -1) {
    goto LABEL_14;
  }
  int v16 = 2;
LABEL_23:
  uint64_t v17 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0;
  if (!v8) {
    v16 |= 4u;
  }
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(void *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_10000CA80(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  uint64_t v11 = *v9;
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v9 + *(void *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000CA3CLL);
  }
  __cxa_rethrow();
}

void sub_10000CB1C(_Unwind_Exception *a1)
{
}

void *sub_10000CB30(void *a1)
{
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return a1;
}

void sub_10000CBFC(const char *a1)
{
  memset(v36, 170, sizeof(v36));
  sub_10000AF3C(v36);
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v33 = v2;
  long long v34 = v2;
  long long v31 = v2;
  long long v32 = v2;
  long long v29 = v2;
  long long v30 = v2;
  long long v27 = v2;
  long long v28 = v2;
  long long v25 = v2;
  long long v26 = v2;
  *(_OWORD *)uint64_t v23 = v2;
  long long v24 = v2;
  v22[2] = v2;
  v22[3] = v2;
  v22[0] = v2;
  v22[1] = v2;
  long long v21 = v2;
  sub_10000B55C((uint64_t)&v21);
  uint64_t v3 = sub_10000D100(v22, (uint64_t)"/usr/bin/llvm-cov", 17);
  uint64_t v4 = sub_10000D100(v3, (uint64_t)" report ", 8);
  uint64_t v5 = sub_10000D100(v4, (uint64_t)"/System/Library/Extensions/AppleSEPManager.kext/AppleSEPManager", 63);
  uint64_t v6 = sub_10000D100(v5, (uint64_t)" -instr-profile=", 16);
  if (SHIBYTE(v36[2]) >= 0) {
    uint64_t v7 = v36;
  }
  else {
    uint64_t v7 = (void **)v36[0];
  }
  if (SHIBYTE(v36[2]) >= 0) {
    uint64_t v8 = HIBYTE(v36[2]);
  }
  else {
    uint64_t v8 = (uint64_t)v36[1];
  }
  uint64_t v9 = sub_10000D100(v6, (uint64_t)v7, v8);
  uint64_t v10 = sub_10000D100(v9, (uint64_t)" -arch arm64 > ", 15);
  sub_10000D100(v10, (uint64_t)"/tmp/sep_manager_report.txt", 27);
  std::stringbuf::str();
  if (v20 >= 0) {
    locale = (char *)&v19;
  }
  else {
    locale = (char *)v19.__locale_;
  }
  int v12 = sub_10000AE98(locale);
  int v13 = v12;
  if (v20 < 0)
  {
    operator delete(v19.__locale_);
    if (v13) {
      goto LABEL_12;
    }
  }
  else if (v12)
  {
LABEL_12:
    sub_10000D100(&std::cout, (uint64_t)"llvm-cov report failed. Return code was ", 40);
    timespec v14 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(void *)(*v14 - 24)));
    uint64_t v15 = std::locale::use_facet(&v19, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
    std::locale::~locale(&v19);
    std::ostream::put();
    std::ostream::flush();
    goto LABEL_16;
  }
  sub_10000D4EC(__p, "/tmp/sep_manager_report.txt");
  sub_10000B9D8((const char *)__p, a1);
  if (v18 < 0) {
    operator delete(__p[0]);
  }
LABEL_16:
  *(void *)((char *)&v22[-1]
  *(void *)&v22[0] = v16;
  if (SHIBYTE(v24) < 0) {
    operator delete(v23[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  if (SHIBYTE(v36[2]) < 0) {
    operator delete(v36[0]);
  }
}

void sub_10000CF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_10000B834((uint64_t)&a21);
  if (*(char *)(v21 - 49) < 0) {
    operator delete(*(void **)(v21 - 72));
  }
  _Unwind_Resume(a1);
}

void sub_10000CFA4(void *a1)
{
}

void *sub_10000CFB8(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_10000D058();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
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

void sub_10000D058()
{
}

void sub_10000D070(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000D0CC(exception, a1);
}

void sub_10000D0B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000D0CC(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000D100(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
  uint64_t v7 = *(void *)(v6 + 40);
  int v8 = *(_DWORD *)(v6 + 8);
  int v9 = *(_DWORD *)(v6 + 144);
  if (v9 == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v10 = std::locale::use_facet(&v13, &std::ctype<char>::id);
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
  if (!sub_10000D2AC(v7, a2, v11, a2 + a3, v6, (char)v9)) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_10000D244(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x10000D224);
}

void sub_10000D298(_Unwind_Exception *a1)
{
}

uint64_t sub_10000D2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      memset(__p, 170, sizeof(__p));
      sub_10000D440(__p, v12, __c);
      std::locale v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0) {
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

void sub_10000D424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000D440(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000D058();
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

void *sub_10000D4EC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000D058();
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

void *sub_10000D5A0(void *a1, uint64_t a2, unsigned __int8 a3)
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
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      void v7[3] = v8 + 1;
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

void sub_10000D708(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000D6C8);
  }
  __cxa_rethrow();
}

void sub_10000D784(_Unwind_Exception *a1)
{
}

uint64_t sub_10000D798(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_10000D838(a1);
  return a1;
}

void sub_10000D814(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void sub_10000D838(uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    size_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    size_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        size_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

unint64_t string_to_handle(unint64_t result)
{
  if (result)
  {
    uint64_t v1 = (unsigned char *)result;
    LODWORD(result) = 0;
    int v2 = 4;
    do
    {
      int v3 = *v1;
      if (*v1) {
        ++v1;
      }
      if (v3) {
        char v4 = v3;
      }
      else {
        char v4 = 32;
      }
      uint64_t result = ((result << 8) + v4);
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sepTesting(int a1, FILE *a2, unsigned int a3, unsigned int a4, FILE *a5, unsigned int a6, unsigned int a7, unsigned char *a8)
{
  kern_return_t v30;
  __int16 v31;
  uint32_t v32;
  char __s2[5];
  char v34[5];
  uint32_t outputCnt[2];
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t input[2];
  uint64_t output;
  uint64_t vars8;

  switch(a1)
  {
    case 1:
      if ((unint64_t)a2 | (unint64_t)a5)
      {
        fwrite("Test data can only be passed in or out of a single test\n", 0x38uLL, 1uLL, __stderrp);
        return 0;
      }
      input[0] = 0;
      outputCnt[0] = 1;
      outputStruct = malloc_type_malloc(0x100000uLL, 0x55D405E9uLL);
      uint64_t output = 0x100000;
      if (IOConnectCallMethod(dword_100024C08, 0x1Bu, 0, 0, 0, 0, input, outputCnt, outputStruct, &output))
      {
        if (outputStruct) {
          free(outputStruct);
        }
        printf("IOKit returned %x for kSEP_RunAll\n");
        return 0;
      }
      if (!output) {
        return 0;
      }
      sub_10000E95C((uint64_t)outputStruct, input[0], 0);
      if (outputStruct)
      {
        long long v24 = outputStruct;
        goto LABEL_43;
      }
      return 1;
    case 3:
      if (!a6)
      {
        if (!a8) {
          sub_100015B90();
        }
        sub_10000E080(0);
        LOBYTE(outputCnt[0]) = HIBYTE(a7);
        BYTE1(outputCnt[0]) = BYTE2(a7);
        BYTE2(outputCnt[0]) = BYTE1(a7);
        HIBYTE(outputCnt[0]) = a7;
        LOBYTE(outputCnt[1]) = 0;
        if (sub_10000E82C((const char *)outputCnt))
        {
          uint64_t v23 = malloc_type_malloc(0x100000uLL, 0xF4F6A415uLL);
          input[0] = 0x100000;
          uint64_t output = a7;
          if (IOConnectCallMethod(dword_100024C08, 0x1Cu, &output, 1u, 0, 0, 0, 0, v23, input))
          {
            if (v23) {
              free(v23);
            }
            printf("IOKit returned %x for kSEP_RunCat\n");
            return 0;
          }
          if (input[0])
          {
            BOOL v21 = 1;
            sub_10000E95C((uint64_t)v23, 1, a8);
            if (v23)
            {
              long long v24 = v23;
LABEL_43:
              free(v24);
              return 1;
            }
            return v21;
          }
        }
        else
        {
          printf("%s does not appear to be a supported test category\n", (const char *)outputCnt);
          sub_10000E8A8();
          printf("Categories Found: %s\n");
        }
        return 0;
      }
      if (!a8) {
        sub_100015B90();
      }
      sub_10000E080(1);
      v34[0] = HIBYTE(a7);
      v34[1] = BYTE2(a7);
      v34[2] = BYTE1(a7);
      v34[3] = a7;
      v34[4] = 0;
      __s2[0] = HIBYTE(a6);
      __s2[1] = BYTE2(a6);
      __s2[2] = BYTE1(a6);
      __s2[3] = a6;
      __s2[4] = 0;
      uint64_t v14 = sub_10000E82C(v34);
      if (!v14)
      {
        sub_10000E8A8();
        printf("%s does not appear to be a supported test category\nCategories Found: %s\n");
        return 0;
      }
      LODWORD(input[0]) = 0;
      uint64_t test_cases = embeddedtest_test_suite_get_test_cases(v14, input);
      if (!LODWORD(input[0])) {
        goto LABEL_37;
      }
      uint64_t v16 = test_cases;
      uint64_t v17 = 0;
      while (1)
      {
        uint64_t v18 = *(void *)(v16 + 8 * v17);
        name = (const char *)embeddedtest_test_case_get_name(v18);
        if (!strcmp(name, __s2)) {
          break;
        }
        if (++v17 >= (unint64_t)LODWORD(input[0])) {
          goto LABEL_37;
        }
      }
      if (!v18)
      {
LABEL_37:
        printf("%s/%s does not appear to be a supported test category\n");
        return 0;
      }
      if ((embeddedtest_test_case_get_flags(v18) & 2) != 0)
      {
        input[0] = a3;
        fseeko(a2, 0, 2);
        unint64_t v25 = ftello(a2);
        fseeko(a2, 0, 0);
        if (v25 <= 0x100000)
        {
          uint64_t output = 0xAAAAAAAAAAAAAAAALL;
          long long v26 = malloc_type_malloc(v25, 0x5828E931uLL);
          if (fread(v26, 1uLL, v25, a2) == v25)
          {
            outputCnt[0] = 1;
            IOConnectCallMethod(dword_100024C08, 0x16u, input, 1u, v26, v25, &output, outputCnt, 0, 0);
          }
          else
          {
            fwrite("Failed to read input data file\n", 0x1FuLL, 1uLL, __stderrp);
          }
          if (v26) {
            free(v26);
          }
        }
        else
        {
          fwrite("Test data input too big\n", 0x18uLL, 1uLL, __stderrp);
        }
      }
      input[0] = a7;
      input[1] = a6;
      std::string v38 = 0;
      long long v32 = 1;
      if (IOConnectCallMethod(dword_100024C08, 0x1Du, input, 2u, 0, 0, &v38, &v32, 0, 0))
      {
        printf("IOKit returned %x for kSEP_RunHandle\n");
        return 0;
      }
      if ((embeddedtest_test_case_get_flags(v18) & 4) != 0)
      {
        uint64_t output = 0xAAAAAAAAAAAAAAAALL;
        long long v27 = malloc_type_malloc(0x100000uLL, 0xCFE4D483uLL);
        *(void *)uint32_t outputCnt = 0x100000;
        uint64_t v36 = 1;
        if (!IOConnectCallMethod(dword_100024C08, 0x17u, &v37, 0, 0, 0, &output, &v36, v27, (size_t *)outputCnt))
        {
          size_t v28 = fwrite(v27, 1uLL, *(size_t *)outputCnt, a5);
          if (v28 != *(void *)outputCnt) {
            fwrite("Failed to write output data file\n", 0x21uLL, 1uLL, __stderrp);
          }
        }
        if (v27) {
          free(v27);
        }
      }
      long long v29 = malloc_type_malloc(0x100000uLL, 0x146BF633uLL);
      uint64_t output = 0x100000;
      long long v30 = IOConnectCallMethod(dword_100024C08, 0x1Eu, 0, 0, 0, 0, 0, 0, v29, &output);
      BOOL v21 = v30 == 0;
      if (v30)
      {
        long long v31 = v30;
        if (v29) {
          free(v29);
        }
        printf("IOKit returned %x for kSEP_GetResult\n", v31 & 0x3FFF);
      }
      else
      {
        sub_10000E95C((uint64_t)v29, 1, a8);
        if (v29) {
          free(v29);
        }
      }
      return v21;
    case 4:
      return sub_10000E080(1);
    case 5:
      if (!a4) {
        return 0;
      }
      input[0] = a4;
      return IOConnectCallScalarMethod(dword_100024C08, 0x19u, input, 1u, 0, 0) == 0;
    default:
      fprintf(__stderrp, "Unsupported testing command (cmd=%d)\n", a1);
      return 0;
  }
}

uint64_t sub_10000E080(uint64_t a1)
{
  kern_return_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int size;
  const char *name;
  uint64_t test_cases;
  uint64_t v18;
  unint64_t i;
  uint64_t v20;
  int flags;
  uint64_t v22;
  const char *v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  size_t v30;
  uint32_t outputCnt;
  int v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  unsigned char v39[28];
  uint64_t output;

  int v2 = &unk_100025000;
  uint64_t result = 1;
  if (!qword_1000254C0)
  {
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    uint32_t outputCnt = 1;
    outputStruct = malloc_type_malloc(0x100000uLL, 0xB435E88EuLL);
    long long v30 = 0x100000;
    unint64_t v5 = IOConnectCallMethod(dword_100024C08, 0x1Au, 0, 0, 0, 0, &output, &outputCnt, outputStruct, &v30);
    if (v5)
    {
      int v6 = v5;
      if (outputStruct) {
        free(outputStruct);
      }
      printf("IOKit returned %x for kSEP_QueryTests\n", v6 & 0x3FFF);
      return 0;
    }
    if (!v30)
    {
      fwrite("kSEP_QueryTests returned test_suites_size of 0!\n", 0x30uLL, 1uLL, __stderrp);
      return 0;
    }
    std::string::size_type v7 = output;
    qword_1000254B8 = output;
    if (qword_1000254C0) {
      free((void *)qword_1000254C0);
    }
    qword_1000254C0 = (uint64_t)malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
    if (!qword_1000254C0) {
      sub_10000EA90();
    }
    if (qword_1000254B8)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      unint64_t v25 = a1;
      long long v24 = outputStruct;
      do
      {
        long long v27 = v9;
        unint64_t v10 = (uint64_t)outputStruct + v9;
        uint64_t v11 = outputStruct;
        int64_t v12 = a1;
        std::locale v13 = v8;
        uint64_t v14 = embeddedtest_test_suite_create_from_resume_data(v10);
        size_t v28 = v13;
        *(void *)(v2[152] + 8 * v13) = v14;
        a1 = v12;
        outputStruct = v11;
        int64_t size = embeddedtest_test_suite_get_size((uint64_t)v14);
        if (a1)
        {
          long long v26 = size;
          name = (const char *)embeddedtest_test_suite_get_name((uint64_t)v14);
          printf("Category %s\n", name);
          long long v29 = 0;
          uint64_t test_cases = embeddedtest_test_suite_get_test_cases((uint64_t)v14, &v29);
          if (v29)
          {
            uint64_t v18 = test_cases;
            for (unint64_t i = 0; i < v29; ++i)
            {
              char v20 = *(void *)(v18 + 8 * i);
              flags = embeddedtest_test_case_get_flags(v20);
              int v22 = 0;
              std::string v38 = 0u;
              memset(v39, 0, sizeof(v39));
              uint64_t v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              unint64_t v35 = 0u;
              long long v33 = 0u;
              long long v32 = 1701736270;
              do
              {
                if ((testing_flag_enum[v22] & flags) != 0)
                {
                  if (v32 ^ 0x656E6F4E | v33)
                  {
                    __strcat_chk();
                    __strcat_chk();
                  }
                  else
                  {
                    __strcpy_chk();
                  }
                }
                ++v22;
              }
              while (v22 != 4);
              uint64_t v23 = (const char *)embeddedtest_test_case_get_name(v20);
              printf("\t%s (Flags: %s)\n", v23, (const char *)&v32);
            }
          }
          a1 = v25;
          int64_t size = v26;
          int v2 = (void *)&unk_100025000;
          outputStruct = v24;
        }
        uint64_t v9 = v27 + size;
        uint64_t v8 = v28 + 1;
      }
      while (v28 + 1 < (unint64_t)qword_1000254B8);
    }
    if (outputStruct) {
      free(outputStruct);
    }
    return 1;
  }
  return result;
}

uint64_t sepDebugVar(int a1, unsigned char *a2, void *inputStruct, int64_t a4)
{
  if (a2)
  {
    LODWORD(v6) = 0;
    int v7 = 4;
    do
    {
      int v8 = *a2;
      if (*a2) {
        ++a2;
      }
      if (v8) {
        char v9 = v8;
      }
      else {
        char v9 = 32;
      }
      uint64_t v6 = ((v6 << 8) + v9);
      --v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (a1 == 8)
  {
    int v22 = -1431655766;
    char v21 = -86;
    puts("Retrieving old value: ");
    uint64_t v11 = sub_10000E678(v6, inputStruct, &v22, &v21);
    if (v11)
    {
      uint64_t v10 = v11;
      int64_t v12 = __stderrp;
      std::locale v13 = "Failed to get debug variable\n";
      size_t v14 = 29;
LABEL_24:
      fwrite(v13, v14, 1uLL, v12);
      return v10;
    }
    int v16 = v22 - 1;
    if ((v22 - 1) >= 8 || ((0x8Bu >> v16) & 1) == 0)
    {
      uint64_t v10 = 3758097090;
      int64_t v12 = __stderrp;
      std::locale v13 = "Width is invalid";
      size_t v14 = 16;
      goto LABEL_24;
    }
    uint64_t v17 = v16;
    if (v21 == 1)
    {
      int64_t v18 = qword_100018F10[v16];
      int64_t v19 = qword_100018ED0[v17];
      if (v19 <= a4 && v18 >= a4)
      {
LABEL_35:
        input[0] = v6;
        input[1] = a4;
        uint64_t v10 = IOConnectCallMethod(dword_100024C08, 0x4Cu, input, 2u, inputStruct, 0x1CuLL, 0, 0, 0, 0);
        if (!v10) {
          puts("Successfully set new variable value");
        }
        return v10;
      }
    }
    else
    {
      int64_t v18 = qword_100018F50[v16];
      if (v18 >= (unint64_t)a4) {
        goto LABEL_35;
      }
      int64_t v19 = 0;
    }
    uint64_t v10 = 3758097090;
    printf("New value is out of range of debug variable [%lld, %lld]\n", v19, v18);
    return v10;
  }
  if (a1 != 7)
  {
    if (a1 == 6)
    {
      input[0] = v6;
      return IOConnectCallMethod(dword_100024C08, 0x4Au, input, 1u, 0, 0, 0, 0, 0, 0);
    }
    else
    {
      uint64_t v10 = 3758097090;
      fprintf(__stderrp, "Unsupported debug var command (cmd=%d)\n", a1);
    }
    return v10;
  }

  return sub_10000E678(v6, inputStruct, 0, 0);
}

uint64_t sub_10000E678(uint64_t a1, void *inputStruct, _DWORD *a3, unsigned char *a4)
{
  uint64_t v13 = 0;
  uint64_t input = a1;
  uint64_t output = 0;
  uint64_t v12 = 0;
  uint32_t outputCnt = 3;
  uint64_t v6 = IOConnectCallMethod(dword_100024C08, 0x4Bu, &input, 1u, inputStruct, 0x1CuLL, &output, &outputCnt, 0, 0);
  if (!v6)
  {
    int v7 = v12;
    char v8 = v13;
    switch((int)v12)
    {
      case 1:
      case 2:
      case 4:
        if (v13 != 1) {
          goto LABEL_9;
        }
        printf("%d");
        break;
      case 8:
        if (v13 == 1) {
          printf("%lld");
        }
        else {
LABEL_9:
        }
          printf("0x%llx");
        break;
      default:
        fwrite("Width is invalid", 0x10uLL, 1uLL, __stderrp);
        break;
    }
    putchar(10);
    if (a3) {
      *a3 = v7;
    }
    if (a4) {
      *a4 = v8;
    }
  }
  return v6;
}

uint64_t sub_10000E82C(const char *a1)
{
  if (!qword_1000254B8) {
    return 0;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = *(void *)(qword_1000254C0 + 8 * v2);
    name = (const char *)embeddedtest_test_suite_get_name(v3);
    if (!strcmp(a1, name)) {
      break;
    }
    if (++v2 >= (unint64_t)qword_1000254B8) {
      return 0;
    }
  }
  return v3;
}

char *sub_10000E8A8()
{
  uint64_t v0 = 3 * qword_1000254B8;
  uint64_t v1 = (char *)malloc_type_calloc((6 * qword_1000254B8) | 1, 1uLL, 0x100004077774924uLL);
  if (qword_1000254B8)
  {
    unint64_t v2 = 0;
    size_t v3 = 2 * v0;
    do
    {
      name = (const char *)embeddedtest_test_suite_get_name(*(void *)(qword_1000254C0 + 8 * v2));
      unint64_t v5 = strncat(v1, name, v3);
      strncat(v5, ", ", v3);
      ++v2;
    }
    while (v2 < qword_1000254B8);
  }
  return v1;
}

void sub_10000E95C(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (a3) {
    *a3 = 1;
  }
  if (a2)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      char v8 = embeddedtest_results_create_from_resume_data(a1 + v7);
      v7 += embeddedtest_results_get_size((uint64_t)v8);
      embeddedtest_results_test_case_print((uint64_t)v8);
      uint64_t name = embeddedtest_results_get_name((uint64_t)v8);
      uint64_t v10 = (const char *)name;
      LODWORD(v11) = 4;
      do
      {
        uint64_t v11 = (v11 - 1);
        if (*(unsigned char *)(name + v11) != 32) {
          break;
        }
        *(unsigned char *)(name + v11) = 0;
      }
      while (v11 > 1);
      if (embeddedtest_results_did_pass((uint64_t)v8))
      {
        printf("[PASS] %s\n", v10);
      }
      else
      {
        printf("[FAIL] %s\n", v10);
        if (a3) {
          *a3 = 0;
        }
      }
      uint64_t v12 = (char *)0xAAAAAAAAAAAAAAAALL;
      asprintf(&v12, "/tmp/%s_test_results.json", v10);
      embeddedtest_results_save_to_file((uint64_t)v8, v12);
      if (v12) {
        free(v12);
      }
      embeddedtest_results_free(v8);
      ++v6;
    }
    while (v6 != a2);
  }
}

void sub_10000EA90()
{
}

uint64_t hilo_get_lth_transfer_attestation(char *outputStruct, const void *a2, size_t a3)
{
  uint64_t v3 = 3758097090;
  if (outputStruct && a2)
  {
    if (byte_1000254CC == 1)
    {
      mach_port_t v7 = dword_1000254C8;
    }
    else
    {
      mach_port_t v7 = sep_connect();
      dword_1000254C8 = v7;
      if (!v7) {
        return 3758097098;
      }
      byte_1000254CC = 1;
    }
    size_t outputStructCnt = 176;
    uint64_t v3 = IOConnectCallStructMethod(v7, 0x3Cu, 0, 0, outputStruct, &outputStructCnt);
    if (!v3) {
      memcpy(outputStruct + 176, a2, a3);
    }
  }
  return v3;
}

uint64_t hilo_get_lth_transfer_message_with_manifest(char *outputStruct, const void *a2, size_t a3, void *inputStruct, size_t inputStructCnt, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = 3758097090;
  if (outputStruct && a2 && inputStruct)
  {
    if (byte_1000254CC == 1)
    {
      mach_port_t v15 = dword_1000254C8;
    }
    else
    {
      mach_port_t v15 = sep_connect();
      dword_1000254C8 = v15;
      if (!v15) {
        return 3758097098;
      }
      byte_1000254CC = 1;
    }
    size_t v17 = 3145856;
    input[0] = a6;
    input[1] = a7;
    uint64_t v7 = IOConnectCallMethod(v15, 0x3Du, input, 2u, inputStruct, inputStructCnt, 0, 0, outputStruct, &v17);
    if (!v7) {
      memcpy(outputStruct + 3145856, a2, a3);
    }
  }
  return v7;
}

uint64_t hilo_load_lth_transfer_message(void *inputStruct, size_t inputStructCnt)
{
  uint64_t v2 = 3758097090;
  if (!inputStruct) {
    return v2;
  }
  if (byte_1000254CC != 1)
  {
    mach_port_t v5 = sep_connect();
    dword_1000254C8 = v5;
    if (v5)
    {
      byte_1000254CC = 1;
      goto LABEL_6;
    }
    return 3758097098;
  }
  mach_port_t v5 = dword_1000254C8;
LABEL_6:

  return IOConnectCallStructMethod(v5, 0x3Eu, inputStruct, inputStructCnt, 0, 0);
}

uint64_t hilo_advance_gain_restriction_phase()
{
  if (byte_1000254CC == 1)
  {
    mach_port_t v0 = dword_1000254C8;
  }
  else
  {
    mach_port_t v0 = sep_connect();
    dword_1000254C8 = v0;
    if (!v0) {
      return 3758097098;
    }
    byte_1000254CC = 1;
  }

  return IOConnectCallScalarMethod(v0, 0x3Fu, 0, 0, 0, 0);
}

uint64_t sep_connect()
{
  mach_port_t mainPort = -1431655766;
  io_connect_t connect = 0;
  if (IOMasterPort(0, &mainPort))
  {
    fprintf(__stderrp, "%s: could not get master port\n");
  }
  else
  {
    CFDictionaryRef v1 = IOServiceMatching("AppleSEPManager");
    if (v1)
    {
      io_service_t MatchingService = IOServiceGetMatchingService(mainPort, v1);
      if (MatchingService)
      {
        if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
          return connect;
        }
        fprintf(__stderrp, "%s could not open SEP service, IOServiceOpen returned %d\n");
      }
      else
      {
        fprintf(__stderrp, "%s: could not find SEP service\n");
      }
    }
    else
    {
      fprintf(__stderrp, "%s: could not make matching dictionary for '%s'\n");
    }
  }
  return 0;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  char v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  mach_port_t v5 = &v4[v3];
  uint64_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    uint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      size_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          size_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    uint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  memset(v8, 170, sizeof(v8));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  memset(v12, 170, sizeof(v12));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    long long v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6)) {
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_10000FD90(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_10000FD90(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      long long v13 = 0uLL;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!result)
      {
        if (v9 != 0x2000000000000010) {
          return 2;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if (result) {
          return result;
        }
        if (v14 != 22) {
          return 2;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if (result) {
          return result;
        }
        if ((v8 | 0xE000000000000000) != a2) {
          return 2;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result != 1) {
          return 2;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  long long v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7)) {
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
  }
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_10001018C(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  unint64_t v15 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010) {
            return 2;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if (result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                uint64_t result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 6;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!result) {
        *a2 = (void)v8 != 0;
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0uLL;
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        long long v19 = 0uLL;
        long long v20 = 0uLL;
        long long v17 = 0uLL;
        long long v18 = 0uLL;
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        long long v13 = 0uLL;
        long long v14 = 0uLL;
        long long v11 = 0uLL;
        long long v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) == 1)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t result = 6;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!result)
    {
      if (*((void *)&v14 + 1) == 4)
      {
        uint64_t result = 0;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      uint64_t result = 2;
    }
    int v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void sub_100010948(void *a1, _OWORD *a2)
{
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v19 = 0;
  long long v18 = 0uLL;
  size_t __n = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __s1 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s2 = 0uLL;
  long long v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17)) {
        return;
      }
      uint64_t v4 = (long long *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          long long v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9)) {
              return;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }
            else if (*((void *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001 || v6 != 1) {
                return;
              }
              int v6 = 0;
            }
            if (v6) {
              return;
            }
          }
          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50:
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  if (!a3) {
    return 6;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if (result == 1) {
        return 0;
      }
      if (result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if (result) {
        return result;
      }
      uint64_t result = 2;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if (result) {
        return result;
      }
    }
    return 7;
  }
  return result;
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_100010DD4(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  long long v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(unsigned char *)(a2 + 1) = 1;
                      long long v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (unint64_t v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(void *)(a2 + 296), *(void *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(void **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(void, void, uint64_t))a4)(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(void *)(a2 + 280), *(void *)(a2 + 288), a2 + 376,
                               **(void **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        int v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        uint64_t v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000;
                        uint64_t v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6)) {
                            return;
                          }
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184, **(void **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(unsigned char *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_100011080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v18[2] = 0;
  v18[3] = 0;
  unint64_t v6 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  long long v8 = (unint64_t *)((char *)v17 - v7);
  bzero((char *)v17 - v7, v7);
  unint64_t *v8 = v6;
  uint64_t v9 = *(unsigned int *)(a1 + 8);
  v18[0] = *(void *)a1;
  v18[1] = v9;
  memset(v17, 0, sizeof(v17));
  uint64_t result = DERParseSequenceToObject((uint64_t)v18, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v17, 0x20uLL, 0x20uLL);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v11 = *((void *)&v17[0] + 1);
  for (unint64_t i = *(unsigned char **)&v17[0]; v11; --v11)
  {
    if (*i) {
      break;
    }
    if (i == (unsigned char *)-1) {
      __break(0x5513u);
    }
    ++i;
  }
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  unint64_t v13 = (v11 + 7) >> 3;
  if (v13 > *v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t *v8 = v13;
  if (ccrsa_make_pub()) {
    return 0xFFFFFFFFLL;
  }
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v14 = &CCRSA_PKCS1_FAULT_CANARY == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    int v16 = ccrsa_verify_pkcs1v15_digest();
    if (!v16 && !cc_cmp_safe()) {
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v17[0]) = 0;
  int v15 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v15 && LOBYTE(v17[0])) {
    return 0;
  }
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_100011080((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 4096);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!sub_100011A9C(v26, (uint64_t)v27, 3u)
          && !sub_100011614((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          unint64_t v24 = a6;
          uint64_t v15 = 0;
          int v16 = (const void **)v32;
          uint64_t v17 = &v30;
          unint64_t v18 = (const void **)v32;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = sub_10001187C(&v34[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              long long v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              unint64_t v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42)) {
                return 0xFFFFFFFFLL;
              }
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                unint64_t v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                long long v43 = 0u;
                long long v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  long long v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&off_100020710, (uint64_t)&v25);
                  if (!result) {
                    return 0xFFFFFFFFLL;
                  }
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  if (!v38) {
                    return 0;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0;
                  }
                  uint64_t result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0;
                      *a5 = v38;
                      *unint64_t v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_100011614(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2 || *(unsigned char *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1) {
        break;
      }
      if (*(unsigned char *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if (result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = sub_100011B78(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10001187C(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  long long v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2 || *(unsigned char *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(unsigned char *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(void *)(a3 + 40))) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)(*a2, a2[1], v13, **(void **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(void **)(a3 + 32), a3, 0);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (uint64_t v9 = (void *)v8[2]) != 0 && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_100011A9C(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    if (v5 < 16 * (unint64_t)v6) {
      break;
    }
    unint64_t v14 = (unint64_t *)(a2 + 16 * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0;
      }
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_100011B78(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  uint64_t v10 = 0;
  unint64_t v8 = 0;
  v9[0] = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(a1 + 152)) {
    return 0;
  }
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011) {
        return 0xFFFFFFFFLL;
      }
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t SEPART_decode(uint64_t *a1, void *a2, void *a3, uint64_t *a4, uint64_t a5)
{
  if (!a5) {
    return 0;
  }
  ccder_decode_sequence_tl();
  *a1 = ccder_decode_uint64();
  uint64_t result = ccder_decode_sequence_tl();
  if (result)
  {
    *a2 = 0;
    *a3 = 0;
    uint64_t v10 = ccder_decode_tl();
    *a4 = v10;
    return v10 + *a3;
  }
  return result;
}

uint64_t SEPARTExtract(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  return SEPART_decode(a3, a4, &v6, &v5, a1);
}

uint64_t SEPARTPayloadDecode(uint64_t a1, void *a2, uint64_t *a3, void *a4, uint64_t *a5, void *a6, uint64_t *a7, uint64_t *a8, void *a9, uint64_t a10, uint64_t a11)
{
  if (!a10) {
    return 0;
  }
  ccder_decode_sequence_tl();
  uint64_t result = 0;
  if (!a11)
  {
    ccder_decode_uint64();
    sub_100011F14(a2, a3);
    sub_100011F14(a4, a5);
    uint64_t v19 = sub_100011F14(a6, a7);
    ccder_decode_constructed_tl();
    if (a9) {
      *a9 = 0;
    }
    if (a8) {
      *a8 = v19;
    }
    return 0;
  }
  return result;
}

uint64_t sub_100011F14(void *a1, uint64_t *a2)
{
  uint64_t result = ccder_decode_tl();
  if (result)
  {
    if (a1) {
      *a1 = 0;
    }
    if (a2) {
      *a2 = result;
    }
  }
  return result;
}

uint64_t SEPARTCounterFind()
{
  return 0;
}

double *embeddedtest_test_case_statistic_metric_create(const char *a1, double a2)
{
  if (a1)
  {
    int v4 = (double *)malloc_type_calloc(1uLL, 0x38uLL, 0x1010040D5418A94uLL);
    if (!v4) {
      sub_100017654();
    }
    uint64_t v5 = v4;
    uint64_t v6 = strdup(a1);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100017690();
    }
    v5[1] = a2;
    v5[2] = a2;
    v5[3] = a2;
    v5[4] = a2;
    v5[5] = 0.0;
    *((_DWORD *)v5 + 12) = 1;
  }
  else
  {
    puts("Unable to create test case statistic metric with a null name");
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_statistic_metric_free(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }
}

uint64_t embeddedtest_test_case_statistic_metric_get_name(uint64_t a1)
{
  return *(void *)a1;
}

void *embeddedtest_test_case_statistic_metric_copy_json_representation(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0;
  embeddedtest_asprintf(&v9, "{\"Name\":\"%s\",\"Max\":%f,\"Min\":%f,\"Mean\":%f,\"StdDev\":%f,\"Count\":%d}", a3, a4, a5, a6, a7, a8, *a1);
  return v9;
}

uint64_t embeddedtest_test_case_statistic_metric_merge(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 48);
  unsigned int v3 = *(_DWORD *)(a2 + 48);
  double v4 = *(double *)(a1 + 32) + *(double *)(a2 + 32);
  double v5 = v4 / (double)(v3 + v2);
  double v6 = sqrt((*(double *)(a2 + 40) * *(double *)(a2 + 40) * (double)v3+ (double)v2 * (*(double *)(a1 + 40) * *(double *)(a1 + 40))+ (*(double *)(a2 + 24) - v5) * (*(double *)(a2 + 24) - v5) * (double)v3+ (double)v2 * ((*(double *)(a1 + 24) - v5) * (*(double *)(a1 + 24) - v5)))/ (double)(v3 + v2));
  *(double *)(a1 + 32) = v4;
  *(double *)(a1 + 40) = v6;
  *(_DWORD *)(a1 + 48) = v3 + v2;
  *(double *)(a1 + 24) = v5;
  v7.f64[0] = *(float64_t *)(a1 + 8);
  v7.f64[1] = *(float64_t *)(a2 + 16);
  v8.f64[0] = *(float64_t *)(a2 + 8);
  v8.f64[1] = *(float64_t *)(a1 + 16);
  *(int8x16_t *)(a1 + 8) = vbslq_s8((int8x16_t)vcgeq_f64(v7, v8), *(int8x16_t *)(a1 + 8), *(int8x16_t *)(a2 + 8));
  return 0;
}

__n128 embeddedtest_test_case_statistic_metric_copy(uint64_t a1)
{
  if (a1)
  {
    unsigned int v2 = embeddedtest_test_case_statistic_metric_create(*(const char **)a1, 0.0);
    v2[3] = *(double *)(a1 + 24);
    *(_OWORD *)(v2 + 1) = *(_OWORD *)(a1 + 8);
    __n128 result = *(__n128 *)(a1 + 32);
    *((__n128 *)v2 + 2) = result;
    *((_DWORD *)v2 + 12) = *(_DWORD *)(a1 + 48);
  }
  return result;
}

double *embeddedtest_test_case_statistic_metric_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  double v4 = (double *)malloc_type_calloc(1uLL, 0x38uLL, 0x1010040D5418A94uLL);
  if (!v4) {
    sub_1000176CC();
  }
  double v5 = v4;
  *(void *)double v4 = embeddedtest_create_string_from_buffer(a1, a2);
  v5[1] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[2] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[3] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[4] = embeddedtest_deserialize_metric_value(a1, a2);
  v5[5] = embeddedtest_deserialize_metric_value(a1, a2);
  *((_DWORD *)v5 + 12) = embeddedtest_deserialize_count(a1, a2);
  return v5;
}

uint64_t embeddedtest_test_case_statistic_metric_get_size(const char **a1)
{
  return strlen(*a1) + 48;
}

uint64_t embeddedtest_asprintf(void **a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return embeddedtest_vasprintf(a1, a2, &a9);
}

uint64_t embeddedtest_vasprintf(void **a1, char *__format, va_list a3)
{
  uint64_t v5 = vsnprintf(0, 0, __format, a3);
  uint64_t v6 = v5;
  if (a1)
  {
    size_t v7 = (int)v5 + 1;
    float64x2_t v8 = (char *)malloc_type_calloc(v7, 8uLL, 0x10040436913F5uLL);
    *a1 = v8;
    if (!v8) {
      sub_100017708();
    }
    uint64_t v6 = vsnprintf(v8, v7, __format, a3);
    if ((v6 & 0x80000000) != 0)
    {
      if (*a1) {
        free(*a1);
      }
      printf("vsnprintf returned an error...%d\n", v6);
    }
  }
  return v6;
}

unsigned char *embeddedtest_escape_json_string(unsigned char *a1, int a2)
{
  __n128 result = malloc_type_calloc(1uLL, (2 * a2) | 1u, 0x462EE857uLL);
  if (!result) {
    sub_100017744();
  }
  char v4 = *a1;
  if (*a1)
  {
    uint64_t v5 = a1 + 1;
    uint64_t v6 = result;
    do
    {
      if (v4 == 10)
      {
        *(_WORD *)uint64_t v6 = 28252;
        v6 += 2;
      }
      else if (v4 == 92 || v4 == 34)
      {
        *uint64_t v6 = 92;
        v6[1] = v4;
        v6 += 2;
      }
      else
      {
        *v6++ = v4;
      }
      int v7 = *v5++;
      char v4 = v7;
    }
    while (v7);
  }
  return result;
}

char *embeddedtest_create_json_string_from_array(void *a1, unsigned int a2, const char *a3, uint64_t (*a4)(void))
{
  if (a2)
  {
    int v7 = 0;
    uint64_t v8 = a2;
    do
    {
      uint64_t v9 = a4(*a1);
      uint64_t v10 = (char *)v9;
      if (v7)
      {
        int v11 = strlen(v7);
        size_t v12 = v11 + strlen(v10) + 2;
        unint64_t v13 = (char *)malloc_type_realloc(v7, v12, 0x6C6273D2uLL);
        if (!v13) {
          sub_100017780();
        }
        int v7 = v13;
        snprintf(v13, v12, a3, v13, v10);
        if (v10) {
          free(v10);
        }
      }
      else
      {
        int v7 = (char *)v9;
      }
      ++a1;
      --v8;
    }
    while (v8);
    if (v7) {
      return v7;
    }
  }

  return (char *)malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL);
}

uint64_t embeddedtest_results_save_to_file(uint64_t a1, const char *a2)
{
  if (!a1)
  {
    uint64_t v9 = "Results object must be provided to save to disk";
LABEL_9:
    uint64_t v10 = 1;
    goto LABEL_13;
  }
  if (!a2)
  {
    uint64_t v9 = "Filepath must be provided to save to disk";
    goto LABEL_9;
  }
  unsigned int v3 = (char *)embeddedtest_results_copy_json_representation(a1);
  if (!v3) {
    sub_1000177BC();
  }
  char v4 = v3;
  uint64_t v5 = fopen(a2, "w+");
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = fputs(v4, v5);
    fclose(v6);
    free(v4);
    if (v7 > 0) {
      return 0;
    }
    uint64_t v9 = "Unable to write full json to file";
  }
  else
  {
    uint64_t v9 = "Unable to open requested file";
  }
  uint64_t v10 = 4;
LABEL_13:

  return embeddedtest_error_get_error(v10, v9);
}

unsigned char *embeddedtest_test_case_result_create(char a1, const char *a2)
{
  if (a2)
  {
    char v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040F257B3C2uLL);
    if (!v4) {
      sub_1000177F8();
    }
    uint64_t v5 = v4;
    uint64_t v6 = strdup(a2);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100017834();
    }
    v5[28] = a1;
    *((_DWORD *)v5 + 6) = -1;
    *((void *)v5 + 1) = 0;
    *((_DWORD *)v5 + 8) = 0;
    *((void *)v5 + 5) = 0;
    *((_DWORD *)v5 + 4) = time(0);
    *((_DWORD *)v5 + 5) = 0;
  }
  else
  {
    puts("Unable to create a test case result with NULL name");
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_result_free(void *a1)
{
  if (a1)
  {
    unsigned int v2 = (void *)*a1;
    if (v2) {
      free(v2);
    }
    unsigned int v3 = (void *)a1[1];
    if (v3) {
      free(v3);
    }
    if (*((_DWORD *)a1 + 8))
    {
      unint64_t v4 = 0;
      do
        embeddedtest_test_case_metric_free(*(void ***)(a1[5] + 8 * v4++));
      while (v4 < *((unsigned int *)a1 + 8));
    }
    uint64_t v5 = (void *)a1[5];
    if (v5) {
      free(v5);
    }
    free(a1);
  }
}

uint64_t embeddedtest_test_case_result_pass(uint64_t a1)
{
  if (!a1)
  {
    CFDictionaryRef v1 = "Unable to pass NULL result";
    return embeddedtest_error_get_error(1, v1);
  }
  if ((*(unsigned char *)(a1 + 28) & 0xFE) == 2)
  {
    CFDictionaryRef v1 = "Cannot pass a histogram";
    return embeddedtest_error_get_error(1, v1);
  }
  *(_DWORD *)(a1 + 24) = 0;
  return 0;
}

BOOL embeddedtest_test_case_result_is_histogram(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 28) & 0xFE) == 2;
}

uint64_t embeddedtest_test_case_result_fail(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  if (!a1)
  {
    unint64_t v4 = "Unable to fail NULL result";
    goto LABEL_7;
  }
  if (!__format)
  {
    unint64_t v4 = "Reason cannot be null when failing a test case";
    goto LABEL_7;
  }
  if ((*(unsigned char *)(a1 + 28) & 0xFE) == 2)
  {
    unint64_t v4 = "Cannot fail a histogram";
LABEL_7:
    return embeddedtest_error_get_error(1, v4);
  }
  int v7 = (void *)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 8);
  if (v6) {
    free(v6);
  }
  embeddedtest_vasprintf((void **)(a1 + 8), __format, va);
  if (!*v7) {
    sub_100017870();
  }
  *(_DWORD *)(a1 + 24) = 1;
  return 0;
}

uint64_t embeddedtest_test_case_result_add_metric(uint64_t a1, const char *a2, double a3)
{
  if (!a1)
  {
    uint64_t v5 = "Unable to add metric to NULL result";
    goto LABEL_7;
  }
  if (!a2)
  {
    uint64_t v5 = "Metric name cannot be null";
    goto LABEL_7;
  }
  if ((*(unsigned char *)(a1 + 28) & 0xFE) == 2)
  {
    uint64_t v5 = "Metrics cannot be added to a histogram";
LABEL_7:
    return embeddedtest_error_get_error(1, v5);
  }
  int v7 = embeddedtest_test_case_metric_create(a2, a3);
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 8 * v8);
      uint64_t name = (const char *)embeddedtest_test_case_metric_get_name((uint64_t)v9);
      if (!strcmp(a2, name)) {
        break;
      }
      ++v8;
      unint64_t v11 = *(unsigned int *)(a1 + 32);
      if (v8 >= v11)
      {
        unsigned int v12 = v11 + 1;
        goto LABEL_16;
      }
    }
    if (v9) {
      free(v9);
    }
    *(void *)(*(void *)(a1 + 40) + 8 * v8) = v7;
  }
  else
  {
    unsigned int v12 = 1;
LABEL_16:
    *(_DWORD *)(a1 + 32) = v12;
    if (*(void *)(a1 + 40)) {
      unint64_t v13 = malloc_type_realloc(*(void **)(a1 + 40), 8 * v12, 0x2004093837F09uLL);
    }
    else {
      unint64_t v13 = malloc_type_calloc(v12, 8uLL, 0x2004093837F09uLL);
    }
    *(void *)(a1 + 40) = v13;
    if (!v13) {
      sub_1000178AC();
    }
    v13[*(_DWORD *)(a1 + 32) - 1] = v7;
  }
  return 0;
}

BOOL embeddedtest_test_case_result_did_pass(uint64_t a1)
{
  return *(_DWORD *)(a1 + 24) == 0;
}

uint64_t embeddedtest_test_case_result_check_validity(uint64_t a1)
{
  if (!a1) {
    return embeddedtest_error_get_error(1, "Unable to check validity of NULL result");
  }
  if ((*(unsigned char *)(a1 + 28) & 0xFE) == 2) {
    return sub_100012ADC(a1);
  }
  if (*(_DWORD *)(a1 + 24) == -1) {
    return embeddedtest_error_get_error(2, "Result did not have pass/fail set");
  }
  return 0;
}

uint64_t sub_100012ADC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 28) == 2 && !*(_DWORD *)(a1 + 20))
  {
    unsigned int v2 = "Histogram by time did not have a end time";
  }
  else
  {
    if (*(void *)(a1 + 8)) {
      return 0;
    }
    unsigned int v2 = "Histogram requires bucket to be set";
  }
  return embeddedtest_error_get_error(2, v2);
}

uint64_t embeddedtest_test_case_result_get_metrics(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t embeddedtest_test_case_result_get_metric_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t embeddedtest_test_case_result_get_name(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_test_case_result_get_bucket(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t embeddedtest_test_case_result_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 28);
}

uint64_t embeddedtest_test_case_result_get_duration(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20) - *(_DWORD *)(a1 + 16);
  return v1 & ~(v1 >> 31);
}

uint64_t embeddedtest_test_case_statistic_create(uint64_t a1)
{
  if (a1)
  {
    unsigned int v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040765C718DuLL);
    if (!v2) {
      sub_1000178E8();
    }
    uint64_t v3 = (uint64_t)v2;
    uint64_t name = (const char *)embeddedtest_test_case_result_get_name(a1);
    uint64_t v5 = strdup(name);
    *(void *)uint64_t v3 = v5;
    if (!v5) {
      sub_100017924();
    }
    *(unsigned char *)(v3 + 8) = embeddedtest_test_case_result_get_class(a1);
    if (embeddedtest_test_case_result_is_histogram(a1) || !embeddedtest_test_case_result_did_pass(a1))
    {
      int v7 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
      *(void *)(v3 + 24) = v7;
      if (!v7) {
        sub_100017960();
      }
      if (*(unsigned char *)(v3 + 8) == 2) {
        int duration = embeddedtest_test_case_result_get_duration(a1);
      }
      else {
        int duration = 1;
      }
      bucket = (const char *)embeddedtest_test_case_result_get_bucket(a1);
      **(void **)(v3 + 24) = embeddedtest_test_case_statistic_bucket_create(bucket, duration);
      int v6 = 1;
    }
    else
    {
      int v6 = 0;
      *(void *)(v3 + 24) = 0;
    }
    *(_DWORD *)(v3 + 20) = v6;
    if (embeddedtest_test_case_result_is_histogram(a1))
    {
      *(_DWORD *)(v3 + 12) = 0;
      *(void *)(v3 + 40) = 0;
      *(_DWORD *)(v3 + 32) = 0;
      int v10 = *(unsigned __int8 *)(v3 + 8);
      if (v10 == 3)
      {
        int v11 = 1;
        goto LABEL_19;
      }
      if (v10 == 2)
      {
        int v11 = embeddedtest_test_case_result_get_duration(a1);
LABEL_19:
        *(_DWORD *)(v3 + 16) = v11;
      }
    }
    else
    {
      sub_100012CC0(v3, a1);
    }
  }
  else
  {
    puts("Unable to create test case statistic with NULL initial result");
    return 0;
  }
  return v3;
}

uint64_t sub_100012CC0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = 1;
  *(_DWORD *)(a1 + 12) = !embeddedtest_test_case_result_did_pass(a2);
  uint64_t result = embeddedtest_test_case_result_get_metric_count(a2);
  *(_DWORD *)(a1 + 32) = result;
  if (result)
  {
    uint64_t v5 = result;
    int v6 = malloc_type_calloc(result, 8uLL, 0x2004093837F09uLL);
    *(void *)(a1 + 40) = v6;
    if (!v6) {
      sub_10001799C();
    }
    uint64_t metrics = embeddedtest_test_case_result_get_metrics(a2);
    uint64_t v8 = 0;
    uint64_t v9 = 8 * v5;
    do
    {
      uint64_t v10 = *(void *)(metrics + v8);
      uint64_t name = (const char *)embeddedtest_test_case_metric_get_name(v10);
      double value = embeddedtest_test_case_metric_get_value(v10);
      uint64_t result = (uint64_t)embeddedtest_test_case_statistic_metric_create(name, value);
      *(void *)(*(void *)(a1 + 40) + v8) = result;
      v8 += 8;
    }
    while (v9 != v8);
  }
  return result;
}

void embeddedtest_test_case_statistic_free(void **a1)
{
  if (a1)
  {
    unsigned int v2 = *a1;
    if (v2) {
      free(v2);
    }
    sub_100012DE8((uint64_t)a1);
    sub_100012E54((uint64_t)a1);
    free(a1);
  }
}

void sub_100012DE8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v2 = 0;
    do
      embeddedtest_test_case_statistic_metric_free(*(void ***)(*(void *)(a1 + 40) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
  }
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
  }
}

void sub_100012E54(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 20))
  {
    unint64_t v2 = 0;
    do
      embeddedtest_test_case_statistic_bucket_free(*(void ***)(*(void *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 20));
  }
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3)
  {
    free(v3);
  }
}

void *embeddedtest_test_case_statistic_copy_json_representation(uint64_t a1)
{
  uint64_t v17 = 0;
  json_string_from_array = embeddedtest_create_json_string_from_array(*(void **)(a1 + 24), *(_DWORD *)(a1 + 20), "%s,%s", (uint64_t (*)(void))embeddedtest_test_case_statistic_bucket_copy_json_representation);
  if ((*(unsigned char *)(a1 + 8) & 0xFE) == 2)
  {
    embeddedtest_asprintf(&v17, "{\"Name\":\"%s\",\"Instances\":%d,\"Buckets\":{%s}}", v2, v3, v4, v5, v6, v7, *(void *)a1);
    uint64_t v9 = json_string_from_array;
    if (!json_string_from_array) {
      return v17;
    }
    goto LABEL_7;
  }
  uint64_t v9 = embeddedtest_create_json_string_from_array(*(void **)(a1 + 40), *(_DWORD *)(a1 + 32), "%s,%s", (uint64_t (*)(void))embeddedtest_test_case_statistic_metric_copy_json_representation);
  embeddedtest_asprintf(&v17, "{\"Name\":\"%s\",\"Instances\":%d,\"Failure Count\":%d,\"Failure Buckets\":{%s},\"Metrics\":[%s]}", v10, v11, v12, v13, v14, v15, *(void *)a1);
  if (json_string_from_array) {
    free(json_string_from_array);
  }
  if (v9) {
LABEL_7:
  }
    free(v9);
  return v17;
}

uint64_t embeddedtest_test_case_statistic_add_result(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)embeddedtest_test_case_statistic_create(a2);
  uint64_t v4 = embeddedtest_test_case_statistic_merge(a1, (uint64_t)v3);
  embeddedtest_test_case_statistic_free(v3);
  return v4;
}

uint64_t embeddedtest_test_case_statistic_merge(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001308C(a1, a2);
  if (!v4)
  {
    sub_100013108(a1, a2);
    sub_100013260(a1, a2);
    if ((*(unsigned char *)(a1 + 8) & 0xFE) != 2) {
      *(_DWORD *)(a1 + 12) += *(_DWORD *)(a2 + 12);
    }
    *(_DWORD *)(a1 + 16) += *(_DWORD *)(a2 + 16);
  }
  return v4;
}

uint64_t sub_10001308C(uint64_t a1, uint64_t a2)
{
  if (!strcmp(*(const char **)a1, *(const char **)a2))
  {
    if (*(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8)) {
      return 0;
    }
    uint64_t v4 = "Cannot merge statistics with mismatching classes";
  }
  else
  {
    uint64_t v4 = "Cannot merge statistics with mismatching names";
  }

  return embeddedtest_error_get_error(1, v4);
}

uint64_t sub_100013108(uint64_t a1, uint64_t a2)
{
  LODWORD(count) = 0;
  uint64_t v4 = (char *)sub_100013554(a1, a2, &count);
  uint64_t v5 = v4;
  uint64_t v6 = count;
  if (!count)
  {
    free(v4);
    uint64_t v8 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = (char *)malloc_type_calloc(count, 8uLL, 0x2004093837F09uLL);
  if (!v7) {
    sub_1000179D8();
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = 8 * v6;
  do
  {
    uint64_t v11 = *(const char **)&v5[v9];
    uint64_t v12 = sub_100013690(a1, v11);
    uint64_t v13 = sub_100013690(a2, v11);
    uint64_t v14 = v13;
    if (v12)
    {
      double value = (double)embeddedtest_test_case_statistic_bucket_get_value(v12);
      if (!v14) {
        goto LABEL_7;
      }
LABEL_6:
      double value = value + (double)embeddedtest_test_case_statistic_bucket_get_value(v14);
      goto LABEL_7;
    }
    double value = 0.0;
    if (v13) {
      goto LABEL_6;
    }
LABEL_7:
    *(void *)&v8[v9] = embeddedtest_test_case_statistic_bucket_create(v11, value);
    v9 += 8;
  }
  while (v10 != v9);
  uint64_t v16 = 0;
  do
  {
    uint64_t v17 = *(void **)&v5[v16];
    if (v17) {
      free(v17);
    }
    v16 += 8;
  }
  while (v10 != v16);
  free(v5);
  sub_100012E54(a1);
LABEL_16:
  *(void *)(a1 + 24) = v8;
  *(_DWORD *)(a1 + 20) = v6;
  return 0;
}

uint64_t sub_100013260(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 32))
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(*(void *)(a2 + 40) + 8 * v4);
      uint64_t name = (const char *)embeddedtest_test_case_statistic_metric_get_name(v5);
      uint64_t v7 = sub_1000136FC(a1, name);
      if (v7)
      {
        embeddedtest_test_case_statistic_metric_merge(v7, v5);
      }
      else
      {
        embeddedtest_test_case_statistic_metric_copy(v5);
        if (!v8) {
          sub_100017A14();
        }
        uint64_t v9 = v8;
        uint64_t v10 = malloc_type_realloc(*(void **)(a1 + 40), 8 * (*(_DWORD *)(a1 + 32) + 1), 0x2004093837F09uLL);
        *(void *)(a1 + 40) = v10;
        if (!v10) {
          sub_100017A50();
        }
        uint64_t v11 = *(unsigned int *)(a1 + 32);
        v10[v11] = v9;
        *(_DWORD *)(a1 + 32) = v11 + 1;
      }
      ++v4;
    }
    while (v4 < *(unsigned int *)(a2 + 32));
  }
  return 0;
}

uint64_t embeddedtest_test_case_statistic_get_name(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_test_case_statistic_get_failure_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

void *embeddedtest_test_case_statistic_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  unint64_t v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x1090040765C718DuLL);
  if (!v4) {
    sub_100017A8C();
  }
  uint64_t v5 = v4;
  *unint64_t v4 = embeddedtest_create_string_from_buffer(a1, a2);
  uint64_t v6 = *a2;
  char v7 = *(unsigned char *)(a1 + v6);
  *a2 = v6 + 1;
  *((unsigned char *)v5 + 8) = v7;
  *((_DWORD *)v5 + 4) = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 3) = embeddedtest_deserialize_count(a1, a2);
  unsigned int v8 = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 5) = v8;
  uint64_t v9 = malloc_type_calloc(v8, 8uLL, 0x2004093837F09uLL);
  v5[3] = v9;
  if (!v9) {
    sub_100017AC8();
  }
  if (*((_DWORD *)v5 + 5))
  {
    unint64_t v10 = 0;
    do
      *(void *)(v5[3] + 8 * v10++) = embeddedtest_test_case_statistic_bucket_create_from_buffer(a1, a2);
    while (v10 < *((unsigned int *)v5 + 5));
  }
  unsigned int v11 = embeddedtest_deserialize_count(a1, a2);
  *((_DWORD *)v5 + 8) = v11;
  uint64_t v12 = malloc_type_calloc(v11, 8uLL, 0x2004093837F09uLL);
  v5[5] = v12;
  if (!v12) {
    sub_100017B04();
  }
  if (*((_DWORD *)v5 + 8))
  {
    unint64_t v13 = 0;
    do
      *(void *)(v5[5] + 8 * v13++) = embeddedtest_test_case_statistic_metric_create_from_buffer(a1, a2);
    while (v13 < *((unsigned int *)v5 + 8));
  }
  return v5;
}

uint64_t embeddedtest_test_case_statistic_get_size(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 20))
  {
    unint64_t v2 = 0;
    int v3 = 0;
    do
      v3 += embeddedtest_test_case_statistic_bucket_get_size(*(const char ***)(*(void *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 20));
    int v4 = v3 + 21;
  }
  else
  {
    int v4 = 21;
  }
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v5 = 0;
    int v6 = 0;
    do
      v6 += embeddedtest_test_case_statistic_metric_get_size(*(const char ***)(*(void *)(a1 + 40) + 8 * v5++));
    while (v5 < *(unsigned int *)(a1 + 32));
  }
  else
  {
    int v6 = 0;
  }
  return v4 + v6 + strlen(*(const char **)a1);
}

void *sub_100013554(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 20);
  if (v6 <= 1) {
    size_t v7 = 1;
  }
  else {
    size_t v7 = v6;
  }
  unsigned int v8 = malloc_type_calloc(v7, 8uLL, 0x10040436913F5uLL);
  if (!v8) {
    sub_100017B40();
  }
  uint64_t v9 = v8;
  if (*(_DWORD *)(a1 + 20))
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t name = (const char *)embeddedtest_test_case_statistic_bucket_get_name(*(void *)(*(void *)(a1 + 24) + 8 * v10));
      uint64_t v12 = strdup(name);
      if (!v12) {
        sub_100017BF4();
      }
      v9[v10++] = v12;
    }
    while (v10 < *(unsigned int *)(a1 + 20));
  }
  else
  {
    LODWORD(v10) = 0;
  }
  if (*(_DWORD *)(a2 + 20))
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = (const char *)embeddedtest_test_case_statistic_bucket_get_name(*(void *)(*(void *)(a2 + 24) + 8 * v13));
      if (!sub_100013690(a1, v14))
      {
        uint64_t v15 = strdup(v14);
        if (!v15) {
          sub_100017B7C();
        }
        uint64_t v16 = v15;
        uint64_t v17 = malloc_type_realloc(v9, 8 * (v10 + 1), 0x10040436913F5uLL);
        if (!v17) {
          sub_100017BB8();
        }
        uint64_t v9 = v17;
        v17[v10] = v16;
        LODWORD(v10) = v10 + 1;
      }
      ++v13;
    }
    while (v13 < *(unsigned int *)(a2 + 20));
  }
  *a3 = v10;
  return v9;
}

uint64_t sub_100013690(uint64_t a1, const char *a2)
{
  if (!*(_DWORD *)(a1 + 20)) {
    return 0;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 24) + 8 * v4);
    uint64_t name = (const char *)embeddedtest_test_case_statistic_bucket_get_name(v5);
    if (!strcmp(name, a2)) {
      break;
    }
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 20)) {
      return 0;
    }
  }
  return v5;
}

uint64_t sub_1000136FC(uint64_t a1, const char *a2)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8 * v4);
    uint64_t name = (const char *)embeddedtest_test_case_statistic_metric_get_name(v5);
    if (!strcmp(a2, name)) {
      break;
    }
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 32)) {
      return 0;
    }
  }
  return v5;
}

void *embeddedtest_results_create(int a1)
{
  char v1 = a1;
  if ((a1 - 1) >= 2)
  {
    printf("Impossible results class %d\n", a1);
    return 0;
  }
  else
  {
    unint64_t v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x1080040304EF5A4uLL);
    if (!v2) {
      sub_100017C30();
    }
    int v3 = v2;
    uint64_t v4 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    v3[2] = v4;
    if (!v4) {
      sub_100017C6C();
    }
    *(void *)v3[2] = embeddedtest_info_pair_create("Embedded Test Version", "23");
    *((_DWORD *)v3 + 6) = 1;
    uint64_t v5 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    *int v3 = v5;
    if (!v5) {
      sub_100017CA8();
    }
    *((_DWORD *)v3 + 2) = 0;
    unsigned int v6 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    v3[4] = v6;
    if (!v6) {
      sub_100017CE4();
    }
    *((_DWORD *)v3 + 10) = 0;
    *((unsigned char *)v3 + 44) = v1;
  }
  return v3;
}

void embeddedtest_results_free(void *a1)
{
  if (a1)
  {
    if (*((_DWORD *)a1 + 6))
    {
      unint64_t v2 = 0;
      do
        embeddedtest_info_pair_free(*(void ***)(a1[2] + 8 * v2++));
      while (v2 < *((unsigned int *)a1 + 6));
    }
    int v3 = (void *)a1[2];
    if (v3) {
      free(v3);
    }
    if (*((_DWORD *)a1 + 2))
    {
      unint64_t v4 = 0;
      do
        embeddedtest_issue_aggregate_free(*(void ***)(*a1 + 8 * v4++));
      while (v4 < *((unsigned int *)a1 + 2));
    }
    if (*a1) {
      free((void *)*a1);
    }
    if (*((_DWORD *)a1 + 10))
    {
      unint64_t v5 = 0;
      do
        embeddedtest_test_case_statistic_free(*(void ***)(a1[4] + 8 * v5++));
      while (v5 < *((unsigned int *)a1 + 10));
    }
    unsigned int v6 = (void *)a1[4];
    if (v6) {
      free(v6);
    }
    free(a1);
  }
}

void *embeddedtest_results_copy_json_representation(uint64_t a1)
{
  json_string_from_array = embeddedtest_create_json_string_from_array(*(void **)(a1 + 16), *(_DWORD *)(a1 + 24), "%s,%s", (uint64_t (*)(void))embeddedtest_info_pair_copy_json_representation);
  int v3 = embeddedtest_create_json_string_from_array(*(void **)a1, *(_DWORD *)(a1 + 8), "%s,%s", (uint64_t (*)(void))embeddedtest_issue_aggregate_copy_json_representation);
  unint64_t v4 = embeddedtest_create_json_string_from_array(*(void **)(a1 + 32), *(_DWORD *)(a1 + 40), "%s,%s", (uint64_t (*)(void))embeddedtest_test_case_statistic_copy_json_representation);
  uint64_t v12 = 0;
  embeddedtest_asprintf(&v12, "{\"Info\":{%s},\"Issues\":[%s],\"Test Cases\":[%s]}", v5, v6, v7, v8, v9, v10, (char)json_string_from_array);
  if (json_string_from_array) {
    free(json_string_from_array);
  }
  if (v3) {
    free(v3);
  }
  if (v4) {
    free(v4);
  }
  return v12;
}

unsigned char *embeddedtest_results_create_from_resume_data(uint64_t a1)
{
  unint64_t v2 = malloc_type_calloc(1uLL, 0x30uLL, 0x1080040304EF5A4uLL);
  if (!v2) {
    sub_100017D20();
  }
  int v3 = v2;
  int v14 = 0;
  embeddedtest_deserialize_size(a1, &v14);
  v3[44] = embeddedtest_deserialize_results_class(a1, &v14);
  unsigned int v4 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 6) = v4;
  uint64_t v5 = malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
  *((void *)v3 + 2) = v5;
  if (!v5) {
    sub_100017D5C();
  }
  if (*((_DWORD *)v3 + 6))
  {
    unint64_t v6 = 0;
    do
      *(void *)(*((void *)v3 + 2) + 8 * v6++) = embeddedtest_info_pair_create_from_buffer(a1, &v14);
    while (v6 < *((unsigned int *)v3 + 6));
  }
  unsigned int v7 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 2) = v7;
  uint64_t v8 = malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
  *(void *)int v3 = v8;
  if (!v8) {
    sub_100017D98();
  }
  if (*((_DWORD *)v3 + 2))
  {
    unint64_t v9 = 0;
    do
      *(void *)(*(void *)v3 + 8 * v9++) = embeddedtest_issue_aggregate_create_from_buffer(a1, &v14);
    while (v9 < *((unsigned int *)v3 + 2));
  }
  unsigned int v10 = embeddedtest_deserialize_count(a1, &v14);
  *((_DWORD *)v3 + 10) = v10;
  unsigned int v11 = malloc_type_calloc(v10, 8uLL, 0x2004093837F09uLL);
  *((void *)v3 + 4) = v11;
  if (!v11) {
    sub_100017DD4();
  }
  if (*((_DWORD *)v3 + 10))
  {
    unint64_t v12 = 0;
    do
      *(void *)(*((void *)v3 + 4) + 8 * v12++) = embeddedtest_test_case_statistic_create_from_buffer(a1, &v14);
    while (v12 < *((unsigned int *)v3 + 10));
  }
  return v3;
}

uint64_t embeddedtest_results_get_size(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24))
  {
    unint64_t v2 = 0;
    int v3 = 0;
    do
      v3 += embeddedtest_info_pair_get_size(*(const char ***)(*(void *)(a1 + 16) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 24));
    int v4 = v3 + 17;
  }
  else
  {
    int v4 = 17;
  }
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v5 = 0;
    int v6 = 0;
    do
      v6 += embeddedtest_issue_aggregate_get_size(*(const char ***)(*(void *)a1 + 8 * v5++));
    while (v5 < *(unsigned int *)(a1 + 8));
  }
  else
  {
    int v6 = 0;
  }
  if (*(_DWORD *)(a1 + 40))
  {
    unint64_t v7 = 0;
    int v8 = 0;
    do
      v8 += embeddedtest_test_case_statistic_get_size(*(void *)(*(void *)(a1 + 32) + 8 * v7++));
    while (v7 < *(unsigned int *)(a1 + 40));
  }
  else
  {
    int v8 = 0;
  }
  return (v4 + v6 + v8);
}

uint64_t embeddedtest_results_test_case_print(uint64_t a1)
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      unint64_t v3 = 0;
      do
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8 * v3);
        if (embeddedtest_test_case_statistic_get_failure_count(v4)) {
          unint64_t v5 = "[Fail]";
        }
        else {
          unint64_t v5 = "[Pass]";
        }
        uint64_t name = (const char *)embeddedtest_results_get_name(a1);
        unint64_t v7 = (const char *)embeddedtest_test_case_statistic_get_name(v4);
        printf("%s %s/%s\n", v5, name, v7);
        ++v3;
      }
      while (v3 < *(unsigned int *)(a1 + 40));
    }
    return 0;
  }
  else
  {
    return embeddedtest_error_get_error(1, "Cannot print tests cases for NULL result to syslog");
  }
}

uint64_t embeddedtest_results_get_name(uint64_t a1)
{
  if (!a1 || !*(_DWORD *)(a1 + 24)) {
    return 0;
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 16) + 8 * v2);
    key = (const char *)embeddedtest_info_pair_get_key(v3);
    if (!strcmp("Name", key)) {
      break;
    }
    if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 24)) {
      return 0;
    }
  }

  return embeddedtest_info_pair_get_value(v3);
}

uint64_t embeddedtest_results_add_test_case(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = embeddedtest_test_case_result_check_validity(a2);
  uint64_t name = (const char *)embeddedtest_test_case_result_get_name(a2);
  if (v4)
  {
    embeddedtest_log_error(v4);
    int v6 = (void **)embeddedtest_issue_create();
    __s1 = 0;
    embeddedtest_asprintf((void **)&__s1, "Had to drop an instance of %s (%d)", v7, v8, v9, v10, v11, v12, (char)name);
    embeddedtest_issue_set_reason(v6, __s1);
    if (__s1) {
      free(__s1);
    }
    int v13 = time(0);
    embeddedtest_issue_set_time((uint64_t)v6, v13);
    embeddedtest_issue_set_class((uint64_t)v6, 3);
    embeddedtest_issue_set_group((uint64_t)v6, "libembeddedtest");
    embeddedtest_results_add_issue(a1, (uint64_t)v6);
    embeddedtest_issue_free(v6);
    return v4;
  }
  if (*(unsigned char *)(a1 + 44) == 1 && embeddedtest_test_case_result_is_histogram(a2))
  {
    uint64_t v15 = "Unit test results only accept pass fail test cases";
    uint64_t v16 = 3;
LABEL_12:
    return embeddedtest_error_get_error(v16, v15);
  }
  uint64_t v17 = sub_100014184(a1, name);
  if (!v17)
  {
    uint64_t v18 = embeddedtest_test_case_statistic_create(a2);
    if (!v18) {
      sub_100017E10();
    }
    uint64_t v19 = v18;
    long long v20 = malloc_type_realloc(*(void **)(a1 + 32), 8 * (*(_DWORD *)(a1 + 40) + 1), 0x2004093837F09uLL);
    *(void *)(a1 + 32) = v20;
    if (!v20) {
      sub_100017E4C();
    }
    uint64_t v4 = 0;
    uint64_t v21 = *(unsigned int *)(a1 + 40);
    v20[v21] = v19;
    *(_DWORD *)(a1 + 40) = v21 + 1;
    return v4;
  }
  if (*(unsigned char *)(a1 + 44) == 1)
  {
    uint64_t v15 = "Unit test results cannot accept two instances of the same test case";
    uint64_t v16 = 1;
    goto LABEL_12;
  }

  return embeddedtest_test_case_statistic_add_result(v17, a2);
}

uint64_t embeddedtest_results_add_issue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = embeddedtest_issue_check_validity(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = (void **)embeddedtest_issue_create();
    __s1 = 0;
    embeddedtest_asprintf((void **)&__s1, "Had to drop an issue (%d)", v7, v8, v9, v10, v11, v12, v5);
    embeddedtest_issue_set_reason(v6, __s1);
    if (__s1) {
      free(__s1);
    }
    int v13 = time(0);
    embeddedtest_issue_set_time((uint64_t)v6, v13);
    embeddedtest_issue_set_class((uint64_t)v6, 3);
    embeddedtest_issue_set_group((uint64_t)v6, "libembeddedtest");
    embeddedtest_results_add_issue(a1, v6);
    embeddedtest_issue_free(v6);
    return v5;
  }
  uint64_t v15 = sub_1000141F4(a1, a2);
  if (!v15)
  {
    uint64_t v16 = embeddedtest_issue_aggregate_create(a2);
    if (!v16) {
      sub_100017E88();
    }
    uint64_t v17 = v16;
    uint64_t v18 = malloc_type_realloc(*(void **)a1, 8 * (*(_DWORD *)(a1 + 8) + 1), 0x2004093837F09uLL);
    *(void *)a1 = v18;
    if (!v18) {
      sub_100017EC4();
    }
    uint64_t v5 = 0;
    uint64_t v19 = *(unsigned int *)(a1 + 8);
    v18[v19] = v17;
    *(_DWORD *)(a1 + 8) = v19 + 1;
    return v5;
  }

  return embeddedtest_issue_aggregate_merge_with_issue(v15, a2);
}

uint64_t sub_100014184(uint64_t a1, const char *a2)
{
  if (!*(_DWORD *)(a1 + 40)) {
    return 0;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8 * v4);
    uint64_t name = (const char *)embeddedtest_test_case_statistic_get_name(v5);
    if (!strcmp(a2, name)) {
      break;
    }
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 40)) {
      return 0;
    }
  }
  return v5;
}

uint64_t sub_1000141F4(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)a1 + 8 * v4);
    reason = (const char *)embeddedtest_issue_get_reason(a2);
    group = (const char *)embeddedtest_issue_get_group(a2);
    int v8 = embeddedtest_issue_get_class(a2);
    uint64_t v9 = (const char *)embeddedtest_issue_aggregate_get_reason(v5);
    uint64_t v10 = (const char *)embeddedtest_issue_aggregate_get_group(v5);
    int v11 = embeddedtest_issue_aggregate_get_class(v5);
    if (!strcmp(reason, v9) && !strcmp(group, v10) && v8 == v11) {
      break;
    }
    if (++v4 >= (unint64_t)*(unsigned int *)(a1 + 8)) {
      return 0;
    }
  }
  return v5;
}

BOOL embeddedtest_results_did_pass(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 44) != 1 || *(_DWORD *)(a1 + 8)) {
    return 0;
  }
  if (!*(_DWORD *)(a1 + 40)) {
    return 1;
  }
  unint64_t v3 = 0;
  do
  {
    failure_size_t count = embeddedtest_test_case_statistic_get_failure_count(*(void *)(*(void *)(a1 + 32) + 8 * v3));
    BOOL result = failure_count == 0;
    if (failure_count) {
      break;
    }
    ++v3;
  }
  while (v3 < *(unsigned int *)(a1 + 40));
  return result;
}

double *embeddedtest_test_case_metric_create(const char *a1, double a2)
{
  if (a1)
  {
    uint64_t v4 = (double *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040FDD9F14CuLL);
    if (!v4) {
      sub_100017F00();
    }
    uint64_t v5 = v4;
    int v6 = strdup(a1);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100017F3C();
    }
    v5[1] = a2;
  }
  else
  {
    printf("Unable to create a test case metric with a NULL name...%s\n", 0);
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_metric_free(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }
}

uint64_t embeddedtest_test_case_metric_get_name(uint64_t a1)
{
  return *(void *)a1;
}

double embeddedtest_test_case_metric_get_value(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

double embeddedtest_deserialize_metric_value(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  double result = *(double *)(a1 + v2);
  *a2 = v2 + 8;
  return result;
}

unsigned char *embeddedtest_issue_create()
{
  double result = malloc_type_calloc(1uLL, 0x20uLL, 0x101004089121A46uLL);
  if (!result) {
    sub_100017F78();
  }
  result[24] = 3;
  *((void *)result + 2) = 0;
  *(void *)double result = 0;
  *((_DWORD *)result + 2) = 0;
  return result;
}

void embeddedtest_issue_free(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    unint64_t v3 = a1[2];
    if (v3) {
      free(v3);
    }
    free(a1);
  }
}

char *embeddedtest_convert_error_class_to_string(char a1)
{
  if ((a1 - 1) > 3u) {
    return 0;
  }
  else {
    return (&off_100020720)[(char)(a1 - 1)];
  }
}

uint64_t embeddedtest_issue_set_reason(void **a1, char *__s1)
{
  if (a1)
  {
    if (__s1)
    {
      uint64_t v4 = *a1;
      if (v4) {
        free(v4);
      }
      uint64_t v5 = strdup(__s1);
      *a1 = v5;
      if (!v5) {
        sub_100017FB4();
      }
      return 0;
    }
    uint64_t v7 = "Cannot set issue reason to NULL";
  }
  else
  {
    uint64_t v7 = "Cannot set the reason for a NULL issue";
  }

  return embeddedtest_error_get_error(1, v7);
}

uint64_t embeddedtest_issue_set_group(uint64_t a1, char *__s1)
{
  if (a1)
  {
    if (__s1)
    {
      uint64_t v4 = *(void **)(a1 + 16);
      if (v4) {
        free(v4);
      }
      uint64_t v5 = strdup(__s1);
      *(void *)(a1 + 16) = v5;
      if (!v5) {
        sub_100017FF0();
      }
      return 0;
    }
    uint64_t v7 = "Cannot set issue group to NULL";
  }
  else
  {
    uint64_t v7 = "Cannot set the group for a NULL issue";
  }

  return embeddedtest_error_get_error(1, v7);
}

uint64_t embeddedtest_issue_set_time(uint64_t a1, int a2)
{
  if (a1)
  {
    if (a2)
    {
      *(_DWORD *)(a1 + 8) = a2;
      return 0;
    }
    unint64_t v3 = "Cannot set issue time to 0";
  }
  else
  {
    unint64_t v3 = "Cannot set the time for a NULL issue";
  }
  return embeddedtest_error_get_error(1, v3);
}

uint64_t embeddedtest_issue_set_class(uint64_t a1, int a2)
{
  if (a1)
  {
    if ((a2 - 1) < 4)
    {
      *(unsigned char *)(a1 + 24) = a2;
      return 0;
    }
    unint64_t v3 = "Error class requested does not match anything in enum";
  }
  else
  {
    unint64_t v3 = "Cannot set the class for a NULL issue";
  }
  return embeddedtest_error_get_error(1, v3);
}

uint64_t embeddedtest_issue_get_reason(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_issue_get_group(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t embeddedtest_issue_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t embeddedtest_issue_check_validity(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = "Unable to check validity of NULL issue";
    uint64_t v3 = 1;
    return embeddedtest_error_get_error(v3, v2);
  }
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = "Issue must have a group";
LABEL_11:
    uint64_t v3 = 2;
    return embeddedtest_error_get_error(v3, v2);
  }
  if (!*(void *)a1)
  {
    uint64_t v2 = "Issue must have a reason";
    goto LABEL_11;
  }
  if (*(int *)(a1 + 8) <= 0) {
    return embeddedtest_error_get_error(3, "Issue cannot have a time of less than or equal to 0");
  }
  else {
    return 0;
  }
}

char **embeddedtest_issue_aggregate_create(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x101004089121A46uLL);
    if (!v2) {
      sub_10001802C();
    }
    uint64_t v3 = v2;
    reason = (const char *)embeddedtest_issue_get_reason(a1);
    uint64_t v5 = strdup(reason);
    *uint64_t v3 = v5;
    if (!v5) {
      sub_100018068();
    }
    group = (const char *)embeddedtest_issue_get_group(a1);
    uint64_t v7 = strdup(group);
    v3[2] = v7;
    if (!v7) {
      sub_1000180A4();
    }
    *((unsigned char *)v3 + 24) = embeddedtest_issue_get_class(a1);
    *((_DWORD *)v3 + 2) = 1;
  }
  else
  {
    puts("embeddedtest_issue_t object is required to create an issue aggregate");
    return 0;
  }
  return v3;
}

void embeddedtest_issue_aggregate_free(void **a1)
{
  if (a1)
  {
    uint64_t v2 = a1[2];
    if (v2) {
      free(v2);
    }
    if (*a1) {
      free(*a1);
    }
    free(a1);
  }
}

uint64_t embeddedtest_issue_aggregate_get_reason(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_issue_aggregate_get_group(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t embeddedtest_issue_aggregate_get_class(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

void *embeddedtest_issue_aggregate_copy_json_representation(uint64_t a1)
{
  embeddedtest_convert_error_class_to_string(*(unsigned char *)(a1 + 24));
  uint64_t v9 = 0;
  embeddedtest_asprintf(&v9, "{\"Group\":\"%s\",\"Reason\":\"%s\",\"Class\":\"%s\",\"Count\":%d}", v2, v3, v4, v5, v6, v7, *(void *)(a1 + 16));
  return v9;
}

uint64_t embeddedtest_issue_aggregate_merge_with_issue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)embeddedtest_issue_aggregate_create(a2);
  uint64_t v4 = embeddedtest_issue_aggregate_merge_with_aggregate(a1, (uint64_t)v3);
  embeddedtest_issue_aggregate_free(v3);
  return v4;
}

uint64_t embeddedtest_issue_aggregate_merge_with_aggregate(uint64_t a1, uint64_t a2)
{
  if (!strcmp(*(const char **)a1, *(const char **)a2))
  {
    if (!strcmp(*(const char **)(a1 + 16), *(const char **)(a2 + 16)))
    {
      if (*(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24))
      {
        *(_DWORD *)(a1 + 8) += *(_DWORD *)(a2 + 8);
        return 0;
      }
      uint64_t v4 = "Cannot merge issues with different classes";
    }
    else
    {
      uint64_t v4 = "Cannot merge issues with different groups";
    }
  }
  else
  {
    uint64_t v4 = "Cannot merge issues with different reasons";
  }

  return embeddedtest_error_get_error(1, v4);
}

void *embeddedtest_issue_aggregate_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = malloc_type_calloc(1uLL, 0x20uLL, 0x101004089121A46uLL);
  if (!v4) {
    sub_1000180E0();
  }
  uint64_t v5 = v4;
  *uint64_t v4 = embeddedtest_create_string_from_buffer(a1, a2);
  v5[2] = embeddedtest_create_string_from_buffer(a1, a2);
  *((_DWORD *)v5 + 2) = embeddedtest_deserialize_count(a1, a2);
  uint64_t v6 = *a2;
  char v7 = *(unsigned char *)(a1 + v6);
  *a2 = v6 + 1;
  *((unsigned char *)v5 + 24) = v7;
  return v5;
}

uint64_t embeddedtest_issue_aggregate_get_size(const char **a1)
{
  int v2 = strlen(*a1);
  return v2 + strlen(a1[2]) + 13;
}

uint64_t embeddedtest_deserialize_size(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_deserialize_count(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

unsigned char *embeddedtest_create_string_from_buffer(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  size_t v3 = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  if (v3 >= 0x2711) {
    sub_10001811C();
  }
  uint64_t v6 = malloc_type_calloc(1uLL, v3 + 1, 0x2909408uLL);
  if (!v6) {
    sub_100018138();
  }
  char v7 = v6;
  memcpy(v6, (const void *)(a1 + *a2), v3);
  v7[v3] = 0;
  *a2 += v3;
  return v7;
}

uint64_t embeddedtest_deserialize_flags(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_deserialize_results_class(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned __int8 *)(a1 + v2);
  *a2 = v2 + 1;
  return result;
}

uint64_t embeddedtest_deserialize_test_suite_class(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned __int8 *)(a1 + v2);
  *a2 = v2 + 1;
  return result;
}

uint64_t embeddedtest_deserialize_BOOL(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  char v3 = *(unsigned char *)(a1 + v2);
  *a2 = v2 + 1;
  return v3 & 1;
}

uint64_t embeddedtest_deserialize_time(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *a2;
  uint64_t result = *(unsigned int *)(a1 + v2);
  *a2 = v2 + 4;
  return result;
}

uint64_t embeddedtest_test_suite_get_name(uint64_t a1)
{
  return *(void *)a1;
}

unsigned int *embeddedtest_test_suite_create_from_resume_data(uint64_t a1)
{
  uint64_t v2 = (unsigned int *)malloc_type_calloc(1uLL, 0x38uLL, 0x109004088103722uLL);
  if (!v2) {
    sub_100018174();
  }
  char v3 = v2;
  int v8 = 0;
  embeddedtest_deserialize_size(a1, &v8);
  *(void *)char v3 = embeddedtest_create_string_from_buffer(a1, &v8);
  unsigned int v4 = embeddedtest_deserialize_count(a1, &v8);
  v3[8] = v4;
  uint64_t v5 = malloc_type_calloc(v4, 8uLL, 0x2004093837F09uLL);
  *((void *)v3 + 3) = v5;
  if (!v5) {
    sub_1000181B0();
  }
  if (v3[8])
  {
    unint64_t v6 = 0;
    do
      *(void *)(*((void *)v3 + 3) + 8 * v6++) = embeddedtest_test_case_create_from_buffer(a1, &v8);
    while (v6 < v3[8]);
  }
  *((unsigned char *)v3 + 36) = embeddedtest_deserialize_test_suite_class(a1, &v8);
  *((unsigned char *)v3 + 37) = embeddedtest_deserialize_BOOL(a1, &v8);
  v3[10] = embeddedtest_deserialize_count(a1, &v8);
  v3[11] = embeddedtest_deserialize_time(a1, &v8);
  *((unsigned char *)v3 + 48) = 0;
  return v3;
}

uint64_t embeddedtest_test_suite_get_size(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v2 = 0;
    int v3 = 0;
    do
      v3 += embeddedtest_test_case_get_size(*(const char ***)(*(void *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
    int v4 = v3 + 22;
  }
  else
  {
    int v4 = 22;
  }
  return v4 + strlen(*(const char **)a1);
}

uint64_t embeddedtest_test_suite_get_test_cases(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 32);
  return *(void *)(a1 + 24);
}

_DWORD *embeddedtest_test_case_statistic_bucket_create(const char *a1, int a2)
{
  if (a1)
  {
    int v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
    if (!v4) {
      sub_1000181EC();
    }
    uint64_t v5 = v4;
    unint64_t v6 = strdup(a1);
    *(void *)uint64_t v5 = v6;
    if (!v6) {
      sub_100018228();
    }
    v5[2] = a2;
  }
  else
  {
    puts("Unable to create a statistic bucket with a null name");
    return 0;
  }
  return v5;
}

void embeddedtest_test_case_statistic_bucket_free(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (v2) {
      free(v2);
    }
    free(a1);
  }
}

uint64_t embeddedtest_test_case_statistic_bucket_get_value(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t embeddedtest_test_case_statistic_bucket_get_name(uint64_t a1)
{
  return *(void *)a1;
}

void *embeddedtest_test_case_statistic_bucket_copy_json_representation(const char **a1)
{
  int v11 = 0;
  uint64_t v1 = (char *)*a1;
  int v2 = strlen(*a1);
  int v3 = embeddedtest_escape_json_string(v1, v2);
  embeddedtest_asprintf(&v11, "\"%s\":%d", v4, v5, v6, v7, v8, v9, (char)v3);
  if (v3) {
    free(v3);
  }
  return v11;
}

void *embeddedtest_test_case_statistic_bucket_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  if (!v4) {
    sub_100018264();
  }
  uint64_t v5 = v4;
  *uint64_t v4 = embeddedtest_create_string_from_buffer(a1, a2);
  *((_DWORD *)v5 + 2) = embeddedtest_deserialize_count(a1, a2);
  return v5;
}

uint64_t embeddedtest_test_case_statistic_bucket_get_size(const char **a1)
{
  return strlen(*a1) + 8;
}

uint64_t embeddedtest_error_get_error(uint64_t a1, const char *a2)
{
  if ((unsigned __int16)(a1 - 1) > 3u) {
    int v3 = "Unknown";
  }
  else {
    int v3 = (&off_100020740)[(__int16)(a1 - 1)];
  }
  printf("Error seen...%s - %s\n", v3, a2);
  return a1;
}

uint64_t embeddedtest_log_error(__int16 a1)
{
  if ((unsigned __int16)(a1 - 1) > 3u) {
    uint64_t v1 = "Unknown";
  }
  else {
    uint64_t v1 = (&off_100020740)[(__int16)(a1 - 1)];
  }
  return printf("Error: %s\n", v1);
}

void *embeddedtest_test_case_create(const char *a1, const char *a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a1 && a2)
  {
    uint64_t v10 = malloc_type_calloc(1uLL, 0x28uLL, 0x109004054B0866CuLL);
    if (!v10) {
      sub_1000182A0();
    }
    int v11 = v10;
    void *v10 = strdup(a1);
    v11[1] = strdup(a2);
    unint64_t v11[2] = a3;
    v11[3] = a4;
    *((_DWORD *)v11 + 8) = a5;
    *((unsigned char *)v11 + 36) = 0;
  }
  else
  {
    printf("Test cases require a name and category (uint64_t name = %s, category = %s)\n", a1, a2);
    return 0;
  }
  return v11;
}

uint64_t embeddedtest_test_case_get_name(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_test_case_get_flags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

void *embeddedtest_test_case_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  string_from_buffer = embeddedtest_create_string_from_buffer(a1, a2);
  uint64_t v5 = embeddedtest_create_string_from_buffer(a1, a2);
  int v6 = embeddedtest_deserialize_flags(a1, a2);

  return embeddedtest_test_case_create(string_from_buffer, v5, 0, 0, v6);
}

uint64_t embeddedtest_test_case_get_size(const char **a1)
{
  int v2 = strlen(*a1);
  return v2 + strlen(a1[1]) + 12;
}

char **embeddedtest_info_pair_create(const char *a1, const char *a2)
{
  if (a1 && a2)
  {
    uint64_t v4 = (char **)malloc_type_calloc(1uLL, 0x10uLL, 0x10040B8F86A93uLL);
    if (!v4) {
      sub_1000182DC();
    }
    uint64_t v5 = v4;
    int v6 = strdup(a1);
    *uint64_t v5 = v6;
    if (!v6) {
      sub_100018318();
    }
    uint64_t v7 = strdup(a2);
    v5[1] = v7;
    if (!v7) {
      sub_100018354();
    }
  }
  else
  {
    printf("Key and value are required to create info pair.  Key was %s and value was %s\n", a1, a2);
    return 0;
  }
  return v5;
}

void embeddedtest_info_pair_free(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2) {
      free(v2);
    }
    int v3 = a1[1];
    if (v3) {
      free(v3);
    }
    free(a1);
  }
}

uint64_t embeddedtest_info_pair_get_key(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t embeddedtest_info_pair_get_value(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void *embeddedtest_info_pair_copy_json_representation(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0;
  embeddedtest_asprintf(&v9, "\"%s\":\"%s\"", a3, a4, a5, a6, a7, a8, *a1);
  return v9;
}

char **embeddedtest_info_pair_create_from_buffer(uint64_t a1, _DWORD *a2)
{
  string_from_buffer = embeddedtest_create_string_from_buffer(a1, a2);
  uint64_t v5 = embeddedtest_create_string_from_buffer(a1, a2);
  int v6 = embeddedtest_info_pair_create(string_from_buffer, v5);
  if (string_from_buffer) {
    free(string_from_buffer);
  }
  if (v5) {
    free(v5);
  }
  return v6;
}

uint64_t embeddedtest_info_pair_get_size(const char **a1)
{
  int v2 = strlen(*a1);
  return v2 + strlen(a1[1]) + 8;
}

void sub_100015320()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000153B0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015440()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000154D0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015560()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000155F0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015680()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015710()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000157A0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015830()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000158C0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015950()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000159E0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015A70()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015B00()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/tbm.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015B90()
{
}

void sub_100015BAC()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015C3C()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015CCC()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015D5C()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015DEC()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015E7C()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015F0C()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100015F9C()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_10001602C()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000160BC()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_100016160()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000161F0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_100016294()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_100016338()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_1000163DC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Gigalocker partition does not exist", v0, 2u);
}

void sub_100016424()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_1000164C8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016558()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000165E8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016678()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016708()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016798()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016828()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000168B8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016948()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000169D8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016A68()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016AF8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016B88()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016C18()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016CA8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016D38()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016DC8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016E58()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016EE8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/seputil.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100016F78(void *a1, int a2)
{
}

void sub_100016FC4()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100017054()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000170E4()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100017174()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_100017204()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_1000172A8()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_10001734C()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_1000173F0()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_100017494()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_10000A68C();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
}

void sub_100017538()
{
  basename("/Library/Caches/com.apple.xbs/Sources/AppleSEPUtil/seputil/shared_support.c");
  sub_100001230();
  sub_100001218();
  sub_100001244((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros:(double value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_1000175C8()
{
  uint64_t v0 = __error();
  uint64_t v1 = strerror(*v0);
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "could not get the machine's unique identifier, reason: %s", (uint8_t *)&v2, 0xCu);
}

void sub_100017654()
{
}

void sub_100017690()
{
}

void sub_1000176CC()
{
}

void sub_100017708()
{
}

void sub_100017744()
{
}

void sub_100017780()
{
}

void sub_1000177BC()
{
}

void sub_1000177F8()
{
}

void sub_100017834()
{
}

void sub_100017870()
{
}

void sub_1000178AC()
{
}

void sub_1000178E8()
{
}

void sub_100017924()
{
}

void sub_100017960()
{
}

void sub_10001799C()
{
}

void sub_1000179D8()
{
}

void sub_100017A14()
{
}

void sub_100017A50()
{
}

void sub_100017A8C()
{
}

void sub_100017AC8()
{
}

void sub_100017B04()
{
}

void sub_100017B40()
{
}

void sub_100017B7C()
{
}

void sub_100017BB8()
{
}

void sub_100017BF4()
{
}

void sub_100017C30()
{
}

void sub_100017C6C()
{
}

void sub_100017CA8()
{
}

void sub_100017CE4()
{
}

void sub_100017D20()
{
}

void sub_100017D5C()
{
}

void sub_100017D98()
{
}

void sub_100017DD4()
{
}

void sub_100017E10()
{
}

void sub_100017E4C()
{
}

void sub_100017E88()
{
}

void sub_100017EC4()
{
}

void sub_100017F00()
{
}

void sub_100017F3C()
{
}

void sub_100017F78()
{
}

void sub_100017FB4()
{
}

void sub_100017FF0()
{
}

void sub_10001802C()
{
}

void sub_100018068()
{
}

void sub_1000180A4()
{
}

void sub_1000180E0()
{
}

void sub_10001811C()
{
}

void sub_100018138()
{
}

void sub_100018174()
{
}

void sub_1000181B0()
{
}

void sub_1000181EC()
{
}

void sub_100018228()
{
}

void sub_100018264()
{
}

void sub_1000182A0()
{
}

void sub_1000182DC()
{
}

void sub_100018318()
{
}

void sub_100018354()
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
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

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
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

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::~istream()
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

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

void _exit(int a1)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return _cc_cmp_safe();
}

uint64_t ccder_decode_constructed_tl()
{
  return _ccder_decode_constructed_tl();
}

uint64_t ccder_decode_len()
{
  return _ccder_decode_len();
}

uint64_t ccder_decode_sequence_tl()
{
  return _ccder_decode_sequence_tl();
}

uint64_t ccder_decode_tag()
{
  return _ccder_decode_tag();
}

uint64_t ccder_decode_tl()
{
  return _ccder_decode_tl();
}

uint64_t ccder_decode_uint64()
{
  return _ccder_decode_uint64();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccn_read_uint()
{
  return _ccn_read_uint();
}

uint64_t ccrsa_make_pub()
{
  return _ccrsa_make_pub();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return _ccrsa_verify_pkcs1v15();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return _ccrsa_verify_pkcs1v15_digest();
}

uint64_t ccsha1_di()
{
  return _ccsha1_di();
}

int close(int a1)
{
  return _close(a1);
}

int creat(const char *a1, mode_t a2)
{
  return _creat(a1, a2);
}

void dispatch_main(void)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return _fseeko(__stream, a2, __whence);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

off_t ftello(FILE *__stream)
{
  return _ftello(__stream);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return _gethostuuid(a1, a2);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

int isatty(int a1)
{
  return _isatty(a1);
}

uint64_t lookupPathForPersonalizedData()
{
  return _lookupPathForPersonalizedData();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
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

void *__cdecl memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len)
{
  return _memmem(__big, __big_len, __little, __little_len);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawnp(a1, a2, a3, a4, __argv, __envp);
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

uint64_t random(void)
{
  return _random();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int setlinebuf(FILE *a1)
{
  return _setlinebuf(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return _statvfs(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return _strncat(__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return _strtok(__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}