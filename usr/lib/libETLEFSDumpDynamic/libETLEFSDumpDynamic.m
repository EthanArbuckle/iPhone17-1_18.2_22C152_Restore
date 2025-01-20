uint64_t ETLEFSDumpInterpret(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t v7;
  long long v8;
  long long v9;
  char *v10;
  char *v11;
  _OWORD v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x263EF8340];
  result = (uint64_t)malloc(0x50uLL);
  *a3 = 0;
  if (result)
  {
    v7 = result;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    if (a2 < 0x38
      || (v8 = *(_OWORD *)(a1 + 16),
          *(_OWORD *)result = *(_OWORD *)a1,
          *(_OWORD *)(result + 16) = v8,
          *(_OWORD *)(result + 32) = *(_OWORD *)(a1 + 32),
          *(void *)(result + 48) = *(void *)(a1 + 48),
          a2 - 62 > 0xFFFFFFF9))
    {
      v10 = 0;
    }
    else
    {
      *(_DWORD *)(result + 56) = *(_DWORD *)(a1 + 56);
      *(_WORD *)(result + 60) = *(_WORD *)(a1 + 60);
      *(void *)&v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v12[14] = v9;
      v12[15] = v9;
      v12[12] = v9;
      v12[13] = v9;
      v12[10] = v9;
      v12[11] = v9;
      v12[8] = v9;
      v12[9] = v9;
      v12[6] = v9;
      v12[7] = v9;
      v12[4] = v9;
      v12[5] = v9;
      v12[2] = v9;
      v12[3] = v9;
      v12[0] = v9;
      v12[1] = v9;
      TelephonyUtilStrlcpy();
      v10 = strdup((const char *)v12);
      *(void *)(v7 + 62) = v10;
      if (v10)
      {
        TelephonyUtilStrlcpy();
        v11 = strdup((const char *)v12);
        *(void *)(v7 + 70) = v11;
        if (v11)
        {
          *a3 = v7;
          return 1;
        }
      }
    }
    free(v10);
    free((void *)v7);
    return 0;
  }
  return result;
}

uint64_t ETLEFSDumpInfoFree(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 62));
    free(*(void **)(a1 + 70));
    free((void *)a1);
  }
  return 1;
}

BOOL ETLEFSDumpCopyCrashHeaderDetails(uint64_t a1, _WORD *a2, _WORD *a3)
{
  if (a1)
  {
    *a2 = *(_WORD *)a1;
    *a3 = *(_DWORD *)(a1 + 4);
  }
  return a1 != 0;
}

BOOL ETLEFSDumpCopySoftwareVersion(uint64_t a1)
{
  if (a1) {
    TelephonyUtilStrlcpy();
  }
  return a1 != 0;
}

BOOL ETLEFSDUmpCopyCrashLocationDetails(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 320) = 0;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (a1)
  {
    int v3 = *(unsigned __int16 *)(a1 + 60);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(a2 + 4) = v3;
    TelephonyUtilStrlcpy();
    TelephonyUtilStrlcpy();
  }
  return a1 != 0;
}

uint64_t ETLEFCopyCrashLocationDetailsM20(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (a1) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  if (!v3)
  {
    v8 = (char *)operator new(0x20uLL);
    long long v244 = xmmword_21DE150D0;
    strcpy(v8, "Not provided from Baseband");
    uint64_t v242 = 0x7AAAAAAAAAAAAAALL;
    v243 = v8;
    unint64_t v241 = 0xAAAAAAAAAAAAAAAALL;
    strcpy((char *)&v240, "Unknown");
    if (a2)
    {
      uint64_t v9 = a2;
      v10 = a1;
      while (*v10)
      {
        ++v10;
        if (!--v9)
        {
          v10 = &a1[a2];
          break;
        }
      }
    }
    else
    {
      v10 = a1;
    }
    unint64_t v11 = v10 - a1;
    memset(__dst, 170, sizeof(__dst));
    if ((unint64_t)(v10 - a1) > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v11 > 0x16)
    {
      uint64_t v19 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v11 | 7) != 0x17) {
        uint64_t v19 = v11 | 7;
      }
      uint64_t v20 = v19 + 1;
      v12 = (const void **)operator new(v19 + 1);
      __dst[1] = (const void *)(v10 - a1);
      __dst[2] = (const void *)(v20 | 0x8000000000000000);
      __dst[0] = v12;
      if (v10 == a1)
      {
LABEL_20:
        *(unsigned char *)v12 = 0;
        *(_DWORD *)(a3 + 384) = 0;
        *(_OWORD *)(a3 + 352) = 0u;
        *(_OWORD *)(a3 + 368) = 0u;
        *(_OWORD *)(a3 + 320) = 0u;
        *(_OWORD *)(a3 + 336) = 0u;
        *(_OWORD *)(a3 + 288) = 0u;
        *(_OWORD *)(a3 + 304) = 0u;
        *(_OWORD *)(a3 + 256) = 0u;
        *(_OWORD *)(a3 + 272) = 0u;
        *(_OWORD *)(a3 + 224) = 0u;
        *(_OWORD *)(a3 + 240) = 0u;
        *(_OWORD *)(a3 + 192) = 0u;
        *(_OWORD *)(a3 + 208) = 0u;
        *(_OWORD *)(a3 + 160) = 0u;
        *(_OWORD *)(a3 + 176) = 0u;
        *(_OWORD *)(a3 + 128) = 0u;
        *(_OWORD *)(a3 + 144) = 0u;
        *(_OWORD *)(a3 + 96) = 0u;
        *(_OWORD *)(a3 + 112) = 0u;
        *(_OWORD *)(a3 + 64) = 0u;
        *(_OWORD *)(a3 + 80) = 0u;
        *(_OWORD *)(a3 + 32) = 0u;
        *(_OWORD *)(a3 + 48) = 0u;
        v13 = (const void *)HIBYTE(__dst[2]);
        int v14 = SHIBYTE(__dst[2]);
        v15 = __dst[1];
        if (SHIBYTE(__dst[2]) < 0) {
          v13 = __dst[1];
        }
        *(_OWORD *)a3 = 0uLL;
        *(_OWORD *)(a3 + 16) = 0uLL;
        if (!v13)
        {
          if (SHIBYTE(v242) < 0)
          {
            v22 = v240;
            size_t v21 = v241;
            v23 = v240;
          }
          else
          {
            size_t v21 = HIBYTE(v242);
            v22 = (const char *)&v240;
            v23 = (const char *)&v240;
          }
          strncpy((char *)(a3 + 4), v23, v21);
          strncpy((char *)(a3 + 68), v22, v21);
          *(_DWORD *)a3 = 0;
          v39 = (char *)(a3 + 132);
          if (v244 >= 0) {
            v40 = (const char *)&v243;
          }
          else {
            v40 = v243;
          }
          if (v244 >= 0) {
            size_t v41 = HIBYTE(v244);
          }
          else {
            size_t v41 = v244;
          }
          strncpy(v39, v40, v41);
          if ((v14 & 0x80) == 0)
          {
LABEL_380:
            if (SHIBYTE(v242) < 0)
            {
              operator delete(v240);
              if ((SHIBYTE(v244) & 0x80000000) == 0) {
                return v4;
              }
            }
            else if ((SHIBYTE(v244) & 0x80000000) == 0)
            {
              return v4;
            }
            operator delete(v243);
            return v4;
          }
LABEL_379:
          operator delete((void *)__dst[0]);
          goto LABEL_380;
        }
        long long v237 = 0uLL;
        uint64_t v238 = 0;
        *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v230 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v232 = 0xAAAAAAAAAAAAAA00;
        long long v235 = v16;
        uint64_t v231 = 0;
        uint64_t v233 = 0;
        uint64_t v234 = 0;
        LOBYTE(v235) = 0;
        BYTE8(v235) = 0;
        uint64_t v236 = 0;
        memset(buf, 0, sizeof(buf));
        *((void *)&__s2 + 1) = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v228 = 0x4AAAAAAAAAAAAAALL;
        *(void *)&long long __s2 = 0xAAAAAA003A727373;
        if (v14 < 0)
        {
          if ((unint64_t)v15 >= 4) {
            size_t v24 = 4;
          }
          else {
            size_t v24 = (size_t)v15;
          }
          int v18 = memcmp(__dst[0], &__s2, v24);
          if (v24 != 4) {
            goto LABEL_41;
          }
        }
        else
        {
          if ((v14 & 0xFC) != 0) {
            size_t v17 = 4;
          }
          else {
            size_t v17 = v14;
          }
          int v18 = memcmp(__dst, &__s2, v17);
          if (v17 != 4) {
            goto LABEL_41;
          }
        }
        if (!v18)
        {
          long long v237 = __s2;
          uint64_t v238 = v228;
        }
LABEL_41:
        v226.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
        *(_OWORD *)&v226.__r_.__value_.__r.__words[1] = xmmword_21DE150E0;
        strcpy(v226.__r_.__value_.__l.__data_, "([^:]*):([^:]*):([^:]*):(.*)");
        if (ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
        {
          v25 = *(uint8_t **)buf;
          unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
          if (v26 <= 1) {
            v27 = buf;
          }
          else {
            v27 = *(uint8_t **)buf;
          }
          if (!v27[40])
          {
            v42 = 0;
            char v43 = 0;
            memset(&__str, 0, sizeof(__str));
            goto LABEL_91;
          }
          uint64_t v29 = *((void *)v27 + 3);
          v28 = (char *)*((void *)v27 + 4);
          unint64_t v30 = (unint64_t)&v28[-v29];
          if ((unint64_t)&v28[-v29] > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v30 > 0x16)
          {
            uint64_t v55 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v30 | 7) != 0x17) {
              uint64_t v55 = v30 | 7;
            }
            uint64_t v56 = v55 + 1;
            p_str = (char *)operator new(v55 + 1);
            __str.__r_.__value_.__l.__size_ = (std::string::size_type)&v28[-v29];
            __str.__r_.__value_.__r.__words[2] = v56 | 0x8000000000000000;
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)p_str;
            if ((char *)v29 != v28) {
              goto LABEL_49;
            }
          }
          else
          {
            *((unsigned char *)&__str.__r_.__value_.__s + 23) = (_BYTE)v28 - v29;
            p_str = (char *)&__str;
            if ((char *)v29 != v28)
            {
LABEL_49:
              if (v30 < 0x20 || (unint64_t)&p_str[-v29] < 0x20)
              {
                v32 = p_str;
                v33 = (char *)v29;
              }
              else
              {
                v32 = &p_str[v30 & 0xFFFFFFFFFFFFFFE0];
                v33 = (char *)(v29 + (v30 & 0xFFFFFFFFFFFFFFE0));
                v34 = (long long *)(v29 + 16);
                v35 = p_str + 16;
                unint64_t v36 = v30 & 0xFFFFFFFFFFFFFFE0;
                do
                {
                  long long v37 = *v34;
                  *(v35 - 1) = *(v34 - 1);
                  _OWORD *v35 = v37;
                  v34 += 2;
                  v35 += 2;
                  v36 -= 32;
                }
                while (v36);
                if (v30 == (v30 & 0xFFFFFFFFFFFFFFE0)) {
                  goto LABEL_90;
                }
              }
              do
              {
                char v57 = *v33++;
                *v32++ = v57;
              }
              while (v33 != v28);
LABEL_90:
              char *v32 = 0;
              char v43 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
              v42 = (std::string *)__str.__r_.__value_.__r.__words[0];
              v25 = *(uint8_t **)buf;
              unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
LABEL_91:
              v58 = (char *)(a3 + 4);
              if (v43 >= 0) {
                v59 = &__str;
              }
              else {
                v59 = v42;
              }
              v60 = buf;
              if (v26 <= 1) {
                v61 = buf;
              }
              else {
                v61 = v25;
              }
              if (v61[40])
              {
                if (v26 > 1) {
                  v60 = v25;
                }
                unint64_t v62 = *((void *)v60 + 4) - *((void *)v60 + 3);
                if (v62 >= 0x40) {
                  size_t v63 = 64;
                }
                else {
                  size_t v63 = v62;
                }
                strncpy(v58, (const char *)v59, v63);
                if (v43 < 0) {
                  goto LABEL_104;
                }
              }
              else
              {
                strncpy(v58, (const char *)v59, 0);
                if (v43 < 0)
                {
LABEL_104:
                  operator delete(v42);
                  v25 = *(uint8_t **)buf;
                  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
                }
              }
              v64 = (long long *)(v25 + 64);
              if (v26 <= 2) {
                v64 = &v230;
              }
              if (!*(unsigned char *)v64)
              {
                v77 = 0;
                char v78 = 0;
                memset(&__str, 0, sizeof(__str));
                goto LABEL_131;
              }
              v65 = v25 + 48;
              if (v26 <= 2) {
                v65 = &buf[24];
              }
              uint64_t v66 = *(void *)v65;
              v67 = v25 + 56;
              if (v26 <= 2) {
                v67 = &buf[32];
              }
              v68 = *(char **)v67;
              std::string::size_type v69 = *(void *)v67 - v66;
              if (v69 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              if (v69 > 0x16)
              {
                uint64_t v79 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v69 | 7) != 0x17) {
                  uint64_t v79 = v69 | 7;
                }
                uint64_t v80 = v79 + 1;
                v70 = (char *)operator new(v79 + 1);
                __str.__r_.__value_.__l.__size_ = v69;
                __str.__r_.__value_.__r.__words[2] = v80 | 0x8000000000000000;
                __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v70;
                if ((char *)v66 != v68) {
                  goto LABEL_115;
                }
              }
              else
              {
                *((unsigned char *)&__str.__r_.__value_.__s + 23) = *v67 - v66;
                v70 = (char *)&__str;
                if ((char *)v66 != v68)
                {
LABEL_115:
                  if (v69 < 0x20 || (unint64_t)&v70[-v66] < 0x20)
                  {
                    v71 = v70;
                    v72 = (char *)v66;
                  }
                  else
                  {
                    v71 = &v70[v69 & 0xFFFFFFFFFFFFFFE0];
                    v72 = (char *)(v66 + (v69 & 0xFFFFFFFFFFFFFFE0));
                    v73 = (long long *)(v66 + 16);
                    v74 = v70 + 16;
                    unint64_t v75 = v69 & 0xFFFFFFFFFFFFFFE0;
                    do
                    {
                      long long v76 = *v73;
                      *(v74 - 1) = *(v73 - 1);
                      _OWORD *v74 = v76;
                      v73 += 2;
                      v74 += 2;
                      v75 -= 32;
                    }
                    while (v75);
                    if (v69 == (v69 & 0x7FFFFFFFFFFFFFE0)) {
                      goto LABEL_130;
                    }
                  }
                  do
                  {
                    char v81 = *v72++;
                    *v71++ = v81;
                  }
                  while (v72 != v68);
LABEL_130:
                  char *v71 = 0;
                  char v78 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                  v77 = (std::string *)__str.__r_.__value_.__r.__words[0];
                  v25 = *(uint8_t **)buf;
                  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
LABEL_131:
                  v82 = (char *)(a3 + 68);
                  if (v78 >= 0) {
                    v83 = &__str;
                  }
                  else {
                    v83 = v77;
                  }
                  v84 = (long long *)(v25 + 64);
                  if (v26 <= 2) {
                    v84 = &v230;
                  }
                  if (*(unsigned char *)v84)
                  {
                    v85 = v25 + 48;
                    if (v26 <= 2) {
                      v85 = &buf[24];
                    }
                    uint64_t v86 = *(void *)v85;
                    v87 = v25 + 56;
                    if (v26 <= 2) {
                      v87 = &buf[32];
                    }
                    unint64_t v88 = *(void *)v87 - v86;
                    if (v88 >= 0x40) {
                      size_t v89 = 64;
                    }
                    else {
                      size_t v89 = v88;
                    }
                    strncpy(v82, (const char *)v83, v89);
                    if (v78 < 0) {
                      goto LABEL_145;
                    }
                  }
                  else
                  {
                    strncpy(v82, (const char *)v83, 0);
                    if (v78 < 0)
                    {
LABEL_145:
                      operator delete(v77);
                      v25 = *(uint8_t **)buf;
                      unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
                    }
                  }
                  v90 = (long long *)(v25 + 88);
                  if (v26 <= 3) {
                    v90 = &v230;
                  }
                  if (*(unsigned char *)v90)
                  {
                    v91 = v25 + 72;
                    BOOL v92 = v26 > 3;
                    if (v26 <= 3) {
                      v91 = &buf[24];
                    }
                    uint64_t v93 = *(void *)v91;
                    v94 = v25 + 80;
                    if (!v92) {
                      v94 = &buf[32];
                    }
                    v95 = *(char **)v94;
                    std::string::size_type v96 = *(void *)v94 - v93;
                    if (v96 > 0x7FFFFFFFFFFFFFF7) {
                      std::string::__throw_length_error[abi:ne180100]();
                    }
                    if (v96 > 0x16)
                    {
                      uint64_t v104 = (v96 & 0xFFFFFFFFFFFFFFF8) + 8;
                      if ((v96 | 7) != 0x17) {
                        uint64_t v104 = v96 | 7;
                      }
                      uint64_t v105 = v104 + 1;
                      v97 = operator new(v104 + 1);
                      __str.__r_.__value_.__l.__size_ = v96;
                      __str.__r_.__value_.__r.__words[2] = v105 | 0x8000000000000000;
                      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v97;
                      if ((char *)v93 != v95)
                      {
LABEL_156:
                        if (v96 < 0x20 || (unint64_t)&v97[-v93] < 0x20)
                        {
                          v98 = v97;
                          v99 = (char *)v93;
                        }
                        else
                        {
                          v98 = &v97[v96 & 0xFFFFFFFFFFFFFFE0];
                          v99 = (char *)(v93 + (v96 & 0xFFFFFFFFFFFFFFE0));
                          v100 = (long long *)(v93 + 16);
                          v101 = v97 + 16;
                          unint64_t v102 = v96 & 0xFFFFFFFFFFFFFFE0;
                          do
                          {
                            long long v103 = *v100;
                            *(v101 - 1) = *(v100 - 1);
                            _OWORD *v101 = v103;
                            v100 += 2;
                            v101 += 2;
                            v102 -= 32;
                          }
                          while (v102);
                          if (v96 == (v96 & 0x7FFFFFFFFFFFFFE0)) {
                            goto LABEL_171;
                          }
                        }
                        do
                        {
                          char v106 = *v99++;
                          *v98++ = v106;
                        }
                        while (v99 != v95);
LABEL_171:
                        unsigned char *v98 = 0;
                        goto LABEL_172;
                      }
                    }
                    else
                    {
                      *((unsigned char *)&__str.__r_.__value_.__s + 23) = *v94 - v93;
                      v97 = &__str;
                      if ((char *)v93 != v95) {
                        goto LABEL_156;
                      }
                    }
                    unsigned char *v97 = 0;
                    goto LABEL_172;
                  }
LABEL_164:
                  memset(&__str, 0, sizeof(__str));
                  goto LABEL_172;
                }
              }
              v71 = v70;
              goto LABEL_130;
            }
          }
          v32 = p_str;
          goto LABEL_90;
        }
        if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0)
        {
          v226.__r_.__value_.__l.__size_ = 15;
          v38 = (std::string *)v226.__r_.__value_.__r.__words[0];
        }
        else
        {
          *((unsigned char *)&v226.__r_.__value_.__s + 23) = 15;
          v38 = &v226;
        }
        strcpy((char *)v38, "([^:]*):([^:]*)");
        if (ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
        {
          v44 = *(uint8_t **)buf;
          unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
          if (v45 <= 1) {
            v46 = buf;
          }
          else {
            v46 = *(uint8_t **)buf;
          }
          if (!v46[40])
          {
            std::string::size_type v107 = 0;
            char v108 = 0;
            memset(&__str, 0, sizeof(__str));
LABEL_196:
            v119 = (char *)(a3 + 4);
            if (v108 >= 0) {
              v120 = &__str;
            }
            else {
              v120 = (std::string *)v107;
            }
            if (v45 <= 1) {
              v121 = buf;
            }
            else {
              v121 = v44;
            }
            if (v121[40])
            {
              if (v45 <= 1) {
                v44 = buf;
              }
              unint64_t v122 = *((void *)v44 + 4) - *((void *)v44 + 3);
              if (v122 >= 0x40) {
                size_t v123 = 64;
              }
              else {
                size_t v123 = v122;
              }
              strncpy(v119, (const char *)v120, v123);
              if ((v108 & 0x80) == 0) {
                goto LABEL_343;
              }
              goto LABEL_211;
            }
            strncpy(v119, (const char *)v120, 0);
            if (v108 < 0)
            {
LABEL_211:
              v124 = (void *)v107;
LABEL_212:
              operator delete(v124);
            }
LABEL_343:
            v204 = (char *)(a3 + 68);
            if (v242 >= 0) {
              v205 = (const char *)&v240;
            }
            else {
              v205 = v240;
            }
            if (v242 >= 0) {
              size_t v206 = HIBYTE(v242);
            }
            else {
              size_t v206 = v241;
            }
LABEL_349:
            strncpy(v204, v205, v206);
            *(_DWORD *)a3 = 0;
            goto LABEL_350;
          }
          if (v45 <= 1) {
            v44 = buf;
          }
          uint64_t v48 = *((void *)v44 + 3);
          v47 = (char *)*((void *)v44 + 4);
          unint64_t v49 = (unint64_t)&v47[-v48];
          if ((unint64_t)&v47[-v48] > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v49 > 0x16)
          {
            uint64_t v110 = (v49 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v49 | 7) != 0x17) {
              uint64_t v110 = v49 | 7;
            }
            uint64_t v111 = v110 + 1;
            v50 = (char *)operator new(v110 + 1);
            __str.__r_.__value_.__l.__size_ = (std::string::size_type)&v47[-v48];
            __str.__r_.__value_.__r.__words[2] = v111 | 0x8000000000000000;
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v50;
          }
          else
          {
            *((unsigned char *)&__str.__r_.__value_.__s + 23) = (_BYTE)v47 - v48;
            v50 = (char *)&__str;
          }
          if ((char *)v48 == v47)
          {
            v112 = v50;
          }
          else
          {
            if (v49 < 0x20 || (unint64_t)&v50[-v48] < 0x20)
            {
              v112 = v50;
              v113 = (char *)v48;
            }
            else
            {
              v112 = &v50[v49 & 0xFFFFFFFFFFFFFFE0];
              v113 = (char *)(v48 + (v49 & 0xFFFFFFFFFFFFFFE0));
              v114 = (long long *)(v48 + 16);
              v115 = v50 + 16;
              unint64_t v116 = v49 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v117 = *v114;
                *(v115 - 1) = *(v114 - 1);
                _OWORD *v115 = v117;
                v114 += 2;
                v115 += 2;
                v116 -= 32;
              }
              while (v116);
              if (v49 == (v49 & 0xFFFFFFFFFFFFFFE0)) {
                goto LABEL_195;
              }
            }
            do
            {
              char v118 = *v113++;
              *v112++ = v118;
            }
            while (v113 != v47);
          }
LABEL_195:
          char *v112 = 0;
          char v108 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
          std::string::size_type v107 = __str.__r_.__value_.__r.__words[0];
          v44 = *(uint8_t **)buf;
          unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
          goto LABEL_196;
        }
        HIBYTE(v228) = 11;
        strcpy((char *)&__s2, "ssr:return:");
        if (SHIBYTE(__dst[2]) < 0)
        {
          if (__dst[1] >= (const void *)0xB) {
            size_t v109 = 11;
          }
          else {
            size_t v109 = (size_t)__dst[1];
          }
          int v52 = memcmp(__dst[0], &__s2, v109);
          if (v109 != 11) {
            goto LABEL_214;
          }
        }
        else
        {
          if (HIBYTE(__dst[2]) >= 0xBu) {
            size_t v51 = 11;
          }
          else {
            size_t v51 = HIBYTE(__dst[2]);
          }
          int v52 = memcmp(__dst, &__s2, v51);
          if (v51 != 11) {
            goto LABEL_214;
          }
        }
        if (!v52)
        {
          if (SHIBYTE(v238) < 0)
          {
            std::string::__assign_no_alias<false>((void **)&v237, &__s2, 0xBuLL);
          }
          else
          {
            long long v237 = __s2;
            uint64_t v238 = v228;
          }
        }
LABEL_214:
        std::string::__assign_external(&v226, v53, v54);
        if (!ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
        {
          if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0)
          {
            v226.__r_.__value_.__l.__size_ = 15;
            v132 = (std::string *)v226.__r_.__value_.__r.__words[0];
          }
          else
          {
            *((unsigned char *)&v226.__r_.__value_.__s + 23) = 15;
            v132 = &v226;
          }
          strcpy((char *)v132, "([^:]*):([^:]*)");
          if (!ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
          {
            if (SHIBYTE(v242) < 0)
            {
              v145 = (void **)v240;
              size_t v144 = v241;
              v147 = (char *)(a3 + 4);
              v146 = v240;
            }
            else
            {
              size_t v144 = HIBYTE(v242);
              v145 = (void **)&v240;
              v146 = (const char *)&v240;
              v147 = (char *)(a3 + 4);
            }
            strncpy(v147, v146, v144);
            v204 = (char *)(a3 + 68);
            v205 = (const char *)v145;
            size_t v206 = v144;
            goto LABEL_349;
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3) <= 1) {
            v135 = (uint64_t *)&buf[24];
          }
          else {
            v135 = (uint64_t *)(*(void *)buf + 24);
          }
          std::sub_match<std::__wrap_iter<char const*>>::str[abi:ne180100](&__str, v135);
          int v136 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
          std::string::size_type v137 = __str.__r_.__value_.__r.__words[0];
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v138 = &__str;
          }
          else {
            v138 = (std::string *)__str.__r_.__value_.__r.__words[0];
          }
          v139 = *(uint8_t **)buf;
          unint64_t v140 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
          if (v140 <= 1) {
            v141 = buf;
          }
          else {
            v141 = *(uint8_t **)buf;
          }
          if (v141[40])
          {
            if (v140 <= 1) {
              v139 = buf;
            }
            unint64_t v142 = *((void *)v139 + 4) - *((void *)v139 + 3);
            if (v142 >= 0x40) {
              size_t v143 = 64;
            }
            else {
              size_t v143 = v142;
            }
          }
          else
          {
            size_t v143 = 0;
          }
          strncpy((char *)(a3 + 4), (const char *)v138, v143);
          if (v136 < 0)
          {
            v124 = (void *)v137;
            goto LABEL_212;
          }
          goto LABEL_343;
        }
        v125 = *(uint8_t **)buf;
        unint64_t v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
        if (v126 <= 1) {
          v127 = buf;
        }
        else {
          v127 = *(uint8_t **)buf;
        }
        if (!v127[40])
        {
          v133 = 0;
          char v134 = 0;
          memset(&__str, 0, sizeof(__str));
          goto LABEL_258;
        }
        uint64_t v129 = *((void *)v127 + 3);
        v128 = (char *)*((void *)v127 + 4);
        unint64_t v130 = (unint64_t)&v128[-v129];
        if ((unint64_t)&v128[-v129] > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v130 > 0x16)
        {
          uint64_t v148 = (v130 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v130 | 7) != 0x17) {
            uint64_t v148 = v130 | 7;
          }
          uint64_t v149 = v148 + 1;
          v131 = (char *)operator new(v148 + 1);
          __str.__r_.__value_.__l.__size_ = (std::string::size_type)&v128[-v129];
          __str.__r_.__value_.__r.__words[2] = v149 | 0x8000000000000000;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v131;
        }
        else
        {
          *((unsigned char *)&__str.__r_.__value_.__s + 23) = (_BYTE)v128 - v129;
          v131 = (char *)&__str;
        }
        if ((char *)v129 == v128)
        {
          v150 = v131;
        }
        else
        {
          if (v130 < 0x20 || (unint64_t)&v131[-v129] < 0x20)
          {
            v150 = v131;
            v151 = (char *)v129;
          }
          else
          {
            v150 = &v131[v130 & 0xFFFFFFFFFFFFFFE0];
            v151 = (char *)(v129 + (v130 & 0xFFFFFFFFFFFFFFE0));
            v152 = (long long *)(v129 + 16);
            v153 = v131 + 16;
            unint64_t v154 = v130 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v155 = *v152;
              *(v153 - 1) = *(v152 - 1);
              _OWORD *v153 = v155;
              v152 += 2;
              v153 += 2;
              v154 -= 32;
            }
            while (v154);
            if (v130 == (v130 & 0xFFFFFFFFFFFFFFE0)) {
              goto LABEL_257;
            }
          }
          do
          {
            char v156 = *v151++;
            *v150++ = v156;
          }
          while (v151 != v128);
        }
LABEL_257:
        char *v150 = 0;
        char v134 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        v133 = (std::string *)__str.__r_.__value_.__r.__words[0];
        v125 = *(uint8_t **)buf;
        unint64_t v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
LABEL_258:
        if (v134 >= 0) {
          v157 = &__str;
        }
        else {
          v157 = v133;
        }
        v158 = buf;
        if (v126 <= 1) {
          v159 = buf;
        }
        else {
          v159 = v125;
        }
        if (v159[40])
        {
          if (v126 > 1) {
            v158 = v125;
          }
          unint64_t v160 = *((void *)v158 + 4) - *((void *)v158 + 3);
          if (v160 >= 0x40) {
            size_t v161 = 64;
          }
          else {
            size_t v161 = v160;
          }
        }
        else
        {
          size_t v161 = 0;
        }
        strncpy((char *)(a3 + 4), (const char *)v157, v161);
        if (v134 < 0)
        {
          operator delete(v133);
          v125 = *(uint8_t **)buf;
          unint64_t v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
        }
        v162 = (long long *)(v125 + 64);
        if (v126 <= 2) {
          v162 = &v230;
        }
        if (!*(unsigned char *)v162)
        {
          v169 = 0;
          char v170 = 0;
          memset(&__str, 0, sizeof(__str));
          goto LABEL_298;
        }
        v163 = v125 + 48;
        if (v126 <= 2) {
          v163 = &buf[24];
        }
        uint64_t v164 = *(void *)v163;
        v165 = v125 + 56;
        if (v126 <= 2) {
          v165 = &buf[32];
        }
        v166 = *(char **)v165;
        std::string::size_type v167 = *(void *)v165 - v164;
        if (v167 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v167 > 0x16)
        {
          uint64_t v171 = (v167 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v167 | 7) != 0x17) {
            uint64_t v171 = v167 | 7;
          }
          uint64_t v172 = v171 + 1;
          v168 = (char *)operator new(v171 + 1);
          __str.__r_.__value_.__l.__size_ = v167;
          __str.__r_.__value_.__r.__words[2] = v172 | 0x8000000000000000;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v168;
        }
        else
        {
          *((unsigned char *)&__str.__r_.__value_.__s + 23) = *v165 - v164;
          v168 = (char *)&__str;
        }
        if ((char *)v164 == v166)
        {
          v173 = v168;
        }
        else
        {
          if (v167 < 0x20 || (unint64_t)&v168[-v164] < 0x20)
          {
            v173 = v168;
            v174 = (char *)v164;
          }
          else
          {
            v173 = &v168[v167 & 0xFFFFFFFFFFFFFFE0];
            v174 = (char *)(v164 + (v167 & 0xFFFFFFFFFFFFFFE0));
            v175 = (long long *)(v164 + 16);
            v176 = v168 + 16;
            unint64_t v177 = v167 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v178 = *v175;
              *(v176 - 1) = *(v175 - 1);
              _OWORD *v176 = v178;
              v175 += 2;
              v176 += 2;
              v177 -= 32;
            }
            while (v177);
            if (v167 == (v167 & 0x7FFFFFFFFFFFFFE0)) {
              goto LABEL_297;
            }
          }
          do
          {
            char v179 = *v174++;
            *v173++ = v179;
          }
          while (v174 != v166);
        }
LABEL_297:
        char *v173 = 0;
        char v170 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        v169 = (std::string *)__str.__r_.__value_.__r.__words[0];
        v125 = *(uint8_t **)buf;
        unint64_t v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
LABEL_298:
        if (v170 >= 0) {
          v180 = &__str;
        }
        else {
          v180 = v169;
        }
        v181 = (long long *)(v125 + 64);
        if (v126 <= 2) {
          v181 = &v230;
        }
        if (*(unsigned char *)v181)
        {
          v182 = v125 + 48;
          if (v126 <= 2) {
            v182 = &buf[24];
          }
          uint64_t v183 = *(void *)v182;
          v184 = v125 + 56;
          if (v126 <= 2) {
            v184 = &buf[32];
          }
          unint64_t v185 = *(void *)v184 - v183;
          if (v185 >= 0x40) {
            size_t v186 = 64;
          }
          else {
            size_t v186 = v185;
          }
        }
        else
        {
          size_t v186 = 0;
        }
        strncpy((char *)(a3 + 68), (const char *)v180, v186);
        if (v170 < 0)
        {
          operator delete(v169);
          v125 = *(uint8_t **)buf;
          unint64_t v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
        }
        v187 = (long long *)(v125 + 88);
        if (v126 <= 3) {
          v187 = &v230;
        }
        if (!*(unsigned char *)v187) {
          goto LABEL_164;
        }
        v188 = v125 + 72;
        BOOL v189 = v126 > 3;
        if (v126 <= 3) {
          v188 = &buf[24];
        }
        uint64_t v190 = *(void *)v188;
        v191 = v125 + 80;
        if (!v189) {
          v191 = &buf[32];
        }
        v192 = *(char **)v191;
        std::string::size_type v193 = *(void *)v191 - v190;
        if (v193 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v193 > 0x16)
        {
          uint64_t v195 = (v193 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v193 | 7) != 0x17) {
            uint64_t v195 = v193 | 7;
          }
          uint64_t v196 = v195 + 1;
          v194 = operator new(v195 + 1);
          __str.__r_.__value_.__l.__size_ = v193;
          __str.__r_.__value_.__r.__words[2] = v196 | 0x8000000000000000;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v194;
        }
        else
        {
          *((unsigned char *)&__str.__r_.__value_.__s + 23) = *v191 - v190;
          v194 = &__str;
        }
        if ((char *)v190 == v192)
        {
          unsigned char *v194 = 0;
          goto LABEL_172;
        }
        if (v193 < 0x20 || (unint64_t)&v194[-v190] < 0x20)
        {
          v197 = v194;
          v198 = (char *)v190;
        }
        else
        {
          v197 = &v194[v193 & 0xFFFFFFFFFFFFFFE0];
          v198 = (char *)(v190 + (v193 & 0xFFFFFFFFFFFFFFE0));
          v199 = (long long *)(v190 + 16);
          v200 = v194 + 16;
          unint64_t v201 = v193 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v202 = *v199;
            *(v200 - 1) = *(v199 - 1);
            _OWORD *v200 = v202;
            v199 += 2;
            v200 += 2;
            v201 -= 32;
          }
          while (v201);
          if (v193 == (v193 & 0x7FFFFFFFFFFFFFE0)) {
            goto LABEL_338;
          }
        }
        do
        {
          char v203 = *v198++;
          *v197++ = v203;
        }
        while (v198 != v192);
LABEL_338:
        unsigned char *v197 = 0;
LABEL_172:
        *(_DWORD *)a3 = std::stoi(&__str, 0, 10);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
