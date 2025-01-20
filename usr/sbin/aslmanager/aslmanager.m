uint64_t *sub_100003B74(char a1)
{
  unsigned int v1;

  v1 = 0;
  byte_100010010 = 0;
  qword_100010008 = 0;
  if (a1)
  {
    LOBYTE(qword_100010008) = 48;
    v1 = &_mh_execute_header.magic + 1;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)&qword_100010008 + v1++) = 49;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)&qword_100010008 + v1++) = 50;
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)&qword_100010008 + v1++) = 51;
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)&qword_100010008 + v1++) = 52;
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)&qword_100010008 + v1++) = 53;
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    *((unsigned char *)&qword_100010008 + v1) = 55;
    return &qword_100010008;
  }
LABEL_17:
  *((unsigned char *)&qword_100010008 + v1++) = 54;
  if (a1 < 0) {
    goto LABEL_18;
  }
LABEL_9:
  if (!v1) {
    LOBYTE(qword_100010008) = 45;
  }
  return &qword_100010008;
}

const char *sub_100003C44(const char *result, char *a2)
{
  int v2 = (int)result;
  if (a2)
  {
    int v3 = *a2;
    if ((v3 | 0x20) == 0x6C)
    {
      result = a2 + 1;
      if ((a2[1] & 0xF8) == 0x30 && !a2[2])
      {
        result = (const char *)atoi(result);
LABEL_13:
        if ((int)result >= 7) {
          int v5 = 7;
        }
        else {
          int v5 = (int)result;
        }
        int v4 = v5 & ~(v5 >> 31);
        goto LABEL_9;
      }
    }
    else if ((v3 & 0xF8) == 0x30 && !a2[1])
    {
      result = (const char *)(atoi(a2) + 2);
      goto LABEL_13;
    }
  }
  int v4 = 3;
LABEL_9:
  if (v4 <= (dword_100010048 & 0xF)) {
    int v4 = dword_100010048 & 0xF;
  }
  dword_100010048 = dword_100010048 & 0xFFFFFFF0 | v2 | v4;
  return result;
}

void sub_100003CFC(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v19 = 0;
  time_t v18 = time(0);
  *(_OWORD *)__s = 0u;
  long long v21 = 0u;
  v11 = localtime(&v18);
  strftime(__s, 0x20uLL, "%b %e %T", v11);
  char v12 = dword_100010048;
  if ((dword_100010048 & 0x20) != 0 && (dword_100010048 & 0xFu) >= a1)
  {
    fprintf(__stderrp, "%s: ", __s);
    v19 = &a9;
    vfprintf(__stderrp, a2, &a9);
    char v12 = dword_100010048;
  }
  if ((v12 & 0x10) != 0 && qword_100010050)
  {
    fprintf((FILE *)qword_100010050, "%s: ", __s);
    v19 = &a9;
    vfprintf((FILE *)qword_100010050, a2, &a9);
    char v12 = dword_100010048;
  }
  if ((v12 & 0x40) != 0)
  {
    v17 = 0;
    if (!qword_100010018)
    {
      qword_100010018 = (uint64_t)asl_open("aslmanager", "syslog", 0);
      v13 = (__asl_object_s *)asl_msg_new();
      asl_msg_set_key_val();
      asl_msg_set_key_val();
      asl_create_auxiliary_file(v13, "Status Report", "public.text", &dword_100010000);
      asl_msg_release();
    }
    v19 = &a9;
    vasprintf(&v17, a2, &a9);
    if (v17)
    {
      size_t v14 = strlen(__s);
      write(dword_100010000, __s, v14);
      size_t v15 = strlen(v17);
      write(dword_100010000, v17, v15);
      v16 = v17;
    }
    else
    {
      v16 = 0;
    }
    free(v16);
  }
}

FILE *sub_100003F30()
{
  if ((dword_100010000 & 0x80000000) == 0) {
    asl_close_auxiliary_file(dword_100010000);
  }
  result = (FILE *)qword_100010050;
  if (qword_100010050)
  {
    return (FILE *)fclose(result);
  }
  return result;
}

const char **sub_100003F7C(const char **a1, const char *a2, char *a3, int a4)
{
  if (!a2) {
    return a1;
  }
  v8 = (char **)malloc_type_calloc(1uLL, 0x20uLL, 0x10300405734DD4FuLL);
  if (!v8) {
    return 0;
  }
  v9 = v8;
  v10 = strdup(a2);
  *v9 = v10;
  if (!v10)
  {
    free(v9);
    return 0;
  }
  v9[1] = a3;
  *((_DWORD *)v9 + 4) = a4;
  if (!a1) {
    return (const char **)v9;
  }
  v11 = v10;
  if (strcmp(v10, *a1) < 1)
  {
    v9[3] = (char *)a1;
    return (const char **)v9;
  }
  v13 = a1;
  do
  {
    size_t v14 = v13;
    v13 = (const char **)v13[3];
  }
  while (v13 && strcmp(v11, *v13) > 0);
  v9[3] = (char *)v13;
  v14[3] = (const char *)v9;
  return a1;
}

void sub_10000405C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      free(*(void **)v1);
      free((void *)v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

uint64_t sub_1000040A0()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  int v5 = open(v4, 0, 0);
  if (v5 < 0) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  uint64_t v7 = open(v2, 513, *(_WORD *)(v3 + 116) & 0x1B6);
  if ((v7 & 0x80000000) != 0 || (int v8 = asl_out_dst_set_access(v7, v3), v8 < 0))
  {
    int v15 = v6;
LABEL_10:
    close(v15);
    return 0xFFFFFFFFLL;
  }
  int v9 = v8;
  gzFile v10 = gzdopen(v8, "w");
  if (!v10)
  {
    close(v6);
    int v15 = v9;
    goto LABEL_10;
  }
  v11 = v10;
  do
  {
    ssize_t v12 = read(v6, buf, 0x1000uLL);
    if (!v12) {
      break;
    }
    ssize_t v13 = v12;
    gzwrite(v11, buf, v12);
  }
  while (v13 == 4096);
  gzclose(v11);
  close(v6);
  close(v9);
  return 0;
}

void sub_1000041E8(const std::__fs::filesystem::path *a1, const std::__fs::filesystem::path *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CFC(5u, "  rename %s ---> %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    rename(a1, a2, v10);
    if (v11)
    {
      char v12 = v11;
      __error();
      ssize_t v13 = __error();
      strerror(*v13);
      sub_100003CFC(3u, "  FAILED status %d errno %d [%s] rename %s ---> %s\n", v14, v15, v16, v17, v18, v19, v12);
    }
  }
}

