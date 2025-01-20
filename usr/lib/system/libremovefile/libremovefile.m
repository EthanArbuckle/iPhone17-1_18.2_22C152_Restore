int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  int result;

  switch(key)
  {
    case 1u:
      result = 0;
      *(void *)state = value;
      break;
    case 2u:
      result = 0;
      *((void *)state + 1) = value;
      break;
    case 3u:
      result = 0;
      *((void *)state + 2) = value;
      break;
    case 4u:
      result = 0;
      *((void *)state + 3) = value;
      break;
    case 5u:
      result = 0;
      *((_DWORD *)state + 8) = *(_DWORD *)value;
      break;
    case 6u:
      result = 0;
      *((void *)state + 5) = value;
      break;
    case 7u:
      result = 0;
      *((void *)state + 6) = value;
      break;
    default:
      *__error() = 22;
      result = -1;
      break;
  }
  return result;
}

removefile_state_t removefile_state_alloc(void)
{
  removefile_state_t result = (removefile_state_t)malloc_type_calloc(1uLL, 0x78uLL, 0x10B00406DF828A6uLL);
  if (result) {
    *((_DWORD *)result + 17) = -1;
  }
  return result;
}

int removefile_state_free(removefile_state_t a1)
{
  if (a1)
  {
    if (*((_DWORD *)a1 + 17) != -1)
    {
      close_NOCANCEL();
      *((_DWORD *)a1 + 17) = -1;
    }
    v2 = (void *)*((void *)a1 + 12);
    if (v2) {
      free(v2);
    }
    free(a1);
  }
  return 0;
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  uint64_t v21 = *MEMORY[0x263EF8C08];
  v19[0] = 0;
  v19[1] = 0;
  if (!path)
  {
    v6 = __error();
    int v7 = 22;
    goto LABEL_5;
  }
  if (strnlen(path, 0x400uLL) >= 0x400)
  {
    v6 = __error();
    int v7 = 63;
LABEL_5:
    int *v6 = v7;
    return -1;
  }
  removefile_state_t v10 = state;
  if (!state)
  {
    v11 = (_removefile_state *)malloc_type_calloc(1uLL, 0x78uLL, 0x10B00406DF828A6uLL);
    if (!v11)
    {
      v6 = __error();
      int v7 = 12;
      goto LABEL_5;
    }
    removefile_state_t v10 = v11;
    *((_DWORD *)v11 + 17) = -1;
  }
  *((_DWORD *)v10 + 28) = flags;
  *((_DWORD *)v10 + 29) = 0;
  if ((flags & 0x3C) != 0)
  {
    pid_t v12 = getpid();
    __removefile_init_random(v12, (uint64_t)v10);
  }
  v18[1] = 0x100000000;
  v18[2] = 0;
  uint64_t v16 = 0;
  unsigned int v17 = 0;
  v18[0] = 0x800000005;
  if (getattrlist(path, v18, &v16, 0xCuLL, 1u)) {
    goto LABEL_13;
  }
  if (HIDWORD(v16) != 2 || v17 >= 2) {
    goto LABEL_15;
  }
  if ((open_NOCANCEL() & 0x80000000) != 0 || (v15 = fcntl_NOCANCEL(), int v13 = close_NOCANCEL(), v15 < 0) || v13 < 0) {
LABEL_13:
  }
    int v13 = *__error();
  if (v13)
  {
LABEL_15:
    strncpy(__dst, path, 0x400uLL);
    __dst[1023] = 0;
  }
  v19[0] = __dst;
  int v8 = __removefile_tree_walker(v19, (uint64_t)v10);
  int v14 = *((_DWORD *)v10 + 8);
  if (!state) {
    removefile_state_free(v10);
  }
  if (v8) {
    *__error() = v14;
  }
  return v8;
}

