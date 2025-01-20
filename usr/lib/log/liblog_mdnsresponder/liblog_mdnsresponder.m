uint64_t DNSMessageExtractDomainName(unint64_t a1, uint64_t a2, char *__src, char *__dst, void *a5)
{
  char *v6;
  uint64_t result;
  unint64_t v8;
  unsigned char *v10;
  unsigned int v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;

  if (__dst) {
    v6 = __dst + 256;
  }
  else {
    v6 = 0;
  }
  result = 4294960586;
  if ((unint64_t)__src < a1) {
    return result;
  }
  v8 = a1 + a2;
  if (a1 + a2 <= (unint64_t)__src) {
    return result;
  }
  v10 = __dst;
  v11 = *__src;
  if (*__src)
  {
    v12 = 0;
    do
    {
      if (v11 > 0x3F)
      {
        if ((~v11 & 0xC0) != 0) {
          return 4294960554;
        }
        if ((uint64_t)(v8 - (void)__src) < 2) {
          return 4294960546;
        }
        if (!v12)
        {
          v12 = __src + 2;
          if (!v10) {
            goto LABEL_23;
          }
        }
        __src = (char *)(a1 + (__src[1] | ((unint64_t)(v11 & 0x3F) << 8)));
        if ((unint64_t)__src >= v8) {
          return 4294960546;
        }
        v11 = *__src;
        if (v11 > 0xBF) {
          return 4294960554;
        }
      }
      else
      {
        v13 = &__src[v11 + 1];
        if ((unint64_t)v13 >= v8) {
          return 4294960546;
        }
        if (v10)
        {
          v14 = v11 + 1;
          if (v6 - v10 <= v14) {
            return 4294960545;
          }
          memcpy(v10, __src, v11 + 1);
          v10 += v14;
        }
        v11 = *v13;
        __src = v13;
      }
    }
    while (v11);
    if (!v10) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v12 = 0;
  if (__dst) {
LABEL_22:
  }
    *v10 = 0;
LABEL_23:
  result = 0;
  if (a5)
  {
    if (v12) {
      v15 = v12;
    }
    else {
      v15 = __src + 1;
    }
    *a5 = v15;
  }
  return result;
}

uint64_t DNSMessageExtractDomainNameString(unint64_t a1, uint64_t a2, char *a3, unsigned __int8 *a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  memset(__dst, 0, sizeof(__dst));
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!result)
  {
    uint64_t result = DomainNameToString((unsigned __int8 *)__dst, 0, a4, 0);
    if (a5)
    {
      if (!result) {
        *a5 = v8;
      }
    }
  }
  return result;
}

uint64_t DomainNameToString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, void *a4)
{
  if (a2 && (uint64_t)(a2 - (void)a1) < 1) {
    return 4294960546;
  }
  LODWORD(i) = *a1;
  if (*a1)
  {
    v5 = a1;
    do
    {
      if (i > 0x3F) {
        return 4294960554;
      }
      v6 = &v5[i + 1];
      if (v6 - a1 > 255) {
        return 4294960554;
      }
      if (a2 && (unint64_t)v6 >= a2) {
        return 4294960546;
      }
      v7 = v5 + 1;
      if (v7 < v6)
      {
        for (uint64_t i = i; i; --i)
        {
          unsigned __int8 v8 = *v7;
          if (((char)*v7 - 32) > 0x5E)
          {
            if ((*v7 & 0x80) == 0)
            {
              *a3 = 92;
              if (v8 <= 0x63u) {
                char v10 = 48;
              }
              else {
                char v10 = 49;
              }
              a3[1] = v10;
              if (v8 >= 0x64u) {
                char v11 = v8 / 0xAu - 10;
              }
              else {
                char v11 = v8 / 0xAu;
              }
              a3[2] = v11 + 48;
              a3[3] = (v8 % 0xAu) | 0x30;
              a3 += 4;
              goto LABEL_26;
            }
          }
          else if (*v7 - 32 <= 0x3C && ((1 << (v8 - 32)) & 0x1000000000004001) != 0)
          {
            *a3++ = 92;
          }
          *a3++ = v8;
LABEL_26:
          ++v7;
        }
      }
      *a3++ = 46;
      LODWORD(i) = *v6;
      v5 = v6;
    }
    while (*v6);
    if (v6 != a1) {
      goto LABEL_30;
    }
  }
  *a3++ = 46;
  v6 = a1;
LABEL_30:
  *a3 = 0;
  uint64_t result = 0;
  if (a4) {
    *a4 = v6 + 1;
  }
  return result;
}

uint64_t DNSMessageExtractQuestion(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, void *a7)
{
  v14 = 0;
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v14);
  if (!result)
  {
    v13 = v14;
    if (a1 + a2 - (unint64_t)v14 < 4)
    {
      return 4294960546;
    }
    else
    {
      if (a5) {
        *a5 = bswap32(*v14) >> 16;
      }
      if (a6) {
        *a6 = bswap32(v13[1]) >> 16;
      }
      uint64_t result = 0;
      if (a7) {
        *a7 = v13 + 2;
      }
    }
  }
  return result;
}

uint64_t DNSMessageExtractRecord(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, void *a10)
{
  return _DNSMessageExtractRecordEx(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0, 0, a10);
}

uint64_t _DNSMessageExtractRecordEx(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, char *a10, size_t a11, void *a12, void *a13, void *a14)
{
  v27 = 0;
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v27);
  if (!result)
  {
    v20 = v27;
    if (a1 + a2 - (unint64_t)v27 < 0xA) {
      return 4294960546;
    }
    v21 = (unsigned __int16 *)(v27 + 10);
    unint64_t v22 = __rev16(*((unsigned __int16 *)v27 + 4));
    if (a1 + a2 - (unint64_t)(v27 + 10) < v22)
    {
      return 4294960546;
    }
    else
    {
      unint64_t v25 = 0;
      size_t v26 = 0;
      unsigned int v23 = bswap32(*(unsigned __int16 *)v27) >> 16;
      if (!a11 && !a13
        || (uint64_t result = DNSMessageExtractRData(a1, a2, v27 + 10, v22, v23, a10, a11, &v26, &v25), !result))
      {
        if (a5) {
          *a5 = v23;
        }
        if (a6) {
          *a6 = bswap32(*((unsigned __int16 *)v20 + 1)) >> 16;
        }
        if (a7) {
          *a7 = bswap32(*((_DWORD *)v20 + 1));
        }
        if (a8) {
          *a8 = v21;
        }
        if (a9) {
          *a9 = v22;
        }
        if (a12) {
          *a12 = v26;
        }
        if (a13) {
          *a13 = v25;
        }
        uint64_t result = 0;
        if (a14) {
          *a14 = (char *)v21 + v22;
        }
      }
    }
  }
  return result;
}

uint64_t DNSMessageExtractRData(unint64_t a1, uint64_t a2, char *__src, unint64_t a4, int a5, char *a6, size_t a7, size_t *a8, unint64_t *a9)
{
  size_t v10 = a7;
  unint64_t v12 = a4;
  uint64_t v79 = *MEMORY[0x263EF8340];
  v76 = 0;
  memset(__srca, 0, 256);
  memset(__dst, 0, sizeof(__dst));
  v16 = &__src[a4];
  switch(a5)
  {
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 12:
    case 39:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        int v18 = __srca[0];
        v19 = __srca;
        if (__srca[0])
        {
          do
          {
            v20 = &v19[v18];
            int v21 = v20[1];
            v19 = v20 + 1;
            int v18 = v21;
          }
          while (v21);
        }
        unint64_t v12 = v19 - __srca + 1;
        if (v12 < v10) {
          size_t v10 = v19 - __srca + 1;
        }
        unint64_t v22 = __srca;
        unsigned int v23 = a6;
        goto LABEL_9;
      }
      break;
    case 6:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!result)
      {
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
        if (!result)
        {
          v49 = v76;
          if (v16 - (unsigned char *)v76 != 20) {
            goto LABEL_77;
          }
          int v50 = __srca[0];
          v51 = __srca;
          if (__srca[0])
          {
            do
            {
              v52 = &v51[v50];
              int v53 = v52[1];
              v51 = v52 + 1;
              int v50 = v53;
            }
            while (v53);
          }
          v54 = &a6[v10];
          int64_t v55 = v51 - __srca;
          int v56 = LOBYTE(__dst[0]);
          v57 = (char *)__dst;
          if (LOBYTE(__dst[0]))
          {
            do
            {
              v58 = &v57[v56];
              int v59 = v58[1];
              v57 = v58 + 1;
              int v56 = v59;
            }
            while (v59);
          }
          int64_t v60 = v57 - (char *)__dst;
          unint64_t v61 = v57 - (char *)__dst + 1;
          unint64_t v12 = v55 + v61 + 21;
          if (v55 + 1 < v10) {
            size_t v10 = v55 + 1;
          }
          memcpy(a6, __srca, v10);
          v62 = &a6[v10];
          if (v54 - v62 >= v61) {
            size_t v63 = v60 + 1;
          }
          else {
            size_t v63 = v54 - v62;
          }
          memcpy(v62, __dst, v63);
          v64 = &v62[v63];
          if ((unint64_t)(v54 - v64) >= 0x14) {
            size_t v65 = 20;
          }
          else {
            size_t v65 = v54 - v64;
          }
          goto LABEL_70;
        }
      }
      break;
    case 14:
    case 17:
    case 26:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!result)
      {
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
        if (!result)
        {
          if (v76 != v16) {
            goto LABEL_77;
          }
          int v36 = __srca[0];
          v37 = __srca;
          if (__srca[0])
          {
            do
            {
              v38 = &v37[v36];
              int v39 = v38[1];
              v37 = v38 + 1;
              int v36 = v39;
            }
            while (v39);
          }
          v40 = &a6[v10];
          unint64_t v41 = v37 - __srca + 1;
          int v42 = LOBYTE(__dst[0]);
          v43 = (char *)__dst;
          if (LOBYTE(__dst[0]))
          {
            do
            {
              v44 = &v43[v42];
              int v45 = v44[1];
              v43 = v44 + 1;
              int v42 = v45;
            }
            while (v45);
          }
          int64_t v46 = v43 - (char *)__dst;
          unint64_t v47 = v43 - (char *)__dst + 1;
          unint64_t v12 = v47 + v41;
          if (v41 < v10) {
            size_t v10 = v37 - __srca + 1;
          }
          memcpy(a6, __srca, v10);
          v33 = &a6[v10];
          if (v40 - v33 >= v47) {
            size_t v34 = v46 + 1;
          }
          else {
            size_t v34 = v40 - v33;
          }
          v35 = (char *)__dst;
          goto LABEL_36;
        }
      }
      break;
    case 15:
    case 18:
    case 21:
    case 36:
      if (a4 < 3) {
        goto LABEL_77;
      }
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src + 2, __srca, &v76);
      if (!result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        v24 = &a6[v10];
        int v25 = __srca[0];
        size_t v26 = __srca;
        if (__srca[0])
        {
          do
          {
            v27 = &v26[v25];
            int v28 = v27[1];
            size_t v26 = v27 + 1;
            int v25 = v28;
          }
          while (v28);
        }
        int64_t v29 = v26 - __srca;
        unint64_t v30 = v26 - __srca + 1;
        unint64_t v12 = v26 - __srca + 3;
        BOOL v31 = v10 >= 2;
        uint64_t v32 = 2;
        goto LABEL_16;
      }
      break;
    case 33:
      if (a4 < 7) {
        goto LABEL_77;
      }
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src + 6, __srca, &v76);
      if (!result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        v24 = &a6[v10];
        int v66 = __srca[0];
        v67 = __srca;
        if (__srca[0])
        {
          do
          {
            v68 = &v67[v66];
            int v69 = v68[1];
            v67 = v68 + 1;
            int v66 = v69;
          }
          while (v69);
        }
        int64_t v29 = v67 - __srca;
        unint64_t v30 = v67 - __srca + 1;
        unint64_t v12 = v67 - __srca + 7;
        BOOL v31 = v10 >= 6;
        uint64_t v32 = 6;
LABEL_16:
        if (v31) {
          size_t v10 = v32;
        }
        memcpy(a6, __src, v10);
        v33 = &a6[v10];
        if (v24 - v33 >= v30) {
          size_t v34 = v29 + 1;
        }
        else {
          size_t v34 = v24 - v33;
        }
        v35 = __srca;
LABEL_36:
        memcpy(v33, v35, v34);
        v48 = &v33[v34];
        goto LABEL_71;
      }
      break;
    case 47:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!result)
      {
        v49 = v76;
        if (v76 <= v16)
        {
          v70 = &a6[v10];
          int v71 = __srca[0];
          v72 = __srca;
          if (__srca[0])
          {
            do
            {
              v73 = &v72[v71];
              int v74 = v73[1];
              v72 = v73 + 1;
              int v71 = v74;
            }
            while (v74);
          }
          unint64_t v75 = v16 - (unsigned char *)v76;
          unint64_t v12 = v72 - __srca + 1 + v16 - (unsigned char *)v76;
          if (v72 - __srca + 1 < v10) {
            size_t v10 = v72 - __srca + 1;
          }
          memcpy(a6, __srca, v10);
          v64 = &a6[v10];
          if (v70 - v64 >= v75) {
            size_t v65 = v16 - v49;
          }
          else {
            size_t v65 = v70 - v64;
          }
LABEL_70:
          memcpy(v64, v49, v65);
          v48 = &v64[v65];
LABEL_71:
          size_t v10 = v48 - a6;
          goto LABEL_72;
        }
LABEL_77:
        uint64_t result = 4294960554;
      }
      break;
    default:
      if (a7 >= a4) {
        size_t v10 = a4;
      }
      unsigned int v23 = a6;
      unint64_t v22 = __src;
LABEL_9:
      memcpy(v23, v22, v10);
LABEL_72:
      if (a8) {
        *a8 = v10;
      }
      uint64_t result = 0;
      if (a9) {
        *a9 = v12;
      }
      break;
  }
  return result;
}