LABEL_350:
        if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v226.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v228) & 0x80000000) == 0)
          {
LABEL_352:
            v207 = *(void **)buf;
            if (!*(void *)buf) {
              goto LABEL_354;
            }
            goto LABEL_353;
          }
        }
        else if ((SHIBYTE(v228) & 0x80000000) == 0)
        {
          goto LABEL_352;
        }
        operator delete((void *)__s2);
        v207 = *(void **)buf;
        if (!*(void *)buf)
        {
LABEL_354:
          memset(buf, 170, 24);
          if (SHIBYTE(v238) < 0)
          {
            unint64_t v208 = *((void *)&v237 + 1);
            if (*((void *)&v237 + 1))
            {
LABEL_356:
              if (SHIBYTE(__dst[2]) < 0)
              {
                v209 = __dst[1];
                if (__dst[1] >= (const void *)v208)
                {
                  v210 = (const void **)__dst[0];
                  size_t v211 = (size_t)__dst[1] - v208;
                  if ((char *)__dst[1] - v208 > (const void *)0x7FFFFFFFFFFFFFF7) {
                    goto LABEL_403;
                  }
LABEL_373:
                  if (v211 >= 0x17)
                  {
                    uint64_t v217 = (v211 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v211 | 7) != 0x17) {
                      uint64_t v217 = v211 | 7;
                    }
                    uint64_t v218 = v217 + 1;
                    v214 = (uint8_t *)operator new(v217 + 1);
                    *(void *)&buf[8] = v211;
                    *(void *)&buf[16] = v218 | 0x8000000000000000;
                    *(void *)buf = v214;
                  }
                  else
                  {
                    buf[23] = v211;
                    v214 = buf;
                    if (v209 == (const void *)v208) {
                      goto LABEL_375;
                    }
                  }
                  v219 = (const void **)((char *)v210 + v208);
                  goto LABEL_395;
                }
              }
              else
              {
                v209 = (const void *)HIBYTE(__dst[2]);
                if (v208 <= HIBYTE(__dst[2]))
                {
                  v210 = __dst;
                  size_t v211 = HIBYTE(__dst[2]) - v208;
                  if (v211 > 0x7FFFFFFFFFFFFFF7) {
                    goto LABEL_403;
                  }
                  goto LABEL_373;
                }
              }
              std::string::__throw_out_of_range[abi:ne180100]();
            }
          }
          else
          {
            unint64_t v208 = HIBYTE(v238);
            if (HIBYTE(v238)) {
              goto LABEL_356;
            }
          }
          int v212 = SHIBYTE(__dst[2]);
          if (SHIBYTE(__dst[2]) >= 0) {
            size_t v211 = HIBYTE(__dst[2]);
          }
          else {
            size_t v211 = (size_t)__dst[1];
          }
          unint64_t v213 = v211 + 4;
          if (v211 + 4 > 0x7FFFFFFFFFFFFFF7) {
LABEL_403:
          }
            std::string::__throw_length_error[abi:ne180100]();
          if (v213 >= 0x17)
          {
            uint64_t v220 = (v213 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v213 | 7) != 0x17) {
              uint64_t v220 = v213 | 7;
            }
            uint64_t v221 = v220 + 1;
            v222 = operator new(v220 + 1);
            *(void *)&buf[8] = v211 + 4;
            *(void *)&buf[16] = v221 | 0x8000000000000000;
            *(void *)buf = v222;
            _DWORD *v222 = 1029128530;
            v214 = (uint8_t *)(v222 + 1);
          }
          else
          {
            memset(&buf[5], 0, 19);
            buf[23] = v211 + 4;
            v214 = &buf[4];
            strcpy((char *)buf, "RAW=");
            if (!v211)
            {
LABEL_375:
              v214[v211] = 0;
              uint8_t v215 = buf[23];
              if (((char)buf[23] & 0x80000000) == 0) {
                goto LABEL_376;
              }
              goto LABEL_396;
            }
          }
          if (v212 >= 0) {
            v219 = __dst;
          }
          else {
            v219 = (const void **)__dst[0];
          }
LABEL_395:
          memmove(v214, v219, v211);
          v214[v211] = 0;
          uint8_t v215 = buf[23];
          if (((char)buf[23] & 0x80000000) == 0)
          {
LABEL_376:
            strncpy((char *)(a3 + 132), (const char *)buf, v215);
            if ((SHIBYTE(v238) & 0x80000000) == 0) {
              goto LABEL_378;
            }
            goto LABEL_377;
          }
LABEL_396:
          v223 = *(void **)buf;
          if (*(void *)&buf[8] >= 0x100uLL) {
            size_t v224 = 256;
          }
          else {
            size_t v224 = *(void *)&buf[8];
          }
          strncpy((char *)(a3 + 132), *(const char **)buf, v224);
          operator delete(v223);
          if ((SHIBYTE(v238) & 0x80000000) == 0)
          {
LABEL_378:
            if ((HIBYTE(__dst[2]) & 0x80) == 0) {
              goto LABEL_380;
            }
            goto LABEL_379;
          }
LABEL_377:
          operator delete((void *)v237);
          goto LABEL_378;
        }
LABEL_353:
        *(void *)&buf[8] = v207;
        operator delete(v207);
        goto LABEL_354;
      }
    }
    else
    {
      HIBYTE(__dst[2]) = (_BYTE)v10 - (_BYTE)a1;
      v12 = __dst;
      if (v10 == a1) {
        goto LABEL_20;
      }
    }
    memcpy(v12, a1, v10 - a1);
    v12 = (const void **)((char *)v12 + v11);
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21DE04000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "buff is null", buf, 2u);
  }
  return v4;
}

void sub_21DE067F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29)
{
  if (a21 < 0)
  {
    operator delete(__p);
    if ((a27 & 0x80000000) == 0)
    {
LABEL_3:
      v31 = a28;
      if (!a28) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a27 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a22);
  v31 = a28;
  if (!a28)
  {
LABEL_4:
    if ((*(char *)(v29 - 153) & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(v31);
  if ((*(char *)(v29 - 153) & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(char *)(v29 - 129) & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  operator delete(*(void **)(v29 - 176));
  if ((*(char *)(v29 - 129) & 0x80000000) == 0)
  {
LABEL_6:
    if ((*(char *)(v29 - 105) & 0x80000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  operator delete(*(void **)(v29 - 152));
  if ((*(char *)(v29 - 105) & 0x80000000) == 0)
  {
LABEL_7:
    if ((*(char *)(v29 - 81) & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  operator delete(*(void **)(v29 - 128));
  if ((*(char *)(v29 - 81) & 0x80000000) == 0) {
LABEL_8:
  }
    _Unwind_Resume(exception_object);
LABEL_15:
  operator delete(*(void **)(v29 - 104));
  _Unwind_Resume(exception_object);
}

uint64_t ETLEFSearchCrashReason(uint64_t a1, const void **a2, const void **a3, uint64_t a4)
{
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  int v6 = *((char *)a3 + 23);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  unint64_t v8 = v7 + v5;
  if (v7 + v5 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 <= 0x16)
  {
    memset(&__dst, 0, sizeof(__dst));
    p_dst = (std::sub_match<const char *> *)&__dst;
    HIBYTE(__dst.__end_cap_.__value_) = v7 + v5;
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v77[16] = v13;
    *(_OWORD *)&v77[32] = v13;
    *(_OWORD *)&v76[0].__locale_ = v13;
    *(_OWORD *)v77 = v13;
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  uint64_t v14 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v8 | 7) != 0x17) {
    uint64_t v14 = v8 | 7;
  }
  uint64_t v15 = v14 + 1;
  p_dst = (std::sub_match<const char *> *)operator new(v14 + 1);
  __dst.__end_ = (std::vector<std::csub_match>::pointer)(v7 + v5);
  __dst.__end_cap_.__value_ = (std::sub_match<const char *> *)(v15 | 0x8000000000000000);
  __dst.__begin_ = p_dst;
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v77[16] = v16;
  *(_OWORD *)&v77[32] = v16;
  *(_OWORD *)&v76[0].__locale_ = v16;
  *(_OWORD *)v77 = v16;
  if (v5)
  {
LABEL_14:
    if (v4 >= 0) {
      size_t v17 = a2;
    }
    else {
      size_t v17 = *a2;
    }
    memmove(p_dst, v17, v5);
  }
LABEL_18:
  if (v7)
  {
    if (v6 >= 0) {
      int v18 = a3;
    }
    else {
      int v18 = *a3;
    }
    memmove((char *)p_dst + v5, v18, v7);
  }
  *((unsigned char *)&p_dst->first + v5 + v7) = 0;
  MEMORY[0x223C18920](v76);
  v76[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v76, MEMORY[0x263F8C108]);
  *(void *)v77 = std::locale::use_facet(v76, MEMORY[0x263F8C130]);
  memset(&v77[8], 0, 40);
  value_high = (char *)HIBYTE(__dst.__end_cap_.__value_);
  if (SHIBYTE(__dst.__end_cap_.__value_) >= 0) {
    begin = (std::basic_regex<char>::value_type *)&__dst;
  }
  else {
    begin = (std::basic_regex<char>::value_type *)__dst.__begin_;
  }
  if (SHIBYTE(__dst.__end_cap_.__value_) < 0) {
    value_high = (char *)__dst.__end_;
  }
  if (&value_high[(void)begin] != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>((uint64_t)v76, begin, &value_high[(void)begin]))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>(); {
  if (SHIBYTE(__dst.__end_cap_.__value_) < 0)
  }
    operator delete(__dst.__begin_);
  *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v80 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v82 = 0xAAAAAAAAAAAAAA00;
  long long v84 = v21;
  uint64_t v81 = 0;
  long long v83 = 0uLL;
  LOBYTE(v84) = 0;
  BYTE8(v84) = 0;
  uint64_t v85 = 0;
  __dst.__begin_ = 0;
  __dst.__end_ = 0;
  int v22 = *(char *)(a1 + 23);
  if (v22 >= 0) {
    uint64_t v23 = a1;
  }
  else {
    uint64_t v23 = *(void *)a1;
  }
  if (v22 >= 0) {
    uint64_t v24 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v24 = *(void *)(a1 + 8);
  }
  v25 = (const char *)(v23 + v24);
  __dst.__end_cap_.__value_ = 0;
  *(void *)&long long v79 = v23 + v24;
  *((void *)&v79 + 1) = v23 + v24;
  LOBYTE(v80) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__dst, (*(_DWORD *)&v77[12] + 1), (std::vector<std::csub_match>::const_reference)&v79);
  *((void *)&v80 + 1) = v23;
  uint64_t v81 = v23;
  LOBYTE(v82) = 0;
  long long v83 = v79;
  LOBYTE(v84) = v80;
  uint64_t v85 = v23;
  BYTE8(v84) = 1;
  if ((*(_WORD *)&v77[8] & 0x1F0) == 0)
  {
    char v26 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, v23, (const char *)(v23 + v24), (uint64_t *)&__dst, 0, 1);
    goto LABEL_43;
  }
  if (!*(_DWORD *)&v77[12])
  {
    char v26 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, v23, v23 + v24, (uint64_t *)&__dst, 0, 1);
LABEL_43:
    if (v26) {
      goto LABEL_44;
    }
    goto LABEL_50;
  }
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, v23, (const char *)(v23 + v24), (uint64_t *)&__dst, 0, 1))goto LABEL_44; {
LABEL_50:
  }
  if (!v24) {
    goto LABEL_68;
  }
  uint64_t v34 = v24 - 1;
  if (v34)
  {
    uint64_t v35 = v23 + 1;
    while (1)
    {
      std::vector<std::sub_match<char const*>>::assign(&__dst, 0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3), (std::vector<std::csub_match>::const_reference)&v79);
      if ((*(_WORD *)&v77[8] & 0x1F0) == 0) {
        break;
      }
      if (!*(_DWORD *)&v77[12])
      {
        char v36 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, v35, (uint64_t)v25, (uint64_t *)&__dst, 128, 0);
LABEL_59:
        if (v36) {
          goto LABEL_44;
        }
        goto LABEL_60;
      }
      if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, v35, v25, (uint64_t *)&__dst, 128, 0))goto LABEL_44; {
LABEL_60:
      }
      std::vector<std::sub_match<char const*>>::assign(&__dst, 0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3), (std::vector<std::csub_match>::const_reference)&v79);
      ++v35;
      if (!--v34) {
        goto LABEL_61;
      }
    }
    char v36 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, v35, v25, (uint64_t *)&__dst, 128, 0);
    goto LABEL_59;
  }
LABEL_61:
  std::vector<std::sub_match<char const*>>::assign(&__dst, 0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3), (std::vector<std::csub_match>::const_reference)&v79);
  if ((*(_WORD *)&v77[8] & 0x1F0) != 0)
  {
    if (*(_DWORD *)&v77[12])
    {
      if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, (uint64_t)v25, v25, (uint64_t *)&__dst, 128, 0))goto LABEL_44; {
LABEL_68:
      }
      uint64_t v33 = 0;
      std::vector<std::csub_match>::pointer v27 = __dst.__begin_;
      uint64_t v32 = *((void *)&v80 + 1);
      __dst.__end_ = __dst.__begin_;
      std::vector<std::csub_match>::pointer end = __dst.__begin_;
      goto LABEL_69;
    }
    char v37 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, (uint64_t)v25, (uint64_t)v25, (uint64_t *)&__dst, 128, 0);
  }
  else
  {
    char v37 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>((uint64_t)v76, (uint64_t)v25, v25, (uint64_t *)&__dst, 128, 0);
  }
  if ((v37 & 1) == 0) {
    goto LABEL_68;
  }
LABEL_44:
  std::vector<std::csub_match>::pointer v27 = __dst.__begin_;
  std::vector<std::csub_match>::pointer end = __dst.__end_;
  if (__dst.__end_ == __dst.__begin_) {
    std::vector<std::csub_match>::pointer v29 = (std::vector<std::csub_match>::pointer)&v79;
  }
  else {
    std::vector<std::csub_match>::pointer v29 = __dst.__begin_;
  }
  first = v29->first;
  uint64_t v81 = (uint64_t)first;
  p_second = &__dst.__begin_->second;
  if (__dst.__end_ == __dst.__begin_) {
    p_second = (const char **)&v79 + 1;
  }
  uint64_t v32 = *((void *)&v80 + 1);
  LOBYTE(v82) = *((void *)&v80 + 1) != (void)first;
  *(void *)&long long v83 = *p_second;
  LOBYTE(v84) = (void)v83 != *((void *)&v83 + 1);
  uint64_t v33 = 1;
LABEL_69:
  int v38 = *(char *)(a1 + 23);
  if (v38 >= 0) {
    uint64_t v39 = a1;
  }
  else {
    uint64_t v39 = *(void *)a1;
  }
  if (v38 >= 0) {
    uint64_t v40 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v40 = *(void *)(a1 + 8);
  }
  unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v27) >> 3);
  char v43 = *(char **)a4;
  v42 = *(char **)(a4 + 8);
  unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v42[-*(void *)a4] >> 3);
  unint64_t v45 = v41 - v44;
  if (v41 <= v44)
  {
    if (v41 < v44)
    {
      v42 = &v43[24 * v41];
      *(void *)(a4 + 8) = v42;
    }
    uint64_t v57 = v39 + v40;
    if (v42 == v43) {
      goto LABEL_112;
    }
    goto LABEL_94;
  }
  uint64_t v46 = *(void *)(a4 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v46 - (uint64_t)v42) >> 3) < v45)
  {
    unsigned int v73 = v33;
    if (v41 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v75 = v40;
    unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((v46 - (uint64_t)v43) >> 3);
    unint64_t v48 = 0x5555555555555556 * ((v46 - (uint64_t)v43) >> 3);
    if (v48 <= v41) {
      unint64_t v48 = v41;
    }
    if (v47 >= 0x555555555555555) {
      unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v49 = v48;
    }
    if (v49 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v50 = (char *)operator new(24 * v49);
    size_t v51 = &v50[24 * v44];
    int v52 = &v50[24 * v41];
    uint64_t v53 = 24 * v41 - 24 * v44;
    std::string::size_type v54 = v51;
    do
    {
      *(void *)std::string::size_type v54 = 0;
      *((void *)v54 + 1) = 0;
      v54[16] = 0;
      v54 += 24;
      v53 -= 24;
    }
    while (v53);
    uint64_t v55 = &v50[24 * v49];
    uint64_t v40 = v75;
    if (v42 == v43)
    {
      uint64_t v33 = v73;
      *(void *)a4 = v51;
      *(void *)(a4 + 8) = v52;
      *(void *)(a4 + 16) = v55;
      if (!v42) {
        goto LABEL_111;
      }
    }
    else
    {
      uint64_t v33 = v73;
      do
      {
        long long v56 = *(_OWORD *)(v42 - 24);
        *((void *)v51 - 1) = *((void *)v42 - 1);
        *(_OWORD *)(v51 - 24) = v56;
        v51 -= 24;
        v42 -= 24;
      }
      while (v42 != v43);
      v42 = v43;
      *(void *)a4 = v51;
      *(void *)(a4 + 8) = v52;
      *(void *)(a4 + 16) = v55;
      if (!v43) {
        goto LABEL_111;
      }
    }
    operator delete(v42);
    uint64_t v40 = v75;
    int v52 = *(char **)(a4 + 8);
    goto LABEL_111;
  }
  int v52 = &v42[24 * v45];
  uint64_t v65 = 24 * v41 - 8 * ((uint64_t)&v42[-*(void *)a4] >> 3);
  do
  {
    *(void *)v42 = 0;
    *((void *)v42 + 1) = 0;
    v42[16] = 0;
    v42 += 24;
    v65 -= 24;
  }
  while (v65);
  *(void *)(a4 + 8) = v52;
LABEL_111:
  char v43 = *(char **)a4;
  uint64_t v66 = v52;
  uint64_t v57 = v39 + v40;
  if (v66 == *(char **)a4)
  {
LABEL_112:
    v60 = __dst.__begin_;
    goto LABEL_113;
  }
LABEL_94:
  unint64_t v58 = 0;
  unint64_t v59 = 0;
  v60 = __dst.__begin_;
  std::vector<std::csub_match>::pointer v61 = __dst.__end_;
  do
  {
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v61 - (char *)v60) >> 3) <= v59) {
      unint64_t v62 = (std::sub_match<const char *> *)&v79;
    }
    else {
      unint64_t v62 = &v60[v58];
    }
    *(void *)&v43[v58 * 24] = &v62->first[v39 - v32];
    if (0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3) <= v59) {
      size_t v63 = (const char **)&v79 + 1;
    }
    else {
      size_t v63 = &__dst.__begin_[v58].second;
    }
    *(void *)(*(void *)a4 + v58 * 24 + 8) = &(*v63)[v39 - v32];
    v60 = __dst.__begin_;
    std::vector<std::csub_match>::pointer v61 = __dst.__end_;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3) <= v59) {
      p_matched = (BOOL *)&v80;
    }
    else {
      p_matched = &__dst.__begin_[v58].matched;
    }
    char v43 = *(char **)a4;
    *(unsigned char *)(*(void *)a4 + v58 * 24 + 16) = *p_matched;
    ++v59;
    ++v58;
  }
  while (v59 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - (void)v43) >> 3));
LABEL_113:
  *(void *)(a4 + 24) = v57;
  *(void *)(a4 + 32) = v57;
  uint64_t v67 = v39 + *((void *)&v80 + 1) - v32;
  uint64_t v68 = v39 + v81 - v32;
  *(void *)(a4 + 48) = v67;
  *(void *)(a4 + 56) = v68;
  *(unsigned char *)(a4 + 64) = v82;
  uint64_t v69 = v83 - v32;
  uint64_t v70 = *((void *)&v83 + 1) - v32;
  *(unsigned char *)(a4 + 40) = 0;
  *(void *)(a4 + 72) = v39 + v69;
  *(void *)(a4 + 80) = v39 + v70;
  *(unsigned char *)(a4 + 88) = v84;
  *(void *)(a4 + 104) = v67;
  *(unsigned char *)(a4 + 96) = BYTE8(v84);
  if (v60)
  {
    __dst.__end_ = v60;
    operator delete(v60);
  }
  v71 = *(std::__shared_weak_count **)&v77[32];
  if (*(void *)&v77[32]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v77[32] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
    std::__shared_weak_count::__release_weak(v71);
  }
  std::locale::~locale(v76);
  return v33;
}

void sub_21DE07134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v24);
  std::locale::~locale(&a11);
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_21DE07168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a11);
  _Unwind_Resume(a1);
}

void *std::sub_match<std::__wrap_iter<char const*>>::str[abi:ne180100](void *result, uint64_t *a2)
{
  v2 = result;
  if (!*((unsigned char *)a2 + 16))
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
    return result;
  }
  uint64_t v4 = *a2;
  BOOL v3 = (char *)a2[1];
  unint64_t v5 = (unint64_t)&v3[-*a2];
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v5 <= 0x16)
  {
    *((unsigned char *)result + 23) = v5;
    if ((char *)v4 != v3) {
      goto LABEL_5;
    }
LABEL_15:
    *(unsigned char *)v2 = 0;
    return result;
  }
  uint64_t v12 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v12 = v5 | 7;
  }
  uint64_t v13 = v12 + 1;
  result = operator new(v12 + 1);
  v2[1] = v5;
  v2[2] = v13 | 0x8000000000000000;
  void *v2 = result;
  v2 = result;
  if ((char *)v4 == v3) {
    goto LABEL_15;
  }
LABEL_5:
  if (v5 < 0x20 || (unint64_t)v2 - v4 < 0x20)
  {
    int v6 = v2;
    size_t v7 = (char *)v4;
  }
  else
  {
    int v6 = (char *)v2 + (v5 & 0xFFFFFFFFFFFFFFE0);
    size_t v7 = (char *)(v4 + (v5 & 0xFFFFFFFFFFFFFFE0));
    unint64_t v8 = (long long *)(v4 + 16);
    uint64_t v9 = v2 + 2;
    unint64_t v10 = v5 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v11 = *v8;
      *(v9 - 1) = *(v8 - 1);
      *uint64_t v9 = v11;
      v8 += 2;
      v9 += 2;
      v10 -= 32;
    }
    while (v10);
    if (v5 == (v5 & 0x7FFFFFFFFFFFFFE0)) {
      goto LABEL_18;
    }
  }
  do
  {
    char v14 = *v7++;
    *v6++ = v14;
  }
  while (v7 != v3);
LABEL_18:
  *int v6 = 0;
  return result;
}

uint64_t ETLEFSearchBasebandCrashReasonM20(const void **a1, char **a2)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  unint64_t v71 = 0;
  memset(__p, 0, 24);
  int folder = ctu::fs::read_folder();
  int v5 = folder;
  int v6 = 0;
  if (folder)
  {
    uint64_t v7 = -1431655765 * ((unint64_t)((char *)__p[1] - (char *)__p[0]) >> 3);
    if (v7)
    {
      int v66 = folder;
      uint64_t v8 = 0;
      uint64_t v9 = 24 * v7;
      while (1)
      {
        long long v11 = (char *)__p[0];
        uint64_t v12 = (char **)((char *)__p[0] + v8);
        __s2[23] = 6;
        strcpy(__s2, "OCIMEM");
        uint64_t v13 = *((unsigned __int8 *)__p[0] + v8 + 23);
        if (*((char *)__p[0] + v8 + 23) < 0)
        {
          uint64_t v15 = *v12;
          if ((unint64_t)v12[1] >= 6) {
            size_t v14 = 6;
          }
          else {
            size_t v14 = (size_t)v12[1];
          }
        }
        else
        {
          if (v13 >= 6) {
            size_t v14 = 6;
          }
          else {
            size_t v14 = *((unsigned __int8 *)__p[0] + v8 + 23);
          }
          uint64_t v15 = (char *)__p[0] + v8;
        }
        int v16 = memcmp(v15, __s2, v14);
        if (v14 != 6 || v16 != 0) {
          goto LABEL_6;
        }
        if ((v13 & 0x80) != 0)
        {
          unint64_t v19 = *(void *)&v11[v8 + 8];
          BOOL v20 = v19 > 4;
          unint64_t v21 = v19 - 4;
          if (!v20)
          {
            char v26 = (std::string *)v70;
            if ((unint64_t)v70 < v71) {
              goto LABEL_38;
            }
            goto LABEL_4;
          }
          __s2[23] = 4;
          strcpy(__s2, ".BIN");
          unint64_t v22 = *(void *)&v11[v8 + 8];
          BOOL v23 = v22 >= v21;
          unint64_t v24 = v22 - v21;
          if (!v23) {
            std::string::__throw_out_of_range[abi:ne180100]();
          }
          if (v24 >= 4) {
            size_t v25 = 4;
          }
          else {
            size_t v25 = v24;
          }
          int v18 = memcmp(&(*v12)[v21], __s2, v25);
          if (v25 != 4) {
            goto LABEL_6;
          }
        }
        else
        {
          if (v13 <= 4)
          {
            char v26 = (std::string *)v70;
            if ((unint64_t)v70 < v71) {
              goto LABEL_36;
            }
            goto LABEL_4;
          }
          __s2[23] = 4;
          strcpy(__s2, ".BIN");
          int v18 = memcmp((char *)v12 + v13 - 4, __s2, 4uLL);
        }
        if (v18) {
          goto LABEL_6;
        }
        char v26 = (std::string *)v70;
        if ((unint64_t)v70 < v71)
        {
          if ((v13 & 0x80) != 0)
          {
LABEL_38:
            std::string::__init_copy_ctor_external(v26, *(const std::string::value_type **)&v11[v8], *(void *)&v11[v8 + 8]);
          }
          else
          {
LABEL_36:
            long long v4 = *(_OWORD *)v12;
            v26->__r_.__value_.__r.__words[2] = (std::string::size_type)v12[2];
            *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v4;
          }
          unint64_t v10 = v26 + 1;
          goto LABEL_5;
        }
LABEL_4:
        unint64_t v10 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v69, (uint64_t)v12);
LABEL_5:
        uint64_t v70 = (char *)v10;
LABEL_6:
        v8 += 24;
        if (v9 == v8)
        {
          int v6 = (void **)__p[0];
          int v5 = v66;
          break;
        }
      }
    }
  }
  if (v6)
  {
    std::vector<std::csub_match>::pointer v27 = (void **)__p[1];
    v28 = v6;
    if (__p[1] != v6)
    {
      do
      {
        if (*((char *)v27 - 1) < 0) {
          operator delete(*(v27 - 3));
        }
        v27 -= 3;
      }
      while (v27 != v6);
      v28 = (void **)__p[0];
    }
    __p[1] = v6;
    operator delete(v28);
  }
  unint64_t v30 = v69;
  std::vector<std::csub_match>::pointer v29 = v70;
  if (v70 == v69) {
    int v31 = 0;
  }
  else {
    int v31 = v5;
  }
  if (v31 != 1)
  {
    char v32 = 0;
    if (v69) {
      goto LABEL_116;
    }
    return v32 & 1;
  }
  char v32 = 0;
  *(void *)&long long v4 = 136315138;
  long long v63 = v4;
  do
  {
    memset(__p, 170, 24);
    int v33 = *((char *)a1 + 23);
    if (v33 >= 0) {
      size_t v34 = *((unsigned __int8 *)a1 + 23);
    }
    else {
      size_t v34 = (size_t)a1[1];
    }
    unint64_t v35 = v34 + 1;
    memset(__s2, 170, 24);
    if (v34 + 1 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v35 >= 0x17)
    {
      uint64_t v37 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v35 | 7) != 0x17) {
        uint64_t v37 = v35 | 7;
      }
      uint64_t v38 = v37 + 1;
      char v36 = operator new(v37 + 1);
      *(void *)&__s2[8] = v34 + 1;
      *(void *)&__s2[16] = v38 | 0x8000000000000000;
      *(void *)long long __s2 = v36;
    }
    else
    {
      memset(__s2, 0, 24);
      char v36 = __s2;
      __s2[23] = v34 + 1;
      if (!v34) {
        goto LABEL_69;
      }
    }
    if (v33 >= 0) {
      uint64_t v39 = a1;
    }
    else {
      uint64_t v39 = *a1;
    }
    memmove(v36, v39, v34);
LABEL_69:
    *(_WORD *)&v36[v34] = 47;
    int v40 = v30[23];
    if (v40 >= 0) {
      unint64_t v41 = v30;
    }
    else {
      unint64_t v41 = *(const std::string::value_type **)v30;
    }
    if (v40 >= 0) {
      std::string::size_type v42 = v30[23];
    }
    else {
      std::string::size_type v42 = *((void *)v30 + 1);
    }
    char v43 = std::string::append((std::string *)__s2, v41, v42);
    long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
    __p[2] = (void *)v43->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v44;
    v43->__r_.__value_.__l.__size_ = 0;
    v43->__r_.__value_.__r.__words[2] = 0;
    v43->__r_.__value_.__r.__words[0] = 0;
    if ((__s2[23] & 0x80000000) != 0) {
      operator delete(*(void **)__s2);
    }
    if (SHIBYTE(__p[2]) >= 0) {
      unint64_t v45 = __p;
    }
    else {
      unint64_t v45 = (void **)__p[0];
    }
    int v46 = open((const char *)v45, 0, v63);
    if (v46 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        std::vector<std::csub_match>::pointer v61 = __p;
        if (SHIBYTE(__p[2]) < 0) {
          std::vector<std::csub_match>::pointer v61 = (void **)__p[0];
        }
        *(_DWORD *)long long __s2 = v63;
        *(void *)&__s2[4] = v61;
        _os_log_error_impl(&dword_21DE04000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to open %s", __s2, 0xCu);
      }
      char v53 = 0;
    }
    else
    {
      unint64_t v47 = operator new[](0x100uLL);
      v47[14] = 0u;
      v47[15] = 0u;
      v47[12] = 0u;
      v47[13] = 0u;
      v47[10] = 0u;
      v47[11] = 0u;
      v47[8] = 0u;
      v47[9] = 0u;
      v47[6] = 0u;
      v47[7] = 0u;
      v47[4] = 0u;
      v47[5] = 0u;
      v47[2] = 0u;
      v47[3] = 0u;
      _OWORD *v47 = 0u;
      v47[1] = 0u;
      if (lseek(v46, 64488, 1) < 1 || read(v46, v47, 0x100uLL) < 1)
      {
        char v53 = 0;
      }
      else
      {
        *(_DWORD *)&__s2[384] = -1431655766;
        *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&__s2[352] = v48;
        *(_OWORD *)&__s2[368] = v48;
        *(_OWORD *)&__s2[320] = v48;
        *(_OWORD *)&__s2[336] = v48;
        *(_OWORD *)&__s2[288] = v48;
        *(_OWORD *)&__s2[304] = v48;
        *(_OWORD *)&__s2[256] = v48;
        *(_OWORD *)&__s2[272] = v48;
        *(_OWORD *)&__s2[224] = v48;
        *(_OWORD *)&__s2[240] = v48;
        *(_OWORD *)&__s2[192] = v48;
        *(_OWORD *)&__s2[208] = v48;
        *(_OWORD *)&__s2[160] = v48;
        *(_OWORD *)&__s2[176] = v48;
        *(_OWORD *)&__s2[128] = v48;
        *(_OWORD *)&__s2[144] = v48;
        *(_OWORD *)&__s2[96] = v48;
        *(_OWORD *)&__s2[112] = v48;
        *(_OWORD *)&__s2[80] = v48;
        *(_OWORD *)&__s2[48] = v48;
        *(_OWORD *)&__s2[64] = v48;
        *(_OWORD *)&__s2[16] = v48;
        *(_OWORD *)&__s2[32] = v48;
        *(_OWORD *)long long __s2 = v48;
        if (ETLEFCopyCrashLocationDetailsM20(v47, 0x100u, (uint64_t)__s2))
        {
          v50 = a2[1];
          unint64_t v49 = (unint64_t)a2[2];
          if ((unint64_t)v50 >= v49)
          {
            std::string::size_type v54 = *a2;
            unint64_t v55 = 0xA3A0FD5C5F02A3A1 * ((v50 - *a2) >> 2);
            unint64_t v56 = v55 + 1;
            if (v55 + 1 > 0xA8E83F5717C0A8) {
              std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v57 = 0xA3A0FD5C5F02A3A1 * ((uint64_t)(v49 - (void)v54) >> 2);
            if (2 * v57 > v56) {
              unint64_t v56 = 2 * v57;
            }
            if (v57 >= 0x54741FAB8BE054) {
              unint64_t v56 = 0xA8E83F5717C0A8;
            }
            unint64_t v67 = v56;
            if (v56)
            {
              if (v56 > 0xA8E83F5717C0A8) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              unint64_t v58 = (char *)operator new(388 * v56);
            }
            else
            {
              unint64_t v58 = 0;
            }
            uint64_t v65 = v58;
            unint64_t v59 = &v58[388 * v55];
            memcpy(v59, __s2, 0x184uLL);
            if (v50 == v54)
            {
              v60 = v59;
              size_t v51 = a2;
            }
            else
            {
              v64 = v59;
              do
              {
                v50 -= 388;
                v59 -= 388;
                memcpy(v59, v50, 0x184uLL);
              }
              while (v50 != v54);
              size_t v51 = a2;
              v50 = *a2;
              v60 = v64;
            }
            int v52 = v60 + 388;
            *size_t v51 = v59;
            v51[1] = v60 + 388;
            v51[2] = &v65[388 * v67];
            if (v50)
            {
              operator delete(v50);
              size_t v51 = a2;
            }
          }
          else
          {
            memcpy(a2[1], __s2, 0x184uLL);
            size_t v51 = a2;
            int v52 = v50 + 388;
          }
          v51[1] = v52;
        }
        char v53 = 1;
      }
      operator delete[](v47);
      close(v46);
    }
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    v32 |= v53;
    v30 += 24;
  }
  while (v30 != v70);
  std::vector<std::csub_match>::pointer v29 = v30;
  unint64_t v30 = v69;
  if (v69)
  {
LABEL_116:
    if (v29 != v30)
    {
      do
      {
        if (*(v29 - 1) < 0) {
          operator delete(*((void **)v29 - 3));
        }
        v29 -= 24;
      }
      while (v29 != v30);
      std::vector<std::csub_match>::pointer v29 = v69;
    }
    uint64_t v70 = v30;
    operator delete(v29);
  }
  return v32 & 1;
}

void sub_21DE079EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void *);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va1);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_21DE07A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
}

void sub_21DE07A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_21DE07A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_21DE07A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    std::vector<std::string>::~vector[abi:ne180100](&a16);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x21DE07A9CLL);
}

void sub_21DE07A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  std::vector<std::string>::~vector[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  v2 = (void **)*a1;
  if (*a1)
  {
    BOOL v3 = (void **)a1[1];
    long long v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      long long v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2644851D0, MEMORY[0x263F8C060]);
}

void sub_21DE07B80(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_2644851D8, MEMORY[0x263F8C068]);
}

void sub_21DE07C4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void *std::string::__assign_no_alias<true>(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    int v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *std::vector<std::csub_match> __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    int v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      int v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v10 = v7 - 1;
  uint64_t v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  v1 = this;
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    this = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  std::locale::~locale(this);
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  unint64_t v6 = operator new(8uLL);
  *unint64_t v6 = &unk_26CEBD4C0;
  uint64_t v7 = operator new(0x10uLL);
  v7[1] = v6;
  size_t v8 = operator new(0x20uLL);
  void *v8 = &unk_26CEBD518;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  size_t v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  if (!v9 || atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 56) = v10;
    unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v11 <= 0x3F) {
      goto LABEL_4;
    }
