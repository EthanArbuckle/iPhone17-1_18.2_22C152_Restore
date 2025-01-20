uint64_t sub_10000306C(const char *a1)
{
  size_t v2;
  size_t v3;
  uint64_t result;
  int v5;
  int v6;

  v2 = strlen(a1);
  v3 = 0;
  LODWORD(result) = 0;
  v5 = 24;
  do
  {
    if (v2 <= v3) {
      v6 = 32;
    }
    else {
      v6 = a1[v3];
    }
    result = (v6 << v5) | result;
    ++v3;
    v5 -= 8;
  }
  while (v3 != 4);
  return result;
}

uint64_t sub_1000030CC(uint64_t result, _DWORD *a2)
{
  *a2 = bswap32(result);
  return result;
}

uint64_t sub_1000030D8(int a1)
{
  if (a1 - 97 >= 0x17)
  {
    if (a1 - 48 >= 0xA)
    {
      uint64_t v6 = v1;
      uint64_t v7 = v2;
      v5[0] = HIBYTE(a1);
      v5[1] = BYTE2(a1);
      v5[2] = BYTE1(a1);
      v5[3] = a1;
      v5[4] = 0;
      fprintf(__stderrp, "ERROR: Invalid type (%s) passed to ui8SMCGetNumFracBitsFromType.\n", v5);
      exit(-1);
    }
    char v3 = -48;
  }
  else
  {
    char v3 = -87;
  }
  return (v3 + a1);
}

uint64_t sub_100003164(int a1)
{
  if (BYTE1(a1) - 97 >= 0x17)
  {
    if (BYTE1(a1) - 48 >= 0xA)
    {
      uint64_t v6 = v1;
      uint64_t v7 = v2;
      v5[0] = HIBYTE(a1);
      v5[1] = BYTE2(a1);
      v5[2] = BYTE1(a1);
      v5[3] = a1;
      v5[4] = 0;
      fprintf(__stderrp, "ERROR: Invalid type (%s) passed to ui8SMCGetNumIntBitsFromType.\n", v5);
      exit(-1);
    }
    char v3 = -48;
  }
  else
  {
    char v3 = -87;
  }
  return (v3 + BYTE1(a1));
}

uint64_t sub_1000031F0(const char *a1, uint64_t a2)
{
  mach_port_t v4 = sub_100006C64(0, 0);
  if (!v4)
  {
    v10 = __stderrp;
    v11 = "ERROR: Failed to open SMC data port.\n";
    size_t v12 = 37;
LABEL_10:
    fwrite(v11, v12, 1uLL, v10);
    return -1;
  }
  mach_port_t v5 = v4;
  uint64_t v15 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v27 = 0;
  int v16 = sub_10000306C(a1);
  BYTE6(v19) = 9;
  int v6 = sub_100006AA4(2, v5, &v16, outputStruct, 0);
  if (!v6)
  {
    if (BYTE8(outputStruct[2]))
    {
      fprintf(__stderrp, "ERROR: GetKeyInfo for key %s failed with SMC error code 0x%x.\n", a1, BYTE8(outputStruct[2]));
    }
    else
    {
      *(void *)a2 = *(void *)((char *)&outputStruct[1] + 12);
      *(_DWORD *)(a2 + 8) = DWORD1(outputStruct[2]);
    }
    if (!sub_100006DBC(v5)) {
      return BYTE8(outputStruct[2]);
    }
    v10 = __stderrp;
    v11 = "ERROR: Failed to properly close SMC data port.\n";
    size_t v12 = 47;
    goto LABEL_10;
  }
  unsigned __int8 v7 = v6;
  v8 = __stderrp;
  v9 = sub_100006B3C(v6);
  fprintf(v8, "ERROR: GetKeyInfo for key %s failed with OS error %s.\n", a1, v9);
  sub_100006DBC(v5);
  return v7;
}

uint64_t sub_1000033AC(unsigned int a1, _DWORD *a2, mach_port_t connection)
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(outputStruct, 0, sizeof(outputStruct));
  memset(v21, 0, sizeof(v21));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v30 = 0;
  HIDWORD(v22) = a1;
  BYTE10(v22) = 8;
  int v6 = sub_100006AA4(2, connection, v21, outputStruct, 0);
  if (v6)
  {
    unsigned __int8 v7 = v6;
    v8 = __stderrp;
    v9 = sub_100006B3C(v6);
    fprintf(v8, "ERROR: GetKeyFromIndex for index 0x%lx failed with OS error %s.\n", a1, v9);
    sub_100006DBC(connection);
  }
  else
  {
    if (BYTE8(v12)) {
      fprintf(__stderrp, "ERROR: GetKeyFromIndex for index 0x%lx failed with SMC error code 0x%x.\n", a1, BYTE8(v12));
    }
    else {
      *a2 = outputStruct[0];
    }
    if (sub_100006DBC(connection))
    {
      fwrite("ERROR: Failed to properly close SMC data port.\n", 0x2FuLL, 1uLL, __stderrp);
      return -1;
    }
    else
    {
      return BYTE8(v12);
    }
  }
  return v7;
}

uint64_t sub_10000351C(const char *a1, unsigned int a2, void *a3)
{
  mach_port_t v6 = sub_100006C64(0, 0);
  if (!v6)
  {
    long long v12 = __stderrp;
    long long v13 = "ERROR: Failed to open SMC data port.\n";
    size_t v14 = 37;
LABEL_10:
    fwrite(v13, v14, 1uLL, v12);
    return -1;
  }
  mach_port_t v7 = v6;
  uint64_t v19 = 0;
  long long v17 = 0u;
  memset(v18, 0, sizeof(v18));
  memset(outputStruct, 0, sizeof(outputStruct));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v31 = 0;
  int v20 = sub_10000306C(a1);
  DWORD2(v22) = a2;
  BYTE6(v23) = 5;
  int v8 = sub_100006AA4(2, v7, &v20, outputStruct, 0);
  if (!v8)
  {
    if (BYTE8(v17)) {
      fprintf(__stderrp, "ERROR: ReadKey for key %s failed with SMC error code 0x%x.\n", a1, BYTE8(v17));
    }
    else {
      memcpy(a3, v18, a2);
    }
    if (!sub_100006DBC(v7)) {
      return BYTE8(v17);
    }
    long long v12 = __stderrp;
    long long v13 = "ERROR: Failed to properly close SMC data port.\n";
    size_t v14 = 47;
    goto LABEL_10;
  }
  unsigned __int8 v9 = v8;
  v10 = __stderrp;
  v11 = sub_100006B3C(v8);
  fprintf(v10, "ERROR: ReadKey for key %s failed with OS error %s.\n", a1, v11);
  sub_100006DBC(v7);
  return v9;
}

uint64_t sub_1000036E4(const char *a1, int a2)
{
  int v7 = 0;
  uint64_t v6 = 0;
  if (sub_1000031F0(a1, (uint64_t)&v6))
  {
    puts("Not present.");
    exit(-1);
  }
  if (sub_10000351C(a1, v6, v8)) {
    return puts("no data");
  }
  if (a2) {
    printf("%s: ", a1);
  }
  if (v6)
  {
    unint64_t v5 = 0;
    do
      printf("0x%02x ", v8[v5++]);
    while (v5 < v6);
  }
  return putchar(10);
}

