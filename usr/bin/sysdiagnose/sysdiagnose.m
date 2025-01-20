uint64_t sub_100003A68()
{
  const char *v0;
  int v2;
  const char *v3;

  if (qword_100010398 != -1) {
    dispatch_once(&qword_100010398, &stru_10000C490);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_100010390) {
      v0 = "launchd";
    }
    else {
      v0 = "shell";
    }
    v2 = 136315138;
    v3 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "started by %s", (uint8_t *)&v2, 0xCu);
  }
  return byte_100010390;
}

void sub_100003B50(id a1)
{
  byte_100010390 = 0;
}

uint64_t sub_100003B98()
{
  if (qword_1000103A8 != -1) {
    dispatch_once(&qword_1000103A8, &stru_10000C4B0);
  }
  return byte_1000103A0;
}

void sub_100003BDC(id a1)
{
  if (os_variant_has_internal_diagnostics()) {
    char has_internal_content = 1;
  }
  else {
    char has_internal_content = os_variant_has_internal_content();
  }
  byte_1000103A0 = has_internal_content;
  BOOL v3 = 0;
  if (sub_100003D6C(@"customer-mode", @"com.apple.sysdiagnose", &v3) && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Customer-mode enabled. Forcing external behavior.", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "To disable, run: 'sudo defaults write com.apple.sysdiagnose customer-mode -BOOL false; sudo pkill -9 sysdiagnose'",
        buf,
        2u);
    }
    byte_1000103A0 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000103A0) {
      v2 = "YES";
    }
    else {
      v2 = "NO";
    }
    *(_DWORD *)buf = 136315138;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Internal: %s", buf, 0xCu);
  }
}

BOOL sub_100003D6C(void *a1, void *a2, BOOL *a3)
{
  v5 = a1;
  CFStringRef v6 = a2;
  v7 = (__CFString *)v6;
  if (v5 && v6 && a3)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v6, &keyExistsAndHasValidFormat);
    int v9 = keyExistsAndHasValidFormat;
    if (keyExistsAndHasValidFormat) {
      *a3 = AppBooleanValue != 0;
    }
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_10000759C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    BOOL v10 = 0;
  }

  return v10;
}

BOOL sub_100003E1C(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  size_t v6 = v5;
  if (v5 >= v4) {
    size_t v7 = v4;
  }
  else {
    size_t v7 = v5;
  }
  if (!strncasecmp(a2, a1, v7)) {
    return 1;
  }
  if (v6 <= v4) {
    v8 = a1;
  }
  else {
    v8 = a2;
  }
  if (v6 <= v4) {
    int v9 = a2;
  }
  else {
    int v9 = a1;
  }
  return strcasestr(v8, v9) != 0;
}

BOOL sub_100003E94()
{
  v0 = (void *)__chkstk_darwin();
  id v2 = v1;
  if (proc_pidpath((int)[v0 intValue], buffer, 0x1000u) < 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v3 = +[NSString stringWithUTF8String:buffer];
    BOOL v4 = sub_100003E1C([v3 fileSystemRepresentation], [v2 fileSystemRepresentation]);
  }
  return v4;
}

BOOL sub_100003F84(const void *a1)
{
  id v2 = (const void *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  BOOL v4 = CFEqual(v2, a1) != 0;
  CFRelease(v3);
  return v4;
}

uint64_t sub_100003FE0()
{
  if (qword_1000103B8 != -1) {
    dispatch_once(&qword_1000103B8, &stru_10000C4D0);
  }
  return byte_1000103B0;
}

void sub_100004024(id a1)
{
  byte_1000103B0 = sub_100003F84(@"AppleDisplay");
}

uint64_t sub_10000404C()
{
  if (qword_1000103C8 != -1) {
    dispatch_once(&qword_1000103C8, &stru_10000C4F0);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = byte_1000103C0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got result %d for isComputeModuleB check", (uint8_t *)v1, 8u);
  }
  return byte_1000103C0;
}

void sub_10000411C(id a1)
{
  byte_1000103C0 = sub_100004144("manta-b");
}

uint64_t sub_100004144(const char *a1)
{
  kern_return_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  kern_return_t v14;
  io_registry_entry_t v16;
  kern_return_t v17;
  uint64_t v18;
  uint64_t v19;
  io_iterator_t iterator[2];
  uint8_t buf[4];
  _DWORD v22[3];
  io_name_t name;
  void v24[2];
  uint64_t v25;

  *(void *)iterator = 0;
  if (!a1)
  {
    v25 = 0;
    memset(name, 0, 80);
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    LODWORD(v24[0]) = 134217984;
    *(void *)((char *)v24 + 4) = 0;
    _os_log_send_and_compose_impl();
    uint64_t v18 = _os_crash_msg();
    sub_100007618(v18);
  }
  io_iterator_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/");
  io_object_t v3 = v2;
  iterator[1] = v2;
  if (v2)
  {
    BOOL v4 = IORegistryEntryCreateIterator(v2, "IODeviceTree", 0, iterator);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100007794(v4);
      }
    }
    else
    {
      while (1)
      {
        uint64_t v16 = IOIteratorNext(iterator[0]);
        if (!v16) {
          break;
        }
        memset(name, 0, sizeof(name));
        uint64_t v17 = IORegistryEntryGetName(v16, name);
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100007748(buf, v17, v22);
          }
        }
        else if (!strcmp(a1, name))
        {
          uint64_t v13 = 1;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    size_t v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_1000076CC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = 0;
LABEL_9:
  if (iterator[0])
  {
    uint64_t v14 = IOObjectRelease(iterator[0]);
    if (v14)
    {
      v24[0] = 0;
      memset(name, 0, 80);
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      LODWORD(v25) = 67109120;
      HIDWORD(v25) = v14;
      _os_log_send_and_compose_impl();
      v19 = _os_crash_msg();
      sub_100007618(v19);
    }
  }
  if (v3 && IOObjectRelease(v3)) {
    sub_10000761C(v24, name);
  }
  return v13;
}

void sub_100004418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
}

