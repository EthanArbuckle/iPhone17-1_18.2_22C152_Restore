uint64_t change_file_date(const char *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  tm v7;
  utimbuf v8;

  v4 = *(_DWORD *)(a3 + 16);
  v5 = *(_DWORD *)(a3 + 20);
  if (v5 > 0x76C) {
    v5 -= 1900;
  }
  *(_OWORD *)&v7.tm_sec = *(_OWORD *)a3;
  memset(&v7.tm_wday, 0, 32);
  v7.tm_mon = v4;
  v7.tm_year = v5;
  v7.tm_isdst = -1;
  v8.actime = mktime(&v7);
  v8.modtime = v8.actime;
  return utime(a1, &v8);
}

uint64_t mymkdir()
{
  return 0;
}

uint64_t makedir(const char *a1)
{
  int v2 = strlen(a1);
  if (v2 < 1) {
    return 0;
  }
  v3 = (char *)malloc_type_malloc(v2 + 1, 0x95F0DC6AuLL);
  if (v3)
  {
    v4 = strcpy(v3, a1);
    free(v4);
    return 1;
  }
  else
  {
    puts("Error allocating memory");
    return 4294967192;
  }
}

uint64_t do_banner()
{
  puts("MiniUnz 1.01b, demo of zLib + Unz package written by Gilles Vollant");

  return puts("more info at http://www.winimage.com/zLibDll/unzip.html\n");
}

uint64_t do_help()
{
  return puts("Usage : miniunz [-e] [-x] [-v] [-l] [-o] [-p password] file.zip [file_to_extr.] [-d extractdir]\n\n  -e  Extract without pathname (junk paths)\n  -x  Extract with pathname\n  -v  list files\n  -l  list files\n  -d  directory to extract into\n  -o  overwrite files without prompting\n  -p  extract crypted file using password\n");
}

uint64_t do_list(void *a1)
{
  long long v19 = 0uLL;
  int GlobalInfo = unzGetGlobalInfo((uint64_t)a1, &v19);
  if (GlobalInfo) {
    printf("error %d with zipfile in unzGetGlobalInfo \n", GlobalInfo);
  }
  puts(" Length  Method   Size  Ratio   Date    Time   CRC-32     Name");
  puts(" ------  ------   ----  -----   ----    ----   ------     ----");
  if ((void)v19)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      if (unzGetCurrentFileInfo((uint64_t)a1, (uint64_t)&v10, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0))
      {
        printf("error %d with zipfile in unzGetCurrentFileInfo\n");
        return 0;
      }
      if (*((void *)&v13 + 1)) {
        unint64_t v4 = (unint64_t)(100 * v13) / *((void *)&v13 + 1);
      }
      else {
        unint64_t v4 = 0;
      }
      if (v11) {
        uint64_t v5 = 42;
      }
      else {
        uint64_t v5 = 32;
      }
      if (*((void *)&v11 + 1))
      {
        if (*((void *)&v11 + 1) == 12)
        {
          v7 = "BZip2 ";
        }
        else if (*((void *)&v11 + 1) == 8)
        {
          unsigned int v6 = (v11 >> 1) & 3;
          if (v6)
          {
            if (v6 == 1)
            {
              v7 = "Defl:X";
            }
            else
            {
              v7 = "Defl:F";
              if ((v11 & 4) == 0) {
                v7 = "Unkn. ";
              }
            }
          }
          else
          {
            v7 = "Defl:N";
          }
        }
        else
        {
          v7 = "Unkn. ";
        }
      }
      else
      {
        v7 = "Stored";
      }
      printf("%7lu  %6s%c%7lu %3lu%%  %2.2lu-%2.2lu-%2.2lu  %2.2lu:%2.2lu  %8.8lx   %s\n", *((void *)&v13 + 1), v7, v5, (void)v13, v4, v18 + 1, HIDWORD(v17), HIDWORD(v18) % 0x64, DWORD2(v17), DWORD1(v17), *((void *)&v12 + 1), v20);
      ++v3;
      unint64_t v8 = v19;
      if (v3 < (unint64_t)v19)
      {
        if (unzGoToNextFile(a1))
        {
          printf("error %d with zipfile in unzGoToNextFile\n");
          return 0;
        }
        unint64_t v8 = v19;
      }
    }
    while (v3 < v8);
  }
  return 0;
}

uint64_t do_extract_currentfile(uint64_t a1, int *a2, _DWORD *a3, unsigned char *a4)
{
  uint64_t v29 = 0;
  long long v28 = 0u;
  memset(v27, 0, sizeof(v27));
  uint64_t CurrentFileInfo = unzGetCurrentFileInfo(a1, (uint64_t)v27, (uint64_t)&v32, 0x100uLL, 0, 0, 0, 0);
  if (CurrentFileInfo)
  {
    uint64_t v9 = CurrentFileInfo;
    printf("error %d with zipfile in unzGetCurrentFileInfo\n", CurrentFileInfo);
    return v9;
  }
  long long v10 = malloc_type_malloc(0x2000uLL, 0xC6AAB06EuLL);
  if (!v10)
  {
    puts("Error allocating memory");
    return 4294967192;
  }
  long long v11 = v10;
  long long v12 = &v32;
  for (i = v33; ; ++i)
  {
    int v14 = *(i - 1);
    if (v14 != 47 && v14 != 92) {
      break;
    }
    long long v12 = i;
LABEL_10:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_10;
  }
  int v15 = *a2;
  if (*v12)
  {
    if (v15) {
      long long v16 = v12;
    }
    else {
      long long v16 = &v32;
    }
    uint64_t v17 = unzOpenCurrentFilePassword(a1, a4);
    uint64_t v9 = v17;
    if (v17) {
      printf("error %d with zipfile in unzOpenCurrentFilePassword\n", v17);
    }
    if (!(*a3 | v9))
    {
      long long v19 = fopen(v16, "rb");
      if (v19)
      {
        fclose(v19);
        while (1)
        {
          printf("The file %s exists. Overwrite ? [y]es, [n]o, [A]ll: ", v16);
          if (scanf("%1s", &v30) != 1) {
            exit(1);
          }
          char v20 = v30;
          if (v30 - 97 < 0x1A) {
            char v20 = v30 - 32;
          }
          if (v20 == 89) {
            break;
          }
          if (v20 == 78)
          {
            int v18 = 1;
            goto LABEL_19;
          }
          if (v20 == 65)
          {
            int v18 = 0;
            *a3 = 1;
            goto LABEL_19;
          }
        }
      }
    }
    int v18 = 0;
LABEL_19:
    if (v18 | v9)
    {
LABEL_20:
      if (!v9) {
        goto LABEL_49;
      }
LABEL_47:
      unzCloseCurrentFile(a1);
    }
    else
    {
      v21 = fopen(v16, "wb");
      if (!v21)
      {
        if (*a2
          || v12 == &v32
          || (char v23 = *(v12 - 1), *(v12 - 1) = 0, makedir(v16), *(v12 - 1) = v23, (v21 = fopen(v16, "wb")) == 0))
        {
          printf("error opening %s\n", v16);
          goto LABEL_20;
        }
      }
      printf(" extracting: %s\n", v16);
      while (1)
      {
        uint64_t CurrentFile = unzReadCurrentFile(a1, (uint64_t)v11, 0x2000u);
        uint64_t v9 = CurrentFile;
        if ((CurrentFile & 0x80000000) != 0)
        {
          printf("error %d with zipfile in unzReadCurrentFile\n", CurrentFile);
          goto LABEL_46;
        }
        if (!CurrentFile) {
          break;
        }
        if (fwrite(v11, CurrentFile, 1uLL, v21) != 1)
        {
          puts("error in writing extracted file");
          uint64_t v9 = 0xFFFFFFFFLL;
LABEL_46:
          fclose(v21);
          goto LABEL_47;
        }
      }
      fclose(v21);
      long long v30 = v28;
      uint64_t v31 = v29;
      change_file_date(v16, v24, (uint64_t)&v30);
LABEL_49:
      uint64_t v25 = unzCloseCurrentFile(a1);
      uint64_t v9 = v25;
      if (v25) {
        printf("error %d with zipfile in unzCloseCurrentFile\n", v25);
      }
    }
  }
  else
  {
    if (!v15) {
      printf("creating directory: %s\n", &v32);
    }
    uint64_t v9 = 0;
  }
  free(v11);
  return v9;
}

uint64_t do_extract(void *a1, int a2, int a3, unsigned char *a4)
{
  int v12 = a3;
  int v13 = a2;
  long long v11 = 0uLL;
  int GlobalInfo = unzGetGlobalInfo((uint64_t)a1, &v11);
  if (GlobalInfo) {
    printf("error %d with zipfile in unzGetGlobalInfo \n", GlobalInfo);
  }
  if ((void)v11)
  {
    unint64_t v7 = 0;
    while (!do_extract_currentfile((uint64_t)a1, &v13, &v12, a4))
    {
      ++v7;
      unint64_t v8 = v11;
      if (v7 < (unint64_t)v11)
      {
        int File = unzGoToNextFile(a1);
        if (File)
        {
          printf("error %d with zipfile in unzGoToNextFile\n", File);
          return 0;
        }
        unint64_t v8 = v11;
      }
      if (v7 >= v8) {
        return 0;
      }
    }
  }
  return 0;
}

uint64_t do_extract_onefile(uint64_t a1, char *a2, int a3, int a4, unsigned char *a5)
{
  int v9 = a4;
  int v10 = a3;
  if (!unzLocateFile(a1, a2, 0)) {
    return do_extract_currentfile(a1, &v10, &v9, a5) != 0;
  }
  printf("file %s not found in the zipfile\n", a2);
  return 2;
}

int main(int argc, const char **argv, const char **envp)
{
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  *(_OWORD *)__dst = 0u;
  puts("MiniUnz 1.01b, demo of zLib + Unz package written by Gilles Vollant");
  puts("more info at http://www.winimage.com/zLibDll/unzip.html\n");
  if (argc != 1)
  {
    if (argc < 2)
    {
      int v13 = 0;
    }
    else
    {
      unsigned int v6 = 0;
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      int v10 = 0;
      long long v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 1;
      do
      {
        int v15 = argv[v14];
        if (*v15 == 45)
        {
          char v16 = v15[1];
          if (v16)
          {
            uint64_t v17 = (unsigned __int8 *)(v15 + 2);
            do
            {
              int v18 = v16 & 0xDF;
              if (v18 == 76 || v18 == 86) {
                int v10 = 1;
              }
              if (v18 == 69) {
                int v9 = 1;
              }
              if (v18 == 79) {
                int v8 = 1;
              }
              if (v18 == 80)
              {
                uint64_t v20 = v14 + 1;
                if ((int)v20 < argc)
                {
                  long long v11 = (char *)argv[v20];
                  ++v14;
                }
              }
              else if (v18 == 68)
              {
                unsigned int v6 = argv[v14 + 1];
                int v7 = 1;
              }
              int v21 = *v17++;
              char v16 = v21;
            }
            while (v21);
          }
        }
        else
        {
          if (v12) {
            BOOL v22 = 0;
          }
          else {
            BOOL v22 = v7 == 0;
          }
          if (v22) {
            char v23 = argv[v14];
          }
          else {
            char v23 = v12;
          }
          if (v22) {
            int v24 = 0;
          }
          else {
            int v24 = v7;
          }
          BOOL v25 = v13 == 0;
          if (v13) {
            int v12 = (char *)v23;
          }
          else {
            int v13 = argv[v14];
          }
          if (!v25) {
            int v7 = v24;
          }
        }
        ++v14;
      }
      while (v14 < argc);
      if (v13)
      {
        strncpy(__dst, v13, 0xFFuLL);
        LOBYTE(v44) = 0;
        v26 = unzOpen((uint64_t)v13);
        if (v26 || (__strcat_chk(), (v26 = unzOpen((uint64_t)__dst)) != 0))
        {
          printf("%s opened\n", __dst);
          if (v10 == 1)
          {
            do_list(v26);
          }
          else
          {
            if (v7 && chdir(v6))
            {
              printf("Error changing into %s, aborting\n", v6);
              exit(-1);
            }
            if (v12)
            {
              int onefile = do_extract_onefile((uint64_t)v26, v12, v9, v8, v11);
LABEL_53:
              unzClose((uint64_t)v26);
              return onefile;
            }
            do_extract(v26, v9, v8, v11);
          }
          int onefile = 0;
          goto LABEL_53;
        }
      }
    }
    printf("Cannot open %s or %s.zip\n", v13, v13);
    return 1;
  }
  puts("Usage : miniunz [-e] [-x] [-v] [-l] [-o] [-p password] file.zip [file_to_extr.] [-d extractdir]\n\n  -e  Extract without pathname (junk paths)\n  -x  Extract with pathname\n  -v  list files\n  -l  list files\n  -d  directory to extract into\n  -o  overwrite files without prompting\n  -p  extract crypted file using password\n");
  return 0;
}