uint64_t __removefile_tree_walker(char *const *a1, uint64_t a2)
{
  v3 = *(uint64_t (**)(uint64_t, char *, void))a2;
  v4 = *(uint64_t (**)(uint64_t, char *, void))(a2 + 40);
  v5 = *(uint64_t (**)(uint64_t, char *, void))(a2 + 16);
  int v6 = *(_DWORD *)(a2 + 112);
  if ((v6 & 0x100) != 0) {
    int v7 = 80;
  }
  else {
    int v7 = 84;
  }
  if ((v6 & 0x80) != 0) {
    int v8 = v7 & 0x3C;
  }
  else {
    int v8 = v7;
  }
  v9 = fts_open(a1, v8, 0);
  if (v9)
  {
    removefile_state_t v10 = v9;
    v11 = fts_read(v9);
    if (v11)
    {
      pid_t v12 = v11;
      uint64_t v13 = 0;
      while (1)
      {
        int fts_info = v12->fts_info;
        if (fts_info == 6)
        {
          if (v12->fts_number == 1)
          {
            v12->fts_number = 0;
            goto LABEL_81;
          }
          if ((v10->fts_options & 0x40) != 0 && v10->fts_dev != v12->fts_dev) {
            goto LABEL_81;
          }
        }
        if (*(_DWORD *)(a2 + 116)) {
          goto LABEL_100;
        }
        *(void *)(a2 + 56) = v12;
        if (v3 && fts_info != 6)
        {
          int v15 = v3(a2, v12->fts_path, *(void *)(a2 + 8));
          if (*(_DWORD *)(a2 + 116)) {
            goto LABEL_100;
          }
          int v16 = v15;
          if (v15) {
            goto LABEL_68;
          }
        }
        uint64_t v13 = 0;
        *(_DWORD *)(a2 + 32) = 0;
        fts_accpath = v12->fts_accpath;
        int v18 = *(_DWORD *)(a2 + 112);
        switch(v12->fts_info)
        {
          case 1u:
            if (!unlink(v12->fts_accpath))
            {
              fts_set(v10, v12, 4);
              goto LABEL_59;
            }
            if ((*(unsigned char *)(a2 + 113) & 2) != 0)
            {
              uint64_t v30 = 0;
              fsctl(fts_accpath, 0xC0084A44uLL, &v30, 0);
            }
            uint64_t v13 = 0;
            if ((v12->fts_statp->st_flags & 0x40000000) == 0 || (v18 & 0x7D) != 1) {
              goto LABEL_60;
            }
            if ((v18 & 2) == 0 || v12->fts_level)
            {
              if (geteuid()
                || (fts_statp = v12->fts_statp, __uint32_t st_flags = fts_statp->st_flags, (st_flags & 6) == 0)
                || (st_flags & 0x60000) != 0
                || (fts_statp->__uint32_t st_flags = st_flags & 0xFFFFFFF9,
                    (chflags(fts_accpath, st_flags & 0xFFFFFFF9) & 0x80000000) == 0))
              {
                if ((!*(void *)a2 || getiopolicy_np(3, 1) == 1) && !unlinkat(-2, fts_accpath, 256))
                {
                  fts_set(v10, v12, 4);
                  uint64_t v13 = 0;
                  *(unsigned char *)(a2 + 64) = 1;
                  goto LABEL_60;
                }
              }
            }
            goto LABEL_59;
          case 2u:
            *(_DWORD *)(a2 + 32) = 62;
            uint64_t v13 = 0xFFFFFFFFLL;
            goto LABEL_65;
          case 3u:
          case 8u:
          case 0xCu:
          case 0xDu:
            if ((v18 & 0x7C) != 0)
            {
              __removefile_sunlink((const std::__fs::filesystem::path *)v12->fts_accpath, a2);
              goto LABEL_32;
            }
            if (!geteuid())
            {
              uint64_t v21 = v12->fts_statp;
              __uint32_t v22 = v21->st_flags;
              if ((v22 & 6) != 0 && (v22 & 0x60000) == 0)
              {
                v21->__uint32_t st_flags = v22 & 0xFFFFFFF9;
                if (chflags(fts_accpath, v22 & 0xFFFFFFF9) < 0) {
                  goto LABEL_95;
                }
              }
            }
            uint64_t v19 = unlink(fts_accpath);
            goto LABEL_32;
          case 4u:
          case 7u:
          case 0xAu:
            int fts_errno = v12->fts_errno;
            goto LABEL_34;
          case 6u:
            if (*(unsigned char *)(a2 + 64) == 1)
            {
              uint64_t v13 = 0;
              *(unsigned char *)(a2 + 64) = 0;
              goto LABEL_60;
            }
            if ((v18 & 1) == 0 || (v18 & 2) != 0 && !v12->fts_level)
            {
LABEL_59:
              uint64_t v13 = 0;
LABEL_60:
              int fts_errno = *(_DWORD *)(a2 + 32);
              if (!fts_errno) {
                goto LABEL_35;
              }
              goto LABEL_61;
            }
            if ((v18 & 0x7C) != 0)
            {
              __removefile_rename_unlink((const std::__fs::filesystem::path *)v12->fts_accpath, a2);
              goto LABEL_32;
            }
            if (geteuid()
              || (v27 = v12->fts_statp, __uint32_t v28 = v27->st_flags, (v28 & 6) == 0)
              || (v28 & 0x60000) != 0
              || (v27->__uint32_t st_flags = v28 & 0xFFFFFFF9, (chflags(fts_accpath, v28 & 0xFFFFFFF9) & 0x80000000) == 0))
            {
              if ((v12->fts_statp->st_flags & 0x40000000) != 0 && (getiopolicy_np(3, 1) == 1 || !*(void *)a2)) {
                uint64_t v19 = unlinkat(-2, fts_accpath, 256);
              }
              else {
                uint64_t v19 = rmdir(fts_accpath);
              }
LABEL_32:
              uint64_t v13 = v19;
              if (v19 != -1) {
                goto LABEL_60;
              }
              goto LABEL_33;
            }
LABEL_95:
            *__error() = 13;
LABEL_33:
            int fts_errno = *__error();
LABEL_34:
            *(_DWORD *)(a2 + 32) = fts_errno;
            uint64_t v13 = 0xFFFFFFFFLL;
            if (!fts_errno)
            {
LABEL_35:
              if (v4 && v12->fts_info != 1)
              {
                int v16 = v4(a2, v12->fts_path, *(void *)(a2 + 48));
                goto LABEL_68;
              }
LABEL_64:
              int v16 = 0;
              goto LABEL_77;
            }
LABEL_61:
            if ((fts_errno == 20 || fts_errno == 2) && v12->fts_level) {
              goto LABEL_64;
            }
LABEL_65:
            if (!v5)
            {
              int v16 = 2;
              goto LABEL_77;
            }
            unsigned int v24 = v5(a2, v12->fts_path, *(void *)(a2 + 24));
            int v16 = v24;
            if (v24 >= 2)
            {
              if (v24 == 2) {
                uint64_t v13 = 0xFFFFFFFFLL;
              }
              else {
                uint64_t v13 = v13;
              }
LABEL_77:
              if (*(unsigned char *)(a2 + 112)) {
                goto LABEL_79;
              }
              goto LABEL_78;
            }
            uint64_t v13 = 0;
LABEL_68:
            if (v12->fts_info == 1 && v16 == 1)
            {
              int v16 = 1;
              v12->fts_number = 1;
            }
            else
            {
              if (v16 != 1) {
                goto LABEL_77;
              }
              int v16 = 1;
            }
LABEL_78:
            fts_set(v10, v12, 4);
LABEL_79:
            if (v16 == 2) {
              goto LABEL_99;
            }
            if (*(_DWORD *)(a2 + 116)) {
              goto LABEL_100;
            }
LABEL_81:
            pid_t v12 = fts_read(v10);
            if (!v12) {
              goto LABEL_99;
            }
            break;
          default:
            goto LABEL_60;
        }
      }
    }
    uint64_t v13 = 0;
LABEL_99:
    if (*(_DWORD *)(a2 + 116))
    {
LABEL_100:
      *(_DWORD *)(a2 + 32) = 89;
      uint64_t v13 = 0xFFFFFFFFLL;
    }
    *(void *)(a2 + 56) = 0;
    fts_close(v10);
  }
  else
  {
    *(_DWORD *)(a2 + 32) = *__error();
    return 0xFFFFFFFFLL;
  }
  return v13;
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  switch(key)
  {
    case 1u:
      int result = 0;
      uint64_t v5 = *(void *)state;
      goto LABEL_11;
    case 2u:
      int result = 0;
      uint64_t v5 = *((void *)state + 1);
      goto LABEL_11;
    case 3u:
      int result = 0;
      uint64_t v5 = *((void *)state + 2);
      goto LABEL_11;
    case 4u:
      int result = 0;
      uint64_t v5 = *((void *)state + 3);
      goto LABEL_11;
    case 5u:
      int result = 0;
      *(_DWORD *)dst = *((_DWORD *)state + 8);
      return result;
    case 6u:
      int result = 0;
      uint64_t v5 = *((void *)state + 5);
      goto LABEL_11;
    case 7u:
      int result = 0;
      uint64_t v5 = *((void *)state + 6);
      goto LABEL_11;
    case 8u:
      int result = 0;
      uint64_t v5 = *((void *)state + 7);
LABEL_11:
      *(void *)dst = v5;
      break;
    default:
      *__error() = 22;
      int result = -1;
      break;
  }
  return result;
}