uint64_t sub_1000037E4(const char *a1)
{
  int v7 = 0;
  uint64_t v6 = 0;
  printf("\n\n%s Event Buffer:\n", a1);
  int v1 = sub_1000031F0("EVCT", (uint64_t)&v6);
  if (v1) {
    goto LABEL_18;
  }
  if (sub_10000351C("EVCT", v6, v8)) {
    puts("no data");
  }
  else {
    printf("EVCT: 0x%02x %02x\n", v8[0], v8[1]);
  }
  int v1 = sub_1000031F0("EVRD", (uint64_t)&v6);
  if (v1)
  {
LABEL_18:
    printf("FAIL (0x%x).\n", v1);
    exit(-1);
  }
  int v2 = 0;
  for (int i = 0; i != 4; ++i)
  {
    if (sub_10000351C("EVRD", v6, v8))
    {
      puts("no data");
    }
    else
    {
      for (uint64_t j = 0; j != 32; ++j)
      {
        if ((j & 7) == 0)
        {
          if (j) {
            putchar(10);
          }
          printf("Event %d: ", v2++);
        }
        printf("0x%02x ", v8[j]);
      }
      putchar(10);
    }
  }
  sub_1000036E4("EVHF", 1);
  return fflush(__stdoutp);
}

uint64_t start()
{
  printf("## smcDiagnose %0.2f %d\n", 5.0, 200);
  if (sub_100004324()) {
    exit(-1);
  }
  sub_100004374();
  sub_100003E68(1);
  dword_10000C62C = 0;
  sub_1000043B0("#KEY", 1, 0xFFFFFFFF, -1, 0);
  double v0 = sub_100004380();
  unsigned int v1 = v0;
  if (dword_10000C628) {
    printf("## %ld keys\n", v0);
  }
  if (v1 >= 0xFA1)
  {
    unsigned int v1 = 4000;
    printf("## Keys capped at first %ld keys\n", 4000);
  }
  sub_100003EC4(0);
  sub_100004054(0);
  if (v1)
  {
    unsigned int v2 = 0;
    int v3 = 0;
    int v4 = dword_10000C62C;
    do
    {
      unint64_t v5 = (const char *)sub_1000043B0(v9, 0, v2, 0, v4);
      int v4 = dword_10000C62C;
      if (!dword_10000C62C)
      {
        uint64_t v6 = v5;
        if (v5 && strlen(v5) > 1)
        {
          if (dword_10000C628)
          {
            puts(v6);
            int v4 = dword_10000C62C;
          }
          else
          {
            int v4 = 0;
          }
        }
        else
        {
          int v4 = 0;
          ++v3;
        }
      }
      ++v2;
    }
    while (v1 != v2);
  }
  else
  {
    int v3 = 0;
  }
  sub_1000040C4(0);
  double v7 = sub_100004138();
  if (v7 < 1.024) {
    usleep((int)((1.024 - v7) * 1000000.0));
  }
  if (dword_10000C628) {
    printf("Keys not read %d\n", v3);
  }
  sub_100003B6C();
  fflush(__stdoutp);
  return 0;
}

id sub_100003B6C()
{
  if ([(id)qword_10000C648 count])
  {
    unint64_t v0 = 0;
    do
    {
      unsigned int v1 = [(id)qword_10000C648 objectAtIndex:v0];
      unsigned int v2 = [v1 keyString];
      if ([v2 isEqualToString:@"TIME_START"]) {
        sub_100003CD0(v1);
      }
      if ([v2 isEqualToString:@"TIME_DIFF"]) {
        sub_100003CD0(v1);
      }

      ++v0;
    }
    while (v0 < (unint64_t)[(id)qword_10000C648 count]);
  }
  if ([(id)qword_10000C650 count])
  {
    unint64_t v3 = 0;
    do
    {
      int v4 = [(id)qword_10000C650 objectAtIndex:v3];
      sub_100003D8C(v4);

      ++v3;
    }
    while (v3 < (unint64_t)[(id)qword_10000C650 count]);
  }
  id result = [(id)qword_10000C648 count];
  if (result)
  {
    for (unint64_t i = 0; i < (unint64_t)result; ++i)
    {
      double v7 = [(id)qword_10000C648 objectAtIndex:i];
      int v8 = [v7 keyString];
      if ([v8 isEqualToString:@"TIME_END"]) {
        sub_100003CD0(v7);
      }

      id result = [(id)qword_10000C648 count];
    }
  }
  return result;
}

void sub_100003CD0(void *a1)
{
  id v4 = a1;
  id v1 = [v4 keyString];
  printf("%s ", (const char *)[v1 cStringUsingEncoding:1]);

  if ((uint64_t)[v4 numValues] >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      [v4 valueDouble:v2];
      printf(",%f", v3);
      ++v2;
    }
    while (v2 < (uint64_t)[v4 numValues]);
  }
  putchar(10);
}

void sub_100003D8C(void *a1)
{
  id v4 = a1;
  id v1 = [v4 keyString];
  printf("%s ", (const char *)[v1 cStringUsingEncoding:1]);

  if ((uint64_t)[v4 numValues] >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      id v3 = [v4 valueStr:v2];
      printf(",%s", (const char *)[v3 cStringUsingEncoding:1]);

      ++v2;
    }
    while (v2 < (uint64_t)[v4 numValues]);
  }
  putchar(10);
}

void sub_100003E68(int a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_10000C648;
  qword_10000C648 = v2;

  uint64_t v4 = objc_opt_new();
  unint64_t v5 = (void *)qword_10000C650;
  qword_10000C650 = v4;

  dword_10000C658 = a1;
}

void sub_100003EC4(int a1)
{
  id v4 = objc_alloc_init((Class)NSDate);
  [v4 timeIntervalSince1970];
  qword_10000C660 = *(void *)&v2;
  double v3 = v2 - *(double *)&qword_10000C638;
  if (*(double *)&qword_10000C640 <= 0.0) {
    double v3 = 0.0;
  }
  sub_100003F4C(@"TIME_DIFF", a1, v3);
}

void sub_100003F4C(void *a1, int a2, double a3)
{
  id v8 = a1;
  if ([(id)qword_10000C648 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [(id)qword_10000C648 objectAtIndex:v5];
      double v7 = [(keyDataObject *)v6 keyString];
      if ([v7 isEqualToString:v8]) {
        break;
      }

      if (++v5 >= (unint64_t)[(id)qword_10000C648 count]) {
        goto LABEL_5;
      }
    }
    [(keyDataObject *)v6 addToTimeArray:a2 idx:a3];
  }
  else
  {
LABEL_5:
    uint64_t v6 = [[keyDataObject alloc] initWithT:v8];
    [(keyDataObject *)v6 addToTimeArray:a2 idx:a3];
    [(id)qword_10000C648 addObject:v6];
  }
}

void sub_100004054(int a1)
{
  id v4 = objc_alloc_init((Class)NSDate);
  [v4 timeIntervalSince1970];
  sub_100003F4C(@"TIME_START", a1, v2);
  [v4 timeIntervalSince1970];
  qword_10000C638 = v3;
}

void sub_1000040C4(int a1)
{
  id v3 = objc_alloc_init((Class)NSDate);
  [v3 timeIntervalSince1970];
  qword_10000C640 = *(void *)&v2;
  sub_100003F4C(@"TIME_END", a1, v2 - *(double *)&qword_10000C638);
}