NSString *sub_100004458()
{
  return +[NSString stringWithFormat:@"sysdiagnose version %d.%d", 3, 0];
}

uint64_t sub_100004490(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_100007814(&v2, v3);
    }
  }
  return result;
}

void sub_1000044F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100004514()
{
  return _os_log_send_and_compose_impl();
}

uint64_t start(int a1, char *const *a2)
{
  if (sub_100003A68())
  {
    BOOL v149 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v149) {
      sub_1000078B0(v149, v150, v151, v152, v153, v154, v155, v156);
    }
LABEL_183:
    exit(1);
  }
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = objc_alloc_init((Class)NSMutableString);
  size_t v6 = &CFEqual_ptr;
  int v162 = a1 - 1;
  if (a1 >= 1)
  {
    uint64_t v7 = a1;
    v8 = a2;
    do
    {
      uint64_t v9 = (uint64_t)*v8++;
      BOOL v10 = +[NSString stringWithFormat:@"%s ", v9];
      [v5 appendString:v10];

      --v7;
    }
    while (v7);
  }
  v164 = v5;
  [v4 setObject:v5 forKeyedSubscript:@"commandLineArgs"];
  opterr = 0;
  long long v189 = off_10000C5F8;
  long long v190 = unk_10000C608;
  long long v191 = xmmword_10000C618;
  long long v192 = unk_10000C628;
  long long v185 = off_10000C5B8;
  long long v186 = unk_10000C5C8;
  long long v187 = off_10000C5D8;
  long long v188 = unk_10000C5E8;
  long long v181 = off_10000C578;
  long long v182 = unk_10000C588;
  long long v183 = off_10000C598;
  long long v184 = unk_10000C5A8;
  option v178 = off_10000C538;
  long long v179 = off_10000C558;
  long long v180 = unk_10000C568;
  id v168 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v11 = 0;
  uint64_t v12 = &optarg;
  v167 = a2;
  while (2)
  {
    while (1)
    {
      uint64_t v13 = v11;
      int v14 = getopt_long(a1, a2, "vhHcsbf:V:lqQnA:pPdDkFgGLXe:urRSC:x:", &v178, 0);
      if (v14 <= 15212) {
        break;
      }
      if (v14 == 15213)
      {
        if (!sub_100003B98()) {
          goto LABEL_81;
        }
        uint64_t v18 = [v6[120] stringWithUTF8String:*v12];
        v21 = v4;
        v20 = v18;
        CFStringRef v19 = @"onlyRunContainersWithNames";
        goto LABEL_61;
      }
      if (v14 != 18213)
      {
        if (v14 != 20213)
        {
LABEL_78:
          fwrite("Unexpected option or insufficient arguments.", 0x2CuLL, 1uLL, __stderrp);
          fputc(10, __stderrp);
          sub_100005D30();
          int v54 = 64;
          goto LABEL_82;
        }
        v34 = __stderrp;
        v35 = "Platform does not support --collectAllTrusted flag";
        size_t v36 = 50;
LABEL_80:
        fwrite(v35, v36, 1uLL, v34);
        fputc(10, __stderrp);
        goto LABEL_81;
      }
      if (!sub_100003B98()) {
        goto LABEL_81;
      }
      uint64_t v17 = v4;
      uint64_t v15 = &__kCFBooleanTrue;
      CFStringRef v16 = @"collectWifiDextCoreFiles";
LABEL_49:
      [v17 setObject:v15 forKeyedSubscript:v16];
      uint64_t v11 = v13;
    }
    switch(v14)
    {
      case 'A':
        uint64_t v18 = [v6[120] stringWithUTF8String:*v12];
        CFStringRef v19 = @"archiveName";
        goto LABEL_28;
      case 'B':
      case 'E':
      case 'I':
      case 'J':
      case 'K':
      case 'M':
      case 'N':
      case 'O':
      case 'T':
      case 'U':
      case 'W':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'a':
      case 'e':
      case 'i':
      case 'j':
      case 'm':
      case 'o':
      case 's':
      case 't':
      case 'w':
        goto LABEL_78;
      case 'C':
        uint64_t v18 = [v6[120] stringWithUTF8String:*v12];
        if ([@"yaa" isEqualToString:v18])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Compression type: yaa", buf, 2u);
          }
          v20 = &__kCFBooleanTrue;
          CFStringRef v19 = @"useParallelCompression";
LABEL_60:
          v21 = v4;
LABEL_61:
          [v21 setObject:v20 forKeyedSubscript:v19];
          goto LABEL_62;
        }
        if ([@"tar" isEqualToString:v18])
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_62;
          }
          *(_WORD *)buf = 0;
          v33 = "Compression type: tar";
          goto LABEL_66;
        }
        if ([@"no-compression" isEqualToString:v18])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "--compression=no-compression (functions the same as -n flag)", buf, 2u);
          }
          v20 = &__kCFBooleanFalse;
          CFStringRef v19 = @"shouldCreateTarBall";
          goto LABEL_60;
        }
        if ([@"default" isEqualToString:v18])
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_62;
          }
          *(_WORD *)buf = 0;
          v33 = "Default compression requested. Using tar";
