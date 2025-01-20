int *sub_100001E40(_DWORD *a1)
{
  int *v2;
  io_registry_entry_t v3;
  io_object_t v4;
  CFDataRef CFProperty;
  CFDataRef v6;
  int BootDevice;
  int v8;
  FILE *v9;
  const char *v10;
  char *v11;
  CFRange v13;

  if (!(_BYTE)dword_100008008)
  {
    v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems/fstab");
    if (v3)
    {
      v4 = v3;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"os_env_type", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        v13.length = CFDataGetLength(CFProperty);
        v13.location = 0;
        CFDataGetBytes(v6, v13, (UInt8 *)&dword_100008000);
        CFRelease(v6);
      }
      IOObjectRelease(v4);
      *a1 = dword_100008000;
      BootDevice = APFSContainerGetBootDevice();
      if (!BootDevice)
      {
LABEL_14:
        v2 = &dword_100008008;
        strcpy((char *)&dword_100008008, "/dev/");
        CFStringGetCString(0, (char *)&word_10000800C + 1, 27, 0x8000100u);
        CFRelease(0);
        return v2;
      }
      v8 = 5;
      while (1)
      {
        v9 = __stderrp;
        v10 = dword_100008000 == 1 ? (const char *)&unk_100003A6F : "warning: ";
        v11 = strerror(BootDevice & 0x3FFF);
        fprintf(v9, "%sfailed to get boot device - %s\n", v10, v11);
        if (dword_100008000 == 1) {
          break;
        }
        sleep(1u);
        if ((v8 + 1) < 2) {
          break;
        }
        fprintf(__stderrp, "Retrying (%d retries left)...\n", v8);
        BootDevice = APFSContainerGetBootDevice();
        --v8;
        if (!BootDevice) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      fwrite("failed to get filesystem info\n", 0x1EuLL, 1uLL, __stderrp);
    }
    return 0;
  }
  *a1 = dword_100008000;
  return &dword_100008008;
}

void start(int a1, char *const *a2)
{
  sync();
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v4 = getopt(a1, a2, "dfpR:qnNyYl:L");
        if ((int)v4 <= 88) {
          break;
        }
        switch((int)v4)
        {
          case 'd':
            ++dword_10000803C;
            continue;
          case 'e':
          case 'g':
          case 'h':
          case 'i':
          case 'j':
          case 'k':
          case 'm':
          case 'o':
            goto LABEL_36;
          case 'f':
            ++dword_100008040;
            continue;
          case 'l':
            dword_100008044 = sub_1000022C8(108, optarg);
            continue;
          case 'n':
            goto LABEL_10;
          case 'p':
            ++dword_100008028;
            continue;
          case 'q':
            dword_100008048 = 1;
            continue;
          default:
            if (v4 != 89 && v4 != 121) {
              goto LABEL_36;
            }
            dword_100008058 = 1;
            dword_100008054 = 0;
            break;
        }
      }
      if ((int)v4 <= 77) {
        break;
      }
      if (v4 == 78)
      {
LABEL_10:
        dword_100008054 = 1;
        dword_100008058 = 0;
      }
      else
      {
        if (v4 != 82) {
          goto LABEL_36;
        }
        dword_100008050 = sub_1000022C8(v4, optarg);
        if ((dword_100008050 - 3) <= 0xFFFFFFFD) {
          goto LABEL_35;
        }
      }
    }
    if (v4 != 76)
    {
      if (v4 != -1) {
LABEL_36:
      }
        errx(8, "%c option?", v4);
      int v5 = optind;
      if (signal(2, (void (__cdecl *)(int))1) != (void (__cdecl *)(int))1) {
        signal(2, (void (__cdecl *)(int))sub_100002358);
      }
      if (dword_100008028) {
        signal(3, (void (__cdecl *)(int))sub_10000236C);
      }
      if (v5 == a1)
      {
        if (os_parse_boot_arg_string())
        {
          if (v8 != 1936482662 || v9 != 101) {
            fprintf(__stderrp, "warning: auto-boot is set to %s\n", (const char *)&v8);
          }
        }
        int v7 = sub_1000023B0();
        if (dword_10000802C) {
          int v7 = 2;
        }
        exit(v7);
      }
LABEL_35:
      sub_100002338();
      exit(22);
    }
    dword_10000804C = 1;
  }
}