uint64_t DomainNameLength(unsigned char *a1)
{
  int v1 = *a1;
  v2 = a1;
  if (*a1)
  {
    v2 = a1;
    do
    {
      v3 = &v2[v1];
      int v4 = v3[1];
      v2 = v3 + 1;
      int v1 = v4;
    }
    while (v4);
  }
  return v2 - a1 + 1;
}

uint64_t DNSMessageGetAnswerSection(unint64_t a1, unint64_t a2, char **a3)
{
  if (a2 < 0xC) {
    return 4294960553;
  }
  v12[7] = v3;
  v12[8] = v4;
  unsigned int v7 = __rev16(*(unsigned __int16 *)(a1 + 4));
  unsigned __int8 v8 = (char *)(a1 + 12);
  if (v7)
  {
    unint64_t v10 = a1 + a2;
    while (1)
    {
      v12[0] = 0;
      uint64_t result = DNSMessageExtractDomainName(a1, a2, v8, 0, v12);
      if (result) {
        break;
      }
      if (v10 - v12[0] <= 3) {
        return 4294960546;
      }
      unsigned __int8 v8 = (char *)(v12[0] + 4);
      if (!--v7) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t result = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  return result;
}

uint64_t DNSMessageGetOptRecord(unsigned __int16 *a1, unint64_t a2, void *a3, char **a4)
{
  v17 = 0;
  uint64_t result = DNSMessageGetAnswerSection((unint64_t)a1, a2, &v17);
  if (!result)
  {
    unsigned int v9 = __rev16(a1[4]) + (bswap32(a1[3]) >> 16);
    if (v9)
    {
      while (1)
      {
        __int16 v16 = 0;
        LODWORD(result) = _DNSMessageExtractRecordEx((unint64_t)a1, a2, v17, 0, &v16, 0, 0, 0, 0, 0, 0, 0, 0, &v17);
        if (result || v16 == 41) {
          break;
        }
        if (!--v9) {
          goto LABEL_6;
        }
      }
      if (v16 == 41) {
        unsigned int v14 = -6742;
      }
      else {
        unsigned int v14 = 0;
      }
      if (result) {
        return result;
      }
      else {
        return v14;
      }
    }
    else
    {
LABEL_6:
      unsigned int v10 = __rev16(a1[5]);
      if (v10)
      {
        char v11 = 0;
        unint64_t v12 = 0;
        while (1)
        {
          __int16 v15 = 0;
          v13 = v17;
          uint64_t result = _DNSMessageExtractRecordEx((unint64_t)a1, a2, v17, 0, &v15, 0, 0, 0, 0, 0, 0, 0, 0, &v17);
          if (result) {
            break;
          }
          if (v15 == 41)
          {
            if (v12 || *v13) {
              return 4294960554;
            }
            char v11 = (char *)(v17 - v13);
            unint64_t v12 = v13;
          }
          else
          {
            v13 = v12;
          }
          if (!--v10)
          {
            if (!a3) {
              goto LABEL_17;
            }
            goto LABEL_16;
          }
        }
      }
      else
      {
        v13 = 0;
        char v11 = 0;
        if (a3) {
LABEL_16:
        }
          *a3 = v13;
LABEL_17:
        uint64_t result = 0;
        if (a4) {
          *a4 = v11;
        }
      }
    }
  }
  return result;
}

uint64_t DNSMessageGetExtendedDNSError(unsigned __int16 *a1, unint64_t a2, _WORD *a3, char **a4, _WORD *a5)
{
  __int16 v15 = 0;
  uint64_t v16 = 0;
  uint64_t result = DNSMessageGetOptRecord(a1, a2, &v16, &v15);
  if (!result)
  {
    if (v16)
    {
      if ((unint64_t)v15 < 0xB) {
        return 4294960546;
      }
      unsigned int v9 = &v15[v16];
      unsigned int v10 = (char *)(v16 + 11);
      while (v10 < v9)
      {
        char v11 = v10;
        if ((unint64_t)(v9 - v10) < 4) {
          return 4294960546;
        }
        int64_t v12 = __rev16(*((unsigned __int16 *)v10 + 1));
        if (v9 - (v10 + 4) < v12) {
          return 4294960546;
        }
        unsigned int v13 = __rev16(*(unsigned __int16 *)v10);
        v10 += v12 + 4;
        if (v13 == 15)
        {
          if (v12 < 2) {
            return 4294960546;
          }
          unsigned int v14 = v11 + 6;
          if ((_WORD)v10 == (_WORD)v11 + 6) {
            unsigned int v14 = 0;
          }
          if (a3) {
            *a3 = bswap32(*((unsigned __int16 *)v11 + 2)) >> 16;
          }
          if (a4) {
            *a4 = v14;
          }
          uint64_t result = 0;
          if (a5) {
            *a5 = (_WORD)v10 - ((_WORD)v11 + 6);
          }
          return result;
        }
      }
    }
    return 4294960569;
  }
  return result;
}

uint64_t DNSMessageWriteQuery(__int16 a1, __int16 a2, unsigned char *__src, __int16 a4, __int16 a5, uint64_t a6, void *a7)
{
  *(_WORD *)(a6 + 10) = 0;
  *(_DWORD *)(a6 + 6) = 0;
  *(unsigned char *)a6 = HIBYTE(a1);
  *(unsigned char *)(a6 + 1) = a1;
  *(unsigned char *)(a6 + 2) = HIBYTE(a2);
  *(unsigned char *)(a6 + 3) = a2;
  *(_WORD *)(a6 + 4) = 256;
  int v11 = *__src;
  int64_t v12 = __src;
  if (*__src)
  {
    int64_t v12 = __src;
    do
    {
      unsigned int v13 = &v12[v11];
      int v14 = v13[1];
      int64_t v12 = v13 + 1;
      int v11 = v14;
    }
    while (v14);
  }
  unint64_t v15 = v12 - __src + 1;
  if (v15 > 0x100) {
    return 4294960553;
  }
  memcpy((void *)(a6 + 12), __src, v12 - __src + 1);
  uint64_t v16 = (unsigned char *)(a6 + 12 + v15);
  unsigned char *v16 = HIBYTE(a4);
  v16[1] = a4;
  v16[2] = HIBYTE(a5);
  v16[3] = a5;
  uint64_t result = 0;
  if (a7) {
    *a7 = v15 + 16;
  }
  return result;
}

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, void *a3, char **a4)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  int v53 = 0;
  int v52 = 0;
  memset(__src, 0, 256);
  memset(__dst, 0, sizeof(__dst));
  if (a2 < 0xC)
  {
LABEL_69:
    int v36 = 0;
    v20 = 0;
    int DomainName = -6743;
    goto LABEL_58;
  }
  if (__rev16(*(unsigned __int16 *)(a1 + 4)) != 1)
  {
    int v36 = 0;
    v20 = 0;
    int DomainName = -6764;
    goto LABEL_58;
  }
  int v53 = (char *)(a1 + 12);
  int DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, (_WORD *)&v52 + 1, &v52, &v53);
  if (DomainName) {
    goto LABEL_63;
  }
  if ((unsigned __int16)v52 != 1)
  {
    int v36 = 0;
    v20 = 0;
    int DomainName = -6756;
    goto LABEL_58;
  }
  int v9 = __src[0];
  v38 = a3;
  unsigned int v10 = __src;
  if (__src[0])
  {
    do
    {
      int v11 = &v10[v9];
      int v12 = v11[1];
      unsigned int v10 = v11 + 1;
      int v9 = v12;
    }
    while (v12);
  }
  int64_t v13 = v10 - __src;
  unint64_t __n = v10 - __src + 1;
  unint64_t v41 = v53;
  __memcpy_chk();
  unsigned int v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
  if (v14)
  {
    int v15 = 0;
    unsigned int v43 = -1;
LABEL_9:
    int v16 = 0;
    int v53 = v41;
    char v17 = 1;
    while (1)
    {
      v51 = 0;
      LODWORD(v49) = 0;
      LOWORD(v48) = 0;
      unsigned __int16 v50 = 0;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      int DomainName = _DNSMessageExtractRecordEx(a1, a2, v53, (char *)&v54, &v48, &v50, &v49, (unsigned __int16 **)&v51, 0, 0, 0, 0, 0, &v53);
      if (DomainName) {
        break;
      }
      if ((unsigned __int16)v48 == 5
        && v50 == (unsigned __int16)v52
        && DomainNameEqual((unsigned __int8 *)&v54, (unsigned __int8 *)__dst))
      {
        int DomainName = DNSMessageExtractDomainName(a1, a2, v51, __dst, 0);
        if (DomainName) {
          break;
        }
        char v17 = 0;
        unsigned int v18 = v43;
        if (v43 >= v49) {
          unsigned int v18 = v49;
        }
        unsigned int v43 = v18;
        if (++v16 == v14) {
          goto LABEL_22;
        }
      }
      else if (v14 == ++v16)
      {
        if (v17) {
          goto LABEL_25;
        }
LABEL_22:
        if (++v15 != v14) {
          goto LABEL_9;
        }
        goto LABEL_25;
      }
    }
LABEL_63:
    int v36 = 0;
LABEL_57:
    v20 = 0;
    goto LABEL_58;
  }
  unsigned int v43 = -1;
LABEL_25:
  int v39 = a4;
  int64_t v46 = 0;
  v19 = 0;
  v20 = 0;
  size_t size = v13 + 17;
  char v21 = 1;
  a4 = &v53;
  while (1)
  {
    char v42 = v21;
    int v53 = v41;
    if (v14) {
      break;
    }
    unsigned int v45 = 0;
    if (v20) {
      goto LABEL_52;
    }
LABEL_45:
    if (!size || (int64_t v29 = (char *)malloc_type_calloc(1uLL, size, 0xF1748037uLL)) == 0)
    {
      __break(1u);
      goto LABEL_69;
    }
    v20 = v29;
    if (size < 0xC) {
      goto LABEL_67;
    }
    int v30 = *(_DWORD *)a1;
    *((_WORD *)v29 + 2) = *(_WORD *)(a1 + 4);
    *(_DWORD *)int64_t v29 = v30;
    *(_DWORD *)(v29 + 6) = 0;
    *((_WORD *)v29 + 5) = 0;
    if (size - 12 < __n) {
      goto LABEL_67;
    }
    BOOL v31 = &v29[size];
    uint64_t v32 = v29 + 12;
    memcpy(v29 + 12, __src, __n);
    v33 = &v32[__n];
    int64_t v46 = v31;
    if ((unint64_t)(v31 - &v32[__n]) < 4) {
      goto LABEL_67;
    }
    char v21 = 0;
    char v34 = BYTE2(v52);
    __int16 v35 = v52;
    char *v33 = HIBYTE(v52);
    v33[1] = v34;
    v33[2] = HIBYTE(v35);
    v33[3] = v35;
    v19 = v33 + 4;
    *((_WORD *)v20 + 2) = 256;
    if ((v42 & 1) == 0) {
      goto LABEL_54;
    }
  }
  unsigned int v45 = 0;
  unsigned int v22 = v14;
  do
  {
    v51 = 0;
    size_t v49 = 0;
    unsigned int v48 = 0;
    unsigned __int16 v50 = 0;
    unsigned __int16 v47 = 0;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    unsigned int v23 = v53;
    int DomainName = _DNSMessageExtractRecordEx(a1, a2, v53, (char *)&v54, &v50, &v47, &v48, 0, 0, 0, 0, 0, &v49, &v53);
    if (DomainName) {
      goto LABEL_65;
    }
    if (v50 == HIWORD(v52)
      && v47 == (unsigned __int16)v52
      && DomainNameEqual((unsigned __int8 *)&v54, (unsigned __int8 *)__dst))
    {
      if (v20)
      {
        if (v46 - v19 < 2) {
          goto LABEL_64;
        }
        *(_WORD *)v19 = 3264;
        if ((unint64_t)(v46 - v19 - 2) < 0xA) {
          goto LABEL_64;
        }
        unsigned int v24 = v48;
        if (v48 >= v43) {
          unsigned int v24 = v43;
        }
        unsigned int v48 = v24;
        char v25 = v50;
        unsigned __int16 v26 = v47;
        __int16 v27 = v49;
        v19[2] = HIBYTE(v50);
        v19[3] = v25;
        v19[4] = HIBYTE(v26);
        v19[5] = v26;
        v19[6] = HIBYTE(v24);
        v19[7] = BYTE2(v24);
        v19[8] = BYTE1(v24);
        v19[9] = v24;
        v19[10] = HIBYTE(v27);
        v19[11] = v27;
        int v28 = v19 + 12;
        if (v46 - v28 < v49)
        {
LABEL_64:
          int DomainName = -6762;
LABEL_65:
          int v36 = 0;
          goto LABEL_66;
        }
        int DomainName = _DNSMessageExtractRecordEx(a1, a2, v23, 0, 0, 0, 0, 0, 0, v28, v49, &v51, 0, 0);
        if (DomainName) {
          goto LABEL_65;
        }
        v19 = &v51[(void)v28];
        ++v45;
      }
      else
      {
        size += v49 + 12;
      }
    }
    --v22;
  }
  while (v22);
  if (!v20) {
    goto LABEL_45;
  }
LABEL_52:
  if (size >= 0xC)
  {
    *((_WORD *)v20 + 3) = bswap32(v45) >> 16;
LABEL_54:
    a4 = v39;
    int DomainName = 0;
    if (v38) {
      void *v38 = v19 - v20;
    }
    int v36 = v20;
    goto LABEL_57;
  }
LABEL_67:
  int v36 = 0;
  int DomainName = -6762;
LABEL_66:
  a4 = v39;
LABEL_58:
  if (a4) {
    *(_DWORD *)a4 = DomainName;
  }
  if (v20) {
    free(v20);
  }
  return v36;
}

