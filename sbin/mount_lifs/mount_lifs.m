uint64_t start(int a1, char *const *a2)
{
  int v4;
  char *v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  passwd *v10;
  char *v11;
  uid_t pw_uid;
  char v13;
  int v14;
  group *v15;
  char *v16;
  gid_t gr_gid;
  char v18;
  int v19;
  char *v20;
  unint64_t v21;
  FILE *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  FILE *v26;
  const char *v27;
  int v29;
  unint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  size_t v34;
  size_t v35;
  char *v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  const char *v41;
  const char *v42;
  int v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char **v47;
  const char **v48;
  const char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  int v59;
  int v60;
  stat v61;
  char *__endptr;
  uint8_t buf[4];
  int v64;
  int v65;
  long long v66;
  int v67;
  char v68[1024];
  char v69[1024];
  char v70[64];
  int v71;
  uid_t st_uid;
  gid_t st_gid;
  unsigned __int16 v74;

  memset(&v61, 0, sizeof(v61));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000387C();
  }
  bzero(&v65, 0x8A8uLL);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v60 = 0;
  v67 = 16;
  v66 = xmmword_100003A90;
  do
LABEL_4:
    v8 = getopt(a1, a2, "dg:m:no:u:v");
  while (v8 == 118);
  switch(v8)
  {
    case 'd':
      v65 = 1024;
      goto LABEL_4;
    case 'e':
    case 'f':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
      goto LABEL_30;
    case 'g':
      v9 = optarg;
      v15 = getgrnam(optarg);
      v16 = v9;
      if (v15)
      {
        gr_gid = v15->gr_gid;
      }
      else
      {
        do
        {
          v19 = *v16++;
          v18 = v19;
        }
        while ((v19 - 48) < 0xA);
        if (v18) {
          goto LABEL_129;
        }
        gr_gid = strtol(v9, 0, 10);
      }
      st_gid = gr_gid;
      v4 = 1;
      goto LABEL_4;
    case 'm':
      v20 = optarg;
      __endptr = 0;
      if ((*optarg & 0xF8) != 0x30 || (v21 = strtol(optarg, &__endptr, 8), v21 >> 31) || *__endptr) {
        errx(64, "invalid file mode: %s", v20);
      }
      v74 = v21;
      v6 = 1;
      goto LABEL_4;
    case 'n':
      v60 = 1;
      goto LABEL_4;
    case 'o':
      v5 = optarg;
      if (optarg && *optarg != 63) {
        goto LABEL_4;
      }
      v22 = __stderrp;
      v23 = getprogname();
      fprintf(v22, "usage: %s [-d] [-g <gid>] [-m <mask>] [-o options] [-u <uid>] [-v] <mount_from_location> <mount_on_location>\n", v23);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100003834();
      }
      return 64;
    default:
      if (v8 != -1)
      {
        if (v8 != 117)
        {
LABEL_30:
          fwrite("usage: mount_lifs [-d] [-g <gid>] [-m <mask>] [-o options] [-u <uid>] [-v] <mount_from_location> <mount_on_location>\n", 0x75uLL, 1uLL, __stderrp);
          return 64;
        }
        v9 = optarg;
        v10 = getpwnam(optarg);
        v11 = v9;
        if (v10)
        {
          pw_uid = v10->pw_uid;
        }
        else
        {
          do
          {
            v14 = *v11++;
            v13 = v14;
          }
          while ((v14 - 48) < 0xA);
          if (v13) {
LABEL_129:
          }
            errx(67, "unknown user id: %s", v9);
          pw_uid = strtol(v9, 0, 10);
        }
        st_uid = pw_uid;
        v7 = 1;
        goto LABEL_4;
      }
      v24 = optind;
      v25 = a1 - optind;
      if (v25 > 1)
      {
        if (!v5)
        {
          v29 = 0;
          goto LABEL_93;
        }
        LODWORD(__endptr) = 0;
        v64 = 0;
        if (!getmntopts())
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100003690();
          }
          exit(64);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1000037A4();
        }
        v29 = (int)__endptr;
        if ((__endptr & 0x80000000) != 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "ignoring strictatime options", buf, 2u);
            v29 = (int)__endptr;
          }
          v29 &= ~0x80000000;
          LODWORD(__endptr) = v29;
        }
        if (v64)
        {
          v30 = getmntoptnum();
          if (v30 <= 0x3C) {
            HIDWORD(v66) = v30;
          }
        }
        if ((v64 & 2) != 0)
        {
          v31 = getmntoptnum();
          if (!((unint64_t)(v31 - 1) >> 17)) {
            DWORD2(v66) = v31;
          }
        }
        if ((v64 & 4) != 0)
        {
          v32 = (const char *)getmntoptstr();
          if (v32)
          {
            v33 = v32;
            v34 = strlen(v32);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_10000372C();
            }
            if (v34 > 0x80) {
              sub_100003700();
            }
            if (v34)
            {
              v35 = 0;
              v36 = v70;
              do
              {
                if (v34 <= v35 + 1) {
                  break;
                }
                v37 = v33[v35];
                v38 = v33[v35] - 48;
                if ((v37 - 48) >= 0xA)
                {
                  if ((v37 - 97) > 5)
                  {
                    if ((v37 - 65) > 5) {
                      goto LABEL_130;
                    }
                    v38 = v33[v35] - 55;
                  }
                  else
                  {
                    v38 = v33[v35] - 87;
                  }
                }
                v37 = v33[v35 + 1];
                v39 = v33[v35 + 1] - 48;
                if ((v37 - 48) >= 0xA)
                {
                  if ((v37 - 97) > 5)
                  {
                    if ((v37 - 65) > 5) {
LABEL_130:
                    }
                      errx(65, "Illegal hex character '%c'", v37);
                    v39 = v33[v35 + 1] - 55;
                  }
                  else
                  {
                    v39 = v33[v35 + 1] - 87;
                  }
                }
                *v36++ = v39 | (16 * v38);
                v35 += 2;
              }
              while (v34 > v35);
            }
            v71 = 64;
          }
        }
        v40 = v64;
        if ((v64 & 8) != 0) {
          v65 |= 1u;
        }
        if ((v64 & 0x10) != 0) {
          v65 |= 4u;
        }
        if ((~v64 & 0x24) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setting PFH when FH is active, ignoring", buf, 2u);
          v40 = v64;
        }
        if (v40 < 0)
        {
          v41 = (const char *)getmntoptstr();
          if (v41)
          {
            v42 = v41;
            if (!strcmp(v41, "tcp"))
            {
              v43 = 128;
            }
            else
            {
              if (*v42) {
                goto LABEL_84;
              }
              v43 = 256;
            }
            v65 |= v43;
          }
        }
