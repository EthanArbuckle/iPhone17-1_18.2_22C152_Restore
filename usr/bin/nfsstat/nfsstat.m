uint64_t sub_1000024EC(__CFDictionary *a1, const char *a2, const void *a3)
{
  __CFString *v6;
  __CFString *v7;

  if (a1 && a2 && a3)
  {
    v6 = sub_1000025B4(a2);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(a1, v6, a3);
      CFRelease(v7);
      return 0;
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_dict", a2);
      return 12;
    }
  }
  else
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_dict");
    return 22;
  }
}

__CFString *sub_1000025B4(const char *a1)
{
  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  if (Mutable)
  {
    CFStringAppendCString(Mutable, a1, 0x8000100u);
    v5.length = CFStringGetLength(v3);
    v5.location = 0;
    CFStringFindAndReplace(v3, @"\n", @" ", v5, 0);
  }
  else
  {
    fprintf(__stderrp, "*** %s: CFStringCreateMutable failed \n", "create_cfstr");
  }
  return v3;
}

uint64_t sub_10000265C(__CFDictionary *a1, const char *a2, const void *a3)
{
  if (a1 && a2 && a3)
  {
    v6 = sub_1000025B4(a2);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(a1, v6, a3);
      CFRelease(v7);
      return 0;
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_array", a2);
      return 12;
    }
  }
  else
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_array");
    return 22;
  }
}

uint64_t sub_100002724(__CFDictionary *a1, const char *a2, const void *a3, uint64_t a4)
{
  if (!a1 || !a2 || !a3)
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_num");
    return 22;
  }
  v8 = sub_1000025B4(a2);
  if (!v8)
  {
    fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_num", a2);
    return 12;
  }
  v9 = v8;
  uint64_t v10 = a4 - 1;
  if ((unint64_t)(a4 - 1) >= 8 || ((0x8Bu >> v10) & 1) == 0)
  {
    fprintf(__stderrp, "*** %s: Unsupported size %zu \n", "json_dict_add_num", a4);
    CFRelease(v9);
    return 22;
  }
  CFNumberRef v12 = CFNumberCreate(0, qword_10000BDA0[v10], a3);
  if (!v12)
  {
    fprintf(__stderrp, "*** %s: CFNumberCreate failed \n", "json_dict_add_num");
    CFRelease(v9);
    return 12;
  }
  CFNumberRef v13 = v12;
  CFDictionarySetValue(a1, v9, v12);
  CFRelease(v9);
  CFRelease(v13);
  return 0;
}

uint64_t sub_100002898(__CFDictionary *a1, const char *a2, const char *a3)
{
  if (a1 && a2 && a3)
  {
    v6 = sub_1000025B4(a2);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000025B4(a3);
      if (v8)
      {
        v9 = v8;
        CFDictionarySetValue(a1, v7, v8);
        CFRelease(v7);
        CFRelease(v9);
        return 0;
      }
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_str", a3);
      CFRelease(v7);
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_dict_add_str", a2);
    }
    return 12;
  }
  else
  {
    fprintf(__stderrp, "*** %s: dict, key or value is null \n", "json_dict_add_str");
    return 22;
  }
}

uint64_t sub_1000029A8(__CFArray *a1, const char *a2)
{
  if (a1 && a2)
  {
    v4 = sub_1000025B4(a2);
    if (v4)
    {
      CFRange v5 = v4;
      CFArrayAppendValue(a1, v4);
      CFRelease(v5);
      return 0;
    }
    else
    {
      fprintf(__stderrp, "*** %s: create_cfstr failed for \"%s\" \n", "json_arr_add_str", a2);
      return 12;
    }
  }
  else
  {
    fprintf(__stderrp, "*** %s: arr or value is null \n", "json_arr_add_str");
    return 22;
  }
}

uint64_t sub_100002A64(__CFArray *a1, const void *a2)
{
  if (a1 && a2)
  {
    CFArrayAppendValue(a1, a2);
    return 0;
  }
  else
  {
    fprintf(__stderrp, "*** %s: arr or value is null \n", "json_arr_add_dict");
    return 22;
  }
}

uint64_t sub_100002ABC(void *a1, uint64_t a2)
{
  if (!+[NSJSONSerialization isValidJSONObject:a1])
  {
    fprintf(__stderrp, "*** %s: Invalid JSON object \n", "json_print_cf_object");
    NSLog(@"%@", a1);
    id v8 = 0;
    v6 = 0;
    id v5 = 0;
    goto LABEL_6;
  }
  if (!a2)
  {
    id v16 = 0;
    v9 = +[NSJSONSerialization dataWithJSONObject:a1 options:3 error:&v16];
    id v12 = v16;
    if (v12)
    {
      id v8 = v12;
      NSLog(@"*** %s: dataWithJSONObject failed %@", "json_print_cf_object", v12);
    }
    else
    {
      CFNumberRef v13 = +[NSFileHandle fileHandleWithStandardOutput];
      id v15 = 0;
      [v13 writeData:v9 error:&v15];
      id v8 = v15;

      if (!v8)
      {
        v6 = 0;
        id v5 = 0;
        goto LABEL_12;
      }
      NSLog(@"*** %s: fileHandleWithStandardOutput failed %@", "json_print_cf_object", v8);
    }
    v6 = 0;
    id v5 = 0;
    goto LABEL_7;
  }
  id v5 = [objc_alloc((Class)NSString) initWithCString:a2 encoding:4];
  v6 = +[NSOutputStream outputStreamToFileAtPath:v5 append:0];
  [v6 open];
  id v14 = 0;
  +[NSJSONSerialization writeJSONObject:a1 toStream:v6 options:3 error:&v14];
  id v7 = v14;
  id v8 = v7;
  if (!v7)
  {
    [v6 close];
    v9 = 0;
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  NSLog(@"*** %s: writeJSONObject failed %@", "json_print_cf_object", v7);
LABEL_6:
  v9 = 0;
LABEL_7:
  uint64_t v10 = 22;
LABEL_8:

  return v10;
}

uint64_t sub_100002CD4()
{
  return putchar(10);
}

uint64_t sub_100002CDC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return printf("%s%s:\n");
  }
  else {
    return printf("%s");
  }
}

uint64_t sub_100002D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return printf("%s%s: 0x%x");
  }
  else {
    return printf("%s%s:");
  }
}

uint64_t sub_100002D74(int a1, const char *a2, const char *a3)
{
  return printf("%c%s%s", a1, a2, a3);
}

uint64_t sub_100002DA8(int a1, const char *a2, uint64_t a3)
{
  return printf("%c%s%ld", a1, a2, a3);
}

uint64_t sub_100002DDC()
{
  return putchar(10);
}

uint64_t sub_100002DE4(const char *a1, const char *a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t result = printf("%s%s: 0x%x %d %d %d: ", a1, a2, a3, a4, a5, a6);
  if (a7)
  {
    return puts("<invalid>");
  }
  return result;
}

uint64_t sub_100002E50(const char *a1, const char *a2, unsigned int a3, uint64_t a4)
{
  uint64_t result = printf("%s @ %s", a1, a2);
  if (a3)
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = *(const char **)(a4 + v7);
      if (!v8) {
        break;
      }
      if (v7) {
        v9 = ",";
      }
      else {
        v9 = " (";
      }
      uint64_t result = printf("%s%s", v9, v8);
      v7 += 8;
      if (8 * a3 == v7)
      {
        return putchar(41);
      }
    }
  }
  return result;
}

uint64_t sub_100002F14(const char *a1, const char *a2)
{
  return printf("%s from %s\n", a1, a2);
}

uint64_t sub_100002F40(unsigned int a1, unsigned __int8 *a2)
{
  printf("     fh %d ", a1);
  if (a1)
  {
    uint64_t v4 = a1;
    do
    {
      int v5 = *a2++;
      printf("%02x", v5);
      --v4;
    }
    while (v4);
  }

  return putchar(10);
}

uint64_t sub_100002FC0(uint64_t a1)
{
  return printf("%12llu  %12llu  %12llu  %s\n", *(void *)(a1 + 1025), *(void *)(a1 + 1033), *(void *)(a1 + 1041), (const char *)a1);
}

uint64_t sub_100002FFC(uint64_t a1, const char *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  printf("%12llu  %12llu  %12llu  %1ld:%02ld:%02ld  ", *(void *)(a1 + 133), *(void *)(a1 + 141), *(void *)(a1 + 149), a5, a6, a7);
  if (a4) {
    printf("%-8u ");
  }
  else {
    printf("%-8.8s ");
  }

  return puts(a2);
}

uint64_t sub_100003098(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFNumberRef v13 = (const char **)&a9;
  if (a1 < 1)
  {
    putchar(10);
  }
  else
  {
    int v9 = a1;
    int v10 = a1;
    do
    {
      printf("%12.12s ", *v13);
      v13 += 2;
      --v10;
    }
    while (v10);
    putchar(10);
    id v14 = &a9;
    do
    {
      v11 = v14;
      v14 += 2;
      printf("%12llu ", v11[1]);
      --v9;
    }
    while (v9);
  }
  return putchar(10);
}

uint64_t sub_100003170(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFNumberRef v13 = (const char **)&a9;
  if (a1 < 1)
  {
    putchar(10);
  }
  else
  {
    int v9 = a1;
    int v10 = a1;
    do
    {
      printf("%20.20s ", *v13);
      v13 += 2;
      --v10;
    }
    while (v10);
    putchar(10);
    id v14 = &a9;
    do
    {
      v11 = v14;
      v14 += 2;
      printf("%20llu ", v11[1]);
      --v9;
    }
    while (v9);
  }
  return putchar(10);
}

uint64_t sub_100003248()
{
  uint64_t result = qword_100010058;
  if (qword_100010058) {
    return sub_100002ABC((void *)qword_100010058, 0);
  }
  return result;
}

uint64_t sub_100003260()
{
  return 0xFFFFFFFFLL;
}

const void *sub_100003268(uint64_t a1, const char *a2)
{
  uint64_t result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v4 = (uint64_t)result;
  if (dword_100010048 == -1)
  {
    int v6 = 0;
  }
  else
  {
    if (a2) {
      int v5 = a2;
    }
    else {
      int v5 = (const char *)&unk_10000AAC3;
    }
    uint64_t result = (const void *)sub_1000024EC((__CFDictionary *)qword_100010058[dword_100010048], v5, result);
    int v6 = dword_100010048 + 1;
  }
  dword_100010048 = v6;
  qword_100010058[v6] = v4;
  return result;
}

const void *sub_100003304()
{
  uint64_t result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v1 = (uint64_t)result;
  if (dword_100010048 == -1)
  {
    int v2 = 0;
  }
  else
  {
    uint64_t result = (const void *)sub_100002A64(*((__CFArray **)&unk_1000100F8 + dword_10001004C), result);
    int v2 = dword_100010048 + 1;
  }
  dword_100010048 = v2;
  qword_100010058[v2] = v1;
  return result;
}

void sub_100003394()
{
}

uint64_t sub_1000033A8(uint64_t a1, const char *a2, _DWORD *a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v6 = Mutable;
  if (a3)
  {
    sub_100003268((uint64_t)Mutable, a2);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)__str = 0u;
    long long v12 = 0u;
    snprintf(__str, 0x80uLL, "0x%x", *a3);
    sub_100002898((__CFDictionary *)qword_100010058[dword_100010048], "Bitmask", __str);
    uint64_t v7 = (__CFDictionary *)qword_100010058[dword_100010048];
    id v8 = "Flags";
  }
  else
  {
    uint64_t v7 = (__CFDictionary *)qword_100010058[dword_100010048];
    id v8 = a2;
  }
  uint64_t result = sub_10000265C(v7, v8, v6);
  uint64_t v10 = ++dword_10001004C;
  qword_1000100F8[v10] = v6;
  return result;
}

uint64_t sub_1000034D0(uint64_t a1, const char *a2, const char *a3)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__str = 0u;
  long long v5 = 0u;
  snprintf(__str, 0x80uLL, "%s%s", a2, a3);
  return sub_1000029A8(*((__CFArray **)&unk_1000100F8 + dword_10001004C), __str);
}

uint64_t sub_100003560(uint64_t a1, const char *a2, uint64_t a3)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)__str = 0u;
  long long v5 = 0u;
  snprintf(__str, 0x80uLL, "%s%ld", a2, a3);
  return sub_1000029A8(*((__CFArray **)&unk_1000100F8 + dword_10001004C), __str);
}

uint64_t sub_1000035F0(uint64_t result)
{
  if (result) {
    --dword_100010048;
  }
  return result;
}

uint64_t sub_100003618(uint64_t a1, const char *a2, int a3, int a4, int a5, int a6, int a7)
{
  int v12 = a4;
  int v13 = a3;
  int v10 = a6;
  int v11 = a5;
  sub_100003268(a1, a2);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Flags", &v13, 4);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Loc", &v12, 4);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Serv", &v11, 4);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Addr", &v10, 4);
  if (a7) {
    long long v8 = "invalid";
  }
  else {
    long long v8 = "valid";
  }
  return sub_100002898((__CFDictionary *)qword_100010058[dword_100010048], "Status", v8);
}

uint64_t sub_1000036FC(const char *a1, const char *a2, int a3, const char **a4)
{
  LODWORD(v5) = a3;
  sub_100002898((__CFDictionary *)qword_100010058[dword_100010048], "Export", a1);
  uint64_t v7 = sub_100002898((__CFDictionary *)qword_100010058[dword_100010048], "Server", a2);
  uint64_t result = sub_1000033A8(v7, "Locations", 0);
  if (v5)
  {
    uint64_t v5 = v5;
    do
    {
      if (!*a4) {
        break;
      }
      uint64_t result = sub_1000029A8((__CFArray *)qword_1000100F8[dword_10001004C], *a4++);
      --v5;
    }
    while (v5);
  }
  --dword_10001004C;
  return result;
}

uint64_t sub_1000037C0(const char *a1, const char *a2)
{
  sub_100003268((uint64_t)a1, a2);
  v3 = (__CFDictionary *)qword_100010058[dword_100010048];

  return sub_100002898(v3, "Mount Point", a1);
}

uint64_t sub_100003814(uint64_t a1, uint64_t a2)
{
  unsigned int v6 = a1;
  char v8 = 0;
  memset(v7, 0, sizeof(v7));
  sub_100003268(a1, "filehandle");
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Length", &v6, 4);
  if (v6)
  {
    unint64_t v3 = 0;
    unsigned int v4 = 0;
    do
      v4 += snprintf((char *)v7 + v4, 257 - v4, "%02x", *(unsigned __int8 *)(a2 + v3++));
    while (v3 < v6);
  }
  uint64_t result = sub_100002898((__CFDictionary *)qword_100010058[dword_100010048], "Handle", (const char *)v7);
  --dword_100010048;
  return result;
}

uint64_t sub_100003958(const char *a1)
{
  sub_100003268((uint64_t)a1, a1);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Requests", a1 + 1025, 8);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Read Bytes", a1 + 1033, 8);
  uint64_t result = sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Write Bytes", a1 + 1041, 8);
  --dword_100010048;
  return result;
}

uint64_t sub_1000039F4(uint64_t a1, const char *a2, const char **a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  *(_OWORD *)v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)__str = 0u;
  long long v16 = 0u;
  if (a4)
  {
    uint64_t v11 = snprintf(__str, 0x80uLL, "%u@%s", *(_DWORD *)(a1 + 1), a2);
    sub_100003268(v11, __str);
    sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Uuid", (const void *)(a1 + 1), 4);
  }
  else
  {
    uint64_t v13 = snprintf(__str, 0x80uLL, "%s@%s", *a3, a2);
    sub_100003268(v13, __str);
    sub_100002898((__CFDictionary *)qword_100010058[dword_100010048], "User", *a3);
  }
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Requests", (const void *)(a1 + 133), 8);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Read Bytes", (const void *)(a1 + 141), 8);
  sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], "Write Bytes", (const void *)(a1 + 149), 8);
  snprintf(v23, 0x80uLL, "%1ld:%02ld:%02ld", a5, a6, a7);
  uint64_t result = sub_100002898((__CFDictionary *)qword_100010058[dword_100010048], "Idle", v23);
  --dword_100010048;
  return result;
}

uint64_t sub_100003BBC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13 = &a9;
  if ((int)result >= 1)
  {
    int v9 = result;
    do
    {
      int v10 = v13++;
      uint64_t v11 = (const char *)*v10;
      uint64_t v13 = v10 + 2;
      uint64_t v12 = v10[1];
      uint64_t result = sub_100002724((__CFDictionary *)qword_100010058[dword_100010048], v11, &v12, 8);
      --v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_100003C44(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 48) = 0;
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_DWORD *)(result + 48) = 1;
  *(_DWORD *)(result + 52) = 1;
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = a3;
  *(void *)(result + 40) = 512;
  if (a2) {
    *(_DWORD *)(result + 52) = 0;
  }
  return result;
}

uint64_t sub_100003C84(uint64_t a1, char *__dst, unsigned int a3, int a4)
{
  if (a4) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = (a3 + 3) & 0xFFFFFFFC;
  }
  if (!v4) {
    return 0;
  }
  unsigned int v5 = a3;
  unint64_t v8 = *(void *)(a1 + 32);
  while (v8)
  {
    if (v8 >= v4) {
      unint64_t v9 = v4;
    }
    else {
      unint64_t v9 = v8;
    }
    int v10 = *(char **)(a1 + 24);
    if (v5)
    {
      if (v9 >= v5) {
        size_t v11 = v5;
      }
      else {
        size_t v11 = v9;
      }
      memmove(__dst, v10, v11);
      int v10 = *(char **)(a1 + 24);
      unint64_t v8 = *(void *)(a1 + 32);
      unint64_t v9 = v11;
    }
    else
    {
      size_t v11 = 0;
    }
    v8 -= v9;
    *(void *)(a1 + 24) = &v10[v9];
    *(void *)(a1 + 32) = v8;
    __dst += v11;
    if (v5) {
      v5 -= v9;
    }
    else {
      unsigned int v5 = 0;
    }
    v4 -= v9;
    if (!v4) {
      return 0;
    }
  }
  return 12;
}