uint64_t DomainNameEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 1;
  }
  v2 = a2;
  uint64_t v3 = a1;
  while (1)
  {
    uint64_t v4 = *v3;
    if (v3 != v2)
    {
      int v5 = *v2;
      if (v4 != v5 || mdns_memcmp_us_ascii_case_insensitive(v3 + 1, v2 + 1, *v3, v5)) {
        break;
      }
    }
    v3 += v4 + 1;
    v2 += v4 + 1;
    if (!v4) {
      return 1;
    }
  }
  return 0;
}

uint64_t DomainNameAppendDomainName(unsigned char *a1, unsigned char *a2, void *a3)
{
  int v5 = *a1;
  v6 = a1;
  if (*a1)
  {
    v6 = a1;
    do
    {
      unsigned int v7 = &v6[v5];
      int v8 = v7[1];
      v6 = v7 + 1;
      int v5 = v8;
    }
    while (v8);
  }
  unint64_t v9 = v6 - a1;
  int v10 = *a2;
  int v11 = a2;
  if (*a2)
  {
    int v11 = a2;
    do
    {
      int v12 = &v11[v10];
      int v13 = v12[1];
      int v11 = v12 + 1;
      int v10 = v13;
    }
    while (v13);
  }
  uint64_t result = 4294960553;
  if (v9 <= 0x100)
  {
    size_t v15 = v11 - a2 + 1;
    if (v15 <= 0x100)
    {
      size_t v16 = v15 + v9;
      if (v15 + v9 <= 0x100)
      {
        memcpy(&a1[v9], a2, v15);
        uint64_t result = 0;
        if (a3) {
          *a3 = &a1[v16];
        }
      }
    }
  }
  return result;
}

uint64_t DomainNameAppendString(unsigned char *a1, char *a2, void *a3)
{
  uint64_t v3 = a1;
  while (*v3)
  {
    v3 += *v3 + 1;
    if (v3 >= a1 + 256) {
      return 4294960554;
    }
  }
  int v5 = *a2;
  if (*a2)
  {
    if (v5 != 46) {
      goto LABEL_9;
    }
    if (a2[1])
    {
      int v5 = 46;
LABEL_9:
      unint64_t v6 = (unint64_t)(a1 + 255);
      do
      {
        if ((unint64_t)(v3 + 64) >= v6) {
          unsigned int v7 = (unsigned char *)v6;
        }
        else {
          unsigned int v7 = v3 + 64;
        }
        int v8 = v3 + 1;
        unint64_t v9 = v3 + 1;
        int v10 = (unsigned __int8 *)a2;
        do
        {
          a2 = (char *)(v10 + 1);
          if (v5 == 92)
          {
            int v5 = *a2;
            if (!*a2) {
              return 4294960546;
            }
            a2 = (char *)(v10 + 2);
            if (v5 - 48 <= 9)
            {
              int v11 = *a2;
              if ((v11 - 48) <= 9)
              {
                int v12 = v10[3];
                if ((v12 - 48) <= 9)
                {
                  int v13 = 100 * v5 + 10 * (char)v11 + (char)v12;
                  unsigned int v14 = (char *)(v10 + 4);
                  if (v13 < 5584)
                  {
                    a2 = v14;
                    LOBYTE(v5) = v13 + 48;
                  }
                }
              }
            }
          }
          else if (v5 == 46)
          {
            break;
          }
          if (v9 >= v7) {
            return 4294960545;
          }
          *v9++ = v5;
          int v5 = *a2;
          int v10 = (unsigned __int8 *)a2;
        }
        while (*a2);
        if (v9 == v8) {
          return 4294960554;
        }
        unsigned char *v3 = (_BYTE)v9 - (_BYTE)v8;
        *unint64_t v9 = 0;
        int v5 = *a2;
        uint64_t v3 = v9;
      }
      while (*a2);
      goto LABEL_29;
    }
  }
  unint64_t v9 = v3;
LABEL_29:
  uint64_t result = 0;
  if (a3) {
    *a3 = v9 + 1;
  }
  return result;
}

unsigned char *DomainNameDupEx(unsigned char *result, int a2, unsigned __int8 **a3, size_t *a4)
{
  unsigned int v7 = result;
  int v8 = *result;
  unint64_t v9 = result;
  if (*result)
  {
    unint64_t v9 = result;
    do
    {
      int v10 = &v9[v8];
      int v11 = v10[1];
      unint64_t v9 = v10 + 1;
      int v8 = v11;
    }
    while (v11);
  }
  size_t v12 = v9 - result + 1;
  if (v9 - result == -1 || (uint64_t result = malloc_type_malloc(v9 - result + 1, 0xA172743EuLL)) == 0)
  {
    __break(1u);
  }
  else
  {
    int v13 = result;
    memcpy(result, v7, v12);
    if (a2)
    {
      unsigned int v14 = *v13;
      if (*v13)
      {
        size_t v15 = v13;
        do
        {
          size_t v16 = v15 + 1;
          char v17 = v16;
          uint64_t v18 = v14;
          do
          {
            int v19 = *v17;
            if ((v19 - 65) < 0x1A) {
              LOBYTE(v19) = v19 + 32;
            }
            *v17++ = v19;
            --v18;
          }
          while (v18);
          size_t v15 = &v16[v14];
          unsigned int v14 = *v15;
        }
        while (*v15);
      }
    }
    *a3 = v13;
    if (a4) {
      *a4 = v12;
    }
    return 0;
  }
  return result;
}

BOOL DomainLabelEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = *a1;
  int v3 = *a2;
  return v2 == v3 && mdns_memcmp_us_ascii_case_insensitive(a1 + 1, a2 + 1, v2, v3) == 0;
}

uint64_t DomainNameFromString(unsigned char *a1, char *a2, void *a3)
{
  *a1 = 0;
  return DomainNameAppendString(a1, a2, a3);
}

uint64_t DomainNameLabelCount(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)result;
  if (!*(unsigned char *)result) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  int v3 = (unsigned char *)v2;
  while (v1 <= 0x3F)
  {
    v3 += v1 + 1;
    if ((uint64_t)&v3[-v2] > 255) {
      break;
    }
    uint64_t result = (result + 1);
    unsigned int v1 = *v3;
    if (!*v3) {
      return result;
    }
  }
  return 0xFFFFFFFFLL;
}

const char *DNSRecordTypeValueToString(int a1)
{
  if (a1 > 248)
  {
    if (a1 >= 0x8000)
    {
      switch(a1)
      {
        case 0x8000:
          return "TA";
        case 0x8001:
          return "DLV";
        case 0xFFFF:
          return "Reserved";
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 249:
          uint64_t result = "TKEY";
          break;
        case 250:
          uint64_t result = "TSIG";
          break;
        case 251:
          uint64_t result = "IXFR";
          break;
        case 252:
          uint64_t result = "AXFR";
          break;
        case 253:
          uint64_t result = "MAILB";
          break;
        case 254:
          uint64_t result = "MAILA";
          break;
        case 255:
          uint64_t result = "ANY";
          break;
        case 256:
          uint64_t result = "URI";
          break;
        case 257:
          uint64_t result = "CAA";
          break;
        case 258:
          uint64_t result = "AVC";
          break;
        case 259:
          uint64_t result = "DOA";
          break;
        case 260:
          uint64_t result = "AMTRELAY";
          break;
        default:
          return 0;
      }
    }
  }
  else
  {
    int v1 = a1 - 1;
    uint64_t result = "A";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "NS";
        break;
      case 2:
        uint64_t result = "MD";
        break;
      case 3:
        uint64_t result = "MF";
        break;
      case 4:
        uint64_t result = "CNAME";
        break;
      case 5:
        uint64_t result = "SOA";
        break;
      case 6:
        uint64_t result = "MB";
        break;
      case 7:
        uint64_t result = "MG";
        break;
      case 8:
        uint64_t result = "MR";
        break;
      case 9:
        uint64_t result = "NULL";
        break;
      case 10:
        uint64_t result = "WKS";
        break;
      case 11:
        uint64_t result = "PTR";
        break;
      case 12:
        uint64_t result = "HINFO";
        break;
      case 13:
        uint64_t result = "MINFO";
        break;
      case 14:
        uint64_t result = "MX";
        break;
      case 15:
        uint64_t result = "TXT";
        break;
      case 16:
        uint64_t result = "RP";
        break;
      case 17:
        uint64_t result = "AFSDB";
        break;
      case 18:
        uint64_t result = "X25";
        break;
      case 19:
        uint64_t result = "ISDN";
        break;
      case 20:
        uint64_t result = "RT";
        break;
      case 21:
        uint64_t result = "NSAP";
        break;
      case 22:
        uint64_t result = "NSAP-PTR";
        break;
      case 23:
        uint64_t result = "SIG";
        break;
      case 24:
        uint64_t result = "KEY";
        break;
      case 25:
        uint64_t result = "PX";
        break;
      case 26:
        uint64_t result = "GPOS";
        break;
      case 27:
        uint64_t result = "AAAA";
        break;
      case 28:
        uint64_t result = "LOC";
        break;
      case 29:
        uint64_t result = "NXT";
        break;
      case 30:
        uint64_t result = "EID";
        break;
      case 31:
        uint64_t result = "NIMLOC";
        break;
      case 32:
        uint64_t result = "SRV";
        break;
      case 33:
        uint64_t result = "ATMA";
        break;
      case 34:
        uint64_t result = "NAPTR";
        break;
      case 35:
        uint64_t result = "KX";
        break;
      case 36:
        uint64_t result = "CERT";
        break;
      case 37:
        uint64_t result = "A6";
        break;
      case 38:
        uint64_t result = "DNAME";
        break;
      case 39:
        uint64_t result = "SINK";
        break;
      case 40:
        uint64_t result = "OPT";
        break;
      case 41:
        uint64_t result = "APL";
        break;
      case 42:
        uint64_t result = "DS";
        break;
      case 43:
        uint64_t result = "SSHFP";
        break;
      case 44:
        uint64_t result = "IPSECKEY";
        break;
      case 45:
        uint64_t result = "RRSIG";
        break;
      case 46:
        uint64_t result = "NSEC";
        break;
      case 47:
        uint64_t result = "DNSKEY";
        break;
      case 48:
        uint64_t result = "DHCID";
        break;
      case 49:
        uint64_t result = "NSEC3";
        break;
      case 50:
        uint64_t result = "NSEC3PARAM";
        break;
      case 51:
        uint64_t result = "TLSA";
        break;
      case 52:
        uint64_t result = "SMIMEA";
        break;
      case 54:
        uint64_t result = "HIP";
        break;
      case 55:
        uint64_t result = "NINFO";
        break;
      case 56:
        uint64_t result = "RKEY";
        break;
      case 57:
        uint64_t result = "TALINK";
        break;
      case 58:
        uint64_t result = "CDS";
        break;
      case 59:
        uint64_t result = "CDNSKEY";
        break;
      case 60:
        uint64_t result = "OPENPGPKEY";
        break;
      case 61:
        uint64_t result = "CSYNC";
        break;
      case 62:
        uint64_t result = "ZONEMD";
        break;
      case 63:
        uint64_t result = "SVCB";
        break;
      case 64:
        uint64_t result = "HTTPS";
        break;
      case 98:
        uint64_t result = "SPF";
        break;
      case 99:
        uint64_t result = "UINFO";
        break;
      case 100:
        uint64_t result = "UID";
        break;
      case 101:
        uint64_t result = "GID";
        break;
      case 102:
        uint64_t result = "UNSPEC";
        break;
      case 103:
        uint64_t result = "NID";
        break;
      case 104:
        uint64_t result = "L32";
        break;
      case 105:
        uint64_t result = "L64";
        break;
      case 106:
        uint64_t result = "LP";
        break;
      case 107:
        uint64_t result = "EUI48";
        break;
      case 108:
        uint64_t result = "EUI64";
        break;
      default:
        return 0;
    }
  }
  return result;
}

unsigned __int16 *DNSRecordTypeStringToValue(const void *a1)
{
  uint64_t result = (unsigned __int16 *)bsearch(a1, &DNSRecordTypeStringToValue_sTable, 0x5AuLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRecordTypeStringToValueCmp);
  if (result) {
    return (unsigned __int16 *)result[4];
  }
  return result;
}

uint64_t _DNSRecordTypeStringToValueCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

const char *DNSClassTypeToString(int a1)
{
  int v1 = "ANY";
  if (a1 != 255) {
    int v1 = 0;
  }
  if (a1 == 1) {
    return "IN";
  }
  else {
    return v1;
  }
}