double sub_100004138()
{
  double result = *(double *)&qword_10000C640 - *(double *)&qword_10000C638;
  *(double *)&qword_10000C668 = *(double *)&qword_10000C640 - *(double *)&qword_10000C638;
  return result;
}

void sub_100004158(void *a1, void *a2, int a3)
{
  id v9 = a1;
  id v5 = a2;
  if ([(id)qword_10000C650 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      double v7 = [(id)qword_10000C650 objectAtIndex:v6];
      id v8 = [(keyDataObject *)v7 keyString];
      if ([v8 isEqualToString:v9]) {
        break;
      }

      if (++v6 >= (unint64_t)[(id)qword_10000C650 count]) {
        goto LABEL_5;
      }
    }
    [(keyDataObject *)v7 addToValueArray:v5 idx:a3];
  }
  else
  {
LABEL_5:
    double v7 = [[keyDataObject alloc] initWith:v9];
    [(keyDataObject *)v7 addToValueArray:v5 idx:a3];
    [(id)qword_10000C650 addObject:v7];
  }
}

uint64_t sub_100004264()
{
  if (dword_10000C628) {
    puts("Trying to open io connection to SMC Kext");
  }
  dword_10000C630 = sub_100006C64(0, 0);
  if (dword_10000C630)
  {
LABEL_7:
    if (dword_10000C628) {
      puts("Opened access to AppleSMC kext.");
    }
    return 1;
  }
  else
  {
    int v0 = 10;
    while (--v0)
    {
      usleep(0x186A0u);
      dword_10000C630 = sub_100006C64(0, 0);
      if (dword_10000C630) {
        goto LABEL_7;
      }
    }
    printf("ERROR: Could not open connection. Tried %d times.\n", 9);
    return 0;
  }
}