void sub_100004284(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CFC(5u, "  remove %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    int v9 = unlink(a1);
    if (v9)
    {
      char v10 = v9;
      __error();
      int v11 = __error();
      strerror(*v11);
      sub_100003CFC(3u, "  FAILED status %d errno %d [%s] unlink %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }
}

void sub_100004314(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CFC(5u, "  truncate %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    int v9 = truncate(a1, 0);
    if (v9)
    {
      char v10 = v9;
      __error();
      int v11 = __error();
      strerror(*v11);
      sub_100003CFC(3u, "  FAILED status %d errno %d [%s] unlink %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }
}

void sub_1000043A8(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CFC(5u, "  remove directory %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  if (!byte_100010058)
  {
    int v9 = rmdir(a1);
    if (v9)
    {
      char v10 = v9;
      __error();
      int v11 = __error();
      strerror(*v11);
      sub_100003CFC(3u, "  FAILED status %d errno %d [%s] rmdir %s\n", v12, v13, v14, v15, v16, v17, v10);
    }
  }
}

uint64_t sub_100004438(int a1, char *__s, const char *a3, __int16 a4)
{
  uint64_t result = 0;
  if (__s && a3)
  {
    int v8 = strrchr(__s, 46);
    if (v8 && !strcmp(v8, ".gz")) {
      a4 &= ~0x10u;
    }
    if ((a4 & 0x10) != 0)
    {
      if ((a4 & 0x1000) == 0)
      {
        sub_100003CFC(5u, "  copy compress %s ---> %s.gz\n", v9, v10, v11, v12, v13, v14, (char)__s);
        if (byte_100010058) {
          return 0;
        }
        snprintf(__str, 0x400uLL, "%s.gz", a3);
        if (sub_1000040A0())
        {
          __error();
          v24 = __error();
          strerror(*v24);
          sub_100003CFC(3u, "  FAILED status %d errno %d [%s] copy & compress %s ---> %s\n", v25, v26, v27, v28, v29, v30, -1);
          return 0;
        }
        return 1;
      }
    }
    else
    {
      uint64_t result = strcmp(__s, a3);
      if (!result) {
        return result;
      }
      if ((a4 & 0x1000) == 0)
      {
        sub_100003CFC(5u, "  copy %s ---> %s\n", v9, v10, v11, v12, v13, v14, (char)__s);
        if (byte_100010058) {
          return 0;
        }
        int v15 = copyfile(__s, a3, 0, 0x800Fu);
        if (v15)
        {
          char v16 = v15;
          __error();
          uint64_t v17 = __error();
          strerror(*v17);
          sub_100003CFC(3u, "  FAILED status %d errno %d [%s] copy %s ---> %s\n", v18, v19, v20, v21, v22, v23, v16);
          return 0;
        }
        return 1;
      }
    }
    sub_100003CFC(5u, "  copy asl %s ---> %s\n", v9, v10, v11, v12, v13, v14, (char)__s);
    if (!byte_100010058)
    {
      *(void *)__str = 0;
      int v31 = asl_file_open_read();
      if (v31)
      {
        char v32 = v31;
      }
      else
      {
        int v33 = asl_file_open_write();
        if (v33) {
          char v32 = v33;
        }
        else {
          char v32 = 15;
        }
        asl_file_close();
      }
      asl_core_error();
      sub_100003CFC(3u, "  FAILED status %u [%s] asl copy %s ---> %s\n", v34, v35, v36, v37, v38, v39, v32);
    }
    return 0;
  }
  return result;
}

uint64_t sub_100004714(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CFC(5u, "  reset ctime %s\n", a3, a4, a5, a6, a7, a8, (char)a1);
  v11[1] = 0;
  v11[2] = 0;
  v11[0] = 0x20000000005;
  v10[1] = 0;
  v10[0] = time(0);
  return setattrlist(a1, v11, v10, 0x10uLL, 0);
}

uint64_t sub_100004790(const char *a1)
{
  uint64_t v2 = opendir(a1);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v21 = 0;
    for (i = readdir(v2); i; i = readdir(v3))
    {
      d_name = i->d_name;
      if (strcmp(i->d_name, "."))
      {
        if (strcmp(d_name, ".."))
        {
          asprintf(&v21, "%s/%s", a1, d_name);
          if (v21)
          {
            sub_100004284(v21, v6, v7, v8, v9, v10, v11, v12);
            free(v21);
            uint64_t v21 = 0;
          }
        }
      }
    }
    closedir(v3);
    sub_1000043A8(a1, v13, v14, v15, v16, v17, v18, v19);
  }
  return 0;
}

uint64_t sub_100004864(const char *a1)
{
  uint64_t v2 = opendir(a1);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  memset(&v9, 0, sizeof(v9));
  uint64_t v8 = 0;
  int v4 = readdir(v2);
  for (i = 0; v4; int v4 = readdir(v3))
  {
    d_name = v4->d_name;
    if (strcmp(v4->d_name, "."))
    {
      if (strcmp(d_name, ".."))
      {
        memset(&v9, 0, sizeof(v9));
        uint64_t v8 = 0;
        asprintf(&v8, "%s/%s", a1, d_name);
        if (v8)
        {
          if (!stat(v8, &v9) && (v9.st_mode & 0xF000) == 0x8000)
          {
            i += v9.st_size;
            free(v8);
          }
        }
      }
    }
  }
  closedir(v3);
  return i;
}

time_t sub_1000049A8(unsigned __int8 *a1)
{
  if (!a1) {
    return -1;
  }
  int v1 = *a1;
  if ((v1 | 0x20) == 0x74)
  {
    uint64_t v2 = (char *)(a1 + 1);
    uint64_t v3 = atol((const char *)a1 + 1);
    if (v3 || *v2 == 48)
    {
      if (strchr(v2, 46)) {
        return v3;
      }
      else {
        return -1;
      }
    }
    return -1;
  }
  memset(&v48, 0, sizeof(v48));
  if ((v1 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v5 = a1[1];
  if ((v5 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v6 = a1[2];
  if ((v6 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v7 = a1[3];
  if ((v7 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  uint64_t v8 = a1 + 5;
  int v11 = a1[4];
  stat v9 = a1 + 4;
  int v10 = v11;
  v48.tm_year = 10 * v6 + 100 * v5 + 1000 * v1 + v7 - 55228;
  uint64_t v12 = v11 == 45 ? v8 : v9;
  uint64_t v13 = v10 == 46 ? v8 : v12;
  int v14 = *v13;
  if ((v14 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v15 = v13[1];
  if ((v15 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  v48.tm_mon = v15 + 10 * v14 - 529;
  uint64_t v16 = v13 + 2;
  uint64_t v17 = 2;
  if (v13[2] - 45 < 2)
  {
    uint64_t v17 = 3;
    uint64_t v16 = v13 + 3;
  }
  int v18 = v13[v17];
  if ((v18 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v19 = 10 * v18;
  v48.tm_mday = v19 - 480;
  int v20 = v16[1];
  if ((v20 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  v48.tm_mday = v19 + v20 - 528;
  int v21 = v16[2];
  if (v10 == 46)
  {
    if (v21 == 46 || !v16[2])
    {
      *(void *)&v48.tm_sec = 0;
      v48.tm_hour = 24;
      v48.tm_isdst = -1;
      return mktime(&v48);
    }
    return -1;
  }
  if ((v21 | 0x20) != 0x74) {
    return 1;
  }
  int v22 = v16[3];
  if ((v22 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v23 = 10 * v22;
  v48.tm_hour = v23 - 480;
  int v24 = v16[4];
  if ((v24 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  v48.tm_hour = v23 + v24 - 528;
  uint64_t v25 = v16 + 5;
  uint64_t v26 = 5;
  if (v16[5] == 58)
  {
    uint64_t v26 = 6;
    uint64_t v25 = v16 + 6;
  }
  int v27 = v16[v26];
  if ((v27 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v28 = 10 * v27;
  v48.tm_min = v28 - 480;
  int v29 = v25[1];
  if ((v29 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  v48.tm_min = v28 + v29 - 528;
  uint64_t v30 = v25[2] == 58 ? 3 : 2;
  uint64_t v31 = (uint64_t)(v25[2] == 58 ? v25 + 3 : v25 + 2);
  int v32 = v25[v30];
  if ((v32 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v33 = 10 * v32;
  v48.tm_sec = v33 - 480;
  int v34 = *(unsigned __int8 *)(v31 + 1);
  if ((v34 - 58) < 0xFFFFFFF6) {
    return 1;
  }
  int v35 = v33 + v34 - 528;
  v48.tm_sec = v35;
  unsigned int v36 = *(unsigned __int8 *)(v31 + 2);
  time_t result = 1;
  if (v36 > 0x59)
  {
    if (v36 == 122 || v36 == 90) {
      return timegm(&v48);
    }
  }
  else if (v36 == 43 || v36 == 45)
  {
    int v37 = *(unsigned __int8 *)(v31 + 3);
    if ((v37 - 58) >= 0xFFFFFFF6)
    {
      int v38 = v37 - 48;
      int v40 = *(char *)(v31 + 4);
      uint64_t v39 = (unsigned __int8 *)(v31 + 4);
      int v41 = v40 + 10 * v38 - 48;
      if ((v40 - 58) >= 0xF6u)
      {
        int v38 = v41;
        ++v39;
      }
      if (v38 <= 23)
      {
        int v42 = *v39;
        if ((v42 - 48) > 0xA)
        {
          unsigned int v45 = 0;
        }
        else
        {
          int v43 = v39[1];
          if ((v43 - 58) < 0xFFFFFFF6) {
            return -1;
          }
          int v44 = v42 == 58 ? -48 : 10 * v42 - 528;
          unsigned int v45 = v44 + v43;
          if (v45 > 0x3B) {
            return -1;
          }
          v39 += 2;
        }
        int v46 = 3600 * v38;
        if (v36 == 45) {
          int v47 = v46;
        }
        else {
          int v47 = -v46;
        }
        v48.tm_sec = v47 + v35 + 60 * v45;
        if (*v39 != 46 && *v39) {
          return -1;
        }
        return timegm(&v48);
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_100004D7C(unsigned __int8 *a1, time_t a2, int *a3, int *a4)
{
  if (!a1) {
    return 0;
  }
  time_t v6 = a2;
  if (!a2) {
    time_t v6 = time(0);
  }
  time_t v8 = sub_1000049A8(a1);
  uint64_t v9 = 0;
  if ((v8 & 0x8000000000000000) == 0 && v6 >= v8)
  {
    uint64_t v9 = (v6 - v8);
    if (a3)
    {
      *a3 = -1;
      int v10 = strchr((char *)a1, 85);
      if (v10) {
        *a3 = atoi(v10 + 1);
      }
    }
    if (a4)
    {
      *a4 = -1;
      int v11 = strchr((char *)a1, 71);
      if (v11) {
        *a4 = atoi(v11 + 1);
      }
    }
  }
  return v9;
}

uint64_t sub_100004E44(const char *a1, const char *a2, char a3)
{
  if (snprintf(__str, 0x400uLL, "%s/%s", a2, a1) > 1023 || snprintf(v28, 0x400uLL, "%s/%s", a2, a1) > 1023) {
    return 9999;
  }
  *(_DWORD *)&v28[strlen(__str) - 3] = 7368052;
  sub_100003B74(a3);
  sub_100003CFC(5u, "  filter %s %s ---> %s\n", v8, v9, v10, v11, v12, v13, (char)__str);
  if (byte_100010058)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = asl_file_open_read();
    if (v6) {
      return v6;
    }
    uint64_t v6 = asl_file_filter_level();
    asl_file_close();
  }
  sub_100004284(__str, v14, v15, v16, v17, v18, v19, v20);
  sub_100004284(v28, v21, v22, v23, v24, v25, v26, v27);
  return v6;
}

void sub_100004FF8(const char *a1)
{
  if (a1 && !strncmp(a1, "file:///var/log/asl/", 0x14uLL))
  {
    sub_100004284(a1 + 7, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t sub_100005050(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  if (!*(void *)(result + 8)) {
    return 0;
  }
  unsigned int v9 = *(_DWORD *)(result + 112);
  if (a2)
  {
    if (*(_DWORD *)(a2 + 112)) {
      unsigned int v9 = *(_DWORD *)(a2 + 112);
    }
    if (*(void *)(a2 + 160)) {
      unint64_t v10 = *(void *)(a2 + 160);
    }
    else {
      unint64_t v10 = *(void *)(result + 160);
    }
  }
  else
  {
    unint64_t v10 = *(void *)(result + 160);
  }
  v250 = 0;
  time_t v251 = 0;
  memset(&v249, 0, sizeof(v249));
  memset(&v248, 0, sizeof(v248));
  sub_100003CFC(5u, "----------------------------------------\n", a3, a4, a5, a6, a7, a8, v224);
  sub_100003CFC(5u, "Processing data store %s\n", v11, v12, v13, v14, v15, v16, *(void *)(v8 + 8));
  uint64_t v17 = *(const char **)(v8 + 32);
  if (v17)
  {
    memset(&v249, 0, sizeof(v249));
    if (stat(v17, &v249))
    {
      uint64_t v24 = __error();
      uint64_t v25 = *(void *)(v8 + 32);
      if (*v24 != 2)
      {
        v53 = __error();
        strerror(*v53);
        sub_100003CFC(3u, "aslmanager error: can't stat archive %s: %s\n", v54, v55, v56, v57, v58, v59, v25);
        return 0xFFFFFFFFLL;
      }
      if (mkdir(*(const char **)(v8 + 32), 0x1EDu))
      {
        uint64_t v26 = *(void *)(v8 + 32);
        uint64_t v27 = __error();
        strerror(*v27);
        sub_100003CFC(3u, "aslmanager error: can't create archive %s: %s\n", v28, v29, v30, v31, v32, v33, v26);
        return 0xFFFFFFFFLL;
      }
    }
    else if ((v249.st_mode & 0xF000) != 0x4000)
    {
      sub_100003CFC(3u, "aslmanager error: archive %s is not a directory", v18, v19, v20, v21, v22, v23, *(void *)(v8 + 32));
      return 0xFFFFFFFFLL;
    }
  }
  chdir(*(const char **)(v8 + 8));
  time_t v251 = time(0);
  localtime_r(&v251, &v248);
  *(void *)&v248.tm_sec = 0;
  v248.tm_hour = 0;
  time_t v34 = mktime(&v248);
  time_t v35 = v251;
  unsigned int v36 = opendir(*(const char **)(v8 + 8));
  if (!v36) {
    return 0xFFFFFFFFLL;
  }
  int v37 = v36;
  time_t v238 = v35;
  time_t v239 = v34;
  int v38 = readdir(v36);
  unint64_t v240 = v10;
  if (v38)
  {
    uint64_t v39 = v38;
    v244 = 0;
    v245 = 0;
    v242 = 0;
    v243 = 0;
    unint64_t v40 = 0;
    while (1)
    {
      d_name = v39->d_name;
      memset(&v249, 0, sizeof(v249));
      if (stat(v39->d_name, &v249)) {
        off_t st_size = 0;
      }
      else {
        off_t st_size = v249.st_size;
      }
      int v43 = strrchr(v39->d_name, 46);
      if (v43) {
        BOOL v44 = strcmp(v43, ".gz") == 0;
      }
      else {
        BOOL v44 = 0;
      }
      int v45 = *(unsigned __int8 *)d_name;
      if ((v45 - 48) <= 9
        || (v45 | 0x20) == 0x74 && v39->d_name[1] - 48 <= 9)
      {
        v245 = sub_100003F7C(v245, v39->d_name, (char *)st_size, v44);
      }
      else
      {
        if (!strncmp(v39->d_name, "AUX.", 4uLL)
          && v39->d_name[4] - 48 <= 9
          && (v249.st_mode & 0xF000) == 0x4000)
        {
          uint64_t v46 = sub_100004864(v39->d_name);
          v243 = sub_100003F7C(v243, d_name, (char *)v46, v44);
LABEL_40:
          v40 += v46;
          goto LABEL_30;
        }
        if (!strncmp(v39->d_name, "BB.AUX.", 7uLL)
          && v39->d_name[7] - 48 <= 9
          && (v249.st_mode & 0xF000) == 0x4000)
        {
          uint64_t v46 = sub_100004864(v39->d_name);
          v242 = sub_100003F7C(v242, d_name, (char *)v46, v44);
          goto LABEL_40;
        }
        if (strncmp(v39->d_name, "BB.", 3uLL) || v39->d_name[3] - 48 > 9)
        {
          if (strcmp(v39->d_name, ".")
            && strcmp(v39->d_name, "..")
            && strcmp(v39->d_name, "StoreData")
            && strcmp(v39->d_name, "SweepStore")
            && strcmp(v39->d_name, "Logs"))
          {
            sub_100003CFC(3u, "aslmanager: unexpected file %s in ASL data store\n", v47, v48, v49, v50, v51, v52, (_BYTE)v39 + 21);
          }
          goto LABEL_30;
        }
        v244 = sub_100003F7C(v244, v39->d_name, (char *)st_size, v44);
      }
      v40 += st_size;
LABEL_30:
      uint64_t v39 = readdir(v37);
      if (!v39) {
        goto LABEL_52;
      }
    }
  }
  v242 = 0;
  v243 = 0;
  unint64_t v40 = 0;
  v244 = 0;
  v245 = 0;
LABEL_52:
  uint64_t v241 = v8;
  closedir(v37);
  sub_100003CFC(5u, "Data Store Size = %lu\n", v60, v61, v62, v63, v64, v65, v40);
  asl_core_time_to_str();
  sub_100003CFC(5u, "Data Store YMD Files (TTL = %s)\n", v66, v67, v68, v69, v70, v71, &vars0 + 24);
  if (v245)
  {
    v78 = v245;
    do
    {
      sub_100004D7C((unsigned __int8 *)*v78, v251, 0, 0);
      asl_core_time_to_str();
      sub_100003CFC(5u, "  %s   %lu (age %s%s)\n", v79, v80, v81, v82, v83, v84, (char)*v78);
      v78 = (const char **)v78[3];
    }
    while (v78);
  }
  sub_100003CFC(5u, "Data Store AUX Directories\n", v72, v73, v74, v75, v76, v77, v225);
  if (v243)
  {
    v91 = v243;
    do
    {
      sub_100004D7C((unsigned __int8 *)*v91 + 4, v251, 0, 0);
      asl_core_time_to_str();
      sub_100003CFC(5u, "  %s   %lu (age %s)\n", v92, v93, v94, v95, v96, v97, (char)*v91);
      v91 = (const char **)v91[3];
    }
    while (v91);
  }
  sub_100003CFC(5u, "Data Store BB.AUX Directories\n", v85, v86, v87, v88, v89, v90, v226);
  if (v242)
  {
    v104 = v242;
    do
    {
      sub_100004D7C((unsigned __int8 *)*v104 + 7, v251, 0, 0);
      asl_core_time_to_str();
      sub_100003CFC(5u, "  %s   %lu (age %s)\n", v105, v106, v107, v108, v109, v110, (char)*v104);
      v104 = (const char **)v104[3];
    }
    while (v104);
  }
  sub_100003CFC(5u, "Data Store BB Files\n", v98, v99, v100, v101, v102, v103, v227);
  if (v244)
  {
    v117 = v244;
    do
    {
      sub_100004D7C((unsigned __int8 *)*v117 + 3, v251, 0, 0);
      asl_core_time_to_str();
      sub_100003CFC(5u, "  %s   %lu (age %s)\n", v118, v119, v120, v121, v122, v123, (char)*v117);
      v117 = (const char **)v117[3];
    }
    while (v117);
  }
  sub_100003CFC(5u, "Start YMD File Scan\n", v111, v112, v113, v114, v115, v116, v228);
  v130 = v245;
  if (v245)
  {
    uint64_t v131 = v241;
    do
    {
      int v246 = -1;
      int v247 = -1;
      unsigned int v132 = sub_100004D7C((unsigned __int8 *)*v130, v251, &v247, &v246);
      if (v132 <= v9)
      {
        if (((_BYTE)v130[2] & 1) == 0)
        {
          unsigned int v135 = v132;
          if (v132)
          {
            uint64_t v136 = 0;
            int v137 = 1;
            int v138 = 255;
            do
            {
              if (*(_DWORD *)(v241 + 80 + v136) - 1 < v132) {
                int v139 = ~v137;
              }
              else {
                int v139 = -1;
              }
              v138 &= v139;
              v137 *= 2;
              v136 += 4;
            }
            while (v136 != 32);
            memset(&v249, 0, sizeof(v249));
            stat(*v130, &v249);
            if (v138 != 255) {
              sub_100004E44(*v130, *(const char **)(v241 + 8), v138);
            }
          }
          if (v238 - v239 < v135 && (*(unsigned char *)(v241 + 72) & 0x10) != 0)
          {
            snprintf(__str, 0x400uLL, "%s.gz", *v130);
            sub_100003CFC(5u, "  compress %s ---> %s\n", v140, v141, v142, v143, v144, v145, (char)*v130);
            if (!byte_100010058)
            {
              if (sub_1000040A0())
              {
                __error();
                v217 = __error();
                strerror(*v217);
                sub_100003CFC(3u, "  FAILED status %d errno %d [%s] compress %s ---> %s\n", v218, v219, v220, v221, v222, v223, -1);
                return 0;
              }
              sub_100004284(*v130, v146, v147, v148, v149, v150, v151, v152);
            }
          }
        }
      }
      else
      {
        v134 = *(const char **)(v241 + 32);
        if (v134)
        {
          v250 = 0;
          asprintf(&v250, "%s/%s", v134, *v130);
          if (!v250) {
            return 0xFFFFFFFFLL;
          }
          sub_100004438(v241, (char *)*v130, v250, 0);
          free(v250);
        }
        sub_100004284(*v130, v133, v124, v125, v126, v127, v128, v129);
        v40 -= (unint64_t)v130[1];
        v130[1] = 0;
      }
      v130 = (const char **)v130[3];
    }
    while (v130);
  }
  else
  {
    uint64_t v131 = v241;
  }
  sub_100003CFC(5u, "Finished YMD File Scan\n", v124, v125, v126, v127, v128, v129, v229);
  sub_100003CFC(5u, "Start AUX Directory Scan\n", v153, v154, v155, v156, v157, v158, v230);
  if (v243)
  {
    v165 = v243;
    unint64_t v166 = v240;
    do
    {
      if (sub_100004D7C((unsigned __int8 *)*v165 + 4, v251, 0, 0) > v9)
      {
        v167 = *(const char **)(v131 + 32);
        if (v167)
        {
          v250 = 0;
          asprintf(&v250, "%s/%s", v167, *v165);
          if (!v250) {
            return 0xFFFFFFFFLL;
          }
          sub_100004438(v131, (char *)*v165, v250, 0);
          free(v250);
        }
        sub_100004790(*v165);
        v40 -= (unint64_t)v165[1];
        v165[1] = 0;
      }
      v165 = (const char **)v165[3];
    }
    while (v165);
  }
  else
  {
    unint64_t v166 = v10;
  }
  sub_100003CFC(5u, "Finished AUX Directory Scan\n", v159, v160, v161, v162, v163, v164, v231);
  sub_100003CFC(5u, "Start BB.AUX Directory Scan\n", v168, v169, v170, v171, v172, v173, v232);
  if (v242)
  {
    v180 = v242;
    uint64_t v181 = (uint64_t)v244;
    do
    {
      if (sub_100004D7C((unsigned __int8 *)*v180 + 7, v251, 0, 0))
      {
        v182 = *(const char **)(v131 + 32);
        if (v182)
        {
          v250 = 0;
          asprintf(&v250, "%s/%s", v182, *v180);
          if (!v250) {
            return 0xFFFFFFFFLL;
          }
          sub_100004438(v131, (char *)*v180, v250, 0);
          free(v250);
        }
        sub_100004790(*v180);
        v40 -= (unint64_t)v180[1];
        v180[1] = 0;
      }
      v180 = (const char **)v180[3];
    }
    while (v180);
  }
  else
  {
    uint64_t v181 = (uint64_t)v244;
  }
  sub_100003CFC(5u, "Finished BB.AUX Directory Scan\n", v174, v175, v176, v177, v178, v179, v233);
  sub_100003CFC(5u, "Start BB Scan\n", v183, v184, v185, v186, v187, v188, v234);
  if (v181)
  {
    v195 = (const char **)v181;
    do
    {
      if (sub_100004D7C((unsigned __int8 *)*v195 + 3, v251, 0, 0))
      {
        v197 = *(const char **)(v131 + 32);
        if (v197)
        {
          v250 = 0;
          asprintf(&v250, "%s/%s", v197, *v195);
          if (!v250) {
            return 0xFFFFFFFFLL;
          }
          sub_100004438(v131, (char *)*v195, v250, 0);
          free(v250);
        }
        sub_100004284(*v195, v196, v189, v190, v191, v192, v193, v194);
        v40 -= (unint64_t)v195[1];
        v195[1] = 0;
      }
      v195 = (const char **)v195[3];
    }
    while (v195);
  }
  sub_100003CFC(5u, "Finished BB Scan\n", v189, v190, v191, v192, v193, v194, v235);
  if (!v166) {
    goto LABEL_147;
  }
  if (v40 <= v166) {
    goto LABEL_135;
  }
  sub_100003CFC(5u, "Additional YMD Scan\n", v199, v200, v201, v202, v203, v204, v236);
  v205 = v245;
  if (!v245) {
    goto LABEL_134;
  }
  do
  {
    while (1)
    {
      if (!v205[1]) {
        goto LABEL_129;
      }
      if (sub_100004D7C((unsigned __int8 *)*v205, v251, 0, 0)) {
        break;
      }
      v205 = (const char **)v205[3];
      if (!v205) {
        goto LABEL_134;
      }
    }
    v206 = *(const char **)(v131 + 32);
    if (v206)
    {
      v250 = 0;
      asprintf(&v250, "%s/%s", v206, *v205);
      if (!v250) {
        return 0xFFFFFFFFLL;
      }
      sub_100004438(v131, (char *)*v205, v250, 0);
      free(v250);
    }
    sub_100004284(*v205, v198, v199, v200, v201, v202, v203, v204);
    v40 -= (unint64_t)v205[1];
    v205[1] = 0;
LABEL_129:
    v205 = (const char **)v205[3];
    if (v205) {
      BOOL v207 = v40 > v166;
    }
    else {
      BOOL v207 = 0;
    }
  }
  while (v207);
  if (v40 > v166) {
LABEL_134:
  }
    sub_100003CFC(5u, "Additional BB Scan\n", v199, v200, v201, v202, v203, v204, v237);
LABEL_135:
  if (v181 && v40 > v166)
  {
    v208 = (const char **)v181;
    do
    {
      if (v208[1])
      {
        v209 = *(const char **)(v131 + 32);
        if (v209)
        {
          v250 = 0;
          asprintf(&v250, "%s/%s", v209, *v208);
          if (!v250) {
            return 0xFFFFFFFFLL;
          }
          sub_100004438(v131, (char *)*v208, v250, 0);
          free(v250);
        }
        sub_100004284(*v208, v198, v199, v200, v201, v202, v203, v204);
        v40 -= (unint64_t)v208[1];
        v208[1] = 0;
      }
      v208 = (const char **)v208[3];
      if (v208) {
        BOOL v210 = v40 > v166;
      }
      else {
        BOOL v210 = 0;
      }
    }
    while (v210);
  }
LABEL_147:
  sub_10000405C((uint64_t)v245);
  sub_10000405C(v181);
  sub_10000405C((uint64_t)v243);
  sub_10000405C((uint64_t)v242);
  sub_100003CFC(5u, "Data Store Size = %lu\n", v211, v212, v213, v214, v215, v216, v40);
  return 0;
}

uint64_t sub_100005CA8(uint64_t a1)
{
  if (!a1 || !*(void *)(a1 + 8)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = asl_list_src_files(a1);
  if (!v2) {
    goto LABEL_30;
  }
  unsigned int v9 = v2;
  if (LODWORD(v2->__dd_loc)) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)(a1 + 72) & 0x40) == 0)
  {
    unint64_t v10 = "    ignore src file %s since it is internal and syslogd will checkpoint it when it needs to be renamed\n";
    goto LABEL_10;
  }
  if (time(0) - v2->__dd_size > 86399)
  {
LABEL_11:
    sub_100003CFC(6u, "    src files\n", v3, v4, v5, v6, v7, v8, v74);
    int v19 = 0;
    uint64_t v20 = v9;
    do
    {
      sub_100003CFC(6u, "      %s\n", v13, v14, v15, v16, v17, v18, *(void *)&v20->__dd_fd);
      ++v19;
      uint64_t v20 = (DIR *)v20->__dd_seek;
    }
    while (v20);
    uint64_t v21 = asl_list_dst_files(a1);
    uint64_t v28 = v21;
    uint64_t v29 = *(const char **)(a1 + 32);
    if (!v29) {
      uint64_t v29 = *(const char **)a1;
    }
    uint64_t v76 = (uint64_t)v21;
    if (v21)
    {
      sub_100003CFC(6u, "    dst files\n", v22, v23, v24, v25, v26, v27, v75);
      unsigned int v36 = v28;
      do
      {
        sub_100003CFC(6u, "      %s\n", v30, v31, v32, v33, v34, v35, *(void *)&v36->__dd_fd);
        unsigned int v36 = (DIR *)v36->__dd_seek;
      }
      while (v36);
      int v37 = (int *)(a1 + 64);
      if ((*(unsigned char *)(a1 + 64) & 2) != 0)
      {
        int v38 = v28;
        do
        {
          uint64_t v39 = *(const char **)&v38->__dd_fd;
          unint64_t v40 = strrchr(*(char **)&v38->__dd_fd, 46);
          if (v40) {
            strcmp(v40, ".gz");
          }
          snprintf((char *)__str, 0x400uLL, "%s/%s", v29, v39);
          int v47 = *v37;
          if ((*v37 & 0x10000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d%s");
          }
          else if ((v47 & 0x20000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%s.%d%s");
          }
          else if ((v47 & 0x40000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d.%s%s");
          }
          sub_1000041E8(__str, v78, v41, v42, v43, v44, v45, v46);
          int v38 = (DIR *)v38->__dd_seek;
        }
        while (v38);
        goto LABEL_49;
      }
    }
    else
    {
      sub_100003CFC(6u, "    no dst files\n", v22, v23, v24, v25, v26, v27, v75);
      int v37 = (int *)(a1 + 64);
      if ((*(unsigned char *)(a1 + 64) & 2) != 0)
      {
LABEL_49:
        int v57 = 0;
        uint64_t v58 = v9;
        do
        {
          snprintf((char *)__str, 0x400uLL, "%s/%s", *(const char **)a1, *(const char **)&v58->__dd_fd);
          int v59 = *(_DWORD *)(a1 + 64);
          if ((v59 & 0x10000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d");
          }
          else if ((v59 & 0x20000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%s.%d");
          }
          else if ((v59 & 0x40000000) != 0)
          {
            snprintf((char *)v78, 0x400uLL, "%s/%s.%d.%s");
          }
          if (sub_100004438(a1, (char *)__str, (const char *)v78, *(_DWORD *)(a1 + 72)))
          {
            if ((*(unsigned char *)(a1 + 72) & 0x80) != 0)
            {
              sub_100004314((const char *)__str, v60, v61, v62, v63, v64, v65, v66);
              sub_100004714((const char *)__str, v67, v68, v69, v70, v71, v72, v73);
            }
            else
            {
              sub_100004284((const char *)__str, v60, v61, v62, v63, v64, v65, v66);
            }
          }
          uint64_t v58 = (DIR *)v58->__dd_seek;
          ++v57;
        }
        while (v58);
LABEL_61:
        asl_out_file_list_free((uint64_t)v9);
        asl_out_file_list_free(v76);
        return 0;
      }
    }
    uint64_t v48 = v9;
    do
    {
      if ((*(unsigned char *)(a1 + 73) & 1) != 0 && !v48->__dd_seek) {
        break;
      }
      snprintf((char *)__str, 0x400uLL, "%s/%s", *(const char **)a1, *(const char **)&v48->__dd_fd);
      if ((*(unsigned char *)(a1 + 72) & 0x40) != 0)
      {
        asl_make_timestamp(v48->__dd_size, *v37, v77, 0x20uLL);
        int v49 = *v37;
        if ((*v37 & 0x10000000) != 0)
        {
          snprintf((char *)v78, 0x400uLL, "%s/%s.%s");
        }
        else if ((v49 & 0x20000000) != 0 || (v49 & 0x40000000) != 0)
        {
          snprintf((char *)v78, 0x400uLL, "%s/%s.%s.%s");
        }
      }
      else
      {
        snprintf((char *)v78, 0x400uLL, "%s/%s");
      }
      if (sub_100004438(a1, (char *)__str, (const char *)v78, *(_DWORD *)(a1 + 72)))
      {
        if ((*(unsigned char *)(a1 + 72) & 0x80) != 0) {
          sub_100004314((const char *)__str, v50, v51, v52, v53, v54, v55, v56);
        }
        else {
          sub_100004284((const char *)__str, v50, v51, v52, v53, v54, v55, v56);
        }
      }
      uint64_t v48 = (DIR *)v48->__dd_seek;
    }
    while (v48);
    goto LABEL_61;
  }
  unint64_t v10 = "    ignore src file %s since it is external and less than a day old\n";
LABEL_10:
  sub_100003CFC(6u, v10, v3, v4, v5, v6, v7, v8, *(void *)&v9->__dd_fd);
  dd_seek = (DIR *)v9->__dd_seek;
  v9->__dd_seek = 0;
  asl_out_file_list_free((uint64_t)v9);
  unsigned int v9 = dd_seek;
  if (dd_seek) {
    goto LABEL_11;
  }
LABEL_30:
  sub_100003CFC(6u, "    no src files\n", v3, v4, v5, v6, v7, v8, v74);
  return 0;
}

uint64_t sub_1000061A4(uint64_t a1, uint64_t a2)
{
  if (!a1 || !*(void *)(a1 + 8)) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 112);
  if (!v3) {
    return 0;
  }
  if (a2 && *(_DWORD *)(a2 + 112)) {
    unsigned int v3 = *(_DWORD *)(a2 + 112);
  }
  time_t v4 = time(0);
  if (v4 < v3) {
    return 0;
  }
  time_t v6 = v4;
  uint64_t v7 = strrchr(*(char **)(a1 + 8), 47);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v7;
  unsigned int v9 = asl_list_dst_files(a1);
  uint64_t v16 = v9;
  *uint64_t v8 = 0;
  uint64_t v17 = *(const char **)(a1 + 32);
  if (!v17) {
    uint64_t v17 = *(const char **)a1;
  }
  if (v9)
  {
    time_t v18 = v3;
    sub_100003CFC(6u, "    dst files\n", v10, v11, v12, v13, v14, v15, v33);
    uint64_t v34 = v16;
    do
    {
      asl_core_time_to_str();
      sub_100003CFC(6u, "      %s (age %s%s)\n", v19, v20, v21, v22, v23, v24, *(void *)&v16->__dd_fd);
      uint64_t v16 = (DIR *)v16->__dd_seek;
    }
    while (v16);
    uint64_t v16 = v34;
    uint64_t v25 = v34;
    do
    {
      if (v6 - v25->__dd_size > v18)
      {
        snprintf(__str, 0x400uLL, "%s/%s", v17, *(const char **)&v25->__dd_fd);
        sub_100004284(__str, v26, v27, v28, v29, v30, v31, v32);
      }
      uint64_t v25 = (DIR *)v25->__dd_seek;
    }
    while (v25);
  }
  else
  {
    sub_100003CFC(6u, "    no dst files\n", v10, v11, v12, v13, v14, v15, v33);
  }
  asl_out_file_list_free((uint64_t)v16);
  uint64_t result = 0;
  *uint64_t v8 = 47;
  return result;
}

uint64_t sub_100006378(const char **a1, uint64_t a2, char a3, unint64_t *a4)
{
  uint64_t v7 = a1[20];
  if (a2 && *(void *)(a2 + 160)) {
    uint64_t v7 = *(const char **)(a2 + 160);
  }
  if (!a1[1]) {
    return 0xFFFFFFFFLL;
  }
  if (v7)
  {
    uint64_t v8 = asl_list_dst_files((uint64_t)a1);
    if (v8)
    {
      uint64_t v15 = (uint64_t)v8;
      uint64_t v16 = a1[4];
      if (!v16) {
        uint64_t v16 = *a1;
      }
      sub_100003CFC(6u, "    dst files\n", v9, v10, v11, v12, v13, v14, v38);
      uint64_t v23 = (void *)v15;
      do
      {
        sub_100003CFC(6u, "      %s size %lu\n", v17, v18, v19, v20, v21, v22, *v23);
        uint64_t v23 = (void *)v23[5];
      }
      while (v23);
      unint64_t v24 = 0;
      uint64_t v25 = v15;
      do
      {
        uint64_t v26 = *(void *)(v25 + 32);
        uint64_t v25 = *(void *)(v25 + 40);
        v24 += v26;
      }
      while (v25);
      if ((a3 & 1) == 0 && v24 > (unint64_t)v7)
      {
        uint64_t v27 = v15;
        do
        {
          snprintf(__str, 0x400uLL, "%s/%s", v16, *(const char **)v27);
          sub_100004284(__str, v28, v29, v30, v31, v32, v33, v34);
          uint64_t v35 = *(void *)(v27 + 32);
          uint64_t v27 = *(void *)(v27 + 40);
          v24 -= v35;
        }
        while (v24 > (unint64_t)v7 && v27 != 0);
      }
      if (a4) {
        *a4 = v24;
      }
      asl_out_file_list_free(v15);
    }
    else
    {
      sub_100003CFC(6u, "    no dst files\n", v9, v10, v11, v12, v13, v14, v38);
    }
  }
  return 0;
}

uint64_t sub_1000064F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = *(_DWORD *)(a1 + 112);
  if (a2)
  {
    if (*(_DWORD *)(a2 + 112)) {
      int v10 = *(_DWORD *)(a2 + 112);
    }
    if (*(void *)(a2 + 160)) {
      uint64_t v11 = *(void *)(a2 + 160);
    }
    else {
      uint64_t v11 = *(void *)(a1 + 160);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 160);
  }
  int v12 = *(_DWORD *)(a1 + 72);
  if ((v12 & 4) != 0)
  {
    sub_100003CFC(5u, "Checking file %s\n", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 8));
    sub_100003CFC(5u, "- Rename, move to destination directory, and compress as required\n", v13, v14, v15, v16, v17, v18, v32);
    sub_100005CA8(a1);
    if (v10 && (*(unsigned char *)(a1 + 73) & 0x80) == 0)
    {
      asl_core_time_to_str();
      sub_100003CFC(5u, "- Check for expired files - TTL = %s\n", v25, v26, v27, v28, v29, v30, (char)&v33);
      sub_1000061A4(a1, a2);
    }
    if (v11)
    {
      sub_100003CFC(5u, "- Check total storage used - MAX = %lu\n", v19, v20, v21, v22, v23, v24, v11);
      sub_100006378((const char **)a1, a2, 0, 0);
    }
  }
  else if ((v12 & 0x2000) != 0 && v10)
  {
    sub_100005050(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  return 0;
}

uint64_t sub_100006640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    int v10 = *(_DWORD *)(a2 + 72);
  }
  else {
    int v10 = 0;
  }
  sub_100003CFC(5u, "----------------------------------------\n", a3, a4, a5, a6, a7, a8, v28);
  uint64_t v18 = *(const char **)a1;
  if (!*(void *)a1) {
    uint64_t v18 = "asl.conf";
  }
  sub_100003CFC(5u, "Processing module %s\n", v12, v13, v14, v15, v16, v17, (char)v18);
  for (uint64_t i = *(void *)(a1 + 16); i; uint64_t i = *(void *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      uint64_t v26 = *(void *)(i + 24);
      if (!v10 || (*(_DWORD *)(v26 + 72) & v10) != 0) {
        sub_1000064F4(v26, a2, v19, v20, v21, v22, v23, v24);
      }
    }
  }
  uint64_t v27 = *(const char **)a1;
  if (!*(void *)a1) {
    uint64_t v27 = "asl.conf";
  }
  sub_100003CFC(5u, "Finished processing module %s\n", v19, v20, v21, v22, v23, v24, (char)v27);
  return 0;
}

uint64_t sub_100006730()
{
  if (!dword_100010020 && bootstrap_look_up2())
  {
    uint64_t v2 = 0;
    dword_100010020 = 0;
    return v2;
  }
  unsigned int size_4 = 0;
  vm_address_t address = 0;
  uint64_t v0 = (const char *)asl_msg_to_string();
  int v10 = 0;
  if (v0)
  {
    int v1 = (char *)v0;
    asprintf(&v10, "1\n%s [= ASLOption control]\n", v0);
    free(v1);
  }
  else
  {
    asprintf(&v10, "1\nQ [= ASLOption control]\n");
  }
  if (!v10) {
    return 0;
  }
  unsigned int size = 0;
  unsigned int size_4 = strlen(v10) + 1;
  uint64_t v5 = 0;
  vm_address_t v9 = 0;
  uint64_t v2 = 0;
  if (!vm_allocate(mach_task_self_, &address, size_4, 1358954497))
  {
    memmove((void *)address, v10, size_4);
    free(v10);
    int v6 = 0;
    uint64_t v2 = 0;
    if (!_asl_server_query_2(dword_100010020, address, size_4, 0, 1, 0, &v9, &size, &v5, &v6))
    {
      if (v9)
      {
        uint64_t v2 = asl_msg_list_from_string();
        vm_deallocate(mach_task_self_, v9, size);
        return v2;
      }
      return 0;
    }
  }
  return v2;
}

uint64_t sub_1000068B4(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    uint64_t v8 = a1;
  }
  else {
    uint64_t v8 = "*";
  }
  sub_100003CFC(5u, "Checkpoint module %s\n", a3, a4, a5, a6, a7, a8, (char)v8);
  if (!byte_100010058)
  {
    asl_msg_new();
    int v10 = 0;
    asprintf(&v10, "%s checkpoint", v8);
    asl_msg_set_key_val_op();
    free(v10);
    sub_100006730();
    asl_msg_list_release();
  }
  return 0;
}

uint64_t sub_10000695C(int a1, uint64_t a2)
{
  if (geteuid())
  {
    if (a1) {
      int v84 = 32;
    }
    else {
      int v84 = 64;
    }
    dword_100010048 = v84;
    sub_100003CFC(3u, "aslmanager must be run by root\n", v4, v5, v6, v7, v8, v9, v85);
    exit(1);
  }
  int v10 = 0;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v99 = 0u;
  memset(v98, 0, sizeof(v98));
  LODWORD(v99) = 604800;
  long long v92 = 0u;
  LODWORD(v92) = 604800;
  uint64_t v104 = 0;
  long long v102 = 0x8F0D180uLL;
  memset(v91, 0, sizeof(v91));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v96 = 0u;
  uint64_t v97 = 0;
  long long v95 = 0x8F0D180uLL;
  if (a1 < 2) {
    goto LABEL_16;
  }
  char v11 = 0;
  int v10 = 0;
  int v12 = 1;
  do
  {
    uint64_t v13 = *(const char **)(a2 + 8 * v12);
    if (!strcmp(v13, "-q") || !strcmp(v13, "-dd"))
    {
      char v11 = 1;
    }
    else
    {
      int v14 = strcmp(v13, "-s");
      uint64_t v15 = v12 + 1;
      if (v14) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = (int)v15 < a1;
      }
      if (v16)
      {
        uint64_t v17 = *(const char **)(a2 + 8 * v15);
        if (*v17 != 45)
        {
          *((void *)&v98[0] + 1) = strdup(v17);
          int v10 = v98;
          ++v12;
        }
      }
    }
    ++v12;
  }
  while (v12 < a1);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    uint64_t v90 = 0;
    if (!asl_make_database_dir(0, 0) && !asl_make_database_dir("Logs", (char **)&v90))
    {
      __filename = 0;
      time_t v18 = time(0);
      asl_make_timestamp(v18, 32, __str, 0x20uLL);
      asprintf(&__filename, "%s/aslmanager.%s", (const char *)v90, __str);
      if (__filename)
      {
        qword_100010050 = (uint64_t)fopen(__filename, "w");
        if (qword_100010050) {
          dword_100010048 |= 0x10u;
        }
        free(__filename);
      }
    }
    free(v90);
  }
  uint64_t v19 = asl_out_module_init();
  uint64_t v26 = v19;
  if (v19)
  {
    uint64_t v27 = *((void *)v19 + 2);
    if (v27 && !v10)
    {
      do
      {
        uint64_t v28 = *(void *)(v27 + 24);
        if (v28
          && *(_DWORD *)(v27 + 8) == 2
          && (uint64_t v29 = *(const char **)(v28 + 8), v30 = (const char *)asl_filesystem_path(), !strcmp(v29, v30)))
        {
          int v10 = *(_OWORD **)(v27 + 24);
        }
        else
        {
          int v10 = 0;
        }
        uint64_t v27 = *(void *)(v27 + 40);
        if (v27) {
          BOOL v31 = v10 == 0;
        }
        else {
          BOOL v31 = 0;
        }
      }
      while (v31);
      uint64_t v27 = *((void *)v26 + 2);
    }
    for (; v27; uint64_t v27 = *(void *)(v27 + 40))
    {
      if (*(_DWORD *)(v27 + 8) == 1 && !*(void *)v27)
      {
        char v32 = *(unsigned char **)(v27 + 16);
        if (v32)
        {
          if (*v32)
          {
            for (uint64_t i = *v32 == 61 ? v32 + 1 : *(char **)(v27 + 16); ; ++i)
            {
              int v34 = *i;
              if (v34 != 32 && v34 != 9) {
                break;
              }
            }
            unsigned int v36 = (const char **)explode(i, " \t");
            if (v36)
            {
              int v37 = v36;
              unsigned int v38 = -1;
              do
                ++v38;
              while (v36[v38]);
              if (v38 >= 2)
              {
                uint64_t v39 = *v36;
                if (!strcasecmp(*v36, "aslmanager_debug"))
                {
                  sub_100003C44((const char *)0x40, (char *)v37[1]);
                }
                else if (!strcasecmp(v39, "store_ttl"))
                {
                  *((_DWORD *)v10 + 28) = asl_core_str_to_time();
                }
                else if (!strcasecmp(v39, "module_ttl"))
                {
                  asl_core_str_to_time();
                }
                else if (!strcasecmp(v39, "max_store_size"))
                {
                  *((void *)v10 + 20) = asl_core_str_to_size();
                }
                else if (!strcasecmp(v39, "archive"))
                {
                  free(*((void **)v10 + 4));
                  *((void *)v10 + 4) = 0;
                  if (!strcmp(v37[1], "1"))
                  {
                    uint64_t v41 = v37[2];
                    if (!v41) {
                      uint64_t v41 = (const char *)asl_filesystem_path();
                    }
                    *((void *)v10 + 4) = strdup(v41);
                  }
                }
                else if (!strcasecmp(v39, "store_path"))
                {
                  free(*((void **)v10 + 1));
                  *((void *)v10 + 1) = strdup(v37[1]);
                }
                else if (!strcasecmp(v39, "archive_mode"))
                {
                  __int16 v40 = strtol(v37[1], 0, 0);
                  *((_WORD *)v10 + 58) = v40;
                  if (!v40 && *__error() == 22) {
                    *((_WORD *)v10 + 58) = 256;
                  }
                }
              }
              free_string_list((void **)v37);
            }
          }
        }
      }
    }
  }
  uint64_t v87 = (uint64_t)v26;
  if (a1 >= 2)
  {
    uint64_t v42 = 0;
    int v88 = 3;
    int v43 = 1;
    while (1)
    {
      uint64_t v44 = *(const char **)(a2 + 8 * v43);
      if (!strcmp(v44, "-a"))
      {
        if (v10) {
          uint64_t v48 = v10;
        }
        else {
          uint64_t v48 = v98;
        }
        uint64_t v49 = v43 + 1;
        if ((int)v49 >= a1 || (uint64_t v50 = *(const char **)(a2 + 8 * v49), *v50 == 45))
        {
          uint64_t v51 = (const char *)asl_filesystem_path();
          uint64_t v52 = strdup(v51);
        }
        else
        {
          uint64_t v52 = strdup(v50);
          ++v43;
        }
        if (v10) {
          uint64_t v54 = v10;
        }
        else {
          uint64_t v54 = v98;
        }
        *((void *)v54 + 4) = v52;
        *((_WORD *)v54 + 58) = 256;
        int v10 = v48;
        goto LABEL_128;
      }
      if (!strcmp(v44, "-store_ttl"))
      {
        uint64_t v45 = v43 + 1;
        if ((int)v45 >= a1 || **(unsigned char **)(a2 + 8 * v45) == 45) {
          goto LABEL_128;
        }
        if (!v10) {
          int v10 = v98;
        }
        int v53 = asl_core_str_to_time();
        goto LABEL_114;
      }
      if (!strcmp(v44, "-module_ttl"))
      {
        uint64_t v45 = v43 + 1;
        if ((int)v45 >= a1 || **(unsigned char **)(a2 + 8 * v45) == 45) {
          goto LABEL_128;
        }
        asl_core_str_to_time();
        goto LABEL_115;
      }
      if (!strcmp(v44, "-ttl")) {
        break;
      }
      if (!strcmp(v44, "-size"))
      {
        uint64_t v45 = v43 + 1;
        if ((int)v45 >= a1 || **(unsigned char **)(a2 + 8 * v45) == 45) {
          goto LABEL_128;
        }
        uint64_t v55 = asl_core_str_to_size();
        *(void *)&long long v95 = v55;
        if (!v10) {
          int v10 = v98;
        }
        *((void *)v10 + 20) = v55;
        goto LABEL_115;
      }
      if (!strcmp(v44, "-checkpoint"))
      {
        int v56 = v88 | 4;
LABEL_127:
        int v88 = v56;
        goto LABEL_128;
      }
      if (!strcmp(v44, "-module"))
      {
        v88 &= ~1u;
        uint64_t v57 = v43 + 1;
        if (v43 + 1 < a1 && **(unsigned char **)(a2 + 8 * v57) != 45)
        {
          ++v43;
          uint64_t v42 = *(const char **)(a2 + 8 * v57);
        }
        goto LABEL_128;
      }
      if (!strcmp(v44, "-asldb"))
      {
        int v56 = 1;
        goto LABEL_127;
      }
      if (!strcmp(v44, "-d"))
      {
        if (a1 <= 2 * v43 || (uint64_t v45 = v43 + 1, v46 = *(char **)(a2 + 8 * v45), *v46 == 45))
        {
          int v47 = 0;
          goto LABEL_133;
        }
LABEL_134:
        sub_100003C44((const char *)0x20, v46);
        goto LABEL_115;
      }
      if (!strcmp(v44, "-dd"))
      {
        byte_100010058 = 1;
        if (a1 <= 2 * v43 || (uint64_t v45 = v43 + 1, v46 = *(char **)(a2 + 8 * v45), *v46 == 45))
        {
          int v47 = "l7";
LABEL_133:
          sub_100003C44((const char *)0x20, v47);
          goto LABEL_128;
        }
        goto LABEL_134;
      }
LABEL_128:
      if (++v43 >= a1) {
        goto LABEL_136;
      }
    }
    uint64_t v45 = v43 + 1;
    if ((int)v45 >= a1 || **(unsigned char **)(a2 + 8 * v45) == 45) {
      goto LABEL_128;
    }
    int v53 = asl_core_str_to_time();
    LODWORD(v92) = v53;
    if (!v10) {
      int v10 = v98;
    }
LABEL_114:
    *((_DWORD *)v10 + 28) = v53;
LABEL_115:
    int v43 = v45;
    goto LABEL_128;
  }
  uint64_t v42 = 0;
  LOBYTE(v88) = 3;
LABEL_136:
  if (v10 && !*((void *)v10 + 1))
  {
    uint64_t v58 = (const char *)asl_filesystem_path();
    *((void *)v10 + 1) = strdup(v58);
  }
  if (byte_100010058) {
    int v59 = " dryrun";
  }
  else {
    int v59 = (const char *)&unk_10000B4B7;
  }
  sub_100003CFC(3u, "aslmanager starting%s\n", v20, v21, v22, v23, v24, v25, (char)v59);
  if (v88) {
    sub_100005050((uint64_t)v10, (uint64_t)v91, v61, v62, v63, v64, v65, v66);
  }
  if ((v88 & 2) != 0)
  {
    if ((v88 & 4) != 0) {
      sub_1000068B4(v42, v60, v61, v62, v63, v64, v65, v66);
    }
    if (v87)
    {
      uint64_t v67 = v87;
      do
      {
        if (v42)
        {
          if (!*(void *)v67 || strcmp(*(const char **)v67, v42)) {
            goto LABEL_155;
          }
          uint64_t v68 = v91;
          uint64_t v69 = v67;
        }
        else
        {
          uint64_t v69 = v67;
          uint64_t v68 = 0;
        }
        sub_100006640(v69, (uint64_t)v68, v61, v62, v63, v64, v65, v66);
LABEL_155:
        uint64_t v67 = *(void *)(v67 + 24);
      }
      while (v67);
    }
  }
  asl_out_module_free(v87);
  sub_100003CFC(5u, "----------------------------------------\n", v70, v71, v72, v73, v74, v75, v86);
  if (byte_100010058) {
    uint64_t v82 = " dryrun";
  }
  else {
    uint64_t v82 = (const char *)&unk_10000B4B7;
  }
  sub_100003CFC(3u, "aslmanager finished%s\n", v76, v77, v78, v79, v80, v81, (char)v82);
  sub_100003F30();
  return 0;
}

void sub_100007208()
{
  if ((byte_100010028 & 1) == 0)
  {
    byte_100010028 = 1;
    uint64_t v0 = os_transaction_create();
    if (byte_100010029)
    {
      v2[0] = _NSConcreteStackBlock;
      v2[1] = 0x40000000;
      v2[2] = sub_100007370;
      v2[3] = &unk_10000C440;
      v2[4] = v0;
      dispatch_async((dispatch_queue_t)qword_100010060, v2);
    }
    else
    {
      byte_100010029 = 1;
      dispatch_time_t v1 = dispatch_walltime(0, 300000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_100007328;
      block[3] = &unk_10000C420;
      block[4] = v0;
      dispatch_after(v1, (dispatch_queue_t)qword_100010060, block);
    }
  }
}

void sub_100007328(uint64_t a1)
{
  sub_10000695C(0, 0);
  byte_100010028 = 0;
  uint64_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

void sub_100007370(uint64_t a1)
{
  sub_10000695C(0, 0);
  byte_100010028 = 0;
  uint64_t v2 = *(void **)(a1 + 32);

  os_release(v2);
}

uint64_t start(int a1, uint64_t a2)
{
  return 0;
}

void sub_1000074CC(id a1)
{
  sub_100003CFC(5u, "SIGTERM exit\n", v1, v2, v3, v4, v5, v6, vars0);
  exit(0);
}

void sub_1000074F0(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_10000758C;
    handler[3] = &unk_10000C4E0;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
}

void sub_10000758C(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uid_t euid = xpc_connection_get_euid(*(xpc_connection_t *)(a1 + 32));
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    if (reply)
    {
      uint64_t v6 = reply;
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
      xpc_release(v6);
    }
    if (euid == geteuid())
    {
      sub_100007208();
    }
  }
  else
  {
    xpc_get_type(object);
  }
}

char *explode(char *a1, char *__s)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a1;
  LOBYTE(v3) = *a1;
  if (!*a1) {
    return 0;
  }
  unsigned __int8 v5 = 0;
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = 0;
    while (1)
    {
      if (v5)
      {
        if (v3 == v5) {
          unsigned __int8 v5 = 0;
        }
        goto LABEL_16;
      }
      if (strchr(__s, (char)v3)) {
        break;
      }
      if (v3 == 34) {
        char v8 = 34;
      }
      else {
        char v8 = 0;
      }
      if (v3 == 39) {
        unsigned __int8 v5 = 39;
      }
      else {
        unsigned __int8 v5 = v8;
      }
LABEL_16:
      uint64_t v9 = v7 + 1;
      int v3 = v2[++v7];
      if (!v3)
      {
        uint64_t v10 = v9;
        uint64_t v7 = v9;
        goto LABEL_19;
      }
    }
    unsigned __int8 v5 = 0;
    uint64_t v10 = v7;
LABEL_19:
    char v11 = (const char *)malloc_type_malloc(v10 + 1, 0x9095E2FEuLL);
    if (!v11) {
      return 0;
    }
    int v12 = (char *)v11;
    if (v10)
    {
      uint64_t v13 = v10;
      int v14 = v2;
      uint64_t v15 = (char *)v11;
      do
      {
        char v16 = *v14++;
        *v15++ = v16;
        --v13;
      }
      while (v13);
    }
    v11[v7] = 0;
    uint64_t v6 = (char *)sub_1000077AC(v11, v6);
    free(v12);
    uint64_t v17 = &v2[v10];
    if (!v2[v10]) {
      break;
    }
    int v3 = v2[v10 + 1];
    if (!v2[v10 + 1])
    {
      uint64_t v6 = (char *)sub_1000077AC((const char *)&unk_10000B4B7, v6);
      int v3 = v17[1];
    }
    uint64_t v2 = v17 + 1;
  }
  while (v3);
  return v6;
}

void *sub_1000077AC(const char *a1, char *__ptr)
{
  uint64_t v2 = __ptr;
  if (a1)
  {
    if (!__ptr)
    {
      uint64_t v2 = malloc_type_malloc(0x10uLL, 0x10040436913F5uLL);
      if (!v2) {
        return v2;
      }
      char v8 = strdup(a1);
      *uint64_t v2 = v8;
      if (v8)
      {
        v2[1] = 0;
        return v2;
      }
      goto LABEL_11;
    }
    uint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)&__ptr[v4 * 8];
      ++v5;
      ++v4;
    }
    while (v6);
    uint64_t v2 = reallocf(__ptr, (v4 * 8 + 8) & 0x7FFFFFFF8);
    if (v2)
    {
      uint64_t v7 = strdup(a1);
      v2[v4 - 1] = v7;
      if (v7)
      {
        v2[v5] = 0;
        return v2;
      }
LABEL_11:
      free(v2);
      return 0;
    }
  }
  return v2;
}

void free_string_list(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      int v3 = a1 + 1;
      do
      {
        free(v2);
        uint64_t v4 = *v3++;
        uint64_t v2 = v4;
      }
      while (v4);
    }
    free(a1);
  }
}

unsigned char *get_line_from_file(FILE *a1)
{
  size_t __n = 0;
  uint64_t v1 = fgetln(a1, &__n);
  if (!v1 || !__n) {
    return 0;
  }
  uint64_t v2 = v1;
  int v3 = malloc_type_malloc(__n + 1, 0x729EE271uLL);
  uint64_t v4 = v3;
  if (v3)
  {
    memcpy(v3, v2, __n);
    size_t v5 = __n;
    if (v4[__n - 1] == 10) {
      size_t v5 = __n - 1;
    }
    v4[v5] = 0;
  }
  return v4;
}

unsigned char *next_word_from_string(unsigned __int8 **a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *a1;
  if (!*a1) {
    return 0;
  }
  int v2 = *v1;
  BOOL v3 = v2 == 39;
  uint64_t v4 = v2 == 39 ? v1 + 1 : *a1;
  BOOL v5 = *v4 == 34;
  uint64_t v6 = *v4 == 34 ? v4 + 1 : v4;
  int v7 = *v4 == 34 ? v3 + 1 : v2 == 39;
  int v8 = -(int)v1 - v7;
  uint64_t v9 = v6;
  while (1)
  {
    int64_t v10 = ((unint64_t)~v6 << 32) + ((void)v9 << 32);
    for (int i = v8 + v9++; ; i += 2)
    {
      int v12 = *(v9 - 1);
      if (v12 != 92) {
        break;
      }
      if (!*v9) {
        goto LABEL_30;
      }
      v9 += 2;
      v10 += 0x200000000;
    }
    if (!*(v9 - 1)) {
      break;
    }
    if (v12 == 39)
    {
      BOOL v3 = !v3;
    }
    else
    {
      if (v12 == 34) {
        BOOL v5 = !v5;
      }
      if (v12 == 32)
      {
        if (!v3 && !v5) {
          goto LABEL_30;
        }
      }
      else if (v12 == 9 && !v3 && !v5)
      {
        goto LABEL_30;
      }
    }
  }
  --v9;
LABEL_30:
  *a1 = v9;
  if (v2 == 34 || v2 == 39) {
    i -= v2 == v6[v10 >> 32];
  }
  if (!i) {
    return 0;
  }
  uint64_t v13 = malloc_type_malloc(i + 1, 0xCE9497B6uLL);
  int v14 = v13;
  if (v13)
  {
    memcpy(v13, v6, i);
    v14[i] = 0;
  }
  return v14;
}

uint64_t asl_make_database_dir(char *a1, char **a2)
{
  char v11 = 0;
  if (a2) {
    *a2 = 0;
  }
  uint64_t v4 = asl_filesystem_path();
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  BOOL v5 = (char *)v4;
  if (a1)
  {
    if (strchr(a1, 47)) {
      return 0xFFFFFFFFLL;
    }
    asprintf(&v11, "%s/%s", v5, a1);
    BOOL v5 = v11;
    if (!v11) {
      return 0xFFFFFFFFLL;
    }
  }
  memset(&v10, 0, sizeof(v10));
  if (!stat(v5, &v10))
  {
    int v8 = v11;
    if ((v10.st_mode & 0xF000) == 0x4000) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  if (*__error() != 2)
  {
    int v8 = v11;
LABEL_15:
    free(v8);
    return 0xFFFFFFFFLL;
  }
  mode_t v6 = umask(0);
  uint64_t v7 = mkdir(v5, 0x1EDu);
  umask(v6);
  int v8 = v11;
  if (v7)
  {
    free(v11);
    return v7;
  }
LABEL_12:
  if (a2)
  {
    uint64_t v7 = 0;
    *a2 = v8;
  }
  else
  {
    free(v8);
    return 0;
  }
  return v7;
}

time_t asl_make_timestamp(time_t result, char a2, char *__str, size_t __size)
{
  time_t v38 = result;
  if (__str)
  {
    if ((a2 & 4) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d-%02d-%02dT%02d:%02d:%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 8) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      gmtime_r(&v38, &v37);
      return snprintf(__str, __size, "%d%02d%02dT%02d%02d%02dZ", (v37.tm_year + 1900));
    }
    if ((a2 & 0x10) != 0)
    {
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v6) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v6 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v7 = 45;
      }
      else
      {
        uint64_t v7 = 43;
      }
      unint64_t v10 = v6 / 0xE10uLL;
      unsigned int v11 = v6 % 0xE10;
      unsigned __int16 v12 = v6 % 0xE10;
      uint64_t v13 = v12 / 0x3Cu;
      unsigned __int16 v14 = v12 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v12 % 0x3Cu)
      {
        uint64_t v32 = v7;
        unint64_t v34 = v10;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        uint64_t v19 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u:%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v11 >= 0x3C)
      {
        unint64_t v35 = v10;
        uint64_t v36 = v12 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v7;
        uint64_t v29 = v37.tm_min;
        uint64_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u:%02u";
      }
      else
      {
        uint64_t v33 = v7;
        unint64_t v35 = v10;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        uint64_t v20 = "%d-%02d-%02dT%02d:%02d:%02d%c%u";
      }
    }
    else
    {
      if ((a2 & 0x20) == 0) {
        return snprintf(__str, __size, "%c%llu");
      }
      memset(&v37, 0, sizeof(v37));
      localtime_r(&v38, &v37);
      LODWORD(v8) = v37.tm_gmtoff;
      if (v37.tm_gmtoff < 0)
      {
        uint64_t v8 = -v37.tm_gmtoff;
        v37.tm_gmtoff = -v37.tm_gmtoff;
        uint64_t v9 = 45;
      }
      else
      {
        uint64_t v9 = 43;
      }
      unint64_t v21 = v8 / 0xE10uLL;
      unsigned int v22 = v8 % 0xE10;
      unsigned __int16 v23 = v8 % 0xE10;
      uint64_t v13 = v23 / 0x3Cu;
      unsigned __int16 v14 = v23 % 0x3Cu;
      uint64_t v15 = (v37.tm_year + 1900);
      uint64_t v16 = (v37.tm_mon + 1);
      uint64_t tm_hour = v37.tm_hour;
      uint64_t tm_mday = v37.tm_mday;
      if (v23 % 0x3Cu)
      {
        uint64_t v32 = v9;
        unint64_t v34 = v21;
        uint64_t tm_min = v37.tm_min;
        uint64_t tm_sec = v37.tm_sec;
        uint64_t v26 = v37.tm_mday;
        uint64_t v27 = v37.tm_hour;
        uint64_t v24 = (v37.tm_year + 1900);
        uint64_t v25 = (v37.tm_mon + 1);
        uint64_t v19 = "%d%02d%02dT%02d%02d%02d%c%02u%02u%02u";
        return snprintf(__str, __size, v19, v24, v25, v26, v27, tm_min, tm_sec, v32, v34, v13, v14);
      }
      if (v22 >= 0x3C)
      {
        unint64_t v35 = v21;
        uint64_t v36 = v23 / 0x3Cu;
        uint64_t v31 = v37.tm_sec;
        uint64_t v33 = v9;
        uint64_t v29 = v37.tm_min;
        uint64_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u%02u";
      }
      else
      {
        uint64_t v33 = v9;
        unint64_t v35 = v21;
        uint64_t v29 = v37.tm_min;
        uint64_t v31 = v37.tm_sec;
        uint64_t v20 = "%d%02d%02dT%02d%02d%02d%c%02u";
      }
    }
    return snprintf(__str, __size, v20, v15, v16, tm_mday, tm_hour, v29, v31, v33, v35, v36);
  }
  return result;
}

void asl_out_dst_data_release(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 168);
    if (!v2 || (int v3 = v2 - 1, (*(_DWORD *)(a1 + 168) = v3) == 0))
    {
      free(*(void **)a1);
      free(*(void **)(a1 + 8));
      free(*(void **)(a1 + 16));
      free(*(void **)(a1 + 40));
      free(*(void **)(a1 + 48));
      free(*(void **)(a1 + 32));
      free(*(void **)(a1 + 24));
      free(*(void **)(a1 + 120));
      free(*(void **)(a1 + 136));
      free((void *)a1);
    }
  }
}

uint64_t asl_out_dst_set_access(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if ((a1 & 0x80000000) == 0 && a2)
  {
    uid_t v4 = *(_DWORD *)(a2 + 128);
    if (v4) {
      uid_t v4 = **(_DWORD **)(a2 + 120);
    }
    if (*(_DWORD *)(a2 + 144)) {
      gid_t v5 = **(_DWORD **)(a2 + 136);
    }
    else {
      gid_t v5 = 80;
    }
    fchown(a1, v4, v5);
    return a1;
  }
  return result;
}

void asl_out_module_free(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = *(void *)(v1 + 24);
      free(*(void **)v1);
      int v3 = *(void **)(v1 + 16);
      if (v3)
      {
        do
        {
          uid_t v4 = (void *)*((void *)v3 + 5);
          uint64_t v5 = *((void *)v3 + 3);
          if (v5) {
            asl_out_dst_data_release(v5);
          }
          if (*(void *)v3) {
            asl_msg_release();
          }
          free(*((void **)v3 + 2));
          free(v3);
          int v3 = v4;
        }
        while (v4);
      }
      free((void *)v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

_DWORD *asl_out_module_new(const char *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x10300408DF105C4uLL);
  uint64_t result = 0;
  if (a1 && v2)
  {
    uid_t v4 = strdup(a1);
    *(void *)uint64_t v2 = v4;
    if (v4)
    {
      v2[2] = 1;
      return v2;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return result;
}

void *asl_out_module_parse_line(uint64_t a1, unsigned __int8 *a2)
{
  while (1)
  {
    unsigned int v4 = *a2;
    if (v4 > 0x1F) {
      break;
    }
    if (v4 != 9) {
      return 0;
    }
LABEL_6:
    ++a2;
  }
  if (*a2 <= 0x29u)
  {
    if (v4 != 32) {
      return 0;
    }
    goto LABEL_6;
  }
  if (*a2 > 0x3Du)
  {
    if (v4 != 62)
    {
      if (v4 != 63 && v4 != 81) {
        return 0;
      }
LABEL_20:
      if (!a1) {
        return 0;
      }
      uint64_t v6 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
      if (!v6) {
        return v6;
      }
      uint64_t v9 = (char *)sub_100009FB4((uint64_t)a2);
      if (!v9) {
        return 0;
      }
      unint64_t v10 = v9;
      unsigned int v11 = strchr(v9, 32);
      if (v11 || (unsigned int v11 = strchr(v10, 9)) != 0)
      {
        char v12 = 0;
        char *v11 = 0;
      }
      else
      {
        char v12 = 1;
      }
      if (!strcasecmp(v10, "ignore"))
      {
        int v13 = 3;
      }
      else if (!strcasecmp(v10, "skip"))
      {
        int v13 = 4;
      }
      else if (!strcasecmp(v10, "claim"))
      {
        int v13 = 5;
      }
      else if (!strcasecmp(v10, "notify"))
      {
        int v13 = 6;
      }
      else if (!strcasecmp(v10, "file"))
      {
        int v13 = 14;
      }
      else if (!strcasecmp(v10, "asl_file"))
      {
        int v13 = 12;
      }
      else if (!strcasecmp(v10, "directory") {
             || !strcasecmp(v10, "dir")
      }
             || !strcasecmp(v10, "asl_directory")
             || !strcasecmp(v10, "asl_dir")
             || !strcasecmp(v10, "store_dir")
             || !strcasecmp(v10, "store_directory"))
      {
        int v13 = 13;
      }
      else if (!strcasecmp(v10, "control"))
      {
        int v13 = 16;
      }
      else if (!strcasecmp(v10, "save") || !strcasecmp(v10, "store"))
      {
        int v13 = 11;
      }
      else if (!strcasecmp(v10, "access"))
      {
        int v13 = 8;
      }
      else if (!strcasecmp(v10, "set"))
      {
        int v13 = 9;
      }
      else if (!strcasecmp(v10, "unset"))
      {
        int v13 = 10;
      }
      else
      {
        if (strcmp(*(const char **)a1, "com.apple.asl")) {
          goto LABEL_81;
        }
        if (strcasecmp(v10, "broadcast"))
        {
          if (!strcasecmp(v10, "forward"))
          {
            int v13 = 15;
            goto LABEL_80;
          }
LABEL_81:
          if (*((_DWORD *)v6 + 2))
          {
            if (v12) {
              goto LABEL_91;
            }
            for (int i = v11 + 1; ; ++i)
            {
              int v24 = *(i - 1);
              if (v24 != 32 && v24 != 9) {
                break;
              }
            }
            uint64_t v26 = sub_10000A02C(i);
            *((void *)v6 + 2) = v26;
            if (v26)
            {
LABEL_91:
              *(v10 - 1) = 0;
              if (*a2 == 42)
              {
                uint64_t v27 = asl_msg_new();
              }
              else
              {
                *a2 = 81;
                uint64_t v27 = asl_msg_from_string();
              }
              *(void *)uint64_t v6 = v27;
              if (v27)
              {
                if (*((_DWORD *)v6 + 2) != 11) {
                  goto LABEL_108;
                }
                uint64_t v28 = (unsigned __int8 *)*((void *)v6 + 2);
                if (v28)
                {
                  if (strncmp(*((const char **)v6 + 2), "/var/log/asl", 0xCuLL))
                  {
                    *((_DWORD *)v6 + 2) = 12;
                    goto LABEL_108;
                  }
                  uint64_t v31 = a1;
                  uint64_t v30 = v28;
                }
                else
                {
                  uint64_t v30 = "/var/log/asl";
                  uint64_t v31 = a1;
                }
                uint64_t v32 = sub_10000877C(v31, v30, 493);
                if (v32) {
                  ++v32[42];
                }
                *((void *)v6 + 3) = v32;
LABEL_108:
                int v33 = *((_DWORD *)v6 + 2);
                if ((v33 - 12) > 2) {
                  goto LABEL_133;
                }
                if (v33 == 13) {
                  __int16 v34 = 493;
                }
                else {
                  __int16 v34 = 420;
                }
                unint64_t v35 = sub_10000877C(a1, *((unsigned __int8 **)v6 + 2), v34);
                if (!v35)
                {
                  *((void *)v6 + 3) = 0;
                  *((_DWORD *)v6 + 2) = 0;
                  return v6;
                }
                uint64_t v36 = v35;
                ++v35[42];
                *((void *)v6 + 3) = v35;
                if (*((_WORD *)v35 + 58) == 4096) {
                  *((_WORD *)v35 + 58) = v34;
                }
                int v37 = *((_DWORD *)v6 + 2);
                if (v37 == 12)
                {
LABEL_121:
                  unsigned int v39 = v36[18] | 0x1000;
                }
                else
                {
                  if (v37 == 13)
                  {
                    unsigned int v40 = v35[18];
                    unsigned int v41 = v40 & 0xFFFFDFF7 | 0x2000;
                    if (!v35[16] && (v40 & 0x100) != 0) {
                      v35[16] |= 0x20u;
                    }
                  }
                  else
                  {
                    if (v37 == 14)
                    {
                      time_t v38 = (const char *)*((void *)v35 + 3);
                      if (v38 && !strcasecmp(v38, "asl"))
                      {
                        *((_DWORD *)v6 + 2) = 12;
                        goto LABEL_121;
                      }
LABEL_129:
                      if (!v36[32])
                      {
                        sub_10000A0D4(v36, "0");
                        uint64_t v36 = (unsigned int *)*((void *)v6 + 3);
                      }
                      if (!v36[36]) {
                        sub_10000A184(v36, "80");
                      }
LABEL_133:
                      uint64_t v42 = *(void *)(a1 + 16);
                      if (v42)
                      {
                        do
                        {
                          uint64_t v22 = v42;
                          uint64_t v42 = *(void *)(v42 + 40);
                        }
                        while (v42);
                        goto LABEL_135;
                      }
LABEL_136:
                      *(void *)(a1 + 16) = v6;
                      return v6;
                    }
                    unsigned int v41 = v35[18];
                  }
                  unsigned int v39 = v41 & 0xFFFFFFFB;
                }
                v36[18] = v39;
                goto LABEL_129;
              }
LABEL_99:
              free(*((void **)v6 + 2));
            }
          }
LABEL_100:
          free(v6);
          return 0;
        }
        int v13 = 7;
      }
LABEL_80:
      *((_DWORD *)v6 + 2) = v13;
      goto LABEL_81;
    }
    sub_10000877C(a1, a2 + 1, 4096);
    return 0;
  }
  if (v4 == 42) {
    goto LABEL_20;
  }
  if (v4 != 61 || !a1) {
    return 0;
  }
  uint64_t v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  uint64_t v6 = v5;
  if (!v5) {
    return v6;
  }
  for (j = (char *)(a2 + 1); ; ++j)
  {
    int v8 = *j;
    if (v8 != 39 && v8 != 32) {
      break;
    }
  }
  *((_DWORD *)v5 + 2) = 1;
  if (*j != 91)
  {
    uint64_t v17 = strchr((char *)a2, 91);
    if (!v17)
    {
      *((void *)v6 + 2) = sub_10000A02C(j);
      goto LABEL_76;
    }
    time_t v18 = v17;
    if (!strncmp(v17, "[File ", 6uLL) || !strncmp(v18, "[File\t", 6uLL))
    {
      int v19 = 17;
    }
    else if (!strncmp(v18, "[Plist ", 7uLL) || !strncmp(v18, "[Plist\t", 7uLL))
    {
      int v19 = 18;
    }
    else
    {
      if (strncmp(v18, "[Profile ", 9uLL) && strncmp(v18, "[Profile\t", 9uLL)) {
        goto LABEL_74;
      }
      int v19 = 19;
    }
    *((_DWORD *)v6 + 2) = v19;
LABEL_74:
    *((unsigned char *)v18 - 1) = 0;
    *((void *)v6 + 2) = sub_10000A02C(j);
    *((_WORD *)v18 - 1) = 8273;
    goto LABEL_75;
  }
  unsigned __int16 v14 = (char *)sub_100009FB4((uint64_t)a2);
  if (!v14) {
    goto LABEL_100;
  }
  uint64_t v15 = v14;
  *((void *)v6 + 2) = sub_10000A02C(v14);
  if (*(v15 - 1) == 93) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = -1;
  }
  v15[v16] = 0;
  *a2 = 81;
LABEL_75:
  uint64_t v20 = asl_msg_from_string();
  *(void *)uint64_t v6 = v20;
  if (!v20) {
    goto LABEL_99;
  }
LABEL_76:
  uint64_t v21 = *(void *)(a1 + 16);
  if (!v21) {
    goto LABEL_136;
  }
  do
  {
    uint64_t v22 = v21;
    uint64_t v21 = *(void *)(v21 + 40);
  }
  while (v21);
LABEL_135:
  *(void *)(v22 + 40) = v6;
  return v6;
}

unsigned int *sub_10000877C(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  int v3 = 0;
  if (!a1 || !a2) {
    return v3;
  }
  while (1)
  {
    int v6 = *a2;
    if (v6 != 32 && v6 != 9) {
      break;
    }
    ++a2;
  }
  __s = 0;
  int v56 = a2;
  int v8 = next_word_from_string(&v56);
  __s = v8;
  if (!v8) {
    return 0;
  }
  uint64_t v54 = a1;
  uint64_t v9 = (void **)explode(v8, "/");
  uint64_t v10 = asl_string_new();
  BOOL v11 = 0;
  int v12 = 5;
  __int16 v53 = a3;
  if (v9 && v10)
  {
    int v13 = 5;
    while (1)
    {
      unsigned __int16 v14 = (char *)*v9;
      if (*v9) {
        break;
      }
      BOOL v11 = 0;
      int v15 = 0;
LABEL_33:
      free_string_list(v9);
      if (v15 != 1 || v11)
      {
        uint64_t v9 = 0;
        int v12 = v13;
        goto LABEL_40;
      }
      free(__s);
      __s = (char *)asl_string_release_return_bytes();
      uint64_t v20 = asl_string_new();
      uint64_t v21 = explode(__s, "/");
      uint64_t v9 = (void **)v21;
      int v12 = v13 - 1;
      if (v13 >= 2)
      {
        if (v21)
        {
          --v13;
          if (v20) {
            continue;
          }
        }
      }
      goto LABEL_40;
    }
    int v15 = 0;
    BOOL v11 = 0;
    unsigned int v16 = 1;
    uint64_t v17 = (const char **)v9;
    while (strncmp(v14, "$ENV(", 5uLL))
    {
      if (v16 == 1)
      {
        if (!*(unsigned char *)*v9) {
          goto LABEL_25;
        }
      }
      else
      {
        asl_string_append_char_no_encoding();
      }
      asl_string_append_no_encoding();
      if (!v11)
      {
LABEL_29:
        BOOL v11 = strcmp(*v17, "..") == 0;
        goto LABEL_30;
      }
LABEL_26:
      BOOL v11 = 1;
LABEL_30:
      uint64_t v17 = (const char **)&v9[v16];
      unsigned __int16 v14 = (char *)*v17;
      ++v16;
      if (!*v17) {
        goto LABEL_33;
      }
    }
    time_t v18 = strchr(v14, 41);
    if (v18)
    {
      *time_t v18 = 0;
      unsigned __int16 v14 = (char *)*v17;
    }
    int v19 = getenv(v14 + 5);
    if (v19)
    {
      if (*v19 != 47) {
        asl_string_append_char_no_encoding();
      }
      asl_string_append_no_encoding();
      int v15 = 1;
    }
LABEL_25:
    if (!v11) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
LABEL_40:
  free(__s);
  free_string_list(v9);
  if (v11 || !v12)
  {
    asl_string_release();
    return 0;
  }
  uint64_t v22 = asl_string_release_return_bytes();
  __s = (char *)v22;
  uint64_t v23 = v54;
  for (uint64_t i = *(void *)(v54 + 16); i; uint64_t i = *(void *)(i + 40))
  {
    if (*(_DWORD *)(i + 8) == 2)
    {
      int v3 = *(unsigned int **)(i + 24);
      if (v3)
      {
        uint64_t v25 = (const char *)*((void *)v3 + 1);
        if (v22 && v25)
        {
          if (*(unsigned char *)v22 != 47)
          {
            uint64_t v26 = strrchr(*((char **)v3 + 1), 47);
            if (v26) {
              uint64_t v25 = v26 + 1;
            }
          }
          if (!strcmp((const char *)v22, v25))
          {
LABEL_178:
            free((void *)v22);
            return v3;
          }
        }
        else if (!(v22 | (unint64_t)v25))
        {
          goto LABEL_178;
        }
      }
    }
  }
  if (*(unsigned char *)v22 == 47)
  {
    int v27 = 8;
    if (strncmp((const char *)v22, "/var/log/", 9uLL))
    {
      if (!strncmp((const char *)v22, "/Library/Logs/", 0xEuLL)) {
        int v27 = 8;
      }
      else {
        int v27 = 40;
      }
    }
  }
  else
  {
    if (!strcmp(*(const char **)v54, "com.apple.asl")) {
      asprintf(&__s, "%s/%s");
    }
    else {
      asprintf(&__s, "%s/module/%s/%s");
    }
    free((void *)v22);
    int v27 = 8;
  }
  uint64_t v28 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040B8874213uLL);
  uint64_t v29 = (unsigned int *)malloc_type_calloc(1uLL, 0xC8uLL, 0x10D00407E9428A6uLL);
  int v3 = v29;
  if (!v28 || !v29)
  {
    free(__s);
    free(v28);
    free(v3);
    return 0;
  }
  v29[42] = 1;
  uint64_t v30 = __s;
  *((void *)v29 + 1) = __s;
  uint64_t v31 = strrchr(v30, 47);
  if (v31)
  {
    uint64_t v32 = v31;
    *uint64_t v31 = 0;
    *(void *)int v3 = strdup(*((const char **)v3 + 1));
    *uint64_t v32 = 47;
    uint64_t v30 = __s;
  }
  *((_WORD *)v3 + 58) = v53;
  v3[28] = 604800;
  v3[18] = v27;
  int v33 = strrchr(v30, 47);
  if (v33) {
    __int16 v34 = v33 + 1;
  }
  else {
    __int16 v34 = v30;
  }
  unint64_t v35 = strrchr(v30, 46);
  if (v35)
  {
    uint64_t v36 = v35;
    *unint64_t v35 = 0;
    *((void *)v3 + 6) = strdup(v35 + 1);
    *((void *)v3 + 5) = strdup(v34);
    *uint64_t v36 = 46;
  }
  else
  {
    *((void *)v3 + 5) = strdup(v34);
  }
  time_t v38 = next_word_from_string(&v56);
  if (v38)
  {
    unsigned int v39 = v38;
    do
    {
      if (!strncasecmp(v39, "mode=", 5uLL))
      {
        *((_WORD *)v3 + 58) = strtol(v39 + 5, 0, 0);
      }
      else if (!strncasecmp(v39, "uid=", 4uLL))
      {
        sub_10000A0D4(v3, v39 + 4);
      }
      else if (!strncasecmp(v39, "gid=", 4uLL))
      {
        sub_10000A184(v3, v39 + 4);
      }
      else
      {
        if (!strncasecmp(v39, "fmt=", 4uLL))
        {
          unsigned int v41 = v39 + 4;
LABEL_109:
          *((void *)v3 + 3) = sub_10000A234(v41);
          goto LABEL_124;
        }
        if (!strncasecmp(v39, "format=", 7uLL))
        {
          unsigned int v41 = v39 + 7;
          goto LABEL_109;
        }
        if (!strncasecmp(v39, "dest=", 5uLL))
        {
          uint64_t v42 = v39 + 5;
LABEL_112:
          *((void *)v3 + 4) = sub_10000A02C(v42);
          goto LABEL_124;
        }
        if (!strncasecmp(v39, "dst=", 4uLL))
        {
          uint64_t v42 = v39 + 4;
          goto LABEL_112;
        }
        if (!strncasecmp(v39, "coalesce=", 9uLL))
        {
          if (!strncasecmp(v39 + 9, "0", 1uLL) || !strncasecmp(v39 + 9, "off", 3uLL))
          {
            v3[18] &= ~8u;
            uint64_t v23 = v54;
          }
          else
          {
            uint64_t v23 = v54;
            if (!strncasecmp(v39 + 9, "false", 5uLL))
            {
              unsigned int v40 = v3[18] & 0xFFFFFFF7;
              goto LABEL_123;
            }
          }
        }
        else
        {
          if (!strncasecmp(v39, "compress", 8uLL))
          {
            unsigned int v40 = v3[18] | 0x10;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "extern", 6uLL))
          {
            unsigned int v40 = v3[18] | 0x40;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "truncate", 8uLL))
          {
            unsigned int v40 = v3[18] | 0x80;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "dir", 3uLL))
          {
            unsigned int v40 = v3[18] | 0x2000;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "soft", 4uLL))
          {
            unsigned int v40 = v3[18] | 0x800;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "file_max=", 9uLL))
          {
            *((void *)v3 + 19) = asl_core_str_to_size();
            goto LABEL_124;
          }
          if (!strncasecmp(v39, "all_max=", 8uLL))
          {
            *((void *)v3 + 20) = asl_core_str_to_size();
            goto LABEL_124;
          }
          if (!strncasecmp(v39, "style=", 6uLL) || !strncasecmp(v39, "rotate=", 7uLL))
          {
            uint64_t v43 = 6;
            if (*v39 == 114) {
              uint64_t v43 = 7;
            }
            if (sub_10000A314((uint64_t)v3, &v39[v43])) {
              goto LABEL_124;
            }
LABEL_136:
            unsigned int v40 = v3[18] | 4;
LABEL_123:
            v3[18] = v40;
            goto LABEL_124;
          }
          if (!strncasecmp(v39, "rotate", 6uLL))
          {
            if (*((void *)v3 + 6)) {
              int v44 = 536870913;
            }
            else {
              int v44 = 268435457;
            }
            v3[16] = v44;
            goto LABEL_136;
          }
          if (!strncasecmp(v39, "crashlog", 8uLL))
          {
            unsigned int v40 = v3[18] & 0xFFFFFAF3 | 0x504;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "basestamp", 9uLL))
          {
            unsigned int v40 = v3[18] | 0x100;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "link", 4uLL) || !strncasecmp(v39, "symlink", 7uLL))
          {
            unsigned int v40 = v3[18] | 0x200;
            goto LABEL_123;
          }
          if (!strncasecmp(v39, "ttl", 3uLL))
          {
            uint64_t v45 = (char)v39[3];
            if (v45 == 61)
            {
              v3[28] = asl_core_str_to_time();
              uint64_t v23 = v54;
            }
            else
            {
              uint64_t v23 = v54;
              if ((v45 & 0xFFFFFFF8) == 0x30 && v39[4] == 61) {
                v3[(v45 - 48) + 20] = asl_core_str_to_time();
              }
            }
            goto LABEL_124;
          }
          uint64_t v23 = v54;
          if (!strncasecmp(v39, "size_only", 9uLL))
          {
            unsigned int v40 = v3[18] | 0x8000;
            goto LABEL_123;
          }
        }
      }
LABEL_124:
      free(v39);
      unsigned int v39 = next_word_from_string(&v56);
    }
    while (v39);
  }
  uint64_t v46 = (const char *)*((void *)v3 + 1);
  if (!strncasecmp(v46, "/Library/Logs/CrashReporter", 0x1BuLL)
    || !strncasecmp(v46, "/var/mobile/Library/Logs/CrashReporter", 0x26uLL)
    || !strncasecmp(v46, "/private/var/mobile/Library/Logs/CrashReporter", 0x2EuLL))
  {
    v3[18] = v3[18] & 0xFFFFFAF3 | 0x504;
  }
  unsigned int v47 = v3[28];
  for (uint64_t j = 20; j != 28; ++j)
  {
    unsigned int v49 = v3[j];
    if (v49 > v47)
    {
      v3[28] = v49;
      unsigned int v47 = v49;
    }
  }
  uint64_t v50 = (char *)*((void *)v3 + 3);
  if (!v50)
  {
    uint64_t v50 = strdup("std");
    *((void *)v3 + 3) = v50;
  }
  if (strcmp(v50, "std") && strcmp(v50, "bsd")) {
    v3[18] &= ~8u;
  }
  if (!strcmp(v50, "std") || !strcmp(v50, "bsd") || !strcmp(v50, "msg"))
  {
    unsigned int v51 = v3[18] | 0x4000;
    v3[18] = v51;
  }
  else
  {
    unsigned int v51 = v3[18];
  }
  if ((~v51 & 0x102) == 0)
  {
    unsigned int v51 = v51 & 0xFFFFFFFC | 1;
    v3[18] = v51;
  }
  if (!strcmp(v50, "raw")) {
    *((void *)v3 + 7) = "sec";
  }
  if (!strcmp(v46, "/var/log/asl"))
  {
    unsigned int v51 = 0x2000;
    v3[18] = 0x2000;
  }
  uint64_t v52 = *((void *)v3 + 19);
  if (!v52)
  {
    uint64_t v52 = *((void *)v3 + 20);
    *((void *)v3 + 19) = v52;
  }
  if ((v51 & 0x8000) != 0 && (!v52 || !*((void *)v3 + 20)))
  {
    v51 &= ~0x8000u;
    v3[18] = v51;
  }
  if ((~v51 & 0x8400) == 0) {
    v3[18] = v51 & 0xFFFF7FFF;
  }
  *((_DWORD *)v28 + 2) = 2;
  *((void *)v28 + 3) = v3;
  *((void *)v28 + 5) = *(void *)(v23 + 16);
  *(void *)(v23 + 16) = v28;
  return v3;
}

_DWORD *asl_out_module_init_from_file(const char *a1, FILE *a2)
{
  if (!a2) {
    return 0;
  }
  int v3 = asl_out_module_new(a1);
  if (v3)
  {
    line_from_file = get_line_from_file(a2);
    if (line_from_file)
    {
      uint64_t v5 = line_from_file;
      do
      {
        asl_out_module_parse_line((uint64_t)v3, v5);
        free(v5);
        uint64_t v5 = get_line_from_file(a2);
      }
      while (v5);
    }
  }
  return v3;
}

_DWORD *asl_out_module_init()
{
  *(void *)uint64_t v5 = 0;
  sub_1000093E4((DIR *)v5, "/usr/local/etc/asl", 2);
  sub_1000093E4((DIR *)v5, "/etc/asl", 0);
  uint64_t v0 = *(void *)v5;
  if (!sub_10000957C(*(uint64_t *)v5, "com.apple.asl"))
  {
    uint64_t v2 = fopen("/etc/asl.conf", "r");
    if (v2)
    {
      int v3 = v2;
      unsigned int v4 = asl_out_module_init_from_file("com.apple.asl", v2);
      fclose(v3);
      uint64_t v0 = *(void *)v5;
      if (v4)
      {
        *((void *)v4 + 3) = *(void *)v5;
        return v4;
      }
    }
    else
    {
      return *(_DWORD **)v5;
    }
  }
  return (_DWORD *)v0;
}

DIR *sub_1000093E4(DIR *result, char *a2, int a3)
{
  if (result && a2)
  {
    p_dd_fd = (uint64_t *)&result->__dd_fd;
    uint64_t v6 = *(void *)&result->__dd_fd;
    if (*(void *)&result->__dd_fd)
    {
      do
      {
        uint64_t v7 = (_DWORD *)v6;
        uint64_t v6 = *(void *)(v6 + 24);
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t result = opendir(a2);
    if (result)
    {
      int v8 = result;
      uint64_t v9 = "%s/%s";
      while (1)
      {
        uint64_t v10 = readdir(v8);
        if (!v10) {
          break;
        }
        d_name = v10->d_name;
        if (v10->d_name[0] != 46 && !sub_10000957C(*p_dd_fd, d_name))
        {
          int v12 = v9;
          snprintf(__str, 0x400uLL, v9, a2, d_name);
          int v13 = fopen(__str, "r");
          if (v13 && (unsigned __int16 v14 = v13, v15 = asl_out_module_init_from_file(d_name, v13), fclose(v14), v15))
          {
            v15[2] |= a3;
            int v16 = strcmp(d_name, "com.apple.asl");
            uint64_t v17 = *p_dd_fd;
            if (v16)
            {
              if (v17) {
                *((void *)v7 + 3) = v15;
              }
              else {
                uint64_t *p_dd_fd = (uint64_t)v15;
              }
            }
            else
            {
              *((void *)v15 + 3) = v17;
              uint64_t *p_dd_fd = (uint64_t)v15;
              if (v7) {
                int v15 = v7;
              }
            }
          }
          else
          {
            int v15 = v7;
          }
          uint64_t v7 = v15;
          uint64_t v9 = v12;
        }
      }
      return (DIR *)closedir(v8);
    }
  }
  return result;
}

uint64_t sub_10000957C(uint64_t a1, char *__s2)
{
  uint64_t result = 0;
  if (a1 && __s2)
  {
    while (!*(void *)a1 || strcmp(*(const char **)a1, __s2))
    {
      a1 = *(void *)(a1 + 24);
      if (!a1) {
        return 0;
      }
    }
    return a1;
  }
  return result;
}

void asl_out_file_list_free(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      free(*(void **)v1);
      uint64_t v2 = *(void *)(v1 + 40);
      free((void *)v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

uint64_t _check_file_name(char *a1, char *__s, const char *a3, int a4, uint64_t a5, char **a6)
{
  uint64_t result = 0;
  if (!a1) {
    return result;
  }
  if (!__s) {
    return result;
  }
  uint64_t result = strlen(__s);
  if (!result) {
    return result;
  }
  size_t v13 = result;
  if (a3)
  {
    size_t v14 = strlen(a3);
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  size_t v14 = 0;
  if (a6) {
LABEL_6:
  }
    *a6 = 0;
LABEL_7:
  if (strncmp(a1, __s, v13)) {
    return 0;
  }
  int v15 = strrchr(a1, 46);
  int v16 = v15;
  if (v15) {
    BOOL v17 = strcmp(v15, ".gz") == 0;
  }
  else {
    BOOL v17 = 0;
  }
  time_t v18 = &a1[v13];
  if ((a4 & 0x10000000) == 0)
  {
    if ((a4 & 0x20000000) == 0)
    {
      if ((a4 & 0x40000000) == 0 || *v18 != 46) {
        return 0;
      }
      int v19 = v18 + 1;
      if (strncmp(v18 + 1, a3, v14) || (v19 += v14, uint64_t result = a5, *v19))
      {
        uint64_t v20 = v17 ? &v16[-v14] : v16 + 1;
        int v24 = strncmp(v20, a3, v14);
        uint64_t result = v24 == 0;
        if (a6)
        {
          if (!v24)
          {
            uint64_t v23 = v19;
            goto LABEL_35;
          }
        }
      }
      return result;
    }
    if (*v18 != 46) {
      return 0;
    }
    uint64_t v21 = v18 + 1;
    if (strncmp(v18 + 1, a3, v14)) {
      return 0;
    }
    time_t v18 = &v21[v14];
  }
  uint64_t result = a5;
  if (*v18)
  {
    if (*v18 != 46) {
      return 0;
    }
    uint64_t v22 = v18 + 1;
    uint64_t result = v22 != v16;
    if (a6)
    {
      if (v22 != v16)
      {
        uint64_t v23 = v22;
LABEL_35:
        uint64_t v25 = strdup(v23);
        *a6 = v25;
        uint64_t v26 = strchr(v25, 46);
        if (v26) {
          *uint64_t v26 = 0;
        }
        return 1;
      }
    }
  }
  return result;
}

uint64_t _parse_stamp_style(uint64_t result, char a2, int *a3, time_t *a4)
{
  if (!result) {
    return result;
  }
  uint64_t v5 = (const char *)result;
  if (*(unsigned char *)result != 84)
  {
    uint64_t v10 = 0;
    do
    {
      int v11 = *(unsigned __int8 *)(result + v10);
      if (!*(unsigned char *)(result + v10)) {
        goto LABEL_13;
      }
      ++v10;
    }
    while ((v11 - 48) < 0xA);
    if (!strcmp((const char *)(result + v10), ".gz"))
    {
LABEL_13:
      if (a3) {
        *a3 = atoi(v5);
      }
      return 2;
    }
    memset(&v14, 0, sizeof(v14));
    if ((a2 & 0x14) != 0)
    {
      int v12 = sscanf(v5, "%d-%d-%dT%d:%d:%d%c%u:%u:%u", &v14.tm_year, &v14.tm_mon, (unint64_t)&v14 | 0xC, &v14.tm_hour);
    }
    else
    {
      if ((a2 & 0x28) == 0) {
        return 0xFFFFFFFFLL;
      }
      int v12 = sscanf(v5, "%4d%2d%2dT%2d%2d%2d%c%2u%2u%2u", &v14.tm_year, &v14.tm_mon, (unint64_t)&v14 | 0xC, &v14.tm_hour);
    }
    if (v12 == 6)
    {
      *(int32x2_t *)&v14.tm_mon = vadd_s32(*(int32x2_t *)&v14.tm_mon, (int32x2_t)0xFFFFF894FFFFFFFFLL);
      v14.tm_isdst = -1;
      time_t v13 = mktime(&v14);
      if (a4) {
        *a4 = v13;
      }
      return 3;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = (const char *)(result + 1);
  int v7 = atoi((const char *)(result + 1));
  if (!v7 && strcmp(v6, "0")) {
    return 0xFFFFFFFFLL;
  }
  if (a4) {
    *a4 = v7;
  }
  return 1;
}

DIR *asl_list_log_files(char *a1, char *a2, const char *a3, int a4, uint64_t a5)
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = opendir(a1);
      if (result)
      {
        int v11 = result;
        unsigned int v36 = 0;
        time_t v35 = 0;
        memset(&v34, 0, sizeof(v34));
        int v12 = readdir(result);
        if (v12)
        {
          uint64_t v32 = 0;
          if (a4) {
            int v13 = 1;
          }
          else {
            int v13 = 2;
          }
          if ((a4 & 0x3C) != 0) {
            int v14 = 3;
          }
          else {
            int v14 = 0;
          }
          if ((a4 & 3) == 0) {
            int v13 = v14;
          }
          int v31 = v13;
          while (1)
          {
            int v33 = 0;
            d_name = v12->d_name;
            if (!_check_file_name(v12->d_name, a2, a3, a4, a5, &v33)) {
              goto LABEL_47;
            }
            unsigned int v36 = -1;
            time_t v35 = 0;
            int v16 = _parse_stamp_style((uint64_t)v33, a4, (int *)&v36, &v35);
            free(v33);
            if (v16 == -1) {
              goto LABEL_47;
            }
            snprintf(__str, 0x400uLL, "%s/%s", a1, d_name);
            memset(&v34, 0, sizeof(v34));
            int v17 = lstat(__str, &v34);
            if (!v17 && (v34.st_mode & 0xF000) == 0xA000) {
              goto LABEL_47;
            }
            BOOL v18 = v16 == 0;
            if (v16 == 1) {
              BOOL v18 = a5;
            }
            if (!v18 && v16 != v31) {
              goto LABEL_47;
            }
            int v19 = a1;
            uint64_t v20 = malloc_type_calloc(1uLL, 0x38uLL, 0x1030040AD7885B1uLL);
            if (!v20)
            {
              asl_out_file_list_free(v32);
              return 0;
            }
            uint64_t v21 = v20;
            *uint64_t v20 = strdup(d_name);
            *((_DWORD *)v21 + 2) = v16;
            time_t v22 = v35;
            v21[2] = v35;
            unsigned int v23 = v36;
            *((_DWORD *)v21 + 6) = v36;
            if (v17) {
              break;
            }
            v21[4] = v34.st_size;
            uint64_t v24 = v32;
            if (v16 != 2) {
              goto LABEL_34;
            }
            __darwin_time_t tv_sec = v34.st_birthtimespec.tv_sec;
            v21[2] = v34.st_birthtimespec.tv_sec;
            if (tv_sec)
            {
LABEL_28:
              if (v24) {
                goto LABEL_29;
              }
              goto LABEL_43;
            }
            v21[2] = v34.st_mtimespec.tv_sec;
            if (v32)
            {
LABEL_29:
              if (v23 != -1)
              {
                uint64_t v26 = v24;
                if (v23 <= *(_DWORD *)(v24 + 24))
                {
                  do
                  {
                    int v27 = (void *)v26;
                    uint64_t v26 = *(void *)(v26 + 40);
                    if (!v26)
                    {
                      v27[5] = v21;
                      uint64_t v29 = v21;
                      uint64_t v21 = v27;
                      goto LABEL_45;
                    }
                  }
                  while (v23 <= *(_DWORD *)(v26 + 24));
                  v21[5] = v26;
                  v27[5] = v21;
                  v21[6] = v27;
LABEL_40:
                  uint64_t v29 = (void *)v21[5];
                  goto LABEL_45;
                }
              }
LABEL_36:
              v21[5] = v24;
              uint64_t v29 = (void *)v24;
              uint64_t v32 = (uint64_t)v21;
LABEL_45:
              v29[6] = v21;
              goto LABEL_46;
            }
LABEL_43:
            uint64_t v32 = (uint64_t)v21;
LABEL_46:
            a1 = v19;
LABEL_47:
            int v12 = readdir(v11);
            if (!v12) {
              goto LABEL_50;
            }
          }
          uint64_t v24 = v32;
          if (v16 == 2) {
            goto LABEL_28;
          }
LABEL_34:
          if (v24)
          {
            uint64_t v28 = v24;
            if (v22 < *(void *)(v24 + 16)) {
              goto LABEL_36;
            }
            while (1)
            {
              uint64_t v30 = (void *)v28;
              uint64_t v28 = *(void *)(v28 + 40);
              if (!v28) {
                break;
              }
              if (v22 < *(void *)(v28 + 16))
              {
                v21[5] = v28;
                v30[5] = v21;
                v21[6] = v30;
                goto LABEL_40;
              }
            }
            v30[5] = v21;
            uint64_t v29 = v21;
            uint64_t v21 = v30;
            goto LABEL_45;
          }
          goto LABEL_43;
        }
        uint64_t v32 = 0;
LABEL_50:
        closedir(v11);
        return (DIR *)v32;
      }
    }
  }
  return result;
}

DIR *asl_list_src_files(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(const char **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  int v3 = *(char **)(a1 + 40);
  if (!v3) {
    return 0;
  }
  if ((*(_DWORD *)(a1 + 72) & 0x40) != 0)
  {
    memset(&v15, 0, sizeof(v15));
    uint64_t v10 = 0;
    if (!stat(v2, &v15) && (v15.st_mode & 0xF000) == 0x8000)
    {
      if (v15.st_size)
      {
        uint64_t v10 = malloc_type_calloc(1uLL, 0x38uLL, 0x1030040AD7885B1uLL);
        if (v10)
        {
          int v11 = *(char **)(a1 + 8);
          int v12 = strrchr(v11, 47);
          int v13 = v12 ? v12 + 1 : v11;
          void *v10 = strdup(v13);
          __darwin_time_t tv_sec = v15.st_birthtimespec.tv_sec;
          void v10[2] = v15.st_birthtimespec.tv_sec;
          if (!tv_sec) {
            void v10[2] = v15.st_mtimespec.tv_sec;
          }
        }
      }
    }
    return (DIR *)v10;
  }
  if ((*(_DWORD *)(a1 + 72) & 0x110) == 0x100 && *(void *)(a1 + 32) == 0) {
    return 0;
  }
  int v5 = *(_DWORD *)(a1 + 64);
  if ((v5 & 2) != 0) {
    unsigned int v6 = v5 & 0xFFFFFFFC | 1;
  }
  else {
    unsigned int v6 = *(_DWORD *)(a1 + 64);
  }
  int v7 = *(char **)a1;
  int v8 = *(const char **)(a1 + 48);

  return asl_list_log_files(v7, v3, v8, v6, 1);
}

DIR *asl_list_dst_files(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 8)) {
    return 0;
  }
  uint64_t v1 = *(char **)(a1 + 40);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(char **)(a1 + 32);
  if (!v2) {
    uint64_t v2 = *(char **)a1;
  }
  return asl_list_log_files(v2, v1, *(const char **)(a1 + 48), *(_DWORD *)(a1 + 64), 0);
}

uint64_t sub_100009FB4(uint64_t result)
{
  if (result)
  {
    do
    {
      while (1)
      {
        int v2 = *(unsigned __int8 *)++result;
        int v1 = v2;
        if (v2 <= 31) {
          break;
        }
        if (v1 != 32)
        {
          if (v1 != 91) {
            return result;
          }
          do
          {
            int v3 = *(unsigned __int8 *)(result + 1);
            if (v3 == 92)
            {
              int v4 = *(unsigned __int8 *)(result + 2);
              BOOL v5 = v4 == 93;
              if (v4 == 93) {
                uint64_t v6 = 3;
              }
              else {
                uint64_t v6 = 2;
              }
              int v3 = *(unsigned __int8 *)(result + v6);
              if (v5) {
                result += 3;
              }
              else {
                result += 2;
              }
            }
            else
            {
              ++result;
            }
          }
          while (v3 != 93);
        }
      }
    }
    while (v1 == 9);
    if (!v1) {
      return 0;
    }
  }
  return result;
}

unsigned char *sub_10000A02C(char *__s)
{
  if (!__s) {
    return 0;
  }
  for (uint64_t i = __s; ; ++i)
  {
    int v2 = *(unsigned __int8 *)i;
    if (v2 != 32 && v2 != 9) {
      break;
    }
  }
  size_t v4 = strlen(i);
  if (!v4) {
    return 0;
  }
  size_t v5 = v4;
  while (1)
  {
    int v6 = i[v5 - 1];
    if (v6 != 32 && v6 != 9) {
      break;
    }
    if (!--v5) {
      return 0;
    }
  }
  uint64_t v10 = malloc_type_malloc(v5 + 1, 0xC690138uLL);
  int v8 = v10;
  if (v10)
  {
    memcpy(v10, i, v5);
    v8[v5] = 0;
  }
  return v8;
}

_DWORD *sub_10000A0D4(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_uid = atoi(a2);
    if (pw_uid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_uid = v4->pw_uid;
      }
      else {
        int pw_uid = 501;
      }
    }
    int v5 = v2[32];
    uint64_t result = (_DWORD *)*((void *)v2 + 15);
    if (v5)
    {
      uint64_t v6 = v2[32];
      int v7 = (int *)*((void *)v2 + 15);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_uid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4 * (v5 + 1));
      *((void *)v2 + 15) = result;
      if (result)
      {
        uint64_t v9 = v2[32];
        v2[32] = v9 + 1;
        result[v9] = pw_uid;
      }
      else
      {
        v2[32] = 0;
      }
    }
  }
  return result;
}

_DWORD *sub_10000A184(_DWORD *result, char *a2)
{
  if (result && a2)
  {
    int v2 = result;
    int pw_gid = atoi(a2);
    if (pw_gid == 501)
    {
      size_t v4 = getpwnam("mobile");
      if (v4) {
        int pw_gid = v4->pw_gid;
      }
      else {
        int pw_gid = 501;
      }
    }
    int v5 = v2[36];
    uint64_t result = (_DWORD *)*((void *)v2 + 17);
    if (v5)
    {
      uint64_t v6 = v2[36];
      int v7 = (int *)*((void *)v2 + 17);
      while (1)
      {
        int v8 = *v7++;
        if (v8 == pw_gid) {
          break;
        }
        if (!--v6) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t result = reallocf(result, 4 * (v5 + 1));
      *((void *)v2 + 17) = result;
      if (result)
      {
        uint64_t v9 = v2[36];
        v2[36] = v9 + 1;
        result[v9] = pw_gid;
      }
      else
      {
        v2[36] = 0;
      }
    }
  }
  return result;
}

const char *sub_10000A234(const char *result)
{
  if (!result) {
    return result;
  }
  int v1 = result;
  size_t v2 = strlen(result);
  size_t v3 = v2;
  if (v2 >= 2)
  {
    int v4 = *(unsigned __int8 *)v1;
    if (v4 != 39 && v4 != 34 || v1[v2 - 1] != v4)
    {
LABEL_8:
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      do
      {
        if (v1[v6] == 92) {
          ++v5;
        }
        ++v6;
      }
      while (v3 != v6);
      char v7 = 0;
      goto LABEL_14;
    }
    ++v1;
    size_t v3 = v2 - 2;
  }
  if (v3) {
    goto LABEL_8;
  }
  uint64_t v5 = 0;
  char v7 = 1;
LABEL_14:
  uint64_t result = (const char *)malloc_type_malloc(v3 - v5 + 1, 0x6785B7ABuLL);
  if (result)
  {
    uint64_t v8 = 0;
    if ((v7 & 1) == 0)
    {
      do
      {
        int v10 = *(unsigned __int8 *)v1++;
        char v9 = v10;
        if (v10 != 92) {
          result[v8++] = v9;
        }
        --v3;
      }
      while (v3);
    }
    result[v8] = 0;
  }
  return result;
}

uint64_t sub_10000A314(uint64_t a1, const char *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (*a2 == 46)
  {
    int v4 = a2;
  }
  else
  {
    int v10 = *(const char **)(a1 + 40);
    if (!v10) {
      return 0xFFFFFFFFLL;
    }
    size_t v11 = strlen(*(const char **)(a1 + 40));
    if (strncmp(a2, v10, v11) || (int v4 = &a2[v11], a2[v11] != 46))
    {
      int v12 = sub_10000A4C0((uint64_t)a2);
      *(_DWORD *)(a1 + 64) = v12;
      if (v12)
      {
        int v13 = v12;
        uint64_t result = 0;
        if (*(void *)(a1 + 48)) {
          int v14 = 0x20000000;
        }
        else {
          int v14 = 0x10000000;
        }
        int v15 = v14 | v13;
        goto LABEL_26;
      }
      return 0xFFFFFFFFLL;
    }
  }
  uint64_t v5 = v4 + 1;
  for (uint64_t i = v4 + 2; ; ++i)
  {
    unsigned int v7 = *((unsigned __int8 *)i - 1);
    if (v7 <= 0x1F)
    {
      if (*(i - 1)) {
        BOOL v8 = v7 == 9;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
LABEL_24:
        int v16 = sub_10000A4C0((uint64_t)v5);
        *(_DWORD *)(a1 + 64) = v16;
        if (!v16) {
          return 0xFFFFFFFFLL;
        }
        int v17 = v16;
        uint64_t result = 0;
        int v15 = v17 | 0x10000000;
        goto LABEL_26;
      }
      continue;
    }
    if (v7 == 32) {
      goto LABEL_24;
    }
    if (v7 == 46) {
      break;
    }
  }
  BOOL v18 = *(const char **)(a1 + 48);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  size_t v19 = strlen(*(const char **)(a1 + 48));
  if (strncmp(v5, v18, v19) || v5[v19] != 46)
  {
    if (!strncmp(i, v18, v19))
    {
      int v22 = sub_10000A4C0((uint64_t)v5);
      *(_DWORD *)(a1 + 64) = v22;
      if (v22)
      {
        int v23 = v22;
        uint64_t result = 0;
        int v15 = v23 | 0x40000000;
        goto LABEL_26;
      }
    }
    return 0xFFFFFFFFLL;
  }
  int v20 = sub_10000A4C0((uint64_t)i);
  *(_DWORD *)(a1 + 64) = v20;
  if (!v20) {
    return 0xFFFFFFFFLL;
  }
  int v21 = v20;
  uint64_t result = 0;
  int v15 = v21 | 0x20000000;
LABEL_26:
  *(_DWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_10000A4C0(uint64_t result)
{
  if (!result) {
    return result;
  }
  for (unint64_t i = 0; ; ++i)
  {
    int v2 = *(unsigned __int8 *)(result + i);
    if ((v2 - 97) >= 0x1A) {
      break;
    }
    if (i > 0xA) {
      goto LABEL_9;
    }
LABEL_8:
    *((unsigned char *)&v9 + i) = v2;
  }
  if (i <= 0xA && v2 == 45) {
    goto LABEL_8;
  }
LABEL_9:
  *((unsigned char *)&v9 + i) = 0;
  if (v9 == 6514035 || v9 == 0x73646E6F636573) {
    return 1;
  }
  if (!(v9 ^ 0x756C757A | BYTE4(v9)) || v9 == 6517877) {
    return 4;
  }
  if (v9 == 761492597 && WORD2(v9) == 98) {
    return 8;
  }
  if (v9 == 0x697361622D637475 && (unsigned __int16)v10 == 99) {
    return 8;
  }
  BOOL v5 = v9 == 1633906540 && WORD2(v9) == 108;
  if (v5 || v9 == 7103340) {
    return 16;
  }
  if (v9 == 0x622D6C61636F6CLL) {
    return 32;
  }
  if (v9 == 762078060 && WORD2(v9) == 98) {
    return 32;
  }
  if (v9 == 0x61622D6C61636F6CLL && v10 == 6515059) {
    return 32;
  }
  if (v9 == 0x697361622D6C636CLL && (unsigned __int16)v10 == 99) {
    return 32;
  }
  if ((unsigned __int16)v9 == 35 || v9 == 7431539) {
    return 2;
  }
  return 2 * ((v9 ^ 0x65636E6575716573 | v10) == 0);
}

uint64_t _asl_server_query_2(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, void *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  msg.msgh_unsigned int size = 0;
  int v19 = 1;
  uint64_t v20 = a2;
  int v21 = 16777473;
  int v22 = a3;
  NDR_record_t v23 = NDR_record;
  int v24 = a3;
  uint64_t v25 = a4;
  int v26 = a5;
  uint64_t v27 = a6;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x7900000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v14 = mach_msg(&msg, 3, 0x48u, 0x4Cu, reply_port, 0, 0);
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v14)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v15 = 4294966988;
      }
      else if (msg.msgh_id == 221)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v15 = 4294966996;
          if (v19 == 1 && msg.msgh_size == 68 && !msg.msgh_remote_port && HIBYTE(v21) == 1)
          {
            int v16 = v22;
            if (v22 == v24)
            {
              uint64_t v15 = 0;
              *a7 = v20;
              *a8 = v16;
              *a9 = v25;
              *a10 = v26;
              return v15;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (msg.msgh_remote_port) {
              uint64_t v15 = 4294966996;
            }
            else {
              uint64_t v15 = HIDWORD(v20);
            }
          }
        }
        else
        {
          uint64_t v15 = 4294966996;
        }
      }
      else
      {
        uint64_t v15 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v15;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v15;
}

int *__error(void)
{
  return ___error();
}

int asl_close_auxiliary_file(int descriptor)
{
  return _asl_close_auxiliary_file(descriptor);
}

uint64_t asl_core_error()
{
  return _asl_core_error();
}

uint64_t asl_core_str_to_size()
{
  return _asl_core_str_to_size();
}

uint64_t asl_core_str_to_time()
{
  return _asl_core_str_to_time();
}

uint64_t asl_core_time_to_str()
{
  return _asl_core_time_to_str();
}

int asl_create_auxiliary_file(asl_object_t msg, const char *title, const char *uti, int *out_descriptor)
{
  return _asl_create_auxiliary_file(msg, title, uti, out_descriptor);
}

uint64_t asl_file_close()
{
  return _asl_file_close();
}

uint64_t asl_file_fetch_next()
{
  return _asl_file_fetch_next();
}

uint64_t asl_file_filter_level()
{
  return _asl_file_filter_level();
}

uint64_t asl_file_open_read()
{
  return _asl_file_open_read();
}

uint64_t asl_file_open_write()
{
  return _asl_file_open_write();
}

uint64_t asl_file_read_set_position()
{
  return _asl_file_read_set_position();
}

uint64_t asl_file_save()
{
  return _asl_file_save();
}

uint64_t asl_filesystem_path()
{
  return _asl_filesystem_path();
}

uint64_t asl_msg_from_string()
{
  return _asl_msg_from_string();
}

uint64_t asl_msg_list_from_string()
{
  return _asl_msg_list_from_string();
}

uint64_t asl_msg_list_release()
{
  return _asl_msg_list_release();
}

uint64_t asl_msg_new()
{
  return _asl_msg_new();
}

uint64_t asl_msg_release()
{
  return _asl_msg_release();
}

uint64_t asl_msg_set_key_val()
{
  return _asl_msg_set_key_val();
}

uint64_t asl_msg_set_key_val_op()
{
  return _asl_msg_set_key_val_op();
}

uint64_t asl_msg_to_string()
{
  return _asl_msg_to_string();
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return _asl_open(ident, facility, opts);
}

uint64_t asl_string_append_char_no_encoding()
{
  return _asl_string_append_char_no_encoding();
}

uint64_t asl_string_append_no_encoding()
{
  return _asl_string_append_no_encoding();
}

uint64_t asl_string_new()
{
  return _asl_string_new();
}

uint64_t asl_string_release()
{
  return _asl_string_release();
}

uint64_t asl_string_release_return_bytes()
{
  return _asl_string_release_return_bytes();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

uint64_t atol(const char *a1)
{
  return _atol(a1);
}

uint64_t bootstrap_look_up2()
{
  return _bootstrap_look_up2();
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return _fgetln(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

int gzclose(gzFile file)
{
  return _gzclose(file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return _gzdopen(fd, mode);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return _gzwrite(file, buf, len);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
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

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

time_t timegm(tm *const a1)
{
  return _timegm(a1);
}

int truncate(const char *a1, off_t a2)
{
  return _truncate(a1, a2);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}