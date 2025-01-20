__n128 sub_100002534(uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  const char *v11;
  long long v12;
  __n128 result;

  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 0;
  if (a2 <= 2130)
  {
    if (a2 <= 1555)
    {
      if (a2 <= 1367)
      {
        if (a2 == 1029)
        {
          if ((a5 & 0xFFFFFFFE) == 0x1E)
          {
            *(void *)a1 = &unk_1001D0000;
            *(_DWORD *)(a1 + 8) = 38436;
            v11 = "/usr/local/share/firmware/isp/9724_01XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_1001DA000;
            *(_DWORD *)(a1 + 8) = 37576;
            v11 = "/usr/local/share/firmware/isp/9723_01XX.dat";
          }
        }
        else
        {
          if (a2 != 1300) {
            return result;
          }
          *(void *)a1 = &unk_100040000;
          *(_DWORD *)(a1 + 8) = 41368;
          v11 = "/usr/local/share/firmware/isp/2820_01XX.dat";
        }
      }
      else
      {
        switch(a2)
        {
          case 1368:
            if (a5 == 16 || a5 == 9)
            {
              *(void *)a1 = &unk_1001EB000;
              *(_DWORD *)(a1 + 8) = 44352;
              v11 = "/usr/local/share/firmware/isp/1922_02XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_1001F6000;
              *(_DWORD *)(a1 + 8) = 44352;
              v11 = "/usr/local/share/firmware/isp/1921_01XX.dat";
            }
            break;
          case 1394:
            *(void *)a1 = &unk_10004B000;
            *(_DWORD *)(a1 + 8) = 24392;
            v11 = "/usr/local/share/firmware/isp/1020_03XX.dat";
            break;
          case 1395:
            *(void *)a1 = &unk_100051000;
            *(_DWORD *)(a1 + 8) = 14260;
            v11 = "/usr/local/share/firmware/isp/0019_02XX.dat";
            break;
          default:
            return result;
        }
      }
      goto LABEL_70;
    }
    if (a2 <= 1811)
    {
      switch(a2)
      {
        case 1556:
          if ((a5 & 0xFFFFFFFE) == 0x1E)
          {
            *(void *)a1 = &unk_100201000;
            *(_DWORD *)(a1 + 8) = 60780;
            v11 = "/usr/local/share/firmware/isp/2924_01XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_100210000;
            *(_DWORD *)(a1 + 8) = 60780;
            v11 = "/usr/local/share/firmware/isp/2921_02XX.dat";
          }
          break;
        case 1587:
          if ((a5 - 69) > 1)
          {
            if ((a5 - 71) > 1)
            {
              *(void *)a1 = &unk_10011D000;
              *(_DWORD *)(a1 + 8) = 65748;
              v11 = "/usr/local/share/firmware/isp/3623_01XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_10010C000;
              *(_DWORD *)(a1 + 8) = 65748;
              v11 = "/usr/local/share/firmware/isp/3624_01XX.dat";
            }
          }
          else
          {
            *(void *)a1 = &unk_1000FB000;
            *(_DWORD *)(a1 + 8) = 65748;
            v11 = "/usr/local/share/firmware/isp/3624_02XX.dat";
          }
          break;
        case 1811:
          *(void *)a1 = &unk_10017C000;
          *(_DWORD *)(a1 + 8) = 37400;
          v11 = "/usr/local/share/firmware/isp/4723_01XX.dat";
          break;
        default:
          return result;
      }
      goto LABEL_70;
    }
    if (a2 == 1812)
    {
      *(void *)a1 = &unk_1000F0000;
      *(_DWORD *)(a1 + 8) = 41368;
      v11 = "/usr/local/share/firmware/isp/2022_01XX.dat";
      goto LABEL_70;
    }
    if (a2 != 2051)
    {
      if (a2 != 2068) {
        return result;
      }
      *(void *)a1 = &unk_1000D0000;
      *(_DWORD *)(a1 + 8) = 127884;
      v11 = "/usr/local/share/firmware/isp/2123_01XX.dat";
      goto LABEL_70;
    }
    goto LABEL_40;
  }
  if (a2 <= 2391)
  {
    if (a2 > 2322)
    {
      switch(a2)
      {
        case 2323:
          if (a5 != 67 || a11)
          {
            if ((a5 - 69) > 1)
            {
              *(void *)a1 = &unk_10015A000;
              *(_DWORD *)(a1 + 8) = 138436;
              v11 = "/usr/local/share/firmware/isp/4523_02XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_100138000;
              *(_DWORD *)(a1 + 8) = 138436;
              v11 = "/usr/local/share/firmware/isp/4524_01XX.dat";
            }
          }
          else
          {
            *(void *)a1 = &unk_10012E000;
            *(_DWORD *)(a1 + 8) = 37420;
            v11 = "/usr/local/share/firmware/isp/4523_01XX.dat";
          }
          break;
        case 2324:
          *(void *)a1 = &unk_100031000;
          *(_DWORD *)(a1 + 8) = 58560;
          v11 = "/usr/local/share/firmware/isp/2325_01XX.dat";
          break;
        case 2339:
          *(void *)a1 = &unk_1000C7000;
          *(_DWORD *)(a1 + 8) = 36168;
          v11 = "/usr/local/share/firmware/isp/8824_01XX.dat";
          break;
        default:
          return result;
      }
      goto LABEL_70;
    }
    if (a2 != 2131)
    {
      if (a2 == 2307)
      {
        *(void *)a1 = &unk_1000A1000;
        *(_DWORD *)(a1 + 8) = 152192;
        v11 = "/usr/local/share/firmware/isp/7424_01XX.dat";
      }
      else
      {
        if (a2 != 2308) {
          return result;
        }
        *(void *)a1 = &unk_1001AB000;
        *(_DWORD *)(a1 + 8) = 149496;
        v11 = "/usr/local/share/firmware/isp/7524_01XX.dat";
      }
      goto LABEL_70;
    }
LABEL_40:
    *(void *)a1 = &unk_100186000;
    *(_DWORD *)(a1 + 8) = 149496;
    v11 = "/usr/local/share/firmware/isp/7623_01XX.dat";
LABEL_70:
    v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)(a1 + 12) = *(_OWORD *)v11;
    *(_OWORD *)(a1 + 28) = v12;
    result = *(__n128 *)(v11 + 28);
    *(__n128 *)(a1 + 40) = result;
    return result;
  }
  if (a2 <= 2433)
  {
    switch(a2)
    {
      case 2392:
        *(void *)a1 = &unk_1001E4000;
        *(_DWORD *)(a1 + 8) = 28660;
        v11 = "/usr/local/share/firmware/isp/2224_01XX.dat";
        break;
      case 2418:
        *(void *)a1 = &unk_100076000;
        *(_DWORD *)(a1 + 8) = 172804;
        v11 = "/usr/local/share/firmware/isp/3524_01XX.dat";
        break;
      case 2419:
        *(void *)a1 = &unk_100055000;
        *(_DWORD *)(a1 + 8) = 132136;
        v11 = "/usr/local/share/firmware/isp/4425_01XX.dat";
        break;
      default:
        return result;
    }
    goto LABEL_70;
  }
  if (a2 == 2434)
  {
    *(void *)a1 = &unk_10021F000;
    *(_DWORD *)(a1 + 8) = 149364;
    v11 = "/usr/local/share/firmware/isp/7324_01XX.dat";
    goto LABEL_70;
  }
  if (a2 == 3414 || a2 == 20584)
  {
    if (a3 == 2)
    {
      *(void *)a1 = &unk_100246000;
      *(_DWORD *)(a1 + 8) = 7040;
      v11 = "/usr/local/share/firmware/isp/6222_01XX.dat";
    }
    else
    {
      *(void *)a1 = &unk_100244000;
      *(_DWORD *)(a1 + 8) = 7040;
      v11 = "/usr/local/share/firmware/isp/6221_01XX.dat";
    }
    goto LABEL_70;
  }
  return result;
}

double sub_100002A70(uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  *(void *)&double result = sub_100002534(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, a11).n128_u64[0];
  return result;
}

uint64_t sub_100002A80()
{
  v0 = +[NSFileManager defaultManager];
  v1 = +[NSString stringWithUTF8String:"/var/mobile/Documents/Pearl/ProjectorValid.bin"];
  if ([(NSFileManager *)v0 fileExistsAtPath:v1]
    && (id v3 = 0, ![(NSFileManager *)v0 removeItemAtPath:v1 error:&v3]))
  {
    NSLog(@"Failed to remove %s token: %@", "Pearl", [v3 description]);
    return 0;
  }
  else
  {
    sub_100002B2C("token was removed");
    return 1;
  }
}

void sub_100002B2C(char *a1, ...)
{
  va_start(va, a1);
  v9 = 0;
  uint64_t v1 = vasprintf(&v9, a1, va);
  if (v9)
  {
    id v2 = objc_alloc_init((Class)NSDateFormatter);
    [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    id v3 = [[v2 stringFromDate:+[NSDate date](NSDate, "date")];
    v4 = +[NSString stringWithFormat:@"%@ %s\n", v3, v9, va];

    free(v9);
    v9 = 0;
    v5 = fopen("/var/mobile/Documents/Tokens.log", "a");
    if (v5)
    {
      v6 = v5;
      fwrite([(NSString *)v4 UTF8String], [(NSString *)v4 length], 1uLL, v5);
      fclose(v6);
    }
    else
    {
      NSLog(@"Failed to open token log file.", v7, v8);
    }
  }
  else
  {
    NSLog(@"Failed to create log message string with code: %d (0x%X)", v1, v1);
  }
}

BOOL sub_100002C4C(char *a1)
{
  CFNumberRef v2 = (const __CFNumber *)MGCopyAnswer();
  CFNumberRef v3 = v2;
  if (v2)
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberSInt64Type, &valuePtr);
    snprintf(a1, 0x20uLL, "%lld", valuePtr);
    CFRelease(v3);
  }
  else
  {
    NSLog(@"Failed to read unique chip identifier");
  }
  return v3 != 0;
}

uint64_t sub_100002CDC(int a1, uint64_t a2, time_t *a3)
{
  if (![+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:+[NSString stringWithUTF8String:"/var/mobile/Documents/Pearl/ProjectorValid.bin"]])
  {
    sub_100002B2C("Can't activate %s projector: no projector token found");
    return 0;
  }
  nullsub_3(__s2);
  if ((sub_100003170((uint64_t)__s2, "/var/mobile/Documents/Pearl/ProjectorValid.bin") & 1) == 0)
  {
    sub_100002B2C("Failed to read %s projector token file. Token will be removed.");
    goto LABEL_23;
  }
  time_t v5 = time(0);
  time_t v6 = v15;
  if (v5 > v15)
  {
    sub_100002B2C("%s token timeout was reached (current time %ld). Token will be removed.");
LABEL_23:
    sub_100002A80();
    return 0;
  }
  if (v5 > v14 + 43200)
  {
    sub_100002B2C("%s token has exceeded max allowed timeout. Token will be removed.");
    goto LABEL_23;
  }
  if (!sub_100002C4C(__s1))
  {
    sub_100002B2C("Failed to read unique chip ID");
    return 0;
  }
  if (strcmp(__s1, (const char *)__s2))
  {
    sub_100002B2C("%s token does not match device. Token will be removed.");
    goto LABEL_23;
  }
  unint64_t v7 = 0;
  while (v7 >= __s2[16] || __s2[v7 + 17] != a1 || a1 == 0)
  {
    if (++v7 == 8)
    {
      sub_100002B2C("%s token doesn't match platform. Token will be removed.");
      goto LABEL_23;
    }
  }
  if (v17)
  {
    uint64_t v10 = sub_100002F8C();
    if (v10 == -1 || v10 > v14)
    {
      sub_100002B2C("System performed boot since %s token creation (boot time: %ld). Token will be removed.");
      goto LABEL_23;
    }
  }
  if (!v16)
  {
    sub_100002B2C("Number of allowed activations has reached zero. %s token will be removed.");
    goto LABEL_23;
  }
  int v11 = v16 - 1;
  if (v16 >= 1)
  {
    --v16;
    if (v11)
    {
      if (!sub_100003044((uint64_t)__s2, "/var/mobile/Documents/Pearl/ProjectorValid.bin"))
      {
        sub_100002B2C("Failed to update %s token file. Will return false so someone looks at that...");
        return 0;
      }
      sub_100002B2C("%s token activation count updated to %d", "Pearl", v16);
    }
    else
    {
      sub_100002B2C("Using last allowed activation. %s token will be removed.", "Pearl");
      sub_100002A80();
    }
  }
  if (a3) {
    *a3 = v6;
  }
  return 1;
}

uint64_t sub_100002F8C()
{
  *(void *)v4 = 0x1500000001;
  size_t v2 = 16;
  if (sysctl(v4, 2u, &v3, &v2, 0, 0) || (uint64_t result = v3) == 0)
  {
    uint64_t v1 = __error();
    NSLog(@"Failed to read boot time. errno %d", *v1);
    return -1;
  }
  return result;
}

void sub_10000302C(void *a1)
{
}

BOOL sub_100003044(uint64_t a1, const char *a2)
{
  int __ptr = 3;
  strncpy(v10, (const char *)(a1 + 32), 0x20uLL);
  strncpy(v11, (const char *)a1, 0x20uLL);
  bzero(v12, 0x20uLL);
  long long v4 = *(_OWORD *)(a1 + 84);
  v12[0] = *(_OWORD *)(a1 + 68);
  v12[1] = v4;
  v12[2] = *(_OWORD *)(a1 + 104);
  int v5 = *(unsigned __int8 *)(a1 + 124);
  int v13 = *(_DWORD *)(a1 + 120);
  int v14 = v5;
  uint64_t v6 = qword_100247B80;
  if ((unint64_t)qword_100247B80 <= 0x7B)
  {
    do
    {
      v10[v6 - 4] ^= byte_10001FC80[v6 & 7];
      ++v6;
    }
    while (v6 != 124);
  }
  unint64_t v7 = fopen(a2, "w");
  if (v7)
  {
    fwrite(&__ptr, 1uLL, 0x7CuLL, v7);
    fclose(v7);
  }
  return v7 != 0;
}

uint64_t sub_100003170(uint64_t a1, char *__filename)
{
  uint64_t result = (uint64_t)fopen(__filename, "r");
  if (result)
  {
    long long v4 = (FILE *)result;
    BOOL v5 = fread(&__ptr, 1uLL, 0x24uLL, (FILE *)result) == 36 && __ptr == 3;
    if (v5 && fread(&v11[qword_100247B80 - 4], 1uLL, 0x58uLL, v4) == 88)
    {
      uint64_t v6 = qword_100247B80;
      if ((unint64_t)qword_100247B80 <= 0x7B)
      {
        do
        {
          v11[v6 - 4] ^= byte_10001FC80[v6 & 7];
          ++v6;
        }
        while (v6 != 124);
      }
      strncpy((char *)a1, v12, 0x20uLL);
      *(_OWORD *)(a1 + 104) = v13;
      int v7 = v15;
      *(_DWORD *)(a1 + 120) = v14;
      *(unsigned char *)(a1 + 124) = v7 != 0;
      strncpy((char *)(a1 + 32), v11, 0x20uLL);
      *(unsigned char *)(a1 + 63) = 0;
      bzero((void *)(a1 + 68), 0x20uLL);
      uint64_t v8 = 0;
      *(_DWORD *)(a1 + 64) = 8;
      while (1)
      {
        int v9 = *(_DWORD *)&v12[4 * v8 + 32];
        *(_DWORD *)(a1 + 68 + 4 * v8) = v9;
        if (!v9) {
          break;
        }
        if (++v8 == 8) {
          return 1;
        }
      }
      *(_DWORD *)(a1 + 64) = v8;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000032FC(uint64_t a1)
{
  *(void *)a1 = off_100024AD0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = off_100024AF0;
  *(void *)(a1 + 16) = a1 + 24;
  *(unsigned char *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 72) = sub_100006180(a1 + 8);
  return a1;
}

void sub_100003388(_Unwind_Exception *a1)
{
  sub_100006774(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000339C()
{
  if (byte_100247BBD)
  {
    int v0 = byte_100247BBE;
    return v0 != 0;
  }
  NSLog(@"Testing if aFDR may be used");
  byte_100247BBD = 1;
  byte_100247BBE = 0;
  if ((dword_100247BC0 & 2) != 0)
  {
    byte_100247BBE = 1;
    NSLog(@"\taFDR may be used");
LABEL_11:
    int v0 = byte_100247BBE;
    return v0 != 0;
  }
  uint64_t v1 = MGCopyAnswer();
  if (!v1)
  {
    NSLog(@"\tCouldn't get boot manifest hash");
    return 0;
  }
  size_t v2 = (void *)v1;
  uint64_t v3 = (void *)MGCopyAnswer();
  if (!v3)
  {
    NSLog(@"\tCouldn't get crypto hash method");
    return 0;
  }
  long long v4 = v3;
  if (([v3 isEqualToString:@"sha2-384"] & 1) == 0)
  {
    NSLog(@"\tCrypto hash method is %@. Only %s is supported", v4, "sha2-384");
    return 0;
  }
  id v5 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyPathForPersonalizedData:2 error:0];
  uint64_t v6 = +[NSData dataWithContentsOfFile:v5];
  if (!v6)
  {
    NSLog(@"\tCouldn't find AP ticket file at path %@", v5);

    return 0;
  }
  int v7 = v6;

  [(NSData *)v7 bytes];
  [(NSData *)v7 length];
  if (AMSupportDigestSha384())
  {
    NSLog(@"\tFailed to digest AP ticket");
    return 0;
  }
  if (memcmp(__s1, [v2 bytes], 0x30uLL))
  {
    NSLog(@"\tAP ticket digest doesn't match boot manifest hash");
    return 0;
  }
  [(NSData *)v7 bytes];
  [(NSData *)v7 length];
  if (!Img4DecodeInitManifest())
  {
    Img4DecodeGetBooleanFromSection();
    Img4DecodeGetBooleanFromSection();
    byte_100247BBE = 0;
    NSLog(@"\taFDR may%s be used (%d, %d)", " not", 0, 0);
    goto LABEL_11;
  }
  NSLog(@"\tFailed to initialize Manifest from ticket");
  return 1;
}

uint64_t sub_100003644(uint64_t result)
{
  dword_100247BC0 = result;
  return result;
}

uint64_t sub_100003650(_WORD *a1)
{
  sub_1000067E0((uint64_t)&v9);
  int v9 = off_100024B90;
  v10[73] = 1;
  if (v10[72] && (sub_1000068DC((uint64_t)&v9, a1) & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    sub_1000032FC((uint64_t)&v4);
    long long v4 = off_1000248C0;
    char v8 = 1;
    if (v7 && (char v7 = v6) != 0) {
      uint64_t v2 = sub_1000068DC((uint64_t)&v4, a1);
    }
    else {
      uint64_t v2 = 0;
    }
    long long v4 = off_100024AD0;
    sub_100006774(v5);
  }
  int v9 = off_100024908;
  sub_1000048F4((uint64_t)v10);
  return v2;
}

void sub_10000377C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  sub_100006774((void *)(v13 + 8));
  sub_1000048F4((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_1000037E0(void *a1)
{
  *a1 = off_100024AD0;
  sub_100006774(a1 + 1);
  return a1;
}

void *sub_100003824(void *a1)
{
  *a1 = off_100024908;
  sub_1000048F4((uint64_t)(a1 + 1));
  return a1;
}

const void *sub_100003868(off_t *a1)
{
  uint64_t v2 = fopen("/var/mobile/Library/ISP/Pearl/NVM.bin", "rb");
  if (v2)
  {
    uint64_t v3 = v2;
    fseeko(v2, 0, 2);
    *a1 = ftello(v3);
    fseeko(v3, 0, 0);
    if ((unint64_t)*a1 > 0xC7) {
      operator new[]();
    }
    fclose(v3);
  }
  sub_1000067E0((uint64_t)&v13);
  uint64_t v13 = off_100024B90;
  v14[73] = 1;
  if (v14[72])
  {
    long long v4 = (const void *)sub_100006A58((uint64_t)&v13, a1);
    if (v4) {
      goto LABEL_12;
    }
  }
  sub_1000032FC((uint64_t)&v8);
  char v8 = off_1000248C0;
  char v12 = 1;
  if (v11 && (char v11 = v10) != 0) {
    long long v4 = (const void *)sub_100006A58((uint64_t)&v8, a1);
  }
  else {
    long long v4 = 0;
  }
  char v8 = off_100024AD0;
  sub_100006774(v9);
  if (v4)
  {
LABEL_12:
    int v5 = open_dprotected_np("/var/mobile/Library/ISP/Pearl/NVM.bin", 513, 4, 0, 511);
    char v6 = fdopen(v5, "wb");
    if (v6)
    {
      fwrite(v4, 1uLL, *a1, v6);
      fclose(v6);
    }
  }
  uint64_t v13 = off_100024908;
  sub_1000048F4((uint64_t)v14);
  return v4;
}

void sub_100003A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  sub_100006774((void *)(v13 + 8));
  sub_1000048F4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100003ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100005DE8((uint64_t **)(a1 + 8), 4);
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*v3 + 16))(v3);
  if (result)
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v3 + 24))(v3, &v11, 4);
    if (v11 == 1)
    {
      uint64_t result = sub_100006BC4((const char *)v3, (uint64_t)v7);
      if (result)
      {
        long long v5 = v7[3];
        *(_OWORD *)(a2 + 32) = v7[2];
        *(_OWORD *)(a2 + 48) = v5;
        *(void *)(a2 + 64) = v8;
        long long v6 = v7[1];
        *(_OWORD *)a2 = v7[0];
        *(_OWORD *)(a2 + 16) = v6;
        *(_OWORD *)(a2 + 72) = v9;
        *(void *)(a2 + 88) = v10;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100003BC0(uint64_t a1)
{
  uint64_t v1 = sub_100005DE8((uint64_t **)(a1 + 8), 3);
  if ((*(unsigned int (**)(uint64_t *))(*v1 + 16))(v1))
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v1 + 24))(v1, &v2, 4);
    switch(v2)
    {
      case 3:
        sub_100006E30();
        break;
      case 2:
        sub_100006D58();
        break;
      case 1:
        sub_100006C80();
        break;
    }
  }
}

void sub_100003CB8()
{
  byte_100247BB8 = 0;
}

BOOL sub_100003CC8(const void *a1)
{
  int v2 = open_dprotected_np("/var/mobile/Library/ISP/Pearl/PCECalib.bin", 513, 4, 0, 511);
  uint64_t v3 = fdopen(v2, "wb");
  if (v3)
  {
    fwrite(a1, 1uLL, 0x3370uLL, v3);
    fclose(v3);
  }
  return v3 != 0;
}

BOOL sub_100003D48()
{
  sub_1000052D0((uint64_t)&v2, "/var/mobile/Documents/Pearl", 9u);
  int v0 = v3;
  int v2 = off_100024A80;
  if (v3) {
    fclose(v3);
  }
  return v0 != 0;
}

BOOL sub_100003DF0(uint64_t a1)
{
  return *(void *)(a1 + 264) != 0;
}

void *sub_100003E00(void *a1)
{
  *a1 = off_100024A80;
  int v2 = (FILE *)a1[33];
  if (v2) {
    fclose(v2);
  }
  return a1;
}

uint64_t sub_100003E4C()
{
  __chkstk_darwin();
  int v1 = v0;
  int __ptr = v2;
  NSLog(@"Pearl calibration\n");
  umask(0);
  uint64_t v3 = "/var/mobile/Library/ISP";
  int v4 = mkdir("/var/mobile/Library/ISP", 0x1FFu);
  if (v4 && (int v5 = v4, *__error() != 17)
    || (int v6 = open_dprotected_np("/var/mobile/Library/ISP", 0, 0, 1),
        fcntl(v6, 64, 4),
        close(v6),
        uint64_t v3 = "/var/mobile/Library/ISP/Pearl",
        (int v7 = mkdir("/var/mobile/Library/ISP/Pearl", 0x1FFu)) != 0)
    && (int v5 = v7, *__error() != 17))
  {
    printf("\tCan't create %s! (%d)\n", v3, v5);
    NSLog(@"\tCouldn't validate directories\n");
    return 0;
  }
  int v8 = open_dprotected_np("/var/mobile/Library/ISP/Pearl", 0, 0, 1);
  fcntl(v8, 64, 4);
  close(v8);
  NSLog(@"\tLooking for local cache\n");
  long long v9 = fopen("/var/mobile/Library/ISP/Pearl/PCECalib.bin", "rb");
  if (!v9) {
    goto LABEL_37;
  }
  v25 = v9;
  fread(__ptr, 1uLL, 0x3370uLL, v9);
  if (!v1) {
    goto LABEL_23;
  }
  NSLog(@"\tValidating Calibration UUID");
  sub_1000067E0((uint64_t)&v32);
  *(void *)&long long v32 = off_100024B90;
  char v38 = 0;
  if ((sub_100005484((uint64_t)&v32, (uint64_t)&v39) & 1) == 0)
  {
    sub_1000032FC((uint64_t)&v27);
    v27 = off_1000248C0;
    if (v30) {
      char v30 = v29;
    }
    char v31 = 0;
    if ((sub_1000056E0((uint64_t)&v27, (uint64_t)&v39) & 1) == 0)
    {
      NSLog(@"\tFailed to read UUID. Marking as invalid");
      v27 = off_100024AD0;
      sub_100006774(v28);
      *(void *)&long long v32 = off_100024908;
      sub_1000048F4((uint64_t)&v32 + 8);
      goto LABEL_28;
    }
    v27 = off_100024AD0;
    sub_100006774(v28);
  }
  uint64_t v10 = 0;
  BOOL v12 = *((void *)__ptr + 1) != v40[0] || *((void *)__ptr + 2) != v40[1];
  uint64_t v13 = @"Cached UUID: 0x";
  do
    uint64_t v13 = (__CFString *)[(__CFString *)v13 stringByAppendingFormat:@"%02X", *((unsigned __int8 *)__ptr + v10++ + 8)];
  while (v10 != 16);
  id v14 = [(__CFString *)v13 stringByAppendingString:@", calibration: 0x"];
  for (uint64_t i = 8; i != 24; ++i)
    id v14 = [[v14 stringByAppendingFormat:@"%02X", *((unsigned __int8 *)&v40[-1] + i)];
  NSLog(@"\t%@", v14);
  *(void *)&long long v32 = off_100024908;
  sub_1000048F4((uint64_t)&v32 + 8);
  if (!v12)
  {
LABEL_23:
    if (*__ptr == 6)
    {
      NSLog(@"\tFound\n");
      fclose(v25);
      return 1;
    }
    NSLog(@"\tIgnoring unexpected cached version (%d != %d)\n", *__ptr, 6, v25);
    goto LABEL_36;
  }
LABEL_28:
  char v17 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") contentsOfDirectoryAtPath:+[NSString stringWithUTF8String:"/var/mobile/Library/ISP/Pearl"] error:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v32 objects:&v39 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v33;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v17);
        }
        [+[NSFileManager defaultManager](NSFileManager, "defaultManager") removeItemAtPath:+[NSString stringWithFormat:@"%s/%@", "/var/mobile/Library/ISP/Pearl", *(void *)(*((void *)&v32 + 1) + 8 * (void)j), v25] error:0];
      }
      id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v32 objects:&v39 count:16];
    }
    while (v18);
  }
  NSLog(@"\tCalibration UUID mismatch, removing contents of directory\n");
LABEL_36:
  fclose(v25);
LABEL_37:
  NSLog(@"\tLooking for local override files\n");
  sub_1000067E0((uint64_t)&v39);
  v39 = off_100024B90;
  char v41 = 1;
  sub_10000456C((uint64_t)&v39, __ptr);
  if (v21) {
    goto LABEL_41;
  }
  NSLog(@"\tLooking for FDR data\n");
  NSLog(@"\tReading from FDR\n");
  sub_1000032FC((uint64_t)&v32);
  *(void *)&long long v32 = off_1000248C0;
  if (v36) {
    char v36 = BYTE9(v34);
  }
  BOOL v37 = (dword_100247BC0 & 1) == 0;
  sub_1000046A8((uint64_t)&v32, __ptr);
  char v23 = v22;
  *(void *)&long long v32 = off_100024AD0;
  sub_100006774((void *)&v32 + 1);
  if (v23)
  {
LABEL_41:
    NSLog(@"Creating local cache\n");
    *int __ptr = 6;
    kdebug_trace();
    BOOL v16 = sub_100003CC8(__ptr);
  }
  else
  {
    NSLog(@"\tDidn't find calibration\n");
    BOOL v16 = 0;
  }
  v39 = off_100024908;
  sub_1000048F4((uint64_t)v40);
  return v16;
}

void sub_10000449C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  sub_1000048F4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10000456C(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 80))
  {
    bzero(a2, 0x3370uLL);
    sub_1000070AC(a1, (uint64_t)a2);
    if (v4)
    {
      sub_1000071F4(a1);
      if (v5)
      {
        if ((dword_100247BC0 & 4) != 0
          || (sub_1000072EC(a1, (uint64_t)a2), v6)
          && (sub_100003BC0(a1), v7)
          && (sub_100003ADC(a1, (uint64_t)a2 + 8552) & 1) != 0
          || (dword_100247BC0 & 0x10) != 0)
        {
          if (sub_100007408(a1, (uint64_t)a2 + 8648)
            && sub_1000074CC(a1, (uint64_t)a2 + 8672)
            && sub_100007598(a1, (uint64_t)a2))
          {
            if (sub_100005484(a1, (uint64_t)a2))
            {
              sub_100007650(a1);
              (*(void (**)(uint64_t, void *))(*(void *)(a1 + 8) + 24))(a1 + 8, a2);
            }
          }
        }
      }
    }
  }
}

void sub_1000046A8(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 72))
  {
    bzero(a2, 0x3370uLL);
    sub_100007D60(a1, (uint64_t)a2);
    if (v4)
    {
      sub_1000071F4(a1);
      if (v5)
      {
        if ((dword_100247BC0 & 4) != 0
          || (sub_1000072EC(a1, (uint64_t)a2), v6)
          && (sub_100003BC0(a1), v7)
          && (sub_100003ADC(a1, (uint64_t)a2 + 8552) & 1) != 0
          || (dword_100247BC0 & 0x10) != 0)
        {
          if (sub_100007408(a1, (uint64_t)a2 + 8648)
            && sub_1000074CC(a1, (uint64_t)a2 + 8672)
            && sub_100007598(a1, (uint64_t)a2))
          {
            if (sub_1000056E0(a1, (uint64_t)a2))
            {
              sub_100007650(a1);
              (*(void (**)(uint64_t, void *))(*(void *)(a1 + 8) + 24))(a1 + 8, a2);
            }
          }
        }
      }
    }
  }
}

void sub_1000047E4(void *a1)
{
  *a1 = off_100024AD0;
  sub_100006774(a1 + 1);

  operator delete();
}

void *sub_10000484C(void *a1)
{
  *a1 = off_100024908;
  sub_1000048F4((uint64_t)(a1 + 1));
  return a1;
}

void sub_100004890(void *a1)
{
  *a1 = off_100024908;
  sub_1000048F4((uint64_t)(a1 + 1));

  operator delete();
}

uint64_t sub_1000048F4(uint64_t a1)
{
  *(void *)a1 = off_100024938;
  if (*(unsigned char *)(a1 + 40)) {
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  if (*(unsigned char *)(a1 + 56)) {
    CFRelease(*(CFTypeRef *)(a1 + 64));
  }

  return sub_100004968(a1);
}

uint64_t sub_100004968(uint64_t a1)
{
  *(void *)a1 = off_100024998;
  int v2 = (uint64_t **)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  int v4 = (uint64_t *)(a1 + 16);
  while (v3 != v4)
  {
    uint64_t v5 = v3[5];
    sub_100004C4C(v2, v3);
    operator delete(v3);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    uint64_t v3 = *v2;
  }
  sub_100005044((uint64_t)v2, *(void **)(a1 + 16));
  return a1;
}

void sub_100004A24(uint64_t a1)
{
  sub_1000048F4(a1);

  operator delete();
}

uint64_t sub_100004A5C(uint64_t a1)
{
  int v2 = *(const char **)(a1 + 32);
  if (!v2)
  {
    uint64_t result = sub_10000339C();
    if (!result) {
      return result;
    }
    int v2 = *(const char **)(a1 + 32);
  }
  if (!v2) {
    int v2 = "/var/mobile/Documents/Pearl";
  }
  id v4 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/%s.bin", v2, "PlCl")];
  uint64_t result = 1;
  if (v4)
  {
    *(unsigned char *)(a1 + 40) = 1;
    *(void *)(a1 + 48) = v4;
  }
  return result;
}

uint64_t sub_100004AF8(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0x10)
  {
    if (*(unsigned char *)(a1 + 40)) {
      operator new();
    }
    operator new();
  }
  return 0;
}

void sub_100004C08()
{
}

uint64_t *sub_100004C4C(uint64_t **a1, uint64_t *a2)
{
  int v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      int v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    id v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      id v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  int v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_100004CC0(v6, a2);
  return v3;
}

uint64_t *sub_100004CC0(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    id v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      id v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  int v6 = (uint64_t **)v3[2];
  int v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      int v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      int v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      int v7 = *(uint64_t **)(*v7 + 8);
    }
    int v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      BOOL v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *int v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        BOOL v16 = v7;
      }
      else
      {
        int v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    BOOL v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    char v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      char v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    int v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    int v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    char v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void sub_100005044(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100005044(a1, *a2);
    sub_100005044(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t sub_100005098(uint64_t a1, const __CFDictionary *a2, unsigned int a3)
{
  *(void *)(a1 + 264) = 0;
  *(void *)(a1 + 272) = 0;
  *(_DWORD *)(a1 + 288) = 0;
  *(void *)(a1 + 280) = 0;
  *(void *)a1 = off_1000249D0;
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, &aPcic[256 * (unint64_t)a3], 0x8000100u);
  Value = CFDictionaryGetValue(a2, v5);
  CFRelease(v5);
  if (Value)
  {
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFDataGetTypeID())
    {
      *(void *)(a1 + 264) = Value;
      CFRetain(Value);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 264));
      *(void *)(a1 + 272) = BytePtr;
      *(void *)(a1 + 280) = BytePtr;
      *(_DWORD *)(a1 + 288) = CFDataGetLength(*(CFDataRef *)(a1 + 264));
    }
    else
    {
      CFRelease(Value);
    }
  }
  return a1;
}

void sub_100005184(_Unwind_Exception *a1)
{
  sub_10000519C(v1);
  _Unwind_Resume(a1);
}

void *sub_10000519C(void *a1)
{
  *a1 = off_100024A48;
  uint64_t v2 = (const void *)a1[33];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1000051F0(void *a1)
{
  sub_10000519C(a1);

  operator delete();
}

BOOL sub_100005228(uint64_t a1)
{
  return *(void *)(a1 + 264) != 0;
}

void *sub_100005238(uint64_t a1, void *__dst, int a3)
{
  uint64_t result = memcpy(__dst, *(const void **)(a1 + 280), a3);
  *(void *)(a1 + 280) += a3;
  return result;
}

uint64_t sub_10000527C(_DWORD *a1)
{
  return (a1[72] + a1[68] - a1[70]);
}

void sub_100005298(void *a1)
{
  sub_10000519C(a1);

  operator delete();
}

uint64_t sub_1000052D0(uint64_t a1, const char *a2, unsigned int a3)
{
  *(void *)a1 = off_100024A80;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(void *)(a1 + 264) = 0;
  *(_OWORD *)(a1 + 8) = 0u;
  id v4 = (const char *)(a1 + 8);
  snprintf((char *)(a1 + 8), 0x100uLL, "%s/%s.bin", a2, &aPcic[256 * (unint64_t)a3]);
  *(void *)(a1 + 264) = fopen(v4, "rb");
  return a1;
}

void sub_1000053A0(void *a1)
{
  *a1 = off_100024A80;
  int v1 = (FILE *)a1[33];
  if (v1) {
    fclose(v1);
  }

  operator delete();
}

size_t sub_10000540C(uint64_t a1, void *__ptr, int a3)
{
  return fread(__ptr, 1uLL, a3, *(FILE **)(a1 + 264));
}

uint64_t sub_100005420(uint64_t a1)
{
  off_t v2 = ftello(*(FILE **)(a1 + 264));
  fseeko(*(FILE **)(a1 + 264), 0, 2);
  int v3 = ftello(*(FILE **)(a1 + 264));
  fseeko(*(FILE **)(a1 + 264), v2, 0);
  return (v3 - v2);
}

uint64_t sub_100005484(uint64_t a1, uint64_t a2)
{
  id v4 = sub_100005DE8((uint64_t **)(a1 + 8), 9);
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*v4 + 16))(v4);
  if (result)
  {
    int v6 = (_WORD *)(a2 + 8704);
    (*(void (**)(uint64_t *, int *, uint64_t))(*v4 + 24))(v4, &v9, 4);
    if (v9 == 3)
    {
      (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 19);
      unsigned int v7 = v13;
      _WORD *v6 = v11;
      *(_WORD *)(a2 + 8706) = v12;
      *(_OWORD *)(a2 + 8) = v10;
    }
    else
    {
      if (v9 == 2)
      {
        (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 3);
        unsigned int v7 = BYTE2(v10);
        _WORD *v6 = v10;
        *(_WORD *)(a2 + 8706) = BYTE1(v10);
      }
      else
      {
        if (v9 != 1) {
          return 0;
        }
        (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 1);
        unsigned int v7 = v10;
        *(_DWORD *)int v6 = 0;
      }
      bzero((void *)(a2 + 8), 0x10uLL);
    }
    uint64_t result = 1;
    if (*(unsigned char *)(a1 + 81) && v7)
    {
      unsigned int v8 = 1;
      do
      {
        (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 22);
        if (v10 > 3) {
          uint64_t result = 1;
        }
        else {
          uint64_t result = sub_10000593C(a1, (uint64_t)v4, (uint64_t)&v10);
        }
        if (v8 >= v7) {
          break;
        }
        ++v8;
      }
      while ((result & 1) != 0);
    }
  }
  return result;
}

