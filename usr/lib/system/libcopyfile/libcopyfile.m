xattr_flags_t xattr_flags_from_name(const char *a1)
{
  char *v2;
  xattr_flags_t result;
  int v4;
  unsigned int v5;
  int v6;
  int *v7;
  int v8;

  v2 = strrchr((char *)a1, 35);
  if (v2)
  {
    result = (xattr_flags_t)(v2 + 1);
  }
  else
  {
    result = nameInDefaultList((char *)a1);
    if (!result) {
      return result;
    }
  }
  v4 = *(unsigned __int8 *)result;
  if (*(unsigned char *)result)
  {
    v5 = 0;
    do
    {
      v6 = 67;
      v7 = &dword_20D707514;
      do
      {
        if (v4 == v6)
        {
          v5 |= *v7;
        }
        else if (v4 == *((unsigned __int8 *)v7 - 3))
        {
          v5 &= ~*v7;
        }
        v6 = *((unsigned __int8 *)v7 + 4);
        v7 += 2;
      }
      while (v6);
      v8 = *(unsigned __int8 *)++result;
      v4 = v8;
    }
    while (v8);
  }
  else
  {
    return 0;
  }
  return v5;
}

char *__cdecl xattr_name_without_flags(const char *a1)
{
  v2 = strrchr((char *)a1, 35);
  if (!v2)
  {
    v5 = strdup(a1);
    if (v5) {
      return v5;
    }
LABEL_5:
    v5 = 0;
    *__error() = 12;
    return v5;
  }
  size_t v3 = v2 - a1 + 1;
  v4 = (char *)malloc_type_calloc(v3, 1uLL, 0xA8D8BEC8uLL);
  if (!v4) {
    goto LABEL_5;
  }
  v5 = v4;
  strlcpy(v4, a1, v3);
  return v5;
}