uint64_t sub_100004324()
{
  if (dword_10000C630) {
    return 0;
  }
  fwrite("ERROR: Failed to open SMC data port.\n", 0x25uLL, 1uLL, __stderrp);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100004374()
{
  return dword_10000C630;
}

double sub_100004380()
{
  return *(double *)&qword_10000C670;
}

uint64_t sub_10000438C(uint64_t result, unsigned char *a2)
{
  *a2 = BYTE3(result);
  a2[1] = BYTE2(result);
  a2[2] = BYTE1(result);
  a2[3] = result;
  a2[4] = 0;
  return result;
}

id sub_1000043B0(char *a1, int a2, unsigned int a3, int a4, int a5)
{
  if ((a3 & 0x80000000) != 0)
  {
LABEL_6:
    if (a1) {
      goto LABEL_7;
    }
    return 0;
  }
  if (!a5)
  {
    a1 = sub_1000044DC(a3);
    goto LABEL_6;
  }
  if (a3 >= 0x1F) {
    return 0;
  }
  a1 = &aAupo[9 * a3];
LABEL_7:
  double v7 = +[NSString stringWithFormat:@"%s", a1];
  id v8 = sub_10000463C(v7, a2, a4);

  if ([v8 length])
  {
    if (dword_10000C628) {
      printf("response String = _%s_\n", (const char *)[v8 cStringUsingEncoding:1]);
    }
    id v9 = [v8 cStringUsingEncoding:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

char *sub_1000044BC(int a1)
{
  if (a1 >= 31) {
    return 0;
  }
  else {
    return &aAupo[9 * a1];
  }
}

char *sub_1000044DC(int a1)
{
  memset(v14, 0, sizeof(v14));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v23 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0;
  HIDWORD(v15) = a1;
  BYTE10(v15) = 8;
  if (sub_100006AA4(2, dword_10000C630, v14, outputStruct, 1))
  {
    if (dword_10000C628) {
      printf("IO ERROR using keyfromindex: %d\n");
    }
    return 0;
  }
  if (BYTE8(v5))
  {
    if (dword_10000C628) {
      printf("SMC ERROR using keyfromindex: %d idx %d\n");
    }
    return 0;
  }
  LODWORD(v14[0]) = outputStruct[0];
  double v2 = &byte_10000C678;
  byte_10000C678 = BYTE3(outputStruct[0]);
  byte_10000C679 = BYTE2(outputStruct[0]);
  byte_10000C67A = BYTE1(outputStruct[0]);
  byte_10000C67B = outputStruct[0];
  byte_10000C67C = 0;
  if (dword_10000C628) {
    printf("Key To Read %d =%s\n", a1, &byte_10000C678);
  }
  return v2;
}

id sub_10000463C(void *a1, int a2, int a3)
{
  id v5 = a1;
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  long long v6 = objc_opt_new();
  id v7 = v5;
  long long v8 = (const char *)[v7 cStringUsingEncoding:1];
  for (uint64_t i = 0; i != 756; i += 9)
  {
    if (!strcmp(&aEvrd_0[i], v8)) {
      goto LABEL_30;
    }
  }
  id v10 = v7;
  sub_100004968((const char *)[v10 cStringUsingEncoding:1], &v23, (char *)v20, v18);
  int v11 = v18[0];
  uint64_t v12 = v18[1];
  int v13 = v19;
  [v6 setString:&stru_100008220];
  if (v11 == 1)
  {
    if (a2 && !a3) {
      [v6 appendFormat:@"%s =", [v10 cStringUsingEncoding:1]];
    }
    if (HIDWORD(v24) <= 8 && (v13 - 87) >= 2)
    {
      [v6 appendFormat:@" %f", v12];
      qword_10000C670 = v12;
LABEL_28:
      if (a3 != -1) {
        sub_100004158(v10, v6, a3);
      }
      goto LABEL_30;
    }
    [v6 appendFormat:@" "];
    if (v13 == 5 || v13 == 87 || v13 == 88 && !sub_100004C60(v10)) {
      [v6 appendFormat:@"0x"];
    }
    if (!HIDWORD(v24)) {
      goto LABEL_28;
    }
    unint64_t v14 = 0;
    while (v13 != 5)
    {
      if (v13 == 88)
      {
        BOOL v16 = sub_100004C60(v10);
        uint64_t v15 = *((unsigned __int8 *)v21 + v14);
        if (v16)
        {
          [v6 appendFormat:@"%c ", *((unsigned __int8 *)v21 + v14)];
          goto LABEL_25;
        }
        goto LABEL_22;
      }
      if (v13 == 87) {
        break;
      }
LABEL_25:
      if ((++v14 & 7) == 0) {
        [v6 appendFormat:@" "];
      }
      if (v14 >= HIDWORD(v24)) {
        goto LABEL_28;
      }
    }
    uint64_t v15 = *((unsigned __int8 *)v21 + v14);
LABEL_22:
    [v6 appendFormat:@"%02x ", v15];
    goto LABEL_25;
  }
LABEL_30:

  return v6;
}

uint64_t sub_10000490C(char *__s2)
{
  uint64_t v2 = 0;
  while (strcmp(&aEvrd_0[v2], __s2))
  {
    v2 += 9;
    if (v2 == 756) {
      return 0;
    }
  }
  return 1;
}

void sub_100004968(const char *a1@<X0>, void *a2@<X1>, char *a3@<X2>, void *a4@<X8>)
{
  a2[20] = 0;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((void *)a3 + 20) = 0;
  *((_OWORD *)a3 + 3) = 0u;
  *((_OWORD *)a3 + 4) = 0u;
  *((_OWORD *)a3 + 5) = 0u;
  *((_OWORD *)a3 + 6) = 0u;
  *((_OWORD *)a3 + 7) = 0u;
  *((_OWORD *)a3 + 8) = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  *((_OWORD *)a3 + 2) = 0u;
  *(_OWORD *)a3 = 0u;
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long outputStruct = 0u;
  long long v22 = 0u;
  int v43 = 0;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  *((void *)a3 + 20) = 0;
  *((_OWORD *)a3 + 8) = 0u;
  *((_OWORD *)a3 + 9) = 0u;
  *((_OWORD *)a3 + 9) = 0u;
  *((_OWORD *)a3 + 6) = 0u;
  *((_OWORD *)a3 + 7) = 0u;
  *((_OWORD *)a3 + 4) = 0u;
  *((_OWORD *)a3 + 5) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  int v32 = sub_10000306C(a1);
  BYTE6(v35) = 9;
  int v8 = sub_100006AA4(2, dword_10000C630, &v32, &outputStruct, 1);
  if (v8 || (SBYTE4(v23) & 0x80000000) == 0)
  {
    double v11 = -1.0;
    if (v8) {
      printf("KeyInfo Err for key %s failed %d\n");
    }
    goto LABEL_12;
  }
  int v9 = 0;
  unsigned int v10 = BYTE4(v23);
  double v11 = -1.0;
  if ((BYTE4(v23) & 0x20) == 0 && HIDWORD(v22) <= 0x78)
  {
    *(_DWORD *)a2 = sub_10000306C(a1);
    uint64_t v13 = HIDWORD(v22);
    uint64_t v12 = v23;
    *((_DWORD *)a2 + 7) = HIDWORD(v22);
    v20[0] = BYTE3(v12);
    v20[1] = BYTE2(v12);
    v20[2] = BYTE1(v12);
    _OWORD v20[3] = v12;
    v20[4] = 0;
    uint64_t v14 = sub_100004DB4(v12);
    int v15 = v14;
    *((_DWORD *)a4 + 4) = v14;
    if (dword_10000C628)
    {
      NSLog(@"Key Format = %s  %x %d  - forceValueFormat %d ", v20, v12, v12, v14);
      if (dword_10000C628) {
        NSLog(@"forceValueSize = %d", v13);
      }
    }
    *((unsigned char *)a2 + 42) = 5;
    if (sub_100006AA4(2, dword_10000C630, a2, a3, 1))
    {
      printf("ReadKey Err for key %s failed %d\n");
LABEL_12:
      int v9 = 0;
      goto LABEL_13;
    }
    if (dword_10000C628)
    {
      NSLog(@"RESULT BYTES ");
      if ((int)v13 >= 1)
      {
        long long v17 = (unsigned __int8 *)(a3 + 48);
        uint64_t v18 = v13;
        do
        {
          int v19 = *v17++;
          printf("%x ", v19);
          --v18;
        }
        while (v18);
      }
    }
    dword_10000C218 = (v10 >> 2) & 1;
    if ((int)v13 > 8 || v15 == 87)
    {
      *((_DWORD *)a4 + 4) = v15;
      double v11 = 0.0;
    }
    else
    {
      double v11 = sub_1000056A8(v15, (uint64_t)a2, (uint64_t)a3, v16);
    }
    if (dword_10000C628) {
      NSLog(@"curSensorValue = %f", *(void *)&v11);
    }
    int v9 = 1;
  }
LABEL_13:
  *((double *)a4 + 1) = v11;
  *(_DWORD *)a4 = v9;
}

BOOL sub_100004C60(void *a1)
{
  id v1 = a1;
  BOOL v2 = ![v1 compare:@"MSFL"]
    || ![v1 compare:@"MSFA"]
    || ![v1 compare:@"RBr"]
    || [v1 compare:@"RMde"] == 0;

  return v2;
}

BOOL sub_100004CE4(const char *a1)
{
  uint64_t v3 = 0;
  memset(v2, 0, sizeof(v2));
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v15 = 0;
  int v4 = sub_10000306C(a1);
  BYTE6(v7) = 9;
  return sub_100006AA4(2, dword_10000C630, &v4, v2, 1) == 0;
}

uint64_t sub_100004DB4(int a1)
{
  uint64_t v1 = 5;
  if (a1 <= 1936734262)
  {
    if (a1 > 1936274225)
    {
      if (a1 <= 1936733026)
      {
        if (a1 <= 1936732277)
        {
          if (a1 > 1936275487)
          {
            if (a1 == 1936275488) {
              return 6;
            }
            if (a1 == 1936732262) {
              return 37;
            }
          }
          else
          {
            if (a1 == 1936274226) {
              return 100;
            }
            if (a1 == 1936274996) {
              return 101;
            }
          }
        }
        else if (a1 <= 1936732532)
        {
          if (a1 == 1936732278) {
            return 53;
          }
          if (a1 == 1936732517) {
            return 38;
          }
        }
        else
        {
          switch(a1)
          {
            case 1936732533:
              return 54;
            case 1936732772:
              return 39;
            case 1936732788:
              return 55;
          }
        }
      }
      else if (a1 > 1936733552)
      {
        if (a1 <= 1936733807)
        {
          if (a1 == 1936733553) {
            return 58;
          }
          if (a1 == 1936733753) {
            return 43;
          }
        }
        else
        {
          switch(a1)
          {
            case 1936733808:
              return 59;
            case 1936734008:
              return 9;
            case 1936734063:
              return 60;
          }
        }
      }
      else if (a1 <= 1936733281)
      {
        if (a1 == 1936733027) {
          return 40;
        }
        if (a1 == 1936733043) {
          return 56;
        }
      }
      else
      {
        switch(a1)
        {
          case 1936733282:
            return 41;
          case 1936733298:
            return 57;
          case 1936733537:
            return 42;
        }
      }
      return 87;
    }
    if (a1 > 1718629729)
    {
      if (a1 > 1718641459)
      {
        if (a1 <= 1751480414)
        {
          if (a1 == 1718641460) {
            return 90;
          }
          if (a1 == 1718641970) {
            return 19;
          }
        }
        else if (a1 != 1751480415)
        {
          if (a1 == 1768908404) {
            return 103;
          }
          if (a1 == 1936273718) {
            return 29;
          }
        }
      }
      else if (a1 <= 1718630200)
      {
        if (a1 == 1718629730) {
          return 16;
        }
        if (a1 == 1718629985) {
          return 12;
        }
      }
      else
      {
        switch(a1)
        {
          case 1718630201:
            return 17;
          case 1718630456:
            return 7;
          case 1718640950:
            return 33;
        }
      }
      return 87;
    }
    if (a1 > 1718383647)
    {
      if (a1 <= 1718628964)
      {
        if (a1 == 1718383648) {
          return 91;
        }
        if (a1 == 1718628710) {
          return 13;
        }
      }
      else
      {
        switch(a1)
        {
          case 1718628965:
            return 14;
          case 1718629220:
            return 15;
          case 1718629475:
            return 18;
        }
      }
      return 87;
    }
    if (a1 > 1667785073)
    {
      if (a1 != 1667785074)
      {
        if (a1 == 1718378855) {
          return v1;
        }
        return 87;
      }
      return 88;
    }
    if (a1 == 1651076703) {
      return 89;
    }
    int v2 = 1667774506;
LABEL_78:
    if (a1 != v2) {
      return 87;
    }
    return 88;
  }
  if (a1 <= 1936747106)
  {
    if (a1 <= 1936745321)
    {
      if (a1 <= 1936744756)
      {
        if (a1 > 1936734517)
        {
          if (a1 == 1936734518) {
            return 46;
          }
          if (a1 == 1936734573) {
            return 62;
          }
        }
        else
        {
          if (a1 == 1936734263) {
            return 45;
          }
          if (a1 == 1936734318) {
            return 61;
          }
        }
      }
      else if (a1 <= 1936745011)
      {
        if (a1 == 1936744757) {
          return 47;
        }
        if (a1 == 1936744812) {
          return 63;
        }
      }
      else
      {
        switch(a1)
        {
          case 1936745012:
            return 48;
          case 1936745067:
            return 64;
          case 1936745267:
            return 49;
        }
      }
    }
    else if (a1 > 1936746031)
    {
      if (a1 <= 1936746341)
      {
        if (a1 == 1936746032) {
          return 52;
        }
        if (a1 == 1936746087) {
          return 68;
        }
      }
      else
      {
        switch(a1)
        {
          case 1936746342:
            return 69;
          case 1936746597:
            return 70;
          case 1936746852:
            return 71;
        }
      }
    }
    else if (a1 <= 1936745576)
    {
      if (a1 == 1936745322) {
        return 65;
      }
      if (a1 == 1936745522) {
        return 50;
      }
    }
    else
    {
      switch(a1)
      {
        case 1936745577:
          return 66;
        case 1936745777:
          return 51;
        case 1936745832:
          return 67;
      }
    }
    return 87;
  }
  if (a1 <= 1936749362)
  {
    if (a1 <= 1936748087)
    {
      if (a1 > 1936747616)
      {
        if (a1 == 1936747617) {
          return 74;
        }
        if (a1 == 1936747833) {
          return 75;
        }
      }
      else
      {
        if (a1 == 1936747107) {
          return 72;
        }
        if (a1 == 1936747362) {
          return 73;
        }
      }
    }
    else if (a1 <= 1936748597)
    {
      if (a1 == 1936748088) {
        return 76;
      }
      if (a1 == 1936748343) {
        return 78;
      }
    }
    else
    {
      switch(a1)
      {
        case 1936748598:
          return 79;
        case 1936748853:
          return 80;
        case 1936749108:
          return 81;
      }
    }
    return 87;
  }
  if (a1 <= 1969828657)
  {
    if (a1 <= 1936749872)
    {
      if (a1 == 1936749363) {
        return 82;
      }
      if (a1 == 1936749618) {
        return 83;
      }
    }
    else
    {
      switch(a1)
      {
        case 1936749873:
          return 84;
        case 1936750128:
          return 85;
        case 1969828150:
          return 3;
      }
    }
    return 87;
  }
  if (a1 <= 1969829887)
  {
    if (a1 == 1969828658) {
      return 31;
    }
    if (a1 == 1969829428) {
      return 102;
    }
    return 87;
  }
  if (a1 != 1969829888 && a1 != 1969829920)
  {
    int v2 = 2071094646;
    goto LABEL_78;
  }
  return v1;
}

double sub_1000056A8(int a1, uint64_t a2, uint64_t a3, double a4)
{
  size_t v4 = *(unsigned int *)(a2 + 28);
  double v5 = -1.0;
  if (v4 <= 8)
  {
    qword_10000C688 = 0;
    if (v4) {
      memcpy(&qword_10000C688, (const void *)(a3 + 48), v4);
    }
    switch(a1)
    {
      case 2:
        return 0.0;
      case 3:
      case 23:
LABEL_5:
        unsigned int v7 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v8) = qword_10000C688;
        }
        else {
          LOWORD(v8) = v7;
        }
        return (double)(unsigned __int16)v8;
      case 5:
LABEL_288:
        LOBYTE(a4) = qword_10000C688;
        return (double)*(unint64_t *)&a4;
      case 6:
        return (double)(char)qword_10000C688;
      case 7:
        unsigned int v14 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v15 = qword_10000C688;
        }
        else {
          unsigned __int16 v15 = v14;
        }
        double v16 = (double)v15;
        goto LABEL_256;
      case 9:
      case 44:
        unsigned int v9 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v10) = qword_10000C688;
        }
        else {
          LOWORD(v10) = v9;
        }
        int v10 = (__int16)v10;
        goto LABEL_255;
      case 11:
        unsigned int v17 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          __int16 v18 = qword_10000C688;
        }
        else {
          __int16 v18 = v17;
        }
        float v19 = (float)v18;
        goto LABEL_85;
      case 12:
        unsigned int v20 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v21 = qword_10000C688;
        }
        else {
          unsigned __int16 v21 = v20;
        }
        double v16 = (double)v21;
        goto LABEL_246;
      case 13:
        unsigned int v22 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v23 = qword_10000C688;
        }
        else {
          unsigned __int16 v23 = v22;
        }
        double v16 = (double)v23;
        goto LABEL_221;
      case 14:
        unsigned int v24 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v25 = qword_10000C688;
        }
        else {
          unsigned __int16 v25 = v24;
        }
        double v16 = (double)v25;
        goto LABEL_226;
      case 15:
        unsigned int v26 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v27 = qword_10000C688;
        }
        else {
          unsigned __int16 v27 = v26;
        }
        double v16 = (double)v27;
        goto LABEL_231;
      case 16:
        unsigned int v28 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v29 = qword_10000C688;
        }
        else {
          unsigned __int16 v29 = v28;
        }
        double v16 = (double)v29;
        goto LABEL_241;
      case 17:
        unsigned int v30 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v31 = qword_10000C688;
        }
        else {
          unsigned __int16 v31 = v30;
        }
        double v16 = (double)v31;
        goto LABEL_251;
      case 18:
        unsigned int v32 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v33 = qword_10000C688;
        }
        else {
          unsigned __int16 v33 = v32;
        }
        double v16 = (double)v33;
        goto LABEL_236;
      case 19:
        unsigned int v34 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v35 = qword_10000C688;
        }
        else {
          unsigned __int16 v35 = v34;
        }
        double v16 = (double)v35;
        goto LABEL_282;
      case 20:
        unsigned int v36 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v37 = qword_10000C688;
        }
        else {
          unsigned __int16 v37 = v36;
        }
        double v38 = (double)v37;
        double v39 = 0.25;
        goto LABEL_76;
      case 21:
        unsigned int v40 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v41 = qword_10000C688;
        }
        else {
          unsigned __int16 v41 = v40;
        }
        float v19 = (double)v41 * 0.25;
        goto LABEL_85;
      case 22:
        LOWORD(a4) = qword_10000C688;
        double v16 = (double)*(unint64_t *)&a4;
        goto LABEL_226;
      case 24:
        unsigned int v42 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v43 = qword_10000C688;
        }
        else {
          unsigned __int16 v43 = v42;
        }
        double v38 = (double)v43;
        double v39 = 0.00390625;