LABEL_66:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
LABEL_62:

          uint64_t v11 = v13;
          continue;
        }
        v81 = __stderrp;
        id v82 = v18;
        fprintf(v81, "Error: compression type '%s' not found", (const char *)[v82 UTF8String]);
        fputc(10, __stderrp);

LABEL_81:
        int v54 = 69;
LABEL_82:

        if (v54) {
          exit(v54);
        }
        if (geteuid())
        {
          fwrite("sysdiagnose must be run as root", 0x1FuLL, 1uLL, __stderrp);
          fputc(10, __stderrp);
          goto LABEL_183;
        }
        if (qword_1000103E8 != -1) {
          dispatch_once(&qword_1000103E8, &stru_10000C698);
        }
        [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SDRequestSourceShell"];
        if (!isatty(1)) {
          [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"verbose"];
        }
        if ((byte_1000103D0 & 1) == 0)
        {
          id v55 = [v4 copy];
          int v56 = sub_100003B98();
          v57 = &off_100010368;
          if (!v56) {
            v57 = &off_100010360;
          }
          printf("%s", *v57);
          putchar(10);
          v58 = [v55 objectForKeyedSubscript:@"pidOrProcess"];
          if (sub_100006728(v58, @"/Applications/Mail.app/Contents/MacOS/Mail"))
          {
            v59 = &off_100010370;
            goto LABEL_95;
          }
          if (sub_100006728(v58, @"/Applications/Safari.app/Contents/MacOS/Safari"))
          {
            v59 = &off_100010378;
LABEL_95:
            printf("%s", *v59);
            putchar(10);
          }
          v60 = [v55 objectForKey:@"setNoTimeOut"];
          v61 = v60;
          if (v60 && [v60 BOOLValue])
          {
            printf("%s", off_100010380);
            putchar(10);
          }
          printf("Press 'Enter' to continue. Ctrl+\\ to cancel.");
          putchar(10);
          if (!isatty(1))
          {
            fwrite("Triggering sysdiagnose programmatically from CLI with incorrect arguments. Exiting.", 0x53uLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            exit(64);
          }
          do
            int v62 = fgetc(__stdinp) << 24;
          while (v62 != 218103808 && v62 != 167772160);
        }
        v64 = [v4 objectForKeyedSubscript:@"verbose"];

        if (v64)
        {
          v65 = 0;
        }
        else
        {
          [v4 objectForKeyedSubscript:@"shouldCreateTarBall"];
          v171[0] = _NSConcreteStackBlock;
          v171[1] = 3221225472;
          v171[2] = sub_100005A10;
          v171[3] = &unk_10000C518;
          id v172 = (id)objc_claimAutoreleasedReturnValue();
          id v66 = v172;
          v65 = objc_retainBlock(v171);
        }
        id v170 = 0;
        v67 = +[Libsysdiagnose sysdiagnoseWithMetadata:v4 withError:&v170 withProgressHandler:v65];
        id v68 = v170;
        if (v67)
        {
          id v69 = v67;
          printf("\nOutput available at '%s'.", (const char *)[v69 UTF8String]);
          putchar(10);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v70 = (const char *)[v69 UTF8String];
            LODWORD(v178.name) = 136315138;
            *(const char **)((char *)&v178.name + 4) = v70;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nOutput available at '%s'.", (uint8_t *)&v178, 0xCu);
          }
        }
        if (v68)
        {
          v157 = __stderrp;
          id v158 = [v68 localizedDescription];
          fprintf(v157, "sysdiagnose error: %s", (const char *)[v158 UTF8String]);

          fputc(10, __stderrp);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000078EC(v68);
          }
          goto LABEL_183;
        }

        return 0;
      case 'D':
        uint64_t v15 = &__kCFBooleanFalse;
        CFStringRef v16 = @"shouldRunLogCopyTasks";
        goto LABEL_48;
      case 'F':
        uint64_t v15 = &__kCFBooleanTrue;
        CFStringRef v16 = @"shouldGetFeedbackData";
        goto LABEL_48;
      case 'G':
        uint64_t v15 = &__kCFBooleanFalse;
        CFStringRef v16 = @"shouldRunLogGenerationTasks";
        goto LABEL_48;
      case 'H':
        id v148 = +[SDCacheEnumerator sysdiagnoseDirectory];
        printf("Sysdiagnoses can be found at '%s'\n", (const char *)[v148 UTF8String]);

        goto LABEL_176;
      case 'L':
        uint64_t v15 = &__kCFBooleanTrue;
        CFStringRef v16 = @"capOverrideFullLogarchive";
        goto LABEL_48;
      case 'P':
        uint64_t v15 = &__kCFBooleanFalse;
        CFStringRef v16 = @"shouldRunTimeSensitiveTasks";
        goto LABEL_48;
      case 'Q':
      case 'q':
        uint64_t v15 = &__kCFBooleanTrue;
        CFStringRef v16 = @"quickMode";
        goto LABEL_48;
      case 'R':
        uint64_t v15 = &__kCFBooleanFalse;
        goto LABEL_45;
      case 'S':
        uint64_t v15 = &__kCFBooleanTrue;
        CFStringRef v16 = @"disableStreamTar";
        goto LABEL_48;
      case 'V':
        uint64_t v18 = [v6[120] stringWithUTF8String:*v12];
        CFStringRef v19 = @"rootPath";