uint64_t sub_1000056E0(uint64_t a1, uint64_t a2)
{
  id v4 = sub_100005DE8((uint64_t **)(a1 + 8), 9);
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*v4 + 16))(v4);
  if (result)
  {
    int v6 = (_WORD *)(a2 + 8704);
    (*(void (**)(uint64_t *, int *, uint64_t))(*v4 + 24))(v4, &v9, 4);
    if (v9 == 3)
    {
      (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 19);
      unsigned int v7 = v13;
      _WORD *v6 = v11;
      *(_WORD *)(a2 + 8706) = v12;
      *(_OWORD *)(a2 + 8) = v10;
    }
    else
    {
      if (v9 == 2)
      {
        (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 3);
        unsigned int v7 = BYTE2(v10);
        _WORD *v6 = v10;
        *(_WORD *)(a2 + 8706) = BYTE1(v10);
      }
      else
      {
        if (v9 != 1) {
          return 0;
        }
        (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 1);
        unsigned int v7 = v10;
        *(_DWORD *)int v6 = 0;
      }
      bzero((void *)(a2 + 8), 0x10uLL);
    }
    uint64_t result = 1;
    if (*(unsigned char *)(a1 + 73) && v7)
    {
      unsigned int v8 = 1;
      do
      {
        (*(void (**)(uint64_t *, long long *, uint64_t))(*v4 + 24))(v4, &v10, 22);
        if (v10 > 3) {
          uint64_t result = 1;
        }
        else {
          uint64_t result = sub_10000593C(a1, (uint64_t)v4, (uint64_t)&v10);
        }
        if (v8 >= v7) {
          break;
        }
        ++v8;
      }
      while ((result & 1) != 0);
    }
  }
  return result;
}

uint64_t sub_10000593C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) <= 3u) {
    operator new[]();
  }
  return 0;
}

uint64_t *sub_100005DE8(uint64_t **a1, int a2)
{
  int v10 = a2;
  off_t v2 = a1[2];
  int v3 = a1 + 1;
  if (!v2) {
    goto LABEL_11;
  }
  id v4 = a1 + 2;
  do
  {
    int v5 = *((_DWORD *)v2 + 8);
    BOOL v6 = v5 < a2;
    if (v5 >= a2) {
      unsigned int v7 = (uint64_t **)v2;
    }
    else {
      unsigned int v7 = (uint64_t **)(v2 + 1);
    }
    if (!v6) {
      id v4 = (uint64_t **)v2;
    }
    off_t v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 2 || *((_DWORD *)v4 + 8) > a2)
  {
LABEL_11:
    unsigned int v8 = (uint64_t *)((uint64_t (*)(uint64_t **))(*a1)[4])(a1);
    unsigned __int8 v11 = &v10;
    sub_100005ECC(v3, &v10, (uint64_t)&unk_100021068, &v11)[5] = v8;
  }
  unsigned __int8 v11 = &v10;
  return sub_100005ECC(v3, &v10, (uint64_t)&unk_100021068, &v11)[5];
}

uint64_t **sub_100005ECC(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unsigned int v7 = a1 + 1;
  BOOL v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        int v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        BOOL v6 = *v9;
        unsigned int v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      BOOL v6 = v9[1];
      if (!v6)
      {
        unsigned int v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v9 = a1 + 1;
LABEL_10:
    unsigned __int8 v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    sub_100005F90(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_100005F90(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_100005FE8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_100005FE8(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      off_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      id v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            FILE *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            off_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *off_t v2 = v11;
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
        off_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *off_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

CFStringRef sub_100006180(uint64_t a1)
{
  if ((dword_100247BC0 & 8) != 0) {
    return 0;
  }
  sub_1000065C0(a1);
  if (*(unsigned char *)(a1 + 33) && *(unsigned char *)(a1 + 32))
  {
    CFStringRef result = CFStringCreateWithCString(kCFAllocatorDefault, "PlCl", 0x8000100u);
    if (!result) {
      return result;
    }
    int v3 = result;
    *(void *)(a1 + 40) = AMFDRSealingMapCopyLocalDictForClass();
    CFRelease(v3);
  }
  return (CFStringRef)1;
}

void *sub_100006270(void *a1)
{
  *a1 = off_100024AD0;
  sub_100006774(a1 + 1);
  return a1;
}

void sub_1000062B4(void *a1)
{
  *a1 = off_100024AD0;
  sub_100006774(a1 + 1);

  operator delete();
}

void sub_100006318(void *a1)
{
  sub_100006774(a1);

  operator delete();
}

void sub_100006350(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0x10)
  {
    if (*(unsigned char *)(a1 + 32)) {
      operator new();
    }
  }
  operator new();
}

void sub_100006430()
{
}

uint64_t sub_100006458(uint64_t a1, unsigned int a2)
{
  *(void *)(a1 + 264) = 0;
  *(void *)(a1 + 272) = 0;
  *(_DWORD *)(a1 + 288) = 0;
  *(void *)(a1 + 280) = 0;
  *(void *)a1 = &off_100024B40;
  int v3 = (const char *)(a1 + 8);
  strcpy((char *)(a1 + 8), &aPcic[256 * (unint64_t)a2]);
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, v3, 0x8000100u);
  *(void *)(a1 + 264) = AMFDRSealingMapCopyLocalDataForClass();
  CFRelease(v4);
  if (*(void *)(a1 + 264))
  {
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 264));
    *(void *)(a1 + 272) = BytePtr;
    *(void *)(a1 + 280) = BytePtr;
    *(_DWORD *)(a1 + 288) = CFDataGetLength(*(CFDataRef *)(a1 + 264));
  }
  return a1;
}

void sub_10000656C(_Unwind_Exception *a1)
{
  sub_10000519C(v1);
  _Unwind_Resume(a1);
}

void sub_100006588(void *a1)
{
  sub_10000519C(a1);

  operator delete();
}

void sub_1000065C0(uint64_t a1)
{
  if (byte_100247BB8)
  {
LABEL_2:
    char v2 = byte_100247BBB;
    goto LABEL_3;
  }
  byte_100247BB8 = 1;
  byte_100247BBA = 0;
  byte_100247BB9 = 0;
  byte_100247BBC = 0;
  byte_100247BBB = 0;
  int v9 = *(const void **)(a1 + 56);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(a1 + 56) = 0;
  }
  int v10 = *(const void **)(a1 + 40);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 40) = 0;
  }
  CFDictionaryRef v11 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
  CFTypeRef v13 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageSNUM", kCFAllocatorDefault, 3u);
  if (v13)
  {
    byte_100247BBB = 1;
    CFRelease(v13);
  }
  char v2 = byte_100247BBB;
  if (byte_100247BBB)
  {
    CFStringRef v14 = CFStringCreateWithCString(kCFAllocatorDefault, "PlCl", 0x8000100u);
    if (v14)
    {
      CFStringRef v15 = v14;
      BOOL v16 = (const void *)AMFDRSealingMapCopyLocalDictForClass();
      CFRelease(v15);
      byte_100247BB9 = v16 != 0;
      if (v16) {
        CFRelease(v16);
      }
    }
    goto LABEL_2;
  }
LABEL_3:
  int v3 = byte_100247BB9;
  *(unsigned char *)(a1 + 32) = byte_100247BB9;
  int v4 = byte_100247BBA;
  *(unsigned char *)(a1 + 48) = byte_100247BBA;
  *(unsigned char *)(a1 + 33) = v2;
  int v5 = byte_100247BBC;
  *(unsigned char *)(a1 + 49) = byte_100247BBC;
  if (v3) {
    int v6 = "unified";
  }
  else {
    int v6 = "not unified";
  }
  if (v2) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = "unavailable";
  }
  if (v4) {
    int v8 = "unified";
  }
  else {
    int v8 = "not unified";
  }
  if (!v5) {
    int v8 = "unavailable";
  }
  NSLog(@"Pearl FDR is %s, ToF FDR is %s", v7, v8);
}

uint64_t sub_100006774(void *a1)
{
  *a1 = off_100024AF0;
  char v2 = (const void *)a1[5];
  if (v2) {
    CFRelease(v2);
  }
  int v3 = (const void *)a1[7];
  if (v3) {
    CFRelease(v3);
  }

  return sub_100004968((uint64_t)a1);
}

uint64_t sub_1000067E0(uint64_t a1)
{
  *(void *)a1 = off_100024908;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = off_100024938;
  *(void *)(a1 + 16) = a1 + 24;
  *(unsigned char *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 80) = sub_100004A5C(a1 + 8);
  return a1;
}

void sub_100006864(_Unwind_Exception *a1)
{
  sub_1000048F4(v1);
  _Unwind_Resume(a1);
}

void sub_100006878(void *a1)
{
  *a1 = off_100024908;
  sub_1000048F4((uint64_t)(a1 + 1));

  operator delete();
}

uint64_t sub_1000068DC(uint64_t a1, _WORD *a2)
{
  int v3 = sub_100005DE8((uint64_t **)(a1 + 8), 14);
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*v3 + 16))(v3);
  if (result)
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v3 + 24))(v3, &v6, 4);
    if (v6 == 0x1000000)
    {
      uint64_t result = sub_10000699C((const char *)v3, (uint64_t)v5);
      if (result) {
        *a2 = v5[3];
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL sub_10000699C(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 8) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 8);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 8, v4);
  }
  return v5 == 8;
}

uint64_t sub_100006A58(uint64_t a1, void *a2)
{
  int v3 = sub_100005DE8((uint64_t **)(a1 + 8), 13);
  if ((*(unsigned int (**)(uint64_t *))(*v3 + 16))(v3))
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v3 + 24))(v3, &v5, 4);
    if (v5 == 50331648)
    {
      (*(void (**)(uint64_t *, unsigned char *, uint64_t))(*v3 + 24))(v3, v6, 125);
      *a2 = bswap32(v7) >> 16;
      operator new[]();
    }
  }
  return 0;
}

BOOL sub_100006BC4(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 96) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 96);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 96, v4);
  }
  return v5 == 96;
}

BOOL sub_100006C80()
{
  __chkstk_darwin();
  uint64_t v1 = v0;
  BOOL v3 = sub_100006F24(v2, (uint64_t)&v9);
  if (v3)
  {
    uint64_t v4 = 0;
    double v5 = *(double *)v1;
    *(float64x2_t *)(v1 + 8) = vmulq_n_f64(v9, *(double *)v1);
    *(double *)(v1 + 24) = v5 * v10;
    int v6 = (float64x2_t *)v1;
    do
    {
      unsigned __int16 v7 = (const double *)&v11[v4];
      float64x2x2_t v12 = vld2q_f64(v7);
      v6[2] = vmulq_n_f64(v12.val[0], v5);
      v6[130] = vmulq_n_f64(v12.val[1], v5);
      v4 += 32;
      ++v6;
    }
    while (v4 != 4096);
    bzero((void *)(v1 + 4128), 0x40uLL);
    bzero((void *)(v1 + 4192), 0x40uLL);
  }
  return v3;
}

BOOL sub_100006D58()
{
  __chkstk_darwin();
  uint64_t v1 = v0;
  BOOL v3 = sub_100006F24(v2, (uint64_t)&v8);
  if (v3)
  {
    uint64_t v4 = 0;
    double v5 = *(double *)v1;
    *(float64x2_t *)(v1 + 8) = vmulq_n_f64(v8, *(double *)v1);
    *(double *)(v1 + 24) = v5 * v9;
    do
    {
      int v6 = (float64x2_t *)(v1 + v4);
      v6[2] = vmulq_n_f64(*(float64x2_t *)&v10[v4], v5);
      v6[130] = vmulq_n_f64(*(float64x2_t *)&v10[v4 + 2048], v5);
      v4 += 16;
    }
    while (v4 != 2048);
    bzero((void *)(v1 + 4128), 0x40uLL);
    bzero((void *)(v1 + 4192), 0x40uLL);
  }
  return v3;
}

double sub_100006E30()
{
  __chkstk_darwin();
  uint64_t v1 = v0;
  if (sub_100006FE8(v2, (uint64_t)&v11))
  {
    uint64_t v4 = 0;
    double v5 = *(double *)v1;
    *(float64x2_t *)(v1 + 8) = vmulq_n_f64(v11, *(double *)v1);
    *(double *)(v1 + 24) = v5 * v12;
    do
    {
      int v6 = (float64x2_t *)(v1 + v4);
      v6[2] = vmulq_n_f64(*(float64x2_t *)&v13[v4], v5);
      v6[130] = vmulq_n_f64(*(float64x2_t *)&v13[v4 + 2048], v5);
      v4 += 16;
    }
    while (v4 != 2048);
    long long v7 = v15;
    *(_OWORD *)(v1 + 4128) = v14;
    *(_OWORD *)(v1 + 4144) = v7;
    long long v8 = v17;
    *(_OWORD *)(v1 + 4160) = v16;
    *(_OWORD *)(v1 + 4176) = v8;
    long long v9 = v19;
    *(_OWORD *)(v1 + 4192) = v18;
    *(_OWORD *)(v1 + 4208) = v9;
    double result = *(double *)&v20;
    long long v10 = v21;
    *(_OWORD *)(v1 + 4224) = v20;
    *(_OWORD *)(v1 + 4240) = v10;
  }
  return result;
}

BOOL sub_100006F24(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 4144) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 4144);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 4144, v4);
  }
  return v5 == 4144;
}

BOOL sub_100006FE8(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 4248) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 4248);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 4248, v4);
  }
  return v5 == 4248;
}

double sub_1000070AC(uint64_t a1, uint64_t a2)
{
  int v4 = sub_100005DE8((uint64_t **)(a1 + 8), 0);
  if ((*(unsigned int (**)(uint64_t *))(*v4 + 16))(v4))
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v4 + 24))(v4, &v6, 4);
    switch(v6)
    {
      case 1:
        if (sub_10000782C((const char *)v4, (uint64_t)&v7)) {
          goto LABEL_8;
        }
        break;
      case 2:
        if (sub_1000078E8((const char *)v4, (uint64_t)&v7)) {
          goto LABEL_8;
        }
        break;
      case 3:
        if (sub_1000079A4((const char *)v4, (uint64_t)&v7))
        {
LABEL_8:
          *(_DWORD *)(a2 + 4280) = v7;
          double result = v8;
          *(double *)(a2 + 24) = v8;
        }
        break;
      case 4:
        double result = sub_1000077A8(a1, (const char *)v4, a2);
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_1000071F4(uint64_t a1)
{
  uint64_t v1 = sub_100005DE8((uint64_t **)(a1 + 8), 2);
  if ((*(unsigned int (**)(uint64_t *))(*v1 + 16))(v1))
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v1 + 24))(v1, &v2, 4);
    switch(v2)
    {
      case 3:
        sub_100006E30();
        break;
      case 2:
        sub_100006D58();
        break;
      case 1:
        sub_100006C80();
        break;
    }
  }
}

void sub_1000072EC(uint64_t a1, uint64_t a2)
{
  int v4 = sub_100005DE8((uint64_t **)(a1 + 8), 1);
  if ((*(unsigned int (**)(uint64_t *))(*v4 + 16))(v4))
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v4 + 24))(v4, &v5, 4);
    if (v5 == 3)
    {
      sub_100007B7C(a1, (const char *)v4, a2);
    }
    else if (v5 == 2)
    {
      sub_100007B1C(a1, (const char *)v4, a2);
    }
    else if (v5 == 1 && sub_10000782C((const char *)v4, (uint64_t)&v6))
    {
      *(_DWORD *)(a2 + 8544) = v6;
      *(void *)(a2 + 4288) = v7;
      *(void *)(a2 + 8760) = 0;
      *(void *)(a2 + 8776) = 0;
      *(void *)(a2 + 8768) = 0;
    }
  }
}

uint64_t sub_100007408(uint64_t a1, uint64_t a2)
{
  BOOL v3 = sub_100005DE8((uint64_t **)(a1 + 8), 5);
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*v3 + 16))(v3);
  if (result)
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v3 + 24))(v3, &v7, 4);
    if (v7 == 1)
    {
      uint64_t result = sub_100007BE8((const char *)v3, (uint64_t)&v5);
      if (result)
      {
        *(_OWORD *)a2 = v5;
        *(void *)(a2 + 16) = v6;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000074CC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = sub_100005DE8((uint64_t **)(a1 + 8), 6);
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*v3 + 16))(v3);
  if (result)
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v3 + 24))(v3, &v8, 4);
    if (v8 == 1)
    {
      uint64_t result = sub_100007CA4((const char *)v3, (uint64_t)&v5);
      if (result)
      {
        *(void *)a2 = v5;
        *(_OWORD *)(a2 + 8) = v6;
        *(void *)(a2 + 24) = v7;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100007598(uint64_t a1, uint64_t a2)
{
  memcpy((void *)(a2 + 8784), (const void *)(a2 + 24), 0x10A8uLL);
  uint64_t v3 = 0;
  int v4 = (double *)(a2 + 13048);
  do
  {
    uint64_t v5 = 0;
    long long v6 = v4;
    do
    {
      if (v3 == v5) {
        double v7 = 1.0;
      }
      else {
        double v7 = 0.0;
      }
      double *v6 = v7;
      v6 += 3;
      ++v5;
    }
    while (v5 != 3);
    ++v3;
    ++v4;
  }
  while (v3 != 3);
  *(_OWORD *)(a2 + 13120) = *(_OWORD *)(a2 + 8648);
  *(void *)(a2 + 13136) = *(void *)(a2 + 8664);
  if (*(double *)(a2 + 8768) == 0.0 && *(double *)(a2 + 8776) == 0.0)
  {
    double v8 = *(double *)(a2 + 4296);
    if (v8 != 0.0) {
      *(double *)(a2 + 8768) = v8;
    }
  }
  return 1;
}

uint64_t sub_100007650(uint64_t a1)
{
  uint64_t v1 = sub_100005DE8((uint64_t **)(a1 + 8), 12);
  if ((*(unsigned int (**)(uint64_t *))(*v1 + 16))(v1))
  {
    (*(void (**)(uint64_t *))(*v1 + 32))(v1);
    operator new[]();
  }
  return 0;
}

double sub_1000077A8(uint64_t a1, const char *a2, uint64_t a3)
{
  if (sub_100007A60(a2, (uint64_t)&v6))
  {
    *(_DWORD *)(a3 + 4280) = v6;
    double v5 = v7;
    *(double *)(a3 + 24) = v7;
    *(void *)(a3 + 8712) = v10;
    *(double *)(a3 + 8720) = v5 * v8;
    *(double *)(a3 + 8728) = v5 * v9;
    *(double *)(a3 + 8736) = v5 * v12;
    double result = v5 * v11;
    *(double *)(a3 + 8744) = result;
    *(double *)(a3 + 8752) = result;
  }
  return result;
}

BOOL sub_10000782C(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 12) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 12);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 12, v4);
  }
  return v5 == 12;
}

BOOL sub_1000078E8(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 20) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 20);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 20, v4);
  }
  return v5 == 20;
}

BOOL sub_1000079A4(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 36) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 36);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 36, v4);
  }
  return v5 == 36;
}

BOOL sub_100007A60(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 84) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 84);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 84, v4);
  }
  return v5 == 84;
}

double sub_100007B1C(uint64_t a1, const char *a2, uint64_t a3)
{
  if (sub_1000078E8(a2, (uint64_t)&v5))
  {
    *(_DWORD *)(a3 + 8544) = v5;
    *(void *)(a3 + 4288) = v6;
    *(void *)(a3 + 8760) = v7;
    double result = 0.0;
    *(_OWORD *)(a3 + 8768) = 0u;
  }
  return result;
}

double sub_100007B7C(uint64_t a1, const char *a2, uint64_t a3)
{
  if (sub_1000079A4(a2, (uint64_t)&v7))
  {
    *(_DWORD *)(a3 + 8544) = v7;
    double v5 = v8;
    uint64_t v6 = v9;
    *(double *)(a3 + 4288) = v8;
    *(void *)(a3 + 8760) = v6;
    *(double *)(a3 + 8768) = v5 * v10;
    double result = v5 * v11;
    *(double *)(a3 + 8776) = result;
  }
  return result;
}

BOOL sub_100007BE8(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 24) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 24);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 24, v4);
  }
  return v5 == 24;
}

BOOL sub_100007CA4(const char *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(const char *))(*(void *)a1 + 32))(a1);
  int v5 = v4;
  if (v4 == 32) {
    (*(void (**)(const char *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 32);
  }
  else {
    printf("Expected file %s to be of size %ld. Actual size: %d\n", a1 + 8, 32, v4);
  }
  return v5 == 32;
}

double sub_100007D60(uint64_t a1, uint64_t a2)
{
  int v4 = sub_100005DE8((uint64_t **)(a1 + 8), 0);
  if ((*(unsigned int (**)(uint64_t *))(*v4 + 16))(v4))
  {
    (*(void (**)(uint64_t *, int *, uint64_t))(*v4 + 24))(v4, &v6, 4);
    switch(v6)
    {
      case 1:
        if (sub_10000782C((const char *)v4, (uint64_t)&v7)) {
          goto LABEL_8;
        }
        break;
      case 2:
        if (sub_1000078E8((const char *)v4, (uint64_t)&v7)) {
          goto LABEL_8;
        }
        break;
      case 3:
        if (sub_1000079A4((const char *)v4, (uint64_t)&v7))
        {
LABEL_8:
          *(_DWORD *)(a2 + 4280) = v7;
          double result = v8;
          *(double *)(a2 + 24) = v8;
        }
        break;
      case 4:
        double result = sub_1000077A8(a1, (const char *)v4, a2);
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t sub_100007EA8()
{
  return sub_10000A288(@"FdrForTof", @"com.apple.coremedia", 1);
}

BOOL sub_100007EC0()
{
  sub_100008B80(__p, "JYKY");
  CFDictionaryRef v0 = IOServiceNameMatching("product");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  io_object_t v2 = MatchingService;
  if (!MatchingService)
  {
    BOOL v15 = 1;
    goto LABEL_44;
  }
  CFDataRef v3 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"rosaline-serial-num", kCFAllocatorDefault, 3u);
  CFDataRef v4 = v3;
  if (v3)
  {
    BytePtr = CFDataGetBytePtr(v3);
    int Length = CFDataGetLength(v4);
    sub_100008B80(&v23, (char *)&unk_10001DA5B);
    if (Length)
    {
      for (int i = 0; i != Length; ++i)
      {
        int v9 = *BytePtr++;
        std::string::value_type v8 = v9;
        if (!v9) {
          break;
        }
        if ((i - 11) <= 3) {
          std::string::push_back(&v23, v8);
        }
      }
    }
    uint64_t v10 = HIBYTE(v23.__r_.__value_.__r.__words[2]);
    if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v23.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v23.__r_.__value_.__l.__size_;
    }
    unint64_t v12 = v25;
    if ((v25 & 0x80u) != 0) {
      unint64_t v12 = (unint64_t)__p[1];
    }
    if (size == v12)
    {
      if ((v25 & 0x80u) == 0) {
        CFTypeRef v13 = __p;
      }
      else {
        CFTypeRef v13 = (void **)__p[0];
      }
      if ((*((unsigned char *)&v23.__r_.__value_.__s + 23) & 0x80) == 0)
      {
        if (*((unsigned char *)&v23.__r_.__value_.__s + 23))
        {
          long long v14 = &v23;
          while (v14->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v13)
          {
            long long v14 = (std::string *)((char *)v14 + 1);
            CFTypeRef v13 = (void **)((char *)v13 + 1);
            if (!--v10) {
              goto LABEL_28;
            }
          }
          goto LABEL_27;
        }
LABEL_28:
        CFDictionaryRef v18 = IOServiceNameMatching("AppleProxHIDEventDriver");
        io_service_t v19 = IOServiceGetMatchingService(kIOMainPortDefault, v18);
        io_object_t v16 = v19;
        if (v19)
        {
          CFNumberRef v20 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v19, "IOService", @"floodComplianceRevision", kCFAllocatorDefault, 3u);
          CFNumberRef v17 = v20;
          if (v20)
          {
            int valuePtr = 0;
            if (CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr))
            {
              BOOL v15 = (valuePtr & 0xC0) != 0;
              goto LABEL_36;
            }
            NSLog(@"Error converting vader compliance value\n");
          }
          else
          {
            NSLog(@"Couldn't read vader compliance\n");
            CFNumberRef v17 = 0;
          }
        }
        else
        {
          NSLog(@"Unable to find prox service");
          CFNumberRef v17 = 0;
          io_object_t v16 = 0;
        }
        BOOL v15 = 0;
LABEL_36:
        if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v23.__r_.__value_.__l.__data_);
        }
        goto LABEL_38;
      }
      if (!memcmp(v23.__r_.__value_.__l.__data_, v13, v23.__r_.__value_.__l.__size_)) {
        goto LABEL_28;
      }
    }
LABEL_27:
    CFNumberRef v17 = 0;
    io_object_t v16 = 0;
    BOOL v15 = 1;
    goto LABEL_36;
  }
  io_object_t v16 = 0;
  CFNumberRef v17 = 0;
  BOOL v15 = 1;
LABEL_38:
  IOObjectRelease(v2);
  if (v4) {
    CFRelease(v4);
  }
  if (v16) {
    IOObjectRelease(v16);
  }
  if (v17) {
    CFRelease(v17);
  }
LABEL_44:
  if ((char)v25 < 0) {
    operator delete(__p[0]);
  }
  return v15;
}

void sub_100008168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000081B4()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v1 = 0;
  io_object_t v2 = (_DWORD *)(*(void *)(v0 + 112) + 16);
  int v3 = -1;
  do
  {
    if (*v2 == 1718186595 && *(v2 - 2)) {
      int v3 = v1;
    }
    ++v1;
    v2 += 22;
  }
  while (v1 != 6);
  if (v3 == -1)
  {
    NSLog(@"Found no IR sensor\n");
    return 1;
  }
  CFDictionaryRef v4 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  CFTypeRef v6 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageSNUM", kCFAllocatorDefault, 3u);
  if (v6)
  {
    CFRelease(v6);
    int v7 = 0;
  }
  else
  {
    NSLog(@"LoadPDEFiles: No Savage found. Never mind");
    int v7 = 8;
  }
  BOOL v8 = sub_100003D48();
  BOOL v9 = v8;
  NSLog(@"LoadPDEFiles: isOverridden %d", v8);
  id v42 = 0;
  sub_100008B80(&v41, (char *)&unk_10001DA5B);
  id v10 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyPathForPersistentData:101 error:&v42];
  if (v42)
  {

    if (!v9) {
      NSLog(@"Could not find SEP reference location. Will use ISP references");
    }
  }
  else
  {
    double v11 = v10;
    sub_100008D9C(&v41, (char *)[v10 UTF8String]);
    std::string::append(&v41, "/", 1uLL);

    if (!v9)
    {
      sub_100008860((const void **)&v41.__r_.__value_.__l.__data_, 5, __p);
      if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v12 = __p;
      }
      else {
        unint64_t v12 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
      }
      CFTypeRef v13 = fopen((const char *)v12, "r");
      int v14 = SHIBYTE(__p[0].__r_.__value_.__r.__words[2]);
      if (v13)
      {
        BOOL v15 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
        if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          BOOL v15 = __p;
        }
        NSLog(@"Found reference plist at %s. Will use SEP references", v15);
        v7 |= 1u;
        fclose(v13);
      }
      else
      {
        std::string::size_type v16 = __p[0].__r_.__value_.__r.__words[0];
        CFNumberRef v17 = __error();
        CFDictionaryRef v18 = __p;
        if (v14 < 0) {
          CFDictionaryRef v18 = (std::string *)v16;
        }
        NSLog(@"Could not find reference plist at %s (errno: %d). Will use ISP references", v18, *v17);
      }
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p[0].__r_.__value_.__l.__data_);
      }
    }
  }
  sub_10000CA0C(v0, outputStruct);
  int v19 = outputStruct[11];
  int v20 = sub_100013B90(v0);
  if (v19) {
    int v21 = v7 | 2;
  }
  else {
    int v21 = v7;
  }
  if (v20) {
    int v22 = 4;
  }
  else {
    int v22 = 16;
  }
  sub_100003644(v21 | v22);
  sub_100003CB8();
  __p[0].__r_.__value_.__r.__words[0] = 0;
  if (sub_100003868((off_t *)__p)) {
    operator new[]();
  }
  NSLog(@"Error: Couldn't send NVM\n");
  bzero(__p, 0x14uLL);
  NSLog(@"Reading rosaline serial number from sysconfig\n");
  CFDictionaryRef v23 = IOServiceNameMatching("product");
  io_service_t v24 = IOServiceGetMatchingService(kIOMainPortDefault, v23);
  CFDataRef v25 = (const __CFData *)IORegistryEntrySearchCFProperty(v24, "IOService", @"rosaline-serial-num", kCFAllocatorDefault, 3u);
  CFDataRef v26 = v25;
  if (!v25)
  {
    NSLog(@"Couldn't read serial number\n");
    goto LABEL_51;
  }
  BytePtr = CFDataGetBytePtr(v25);
  unsigned int Length = CFDataGetLength(v26);
  memcpy(&__p[0].__r_.__value_.__s.__data_[2], BytePtr, Length);
  NSLog(@"Reading rosaline power from FDR\n");
  LOBYTE(BytePtr) = sub_100003650(__p);
  CFRelease(v26);
  if ((BytePtr & 1) == 0)
  {
    NSLog(@"Reading rosaline power from IOReg\n");
    CFDictionaryRef v29 = IOServiceNameMatching("AppleProxHIDEventDriver");
    io_service_t v30 = IOServiceGetMatchingService(kIOMainPortDefault, v29);
    CFNumberRef v31 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v30, "IOService", @"floodCalibrationCurrent", kCFAllocatorDefault, 3u);
    CFNumberRef v32 = v31;
    if (v31)
    {
      unsigned int valuePtr = 0;
      if (CFNumberGetValue(v31, kCFNumberSInt32Type, &valuePtr))
      {
        LOWORD(__p[0].__r_.__value_.__l.__data_) = valuePtr;
        if (valuePtr < 0x10000)
        {
          CFRelease(v32);
          goto LABEL_48;
        }
        NSLog(@"Error converting calibrated power value:  could not fit 32-bit value into 16-bit destination \n");
      }
      else
      {
        NSLog(@"Error converting calibrated power value\n");
      }
      CFRelease(v32);
    }
    else
    {
      NSLog(@"Could not read calibrated power from IOReg\n");
    }
    NSLog(@"Reading rosaline power from sysconfig\n");
    CFDictionaryRef v33 = IOServiceNameMatching("isp");
    io_service_t v34 = IOServiceGetMatchingService(kIOMainPortDefault, v33);
    CFDataRef v35 = (const __CFData *)IORegistryEntrySearchCFProperty(v34, "IOService", @"rosaline-calibration-current", kCFAllocatorDefault, 3u);
    CFDataRef v36 = v35;
    if (!v35)
    {
      NSLog(@"Could not read calibrated power from sysconfig\n");
      goto LABEL_51;
    }
    LOWORD(__p[0].__r_.__value_.__l.__data_) = *((_WORD *)CFDataGetBytePtr(v35) + 1);
    CFRelease(v36);
  }
LABEL_48:
  NSLog(@"Sending rosaline configuration: SN: %s; Power: %d\n",
    &__p[0].__r_.__value_.__s.__data_[2],
    LOWORD(__p[0].__r_.__value_.__l.__data_));
  uint64_t v37 = sub_100012AE8(v0, v3, (uint64_t)__p, 0x14u, 6u);
  if (!v37) {
    goto LABEL_52;
  }
  NSLog(@"Failed to send rosaline data file: 0x%08X\n", v37);
LABEL_51:
  NSLog(@"Error: Couldn't send rosaline configuration\n");
LABEL_52:
  bzero(__p, 0x3370uLL);
  if ((sub_100003E4C() & 1) == 0)
  {
    NSLog(@"Failed to read PCE Calibration (FDR data)\n");
    goto LABEL_61;
  }
  if (v21) {
    char v38 = &v41;
  }
  else {
    char v38 = (std::string *)qword_100247BC8;
  }
  if (sub_1000089AC(v0, (const void **)&v38->__r_.__value_.__l.__data_, v3))
  {
    NSLog(@"Failed to send references to FW\n");
LABEL_61:
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v41.__r_.__value_.__l.__data_);
    }
    NSLog(@"Failed to load PDE files\n");
    return 1;
  }
  if (sub_100012AE8(v0, v3, (uint64_t)__p, 0x3370u, 0xFFu))
  {
    NSLog(@"Failed to send PCE calibration to FW\n");
    goto LABEL_61;
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  return 1;
}

void sub_100008810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008860(const void **a1@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  sub_100008DE4(a1, (const void **)"reference", (uint64_t)&v13);
  if ((a2 - 4) > 0xA) {
    int v5 = (char *)&unk_10001DA5B;
  }
  else {
    int v5 = off_100024C00[a2 - 4];
  }
  sub_100008B80(__p, v5);
  if ((v12 & 0x80u) == 0) {
    CFTypeRef v6 = __p;
  }
  else {
    CFTypeRef v6 = (void **)__p[0];
  }
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v7 = v12;
  }
  else {
    std::string::size_type v7 = (std::string::size_type)__p[1];
  }
  BOOL v8 = std::string::append(&v13, (const std::string::value_type *)v6, v7);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  id v10 = std::string::append(&v14, ".plist", 6uLL);
  *a3 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
}