LABEL_76:
        float v19 = v38 * v39;
        goto LABEL_90;
      case 25:
        unsigned int v44 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v45 = qword_10000C688;
        }
        else {
          unsigned __int16 v45 = v44;
        }
        float v19 = (float)v45;
        float v46 = 10000.0;
        goto LABEL_92;
      case 26:
        unsigned int v47 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v48 = qword_10000C688;
        }
        else {
          unsigned __int16 v48 = v47;
        }
        float v19 = (float)v48;
LABEL_85:
        int v49 = 1148846080;
        goto LABEL_91;
      case 27:
        unsigned int v50 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v51 = qword_10000C688;
        }
        else {
          unsigned __int16 v51 = v50;
        }
        float v19 = (float)v51;
LABEL_90:
        int v49 = 1120403456;
LABEL_91:
        float v46 = *(float *)&v49;
LABEL_92:
        float v52 = v19 / v46;
        goto LABEL_312;
      case 29:
      case 52:
        unsigned int v11 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v12) = qword_10000C688;
        }
        else {
          LOWORD(v12) = v11;
        }
        return (double)(__int16)v12;
      case 31:
LABEL_289:
        unsigned int v133 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          return (double)qword_10000C688;
        }
        else {
          return (double)v133;
        }
      case 33:
        unsigned int v53 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v54 = qword_10000C688;
        }
        else {
          unsigned __int16 v54 = v53;
        }
        double v16 = (double)v54;
        goto LABEL_265;
      case 37:
        unsigned int v55 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v56) = qword_10000C688;
        }
        else {
          LOWORD(v56) = v55;
        }
        int v56 = (__int16)v56;
        goto LABEL_220;
      case 38:
        unsigned int v57 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v58) = qword_10000C688;
        }
        else {
          LOWORD(v58) = v57;
        }
        int v58 = (__int16)v58;
        goto LABEL_225;
      case 39:
        unsigned int v59 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v60) = qword_10000C688;
        }
        else {
          LOWORD(v60) = v59;
        }
        int v60 = (__int16)v60;
        goto LABEL_230;
      case 40:
        unsigned int v61 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v62) = qword_10000C688;
        }
        else {
          LOWORD(v62) = v61;
        }
        int v62 = (__int16)v62;
        goto LABEL_235;
      case 41:
        unsigned int v63 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v64) = qword_10000C688;
        }
        else {
          LOWORD(v64) = v63;
        }
        int v64 = (__int16)v64;
        goto LABEL_240;
      case 42:
        unsigned int v65 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v66) = qword_10000C688;
        }
        else {
          LOWORD(v66) = v65;
        }
        int v66 = (__int16)v66;
        goto LABEL_245;
      case 43:
        unsigned int v67 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v68) = qword_10000C688;
        }
        else {
          LOWORD(v68) = v67;
        }
        int v68 = (__int16)v68;
        goto LABEL_250;
      case 45:
        unsigned int v69 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v70) = qword_10000C688;
        }
        else {
          LOWORD(v70) = v69;
        }
        int v70 = (__int16)v70;
        goto LABEL_260;
      case 46:
        unsigned int v71 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v72) = qword_10000C688;
        }
        else {
          LOWORD(v72) = v71;
        }
        int v72 = (__int16)v72;
        goto LABEL_264;
      case 47:
        unsigned int v73 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v74) = qword_10000C688;
        }
        else {
          LOWORD(v74) = v73;
        }
        int v74 = (__int16)v74;
        goto LABEL_269;
      case 48:
        unsigned int v75 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v76) = qword_10000C688;
        }
        else {
          LOWORD(v76) = v75;
        }
        int v76 = (__int16)v76;
        goto LABEL_273;
      case 49:
        unsigned int v77 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v78) = qword_10000C688;
        }
        else {
          LOWORD(v78) = v77;
        }
        int v78 = (__int16)v78;
        goto LABEL_277;
      case 50:
        unsigned int v79 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v80) = qword_10000C688;
        }
        else {
          LOWORD(v80) = v79;
        }
        int v80 = (__int16)v80;
        goto LABEL_281;
      case 51:
        unsigned int v81 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          LOWORD(v82) = qword_10000C688;
        }
        else {
          LOWORD(v82) = v81;
        }
        int v82 = (__int16)v82;
        goto LABEL_286;
      case 53:
        unsigned int v83 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v84 = qword_10000C688;
        }
        else {
          int v84 = v83;
        }
        double v16 = (double)v84;
        uint64_t v85 = 0x3E00000000000000;
        goto LABEL_309;
      case 54:
        unsigned int v86 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v87 = qword_10000C688;
        }
        else {
          int v87 = v86;
        }
        double v16 = (double)v87;
        uint64_t v85 = 0x3E10000000000000;
        goto LABEL_309;
      case 55:
        unsigned int v88 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v89 = qword_10000C688;
        }
        else {
          int v89 = v88;
        }
        double v16 = (double)v89;
        uint64_t v85 = 0x3E20000000000000;
        goto LABEL_309;
      case 56:
        unsigned int v90 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v91 = qword_10000C688;
        }
        else {
          int v91 = v90;
        }
        double v16 = (double)v91;
        uint64_t v85 = 0x3E30000000000000;
        goto LABEL_309;
      case 57:
        unsigned int v92 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v93 = qword_10000C688;
        }
        else {
          int v93 = v92;
        }
        double v16 = (double)v93;
        uint64_t v85 = 0x3E40000000000000;
        goto LABEL_309;
      case 58:
        unsigned int v94 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v95 = qword_10000C688;
        }
        else {
          int v95 = v94;
        }
        double v16 = (double)v95;
        uint64_t v85 = 0x3E50000000000000;
        goto LABEL_309;
      case 59:
        unsigned int v96 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v97 = qword_10000C688;
        }
        else {
          int v97 = v96;
        }
        double v16 = (double)v97;
        uint64_t v85 = 0x3E60000000000000;
        goto LABEL_309;
      case 60:
        unsigned int v98 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v99 = qword_10000C688;
        }
        else {
          int v99 = v98;
        }
        double v16 = (double)v99;
        uint64_t v85 = 0x3E70000000000000;
        goto LABEL_309;
      case 61:
        unsigned int v100 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v101 = qword_10000C688;
        }
        else {
          int v101 = v100;
        }
        double v16 = (double)v101;
        uint64_t v85 = 0x3E80000000000000;
        goto LABEL_309;
      case 62:
        unsigned int v102 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v103 = qword_10000C688;
        }
        else {
          int v103 = v102;
        }
        double v16 = (double)v103;
        uint64_t v85 = 0x3E90000000000000;
        goto LABEL_309;
      case 63:
        unsigned int v104 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v105 = qword_10000C688;
        }
        else {
          int v105 = v104;
        }
        double v106 = (double)v105 / 2097408.0;
        goto LABEL_311;
      case 64:
        unsigned int v107 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v108 = qword_10000C688;
        }
        else {
          int v108 = v107;
        }
        double v16 = (double)v108;
        uint64_t v85 = 0x3EB0000000000000;
        goto LABEL_309;
      case 65:
        unsigned int v109 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v110 = qword_10000C688;
        }
        else {
          int v110 = v109;
        }
        double v16 = (double)v110;
        uint64_t v85 = 0x3EC0000000000000;
        goto LABEL_309;
      case 66:
        unsigned int v111 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v112 = qword_10000C688;
        }
        else {
          int v112 = v111;
        }
        double v16 = (double)v112;
        uint64_t v85 = 0x3ED0000000000000;
        goto LABEL_309;
      case 67:
        unsigned int v113 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v114 = qword_10000C688;
        }
        else {
          int v114 = v113;
        }
        double v16 = (double)v114;
        uint64_t v85 = 0x3EE0000000000000;
        goto LABEL_309;
      case 68:
        unsigned int v115 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v116 = qword_10000C688;
        }
        else {
          int v116 = v115;
        }
        double v16 = (double)v116;
        goto LABEL_308;
      case 69:
        unsigned int v117 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v56 = qword_10000C688;
        }
        else {
          int v56 = v117;
        }