uint64_t sub_1000022C8(uint64_t a1, char *__str)
{
  __endptr = 0;
  uint64_t result = strtol(__str, &__endptr, 10);
  if (__endptr == __str || *__endptr) {
    errx(8, "-%c flag requires a %s", a1, "number");
  }
  return result;
}

size_t sub_100002338()
{
  return fwrite("fsck usage: fsck [-fdnypqL] [-l number]\n", 0x28uLL, 1uLL, __stderrp);
}

void sub_100002358()
{
}

void (__cdecl *sub_10000236C())(int)
{
  puts("returning to single-user after filesystem check");
  dword_10000802C = 1;

  return signal(3, 0);
}

uint64_t sub_1000023B0()
{
  if (dword_100008048) {
    BOOL v0 = dword_100008050 == 0;
  }
  else {
    BOOL v0 = 0;
  }
  if (v0)
  {
    int v15 = 0;
    int v5 = sub_100001E40(&v15);
    if ((v15 & 0xFFFFFFFD) != 1)
    {
      fwrite("fsck: not booting main or diagnostic OS. Skipping fsck on OS container\n", 0x47uLL, 1uLL, __stdoutp);
      return 0;
    }
    if (v5)
    {
      v6 = strdup((const char *)v5);
      if (v6)
      {
        int v7 = v6;
        int v8 = sub_100002BBC(v6);
        if (v8)
        {
          v14[0] = 0;
          v14[1] = 0;
          v14[2] = v13;
          v14[3] = 0;
          v13[0] = 0;
          v13[1] = v8;
          v13[2] = 0;
          v13[3] = "apfs";
          uint64_t v1 = sub_100002EB0((uint64_t)v14, 0);
        }
        else
        {
          uint64_t v1 = 0;
        }
        free(v7);
        return v1;
      }
      __int16 v9 = __stderrp;
      v10 = "fsck: failed to copy boot container\n";
      size_t v11 = 36;
    }
    else
    {
      __int16 v9 = __stderrp;
      v10 = "fsck: failed to get boot container\n";
      size_t v11 = 35;
    }
    fwrite(v10, v11, 1uLL, v9);
    return 8;
  }
  uint64_t v1 = sub_1000025A8();
  if (!v1 && dword_100008028)
  {
    uint64_t v1 = sub_1000027D4();
    if (v1)
    {
      if (qword_100008068)
      {
        v2 = *(void *)qword_100008068 ? "S" : (const char *)&unk_100003A6F;
        fprintf(__stderrp, "THE FOLLOWING FILE SYSTEM%s HAD AN %s\n\t", v2, "UNEXPECTED INCONSISTENCY:");
        for (uint64_t i = qword_100008068; i; uint64_t i = *(void *)i)
        {
          if (*(void *)i) {
            uint64_t v4 = ", ";
          }
          else {
            uint64_t v4 = "\n";
          }
          fprintf(__stderrp, "%s (%s)%s", *(const char **)(i + 8), *(const char **)(i + 16), v4);
        }
      }
    }
    else
    {
      endfsent();
    }
  }
  return v1;
}