void sub_100008960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000089AC(uint64_t a1, const void **a2, int a3)
{
  int v13 = 256;
  sub_100008860(a2, 4, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  sub_100008F38(a1, a3, +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", +[NSString stringWithUTF8String:p_p]), (uint64_t)a2, 2, (uint64_t)&v13);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  sub_100008860(a2, 5, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v7 = &__p;
  }
  else {
    std::string::size_type v7 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v8 = sub_100008F38(a1, a3, +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", +[NSString stringWithUTF8String:v7]), (uint64_t)a2, 1, (uint64_t)&v13);
  uint64_t v9 = v8;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v9) {
      return v9;
    }
  }
  else if (v8)
  {
    return v9;
  }
  sub_100008860(a2, 12, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v10 = &__p;
  }
  else {
    id v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  sub_100008F38(a1, a3, +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", +[NSString stringWithUTF8String:v10]), (uint64_t)a2, 3, (uint64_t)&v13);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v9;
}

void sub_100008B5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100008B80(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100008C34();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    CFTypeRef v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFTypeRef v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_100008C34()
{
}

void sub_100008C4C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100008CA8(exception, a1);
}

void sub_100008C94(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100008CA8(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

std::string *sub_100008CDC(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = SHIBYTE(__dst->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = __dst->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = HIBYTE(__dst->__r_.__value_.__r.__words[2]);
      std::string::size_type v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0, size, __len, __src);
      return __dst;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)&__dst->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    *((unsigned char *)&__dst->__r_.__value_.__s + 23) = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

std::string *sub_100008D9C(std::string *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return sub_100008CDC(a1, __s, v4);
}

uint64_t sub_100008DE4@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = sub_100008EB0(a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    uint64_t v8 = (char *)result;
  }
  else {
    uint64_t v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      std::string::size_type v9 = a1;
    }
    else {
      std::string::size_type v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  unint64_t v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      double v11 = a2;
    }
    else {
      double v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t sub_100008EB0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100008C34();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    size_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t sub_100008F38(uint64_t a1, int a2, void *a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6 = 3758097084;
  if (a3)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    int v31 = 0;
    id v13 = [a3 allKeys];
    CFNumberRef v32 = +[NSSortDescriptor sortDescriptorWithKey:@"doubleValue" ascending:1];
    id v14 = [v13 sortedArrayUsingDescriptors:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1)];
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    int v29 = 1;
    id v15 = [a3 objectForKey:@"FormatDR"];
    if (v15)
    {
      unsigned int v16 = [v15 intValue];
      *((_DWORD *)v27 + 6) = v16;
    }
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3052000000;
    v25[3] = sub_1000091C0;
    v25[4] = sub_1000091D0;
    v25[5] = &off_10002C428;
    uint64_t v21 = 0;
    int v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000091DC;
    v18[3] = &unk_100024BE0;
    v18[4] = a3;
    v18[5] = v25;
    int v19 = a2;
    int v20 = a5;
    v18[10] = a1;
    v18[11] = a6;
    v18[6] = v30;
    v18[7] = &v26;
    v18[8] = &v21;
    v18[9] = a4;
    [v14 enumerateObjectsUsingBlock:v18];
    if (*((unsigned char *)v22 + 24)) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 3758097084;
    }
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(v30, 8);
  }
  return v6;
}

void sub_100009174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000091C0(uint64_t a1, uint64_t a2)
{
}

void sub_1000091D0(uint64_t a1)
{
}

void sub_1000091DC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:a2] & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 32) objectForKey:a2];
    if (v7)
    {
      uint64_t v8 = *(const void ***)(a1 + 72);
      std::string::size_type v9 = (const char *)[v7 UTF8String];
      unint64_t v10 = v9;
      if (*((char *)v8 + 23) >= 0) {
        size_t v11 = *((unsigned __int8 *)v8 + 23);
      }
      else {
        size_t v11 = (size_t)v8[1];
      }
      size_t v12 = strlen(v9);
      id v13 = __p;
      sub_100008EB0((uint64_t)__p, v11 + v12);
      if (v25 < 0) {
        id v13 = (void **)__p[0];
      }
      if (v11)
      {
        if (*((char *)v8 + 23) >= 0) {
          id v14 = v8;
        }
        else {
          id v14 = *v8;
        }
        memmove(v13, v14, v11);
      }
      id v15 = (char *)v13 + v11;
      if (v12) {
        memmove(v15, v10, v12);
      }
      v15[v12] = 0;
      if (v25 >= 0) {
        unsigned int v16 = __p;
      }
      else {
        unsigned int v16 = (void **)__p[0];
      }
      CFNumberRef v17 = *(_DWORD **)(a1 + 88);
      uint64_t v18 = *v17;
      *CFNumberRef v17 = v18 + 1;
      uint64_t v19 = *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [a2 doubleValue];
      uint64_t v21 = v20;
      NSLog(@"Sending reference file %s, type: %d\n", v16, v18);
      NSLog(@"Trying to load reference file %s (type: %d, index: %d, temperature: %lf)\n", v16, v18, v19, v21);
      int v22 = fopen((const char *)v16, "rb");
      uint64_t v23 = v22;
      if (v22)
      {
        fseeko(v22, 0, 2);
        ftello(v23);
        fseeko(v23, 0, 0);
        operator new[]();
      }
      NSLog(@"Could not open input file: %s\n", v16);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
      if (v25 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_10000949C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000094B8()
{
  sub_100008B80(qword_100247BC8, "/var/mobile/Library/ISP/Pearl/");

  return __cxa_atexit((void (*)(void *))&std::string::~string, qword_100247BC8, (void *)&_mh_execute_header);
}

uint64_t sub_100009518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 56) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 80), 0);
  pthread_cond_init((pthread_cond_t *)(a1 + 144), 0);
  *(unsigned char *)(a1 + 192) = 0;
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a3;
  *(void *)(a1 + 64) = pthread_self();
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  *(void *)(a1 + 48) = CFRetain(Current);
  *(void *)(a1 + 72) = 0;
  return a1;
}

uint64_t sub_100009590(uint64_t a1)
{
  for (unint64_t i = 0; i < CFArrayGetCount(*(CFArrayRef *)a1); ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)a1, i);
    sub_10000D144((uint64_t)ValueAtIndex);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 56);
  if (v4) {
    IOObjectRelease(v4);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  uint64_t v5 = *(IONotificationPort **)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = *(__CFRunLoopSource **)(a1 + 24);
    if (v6)
    {
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 48), v6, kCFRunLoopDefaultMode);
      *(void *)(a1 + 24) = 0;
      uint64_t v5 = *(IONotificationPort **)(a1 + 16);
    }
    IONotificationPortDestroy(v5);
  }
  id v7 = *(NSObject **)(a1 + 72);
  if (v7)
  {
    dispatch_sync(v7, &stru_100024C78);
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    *(void *)(a1 + 72) = 0;
  }
  pthread_cond_destroy((pthread_cond_t *)(a1 + 144));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 80));
  uint64_t v8 = *(const void **)(a1 + 48);
  if (v8) {
    CFRelease(v8);
  }
  return a1;
}

uint64_t sub_100009674(uint64_t a1)
{
  callBacks.version = 0;
  callBacks.retain = 0;
  callBacks.copyDescription = 0;
  callBacks.equal = 0;
  callBacks.release = (CFArrayReleaseCallBack)sub_100009904;
  CFMutableArrayRef v2 = CFArrayCreateMutable(0, 0, &callBacks);
  *(void *)a1 = v2;
  if (!v2) {
    return 3758097085;
  }
  uint64_t v3 = IOMasterPort(bootstrap_port, (mach_port_t *)(a1 + 8));
  if (!v3)
  {
    CFDictionaryRef v4 = IOServiceMatching("AppleH16CamIn");
    uint64_t v5 = IONotificationPortCreate(*(_DWORD *)(a1 + 8));
    *(void *)(a1 + 16) = v5;
    if (v5)
    {
      RunLoopSource = IONotificationPortGetRunLoopSource(v5);
      *(void *)(a1 + 24) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 48), RunLoopSource, kCFRunLoopDefaultMode);
        uint64_t v3 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 16), "IOServiceFirstPublish", v4, (IOServiceMatchingCallback)sub_100009948, (void *)a1, (io_iterator_t *)(a1 + 56));
        if (!v3)
        {
          *(void *)(a1 + 72) = dispatch_queue_create("com.apple.h16ispdevicecontroller.notifications.queue", 0);
          sub_100009948(a1, *(_DWORD *)(a1 + 56));
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
          id v7 = (unsigned __int8 *)(a1 + 192);
          if (*(unsigned char *)(a1 + 192))
          {
            uint64_t v3 = 0;
          }
          else
          {
            clock_gettime(_CLOCK_REALTIME, &__tp);
            __tp.tv_sec += 2;
            uint64_t v3 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 144), (pthread_mutex_t *)(a1 + 80), &__tp);
            if (v3 && !*v7)
            {
              if (off_100247B88 == &_os_log_default) {
                off_100247B88 = os_log_create("com.apple.isp", "device");
              }
              uint64_t v3 = 3758097110;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100019DC8(v7);
              }
            }
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 80));
        }
        return v3;
      }
      if (off_100247B88 == &_os_log_default) {
        off_100247B88 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100019D40();
      }
      IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 16));
      *(void *)(a1 + 16) = 0;
    }
    else
    {
      if (off_100247B88 == &_os_log_default) {
        off_100247B88 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100019CB8();
      }
    }
    return 3758097086;
  }
  return v3;
}

void sub_100009904(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000D280(a2);
    operator delete();
  }
}

uint64_t sub_100009948(uint64_t a1, io_iterator_t iterator)
{
  CFMutableDictionaryRef properties = 0;
  CFDictionaryRef v4 = (pthread_mutex_t *)(a1 + 80);
  uint64_t v5 = (pthread_cond_t *)(a1 + 144);
  while (1)
  {
    uint64_t result = IOIteratorNext(iterator);
    if (!result) {
      break;
    }
    if (!IORegistryEntryCreateCFProperties(result, &properties, kCFAllocatorDefault, 0))
    {
      if (!CFArrayGetCount(*(CFArrayRef *)a1)) {
        operator new();
      }
      CFRelease(properties);
      pthread_mutex_lock(v4);
      *(unsigned char *)(a1 + 192) = 1;
      pthread_cond_broadcast(v5);
      pthread_mutex_unlock(v4);
    }
  }
  return result;
}

void sub_100009A54()
{
}

int64_t sub_100009A78(xpc_connection_t *a1, void *a2)
{
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(*a1, a2);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      size_t length = 3680;
      os_log_t v19 = (os_log_t)off_100247B90;
      if (off_100247B90 == &_os_log_default)
      {
        os_log_t v19 = os_log_create("com.apple.isp", "services");
        off_100247B90 = v19;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100019ED8(v19);
      }
      int64_t int64 = xpc_dictionary_get_int64(v5, "H16ISPServicesRemoteReturnKey");
      data = xpc_dictionary_get_data(v5, "H16ISPServicesRemoteDataKey", &length);
      xpc_dictionary_set_data(a2, "H16ISPServicesRemoteDataKey", data, length);
      xpc_object_t value = xpc_dictionary_get_value(v5, "H16ISPServicesRemoteRGBIRReportKey");
      xpc_dictionary_set_value(a2, "H16ISPServicesRemoteRGBIRReportKey", value);
      xpc_object_t v22 = xpc_dictionary_get_value(v5, "H16ISPServicesRemoteRGBIRFinalOutputPCEConfigKey");
      xpc_dictionary_set_value(a2, "H16ISPServicesRemoteRGBIRFinalOutputPCEConfigKey", v22);
      xpc_object_t v23 = xpc_dictionary_get_value(v5, "H16ISPServicesRemoteCFTypeNameKey");
      xpc_dictionary_set_value(a2, "H16ISPServicesRemoteCFTypeNameKey", v23);
      xpc_object_t v24 = xpc_dictionary_get_value(v5, "H16ISPServicesRemoteCFTypeDataKey");
      xpc_dictionary_set_value(a2, "H16ISPServicesRemoteCFTypeDataKey", v24);
    }
    else
    {
      int64_t int64 = 3758097084;
      if (type == (xpc_type_t)&_xpc_type_error)
      {
        uint64_t v8 = xpc_copy_description(v5);
        if (v8)
        {
          std::string::size_type v9 = v8;
          os_log_t v10 = (os_log_t)off_100247B90;
          if (off_100247B90 == &_os_log_default)
          {
            os_log_t v10 = os_log_create("com.apple.isp", "services");
            off_100247B90 = v10;
          }
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_100019F5C();
          }
          free(v9);
        }
        int64_t int64 = 3758097111;
        if (v5 != &_xpc_error_connection_invalid) {
          xpc_connection_cancel(*a1);
        }
      }
    }
    xpc_release(v5);
  }
  else
  {
    os_log_t v11 = (os_log_t)off_100247B90;
    if (off_100247B90 == &_os_log_default)
    {
      os_log_t v11 = os_log_create("com.apple.isp", "services");
      off_100247B90 = v11;
    }
    int64_t int64 = 3758097084;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100019E60(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  return int64;
}

uint64_t sub_100009D08(xpc_connection_t *a1, xpc_object_t *a2)
{
  uint64_t v2 = 3758097084;
  if (!*a1) {
    return 3758097111;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5) {
    return 3758097085;
  }
  uint64_t v6 = v5;
  xpc_dictionary_set_uint64(v5, "H16ISPServicesRemoteTypeKey", 2uLL);
  xpc_dictionary_set_data(v6, "H16ISPServicesRemoteDataKey", a2, 0xE60uLL);
  if ((*(_DWORD *)a2 - 6) >= 2)
  {
    if (*(_DWORD *)a2 != 13) {
      goto LABEL_10;
    }
    id v7 = "H16ISPServicesRemoteRGBIRFinalInputPCEConfigKey";
  }
  else
  {
    id v7 = "H16ISPServicesRemoteCFTypeNameKey";
  }
  xpc_dictionary_set_value(v6, v7, a2[1]);
LABEL_10:
  int64_t v8 = sub_100009A78(a1, v6);
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "H16ISPServicesRemoteDataKey", &length);
  if (length == 3680)
  {
    uint64_t v2 = v8;
    memcpy(a2, data, 0xE60uLL);
    int v10 = *(_DWORD *)a2;
    if ((*(_DWORD *)a2 - 6) < 2)
    {
      if (v8) {
        goto LABEL_19;
      }
      os_log_t v11 = "H16ISPServicesRemoteCFTypeDataKey";
    }
    else
    {
      if (v10 != 13)
      {
        if (v10 != 12)
        {
LABEL_24:
          xpc_release(v6);
          return v2;
        }
        if (v8)
        {
          a2[1] = 0;
          goto LABEL_24;
        }
        xpc_object_t value = xpc_dictionary_get_value(v6, "H16ISPServicesRemoteRGBIRReportKey");
        a2[1] = value;
LABEL_23:
        xpc_retain(value);
        goto LABEL_24;
      }
      if (v8)
      {
LABEL_19:
        a2[2] = 0;
        goto LABEL_24;
      }
      os_log_t v11 = "H16ISPServicesRemoteRGBIRFinalOutputPCEConfigKey";
    }
    xpc_object_t value = xpc_dictionary_get_value(v6, v11);
    a2[2] = value;
    goto LABEL_23;
  }
  return v2;
}

uint64_t sub_100009EA0(xpc_connection_t *a1, xpc_object_t *a2)
{
  os_log_t v4 = (os_log_t)off_100247B90;
  if (off_100247B90 == &_os_log_default)
  {
    os_log_t v4 = os_log_create("com.apple.isp", "services");
    off_100247B90 = v4;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)a2;
    int v10 = 67109120;
    int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "H16ISPServicesRemote: GetProperty (%d) (sent)\n", (uint8_t *)&v10, 8u);
  }
  uint64_t v6 = sub_100009D08(a1, a2);
  os_log_t v7 = (os_log_t)off_100247B90;
  if (off_100247B90 == &_os_log_default)
  {
    os_log_t v7 = os_log_create("com.apple.isp", "services");
    off_100247B90 = v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(_DWORD *)a2;
    int v10 = 67109376;
    int v11 = v8;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "H16ISPServicesRemote: GetProperty (%d) (reply=0x%08X)\n", (uint8_t *)&v10, 0xEu);
  }
  return v6;
}

void sub_10000A014(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000A044(void *a1, uint64_t a2, uint64_t a3)
{
  pthread_t v8 = 0;
  sub_10000A4C4((uint64_t)&v10);
  v9[0] = 0;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = &v10;
  sched_param v7 = (sched_param)48;
  pthread_attr_init(&v11);
  pthread_attr_setschedparam(&v11, &v7);
  pthread_attr_setdetachstate(&v11, 1);
  pthread_create(&v8, &v11, (void *(__cdecl *)(void *))sub_10000A150, v9);
  pthread_attr_destroy(&v11);
  sub_10000A508(&v10);
  *a1 = v9[0];
  sub_10000A500((uint64_t)&v10);
  return 0;
}

void sub_10000A134(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_10000A150(uint64_t a1)
{
}

void sub_10000A1F4()
{
}

void sub_10000A218(uint64_t a1)
{
  uint64_t v2 = (__CFRunLoop *)CFRetain(*(CFTypeRef *)(a1 + 48));
  CFRunLoopStop(v2);
  uint64_t v3 = 0;
  pthread_join(*(pthread_t *)(a1 + 64), &v3);
  sub_100009670(a1);
  operator delete();
}

uint64_t sub_10000A288(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyValue(a1, a2, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4)
  {
    CFStringRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t IntValue = CFStringGetIntValue(v5);
      if (!IntValue)
      {
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v5, SystemEncoding);
        if (!CStringPtr || (uint64_t IntValue = strtol(CStringPtr, 0, 0), !IntValue))
        {
          uint64_t IntValue = 1;
          if (CFStringCompare(v5, @"true", 1uLL))
          {
            uint64_t IntValue = 1;
            if (CFStringCompare(v5, @"yes", 1uLL))
            {
              if (CFStringCompare(v5, @"false", 1uLL) == kCFCompareEqualTo
                || CFStringCompare(v5, @"no", 1uLL) == kCFCompareEqualTo
                || (uint64_t IntValue = a3, CFStringCompare(v5, @"0", 1uLL) == kCFCompareEqualTo))
              {
                uint64_t IntValue = 0;
              }
            }
          }
        }
      }
    }
    else
    {
      CFTypeID v10 = CFGetTypeID(v5);
      if (v10 == CFNumberGetTypeID())
      {
        unsigned int valuePtr = 0;
        if (CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr)) {
          uint64_t IntValue = valuePtr;
        }
        else {
          uint64_t IntValue = a3;
        }
      }
      else
      {
        CFTypeID v11 = CFGetTypeID(v5);
        uint64_t IntValue = a3;
        if (v11 == CFBooleanGetTypeID()) {
          uint64_t IntValue = CFEqual(v5, kCFBooleanTrue);
        }
      }
    }
    CFRelease(v5);
    return IntValue;
  }
  return a3;
}

unsigned int *sub_10000A438(uint64_t a1, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 16);
  if (v3)
  {
    CFStringRef v4 = (unsigned int *)(a1 + 20);
    do
    {
      uint64_t v5 = *v4;
      if ((unint64_t)v4 + v5 > a1 + a2) {
        break;
      }
      if (*((unsigned __int16 *)v4 + 4) == a3) {
        return v4 + 1;
      }
      CFStringRef v4 = (unsigned int *)((char *)v4 + (v5 + 4));
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t sub_10000A484(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A4C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A508(pthread_mutex_t *a1)
{
  return pthread_cond_wait((pthread_cond_t *)&a1[1], a1);
}

uint64_t sub_10000A514(uint64_t a1)
{
  pthread_cond_signal((pthread_cond_t *)(a1 + 64));

  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

const void **sub_10000A550(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_10000A588(uint64_t a1)
{
  int v27 = 255;
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  uint64_t v26 = 0;
  id v4 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyPathForPersonalizedData:0 error:&v26];
  uint64_t v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      NSLog(@"Personalized firmware root path accessor not found");
      return;
    }
    if (sub_100013B30(a1, &v27))
    {
      CFTypeID v6 = +[NSData dataWithContentsOfFile:@"/private/var/tmp/usr/standalone/firmware/Savage/SavagePatch.DAT"];
      if (v6)
      {
        uint64_t v21 = v6;
        NSLog(@"Found Savage override DAT file, which takes precedence over all others - %@", @"/private/var/tmp/usr/standalone/firmware/Savage/SavagePatch.DAT");
        uint64_t v9 = 0;
        CFTypeRef v7 = 0;
        uint64_t v22 = 3722248192;
      }
      else
      {
        CFTypeRef v7 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageDeviceRev", kCFAllocatorDefault, 0);
        CFTypeRef v8 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageMNS", kCFAllocatorDefault, 0);
        uint64_t v9 = v8;
        if (v7) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          NSLog(@"IR sensor not detected");
          xpc_object_t v24 = 0;
          id v23 = 0;
          uint64_t v22 = 3149594624;
          goto LABEL_22;
        }
        CFTypeID v11 = CFGetTypeID(v7);
        if (v11 != CFDataGetTypeID() || (CFTypeID v12 = CFGetTypeID(v9), v12 != CFDataGetTypeID()))
        {
          xpc_object_t v24 = 0;
          goto LABEL_24;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)v7);
        uint64_t v14 = "B3";
        if (BytePtr && (*BytePtr & 0xF0) == 0xA0) {
          uint64_t v14 = "BA";
        }
        uint64_t v15 = CFDataGetBytePtr((CFDataRef)v9);
        uint64_t v16 = "Dev";
        if (v15 && *v15 == 10) {
          uint64_t v16 = "Prod";
        }
        snprintf(__str, 0x400uLL, "Savage/SavagePatch%s%s.DAT", v14, v16);
        id v17 = [[v5 stringByAppendingPathComponent:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str)];
        NSLog(@"DAT file for unprovisioned Savage - %@", v17);
        id v18 = [v5 stringByAppendingPathComponent:@"/Savage/SavagePatch.DAT"];
        NSLog(@"DAT file for provisioned Savage - %@", v18);
        os_log_t v19 = +[NSData dataWithContentsOfFile:v17];
        if (v19)
        {
          uint64_t v21 = v19;
          uint64_t v22 = 2863267840;
          NSLog(@"Loading DAT file for unprovisioned Savage");
        }
        else
        {
          uint64_t v20 = +[NSData dataWithContentsOfFile:v18];
          if (!v20)
          {
            NSLog(@"No DAT file for Savage found");
            xpc_object_t v24 = 0;
            id v23 = 0;
            uint64_t v22 = 3435921408;
            goto LABEL_22;
          }
          uint64_t v21 = v20;
          uint64_t v22 = 2863267840;
        }
      }
      id v23 = [(NSData *)v21 length];
      xpc_object_t v24 = malloc_type_calloc((size_t)v23, 1uLL, 0xD78BBC9FuLL);
      if (!v24) {
        goto LABEL_23;
      }
      [(NSData *)v21 getBytes:v24 length:v23];
    }
    else
    {
      xpc_object_t v24 = 0;
      id v23 = 0;
      uint64_t v9 = 0;
      CFTypeRef v7 = 0;
      uint64_t v22 = 4008574976;
    }
LABEL_22:
    uint64_t v25 = sub_100012AE8(a1, v27 | 0x80000000, (uint64_t)v24, v23, v22 | 5);
    NSLog(@"Load Savage DAT File: Size = %ld; SendStatus = %08x, FileStatus = 0x%08X", v23, v25, v22);
LABEL_23:
    if (!v9)
    {
LABEL_25:
      if (v7) {
        CFRelease(v7);
      }
      CFRelease(v5);
      if (v24) {
        free(v24);
      }
      return;
    }
LABEL_24:
    CFRelease(v9);
    goto LABEL_25;
  }
  NSLog(@"pDevice is NULL");
  if (v5) {
    CFRelease(v5);
  }
}

void sub_10000A94C(uint64_t a1)
{
  int v31 = 255;
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  uint64_t v30 = 0;
  id v4 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyPathForPersonalizedData:0 error:&v30];
  uint64_t v5 = +[NSData dataWithContentsOfFile:@"/private/var/tmp/usr/standalone/firmware/Yonkers/YonkersPatch.DAT"];
  if (!a1)
  {
    NSLog(@"pDevice is NULL");
    if (!v4) {
      return;
    }
LABEL_40:
    CFRelease(v4);
    return;
  }
  if (!v4)
  {
    NSLog(@"Personalized firmware root path accessor not found");
    return;
  }
  CFTypeID v6 = v5;
  if (!sub_100013AD4(a1, &v31)) {
    goto LABEL_40;
  }
  if (v6)
  {
    NSLog(@"Found Yonkers override DAT file, which takes precedence over all others - %@", @"/private/var/tmp/usr/standalone/firmware/Yonkers/YonkersPatch.DAT");
    CFDataRef v9 = 0;
    CFTypeRef v7 = 0;
    uint64_t v21 = 3722248192;
  }
  else
  {
    CFTypeRef v7 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"YonkersFabRevision", kCFAllocatorDefault, 0);
    CFDataRef v8 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"YonkersMNS", kCFAllocatorDefault, 0);
    CFDataRef v9 = v8;
    if (v8) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      NSLog(@"Secure RGB sensor not detected");
      uint64_t v28 = 0;
      id v27 = 0;
      uint64_t v21 = 3149594624;
      goto LABEL_30;
    }
    CFTypeID v11 = CFGetTypeID(v8);
    if (v11 != CFDataGetTypeID() || (CFTypeID v12 = CFGetTypeID(v7), v12 != CFDataGetTypeID()))
    {
      uint64_t v28 = 0;
      goto LABEL_32;
    }
    BytePtr = CFDataGetBytePtr((CFDataRef)v7);
    if (!BytePtr
      || ((int v14 = __rev16(*(unsigned __int16 *)BytePtr), v15 = 1, v14 > 59904)
        ? (BOOL v16 = v14 == 59905, v17 = 61953)
        : (BOOL v16 = v14 == 54529, v17 = 56577),
          !v16 ? (BOOL v18 = v14 == v17) : (BOOL v18 = 1),
          !v18))
    {
      int v15 = 0;
    }
    os_log_t v19 = CFDataGetBytePtr(v9);
    uint64_t v20 = "Dev";
    if (v19 && *v19 == 8) {
      uint64_t v20 = "Prod";
    }
    uint64_t v21 = 2863267840;
    uint64_t v22 = "Ymgt";
    if (!v15) {
      uint64_t v22 = "Ngsk";
    }
    snprintf(__str, 0x400uLL, "Yonkers/YonkersPatch%s%s.DAT", v22, v20);
    id v23 = [[v4 stringByAppendingPathComponent:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str)];
    NSLog(@"DAT file for unprovisioned Yonkers - %@", v23);
    id v24 = [v4 stringByAppendingPathComponent:@"/Yonkers/YonkersPatch.DAT"];
    NSLog(@"DAT file for provisioned Yonkers - %@", v24);
    uint64_t v25 = +[NSData dataWithContentsOfFile:v23];
    if (v25)
    {
      CFTypeID v6 = v25;
      NSLog(@"Loading DAT file for unprovisioned Yonkers");
    }
    else
    {
      uint64_t v26 = +[NSData dataWithContentsOfFile:v24];
      if (!v26)
      {
        NSLog(@"No DAT file for Yonkers found");
        uint64_t v28 = 0;
        id v27 = 0;
        uint64_t v21 = 3435921408;
        goto LABEL_30;
      }
      CFTypeID v6 = v26;
    }
  }
  id v27 = [(NSData *)v6 length];
  uint64_t v28 = malloc_type_calloc((size_t)v27, 1uLL, 0x4664D063uLL);
  if (!v28) {
    goto LABEL_31;
  }
  [(NSData *)v6 getBytes:v28 length:v27];
LABEL_30:
  uint64_t v29 = sub_100012AE8(a1, v31 | 0x80000000, (uint64_t)v28, v27, v21 | 5);
  NSLog(@"Load Yonkers DAT File: Size = %ld; SendStatus = %08x, 0x%08X", v27, v29, v21);
LABEL_31:
  if (v9) {
LABEL_32:
  }
    CFRelease(v9);
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(v4);
  if (v28) {
    free(v28);
  }
}

void sub_10000AD2C(uint64_t a1)
{
  unsigned int v25 = 255;
  if (!a1) {
    return;
  }
  if (!sub_100013B30(a1, &v25)) {
    goto LABEL_42;
  }
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  CFTypeRef v4 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"LoadHPR", kCFAllocatorDefault, 0);
  uint64_t v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFBooleanGetTypeID() && !CFBooleanGetValue((CFBooleanRef)v5))
    {
      CFRelease(v5);
      os_log_t v24 = (os_log_t)off_100247B98;
      if (off_100247B98 == &_os_log_default)
      {
        os_log_t v24 = os_log_create("com.apple.isp", "general");
        off_100247B98 = v24;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10001A080(v24);
      }
LABEL_42:
      CFStringRef v15 = 0;
      goto LABEL_43;
    }
  }
  CFTypeRef v7 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageChipID", kCFAllocatorDefault, 3u);
  if (v7)
  {
    CFDataRef v8 = v7;
    uint64_t v9 = AMFDRCreateInstanceString();
    if (v9)
    {
      BOOL v10 = (const void *)v9;
      CFTypeRef v11 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageUID", kCFAllocatorDefault, 3u);
      if (v11)
      {
        CFTypeID v12 = v11;
        uint64_t v13 = AMFDRCreateInstanceString();
        if (v13)
        {
          int v14 = (const void *)v13;
          CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@-%@", v10, v13);
          CFRelease(v12);
          CFRelease(v14);
          goto LABEL_11;
        }
        NSLog(@"Couldn't create SavageUID string ref");
        CFRelease(v12);
      }
      else
      {
        NSLog(@"Couldn't read SavageUID");
      }
      CFStringRef v15 = 0;
LABEL_11:
      CFRelease(v8);
      CFRelease(v10);
      if (!v5) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    NSLog(@"Couldn't create SavageChipID string ref");
    CFRelease(v8);
  }
  else
  {
    NSLog(@"Couldn't read SavageChipID");
  }
  CFStringRef v15 = 0;
  if (v5) {
LABEL_12:
  }
    CFRelease(v5);
LABEL_13:
  if (!v15)
  {
    NSLog(@"Couldn't combine frontIR chipIDStr and uidStr");
LABEL_43:
    CFDataRef v17 = 0;
    goto LABEL_44;
  }
  BOOL v16 = +[NSData dataWithContentsOfFile:@"/usr/local/share/firmware/isp/Savage/FrontIRHPR.DER"];
  if (v16)
  {
    CFDataRef v17 = (const __CFData *)v16;
    NSLog(@"Found FrontIR override (has highest precedence) HPR file - camChannel = %d", v25);
    goto LABEL_16;
  }
  CFDataRef v17 = (const __CFData *)AMFDRSealingMapCopyLocalMinimalManifestForInstance();
  if (v17)
  {
LABEL_16:
    BytePtr = CFDataGetBytePtr(v17);
    unsigned int Length = CFDataGetLength(v17);
    int v20 = sub_100012AE8(a1, v25 | 0x80000000, (uint64_t)BytePtr, Length, 0x501u);
    CFStringRef v21 = CFCopyDescription(v17);
    os_log_t v22 = (os_log_t)off_100247B98;
    if (off_100247B98 == &_os_log_default)
    {
      os_log_t v22 = os_log_create("com.apple.isp", "general");
      off_100247B98 = v22;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      CStringPtr = CFStringGetCStringPtr(v21, 0);
      *(_DWORD *)buf = 136315650;
      id v27 = "LoadFrontIRHPRFile";
      __int16 v28 = 1024;
      int v29 = v20;
      __int16 v30 = 2080;
      int v31 = CStringPtr;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s - Status = %08x; HPR - %s\n", buf, 0x1Cu);
    }
    goto LABEL_20;
  }
  NSLog(@"No HPR file for frontIR found");
LABEL_44:
  CFStringRef v21 = 0;
LABEL_20:
  if (v15) {
    CFRelease(v15);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v21) {
    CFRelease(v21);
  }
}

void start()
{
}

void sub_10000B2EC()
{
}

uint64_t sub_10000B310(uint64_t a1, _DWORD *a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(v2, 0x24u, 0, 0, &output, &outputCnt);
  if (!result) {
    *a2 = output;
  }
  return result;
}

uint64_t sub_10000B37C(uint64_t a1, void *a2)
{
  uint64_t v2 = 3758097085;
  CFErrorRef err = 0;
  uint64_t result = 3758097090;
  if (a2 && !*a2)
  {
    if (byte_100247C1A)
    {
      return 0;
    }
    else
    {
      CFURLRef v5 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/usr/local/share/firmware/isp/ISPUnitInfo.plist", kCFURLPOSIXPathStyle, 0);
      if (v5)
      {
        CFURLRef v6 = v5;
        CFPropertyListFormat format = 0;
        CFTypeRef v7 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v5);
        if (v7)
        {
          CFDataRef v8 = v7;
          if (CFReadStreamOpen(v7))
          {
            if (off_100247BA8 == &_os_log_default) {
              off_100247BA8 = os_log_create("com.apple.isp", "device");
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              id v23 = "GetUnitInfoPropertyDict";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s - Parsing ISPUnitInfo.plist\n", buf, 0xCu);
            }
            CFPropertyListRef v9 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v8, 0, 0, &format, &err);
            if (err)
            {
              if (off_100247BA8 == &_os_log_default) {
                off_100247BA8 = os_log_create("com.apple.isp", "device");
              }
              BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v10) {
                sub_10001A18C(v10, v11, v12, v13, v14, v15, v16, v17);
              }
              CFStringRef v18 = CFErrorCopyDescription(err);
              if (v18)
              {
                CFStringRef v19 = v18;
                CFShow(v18);
                CFRelease(v19);
              }
            }
            else
            {
              uint64_t v2 = 0;
              *a2 = v9;
            }
          }
          else
          {
            uint64_t v2 = 3758097136;
          }
          CFReadStreamClose(v8);
          CFRelease(v8);
        }
        CFRelease(v6);
        return v2;
      }
      else
      {
        return 3758097085;
      }
    }
  }
  return result;
}

uint64_t sub_10000B5A8(uint64_t a1)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = *(unsigned int *)(a1 + 152);
  if (result) {
    return !IOConnectCallScalarMethod(result, 5u, 0, 0, &output, &outputCnt) && output == 1;
  }
  return result;
}

uint64_t sub_10000B600(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  kdebug_trace();
  mach_port_t v10 = *(_DWORD *)(a1 + 152);
  if (v10)
  {
    input[0] = a2;
    input[1] = a3;
    input[2] = a4;
    input[3] = a5;
    uint64_t v11 = IOConnectCallScalarMethod(v10, 0xAu, input, 4u, 0, 0);
  }
  else
  {
    uint64_t v11 = 3758097084;
  }
  kdebug_trace();
  return v11;
}

uint64_t sub_10000B6F8(uint64_t a1, unsigned int a2, void *outputStruct)
{
  size_t v5 = 156;
  mach_port_t v3 = *(_DWORD *)(a1 + 152);
  if (!v3) {
    return 3758097084;
  }
  uint64_t input = a2;
  return IOConnectCallMethod(v3, 0xEu, &input, 1u, 0, 0, 0, 0, outputStruct, &v5);
}

uint64_t sub_10000B78C()
{
  uint64_t v0 = __chkstk_darwin();
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "CacheDeviceConfigs";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - caching device configurations\n", buf, 0xCu);
  }
  if (*(_DWORD *)(v0 + 476))
  {
    bzero(buf, 0x1CuLL);
    *(_WORD *)&uint8_t buf[4] = 3;
    uint64_t v1 = sub_10000B600(v0, (uint64_t)buf, 0x1Cu, 0, 0xFFFFFFFF);
    if (v1)
    {
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10001A350();
      }
LABEL_61:
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10001A244();
      }
      sub_10000C440(v0);
      return v1;
    }
    *(_OWORD *)(v0 + 8) = *(_OWORD *)buf;
    *(_OWORD *)(v0 + 20) = *(_OWORD *)&buf[12];
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int v20 = 136315650;
      CFStringRef v21 = "CacheDeviceConfigs";
      __int16 v22 = 1024;
      int v23 = *(_DWORD *)&buf[12];
      __int16 v24 = 1024;
      int v25 = *(_DWORD *)&buf[8];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s - maxChannels=%d, timeStampFrequency=%d\n", v20, 0x18u);
    }
    if (!*(void *)(v0 + 48)) {
      operator new[]();
    }
    if (!*(void *)(v0 + 40)) {
      operator new[]();
    }
    LODWORD(v10) = *(_DWORD *)(v0 + 476);
    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        bzero(buf, 0x190uLL);
        *(_WORD *)&uint8_t buf[4] = 269;
        *(_DWORD *)&buf[8] = v11;
        uint64_t v1 = sub_10000B600(v0, (uint64_t)buf, 0x190u, 0, 0xFFFFFFFF);
        if (v1)
        {
          if (off_100247BA8 == &_os_log_default) {
            off_100247BA8 = os_log_create("com.apple.isp", "device");
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10001A2C0();
          }
          goto LABEL_61;
        }
        *(_DWORD *)(*(void *)(v0 + 40) + 424 * v11) = v28;
        if (off_100247BA8 == &_os_log_default) {
          off_100247BA8 = os_log_create("com.apple.isp", "device");
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v20 = 136315650;
          CFStringRef v21 = "CacheDeviceConfigs";
          __int16 v22 = 1024;
          int v23 = v28;
          __int16 v24 = 1024;
          int v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - %d configurations detected for channel %d\n", v20, 0x18u);
        }
        memmove((void *)(*(void *)(v0 + 40) + 424 * v11 + 24), buf, 0x190uLL);
        uint64_t v12 = *(void *)(v0 + 40);
        if (!*(_DWORD *)(v12 + 424 * v11))
        {
LABEL_40:
          uint64_t v1 = 0;
          goto LABEL_48;
        }
        if (!*(void *)(v12 + 424 * v11 + 8) && !*(void *)(v12 + 424 * v11 + 16)) {
          operator new[]();
        }
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        unint64_t v15 = 0;
        while (1)
        {
          bzero(buf, 0x120uLL);
          *(_WORD *)&uint8_t buf[4] = 262;
          *(_DWORD *)&buf[8] = v11;
          *(_DWORD *)&buf[12] = v15;
          uint64_t v1 = sub_10000B600(v0, (uint64_t)buf, 0x120u, 0, 0xFFFFFFFF);
          if (v1) {
            break;
          }
          if ((v27 & 0x80) != 0) {
            unsigned int v27 = (v27 & 0xFFFFFF00) + 256;
          }
          memmove((void *)(*(void *)(*(void *)(v0 + 40) + 424 * v11 + 8) + v14), &buf[16], 0xD4uLL);
          uint64_t v1 = sub_100013BE8(v0, v11, v15, (void *)(*(void *)(*(void *)(v0 + 40) + 424 * v11 + 16) + v13));
          if (v1)
          {
            if (off_100247BA8 == &_os_log_default) {
              off_100247BA8 = os_log_create("com.apple.isp", "device");
            }
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              goto LABEL_48;
            }
            *(_DWORD *)int v20 = 136315650;
            CFStringRef v21 = "CacheDeviceConfigs";
            __int16 v22 = 1024;
            int v23 = v11;
            __int16 v24 = 1024;
            int v25 = v1;
            uint64_t v16 = "%s - Error getting LSC polynomial - chan: %d, res: 0x%08X\n";
LABEL_53:
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v16, v20, 0x18u);
            goto LABEL_48;
          }
          ++v15;
          v14 += 212;
          v13 += 72;
          if (v15 >= *(unsigned int *)(*(void *)(v0 + 40) + 424 * v11)) {
            goto LABEL_40;
          }
        }
        if (off_100247BA8 == &_os_log_default) {
          off_100247BA8 = os_log_create("com.apple.isp", "device");
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v20 = 136315650;
          CFStringRef v21 = "CacheDeviceConfigs";
          __int16 v22 = 1024;
          int v23 = v11;
          __int16 v24 = 1024;
          int v25 = v1;
          uint64_t v16 = "%s - Error getting camera config - chan: %d, res: 0x%08X\n";
          goto LABEL_53;
        }