void sub_5BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 192));
  _Unwind_Resume(a1);
}

void sub_5DC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t unzRepair()
{
  v0 = (const char *)__chkstk_darwin();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  unsigned int v6 = v5;
  int v8 = v7;
  int v9 = fopen(v0, "rb");
  int v10 = fopen(v8, "wb");
  uint64_t v11 = fopen(v6, "wb");
  uint64_t v12 = 4294967294;
  if (!v9 || !v10) {
    return v12;
  }
  int v13 = v11;
  __filename = (const std::__fs::filesystem::path *)v6;
  if (fread(&__ptr, 1uLL, 0x1EuLL, v9) != 30)
  {
    int v16 = 0;
    uint64_t v44 = 0;
    unsigned int v21 = 0;
    unsigned int v30 = 0;
LABEL_30:
    unsigned int v31 = 0;
    goto LABEL_42;
  }
  unsigned int v14 = 0;
  int v15 = 0;
  uint64_t v44 = 0;
  int v16 = 0;
  v17.i64[1] = -63738;
  __stream = v9;
  long long v41 = v13;
  while (1)
  {
    unsigned int v48 = v14;
    if (__ptr != 67324752)
    {
      unsigned int v31 = 0;
      unsigned int v21 = v15;
      goto LABEL_41;
    }
    v17.i64[0] = v78;
    int8x16_t v45 = v17;
    __int16 v46 = v79;
    __int32 v47 = v80;
    int v55 = v82;
    int v56 = v81;
    int v53 = v84;
    int v54 = v83;
    int v51 = v86;
    int v52 = v85;
    int v49 = v88;
    int v50 = v87;
    int v18 = v89;
    int v19 = v90;
    int v57 = v92;
    int v58 = v91;
    v75[0] = 0;
    v76[0] = 0;
    if (fwrite(&__ptr, 1uLL, 0x1EuLL, v10) != 30)
    {
      unsigned int v31 = -1;
      unsigned int v21 = v15;
      goto LABEL_40;
    }
    size_t v20 = v18 | (v19 << 8);
    unsigned int v21 = v15 + 30;
    if (!v20)
    {
      unsigned int v31 = -2;
      goto LABEL_40;
    }
    if (fread(v76, 1uLL, v18 | (v19 << 8), v9) != v20
      || fwrite(v76, 1uLL, v18 | (v19 << 8), v10) != v20)
    {
LABEL_31:
      unsigned int v31 = -1;
      goto LABEL_40;
    }
    int v42 = v15;
    size_t v22 = v58 | (v57 << 8);
    v21 += v20;
    if (v22)
    {
      if (fread(v75, 1uLL, v58 | (v57 << 8), v9) != v22
        || fwrite(v75, 1uLL, v22, v10) != v22)
      {
        goto LABEL_31;
      }
      v21 += v22;
    }
    unsigned int v23 = v56 | (v55 << 8) | (v54 << 16) | (v53 << 24);
    if (v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v52 | (v51 << 8) | (v50 << 16) | (v49 << 24);
    }
    if ((int)v24 < 1) {
      goto LABEL_22;
    }
    int v39 = v16;
    BOOL v25 = v4;
    v26 = v2;
    v27 = malloc_type_malloc(v24, 0xD877797DuLL);
    if (!v27) {
      break;
    }
    long long v28 = v27;
    if (v24 != fread(v27, 1uLL, v24, __stream)
      || v24 != fwrite(v28, 1uLL, v24, v10))
    {
      free(v28);
      unsigned int v31 = -1;
      goto LABEL_39;
    }
    v21 += v24;
    v44 += v24;
    free(v28);
    uint64_t v2 = v26;
    unint64_t v4 = v25;
    int v16 = v39;
LABEL_22:
    int v59 = 33639248;
    int8x16_t v29 = vqtbl1q_s8(v45, (int8x16_t)xmmword_E090);
    v29.i16[5] = v46;
    v29.i32[3] = v47;
    v29.i16[1] = v29.i16[0];
    int8x16_t v60 = v29;
    LOBYTE(v61) = v56;
    HIBYTE(v61) = v55;
    char v62 = v54;
    char v63 = v53;
    char v64 = v52;
    char v65 = v51;
    char v66 = v50;
    char v67 = v49;
    char v68 = v18;
    char v69 = v19;
    char v70 = v58;
    char v71 = v57;
    uint64_t v72 = 0;
    __int16 v73 = 0;
    int v74 = v42;
    int v13 = v41;
    int v9 = __stream;
    if (fwrite(&v59, 1uLL, 0x2EuLL, v41) != 46)
    {
      unsigned int v14 = v48;
LABEL_37:
      unsigned int v30 = v14;
      unsigned int v31 = -1;
      goto LABEL_42;
    }
    unsigned int v14 = v48 + 46;
    if (fwrite(v76, 1uLL, v20, v41) != v20) {
      goto LABEL_37;
    }
    v14 += v20;
    if (v22)
    {
      if (fwrite(v75, 1uLL, v22, v41) != v22) {
        goto LABEL_37;
      }
      v14 += v22;
    }
    ++v16;
    int v15 = v21;
    if (fread(&__ptr, 1uLL, 0x1EuLL, __stream) != 30)
    {
      unsigned int v30 = v14;
      goto LABEL_30;
    }
  }
  unsigned int v31 = -4;
LABEL_39:
  uint64_t v2 = v26;
  unint64_t v4 = v25;
  int v9 = __stream;
  int v16 = v39;
LABEL_40:
  int v13 = v41;
LABEL_41:
  unsigned int v30 = v48;
LABEL_42:
  int v59 = 101010256;
  if (v16 >= 0xFFFF) {
    __int16 v32 = -1;
  }
  else {
    __int16 v32 = v16;
  }
  v60.i32[0] = 0;
  v60.i16[2] = v32;
  v60.i16[3] = v32;
  v60.i64[1] = __PAIR64__(v21, v30);
  __int16 v61 = 0;
  if (fwrite(&v59, 1uLL, 0x16uLL, v13) == 22) {
    uint64_t v12 = v31;
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  fclose(v13);
  if (!v12)
  {
    int v33 = v16;
    long long v34 = fopen((const char *)__filename, "rb");
    if (v34)
    {
      long long v35 = v34;
      while (1)
      {
        int v36 = fread(&v59, 1uLL, 0x2000uLL, v35);
        if (v36 < 1) {
          break;
        }
        if (fwrite(&v59, 1uLL, v36, v10) != v36)
        {
          uint64_t v12 = 0xFFFFFFFFLL;
          goto LABEL_56;
        }
      }
      uint64_t v12 = 0;
LABEL_56:
      fclose(v35);
    }
    else
    {
      uint64_t v12 = 0;
    }
    int v16 = v33;
  }
  fclose(v9);
  fclose(v10);
  remove(__filename, v37);
  if (!v12)
  {
    if (v4) {
      void *v4 = v16;
    }
    if (v2) {
      *uint64_t v2 = v44;
    }
  }
  return v12;
}

void sub_6E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t unzStringFileNameCompare(const char *a1, const char *a2, unsigned int a3)
{
  if (a3 < 2) {
    return strcmp(a1, a2);
  }
  while (1)
  {
    int v5 = *(unsigned __int8 *)a1++;
    int v4 = v5;
    int v7 = *(unsigned __int8 *)a2++;
    int v6 = v7;
    if ((v4 - 97) < 0x1A) {
      LOBYTE(v4) = v4 - 32;
    }
    if ((v6 - 97) < 0x1A) {
      LOBYTE(v6) = v6 - 32;
    }
    if (!(_BYTE)v4) {
      break;
    }
    if (!(_BYTE)v6) {
      return 1;
    }
    if ((char)v4 < (char)v6) {
      return 0xFFFFFFFFLL;
    }
    if ((char)v4 > (char)v6) {
      return 1;
    }
  }
  if ((_BYTE)v6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void *unzOpen2(uint64_t a1, _OWORD *a2)
{
  memset(__src, 0, 336);
  if (a2)
  {
    long long v3 = a2[1];
    __src[0] = *a2;
    __src[1] = v3;
    long long v4 = a2[3];
    __src[2] = a2[2];
    __src[3] = v4;
    uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&v4 + 1), a1, 5);
  }
  else
  {
    fill_fopen_filefunc((FILE *(**)(int, char *, char))__src);
    uint64_t v5 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&__src[3] + 1), a1, 5);
  }
  int v6 = (void *)v5;
  *(void *)&__src[4] = v5;
  if (v5)
  {
    if (!(*(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[2])(*((void *)&__src[3] + 1), v5, 0, 2))
    {
      unint64_t v7 = (*((uint64_t (**)(void, void *))&__src[1] + 1))(*((void *)&__src[3] + 1), v6);
      unint64_t v8 = v7;
      unint64_t v9 = v7 >= 0xFFFF ? 0xFFFFLL : v7;
      int v10 = (char *)malloc_type_malloc(0x404uLL, 0x502D75B4uLL);
      if (v10)
      {
        uint64_t v11 = v10;
        if (v9 >= 5)
        {
          uint64_t v12 = v10 + 1;
          uint64_t v13 = 4;
          do
          {
            unint64_t v14 = v13 + 1024;
            unint64_t v15 = v13 + 1024 >= v9 ? v9 : v13 + 1024;
            unint64_t v16 = v15 >= 0x404 ? 1028 : v15;
            if ((*(uint64_t (**)(void, void *, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), v6, v8 - v15, 0)|| (*((uint64_t (**)(void, void *, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v6, v11, v16) != v16)
            {
              break;
            }
            if (v16 >= 4)
            {
              uint64_t v17 = (v16 - 4);
              while (v11[v17] != 80 || v12[v17] != 75 || v12[v17 + 1] != 5 || v12[v17 + 2] != 6)
              {
                if (v17-- <= 0) {
                  goto LABEL_28;
                }
              }
              if (v8 - v15 + v17)
              {
                free(v11);
                unint64_t v19 = v13 + 1024;
                if (v8 < v13 + 1024) {
                  unint64_t v19 = v8;
                }
                if (v19 >= 0xFFFF) {
                  unint64_t v19 = 0xFFFFLL;
                }
                unint64_t v20 = v8 - v19 + v17;
                int v37 = 1;
                goto LABEL_38;
              }
            }
LABEL_28:
            uint64_t v13 = v15;
          }
          while (v9 > v14);
        }
        free(v11);
      }
    }
    unint64_t v20 = 0;
    int v37 = 0;
LABEL_38:
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v38 = 0;
    uint64_t v33 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v20, 0);
    int Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v41);
    int Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v40);
    int v36 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v39);
    int v21 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], (void *)&__src[4] + 1);
    int v22 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v38);
    uint64_t v24 = v38;
    uint64_t v23 = v39;
    uint64_t v25 = v40;
    uint64_t v26 = *((void *)&__src[4] + 1);
    int v27 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8]);
    int v28 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8] + 1);
    int v29 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &__src[5]);
    if (v20 < *(void *)&__src[8] + *((void *)&__src[8] + 1)
      || v29
      || v28
      || v27
      || v24 != v26
      || v23
      || v25
      || !v37
      || v22
      || v21
      || v36
      || Short
      || Long
      || v33)
    {
      (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
      return 0;
    }
    else
    {
      *((void *)&__src[5] + 1) = v20 - (*(void *)&__src[8] + *((void *)&__src[8] + 1));
      *((void *)&__src[7] + 1) = v20;
      *(void *)&__src[18] = 0;
      DWORD2(__src[18]) = 0;
      unsigned int v30 = malloc_type_malloc(0x150uLL, 0x10F0040A626E916uLL);
      int v6 = v30;
      if (v30)
      {
        memcpy(v30, __src, 0x150uLL);
        uint64_t v31 = v6[17];
        v6[12] = 0;
        v6[13] = v31;
        v6[14] = unzlocal_GetCurrentFileInfoInternal((uint64_t)v6, (uint64_t)(v6 + 18), v6 + 35, 0, 0, 0, 0, 0, 0) == 0;
      }
    }
  }
  return v6;
}