uint64_t sub_1000025A8()
{
  uint64_t v0 = 0;
  if (dword_100008050 == 2) {
    int v1 = 2;
  }
  else {
    int v1 = 1;
  }
  if (dword_100008050 == 1) {
    int v2 = 1;
  }
  else {
    int v2 = v1;
  }
  if (dword_100008050 == 1) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  while (setfsent())
  {
    uint64_t v4 = getfsent();
    if (v4)
    {
      int v5 = v4;
      unsigned int v14 = v0 | 8;
      while (1)
      {
LABEL_13:
        if (!sub_100002AC0((uint64_t)v5)) {
          goto LABEL_28;
        }
        if (!dword_100008028) {
          goto LABEL_18;
        }
        if (v2 != 2) {
          break;
        }
        if (v5->fs_passno < 2) {
          goto LABEL_28;
        }
        __int16 v9 = sub_100002BBC(v5->fs_spec);
        if (v9)
        {
          sub_10000321C(v9, v5->fs_file, v5->fs_vfstype);
          goto LABEL_28;
        }
        fprintf(__stderrp, "BAD DISK NAME %s\n", v5->fs_spec);
        int v5 = getfsent();
        uint64_t v0 = v14;
        if (!v5)
        {
          uint64_t v0 = v14;
          goto LABEL_32;
        }
      }
      if (v2 != 1 || v5->fs_passno != 1) {
        goto LABEL_28;
      }
LABEL_18:
      if (!dword_100008050 || v5->fs_passno == dword_100008050)
      {
        v6 = sub_100002BBC(v5->fs_spec);
        if (!v6)
        {
          fprintf(__stderrp, "BAD DISK NAME %s\n");
          return 8;
        }
        int v7 = v6;
        if (!strcmp(v6, "ramdisk"))
        {
          fprintf(__stdoutp, "Encountered ramdisk definition for location %s - will be created during mount.\n", v5->fs_file);
        }
        else
        {
          v15[2] = 0;
          fs_vfstype = 0;
          v17[0] = 0;
          v17[1] = 0;
          v17[2] = v15;
          v17[3] = 0;
          v15[0] = 0;
          v15[1] = v7;
          fs_vfstype = v5->fs_vfstype;
          uint64_t v8 = sub_100002EB0((uint64_t)v17, 0);
          if (v8) {
            return v8;
          }
        }
      }
LABEL_28:
      int v5 = getfsent();
      if (!v5) {
        goto LABEL_32;
      }
      goto LABEL_13;
    }
LABEL_32:
    if (dword_100008028) {
      BOOL v10 = v2 == v3;
    }
    else {
      BOOL v10 = 1;
    }
    ++v2;
    if (v10) {
      return v0;
    }
  }
  size_t v11 = __stderrp;
  v12 = __error();
  strerror(*v12);
  fprintf(v11, "Can't get filesystem checklist: %s\n");
  return 8;
}