const char *DNSRCodeToString(int a1)
{
  uint64_t result = "NoError";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "FormErr";
      break;
    case 2:
      uint64_t result = "ServFail";
      break;
    case 3:
      uint64_t result = "NXDomain";
      break;
    case 4:
      uint64_t result = "NotImp";
      break;
    case 5:
      uint64_t result = "Refused";
      break;
    case 6:
      uint64_t result = "YXDomain";
      break;
    case 7:
      uint64_t result = "YXRRSet";
      break;
    case 8:
      uint64_t result = "NXRRSet";
      break;
    case 9:
      uint64_t result = "NotAuth";
      break;
    case 10:
      uint64_t result = "NotZone";
      break;
    case 11:
      uint64_t result = "DSOTYPENI";
      break;
    case 12:
    case 13:
    case 14:
    case 15:
      goto LABEL_5;
    case 16:
      uint64_t result = "BADVERS";
      break;
    case 17:
      uint64_t result = "BADKEY";
      break;
    case 18:
      uint64_t result = "BADTIME";
      break;
    case 19:
      uint64_t result = "BADMODE";
      break;
    case 20:
      uint64_t result = "BADNAME";
      break;
    case 21:
      uint64_t result = "BADALG";
      break;
    case 22:
      uint64_t result = "BADTRUNC";
      break;
    case 23:
      uint64_t result = "BADCOOKIE";
      break;
    default:
      if (a1 == 0xFFFF) {
        uint64_t result = "Reserved";
      }
      else {
LABEL_5:
      }
        uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t DNSRCodeFromString(const void *a1)
{
  int v1 = (unsigned int *)bsearch(a1, &DNSRCodeFromString_sTable, 0x15uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRCodeFromStringCmp);
  if (v1) {
    return v1[2];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t _DNSRCodeFromStringCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

uint64_t DNSMessageToString(unsigned __int16 *a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  __src[127] = *(void **)MEMORY[0x263EF8340];
  v110 = 0;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  }
  uint64_t v113 = 0;
  memset(v112, 0, sizeof(v112));
  v111 = 0;
  uint64_t v109 = 0;
  memset(v123, 0, sizeof(v123));
  bzero(v122, 0x3F1uLL);
  memset(v121, 0, 256);
  memset(v120, 0, sizeof(v120));
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_648;
  }
  _GetCUSymAddr_DataBuffer_Init_sAddr(v112, v123, 512, -1);
  if (a2 < 0xC)
  {
LABEL_651:
    uint64_t v90 = 4294960553;
    goto LABEL_641;
  }
  unint64_t v8 = ((unint64_t)*((unsigned __int8 *)a1 + 2) >> 3) & 0xF;
  unsigned int v105 = __rev16(a1[2]);
  unsigned int v103 = __rev16(a1[3]);
  unsigned int v102 = __rev16(a1[4]);
  uint64_t v100 = a4;
  unsigned int v101 = __rev16(a1[5]);
  unint64_t v9 = "";
  unsigned int v106 = a3;
  unint64_t v107 = (unint64_t)a1;
  if ((a3 & 0x20) == 0)
  {
    unint64_t v10 = *((unsigned __int8 *)a1 + 3) | (*((unsigned __int8 *)a1 + 2) << 8);
    uint64_t v11 = __rev16(*a1);
    if ((a3 & 4) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      int v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
      uint64_t v16 = 81;
      if ((v10 & 0x8000u) != 0) {
        uint64_t v16 = 82;
      }
      unint64_t v97 = v10;
      uint64_t v98 = v16;
      uint64_t v96 = v11;
      size_t v15 = "id: 0x%04X (%u), flags: 0x%04X (%c/";
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "ID:               0x%04X (%u)\n", v11, v11);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      int v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
      uint64_t v14 = 81;
      if ((v10 & 0x8000u) != 0) {
        uint64_t v14 = 82;
      }
      uint64_t v96 = v14;
      size_t v15 = "Flags:            0x%04X %c/";
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = v13(v112, v15);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_640;
    }
    if (v8 > 6 || v8 == 3)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      int v17 = v8;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "OPCODE%d");
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      int v17 = v8;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s");
    }
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_640;
    }
    for (uint64_t i = 0; i != 14; i += 2)
    {
      if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v10) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, ", %s", (&kDNSHeaderFlagsDescs)[i]);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
      }
    }
    int v19 = DNSRCodeToString(v10 & 0xF);
    if (v19)
    {
      v20 = v19;
      LODWORD(v8) = v17;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      unint64_t v94 = (unint64_t)v20;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, ", %s");
    }
    else
    {
      LODWORD(v8) = v17;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      unint64_t v94 = v10 & 0xF;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, ", RCODE%d");
    }
    if (CUSymAddr_DataBuffer_AppendF_sAddr)
    {
LABEL_640:
      uint64_t v90 = CUSymAddr_DataBuffer_AppendF_sAddr;
      goto LABEL_641;
    }
    if ((a3 & 4) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, ")", v94, v96);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      if ((a3 & 0x40) != 0) {
        goto LABEL_632;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, ", counts: %u/%u/%u/%u", v105, v103, v102, v101);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      unint64_t v9 = ", ";
    }
    else
    {
      if ((a3 & 0x40) != 0)
      {
LABEL_632:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_226);
        }
        if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v112, "", 1);
        if (!CUSymAddr_DataBuffer_AppendF_sAddr)
        {
          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_230);
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Detach_sAddr(v112, v100, &v109);
            goto LABEL_640;
          }
LABEL_648:
          uint64_t v90 = 4294960561;
          goto LABEL_641;
        }
        goto LABEL_640;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "\n", v94, v96);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "Question count:   %u\n", v105);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "Answer count:     %u\n", v103);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "Authority count:  %u\n", v102);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "Additional count: %u\n", v101);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      unint64_t v9 = "";
    }
  }
  if ((a3 & 0x10) != 0) {
    goto LABEL_632;
  }
  int v99 = v8;
  int v108 = (a3 >> 3) & 1;
  v111 = (char *)(v107 + 12);
  if (v105)
  {
    char v21 = 0;
    int v22 = 0;
    unsigned int v23 = v121;
    while (1)
    {
      LOWORD(__src[0]) = 0;
      LOWORD(v124[0]) = 0;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DNSMessageExtractQuestion(v107, a2, v111, v23, __src, v124, &v111);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      BOOL v24 = SLOWORD(v124[0]) < 0;
      if (a3) {
        LOWORD(v124[0]) &= ~0x8000u;
      }
      char v25 = a3;
      int v26 = a3 & v24;
      if ((v25 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s", v9);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (v21 && DomainNameEqual((unsigned __int8 *)v23, v21))
        {
          __int16 v27 = v23;
          unsigned int v23 = (char *)v21;
        }
        else
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0, v122, 0);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
          if (v108 && _NameIsPrivate((const char *)v122))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s ");
          }
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
          if (v23 == v121) {
            __int16 v27 = (char *)v120;
          }
          else {
            __int16 v27 = v121;
          }
          char *v27 = 0;
        }
        BOOL v31 = "ANY";
        if (LOWORD(v124[0]) != 255) {
          BOOL v31 = 0;
        }
        if (LOWORD(v124[0]) == 1) {
          uint64_t v32 = "IN";
        }
        else {
          uint64_t v32 = v31;
        }
        if (v32)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "CLASS%u");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (v106)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          v33 = "QM";
          if (v26) {
            v33 = "QU";
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", v33);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
        }
        char v34 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v34)
        {
          __int16 v35 = v34;
          a3 = v106;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          unint64_t v93 = (unint64_t)v35;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s?");
        }
        else
        {
          a3 = v106;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          unint64_t v93 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " TYPE%u?");
        }
        unint64_t v9 = ", ";
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
      }
      else
      {
        if (!v22)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "\nQUESTION SECTION\n");
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0, v122, 0);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (v108 && _NameIsPrivate((const char *)v122))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~-30s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%-30s");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        int v28 = "QM";
        if (v26) {
          int v28 = "QU";
        }
        if ((v106 & 1) == 0) {
          int v28 = "";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %2s", v28);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        int64_t v29 = "ANY";
        if (LOWORD(v124[0]) != 255) {
          int64_t v29 = 0;
        }
        if (LOWORD(v124[0]) == 1) {
          int v30 = "IN";
        }
        else {
          int v30 = v29;
        }
        if (v30)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", v30);
          a3 = v106;
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          a3 = v106;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " CLASS%u", LOWORD(v124[0]));
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
        }
        int v36 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v36)
        {
          v37 = v36;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          unint64_t v93 = (unint64_t)v37;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %-5s\n");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          unint64_t v93 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " TYPE%u\n");
        }
        __int16 v27 = v23;
        unsigned int v23 = (char *)v21;
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
      }
      char v21 = (unsigned __int8 *)v23;
      ++v22;
      unsigned int v23 = v27;
      if (v105 == v22) {
        goto LABEL_201;
      }
    }
  }
  char v21 = 0;
  __int16 v27 = v121;
LABEL_201:
  if (v102 + v103 + v101)
  {
    int v38 = 0;
    while (1)
    {
      __src[0] = 0;
      v124[0] = 0;
      LODWORD(v119) = 0;
      LOWORD(v118) = 0;
      LOWORD(v117) = 0;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _DNSMessageExtractRecordEx(v107, a2, v111, v27, &v118, &v117, &v119, (unsigned __int16 **)__src, v124, 0, 0, 0, 0, &v111);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v27, 0, v122, 0);
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
      BOOL v39 = (__int16)v117 < 0;
      if (a3) {
        LOWORD(v117) = (unsigned __int16)v117 & 0x7FFF;
      }
      char v40 = a3;
      int v41 = a3 & v39;
      if ((v40 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s", v9);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (v21 && DomainNameEqual((unsigned __int8 *)v27, v21))
        {
          char v42 = v27;
          __int16 v27 = (char *)v21;
        }
        else
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v27, 0, v122, 0);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
          if (v108 && _NameIsPrivate((const char *)v122))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s ");
          }
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
          if (v27 == v121) {
            char v42 = (char *)v120;
          }
          else {
            char v42 = v121;
          }
          *char v42 = 0;
        }
        if ((unsigned __int16)v118 == 41)
        {
          if (v41)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "CF ");
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_640;
            }
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          a3 = v106;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "OPT %u", (unsigned __int16)v117);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
          if (v119)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " 0x%08X");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " 0");
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%u", v119);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
          if (v41)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " CF");
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_640;
            }
          }
          unsigned int v43 = "ANY";
          if ((unsigned __int16)v117 != 255) {
            unsigned int v43 = 0;
          }
          if ((unsigned __int16)v117 == 1) {
            v44 = "IN";
          }
          else {
            v44 = v43;
          }
          if (v44)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", v44);
            a3 = v106;
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_640;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            a3 = v106;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " CLASS%u", (unsigned __int16)v117);
            if (CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_640;
            }
          }
          if (DNSRecordTypeValueToString((unsigned __int16)v118))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_648;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " TYPE%u");
          }
        }
        unint64_t v9 = ", ";
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        goto LABEL_372;
      }
      if (v103 && !v38) {
        break;
      }
      if (v102 && v103 == v38)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "\nAUTHORITY SECTION\n");
        goto LABEL_284;
      }
      if (v101 && v102 + v103 == v38)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "\nADDITIONAL SECTION\n");
        goto LABEL_284;
      }
LABEL_285:
      if ((unsigned __int16)v118 == 41)
      {
        if (v108 && _NameIsPrivate((const char *)v122))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        unsigned int v45 = "";
        if (v41) {
          unsigned int v45 = " CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s OPT %u", v45, (unsigned __int16)v117);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        a3 = v106;
        if (v119)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " 0x%08X");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " 0");
        }
      }
      else
      {
        if (v108)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~-42s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%-42s");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        int64_t v46 = "";
        if (v41) {
          int64_t v46 = "CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %6u %2s", v119, v46);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        unsigned __int16 v47 = "ANY";
        if ((unsigned __int16)v117 != 255) {
          unsigned __int16 v47 = 0;
        }
        if ((unsigned __int16)v117 == 1) {
          unsigned int v48 = "IN";
        }
        else {
          unsigned int v48 = v47;
        }
        if (v48)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", v48);
          a3 = v106;
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          a3 = v106;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " CLASS%u", (unsigned __int16)v117);
          if (CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_640;
          }
        }
        if (DNSRecordTypeValueToString((unsigned __int16)v118))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %-5s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " TYPE%u");
        }
      }
      char v42 = v27;
      __int16 v27 = (char *)v21;
      if (CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_640;
      }
LABEL_372:
      if ((a3 & 2) == 0) {
        DNSRecordDataToStringEx((unsigned __int16 *)__src[0], v124[0], (unsigned __int16)v118, v107, a2, v108, (uint64_t)&v110);
      }
      if (v110)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", (const char *)v110);
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
        if (v110)
        {
          free(v110);
          v110 = 0;
        }
      }
      else
      {
        if (v108)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          unint64_t v93 = v124[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " [%zu B]");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          unint64_t v95 = v124[0];
          unint64_t v97 = v124[0];
          unint64_t v93 = (unint64_t)__src[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %#H");
        }
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
      }
      if ((a3 & 4) != 0)
      {
        if ((unsigned __int16)v118 == 5)
        {
          int DomainName = DNSMessageExtractDomainName(v107, a2, (char *)__src[0], v42, 0);
          unsigned __int16 v50 = v121;
          if (v42 == v121) {
            unsigned __int16 v50 = (char *)v120;
          }
          if (!DomainName)
          {
            __int16 v27 = v42;
            char v42 = v50;
          }
          *char v42 = 0;
        }
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_648;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "\n");
        if (CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_640;
        }
      }
      ++v38;
      char v21 = (unsigned __int8 *)v27;
      __int16 v27 = v42;
      if (v103 + v101 + v102 == v38) {
        goto LABEL_404;
      }
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_648;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "\nANSWER SECTION\n");
LABEL_284:
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_640;
    }
    goto LABEL_285;
  }