uint64_t unzlocal_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v11 = 0;
  if (unzlocal_getByte(a1, a2, &v11)
    || (uint64_t v6 = v11, unzlocal_getByte(a1, a2, &v11))
    || (uint64_t v7 = v11, unzlocal_getByte(a1, a2, &v11)))
  {
    uint64_t v8 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = v6 + (v7 << 8) + ((uint64_t)v11 << 16);
    uint64_t result = unzlocal_getByte(a1, a2, &v11);
    uint64_t v8 = v10 + ((uint64_t)v11 << 24);
    if (result) {
      uint64_t v8 = 0;
    }
  }
  *a3 = v8;
  return result;
}

uint64_t unzlocal_getShort(uint64_t a1, uint64_t a2, void *a3)
{
  int v9 = 0;
  if (unzlocal_getByte(a1, a2, &v9))
  {
    uint64_t v6 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = v9;
    uint64_t result = unzlocal_getByte(a1, a2, &v9);
    uint64_t v6 = v8 + ((uint64_t)v9 << 8);
    if (result) {
      uint64_t v6 = 0;
    }
  }
  *a3 = v6;
  return result;
}

uint64_t unzGoToFirstFile(void *a1)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v2 = a1[17];
  a1[12] = 0;
  a1[13] = v2;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = result == 0;
  return result;
}

void *unzOpen(uint64_t a1)
{
  return unzOpen2(a1, 0);
}

uint64_t unzClose(uint64_t a1)
{
  if (!a1) {
    return 4294967194;
  }
  if (*(void *)(a1 + 288)) {
    unzCloseCurrentFile(a1);
  }
  (*(void (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  free((void *)a1);
  return 0;
}

uint64_t unzCloseCurrentFile(uint64_t a1)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v2 = *(void *)(a1 + 288);
  if (!v2) {
    return 4294967194;
  }
  if (*(void *)(v2 + 184) || *(_DWORD *)(v2 + 280))
  {
    uint64_t v3 = 0;
  }
  else if (*(void *)(v2 + 160) == *(void *)(v2 + 168))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 4294967191;
  }
  if (*(void *)v2) {
    free(*(void **)v2);
  }
  *(void *)uint64_t v2 = 0;
  if (*(void *)(v2 + 128) == 8) {
    inflateEnd((z_streamp)(v2 + 8));
  }
  free((void *)v2);
  *(void *)(a1 + 288) = 0;
  return v3;
}

uint64_t unzGetGlobalInfo(uint64_t a1, _OWORD *a2)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t result = 0;
  *a2 = *(_OWORD *)(a1 + 72);
  return result;
}

uint64_t unzGetCurrentFileInfo(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unzlocal_GetCurrentFileInfoInternal(a1, a2, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t unzlocal_GetCurrentFileInfoInternal(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  if (!a1) {
    return 4294967194;
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 88) + *(void *)(a1 + 104), 0)|| (uint64_t v54 = 0, unzlocal_getLong(a1, *(void *)(a1 + 64), &v54)))
  {
    int v10 = -1;
  }
  else if (v54 == 33639248)
  {
    int v10 = 0;
  }
  else
  {
    int v10 = -103;
  }
  unsigned int v50 = v10;
  uint64_t v64 = 0;
  long long v62 = 0u;
  int8x16_t v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v55 = 0;
  int Short = unzlocal_getShort(a1, *(void *)(a1 + 64), &v56);
  int v48 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v56 + 1);
  int v47 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v57);
  int v46 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v57 + 1);
  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v58);
  LODWORD(v64) = ((v58 >> 21) & 0xF) - 1;
  HIDWORD(v64) = (v58 >> 25) + 1980;
  v11.i32[0] = v58;
  int8x16_t v12 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v58), (uint32x4_t)xmmword_E0C0);
  v12.i32[0] = vshlq_u32(v11, (uint32x4_t)xmmword_E0B0).u32[0];
  int8x16_t v63 = vandq_s8(v12, (int8x16_t)xmmword_E0D0);
  int v13 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v58 + 1);
  int v14 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v59);
  int v15 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v59 + 1);
  int v16 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v60);
  int v17 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v60 + 1);
  int v18 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v61);
  int v19 = unzlocal_getShort(a1, *(void *)(a1 + 64), (void *)&v61 + 1);
  int v20 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v62);
  int v21 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v62 + 1);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v55) | v21 | v20 | v19 | v18 | v17 | v16 | v15 | v14 | v13 | Long | v46 | v47 | v48 | Short) {
    uint64_t v22 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v22 = v50;
  }
  unint64_t v23 = v60;
  if (a4)
  {
    unint64_t v25 = a7;
    uint64_t v24 = a6;
    if (v22)
    {
      uint64_t v28 = a2;
      int v27 = a3;
      uint64_t v29 = a8;
    }
    else
    {
      unint64_t v26 = a5;
      if ((unint64_t)v60 < a5)
      {
        *(unsigned char *)(a4 + v60) = 0;
        unint64_t v26 = v23;
      }
      uint64_t v22 = 0;
      if (a5)
      {
        uint64_t v28 = a2;
        int v27 = a3;
        uint64_t v29 = a8;
        if (v23)
        {
          if ((*(uint64_t (**)(void, void))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64)) == v26) {
            uint64_t v22 = 0;
          }
          else {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
        }
      }
      else
      {
        uint64_t v28 = a2;
        int v27 = a3;
        uint64_t v29 = a8;
      }
      v23 -= v26;
    }
  }
  else
  {
    uint64_t v28 = a2;
    int v27 = a3;
    uint64_t v29 = a8;
    unint64_t v25 = a7;
    uint64_t v24 = a6;
  }
  uint64_t v30 = *((void *)&v60 + 1);
  if (!v24 || v22)
  {
    unint64_t v33 = *((void *)&v60 + 1) + v23;
    if (!v29) {
      goto LABEL_60;
    }
    goto LABEL_46;
  }
  if (*((void *)&v60 + 1) >= v25) {
    unint64_t v31 = v25;
  }
  else {
    unint64_t v31 = *((void *)&v60 + 1);
  }
  if (!v23)
  {
    uint64_t v22 = 0;
    if (!v25) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
  uint64_t v32 = (*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v23, 1);
  if (v32) {
    uint64_t v22 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v22 = 0;
  }
  if (!v32) {
    unint64_t v23 = 0;
  }
  if (v25)
  {
LABEL_41:
    if (v30)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), v24, v31) == v31)uint64_t v22 = v22; {
      else
      }
        uint64_t v22 = 0xFFFFFFFFLL;
    }
  }
LABEL_45:
  unint64_t v33 = v30 - v31 + v23;
  if (!v29) {
    goto LABEL_60;
  }
LABEL_46:
  if (!v22)
  {
    unint64_t v34 = v61;
    unint64_t v35 = a9;
    if ((unint64_t)v61 < a9)
    {
      *(unsigned char *)(v29 + v61) = 0;
      unint64_t v35 = v34;
    }
    if (v33)
    {
      if ((*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v33, 1))
      {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v22 = 0;
      }
      if (!a9) {
        goto LABEL_60;
      }
LABEL_56:
      if (v34)
      {
        if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), v29, v35) == v35)uint64_t v22 = v22; {
        else
        }
          uint64_t v22 = 0xFFFFFFFFLL;
      }
      goto LABEL_60;
    }
    uint64_t v22 = 0;
    if (a9) {
      goto LABEL_56;
    }
  }
LABEL_60:
  if (v28 && !v22)
  {
    int8x16_t v36 = v63;
    *(_OWORD *)(v28 + 96) = v62;
    *(int8x16_t *)(v28 + 112) = v36;
    *(void *)(v28 + 128) = v64;
    long long v37 = v59;
    *(_OWORD *)(v28 + 32) = v58;
    *(_OWORD *)(v28 + 48) = v37;
    long long v38 = v61;
    *(_OWORD *)(v28 + 64) = v60;
    *(_OWORD *)(v28 + 80) = v38;
    long long v39 = v57;
    *(_OWORD *)uint64_t v28 = v56;
    *(_OWORD *)(v28 + 16) = v39;
  }
  if (v27 && !v22) {
    void *v27 = v55;
  }
  return v22;
}

uint64_t unzGoToNextFile(void *a1)
{
  if (!a1) {
    return 4294967194;
  }
  if (!a1[14]) {
    return 4294967196;
  }
  uint64_t v2 = a1[9];
  uint64_t v3 = a1[12] + 1;
  if (v2 != 0xFFFF && v3 == v2) {
    return 4294967196;
  }
  uint64_t v5 = a1[26] + a1[27] + a1[28] + a1[13] + 46;
  a1[12] = v3;
  a1[13] = v5;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = result == 0;
  return result;
}

uint64_t unzLocateFile(uint64_t a1, char *__s, unsigned int a3)
{
  if (!a1 || strlen(__s) > 0xFF) {
    return 4294967194;
  }
  if (!*(void *)(a1 + 112)) {
    return 4294967196;
  }
  uint64_t v7 = *(void *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 104);
  long long v17 = *(_OWORD *)(a1 + 240);
  long long v18 = *(_OWORD *)(a1 + 256);
  uint64_t v9 = *(void *)(a1 + 280);
  uint64_t v19 = *(void *)(a1 + 272);
  long long v13 = *(_OWORD *)(a1 + 176);
  long long v14 = *(_OWORD *)(a1 + 192);
  long long v15 = *(_OWORD *)(a1 + 208);
  long long v16 = *(_OWORD *)(a1 + 224);
  long long v11 = *(_OWORD *)(a1 + 144);
  long long v12 = *(_OWORD *)(a1 + 160);
  uint64_t v10 = *(void *)(a1 + 136);
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = v10;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal(a1, a1 + 144, (void *)(a1 + 280), 0, 0, 0, 0, 0, 0);
  for (*(void *)(a1 + 112) = result == 0; !result; uint64_t result = unzGoToNextFile((void *)a1))
  {
    uint64_t result = unzlocal_GetCurrentFileInfoInternal(a1, 0, 0, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0);
    if (result) {
      break;
    }
    uint64_t result = unzStringFileNameCompare(v20, __s, a3);
    if (!result) {
      return result;
    }
  }
  *(void *)(a1 + 96) = v7;
  *(void *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 240) = v17;
  *(_OWORD *)(a1 + 256) = v18;
  *(void *)(a1 + 272) = v19;
  *(_OWORD *)(a1 + 176) = v13;
  *(_OWORD *)(a1 + 192) = v14;
  *(_OWORD *)(a1 + 208) = v15;
  *(_OWORD *)(a1 + 224) = v16;
  *(_OWORD *)(a1 + 144) = v11;
  *(_OWORD *)(a1 + 160) = v12;
  *(void *)(a1 + 280) = v9;
  return result;
}

uint64_t unzGetFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result = 4294967194;
  if (a1 && a2)
  {
    if (a1[7].i64[0])
    {
      uint64_t result = 0;
      *a2 = vextq_s8(a1[6], a1[6], 8uLL);
    }
    else
    {
      return 4294967196;
    }
  }
  return result;
}

uint64_t unzGoToFilePos(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t result = 4294967194;
  if (a1)
  {
    if (a2)
    {
      a1[6] = vextq_s8(*a2, *a2, 8uLL);
      uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)a1[9].i64, &a1[17].i64[1], 0, 0, 0, 0, 0, 0);
      a1[7].i64[0] = result == 0;
    }
  }
  return result;
}