uint64_t sub_1000027D4()
{
  int v20 = 0;
  int v0 = dword_100008044;
  if (dword_100008044) {
    BOOL v1 = dword_100008044 <= dword_100008038;
  }
  else {
    BOOL v1 = 0;
  }
  if (!v1)
  {
    dword_100008044 = dword_100008038;
    int v0 = dword_100008038;
  }
  uint64_t v2 = qword_100008060;
  if (v0 < 1)
  {
LABEL_14:
    pid_t v6 = wait(&v20);
    if (v6 == -1) {
      return 0;
    }
    pid_t v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = qword_100008060;
        if (qword_100008060) {
          break;
        }
LABEL_19:
        printf("Unknown pid %d\n", v7);
        pid_t v7 = wait(&v20);
        if (v7 == -1) {
          return v8;
        }
      }
      while (*(_DWORD *)(v9 + 24) != v7)
      {
        uint64_t v9 = *(void *)(v9 + 8);
        if (!v9) {
          goto LABEL_19;
        }
      }
      if ((v20 & 0x7F) != 0 && (v20 & 0x7F) != 0x7F)
      {
        printf("%s (%s): EXITED WITH SIGNAL %d\n", *(const char **)(*(void *)(v9 + 16) + 8), *(const char **)(*(void *)(v9 + 16) + 16), v20 & 0x7F);
        int v10 = 8;
      }
      else
      {
        int v10 = BYTE1(v20);
        if ((v20 & 0x7F) != 0 || BYTE1(v20) == 0)
        {
          v12 = *(void **)(v9 + 16);
          *(void *)(v9 + 16) = *v12;
          sub_10000337C(v12);
          uint64_t v13 = *(void *)(v9 + 16);
          goto LABEL_32;
        }
      }
      uint64_t v14 = qword_100008068;
      uint64_t v8 = v10 | v8;
      int v15 = *(uint64_t **)(v9 + 16);
      qword_100008068 = (uint64_t)v15;
      uint64_t v13 = *v15;
      *(void *)(v9 + 16) = *v15;
      if (v14) {
        *int v15 = v14;
      }
LABEL_32:
      *(_DWORD *)(v9 + 24) = 0;
      int v16 = dword_100008034--;
      if (v13)
      {
        if (!v2)
        {
          uint64_t result = sub_100003314(v9);
          BOOL v17 = result != 0;
          if (result && dword_100008034 >= 1)
          {
            do
            {
              sleep(0xAu);
              uint64_t result = sub_100003314(v9);
              BOOL v17 = result != 0;
            }
            while (result && dword_100008034 > 0);
          }
          if (v17) {
            return result;
          }
          uint64_t v2 = 0;
          goto LABEL_55;
        }
      }
      else
      {
        --dword_100008038;
        if (!v2) {
          goto LABEL_55;
        }
      }
      if (v16 <= dword_100008044 && v16 <= dword_100008038)
      {
        do
        {
          if (*(void *)(v2 + 8)) {
            uint64_t v2 = *(void *)(v2 + 8);
          }
          else {
            uint64_t v2 = qword_100008060;
          }
        }
        while (!*(void *)(v2 + 16) || *(_DWORD *)(v2 + 24));
        uint64_t result = sub_100003314(v2);
        BOOL v18 = result != 0;
        if (result) {
          BOOL v19 = dword_100008034 < 1;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          do
          {
            sleep(0xAu);
            uint64_t result = sub_100003314(v2);
            BOOL v18 = result != 0;
          }
          while (result && dword_100008034 > 0);
        }
        if (v18) {
          return result;
        }
      }
LABEL_55:
      pid_t v7 = wait(&v20);
      uint64_t result = v8;
      if (v7 == -1) {
        return result;
      }
    }
  }
  int v3 = 0;
  while (1)
  {
    uint64_t result = sub_100003314(v2);
    BOOL v5 = result != 0;
    if (result && dword_100008034 >= 1)
    {
      do
      {
        sleep(0xAu);
        uint64_t result = sub_100003314(v2);
        BOOL v5 = result != 0;
      }
      while (result && dword_100008034 > 0);
    }
    if (v5) {
      return result;
    }
    ++v3;
    uint64_t v2 = *(void *)(v2 + 8);
    if (v3 >= dword_100008044) {
      goto LABEL_14;
    }
  }
}

uint64_t sub_100002AC0(uint64_t a1)
{
  uint64_t v2 = *(const char **)(a1 + 16);
  if (strcmp(v2, "apfs") && strcmp(v2, "hfs") && strcmp(v2, "msdos") && strcmp(v2, "exfat") && strcmp(v2, "udf")) {
    return 0;
  }
  int v3 = *(const char **)(a1 + 32);
  if (strcmp(v3, "rw"))
  {
    if (strcmp(v3, "ro")) {
      return 0;
    }
  }
  if (!*(_DWORD *)(a1 + 44)) {
    return 0;
  }
  uint64_t v4 = *(const char **)a1;
  uint64_t result = strncmp(v4, "LABEL=", 6uLL);
  if (result) {
    return strncmp(v4, "UUID=", 5uLL) != 0;
  }
  return result;
}