LABEL_404:
  if (v99 != 6) {
    goto LABEL_632;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
  }
  unint64_t v51 = v107;
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_648;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "[");
  if (CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_640;
  }
  unint64_t v52 = v107 + a2;
  int v53 = v111;
  if ((unint64_t)v111 >= v107 + a2)
  {
LABEL_625:
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_648;
    }
    if ((v106 >> 2)) {
      uint64_t v91 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "]", v93, v95, v97, v98);
    }
    else {
      uint64_t v91 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "\n]", v93, v95, v97, v98);
    }
    uint64_t v90 = v91;
    if (v91) {
      goto LABEL_641;
    }
    goto LABEL_632;
  }
  if ((v106 >> 2)) {
    long long v54 = "";
  }
  else {
    long long v54 = "\n\t";
  }
  if ((v106 >> 2)) {
    long long v55 = ", ";
  }
  else {
    long long v55 = ",\n\t";
  }
  v104 = v55;
  while ((unint64_t)v53 >= v51)
  {
    if (v52 - (unint64_t)v53 < 4
      || (int64_t v56 = __rev16(*((unsigned __int16 *)v53 + 1)), v57 = v53 + 4, (uint64_t)(v52 - (void)(v53 + 4)) < v56))
    {
LABEL_649:
      uint64_t v90 = 4294960546;
      goto LABEL_641;
    }
    unsigned int v58 = *(unsigned __int16 *)v53;
    unint64_t v59 = (unint64_t)&v57[v56];
    v111 = &v57[v56];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_648;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s", v54);
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_640;
    }
    unint64_t v62 = __rev16(v58);
    if (!v61 & v60)
    {
      uint64_t v64 = a2;
      switch((int)v62)
      {
        case '@':
          long long v63 = "SUBSCRIBE";
          goto LABEL_439;
        case 'A':
          long long v63 = "PUSH";
          goto LABEL_439;
        case 'B':
          long long v63 = "UNSUBSCRIBE";
          goto LABEL_439;
        case 'C':
          long long v63 = "RECONFIRM";
          goto LABEL_439;
        default:
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_648;
          }
          unint64_t v93 = v62;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "DSO-TYPE%u: ");
          break;
      }
    }
    else
    {
      long long v63 = "Reserved";
      uint64_t v64 = a2;
      switch((int)v62)
      {
        case 0:
          break;
        case 1:
          long long v63 = "KeepAlive";
          break;
        case 2:
          long long v63 = "Retry Delay";
          break;
        case 3:
          long long v63 = "Encryption Padding";
          break;
        default:
          JUMPOUT(0);
      }
LABEL_439:
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_648;
      }
      unint64_t v93 = (unint64_t)v63;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s: ");
    }
    if (CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_640;
    }
    v118 = 0;
    v119 = (unsigned __int16 *)(v53 + 4);
    bzero(__src, 0x3F1uLL);
    switch((int)v62)
    {
      case '@':
        uint64_t v65 = DNSMessageExtractDomainNameString(v107, v64, v53 + 4, (unsigned __int8 *)__src, &v119);
        if (v65) {
          goto LABEL_571;
        }
        long long v66 = v119;
        if (v59 - (void)v119 == 4)
        {
          if (v108 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)__src;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)__src;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s");
          }
          if (v65) {
            goto LABEL_571;
          }
          unint64_t v74 = __rev16(v66[1]);
          unint64_t v75 = "ANY";
          if (v74 != 255) {
            unint64_t v75 = 0;
          }
          if (v74 == 1) {
            v76 = "IN";
          }
          else {
            v76 = v75;
          }
          if (v76)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)v76;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = v74;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " CLASS%u");
          }
          if (v65) {
            goto LABEL_571;
          }
          unint64_t v81 = __rev16(*v66);
          v82 = DNSRecordTypeValueToString(v81);
          if (v82)
          {
            v83 = v82;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v93 = (unint64_t)v83;
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s");
              goto LABEL_616;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v93 = v81;
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " TYPE%u");
              goto LABEL_616;
            }
          }
          goto LABEL_623;
        }
        uint64_t v90 = 4294960553;
        goto LABEL_618;
      case 'A':
        if (v59 <= (unint64_t)v57) {
          goto LABEL_649;
        }
        int v67 = (v106 >> 3) & 1;
        while (1)
        {
          unint64_t v116 = 0;
          v117 = 0;
          int v114 = 0;
          int v115 = 0;
          memset(v124, 0, sizeof(v124));
          uint64_t v65 = _DNSMessageExtractRecordEx(v107, v64, v57, (char *)v124, (_WORD *)&v114 + 1, &v114, &v115, &v117, &v116, 0, 0, 0, 0, &v119);
          if (v65) {
            goto LABEL_571;
          }
          if ((unint64_t)v119 > v59) {
            goto LABEL_624;
          }
          uint64_t v65 = DomainNameToString((unsigned __int8 *)v124, 0, (unsigned __int8 *)__src, 0);
          if (v65) {
            goto LABEL_571;
          }
          if (v67 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)__src;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)__src;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s");
          }
          if (v65) {
            goto LABEL_571;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_623;
          }
          uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " 0x%08X", v115);
          if (v65) {
            goto LABEL_571;
          }
          long long v68 = "ANY";
          if ((unsigned __int16)v114 != 255) {
            long long v68 = 0;
          }
          if ((unsigned __int16)v114 == 1) {
            long long v69 = "IN";
          }
          else {
            long long v69 = v68;
          }
          if (v69)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)v69;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unsigned __int16)v114;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " CLASS%u");
          }
          if (v65) {
            goto LABEL_571;
          }
          v70 = DNSRecordTypeValueToString(HIWORD(v114));
          if (v70)
          {
            int v71 = v70;
            int v67 = (v106 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)v71;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s");
          }
          else
          {
            int v67 = (v106 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = HIWORD(v114);
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " TYPE%u");
          }
          if (v65) {
            goto LABEL_571;
          }
          DNSRecordDataToStringEx(v117, v116, HIWORD(v114), v107, v64, v67, (uint64_t)&v118);
          if (v118)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", (const char *)v118);
            if (v65) {
              goto LABEL_571;
            }
            if (v118)
            {
              free(v118);
              v118 = 0;
            }
          }
          else
          {
            if (v67)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_623;
              }
              unint64_t v93 = v116;
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " [%zu B]");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_623;
              }
              unint64_t v95 = v116;
              unint64_t v97 = v116;
              unint64_t v93 = (unint64_t)v117;
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %#H");
            }
            if (v65) {
              goto LABEL_571;
            }
          }
          long long v57 = (char *)v119;
          if ((unint64_t)v119 >= v59) {
            goto LABEL_617;
          }
        }
      case 'B':
        if (v56 != 2) {
          goto LABEL_651;
        }
        unsigned int v72 = *((unsigned __int16 *)v53 + 2);
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_623;
        }
        uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%u", __rev16(v72));
        goto LABEL_571;
      case 'C':
        uint64_t v65 = DNSMessageExtractDomainNameString(v107, v64, v53 + 4, (unsigned __int8 *)__src, &v119);
        if (v65) {
          goto LABEL_571;
        }
        v73 = v119;
        if (v59 - (unint64_t)v119 >= 4)
        {
          v119 += 2;
          if (v108 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v93 = (unint64_t)__src;
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%~s");
              goto LABEL_555;
            }
LABEL_623:
            uint64_t v90 = 4294960561;
            goto LABEL_618;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_623;
          }
          unint64_t v93 = (unint64_t)__src;
          uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "%s");
LABEL_555:
          if (v65) {
            goto LABEL_571;
          }
          unsigned int v77 = __rev16(v73[1]);
          v78 = "ANY";
          if (v77 != 255) {
            v78 = 0;
          }
          if (v77 == 1) {
            uint64_t v79 = "IN";
          }
          else {
            uint64_t v79 = v78;
          }
          if (v79)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            unint64_t v80 = v107;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", v79);
            if (v65) {
              goto LABEL_571;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " CLASS%u", v77);
            unint64_t v80 = v107;
            if (v65) {
              goto LABEL_571;
            }
          }
          unint64_t v84 = __rev16(*v73);
          v85 = DNSRecordTypeValueToString(v84);
          if (v85)
          {
            v86 = v85;
            int v87 = (v106 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = (unint64_t)v86;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s");
          }
          else
          {
            int v87 = (v106 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_623;
            }
            unint64_t v93 = v84;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " TYPE%u");
          }
          if (v65) {
            goto LABEL_571;
          }
          v88 = v119;
          unint64_t v89 = v59 - (void)v119;
          DNSRecordDataToStringEx(v119, v59 - (void)v119, v84, v80, v64, v87, (uint64_t)&v118);
          if (v118)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " %s", (const char *)v118);
              if (v65) {
                goto LABEL_571;
              }
              if (v118)
              {
                free(v118);
                v118 = 0;
              }
              goto LABEL_617;
            }
          }
          else if (v87)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v93 = v89;
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " [%zu B]");
              goto LABEL_616;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v95 = v89;
              unint64_t v97 = v89;
              unint64_t v93 = (unint64_t)v88;
              uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, " '%H'");
LABEL_616:
              if (v65) {
                goto LABEL_571;
              }
LABEL_617:
              uint64_t v90 = 0;
              goto LABEL_618;
            }
          }
          goto LABEL_623;
        }
LABEL_624:
        uint64_t v90 = 4294960546;
LABEL_618:
        if (v118) {
          free(v118);
        }
        if (v90) {
          goto LABEL_641;
        }
        int v53 = v111;
        long long v54 = v104;
        unint64_t v52 = v107 + a2;
        unint64_t v51 = v107;
        if ((unint64_t)v111 >= v107 + a2) {
          goto LABEL_625;
        }
        break;
      default:
        if (v108)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            unint64_t v93 = v56;
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "[%u B]");
            goto LABEL_571;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            unint64_t v95 = v56;
            unint64_t v97 = v56;
            unint64_t v93 = (unint64_t)(v53 + 4);
            uint64_t v65 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v112, "'%H'");
LABEL_571:
            uint64_t v90 = v65;
            goto LABEL_618;
          }
        }
        goto LABEL_623;
    }
  }
  uint64_t v90 = 4294960586;
LABEL_641:
  if (v110) {
    free(v110);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_234);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
    _GetCUSymAddr_DataBuffer_Free_sAddr(v112);
  }
  return v90;
}

uint64_t _NameIsPrivate(const char *a1)
{
  uint64_t result = strcasecmp(a1, ".");
  if (result) {
    return strcasecmp(a1, "ipv4only.arpa.") != 0;
  }
  return result;
}

uint64_t DNSRecordDataToStringEx(unsigned __int16 *a1, unint64_t a2, int a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  v90[127] = *(void **)MEMORY[0x263EF8340];
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  }
  uint64_t v85 = 0;
  v86 = 0;
  memset(v84, 0, sizeof(v84));
  uint64_t v83 = 0;
  memset(v89, 0, sizeof(v89));
  bzero(v88, 0x3F1uLL);
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_425;
  }
  uint64_t v78 = a7;
  unint64_t v13 = (unint64_t)a1 + a2;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v84, v89, 256, -1);
  uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960582;
  if (a3 <= 32)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4) {
          goto LABEL_427;
        }
        uint64_t appended = _AppendIPv4Address((uint64_t)v84, 0, (unsigned int *)a1, a6);
        if (appended) {
          goto LABEL_419;
        }
        goto LABEL_411;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, 0);
          if (appended) {
            goto LABEL_419;
          }
        }
        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, 0);
          if (appended) {
            goto LABEL_419;
          }
        }
        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0, a6, (const char *)v88);
        if (appended) {
          goto LABEL_419;
        }
        goto LABEL_411;
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
        goto LABEL_420;
      case 6:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, &v86);
          if (appended) {
            goto LABEL_419;
          }
          if ((unint64_t)v86 >= v13) {
            goto LABEL_427;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0, a6, (const char *)v88);
          if (appended) {
            goto LABEL_419;
          }
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v86, v88, &v86);
          if (appended) {
            goto LABEL_419;
          }
        }
        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, &v86);
          if (appended) {
            goto LABEL_419;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0, a6, (const char *)v88);
          if (appended) {
            goto LABEL_419;
          }
          uint64_t appended = DomainNameToString(v86, (unint64_t)a1 + a2, v88, &v86);
          if (appended) {
            goto LABEL_419;
          }
        }
        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v88);
        if (appended) {
          goto LABEL_419;
        }
        v73 = (unsigned int *)v86;
        if (v13 - (void)v86 != 20) {
          goto LABEL_427;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %u %u %u %u %u", bswap32(*v73), bswap32(v73[1]), bswap32(v73[2]), bswap32(v73[3]), bswap32(v73[4]));
          goto LABEL_410;
        }
        goto LABEL_425;
      case 13:
      case 16:
        if (!a2) {
          goto LABEL_427;
        }
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_425;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "[%zu B]");
        }
        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_425;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%#H");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_425;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%#{txt}");
        }
        if (!appended) {
          goto LABEL_411;
        }
        goto LABEL_419;
      case 15:
        if ((uint64_t)a2 < 3) {
          goto LABEL_427;
        }
        unsigned int v71 = *a1;
        v70 = (char *)(a1 + 1);
        unsigned int v69 = v71;
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, v70, v88, 0);
          if (appended) {
            goto LABEL_419;
          }
        }
        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)v70, v13, v88, 0);
          if (appended) {
            goto LABEL_419;
          }
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_425;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(v69));
        if (appended) {
          goto LABEL_419;
        }
        unint64_t v75 = " ";
        break;
      default:
        if (a3 == 25) {
          goto LABEL_229;
        }
        if (a3 != 28) {
          goto LABEL_420;
        }
        if (a2 != 16) {
          goto LABEL_427;
        }
        uint64_t appended = _AppendIPv6Address((uint64_t)v84, 0, (uint64_t)a1, a6);
        if (appended) {
          goto LABEL_419;
        }
        goto LABEL_411;
    }
    goto LABEL_409;
  }
  switch(a3)
  {
    case ')':
      if (v13 < (unint64_t)a1) {
        goto LABEL_429;
      }
      uint64_t v16 = "";
      while (2)
      {
        if ((unint64_t)a1 >= v13) {
          goto LABEL_411;
        }
        if (v13 - (unint64_t)a1 < 4) {
          goto LABEL_426;
        }
        int v17 = a1 + 2;
        unint64_t v18 = __rev16(a1[1]);
        if (v13 - (unint64_t)(a1 + 2) < v18) {
          goto LABEL_426;
        }
        unsigned int v19 = *a1;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_425;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s{", v16);
        if (appended) {
          goto LABEL_419;
        }
        unsigned int v20 = __rev16(v19);
        if (v20 == 12)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_425;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "Padding");
        }
        else if (v20 == 15)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_425;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "EDE");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_425;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "CODE%u");
        }
        if (appended) {
          goto LABEL_419;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_425;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, ", ");
        if (appended) {
          goto LABEL_419;
        }
        char v21 = (unsigned __int16 *)&v17[v18];
        if (v20 != 15 || !v18)
        {
          if (a6)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_425;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "[%u B]");
          }
          else if (v20 == 12 && v18 && !*v17 && !memcmp(a1 + 2, (char *)a1 + 5, v18 - 1))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_425;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "<%u zero bytes>");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_425;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "'%H'");
          }
          goto LABEL_78;
        }
        if (v18 < 2) {
          goto LABEL_426;
        }
        unsigned int v22 = a1[2];
        int v23 = (unsigned __int16)((_WORD)v21 - ((_WORD)a1 + 6));
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_425;
        }
        unsigned int v24 = __rev16(v22);
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "code: %u", v24);
        if (appended) {
          goto LABEL_419;
        }
        if (v23 | v24)
        {
          if (v24 <= 0x18)
          {
            char v25 = off_264E84270[v24];
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_425;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " (%s)", v25);
            if (appended) {
              goto LABEL_419;
            }
          }
          if (v23)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_425;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, ", extra-text: ");
            if (appended) {
              goto LABEL_419;
            }
            if (a6)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_425;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "«REDACTED»");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_425;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "'%.*s'");
            }