void __removefile_init_random(unsigned int a1, uint64_t a2)
{
  memset(&v8, 0, sizeof(v8));
  if (stat("/dev/urandom", &v8) || (v8.st_mode & 0xF000) != 0x2000)
  {
    srand(a1);
    int v4 = *(_DWORD *)(a2 + 68);
  }
  else
  {
    int v4 = open_NOCANCEL();
    *(_DWORD *)(a2 + 68) = v4;
  }
  int v11 = 0;
  if (v4 == -1) {
    int v11 = rand();
  }
  else {
    read_NOCANCEL();
  }
  v10.int tv_sec = 0;
  *(void *)&v10.__darwin_suseconds_t tv_usec = 0;
  uint64_t v9 = 0;
  gettimeofday(&v10, &v9);
  int tv_sec = v10.tv_sec;
  __darwin_suseconds_t tv_usec = v10.tv_usec;
  pid_t v7 = getpid();
  srand((tv_usec + tv_sec + v7) ^ v11);
}

uint64_t __removefile_random_char(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 68) == -1)
  {
    return (char)rand();
  }
  else
  {
    read_NOCANCEL();
    return v3;
  }
}

uint64_t __removefile_randomize_buffer(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  uint64_t result = *(unsigned int *)(a3 + 68);
  if (result == -1)
  {
    if (a2)
    {
      do
      {
        uint64_t result = rand();
        *a1++ = result;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    return read_NOCANCEL();
  }
  return result;
}

void __removefile_rename_unlink(const std::__fs::filesystem::path *a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x263EF8C08];
  memset(&v28.st_birthtimespec, 0, 64);
  size_t v4 = strlen((const char *)a1);
  int v11 = (std::__fs::filesystem::path *)((char *)&v28
                                      - ((MEMORY[0x270FA53B0](v4, v5, v4 + 15, v6, v7, v8, v9, v10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)+ 30) & 0xFFFFFFFFFFFFFFF0));
  strlcpy((char *)v11, (const char *)a1, v12);
  uint64_t v13 = strrchr((char *)v11, 47);
  int v14 = v11;
  if (v13)
  {
    v13[1] = 0;
    int v14 = (std::__fs::filesystem::path *)(v13 + 1);
  }
  int v15 = 0;
  uint64_t v16 = MEMORY[0x263EF8C00];
  while (1)
  {
    unsigned int v17 = __removefile_random_char(a2);
    std::string::value_type v18 = v17;
    if ((v17 & 0x80000000) != 0)
    {
      if (!__maskrune(v17, 0x500uLL)) {
        goto LABEL_7;
      }
LABEL_6:
      v14->__pn_.__r_.__value_.__s.__data_[v15++] = v18;
      goto LABEL_7;
    }
    if ((*(_DWORD *)(v16 + 4 * v17 + 60) & 0x500) != 0) {
      goto LABEL_6;
    }
LABEL_7:
    if (v15 >= 14)
    {
      v14->__pn_.__r_.__value_.__s.__data_[v15] = 0;
      int v15 = 0;
      if (lstat((const char *)v11, &v28)) {
        break;
      }
    }
  }
  int v19 = lstat((const char *)a1, &v28);
  if (v19 == -1) {
    return;
  }
  if ((v28.st_mode & 0xF000) == 0x4000)
  {
    if ((v28.st_flags & 0x40000000) != 0)
    {
      unlinkat(-2, (const char *)a1, 256);
      return;
    }
    uint64_t v21 = opendir((const char *)a1);
    if (!v21) {
      goto LABEL_30;
    }
    __uint32_t v22 = v21;
    v23 = readdir(v21);
    if (v23)
    {
      while (v23->d_namlen <= 2u)
      {
        d_name = v23->d_name;
        if (strcmp(v23->d_name, "."))
        {
          if (strcmp(d_name, "..")) {
            break;
          }
        }
        v23 = readdir(v22);
        if (!v23) {
          goto LABEL_21;
        }
      }
      closedir(v22);
LABEL_30:
      v26 = __error();
      int v27 = 66;
LABEL_31:
      int *v26 = v27;
      return;
    }
LABEL_21:
    closedir(v22);
  }
  rename(a1, v11, v20);
  if (v25 != -1)
  {
    if (lstat((const char *)v11, &v28) == -1)
    {
      v26 = __error();
      int v27 = 2;
      goto LABEL_31;
    }
    if ((v28.st_mode & 0xF000) == 0x4000) {
      rmdir((const char *)v11);
    }
    else {
      unlink((const char *)v11);
    }
  }
}

void __removefile_sunlink(const std::__fs::filesystem::path *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8C08];
  memset(&v22, 0, sizeof(v22));
  memset(&v23, 0, 512);
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if (lstat((const char *)a1, &v22) != -1)
  {
    if ((v22.st_mode & 0xF000) != 0x8000 || v22.st_nlink >= 2u) {
      goto LABEL_4;
    }
    int v4 = open_NOCANCEL();
    *(_DWORD *)(a2 + 80) = v4;
    if (v4 != -1)
    {
      if (fcntl_NOCANCEL() != -1
        && (fstatfs(*(_DWORD *)(a2 + 80), &v23) != -1 || *__error() == 78)
        && init_write_buffer((uint64_t)&v22, a2) != -1)
      {
        fcntl_NOCANCEL();
        overwrite_file(a2);
        close_NOCANCEL();
        *(_DWORD *)(a2 + 80) = -1;
        size_t v5 = strlen((const char *)a1);
        size_t v12 = (char *)&v18
            - ((MEMORY[0x270FA53B0](v5, v5 + 18, v6, v7, v8, v9, v10, v11, v18, v19, v20, v21, *(void *)&v22.st_dev, v22.st_ino, *(void *)&v22.st_uid, *(void *)&v22.st_rdev, v22.st_atimespec.tv_sec, v22.st_atimespec.tv_nsec)+ 33) & 0xFFFFFFFFFFFFFFF0);
        bzero(v12, v13);
        if (snprintf(v12, 0x400uLL, "%s%s", (const char *)a1, "/..namedfork/rsrc") >= 1024)
        {
          int v14 = __error();
          int v15 = 63;
          goto LABEL_24;
        }
        if (lstat(v12, &v22))
        {
          int v16 = *__error();
          if (v16 != 2 && v16 != 20) {
            return;
          }
LABEL_22:
          if (!*(_DWORD *)(a2 + 116))
          {
LABEL_4:
            __removefile_rename_unlink(a1, a2);
            return;
          }
          int v14 = __error();
          int v15 = 89;
LABEL_24:
          *int v14 = v15;
          return;
        }
        if (v22.st_size < 1) {
          goto LABEL_22;
        }
        int v17 = open_NOCANCEL();
        *(_DWORD *)(a2 + 80) = v17;
        if (v17 == -1) {
          return;
        }
        if (fcntl_NOCANCEL() != -1 && init_write_buffer((uint64_t)&v22, a2) != -1)
        {
          fcntl_NOCANCEL();
          overwrite_file(a2);
          close_NOCANCEL();
          *(_DWORD *)(a2 + 80) = -1;
          goto LABEL_22;
        }
      }
      close_NOCANCEL();
      *(_DWORD *)(a2 + 80) = -1;
    }
  }
}