void sub_1000040CC(char *a1, char a2)
{
  size_t v11 = 0;
  bzero(v12, 0x400uLL);
  size_t v9 = 0;
  int v10 = 0;
  if (realpath_DARWIN_EXTSN(a1, v12)) {
    a1 = v12;
  }
  int v4 = getmntinfo(&v11, 2);
  if (!v4) {
    sub_10000A31C();
  }
  if (v4 >= 1)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 2168 * v4;
    while (1)
    {
      uint64_t v7 = v11;
      unint64_t v8 = &v11[v5 / 0x878];
      if (a1)
      {
        if (strcmp(a1, v8->f_mntonname) || !strcmp(v8->f_fstypename, "autofs")) {
          goto LABEL_14;
        }
      }
      else if (strcmp(v8->f_fstypename, "nfs") || !strncmp(v8->f_mntfromname, "ftp:", 4uLL))
      {
        goto LABEL_14;
      }
      if (sub_100005E2C((unsigned int *)&v7[v5 / 0x878].f_fsid, &v10, &v9)) {
        warnx("Unable to get mount info for %s", v11[v5 / 0x878].f_mntonname);
      }
      else {
        sub_100009100((uint64_t)&v11[v5 / 0x878], (uint64_t)v10, v9, a2);
      }
LABEL_14:
      v5 += 2168;
      if (v6 == v5)
      {
        if (v10) {
          free(v10);
        }
        return;
      }
    }
  }
}

void sub_10000426C(unsigned int a1)
{
  *(void *)uint64_t v7 = 0;
  size_t v8 = 0;
  uint64_t v9 = 0;
  signal(14, (void (__cdecl *)(int))sub_1000060E0);
  byte_10001019C = 0;
  alarm(a1);
  uint64_t v2 = 0;
  size_t v3 = 0;
  int v4 = 1;
  while (1)
  {
    if (!--v4)
    {
      printf("%12s  %12s  %12s\n", "Requests", "Read Bytes", "Write Bytes");
      fflush(__stdoutp);
      int v4 = 20;
    }
    if (!sub_100005B6C((void **)&v9, &v8))
    {
      uint64_t v5 = v9;
      sub_1000099F0(v9, v2);
      size_t v6 = v8;
      size_t v8 = v3;
      uint64_t v9 = v2;
      uint64_t v2 = v5;
      size_t v3 = v6;
    }
    fflush(__stdoutp);
    v7[1] = 0x2000;
    if (sigprocmask(1, &v7[1], v7) == -1) {
      goto LABEL_11;
    }
    if (!byte_10001019C)
    {
      v7[1] = 0;
      sigsuspend(&v7[1]);
    }
    if (sigprocmask(3, v7, 0) == -1) {
LABEL_11:
    }
      err(1, "sigprocmask failed");
    byte_10001019C = 0;
    alarm(a1);
  }
}

void sub_1000043C0()
{
  size_t v6 = 0;
  uint64_t v7 = 0;
  if (!sub_100005B6C((void **)&v7, &v6))
  {
    v0 = v7;
    unint64_t v1 = *(void *)(v7 + 4);
    if (v1)
    {
      ((void (*)(void, const char *))off_100010050[3])(0, "Exported Directory Info");
      ((void (*)(const char *, ...))off_100010050[1])("%12s  %12s  %12s\n", "Requests", "Read Bytes", "Write Bytes");
      uint64_t v2 = 0;
      unsigned int v3 = 1;
      do
      {
        uint64_t v4 = ((uint64_t (*)(char *))off_100010050[14])(&v0[1049 * v2 + 12]);
        uint64_t v2 = v3;
      }
      while (v1 > v3++);
      ((void (*)(uint64_t))off_100010050[5])(v4);
    }
    else
    {
      puts("No export stat data found");
    }
    free(v0);
  }
}

void sub_1000044B8(unsigned int a1, char a2)
{
  *(void *)uint64_t v9 = 0;
  size_t v10 = 0;
  uint64_t v11 = 0;
  signal(14, (void (__cdecl *)(int))sub_1000060E0);
  byte_10001019C = 0;
  alarm(a1);
  uint64_t v4 = 0;
  size_t v5 = 0;
  int v6 = 1;
  while (1)
  {
    if (!--v6)
    {
      printf("%12s  %12s  %12s  %-7s  %-8s %s\n", "Requests", "Read Bytes", "Write Bytes", "Idle", "User", "IP Address");
      fflush(__stdoutp);
      int v6 = 20;
    }
    if (!sub_100005CCC((void **)&v11, &v10))
    {
      sub_100009FB0(v11, v4, a2);
      size_t v8 = v10;
      uint64_t v7 = v11;
      size_t v10 = v5;
      uint64_t v11 = v4;
      uint64_t v4 = v7;
      size_t v5 = v8;
    }
    fflush(__stdoutp);
    v9[1] = 0x2000;
    if (sigprocmask(1, &v9[1], v9) == -1) {
      goto LABEL_11;
    }
    if (!byte_10001019C)
    {
      v9[1] = 0;
      sigsuspend(&v9[1]);
    }
    if (sigprocmask(3, v9, 0) == -1) {
LABEL_11:
    }
      err(1, "sigprocmask failed");
    byte_10001019C = 0;
    alarm(a1);
  }
}

void sub_10000462C(char a1)
{
  size_t v11 = 0;
  uint64_t v12 = 0;
  if (!sub_100005CCC((void **)&v12, &v11))
  {
    uint64_t v2 = v12;
    if (v12[1])
    {
      unsigned int v3 = sub_100009BA4((uint64_t)v12);
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = ((uint64_t (*)(void, const char *))off_100010050[3])(0, "NFS Active User Info");
        for (i = *v4; i; i = (uint64_t *)*i)
        {
          ((void (*)(void, uint64_t))off_100010050[3])(0, i[3] + 1);
          uint64_t v7 = ((uint64_t (*)(const char *, ...))off_100010050[1])("%12s  %12s  %12s  %-7s  %-8s %s\n", "Requests", "Read Bytes", "Write Bytes", "Idle", "User", "IP Address");
          for (j = (void *)i[2]; j; j = (void *)*j)
            uint64_t v7 = sub_100009D30(j[2], a1);
          uint64_t v5 = ((uint64_t (*)(uint64_t))off_100010050[5])(v7);
        }
        ((void (*)(uint64_t))off_100010050[5])(v5);
        sub_100009F38(v4);
        free(v4);
        uint64_t v9 = v2;
        goto LABEL_12;
      }
      size_t v10 = "Not enough  memory for displaying active user statistics";
    }
    else
    {
      size_t v10 = "No NFS active user statistics found.";
    }
    puts(v10);
    uint64_t v9 = v2;
LABEL_12:
    free(v9);
  }
}

uint64_t sub_1000047B4()
{
  memset(&v1, 0, sizeof(v1));
  uint64_t result = getvfsbyname("nfs", &v1);
  if ((result & 0x80000000) == 0)
  {
    v2[0] = 3;
    v2[1] = v1.vfc_typenum;
    v2[2] = 7;
    uint64_t result = sysctl(v2, 3u, 0, 0, 0, 0);
    if ((result & 0x80000000) != 0) {
      sub_10000A338();
    }
  }
  return result;
}

uint64_t sub_100004854()
{
  uint64_t result = nfssvc(128, 0);
  if ((result & 0x80000000) != 0) {
    sub_10000A354();
  }
  return result;
}

void sub_10000487C(int a1, int a2)
{
  bzero(v20, 0x510uLL);
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  if ((a1 & 2) != 0)
  {
    sub_1000059F8(v20);
    ((void (*)(void, const char *))off_100010050[3])(0, "NFS Client Errors Info");
    unint64_t v4 = -4;
    unint64_t v5 = 30;
    do
    {
      unint64_t v6 = v5 - 4;
      if (v5 >= 4) {
        uint64_t v7 = 4;
      }
      else {
        uint64_t v7 = v5;
      }
      v4 += 4;
      uint64_t v8 = sub_100006018((uint64_t)&v21, (uint64_t)&off_10000C2D8, v4, v7);
      unint64_t v5 = v6;
    }
    while (v4 < 0x1A);
    if ((a2 & 2) != 0)
    {
      ((void (*)(uint64_t))off_100010050[2])(v8);
      ((void (*)(void, const char *))off_100010050[3])(0, "NFSv4 Client Errors Info");
      unint64_t v9 = -4;
      do
      {
        v9 += 4;
        uint64_t v10 = sub_100006018((uint64_t)&v22, (uint64_t)&off_10000C4B8, v9, 4);
      }
      while (v9 < 0x24);
      uint64_t v8 = ((uint64_t (*)(uint64_t))off_100010050[5])(v10);
    }
    ((void (*)(uint64_t))off_100010050[5])(v8);
  }
  if (a1 & a2)
  {
    uint64_t v11 = sub_100005AB4((uint64_t)v17);
    if ((a1 & 2) != 0) {
      ((void (*)(uint64_t))off_100010050[2])(v11);
    }
    ((void (*)(void, const char *))off_100010050[3])(0, "NFS Server Errors Info");
    unint64_t v12 = -4;
    unint64_t v13 = 30;
    do
    {
      unint64_t v14 = v13 - 4;
      if (v13 >= 4) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = v13;
      }
      v12 += 4;
      uint64_t v16 = sub_100006018((uint64_t)v18, (uint64_t)&off_10000C2D8, v12, v15);
      unint64_t v13 = v14;
    }
    while (v12 < 0x1A);
    ((void (*)(uint64_t))off_100010050[5])(v16);
  }
}

void sub_100004A80(unsigned int a1, unsigned __int8 a2, char a3)
{
  bzero(v73, 0x510uLL);
  uint64_t v72 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  *(void *)v41 = 0;
  signal(14, (void (__cdecl *)(int))sub_1000060E0);
  byte_10001019C = 0;
  unsigned int v38 = a1;
  alarm(a1);
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v30 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v15 = a3 & 1;
  char v16 = a3;
  int v39 = a3 & 1 & a2;
  int v14 = 1;
  while (1)
  {
    if (!--v14)
    {
      sub_1000060F0();
      int v14 = 20;
    }
    if ((a2 & 2) != 0)
    {
      sub_1000059F8(v73);
      if (v15) {
        printf("Client v3: %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu\n", v74 - v24, v75 - v20, v77 - v26, v78 - v25, v79 - v23, v80 - v22, v76 - v28, v81 - (v18 + v21) + v82, v83 - v19, v84 - v17);
      }
      if ((v16 & 2) != 0) {
        printf("Client v4: %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu\n", v86 - v34, v89 - v32, v92 - v29, v90 - v31, v94 - v27, v93 - v30, v85 - v37, v91 - v33, v87 - v36, v88 - v35);
      }
      uint64_t v28 = v76;
      uint64_t v26 = v77;
      uint64_t v24 = v74;
      uint64_t v25 = v78;
      uint64_t v22 = v80;
      uint64_t v23 = v79;
      uint64_t v20 = v75;
      uint64_t v21 = v81;
      uint64_t v18 = v82;
      uint64_t v19 = v83;
      uint64_t v17 = v84;
      uint64_t v36 = v87;
      uint64_t v37 = v85;
      uint64_t v34 = v86;
      uint64_t v35 = v88;
      uint64_t v31 = v90;
      uint64_t v32 = v89;
      uint64_t v33 = v91;
      uint64_t v29 = v92;
      uint64_t v30 = v93;
      uint64_t v27 = v94;
    }
    if (v39)
    {
      sub_100005AB4((uint64_t)&v42);
      printf("Server v3: %8llu %8llu %8llu %8llu %8llu %8llu %8llu %8llu\n", *((void *)&v42 + 1) - v5, *((void *)&v43 + 1) - v6, *((void *)&v44 + 1) - v8, (void)v45 - v9, *((void *)&v45 + 1) - v10, (void)v49 - v11, (void)v44 - v7, (void)v50 - (v13 + v12) + *((void *)&v50 + 1));
      uint64_t v5 = *((void *)&v42 + 1);
      uint64_t v6 = *((void *)&v43 + 1);
      uint64_t v8 = *((void *)&v44 + 1);
      uint64_t v7 = v44;
      uint64_t v10 = *((void *)&v45 + 1);
      uint64_t v9 = v45;
      uint64_t v11 = v49;
      uint64_t v13 = *((void *)&v50 + 1);
      uint64_t v12 = v50;
    }
    fflush(__stdoutp);
    v41[1] = 0x2000;
    if (sigprocmask(1, &v41[1], v41) == -1) {
      goto LABEL_17;
    }
    if (!byte_10001019C)
    {
      v41[1] = 0;
      sigsuspend(&v41[1]);
    }
    if (sigprocmask(3, v41, 0) == -1) {
LABEL_17:
    }
      err(1, "sigprocmask failed");
    byte_10001019C = 0;
    alarm(v38);
  }
}

void sub_100004E88(int a1, int a2)
{
  bzero(&v20, 0x510uLL);
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  if ((a1 & 2) == 0)
  {
    if ((a2 & a1 & 1) == 0) {
      return;
    }
    sub_100005AB4((uint64_t)v18);
    goto LABEL_10;
  }
  sub_1000059F8(&v20);
  ((void (*)(void, const char *))off_100010050[3])(0, "Client Info");
  if (a2)
  {
    ((void (*)(void, const char *))off_100010050[3])(0, "NFSv3 RPC Counts");
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    uint64_t v4 = ((uint64_t (*)(uint64_t))off_100010050[16])(4);
    ((void (*)(uint64_t))off_100010050[5])(v4);
    ((void (*)(void, const char *))off_100010050[3])(0, "NLM RPC Counts");
    uint64_t v5 = ((uint64_t (*)(uint64_t))off_100010050[16])(3);
    ((void (*)(uint64_t))off_100010050[5])(v5);
  }
  if ((a2 & 2) != 0)
  {
    ((void (*)(void, const char *))off_100010050[3])(0, "NFSv4 RPC Counts");
    uint64_t v6 = ((uint64_t (*)(uint64_t))off_100010050[16])(2);
    ((void (*)(uint64_t))off_100010050[5])(v6);
    ((void (*)(void, const char *))off_100010050[3])(0, "NFSv4 Operation Counts");
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    uint64_t v7 = ((uint64_t (*)(uint64_t))off_100010050[16])(1);
    ((void (*)(uint64_t))off_100010050[5])(v7);
  }
  ((void (*)(void, const char *))off_100010050[3])(0, "RPC Info");
  uint64_t v8 = ((uint64_t (*)(uint64_t))off_100010050[16])(5);
  ((void (*)(uint64_t))off_100010050[5])(v8);
  ((void (*)(void, const char *))off_100010050[3])(0, "Cache Info");
  ((void (*)(uint64_t))off_100010050[16])(6);
  ((void (*)(uint64_t))off_100010050[16])(6);
  uint64_t v9 = ((uint64_t (*)(uint64_t))off_100010050[16])(4);
  ((void (*)(uint64_t))off_100010050[5])(v9);
  ((void (*)(void, const char *))off_100010050[3])(0, "Paging Info");
  uint64_t v10 = ((uint64_t (*)(uint64_t))off_100010050[16])(2);
  uint64_t v11 = ((uint64_t (*)(uint64_t))off_100010050[5])(v10);
  ((void (*)(uint64_t))off_100010050[5])(v11);
  if ((a2 & 1 & a1) != 0)
  {
    uint64_t v12 = sub_100005AB4((uint64_t)v18);
    ((void (*)(uint64_t))off_100010050[2])(v12);
LABEL_10:
    ((void (*)(void, const char *))off_100010050[3])(0, "Server Info");
    ((void (*)(void, const char *))off_100010050[3])(0, "RPC Counts");
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    ((void (*)(uint64_t))off_100010050[16])(6);
    uint64_t v13 = ((uint64_t (*)(uint64_t))off_100010050[16])(3);
    ((void (*)(uint64_t))off_100010050[5])(v13);
    ((void (*)(void, const char *))off_100010050[3])(0, "Server Faults");
    uint64_t v14 = ((uint64_t (*)(uint64_t))off_100010050[16])(2);
    ((void (*)(uint64_t))off_100010050[5])(v14);
    ((void (*)(void, const char *))off_100010050[3])(0, "Server Cache Stats");
    uint64_t v15 = ((uint64_t (*)(uint64_t))off_100010050[16])(4);
    ((void (*)(uint64_t))off_100010050[5])(v15);
    ((void (*)(void, const char *))off_100010050[3])(0, "Server Write Gathering");
    uint64_t v16 = ((uint64_t (*)(uint64_t))off_100010050[16])(3);
    uint64_t v17 = ((uint64_t (*)(uint64_t))off_100010050[5])(v16);
    ((void (*)(uint64_t))off_100010050[5])(v17);
  }
}

uint64_t sub_1000059F8(void *a1)
{
  size_t v3 = 1296;
  memset(&v4, 0, sizeof(v4));
  bzero(a1, 0x510uLL);
  uint64_t result = getvfsbyname("nfs", &v4);
  if ((result & 0x80000000) == 0)
  {
    v5[0] = 3;
    v5[1] = v4.vfc_typenum;
    v5[2] = 1;
    uint64_t result = sysctl(v5, 3u, a1, &v3, 0, 0);
    if ((result & 0x80000000) != 0) {
      sub_10000A338();
    }
  }
  return result;
}

uint64_t sub_100005AB4(uint64_t a1)
{
  uint64_t v2 = 488;
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
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(void *)(a1 + 480) = 0;
  v3[0] = a1;
  v3[1] = 488;
  v3[2] = &v2;
  v3[3] = 8;
  uint64_t result = nfssvc(256, v3);
  if ((result & 0x80000000) != 0) {
    sub_10000A354();
  }
  return result;
}