LABEL_78:
            if (appended) {
              goto LABEL_419;
            }
          }
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "}");
          a1 = v21;
          uint64_t v16 = ", ";
          if (appended) {
            goto LABEL_419;
          }
          continue;
        }
        goto LABEL_425;
      }
    case '*':
    case ',':
    case '-':
    case '1':
      goto LABEL_420;
    case '+':
      if (a2 < 4) {
        goto LABEL_427;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u %u %u", __rev16(*a1), *((unsigned __int8 *)a1 + 2), *((unsigned __int8 *)a1 + 3));
      if (appended) {
        goto LABEL_419;
      }
      if (a2 == 4) {
        goto LABEL_411;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %.4H", a1 + 2, a2 - 4, a2 - 4);
      if (appended) {
        goto LABEL_419;
      }
      goto LABEL_411;
    case '.':
      LODWORD(v87) = 0;
      uint64_t v81 = 0;
      uint64_t v82 = 0;
      int v80 = 0;
      if (a2 < 0x13) {
        goto LABEL_427;
      }
      if (DNSRecordTypeValueToString(__rev16(*a1)))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_425;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s");
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_425;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "TYPE%u");
      }
      if (appended) {
        goto LABEL_419;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %u %u %u", *((unsigned __int8 *)a1 + 2), *((unsigned __int8 *)a1 + 3), bswap32(*((_DWORD *)a1 + 1)));
      if (appended) {
        goto LABEL_419;
      }
      LODWORD(v87) = 0;
      uint64_t v81 = 0;
      uint64_t v82 = 0;
      int v80 = 0;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_248);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_425;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 2)) + 0xE77934880, &v87, (char *)&v82 + 4, &v82, (char *)&v81 + 4, &v81, &v80);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %u%02u%02u%02u%02u%02u", v87, HIDWORD(v82), v82, HIDWORD(v81), v81, v80);
      if (appended) {
        goto LABEL_419;
      }
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_248);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_425;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 3)) + 0xE77934880, &v87, (char *)&v82 + 4, &v82, (char *)&v81 + 4, &v81, &v80);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %u%02u%02u%02u%02u%02u", v87, HIDWORD(v82), v82, HIDWORD(v81), v81, v80);
      if (appended) {
        goto LABEL_419;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %u", __rev16(a1[8]));
      if (appended) {
        goto LABEL_419;
      }
      v86 = (unsigned __int8 *)(a1 + 9);
      uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 18, v13, v88, &v86);
      if (appended) {
        goto LABEL_419;
      }
      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v88);
      if (appended) {
        goto LABEL_419;
      }
      v90[0] = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_244);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v86, v13 - (void)v86, 0, v90, 0);
      if (appended) {
        goto LABEL_419;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
LABEL_377:
      }
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %s", (const char *)v90[0]);
      else {
LABEL_428:
      }
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561;
      if (v90[0]) {
        free(v90[0]);
      }
      if (!CUSymAddr_DataBuffer_Append_sAddr) {
        goto LABEL_411;
      }
      goto LABEL_420;
    case '/':
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, &v86);
        if (appended) {
          goto LABEL_419;
        }
      }
      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, &v86);
        if (appended) {
          goto LABEL_419;
        }
      }
      if ((unint64_t)v86 >= v13) {
        goto LABEL_427;
      }
      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0, a6, (const char *)v88);
      if (appended) {
        goto LABEL_419;
      }
      unsigned int v72 = v86;
LABEL_339:
      uint64_t appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v84, v72, v13);
      if (appended) {
        goto LABEL_419;
      }
      goto LABEL_411;
    case '0':
LABEL_229:
      if (a2 < 5) {
        goto LABEL_427;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u %u %u", __rev16(*a1), *((unsigned __int8 *)a1 + 2), *((unsigned __int8 *)a1 + 3));
      if (appended) {
        goto LABEL_419;
      }
      v86 = (unsigned __int8 *)(a1 + 2);
      v90[0] = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_244);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v86, v13 - (void)v86, 0, v90, 0);
      if (appended) {
        goto LABEL_419;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_377;
      }
      goto LABEL_428;
    case '2':
      if (a2 < 5) {
        goto LABEL_427;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u %u %u", *(unsigned __int8 *)a1, *((unsigned __int8 *)a1 + 1), __rev16(a1[1]));
      if (appended) {
        goto LABEL_419;
      }
      v86 = (unsigned __int8 *)(a1 + 2);
      if ((uint64_t)(a2 - 4) < 1) {
        goto LABEL_427;
      }
      v86 = (unsigned __int8 *)a1 + 5;
      unint64_t v52 = *((unsigned __int8 *)a1 + 4);
      if (a2 - 5 < v52) {
        goto LABEL_427;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %.4H", v86, v52, v52);
      if (appended) {
        goto LABEL_419;
      }
      int v53 = &v86[v52];
      v86 = v53;
      if ((uint64_t)(v13 - (void)v53) < 1) {
        goto LABEL_427;
      }
      long long v54 = v53 + 1;
      v86 = v53 + 1;
      unint64_t v55 = *v53;
      if (v13 - (unint64_t)(v53 + 1) < v55) {
        goto LABEL_427;
      }
      if (!*v53) {
        goto LABEL_289;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " ");
      if (appended) {
        goto LABEL_419;
      }
      long long v54 = v86;
LABEL_289:
      int64_t v56 = &v54[v55];
      while (2)
      {
        unint64_t v57 = v56 - v86;
        if (v56 != v86)
        {
          v90[0] = 0;
          uint64_t v58 = 0;
          switch(v57)
          {
            case 1uLL:
              uint64_t v59 = 0;
              unint64_t v60 = (unint64_t)*v86++ << 32;
              goto LABEL_308;
            case 2uLL:
              uint64_t v65 = 0;
              unint64_t v63 = (unint64_t)v86[1] << 24;
              unint64_t v60 = v63 | ((unint64_t)*v86 << 32);
              v86 += 2;
              goto LABEL_305;
            case 3uLL:
              unsigned __int8 v66 = v86[2];
              unint64_t v63 = ((unint64_t)v66 << 16) | ((unint64_t)v86[1] << 24);
              unint64_t v60 = v63 | ((unint64_t)*v86 << 32);
              v86 += 3;
              BYTE4(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[2 * (v66 & 0xF)];
              uint64_t v65 = 5;
              goto LABEL_305;
            case 4uLL:
              goto LABEL_294;
            default:
              uint64_t v58 = v86[4];
LABEL_294:
              unint64_t v61 = v86[3];
              unint64_t v62 = v58 | (v61 << 8);
              unint64_t v63 = ((unint64_t)v86[1] << 24) | ((unint64_t)v86[2] << 16) | v62;
              unint64_t v60 = v63 | ((unint64_t)*v86 << 32);
              if (v57 >= 5) {
                uint64_t v64 = 5;
              }
              else {
                uint64_t v64 = v56 - v86;
              }
              v86 += v64;
              if (v57 == 1)
              {
                uint64_t v59 = 0;
              }
              else
              {
                if (v57 == 4)
                {
                  uint64_t v65 = 7;
                }
                else
                {
                  HIBYTE(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v58 & 0x1F];
                  uint64_t v65 = 8;
                }
                char v67 = DNSRecordDataToStringEx_kBase32ExtendedHex[(v61 >> 2) & 0x1F];
                BYTE6(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v62 >> 5) & 0x1F];
                BYTE5(v90[0]) = v67;
                BYTE4(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 15) & 0x1F];
LABEL_305:
                BYTE3(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 20) & 0x1F];
                BYTE2(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 25) & 0x1F];
                if (v65) {
                  uint64_t v59 = v65;
                }
                else {
                  uint64_t v59 = 4;
                }
              }
LABEL_308:
              BYTE1(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v60 >> 30) & 0x1F];
              LOBYTE(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v60 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_226);
              }
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_425;
              }
              if (v59) {
                uint64_t v68 = v59;
              }
              else {
                uint64_t v68 = 2;
              }
              uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v84, v90, v68);
              if (CUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_420;
              }
              continue;
          }
        }
        break;
      }
      unsigned int v72 = v56;
      goto LABEL_339;
    default:
      if ((a3 - 64) < 2)
      {
        if (v13 < (unint64_t)a1)
        {
LABEL_429:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960586;
          goto LABEL_420;
        }
        if (a2 >= 2)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(*a1));
            if (appended) {
              goto LABEL_419;
            }
            bzero(v90, 0x3F1uLL);
            int v87 = (unsigned int *)(a1 + 1);
            uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 2, (unint64_t)a1 + a2, (unsigned __int8 *)v90, &v87);
            if (appended) {
              goto LABEL_419;
            }
            uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v90);
            if (appended) {
              goto LABEL_419;
            }
            int v26 = v87;
            if ((unint64_t)v87 >= v13) {
              goto LABEL_411;
            }
            while (2)
            {
              if (v13 - (unint64_t)v26 < 4)
              {
LABEL_426:
                uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960546;
                goto LABEL_420;
              }
              __int16 v27 = (const char *)__rev16(*(unsigned __int16 *)v26);
              unsigned int v28 = *((unsigned __int16 *)v26 + 1);
              int64_t v29 = _DNSSVCBKeyToString((int)v27);
              if (v29)
              {
                int v30 = v29;
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  unsigned int v77 = v30;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %s=\"");
                  goto LABEL_108;
                }
              }
              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  unsigned int v77 = v27;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " key%u=\"");
LABEL_108:
                  if (appended) {
                    goto LABEL_419;
                  }
                  BOOL v31 = (const char *)__rev16(v28);
                  uint64_t v32 = v26 + 1;
                  int v87 = v26 + 1;
                  if (v13 - (unint64_t)(v26 + 1) >= v31)
                  {
                    switch((int)v27)
                    {
                      case 0:
                        if (v31) {
                          goto LABEL_427;
                        }
                        v33 = (unsigned int *)&v31[(void)v32];
                        if ((const char *)v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        char v34 = 0;
                        char v35 = 1;
                        do
                        {
                          int v36 = (const char *)__rev16(*(unsigned __int16 *)v32);
                          int v87 = (unsigned int *)((char *)v32 + 2);
                          v37 = _DNSSVCBKeyToString((int)v36);
                          if ((v35 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_425;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s", v34);
                            if (appended) {
                              goto LABEL_419;
                            }
                          }
                          if (v37)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_425;
                            }
                            unsigned int v77 = v37;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s");
                          }
                          else
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_425;
                            }
                            unsigned int v77 = v36;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "key%u");
                          }
                          if (appended) {
                            goto LABEL_419;
                          }
                          char v35 = 0;
                          uint64_t v32 = v87;
                          char v34 = ",";
                        }
                        while (v87 < v33);
                        goto LABEL_212;
                      case 1:
                        int v38 = (unsigned int *)&v31[(void)v32];
                        if ((const char *)v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        BOOL v39 = 0;
                        char v40 = 1;
                        while (1)
                        {
                          int v87 = (unsigned int *)((char *)v32 + 1);
                          unint64_t v41 = *(unsigned __int8 *)v32;
                          if ((char *)v38 - ((char *)v32 + 1) < v41) {
                            goto LABEL_427;
                          }
                          uint64_t v32 = (unsigned int *)((char *)v32 + 1);
                          if ((v40 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_425;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s", v39);
                            if (appended) {
                              goto LABEL_419;
                            }
                            uint64_t v32 = v87;
                          }
                          char v42 = (unsigned int *)((char *)v32 + v41);
                          while (v32 < v42)
                          {
                            unsigned int v43 = (const char *)*(unsigned __int8 *)v32;
                            if ((v43 - 32) > 0x5E)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_425;
                              }
                              unsigned int v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%03d");
                            }
                            else if (v43 == 92 || v43 == 44)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_425;
                              }
                              unsigned int v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%c");
                            }
                            else
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_425;
                              }
                              unsigned int v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%c");
                            }
                            if (appended) {
                              goto LABEL_419;
                            }
                            uint64_t v32 = (unsigned int *)((char *)v87 + 1);
                            int v87 = (unsigned int *)((char *)v87 + 1);
                          }
                          char v40 = 0;
                          BOOL v39 = ",";
                          if (v32 >= v38) {
                            goto LABEL_212;
                          }
                        }
                      case 2:
                        goto LABEL_136;
                      case 3:
                        if (v31 != 2) {
                          goto LABEL_427;
                        }
                        unsigned int v44 = *((unsigned __int16 *)v26 + 2);
                        int v87 = (unsigned int *)&v31[(void)v32];
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_425;
                        }
                        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(v44));
                        if (appended) {
                          goto LABEL_419;
                        }
                        goto LABEL_212;
                      case 4:
                        if ((v31 & 3) != 0) {
                          goto LABEL_427;
                        }
                        unsigned int v45 = (unsigned int *)&v31[(void)v32];
                        if ((const char *)v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        int64_t v46 = "";
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv4Address((uint64_t)v84, (uint64_t)v46, v32, a6);
                          if (CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_420;
                          }
                          uint64_t v32 = v87 + 1;
                          int v87 = v32;
                          if (v32 < v45)
                          {
                            int64_t v46 = ",";
                            continue;
                          }
                          goto LABEL_212;
                        }
                      case 5:
                        goto LABEL_132;
                      case 6:
                        if ((v31 & 0xF) != 0) {
                          goto LABEL_427;
                        }
                        unsigned __int16 v47 = (unsigned int *)&v31[(void)v32];
                        if ((const char *)v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        unsigned int v48 = "";
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv6Address((uint64_t)v84, (uint64_t)v48, (uint64_t)v32, a6);
                          if (CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_420;
                          }
                          uint64_t v32 = v87 + 4;
                          int v87 = v32;
                          if (v32 < v47)
                          {
                            unsigned int v48 = ",";
                            continue;
                          }
                          goto LABEL_212;
                        }
                      default:
                        if (v27 == 32769)
                        {
LABEL_132:
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_425;
                          }
                          unsigned int v77 = (const char *)v87;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%.4H");
                        }
                        else
                        {
LABEL_136:
                          if (!a6)
                          {
                            size_t v49 = (unsigned int *)&v31[(void)v32];
                            while (v32 < v49)
                            {
                              unsigned __int16 v50 = (const char *)*(unsigned __int8 *)v32;
                              if ((v50 - 33) > 0x5D)
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_425;
                                }
                                unsigned int v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%03d");
                              }
                              else if ((v50 - 34) > 0x3A {
                                     || ((1 << (v50 - 34)) & 0x4000000020000C1) == 0)
                              }
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_425;
                                }
                                unsigned int v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%c");
                              }
                              else
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_425;
                                }
                                unsigned int v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%c");
                              }
                              if (appended) {
                                goto LABEL_419;
                              }
                              uint64_t v32 = (unsigned int *)((char *)v87 + 1);
                              int v87 = (unsigned int *)((char *)v87 + 1);
                            }
                            goto LABEL_212;
                          }
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_425;
                          }
                          unsigned int v77 = v31;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "<%u redacted bytes>");
                        }
                        if (appended) {
                          goto LABEL_419;
                        }
                        int v87 = (unsigned int *)&v31[(void)v87];