uint64_t init_write_buffer(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 88) = *(void *)(a1 + 96);
  int v3 = *(_DWORD *)(a1 + 112);
  *(_DWORD *)(a2 + 104) = v3;
  size_t v4 = (v3 + 4);
  size_t v5 = *(void **)(a2 + 96);
  if (v5)
  {
    if (v4 <= *(_DWORD *)(a2 + 108)) {
      return 0;
    }
    free(v5);
    *(void *)(a2 + 96) = 0;
  }
  uint64_t v6 = malloc_type_malloc(v4, 0x5568DC15uLL);
  *(void *)(a2 + 96) = v6;
  if (v6)
  {
    uint64_t result = 0;
    *(_DWORD *)(a2 + 108) = v4;
  }
  else
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t overwrite_file(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 112);
  if ((v2 & 8) != 0)
  {
    int v3 = 4;
    do
    {
      overwrite((const WINDOW *)1, (WINDOW *)v1);
      --v3;
    }
    while (v3);
    memset(*(void **)(v1 + 96), 85, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 170, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    overwrite_bytes(146, 73, 36, (WINDOW *)v1);
    overwrite_bytes(73, 36, 146, (WINDOW *)v1);
    overwrite_bytes(36, 146, 73, (WINDOW *)v1);
    bzero(*(void **)(v1 + 96), *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 17, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 34, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 51, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 68, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 85, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 102, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 119, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 136, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 153, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 170, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 187, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 204, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 221, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 238, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 255, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    overwrite_bytes(146, 73, 36, (WINDOW *)v1);
    overwrite_bytes(73, 36, 146, (WINDOW *)v1);
    overwrite_bytes(36, 146, 73, (WINDOW *)v1);
    overwrite_bytes(109, 182, 219, (WINDOW *)v1);
    overwrite_bytes(182, 219, 109, (WINDOW *)v1);
    overwrite_bytes(219, 109, 182, (WINDOW *)v1);
    int v4 = 4;
    do
    {
      uint64_t result = overwrite((const WINDOW *)1, (WINDOW *)v1);
      --v4;
    }
    while (v4);
    return result;
  }
  if ((v2 & 4) != 0)
  {
    memset(*(void **)(result + 96), 246, *(unsigned int *)(result + 104));
    overwrite(0, (WINDOW *)v1);
    bzero(*(void **)(v1 + 96), *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 255, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    overwrite((const WINDOW *)1, (WINDOW *)v1);
    bzero(*(void **)(v1 + 96), *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
    memset(*(void **)(v1 + 96), 255, *(unsigned int *)(v1 + 104));
    overwrite(0, (WINDOW *)v1);
  }
  else
  {
    if ((v2 & 0x20) != 0)
    {
      int v6 = 2;
      do
      {
        overwrite((const WINDOW *)1, (WINDOW *)v1);
        --v6;
      }
      while (v6);
      memset(*(void **)(v1 + 96), 170, *(unsigned int *)(v1 + 104));
LABEL_17:
      uint64_t v5 = 0;
      goto LABEL_18;
    }
    if ((v2 & 0x10) == 0)
    {
      if ((v2 & 0x40) == 0) {
        return result;
      }
      bzero(*(void **)(result + 96), *(unsigned int *)(result + 104));
      goto LABEL_17;
    }
  }
  uint64_t v5 = 1;
LABEL_18:

  return overwrite((const WINDOW *)v5, (WINDOW *)v1);
}

uint64_t overwrite_bytes(int a1, int a2, int a3, WINDOW *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8C08];
  uint64_t v4 = *((void *)a4 + 12);
  unsigned int v5 = *((_DWORD *)a4 + 27);
  unsigned int v6 = 12 * (v5 / 0xC);
  v11[0] = (a1 << 24) | (a2 << 16) | (a3 << 8) | a1;
  if (v6)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = (int *)(v4 + v7);
      *uint64_t v8 = (a1 << 24) | (a2 << 16) | (a3 << 8) | a1;
      v8[1] = (a1 << 8) | (a2 << 24) | (a3 << 16) | a2;
      v8[2] = (a2 << 8) | (a1 << 16) | (a3 << 24) | a3;
      v7 += 12;
    }
    while (v7 < v6);
    unsigned int v5 = *((_DWORD *)a4 + 27);
  }
  else
  {
    LODWORD(v7) = 0;
  }
  if (v7 < v5)
  {
    unint64_t v9 = v7;
    do
    {
      *(unsigned char *)(*((void *)a4 + 12) + v9) = *((unsigned char *)v11 + v9 % 3);
      ++v9;
    }
    while (v9 < *((unsigned int *)a4 + 27));
  }

  return overwrite((const WINDOW *)2, a4);
}