LABEL_28:
        v21 = v4;
        v20 = v18;
        goto LABEL_61;
      case 'X':
        uint64_t v15 = &__kCFBooleanTrue;
        CFStringRef v16 = @"setNoTimeOut";
        goto LABEL_48;
      case 'b':
        goto LABEL_47;
      case 'c':
        if (sub_100003FE0())
        {
          v34 = __stderrp;
          v35 = "Platform does not support -c flag.";
          size_t v36 = 34;
          goto LABEL_80;
        }
        uint64_t v11 = 1;
        if (sub_10000404C()) {
          continue;
        }
        uint64_t v15 = &__kCFBooleanTrue;
        CFStringRef v16 = @"coSysdiagnose";
LABEL_48:
        uint64_t v17 = v4;
        goto LABEL_49;
      case 'd':
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunLogGenerationTasks"];
        v22 = &__kCFBooleanTrue;
        v23 = v4;
        goto LABEL_43;
      case 'f':
        v24 = v12;
        v25 = [v6[120] stringWithUTF8String:*v12];
        if (([v25 hasPrefix:@"."] & 1) != 0
          || ([v25 hasPrefix:@"/"] & 1) == 0)
        {
          v26 = +[NSFileManager defaultManager];
          v27 = [v26 currentDirectoryPath];
          uint64_t v28 = [v27 stringByAppendingPathComponent:v25];

          v25 = (void *)v28;
          size_t v6 = &CFEqual_ptr;
        }
        v29 = [v25 stringByResolvingSymlinksInPath];
        v30 = sub_100006814(v29);
        [v4 setObject:v30 forKeyedSubscript:@"baseDirectory"];

        uint64_t v11 = v13;
        uint64_t v12 = v24;
        a2 = v167;
        continue;
      case 'g':
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        v31 = &__kCFBooleanTrue;
        v32 = v4;
        goto LABEL_42;
      case 'h':
        sub_100005D30();
LABEL_176:
        exit(0);
      case 'k':
        uint64_t v15 = &__kCFBooleanFalse;
        CFStringRef v16 = @"shouldRemoveTemporaryDirectory";
        goto LABEL_48;
      case 'l':
        byte_1000103D0 = 1;
        continue;
      case 'n':
        uint64_t v15 = &__kCFBooleanFalse;
        CFStringRef v16 = @"shouldCreateTarBall";
        goto LABEL_48;
      case 'p':
        [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        v32 = v4;
        v31 = &__kCFBooleanFalse;
LABEL_42:
        [v32 setObject:v31 forKeyedSubscript:@"shouldRunLogGenerationTasks"];
        v23 = v4;
        v22 = &__kCFBooleanFalse;
LABEL_43:
        [v23 setObject:v22 forKeyedSubscript:@"shouldRunLogCopyTasks"];
        CFStringRef v16 = @"shouldRunOSLogArchive";
        uint64_t v17 = v4;
        uint64_t v15 = &__kCFBooleanFalse;
        goto LABEL_49;
      case 'r':
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunTimeSensitiveTasks"];
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunLogGenerationTasks"];
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldRunLogCopyTasks"];
        uint64_t v15 = &__kCFBooleanTrue;
LABEL_45:
        CFStringRef v16 = @"shouldRunOSLogArchive";
        goto LABEL_48;
      case 'u':
        [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"disableUIFeedback"];
        byte_1000103D0 = 1;
LABEL_47:
        uint64_t v15 = &__kCFBooleanFalse;
        CFStringRef v16 = @"shouldDisplayTarBall";
        goto LABEL_48;
      case 'v':
        uint64_t v15 = &__kCFBooleanTrue;
        CFStringRef v16 = @"verbose";
        goto LABEL_48;
      case 'x':
        uint64_t v18 = [v6[120] stringWithUTF8String:*v12];
        [v168 addObject:v18];
        goto LABEL_62;
      default:
        if (v14 != -1) {
          goto LABEL_78;
        }
        id v37 = [v168 copy];
        if (![v37 count])
        {
          id v72 = v37;
          goto LABEL_152;
        }
        v196[0] = @"CLI_REQUEST_TYPE";
        v196[1] = @"REQUEST_DATA";
        v197[0] = @"validateRemoteUUIDs";
        v197[1] = v37;
        v38 = +[NSDictionary dictionaryWithObjects:v197 forKeys:v196 count:2];
        v39 = objc_opt_new();
        id v177 = 0;
        BOOL v40 = sub_100005E24(0xCu, v38, &v177);
        id v41 = v177;
        v42 = v41;
        if (v40 && v41)
        {
          v165 = v39;
          v160 = v38;
          id v161 = v37;
          id v159 = v41;
          id v43 = v41;
          uint64_t v44 = objc_opt_class();
          uint64_t v45 = objc_opt_class();
          uint64_t v46 = objc_opt_class();
          uint64_t v47 = objc_opt_class();
          v48 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, v45, v46, v47, objc_opt_class(), 0);
          *(void *)buf = 0;
          data = xpc_dictionary_get_data(v43, "RESPONSE_DATA", (size_t *)buf);

          if (!data)
          {
            BOOL v83 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v83) {
              sub_100007A34(v83, v84, v85, v86, v87, v88, v89, v90);
            }

            size_t v6 = &CFEqual_ptr;
            goto LABEL_147;
          }
          v50 = +[NSData dataWithBytes:data length:*(void *)buf];
          if (!v50)
          {
            BOOL v91 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            size_t v6 = &CFEqual_ptr;
            if (v91) {
              sub_100007B10(v91, v92, v93, v94, v95, v96, v97, v98);
            }
            id v53 = 0;
LABEL_131:

            if (v53)
            {
              long long v175 = 0u;
              long long v176 = 0u;
              long long v173 = 0u;
              long long v174 = 0u;
              id obj = [v53 allKeys];
              id v107 = [obj countByEnumeratingWithState:&v173 objects:buf count:16];
              if (v107)
              {
                id v108 = v107;
                uint64_t v109 = *(void *)v174;
                id v169 = v53;
                do
                {
                  for (i = 0; i != v108; i = (char *)i + 1)
                  {
                    if (*(void *)v174 != v109) {
                      objc_enumerationMutation(obj);
                    }
                    v111 = *(void **)(*((void *)&v173 + 1) + 8 * i);
                    v112 = [v53 objectForKey:v111];
                    v113 = v112;
                    if (v112)
                    {
                      if ([v112 BOOLValue])
                      {
                        [v165 addObject:v111];
                      }
                      else
                      {
                        v116 = __stderrp;
                        id v117 = v111;
                        fprintf(v116, "Remote UUID '%s' not found", (const char *)[v117 UTF8String]);
                        id v53 = v169;
                        fputc(10, __stderrp);
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_100007AC0((int)&v193, v117);
                        }
                      }
                    }
                    else
                    {
                      v114 = __stderrp;
                      id v115 = v111;
                      fprintf(v114, "Malformed daemon response. Remote UUID '%s' not found", (const char *)[v115 UTF8String]);
                      id v53 = v169;
                      fputc(10, __stderrp);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_100007A70((int)&v194, v115);
                      }
                    }
                  }
                  id v108 = [obj countByEnumeratingWithState:&v173 objects:buf count:16];
                }
                while (v108);
              }

              v39 = v165;
              id v72 = [v165 copy];

              size_t v6 = &CFEqual_ptr;