LABEL_9:
    switch(v11)
    {
      case 0x40u:
LABEL_20:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        size_t v17 = (std::basic_regex<char>::value_type *)memchr(a2, 10, a3 - a2);
        if (v17) {
          int v18 = v17;
        }
        else {
          int v18 = a3;
        }
        if (v18 == a2)
        {
          unint64_t v19 = operator new(0x10uLL);
          uint64_t v20 = *(void *)(v10 + 8);
          v19[1] = v20;
          *(void *)(v10 + 8) = v19;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          if (v18 != a3) {
            ++v18;
          }
          if (v18 == a3) {
            return a3;
          }
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, v18);
          if (v18 != a3) {
            ++v18;
          }
          if (v18 == a3) {
            return a3;
          }
        }
        uint64_t v32 = *(void *)(a1 + 56);
        do
        {
          unint64_t v41 = (std::basic_regex<char>::value_type *)memchr(v18, 10, a3 - v18);
          if (v41) {
            std::string::size_type v42 = v41;
          }
          else {
            std::string::size_type v42 = a3;
          }
          if (v42 == v18)
          {
            int v33 = operator new(0x10uLL);
            uint64_t v34 = *(void *)(v32 + 8);
            v33[1] = v34;
            *(void *)(v32 + 8) = v33;
            *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)v18, v42);
          }
          unint64_t v35 = operator new(0x18uLL);
          uint64_t v36 = *(void *)(v32 + 8);
          v35[1] = *(void *)(v10 + 8);
          v35[2] = v36;
          void *v35 = &unk_26CEBDAD8;
          *(void *)(v10 + 8) = v35;
          *(void *)(v32 + 8) = 0;
          uint64_t v37 = operator new(0x10uLL);
          uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
          v37[1] = v38;
          *(void *)(v32 + 8) = v37;
          *(void *)(*(void *)(a1 + 56) + 8) = 0;
          uint64_t v39 = operator new(0x10uLL);
          uint64_t v40 = *(void *)(v32 + 8);
          void *v39 = &unk_26CEBDB20;
          v39[1] = v40;
          *(void *)(*(void *)(a1 + 56) + 8) = v39;
          uint64_t v32 = *(void *)(v32 + 8);
          *(void *)(a1 + 56) = v32;
          if (v42 == a3) {
            int v18 = v42;
          }
          else {
            int v18 = v42 + 1;
          }
        }
        while (v18 != a3);
        break;
      case 0x100u:
        uint64_t v12 = (std::basic_regex<char>::value_type *)memchr(a2, 10, a3 - a2);
        if (v12) {
          unint64_t v13 = v12;
        }
        else {
          unint64_t v13 = a3;
        }
        if (v13 == a2)
        {
          uint64_t v14 = operator new(0x10uLL);
          uint64_t v15 = *(void *)(v10 + 8);
          v14[1] = v15;
          *(void *)(v10 + 8) = v14;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          if (v13 != a3) {
            ++v13;
          }
          if (v13 == a3) {
            return a3;
          }
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, v13);
          if (v13 != a3) {
            ++v13;
          }
          if (v13 == a3) {
            return a3;
          }
        }
        uint64_t v21 = *(void *)(a1 + 56);
        do
        {
          unint64_t v30 = (std::basic_regex<char>::value_type *)memchr(v13, 10, a3 - v13);
          if (v30) {
            int v31 = v30;
          }
          else {
            int v31 = a3;
          }
          if (v31 == v13)
          {
            unint64_t v22 = operator new(0x10uLL);
            uint64_t v23 = *(void *)(v21 + 8);
            v22[1] = v23;
            *(void *)(v21 + 8) = v22;
            *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, v31);
          }
          unint64_t v24 = operator new(0x18uLL);
          uint64_t v25 = *(void *)(v21 + 8);
          v24[1] = *(void *)(v10 + 8);
          v24[2] = v25;
          *unint64_t v24 = &unk_26CEBDAD8;
          *(void *)(v10 + 8) = v24;
          *(void *)(v21 + 8) = 0;
          char v26 = operator new(0x10uLL);
          uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
          v26[1] = v27;
          *(void *)(v21 + 8) = v26;
          *(void *)(*(void *)(a1 + 56) + 8) = 0;
          v28 = operator new(0x10uLL);
          uint64_t v29 = *(void *)(v21 + 8);
          void *v28 = &unk_26CEBDB20;
          v28[1] = v29;
          *(void *)(*(void *)(a1 + 56) + 8) = v28;
          uint64_t v21 = *(void *)(v21 + 8);
          *(void *)(a1 + 56) = v21;
          if (v31 == a3) {
            unint64_t v13 = v31;
          }
          else {
            unint64_t v13 = v31 + 1;
          }
        }
        while (v13 != a3);
        break;
      default:
        goto LABEL_66;
    }
    return a3;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 56) = v10;
  unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v11 > 0x3F) {
    goto LABEL_9;
  }
LABEL_4:
  if (v11)
  {
    if (v11 != 16)
    {
      if (v11 != 32) {
LABEL_66:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      goto LABEL_20;
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, a3);
  }
  else
  {
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
  }
}

void sub_21DE08524(_Unwind_Exception *a1)
{
  std::__empty_state<char>::~__empty_state(v2);
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE085B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::vector<std::csub_match>::pointer end = a1->__end_;
  uint64_t v7 = a2;
  while (1)
  {
    size_t v8 = v7;
    uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v7, a3);
    if (v8 == v7) {
      break;
    }
LABEL_2:
    if (v7 == v8) {
      goto LABEL_6;
    }
  }
  size_t v9 = a1->__end_;
  unsigned int marked_count = a1->__marked_count_;
  unsigned int v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
  if (v8 != (std::basic_regex<char>::value_type *)v11)
  {
    uint64_t v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 == a2)
  {
    uint64_t v12 = (std::__node<char> *)operator new(0x10uLL);
    unint64_t v13 = a1->__end_;
    first = v13->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)first;
    v13->__first_ = v12;
    uint64_t v15 = (std::__owns_one_state<char> *)a1->__end_->__first_;
    goto LABEL_8;
  }
LABEL_9:
  if (v8 == a3) {
    return a3;
  }
  if (*v8 == 124)
  {
    int v16 = a1->__end_;
    size_t v17 = v8 + 1;
    int v18 = v8 + 1;
    while (1)
    {
      size_t v8 = v18;
      int v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v18, a3);
      if (v8 == v18)
      {
        unint64_t v19 = a1->__end_;
        unsigned int v20 = a1->__marked_count_;
        uint64_t v21 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
        if (v8 == (std::basic_regex<char>::value_type *)v21)
        {
LABEL_16:
          if (v8 == v17)
          {
            unint64_t v22 = (std::__node<char> *)operator new(0x10uLL);
            uint64_t v23 = a1->__end_;
            unint64_t v24 = v23->__first_;
            v22[1].__vftable = (std::__node<char>_vtbl *)v24;
            v23->__first_ = v22;
            a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
          }
          uint64_t v25 = (std::__node<char> *)operator new(0x18uLL);
          char v26 = v16->__first_;
          v25[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
          v25[2].__vftable = (std::__node<char>_vtbl *)v26;
          v25->__vftable = (std::__node<char>_vtbl *)&unk_26CEBDAD8;
          end->__first_ = v25;
          v16->__first_ = 0;
          uint64_t v27 = (std::__node<char> *)operator new(0x10uLL);
          v28 = a1->__end_->__first_;
          v27[1].__vftable = (std::__node<char>_vtbl *)v28;
          v16->__first_ = v27;
          a1->__end_->__first_ = 0;
          uint64_t v29 = (std::__node<char> *)operator new(0x10uLL);
          unint64_t v30 = v16->__first_;
          v29->__vftable = (std::__node<char>_vtbl *)&unk_26CEBDB20;
          v29[1].__vftable = (std::__node<char>_vtbl *)v30;
          a1->__end_->__first_ = v29;
          uint64_t v15 = (std::__owns_one_state<char> *)v16->__first_;
LABEL_8:
          a1->__end_ = v15;
          goto LABEL_9;
        }
        int v18 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v21, (std::basic_regex<char> *)a3, v19, v20 + 1, a1->__marked_count_ + 1);
      }
      if (v18 == v8) {
        goto LABEL_16;
      }
    }
  }
  return v8;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char>::value_type *a3)
{
  BOOL v3 = a2;
  if (a2 == (std::basic_regex<char> *)a3) {
    return (std::basic_regex<char>::value_type *)a2;
  }
  if (LOBYTE(a2->__traits_.__loc_.__locale_) == 94)
  {
    unint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *unint64_t v6 = &unk_26CEBD610;
    v6[1] = v9;
    *((unsigned char *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      uint64_t v10 = (std::basic_regex<char>::value_type *)v3;
      unsigned int v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 28);
      unint64_t v13 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v10, a3);
      if (v10 != (std::basic_regex<char>::value_type *)v13)
      {
        BOOL v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v10 != (std::basic_regex<char>::value_type *)v3) {
          continue;
        }
      }
      if (v10 + 1 != a3 || *v10 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      uint64_t v14 = operator new(0x18uLL);
      BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(v16 + 8);
      *uint64_t v14 = &unk_26CEBD658;
      v14[1] = v17;
      *((unsigned char *)v14 + 16) = v15;
      *(void *)(v16 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::vector<std::csub_match>::pointer end = a1->__end_;
  BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == (std::basic_regex<char> *)a2) {
    goto LABEL_12;
  }
  do
  {
    uint64_t v8 = v7;
    BOOL v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v7, a3);
  }
  while (v8 != v7);
  if (v8 == (std::basic_regex<char> *)a2) {
LABEL_12:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == (std::basic_regex<char> *)a3) {
    return a3;
  }
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    uint64_t v9 = a1->__end_;
    uint64_t v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)&v8->__traits_.__loc_.__locale_ + 1, a3);
    if ((std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1) == v11) {
      goto LABEL_12;
    }
    do
    {
      uint64_t v8 = v11;
      unsigned int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v11, a3);
    }
    while (v8 != v11);
    if (v8 == v10) {
      goto LABEL_12;
    }
    int v12 = (std::__node<char> *)operator new(0x18uLL);
    first = v9->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
    v12[2].__vftable = (std::__node<char>_vtbl *)first;
    v12->__vftable = (std::__node<char>_vtbl *)&unk_26CEBDAD8;
    end->__first_ = v12;
    v9->__first_ = 0;
    uint64_t v14 = (std::__node<char> *)operator new(0x10uLL);
    BOOL v15 = a1->__end_->__first_;
    v14[1].__vftable = (std::__node<char>_vtbl *)v15;
    v9->__first_ = v14;
    a1->__end_->__first_ = 0;
    uint64_t v16 = (std::__node<char> *)operator new(0x10uLL);
    uint64_t v17 = v9->__first_;
    v16->__vftable = (std::__node<char>_vtbl *)&unk_26CEBDB20;
    v16[1].__vftable = (std::__node<char>_vtbl *)v17;
    a1->__end_->__first_ = v16;
    a1->__end_ = (std::__owns_one_state<char> *)v9->__first_;
    if (v8 == (std::basic_regex<char> *)a3) {
      return a3;
    }
  }
  return (std::basic_regex<char>::value_type *)v8;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE08B94(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DE151A9) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021DE151A9 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DE151A9)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DE151A9 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
}

{
  std::__node<char> *first;
  uint64_t vars8;

  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }

  operator delete(this);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        int v16 = a2[1];
        if (v16 == 66)
        {
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = &unk_26CEBD6A0;
          *((void *)v17 + 1) = v19;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 1;
        }
        else
        {
          if (v16 != 98) {
            return v3;
          }
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = &unk_26CEBD6A0;
          *((void *)v17 + 1) = v18;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 0;
        }
        *(void *)(*(void *)(a1 + 56) + 8) = v17;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return v3 + 2;
      }
      return v3;
    }
    if (v6 != 94) {
      return v3;
    }
    unsigned int v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    uint64_t v14 = &unk_26CEBD610;
LABEL_17:
    *unsigned int v11 = v14;
    *((unsigned char *)v11 + 16) = v12;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 == 36)
  {
    unsigned int v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    uint64_t v14 = &unk_26CEBD658;
    goto LABEL_17;
  }
  if (v6 != 40 || a2 + 1 == a3 || a2[1] != 63 || a2 + 2 == a3) {
    return v3;
  }
  int v7 = a2[2];
  if (v7 == 33)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v22.__loop_count_ = v20;
    *(_OWORD *)&v22.__start_.__cntrl_ = v20;
    *(_OWORD *)&v22.__traits_.__loc_.__locale_ = v20;
    *(_OWORD *)&v22.__traits_.__col_ = v20;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v22);
    v22.__flags_ = *(_DWORD *)(a1 + 24);
    uint64_t v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v22, v3 + 3, a3);
    unsigned int marked_count = v22.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v22, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v9 == a3 || *v9 != 41) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    goto LABEL_27;
  }
  if (v7 != 61) {
    return v3;
  }
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v22.__loop_count_ = v8;
  *(_OWORD *)&v22.__start_.__cntrl_ = v8;
  *(_OWORD *)&v22.__traits_.__loc_.__locale_ = v8;
  *(_OWORD *)&v22.__traits_.__col_ = v8;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v22);
  v22.__flags_ = *(_DWORD *)(a1 + 24);
  uint64_t v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v22, v3 + 3, a3);
  unsigned int v10 = v22.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v22, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v10;
  if (v9 == a3 || *v9 != 41) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
LABEL_27:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v22.__traits_.__loc_);
  return v9 + 1;
}

void sub_21DE091B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21DE091C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21DE091DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_21DE091F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  int v5 = *a2;
  int v7 = a2;
  switch(*a2)
  {
    case '$':
    case ')':
    case ']':
    case '^':
    case '|':
    case '}':
      return v7;
    case '(':
      if (a2 + 1 == a3) {
        goto LABEL_57;
      }
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        ++this->__open_count_;
        BOOL v12 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, a2 + 3, a3);
        if (v12 != a3 && *v12 == 41)
        {
          --this->__open_count_;
          return v12 + 1;
        }
LABEL_57:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if ((this->__flags_ & 2) != 0)
      {
        unsigned int marked_count = this->__marked_count_;
      }
      else
      {
        int v16 = (std::__node<char> *)operator new(0x18uLL);
        unsigned int marked_count = this->__marked_count_ + 1;
        this->__marked_count_ = marked_count;
        std::vector<std::csub_match>::pointer end = this->__end_;
        first = end->__first_;
        v16->__vftable = (std::__node<char>_vtbl *)&unk_26CEBD970;
        v16[1].__vftable = (std::__node<char>_vtbl *)first;
        LODWORD(v16[2].__vftable) = marked_count;
        end->__first_ = v16;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      long long v20 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, v3 + 1, a3);
      if (v20 == a3) {
        goto LABEL_57;
      }
      uint64_t v3 = v20;
      if (*v20 != 41) {
        goto LABEL_57;
      }
      if ((this->__flags_ & 2) == 0)
      {
        uint64_t v21 = (std::__node<char> *)operator new(0x18uLL);
        std::basic_regex<char> v22 = this->__end_;
        uint64_t v23 = v22->__first_;
        v21->__vftable = (std::__node<char>_vtbl *)&unk_26CEBD9B8;
        v21[1].__vftable = (std::__node<char>_vtbl *)v23;
        LODWORD(v21[2].__vftable) = marked_count;
        v22->__first_ = v21;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      return v3 + 1;
    case '*':
    case '+':
    case '?':
    case '{':
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    case '.':
      uint64_t v9 = (std::__node<char> *)operator new(0x10uLL);
      unsigned int v10 = this->__end_;
      unsigned int v11 = v10->__first_;
      v9->__vftable = (std::__node<char>_vtbl *)&unk_26CEBD730;
      v9[1].__vftable = (std::__node<char>_vtbl *)v11;
      v10->__first_ = v9;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return v3 + 1;
    case '[':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
    case '\\':
      int v7 = a2;
      if (v5 != 92) {
        return v7;
      }
      uint64_t v13 = (unsigned __int8 *)(a2 + 1);
      if (a2 + 1 == a3) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
      }
      int v14 = *v13;
      unsigned int v15 = v14 - 48;
      if (v14 != 48)
      {
        if ((v14 - 49) <= 8)
        {
          int v7 = v3 + 2;
          if (v3 + 2 == a3)
          {
            int v7 = a3;
          }
          else
          {
            while (1)
            {
              int v24 = *v7;
              if ((v24 - 48) > 9) {
                break;
              }
              if (v15 >= 0x19999999) {
                goto LABEL_58;
              }
              ++v7;
              unsigned int v15 = v24 + 10 * v15 - 48;
              if (v7 == a3)
              {
                int v7 = a3;
                break;
              }
            }
            if (!v15) {
LABEL_58:
            }
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
          }
          if (v15 > this->__marked_count_) {
            goto LABEL_58;
          }
          std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v15);
          if (v7 != (std::basic_regex<char>::value_type *)v13) {
            return v7;
          }
          LOBYTE(v14) = *v13;
        }
        switch((char)v14)
        {
          case 'D':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_49;
          case 'S':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_53;
          case 'W':
            uint64_t v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_51;
          case 'd':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_49:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            int v28 = LODWORD(v25[10].__vftable) | 0x400;
            goto LABEL_54;
          case 's':
            uint64_t v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_53:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            int v28 = LODWORD(v25[10].__vftable) | 0x4000;
LABEL_54:
            LODWORD(v25[10].__vftable) = v28;
            break;
          case 'w':
            uint64_t v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_51:
            this->__end_->__first_ = v27;
            this->__end_ = v27;
            LODWORD(v27[10].__vftable) |= 0x500u;
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v27, 95);
            break;
          default:
            char v26 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(this, (unsigned __int8 *)v3 + 1, (unsigned __int8 *)a3, 0);
            if (v13 == v26) {
              return v3;
            }
            else {
              return (std::basic_regex<char>::value_type *)v26;
            }
        }
        return v3 + 2;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v15);
      return v3 + 2;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
      return v3 + 1;
  }
}

void sub_21DE09748(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DE0975C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DE09770(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DE09784(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DE09798(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DE097AC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = v9 == a3;
      }
      if (!v21 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        unsigned int v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        size_t v11 = 0;
        goto LABEL_36;
      }
      __mexp_begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
      size_t v25 = 0;
      goto LABEL_45;
    }
    long long v8 = this;
    if (locale_low == 43)
    {
      uint64_t v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        unsigned int v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        size_t v11 = 1;
LABEL_36:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v10;
      }
      __mexp_begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
      size_t v25 = 1;
      goto LABEL_45;
    }
    return v8;
  }
  if (locale_low == 63)
  {
    std::basic_regex<char> v22 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6) {
      BOOL v23 = 1;
    }
    else {
      BOOL v23 = v22 == a3;
    }
    if (v23 || LOBYTE(v22->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v22;
    }
    else
    {
      int v24 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v24;
    }
  }
  else
  {
    long long v8 = this;
    if (locale_low != 123) {
      return v8;
    }
    uint64_t v13 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3) {
      goto LABEL_72;
    }
    int v14 = *v13;
    if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
      goto LABEL_72;
    }
    int v15 = v14 - 48;
    int v16 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_21:
      int v16 = (char *)a3;
    }
    else
    {
      while (1)
      {
        int v17 = *v16;
        if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
          break;
        }
        if (v15 >= 214748364) {
          goto LABEL_72;
        }
        int v15 = v17 + 10 * v15 - 48;
        if (++v16 == (char *)a3) {
          goto LABEL_21;
        }
      }
    }
    if (v16 == v13) {
      goto LABEL_72;
    }
    if (v16 == (char *)a3) {
      goto LABEL_73;
    }
    int v18 = *v16;
    if (v18 != 44)
    {
      if (v18 == 125)
      {
        uint64_t v19 = (std::basic_regex<char> *)(v16 + 1);
        if (v6 || v19 == a3 || LOBYTE(v19->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 1);
          return v19;
        }
        else
        {
          long long v20 = (unsigned __int8 *)(v16 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v20;
        }
      }
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    char v26 = (std::basic_regex<char> *)(v16 + 1);
    if (v16 + 1 == (char *)a3) {
      goto LABEL_72;
    }
    int v27 = LOBYTE(v26->__traits_.__loc_.__locale_);
    if (v27 == 125)
    {
      uint64_t v9 = (std::basic_regex<char> *)(v16 + 2);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        size_t v11 = v15;
        unsigned int v10 = v16 + 3;
        __mexp_begin = __mexp_begin;
        __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
        goto LABEL_36;
      }
      size_t v25 = v15;
      __mexp_begin = __mexp_begin;
      __mexp_std::vector<std::csub_match>::pointer end = __mexp_end;
LABEL_45:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v25, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v9;
    }
    if ((v27 & 0xF8) != 0x30 && (v27 & 0xFE) != 0x38) {
      goto LABEL_73;
    }
    int v28 = v27 - 48;
    uint64_t v29 = (std::basic_regex<char> *)(v16 + 2);
    if (v29 == a3)
    {
LABEL_61:
      uint64_t v29 = a3;
    }
    else
    {
      while (1)
      {
        int v30 = LOBYTE(v29->__traits_.__loc_.__locale_);
        if ((v30 & 0xF8) != 0x30 && (v30 & 0xFE) != 0x38) {
          break;
        }
        if (v28 >= 214748364) {
          goto LABEL_72;
        }
        int v28 = v30 + 10 * v28 - 48;
        uint64_t v29 = (std::basic_regex<char> *)((char *)v29 + 1);
        if (v29 == a3) {
          goto LABEL_61;
        }
      }
    }
    if (v29 == v26 || v29 == a3 || LOBYTE(v29->__traits_.__loc_.__locale_) != 125) {
LABEL_73:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v28 < v15) {
      goto LABEL_72;
    }
    int v31 = (std::basic_regex<char> *)((char *)&v29->__traits_.__loc_.__locale_ + 1);
    if (v6 || v31 == a3 || LOBYTE(v31->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 1);
      return v31;
    }
    else
    {
      uint64_t v32 = (char *)&v29->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v32;
    }
  }
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1)
{
  v2 = (const std::locale *)MEMORY[0x223C18920]();
  *(void *)(a1 + 8) = std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x263F8C130]);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  return a1;
}

void sub_21DE09E54(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  long long v8 = (char *)operator new(0x58uLL);
  first = this->__end_->__first_;
  *(void *)long long v8 = &unk_26CEBD6E8;
  *((void *)v8 + 1) = first;
  std::locale::locale((std::locale *)v8 + 2, &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *((void *)v8 + 7) = a2->__start_.__ptr_;
  *((void *)v8 + 8) = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *((void *)v8 + 9) = a2->__end_;
  *((_DWORD *)v8 + 20) = a4;
  v8[84] = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE09F6C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 92))
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
LABEL_11:
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
    return result;
  }
  if (*(void *)(a2 + 16) == *(void *)(a2 + 8) && (*(unsigned char *)(a2 + 88) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  *(_DWORD *)a2 = -993;
  *(void *)(a2 + 80) = 0;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD6A0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD6A0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_19;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 != v3)
  {
    if (v4 == v2)
    {
      int v5 = *(_DWORD *)(a2 + 88);
      if ((v5 & 0x80) == 0)
      {
        if ((v5 & 4) == 0)
        {
          uint64_t v6 = *v2;
          if (v6 == 95) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    uint64_t v7 = *(v4 - 1);
    uint64_t v8 = *v4;
    if (v7 == 95
      || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
    {
      int v9 = 1;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    else
    {
      int v9 = 0;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
    {
      if (*(unsigned char *)(result + 40) == (v9 != 0)) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
LABEL_24:
    if (*(unsigned char *)(result + 40) != (v9 != 1)) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  if ((*(unsigned char *)(a2 + 88) & 8) == 0)
  {
    uint64_t v6 = *(v3 - 1);
    if (v6 == 95) {
      goto LABEL_17;
    }
LABEL_15:
    if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
    {
LABEL_17:
      if (*(unsigned char *)(result + 40) != 1) {
        goto LABEL_27;
      }
LABEL_20:
      *(_DWORD *)a2 = -993;
      *(void *)(a2 + 80) = 0;
      return result;
    }
  }
LABEL_19:
  if (!*(unsigned char *)(result + 40)) {
    goto LABEL_20;
  }
LABEL_27:
  uint64_t v10 = *(void *)(result + 8);
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = v10;
  return result;
}

std::locale *std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD6E8;
  int v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    std::locale::~locale(v2);
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      return a1;
    }
    goto LABEL_4;
  }
  std::locale::~locale(a1 + 2);
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD6E8;
  int v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (!locale || atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    std::locale::~locale(a1 + 2);
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
  std::__shared_weak_count::__release_weak(locale);
  std::locale::~locale(v2);
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
LABEL_5:

  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v22 = 0xAAAAAAAAAAAAAA00;
  long long v24 = v4;
  uint64_t v21 = 0;
  long long v23 = 0uLL;
  LOBYTE(v24) = 0;
  BYTE8(v24) = 0;
  uint64_t v25 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v5 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)&long long v19 = *(void *)(a2 + 24);
  *((void *)&v19 + 1) = v19;
  LOBYTE(v20) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v5, (std::vector<std::csub_match>::const_reference)&v19);
  *((void *)&v20 + 1) = v6;
  uint64_t v21 = v6;
  LOBYTE(v22) = 0;
  long long v23 = v19;
  LOBYTE(v24) = v20;
  uint64_t v25 = v6;
  BYTE8(v24) = 1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v8 = v7 == *(void *)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v7, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    std::vector<std::csub_match>::pointer begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  std::vector<std::csub_match>::pointer begin = __p.__begin_;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!begin) {
      return;
    }
    goto LABEL_14;
  }
  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1;
  do
  {
    int v16 = &begin[v15];
    uint64_t v17 = v14 + 24 * (v13 + v12);
    *(std::pair<const char *, const char *> *)uint64_t v17 = v16->std::pair<const char *, const char *>;
    *(unsigned char *)(v17 + 16) = v16->matched;
    unint64_t v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:

  operator delete(begin);
}

void sub_21DE0A850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  long long v48 = 0;
  unint64_t v49 = 0;
  unint64_t v50 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    return 0;
  }
  __x.second = a3;
  *(void *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.first = a3;
  *(_DWORD *)int v46 = 0;
  memset(&v46[8], 0, 85);
  int v13 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v48, (uint64_t)v46);
  unint64_t v49 = v13;
  if (*(void *)&v46[56]) {
    operator delete(*(void **)&v46[56]);
  }
  if (*(void *)&v46[32]) {
    operator delete(*(void **)&v46[32]);
  }
  uint64_t v14 = *((void *)v13 - 8);
  *((_DWORD *)v13 - 24) = 0;
  *((void *)v13 - 11) = a2;
  *((void *)v13 - 10) = a2;
  *((void *)v13 - 9) = a3;
  unint64_t v15 = *(unsigned int *)(a1 + 28);
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v13 - 7) - v14) >> 3);
  if (v15 <= v16)
  {
    if (v15 < v16) {
      *((void *)v13 - 7) = v14 + 24 * v15;
    }
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v13 - 64), v15 - v16, &__x);
  }
  uint64_t v18 = *((void *)v13 - 5);
  unint64_t v19 = *(unsigned int *)(a1 + 32);
  unint64_t v20 = (*((void *)v13 - 4) - v18) >> 4;
  if (v19 <= v20)
  {
    if (v19 < v20) {
      *((void *)v13 - 4) = v18 + 16 * v19;
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v13 - 40), v19 - v20);
  }
  *((void *)v13 - 2) = v6;
  *((_DWORD *)v13 - 2) = a5;
  signed int v21 = a3 - a2;
  *(v13 - 4) = a6;
  unsigned int v22 = 1;
  while (2)
  {
    if ((v22 & 0xFFF) == 0 && (int)(v22 >> 12) >= v21) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    uint64_t v24 = *((void *)v13 - 2);
    if (v24) {
      (*(void (**)(uint64_t, char *))(*(void *)v24 + 16))(v24, v13 - 96);
    }
    switch(*((_DWORD *)v13 - 24))
    {
      case 0xFFFFFC18:
        uint64_t v25 = *((void *)v13 - 10);
        if ((a5 & 0x20) != 0 && v25 == a2) {
          goto LABEL_25;
        }
        uint64_t v37 = *a4;
        *(void *)uint64_t v37 = a2;
        *(void *)(v37 + 8) = v25;
        *(unsigned char *)(v37 + 16) = 1;
        uint64_t v38 = *((void *)v13 - 8);
        uint64_t v39 = *((void *)v13 - 7) - v38;
        if (v39)
        {
          unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 3);
          unint64_t v41 = (unsigned char *)(v38 + 16);
          unsigned int v42 = 1;
          do
          {
            uint64_t v43 = v37 + 24 * v42;
            *(_OWORD *)uint64_t v43 = *((_OWORD *)v41 - 1);
            char v44 = *v41;
            v41 += 24;
            *(unsigned char *)(v43 + 16) = v44;
          }
          while (v40 > v42++);
        }
        uint64_t v17 = 1;
        long long v23 = v48;
        if (!v48) {
          return v17;
        }
        goto LABEL_36;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_17;
      case 0xFFFFFC1F:
LABEL_25:
        char v26 = v49;
        int v27 = (void *)*((void *)v49 - 5);
        if (v27)
        {
          *((void *)v49 - 4) = v27;
          operator delete(v27);
        }
        int v28 = (void *)*((void *)v26 - 8);
        if (v28)
        {
          *((void *)v26 - 7) = v28;
          operator delete(v28);
        }
        unint64_t v49 = v26 - 96;
        goto LABEL_17;
      case 0xFFFFFC20:
        *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v46[64] = v29;
        *(_OWORD *)&v46[80] = v29;
        *(_OWORD *)&v46[32] = v29;
        *(_OWORD *)&v46[48] = v29;
        *(_OWORD *)int v46 = v29;
        *(_OWORD *)&v46[16] = v29;
        std::__state<char>::__state((uint64_t)v46, (long long *)v13 - 6);
        (*(void (**)(void, uint64_t, char *))(**((void **)v13 - 2) + 24))(*((void *)v13 - 2), 1, v13 - 96);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v46[80] + 24))(*(void *)&v46[80], 0, v46);
        int v30 = v49;
        if ((unint64_t)v49 >= v50)
        {
          unint64_t v49 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v48, (uint64_t)v46);
          if (*(void *)&v46[56])
          {
            *(void *)&v46[64] = *(void *)&v46[56];
            operator delete(*(void **)&v46[56]);
          }
        }
        else
        {
          long long v31 = *(_OWORD *)&v46[16];
          *(_OWORD *)unint64_t v49 = *(_OWORD *)v46;
          *((_OWORD *)v30 + 1) = v31;
          *((void *)v30 + 4) = 0;
          *((void *)v30 + 5) = 0;
          *((void *)v30 + 6) = 0;
          *((void *)v30 + 7) = 0;
          *((_OWORD *)v30 + 2) = *(_OWORD *)&v46[32];
          *((void *)v30 + 6) = *(void *)&v46[48];
          memset(&v46[32], 0, 24);
          *((void *)v30 + 8) = 0;
          *((void *)v30 + 9) = 0;
          *(_OWORD *)(v30 + 56) = *(_OWORD *)&v46[56];
          *((void *)v30 + 9) = *(void *)&v46[72];
          memset(&v46[56], 0, 24);
          uint64_t v32 = *(void *)&v46[80];
          *(void *)(v30 + 85) = *(void *)&v46[85];
          *((void *)v30 + 10) = v32;
          unint64_t v49 = v30 + 96;
        }
        if (*(void *)&v46[32])
        {
          *(void *)&v46[40] = *(void *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }
LABEL_17:
        long long v23 = v48;
        int v13 = v49;
        ++v22;
        if (v48 != v49) {
          continue;
        }
        uint64_t v17 = 0;
        if (v48)
        {
LABEL_36:
          for (i = v49; i != v23; i -= 96)
          {
            uint64_t v34 = (void *)*((void *)i - 5);
            if (v34)
            {
              *((void *)i - 4) = v34;
              operator delete(v34);
            }
            unint64_t v35 = (void *)*((void *)i - 8);
            if (v35)
            {
              *((void *)i - 7) = v35;
              operator delete(v35);
            }
          }
          operator delete(v23);
        }
        break;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    return v17;
  }
}

void sub_21DE0AC94(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 104));
  _Unwind_Resume(a1);
}

void sub_21DE0ACA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__state<char>::~__state(&a9);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v9 - 104));
  _Unwind_Resume(a1);
}

void sub_21DE0ACF0(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 104));
  _Unwind_Resume(a1);
}

void sub_21DE0AD04(_Unwind_Exception *a1)
{
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 104));
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  value = this->__end_cap_.__value_;
  std::vector<std::csub_match>::pointer begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) < __n)
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_26;
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    std::vector<std::csub_match>::size_type v9 = 2 * v8;
    if (2 * v8 <= __n) {
      std::vector<std::csub_match>::size_type v9 = __n;
    }
    unint64_t v10 = v8 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v9;
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
LABEL_26:
    }
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    uint64_t v11 = v10;
    int v12 = (std::sub_match<const char *> *)operator new(24 * v10);
    this->__begin_ = v12;
    this->__end_ = v12;
    this->__end_cap_.__value_ = &v12[v11];
    std::vector<std::csub_match>::size_type v13 = 24 * __n;
    uint64_t v14 = &v12[__n];
    do
    {
      v12->std::pair<const char *, const char *> = __u->std::pair<const char *, const char *>;
      *(void *)&v12->matched = *(void *)&__u->matched;
      ++v12;
      v13 -= 24;
    }
    while (v13);
    goto LABEL_25;
  }
  std::vector<std::csub_match>::pointer end = this->__end_;
  unint64_t v16 = end - begin;
  if (v16 >= __n) {
    std::vector<std::csub_match>::size_type v17 = __n;
  }
  else {
    std::vector<std::csub_match>::size_type v17 = end - begin;
  }
  if (v17)
  {
    uint64_t v18 = begin;
    do
    {
      *v18++ = *__u;
      --v17;
    }
    while (v17);
  }
  if (__n <= v16)
  {
    uint64_t v14 = &begin[__n];
LABEL_25:
    this->__end_ = v14;
    return;
  }
  unint64_t v19 = &end[__n - v16];
  std::vector<std::csub_match>::size_type v20 = 24 * __n - 24 * v16;
  do
  {
    std::pair<const char *, const char *> v21 = __u->std::pair<const char *, const char *>;
    *(void *)&end->matched = *(void *)&__u->matched;
    end->std::pair<const char *, const char *> = v21;
    ++end;
    v20 -= 24;
  }
  while (v20);
  this->__end_ = v19;
}