uint64_t unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, unsigned char *a5)
{
  if (!a1 || !*(void *)(a1 + 112)) {
    return 4294967194;
  }
  if (*(void *)(a1 + 288)) {
    unzCloseCurrentFile(a1);
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 88) + *(void *)(a1 + 280), 0))
  {
    return 4294967193;
  }
  unint64_t v51 = 0;
  v52[0] = 0;
  uint64_t v50 = 0;
  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), v52);
  uint64_t v11 = v52[0];
  int Short = unzlocal_getShort(a1, *(void *)(a1 + 64), &v51);
  int v13 = unzlocal_getShort(a1, *(void *)(a1 + 64), &v50);
  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v51))
  {
    int v14 = -1;
  }
  else
  {
    if (v11 == 67324752) {
      int v18 = 0;
    }
    else {
      int v18 = -103;
    }
    int v19 = v13 | Short | Long;
    if (v19) {
      int v14 = -1;
    }
    else {
      int v14 = v18;
    }
    if (!v19 && v11 == 67324752)
    {
      if (v51 == *(void *)(a1 + 168) && v51 <= 0xC && ((1 << v51) & 0x1101) != 0) {
        int v14 = 0;
      }
      else {
        int v14 = -103;
      }
    }
  }
  int v15 = unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v51);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v51))
  {
    int v16 = -1;
  }
  else
  {
    if (v15) {
      int v16 = -1;
    }
    else {
      int v16 = v14;
    }
    if (!v16)
    {
      if (v51 == *(void *)(a1 + 184))
      {
        int v16 = 0;
      }
      else if ((v50 & 8) != 0)
      {
        int v16 = 0;
      }
      else
      {
        int v16 = -103;
      }
    }
  }
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v51))
  {
    int v16 = -1;
  }
  else if (!v16)
  {
    if (v51 == *(void *)(a1 + 192))
    {
      int v16 = 0;
    }
    else if ((v50 & 8) != 0)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = -103;
    }
  }
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), (uint64_t *)&v51))
  {
    int v16 = -1;
  }
  else if (!v16)
  {
    if (v51 == *(void *)(a1 + 200))
    {
      int v16 = 0;
    }
    else if ((v50 & 8) != 0)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = -103;
    }
  }
  uint64_t v49 = 0;
  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v49))
  {
    int v16 = -1;
    uint64_t v20 = v49;
  }
  else
  {
    uint64_t v20 = v49;
    if (!v16)
    {
      if (v49 == *(void *)(a1 + 208)) {
        int v16 = 0;
      }
      else {
        int v16 = -103;
      }
    }
  }
  uint64_t v48 = 0;
  if (unzlocal_getShort(a1, *(void *)(a1 + 64), &v48) || v16) {
    return 4294967193;
  }
  uint64_t v22 = *(void *)(a1 + 280);
  int v23 = v48;
  uint64_t v24 = (char *)malloc_type_malloc(0x120uLL, 0x10B0040E43A3504uLL);
  if (!v24) {
    return 4294967192;
  }
  unint64_t v25 = v24;
  unint64_t v26 = malloc_type_malloc(0x4000uLL, 0x44898EB4uLL);
  *(void *)unint64_t v25 = v26;
  *((void *)v25 + 17) = v20 + v22 + 30;
  *((_DWORD *)v25 + 36) = v23;
  *((void *)v25 + 19) = 0;
  *((_DWORD *)v25 + 70) = a4;
  if (!v26)
  {
    free(v25);
    return 4294967192;
  }
  *((void *)v25 + 16) = 0;
  if (a2) {
    *a2 = *(void *)(a1 + 168);
  }
  if (a3)
  {
    *a3 = 6;
    uint64_t v27 = *(void *)(a1 + 160) & 6;
    switch(v27)
    {
      case 2:
        int v28 = 9;
        break;
      case 6:
        int v28 = 1;
        break;
      case 4:
        int v28 = 2;
        break;
      default:
        goto LABEL_72;
    }
    *a3 = v28;
  }
LABEL_72:
  uint64_t v29 = *(void *)(a1 + 184);
  *((void *)v25 + 20) = 0;
  *((void *)v25 + 21) = v29;
  *((void *)v25 + 33) = *(void *)(a1 + 168);
  *((void *)v25 + 32) = *(void *)(a1 + 64);
  long long v30 = *(_OWORD *)a1;
  long long v31 = *(_OWORD *)(a1 + 16);
  long long v32 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 14) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v25 + 15) = v32;
  *((_OWORD *)v25 + 12) = v30;
  *((_OWORD *)v25 + 13) = v31;
  *((void *)v25 + 34) = *(void *)(a1 + 88);
  *((void *)v25 + 6) = 0;
  uint64_t v33 = *(void *)(a1 + 168);
  if (a4 || v33 != 12)
  {
    if (!a4 && v33 == 8)
    {
      *((void *)v25 + 1) = 0;
      *((_DWORD *)v25 + 4) = 0;
      *((void *)v25 + 10) = 0;
      *((void *)v25 + 11) = 0;
      *((void *)v25 + 9) = 0;
      uint64_t v34 = inflateInit2_((z_streamp)(v25 + 8), -15, "1.2.12", 112);
      if (v34)
      {
        uint64_t v17 = v34;
        free(v25);
        return v17;
      }
      *((void *)v25 + 16) = 8;
    }
  }
  else
  {
    *((_DWORD *)v25 + 70) = 1;
  }
  *((_OWORD *)v25 + 11) = *(_OWORD *)(a1 + 192);
  *((void *)v25 + 15) = *(void *)(a1 + 280) + (v23 + v20) + 30;
  *((_DWORD *)v25 + 4) = 0;
  *(void *)(a1 + 288) = v25;
  *(_DWORD *)(a1 + 296) = 0;
  if (!a5) {
    return 0;
  }
  unint64_t v35 = 878082192;
  crc_table = get_crc_table();
  *(_OWORD *)(a1 + 304) = xmmword_E0E0;
  *(void *)(a1 + 320) = 878082192;
  *(void *)(a1 + 328) = crc_table;
  int v37 = *a5;
  if (*a5)
  {
    long long v38 = a5 + 1;
    unint64_t v39 = 305419896;
    uint64_t v40 = 591751049;
    do
    {
      unint64_t v39 = crc_table[v37 ^ v39] ^ (v39 >> 8);
      uint64_t v40 = 134775813 * (v40 + v39) + 1;
      *(void *)(a1 + 304) = v39;
      *(void *)(a1 + 312) = v40;
      unint64_t v35 = crc_table[(v35 ^ BYTE3(v40))] ^ (v35 >> 8);
      *(void *)(a1 + 320) = v35;
      int v41 = *v38++;
      int v37 = v41;
    }
    while (v41);
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(*(void *)(a1 + 288) + 272) + *(void *)(*(void *)(a1 + 288) + 120), 0)|| (unint64_t)(*(uint64_t (**)(void, void, uint64_t *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), v52, 12) < 0xC)
  {
    return 4294967192;
  }
  uint64_t v42 = 0;
  unint64_t v44 = *(void *)(a1 + 320);
  uint64_t v43 = *(void *)(a1 + 328);
  unint64_t v45 = *(void *)(a1 + 304);
  uint64_t v46 = *(void *)(a1 + 312);
  do
  {
    char v47 = *((unsigned char *)v52 + v42) ^ ((unsigned __int16)((v44 & 0xFFFD ^ 3) * (v44 | 2)) >> 8);
    *((unsigned char *)v52 + v42) = v47;
    unint64_t v45 = *(void *)(v43 + 8 * (v47 ^ v45)) ^ (v45 >> 8);
    uint64_t v46 = 134775813 * (v46 + v45) + 1;
    *(void *)(a1 + 304) = v45;
    *(void *)(a1 + 312) = v46;
    unint64_t v44 = *(void *)(v43 + 8 * (v44 ^ BYTE3(v46))) ^ (v44 >> 8);
    *(void *)(a1 + 320) = v44;
    ++v42;
  }
  while (v42 != 12);
  uint64_t v17 = 0;
  *(void *)(*(void *)(a1 + 288) + 120) += 12;
  *(_DWORD *)(a1 + 296) = 1;
  return v17;
}

uint64_t unzOpenCurrentFile(uint64_t a1)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, 0);
}

uint64_t unzOpenCurrentFilePassword(uint64_t a1, unsigned char *a2)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, a2);
}

uint64_t unzOpenCurrentFile2(uint64_t a1, _DWORD *a2, int *a3, int a4)
{
  return unzOpenCurrentFile3(a1, a2, a3, a4, 0);
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v4 = *(void *)(a1 + 288);
  if (!v4) {
    return 4294967194;
  }
  if (!*(void *)v4) {
    return 4294967196;
  }
  if (!a3) {
    return 0;
  }
  *(void *)(v4 + 32) = a2;
  *(_DWORD *)(v4 + 40) = a3;
  unint64_t v5 = a3;
  unint64_t v6 = *(void *)(v4 + 184);
  if (v6 < a3 && !*(_DWORD *)(v4 + 280))
  {
    *(_DWORD *)(v4 + 40) = v6;
    a3 = v6;
  }
  uint64_t v7 = *(void *)(v4 + 176);
  uint64_t v8 = *(unsigned int *)(v4 + 16);
  if (v7 + v8 < v5 && *(_DWORD *)(v4 + 280))
  {
    a3 = v8 + v7;
    *(_DWORD *)(v4 + 40) = v8 + v7;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v9 = 0;
  while (1)
  {
    LODWORD(v10) = *(_DWORD *)(v4 + 16);
    if (!v10)
    {
      unint64_t v11 = *(void *)(v4 + 176);
      if (v11)
      {
        if (v11 >= 0x4000) {
          uint64_t v10 = 0x4000;
        }
        else {
          uint64_t v10 = *(void *)(v4 + 176);
        }
        if ((*(uint64_t (**)(void, void, void, void))(v4 + 224))(*(void *)(v4 + 248), *(void *)(v4 + 256), *(void *)(v4 + 272) + *(void *)(v4 + 120), 0)|| (*(uint64_t (**)(void, void, void, uint64_t))(v4 + 200))(*(void *)(v4 + 248), *(void *)(v4 + 256), *(void *)v4, v10) != v10)
        {
          return 0xFFFFFFFFLL;
        }
        if (*(_DWORD *)(a1 + 296))
        {
          uint64_t v12 = 0;
          do
          {
            uint64_t v13 = *(void *)(a1 + 328);
            unsigned int v14 = *(unsigned __int8 *)(*(void *)v4 + v12) ^ (((*(_DWORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                              * (*(_DWORD *)(a1 + 320) | 2u)) >> 8);
            *(unsigned char *)(*(void *)v4 + v12) ^= (unsigned __int16)((*(_WORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                * (*(_WORD *)(a1 + 320) | 2)) >> 8;
            uint64_t v15 = *(void *)(v13 + 8 * (v14 ^ *(void *)(a1 + 304))) ^ (*(void *)(a1 + 304) >> 8);
            uint64_t v16 = 134775813 * (*(void *)(a1 + 312) + v15) + 1;
            *(void *)(a1 + 304) = v15;
            *(void *)(a1 + 312) = v16;
            *(void *)(a1 + 320) = *(void *)(v13 + 8 * (*(void *)(a1 + 320) ^ BYTE3(v16))) ^ (*(void *)(a1 + 320) >> 8);
            *(unsigned char *)(*(void *)v4 + v12++) = v14;
          }
          while (v10 != v12);
        }
        *(void *)(v4 + 120) += v10;
        *(void *)(v4 + 176) -= v10;
        *(void *)(v4 + 8) = *(void *)v4;
        *(_DWORD *)(v4 + 16) = v10;
      }
      else
      {
        LODWORD(v10) = 0;
      }
    }
    uint64_t v17 = *(void *)(v4 + 264);
    if (!v17 || *(_DWORD *)(v4 + 280))
    {
      if (!v10 && !*(void *)(v4 + 176)) {
        return v9;
      }
      unsigned int v18 = *(_DWORD *)(v4 + 40);
      if (v18 >= v10) {
        uint64_t v10 = v10;
      }
      else {
        uint64_t v10 = v18;
      }
      if (v10)
      {
        for (uint64_t i = 0; i != v10; ++i)
          *(unsigned char *)(*(void *)(v4 + 32) + i) = *(unsigned char *)(*(void *)(v4 + 8) + i);
        uint64_t v20 = v10;
      }
      else
      {
        uint64_t v20 = 0;
      }
      *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), *(const Bytef **)(v4 + 32), v10);
      *(void *)(v4 + 184) -= v20;
      *(_DWORD *)(v4 + 16) -= v10;
      *(_DWORD *)(v4 + 40) -= v10;
      *(void *)(v4 + 32) += v20;
      *(void *)(v4 + 8) += v20;
      uint64_t v9 = (v10 + v9);
      *(void *)(v4 + 48) += v20;
      goto LABEL_38;
    }
    if (v17 != 12)
    {
      uint64_t v21 = *(void *)(v4 + 48);
      uint64_t v22 = *(const Bytef **)(v4 + 32);
      unsigned int v23 = inflate((z_streamp)(v4 + 8), 2);
      if ((v23 & 0x80000000) == 0 && *(void *)(v4 + 56))
      {
        uint64_t v26 = *(void *)(v4 + 48);
        uint64_t v27 = v26 - v21;
        *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), v22, (int)v26 - (int)v21);
        *(void *)(v4 + 184) -= v27;
        return 4294967293;
      }
      uint64_t v24 = *(void *)(v4 + 48) - v21;
      *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), v22, v24);
      *(void *)(v4 + 184) -= v24;
      uint64_t v9 = (v9 + v24);
      if (v23) {
        break;
      }
    }
LABEL_38:
    if (!*(_DWORD *)(v4 + 40)) {
      return v9;
    }
  }
  if (v23 == 1) {
    return v9;
  }
  else {
    return v23;
  }
}