LABEL_220:
        double v16 = (double)v56;
LABEL_221:
        uint64_t v85 = 0x3F00000000000000;
        goto LABEL_309;
      case 70:
        unsigned int v118 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v58 = qword_10000C688;
        }
        else {
          int v58 = v118;
        }
LABEL_225:
        double v16 = (double)v58;
LABEL_226:
        uint64_t v85 = 0x3F10000000000000;
        goto LABEL_309;
      case 71:
        unsigned int v119 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v60 = qword_10000C688;
        }
        else {
          int v60 = v119;
        }
LABEL_230:
        double v16 = (double)v60;
LABEL_231:
        uint64_t v85 = 0x3F20000000000000;
        goto LABEL_309;
      case 72:
        unsigned int v120 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v62 = qword_10000C688;
        }
        else {
          int v62 = v120;
        }
LABEL_235:
        double v16 = (double)v62;
LABEL_236:
        uint64_t v85 = 0x3F30000000000000;
        goto LABEL_309;
      case 73:
        unsigned int v121 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v64 = qword_10000C688;
        }
        else {
          int v64 = v121;
        }
LABEL_240:
        double v16 = (double)v64;
LABEL_241:
        uint64_t v85 = 0x3F40000000000000;
        goto LABEL_309;
      case 74:
        unsigned int v122 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v66 = qword_10000C688;
        }
        else {
          int v66 = v122;
        }