void std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__state<char>::~__state(void *a1)
{
  int v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  int v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE0AF78(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE0AFD0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::__state<char>>::~vector[abi:ne180100](void **a1)
{
  int v2 = (char *)*a1;
  if (*a1)
  {
    int v3 = (char *)a1[1];
    long long v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        std::vector<std::csub_match>::size_type v5 = (void *)*((void *)v3 - 5);
        if (v5)
        {
          *((void *)v3 - 4) = v5;
          operator delete(v5);
        }
        uint64_t v6 = (void *)*((void *)v3 - 8);
        if (v6)
        {
          *((void *)v3 - 7) = v6;
          operator delete(v6);
        }
        v3 -= 96;
      }
      while (v3 != v2);
      long long v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 5);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) > v3) {
    unint64_t v3 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) >= 0x155555555555555) {
    unint64_t v6 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v7 = (char *)operator new(96 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  std::vector<std::csub_match>::size_type v9 = &v7[96 * v2];
  *(_OWORD *)std::vector<std::csub_match>::size_type v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  unint64_t v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v9 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(v9 + 85) = *(void *)(a2 + 85);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  *((void *)v9 + 9) = 0;
  *((void *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v9 + 9) = v11;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  std::vector<std::csub_match>::size_type v13 = v9 + 96;
  uint64_t v14 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      std::vector<std::csub_match>::size_type v17 = &v9[v16];
      uint64_t v18 = &v15[v16];
      long long v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((void *)v17 - 7) = 0;
      *((void *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((void *)v17 - 6) = *(void *)&v15[v16 - 48];
      *((void *)v18 - 8) = 0;
      *((void *)v18 - 7) = 0;
      *((void *)v18 - 6) = 0;
      *((void *)v17 - 4) = 0;
      *((void *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((void *)v17 - 3) = *(void *)&v15[v16 - 24];
      *((void *)v18 - 5) = 0;
      *((void *)v18 - 4) = 0;
      *((void *)v18 - 3) = 0;
      uint64_t v20 = *(void *)&v15[v16 - 16];
      *(void *)(v17 - 11) = *(void *)&v15[v16 - 11];
      *((void *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    unint64_t v15 = (char *)*a1;
    std::pair<const char *, const char *> v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      unsigned int v22 = (void *)*((void *)v21 - 5);
      if (v22)
      {
        *((void *)v21 - 4) = v22;
        operator delete(v22);
      }
      long long v23 = (void *)*((void *)v21 - 8);
      if (v23)
      {
        *((void *)v21 - 7) = v23;
        operator delete(v23);
      }
      v21 -= 96;
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      std::vector<std::csub_match>::size_type v13 = &end[__n];
      std::vector<std::csub_match>::size_type v14 = 24 * __n;
      do
      {
        std::pair<const char *, const char *> v15 = __x->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__x->matched;
        end->std::pair<const char *, const char *> = v15;
        ++end;
        v14 -= 24;
      }
      while (v14);
      std::vector<std::csub_match>::pointer end = v13;
    }
    this->__end_ = end;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    unint64_t v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v12 = (char *)operator new(24 * v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v16 = (std::sub_match<const char *> *)&v12[24 * v8];
    std::vector<std::csub_match>::size_type v17 = 24 * __n;
    uint64_t v18 = &v16[__n];
    long long v19 = v16;
    do
    {
      std::pair<const char *, const char *> v20 = __x->std::pair<const char *, const char *>;
      v19[1].first = *(const char **)&__x->matched;
      *long long v19 = v20;
      long long v19 = (std::pair<const char *, const char *> *)((char *)v19 + 24);
      v17 -= 24;
    }
    while (v17);
    std::vector<std::csub_match>::pointer begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        std::pair<const char *, const char *> v22 = end[-1].std::pair<const char *, const char *>;
        *(void *)&v16[-1].matched = *(void *)&end[-1].matched;
        v16[-1].std::pair<const char *, const char *> = v22;
        --v16;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v16;
    this->__end_ = v18;
    this->__end_cap_.__value_ = (std::sub_match<const char *> *)&v12[24 * v11];
    if (end)
    {
      operator delete(end);
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::vector<std::csub_match>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      std::vector<std::pair<unsigned long, const char *>>::size_type v12 = 16 * __n;
      bzero(this->__end_, 16 * __n);
      std::vector<std::csub_match>::pointer end = (std::pair<unsigned long, const char *> *)((char *)end + v12);
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<std::pair<unsigned long, const char *>>::pointer begin = this->__begin_;
    uint64_t v7 = end - this->__begin_;
    unint64_t v8 = v7 + __n;
    if ((v7 + __n) >> 60) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = (char *)value - (char *)begin;
    if (v9 >> 3 > v8) {
      unint64_t v8 = v9 >> 3;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v11 = (char *)operator new(16 * v10);
    }
    else
    {
      unint64_t v11 = 0;
    }
    std::vector<std::csub_match>::size_type v13 = (std::pair<unsigned long, const char *> *)&v11[16 * v7];
    size_t v14 = __n;
    std::pair<const char *, const char *> v15 = (std::pair<unsigned long, const char *> *)&v11[16 * v10];
    bzero(v13, v14 * 16);
    uint64_t v16 = &v13[v14];
    if (end != begin)
    {
      do
      {
        v13[-1] = end[-1];
        --v13;
        --end;
      }
      while (end != begin);
      std::vector<std::csub_match>::pointer end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
    {
      operator delete(end);
    }
  }
}

uint64_t std::__state<char>::__state(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v7 = (unsigned char *)*((void *)a2 + 4);
  unint64_t v6 = (unsigned char *)*((void *)a2 + 5);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v8 >> 3) >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = (char *)operator new(v8);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = &v9[8 * (v8 >> 3)];
    size_t v10 = 24 * ((v8 - 24) / 0x18uLL) + 24;
    memcpy(v9, v7, v10);
    *(void *)(a1 + 40) = &v9[v10];
  }
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  std::vector<std::pair<unsigned long, const char *>>::size_type v12 = (unsigned char *)*((void *)a2 + 7);
  unint64_t v11 = (unsigned char *)*((void *)a2 + 8);
  uint64_t v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0) {
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
    size_t v14 = (char *)operator new(v11 - v12);
    *(void *)(a1 + 56) = v14;
    *(void *)(a1 + 64) = v14;
    *(void *)(a1 + 72) = &v14[16 * (v13 >> 4)];
    size_t v15 = v13 & 0xFFFFFFFFFFFFFFF0;
    memcpy(v14, v12, v15);
    *(void *)(a1 + 64) = &v14[v15];
  }
  uint64_t v16 = *((void *)a2 + 10);
  *(void *)(a1 + 85) = *(void *)((char *)a2 + 85);
  *(void *)(a1 + 80) = v16;
  return a1;
}

void sub_21DE0B660(_Unwind_Exception *exception_object)
{
  long long v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 64) = v5;
    operator delete(v5);
  }
  unint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_295;
    }
    int v5 = a2[1];
    char v6 = v5 == 94;
    uint64_t v7 = (uint64_t)(v5 == 94 ? a2 + 2 : a2 + 1);
    int64_t v8 = (char *)operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(void *)(*(void *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    *(void *)(a1 + 56) = v8;
    if ((std::basic_regex<char>::value_type *)v7 == a3) {
      goto LABEL_295;
    }
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(unsigned char *)v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if ((std::basic_regex<char>::value_type *)v7 == a3) {
      goto LABEL_295;
    }
    uint64_t v124 = (uint64_t)(v8 + 16);
    size_t v123 = (void **)(v8 + 88);
    uint64_t v125 = 4 - (void)a3;
    uint64_t v9 = (unsigned __int8 *)(a3 - 5);
    while (1)
    {
      size_t v10 = (std::basic_regex<char>::value_type *)v7;
      if ((std::basic_regex<char>::value_type *)v7 == a3)
      {
        uint64_t v7 = (uint64_t)a3;
        goto LABEL_15;
      }
      int v11 = *(unsigned __int8 *)v7;
      std::vector<std::pair<unsigned long, const char *>>::size_type v12 = (std::basic_regex<char>::value_type *)v7;
      if (v11 == 93) {
        goto LABEL_14;
      }
      __p[0] = 0;
      __p[1] = 0;
      unint64_t v133 = 0;
      std::vector<std::pair<unsigned long, const char *>>::size_type v12 = (std::basic_regex<char>::value_type *)v7;
      if ((std::basic_regex<char>::value_type *)(v7 + 1) == a3 || v11 != 91) {
        goto LABEL_62;
      }
      int v13 = *(unsigned __int8 *)(v7 + 1);
      if (v13 != 46)
      {
        if (v13 == 58)
        {
          long long v23 = (char *)(v7 + 2);
          if ((uint64_t)&a3[-v7 - 2] < 2) {
            goto LABEL_293;
          }
          uint64_t v24 = v7 - (void)a3;
          uint64_t v25 = 2;
          while (1)
          {
            unint64_t v26 = v25 - 2;
            while (*(unsigned char *)(v7 + v26 + 2) != 58)
            {
              ++v26;
              if (v24 + v26 == -3) {
                goto LABEL_293;
              }
            }
            if (*(unsigned char *)(v7 + v26 + 3) == 93) {
              break;
            }
            uint64_t v25 = v26 + 3;
            if (v24 + v26 == -4) {
              goto LABEL_293;
            }
          }
          uint64_t v38 = v7 + v26 + 2;
          if ((std::basic_regex<char>::value_type *)v38 == a3) {
            goto LABEL_293;
          }
          int v39 = *(_DWORD *)(a1 + 24);
          memset(v136, 170, sizeof(v136));
          if (v26 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v26 >= 0x17)
          {
            uint64_t v43 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v26 | 7) != 0x17) {
              uint64_t v43 = v26 | 7;
            }
            uint64_t v44 = v43 + 1;
            unint64_t v40 = operator new(v43 + 1);
            *(void *)&v136[8] = v26;
            *(void *)&v136[16] = v44 | 0x8000000000000000;
            *(void *)int v136 = v40;
          }
          else
          {
            v136[23] = v26;
            unint64_t v40 = v136;
            if (!v26)
            {
              unint64_t v41 = v136;
              goto LABEL_169;
            }
          }
          if (v26 < 0x20)
          {
            unint64_t v41 = v40;
          }
          else if ((unint64_t)(v40 - v23) < 0x20)
          {
            unint64_t v41 = v40;
          }
          else
          {
            unint64_t v41 = &v40[v26 & 0xFFFFFFFFFFFFFFE0];
            v23 += v26 & 0xFFFFFFFFFFFFFFE0;
            unint64_t v45 = (long long *)(v10 + 18);
            int v46 = v40 + 16;
            unint64_t v47 = v26 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v48 = *v45;
              *(v46 - 1) = *(v45 - 1);
              _OWORD *v46 = v48;
              v45 += 2;
              v46 += 2;
              v47 -= 32;
            }
            while (v47);
            if (v26 == (v26 & 0x7FFFFFFFFFFFFFE0)) {
              goto LABEL_169;
            }
          }
          do
          {
            char v79 = *v23++;
            *v41++ = v79;
          }
          while (v23 != (char *)v38);
LABEL_169:
          *unint64_t v41 = 0;
          uint64_t v80 = v136[23];
          if (v136[23] >= 0) {
            uint64_t v81 = v136;
          }
          else {
            uint64_t v81 = *(unsigned char **)v136;
          }
          if (v136[23] < 0) {
            uint64_t v80 = *(void *)&v136[8];
          }
          (*(void (**)(void, unsigned char *, unsigned char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v81, &v81[v80]);
          if (v136[23] >= 0) {
            unint64_t v82 = v136;
          }
          else {
            unint64_t v82 = *(const char **)v136;
          }
          std::regex_traits<char>::char_class_type classname = std::__get_classname(v82, v39 & 1);
          uint64_t v9 = (unsigned __int8 *)(a3 - 5);
          if ((v136[23] & 0x80000000) != 0) {
            operator delete(*(void **)v136);
          }
          if (!classname) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
          }
          char v77 = 0;
          *((_DWORD *)v8 + 40) |= classname;
          uint64_t v7 = (uint64_t)&v10[v26 + 4];
          unint64_t v71 = v10;
          if ((SHIBYTE(v133) & 0x80000000) == 0)
          {
LABEL_160:
            std::vector<std::pair<unsigned long, const char *>>::size_type v12 = v71;
            if ((v77 & 1) == 0) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
          goto LABEL_188;
        }
        if (v13 == 61)
        {
          if ((uint64_t)&a3[-v7 - 2] < 2) {
            goto LABEL_293;
          }
          uint64_t v14 = 0;
          uint64_t v15 = v7;
          uint64_t v16 = v125 + v7;
          if (*(unsigned char *)(v7 + 2) == 61) {
            goto LABEL_27;
          }
          do
          {
            do
            {
              if (!v16) {
LABEL_293:
              }
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
              ++v14;
              uint64_t v15 = v7 + v14;
              uint64_t v16 = v125 + v7 + v14;
            }
            while (*(unsigned char *)(v7 + v14 + 2) != 61);
LABEL_27:
            ;
          }
          while (*(unsigned char *)(v15 + 3) != 93);
          std::vector<std::csub_match>::size_type v17 = (char *)(v7 + v14 + 2);
          if (v17 == a3) {
            goto LABEL_293;
          }
          memset(v135, 170, sizeof(v135));
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v135, a1, v7 + 2, v17);
          if ((v135[23] & 0x80000000) == 0)
          {
            uint64_t v18 = v135[23];
            if (!v135[23]) {
              goto LABEL_297;
            }
            memset(__s, 170, sizeof(__s));
            long long v19 = v135;
            std::pair<const char *, const char *> v20 = &v135[v135[23]];
            memset(v136, 170, sizeof(v136));
            if (v135[23] <= 0x16uLL) {
              goto LABEL_32;
            }
LABEL_90:
            uint64_t v49 = (v18 & 0x7FFFFFFFFFFFFFF8) + 8;
            if ((v18 | 7) != 0x17) {
              uint64_t v49 = v18 | 7;
            }
            uint64_t v50 = v49 + 1;
            std::pair<const char *, const char *> v21 = operator new(v49 + 1);
            *(void *)&v136[8] = v18;
            *(void *)&v136[16] = v50 | 0x8000000000000000;
            *(void *)int v136 = v21;
            uint64_t v22 = v20 - v19;
            uint64_t v9 = (unsigned __int8 *)(a3 - 5);
            if ((unint64_t)(v20 - v19) >= 0x20) {
              goto LABEL_93;
            }
LABEL_98:
            size_t v51 = v21;
            int v52 = v19;
            goto LABEL_99;
          }
          uint64_t v18 = *(void *)&v135[8];
          if (!*(void *)&v135[8]) {
LABEL_297:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          memset(__s, 170, sizeof(__s));
          long long v19 = *(unsigned char **)v135;
          memset(v136, 170, sizeof(v136));
          if (*(void *)&v135[8] > 0x7FFFFFFFFFFFFFF7uLL) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          std::pair<const char *, const char *> v20 = (char *)(*(void *)v135 + *(void *)&v135[8]);
          if (*(void *)&v135[8] > 0x16uLL) {
            goto LABEL_90;
          }
LABEL_32:
          v136[23] = v18;
          std::pair<const char *, const char *> v21 = v136;
          uint64_t v22 = v20 - v19;
          uint64_t v9 = (unsigned __int8 *)(a3 - 5);
          if ((unint64_t)(v20 - v19) < 0x20) {
            goto LABEL_98;
          }
LABEL_93:
          if ((unint64_t)(v21 - v19) < 0x20) {
            goto LABEL_98;
          }
          size_t v51 = &v21[v22 & 0xFFFFFFFFFFFFFFE0];
          int v52 = &v19[v22 & 0xFFFFFFFFFFFFFFE0];
          char v53 = (long long *)(v19 + 16);
          std::string::size_type v54 = v21 + 16;
          unint64_t v55 = v22 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v56 = *v53;
            *(v54 - 1) = *(v53 - 1);
            *std::string::size_type v54 = v56;
            v53 += 2;
            v54 += 2;
            v55 -= 32;
          }
          while (v55);
          if (v22 != (v22 & 0xFFFFFFFFFFFFFFE0))
          {
            do
            {
LABEL_99:
              char v57 = *v52++;
              *v51++ = v57;
            }
            while (v52 != v20);
          }
          *size_t v51 = 0;
          memset(__s, 170, sizeof(__s));
          (*(void (**)(std::string::value_type **__return_ptr))(**(void **)(a1 + 16) + 32))(__s);
          unint64_t v58 = (std::string::value_type *)HIBYTE(__s[2]);
          if (SHIBYTE(__s[2]) < 0) {
            unint64_t v58 = __s[1];
          }
          if (v58 != (std::string::value_type *)1)
          {
            if (v58 == (std::string::value_type *)12)
            {
              unint64_t v59 = __s;
              if (SHIBYTE(__s[2]) < 0) {
                unint64_t v59 = (std::string::value_type **)__s[0];
              }
              *((unsigned char *)v59 + 11) = *((unsigned char *)v59 + 3);
              if ((v136[23] & 0x80000000) != 0)
              {
LABEL_107:
                operator delete(*(void **)v136);
                v60 = (std::string::value_type *)HIBYTE(__s[2]);
                int v61 = SHIBYTE(__s[2]);
                unint64_t v62 = __s[1];
                if (SHIBYTE(__s[2]) < 0) {
                  v60 = __s[1];
                }
                if (!v60) {
                  goto LABEL_110;
                }
LABEL_123:
                unint64_t v66 = *((void *)v8 + 18);
                if (v66 >= *((void *)v8 + 19))
                {
                  *((void *)v8 + 18) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v8 + 17, (uint64_t)__s);
                  if (SHIBYTE(__s[2]) < 0) {
                    goto LABEL_196;
                  }
                }
                else
                {
                  if (v61 < 0)
                  {
                    std::string::__init_copy_ctor_external(*((std::string **)v8 + 18), __s[0], (std::string::size_type)v62);
                  }
                  else
                  {
                    long long v67 = *(_OWORD *)__s;
                    *(std::string::value_type **)(v66 + 16) = __s[2];
                    *(_OWORD *)unint64_t v66 = v67;
                  }
                  *((void *)v8 + 18) = v66 + 24;
                  *((void *)v8 + 18) = v66 + 24;
                  if (SHIBYTE(__s[2]) < 0) {
                    goto LABEL_196;
                  }
                }
LABEL_186:
                if ((v135[23] & 0x80000000) == 0) {
                  goto LABEL_187;
                }
                goto LABEL_197;
              }
LABEL_120:
              uint64_t v65 = (std::string::value_type *)HIBYTE(__s[2]);
              int v61 = SHIBYTE(__s[2]);
              unint64_t v62 = __s[1];
              if (SHIBYTE(__s[2]) < 0) {
                uint64_t v65 = __s[1];
              }
              if (v65) {
                goto LABEL_123;
              }
LABEL_110:
              uint64_t v63 = v135[23];
              if (v135[23] < 0) {
                uint64_t v63 = *(void *)&v135[8];
              }
              if (v63 == 2)
              {
                long long v84 = v135;
                if (v135[23] < 0) {
                  long long v84 = *(char **)v135;
                }
                std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *v84, v84[1]);
              }
              else
              {
                if (v63 != 1) {
                  std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
                }
                v64 = v135;
                if (v135[23] < 0) {
                  v64 = *(char **)v135;
                }
                std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *v64);
              }
              if ((SHIBYTE(__s[2]) & 0x80000000) == 0) {
                goto LABEL_186;
              }
LABEL_196:
              operator delete(__s[0]);
              if ((v135[23] & 0x80000000) == 0)
              {
LABEL_187:
                char v77 = 0;
                uint64_t v7 = (uint64_t)&v10[v14 + 4];
                unint64_t v71 = v10;
                if ((SHIBYTE(v133) & 0x80000000) == 0) {
                  goto LABEL_160;
                }
                goto LABEL_188;
              }
LABEL_197:
              operator delete(*(void **)v135);
              goto LABEL_187;
            }
            if (SHIBYTE(__s[2]) < 0)
            {
              *__s[0] = 0;
              __s[1] = 0;
              if ((v136[23] & 0x80000000) != 0) {
                goto LABEL_107;
              }
              goto LABEL_120;
            }
            LOBYTE(__s[0]) = 0;
            HIBYTE(__s[2]) = 0;
          }
          if ((v136[23] & 0x80000000) != 0) {
            goto LABEL_107;
          }
          goto LABEL_120;
        }
        std::vector<std::pair<unsigned long, const char *>>::size_type v12 = (std::basic_regex<char>::value_type *)v7;
LABEL_62:
        uint64_t v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
        int v34 = 0;
        goto LABEL_63;
      }
      int v27 = (unsigned char *)(v7 + 2);
      if ((uint64_t)&a3[-v7 - 2] < 2) {
        goto LABEL_294;
      }
      int v28 = (std::basic_regex<char>::value_type *)v7;
      long long v29 = (std::basic_regex<char>::value_type *)(v7 + 2);
      int v30 = v10 + 3;
      if (*v27 != 46) {
        break;
      }
LABEL_48:
      if (*v30 != 93) {
        goto LABEL_46;
      }
      if (v29 == a3) {
LABEL_294:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v136, a1, (uint64_t)v27, v28 + 2);
      if (SHIBYTE(v133) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)std::vector<std::csub_match> __p = *(_OWORD *)v136;
      unint64_t v133 = *(void *)&v136[16];
      unint64_t v32 = *(void *)&v136[8];
      if (v136[23] >= 0) {
        int v33 = (char *)HIBYTE(v133);
      }
      else {
        int v33 = (char *)__p[1];
      }
      if ((unint64_t)(v33 - 1) >= 2) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      }
      std::vector<std::pair<unsigned long, const char *>>::size_type v12 = v29 + 2;
      uint64_t v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
      int v34 = v136[23];
      if (v136[23] >= 0) {
        unint64_t v32 = HIBYTE(v133);
      }
      if (v32)
      {
        if (v12 == a3) {
          goto LABEL_131;
        }
        goto LABEL_130;
      }
LABEL_63:
      if ((v7 | 0x40) == 0x40)
      {
        int v35 = *v12;
        if (v35 == 92)
        {
          uint64_t v36 = v12 + 1;
          if (v7) {
            uint64_t v37 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v36, a3, (uint64_t *)__p);
          }
          else {
            uint64_t v37 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v36, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
          }
          std::vector<std::pair<unsigned long, const char *>>::size_type v12 = v37;
          if (v37 == a3) {
            goto LABEL_131;
          }
          goto LABEL_130;
        }
      }
      else
      {
        LOBYTE(v35) = *v12;
      }
      if (v34 < 0)
      {
        unsigned int v42 = __p[0];
        __p[1] = (void *)1;
        *(unsigned char *)__p[0] = v35;
        v42[1] = 0;
        if (++v12 == a3) {
          goto LABEL_131;
        }
      }
      else
      {
        HIBYTE(v133) = 1;
        LOWORD(__p[0]) = v35;
        if (++v12 == a3) {
          goto LABEL_131;
        }
      }
LABEL_130:
      int v68 = *v12;
      if (v68 != 93)
      {
        uint64_t v70 = v12 + 1;
        if (v12 + 1 != a3 && v68 == 45 && *v70 != 93)
        {
          v130[0] = 0;
          v130[1] = 0;
          v131 = 0;
          unint64_t v71 = v12 + 2;
          if (v12 + 2 == a3 || *v70 != 91 || *v71 != 46)
          {
            if ((v7 | 0x40) == 0x40)
            {
              LODWORD(v70) = *v70;
              if (v70 == 92)
              {
                if (v7) {
                  char v78 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v71, a3, (uint64_t *)v130);
                }
                else {
                  char v78 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v71, (unsigned __int8 *)a3, (uint64_t)v130, (uint64_t)v8);
                }
                unint64_t v71 = v78;
                goto LABEL_200;
              }
            }
            else
            {
              LOBYTE(v70) = *v70;
            }
            HIBYTE(v131) = 1;
            LOWORD(v130[0]) = v70;
            goto LABEL_200;
          }
          v72 = v12 + 3;
          if (a3 - (v12 + 3) < 2) {
            goto LABEL_296;
          }
          unsigned int v73 = v12 + 3;
          uint64_t v74 = v12 + 4;
          if (*v72 == 46) {
            goto LABEL_149;
          }
          do
          {
            do
            {
              if (v9 == (unsigned __int8 *)v12) {
                goto LABEL_296;
              }
              ++v12;
              unsigned int v73 = v74;
              int v75 = *v74++;
            }
            while (v75 != 46);
LABEL_149:
            ;
          }
          while (*v74 != 93);
          if (v73 == a3) {
LABEL_296:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v136, a1, (uint64_t)v72, v12 + 3);
          if (SHIBYTE(v131) < 0) {
            operator delete(v130[0]);
          }
          v131 = *(std::string::value_type **)&v136[16];
          *(_OWORD *)unint64_t v130 = *(_OWORD *)v136;
          long long v76 = (char *)HIBYTE(*(void *)&v136[16]);
          if (v136[23] < 0) {
            long long v76 = (char *)v130[1];
          }
          if ((unint64_t)(v76 - 1) >= 2) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          }
          unint64_t v71 = v73 + 2;
LABEL_200:
          *(_OWORD *)v128 = *(_OWORD *)__p;
          uint64_t v129 = v133;
          __p[1] = 0;
          unint64_t v133 = 0;
          __p[0] = 0;
          *(_OWORD *)unint64_t v126 = *(_OWORD *)v130;
          v127 = v131;
          v130[0] = 0;
          v130[1] = 0;
          v131 = 0;
          if (v8[170])
          {
            if (v8[169])
            {
              BOOL v85 = v129 < 0;
              uint64_t v86 = (void *)HIBYTE(v129);
              if (v129 < 0) {
                uint64_t v86 = v128[1];
              }
              if (v86)
              {
                unint64_t v87 = 0;
                do
                {
                  if (v85) {
                    unint64_t v88 = (void **)v128[0];
                  }
                  else {
                    unint64_t v88 = v128;
                  }
                  char v89 = (*(uint64_t (**)(void, void))(**((void **)v8 + 3) + 40))(*((void *)v8 + 3), *((char *)v88 + v87));
                  if (v129 >= 0) {
                    v90 = v128;
                  }
                  else {
                    v90 = (void **)v128[0];
                  }
                  *((unsigned char *)v90 + v87++) = v89;
                  BOOL v85 = v129 < 0;
                  v91 = (void *)HIBYTE(v129);
                  if (v129 < 0) {
                    v91 = v128[1];
                  }
                }
                while (v87 < (unint64_t)v91);
              }
              BOOL v92 = SHIBYTE(v127) < 0;
              uint64_t v93 = (void *)HIBYTE(v127);
              if (SHIBYTE(v127) < 0) {
                uint64_t v93 = v126[1];
              }
              if (v93)
              {
                unint64_t v94 = 0;
                do
                {
                  if (v92) {
                    v95 = (void **)v126[0];
                  }
                  else {
                    v95 = v126;
                  }
                  char v96 = (*(uint64_t (**)(void, void))(**((void **)v8 + 3) + 40))(*((void *)v8 + 3), *((char *)v95 + v94));
                  if (SHIBYTE(v127) >= 0) {
                    v97 = v126;
                  }
                  else {
                    v97 = (void **)v126[0];
                  }
                  *((unsigned char *)v97 + v94++) = v96;
                  BOOL v92 = SHIBYTE(v127) < 0;
                  v98 = (void *)HIBYTE(v127);
                  if (SHIBYTE(v127) < 0) {
                    v98 = v126[1];
                  }
                }
                while (v94 < (unint64_t)v98);
              }
            }
            v99 = (char *)HIBYTE(v129);
            if (v129 >= 0) {
              v100 = v128;
            }
            else {
              v100 = (void **)v128[0];
            }
            if (v129 < 0) {
              v99 = (char *)v128[1];
            }
            std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)v135, v124, (uint64_t)v100, &v99[(void)v100]);
            uint64_t v7 = (uint64_t)&v137;
            v101 = (char *)HIBYTE(v127);
            if (SHIBYTE(v127) >= 0) {
              unint64_t v102 = v126;
            }
            else {
              unint64_t v102 = (void **)v126[0];
            }
            if (SHIBYTE(v127) < 0) {
              v101 = (char *)v126[1];
            }
            std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)__s, v124, (uint64_t)v102, &v101[(void)v102]);
            *(_OWORD *)int v136 = *(_OWORD *)v135;
            *(void *)&v136[16] = *(void *)&v135[16];
            memset(v135, 0, sizeof(v135));
            long long v137 = *(_OWORD *)__s;
            v138 = __s[2];
            memset(__s, 0, sizeof(__s));
            unint64_t v103 = *((void *)v8 + 12);
            if (v103 < *((void *)v8 + 13))
            {
              long long v104 = *(_OWORD *)v136;
              *(void *)(v103 + 16) = *(void *)&v136[16];
              *(_OWORD *)unint64_t v103 = v104;
              memset(v136, 0, sizeof(v136));
              uint64_t v105 = v138;
              *(_OWORD *)(v103 + 24) = v137;
              *(void *)(v103 + 40) = v105;
              *((void *)v8 + 12) = v103 + 48;
              if ((v136[23] & 0x80000000) != 0) {
                goto LABEL_240;
              }
LABEL_267:
              if ((SHIBYTE(__s[2]) & 0x80000000) == 0) {
                goto LABEL_268;
              }
LABEL_241:
              operator delete(__s[0]);
              if ((v135[23] & 0x80000000) != 0) {
                goto LABEL_269;
              }
LABEL_275:
              if (SHIBYTE(v127) < 0)
              {
                operator delete(v126[0]);
                if (SHIBYTE(v129) < 0) {
                  goto LABEL_281;
                }
LABEL_277:
                if ((SHIBYTE(v131) & 0x80000000) == 0) {
                  goto LABEL_278;
                }
LABEL_282:
                operator delete(v130[0]);
                char v77 = 1;
                if ((SHIBYTE(v133) & 0x80000000) == 0) {
                  goto LABEL_160;
                }
              }
              else
              {
                if ((SHIBYTE(v129) & 0x80000000) == 0) {
                  goto LABEL_277;
                }
LABEL_281:
                operator delete(v128[0]);
                if (SHIBYTE(v131) < 0) {
                  goto LABEL_282;
                }
LABEL_278:
                char v77 = 1;
                if ((SHIBYTE(v133) & 0x80000000) == 0) {
                  goto LABEL_160;
                }
              }
LABEL_188:
              operator delete(__p[0]);
              std::vector<std::pair<unsigned long, const char *>>::size_type v12 = v71;
              if ((v77 & 1) == 0) {
                goto LABEL_15;
              }
              goto LABEL_14;
            }
            long long v117 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(v123, (uint64_t)v136);
            int v118 = SHIBYTE(v138);
            *((void *)v8 + 12) = v117;
            if (v118 < 0)
            {
              operator delete((void *)v137);
              if ((v136[23] & 0x80000000) == 0) {
                goto LABEL_267;
              }
            }
            else if ((v136[23] & 0x80000000) == 0)
            {
              goto LABEL_267;
            }
LABEL_240:
            operator delete(*(void **)v136);
            if (SHIBYTE(__s[2]) < 0) {
              goto LABEL_241;
            }
LABEL_268:
            if ((v135[23] & 0x80000000) == 0) {
              goto LABEL_275;
            }
LABEL_269:
            v119 = *(void **)v135;
          }
          else
          {
            char v106 = (void *)HIBYTE(v129);
            if (v129 < 0) {
              char v106 = v128[1];
            }
            if (v106 != (void *)1) {
              goto LABEL_302;
            }
            std::string::size_type v107 = (void *)HIBYTE(v127);
            if (SHIBYTE(v127) < 0) {
              std::string::size_type v107 = v126[1];
            }
            if (v107 != (void *)1) {
LABEL_302:
            }
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
            uint64_t v7 = (uint64_t)v126;
            if (v8[169])
            {
              if (v129 >= 0) {
                char v108 = v128;
              }
              else {
                char v108 = (void **)v128[0];
              }
              char v109 = (*(uint64_t (**)(void, void))(**((void **)v8 + 3) + 40))(*((void *)v8 + 3), *(char *)v108);
              if (v129 >= 0) {
                uint64_t v110 = v128;
              }
              else {
                uint64_t v110 = (void **)v128[0];
              }
              *(unsigned char *)uint64_t v110 = v109;
              if (SHIBYTE(v127) >= 0) {
                uint64_t v111 = v126;
              }
              else {
                uint64_t v111 = (void **)v126[0];
              }
              char v112 = (*(uint64_t (**)(void, void))(**((void **)v8 + 3) + 40))(*((void *)v8 + 3), *(char *)v111);
              if (SHIBYTE(v127) >= 0) {
                v113 = v126;
              }
              else {
                v113 = (void **)v126[0];
              }
              *(unsigned char *)v113 = v112;
            }
            *(_OWORD *)int v136 = *(_OWORD *)v128;
            *(void *)&v136[16] = v129;
            v128[0] = 0;
            v128[1] = 0;
            uint64_t v129 = 0;
            long long v137 = *(_OWORD *)v126;
            v138 = v127;
            v126[0] = 0;
            v126[1] = 0;
            v127 = 0;
            unint64_t v114 = *((void *)v8 + 12);
            if (v114 >= *((void *)v8 + 13))
            {
              v120 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(v123, (uint64_t)v136);
              int v121 = SHIBYTE(v138);
              *((void *)v8 + 12) = v120;
              if (v121 < 0) {
                operator delete((void *)v137);
              }
            }
            else
            {
              long long v115 = *(_OWORD *)v136;
              *(void *)(v114 + 16) = *(void *)&v136[16];
              *(_OWORD *)unint64_t v114 = v115;
              memset(v136, 0, sizeof(v136));
              unint64_t v116 = v138;
              *(_OWORD *)(v114 + 24) = v137;
              *(void *)(v114 + 40) = v116;
              *((void *)v8 + 12) = v114 + 48;
            }
            if ((v136[23] & 0x80000000) == 0) {
              goto LABEL_275;
            }
            v119 = *(void **)v136;
          }
          operator delete(v119);
          goto LABEL_275;
        }
      }
LABEL_131:
      if (SHIBYTE(v133) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            uint64_t v69 = (void **)__p[0];
LABEL_138:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v69);
LABEL_159:
            char v77 = 1;
            unint64_t v71 = v12;
            if ((SHIBYTE(v133) & 0x80000000) == 0) {
              goto LABEL_160;
            }
            goto LABEL_188;
          }
          uint64_t v69 = (void **)__p[0];
LABEL_158:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v69, *((char *)v69 + 1));
          goto LABEL_159;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v133))
      {
        uint64_t v69 = __p;
        if (HIBYTE(v133) == 1) {
          goto LABEL_138;
        }
        goto LABEL_158;
      }
LABEL_14:
      uint64_t v7 = (uint64_t)v12;
LABEL_15:
      if (v10 == (std::basic_regex<char>::value_type *)v7)
      {
        if (v10 != a3)
        {
          if (*v10 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
            ++v10;
          }
          if (v10 != a3 && *v10 == 93) {
            return v10 + 1;
          }
        }
LABEL_295:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
    do
    {
LABEL_46:
      if (a3 - 4 == v28) {
        goto LABEL_294;
      }
      ++v28;
      long long v29 = v30;
      int v31 = *v30++;
    }
    while (v31 != 46);
    goto LABEL_48;
  }
  return a2;
}

void sub_21DE0C6B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE0C8B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE0C9F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  long long v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  std::basic_regex<char>::value_type v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || (char)v4[1] < 65) {
        goto LABEL_85;
      }
      unsigned int v8 = v4[1];
      if (v8 >= 0x5B && (v8 - 97) > 0x19u) {
        goto LABEL_85;
      }
      std::basic_regex<char>::value_type v10 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v10;
        *((unsigned char *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v10);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        int v11 = v4[1];
        if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            int v12 = *v4;
            if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38 || (v12 | 0x20u) - 97 < 6) {
              goto LABEL_42;
            }
          }
        }
      }
      goto LABEL_85;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char>::value_type v6 = 11;
LABEL_68:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_42:
      if (v4 + 1 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v13 = v4[1];
      char v14 = -48;
      if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38) {
        goto LABEL_47;
      }
      v13 |= 0x20u;
      if ((v13 - 97) >= 6u) {
        goto LABEL_85;
      }
      char v14 = -87;
