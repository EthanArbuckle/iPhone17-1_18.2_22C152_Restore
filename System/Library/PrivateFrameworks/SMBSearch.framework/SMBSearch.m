void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

uint64_t align4Pad(char a1)
{
  if ((a1 & 3) != 0) {
    return 4 - (a1 & 3u);
  }
  else {
    return 0;
  }
}

uint64_t align8Pad(char a1)
{
  if ((a1 & 7) != 0) {
    return 8 - (a1 & 7u);
  }
  else {
    return 0;
  }
}

uint64_t getChecksum32(int a1, int *a2, unsigned int a3)
{
  uint64_t result = 0;
  if (a2 && a3)
  {
    int v6 = a3 & 3;
    if (a3 >= 4)
    {
      int v7 = 0;
      unsigned int v8 = a3 >> 2;
      do
      {
        int v9 = *a2++;
        v7 += v9;
        --v8;
      }
      while (v8);
    }
    else
    {
      int v7 = 0;
    }
    if (v6) {
      __memcpy_chk();
    }
    return (v7 ^ 0x59533959u) - a1;
  }
  return result;
}

id utf8_to_utf16le_data(void *a1, _DWORD *a2, int a3)
{
  id v5 = a1;
  int v6 = [v5 length];
  int v7 = [v5 dataUsingEncoding:2483028224];

  if (v7)
  {
    if (!a3)
    {
LABEL_5:
      *a2 = v6;
      goto LABEL_7;
    }
    __int16 v12 = 0;
    unsigned int v8 = (void *)[v7 mutableCopy];
    if (v8)
    {
      int v9 = v8;
      [v8 appendBytes:&v12 length:2];
      uint64_t v10 = [MEMORY[0x263EFF990] dataWithData:v9];

      ++v6;
      int v7 = (void *)v10;
      goto LABEL_5;
    }

    int v7 = 0;
  }
LABEL_7:

  return v7;
}

uint64_t utf8_to_utf16(char *cStr, UInt8 **a2, _DWORD *a3, _DWORD *a4, uint64_t a5)
{
  CFStringRef v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  if (v10)
  {
    CFStringRef v11 = v10;
    CFIndex maxBufLen = 0;
    CFIndex Length = CFStringGetLength(v10);
    v19.location = 0;
    v19.length = Length;
    if (CFStringGetBytes(v11, v19, 0x14000100u, 0, 0, 0, 0, &maxBufLen))
    {
      size_t v13 = maxBufLen;
      if (a5)
      {
        size_t v13 = maxBufLen + 2;
        maxBufLen += 2;
      }
      v14 = (UInt8 *)malloc_type_calloc(v13, 1uLL, 0xE1FAE514uLL);
      if (!v14)
      {
        printf("utf8_to_utf16: No memory for encode_len: %lu\n", maxBufLen);
        a5 = 12;
LABEL_14:
        CFRelease(v11);
        return a5;
      }
      v15 = v14;
      v20.location = 0;
      v20.length = Length;
      CFIndex Bytes = CFStringGetBytes(v11, v20, 0x14000100u, 0, 0, v14, maxBufLen, 0);
      if (Bytes)
      {
        *a2 = v15;
        *a3 = maxBufLen;
        *a4 = Bytes;
        if (a5)
        {
          a5 = 0;
          *a4 = Bytes + 1;
        }
        goto LABEL_14;
      }
      printf("utf8_to_utf16: Failed to convert input string: %s\n", cStr);
      free(v15);
    }
    else
    {
      printf("utf8_to_utf16: Error converting input string: %s\n", cStr);
    }
    a5 = 22;
    goto LABEL_14;
  }
  printf("utf8_to_utf16: Failed to created CFString from inbuf: %s\n", cStr);
  return 22;
}