LABEL_212:
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_425;
                        }
                        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\"", v77);
                        if (CUSymAddr_DataBuffer_Append_sAddr) {
                          goto LABEL_420;
                        }
                        int v26 = v87;
                        if ((unint64_t)v87 >= v13) {
                          goto LABEL_411;
                        }
                        continue;
                    }
                  }
                  goto LABEL_426;
                }
              }
              break;
            }
          }
LABEL_425:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561;
          goto LABEL_420;
        }
LABEL_427:
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960554;
        goto LABEL_420;
      }
      if (a3 != 33) {
        goto LABEL_420;
      }
      if (a2 < 7) {
        goto LABEL_427;
      }
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, v88, 0);
        if (appended) {
          goto LABEL_419;
        }
      }
      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 6, (unint64_t)a1 + a2, v88, 0);
        if (appended) {
          goto LABEL_419;
        }
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_425;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u %u %u ", __rev16(*a1), __rev16(a1[1]), __rev16(a1[2]));
      if (appended) {
        goto LABEL_419;
      }
      unint64_t v75 = 0;
LABEL_409:
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)v75, a6, (const char *)v88);
LABEL_410:
      uint64_t CUSymAddr_DataBuffer_Append_sAddr = CUSymAddr_DataBuffer_AppendF_sAddr;
      if (!CUSymAddr_DataBuffer_AppendF_sAddr)
      {
LABEL_411:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_226);
        }
        if (_GetCUSymAddr_DataBuffer_Append_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v84, "", 1);
          if (appended)
          {
LABEL_419:
            uint64_t CUSymAddr_DataBuffer_Append_sAddr = appended;
            goto LABEL_420;
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_230);
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v84, v78, &v83);
            goto LABEL_419;
          }
        }
        goto LABEL_425;
      }
LABEL_420:
      if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_234);
      }
      if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
        _GetCUSymAddr_DataBuffer_Free_sAddr(v84);
      }
      return CUSymAddr_DataBuffer_Append_sAddr;
  }
}

uint64_t _AppendIPv4Address(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  if (a4)
  {
    unsigned int v4 = bswap32(*a3);
    if (v4) {
      BOOL v5 = v4 == 2130706433;
    }
    else {
      BOOL v5 = 1;
    }
    int v6 = !v5;
  }
  else
  {
    int v6 = 0;
  }
  return _AppendIPAddress(a1, a2, (uint64_t)a3, 4, v6);
}

uint64_t _AppendIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    if (*(void *)a3 | *(void *)(a3 + 7)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = *(unsigned __int8 *)(a3 + 15) > 1u;
    }
    int v5 = v4;
  }
  else
  {
    int v5 = 0;
  }
  return _AppendIPAddress(a1, a2, a3, 16, v5);
}

uint64_t _AppendDomainNameStringEx(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  if (a3 && _NameIsPrivate(a4))
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%~s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  return 4294960561;
}

uint64_t _DNSRecordDataAppendTypeBitMap(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = a3 - (void)a2;
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      if ((unint64_t)v3 < 3) {
        return 4294960554;
      }
      uint64_t v5 = a2[1];
      if ((v5 - 33) < 0xFFFFFFE0) {
        return 4294960554;
      }
      int v6 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < v5) {
        return 4294960554;
      }
      uint64_t v14 = a3 - (void)(a2 + 2);
      uint64_t v15 = a2[1];
      unsigned int v7 = 0;
      unsigned int v8 = 8 * v5;
      int v9 = *a2 << 8;
      if ((8 * v5) <= 1) {
        int v10 = 1;
      }
      else {
        int v10 = 8 * v5;
      }
      BOOL v11 = 1;
      while (1)
      {
        if ((v6[(unint64_t)v7 >> 3] >> (~(_BYTE)v7 & 7)))
        {
          *(_OWORD *)__str = 0u;
          long long v18 = 0u;
          size_t v12 = DNSRecordTypeValueToString(v9 + v7);
          if (!v12)
          {
            size_t v12 = __str;
            snprintf(__str, 0x20uLL, "TYPE%u", v9 + v7);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            return 4294960561;
          }
          uint64_t result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " %s", v12);
          if (result) {
            break;
          }
        }
        BOOL v11 = ++v7 < v8;
        if (v10 == v7)
        {
          v6 += v15;
          uint64_t v3 = a3 - (void)v6;
          goto LABEL_19;
        }
      }
      uint64_t v3 = v14;
      if (v11) {
        return result;
      }
LABEL_19:
      a2 = v6;
      if (v3 > 0) {
        continue;
      }
      break;
    }
  }
  return 0;
}

const char *_DNSSVCBKeyToString(int a1)
{
  uint64_t result = "mandatory";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "alpn";
      break;
    case 2:
      uint64_t result = "no-default-alpn";
      break;
    case 3:
      uint64_t result = "port";
      break;
    case 4:
      uint64_t result = "ipv4hint";
      break;
    case 5:
      uint64_t result = "echconfig";
      break;
    case 6:
      uint64_t result = "ipv6hint";
      break;
    case 7:
      uint64_t result = "dohpath";
      break;
    default:
      BOOL v4 = "odohconfig";
      if (a1 != 32769) {
        BOOL v4 = 0;
      }
      if (a1 == 0x8000) {
        uint64_t result = "dohuri";
      }
      else {
        uint64_t result = v4;
      }
      break;
  }
  return result;
}

char *DNSExtendedDNSErrorCodeToString(unsigned int a1)
{
  if (a1 > 0x18) {
    return 0;
  }
  else {
    return off_264E84270[a1];
  }
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a4 != 16 && a4 != 4) {
    return 4294960553;
  }
  if (!a5)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%.*a");
    }
    return 4294960561;
  }
  char v10 = 0;
  memset(v9, 0, sizeof(v9));
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (!_GetCUSymAddr_SNPrintF_sAddr) {
    return 4294960561;
  }
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_215);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%~s");
    }
    return 4294960561;
  }
  return result;
}

uint64_t DNSComputeDNSKeyTag(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = 0;
    int v3 = 0;
    do
    {
      int v4 = *(unsigned __int8 *)(a1 + v2);
      if ((v2 & 1) == 0) {
        v4 <<= 8;
      }
      v3 += v4;
      ++v2;
    }
    while (a2 != v2);
  }
  else
  {
    int v3 = 0;
  }
  return (unsigned __int16)(v3 + HIWORD(v3));
}

uint64_t DNSMessagePrintObfuscatedString(uint64_t a1, uint64_t a2, const char *a3)
{
  if (_NameIsPrivate(a3))
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", a3);
    }
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%s");
    }
  }
  return 4294960561;
}

uint64_t DNSMessagePrintObfuscatedIPv4Address(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = bswap32(a3);
  unsigned int v7 = a3;
  if (a3 && a3 != 2130706433) {
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, (uint64_t)&v6, 4);
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (_GetCUSymAddr_SNPrintF_sAddr) {
    return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%#.4a", COERCE_DOUBLE(&v7));
  }
  else {
    return 4294960561;
  }
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a4 != 16 && a4 != 4) {
    return 4294960553;
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
  }
  if (!_GetCUSymAddr_SNPrintF_sAddr) {
    return 4294960561;
  }
  char v10 = 0;
  memset(v9, 0, sizeof(v9));
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", v9);
    }
    return 4294960561;
  }
  return result;
}

uint64_t DNSMessagePrintObfuscatedIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a3 | *(void *)(a3 + 7)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(unsigned __int8 *)(a3 + 15) >= 2u;
  }
  if (v6)
  {
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, a3, 16);
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_252);
    }
    if (_GetCUSymAddr_SNPrintF_sAddr) {
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%.16a", *(double *)&a3);
    }
    else {
      return 4294960561;
    }
  }
}

void *OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    if (!strcmp(a1, (&OSLogCopyFormattedString_formatters)[v4]))
    {
      uint64_t v6 = ((uint64_t (*)(id))(&OSLogCopyFormattedString_formatters)[v4 + 1])(v3);

      uint64_t v5 = (void *)v6;
    }
    v4 += 2;
  }
  while (v4 != 22);

  return v5;
}

uint64_t MDNSOLCopyFormattedStringRegisterRecordResult(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v3 = [v2 unsignedLongLongValue];
    if (v3 == -65792)
    {
      uint64_t v4 = @"NAME CONFLICT";
    }
    else if (v3)
    {
      if (v3 == -65548) {
        uint64_t v4 = @"DEREGISTERED";
      }
      else {
        uint64_t v4 = (__CFString *)[objc_alloc((Class)&off_26F0C92F8) initWithFormat:@"<Unknown register record result: %d>", v3];
      }
    }
    else
    {
      uint64_t v4 = @"REGISTERED";
    }
  }
  else
  {
    uint64_t v4 = &stru_26F0C75E0;
  }
  uint64_t v5 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v4];

  return v5;
}

uint64_t MDNSOLCopyFormattedStringNetworkChangeEventFlag(void *a1)
{
  id v1 = a1;
  id v2 = (void *)[objc_alloc((Class)&off_26F0C93E8) initWithCapacity:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v1;
    uint64_t v4 = [v3 unsignedLongLongValue];
    [v2 appendFormat:@"0x%llX {", v4];
    uint64_t v5 = 0;
    uint64_t v6 = "";
    do
    {
      if ((v4 & (uint64_t)(&off_264E84338)[v5 + 1]) != 0)
      {
        [v2 appendFormat:@"%s%s", v6, (&off_264E84338)[v5]];
        uint64_t v6 = ", ";
      }
      v5 += 2;
    }
    while (v5 != 12);
    [v2 appendString:@"}"];
  }
  uint64_t v7 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v2];

  return v7;
}

uint64_t MDNSOLCopyFormattedStringMDNSNameHashTypeBytes(void *a1)
{
  id v1 = a1;
  id v2 = (void *)[objc_alloc((Class)&off_26F0C93E8) initWithCapacity:0];
  if (!v2)
  {
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v1;
    if ([v3 bytes])
    {
      id v19 = v1;
      id v3 = v3;
      uint64_t v4 = [v3 bytes];
      unint64_t v5 = [v3 length];
      if (v5 >= 6)
      {
        unint64_t v6 = v5 / 6;
        uint64_t v7 = v4 + 2;
        unsigned int v8 = "";
        do
        {
          uint64_t v9 = bswap32(*(_DWORD *)(v7 - 2));
          uint64_t v10 = __rev16(*(unsigned __int16 *)(v7 + 2));
          uint64_t v11 = DNSRecordTypeValueToString(v10);
          if (v11) {
            [v2 appendFormat:@"%s(%x %s)", v8, v9, v11];
          }
          else {
            [v2 appendFormat:@"%s(%x TYPE%u)", v8, v9, v10];
          }
          v7 += 6;
          unsigned int v8 = " ";
          --v6;
        }
        while (v6);
      }
      uint64_t v12 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v2];
      id v1 = v19;
      goto LABEL_11;
    }
    id v14 = objc_alloc((Class)&off_26F0C8D50);
    uint64_t v16 = [objc_alloc((Class)&off_26F0C92F8) initWithFormat:@"<failed to decode - NIL data >", v18];
  }
  else
  {
    id v14 = objc_alloc((Class)&off_26F0C8D50);
    id v15 = objc_alloc((Class)&off_26F0C92F8);
    id v3 = [v1 description];
    uint64_t v16 = [v15 initWithFormat:@"<failed to decode - invalid data type: %@>", v3];
  }
  int v17 = (void *)v16;
  uint64_t v12 = [v14 initWithString:v16];

LABEL_11:
LABEL_12:

  return v12;
}