uint64_t unztell(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 288)) != 0) {
    return *(void *)(v1 + 48);
  }
  else {
    return -102;
  }
}

uint64_t unzeof(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 288)) != 0) {
    return *(void *)(v1 + 184) == 0;
  }
  else {
    return 4294967194;
  }
}

unint64_t unzGetLocalExtrafield(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v3 = *(void *)(a1 + 288);
  if (!v3) {
    return 4294967194;
  }
  uint64_t v5 = *(void *)(v3 + 152);
  unint64_t result = *(unsigned int *)(v3 + 144) - v5;
  if (a2)
  {
    if (result >= a3) {
      uint64_t v7 = a3;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, void))(v3 + 224))(*(void *)(v3 + 248), *(void *)(v3 + 256), *(void *)(v3 + 136) + v5, 0))
      {
        return 0xFFFFFFFFLL;
      }
      else if ((*(uint64_t (**)(void, void, uint64_t, uint64_t))(v3 + 200))(*(void *)(v3 + 248), *(void *)(v3 + 256), a2, v7) == v7)
      {
        return v7;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t unzGetGlobalComment(uint64_t a1, unsigned char *a2, unint64_t a3)
{
  if (!a1) {
    return 4294967194;
  }
  if (*(void *)(a1 + 80) >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = *(void *)(a1 + 80);
  }
  if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 120) + 22, 0))
  {
    return 0xFFFFFFFFLL;
  }
  if (v6)
  {
    *a2 = 0;
    if ((*(uint64_t (**)(void, void, unsigned char *, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), a2, v6) != v6)return 0xFFFFFFFFLL; {
  }
    }
  else if (!a2)
  {
    return v6;
  }
  unint64_t v8 = *(void *)(a1 + 80);
  if (v8 < a3) {
    a2[v8] = 0;
  }
  return v6;
}