char *sub_100002BBC(char *a1)
{
  memset(&v17, 0, sizeof(v17));
  memset(&v16, 0, sizeof(v16));
  memset(&v15, 0, sizeof(v15));
  memset(&changelist, 0, sizeof(changelist));
  memset(&eventlist, 0, sizeof(eventlist));
  timeout.tv_sec = 0;
  timeout.tv_nsec = 0;
  dword_100008030 = 0;
  if (stat("/", &v17) < 0)
  {
    sub_1000036B0();
  }
  else if (!strcmp(a1, "ramdisk"))
  {
    fwrite("Encountered ramdisk definition. Do not stat\n", 0x2CuLL, 1uLL, __stdoutp);
  }
  else
  {
    for (char i = 0; ; char i = 1)
    {
      if (stat(a1, &v16) < 0)
      {
        int v4 = kqueue();
        if (v4 < 0)
        {
          int v10 = __error();
          printf("kqueue: could not create kqueue: %d\n", *v10);
          printf("Can't stat %s\n");
        }
        else
        {
          int v5 = v4;
          changelist.ident = open("/dev/", 0);
          *(void *)&changelist.filter = 0x20025FFFCLL;
          changelist.data = 0;
          changelist.udata = 0;
          if (kevent(v5, &changelist, 1, 0, 0, 0))
          {
            size_t v11 = __error();
            printf("kevent() failed to register: %d\n", *v11);
            printf("Can't stat %s\n", a1);
            close(v5);
          }
          else
          {
            time_t v6 = time(0) + 30;
            timeout.tv_nsec = 0;
            while (1)
            {
              time_t v7 = time(0);
              if (v6 <= v7) {
                break;
              }
              timeout.tv_sec = v6 - v7;
              kevent(v5, 0, 0, &eventlist, 1, &timeout);
              if ((eventlist.flags & 0x4000) != 0)
              {
                puts("kevent: registered errors.");
                break;
              }
              if (!stat(a1, &v16))
              {
                close(v5);
                goto LABEL_5;
              }
            }
            close(v5);
            printf("fsck timed out. Can't stat %s\n");
          }
        }
        return 0;
      }
LABEL_5:
      int v3 = v16.st_mode & 0xF000;
      if (v3 == 24576) {
        break;
      }
      if (i & 1 | (v3 != 0x2000)) {
        return 0;
      }
      sub_1000034AC(a1);
    }
    if (v17.st_dev == v16.st_rdev) {
      ++dword_100008030;
    }
    uint64_t v9 = (const char *)sub_100003414(a1);
    if (stat(v9, &v15) < 0)
    {
      perror(v9);
      printf("Can't stat %s\n");
    }
    else if ((v15.st_mode & 0xF000) == 0x2000)
    {
      return (char *)v9;
    }
    else
    {
      printf("%s is not a character device\n");
    }
  }
  return a1;
}