uint64_t sub_100005B6C(void **a1, size_t *a2)
{
  vfsconf v4 = *a1;
  if (!*a1)
  {
    *a2 = 0x8000;
    uint64_t v5 = malloc_type_malloc(0x8000uLL, 0x6FDEF3CuLL);
    *a1 = v5;
    if (!v5)
    {
      warnx("No memory for reading export stat data");
      return 1;
    }
    __memset_chk();
    vfsconf v4 = *a1;
  }
  size_t v6 = *a2;
  uint64_t v10 = v4;
  size_t v11 = v6;
  uint64_t v12 = a2;
  uint64_t v13 = 8;
  if (nfssvc(16, &v10) < 0) {
    sub_10000A354();
  }
  if (v6 <= *a2) {
    goto LABEL_8;
  }
  free(*a1);
  *a2 = v6 + 4196;
  uint64_t v7 = malloc_type_malloc(v6 + 4196, 0x37E98A56uLL);
  *a1 = v7;
  if (!v7)
  {
    warnx("No memory for reading export statistics");
    return 1;
  }
  bzero(v7, *a2);
  size_t v8 = *a2;
  uint64_t v10 = *a1;
  size_t v11 = v8;
  uint64_t v12 = a2;
  uint64_t v13 = 8;
  if (nfssvc(16, &v10) < 0) {
    sub_10000A370(a1);
  }
LABEL_8:
  if (*(_DWORD *)*a1 != 1) {
    sub_10000A394(*a1);
  }
  return 0;
}

uint64_t sub_100005CCC(void **a1, size_t *a2)
{
  vfsconf v4 = *a1;
  if (!*a1)
  {
    *a2 = 0x20000;
    uint64_t v5 = malloc_type_malloc(0x20000uLL, 0xA663E956uLL);
    *a1 = v5;
    if (!v5)
    {
      warnx("No memory for reading active user statistics");
      return 1;
    }
    __memset_chk();
    vfsconf v4 = *a1;
  }
  size_t v6 = *a2;
  uint64_t v10 = v4;
  size_t v11 = v6;
  uint64_t v12 = a2;
  uint64_t v13 = 8;
  if (nfssvc(32, &v10) < 0) {
    sub_10000A354();
  }
  if (v6 <= *a2) {
    goto LABEL_8;
  }
  free(*a1);
  *a2 = v6 + 5130;
  uint64_t v7 = malloc_type_malloc(v6 + 5130, 0x19A8A49CuLL);
  *a1 = v7;
  if (!v7)
  {
    warnx("No memory for reading active user statistics\n");
    return 1;
  }
  bzero(v7, *a2);
  size_t v8 = *a2;
  uint64_t v10 = *a1;
  size_t v11 = v8;
  uint64_t v12 = a2;
  uint64_t v13 = 8;
  if (nfssvc(32, &v10) < 0) {
    sub_10000A370(a1);
  }
LABEL_8:
  if (*(_DWORD *)*a1 != 1) {
    sub_10000A3B4(*a1);
  }
  return 0;
}

uint64_t sub_100005E2C(unsigned int *a1, void **a2, size_t *a3)
{
  if (!*a2)
  {
    *a3 = 4096;
    size_t v6 = malloc_type_malloc(0x1000uLL, 0xCF470E71uLL);
    *a2 = v6;
    if (!v6)
    {
      warnx("No memory for reading mount information");
      return 12;
    }
    __memset_chk();
  }
  memset(&v13, 0, sizeof(v13));
  if (getvfsbyname("nfs", &v13) < 0) {
    sub_10000A3D4();
  }
  v14[0] = 3;
  v14[1] = v13.vfc_typenum;
  v14[2] = 6;
  uint64_t v7 = *a2;
  _DWORD *v7 = bswap32(*a1);
  v7[1] = bswap32(a1[1]);
  size_t size = *a3;
  if (sysctl(v14, 3u, v7, &size, 0, 0) < 0) {
    goto LABEL_12;
  }
  if (size <= *a3) {
    goto LABEL_9;
  }
  free(*a2);
  size_t v8 = size;
  *a3 = size;
  uint64_t v9 = malloc_type_malloc(v8, 0xE958B74DuLL);
  *a2 = v9;
  if (!v9)
  {
    warnx("No memory for reading mount information\n");
    return 12;
  }
  bzero(v9, *a3);
  uint64_t v10 = *a2;
  *uint64_t v10 = bswap32(*a1);
  v10[1] = bswap32(a1[1]);
  size_t size = *a3;
  if (sysctl(v14, 3u, v10, &size, 0, 0) < 0)
  {
LABEL_12:
    warn("sysctl failed");
    return *__error();
  }
LABEL_9:
  if (!*(_DWORD *)*a2) {
    return 0;
  }
  warnx("NFS mount information version mismatch");
  return 72;
}

uint64_t sub_100006018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t))off_100010050[17])(a4);
}

void sub_1000060E0()
{
  byte_10001019C = 1;
}

uint64_t sub_1000060F0()
{
  printf("        %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s %8.8s\n", "Getattr", "Lookup", "Readlink", "Read", "Write", "Rename", "Access", "Readdir", "Lock", "Unlock");
  v0 = __stdoutp;

  return fflush(v0);
}

void sub_100006198(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 452);
  size_t v3 = *(void **)(a1 + 456);
  if (v2)
  {
    unint64_t v4 = 0;
    while (v3)
    {
      if (LODWORD(v3[3 * v4 + 2]))
      {
        unint64_t v5 = 0;
        do
        {
          uint64_t v6 = v3[3 * v4];
          if (!v6) {
            break;
          }
          if (*(_DWORD *)(v6 + 24 * v5 + 16))
          {
            unint64_t v7 = 0;
            do
            {
              uint64_t v8 = *(void *)(v6 + 24 * v5 + 8);
              if (v8)
              {
                uint64_t v9 = *(void **)(v8 + 8 * v7);
                if (v9)
                {
                  free(v9);
                  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 456) + 24 * v4) + 24 * v5 + 8) + 8 * v7) = 0;
                  size_t v3 = *(void **)(a1 + 456);
                }
              }
              ++v7;
              uint64_t v6 = v3[3 * v4];
            }
            while (v7 < *(unsigned int *)(v6 + 24 * v5 + 16));
          }
          if (*(void *)(v6 + 24 * v5 + 8))
          {
            free(*(void **)(v6 + 24 * v5 + 8));
            size_t v3 = *(void **)(a1 + 456);
            uint64_t v6 = v3[3 * v4];
            *(void *)(v6 + 24 * v5 + 8) = 0;
          }
          uint64_t v10 = v6 + 24 * v5;
          *(_DWORD *)(v10 + 16) = 0;
          size_t v11 = *(void **)v10;
          if (v11)
          {
            free(v11);
            size_t v3 = *(void **)(a1 + 456);
            *(void *)(v3[3 * v4] + 24 * v5) = 0;
          }
          ++v5;
        }
        while (v5 < LODWORD(v3[3 * v4 + 2]));
      }
      if (v3[3 * v4])
      {
        free((void *)v3[3 * v4]);
        size_t v3 = *(void **)(a1 + 456);
        v3[3 * v4] = 0;
      }
      uint64_t v12 = (char *)&v3[3 * v4];
      *((_DWORD *)v12 + 4) = 0;
      if (*((_DWORD *)v12 + 5))
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = v3[3 * v4 + 1];
          if (v14)
          {
            uint64_t v15 = *(void **)(v14 + 8 * v13);
            if (v15)
            {
              free(v15);
              *(void *)(*(void *)(*(void *)(a1 + 456) + 24 * v4 + 8) + 8 * v13) = 0;
              size_t v3 = *(void **)(a1 + 456);
            }
          }
          ++v13;
        }
        while (v13 < HIDWORD(v3[3 * v4 + 2]));
      }
      if (v3[3 * v4 + 1])
      {
        free((void *)v3[3 * v4 + 1]);
        size_t v3 = *(void **)(a1 + 456);
        v3[3 * v4 + 1] = 0;
      }
      HIDWORD(v3[3 * v4++ + 2]) = 0;
      if (v4 >= *(unsigned int *)(a1 + 452)) {
        goto LABEL_31;
      }
    }
  }
  else if (v3)
  {
LABEL_31:
    free(v3);
    *(void *)(a1 + 456) = 0;
  }
  *(_DWORD *)(a1 + 452) = 0;
  uint64_t v16 = *(void **)(a1 + 464);
  if (v16)
  {
    free(v16);
    *(void *)(a1 + 464) = 0;
  }
  uint64_t v17 = *(void **)(a1 + 24);
  if (v17)
  {
    free(v17);
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v18 = *(void **)(a1 + 32);
  if (v18)
  {
    free(v18);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v19 = *(void **)(a1 + 40);
  if (v19)
  {
    free(v19);
    *(void *)(a1 + 40) = 0;
  }
  uint64_t v20 = *(void **)(a1 + 256);
  if (v20)
  {
    free(v20);
    *(void *)(a1 + 256) = 0;
  }
  uint64_t v21 = *(void **)(a1 + 264);
  if (v21)
  {
    free(v21);
    *(void *)(a1 + 264) = 0;
  }
}

uint64_t sub_1000063EC(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 < 9) {
    return 72;
  }
  unsigned int __dst = 0;
  *(_DWORD *)a3 = 0;
  uint64_t v6 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
  if (v6)
  {
    if (*(_DWORD *)a3 <= 0x58u)
    {
      uint64_t v7 = v6;
LABEL_7:
      unsigned int v9 = 0;
      goto LABEL_8;
    }
    return 72;
  }
  unsigned int v8 = bswap32(__dst);
  *(_DWORD *)a3 = v8;
  if (v8 > 0x58) {
    return 72;
  }
  unsigned int __dst = 0;
  uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
  if (v7) {
    goto LABEL_7;
  }
  unsigned int v9 = bswap32(__dst);
LABEL_8:
  if (v9 != a2) {
    return 72;
  }
  unsigned int __dst = 0;
  if (v7) {
    goto LABEL_11;
  }
  uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
  if (v7) {
    goto LABEL_11;
  }
  if (__dst) {
    return 22;
  }
  unsigned int __dst = 0;
  uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
  if (v7) {
    goto LABEL_11;
  }
  uint64_t v13 = bswap32(__dst);
  uint64_t v14 = v13 >= 2 ? 2 : v13;
  if (v14)
  {
    uint64_t v7 = 0;
    uint64_t v15 = (_DWORD *)(a3 + 8);
    uint64_t v16 = v14;
    do
    {
      unsigned int __dst = 0;
      *uint64_t v15 = 0;
      if (!v7)
      {
        uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
        if (!v7) {
          *uint64_t v15 = bswap32(__dst);
        }
      }
      ++v15;
      --v16;
    }
    while (v16);
    if (v7) {
      goto LABEL_11;
    }
  }
  if (v14 >= v13)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    do
    {
      if (!v7)
      {
        unint64_t v17 = *(void *)(a1 + 32);
        unint64_t v18 = 4;
        while (v17)
        {
          if (v17 >= v18) {
            unint64_t v19 = v18;
          }
          else {
            unint64_t v19 = v17;
          }
          v17 -= v19;
          *(void *)(a1 + 24) += v19;
          *(void *)(a1 + 32) = v17;
          v18 -= v19;
          if (!v18)
          {
            uint64_t v7 = 0;
            goto LABEL_40;
          }
        }
        uint64_t v7 = 72;
      }
LABEL_40:
      LODWORD(v14) = v14 + 1;
    }
    while (v14 != v13);
    LODWORD(v14) = v13;
  }
  if (v14 <= 1)
  {
    uint64_t v20 = v13;
    do
    {
      uint64_t v21 = v20;
      *(_DWORD *)(a3 + 4 * v20 + 8) = 0;
      uint64_t v20 = 1;
    }
    while (!v21);
  }
  unsigned int __dst = 0;
  if (v7 || (uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0), v7))
  {
LABEL_11:
    uint64_t v10 = a3 + 8;
    if ((*(unsigned char *)(a3 + 8) & 1) == 0)
    {
      LODWORD(v11) = 0;
      goto LABEL_77;
    }
    goto LABEL_76;
  }
  if (bswap32(__dst) > a2 - 4 * (int)v13 - 20) {
    return 22;
  }
  uint64_t v10 = a3 + 8;
  int v22 = *(_DWORD *)(a3 + 8);
  if (v22)
  {
    unsigned int __dst = 0;
    uint64_t v23 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v23)
    {
      unsigned int v133 = __dst;
      if (__dst)
      {
        unsigned int __dst = 0;
        *(_DWORD *)(a3 + 16) = 0;
        uint64_t v23 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
        if (v23) {
          goto LABEL_75;
        }
        *(_DWORD *)(a3 + 16) = bswap32(__dst);
        unsigned int v134 = 1;
      }
      else
      {
        unsigned int v134 = 0;
      }
      unsigned int v135 = bswap32(v133);
      if (v134 >= v135)
      {
        if (!v133) {
          *(_DWORD *)(a3 + 16) = 0;
        }
        unsigned int __dst = 0;
      }
      else
      {
        uint64_t v7 = 0;
        do
        {
          if (!v7)
          {
            unint64_t v136 = *(void *)(a1 + 32);
            unint64_t v137 = 4;
            while (v136)
            {
              if (v136 >= v137) {
                unint64_t v138 = v137;
              }
              else {
                unint64_t v138 = v136;
              }
              v136 -= v138;
              *(void *)(a1 + 24) += v138;
              *(void *)(a1 + 32) = v136;
              v137 -= v138;
              if (!v137)
              {
                uint64_t v7 = 0;
                goto LABEL_512;
              }
            }
            uint64_t v7 = 72;
          }
LABEL_512:
          ++v134;
        }
        while (v134 != v135);
        unsigned int __dst = 0;
        if (v7) {
          goto LABEL_76;
        }
      }
      uint64_t v23 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v23)
      {
        unsigned int v139 = __dst;
        if (__dst)
        {
          unsigned int __dst = 0;
          *(_DWORD *)(a3 + 20) = 0;
          uint64_t v23 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
          if (v23) {
            goto LABEL_75;
          }
          *(_DWORD *)(a3 + 20) = bswap32(__dst);
          unsigned int v140 = 1;
        }
        else
        {
          unsigned int v140 = 0;
        }
        LODWORD(v11) = bswap32(v139);
        if (v140 >= v11)
        {
          uint64_t v7 = 0;
          if (!v139) {
            *(_DWORD *)(a3 + 20) = 0;
          }
        }
        else
        {
          uint64_t v7 = 0;
          do
          {
            if (!v7)
            {
              unint64_t v141 = *(void *)(a1 + 32);
              unint64_t v142 = 4;
              while (v141)
              {
                if (v141 >= v142) {
                  unint64_t v143 = v142;
                }
                else {
                  unint64_t v143 = v141;
                }
                v141 -= v143;
                *(void *)(a1 + 24) += v143;
                *(void *)(a1 + 32) = v141;
                v142 -= v143;
                if (!v142)
                {
                  uint64_t v7 = 0;
                  goto LABEL_543;
                }
              }
              uint64_t v7 = 72;
            }
LABEL_543:
            ++v140;
          }
          while (v140 != v11);
        }
LABEL_77:
        int v24 = *(_DWORD *)v10;
        if ((*(_DWORD *)v10 & 2) == 0)
        {
          if ((v24 & 4) == 0) {
            goto LABEL_79;
          }
          goto LABEL_95;
        }
        unsigned int __dst = 0;
        *(_DWORD *)(a3 + 48) = 0;
        uint64_t v25 = (_DWORD *)(a3 + 48);
        if (v7)
        {
LABEL_94:
          int v24 = *(_DWORD *)v10;
          if ((*(_DWORD *)v10 & 4) == 0)
          {
LABEL_79:
            if ((v24 & 0x8000000) == 0) {
              goto LABEL_80;
            }
            goto LABEL_99;
          }
LABEL_95:
          unsigned int __dst = 0;
          *(_DWORD *)(a3 + 52) = 0;
          uint64_t v26 = (_DWORD *)(a3 + 52);
          if (v7) {
            goto LABEL_98;
          }
          goto LABEL_96;
        }
LABEL_92:
        uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
        if (!v7) {
          *uint64_t v25 = bswap32(__dst);
        }
        goto LABEL_94;
      }
    }
LABEL_75:
    uint64_t v7 = v23;
LABEL_76:
    LODWORD(v11) = 1;
    goto LABEL_77;
  }
  if ((v22 & 2) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 48) = 0;
    uint64_t v25 = (_DWORD *)(a3 + 48);
    goto LABEL_92;
  }
  if ((v22 & 4) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 52) = 0;
    uint64_t v26 = (_DWORD *)(a3 + 52);
LABEL_96:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *uint64_t v26 = bswap32(__dst);
    }
LABEL_98:
    int v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x8000000) == 0)
    {
LABEL_80:
      if ((v24 & 8) == 0) {
        goto LABEL_81;
      }
      goto LABEL_104;
    }
LABEL_99:
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 56) = 0;
    if (v7) {
      goto LABEL_102;
    }
    goto LABEL_100;
  }
  if ((v22 & 0x8000000) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 56) = 0;
LABEL_100:
    uint64_t v27 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v27)
    {
      unsigned int v39 = bswap32(__dst);
      unsigned int __dst = 0;
      *(void *)(a3 + 56) = v39;
      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7) {
        *(_DWORD *)(a3 + 60) = bswap32(__dst);
      }
LABEL_103:
      int v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 8) == 0)
      {
LABEL_81:
        if ((v24 & 0x10) == 0) {
          goto LABEL_82;
        }
        goto LABEL_108;
      }
LABEL_104:
      unsigned int __dst = 0;
      *(_DWORD *)(a3 + 64) = 0;
      uint64_t v28 = (_DWORD *)(a3 + 64);
      if (v7) {
        goto LABEL_107;
      }
      goto LABEL_105;
    }
    uint64_t v7 = v27;