LABEL_150:
              v38 = v160;
              id v37 = v161;
              v42 = v159;
              goto LABEL_151;
            }
LABEL_147:
            fwrite("Malformed daemon response. Assuming provided remoteUUIDs invalid", 0x40uLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            BOOL v118 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            v39 = v165;
            if (v118) {
              sub_1000079F8(v118, v119, v120, v121, v122, v123, v124, v125);
            }
            id v72 = [v165 copy];
            goto LABEL_150;
          }
          *(void *)&long long v173 = 0;
          v51 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v48 fromData:v50 error:&v173];
          id v52 = (id)v173;
          size_t v6 = &CFEqual_ptr;
          if (v51)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v53 = v51;
LABEL_130:

              goto LABEL_131;
            }
            BOOL v99 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v99) {
              sub_100007BD8(v99, v100, v101, v102, v103, v104, v105, v106);
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100007B4C(v52);
          }
          id v53 = 0;
          goto LABEL_130;
        }
        fwrite("Malformed daemon response. Assuming provided remoteUUIDs invalid", 0x40uLL, 1uLL, __stderrp);
        fputc(10, __stderrp);
        BOOL v73 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v73) {
          sub_1000079F8(v73, v74, v75, v76, v77, v78, v79, v80);
        }
        id v72 = [v39 copy];
LABEL_151:

LABEL_152:
        if ([v72 count]) {
          [v4 setObject:v72 forKeyedSubscript:@"remoteUUIDs"];
        }
        if ((v13 & 1) == 0) {
          goto LABEL_167;
        }
        *(void *)&long long v173 = 0;
        BOOL v126 = sub_100005E24(0xCu, &off_10000CE78, &v173);
        id v127 = (id)v173;
        v128 = v127;
        if (v126 && v127)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v127, "RESPONSE_DATA");
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = uint64;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "isAutomaticCoSysdiagnosePossible: received response from server '%llu'", buf, 0xCu);
          }

          if (uint64) {
            goto LABEL_166;
          }
        }
        else
        {
          BOOL v130 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v130) {
            sub_1000079BC(v130, v131, v132, v133, v134, v135, v136, v137);
          }
        }
        if (![v72 count])
        {
          v138 = [v4 objectForKeyedSubscript:@"shouldCollectAllTrusted"];

          if (!v138)
          {
            fwrite("No connected devices found. Co-sysdiagnose options not available.", 0x41uLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            BOOL v140 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v140) {
              sub_100007980(v140, v141, v142, v143, v144, v145, v146, v147);
            }
            int v54 = 69;
            goto LABEL_170;
          }
        }
LABEL_166:
        [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"coSysdiagnoseOnly"];
LABEL_167:
        if (optind == v162)
        {
          v139 = [v6[120] stringWithCString:a2[optind] encoding:4];
          [v4 setObject:v139 forKeyedSubscript:@"pidOrProcess"];
        }
        int v54 = 0;
LABEL_170:

        goto LABEL_82;
    }
  }
}

