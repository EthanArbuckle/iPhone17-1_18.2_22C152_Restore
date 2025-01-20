void start()
{
  char *const *v0;
  char *const *v1;
  int *v2;
  const char *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int *v9;
  int *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  char *v14;
  int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  const char **v20;
  char *v21;
  char *v22;
  char *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  statfs *v28;
  char *f_mntonname;
  int v30;
  const char *v31;
  char *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  signed int v36;
  int v37;
  int v38;
  int v39;
  signed int v40;
  signed int v41;
  unint64_t v42;
  statfs *v43;
  statfs *v44;
  int v45;
  int v46;
  int v47;
  int64_t f_blocks;
  unint64_t f_bsize;
  BOOL v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int64_t f_bavail;
  uint64_t v57;
  int v58;
  statfs *v59;
  uint64_t f_ffree;
  uint64_t f_files;
  int v62;
  uint64_t v63;
  int v64;
  int64x2_t *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int v70;
  int v71;
  int __s1;
  const char **v73;
  int v74;
  statfs *v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int64x2_t v84;
  statfs __src;
  stat v86;
  int v87;
  size_t v88;
  int v89[2];
  int v90;
  int v91;
  int v92[4];
  long long v93;
  uint64_t v94;

  __chkstk_darwin();
  v1 = v0;
  v2 = &dword_100008000;
  dword_100008000 = compat_mode("bin/df", "unix2003");
  if (dword_100008000)
  {
    byte_100008004 = 1;
    v3 = "+abcgHhIiklmnPtT:Y,";
  }
  else
  {
    v3 = "+abcgHhIiklmnPt:T:Y,";
  }
  memset(&v86, 0, sizeof(v86));
  memset(&__src, 0, 512);
  v75 = 0;
  setlocale(0, (const char *)&unk_100003B23);
  v77 = 0;
  v78 = 0;
  v76 = 0;
  v79 = 0;
  bzero(&v80, 0x878uLL);
  v80 = 512;
  __strlcpy_chk();
  v4 = xo_parse_args();
  if (v4 < 0) {
    exit(1);
  }
  v5 = v4;
  v6 = 0;
  v7 = 1;
  v8 = &dword_100008000;
  v9 = &dword_100008000;
  v10 = &dword_100008000;
  while (1)
  {
    while (1)
    {
      v11 = v6;
      v12 = getopt_long(v5, v1, v3, (const option *)&off_100004150, 0);
      if (v12 > 72) {
        break;
      }
      switch(v12)
      {
        case 44:
          byte_100008040 = 1;
          v6 = v11;
          break;
        case 72:
          dword_10000800C = 1;
          v6 = v11;
          break;
        case -1:
          v3 = (const char *)optind;
          v7 = (uint64_t)&v1[optind];
          if (*((void *)v8 + 6) || !v11) {
            goto LABEL_65;
          }
          if (*(void *)v7)
          {
            if (stat(*(const char **)v7, &v86) < 0 && *__error() == 2)
            {
              v23 = *(char **)v7;
              v7 += 8;
              *((void *)v8 + 6) = sub_100002DEC(v23, &dword_100008038);
            }
LABEL_65:
            if (*(void *)v7) {
              goto LABEL_71;
            }
          }
          v24 = getmntinfo(&v75, 2);
          v25 = v24;
          if (qword_100008020 | *((void *)v8 + 6))
          {
            if (v24 < 1) {
              goto LABEL_84;
            }
            v26 = 0;
            v27 = v24;
            v28 = v75;
            f_mntonname = v75->f_mntonname;
            v25 = 0;
            do
            {
              if (!sub_100002F54(f_mntonname - 16))
              {
                v30 = statfs(f_mntonname, &v28[v25]);
                if (byte_100008028 & 1 | (v30 < 0) && v26 != v25)
                {
                  if (v30 < 0) {
                    xo_warnx();
                  }
                  memcpy(&v28[v25], f_mntonname - 88, sizeof(statfs));
                }
                ++v25;
              }
              ++v26;
              f_mntonname += 2168;
            }
            while (v27 != v26);
          }
          else if ((v10[10] & 1) == 0)
          {
            v25 = getmntinfo(&v75, 1);
          }
LABEL_85:
          xo_open_container();
          xo_open_list();
          v31 = *(const char **)v7;
          if (!*(void *)v7)
          {
            LODWORD(v11) = 0;
LABEL_101:
            v76 = 0;
            v77 = 0;
            v79 = 0;
            v78 = 0;
            if (v25 >= 1)
            {
              v68 = v11;
              v34 = 0;
              v35 = 0;
              v36 = 0;
              v37 = 0;
              v38 = 0;
              v39 = 0;
              v40 = 0;
              v41 = 0;
              v69 = v25;
              v42 = qword_100008068;
              do
              {
                v71 = v35;
                __s1 = v37;
                v74 = v36;
                v43 = v75;
                v92[0] = 0;
                if (!v42)
                {
                  getbsize(v92, &qword_100008068);
                  v42 = qword_100008068;
                }
                v44 = &v43[v34];
                v45 = strlen(v44->f_mntfromname);
                if (v41 <= v45) {
                  v41 = v45;
                }
                v70 = v41;
                v46 = strlen(v44->f_fstypename);
                if (v40 <= v46) {
                  v47 = v46;
                }
                else {
                  v47 = v40;
                }
                f_blocks = v44->f_blocks;
                if (f_blocks < 0)
                {
                  xo_warnx();
                  f_blocks = v44->f_blocks;
                  f_bsize = v44->f_bsize;
                  v52 = 1;
                  v42 = qword_100008068;
                }
                else
                {
                  f_bsize = v44->f_bsize;
                  if (f_bsize) {
                    v50 = v42 > f_bsize;
                  }
                  else {
                    v50 = 0;
                  }
                  if (v50) {
                    v51 = f_blocks / (uint64_t)(v42 / f_bsize);
                  }
                  else {
                    v51 = f_bsize / v42 * f_blocks;
                  }
                  v52 = v51 < 1;
                  if (v51)
                  {
                    if (v51 < 0) {
                      v51 = -v51;
                    }
                    do
                    {
                      ++v52;
                      v50 = (unint64_t)v51 > 9;
                      v51 /= 0xAuLL;
                    }
                    while (v50);
                  }
                }
                if (v39 <= v52) {
                  v39 = v52;
                }
                v53 = f_blocks - v43[v34].f_bfree;
                if (v53 < 0)
                {
                  xo_warnx();
                  f_bsize = v44->f_bsize;
                  v42 = qword_100008068;
                  v55 = 1;
                }
                else
                {
                  if (v42 > f_bsize && f_bsize) {
                    v54 = v53 / (uint64_t)(v42 / f_bsize);
                  }
                  else {
                    v54 = f_bsize / v42 * v53;
                  }
                  v55 = v54 < 1;
                  if (v54)
                  {
                    if (v54 < 0) {
                      v54 = -v54;
                    }
                    do
                    {
                      ++v55;
                      v50 = (unint64_t)v54 > 9;
                      v54 /= 0xAuLL;
                    }
                    while (v50);
                  }
                }
                if (v38 <= v55) {
                  v38 = v55;
                }
                f_bavail = v43[v34].f_bavail;
                if (f_bavail < 0)
                {
                  xo_warnx();
                  v42 = qword_100008068;
                  v58 = 1;
                  v40 = v47;
                  v41 = v70;
                  v35 = v71;
                  v36 = v74;
                  v37 = __s1;
                }
                else
                {
                  if (v42 > f_bsize && f_bsize) {
                    v57 = f_bavail / (uint64_t)(v42 / f_bsize);
                  }
                  else {
                    v57 = f_bsize / v42 * f_bavail;
                  }
                  v40 = v47;
                  v41 = v70;
                  v35 = v71;
                  v36 = v74;
                  v37 = __s1;
                  v58 = v57 < 1;
                  if (v57)
                  {
                    if (v57 < 0) {
                      v57 = -v57;
                    }
                    do
                    {
                      ++v58;
                      v50 = (unint64_t)v57 > 9;
                      v57 /= 0xAuLL;
                    }
                    while (v50);
                  }
                }
                if (v37 <= v58) {
                  v37 = v58;
                }
                v59 = &v43[v34];
                f_files = v59->f_files;
                f_ffree = v59->f_ffree;
                v62 = (uint64_t)(f_files - f_ffree) < 1;
                v63 = f_files - f_ffree;
                if (v63)
                {
                  if (v63 < 0) {
                    v63 = -v63;
                  }
                  do
                  {
                    ++v62;
                    v50 = (unint64_t)v63 > 9;
                    v63 /= 0xAuLL;
                  }
                  while (v50);
                }
                if (v36 <= v62) {
                  v36 = v62;
                }
                v64 = f_ffree < 1;
                if (f_ffree)
                {
                  if (f_ffree < 0) {
                    f_ffree = -f_ffree;
                  }
                  do
                  {
                    ++v64;
                    v50 = (unint64_t)f_ffree > 9;
                    f_ffree /= 0xAuLL;
                  }
                  while (v50);
                }
                if (v35 <= v64) {
                  v35 = v64;
                }
                if (byte_100008010 == 1)
                {
                  v65 = (int64x2_t *)&v75[v34];
                  v66 = v65->i32[0] / v80;
                  v81 += v65->i64[1] * v66;
                  v82 += v65[1].i64[0] * v66;
                  v83 += v65[1].i64[1] * v66;
                  v84 = vaddq_s64(v84, v65[2]);
                }
                ++v34;
              }
              while (v34 != v69);
              v67 = 0;
              v77 = __PAIR64__(v38, v39);
              v78 = __PAIR64__(v36, v37);
              v79 = v35;
              v76 = __PAIR64__(v40, v41);
              v9 = &dword_100008000;
              LODWORD(v11) = v68;
              do
                sub_100003058(&v75[v67++].f_bsize, (uint64_t)&v76);
              while (v69 != v67);
            }
            xo_close_list();
            if (*((unsigned char *)v9 + 16) == 1) {
              sub_100003058(&v80, (uint64_t)&v76);
            }
            xo_close_container();
            if (xo_finish() < 0) {
              goto LABEL_168;
            }
LABEL_169:
            exit(v11);
          }
          LODWORD(v11) = 0;
          while (2)
          {
            if (stat(v31, &v86) < 0)
            {
              v32 = sub_100002EDC(*(const char **)v7);
              if (v32) {
                goto LABEL_95;
              }
            }
            else
            {
              if ((v86.st_mode & 0xB000 | 0x4000) == 0x6000)
              {
                v32 = sub_100002EDC(*(const char **)v7);
                if (!v32)
                {
                  xo_warnx();
                  goto LABEL_99;
                }
              }
              else
              {
                v32 = *(char **)v7;
              }
LABEL_95:
              if ((statfs(v32, &__src) & 0x80000000) == 0)
              {
                if (!sub_100002F54(__src.f_fstypename))
                {
                  memcpy(&v75[v25++], &__src, sizeof(statfs));
                  goto LABEL_100;
                }
LABEL_99:
                LODWORD(v11) = 1;
LABEL_100:
                v33 = *(const char **)(v7 + 8);
                v7 += 8;
                v31 = v33;
                if (!v33) {
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          xo_warn();
          goto LABEL_99;
        default:
LABEL_69:
          xo_error();
          exit(64);
      }
    }
    v6 = v11;
    switch(v12)
    {
      case 'P':
      case 'b':
        if (*v2) {
          byte_100008004 = 0;
        }
        v6 = v11;
        if (dword_100008008) {
          continue;
        }
        v13 = "512";
LABEL_31:
        setenv("BLOCKSIZE", v13, 1);
        dword_10000800C = 0;
        v6 = v11;
        continue;
      case 'Q':
      case 'R':
      case 'S':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'd':
      case 'e':
      case 'f':
      case 'j':
        goto LABEL_69;
      case 'T':
        goto LABEL_19;
      case 'Y':
        byte_10000803C = 1;
        v6 = v11;
        continue;
      case 'a':
        continue;
      case 'c':
        *((unsigned char *)v9 + 16) = 1;
        v6 = v11;
        continue;
      case 'g':
        v13 = "1g";
        goto LABEL_31;
      case 'h':
        dword_10000800C = 2;
        v6 = v11;
        continue;
      case 'i':
        byte_100008004 = 1;
        v6 = v11;
        continue;
      case 'k':
        ++dword_100008008;
        v13 = "1024";
        goto LABEL_31;
      case 'l':
        v6 = v11;
        if (byte_100008014) {
          continue;
        }
        v94 = 0;
        *(_OWORD *)v92 = 0u;
        v93 = 0u;
        v87 = 0;
        *(void *)v89 = 3;
        v90 = 1;
        v88 = 4;
        if (sysctl(v89, 3u, &v87, &v88, 0, 0))
        {
          xo_warn();
LABEL_29:
          v14 = 0;
          goto LABEL_57;
        }
        v73 = (const char **)malloc_type_malloc(8 * v87, 0x10040436913F5uLL);
        if (!v73)
        {
          xo_warnx();
          goto LABEL_29;
        }
        v88 = 40;
        v90 = 2;
        if (v87 < 1) {
          goto LABEL_55;
        }
        v15 = 0;
        LODWORD(v16) = 0;
        do
        {
          v91 = v15;
          if (sysctl(v89, 4u, v92, &v88, 0, 0))
          {
            if (*__error() != 45) {
              xo_warn();
            }
          }
          else if ((BYTE13(v93) & 0x10) == 0)
          {
            v17 = strdup((const char *)&v92[1]);
            v73[(int)v16] = v17;
            if (!v17) {
              goto LABEL_54;
            }
            LODWORD(v16) = v16 + 1;
          }
          ++v15;
        }
        while (v15 < v87);
        if (!v16) {
          goto LABEL_55;
        }
        v18 = (char *)malloc_type_malloc(33 * (int)v16 + 2, 0x100004077774924uLL);
        if (v18)
        {
          v14 = v18;
          *(_WORD *)v18 = 28526;
          v19 = v18 + 2;
          if ((int)v16 >= 1)
          {
            v16 = v16;
            v20 = v73;
            do
            {
              strlcpy(v19, *v20, 0x20uLL);
              v21 = &v19[strlen(*v20)];
              *v21 = 44;
              v19 = v21 + 1;
              v22 = (char *)*v20++;
              free(v22);
              --v16;
            }
            while (v16);
          }
          *(v19 - 1) = 0;
          free(v73);
          v9 = &dword_100008000;
          v10 = &dword_100008000;
        }
        else
        {
          if ((int)v16 >= 1) {
LABEL_54:
          }
            xo_warnx();
LABEL_55:
          free(v73);
          v14 = 0;
        }
        v2 = &dword_100008000;
LABEL_57:
        qword_100008020 = (uint64_t)sub_100002DEC(v14, &dword_100008018);
        byte_100008014 = 1;
        v6 = v11;
        v8 = &dword_100008000;
        break;
      case 'm':
        v13 = "1m";
        goto LABEL_31;
      case 'n':
        *((unsigned char *)v10 + 40) = 1;
        v6 = v11;
        continue;
      default:
        if (v12 == 73)
        {
          byte_100008004 = 0;
          v6 = v11;
        }
        else
        {
          if (v12 != 116) {
            goto LABEL_69;
          }
          v6 = 1;
          if (!*v2)
          {
LABEL_19:
            if (*((void *)v8 + 6))
            {
              xo_errx();
LABEL_71:
              v75 = (statfs *)malloc_type_malloc(2168 * (v5 - (void)v3), 0x100004087E0324AuLL);
              if (!v75)
              {
LABEL_168:
                xo_err();
                goto LABEL_169;
              }
LABEL_84:
              v25 = 0;
              goto LABEL_85;
            }
            *((void *)v8 + 6) = sub_100002DEC(optarg, &dword_100008038);
            v6 = v11;
          }
        }
        continue;
    }
  }
}

void *sub_100002DEC(char *a1, _DWORD *a2)
{
  if (!a1) {
    return 0;
  }
  v2 = a1;
  *a2 = 0;
  if (*a1 == 110 && a1[1] == 111)
  {
    v2 = a1 + 2;
    *a2 = 1;
  }
  int v3 = 0;
  for (i = v2; *i == 44; ++i)
  {
    ++v3;
LABEL_10:
    ;
  }
  if (*i) {
    goto LABEL_10;
  }
  v5 = malloc_type_malloc(8 * (v3 + 2), 0x10040436913F5uLL);
  v6 = v5;
  if (v5)
  {
    void *v5 = v2;
    v7 = strchr(v2, 44);
    uint64_t v8 = 1;
    if (v7)
    {
      do
      {
        char *v7 = 0;
        v9 = v7 + 1;
        uint64_t v10 = v8 + 1;
        v6[v8] = v9;
        v7 = strchr(v9, 44);
        uint64_t v8 = v10;
      }
      while (v7);
      uint64_t v8 = v10;
    }
    v6[v8] = 0;
  }
  else
  {
    xo_warnx();
  }
  return v6;
}

char *sub_100002EDC(const char *a1)
{
  v6 = 0;
  int v2 = getmntinfo(&v6, 2);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  for (i = v6->f_mntfromname; strcmp(i, a1); i += 2168)
  {
    if (!--v3) {
      return 0;
    }
  }
  return i - 1024;
}

uint64_t sub_100002F54(char *__s1)
{
  if (qword_100008030)
  {
    uint64_t v2 = dword_100008038;
    uint64_t v3 = *(const char **)qword_100008030;
    if (*(void *)qword_100008030)
    {
      v4 = (const char **)(qword_100008030 + 8);
      while (strcmp(__s1, v3))
      {
        v5 = *v4++;
        uint64_t v3 = v5;
        if (!v5) {
          goto LABEL_6;
        }
      }
      uint64_t v6 = v2;
    }
    else
    {
LABEL_6:
      uint64_t v6 = v2 == 0;
    }
    if (qword_100008020)
    {
      int v10 = dword_100008018;
      v11 = *(const char **)qword_100008020;
      if (*(void *)qword_100008020)
      {
        v12 = (const char **)(qword_100008020 + 8);
        while (strcmp(__s1, v11))
        {
          v13 = *v12++;
          v11 = v13;
          if (!v13) {
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        int v10 = v10 == 0;
      }
      if (v10 == v2) {
        return v2;
      }
      else {
        return v6;
      }
    }
  }
  else if (qword_100008020)
  {
    uint64_t v6 = dword_100008018;
    v7 = *(const char **)qword_100008020;
    if (*(void *)qword_100008020)
    {
      uint64_t v8 = (const char **)(qword_100008020 + 8);
      while (strcmp(__s1, v7))
      {
        v9 = *v8++;
        v7 = v9;
        if (!v9) {
          return v6 == 0;
        }
      }
    }
    else
    {
      return v6 == 0;
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

uint64_t sub_100003058(unsigned int *a1, uint64_t a2)
{
  if (!dword_100008054++)
  {
    *(int32x2_t *)a2 = vmax_s32(*(int32x2_t *)a2, (int32x2_t)0x40000000ALL);
    if (byte_100008040 == 1)
    {
      int32x4_t v5 = *(int32x4_t *)(a2 + 8);
      v6.i64[0] = -1;
      v6.i64[1] = -1;
      int32x4_t v7 = vaddq_s32(v5, v6);
      int32x4_t v8 = vdupq_n_s32(0x55555556u);
      uint32x4_t v9 = (uint32x4_t)vuzp2q_s32((int32x4_t)vmull_s32(*(int32x2_t *)v7.i8, *(int32x2_t *)v8.i8), (int32x4_t)vmull_high_s32(v7, v8));
      *(int32x4_t *)(a2 + 8) = vaddq_s32((int32x4_t)vsraq_n_u32(v9, v9, 0x1FuLL), v5);
      *(_DWORD *)(a2 + 24) += (*(_DWORD *)(a2 + 24) - 1) / 3;
    }
    if (dword_10000800C)
    {
      qword_100008058 = (uint64_t)"   Size";
      *(_DWORD *)(a2 + 8) = 7;
      int32x2_t v10 = (int32x2_t)0x700000007;
      int v11 = 1;
    }
    else
    {
      qword_100008058 = (uint64_t)getbsize(&dword_100008050, &qword_100008048);
      int v12 = *(_DWORD *)(a2 + 8);
      if (v12 <= dword_100008050) {
        int v12 = dword_100008050;
      }
      *(_DWORD *)(a2 + 8) = v12;
      int v11 = dword_10000800C;
      int32x2_t v10 = *(int32x2_t *)(a2 + 12);
    }
    if (dword_100008000) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13) {
      __int32 v14 = 9;
    }
    else {
      __int32 v14 = 5;
    }
    v15.i32[0] = 4;
    v15.i32[1] = v14;
    *(int32x2_t *)(a2 + 12) = vmax_s32(v10, v15);
    xo_emit();
    if (byte_10000803C == 1) {
      xo_emit();
    }
    xo_emit();
    if (byte_100008004 == 1)
    {
      int v16 = 7;
      if (dword_10000800C)
      {
        int v17 = 0;
      }
      else
      {
        int v17 = *(_DWORD *)(a2 + 24);
        if (*(int *)(a2 + 20) <= 7) {
          int v16 = 7;
        }
        else {
          int v16 = *(_DWORD *)(a2 + 20);
        }
      }
      if (v17 <= 5) {
        int v17 = 5;
      }
      *(_DWORD *)(a2 + 20) = v16;
      *(_DWORD *)(a2 + 24) = v17;
      xo_emit();
    }
    xo_emit();
  }
  xo_open_instance();
  if (!*a1)
  {
    xo_warnx();
    *a1 = 512;
  }
  xo_emit();
  if (byte_10000803C == 1) {
    xo_emit();
  }
  if (*((void *)a1 + 1) <= *((void *)a1 + 2))
  {
    unint64_t v18 = 0;
  }
  else
  {
    int v23 = 0;
    if (!qword_100008060) {
      getbsize(&v23, &qword_100008060);
    }
    v21[2] = 0;
    memset(v22, 0, sizeof(v22));
    v21[0] = 5;
    v21[1] = 2155872256;
    if (getattrlist((const char *)a1 + 88, v21, v22, 0xCuLL, 0))
    {
      if (*__error() != 22) {
        xo_warn();
      }
      unint64_t v18 = *((void *)a1 + 1) - *((void *)a1 + 2);
    }
    else
    {
      unint64_t v19 = *a1;
      if (!v19) {
        unint64_t v19 = qword_100008060;
      }
      unint64_t v18 = *(void *)&v22[4] / v19;
    }
  }
  if (dword_10000800C)
  {
    sub_100003784();
    sub_100003784();
    sub_100003784();
  }
  else
  {
    if ((*((void *)a1 + 1) & 0x8000000000000000) != 0) {
      xo_warnx();
    }
    if ((v18 & 0x8000000000000000) != 0) {
      xo_warnx();
    }
    if ((*((void *)a1 + 3) & 0x8000000000000000) != 0) {
      xo_warnx();
    }
    xo_emit();
  }
  xo_emit();
  if (byte_100008004 == 1)
  {
    if (dword_10000800C)
    {
      xo_emit();
      sub_100003700();
      sub_100003700();
    }
    else
    {
      xo_emit();
    }
  }
  xo_emit();
  if (strncmp((const char *)a1 + 1112, "total", 0x400uLL)) {
    xo_emit();
  }
  xo_emit();
  return xo_close_instance();
}

uint64_t sub_100003700()
{
  return xo_emit();
}

uint64_t sub_100003784()
{
  return xo_emit();
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void bzero(void *a1, size_t a2)
{
}

BOOL compat_mode(const char *function, const char *mode)
{
  return _compat_mode(function, mode);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

char *__cdecl getbsize(int *a1, uint64_t *a2)
{
  return _getbsize(a1, a2);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

uint64_t humanize_number()
{
  return _humanize_number();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return _setlocale(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
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

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

uint64_t xo_attr()
{
  return _xo_attr();
}

uint64_t xo_close_container()
{
  return _xo_close_container();
}

uint64_t xo_close_instance()
{
  return _xo_close_instance();
}

uint64_t xo_close_list()
{
  return _xo_close_list();
}

uint64_t xo_emit()
{
  return _xo_emit();
}

uint64_t xo_err()
{
  return _xo_err();
}

uint64_t xo_error()
{
  return _xo_error();
}

uint64_t xo_errx()
{
  return _xo_errx();
}

uint64_t xo_finish()
{
  return _xo_finish();
}

uint64_t xo_open_container()
{
  return _xo_open_container();
}

uint64_t xo_open_instance()
{
  return _xo_open_instance();
}

uint64_t xo_open_list()
{
  return _xo_open_list();
}

uint64_t xo_parse_args()
{
  return _xo_parse_args();
}

uint64_t xo_warn()
{
  return _xo_warn();
}

uint64_t xo_warnx()
{
  return _xo_warnx();
}