void *unzGetOffset(void *result)
{
  if (result)
  {
    if (result[14] && ((v1 = result[9]) != 0 ? (BOOL v2 = v1 == 0xFFFF) : (BOOL v2 = 1), v2 || result[12] != v1)) {
      return (void *)result[13];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t unzSetOffset(void *a1, uint64_t a2)
{
  if (!a1) {
    return 4294967194;
  }
  a1[12] = a1[9];
  a1[13] = a2;
  uint64_t result = unzlocal_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 18), a1 + 35, 0, 0, 0, 0, 0, 0);
  a1[14] = result == 0;
  return result;
}

uint64_t unzlocal_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned __int8 v7 = 0;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v7, 1) == 1)
  {
    uint64_t result = 0;
    *a3 = v7;
  }
  else if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void *zipOpen2()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v3 = v2;
  int v5 = v4;
  uint64_t v6 = v0;
  memset(__src, 0, 512);
  if (v1)
  {
    long long v7 = v1[1];
    __src[0] = *v1;
    __src[1] = v7;
    long long v8 = v1[3];
    __src[2] = v1[2];
    __src[3] = v8;
  }
  else
  {
    fill_fopen_filefunc((FILE *(**)(int, char *, char))__src);
  }
  if (v5) {
    uint64_t v9 = 7;
  }
  else {
    uint64_t v9 = 11;
  }
  uint64_t v10 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&__src[3] + 1), v6, v9);
  *(void *)&__src[4] = v10;
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  if (v5 == 1)
  {
    (*(void (**)(void, uint64_t, void, uint64_t))&__src[2])(*((void *)&__src[3] + 1), v10, 0, 2);
    uint64_t v11 = *(void *)&__src[4];
  }
  *(void *)&__src[1044] = (*((uint64_t (**)(void, uint64_t))&__src[1] + 1))(*((void *)&__src[3] + 1), v11);
  *(_OWORD *)((char *)&__src[4] + 8) = 0u;
  LODWORD(__src[13]) = 0;
  DWORD2(__src[5]) = 0;
  *(_OWORD *)((char *)&__src[1044] + 8) = 0u;
  uint64_t v12 = malloc_type_malloc(0x4160uLL, 0x10F0040221808EAuLL);
  if (!v12)
  {
    (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
    return v12;
  }
  *((void *)&__src[1045] + 1) = 0;
  if (v5 == 2)
  {
    unint64_t v51 = v3;
    uint64_t v63 = 0;
    unint64_t v64 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v57 = 0;
    uint64_t v13 = *(void *)&__src[4];
    unint64_t v14 = 0;
    if (!(*(uint64_t (**)(void, void, void, uint64_t))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], 0, 2))
    {
      unint64_t v15 = (*((uint64_t (**)(void, uint64_t))&__src[1] + 1))(*((void *)&__src[3] + 1), v13);
      unint64_t v16 = v15;
      if (v15 >= 0xFFFF) {
        unint64_t v17 = 0xFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      unsigned int v18 = malloc_type_malloc(0x404uLL, 0x204A60F4uLL);
      if (v18)
      {
        int v19 = v18;
        if (v17 >= 5)
        {
          uint64_t v20 = 4;
          do
          {
            unint64_t v21 = v20 + 1024;
            unint64_t v22 = v20 + 1024 >= v17 ? v17 : v20 + 1024;
            unint64_t v23 = v22 >= 0x404 ? 1028 : v22;
            if ((*(uint64_t (**)(void, uint64_t, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), v13, v16 - v22, 0)|| (*((uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v13, v19, v23) != v23)
            {
              break;
            }
            if (v23 >= 4)
            {
              uint64_t v24 = (v23 - 4) + 1;
              while (v19[v24 - 1] != 80 || v19[v24] != 75 || v19[v24 + 1] != 5 || v19[v24 + 2] != 6)
              {
                if (v24-- <= 1) {
                  goto LABEL_35;
                }
              }
              if (v16 - v22 + v24 != 1)
              {
                unint64_t v26 = v20 + 1024;
                if (v16 < v20 + 1024) {
                  unint64_t v26 = v16;
                }
                if (v26 >= 0xFFFF) {
                  unint64_t v26 = 0xFFFFLL;
                }
                unint64_t v14 = v16 - v26 + v24 - 1;
                goto LABEL_51;
              }
            }
LABEL_35:
            uint64_t v20 = v22;
          }
          while (v17 > v21);
        }
        unint64_t v14 = 0;
LABEL_51:
        free(v19);
      }
      else
      {
        unint64_t v14 = 0;
      }
    }
    uint64_t v52 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v14, 0);
    int Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v62);
    int Short = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v61);
    int v55 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v60);
    int v28 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v59);
    int v29 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v58);
    uint64_t v30 = v59;
    uint64_t v56 = v58;
    uint64_t v32 = v60;
    uint64_t v31 = v61;
    int v33 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&v64);
    int v34 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v63);
    int v35 = unzlocal_getShort((uint64_t)__src, *(uint64_t *)&__src[4], &v57);
    unint64_t v36 = v64;
    BOOL v37 = v14 >= v64 + v63;
    unint64_t v38 = v14 - (v64 + v63);
    if (!v37 || v35 || v34 || v33 || v56 != v30 || v32 || v31 || v29 || v28 || v55 || Short || Long || v52)
    {
      (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
LABEL_83:
      free(v12);
      return 0;
    }
    uint64_t v39 = v63;
    uint64_t v40 = v57;
    if (v57)
    {
      int v41 = malloc_type_malloc(v57 + 1, 0x8B5E25EBuLL);
      *((void *)&__src[1045] + 1) = v41;
      if (v41)
      {
        uint64_t v42 = (*((uint64_t (**)(void, void, void *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v41, v40);
        *(unsigned char *)(*((void *)&__src[1045] + 1) + v42) = 0;
      }
    }
    *((void *)&__src[1044] + 1) = v38;
    uint64_t v43 = (char *)malloc_type_malloc(0xFF0uLL, 0x43F3CCC4uLL);
    unint64_t v44 = v38;
    unint64_t v45 = v38 + v39;
    uint64_t v46 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v38 + v39, 0);
    if (v46) {
      int v47 = -1;
    }
    else {
      int v47 = 0;
    }
    if (v36 && !v46)
    {
      while (1)
      {
        unint64_t v48 = v36 >= 0xFF0 ? 4080 : v36;
        if ((*((uint64_t (**)(void, void, char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v43, v48) != v48)break; {
        int v49 = add_data_in_datablock((void *)&__src[4] + 1, v43, v48);
        }
        int v47 = v49;
        v36 -= v48;
        if (!v36 || v49) {
          goto LABEL_87;
        }
      }
      int v47 = -1;
    }
LABEL_87:
    if (v43) {
      free(v43);
    }
    *(void *)&__src[1044] = v44;
    *(void *)&__src[1045] = v56;
    if ((*(uint64_t (**)(void, void, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v45, 0))
    {
      int v27 = -1;
    }
    else
    {
      int v27 = v47;
    }
    uint64_t v3 = v51;
    if (!v51) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  int v27 = 0;
  if (v3) {
LABEL_45:
  }
    void *v3 = *((void *)&__src[1045] + 1);
LABEL_46:
  if (v27)
  {
    if (*((void *)&__src[1045] + 1)) {
      free(*((void **)&__src[1045] + 1));
    }
    goto LABEL_83;
  }
  memcpy(v12, __src, 0x4160uLL);
  return v12;
}

uint64_t add_data_in_datablock(void *a1, char *a2, unint64_t a3)
{
  if (!a1) {
    return 4294967192;
  }
  unint64_t v3 = a3;
  uint64_t v6 = (void *)a1[1];
  if (v6)
  {
    if (!a3) {
      return 0;
    }
  }
  else
  {
    long long v8 = (char *)malloc_type_malloc(0x1010uLL, 0x1020040BBE2FE16uLL);
    if (!v8)
    {
      *a1 = 0;
      a1[1] = 0;
      return 4294967192;
    }
    uint64_t v6 = v8;
    *(void *)long long v8 = 0;
    *(_OWORD *)(v8 + 8) = xmmword_E150;
    *a1 = v8;
    a1[1] = v8;
    if (!v3) {
      return 0;
    }
  }
  unint64_t v9 = v6[1];
  while (v9)
  {
    uint64_t v10 = v6[2];
LABEL_13:
    if (v9 >= v3) {
      unsigned int v12 = v3;
    }
    else {
      unsigned int v12 = v9;
    }
    if (v12)
    {
      uint64_t v13 = (char *)v6 + v10 + 32;
      uint64_t v14 = v12;
      unint64_t v15 = a2;
      do
      {
        char v16 = *v15++;
        *v13++ = v16;
        --v14;
      }
      while (v14);
      unint64_t v9 = v6[1];
      uint64_t v10 = v6[2];
    }
    v9 -= v12;
    v6[1] = v9;
    v6[2] = v10 + v12;
    a2 += v12;
    v3 -= v12;
    if (!v3) {
      return 0;
    }
  }
  uint64_t v11 = (char *)malloc_type_malloc(0x1010uLL, 0x1020040BBE2FE16uLL);
  if (v11)
  {
    uint64_t v10 = 0;
    *(void *)uint64_t v11 = 0;
    *(_OWORD *)(v11 + 8) = xmmword_E150;
    *uint64_t v6 = v11;
    unint64_t v9 = 4080;
    uint64_t v6 = v11;
    a1[1] = v11;
    goto LABEL_13;
  }
  *uint64_t v6 = 0;
  return 4294967192;
}

void *zipOpen()
{
  return zipOpen2();
}

uint64_t zipOpenNewFileInZip4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *__s, int a9, int a10, int a11, int a12, int a13, int a14, unsigned char *a15, uint64_t a16, unint64_t a17, uint64_t a18)
{
  uint64_t result = 4294967194;
  if (!a1) {
    return result;
  }
  if ((a9 & 0xFFFFFFF7) != 0) {
    return result;
  }
  if (*(_DWORD *)(a1 + 88) == 1)
  {
    uint64_t result = zipCloseFileInZipRaw(a1, 0, 0);
    if (result) {
      return result;
    }
  }
  unsigned int v105 = a5;
  if (a2) {
    int v27 = a2;
  }
  else {
    int v27 = "-";
  }
  uint64_t v104 = a4;
  if (__s) {
    unsigned int v106 = strlen(__s);
  }
  else {
    unsigned int v106 = 0;
  }
  unsigned int v28 = strlen(v27);
  if (a3)
  {
    unint64_t v29 = *(void *)(a3 + 24);
    if (!v29)
    {
      uint64_t v30 = *(unsigned int *)(a3 + 20);
      uint64_t v31 = v30 - 80;
      if (v30 <= 0x4F) {
        uint64_t v31 = *(unsigned int *)(a3 + 20);
      }
      if (v30 <= 0x7BB) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = v30 - 1980;
      }
      unint64_t v29 = ((32 * *(_DWORD *)(a3 + 4) + (*(_DWORD *)a3 >> 1))
           + ((unint64_t)*(unsigned int *)(a3 + 8) << 11)) | (((unint64_t)(*(_DWORD *)(a3 + 12) + 32 * *(_DWORD *)(a3 + 16) + 32) << 16)
                                                                   + (v32 << 25));
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  *(void *)(a1 + 16640) = v29;
  if ((a10 & 0xFFFFFFFE) == 8) {
    uint64_t v33 = a18 | 2;
  }
  else {
    uint64_t v33 = a18;
  }
  *(void *)(a1 + 240) = v33;
  if (a10 == 2)
  {
    uint64_t v35 = 4;
    unsigned int v34 = v28;
  }
  else
  {
    unsigned int v34 = v28;
    if (a10 != 1) {
      goto LABEL_28;
    }
    uint64_t v35 = 6;
  }
  v33 |= v35;
  *(void *)(a1 + 240) = v33;
LABEL_28:
  if (a15) {
    *(void *)(a1 + 240) = v33 | 1;
  }
  *(void *)(a1 + 16648) = 0;
  *(_DWORD *)(a1 + 16656) = 0;
  *(void *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 248) = a9;
  *(_DWORD *)(a1 + 252) = a11;
  *(void *)(a1 + 216) = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  size_t v36 = a7 + v106 + v34 + 46;
  *(void *)(a1 + 232) = v36;
  BOOL v37 = malloc_type_malloc(v36, 0x34D9D5B9uLL);
  *(void *)(a1 + 224) = v37;
  *BOOL v37 = 33639248;
  uint64_t v38 = *(void *)(a1 + 224);
  *(_WORD *)(v38 + 4) = a17;
  if (a17 >= 0x10000) {
    *(_WORD *)(v38 + 4) = -1;
  }
  *(_WORD *)(*(void *)(a1 + 224) + 6) = 20;
  uint64_t v39 = *(void *)(a1 + 224);
  unint64_t v40 = *(void *)(a1 + 240);
  *(_WORD *)(v39 + 8) = v40;
  if (v40 >= 0x10000) {
    *(_WORD *)(v39 + 8) = -1;
  }
  uint64_t v41 = *(void *)(a1 + 224);
  unsigned int v42 = *(_DWORD *)(a1 + 248);
  *(_WORD *)(v41 + 10) = v42;
  if (v42 >= 0x10000) {
    *(_WORD *)(v41 + 10) = -1;
  }
  uint64_t v43 = 0;
  unint64_t v44 = (_DWORD *)(*(void *)(a1 + 224) + 12);
  unint64_t v45 = *(void *)(a1 + 16640);
  do
  {
    unint64_t v46 = v45;
    *((unsigned char *)v44 + v43) = v45;
    v45 >>= 8;
    ++v43;
  }
  while (v43 != 4);
  if (v46 >= 0x100) {
    *unint64_t v44 = -1;
  }
  *(_DWORD *)(*(void *)(a1 + 224) + 16) = 0;
  *(_DWORD *)(*(void *)(a1 + 224) + 20) = 0;
  *(_DWORD *)(*(void *)(a1 + 224) + 24) = 0;
  uint64_t v47 = *(void *)(a1 + 224);
  *(_WORD *)(v47 + 28) = v34;
  if (v34 >= 0x10000uLL) {
    *(_WORD *)(v47 + 28) = -1;
  }
  uint64_t v48 = *(void *)(a1 + 224);
  *(_WORD *)(v48 + 30) = a7;
  if (a7 >= 0x10000) {
    *(_WORD *)(v48 + 30) = -1;
  }
  uint64_t v49 = *(void *)(a1 + 224);
  *(_WORD *)(v49 + 32) = v106;
  if (v106 >= 0x10000) {
    *(_WORD *)(v49 + 32) = -1;
  }
  uint64_t v50 = v106;
  *(_WORD *)(*(void *)(a1 + 224) + 34) = 0;
  uint64_t v51 = *(void *)(a1 + 224);
  if (a3)
  {
    unint64_t v52 = *(void *)(a3 + 32);
    *(_WORD *)(v51 + 36) = v52;
    if (v52 >= 0x10000) {
      *(_WORD *)(v51 + 36) = -1;
    }
    uint64_t v53 = 0;
    uint64_t v54 = (_DWORD *)(*(void *)(a1 + 224) + 38);
    unint64_t v55 = *(void *)(a3 + 40);
    do
    {
      unint64_t v56 = v55;
      *((unsigned char *)v54 + v53) = v55;
      v55 >>= 8;
      ++v53;
    }
    while (v53 != 4);
    if (v56 >= 0x100) {
      *uint64_t v54 = -1;
    }
  }
  else
  {
    *(_WORD *)(v51 + 36) = 0;
    *(_DWORD *)(*(void *)(a1 + 224) + 38) = 0;
  }
  uint64_t v57 = 0;
  uint64_t v58 = (_DWORD *)(*(void *)(a1 + 224) + 42);
  unint64_t v59 = *(void *)(a1 + 216) - *(void *)(a1 + 16712);
  do
  {
    unint64_t v60 = v59;
    *((unsigned char *)v58 + v57) = v59;
    v59 >>= 8;
    ++v57;
  }
  while (v57 != 4);
  if (v60 >= 0x100) {
    *uint64_t v58 = -1;
  }
  if (v34)
  {
    for (uint64_t i = 0; i != v34; ++i)
      *(unsigned char *)(*(void *)(a1 + 224) + i + 46) = v27[i];
  }
  if (a7)
  {
    uint64_t v62 = v34 + 46;
    uint64_t v63 = a7;
    do
    {
      char v64 = *a6++;
      *(unsigned char *)(*(void *)(a1 + 224) + v62++) = v64;
      --v63;
    }
    while (v63);
  }
  if (v106)
  {
    unint64_t v65 = a7 + (unint64_t)v34 + 46;
    do
    {
      char v66 = *__s++;
      *(unsigned char *)(*(void *)(a1 + 224) + v65++) = v66;
      --v50;
    }
    while (v50);
  }
  if (!*(void *)(a1 + 224)) {
    return 4294967192;
  }
  v107[0] = 67324752;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v107, 4) != 4)goto LABEL_97; {
  LOWORD(v107[0]) = 20;
  }
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v107, 2) != 2)goto LABEL_97; {
  uint64_t v67 = *(void *)(a1 + 64);
  }
  unint64_t v68 = *(void *)(a1 + 240);
  LOWORD(v107[0]) = v68;
  if (v68 >= 0x10000) {
    LOWORD(v107[0]) = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v67, v107, 2) != 2) {
    goto LABEL_97;
  }
  uint64_t v69 = *(void *)(a1 + 64);
  unsigned int v70 = *(_DWORD *)(a1 + 248);
  LOWORD(v107[0]) = v70;
  if (v70 >= 0x10000) {
    LOWORD(v107[0]) = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v69, v107, 2) != 2) {
    goto LABEL_97;
  }
  uint64_t v71 = 0;
  uint64_t v72 = *(void *)(a1 + 64);
  unint64_t v73 = *(void *)(a1 + 16640);
  do
  {
    unint64_t v74 = v73;
    *((unsigned char *)v107 + v71) = v73;
    v73 >>= 8;
    ++v71;
  }
  while (v71 != 4);
  if (v74 >= 0x100) {
    v107[0] = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v72, v107, 4) != 4) {
    goto LABEL_97;
  }
  v107[0] = 0;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v107, 4) != 4)goto LABEL_97; {
  v107[0] = 0;
  }
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v107, 4) != 4)goto LABEL_97; {
  v107[0] = 0;
  }
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v107, 4) != 4)goto LABEL_97; {
  uint64_t v75 = *(void *)(a1 + 64);
  }
  LOWORD(v107[0]) = v34;
  if (v34 >= 0x10000uLL) {
    LOWORD(v107[0]) = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v75, v107, 2) == 2)
  {
    uint64_t v76 = *(void *)(a1 + 64);
    LOWORD(v107[0]) = v105;
    if (v105 >= 0x10000) {
      LOWORD(v107[0]) = -1;
    }
    uint64_t v77 = (*(uint64_t (**)(void, uint64_t, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v76, v107, 2);
    int v78 = v77 != 2;
    if (v77 == 2 && v34) {
      int v78 = (*(uint64_t (**)(void, void, const char *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v27, v34) != v34;
    }
    int v79 = v78 << 31 >> 31;
    __int32 v80 = (_DWORD *)(a1 + 16656);
    unsigned __int8 v81 = a15;
    if (v105 && (v78 & 1) == 0)
    {
      uint64_t v82 = (*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v104, v105);
      __int32 v80 = (_DWORD *)(a1 + 16656);
      unsigned __int8 v81 = a15;
      if (v82 == v105) {
        int v79 = 0;
      }
      else {
        int v79 = -1;
      }
    }
  }
  else
  {
LABEL_97:
    int v79 = -1;
    __int32 v80 = (_DWORD *)(a1 + 16656);
    unsigned __int8 v81 = a15;
  }
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 128) = 0x4000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = a1 + 256;
  *(void *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 184) = 0;
  if (v79)
  {
    uint64_t result = 0xFFFFFFFFLL;
LABEL_100:
    v80[10] = 0;
    return result;
  }
  if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
  {
    if (a12 < 0) {
      int v103 = a12;
    }
    else {
      int v103 = -a12;
    }
    *(void *)(a1 + 160) = 0;
    *(void *)(a1 + 168) = 0;
    *(void *)(a1 + 176) = 0;
    uint64_t result = deflateInit2_((z_streamp)(a1 + 96), a10, 8, v103, a13, a14, "1.2.12", 112);
    __int32 v80 = (_DWORD *)(a1 + 16656);
    if (result) {
      goto LABEL_100;
    }
    *(_DWORD *)(a1 + 208) = 1;
    unsigned __int8 v81 = a15;
  }
  v80[10] = 0;
  if (!v81) {
    goto LABEL_112;
  }
  *__int32 v80 = 1;
  crc_table = get_crc_table();
  *(void *)(a1 + 16688) = crc_table;
  if (!crypthead_calls++)
  {
    int v85 = time(0);
    srand(v85 ^ 0xBB40E64E);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  for (uint64_t j = 0; j != 10; v110[j++] = ((unsigned __int16)((v88 & 0xFFFD ^ 3) * (v88 | 2)) >> 8) ^ (v87 >> 7))
  {
    unsigned int v87 = rand();
    unint64_t v88 = *(void *)(a1 + 16680);
    z_crc_t v89 = crc_table[(*(void *)(a1 + 16664) ^ (v87 >> 7))] ^ (*(void *)(a1 + 16664) >> 8);
    *(void *)(a1 + 16664) = v89;
    uint64_t v90 = 134775813 * (*(void *)(a1 + 16672) + v89) + 1;
    *(void *)(a1 + 16672) = v90;
    *(void *)(a1 + 16680) = crc_table[(v88 ^ BYTE3(v90))] ^ (v88 >> 8);
  }
  init_keys(a15, a1 + 16664, (uint64_t)crc_table);
  uint64_t v91 = 0;
  z_crc_t v92 = *(void *)(a1 + 16680);
  z_crc_t v93 = *(void *)(a1 + 16664);
  uint64_t v94 = *(void *)(a1 + 16672);
  do
  {
    __int16 v95 = (v92 & 0xFFFD ^ 3) * (v92 | 2);
    char v96 = v110[v91];
    z_crc_t v93 = crc_table[(v96 ^ v93)] ^ (v93 >> 8);
    *(void *)(a1 + 16664) = v93;
    uint64_t v94 = 134775813 * (v94 + v93) + 1;
    *(void *)(a1 + 16672) = v94;
    z_crc_t v92 = crc_table[(v92 ^ BYTE3(v94))] ^ (v92 >> 8);
    *(void *)(a1 + 16680) = v92;
    *((unsigned char *)v107 + v91++) = v96 ^ HIBYTE(v95);
  }
  while (v91 != 10);
  int v97 = ((v92 & 0xFFFFFFFD ^ 3) * (v92 | 2)) >> 8;
  z_crc_t v98 = crc_table[(v93 ^ BYTE2(a16))] ^ (v93 >> 8);
  *(void *)(a1 + 16664) = v98;
  uint64_t v99 = 134775813 * (v94 + v98) + 1;
  *(void *)(a1 + 16672) = v99;
  z_crc_t v100 = crc_table[(v92 ^ BYTE3(v99))] ^ (v92 >> 8);
  *(void *)(a1 + 16680) = v100;
  char v108 = v97 ^ BYTE2(a16);
  z_crc_t v101 = crc_table[v98 ^ BYTE3(a16)] ^ (v98 >> 8);
  *(void *)(a1 + 16664) = v101;
  uint64_t v102 = 134775813 * (v99 + v101) + 1;
  *(void *)(a1 + 16672) = v102;
  *(void *)(a1 + 16680) = crc_table[(v100 ^ BYTE3(v102))] ^ (v100 >> 8);
  char v109 = ((unsigned __int16)((v100 & 0xFFFD ^ 3) * (v100 | 2)) >> 8) ^ BYTE3(a16);
  *(_DWORD *)(a1 + 16696) = 12;
  if ((*(uint64_t (**)(void, void, _DWORD *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v107, 12) != 12)return 0xFFFFFFFFLL; {
LABEL_112:
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 88) = 1;
  return result;
}

uint64_t zipCloseFileInZip(uint64_t a1)
{
  return zipCloseFileInZipRaw(a1, 0, 0);
}

uint64_t zipOpenNewFileInZip2(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, int a11)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0, 0, 0);
}

uint64_t zipOpenNewFileInZip3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10, uint64_t a11, int a12, int a13, unsigned char *a14, uint64_t a15)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, SHIDWORD(a11), a12, a13, a14, a15, 0, 0);
}