LABEL_245:
        double v16 = (double)v66;
LABEL_246:
        uint64_t v85 = 0x3F50000000000000;
        goto LABEL_309;
      case 75:
        unsigned int v123 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v68 = qword_10000C688;
        }
        else {
          int v68 = v123;
        }
LABEL_250:
        double v16 = (double)v68;
LABEL_251:
        uint64_t v85 = 0x3F60000000000000;
        goto LABEL_309;
      case 76:
        unsigned int v124 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v10 = qword_10000C688;
        }
        else {
          int v10 = v124;
        }
LABEL_255:
        double v16 = (double)v10;
LABEL_256:
        uint64_t v85 = 0x3F70000000000000;
        goto LABEL_309;
      case 78:
        unsigned int v125 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v70 = qword_10000C688;
        }
        else {
          int v70 = v125;
        }
LABEL_260:
        double v16 = (double)v70;
        uint64_t v85 = 0x3F80000000000000;
        goto LABEL_309;
      case 79:
        unsigned int v126 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v72 = qword_10000C688;
        }
        else {
          int v72 = v126;
        }
LABEL_264:
        double v16 = (double)v72;
LABEL_265:
        uint64_t v85 = 0x3F90000000000000;
        goto LABEL_309;
      case 80:
        unsigned int v127 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v74 = qword_10000C688;
        }
        else {
          int v74 = v127;
        }
LABEL_269:
        double v16 = (double)v74;
        uint64_t v85 = 0x3FA0000000000000;
        goto LABEL_309;
      case 81:
        unsigned int v128 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v76 = qword_10000C688;
        }
        else {
          int v76 = v128;
        }
LABEL_273:
        double v16 = (double)v76;
        goto LABEL_301;
      case 82:
        unsigned int v129 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v78 = qword_10000C688;
        }
        else {
          int v78 = v129;
        }
LABEL_277:
        double v16 = (double)v78;
        double v130 = 0.125;
        goto LABEL_310;
      case 83:
        unsigned int v131 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v80 = qword_10000C688;
        }
        else {
          int v80 = v131;
        }
LABEL_281:
        double v16 = (double)v80;
LABEL_282:
        double v130 = 0.25;
        goto LABEL_310;
      case 84:
        unsigned int v132 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          int v82 = qword_10000C688;
        }
        else {
          int v82 = v132;
        }
LABEL_286:
        double v16 = (double)v82;
        double v130 = 0.5;
        goto LABEL_310;
      case 85:
      case 100:
        unsigned int v13 = bswap32(qword_10000C688);
        if (dword_10000C218) {
          return (double)(int)qword_10000C688;
        }
        else {
          return (double)(int)v13;
        }
      case 87:
        switch((int)v4)
        {
          case 1:
            goto LABEL_288;
          case 2:
            goto LABEL_5;
          case 4:
            goto LABEL_289;
          case 8:
            goto LABEL_293;
          default:
            return v5;
        }
        return v5;
      case 90:
        unsigned int v136 = bswap32((unsigned __int16)qword_10000C688) >> 16;
        if (dword_10000C218) {
          unsigned __int16 v137 = qword_10000C688;
        }
        else {
          unsigned __int16 v137 = v136;
        }
        double v16 = (double)v137;
LABEL_301:
        uint64_t v85 = 0x3FB0000000000000;
        goto LABEL_309;
      case 91:
        float v52 = *(float *)&qword_10000C688;
        goto LABEL_312;
      case 101:
        unint64_t v138 = bswap64(qword_10000C688);
        if (dword_10000C218) {
          return (double)qword_10000C688;
        }
        else {
          return (double)(uint64_t)v138;
        }
      case 102:
LABEL_293:
        unint64_t v134 = bswap64(qword_10000C688);
        if (dword_10000C218) {
          return (double)(unint64_t)qword_10000C688;
        }
        else {
          return (double)v134;
        }
      case 103:
        double v16 = (double)qword_10000C688;
LABEL_308:
        uint64_t v85 = 0x3EF0000000000000;
LABEL_309:
        double v130 = *(double *)&v85;
LABEL_310:
        double v106 = v16 * v130;
LABEL_311:
        float v52 = v106;
LABEL_312:
        double v5 = v52;
        break;
      default:
        return v5;
    }
  }
  return v5;
}