size_t sub_100005A10(uint64_t a1, void *a2)
{
  uint64_t v3 = sdProgressPercent;
  id v4 = a2;
  id v5 = [v4 objectForKeyedSubscript:v3];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:sdProgressPhase];

  id v9 = [v8 unsignedLongLongValue];
  switch((unint64_t)v9)
  {
    case 0uLL:
      BOOL v10 = __stdoutp;
      uint64_t v11 = "\nInvalid Sysdiagnose state. Aborting.\n";
      size_t v12 = 38;
      goto LABEL_20;
    case 1uLL:
      uint64_t v13 = __stdoutp;
      int v14 = "Progress:\n";
      size_t v15 = 10;
      goto LABEL_8;
    case 3uLL:
      CFStringRef v16 = __stdoutp;
      return fputc(10, v16);
    case 4uLL:
      uint64_t v13 = __stdoutp;
      int v14 = "\nCo-sysdiagnose transfer progress:\n";
      size_t v15 = 35;
LABEL_8:
      fwrite(v14, v15, 1uLL, v13);
      goto LABEL_9;
    case 6uLL:
      BOOL v10 = __stdoutp;
      uint64_t v11 = "\nCo-sysdiagnose Transfer Timed out\n";
      size_t v12 = 35;
LABEL_20:
      return fwrite(v11, v12, 1uLL, v10);
    default:
LABEL_9:
      char v29 = 0;
      uint64_t v18 = *(void *)(a1 + 32);
      *(void *)&long long v19 = 0x5F5F5F5F5F5F5F5FLL;
      *((void *)&v19 + 1) = 0x5F5F5F5F5F5F5F5FLL;
      *(_OWORD *)__s = v19;
      long long v26 = v19;
      long long v27 = v19;
      *(_OWORD *)uint64_t v28 = v19;
      *(_OWORD *)&v28[14] = v19;
      char v24 = 0;
      *(_DWORD *)__str = 0;
      int v20 = strlen(__s);
      size_t v21 = (int)(v7 * (double)v20 / 100.0);
      if ((int)v21 >= 1) {
        memset(__s, 124, v21);
      }
      snprintf(__str, 5uLL, "%02d%%", (int)v7);
      if (v20 >= 0x2D)
      {
        strlen(__str);
        __memcpy_chk();
      }
      fprintf(__stdoutp, "\x1B[J\x1B[2K[%s]\r", __s);
      if (v7 > 99.9 && v18 != 0) {
        fwrite("\nCompressing final diagnostics\n", 0x1FuLL, 1uLL, __stdoutp);
      }
      return fflush(__stdoutp);
  }
}

uint64_t sub_100005D30()
{
  uint64_t v0 = getprogname();
  id v1 = +[NSProcessInfo processInfo];
  uint64_t v2 = [v1 arguments];
  uint64_t v3 = [v2 objectAtIndex:0];
  id v4 = [v3 lastPathComponent];
  id v5 = (const char *)[v4 UTF8String];

  if (sub_100003B98()) {
    double v6 = off_100010388;
  }
  else {
    double v6 = "";
  }
  sub_100004458();
  id v7 = objc_claimAutoreleasedReturnValue();
  printf("%s\nUSAGE: %s [args] [process_name | pid]\n          -h                      Display this help.\n          -H                      Print the path to the default sysdiagnose output directory.\n          -v                      Enable verbose mode to display the container information as it executes.\n          -f results_directory    Specify the directory where results will be stored.\n          -A archive_name         Specify the name of the archive created in the results directory.\n          -V volume_path          Specify the root volume for sysdiagnose to run on.\n          -C, --compression type  Specify the compression type. It is an error to use this with the -n flag. Valid options are:\n                                  yaa: use parallel compression\n                                  tar: use tar compression\n                                  no-compression: don't compress the output. Identical to -n\n                                  default: will use the system default. Currently defaults to tar\n          -n                      Do not tar the resulting sysdiagnose directory.\n          -k                      Do not remove the temporary directory.\n          -F                      Get feedback data.\n          -S                      Disable streaming to tarball.\n          -u                      Disable UI feedback.\n"
    "          -Q,                     Skip footprint.\n"
    "          -q,                     Same as -Q\n"
    "          -b                      Do not show a Finder window upon completion.\n"
    "          -p                      Only run time-sensitive collections; disregards previous -d or -r flags.\n"
    "          -P                      Do not run time-sensitive collections.\n"
    "          -g                      Only run log generation collections; disregards previous -p or -r flags.\n"
    "          -G                      Do not run log generation collections.\n"
    "          -d                      Only run log copying collections; disregards previous -p or -r flags.\n"
    "          -D                      Do not run log copying collections.\n"
    "          -r                      Collect only log archive; disregards previous -p or -d flags.\n"
    "          -R                      Do not collect log archive.\n"
    "          [process_name | pid]    If a single process appears to be slowing down the system,\n"
    "                                  passing in the process name or ID as the argument gathers\n"
    "                                  additional process-specific diagnostic data; Specify only ONE process\n"
    "                                  at a time -- specifying multiple processes is not supported.\n"
    "%s\n"
    "DESCRIPTION:\n"
    "  %s gathers system diagnostic information helpful in investigating system performance issues.\n"
    "  A great deal of information is harvested, spanning system state and configuration. The data is stored /var/tmp dir"
    "ectory.\n"
    "  sysdiagnose needs to be run as root. To cancel an in-flight sysdiagnose triggered via command line interface, pres"
    "s Ctrl-\\.\n"
    "  %s is automatically triggered when the following key chord is pressed: Control-Option-Command-Shift-Period.\n"
    "WHAT %s COLLECTS:\n"
    "  - A spindump of the system\n"
    "  - Several seconds of top output\n"
    "  - Data about kernel zones\n"
    "  - Status of loaded kernel extensions\n"
    "  - Resident memory usage of user processes\n"
    "  - Recent system logs\n"
    "  - A System Profiler report\n"
    "  - Recent crash reports\n"
    "  - Disk usage information\n"
    "  - I/O Kit registry information\n"
    "  - Network status\n"
    "  - If a specific process is supplied as an argument, will collect:\n"
    "      - A list of malloc-allocated buffers in the process's heap\n"
    "      - Data about unreferenced malloc buffers in the process's memory\n"
    "      - Data about the virtual memory regions allocated in the process\n",
    (const char *)[v7 UTF8String],
    v5,
    v6,
    v0,
    v0,
    v0);

  return putchar(10);
}