LABEL_48:
        uint64_t v17 = *(void *)(v0 + 48);
        if (v17) {
          sub_10000B6F8(v0, v11, (void *)(v17 + 156 * v11));
        }
        ++v11;
        unint64_t v10 = *(unsigned int *)(v0 + 476);
      }
      while (v11 < v10);
      if (!v1) {
        goto LABEL_67;
      }
      goto LABEL_61;
    }
LABEL_67:
    *(_DWORD *)uint64_t v0 = v10;
    *(unsigned char *)(v0 + 4) = 1;
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v19 = *(_DWORD *)(v0 + 476);
      *(_DWORD *)int v20 = 136315394;
      CFStringRef v21 = "CacheDeviceConfigs";
      __int16 v22 = 1024;
      int v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s - Success: cached configs - numChannels: %d\n", v20, 0x12u);
    }
    return 0;
  }
  else
  {
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    uint64_t v1 = 3758097112;
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_10001A1C8(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return v1;
}

uint64_t sub_10000BF8C(uint64_t a1, int a2, int a3, int a4, unsigned int a5)
{
  bzero(v15, 0x14uLL);
  __int16 v16 = 290;
  int v17 = a2;
  int v18 = a3;
  int v19 = a4;
  uint64_t v10 = sub_10000B600(a1, (uint64_t)v15, 0x14u, 0, a5);
  uint64_t v11 = v10;
  if (a3 == 6914 && !v10)
  {
    if (*(_DWORD *)(a1 + 476))
    {
      unsigned int v12 = 0;
      while (1)
      {
        uint64_t v13 = sub_10000C0AC(a1, v12);
        if (v13) {
          break;
        }
        if (++v12 >= *(_DWORD *)(a1 + 476)) {
          return 0;
        }
      }
      uint64_t v11 = v13;
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10001A3CC(v12, v11);
      }
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

uint64_t sub_10000C0AC(uint64_t a1, unsigned int a2)
{
  bzero(__src, 0x190uLL);
  __int16 v7 = 269;
  unsigned int v8 = a2;
  uint64_t v4 = sub_10000B600(a1, (uint64_t)__src, 0x190u, 0, 0xFFFFFFFF);
  if (!v4) {
    memmove((void *)(*(void *)(a1 + 40) + 424 * a2 + 24), __src, 0x190uLL);
  }
  return v4;
}

uint64_t sub_10000C164(uint64_t a1, int a2, const char **a3)
{
  if (a2 != 6) {
    return 3758097090;
  }
  bzero(v19, 0x40uLL);
  __int16 v20 = 5;
  strncpy(v22, a3[1], 0x20uLL);
  uint64_t v5 = sub_10000B600(a1, (uint64_t)v19, 0x40u, 1u, 0xFFFFFFFF);
  if (v5)
  {
    uint64_t v6 = v5;
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A458((uint64_t)(a3 + 1), v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    unint64_t v13 = v27;
    unint64_t v14 = strtoul(a3[2], 0, 0);
    unint64_t v15 = strtoul(a3[3], 0, 0);
    unint64_t v16 = strtoul(a3[4], 0, 0);
    unint64_t v17 = strtoul(a3[5], 0, 0);
    printf("Special function: name: %s, parameters %llu %llu %llu %llu\n", v22, v14, v15, v16, v17);
    bzero(v19, 0x38uLL);
    __int16 v20 = 28;
    int v21 = 1;
    unint64_t v23 = v13;
    unint64_t v24 = v14;
    unint64_t v25 = v15;
    unint64_t v26 = v16;
    unint64_t v27 = v17;
    return sub_10000B600(a1, (uint64_t)v19, 0x38u, 1u, 0xFFFFFFFF);
  }
  return v6;
}

uint64_t sub_10000C340(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v6 = *(_DWORD *)(a1 + 476);
  uint64_t result = 3758097090;
  if (v6 > a2 && a3 <= 0x40)
  {
    bzero(v13, 0xD0uLL);
    __int16 v14 = 1285;
    unsigned int v15 = a2;
    __int16 v16 = a3;
    if (a3)
    {
      uint64_t v12 = 0;
      do
      {
        v17[v12] = *(_WORD *)(a4 + 2 * v12);
        *((unsigned char *)&v17[64] + v12) = *(unsigned char *)(a5 + v12);
        ++v12;
      }
      while (a3 != v12);
    }
    return sub_10000B600(a1, (uint64_t)v13, 0xD0u, 0, 0xFFFFFFFF);
  }
  return result;
}

uint64_t sub_10000C440(uint64_t a1)
{
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "InitDeviceConfigsCache";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - Initializing device configuration cache\n", (uint8_t *)&v7, 0xCu);
  }
  if (*(unsigned char *)(a1 + 4))
  {
    *(unsigned char *)(a1 + 4) = 0;
    *(_DWORD *)a1 = 0;
    BOOL v2 = (uint64_t *)(a1 + 40);
    if (*(void *)(a1 + 40))
    {
      if (!*(_DWORD *)(a1 + 476)) {
        goto LABEL_15;
      }
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = *v2;
        if (*(void *)(*v2 + v3 + 8)) {
          operator delete[]();
        }
        if (*(void *)(v5 + v3 + 16)) {
          operator delete[]();
        }
        *(_DWORD *)(v5 + v3) = 0;
        bzero((void *)(v5 + v3 + 24), 0x190uLL);
        ++v4;
        v3 += 424;
      }
      while (v4 < *(unsigned int *)(a1 + 476));
      if (*v2) {
LABEL_15:
      }
        operator delete[]();
      if (*(void *)(a1 + 48)) {
        operator delete[]();
      }
      *BOOL v2 = 0;
      *(void *)(a1 + 48) = 0;
    }
  }
  else
  {
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "InitDeviceConfigsCache";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s - cache is already invalid - exiting\n", (uint8_t *)&v7, 0xCu);
    }
  }
  return 0;
}

uint64_t sub_10000C68C(unsigned int *a1)
{
  *(void *)outputStructCnt = 24;
  mach_port_t v2 = a1[38];
  if (v2)
  {
    uint64_t v3 = IOConnectCallStructMethod(v2, 0xFu, 0, 0, outputStruct, (size_t *)outputStructCnt);
    if (!v3)
    {
      BOOL v21 = (v25 | v26) != 0;
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        unint64_t v4 = (const char *)&unk_10001DA5B;
        if (v26) {
          uint64_t v5 = (const char *)&unk_10001DA5B;
        }
        else {
          uint64_t v5 = "n't";
        }
        if (!v25) {
          unint64_t v4 = "n't";
        }
        *(_DWORD *)outputStructCnt = 136315394;
        *(void *)&outputStructCnt[4] = v5;
        *(_WORD *)&outputStructCnt[12] = 2080;
        *(void *)&outputStructCnt[14] = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "This is%s an internal build, and FDR was%s validated\n", outputStructCnt, 0x16u);
      }
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v3 = 0;
      uint64_t v9 = 274;
      BOOL v10 = sub_100007EC0();
      while (1)
      {
        uint64_t v11 = *((void *)a1 + 14) + v6;
        if (*(_DWORD *)(v11 + 8) && *(_DWORD *)(v11 + 16) == 1718186595)
        {
          if (*((unsigned char *)a1 + 4) && v7 < *a1 && *(unsigned char *)(*((void *)a1 + 5) + v9) && v10)
          {
            if (v21) {
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v12 = (xpc_connection_t *)*((void *)a1 + 12);
            if (v12)
            {
              *(_DWORD *)outputStructCnt = 5;
              if (!sub_100009EA0(v12, (xpc_object_t *)outputStructCnt))
              {
                if (outputStructCnt[8])
                {
                  uint64_t v13 = time(0);
                  uint64_t v14 = mach_continuous_time();
                  if (*(uint64_t *)&outputStructCnt[16] > v13)
                  {
                    double v15 = difftime(*(time_t *)&outputStructCnt[16], v13);
                    mach_timebase_info(&info);
                    LODWORD(v17) = info.numer;
                    LODWORD(v16) = info.denom;
                    uint64_t v8 = v14 + (unint64_t)(v15 * 1000000000.0 * (double)v16 / (double)v17);
                    if (v21)
                    {
LABEL_26:
                      a1[118] |= 1 << v7;
                      bzero(&info, 0xCuLL);
                      LOWORD(info.denom) = 1568;
                      int v23 = v7;
                      uint64_t v3 = sub_10000B600((uint64_t)a1, (uint64_t)&info, 0xCu, 0, 0xFFFFFFFF);
                      mach_port_t v18 = a1[38];
                      if (v18)
                      {
                        *(void *)outputStructCnt = 1;
                        *(void *)&outputStructCnt[8] = v8;
                        *(void *)&outputStructCnt[16] = v10;
                        IOConnectCallScalarMethod(v18, 0x33u, (const uint64_t *)outputStructCnt, 3u, 0, 0);
                      }
                      goto LABEL_30;
                    }
                  }
                }
              }
            }
          }
          mach_port_t v19 = a1[38];
          if (v19)
          {
            *(void *)outputStructCnt = 0;
            *(void *)&outputStructCnt[8] = 0;
            *(void *)&outputStructCnt[16] = v10;
            IOConnectCallScalarMethod(v19, 0x33u, (const uint64_t *)outputStructCnt, 3u, 0, 0);
          }
        }
LABEL_30:
        ++v7;
        v9 += 424;
        v6 += 88;
        if (v7 == 6) {
          return v3;
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 3758097084;
  }
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001A4DC();
  }
  return v3;
}

uint64_t sub_10000CA0C(uint64_t a1, void *outputStruct)
{
  size_t outputStructCnt = 24;
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (v2) {
    return IOConnectCallStructMethod(v2, 0xFu, 0, 0, outputStruct, &outputStructCnt);
  }
  else {
    return 3758097084;
  }
}

uint64_t sub_10000CA5C(uint64_t a1, uint64_t a2, io_registry_entry_t a3)
{
  *(unsigned char *)(a1 + 4) = 0;
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = a2;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 148) = 0;
  *(_DWORD *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 224) = 0;
  uint64_t v5 = (_DWORD *)(a1 + 476);
  *(_OWORD *)(a1 + 476) = 0u;
  *(_OWORD *)(a1 + 492) = 0u;
  *(_OWORD *)(a1 + 508) = 0u;
  *(_DWORD *)(a1 + 524) = 0;
  *(_DWORD *)(a1 + 144) = a3;
  *(void *)(a1 + 56) = 0;
  uint64_t v6 = &byte_100247BE5;
  byte_100247C10 = sub_10000A288(@"LsInterpMode", @"com.apple.coremedia", 1);
  dword_100247C14 = sub_10000A288(@"LsBypassVerify", @"com.apple.coremedia", 0);
  byte_100247C18 = sub_10000A288(@"LsEnableGreenAvg", @"com.apple.coremedia", 0) != 0;
  byte_100247C19 = sub_10000A288(@"RadialGainEnable", @"com.apple.coremedia", 1) != 0;
  byte_100247C1A = sub_10000A288(@"IgnoreUnitInfoPlist", @"com.apple.coremedia", 0) != 0;
  uint64_t v7 = 0;
  dword_100247C1C = sub_10000A288(@"UnitInfoNVMChannelMask", @"com.apple.coremedia", 0xFFFFFFFFLL);
  do
  {
    CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"LsAdjustEnableCam%d", v7);
    *(_DWORD *)(v6 - 5) = sub_10000A288(v8, @"com.apple.coremedia", 0xFFFFFFFFLL);
    CFRelease(v8);
    CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"LsAdjustInvertCam%d", v7);
    *(v6 - 1) = sub_10000A288(v9, @"com.apple.coremedia", 0) != 0;
    CFRelease(v9);
    CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"LsIdealPctCam%d", v7);
    char *v6 = sub_10000A288(v10, @"com.apple.coremedia", 0xFFFFFFFFLL);
    v6 += 8;
    CFRelease(v10);
    ++v7;
  }
  while (v7 != 6);
  CFDataRef v11 = (const __CFData *)IORegistryEntrySearchCFProperty(a3, "IOService", @"sensor-type", kCFAllocatorDefault, 3u);
  if (v11)
  {
    CFDataRef v12 = v11;
    BytePtr = CFDataGetBytePtr(v11);
    if (BytePtr) {
      int v14 = *BytePtr;
    }
    else {
      int v14 = -1;
    }
    *(_DWORD *)(a1 + 104) = v14;
    CFRelease(v12);
    int v15 = *(_DWORD *)(a1 + 104);
  }
  else
  {
    int v15 = -1;
    *(_DWORD *)(a1 + 104) = -1;
  }
  unint64_t v16 = &dword_100024EF8;
  *(void *)(a1 + 112) = &dword_100024EF8;
  int v17 = 42;
  do
  {
    if (*v16 == v15)
    {
      *(void *)(a1 + 112) = v16;
      goto LABEL_17;
    }
    v16 += 146;
    --v17;
  }
  while (v17);
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001A558();
  }
LABEL_17:
  pthread_mutexattr_init(&v21);
  pthread_mutexattr_settype(&v21, 2);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 160), &v21);
  pthread_mutexattr_destroy(&v21);
  sub_10000CDF4(a1);
  sub_10000C440(a1);
  for (uint64_t i = 0; i != 96; i += 16)
  {
    uint64_t v19 = a1 + i;
    *(unsigned char *)(v19 + 240) = 0;
    *(unsigned char *)(v19 + 336) = 0;
  }
  *(unsigned char *)(a1 + 432) = 0;
  *(unsigned char *)(a1 + 448) = 0;
  *(unsigned char *)(a1 + 464) = 0;
  *(_DWORD *)(a1 + 472) = 0;
  if ((sub_10000B5A8(a1) & 1) != 0 && !sub_10000B310(a1, v5)) {
    sub_10000B78C();
  }
  return a1;
}

uint64_t sub_10000CDF4(uint64_t refCon)
{
  if (!*(_DWORD *)(refCon + 148)) {
    return IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(void *)(refCon + 72) + 16), *(_DWORD *)(refCon + 144), "IOGeneralInterest", (IOServiceInterestCallback)sub_100013C80, (void *)refCon, (io_object_t *)(refCon + 148));
  }
  return refCon;
}

uint64_t sub_10000CE34(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 152)) {
    sub_10000D0C4(a1);
  }
  io_object_t v2 = *(_DWORD *)(a1 + 148);
  if (v2)
  {
    IOObjectRelease(v2);
    *(_DWORD *)(a1 + 148) = 0;
  }
  sub_10000C440(a1);
  uint64_t v3 = 0;
  unint64_t v4 = (unsigned __int8 *)(a1 + 240);
  uint64_t v5 = (unsigned __int8 *)(a1 + 240);
  do
  {
    int v6 = *v5;
    v5 += 16;
    if (v6)
    {
      uint64_t v7 = *(NSObject **)(*(void *)(a1 + 72) + 72);
      if (v7)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_10000D174;
        block[3] = &unk_100024C98;
        block[4] = a1;
        int v20 = v3;
        dispatch_sync(v7, block);
      }
    }
    if (v4[96])
    {
      CFStringRef v8 = *(NSObject **)(*(void *)(a1 + 72) + 72);
      if (v8)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 0x40000000;
        v17[2] = sub_10000D1B8;
        v17[3] = &unk_100024CB8;
        v17[4] = a1;
        int v18 = v3;
        dispatch_sync(v8, v17);
      }
    }
    ++v3;
    unint64_t v4 = v5;
  }
  while (v3 != 6);
  if (*(unsigned char *)(a1 + 432))
  {
    CFStringRef v9 = *(NSObject **)(*(void *)(a1 + 72) + 72);
    if (v9)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 0x40000000;
      v16[2] = sub_10000D1FC;
      v16[3] = &unk_100024CD8;
      v16[4] = a1;
      dispatch_sync(v9, v16);
    }
  }
  if (*(unsigned char *)(a1 + 448))
  {
    CFStringRef v10 = *(NSObject **)(*(void *)(a1 + 72) + 72);
    if (v10)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 0x40000000;
      v15[2] = sub_10000D228;
      v15[3] = &unk_100024CF8;
      unsigned char v15[4] = a1;
      dispatch_sync(v10, v15);
    }
  }
  if (*(unsigned char *)(a1 + 464))
  {
    CFDataRef v11 = *(NSObject **)(*(void *)(a1 + 72) + 72);
    if (v11)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 0x40000000;
      v14[2] = sub_10000D254;
      v14[3] = &unk_100024D18;
      v14[4] = a1;
      dispatch_sync(v11, v14);
    }
  }
  CFDataRef v12 = *(const void **)(a1 + 88);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(a1 + 88) = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 160));
  return a1;
}

uint64_t sub_10000D0C4(uint64_t a1)
{
  io_object_t v2 = (pthread_mutex_t *)(a1 + 160);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 160));
  uint64_t v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 152), 4u, 0, 0, 0, 0);
  io_connect_t v4 = *(_DWORD *)(a1 + 152);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 152) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
  }
  else
  {
    uint64_t v3 = 3758097101;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t sub_10000D144(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 148);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 148) = 0;
  }
  return result;
}

uint64_t sub_10000D174(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 232;
  uint64_t result = notify_cancel(*(_DWORD *)(v2 + 16 * *(unsigned int *)(a1 + 40) + 12));
  *(unsigned char *)(v2 + 16 * *(unsigned int *)(a1 + 40) + 8) = 0;
  return result;
}

uint64_t sub_10000D1B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 328;
  uint64_t result = notify_cancel(*(_DWORD *)(v2 + 16 * *(unsigned int *)(a1 + 40) + 12));
  *(unsigned char *)(v2 + 16 * *(unsigned int *)(a1 + 40) + 8) = 0;
  return result;
}

uint64_t sub_10000D1FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v1 + 436));
  *(unsigned char *)(v1 + 432) = 0;
  return result;
}

uint64_t sub_10000D228(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v1 + 452));
  *(unsigned char *)(v1 + 448) = 0;
  return result;
}

uint64_t sub_10000D254(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v1 + 468));
  *(unsigned char *)(v1 + 464) = 0;
  return result;
}

uint64_t sub_10000D284()
{
  kern_return_t v2;
  mach_port_t v3;
  _DWORD *v4;
  uint64_t v5;
  unint64_t v6;
  unsigned char *v7;
  uint64_t v8;
  int v9;
  const char *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  FILE *v22;
  const char *v23;
  char *v24;
  char *v25;
  int v26;
  char *v27;
  int v28;
  char *v29;
  int v30;
  char *v31;
  int v32;
  char *v33;
  int v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  BOOL v38;
  int v39;
  int v40;
  unsigned int v42;
  int v43[2];
  char v44;
  char v45[15];
  char v46;
  char v47[15];
  char v48;
  char v49[15];
  char v50;
  char v51[15];
  char v52;
  char v53[7];
  void v54[5];
  void v55[5];
  void v56[5];
  void v57[5];
  int v58;
  void block[5];
  int v60;
  char v61;
  char v62[63];
  _OWORD __dst[510];
  uint64_t v64;
  uint8_t v65[4];
  int v66[65];
  _WORD v67[4238];
  char v68[8476];
  unsigned char v69[12];
  __int16 v70;
  unsigned int v71;
  uint8_t v72[4];
  int v73;
  char v74;

  uint64_t v0 = __chkstk_darwin();
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v69 = 136315138;
    *(void *)&v69[4] = "ISP_PowerOnCamera";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s - powering on camera\n", v69, 0xCu);
  }
  kdebug_trace();
  uint64_t v1 = 3758097084;
  if (*(_DWORD *)(v0 + 152))
  {
    if ((sub_10000B5A8(v0) & 1) == 0 && *(unsigned char *)(v0 + 4)) {
      sub_10000C440(v0);
    }
    uint64_t v2 = IOConnectCallScalarMethod(*(_DWORD *)(v0 + 152), 0xBu, 0, 0, 0, 0);
    if (!v2)
    {
      uint64_t v3 = *(_DWORD *)(v0 + 152);
      if (!v3) {
        return v1;
      }
      *(void *)v69 = 63;
      uint64_t v1 = IOConnectCallScalarMethod(v3, 0x3Au, (const uint64_t *)v69, 1u, 0, 0);
      if (v1) {
        return v1;
      }
      io_connect_t v4 = (_DWORD *)(v0 + 476);
      if (*(_DWORD *)(v0 + 476)) {
        goto LABEL_19;
      }
      if (sub_10000B310(v0, (_DWORD *)(v0 + 476)))
      {
        if (off_100247BA8 == &_os_log_default) {
          off_100247BA8 = os_log_create("com.apple.isp", "device");
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10001A828();
        }
      }
      if (*v4)
      {
LABEL_19:
        uint64_t v5 = 0;
        do
        {
          bzero(v72, 0x9CuLL);
          *(void *)v43 = v5;
          sub_10000B6F8(v0, v5, v72);
          bzero(v69, 0x211CuLL);
          sub_10000F61C(v0, v5, 0, v69);
          bzero(v68, 0x211CuLL);
          sub_10000F61C(v0, v5, 1u, v68);
          bzero(v67, 0x211CuLL);
          sub_10000F61C(v0, v5, 2u, v67);
          if ((_BYTE)v73 && !v74) {
            operator new();
          }
          ++v5;
        }
        while (*(void *)v43 + 1 < (unint64_t)*v4);
      }
      if (!*(unsigned char *)(v0 + 4)) {
        sub_10000B78C();
      }
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = -536870212;
  }
  id v42 = v2;
  if (*(_DWORD *)(v0 + 476))
  {
    int v6 = 0;
    uint64_t v7 = (unsigned char *)(v0 + 336);
    CFStringRef v8 = 16;
    do
    {
      CFStringRef v9 = *(_DWORD *)(*(void *)(v0 + 112) + v8);
      if (v9 > 1919246705)
      {
        switch(v9)
        {
          case 1919246706:
            CFDataRef v11 = "com.apple.isp.backcamerapower";
            CFDataRef v12 = "com.apple.isp.backcamerasensorconfig";
            goto LABEL_44;
          case 1919251319:
            CFDataRef v11 = "com.apple.isp.backsuperwidecamerapower";
            CFDataRef v12 = "com.apple.isp.backsuperwidesensorconfig";
LABEL_44:
            *((void *)v7 - 13) = v11;
            *((void *)v7 - 1) = v12;
            if (!*(v7 - 96))
            {
              uint64_t v13 = *(NSObject **)(*(void *)(v0 + 72) + 72);
              if (v13)
              {
                block[0] = _NSConcreteStackBlock;
                block[1] = 0x40000000;
                block[2] = sub_10000F6C4;
                block[3] = &unk_100024D38;
                block[4] = v0;
                v60 = v6;
                dispatch_sync(v13, block);
                CFDataRef v12 = (const char *)*((void *)v7 - 1);
              }
            }
            if (v12)
            {
              if (!*v7)
              {
                int v14 = *(NSObject **)(*(void *)(v0 + 72) + 72);
                if (v14)
                {
                  v57[0] = _NSConcreteStackBlock;
                  v57[1] = 0x40000000;
                  v57[2] = sub_10000F710;
                  v57[3] = &unk_100024D58;
                  v57[4] = v0;
                  v58 = v6;
                  dispatch_sync(v14, v57);
                }
              }
            }
            goto LABEL_51;
          case 1919251564:
            CFDataRef v11 = "com.apple.isp.backtelecamerapower";
            CFDataRef v12 = "com.apple.isp.backtelecamerasensorconfig";
            goto LABEL_44;
        }
      }
      else
      {
        if (v9 == 1718186595)
        {
          CFDataRef v12 = 0;
          CFDataRef v11 = "com.apple.isp.frontirsensorpower";
          goto LABEL_44;
        }
        if (v9 == 1718775412 || v9 == 1718776695)
        {
          CFDataRef v11 = "com.apple.isp.frontcamerapower";
          CFDataRef v12 = "com.apple.isp.frontcamerasensorconfig";
          goto LABEL_44;
        }
      }
      *((void *)v7 - 13) = 0;
      *((void *)v7 - 1) = 0;
LABEL_51:
      ++v6;
      v7 += 16;
      v8 += 88;
    }
    while (v6 < *(unsigned int *)(v0 + 476));
  }
  if (!*(unsigned char *)(v0 + 432))
  {
    *(void *)(v0 + 424) = "com.apple.isp.cameratorch";
    int v15 = *(NSObject **)(*(void *)(v0 + 72) + 72);
    if (v15)
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 0x40000000;
      v56[2] = sub_10000F75C;
      v56[3] = &unk_100024D78;
      v56[4] = v0;
      dispatch_sync(v15, v56);
    }
  }
  if (!*(unsigned char *)(v0 + 448))
  {
    *(void *)(v0 + 440) = "com.apple.isp.cameratorchcoolcurrent";
    unint64_t v16 = *(NSObject **)(*(void *)(v0 + 72) + 72);
    if (v16)
    {
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 0x40000000;
      v55[2] = sub_10000F794;
      v55[3] = &unk_100024D98;
      v55[4] = v0;
      dispatch_sync(v16, v55);
    }
  }
  if (!*(unsigned char *)(v0 + 464))
  {
    *(void *)(v0 + 456) = "com.apple.isp.cameratorchwarmcurrent";
    int v17 = *(NSObject **)(*(void *)(v0 + 72) + 72);
    if (v17)
    {
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 0x40000000;
      v54[2] = sub_10000F7CC;
      v54[3] = &unk_100024DB8;
      v54[4] = v0;
      dispatch_sync(v17, v54);
    }
  }
  int v18 = sub_10000B5A8(v0);
  uint64_t v19 = v42;
  if (v18 && *(unsigned char *)(v0 + 4) && !v42)
  {
    if (*(_DWORD *)(v0 + 476))
    {
      int v20 = 0;
      pthread_mutexattr_t v21 = 0;
      do
      {
        sprintf(v68, "/usr/local/share/firmware/isp/cam%dclocks.txt", v20);
        __int16 v22 = fopen(v68, "r");
        if (v22)
        {
          if (off_100247BA8 == &_os_log_default) {
            off_100247BA8 = os_log_create("com.apple.isp", "device");
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(__dst[0]) = 67109120;
            DWORD1(__dst[0]) = v20;
            int v23 = "Found camera clock override information file for camera channel %d\n";
LABEL_71:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)__dst, 8u);
          }
          while (fgets(v69, 256, v22))
          {
            unint64_t v24 = strtok(v69, "=");
            if (v24)
            {
              unsigned __int8 v25 = v24;
              if (!strncmp(v24, "clockdiv", 8uLL))
              {
                int v29 = strtok(0, " \n");
                if (v29)
                {
                  __int16 v30 = strtoul(v29, 0, 0);
                  if (off_100247BA8 == &_os_log_default) {
                    off_100247BA8 = os_log_create("com.apple.isp", "device");
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(__dst[0]) = 67109120;
                    DWORD1(__dst[0]) = v30;
                    int v23 = "Set clock divider reg to 0x%08X\n";
                    goto LABEL_71;
                  }
                }
                else
                {
                  if (off_100247BA8 == &_os_log_default) {
                    off_100247BA8 = os_log_create("com.apple.isp", "device");
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_10001A61C(&v52, v53);
                  }
                }
              }
              else if (!strncmp(v25, "property", 8uLL))
              {
                int v31 = strtok(0, " :");
                if (v31)
                {
                  CFNumberRef v32 = strtoul(v31, 0, 0);
                  CFDictionaryRef v33 = strtok(0, " \n");
                  if (v33)
                  {
                    io_service_t v34 = strtoul(v33, 0, 0);
                    if (off_100247BA8 == &_os_log_default) {
                      off_100247BA8 = os_log_create("com.apple.isp", "device");
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                    {
                      LODWORD(__dst[0]) = 67109376;
                      DWORD1(__dst[0]) = v32;
                      WORD4(__dst[0]) = 1024;
                      *(_DWORD *)((char *)__dst + 10) = v34;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Setting FW property 0x%08x to 0x%08X\n", (uint8_t *)__dst, 0xEu);
                    }
                    CFDataRef v35 = sub_10000BF8C(v0, v20, v32, v34, 0xFFFFFFFF);
                    if (v35)
                    {
                      if (off_100247BA8 == &_os_log_default) {
                        off_100247BA8 = os_log_create("com.apple.isp", "device");
                      }
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_10001A650(v65, v35, v66);
                      }
                    }
                  }
                  else
                  {
                    if (off_100247BA8 == &_os_log_default) {
                      off_100247BA8 = os_log_create("com.apple.isp", "device");
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_10001A61C(&v48, v49);
                    }
                  }
                }
                else
                {
                  if (off_100247BA8 == &_os_log_default) {
                    off_100247BA8 = os_log_create("com.apple.isp", "device");
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_10001A61C(&v50, v51);
                  }
                }
              }
              else if (!strncmp(v25, "FWOBJECTSPECIALFUNC", 0x13uLL))
              {
                CFDataRef v36 = 0;
                memset(__dst, 0, 48);
                do
                {
                  uint64_t v37 = v36;
                  *((void *)__dst + v36) = v25;
                  unsigned __int8 v25 = strtok(0, ":");
                  CFDataRef v36 = v37 + 1;
                  if (v25) {
                    char v38 = v37 >= 5;
                  }
                  else {
                    char v38 = 1;
                  }
                }
                while (!v38);
                v39 = sub_10000C164(v0, v36, (const char **)__dst);
                if (v39) {
                  printf("Sending special debug function to firmware object returned error : 0x%08x\n", v39);
                }
              }
              else
              {
                unsigned __int8 v26 = strtoul(v25, 0, 0);
                unint64_t v27 = strtok(0, " \n");
                if (v27)
                {
                  if (v21 > 0x3F)
                  {
                    if (off_100247BA8 == &_os_log_default) {
                      off_100247BA8 = os_log_create("com.apple.isp", "device");
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_10001A694(&v44, v45);
                    }
                  }
                  else
                  {
                    int v28 = strtoul(v27, 0, 0);
                    if (off_100247BA8 == &_os_log_default) {
                      off_100247BA8 = os_log_create("com.apple.isp", "device");
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                    {
                      LODWORD(__dst[0]) = 67109376;
                      DWORD1(__dst[0]) = v26;
                      WORD4(__dst[0]) = 1024;
                      *(_DWORD *)((char *)__dst + 10) = v28;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Set sensor reg 0x%08x to val 0x%08X\n", (uint8_t *)__dst, 0xEu);
                    }
                    v67[v21] = v26;
                    *((unsigned char *)v65 + v21++ + 0x2000) = v28;
                  }
                }
                else
                {
                  if (off_100247BA8 == &_os_log_default) {
                    off_100247BA8 = os_log_create("com.apple.isp", "device");
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_10001A61C(&v46, v47);
                  }
                }
              }
            }
            else
            {
              if (off_100247BA8 == &_os_log_default) {
                off_100247BA8 = os_log_create("com.apple.isp", "device");
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10001A61C(&v61, v62);
              }
            }
          }
          fclose(v22);
          if (v21)
          {
            v40 = sub_10000C340(v0, v20, v21, (uint64_t)v67, (uint64_t)&v64);
            if (v40)
            {
              if (off_100247BA8 == &_os_log_default) {
                off_100247BA8 = os_log_create("com.apple.isp", "device");
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10001A5D8(v72, v40, &v73);
              }
            }
            else
            {
              if (off_100247BA8 == &_os_log_default) {
                off_100247BA8 = os_log_create("com.apple.isp", "device");
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(__dst[0]) = 67109376;
                DWORD1(__dst[0]) = v20;
                WORD4(__dst[0]) = 1024;
                *(_DWORD *)((char *)__dst + 10) = v21;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully sent camera %d sensor register over-ride values for %d registers\n", (uint8_t *)__dst, 0xEu);
              }
            }
          }
        }
        ++v20;
      }
      while (v20 < *(_DWORD *)(v0 + 476));
    }
    uint64_t v19 = v42;
  }
  if (!v19) {
    sub_10000C68C((unsigned int *)v0);
  }
  kdebug_trace();
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  uint64_t v1 = v42;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v69 = 136315394;
    *(void *)&v69[4] = "ISP_PowerOnCamera";
    v70 = 1024;
    v71 = v42;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s - status: 0x%08X\n", v69, 0x12u);
  }
  return v1;
}

void sub_10000F5F0()
{
}

uint64_t sub_10000F61C(uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct)
{
  uint64_t result = 3758097084;
  if (!outputStruct) {
    return 3758097090;
  }
  mach_port_t v6 = *(_DWORD *)(a1 + 152);
  if (v6)
  {
    size_t v7 = 8476;
    input[0] = a2;
    input[1] = a3;
    return IOConnectCallMethod(v6, 0x5Fu, input, 2u, 0, 0, 0, 0, outputStruct, &v7);
  }
  return result;
}

uint64_t sub_10000F6C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 232;
  uint64_t v3 = v2 + 16 * *(unsigned int *)(a1 + 40);
  uint64_t result = notify_register_check(*(const char **)v3, (int *)(v3 + 12));
  *(unsigned char *)(v2 + 16 * *(unsigned int *)(a1 + 40) + 8) = result == 0;
  return result;
}

uint64_t sub_10000F710(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 328;
  uint64_t v3 = v2 + 16 * *(unsigned int *)(a1 + 40);
  uint64_t result = notify_register_check(*(const char **)v3, (int *)(v3 + 12));
  *(unsigned char *)(v2 + 16 * *(unsigned int *)(a1 + 40) + 8) = result == 0;
  return result;
}

uint64_t sub_10000F75C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check(*(const char **)(v1 + 424), (int *)(v1 + 436));
  *(unsigned char *)(v1 + 432) = result == 0;
  return result;
}

uint64_t sub_10000F794(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check(*(const char **)(v1 + 440), (int *)(v1 + 452));
  *(unsigned char *)(v1 + 448) = result == 0;
  return result;
}

uint64_t sub_10000F7CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check(*(const char **)(v1 + 456), (int *)(v1 + 468));
  *(unsigned char *)(v1 + 464) = result == 0;
  return result;
}