LABEL_84:
        if ((v64 & 0x100) != 0)
        {
          v44 = getmntoptnum();
          if (v44 <= 0xFF) {
            v67 = v44;
          }
        }
        if ((v64 & 0x200) != 0)
        {
          v45 = getmntoptnum();
          if (!((unint64_t)(v45 - 1) >> 20)) {
            LODWORD(v66) = v45;
          }
        }
        if ((v64 & 0x400) != 0)
        {
          v46 = getmntoptnum();
          if (!((unint64_t)(v46 - 1) >> 20)) {
            DWORD1(v66) = v46;
          }
        }
LABEL_93:
        v47 = (const char **)&a2[v24];
        if ((unint64_t)__strlcpy_chk() >= 0x400)
        {
          fprintf(__stderrp, "Name %s is too long.\n", *v47);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100003400();
          }
          return 65;
        }
        if ((v29 & 0x8000000) != 0)
        {
          v50 = v69;
          __strlcpy_chk();
        }
        else
        {
          v49 = v47[1];
          v48 = v47 + 1;
          v50 = realpath_DARWIN_EXTSN(v49, v69);
          if (!v50)
          {
            fprintf(__stderrp, "Failed to resolve path %s\n", *v48);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100003470((uint64_t)v48, v51, v52, v53, v54, v55, v56, v57);
            }
            return 71;
          }
        }
        if (v7 && v4 && v6)
        {
LABEL_105:
          if (v60)
          {
            printf("mount(\"lifs\", %s, mntflags:0x%x, args:%p\n", v50, v29, &v65);
            printf("args:flags:0x%x,rsize=%d,wsize=%d,dsize=%d,actimeo=%d:readahead=%d:%s:%s:%d:%d:%o\n", v65, v66, DWORD1(v66), DWORD2(v66), HIDWORD(v66), v67, v68, v69, st_uid, st_gid, v74);
            printf("args:fhlen:%d\n", v71);
            if (v71 >= 1)
            {
              v58 = sub_1000032A0(v70, v71);
              printf("args:fh:%s\n", v58);
            }
          }
          else if (mount("lifs", v50, v29, &v65))
          {
            sub_100003564((int *)&__endptr);
            v59 = (int)__endptr;
            goto LABEL_114;
          }
          v59 = 0;
LABEL_114:
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_1000034E8();
          }
          if (v59) {
            return 71;
          }
          else {
            return 0;
          }
        }
        if (stat(v50, &v61))
        {
          fprintf(__stderrp, "Failed to stat the mounton path: %s\n", v50);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100003620();
          }
          return 71;
        }
        if (v7)
        {
          if (v4) {
            goto LABEL_121;
          }
        }
        else
        {
          st_uid = v61.st_uid;
          if (v4)
          {
LABEL_121:
            if (v6) {
              goto LABEL_105;
            }
LABEL_125:
            v74 = v61.st_mode & 0x1FF;
            if (!(v7 | v4))
            {
              v74 = 511;
              v65 |= 0x200000u;
            }
            goto LABEL_105;
          }
        }
        st_gid = v61.st_gid;
        if (v6) {
          goto LABEL_105;
        }
        goto LABEL_125;
      }
      v26 = __stderrp;
      v27 = getprogname();
      fprintf(v26, "usage: %s [-d] [-g <gid>] [-m <mask>] [-o options] [-u <uid>] [-v] <mount_from_location> <mount_on_location>\n", v27);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100003380(v25);
      }
      return 64;
  }
}