BOOL sub_100005E24(unsigned int a1, void *a2, void *a3)
{
  id v5 = a2;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", a1);
  if (v5)
  {
    v33 = a3;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v7 = [v5 allKeys];
    id v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v36;
      v34 = v7;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          size_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v13 = [v5 objectForKey:v12];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            xpc_dictionary_set_BOOL(v6, (const char *)[v12 UTF8String], (BOOL)[v13 BOOLValue]);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              xpc_dictionary_set_string(v6, (const char *)[v12 UTF8String], (const char *)[objc_retainAutorelease(v13) UTF8String]);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
                if (v14)
                {
                  size_t v15 = (const char *)[v12 UTF8String];
                  id v16 = v14;
                  id v17 = [v16 bytes];
                  uint64_t v18 = v16;
                  id v7 = v34;
                  xpc_dictionary_set_data(v6, v15, v17, (size_t)[v18 length]);
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v19 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
                  if (v19)
                  {
                    int v20 = (const char *)[v12 UTF8String];
                    id v21 = v19;
                    xpc_dictionary_set_data(v6, v20, [v21 bytes], (size_t)[v21 length]);
                  }

                  id v7 = v34;
                }
                else
                {
                  v22 = __stderrp;
                  id v23 = v12;
                  fprintf(v22, "Undefined type in the metadata for key '%s': not including in request", (const char *)[v23 UTF8String]);
                  fputc(10, __stderrp);
                  id v7 = v34;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_100007C8C((int)&v39, v23);
                  }
                }
              }
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v9);
    }

    a3 = v33;
  }

  if (qword_1000103E0 != -1) {
    dispatch_once(&qword_1000103E0, &stru_10000C638);
  }
  char v24 = (_xpc_connection_s *)(id)qword_1000103D8;
  xpc_object_t v25 = xpc_connection_send_message_with_reply_sync(v24, v6);
  if (xpc_get_type(v25) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t uint64 = (unsigned __int16)xpc_dictionary_get_uint64(v25, "RESPONSE_TYPE");
    uint64_t v30 = xpc_dictionary_get_uint64(v25, "FAILURE_REASON");
    BOOL v28 = uint64 == 1 || v30 == 7;
    if (a3 && v28)
    {
      *a3 = v25;
      BOOL v28 = 1;
    }
  }
  else
  {
    long long v26 = __stderrp;
    string = xpc_dictionary_get_string(v25, _xpc_error_key_description);
    fprintf(v26, "Received error from the daemon: %s", string);
    fputc(10, __stderrp);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007C14(v25, _xpc_error_key_description);
    }
    BOOL v28 = 0;
  }

  return v28;
}

void sub_1000062D4(id a1)
{
  id v4 = dispatch_get_global_queue(33, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v4, 2uLL);
  xpc_connection_set_event_handler(mach_service, &stru_10000C678);
  uint64_t v2 = (void *)qword_1000103D8;
  qword_1000103D8 = (uint64_t)mach_service;
  uint64_t v3 = mach_service;

  xpc_connection_resume((xpc_connection_t)qword_1000103D8);
}

void sub_100006370(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v3 = __stderrp;
    string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
    fprintf(v3, "XPC connection to daemon '%s' received error: %s.", "com.apple.sysdiagnose.service.xpc", string);
    fputc(10, __stderrp);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007CDC(v2, _xpc_error_key_description);
    }
  }
}

void sub_10000642C(id a1)
{
  queue = dispatch_get_global_queue(25, 0);
  signal(2, (void (__cdecl *)(int))1);
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, queue);
  uint64_t v2 = (void *)qword_1000103F0;
  qword_1000103F0 = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103F0, &stru_10000C6B8);
  dispatch_resume((dispatch_object_t)qword_1000103F0);
  signal(15, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(18, (void (__cdecl *)(int))1);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, queue);
  id v4 = (void *)qword_100010400;
  qword_100010400 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100010400, &stru_10000C6D8);
  dispatch_resume((dispatch_object_t)qword_100010400);
  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x12uLL, 0, queue);
  xpc_object_t v6 = (void *)qword_1000103F8;
  qword_1000103F8 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103F8, &stru_10000C6D8);
  dispatch_resume((dispatch_object_t)qword_1000103F8);
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 3uLL, 0, queue);
  id v8 = (void *)qword_100010408;
  qword_100010408 = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100010408, &stru_10000C6D8);
  dispatch_resume((dispatch_object_t)qword_100010408);
}

void sub_1000065A4(id a1)
{
  if (!sub_100005E24(6u, 0, 0))
  {
    fwrite("Sysdiagnose request to daemon for user interrupt failed", 0x37uLL, 1uLL, __stderrp);
    fputc(10, __stderrp);
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_100007D74(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void sub_10000661C(id a1)
{
  printf("\nCleaning up can take up to a minute...");
  putchar(10);
  if (sub_100005E24(4u, 0, 0))
  {
    printf("Sysdiagnose cancelled successfully.");
    putchar(10);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose cancelled successfully.", buf, 2u);
    }
    exit(0);
  }
  fwrite("Encountered error during user-initiated cancellation.", 0x35uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v1 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Encountered error during user-initiated cancellation.", v1, 2u);
  }
  exit(1);
}

id sub_100006728(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 intValue];
  if (v5)
  {
    uint64_t v6 = +[NSNumber numberWithInt:v5];
    id v7 = (id)sub_100003E94();
  }
  else
  {
    uint64_t v6 = [v4 lastPathComponent];
    id v7 = [v3 isEqualToString:v6];
  }
  id v8 = v7;

  return v8;
}

void sub_1000067C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_1000067DC(int a1, id a2)
{
  return a2;
}

void sub_1000067F8(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

id sub_100006814(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSArray arrayWithObjects:@"/var", @"/tmp", @"/etc", 0];
  id v3 = v1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  uint64_t v5 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v13;
    uint64_t v5 = v3;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v2);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          v16[0] = @"/private";
          v16[1] = v3;
          uint64_t v9 = +[NSArray arrayWithObjects:v16 count:2];
          uint64_t v10 = +[NSString pathWithComponents:v9];

          uint64_t v5 = (void *)v10;
        }
      }
      id v6 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  return v5;
}