uint64_t sub_10000F804(uint64_t a1)
{
  int v2 = -10;
  do
  {
    if (!sub_10000B5A8(a1)) {
      break;
    }
    usleep(0x186A0u);
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFDataRef v12 = "ISP_ColdBootPowerCycle";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - Camera powered on...waiting\n", buf, 0xCu);
    }
    usleep(0x493E0u);
  }
  while (!__CFADD__(v2++, 1));
  uint64_t v4 = sub_10000FADC(a1);
  if (v4)
  {
    uint64_t v5 = v4;
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A920();
    }
  }
  else
  {
    mach_port_t v6 = (void *)os_transaction_create();
    uint64_t v5 = sub_10000FB38(a1);
    os_release(v6);
    if (v5)
    {
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10001A8A4();
      }
    }
    else
    {
      uint64_t v7 = sub_10000D284();
      if (v7)
      {
        uint64_t v5 = v7;
        int v8 = 0;
        BOOL v9 = 0;
      }
      else if (sub_10000B5A8(a1))
      {
        uint64_t v5 = sub_100010134(a1);
        BOOL v9 = v5 == 0;
        int v8 = 1;
      }
      else
      {
        int v8 = 0;
        BOOL v9 = 0;
        uint64_t v5 = 0;
      }
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        CFDataRef v12 = "ISP_ColdBootPowerCycle";
        __int16 v13 = 1024;
        int v14 = v8;
        __int16 v15 = 1024;
        BOOL v16 = v9;
        __int16 v17 = 1024;
        int v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - poweredOn=%d, poweredOff=%d, res=0x%08X\n", buf, 0x1Eu);
      }
    }
  }
  return v5;
}

uint64_t sub_10000FADC(uint64_t a1)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t result = IOConnectCallScalarMethod(v2, 9u, 0, 0, 0, 0);
  if (!result)
  {
    sub_10000C440(a1);
    return 0;
  }
  return result;
}

uint64_t sub_10000FB38(uint64_t a1)
{
  uint64_t v2 = sub_100010570(a1);
  if (!v2)
  {
    CFDictionaryRef theDict = 0;
    sub_10000B37C(v2, &theDict);
    sub_10001026C(a1);
    sub_10000A588(a1);
    sub_10000AD2C(a1);
    sub_10000A94C(a1);
    sub_100010840(a1, "/System/Library/PrivateFrameworks/AppleCVHWA.framework/Firmware/lacc_VIO_ISP_IR.bin", 0, 0, 0, 8u, 0, 0);
    strcpy((char *)input, "/System/Library/PrivateFrameworks/AppleCVHWA.framework/Firmware/");
    *(void *)buf = 0;
    io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/arm-io");
    if (v7)
    {
      CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v7, @"soc-generation", 0, 0);
      CFDataRef v9 = CFProperty;
      if (CFProperty)
      {
        CFTypeID v10 = CFGetTypeID(CFProperty);
        if (v10 == CFDataGetTypeID())
        {
          CFIndex Length = CFDataGetLength(v9);
          if ((unint64_t)(Length - 8) > 0xFFFFFFFFFFFFFFF8)
          {
            size_t v28 = Length;
            BytePtr = (const char *)CFDataGetBytePtr(v9);
            strncpy((char *)buf, BytePtr, v28);
          }
          else
          {
            if (off_100247BA8 == &_os_log_default) {
              off_100247BA8 = os_log_create("com.apple.isp", "device");
            }
            BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v12) {
              sub_10001AA18(v12, v13, v14, v15, v16, v17, v18, v19);
            }
          }
          goto LABEL_22;
        }
      }
    }
    else
    {
      CFDataRef v9 = 0;
    }
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_10001A99C(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    if (!v9) {
LABEL_23:
    }
      operator new[]();
LABEL_22:
    CFRelease(v9);
    goto LABEL_23;
  }
  uint64_t v3 = v2;
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001AA94(v3, v4, v5);
  }
  return v3;
}

uint64_t sub_100010134(uint64_t a1)
{
  kdebug_trace();
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (v2) {
    uint64_t v3 = IOConnectCallScalarMethod(v2, 0xCu, 0, 0, 0, 0);
  }
  else {
    uint64_t v3 = 3758097084;
  }
  kdebug_trace();
  return v3;
}

uint64_t sub_1000101C4(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  mach_port_t v4 = *(_DWORD *)(a1 + 152);
  if (!v4) {
    return 3758097084;
  }
  input[0] = (uint64_t)a2;
  if (*a2)
  {
    uint64_t v5 = 0;
    do
      uint64_t v6 = v5 + 1;
    while (a2[++v5]);
  }
  else
  {
    uint64_t v6 = 0;
  }
  input[1] = v6;
  uint64_t input[2] = a3;
  input[3] = a4;
  return IOConnectCallScalarMethod(v4, 0x65u, input, 4u, 0, 0);
}

uint64_t sub_10001026C(uint64_t a1)
{
  uint64_t v1 = 3758097136;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  int v23 = 0;
  uint64_t v22 = 0;
  if (*(_DWORD *)(a1 + 152))
  {
    if (MGIsQuestionValid())
    {
      uint64_t v3 = (const void *)MGCopyAnswerWithError();
      if (v3)
      {
        mach_port_t v4 = v3;
        CFStringRef v5 = CFCopyDescription(v3);
        if (v5)
        {
          CFStringRef v6 = v5;
          if (off_100247BA8 == &_os_log_default) {
            off_100247BA8 = os_log_create("com.apple.isp", "device");
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v19 = "ISP_SetFrontCameraOffsetFromDisplayCenter";
            __int16 v20 = 2080;
            CStringPtr = CFStringGetCStringPtr(v6, 0x8000100u);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - kMGQFrontCameraOffsetFromDisplayCenter Description=%s\n", buf, 0x16u);
          }
          CFRelease(v6);
        }
        CFTypeID v7 = CFGetTypeID(v4);
        if (v7 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v4) == 3)
        {
          CFIndex v8 = 0;
          CFDataRef v9 = &v22;
          while (1)
          {
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v4, v8);
            if (!ValueAtIndex) {
              break;
            }
            CFNumberRef v11 = ValueAtIndex;
            CFTypeID v12 = CFGetTypeID(ValueAtIndex);
            if (v12 != CFNumberGetTypeID() || !CFNumberIsFloatType(v11)) {
              goto LABEL_26;
            }
            int Value = CFNumberGetValue(v11, kCFNumberFloatType, v9);
            if (Value)
            {
              CFDataRef v9 = (uint64_t *)((char *)v9 + 4);
              if (v8++ != 2) {
                continue;
              }
            }
            if (Value) {
              uint64_t v1 = 0;
            }
            else {
              uint64_t v1 = 3758097102;
            }
            if (Value)
            {
              uint64_t v16 = v22;
              LODWORD(v17) = v23;
              uint64_t v1 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 152), 0x56u, &v16, 0xCuLL, 0, 0);
              goto LABEL_36;
            }
            break;
          }
        }
        else
        {
LABEL_26:
          uint64_t v1 = 3758096385;
        }
      }
      else
      {
        if (off_100247BA8 == &_os_log_default) {
          off_100247BA8 = os_log_create("com.apple.isp", "device");
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10001AB88();
        }
        mach_port_t v4 = 0;
      }
    }
    else
    {
      mach_port_t v4 = 0;
      uint64_t v1 = 3758097095;
    }
  }
  else
  {
    mach_port_t v4 = 0;
    uint64_t v1 = 3758097087;
  }
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10001AB0C();
    if (!v4) {
      return v1;
    }
    goto LABEL_36;
  }
  if (v4) {
LABEL_36:
  }
    CFRelease(v4);
  return v1;
}

uint64_t sub_100010570(uint64_t a1)
{
  outputStructCnt[0] = 24;
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2 || (IOConnectCallStructMethod(v2, 0xFu, 0, 0, outputStruct, outputStructCnt), !outputStruct[20]))
  {
    uint64_t v3 = fopen("/usr/local/share/firmware/isp/isp_fw.bin", "rb");
    mach_port_t v4 = fopen(0, "rb");
    if (v4)
    {
      CFStringRef v5 = v4;
      if (v3) {
        fclose(v3);
      }
    }
    else
    {
      CFStringRef v5 = v3;
    }
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      sub_10001AC80(v6, v7, v8, v9, v10, v11, v12, v13);
      if (v5)
      {
LABEL_12:
        if (off_100247BA8 == &_os_log_default) {
          off_100247BA8 = os_log_create("com.apple.isp", "device");
        }
        BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v14) {
          sub_10001AC44(v14, v15, v16, v17, v18, v19, v20, v21);
        }
        fseeko(v5, 0, 2);
        ftello(v5);
        fseeko(v5, 0, 0);
        operator new[]();
      }
    }
    else if (v5)
    {
      goto LABEL_12;
    }
    perror("error loading ISPCPU firmware ");
  }
  outputStructCnt[0] = 0;
  outputStructCnt[1] = 0;
  outputStructCnt[2] = *(unsigned int *)(a1 + 104);
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 152), 7u, outputStructCnt, 3u, 0, 0);
}

uint64_t sub_100010840(uint64_t a1, char *__filename, char *a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, int a8)
{
  if (a8) {
    unsigned int v11 = a7 | 0x80000000;
  }
  else {
    unsigned int v11 = a7;
  }
  if (a3)
  {
    uint64_t v12 = fopen(a3, "rb");
    if (v12)
    {
      uint64_t v13 = v12;
      goto LABEL_9;
    }
  }
  BOOL v14 = fopen(__filename, "rb");
  if (v14)
  {
    uint64_t v13 = v14;
LABEL_9:
    fseeko(v13, 0, 2);
    ftello(v13);
    rewind(v13);
    operator new[]();
  }
  if (a4) {
    operator new[]();
  }
  uint64_t v15 = sub_100012AE8(a1, v11, 0, 0, a6);
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v21 = "SendDataFileToFirmware";
    __int16 v22 = 1024;
    unsigned int v23 = a6;
    __int16 v24 = 1024;
    int v25 = 0;
    __int16 v26 = 1024;
    *(_DWORD *)uint64_t v27 = 0;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = a8;
    *(_WORD *)size_t v28 = 1024;
    *(_DWORD *)&v28[2] = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - type=0x%X, isOverride=%d, size=%u, isEarlyBoot=%d, status=%08x\n", buf, 0x2Au);
  }
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    uint64_t v21 = "SendDataFileToFirmware";
    __int16 v22 = 1024;
    unsigned int v23 = a6;
    __int16 v24 = 1024;
    int v25 = 0;
    __int16 v26 = 2080;
    *(void *)uint64_t v27 = __filename;
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)size_t v28 = 0;
    *(_WORD *)&void v28[4] = 1024;
    int v29 = a8;
    __int16 v30 = 1024;
    int v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - type=0x%X, isOverride=%d, file=%s, size=%u, isEarlyBoot=%d, status=%08x\n", buf, 0x34u);
  }
  return v15;
}

void sub_100010BD8(uint64_t a1)
{
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  CFTypeRef v4 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"BackCameraModuleSerialNumString", kCFAllocatorDefault, 3u);
  if (v4)
  {
    CFStringRef v5 = v4;
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "backCameraModuleSerialNumString exists - load FDR CmCl calibration data\n\n", buf, 2u);
    }
    CFRelease(v5);
    BOOL v6 = fopen("/usr/local/share/firmware/isp/CmCl-Override.DAT", "rb");
    if (v6)
    {
      uint64_t v7 = v6;
      fseeko(v6, 0, 2);
      ftello(v7);
      fseeko(v7, 0, 0);
      operator new[]();
    }
    CFStringRef v16 = CFStringCreateWithCString(kCFAllocatorDefault, "CmCl", 0x8000100u);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, @"CopyAllowUnsealed", kCFBooleanTrue);
    AMFDRLogSetHandler();
    uint64_t v18 = AMFDRSealingMapCopyLocalDataForClass();
    if (v18)
    {
      CFDataRef v19 = (const __CFData *)v18;
      int v20 = -1431699456;
    }
    else
    {
      uint64_t v27 = *(void *)(a1 + 112);
      if (!v27 || !*(unsigned char *)(v27 + 575) || (uint64_t v28 = AMFDRSealingManifestCopyLocalDataForClass()) == 0)
      {
        sub_100012AE8(a1, 0x80000000, 0, 0, 0xCCCC0300);
LABEL_26:
        if (v16) {
          CFRelease(v16);
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        return;
      }
      CFDataRef v19 = (const __CFData *)v28;
      int v20 = -1145372672;
    }
    BytePtr = CFDataGetBytePtr(v19);
    unsigned int Length = CFDataGetLength(v19);
    int v23 = sub_100012AE8(a1, 0x80000000, (uint64_t)BytePtr, Length, v20 | 0x300u);
    CFStringRef v24 = CFCopyDescription(v19);
    if (v24)
    {
      CFStringRef v25 = v24;
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        CStringPtr = CFStringGetCStringPtr(v25, 0);
        *(_DWORD *)buf = 136315650;
        __int16 v30 = "LoadFDRCalDataFile";
        __int16 v31 = 1024;
        int v32 = v23;
        __int16 v33 = 2080;
        io_service_t v34 = CStringPtr;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - Status = %#08x; CmCl data - %s\n",
          buf,
          0x1Cu);
      }
      CFRelease(v25);
    }
    CFRelease(v19);
    goto LABEL_26;
  }
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v8) {
    sub_10001ACFC(v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

void sub_100011128(uint64_t a1)
{
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  CFTypeRef v4 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"FrontCameraModuleSerialNumString", kCFAllocatorDefault, 3u);
  if (v4)
  {
    CFStringRef v5 = v4;
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FrontCameraModuleSerialNumString exists - load FDR FCCl calibration data\n\n", buf, 2u);
    }
    CFRelease(v5);
    IOObjectRelease(MatchingService);
    uint64_t v6 = 0;
    uint64_t v7 = (_DWORD *)(*(void *)(a1 + 112) + 16);
    while (!*(v7 - 2) || *v7 != 1718775412 && *v7 != 1718776695)
    {
      v7 += 22;
      if (++v6 == 6)
      {
        LODWORD(v6) = 0;
        break;
      }
    }
    BOOL v8 = fopen("/usr/local/share/firmware/isp/FCCl-Override.DAT", "rb");
    if (v8)
    {
      uint64_t v9 = v8;
      fseeko(v8, 0, 2);
      ftello(v9);
      fseeko(v9, 0, 0);
      operator new[]();
    }
    CFStringRef v18 = CFStringCreateWithCString(kCFAllocatorDefault, "FCCl", 0x8000100u);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, @"CopyAllowUnsealed", kCFBooleanTrue);
    AMFDRLogSetHandler();
    uint64_t v20 = AMFDRSealingMapCopyLocalDataForClass();
    if (v20)
    {
      CFDataRef v21 = (const __CFData *)v20;
      int v22 = -1431699456;
    }
    else
    {
      uint64_t v28 = *(void *)(a1 + 112);
      if (!v28 || !*(unsigned char *)(v28 + 575) || (uint64_t v29 = AMFDRSealingManifestCopyLocalDataForClass()) == 0)
      {
        sub_100012AE8(a1, v6 | 0x80000000, 0, 0, 0xCCCC0300);
LABEL_31:
        if (v18) {
          CFRelease(v18);
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
        return;
      }
      CFDataRef v21 = (const __CFData *)v29;
      int v22 = -1145372672;
    }
    BytePtr = CFDataGetBytePtr(v21);
    unsigned int Length = CFDataGetLength(v21);
    int v25 = sub_100012AE8(a1, v6 | 0x80000000, (uint64_t)BytePtr, Length, v22 | 0x300u);
    CFStringRef v26 = CFCopyDescription(v21);
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      CStringPtr = CFStringGetCStringPtr(v26, 0);
      *(_DWORD *)buf = 136315650;
      __int16 v31 = "LoadFDRFCClDataFile";
      __int16 v32 = 1024;
      int v33 = v25;
      __int16 v34 = 2080;
      CFDataRef v35 = CStringPtr;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - Status = %#08x; FCCl data - %s\n",
        buf,
        0x1Cu);
    }
    CFRelease(v26);
    CFRelease(v21);
    goto LABEL_31;
  }
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v10) {
    sub_10001ADBC(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  IOObjectRelease(MatchingService);
}

void sub_1000116D8(uint64_t a1)
{
  CFErrorRef err = 0;
  CFDictionaryRef v2 = fopen("/var/mobile/Library/ISP/CalData/DCNUMetadata_0", "rb");
  if (v2)
  {
    fclose(v2);
    remove((const std::__fs::filesystem::path *)"/var/mobile/Library/ISP/CalData/DCNUMetadata_0", v3);
  }
  CFTypeRef v4 = fopen("/var/mobile/Library/ISP/CalData/DCNUPixbuf_0", "rb");
  if (v4)
  {
    fclose(v4);
    remove((const std::__fs::filesystem::path *)"/var/mobile/Library/ISP/CalData/DCNUPixbuf_0", v5);
  }
  CFDictionaryRef v6 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  unint64_t v8 = (unint64_t)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"BackCameraSNUM", kCFAllocatorDefault, 3u);
  unint64_t v9 = (unint64_t)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"BackSuperWideCameraSNUM", kCFAllocatorDefault, 3u);
  if (!(v8 | v9))
  {
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_10001AEBC(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return;
  }
  CFStringRef v18 = (const void *)v9;
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BackCameraSNUM/BackSuperWideCameraSNUM exists - load FDR CmPM calibration data\n\n", buf, 2u);
  }
  if (!v18)
  {
    unsigned int v19 = 0;
    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  CFRelease(v18);
  unsigned int v19 = 4;
  if (v8)
  {
LABEL_16:
    CFRelease((CFTypeRef)v8);
    unsigned int v19 = 0;
  }
LABEL_17:
  AMFDRLogSetHandler();
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"CopyAllowUnsealed", kCFBooleanTrue);
  CFStringRef cf = CFStringCreateWithCString(kCFAllocatorDefault, "CmPM", 0x8000100u);
  CFDictionaryRef v21 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDictForClass();
  for (uint64_t i = 0; i != 18; i += 3)
  {
    if (v21)
    {
      CFStringRef v23 = CFStringCreateWithCString(kCFAllocatorDefault, off_100024E68[i + 1], 0x8000100u);
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v21, v23);
      if (Value)
      {
        CFDataRef v25 = Value;
        BytePtr = CFDataGetBytePtr(Value);
        CFIndex Length = CFDataGetLength(v25);
        int v28 = -1431699456;
        goto LABEL_23;
      }
    }
    else
    {
      CFStringRef v23 = 0;
    }
    BytePtr = 0;
    CFIndex Length = 0;
    int v28 = -859045888;
LABEL_23:
    int v29 = (int)off_100024E68[i + 2];
    if (v29 != 771) {
      sub_100010840(a1, 0, off_100024E68[i], (uint64_t)BytePtr, Length, v29 | v28, v19, 1);
    }
    if (v23) {
      CFRelease(v23);
    }
  }
  if (err)
  {
    CFStringRef v30 = CFErrorCopyDescription(err);
    CFStringGetCStringPtr(v30, 0);
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001AEF8();
    }
    CFRelease(err);
    CFRelease(v30);
    CFErrorRef err = 0;
  }
  if (v21) {
    CFRelease(v21);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_100011AA8(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryRef v3 = IOServiceNameMatching("AppleH16CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  CFTypeRef v5 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"FrontCameraModuleSerialNumString", kCFAllocatorDefault, 3u);
  if (!v5)
  {
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v25) {
      sub_10001AF7C(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_38;
  }
  CFDictionaryRef v6 = v5;
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FrontCameraModuleSerialNumString exists - load OCCl calibration data\n\n", buf, 2u);
  }
  CFRelease(v6);
  CFTypeRef v7 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"BackTeleCameraModuleSerialNumString", kCFAllocatorDefault, 3u);
  if (!v7)
  {
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v33) {
      sub_10001AFF8(v33, v34, v35, v36, v37, v38, v39, v40);
    }
LABEL_38:
    IOObjectRelease(MatchingService);
    return;
  }
  unint64_t v8 = v7;
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "backTeleCameraModuleSerialNumString exists - load OCCl calibration data\n\n", buf, 2u);
  }
  CFRelease(v8);
  IOObjectRelease(MatchingService);
  CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, "OCCl", 0x8000100u);
  AMFDRLogSetHandler();
  CFDictionaryAddValue(Mutable, @"CopyAllowUnsealed", kCFBooleanTrue);
  CFDictionaryRef v10 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDictForClass();
  uint64_t v41 = a1;
  uint64_t v11 = 0;
  do
  {
    while (1)
    {
      uint64_t v12 = v11;
      uint64_t v13 = fopen(off_100024E38[3 * v11], "rb");
      if (v13)
      {
        uint64_t v14 = v13;
        fseeko(v13, 0, 2);
        ftello(v14);
        fseeko(v14, 0, 0);
        operator new[]();
      }
      if (v10) {
        break;
      }
      uint64_t v11 = 1;
      if (v12) {
        goto LABEL_26;
      }
    }
    uint64_t v15 = off_100024E38[3 * v12 + 1];
    CFStringRef v16 = CFStringCreateWithCString(kCFAllocatorDefault, v15, 0x8000100u);
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v10, v16);
    if (Value)
    {
      CFDataRef v18 = Value;
      BytePtr = CFDataGetBytePtr(Value);
      unsigned int Length = CFDataGetLength(v18);
      int v21 = sub_100012AE8(v41, 0x80000000, (uint64_t)BytePtr, Length, off_100024E38[3 * v12 + 2]);
      CFStringRef v22 = CFCopyDescription(v18);
      if (v22)
      {
        CFStringRef v23 = v22;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          CStringPtr = CFStringGetCStringPtr(v23, 0);
          *(_DWORD *)buf = 136315906;
          v43 = "LoadOCClCalDataFile";
          __int16 v44 = 1024;
          int v45 = v21;
          __int16 v46 = 2080;
          v47 = v15;
          __int16 v48 = 2080;
          v49 = CStringPtr;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s : Status = %08x; OCCl (%s) data - %s \n",
            buf,
            0x26u);
        }
        CFRelease(v23);
      }
    }
    if (v16) {
      CFRelease(v16);
    }
    uint64_t v11 = 1;
  }
  while (!v12);
  CFRelease(v10);
LABEL_26:
  if (v9) {
    CFRelease(v9);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_100012104()
{
  CFStringRef v0 = (const __CFString *)MGCopyAnswer();
  if (!v0)
  {
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_10001B034(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    return;
  }
  CFStringRef v1 = v0;
  CFIndex Length = CFStringGetLength(v0);
  if (CFStringHasSuffix(v1, @"AP"))
  {
    v3.size_t length = Length - 2;
  }
  else
  {
    if (!CFStringHasSuffix(v1, @"DEV"))
    {
      CFAllocatorRef v12 = kCFAllocatorDefault;
      goto LABEL_13;
    }
    v3.size_t length = Length - 3;
  }
  CFAllocatorRef v12 = kCFAllocatorDefault;
  if (v3.length >= 1)
  {
    v3.location = 0;
    CFStringRef v13 = CFStringCreateWithSubstring(kCFAllocatorDefault, v1, v3);
    CFRelease(v1);
    CFStringRef v1 = v13;
  }
LABEL_13:
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v12, 0, v1);
  CFStringLowercase(MutableCopy, 0);
  CFShow(MutableCopy);
  CFRelease(v1);
  if (MutableCopy)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    memset(__s, 0, sizeof(__s));
    strcat(__s, "/System/Library/Isp/afpp/");
    CStringPtr = CFStringGetCStringPtr(MutableCopy, 0x8000100u);
    strcat(__s, CStringPtr);
    strcat(__s, "/ispane.afpp");
    CFRelease(MutableCopy);
    CFStringRef v16 = fopen(__s, "rb");
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315138;
      uint64_t v28 = __s;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loading file for ISP-ANE networks - %s\n", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v17 = fopen("/usr/local/share/firmware/isp/ispane.afpp", "rb");
    if (v17)
    {
      CFDataRef v18 = v17;
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using override ISP-ANE AFPP file\n", (uint8_t *)&v27, 2u);
      }
      if (v16) {
        fclose(v16);
      }
      CFStringRef v16 = v18;
LABEL_27:
      fseeko(v16, 0, 2);
      ftello(v16);
      fseeko(v16, 0, 0);
      operator new[]();
    }
    if (v16) {
      goto LABEL_27;
    }
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19) {
      sub_10001B070(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

uint64_t sub_100012614(uint64_t a1, unsigned int a2, unsigned int a3)
{
  mach_port_t v3 = *(_DWORD *)(a1 + 152);
  if (!v3) {
    return 3758097084;
  }
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(v3, 0x30u, input, 2u, 0, 0);
}

uint64_t sub_100012694(uint64_t a1, unsigned int a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t v4 = a2;
  return IOConnectCallScalarMethod(v2, 0x31u, &v4, 1u, 0, 0);
}

uint64_t sub_100012710(uint64_t a1)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = *(unsigned int *)(a1 + 152);
  if (result) {
    return !IOConnectCallScalarMethod(result, 0x39u, 0, 0, &output, &outputCnt) && output == 1;
  }
  return result;
}

uint64_t sub_100012768(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = 3758097084;
  if (*(_DWORD *)(a1 + 152))
  {
    uint64_t v11 = fopen("/usr/local/share/firmware/isp/Yonkers/YonkersPatchOverride.DAT", "rb");
    if (v11)
    {
      CFAllocatorRef v12 = v11;
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Trying to use override YonkersPatchOverride.DAT file\n", buf, 2u);
      }
      fseeko(v12, 0, 2);
      ftello(v12);
      fseeko(v12, 0, 0);
      operator new[]();
    }
    uint64_t v23 = a2;
    if (a3 && a4)
    {
      *(void *)buf = a3;
      uint64_t v22 = a4;
      if (sub_100012AE8(a1, a2, a3, a4, a5) != -536870212) {
        return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 152), 0x41u, (const uint64_t *)buf, 3u, 0, 0);
      }
    }
    else
    {
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
        && (sub_10001B138(0, v13, v14, v15, v16, v17, v18, v19) & 1) != 0)
      {
        operator delete[]();
      }
    }
  }
  return v5;
}

uint64_t sub_100012AE8(uint64_t a1, int a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  mach_port_t v7 = *(_DWORD *)(a1 + 152);
  if (v7)
  {
    uint64_t v11 = a3;
    uint64_t v12 = a4;
    uint64_t v13 = (const char *)a2;
    uint64_t v14 = a5;
    uint64_t v8 = IOConnectCallScalarMethod(v7, 0x25u, &v11, 4u, 0, 0);
  }
  else
  {
    uint64_t v8 = 3758097084;
  }
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11) = 67109890;
    HIDWORD(v11) = a2 & 0x7FFFFFFF;
    uint64_t v9 = "false";
    LOWORD(v12) = 1024;
    if (a2 < 0) {
      uint64_t v9 = "true";
    }
    *(_DWORD *)((char *)&v12 + 2) = a5;
    HIWORD(v12) = 2080;
    uint64_t v13 = v9;
    LOWORD(v14) = 1024;
    *(_DWORD *)((char *)&v14 + 2) = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Load data file: channel: %d, type: %d, isEarlyBootDataFile: %s, status: %08x\n\n", (uint8_t *)&v11, 0x1Eu);
  }
  return v8;
}

uint64_t sub_100012C48(uint64_t a1, uint64_t a2, unsigned int a3)
{
  mach_port_t v3 = *(_DWORD *)(a1 + 152);
  if (v3)
  {
    *(void *)uint64_t v6 = a2;
    *(void *)&v6[8] = a3;
    uint64_t v4 = IOConnectCallScalarMethod(v3, 0x62u, (const uint64_t *)v6, 2u, 0, 0);
  }
  else
  {
    uint64_t v4 = 3758097084;
  }
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)&v6[4] = "ISP_LoadIspAneAFPPFile";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - status: %08x\n", v6, 0x12u);
  }
  return v4;
}

uint64_t sub_100012D64(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = 3758097084;
  if (*(_DWORD *)(a1 + 152))
  {
    uint64_t v11 = fopen("/usr/local/share/firmware/isp/Savage/SavagePatchOverride.DAT", "rb");
    if (v11)
    {
      uint64_t v12 = v11;
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Trying to use SavagePatchOverride.DAT file\n", buf, 2u);
      }
      fseeko(v12, 0, 2);
      ftello(v12);
      fseeko(v12, 0, 0);
      operator new[]();
    }
    uint64_t v23 = a2;
    if (a3 && a4)
    {
      *(void *)buf = a3;
      uint64_t v22 = a4;
      if (sub_100012AE8(a1, a2, a3, a4, a5) != -536870212) {
        return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 152), 2u, (const uint64_t *)buf, 3u, 0, 0);
      }
    }
    else
    {
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)
        && (sub_10001B1C0(0, v13, v14, v15, v16, v17, v18, v19) & 1) != 0)
      {
        operator delete[]();
      }
    }
  }
  return v5;
}

uint64_t sub_1000130E4(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  mach_port_t v6 = *(_DWORD *)(a1 + 152);
  if (v6)
  {
    if (a3 && a4)
    {
      *(void *)&long long buf = a3;
      *((void *)&buf + 1) = a4;
      uint64_t v21 = a2;
      uint64_t v9 = IOConnectCallScalarMethod(v6, 0x6Du, &v21, 1u, 0, 0);
      if (v9)
      {
        uint64_t v10 = v9;
        if (off_100247BA8 == &_os_log_default) {
          off_100247BA8 = os_log_create("com.apple.isp", "device");
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315394;
          uint64_t v17 = "ISP_SavageAuth";
          __int16 v18 = 1024;
          int v19 = v10;
          uint64_t v11 = "%s: Savage Pre Auth failed, status = 0x%x\n";
LABEL_28:
          p_long long buf = (uint8_t *)&v16;
          uint32_t v13 = 18;
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v14 = sub_100012AE8(a1, a2, buf, DWORD2(buf), a5);
        if (v14)
        {
          uint64_t v10 = v14;
          if (off_100247BA8 == &_os_log_default) {
            off_100247BA8 = os_log_create("com.apple.isp", "device");
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 136315394;
            uint64_t v17 = "ISP_SavageAuth";
            __int16 v18 = 1024;
            int v19 = v10;
            uint64_t v11 = "%s: Data file load failed, status = 0x%x\n";
            goto LABEL_28;
          }
        }
        else
        {
          uint64_t v10 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 152), 0x6Eu, &v21, 1u, 0, 0);
          if (v10)
          {
            if (off_100247BA8 == &_os_log_default) {
              off_100247BA8 = os_log_create("com.apple.isp", "device");
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v16 = 136315394;
              uint64_t v17 = "ISP_SavageAuth";
              __int16 v18 = 1024;
              int v19 = v10;
              uint64_t v11 = "%s: Savage Auth failed, status = 0x%x\n";
              goto LABEL_28;
            }
          }
        }
      }
    }
    else
    {
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "ISP_SavageAuth";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Invalid data file arguments\n", (uint8_t *)&buf, 0xCu);
      }
      return 3758096385;
    }
  }
  else
  {
    if (off_100247BA8 == &_os_log_default) {
      off_100247BA8 = os_log_create("com.apple.isp", "device");
    }
    uint64_t v10 = 3758097084;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "ISP_SavageAuth";
      uint64_t v11 = "%s: Invalid connection\n";
      p_long long buf = (uint8_t *)&buf;
      uint32_t v13 = 12;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, p_buf, v13);
    }
  }
  return v10;
}

uint64_t sub_10001348C(int a1, char *__filename, void *a3, size_t *a4)
{
  uint64_t v4 = 3758097090;
  if (a3 && a4)
  {
    *a3 = 0;
    *a4 = 0;
    uint64_t v8 = fopen(__filename, "rb");
    if (v8)
    {
      uint64_t v9 = v8;
      fseeko(v8, 0, 2);
      size_t v10 = ftello(v9);
      fseeko(v9, 0, 0);
      uint64_t v11 = malloc_type_calloc(v10, 1uLL, 0xFCA9B5AFuLL);
      if (v11)
      {
        uint64_t v12 = v11;
        size_t v13 = fread(v11, 1uLL, v10, v9);
        if (v13 == v10)
        {
          *a3 = v12;
          *a4 = v10;
          size_t v14 = v10;
        }
        else
        {
          size_t v14 = v13;
          free(v12);
        }
      }
      else
      {
        size_t v14 = 0;
      }
      fclose(v9);
      if (off_100247BA8 == &_os_log_default) {
        off_100247BA8 = os_log_create("com.apple.isp", "device");
      }
      uint64_t v4 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315906;
        uint64_t v17 = "CopyFileToBuffer";
        __int16 v18 = 2080;
        int v19 = __filename;
        __int16 v20 = 2048;
        size_t v21 = v10;
        __int16 v22 = 2048;
        size_t v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - Trying to use %s: Size = %lld (== %lld ?);\n",
          (uint8_t *)&v16,
          0x2Au);
        return 0;
      }
    }
    else
    {
      return 3758097136;
    }
  }
  return v4;
}

uint64_t sub_100013670(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v3 = 3758097090;
  BytePtr = 0;
  CFIndex Length = 0;
  if (a2)
  {
    uint64_t v5 = *(const char **)(a2 + 8);
    if (v5)
    {
      if (*(int *)(a2 + 4) >= 1024)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        memset(__str, 0, sizeof(__str));
        int v8 = snprintf(__str, 0x40uLL, "%s%s.%s", "/usr/local/share/firmware/isp/", v5, "DAT");
        int v9 = sub_10001348C(v8, __str, &BytePtr, (size_t *)&Length);
        if (v9)
        {
          if (!a3) {
            goto LABEL_34;
          }
          CFDataRef Value = CFDictionaryGetValue(a3, *(const void **)(a2 + 16));
          if (!Value) {
            goto LABEL_34;
          }
          CFDataRef v11 = (const __CFData *)CFRetain(Value);
          if (off_100247BA8 == &_os_log_default) {
            off_100247BA8 = os_log_create("com.apple.isp", "device");
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = *(void *)(a2 + 8);
            *(_DWORD *)long long buf = 136315394;
            __int16 v20 = "SendSysConfigCalibrationDataByKey";
            __int16 v21 = 2080;
            uint64_t v22 = v12;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - Using %s from unit info plist\n", buf, 0x16u);
          }
          if (!v11)
          {
LABEL_34:
            CFDictionaryRef v13 = IOServiceNameMatching("AppleH16CamIn");
            io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v13);
            CFDataRef v11 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", *(CFStringRef *)(a2 + 24), kCFAllocatorDefault, 3u);
            if (!v11) {
              return 3758097084;
            }
          }
          CFIndex Length = CFDataGetLength(v11);
          BytePtr = (void *)CFDataGetBytePtr(v11);
        }
        else
        {
          if (off_100247BA8 == &_os_log_default) {
            off_100247BA8 = os_log_create("com.apple.isp", "device");
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            __int16 v20 = __str;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded calibration file from override path: %s\n", buf, 0xCu);
          }
          CFDataRef v11 = 0;
        }
        uint64_t v3 = 0;
        if (BytePtr && Length)
        {
          uint64_t v3 = sub_100012AE8(a1, *(_DWORD *)a2 | 0x80000000, (uint64_t)BytePtr, Length, *(_DWORD *)(a2 + 4));
          if (off_100247BA8 == &_os_log_default) {
            off_100247BA8 = os_log_create("com.apple.isp", "device");
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(a2 + 8);
            *(_DWORD *)__str = 136315906;
            *(void *)&__str[4] = "SendSysConfigCalibrationDataByKey";
            *(_WORD *)&__str[12] = 2080;
            *(void *)&__str[14] = v15;
            *(_WORD *)&__str[22] = 2048;
            *(void *)&__str[24] = Length;
            LOWORD(v24) = 1024;
            *(_DWORD *)((char *)&v24 + 2) = v3;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - %s - size_t length = %ld; status = %08x\n",
              (uint8_t *)__str,
              0x26u);
          }
        }
        if (!v9 && BytePtr) {
          free(BytePtr);
        }
        if (v11) {
          CFRelease(v11);
        }
      }
    }
  }
  return v3;
}

void sub_1000139F0(uint64_t a1, uint64_t a2)
{
  if (off_100247BA8 == &_os_log_default) {
    off_100247BA8 = os_log_create("com.apple.isp", "device");
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    uint64_t v4 = "fdrLogMessages";
    __int16 v5 = 2080;
    uint64_t v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s - %s\n", (uint8_t *)&v3, 0x16u);
  }
}