uint64_t zipOpenNewFileInZip(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, char *a6, unsigned int a7, char *a8, int a9, int a10)
{
  return zipOpenNewFileInZip4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0, 0, 0);
}

uint64_t zipWriteInFileInZip(uint64_t a1, const Bytef *a2, uInt a3)
{
  if (!a1) {
    return 4294967194;
  }
  if (!*(_DWORD *)(a1 + 88)) {
    return 4294967194;
  }
  *(void *)(a1 + 96) = a2;
  *(_DWORD *)(a1 + 104) = a3;
  *(void *)(a1 + 16648) = crc32(*(void *)(a1 + 16648), a2, a3);
  while (*(_DWORD *)(a1 + 104))
  {
    unsigned int v4 = *(_DWORD *)(a1 + 128);
    if (v4
      || (uint64_t result = zipFlushWriteBuffer(a1),
          unsigned int v4 = 0x4000,
          *(_DWORD *)(a1 + 128) = 0x4000,
          *(void *)(a1 + 120) = a1 + 256,
          result != -1))
    {
      if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
      {
        int v11 = *(_DWORD *)(a1 + 136);
        uint64_t result = deflate((z_streamp)(a1 + 96), 0);
        LODWORD(v7) = *(_DWORD *)(a1 + 136) - v11;
      }
      else
      {
        unsigned int v6 = *(_DWORD *)(a1 + 104);
        uint64_t v7 = v6 >= v4 ? v4 : v6;
        if (v7)
        {
          for (uint64_t i = 0; i != v7; ++i)
            *(unsigned char *)(*(void *)(a1 + 120) + i) = *(unsigned char *)(*(void *)(a1 + 96) + i);
          unsigned int v6 = *(_DWORD *)(a1 + 104);
          unsigned int v4 = *(_DWORD *)(a1 + 128);
          uint64_t v9 = v7;
        }
        else
        {
          uint64_t v9 = 0;
        }
        uint64_t result = 0;
        *(_DWORD *)(a1 + 104) = v6 - v7;
        *(_DWORD *)(a1 + 128) = v4 - v7;
        *(void *)(a1 + 96) += v9;
        uint64_t v10 = *(void *)(a1 + 120) + v9;
        *(void *)(a1 + 112) += v9;
        *(void *)(a1 + 120) = v10;
        *(void *)(a1 + 136) += v9;
      }
      *(_DWORD *)(a1 + 212) += v7;
      if (!result) {
        continue;
      }
    }
    return result;
  }
  return 0;
}

uint64_t zipFlushWriteBuffer(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 212);
  if (*(_DWORD *)(a1 + 16656) && v2)
  {
    unint64_t v3 = (unsigned char *)(a1 + 256);
    uint64_t v4 = *(unsigned int *)(a1 + 212);
    do
    {
      unint64_t v5 = *(void *)(a1 + 16680);
      uint64_t v6 = *(void *)(a1 + 16688);
      uint64_t v7 = *(void *)(v6 + 8 * (*v3 ^ *(void *)(a1 + 16664))) ^ (*(void *)(a1 + 16664) >> 8);
      *(void *)(a1 + 16664) = v7;
      uint64_t v8 = 134775813 * (*(void *)(a1 + 16672) + v7) + 1;
      *(void *)(a1 + 16672) = v8;
      *(void *)(a1 + 16680) = *(void *)(v6 + 8 * (v5 ^ BYTE3(v8))) ^ (v5 >> 8);
      *v3++ ^= (unsigned __int16)((v5 & 0xFFFD ^ 3) * (v5 | 2)) >> 8;
      --v4;
    }
    while (v4);
  }
  if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), a1 + 256, v2) == *(_DWORD *)(a1 + 212))uint64_t result = 0; {
  else
  }
    uint64_t result = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 212) = 0;
  return result;
}

uint64_t zipCloseFileInZipRaw(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a1 || !*(_DWORD *)(a1 + 88)) {
    return 4294967194;
  }
  *(_DWORD *)(a1 + 104) = 0;
  if (*(_DWORD *)(a1 + 248) != 8 || *(_DWORD *)(a1 + 252)) {
    goto LABEL_66;
  }
  do
  {
    if (!*(_DWORD *)(a1 + 128))
    {
      zipFlushWriteBuffer(a1);
      *(_DWORD *)(a1 + 128) = 0x4000;
      *(void *)(a1 + 120) = a1 + 256;
    }
    int v6 = *(_DWORD *)(a1 + 136);
    uint64_t v7 = deflate((z_streamp)(a1 + 96), 4);
    *(_DWORD *)(a1 + 212) += *(_DWORD *)(a1 + 136) - v6;
  }
  while (!v7);
  uint64_t v8 = v7;
  if (v7 == 1)
  {
LABEL_66:
    if (*(_DWORD *)(a1 + 212))
    {
      if (zipFlushWriteBuffer(a1) == -1) {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  if (*(_DWORD *)(a1 + 248) == 8 && !*(_DWORD *)(a1 + 252))
  {
    unsigned int v9 = deflateEnd((z_streamp)(a1 + 96));
    if (v8) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = v9;
    }
    *(_DWORD *)(a1 + 208) = 0;
  }
  if (!*(_DWORD *)(a1 + 252))
  {
    a3 = *(void *)(a1 + 16648);
    a2 = *(void *)(a1 + 112);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)(a1 + 136);
  uint64_t v12 = *(int *)(a1 + 16696);
  uint64_t v13 = (_DWORD *)(*(void *)(a1 + 224) + 16);
  unint64_t v14 = a3;
  do
  {
    unint64_t v15 = v14;
    *((unsigned char *)v13 + v10) = v14;
    v14 >>= 8;
    ++v10;
  }
  while (v10 != 4);
  unint64_t v16 = v11 + v12;
  if (v15 >= 0x100) {
    *uint64_t v13 = -1;
  }
  uint64_t v17 = 0;
  unsigned int v18 = (_DWORD *)(*(void *)(a1 + 224) + 20);
  unint64_t v19 = v11 + v12;
  do
  {
    unint64_t v20 = v19;
    *((unsigned char *)v18 + v17) = v19;
    v19 >>= 8;
    ++v17;
  }
  while (v17 != 4);
  if (v20 >= 0x100) {
    *unsigned int v18 = -1;
  }
  if (*(_DWORD *)(a1 + 184) == 1) {
    *(_WORD *)(*(void *)(a1 + 224) + 36) = 1;
  }
  uint64_t v21 = 0;
  unint64_t v22 = (_DWORD *)(*(void *)(a1 + 224) + 24);
  unint64_t v23 = a2;
  do
  {
    unint64_t v24 = v23;
    *((unsigned char *)v22 + v21) = v23;
    v23 >>= 8;
    ++v21;
  }
  while (v21 != 4);
  if (v24 >= 0x100) {
    *unint64_t v22 = -1;
  }
  if (v8)
  {
    free(*(void **)(a1 + 224));
  }
  else
  {
    uint64_t v8 = add_data_in_datablock((void *)(a1 + 72), *(char **)(a1 + 224), *(void *)(a1 + 232));
    free(*(void **)(a1 + 224));
    if (!v8)
    {
      uint64_t v25 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
      if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 216) + 14, 0))
      {
        goto LABEL_58;
      }
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)(a1 + 64);
      do
      {
        unint64_t v28 = a3;
        *((unsigned char *)&v37 + v26) = a3;
        a3 >>= 8;
        ++v26;
      }
      while (v26 != 4);
      if (v28 >= 0x100) {
        int v37 = -1;
      }
      if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v27, &v37, 4) != 4) {
        goto LABEL_58;
      }
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)(a1 + 64);
      do
      {
        unint64_t v31 = v16;
        *((unsigned char *)&v38 + v29) = v16;
        v16 >>= 8;
        ++v29;
      }
      while (v29 != 4);
      if (v31 >= 0x100) {
        int v38 = -1;
      }
      if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v30, &v38, 4) == 4)
      {
        uint64_t v32 = 0;
        uint64_t v33 = *(void *)(a1 + 64);
        do
        {
          unint64_t v34 = a2;
          *((unsigned char *)&v39 + v32) = a2;
          a2 >>= 8;
          ++v32;
        }
        while (v32 != 4);
        if (v34 >= 0x100) {
          int v39 = -1;
        }
        if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v33, &v39, 4) == 4)unsigned int v35 = 0; {
        else
        }
          unsigned int v35 = -1;
      }
      else
      {
LABEL_58:
        unsigned int v35 = -1;
      }
      if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v25, 0))
      {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v8 = v35;
      }
    }
  }
  ++*(void *)(a1 + 16720);
  *(_DWORD *)(a1 + 88) = 0;
  return v8;
}