uint64_t sub_100002EB0(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v22 = 0;
  v21 = 0;
  uint64_t v23 = 0;
  memset(&v16, 0, sizeof(v16));
  int v3 = *(const char **)(v2 + 8);
  int v4 = *(const char **)(v2 + 24);
  if (a2 && dword_100008028) {
    signal(3, (void (__cdecl *)(int))sub_1000033D4);
  }
  if (!strcmp(v3, "ramdisk"))
  {
    fwrite("No need to check filesys for ramdisk, does not exist yet.\n", 0x3AuLL, 1uLL, __stdoutp);
    return 0;
  }
  if (!v4) {
    goto LABEL_31;
  }
  int v15 = 0;
  *(void *)__str = 0;
  __str[8] = 0;
  int v5 = (const char *)&unk_100003A6F;
  if (dword_100008028) {
    time_t v6 = "p";
  }
  else {
    time_t v6 = (const char *)&unk_100003A6F;
  }
  if (dword_10000803C) {
    time_t v7 = "d";
  }
  else {
    time_t v7 = (const char *)&unk_100003A6F;
  }
  if (dword_100008040) {
    uint64_t v8 = "f";
  }
  else {
    uint64_t v8 = (const char *)&unk_100003A6F;
  }
  if (dword_100008054) {
    uint64_t v9 = "n";
  }
  else {
    uint64_t v9 = (const char *)&unk_100003A6F;
  }
  if (dword_100008058) {
    int v10 = "y";
  }
  else {
    int v10 = (const char *)&unk_100003A6F;
  }
  if (dword_100008048) {
    size_t v11 = "q";
  }
  else {
    size_t v11 = (const char *)&unk_100003A6F;
  }
  if (dword_10000804C) {
    int v5 = "l";
  }
  snprintf(__str, 9uLL, "-%s%s%s%s%s%s%s", v6, v7, v8, v9, v10, v11, v5);
  snprintf(v18, 0xFFuLL, "fsck_%s", v4);
  __argv = v18;
  if (strlen(__str) < 2)
  {
    int v12 = 1;
  }
  else
  {
    v21 = __str;
    int v12 = 2;
  }
  (&__argv)[v12] = (char *)v3;
  (&__argv)[v12 + 1] = 0;
  snprintf(__path, 0x401uLL, "%s/fsck_%s", "/sbin", v4);
  if (stat(__path, &v16))
  {
LABEL_31:
    fwrite("Filesystem cannot be checked \n", 0x1EuLL, 1uLL, __stderrp);
    return 8;
  }
  pid_t v14 = fork();
  if (v14 == -1)
  {
    fprintf(__stderrp, "fork failed for %s \n", v3);
    if (dword_100008028)
    {
      fprintf(__stderrp, "\n%s: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.\n", v3);
      exit(8);
    }
    return 8;
  }
  if (!v14)
  {
    if (dword_100008028) {
      signal(3, (void (__cdecl *)(int))sub_1000033D4);
    }
    execv(__path, &__argv);
    fprintf(__stderrp, "error attempting to exec %s\n", __path);
    _exit(8);
  }
  waitpid(v14, &v15, 0);
  if ((v15 & 0x7F) != 0) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = BYTE1(v15);
  }
  if ((v15 & 0x7F) != 0 && (v15 & 0x7F) != 0x7F)
  {
    printf("%s (%s) EXITED WITH SIGNAL %d\n", v3, v4, v15 & 0x7F);
    return 8;
  }
  return result;
}

char *sub_10000321C(char *a1, const char *a2, const char *a3)
{
  time_t v6 = sub_100003554(a1) + 2;
  while (1)
  {
    time_t v7 = *v6;
    if (!*v6) {
      break;
    }
    time_t v6 = (const char **)*v6;
    if (!strcmp(*((const char **)v7 + 1), a1)) {
      return (char *)printf("%s in fstab more than once!\n", a1);
    }
  }
  uint64_t v9 = (const char *)malloc_type_malloc(0x20uLL, 0x30040E3C0B0CCuLL);
  const char *v6 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  int v10 = v9;
  size_t v11 = strdup(a1);
  *((void *)v10 + 1) = v11;
  if (!v11
    || (int v12 = strdup(a2), (*((void *)v10 + 2) = v12) == 0)
    || (*(void *)v10 = 0, uint64_t result = strdup(a3), (*((void *)v10 + 3) = result) == 0))
  {
LABEL_9:
    fwrite("out of memory", 0xDuLL, 1uLL, __stderrp);
    exit(8);
  }
  return result;
}

uint64_t sub_100003314(uint64_t a1)
{
  pid_t v2 = fork();
  *(_DWORD *)(a1 + 24) = v2;
  if (v2 < 0)
  {
    perror("fork");
    return 8;
  }
  else
  {
    if (!v2)
    {
      int v4 = sub_100002EB0(a1, 1);
      exit(v4);
    }
    uint64_t result = 0;
    ++dword_100008034;
  }
  return result;
}

void sub_10000337C(void *a1)
{
  pid_t v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }
  int v3 = (void *)a1[2];
  if (v3) {
    free(v3);
  }
  int v4 = (void *)a1[3];
  if (v4) {
    free(v4);
  }

  free(a1);
}

void (__cdecl *sub_1000033D4())(int)
{
  sleep(1u);
  signal(3, (void (__cdecl *)(int))1);

  return signal(3, 0);
}