BOOL sub_100013AD4(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 112);
  int v4 = *(unsigned __int8 *)(v3 + 551);
  for (uint64_t i = (_DWORD *)(v3 + 16); ; i += 22)
  {
    if (*(i - 2))
    {
      if (*i == 1718776695 || *i == 1718775412) {
        break;
      }
    }
    if (++v2 == 6) {
      return v4 != 0;
    }
  }
  *a2 = v2;
  return v4 != 0;
}

BOOL sub_100013B30(uint64_t a1, _DWORD *a2)
{
  unint64_t v2 = 0;
  uint64_t v3 = (_DWORD *)(*(void *)(a1 + 112) + 16);
  BOOL v4 = 1;
  while (*v3 != 1718186595 || *(v3 - 2) != 1)
  {
    BOOL v4 = v2 < 5;
    v3 += 22;
    if (++v2 == 6) {
      return 0;
    }
  }
  *a2 = v2;
  return v4;
}

uint64_t sub_100013B90(uint64_t a1)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = *(unsigned int *)(a1 + 152);
  if (result)
  {
    if (IOConnectCallScalarMethod(result, 0x53u, 0, 0, &output, &outputCnt)) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = output == 0;
    }
    return !v2;
  }
  return result;
}

uint64_t sub_100013BE8(uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct)
{
  mach_port_t v4 = *(_DWORD *)(a1 + 152);
  if (!v4) {
    return 3758097084;
  }
  input[0] = a2;
  input[1] = a3;
  size_t v6 = 72;
  return IOConnectCallMethod(v4, 0x66u, input, 2u, 0, 0, 0, 0, outputStruct, &v6);
}

uint64_t sub_100013C80(uint64_t result)
{
  CFStringRef v1 = *(uint64_t (**)(void))(result + 56);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_100013CA0(uint64_t a1, _DWORD *a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(v2, 0x22u, 0, 0, &output, &outputCnt);
  if (!result) {
    *a2 = output;
  }
  return result;
}

uint64_t sub_100013D0C(uint64_t a1, _DWORD *a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(v2, 0x23u, 0, 0, &output, &outputCnt);
  if (!result) {
    *a2 = output;
  }
  return result;
}

uint64_t sub_100013D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v6 = (pthread_mutex_t *)(a1 + 160);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 160));
  if (*(_DWORD *)(a1 + 152))
  {
    pthread_mutex_unlock(v6);
    return 3758097093;
  }
  else
  {
    unsigned int v8 = IOServiceOpen(*(_DWORD *)(a1 + 144), mach_task_self_, 0x2Au, (io_connect_t *)(a1 + 152));
    mach_port_t v9 = *(_DWORD *)(a1 + 152);
    if (v9) {
      uint64_t v7 = v8;
    }
    else {
      uint64_t v7 = 3758097084;
    }
    if (!v7)
    {
      uint64_t v11 = 0;
      uint64_t v7 = IOConnectCallScalarMethod(v9, 3u, &v11, 1u, 0, 0);
      if (!v7)
      {
        *(void *)(a1 + 56) = a2;
        *(void *)(a1 + 64) = a3;
        sub_100013CA0(a1, (_DWORD *)(a1 + 120));
        sub_100013D0C(a1, (_DWORD *)(a1 + 80));
      }
    }
    pthread_mutex_unlock(v6);
  }
  return v7;
}

uint64_t sub_100013E94(uint64_t a1, unsigned int a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t v4 = a2;
  return IOConnectCallScalarMethod(v2, 0, &v4, 1u, 0, 0);
}

uint64_t sub_100013F10(uint64_t a1, unsigned int a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t v4 = a2;
  return IOConnectCallScalarMethod(v2, 1u, &v4, 1u, 0, 0);
}

uint64_t sub_100013F8C(uint64_t a1, unsigned int a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t v4 = a2;
  return IOConnectCallScalarMethod(v2, 0x3Fu, &v4, 1u, 0, 0);
}

uint64_t sub_100014008(uint64_t a1, unsigned int a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 152);
  if (!v2) {
    return 3758097084;
  }
  uint64_t v4 = a2;
  return IOConnectCallScalarMethod(v2, 0x40u, &v4, 1u, 0, 0);
}

void sub_100014098(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000140B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000140D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *sub_100014110(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void sub_100014120(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_10001413C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t sub_100014168()
{
  return 0;
}

uint64_t sub_100014170()
{
  return 0;
}

void sub_100014178(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != a1 + 8)
  {
    do
    {
      uint64_t v3 = *(void *)(v2 + 16);
      if (*(_DWORD *)(v3 + 8) == 1)
      {
        os_log_t v4 = (os_log_t)off_100247BB0;
        if (off_100247BB0 == &_os_log_default)
        {
          os_log_t v4 = os_log_create("com.apple.isp", "daemon");
          off_100247BB0 = v4;
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)v3);
          size_t v6 = *(const char **)(v3 + 24);
          if (!v6) {
            size_t v6 = "<null>";
          }
          *(_DWORD *)long long buf = 67174915;
          pid_t v8 = pid;
          __int16 v9 = 2081;
          size_t v10 = v6;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Active client pid %{private}d deviceID %{private}s\n", buf, 0x12u);
        }
      }
      uint64_t v2 = *(void *)(v2 + 8);
    }
    while (v2 != v1);
  }
}

uint64_t sub_1000142C8(uint64_t a1, uint64_t a2, xpc_object_t object)
{
  uint64_t v3 = 3758097090;
  if (*(void *)(a2 + 24))
  {
    os_log_t v4 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v4 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v4;
    }
    uint64_t v3 = 3758097131;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001B248(v4);
    }
  }
  else if (object && xpc_get_type(object) == (xpc_type_t)&_xpc_type_string)
  {
    size_t v9 = xpc_string_get_length(object) + 1;
    size_t v10 = malloc_type_malloc(v9, 0xAE92CD7AuLL);
    *(void *)(a2 + 24) = v10;
    if (v10)
    {
      uint64_t v11 = v10;
      string_ptr = xpc_string_get_string_ptr(object);
      memcpy(v11, string_ptr, v9);
      sub_100014178(a1);
      return 0;
    }
    else
    {
      return 3758097085;
    }
  }
  return v3;
}

void sub_1000143DC(void *a1, uint64_t a2)
{
  if (a2)
  {
    os_log_t v4 = a1 + 1;
    if (!a1[3]) {
      a1[6] = os_transaction_create();
    }
    uint64_t v5 = operator new(0x18uLL);
    v5[1] = v4;
    v5[2] = a2;
    uint64_t v6 = a1[1];
    void *v5 = v6;
    *(void *)(v6 + 8) = v5;
    a1[1] = v5;
    ++a1[3];
    if (*(_DWORD *)(a2 + 8) == 1 && (pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)a2)) != 0)
    {
      pid_t v8 = pid;
      os_log_t v9 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v9 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v9;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67174657;
        LODWORD(v14) = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection: pid %{private}d\n", (uint8_t *)&v13, 8u);
      }
    }
    else
    {
      os_log_t v10 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v10 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v10;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New connection: kernel\n", (uint8_t *)&v13, 2u);
      }
    }
    kdebug_trace();
    os_log_t v11 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v11 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v11;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[3];
      int v13 = 134217984;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Total number of connections: %lu\n", (uint8_t *)&v13, 0xCu);
    }
  }
}

uint64_t sub_100014618(uint64_t result, uint64_t a2)
{
  uint64_t v9 = a2;
  if (a2)
  {
    uint64_t v2 = result;
    sub_1000148BC(result + 8, &v9);
    if (*(_DWORD *)(v9 + 8) == 1 && (pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)v9)) != 0)
    {
      xpc_release(*(xpc_object_t *)v9);
      os_log_t v4 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v4 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v4;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67174657;
        LODWORD(v11) = pid;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing client: pid %{private}d\n", buf, 8u);
      }
    }
    else
    {
      os_log_t v5 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v5 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing client: kernel\n", buf, 2u);
      }
    }
    os_log_t v6 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v6 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v6;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(v2 + 24);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Total number of connections: %lu\n", buf, 0xCu);
    }
    sub_100014178(v2);
    if (!*(void *)(v2 + 24))
    {
      *(_OWORD *)(v2 + 104) = 0u;
      *(void *)(v2 + 536) = 0;
      *(_OWORD *)(v2 + 504) = 0u;
      *(_OWORD *)(v2 + 520) = 0u;
      *(_OWORD *)(v2 + 472) = 0u;
      *(_OWORD *)(v2 + 488) = 0u;
      *(_OWORD *)(v2 + 440) = 0u;
      *(_OWORD *)(v2 + 456) = 0u;
      *(_OWORD *)(v2 + 408) = 0u;
      *(_OWORD *)(v2 + 424) = 0u;
      *(_OWORD *)(v2 + 376) = 0u;
      *(_OWORD *)(v2 + 392) = 0u;
      *(_OWORD *)(v2 + 344) = 0u;
      *(_OWORD *)(v2 + 360) = 0u;
      *(_OWORD *)(v2 + 312) = 0u;
      *(_OWORD *)(v2 + 328) = 0u;
      *(_OWORD *)(v2 + 280) = 0u;
      *(_OWORD *)(v2 + 296) = 0u;
      *(_OWORD *)(v2 + 248) = 0u;
      *(_OWORD *)(v2 + 264) = 0u;
      *(_OWORD *)(v2 + 216) = 0u;
      *(_OWORD *)(v2 + 232) = 0u;
      *(_OWORD *)(v2 + 184) = 0u;
      *(_OWORD *)(v2 + 200) = 0u;
      *(_OWORD *)(v2 + 152) = 0u;
      *(_OWORD *)(v2 + 168) = 0u;
      *(_OWORD *)(v2 + 120) = 0u;
      *(_OWORD *)(v2 + 136) = 0u;
      pid_t v8 = *(void **)(v2 + 48);
      if (v8)
      {
        os_release(v8);
        *(void *)(v2 + 48) = 0;
      }
    }
    uint64_t result = kdebug_trace();
    if (v9)
    {
      free(*(void **)(v9 + 24));
      operator delete();
    }
  }
  return result;
}

uint64_t sub_1000148BC(uint64_t a1, void *a2)
{
  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  uint64_t v12 = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 == (void *)a1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    do
    {
      os_log_t v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          os_log_t v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            os_log_t v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        sub_100016E60((uint64_t)v11, v11, a1, v2, v6);
        if (!v8) {
          os_log_t v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
    uint64_t v9 = v12;
  }
  sub_100016DFC(v11);
  return v9;
}

void sub_100014988(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100016DFC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10001499C(void *a1)
{
  uint64_t v2 = a1 + 1;
  for (uint64_t i = (void *)a1[2]; i != v2; uint64_t i = (void *)i[1])
  {
    uint64_t v4 = i[2];
    if (*(_DWORD *)(v4 + 8) == 1)
    {
      xpc_release(*(xpc_object_t *)v4);
      uint64_t v4 = i[2];
      if (!v4) {
        continue;
      }
    }
    free(*(void **)(v4 + 24));
    operator delete();
  }
  sub_100016DFC(v2);
  uint64_t v5 = (void *)a1[6];
  if (v5)
  {
    os_release(v5);
    a1[6] = 0;
  }
}

uint64_t sub_100014A34(uint64_t a1, uint64_t a2, int *a3)
{
  os_log_t v6 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v6 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v6;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *a3;
    int v40 = 136315394;
    long long v41 = "setProperty";
    __int16 v42 = 1024;
    int v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s - %d\n", (uint8_t *)&v40, 0x12u);
  }
  kdebug_trace();
  uint64_t v8 = 0;
  int v9 = *a3;
  switch(*a3)
  {
    case 1:
      goto LABEL_26;
    case 2:
      uint64_t v10 = a3[2];
      if (v10 > 5) {
        goto LABEL_18;
      }
      uint64_t v8 = 0;
      *(unsigned char *)(a2 + v10 + 12) = *((unsigned char *)a3 + 12);
      goto LABEL_26;
    case 3:
      if (sub_100003CC4(a3 + 2)) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = 3758097084;
      }
      goto LABEL_26;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 11:
    case 12:
    case 13:
      goto LABEL_18;
    case 9:
      unsigned int v12 = a3[2];
      if (v12 > 5) {
        goto LABEL_18;
      }
      uint64_t v8 = 0;
      int v13 = a3[5];
      uint64_t v14 = (int32x2_t *)(a1 + 12 * v12);
      v14[17] = vadd_s32(v14[17], *(int32x2_t *)(a3 + 3));
      v14[18].i32[0] += v13;
      goto LABEL_26;
    case 10:
      int v15 = a3[2];
      if (v15 <= 5)
      {
        uint64_t v23 = a1 + 56 * v15;
        int v24 = *(_DWORD *)(v23 + 212);
        *(_DWORD *)(v23 + 208) |= a3[3];
        *(_DWORD *)(v23 + 212) = v24 | a3[4];
        if (*((unsigned char *)a3 + 20))
        {
          uint64_t v25 = 0;
          uint64_t v26 = a1 + 56 * v15;
          *(unsigned char *)(v26 + 216) = 1;
          int v27 = *(_DWORD *)(v26 + 224);
          *(_DWORD *)(v26 + 220) |= a3[6];
          *(_DWORD *)(v26 + 224) = v27 | a3[7];
          uint64_t v28 = a3 + 11;
          uint64_t v29 = v26 + 240;
          do
          {
            uint64_t v8 = 0;
            long long v30 = (float *)&v28[v25];
            float v31 = *(float *)&v28[v25 - 3];
            long long v32 = (float *)(v29 + v25 * 4);
            if (v31 <= *(float *)(v29 + v25 * 4 - 12)) {
              float v31 = *(float *)(v29 + v25 * 4 - 12);
            }
            *(v32 - 3) = v31;
            float v33 = *v30;
            if (*v30 <= *v32) {
              float v33 = *v32;
            }
            *long long v32 = v33;
            ++v25;
          }
          while (v25 != 3);
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
LABEL_18:
        uint64_t v8 = 3758097084;
      }
      goto LABEL_26;
    case 14:
      uint64_t v11 = sub_1000142C8(a1, a2, *((xpc_object_t *)a3 + 1));
LABEL_25:
      uint64_t v8 = v11;
      goto LABEL_26;
    default:
      switch(v9)
      {
        case 204:
          uint64_t v11 = sub_100012D64(*(void *)(a1 + 72), *(_DWORD *)(a1 + 620), *((void *)a3 + 1), a3[4], 5u);
          goto LABEL_25;
        case 205:
        case 206:
        case 209:
        case 210:
          goto LABEL_18;
        case 207:
          uint64_t v11 = sub_100012768(*(void *)(a1 + 72), *(_DWORD *)(a1 + 624), *((void *)a3 + 1), a3[4], 5u);
          goto LABEL_25;
        case 208:
          uint64_t v8 = sub_100010134(*(void *)(a1 + 72));
          if (!v8)
          {
            uint64_t v8 = sub_10000D0C4(*(void *)(a1 + 72));
            if (!v8) {
              sub_10000A218(*(void *)(a1 + 64));
            }
          }
          goto LABEL_26;
        case 211:
          uint64_t v11 = sub_1000101C4(*(void *)(a1 + 72), *((unsigned char **)a3 + 1), *((void *)a3 + 2), *((void *)a3 + 3));
          goto LABEL_25;
        case 212:
          int v20 = 10;
          break;
        default:
          if (v9 != 101) {
            goto LABEL_18;
          }
          goto LABEL_26;
      }
      break;
  }
  while (1)
  {
    uint64_t v21 = sub_10000D284();
    if (!v21) {
      break;
    }
    uint64_t v8 = v21;
    usleep(0x7A120u);
    if (!--v20)
    {
      os_log_t v22 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v22 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v22;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10001B49C();
      }
      goto LABEL_26;
    }
  }
  int v34 = 10;
  while (1)
  {
    uint64_t v35 = sub_100012614(*(void *)(a1 + 72), *(_DWORD *)(a1 + 620), 2u);
    if (!v35) {
      break;
    }
    uint64_t v8 = v35;
    usleep(0x30D40u);
    if (!--v34)
    {
      os_log_t v36 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v36 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v36;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_10001B428();
      }
      goto LABEL_26;
    }
  }
  if (sub_1000130E4(*(void *)(a1 + 72), *(_DWORD *)(a1 + 620), *((void *)a3 + 1), *((void *)a3 + 2), 0x500u))
  {
    os_log_t v37 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v37 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v37;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10001B3B4();
    }
  }
  if (sub_100012694(*(void *)(a1 + 72), *(_DWORD *)(a1 + 620)))
  {
    os_log_t v38 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v38 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v38;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_10001B340();
    }
  }
  uint64_t v8 = sub_100010134(*(void *)(a1 + 72));
  if (v8)
  {
    os_log_t v39 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v39 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v39;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_10001B2CC();
    }
  }
LABEL_26:
  os_log_t v16 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v16 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v16;
  }
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  int v18 = *a3;
  if (v17)
  {
    int v40 = 136315650;
    long long v41 = "setProperty";
    __int16 v42 = 1024;
    int v43 = v18;
    __int16 v44 = 1024;
    int v45 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s - %d complete (res=0x%08X)\n\n", (uint8_t *)&v40, 0x18u);
  }
  kdebug_trace();
  return v8;
}

uint64_t sub_100015094(uint64_t a1, uint64_t a2, int *a3)
{
  os_log_t v5 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v5 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = *a3;
    int v22 = 136315394;
    uint64_t v23 = "getProperty";
    __int16 v24 = 1024;
    int v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s - %d\n", (uint8_t *)&v22, 0x12u);
  }
  kdebug_trace();
  uint64_t v7 = 3758097084;
  switch(*a3)
  {
    case 200:
      uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 112);
      uint64_t v7 = 3758097085;
      if (v8)
      {
        uint64_t v9 = 0;
        uint64_t v10 = (int *)(v8 + 16);
        do
        {
          int v12 = *v10;
          v10 += 22;
          int v11 = v12;
          if (v12 == 1718776695 || v11 == 1718775412)
          {
            a3[3] = v9;
            *(_DWORD *)(a1 + 624) = v9;
          }
          else if (v11 == 1718186595)
          {
            a3[2] = v9;
            *(_DWORD *)(a1 + 620) = v9;
          }
          ++v9;
        }
        while (v9 != 6);
        goto LABEL_42;
      }
      break;
    case 201:
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 112);
      uint64_t v7 = 3758097085;
      if (v14)
      {
        *((unsigned char *)a3 + 8) = *(unsigned char *)(v14 + 577);
        *((unsigned char *)a3 + 10) = *(unsigned char *)(v14 + 551);
        char v15 = *(unsigned char *)(v14 + 552);
        if (v15)
        {
          *((unsigned char *)a3 + 9) = 0;
          char v15 = *(unsigned char *)(v14 + 544);
        }
        else
        {
          *((unsigned char *)a3 + 9) = *(unsigned char *)(v14 + 544);
        }
        *((unsigned char *)a3 + 11) = v15;
        if (*(_DWORD *)(v14 + 560) == 394)
        {
          uint64_t v7 = 0;
          *((unsigned char *)a3 + 11) = 0;
          *(_WORD *)((char *)a3 + 9) = 0;
        }
        else
        {
LABEL_42:
          uint64_t v7 = 0;
        }
      }
      break;
    case 202:
      uint64_t v16 = sub_100013E94(*(void *)(a1 + 72), *(_DWORD *)(a1 + 620));
      goto LABEL_33;
    case 203:
      uint64_t v7 = sub_100010570(*(void *)(a1 + 72));
      if (v7) {
        goto LABEL_30;
      }
      uint64_t v17 = sub_100013F10(*(void *)(a1 + 72), *(_DWORD *)(a1 + 620));
      goto LABEL_29;
    case 204:
    case 207:
    case 208:
      break;
    case 205:
      uint64_t v16 = sub_100013F8C(*(void *)(a1 + 72), *(_DWORD *)(a1 + 624));
      goto LABEL_33;
    case 206:
      uint64_t v7 = sub_100010570(*(void *)(a1 + 72));
      if (v7) {
        goto LABEL_30;
      }
      uint64_t v17 = sub_100014008(*(void *)(a1 + 72), *(_DWORD *)(a1 + 624));
LABEL_29:
      uint64_t v7 = v17;
LABEL_30:
      a3[2] = v7;
      break;
    case 209:
      uint64_t v16 = sub_10000FADC(*(void *)(a1 + 72));
      goto LABEL_33;
    case 210:
      uint64_t v16 = sub_10000F804(*(void *)(a1 + 72));
LABEL_33:
      uint64_t v7 = v16;
      a3[2] = v16;
      break;
    default:
      if (*a3 == 5)
      {
        uint64_t v7 = 0;
        *((unsigned char *)a3 + 8) = sub_100002CDC(**(_DWORD **)(*(void *)(a1 + 72) + 112), 0, (time_t *)a3 + 2);
      }
      break;
  }
  os_log_t v18 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v18 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v18;
  }
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  int v20 = *a3;
  if (v19)
  {
    int v22 = 136315650;
    uint64_t v23 = "getProperty";
    __int16 v24 = 1024;
    int v25 = v20;
    __int16 v26 = 1024;
    int v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s - %d complete (res=0x%08X)\n\n", (uint8_t *)&v22, 0x18u);
  }
  kdebug_trace();
  return v7;
}

void sub_10001544C(uint64_t a1, xpc_connection_t *a2, xpc_object_t xdict)
{
  size_t length = 0;
  uint64_t int64 = xpc_dictionary_get_uint64(xdict, "H16ISPServicesRemoteTypeKey");
  data = (int *)xpc_dictionary_get_data(xdict, "H16ISPServicesRemoteDataKey", &length);
  if (!uint64) {
    return;
  }
  uint64_t v8 = data;
  if (!data || !length) {
    return;
  }
  if (uint64 == 1 && length == 13176)
  {
    int v9 = *data;
    if (*data > 203)
    {
      switch(v9)
      {
        case 204:
        case 207:
        case 212:
          size_t v26 = 0;
          int v11 = xpc_dictionary_get_data(xdict, "H16ISPServicesRemoteFusingDataKey", &v26);
          size_t v12 = v26;
          *((void *)v8 + 1) = v11;
          *((void *)v8 + 2) = v12;
          break;
        case 211:
          *(void *)uint64_t v29 = 0;
          *((void *)data + 1) = xpc_dictionary_get_string(xdict, "H16ISPServicesRemoteIORegPropertyNameKey");
          uint64_t v16 = xpc_dictionary_get_data(xdict, "H16ISPServicesRemoteIORegPropertyDataKey", (size_t *)v29);
          uint64_t v17 = *(void *)v29;
          *((void *)v8 + 2) = v16;
          *((void *)v8 + 3) = v17;
          break;
        default:
          break;
      }
    }
    else if ((v9 - 6) < 2)
    {
      *((void *)data + 1) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteCFTypeNameKey");
      *((void *)v8 + 2) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteCFTypeDataKey");
    }
    else if (v9 == 11)
    {
      *((void *)data + 1) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteRGBIRBufferColorKey");
      *((void *)v8 + 2) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteRGBIRBufferIRKey");
      *((void *)v8 + 3) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteRGBIRBufferDepthKey");
      *((void *)v8 + 4) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteRGBIRMetadataColorKey");
      *((void *)v8 + 5) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteRGBIRMetadataIRKey");
      *((void *)v8 + 6) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteRGBIRPCEConfigKey");
    }
    else if (v9 == 14)
    {
      *((void *)data + 1) = xpc_dictionary_get_value(xdict, "H16ISPServicesRemoteDeviceID");
    }
    int v18 = sub_100014A34(a1, (uint64_t)a2, v8);
    goto LABEL_31;
  }
  if (uint64 != 2 || length != 3680)
  {
    os_log_t v13 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v13 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v13;
    }
    int v14 = -536870212;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001B610(a2, uint64, v13);
    }
    goto LABEL_32;
  }
  memcpy(__dst, data, sizeof(__dst));
  if ((LODWORD(__dst[0]) - 6) < 2)
  {
    char v15 = "H16ISPServicesRemoteCFTypeNameKey";
  }
  else
  {
    if (LODWORD(__dst[0]) != 13)
    {
      if (LODWORD(__dst[0]) == 100)
      {
        sub_100015094(a1, v10, (int *)__dst);
        return;
      }
      goto LABEL_30;
    }
    char v15 = "H16ISPServicesRemoteRGBIRFinalInputPCEConfigKey";
  }
  __dst[1] = xpc_dictionary_get_value(xdict, v15);
LABEL_30:
  int v18 = sub_100015094(a1, v10, (int *)__dst);
LABEL_31:
  int v14 = v18;
LABEL_32:
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  int v20 = reply;
  if (reply)
  {
    remote_connection = xpc_dictionary_get_remote_connection(reply);
    os_log_t v22 = (os_log_t)off_100247BB0;
    if (!remote_connection)
    {
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v22 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v22;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10001B590(a2);
      }
      goto LABEL_59;
    }
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v22 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v22;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      pid_t pid = xpc_connection_get_pid(*a2);
      *(_DWORD *)uint64_t v29 = 136315907;
      *(void *)&v29[4] = "xpcClientEventHandler";
      __int16 v30 = 1024;
      int v31 = 1588;
      __int16 v32 = 1024;
      int v33 = v14;
      __int16 v34 = 1025;
      pid_t v35 = pid;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s: %d: Sending reply to client: rc %08X (pid %{private}d)\n", v29, 0x1Eu);
    }
    xpc_dictionary_set_int64(v20, "H16ISPServicesRemoteReturnKey", v14);
    if (uint64 == 2)
    {
      xpc_dictionary_set_data(v20, "H16ISPServicesRemoteDataKey", __dst, length);
      if ((LODWORD(__dst[0]) - 6) < 2)
      {
        if (!v14)
        {
          xpc_dictionary_set_value(v20, "H16ISPServicesRemoteCFTypeDataKey", __dst[2]);
          xpc_release(__dst[2]);
        }
        goto LABEL_58;
      }
      if (LODWORD(__dst[0]) == 13)
      {
        if (v14) {
          goto LABEL_58;
        }
        xpc_dictionary_set_value(v20, "H16ISPServicesRemoteRGBIRFinalOutputPCEConfigKey", __dst[2]);
        xpc_object_t v24 = __dst[2];
        if (!__dst[2]) {
          goto LABEL_58;
        }
      }
      else
      {
        if (LODWORD(__dst[0]) != 12) {
          goto LABEL_58;
        }
        if (v14) {
          goto LABEL_58;
        }
        xpc_dictionary_set_value(v20, "H16ISPServicesRemoteRGBIRReportKey", __dst[1]);
        xpc_object_t v24 = __dst[1];
        if (!__dst[1]) {
          goto LABEL_58;
        }
      }
      xpc_release(v24);
    }
LABEL_58:
    xpc_connection_send_message(remote_connection, v20);
LABEL_59:
    xpc_release(v20);
    return;
  }
  os_log_t v25 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v25 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v25;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_10001B510(a2);
  }
}

uint64_t sub_1000159E4(uint64_t a1, xpc_connection_t *a2, void *a3)
{
  if (a3 == &_xpc_error_termination_imminent)
  {
    os_log_t v6 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v6 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v6;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001B6B4(a2);
    }
  }
  else if (a3 == &_xpc_error_connection_interrupted)
  {
    os_log_t v7 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v7 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v7;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001B730(a2);
    }
  }
  else
  {
    os_log_t v5 = (os_log_t)off_100247BB0;
    if (a3 == &_xpc_error_connection_invalid)
    {
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v5 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*a2);
        v10[0] = 67174657;
        v10[1] = pid;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Client disconnecting (pid %{private}d)\n", (uint8_t *)v10, 8u);
      }
    }
    else
    {
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v5 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10001B7AC(a2);
      }
    }
  }
  return (*(uint64_t (**)(uint64_t, xpc_connection_t *))(*(void *)a1 + 48))(a1, a2);
}

void sub_100015C14()
{
}

void sub_100015D10(uint64_t a1, xpc_object_t object)
{
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    os_log_t v7 = *(xpc_connection_t **)(a1 + 40);
    sub_1000159E4(v4, v7, object);
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = *(void (**)(uint64_t, uint64_t, xpc_object_t))(*(void *)v4 + 64);
    v9(v4, v8, object);
  }
  else
  {
    os_log_t v6 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v6 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v6;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001B828(a1);
    }
  }
}

void sub_100015E34(uint64_t a1, void *a2)
{
  if (a2 == &_xpc_error_termination_imminent)
  {
    os_log_t v3 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v3 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v3;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10001B8A8();
    }
  }
  else if (a2 == &_xpc_error_connection_invalid)
  {
    os_log_t v4 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v4 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v4;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001B8DC();
    }
  }
  else if (a2 == &_xpc_error_connection_interrupted)
  {
    os_log_t v2 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v2 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v2;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10001B910();
    }
  }
}

void sub_100015F70(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
  {
    os_log_t v4 = string;
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5 == a1 + 8)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      do
      {
        uint64_t v8 = v5 + 8;
        uint64_t v5 = *(void *)(v5 + 8);
        uint64_t v7 = *(void *)(v8 + 8);
        if (!*(_DWORD *)(v7 + 8)) {
          uint64_t v6 = v7;
        }
      }
      while (v5 != a1 + 8);
    }
    size_t v9 = strlen(*(const char **)(a1 + 576));
    if (!strncmp(v4, *(const char **)(a1 + 576), v9))
    {
      if (!v6) {
        operator new();
      }
    }
    else
    {
      size_t v10 = strlen(*(const char **)(a1 + 584));
      if (!strncmp(v4, *(const char **)(a1 + 584), v10))
      {
        if (v6)
        {
          size_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)a1 + 48);
          v12(a1, v6);
        }
      }
      else
      {
        os_log_t v11 = (os_log_t)off_100247BB0;
        if (off_100247BB0 == &_os_log_default)
        {
          os_log_t v11 = os_log_create("com.apple.isp", "daemon");
          off_100247BB0 = v11;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10001B944((uint64_t)v4, v11);
        }
      }
    }
  }
}

uint64_t sub_10001613C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    os_log_t v2 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v2 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v2;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "collectDiagState";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s - Collecting ISP Sysdiagnose State\n", (uint8_t *)&v4, 0xCu);
      os_log_t v2 = (os_log_t)off_100247BB0;
    }
    if (v2 == (os_log_t)&_os_log_default)
    {
      os_log_t v2 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v2;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315650;
      uint64_t v5 = "collectDiagState";
      __int16 v6 = 2080;
      uint64_t v7 = "3.324";
      __int16 v8 = 2080;
      size_t v9 = "0";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s - Assistant Version %s.%s\n", (uint8_t *)&v4, 0x20u);
    }
  }
  return 0;
}

uint64_t sub_1000162B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2) {
    return 3758097101;
  }
  if (sub_100012710(v2)) {
    return 0;
  }
  if (sub_10000B5A8(*(void *)(a1 + 72)))
  {
    do
    {
      usleep(0x186A0u);
      os_log_t v4 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v4 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v4;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Camera powered on...waiting\n", v7, 2u);
      }
    }
    while ((sub_10000B5A8(*(void *)(a1 + 72)) & 1) != 0);
  }
  *(void *)(a1 + 48) = os_transaction_create();
  uint64_t v3 = sub_10000FB38(*(void *)(a1 + 72));
  os_release(*(void **)(a1 + 48));
  if (v3)
  {
    os_log_t v5 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v5 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v5;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001B9BC();
    }
  }
  return v3;
}

uint64_t sub_100016428(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = (CFArrayRef **)(a1 + 64);
  if (sub_10000A044((void *)(a1 + 64), (uint64_t)sub_100014168, 0) || !*v2)
  {
    os_log_t v3 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v3 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v3;
    }
    uint64_t v4 = 3758097088;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10001BA30();
    }
  }
  else
  {
    if (CFArrayGetCount(**v2))
    {
      unint64_t v6 = 0;
      do
      {
        CFNumberRef ValueAtIndex = CFArrayGetValueAtIndex(**(CFArrayRef **)(a1 + 64), v6);
        *(void *)(a1 + 72) = ValueAtIndex;
        if (!sub_100013D78((uint64_t)ValueAtIndex, (uint64_t)sub_100014170, a1)) {
          break;
        }
        *(void *)(a1 + 72) = 0;
        ++v6;
      }
      while (v6 < CFArrayGetCount(**(CFArrayRef **)(a1 + 64)));
    }
    if (*(void *)(a1 + 72))
    {
      uint64_t v4 = sub_1000162B4(a1);
      if (!v4)
      {
        *(void *)(a1 + 96) = os_state_add_handler();
        goto LABEL_7;
      }
    }
    else
    {
      os_log_t v8 = (os_log_t)off_100247BB0;
      if (off_100247BB0 == &_os_log_default)
      {
        os_log_t v8 = os_log_create("com.apple.isp", "daemon");
        off_100247BB0 = v8;
      }
      uint64_t v4 = 3758097088;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10001BAA8();
      }
    }
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1);
LABEL_7:
  kdebug_trace();
  return v4;
}

uint64_t sub_100016670(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t sub_10001668C(void *a1)
{
  uint64_t v2 = (const void **)a1[10];
  if (v2)
  {
    sub_10000A584(v2);
    operator delete();
  }
  uint64_t v3 = a1[9];
  if (v3)
  {
    sub_10000D0C4(v3);
    a1[9] = 0;
  }
  if (a1[12])
  {
    os_state_remove_handler();
    a1[12] = 0;
  }
  uint64_t v4 = a1[8];
  if (v4) {
    sub_10000A218(v4);
  }
  return 0;
}

uint64_t sub_100016704(uint64_t a1)
{
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  *(void *)(a1 + 608) = v2;
  if (v2)
  {
    dispatch_source_set_event_handler(v2, &stru_10002AF28);
    dispatch_resume(*(dispatch_object_t *)(a1 + 608));
    mach_service = xpc_connection_create_mach_service(*(const char **)(a1 + 552), *(dispatch_queue_t *)(a1 + 40), 1uLL);
    *(void *)(a1 + 32) = mach_service;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100016910;
    handler[3] = &unk_10002AF48;
    handler[4] = a1;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 32));
    unint64_t v6 = *(NSObject **)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_1000169F8;
    v7[3] = &unk_10002AF68;
    _OWORD v7[4] = a1;
    xpc_set_event_stream_handler("com.apple.iokit.matching", v6, v7);
    dispatch_main();
  }
  os_log_t v3 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v3 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001BB20();
  }
  return 3758097086;
}

void sub_100016888(id a1)
{
  os_log_t v1 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v1 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v1;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Received SIGTERM - exiting\n", v2, 2u);
  }
  exit(0);
}

void sub_100016910(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    os_log_t v5 = *(void (**)(uint64_t, xpc_object_t))(*(void *)v3 + 32);
    v5(v3, object);
  }
  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    os_log_t v4 = (os_log_t)off_100247BB0;
    if (off_100247BB0 == &_os_log_default)
    {
      os_log_t v4 = os_log_create("com.apple.isp", "daemon");
      off_100247BB0 = v4;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001BB54();
    }
  }
}

void sub_1000169F8(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    os_log_t v5 = *(void (**)(uint64_t, xpc_object_t))(*(void *)v3 + 72);
    v5(v3, object);
  }
  else
  {
    xpc_type_t type = xpc_get_type(object);
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      sub_100015E34((uint64_t)type, object);
    }
  }
}

uint64_t sub_100016AB0(uint64_t a1)
{
  *(void *)a1 = off_10002AF98;
  *(void *)(a1 + 8) = a1 + 8;
  *(void *)(a1 + 16) = a1 + 8;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 616) = 0;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 628) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  *(_OWORD *)(a1 + 536) = 0u;
  *(void *)(a1 + 552) = "com.apple.dietappleh16camerad";
  *(void *)(a1 + 560) = "com.apple.dietappleh16camerad.writer";
  *(void *)(a1 + 568) = "com.apple.dietappleh16camerad.assistant_active";
  *(void *)(a1 + 576) = "com.apple.dietappleh16camerad.launch";
  *(void *)(a1 + 584) = "com.apple.dietappleh16camerad.destroy";
  *(void *)(a1 + 592) = "com.apple.dietappleh16camerad.firmware_loading";
  *(void *)(a1 + 600) = "com.apple.dietappleh16camerad.photometerManagerSyncQueue";
  *(void *)(a1 + 608) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = dispatch_queue_create("com.apple.dietappleh16camerad", 0);
  *(void *)(a1 + 56) = dispatch_queue_create(*(const char **)(a1 + 560), 0);
  sub_10000A288(@"EnableHawking", @"com.apple.coremedia", 1);
  os_log_t v2 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v2 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v2;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_log_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Creating H16ISP services assistant\n", v4, 2u);
  }
  return a1;
}