uint64_t zipClose(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 4294967194;
  }
  unsigned int v2 = a2;
  if (*(_DWORD *)(a1 + 88) != 1)
  {
    unsigned int v4 = 0;
    if (!a2) {
      goto LABEL_7;
    }
LABEL_8:
    unsigned int v6 = strlen(v2);
    goto LABEL_9;
  }
  unsigned int v4 = zipCloseFileInZipRaw(a1, 0, 0);
  if (v2) {
    goto LABEL_8;
  }
LABEL_7:
  unsigned int v2 = *(const char **)(a1 + 16728);
  if (v2) {
    goto LABEL_8;
  }
  unsigned int v6 = 0;
LABEL_9:
  uint64_t v7 = (*(uint64_t (**)(void, void))(a1 + 24))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  if (!v4)
  {
    unsigned int v9 = *(void **)(a1 + 72);
    if (v9)
    {
      unint64_t v8 = 0;
      unsigned int v4 = 0;
      do
      {
        uint64_t v10 = v9[2];
        if (v4)
        {
          unsigned int v4 = -1;
        }
        else if (v10)
        {
          uint64_t v11 = (*(uint64_t (**)(void, void, void *))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v9 + 4);
          uint64_t v10 = v9[2];
          if (v11 == v10) {
            unsigned int v4 = 0;
          }
          else {
            unsigned int v4 = -1;
          }
        }
        else
        {
          unsigned int v4 = 0;
        }
        v8 += v10;
        unsigned int v9 = (void *)*v9;
      }
      while (v9);
      goto LABEL_21;
    }
    unsigned int v4 = 0;
  }
  unint64_t v8 = 0;
LABEL_21:
  uint64_t v12 = *(void **)(a1 + 72);
  if (v12)
  {
    do
    {
      uint64_t v13 = (void *)*v12;
      free(v12);
      uint64_t v12 = v13;
    }
    while (v13);
  }
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  if (!v4)
  {
    int v31 = 101010256;
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), &v31, 4) != 4)goto LABEL_53; {
    LOWORD(v31) = 0;
    }
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), &v31, 2) != 2)goto LABEL_53; {
    LOWORD(v31) = 0;
    }
    if ((*(uint64_t (**)(void, void, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), &v31, 2) != 2)goto LABEL_53; {
    uint64_t v14 = *(void *)(a1 + 64);
    }
    unint64_t v15 = *(void *)(a1 + 16720);
    LOWORD(v31) = v15;
    if (v15 >= 0x10000) {
      LOWORD(v31) = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v14, &v31, 2) != 2) {
      goto LABEL_53;
    }
    uint64_t v16 = *(void *)(a1 + 64);
    unint64_t v17 = *(void *)(a1 + 16720);
    LOWORD(v31) = v17;
    if (v17 >= 0x10000) {
      LOWORD(v31) = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v16, &v31, 2) != 2) {
      goto LABEL_53;
    }
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)(a1 + 64);
    do
    {
      unint64_t v20 = v8;
      *((unsigned char *)&v31 + v18) = v8;
      v8 >>= 8;
      ++v18;
    }
    while (v18 != 4);
    if (v20 >= 0x100) {
      int v31 = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v19, &v31, 4) != 4) {
      goto LABEL_53;
    }
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)(a1 + 64);
    unint64_t v23 = v7 - *(void *)(a1 + 16712);
    do
    {
      unint64_t v24 = v23;
      *((unsigned char *)&v31 + v21) = v23;
      v23 >>= 8;
      ++v21;
    }
    while (v21 != 4);
    if (v24 >= 0x100) {
      int v31 = -1;
    }
    if ((*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v22, &v31, 4) == 4)
    {
      uint64_t v25 = *(void *)(a1 + 64);
      LOWORD(v31) = v6;
      if (v6 >= 0x10000) {
        LOWORD(v31) = -1;
      }
      uint64_t v26 = (*(uint64_t (**)(void, uint64_t, int *, uint64_t))(a1 + 16))(*(void *)(a1 + 56), v25, &v31, 2);
      if (v26 == 2) {
        unsigned int v4 = 0;
      }
      else {
        unsigned int v4 = -1;
      }
      if (v26 == 2 && v6)
      {
        if ((*(uint64_t (**)(void, void, const char *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 64), v2, v6) == v6)unsigned int v4 = 0; {
        else
        }
          unsigned int v4 = -1;
      }
    }
    else
    {
LABEL_53:
      unsigned int v4 = -1;
    }
  }
  int v27 = (*(uint64_t (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 64));
  if (v4) {
    unsigned int v28 = v4;
  }
  else {
    unsigned int v28 = -1;
  }
  if (v27) {
    uint64_t v5 = v28;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v29 = *(void **)(a1 + 16728);
  if (v29) {
    free(v29);
  }
  free((void *)a1);
  return v5;
}

unsigned char *init_keys(unsigned char *result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = 878082192;
  *(_OWORD *)a2 = xmmword_E0E0;
  *(void *)(a2 + 16) = 878082192;
  int v4 = *result;
  if (*result)
  {
    uint64_t v5 = result + 1;
    unint64_t v6 = 305419896;
    uint64_t v7 = 591751049;
    do
    {
      unint64_t v6 = *(void *)(a3 + 8 * (v4 ^ v6)) ^ (v6 >> 8);
      uint64_t v7 = 134775813 * (v7 + v6) + 1;
      *(void *)a2 = v6;
      *(void *)(a2 + 8) = v7;
      unint64_t v3 = *(void *)(a3 + 8 * (v3 ^ BYTE3(v7))) ^ (v3 >> 8);
      *(void *)(a2 + 16) = v3;
      int v8 = *v5++;
      int v4 = v8;
    }
    while (v8);
  }
  return result;
}

FILE *fopen_file_func(int a1, char *__filename, char a3)
{
  int v3 = a3 & 3;
  int v4 = "r+b";
  uint64_t v5 = "wb";
  if ((a3 & 8) == 0) {
    uint64_t v5 = 0;
  }
  if ((a3 & 4) != 0) {
    LOBYTE(v6) = 1;
  }
  else {
    int v6 = (a3 & 8) >> 3;
  }
  if ((a3 & 4) == 0) {
    int v4 = v5;
  }
  if (v3 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  if (v3 == 1) {
    int v8 = "rb";
  }
  else {
    int v8 = v4;
  }
  if (__filename && (v7 & 1) != 0) {
    return fopen(__filename, v8);
  }
  else {
    return 0;
  }
}

size_t fread_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fread(__ptr, 1uLL, __nitems, __stream);
}

size_t fwrite_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fwrite(__ptr, 1uLL, __nitems, __stream);
}

uint64_t ftell_file_func(int a1, FILE *a2)
{
  return ftell(a2);
}

uint64_t fseek_file_func(int a1, FILE *a2, uint64_t a3, unsigned int a4)
{
  if (a4 > 2) {
    return -1;
  }
  if (fseek(a2, a3, a4)) {
    return -1;
  }
  return 0;
}

uint64_t fclose_file_func(int a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t ferror_file_func(int a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**fill_fopen_filefunc(FILE *(**result)(int a1, char *__filename, char a3)))(int a1, char *__filename, char a3)
{
  *uint64_t result = fopen_file_func;
  result[1] = (FILE *(*)(int, char *, char))fread_file_func;
  result[2] = (FILE *(*)(int, char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(int, char *, char))ftell_file_func;
  result[4] = (FILE *(*)(int, char *, char))fseek_file_func;
  result[5] = (FILE *(*)(int, char *, char))fclose_file_func;
  result[6] = (FILE *(*)(int, char *, char))ferror_file_func;
  result[7] = 0;
  return result;
}

void sub_B994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_BE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLogCategoryDatabase()
{
  return __MTLogCategoryDatabase();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

const char *__cdecl asl_get(asl_object_t msg, const char *key)
{
  return _asl_get(msg, key);
}

asl_object_t asl_new(uint32_t type)
{
  return _asl_new(type);
}

asl_object_t asl_next(asl_object_t obj)
{
  return _asl_next(obj);
}

void asl_release(asl_object_t obj)
{
}

asl_object_t asl_search(asl_object_t obj, asl_object_t query)
{
  return _asl_search(obj, query);
}

uint64_t atol(const char *a1)
{
  return _atol(a1);
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

int deflate(z_streamp strm, int flush)
{
  return _deflate(strm, flush);
}

int deflateEnd(z_streamp strm)
{
  return _deflateEnd(strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return _deflateInit2_(strm, level, method, windowBits, memLevel, strategy, version, stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
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

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

const z_crc_t *get_crc_table(void)
{
  return _get_crc_table();
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return _inet_ntoa(a1);
}

int inflate(z_streamp strm, int flush)
{
  return _inflate(strm, flush);
}

int inflateEnd(z_streamp strm)
{
  return _inflateEnd(strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return _inflateInit2_(strm, windowBits, version, stream_size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int rand(void)
{
  return _rand();
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

int scanf(const char *a1, ...)
{
  return _scanf(a1);
}

void srand(unsigned int a1)
{
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int utime(const char *a1, const utimbuf *a2)
{
  return _utime(a1, a2);
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return [a1 actionButton];
}

id objc_msgSend_allViewControllers(void *a1, const char *a2, ...)
{
  return [a1 allViewControllers];
}

id objc_msgSend_applicationDocumentsDirectory(void *a1, const char *a2, ...)
{
  return [a1 applicationDocumentsDirectory];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dataUrl(void *a1, const char *a2, ...)
{
  return [a1 dataUrl];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_debugData(void *a1, const char *a2, ...)
{
  return [a1 debugData];
}

id objc_msgSend_debugDataFileName(void *a1, const char *a2, ...)
{
  return [a1 debugDataFileName];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugViewController(void *a1, const char *a2, ...)
{
  return [a1 debugViewController];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 filledButtonConfiguration];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gatherData(void *a1, const char *a2, ...)
{
  return [a1 gatherData];
}

id objc_msgSend_getIPAddress(void *a1, const char *a2, ...)
{
  return [a1 getIPAddress];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_is17Net(void *a1, const char *a2, ...)
{
  return [a1 is17Net];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_privateQueueContext(void *a1, const char *a2, ...)
{
  return [a1 privateQueueContext];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return [a1 progressView];
}

id objc_msgSend_progressViewContainer(void *a1, const char *a2, ...)
{
  return [a1 progressViewContainer];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_recursiveDescription(void *a1, const char *a2, ...)
{
  return [a1 recursiveDescription];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenShotImage(void *a1, const char *a2, ...)
{
  return [a1 screenShotImage];
}

id objc_msgSend_screenShotImageView(void *a1, const char *a2, ...)
{
  return [a1 screenShotImageView];
}

id objc_msgSend_screenShotPreviewImage(void *a1, const char *a2, ...)
{
  return [a1 screenShotPreviewImage];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_shareData(void *a1, const char *a2, ...)
{
  return [a1 shareData];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedApplicationIfPossible(void *a1, const char *a2, ...)
{
  return [a1 sharedApplicationIfPossible];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return [a1 stackView];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}