char *sub_1000032A0(char *a1, int a2)
{
  size_t v4 = (2 * a2 + 3);
  v5 = (char *)malloc_type_calloc(1uLL, v4, 0x318D0169uLL);
  v6 = v5;
  if (v5)
  {
    strlcpy(v5, "0x", v4);
    if (a2 >= 1)
    {
      uint64_t v7 = a2;
      v8 = v6 + 3;
      do
      {
        *(v8 - 1) = off_100008348[(unint64_t)*a1 >> 4];
        char v9 = *a1++;
        unsigned char *v8 = off_100008348[v9 & 0xF];
        v8 += 2;
        --v7;
      }
      while (v7);
    }
  }
  return v6;
}

void sub_10000334C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003380(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Wrong number of command line parameters:%d", (uint8_t *)v1, 8u);
}

void sub_100003400()
{
  sub_100003368();
  sub_10000334C((void *)&_mh_execute_header, &_os_log_default, v0, "mount from is too long: %zu", v1, v2, v3, v4, v5);
}

void sub_100003470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000034E8()
{
  sub_100003374();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
}

void sub_100003564(int *a1)
{
  int v2 = *__error();
  perror("mount error:");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3[0] = 67109120;
    v3[1] = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mount(2) error: %d", (uint8_t *)v3, 8u);
  }
  *a1 = v2;
}

void sub_100003620()
{
  sub_100003368();
  sub_10000334C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to stat the mounton path:%s", v1, v2, v3, v4, v5);
}

void sub_100003690()
{
  sub_100003368();
  sub_10000334C((void *)&_mh_execute_header, &_os_log_default, v0, "failed to parse mount options:%s", v1, v2, v3, v4, v5);
}

void sub_100003700()
{
}

void sub_10000372C()
{
  sub_100003368();
  sub_100003374();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

void sub_1000037A4()
{
  sub_100003374();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xEu);
}

void sub_100003834()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "usage error", v0, 2u);
}

void sub_10000387C()
{
  sub_100003374();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

void bzero(void *a1, size_t a2)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

group *__cdecl getgrnam(const char *a1)
{
  return _getgrnam(a1);
}

uint64_t getmntoptnum()
{
  return _getmntoptnum();
}

uint64_t getmntopts()
{
  return _getmntopts();
}

uint64_t getmntoptstr()
{
  return _getmntoptstr();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

const char *getprogname(void)
{
  return _getprogname();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}