void sub_100016C6C(_Unwind_Exception *a1)
{
  sub_100016DFC(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100016C84(uint64_t a1)
{
  *(void *)a1 = off_10002AF98;
  os_log_t v2 = (os_log_t)off_100247BB0;
  if (off_100247BB0 == &_os_log_default)
  {
    os_log_t v2 = os_log_create("com.apple.isp", "daemon");
    off_100247BB0 = v2;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Destroying H16ISP services assistant\n", v6, 2u);
  }
  uint64_t v3 = *(_xpc_connection_s **)(a1 + 32);
  if (v3)
  {
    xpc_connection_cancel(v3);
    xpc_release(*(xpc_object_t *)(a1 + 32));
  }
  os_log_t v4 = *(NSObject **)(a1 + 608);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(a1 + 608));
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  dispatch_sync(*(dispatch_queue_t *)(a1 + 56), &stru_10002B008);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  sub_100016DFC((void *)(a1 + 8));
  return a1;
}

void sub_100016DC4(uint64_t a1)
{
  sub_100016C84(a1);

  operator delete();
}

void *sub_100016DFC(void *result)
{
  if (result[2])
  {
    os_log_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        os_log_t v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

uint64_t sub_100016E60(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    os_log_t v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        uint64_t v7 = a4;
        do
        {
          uint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

void sub_100016ED8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

double sub_100016F24(double *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = (a3 - a2) / a6 - (a4 - a2) / (a6 + a7);
  double v9 = (a4 - a3) / a7;
  *(float *)&double v8 = v9 + v8;
  float v10 = (a5 - a4) / a8 + v9 - (a5 - a3) / (a7 + a8);
  *(float *)&double v8 = *(float *)&v8 * a7;
  float v11 = v10 * a7;
  double v12 = *(float *)&v8;
  double v13 = v11;
  *a1 = a3;
  a1[1] = v12;
  double v14 = a4 * 3.0 + a3 * -3.0 + v12 * -2.0 - v13;
  double result = a4 * -2.0 + a3 * 2.0 + v12 + v13;
  a1[2] = v14;
  a1[3] = result;
  return result;
}

double sub_100016FC8(double *a1, double *a2, double a3)
{
  sub_100016F24(v5, *a1, a1[1], a1[2], a1[3], a2[1] - *a2, a2[2] - a2[1], a2[3] - a2[2]);
  return v5[0] + a3 * (v5[1] + a3 * (v5[2] + v5[3] * a3));
}

void sub_100017028(double *a1, double *a2, double *a3, double a4, double a5)
{
  v10[0] = sub_100016FC8(a1, a3, a5);
  v10[1] = sub_100016FC8(a1 + 4, a3, a5);
  _DWORD v10[2] = sub_100016FC8(a1 + 8, a3, a5);
  v10[3] = sub_100016FC8(a1 + 12, a3, a5);
  sub_100016FC8(v10, a2, a4);
}

void sub_1000170F8(unsigned __int16 *a1, long double *a2, unsigned int a3)
{
  uint64_t v3 = a1[7];
  if (a1[7])
  {
    int v6 = 0;
    double v7 = (double)(*a1 + 1) * 0.5 + (double)(__int16)a1[8];
    uint64_t v8 = a1[6];
    double v9 = (double)(a1[1] + 1) * 0.5 + (double)(__int16)a1[9];
    double v10 = 0.0;
    do
    {
      if (a1[6])
      {
        unsigned int v11 = a1[4];
        double v12 = (double)(a1[5] + v6 * a1[3]) - v9;
        double v13 = v12 * v12;
        int v14 = a1[6];
        do
        {
          double v15 = sqrt(((double)v11 - v7) * ((double)v11 - v7) + v13);
          if (v15 > v10) {
            double v10 = v15;
          }
          v11 += a1[2];
          --v14;
        }
        while (v14);
      }
      ++v6;
    }
    while (v6 != v3);
    long double v16 = pow((double)a3 / 100.0, 0.25);
    uint64_t v17 = 0;
    do
    {
      if (v8)
      {
        unsigned int v18 = a1[4];
        int v19 = a1[2];
        unsigned int v20 = a1[5] + v17 * a1[3];
        double v21 = ((double)v20 - v9) * ((double)v20 - v9);
        long double v22 = acos(v16);
        uint64_t v23 = v8;
        xpc_object_t v24 = a2;
        double v25 = v10 / tan(v22);
        do
        {
          long double v26 = atan(sqrt(((double)v18 - v7) * ((double)v18 - v7) + v21) / v25);
          long double v27 = cos(v26);
          *v24++ = pow(v27, 4.0);
          v18 += v19;
          --v23;
        }
        while (v23);
      }
      ++v17;
      a2 += v8;
    }
    while (v17 != v3);
  }
}

uint64_t sub_1000172A8(uint64_t result, uint64_t a2, unsigned __int16 *a3, unsigned __int16 *a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  unsigned int v15 = a3[7];
  if (!a3[7]) {
    return result;
  }
  unsigned int v16 = 0;
  int v17 = a3[3];
  int v18 = a3[2];
  int v19 = a3[5];
  int v20 = a3[4];
  unsigned int v21 = a3[6];
  do
  {
    if (!v21) {
      goto LABEL_33;
    }
    unsigned int v22 = 0;
    double v23 = (double)(v19 + v16 * v17);
    do
    {
      double v24 = (double)(v20 + v22 * v18);
      uint64_t v25 = a4[20];
      if (a4[20])
      {
        uint64_t v26 = 0;
        LOWORD(a12) = *a4;
        *(float *)&a12 = (float)LODWORD(a12);
        while (v24 >= (float)(*(float *)&a4[2 * v26 + 28] * *(float *)&a12))
        {
          if (v25 == ++v26)
          {
            int v27 = a4[20];
            goto LABEL_12;
          }
        }
        int v27 = (unsigned __int16)v26;
      }
      else
      {
        int v27 = 0;
      }
LABEL_12:
      double v28 = (double)(v27 - 1);
      uint64_t v29 = a4[21];
      LOWORD(a12) = a4[1];
      *(float *)&a12 = (float)LODWORD(a12);
      if (a4[21])
      {
        uint64_t v30 = 0;
        while (v23 >= (float)(*(float *)&a4[2 * v30 + 170] * *(float *)&a12))
        {
          if (v29 == ++v30)
          {
            LOWORD(v30) = a4[21];
            break;
          }
        }
        if (!v27) {
          double v28 = 0.0;
        }
        if ((_WORD)v30)
        {
          double v31 = (double)((unsigned __int16)v30 - 1);
          goto LABEL_24;
        }
      }
      else if (!v27)
      {
        double v28 = 0.0;
      }
      double v31 = 0.0;
LABEL_24:
      if (v28 >= (double)((int)v25 - 2)) {
        double v28 = (double)((int)v25 - 2);
      }
      if (v31 >= (double)((int)v29 - 2)) {
        double v31 = (double)((int)v29 - 2);
      }
      unsigned int v32 = vcvtmd_u64_f64(v28);
      unsigned int v33 = vcvtmd_u64_f64(v31);
      unsigned int v34 = v32 + v33 * v25;
      LOBYTE(v28) = *(unsigned char *)(a2 + v34);
      LOBYTE(v12) = *(unsigned char *)(a2 + v34 + 1);
      double v12 = ((double)*(unint64_t *)&v12 + -128.0) * 0.125 * 0.0078125 + 1.0;
      unsigned int v35 = v32 + (v33 + 1) * v25;
      LOBYTE(v13) = *(unsigned char *)(a2 + v35);
      LOBYTE(v14) = *(unsigned char *)(a2 + v35 + 1);
      double v36 = ((double)*(unint64_t *)&v14 + -128.0) * 0.125 * 0.0078125 + 1.0;
      float v37 = (float)*a4;
      float v38 = roundf(*(float *)&a4[2 * v32 + 28] * v37);
      double v39 = roundf(*(float *)&a4[2 * v33 + 170] * *(float *)&a12);
      double v14 = roundf(*(float *)&a4[2 * v32 + 30] * v37);
      float v40 = roundf(*(float *)&a4[2 * v33 + 172] * *(float *)&a12);
      double v41 = v24 - v38;
      double v42 = v14 - v24;
      double v43 = (((double)*(unint64_t *)&v13 + -128.0) * 0.125 * 0.0078125 + 1.0) * v42 + v41 * v36;
      double v13 = v41 + v42;
      double v44 = fmin(((v40 - v23)* (((((double)*(unint64_t *)&v28 + -128.0) * 0.125 * 0.0078125 + 1.0) * v42 + v41 * v12)/ (v41 + v42))+ (v23 - v39) * (v43 / (v41 + v42)))/ (v23 - v39 + v40 - v23), 2.0);
      a12 = v44 * 4096.0;
      if (v44 <= 0.0) {
        double v45 = 0.0;
      }
      else {
        double v45 = v44 * 4096.0;
      }
      *(_WORD *)(result + 2 * (v22 + v21 * v16)) = llround(fmin(v45, 65535.0));
      ++v22;
      unsigned int v21 = a3[6];
    }
    while (v22 < v21);
    unsigned int v15 = a3[7];
LABEL_33:
    ++v16;
  }
  while (v16 < v15);
  return result;
}

uint64_t sub_100017548(uint64_t result, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, unsigned int a7, int a8)
{
  unsigned int v8 = *(unsigned __int16 *)(a5 + 14);
  if (*(_WORD *)(a5 + 14))
  {
    unsigned __int16 v9 = 0;
    unsigned int v10 = 0;
    unsigned int v11 = *(unsigned __int16 *)(a5 + 12);
    do
    {
      if (v11)
      {
        for (unsigned int i = 0; i < v11; ++i)
        {
          uint64_t v13 = i + v10 * v11;
          int v14 = 1 << a6;
          if (a8 != 2) {
            LOWORD(v14) = llround(fmin(*(double *)(a3 + 8 * v13) / *(double *)(a4 + 8 * v13) * (double)(1 << a6), (double)a7));
          }
          *(_WORD *)(result + 2 * v13) = v14;
          if ((unsigned __int16)v14 > v9) {
            unsigned __int16 v9 = v14;
          }
          unsigned int v11 = *(unsigned __int16 *)(a5 + 12);
        }
        unsigned int v8 = *(unsigned __int16 *)(a5 + 14);
      }
      ++v10;
    }
    while (v10 < v8);
  }
  else
  {
    unsigned __int16 v9 = 0;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_1000175E0(uint64_t result, unsigned __int16 *a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  unsigned int v6 = *(unsigned __int16 *)(a4 + 14);
  if (*(_WORD *)(a4 + 14))
  {
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    unsigned __int16 v9 = 0;
    unsigned int v10 = *(unsigned __int16 *)(a4 + 12);
    do
    {
      if (v10)
      {
        uint64_t v11 = 0;
        do
        {
          uint64_t v12 = v11 + v7 * v10;
          LOWORD(a6) = *(_WORD *)(result + 2 * v12);
          HIWORD(v13) = 17792;
          LOWORD(v13) = *(_WORD *)(a3 + 2 * v12);
          a6 = fmin((float)((float)((float)LODWORD(a6) * 4096.0) / (float)v13), 65535.0);
          unsigned int v14 = llround(a6);
          *(_WORD *)(result + 2 * v12) = v14;
          if (v9 <= v14) {
            unsigned __int16 v9 = v14;
          }
          unsigned int v10 = *(unsigned __int16 *)(a4 + 12);
          ++v11;
        }
        while (v11 < v10);
        unsigned int v6 = *(unsigned __int16 *)(a4 + 14);
      }
      ++v8;
      ++v7;
    }
    while (v8 < v6);
  }
  else
  {
    unsigned __int16 v9 = 0;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_100017680(uint64_t result, unsigned __int16 *a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int v5 = *(unsigned __int16 *)(a4 + 14);
  if (*(_WORD *)(a4 + 14))
  {
    uint64_t v6 = 0;
    unsigned __int16 v7 = 0;
    unsigned int v8 = 0;
    unsigned int v9 = *(unsigned __int16 *)(a4 + 12);
    do
    {
      if (v9)
      {
        uint64_t v10 = 0;
        do
        {
          uint64_t v11 = v10 + v6 * v9;
          unsigned int v12 = llround(fmin(1.0 / *(double *)(a3 + 8 * v11) * (double)(1 << a5), 65535.0));
          *(_WORD *)(result + 2 * v11) = v12;
          if (v7 <= v12) {
            unsigned __int16 v7 = v12;
          }
          unsigned int v9 = *(unsigned __int16 *)(a4 + 12);
          ++v10;
        }
        while (v10 < v9);
        unsigned int v5 = *(unsigned __int16 *)(a4 + 14);
      }
      ++v8;
      ++v6;
    }
    while (v8 < v5);
  }
  else
  {
    unsigned __int16 v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_100017718(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, unsigned __int16 *a7, unsigned __int16 *a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17)
{
  if (a3)
  {
    int v21 = 0;
    do
    {
      v61[v21] = *(_DWORD *)(a5 + 4 * v21);
      ++v21;
    }
    while (a3 > v21);
  }
  if (a4)
  {
    int v22 = 0;
    do
    {
      v61[v22 + 71] = *(_DWORD *)(a6 + 4 * v22);
      ++v22;
    }
    while (a4 > v22);
  }
  unsigned int v23 = a3 - 1;
  int64x2_t v55 = vdupq_n_s64(0x3F847AE147AE147BuLL);
  int v24 = a4 - 1;
  v65[0] = a1 + 18;
  v65[1] = a1 + 36;
  v65[2] = a1 + 54;
  v65[3] = a1 + 72;
  v54[0] = *(_WORD *)(a1 + 14) >> 1;
  int v25 = *(unsigned __int16 *)(a1 + 16) >> 1;
  v54[1] = *(_WORD *)(a1 + 16) >> 1;
  __int16 v58 = a3;
  __int16 v59 = a4;
  double v56 = 0.98 / (double)(int)(a3 - 1);
  double v57 = 0.98 / (double)(int)(a4 - 1);
  uint64_t v60 = 0x406F400000000000;
  v62[0] = v54[0];
  v62[1] = v25;
  int v63 = *(_DWORD *)(a1 + 20);
  LODWORD(v64) = *(_DWORD *)(a1 + 28);
  uint64_t v26 = *(unsigned __int16 *)(a1 + 32);
  HIDWORD(v64) = *(_DWORD *)(a1 + 32);
  uint64_t v27 = HIWORD(v64);
  sub_1000172A8(a17, a2, v62, v54, 0.98 / (double)v24, v56, (double)v24, a12, a13, a14, a15, a16);
  if (v27)
  {
    unint64_t v29 = 0;
    uint64_t v30 = a4 >> 1;
    uint64_t v31 = a17;
    do
    {
      if (v26)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (i < *a7 - 1 || i >= (unint64_t)a7[v23] || v29 > a8[v30 - 1] && v29 < a8[v30]) {
            *(_WORD *)(v31 + 2 * i) = 4096;
          }
        }
      }
      ++v29;
      v31 += 2 * v26;
    }
    while (v29 != v27);
  }
  unint64_t v33 = *a8;
  int v34 = v33 - 1;
  if (v33 > 1)
  {
    int64_t v35 = v33 - 2;
    double v36 = (_WORD *)(a17 + 2 * (int)v35 * (uint64_t)(int)v26);
    float v37 = (__int16 *)(a17 + 2 * v34 * (uint64_t)(int)v26);
    do
    {
      uint64_t v38 = v26;
      double v39 = v37;
      float v40 = v36;
      if (v26)
      {
        do
        {
          __int16 v41 = *v39++;
          *v40++ = v41;
          --v38;
        }
        while (v38);
      }
      v36 -= v26;
      v37 -= v26;
    }
    while (v35-- > 0);
  }
  uint64_t v43 = a8[v24];
  if (v43 < a4)
  {
    unint64_t v44 = a8[v24] * (unint64_t)v26;
    double v45 = (__int16 *)(a17 + 2 * ((int)v43 - 1) * (uint64_t)(int)v26);
    do
    {
      uint64_t v46 = v26;
      v47 = v45;
      unint64_t v48 = v44;
      if (v26)
      {
        do
        {
          __int16 v49 = *v47++;
          *(_WORD *)(a17 + 2 * v48++) = v49;
          --v46;
        }
        while (v46);
      }
      ++v43;
      v44 += v26;
      v45 += v26;
    }
    while (v43 != a4);
  }
  uint64_t v50 = 0;
  uint64_t v51 = a1 + 92;
  do
  {
    uint64_t v52 = v65[v50];
    int v63 = *(_DWORD *)(v52 + 2);
    double v64 = *(double *)(v52 + 10);
    uint64_t result = sub_1000175E0(v51 + 2 * *(unsigned __int16 *)(v52 + 6), (unsigned __int16 *)v52, a17, (uint64_t)v62, v64, v28);
    ++v50;
  }
  while (v50 != 4);
  return result;
}

uint64_t sub_100017A28(uint64_t result)
{
  uint64_t v1 = 0;
  v9[0] = result + 18;
  v9[1] = result + 36;
  v9[2] = result + 54;
  v9[3] = result + 72;
  do
  {
    uint64_t v2 = (unsigned __int16 *)v9[v1];
    int64_t v3 = ((unint64_t)(v2[7] * v2[8]) << 32) - 0x100000000;
    if (v3 >= 1)
    {
      uint64_t v4 = v2[3];
      unsigned int v5 = (_WORD *)(result + 92 + 2 * v4);
      unint64_t v6 = result + 90 + (((unint64_t)v3 >> 31) & 0x1FFFFFFFELL) + 2 * v4;
      do
      {
        __int16 v7 = *(_WORD *)(v6 + 2);
        *(_WORD *)(v6 + 2) = *v5;
        *v5++ = v7;
        BOOL v8 = v6 > (unint64_t)v5;
        v6 -= 2;
      }
      while (v8);
    }
    ++v1;
  }
  while (v1 != 4);
  return result;
}

unint64_t sub_100017AFC(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = a1[1] * *a1;
  uint64_t v5 = (v4 - 1);
  uint64_t v6 = a2 + v5;
  __int16 v7 = a1 + 264;
  BOOL v8 = &a1[v5 + 264];
  do
  {
    unsigned int v9 = v7;
    uint64_t v10 = v8;
    uint64_t v11 = a2;
    uint64_t v12 = v6;
    do
    {
      *(unsigned char *)(v11 + v2) = v10[v2];
      unint64_t result = v11 + v2 + 1;
      *(unsigned char *)(v12 + v2) = v9[v2];
      --v12;
      ++v11;
      --v10;
      ++v9;
    }
    while (v12 + v2 >= result);
    ++v3;
    v2 += v4;
  }
  while (v3 != 4);
  return result;
}

unsigned __int16 *sub_100017B74(unsigned __int16 *result)
{
  int v1 = result[16];
  if (v1 != result[43]) {
    sub_10001BBB4();
  }
  int v2 = result[17];
  if (v2 != result[44]) {
    sub_10001BB88();
  }
  unsigned int v3 = v2 * v1;
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = &result[result[39] + 46];
    uint64_t v6 = &result[result[12] + 46];
    do
    {
      unsigned int v7 = (*v5 + *v6) >> 1;
      *v6++ = v7;
      *v5++ = v7;
      ++v4;
    }
    while (v3 > (unsigned __int16)v4);
  }
  return result;
}

unint64_t sub_100017BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v8 = 0;
  unsigned int v9 = *(unsigned __int16 *)(a3 + 14);
  unsigned int v10 = *(unsigned __int16 *)(a3 + 16);
  v88[0] = a3 + 18;
  v88[1] = a3 + 36;
  v88[2] = a3 + 54;
  v88[3] = a3 + 72;
  memset(v87, 0, 32);
  do
  {
    v87[v8] = a3 + 92 + 2 * *(unsigned __int16 *)(v88[v8] + 6);
    ++v8;
  }
  while (v8 != 4);
  uint64_t v11 = 0;
  float v12 = (double)v9 * 0.5;
  float v13 = (double)v10 * 0.5;
  v86[0] = 0;
  v86[1] = v9;
  float v14 = (float)a5 + v12;
  float v15 = (float)a6 + v13;
  v86[2] = 0;
  v86[3] = v9;
  uint64_t v83 = 0;
  unsigned int v84 = v10;
  unsigned int v85 = v10;
  v82[0] = 0;
  v82[1] = 0;
  float v16 = 0.0;
  do
  {
    double v17 = (float)(v14 - (float)(int)v86[v11]);
    double v18 = (float)(v15 - (float)*(int *)((char *)&v83 + v11 * 4));
    float v19 = sqrt(v17 * v17 + v18 * v18);
    *(float *)((char *)v82 + v11 * 4) = v19;
    if (v16 < v19) {
      float v16 = v19;
    }
    ++v11;
  }
  while (v11 != 4);
  bzero(v81, 0x808uLL);
  bzero(v80, 0x404uLL);
  float v20 = log2f(v16 * 0.0039062);
  uint64_t v24 = 0;
  unsigned int v25 = vcvtps_s32_f32(v20);
  *(_WORD *)(a1 + 12) = v25;
  int v26 = v25 * v25;
  int v27 = v26 << 8;
  do
  {
    uint64_t v28 = 0;
    unint64_t result = v88[v24];
    unsigned int v30 = *(unsigned __int16 *)(result + 2);
    unsigned int v31 = *(unsigned __int16 *)(result + 4);
    double v32 = (double)v31;
    do
    {
      unsigned int v33 = 0;
      uint64_t v34 = 0;
      float v35 = (float)(int)v86[v28] - v14;
      float v36 = *((float *)v82 + v28);
      float v37 = (float)*((int *)&v83 + v28) - v15;
      do
      {
        if ((float)((float)v33 * 0.0039062) >= v16) {
          float v38 = v16;
        }
        else {
          float v38 = (float)v33 * 0.0039062;
        }
        double v39 = (float)(v14 + (float)((float)(v38 * v35) / v36)) * 0.5;
        unsigned int v40 = (int)(v39 / (double)v30);
        if ((v40 & 0x80000000) != 0) {
          break;
        }
        double v41 = (float)(v15 + (float)((float)(v38 * v37) / v36)) * 0.5;
        double v42 = v41 / v32;
        int v43 = (int)(v41 / v32);
        if (v43 < 0) {
          break;
        }
        int v44 = *(unsigned __int16 *)(result + 14);
        if (v44 - 2 < (int)v40) {
          break;
        }
        if (*(unsigned __int16 *)(result + 16) - 2 < v43) {
          break;
        }
        uint64_t v45 = v87[v24];
        uint64_t v46 = (_WORD *)(v45 + 2 * v44 * v43 + 2 * v40);
        LOWORD(v42) = *v46;
        LOWORD(v21) = v46[1];
        double v21 = (float)((float)LODWORD(v21) * 0.00024414);
        v47 = (_WORD *)(v45 + 2 * (v43 + 1) * v44 + 2 * v40);
        LOWORD(v22) = *v47;
        LOWORD(v23) = v47[1];
        double v48 = (float)((float)LODWORD(v23) * 0.00024414);
        int v49 = v40 * v30;
        double v23 = v39 - (double)v49;
        double v50 = (double)(int)(v30 + v49) - v39;
        double v51 = v50 * (float)((float)LODWORD(v22) * 0.00024414) + v23 * v48;
        double v22 = v23 + v50;
        v81[v34] = v81[v34]
                 + (((double)(int)((v43 + 1) * v31) - v41)
                  * ((v50 * (float)((float)LODWORD(v42) * 0.00024414) + v23 * v21)
                   / (v23 + v50))
                  + (v41 - (double)(int)(v43 * v31)) * (v51 / (v23 + v50)))
                 / (v41 - (double)(int)(v43 * v31) + (double)(int)((v43 + 1) * v31) - v41);
        ++v80[v34++];
        v33 += v27;
      }
      while (v34 != 257);
      ++v28;
    }
    while (v28 != 4);
    ++v24;
  }
  while (v24 != 4);
  for (uint64_t i = 0; i != 257; ++i)
  {
    int v53 = v80[i];
    double v54 = v81[i];
    if (v53 >= 1)
    {
      double v32 = (double)v53;
      double v54 = v54 / (double)v53;
      v81[i] = v54;
    }
    *(_WORD *)(a1 + 14 + 2 * i) = vcvtd_n_s64_f64(1.0 / v54, 0xCuLL);
  }
  if (a2)
  {
    uint64_t v55 = 0;
    double v56 = 0.0;
    double v57 = 0.0;
    do
    {
      uint64_t v58 = v88[v55];
      unint64_t v59 = *(unsigned __int16 *)(v58 + 14);
      uint64_t v60 = v87[v55];
      LOWORD(v32) = *(_WORD *)(v60 + 2 * (v59 >> 1));
      double v61 = (float)((float)LODWORD(v32) * 0.00024414);
      double v62 = v57 + v61;
      LODWORD(v58) = *(unsigned __int16 *)(v58 + 16);
      unint64_t result = (v58 - 1);
      LOWORD(v61) = *(_WORD *)(v60 + 2 * ((v59 >> 1) + result * v59));
      double v63 = (float)((float)LODWORD(v61) * 0.00024414);
      double v57 = v62 + v63;
      LODWORD(v58) = (v58 >> 1) * v59;
      LOWORD(v63) = *(_WORD *)(v60 + 2 * v58);
      double v64 = (float)((float)LODWORD(v63) * 0.00024414);
      double v65 = v56 + v64;
      LOWORD(v64) = *(_WORD *)(v60 + 2 * (v59 + v58 - 1));
      double v32 = (float)((float)LODWORD(v64) * 0.00024414);
      double v56 = v65 + v32;
      ++v55;
    }
    while (v55 != 4);
    int v66 = 0;
    uint64_t v67 = 0;
    double v68 = v57 * 0.125;
    double v69 = v56 * 0.125;
    while (v81[v67] <= v69)
    {
      ++v67;
      v66 -= v27;
      if (v67 == 257)
      {
        double v70 = v12;
        goto LABEL_35;
      }
    }
    double v70 = v12;
    if ((v67 - 1) <= 0xFF)
    {
      double v71 = v81[v67];
      double v72 = v81[(v67 - 1)];
      double v73 = 0.5;
      if (vabdd_f64(v71, v72) > 1.0e-10) {
        double v73 = (v69 - v72) / (v71 - v72);
      }
      double v70 = v73 * (float)((float)-v66 * 0.0039062)
          + (1.0 - v73) * (float)((float)-(v66 + (v26 << 8)) * 0.0039062);
    }
LABEL_35:
    int v74 = 0;
    uint64_t v75 = 0;
    while (v81[v75] <= v68)
    {
      ++v75;
      v74 -= v27;
      if (v75 == 257)
      {
        double v76 = v13;
        goto LABEL_43;
      }
    }
    double v76 = v13;
    if ((v75 - 1) <= 0xFF)
    {
      double v77 = v81[v75];
      double v78 = v81[(v75 - 1)];
      double v79 = 0.5;
      if (vabdd_f64(v77, v78) > 1.0e-10) {
        double v79 = (v68 - v78) / (v77 - v78);
      }
      double v76 = v79 * (float)((float)-v74 * 0.0039062)
          + (1.0 - v79) * (float)((float)-(v74 + (v26 << 8)) * 0.0039062);
    }
LABEL_43:
    *(_WORD *)(a2 + 12) = llround(fmin(v70 / v12 * 4096.0 + 0.5, 65535.0));
    *(_WORD *)(a2 + 14) = llround(fmin(v76 / v13 * 4096.0 + 0.5, 65535.0));
  }
  return result;
}

void sub_10001821C(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5, uint64_t a6, uint64_t a7, int a8, int a9, uint64_t a10, uint64_t a11)
{
  int v11 = *(unsigned __int16 *)(a1 + 14) >> 1;
  __int16 v27 = *(_WORD *)(a1 + 14) >> 1;
  int v12 = *(unsigned __int16 *)(a1 + 16) >> 1;
  __int16 v28 = *(_WORD *)(a1 + 16) >> 1;
  if (a8 >= 0) {
    unsigned int v13 = a8;
  }
  else {
    unsigned int v13 = a8 + 1;
  }
  __int16 v33 = v13 >> 1;
  __int16 v34 = a9 / 2;
  if (a3)
  {
    int v14 = 0;
    do
    {
      v26[v14] = *(_DWORD *)(a10 + 4 * v14);
      ++v14;
    }
    while (a3 > v14);
  }
  if (a4)
  {
    int v15 = 0;
    do
    {
      v26[v15 + 27] = *(_DWORD *)(a11 + 4 * v15);
      ++v15;
    }
    while (a4 > v15);
  }
  uint64_t v35 = a1 + 18;
  uint64_t v36 = a1 + 36;
  uint64_t v37 = a1 + 54;
  uint64_t v38 = a1 + 72;
  __int16 v19 = v11;
  __int16 v20 = v12;
  __int16 v23 = a3;
  __int16 v24 = a4;
  int32x2_t v16 = vadd_s32((int32x2_t)__PAIR64__(a4, a3), (int32x2_t)-1);
  v17.i64[0] = v16.i32[0];
  v17.i64[1] = v16.i32[1];
  int64x2_t v21 = vdupq_n_s64(0x3F847AE147AE147BuLL);
  float64x2_t v22 = vdivq_f64((float64x2_t)vdupq_n_s64(0x3FEF5C28F5C28F5CuLL), vcvtq_f64_s64(v17));
  double v25 = (double)(1 << (a5 - 8)) * 250.0;
  int v18 = *(_DWORD *)(a1 + 28);
  int v29 = *(_DWORD *)(a1 + 20);
  int v30 = v18;
  __int16 v31 = *(_WORD *)(a1 + 32);
  __int16 v32 = *(_WORD *)(a1 + 34);
  operator new[]();
}

void sub_10001851C(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  uint64_t v70 = a3[7];
  if (a3[7])
  {
    int v69 = a3[3];
    int v16 = a3[2];
    int v68 = a3[5];
    uint64_t v17 = a4 + 56;
    uint64_t v18 = a4 + 164;
    int v19 = a3[4];
    uint64_t v20 = a3[6];
    int v74 = v19;
    uint64_t v75 = a2 - 2;
    uint64_t v73 = v20;
    uint64_t v71 = 0;
    int v72 = v16;
    while (!v20)
    {
LABEL_50:
      if (++v71 == v70) {
        return;
      }
    }
    uint64_t v21 = 0;
    double v22 = (double)(v68 + v71 * v69);
    uint64_t v23 = *(unsigned __int16 *)(a4 + 40);
    uint64_t v24 = *(unsigned __int16 *)(a4 + 42);
    double v25 = -3.0;
    uint64_t v26 = v71 * v20;
    while (1)
    {
      double v27 = (double)(v19 + v21 * v16);
      if (v23)
      {
        uint64_t v28 = 0;
        LOWORD(v25) = *(_WORD *)a4;
        *(float *)&double v25 = (float)LODWORD(v25);
        while (v27 >= (float)(*(float *)(v17 + 4 * v28) * *(float *)&v25))
        {
          if (v23 == ++v28)
          {
            LOWORD(v28) = v23;
            if (v24) {
              goto LABEL_12;
            }
            goto LABEL_17;
          }
        }
        if (v24) {
          goto LABEL_12;
        }
      }
      else
      {
        LOWORD(v28) = 0;
        if (v24)
        {
LABEL_12:
          uint64_t v29 = 0;
          LOWORD(v25) = *(_WORD *)(a4 + 2);
          *(float *)&double v25 = (float)LODWORD(v25);
          while (v22 >= (float)(*(float *)(v18 + 4 * v29) * *(float *)&v25))
          {
            if (v24 == ++v29)
            {
              unsigned __int16 v30 = v24;
              goto LABEL_19;
            }
          }
          unsigned __int16 v30 = v29;
          goto LABEL_19;
        }
      }
LABEL_17:
      unsigned __int16 v30 = 0;
LABEL_19:
      uint64_t v31 = (unsigned __int16)v28;
      uint64_t v32 = (unsigned __int16)v28 - 1;
      double v33 = (double)(int)v32;
      unsigned int v34 = v30;
      uint64_t v35 = v30 - 1;
      double v36 = (double)(int)v35;
      if (v31 < 2
        || (signed int v37 = v34 - 2, v34 < 2)
        || ((double)v23 + -3.0 >= v33 ? (BOOL v38 = a5 == 0) : (BOOL v38 = 1),
            !v38 ? (BOOL v39 = (double)v24 + -3.0 < v36) : (BOOL v39 = 1),
            v39))
      {
        if (!v31) {
          double v33 = 0.0;
        }
        if (!v34) {
          double v36 = 0.0;
        }
        if (v33 >= (double)((int)v23 - 2)) {
          double v33 = (double)((int)v23 - 2);
        }
        if (v36 >= (double)((int)v24 - 2)) {
          double v36 = (double)((int)v24 - 2);
        }
        unsigned int v54 = vcvtmd_u64_f64(v33);
        unsigned int v55 = vcvtmd_u64_f64(v36);
        unsigned int v56 = v54 + v55 * v23;
        LOBYTE(v33) = *(unsigned char *)(a2 + v56);
        double v57 = *(double *)(a4 + 48);
        LOBYTE(a9) = *(unsigned char *)(a2 + v56 + 1);
        unsigned int v58 = v54 + (v55 + 1) * v23;
        LOBYTE(a10) = *(unsigned char *)(a2 + v58);
        LOBYTE(a11) = *(unsigned char *)(a2 + v58 + 1);
        LOWORD(a13) = *(_WORD *)a4;
        float v59 = (float)LODWORD(a13);
        float v60 = roundf(*(float *)(a4 + 56 + 4 * v54) * v59);
        LOWORD(v13) = *(_WORD *)(a4 + 2);
        float v61 = (float)LODWORD(v13);
        float v62 = roundf(*(float *)(a4 + 164 + 4 * v55) * v61);
        a13 = roundf(*(float *)(a4 + 56 + 4 * (v54 + 1)) * v59);
        double v13 = roundf(*(float *)(a4 + 164 + 4 * (v55 + 1)) * v61);
        double v63 = v27 - v60;
        double v64 = a13 - v27;
        double v65 = (double)*(unint64_t *)&a10 / v57 * v64 + v63 * ((double)*(unint64_t *)&a11 / v57);
        a11 = v63 + v64;
        a10 = v65 / (v63 + v64);
        double v66 = ((double)*(unint64_t *)&v33 / v57 * v64 + v63 * ((double)*(unint64_t *)&a9 / v57))
            / (v63 + v64);
        a9 = v13 - v22;
        double v67 = fmin(((v13 - v22) * v66 + (v22 - v62) * a10) / (v22 - v62 + v13 - v22), 1.0);
        double v25 = 1.0 / v57;
        if (v67 <= 1.0 / v57) {
          double v67 = 1.0 / v57;
        }
        *(double *)(a1 + 8 * (v26 + v21)) = v67;
      }
      else
      {
        uint64_t v40 = 0;
        double v41 = *(double *)(a4 + 48);
        uint64_t v42 = v37;
        int v43 = (unsigned char *)(v75 + v31 + (int)v23 * (uint64_t)v37);
        int v44 = v80;
        do
        {
          uint64_t v45 = 0;
          v79[v40] = *(float *)(a4 + 4 * (v40 + (int)v31 - 2) + 56);
          double v46 = *(float *)(a4 + 4 * (v40 + v42) + 164);
          v78[v40] = v46;
          v47 = v43;
          do
          {
            LOBYTE(v46) = *v47;
            double v46 = (double)*(unint64_t *)&v46 / v41;
            v44[v45] = v46;
            v47 += v23;
            ++v45;
          }
          while (v45 != 4);
          ++v40;
          ++v43;
          v44 += 4;
        }
        while (v40 != 4);
        LOWORD(v46) = *(_WORD *)a4;
        double v48 = v27 / (double)*(unint64_t *)&v46;
        float v49 = *(float *)(a4 + 56 + 4 * v32);
        double v50 = v48 - v49;
        *(double *)&unint64_t v51 = (float)(*(float *)(a4 + 56 + 4 * v31) - v49);
        double v52 = v50 / *(double *)&v51;
        LOWORD(v51) = *(_WORD *)(a4 + 2);
        sub_100017028(v80, v79, v78, v52, (v22 / (double)v51 - *(float *)(a4 + 164 + 4 * v35))/ (float)(*(float *)(a4 + 164 + 4 * v34) - *(float *)(a4 + 164 + 4 * v35)));
        double v25 = 1.0 / v41;
        if (v53 >= 1.0)
        {
          int v16 = v72;
          uint64_t v20 = v73;
          int v19 = v74;
          if (v25 < 1.0) {
            double v25 = 1.0;
          }
        }
        else
        {
          int v16 = v72;
          uint64_t v20 = v73;
          int v19 = v74;
          if (v53 > v25) {
            double v25 = v53;
          }
        }
        *(double *)(a1 + 8 * (v26 + v21)) = v25;
      }
      if (++v21 == v20) {
        goto LABEL_50;
      }
    }
  }
}

void sub_1000189A0(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5, uint64_t a6, uint64_t a7, int a8, int a9, uint64_t a10, uint64_t a11)
{
  int v11 = *(unsigned __int16 *)(a1 + 14) >> 1;
  __int16 v27 = *(_WORD *)(a1 + 14) >> 1;
  int v12 = *(unsigned __int16 *)(a1 + 16) >> 1;
  __int16 v28 = *(_WORD *)(a1 + 16) >> 1;
  if (a8 >= 0) {
    unsigned int v13 = a8;
  }
  else {
    unsigned int v13 = a8 + 1;
  }
  __int16 v33 = v13 >> 1;
  __int16 v34 = a9 / 2;
  if (a3)
  {
    int v14 = 0;
    do
    {
      v26[v14] = *(_DWORD *)(a10 + 4 * v14);
      ++v14;
    }
    while (a3 > v14);
  }
  if (a4)
  {
    int v15 = 0;
    do
    {
      v26[v15 + 27] = *(_DWORD *)(a11 + 4 * v15);
      ++v15;
    }
    while (a4 > v15);
  }
  uint64_t v35 = a1 + 18;
  uint64_t v36 = a1 + 36;
  uint64_t v37 = a1 + 54;
  uint64_t v38 = a1 + 72;
  __int16 v19 = v11;
  __int16 v20 = v12;
  __int16 v23 = a3;
  __int16 v24 = a4;
  int32x2_t v16 = vadd_s32((int32x2_t)__PAIR64__(a4, a3), (int32x2_t)-1);
  v17.i64[0] = v16.i32[0];
  v17.i64[1] = v16.i32[1];
  int64x2_t v21 = vdupq_n_s64(0x3F847AE147AE147BuLL);
  float64x2_t v22 = vdivq_f64((float64x2_t)vdupq_n_s64(0x3FEF5C28F5C28F5CuLL), vcvtq_f64_s64(v17));
  double v25 = (double)(1 << (a5 - 8)) * 250.0;
  int v18 = *(_DWORD *)(a1 + 28);
  int v29 = *(_DWORD *)(a1 + 20);
  int v30 = v18;
  __int16 v31 = *(_WORD *)(a1 + 32);
  __int16 v32 = *(_WORD *)(a1 + 34);
  operator new[]();
}

uint64_t sub_100018CA0(uint64_t result, uint64_t a2, unsigned __int16 *a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  uint64_t v70 = a3[7];
  if (a3[7])
  {
    uint64_t v71 = 0;
    uint64_t v72 = result;
    int v69 = a3[3];
    int v15 = a3[2];
    int v68 = a3[5];
    uint64_t v16 = a4 + 56;
    uint64_t v17 = a4 + 164;
    uint64_t v75 = a2 - 4;
    int v76 = v15;
    int v18 = a3[4];
    uint64_t v19 = a3[6];
    uint64_t v73 = v19;
    int v74 = v18;
    while (!v19)
    {
LABEL_50:
      if (++v71 == v70) {
        return result;
      }
    }
    uint64_t v20 = 0;
    double v21 = (double)(v68 + v71 * v69);
    uint64_t v22 = *(unsigned __int16 *)(a4 + 40);
    uint64_t v23 = *(unsigned __int16 *)(a4 + 42);
    double v24 = -3.0;
    uint64_t v25 = v71 * v19;
    uint64_t v26 = 2 * v22;
    while (1)
    {
      double v27 = (double)(v18 + v20 * v15);
      if (v22)
      {
        uint64_t v28 = 0;
        LOWORD(v24) = *(_WORD *)a4;
        *(float *)&double v24 = (float)LODWORD(v24);
        while (v27 >= (float)(*(float *)(v16 + 4 * v28) * *(float *)&v24))
        {
          if (v22 == ++v28)
          {
            LOWORD(v28) = v22;
            if (v23) {
              goto LABEL_12;
            }
            goto LABEL_17;
          }
        }
        if (v23) {
          goto LABEL_12;
        }
      }
      else
      {
        LOWORD(v28) = 0;
        if (v23)
        {
LABEL_12:
          uint64_t v29 = 0;
          LOWORD(v24) = *(_WORD *)(a4 + 2);
          *(float *)&double v24 = (float)LODWORD(v24);
          while (v21 >= (float)(*(float *)(v17 + 4 * v29) * *(float *)&v24))
          {
            if (v23 == ++v29)
            {
              unsigned __int16 v30 = v23;
              goto LABEL_19;
            }
          }
          unsigned __int16 v30 = v29;
          goto LABEL_19;
        }
      }
LABEL_17:
      unsigned __int16 v30 = 0;
LABEL_19:
      unsigned int v31 = (unsigned __int16)v28;
      uint64_t v32 = (unsigned __int16)v28 - 1;
      double v33 = (double)(int)v32;
      unsigned int v34 = v30;
      uint64_t v35 = v30 - 1;
      double v36 = (double)(int)v35;
      if (v31 < 2
        || (signed int v37 = v34 - 2, v34 < 2)
        || ((double)v22 + -3.0 >= v33 ? (BOOL v38 = a5 == 0) : (BOOL v38 = 1),
            !v38 ? (BOOL v39 = (double)v23 + -3.0 < v36) : (BOOL v39 = 1),
            v39))
      {
        if (!v31) {
          double v33 = 0.0;
        }
        if (!v34) {
          double v36 = 0.0;
        }
        if (v33 >= (double)((int)v22 - 2)) {
          double v33 = (double)((int)v22 - 2);
        }
        if (v36 >= (double)((int)v23 - 2)) {
          double v36 = (double)((int)v23 - 2);
        }
        unsigned int v54 = vcvtmd_u64_f64(v33);
        unsigned int v55 = vcvtmd_u64_f64(v36);
        unsigned int v56 = v54 + v55 * v22;
        LOWORD(v33) = *(_WORD *)(a2 + 2 * v56);
        double v57 = *(double *)(a4 + 48);
        LOWORD(a9) = *(_WORD *)(a2 + 2 * (v56 + 1));
        unsigned int v58 = v54 + (v55 + 1) * v22;
        LOWORD(a10) = *(_WORD *)(a2 + 2 * v58);
        LOWORD(a11) = *(_WORD *)(a2 + 2 * (v58 + 1));
        LOWORD(a13) = *(_WORD *)a4;
        float v59 = (float)LODWORD(a13);
        float v60 = roundf(*(float *)(a4 + 56 + 4 * v54) * v59);
        LOWORD(v13) = *(_WORD *)(a4 + 2);
        float v61 = (float)LODWORD(v13);
        float v62 = roundf(*(float *)(a4 + 164 + 4 * v55) * v61);
        a13 = roundf(*(float *)(a4 + 56 + 4 * (v54 + 1)) * v59);
        double v13 = roundf(*(float *)(a4 + 164 + 4 * (v55 + 1)) * v61);
        double v63 = v27 - v60;
        double v64 = a13 - v27;
        double v65 = (double)*(unint64_t *)&a10 / v57 * v64 + v63 * ((double)*(unint64_t *)&a11 / v57);
        a11 = v63 + v64;
        a10 = v65 / (v63 + v64);
        double v66 = ((double)*(unint64_t *)&v33 / v57 * v64 + v63 * ((double)*(unint64_t *)&a9 / v57))
            / (v63 + v64);
        a9 = v13 - v21;
        double v67 = fmin(((v13 - v21) * v66 + (v21 - v62) * a10) / (v21 - v62 + v13 - v21), 1.0);
        double v24 = 1.0 / v57;
        if (v67 <= 1.0 / v57) {
          double v67 = 1.0 / v57;
        }
        *(double *)(result + 8 * (v25 + v20)) = v67;
      }
      else
      {
        uint64_t v40 = 0;
        double v41 = *(double *)(a4 + 48);
        uint64_t v42 = v37;
        int v43 = (_WORD *)(v75 + 2 * v31 + (int)v26 * (uint64_t)v37);
        int v44 = v81;
        do
        {
          uint64_t v45 = 0;
          v80[v40] = *(float *)(a4 + 4 * (v40 + (int)(v31 - 2)) + 56);
          double v46 = *(float *)(a4 + 4 * (v40 + v42) + 164);
          v79[v40] = v46;
          v47 = v43;
          do
          {
            LOWORD(v46) = *v47;
            double v46 = (double)*(unint64_t *)&v46 / v41;
            v44[v45] = v46;
            v47 = (_WORD *)((char *)v47 + v26);
            ++v45;
          }
          while (v45 != 4);
          ++v40;
          ++v43;
          v44 += 4;
        }
        while (v40 != 4);
        LOWORD(v46) = *(_WORD *)a4;
        double v48 = v27 / (double)*(unint64_t *)&v46;
        float v49 = *(float *)(a4 + 56 + 4 * v32);
        double v50 = v48 - v49;
        *(double *)&unint64_t v51 = (float)(*(float *)(a4 + 56 + 4 * v31) - v49);
        double v52 = v50 / *(double *)&v51;
        LOWORD(v51) = *(_WORD *)(a4 + 2);
        sub_100017028(v81, v80, v79, v52, (v21 / (double)v51 - *(float *)(a4 + 164 + 4 * v35))/ (float)(*(float *)(a4 + 164 + 4 * v34) - *(float *)(a4 + 164 + 4 * v35)));
        double v24 = 1.0 / v41;
        if (v53 >= 1.0)
        {
          unint64_t result = v72;
          uint64_t v19 = v73;
          int v15 = v76;
          int v18 = v74;
          if (v24 < 1.0) {
            double v24 = 1.0;
          }
        }
        else
        {
          unint64_t result = v72;
          uint64_t v19 = v73;
          int v15 = v76;
          int v18 = v74;
          if (v53 > v24) {
            double v24 = v53;
          }
        }
        *(double *)(result + 8 * (v25 + v20)) = v24;
      }
      if (++v20 == v19) {
        goto LABEL_50;
      }
    }
  }
  return result;
}

void sub_100019130(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, int a7, int __e)
{
  int v8 = *(unsigned __int16 *)(a1 + 14) >> 1;
  __int16 v23 = *(_WORD *)(a1 + 14) >> 1;
  int v9 = *(unsigned __int16 *)(a1 + 16) >> 1;
  __int16 v24 = *(_WORD *)(a1 + 16) >> 1;
  if (a3)
  {
    int v10 = 0;
    do
    {
      v22[v10] = *(_DWORD *)(a5 + 4 * v10);
      ++v10;
    }
    while (a3 > v10);
  }
  if (a4)
  {
    int v11 = 0;
    do
    {
      v22[v11 + 17] = *(_DWORD *)(a6 + 4 * v11);
      ++v11;
    }
    while (a4 > v11);
  }
  uint64_t v29 = a1 + 18;
  uint64_t v30 = a1 + 36;
  uint64_t v31 = a1 + 54;
  uint64_t v32 = a1 + 72;
  uint64_t v33 = a1 + 90;
  uint64_t v34 = a1 + 108;
  uint64_t v35 = a1 + 126;
  uint64_t v36 = a1 + 144;
  uint64_t v37 = a1 + 162;
  uint64_t v38 = a1 + 180;
  uint64_t v39 = a1 + 198;
  uint64_t v40 = a1 + 216;
  uint64_t v41 = a1 + 234;
  uint64_t v42 = a1 + 252;
  uint64_t v43 = a1 + 270;
  uint64_t v44 = a1 + 288;
  __int16 v15 = v8;
  __int16 v16 = v9;
  int64x2_t v17 = vdupq_n_s64(0x3F847AE147AE147BuLL);
  __int16 v19 = a3;
  __int16 v20 = a4;
  int32x2_t v12 = vadd_s32((int32x2_t)__PAIR64__(a4, a3), (int32x2_t)-1);
  v13.i64[0] = v12.i32[0];
  v13.i64[1] = v12.i32[1];
  float64x2_t v18 = vdivq_f64((float64x2_t)vdupq_n_s64(0x3FEF5C28F5C28F5CuLL), vcvtq_f64_s64(v13));
  double v21 = ldexp(1.0, __e) * 128.0;
  int v14 = *(_DWORD *)(v29 + 10);
  int v25 = *(_DWORD *)(v29 + 2);
  int v26 = v14;
  __int16 v27 = *(_WORD *)(v29 + 14);
  __int16 v28 = *(_WORD *)(v29 + 16);
  operator new[]();
}

uint64_t sub_1000194B8(uint64_t result, uint64_t a2, unsigned __int16 *a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v71 = a3[7];
  if (a3[7])
  {
    uint64_t v72 = 0;
    int v70 = a3[3];
    int v13 = a3[2];
    uint64_t v14 = a4 + 56;
    uint64_t v15 = a4 + 124;
    uint64_t v76 = a2 - 4;
    int v77 = v13;
    int v69 = a3[5];
    int v16 = a3[4];
    uint64_t v17 = a3[6];
    uint64_t v74 = v17;
    int v75 = v16;
    uint64_t v73 = result;
    while (!v17)
    {
LABEL_44:
      if (++v72 == v71) {
        return result;
      }
    }
    uint64_t v18 = 0;
    double v19 = (double)(v69 + v72 * v70);
    uint64_t v20 = *(unsigned __int16 *)(a4 + 40);
    uint64_t v21 = *(unsigned __int16 *)(a4 + 42);
    double v22 = -3.0;
    uint64_t v23 = v72 * v17;
    uint64_t v24 = 2 * v20;
    while (1)
    {
      double v25 = (double)(v16 + v18 * v13);
      if (v20)
      {
        uint64_t v26 = 0;
        LOWORD(v22) = *(_WORD *)a4;
        *(float *)&double v22 = (float)LODWORD(v22);
        while (v25 >= (float)(*(float *)(v14 + 4 * v26) * *(float *)&v22))
        {
          if (v20 == ++v26)
          {
            LOWORD(v26) = v20;
            if (v21) {
              goto LABEL_12;
            }
            goto LABEL_17;
          }
        }
        if (v21) {
          goto LABEL_12;
        }
      }
      else
      {
        LOWORD(v26) = 0;
        if (v21)
        {
LABEL_12:
          uint64_t v27 = 0;
          LOWORD(v22) = *(_WORD *)(a4 + 2);
          *(float *)&double v22 = (float)LODWORD(v22);
          while (v19 >= (float)(*(float *)(v15 + 4 * v27) * *(float *)&v22))
          {
            if (v21 == ++v27)
            {
              unsigned __int16 v28 = v21;
              goto LABEL_19;
            }
          }
          unsigned __int16 v28 = v27;
          goto LABEL_19;
        }
      }
LABEL_17:
      unsigned __int16 v28 = 0;
LABEL_19:
      unsigned int v29 = (unsigned __int16)v26;
      uint64_t v30 = (unsigned __int16)v26 - 1;
      double v31 = (double)(int)v30;
      unsigned int v32 = v28;
      uint64_t v33 = v28 - 1;
      double v34 = (double)(int)v33;
      if (v29 < 2
        || (signed int v35 = v32 - 2, v32 < 2)
        || ((double)v20 + -3.0 >= v31 ? (BOOL v36 = (double)v21 + -3.0 < v34) : (BOOL v36 = 1), v36))
      {
        if (!v29) {
          double v31 = 0.0;
        }
        if (!v32) {
          double v34 = 0.0;
        }
        if (v31 >= (double)((int)v20 - 2)) {
          double v31 = (double)((int)v20 - 2);
        }
        unsigned int v51 = vcvtmd_u64_f64(v31);
        if (v34 >= (double)((int)v21 - 2)) {
          double v52 = (double)((int)v21 - 2);
        }
        else {
          double v52 = v34;
        }
        unsigned int v53 = vcvtmd_u64_f64(v52);
        unsigned int v54 = v51 + v53 * v20;
        LOWORD(v52) = *(_WORD *)(a2 + 2 * v54);
        double v55 = *(double *)(a4 + 48);
        double v56 = (double)*(unint64_t *)&v52 / v55;
        LOWORD(a8) = *(_WORD *)(a2 + 2 * (v54 + 1));
        double v57 = (double)*(unint64_t *)&a8 / v55;
        unsigned int v58 = v51 + (v53 + 1) * v20;
        LOWORD(a9) = *(_WORD *)(a2 + 2 * v58);
        double v59 = (double)*(unint64_t *)&a9 / v55;
        LOWORD(a10) = *(_WORD *)(a2 + 2 * (v58 + 1));
        double v60 = (double)*(unint64_t *)&a10 / v55;
        LOWORD(a11) = *(_WORD *)a4;
        float v61 = (float)LODWORD(a11);
        float v62 = roundf(*(float *)(a4 + 56 + 4 * v51) * v61);
        LOWORD(v11) = *(_WORD *)(a4 + 2);
        float v63 = (float)LODWORD(v11);
        double v64 = roundf(*(float *)(a4 + 124 + 4 * v53) * v63);
        a11 = roundf(*(float *)(a4 + 56 + 4 * (v51 + 1)) * v61);
        double v11 = roundf(*(float *)(a4 + 124 + 4 * (v53 + 1)) * v63);
        a10 = v25 - v62;
        double v65 = a11 - v25;
        double v66 = v59 * v65 + a10 * v60;
        a9 = a10 + v65;
        double v67 = v66 / (a10 + v65);
        double v68 = (v56 * v65 + a10 * v57) / (a10 + v65);
        a8 = v11 - v19;
        double v22 = v19 - v64 + v11 - v19;
        *(double *)(result + 8 * (v23 + v18)) = fmax(fmin(((v11 - v19) * v68 + (v19 - v64) * v67) / v22, 2.0), 0.5);
      }
      else
      {
        uint64_t v37 = 0;
        double v38 = *(double *)(a4 + 48);
        uint64_t v39 = v35;
        uint64_t v40 = (_WORD *)(v76 + 2 * v29 + (int)v24 * (uint64_t)v35);
        uint64_t v41 = v81;
        do
        {
          uint64_t v42 = 0;
          v80[v37] = *(float *)(a4 + 4 * (v37 + (int)(v29 - 2)) + 56);
          double v43 = *(float *)(a4 + 4 * (v37 + v39) + 124);
          v79[v37] = v43;
          uint64_t v44 = v40;
          do
          {
            LOWORD(v43) = *v44;
            double v43 = (double)*(unint64_t *)&v43 / v38;
            v41[v42] = v43;
            uint64_t v44 = (_WORD *)((char *)v44 + v24);
            ++v42;
          }
          while (v42 != 4);
          ++v37;
          ++v40;
          v41 += 4;
        }
        while (v37 != 4);
        LOWORD(v38) = *(_WORD *)a4;
        double v45 = v25 / (double)*(unint64_t *)&v38;
        float v46 = *(float *)(a4 + 56 + 4 * v30);
        double v47 = v45 - v46;
        *(double *)&unint64_t v48 = (float)(*(float *)(a4 + 56 + 4 * v29) - v46);
        double v49 = v47 / *(double *)&v48;
        LOWORD(v48) = *(_WORD *)(a4 + 2);
        sub_100017028(v81, v80, v79, v49, (v19 / (double)v48 - *(float *)(a4 + 124 + 4 * v33))/ (float)(*(float *)(a4 + 124 + 4 * v32) - *(float *)(a4 + 124 + 4 * v33)));
        double v22 = 2.0;
        if (v50 < 2.0)
        {
          double v22 = 0.5;
          if (v50 > 0.5) {
            double v22 = v50;
          }
        }
        unint64_t result = v73;
        uint64_t v17 = v74;
        *(double *)(v73 + 8 * (v23 + v18)) = v22;
        int v13 = v77;
        int v16 = v75;
      }
      if (++v18 == v17) {
        goto LABEL_44;
      }
    }
  }
  return result;
}

void sub_100019924(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, int a7, int __e)
{
  int v8 = *(unsigned __int16 *)(a1 + 14) >> 1;
  __int16 v23 = *(_WORD *)(a1 + 14) >> 1;
  int v9 = *(unsigned __int16 *)(a1 + 16) >> 1;
  __int16 v24 = *(_WORD *)(a1 + 16) >> 1;
  if (a3)
  {
    int v10 = 0;
    do
    {
      v22[v10] = *(_DWORD *)(a5 + 4 * v10);
      ++v10;
    }
    while (a3 > v10);
  }
  if (a4)
  {
    int v11 = 0;
    do
    {
      v22[v11 + 17] = *(_DWORD *)(a6 + 4 * v11);
      ++v11;
    }
    while (a4 > v11);
  }
  uint64_t v29 = a1 + 18;
  uint64_t v30 = a1 + 36;
  uint64_t v31 = a1 + 54;
  uint64_t v32 = a1 + 72;
  uint64_t v33 = a1 + 90;
  uint64_t v34 = a1 + 108;
  uint64_t v35 = a1 + 126;
  uint64_t v36 = a1 + 144;
  uint64_t v37 = a1 + 162;
  uint64_t v38 = a1 + 180;
  uint64_t v39 = a1 + 198;
  uint64_t v40 = a1 + 216;
  uint64_t v41 = a1 + 234;
  uint64_t v42 = a1 + 252;
  uint64_t v43 = a1 + 270;
  uint64_t v44 = a1 + 288;
  __int16 v15 = v8;
  __int16 v16 = v9;
  int64x2_t v17 = vdupq_n_s64(0x3F847AE147AE147BuLL);
  __int16 v19 = a3;
  __int16 v20 = a4;
  int32x2_t v12 = vadd_s32((int32x2_t)__PAIR64__(a4, a3), (int32x2_t)-1);
  v13.i64[0] = v12.i32[0];
  v13.i64[1] = v12.i32[1];
  float64x2_t v18 = vdivq_f64((float64x2_t)vdupq_n_s64(0x3FEF5C28F5C28F5CuLL), vcvtq_f64_s64(v13));
  double v21 = ldexp(1.0, __e) * 128.0;
  int v14 = *(_DWORD *)(v29 + 10);
  int v25 = *(_DWORD *)(v29 + 2);
  int v26 = v14;
  __int16 v27 = *(_WORD *)(v29 + 14);
  __int16 v28 = *(_WORD *)(v29 + 16);
  operator new[]();
}

void sub_100019CB8()
{
  int v0 = 136315138;
  int v1 = "SetupDeviceController";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s - IONotificationPortCreate returned NULL\n", (uint8_t *)&v0, 0xCu);
}

void sub_100019D40()
{
  int v0 = 136315138;
  int v1 = "SetupDeviceController";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s - IONotificationPortGetRunLoopSource returned NULL\n", (uint8_t *)&v0, 0xCu);
}

void sub_100019DC8(unsigned __int8 *a1)
{
  int v1 = *a1;
  int v2 = 136315394;
  unsigned int v3 = "SetupDeviceController";
  __int16 v4 = 1024;
  int v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s - Timed out waiting for the driver to register service, deviceArrived = %d\n", (uint8_t *)&v2, 0x12u);
}

void sub_100019E60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019ED8(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "sendMessageSync";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s - received reply\n", (uint8_t *)&v1, 0xCu);
}

void sub_100019F5C()
{
  v1[0] = 136315394;
  sub_10000A030();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s - received error reply: %s\n", (uint8_t *)v1, 0x16u);
}

void sub_100019FDC(const __CFString *a1, NSObject *a2)
{
  int v3 = 136315394;
  __int16 v4 = "LoadFrontIRHPRFile";
  __int16 v5 = 2080;
  CStringPtr = CFStringGetCStringPtr(a1, 0);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - [error]: %s\n", (uint8_t *)&v3, 0x16u);
}

void sub_10001A080(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "LoadFrontIRHPRFile";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - noHPR boot-arg set\n", (uint8_t *)&v1, 0xCu);
}

void sub_10001A104(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to begin server for isp\n", v1, 2u);
}

void sub_10001A148(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to initialize services\n", v1, 2u);
}

void sub_10001A18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A244()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - Error: resetting device config cache - res: 0x%08X\n", v1, v2, v3, v4, 2u);
}

void sub_10001A2C0()
{
  v2[0] = 136315650;
  sub_100014084();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s - Error getting channel info - chan: %d, res: 0x%08X\n", (uint8_t *)v2, 0x18u);
}

void sub_10001A350()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - Error getting config - res: 0x%08X\n", v1, v2, v3, v4, 2u);
}

void sub_10001A3CC(int a1, int a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "UpdateChannelConfigCache channel %d error: 0x%08X\n", (uint8_t *)v2, 0xEu);
}

void sub_10001A458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to fetch handle for %s with return code = 0x%08x\n", a5, a6, a7, a8, 2u);
}

void sub_10001A4DC()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - ISP_GetCameraStatus error (0x%08x)\n", v1, v2, v3, v4, 2u);
}

void sub_10001A558()
{
  sub_100014154();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - Did not find platform-info for platform:%d. Defaulting to 0\n", v1, v2, v3, v4, 2u);
}

void sub_10001A5D8(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_10001413C((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "Error: SetSensorCustomSettings returned an error: 0x%08X\n", a1);
}

void sub_10001A61C(unsigned char *a1, unsigned char *a2)
{
  sub_100014110(a1, a2);
  sub_1000140D0((void *)&_mh_execute_header, &_os_log_default, v2, "Error parsing camera clock override file\n", v3);
}

void sub_10001A650(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_10001413C((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "Error setting FW property: 0x%08x\n", a1);
}

void sub_10001A694(unsigned char *a1, unsigned char *a2)
{
  sub_100014110(a1, a2);
  sub_1000140D0((void *)&_mh_execute_header, &_os_log_default, v2, "Error: too many camera sensor register over-rides in file\n", v3);
}

void sub_10001A6C8(uint8_t *a1, _DWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = -536870165;
  sub_10001413C((void *)&_mh_execute_header, &_os_log_default, a3, "LoadSetFile returned 0x%08x - ignoring error\n", a1);
}

void sub_10001A714(uint8_t *buf, void *a2)
{
  *(_DWORD *)long long buf = 136315138;
  *a2 = "ISP_PowerOnCamera";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s - FTC gain buffer allocation failed\n", buf, 0xCu);
}

void sub_10001A768()
{
  __assert_rtn("ISP_PowerOnCamera", "H16ISPDevice.cpp", 10921, "kCICMaxPerModuleX >= numXCIC");
}

void sub_10001A794()
{
  __assert_rtn("ISP_PowerOnCamera", "H16ISPDevice.cpp", 10922, "kCICMaxPerModuleY >= numYCIC");
}

void sub_10001A7C0(unsigned char *a1, unsigned char *a2)
{
  sub_100014110(a1, a2);
  sub_1000140D0((void *)&_mh_execute_header, &_os_log_default, v2, "No ALS2 profile found in Setfile\n", v3);
}

void sub_10001A7F4(unsigned char *a1, unsigned char *a2)
{
  sub_100014110(a1, a2);
  sub_1000140D0((void *)&_mh_execute_header, &_os_log_default, v2, "could not read sensor SetFile\n", v3);
}

void sub_10001A828()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - ISP_GetNumChannels failed with 0x%08x\n", v1, v2, v3, v4, 2u);
}

void sub_10001A8A4()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - Error %x loading FW\n", v1, v2, v3, v4, 2u);
}

void sub_10001A920()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - Could not forget firmware, res = %x\n", v1, v2, v3, v4, 2u);
}

void sub_10001A99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AA94(int a1, uint64_t a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_10001413C((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to load Bin-format firmware binary: 0x%08x\n", (uint8_t *)v3);
}

void sub_10001AB0C()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - ret=%#x\n", v1, v2, v3, v4, 2u);
}

void sub_10001AB88()
{
  sub_100014154();
  sub_100014098((void *)&_mh_execute_header, &_os_log_default, v0, "%s - Failed to copy kMGQFrontCameraOffsetFromDisplayCenter answer from MobileGestalt! err=%d\n", v1, v2, v3, v4, 2u);
}

void sub_10001AC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AC80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001ACFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AD38()
{
  sub_1000140E8();
  sub_100014120((void *)&_mh_execute_header, &_os_log_default, v0, "%s - No module or Unauthorized swap (cmclStatus = 0x%x) or No CmCL data (perhaps cuz the device does not support CmCL) [error]: %s\n", v1, v2, v3, v4, v5);
}

void sub_10001ADBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AE38()
{
  sub_1000140E8();
  sub_100014120((void *)&_mh_execute_header, &_os_log_default, v0, "%s - No module or Unauthorized swap (fcclStatus = %#x) or No FCCL data (perhaps cuz the device does not support FCCL) [error]: %s\n", v1, v2, v3, v4, v5);
}

void sub_10001AEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AEF8()
{
  sub_1000140E8();
  sub_100014120((void *)&_mh_execute_header, &_os_log_default, v0, "%s - No module or Unauthorized swap (cmpmStatus = 0x%x) or No CmPM data (perhaps cuz the device does not support CmPM) [error]: %s\n", v1, v2, v3, v4, v5);
}

void sub_10001AF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014120((void *)&_mh_execute_header, &_os_log_default, a3, "Error sending ISP-ANE networks file to kernel: Size = %ld (== %ld ?); Status = %08x\n\n",
    a5,
    a6,
    a7,
    a8,
    0);
}

uint64_t sub_10001B138(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return a1 & 1;
}

void sub_10001B184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_10001B1C0(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return a1 & 1;
}

void sub_10001B20C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B248(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "registerDeviceIDForClient";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - client already has a registered device ID\n", (uint8_t *)&v1, 0xCu);
}

void sub_10001B2CC()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, v0, v1, "%s: Could not power off the ISP, res = 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_10001B340()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, v0, v1, "%s: Could not release channel, res = 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_10001B3B4()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, v0, v1, "%s: Savage Auth failed, res = 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_10001B428()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, v0, v1, "%s: Could not reserve channel, res = 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_10001B49C()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, v0, v1, "%s: Could not power on the ISP, res = 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_10001B510(xpc_connection_t *a1)
{
  xpc_connection_get_pid(*a1);
  sub_100016EF8();
  sub_100016ED8((void *)&_mh_execute_header, v1, v2, "Unable to create reply dictionary (pid %{private}d)\n", v3, v4, v5, v6, v7);
}

void sub_10001B590(xpc_connection_t *a1)
{
  xpc_connection_get_pid(*a1);
  sub_100016EF8();
  sub_100016ED8((void *)&_mh_execute_header, v1, v2, "Unable to look up remote connection (pid %{private}d)\n", v3, v4, v5, v6, v7);
}

void sub_10001B610(xpc_connection_t *a1, int a2, NSObject *a3)
{
  pid_t pid = xpc_connection_get_pid(*a1);
  v6[0] = 67109377;
  v6[1] = a2;
  __int16 v7 = 1025;
  pid_t v8 = pid;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Unexpected client message=%d (pid %{private}d)\n", (uint8_t *)v6, 0xEu);
}

void sub_10001B6B4(xpc_connection_t *a1)
{
  xpc_connection_get_pid(*a1);
  sub_100016EF8();
  sub_100016ED8((void *)&_mh_execute_header, v1, v2, "Received XPC_ERROR_TERMINATION_IMMINENT error from client (pid %{private}d)\n", v3, v4, v5, v6, v7);
}

void sub_10001B730(xpc_connection_t *a1)
{
  xpc_connection_get_pid(*a1);
  sub_100016EF8();
  sub_100016ED8((void *)&_mh_execute_header, v1, v2, "Received XPC_ERROR_CONNECTION_INTERRUPTED error from client (pid %{private}d)\n", v3, v4, v5, v6, v7);
}

void sub_10001B7AC(xpc_connection_t *a1)
{
  xpc_connection_get_pid(*a1);
  sub_100016EF8();
  sub_100016ED8((void *)&_mh_execute_header, v1, v2, "Received unexpected error from client (pid %{private}d)\n", v3, v4, v5, v6, v7);
}

void sub_10001B828(uint64_t a1)
{
  xpc_connection_get_pid(**(xpc_connection_t **)(a1 + 40));
  sub_100016EF8();
  sub_100016ED8((void *)&_mh_execute_header, v1, v2, "Received unknown event from client (pid %{private}d)\n", v3, v4, v5, v6, v7);
}

void sub_10001B8A8()
{
  sub_100016F04();
  sub_1000140B4((void *)&_mh_execute_header, v0, v1, "Received XPC_ERROR_TERMINATION_IMMINENT, cleaning up assistant\n\n", v2, v3, v4, v5, v6);
}

void sub_10001B8DC()
{
  sub_100016F04();
  sub_1000140B4((void *)&_mh_execute_header, v0, v1, "Received XPC_ERROR_CONNECTION_INVALID error on connection\n\n", v2, v3, v4, v5, v6);
}

void sub_10001B910()
{
  sub_100016F04();
  sub_1000140B4((void *)&_mh_execute_header, v0, v1, "Received XPC_ERROR_CONNECTION_INTERRUPTED error on connection\n\n", v2, v3, v4, v5, v6);
}

void sub_10001B944(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received unexpected event: %s\n", (uint8_t *)&v2, 0xCu);
}

void sub_10001B9BC()
{
  sub_100014084();
  sub_100014098((void *)&_mh_execute_header, v0, v1, "%s - failed to load firmware ret=0x%08x\n", v2, v3, v4, v5, 2u);
}

void sub_10001BA30()
{
  sub_100016F10();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error creating H16ISPDeviceController object: %08X\n", v1, 8u);
}

void sub_10001BAA8()
{
  sub_100016F10();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error opening H16ISPDevice: %08X\n", v1, 8u);
}

void sub_10001BB20()
{
  sub_100016F04();
  sub_1000140B4((void *)&_mh_execute_header, v0, v1, "Failed to crate SIGTERM dispatch source\n", v2, v3, v4, v5, v6);
}

void sub_10001BB54()
{
  sub_100016F04();
  sub_1000140B4((void *)&_mh_execute_header, v0, v1, "Unable to create mach service\n", v2, v3, v4, v5, v6);
}

void sub_10001BB88()
{
  __assert_rtn("LSCAverageGreenApple", "LSCComputeFromNVM.cpp", 1308, "pLSCConfig->channelGR.gridCountY == pLSCConfig->channelGB.gridCountY");
}

void sub_10001BBB4()
{
  __assert_rtn("LSCAverageGreenApple", "LSCComputeFromNVM.cpp", 1307, "pLSCConfig->channelGR.gridCountX == pLSCConfig->channelGB.gridCountX");
}

uint64_t AMFDRCreateInstanceString()
{
  return _AMFDRCreateInstanceString();
}

uint64_t AMFDRLogSetHandler()
{
  return _AMFDRLogSetHandler();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return _AMFDRSealingManifestCopyLocalDataForClass();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return _AMFDRSealingMapCopyLocalDataForClass();
}

uint64_t AMFDRSealingMapCopyLocalDictForClass()
{
  return _AMFDRSealingMapCopyLocalDictForClass();
}

uint64_t AMFDRSealingMapCopyLocalMinimalManifestForInstance()
{
  return _AMFDRSealingMapCopyLocalMinimalManifestForInstance();
}

uint64_t AMSupportDigestSha384()
{
  return _AMSupportDigestSha384();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
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

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
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

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t Img4DecodeGetBooleanFromSection()
{
  return _Img4DecodeGetBooleanFromSection();
}

uint64_t Img4DecodeInitManifest()
{
  return _Img4DecodeInitManifest();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGIsQuestionValid()
{
  return _MGIsQuestionValid();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  return _acos(__x);
}

long double atan(long double __x)
{
  return _atan(__x);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

long double cos(long double __x)
{
  return _cos(__x);
}

double difftime(time_t a1, time_t a2)
{
  return _difftime(a1, a2);
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
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

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
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

off_t ftello(FILE *__stream)
{
  return _ftello(__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

long double ldexp(long double __x, int __e)
{
  return _ldexp(__x, __e);
}

float log2f(float a1)
{
  return _log2f(a1);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
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

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_state_remove_handler()
{
  return _os_state_remove_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void perror(const char *a1)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return _pthread_attr_setschedparam(a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_timedwait(a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_destroy(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

void rewind(FILE *a1)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

long double tan(long double __x)
{
  return _tan(__x);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
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
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return _xpc_string_get_length(xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return [a1 sharedDataAccessor];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1];
}