uint64_t sub_1000063B4(uint64_t a1, const char *a2, unsigned int a3, unsigned __int8 *a4)
{
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v22, 0, sizeof(v22));
  int v23 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  uint64_t v18 = 0;
  int v19 = sub_10000306C(a2);
  if (dword_10000C628) {
    printf("writing key %s to value %x %x\n", a2, *a4, a4[1]);
  }
  DWORD2(v21) = a3;
  v22[6] = 6;
  if (a3) {
    memcpy(&v22[12], a4, a3);
  }
  int v7 = dword_10000C628;
  if (dword_10000C628)
  {
    NSLog(@"Inside Function");
    int v7 = dword_10000C628;
  }
  if (a3)
  {
    uint64_t v8 = a3;
    unsigned int v9 = &v22[12];
    int v10 = v7;
    do
    {
      if (v10)
      {
        printf("%x ", *v9);
        int v7 = dword_10000C628;
        int v10 = dword_10000C628;
      }
      ++v9;
      --v8;
    }
    while (v8);
  }
  if (v7)
  {
    putchar(10);
    int v7 = dword_10000C628;
  }
  if (a3)
  {
    uint64_t v11 = a3;
    int v12 = &v22[12];
    int v13 = v7;
    do
    {
      if (v13)
      {
        printf("%c ", *v12);
        int v7 = dword_10000C628;
        int v13 = dword_10000C628;
      }
      ++v12;
      --v11;
    }
    while (v11);
  }
  if (v7) {
    putchar(10);
  }
  int v14 = sub_100006AA4(2, dword_10000C630, &v19, outputStruct, 1);
  unsigned __int8 v15 = v14;
  if (dword_10000C628) {
    printf("writing key double result = %d\n", v14);
  }
  return v15;
}

uint64_t sub_1000065C0(mach_port_t a1, const char *a2, int a3, unsigned __int8 *a4)
{
  LODWORD(v5) = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  memset(v28, 0, sizeof(v28));
  int v29 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v24 = 0;
  int v25 = sub_10000306C(a2);
  if (dword_10000C628) {
    printf("writing key %s to sz %d value %x %x\n", a2, v5, *a4, a4[1]);
  }
  DWORD2(v27) = v5;
  v28[6] = 6;
  if (!v5)
  {
    if (!dword_10000C628) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v5 = v5;
  uint64_t v8 = v5;
  do
  {
    char v9 = *a4++;
    v28[v8-- + 11] = v9;
  }
  while (v8);
  int v10 = dword_10000C628;
  uint64_t v11 = &v28[12];
  int v12 = dword_10000C628;
  do
  {
    if (v12)
    {
      printf("%x ", *v11);
      int v10 = dword_10000C628;
      int v12 = dword_10000C628;
    }
    ++v11;
    --v5;
  }
  while (v5);
  if (v10) {
LABEL_11:
  }
    putchar(10);
LABEL_12:
  int v13 = sub_100006AA4(2, a1, &v25, outputStruct, 1);
  if (dword_10000C628 && (v13 || BYTE8(v16))) {
    printf("writing key double result = %d  smcpOutput.result %d\n", v13, BYTE8(v16));
  }
  return BYTE8(v16);
}

uint64_t sub_10000677C()
{
  return 31;
}

uint64_t sub_100006AA4(int a1, mach_port_t connection, const void *a3, void *outputStruct, int a5)
{
  if (a1 == 2)
  {
    size_t outputStructCnt = 168;
    uint64_t v6 = IOConnectCallStructMethod(connection, 2u, a3, 0xA8uLL, outputStruct, &outputStructCnt);
    if (a5) {
      return v6;
    }
  }
  else
  {
    printf("ASMCF::callFunction ERROR: unrecognized index(%d)\n", a1);
    uint64_t v6 = 3758097084;
    if (a5) {
      return v6;
    }
  }
  if (v6)
  {
    int v7 = sub_100006B3C(v6);
    printf("ASMCF::callFunction ERROR: IOConnectMethod returned %s\n", v7);
  }
  return v6;
}

const char *sub_100006B3C(int a1)
{
  switch(a1)
  {
    case -536870212:
      double result = "kIOReturnError";
      break;
    case -536870211:
    case -536870210:
    case -536870209:
    case -536870208:
    case -536870205:
    case -536870204:
    case -536870202:
    case -536870200:
      goto LABEL_6;
    case -536870207:
      double result = "kIOReturnNotPrivileged";
      break;
    case -536870206:
      double result = "kIOReturnBadArgument";
      break;
    case -536870203:
      double result = "kIOReturnExclusiveAccess";
      break;
    case -536870201:
      double result = "kIOReturnUnsupported";
      break;
    case -536870199:
      double result = "kIOReturnInternalError";
      break;
    case -536870198:
      double result = "kIOReturnIOError";
      break;
    default:
      if (a1 == -536870174)
      {
        double result = "kIOReturnNotPermitted";
      }
      else if (a1)
      {
LABEL_6:
        printf("smc unknown error (0x%02x)\n", a1);
        double result = "unknown error";
      }
      else
      {
        double result = "kIOReturnSuccess";
      }
      break;
  }
  return result;
}

uint64_t sub_100006C64(uint32_t a1, int a2)
{
  kern_return_t v4;
  mach_port_t v5;
  CFDictionaryRef v6;
  kern_return_t MatchingServices;
  io_service_t v9;
  kern_return_t v10;
  const char *v11;
  kern_return_t v12;
  io_connect_t connect;
  mach_port_t mainPort[2];

  *(void *)mainPort = 0;
  connect = 0;
  size_t v4 = IOMasterPort(0, &mainPort[1]);
  if (v4)
  {
    sub_100006B3C(v4);
    printf("ASMCF::openAppleSMC ERROR - IOMasterPort returned %s\n");
    return 0;
  }
  uint64_t v5 = mainPort[1];
  uint64_t v6 = IOServiceMatching("AppleSMC");
  MatchingServices = IOServiceGetMatchingServices(v5, v6, mainPort);
  if (MatchingServices)
  {
    sub_100006B3C(MatchingServices);
    printf("ASMCF::openAppleSMC ERROR - IOServiceGetMatchingServices returned %s\n");
    return 0;
  }
  char v9 = IOIteratorNext(mainPort[0]);
  IOObjectRelease(mainPort[0]);
  if (!v9)
  {
    if (!a2) {
      return 0;
    }
    uint64_t v11 = "ASMCF::callFunction ERROR - could not find AppleSMC";
LABEL_16:
    puts(v11);
    return 0;
  }
  int v10 = IOServiceOpen(v9, mach_task_self_, a1, &connect);
  IOObjectRelease(v9);
  if (v10)
  {
    sub_100006B3C(v10);
    printf("ASMCF::callFunction ERROR - IOServiceOpen returned %s\n");
    return 0;
  }
  if (!connect)
  {
    uint64_t v11 = "ASMCF::callFunction ERROR - resultPort == NULL";
    goto LABEL_16;
  }
  int v12 = IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0);
  if (!v12) {
    return connect;
  }
  sub_100006B3C(v12);
  printf("ASMCF::callFunction ERROR - OpenUserClient returned %s\n");
  return 0;
}

uint64_t sub_100006DBC(mach_port_t a1)
{
  kern_return_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;

  int v2 = IOConnectCallScalarMethod(a1, 1u, 0, 0, 0, 0);
  if (v2)
  {
    uint64_t v3 = sub_100006B3C(v2);
    printf("ASMCF::callFunction ERROR: CloseUserClient returned %s\n", v3);
  }
  size_t v4 = IOServiceClose(a1);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = sub_100006B3C(v4);
    printf("ASMCF::callFunction ERROR: IOServiceClose returned %s\n", v6);
  }
  return v5;
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

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void NSLog(NSString *format, ...)
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

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_keyString(void *a1, const char *a2, ...)
{
  return [a1 keyString];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_numValues(void *a1, const char *a2, ...)
{
  return [a1 numValues];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_valueStr_(void *a1, const char *a2, ...)
{
  return [a1 valueStr:];
}