uint64_t copyfile_internal(void *a1, int a2)
{
  uint64_t v179 = *MEMORY[0x263EF8C08];
  int v3 = *((_DWORD *)a1 + 6);
  if (v3 < 0 || (a1[2] & 0x80000000) != 0)
  {
    if (*((_DWORD *)a1 + 69))
    {
      int v13 = *__error();
      syslog(7, "%s:%d:%s() file descriptors not open (src: %d, dst: %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1535, "copyfile_internal", *((_DWORD *)a1 + 4), *((_DWORD *)a1 + 6));
      *__error() = v13;
    }
    *((_DWORD *)a1 + 68) = 22;
    return 0xFFFFFFFFLL;
  }
  if ((a2 & 0x400000) != 0)
  {
    uint64_t v5 = copyfile_pack(a1);
    if ((v5 & 0x80000000) != 0)
    {
      v15 = (const char *)a1[1];
      if (v15) {
        unlink(v15);
      }
    }
    return v5;
  }
  if ((a2 & 0x800000) != 0)
  {
    if ((uint64_t)a1[16] >= 65554) {
      size_t v16 = 65554;
    }
    else {
      size_t v16 = a1[16];
    }
    v17 = malloc_type_calloc(1uLL, v16, 0xB9A64F37uLL);
    if (!v17)
    {
      if (*((_DWORD *)a1 + 69))
      {
        int v32 = *__error();
        syslog(7, "%s:%d:%s() copyfile_unpack: calloc(1, %zu) returned NULL\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4661, "copyfile_unpack", v16);
        *__error() = v32;
      }
      return 0xFFFFFFFFLL;
    }
    unint64_t v18 = (unint64_t)v17;
    ssize_t v19 = pread(*((_DWORD *)a1 + 4), v17, v16, 0);
    int v20 = v19;
    if (v19 < 0)
    {
      if (*((_DWORD *)a1 + 69))
      {
        int v33 = *__error();
        syslog(7, "%s:%d:%s() pread returned: %zd\n");
LABEL_78:
        *__error() = v33;
      }
    }
    else
    {
      if (v19 < (uint64_t)v16)
      {
        if (*((_DWORD *)a1 + 69))
        {
          int v21 = *__error();
          syslog(7, "%s:%d:%s() pread couldn't read entire header: %d of %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4679, "copyfile_unpack", v20, a1[16]);
          *__error() = v21;
        }
        goto LABEL_79;
      }
      if ((unint64_t)v19 >= 0x52
        && *(_DWORD *)v18 == 118883584
        && *(_DWORD *)(v18 + 4) == 512
        && *(_WORD *)(v18 + 24) == 512
        && *(_DWORD *)(v18 + 26) == 150994944)
      {
        swap_adhdr((int8x8_t *)v18);
        ssize_t v34 = flistxattr(*((_DWORD *)a1 + 6), 0, 0, 0);
        size_t v35 = v34;
        if (v34 < 1)
        {
          if (v34 < 0 && *__error() != 45 && *__error() != 1)
          {
            uint64_t v5 = 0;
            goto LABEL_80;
          }
        }
        else
        {
          uint64_t v5 = (uint64_t)malloc_type_malloc(v34, 0x810CCEE3uLL);
          if (!v5)
          {
            *((_DWORD *)a1 + 68) = 12;
            goto LABEL_80;
          }
          ssize_t v36 = flistxattr(*((_DWORD *)a1 + 6), (char *)v5, v35, 0);
          if (v36 >= 1)
          {
            unint64_t v37 = v5 + v36;
            v38 = (const char *)v5;
            do
            {
              fremovexattr(*((_DWORD *)a1 + 6), v38, 0);
              v38 += strlen(v38) + 1;
            }
            while ((unint64_t)v38 < v37);
          }
          free((void *)v5);
        }
        if (*(_DWORD *)(v18 + 34) >= 0x21u)
        {
          if (v16 <= 0x77)
          {
            int v33 = *__error();
            syslog(4, "bad attribute header:  %zu < %zu: %m");
            goto LABEL_78;
          }
          swap_attrhdr(v18);
          if (*(_DWORD *)(v18 + 84) != 1096045650)
          {
            if ((*((unsigned char *)a1 + 195) & 0x40) == 0) {
              goto LABEL_79;
            }
            int v33 = *__error();
            syslog(4, "bad attribute header: %m");
            goto LABEL_78;
          }
          int v117 = *(unsigned __int16 *)(v18 + 118);
          if (*(_WORD *)(v18 + 118))
          {
            v118 = 0;
            unsigned int sizea = 0;
            unint64_t v119 = v18 + v16;
            v120 = (unsigned int *)(v18 + 120);
            while (1)
            {
              if ((unint64_t)v120 >= v119 || (unint64_t)v120 < v18 || (unint64_t)(v120 + 3) > v119)
              {
                if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
                {
                  int v140 = *__error();
                  syslog(4, "Incomplete or corrupt attribute entry: %m");
                  goto LABEL_401;
                }
LABEL_402:
                *((_DWORD *)a1 + 68) = 22;
LABEL_340:
                uint64_t v5 = 0xFFFFFFFFLL;
                v125 = (void *)v18;
                goto LABEL_431;
              }
              unsigned int v121 = bswap32(v120[1]);
              unsigned int *v120 = bswap32(*v120);
              v120[1] = v121;
              *((_WORD *)v120 + 4) = bswap32(*((unsigned __int16 *)v120 + 4)) >> 16;
              uint64_t v122 = *((unsigned __int8 *)v120 + 10);
              if (v122 <= 1)
              {
                if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
                {
                  int v140 = *__error();
                  syslog(4, "Corrupt attribute entry (only %d bytes): %m");
LABEL_401:
                  *__error() = v140;
                }
                goto LABEL_402;
              }
              __dsta = v118;
              if (v122 >= 0x81)
              {
                if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
                {
                  int v154 = *__error();
                  syslog(4, "Corrupt attribute entry (name length is %d bytes): %m");
                  goto LABEL_409;
                }
                goto LABEL_410;
              }
              if ((unint64_t)v120 + v122 + 11 > v119)
              {
                if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
                {
                  int v154 = *__error();
                  syslog(4, "Incomplete or corrupt attribute entry: %m", v163);
                  goto LABEL_409;
                }
LABEL_410:
                int v155 = 22;
                goto LABEL_414;
              }
              if (*((unsigned char *)v120 + (v122 - 1) + 11))
              {
                if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
                {
                  int v154 = *__error();
                  syslog(4, "Corrupt attribute entry (name is not NUL-terminated): %m", v163);
LABEL_409:
                  *__error() = v154;
                }
                goto LABEL_410;
              }
              if (*((_DWORD *)a1 + 69) >= 3u)
              {
                int v123 = *__error();
                syslog(7, "%s:%d:%s() extracting \"%s\" (%d bytes) at offset %u\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4851, "copyfile_unpack", (const char *)v120 + 11, v120[1], *v120);
                *__error() = v123;
                unsigned int v121 = v120[1];
              }
              v124 = malloc_type_malloc(v121, 0x3EECC380uLL);
              if (!v124)
              {
                if (*((_DWORD *)a1 + 69))
                {
                  int v156 = *__error();
                  syslog(7, "%s:%d:%s() no memory for %u bytes\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4855, "copyfile_unpack", v120[1]);
                  *__error() = v156;
                }
                int v155 = 12;
LABEL_414:
                *((_DWORD *)a1 + 68) = v155;
                uint64_t v5 = 0xFFFFFFFFLL;
                v125 = (void *)v18;
LABEL_419:
                v118 = __dsta;
LABEL_431:
                free(v125);
                if (v118)
                {
LABEL_432:
                  v43 = v118;
LABEL_81:
                  free(v43);
                }
                if ((v5 & 0x80000000) == 0) {
                  return v5;
                }
                return 0xFFFFFFFFLL;
              }
              v125 = v124;
              ssize_t v126 = pread(*((_DWORD *)a1 + 4), v124, v120[1], *v120);
              uint64_t v127 = v120[1];
              if (v126 != v127)
              {
                if (*((_DWORD *)a1 + 69))
                {
                  int v157 = *__error();
                  syslog(7, "%s:%d:%s() failed to read %u bytes at offset %u\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4861, "copyfile_unpack", v120[1], *v120);
                  *__error() = v157;
                }
                *((_DWORD *)a1 + 68) = 22;
                goto LABEL_418;
              }
              size_t v128 = v126;
              if (!strcmp((const char *)v120 + 11, "figgledidiggledy")) {
                goto LABEL_335;
              }
              if (strcmp((const char *)v120 + 11, "com.apple.acl.text"))
              {
                uint64_t v5 = copyfile_unpack_xattr(a1, (uint64_t)v120, v125);
                if (v5 == -1) {
                  goto LABEL_418;
                }
                goto LABEL_336;
              }
              if (!v127)
              {
LABEL_335:
                uint64_t v5 = 0;
              }
              else
              {
                __dsta = (char *)malloc_type_malloc(v128, 0xC8354D1AuLL);
                if (!__dsta)
                {
                  __dsta = 0;
LABEL_418:
                  free((void *)v18);
                  uint64_t v5 = 0xFFFFFFFFLL;
                  goto LABEL_419;
                }
                memcpy(__dsta, v125, v120[1]);
                uint64_t v5 = 0;
                unsigned int sizea = v120[1];
              }
LABEL_336:
              free(v125);
              v120 = (unsigned int *)((char *)v120 + ((*((unsigned __int8 *)v120 + 10) + 14) & 0x1FC));
              --v117;
              v118 = __dsta;
              if (!v117) {
                goto LABEL_339;
              }
            }
          }
        }
        unsigned int sizea = 0;
        v118 = 0;
        uint64_t v5 = 0;
LABEL_339:
        unint64_t v129 = *(unsigned int *)(v18 + 30);
        if (v16 - 32 < v129) {
          goto LABEL_340;
        }
        v130 = v118;
        if (*(void *)(v18 + v129) | *(void *)(v18 + v129 + 8) | *(void *)(v18 + v129 + 16) | *(void *)(v18 + v129 + 24))
        {
          uint64_t v131 = *(unsigned int *)(v18 + 30);
          if (*((_DWORD *)a1 + 69) >= 3u)
          {
            int v132 = *__error();
            syslog(7, "%s:%d:%s()  extracting \"%s\" (32 bytes)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 4934, "copyfile_unpack", "com.apple.FinderInfo");
            *__error() = v132;
          }
          v133 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
          if (v133)
          {
            a1[31] = "com.apple.FinderInfo";
            int v134 = v133(5, 1, a1, *a1, a1[1], a1[27]);
            a1[31] = 0;
            if (v134 == 1) {
              goto LABEL_374;
            }
            if (v134 == 2) {
              goto LABEL_367;
            }
          }
          uint64_t v135 = fsetxattr(*((_DWORD *)a1 + 6), "com.apple.FinderInfo", (const void *)(v18 + *(unsigned int *)(v18 + 30)), 0x20uLL, 0, 0);
          v136 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
          if (v135)
          {
            uint64_t v5 = v135;
            if (!v136) {
              goto LABEL_430;
            }
            a1[31] = "com.apple.FinderInfo";
            int v137 = v136(5, 3, a1, *a1, a1[1], a1[27]);
            a1[31] = 0;
            if (v137 != 2) {
              goto LABEL_430;
            }
            goto LABEL_367;
          }
          if (v136)
          {
            a1[31] = "com.apple.FinderInfo";
            int v139 = v136(5, 2, a1, *a1, a1[1], a1[27]);
            a1[31] = 0;
            if (v139 == 2)
            {
LABEL_367:
              *((_DWORD *)a1 + 68) = 89;
LABEL_368:
              uint64_t v5 = 0xFFFFFFFFLL;
              goto LABEL_430;
            }
          }
          uint64_t v5 = 0;
          if ((*(_WORD *)(v18 + v131 + 8) & 0x40) != 0) {
            *((_DWORD *)a1 + 49) |= 2u;
          }
        }
LABEL_374:
        if (*(_DWORD *)(v18 + 38) != 2) {
          goto LABEL_426;
        }
        int64_t v141 = *(unsigned int *)(v18 + 46);
        if (!v141) {
          goto LABEL_426;
        }
        off_t v142 = *(unsigned int *)(v18 + 42);
        v143 = malloc_type_malloc(*(unsigned int *)(v18 + 46), 0x1AF7F836uLL);
        if (!v143)
        {
          if (*((_DWORD *)a1 + 69))
          {
            int v149 = *__error();
            syslog(7, "%s:%d:%s() could not allocate %zu bytes for rsrcforkdata\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5002, "copyfile_unpack", v141);
            *__error() = v149;
          }
          uint64_t v5 = 0xFFFFFFFFLL;
          goto LABEL_426;
        }
        v144 = v143;
        if (fstat(*((_DWORD *)a1 + 6), (stat *)&v178) < 0)
        {
          if (*((_DWORD *)a1 + 69))
          {
            int v148 = *__error();
            syslog(7, "%s:%d:%s() couldn't stat destination file\n");
            goto LABEL_422;
          }
LABEL_424:
          uint64_t v5 = 0xFFFFFFFFLL;
          goto LABEL_425;
        }
        ssize_t v145 = pread(*((_DWORD *)a1 + 4), v144, v141, v142);
        size_t v146 = v145;
        if (v145 < v141)
        {
          int v147 = *((_DWORD *)a1 + 69);
          if (v145 == -1)
          {
            if (v147)
            {
              int v148 = *__error();
              syslog(7, "%s:%d:%s() couldn't read resource fork\n");
              goto LABEL_422;
            }
          }
          else if (v147)
          {
            int v148 = *__error();
            syslog(7, "%s:%d:%s() couldn't read resource fork (only read %d bytes of %d)\n");
LABEL_422:
            uint64_t v5 = 0xFFFFFFFFLL;
LABEL_423:
            *__error() = v148;
            goto LABEL_425;
          }
          goto LABEL_424;
        }
        v150 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (!v150) {
          goto LABEL_452;
        }
        a1[31] = "com.apple.ResourceFork";
        int v151 = v150(5, 1, a1, *a1, a1[1], a1[27]);
        a1[31] = 0;
        if (v151 == 1)
        {
LABEL_425:
          free(v144);
LABEL_426:
          if (v130)
          {
            v118 = v130;
            uint64_t v5 = copyfile_unpack_acl((uint64_t)a1, sizea, v130);
            if (v5 == -1)
            {
              free((void *)v18);
              uint64_t v5 = 0xFFFFFFFFLL;
              goto LABEL_432;
            }
          }
          if ((a1[24] & 2) != 0)
          {
            copyfile_stat((uint64_t)a1);
            uint64_t v5 = 0;
          }
LABEL_430:
          v125 = (void *)v18;
          v118 = v130;
          goto LABEL_431;
        }
        if (v151 != 2)
        {
LABEL_452:
          if (fsetxattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", v144, v146, 0, 0))
          {
            if (v146 == 286 && (v178.f_iosize & 0xF000) == 0x4000 && !memcmp(v144, &empty_rsrcfork_header, 0x11EuLL))
            {
              if (*((_DWORD *)a1 + 69) >= 2u)
              {
                int v162 = *__error();
                syslog(7, "%s:%d:%s() not setting empty resource fork on directory\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5059, "copyfile_unpack");
                int v148 = 0;
                uint64_t v5 = 0;
                *__error() = v162;
                goto LABEL_423;
              }
            }
            else
            {
              v152 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
              if (!v152
                || (a1[31] = "com.apple.ResourceFork", int v153 = v152(5, 3, a1, *a1, a1[1], a1[27]), a1[31] = 0, v153))
              {
                if (*((_DWORD *)a1 + 69))
                {
                  int v148 = *__error();
                  syslog(7, "%s:%d:%s() error %d setting resource fork attribute\n");
                  goto LABEL_422;
                }
                goto LABEL_424;
              }
            }
            int v148 = 0;
LABEL_449:
            uint64_t v5 = 0;
            goto LABEL_423;
          }
          v158 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
          if (!v158
            || (a1[31] = "com.apple.ResourceFork", int v159 = v158(5, 2, a1, *a1, a1[1], a1[27]),
                                                   a1[31] = 0,
                                                   v159 != 2))
          {
            if (*((_DWORD *)a1 + 69) >= 3u)
            {
              int v160 = *__error();
              syslog(7, "%s:%d:%s() extracting \"%s\" (%d bytes)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5090, "copyfile_unpack", "com.apple.ResourceFork", v141);
              *__error() = v160;
            }
            if ((a1[24] & 2) != 0
              || (acl[1] = 0,
                  acl[2] = 0,
                  acl[0] = (acl_t)0x140000000005,
                  *(_OWORD *)&v177.st_dev = *(_OWORD *)v178.f_fsid.val,
                  *(_OWORD *)&v177.st_uid = *(_OWORD *)&v178.f_files,
                  !fsetattrlist(*((_DWORD *)a1 + 6), acl, &v177, 0x20uLL, 0)))
            {
              uint64_t v5 = 0;
              goto LABEL_425;
            }
            int v148 = *__error();
            v161 = (const char *)a1[1];
            if (!v161) {
              v161 = "(null dst)";
            }
            syslog(4, "%s: set times: %m", v161);
            goto LABEL_449;
          }
        }
        *((_DWORD *)a1 + 68) = 89;
        free(v144);
        goto LABEL_368;
      }
      if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
      {
        int v33 = *__error();
        syslog(4, "Not a valid Apple Double header: %m");
        goto LABEL_78;
      }
    }
LABEL_79:
    uint64_t v5 = 0xFFFFFFFFLL;
LABEL_80:
    v43 = (void *)v18;
    goto LABEL_81;
  }
  if ((a2 & 4) == 0) {
    goto LABEL_6;
  }
  ssize_t v22 = flistxattr(v3, 0, 0, 0);
  size_t v23 = v22;
  if (v22 < 1)
  {
    if (v22 < 0) {
      goto LABEL_124;
    }
    goto LABEL_102;
  }
  v24 = 0;
  int64_t v25 = 0;
  int v26 = -3;
  while (1)
  {
    if ((uint64_t)v23 <= v25)
    {
      size_t v23 = v25;
      v28 = v24;
    }
    else
    {
      if (v23 >= 0x2000001)
      {
        int v27 = *__error();
        syslog(4, "destination's xattr list size (%zu) exceeds the threshold (%d); trying to allocate: %m",
          v23,
          0x2000000);
        *__error() = v27;
      }
      v28 = (char *)malloc_type_realloc(v24, v23, 0x121238E5uLL);
      if (!v28)
      {
LABEL_128:
        if (!v24) {
          goto LABEL_144;
        }
        goto LABEL_143;
      }
    }
    int64_t v25 = v23;
    ssize_t v29 = flistxattr(*((_DWORD *)a1 + 6), v28, v23, 0);
    if ((v29 & 0x8000000000000000) == 0) {
      break;
    }
    if (*__error() != 34 || v26 == 0) {
      goto LABEL_100;
    }
    ssize_t v31 = flistxattr(*((_DWORD *)a1 + 6), 0, 0, 0);
    size_t v23 = v31;
    ++v26;
    v24 = v28;
    if (v31 < 1)
    {
      if (v31 < 0)
      {
        if (v28) {
          free(v28);
        }
        goto LABEL_124;
      }
LABEL_100:
      if (v28) {
        goto LABEL_101;
      }
      goto LABEL_102;
    }
  }
  if (!v29) {
    goto LABEL_100;
  }
  v44 = &v28[v29 - 1];
  if (*v44) {
    char *v44 = 0;
  }
  if (v28 <= v44)
  {
    v45 = v28;
    do
    {
      if (strncmp(v45, "figgledidiggledy", v44 - v45)) {
        fremovexattr(*((_DWORD *)a1 + 6), v45, 0);
      }
      v45 += strlen(v45) + 1;
    }
    while (v45 <= v44);
    goto LABEL_100;
  }
LABEL_101:
  free(v28);
LABEL_102:
  if ((a1[24] & 8) != 0 && (*((unsigned char *)a1 + 148) & 0x20) != 0 && doesdecmpfs(*((_DWORD *)a1 + 4)))
  {
    BOOL v46 = doesdecmpfs(*((_DWORD *)a1 + 6));
    BOOL v47 = !v46;
    int v48 = 32 * v46;
  }
  else
  {
    int v48 = 0;
    BOOL v47 = 1;
  }
  ssize_t v49 = flistxattr(*((_DWORD *)a1 + 4), 0, 0, v48);
  if (v49 < 1) {
    goto LABEL_123;
  }
  BOOL __dst = v47;
  v24 = 0;
  ssize_t v50 = 0;
  int v51 = -3;
  while (1)
  {
    if (v49 <= v50)
    {
      ssize_t v49 = v50;
      v53 = v24;
    }
    else
    {
      if ((unint64_t)v49 >= 0x2000001)
      {
        int v52 = *__error();
        syslog(4, "source's xattr list size (%zu) exceeds the threshold (%d); trying to allocate: %m", v49, 0x2000000);
        *__error() = v52;
      }
      v53 = (char *)malloc_type_realloc(v24, v49, 0xE40FED83uLL);
      if (!v53) {
        goto LABEL_128;
      }
    }
    ssize_t v50 = v49;
    ssize_t v54 = flistxattr(*((_DWORD *)a1 + 4), v53, v49, v48);
    uint64_t v5 = v54;
    if ((v54 & 0x8000000000000000) == 0) {
      break;
    }
    if (*__error() != 34 || v51 == 0) {
      goto LABEL_137;
    }
    ssize_t v49 = flistxattr(*((_DWORD *)a1 + 4), 0, 0, v48);
    ++v51;
    v24 = v53;
    if (v49 <= 0)
    {
      if (v53) {
        free(v53);
      }
LABEL_123:
      if (v49)
      {
LABEL_124:
        if (*__error() != 45)
        {
          if (*__error() == 1) {
            uint64_t v5 = 0;
          }
          else {
            uint64_t v5 = 0xFFFFFFFFLL;
          }
          goto LABEL_358;
        }
      }
LABEL_6:
      uint64_t v5 = 0;
LABEL_7:
      if ((a2 & 0x8000008) != 0)
      {
        uint64_t v5 = copyfile_data(a1, 0);
        if ((v5 & 0x80000000) != 0)
        {
          int v39 = *__error();
          syslog(4, "error processing data: %m");
          *__error() = v39;
          v40 = (const char *)a1[1];
          if (v40 && unlink(v40))
          {
            int v41 = *__error();
            v42 = (const char *)*a1;
            if (!*a1) {
              v42 = "(null src)";
            }
            syslog(4, "%s: remove: %m", v42);
            *__error() = v41;
          }
          return v5;
        }
      }
      if ((a2 & 3) == 0) {
        goto LABEL_282;
      }
      acl[0] = 0;
      obj_p = 0;
      acl_t acl_p = 0;
      filesec_t v6 = filesec_init();
      if (!v6)
      {
        uint64_t v5 = 0xFFFFFFFFLL;
        goto LABEL_284;
      }
      v7 = v6;
      if ((a1[24] & 1) == 0) {
        goto LABEL_12;
      }
      if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, acl))
      {
        if (*__error() == 2)
        {
          acl[0] = 0;
          goto LABEL_90;
        }
LABEL_91:
        uint64_t v5 = 0xFFFFFFFFLL;
LABEL_275:
        filesec_free(v7);
        if (acl[0]) {
          acl_free(acl[0]);
        }
        if (obj_p) {
          acl_free(obj_p);
        }
        if (acl_p) {
          acl_free(acl_p);
        }
        if ((v5 & 0x80000000) == 0)
        {
LABEL_282:
          if ((a2 & 2) != 0)
          {
            copyfile_stat((uint64_t)a1);
            return 0;
          }
          return v5;
        }
LABEL_284:
        int v109 = *__error();
        syslog(4, "error processing security information: %m");
        goto LABEL_285;
      }
LABEL_90:
      if (fstatx_np(*((_DWORD *)a1 + 6), &v177, v7)) {
        goto LABEL_91;
      }
      if (filesec_get_property(v7, FILESEC_ACL, &obj_p))
      {
        if (*__error() != 2) {
          goto LABEL_91;
        }
        unint64_t v59 = 0;
        obj_p = 0;
      }
      else
      {
        unint64_t v59 = (unint64_t)obj_p;
      }
      if ((unint64_t)acl[0] | v59)
      {
        acl_t acl_p = acl_init(4);
        if (!acl_p) {
          goto LABEL_91;
        }
        if (acl[0])
        {
          *(void *)&v178.f_buint64_t size = 0;
          acl_entry_t entry_p = 0;
          uint64_t v5 = 0;
          if (!acl_get_entry(acl[0], 0, (acl_entry_t *)&v178))
          {
            uint64_t v5 = 0;
            do
            {
              acl_flagset_t flagset_p = 0;
              acl_get_flagset_np(*(void **)&v178.f_bsize, &flagset_p);
              if (!acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
              {
                if (acl_create_entry(&acl_p, &entry_p) == -1) {
                  goto LABEL_91;
                }
                uint64_t v97 = acl_copy_entry(entry_p, *(acl_entry_t *)&v178.f_bsize);
                if (v97 == -1) {
                  goto LABEL_91;
                }
                uint64_t v5 = v97;
                if (*((_DWORD *)a1 + 69) >= 2u)
                {
                  int v98 = *__error();
                  v99 = (const char *)*a1;
                  v100 = (const char *)a1[1];
                  if (!*a1) {
                    v99 = "(null src)";
                  }
                  if (!v100) {
                    v100 = "(null tmp)";
                  }
                  syslog(7, "%s:%d:%s() copied acl entry from %s to %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3166, "copyfile_security", v99, v100);
                  *__error() = v98;
                }
              }
              if (*(void *)&v178.f_bsize) {
                int v101 = -1;
              }
              else {
                int v101 = 0;
              }
            }
            while (!acl_get_entry(acl[0], v101, (acl_entry_t *)&v178));
          }
        }
        else
        {
          uint64_t v5 = 0;
        }
        if (obj_p)
        {
          *(void *)&v178.f_buint64_t size = 0;
          acl_flagset_t flagset_p = 0;
          acl_entry_t entry_p = 0;
          if (!acl_get_entry((acl_t)obj_p, 0, (acl_entry_t *)&v178))
          {
            do
            {
              acl_get_flagset_np(*(void **)&v178.f_bsize, &flagset_p);
              if (acl_get_flag_np(flagset_p, ACL_ENTRY_INHERITED))
              {
                if (acl_create_entry(&acl_p, &entry_p) == -1) {
                  goto LABEL_91;
                }
                uint64_t v110 = acl_copy_entry(entry_p, *(acl_entry_t *)&v178.f_bsize);
                if (v110 == -1) {
                  goto LABEL_91;
                }
                uint64_t v5 = v110;
                if (a1 && *((_DWORD *)a1 + 69) >= 2u)
                {
                  int v111 = *__error();
                  v112 = (const char *)*a1;
                  v113 = (const char *)a1[1];
                  if (!*a1) {
                    v112 = "(null dst)";
                  }
                  if (!v113) {
                    v113 = "(null tmp)";
                  }
                  syslog(7, "%s:%d:%s() copied acl entry from %s to %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3190, "copyfile_security", v112, v113);
                  *__error() = v111;
                }
              }
              if (*(void *)&v178.f_bsize) {
                int v114 = -1;
              }
              else {
                int v114 = 0;
              }
            }
            while (!acl_get_entry((acl_t)obj_p, v114, (acl_entry_t *)&v178));
          }
        }
        int v115 = filesec_set_property((filesec_t)a1[23], FILESEC_ACL, &acl_p);
        if (a1 && !v115 && *((_DWORD *)a1 + 69) >= 3u)
        {
          int v116 = *__error();
          syslog(7, "%s:%d:%s() altered acl\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3197, "copyfile_security");
          *__error() = v116;
        }
      }
      else
      {
LABEL_12:
        uint64_t v5 = 0;
      }
      filesec_t v8 = filesec_dup((filesec_t)a1[23]);
      if (!v8) {
        goto LABEL_91;
      }
      v9 = v8;
      mode_t v10 = *((_WORD *)a1 + 18);
      if ((a1[24] & 2) == 0 || (int v11 = *((_DWORD *)a1 + 49), (v11 & 0x4000) != 0))
      {
        BOOL v12 = 1;
      }
      else if ((v11 & 0x8000) != 0 {
             || fstatfs(*((_DWORD *)a1 + 4), &v178) != -1 && (v178.f_flags & 8) != 0
      }
             || (BOOL v12 = 1, fstatfs(*((_DWORD *)a1 + 6), &v178) != -1) && (v178.f_flags & 8) != 0)
      {
        LOWORD(v178.f_bsize) = 0;
        if (filesec_get_property(v9, FILESEC_MODE, &v178) || (v178.f_bsize & 0xC00) == 0)
        {
          BOOL v12 = 1;
        }
        else
        {
          LOWORD(v178.f_bsize) &= 0xF3FFu;
          BOOL v12 = filesec_set_property(v9, FILESEC_MODE, &v178) == 0;
        }
        v10 &= 0xF3FFu;
      }
      int v102 = a1[24] & 3;
      switch(v102)
      {
        case 3:
LABEL_256:
          if (!v12 || fchmodx_np(*((_DWORD *)a1 + 6), v9) < 0)
          {
            *(void *)&v178.f_buint64_t size = 0;
            if ((a1[24] & 2) != 0 && fchmod(*((_DWORD *)a1 + 6), v10) == -1)
            {
              int v103 = *__error();
              v104 = "(null string)";
              v105 = (const char *)a1[1];
              if (!v105) {
                v105 = "(null string)";
              }
              if (*a1) {
                v104 = (const char *)*a1;
              }
              syslog(4, "could not change mode of destination file %s to match source file %s: %m", v105, v104);
              *__error() = v103;
            }
            fchown(*((_DWORD *)a1 + 6), *((_DWORD *)a1 + 12), *((_DWORD *)a1 + 13));
            if (!filesec_get_property(v9, FILESEC_ACL, &v178))
            {
              if (MEMORY[0x21055B0B0](*((unsigned int *)a1 + 6), *(void *)&v178.f_bsize) == -1)
              {
                int v106 = *__error();
                v107 = "(null string)";
                v108 = (const char *)a1[1];
                if (!v108) {
                  v108 = "(null string)";
                }
                if (*a1) {
                  v107 = (const char *)*a1;
                }
                syslog(4, "could not apply acl to destination file %s from source file %s: %m", v108, v107);
                *__error() = v106;
              }
              acl_free(*(void **)&v178.f_bsize);
            }
          }
          break;
        case 2:
          fchmod(*((_DWORD *)a1 + 6), v10);
          break;
        case 1:
          filesec_set_property(v9, FILESEC_OWNER, 0);
          filesec_set_property(v9, FILESEC_GROUP, 0);
          filesec_set_property(v9, FILESEC_MODE, 0);
          goto LABEL_256;
      }
      filesec_free(v9);
      goto LABEL_275;
    }
  }
  if (!v54)
  {
LABEL_137:
    if (v53) {
      free(v53);
    }
    goto LABEL_358;
  }
  v56 = &v53[v54 - 1];
  if (*v56) {
    char *v56 = 0;
  }
  v57 = malloc_type_malloc(0x1000uLL, 0xB4A05048uLL);
  if (!v57)
  {
    v24 = v53;
LABEL_143:
    free(v24);
LABEL_144:
    uint64_t v5 = 0xFFFFFFFFLL;
    goto LABEL_359;
  }
  v58 = v57;
  if (v53 > v56)
  {
    uint64_t v5 = 0;
    goto LABEL_355;
  }
  uint64_t v60 = 0;
  uint64_t size = 4096;
  v61 = v53;
  uint64_t v165 = (uint64_t)&v53[v5 - 1];
  while (1)
  {
    v62 = (void *)a1[31];
    if (v62)
    {
      free(v62);
      a1[31] = 0;
    }
    size_t v63 = v56 - v61;
    if (!strncmp(v61, "figgledidiggledy", v56 - v61)) {
      goto LABEL_219;
    }
    xattr_operation_intent_t v64 = *((_DWORD *)a1 + 70);
    if (v64)
    {
      if (!xattr_preserve_for_intent(v61, v64)) {
        goto LABEL_219;
      }
    }
    a1[31] = strdup(v61);
    v65 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (v65)
    {
      int v66 = v65(5, 1, a1, *a1, a1[1], a1[27]);
      if (v66 == 1) {
        goto LABEL_219;
      }
      if (v66 == 2) {
        goto LABEL_352;
      }
    }
    if (!strncmp(v61, "com.apple.ResourceFork", v56 - v61))
    {
      if ((*((unsigned char *)a1 + 197) & 4) != 0)
      {
        uint64_t v60 = copyfile_data(a1, 1);
        if (!v60) {
          goto LABEL_217;
        }
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v80 = *__error();
          int v81 = *((_DWORD *)a1 + 68);
          v82 = __error();
          syslog(7, "%s:%d:%s() Resource fork copy (fd) failed (%d - state %d - errno %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3686, "copyfile_xattr", v60, v81, *v82);
          *__error() = v80;
        }
        int v83 = *((_DWORD *)a1 + 68);
        uint64_t v5 = v60;
        goto LABEL_216;
      }
      ssize_t v74 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0, 0, 0, v48);
      if (v74 < 0)
      {
        uint64_t v60 = 0;
        uint64_t v5 = 45;
LABEL_213:
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v167 = *__error();
          uint64_t v91 = v60;
          int v92 = *((_DWORD *)a1 + 68);
          v93 = __error();
          int v164 = v92;
          uint64_t v60 = v91;
          syslog(7, "%s:%d:%s() Resource fork copy (fsetxattr) failed (%d - state %d - errno %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 3704, "copyfile_xattr", v5, v164, *v93);
          *__error() = v167;
        }
        int v83 = *((_DWORD *)a1 + 68);
LABEL_216:
        if (v83 == 89) {
          goto LABEL_354;
        }
        goto LABEL_217;
      }
      size_t v75 = size;
      if (size < 0x100000 && v74 > size)
      {
        if (v74 >= 0x100000) {
          size_t v76 = 0x100000;
        }
        else {
          size_t v76 = v74;
        }
        size_t v77 = v76;
        v58 = reallocf(v58, v76);
        if (!v58)
        {
          int v90 = *__error();
          syslog(4, "realloc for resource fork failed: %m");
          uint64_t size = 0;
          *__error() = v90;
          goto LABEL_212;
        }
        size_t v75 = v77;
      }
      uint64_t size = v75;
      ssize_t v78 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v58, v75, 0, v48);
      if (v78 < 1)
      {
        u_int32_t v79 = 0;
LABEL_204:
        if (v78 < 0)
        {
          int v89 = *__error();
          syslog(4, "resource fork getxattr failed: %m");
          *__error() = v89;
          if (v79) {
            goto LABEL_212;
          }
        }
      }
      else
      {
        u_int32_t v79 = 0;
        while ((fsetxattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", v58, v78, v79, v48) & 0x80000000) == 0)
        {
          v79 += v78;
          ssize_t v78 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v58, size, v79, v48);
          if (v78 < 1) {
            goto LABEL_204;
          }
        }
        int v87 = *__error();
        syslog(4, "writing to resource fork got error: %m");
        *__error() = v87;
        v88 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (!v88) {
          goto LABEL_212;
        }
        if (v88(5, 3, a1, *a1, a1[1], a1[27]) == 2)
        {
          *((_DWORD *)a1 + 68) = 89;
LABEL_212:
          uint64_t v60 = 0xFFFFFFFFLL;
          uint64_t v5 = 0xFFFFFFFFLL;
          goto LABEL_213;
        }
      }
      uint64_t v60 = 0;
      goto LABEL_217;
    }
    uint64_t v166 = v60;
    ssize_t v67 = fgetxattr(*((_DWORD *)a1 + 4), v61, 0, 0, 0, v48);
    if ((v67 & 0x8000000000000000) == 0) {
      break;
    }
    v71 = v58;
LABEL_220:
    v61 += strlen(v61) + 1;
    v58 = v71;
    uint64_t v5 = v60;
    if (v61 > v56) {
      goto LABEL_354;
    }
  }
  ssize_t v68 = v67;
  int v69 = -3;
  while (1)
  {
    if (v68 <= size)
    {
      v71 = v58;
      ssize_t v68 = size;
    }
    else
    {
      if ((unint64_t)v68 >= 0x2000001)
      {
        int v70 = *__error();
        syslog(4, "xattr named %s has size (%zu), which exceeds the threshold (%d); trying to allocate: %m",
          v61,
          v68,
          0x2000000);
        *__error() = v70;
      }
      v71 = malloc_type_realloc(v58, v68, 0x68E25EE9uLL);
      if (!v71)
      {
        free(v58);
        uint64_t size = 0;
        v56 = (char *)v165;
        goto LABEL_197;
      }
    }
    uint64_t size = v68;
    ssize_t v72 = fgetxattr(*((_DWORD *)a1 + 4), v61, v71, v68, 0, v48);
    if ((v72 & 0x8000000000000000) == 0) {
      break;
    }
    if (*__error() == 34 && v69 != 0)
    {
      ssize_t v68 = fgetxattr(*((_DWORD *)a1 + 4), v61, 0, 0, 0, v48);
      ++v69;
      v58 = v71;
      if ((v68 & 0x8000000000000000) == 0) {
        continue;
      }
    }
    goto LABEL_169;
  }
  size_t v84 = v72;
  uint64_t v60 = v166;
  if (!strncmp(v61, "com.apple.decmpfs", v63))
  {
    v56 = (char *)v165;
    if (v84 < 0x10 || *v71 != 1668116582) {
      goto LABEL_220;
    }
    int v86 = v71[1];
    if ((v86 - 7) >= 8 && (v86 - 3) >= 2)
    {
      if (v86 == 5)
      {
        if (*((_DWORD *)a1 + 69) >= 3u)
        {
          int v96 = *__error();
          syslog(7, "%s:%d:%s() compression_type <5> on attribute com.apple.decmpfs for src file %s is not copied.\n");
          goto LABEL_228;
        }
      }
      else
      {
        int v96 = *__error();
        syslog(4, "Invalid compression_type <%d> on attribute %s for src file %s: %m");
LABEL_228:
        *__error() = v96;
      }
LABEL_169:
      v56 = (char *)v165;
      uint64_t v60 = v166;
      goto LABEL_220;
    }
    if (!__dst) {
      *((_DWORD *)a1 + 49) |= 4u;
    }
  }
  v56 = (char *)v165;
  if (fsetxattr(*((_DWORD *)a1 + 6), v61, v71, v84, 0, v48) < 0)
  {
    if (*__error() == 1 && !strcmp(v61, "com.apple.root.installed")) {
      goto LABEL_220;
    }
    v85 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (!v85)
    {
      int v95 = *__error();
      syslog(4, "could not set attributes %s on destination file descriptor: %m", v61);
      *__error() = v95;
LABEL_197:
      uint64_t v60 = 0xFFFFFFFFLL;
      goto LABEL_220;
    }
    if (v85(5, 3, a1, *a1, a1[1], a1[27]) == 2)
    {
      uint64_t v60 = 0xFFFFFFFFLL;
      goto LABEL_353;
    }
  }
  v58 = v71;
LABEL_217:
  v94 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (!v94 || v94(5, 2, a1, *a1, a1[1], a1[27]) != 2)
  {
LABEL_219:
    v71 = v58;
    goto LABEL_220;
  }
  uint64_t v60 = 0xFFFFFFFFLL;
LABEL_352:
  v71 = v58;
LABEL_353:
  *((_DWORD *)a1 + 68) = 89;
  v58 = v71;
  uint64_t v5 = v60;
LABEL_354:
  if (v53) {
LABEL_355:
  }
    free(v53);
  free(v58);
  v138 = (void *)a1[31];
  if (v138)
  {
    free(v138);
    a1[31] = 0;
  }
LABEL_358:
  if ((v5 & 0x80000000) == 0) {
    goto LABEL_7;
  }
LABEL_359:
  if (*__error() != 45 && *__error() != 1)
  {
    int v109 = *__error();
    syslog(4, "error processing extended attributes: %m");
LABEL_285:
    *__error() = v109;
  }
  return v5;
}

uint64_t nameInDefaultList(char *__s2)
{
  if (nameInDefaultList_onceToken != -1) {
    dispatch_once(&nameInDefaultList_onceToken, &__block_literal_global_0);
  }
  v2 = *(const char **)defaultPropertyTable;
  if (!*(void *)defaultPropertyTable) {
    return 0;
  }
  for (i = (const char **)(defaultPropertyTable + 24); ; i += 3)
  {
    if (*(unsigned char *)(i - 1))
    {
      size_t v4 = strlen(v2);
      if (!strncmp(v2, __s2, v4)) {
        break;
      }
    }
    if (!strcmp(v2, __s2)) {
      break;
    }
    uint64_t v5 = *i;
    v2 = v5;
    if (!v5) {
      return 0;
    }
  }
  return (uint64_t)*(i - 2);
}

BOOL doesdecmpfs(int a1)
{
  uint64_t v6 = *MEMORY[0x263EF8C08];
  BOOL result = 0;
  if (!fstatfs(a1, &v4))
  {
    __strlcpy_chk();
    v3[2] = 0;
    v3[0] = 5;
    v3[1] = 0x20000;
    if (getattrlist(v5, v3, v2, 0x24uLL, 0) != -1 && (v2[6] & 1) != 0 && (v2[22] & 1) != 0) {
      return 1;
    }
  }
  return result;
}

uint64_t copyfile_stat(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8C08];
  __int16 v2 = *(_WORD *)(a1 + 36);
  mode_t v3 = v2 & 0xFFF;
  int v4 = *(_DWORD *)(a1 + 196);
  if ((v4 & 0x4000) == 0)
  {
    if ((v4 & 0x8000) != 0
      || (fstatfs(*(_DWORD *)(a1 + 16), &v12) != -1 ? (BOOL v5 = (v12.f_flags & 8) == 0) : (BOOL v5 = 1),
          !v5 || (fstatfs(*(_DWORD *)(a1 + 24), &v12) != -1 ? (BOOL v6 = (v12.f_flags & 8) == 0) : (BOOL v6 = 1), !v6)))
    {
      mode_t v3 = v2 & 0x3FF;
    }
  }
  v11[1] = 0;
  v11[2] = 0;
  v11[0] = 0x140000000005;
  long long v7 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v12.f_buint64_t size = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v12.f_bfree = v7;
  fsetattrlist(*(_DWORD *)(a1 + 24), v11, &v12, 0x20uLL, 0);
  fchown(*(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
  fchmod(*(_DWORD *)(a1 + 24), v3);
  int v8 = *(_DWORD *)(a1 + 148);
  if ((*(_DWORD *)(a1 + 192) & 0x10000000) != 0) {
    int v9 = 1573056;
  }
  else {
    int v9 = 1572992;
  }
  uint64_t result = copyfile_set_bsdflags(a1, (*(_DWORD *)(a1 + 196) << 14) & 0x8000 | v8 & 0xFFE7FF3F, v9);
  if ((v8 & 0x60026) == 0x20) {
    return fsetattrlist(*(_DWORD *)(a1 + 24), v11, &v12, 0x20uLL, 0);
  }
  return result;
}

uint64_t copyfile_set_bsdflags(uint64_t a1, int a2, int a3)
{
  if (fstat(*(_DWORD *)(a1 + 24), &v11))
  {
    if (a3)
    {
      if (*(_DWORD *)(a1 + 276))
      {
        int v6 = *__error();
        __error();
        syslog(7, "%s:%d:%s() couldn't stat destination file for st_flags (%d)\n");
LABEL_18:
        *__error() = v6;
      }
      return *__error();
    }
    __uint32_t v7 = 0;
  }
  else
  {
    __uint32_t v7 = v11.st_flags & a3;
  }
  int v8 = 4;
  do
  {
    __uint32_t v9 = v7 | a2;
    v12[0] = v11.st_flags;
    v12[1] = v7 | a2;
    __uint32_t v13 = -1;
    *__error() = 0;
    if (ffsctl(*(_DWORD *)(a1 + 24), 0xC00C4114uLL, v12, 0))
    {
      if (*__error() != 35) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11.st_flags == v13) {
        return 0;
      }
      v11.st_flags = v13;
      __uint32_t v7 = v13 & a3;
    }
    --v8;
  }
  while (v8);
  __uint32_t v9 = v7 | a2;
LABEL_15:
  uint64_t result = fchflags(*(_DWORD *)(a1 + 24), v9);
  if (!result) {
    return result;
  }
  if (*(_DWORD *)(a1 + 276))
  {
    int v6 = *__error();
    __error();
    syslog(7, "%s:%d:%s() fchflags failed on %s (%d)\n");
    goto LABEL_18;
  }
  return *__error();
}

uint64_t copyfile_data(void *a1, int a2)
{
  uint64_t v112 = *MEMORY[0x263EF8C08];
  if ((*((_WORD *)a1 + 18) & 0xF000) != 0x8000) {
    return 0;
  }
  int v4 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (a2)
  {
    BOOL v5 = (int *)a1 + 5;
    v104 = (int *)(a1 + 2);
    int v6 = (int *)a1 + 7;
    __uint32_t v7 = (int *)(a1 + 3);
    int v8 = (void *)a1[22];
    goto LABEL_17;
  }
  int v10 = *((_DWORD *)a1 + 49);
  if ((v10 & 4) != 0)
  {
    if ((v10 & 0x80) != 0)
    {
      BOOL v11 = 1;
      if ((v10 & 0x100) != 0) {
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v11 = lseek(*((_DWORD *)a1 + 4), 0, 1) == 0;
      if ((*((_DWORD *)a1 + 49) & 0x100) != 0)
      {
LABEL_8:
        BOOL v12 = 1;
        goto LABEL_11;
      }
    }
    BOOL v12 = lseek(*((_DWORD *)a1 + 6), 0, 1) == 0;
LABEL_11:
    if (v11
      && v12
      && !copyfile_set_bsdflags((uint64_t)a1, 32, -1)
      && !fstat(*((_DWORD *)a1 + 6), (stat *)&v111)
      && (v111.f_mntonname[28] & 0x20) != 0)
    {
      goto LABEL_157;
    }
    fremovexattr(*((_DWORD *)a1 + 6), "com.apple.decmpfs", 32);
    fremovexattr(*((_DWORD *)a1 + 6), "com.apple.ResourceFork", 32);
  }
  BOOL v5 = (int *)(a1 + 2);
  int v6 = (int *)(a1 + 3);
  int v8 = a1 + 4;
  __uint32_t v7 = (int *)(a1 + 3);
  v104 = (int *)(a1 + 2);
LABEL_17:
  int v13 = *v6;
  if (fstatfs(*v5, &v111) == -1)
  {
    f_bsize_t size = 0;
    f_iosize_t size = *((_DWORD *)v8 + 28);
  }
  else
  {
    f_bsize_t size = v111.f_bsize;
    f_iosize_t size = v111.f_iosize;
  }
  unint64_t v16 = f_iosize;
  if (fstatfs(v13, &v111) == -1)
  {
    v17 = 0;
    unint64_t v18 = v16;
  }
  else
  {
    v17 = (void *)v111.f_bsize;
    if (v111.f_iosize >= v16) {
      LODWORD(v18) = v16;
    }
    else {
      LODWORD(v18) = v111.f_iosize;
    }
    unint64_t v18 = (int)v18;
    if (!v111.f_iosize) {
      unint64_t v18 = v16;
    }
  }
  v107 = v17;
  unint64_t v19 = *((unsigned int *)a1 + 71);
  if (f_bsize > v19) {
    unint64_t v19 = v16;
  }
  unint64_t v20 = *((unsigned int *)a1 + 72);
  BOOL v21 = v19 < v20 || (unint64_t)v17 > v20;
  if (v21) {
    unint64_t v22 = v18;
  }
  else {
    unint64_t v22 = *((unsigned int *)a1 + 72);
  }
  unint64_t v23 = v8[12];
  if (v23 < v19 && f_bsize != 0)
  {
    if (*((_DWORD *)a1 + 69) >= 3u)
    {
      int v25 = *__error();
      syslog(7, "%s:%d:%s() rounding up block size from fsize: %lld to multiple of %zu\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2852, "copyfile_get_bsizes", a1[16], f_bsize);
      *__error() = v25;
      unint64_t v23 = v8[12];
    }
    if (v23 % f_bsize) {
      unint64_t v26 = f_bsize - v23 % f_bsize;
    }
    else {
      unint64_t v26 = 0;
    }
    unint64_t v19 = v26 + v23;
    if (v22 >= v19) {
      unint64_t v22 = v19;
    }
  }
  if (v22 >= 0x40000000) {
    uint64_t v27 = 0x40000000;
  }
  else {
    uint64_t v27 = v22;
  }
  if (v19 <= 0x40000000) {
    unint64_t v28 = v22;
  }
  else {
    unint64_t v28 = v27;
  }
  if (v19 >= 0x40000000) {
    size_t v29 = 0x40000000;
  }
  else {
    size_t v29 = v19;
  }
  *__error() = 0;
  if (*((_DWORD *)a1 + 69) >= 3u)
  {
    int v30 = *__error();
    syslog(7, "%s:%d:%s() input block size: %zu output block size: %zu\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2926, "copyfile_data", v29, v28);
    *__error() = v30;
  }
  if (a2) {
    goto LABEL_73;
  }
  a1[33] = 0;
  if ((*((unsigned char *)a1 + 195) & 8) == 0) {
    goto LABEL_73;
  }
  size_t v101 = v29;
  uint64_t v31 = fpathconf(*v104, 27);
  if (v31 >= fpathconf(*v7, 27)) {
    int v32 = v7;
  }
  else {
    int v32 = v104;
  }
  unint64_t v33 = fpathconf(*v32, 27);
  if (f_bsize && v107 && v33 >= f_bsize && v33 >= (unint64_t)v107)
  {
    int v105 = *((_DWORD *)a1 + 4);
    int __fd = *((_DWORD *)a1 + 6);
    unint64_t v34 = a1[16];
    size_t v35 = f_bsize >= (unint64_t)v107 ? v107 : (void *)f_bsize;
    ssize_t v36 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    *__error() = 0;
    if ((*((unsigned char *)a1 + 195) & 8) != 0)
    {
      size_t size = (size_t)v35;
      if ((v34 & 0x8000000000000000) != 0)
      {
        ssize_t v72 = 0;
        int v85 = 22;
        goto LABEL_163;
      }
      if (v34)
      {
        unint64_t v67 = lseek(v105, 0, 1);
        unint64_t v68 = lseek(__fd, 0, 1);
        if ((v67 & 0x8000000000000000) != 0 || v34 <= v67 || (v68 & 0x8000000000000000) != 0)
        {
          if (!*__error()) {
            *__error() = 22;
          }
          int v85 = *__error();
          syslog(4, "Invalid file descriptor offset, cannot perform a sparse copy: %m");
        }
        else
        {
          if (v67 % size || v68 % size) {
            goto LABEL_71;
          }
          uint64_t v94 = v34 - v67;
          off_t v95 = v68;
          off_t v69 = lseek(v105, v67, 3);
          if (v69 == -1 || v69 == v34)
          {
            if (lseek(v105, v67, 0) == -1)
            {
              ssize_t v72 = 0;
              goto LABEL_164;
            }
            goto LABEL_71;
          }
          off_t v70 = v69;
          if (ftruncate(__fd, v95) == -1)
          {
            int v85 = *__error();
            syslog(4, "Could not zero destination file before copy: %m");
          }
          else if (ftruncate(__fd, v94 + v95) == -1)
          {
            int v85 = *__error();
            syslog(4, "Could not set destination file size before copy: %m");
          }
          else
          {
            off_t v71 = lseek(v105, v67, 4);
            if (v71 == -1)
            {
              ssize_t v72 = 0;
              if (*__error() == 6) {
                goto LABEL_180;
              }
              goto LABEL_164;
            }
            off_t v98 = v71;
            if (lseek(__fd, v71 + v95 - v67, 0) != -1)
            {
              ssize_t v72 = (char *)malloc_type_malloc(size, 0x6E19359FuLL);
              if (!v72)
              {
                int v85 = *__error();
                syslog(4, "No memory for copy buffer: %m", v90, v91);
                goto LABEL_163;
              }
              ssize_t __nbyte = read(v105, v72, size);
              if (__nbyte < 1) {
                goto LABEL_191;
              }
              while (1)
              {
                int v92 = 0;
                size_t v73 = __nbyte;
                int v103 = v72;
                do
                {
                  while (1)
                  {
                    ssize_t v74 = write(__fd, v103, v73);
                    if (v74 != -1) {
                      break;
                    }
                    int v75 = *__error();
                    syslog(4, "writing to output file failed: %m");
                    *__error() = v75;
                    if (!v36) {
                      goto LABEL_164;
                    }
                    int v76 = v36(4, 3, a1, *a1, a1[1], a1[27]);
                    if (v76)
                    {
                      if (v76 == 1)
                      {
                        int v62 = 0;
                        *__error() = 0;
                        goto LABEL_181;
                      }
LABEL_164:
                      char v79 = 0;
                      *((_DWORD *)a1 + 68) = *__error();
                      int v62 = -1;
                      if (v72) {
LABEL_165:
                      }
                        free(v72);
LABEL_166:
                      unint64_t v37 = 0;
                      if (v79)
                      {
LABEL_167:
                        uint64_t v9 = 0;
                        goto LABEL_173;
                      }
LABEL_111:
                      if (v62 == -1) {
                        goto LABEL_171;
                      }
                      goto LABEL_167;
                    }
                    *__error() = 0;
                  }
                  if (v74)
                  {
                    int v92 = 0;
                    v73 -= v74;
                    v103 += v74;
                  }
                  else
                  {
                    int v77 = v92 + 1;
                    BOOL v21 = v92++ < 5;
                    if (!v21)
                    {
                      int v84 = *__error();
                      syslog(4, "writing to output %d times resulted in 0 bytes written: %m", v77);
                      *__error() = v84;
                      int v85 = 35;
                      goto LABEL_163;
                    }
                  }
                  a1[33] += v74;
                  if (v36 && v36(4, 4, a1, *a1, a1[1], a1[27]) == 2)
                  {
                    int v85 = 89;
                    goto LABEL_163;
                  }
                }
                while (v73);
                v98 += __nbyte;
                off_t v78 = lseek(v105, v98, 3);
                if (v78 == -1)
                {
                  if (*__error() != 6)
                  {
                    int v85 = *__error();
                    syslog(4, "unable to find next hole in file during copy: %m", v90, v91);
                    goto LABEL_163;
                  }
                  goto LABEL_191;
                }
                if (v78 != v98)
                {
                  if (lseek(v105, v98, 0) == -1) {
                    goto LABEL_164;
                  }
                  goto LABEL_155;
                }
                off_t v98 = lseek(v105, v98, 4);
                if (v98 == -1)
                {
                  if (*__error() != 6)
                  {
                    int v85 = *__error();
                    syslog(4, "unable to advance src to next data section: %m", v90, v91);
                    goto LABEL_163;
                  }
                  goto LABEL_191;
                }
                if (lseek(__fd, v98 + v95 - v67, 0) == -1)
                {
                  int v85 = *__error();
                  syslog(4, "unable to advance dst to next data section: %m", v90, v91);
                  goto LABEL_163;
                }
LABEL_155:
                ssize_t __nbyte = read(v105, v72, size);
                if (__nbyte <= 0)
                {
LABEL_191:
                  if ((__nbyte & 0x8000000000000000) == 0)
                  {
                    if (f_bsize % v107) {
                      goto LABEL_180;
                    }
                    if (lseek(v105, v67, 0) == -1 || lseek(__fd, v95, 0) == -1)
                    {
                      int v89 = *__error();
                      syslog(4, "unable to reset file descriptors to punch holes: %m", v90, v91);
                      goto LABEL_204;
                    }
                    do
                    {
                      off_t v86 = lseek(v105, v70 + size, 4);
                      if (v86 == -1)
                      {
                        if (*__error() != 6) {
                          goto LABEL_209;
                        }
                        *(void *)&v111.f_bsize_t size = 0;
                        v111.f_blocks = v70 - v67 + v95;
                        v111.f_bfree = v34 - v70 - v34 % size;
                        if (fcntl(__fd, 99, &v111) == -1)
                        {
                          int v89 = *__error();
                          syslog(4, "unable to punch trailing hole in destination file, offset %lld: %m");
                          goto LABEL_204;
                        }
                        goto LABEL_180;
                      }
                      off_t v87 = v86;
                      *(void *)&v111.f_bsize_t size = 0;
                      v111.f_blocks = v70 - v67 + v95;
                      v111.f_bfree = v86 - v70;
                      if (fcntl(__fd, 99, &v111) == -1)
                      {
                        int v89 = *__error();
                        syslog(4, "unable to punch hole in destination file, offset %lld length %lld: %m");
                        goto LABEL_204;
                      }
                      off_t v88 = lseek(v105, v87, 3);
                      off_t v70 = v88;
                    }
                    while (v88 != -1 && v88 != v34);
                    if (v88 == -1 && *__error() != 6)
                    {
LABEL_209:
                      int v89 = *__error();
                      syslog(4, "lseek during hole punching failed: %m", v90, v91);
LABEL_204:
                      *__error() = v89;
                    }
LABEL_180:
                    int v62 = 0;
                    a1[33] = v94;
LABEL_181:
                    char v79 = 1;
                    if (v72) {
                      goto LABEL_165;
                    }
                    goto LABEL_166;
                  }
                  int v85 = *__error();
                  __error();
                  syslog(4, "error %d reading from %s: %m");
LABEL_163:
                  *__error() = v85;
                  goto LABEL_164;
                }
              }
            }
            int v85 = *__error();
            syslog(4, "failed to set dst to first data section: %m");
          }
        }
        ssize_t v72 = 0;
        goto LABEL_163;
      }
LABEL_157:
      unint64_t v37 = 0;
      goto LABEL_167;
    }
  }
LABEL_71:
  size_t v29 = v101;
  if ((a1[24] & 8) == 0)
  {
    unint64_t v37 = 0;
    *__error() = 45;
    goto LABEL_171;
  }
LABEL_73:
  int v38 = *v5;
  int v39 = *v6;
  v40 = (char *)malloc_type_malloc(v29, 0xF823521CuLL);
  if (!v40) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v37 = v40;
  if (a2) {
    int v41 = (uint64_t *)(a1[22] + 96);
  }
  else {
    int v41 = a1 + 16;
  }
  uint64_t v42 = *v41;
  int v43 = fstat(v39, (stat *)&v111);
  uint64_t v44 = *(void *)&v111.f_mntonname[16] << 9;
  if (v43) {
    uint64_t v44 = 0;
  }
  BOOL v45 = __OFSUB__(v42, v44);
  uint64_t v46 = v42 - v44;
  if (!((v46 < 0) ^ v45 | (v46 == 0)))
  {
    v109[0] = 0x300000000;
    v109[1] = 0;
    uint64_t v110 = v46;
    if (*((_DWORD *)a1 + 69) >= 3u)
    {
      int v47 = *__error();
      syslog(7, "%s:%d:%s() preallocating %lld bytes on destination\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2993, "copyfile_data", v110);
      *__error() = v47;
    }
    fcntl(v39, 42, v109);
  }
  ssize_t v48 = read(v38, v37, v29);
  if (v48 < 1)
  {
    off_t v49 = 0;
LABEL_109:
    if (v48 < 0)
    {
      int v64 = *__error();
      v65 = (const char *)*a1;
      if (!*a1) {
        v65 = "(null src)";
      }
      int v66 = "(rsrc)";
      if (a2) {
        int v66 = (const char *)&unk_20D707699;
      }
      syslog(4, "reading from %s %s: %m", v65, v66);
      *__error() = v64;
      goto LABEL_171;
    }
    int v62 = ftruncate(v39, v49) >> 31;
    goto LABEL_111;
  }
  size_t v102 = v29;
  off_t v49 = 0;
  int __fda = 0;
  if (a2) {
    uint64_t v50 = 5;
  }
  else {
    uint64_t v50 = 4;
  }
  int v51 = v37;
  off_t v97 = v28;
  v108 = v37;
LABEL_89:
  *(void *)int v106 = v49;
  if (v48 >= v28) {
    size_t v52 = v28;
  }
  else {
    size_t v52 = v48;
  }
  while (1)
  {
    ssize_t v53 = write(v39, v51, v52);
    if (v53 != -1)
    {
      ssize_t v56 = v53;
      if (v53)
      {
        int v57 = 0;
        v48 -= v53;
        v51 += v53;
        uint64_t v58 = *(void *)v106;
      }
      else
      {
        int v57 = __fda + 1;
        uint64_t v58 = *(void *)v106;
        if (__fda >= 5)
        {
          int v80 = *__error();
          syslog(4, "writing to output %d times resulted in 0 bytes written: %m", __fda + 1);
          *__error() = v80;
          int v81 = 35;
LABEL_169:
          *((_DWORD *)a1 + 68) = v81;
LABEL_170:
          unint64_t v37 = v108;
          goto LABEL_171;
        }
      }
      int __fda = v57;
      if ((a2 & 1) == 0)
      {
        a1[33] += v53;
        if (v4)
        {
          int v59 = v4(4, 4, a1, *a1, a1[1], a1[27]);
          uint64_t v58 = *(void *)v106;
          if (v59 == 2)
          {
            v82 = __error();
            int v81 = 89;
            int *v82 = 89;
            goto LABEL_169;
          }
        }
      }
      off_t v49 = v56 + v58;
      unint64_t v28 = v97;
      unint64_t v37 = v108;
      if (!v48)
      {
        off_t v60 = v49;
        ssize_t v61 = read(v38, v108, v102);
        off_t v49 = v60;
        ssize_t v48 = v61;
        int __fda = 0;
        int v51 = v108;
        if (v61 < 1) {
          goto LABEL_109;
        }
      }
      goto LABEL_89;
    }
    int v54 = *__error();
    syslog(4, "writing to output file got error: %m");
    *__error() = v54;
    if (!v4) {
      goto LABEL_170;
    }
    uint64_t v55 = v4(v50, 3, a1, *a1, a1[1], a1[27]);
    if (v55 == 1)
    {
      uint64_t v9 = 0;
      unint64_t v37 = v108;
      goto LABEL_173;
    }
    uint64_t v9 = v55;
    if (a2) {
      break;
    }
    if (v55) {
      goto LABEL_170;
    }
    *__error() = 0;
  }
  unint64_t v37 = v108;
  if (!v55) {
    goto LABEL_173;
  }
  if (v55 == 2)
  {
    int v63 = 89;
    goto LABEL_172;
  }
LABEL_171:
  int v63 = *__error();
LABEL_172:
  *((_DWORD *)a1 + 68) = v63;
  uint64_t v9 = 0xFFFFFFFFLL;
LABEL_173:
  free(v37);
  return v9;
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  uint64_t v116 = *MEMORY[0x263EF8C08];
  int v109 = (const char **)state;
  if (!((unint64_t)from | (unint64_t)to))
  {
    *__error() = 22;
    return -1;
  }
  copyfile_flags_t v4 = flags;
  if ((copyfile_preamble((copyfile_state_t *)&v109, flags) & 0x80000000) != 0) {
    return -1;
  }
  int v8 = v109;
  if (from)
  {
    uint64_t v9 = (char *)*v109;
    if (*v109)
    {
      if (!strncmp(from, *v109, 0x400uLL)) {
        goto LABEL_14;
      }
      if (*((_DWORD *)v8 + 69) >= 2u)
      {
        int v10 = *__error();
        syslog(7, "%s:%d:%s() replacing string %s (%s) -> (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1300, "copyfile", "src", from, *v8);
        *__error() = v10;
      }
      int v11 = *((_DWORD *)v8 + 4);
      if ((v11 & 0x80000000) == 0)
      {
        if (*((_DWORD *)v8 + 69) >= 4u)
        {
          int v12 = *__error();
          syslog(7, "%s:%d:%s() closing %s fd: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1300, "copyfile", "src", *((_DWORD *)v8 + 4));
          *__error() = v12;
          int v11 = *((_DWORD *)v8 + 4);
        }
        close(v11);
        *((_DWORD *)v8 + 4) = -2;
      }
      uint64_t v9 = (char *)*v8;
      if (*v8)
      {
LABEL_14:
        free(v9);
        *int v8 = 0;
      }
    }
    int v13 = strdup(from);
    *int v8 = v13;
    if (!v13) {
      return -1;
    }
  }
  if (to)
  {
    v14 = (char *)v8[1];
    if (v14)
    {
      if (!strncmp(to, v8[1], 0x400uLL)) {
        goto LABEL_26;
      }
      if (*((_DWORD *)v8 + 69) >= 2u)
      {
        int v15 = *__error();
        syslog(7, "%s:%d:%s() replacing string %s (%s) -> (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1301, "copyfile", "dst", to, v8[1]);
        *__error() = v15;
      }
      int v16 = *((_DWORD *)v8 + 6);
      if ((v16 & 0x80000000) == 0)
      {
        if (*((_DWORD *)v8 + 69) >= 4u)
        {
          int v17 = *__error();
          syslog(7, "%s:%d:%s() closing %s fd: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1301, "copyfile", "dst", *((_DWORD *)v8 + 6));
          *__error() = v17;
          int v16 = *((_DWORD *)v8 + 6);
        }
        close(v16);
        *((_DWORD *)v8 + 6) = -2;
      }
      v14 = (char *)v8[1];
      if (v14)
      {
LABEL_26:
        free(v14);
        v8[1] = 0;
      }
    }
    unint64_t v18 = strdup(to);
    v8[1] = v18;
    if (!v18) {
      return -1;
    }
  }
  if ((*((unsigned char *)v8 + 194) & 1) == 0 && stat(to, &v111) != -1 && stat(from, &v114) != -1 && statfs(from, &v115) != -1)
  {
    __strlcpy_chk();
    v112[2] = 0;
    v112[0] = 5;
    v112[1] = 0x20000;
    if (getattrlist((const char *)&v113, v112, v110, 0x24uLL, 0) != -1 && v114.st_dev == v111.st_dev)
    {
      if ((v110[4] & 1) == 0 || (v110[20] & 1) == 0)
      {
        unint64_t v19 = realpath_DARWIN_EXTSN(from, 0);
        if (!v19) {
          goto LABEL_46;
        }
        unint64_t v20 = v19;
        BOOL v21 = realpath_DARWIN_EXTSN(to, 0);
        if (!v21) {
          goto LABEL_40;
        }
        unint64_t v22 = v21;
        if (strncasecmp(from, to, 0x400uLL))
        {
          free(v20);
          unint64_t v20 = v22;
LABEL_40:
          free(v20);
          goto LABEL_46;
        }
LABEL_44:
        if ((*((unsigned char *)v8 + 194) & 2) == 0)
        {
LABEL_121:
          int v23 = 0;
          goto LABEL_74;
        }
        BOOL v25 = 0;
        int v26 = 17;
        goto LABEL_99;
      }
      if (v114.st_ino == v111.st_ino) {
        goto LABEL_44;
      }
    }
  }
LABEL_46:
  unsigned int v27 = *((_DWORD *)v8 + 48);
  if ((v27 & 0x8000) == 0)
  {
    if ((v27 & 0x3000000) == 0) {
      goto LABEL_59;
    }
    if (!*((_DWORD *)v8 + 70))
    {
      if (v27) {
        uint32_t v28 = 5;
      }
      else {
        uint32_t v28 = 1;
      }
      if (lstat(*v8, (stat *)&v115) || (v115.f_iosize & 0xD000 | 0x2000) != 0xA000)
      {
        *__error() = 22;
      }
      else if (((*((unsigned char *)v8 + 194) & 0x20) == 0 {
              || (remove((const std::__fs::filesystem::path *)v8[1], v29) & 0x80000000) == 0
      }
              || *__error() == 2)
             && !clonefileat(-2, *v8, -2, v8[1], v28))
      {
        *((_DWORD *)v8 + 49) |= 0x800u;
        if ((*((unsigned char *)v8 + 194) & 0x10) != 0) {
          remove((const std::__fs::filesystem::path *)*v8, v50);
        }
        goto LABEL_121;
      }
      unsigned int v27 = *((_DWORD *)v8 + 48);
    }
    if ((v27 & 0x2000000) == 0)
    {
      unsigned int v27 = v27 & 0xFEF9FFF1 | 0x6000E;
      *((_DWORD *)v8 + 48) = v27;
      int v30 = *((_DWORD *)v8 + 49);
      if ((v30 & 0x4000) == 0) {
        *((_DWORD *)v8 + 49) = v30 | 0x8000;
      }
      copyfile_flags_t v4 = v27;
LABEL_59:
      if ((v4 & 0x10000) != 0)
      {
        *(void *)&v115.f_bsize_t size = 0;
        if (*v8)
        {
          if ((v27 & 4) != 0)
          {
            int v23 = 4 * (listxattr(*v8, 0, 0, (v27 >> 18) & 1) > 0);
            unsigned int v27 = *((_DWORD *)v8 + 48);
          }
          else
          {
            int v23 = 0;
          }
          if (v27)
          {
            int v47 = (void (*)(const char *, const char **, const char *))MEMORY[0x263EF8C20];
            if ((v27 & 0x40000) == 0) {
              int v47 = (void (*)(const char *, const char **, const char *))MEMORY[0x263EF8C30];
            }
            v47(*v8, v8 + 4, v8[23]);
            v23 |= filesec_get_property((filesec_t)v8[23], FILESEC_ACL, &v115) == 0;
          }
          if (*((_DWORD *)v8 + 69) >= 2u)
          {
            int v48 = *__error();
            syslog(7, "%s:%d:%s() check result: %d (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2399, "copyfile_check", v23, *v8);
            *__error() = v48;
          }
          if (*(void *)&v115.f_bsize) {
            acl_free(*(void **)&v115.f_bsize);
          }
          if (v8[28])
          {
            if (((_BYTE)v8[24] & 4) != 0) {
              int v49 = 4;
            }
            else {
              int v49 = 1;
            }
            v23 |= v49;
          }
        }
        else
        {
          *((_DWORD *)v8 + 68) = 22;
          int v23 = -1;
        }
        goto LABEL_73;
      }
      int v32 = (filesec_t *)(v8 + 29);
      uint64_t v31 = (_filesec *)v8[29];
      if (v31)
      {
        filesec_free(v31);
        *int v32 = 0;
      }
      filesec_t v33 = filesec_init();
      *int v32 = v33;
      if (v33)
      {
        if ((*((unsigned char *)v8 + 194) & 8) != 0 && !lstat(v8[1], (stat *)&v115) && (v115.f_iosize & 0xF000) == 0xA000)
        {
          size_t v35 = (char *)v8[30];
          if (v35) {
            free(v35);
          }
          goto LABEL_131;
        }
        if (statx_np(v8[1], (stat *)&v115, (filesec_t)v8[29]))
        {
          BOOL v25 = *__error() == 2;
LABEL_132:
          if ((copyfile_open(v8, v34) & 0x80000000) == 0)
          {
            fcntl(*((_DWORD *)v8 + 4), 48, 1);
            fcntl(*((_DWORD *)v8 + 6), 48, 1);
            fcntl(*((_DWORD *)v8 + 6), 76, 1);
            int v54 = copyfile_internal(v8, v4);
            if (v54 != -1)
            {
              int v23 = v54;
              if (((v25 | ((v4 & 2) >> 1)) & 1) == 0)
              {
                fchown(*((_DWORD *)v8 + 6), v115.f_bfree, HIDWORD(v115.f_bfree));
                fchmod(*((_DWORD *)v8 + 6), v115.f_iosize);
              }
              reset_security((uint64_t)v8);
              if ((v4 & 0x100000) != 0 && *v8) {
                remove((const std::__fs::filesystem::path *)*v8, v55);
              }
              goto LABEL_73;
            }
          }
          goto LABEL_139;
        }
        fixed = copyfile_fix_perms((filesec_t *)v8 + 29);
        v8[30] = (const char *)fixed;
        if (fixed)
        {
          if ((chmodx_np(v8[1], fixed) & 0x80000000) == 0)
          {
            BOOL v25 = 0;
            *((_DWORD *)v8 + 49) |= 0x1000u;
            goto LABEL_132;
          }
          if (*__error() != 45)
          {
            int v53 = *__error();
            syslog(4, "setting security information: %m");
            *__error() = v53;
            filesec_free((filesec_t)v8[30]);
LABEL_131:
            BOOL v25 = 0;
            v8[30] = 0;
            goto LABEL_132;
          }
        }
        BOOL v25 = 0;
        goto LABEL_132;
      }
      goto LABEL_94;
    }
    if (*((_DWORD *)v8 + 68))
    {
LABEL_94:
      BOOL v25 = 0;
      goto LABEL_139;
    }
    BOOL v25 = 0;
    int v26 = 45;
LABEL_99:
    *((_DWORD *)v8 + 68) = v26;
LABEL_139:
    if (!v25 && (*((_DWORD *)v8 + 49) & 0x1000) != 0)
    {
      int v56 = *__error();
      chown(v8[1], v115.f_bfree, HIDWORD(v115.f_bfree));
      chmod(v8[1], v115.f_iosize);
      *__error() = v56;
    }
    int v57 = *((_DWORD *)v8 + 68);
    if (v57)
    {
      *__error() = v57;
      *((_DWORD *)v8 + 68) = 0;
    }
    int v23 = -1;
    goto LABEL_145;
  }
  v114.st_ino = 0;
  *(void *)&v114.st_dev = 0;
  if ((v27 & 0x2F10000) != 0
    || (v38 = *((_DWORD *)v8 + 8), int v39 = (std::__fs::filesystem::path *)*v8, (*(void *)&v114.st_dev = v39) == 0)
    || (v40 = v8[1]) == 0)
  {
    *__error() = 22;
    goto LABEL_70;
  }
  int v41 = (unsigned int (*)(std::__fs::filesystem::path *, statfs *))MEMORY[0x263EF8C58];
  if ((v27 & 0x40000) == 0) {
    int v41 = (unsigned int (*)(std::__fs::filesystem::path *, statfs *))MEMORY[0x263EF8C68];
  }
  if (v41(v39, &v115) == -1) {
    goto LABEL_70;
  }
  BOOL v42 = 0;
  if (((MEMORY[0x263EF8C58] != MEMORY[0x263EF8C68]) & (v27 >> 18)) == 0 && (v115.f_iosize & 0xF000) == 0x4000)
  {
    int v43 = lstat((const char *)v39, &v113);
    BOOL v42 = (v113.st_mode & 0xF000) == 40960;
    if (v43 == -1) {
      goto LABEL_70;
    }
  }
  uint64_t v44 = (unsigned int (*)(const char *, statfs *))MEMORY[0x263EF8C58];
  if ((v27 & 0x80000) == 0) {
    uint64_t v44 = (unsigned int (*)(const char *, statfs *))MEMORY[0x263EF8C68];
  }
  if (v44(v40, &v115) == -1)
  {
    if (*__error() == 2 && basename((char *)v39)) {
      goto LABEL_127;
    }
LABEL_70:
    int v23 = -1;
    goto LABEL_71;
  }
  f_iosize_t size = v115.f_iosize;
  if (!basename((char *)v39)) {
    goto LABEL_70;
  }
  if ((f_iosize & 0xF000) != 0x4000)
  {
LABEL_127:
    BOOL v100 = v42;
    __s1 = (char *)v39;
    size_t v104 = strlen((const char *)v39);
    size_t v52 = (const char *)&unk_20D707699;
    goto LABEL_152;
  }
  uint64_t v46 = strrchr((char *)v39, 47);
  __s1 = (char *)v39;
  BOOL v100 = v42;
  if (v46) {
    size_t v104 = v46 - (char *)v39 + 1;
  }
  else {
    size_t v104 = 0;
  }
  size_t v52 = "/";
LABEL_152:
  size_t v102 = v40;
  int v103 = v52;
  uint64_t v62 = 0;
  int v63 = 0;
  if ((*((_WORD *)v8 + 97) & 0x104) != 0) {
    int v64 = 20;
  }
  else {
    int v64 = 21;
  }
  int v105 = (*((_DWORD *)v8 + 49) >> 7) & 0x40 | v64;
  int v106 = (uint64_t (*)(void))v8[26];
  int flagsa = v27 & 0xC0000 | 2;
  char v65 = 1;
LABEL_156:
  char v66 = v65;
  if ((v65 & 1) == 0 && (v62 & 1) == 0)
  {
LABEL_217:
    int v23 = 0;
    goto LABEL_223;
  }
  if (v63) {
    fts_close(v63);
  }
  int v63 = fts_open((char *const *)&v114, v105, 0);
  while (2)
  {
    uint64_t v67 = v62;
    do
    {
      while (1)
      {
        unint64_t v68 = fts_read(v63);
        if (!v68)
        {
          char v65 = 0;
          uint64_t v62 = v67;
          if ((v66 & 1) == 0) {
            goto LABEL_217;
          }
          goto LABEL_156;
        }
        off_t v69 = v68;
        if ((v68->fts_info & 0xFFFE) == 0xC) {
          break;
        }
        if (v66)
        {
          unsigned int v108 = v67;
          goto LABEL_168;
        }
      }
      uint64_t v67 = 1;
    }
    while ((v66 & 1) != 0);
    unsigned int v108 = v62;
LABEL_168:
    *(void *)&v113.st_dev = 0;
    copyfile_state_t v70 = copyfile_state_alloc();
    if (!v70) {
      goto LABEL_219;
    }
    copyfile_state_t v71 = v70;
    *((_OWORD *)v70 + 13) = *((_OWORD *)v8 + 13);
    if (*((unsigned char *)v8 + 198)) {
      *((_DWORD *)v70 + 49) |= 0x10000u;
    }
    dev_t fts_dev = v69->fts_dev;
    if (v38 == fts_dev)
    {
      *((_DWORD *)v70 + 49) |= *((_DWORD *)v8 + 49) & 0x78;
      dev_t fts_dev = v38;
    }
    asprintf((char **)&v113, "%s%s%s", v40, v103, &v69->fts_path[v104]);
    size_t v73 = *(const char **)&v113.st_dev;
    if (*(void *)&v113.st_dev)
    {
      dev_t v107 = fts_dev;
      *((void *)v71 + 32) = v69;
      int v74 = *((_DWORD *)v71 + 49);
      *((_DWORD *)v71 + 49) = v74 | 0x20000;
      int v75 = 0;
      int v76 = 1;
      switch(v69->fts_info)
      {
        case 1u:
          *((_DWORD *)v71 + 49) = v74 | 0x20001;
          if (v100 && !strcmp(__s1, v69->fts_path)) {
            *((_DWORD *)v71 + 49) = v74 | 0x60001;
          }
          int v75 = 1;
          int v76 = 2;
          goto LABEL_175;
        case 3u:
        case 8u:
        case 0xCu:
        case 0xDu:
LABEL_175:
          fts_path = v69->fts_path;
          off_t v78 = v106;
          unsigned int v101 = v76;
          if (!v106) {
            goto LABEL_179;
          }
          int v79 = v106();
          if (v79 == 1)
          {
            if (!v75 || fts_set(v63, v69, 4) != -1) {
              goto LABEL_211;
            }
            int v85 = v69->fts_path;
            uint64_t v86 = *(void *)&v113.st_dev;
            off_t v87 = v8[27];
            uint64_t v88 = 0;
          }
          else
          {
            if (v79 == 2) {
              goto LABEL_220;
            }
            fts_path = v69->fts_path;
            size_t v73 = *(const char **)&v113.st_dev;
            off_t v78 = v106;
LABEL_179:
            if (v75) {
              int v80 = 1225654285;
            }
            else {
              int v80 = 1225654287;
            }
            if ((copyfile(fts_path, v73, v71, v80 & v27) & 0x80000000) == 0)
            {
              uint64_t v81 = v101;
              if (!v78) {
                goto LABEL_211;
              }
              v82 = v69->fts_path;
              uint64_t v83 = *(void *)&v113.st_dev;
              int v84 = v8[27];
LABEL_185:
              if (((unsigned int (*)(uint64_t, uint64_t, copyfile_state_t, char *, uint64_t, const char *))v106)(v81, 2, v71, v82, v83, v84) == 2)goto LABEL_220; {
LABEL_211:
              }
              unsigned int v95 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
              *((_DWORD *)v8 + 49) = v95;
              *((_DWORD *)v8 + 49) = *((_DWORD *)v71 + 49) & 0x78 | v95;
              copyfile_state_free(v71);
              free(*(void **)&v113.st_dev);
LABEL_212:
              dev_t v38 = v107;
              uint64_t v62 = v108;
              v40 = v102;
              continue;
            }
            uint64_t v88 = v101;
            if (!v78) {
              goto LABEL_221;
            }
            int v85 = v69->fts_path;
            uint64_t v86 = *(void *)&v113.st_dev;
            off_t v87 = v8[27];
          }
          unsigned int v89 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, char *, uint64_t, const char *))v106)(v88, 3, v71, v85, v86, v87);
LABEL_200:
          unsigned int v91 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
          *((_DWORD *)v8 + 49) = v91;
          *((_DWORD *)v8 + 49) = *((_DWORD *)v71 + 49) & 0x78 | v91;
          copyfile_state_free(v71);
          free(*(void **)&v113.st_dev);
          if (v89 == 2) {
            goto LABEL_222;
          }
          goto LABEL_212;
        case 5u:
          goto LABEL_211;
        case 6u:
          int v92 = v69->fts_path;
          if (v100 && !strcmp(__s1, v69->fts_path)) {
            *((_DWORD *)v71 + 49) = v74 | 0x60000;
          }
          if (v106)
          {
            int v93 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, const char *, const char *, const char *))v106)(3, 1, v71, v92, v73, v8[27]);
            if (v93 == 1) {
              goto LABEL_211;
            }
            if (v93 == 2)
            {
LABEL_220:
              *__error() = 0;
LABEL_221:
              unsigned int v97 = *((_DWORD *)v8 + 49) & 0xFFFFFF87;
              *((_DWORD *)v8 + 49) = v97;
              *((_DWORD *)v8 + 49) = *((_DWORD *)v71 + 49) & 0x78 | v97;
              copyfile_state_free(v71);
              free(*(void **)&v113.st_dev);
              goto LABEL_222;
            }
            int v94 = copyfile(v69->fts_path, *(const char **)&v113.st_dev, v71, flagsa);
            v82 = v69->fts_path;
            uint64_t v83 = *(void *)&v113.st_dev;
            int v84 = v8[27];
            if ((v94 & 0x80000000) == 0)
            {
              uint64_t v81 = 3;
              goto LABEL_185;
            }
            int v96 = ((uint64_t (*)(uint64_t, uint64_t, copyfile_state_t, char *, void, const char *))v106)(3, 3, v71, v82, *(void *)&v113.st_dev, v84);
            if (v96)
            {
              if (v96 == 2) {
                goto LABEL_221;
              }
            }
            else
            {
LABEL_199:
              *__error() = 0;
            }
          }
          else if (copyfile(v92, v73, v71, flagsa) < 0)
          {
            goto LABEL_221;
          }
          goto LABEL_211;
        default:
          int fts_errno = v69->fts_errno;
          *__error() = fts_errno;
          if (!v106) {
            goto LABEL_221;
          }
          unsigned int v89 = ((uint64_t (*)(void, uint64_t, copyfile_state_t, char *, void, const char *))v106)(0, 3, v71, v69->fts_path, *(void *)&v113.st_dev, v8[27]);
          if (v89 < 2) {
            goto LABEL_199;
          }
          goto LABEL_200;
      }
    }
    break;
  }
  copyfile_state_free(v71);
LABEL_219:
  *__error() = 12;
LABEL_222:
  int v23 = -1;
LABEL_223:
  if (v63) {
    fts_close(v63);
  }
LABEL_71:
  if (*((_DWORD *)v8 + 69))
  {
    int v36 = *__error();
    unint64_t v37 = __error();
    syslog(7, "%s:%d:%s() returning: %d errno %d\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1003, "copytree", v23, *v37);
    *__error() = v36;
  }
LABEL_73:
  if ((v23 & 0x80000000) == 0) {
LABEL_74:
  }
    *__error() = 0;
LABEL_145:
  uint64_t v58 = (_copyfile_state *)v109;
  if (v109 && *((_DWORD *)v109 + 69) >= 5u)
  {
    int v59 = *__error();
    off_t v60 = __error();
    syslog(7, "%s:%d:%s() returning %d errno %d\n\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1446, "copyfile", v23, *v60);
    *__error() = v59;
  }
  if (!state)
  {
    int v61 = *__error();
    copyfile_state_free(v58);
    *__error() = v61;
  }
  return v23;
}

int copyfile_state_free(copyfile_state_t a1)
{
  if (!a1) {
    return 0;
  }
  __int16 v2 = (_filesec *)*((void *)a1 + 23);
  if (v2) {
    filesec_free(v2);
  }
  mode_t v3 = (_filesec *)*((void *)a1 + 29);
  if (v3) {
    filesec_free(v3);
  }
  copyfile_flags_t v4 = (_filesec *)*((void *)a1 + 30);
  if (v4) {
    filesec_free(v4);
  }
  if (*(void *)a1)
  {
    int v5 = *((_DWORD *)a1 + 4);
    if (v5 < 0 || (close(v5), *(void *)a1))
    {
      int v6 = *((_DWORD *)a1 + 5);
      if ((v6 & 0x80000000) == 0) {
        close(v6);
      }
    }
  }
  if (!*((void *)a1 + 1)) {
    goto LABEL_25;
  }
  int v7 = *((_DWORD *)a1 + 6);
  if (v7 < 0)
  {
    int v8 = 0;
  }
  else
  {
    if (close(v7)) {
      int v8 = -1;
    }
    else {
      int v8 = 0;
    }
    if (!*((void *)a1 + 1)) {
      goto LABEL_24;
    }
  }
  int v10 = *((_DWORD *)a1 + 7);
  if ((v10 & 0x80000000) == 0 && close(v10)) {
    goto LABEL_26;
  }
LABEL_24:
  if (v8 < 0)
  {
LABEL_26:
    int v11 = *__error();
    syslog(4, "error closing files: %m");
    *__error() = v11;
    int v9 = -1;
    goto LABEL_27;
  }
LABEL_25:
  int v9 = 0;
LABEL_27:
  int v12 = (void *)*((void *)a1 + 31);
  if (v12) {
    free(v12);
  }
  int v13 = (void *)*((void *)a1 + 22);
  if (v13) {
    free(v13);
  }
  v14 = (void *)*((void *)a1 + 1);
  if (v14) {
    free(v14);
  }
  if (*(void *)a1) {
    free(*(void **)a1);
  }
  free(a1);
  return v9;
}

uint64_t copyfile_preamble(copyfile_state_t *a1, int a2)
{
  copyfile_state_t v3 = *a1;
  if (!*a1)
  {
    copyfile_state_t v3 = copyfile_state_alloc();
    *a1 = v3;
    if (!v3) {
      return 0xFFFFFFFFLL;
    }
  }
  if (a2 < 0)
  {
    int v5 = getenv("COPYFILE_DEBUG");
    if (v5)
    {
      int v6 = v5;
      *__error() = 0;
      int v7 = strtol(v6, 0, 0);
      *((_DWORD *)v3 + 69) = v7;
      if (!v7)
      {
        if (*__error()) {
          *((_DWORD *)v3 + 69) = 1;
        }
      }
    }
    if (*((_DWORD *)v3 + 69) >= 2u)
    {
      int v8 = *__error();
      syslog(7, "%s:%d:%s() debug value set to: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1507, "copyfile_preamble", *((_DWORD *)v3 + 69));
      *__error() = v8;
    }
  }
  if (*((_DWORD *)v3 + 69) >= 2u)
  {
    int v9 = *__error();
    syslog(7, "%s:%d:%s() setting flags: %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1518, "copyfile_preamble", *((_DWORD *)v3 + 48));
    *__error() = v9;
  }
  uint64_t result = 0;
  *((_DWORD *)v3 + 48) = a2;
  return result;
}

copyfile_state_t copyfile_state_alloc(void)
{
  v0 = (_filesec **)malloc_type_calloc(1uLL, 0x128uLL, 0x10B0040A2ED8E21uLL);
  v1 = (_copyfile_state *)v0;
  if (v0)
  {
    *(void *)&long long v2 = 0x100000001;
    *((void *)&v2 + 1) = 0x100000001;
    *((_OWORD *)v0 + 1) = v2;
    copyfile_state_t v3 = v0[23];
    if (v3)
    {
      filesec_free(v3);
      *((void *)v1 + 23) = 0;
    }
    *((void *)v1 + 23) = filesec_init();
  }
  else
  {
    *__error() = 12;
  }
  return v1;
}

void reset_security(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8C08];
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 0x80000000) == 0)
  {
    int v3 = *(_DWORD *)(a1 + 16);
    if (v3 < 0 || (*(unsigned char *)(a1 + 192) & 2) == 0) {
      int v3 = v1;
    }
    fstat(v3, &v11);
    if ((*(unsigned char *)(a1 + 196) & 1) == 0)
    {
      int v4 = *(_DWORD *)(a1 + 24);
      v14 = 0;
      int v5 = filesec_init();
      if (!v5) {
        goto LABEL_9;
      }
      if (fstatx_np(v4, &v12, v5))
      {
        if (*__error() != 45)
        {
LABEL_10:
          if (v14) {
            acl_free(v14);
          }
          if (v5) {
            filesec_free(v5);
          }
          return;
        }
LABEL_9:
        fchmod(v4, v11.st_mode & 0xFFF);
        goto LABEL_10;
      }
      if (filesec_get_property(v5, FILESEC_ACL, &v14) || acl_get_entry((acl_t)v14, 0, &entry_p)) {
        goto LABEL_10;
      }
      int v6 = entry_p;
      uid_t v7 = geteuid();
      mbr_uid_to_uuid(v7, uu);
      qualifier = acl_get_qualifier(v6);
      acl_t v17 = acl_init(1);
      if (v17)
      {
        add_uberace(&v17);
        BOOL v9 = 0;
        if (acl_get_entry(v17, 0, &v16)) {
          goto LABEL_25;
        }
        acl_get_permset(v16, &permset_p);
        acl_get_tag_type(v6, &tag_type_p);
        acl_get_permset(v6, &v19);
        if (tag_type_p == ACL_EXTENDED_ALLOW && *qualifier == *(void *)uu && qualifier[1] == *(void *)&uu[8])
        {
          BOOL v9 = *(_DWORD *)permset_p == *(_DWORD *)v19;
          if (!qualifier)
          {
LABEL_27:
            if (v17) {
              acl_free(v17);
            }
            if (!v9) {
              goto LABEL_10;
            }
            *(_WORD *)uuid_t uu = v11.st_mode & 0xFFF;
            if (!acl_delete_entry((acl_t)v14, entry_p)
              && !filesec_set_property(v5, FILESEC_ACL, &v14)
              && !filesec_set_property(v5, FILESEC_MODE, uu)
              && !fchmodx_np(v4, v5))
            {
              goto LABEL_10;
            }
            goto LABEL_9;
          }
LABEL_26:
          acl_free(qualifier);
          goto LABEL_27;
        }
      }
      BOOL v9 = 0;
LABEL_25:
      if (!qualifier) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
}

uint64_t copyfile_open(const char **a1, std::error_code *a2)
{
  uint64_t v80 = *MEMORY[0x263EF8C08];
  if (!*a1 || *((_DWORD *)a1 + 4) != -2)
  {
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    goto LABEL_9;
  }
  int v3 = (unsigned int (*)(void))MEMORY[0x263EF8C20];
  if ((a1[24] & 0x40000) == 0) {
    int v3 = (unsigned int (*)(void))MEMORY[0x263EF8C30];
  }
  if (!v3())
  {
    int v13 = *((_WORD *)a1 + 18) & 0xF000;
    switch(v13)
    {
      case 16384:
        int v5 = 0;
        char v14 = 1;
        int v15 = 1;
        break;
      case 40960:
        int v15 = 0;
        int v5 = 0;
        unsigned int v37 = *((_DWORD *)a1 + 48);
        int v36 = 0x200000;
        int v35 = 1;
        char v14 = 1;
        int v38 = 0x200000;
LABEL_64:
        if ((v37 & 0x400000) != 0) {
          int v39 = v38;
        }
        else {
          int v39 = v36;
        }
        if ((v37 & 0x400000) != 0) {
          int v6 = 0;
        }
        else {
          int v6 = v15;
        }
        if ((v37 & 0x400000) != 0) {
          int v7 = 0;
        }
        else {
          int v7 = v35;
        }
        int v40 = open(*a1, v39, 0);
        *((_DWORD *)a1 + 4) = v40;
        if (v40 < 0)
        {
          int v4 = *__error();
LABEL_148:
          syslog(4, "open on %s: %m");
          goto LABEL_7;
        }
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v41 = *__error();
          syslog(7, "%s:%d:%s() open successful on source (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1946, "copyfile_open", *a1);
          *__error() = v41;
        }
        int v42 = *((_DWORD *)a1 + 49);
        *((_DWORD *)a1 + 49) = v42 | 0x80;
        if ((v42 & 0x20000) != 0)
        {
          if (!a1[32])
          {
            *__error() = 2;
            *((_DWORD *)a1 + 68) = 2;
            int v34 = *__error();
            syslog(4, "missing FTS entry during recursive copy\n: %m");
            goto LABEL_134;
          }
          if (!lstat(*a1, &v78))
          {
            __int16 v61 = 0;
            unsigned int v62 = *((unsigned __int16 *)a1[32] + 44);
            if (v62 > 0xB)
            {
              if (v62 - 12 <= 1) {
                __int16 v61 = -24576;
              }
            }
            else if (v62 == 1 || v62 == 6)
            {
              __int16 v61 = 0x4000;
            }
            else if (v62 == 8)
            {
              __int16 v61 = 0x8000;
            }
            if ((*((unsigned char *)a1 + 198) & 4) != 0) {
              unsigned __int16 v45 = -24576;
            }
            else {
              unsigned __int16 v45 = v61;
            }
LABEL_176:
            if ((v78.st_mode & 0xF000) != v45)
            {
              *__error() = 9;
              *((_DWORD *)a1 + 68) = 9;
              int v4 = *__error();
              syslog(4, "file type (%u) does not match expected %u on %s\n: %m");
              goto LABEL_7;
            }
            if (!a1[28]) {
              a1[28] = 0;
            }
            if ((v14 & 1) == 0)
            {
              unsigned int v67 = *((_DWORD *)a1 + 48);
              if ((v67 & 4) != 0)
              {
                if ((v67 & 8) != 0 && (*((unsigned char *)a1 + 148) & 0x20) != 0)
                {
                  int v68 = 32 * doesdecmpfs(*((_DWORD *)a1 + 4));
                  unsigned int v67 = *((_DWORD *)a1 + 48);
                }
                else
                {
                  int v68 = 0;
                }
                ssize_t v70 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0, 0, 0, (v67 >> 18) & 1 | v68);
                *__error() = 0;
                if (v70 > 0x100000)
                {
                  if (*((_DWORD *)a1 + 69) >= 2u)
                  {
                    int v71 = *__error();
                    syslog(7, "%s:%d:%s() %s has large resource fork, will use namedfork to copy\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2057, "copyfile_open", *a1);
                    *__error() = v71;
                  }
                  snprintf((char *)&v79, 0x400uLL, "%s%s", *a1, "/..namedfork/rsrc");
                  ssize_t v72 = (const char *)malloc_type_malloc(0x90uLL, 0x1000040B72DA15FuLL);
                  a1[22] = v72;
                  if (!v72) {
                    goto LABEL_197;
                  }
                  size_t v73 = (unsigned int (*)(statfs *, const char *))MEMORY[0x263EF8C58];
                  if ((a1[24] & 0x40000) == 0) {
                    size_t v73 = (unsigned int (*)(statfs *, const char *))MEMORY[0x263EF8C68];
                  }
                  if (v73(&v79, v72))
                  {
                    int v74 = *__error();
                    syslog(4, "stat on %s: %m", (const char *)&v79);
                    *__error() = v74;
                    free((void *)a1[22]);
                    a1[22] = 0;
LABEL_197:
                    int v75 = *__error();
                    syslog(4, "malloc/stat/open on %s: %m", (const char *)&v79);
                    *__error() = v75;
                    *__error() = 0;
                    goto LABEL_9;
                  }
                  if (!a1[22]) {
                    goto LABEL_197;
                  }
                  int v76 = open((const char *)&v79, v39, 0);
                  *((_DWORD *)a1 + 5) = v76;
                  if (v76 < 0) {
                    goto LABEL_197;
                  }
                  if (*((_DWORD *)a1 + 69) >= 2u)
                  {
                    int v77 = *__error();
                    syslog(7, "%s:%d:%s() open successful on source rsrc (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2085, "copyfile_open", (const char *)&v79);
                    *__error() = v77;
                  }
                  *((_DWORD *)a1 + 49) |= 0x400u;
                }
              }
            }
LABEL_9:
            int v8 = (const std::__fs::filesystem::path *)a1[1];
            if (!v8 || *((_DWORD *)a1 + 6) != -2) {
              goto LABEL_153;
            }
            int v9 = *((_DWORD *)a1 + 48);
            if ((v9 & 0x800000) != 0) {
              int v10 = 2560;
            }
            else {
              int v10 = ((v9 & 0x8000008) != 0) | 0xA00;
            }
            if ((v9 & 0x400000) != 0) {
              int v11 = 2561;
            }
            else {
              int v11 = v10;
            }
            if ((v9 & 0x200000) != 0 && remove(v8, a2) < 0 && *__error() != 2)
            {
              int v4 = *__error();
              syslog(4, "%s: remove: %m");
              goto LABEL_7;
            }
            if ((*((unsigned char *)a1 + 194) & 8) != 0)
            {
              int v16 = lstat(a1[1], (stat *)&v79);
              if ((v79.f_iosize & 0xF000) == 0xA000) {
                int v17 = 0x200000;
              }
              else {
                int v17 = 256;
              }
              if (v16 == -1) {
                int v12 = 256;
              }
              else {
                int v12 = v17;
              }
            }
            else
            {
              int v12 = 0;
            }
            int v18 = *((_DWORD *)a1 + 49);
            if ((v18 & 8) == 0)
            {
              int v19 = fstatfs(*((_DWORD *)a1 + 4), &v79);
              if (v19 == -1 || (v79.f_flags & 0x80) == 0)
              {
                if (v19 == -1) {
                  goto LABEL_122;
                }
                int v20 = *((_DWORD *)a1 + 49);
              }
              else
              {
                int v20 = *((_DWORD *)a1 + 49) | 0x10;
              }
              int v18 = v20 | 8;
              *((_DWORD *)a1 + 49) = v18;
            }
            uint64_t v21 = 0xFFFFFFFFLL;
            int v22 = v6 | v5;
            if (v6 | v5)
            {
              if ((v18 & 0x210) == 0x10)
              {
                uint64_t v21 = fcntl(*((_DWORD *)a1 + 4), 63);
                if ((v21 & 0x80000000) != 0)
                {
                  int v4 = *__error();
                  __error();
                  syslog(4, "GET_PROT_CLASS failed on (%s) with error <%d>: %m");
                  goto LABEL_7;
                }
              }
            }
            if (v7)
            {
              size_t v23 = (size_t)a1[16];
              v24 = (char *)malloc_type_calloc(1uLL, v23 + 1, 0x993BDDDDuLL);
              if (v24)
              {
                BOOL v25 = v24;
                if (readlink(*a1, v24, v23) == -1)
                {
                  int v47 = *__error();
                  syslog(4, "cannot readlink %s: %m");
LABEL_126:
                  *__error() = v47;
                  free(v25);
                  return 0xFFFFFFFFLL;
                }
                if (symlink(v25, a1[1]) == -1 && (*__error() != 17 || (*((unsigned char *)a1 + 194) & 2) != 0))
                {
                  int v47 = *__error();
                  syslog(4, "Cannot make symlink %s: %m");
                  goto LABEL_126;
                }
                free(v25);
                int v26 = open(a1[1], 0x200000);
                *((_DWORD *)a1 + 6) = v26;
                if (v26 == -1)
                {
                  int v4 = *__error();
                  syslog(4, "Cannot open symlink %s for reading: %m");
                  goto LABEL_7;
                }
                int i = 0;
                goto LABEL_52;
              }
              int v34 = *__error();
              syslog(4, "cannot allocate %zd bytes: %m");
LABEL_134:
              *__error() = v34;
              return 0xFFFFFFFFLL;
            }
            if (!v6)
            {
              for (int i = 0; ; int i = 1)
              {
                unsigned int v48 = v11 & 0xFFFFF9FE;
                while (1)
                {
                  while (1)
                  {
                    int v49 = a1[1];
                    uint64_t v50 = *((unsigned __int16 *)a1 + 18) | 0x80u;
                    if ((statfs(v49, &v79) != -1
                       || *__error() == 2 && dirname_r(v49, (char *)&v78) && statfs((const char *)&v78, &v79) != -1)
                      && (v79.f_flags & 0x80) != 0)
                    {
                      int v51 = open_dprotected_np(v49, v11 | v12, v21, 0, v50);
                    }
                    else
                    {
                      int v51 = open(v49, v11 | v12, v50);
                    }
                    *((_DWORD *)a1 + 6) = v51;
                    if ((v51 & 0x80000000) == 0) {
                      goto LABEL_52;
                    }
                    int v52 = *__error();
                    if (v52 != 13) {
                      break;
                    }
                    if (chmod(a1[1], *((_WORD *)a1 + 18) & 0xF7F | 0x80))
                    {
                      if (*__error() == 2) {
                        *__error() = 13;
                      }
LABEL_147:
                      int v4 = *__error();
                      goto LABEL_148;
                    }
                    *((_DWORD *)a1 + 49) |= 0x1000u;
                  }
                  if (v52 != 21) {
                    break;
                  }
                  if (*((_DWORD *)a1 + 69) >= 3u)
                  {
                    int v53 = *__error();
                    syslog(7, "%s:%d:%s() open failed because it is a directory (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2274, "copyfile_open", a1[1]);
                    *__error() = v53;
                  }
                  int v54 = *((_DWORD *)a1 + 48);
                  if ((v54 & 0x20000) != 0)
                  {
                    int v11 = v48;
                    if ((v54 & 0x800000) == 0) {
                      goto LABEL_147;
                    }
                  }
                  else
                  {
                    int v11 = v48;
                    if ((v54 & 0x800008) == 8) {
                      goto LABEL_147;
                    }
                  }
                }
                if (v52 != 17) {
                  goto LABEL_147;
                }
                if (*((_DWORD *)a1 + 69) >= 3u)
                {
                  int v55 = *__error();
                  syslog(7, "%s:%d:%s() open failed, retrying (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2241, "copyfile_open", a1[1]);
                  *__error() = v55;
                }
                int v56 = *((_DWORD *)a1 + 48);
                if ((v56 & 0x20000) != 0) {
                  goto LABEL_147;
                }
                v11 &= ~0x200u;
                if ((v56 & 0x400008) != 0)
                {
                  if (*((_DWORD *)a1 + 69) >= 4u)
                  {
                    int v57 = *__error();
                    syslog(7, "%s:%d:%s() truncating existing file (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2251, "copyfile_open", a1[1]);
                    *__error() = v57;
                  }
                  v11 |= 0x400u;
                }
              }
            }
            if (mkdir(a1[1], *((_WORD *)a1 + 18) & 0xE3F | 0x1C0) == -1)
            {
              if (*__error() != 17 || (*((unsigned char *)a1 + 194) & 2) != 0)
              {
                int v4 = *__error();
                syslog(4, "Cannot make directory %s: %m");
                goto LABEL_7;
              }
              if (*((unsigned char *)a1 + 198))
              {
                if (lstat(a1[1], (stat *)&v79) == -1)
                {
                  off_t v60 = "Cannot lstat destination %s: %m";
                  goto LABEL_187;
                }
                if ((v79.f_iosize & 0xF000) == 0xA000)
                {
                  *__error() = 9;
                  *((_DWORD *)a1 + 68) = 9;
                  off_t v60 = "Destination %s already exists as a symlink, refusing to copy: %m";
LABEL_187:
                  int v69 = *__error();
                  syslog(4, v60, a1[1]);
                  *__error() = v69;
                  return 0xFFFFFFFFLL;
                }
              }
            }
            int v28 = open(a1[1], v12);
            *((_DWORD *)a1 + 6) = v28;
            if (v28 == -1)
            {
              int v4 = *__error();
              syslog(4, "Cannot open directory %s for reading: %m");
              goto LABEL_7;
            }
            int i = 1;
LABEL_52:
            if (*((_DWORD *)a1 + 69) >= 2u)
            {
              int v29 = *__error();
              syslog(7, "%s:%d:%s() open successful on destination (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2285, "copyfile_open", a1[1]);
              *__error() = v29;
            }
            int v30 = *((_DWORD *)a1 + 49);
            LOWORD(v31) = v30 | 0x100;
            *((_DWORD *)a1 + 49) = v30 | 0x100;
            if ((v30 & 0x10) == 0) {
              goto LABEL_55;
            }
            if ((v30 & 0x20) != 0)
            {
LABEL_164:
              if (v22 && i && (v31 & 0x240) == 0x40)
              {
                if (fcntl(*((_DWORD *)a1 + 6), 64, v21))
                {
                  int v4 = *__error();
                  __error();
                  syslog(4, "SET_PROT_CLASS failed on (%s) with error <%d>: %m");
                  goto LABEL_7;
                }
                int v31 = *((_DWORD *)a1 + 49);
              }
LABEL_55:
              if ((v31 & 0x400) == 0) {
                goto LABEL_153;
              }
              snprintf((char *)&v79, 0x400uLL, "%s%s", a1[1], "/..namedfork/rsrc");
              int v32 = open((const char *)&v79, 1537, *((unsigned __int16 *)a1 + 18) | 0x80u);
              *((_DWORD *)a1 + 7) = v32;
              if (v32 == -1)
              {
                int v63 = *__error();
                syslog(4, "open on %s: %m", (const char *)&v79);
                *__error() = v63;
                free((void *)a1[22]);
                a1[22] = 0;
                if (close(*((_DWORD *)a1 + 5)))
                {
                  int v64 = *__error();
                  syslog(4, "error closing source rsrc file descriptor: %m");
                  *__error() = v64;
                }
                int v33 = 0;
                *((_DWORD *)a1 + 5) = -1;
                *((_DWORD *)a1 + 49) &= ~0x400u;
              }
              else
              {
                if (*((_DWORD *)a1 + 69) < 2u) {
                  goto LABEL_153;
                }
                int v33 = *__error();
                syslog(7, "%s:%d:%s() open successful on destination rsrc (%s)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2346, "copyfile_open", (const char *)&v79);
              }
              *__error() = v33;
LABEL_153:
              if ((a1[3] & 0x80000000) == 0 && (a1[2] & 0x80000000) == 0) {
                return 0;
              }
              if (*((_DWORD *)a1 + 69))
              {
                int v66 = *__error();
                syslog(7, "%s:%d:%s() file descriptors not open (src: %d, dst: %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 2354, "copyfile_open", *((_DWORD *)a1 + 4), *((_DWORD *)a1 + 6));
                *__error() = v66;
              }
              int v46 = 22;
              goto LABEL_159;
            }
            int v58 = fstatfs(*((_DWORD *)a1 + 6), &v79);
            if (v58 != -1 && (v79.f_flags & 0x80) != 0)
            {
              int v59 = *((_DWORD *)a1 + 49) | 0x40;
LABEL_163:
              int v31 = v59 | 0x20;
              *((_DWORD *)a1 + 49) = v31;
              goto LABEL_164;
            }
            if (v58 != -1)
            {
              int v59 = *((_DWORD *)a1 + 49);
              goto LABEL_163;
            }
LABEL_122:
            int v4 = *__error();
            __error();
            syslog(4, "failed to determine copy protection on (%s) with error <%d>: %m");
            goto LABEL_7;
          }
        }
        else
        {
          __int16 v43 = *((_WORD *)a1 + 18);
          uint64_t v44 = (unsigned int (*)(const char *, stat *))MEMORY[0x263EF8C58];
          if ((a1[24] & 0x40000) == 0) {
            uint64_t v44 = (unsigned int (*)(const char *, stat *))MEMORY[0x263EF8C68];
          }
          if (!v44(*a1, &v78))
          {
            unsigned __int16 v45 = v43 & 0xF000;
            goto LABEL_176;
          }
        }
        int v4 = *__error();
        syslog(4, "repeat stat on %s\n: %m");
        goto LABEL_7;
      case 32768:
        char v14 = 0;
        int v15 = 0;
        int v5 = 1;
        break;
      default:
        if (strcmp(*a1, "/dev/null") || ((_BYTE)a1[24] & 7) == 0)
        {
          int v46 = 45;
LABEL_159:
          *((_DWORD *)a1 + 68) = v46;
          return 0xFFFFFFFFLL;
        }
        int v5 = 0;
        int v15 = 0;
        char v14 = 1;
        break;
    }
    int v35 = 0;
    int v36 = 0;
    unsigned int v37 = *((_DWORD *)a1 + 48);
    int v38 = (v37 >> 10) & 0x100;
    goto LABEL_64;
  }
  int v4 = *__error();
  syslog(4, "stat on %s: %m");
LABEL_7:
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  copyfile_state_t v23 = a3;
  if ((to_fd | from_fd) < 0)
  {
    int v18 = __error();
    int v19 = 22;
LABEL_30:
    *int v18 = v19;
    return -1;
  }
  if ((copyfile_preamble(&v23, flags) & 0x80000000) != 0) {
    return -1;
  }
  copyfile_state_t v8 = v23;
  if (v23 && *((_DWORD *)v23 + 69) >= 2u)
  {
    int v9 = *__error();
    syslog(7, "%s:%d:%s() set src_fd <- %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1029, "fcopyfile", from_fd);
    *__error() = v9;
  }
  if (*((_DWORD *)v8 + 4) == -2)
  {
    *((_DWORD *)v8 + 4) = from_fd;
    if (fstatx_np(from_fd, (stat *)((char *)v8 + 32), *((filesec_t *)v8 + 23)))
    {
      if (*__error() != 45 && *__error() != 1)
      {
        int v21 = *__error();
        syslog(4, "fstatx_np on src fd %d: %m", *((_DWORD *)v8 + 4));
        *__error() = v21;
        return -1;
      }
      fstat(*((_DWORD *)v8 + 4), (stat *)((char *)v8 + 32));
    }
  }
  int v10 = *((_WORD *)v8 + 18) & 0xF000;
  if (v10 != 0x4000 && v10 != 0x8000 && v10 != 40960)
  {
    int v18 = __error();
    int v19 = 45;
    goto LABEL_30;
  }
  if (*((_DWORD *)v8 + 69) >= 2u)
  {
    int v11 = *__error();
    syslog(7, "%s:%d:%s() set dst_fd <- %d\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1057, "fcopyfile", to_fd);
    *__error() = v11;
  }
  int v12 = *((_DWORD *)v8 + 6);
  if (v12 == -2)
  {
    *((_DWORD *)v8 + 6) = to_fd;
    int v12 = to_fd;
  }
  int v13 = fstat(v12, &v22);
  fchmod(*((_DWORD *)v8 + 6), v22.st_mode & 0xE7F | 0x180);
  if (!*((void *)v8 + 28)) {
    *((void *)v8 + 28) = 0;
  }
  int v14 = copyfile_internal(v8, flags);
  if ((v13 & 0x80000000) == 0 && (*((unsigned char *)v8 + 192) & 2) == 0)
  {
    int v15 = *__error();
    fchmod(*((_DWORD *)v8 + 6), v22.st_mode & 0xFFF);
    *__error() = v15;
  }
  int v16 = *((_DWORD *)v8 + 68);
  if (v16)
  {
    *__error() = v16;
    *((_DWORD *)v8 + 68) = 0;
  }
  if (!a3)
  {
    int v17 = *__error();
    copyfile_state_free(v8);
    *__error() = v17;
  }
  if ((v14 & 0x80000000) == 0) {
    *__error() = 0;
  }
  return v14;
}

_filesec *copyfile_fix_perms(filesec_t *a1)
{
  obj_p = 0;
  int v1 = filesec_dup(*a1);
  long long v2 = v1;
  if (v1)
  {
    if (!filesec_get_property(v1, FILESEC_ACL, &obj_p)
      && (add_uberace((acl_t *)&obj_p) || filesec_set_property(v2, FILESEC_ACL, &obj_p))
      || !filesec_get_property(v2, FILESEC_MODE, &v5)
      && (~v5 & 0x180) != 0
      && (v5 |= 0x180u, filesec_set_property(v2, FILESEC_MODE, &v5)))
    {
      filesec_free(v2);
      long long v2 = 0;
    }
    if (obj_p) {
      acl_free(obj_p);
    }
  }
  return v2;
}

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  if (dst)
  {
    switch(flag)
    {
      case 1u:
        int result = 0;
        int v5 = *((_DWORD *)s + 4);
        goto LABEL_24;
      case 2u:
        int result = 0;
        uint64_t v8 = *(void *)s;
        goto LABEL_22;
      case 3u:
        int result = 0;
        int v5 = *((_DWORD *)s + 6);
        goto LABEL_24;
      case 4u:
        int result = 0;
        uint64_t v8 = *((void *)s + 1);
        goto LABEL_22;
      case 5u:
        int result = 0;
        uint64_t v8 = *((void *)s + 28);
        goto LABEL_22;
      case 6u:
        int result = 0;
        uint64_t v8 = *((void *)s + 26);
        goto LABEL_22;
      case 7u:
        int result = 0;
        uint64_t v8 = *((void *)s + 27);
        goto LABEL_22;
      case 8u:
        int result = 0;
        uint64_t v8 = *((void *)s + 33);
        goto LABEL_22;
      case 9u:
        int result = 0;
        uint64_t v8 = *((void *)s + 31);
        goto LABEL_22;
      case 0xAu:
        int result = 0;
        int v9 = (*((_DWORD *)s + 49) >> 11) & 1;
        goto LABEL_28;
      case 0xBu:
      case 0xDu:
        int result = 0;
        int v5 = *((_DWORD *)s + 71);
        goto LABEL_24;
      case 0xCu:
        int result = 0;
        int v5 = *((_DWORD *)s + 72);
        goto LABEL_24;
      case 0xEu:
        int result = 0;
        int v9 = (*((_DWORD *)s + 49) >> 13) & 1;
LABEL_28:
        *(unsigned char *)dst = v9;
        return result;
      case 0xFu:
        int result = 0;
        int v5 = (*((_DWORD *)s + 49) >> 9) & 1;
        goto LABEL_24;
      case 0x10u:
        int result = 0;
        int v5 = (*((_DWORD *)s + 49) >> 14) & 1;
        goto LABEL_24;
      case 0x11u:
        int result = 0;
        uint64_t v8 = *((void *)s + 32);
LABEL_22:
        *(void *)dst = v8;
        return result;
      case 0x12u:
        int result = 0;
        int v5 = HIWORD(*((_DWORD *)s + 49)) & 1;
        goto LABEL_24;
      default:
        if (flag != 256)
        {
          int v6 = __error();
          int v7 = 22;
          goto LABEL_5;
        }
        int result = 0;
        int v5 = *((_DWORD *)s + 70);
LABEL_24:
        *(_DWORD *)dst = v5;
        break;
    }
  }
  else
  {
    int v6 = __error();
    int v7 = 14;
LABEL_5:
    *int v6 = v7;
    return -1;
  }
  return result;
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  if (src)
  {
    switch(flag)
    {
      case 1u:
        int result = 0;
        *((_DWORD *)s + 4) = *(_DWORD *)src;
        return result;
      case 2u:
        int v7 = strdup((const char *)src);
        int result = 0;
        *(void *)s = v7;
        return result;
      case 3u:
        int result = 0;
        *((_DWORD *)s + 6) = *(_DWORD *)src;
        return result;
      case 4u:
        uint64_t v8 = strdup((const char *)src);
        int result = 0;
        *((void *)s + 1) = v8;
        return result;
      case 5u:
        if (*((void *)s + 28)) {
          *((void *)s + 28) = 0;
        }
        if (!*(void *)src) {
          return 0;
        }
        int result = 0;
        *((void *)s + 28) = 0;
        return result;
      case 6u:
        int result = 0;
        *((void *)s + 26) = src;
        return result;
      case 7u:
        int result = 0;
        *((void *)s + 27) = src;
        return result;
      case 8u:
      case 9u:
      case 0xAu:
      case 0x11u:
        goto LABEL_8;
      case 0xBu:
        int result = 0;
        *((_DWORD *)s + 71) = *(_DWORD *)src;
        return result;
      case 0xCu:
        int result = 0;
        int v9 = *(_DWORD *)src;
        goto LABEL_21;
      case 0xDu:
        int result = 0;
        int v9 = *(_DWORD *)src;
        *((_DWORD *)s + 71) = *(_DWORD *)src;
LABEL_21:
        *((_DWORD *)s + 72) = v9;
        return result;
      case 0xEu:
        if (!*(unsigned char *)src) {
          return 0;
        }
        int result = 0;
        unsigned int v10 = *((_DWORD *)s + 49) | 0x2000;
LABEL_34:
        *((_DWORD *)s + 49) = v10;
        return result;
      case 0xFu:
        int v11 = *((_DWORD *)s + 49);
        int result = 0;
        if (*(_DWORD *)src) {
          unsigned int v10 = v11 | 0x200;
        }
        else {
          unsigned int v10 = v11 & 0xFFFFFDFF;
        }
        goto LABEL_34;
      case 0x10u:
        int v12 = *((_DWORD *)s + 49);
        int result = 0;
        if (*(_DWORD *)src) {
          unsigned int v10 = v12 | 0x4000;
        }
        else {
          unsigned int v10 = v12 & 0xFFFFBFFF;
        }
        goto LABEL_34;
      case 0x12u:
        int v13 = *((_DWORD *)s + 49);
        int result = 0;
        if (*(_DWORD *)src) {
          unsigned int v10 = v13 | 0x10000;
        }
        else {
          unsigned int v10 = v13 & 0xFFFEFFFF;
        }
        goto LABEL_34;
      default:
        if (flag == 256)
        {
          int result = 0;
          *((_DWORD *)s + 70) = *(_DWORD *)src;
          return result;
        }
LABEL_8:
        int v5 = __error();
        int v6 = 22;
        break;
    }
  }
  else
  {
    int v5 = __error();
    int v6 = 14;
  }
  int *v5 = v6;
  return -1;
}

uint64_t add_uberace(acl_t *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8C08];
  uid_t v2 = getuid();
  if (!mbr_uid_to_uuid(v2, uu))
  {
    uint64_t result = acl_create_entry_np(a1, &entry_p, 0);
    if (result == -1) {
      return result;
    }
    if (acl_get_permset(entry_p, &permset_p) == -1)
    {
      int v4 = "acl_get_permset: %m";
    }
    else if (acl_clear_perms(permset_p) == -1)
    {
      int v4 = "acl_clear_permset: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_DATA) == -1)
    {
      int v4 = "add ACL_WRITE_DATA: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_ATTRIBUTES) == -1)
    {
      int v4 = "add ACL_WRITE_ATTRIBUTES: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_EXTATTRIBUTES) == -1)
    {
      int v4 = "add ACL_WRITE_EXTATTRIBUTES: %m";
    }
    else if (acl_add_perm(permset_p, ACL_APPEND_DATA) == -1)
    {
      int v4 = "add ACL_APPEND_DATA: %m";
    }
    else if (acl_add_perm(permset_p, ACL_WRITE_SECURITY) == -1)
    {
      int v4 = "add ACL_WRITE_SECURITY: %m";
    }
    else if (acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW) == -1)
    {
      int v4 = "set ACL_EXTENDED_ALLOW: %m";
    }
    else if (acl_set_permset(entry_p, permset_p) == -1)
    {
      int v4 = "acl_set_permset: %m";
    }
    else
    {
      if (acl_set_qualifier(entry_p, uu) != -1) {
        return 0;
      }
      int v4 = "acl_set_qualifier: %m";
    }
    int v5 = *__error();
    syslog(4, v4);
    *__error() = v5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t copyfile_pack(void *a1)
{
  v119[1] = *(void **)MEMORY[0x263EF8C08];
  uid_t v2 = malloc_type_calloc(1uLL, 0x10012uLL, 0x93FCD626uLL);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  int v4 = (char *)malloc_type_calloc(1uLL, 0x10012uLL, 0xDB314DE6uLL);
  if (!v4)
  {
    free(v3);
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  int v117 = v4 + 65554;
  *int v3 = 0x2000000051607;
  *((_WORD *)v3 + 12) = 2;
  *(_OWORD *)((char *)v3 + 26) = xmmword_20D7073E0;
  *(void *)((char *)v3 + 42) = 82;
  *(_OWORD *)(v3 + 1) = *(_OWORD *)"Mac OS X        ";
  *(void *)((char *)v3 + 84) = 1096045650;
  *((_DWORD *)v3 + 24) = 120;
  int v6 = (int8x8_t *)(v3 + 15);
  int v7 = *((_DWORD *)a1 + 48);
  if (v7)
  {
    v119[0] = 0;
    if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, v119) < 0)
    {
      if (*((_DWORD *)a1 + 69) < 2u)
      {
        uint64_t v8 = 0;
      }
      else
      {
        int v10 = *__error();
        int v11 = __error();
        syslog(7, "%s:%d:%s() no acl entries found (errno = %d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5390, "copyfile_pack", *v11);
        uint64_t v8 = 0;
        *__error() = v10;
      }
    }
    else
    {
      strcpy(v5, "com.apple.acl.text");
      int v117 = v5 + 19;
      uint64_t v8 = 19;
    }
    if (v119[0]) {
      acl_free(v119[0]);
    }
    int v7 = *((_DWORD *)a1 + 48);
  }
  else
  {
    uint64_t v8 = 0;
  }
  statfs v115 = v5;
  uint64_t v116 = v3;
  if ((v7 & 4) != 0)
  {
    uint64_t v53 = 65554 - v8;
    ssize_t v54 = flistxattr(*((_DWORD *)a1 + 4), &v5[v8], 65554 - v8, 0);
    if (v54 <= 0 && *((_DWORD *)a1 + 69) >= 2u)
    {
      int v55 = *__error();
      int v56 = __error();
      syslog(7, "%s:%d:%s() no extended attributes found (%d)\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5406, "copyfile_pack", *v56);
      *__error() = v55;
    }
    if (v54 >= v53) {
      ssize_t v57 = 65554 - v8;
    }
    else {
      ssize_t v57 = v54;
    }
    if (v54 <= v53)
    {
      uint64_t v53 = v57;
    }
    else if (*((_DWORD *)a1 + 69))
    {
      int v58 = *__error();
      syslog(7, "%s:%d:%s() extended attribute list too long\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5410, "copyfile_pack");
      *__error() = v58;
    }
    int64_t v67 = (v53 & ~(v53 >> 63)) + v8;
    if ((unint64_t)v67 > 0x10012) {
      goto LABEL_153;
    }
    uint64_t v114 = v8;
    int v117 = &v5[v67];
    if (v53 >= 1 && !*v117)
    {
      int v68 = malloc_type_calloc(0xAuLL, 8uLL, 0x10040436913F5uLL);
      if (v68)
      {
        int v69 = v68;
        *int v68 = v5;
        ssize_t v70 = (char *)memchr(v5, 0, v67);
        if (v70)
        {
          int v71 = v70;
          int v72 = 10;
          uint64_t v73 = 1;
          do
          {
            if (v73 == v72)
            {
              v72 += 10;
              int v74 = malloc_type_realloc(v69, 8 * v72, 0x80040B8603338uLL);
              if (!v74) {
                goto LABEL_187;
              }
              int v69 = v74;
            }
            int v75 = v73 + 1;
            *((void *)v69 + v73) = v71 + 1;
            int v71 = (char *)memchr(v71 + 1, 0, v117 - (v71 + 1));
            ++v73;
          }
          while (v71);
          unsigned int v76 = v75 - 1;
        }
        else
        {
          unsigned int v76 = 0;
        }
        uint64_t v94 = v76;
        qsort_b(v69, v76, 8uLL, &__block_literal_global);
        unsigned int v95 = (char *)malloc_type_malloc(v67, 0x2824CFAFuLL);
        if (v95)
        {
          int v96 = v95;
          if (v94)
          {
            unsigned int v97 = (const char **)v69;
            off_t v98 = v95;
            do
            {
              v99 = *v97++;
              size_t v100 = strlen(v99) + 1;
              memcpy(v98, v99, v100);
              v98 += v100;
              --v94;
            }
            while (v94);
          }
          int v5 = v115;
          __memcpy_chk();
          free(v96);
          int v3 = v116;
        }
        free(v69);
      }
    }
LABEL_187:
    if (v67 < 1)
    {
      int v12 = 0;
      goto LABEL_17;
    }
    int v12 = 0;
    uint64_t v101 = 120;
    size_t v102 = v6;
    int v103 = v5;
    while (1)
    {
      size_t v104 = strlen(v103) + 1;
      if (strcmp(v103, "com.apple.FinderInfo") && strcmp(v103, "com.apple.ResourceFork"))
      {
        if (!strcmp(v103, "figgledidiggledy")) {
          int v12 = 1;
        }
        if (v104 >= 0x80) {
          size_t v104 = 128;
        }
        xattr_operation_intent_t v105 = *((_DWORD *)a1 + 70);
        if (v105 && !xattr_preserve_for_intent(v103, v105))
        {
          uint64_t v112 = v117;
          memmove(v103, &v103[v104], v117 - &v103[v104]);
          int v117 = &v112[-v104];
          size_t v104 = 0;
        }
        else
        {
          if (!a1[26]) {
            goto LABEL_200;
          }
          MEMORY[0x270FA53B0]();
          int v106 = (char *)&v113 - ((v104 + 15) & 0xFFFFFFFFFFFFFFF0);
          memmove(v106, v103, v104);
          v106[v104 - 1] = 0;
          a1[31] = v106;
          int v107 = ((uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26])(5, 1, a1, *a1, a1[1], a1[27]);
          a1[31] = 0;
          if (v107 != 1)
          {
            int v3 = v116;
            if (v107 == 2)
            {
              *((_DWORD *)a1 + 68) = 89;
              uint64_t v9 = 0xFFFFFFFFLL;
              v24 = 0;
LABEL_164:
              int v5 = v115;
              goto LABEL_155;
            }
LABEL_200:
            v102[1].i8[2] = v104;
            v102[1].i16[0] = 0;
            if (&v103[v104] > v117) {
              goto LABEL_210;
            }
            unsigned int v108 = (char *)&v102[1] + 3;
            memmove((char *)&v102[1] + 3, v103, v104);
            if (*((_DWORD *)a1 + 69) >= 2u)
            {
              int v109 = *__error();
              syslog(7, "%s:%d:%s() copied name [%s]\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5479, "copyfile_pack", v108);
              *__error() = v109;
            }
            uint64_t v110 = ((_WORD)v104 + 14) & 0x1FC;
            v101 += v110;
            if (v101 >= 65554)
            {
LABEL_210:
              v24 = 0;
              goto LABEL_211;
            }
            int v3 = v116;
            ++*((_WORD *)v116 + 59);
            *((_DWORD *)v3 + 24) += v110;
            goto LABEL_207;
          }
          stat v111 = v117;
          memmove(v103, &v103[v104], v117 - &v103[v104]);
          int v117 = &v111[-v104];
          size_t v104 = 0;
          int v3 = v116;
        }
      }
LABEL_207:
      v103 += v104;
      size_t v102 = (int8x8_t *)((char *)v3 + v101);
      if (v103 >= v117) {
        goto LABEL_17;
      }
    }
  }
  uint64_t v114 = v8;
  int v12 = 0;
LABEL_17:
  int v13 = v115;
  if (a1[28] && !v12) {
    strlcpy(&v115[v114], "figgledidiggledy", 65554 - v114);
  }
  if (v13 >= v117)
  {
    uint64_t v9 = 0;
    LODWORD(v114) = 0;
LABEL_109:
    unsigned int v59 = *((_DWORD *)v3 + 24);
    unsigned int v60 = *((_DWORD *)v3 + 25) + v59;
    *(_DWORD *)((char *)v3 + 42) = v60;
    *(_DWORD *)((char *)v3 + 34) = v60 - *(_DWORD *)((char *)v3 + 30);
    *((_DWORD *)v3 + 23) = v60;
    if (!v114)
    {
      int v5 = v115;
LABEL_147:
      size_t v83 = v59;
      ssize_t len_p = v59;
      swap_adhdr((int8x8_t *)v3);
      int8x16_t v84 = *(int8x16_t *)((char *)v3 + 84);
      *(int8x16_t *)((char *)v3 + 84) = vrev32q_s8(v84);
      *((_DWORD *)v3 + 25) = bswap32(*((_DWORD *)v3 + 25));
      *((_WORD *)v3 + 58) = bswap32(*((unsigned __int16 *)v3 + 58)) >> 16;
      unsigned int i = *((unsigned __int16 *)v3 + 59);
      unsigned int v86 = bswap32(i) >> 16;
      *((_WORD *)v3 + 59) = v86;
      if (v84.i32[0] == 1381258305) {
        LOWORD(i) = v86;
      }
      for (unsigned int i = (unsigned __int16)i; i; --i)
      {
        uint64_t v87 = (v6[1].u8[2] + 14) & 0x1FC;
        *int v6 = vrev32_s8(*v6);
        v6[1].i16[0] = bswap32(v6[1].u16[0]) >> 16;
        int v6 = (int8x8_t *)((char *)v6 + v87);
      }
      ssize_t v88 = pwrite(*((_DWORD *)a1 + 6), v3, v83, 0);
      v24 = 0;
      if (v88 == len_p) {
        goto LABEL_155;
      }
      if ((*((unsigned char *)a1 + 195) & 0x40) == 0) {
        goto LABEL_153;
      }
      int v77 = *__error();
      syslog(4, "couldn't write file header: %m");
LABEL_161:
      v24 = 0;
      *__error() = v77;
      goto LABEL_154;
    }
    __int16 v61 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    int v5 = v115;
    if (v61)
    {
      a1[31] = "com.apple.ResourceFork";
      int v62 = v61(5, 1, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v62 == 1)
      {
        char v65 = 0;
        int v79 = 0;
        goto LABEL_141;
      }
      if (v62 == 2) {
        goto LABEL_134;
      }
    }
    unint64_t v63 = fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", 0, 0, 0, 0);
    if ((v63 & 0x8000000000000000) != 0)
    {
      if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
      {
        int v77 = *__error();
        stat v78 = __error();
        syslog(4, "skipping attr \"%s\" due to error %d: %m", "com.apple.ResourceFork", *v78);
        goto LABEL_161;
      }
      goto LABEL_153;
    }
    size_t v64 = v63;
    if (v63 >> 31)
    {
      char v65 = 0;
      int v66 = 22;
LABEL_135:
      *((_DWORD *)a1 + 68) = v66;
      goto LABEL_136;
    }
    uint64_t v80 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (v80)
    {
      a1[31] = "com.apple.ResourceFork";
      a1[33] = 0;
      int v81 = v80(5, 4, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v81 == 2)
      {
LABEL_134:
        char v65 = 0;
        int v66 = 89;
        goto LABEL_135;
      }
    }
    char v65 = malloc_type_malloc(v64, 0x4A2C0A72uLL);
    if (v65)
    {
      if (fgetxattr(*((_DWORD *)a1 + 4), "com.apple.ResourceFork", v65, v64, 0, 0) == v64)
      {
        if (pwrite(*((_DWORD *)a1 + 6), v65, v64, *(unsigned int *)((char *)v3 + 42)) != v64
          && (*((unsigned char *)a1 + 195) & 0x40) != 0)
        {
          int v90 = *__error();
          syslog(4, "couldn't write resource fork: %m");
          *__error() = v90;
        }
        unsigned int v91 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (!v91 || v91(5, 2, a1, *a1, a1[1], a1[27]) != 2)
        {
          if (*((_DWORD *)a1 + 69) >= 3u)
          {
            int v92 = *__error();
            syslog(7, "%s:%d:%s() copied %zd bytes of \"%s\" data @ offset 0x%08x\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5295, "copyfile_pack_rsrcfork", v64, "com.apple.ResourceFork", *(_DWORD *)((char *)v3 + 42));
            *__error() = v92;
          }
          int v79 = 0;
          *(_DWORD *)((char *)v3 + 46) = v64;
LABEL_141:
          if (a1[31]) {
            a1[31] = 0;
          }
          if (v65) {
            free(v65);
          }
          if (!v79)
          {
            uint64_t v9 = 0;
            unsigned int v59 = *((_DWORD *)v3 + 24);
            goto LABEL_147;
          }
LABEL_153:
          v24 = 0;
LABEL_154:
          uint64_t v9 = 0xFFFFFFFFLL;
          goto LABEL_155;
        }
LABEL_136:
        v82 = (unsigned int (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
        if (v82)
        {
          if (v82(5, 3, a1, *a1, a1[1], a1[27])) {
            int v79 = -1;
          }
          else {
            int v79 = 0;
          }
        }
        else
        {
          int v79 = -1;
        }
        goto LABEL_141;
      }
      if ((*((unsigned char *)a1 + 195) & 0x40) == 0) {
        goto LABEL_136;
      }
      int v93 = *__error();
      syslog(4, "couldn't read entire resource fork: %m");
    }
    else
    {
      int v93 = *__error();
      syslog(4, "malloc: %m");
    }
    *__error() = v93;
    goto LABEL_136;
  }
  LODWORD(v114) = 0;
  uint64_t v9 = 0;
  int v14 = v6;
  while (1)
  {
    size_t v15 = strlen(v13);
    if (!strcmp(v13, "com.apple.acl.text"))
    {
      v119[0] = 0;
      if (filesec_get_property((filesec_t)a1[23], FILESEC_ACL, v119) < 0)
      {
        if (*__error() != 2 && (*((unsigned char *)a1 + 195) & 0x40) != 0)
        {
          int v34 = *__error();
          syslog(4, "getting acl: %m");
          *__error() = v34;
        }
        v24 = 0;
        ssize_t len_p = 0;
      }
      else
      {
        int v21 = acl_to_text((acl_t)v119[0], &len_p);
        if (v21)
        {
          stat v22 = v21;
          copyfile_state_t v23 = malloc_type_malloc(++len_p, 0x54544FEEuLL);
          v24 = v23;
          if (v23) {
            memcpy(v23, v22, len_p);
          }
          else {
            ssize_t len_p = 0;
          }
          acl_free(v22);
        }
        else
        {
          v24 = 0;
        }
        if (*((_DWORD *)a1 + 69) >= 2u)
        {
          int v35 = *__error();
          syslog(7, "%s:%d:%s() copied acl (%ld) %p\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5200, "copyfile_pack_acl", len_p, v24);
          *__error() = v35;
        }
        int v3 = v116;
      }
      if (v119[0]) {
        acl_free(v119[0]);
      }
LABEL_67:
      ssize_t v36 = len_p;
      v14->i32[1] = len_p;
      int v37 = *((_DWORD *)v3 + 25);
      off_t v38 = (v37 + *((_DWORD *)v3 + 24));
      v14->i32[0] = v38;
      *((_DWORD *)v3 + 25) = v37 + v36;
      ssize_t v39 = pwrite(*((_DWORD *)a1 + 6), v24, v36, v38);
      if (v39 == len_p) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = 1;
      }
      free(v24);
      if (*((_DWORD *)a1 + 69) >= 3u)
      {
        int v20 = *__error();
        syslog(7, "%s:%d:%s() copied %ld bytes of \"%s\" data @ offset 0x%08x\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 5702, "copyfile_pack", len_p, v13, v14->i32[0]);
LABEL_72:
        *__error() = v20;
      }
LABEL_73:
      int v14 = (int8x8_t *)((char *)v14 + ((v14[1].u8[2] + 14) & 0x1FC));
      goto LABEL_74;
    }
    if (a1[28] && !strcmp(v13, "figgledidiggledy"))
    {
      v24 = 0;
      goto LABEL_67;
    }
    if (strcmp(v13, "com.apple.FinderInfo")) {
      break;
    }
    BOOL v25 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (v25)
    {
      a1[31] = "com.apple.FinderInfo";
      int v26 = v25(5, 1, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v26 == 1) {
        goto LABEL_74;
      }
      if (v26 == 2) {
        goto LABEL_162;
      }
      a1[33] = 0;
      int v27 = ((uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26])(5, 4, a1, *a1, a1[1], a1[27]);
      a1[31] = 0;
      if (v27 == 2) {
        goto LABEL_162;
      }
    }
    ssize_t v28 = fgetxattr(*((_DWORD *)a1 + 4), v13, (char *)v3 + *(unsigned int *)((char *)v3 + 30), 0x20uLL, 0, 0);
    ssize_t len_p = v28;
    if (v28 < 0)
    {
      int v40 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
      if (v40)
      {
        a1[31] = strdup(v13);
        int v41 = v40(5, 3, a1, *a1, a1[1], a1[27]);
        int v42 = (void *)a1[31];
        if (v42)
        {
          free(v42);
          a1[31] = 0;
        }
        if (v41 == 2)
        {
LABEL_179:
          v24 = 0;
          goto LABEL_163;
        }
      }
      if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
      {
        int v43 = *__error();
        __error();
        syslog(4, "skipping attr \"%s\" due to error %d: %m");
        goto LABEL_91;
      }
    }
    else
    {
      int v29 = *((_DWORD *)a1 + 48);
      if (v28 != 32)
      {
        if ((v29 & 0x40000000) == 0) {
          goto LABEL_74;
        }
        int v43 = *__error();
        syslog(4, "unexpected size (%ld) for \"%s\": %m");
LABEL_91:
        *__error() = v43;
        goto LABEL_74;
      }
      if ((v29 & 0x40000000) != 0)
      {
        int v30 = *__error();
        syslog(4, " copied 32 bytes of \"%s\" data @ offset 0x%08x: %m", "com.apple.FinderInfo", *(_DWORD *)((char *)v3 + 30));
        *__error() = v30;
      }
      int v31 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
      if (v31)
      {
        a1[31] = strdup(v13);
        int v32 = v31(5, 2, a1, *a1, a1[1], a1[27]);
        int v33 = (void *)a1[31];
        if (v33)
        {
          free(v33);
          a1[31] = 0;
        }
        if (v32 == 2) {
          goto LABEL_179;
        }
      }
    }
LABEL_74:
    v13 += v15 + 1;
    if (v13 >= v117) {
      goto LABEL_109;
    }
  }
  if (!strcmp(v13, "com.apple.ResourceFork"))
  {
    LODWORD(v114) = 1;
    goto LABEL_74;
  }
  int v16 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (v16)
  {
    a1[31] = strdup(v13);
    a1[33] = 0;
    int v17 = v16(5, 4, a1, *a1, a1[1], a1[27]);
    int v18 = (void *)a1[31];
    if (v18)
    {
      free(v18);
      a1[31] = 0;
    }
    if (v17 == 2)
    {
LABEL_162:
      v24 = 0;
      *((_DWORD *)a1 + 68) = 89;
LABEL_163:
      uint64_t v9 = 0xFFFFFFFFLL;
      goto LABEL_164;
    }
  }
  unint64_t v19 = fgetxattr(*((_DWORD *)a1 + 4), v13, 0, 0, 0, 0);
  ssize_t len_p = v19;
  if (!v19) {
    goto LABEL_73;
  }
  if ((v19 & 0x8000000000000000) != 0)
  {
    if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
    {
      int v44 = *__error();
      unsigned __int16 v45 = __error();
      syslog(4, "skipping attr \"%s\" due to error %d: %m", v13, *v45);
      *__error() = v44;
    }
    int v46 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
    if (v46)
    {
      a1[31] = strdup(v13);
      int v47 = v46(5, 3, a1, *a1, a1[1], a1[27]);
      unsigned int v48 = (void *)a1[31];
      if (v48)
      {
        free(v48);
        a1[31] = 0;
      }
      if (v47 == 2) {
        goto LABEL_162;
      }
    }
    goto LABEL_73;
  }
  if (v19 >= 0x1000001)
  {
    if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
    {
      int v20 = *__error();
      syslog(4, "skipping attr \"%s\" (too big): %m", v13);
      goto LABEL_72;
    }
    goto LABEL_73;
  }
  int v49 = malloc_type_malloc(v19, 0x64C34163uLL);
  if (!v49)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
    goto LABEL_74;
  }
  v24 = v49;
  ssize_t len_p = fgetxattr(*((_DWORD *)a1 + 4), v13, v49, len_p, 0, 0);
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (!v50) {
    goto LABEL_97;
  }
  a1[31] = strdup(v13);
  int v51 = v50(5, 2, a1, *a1, a1[1], a1[27]);
  int v52 = (void *)a1[31];
  if (v52)
  {
    free(v52);
    a1[31] = 0;
  }
  if (v51 != 2)
  {
LABEL_97:
    int v3 = v116;
    goto LABEL_67;
  }
  *((_DWORD *)a1 + 68) = 89;
LABEL_211:
  uint64_t v9 = 0xFFFFFFFFLL;
  int v5 = v115;
  int v3 = v116;
LABEL_155:
  free(v3);
  free(v5);
  if (v24) {
    free(v24);
  }
  if (!v9) {
    copyfile_stat((uint64_t)a1);
  }
  return v9;
}

int8x8_t swap_adhdr(int8x8_t *a1)
{
  LODWORD(v1) = a1[3].u16[0];
  unsigned int v2 = bswap32(v1) >> 16;
  int8x8_t result = *a1;
  int8x8_t v4 = vrev32_s8(*a1);
  if (a1->u32[0] != 333319) {
    LOWORD(v1) = v2;
  }
  *a1 = v4;
  a1[3].i16[0] = v2;
  if ((_WORD)v1)
  {
    uint64_t v1 = (unsigned __int16)v1;
    int v5 = (unsigned int *)((char *)&a1[4] + 2);
    do
    {
      int8x8_t result = vrev32_s8(*(int8x8_t *)(v5 - 2));
      *((int8x8_t *)v5 - 1) = result;
      unsigned int *v5 = bswap32(*v5);
      v5 += 3;
      --v1;
    }
    while (v1);
  }
  return result;
}

int8x16_t swap_attrhdr(uint64_t a1)
{
  int8x16_t result = vrev32q_s8(*(int8x16_t *)(a1 + 84));
  *(int8x16_t *)(a1 + 84) = result;
  *(_DWORD *)(a1 + 100) = bswap32(*(_DWORD *)(a1 + 100));
  *(_WORD *)(a1 + 116) = bswap32(*(unsigned __int16 *)(a1 + 116)) >> 16;
  *(_WORD *)(a1 + 118) = bswap32(*(unsigned __int16 *)(a1 + 118)) >> 16;
  return result;
}

uint64_t __sort_xattrname_list_block_invoke(uint64_t a1, const char **a2, const char **a3)
{
  return strcmp(*a2, *a3);
}

uint64_t copyfile_unpack_xattr(void *a1, uint64_t a2, void *value)
{
  if (!*((_DWORD *)a1 + 70))
  {
    int v6 = xattr_preserve_for_intent((const char *)(a2 + 11), 0);
    uint64_t result = 0;
    if (v6 != 1) {
      return result;
    }
  }
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (v8)
  {
    a1[31] = strdup((const char *)(a2 + 11));
    a1[33] = 0;
    int v9 = v8(5, 1, a1, *a1, a1[1], a1[27]);
    int v10 = (void *)a1[31];
    if (v10)
    {
      free(v10);
      a1[31] = 0;
    }
    if (v9 == 2) {
      goto LABEL_12;
    }
  }
  int v11 = (const char *)(a2 + 11);
  int v12 = fsetxattr(*((_DWORD *)a1 + 6), (const char *)(a2 + 11), value, *(unsigned int *)(a2 + 4), 0, 0);
  int v13 = *__error();
  if (v12 != -1 || v13 == 1 && !strcmp((const char *)(a2 + 11), "com.apple.root.installed"))
  {
    uint64_t v14 = a1[26];
    *__error() = v13;
    if (!v14) {
      return 0;
    }
    a1[31] = strdup((const char *)(a2 + 11));
    a1[33] = *(unsigned int *)(a2 + 4);
    int v15 = ((uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26])(5, 2, a1, *a1, a1[1], a1[27]);
    int v16 = (void *)a1[31];
    if (v16)
    {
      free(v16);
      a1[31] = 0;
    }
    if (v15 != 2) {
      return 0;
    }
LABEL_12:
    *((_DWORD *)a1 + 68) = 89;
    return 0xFFFFFFFFLL;
  }
  *__error() = v13;
  if ((*((unsigned char *)a1 + 195) & 0x40) != 0)
  {
    int v17 = *__error();
    syslog(4, "error %d setting attribute %s: %m", v13, v11);
    *__error() = v17;
  }
  int v18 = (uint64_t (*)(uint64_t, uint64_t, void *, void, void, void))a1[26];
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  a1[31] = strdup(v11);
  int v19 = v18(5, 3, a1, *a1, a1[1], a1[27]);
  int v20 = (void *)a1[31];
  if (v20)
  {
    free(v20);
    a1[31] = 0;
  }
  if (v19 == 2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t copyfile_unpack_acl(uint64_t a1, unsigned int a2, char *buf_p)
{
  if (buf_p[a2 - 1])
  {
    int v6 = (char *)malloc_type_malloc(a2 + 1, 0x940CE1E0uLL);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    int v7 = v6;
    memcpy(v6, buf_p, a2);
    v7[a2] = 0;
    v22[0] = acl_from_text(v7);
    free(v7);
    if (v22[0]) {
      goto LABEL_4;
    }
    return 0;
  }
  v22[0] = acl_from_text(buf_p);
  if (!v22[0]) {
    return 0;
  }
LABEL_4:
  uint64_t v8 = filesec_init();
  if (!v8
    || (uint64_t v9 = fstatx_np(*(_DWORD *)(a1 + 24), &v21, v8), (v9 & 0x80000000) != 0)
    || (uint64_t v10 = v9, filesec_set_property(v8, FILESEC_ACL, v22) < 0))
  {
LABEL_36:
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  else
  {
    char v11 = 1;
    while (fchmodx_np(*(_DWORD *)(a1 + 24), v8) < 0)
    {
      if (*__error() != 45 || (v11 & 1) == 0) {
        goto LABEL_35;
      }
      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_ACL, 0) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          int v13 = *__error();
          uint64_t v14 = *(const char **)(a1 + 8);
          if (!v14) {
            uint64_t v14 = "(null dst)";
          }
          syslog(7, "%s:%d:%s() unsetting acl attribute on %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1854, "copyfile_unset_acl", v14);
          *__error() = v13;
        }
        int v12 = 1;
      }
      else
      {
        int v12 = 0;
      }
      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_UUID, 0) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          int v15 = *__error();
          int v16 = *(const char **)(a1 + 8);
          if (!v16) {
            int v16 = "(null dst)";
          }
          syslog(7, "%s:%d:%s() unsetting uuid attribute on %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1859, "copyfile_unset_acl", v16);
          *__error() = v15;
        }
        int v12 = 1;
      }
      if (filesec_set_property(*(filesec_t *)(a1 + 184), FILESEC_GRPUUID, 0) == -1)
      {
        if (*(_DWORD *)(a1 + 276) >= 5u)
        {
          int v17 = *__error();
          int v18 = *(const char **)(a1 + 8);
          if (!v18) {
            int v18 = "(null dst)";
          }
          syslog(7, "%s:%d:%s() unsetting group uuid attribute on %s\n", "/Library/Caches/com.apple.xbs/Sources/copyfile/copyfile.c", 1864, "copyfile_unset_acl", v18);
          *__error() = v17;
        }
LABEL_35:
        int v19 = *__error();
        syslog(4, "setting security information: %m");
        *__error() = v19;
        goto LABEL_36;
      }
      char v11 = 0;
      if (v12) {
        goto LABEL_35;
      }
    }
    if (!v10) {
      *(_DWORD *)(a1 + 196) |= 0x1000u;
    }
  }
  acl_free(v22[0]);
  filesec_free(v8);
  return v10;
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8C08];
  __s = 0;
  char v17 = 0;
  memset(v16, 0, sizeof(v16));
  char v15 = 35;
  char v3 = 67;
  int8x8_t v4 = &byte_20D707518;
  uint64_t v5 = 1;
  int v6 = (char *)v16;
  do
  {
    if ((*((_DWORD *)v4 - 1) & a2) != 0)
    {
      *int v6 = v3;
      if (v5 >= 65)
      {
        uint64_t v8 = __error();
        uint64_t result = 0;
        *uint64_t v8 = 63;
        return result;
      }
      ++v5;
    }
    int v7 = *v4;
    v4 += 8;
    char v3 = v7;
    int v6 = &v15 + v5;
  }
  while (v7);
  if (v5 != 1)
  {
    uint64_t v10 = (const char *)nameInDefaultList((char *)a1);
    if (v10 && !strcmp(v10, (const char *)v16))
    {
      char v11 = strdup(a1);
      __s = v11;
      if (v11)
      {
LABEL_13:
        if (strlen(v11) >= 0x80)
        {
          free(v11);
          __s = 0;
          int v12 = __error();
          int v13 = 63;
LABEL_17:
          *int v12 = v13;
          return __s;
        }
        return __s;
      }
    }
    else
    {
      asprintf(&__s, "%s%s", a1, &v15);
      char v11 = __s;
      if (__s) {
        goto LABEL_13;
      }
    }
LABEL_16:
    int v12 = __error();
    int v13 = 12;
    goto LABEL_17;
  }
  __s = strdup(a1);
  if (!__s) {
    goto LABEL_16;
  }
  return __s;
}

int xattr_intent_with_flags(xattr_operation_intent_t a1, xattr_flags_t a2)
{
  int v2 = 1;
  char v3 = &dword_2641154B8;
  while (v2 != a1)
  {
    int v4 = *v3;
    v3 += 4;
    int v2 = v4;
    if (!v4) {
      return (a2 & 4) == 0;
    }
  }
  return (*(uint64_t (**)(void))(*((void *)v3 - 1) + 16))();
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  char v3 = xattr_flags_from_name(a1);
  int v4 = 1;
  uint64_t v5 = &dword_2641154B8;
  while (v4 != a2)
  {
    int v6 = *v5;
    v5 += 4;
    int v4 = v6;
    if (!v6) {
      return (v3 & 4) == 0;
    }
  }
  uint64_t v8 = *(uint64_t (**)(void))(*((void *)v5 - 1) + 16);

  return v8();
}

uint64_t __nameInDefaultList_block_invoke()
{
  uint64_t result = _xpc_runtime_is_app_sandboxed();
  uint64_t v1 = defaultUnboxedPropertyTable;
  if (result) {
    uint64_t v1 = defaultSandboxedPropertyTable;
  }
  defaultPropertyTable = (uint64_t)v1;
  return result;
}

BOOL intentTable_block_invoke(uint64_t a1, char a2)
{
  return (a2 & 0x34) == 0;
}

BOOL intentTable_block_invoke_2(uint64_t a1, char a2)
{
  return (a2 & 0x16) == 0;
}

BOOL intentTable_block_invoke_3(uint64_t a1, char a2)
{
  return (a2 & 0x35) == 0;
}

BOOL intentTable_block_invoke_4(uint64_t a1, char a2)
{
  return (a2 & 0x1C) == 8;
}

BOOL intentTable_block_invoke_5(uint64_t a1, char a2)
{
  return (a2 & 4) == 0;
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270EDCEE0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270EDCF00]();
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x270EDDDA8]();
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x270EDCF38](permset_d, *(void *)&perm);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x270EDCF40](permset_d);
}

int acl_copy_entry(acl_entry_t dest_d, acl_entry_t src_d)
{
  return MEMORY[0x270EDCF48](dest_d, src_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x270EDCF50](acl_p, entry_p);
}

int acl_create_entry_np(acl_t *acl_p, acl_entry_t *entry_p, int entry_index)
{
  return MEMORY[0x270EDCF58](acl_p, entry_p, *(void *)&entry_index);
}

int acl_delete_entry(acl_t acl, acl_entry_t entry_d)
{
  return MEMORY[0x270EDCF60](acl, entry_d);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x270EDCF68](obj_p);
}

acl_t acl_from_text(const char *buf_p)
{
  return (acl_t)MEMORY[0x270EDCF70](buf_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x270EDCF78](acl, *(void *)&entry_id, entry_p);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x270EDCF80](flagset_d, *(void *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x270EDCF88](obj_p, flagset_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x270EDCF90](entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x270EDCF98](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x270EDCFA0](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x270EDCFA8](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x270EDCFB0](*(void *)&fd, acl);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x270EDCFB8](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x270EDCFC0](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x270EDCFC8](entry_d, *(void *)&tag_type);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x270EDCFD0](acl, len_p);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270EDCFD8](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x270EDD010](a1);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDD5B0](a1, a2);
}

int chmodx_np(const char *a1, filesec_t a2)
{
  return MEMORY[0x270EDD028](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270EDD5B8](a1, *(void *)&a2, *(void *)&a3);
}

int clonefileat(int a1, const char *a2, int a3, const char *a4, uint32_t a5)
{
  return MEMORY[0x270EDD5C0](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

int close(int a1)
{
  return MEMORY[0x270EDD5C8](*(void *)&a1);
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDD050](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x270EDD608](*(void *)&a1, *(void *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x270EDD610](*(void *)&a1, a2);
}

int fchmodx_np(int a1, filesec_t a2)
{
  return MEMORY[0x270EDD060](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270EDD618](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270EDD620](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270EDD630](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDD640](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

filesec_t filesec_dup(filesec_t a1)
{
  return (filesec_t)MEMORY[0x270EDD098](a1);
}

void filesec_free(filesec_t a1)
{
}

int filesec_get_property(filesec_t a1, filesec_property_t a2, void *a3)
{
  return MEMORY[0x270EDD0A8](a1, *(void *)&a2, a3);
}

filesec_t filesec_init(void)
{
  return (filesec_t)MEMORY[0x270EDD0B0]();
}

int filesec_set_property(filesec_t a1, filesec_property_t a2, const void *a3)
{
  return MEMORY[0x270EDD0B8](a1, *(void *)&a2, a3);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270EDD658](*(void *)&fd, namebuff, size, *(void *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x270EDD660](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x270EDD668](*(void *)&fd, name, *(void *)&options);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270EDD678](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDD680](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270EDD688](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270EDD698](*(void *)&a1, a2);
}

int fstatx_np(int a1, stat *a2, filesec_t a3)
{
  return MEMORY[0x270EDD0F8](*(void *)&a1, a2, a3);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270EDD6A8](*(void *)&a1, a2);
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270EDD130](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270EDD6D0]();
}

uid_t getuid(void)
{
  return MEMORY[0x270EDD708]();
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270EDD750](path, namebuff, size, *(void *)&options);
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

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB10](ptr, size, type_id);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x270EDD438](*(void *)&uid, uu);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDD178](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDD180](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDD190](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDD8A8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDD8D0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDD8E0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDD938](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDD958](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDD960](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDD970](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDDB28](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDD208](a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDD230](__p, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDD268](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDD9E0](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDD9E8](a1, a2);
}

int statx_np(const char *a1, stat *a2, filesec_t a3)
{
  return MEMORY[0x270EDD288](a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDD2A0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDD2B0](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDD2D8](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDD2E0](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDD2E8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDD2F0](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDD320](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDD340](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDD9F8](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDDA58](a1);
}