LABEL_47:
      if (v4 + 2 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v15 = v4[2];
      char v16 = -48;
      if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
      {
        v15 |= 0x20u;
        if ((v15 - 97) >= 6u) {
LABEL_85:
        }
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        char v16 = -87;
      }
      std::basic_regex<char>::value_type v17 = v15 + 16 * (v13 + v14) + v16;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v17;
      *((unsigned char *)a4 + 1) = 0;
      uint64_t result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0) {
        goto LABEL_85;
      }
      if (!a4) {
        goto LABEL_68;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2 = __c;
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    unsigned int v8 = (char *)operator new(0x30uLL);
    first = this->__end_->__first_;
    *(void *)unsigned int v8 = &unk_26CEBD778;
    *((void *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    unsigned int v8 = (char *)operator new(0x30uLL);
    std::basic_regex<char>::value_type v10 = this->__end_->__first_;
    *(void *)unsigned int v8 = &unk_26CEBD7C0;
    *((void *)v8 + 1) = v10;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  uint64_t v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  uint64_t v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_26CEBD808;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_21DE0D150(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  long long v4 = v1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE0D1FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if (flags)
  {
    unsigned int v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    std::basic_regex<char>::value_type v10 = (std::locale::__imp *)&unk_26CEBD850;
LABEL_6:
    v8->__locale_ = v10;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    unsigned int v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    v8[1].__locale_ = (std::locale::__imp *)this->__end_->__first_;
    std::basic_regex<char>::value_type v10 = (std::locale::__imp *)&unk_26CEBD898;
    goto LABEL_6;
  }
  uint64_t v5 = (std::__node<char> *)operator new(0x18uLL);
  std::vector<std::csub_match>::pointer end = this->__end_;
  first = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_26CEBD8E0;
  v5[1].__vftable = (std::__node<char>_vtbl *)first;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD778;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD778;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    *(void *)(a2 + 80) = *(void *)(v4 + 8);
  }
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD7C0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD7C0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD850;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD850;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (!*(unsigned char *)(v3 + 16)
    || (uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3, v5 = *(void *)(a2 + 16), *(void *)(a2 + 24) - v5 < v4))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  uint64_t v6 = result;
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)v3 + v7));
      uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)(a2 + 16) + v7));
      if (v8 != result) {
        goto LABEL_3;
      }
      if (v4 == ++v7)
      {
        uint64_t v5 = *(void *)(a2 + 16);
        break;
      }
    }
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v5 + v4;
  *(void *)(a2 + 80) = *(void *)(v6 + 8);
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD898;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26CEBD898;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete(a1);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (!*(unsigned char *)(v3 + 24 * v2 + 16)
    || (uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2),
        uint64_t v5 = *v4,
        uint64_t v6 = v4[1] - *v4,
        uint64_t v7 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v7 < v6))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  if (v6 >= 1)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(unsigned __int8 **)(a2 + 16);
    do
    {
      int v11 = *v5++;
      int v10 = v11;
      int v12 = *v9++;
      if (v10 != v12) {
        goto LABEL_3;
      }
    }
    while (--v8);
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v7 + v6;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unsigned int v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    *(void *)(a2 + 80) = *((void *)v6 + 1);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = *(unsigned char **)(a1 + 40);
      unint64_t v7 = v5 - v6;
      uint64_t v8 = v5 - v6 + 1;
      if (v8 >= 0)
      {
        unint64_t v9 = v4 - (void)v6;
        if (2 * v9 > v8) {
          uint64_t v8 = 2 * v9;
        }
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v10 = v8;
        }
        if (v10)
        {
          int v11 = operator new(v10);
          int v12 = &v11[v7];
          unsigned __int8 v13 = &v11[v10];
          v11[v7] = v2;
          uint64_t v14 = (uint64_t)&v11[v7 + 1];
          if (v5 == v6) {
            goto LABEL_49;
          }
        }
        else
        {
          int v11 = 0;
          int v12 = (char *)(v5 - v6);
          unsigned __int8 v13 = 0;
          *(unsigned char *)unint64_t v7 = v2;
          uint64_t v14 = v7 + 1;
          if (v5 == v6) {
            goto LABEL_49;
          }
        }
        if (v7 < 8 || (unint64_t)(v6 - v11) < 0x20) {
          goto LABEL_76;
        }
        if (v7 < 0x20)
        {
          unint64_t v21 = 0;
          goto LABEL_55;
        }
        unint64_t v21 = v7 & 0xFFFFFFFFFFFFFFE0;
        long long v29 = (long long *)(v5 - 16);
        int v30 = &v11[v5 - 16 - v6];
        unint64_t v31 = v7 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v32 = *v29;
          *(v30 - 1) = *(v29 - 1);
          *int v30 = v32;
          v30 -= 2;
          v29 -= 2;
          v31 -= 32;
        }
        while (v31);
        if (v7 != v21)
        {
          if ((v7 & 0x18) == 0)
          {
            v12 -= v21;
            v5 -= v21;
            goto LABEL_76;
          }
LABEL_55:
          v12 -= v7 & 0xFFFFFFFFFFFFFFF8;
          int v33 = &v5[-v21 - 8];
          int v34 = &v11[v33 - v6];
          unint64_t v35 = v21 - (v7 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v36 = *(void *)v33;
            v33 -= 8;
            *v34-- = v36;
            v35 += 8;
          }
          while (v35);
          v5 -= v7 & 0xFFFFFFFFFFFFFFF8;
          if (v7 == (v7 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_86;
          }
LABEL_76:
          char v53 = v12 - 1;
          do
          {
            char v54 = *--v5;
            *v53-- = v54;
          }
          while (v5 != v6);
        }
LABEL_86:
        unsigned int v5 = *(unsigned char **)(a1 + 40);
        *(void *)(a1 + 40) = v11;
        *(void *)(a1 + 48) = v14;
        *(void *)(a1 + 56) = v13;
        if (!v5) {
          goto LABEL_50;
        }
        goto LABEL_87;
      }
LABEL_88:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
LABEL_24:
    *unsigned int v5 = v2;
    *(void *)(a1 + 48) = v5 + 1;
    return;
  }
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v15 = *(void *)(a1 + 56);
  if (*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 < v15) {
      goto LABEL_24;
    }
    char v16 = *(unsigned char **)(a1 + 40);
    unint64_t v17 = v5 - v16;
    uint64_t v18 = v5 - v16 + 1;
    if (v18 < 0) {
      goto LABEL_88;
    }
    unint64_t v19 = v15 - (void)v16;
    if (2 * v19 > v18) {
      uint64_t v18 = 2 * v19;
    }
    if (v19 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v20 = v18;
    }
    if (v20)
    {
      int v11 = operator new(v20);
      int v12 = &v11[v17];
      unsigned __int8 v13 = &v11[v20];
      v11[v17] = v2;
      uint64_t v14 = (uint64_t)&v11[v17 + 1];
      if (v5 == v16) {
        goto LABEL_49;
      }
    }
    else
    {
      int v11 = 0;
      int v12 = (char *)(v5 - v16);
      unsigned __int8 v13 = 0;
      *(unsigned char *)unint64_t v17 = a2;
      uint64_t v14 = v17 + 1;
      if (v5 == v16) {
        goto LABEL_49;
      }
    }
    if (v17 >= 8 && (unint64_t)(v16 - v11) >= 0x20)
    {
      if (v17 >= 0x20)
      {
        unint64_t v27 = v17 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v37 = (long long *)(v5 - 16);
        uint64_t v38 = &v11[v5 - 16 - v16];
        unint64_t v39 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v40 = *v37;
          *(v38 - 1) = *(v37 - 1);
          _OWORD *v38 = v40;
          v38 -= 2;
          v37 -= 2;
          v39 -= 32;
        }
        while (v39);
        if (v17 == v27) {
          goto LABEL_86;
        }
        if ((v17 & 0x18) == 0)
        {
          v12 -= v27;
          v5 -= v27;
          goto LABEL_80;
        }
      }
      else
      {
        unint64_t v27 = 0;
      }
      v12 -= v17 & 0xFFFFFFFFFFFFFFF8;
      unint64_t v41 = &v5[-v27 - 8];
      unsigned int v42 = &v11[v41 - v16];
      unint64_t v43 = v27 - (v17 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v44 = *(void *)v41;
        v41 -= 8;
        *v42-- = v44;
        v43 += 8;
      }
      while (v43);
      v5 -= v17 & 0xFFFFFFFFFFFFFFF8;
      if (v17 == (v17 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_86;
      }
    }
LABEL_80:
    unint64_t v55 = v12 - 1;
    do
    {
      char v56 = *--v5;
      *v55-- = v56;
    }
    while (v5 != v16);
    goto LABEL_86;
  }
  if ((unint64_t)v5 < v15) {
    goto LABEL_24;
  }
  uint64_t v22 = *(unsigned char **)(a1 + 40);
  unint64_t v23 = v5 - v22;
  uint64_t v24 = v5 - v22 + 1;
  if (v24 < 0) {
    goto LABEL_88;
  }
  unint64_t v25 = v15 - (void)v22;
  if (2 * v25 > v24) {
    uint64_t v24 = 2 * v25;
  }
  if (v25 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v26 = v24;
  }
  if (!v26)
  {
    int v11 = 0;
    int v12 = (char *)(v5 - v22);
    unsigned __int8 v13 = 0;
    *(unsigned char *)unint64_t v23 = a2;
    uint64_t v14 = v23 + 1;
    if (v5 == v22) {
      goto LABEL_49;
    }
LABEL_45:
    if (v23 < 8 || (unint64_t)(v22 - v11) < 0x20) {
      goto LABEL_84;
    }
    if (v23 >= 0x20)
    {
      unint64_t v28 = v23 & 0xFFFFFFFFFFFFFFE0;
      unint64_t v45 = (long long *)(v5 - 16);
      int v46 = &v11[v5 - 16 - v22];
      unint64_t v47 = v23 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        long long v48 = *v45;
        *(v46 - 1) = *(v45 - 1);
        _OWORD *v46 = v48;
        v46 -= 2;
        v45 -= 2;
        v47 -= 32;
      }
      while (v47);
      if (v23 == v28) {
        goto LABEL_86;
      }
      if ((v23 & 0x18) == 0)
      {
        v12 -= v28;
        v5 -= v28;
        goto LABEL_84;
      }
    }
    else
    {
      unint64_t v28 = 0;
    }
    v12 -= v23 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v49 = &v5[-v28 - 8];
    uint64_t v50 = &v11[v49 - v22];
    unint64_t v51 = v28 - (v23 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v52 = *(void *)v49;
      v49 -= 8;
      *v50-- = v52;
      v51 += 8;
    }
    while (v51);
    v5 -= v23 & 0xFFFFFFFFFFFFFFF8;
    if (v23 == (v23 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_86;
    }
LABEL_84:
    char v57 = v12 - 1;
    do
    {
      char v58 = *--v5;
      *v57-- = v58;
    }
    while (v5 != v22);
    goto LABEL_86;
  }
  int v11 = operator new(v26);
  int v12 = &v11[v23];
  unsigned __int8 v13 = &v11[v26];
  v11[v23] = v2;
  uint64_t v14 = (uint64_t)&v11[v23 + 1];
  if (v5 != v22) {
    goto LABEL_45;
  }
LABEL_49:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v13;
  if (!v5)
  {
LABEL_50:
    *(void *)(a1 + 48) = v14;
    return;
  }
LABEL_87:
  operator delete(v5);
  *(void *)(a1 + 48) = v14;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)(a1 + 8) = a3;
  int v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v16, v11);
  std::locale::name(&v17, &v16);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    unsigned __int8 v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unsigned __int8 v13 = &v17;
    }
    BOOL v14 = v13->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
LABEL_9:
    }
      operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v16);
  *(unsigned char *)(a1 + 171) = v14;
  return a1;
}

void sub_21DE0E32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v9 + 136));
  unint64_t v15 = *(void **)(v9 + 112);
  if (v15)
  {
    *(void *)(v9 + 120) = v15;
    operator delete(v15);
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16)
    {
LABEL_3:
      std::string v17 = *v13;
      if (!*v13) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16) {
      goto LABEL_3;
    }
  }
  *(void *)(v9 + 72) = v16;
  operator delete(v16);
  std::string v17 = *v13;
  if (!*v13)
  {
LABEL_4:
    std::locale::~locale(v11);
    *(void *)uint64_t v9 = v10;
    uint64_t v18 = *(void *)(v9 + 8);
    if (!v18) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  *(void *)(v9 + 48) = v17;
  operator delete(v17);
  std::locale::~locale(v11);
  *(void *)uint64_t v9 = v10;
  uint64_t v18 = *(void *)(v9 + 8);
  if (!v18) {
LABEL_5:
  }
    _Unwind_Resume(a1);
LABEL_9:
  (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  _Unwind_Resume(a1);
}

void **std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](void **a1)
{
  char v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    unint64_t v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0) {
LABEL_9:
        }
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        unint64_t v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  uint64_t v1 = std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);

  operator delete(v1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  char v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v11 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_264;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_42;
  }
  char v6 = *current;
  LOBYTE(__src) = *current;
  char v7 = current[1];
  HIBYTE(__src) = v7;
  if (this->__icase_)
  {
    LOBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  std::__get_collation_name(&v141, (const char *)&__s);
  std::string __p = v141;
  std::string::size_type size = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  int v9 = SHIBYTE(v141.__r_.__value_.__r.__words[2]);
  if ((v141.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v141.__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v10 = (void *)__s.__r_.__value_.__r.__words[0];
    if (__s.__r_.__value_.__l.__size_ >= 3)
    {
LABEL_11:
      operator delete(v10);
      goto LABEL_15;
    }
    goto LABEL_168;
  }
  if (HIBYTE(__s.__r_.__value_.__r.__words[2]) < 3u)
  {
LABEL_168:
    (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v141);
    if (v9 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v141;
    if (SHIBYTE(v141.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
      {
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_s = &__s;
        }
        else {
          p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
        }
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          size_t v92 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t v92 = __s.__r_.__value_.__l.__size_;
        }
        std::string::__assign_no_alias<false>((void **)&__p.__r_.__value_.__l.__data_, p_s, v92);
      }
      else
      {
        *__p.__r_.__value_.__l.__data_ = 0;
        __p.__r_.__value_.__l.__size_ = 0;
      }
    }
    else if (HIBYTE(v141.__r_.__value_.__r.__words[2]) == 1 || HIBYTE(v141.__r_.__value_.__r.__words[2]) == 12)
    {
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__assign_no_alias<true>(&__p, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = __s;
      }
    }
    else
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
    }
LABEL_9:
    if ((SHIBYTE(__s.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)__s.__r_.__value_.__r.__words[0];
    goto LABEL_11;
  }
LABEL_15:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v29 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v29) {
      goto LABEL_17;
    }
LABEL_42:
    BOOL negate = 0;
    uint64_t v11 = 1;
    unsigned __int8 v30 = *v2->__current_;
    __p.__r_.__value_.__s.__data_[0] = v30;
    if (!this->__icase_) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
    goto LABEL_42;
  }
LABEL_17:
  std::vector<std::pair<char, char>>::pointer begin = this->__digraphs_.__begin_;
  uint64_t v14 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v14)
  {
    uint64_t v15 = v14 >> 1;
    if ((unint64_t)(v14 >> 1) <= 1) {
      uint64_t v15 = 1;
    }
    p_second = &begin->second;
    while (__src != *(p_second - 1) || HIBYTE(__src) != *p_second)
    {
      p_second += 2;
      if (!--v15) {
        goto LABEL_26;
      }
    }
    goto LABEL_261;
  }
LABEL_26:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
    goto LABEL_199;
  }
  memset(&v141, 170, sizeof(v141));
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v141);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v18 = this->__ranges_.__begin_;
  char v19 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  int64_t v20 = (char *)this->__ranges_.__end_ - (char *)v18;
  if (!v20)
  {
    BOOL v28 = 0;
    int v71 = 0;
    BOOL negate = 0;
    goto LABEL_196;
  }
  v131 = v2;
  uint64_t v21 = 0;
  unint64_t v22 = v20 / 48;
  if ((v141.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v23 = &v141;
  }
  else {
    unint64_t v23 = (std::string *)v141.__r_.__value_.__r.__words[0];
  }
  char v24 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  if ((v141.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v25 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v25 = v141.__r_.__value_.__l.__size_;
  }
  if (v22 <= 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v20 / 48;
  }
  unint64_t v27 = (unsigned __int8 *)&v18->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v28 = 1;
  do
  {
    int v61 = (char)*(v27 - 24);
    if (v61 >= 0) {
      unint64_t v62 = (char *)(v27 - 47);
    }
    else {
      unint64_t v62 = *(char **)(v27 - 47);
    }
    if (v61 >= 0) {
      size_t v63 = *(v27 - 24);
    }
    else {
      size_t v63 = *(void *)(v27 - 39);
    }
    if (v25 >= v63) {
      size_t v64 = v63;
    }
    else {
      size_t v64 = v25;
    }
    int v65 = memcmp(v62, v23, v64);
    if (v65)
    {
      if ((v65 & 0x80000000) == 0) {
        goto LABEL_106;
      }
    }
    else if (v63 > v25)
    {
      goto LABEL_106;
    }
    int v66 = (char)*v27;
    if (v66 >= 0) {
      long long v67 = (char *)(v27 - 23);
    }
    else {
      long long v67 = *(char **)(v27 - 23);
    }
    if (v66 >= 0) {
      size_t v68 = *v27;
    }
    else {
      size_t v68 = *(void *)(v27 - 15);
    }
    if (v68 >= v25) {
      size_t v69 = v25;
    }
    else {
      size_t v69 = v68;
    }
    int v70 = memcmp(v23, v67, v69);
    if (v70)
    {
      if (v70 < 0)
      {
LABEL_131:
        BOOL negate = 1;
        int v71 = 5;
        goto LABEL_185;
      }
    }
    else if (v25 <= v68)
    {
      goto LABEL_131;
    }
LABEL_106:
    BOOL v28 = ++v21 < v22;
    v27 += 48;
  }
  while (v26 != v21);
  int v71 = 0;
  BOOL negate = 0;
LABEL_185:
  char v2 = v131;
  char v19 = v24;
LABEL_196:
  if (v19 < 0) {
    operator delete(v141.__r_.__value_.__l.__data_);
  }
  if (v28) {
    goto LABEL_240;
  }
LABEL_199:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_243;
  }
  uint64_t v93 = v2;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__src, &v141);
  std::vector<std::string>::pointer v94 = this->__equivalences_.__begin_;
  int v95 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
  int64_t v96 = (char *)this->__equivalences_.__end_ - (char *)v94;
  if (!v96)
  {
    BOOL v102 = 0;
    int v71 = 0;
    char v2 = v93;
    goto LABEL_237;
  }
  BOOL v138 = negate;
  unint64_t v97 = v96 / 24;
  size_t v98 = __s.__r_.__value_.__l.__size_;
  std::string::size_type v99 = (__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
      ? HIBYTE(__s.__r_.__value_.__r.__words[2])
      : __s.__r_.__value_.__l.__size_;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    int v136 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
    uint64_t v108 = 0;
    char v109 = (const void *)__s.__r_.__value_.__r.__words[0];
    uint64_t v110 = v97 <= 1 ? 1 : v96 / 24;
    BOOL v102 = 1;
    do
    {
      std::string::size_type v111 = HIBYTE(v94->__r_.__value_.__r.__words[2]);
      int v112 = (char)v111;
      if ((v111 & 0x80u) != 0) {
        std::string::size_type v111 = v94->__r_.__value_.__l.__size_;
      }
      if (v99 == v111)
      {
        std::vector<std::string>::pointer v113 = v112 >= 0 ? v94 : (std::vector<std::string>::pointer)v94->__r_.__value_.__r.__words[0];
        if (!memcmp(v109, v113, v98))
        {
          BOOL negate = 1;
          int v71 = 5;
          char v2 = v93;
          goto LABEL_236;
        }
      }
      BOOL v102 = ++v108 < v97;
      ++v94;
    }
    while (v110 != v108);
    int v71 = 0;
    char v2 = v93;
    BOOL negate = v138;
LABEL_236:
    int v95 = v136;
  }
  else
  {
    if (*((unsigned char *)&__s.__r_.__value_.__s + 23))
    {
      uint64_t v100 = 0;
      if (v97 <= 1) {
        uint64_t v101 = 1;
      }
      else {
        uint64_t v101 = v96 / 24;
      }
      BOOL v102 = 1;
      do
      {
        unint64_t v103 = &v94[v100];
        std::string::size_type v104 = HIBYTE(v103->__r_.__value_.__r.__words[2]);
        int v105 = (char)v104;
        if ((v104 & 0x80u) != 0) {
          std::string::size_type v104 = v103->__r_.__value_.__l.__size_;
        }
        if (v99 == v104)
        {
          if (v105 < 0) {
            unint64_t v103 = (std::string *)v103->__r_.__value_.__r.__words[0];
          }
          char v106 = &__s;
          uint64_t v107 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
          while (v106->__r_.__value_.__s.__data_[0] == v103->__r_.__value_.__s.__data_[0])
          {
            char v106 = (std::string *)((char *)v106 + 1);
            unint64_t v103 = (std::string *)((char *)v103 + 1);
            if (!--v107)
            {
              BOOL negate = 1;
              int v71 = 5;
              char v2 = v93;
              goto LABEL_237;
            }
          }
        }
        BOOL v102 = ++v100 < v97;
      }
      while (v100 != v101);
      BOOL v102 = 0;
      int v71 = 0;
      char v2 = v93;
      BOOL negate = v138;
      goto LABEL_237;
    }
    std::string::size_type v121 = HIBYTE(v94->__r_.__value_.__r.__words[2]);
    if ((v121 & 0x80u) != 0) {
      std::string::size_type v121 = v94->__r_.__value_.__l.__size_;
    }
    if (v121 == HIBYTE(__s.__r_.__value_.__r.__words[2]))
    {
      BOOL negate = 1;
      char v2 = v93;
      goto LABEL_263;
    }
    unint64_t v122 = 0;
    uint64_t v123 = v97 <= 1 ? 1 : v97;
    uint64_t v124 = v123 - 1;
    uint64_t v125 = &v94[1].__r_.__value_.__s.__data_[8];
    char v2 = v93;
    while (v124 != v122)
    {
      ++v122;
      uint64_t v126 = v125[15];
      uint64_t v128 = *(void *)v125;
      v125 += 24;
      uint64_t v127 = v128;
      if ((v126 & 0x80u) != 0) {
        uint64_t v126 = v127;
      }
      if (v99 == v126)
      {
        BOOL v102 = v122 < v97;
        BOOL negate = 1;
        int v71 = 5;
        goto LABEL_237;
      }
    }
    BOOL v102 = 0;
    int v71 = 0;
    BOOL negate = v138;
  }
LABEL_237:
  if (v95 < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  if (!v102)
  {
LABEL_243:
    if ((char)__src < 0)
    {
      neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
    }
    else
    {
      std::regex_traits<char>::char_class_type mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      std::ctype_base::mask v116 = tab[__src];
      if (((v116 & mask) != 0 || __src == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((tab[HIBYTE(__src)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_261;
      }
      neg_std::regex_traits<char>::char_class_type mask = this->__neg_mask_;
      if ((neg_mask & v116) != 0 || __src == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_260:
        int v118 = negate;
LABEL_262:
        BOOL negate = v118;
        goto LABEL_263;
      }
    }
    if ((SHIBYTE(__src) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(__src)] & neg_mask) == 0)
      {
        int v118 = 1;
        if (HIBYTE(__src) != 95 || (neg_mask & 0x80) == 0) {
          goto LABEL_262;
        }
      }
      goto LABEL_260;
    }
LABEL_261:
    int v118 = 1;
    goto LABEL_262;
  }
LABEL_240:
  if (v71)
  {
LABEL_263:
    uint64_t v11 = 2;
    goto LABEL_264;
  }
  uint64_t v11 = 2;
  unsigned __int8 v30 = *v2->__current_;
  __p.__r_.__value_.__s.__data_[0] = v30;
  if (this->__icase_)
  {
LABEL_43:
    unsigned __int8 v30 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v30);
    __p.__r_.__value_.__s.__data_[0] = v30;
  }
LABEL_44:
  std::vector<char>::pointer v31 = this->__chars_.__begin_;
  unint64_t v32 = this->__chars_.__end_ - v31;
  if (v32)
  {
    if (v32 <= 1) {
      unint64_t v32 = 1;
    }
    while (1)
    {
      int v33 = *v31++;
      if (v33 == v30) {
        break;
      }
      if (!--v32) {
        goto LABEL_49;
      }
    }
LABEL_183:
    BOOL negate = 1;
    goto LABEL_264;
  }
LABEL_49:
  std::regex_traits<char>::char_class_type v34 = this->__neg_mask_;
  if (v34 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v30 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v30] & v34) == 0)
    {
      int v36 = (v34 >> 7) & 1;
      char v35 = v30 == 95 ? v36 : 0;
    }
    else
    {
      char v35 = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v38 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v30, end - this->__neg_chars_.__begin_);
    unint64_t v39 = v38 ? v38 : end;
    if ((v35 & 1) == 0 && v39 == end) {
      goto LABEL_183;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v40 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v41 = this->__ranges_.__end_;
  if (v40 == v41) {
    goto LABEL_136;
  }
  memset(&v141, 170, sizeof(v141));
  BOOL v137 = negate;
  if (!this->__collate_)
  {
    unsigned int v42 = 1;
    *((unsigned char *)&v141.__r_.__value_.__s + 23) = 1;
    LOWORD(v141.__r_.__value_.__l.__data_) = v30;
    int64_t v43 = (char *)v41 - (char *)v40;
    if (v43) {
      goto LABEL_67;
    }
LABEL_163:
    BOOL v50 = 0;
    if ((v42 & 0x80) != 0) {
      goto LABEL_134;
    }
    goto LABEL_135;
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x1AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAA00AALL;
  __s.__r_.__value_.__s.__data_[0] = v30;
  (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v141);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  std::vector<std::pair<std::string, std::string>>::pointer v40 = this->__ranges_.__begin_;
  unsigned int v42 = HIBYTE(v141.__r_.__value_.__r.__words[2]);
  int64_t v43 = (char *)this->__ranges_.__end_ - (char *)v40;
  if (!v43) {
    goto LABEL_163;
  }
LABEL_67:
  v132 = v2;
  uint64_t v134 = v11;
  uint64_t v44 = 0;
  unint64_t v45 = v43 / 48;
  char v129 = v42;
  if ((v42 & 0x80u) == 0) {
    int v46 = &v141;
  }
  else {
    int v46 = (std::string *)v141.__r_.__value_.__r.__words[0];
  }
  if ((v42 & 0x80u) == 0) {
    std::string::size_type v47 = v42;
  }
  else {
    std::string::size_type v47 = v141.__r_.__value_.__l.__size_;
  }
  if (v45 <= 1) {
    uint64_t v48 = 1;
  }
  else {
    uint64_t v48 = v43 / 48;
  }
  uint64_t v49 = (unsigned __int8 *)&v40->second.__r_.__value_.__r.__words[2] + 7;
  BOOL v50 = 1;
  while (2)
  {
    int v51 = (char)*(v49 - 24);
    if (v51 >= 0) {
      uint64_t v52 = (char *)(v49 - 47);
    }
    else {
      uint64_t v52 = *(char **)(v49 - 47);
    }
    if (v51 >= 0) {
      size_t v53 = *(v49 - 24);
    }
    else {
      size_t v53 = *(void *)(v49 - 39);
    }
    if (v47 >= v53) {
      size_t v54 = v53;
    }
    else {
      size_t v54 = v47;
    }
    int v55 = memcmp(v52, v46, v54);
    if (v55)
    {
      if (v55 < 0) {
        goto LABEL_92;
      }
    }
    else if (v53 <= v47)
    {
LABEL_92:
      int v56 = (char)*v49;
      if (v56 >= 0) {
        char v57 = (char *)(v49 - 23);
      }
      else {
        char v57 = *(char **)(v49 - 23);
      }
      if (v56 >= 0) {
        size_t v58 = *v49;
      }
      else {
        size_t v58 = *(void *)(v49 - 15);
      }
      if (v58 >= v47) {
        size_t v59 = v47;
      }
      else {
        size_t v59 = v58;
      }
      int v60 = memcmp(v46, v57, v59);
      if (v60)
      {
        if (v60 < 0)
        {
LABEL_103:
          BOOL negate = 1;
          char v2 = v132;
          uint64_t v11 = v134;
          if ((v129 & 0x80) == 0) {
            goto LABEL_135;
          }
          goto LABEL_134;
        }
      }
      else if (v47 <= v58)
      {
        goto LABEL_103;
      }
    }
    BOOL v50 = ++v44 < v45;
    v49 += 48;
    if (v48 != v44) {
      continue;
    }
    break;
  }
  char v2 = v132;
  uint64_t v11 = v134;
  BOOL negate = v137;
  if ((v129 & 0x80) == 0) {
    goto LABEL_135;
  }
LABEL_134:
  operator delete(v141.__r_.__value_.__l.__data_);
LABEL_135:
  if (v50) {
    goto LABEL_264;
  }
LABEL_136:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_178:
    if ((v30 & 0x80) != 0) {
      goto LABEL_264;
    }
    std::regex_traits<char>::char_class_type v89 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v30] & v89) == 0)
    {
      int v90 = (v89 >> 7) & 1;
      if (v30 != 95) {
        int v90 = 0;
      }
      if (v90 != 1) {
        goto LABEL_264;
      }
    }
    goto LABEL_183;
  }
  uint64_t v135 = v11;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__p, &__p.__r_.__value_.__s.__data_[1]);
  std::vector<std::string>::pointer v72 = this->__equivalences_.__begin_;
  uint64_t v73 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  int64_t v74 = (char *)this->__equivalences_.__end_ - (char *)v72;
  if (!v74)
  {
    if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
LABEL_177:
    unsigned __int8 v30 = __p.__r_.__value_.__s.__data_[0];
    goto LABEL_178;
  }
  unint64_t v133 = v2;
  unint64_t v75 = 0;
  unint64_t v76 = v74 / 24;
  size_t v78 = __s.__r_.__value_.__l.__size_;
  char v77 = (const void *)__s.__r_.__value_.__r.__words[0];
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v79 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v79 = __s.__r_.__value_.__l.__size_;
  }
  if (v76 <= 1) {
    uint64_t v80 = 1;
  }
  else {
    uint64_t v80 = v74 / 24;
  }
  BOOL v81 = 1;
  while (2)
  {
    unint64_t v82 = &v72[v75];
    std::string::size_type v83 = HIBYTE(v82->__r_.__value_.__r.__words[2]);
    int v84 = (char)v83;
    if ((v83 & 0x80u) != 0) {
      std::string::size_type v83 = v82->__r_.__value_.__l.__size_;
    }
    if (v79 != v83)
    {
LABEL_157:
      if (++v75 == v80)
      {
        if ((v73 & 0x80) != 0) {
LABEL_275:
        }
          operator delete(__s.__r_.__value_.__l.__data_);
        char v2 = v133;
        uint64_t v11 = v135;
        goto LABEL_177;
      }
      goto LABEL_161;
    }
    if (v84 >= 0) {
      BOOL v85 = &v72[v75];
    }
    else {
      BOOL v85 = (std::string *)v82->__r_.__value_.__r.__words[0];
    }
    if ((v73 & 0x80) == 0)
    {
      if (!v73)
      {
LABEL_165:
        BOOL negate = 1;
        char v2 = v133;
        uint64_t v11 = v135;
        if (!v81) {
          goto LABEL_177;
        }
        goto LABEL_264;
      }
      uint64_t v86 = 0;
      while (__s.__r_.__value_.__s.__data_[v86] == v85->__r_.__value_.__s.__data_[v86])
      {
        if (v73 == ++v86) {
          goto LABEL_165;
        }
      }
      goto LABEL_157;
    }
    BOOL v130 = v81;
    unint64_t v87 = v77;
    size_t v88 = v78;
    if (memcmp(v77, v85, v78))
    {
      ++v75;
      size_t v78 = v88;
      char v77 = v87;
      if (v75 == v80) {
        goto LABEL_275;
      }
LABEL_161:
      BOOL v81 = v75 < v76;
      continue;
    }
    break;
  }
  operator delete(__s.__r_.__value_.__l.__data_);
  BOOL negate = 1;
  char v2 = v133;
  uint64_t v11 = v135;
  if (!v130) {
    goto LABEL_177;
  }
LABEL_264:
  if (negate == this->__negate_)
  {
    first = 0;
    int v120 = -993;
  }
  else
  {
    v2->__current_ += v11;
    first = this->__first_;
    int v120 = -995;
  }
  v2->__do_ = v120;
  v2->__node_ = first;
}

void sub_21DE0F138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0)
  {
    operator delete(__p);
    if (a28 < 0)
    {
LABEL_5:
      operator delete(a23);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  locale = a1[17].__locale_;
  if (locale)
  {
    uint64_t v3 = a1[18].__locale_;
    unint64_t v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*((void **)v3 - 3));
        }
        uint64_t v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      unint64_t v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  unsigned int v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  char v6 = a1[11].__locale_;
  if (v6)
  {
    char v7 = a1[12].__locale_;
    uint64_t v8 = a1[11].__locale_;
    if (v7 == v6)
    {
LABEL_21:
      a1[12].__locale_ = v6;
      operator delete(v8);
      goto LABEL_22;
    }
    while (1)
    {
      if (*((char *)v7 - 1) < 0)
      {
        operator delete(*((void **)v7 - 3));
        if (*((char *)v7 - 25) < 0) {
LABEL_19:
        }
          operator delete(*((void **)v7 - 6));
      }
      else if (*((char *)v7 - 25) < 0)
      {
        goto LABEL_19;
      }
      char v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        uint64_t v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  int v9 = a1[8].__locale_;
  if (v9)
  {
    a1[9].__locale_ = v9;
    operator delete(v9);
  }
  uint64_t v10 = a1[5].__locale_;
  if (v10)
  {
    a1[6].__locale_ = v10;
    operator delete(v10);
  }
  std::locale::~locale(a1 + 2);
  uint64_t v11 = a1[1].__locale_;
  if (v11) {
    (*(void (**)(std::locale::__imp *))(*(void *)v11 + 8))(v11);
  }
  return a1;
}

void std::regex_traits<char>::__transform_primary<char *>(void *a1, uint64_t a2, unsigned char *__src, unsigned char *a4)
{
  size_t v4 = a4 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a4 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a4 - (_BYTE)__src;
    int v9 = __dst;
    if (__src == a4) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v4);
    int v9 = (void **)((char *)v9 + v4);
    goto LABEL_9;
  }
  uint64_t v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v10 = v4 | 7;
  }
  uint64_t v11 = v10 + 1;
  int v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v4;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a4) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)int v9 = 0;
  memset(a1, 170, 24);
  int v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unsigned __int8 v13 = __dst;
  }
  else {
    unsigned __int8 v13 = (void **)__dst[0];
  }
  if (SHIBYTE(__dst[2]) < 0) {
    int v12 = (char *)__dst[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v13, &v12[(void)v13]);
  uint64_t v14 = *((unsigned __int8 *)a1 + 23);
  int v15 = (char)v14;
  if ((v14 & 0x80u) != 0) {
    uint64_t v14 = a1[1];
  }
  if (v14 == 1)
  {
LABEL_25:
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_26;
  }
  if (v14 == 12)
  {
    if (v15 >= 0) {
      std::locale v16 = a1;
    }
    else {
      std::locale v16 = (unsigned char *)*a1;
    }
    v16[11] = v16[3];
    if (SHIBYTE(__dst[2]) < 0) {
      goto LABEL_26;
    }
    return;
  }
  if ((v15 & 0x80000000) == 0)
  {
    *(unsigned char *)a1 = 0;
    *((unsigned char *)a1 + 23) = 0;
    goto LABEL_25;
  }
  *(unsigned char *)*a1 = 0;
  a1[1] = 0;
  if (SHIBYTE(__dst[2]) < 0) {
LABEL_26:
  }
    operator delete(__dst[0]);
}