uint64_t MDNSOLCopyFormattedStringmDNSMACAddr(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = objc_alloc((Class)&off_26F0C8D50);
    id v9 = objc_alloc((Class)&off_26F0C92F8);
    uint64_t v10 = [v1 description];
    uint64_t v11 = (void *)[v9 initWithFormat:@"<fail decode - data type> %@", v10];
    uint64_t v6 = [v8 initWithString:v11];

    id v2 = 0;
    goto LABEL_9;
  }
  id v2 = v1;
  if (![v2 bytes] || !objc_msgSend(v2, "length"))
  {
    uint64_t v6 = [objc_alloc((Class)&off_26F0C8D50) initWithString:@"<NULL MAC ADDRESS>"];
LABEL_9:
    id v3 = 0;
    goto LABEL_10;
  }
  if ([v2 length] != 6)
  {
    id v12 = objc_alloc((Class)&off_26F0C8D50);
    unint64_t v13 = [objc_alloc((Class)&off_26F0C92F8) initWithFormat:@"<fail decode - size> %zu != %d", objc_msgSend(v2, "length"), 6];
    uint64_t v6 = [v12 initWithString:v13];

    goto LABEL_9;
  }
  id v2 = v2;
  uint64_t v15 = [v2 bytes];
  id v3 = NSPrintF();
  id v4 = objc_alloc((Class)&off_26F0C8D50);
  if (!v3)
  {
    id v14 = @"<Could not create NSString>";
LABEL_15:
    uint64_t v5 = [v4 initWithString:v14, v15];
    goto LABEL_7;
  }
  uint64_t v5 = [v4 initWithString:v3, v15];
  if (!v5)
  {
    id v4 = objc_alloc((Class)&off_26F0C8D50);
    id v14 = @"<Could not create NSAttributedString>";
    goto LABEL_15;
  }
LABEL_7:
  uint64_t v6 = v5;
LABEL_10:

  return v6;
}

uint64_t MDNSOLCopyFormattedStringDataLinkEvent(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v2 = 0;
    goto LABEL_6;
  }
  id v2 = v1;
  uint64_t v3 = [v2 unsignedLongLongValue];
  if ((unint64_t)(v3 - 1) > 0x1D)
  {
LABEL_6:
    id v4 = &stru_26F0C75E0;
    goto LABEL_7;
  }
  id v4 = @"KEV_DL_SIFFLAGS";
  switch((int)v3)
  {
    case 1:
      break;
    case 2:
      id v4 = @"KEV_DL_SIFMETRICS";
      break;
    case 3:
      id v4 = @"KEV_DL_SIFMTU";
      break;
    case 4:
      id v4 = @"KEV_DL_SIFPHYS";
      break;
    case 5:
      id v4 = @"KEV_DL_SIFMEDIA";
      break;
    case 6:
      id v4 = @"KEV_DL_SIFGENERIC";
      break;
    case 7:
      id v4 = @"KEV_DL_ADDMULTI";
      break;
    case 8:
      id v4 = @"KEV_DL_DELMULTI";
      break;
    case 9:
      id v4 = @"KEV_DL_IF_ATTACHED";
      break;
    case 10:
      id v4 = @"KEV_DL_IF_DETACHING";
      break;
    case 11:
      id v4 = @"KEV_DL_IF_DETACHED";
      break;
    case 12:
      id v4 = @"KEV_DL_LINK_OFF";
      break;
    case 13:
      id v4 = @"KEV_DL_LINK_ON";
      break;
    case 14:
      id v4 = @"KEV_DL_PROTO_ATTACHED";
      break;
    case 15:
      id v4 = @"KEV_DL_PROTO_DETACHED";
      break;
    case 16:
      id v4 = @"KEV_DL_LINK_ADDRESS_CHANGED";
      break;
    case 17:
      id v4 = @"KEV_DL_WAKEFLAGS_CHANGED";
      break;
    case 18:
      id v4 = @"KEV_DL_IF_IDLE_ROUTE_REFCNT";
      break;
    case 19:
      id v4 = @"KEV_DL_IFCAP_CHANGED";
      break;
    case 20:
      id v4 = @"KEV_DL_LINK_QUALITY_METRIC_CHANGED";
      break;
    case 21:
      id v4 = @"KEV_DL_NODE_PRESENCE";
      break;
    case 22:
      id v4 = @"KEV_DL_NODE_ABSENCE";
      break;
    case 23:
      id v4 = @"KEV_DL_PRIMARY_ELECTED";
      break;
    case 24:
      id v4 = @"KEV_DL_ISSUES";
      break;
    case 25:
      id v4 = @"KEV_DL_IFDELEGATE_CHANGED";
      break;
    case 27:
      id v4 = @"KEV_DL_AWDL_UNRESTRICTED";
      break;
    case 28:
      id v4 = @"KEV_DL_RRC_STATE_CHANGED";
      break;
    case 29:
      id v4 = @"KEV_DL_QOS_MODE_CHANGED";
      break;
    case 30:
      id v4 = @"KEV_DL_LOW_POWER_MODE_CHANGED";
      break;
    default:
      id v4 = @"<Unknown Data-Link event>";
      break;
  }
LABEL_7:
  uint64_t v5 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v4];

  return v5;
}

uint64_t MDNSOLCopyFormattedStringmDNSIPAddr(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = objc_alloc((Class)&off_26F0C8D50);
    id v13 = objc_alloc((Class)&off_26F0C92F8);
    id v14 = [v1 description];
    uint64_t v15 = (void *)[v13 initWithFormat:@"<fail decode - data type> %@", v14];
    uint64_t v8 = [v12 initWithString:v15];

    id v2 = 0;
    goto LABEL_11;
  }
  id v2 = v1;
  if (![v2 bytes] || !objc_msgSend(v2, "length"))
  {
    id v9 = objc_alloc((Class)&off_26F0C8D50);
    uint64_t v10 = @"<NULL IP ADDRESS>";
LABEL_10:
    uint64_t v8 = [v9 initWithString:v10];
LABEL_11:
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  long long v18 = 0uLL;
  int v19 = 0;
  if ([v2 length] != 20)
  {
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  id v2 = v2;
  uint64_t v3 = [v2 bytes];
  int v4 = *(_DWORD *)(v3 + 16);
  long long v18 = *(_OWORD *)v3;
  int v19 = v4;
  if (!v18)
  {
    id v9 = objc_alloc((Class)&off_26F0C8D50);
    uint64_t v10 = @"<UNSPECIFIED IP ADDRESS>";
    goto LABEL_10;
  }
  int v17 = &v18;
  uint64_t v5 = NSPrintF();
  id v6 = objc_alloc((Class)&off_26F0C8D50);
  if (!v5)
  {
    uint64_t v16 = @"<Could not create NSString>";
LABEL_18:
    uint64_t v7 = [v6 initWithString:v16, v17];
    goto LABEL_8;
  }
  uint64_t v7 = [v6 initWithString:v5];
  if (!v7)
  {
    id v6 = objc_alloc((Class)&off_26F0C8D50);
    uint64_t v16 = @"<Could not create NSAttributedString>";
    goto LABEL_18;
  }
LABEL_8:
  uint64_t v8 = v7;
LABEL_12:

  return v8;
}

uint64_t MDNSOLCopyFormattedStringHexSequence(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = objc_alloc((Class)&off_26F0C8D50);
    id v6 = objc_alloc((Class)&off_26F0C92F8);
    id v2 = [v1 description];
    uint64_t v7 = [v6 initWithFormat:@"<failed to decode - invalid data type: %@>", v2];
LABEL_7:
    uint64_t v8 = (void *)v7;
    uint64_t v3 = [v5 initWithString:v7];

    goto LABEL_4;
  }
  id v2 = v1;
  if (![v2 bytes])
  {
    id v5 = objc_alloc((Class)&off_26F0C8D50);
    uint64_t v7 = [objc_alloc((Class)&off_26F0C92F8) initWithFormat:@"<failed to decode - NIL data >", v9];
    goto LABEL_7;
  }
  uint64_t v3 = NSPrintTypedObject();
LABEL_4:

  return v3;
}

uint64_t MDNSOLCopyFormattedStringmDNSLabel(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_alloc((Class)&off_26F0C8D50);
    id v10 = objc_alloc((Class)&off_26F0C92F8);
    uint64_t v11 = [v1 description];
    id v12 = (void *)[v10 initWithFormat:@"<failed to decode - invalid data type: %@>", v11];
    uint64_t v7 = [v9 initWithString:v12];

    id v2 = 0;
    goto LABEL_14;
  }
  id v2 = v1;
  if (![v2 bytes] || !objc_msgSend(v2, "length"))
  {
    uint64_t v7 = [objc_alloc((Class)&off_26F0C8D50) initWithString:@"<NULL DOMAIN LABEL>"];
LABEL_14:
    id v5 = 0;
    goto LABEL_15;
  }
  id v2 = v2;
  unint64_t v3 = *(unsigned __int8 *)[v2 bytes];
  if (v3 > 0x3F || [v2 length] != v3 + 1)
  {
    id v13 = objc_alloc((Class)&off_26F0C8D50);
    id v14 = (void *)[objc_alloc((Class)&off_26F0C92F8) initWithFormat:@"failed to decode - invalid domain label length - data length: %lu, label length: %lu", [v2 length], v3];
    uint64_t v7 = [v13 initWithString:v14];

    goto LABEL_14;
  }
  memset(v16, 0, 65);
  id v2 = v2;
  [v2 bytes];
  [v2 length];
  __memcpy_chk();
  v16[[v2 length]] = 0;
  bzero(__s, 0x3F1uLL);
  if (DomainNameToString(v16, 0, (unsigned __int8 *)__s, 0))
  {
    id v5 = 0;
LABEL_19:
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  size_t v4 = strlen(__s);
  if (v4) {
    __s[v4 - 1] = 0;
  }
  id v5 = +[NSString stringWithUTF8String:__s];
  if (!v5) {
    goto LABEL_19;
  }
  uint64_t v6 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v5];
  if (!v6) {
    uint64_t v6 = [objc_alloc((Class)&off_26F0C8D50) initWithString:@"<Could not create NSAttributedString>"];
  }
  uint64_t v7 = v6;
LABEL_15:

  return v7;
}

uint64_t MDNSOLCopyFormattedStringmDNSLabelSequenceName(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_alloc((Class)&off_26F0C8D50);
    id v10 = objc_alloc((Class)&off_26F0C92F8);
    uint64_t v11 = [v1 description];
    id v12 = (void *)[v10 initWithFormat:@"<fail decode - data type> %@", v11];
    uint64_t v7 = [v9 initWithString:v12];

    id v5 = 0;
    id v2 = 0;
    goto LABEL_10;
  }
  id v2 = v1;
  if (![v2 bytes] || !objc_msgSend(v2, "length"))
  {
    uint64_t v7 = [objc_alloc((Class)&off_26F0C8D50) initWithString:@"<NULL DOMAIN NAME>"];
    id v5 = 0;
    goto LABEL_10;
  }
  id v2 = v2;
  unint64_t v3 = (unsigned __int8 *)[v2 bytes];
  unint64_t v4 = (unint64_t)&v3[[v2 length]];
  bzero(v13, 0x3F1uLL);
  if (DomainNameToString(v3, v4, v13, 0))
  {
    id v5 = 0;
    goto LABEL_13;
  }
  id v5 = +[NSString stringWithUTF8String:v13];
  if (!v5)
  {
LABEL_13:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v5];
  if (!v6) {
    uint64_t v6 = [objc_alloc((Class)&off_26F0C8D50) initWithString:@"<Could not create NSAttributedString>"];
  }
  uint64_t v7 = v6;
LABEL_10:

  return v7;
}

uint64_t MDNSOLCopyFormattedStringDNSScopeType(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v3 = [v2 longLongValue];
    unint64_t v4 = @"Service scoped";
    id v5 = @"Interface scoped";
    if (v3 != 1) {
      id v5 = 0;
    }
    if (v3 != 2) {
      unint64_t v4 = v5;
    }
    if (v3) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = @"Unscoped";
    }
  }
  else
  {
    uint64_t v6 = 0;
    id v2 = 0;
  }
  uint64_t v7 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v6];

  return v7;
}

uint64_t MDNSOLCopyFormattedStringD2DServiceEvent(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v3 = @"D2DServiceFound";
    switch([v2 longLongValue])
    {
      case 0:
        break;
      case 1:
        uint64_t v3 = @"D2DServiceLost";
        break;
      case 2:
        uint64_t v3 = @"D2DServiceResolved";
        break;
      case 3:
        uint64_t v3 = @"D2DServiceRetained";
        break;
      case 4:
        uint64_t v3 = @"D2DServiceReleased";
        break;
      case 5:
        uint64_t v3 = @"D2DServicePeerLost";
        break;
      default:
        uint64_t v3 = 0;
        break;
    }
  }
  else
  {
    uint64_t v3 = 0;
    id v2 = 0;
  }
  uint64_t v4 = [objc_alloc((Class)&off_26F0C8D50) initWithString:v3];

  return v4;
}

unsigned char *mdns_memcpy_bits(unsigned char *__dst, void *__src, unint64_t a3)
{
  char v3 = a3;
  id v5 = __dst;
  unint64_t v6 = a3 >> 3;
  if (a3 >= 8) {
    __dst = memcpy(__dst, __src, a3 >> 3);
  }
  if ((v3 & 7) != 0) {
    v5[v6] = v5[v6] & ~(-1 << (8 - (v3 & 7))) | *((unsigned char *)__src + v6) & (-1 << (8 - (v3 & 7)));
  }
  return __dst;
}

uint64_t mdns_memcmp_us_ascii_case_insensitive@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char a4@<W8>)
{
  if (a3)
  {
    while (1)
    {
      unsigned int v5 = *a1++;
      unsigned int v4 = v5;
      unsigned int v6 = v5 + 32;
      if (v5 - 65 < 0x1A) {
        unsigned int v4 = v6;
      }
      unsigned int v8 = *a2++;
      unsigned int v7 = v8;
      unsigned int v9 = v8 + 32;
      if (v8 - 65 < 0x1A) {
        unsigned int v7 = v9;
      }
      if (v4 > v7) {
        a4 = 1;
      }
      if (v4 < v7) {
        a4 = -1;
      }
      if (v4 != v7) {
        break;
      }
      if (!--a3) {
        return 0;
      }
    }
  }
  else
  {
    return 0;
  }
  return a4;
}

uint64_t NSPrintF()
{
  return MEMORY[0x270F244C8]();
}

uint64_t NSPrintTypedObject()
{
  return MEMORY[0x270F244D8]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}