void *sub_100003414(char *a1)
{
  BOOL v1 = strrchr(a1, 47);
  if (!v1) {
    return 0;
  }
  pid_t v2 = v1;
  *BOOL v1 = 0;
  int v3 = &unk_100008070;
  __strlcpy_chk();
  char *v2 = 47;
  __strlcat_chk();
  __strlcat_chk();
  return v3;
}

char *sub_1000034AC(char *a1)
{
  pid_t v2 = strrchr(a1, 47);
  if (v2)
  {
    int v3 = v2;
    memset(&v8, 0, sizeof(v8));
    if ((stat(a1, &v8) & 0x80000000) == 0 && (v8.st_mode & 0xF000) == 0x2000)
    {
      int v4 = v3 + 1;
      if (v3[1] == 114)
      {
        int v5 = v3 + 2;
        size_t v6 = strlen(v5);
        memmove(v4, v5, v6 + 1);
      }
    }
  }
  return a1;
}

const char **sub_100003554(char *a1)
{
  pid_t v2 = strrchr(a1, 47);
  if (v2) {
    int v3 = v2 + 1;
  }
  else {
    int v3 = a1;
  }
  int v4 = &v3[~(unint64_t)a1];
  do
  {
    size_t v5 = (size_t)v4;
    int v6 = *v3++;
    unsigned int v7 = v6 - 58;
    ++v4;
    if (v6) {
      BOOL v8 = v7 >= 0xFFFFFFF6;
    }
    else {
      BOOL v8 = 1;
    }
  }
  while (!v8);
  uint64_t v9 = -1;
  do
  {
    unsigned int v10 = v3[v9] - 48;
    ++v5;
    ++v9;
  }
  while (v10 < 0xA);
  if (!v5) {
    size_t v5 = strlen(a1);
  }
  size_t v11 = &qword_100008060;
  int v12 = (const char **)qword_100008060;
  if (qword_100008060)
  {
    while (1)
    {
      uint64_t v13 = v12;
      pid_t v14 = *v12;
      if (!strncmp(*v12, a1, v5) && !v14[v5]) {
        break;
      }
      int v12 = (const char **)v13[1];
      if (!v12)
      {
        size_t v11 = (uint64_t *)(v13 + 1);
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    int v15 = (const char **)malloc_type_malloc(0x20uLL, 0x10300407DFA817CuLL);
    *size_t v11 = (uint64_t)v15;
    if (!v15 || (uint64_t v13 = v15, v16 = (char *)malloc_type_malloc(v5 + 1, 0x23CC5CECuLL), (*uint64_t v13 = v16) == 0))
    {
      fwrite("out of memory", 0xDuLL, 1uLL, __stderrp);
      exit(8);
    }
    strncpy(v16, a1, v5);
    (*v13)[v5] = 0;
    v13[1] = 0;
    v13[2] = 0;
    *((_DWORD *)v13 + 6) = 0;
    ++dword_100008038;
  }
  return v13;
}

uint64_t sub_1000036B0()
{
  return puts("Can't stat root");
}

uint64_t APFSContainerGetBootDevice()
{
  return _APFSContainerGetBootDevice();
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _exit(int a1)
{
}

int close(int a1)
{
  return _close(a1);
}

void endfsent(void)
{
}

void errx(int a1, const char *a2, ...)
{
}

int execv(const char *__path, char *const *__argv)
{
  return _execv(__path, __argv);
}

void exit(int a1)
{
}

pid_t fork(void)
{
  return _fork();
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

fstab *getfsent(void)
{
  return _getfsent();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kqueue(void)
{
  return _kqueue();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

uint64_t os_parse_boot_arg_string()
{
  return _os_parse_boot_arg_string();
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int setfsent(void)
{
  return _setfsent();
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

void sync(void)
{
}

time_t time(time_t *a1)
{
  return _time(a1);
}

pid_t wait(int *a1)
{
  return _wait(a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}