LABEL_102:
    *(_DWORD *)(a3 + 60) = 0;
    goto LABEL_103;
  }
  if ((v22 & 8) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 64) = 0;
    uint64_t v28 = (_DWORD *)(a3 + 64);
LABEL_105:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *uint64_t v28 = bswap32(__dst);
    }
LABEL_107:
    int v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x10) == 0)
    {
LABEL_82:
      if ((v24 & 0x20) == 0) {
        goto LABEL_83;
      }
      goto LABEL_112;
    }
LABEL_108:
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 68) = 0;
    uint64_t v29 = (_DWORD *)(a3 + 68);
    if (v7) {
      goto LABEL_111;
    }
    goto LABEL_109;
  }
  if ((v22 & 0x10) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 68) = 0;
    uint64_t v29 = (_DWORD *)(a3 + 68);
LABEL_109:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *uint64_t v29 = bswap32(__dst);
    }
LABEL_111:
    int v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x20) == 0)
    {
LABEL_83:
      if ((v24 & 0x40) == 0) {
        goto LABEL_84;
      }
      goto LABEL_116;
    }
LABEL_112:
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 72) = 0;
    uint64_t v30 = (_DWORD *)(a3 + 72);
    if (v7) {
      goto LABEL_115;
    }
    goto LABEL_113;
  }
  if ((v22 & 0x20) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 72) = 0;
    uint64_t v30 = (_DWORD *)(a3 + 72);
LABEL_113:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *uint64_t v30 = bswap32(__dst);
    }
LABEL_115:
    int v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x40) == 0)
    {
LABEL_84:
      if ((v24 & 0x80) == 0) {
        goto LABEL_85;
      }
      goto LABEL_120;
    }
LABEL_116:
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 76) = 0;
    uint64_t v31 = (_DWORD *)(a3 + 76);
    if (v7) {
      goto LABEL_119;
    }
    goto LABEL_117;
  }
  if ((v22 & 0x40) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 76) = 0;
    uint64_t v31 = (_DWORD *)(a3 + 76);
LABEL_117:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *uint64_t v31 = bswap32(__dst);
    }
LABEL_119:
    int v24 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x80) == 0)
    {
LABEL_85:
      if ((v24 & 0x100) == 0) {
        goto LABEL_86;
      }
      goto LABEL_125;
    }
LABEL_120:
    unsigned int __dst = 0;
    *(void *)(a3 + 80) = 0;
    if (v7) {
      goto LABEL_123;
    }
    goto LABEL_121;
  }
  if ((v22 & 0x80) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(void *)(a3 + 80) = 0;
LABEL_121:
    uint64_t v32 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v32)
    {
      uint64_t v40 = bswap32(__dst);
      unsigned int __dst = 0;
      *(void *)(a3 + 80) = v40;
      *(void *)(a3 + 88) = 0;
      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7) {
        *(void *)(a3 + 88) = bswap32(__dst);
      }
LABEL_124:
      int v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x100) == 0)
      {
LABEL_86:
        if ((v24 & 0x200) == 0) {
          goto LABEL_87;
        }
        goto LABEL_130;
      }
LABEL_125:
      unsigned int __dst = 0;
      *(void *)(a3 + 96) = 0;
      if (v7) {
        goto LABEL_128;
      }
      goto LABEL_126;
    }
    uint64_t v7 = v32;
LABEL_123:
    *(void *)(a3 + 88) = 0;
    goto LABEL_124;
  }
  if ((v22 & 0x100) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(void *)(a3 + 96) = 0;
LABEL_126:
    uint64_t v33 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v33)
    {
      uint64_t v41 = bswap32(__dst);
      unsigned int __dst = 0;
      *(void *)(a3 + 96) = v41;
      *(void *)(a3 + 104) = 0;
      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7) {
        *(void *)(a3 + 104) = bswap32(__dst);
      }
LABEL_129:
      int v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x200) == 0)
      {
LABEL_87:
        if ((v24 & 0x400) == 0) {
          goto LABEL_88;
        }
        goto LABEL_135;
      }
LABEL_130:
      unsigned int __dst = 0;
      *(void *)(a3 + 112) = 0;
      if (v7) {
        goto LABEL_133;
      }
      goto LABEL_131;
    }
    uint64_t v7 = v33;
LABEL_128:
    *(void *)(a3 + 104) = 0;
    goto LABEL_129;
  }
  if ((v22 & 0x200) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(void *)(a3 + 112) = 0;
LABEL_131:
    uint64_t v34 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v34)
    {
      uint64_t v42 = bswap32(__dst);
      unsigned int __dst = 0;
      *(void *)(a3 + 112) = v42;
      *(void *)(a3 + 120) = 0;
      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7) {
        *(void *)(a3 + 120) = bswap32(__dst);
      }
LABEL_134:
      int v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x400) == 0)
      {
LABEL_88:
        if ((v24 & 0x800) == 0) {
          goto LABEL_89;
        }
        goto LABEL_140;
      }
LABEL_135:
      unsigned int __dst = 0;
      *(void *)(a3 + 128) = 0;
      if (v7) {
        goto LABEL_138;
      }
      goto LABEL_136;
    }
    uint64_t v7 = v34;
LABEL_133:
    *(void *)(a3 + 120) = 0;
    goto LABEL_134;
  }
  if ((v22 & 0x400) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(void *)(a3 + 128) = 0;
LABEL_136:
    uint64_t v35 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v35)
    {
      uint64_t v43 = bswap32(__dst);
      unsigned int __dst = 0;
      *(void *)(a3 + 128) = v43;
      *(void *)(a3 + 136) = 0;
      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7) {
        *(void *)(a3 + 136) = bswap32(__dst);
      }
LABEL_139:
      int v24 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x800) == 0)
      {
LABEL_89:
        if ((v24 & 0x1000) == 0) {
          goto LABEL_164;
        }
        goto LABEL_144;
      }
LABEL_140:
      unsigned int __dst = 0;
      *(_DWORD *)(a3 + 176) = 0;
      uint64_t v36 = (_DWORD *)(a3 + 176);
      if (v7) {
        goto LABEL_143;
      }
      goto LABEL_141;
    }
    uint64_t v7 = v35;
LABEL_138:
    *(void *)(a3 + 136) = 0;
    goto LABEL_139;
  }
  if ((v22 & 0x800) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 176) = 0;
    uint64_t v36 = (_DWORD *)(a3 + 176);
LABEL_141:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *uint64_t v36 = bswap32(__dst);
    }
LABEL_143:
    if ((*(_DWORD *)v10 & 0x1000) == 0) {
      goto LABEL_164;
    }
LABEL_144:
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 180) = 0;
    uint64_t v37 = (int *)(a3 + 180);
    if (v7) {
      goto LABEL_164;
    }
    goto LABEL_145;
  }
  if ((v22 & 0x1000) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 180) = 0;
    uint64_t v37 = (int *)(a3 + 180);
LABEL_145:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (v7)
    {
      int v38 = *v37;
    }
    else
    {
      int v38 = bswap32(__dst);
      *uint64_t v37 = v38;
    }
    if (v38 >= 1)
    {
      uint64_t v44 = 0;
      uint64_t v45 = a3 + 184;
      do
      {
        unsigned int __dst = 0;
        *(_DWORD *)(v45 + 4 * v44) = 0;
        if (!v7)
        {
          uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
          if (!v7) {
            *(_DWORD *)(v45 + 4 * v44) = bswap32(__dst);
          }
        }
        ++v44;
      }
      while (v44 < *v37);
    }
LABEL_164:
    if ((*(unsigned char *)(v10 + 3) & 0x10) == 0) {
      goto LABEL_175;
    }
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 204) = 0;
    long long v46 = (_DWORD *)(a3 + 204);
    if (v7) {
      goto LABEL_168;
    }
    goto LABEL_166;
  }
  if ((v22 & 0x10000000) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 204) = 0;
    long long v46 = (_DWORD *)(a3 + 204);
LABEL_166:
    uint64_t v47 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v47)
    {
      unsigned int v62 = bswap32(__dst);
      unsigned int __dst = 0;
      *(void *)(a3 + 204) = v62;
      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7) {
        *(_DWORD *)(a3 + 208) = bswap32(__dst);
      }
      goto LABEL_169;
    }
    uint64_t v7 = v47;
LABEL_168:
    *(_DWORD *)(a3 + 208) = 0;
LABEL_169:
    if (*v46)
    {
      unint64_t v48 = 0;
      uint64_t v49 = a3 + 212;
      do
      {
        unsigned int __dst = 0;
        *(_DWORD *)(v49 + 4 * v48) = 0;
        if (!v7)
        {
          uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
          if (!v7) {
            *(_DWORD *)(v49 + 4 * v48) = bswap32(__dst);
          }
        }
        ++v48;
      }
      while (v48 < *v46);
    }
LABEL_175:
    int v50 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x2000) == 0)
    {
      if ((v50 & 0x4000) == 0) {
        goto LABEL_177;
      }
      goto LABEL_188;
    }
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 224) = 0;
    long long v51 = (_DWORD *)(a3 + 224);
    if (v7)
    {
LABEL_187:
      int v50 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x4000) == 0)
      {
LABEL_177:
        if ((v50 & 0x8000) == 0) {
          goto LABEL_178;
        }
        goto LABEL_193;
      }
LABEL_188:
      unsigned int __dst = 0;
      if (v7) {
        goto LABEL_191;
      }
      goto LABEL_189;
    }
LABEL_185:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *long long v51 = bswap32(__dst);
    }
    goto LABEL_187;
  }
  if ((v22 & 0x2000) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 224) = 0;
    long long v51 = (_DWORD *)(a3 + 224);
    goto LABEL_185;
  }
  if ((v22 & 0x4000) != 0)
  {
    unsigned int __dst = 0;
LABEL_189:
    uint64_t v52 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v52)
    {
      LODWORD(v11) = bswap32(__dst);
      if (v11 <= 0xF) {
        uint64_t v7 = sub_100003C84(a1, (char *)(a3 + 228), v11, 0);
      }
      else {
        uint64_t v7 = 72;
      }
LABEL_192:
      *(unsigned char *)(a3 + v11 + 228) = 0;
      int v50 = *(_DWORD *)(a3 + 8);
      if ((v50 & 0x8000) == 0)
      {
LABEL_178:
        if ((v50 & 0x10000) == 0) {
          goto LABEL_179;
        }
        goto LABEL_197;
      }
LABEL_193:
      unsigned int __dst = 0;
      *(_DWORD *)(a3 + 244) = 0;
      long long v53 = (_DWORD *)(a3 + 244);
      if (v7) {
        goto LABEL_196;
      }
      goto LABEL_194;
    }
    uint64_t v7 = v52;
LABEL_191:
    LODWORD(v11) = 0;
    goto LABEL_192;
  }
  if ((v22 & 0x8000) != 0)
  {
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 244) = 0;
    long long v53 = (_DWORD *)(a3 + 244);
LABEL_194:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      *long long v53 = bswap32(__dst);
    }
LABEL_196:
    int v50 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x10000) == 0)
    {
LABEL_179:
      if ((v50 & 0x20000) == 0) {
        goto LABEL_180;
      }
LABEL_201:
      unsigned int __dst = 0;
      *(void *)(a3 + 272) = 0;
      if (v7) {
        goto LABEL_204;
      }
      goto LABEL_202;
    }
LABEL_197:
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 248) = 0;
    long long v54 = (_DWORD *)(a3 + 248);
    if (v7) {
      goto LABEL_200;
    }
    goto LABEL_198;
  }
  if ((v22 & 0x10000) == 0)
  {
    if ((v22 & 0x20000) == 0)
    {
      if ((v22 & 0x40000) == 0)
      {
        if ((v22 & 0x80000) == 0)
        {
          if ((v22 & 0x100000) == 0)
          {
            if ((v22 & 0x200000) == 0)
            {
              uint64_t v7 = 0;
              goto LABEL_354;
            }
            LODWORD(v11) = 0;
            unsigned int __dst = 0;
            long long v60 = (_DWORD *)(a3 + 452);
            *(_DWORD *)(a3 + 452) = 0;
            goto LABEL_223;
          }
          LODWORD(v11) = 0;
          unsigned int __dst = 0;
          *(_DWORD *)(a3 + 320) = 0;
          goto LABEL_217;
        }
        LODWORD(v11) = 0;
        unsigned int __dst = 0;
        *(void *)(a3 + 304) = 0;
LABEL_212:
        uint64_t v57 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
        if (!v57)
        {
          uint64_t v64 = bswap32(__dst);
          unsigned int __dst = 0;
          *(void *)(a3 + 304) = v64;
          *(void *)(a3 + 312) = 0;
          uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
          if (!v7) {
            *(void *)(a3 + 312) = bswap32(__dst);
          }
LABEL_215:
          if ((*(_DWORD *)v10 & 0x100000) == 0) {
            goto LABEL_220;
          }
LABEL_216:
          unsigned int __dst = 0;
          *(_DWORD *)(a3 + 320) = 0;
          if (v7) {
            goto LABEL_220;
          }
LABEL_217:
          uint64_t v58 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
          if (!v58)
          {
            unsigned int v59 = bswap32(__dst);
            *(_DWORD *)(a3 + 320) = v59;
            uint64_t v58 = sub_100003C84(a1, (char *)(a3 + 324), v59, 0);
          }
          uint64_t v7 = v58;
          goto LABEL_220;
        }
        uint64_t v7 = v57;
LABEL_214:
        *(void *)(a3 + 312) = 0;
        goto LABEL_215;
      }
      LODWORD(v11) = 0;
      unsigned int __dst = 0;
      long long v56 = (_DWORD *)(a3 + 288);
      *(_DWORD *)(a3 + 288) = 0;
      goto LABEL_208;
    }
    LODWORD(v11) = 0;
    unsigned int __dst = 0;
    *(void *)(a3 + 272) = 0;
LABEL_202:
    uint64_t v55 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v55)
    {
      uint64_t v63 = bswap32(__dst);
      unsigned int __dst = 0;
      *(void *)(a3 + 272) = v63;
      *(void *)(a3 + 280) = 0;
      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7) {
        *(void *)(a3 + 280) = bswap32(__dst);
      }
LABEL_205:
      int v50 = *(_DWORD *)v10;
      if ((*(_DWORD *)v10 & 0x40000) == 0)
      {
LABEL_181:
        if ((v50 & 0x80000) == 0) {
          goto LABEL_182;
        }
LABEL_211:
        unsigned int __dst = 0;
        *(void *)(a3 + 304) = 0;
        if (v7) {
          goto LABEL_214;
        }
        goto LABEL_212;
      }
      goto LABEL_206;
    }
    uint64_t v7 = v55;
LABEL_204:
    *(void *)(a3 + 280) = 0;
    goto LABEL_205;
  }
  LODWORD(v11) = 0;
  unsigned int __dst = 0;
  *(_DWORD *)(a3 + 248) = 0;
  long long v54 = (_DWORD *)(a3 + 248);
LABEL_198:
  uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
  if (!v7) {
    *long long v54 = bswap32(__dst);
  }
LABEL_200:
  int v50 = *(_DWORD *)v10;
  if ((*(_DWORD *)v10 & 0x20000) != 0) {
    goto LABEL_201;
  }
LABEL_180:
  if ((v50 & 0x40000) == 0) {
    goto LABEL_181;
  }
LABEL_206:
  unsigned int __dst = 0;
  *(_DWORD *)(a3 + 288) = 0;
  if (v7) {
    goto LABEL_210;
  }
  long long v56 = (_DWORD *)(a3 + 288);
LABEL_208:
  uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
  if (!v7) {
    *long long v56 = bswap32(__dst);
  }
LABEL_210:
  int v50 = *(_DWORD *)v10;
  if ((*(_DWORD *)v10 & 0x80000) != 0) {
    goto LABEL_211;
  }
LABEL_182:
  if ((v50 & 0x100000) != 0) {
    goto LABEL_216;
  }
LABEL_220:
  if ((*(unsigned char *)(v10 + 2) & 0x20) == 0 || (unsigned int __dst = 0, *(_DWORD *)(a3 + 452) = 0, v7))
  {
LABEL_354:
    int v103 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x400000) == 0) {
      goto LABEL_359;
    }
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 4) = 0;
    v104 = (_DWORD *)(a3 + 4);
    if (!v7) {
      goto LABEL_356;
    }
LABEL_358:
    int v103 = *(_DWORD *)v10;
LABEL_359:
    if ((v103 & 0x800000) == 0) {
      goto LABEL_368;
    }
    unsigned int __dst = 0;
    if (v7) {
      goto LABEL_362;
    }
    goto LABEL_361;
  }
  long long v60 = (_DWORD *)(a3 + 452);