uint64_t utf16_to_utf8(UInt8 *bytes, CFIndex numBytes, UInt8 **a3, _DWORD *a4)
{
  CFStringRef v7 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, numBytes, 0x14000100u, 0);
  if (v7)
  {
    CFStringRef v8 = v7;
    CFIndex usedBufLen = 0;
    CFIndex Length = CFStringGetLength(v7);
    v16.location = 0;
    v16.length = Length;
    if (CFStringGetBytes(v8, v16, 0x8000100u, 0, 0, 0, 0, &usedBufLen))
    {
      CFIndex v10 = usedBufLen;
      CFStringRef v11 = (UInt8 *)malloc_type_calloc(usedBufLen, 1uLL, 0xF4218BCFuLL);
      if (!v11)
      {
        printf("utf16_to_utf8: No memory for encode buffer, encode_len: %lu\n", v10);
        uint64_t v13 = 12;
        goto LABEL_11;
      }
      __int16 v12 = v11;
      v17.location = 0;
      v17.length = Length;
      if (CFStringGetBytes(v8, v17, 0x8000100u, 0, 0, v11, v10, &usedBufLen))
      {
        uint64_t v13 = 0;
        *a3 = v12;
        *a4 = v10;
LABEL_11:
        CFRelease(v8);
        return v13;
      }
      puts("utf16_to_utf8: Failed to convert input string");
      free(v12);
    }
    else
    {
      printf("utf16_to_utf8: Error converting input string: %s\n", (const char *)bytes);
    }
    uint64_t v13 = 22;
    goto LABEL_11;
  }
  printf("utf16_to_utf8: Failed to created CFString from inbuf: %s\n", (const char *)bytes);
  return 22;
}

unint64_t smb_time_NT2local(unint64_t result, void *a2)
{
  *a2 = result / 0x989680 - DIFF1970TO1601;
  a2[1] = 0;
  return result;
}

uint64_t *smb_time_local2NT(uint64_t *result, void *a2, int a3)
{
  uint64_t v3 = *result;
  unint64_t v4 = DIFF1970TO1601;
  if (a3)
  {
    uint64_t v3 = DIFF1970TO1601;
    unint64_t v4 = *result & 0xFFFFFFFFFFFFFFFELL;
  }
  *a2 = 10000000 * (v4 + v3);
  return result;
}