void sub_21DE0F524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE0F584(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  switch(*a2)
  {
    case 'D':
      int v7 = *(_DWORD *)(a5 + 164) | 0x400;
      goto LABEL_10;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
    case 'S':
      int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
LABEL_10:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      if (!*(unsigned char *)(a5 + 169))
      {
        int v15 = *(unsigned char **)(a5 + 72);
        unint64_t v14 = *(void *)(a5 + 80);
        if (*(unsigned char *)(a5 + 170))
        {
          if ((unint64_t)v15 >= v14)
          {
            std::locale v16 = *(unsigned char **)(a5 + 64);
            unint64_t v17 = v15 - v16;
            uint64_t v18 = v15 - v16 + 1;
            if (v18 < 0) {
              goto LABEL_115;
            }
            unint64_t v19 = v14 - (void)v16;
            if (2 * v19 > v18) {
              uint64_t v18 = 2 * v19;
            }
            if (v19 >= 0x3FFFFFFFFFFFFFFFLL) {
              size_t v20 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              size_t v20 = v18;
            }
            if (v20) {
              uint64_t v21 = operator new(v20);
            }
            else {
              uint64_t v21 = 0;
            }
            std::vector<char>::pointer v38 = &v21[v17];
            unint64_t v39 = &v21[v20];
            v21[v17] = 95;
            uint64_t v28 = (uint64_t)&v21[v17 + 1];
            if (v15 != v16)
            {
              if (v17 >= 8 && (unint64_t)(v16 - v21) >= 0x20)
              {
                if (v17 < 0x20)
                {
                  unint64_t v40 = 0;
                  goto LABEL_83;
                }
                unint64_t v40 = v17 & 0xFFFFFFFFFFFFFFE0;
                BOOL v50 = (long long *)(v15 - 16);
                int v51 = &v21[v15 - 16 - v16];
                unint64_t v52 = v17 & 0xFFFFFFFFFFFFFFE0;
                do
                {
                  long long v53 = *v50;
                  *(v51 - 1) = *(v50 - 1);
                  *int v51 = v53;
                  v51 -= 2;
                  v50 -= 2;
                  v52 -= 32;
                }
                while (v52);
                if (v17 == v40) {
                  goto LABEL_109;
                }
                if ((v17 & 0x18) != 0)
                {
LABEL_83:
                  v38 -= v17 & 0xFFFFFFFFFFFFFFF8;
                  size_t v54 = &v15[-v40 - 8];
                  int v55 = &v21[v54 - v16];
                  unint64_t v56 = v40 - (v17 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    uint64_t v57 = *(void *)v54;
                    v54 -= 8;
                    *v55-- = v57;
                    v56 += 8;
                  }
                  while (v56);
                  v15 -= v17 & 0xFFFFFFFFFFFFFFF8;
                  if (v17 == (v17 & 0xFFFFFFFFFFFFFFF8)) {
                    goto LABEL_109;
                  }
                  goto LABEL_103;
                }
                v38 -= v40;
                v15 -= v40;
              }
LABEL_103:
              size_t v68 = v38 - 1;
              do
              {
                char v69 = *--v15;
                *v68-- = v69;
              }
              while (v15 != v16);
LABEL_109:
              int v15 = *(unsigned char **)(a5 + 64);
LABEL_110:
              *(void *)(a5 + 64) = v21;
              *(void *)(a5 + 72) = v28;
              *(void *)(a5 + 80) = v39;
              if (v15) {
                operator delete(v15);
              }
              goto LABEL_112;
            }
LABEL_70:
            uint64_t v21 = v38;
            goto LABEL_110;
          }
LABEL_42:
          unsigned char *v15 = 95;
          uint64_t v28 = (uint64_t)(v15 + 1);
LABEL_112:
          *(void *)(a5 + 72) = v28;
          return a2 + 1;
        }
        if ((unint64_t)v15 < v14) {
          goto LABEL_42;
        }
        int v33 = *(unsigned char **)(a5 + 64);
        unint64_t v34 = v15 - v33;
        uint64_t v35 = v15 - v33 + 1;
        if (v35 < 0) {
          goto LABEL_115;
        }
        unint64_t v36 = v14 - (void)v33;
        if (2 * v36 > v35) {
          uint64_t v35 = 2 * v36;
        }
        if (v36 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v37 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v37 = v35;
        }
        if (v37) {
          uint64_t v21 = operator new(v37);
        }
        else {
          uint64_t v21 = 0;
        }
        std::vector<char>::pointer v38 = &v21[v34];
        unint64_t v39 = &v21[v37];
        v21[v34] = 95;
        uint64_t v28 = (uint64_t)&v21[v34 + 1];
        if (v15 == v33) {
          goto LABEL_70;
        }
        if (v34 >= 8 && (unint64_t)(v33 - v21) >= 0x20)
        {
          if (v34 < 0x20)
          {
            unint64_t v41 = 0;
            goto LABEL_91;
          }
          unint64_t v41 = v34 & 0xFFFFFFFFFFFFFFE0;
          size_t v58 = (long long *)(v15 - 16);
          size_t v59 = &v21[v15 - 16 - v33];
          unint64_t v60 = v34 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v61 = *v58;
            *(v59 - 1) = *(v58 - 1);
            _OWORD *v59 = v61;
            v59 -= 2;
            v58 -= 2;
            v60 -= 32;
          }
          while (v60);
          if (v34 == v41) {
            goto LABEL_109;
          }
          if ((v34 & 0x18) != 0)
          {
LABEL_91:
            v38 -= v34 & 0xFFFFFFFFFFFFFFF8;
            unint64_t v62 = &v15[-v41 - 8];
            size_t v63 = &v21[v62 - v33];
            unint64_t v64 = v41 - (v34 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              uint64_t v65 = *(void *)v62;
              v62 -= 8;
              *v63-- = v65;
              v64 += 8;
            }
            while (v64);
            v15 -= v34 & 0xFFFFFFFFFFFFFFF8;
            if (v34 == (v34 & 0xFFFFFFFFFFFFFFF8)) {
              goto LABEL_109;
            }
            goto LABEL_107;
          }
          v38 -= v41;
          v15 -= v41;
        }
LABEL_107:
        int v70 = v38 - 1;
        do
        {
          char v71 = *--v15;
          *v70-- = v71;
        }
        while (v15 != v33);
        goto LABEL_109;
      }
      char v9 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a5 + 24) + 40))(*(void *)(a5 + 24), 95);
      char v10 = v9;
      int v12 = *(unsigned char **)(a5 + 72);
      unint64_t v11 = *(void *)(a5 + 80);
      if ((unint64_t)v12 >= v11)
      {
        unint64_t v22 = *(unsigned char **)(a5 + 64);
        unint64_t v23 = v12 - v22;
        uint64_t v24 = v12 - v22 + 1;
        if (v24 >= 0)
        {
          unint64_t v25 = v11 - (void)v22;
          if (2 * v25 > v24) {
            uint64_t v24 = 2 * v25;
          }
          if (v25 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v26 = v24;
          }
          if (v26) {
            unint64_t v27 = operator new(v26);
          }
          else {
            unint64_t v27 = 0;
          }
          std::string::size_type v29 = &v27[v23];
          unsigned __int8 v30 = &v27[v26];
          v27[v23] = v10;
          uint64_t v31 = (uint64_t)&v27[v23 + 1];
          if (v12 == v22)
          {
            v27 += v23;
LABEL_99:
            *(void *)(a5 + 64) = v27;
            *(void *)(a5 + 72) = v31;
            *(void *)(a5 + 80) = v30;
            if (v12) {
              operator delete(v12);
            }
            *(void *)(a5 + 72) = v31;
            return a2 + 1;
          }
          if (v23 >= 8 && (unint64_t)(v22 - v27) >= 0x20)
          {
            if (v23 < 0x20)
            {
              unint64_t v32 = 0;
              goto LABEL_75;
            }
            unint64_t v32 = v23 & 0xFFFFFFFFFFFFFFE0;
            unsigned int v42 = (long long *)(v12 - 16);
            int64_t v43 = &v27[v12 - 16 - v22];
            unint64_t v44 = v23 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v45 = *v42;
              *(v43 - 1) = *(v42 - 1);
              *int64_t v43 = v45;
              v43 -= 2;
              v42 -= 2;
              v44 -= 32;
            }
            while (v44);
            if (v23 == v32) {
              goto LABEL_98;
            }
            if ((v23 & 0x18) != 0)
            {
LABEL_75:
              v29 -= v23 & 0xFFFFFFFFFFFFFFF8;
              int v46 = &v12[-v32 - 8];
              std::string::size_type v47 = &v27[v46 - v22];
              unint64_t v48 = v32 - (v23 & 0xFFFFFFFFFFFFFFF8);
              do
              {
                uint64_t v49 = *(void *)v46;
                v46 -= 8;
                *v47-- = v49;
                v48 += 8;
              }
              while (v48);
              v12 -= v23 & 0xFFFFFFFFFFFFFFF8;
              if (v23 == (v23 & 0xFFFFFFFFFFFFFFF8)) {
                goto LABEL_98;
              }
              goto LABEL_96;
            }
            v29 -= v32;
            v12 -= v32;
          }
LABEL_96:
          int v66 = v29 - 1;
          do
          {
            char v67 = *--v12;
            *v66-- = v67;
          }
          while (v12 != v22);
LABEL_98:
          int v12 = *(unsigned char **)(a5 + 64);
          goto LABEL_99;
        }
LABEL_115:
        std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
      }
      *int v12 = v9;
      *(void *)(a5 + 72) = v12 + 1;
      return a2 + 1;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      return a2 + 1;
    case 'd':
      int v13 = *(_DWORD *)(a5 + 160) | 0x400;
      goto LABEL_18;
    case 's':
      int v13 = *(_DWORD *)(a5 + 160) | 0x4000;
LABEL_18:
      *(_DWORD *)(a5 + 160) = v13;
      return a2 + 1;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      return a2 + 1;
    default:
      if (*a2) {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
      }
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 1) = 0;
      return a2 + 1;
  }
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_70:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  std::basic_regex<char>::value_type v5 = *a2;
  switch(*a2)
  {
    case '""':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v5;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30) {
        goto LABEL_70;
      }
      std::basic_regex<char>::value_type v7 = *a2 - 48;
      uint64_t v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        uint64_t v8 = a3;
LABEL_42:
        if (a4) {
          goto LABEL_43;
        }
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30) {
        goto LABEL_42;
      }
      std::basic_regex<char>::value_type v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        uint64_t v8 = a3;
        if (a4) {
          goto LABEL_43;
        }
        goto LABEL_69;
      }
      std::basic_regex<char>::value_type v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::basic_regex<char>::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        uint64_t v8 = a2 + 3;
      }
      else {
        uint64_t v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::basic_regex<char>::value_type v7 = v11;
      }
      if (!a4) {
        goto LABEL_69;
      }
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v7;
      *((unsigned char *)a4 + 1) = 0;
      return v8;
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    __int16 v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3) << 8);
    uint64_t v8 = *(char **)(a1 + 120);
    unint64_t v7 = *(void *)(a1 + 128);
    if ((unint64_t)v8 >= v7)
    {
      std::basic_regex<char>::value_type v9 = *(char **)(a1 + 112);
      uint64_t v10 = v8 - v9;
      if (v8 - v9 > -3)
      {
        uint64_t v11 = v10 >> 1;
        unint64_t v12 = v7 - (void)v9;
        if (v12 <= (v10 >> 1) + 1) {
          unint64_t v13 = v11 + 1;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v14 = v13;
        }
        if (!v14)
        {
          int v15 = 0;
          std::locale v16 = (_WORD *)(2 * v11);
          unint64_t v17 = 0;
          *(_WORD *)(2 * v11) = v6;
          uint64_t v18 = 2 * v11 + 2;
          unint64_t v19 = (char *)(v8 - v9);
          if (v8 == v9) {
            goto LABEL_64;
          }
LABEL_30:
          unint64_t v29 = (unint64_t)(v19 - 2);
          if (v29 < 0x1E) {
            goto LABEL_71;
          }
          if (v8 - v15 - (v10 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
            goto LABEL_71;
          }
          uint64_t v30 = (v29 >> 1) + 1;
          unint64_t v31 = 2 * (v30 & 0xFFFFFFFFFFFFFFF0);
          unint64_t v32 = &v8[-v31];
          std::locale v16 = (_WORD *)((char *)v16 - v31);
          int v33 = &v15[2 * v11 - 16];
          unint64_t v34 = v8 - 16;
          unint64_t v35 = v30 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            long long v36 = *(_OWORD *)v34;
            *(v33 - 1) = *((_OWORD *)v34 - 1);
            _OWORD *v33 = v36;
            v33 -= 2;
            v34 -= 32;
            v35 -= 16;
          }
          while (v35);
          uint64_t v8 = v32;
          if (v30 != (v30 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_71:
            do
            {
              __int16 v37 = *((_WORD *)v8 - 1);
              v8 -= 2;
              *--std::locale v16 = v37;
            }
            while (v8 != v9);
          }
LABEL_63:
          uint64_t v8 = *(char **)(a1 + 112);
          goto LABEL_64;
        }
        if ((v14 & 0x8000000000000000) == 0)
        {
          int v15 = operator new(2 * v14);
          std::locale v16 = &v15[2 * v11];
          unint64_t v17 = &v15[2 * v14];
          *std::locale v16 = v6;
          uint64_t v18 = (uint64_t)(v16 + 1);
          unint64_t v19 = (char *)(v8 - v9);
          if (v8 == v9) {
            goto LABEL_64;
          }
          goto LABEL_30;
        }
LABEL_68:
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
LABEL_67:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
LABEL_28:
    *(_WORD *)uint64_t v8 = v6;
    uint64_t v18 = (uint64_t)(v8 + 2);
    goto LABEL_66;
  }
  __int16 v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
  uint64_t v8 = *(char **)(a1 + 120);
  unint64_t v20 = *(void *)(a1 + 128);
  if (*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v8 < v20) {
      goto LABEL_28;
    }
    uint64_t v21 = *(char **)(a1 + 112);
    uint64_t v22 = v8 - v21;
    if (v8 - v21 <= -3) {
      goto LABEL_67;
    }
    uint64_t v23 = v22 >> 1;
    unint64_t v24 = v20 - (void)v21;
    if (v24 <= (v22 >> 1) + 1) {
      unint64_t v25 = v23 + 1;
    }
    else {
      unint64_t v25 = v24;
    }
    if (v24 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v26 = v25;
    }
    if (v26)
    {
      if (v26 < 0) {
        goto LABEL_68;
      }
      unint64_t v27 = operator new(2 * v26);
      std::locale v16 = &v27[2 * v23];
      unint64_t v17 = &v27[2 * v26];
      *std::locale v16 = v6;
      uint64_t v18 = (uint64_t)(v16 + 1);
      uint64_t v28 = (char *)(v8 - v21);
      if (v8 == v21) {
        goto LABEL_64;
      }
    }
    else
    {
      unint64_t v27 = 0;
      std::locale v16 = (_WORD *)(2 * v23);
      unint64_t v17 = 0;
      *(_WORD *)(2 * v23) = v6;
      uint64_t v18 = 2 * v23 + 2;
      uint64_t v28 = (char *)(v8 - v21);
      if (v8 == v21) {
        goto LABEL_64;
      }
    }
    unint64_t v46 = (unint64_t)(v28 - 2);
    if (v46 < 0x1E) {
      goto LABEL_72;
    }
    if (v8 - v27 - (v22 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
      goto LABEL_72;
    }
    uint64_t v47 = (v46 >> 1) + 1;
    unint64_t v48 = 2 * (v47 & 0xFFFFFFFFFFFFFFF0);
    uint64_t v49 = &v8[-v48];
    std::locale v16 = (_WORD *)((char *)v16 - v48);
    BOOL v50 = &v27[2 * v23 - 16];
    int v51 = v8 - 16;
    unint64_t v52 = v47 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v53 = *(_OWORD *)v51;
      *(v50 - 1) = *((_OWORD *)v51 - 1);
      _OWORD *v50 = v53;
      v50 -= 2;
      v51 -= 32;
      v52 -= 16;
    }
    while (v52);
    uint64_t v8 = v49;
    if (v47 != (v47 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        __int16 v54 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--std::locale v16 = v54;
      }
      while (v8 != v21);
    }
    goto LABEL_63;
  }
  if ((unint64_t)v8 < v20) {
    goto LABEL_28;
  }
  std::vector<char>::pointer v38 = *(char **)(a1 + 112);
  uint64_t v39 = v8 - v38;
  if (v8 - v38 <= -3) {
    goto LABEL_67;
  }
  uint64_t v40 = v39 >> 1;
  unint64_t v41 = v20 - (void)v38;
  if (v41 <= (v39 >> 1) + 1) {
    unint64_t v42 = v40 + 1;
  }
  else {
    unint64_t v42 = v41;
  }
  if (v41 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v43 = v42;
  }
  if (!v43)
  {
    unint64_t v44 = 0;
    std::locale v16 = (_WORD *)(2 * v40);
    unint64_t v17 = 0;
    *(_WORD *)(2 * v40) = v6;
    uint64_t v18 = 2 * v40 + 2;
    long long v45 = (char *)(v8 - v38);
    if (v8 == v38) {
      goto LABEL_64;
    }
    goto LABEL_57;
  }
  if (v43 < 0) {
    goto LABEL_68;
  }
  unint64_t v44 = operator new(2 * v43);
  std::locale v16 = &v44[2 * v40];
  unint64_t v17 = &v44[2 * v43];
  *std::locale v16 = v6;
  uint64_t v18 = (uint64_t)(v16 + 1);
  long long v45 = (char *)(v8 - v38);
  if (v8 != v38)
  {
LABEL_57:
    unint64_t v55 = (unint64_t)(v45 - 2);
    if (v55 < 0x1E) {
      goto LABEL_73;
    }
    if (v8 - v44 - (v39 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
      goto LABEL_73;
    }
    uint64_t v56 = (v55 >> 1) + 1;
    unint64_t v57 = 2 * (v56 & 0xFFFFFFFFFFFFFFF0);
    size_t v58 = &v8[-v57];
    std::locale v16 = (_WORD *)((char *)v16 - v57);
    size_t v59 = &v44[2 * v40 - 16];
    unint64_t v60 = v8 - 16;
    unint64_t v61 = v56 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v62 = *(_OWORD *)v60;
      *(v59 - 1) = *((_OWORD *)v60 - 1);
      _OWORD *v59 = v62;
      v59 -= 2;
      v60 -= 32;
      v61 -= 16;
    }
    while (v61);
    uint64_t v8 = v58;
    if (v56 != (v56 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_73:
      do
      {
        __int16 v63 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--std::locale v16 = v63;
      }
      while (v8 != v38);
    }
    goto LABEL_63;
  }
LABEL_64:
  *(void *)(a1 + 112) = v16;
  *(void *)(a1 + 120) = v18;
  *(void *)(a1 + 128) = v17;
  if (v8) {
    operator delete(v8);
  }
LABEL_66:
  *(void *)(a1 + 120) = v18;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE1059C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4 = (unint64_t)&a4[-a3];
  memset(__s, 170, sizeof(__s));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 <= 0x16)
  {
    __s[23] = (_BYTE)a4 - a3;
    std::basic_regex<char>::value_type v9 = __s;
    if ((char *)a3 != a4) {
      goto LABEL_4;
    }
LABEL_13:
    uint64_t v10 = v9;
    goto LABEL_16;
  }
  uint64_t v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v16 = v4 | 7;
  }
  uint64_t v17 = v16 + 1;
  std::basic_regex<char>::value_type v9 = (char *)operator new(v16 + 1);
  *(void *)&__s[8] = v4;
  *(void *)&__s[16] = v17 | 0x8000000000000000;
  *(void *)std::string __s = v9;
  if ((char *)a3 == a4) {
    goto LABEL_13;
  }
LABEL_4:
  if (v4 < 0x20 || (unint64_t)&v9[-a3] < 0x20)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (char *)a3;
    do
    {
LABEL_15:
      char v18 = *v11++;
      *v10++ = v18;
    }
    while (v11 != a4);
    goto LABEL_16;
  }
  uint64_t v10 = &v9[v4 & 0xFFFFFFFFFFFFFFE0];
  uint64_t v11 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
  unint64_t v12 = (long long *)(a3 + 16);
  unint64_t v13 = v9 + 16;
  unint64_t v14 = v4 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v15 = *v12;
    *(v13 - 1) = *(v12 - 1);
    _OWORD *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  if (v4 != (v4 & 0xFFFFFFFFFFFFFFE0)) {
    goto LABEL_15;
  }
LABEL_16:
  char *v10 = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if (__s[23] < 0)
  {
    unint64_t v19 = *(char **)__s;
    if (!*(void *)&__s[8]) {
      goto LABEL_29;
    }
  }
  else
  {
    if (!__s[23]) {
      return;
    }
    unint64_t v19 = __s;
  }
  std::__get_collation_name(&v26, v19);
  *(_OWORD *)a1 = *(_OWORD *)&v26.__r_.__value_.__l.__data_;
  unint64_t v20 = v26.__r_.__value_.__r.__words[2];
  *(void *)(a1 + 16) = *((void *)&v26.__r_.__value_.__l + 2);
  unint64_t v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0) {
    unint64_t v21 = *(void *)(a1 + 8);
  }
  if (v21)
  {
LABEL_23:
    if ((__s[23] & 0x80000000) == 0) {
      return;
    }
    unint64_t v19 = *(char **)__s;
LABEL_29:
    operator delete(v19);
    return;
  }
  if (__s[23] < 0)
  {
    unint64_t v19 = *(char **)__s;
    if (*(void *)&__s[8] >= 3uLL) {
      goto LABEL_29;
    }
    goto LABEL_31;
  }
  if (__s[23] < 3u)
  {
LABEL_31:
    (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v26);
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    *(std::string *)a1 = v26;
    if (*(char *)(a1 + 23) < 0)
    {
      uint64_t v23 = *(void *)(a1 + 8);
      if (v23 == 1 || v23 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] >= 0) {
            unint64_t v24 = __s;
          }
          else {
            unint64_t v24 = *(char **)__s;
          }
          if (__s[23] >= 0) {
            size_t v25 = __s[23];
          }
          else {
            size_t v25 = *(void *)&__s[8];
          }
          std::string::__assign_no_alias<false>((void **)a1, v24, v25);
        }
      }
      else
      {
        **(unsigned char **)a1 = 0;
        *(void *)(a1 + 8) = 0;
      }
    }
    else
    {
      int v22 = *(unsigned __int8 *)(a1 + 23);
      if (v22 == 1 || v22 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] < 0)
          {
            std::string::__assign_no_alias<true>((void *)a1, *(void **)__s, *(size_t *)&__s[8]);
          }
          else
          {
            *(_OWORD *)a1 = *(_OWORD *)__s;
            *(void *)(a1 + 16) = *(void *)&__s[16];
          }
        }
      }
      else
      {
        *(unsigned char *)a1 = 0;
        *(unsigned char *)(a1 + 23) = 0;
      }
    }
    goto LABEL_23;
  }
}

void sub_21DE10884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::string>::__push_back_slow_path<std::string const&>(char **a1, uint64_t a2)
{
  char v2 = *a1;
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * ((a1[2] - v2) >> 3) > v5) {
    unint64_t v5 = 0x5555555555555556 * ((a1[2] - v2) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v2) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v5;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    std::basic_regex<char>::value_type v9 = (char *)operator new(24 * v8);
  }
  else
  {
    std::basic_regex<char>::value_type v9 = 0;
  }
  uint64_t v10 = (std::string *)&v9[24 * v4];
  uint64_t v16 = v10;
  uint64_t v17 = v10;
  char v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    char v2 = *a1;
    uint64_t v3 = a1[1];
    uint64_t v10 = v16;
    uint64_t v11 = v17 + 1;
    if (v3 == *a1)
    {
LABEL_17:
      unint64_t v13 = v2;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v10->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
    uint64_t v11 = v10 + 1;
    if (v3 == v2) {
      goto LABEL_17;
    }
  }
  do
  {
    long long v12 = *(_OWORD *)(v3 - 24);
    v10[-1].__r_.__value_.__r.__words[2] = *((void *)v3 - 1);
    *(_OWORD *)&v10[-1].__r_.__value_.__l.__data_ = v12;
    --v10;
    *((void *)v3 - 2) = 0;
    *((void *)v3 - 1) = 0;
    *((void *)v3 - 3) = 0;
    v3 -= 24;
  }
  while (v3 != v2);
  unint64_t v13 = *a1;
  char v2 = a1[1];
LABEL_18:
  *a1 = (char *)v10;
  a1[1] = (char *)v11;
  a1[2] = v18;
  if (v2 != v13)
  {
    unint64_t v14 = (void **)(v2 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0) {
        operator delete(*v14);
      }
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    char v2 = v13;
  }
  if (v2) {
    operator delete(v2);
  }
  return v11;
}

void sub_21DE10A88(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE10BE4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4 = (unint64_t)&a4[-a3];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 > 0x16)
  {
    uint64_t v15 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v15 = v4 | 7;
    }
    uint64_t v16 = v15 + 1;
    unint64_t v8 = operator new(v15 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v16 | 0x8000000000000000);
    __p[0] = v8;
    if ((char *)a3 != a4) {
      goto LABEL_4;
    }
LABEL_13:
    std::basic_regex<char>::value_type v9 = v8;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a4 - a3;
  unint64_t v8 = __p;
  if ((char *)a3 == a4) {
    goto LABEL_13;
  }
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v8 - a3 < 0x20)
  {
    std::basic_regex<char>::value_type v9 = v8;
    uint64_t v10 = (char *)a3;
  }
  else
  {
    std::basic_regex<char>::value_type v9 = (char *)v8 + (v4 & 0xFFFFFFFFFFFFFFE0);
    uint64_t v10 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v11 = (long long *)(a3 + 16);
    long long v12 = v8 + 1;
    unint64_t v13 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v14 = *v11;
      *(v12 - 1) = *(v11 - 1);
      *long long v12 = v14;
      v11 += 2;
      v12 += 2;
      v13 -= 32;
    }
    while (v13);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v17 = *v10++;
    *v9++ = v17;
  }
  while (v10 != a4);
LABEL_16:
  *std::basic_regex<char>::value_type v9 = 0;
  char v18 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v19 = __p;
  }
  else {
    unint64_t v19 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    char v18 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v19, &v18[(void)v19]);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
}

void sub_21DE10D90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE10DF0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555) {
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) > v3) {
    unint64_t v3 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v6 = 0x555555555555555;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 > 0x555555555555555) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    std::string::size_type v7 = (char *)operator new(48 * v6);
  }
  else
  {
    std::string::size_type v7 = 0;
  }
  unint64_t v8 = &v7[48 * v2];
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  std::basic_regex<char>::value_type v9 = &v7[48 * v6];
  long long v10 = *(_OWORD *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((void *)v8 + 5) = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  uint64_t v11 = v8 + 48;
  long long v12 = (void **)*a1;
  unint64_t v13 = (void **)a1[1];
  if (v13 != *a1)
  {
    do
    {
      long long v14 = *((_OWORD *)v13 - 3);
      *((void *)v8 - 4) = *(v13 - 4);
      *((_OWORD *)v8 - 3) = v14;
      *(v13 - 5) = 0;
      *(v13 - 4) = 0;
      *(v13 - 6) = 0;
      long long v15 = *(_OWORD *)(v13 - 3);
      *((void *)v8 - 1) = *(v13 - 1);
      *(_OWORD *)(v8 - 24) = v15;
      v8 -= 48;
      *(v13 - 2) = 0;
      *(v13 - 1) = 0;
      *(v13 - 3) = 0;
      v13 -= 6;
    }
    while (v13 != v12);
    unint64_t v13 = (void **)*a1;
    uint64_t v16 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    while (1)
    {
      if (v16 == v13) {
        goto LABEL_22;
      }
      if (*((char *)v16 - 1) < 0)
      {
        operator delete(*(v16 - 3));
        if ((*((char *)v16 - 25) & 0x80000000) == 0) {
          goto LABEL_14;
        }
      }
      else if ((*((char *)v16 - 25) & 0x80000000) == 0)
      {
        goto LABEL_14;
      }
      operator delete(*(v16 - 6));
LABEL_14:
      v16 -= 6;
    }
  }
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
LABEL_22:
  if (v13) {
    operator delete(v13);
  }
  return v11;
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  unint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8 = __mexp_end;
  int v9 = __mexp_begin;
  long long v14 = operator new(0x10uLL);
  std::__split_buffer<std::string>::pointer end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  char v17 = operator new(0x38uLL);
  unsigned int loop_count = this->__loop_count_;
  *((void *)v17 + 1) = __s->__first_;
  *((void *)v17 + 2) = v14;
  *(void *)char v17 = &unk_26CEBDA00;
  *((void *)v17 + 3) = __min;
  *((void *)v17 + 4) = __max;
  *((_DWORD *)v17 + 10) = loop_count;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((unsigned char *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  unint64_t v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)&unk_26CEBDA90;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((void *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = loop_count + 1;
}

void sub_21DE112EC(_Unwind_Exception *a1)
{
  std::__loop<char>::~__loop(v1);
  _Unwind_Resume(a1);
}

void sub_21DE11300(_Unwind_Exception *a1)
{
  std::__empty_state<char>::~__empty_state(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE11358(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE113B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CEBDA60;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  unint64_t v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::string __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CEBDA60;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  unint64_t v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }

  operator delete(__p);
}

uint64_t std::__loop<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 40);
  uint64_t v3 = *(void *)(a2 + 56);
  unint64_t v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 != -991)
  {
    *unint64_t v4 = 0;
    if (!*(void *)(result + 32))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_28;
    }
    if (*(void *)(result + 24))
    {
      *(_DWORD *)a2 = -994;
      *(void *)(a2 + 80) = *(void *)(result + 8);
      *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
      int v20 = *(_DWORD *)(result + 44);
      int v21 = *(_DWORD *)(result + 48);
      if (v20 == v21) {
        return result;
      }
      uint64_t v22 = (v21 - 1);
      uint64_t v23 = (v20 - 1);
      uint64_t v24 = *(void *)(a2 + 24);
      uint64_t v25 = *(void *)(a2 + 32);
      uint64_t v26 = v22 - v23;
      if ((unint64_t)(v22 - v23) >= 2)
      {
        uint64_t v27 = (v26 & 0xFFFFFFFFFFFFFFFELL) + v23;
        uint64_t v28 = v25 + 24 * v23 + 24;
        unint64_t v29 = v26 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *(void *)(v28 - 24) = v24;
          *(void *)(v28 - 16) = v24;
          *(void *)uint64_t v28 = v24;
          *(void *)(v28 + 8) = v24;
          *(unsigned char *)(v28 - 8) = 0;
          *(unsigned char *)(v28 + 16) = 0;
          v28 += 48;
          v29 -= 2;
        }
        while (v29);
        if (v26 == (v26 & 0xFFFFFFFFFFFFFFFELL)) {
          return result;
        }
      }
      else
      {
        uint64_t v27 = v23;
      }
      uint64_t v30 = v22 - v27;
      unint64_t v31 = (unsigned char *)(v25 + 24 * v27 + 16);
      do
      {
        *((void *)v31 - 2) = v24;
        *((void *)v31 - 1) = v24;
        unsigned char *v31 = 0;
        v31 += 24;
        --v30;
      }
      while (v30);
      return result;
    }
LABEL_26:
    *(_DWORD *)a2 = -992;
    return result;
  }
  unint64_t v5 = *v4 + 1;
  *unint64_t v4 = v5;
  unint64_t v6 = *(void *)(result + 24);
  unint64_t v7 = *(void *)(result + 32);
  BOOL v8 = v5 < v7;
  if (v5 < v7 && v5 >= v6) {
    BOOL v8 = v5 < v7 && *(void *)(v3 + 16 * v2 + 8) != *(void *)(a2 + 16);
  }
  if (v8 && v5 >= v6) {
    goto LABEL_26;
  }
  *(_DWORD *)a2 = -994;
  if (!v8)
  {
LABEL_28:
    *(void *)(a2 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a2 + 80) = *(void *)(result + 8);
  *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
  int v12 = *(_DWORD *)(result + 44);
  int v13 = *(_DWORD *)(result + 48);
  if (v12 == v13) {
    return result;
  }
  uint64_t v14 = (v13 - 1);
  uint64_t v15 = (v12 - 1);
  uint64_t v16 = *(void *)(a2 + 24);
  uint64_t v17 = *(void *)(a2 + 32);
  uint64_t v18 = v14 - v15;
  if ((unint64_t)(v14 - v15) < 2)
  {
    uint64_t v19 = v15;
LABEL_39:
    uint64_t v34 = v14 - v19;
    unint64_t v35 = (unsigned char *)(v17 + 24 * v19 + 16);
    do
    {
      *((void *)v35 - 2) = v16;
      *((void *)v35 - 1) = v16;
      unsigned char *v35 = 0;
      v35 += 24;
      --v34;
    }
    while (v34);
    return result;
  }
  uint64_t v19 = (v18 & 0xFFFFFFFFFFFFFFFELL) + v15;
  uint64_t v32 = v17 + 24 * v15 + 24;
  unint64_t v33 = v18 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    *(void *)(v32 - 24) = v16;
    *(void *)(v32 - 16) = v16;
    *(void *)uint64_t v32 = v16;
    *(void *)(v32 + 8) = v16;
    *(unsigned char *)(v32 - 8) = 0;
    *(unsigned char *)(v32 + 16) = 0;
    v32 += 48;
    v33 -= 2;
  }
  while (v33);
  if (v18 != (v18 & 0xFFFFFFFFFFFFFFFELL)) {
    goto LABEL_39;
  }
  return result;
}

uint64_t std::__loop<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  if (*(unsigned __int8 *)(result + 52) == a2)
  {
    *(void *)(a3 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a3 + 80) = *(void *)(result + 8);
  int v3 = *(_DWORD *)(result + 44);
  *(void *)(*(void *)(a3 + 56) + 16 * *(unsigned int *)(result + 40) + 8) = *(void *)(a3 + 16);
  int v4 = *(_DWORD *)(result + 48);
  if (v3 != v4)
  {
    uint64_t v5 = (v4 - 1);
    uint64_t v6 = (v3 - 1);
    uint64_t v7 = *(void *)(a3 + 24);
    uint64_t v8 = *(void *)(a3 + 32);
    uint64_t v9 = v5 - v6;
    if ((unint64_t)(v5 - v6) < 2)
    {
      uint64_t v10 = v6;
LABEL_9:
      uint64_t v13 = v5 - v10;
      uint64_t v14 = (unsigned char *)(v8 + 24 * v10 + 16);
      do
      {
        *((void *)v14 - 2) = v7;
        *((void *)v14 - 1) = v7;
        *uint64_t v14 = 0;
        v14 += 24;
        --v13;
      }
      while (v13);
      return result;
    }
    uint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFFELL) + v6;
    uint64_t v11 = v8 + 24 * v6 + 24;
    unint64_t v12 = v9 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(void *)(v11 - 24) = v7;
      *(void *)(v11 - 16) = v7;
      *(void *)uint64_t v11 = v7;
      *(void *)(v11 + 8) = v7;
      *(unsigned char *)(v11 - 8) = 0;
      *(unsigned char *)(v11 + 16) = 0;
      v11 += 48;
      v12 -= 2;
    }
    while (v12);
    if (v9 != (v9 & 0xFFFFFFFFFFFFFFFELL)) {
      goto LABEL_9;
    }
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CEBDA60;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::string __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CEBDA60;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }

  operator delete(__p);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CEBDA60;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  *std::string __p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26CEBDA60;
  uint64_t v2 = __p[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  int v3 = __p[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }

  operator delete(__p);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x223C188A0](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_21DE11B84(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  if (a2 == a3) {
    goto LABEL_4;
  }
  uint64_t v7 = a2 + 1;
  int v6 = *a2;
  if (a2 + 1 == a3 && v6 == 36) {
    goto LABEL_4;
  }
  if ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
  }
  else
  {
    if (v7 != a3 && v6 == 92)
    {
      int v15 = *v7;
      if ((v15 - 36) <= 0x3A && ((1 << (v15 - 36)) & 0x580000000000441) != 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v15);
        uint64_t v7 = a2 + 2;
        goto LABEL_5;
      }
LABEL_4:
      uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
      goto LABEL_5;
    }
    if (v6 != 46) {
      goto LABEL_4;
    }
    uint64_t v16 = operator new(0x10uLL);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(v17 + 8);
    *uint64_t v16 = &unk_26CEBDB68;
    v16[1] = v18;
    *(void *)(v17 + 8) = v16;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  }