LABEL_223:
  uint64_t v61 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
  if (v61)
  {
LABEL_224:
    uint64_t v7 = v61;
    goto LABEL_354;
  }
  unsigned int v65 = __dst;
  size_t v66 = bswap32(__dst);
  *long long v60 = v66;
  if (v66 > 0xFF)
  {
    uint64_t v7 = 22;
    goto LABEL_354;
  }
  if (v65)
  {
    long long v67 = malloc_type_calloc(v66, 0x18uLL, 0x10A00404E934A1DuLL);
    *(void *)(a3 + 456) = v67;
    if (!v67)
    {
LABEL_353:
      uint64_t v7 = 12;
      goto LABEL_354;
    }
  }
  if (!*(_DWORD *)(a3 + 452))
  {
LABEL_340:
    int v100 = *(_DWORD *)v10;
    if ((*(_DWORD *)v10 & 0x400000) == 0)
    {
      if ((v100 & 0x800000) == 0)
      {
        if ((v100 & 0x1000000) == 0)
        {
          if ((v100 & 0x2000000) == 0)
          {
            if ((v100 & 0x4000000) == 0)
            {
              if ((v100 & 0x20000000) == 0)
              {
                if ((v100 & 0x40000000) == 0)
                {
                  if ((v100 & 0x80000000) == 0)
                  {
                    v102 = (int *)(a3 + 12);
                    int v101 = *(_DWORD *)(a3 + 12);
                    if ((v101 & 1) == 0)
                    {
                      if ((v101 & 2) == 0)
                      {
                        if ((v101 & 4) == 0)
                        {
                          if ((v101 & 8) == 0) {
                            return 0;
                          }
                          unsigned int __dst = 0;
                          v128 = (_DWORD *)(a3 + 296);
                          *(_DWORD *)(a3 + 296) = 0;
LABEL_446:
                          uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                          if (!v7) {
                            _DWORD *v128 = bswap32(__dst);
                          }
LABEL_448:
                          if (v7) {
                            goto LABEL_449;
                          }
                          return v7;
                        }
                        unsigned int __dst = 0;
                        *(void *)(a3 + 160) = 0;
LABEL_440:
                        uint64_t v127 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                        if (!v127)
                        {
                          uint64_t v130 = bswap32(__dst);
                          unsigned int __dst = 0;
                          *(void *)(a3 + 160) = v130;
                          *(void *)(a3 + 168) = 0;
                          uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                          if (!v7) {
                            *(void *)(a3 + 168) = bswap32(__dst);
                          }
LABEL_443:
                          if ((*v102 & 8) == 0) {
                            goto LABEL_448;
                          }
LABEL_444:
                          unsigned int __dst = 0;
                          *(_DWORD *)(a3 + 296) = 0;
                          if (v7) {
                            goto LABEL_448;
                          }
                          v128 = (_DWORD *)(a3 + 296);
                          goto LABEL_446;
                        }
                        uint64_t v7 = v127;
LABEL_442:
                        *(void *)(a3 + 168) = 0;
                        goto LABEL_443;
                      }
                      unsigned int __dst = 0;
                      *(void *)(a3 + 144) = 0;
LABEL_435:
                      uint64_t v126 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                      if (!v126)
                      {
                        uint64_t v129 = bswap32(__dst);
                        unsigned int __dst = 0;
                        *(void *)(a3 + 144) = v129;
                        *(void *)(a3 + 152) = 0;
                        uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                        if (!v7) {
                          *(void *)(a3 + 152) = bswap32(__dst);
                        }
LABEL_438:
                        int v124 = *v102;
                        if ((*v102 & 4) == 0)
                        {
LABEL_427:
                          if ((v124 & 8) == 0) {
                            goto LABEL_448;
                          }
                          goto LABEL_444;
                        }
LABEL_439:
                        unsigned int __dst = 0;
                        *(void *)(a3 + 160) = 0;
                        if (v7) {
                          goto LABEL_442;
                        }
                        goto LABEL_440;
                      }
                      uint64_t v7 = v126;
LABEL_437:
                      *(void *)(a3 + 152) = 0;
                      goto LABEL_438;
                    }
                    unsigned int __dst = 0;
                    v125 = (_DWORD *)(a3 + 292);
                    *(_DWORD *)(a3 + 292) = 0;
                    goto LABEL_431;
                  }
                  unsigned int __dst = 0;
                  v123 = (_DWORD *)(a3 + 472);
                  *(_DWORD *)(a3 + 472) = 0;
                  goto LABEL_422;
                }
                unsigned int __dst = 0;
LABEL_410:
                int v120 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                if (!v120)
                {
                  unsigned int v121 = bswap32(__dst);
                  if (v121 - 105 >= 0xFFFFFF98) {
                    LODWORD(v7) = 0;
                  }
                  else {
                    LODWORD(v7) = 22;
                  }
LABEL_413:
                  v122 = (char *)malloc_type_calloc(v121 + 1, 1uLL, 0x100004077774924uLL);
                  *(void *)(a3 + 264) = v122;
                  if (v122) {
                    uint64_t v7 = v7;
                  }
                  else {
                    uint64_t v7 = 12;
                  }
                  if (!v7) {
                    uint64_t v7 = sub_100003C84(a1, v122, v121, 0);
                  }
                  int v119 = *(_DWORD *)v10;
LABEL_419:
                  if (v119 < 0)
                  {
                    unsigned int __dst = 0;
                    *(_DWORD *)(a3 + 472) = 0;
                    if (!v7)
                    {
                      v123 = (_DWORD *)(a3 + 472);
LABEL_422:
                      uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                      if (!v7) {
                        _DWORD *v123 = bswap32(__dst);
                      }
                    }
                  }
LABEL_424:
                  v102 = (int *)(a3 + 12);
                  int v124 = *(_DWORD *)(a3 + 12);
                  if ((v124 & 1) == 0)
                  {
                    if ((v124 & 2) == 0) {
                      goto LABEL_426;
                    }
                    goto LABEL_434;
                  }
                  unsigned int __dst = 0;
                  *(_DWORD *)(a3 + 292) = 0;
                  if (v7)
                  {
LABEL_433:
                    int v124 = *v102;
                    if ((*v102 & 2) == 0)
                    {
LABEL_426:
                      if ((v124 & 4) == 0) {
                        goto LABEL_427;
                      }
                      goto LABEL_439;
                    }
LABEL_434:
                    unsigned int __dst = 0;
                    *(void *)(a3 + 144) = 0;
                    if (v7) {
                      goto LABEL_437;
                    }
                    goto LABEL_435;
                  }
                  v125 = (_DWORD *)(a3 + 292);
LABEL_431:
                  uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
                  if (!v7) {
                    _DWORD *v125 = bswap32(__dst);
                  }
                  goto LABEL_433;
                }
                LODWORD(v7) = v120;
LABEL_412:
                unsigned int v121 = 0;
                goto LABEL_413;
              }
              unsigned int __dst = 0;
LABEL_400:
              int v116 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
              if (!v116)
              {
                unsigned int v117 = bswap32(__dst);
                if (v117 - 105 >= 0xFFFFFF98) {
                  LODWORD(v7) = 0;
                }
                else {
                  LODWORD(v7) = 22;
                }
                goto LABEL_403;
              }
              LODWORD(v7) = v116;
LABEL_402:
              unsigned int v117 = 0;
LABEL_403:
              v118 = (char *)malloc_type_calloc(v117 + 1, 1uLL, 0x100004077774924uLL);
              *(void *)(a3 + 256) = v118;
              if (v118) {
                uint64_t v7 = v7;
              }
              else {
                uint64_t v7 = 12;
              }
              if (!v7) {
                uint64_t v7 = sub_100003C84(a1, v118, v117, 0);
              }
LABEL_408:
              int v119 = *(_DWORD *)v10;
              if ((*(_DWORD *)v10 & 0x40000000) == 0) {
                goto LABEL_419;
              }
              unsigned int __dst = 0;
              if (v7) {
                goto LABEL_412;
              }
              goto LABEL_410;
            }
            unsigned int __dst = 0;
LABEL_390:
            int v113 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
            if (!v113)
            {
              unsigned int v114 = bswap32(__dst);
              if (v114 - 1025 >= 0xFFFFFC00) {
                LODWORD(v7) = 0;
              }
              else {
                LODWORD(v7) = 22;
              }
              goto LABEL_393;
            }
            LODWORD(v7) = v113;
LABEL_392:
            unsigned int v114 = 0;
LABEL_393:
            v115 = (char *)malloc_type_calloc(v114 + 1, 1uLL, 0x100004077774924uLL);
            *(void *)(a3 + 40) = v115;
            if (v115) {
              uint64_t v7 = v7;
            }
            else {
              uint64_t v7 = 12;
            }
            if (!v7) {
              uint64_t v7 = sub_100003C84(a1, v115, v114, 0);
            }
LABEL_398:
            if ((*(unsigned char *)(v10 + 3) & 0x20) == 0) {
              goto LABEL_408;
            }
            unsigned int __dst = 0;
            if (v7) {
              goto LABEL_402;
            }
            goto LABEL_400;
          }
          unsigned int __dst = 0;
LABEL_380:
          int v110 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
          if (!v110)
          {
            unsigned int v111 = bswap32(__dst);
            if (v111 - 1025 >= 0xFFFFFC00) {
              LODWORD(v7) = 0;
            }
            else {
              LODWORD(v7) = 22;
            }
            goto LABEL_383;
          }
          LODWORD(v7) = v110;
LABEL_382:
          unsigned int v111 = 0;
LABEL_383:
          v112 = (char *)malloc_type_calloc(v111 + 1, 1uLL, 0x100004077774924uLL);
          *(void *)(a3 + 32) = v112;
          if (v112) {
            uint64_t v7 = v7;
          }
          else {
            uint64_t v7 = 12;
          }
          if (!v7) {
            uint64_t v7 = sub_100003C84(a1, v112, v111, 0);
          }
LABEL_388:
          if ((*(unsigned char *)(v10 + 3) & 4) == 0) {
            goto LABEL_398;
          }
          unsigned int __dst = 0;
          if (v7) {
            goto LABEL_392;
          }
          goto LABEL_390;
        }
        unsigned int __dst = 0;
LABEL_370:
        int v107 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
        if (!v107)
        {
          unsigned int v108 = bswap32(__dst);
          if (v108 - 1025 >= 0xFFFFFC00) {
            LODWORD(v7) = 0;
          }
          else {
            LODWORD(v7) = 22;
          }
          goto LABEL_373;
        }
        LODWORD(v7) = v107;
LABEL_372:
        unsigned int v108 = 0;
LABEL_373:
        v109 = (char *)malloc_type_calloc(v108 + 1, 1uLL, 0x100004077774924uLL);
        *(void *)(a3 + 24) = v109;
        if (v109) {
          uint64_t v7 = v7;
        }
        else {
          uint64_t v7 = 12;
        }
        if (!v7) {
          uint64_t v7 = sub_100003C84(a1, v109, v108, 0);
        }
LABEL_378:
        if ((*(unsigned char *)(v10 + 3) & 2) == 0) {
          goto LABEL_388;
        }
        unsigned int __dst = 0;
        if (v7) {
          goto LABEL_382;
        }
        goto LABEL_380;
      }
      unsigned int __dst = 0;
LABEL_361:
      LODWORD(v7) = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (!v7)
      {
        unsigned int v105 = bswap32(__dst);
        v106 = (char *)malloc_type_calloc(1uLL, v105 + 1, 0x6704365AuLL);
        *(void *)(a3 + 464) = v106;
LABEL_363:
        if (v106) {
          uint64_t v7 = v7;
        }
        else {
          uint64_t v7 = 12;
        }
        if (!v7) {
          uint64_t v7 = sub_100003C84(a1, v106, v105, 0);
        }
LABEL_368:
        if ((*(unsigned char *)(v10 + 3) & 1) == 0) {
          goto LABEL_378;
        }
        unsigned int __dst = 0;
        if (v7) {
          goto LABEL_372;
        }
        goto LABEL_370;
      }
LABEL_362:
      unsigned int v105 = 0;
      v106 = *(char **)(a3 + 464);
      goto LABEL_363;
    }
    unsigned int __dst = 0;
    *(_DWORD *)(a3 + 4) = 0;
    v104 = (_DWORD *)(a3 + 4);
LABEL_356:
    uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v7) {
      _DWORD *v104 = bswap32(__dst);
    }
    goto LABEL_358;
  }
  uint64_t v68 = 0;
  while (1)
  {
    unsigned int __dst = 0;
    *(_DWORD *)(*(void *)(a3 + 456) + 24 * v68 + 16) = 0;
    unsigned int v69 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (v69) {
      goto LABEL_301;
    }
    unsigned int v70 = bswap32(__dst);
    *(_DWORD *)(*(void *)(a3 + 456) + 24 * v68 + 16) = v70;
    if (v70 > 0xFF)
    {
      unsigned int v69 = 22;
      goto LABEL_301;
    }
    if (v70)
    {
      long long v71 = malloc_type_calloc(v70, 0x18uLL, 0x1090040BD55ACEDuLL);
      *(void *)(*(void *)(a3 + 456) + 24 * v68) = v71;
      if (!v71)
      {
        unsigned int v69 = 12;
        goto LABEL_301;
      }
    }
    uint64_t v72 = *(void *)(a3 + 456);
    if (!*(_DWORD *)(v72 + 24 * v68 + 16)) {
      goto LABEL_291;
    }
    unint64_t v73 = 0;
    do
    {
      unsigned int __dst = 0;
      unsigned int v69 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (v69)
      {
        uint64_t v79 = *(void *)(a3 + 456);
        goto LABEL_299;
      }
      unsigned int v74 = bswap32(__dst);
      if (v74 > 0x400) {
        unsigned int v69 = 22;
      }
      if (v69) {
        BOOL v75 = 1;
      }
      else {
        BOOL v75 = __dst == 0;
      }
      if (!v75)
      {
        uint64_t v78 = (char *)malloc_type_calloc(1uLL, v74 + 1, 0xAC826010uLL);
        uint64_t v77 = v78;
        uint64_t v79 = *(void *)(a3 + 456);
        *(void *)(*(void *)(v79 + 24 * v68) + 24 * v73) = v78;
        if (v78) {
          goto LABEL_258;
        }
        unsigned int v69 = 12;
LABEL_299:
        *(_DWORD *)(*(void *)(v79 + 24 * v68) + 24 * v73 + 16) = 0;
        goto LABEL_300;
      }
      uint64_t v76 = *(void *)(a3 + 456);
      if (v69) {
        goto LABEL_259;
      }
      uint64_t v77 = *(char **)(*(void *)(v76 + 24 * v68) + 24 * v73);
LABEL_258:
      unsigned int v69 = sub_100003C84(a1, v77, v74, 0);
      uint64_t v76 = *(void *)(a3 + 456);
LABEL_259:
      unsigned int __dst = 0;
      *(_DWORD *)(*(void *)(v76 + 24 * v68) + 24 * v73 + 16) = 0;
      if (v69) {
        goto LABEL_300;
      }
      unsigned int v69 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (v69) {
        goto LABEL_300;
      }
      unsigned int v80 = bswap32(__dst);
      *(_DWORD *)(*(void *)(*(void *)(a3 + 456) + 24 * v68) + 24 * v73 + 16) = v80;
      if (v80 > 0xFF)
      {
        unsigned int v69 = 22;
        goto LABEL_300;
      }
      if (v80)
      {
        uint64_t v81 = malloc_type_calloc(v80, 8uLL, 0x10040436913F5uLL);
        *(void *)(*(void *)(*(void *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) = v81;
        if (!v81)
        {
LABEL_294:
          unsigned int v69 = 12;
LABEL_300:
          LODWORD(v11) = 0;
          goto LABEL_301;
        }
      }
      unint64_t v82 = 0;
      while (v82 < *(unsigned int *)(*(void *)(*(void *)(a3 + 456) + 24 * v68) + 24 * v73 + 16))
      {
        unsigned int __dst = 0;
        unsigned int v69 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
        if (v69) {
          goto LABEL_300;
        }
        unsigned int v83 = bswap32(__dst);
        if (v83 > 0xFF) {
          unsigned int v69 = 22;
        }
        if (v69) {
          BOOL v84 = 1;
        }
        else {
          BOOL v84 = __dst == 0;
        }
        if (!v84)
        {
          *(void *)(*(void *)(*(void *)(*(void *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) + 8 * v82) = malloc_type_calloc(1uLL, v83 + 1, 0x23AD49A9uLL);
          uint64_t v85 = *(char **)(*(void *)(*(void *)(*(void *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) + 8 * v82);
          if (!v85) {
            goto LABEL_294;
          }
          goto LABEL_277;
        }
        if (!v69)
        {
          uint64_t v85 = *(char **)(*(void *)(*(void *)(*(void *)(a3 + 456) + 24 * v68) + 24 * v73 + 8) + 8 * v82);
LABEL_277:
          unsigned int v69 = sub_100003C84(a1, v85, v83, 0);
        }
        ++v82;
        if (v69) {
          goto LABEL_300;
        }
      }
      unsigned int __dst = 0;
      unsigned int v69 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
      if (v69) {
        goto LABEL_300;
      }
      if (__dst)
      {
        unint64_t v11 = bswap32(__dst);
        unint64_t v86 = *(void *)(a1 + 32);
        unint64_t v87 = v11;
        while (v86)
        {
          if (v86 >= v87) {
            unint64_t v88 = v87;
          }
          else {
            unint64_t v88 = v86;
          }
          v86 -= v88;
          *(void *)(a1 + 24) += v88;
          *(void *)(a1 + 32) = v86;
          v87 -= v88;
          if (!v87) {
            goto LABEL_290;
          }
        }
        unsigned int v69 = 72;
LABEL_301:
        unsigned int v89 = 0;
LABEL_302:
        *(_DWORD *)(*(void *)(a3 + 456) + 24 * v68 + 20) = v89;
        goto LABEL_303;
      }
      LODWORD(v11) = 0;
LABEL_290:
      ++v73;
      uint64_t v72 = *(void *)(a3 + 456);
    }
    while (v73 < *(unsigned int *)(v72 + 24 * v68 + 16));
LABEL_291:
    unsigned int __dst = 0;
    *(_DWORD *)(v72 + 24 * v68 + 20) = 0;
    unsigned int v69 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (!v69)
    {
      unsigned int v89 = bswap32(__dst);
      goto LABEL_302;
    }
LABEL_303:
    if (v69) {
      BOOL v90 = 0;
    }
    else {
      BOOL v90 = v11 > 0x400;
    }
    if (v90) {
      uint64_t v7 = 22;
    }
    else {
      uint64_t v7 = v69;
    }
    if (v7) {
      goto LABEL_354;
    }
    size_t v91 = *(unsigned int *)(*(void *)(a3 + 456) + 24 * v68 + 20);
    if (v91)
    {
      uint64_t v92 = malloc_type_calloc(v91, 8uLL, 0x10040436913F5uLL);
      *(void *)(*(void *)(a3 + 456) + 24 * v68 + 8) = v92;
      if (!v92) {
        goto LABEL_353;
      }
    }
    unint64_t v93 = 0;
    while (2)
    {
      if (v93 < *(unsigned int *)(*(void *)(a3 + 456) + 24 * v68 + 20))
      {
        unsigned int __dst = 0;
        uint64_t v7 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
        if (v7) {
          goto LABEL_354;
        }
        unsigned int v94 = bswap32(__dst);
        if (v94 <= 0x400) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = 22;
        }
        if (v7) {
          BOOL v95 = 1;
        }
        else {
          BOOL v95 = __dst == 0;
        }
        if (v95)
        {
          if (!v7)
          {
            v96 = *(char **)(*(void *)(*(void *)(a3 + 456) + 24 * v68 + 8) + 8 * v93);
            goto LABEL_326;
          }
        }
        else
        {
          *(void *)(*(void *)(*(void *)(a3 + 456) + 24 * v68 + 8) + 8 * v93) = malloc_type_calloc(1uLL, v94 + 1, 0x5874FC74uLL);
          v96 = *(char **)(*(void *)(*(void *)(a3 + 456) + 24 * v68 + 8) + 8 * v93);
          if (!v96) {
            goto LABEL_353;
          }
LABEL_326:
          uint64_t v7 = sub_100003C84(a1, v96, v94, 0);
        }
        ++v93;
        if (v7) {
          goto LABEL_354;
        }
        continue;
      }
      break;
    }
    unsigned int __dst = 0;
    uint64_t v61 = sub_100003C84(a1, (char *)&__dst, 4u, 0);
    if (v61) {
      goto LABEL_224;
    }
    if (__dst) {
      break;
    }
    LODWORD(v11) = 0;
LABEL_339:
    if (++v68 >= (unint64_t)*v60) {
      goto LABEL_340;
    }
  }
  unint64_t v97 = bswap32(__dst);
  LODWORD(v11) = v97;
  unint64_t v98 = *(void *)(a1 + 32);
  while (v98)
  {
    if (v98 >= v97) {
      unint64_t v99 = v97;
    }
    else {
      unint64_t v99 = v98;
    }
    v98 -= v99;
    *(void *)(a1 + 24) += v99;
    *(void *)(a1 + 32) = v98;
    v97 -= v99;
    if (!v97) {
      goto LABEL_339;
    }
  }
  int v131 = *(_DWORD *)v10;
  if ((*(_DWORD *)v10 & 0x400000) != 0)
  {
    *(_DWORD *)(a3 + 4) = 0;
    uint64_t v7 = 72;
    goto LABEL_358;
  }
  if ((v131 & 0x800000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_362;
  }
  if ((v131 & 0x1000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_372;
  }
  if ((v131 & 0x2000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_382;
  }
  if ((v131 & 0x4000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_392;
  }
  if ((v131 & 0x20000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_402;
  }
  if ((v131 & 0x40000000) != 0)
  {
    LODWORD(v7) = 72;
    goto LABEL_412;
  }
  if (v131 < 0)
  {
    *(_DWORD *)(a3 + 472) = 0;
    uint64_t v7 = 72;
    goto LABEL_424;
  }
  v102 = (int *)(a3 + 12);
  int v132 = *(_DWORD *)(a3 + 12);
  if (v132)
  {
    *(_DWORD *)(a3 + 292) = 0;
    uint64_t v7 = 72;
    goto LABEL_433;
  }
  if ((v132 & 2) != 0)
  {
    *(void *)(a3 + 144) = 0;
    uint64_t v7 = 72;
    goto LABEL_437;
  }
  if ((v132 & 4) != 0)
  {
    *(void *)(a3 + 160) = 0;
    uint64_t v7 = 72;
    goto LABEL_442;
  }
  if ((v132 & 8) != 0) {
    *(_DWORD *)(a3 + 296) = 0;
  }
  uint64_t v7 = 72;
LABEL_449:
  sub_100006198(a3);
  return v7;
}

const char *sub_100007ED0(const char *a1)
{
  int v2 = "tcp";
  if (strcmp(a1, "tcp"))
  {
    int v2 = "udp";
    if (strcmp(a1, "udp"))
    {
      if (!strcmp(a1, "tcp4"))
      {
        return "proto=tcp";
      }
      else if (!strcmp(a1, "udp4"))
      {
        return "proto=udp";
      }
      else if (!strcmp(a1, "tcp6"))
      {
        return "proto=tcp6";
      }
      else if (!strcmp(a1, "udp6"))
      {
        return "proto=udp6";
      }
      else
      {
        int v2 = "inet4";
        if (strcmp(a1, "inet4"))
        {
          int v2 = "inet6";
          if (strcmp(a1, "inet6"))
          {
            int v2 = "inet";
            if (strcmp(a1, "inet"))
            {
              int v2 = "ticlts";
              if (strcmp(a1, "ticlts"))
              {
                int v2 = "ticotsord";
                if (strcmp(a1, "ticotsord")) {
                  return a1;
                }
              }
            }
          }
        }
      }
    }
  }
  return v2;
}

uint64_t sub_10000801C(uint64_t a1, unsigned int a2)
{
  bzero(__str, 0x400uLL);
  int v87 = *(_DWORD *)(a1 + 4);
  ((void (*)(const char *, const char *, int *))off_100010050[6])("     ", "General mount flags", &v87);
  int v3 = v87;
  if (v87)
  {
    char v4 = 32;
    unint64_t v5 = &off_10000C7D0;
    while (1)
    {
      int v6 = *((_DWORD *)v5 - 2);
      if (!v6) {
        break;
      }
      if ((v6 & v3) != 0)
      {
        ((void (*)(void, char *, void *))off_100010050[7])(v4, *v5, &unk_10000AAC3);
        int v3 = v87 & ~v6;
        int v87 = v3;
        char v4 = 44;
      }
      v5 += 2;
      if (!v3) {
        goto LABEL_13;
      }
    }
    uint64_t v7 = &off_10000C8D0;
    do
    {
      int v8 = *((_DWORD *)v7 - 2);
      if (!v8) {
        break;
      }
      if ((v8 & v3) != 0)
      {
        ((void (*)(void, char *, void *))off_100010050[7])(v4, *v7, &unk_10000AAC3);
        int v3 = v87 & ~v8;
        int v87 = v3;
        char v4 = 44;
      }
      v7 += 2;
    }
    while (v3);
  }
LABEL_13:
  ((void (*)(uint64_t))off_100010050[9])(1);
  ((void (*)(const char *, const char *, void))off_100010050[6])("     ", "NFS parameters", 0);
  int v9 = *(_DWORD *)(a1 + 8);
  if ((v9 & 2) != 0)
  {
    int v11 = snprintf(__str, 0x400uLL, "vers=%d", *(_DWORD *)(a1 + 48));
    LODWORD(v12) = v11;
    if ((*(unsigned char *)(a1 + 8) & 4) != 0)
    {
      int v13 = snprintf(&__str[v11], 1024 - v11, ".%d", *(_DWORD *)(a1 + 52));
LABEL_22:
      LODWORD(v12) = v13 + v12;
    }
  }
  else
  {
    if ((v9 & 0x8000000) == 0)
    {
      uint64_t v10 = 32;
      goto LABEL_24;
    }
    int v14 = (unsigned __int16)*(_DWORD *)(a1 + 56);
    int v15 = snprintf(__str, 0x400uLL, "vers=%d", HIWORD(*(_DWORD *)(a1 + 56)));
    int v16 = v15;
    if (v14) {
      int v16 = snprintf(&__str[v15], 1024 - v15, ".%d", v14) + v15;
    }
    int v17 = (unsigned __int16)*(_DWORD *)(a1 + 60);
    uint64_t v12 = snprintf(&__str[v16], 1024 - v16, "-%d", HIWORD(*(_DWORD *)(a1 + 60))) + (uint64_t)v16;
    if (v17)
    {
      int v13 = snprintf(&__str[v12], 1024 - v12, ".%d", v17);
      goto LABEL_22;
    }
  }
  __str[(int)v12] = 0;
  ((void (*)(uint64_t, char *, void *))off_100010050[7])(32, __str, &unk_10000AAC3);
  uint64_t v10 = 44;
LABEL_24:
  int v18 = *(_DWORD *)(a1 + 8);
  if ((v18 & 0x4000) != 0)
  {
    uint64_t v36 = off_100010050[7];
    uint64_t v37 = sub_100007ED0((const char *)(a1 + 228));
    ((void (*)(uint64_t, const char *, void *))v36)(v10, v37, &unk_10000AAC3);
    int v18 = *(_DWORD *)(a1 + 8);
    uint64_t v10 = 44;
    if ((v18 & 0x8000) == 0)
    {
LABEL_26:
      if ((v18 & 0x20000000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_111;
    }
  }
  else if ((v18 & 0x8000) == 0)
  {
    goto LABEL_26;
  }
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "port=", *(unsigned int *)(a1 + 244));
  int v18 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v18 & 0x20000000) == 0)
  {
LABEL_27:
    if ((v18 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_112;
  }
LABEL_111:
  ((void (*)(uint64_t, const char *, void))off_100010050[7])(v10, "port=", *(void *)(a1 + 256));
  int v18 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v18 & 0x10000) == 0)
  {
LABEL_28:
    if ((v18 & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_112:
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "mountport=", *(unsigned int *)(a1 + 248));
  uint64_t v10 = 44;
  if ((*(_DWORD *)(a1 + 8) & 0x40000000) != 0)
  {
LABEL_29:
    ((void (*)(uint64_t, const char *, void))off_100010050[7])(v10, "mountport=", *(void *)(a1 + 264));
    uint64_t v10 = 44;
  }
LABEL_30:
  int v19 = *(_DWORD *)(a1 + 16);
  if ((v19 & 0x10000) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x10000) != 0) {
      int v38 = (const char *)&unk_10000AAC3;
    }
    else {
      int v38 = "no";
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v38, "mntudp");
    int v19 = *(_DWORD *)(a1 + 16);
    uint64_t v10 = 44;
    if ((v19 & 1) == 0)
    {
LABEL_32:
      if ((v19 & 2) == 0) {
        goto LABEL_33;
      }
      goto LABEL_122;
    }
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_32;
  }
  if (*(_DWORD *)(a1 + 20)) {
    unsigned int v39 = "soft";
  }
  else {
    unsigned int v39 = "hard";
  }
  ((void (*)(uint64_t, const char *, void *))off_100010050[7])(v10, v39, &unk_10000AAC3);
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 2) == 0)
  {
LABEL_33:
    if ((v19 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_126;
  }
LABEL_122:
  if ((*(_DWORD *)(a1 + 20) & 2) != 0) {
    uint64_t v40 = (const char *)&unk_10000AAC3;
  }
  else {
    uint64_t v40 = "no";
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v40, "intr");
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 4) == 0)
  {
LABEL_34:
    if ((v19 & 8) == 0) {
      goto LABEL_35;
    }
    goto LABEL_130;
  }
LABEL_126:
  if ((*(_DWORD *)(a1 + 20) & 4) != 0) {
    uint64_t v41 = (const char *)&unk_10000AAC3;
  }
  else {
    uint64_t v41 = "no";
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v41, "resvport");
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 8) == 0)
  {
LABEL_35:
    if ((v19 & 0x400) == 0) {
      goto LABEL_36;
    }
    goto LABEL_134;
  }
LABEL_130:
  if ((*(_DWORD *)(a1 + 20) & 8) != 0) {
    uint64_t v42 = "no";
  }
  else {
    uint64_t v42 = (const char *)&unk_10000AAC3;
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v42, "conn");
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 0x400) == 0)
  {
LABEL_36:
    if ((v19 & 0x80) == 0) {
      goto LABEL_37;
    }
    goto LABEL_138;
  }
LABEL_134:
  if ((*(_DWORD *)(a1 + 20) & 0x400) != 0) {
    uint64_t v43 = "no";
  }
  else {
    uint64_t v43 = (const char *)&unk_10000AAC3;
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v43, "callback");
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 0x80) == 0)
  {
LABEL_37:
    if ((v19 & 0x800) == 0) {
      goto LABEL_38;
    }
    goto LABEL_142;
  }
LABEL_138:
  if ((*(_DWORD *)(a1 + 20) & 0x80) != 0) {
    uint64_t v44 = "no";
  }
  else {
    uint64_t v44 = (const char *)&unk_10000AAC3;
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v44, "negnamecache");
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 0x800) == 0)
  {
LABEL_38:
    if ((v19 & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_146;
  }
LABEL_142:
  if ((*(_DWORD *)(a1 + 20) & 0x800) != 0) {
    uint64_t v45 = (const char *)&unk_10000AAC3;
  }
  else {
    uint64_t v45 = "no";
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v45, "namedattr");
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 0x1000) == 0)
  {
LABEL_39:
    if ((v19 & 0x2000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_150;
  }
LABEL_146:
  if ((*(_DWORD *)(a1 + 20) & 0x1000) != 0) {
    long long v46 = "no";
  }
  else {
    long long v46 = (const char *)&unk_10000AAC3;
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v46, "acl");
  int v19 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = 44;
  if ((v19 & 0x2000) == 0)
  {
LABEL_40:
    if ((v19 & 0x20) == 0) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
LABEL_150:
  if ((*(_DWORD *)(a1 + 20) & 0x2000) != 0) {
    uint64_t v47 = (const char *)&unk_10000AAC3;
  }
  else {
    uint64_t v47 = "no";
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v47, "aclonly");
  uint64_t v10 = 44;
  if ((*(_DWORD *)(a1 + 16) & 0x20) != 0)
  {
LABEL_41:
    if ((*(_DWORD *)(a1 + 20) & 0x20) != 0) {
      uint64_t v20 = (const char *)&unk_10000AAC3;
    }
    else {
      uint64_t v20 = "no";
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v20, "callumnt");
    uint64_t v10 = 44;
  }
LABEL_45:
  if ((*(unsigned char *)(a1 + 9) & 8) != 0)
  {
    uint64_t v21 = *(int *)(a1 + 176);
    if (v21 <= 2)
    {
      ((void (*)(uint64_t, char *, void *))off_100010050[7])(v10, (&off_10000C948)[v21], &unk_10000AAC3);
      uint64_t v10 = 44;
    }
  }
  if ((*(unsigned char *)(a1 + 17) & 0x80) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x8000) != 0) {
      int v22 = "no";
    }
    else {
      int v22 = (const char *)&unk_10000AAC3;
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v22, "quota");
    uint64_t v10 = 44;
  }
  int v23 = *(_DWORD *)(a1 + 8);
  if ((v23 & 8) != 0)
  {
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "rsize=", *(unsigned int *)(a1 + 64));
    int v23 = *(_DWORD *)(a1 + 8);
    uint64_t v10 = 44;
    if ((v23 & 0x10) == 0)
    {
LABEL_55:
      if ((v23 & 0x40) == 0) {
        goto LABEL_56;
      }
      goto LABEL_157;
    }
  }
  else if ((v23 & 0x10) == 0)
  {
    goto LABEL_55;
  }
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "wsize=", *(unsigned int *)(a1 + 68));
  int v23 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v23 & 0x40) == 0)
  {
LABEL_56:
    if ((v23 & 0x20) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_157:
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "readahead=", *(unsigned int *)(a1 + 76));
  uint64_t v10 = 44;
  if ((*(_DWORD *)(a1 + 8) & 0x20) != 0)
  {
LABEL_57:
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "dsize=", *(unsigned int *)(a1 + 72));
    uint64_t v10 = 44;
  }