int overwrite(const WINDOW *a1, WINDOW *a2)
{
  if (!*((_DWORD *)a2 + 29))
  {
    int v3 = (int)a1;
    lseek(*((_DWORD *)a2 + 20), 0, 0);
    int64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *((void *)a2 + 11);
      if (v4 >= v5 - *((unsigned int *)a2 + 26)) {
        break;
      }
      if (v3 == 1) {
        __removefile_randomize_buffer(*((unsigned char **)a2 + 12), *((unsigned int *)a2 + 26), (uint64_t)a2);
      }
      a1 = (const WINDOW *)write_NOCANCEL();
      v4 += (unint64_t)a1 & ~((uint64_t)a1 >> 63);
      if (*((_DWORD *)a2 + 29)) {
        return (int)a1;
      }
    }
    if (v3 == 1) {
      __removefile_randomize_buffer(*((unsigned char **)a2 + 12), v5 - v4, (uint64_t)a2);
    }
    write_NOCANCEL();
    if ((*((unsigned char *)a2 + 112) & 0x2C) != 0 && fcntl_NOCANCEL()) {
      fsync_NOCANCEL();
    }
    int v6 = *((_DWORD *)a2 + 20);
    LODWORD(a1) = lseek(v6, 0, 0);
  }
  return (int)a1;
}