LABEL_5:
  if (a2 == a3 || a2 != v7 || a2 + 1 == a3 || *a2 != 92) {
    return v7;
  }
  int v8 = a2[1];
  if (v8 == 40)
  {
    uint64_t v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      uint64_t v10 = operator new(0x18uLL);
      int v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(v12 + 8);
      void *v10 = &unk_26CEBD970;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(void *)(v12 + 8) = v10;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3) {
        goto LABEL_39;
      }
      int v20 = v9;
      int v21 = *(std::__owns_one_state<char> **)(a1 + 56);
      int v22 = *(_DWORD *)(a1 + 28);
      uint64_t v23 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v20, a3);
      if (v20 == v23) {
        break;
      }
      uint64_t v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v23, (std::basic_regex<char> *)a3, v21, (v22 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v20 != v9);
    if ((char *)&v20->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v20->__traits_.__loc_.__locale_) != 92
      || BYTE1(v20->__traits_.__loc_.__locale_) != 41)
    {
LABEL_39:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    uint64_t v7 = (char *)v20 + 2 * (BYTE1(v20->__traits_.__loc_.__locale_) == 41);
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      uint64_t v24 = operator new(0x18uLL);
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v26 = *(void *)(v25 + 8);
      *uint64_t v24 = &unk_26CEBD9B8;
      v24[1] = v26;
      *((_DWORD *)v24 + 4) = v11;
      *(void *)(v25 + 8) = v24;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    return v7;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8) {
    return v7;
  }
  if ((v8 - 48) > *(_DWORD *)(a1 + 28)) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return a2 + 2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  if (this == a3) {
    return this;
  }
  int locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  uint64_t v9 = (unsigned __int8 *)a3;
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return this;
  }
  uint64_t v10 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v10 == a3) {
    goto LABEL_45;
  }
  int v11 = LOBYTE(v10->__traits_.__loc_.__locale_);
  if ((v11 & 0xF8) != 0x30 && (v11 & 0xFE) != 0x38) {
    goto LABEL_45;
  }
  int v12 = v11 - 48;
  uint64_t v13 = (std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_15:
    uint64_t v13 = a3;
  }
  else
  {
    while (1)
    {
      int v14 = LOBYTE(v13->__traits_.__loc_.__locale_);
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
        break;
      }
      if (v12 >= 214748364) {
        goto LABEL_45;
      }
      int v12 = v14 + 10 * v12 - 48;
      uint64_t v13 = (std::basic_regex<char> *)((char *)v13 + 1);
      if (v13 == a3) {
        goto LABEL_15;
      }
    }
  }
  if (v13 == v10) {
    goto LABEL_45;
  }
  if (v13 == a3) {
LABEL_46:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  int v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 1);
  int v16 = LOBYTE(v13->__traits_.__loc_.__locale_);
  if (v16 != 44)
  {
    if (v15 != a3 && v16 == 92 && LOBYTE(v15->__traits_.__loc_.__locale_) == 125)
    {
      uint64_t v19 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v12, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_46;
  }
  if (v15 == a3) {
    goto LABEL_46;
  }
  int v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
  if ((v17 & 0xF8) == 0x30 || (v17 & 0xFE) == 0x38)
  {
    int v18 = v17 - 48;
    int v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_37:
      int v15 = a3;
      goto LABEL_40;
    }
    while (1)
    {
      int v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
      if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
        break;
      }
      if (v18 >= 214748364) {
        goto LABEL_45;
      }
      int v18 = v17 + 10 * v18 - 48;
      int v15 = (std::basic_regex<char> *)((char *)v15 + 1);
      if (v15 == a3) {
        goto LABEL_37;
      }
    }
  }
  else
  {
    int v18 = -1;
  }
  if (v15 == a3)
  {
    int v20 = (unsigned __int8 *)v15;
    int v15 = a3;
    uint64_t v9 = v20;
  }
  else if ((std::basic_regex<char> *)((char *)&v15->__traits_.__loc_.__locale_ + 1) == a3 || v17 != 92)
  {
    uint64_t v9 = (unsigned __int8 *)v15;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 125);
  }
LABEL_40:
  if (v15 == (std::basic_regex<char> *)v9) {
    goto LABEL_46;
  }
  if (v18 != -1)
  {
    if (v18 >= v12)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v18, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v9;
    }
LABEL_45:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v9;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v2 = __p[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }

  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > this->__marked_count_) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::__split_buffer<std::string>::pointer end = this->__end_;
  unsigned int marked_count = this->__marked_count_;
  if (a2 != a3)
  {
    int v8 = *a2;
    switch(*a2)
    {
      case '$':
      case '(':
      case '*':
      case '+':
      case '.':
      case '?':
      case '[':
      case '\\':
      case '^':
      case '{':
      case '|':
        goto LABEL_3;
      case ')':
        if (!this->__open_count_) {
          goto LABEL_8;
        }
LABEL_3:
        uint64_t v9 = (std::basic_regex<char> *)(a2 + 1);
        if (a2 + 1 != a3 && v8 == 92)
        {
          std::basic_regex<char>::value_type locale = (std::basic_regex<char>::value_type)v9->__traits_.__loc_.__locale_;
          switch(LOBYTE(v9->__traits_.__loc_.__locale_))
          {
            case '$':
            case '(':
            case ')':
            case '*':
            case '+':
            case '.':
            case '?':
            case '[':
            case '\\':
            case '^':
            case '{':
            case '|':
            case '}':
              std::basic_regex<char,std::regex_traits<char>>::__push_char(this, locale);
              uint64_t v9 = (std::basic_regex<char> *)(a2 + 2);
              goto LABEL_36;
            default:
              if ((this->__flags_ & 0x1F0) == 0x40)
              {
                int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(this, a2 + 1, a3, 0);
              }
              else
              {
                BOOL v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, locale);
                uint64_t v13 = 2;
                if (!v12) {
                  uint64_t v13 = 0;
                }
                int v11 = &a2[v13];
              }
              if (v11 != a2) {
                goto LABEL_19;
              }
              int v8 = *a2;
              break;
          }
        }
        if (v8 != 46) {
          goto LABEL_18;
        }
        int v14 = (std::__node<char> *)operator new(0x10uLL);
        int v15 = this->__end_;
        first = v15->__first_;
        v14->__vftable = (std::__node<char>_vtbl *)&unk_26CEBDB68;
        v14[1].__vftable = (std::__node<char>_vtbl *)first;
        v15->__first_ = v14;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        break;
      default:
LABEL_8:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
        uint64_t v9 = (std::basic_regex<char> *)(a2 + 1);
        goto LABEL_36;
    }
    goto LABEL_36;
  }
LABEL_18:
  int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
LABEL_19:
  if (v11 != a2 || v11 == a3)
  {
LABEL_35:
    uint64_t v9 = (std::basic_regex<char> *)v11;
    if (v11 != a2) {
      goto LABEL_36;
    }
    return (std::basic_regex<char> *)a2;
  }
  int v17 = *a2;
  if (v17 == 36)
  {
    int v18 = (std::__node<char> *)operator new(0x18uLL);
    BOOL v19 = (this->__flags_ & 0x5F0) == 1024;
    int v20 = this->__end_;
    v18[1].__vftable = (std::__node<char>_vtbl *)v20->__first_;
    int v21 = (std::__node<char>_vtbl *)&unk_26CEBD658;
    goto LABEL_26;
  }
  if (v17 == 40)
  {
    if ((this->__flags_ & 2) != 0)
    {
      unsigned int v23 = this->__marked_count_;
    }
    else
    {
      int v22 = (std::__node<char> *)operator new(0x18uLL);
      unsigned int v23 = this->__marked_count_ + 1;
      this->__marked_count_ = v23;
      uint64_t v24 = this->__end_;
      uint64_t v25 = v24->__first_;
      v22->__vftable = (std::__node<char>_vtbl *)&unk_26CEBD970;
      v22[1].__vftable = (std::__node<char>_vtbl *)v25;
      LODWORD(v22[2].__vftable) = v23;
      v24->__first_ = v22;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    }
    ++this->__open_count_;
    uint64_t v26 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(this, a2 + 1, a3);
    if (v26 == a3 || (uint64_t v27 = v26, *v26 != 41)) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    if ((this->__flags_ & 2) == 0)
    {
      uint64_t v28 = (std::__node<char> *)operator new(0x18uLL);
      unint64_t v29 = this->__end_;
      uint64_t v30 = v29->__first_;
      v28->__vftable = (std::__node<char>_vtbl *)&unk_26CEBD9B8;
      v28[1].__vftable = (std::__node<char>_vtbl *)v30;
      LODWORD(v28[2].__vftable) = v23;
      v29->__first_ = v28;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    }
    --this->__open_count_;
    int v11 = v27 + 1;
    goto LABEL_35;
  }
  if (v17 != 94) {
    return (std::basic_regex<char> *)a2;
  }
  int v18 = (std::__node<char> *)operator new(0x18uLL);
  BOOL v19 = (this->__flags_ & 0x5F0) == 1024;
  int v20 = this->__end_;
  v18[1].__vftable = (std::__node<char>_vtbl *)v20->__first_;
  int v21 = (std::__node<char>_vtbl *)&unk_26CEBD610;
LABEL_26:
  v18->__vftable = v21;
  LOBYTE(v18[2].__vftable) = v19;
  v20->__first_ = v18;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  uint64_t v9 = (std::basic_regex<char> *)(a2 + 1);
LABEL_36:
  size_t v31 = this->__marked_count_ + 1;

  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, (std::basic_regex<char> *)a3, end, marked_count + 1, v31);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v166 = 0u;
  long long v167 = 0u;
  long long v165 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_154;
  }
  *(_DWORD *)uint64_t v164 = 0;
  memset(&v164[8], 0, 85);
  std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v165);
  unint64_t v11 = *(void *)(*((void *)&v165 + 1) + 8 * (((void)v167 + *((void *)&v167 + 1)) / 0x2AuLL))
      + 96 * (((void)v167 + *((void *)&v167 + 1)) % 0x2AuLL);
  long long v12 = *(_OWORD *)&v164[16];
  *(_OWORD *)unint64_t v11 = *(_OWORD *)v164;
  *(_OWORD *)(v11 + 16) = v12;
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 32) = 0;
  memset(&v164[32], 0, 24);
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *(void *)(v11 + 72) = 0;
  memset(&v164[56], 0, 24);
  uint64_t v13 = *(void *)&v164[80];
  *(void *)(v11 + 85) = *(void *)&v164[85];
  *(void *)(v11 + 80) = v13;
  uint64_t v15 = *((void *)&v167 + 1);
  uint64_t v14 = v167;
  uint64_t v16 = ++*((void *)&v167 + 1);
  uint64_t v17 = *((void *)&v165 + 1);
  unint64_t v18 = *(unsigned int *)(a1 + 32);
  unint64_t v19 = v167 + v15;
  unint64_t v20 = 8 * (v19 / 0x2A);
  unint64_t v21 = 96 * (v19 % 0x2A);
  unint64_t v22 = *(void *)(*((void *)&v165 + 1) + v20) + v21;
  *(_DWORD *)unint64_t v22 = 0;
  *(void *)(v22 + 8) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 16) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 24) = a3;
  unint64_t v23 = *(void *)(v17 + v20) + v21;
  uint64_t v26 = *(void *)(v23 + 56);
  uint64_t v24 = (std::vector<std::pair<unsigned long, const char *>> *)(v23 + 56);
  uint64_t v25 = v26;
  unint64_t v27 = ((uint64_t)v24->__end_ - v26) >> 4;
  long long v155 = a4;
  if (v18 <= v27)
  {
    if (v18 < v27) {
      v24->__end_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)(v25 + 16 * v18);
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(v24, v18 - v27);
    uint64_t v16 = *((void *)&v167 + 1);
    uint64_t v14 = v167;
    uint64_t v17 = *((void *)&v165 + 1);
  }
  uint64_t v157 = 0;
  char v158 = 0;
  unsigned int v28 = 0;
  unint64_t v29 = v14 + v16 - 1;
  unint64_t v30 = 8 * (v29 / 0x2A);
  unint64_t v31 = 96 * (v29 % 0x2A);
  *(void *)(*(void *)(v17 + v30) + v31 + 80) = v6;
  uint64_t v163 = a3 - a2;
  unint64_t v32 = *(void *)(v17 + v30) + v31;
  *(_DWORD *)(v32 + 88) = a5;
  *(unsigned char *)(v32 + 92) = a6;
  while (2)
  {
    if ((++v28 & 0xFFF) == 0 && (int)(v28 >> 12) >= (int)v163) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    unint64_t v34 = v16 + v167 - 1;
    uint64_t v35 = *(void *)(*((void *)&v165 + 1) + 8 * (v34 / 0x2A));
    unint64_t v36 = v34 % 0x2A;
    uint64_t v37 = v35 + 96 * (v34 % 0x2A);
    uint64_t v39 = (void *)(v37 + 80);
    uint64_t v38 = *(void *)(v37 + 80);
    if (v38) {
      (*(void (**)(uint64_t, unint64_t))(*(void *)v38 + 16))(v38, v35 + 96 * v36);
    }
    switch(*(_DWORD *)v37)
    {
      case 0xFFFFFC18:
        uint64_t v40 = *(void *)(v35 + 96 * v36 + 16);
        if ((a5 & 0x20) != 0 && v40 == a2)
        {
          unint64_t v41 = *((void *)&v167 + 1) + v167 - 1;
          uint64_t v42 = *(void *)(*((void *)&v165 + 1) + 8 * (v41 / 0x2A));
          unint64_t v43 = v41 % 0x2A;
          unint64_t v44 = *(void **)(v42 + 96 * (v41 % 0x2A) + 56);
          if (v44)
          {
LABEL_22:
            *(void *)(v42 + 96 * v43 + 64) = v44;
            operator delete(v44);
          }
LABEL_23:
          unint64_t v46 = *(void **)(v42 + 96 * v43 + 32);
          if (v46)
          {
            uint64_t v47 = v42 + 96 * v43;
            goto LABEL_121;
          }
LABEL_122:
          uint64_t v120 = 42 * ((uint64_t)(v166 - *((void *)&v165 + 1)) >> 3) - 1;
          long long v121 = v167;
          --*((void *)&v167 + 1);
          if ((void)v166 == *((void *)&v165 + 1)) {
            uint64_t v120 = 0;
          }
          if ((unint64_t)(v120 - (*((void *)&v121 + 1) + v121) + 1) >= 0x54)
          {
            operator delete(*(void **)(v166 - 8));
            *(void *)&long long v166 = v166 - 8;
          }
          goto LABEL_8;
        }
        uint64_t v58 = v40 - *(void *)(v35 + 96 * v36 + 8);
        uint64_t v59 = v157;
        if ((v158 & (v157 >= v58)) == 0) {
          uint64_t v59 = v58;
        }
        if (v59 == v163)
        {
          unint64_t v60 = (void **)*((void *)&v165 + 1);
          if ((void)v166 == *((void *)&v165 + 1))
          {
            *((void *)&v167 + 1) = 0;
            unint64_t v64 = 0;
          }
          else
          {
            unint64_t v61 = (void *)(*((void *)&v165 + 1) + 8 * ((unint64_t)v167 / 0x2A));
            long long v62 = (void *)(*v61 + 96 * ((unint64_t)v167 % 0x2A));
            unint64_t v63 = *(void *)(*((void *)&v165 + 1) + 8 * ((*((void *)&v167 + 1) + (void)v167) / 0x2AuLL))
                + 96 * ((*((void *)&v167 + 1) + (void)v167) % 0x2AuLL);
            if (v62 == (void *)v63)
            {
              *((void *)&v167 + 1) = 0;
              unint64_t v64 = v166 - *((void *)&v165 + 1);
              if ((void)v166 - *((void *)&v165 + 1) >= 0x11uLL) {
                goto LABEL_42;
              }
            }
            else
            {
              do
              {
                int v66 = (void *)v62[7];
                if (v66)
                {
                  v62[8] = v66;
                  operator delete(v66);
                }
                char v67 = (void *)v62[4];
                if (v67)
                {
                  v62[5] = v67;
                  operator delete(v67);
                }
                v62 += 12;
                if ((void *)((char *)v62 - *v61) == (void *)4032)
                {
                  size_t v68 = (void *)v61[1];
                  ++v61;
                  long long v62 = v68;
                }
              }
              while (v62 != (void *)v63);
              unint64_t v60 = (void **)*((void *)&v165 + 1);
              *((void *)&v167 + 1) = 0;
              unint64_t v64 = v166 - *((void *)&v165 + 1);
              if ((void)v166 - *((void *)&v165 + 1) >= 0x11uLL)
              {
                do
                {
LABEL_42:
                  operator delete(*v60);
                  unint64_t v60 = (void **)(*((void *)&v165 + 1) + 8);
                  *((void *)&v165 + 1) = v60;
                  unint64_t v64 = v166 - (void)v60;
                }
                while ((void)v166 - (void)v60 > 0x10uLL);
              }
            }
          }
          if (v64 >> 3 == 1)
          {
            uint64_t v65 = 21;
LABEL_79:
            *(void *)&long long v167 = v65;
          }
          else if (v64 >> 3 == 2)
          {
            uint64_t v65 = 42;
            goto LABEL_79;
          }
          char v158 = 1;
          uint64_t v157 = v163;
          goto LABEL_8;
        }
        uint64_t v157 = v59;
        unint64_t v74 = *((void *)&v167 + 1) + v167 - 1;
        uint64_t v75 = *(void *)(*((void *)&v165 + 1) + 8 * (v74 / 0x2A));
        unint64_t v76 = v74 % 0x2A;
        char v77 = *(void **)(v75 + 96 * (v74 % 0x2A) + 56);
        if (v77)
        {
          *(void *)(v75 + 96 * v76 + 64) = v77;
          operator delete(v77);
        }
        size_t v78 = *(void **)(v75 + 96 * v76 + 32);
        if (v78)
        {
          *(void *)(v75 + 96 * v76 + 40) = v78;
          operator delete(v78);
        }
        uint64_t v79 = 42 * ((uint64_t)(v166 - *((void *)&v165 + 1)) >> 3) - 1;
        long long v80 = v167;
        --*((void *)&v167 + 1);
        if ((void)v166 == *((void *)&v165 + 1)) {
          uint64_t v79 = 0;
        }
        if ((unint64_t)(v79 - (*((void *)&v80 + 1) + v80) + 1) >= 0x54)
        {
          operator delete(*(void **)(v166 - 8));
          *(void *)&long long v166 = v166 - 8;
        }
        char v158 = 1;
LABEL_8:
        uint64_t v16 = *((void *)&v167 + 1);
        if (*((void *)&v167 + 1)) {
          continue;
        }
        if ((v158 & 1) == 0)
        {
          uint64_t v6 = 0;
          uint64_t v148 = (void **)*((void *)&v165 + 1);
          uint64_t v149 = (void **)v166;
          *((void *)&v167 + 1) = 0;
          unint64_t v150 = v166 - *((void *)&v165 + 1);
          if ((void)v166 - *((void *)&v165 + 1) < 0x11uLL) {
            goto LABEL_156;
          }
          goto LABEL_155;
        }
        uint64_t v147 = *v155;
        *(void *)uint64_t v147 = a2;
        *(void *)(v147 + 8) = a2 + v157;
        uint64_t v6 = 1;
        *(unsigned char *)(v147 + 16) = 1;
LABEL_154:
        uint64_t v148 = (void **)*((void *)&v165 + 1);
        uint64_t v149 = (void **)v166;
        *((void *)&v167 + 1) = 0;
        unint64_t v150 = v166 - *((void *)&v165 + 1);
        if ((void)v166 - *((void *)&v165 + 1) < 0x11uLL) {
          goto LABEL_156;
        }
        do
        {
LABEL_155:
          operator delete(*v148);
          uint64_t v149 = (void **)v166;
          uint64_t v148 = (void **)(*((void *)&v165 + 1) + 8);
          *((void *)&v165 + 1) = v148;
          unint64_t v150 = v166 - (void)v148;
        }
        while ((void)v166 - (void)v148 > 0x10uLL);
LABEL_156:
        unint64_t v151 = v150 >> 3;
        if (v151 == 1)
        {
          uint64_t v152 = 21;
          goto LABEL_160;
        }
        if (v151 == 2)
        {
          uint64_t v152 = 42;
LABEL_160:
          *(void *)&long long v167 = v152;
        }
        if (v148 != v149)
        {
          do
          {
            v153 = *v148++;
            operator delete(v153);
          }
          while (v148 != v149);
          if ((void)v166 != *((void *)&v165 + 1)) {
            *(void *)&long long v166 = v166 + ((*((void *)&v165 + 1) - v166 + 7) & 0xFFFFFFFFFFFFFFF8);
          }
        }
        if ((void)v165) {
          operator delete((void *)v165);
        }
        return v6;
      case 0xFFFFFC19:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_8;
      case 0xFFFFFC1D:
        unint64_t v55 = v167;
        uint64_t v56 = (char *)*((void *)&v165 + 1);
        unint64_t v57 = (char *)v166;
        if ((void)v167) {
          goto LABEL_113;
        }
        unint64_t v69 = (uint64_t)(v166 - *((void *)&v165 + 1)) >> 3;
        uint64_t v70 = 42 * v69 - 1;
        if ((void)v166 == *((void *)&v165 + 1)) {
          uint64_t v70 = 0;
        }
        if ((unint64_t)(v70 - *((void *)&v167 + 1)) >= 0x2A)
        {
          *(void *)&long long v167 = 42;
          std::vector<std::string>::pointer v72 = (char *)(v166 - 8);
          uint64_t v71 = *(void *)(v166 - 8);
          *(void *)&long long v166 = v166 - 8;
          if (*((void *)&v165 + 1) == (void)v165)
          {
            if ((unint64_t)v72 >= *((void *)&v166 + 1))
            {
              if (*((void *)&v166 + 1) == *((void *)&v165 + 1)) {
                unint64_t v89 = 1;
              }
              else {
                unint64_t v89 = (uint64_t)(*((void *)&v166 + 1) - *((void *)&v165 + 1)) >> 2;
              }
              if (v89 >> 61) {
                goto LABEL_172;
              }
              int v90 = (char *)operator new(8 * v89);
              unint64_t v91 = (v89 + 3) >> 2;
              uint64_t v73 = &v90[8 * v91];
              size_t v92 = v73;
              int64_t v93 = v72 - v56;
              if (v72 != v56)
              {
                size_t v92 = &v73[v93 & 0xFFFFFFFFFFFFFFF8];
                unint64_t v94 = v93 - 8;
                int v95 = &v90[8 * v91];
                int64_t v96 = v56;
                if (v94 < 0x38) {
                  goto LABEL_175;
                }
                uint64_t v97 = 8 * v91;
                int v95 = &v90[8 * v91];
                int64_t v96 = v56;
                if ((unint64_t)(v95 - v56) < 0x20) {
                  goto LABEL_175;
                }
                uint64_t v98 = (v94 >> 3) + 1;
                uint64_t v99 = 8 * (v98 & 0x3FFFFFFFFFFFFFFCLL);
                int v95 = &v73[v99];
                int64_t v96 = &v56[v99];
                uint64_t v100 = (long long *)(v56 + 16);
                uint64_t v101 = &v90[v97 + 16];
                uint64_t v102 = v98 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  long long v103 = *v100;
                  *((_OWORD *)v101 - 1) = *(v100 - 1);
                  *(_OWORD *)uint64_t v101 = v103;
                  v100 += 2;
                  v101 += 32;
                  v102 -= 4;
                }
                while (v102);
                if (v98 != (v98 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_175:
                  do
                  {
                    uint64_t v104 = *(void *)v96;
                    v96 += 8;
                    *(void *)int v95 = v104;
                    v95 += 8;
                  }
                  while (v95 != v92);
                }
              }
              *(void *)&long long v165 = v90;
              *((void *)&v165 + 1) = v73;
              *(void *)&long long v166 = v92;
              *((void *)&v166 + 1) = &v90[8 * v89];
              if (v56)
              {
                operator delete(v56);
                uint64_t v73 = (char *)*((void *)&v165 + 1);
              }
            }
            else
            {
              uint64_t v84 = (uint64_t)(*((void *)&v166 + 1) - (void)v72) >> 3;
              if (v84 >= -1) {
                uint64_t v85 = v84 + 1;
              }
              else {
                uint64_t v85 = v84 + 2;
              }
              uint64_t v86 = v85 >> 1;
              unint64_t v87 = &v72[8 * (v85 >> 1)];
              uint64_t v73 = (char *)(v87 - &v72[-*((void *)&v165 + 1)]);
              if (v72 != *((char **)&v165 + 1))
              {
                memmove((void *)(v87 - &v72[-*((void *)&v165 + 1)]), *((const void **)&v165 + 1), (size_t)&v72[-*((void *)&v165 + 1)]);
                uint64_t v56 = (char *)v166;
              }
              *((void *)&v165 + 1) = v73;
              *(void *)&long long v166 = &v56[8 * v86];
            }
          }
          else
          {
            uint64_t v73 = (char *)*((void *)&v165 + 1);
          }
          *((void *)v73 - 1) = v71;
          uint64_t v56 = (char *)(*((void *)&v165 + 1) - 8);
          *((void *)&v165 + 1) -= 8;
          goto LABEL_112;
        }
        if (v69 < (uint64_t)(*((void *)&v166 + 1) - v165) >> 3)
        {
          if (*((void *)&v165 + 1) == (void)v165)
          {
            *(void *)uint64_t v164 = operator new(0xFC0uLL);
            std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)&v165, v164);
            *(void *)uint64_t v164 = *(void *)(v166 - 8);
            *(void *)&long long v166 = v166 - 8;
          }
          else
          {
            *(void *)uint64_t v164 = operator new(0xFC0uLL);
          }
          std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)&v165, v164);
          uint64_t v56 = (char *)*((void *)&v165 + 1);
          uint64_t v88 = 21;
          if ((void)v166 - *((void *)&v165 + 1) != 8) {
            uint64_t v88 = v167 + 42;
          }
          *(void *)&long long v167 = v88;
LABEL_112:
          unint64_t v55 = v167;
          unint64_t v57 = (char *)v166;
LABEL_113:
          char v109 = &v56[8 * (v55 / 0x2A)];
          uint64_t v110 = *(void *)v109 + 96 * (v55 % 0x2A);
          if (v57 == v56) {
            uint64_t v110 = 0;
          }
          if (v110 == *(void *)v109) {
            uint64_t v110 = *((void *)v109 - 1) + 4032;
          }
          long long v111 = *(_OWORD *)(v37 + 16);
          *(_OWORD *)(v110 - 96) = *(_OWORD *)v37;
          *(_OWORD *)(v110 - 80) = v111;
          uint64_t v112 = v35 + 96 * v36;
          *(void *)(v110 - 56) = 0;
          *(void *)(v110 - 48) = 0;
          *(void *)(v110 - 64) = 0;
          *(_OWORD *)(v110 - 64) = *(_OWORD *)(v112 + 32);
          *(void *)(v110 - 48) = *(void *)(v112 + 48);
          *(void *)(v112 + 32) = 0;
          *(void *)(v112 + 40) = 0;
          *(void *)(v112 + 48) = 0;
          *(void *)(v110 - 40) = 0;
          *(void *)(v110 - 32) = 0;
          *(void *)(v110 - 24) = 0;
          *(_OWORD *)(v110 - 40) = *(_OWORD *)(v112 + 56);
          *(void *)(v110 - 24) = *(void *)(v112 + 72);
          *(void *)(v112 + 56) = 0;
          *(void *)(v112 + 64) = 0;
          *(void *)(v112 + 72) = 0;
          uint64_t v113 = *v39;
          *(void *)(v110 - 11) = *(void *)(v37 + 85);
          *(void *)(v110 - 16) = v113;
          uint64_t v114 = *((void *)&v167 + 1);
          *(void *)&long long v167 = v167 - 1;
          ++*((void *)&v167 + 1);
          uint64_t v115 = v114 + v167;
          unint64_t v116 = (v114 + (uint64_t)v167) / 0x2AuLL;
          uint64_t v117 = *(void *)(*((void *)&v165 + 1) + 8 * v116);
          uint64_t v118 = v115 - 42 * v116;
          v119 = *(void **)(v117 + 96 * v118 + 56);
          if (v119)
          {
            *(void *)(v117 + 96 * v118 + 64) = v119;
            operator delete(v119);
          }
          unint64_t v46 = *(void **)(v117 + 96 * v118 + 32);
          if (v46)
          {
            uint64_t v47 = v117 + 96 * v118;
LABEL_121:
            *(void *)(v47 + 40) = v46;
            operator delete(v46);
          }
          goto LABEL_122;
        }
        if (*((void *)&v166 + 1) == (void)v165) {
          unint64_t v81 = 1;
        }
        else {
          unint64_t v81 = (uint64_t)(*((void *)&v166 + 1) - v165) >> 2;
        }
        if (v81 >> 61) {
LABEL_172:
        }
          std::__throw_bad_array_new_length[abi:ne180100]();
        unint64_t v82 = (char *)operator new(8 * v81);
        unint64_t v160 = operator new(0xFC0uLL);
        if (v81)
        {
          std::string::size_type v83 = &v82[8 * v81];
        }
        else
        {
          int v105 = (char *)operator new(8uLL);
          std::string::size_type v83 = v105 + 8;
          operator delete(v82);
          uint64_t v56 = (char *)*((void *)&v165 + 1);
          unint64_t v57 = (char *)v166;
          unint64_t v82 = v105;
        }
        *(void *)unint64_t v82 = v160;
        char v106 = v82 + 8;
        size_t v161 = v82;
        uint64_t v156 = v35;
        if (v56 == v57)
        {
LABEL_108:
          uint64_t v107 = (void *)v165;
          *(void *)&long long v165 = v161;
          *((void *)&v165 + 1) = v82;
          *(void *)&long long v166 = v106;
          *((void *)&v166 + 1) = v83;
          uint64_t v108 = v167 + 42;
          if (v106 - v82 == 8) {
            uint64_t v108 = 21;
          }
          *(void *)&long long v167 = v108;
          uint64_t v56 = v82;
          if (v107)
          {
            operator delete(v107);
            uint64_t v56 = (char *)*((void *)&v165 + 1);
          }
          goto LABEL_112;
        }
        break;
      case 0xFFFFFC1F:
        unint64_t v45 = *((void *)&v167 + 1) + v167 - 1;
        uint64_t v42 = *(void *)(*((void *)&v165 + 1) + 8 * (v45 / 0x2A));
        unint64_t v43 = v45 % 0x2A;
        unint64_t v44 = *(void **)(v42 + 96 * (v45 % 0x2A) + 56);
        if (v44) {
          goto LABEL_22;
        }
        goto LABEL_23;
      case 0xFFFFFC20:
        *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v164[64] = v48;
        *(_OWORD *)&v164[80] = v48;
        *(_OWORD *)&v164[32] = v48;
        *(_OWORD *)&v164[48] = v48;
        *(_OWORD *)uint64_t v164 = v48;
        *(_OWORD *)&v164[16] = v48;
        std::__state<char>::__state((uint64_t)v164, (long long *)(v35 + 96 * v36));
        (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v39 + 24))(*v39, 1, v35 + 96 * v36);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v164[80] + 24))(*(void *)&v164[80], 0, v164);
        uint64_t v49 = *((void *)&v165 + 1);
        if ((void)v166 == *((void *)&v165 + 1)) {
          uint64_t v50 = 0;
        }
        else {
          uint64_t v50 = 42 * ((uint64_t)(v166 - *((void *)&v165 + 1)) >> 3) - 1;
        }
        unint64_t v51 = *((void *)&v167 + 1) + v167;
        if (v50 == *((void *)&v167 + 1) + (void)v167)
        {
          std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v165);
          uint64_t v49 = *((void *)&v165 + 1);
          unint64_t v51 = *((void *)&v167 + 1) + v167;
        }
        unint64_t v52 = *(void *)(v49 + 8 * (v51 / 0x2A)) + 96 * (v51 % 0x2A);
        long long v53 = *(_OWORD *)&v164[16];
        *(_OWORD *)unint64_t v52 = *(_OWORD *)v164;
        *(_OWORD *)(v52 + 16) = v53;
        *(void *)(v52 + 40) = 0;
        *(void *)(v52 + 48) = 0;
        *(void *)(v52 + 32) = 0;
        *(_OWORD *)(v52 + 32) = *(_OWORD *)&v164[32];
        *(void *)(v52 + 48) = *(void *)&v164[48];
        memset(&v164[32], 0, 24);
        *(void *)(v52 + 56) = 0;
        *(void *)(v52 + 64) = 0;
        *(void *)(v52 + 72) = 0;
        *(_OWORD *)(v52 + 56) = *(_OWORD *)&v164[56];
        *(void *)(v52 + 72) = *(void *)&v164[72];
        memset(&v164[56], 0, 24);
        uint64_t v54 = *(void *)&v164[80];
        *(void *)(v52 + 85) = *(void *)&v164[85];
        *(void *)(v52 + 80) = v54;
        ++*((void *)&v167 + 1);
        if (*(void *)&v164[56])
        {
          *(void *)&v164[64] = *(void *)&v164[56];
          operator delete(*(void **)&v164[56]);
        }
        if (*(void *)&v164[32])
        {
          *(void *)&v164[40] = *(void *)&v164[32];
          operator delete(*(void **)&v164[32]);
        }
        goto LABEL_8;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    break;
  }
  while (v106 != v83)
  {
    unint64_t v122 = v82;
LABEL_127:
    uint64_t v123 = *(void *)v56;
    v56 += 8;
    *(void *)char v106 = v123;
    v106 += 8;
    unint64_t v82 = v122;
    if (v56 == (char *)v166) {
      goto LABEL_108;
    }
  }
  if (v82 > v161)
  {
    uint64_t v124 = (v82 - v161) >> 3;
    if (v124 >= -1) {
      uint64_t v125 = v124 + 1;
    }
    else {
      uint64_t v125 = v124 + 2;
    }
    uint64_t v126 = v125 >> 1;
    uint64_t v127 = &v82[-8 * (v125 >> 1)];
    uint64_t v128 = v106;
    if (v106 != v82)
    {
      memmove(v127, v82, v106 - v82);
      uint64_t v128 = v82;
    }
    uint64_t v129 = -v126;
    std::string::size_type v83 = v106;
    char v106 = &v127[v106 - v82];
    unint64_t v122 = &v128[8 * v129];
    uint64_t v35 = v156;
    goto LABEL_127;
  }
  if (v106 == v161) {
    unint64_t v130 = 1;
  }
  else {
    unint64_t v130 = (v106 - v161) >> 2;
  }
  if (v130 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  v131 = (char *)operator new(8 * v130);
  unint64_t v132 = v130 >> 2;
  unint64_t v122 = &v131[8 * (v130 >> 2)];
  int64_t v134 = v106 - v82;
  BOOL v133 = v106 == v82;
  char v106 = v122;
  if (!v133)
  {
    char v106 = &v122[v134 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v135 = v134 - 8;
    if (v135 >= 0x38 && (uint64_t v136 = 8 * v132, (unint64_t)(&v131[8 * v132] - v82) >= 0x20))
    {
      uint64_t v141 = (v135 >> 3) + 1;
      uint64_t v142 = 8 * (v141 & 0x3FFFFFFFFFFFFFFCLL);
      BOOL v137 = &v122[v142];
      BOOL v138 = &v82[v142];
      size_t v143 = (long long *)(v82 + 16);
      size_t v144 = &v131[v136 + 16];
      uint64_t v145 = v141 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v146 = *v143;
        *((_OWORD *)v144 - 1) = *(v143 - 1);
        *(_OWORD *)size_t v144 = v146;
        v143 += 2;
        v144 += 32;
        v145 -= 4;
      }
      while (v145);
      if (v141 == (v141 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_145;
      }
    }
    else
    {
      BOOL v137 = &v131[8 * (v130 >> 2)];
      BOOL v138 = v82;
    }
    do
    {
      uint64_t v139 = *(void *)v138;
      v138 += 8;
      *(void *)BOOL v137 = v139;
      v137 += 8;
    }
    while (v137 != v106);
  }
LABEL_145:
  std::string::size_type v83 = &v131[8 * v130];
  if (v161)
  {
    unint64_t v140 = v131;
    operator delete(v161);
    size_t v161 = v140;
  }
  else
  {
    size_t v161 = v131;
  }
  goto LABEL_127;
}

void sub_21DE1377C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p)
{
  operator delete(__p);
  operator delete(v16);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v17 - 144);
  _Unwind_Resume(a1);
}