LABEL_58:
  int v24 = *(_DWORD *)(a1 + 16);
  if ((v24 & 0x40) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x40) != 0) {
      uint64_t v25 = (const char *)&unk_10000AAC3;
    }
    else {
      uint64_t v25 = "no";
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v25, "rdirplus");
    int v24 = *(_DWORD *)(a1 + 16);
    uint64_t v10 = 44;
  }
  if ((v24 & 0x10) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x10) != 0) {
      uint64_t v26 = (const char *)&unk_10000AAC3;
    }
    else {
      uint64_t v26 = "no";
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v26, "dumbtimer");
    uint64_t v10 = 44;
  }
  int v27 = *(_DWORD *)(a1 + 8);
  if ((v27 & 0x20000) != 0)
  {
    ((void (*)(uint64_t, const char *, uint64_t))off_100010050[8])(v10, "timeo=", *(void *)(a1 + 280) % 100000000 + 10 * *(void *)(a1 + 272));
    int v27 = *(_DWORD *)(a1 + 8);
    uint64_t v10 = 44;
    if ((v27 & 0x40000) == 0)
    {
LABEL_70:
      if ((v27 & 0x2000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_161;
    }
  }
  else if ((v27 & 0x40000) == 0)
  {
    goto LABEL_70;
  }
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "retrans=", *(unsigned int *)(a1 + 288));
  int v27 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v27 & 0x2000) == 0)
  {
LABEL_71:
    if ((v27 & 0x80) == 0) {
      goto LABEL_72;
    }
    goto LABEL_162;
  }
LABEL_161:
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "maxgroups=", *(unsigned int *)(a1 + 224));
  int v27 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v27 & 0x80) == 0)
  {
LABEL_72:
    if ((v27 & 0x100) == 0) {
      goto LABEL_73;
    }
    goto LABEL_163;
  }
LABEL_162:
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "acregmin=", *(void *)(a1 + 80));
  int v27 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v27 & 0x100) == 0)
  {
LABEL_73:
    if ((v27 & 0x200) == 0) {
      goto LABEL_74;
    }
    goto LABEL_164;
  }
LABEL_163:
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "acregmax=", *(void *)(a1 + 96));
  int v27 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v27 & 0x200) == 0)
  {
LABEL_74:
    if ((v27 & 0x400) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_164:
  ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "acdirmin=", *(void *)(a1 + 112));
  uint64_t v10 = 44;
  if ((*(_DWORD *)(a1 + 8) & 0x400) != 0)
  {
LABEL_75:
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "acdirmax=", *(void *)(a1 + 128));
    uint64_t v10 = 44;
  }