void sub_100006A98(id a1)
{
  id v1 = (void *)qword_100010410;
  qword_100010410 = (uint64_t)&off_10000CEA0;
}

id sub_100006D2C()
{
  if (qword_100010420 != -1) {
    dispatch_once(&qword_100010420, &stru_10000C758);
  }
  uint64_t v0 = (void *)qword_100010428;

  return v0;
}

BOOL sub_100006D80(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_100006D2C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100007DB0(v3, v4);
  }

  return 1;
}

void sub_100007558(id a1)
{
  qword_100010428 = (uint64_t)os_log_create("com.apple.sysdiagnose.CacheDelete", "enumerator");

  _objc_release_x1();
}

void sub_10000759C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000761C(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_100004514();
  _os_crash_msg();
  __break(1u);
}

void sub_1000076CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007748(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName: %d", buf, 8u);
}

void sub_100007794(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to create IORegistryEntryCreateIterator: %d", (uint8_t *)v1, 8u);
}

void sub_100007814(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_100004514();
  _os_crash_msg();
  __break(1u);
}

void sub_1000078B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000078EC(void *a1)
{
  id v1 = [a1 localizedDescription];
  [v1 UTF8String];
  sub_1000044F8((void *)&_mh_execute_header, &_os_log_default, v2, "sysdiagnose error: %s", v3, v4, v5, v6, 2u);
}

void sub_100007980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000079BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000079F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000067C0((void *)&_mh_execute_header, &_os_log_default, a3, "xpc_dictionary_get_data returned nothing for 'RESPONSE_DATA' from daemon response for UUID dict", a5, a6, a7, a8, 0);
}

void sub_100007A70(int a1, void *a2)
{
  id v4 = [sub_1000067DC(a1, a2) UTF8String];
  *uint64_t v3 = 136315138;
  void *v2 = v4;
  sub_1000067F8((void *)&_mh_execute_header, &_os_log_default, v5, "Malformed daemon response. Remote UUID '%s' not found");
}

void sub_100007AC0(int a1, void *a2)
{
  id v4 = [[sub_1000067DC(a1, a2) UTF8String];
  *uint64_t v3 = 136315138;
  void *v2 = v4;
  sub_1000067F8((void *)&_mh_execute_header, &_os_log_default, v5, "Remote UUID '%s' not found");
}

void sub_100007B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007B4C(void *a1)
{
  id v1 = [a1 localizedDescription];
  sub_1000044F8((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to deserialize xpc data for UUID dict: %@", v3, v4, v5, v6, 2u);
}

void sub_100007BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007C14(void *a1, const char *a2)
{
  xpc_dictionary_get_string(a1, a2);
  sub_1000044F8((void *)&_mh_execute_header, &_os_log_default, v2, "Received error from the daemon: %s", v3, v4, v5, v6, 2u);
}

void sub_100007C8C(int a1, void *a2)
{
  id v4 = [[sub_1000067DC(a1, a2) UTF8String];
  *uint64_t v3 = 136315138;
  void *v2 = v4;
  sub_1000067F8((void *)&_mh_execute_header, &_os_log_default, v5, "Undefined type in the metadata for key '%s': not including in request");
}

void sub_100007CDC(void *a1, const char *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "com.apple.sysdiagnose.service.xpc";
  __int16 v4 = 2080;
  string = xpc_dictionary_get_string(a1, a2);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "XPC connection to daemon '%s' received error: %s.", (uint8_t *)&v2, 0x16u);
}

void sub_100007D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007DB0(void *a1, NSObject *a2)
{
  id v3 = [a1 localizedDescription];
  int v4 = 136446210;
  id v5 = [v3 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CacheEnumerator error: %{public}s", (uint8_t *)&v4, 0xCu);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fgetc(FILE *a1)
{
  return _fgetc(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

const char *getprogname(void)
{
  return _getprogname();
}

int isatty(int a1)
{
  return _isatty(a1);
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

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int putchar(int a1)
{
  return _putchar(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
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

id objc_msgSend_currentDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 currentDirectoryPath];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enumerators(void *a1, const char *a2, ...)
{
  return [a1 enumerators];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathSubmission(void *a1, const char *a2, ...)
{
  return [a1 pathSubmission];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingSymlinksInPath];
}

id objc_msgSend_sysdiagnoseDirectory(void *a1, const char *a2, ...)
{
  return [a1 sysdiagnoseDirectory];
}

id objc_msgSend_sysdiagnoseInternalDirectory(void *a1, const char *a2, ...)
{
  return [a1 sysdiagnoseInternalDirectory];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_validFileSubstrings(void *a1, const char *a2, ...)
{
  return [a1 validFileSubstrings];
}