int removefile_cancel(removefile_state_t state)
{
  if (state)
  {
    int result = 0;
    *((_DWORD *)state + 29) = 1;
  }
  else
  {
    *__error() = 22;
    return -1;
  }
  return result;
}

int removefileat(int fd, const char *path, removefile_state_t state, removefile_flags_t flags)
{
  memset(&v13, 0, sizeof(v13));
  if (!path)
  {
    uint64_t v10 = __error();
    int v11 = 22;
    goto LABEL_11;
  }
  if (fd != -2 && *path != 47)
  {
    if (fstat(fd, &v13)) {
      return -1;
    }
    if ((v13.st_mode & 0xF000) == 0x4000)
    {
      uint64_t v7 = (char *)malloc_type_malloc(0x400uLL, 0x72436087uLL);
      if (v7)
      {
        uint64_t v8 = v7;
        int v9 = fcntl_NOCANCEL();
        if (!v9)
        {
          if (snprintf(v8, 0x400uLL, "%s/%s", v8, path) > 1023)
          {
            *__error() = 63;
            int v9 = -1;
          }
          else
          {
            int v9 = removefile(v8, state, flags);
          }
        }
        free(v8);
        return v9;
      }
      uint64_t v10 = __error();
      int v11 = 12;
    }
    else
    {
      uint64_t v10 = __error();
      int v11 = 20;
    }
LABEL_11:
    *uint64_t v10 = v11;
    return -1;
  }

  return removefile(path, state, flags);
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270EDCED8](*(void *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x270EDD5A8](a1, *(void *)&a2);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x270EDD5D0]();
}

int closedir(DIR *a1)
{
  return MEMORY[0x270EDD038](a1);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x270EDD628]();
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270EDD670](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270EDD688](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270EDD698](*(void *)&a1, a2);
}

uint64_t fsync_NOCANCEL()
{
  return MEMORY[0x270EDD6A0]();
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270EDD108](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270EDD110](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270EDD118](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x270EDD120](a1, a2, *(void *)&a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDD6B0](a1, a2, a3, a4, *(void *)&a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x270EDD6D0]();
}

int getiopolicy_np(int a1, int a2)
{
  return MEMORY[0x270EDD6E0](*(void *)&a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270EDD6F0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270EDD148](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDD758](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDD760](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB00](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDD198](__b, *(void *)&__c, __len);
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x270EDD8D8]();
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDD1C8](a1);
}

int rand(void)
{
  return MEMORY[0x270EDD1F8]();
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x270EDD968]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDD200](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x270EDD980](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDD268](__str, __size, __format);
}

void srand(unsigned int a1)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDD9E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDD2A0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDD2D8](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDD2E0](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDD2F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDD308](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDD320](__s, *(void *)&__c);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDDA58](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x270EDDA60](*(void *)&a1, a2, *(void *)&a3);
}