LABEL_76:
  int v28 = *(_DWORD *)(a1 + 12);
  if ((v28 & 2) != 0)
  {
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "acrootdirmin=", *(void *)(a1 + 144));
    int v28 = *(_DWORD *)(a1 + 12);
    uint64_t v10 = 44;
  }
  if ((v28 & 4) != 0)
  {
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "acrootdirmax=", *(void *)(a1 + 160));
    uint64_t v10 = 44;
  }
  if ((*(unsigned char *)(a1 + 10) & 8) != 0)
  {
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "deadtimeout=", *(void *)(a1 + 304));
    uint64_t v10 = 44;
  }
  int v29 = *(_DWORD *)(a1 + 16);
  if ((v29 & 0x100) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x100) != 0) {
      unint64_t v48 = (const char *)&unk_10000AAC3;
    }
    else {
      unint64_t v48 = "no";
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v48, "mutejukebox");
    int v29 = *(_DWORD *)(a1 + 16);
    uint64_t v10 = 44;
    if ((v29 & 0x200) == 0)
    {
LABEL_84:
      if ((v29 & 0x4000) == 0) {
        goto LABEL_89;
      }
      goto LABEL_85;
    }
  }
  else if ((v29 & 0x200) == 0)
  {
    goto LABEL_84;
  }
  if ((*(_DWORD *)(a1 + 20) & 0x200) != 0) {
    uint64_t v49 = (const char *)&unk_10000AAC3;
  }
  else {
    uint64_t v49 = "no";
  }
  ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v49, "ephemeral");
  uint64_t v10 = 44;
  if ((*(_DWORD *)(a1 + 16) & 0x4000) != 0)
  {
LABEL_85:
    if ((*(_DWORD *)(a1 + 20) & 0x4000) != 0) {
      uint64_t v30 = (const char *)&unk_10000AAC3;
    }
    else {
      uint64_t v30 = "no";
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v30, "nfc");
    uint64_t v10 = 44;
  }
LABEL_89:
  if (dword_100010198 && (*(unsigned char *)(a1 + 18) & 0x10) != 0)
  {
    if ((*(_DWORD *)(a1 + 20) & 0x100000) != 0) {
      uint64_t v31 = (const char *)&unk_10000AAC3;
    }
    else {
      uint64_t v31 = "no";
    }
    ((void (*)(uint64_t, const char *, const char *))off_100010050[7])(v10, v31, "skip_renew");
    uint64_t v10 = 44;
  }
  int v32 = *(_DWORD *)(a1 + 8);
  uint64_t v86 = a1;
  if ((v32 & 0x1000) == 0)
  {
    if ((v32 & 0x10000000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_233;
  }
  int v50 = *(_DWORD *)(a1 + 184);
  if (v50 <= 390002)
  {
    if (!v50)
    {
      long long v51 = "none";
      goto LABEL_216;
    }
    if (v50 == 1)
    {
      long long v51 = "sys";
      goto LABEL_216;
    }
  }
  else
  {
    switch(v50)
    {
      case 390003:
        long long v51 = "krb5";
        goto LABEL_216;
      case 390004:
        long long v51 = "krb5i";
        goto LABEL_216;
      case 390005:
        long long v51 = "krb5p";
        goto LABEL_216;
    }
  }
  long long v51 = "?";
LABEL_216:
  int v71 = snprintf(__str, 0x400uLL, "sec=%s", v51);
  if (*(int *)(a1 + 180) >= 2)
  {
    uint64_t v72 = 47;
    uint64_t v73 = v86;
    while (1)
    {
      int v74 = *(_DWORD *)(v73 + 4 * v72);
      if (v74 <= 390002)
      {
        BOOL v75 = "none";
        if (v74)
        {
          if (v74 != 1)
          {
LABEL_228:
            BOOL v75 = "?";
            goto LABEL_229;
          }
          BOOL v75 = "sys";
        }
      }
      else
      {
        switch(v74)
        {
          case 390003:
            BOOL v75 = "krb5";
            break;
          case 390004:
            BOOL v75 = "krb5i";
            break;
          case 390005:
            BOOL v75 = "krb5p";
            break;
          default:
            goto LABEL_228;
        }
      }
LABEL_229:
      ++v72;
      v71 += snprintf(&__str[v71], 1024 - v71, ":%s", v75);
      uint64_t v73 = v86;
      if (v72 - 46 >= *(int *)(v86 + 180)) {
        goto LABEL_232;
      }
    }
  }
  uint64_t v73 = a1;
LABEL_232:
  __str[v71] = 0;
  ((void (*)(uint64_t, char *, void *))off_100010050[7])(v10, __str, &unk_10000AAC3);
  int v32 = *(_DWORD *)(v73 + 8);
  uint64_t v10 = 44;
  a1 = v73;
  if ((v32 & 0x10000000) == 0)
  {
LABEL_97:
    if ((v32 & 0x1000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_250;
  }
LABEL_233:
  if (*(_DWORD *)(a1 + 208)) {
    uint64_t v76 = (const char *)&unk_10000AAC3;
  }
  else {
    uint64_t v76 = "*";
  }
  unsigned int v77 = *(_DWORD *)(a1 + 212) - 16;
  if (v77 > 2) {
    uint64_t v78 = "?";
  }
  else {
    uint64_t v78 = (&off_10000C960)[v77];
  }
  int v79 = snprintf(__str, 0x400uLL, "etype=%s%s", v76, v78);
  if (*(_DWORD *)(v86 + 204) < 2u)
  {
    uint64_t v81 = v86;
  }
  else
  {
    uint64_t v80 = 54;
    uint64_t v81 = v86;
    do
    {
      if (v80 - 53 == *(_DWORD *)(v81 + 208)) {
        unint64_t v82 = "*";
      }
      else {
        unint64_t v82 = (const char *)&unk_10000AAC3;
      }
      unsigned int v83 = *(_DWORD *)(v81 + 4 * v80) - 16;
      BOOL v84 = "?";
      if (v83 <= 2) {
        BOOL v84 = (&off_10000C960)[v83];
      }
      ++v80;
      v79 += snprintf(&__str[v79], 1024 - v79, ":%s%s", v82, v84);
      uint64_t v81 = v86;
    }
    while (v80 - 53 < (unint64_t)*(unsigned int *)(v86 + 204));
  }
  __str[v79] = 0;
  ((void (*)(uint64_t, char *, void *))off_100010050[7])(v10, __str, &unk_10000AAC3);
  int v32 = *(_DWORD *)(v81 + 8);
  uint64_t v10 = 44;
  a1 = v81;
  if ((v32 & 0x1000000) == 0)
  {
LABEL_98:
    if ((v32 & 0x2000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_251;
  }
LABEL_250:
  ((void (*)(uint64_t, const char *, void))off_100010050[7])(v10, "realm=", *(void *)(a1 + 24));
  int v32 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v32 & 0x2000000) == 0)
  {
LABEL_99:
    if ((v32 & 0x4000000) == 0) {
      goto LABEL_100;
    }
LABEL_252:
    ((void (*)(uint64_t, const char *, void))off_100010050[7])(v10, "sprincipalm=", *(void *)(a1 + 40));
    uint64_t v10 = 44;
    if ((*(_DWORD *)(a1 + 8) & 0x80000000) == 0) {
      goto LABEL_101;
    }
LABEL_253:
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "owner=", *(unsigned int *)(a1 + 472));
    uint64_t v10 = 44;
    goto LABEL_101;
  }
LABEL_251:
  ((void (*)(uint64_t, const char *, void))off_100010050[7])(v10, "principal=", *(void *)(a1 + 32));
  int v32 = *(_DWORD *)(a1 + 8);
  uint64_t v10 = 44;
  if ((v32 & 0x4000000) != 0) {
    goto LABEL_252;
  }
LABEL_100:
  if (v32 < 0) {
    goto LABEL_253;
  }
LABEL_101:
  int v33 = *(_DWORD *)(a1 + 12);
  if (dword_100010198 && (v33 & 1) != 0)
  {
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "readlink_nocache=", *(int *)(a1 + 292));
    int v33 = *(_DWORD *)(a1 + 12);
    uint64_t v10 = 44;
  }
  if ((v33 & 8) != 0) {
    ((void (*)(uint64_t, const char *, void))off_100010050[8])(v10, "accesscache=", *(int *)(a1 + 296));
  }
  uint64_t result = ((uint64_t (*)(void))off_100010050[9])(0);
  if ((*(unsigned char *)(a1 + 10) & 0x20) != 0)
  {
    uint64_t v35 = ((uint64_t (*)(const char *, const char *, void))off_100010050[6])("     ", "File system locations", 0);
    ((void (*)(uint64_t))off_100010050[2])(v35);
    if (a2 <= 0x57)
    {
      ((void (*)(const char *, void))off_100010050[4])("       ", 0);
      if (*(void *)(a1 + 464)) {
        uint64_t v52 = *(const char **)(a1 + 464);
      }
      else {
        uint64_t v52 = "???";
      }
      uint64_t v53 = ((uint64_t (*)(const char *))off_100010050[11])(v52);
      uint64_t v54 = ((uint64_t (*)(uint64_t))off_100010050[5])(v53);
      ((void (*)(uint64_t))off_100010050[2])(v54);
    }
    if ((a2 == 88 || dword_100010198) && *(_DWORD *)(a1 + 452))
    {
      for (unint64_t i = 0; i < *(unsigned int *)(a1 + 452); ++i)
      {
        uint64_t v56 = ((uint64_t (*)(const char *, void))off_100010050[4])("       ", 0);
        uint64_t v57 = *(void *)(a1 + 456);
        uint64_t v58 = v57 + 24 * i;
        int v60 = *(_DWORD *)(v58 + 20);
        unsigned int v59 = (_DWORD *)(v58 + 20);
        if (v60)
        {
          int v61 = 0;
        }
        else
        {
          strcpy(__str, "/");
          int v61 = 1;
          if (!*v59) {
            goto LABEL_197;
          }
        }
        unint64_t v62 = 0;
        do
        {
          uint64_t v63 = *(void *)(v57 + 24 * i + 8);
          if (*(void *)(v63 + 8 * v62) && !strncmp(*(const char **)(v63 + 8 * v62), "ftp:", 4uLL)) {
            uint64_t v56 = snprintf(&__str[v61], 1024 - v61, "%s/");
          }
          else {
            uint64_t v56 = snprintf(&__str[v61], 1024 - v61, "/%s");
          }
          v61 += v56;
          ++v62;
          a1 = v86;
          uint64_t v57 = *(void *)(v86 + 456);
        }
        while (v62 < *(unsigned int *)(v57 + 24 * i + 20));
LABEL_197:
        __str[v61] = 0;
        if (*(_DWORD *)(v57 + 24 * i + 16))
        {
          uint64_t v64 = 0;
          unint64_t v65 = 0;
          do
          {
            uint64_t v66 = *(void *)(v57 + 24 * i);
            long long v67 = *(const char **)(v66 + v64);
            if (v67)
            {
              uint64_t v68 = v66 + v64;
              uint64_t v69 = *(unsigned int *)(v68 + 16);
              uint64_t v70 = *(void *)(v68 + 8);
            }
            else
            {
              long long v67 = "<local domaim>";
              uint64_t v69 = 0;
              uint64_t v70 = 0;
            }
            uint64_t v56 = ((uint64_t (*)(char *, const char *, uint64_t, uint64_t))off_100010050[11])(__str, v67, v69, v70);
            ++v65;
            uint64_t v57 = *(void *)(a1 + 456);
            v64 += 24;
          }
          while (v65 < *(unsigned int *)(v57 + 24 * i + 16));
        }
        ((void (*)(uint64_t))off_100010050[5])(v56);
      }
    }
    uint64_t result = ((uint64_t (*)(void))off_100010050[9])(0);
  }
  if (dword_100010198)
  {
    if ((*(unsigned char *)(a1 + 10) & 0x10) != 0) {
      return ((uint64_t (*)(void, uint64_t))off_100010050[13])(*(unsigned int *)(a1 + 320), a1 + 324);
    }
  }
  return result;
}

void sub_100009100(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v59 = 0;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v56 = 0u;
  bzero(v89, 0x400uLL);
  unsigned int v55 = 0;
  memset(v88, 0, sizeof(v88));
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  memset(v60, 0, sizeof(v60));
  sub_100003C44((uint64_t)&v56, a2, a3);
  LODWORD(__dst) = 0;
  int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
  if (v8) {
    goto LABEL_2;
  }
  if (__dst)
  {
    printf("%s unknown mount info version %d\n\n");
    return;
  }
  LODWORD(__dst) = 0;
  int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
  if (v8) {
    goto LABEL_2;
  }
  if (bswap32(__dst) <= a3)
  {
    LODWORD(__dst) = 0;
    int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
    if (v8) {
      goto LABEL_2;
    }
    unsigned int v10 = __dst;
    if (__dst)
    {
      LODWORD(__dst) = 0;
      int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
      if (v8) {
        goto LABEL_2;
      }
      char v11 = bswap32(__dst);
      unsigned int v12 = 1;
    }
    else
    {
      unsigned int v12 = 0;
      char v11 = 0;
    }
    unsigned int v13 = bswap32(v10);
    if (v12 >= v13)
    {
      int v8 = 0;
    }
    else
    {
      int v8 = 0;
      uint64_t v15 = *((void *)&v57 + 1);
      unint64_t v14 = v58;
      do
      {
        if (!v8)
        {
          unint64_t v16 = 4;
          while (v14)
          {
            if (v14 >= v16) {
              unint64_t v17 = v16;
            }
            else {
              unint64_t v17 = v14;
            }
            v15 += v17;
            v14 -= v17;
            *((void *)&v57 + 1) = v15;
            *(void *)&long long v58 = v14;
            v16 -= v17;
            if (!v16)
            {
              int v8 = 0;
              goto LABEL_26;
            }
          }
          int v8 = 72;
        }
LABEL_26:
        ++v12;
      }
      while (v12 != v13);
      unsigned int v12 = v13;
    }
    do
    {
      unsigned int v18 = v12;
      char v19 = v11;
      unsigned int v12 = 1;
      char v11 = 0;
    }
    while (!v18);
    if (v19)
    {
      LODWORD(__dst) = 0;
      if (v8) {
        goto LABEL_2;
      }
      int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
      if (v8) {
        goto LABEL_2;
      }
      unsigned int v26 = __dst;
      if (__dst)
      {
        LODWORD(__dst) = 0;
        unsigned int v55 = 0;
        int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
        if (v8) {
          goto LABEL_2;
        }
        unsigned int v27 = bswap32(__dst);
        unsigned int v28 = 1;
      }
      else
      {
        unsigned int v28 = 0;
        unsigned int v27 = 0;
      }
      unsigned int v29 = bswap32(v26);
      if (v28 >= v29)
      {
        int v8 = 0;
      }
      else
      {
        int v8 = 0;
        uint64_t v31 = *((void *)&v57 + 1);
        unint64_t v30 = v58;
        do
        {
          if (!v8)
          {
            unint64_t v32 = 4;
            while (v30)
            {
              if (v30 >= v32) {
                unint64_t v33 = v32;
              }
              else {
                unint64_t v33 = v30;
              }
              v31 += v33;
              v30 -= v33;
              *((void *)&v57 + 1) = v31;
              *(void *)&long long v58 = v30;
              v32 -= v33;
              if (!v32)
              {
                int v8 = 0;
                goto LABEL_66;
              }
            }
            int v8 = 72;
          }
LABEL_66:
          ++v28;
        }
        while (v28 != v29);
        unsigned int v28 = v29;
      }
      do
      {
        unsigned int v44 = v28;
        unsigned int v45 = v27;
        unsigned int v28 = 1;
        unsigned int v27 = 0;
      }
      while (!v44);
      unsigned int v55 = v45;
      if (v8) {
        goto LABEL_2;
      }
    }
    else if (v8)
    {
      goto LABEL_2;
    }
    if ((v19 & 2) != 0)
    {
      LODWORD(__dst) = 0;
      int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
      if (!v8) {
        int v8 = sub_1000063EC((uint64_t)&v56, bswap32(__dst), (uint64_t)v88);
      }
      if ((v19 & 4) == 0)
      {
        char v24 = 1;
        goto LABEL_50;
      }
      LODWORD(__dst) = 0;
      if (v8)
      {
LABEL_49:
        char v24 = 0;
LABEL_50:
        if ((v19 & 8) == 0)
        {
          uint64_t v23 = 0;
          uint64_t v22 = 0;
          uint64_t v21 = 0;
          uint64_t v20 = 0;
          char v25 = 1;
          goto LABEL_75;
        }
        LODWORD(__dst) = 0;
        if (v8) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
    }
    else
    {
      if ((v19 & 4) == 0)
      {
        if ((v19 & 8) == 0)
        {
          uint64_t v20 = 0;
          uint64_t v21 = 0;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          char v24 = 1;
          char v25 = 1;
LABEL_76:
          if ((BYTE8(v60[0]) & 2) != 0
            && ((a4 & 1) == 0 && v61 < 4 || (a4 & 2) == 0 && v61 > 3))
          {
            goto LABEL_4;
          }
          uint64_t v34 = ((uint64_t (*)(uint64_t, uint64_t))off_100010050[12])(a1 + 88, a1 + 1112);
          if ((v19 & 2) != 0)
          {
            ((void (*)(const char *, const char *))off_100010050[3])("  -- ", "Original mount options");
            uint64_t v35 = sub_10000801C((uint64_t)v88, v88[0]);
            uint64_t v34 = ((uint64_t (*)(uint64_t))off_100010050[5])(v35);
            if (v24)
            {
LABEL_79:
              if ((v19 & 1) == 0) {
                goto LABEL_119;
              }
LABEL_114:
              ((void (*)(const char *, const char *, unsigned int *))off_100010050[6])("     ", "Status flags", &v55);
              char v47 = v55;
              if (v55)
              {
                ((void (*)(uint64_t, const char *, void *))off_100010050[7])(44, "dead", &unk_10000AAC3);
                char v47 = v55;
                if ((v55 & 2) == 0)
                {
LABEL_116:
                  if ((v47 & 4) == 0)
                  {
LABEL_118:
                    uint64_t v34 = ((uint64_t (*)(uint64_t))off_100010050[9])(1);
LABEL_119:
                    uint64_t v9 = ((uint64_t (*)(uint64_t))off_100010050[5])(v34);
                    goto LABEL_3;
                  }
LABEL_117:
                  ((void (*)(uint64_t, const char *, void *))off_100010050[7])(44, "recovery", &unk_10000AAC3);
                  goto LABEL_118;
                }
              }
              else if ((v55 & 2) == 0)
              {
                goto LABEL_116;
              }
              ((void (*)(uint64_t, const char *, void *))off_100010050[7])(44, "not responding", &unk_10000AAC3);
              if ((v55 & 4) == 0) {
                goto LABEL_118;
              }
              goto LABEL_117;
            }
          }
          else if (v24)
          {
            goto LABEL_79;
          }
          ((void (*)(const char *, const char *))off_100010050[3])("  -- ", "Current mount parameters");
          uint64_t v36 = sub_10000801C((uint64_t)v60, v88[0]);
          if ((v25 & 1) == 0
            && (dword_100010198
             || DWORD1(v86) > 1
             || *(_DWORD *)(*((void *)&v86 + 1) + 16) > 1u
             || *(_DWORD *)(**((void **)&v86 + 1) + 16) >= 2u))
          {
            if (v22 >= DWORD1(v86)
              || v21 >= *(_DWORD *)(*((void *)&v86 + 1) + 24 * v22 + 16)
              || v20 >= *(_DWORD *)(*(void *)(*((void *)&v86 + 1) + 24 * v22)
                                                + 24 * v21
                                                + 16))
            {
              uint64_t v46 = ((uint64_t (*)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_100010050[10])("     ", "Current location", v23, v22, v21, v20, 1);
            }
            else
            {
              uint64_t v37 = ((uint64_t (*)(const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, void))off_100010050[10])("     ", "Current location", v23, v22, v21, v20, 0);
              ((void (*)(uint64_t))off_100010050[2])(v37);
              ((void (*)(const char *))off_100010050[1])("       ");
              uint64_t v38 = *((void *)&v86 + 1);
              if (*(_DWORD *)(*((void *)&v86 + 1) + 24 * v22 + 20))
              {
                unint64_t v39 = 0;
                int v40 = 0;
                do
                {
                  uint64_t v41 = *(void *)(v38 + 24 * v22 + 8);
                  if (*(void *)(v41 + 8 * v39) && !strncmp(*(const char **)(v41 + 8 * v39), "ftp:", 4uLL)) {
                    int v42 = snprintf((char *)v89 + v40, 1024 - v40, "%s/");
                  }
                  else {
                    int v42 = snprintf((char *)v89 + v40, 1024 - v40, "/%s");
                  }
                  v40 += v42;
                  ++v39;
                  uint64_t v38 = *((void *)&v86 + 1);
                }
                while (v39 < *(unsigned int *)(*((void *)&v86 + 1) + 24 * v22 + 20));
                uint64_t v43 = v40;
              }
              else
              {
                v89[0] = 47;
                uint64_t v43 = 1;
              }
              *((unsigned char *)v89 + v43) = 0;
              uint64_t v48 = *(void *)(v38 + 24 * v22);
              uint64_t v49 = *(const char **)(v48 + 24 * v21);
              if (v49)
              {
                uint64_t __dst = *(void *)(*(void *)(v48 + 24 * v21 + 8) + 8 * v20);
                int v50 = off_100010050[11];
                BOOL v51 = __dst != 0;
                p_dst = &__dst;
              }
              else
              {
                int v50 = off_100010050[11];
                uint64_t v49 = "<local domain>";
                BOOL v51 = 0;
                p_dst = 0;
              }
              uint64_t v53 = ((uint64_t (*)(_WORD *, const char *, BOOL, uint64_t *))v50)(v89, v49, v51, p_dst);
              uint64_t v46 = ((uint64_t (*)(uint64_t))off_100010050[2])(v53);
            }
            uint64_t v36 = ((uint64_t (*)(uint64_t))off_100010050[5])(v46);
          }
          uint64_t v34 = ((uint64_t (*)(uint64_t))off_100010050[5])(v36);
          if ((v19 & 1) == 0) {
            goto LABEL_119;
          }
          goto LABEL_114;
        }
        LODWORD(__dst) = 0;
        char v24 = 1;
LABEL_69:
        int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
        if (!v8)
        {
          uint64_t v23 = bswap32(__dst);
          LODWORD(__dst) = 0;
          int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
          if (!v8)
          {
            uint64_t v22 = bswap32(__dst);
            LODWORD(__dst) = 0;
            int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
            if (!v8)
            {
              uint64_t v21 = bswap32(__dst);
              LODWORD(__dst) = 0;
              int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
              if (!v8)
              {
                uint64_t v20 = bswap32(__dst);
                goto LABEL_74;
              }
LABEL_73:
              uint64_t v20 = 0;
LABEL_74:
              char v25 = 0;
LABEL_75:
              if (!v8) {
                goto LABEL_76;
              }
LABEL_2:
              uint64_t v9 = printf("%s error parsing mount info (%d)\n", (const char *)(a1 + 88), v8);
LABEL_3:
              ((void (*)(uint64_t))off_100010050[2])(v9);
LABEL_4:
              sub_100006198((uint64_t)v88);
              sub_100006198((uint64_t)v60);
              return;
            }
LABEL_72:
            uint64_t v21 = 0;
            goto LABEL_73;
          }
LABEL_71:
          uint64_t v22 = 0;
          goto LABEL_72;
        }
LABEL_70:
        uint64_t v23 = 0;
        goto LABEL_71;
      }
      LODWORD(__dst) = 0;
    }
    int v8 = sub_100003C84((uint64_t)&v56, (char *)&__dst, 4u, 0);
    if (!v8) {
      int v8 = sub_1000063EC((uint64_t)&v56, bswap32(__dst), (uint64_t)v60);
    }
    goto LABEL_49;
  }
  printf("%s bogus mount info length %u > %zu\n\n");
}

uint64_t sub_1000099F0(uint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t v2 = *(void *)(result + 4);
    if (v2)
    {
      uint64_t v4 = 0;
      uint64_t v5 = result + 12;
      unsigned int v6 = 1;
      do
      {
        uint64_t v7 = sub_100009B2C((char *)(v5 + 1049 * v4), a2);
        unint64_t v8 = *(void *)(v5 + 1049 * v4 + 1025);
        if (v7)
        {
          unint64_t v9 = *(void *)(v7 + 1025);
          unint64_t v10 = *(void *)(v7 + 1033);
          uint64_t v11 = v9 - v8;
          BOOL v12 = v8 >= v9;
          uint64_t v13 = v8 - v9;
          if (!v12) {
            uint64_t v13 = v11;
          }
          uint64_t v14 = v5 + 1049 * v4;
          unint64_t v15 = *(void *)(v14 + 1033);
          uint64_t v16 = v10 - v15;
          BOOL v12 = v15 >= v10;
          uint64_t v17 = v15 - v10;
          if (!v12) {
            uint64_t v17 = v16;
          }
          unint64_t v18 = *(void *)(v14 + 1041);
          unint64_t v19 = *(void *)(v7 + 1041);
          uint64_t v20 = v19 - v18;
          BOOL v12 = v18 >= v19;
          uint64_t v21 = v18 - v19;
          if (!v12) {
            uint64_t v21 = v20;
          }
          uint64_t result = printf("%12llu %12llu %12llu %s\n", v13, v17, v21, (const char *)(v5 + 1049 * v4));
        }
        else
        {
          uint64_t result = printf("%12llu %12llu %12llu %s\n", v8, *(void *)(v5 + 1049 * v4 + 1033), *(void *)(v5 + 1049 * v4 + 1041), (const char *)(v5 + 1049 * v4));
        }
        uint64_t v4 = v6;
      }
      while (v2 > v6++);
    }
    else
    {
      return puts("No exported directories found");
    }
  }
  return result;
}

const char *sub_100009B2C(char *__s1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v2 = *(void *)(a2 + 4);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = a2 + 12;
  unsigned int v6 = 1;
  while (1)
  {
    uint64_t v7 = (const char *)(v5 + 1049 * v4);
    if (!strcmp(__s1, v7)) {
      break;
    }
    uint64_t v4 = v6;
    if (v2 <= v6++) {
      return 0;
    }
  }
  return v7;
}

uint64_t **sub_100009BA4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4);
  if (!v1) {
    return 0;
  }
  int v3 = (uint64_t **)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = 0;
    unsigned int v6 = 0;
    void *v3 = 0;
    uint64_t v7 = (char *)(a1 + 8);
    do
    {
      if (*v7)
      {
        if (*v7 != 1)
        {
          printf("nfsstat: unexpected record type 0x%02x in active user data stream\n", *v7);
LABEL_22:
          sub_100009F38(v4);
          free(v4);
          return 0;
        }
        unint64_t v8 = (uint64_t *)malloc_type_malloc(0x20uLL, 0xA00404900C826uLL);
        if (!v8) {
          goto LABEL_22;
        }
        unsigned int v6 = v8;
        v8[2] = 0;
        v8[3] = (uint64_t)v7;
        unint64_t v9 = *v4;
        uint64_t *v8 = (uint64_t)*v4;
        if (v9) {
          v9[1] = (uint64_t)v8;
        }
        void *v4 = v8;
        v8[1] = (uint64_t)v4;
        uint64_t v10 = 1026;
      }
      else
      {
        if (!v6) {
          goto LABEL_22;
        }
        uint64_t v11 = malloc_type_malloc(0x18uLL, 0xA0040A8488062uLL);
        if (!v11) {
          goto LABEL_22;
        }
        v11[2] = v7;
        BOOL v12 = v6 + 2;
        uint64_t v13 = (void *)v6[2];
        if (v13)
        {
          while (1)
          {
            BOOL v12 = v13;
            if (*(void *)(v7 + 165) > *(void *)(v13[2] + 165)) {
              break;
            }
            uint64_t v13 = (void *)*v13;
            if (!*v12)
            {
              void *v11 = 0;
              *BOOL v12 = v11;
              uint64_t v10 = 173;
              goto LABEL_17;
            }
          }
          uint64_t v14 = v13[1];
          void *v11 = v12;
          v11[1] = v14;
          *(void *)v12[1] = v11;
          v12[1] = v11;
          uint64_t v10 = 173;
        }
        else
        {
          *BOOL v12 = v11;
          uint64_t v10 = 173;
          void *v11 = 0;
LABEL_17:
          v11[1] = v12;
        }
      }
      v7 += v10;
      ++v5;
    }
    while (v5 != v1);
  }
  return v4;
}