void sub_21DE137A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  operator delete(v16);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v17 - 144);
  _Unwind_Resume(a1);
}

void sub_21DE137C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19)
{
  std::deque<std::__state<char>>::~deque[abi:ne180100](v19 - 144);
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v125 = 0;
  uint64_t v126 = 0;
  unint64_t v127 = 0;
  *(_DWORD *)&v124[36] = -1431655766;
  *(void *)unint64_t v122 = 0xAAAAAAAA00000000;
  memset(&v122[8], 0, 32);
  *(_OWORD *)uint64_t v123 = 0u;
  memset(v124, 0, 36);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6)
  {
    uint64_t v15 = 0;
    uint64_t v16 = *(void **)v124;
    if (!*(void *)v124) {
      goto LABEL_149;
    }
    goto LABEL_148;
  }
  __x.second = a3;
  *(void *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.first = a3;
  *(_DWORD *)uint64_t v120 = 0;
  memset(&v120[8], 0, 85);
  unint64_t v11 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v125, (uint64_t)v120);
  uint64_t v126 = v11;
  if (*(void *)&v120[56]) {
    operator delete(*(void **)&v120[56]);
  }
  if (*(void *)&v120[32]) {
    operator delete(*(void **)&v120[32]);
  }
  uint64_t v12 = *((void *)v11 - 8);
  *((_DWORD *)v11 - 24) = 0;
  *((void *)v11 - 11) = a2;
  *((void *)v11 - 10) = a2;
  *((void *)v11 - 9) = a3;
  unint64_t v13 = *(unsigned int *)(a1 + 28);
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v11 - 7) - v12) >> 3);
  if (v13 <= v14)
  {
    if (v13 < v14) {
      *((void *)v11 - 7) = v12 + 24 * v13;
    }
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v11 - 64), v13 - v14, &__x);
  }
  uint64_t v17 = *((void *)v11 - 5);
  unint64_t v18 = *(unsigned int *)(a1 + 32);
  unint64_t v19 = (*((void *)v11 - 4) - v17) >> 4;
  if (v18 <= v19)
  {
    if (v18 < v19) {
      *((void *)v11 - 4) = v17 + 16 * v18;
    }
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v11 - 40), v18 - v19);
  }
  uint64_t v117 = a4;
  unint64_t v20 = 0;
  char v21 = 0;
  unsigned int v22 = 0;
  unint64_t v23 = &a3[-a2];
  *((void *)v11 - 2) = v6;
  *((_DWORD *)v11 - 2) = a5;
  *(v11 - 4) = a6;
  while (2)
  {
    BOOL v24 = (++v22 & 0xFFF) != 0 || (int)(v22 >> 12) < (int)v23;
    if (!v24) {
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    }
    uint64_t v26 = v11 - 16;
    uint64_t v25 = *((void *)v11 - 2);
    unint64_t v27 = v11 - 96;
    if (v25) {
      (*(void (**)(uint64_t, char *))(*(void *)v25 + 16))(v25, v11 - 96);
    }
    switch(*(_DWORD *)v27)
    {
      case 0xFFFFFC18:
        uint64_t v28 = *((void *)v11 - 10);
        if ((a5 & 0x20) != 0 && v28 == a2) {
          goto LABEL_29;
        }
        unint64_t v36 = (const char *)(v28 - *((void *)v11 - 11));
        if ((v21 & ((uint64_t)v20 >= (uint64_t)v36)) != 0) {
          goto LABEL_95;
        }
        long long v37 = *((_OWORD *)v11 - 5);
        *(_OWORD *)unint64_t v122 = *(_OWORD *)v27;
        *(_OWORD *)&v122[16] = v37;
        if (v122 == v27) {
          goto LABEL_94;
        }
        uint64_t v39 = (char *)*((void *)v11 - 8);
        uint64_t v38 = (char *)*((void *)v11 - 7);
        unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * ((v38 - v39) >> 3);
        uint64_t v41 = (uint64_t)v123[1];
        uint64_t v42 = *(char **)&v122[32];
        if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v123[1] - *(void *)&v122[32]) >> 3) >= v40)
        {
          uint64_t v47 = (char *)v123[0];
          if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v123[0] - *(void *)&v122[32]) >> 3) >= v40)
          {
            uint64_t v54 = *(void *)&v122[32];
            if (v39 != v38)
            {
              uint64_t v55 = *(void *)&v122[32];
              do
              {
                *(_OWORD *)uint64_t v55 = *(_OWORD *)v39;
                *(unsigned char *)(v55 + 16) = v39[16];
                v54 += 24;
                v39 += 24;
                v55 += 24;
              }
              while (v39 != v38);
            }
            uint64_t v49 = v54 - (void)v42;
            uint64_t v47 = v42;
          }
          else
          {
            uint64_t v50 = &v39[8 * (((uint64_t)v123[0] - *(void *)&v122[32]) >> 3)];
            if (v123[0] != *(void **)&v122[32])
            {
              do
              {
                *(_OWORD *)uint64_t v42 = *(_OWORD *)v39;
                v42[16] = v39[16];
                v39 += 24;
                v42 += 24;
              }
              while (v39 != v50);
            }
            unint64_t v51 = v47;
            if (v50 != v38)
            {
              unint64_t v52 = v47;
              do
              {
                long long v53 = *(_OWORD *)v50;
                *((void *)v52 + 2) = *((void *)v50 + 2);
                *(_OWORD *)unint64_t v52 = v53;
                v52 += 24;
                v50 += 24;
                v51 += 24;
              }
              while (v50 != v38);
            }
            uint64_t v49 = v51 - v47;
          }
        }
        else
        {
          if (*(void *)&v122[32])
          {
            v123[0] = *(void **)&v122[32];
            operator delete(*(void **)&v122[32]);
            uint64_t v41 = 0;
            *(void *)&v122[32] = 0;
            *(_OWORD *)uint64_t v123 = 0uLL;
          }
          if (v40 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_156;
          }
          unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * (v41 >> 3);
          uint64_t v44 = 2 * v43;
          if (2 * v43 <= v40) {
            uint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((v38 - v39) >> 3);
          }
          unint64_t v45 = v43 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v44;
          if (v45 > 0xAAAAAAAAAAAAAAALL) {
LABEL_156:
          }
            std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
          unint64_t v46 = (char *)operator new(24 * v45);
          uint64_t v47 = v46;
          *(void *)&v122[32] = v46;
          v123[0] = v46;
          v123[1] = &v46[24 * v45];
          long long v48 = v46;
          if (v39 != v38)
          {
            memcpy(v46, v39, 24 * ((v38 - v39 - 24) / 0x18uLL) + 24);
            long long v48 = &v47[24 * ((v38 - v39 - 24) / 0x18uLL) + 24];
          }
          uint64_t v49 = v48 - v47;
        }
        v123[0] = &v47[v49];
        uint64_t v56 = (char *)*((void *)v11 - 5);
        unint64_t v57 = (char *)*((void *)v11 - 4);
        int64_t v58 = v57 - v56;
        unint64_t v59 = (v57 - v56) >> 4;
        uint64_t v60 = *(void *)&v124[16];
        unint64_t v61 = *(char **)v124;
        if (v59 <= (uint64_t)(*(void *)&v124[16] - *(void *)v124) >> 4)
        {
          uint64_t v65 = *(char **)&v124[8];
          uint64_t v68 = *(void *)&v124[8] - *(void *)v124;
          unint64_t v69 = (uint64_t)(*(void *)&v124[8] - *(void *)v124) >> 4;
          if (v69 < v59)
          {
            uint64_t v70 = &v56[16 * v69];
            if (*(void *)&v124[8] != *(void *)v124)
            {
              unint64_t v71 = v68 - 16;
              if ((unint64_t)(v68 - 16) < 0xD0) {
                goto LABEL_159;
              }
              unint64_t v84 = v68 & 0xFFFFFFFFFFFFFFF0;
              unint64_t v85 = *(void *)v124 + 8 + v84 - 16;
              unint64_t v86 = (unint64_t)&v56[v84 - 8];
              BOOL v87 = *(void *)v124 + 8 >= (unint64_t)&v56[v84]
                 || (unint64_t)(v56 + 8) >= *(void *)v124 + v84;
              BOOL v88 = !v87;
              if ((unint64_t)v56 < v85 && *(void *)v124 < v86) {
                goto LABEL_159;
              }
              if (v88) {
                goto LABEL_159;
              }
              uint64_t v90 = (v71 >> 4) + 1;
              uint64_t v91 = 16 * (v90 & 0x1FFFFFFFFFFFFFFCLL);
              size_t v92 = (char *)(*(void *)v124 + v91);
              int64_t v93 = &v56[v91];
              unint64_t v94 = (const double *)(v56 + 32);
              int v95 = (double *)(*(void *)v124 + 32);
              uint64_t v96 = v90 & 0x1FFFFFFFFFFFFFFCLL;
              do
              {
                uint64_t v97 = v94 - 4;
                float64x2x2_t v128 = vld2q_f64(v97);
                float64x2x2_t v130 = vld2q_f64(v94);
                uint64_t v98 = v95 - 4;
                vst2q_f64(v98, v128);
                vst2q_f64(v95, v130);
                v94 += 8;
                v95 += 8;
                v96 -= 4;
              }
              while (v96);
              unint64_t v61 = v92;
              uint64_t v56 = v93;
              if (v90 != (v90 & 0x1FFFFFFFFFFFFFFCLL))
              {
LABEL_159:
                do
                {
                  *(void *)unint64_t v61 = *(void *)v56;
                  *((void *)v61 + 1) = *((void *)v56 + 1);
                  v56 += 16;
                  v61 += 16;
                }
                while (v56 != v70);
              }
            }
            std::vector<std::string>::pointer v72 = v65;
            if (v70 != v57)
            {
              uint64_t v73 = v65;
              do
              {
                long long v74 = *(_OWORD *)v70;
                v70 += 16;
                *(_OWORD *)uint64_t v73 = v74;
                v73 += 16;
                v72 += 16;
              }
              while (v70 != v57);
            }
            int64_t v67 = v72 - v65;
            goto LABEL_93;
          }
          if (v56 == v57)
          {
            unint64_t v76 = *(char **)v124;
          }
          else
          {
            unint64_t v75 = v58 - 16;
            if ((unint64_t)(v58 - 16) >= 0xD0)
            {
              BOOL v100 = *(void *)v124 + 8 < (unint64_t)&v56[(v75 & 0xFFFFFFFFFFFFFFF0) + 16]
                  && (unint64_t)(v56 + 8) < *(void *)v124 + (v75 & 0xFFFFFFFFFFFFFFF0) + 16;
              unint64_t v76 = *(char **)v124;
              if (((unint64_t)v56 >= *(void *)v124 + 8 + (v75 & 0xFFFFFFFFFFFFFFF0)
                 || *(void *)v124 >= (unint64_t)&v56[(v75 & 0xFFFFFFFFFFFFFFF0) + 8])
                && !v100)
              {
                uint64_t v102 = (v75 >> 4) + 1;
                uint64_t v103 = 16 * (v102 & 0x1FFFFFFFFFFFFFFCLL);
                unint64_t v76 = (char *)(*(void *)v124 + v103);
                uint64_t v104 = &v56[v103];
                int v105 = (const double *)(v56 + 32);
                char v106 = (double *)(*(void *)v124 + 32);
                uint64_t v107 = v102 & 0x1FFFFFFFFFFFFFFCLL;
                do
                {
                  uint64_t v108 = v105 - 4;
                  float64x2x2_t v129 = vld2q_f64(v108);
                  float64x2x2_t v131 = vld2q_f64(v105);
                  char v109 = v106 - 4;
                  vst2q_f64(v109, v129);
                  vst2q_f64(v106, v131);
                  v105 += 8;
                  v106 += 8;
                  v107 -= 4;
                }
                while (v107);
                uint64_t v56 = v104;
                if (v102 == (v102 & 0x1FFFFFFFFFFFFFFCLL)) {
                  goto LABEL_92;
                }
              }
            }
            else
            {
              unint64_t v76 = *(char **)v124;
            }
            do
            {
              *(void *)unint64_t v76 = *(void *)v56;
              *((void *)v76 + 1) = *((void *)v56 + 1);
              v76 += 16;
              v56 += 16;
            }
            while (v56 != v57);
          }
LABEL_92:
          int64_t v67 = v76 - v61;
          uint64_t v65 = v61;
          goto LABEL_93;
        }
        if (*(void *)v124)
        {
          *(void *)&v124[8] = *(void *)v124;
          operator delete(*(void **)v124);
          uint64_t v60 = 0;
          memset(v124, 0, 24);
        }
        if (v58 < 0) {
          goto LABEL_155;
        }
        uint64_t v62 = v60 >> 3;
        if (v60 >> 3 <= v59) {
          uint64_t v62 = (v57 - v56) >> 4;
        }
        unint64_t v63 = (unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v62;
        if (v63 >> 60) {
LABEL_155:
        }
          std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
        unint64_t v64 = (char *)operator new(16 * v63);
        uint64_t v65 = v64;
        *(void *)uint64_t v124 = v64;
        *(void *)&v124[8] = v64;
        *(void *)&v124[16] = &v64[16 * v63];
        int v66 = v64;
        if (v56 != v57)
        {
          memcpy(v64, v56, v58 & 0xFFFFFFFFFFFFFFF0);
          int v66 = &v65[v58 & 0xFFFFFFFFFFFFFFF0];
        }
        int64_t v67 = v66 - v65;
LABEL_93:
        *(void *)&v124[8] = &v65[v67];
LABEL_94:
        uint64_t v77 = *(void *)v26;
        *(void *)&v124[29] = *(void *)(v26 + 5);
        *(void *)&v124[24] = v77;
        unint64_t v20 = v36;
LABEL_95:
        size_t v78 = v126;
        if (v20 == v23)
        {
          uint64_t v79 = v125;
          while (v78 != v79)
          {
            long long v80 = (void *)*((void *)v78 - 5);
            if (v80)
            {
              *((void *)v78 - 4) = v80;
              operator delete(v80);
            }
            unint64_t v81 = (void *)*((void *)v78 - 8);
            if (v81)
            {
              *((void *)v78 - 7) = v81;
              operator delete(v81);
            }
            v78 -= 96;
          }
          uint64_t v126 = v79;
          char v21 = 1;
          unint64_t v20 = v23;
        }
        else
        {
          unint64_t v82 = (void *)*((void *)v126 - 5);
          if (v82)
          {
            *((void *)v126 - 4) = v82;
            operator delete(v82);
          }
          std::string::size_type v83 = (void *)*((void *)v78 - 8);
          if (v83)
          {
            *((void *)v78 - 7) = v83;
            operator delete(v83);
          }
          uint64_t v126 = v78 - 96;
          char v21 = 1;
        }
LABEL_18:
        uint64_t v15 = v125;
        unint64_t v11 = v126;
        if (v125 != v126) {
          continue;
        }
        if ((v21 & 1) == 0)
        {
          uint64_t v6 = 0;
          uint64_t v16 = *(void **)v124;
          if (!*(void *)v124) {
            goto LABEL_149;
          }
          goto LABEL_148;
        }
        uint64_t v110 = *v117;
        *(void *)uint64_t v110 = a2;
        *(void *)(v110 + 8) = &v20[a2];
        *(unsigned char *)(v110 + 16) = 1;
        if (v123[0] != *(void **)&v122[32])
        {
          unint64_t v111 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v123[0] - *(void *)&v122[32]) >> 3);
          uint64_t v112 = (unsigned char *)(*(void *)&v122[32] + 16);
          unsigned int v113 = 1;
          do
          {
            uint64_t v114 = v110 + 24 * v113;
            *(_OWORD *)uint64_t v114 = *((_OWORD *)v112 - 1);
            char v115 = *v112;
            v112 += 24;
            *(unsigned char *)(v114 + 16) = v115;
            BOOL v24 = v111 > v113++;
          }
          while (v24);
        }
        uint64_t v6 = 1;
        uint64_t v16 = *(void **)v124;
        if (*(void *)v124)
        {
LABEL_148:
          *(void *)&v124[8] = v16;
          operator delete(v16);
        }
LABEL_149:
        if (*(void *)&v122[32])
        {
          v123[0] = *(void **)&v122[32];
          operator delete(*(void **)&v122[32]);
        }
        if (v15) {
          operator delete(v15);
        }
        return v6;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_18;
      case 0xFFFFFC1F:
LABEL_29:
        unint64_t v29 = v126;
        unint64_t v30 = (void *)*((void *)v126 - 5);
        if (v30)
        {
          *((void *)v126 - 4) = v30;
          operator delete(v30);
        }
        unint64_t v31 = (void *)*((void *)v29 - 8);
        if (v31)
        {
          *((void *)v29 - 7) = v31;
          operator delete(v31);
        }
        uint64_t v126 = v29 - 96;
        goto LABEL_18;
      case 0xFFFFFC20:
        *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v120[64] = v32;
        *(_OWORD *)&v120[80] = v32;
        *(_OWORD *)&v120[32] = v32;
        *(_OWORD *)&v120[48] = v32;
        *(_OWORD *)uint64_t v120 = v32;
        *(_OWORD *)&v120[16] = v32;
        std::__state<char>::__state((uint64_t)v120, (long long *)v11 - 6);
        (*(void (**)(void, uint64_t, char *))(**(void **)v26 + 24))(*(void *)v26, 1, v11 - 96);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v120[80] + 24))(*(void *)&v120[80], 0, v120);
        unint64_t v33 = v126;
        if ((unint64_t)v126 >= v127)
        {
          uint64_t v126 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v125, (uint64_t)v120);
          if (*(void *)&v120[56])
          {
            *(void *)&v120[64] = *(void *)&v120[56];
            operator delete(*(void **)&v120[56]);
          }
        }
        else
        {
          long long v34 = *(_OWORD *)&v120[16];
          *(_OWORD *)uint64_t v126 = *(_OWORD *)v120;
          *((_OWORD *)v33 + 1) = v34;
          *((void *)v33 + 4) = 0;
          *((void *)v33 + 5) = 0;
          *((void *)v33 + 6) = 0;
          *((void *)v33 + 7) = 0;
          *((_OWORD *)v33 + 2) = *(_OWORD *)&v120[32];
          *((void *)v33 + 6) = *(void *)&v120[48];
          memset(&v120[32], 0, 24);
          *((void *)v33 + 8) = 0;
          *((void *)v33 + 9) = 0;
          *(_OWORD *)(v33 + 56) = *(_OWORD *)&v120[56];
          *((void *)v33 + 9) = *(void *)&v120[72];
          memset(&v120[56], 0, 24);
          uint64_t v35 = *(void *)&v120[80];
          *(void *)(v33 + 85) = *(void *)&v120[85];
          *((void *)v33 + 10) = v35;
          uint64_t v126 = v33 + 96;
        }
        if (*(void *)&v120[32])
        {
          *(void *)&v120[40] = *(void *)&v120[32];
          operator delete(*(void **)&v120[32]);
        }
        goto LABEL_18;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
  }
}

void sub_21DE1423C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  std::__state<char>::~__state(&a35);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v35 - 120));
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    uint64_t v3 = *(void ***)(a1 + 8);
    *(void *)(a1 + 40) = 0;
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = &v2[v4 / 0x2A];
    uint64_t v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    unint64_t v7 = (unint64_t)v2[(*(void *)(a1 + 40) + v4) / 0x2A] + 96 * ((*(void *)(a1 + 40) + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        int v8 = (void *)*((void *)v6 + 7);
        if (v8)
        {
          *((void *)v6 + 8) = v8;
          operator delete(v8);
        }
        uint64_t v9 = (void *)*((void *)v6 + 4);
        if (v9)
        {
          *((void *)v6 + 5) = v9;
          operator delete(v9);
        }
        v6 += 96;
        if (v6 - (unsigned char *)*v5 == 4032)
        {
          uint64_t v10 = (char *)v5[1];
          ++v5;
          uint64_t v6 = v10;
        }
      }
      while (v6 != (char *)v7);
      uint64_t v2 = *(void ***)(a1 + 8);
      uint64_t v3 = *(void ***)(a1 + 16);
    }
    *(void *)(a1 + 40) = 0;
    unint64_t v11 = (char *)v3 - (char *)v2;
    if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
    {
      do
      {
        operator delete(*v2);
        uint64_t v3 = *(void ***)(a1 + 16);
        uint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
        *(void *)(a1 + 8) = v2;
        unint64_t v11 = (char *)v3 - (char *)v2;
      }
      while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
    }
  }
  unint64_t v12 = v11 >> 3;
  if (v12 == 1)
  {
    uint64_t v13 = 21;
    goto LABEL_19;
  }
  if (v12 == 2)
  {
    uint64_t v13 = 42;
LABEL_19:
    *(void *)(a1 + 32) = v13;
  }
  if (v2 != v3)
  {
    do
    {
      unint64_t v14 = *v2++;
      operator delete(v14);
    }
    while (v2 != v3);
    uint64_t v16 = *(void *)(a1 + 8);
    uint64_t v15 = *(void *)(a1 + 16);
    if (v15 != v16) {
      *(void *)(a1 + 16) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::deque<std::__state<char>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    *(void *)(a1 + 32) = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    uint64_t v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v6 + 1);
    uint64_t v8 = *v6;
    *(void *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_78:
      *(void *)uint64_t v5 = v8;
      *(void *)(a1 + 16) += 8;
      return;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v32 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v32 = 1;
      }
      if (!(v32 >> 61))
      {
        unint64_t v33 = v32 >> 2;
        uint64_t v34 = 8 * v32;
        uint64_t v35 = (char *)operator new(8 * v32);
        unint64_t v36 = &v35[8 * v33];
        long long v37 = &v35[v34];
        int64_t v39 = v5 - v7;
        BOOL v38 = v5 == v7;
        uint64_t v5 = v36;
        if (!v38)
        {
          uint64_t v5 = &v36[v39 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v40 = v39 - 8;
          if ((unint64_t)(v39 - 8) >= 0x38)
          {
            uint64_t v73 = &v35[8 * v33];
            uint64_t v41 = v73;
            if ((unint64_t)(v73 - v7) >= 0x20)
            {
              uint64_t v74 = (v40 >> 3) + 1;
              uint64_t v75 = 8 * (v74 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v41 = &v36[v75];
              v7 += v75;
              unint64_t v76 = (long long *)(v6 + 3);
              uint64_t v77 = v73 + 16;
              uint64_t v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v79 = *v76;
                *(v77 - 1) = *(v76 - 1);
                _OWORD *v77 = v79;
                v76 += 2;
                v77 += 2;
                v78 -= 4;
              }
              while (v78);
              if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            uint64_t v41 = &v35[8 * v33];
          }
          do
          {
            uint64_t v80 = *(void *)v7;
            v7 += 8;
            *(void *)uint64_t v41 = v80;
            v41 += 8;
          }
          while (v41 != v5);
        }
        goto LABEL_76;
      }
LABEL_87:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    if (v11 >= -1) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11 + 2;
    }
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = -v13;
    uint64_t v15 = &v7[-8 * v13];
    int64_t v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      unint64_t v7 = *(char **)(a1 + 8);
    }
    uint64_t v5 = &v15[v16];
    *(void *)(a1 + 8) = &v7[8 * v14];
    *(void *)(a1 + 16) = &v15[v16];
    goto LABEL_78;
  }
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = v18 - v19;
  uint64_t v21 = (v18 - v19) >> 3;
  uint64_t v22 = v17 - *(void *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      unint64_t v89 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v89);
      return;
    }
    unint64_t v89 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v89);
    uint64_t v42 = *(void **)(a1 + 8);
    uint64_t v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v42 + 1);
    uint64_t v8 = *v42;
    *(void *)(a1 + 8) = v42 + 1;
    if (v5 != *(char **)(a1 + 24)) {
      goto LABEL_78;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v43 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v43 = 1;
      }
      if (!(v43 >> 61))
      {
        unint64_t v44 = v43 >> 2;
        uint64_t v45 = 8 * v43;
        uint64_t v35 = (char *)operator new(8 * v43);
        unint64_t v36 = &v35[8 * v44];
        long long v37 = &v35[v45];
        int64_t v46 = v5 - v7;
        BOOL v38 = v5 == v7;
        uint64_t v5 = v36;
        if (!v38)
        {
          uint64_t v5 = &v36[v46 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v47 = v46 - 8;
          if ((unint64_t)(v46 - 8) >= 0x38)
          {
            unint64_t v81 = &v35[8 * v44];
            long long v48 = v81;
            if ((unint64_t)(v81 - v7) >= 0x20)
            {
              uint64_t v82 = (v47 >> 3) + 1;
              uint64_t v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
              long long v48 = &v36[v83];
              v7 += v83;
              unint64_t v84 = (long long *)(v42 + 3);
              unint64_t v85 = v81 + 16;
              uint64_t v86 = v82 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v87 = *v84;
                *(v85 - 1) = *(v84 - 1);
                _OWORD *v85 = v87;
                v84 += 2;
                v85 += 2;
                v86 -= 4;
              }
              while (v86);
              if (v82 == (v82 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            long long v48 = &v35[8 * v44];
          }
          do
          {
            uint64_t v88 = *(void *)v7;
            v7 += 8;
            *(void *)long long v48 = v88;
            v48 += 8;
          }
          while (v48 != v5);
        }
LABEL_76:
        *(void *)a1 = v35;
        *(void *)(a1 + 8) = v36;
        *(void *)(a1 + 16) = v5;
        *(void *)(a1 + 24) = v37;
        if (v9)
        {
          operator delete(v9);
          uint64_t v5 = *(char **)(a1 + 16);
        }
        goto LABEL_78;
      }
      goto LABEL_87;
    }
    goto LABEL_5;
  }
  uint64_t v23 = v22 >> 2;
  if (v17 == *(void *)a1) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = v23;
  }
  if (v24 >> 61) {
    goto LABEL_87;
  }
  uint64_t v25 = (char *)operator new(8 * v24);
  uint64_t v26 = operator new(0xFC0uLL);
  unint64_t v27 = &v25[8 * v21];
  uint64_t v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    unint64_t v30 = v26;
    if (v20 < 1)
    {
      if (v18 == v19) {
        unint64_t v49 = 1;
      }
      else {
        unint64_t v49 = v20 >> 2;
      }
      if (v49 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v27 = (char *)operator new(8 * v49);
      uint64_t v28 = &v27[8 * v49];
      operator delete(v25);
      uint64_t v50 = *(void *)(a1 + 8);
      uint64_t v18 = *(void *)(a1 + 16);
      uint64_t v25 = v27;
      *(void *)unint64_t v27 = v30;
      unint64_t v29 = v27 + 8;
      if (v18 == v50) {
        goto LABEL_45;
      }
    }
    else
    {
      unint64_t v31 = v21 + 2;
      if (v21 >= -1) {
        unint64_t v31 = v21 + 1;
      }
      v27 -= 8 * (v31 >> 1);
      *(void *)unint64_t v27 = v26;
      unint64_t v29 = v27 + 8;
      if (v18 == v19) {
        goto LABEL_45;
      }
    }
    goto LABEL_51;
  }
  *(void *)unint64_t v27 = v26;
  unint64_t v29 = v27 + 8;
  if (v18 != v19)
  {
    do
    {
LABEL_51:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v25) {
            unint64_t v57 = 1;
          }
          else {
            unint64_t v57 = (v28 - v25) >> 2;
          }
          if (v57 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          int64_t v58 = (char *)operator new(8 * v57);
          unint64_t v59 = v58;
          unint64_t v60 = (v57 + 3) >> 2;
          unint64_t v27 = &v58[8 * v60];
          int64_t v61 = v29 - v25;
          BOOL v38 = v29 == v25;
          unint64_t v29 = v27;
          if (!v38)
          {
            unint64_t v29 = &v27[v61 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v62 = v61 - 8;
            unint64_t v63 = &v58[8 * v60];
            unint64_t v64 = v25;
            if (v62 < 0x38) {
              goto LABEL_91;
            }
            uint64_t v65 = 8 * v60;
            unint64_t v63 = &v58[8 * v60];
            unint64_t v64 = v25;
            if ((unint64_t)(v63 - v25) < 0x20) {
              goto LABEL_91;
            }
            uint64_t v66 = (v62 >> 3) + 1;
            uint64_t v67 = 8 * (v66 & 0x3FFFFFFFFFFFFFFCLL);
            unint64_t v63 = &v27[v67];
            unint64_t v64 = &v25[v67];
            uint64_t v68 = (long long *)(v25 + 16);
            unint64_t v69 = &v58[v65 + 16];
            uint64_t v70 = v66 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v71 = *v68;
              *((_OWORD *)v69 - 1) = *(v68 - 1);
              *(_OWORD *)unint64_t v69 = v71;
              v68 += 2;
              v69 += 32;
              v70 -= 4;
            }
            while (v70);
            if (v66 != (v66 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_91:
              do
              {
                uint64_t v72 = *(void *)v64;
                v64 += 8;
                *(void *)unint64_t v63 = v72;
                v63 += 8;
              }
              while (v63 != v29);
            }
          }
          uint64_t v28 = &v58[8 * v57];
          operator delete(v25);
          uint64_t v25 = v59;
        }
        else
        {
          uint64_t v53 = (v28 - v29) >> 3;
          if (v53 >= -1) {
            uint64_t v54 = v53 + 1;
          }
          else {
            uint64_t v54 = v53 + 2;
          }
          uint64_t v55 = v54 >> 1;
          unint64_t v27 = &v25[8 * (v54 >> 1)];
          uint64_t v56 = v25;
          if (v29 != v25)
          {
            memmove(v27, v25, v29 - v25);
            uint64_t v56 = v29;
          }
          unint64_t v29 = (char *)v56 + 8 * v55;
        }
      }
      uint64_t v52 = *(void *)(v18 - 8);
      v18 -= 8;
      *((void *)v27 - 1) = v52;
      v27 -= 8;
    }
    while (v18 != *(void *)(a1 + 8));
  }
LABEL_45:
  unint64_t v51 = *(char **)a1;
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v27;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v28;
  if (v51)
  {
    operator delete(v51);
  }
}

void sub_21DE149C4(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(char **a1, void *a2)
{
  unint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_22;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    uint64_t v11 = &v6[-8 * v9];
    int64_t v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      unint64_t v4 = a1[1];
    }
    uint64_t v13 = &v4[8 * v10];
    unint64_t v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  unint64_t v14 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v14 = 1;
  }
  if (v14 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v15 = v14 >> 2;
  uint64_t v16 = 8 * v14;
  uint64_t v17 = (char *)operator new(8 * v14);
  uint64_t v18 = &v17[8 * v15];
  int64_t v20 = v4 - v6;
  BOOL v19 = v4 == v6;
  unint64_t v4 = v18;
  if (!v19)
  {
    unint64_t v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      uint64_t v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        uint64_t v31 = *(void *)v6;
        v6 += 8;
        *(void *)uint64_t v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    uint64_t v23 = &v17[8 * v15];
    uint64_t v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20) {
      goto LABEL_19;
    }
    uint64_t v24 = (v21 >> 3) + 1;
    uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v22 = &v18[v25];
    uint64_t v26 = &v6[v25];
    unint64_t v27 = (long long *)(v6 + 16);
    uint64_t v28 = v23 + 16;
    uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      _OWORD *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    uint64_t v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_19;
    }
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    unint64_t v4 = a1[2];
  }
LABEL_22:
  *(void *)unint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(void **a1, void *a2)
{
  unint64_t v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    uint64_t v7 = a1[2];
    uint64_t v6 = a1[3];
    if (v7 >= v6)
    {
      uint64_t v13 = v6 - v4;
      BOOL v12 = v13 == 0;
      unint64_t v14 = v13 >> 2;
      if (v12) {
        unint64_t v14 = 1;
      }
      if (v14 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v15 = (v14 + 3) >> 2;
      uint64_t v16 = 8 * v14;
      uint64_t v17 = (char *)operator new(8 * v14);
      uint64_t v5 = &v17[8 * v15];
      uint64_t v18 = v5;
      uint64_t v19 = v7 - v4;
      if (v7 != v4)
      {
        uint64_t v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = v19 - 8;
        unint64_t v21 = &v17[8 * v15];
        uint64_t v22 = v4;
        if (v20 < 0x38) {
          goto LABEL_27;
        }
        uint64_t v23 = &v17[8 * v15];
        unint64_t v21 = v23;
        uint64_t v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20) {
          goto LABEL_27;
        }
        uint64_t v24 = (v20 >> 3) + 1;
        uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v21 = &v5[v25];
        uint64_t v22 = &v4[v25];
        uint64_t v26 = (long long *)(v4 + 16);
        unint64_t v27 = v23 + 16;
        uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          _OWORD *v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            uint64_t v30 = *(void *)v22;
            v22 += 8;
            *(void *)unint64_t v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        uint64_t v5 = (char *)a1[1];
      }
    }
    else
    {
      uint64_t v8 = (v6 - v7) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v11 = &v7[8 * (v9 >> 1)];
      uint64_t v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        unint64_t v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = (char *)a1[1];
  }
  *((void *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v4 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v6 = (unsigned char *)this->__r_.__value_.__r.__words[0];
    if (v4 >= 0x1C)
    {
      qmemcpy(v6, "([^:]*):([^:]*):([^:]*):(.*)", 28);
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        this->__r_.__value_.__l.__size_ = 28;
      }
      else {
        *((unsigned char *)&this->__r_.__value_.__s + 23) = 28;
      }
      goto LABEL_10;
    }
    uint64_t v5 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type v4 = 22;
    uint64_t v5 = this;
  }
  uint64_t v7 = 2 * v4;
  if (2 * v4 <= 0x1C) {
    uint64_t v7 = 28;
  }
  size_t v8 = (v7 | 7) + 1;
  uint64_t v6 = operator new(v8);
  qmemcpy(v6, "([^:]*):([^:]*):([^:]*):(.*)", 28);
  if (v4 != 22) {
    operator delete(v5);
  }
  this->__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
  this->__r_.__value_.__l.__size_ = 28;
  this->__r_.__value_.__r.__words[2] = v8 | 0x8000000000000000;
LABEL_10:
  v6[28] = 0;
  return this;
}

uint64_t TelephonyUtilStrlcpy()
{
  return MEMORY[0x270F97208]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::fs::read_folder()
{
  return MEMORY[0x270F975B8]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void free(void *a1)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}