const char *dumpBufferMsg(const char *result, unsigned __int8 *a2, unsigned int a3)
{
  if (result) {
    uint64_t result = (const char *)puts(result);
  }
  if (a2 && a3)
  {
    int v5 = a3 & 0xF;
    if (a3 >= 0x10)
    {
      int v157 = a3 & 0xF;
      uint64_t v6 = 0;
      unsigned int v7 = a3 >> 4;
      uint64_t v8 = MEMORY[0x263EF8318];
      do
      {
        unsigned int v291 = v7;
        int v9 = &a2[v6];
        unsigned int v10 = a2[v6];
        int v11 = a2[v6 + 1];
        int v257 = a2[v6 + 2];
        int v247 = a2[v6 + 3];
        int v238 = a2[v6 + 4];
        int v229 = a2[v6 + 5];
        int v221 = a2[v6 + 6];
        int v213 = a2[v6 + 7];
        int v205 = a2[v6 + 8];
        int v198 = a2[v6 + 9];
        int v192 = a2[v6 + 10];
        int v186 = a2[v6 + 11];
        int v181 = a2[v6 + 12];
        int v177 = a2[v6 + 13];
        int v173 = a2[v6 + 14];
        int v170 = a2[v6 + 15];
        if ((char)a2[v6] < 0)
        {
          int v12 = __maskrune(v10, 0x40000uLL);
          unsigned int v13 = v9[1];
          uint64_t v14 = v9[1];
        }
        else
        {
          int v12 = *(_DWORD *)(v8 + 4 * a2[v6] + 60) & 0x40000;
          unsigned int v13 = a2[v6 + 1];
          uint64_t v14 = a2[v6 + 1];
        }
        if (v12) {
          uint64_t v15 = v10;
        }
        else {
          uint64_t v15 = 46;
        }
        uint64_t v168 = v15;
        if ((v14 & 0x80) != 0) {
          int v16 = __maskrune(v13, 0x40000uLL);
        }
        else {
          int v16 = *(_DWORD *)(v8 + 4 * v14 + 60) & 0x40000;
        }
        if (v16) {
          uint64_t v17 = v13;
        }
        else {
          uint64_t v17 = 46;
        }
        uint64_t v166 = v17;
        unsigned int v18 = v9[2];
        if ((char)v9[2] < 0) {
          int v19 = __maskrune(v9[2], 0x40000uLL);
        }
        else {
          int v19 = *(_DWORD *)(v8 + 4 * v9[2] + 60) & 0x40000;
        }
        if (v19) {
          uint64_t v20 = v18;
        }
        else {
          uint64_t v20 = 46;
        }
        uint64_t v165 = v20;
        unsigned int v21 = v9[3];
        if ((char)v9[3] < 0) {
          int v22 = __maskrune(v9[3], 0x40000uLL);
        }
        else {
          int v22 = *(_DWORD *)(v8 + 4 * v9[3] + 60) & 0x40000;
        }
        if (v22) {
          uint64_t v23 = v21;
        }
        else {
          uint64_t v23 = 46;
        }
        uint64_t v164 = v23;
        unsigned int v24 = v9[4];
        if ((char)v9[4] < 0) {
          int v25 = __maskrune(v9[4], 0x40000uLL);
        }
        else {
          int v25 = *(_DWORD *)(v8 + 4 * v9[4] + 60) & 0x40000;
        }
        if (v25) {
          uint64_t v26 = v24;
        }
        else {
          uint64_t v26 = 46;
        }
        uint64_t v163 = v26;
        unsigned int v27 = v9[5];
        if ((char)v9[5] < 0) {
          int v28 = __maskrune(v9[5], 0x40000uLL);
        }
        else {
          int v28 = *(_DWORD *)(v8 + 4 * v9[5] + 60) & 0x40000;
        }
        if (v28) {
          uint64_t v29 = v27;
        }
        else {
          uint64_t v29 = 46;
        }
        uint64_t v162 = v29;
        unsigned int v30 = v9[6];
        if ((char)v9[6] < 0) {
          int v31 = __maskrune(v9[6], 0x40000uLL);
        }
        else {
          int v31 = *(_DWORD *)(v8 + 4 * v9[6] + 60) & 0x40000;
        }
        if (v31) {
          uint64_t v32 = v30;
        }
        else {
          uint64_t v32 = 46;
        }
        uint64_t v161 = v32;
        unsigned int v33 = v9[7];
        if ((char)v9[7] < 0) {
          int v34 = __maskrune(v9[7], 0x40000uLL);
        }
        else {
          int v34 = *(_DWORD *)(v8 + 4 * v9[7] + 60) & 0x40000;
        }
        if (v34) {
          uint64_t v35 = v33;
        }
        else {
          uint64_t v35 = 46;
        }
        uint64_t v160 = v35;
        unsigned int v36 = v9[8];
        if ((char)v9[8] < 0) {
          int v37 = __maskrune(v9[8], 0x40000uLL);
        }
        else {
          int v37 = *(_DWORD *)(v8 + 4 * v9[8] + 60) & 0x40000;
        }
        if (v37) {
          uint64_t v38 = v36;
        }
        else {
          uint64_t v38 = 46;
        }
        uint64_t v159 = v38;
        unsigned int v39 = v9[9];
        if ((char)v9[9] < 0) {
          int v40 = __maskrune(v9[9], 0x40000uLL);
        }
        else {
          int v40 = *(_DWORD *)(v8 + 4 * v9[9] + 60) & 0x40000;
        }
        if (v40) {
          uint64_t v41 = v39;
        }
        else {
          uint64_t v41 = 46;
        }
        uint64_t v158 = v41;
        unsigned int v42 = v9[10];
        unsigned int v279 = v10;
        if ((char)v9[10] < 0) {
          int v43 = __maskrune(v42, 0x40000uLL);
        }
        else {
          int v43 = *(_DWORD *)(v8 + 4 * v9[10] + 60) & 0x40000;
        }
        if (v43) {
          uint64_t v44 = v42;
        }
        else {
          uint64_t v44 = 46;
        }
        unsigned int v45 = v9[11];
        int v268 = v11;
        if ((char)v9[11] < 0) {
          int v46 = __maskrune(v45, 0x40000uLL);
        }
        else {
          int v46 = *(_DWORD *)(v8 + 4 * v9[11] + 60) & 0x40000;
        }
        if (v46) {
          uint64_t v47 = v45;
        }
        else {
          uint64_t v47 = 46;
        }
        unsigned int v48 = v9[12];
        if ((char)v9[12] < 0) {
          int v49 = __maskrune(v9[12], 0x40000uLL);
        }
        else {
          int v49 = *(_DWORD *)(v8 + 4 * v9[12] + 60) & 0x40000;
        }
        v50 = a2;
        if (v49) {
          uint64_t v51 = v48;
        }
        else {
          uint64_t v51 = 46;
        }
        unsigned int v52 = v9[13];
        uint64_t v53 = v6;
        if ((char)v9[13] < 0) {
          int v54 = __maskrune(v9[13], 0x40000uLL);
        }
        else {
          int v54 = *(_DWORD *)(v8 + 4 * v9[13] + 60) & 0x40000;
        }
        if (v54) {
          uint64_t v55 = v52;
        }
        else {
          uint64_t v55 = 46;
        }
        unsigned int v56 = v9[14];
        if ((char)v9[14] < 0) {
          int v57 = __maskrune(v9[14], 0x40000uLL);
        }
        else {
          int v57 = *(_DWORD *)(v8 + 4 * v9[14] + 60) & 0x40000;
        }
        if (v57) {
          uint64_t v58 = v56;
        }
        else {
          uint64_t v58 = 46;
        }
        unsigned int v59 = v9[15];
        if ((char)v9[15] < 0) {
          int v60 = __maskrune(v9[15], 0x40000uLL);
        }
        else {
          int v60 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v9[15] + 60) & 0x40000;
        }
        if (v60) {
          uint64_t v61 = v59;
        }
        else {
          uint64_t v61 = 46;
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x %02x %02x %02x  |%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c|\n", v53, v279, v268, v257, v247, v238, v229, v221, v213, v205, v198, v192, v186, v181, v177, v173, v170,
                                 v168,
                                 v166,
                                 v165,
                                 v164,
                                 v163,
                                 v162,
                                 v161,
                                 v160,
                                 v159,
                                 v158,
                                 v44,
                                 v47,
                                 v51,
                                 v55,
                                 v58,
                                 v61);
        uint64_t v6 = v53 + 16;
        unsigned int v7 = v291 - 1;
        a2 = v50;
        uint64_t v8 = MEMORY[0x263EF8318];
      }
      while (v291 != 1);
      a2 = &v50[v6];
      int v5 = v157;
    }
    else
    {
      uint64_t v6 = 0;
    }
    switch(v5)
    {
      case 1:
        int v62 = (char)*a2;
        __darwin_ct_rune_t v63 = *a2;
        if (v62 < 0) {
          __maskrune(v63, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x                                                |%c|\n");
        break;
      case 2:
        if ((char)*a2 < 0) {
          __maskrune(*a2, 0x40000uLL);
        }
        __darwin_ct_rune_t v64 = a2[1];
        if ((v64 & 0x80) != 0) {
          __maskrune(v64, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x                                             |%c%c|\n");
        break;
      case 3:
        if ((char)*a2 < 0) {
          __maskrune(*a2, 0x40000uLL);
        }
        __darwin_ct_rune_t v65 = a2[1];
        if ((v65 & 0x80) != 0) {
          __maskrune(v65, 0x40000uLL);
        }
        int v114 = (char)a2[2];
        __darwin_ct_rune_t v115 = a2[2];
        if (v114 < 0) {
          __maskrune(v115, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x                                          |%c%c%c|\n");
        break;
      case 4:
        uint64_t v66 = *a2;
        if ((char)*a2 < 0) {
          __maskrune(*a2, 0x40000uLL);
        }
        __darwin_ct_rune_t v67 = a2[1];
        if ((v67 & 0x80) != 0) {
          __maskrune(v67, 0x40000uLL);
        }
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        int v127 = (char)a2[3];
        __darwin_ct_rune_t v128 = a2[3];
        if (v127 < 0) {
          __maskrune(v128, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x                                       |%c%c%c%c|\n", v6, v66);
        break;
      case 5:
        uint64_t v68 = *a2;
        uint64_t v69 = a2[1];
        uint64_t v280 = a2[2];
        if ((char)*a2 < 0) {
          __maskrune(v68, 0x40000uLL);
        }
        __darwin_ct_rune_t v70 = a2[1];
        if ((v70 & 0x80) != 0) {
          __maskrune(v70, 0x40000uLL);
        }
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        int v134 = (char)a2[4];
        __darwin_ct_rune_t v135 = a2[4];
        if (v134 < 0) {
          __maskrune(v135, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x                                    |%c%c%c%c%c|\n", v6, v68, v69, v280);
        break;
      case 6:
        uint64_t v71 = *a2;
        uint64_t v72 = a2[1];
        uint64_t v281 = a2[2];
        uint64_t v269 = a2[3];
        uint64_t v258 = a2[4];
        if ((char)*a2 < 0) {
          __maskrune(v71, 0x40000uLL);
        }
        __darwin_ct_rune_t v73 = a2[1];
        if ((v73 & 0x80) != 0) {
          __maskrune(v73, 0x40000uLL);
        }
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        int v137 = (char)a2[5];
        __darwin_ct_rune_t v138 = a2[5];
        if (v137 < 0) {
          __maskrune(v138, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x                                 |%c%c%c%c%c%c|\n", v6, v71, v72, v281, v269, v258);
        break;
      case 7:
        uint64_t v74 = *a2;
        uint64_t v75 = a2[1];
        uint64_t v282 = a2[2];
        uint64_t v270 = a2[3];
        uint64_t v259 = a2[4];
        uint64_t v248 = a2[5];
        uint64_t v76 = a2[6];
        if ((char)*a2 < 0) {
          __maskrune(v74, 0x40000uLL);
        }
        __darwin_ct_rune_t v77 = a2[1];
        if ((v77 & 0x80) != 0) {
          __maskrune(v77, 0x40000uLL);
        }
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        int v139 = (char)a2[6];
        __darwin_ct_rune_t v140 = a2[6];
        if (v139 < 0) {
          __maskrune(v140, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x                              |%c%c%c%c%c%c%c|\n", v6, v74, v75, v282, v270, v259, v248, v76);
        break;
      case 8:
        uint64_t v78 = *a2;
        uint64_t v79 = a2[1];
        uint64_t v283 = a2[2];
        uint64_t v271 = a2[3];
        uint64_t v260 = a2[4];
        uint64_t v249 = a2[5];
        uint64_t v239 = a2[6];
        uint64_t v230 = a2[7];
        if ((char)*a2 < 0) {
          __maskrune(v78, 0x40000uLL);
        }
        __darwin_ct_rune_t v80 = a2[1];
        if ((v80 & 0x80) != 0) {
          __maskrune(v80, 0x40000uLL);
        }
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        int v141 = (char)a2[7];
        __darwin_ct_rune_t v142 = a2[7];
        if (v141 < 0) {
          __maskrune(v142, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x                           |%c%c%c%c%c%c%c%c|\n", v6, v78, v79, v283, v271, v260, v249, v239, v230);
        break;
      case 9:
        uint64_t v81 = *a2;
        uint64_t v272 = a2[2];
        uint64_t v284 = a2[1];
        uint64_t v261 = a2[3];
        uint64_t v250 = a2[4];
        uint64_t v240 = a2[5];
        uint64_t v231 = a2[6];
        uint64_t v222 = a2[7];
        uint64_t v214 = a2[8];
        if ((char)*a2 < 0) {
          int v82 = __maskrune(v81, 0x40000uLL);
        }
        else {
          int v82 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * *a2 + 60) & 0x40000;
        }
        __darwin_ct_rune_t v83 = a2[1];
        if (v82) {
          uint64_t v102 = v81;
        }
        else {
          uint64_t v102 = 46;
        }
        uint64_t v212 = v102;
        if ((v83 & 0x80) != 0) {
          __maskrune(v83, 0x40000uLL);
        }
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        if ((char)a2[7] < 0) {
          __maskrune(a2[7], 0x40000uLL);
        }
        int v143 = (char)a2[8];
        __darwin_ct_rune_t v144 = a2[8];
        if (v143 < 0) {
          __maskrune(v144, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x                       |%c%c%c%c%c%c%c%c%c|\n", v6, v81, v284, v272, v261, v250, v240, v231, v222, v214, v212);
        break;
      case 10:
        uint64_t v84 = *a2;
        uint64_t v273 = a2[2];
        uint64_t v285 = a2[1];
        uint64_t v262 = a2[3];
        uint64_t v251 = a2[4];
        uint64_t v241 = a2[5];
        uint64_t v232 = a2[6];
        uint64_t v223 = a2[7];
        uint64_t v215 = a2[8];
        uint64_t v206 = a2[9];
        if ((char)*a2 < 0) {
          int v85 = __maskrune(v84, 0x40000uLL);
        }
        else {
          int v85 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * *a2 + 60) & 0x40000;
        }
        __darwin_ct_rune_t v86 = a2[1];
        if (v85) {
          uint64_t v103 = v84;
        }
        else {
          uint64_t v103 = 46;
        }
        uint64_t v204 = v103;
        if ((v86 & 0x80) != 0) {
          __maskrune(v86, 0x40000uLL);
        }
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        if ((char)a2[7] < 0) {
          __maskrune(a2[7], 0x40000uLL);
        }
        if ((char)a2[8] < 0) {
          __maskrune(a2[8], 0x40000uLL);
        }
        int v145 = (char)a2[9];
        __darwin_ct_rune_t v146 = a2[9];
        if (v145 < 0) {
          __maskrune(v146, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x                    |%c%c%c%c%c%c%c%c%c%c|\n", v6, v84, v285, v273, v262, v251, v241, v232, v223, v215, v206, v204);
        break;
      case 11:
        uint64_t v87 = *a2;
        uint64_t v274 = a2[2];
        uint64_t v286 = a2[1];
        uint64_t v263 = a2[3];
        uint64_t v252 = a2[4];
        uint64_t v242 = a2[5];
        uint64_t v233 = a2[6];
        uint64_t v224 = a2[7];
        uint64_t v216 = a2[8];
        uint64_t v207 = a2[9];
        uint64_t v199 = a2[10];
        if ((char)*a2 < 0) {
          int v88 = __maskrune(v87, 0x40000uLL);
        }
        else {
          int v88 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * *a2 + 60) & 0x40000;
        }
        unsigned int v89 = a2[1];
        if (v88) {
          uint64_t v104 = v87;
        }
        else {
          uint64_t v104 = 46;
        }
        uint64_t v197 = v104;
        if ((v89 & 0x80) != 0) {
          int v105 = __maskrune(v89, 0x40000uLL);
        }
        else {
          int v105 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[1] + 60) & 0x40000;
        }
        if (v105) {
          uint64_t v116 = v89;
        }
        else {
          uint64_t v116 = 46;
        }
        uint64_t v191 = v116;
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        if ((char)a2[7] < 0) {
          __maskrune(a2[7], 0x40000uLL);
        }
        if ((char)a2[8] < 0) {
          __maskrune(a2[8], 0x40000uLL);
        }
        if ((char)a2[9] < 0) {
          __maskrune(a2[9], 0x40000uLL);
        }
        int v147 = (char)a2[10];
        __darwin_ct_rune_t v148 = a2[10];
        if (v147 < 0) {
          __maskrune(v148, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x                 |%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v87, v286, v274, v263, v252, v242, v233, v224, v216, v207, v199, v197, v191);
        break;
      case 12:
        uint64_t v90 = *a2;
        uint64_t v275 = a2[2];
        uint64_t v287 = a2[1];
        uint64_t v264 = a2[3];
        uint64_t v253 = a2[4];
        uint64_t v243 = a2[5];
        uint64_t v234 = a2[6];
        uint64_t v225 = a2[7];
        uint64_t v217 = a2[8];
        uint64_t v208 = a2[9];
        uint64_t v200 = a2[10];
        uint64_t v193 = a2[11];
        if ((char)*a2 < 0) {
          int v91 = __maskrune(v90, 0x40000uLL);
        }
        else {
          int v91 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * *a2 + 60) & 0x40000;
        }
        unsigned int v92 = a2[1];
        if (v91) {
          uint64_t v106 = v90;
        }
        else {
          uint64_t v106 = 46;
        }
        uint64_t v190 = v106;
        if ((v92 & 0x80) != 0) {
          int v107 = __maskrune(v92, 0x40000uLL);
        }
        else {
          int v107 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[1] + 60) & 0x40000;
        }
        if (v107) {
          uint64_t v117 = v92;
        }
        else {
          uint64_t v117 = 46;
        }
        uint64_t v185 = v117;
        if ((char)a2[2] < 0) {
          __maskrune(a2[2], 0x40000uLL);
        }
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        if ((char)a2[7] < 0) {
          __maskrune(a2[7], 0x40000uLL);
        }
        if ((char)a2[8] < 0) {
          __maskrune(a2[8], 0x40000uLL);
        }
        if ((char)a2[9] < 0) {
          __maskrune(a2[9], 0x40000uLL);
        }
        if ((char)a2[10] < 0) {
          __maskrune(a2[10], 0x40000uLL);
        }
        int v149 = (char)a2[11];
        __darwin_ct_rune_t v150 = a2[11];
        if (v149 < 0) {
          __maskrune(v150, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x              |%c%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v90, v287, v275, v264, v253, v243, v234, v225, v217, v208, v200, v193, v190, v185);
        break;
      case 13:
        uint64_t v93 = *a2;
        uint64_t v276 = a2[2];
        uint64_t v265 = a2[3];
        uint64_t v254 = a2[4];
        uint64_t v244 = a2[5];
        uint64_t v235 = a2[6];
        uint64_t v226 = a2[7];
        uint64_t v218 = a2[8];
        uint64_t v209 = a2[9];
        uint64_t v201 = a2[10];
        uint64_t v194 = a2[11];
        uint64_t v187 = a2[12];
        uint64_t v288 = a2[1];
        if ((char)*a2 < 0) {
          int v94 = __maskrune(v93, 0x40000uLL);
        }
        else {
          int v94 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * *a2 + 60) & 0x40000;
        }
        unsigned int v95 = a2[1];
        if (v94) {
          uint64_t v108 = v93;
        }
        else {
          uint64_t v108 = 46;
        }
        uint64_t v184 = v108;
        if ((v95 & 0x80) != 0) {
          int v109 = __maskrune(v95, 0x40000uLL);
        }
        else {
          int v109 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[1] + 60) & 0x40000;
        }
        if (v109) {
          uint64_t v118 = v95;
        }
        else {
          uint64_t v118 = 46;
        }
        uint64_t v180 = v118;
        unsigned int v119 = a2[2];
        if ((char)a2[2] < 0) {
          int v120 = __maskrune(a2[2], 0x40000uLL);
        }
        else {
          int v120 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[2] + 60) & 0x40000;
        }
        if (v120) {
          uint64_t v129 = v119;
        }
        else {
          uint64_t v129 = 46;
        }
        uint64_t v176 = v129;
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        if ((char)a2[7] < 0) {
          __maskrune(a2[7], 0x40000uLL);
        }
        if ((char)a2[8] < 0) {
          __maskrune(a2[8], 0x40000uLL);
        }
        if ((char)a2[9] < 0) {
          __maskrune(a2[9], 0x40000uLL);
        }
        if ((char)a2[10] < 0) {
          __maskrune(a2[10], 0x40000uLL);
        }
        if ((char)a2[11] < 0) {
          __maskrune(a2[11], 0x40000uLL);
        }
        int v151 = (char)a2[12];
        __darwin_ct_rune_t v152 = a2[12];
        if (v151 < 0) {
          __maskrune(v152, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x           |%c%c%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v93, v288, v276, v265, v254, v244, v235, v226, v218, v209, v201, v194, v187, v184, v180, v176);
        break;
      case 14:
        uint64_t v96 = *a2;
        uint64_t v277 = a2[2];
        uint64_t v266 = a2[3];
        uint64_t v255 = a2[4];
        uint64_t v245 = a2[5];
        uint64_t v236 = a2[6];
        uint64_t v227 = a2[7];
        uint64_t v219 = a2[8];
        uint64_t v210 = a2[9];
        uint64_t v202 = a2[10];
        uint64_t v195 = a2[11];
        uint64_t v188 = a2[12];
        uint64_t v182 = a2[13];
        uint64_t v289 = a2[1];
        if ((char)*a2 < 0) {
          int v97 = __maskrune(v96, 0x40000uLL);
        }
        else {
          int v97 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * *a2 + 60) & 0x40000;
        }
        unsigned int v98 = a2[1];
        if (v97) {
          uint64_t v110 = v96;
        }
        else {
          uint64_t v110 = 46;
        }
        uint64_t v179 = v110;
        if ((v98 & 0x80) != 0) {
          int v111 = __maskrune(v98, 0x40000uLL);
        }
        else {
          int v111 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[1] + 60) & 0x40000;
        }
        if (v111) {
          uint64_t v121 = v98;
        }
        else {
          uint64_t v121 = 46;
        }
        uint64_t v175 = v121;
        unsigned int v122 = a2[2];
        if ((char)a2[2] < 0) {
          int v123 = __maskrune(a2[2], 0x40000uLL);
        }
        else {
          int v123 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[2] + 60) & 0x40000;
        }
        if (v123) {
          uint64_t v130 = v122;
        }
        else {
          uint64_t v130 = 46;
        }
        uint64_t v172 = v130;
        if ((char)a2[3] < 0) {
          __maskrune(a2[3], 0x40000uLL);
        }
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        if ((char)a2[7] < 0) {
          __maskrune(a2[7], 0x40000uLL);
        }
        if ((char)a2[8] < 0) {
          __maskrune(a2[8], 0x40000uLL);
        }
        if ((char)a2[9] < 0) {
          __maskrune(a2[9], 0x40000uLL);
        }
        if ((char)a2[10] < 0) {
          __maskrune(a2[10], 0x40000uLL);
        }
        if ((char)a2[11] < 0) {
          __maskrune(a2[11], 0x40000uLL);
        }
        if ((char)a2[12] < 0) {
          __maskrune(a2[12], 0x40000uLL);
        }
        int v153 = (char)a2[13];
        __darwin_ct_rune_t v154 = a2[13];
        if (v153 < 0) {
          __maskrune(v154, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x %02x        |%c%c%c%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v96, v289, v277, v266, v255, v245, v236, v227, v219, v210, v202, v195, v188, v182, v179, v175,
                                 v172);
        break;
      case 15:
        uint64_t v99 = *a2;
        uint64_t v278 = a2[2];
        uint64_t v267 = a2[3];
        uint64_t v256 = a2[4];
        uint64_t v246 = a2[5];
        uint64_t v237 = a2[6];
        uint64_t v228 = a2[7];
        uint64_t v220 = a2[8];
        uint64_t v211 = a2[9];
        uint64_t v203 = a2[10];
        uint64_t v196 = a2[11];
        uint64_t v189 = a2[12];
        uint64_t v183 = a2[13];
        uint64_t v178 = a2[14];
        uint64_t v290 = a2[1];
        if ((char)*a2 < 0) {
          int v100 = __maskrune(v99, 0x40000uLL);
        }
        else {
          int v100 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * *a2 + 60) & 0x40000;
        }
        unsigned int v101 = a2[1];
        if (v100) {
          uint64_t v112 = v99;
        }
        else {
          uint64_t v112 = 46;
        }
        uint64_t v174 = v112;
        if ((v101 & 0x80) != 0) {
          int v113 = __maskrune(v101, 0x40000uLL);
        }
        else {
          int v113 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[1] + 60) & 0x40000;
        }
        if (v113) {
          uint64_t v124 = v101;
        }
        else {
          uint64_t v124 = 46;
        }
        uint64_t v171 = v124;
        unsigned int v125 = a2[2];
        if ((char)a2[2] < 0) {
          int v126 = __maskrune(a2[2], 0x40000uLL);
        }
        else {
          int v126 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[2] + 60) & 0x40000;
        }
        if (v126) {
          uint64_t v131 = v125;
        }
        else {
          uint64_t v131 = 46;
        }
        uint64_t v169 = v131;
        unsigned int v132 = a2[3];
        if ((char)a2[3] < 0) {
          int v133 = __maskrune(a2[3], 0x40000uLL);
        }
        else {
          int v133 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2[3] + 60) & 0x40000;
        }
        if (v133) {
          uint64_t v136 = v132;
        }
        else {
          uint64_t v136 = 46;
        }
        uint64_t v167 = v136;
        if ((char)a2[4] < 0) {
          __maskrune(a2[4], 0x40000uLL);
        }
        if ((char)a2[5] < 0) {
          __maskrune(a2[5], 0x40000uLL);
        }
        if ((char)a2[6] < 0) {
          __maskrune(a2[6], 0x40000uLL);
        }
        if ((char)a2[7] < 0) {
          __maskrune(a2[7], 0x40000uLL);
        }
        if ((char)a2[8] < 0) {
          __maskrune(a2[8], 0x40000uLL);
        }
        if ((char)a2[9] < 0) {
          __maskrune(a2[9], 0x40000uLL);
        }
        if ((char)a2[10] < 0) {
          __maskrune(a2[10], 0x40000uLL);
        }
        if ((char)a2[11] < 0) {
          __maskrune(a2[11], 0x40000uLL);
        }
        if ((char)a2[12] < 0) {
          __maskrune(a2[12], 0x40000uLL);
        }
        if ((char)a2[13] < 0) {
          __maskrune(a2[13], 0x40000uLL);
        }
        int v155 = (char)a2[14];
        __darwin_ct_rune_t v156 = a2[14];
        if (v155 < 0) {
          __maskrune(v156, 0x40000uLL);
        }
        uint64_t result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x %02x %02x     |%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c |\n", v6, v99, v290, v278, v267, v256, v246, v237, v228, v220, v211, v203, v196, v189, v183, v178, v174,
                                 v171,
                                 v169,
                                 v167);
        break;
      default:
        return result;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}