uint64_t sub_100009D30(uint64_t a1, char a2)
{
  long long v20 = 0uLL;
  memset(v17, 0, 28);
  v16.tv_sec = 0;
  *(void *)&v16.tv_usec = 0;
  uint64_t v15 = 0;
  bzero(v19, 0x401uLL);
  uint64_t v18 = 0x2A202A202A202ALL;
  gettimeofday(&v16, &v15);
  uint64_t v4 = (_OWORD *)(a1 + 5);
  int v5 = *(unsigned __int8 *)(a1 + 6);
  if (v5 == 30)
  {
    v17[0] = *v4;
    *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)(a1 + 17);
    if ((a2 & 1) == 0)
    {
      uint64_t v10 = gethostbyaddr((char *)v17 + 8, 0x10u, 30);
      if (v10)
      {
        h_name = v10->h_name;
        if (v10->h_name) {
          goto LABEL_13;
        }
      }
    }
    unint64_t v8 = (char *)v17 + 8;
    h_name = v19;
    int v9 = 30;
LABEL_11:
    if (!inet_ntop(v9, v8, v19, 0x401u)) {
      h_name = (char *)&v18;
    }
LABEL_13:
    if ((a2 & 2) != 0) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (v5 == 2)
  {
    long long v20 = *v4;
    if ((a2 & 1) == 0)
    {
      unsigned int v6 = gethostbyaddr((char *)&v20 + 4, 4u, 2);
      if (v6)
      {
        h_name = v6->h_name;
        if (v6->h_name) {
          goto LABEL_13;
        }
      }
    }
    unint64_t v8 = (char *)&v20 + 4;
    h_name = v19;
    int v9 = 2;
    goto LABEL_11;
  }
  h_name = (char *)&v18;
  if ((a2 & 2) != 0)
  {
LABEL_18:
    BOOL v12 = 0;
    uint64_t v13 = 1;
    return ((uint64_t (*)(uint64_t, char *, passwd *, uint64_t))off_100010050[15])(a1, h_name, v12, v13);
  }
LABEL_16:
  uint64_t v11 = getpwuid(*(_DWORD *)(a1 + 1));
  if (!v11) {
    goto LABEL_18;
  }
  BOOL v12 = v11;
  uint64_t v13 = 0;
  return ((uint64_t (*)(uint64_t, char *, passwd *, uint64_t))off_100010050[15])(a1, h_name, v12, v13);
}

void sub_100009F38(uint64_t **a1)
{
  for (unint64_t i = *a1; *a1; unint64_t i = *a1)
  {
    uint64_t v3 = *i;
    if (*i) {
      *(void *)(v3 + 8) = i[1];
    }
    *(void *)i[1] = v3;
    while (1)
    {
      uint64_t v4 = (uint64_t *)i[2];
      if (!v4) {
        break;
      }
      uint64_t v5 = *v4;
      if (*v4) {
        *(void *)(v5 + 8) = v4[1];
      }
      *(void *)v4[1] = v5;
      free(v4);
    }
    free(i);
  }
}

void sub_100009FB0(uint64_t a1, uint64_t a2, char a3)
{
  if (!a1) {
    return;
  }
  if (*(_DWORD *)(a1 + 4))
  {
    uint64_t v5 = sub_100009BA4(a1);
    if (v5)
    {
      unsigned int v6 = v5;
      memset(v15, 0, 173);
      for (unint64_t i = *v5; i; unint64_t i = (uint64_t *)*i)
      {
        unint64_t v8 = (char *)(i[3] + 1);
        puts(v8);
        for (j = (void *)i[2]; j; j = (void *)*j)
        {
          uint64_t v10 = j[2];
          uint64_t v11 = sub_10000A190(v8, v10, a2);
          if (v11)
          {
            uint64_t v12 = v10 + 5;
            *(_DWORD *)((char *)v15 + 1) = *(_DWORD *)(v12 - 4);
            *(_OWORD *)((char *)&v15[9] + 13) = *(_OWORD *)(v12 + 152);
            *(int64x2_t *)((char *)&v15[8] + 5) = vsubq_s64(*(int64x2_t *)(v12 + 128), *(int64x2_t *)(v11 + 133));
            *(void *)((char *)&v15[9] + 5) = *(void *)(v12 + 144) - *(void *)(v11 + 149);
            __memmove_chk();
            uint64_t v13 = v15;
          }
          else
          {
            uint64_t v13 = (_OWORD *)v10;
          }
          sub_100009D30((uint64_t)v13, a3);
        }
      }
      sub_100009F38(v6);
      free(v6);
      return;
    }
    uint64_t v14 = "Not enough  memory for displaying active user statistics";
  }
  else
  {
    uint64_t v14 = "No NFS active user statistics found.";
  }

  puts(v14);
}

uint64_t sub_10000A190(char *__s1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    int v3 = *(_DWORD *)(a3 + 4);
    if (v3)
    {
      BOOL v6 = 0;
      uint64_t v7 = a3 + 8;
      do
      {
        if (*(unsigned char *)v7)
        {
          if (*(unsigned char *)v7 != 1 || v6) {
            return 0;
          }
          BOOL v6 = strcmp(__s1, (const char *)(v7 + 1)) == 0;
          uint64_t v8 = 1026;
        }
        else
        {
          if (v6 && !sub_10000A238(a2, v7)) {
            return v7;
          }
          uint64_t v8 = 173;
        }
        v7 += v8;
        --v3;
      }
      while (v3);
    }
  }
  return 0;
}

BOOL sub_10000A238(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 1) != *(_DWORD *)(a2 + 1)) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 5) != *(unsigned __int8 *)(a2 + 5)) {
    return 1;
  }
  int v2 = *(unsigned __int8 *)(a1 + 6);
  if (v2 != *(unsigned __int8 *)(a2 + 6)) {
    return 1;
  }
  if (v2 == 2) {
    BOOL v3 = HIDWORD(*(void *)(a1 + 5)) == HIDWORD(*(void *)(a2 + 5));
  }
  else {
    BOOL v3 = *(void *)(a1 + 13) == *(void *)(a2 + 13)
  }
      && (unint64_t)(*(_OWORD *)(a1 + 17) >> 32) == (unint64_t)(*(_OWORD *)(a2 + 17) >> 32);
  return !v3;
}

void sub_10000A31C()
{
}

void sub_10000A338()
{
}

void sub_10000A354()
{
}

void sub_10000A370(void **a1)
{
}

void sub_10000A394(void *a1)
{
}

void sub_10000A3B4(void *a1)
{
}

void sub_10000A3D4()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return _CFStringFindAndReplace(theString, stringToFind, replacementString, rangeToSearch, compareOptions);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

void NSLog(NSString *format, ...)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

unsigned int alarm(unsigned int a1)
{
  return _alarm(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

void err(int a1, const char *a2, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

hostent *__cdecl gethostbyaddr(const void *a1, socklen_t a2, int a3)
{
  return _gethostbyaddr(a1, a2, a3);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int getvfsbyname(const char *a1, vfsconf *a2)
{
  return _getvfsbyname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int nfssvc(int a1, void *a2)
{
  return _nfssvc(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return _sigprocmask(a1, a2, a3);
}

int sigsuspend(const sigset_t *a1)
{
  return _sigsuspend(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return [a1 fileHandleWithStandardOutput];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_writeJSONObject_toStream_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeJSONObject:toStream:options:error:];
}