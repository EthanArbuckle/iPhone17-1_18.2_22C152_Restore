uint64_t l2tp_outgoing_call(int a1, const sockaddr *a2, unsigned __int16 *a3, uint64_t a4, int a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  long long v21;
  long long v22;
  __int16 *v23;
  sockaddr v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;

  DWORD1(v22) = sub_5F00(1u, a3);
  result = sub_49A4(a1, SDWORD1(v22), 0, a2, "SCCRQ");
  if (!result)
  {
    v31 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = (sockaddr)0;
    v24.sa_len = 0x80;
    result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v22 + 1, &v24, a5);
    if (result != -2)
    {
      if (result == -1 || !DWORD1(v22)) {
        notice();
      }
      v17 = SDWORD1(v22);
      l2tp_change_peeraddress(a1, &v24, v11, v12, v13, v14, v15, v16, v20, v21, v22);
      if (sub_4CB0(v17, (_WORD *)&v22 + 1, a4, 2u)) {
        return 5;
      }
      if (!*(_WORD *)a4) {
        goto LABEL_22;
      }
      l2tp_reset_timers(a1, 0);
      if (!*(_WORD *)(a4 + 6)) {
        *(_WORD *)(a4 + 6) = 4;
      }
      l2tp_set_peerparams(a1, (char *)a4);
      *((void *)&v22 + 1) = 1488;
      v23 = &word_1C9EC;
      if (sub_6010(&v23, (void *)&v22 + 1, 0, 3u)) {
        v18 = 0;
      }
      else {
        v18 = 1500 - DWORD2(v22);
      }
      result = sub_49A4(a1, v18, 0, 0, "SCCCN");
      if (!result)
      {
        DWORD1(v22) = sub_5510((uint64_t)a3);
        result = sub_49A4(a1, SDWORD1(v22), 0, 0, "ICRQ");
        if (!result)
        {
          v24.sa_len = 0x80;
          result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v22 + 1, &v24, a5);
          if (!result)
          {
            if (sub_4CB0(SDWORD1(v22), (_WORD *)&v22 + 1, a4, 0xBu)) {
              return 5;
            }
            if (bswap32(*(unsigned __int16 *)((char *)&dword_4 + (void)control_hdr + 2)) >> 16 == a3[4]
              && *(_WORD *)(a4 + 8))
            {
              v19 = sub_55AC((uint64_t)a3);
              return sub_49A4(a1, v19, *(unsigned __int16 *)(a4 + 8), 0, "ICCN");
            }
LABEL_22:
            error();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_49A4(int a1, int a2, unsigned int a3, const sockaddr *a4, const char *a5)
{
  if (a2 <= 0) {
    error();
  }
  word_1C9E6 = __rev16(a3);
  memset(&v10[1], 0, 15);
  v10[0] = 16;
  size_t v7 = a2;
  if (a4) {
    v8 = a4;
  }
  else {
    v8 = (const sockaddr *)v10;
  }
  while (sendto(a1, &control_buf, v7, 0, v8, v8->sa_len) == -1)
  {
    if (&kill_link_ptr) {
      return 4294967294;
    }
    if (*__error() != 4) {
      error();
    }
  }
  uint64_t result = strcmp(a5, "Hello");
  if (result) {
    dbglog();
  }
  return result;
}

uint64_t l2tp_recv(int a1, void *a2, int a3, _DWORD *a4, sockaddr *a5, int a6)
{
  v22[0] = a5->sa_len;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  memset(&v19, 0, sizeof(v19));
  if (a6)
  {
    int v9 = 1 << a1;
    unint64_t v10 = (unint64_t)a1 >> 5;
    uint64_t v11 = a6;
    if (a6 == -1) {
      v12 = 0;
    }
    else {
      v12 = (timeval *)&v20;
    }
    while (1)
    {
      memset(&v19, 0, sizeof(v19));
      if (__darwin_check_fd_set_overflow(a1, &v19, 0)) {
        v19.fds_bits[v10] |= v9;
      }
      uint64_t v20 = v11;
      LODWORD(v21) = 0;
      int v13 = select(a1 + 1, &v19, 0, 0, v12);
      if (!v13) {
        break;
      }
      if (&kill_link_ptr) {
        return 4294967294;
      }
      if (v13 > 0) {
        goto LABEL_12;
      }
      if (*__error() != 4) {
        goto LABEL_15;
      }
    }
    if ((int)&debug_ptr >= 2) {
      dbglog();
    }
    return 0xFFFFFFFFLL;
  }
  else
  {
LABEL_12:
    while (1)
    {
      ssize_t v14 = recvfrom(a1, a2, a3, 128, a5, v22);
      if ((v14 & 0x8000000000000000) == 0) {
        break;
      }
      if (&kill_link_ptr) {
        return 4294967294;
      }
      if (*__error() != 4) {
LABEL_15:
      }
        error();
    }
    int v16 = v14;
    uint64_t result = 0;
    *a4 = v16;
  }
  return result;
}

uint64_t sub_4CB0(uint64_t a1, _WORD *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4 = a1 - 12;
  if (a1 == 12)
  {
LABEL_89:
    unsigned int v30 = 0;
LABEL_90:
    *a2 = v30;
    sub_5E88(v30);
    dbglog();
  }
  __int16 v40 = 0;
  uint64_t v41 = 0;
  char v5 = 0;
  v6 = 0;
  v33 = (void *)(a3 + 827);
  uint64_t v34 = a3 + 1092;
  __dst = (void *)(a3 + 568);
  v36 = (void *)(a3 + 116);
  v37 = a2;
  v35 = (void *)(a3 + 52);
  size_t v7 = (unsigned __int16 *)&word_1C9EC;
  int v8 = 1;
  do
  {
    unsigned int v9 = v7[2];
    unsigned int v10 = bswap32(*v7);
    size_t v11 = HIWORD(v10) & 0x3FF;
    uint64_t v12 = __rev16(v9);
    unsigned int v13 = v11 - 6;
    if (v11 < 6 || v4 < v11) {
      goto LABEL_94;
    }
    unint64_t v42 = v4;
    int v14 = v7[1];
    if (v6) {
      free(v6);
    }
    unsigned int v15 = HIWORD(v10);
    __src = malloc_type_malloc(v11, 0xB4FEF371uLL);
    memcpy(__src, v7 + 3, v11);
    if ((v15 & 0x3C00) == 0 && v14 == 0)
    {
      if (v5)
      {
        v6 = __src;
        if ((v15 & 0x4000) != 0) {
          goto LABEL_94;
        }
        if (v12 <= 0x27)
        {
          int v17 = *((unsigned __int16 *)&avp_attr + 4 * v12);
          if (v17 != 255 && v17 != (unsigned __int16)v13) {
            goto LABEL_94;
          }
          HIDWORD(v41) |= *((_DWORD *)&avp_attr + 2 * v12 + 1);
        }
        switch((int)v12)
        {
          case 1:
            if (v13 <= 1) {
              goto LABEL_94;
            }
            *(_WORD *)(a3 + 564) = bswap32((unsigned __int16)*__src) >> 16;
            if (v13 >= 4)
            {
              *(_WORD *)(a3 + 566) = bswap32((unsigned __int16)__src[1]) >> 16;
              if (v11 == 10)
              {
                LODWORD(v18) = 0;
              }
              else
              {
                if ((unsigned __int16)(v11 - 10) >= 0xFFu) {
                  size_t v18 = 255;
                }
                else {
                  size_t v18 = (unsigned __int16)(v11 - 10);
                }
                memmove(__dst, __src + 2, v18);
                v6 = __src;
              }
              *(unsigned char *)(a3 + v18 + 568) = 0;
            }
            break;
          case 2:
            unsigned int v21 = (unsigned __int16)*__src;
            *(_WORD *)(a3 + 2) = __rev16(v21);
            if (v21 != 1) {
              goto LABEL_94;
            }
            break;
          case 3:
          case 4:
          case 5:
          case 18:
          case 19:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
          case 32:
          case 33:
          case 35:
          case 37:
          case 38:
            break;
          case 6:
            *(_WORD *)(a3 + 4) = bswap32((unsigned __int16)*__src) >> 16;
            break;
          case 7:
            if ((unsigned __int16)(v11 - 6) >= 0x3Fu) {
              size_t v22 = 63;
            }
            else {
              size_t v22 = (unsigned __int16)(v11 - 6);
            }
            memmove(v35, __src, v22);
            v6 = __src;
            *(unsigned char *)(a3 + v22 + 52) = 0;
            break;
          case 8:
            if ((unsigned __int16)(v11 - 6) >= 0x3Fu) {
              size_t v23 = 63;
            }
            else {
              size_t v23 = (unsigned __int16)(v11 - 6);
            }
            memmove(v36, __src, v23);
            v6 = __src;
            *(unsigned char *)(a3 + v23 + 116) = 0;
            break;
          case 9:
            unsigned int v24 = (unsigned __int16)*__src;
            *(_WORD *)a3 = __rev16(v24);
            if (!v24) {
              goto LABEL_94;
            }
            break;
          case 10:
            __int16 v25 = __rev16((unsigned __int16)*__src);
            if (*__src) {
              __int16 v26 = v25;
            }
            else {
              __int16 v26 = 4;
            }
            *(_WORD *)(a3 + 6) = v26;
            break;
          case 11:
          case 13:
            error();
          case 12:
            if (v13 <= 2) {
              goto LABEL_94;
            }
            *(_WORD *)(a3 + 824) = bswap32((unsigned __int16)*__src) >> 16;
            *(unsigned char *)(a3 + 826) = *((unsigned char *)__src + 2);
            if (v11 == 9)
            {
              LODWORD(v27) = 0;
            }
            else
            {
              if ((unsigned __int16)(v11 - 9) >= 0xFFu) {
                size_t v27 = 255;
              }
              else {
                size_t v27 = (unsigned __int16)(v11 - 9);
              }
              memmove(v33, (char *)__src + 3, v27);
              v6 = __src;
            }
            *(unsigned char *)(a3 + v27 + 827) = 0;
            break;
          case 14:
            unsigned int v28 = (unsigned __int16)*__src;
            *(_WORD *)(a3 + 8) = __rev16(v28);
            if (!v28) {
              goto LABEL_94;
            }
            break;
          case 15:
            *(_DWORD *)(a3 + 24) = bswap32(*(_DWORD *)__src);
            break;
          case 34:
            if (v11 != 32) {
              goto LABEL_94;
            }
            int8x8_t v29 = *(int8x8_t *)(__src + 9);
            *(int8x16_t *)uint64_t v34 = vrev32q_s8(*(int8x16_t *)(__src + 1));
            *(int8x8_t *)(v34 + 16) = vrev32_s8(v29);
            break;
          case 36:
            if (v13 > 0x80) {
              goto LABEL_94;
            }
            __memmove_chk();
            v6 = __src;
            break;
          case 39:
            *(_WORD *)(a3 + 10) = 1;
            break;
          default:
            if ((v15 & 0x8000) != 0) {
              goto LABEL_94;
            }
            break;
        }
      }
      else
      {
        v6 = __src;
        if (v9 || (v15 & 0x4000) != 0 || v11 != 8) {
          goto LABEL_94;
        }
        unsigned int v19 = bswap32((unsigned __int16)*__src) >> 16;
        int v20 = v41;
        if ((v15 & 0x8000u) != 0) {
          int v20 = 1;
        }
        __int16 v40 = v19;
        LODWORD(v41) = v20;
        HIDWORD(v41) |= dword_1C004;
      }
    }
    else
    {
      v6 = __src;
      if ((((v15 & 0x8000u) == 0) & ~v8) == 0) {
        goto LABEL_94;
      }
    }
    int v8 = 0;
    size_t v7 = (unsigned __int16 *)((char *)v7 + v11);
    char v5 = 1;
    unint64_t v4 = v42 - v11;
  }
  while (v42 != v11);
  if (v6) {
    free(v6);
  }
  a2 = v37;
  switch(v40)
  {
    case 1:
      if ((~HIDWORD(v41) & 0x3D) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 1;
      goto LABEL_90;
    case 2:
      if ((~HIDWORD(v41) & 0x3D) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 2;
      goto LABEL_90;
    case 3:
      if ((v41 & 0x100000000) == 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 3;
      goto LABEL_90;
    case 4:
      if ((~HIDWORD(v41) & 0x23) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 4;
      goto LABEL_90;
    case 6:
      if ((v41 & 0x100000000) == 0) {
        goto LABEL_94;
      }
      _WORD *v37 = 6;
      uint64_t result = 0;
      if (a4 && a4 != 6)
      {
        sub_5E88(a4);
        sub_5E88(6u);
LABEL_94:
        error();
      }
      return result;
    case 7:
    case 8:
    case 9:
      goto LABEL_94;
    case 10:
      if ((~HIDWORD(v41) & 0x181) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 10;
      goto LABEL_90;
    case 11:
      if ((~HIDWORD(v41) & 0x81) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 11;
      goto LABEL_90;
    case 12:
      if ((~HIDWORD(v41) & 0x5001) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 12;
      goto LABEL_90;
    case 14:
      if ((~HIDWORD(v41) & 0x83) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 14;
      goto LABEL_90;
    case 15:
      if ((~HIDWORD(v41) & 0x8001) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 15;
      goto LABEL_90;
    case 16:
      if ((~HIDWORD(v41) & 0x10001) != 0) {
        goto LABEL_94;
      }
      unsigned int v30 = 16;
      goto LABEL_90;
    default:
      if (!v41) {
        goto LABEL_89;
      }
      goto LABEL_94;
  }
}

uint64_t sub_5510(uint64_t a1)
{
  uint64_t v4 = 1488;
  char v5 = &word_1C9EC;
  int v2 = sub_6010(&v5, &v4, 0, 0xAu);
  uint64_t result = 0;
  if (!v2)
  {
    if (sub_6010(&v5, &v4, 0xEu, *(unsigned __int16 *)(a1 + 8))
      || sub_6084(&v5, &v4, 0xFu, *(_DWORD *)(a1 + 24)))
    {
      return 0;
    }
    else
    {
      return (1500 - v4);
    }
  }
  return result;
}

uint64_t sub_55AC(uint64_t a1)
{
  uint64_t v3 = 1488;
  uint64_t v4 = &word_1C9EC;
  if (sub_6010(&v4, &v3, 0, 0xCu)
    || sub_6084(&v4, &v3, 0x18u, *(_DWORD *)(a1 + 16))
    || sub_6084(&v4, &v3, 0x13u, *(_DWORD *)(a1 + 12)))
  {
    return 0;
  }
  else
  {
    return 1500 - v3;
  }
}

uint64_t l2tp_incoming_call(int a1, unsigned __int16 *a2, uint64_t a3, int a4)
{
  HIDWORD(v17) = 0;
  *(void *)&v18.sa_data[6] = 0;
  *(void *)&v18.sa_family = 0;
  v18.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, 0);
  if (result) {
    return result;
  }
  l2tp_change_peeraddress(a1, &v18, v9, v10, v11, v12, v13, v14, v16, v17, *(_OWORD *)&v18);
  if (sub_4CB0(SHIDWORD(v17), (_WORD *)&v17 + 5, a3, 1u)) {
    return 5;
  }
  if (!*(_WORD *)a3) {
    goto LABEL_19;
  }
  if (!*(_WORD *)(a3 + 6)) {
    *(_WORD *)(a3 + 6) = 4;
  }
  l2tp_set_peerparams(a1, (char *)a3);
  HIDWORD(v17) = sub_5F00(2u, a2);
  uint64_t result = sub_49A4(a1, SHIDWORD(v17), 0, 0, "SCCRP");
  if (result) {
    return result;
  }
  v18.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, a4);
  if (result) {
    return result;
  }
  if (sub_4CB0(SHIDWORD(v17), (_WORD *)&v17 + 5, a3, 3u)) {
    return 5;
  }
  v18.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, a4);
  if (result) {
    return result;
  }
  if (sub_4CB0(SHIDWORD(v17), (_WORD *)&v17 + 5, a3, 0xAu)) {
    return 5;
  }
  if (!*(_WORD *)(a3 + 8)) {
LABEL_19:
  }
    error();
  HIDWORD(v17) = sub_58C8((uint64_t)a2);
  uint64_t result = sub_49A4(a1, SHIDWORD(v17), *(unsigned __int16 *)(a3 + 8), 0, "ICRP");
  if (!result)
  {
    uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, a4);
    if (!result)
    {
      if (sub_4CB0(SHIDWORD(v17), (_WORD *)&v17 + 5, a3, 0xCu)) {
        return 5;
      }
      uint64_t v15 = bswap32(*(unsigned __int16 *)((char *)&dword_4 + (void)control_hdr + 2)) >> 16;
      if (v15 == a2[4]) {
        return 0;
      }
      *(void *)&long long v17 = v15;
      goto LABEL_19;
    }
  }
  return result;
}

uint64_t sub_58C8(uint64_t a1)
{
  uint64_t v4 = 1488;
  char v5 = &word_1C9EC;
  int v2 = sub_6010(&v5, &v4, 0, 0xBu);
  uint64_t result = 0;
  if (!v2)
  {
    if (sub_6010(&v5, &v4, 0xEu, *(unsigned __int16 *)(a1 + 8))) {
      return 0;
    }
    else {
      return (1500 - v4);
    }
  }
  return result;
}

uint64_t l2tp_send_hello(int a1)
{
  uint64_t v4 = 1488;
  char v5 = &word_1C9EC;
  if (sub_6010(&v5, &v4, 0, 6u)) {
    int v2 = 0;
  }
  else {
    int v2 = 1500 - v4;
  }

  return sub_49A4(a1, v2, 0, 0, "Hello");
}

uint64_t l2tp_send_hello_trigger(int a1, const sockaddr *a2)
{
  int v9 = 0;
  size_t v8 = 4;
  if (sysctlbyname("net.key.blockacq_count", &v9, &v8, 0, 0))
  {
    int v9 = 10;
    error();
  }
  uint64_t v10 = 1488;
  uint64_t v11 = &word_1C9EC;
  if (sub_6010(&v11, &v10, 0, 6u)) {
    int v4 = 0;
  }
  else {
    int v4 = 1500 - v10;
  }
  if ((v9 & 0x80000000) == 0)
  {
    int v5 = 0;
    do
    {
      if (sub_49A4(a1, v4, 0, a2, "Hello")) {
        error();
      }
    }
    while (v5++ < v9);
  }
  return 0;
}

uint64_t l2tp_send_SCCRQ(int a1, const sockaddr *a2, unsigned __int16 *a3)
{
  int v5 = sub_5F00(1u, a3);

  return sub_49A4(a1, v5, 0, a2, "SCCRQ");
}

uint64_t l2tp_send_CDN(int a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v14 = 1488;
  uint64_t v15 = &word_1C9EC;
  int v6 = sub_6010(&v15, &v14, 0, 0xEu);
  int v7 = 0;
  if (!v6)
  {
    if (sub_6010(&v15, &v14, 0xEu, a2[4])
      || (!a2[283]
        ? (v10 = 0, uint64_t v9 = 8)
        : (v8 = strlen((const char *)a2 + 568), uint64_t v9 = (unsigned __int16)(v8 + 10), v10 = v8),
          sub_60F8(&v15, &v14, 1u, v9)))
    {
      int v7 = 0;
    }
    else
    {
      uint64_t v13 = v15;
      *uint64_t v15 = a2[282];
      if (a2[283])
      {
        v13[1] = a2[283];
        memcpy(v13 + 2, a2 + 284, v10);
      }
      int v7 = 1500 - v14;
    }
  }
  unsigned int v11 = *(unsigned __int16 *)(a3 + 8);

  return sub_49A4(a1, v7, v11, 0, "CDN");
}

uint64_t l2tp_send_StopCCN(int a1, const char *a2)
{
  uint64_t v11 = 1488;
  uint64_t v12 = &word_1C9EC;
  int v4 = sub_6010(&v12, &v11, 0, 4u);
  int v5 = 0;
  if (!v4)
  {
    if (sub_6010(&v12, &v11, 9u, *(unsigned __int16 *)a2)
      || (!*((_WORD *)a2 + 283)
        ? (v8 = 0, uint64_t v7 = 8)
        : (v6 = strlen(a2 + 568), uint64_t v7 = (unsigned __int16)(v6 + 10), v8 = v6),
          sub_60F8(&v12, &v11, 1u, v7)))
    {
      int v5 = 0;
    }
    else
    {
      size_t v10 = v12;
      __int16 *v12 = *((_WORD *)a2 + 282);
      if (*((_WORD *)a2 + 283))
      {
        v10[1] = *((_WORD *)a2 + 283);
        memcpy(v10 + 2, a2 + 568, v8);
      }
      int v5 = 1500 - v11;
    }
  }

  return sub_49A4(a1, v5, 0, 0, "StopCCN");
}

uint64_t l2tp_data_in(int a1)
{
  int v4 = 0;
  *(void *)&v6.sa_data[6] = 0;
  *(void *)&v6.sa_family = 0;
  bzero(v5, 0x45CuLL);
  v6.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, &v4, &v6, 0);
  if (!result)
  {
    if (!v4) {
      return 0xFFFFFFFFLL;
    }
    unsigned __int16 v3 = 0;
    if (sub_4CB0(v4, &v3, (uint64_t)v5, 0)) {
      return 5;
    }
    if (v3 > 0xEu) {
      return 0;
    }
    if (((1 << v3) & 0x1F8E) != 0) {
      error();
    }
    if (((1 << v3) & 0x4010) == 0) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

char *sub_5E88(unsigned int a1)
{
  if (a1 < 0x11 && ((0x1DEDFu >> a1) & 1) != 0) {
    return (&off_18680)[(__int16)a1];
  }
  v1 = byte_1D878;
  snprintf(byte_1D878, 0xFFuLL, "unknown message (type = 0x%x)", a1);
  return v1;
}

uint64_t sub_5F00(unsigned int a1, unsigned __int16 *a2)
{
  uint64_t v6 = 1488;
  __dst = &word_1C9EC;
  if (sub_6010((_WORD **)&__dst, &v6, 0, a1)) {
    return 0;
  }
  if (sub_6010((_WORD **)&__dst, &v6, 2u, a2[1])) {
    return 0;
  }
  if (sub_6084((_WORD **)&__dst, &v6, 3u, *((_DWORD *)a2 + 9))) {
    return 0;
  }
  size_t v3 = strlen((const char *)a2 + 52) + 1;
  if (sub_60F8((_WORD **)&__dst, &v6, 7u, v3)) {
    return 0;
  }
  int v4 = (char *)__dst;
  memmove(__dst, a2 + 26, v3);
  __dst = &v4[v3];
  if (sub_6010((_WORD **)&__dst, &v6, 9u, *a2)
    || sub_6010((_WORD **)&__dst, &v6, 0xAu, a2[3]))
  {
    return 0;
  }
  else
  {
    return 1500 - v6;
  }
}

uint64_t sub_6010(_WORD **a1, void *a2, unsigned int a3, unsigned int a4)
{
  if (*a2 < 8uLL) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 -= 8;
  **a1 = 2176;
  uint64_t v6 = *a1 + 1;
  *a1 = v6;
  _WORD *v6 = 0;
  uint64_t v7 = (*a1)++;
  v7[1] = __rev16(a3);
  size_t v8 = (*a1)++;
  v8[1] = __rev16(a4);
  ++*a1;
  return result;
}

uint64_t sub_6084(_WORD **a1, void *a2, unsigned int a3, unsigned int a4)
{
  if (*a2 < 0xAuLL) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 -= 10;
  **a1 = 2688;
  uint64_t v6 = *a1 + 1;
  *a1 = v6;
  _WORD *v6 = 0;
  uint64_t v7 = (*a1)++;
  v7[1] = __rev16(a3);
  size_t v8 = (*a1)++;
  *(_DWORD *)(v8 + 1) = bswap32(a4);
  *a1 += 2;
  return result;
}

uint64_t sub_60F8(_WORD **a1, void *a2, unsigned int a3, uint64_t a4)
{
  if (*a2 < (unint64_t)(a4 + 6)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 -= a4 + 6;
  **a1 = bswap32((a4 + 6) | 0x8000) >> 16;
  uint64_t v6 = *a1 + 1;
  *a1 = v6;
  _WORD *v6 = 0;
  uint64_t v7 = (*a1)++;
  v7[1] = __rev16(a3);
  ++*a1;
  return result;
}

void start(const void *a1)
{
  qword_1DB88 = (uint64_t)a1;
  CFRetain(a1);
  the_channel_ptr = &l2tp_options;
  userOptions_ptr = l2tp_process_extra_options;
  off_186C0 = (char *)l2tp_wait_input;
  wait_underlying_interface_up_ptr = l2tp_check_options;
  off_186C8 = (char *)l2tp_pre_start_link_check;
  off_18680 = (char *)l2tp_connect;
  off_18688 = (char *)l2tp_disconnect;
  off_186B0 = (char *)l2tp_cleanup;
  off_186B8 = (char *)l2tp_close_fds;
  off_18690 = (char *)l2tp_establish_ppp;
  off_18698 = (char *)l2tp_disestablish_ppp;
  off_186A0 = (char *)&generic_send_config_ptr;
  off_186A8 = (char *)&generic_recv_config_ptr;
  add_notifier();
}

uint64_t l2tp_process_extra_options()
{
  uint64_t result = strcmp(off_1C160, "answer");
  if (!result)
  {
    uint64_t result = dup(0);
    dword_1C848 = result;
  }
  return result;
}

void l2tp_wait_input()
{
  v0 = 0;
  if (dword_1C84C != -1) {
    is_ready_fd();
  }
  if (dword_1C848 != -1) {
    is_ready_fd();
  }
  ppp_process_nat_port_mapping_events();
}

uint64_t l2tp_check_options()
{
  v0 = off_1C160;
  uint64_t result = strcmp(off_1C160, "connect");
  if (result)
  {
    uint64_t result = strcmp(v0, "listen");
    if (result)
    {
      uint64_t result = strcmp(v0, "answer");
      if (result) {
        error();
      }
    }
  }
  if ((dword_1C168 - 9) <= 0xFFFFFFF7) {
    error();
  }
  if (dword_1C16C <= 3) {
    error();
  }
  if (&extraconnecttime_ptr)
  {
    LODWORD(busycode_ptr) = 1;
    LODWORD(redialtimer_ptr) = 3;
    LODWORD(redialcount_ptr) = (int)&extraconnecttime_ptr / 3;
    LOBYTE(hasbusystate_ptr) = 0;
  }
  return result;
}

uint64_t l2tp_pre_start_link_check()
{
  flags[0] = 0;
  int v0 = nw_nat64_copy_prefixes();
  xmmword_1DCE0 = 0uLL;
  if (v0 < 0) {
    error();
  }
  *(void *)&stru_1DCF8.sa_len = 0;
  *(void *)&stru_1DCF8.sa_data[6] = 0;
  dword_1DD10 = 0;
  qword_1DD08 = 0;
  v1 = SCNetworkReachabilityCreateWithName(0, (const char *)&remoteaddress_ptr);
  if (v1)
  {
    int v2 = v1;
    BOOL v3 = SCNetworkReachabilityGetFlags(v1, flags)
      && ((flags[0] & 2) != 0 && (flags[0] & 5) != 5
       || (flags[0] & 0x10) == 0 && ((~flags[0] & 0xF) == 0 || (flags[0] & 0x40007) == 0x40007));
    CFRelease(v2);
  }
  else
  {
    BOOL v3 = 0;
  }
  if (xmmword_1DCE0)
  {
    int v9 = 0;
    uint64_t v8 = 0;
    flags[1] = -1526332912;
    if (inet_aton((const char *)&remoteaddress_ptr, (in_addr *)&v8))
    {
      *(_DWORD *)&stru_1DCF8.sa_len = -1526325732;
      if ((nw_nat64_synthesize_v6() & 1) == 0) {
        error();
      }
      int v4 = SCNetworkReachabilityCreateWithAddress(0, &stru_1DCF8);
      if (v4)
      {
        int v5 = v4;
        if (SCNetworkReachabilityGetFlags(v4, flags)
          && ((flags[0] & 2) != 0 && (flags[0] & 5) != 5
           || (flags[0] & 0x10) == 0 && ((~flags[0] & 0xF) == 0 || (flags[0] & 0x40007) == 0x40007)))
        {
          notice();
        }
        CFRelease(v5);
      }
    }
  }
  if (v3) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t l2tp_connect(_DWORD *a1)
{
  return sub_800C(a1);
}

void l2tp_disconnect()
{
}

void l2tp_cleanup()
{
  int v0 = 0;
  l2tp_close_fds();
  if (!byte_1D979)
  {
    if (qword_1DD18)
    {
      IPSecRemoveConfiguration((const void *)qword_1DD18, &v0);
      IPSecRemovePolicies((const __CFDictionary *)qword_1DD18, -1, &v0);
      CFRelease((CFTypeRef)qword_1DD18);
      qword_1DD18 = 0;
    }
    if (strcmp(off_1C160, "answer")) {
      IPSecRemoveSecurityAssociations((unsigned __int8 *)&unk_1DB90, (unsigned __int8 *)&xmmword_1DC2C);
    }
  }
  if (DWORD1(xmmword_1DC2C))
  {
    if (dword_1DD40)
    {
      sub_A0D8(2, SDWORD1(xmmword_1DC2C), 0, 0, dword_1DD40 != 1);
      dword_1DD40 = 0;
    }
  }
}

uint64_t l2tp_close_fds()
{
  if (byte_1DD14 == 1) {
    untimeout();
  }
  if (dword_1C84C != -1)
  {
    close(dword_1C84C);
    dword_1C84C = -1;
  }
  if (dword_1C9A8 != -1)
  {
    close(dword_1C9A8);
    dword_1C9A8 = -1;
  }
  if ((dword_1C848 & 0x80000000) == 0)
  {
    close(dword_1C848);
    dword_1C848 = -1;
  }
  uint64_t result = racoon_ctrlsockfd;
  if ((racoon_ctrlsockfd & 0x80000000) == 0)
  {
    uint64_t result = close(racoon_ctrlsockfd);
    racoon_ctrlsockfd = -1;
  }
  return result;
}

void l2tp_establish_ppp(int a1)
{
  int v1 = 0;
  if ((ioctl(a1, 0x8004743DuLL, &v1) & 0x80000000) == 0) {
    generic_establish_ppp();
  }
  error();
}

void l2tp_disestablish_ppp()
{
  int v0 = 0;
  remove_fd();
}

void sub_6E48()
{
  if (dword_1DD40 == 2) {
    sub_A0D8(2, SDWORD1(xmmword_1DC2C), 0, 0, 0);
  }
}

void sub_6E78()
{
}

void sub_6F10()
{
}

uint64_t sub_6F6C()
{
  if (!strcmp(off_1C160, "connect"))
  {
    memset(v6, 0, 106);
    if (racoon_ctrlsockfd < 0)
    {
      int v1 = socket(1, 1, 0);
      racoon_ctrlsockfd = v1;
      if (v1 < 0) {
        error();
      }
      strcpy(v6[0].sa_data, "/var/run/vpncontrol.sock");
      *(_WORD *)&v6[0].sa_len = 256;
      memset(&v6[1].sa_data[9], 0, 79);
      if (connect(v1, v6, 0x6Au) < 0) {
        error();
      }
    }
    uint64_t v3 = 0;
    int v4 = 0;
    uint64_t __buf = 5632;
    if (byte_1DB91 == 2) {
      int v4 = dword_1DB94;
    }
    int v5 = DWORD1(xmmword_1DC2C);
    HIWORD(v3) = 2048;
    write(racoon_ctrlsockfd, &__buf, 0x18uLL);
  }
  else
  {
    IPSecRemoveSecurityAssociations((unsigned __int8 *)&unk_1DB90, (unsigned __int8 *)&xmmword_1DC2C);
  }
  return sleep(3u);
}

void sub_70F4()
{
  if (&wait_underlying_interface_up_ptr) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = &lcp_echo_interval_ptr == 0;
  }
  if (!v0) {
    LODWORD(wait_underlying_interface_up_ptr) = 1;
  }
  ppp_block_public_nat_port_mapping_timer();
}

uint64_t l2tp_resolver_thread()
{
  char __buf = -1;
  unsigned __int8 v15 = 0;
  BOOL v0 = pthread_self();
  if (!pthread_detach(v0))
  {
    int v1 = gethostbyname((const char *)&remoteaddress_ptr);
    if (v1)
    {
      int v2 = v1;
      h_addr_list = v1->h_addr_list;
      int v4 = -1;
      do
      {
        uint64_t v5 = (uint64_t)*h_addr_list++;
        ++v4;
      }
      while (v5);
      unsigned __int8 v15 = 0;
      int v6 = open("/dev/random", 0);
      if (v6)
      {
        int v7 = v6;
        read(v6, &v15, 1uLL);
        close(v7);
      }
      DWORD1(xmmword_1DC2C) = 0;
      if (v4)
      {
        DWORD1(xmmword_1DC2C) = *(_DWORD *)v2->h_addr_list[v15 % v4];
        xmmword_1DC3C = 0u;
        unk_1DC4C = 0u;
        xmmword_1DC5C = 0u;
        unk_1DC6C = 0u;
        xmmword_1DC7C = 0u;
        unk_1DC8C = 0u;
        xmmword_1DC9C = 0u;
        unk_1DCAC = 0u;
        xmmword_1DCBC = 0u;
        unk_1DCCC = 0u;
        dword_1DCDC = 0;
        if (v4 == 1) {
          goto LABEL_18;
        }
        int v8 = v4 >= 11 ? 11 : v4;
        if (v8 < 2) {
          goto LABEL_18;
        }
        unint64_t v9 = 0;
        unint64_t v10 = (v8 - 1);
        int v11 = v15 + 1;
        uint64_t v12 = (char *)&xmmword_1DC3C + 2;
        do
        {
          *(_DWORD *)(v12 - 2) = -1526332912;
          int v13 = v11 + v9++;
          *(_DWORD *)(v12 + 2) = *(_DWORD *)v2->h_addr_list[v13 % v4];
          v12 += 16;
        }
        while (v9 < v10);
      }
      else
      {
        LODWORD(v9) = 0;
        xmmword_1DCBC = 0u;
        unk_1DCCC = 0u;
        xmmword_1DC9C = 0u;
        unk_1DCAC = 0u;
        xmmword_1DC7C = 0u;
        unk_1DC8C = 0u;
        xmmword_1DC5C = 0u;
        unk_1DC6C = 0u;
        xmmword_1DC3C = 0u;
        unk_1DC4C = 0u;
      }
      dword_1DCDC = v9;
LABEL_18:
      char __buf = 0;
    }
  }
  write(dword_1C99C, &__buf, 1uLL);
  return 0;
}

uint64_t l2tp_edge_thread()
{
  char __buf = -1;
  BOOL v0 = pthread_self();
  if (!pthread_detach(v0))
  {
    uint64_t v2 = _CTServerConnectionCreate();
    if (v2)
    {
      uint64_t v3 = (const void *)v2;
      _CTServerConnectionSetPacketContextActiveByServiceType();
      if (!((unint64_t)_CTServerConnectionGetPacketContextActive() >> 32))
      {
        int v4 = -39;
        do
        {
          sleep(1u);
          if ((unint64_t)_CTServerConnectionGetPacketContextActive() >> 32) {
            BOOL v5 = 1;
          }
          else {
            BOOL v5 = v4 == 0;
          }
          ++v4;
        }
        while (!v5);
      }
      CFRelease(v3);
    }
  }
  write(dword_1C9A4, &__buf, 1uLL);
  return 0;
}

const char *ipsec_error_to_str(int a1)
{
  int v1 = a1 + 1;
  uint64_t result = "Invalid payload type";
  switch(v1)
  {
    case 0:
      uint64_t result = "Internal error";
      break;
    case 1:
      goto LABEL_5;
    case 2:
      return result;
    case 3:
      uint64_t result = "DOI not supported";
      break;
    case 4:
      uint64_t result = "Situation not supported";
      break;
    case 5:
      uint64_t result = "Invalid cookie";
      break;
    case 6:
      uint64_t result = "Invalid major version";
      break;
    case 7:
      uint64_t result = "Invalid minor version";
      break;
    case 8:
      uint64_t result = "Invalid exchange type";
      break;
    case 9:
      uint64_t result = "Invalid flags";
      break;
    case 10:
      uint64_t result = "Invalid message id";
      break;
    case 11:
      uint64_t result = "Invalid protocol id";
      break;
    case 12:
      uint64_t result = "Invalid SPI";
      break;
    case 13:
      uint64_t result = "Invalid transform id";
      break;
    case 14:
      uint64_t result = "Attributes not supported";
      break;
    case 15:
      uint64_t result = "No proposal chosen";
      break;
    case 16:
      uint64_t result = "Bad proposal syntax";
      break;
    case 17:
      uint64_t result = "Payload malformed";
      break;
    case 18:
      uint64_t result = "Invalid key information";
      break;
    case 19:
      uint64_t result = "Invalid id information";
      break;
    case 20:
      uint64_t result = "Invalid cert encoding";
      break;
    case 21:
      uint64_t result = "Invalid certificate";
      break;
    case 22:
      uint64_t result = "Bad cert request syntax";
      break;
    case 23:
      uint64_t result = "Invalid cert authority";
      break;
    case 24:
      uint64_t result = "Invalid hash information";
      break;
    case 25:
      uint64_t result = "Authentication Failed";
      break;
    case 26:
      uint64_t result = "Invalid signature";
      break;
    case 27:
      uint64_t result = "Address notification";
      break;
    case 28:
      uint64_t result = "Notify SA lifetime";
      break;
    case 29:
      uint64_t result = "Certificate unavailable";
      break;
    case 30:
      uint64_t result = "Unsupported exchange type";
      break;
    case 31:
      uint64_t result = "Unequal payload lengths";
      break;
    default:
      if ("Invalid payload type" == 40501) {
        uint64_t result = "Load balance";
      }
      else {
LABEL_5:
      }
        uint64_t result = "Unknown error";
      break;
  }
  return result;
}

uint64_t l2tp_trigger_ipsec(int a1)
{
  memset(v17, 0, 106);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  sockaddr v9 = (sockaddr)0;
  long long v10 = 0u;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (racoon_ctrlsockfd < 0)
  {
    int v2 = socket(1, 1, 0);
    racoon_ctrlsockfd = v2;
    if (v2 < 0
      || (strcpy(v17[0].sa_data, "/var/run/vpncontrol.sock"),
          *(_WORD *)&v17[0].sa_len = 256,
          memset(&v17[1].sa_data[9], 0, 79),
          connect(v2, v17, 0x6Au) < 0))
    {
      error();
    }
  }
  if (!a1)
  {
    uint64_t v5 = 0x800000000000000;
    uint64_t __buf = 256;
    *(void *)&long long v6 = DWORD1(xmmword_1DC2C);
    write(racoon_ctrlsockfd, &__buf, 0x18uLL);
    if (xmmword_1DCE0)
    {
      uint64_t v5 = 0x1000000000000000;
      uint64_t __buf = 6144;
      long long v6 = xmmword_1DCE0;
      notice();
    }
    notice();
  }
  close(racoon_ctrlsockfd);
  racoon_ctrlsockfd = -1;
  return 0;
}

uint64_t l2tp_change_peeraddress(int a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, long long a10, long long a11)
{
  size_t v11 = *(unsigned __int8 *)a2;
  if (v11 != xmmword_1DC2C) {
    goto LABEL_9;
  }
  if (!bcmp(&xmmword_1DC2C, a2, v11)) {
    return 0;
  }
  var48[0] = 0uLL;
  __int16 v26 = 0;
  if (!byte_1D979 && !strcmp(off_1C160, "connect"))
  {
    IPSecRemoveConfiguration((const void *)qword_1DD18, &v26);
    if (a2[1] != DWORD1(xmmword_1DC2C)) {
      IPSecRemoveSecurityAssociations((unsigned __int8 *)&unk_1DB90, (unsigned __int8 *)&xmmword_1DC2C);
    }
    IPSecRemovePolicies((const __CFDictionary *)qword_1DD18, -1, &v26);
  }
  if (get_src_address(var48, (uint64_t)a2, (const char *)&ifscope_ptr, 0)) {
    goto LABEL_9;
  }
  if (byte_1DB91 == 2 && DWORD1(var48[0]) != dword_1DB94)
  {
    xmmword_1DBD0 = var48[4];
    unk_1DBE0 = var48[5];
    xmmword_1DBF0 = a10;
    unk_1DC00 = a11;
    unk_1DB90 = var48[0];
    unk_1DBA0 = var48[1];
    xmmword_1DBB0 = var48[2];
    unk_1DBC0 = var48[3];
    if (!strcmp(off_1C160, "connect")) {
      __int16 v15 = 0;
    }
    else {
      __int16 v15 = -23290;
    }
    word_1DB92 = v15;
    l2tp_set_ouraddress(a1, (unsigned __int8 *)&unk_1DB90);
  }
  __memmove_chk();
  uint64_t v14 = l2tp_set_peeraddress(a1, (unsigned __int8 *)a2);
  long long v16 = off_1C160;
  size_t v17 = strlen(off_1C160);
  if (!strncmp(off_1C160, "answer", v17) || !strncmp(v16, "listen", v17))
  {
    v18.s_addr = DWORD1(xmmword_1DC2C);
    remoteaddress_ptr = inet_ntoa(v18);
    notice();
  }
  if (!byte_1D979 && !strcmp(off_1C160, "connect"))
  {
    int v20 = addr2ascii(2, (char *)&xmmword_1DC2C + 4, 4, 0);
    CFStringRef v21 = CFStringCreateWithCString(0, v20, 0x600u);
    unsigned int valuePtr = bswap32(WORD1(xmmword_1DC2C)) >> 16;
    CFNumberRef v22 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1DD18, @"RemoteAddress", v21);
    Value = (__CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1DD18, @"Policies");
    if (CFArrayGetCount(Value) >= 2) {
      CFArrayRemoveValueAtIndex(Value, 1);
    }
    ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
    CFDictionarySetValue(ValueAtIndex, @"RemotePort", v22);
    CFArraySetValueAtIndex(Value, 0, ValueAtIndex);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1DD18, @"Policies", Value);
    CFRelease(v21);
    CFRelease(v22);
    if (IPSecApplyConfiguration((const void *)qword_1DD18, &v26)
      || IPSecInstallPolicies((const __CFDictionary *)qword_1DD18, -1, &v26))
    {
LABEL_9:
      error();
    }
  }
  return v14;
}

uint64_t sub_800C(_DWORD *a1)
{
  *a1 = 0;
  if (&cfgCache_ptr && &serviceidRef_ptr)
  {
    snprintf(__str, 0x20uLL, "socket[%d:%d]", 34, 18);
    __strlcpy_chk();
    LODWORD(hungup_ptr) = 0;
    LODWORD(kill_link_ptr) = 0;
    byte_1DD20 = 0;
    int v1 = &unk_1D000;
    byte_1DC10 = 0;
    unk_1DB90 = 528;
    unk_1DB98 = 0;
    xmmword_1DC2C = 0x210uLL;
    bzero(&our_params, 0x45CuLL);
    bzero(&peer_params, 0x45CuLL);
    word_1CFC8 = getpid();
    word_1CFC6 = dword_1C17C;
    word_1CFCA = 0;
    dword_1CFD8 = 1;
    dword_1CFE4 = 3;
    unk_1CFCC = 0xF424000000003;
    if (gethostname(&byte_1CFF4, 0x40uLL)) {
      byte_1CFF4 = 0;
    }
    word_1CFC2 = 256;
    if (!&ifscope_ptr)
    {
      CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
      if (NetworkGlobalEntity)
      {
        CFStringRef v15 = NetworkGlobalEntity;
        CFDictionaryRef v16 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)&cfgCache_ptr, NetworkGlobalEntity);
        CFRelease(v15);
        if (v16)
        {
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v16, kSCPropNetIPv4Router);
          if (Value) {
            CFStringGetCString(Value, &byte_1DD20, 16, 0x8000100u);
          }
          CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(v16, kSCDynamicStorePropNetPrimaryInterface);
          if (v18) {
            CFStringGetCString(v18, &byte_1DC10, 17, 0x8000100u);
          }
          CFRelease(v16);
        }
      }
      goto LABEL_46;
    }
    __strcpy_chk();
    if (!byte_1DC10) {
      goto LABEL_49;
    }
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
    int v4 = 0;
    if (Mutable)
    {
      uint64_t v5 = 0;
      CFDictionaryRef theDict = 0;
      if (!NetworkServiceEntity) {
        goto LABEL_32;
      }
      CFStringRef cf = NetworkServiceEntity;
      CFArrayAppendValue(Mutable, NetworkServiceEntity);
      CFDictionaryRef v6 = SCDynamicStoreCopyMultiple(0, 0, Mutable);
      if (v6)
      {
        CFDictionaryRef theDict = v6;
        int64_t Count = CFDictionaryGetCount(v6);
        uint64_t v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
        uint64_t v8 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
        int v4 = v8;
        if (v5)
        {
          if (v8)
          {
            CFDictionaryGetKeysAndValues(theDict, v5, v8);
            if (Count >= 1)
            {
              size_t v23 = Mutable;
              for (uint64_t i = 0; i != Count; ++i)
              {
                CFStringRef v10 = (const __CFString *)v5[i];
                CFDictionaryRef v11 = (const __CFDictionary *)v4[i];
                if (v10) {
                  BOOL v12 = v11 == 0;
                }
                else {
                  BOOL v12 = 1;
                }
                if (!v12)
                {
                  CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(v11, kSCPropInterfaceName);
                  if (v13)
                  {
                    buffer[0] = 0;
                    buffer[1] = 0;
                    CFStringGetCString(v13, (char *)buffer, 16, 0x600u);
                    if (!strcmp((const char *)buffer, &byte_1DC10)
                      && CFStringHasPrefix(v10, kSCDynamicStoreDomainState)
                      && CFStringHasSuffix(v10, kSCEntNetIPv4))
                    {
                      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v10, @"/");
                      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 4)
                      {
                        ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3);
                        if (ValueAtIndex) {
                          CFRetain(ValueAtIndex);
                        }
                      }
                      CFRelease(ArrayBySeparatingStrings);
                      warning();
                    }
                  }
                }
              }
              Mutable = v23;
              int v1 = (unsigned char *)&unk_1D000;
              CFStringRef NetworkServiceEntity = cf;
LABEL_32:
              if (!NetworkServiceEntity) {
                goto LABEL_38;
              }
              goto LABEL_37;
            }
          }
        }
      }
      else
      {
        CFDictionaryRef theDict = 0;
        uint64_t v5 = 0;
        int v4 = 0;
      }
      CFStringRef NetworkServiceEntity = cf;
LABEL_37:
      CFRelease(NetworkServiceEntity);
LABEL_38:
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (theDict) {
        CFRelease(theDict);
      }
      if (v5) {
        free(v5);
      }
      if (v4) {
        free(v4);
      }
LABEL_46:
      if (v1[3088])
      {
        int v19 = get_if_mtu() - 220;
        if ((int)&phase_ptr > v19) {
          LODWORD(phase_ptr) = v19;
        }
      }
LABEL_49:
      byte_1DC24 = 0;
      byte_1DC28 = 0;
      LODWORD(wait_underlying_interface_up_ptr) = 0;
      ppp_session_clear();
    }
    uint64_t v5 = 0;
    CFDictionaryRef theDict = 0;
    goto LABEL_32;
  }
  LODWORD(status_ptr) = 8;
  l2tp_close_fds();
  return 0xFFFFFFFFLL;
}

void sub_9850()
{
  if (l2tp_send_hello(dword_1C848)) {
    error();
  }

  timeout((int)sub_9850);
}

uint64_t l2tp_set_baudrate(int a1, int a2)
{
  int v4 = a2;
  uint64_t result = setsockopt(a1, 18, 15, &v4, 4u);
  if (result)
  {
    uint64_t v3 = __error();
    strerror(*v3);
    error();
  }
  return result;
}

uint64_t l2tp_set_delegated_process(int a1, int a2)
{
  int v4 = a2;
  uint64_t result = setsockopt(a1, 18, 17, &v4, 4u);
  if (result)
  {
    uint64_t v3 = __error();
    strerror(*v3);
    error();
  }
  return result;
}

uint64_t l2tp_set_ouraddress(int a1, unsigned __int8 *a2)
{
  if (setsockopt(a1, 18, 14, a2, *a2))
  {
    int v4 = __error();
    strerror(*v4);
    error();
  }
  socklen_t v6 = *a2;
  getsockopt(a1, 18, 14, a2, &v6);
  return 0;
}

uint64_t l2tp_set_peeraddress(int a1, unsigned __int8 *a2)
{
  uint64_t result = setsockopt(a1, 18, 2, a2, *a2);
  if (result)
  {
    uint64_t v3 = __error();
    strerror(*v3);
    error();
  }
  return result;
}

uint64_t l2tp_new_tunnelid(int a1, uint64_t a2)
{
  uint64_t v4 = a2;
  socklen_t v3 = 2;
  getsockopt(a1, 18, 4, &v4, &v3);
  return 0;
}

uint64_t l2tp_set_ourparams(int a1, char *a2)
{
  uint64_t v4 = setsockopt(a1, 18, 3, a2, 2u);
  if (v4
    || (uint64_t v4 = setsockopt(a1, 18, 6, a2 + 8, 2u), v4)
    || (uint64_t v4 = setsockopt(a1, 18, 8, a2 + 6, 2u), v4))
  {
    uint64_t v5 = __error();
    socklen_t v6 = strerror(*v5);
    syslog(7, "l2tp_set_ourparams: failed to set L2TP socket options, err = %s", v6);
  }
  return v4;
}

uint64_t l2tp_set_peerparams(int a1, char *a2)
{
  uint64_t v4 = setsockopt(a1, 18, 5, a2, 2u);
  if (v4
    || (uint64_t v4 = setsockopt(a1, 18, 7, a2 + 8, 2u), v4)
    || (uint64_t v4 = setsockopt(a1, 18, 9, a2 + 6, 2u), v4))
  {
    uint64_t v5 = __error();
    socklen_t v6 = strerror(*v5);
    syslog(3, "l2tp_set_peerparams: failed to set L2TP socket options, err = %s", v6);
  }
  return v4;
}

uint64_t l2tp_set_flag(int a1, int a2, int a3)
{
  int v8 = 0;
  socklen_t v9 = 4;
  uint64_t result = getsockopt(a1, 18, 1, &v8, &v9);
  if (!result)
  {
    int v7 = v8 & ~a3;
    if (a2) {
      int v7 = v8 | a3;
    }
    int v8 = v7;
    return setsockopt(a1, 18, 1, &v8, 4u);
  }
  return result;
}

void l2tp_reset_timers(int a1, int a2)
{
  BOOL v4 = a2 == 0;
  BOOL v5 = a2 == 0;
  if (v4) {
    socklen_t v6 = &unk_1C170;
  }
  else {
    socklen_t v6 = &unk_1C178;
  }
  l2tp_set_flag(a1, v5, 32);
  __int16 v7 = dword_1C168;
  if (a2) {
    __int16 v7 = dword_1C174;
  }
  __int16 v13 = v7;
  __int16 v8 = dword_1C16C;
  if (a2) {
    __int16 v8 = dword_1C174;
  }
  __int16 v12 = v8;
  __int16 v11 = *v6;
  if (setsockopt(a1, 18, 10, &v13, 2u) || setsockopt(a1, 18, 11, &v12, 2u) || setsockopt(a1, 18, 12, &v11, 2u))
  {
    socklen_t v9 = __error();
    CFStringRef v10 = strerror(*v9);
    syslog(3, "l2tp_reset_timers: failed to set L2TP socket options, err = %s", v10);
  }
}

double l2tp_ip_probe_init(_OWORD *a1, uint64_t a2, int a3)
{
  if (a1 && a2 && a3 >= 3)
  {
    if_nametoindex(&byte_1DC10);
    bzero(a1, 16 * a3);
    *(void *)a1 = 0x808080800000204;
    if (BYTE1(xmmword_1DC2C) == 2 && DWORD1(xmmword_1DC2C) != 0)
    {
      a1[1] = xmmword_1DC2C;
      if (dword_1DCDC) {
        a1[2] = xmmword_1DC3C[arc4random() % dword_1DCDC];
      }
    }
    double result = NAN;
    *(void *)a2 = -1;
    *(_DWORD *)(a2 + 8) = -1;
  }
  return result;
}

void l2tp_init_session()
{
}

void sub_9EE4()
{
  if (byte_1DC28 == 1)
  {
    byte_1DC28 = 0;
    log_vpn_interface_address_event();
  }
}

void sub_9F58()
{
  if (DWORD1(xmmword_1DC2C))
  {
    *(void *)flags = 0;
    BOOL v0 = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)&xmmword_1DC2C);
    if (SCNetworkReachabilityGetFlags(v0, &flags[1])) {
      BOOL v1 = (flags[1] & 0x20000) != 0;
    }
    else {
      BOOL v1 = 0;
    }
    CFRelease(v0);
    sub_A0D8(2, SDWORD1(xmmword_1DC2C), 0, 0, 0);
    if (!v1 && byte_1DD20 && inet_aton(&byte_1DD20, (in_addr *)flags) == 1)
    {
      int v2 = 1;
      sub_A0D8(1, SDWORD1(xmmword_1DC2C), flags[0], 0, 0);
    }
    else
    {
      if (!byte_1DC10) {
        return;
      }
      flags[0] = 0;
      sub_A0D8(1, SDWORD1(xmmword_1DC2C), 0, &byte_1DC10, 1);
      int v2 = 2;
    }
    dword_1DD40 = v2;
  }
}

uint64_t sub_A060()
{
  int v0 = getdtablesize();
  if (v0 >= 1)
  {
    unsigned int v1 = v0 + 1;
    do
    {
      close(v1 - 2);
      --v1;
    }
    while (v1 > 1);
  }
  open("/dev/null", 2, 0);
  dup(0);

  return dup(0);
}

void sub_A0D8(char a1, int a2, int a3, const char *a4, int a5)
{
  int v10 = socket(17, 3, 17);
  if (v10 < 0)
  {
    CFDictionaryRef v16 = __error();
    size_t v17 = strerror(*v16);
    syslog(6, "host_gateway: open routing socket failed, %s", v17);
  }
  else
  {
    int v11 = v10;
    long long __buf = 0u;
    long long v21 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BYTE3(__buf) = a1;
    if (a5) {
      unsigned int v12 = 2305;
    }
    else {
      unsigned int v12 = 2053;
    }
    if (a3) {
      v12 |= 2u;
    }
    BYTE2(__buf) = 5;
    DWORD1(v21) = 1;
    WORD6(v25) = 528;
    LODWORD(v26) = a2;
    *((void *)&__buf + 1) = v12 | 0x700000000;
    WORD6(v26) = 528;
    LODWORD(v27) = a3;
    WORD6(v27) = 528;
    LODWORD(v28) = -1;
    if (a4)
    {
      WORD6(v28) = 4628;
      size_t v13 = strlen(a4);
      if (v13 >= 0xC) {
        char v14 = 12;
      }
      else {
        char v14 = v13;
      }
      BYTE1(v29) = v14;
      HIDWORD(__buf) = 23;
      __memmove_chk();
      unsigned int v15 = 160;
    }
    else
    {
      unsigned int v15 = 140;
    }
    LOWORD(__buf) = v15;
    if (write(v11, &__buf, v15) < 0)
    {
      CFStringRef v18 = __error();
      int v19 = strerror(*v18);
      syslog(7, "host_gateway: write routing socket failed, %s", v19);
    }
    close(v11);
  }
}

uint64_t ipsec_check_keylen(int a1, int a2, unsigned int a3)
{
  int v5 = 2;
  if (a1 != 14)
  {
    if (a1 != 15) {
      goto LABEL_6;
    }
    int v5 = 3;
  }
  socklen_t v6 = sub_A378(v5, a2);
  if (v6)
  {
    __int16 v7 = v6;
    unsigned int v8 = *((unsigned __int16 *)v6 + 1);
    int v5 = 14;
    if (v8 <= a3)
    {
      unsigned int v10 = *((unsigned __int16 *)v7 + 2);
      if (v10 >= a3) {
        int v5 = 0;
      }
      else {
        int v5 = 14;
      }
      if (v10 >= a3) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 0xFFFFFFFFLL;
      }
      goto LABEL_14;
    }
LABEL_6:
    uint64_t v9 = 0xFFFFFFFFLL;
LABEL_14:
    __ipsec_errcode = v5;
    return v9;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ipsec_check_keylen2(int a1, int a2, unsigned int a3)
{
  BOOL v4 = sub_A378(a1, a2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = 14;
  if (*((unsigned __int16 *)v4 + 1) <= a3)
  {
    unsigned int v7 = *((unsigned __int16 *)v4 + 2);
    if (v7 >= a3) {
      int v5 = 0;
    }
    else {
      int v5 = 14;
    }
    if (v7 >= a3) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t result = 0xFFFFFFFFLL;
  }
  __ipsec_errcode = v5;
  return result;
}

unsigned __int8 *sub_A378(int a1, int a2)
{
  uint64_t v2 = 0;
  while (dword_17D54[v2] != a1)
  {
    if (++v2 == 3) {
      goto LABEL_6;
    }
  }
  if (v2 == 0xFFFFFFFFLL)
  {
LABEL_6:
    int v3 = 2;
LABEL_7:
    uint64_t result = 0;
    __ipsec_errcode = v3;
    return result;
  }
  int v5 = (unsigned __int16 *)qword_1DD48[v2];
  if (!v5)
  {
    int v3 = 22;
    goto LABEL_7;
  }
  unsigned int v6 = *v5;
  if (v6 < 0x10)
  {
LABEL_14:
    int v3 = 1;
    goto LABEL_7;
  }
  uint64_t result = (unsigned __int8 *)(v5 + 4);
  int v7 = v6 + 8;
  while (*result != a2)
  {
    result += 8;
    v7 -= 8;
    if (v7 <= 23) {
      goto LABEL_14;
    }
  }
  return result;
}

uint64_t ipsec_get_keylen(int a1, int a2, void *a3)
{
  if (a3)
  {
    int v5 = 2;
    if (a1 != 14)
    {
      if (a1 != 15)
      {
        uint64_t v8 = 0xFFFFFFFFLL;
        goto LABEL_9;
      }
      int v5 = 3;
    }
    unsigned int v6 = sub_A378(v5, a2);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    int v7 = v6;
    int v5 = 0;
    uint64_t v8 = 0;
    *a3 = *(void *)v7;
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    int v5 = 2;
  }
LABEL_9:
  __ipsec_errcode = v5;
  return v8;
}

uint64_t pfkey_set_softrate(int a1, int a2)
{
  __ipsec_errcode = 0;
  if ((a2 - 101) >= 0xFFFFFF9C) {
    int v2 = a2;
  }
  else {
    int v2 = 100;
  }
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      dword_1C9B0 = v2;
      break;
    case 1:
      uint64_t result = 0;
      dword_1C9B4 = v2;
      break;
    case 2:
      uint64_t result = 0;
      dword_1C9B8 = v2;
      break;
    case 3:
      uint64_t result = 0;
      dword_1C9BC = v2;
      break;
    default:
      __ipsec_errcode = 2;
      uint64_t result = 1;
      break;
  }
  return result;
}

uint64_t pfkey_get_softrate(int a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = dword_1C9B0;
      break;
    case 1:
      uint64_t result = dword_1C9B4;
      break;
    case 2:
      uint64_t result = dword_1C9B8;
      break;
    case 3:
      uint64_t result = dword_1C9BC;
      break;
    default:
      uint64_t result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

uint64_t pfkey_send_getspi(int a1, char a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned int a6, unsigned int a7, int a8, int a9)
{
  if (a4 && a5)
  {
    int v11 = a4[1];
    if (v11 == a5[1])
    {
      if (a6 > a7 || a6 - 1 <= 0xFE)
      {
        SCLog();
        int v19 = 18;
      }
      else
      {
        if (v11 == 2)
        {
          char v18 = 32;
LABEL_13:
          char v34 = v18;
          BOOL v20 = a6 < 0x100 || a7 == -1;
          char v21 = v20;
          char v33 = v21;
          if (v20) {
            uint64_t v22 = 50;
          }
          else {
            uint64_t v22 = 66;
          }
          size_t v23 = ((*a4 - 1) | 7) + ((*a5 - 1) | 7) + v22;
          long long v24 = malloc_type_calloc(1uLL, v23, 0xB13DC911uLL);
          if (!v24)
          {
            long long v29 = __error();
            strerror(*v29);
            __ipsec_set_strerror();
LABEL_41:
            SCLog();
            return 0xFFFFFFFFLL;
          }
          long long v25 = v24;
          pid_t v26 = getpid();
          if ((int)v23 > 15)
          {
            *long long v25 = 0;
            v25[1] = 0;
            *(_WORD *)long long v25 = 258;
            *((unsigned char *)v25 + 2) = 0;
            *((unsigned char *)v25 + 3) = a2;
            *((_DWORD *)v25 + 1) = (unsigned __int16)(v23 >> 3);
            *((_DWORD *)v25 + 2) = a9;
            *((_DWORD *)v25 + 3) = v26;
            if (v23 > 0x1F)
            {
              unint64_t v30 = (unint64_t)v25 + v23;
              v25[2] = 0;
              v25[3] = 0;
              *((_DWORD *)v25 + 4) = 1245186;
              *((unsigned char *)v25 + 20) = a3;
              *((_DWORD *)v25 + 7) = a8;
              v31 = sub_A990((_WORD *)v25 + 16, (unint64_t)v25 + v23, 5, a4, v34, 255);
              if (v31)
              {
                v32 = sub_A990(v31, (unint64_t)v25 + v23, 6, a5, v34, 255);
                if (v32)
                {
                  if ((v33 & 1) == 0)
                  {
                    if ((unint64_t)(v32 + 16) > v30) {
                      goto LABEL_40;
                    }
                    *(_DWORD *)v32 = 1048578;
                    *((_DWORD *)v32 + 1) = a6;
                    *((_DWORD *)v32 + 2) = a7;
                    *((_DWORD *)v32 + 3) = 0;
                    v32 += 16;
                  }
                  if (v32 == (char *)v30)
                  {
                    ssize_t v27 = pfkey_send(a1, v25, v23);
                    free(v25);
                    if ((v27 & 0x80000000) == 0)
                    {
                      __ipsec_errcode = 0;
                      return v27;
                    }
                    goto LABEL_41;
                  }
                }
              }
            }
          }
LABEL_40:
          free(v25);
          goto LABEL_41;
        }
        if (v11 == 30)
        {
          char v18 = 0x80;
          goto LABEL_13;
        }
        SCLog();
        int v19 = 15;
      }
    }
    else
    {
      SCLog();
      int v19 = 24;
    }
  }
  else
  {
    SCLog();
    int v19 = 2;
  }
  __ipsec_errcode = v19;
  return 0xFFFFFFFFLL;
}

char *sub_A990(_WORD *a1, unint64_t a2, __int16 a3, unsigned __int8 *a4, char a5, char a6)
{
  int v6 = (*a4 - 1) | 7;
  uint64_t v7 = (v6 + 9);
  uint64_t v8 = (char *)a1 + v7;
  if ((unint64_t)a1 + v7 > a2) {
    return 0;
  }
  bzero(a1, (v6 + 9));
  *a1 = v7 >> 3;
  a1[1] = a3;
  *((unsigned char *)a1 + 4) = a6;
  *((unsigned char *)a1 + 5) = a5;
  a1[3] = 0;
  memcpy(a1 + 4, a4, *a4);
  return v8;
}

ssize_t pfkey_send(int a1, const void *a2, int a3)
{
  ssize_t result = send(a1, a2, a3, 0);
  if ((result & 0x80000000) != 0)
  {
    BOOL v4 = __error();
    strerror(*v4);
    __ipsec_set_strerror();
    return 0xFFFFFFFFLL;
  }
  else
  {
    __ipsec_errcode = 0;
  }
  return result;
}

uint64_t pfkey_send_update(int a1, int a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6, int a7, char a8, char *a9, int a10, unsigned int a11, int a12, unsigned int a13, int a14, int a15, unsigned int a16, int a17, unsigned int a18, int a19, unsigned int a20,int a21,int a22)
{
  return sub_AAD4(a1, 2, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t sub_AAD4(int a1, char a2, int a3, char a4, unsigned __int8 *a5, unsigned __int8 *a6, int a7, int a8, char a9, char *a10, int a11, unsigned int a12, int a13, unsigned int a14, int a15, int a16, unsigned int a17, unsigned int a18, unsigned int a19, int a20)
{
  if (!a5 || !a6)
  {
    SCLog();
    int v30 = 2;
    goto LABEL_37;
  }
  int v22 = a5[1];
  if (v22 != a6[1])
  {
    SCLog();
    int v30 = 24;
    goto LABEL_37;
  }
  char v26 = a3;
  if (v22 == 2)
  {
    char v29 = 32;
  }
  else
  {
    if (v22 != 30)
    {
      SCLog();
      int v30 = 15;
      goto LABEL_37;
    }
    char v29 = 0x80;
  }
  switch(a3)
  {
    case 2:
      if (!a11)
      {
        if (!a13)
        {
LABEL_36:
          SCLog();
          int v30 = 20;
          goto LABEL_37;
        }
LABEL_23:
        char v45 = v29;
        int v31 = ((a12 - 1) | 7) + 139;
        int v32 = ((a14 - 1) | 7) + 9;
        if (!a13) {
          int v32 = 0;
        }
        if (!a11) {
          int v31 = 130;
        }
        size_t v33 = v31 + v32 + ((*a5 - 1) | 7) + ((*a6 - 1) | 7);
        char v34 = malloc_type_calloc(1uLL, v33, 0xDCB1D0AuLL);
        if (!v34)
        {
          v36 = __error();
          strerror(*v36);
          __ipsec_set_strerror();
LABEL_57:
          SCLog();
          return 0xFFFFFFFFLL;
        }
        v46 = v34;
        pid_t v35 = getpid();
        if ((int)v33 > 15)
        {
          void *v46 = 0;
          v46[1] = 0;
          *(unsigned char *)v46 = 2;
          *((unsigned char *)v46 + 1) = a2;
          *((unsigned char *)v46 + 2) = 0;
          *((unsigned char *)v46 + 3) = v26;
          *((_DWORD *)v46 + 1) = (unsigned __int16)(v33 >> 3);
          *((_DWORD *)v46 + 2) = a20;
          *((_DWORD *)v46 + 3) = v35;
          if (v33 > 0x1F)
          {
            v46[2] = 0;
            v46[3] = 0;
            *((_DWORD *)v46 + 4) = 65538;
            *((_DWORD *)v46 + 5) = a7;
            *((unsigned char *)v46 + 24) = a9;
            *((unsigned char *)v46 + 25) = 0;
            *((unsigned char *)v46 + 26) = a13;
            *((unsigned char *)v46 + 27) = a11;
            *((_DWORD *)v46 + 7) = a15;
            if (v33 > 0x2F)
            {
              int v39 = v33;
              unint64_t v40 = (unint64_t)v46 + v33;
              v46[4] = 0;
              v46[5] = 0;
              *((_DWORD *)v46 + 8) = 1245186;
              *((unsigned char *)v46 + 36) = a4;
              *((_DWORD *)v46 + 11) = a8;
              uint64_t v41 = sub_A990((_WORD *)v46 + 24, (unint64_t)v46 + v33, 5, a5, v45, 255);
              if (v41)
              {
                unint64_t v42 = sub_A990(v41, v40, 6, a6, v45, 255);
                if (v42)
                {
                  if (a11)
                  {
                    unsigned int v43 = a12;
                    unint64_t v42 = sub_C65C(v42, v40, 9, a10, a12);
                    if (!v42) {
                      goto LABEL_33;
                    }
                  }
                  else
                  {
                    unsigned int v43 = a12;
                  }
                  if ((!a13 || (unint64_t v42 = sub_C65C(v42, v40, 8, &a10[v43], a14)) != 0)
                    && (unint64_t)(v42 + 32) <= v40)
                  {
                    *(_OWORD *)unint64_t v42 = 0u;
                    *((_OWORD *)v42 + 1) = 0u;
                    *(_DWORD *)unint64_t v42 = 196612;
                    *((_DWORD *)v42 + 1) = a16;
                    *((void *)v42 + 1) = a17;
                    *((void *)v42 + 2) = a18;
                    *((void *)v42 + 3) = a19;
                    unint64_t v44 = sub_C6EC((uint64_t)(v42 + 32), v40, 4, a16, a17, a18, a19);
                    if (v44)
                    {
                      if (v44 == v40)
                      {
                        ssize_t v37 = pfkey_send(a1, v46, v39);
                        free(v46);
                        if ((v37 & 0x80000000) == 0)
                        {
                          __ipsec_errcode = 0;
                          return v37;
                        }
                        goto LABEL_57;
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_33:
        free(v46);
        goto LABEL_57;
      }
      goto LABEL_31;
    case 9:
      if (a11)
      {
        if (a13) {
          goto LABEL_36;
        }
        goto LABEL_23;
      }
LABEL_31:
      SCLog();
      int v30 = 13;
      goto LABEL_37;
    case 3:
      if (!a11) {
        goto LABEL_36;
      }
      goto LABEL_23;
  }
  SCLog();
  int v30 = 10;
LABEL_37:
  __ipsec_errcode = v30;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_add(int a1, int a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6, int a7, char a8, char *a9, int a10, unsigned int a11, int a12, unsigned int a13, int a14, int a15, unsigned int a16, int a17, unsigned int a18, int a19, unsigned int a20,int a21,int a22)
{
  return sub_AAD4(a1, 3, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t pfkey_send_delete(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_B118(a1, 4, a2, a4, a5, a6);
}

uint64_t sub_B118(int a1, char a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  if (!a4 || !a5)
  {
    SCLog();
    int v14 = 2;
LABEL_14:
    __ipsec_errcode = v14;
    return 0xFFFFFFFFLL;
  }
  int v8 = a4[1];
  if (v8 != a5[1])
  {
    SCLog();
    int v14 = 24;
    goto LABEL_14;
  }
  if (v8 == 2)
  {
    char v13 = 32;
    goto LABEL_10;
  }
  if (v8 != 30)
  {
    SCLog();
    int v14 = 15;
    goto LABEL_14;
  }
  char v13 = 0x80;
LABEL_10:
  uint64_t v15 = ((*a5 - 1) | 7) + ((*a4 - 1) | 7);
  uint64_t v16 = v15 + 50;
  size_t v17 = malloc_type_calloc(1uLL, v15 + 50, 0x25096DD7uLL);
  if (v17)
  {
    char v18 = v17;
    pid_t v19 = getpid();
    if ((int)v15 <= -35) {
      goto LABEL_24;
    }
    *char v18 = 0;
    v18[1] = 0;
    *(unsigned char *)char v18 = 2;
    *((unsigned char *)v18 + 1) = a2;
    *((unsigned char *)v18 + 2) = 0;
    *((unsigned char *)v18 + 3) = a3;
    *((_DWORD *)v18 + 1) = (unsigned __int16)(v16 >> 3);
    *((_DWORD *)v18 + 2) = 0;
    *((_DWORD *)v18 + 3) = v19;
    if ((int)v15 <= -19) {
      goto LABEL_24;
    }
    v18[2] = 0;
    v18[3] = 0;
    *((_DWORD *)v18 + 4) = 65538;
    *((_DWORD *)v18 + 5) = a6;
    v18[3] = 0;
    size_t v23 = sub_A990((_WORD *)v18 + 16, (unint64_t)v18 + v16, 5, a4, v13, 255);
    if (!v23) {
      goto LABEL_24;
    }
    long long v24 = sub_A990(v23, (unint64_t)v18 + v16, 6, a5, v13, 255);
    if (v24 && v24 == (char *)v18 + v16)
    {
      ssize_t v20 = pfkey_send(a1, v18, v16);
      free(v18);
      if ((v20 & 0x80000000) == 0)
      {
        __ipsec_errcode = 0;
        return v20;
      }
    }
    else
    {
LABEL_24:
      free(v18);
    }
  }
  else
  {
    int v22 = __error();
    strerror(*v22);
    __ipsec_set_strerror();
  }
  SCLog();
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_delete_all(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5)
{
  if (!a4 || !a5)
  {
    SCLog();
    int v11 = 2;
LABEL_14:
    __ipsec_errcode = v11;
    return 0xFFFFFFFFLL;
  }
  int v7 = a4[1];
  if (v7 != a5[1])
  {
    SCLog();
    int v11 = 24;
    goto LABEL_14;
  }
  if (v7 == 2)
  {
    char v10 = 32;
    goto LABEL_10;
  }
  if (v7 != 30)
  {
    SCLog();
    int v11 = 15;
    goto LABEL_14;
  }
  char v10 = 0x80;
LABEL_10:
  uint64_t v12 = ((*a5 - 1) | 7) + ((*a4 - 1) | 7);
  uint64_t v13 = v12 + 34;
  int v14 = malloc_type_calloc(1uLL, v12 + 34, 0x672870ACuLL);
  if (v14)
  {
    uint64_t v15 = v14;
    pid_t v16 = getpid();
    if ((int)v12 <= -19) {
      goto LABEL_12;
    }
    *uint64_t v15 = 0;
    v15[1] = 0;
    *(_WORD *)uint64_t v15 = 1026;
    *((unsigned char *)v15 + 2) = 0;
    *((unsigned char *)v15 + 3) = a2;
    *((_DWORD *)v15 + 1) = (unsigned __int16)(v13 >> 3);
    *((_DWORD *)v15 + 2) = 0;
    *((_DWORD *)v15 + 3) = v16;
    ssize_t v20 = sub_A990((_WORD *)v15 + 8, (unint64_t)v15 + v13, 5, a4, v10, 255);
    if (!v20) {
      goto LABEL_12;
    }
    char v21 = sub_A990(v20, (unint64_t)v15 + v13, 6, a5, v10, 255);
    if (v21 && v21 == (char *)v15 + v13)
    {
      ssize_t v17 = pfkey_send(a1, v15, v13);
      free(v15);
      if ((v17 & 0x80000000) == 0)
      {
        __ipsec_errcode = 0;
        return v17;
      }
    }
    else
    {
LABEL_12:
      free(v15);
    }
  }
  else
  {
    pid_t v19 = __error();
    strerror(*v19);
    __ipsec_set_strerror();
  }
  SCLog();
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_get(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_B118(a1, 5, a2, a4, a5, a6);
}

uint64_t pfkey_send_register(int a1, unsigned int a2)
{
  uint64_t v4 = 0;
  if (a2)
  {
    while (dword_17D54[v4] != a2)
    {
      if (++v4 == 3) {
        goto LABEL_12;
      }
    }
    if (v4 == 0xFFFFFFFFLL)
    {
LABEL_12:
      __ipsec_errcode = 2;
      return 0xFFFFFFFFLL;
    }
    int v7 = (void *)qword_1DD48[v4];
    if (v7)
    {
      free(v7);
      qword_1DD48[v4] = 0;
    }
  }
  else
  {
    do
    {
      int v5 = *(void **)((char *)qword_1DD48 + v4);
      if (v5)
      {
        free(v5);
        *(uint64_t *)((char *)qword_1DD48 + v4) = 0;
      }
      v4 += 8;
    }
    while (v4 != 24);
  }

  return sub_B7B0(a1, 7, a2);
}

uint64_t sub_B7B0(int a1, int a2, unsigned int a3)
{
  char v3 = a3;
  char v4 = a2;
  if (a2 == 11)
  {
    if (a3 >= 2)
    {
LABEL_11:
      SCLog();
      __ipsec_errcode = 10;
      return 0xFFFFFFFFLL;
    }
  }
  else if (a3 > 9 || ((1 << a3) & 0x20D) == 0)
  {
    goto LABEL_11;
  }
  int v6 = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0x47BAAC7BuLL);
  if (!v6)
  {
    char v10 = __error();
    strerror(*v10);
    __ipsec_set_strerror();
    goto LABEL_10;
  }
  int v7 = v6;
  pid_t v8 = getpid();
  *int v7 = 2;
  v7[1] = v4;
  v7[2] = 0;
  v7[3] = v3;
  *(void *)(v7 + 4) = 2;
  *((_DWORD *)v7 + 3) = v8;
  ssize_t v9 = pfkey_send(a1, v7, 16);
  free(v7);
  if ((v9 & 0x80000000) != 0)
  {
LABEL_10:
    SCLog();
    return 0xFFFFFFFFLL;
  }
  __ipsec_errcode = 0;
  return v9;
}

uint64_t pfkey_recv_register(int a1)
{
  pid_t v2 = getpid();
  char v3 = pfkey_recv(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  char v4 = v3;
  while (*((unsigned char *)v4 + 1) != 7 || *((_DWORD *)v4 + 3) != v2)
  {
    char v4 = pfkey_recv(a1);
    if (!v4) {
      return 0xFFFFFFFFLL;
    }
  }
  unsigned __int16 v5 = 8 * v4[2];
  v4[2] = v5;
  int v6 = pfkey_set_supported((uint64_t)v4, v5 & 0xFFF8);
  free(v4);
  if (v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  __ipsec_errcode = 0;
  return result;
}

unsigned __int16 *pfkey_recv(int a1)
{
  v10[0] = 0;
  v10[1] = 0;
  while (1)
  {
    unint64_t v2 = recv(a1, v10, 0x10uLL, 2);
    if ((v2 & 0x8000000000000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      char v3 = __error();
      strerror(*v3);
      __ipsec_set_strerror();
      return 0;
    }
  }
  if (v2 <= 0xF)
  {
    recv(a1, v10, 0x10uLL, 0);
    char v4 = 0;
    __ipsec_errcode = 27;
    return v4;
  }
  size_t v5 = 8 * WORD2(v10[0]);
  char v4 = (unsigned __int16 *)malloc_type_calloc(1uLL, v5, 0xE4862B0EuLL);
  if (!v4)
  {
    pid_t v8 = __error();
    strerror(*v8);
    __ipsec_set_strerror();
    return v4;
  }
  while (1)
  {
    ssize_t v6 = recv(a1, v4, v5, 0);
    if ((v6 & 0x8000000000000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      int v7 = __error();
      strerror(*v7);
      __ipsec_set_strerror();
      goto LABEL_16;
    }
  }
  if (v6 == v5 && v5 == 8 * v4[2])
  {
    __ipsec_errcode = 0;
    return v4;
  }
  __ipsec_errcode = 26;
LABEL_16:
  free(v4);
  return 0;
}

uint64_t pfkey_set_supported(uint64_t a1, unsigned int a2)
{
  if (*(unsigned __int16 *)(a1 + 4) == a2)
  {
    unint64_t v2 = a1 + a2;
    char v3 = (unsigned __int16 *)(a1 + 16);
    if (a2 >= 0x18)
    {
      do
      {
        uint64_t v6 = *v3;
        if (!*v3 || v2 < (unint64_t)v3 + v6) {
          break;
        }
        int v8 = v3[1];
        if ((v8 & 0xFFFE) != 0xE) {
          goto LABEL_4;
        }
        unsigned __int16 v9 = 8 * v6;
        *char v3 = v9;
        if (v8 == 14)
        {
          uint64_t v10 = 0;
        }
        else
        {
          if (v8 != 15) {
            goto LABEL_4;
          }
          uint64_t v10 = 1;
        }
        int v11 = (void *)qword_1DD48[v10];
        if (v11)
        {
          free(v11);
          unsigned __int16 v9 = *v3;
        }
        uint64_t v12 = malloc_type_malloc(v9, 0xD31EFA2FuLL);
        qword_1DD48[v10] = (uint64_t)v12;
        if (!v12)
        {
          uint64_t v13 = __error();
          strerror(*v13);
          __ipsec_set_strerror();
          return 0xFFFFFFFFLL;
        }
        memcpy(v12, v3, *v3);
        char v3 = (unsigned __int16 *)((char *)v3 + *v3);
      }
      while ((unint64_t)v3 < v2 && v2 >= (unint64_t)(v3 + 4));
    }
    if (v3 == (unsigned __int16 *)v2)
    {
      uint64_t result = 0;
      __ipsec_errcode = 0;
      return result;
    }
LABEL_4:
    int v4 = 10;
  }
  else
  {
    int v4 = 2;
  }
  __ipsec_errcode = v4;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_flush(int a1, unsigned int a2)
{
  return sub_B7B0(a1, 9, a2);
}

uint64_t pfkey_send_dump(int a1, unsigned int a2)
{
  return sub_B7B0(a1, 10, a2);
}

uint64_t pfkey_send_promisc_toggle(int a1, int a2)
{
  return sub_B7B0(a1, 11, a2 != 0);
}

ssize_t pfkey_send_spdadd(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_BCD8(a1, 14, a2, a3, a4, a5, a6, 0, 0, a7, a8, a9);
}

ssize_t sub_BCD8(int a1, char a2, unsigned __int8 *a3, unsigned int a4, unsigned __int8 *a5, unsigned int a6, char a7, unsigned int a8, uint64_t a9, void *__src, int a11, int a12)
{
  if (!a3 || !a5)
  {
    SCLog();
    int v22 = 2;
LABEL_17:
    __ipsec_errcode = v22;
    return 0xFFFFFFFFLL;
  }
  int v14 = a3[1];
  if (v14 != a5[1])
  {
    SCLog();
    int v22 = 24;
    goto LABEL_17;
  }
  char v17 = a6;
  char v18 = a4;
  if (v14 == 2)
  {
    unsigned int v21 = 32;
    goto LABEL_10;
  }
  if (v14 != 30)
  {
    SCLog();
    int v22 = 15;
    goto LABEL_17;
  }
  unsigned int v21 = 128;
LABEL_10:
  if (v21 < a4 || v21 < a6)
  {
    SCLog();
    int v22 = 16;
    goto LABEL_17;
  }
  size_t v23 = a11 + ((2 * *a3 - 2) | 0xE) + 66;
  long long v24 = malloc_type_calloc(1uLL, v23, 0x30F4C00FuLL);
  if (v24)
  {
    long long v25 = v24;
    pid_t v26 = getpid();
    if ((int)v23 <= 15) {
      goto LABEL_25;
    }
    *long long v25 = 0;
    v25[1] = 0;
    *(unsigned char *)long long v25 = 2;
    *((unsigned char *)v25 + 1) = a2;
    int v30 = (char *)v25 + v23;
    *((_WORD *)v25 + 1) = 0;
    *((_DWORD *)v25 + 1) = (unsigned __int16)(v23 >> 3);
    *((_DWORD *)v25 + 2) = a12;
    *((_DWORD *)v25 + 3) = v26;
    int v31 = sub_A990((_WORD *)v25 + 8, (unint64_t)v25 + v23, 5, a3, v18, a7);
    if (!v31) {
      goto LABEL_25;
    }
    int v32 = sub_A990(v31, (unint64_t)v25 + v23, 6, a5, v17, a7);
    if (!v32) {
      goto LABEL_25;
    }
    size_t v33 = v32;
    char v34 = v32 + 32;
    if (v34 > v30) {
      goto LABEL_25;
    }
    *(_OWORD *)size_t v33 = 0u;
    *((_OWORD *)v33 + 1) = 0u;
    *(void *)size_t v33 = 196612;
    *((void *)v33 + 1) = 0;
    *((void *)v33 + 2) = a8;
    *((void *)v33 + 3) = a9;
    if (&v34[a11] == v30)
    {
      memcpy(v34, __src, a11);
      ssize_t v27 = pfkey_send(a1, v25, v23);
      free(v25);
      if ((v27 & 0x80000000) == 0)
      {
        __ipsec_errcode = 0;
        return v27;
      }
    }
    else
    {
LABEL_25:
      free(v25);
    }
  }
  else
  {
    char v29 = __error();
    strerror(*v29);
    __ipsec_set_strerror();
  }
  SCLog();
  return 0xFFFFFFFFLL;
}

ssize_t pfkey_send_spdadd2(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_BCD8(a1, 14, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spdupdate(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_BCD8(a1, 13, a2, a3, a4, a5, a6, 0, 0, a7, a8, a9);
}

ssize_t pfkey_send_spdupdate2(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_BCD8(a1, 13, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spddelete(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_BCD8(a1, 15, a2, a3, a4, a5, a6, 0, 0, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spddelete2(int a1, int a2)
{
  return sub_C1B8(a1, 22, a2);
}

uint64_t sub_C1B8(int a1, char a2, int a3)
{
  uint64_t v6 = (char *)malloc_type_calloc(1uLL, 0x20uLL, 0xF69C0C1CuLL);
  if (!v6)
  {
    uint64_t v10 = __error();
    strerror(*v10);
    __ipsec_set_strerror();
    goto LABEL_5;
  }
  int v7 = v6;
  pid_t v8 = getpid();
  *int v7 = 2;
  v7[1] = a2;
  *((_WORD *)v7 + 1) = 0;
  *(void *)(v7 + 4) = 4;
  *((_DWORD *)v7 + 3) = v8;
  *((void *)v7 + 2) = 1179776;
  *((_DWORD *)v7 + 6) = a3;
  *((_DWORD *)v7 + 7) = 0;
  ssize_t v9 = pfkey_send(a1, v7, 32);
  free(v7);
  if ((v9 & 0x80000000) != 0)
  {
LABEL_5:
    SCLog();
    return 0xFFFFFFFFLL;
  }
  __ipsec_errcode = 0;
  return v9;
}

uint64_t pfkey_send_spdget(int a1, int a2)
{
  return sub_C1B8(a1, 16, a2);
}

ssize_t pfkey_send_spdsetidx(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_BCD8(a1, 20, a2, a3, a4, a5, a6, 0, 0, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spdflush(int a1)
{
  return sub_B7B0(a1, 19, 0);
}

uint64_t pfkey_send_spddump(int a1)
{
  return sub_B7B0(a1, 18, 0);
}

uint64_t pfkey_open()
{
  int v4 = 0x20000;
  uint64_t v0 = socket(29, 3, 2);
  if ((v0 & 0x80000000) != 0)
  {
    unint64_t v2 = __error();
    strerror(*v2);
    __ipsec_set_strerror();
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v1 = v0;
    setsockopt(v0, 0xFFFF, 4097, &v4, 4u);
    setsockopt(v1, 0xFFFF, 4098, &v4, 4u);
    __ipsec_errcode = 0;
  }
  return v1;
}

uint64_t pfkey_close(int a1)
{
  uint64_t result = close(a1);
  __ipsec_errcode = 0;
  return result;
}

uint64_t pfkey_align(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  int v4 = 2;
  if (a1 && a2)
  {
    *(void *)(a2 + 232) = 0;
    *(_OWORD *)(a2 + 216) = 0u;
    *(_OWORD *)(a2 + 200) = 0u;
    *(_OWORD *)(a2 + 184) = 0u;
    *(_OWORD *)(a2 + 168) = 0u;
    *(_OWORD *)(a2 + 152) = 0u;
    *(_OWORD *)(a2 + 136) = 0u;
    *(_OWORD *)(a2 + 120) = 0u;
    *(_OWORD *)(a2 + 104) = 0u;
    *(_OWORD *)(a2 + 88) = 0u;
    *(_OWORD *)(a2 + 72) = 0u;
    *(_OWORD *)(a2 + 56) = 0u;
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 24) = 0u;
    *(_OWORD *)(a2 + 8) = 0u;
    unint64_t v5 = *(unsigned __int16 *)(a1 + 4);
    unint64_t v6 = a1 + 8 * v5;
    *(void *)a2 = a1;
    int v7 = (unsigned __int16 *)(a1 + 16);
    if (v5 >= 3)
    {
      while (1)
      {
        pid_t v8 = &v7[4 * *v7];
        if (!*v7 || v6 < (unint64_t)v8) {
          break;
        }
        uint64_t v11 = v7[1];
        if (*(void *)(a2 + 8 * v11) || (v11 - 1) >= 0x10 && (v11 - 18) > 1)
        {
          uint64_t result = 0xFFFFFFFFLL;
          int v4 = 12;
          goto LABEL_11;
        }
        *(void *)(a2 + 8 * v11) = v7;
        BOOL v12 = (unint64_t)v8 < v6 && v6 >= (unint64_t)(v8 + 2);
        int v7 = v8;
        if (!v12) {
          goto LABEL_5;
        }
      }
    }
    pid_t v8 = v7;
LABEL_5:
    BOOL v9 = v8 == (unsigned __int16 *)v6;
    if (v8 == (unsigned __int16 *)v6) {
      int v4 = 0;
    }
    else {
      int v4 = 3;
    }
    if (v9) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = 0xFFFFFFFFLL;
    }
  }
LABEL_11:
  __ipsec_errcode = v4;
  return result;
}

uint64_t pfkey_check(uint64_t a1)
{
  if (a1 && (unint64_t v2 = *(unsigned char **)a1) != 0)
  {
    if (*v2 == 2)
    {
      unsigned int v3 = v2[1];
      if (v3 <= 0x1A)
      {
        int v6 = v2[3];
        uint64_t result = 0xFFFFFFFFLL;
        int v5 = 1;
        switch(v6)
        {
          case 0:
            char v7 = v3 - 1;
            if ((v3 - 1) >= 8u) {
              goto LABEL_17;
            }
            unsigned int v8 = 191;
            goto LABEL_14;
          case 1:
            if (v3 == 11) {
              goto LABEL_17;
            }
            goto LABEL_24;
          case 2:
          case 3:
          case 9:
            char v7 = v3 - 14;
            if (v3 - 14 < 6)
            {
              unsigned int v8 = 55;
LABEL_14:
              if ((v8 >> v7)) {
                goto LABEL_25;
              }
            }
LABEL_17:
            uint64_t v9 = *(void *)(a1 + 40);
            if (!v9) {
              goto LABEL_23;
            }
            uint64_t v10 = *(void *)(a1 + 48);
            if (!v10) {
              goto LABEL_23;
            }
            if (*(unsigned __int8 *)(v9 + 4) == *(unsigned __int8 *)(v10 + 4))
            {
              int v11 = *(unsigned __int8 *)(v9 + 9);
              if (v11 == *(unsigned __int8 *)(v10 + 9))
              {
                if (v11 == 30 || v11 == 2)
                {
LABEL_23:
                  int v5 = 0;
                  uint64_t result = 0;
                }
                else
                {
                  int v5 = 15;
                }
              }
              else
              {
                int v5 = 24;
              }
            }
            else
            {
              int v5 = 23;
            }
            break;
          case 5:
          case 6:
          case 7:
          case 8:
            break;
          default:
LABEL_24:
            uint64_t result = 0xFFFFFFFFLL;
LABEL_25:
            int v5 = 10;
            break;
        }
      }
      else
      {
        uint64_t result = 0xFFFFFFFFLL;
        int v5 = 11;
      }
    }
    else
    {
      uint64_t result = 0xFFFFFFFFLL;
      int v5 = 4;
    }
  }
  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v5 = 2;
  }
  __ipsec_errcode = v5;
  return result;
}

char *sub_C65C(_WORD *a1, unint64_t a2, __int16 a3, const void *a4, unsigned int a5)
{
  int v5 = (a5 - 1) | 7;
  uint64_t v6 = (v5 + 9);
  char v7 = (char *)a1 + v6;
  if ((unint64_t)a1 + v6 > a2) {
    return 0;
  }
  bzero(a1, (v5 + 9));
  *a1 = v6 >> 3;
  a1[1] = a3;
  a1[2] = 8 * a5;
  a1[3] = 0;
  memcpy(a1 + 4, a4, a5);
  return v7;
}

unint64_t sub_C6EC(uint64_t a1, unint64_t a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  unint64_t result = a1 + 32;
  if (result > a2) {
    return 0;
  }
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_WORD *)a1 = 4;
  *(_WORD *)(a1 + 2) = a3;
  if (a3 == 3)
  {
    *(_DWORD *)(a1 + 4) = a4;
    *(void *)(a1 + 8) = a5;
    *(void *)(a1 + 16) = a6;
    goto LABEL_8;
  }
  if (a3 == 4)
  {
    *(_DWORD *)(a1 + 4) = dword_1C9B0 * a4 / 0x64u;
    unint64_t v9 = dword_1C9B8 * a6 / 0x64uLL;
    *(void *)(a1 + 8) = dword_1C9B4 * a5 / 0x64uLL;
    *(void *)(a1 + 16) = v9;
    a7 = dword_1C9BC * a7 / 0x64;
LABEL_8:
    *(void *)(a1 + 24) = a7;
  }
  return result;
}

uint64_t makepath(const char *a1)
{
  mode_t v2 = umask(0);
  size_t v3 = (int)(strlen(a1) + 1);
  int v4 = (char *)malloc_type_malloc(v3, 0x75972EFAuLL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  memset(&v10, 0, sizeof(v10));
  strlcpy(v4, a1, v3);
  uint64_t v6 = *v5 == 47;
  while (1)
  {
    if (v5[v6])
    {
      if (v5[v6] != 47)
      {
        int v7 = 0;
        goto LABEL_13;
      }
      int v7 = 0;
      v5[v6] = 0;
    }
    else
    {
      int v7 = 1;
    }
    if (mkdir(v5, 0x1EDu) && (*__error() != 17 && *__error() != 21 || stat(v5, &v10) < 0)) {
      break;
    }
    v5[v6] = 47;
LABEL_13:
    ++v6;
    if (v7)
    {
      uint64_t v8 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v8 = 0xFFFFFFFFLL;
LABEL_17:
  free(v5);
  umask(v2);
  return v8;
}

FILE *racoon_pid()
{
  unsigned int v3 = 0;
  unint64_t result = fopen("/var/run/racoon.pid", "r");
  if (result)
  {
    uint64_t v1 = result;
    fscanf(result, "%d", &v3);
    fclose(v1);
    *(void *)uint64_t v6 = 0xE00000001;
    int v7 = 1;
    unsigned int v8 = v3;
    bzero(v4, 0x288uLL);
    size_t v2 = 648;
    if (sysctl(v6, 4u, v4, &v2, 0, 0))
    {
      return 0;
    }
    else if (v5[0] ^ 0x6F636172 | *(_DWORD *)((char *)v5 + 3) ^ 0x6E6F6F)
    {
      return 0;
    }
    else
    {
      return (FILE *)v3;
    }
  }
  return result;
}

void IPSecConfigureVerboseLogging(__CFDictionary *a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, @"VerboseLogging", v3);
  CFRelease(v3);
}

uint64_t IPSecApplyConfiguration(const void *a1, const char **a2)
{
  return sub_CA60(a1, a2, 1);
}

uint64_t sub_CA60(const void *a1, const char **a2, int a3)
{
  __str[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (!isDictionary(a1))
  {
    *a2 = "IPSec dictionary not present";
    return 0xFFFFFFFFLL;
  }
  memset(&v74, 0, sizeof(v74));
  int v73 = 0;
  GetIntFromDict((const __CFDictionary *)a1, @"VerboseLogging", &v73, 0);
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"LocalAddress", cStr, 256))
  {
    BOOL v12 = "incorrect local address found";
LABEL_19:
    *a2 = v12;
    goto LABEL_20;
  }
  if (!racoon_validate_cfg_str(cStr))
  {
    BOOL v12 = "invalid local address";
    goto LABEL_19;
  }
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v77, 256))
  {
    BOOL v12 = "incorrect remote address found";
    goto LABEL_19;
  }
  if (!racoon_validate_cfg_str(v77))
  {
    BOOL v12 = "invalid remote address";
    goto LABEL_19;
  }
  in_addr_t v7 = inet_addr(v77);
  in_addr_t v8 = v7;
  if (a3)
  {
    if (v7) {
      unint64_t v9 = v77;
    }
    else {
      unint64_t v9 = "anonymous";
    }
    stat v10 = __str;
    snprintf((char *)__str, 0x100uLL, "/var/run/racoon/%s.conf", v9);
    remove(__str, v11);
    if (stat("/var/run/racoon", &v74))
    {
      if (*__error() == 2 && makepath("/var/run/racoon"))
      {
        __error();
        snprintf(v79, 0x100uLL, "cannot create racoon configuration file path (error %d)");
LABEL_55:
        *a2 = v79;
        goto LABEL_20;
      }
      stat v10 = __str;
    }
  }
  else
  {
    stat v10 = (std::__fs::filesystem::path *)"/dev/null";
  }
  mode_t v14 = umask(0x3Fu);
  uint64_t v15 = fopen((const char *)v10, "w");
  umask(v14);
  if (!v15)
  {
    __error();
    snprintf(v79, 0x100uLL, "cannot create racoon configuration file (error %d)");
    goto LABEL_55;
  }
  if (v73)
  {
    fprintf(v15, "%s%s", (const char *)TAB_LEVEL, "log debug2;\n");
    fprintf(v15, "%s%s", (const char *)TAB_LEVEL, "path logfile \"/var/log/racoon.log\";\n\n");
  }
  BOOL v17 = CFDictionaryGetValue((CFDictionaryRef)a1, @"UseAnonymousPolicy") == 0 && v8 != 0;
  BOOL v16 = !v17;
  BOOL v64 = v17;
  char v18 = v77;
  if (v16) {
    char v18 = "anonymous";
  }
  snprintf(v79, 0x100uLL, "remote %s {\n", v18);
  fprintf(v15, "%s%s", (const char *)TAB_LEVEL, v79);
  fprintf(v15, "%s%s", off_1C9C8, "doi ipsec_doi;\n");
  v70 = v15;
  fprintf(v15, "%s%s", off_1C9C8, "situation identity_only;\n");
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationMethod");
  if (Value) {
    CFStringRef v20 = Value;
  }
  else {
    CFStringRef v20 = @"SharedSecret";
  }
  __strlcpy_chk();
  unsigned int v21 = CFDictionaryGetValue((CFDictionaryRef)a1, @"ExchangeMode");
  CFStringRef cf1 = v20;
  if (!isArray(v21)) {
    goto LABEL_48;
  }
  v66 = a2;
  CFIndex Count = CFArrayGetCount((CFArrayRef)v21);
  unint64_t v23 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v24 = 0;
    if (v23 >= 2) {
      unint64_t v23 = 2;
    }
    unint64_t v25 = v23 + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v21, v24);
      if (isString(ValueAtIndex))
      {
        if (v24) {
          __strlcat_chk();
        }
        if (!CFEqual(ValueAtIndex, @"Main")
          && !CFEqual(ValueAtIndex, @"Aggressive")
          && !CFEqual(ValueAtIndex, @"Base"))
        {
          v36 = "incorrect phase 1 exchange mode";
          goto LABEL_87;
        }
        __strlcat_chk();
      }
    }
    while (v25 != ++v24);
  }
  a2 = v66;
  if (!Count)
  {
LABEL_48:
    int StrFromDict = GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifier", v83, 256, (const char *)&unk_14F99);
    IPSecIsAggressiveMode(v20, StrFromDict, 1);
    __strlcat_chk();
  }
  __strlcat_chk();
  long long v28 = v15;
  fprintf(v15, "%s%s", off_1C9C8, __ptr);
  if (!CFEqual(v20, @"SharedSecret") && !CFEqual(v20, @"Certificate") && !CFEqual(v20, @"Hybrid"))
  {
    size_t v33 = "incorrect authentication method found";
    goto LABEL_232;
  }
  if (GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifierType", v82, 256, (const char *)&unk_14F99))
  {
    __strlcpy_chk();
    if (!racoon_validate_cfg_str(v82))
    {
      size_t v33 = "invalid LocalIdentifierType";
      goto LABEL_232;
    }
  }
  if (GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifier", v83, 256, (const char *)&unk_14F99))
  {
    if (!racoon_validate_cfg_str(v83))
    {
      size_t v33 = "invalid LocalIdentifier";
      goto LABEL_232;
    }
    char v29 = v82;
    if (!v82[0]) {
      char v29 = "fqdn";
    }
    snprintf(__ptr, 0x400uLL, "my_identifier %s \"%s\";\n", v29, v83);
    goto LABEL_62;
  }
  if (!CFEqual(v20, @"SharedSecret") && !CFEqual(v20, @"Hybrid") && CFEqual(v20, @"Certificate"))
  {
    strcpy(__ptr, "my_identifier asn1dn;\n");
LABEL_62:
    fprintf(v15, "%s%s", off_1C9C8, __ptr);
  }
  CFStringRef v30 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"IdentifierVerification");
  if (!isString(v30)) {
    CFStringRef v30 = @"GenerateFromRemoteAddress";
  }
  if (!CFEqual(v30, @"None"))
  {
    if (CFEqual(v30, @"GenerateFromRemoteAddress"))
    {
      if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v83, 256))
      {
        size_t v33 = "no remote address found";
        goto LABEL_150;
      }
      snprintf(__ptr, 0x400uLL, "peers_identifier address \"%s\";\n", v83);
      long long v28 = v15;
      fprintf(v15, "%s%s", off_1C9C8, __ptr);
      int v34 = CFEqual(v20, @"Certificate");
      pid_t v35 = "off";
      if (!v34) {
        pid_t v35 = "on";
      }
      int v31 = 2 * (v34 != 0);
      goto LABEL_93;
    }
    if (CFEqual(v30, @"UseRemoteIdentifier"))
    {
      long long v28 = v15;
      if (!GetStrFromDict((const __CFDictionary *)a1, @"RemoteIdentifier", v83, 256, (const char *)&unk_14F99))
      {
        size_t v33 = "no remote identifier found";
        goto LABEL_232;
      }
      if (!racoon_validate_cfg_str(v83))
      {
        size_t v33 = "invalid RemoteIdentifier";
        goto LABEL_232;
      }
      snprintf(__ptr, 0x400uLL, "peers_identifier fqdn \"%s\";\n", v83);
      fprintf(v15, "%s%s", off_1C9C8, __ptr);
      if (!CFEqual(v20, @"Certificate") && !CFEqual(v20, @"Hybrid"))
      {
        int v31 = 0;
        pid_t v35 = "on";
        goto LABEL_93;
      }
      int v31 = 2;
    }
    else
    {
      if (!CFEqual(v30, @"UseOpenDirectory"))
      {
        size_t v33 = "incorrect verification method";
        goto LABEL_150;
      }
      long long v28 = v15;
      if (!CFEqual(v20, @"Certificate"))
      {
        size_t v33 = "open directory can only be used with certificate authentication";
        goto LABEL_232;
      }
      int v31 = 1;
    }
    pid_t v35 = "off";
LABEL_93:
    int v32 = __ptr;
    snprintf(__ptr, 0x400uLL, "verify_identifier %s;\n", v35);
    goto LABEL_94;
  }
  int v31 = 0;
  int v32 = "verify_identifier off;\n";
  long long v28 = v70;
LABEL_94:
  fprintf(v28, "%s%s", off_1C9C8, v32);
  if (CFEqual(cf1, @"SharedSecret") || CFEqual(cf1, @"Hybrid"))
  {
    if (!GetStrFromDict((const __CFDictionary *)a1, @"SharedSecret", v83, 256, (const char *)&unk_14F99))
    {
      size_t v33 = "no shared secret found";
      goto LABEL_232;
    }
    if (!racoon_validate_cfg_str(v83))
    {
      size_t v33 = "invalid SharedSecret";
      goto LABEL_232;
    }
    __strlcpy_chk();
    ssize_t v37 = CFDictionaryGetValue((CFDictionaryRef)a1, @"SharedSecretEncryption");
    if (!isString(v37))
    {
LABEL_108:
      snprintf(__ptr, 0x400uLL, "shared_secret %s \"%s\";\n", v82, v83);
      long long v28 = v70;
      fprintf(v70, "%s%s", off_1C9C8, __ptr);
      if (CFEqual(cf1, @"Hybrid"))
      {
        strcpy(__ptr, "certificate_verification sec_framework use_peers_identifier;\n");
LABEL_117:
        fprintf(v28, "%s%s", off_1C9C8, __ptr);
        goto LABEL_118;
      }
      goto LABEL_118;
    }
    if (CFEqual(v37, @"Key") || CFEqual(v37, @"Keychain"))
    {
      __strlcpy_chk();
      goto LABEL_108;
    }
    size_t v33 = "incorrect shared secret encryption found";
LABEL_150:
    long long v28 = v70;
    goto LABEL_232;
  }
  if (CFEqual(cf1, @"Certificate"))
  {
    CFDataRef v38 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"LocalCertificate");
    if (isData(v38))
    {
      fprintf(v70, "%s%s", off_1C9C8, "certificate_type x509 in_keychain \"");
      CFDataRef v39 = v38;
      long long v28 = v70;
      int v40 = sub_12FD4(v39, (uint64_t)__ptr);
      fwrite(__ptr, 1uLL, v40, v70);
      fputs("\";\n", v70);
    }
    else
    {
      long long v28 = v70;
      fprintf(v70, "%s%s", off_1C9C8, "certificate_type x509 in_keychain;\n");
    }
    fprintf(v28, "%s%s", off_1C9C8, "verify_cert on;\n");
    uint64_t v41 = " use_peers_identifier";
    if (v31 != 2) {
      uint64_t v41 = (const char *)&unk_14F99;
    }
    if (v31 == 1) {
      uint64_t v41 = " use_open_dir";
    }
    snprintf(__ptr, 0x400uLL, "certificate_verification sec_framework%s;\n", v41);
    goto LABEL_117;
  }
LABEL_118:
  if (CFDictionaryContainsKey((CFDictionaryRef)a1, @"ForceLocalAddress")
    && CFDictionaryGetValue((CFDictionaryRef)a1, @"ForceLocalAddress") == kCFBooleanTrue)
  {
    GetStrAddrFromDict((const __CFDictionary *)a1, @"LocalAddress", v83, 256);
    if (racoon_validate_cfg_str(v83))
    {
      snprintf(__ptr, 0x400uLL, "local_address %s;\n", v83);
      fprintf(v28, "%s%s", off_1C9C8, __ptr);
      goto LABEL_122;
    }
    size_t v33 = "invalid force local address";
LABEL_232:
    *a2 = v33;
    goto LABEL_233;
  }
LABEL_122:
  *(_DWORD *)v83 = 0;
  GetIntFromDict((const __CFDictionary *)a1, @"NonceSize", v83, 16);
  snprintf(__ptr, 0x400uLL, "nonce_size %d;\n", *(_DWORD *)v83);
  fprintf(v28, "%s%s", off_1C9C8, __ptr);
  *(_DWORD *)v83 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"NattMultipleUsersEnabled", v83, 0))
  {
    if (*(_DWORD *)v83) {
      unint64_t v42 = "on";
    }
    else {
      unint64_t v42 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_multi_user %s;\n", v42);
    fprintf(v28, "%s%s", off_1C9C8, __ptr);
  }
  *(_DWORD *)v83 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"NattKeepAliveEnabled", v83, 1))
  {
    if (*(_DWORD *)v83) {
      unsigned int v43 = "on";
    }
    else {
      unsigned int v43 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_keepalive %s;\n", v43);
    fprintf(v28, "%s%s", off_1C9C8, __ptr);
  }
  *(_DWORD *)v83 = 0;
  *(_DWORD *)v82 = 0;
  uint64_t v76 = 0;
  int v75 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionEnabled", v83, 0))
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionDelay", v82, 30);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionRetry", (_DWORD *)&v76 + 1, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionMaxFail", &v76, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"BlackHoleDetectionEnabled", &v75, 1);
    snprintf(__ptr, 0x400uLL, "dpd_delay %d;\n", *(_DWORD *)v82);
    fprintf(v28, "%s%s", off_1C9C8, __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_retry %d;\n", HIDWORD(v76));
    fprintf(v28, "%s%s", off_1C9C8, __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_maxfail %d;\n", v76);
    fprintf(v28, "%s%s", off_1C9C8, __ptr);
    if (v75) {
      unint64_t v44 = "dpd_blackhole_detect";
    }
    else {
      unint64_t v44 = "dpd_inbound_detect";
    }
    snprintf(__ptr, 0x400uLL, "dpd_algorithm %s;\n", v44);
    fprintf(v28, "%s%s", off_1C9C8, __ptr);
  }
  *(_DWORD *)v83 = 0;
  *(_DWORD *)v82 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdle", v83, 0) && *(_DWORD *)v83)
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdleTimer", v82, 120);
    snprintf(__ptr, 0x400uLL, "disconnect_on_idle idle_timeout %d idle_direction idle_outbound;\n", *(_DWORD *)v82);
    fprintf(v28, "%s%s", off_1C9C8, __ptr);
  }
  fprintf(v28, "%s%s", off_1C9C8, "initial_contact on;\n");
  fprintf(v28, "%s%s", off_1C9C8, "support_proxy on;\n");
  __strlcpy_chk();
  char v45 = CFDictionaryGetValue((CFDictionaryRef)a1, @"ProposalsBehavior");
  if (isString(v45))
  {
    if (!CFEqual(v45, @"Claim")
      && !CFEqual(v45, @"Obey")
      && !CFEqual(v45, @"Strict")
      && !CFEqual(v45, @"Exact"))
    {
      *a2 = "incorrect proposal behavior";
      goto LABEL_88;
    }
    __strlcpy_chk();
  }
  snprintf(__ptr, 0x400uLL, "proposal_check %s;\n", v83);
  long long v28 = v70;
  fprintf(v70, "%s%s", off_1C9C8, __ptr);
  if (!GetStrFromDict((const __CFDictionary *)a1, @"XAuthName", v83, 256, (const char *)&unk_14F99)) {
    goto LABEL_157;
  }
  if (!racoon_validate_cfg_str(v83))
  {
    size_t v33 = "invalid XauthName";
    goto LABEL_232;
  }
  snprintf(__ptr, 0x400uLL, "xauth_login \"%s\";\n", v83);
  fprintf(v70, "%s%s", off_1C9C8, __ptr);
LABEL_157:
  *(_DWORD *)v83 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"ModeConfigEnabled", v83, 0))
  {
    if (*(_DWORD *)v83) {
      v46 = "on";
    }
    else {
      v46 = "off";
    }
    snprintf(__ptr, 0x400uLL, "mode_cfg %s;\n", v46);
    fprintf(v70, "%s%s", off_1C9C8, __ptr);
  }
  CFArrayRef v47 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Proposals");
  v66 = a2;
  CFArrayRef theArray = v47;
  int v65 = a3;
  if (isArray(v47)) {
    CFIndex v48 = CFArrayGetCount(v47);
  }
  else {
    CFIndex v48 = 0;
  }
  CFIndex v49 = 0;
  v50 = 0;
  if (v48 <= 1) {
    uint64_t v51 = 1;
  }
  else {
    uint64_t v51 = v48;
  }
  CFTypeRef cf1a = (CFTypeRef)v51;
  do
  {
    if (v48)
    {
      v50 = CFArrayGetValueAtIndex(theArray, v49);
      if (!isDictionary(v50))
      {
        *v66 = "incorrect phase 1 proposal";
        goto LABEL_233;
      }
    }
    fprintf(v28, "%s%s", off_1C9C8, "\n");
    fprintf(v28, "%s%s", off_1C9C8, "proposal {\n");
    HIDWORD(v76) = 0;
    v52 = CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationMethod");
    GetIntFromDict((const __CFDictionary *)a1, @"XAuthEnabled", (_DWORD *)&v76 + 1, 0);
    __strlcpy_chk();
    if (isString(v52))
    {
      if (!CFEqual(v52, @"SharedSecret") && !CFEqual(v52, @"Certificate") && !CFEqual(v52, @"Hybrid"))
      {
        v36 = "incorrect authentication method";
        goto LABEL_87;
      }
      __strlcpy_chk();
    }
    snprintf(v83, 0x400uLL, "authentication_method %s;\n", v82);
    fprintf(v70, "%s%s", off_1C9D0, v83);
    __strlcpy_chk();
    if (!v50)
    {
      snprintf(v83, 0x400uLL, "hash_algorithm %s;\n", v82);
      fprintf(v70, "%s%s", off_1C9D0, v83);
LABEL_190:
      __strlcpy_chk();
      goto LABEL_191;
    }
    v53 = CFDictionaryGetValue((CFDictionaryRef)v50, @"HashAlgorithm");
    if (isString(v53))
    {
      if (!CFEqual(v53, @"MD5")
        && !CFEqual(v53, @"SHA1")
        && !CFEqual(v53, @"SHA256")
        && !CFEqual(v53, @"SHA512"))
      {
        v36 = "incorrect authentication algorithm";
        goto LABEL_87;
      }
      __strlcpy_chk();
    }
    snprintf(v83, 0x400uLL, "hash_algorithm %s;\n", v82);
    fprintf(v70, "%s%s", off_1C9D0, v83);
    __strlcpy_chk();
    v54 = CFDictionaryGetValue((CFDictionaryRef)v50, @"EncryptionAlgorithm");
    if (isString(v54))
    {
      if (!CFEqual(v54, @"DES")
        && !CFEqual(v54, @"3DES")
        && !CFEqual(v54, @"AES")
        && !CFEqual(v54, @"AES256"))
      {
        v36 = "incorrect encryption algorithm";
LABEL_87:
        *v66 = v36;
LABEL_88:
        long long v28 = v70;
        goto LABEL_233;
      }
      goto LABEL_190;
    }
LABEL_191:
    snprintf(v83, 0x400uLL, "encryption_algorithm %s;\n", v82);
    long long v28 = v70;
    fprintf(v70, "%s%s", off_1C9D0, v83);
    *(_DWORD *)v82 = 3600;
    if (v50)
    {
      GetIntFromDict((const __CFDictionary *)v50, @"Lifetime", v82, 3600);
      snprintf(v83, 0x400uLL, "lifetime time %d sec;\n", *(_DWORD *)v82);
      fprintf(v70, "%s%s", off_1C9D0, v83);
      *(_DWORD *)v82 = 14;
      GetIntFromDict((const __CFDictionary *)v50, @"DHGroup", v82, 14);
      int v55 = *(_DWORD *)v82;
    }
    else
    {
      snprintf(v83, 0x400uLL, "lifetime time %d sec;\n", 3600);
      fprintf(v70, "%s%s", off_1C9D0, v83);
      int v55 = 14;
      *(_DWORD *)v82 = 14;
    }
    snprintf(v83, 0x400uLL, "dh_group %d;\n", v55);
    fprintf(v70, "%s%s", off_1C9D0, v83);
    fprintf(v70, "%s%s", off_1C9C8, "}\n");
    ++v49;
  }
  while (cf1a != (CFTypeRef)v49);
  fprintf(v70, "%s%s", (const char *)TAB_LEVEL, "}\n\n");
  v56 = CFDictionaryGetValue((CFDictionaryRef)a1, @"Policies");
  if (!isArray(v56)
    || (CFIndex v57 = CFArrayGetCount((CFArrayRef)v56)) == 0
    || (!v64 ? (uint64_t v58 = 1) : (uint64_t v58 = v57), v58 < 1))
  {
LABEL_227:
    fclose(v28);
    if (v65) {
      sub_E798();
    }
    return 0;
  }
  CFIndex v59 = 0;
  v60 = "incorrect policy found";
  while (2)
  {
    uint64_t v76 = 0;
    int v75 = 0;
    int v71 = 0;
    int v72 = 0;
    CFDictionaryRef v61 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v56, v59);
    if (isDictionary(v61))
    {
      v62 = CFDictionaryGetValue(v61, @"Level");
      if (!isString(v62) || CFEqual(v62, @"None") || CFEqual(v62, @"Discard")) {
        goto LABEL_223;
      }
      if (!CFEqual(v62, @"Require"))
      {
        v60 = "incorrect policy level found";
LABEL_246:
        long long v28 = v70;
        break;
      }
      if (v64)
      {
        v63 = CFDictionaryGetValue(v61, @"Mode");
        if (!isString(v63) || CFEqual(v63, @"Tunnel"))
        {
          if (!GetStrNetFromDict(v61, @"LocalAddress", __ptr, 256))
          {
            v60 = "incorrect policy local network";
            goto LABEL_246;
          }
          long long v28 = v70;
          if (!racoon_validate_cfg_str(__ptr))
          {
            v60 = "invalid local network";
            break;
          }
          if (!GetStrNetFromDict(v61, @"RemoteAddress", v82, 256))
          {
            v60 = "incorrect policy remote network";
            break;
          }
          if (!racoon_validate_cfg_str(v82))
          {
            v60 = "invalid remote network";
            break;
          }
          GetIntFromDict(v61, @"LocalPrefix", &v75, 24);
          if (!v75)
          {
            v60 = "incorrect policy local prefix";
            break;
          }
          GetIntFromDict(v61, @"RemotePrefix", &v72, 24);
          if (!v72)
          {
            v60 = "incorrect policy remote prefix";
            break;
          }
          snprintf(v79, 0x100uLL, "sainfo address %s/%d 0 address %s/%d 0 {\n", __ptr, v75, v82, v72);
          snprintf(v83, 0x100uLL, "sainfo address %s/%d 0 address %s/%d 0 {\n", v82, v72, __ptr, v75);
LABEL_219:
          fprintf(v28, "%s%s", (const char *)TAB_LEVEL, v79);
          if (sub_12A30(v28, v61, v66)) {
            goto LABEL_233;
          }
          fprintf(v28, "%s%s", (const char *)TAB_LEVEL, "}\n\n");
          if (v64)
          {
            long long v28 = v70;
            fprintf(v70, "%s%s", (const char *)TAB_LEVEL, v83);
            if (sub_12A30(v70, v61, v66)) {
              goto LABEL_233;
            }
            fprintf(v70, "%s%s", (const char *)TAB_LEVEL, "}\n\n");
          }
LABEL_223:
          ++v59;
          long long v28 = v70;
          if (v58 == v59) {
            goto LABEL_227;
          }
          continue;
        }
        if (!CFEqual(v63, @"Transport"))
        {
          v60 = "incorrect policy type found";
          goto LABEL_246;
        }
        GetIntFromDict(v61, @"LocalPort", (_DWORD *)&v76 + 1, 0);
        GetIntFromDict(v61, @"RemotePort", &v76, 0);
        GetIntFromDict(v61, @"Protocol", &v71, 0);
        GetIntFromDict(v61, @"LocalPrefix", &v75, 32);
        GetIntFromDict(v61, @"RemotePrefix", &v72, 32);
        snprintf(v79, 0x100uLL, "sainfo address %s/%d [%d] %d address %s/%d [%d] %d {\n", cStr, v75, HIDWORD(v76), v71, v77, v72, v76, v71);
        snprintf(v83, 0x100uLL, "sainfo address %s/%d [%d] %d address %s/%d [%d] %d {\n", v77, v72, v76, v71, cStr, v75, HIDWORD(v76), v71);
      }
      else
      {
        strcpy(v79, "sainfo anonymous {\n");
      }
      long long v28 = v70;
      goto LABEL_219;
    }
    break;
  }
  *v66 = v60;
LABEL_233:
  fclose(v28);
LABEL_20:
  if (__str[0].__pn_.__r_.__value_.__s.__data_[0]) {
    remove(__str, v6);
  }
  return 0xFFFFFFFFLL;
}

uint64_t IPSecValidateConfiguration(const void *a1, const char **a2)
{
  return sub_CA60(a1, a2, 0);
}

uint64_t IPSecRemoveConfiguration(const void *a1, const char **a2)
{
  __str[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (!isDictionary(a1))
  {
    uint64_t v6 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v6;
    return 0xFFFFFFFFLL;
  }
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v7, 32))
  {
    uint64_t v6 = "incorrect remote address found";
    goto LABEL_7;
  }
  uint64_t result = inet_addr(v7);
  if (result)
  {
    snprintf((char *)__str, 0x100uLL, "/var/run/racoon/%s.conf", v7);
    remove(__str, v5);
    sub_E798();
    return 0;
  }
  return result;
}

FILE *sub_E798()
{
  uint64_t result = racoon_pid();
  if (result)
  {
    return (FILE *)kill((pid_t)result, 30);
  }
  return result;
}

uint64_t IPSecRemoveConfigurationFile(const void *a1, const char **a2)
{
  __str[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (!isDictionary(a1))
  {
    uint64_t v6 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v6;
    return 0xFFFFFFFFLL;
  }
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v7, 32))
  {
    uint64_t v6 = "incorrect remote address found";
    goto LABEL_7;
  }
  uint64_t result = inet_addr(v7);
  if (result)
  {
    snprintf((char *)__str, 0x100uLL, "/var/run/racoon/%s.conf", v7);
    remove(__str, v5);
    return 0;
  }
  return result;
}

uint64_t IPSecKickConfiguration()
{
  return 0;
}

const void *IPSecCountPolicies(const __CFDictionary *a1)
{
  CFStringRef Value = CFDictionaryGetValue(a1, @"Policies");
  uint64_t result = isArray(Value);
  if (result) {
    return (const void *)CFArrayGetCount((CFArrayRef)Value);
  }
  return result;
}

BOOL get_address_from_string(const char *a1, void *a2, size_t a3)
{
  BOOL v3 = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t v13 = 0;
      int v6 = getaddrinfo(a1, 0, &stru_17D90, &v13);
      BOOL v3 = v6 == 0;
      if (!v6)
      {
        in_addr_t v7 = v13;
        if (v13)
        {
          in_addr_t v8 = v13;
          while (1)
          {
            ai_addr = v8->ai_addr;
            int sa_family = ai_addr->sa_family;
            if (sa_family == 30 || sa_family == 2) {
              break;
            }
            in_addr_t v8 = v8->ai_next;
            if (!v8) {
              goto LABEL_14;
            }
          }
          if (ai_addr->sa_len <= a3)
          {
            bzero(a2, a3);
            memcpy(a2, v8->ai_addr, v8->ai_addr->sa_len);
          }
        }
LABEL_14:
        freeaddrinfo(v7);
      }
    }
  }
  return v3;
}

uint64_t IPSecInstallPolicies(const __CFDictionary *a1, CFIndex a2, const char **a3)
{
  socklen_t v50 = 4;
  int v51 = 0;
  uint64_t v49 = 0;
  int v48 = 255;
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, sizeof(v52));
  int v6 = pfkey_open();
  if (v6 < 0)
  {
    unint64_t v9 = "cannot open a pfkey socket";
    goto LABEL_76;
  }
  if (!GetStrAddrFromDict(a1, @"LocalAddress", v56, 256))
  {
    unint64_t v9 = "incorrect local address";
    goto LABEL_76;
  }
  if (!GetStrAddrFromDict(a1, @"RemoteAddress", v55, 256))
  {
    unint64_t v9 = "incorrect remote address";
    goto LABEL_76;
  }
  CFStringRef Value = CFDictionaryGetValue(a1, @"Policies");
  if (!isArray(Value))
  {
    unint64_t v9 = "no policies found";
    goto LABEL_76;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  unint64_t v9 = "no policies found";
  if (!Count || Count < a2)
  {
LABEL_76:
    *a3 = v9;
LABEL_77:
    SCLog();
    goto LABEL_78;
  }
  CFIndex v10 = a2 + 1;
  if (a2 == -1) {
    CFIndex v11 = 0;
  }
  else {
    CFIndex v11 = a2;
  }
  if (a2 == -1) {
    CFIndex v10 = Count;
  }
  CFIndex v42 = v10;
  CFIndex idx = v11;
  if (v11 >= v10)
  {
LABEL_81:
    SCLog();
    uint64_t v36 = 0;
    goto LABEL_79;
  }
  int v40 = a3;
  uint64_t v41 = Value;
  int v12 = 0;
  int v13 = 0;
  int v14 = 0;
  while (1)
  {
    int v44 = v12;
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, idx);
    if (!isDictionary(ValueAtIndex))
    {
      CFDataRef v38 = "incorrect policy found";
LABEL_84:
      *int v40 = v38;
      goto LABEL_77;
    }
    BOOL v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
    if (isString(v16) && !CFEqual(v16, @"Tunnel"))
    {
      if (!CFEqual(v16, @"Transport"))
      {
        CFDataRef v38 = "incorrect policy type found";
        goto LABEL_84;
      }
      char v45 = 1;
    }
    else
    {
      char v45 = 0;
    }
    BOOL v17 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
    if (!isString(v17)) {
      goto LABEL_26;
    }
    if (CFEqual(v17, @"In"))
    {
      char v18 = 0;
      char v19 = 1;
    }
    else
    {
      if (!CFEqual(v17, @"Out"))
      {
        if (!CFEqual(v17, @"InOut"))
        {
          CFDataRef v38 = "incorrect policy direction found";
          goto LABEL_84;
        }
LABEL_26:
        char v18 = 0;
        char v19 = 0;
        goto LABEL_27;
      }
      char v19 = 0;
      char v18 = 1;
    }
LABEL_27:
    CFStringRef v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
    if (!isString(v20) || CFEqual(v20, @"None"))
    {
      strcpy(__str, "out none");
      uint64_t v21 = 0x656E6F6E206E69;
LABEL_30:
      *(void *)__s = v21;
      goto LABEL_31;
    }
    if (CFEqual(v20, @"Unique"))
    {
      if (v45)
      {
        strcpy(__str, "out ipsec esp/transport//unique");
        strcpy(__s, "in ipsec esp/transport//unique");
      }
      else
      {
        snprintf(__str, 0x200uLL, "out ipsec esp/tunnel/%s-%s/unique", v56, v55);
        snprintf(__s, 0x200uLL, "in ipsec esp/tunnel/%s-%s/unique");
      }
    }
    else
    {
      if (!CFEqual(v20, @"Require"))
      {
        if (!CFEqual(v20, @"Discard"))
        {
          CFDataRef v38 = "incorrect policy level";
          goto LABEL_84;
        }
        strcpy(__str, "out discard");
        strcpy(&__s[7], "ard");
        uint64_t v21 = *(void *)"in discard";
        goto LABEL_30;
      }
      if (v45)
      {
        strcpy(__str, "out ipsec esp/transport//require");
        strcpy(__s, "in ipsec esp/transport//require");
      }
      else
      {
        snprintf(__str, 0x200uLL, "out ipsec esp/tunnel/%s-%s/require", v56, v55);
        snprintf(__s, 0x200uLL, "in ipsec esp/tunnel/%s-%s/require");
      }
    }
LABEL_31:
    int v22 = strlen(__s);
    caddr_t v23 = ipsec_set_policy(__s, v22);
    if (!v23)
    {
      CFDataRef v38 = "cannot set policy in";
      goto LABEL_84;
    }
    CFIndex v24 = (unsigned __int16 *)v23;
    int v25 = strlen(__str);
    caddr_t v26 = ipsec_set_policy(__str, v25);
    caddr_t v27 = v26;
    if (!v26) {
      break;
    }
    int v43 = *v24;
    int v28 = *(unsigned __int16 *)v26;
    if (v45)
    {
      int v47 = 0;
      if (!get_address_from_string(v56, v53, 0x80uLL))
      {
        CFDataRef v39 = "incorrect local address";
        goto LABEL_94;
      }
      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v47, 0);
      HIWORD(v53[0]) = bswap32((unsigned __int16)v47) >> 16;
      if (BYTE1(v53[0]) == 2) {
        int v29 = 32 * (v53[1] != 0);
      }
      else {
        int v29 = 128;
      }
      HIDWORD(v49) = v29;
      if (!get_address_from_string(v55, v52, 0x80uLL))
      {
        CFDataRef v39 = "incorrect remote address";
        goto LABEL_94;
      }
      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v47, 0);
      WORD1(v52[0]) = bswap32((unsigned __int16)v47) >> 16;
      if (BYTE1(v52[0]) == 2) {
        int v30 = 32 * (DWORD1(v52[0]) != 0);
      }
      else {
        int v30 = 128;
      }
      LODWORD(v49) = v30;
      int v31 = &v48;
      CFDictionaryRef v32 = (const __CFDictionary *)ValueAtIndex;
      CFStringRef v33 = @"Protocol";
      int v34 = 0;
    }
    else
    {
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v54, 256))
      {
        CFDataRef v39 = "incorrect local network (0)";
        goto LABEL_94;
      }
      if (!get_address_from_string(v54, v53, 0x80uLL))
      {
        CFDataRef v39 = "incorrect local network (1)";
        goto LABEL_94;
      }
      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", (_DWORD *)&v49 + 1, 24);
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v54, 256))
      {
        CFDataRef v39 = "incorrect remote network (0)";
        goto LABEL_94;
      }
      if (!get_address_from_string(v54, v52, 0x80uLL))
      {
        CFDataRef v39 = "incorrect remote network (1)";
        goto LABEL_94;
      }
      int v31 = (int *)&v49;
      CFDictionaryRef v32 = (const __CFDictionary *)ValueAtIndex;
      CFStringRef v33 = @"RemotePrefix";
      int v34 = 24;
    }
    GetIntFromDict(v32, v33, v31, v34);
    int v12 = v44;
    if ((v19 & 1) == 0)
    {
      ++v14;
      if ((pfkey_send_spdadd(v6, (unsigned __int8 *)v53, HIDWORD(v49), (unsigned __int8 *)v52, v49, v48, v27, 8 * v28, v44) & 0x80000000) != 0)
      {
        CFDataRef v39 = "cannot add policy out";
        goto LABEL_94;
      }
      int v12 = v44 + 1;
    }
    CFStringRef Value = v41;
    if ((v18 & 1) == 0)
    {
      ++v14;
      if ((pfkey_send_spdadd(v6, (unsigned __int8 *)v52, v49, (unsigned __int8 *)v53, HIDWORD(v49), v48, v24, 8 * v43, v12) & 0x80000000) != 0)
      {
        CFDataRef v39 = "cannot add policy in";
        goto LABEL_94;
      }
      ++v12;
    }
    if ((getsockopt(v6, 0xFFFF, 4128, &v51, &v50) & 0x80000000) == 0 && v51 >= 1)
    {
      do
      {
        pid_t v35 = pfkey_recv(v6);
        if (v35)
        {
          ++v13;
          free(v35);
        }
      }
      while ((getsockopt(v6, 0xFFFF, 4128, &v51, &v50) & 0x80000000) == 0 && v51 > 0);
    }
    free(v24);
    free(v27);
    if (++idx == v42) {
      goto LABEL_81;
    }
  }
  CFDataRef v39 = "cannot set policy out";
LABEL_94:
  *int v40 = v39;
  SCLog();
  free(v24);
  if (v27) {
    free(v27);
  }
LABEL_78:
  uint64_t v36 = 0xFFFFFFFFLL;
  if (v6 != -1) {
LABEL_79:
  }
    pfkey_close(v6);
  return v36;
}

uint64_t IPSecInstallRoutes(uint64_t a1, const __CFDictionary *a2, CFIndex a3, const char **a4, int a5)
{
  return sub_F22C(a1, 1, a2, a3, a4, a5);
}

uint64_t sub_F22C(uint64_t a1, int a2, const __CFDictionary *a3, CFIndex a4, const char **a5, int a6)
{
  int v36 = a6;
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (!Mutable)
  {
    *a5 = "cannot allocate CFString";
    return 0xFFFFFFFFLL;
  }
  int v12 = Mutable;
  int v35 = 0;
  v48[0] = 0;
  v48[1] = 0;
  v47[0] = 0;
  v47[1] = 0;
  long long __buf = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  memset(v46, 0, sizeof(v46));
  int v13 = socket(17, 3, 17);
  if (v13 < 0)
  {
    CFDictionaryRef v32 = "cannot open a routing socket";
    goto LABEL_54;
  }
  if (!GetStrAddrFromDict(a3, @"LocalAddress", v51, 256))
  {
    BOOL v16 = "incorrect local address";
LABEL_59:
    *a5 = v16;
    CFRelease(v12);
    goto LABEL_60;
  }
  if (!GetStrAddrFromDict(a3, @"RemoteAddress", v50, 256))
  {
    BOOL v16 = "incorrect remote address";
    goto LABEL_59;
  }
  CFStringRef Value = CFDictionaryGetValue(a3, @"Policies");
  if (!isArray(Value))
  {
    BOOL v16 = "no policies found";
    goto LABEL_59;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  BOOL v16 = "no policies found";
  if (!Count || Count < a4) {
    goto LABEL_59;
  }
  BOOL v17 = __CFADD__(a4, 1);
  CFIndex v18 = a4 + 1;
  if (a4 == -1) {
    a4 = 0;
  }
  if (v17) {
    CFIndex v18 = Count;
  }
  CFIndex v34 = v18;
  if (a4 < v18)
  {
    int v33 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, a4);
      if (!isDictionary(ValueAtIndex))
      {
        CFDictionaryRef v32 = "incorrect policy found";
        goto LABEL_54;
      }
      CFStringRef v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
      if (isString(v20) && !CFEqual(v20, @"Tunnel"))
      {
        if (!CFEqual(v20, @"Transport"))
        {
          CFDictionaryRef v32 = "incorrect policy type found";
          goto LABEL_54;
        }
      }
      else
      {
        uint64_t v21 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
        if (isString(v21))
        {
          if (CFEqual(v21, @"In")) {
            goto LABEL_47;
          }
          if (!CFEqual(v21, @"Out") && !CFEqual(v21, @"InOut"))
          {
            CFDictionaryRef v32 = "incorrect policy direction found";
            goto LABEL_54;
          }
        }
        int v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
        if (isString(v22) && !CFEqual(v22, @"None"))
        {
          if (!CFEqual(v22, @"Require") && !CFEqual(v22, @"Discard") && !CFEqual(v22, @"Unique"))
          {
            CFDictionaryRef v32 = "incorrect policy level";
LABEL_54:
            *a5 = v32;
            CFRelease(v12);
            if (v13 == -1) {
              return 0xFFFFFFFFLL;
            }
LABEL_60:
            close(v13);
            return 0xFFFFFFFFLL;
          }
          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v49, 256)
            || (LODWORD(v48[0]) = 528, !inet_aton(v49, (in_addr *)v48 + 1)))
          {
            CFDictionaryRef v32 = "incorrect local network";
            goto LABEL_54;
          }
          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v49, 256))
          {
            CFDictionaryRef v32 = "incorrect remote network0";
            goto LABEL_54;
          }
          LODWORD(v47[0]) = 528;
          if (!inet_aton(v49, (in_addr *)v47 + 1))
          {
            CFDictionaryRef v32 = "incorrect remote network1";
            goto LABEL_54;
          }
          if (a2 != 2) {
            goto LABEL_39;
          }
          caddr_t v23 = *(uint64_t **)(a1 + 1048);
          if (!v23) {
            goto LABEL_35;
          }
          while (*((_DWORD *)v23 + 2) != HIDWORD(v48[0]) || *((_DWORD *)v23 + 4) != HIDWORD(v47[0]))
          {
            caddr_t v23 = (uint64_t *)*v23;
            if (!v23) {
              goto LABEL_35;
            }
          }
          if (*((_DWORD *)v23 + 8))
          {
LABEL_39:
            *(void *)&long long __buf = 327680;
            long long v40 = 0u;
            long long v45 = 0u;
            memset(v46, 0, sizeof(v46));
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            BYTE3(__buf) = a2;
            DWORD1(v40) = ++v33;
            *((void *)&__buf + 1) = 0x700000803;
            WORD6(v44) = 528;
            LODWORD(v45) = HIDWORD(v47[0]);
            WORD6(v45) = 528;
            v46[0] = v36;
            LOWORD(v46[3]) = 528;
            GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePrefix", &v35, 24);
            int v24 = v35;
            if (v35)
            {
              unsigned int v25 = 0;
              do
              {
                unsigned int v25 = (v25 >> 1) | 0x80000000;
                --v24;
              }
              while (v24);
              int v35 = 0;
            }
            else
            {
              unsigned int v25 = 0;
            }
            v46[4] = bswap32(v25);
            LOWORD(__buf) = 140;
            if (write(v13, &__buf, 0x8CuLL) < 0)
            {
              caddr_t v26 = __error();
              strerror(*v26);
              addr2ascii(2, (char *)v47 + 4, 4, v38);
              addr2ascii(2, &v36, 4, v37);
              syslog(3, "cannot write on routing socket: %s (address %s, gateway %s)\n");
            }
            else
            {
              update_service_route(a1, SHIDWORD(v48[0]), -1, SHIDWORD(v47[0]), bswap32(v46[4]), v36, 0, a2 == 1);
              sub_13184(HIDWORD(v47[0]), v46[4]);
              CFStringAppendFormat(v12, 0, @"%s, ", byte_1DD60);
            }
          }
          else
          {
LABEL_35:
            addr2ascii(2, (char *)v47 + 4, 4, v38);
            addr2ascii(2, &v36, 4, v37);
            syslog(6, "ignoring uninstalled route: (address %s, gateway %s)\n");
          }
        }
      }
LABEL_47:
      ++a4;
    }
    while (a4 != v34);
  }
  CFIndex Length = CFStringGetLength(v12);
  if (Length >= 1)
  {
    CFIndex v28 = Length + 1;
    int v29 = (char *)malloc_type_calloc(1uLL, Length + 1, 0x32885FB7uLL);
    if (v29)
    {
      int v30 = v29;
      CFStringGetCString(v12, v29, v28, 0x600u);
      addr2ascii(2, &v36, 4, v37);
      syslog(5, "installed routes: addresses %sgateway %s\n", v30, v37);
      free(v30);
    }
  }
  CFRelease(v12);
  close(v13);
  return 0;
}

uint64_t IPSecRemoveRoutes(uint64_t a1, const __CFDictionary *a2, CFIndex a3, const char **a4, int a5)
{
  return sub_F22C(a1, 2, a2, a3, a4, a5);
}

uint64_t IPSecRemovePolicies(const __CFDictionary *a1, CFIndex a2, const char **a3)
{
  uint64_t v42 = 0;
  int v41 = 255;
  memset(v46, 0, sizeof(v46));
  memset(v45, 0, sizeof(v45));
  int v6 = pfkey_open();
  if ((v6 & 0x80000000) == 0)
  {
    if (GetStrAddrFromDict(a1, @"LocalAddress", v44, 256))
    {
      if (GetStrAddrFromDict(a1, @"RemoteAddress", v43, 256))
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Policies");
        if (isArray(Value))
        {
          CFIndex Count = CFArrayGetCount(Value);
          unint64_t v9 = "no policies found";
          if (Count && Count >= a2)
          {
            BOOL v10 = __CFADD__(a2, 1);
            CFIndex v11 = a2 + 1;
            if (a2 == -1) {
              a2 = 0;
            }
            if (v10) {
              CFIndex v11 = Count;
            }
            CFIndex v37 = v11;
            if (a2 < v11)
            {
              int v12 = 0;
              CFArrayRef v36 = Value;
              while (1)
              {
                ValueAtIndex = CFArrayGetValueAtIndex(Value, a2);
                if (!isDictionary(ValueAtIndex))
                {
                  CFDictionaryRef v32 = "incorrect policy found";
                  goto LABEL_52;
                }
                int v14 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
                if (isString(v14) && !CFEqual(v14, @"Tunnel"))
                {
                  if (!CFEqual(v14, @"Transport"))
                  {
                    CFDictionaryRef v32 = "incorrect policy type found";
                    goto LABEL_52;
                  }
                  char v15 = 1;
                }
                else
                {
                  char v15 = 0;
                }
                BOOL v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
                if (isString(v16))
                {
                  if (CFEqual(v16, @"In"))
                  {
                    char v17 = 0;
                    char v18 = 1;
                    goto LABEL_26;
                  }
                  if (CFEqual(v16, @"Out"))
                  {
                    char v18 = 0;
                    char v17 = 1;
                    goto LABEL_26;
                  }
                  if (!CFEqual(v16, @"InOut"))
                  {
                    CFDictionaryRef v32 = "incorrect policy direction found";
                    goto LABEL_52;
                  }
                }
                char v17 = 0;
                char v18 = 0;
LABEL_26:
                strcpy(v48, "out");
                strcpy(__s, "in");
                int v19 = strlen(__s);
                caddr_t v20 = ipsec_set_policy(__s, v19);
                if (!v20)
                {
                  CFDictionaryRef v32 = "cannot set policy in";
                  goto LABEL_52;
                }
                uint64_t v21 = v20;
                int v22 = strlen(v48);
                caddr_t v23 = ipsec_set_policy(v48, v22);
                if (!v23)
                {
                  *a3 = "cannot set policy out";
                  caddr_t v34 = v21;
LABEL_74:
                  free(v34);
                  goto LABEL_53;
                }
                caddr_t v24 = v23;
                int v38 = *(unsigned __int16 *)v21;
                int v39 = *(unsigned __int16 *)v23;
                if (v15)
                {
                  int v40 = 0;
                  if (!get_address_from_string(v44, v46, 0x80uLL))
                  {
                    int v35 = "incorrect local address";
LABEL_73:
                    *a3 = v35;
                    free(v21);
                    caddr_t v34 = v24;
                    goto LABEL_74;
                  }
                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v40, 0);
                  WORD1(v46[0]) = bswap32((unsigned __int16)v40) >> 16;
                  if (BYTE1(v46[0]) == 2) {
                    int v25 = 32 * (DWORD1(v46[0]) != 0);
                  }
                  else {
                    int v25 = 128;
                  }
                  HIDWORD(v42) = v25;
                  if (!get_address_from_string(v43, v45, 0x80uLL))
                  {
                    int v35 = "incorrect remote address";
                    goto LABEL_73;
                  }
                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v40, 0);
                  WORD1(v45[0]) = bswap32((unsigned __int16)v40) >> 16;
                  if (BYTE1(v45[0]) == 2) {
                    int v26 = 32 * (DWORD1(v45[0]) != 0);
                  }
                  else {
                    int v26 = 128;
                  }
                  LODWORD(v42) = v26;
                  caddr_t v27 = &v41;
                  CFDictionaryRef v28 = (const __CFDictionary *)ValueAtIndex;
                  CFStringRef v29 = @"Protocol";
                  int v30 = 0;
                }
                else
                {
                  if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v47, 32))
                  {
                    int v35 = "incorrect local network (0)";
                    goto LABEL_73;
                  }
                  if (!get_address_from_string(v47, v46, 0x80uLL))
                  {
                    int v35 = "incorrect local network (1)";
                    goto LABEL_73;
                  }
                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", (_DWORD *)&v42 + 1, 24);
                  if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v47, 32))
                  {
                    int v35 = "incorrect remote network (0)";
                    goto LABEL_73;
                  }
                  if (!get_address_from_string(v47, v45, 0x80uLL))
                  {
                    int v35 = "incorrect remote network (1)";
                    goto LABEL_73;
                  }
                  caddr_t v27 = (int *)&v42;
                  CFDictionaryRef v28 = (const __CFDictionary *)ValueAtIndex;
                  CFStringRef v29 = @"RemotePrefix";
                  int v30 = 24;
                }
                GetIntFromDict(v28, v29, v27, v30);
                if ((v18 & 1) == 0)
                {
                  if ((pfkey_send_spddelete(v6, (unsigned __int8 *)v46, HIDWORD(v42), (unsigned __int8 *)v45, v42, v41, v24, 8 * v39, v12) & 0x80000000) != 0)
                  {
                    int v35 = "cannot delete policy out";
                    goto LABEL_73;
                  }
                  ++v12;
                }
                if ((v17 & 1) == 0)
                {
                  if ((pfkey_send_spddelete(v6, (unsigned __int8 *)v45, v42, (unsigned __int8 *)v46, HIDWORD(v42), v41, v21, 8 * v38, v12) & 0x80000000) != 0)
                  {
                    int v35 = "cannot delete policy in";
                    goto LABEL_73;
                  }
                  ++v12;
                }
                free(v21);
                free(v24);
                uint64_t v31 = 0;
                ++a2;
                CFArrayRef Value = v36;
                if (v37 == a2) {
                  goto LABEL_59;
                }
              }
            }
            uint64_t v31 = 0;
            goto LABEL_59;
          }
        }
        else
        {
          unint64_t v9 = "no policies found";
        }
      }
      else
      {
        unint64_t v9 = "incorrect remote address";
      }
    }
    else
    {
      unint64_t v9 = "incorrect local address";
    }
    *a3 = v9;
    uint64_t v31 = 0xFFFFFFFFLL;
LABEL_59:
    pfkey_close(v6);
    return v31;
  }
  CFDictionaryRef v32 = "cannot open a pfkey socket";
LABEL_52:
  *a3 = v32;
LABEL_53:
  uint64_t v31 = 0xFFFFFFFFLL;
  if (v6 != -1) {
    goto LABEL_59;
  }
  return v31;
}

uint64_t IPSecRemoveSecurityAssociations(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = pfkey_open();
  if (v4 < 0) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  uint64_t v6 = pfkey_send_delete_all(v4, 3, 0, a1, a2);
  if ((v6 & 0x80000000) == 0) {
    uint64_t v6 = pfkey_send_delete_all(v5, 3, 0, a2, a1);
  }
  uint64_t v7 = v6;
  pfkey_close(v5);
  return v7;
}

BOOL IPSecIsAggressiveMode(const void *a1, int a2, int a3)
{
  BOOL result = 0;
  if (a2 && a3) {
    return !isString(a1) || CFEqual(a1, @"Certificate") == 0;
  }
  return result;
}

uint64_t sockaddr_to_string(unsigned __int8 *a1, void *a2, unint64_t a3)
{
  bzero(a2, a3);
  int v6 = a1[1];
  switch(v6)
  {
    case 30:
      uint64_t result = (uint64_t)inet_ntop(30, a1 + 8, (char *)a2, a3);
      if (*((_DWORD *)a1 + 6))
      {
        uint64_t result = strlen((const char *)a2);
        if (a3 >= ((result << 32) + 0x1100000000) >> 32)
        {
          uint64_t v8 = result << 32;
          *((unsigned char *)a2 + (int)result) = 37;
          unsigned int v9 = *((_DWORD *)a1 + 6);
          return (uint64_t)if_indextoname(v9, (char *)a2 + ((v8 + 0x100000000) >> 32));
        }
      }
      break;
    case 18:
      unsigned int v12 = *a1;
      CFIndex v11 = a1 + 8;
      size_t v10 = v12;
      if (v12 >= a3) {
        size_t v13 = a3 - 1;
      }
      else {
        size_t v13 = v10;
      }
      return (uint64_t)memmove(a2, v11, v13);
    case 2:
      return (uint64_t)inet_ntop(2, a1 + 4, (char *)a2, a3);
    default:
      return snprintf((char *)a2, a3, "unexpected address family %d", a1[1]);
  }
  return result;
}

uint64_t get_src_address(unsigned char *a1, uint64_t a2, const char *a3, char *a4)
{
  pid_t v8 = getpid();
  uint64_t result = socket(17, 3, 17);
  if (result != -1)
  {
    int v10 = result;
    bzero(v41, 0x258uLL);
    int __buf = 285540444;
    uint64_t v42 = 0x1100000807;
    pid_t v43 = v8;
    int v44 = 1;
    if (a3)
    {
      LODWORD(a3) = if_nametoindex(a3);
      LODWORD(v42) = 16779271;
      v41[0] = (_WORD)a3;
    }
    CFIndex v11 = v45;
    __memmove_chk();
    __int16 v12 = __buf + v45[0];
    *(_WORD *)&v45[v45[0]] = 4628;
    LOWORD(__buf) = v12 + 20;
    while (write(v10, &__buf, (unsigned __int16)__buf) == -1)
    {
      if (*__error() != 4) {
        goto LABEL_7;
      }
    }
    while (read(v10, &__buf, 0x25CuLL) == -1)
    {
      if (*__error() != 4) {
        goto LABEL_7;
      }
    }
    uint64_t v13 = 0;
    *(_OWORD *)__src = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    int v14 = HIDWORD(v42);
    do
    {
      if (((1 << v13) & v14) != 0)
      {
        *((void *)&v36 + v13) = v11;
        uint64_t v15 = *v11;
        if ((v15 & 3) != 0) {
          uint64_t v16 = (v15 | 3) + 1;
        }
        else {
          uint64_t v16 = *v11;
        }
        if (*v11) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 4;
        }
        v11 += v17;
        v14 ^= 1 << v13;
      }
      else
      {
        *((void *)&v36 + v13) = 0;
      }
      ++v13;
    }
    while (v13 != 8);
    if (!a1 || (v18 = __src[1]) == 0 || (int v19 = (const char *)__src[0], a4) && !__src[0])
    {
LABEL_7:
      close(v10);
      return 0xFFFFFFFFLL;
    }
    if (*((unsigned char *)__src[1] + 1) == 30
      && *((unsigned __int8 *)__src[1] + 8) == 254
      && (*((unsigned char *)__src[1] + 9) & 0xC0) == 0x80)
    {
      unsigned int v20 = *((unsigned __int16 *)__src[1] + 5);
      if (*((_WORD *)__src[1] + 5))
      {
        *((_WORD *)__src[1] + 5) = 0;
        if (!v18[6]) {
          v18[6] = __rev16(v20);
        }
      }
    }
    memmove(a1, v18, *(unsigned __int8 *)v18);
    if (a4) {
      strncpy(a4, v19 + 8, 0x10uLL);
    }
    close(v10);
    if (a1[1] != 30) {
      return 0;
    }
    LODWORD(v35) = 128;
    HIDWORD(v35) = a3;
    uint64_t v21 = (sockaddr *)malloc_type_calloc(1uLL, 0x80uLL, 0xF1363277uLL);
    if (v21)
    {
      int v22 = v21;
      int v23 = socket(*(unsigned __int8 *)(a2 + 1), 2, 0);
      if (v23 < 0)
      {
        CFStringRef v29 = __error();
        int v30 = strerror(*v29);
        syslog(3, "socket (%s)\n", v30);
      }
      else
      {
        int v24 = v23;
        if (fcntl(v23, 4, 4, v35, v36, v37) == -1) {
          syslog(3, "failed to put localaddr socket in non-blocking mode\n");
        }
        if (a3)
        {
          int v25 = *(unsigned char *)(a2 + 1) == 2 ? 0 : 41;
          int v26 = *(unsigned char *)(a2 + 1) == 2 ? 25 : 125;
          if (setsockopt(v24, v25, v26, (char *)&v35 + 4, 4u))
          {
            caddr_t v27 = __error();
            CFDictionaryRef v28 = strerror(*v27);
            syslog(3, "failed to set IP family on localaddr socket: %s\n", v28);
          }
        }
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        sockaddr v46 = (sockaddr)0;
        long long v47 = 0u;
        __memcpy_chk();
        if (v46.sa_family == 30 || v46.sa_family == 2) {
          *(_WORD *)v46.sa_data = -14161;
        }
        if (connect(v24, &v46, v46.sa_len) < 0)
        {
          uint64_t v31 = __error();
          CFDictionaryRef v32 = strerror(*v31);
          syslog(3, "connect (%s)\n", v32);
          close(v24);
        }
        else
        {
          if (getsockname(v24, v22, (socklen_t *)&v35) < 0)
          {
            int v33 = __error();
            caddr_t v34 = strerror(*v33);
            syslog(3, "getsockname (%s)\n", v34);
            close(v24);
            return 0;
          }
          close(v24);
          memcpy(a1, v22, v22->sa_len);
        }
      }
      free(v22);
    }
    else
    {
      syslog(3, "failed to get address buffer.\n");
    }
    return 0;
  }
  return result;
}

uint64_t get_if_mtu()
{
  long long v4 = 0u;
  long long v5 = 0u;
  uint64_t v0 = 1500;
  LODWORD(v5) = 1500;
  int v1 = socket(2, 2, 0);
  if ((v1 & 0x80000000) == 0)
  {
    int v2 = v1;
    __strlcpy_chk();
    ioctl(v2, 0xC0206933uLL, &v4);
    close(v2);
    return v5;
  }
  return v0;
}

uint64_t get_if_media()
{
  memset(v3, 0, 44);
  int v0 = socket(2, 2, 0);
  if (v0 < 0) {
    return 0;
  }
  int v1 = v0;
  __strlcpy_chk();
  ioctl(v1, 0xC02C6938uLL, v3);
  close(v1);
  return LODWORD(v3[1]);
}

uint64_t get_if_baudrate(const char *a1)
{
  size_t size = 0;
  unsigned int v1 = if_nametoindex(a1);
  if (!v1) {
    return 0;
  }
  *(_OWORD *)int v6 = xmmword_17D80;
  int v7 = 3;
  unsigned int v8 = v1;
  if (sysctl(v6, 6u, 0, &size, 0, 0) < 0) {
    return 0;
  }
  int v2 = malloc_type_malloc(size, 0x3FD6D1DDuLL);
  if (sysctl(v6, 6u, v2, &size, 0, 0) < 0)
  {
    uint64_t v3 = 0;
    if (!v2) {
      return v3;
    }
  }
  else if (v2[3] == 14)
  {
    uint64_t v3 = *((unsigned int *)v2 + 8);
  }
  else
  {
    uint64_t v3 = 0;
  }
  free(v2);
  return v3;
}

uint64_t IPSecSetSecurityAssociationsPreference(void *a1, unsigned int a2)
{
  unsigned int v4 = a2;
  size_t v3 = 4;
  if (a2 <= 1) {
    return sysctlbyname("net.key.prefered_oldsa", a1, &v3, &v4, 4uLL);
  }
  else {
    return 0;
  }
}

__CFDictionary *IPSecCreateL2TPDefaultConfiguration(const sockaddr *a1, const sockaddr *a2, const char *a3, const void *a4, int a5, int a6, int a7, const __CFString *a8, int a9)
{
  int v68 = 1;
  int v69 = 0;
  unsigned int valuePtr = 0;
  int v67 = 17;
  int sa_family = a2->sa_family;
  if (a1->sa_family != sa_family)
  {
    syslog(3, "address families don't match (%u != %u)\n", a1->sa_family, sa_family);
    return 0;
  }
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v19 = 0;
  if (a3) {
    CFStringRef v19 = CFStringCreateWithCString(0, a3, 0x600u);
  }
  CFStringRef v60 = v19;
  if (a2->sa_family == 30)
  {
    getnameinfo(a1, a1->sa_len, cStr, 0x39u, 0, 0, 10);
    CFStringRef value = CFStringCreateWithCString(0, cStr, 0x600u);
    getnameinfo(a2, a2->sa_len, cStr, 0x39u, 0, 0, 10);
    CFStringRef v62 = CFStringCreateWithCString(0, cStr, 0x600u);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
    CFNumberRef v58 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a2->sa_data) >> 16;
    CFNumberRef v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = 128;
    CFNumberRef v56 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFNumberRef v55 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  }
  else
  {
    int v22 = addr2ascii(2, &a1->sa_data[2], 4, 0);
    CFStringRef value = CFStringCreateWithCString(0, v22, 0x600u);
    int v23 = addr2ascii(2, &a2->sa_data[2], 4, 0);
    CFStringRef v62 = CFStringCreateWithCString(0, v23, 0x600u);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
    CFNumberRef v58 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a2->sa_data) >> 16;
    CFNumberRef v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFNumberRef v55 = 0;
    CFNumberRef v56 = 0;
  }
  CFNumberRef v54 = CFNumberCreate(0, kCFNumberIntType, &v69);
  CFNumberRef v61 = CFNumberCreate(0, kCFNumberIntType, &v67);
  if (a6)
  {
    CFNumberRef v53 = 0;
    CFStringRef v24 = @"Obey";
  }
  else
  {
    if (a7) {
      int v25 = &v68;
    }
    else {
      int v25 = &v69;
    }
    CFNumberRef v53 = CFNumberCreate(0, kCFNumberIntType, v25);
    CFStringRef v24 = @"Claim";
  }
  CFDictionarySetValue(Mutable, @"AuthenticationMethod", a4);
  CFDictionarySetValue(Mutable, @"LocalAddress", value);
  CFDictionarySetValue(Mutable, @"RemoteAddress", v62);
  CFDictionarySetValue(Mutable, @"ProposalsBehavior", v24);
  if (a6 && CFEqual(a4, @"Certificate"))
  {
    if (a8) {
      CFStringRef v26 = a8;
    }
    else {
      CFStringRef v26 = @"GenerateFromRemoteAddress";
    }
    if (!a8 && a3)
    {
      CFDictionarySetValue(Mutable, @"RemoteIdentifier", v60);
      CFStringRef v26 = @"UseRemoteIdentifier";
    }
    CFDictionarySetValue(Mutable, @"IdentifierVerification", v26);
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
  }
  else
  {
    CFDictionarySetValue(Mutable, @"IdentifierVerification", @"None");
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
    if (!a6) {
      CFDictionarySetValue(Mutable, @"NattMultipleUsersEnabled", v53);
    }
  }
  CFNumberRef v57 = v20;
  int v59 = a6;
  CFArrayRef theArray = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  unsigned int valuePtr = 3600;
  CFNumberRef cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (a9)
  {
    unsigned int v28 = 0;
  }
  else
  {
    unsigned int valuePtr = 14;
    CFNumberRef v37 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    long long v39 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v39, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v39, @"HashAlgorithm", @"SHA256");
    CFDictionarySetValue(v39, @"DHGroup", v37);
    CFDictionarySetValue(v39, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 0, v39);
    CFRelease(v39);
    int v40 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v40, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v40, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v40, @"DHGroup", v37);
    CFDictionarySetValue(v40, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 1, v40);
    CFRelease(v40);
    int v41 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v41, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v41, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v41, @"DHGroup", v37);
    CFDictionarySetValue(v41, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 2, v41);
    CFRelease(v41);
    uint64_t v42 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v42, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v42, @"HashAlgorithm", @"SHA512");
    CFDictionarySetValue(v42, @"DHGroup", v37);
    CFDictionarySetValue(v42, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 3, v42);
    CFRelease(v42);
    if (IsAggressiveMode) {
      goto LABEL_29;
    }
    CFRelease(v37);
    unsigned int valuePtr = 5;
    CFNumberRef v49 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    long long v50 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v50, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v50, @"HashAlgorithm", @"SHA256");
    CFDictionarySetValue(v50, @"DHGroup", v49);
    CFDictionarySetValue(v50, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 4, v50);
    CFRelease(v50);
    long long v51 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v51, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v51, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v51, @"DHGroup", v49);
    CFDictionarySetValue(v51, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 5, v51);
    CFRelease(v51);
    long long v52 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v52, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v52, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v52, @"DHGroup", v49);
    CFDictionarySetValue(v52, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 6, v52);
    CFRelease(v52);
    CFRelease(v49);
    unsigned int v28 = 7;
  }
  unsigned int valuePtr = 2;
  CFNumberRef v29 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  int v30 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v30, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v30, @"HashAlgorithm", @"SHA256");
  CFDictionarySetValue(v30, @"DHGroup", v29);
  CFDictionarySetValue(v30, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28, v30);
  CFRelease(v30);
  uint64_t v31 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v31, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v31, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v31, @"DHGroup", v29);
  CFDictionarySetValue(v31, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 1, v31);
  CFRelease(v31);
  CFDictionaryRef v32 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v32, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v32, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v32, @"DHGroup", v29);
  CFDictionarySetValue(v32, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 2, v32);
  CFRelease(v32);
  int v33 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v33, @"EncryptionAlgorithm", @"AES");
  CFDictionarySetValue(v33, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v33, @"DHGroup", v29);
  CFDictionarySetValue(v33, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 3, v33);
  CFRelease(v33);
  caddr_t v34 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v34, @"EncryptionAlgorithm", @"AES");
  CFDictionarySetValue(v34, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v34, @"DHGroup", v29);
  CFDictionarySetValue(v34, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 4, v34);
  CFRelease(v34);
  uint64_t v35 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v35, @"EncryptionAlgorithm", @"3DES");
  CFDictionarySetValue(v35, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v35, @"DHGroup", v29);
  CFDictionarySetValue(v35, @"Lifetime", cf);
  CFIndex v36 = v28 + 6;
  CFArraySetValueAtIndex(theArray, v28 + 5, v35);
  CFRelease(v35);
  CFNumberRef v37 = v29;
  int v38 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v38, @"EncryptionAlgorithm", @"3DES");
  CFDictionarySetValue(v38, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v38, @"DHGroup", v29);
  CFDictionarySetValue(v38, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v36, v38);
  CFRelease(v38);
LABEL_29:
  CFRelease(v37);
  CFRelease(cf);
  uint64_t v21 = Mutable;
  CFDictionarySetValue(Mutable, @"Proposals", theArray);
  CFRelease(theArray);
  pid_t v43 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v43, @"LocalPort", v58);
  CFDictionarySetValue(v43, @"RemotePort", v57);
  if (v56) {
    CFDictionarySetValue(v43, @"LocalPrefix", v56);
  }
  if (v55) {
    CFDictionarySetValue(v43, @"RemotePrefix", v55);
  }
  CFDictionarySetValue(v43, @"Protocol", v61);
  CFDictionarySetValue(v43, @"Mode", @"Transport");
  CFDictionarySetValue(v43, @"Level", @"Require");
  int v44 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v44, 0, @"AES256");
  CFArraySetValueAtIndex(v44, 1, @"AES");
  CFArraySetValueAtIndex(v44, 2, @"3DES");
  CFDictionarySetValue(v43, @"EncryptionAlgorithm", v44);
  CFRelease(v44);
  long long v45 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v45, 0, @"SHA256");
  CFArraySetValueAtIndex(v45, 1, @"SHA1");
  CFArraySetValueAtIndex(v45, 2, @"MD5");
  CFDictionarySetValue(v43, @"HashAlgorithm", v45);
  CFRelease(v45);
  if (v59)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v43);
    CFDictionarySetValue(MutableCopy, @"RemotePort", v54);
    CFDictionarySetValue(MutableCopy, @"Direction", @"In");
  }
  else
  {
    MutableCopy = 0;
  }
  long long v47 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v47, 0, v43);
  if (v59)
  {
    CFArraySetValueAtIndex(v47, 1, MutableCopy);
    CFRelease(v43);
  }
  else
  {
    MutableCopy = v43;
  }
  CFRelease(MutableCopy);
  CFDictionarySetValue(Mutable, @"Policies", v47);
  CFRelease(v47);
  CFRelease(value);
  CFRelease(v62);
  CFRelease(v58);
  CFRelease(v57);
  if (v56) {
    CFRelease(v56);
  }
  if (v55) {
    CFRelease(v55);
  }
  CFRelease(v54);
  CFRelease(v61);
  if (!v59) {
    CFRelease(v53);
  }
  if (v60) {
    CFRelease(v60);
  }
  return v21;
}

__CFDictionary *IPSecCreateCiscoDefaultConfiguration(const sockaddr *a1, uint64_t a2, const void *a3, const void *a4, int a5, int a6, int a7, const __CFString *a8, int a9)
{
  int v60 = 1;
  int v61 = 0;
  int v59 = -1;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a1->sa_family == 30)
  {
    getnameinfo(a1, a1->sa_len, v62, 0x39u, 0, 0, 10);
    syslog(3, "IPv6 IPSec Address: %s\n", v62);
    char v18 = v62;
    CFStringEncoding v19 = 134217984;
  }
  else
  {
    char v18 = addr2ascii(2, &a1->sa_data[2], 4, 0);
    CFStringEncoding v19 = 1536;
  }
  CFStringRef value = CFStringCreateWithCString(0, v18, v19);
  CFNumberRef v20 = addr2ascii(2, (const void *)(a2 + 4), 4, 0);
  CFStringRef v51 = CFStringCreateWithCString(0, v20, 0x600u);
  signed int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
  CFNumberRef v49 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  signed int valuePtr = bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16;
  CFNumberRef v48 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFNumberRef v47 = CFNumberCreate(0, kCFNumberIntType, &v61);
  CFNumberRef v46 = CFNumberCreate(0, kCFNumberIntType, &v59);
  if (a6)
  {
    CFNumberRef v44 = 0;
    CFStringRef v21 = @"Obey";
  }
  else
  {
    if (a7) {
      int v22 = &v60;
    }
    else {
      int v22 = &v61;
    }
    CFNumberRef v44 = CFNumberCreate(0, kCFNumberIntType, v22);
    CFStringRef v21 = @"Claim";
  }
  CFNumberRef v45 = CFNumberCreate(0, kCFNumberIntType, &v61);
  CFNumberRef v23 = CFNumberCreate(0, kCFNumberIntType, &v60);
  CFDictionarySetValue(Mutable, @"ModeConfigEnabled", v23);
  CFDictionarySetValue(Mutable, @"XAuthEnabled", v23);
  CFDictionarySetValue(Mutable, @"LocalAddress", value);
  CFDictionarySetValue(Mutable, @"RemoteAddress", v51);
  CFDictionarySetValue(Mutable, @"ProposalsBehavior", v21);
  if (a6 && CFEqual(a4, @"Certificate"))
  {
    if (!a8)
    {
      if (a3)
      {
        CFDictionarySetValue(Mutable, @"RemoteIdentifier", a3);
        a8 = @"UseRemoteIdentifier";
      }
      else
      {
        a8 = @"GenerateFromRemoteAddress";
      }
    }
    CFDictionarySetValue(Mutable, @"IdentifierVerification", a8);
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
  }
  else
  {
    CFDictionarySetValue(Mutable, @"IdentifierVerification", @"None");
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
    if (!a6) {
      CFDictionarySetValue(Mutable, @"NattMultipleUsersEnabled", v44);
    }
  }
  CFDictionarySetValue(Mutable, @"DeadPeerDetectionEnabled", v23);
  CFDictionarySetValue(Mutable, @"BlackHoleDetectionEnabled", v23);
  signed int valuePtr = 20;
  CFNumberRef v25 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (v25)
  {
    CFNumberRef v26 = v25;
    CFDictionarySetValue(Mutable, @"DeadPeerDetectionDelay", v25);
    CFRelease(v26);
  }
  CFArrayRef theArray = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  signed int valuePtr = 3600;
  CFNumberRef cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(_OWORD *)CFStringRef v62 = xmmword_17DC0;
  int v27 = 14;
  CFDictionaryRef theDict = Mutable;
  if (IsAggressiveMode)
  {
    if (a9) {
      int v27 = 2;
    }
    else {
      int v27 = 14;
    }
    *(_DWORD *)CFStringRef v62 = v27;
    *(_DWORD *)&v62[4] = 0;
  }
  int v57 = 0;
  signed int valuePtr = v27;
  uint64_t v28 = 4;
  do
  {
    CFNumberRef v29 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    uint64_t v54 = v28;
    if (valuePtr < 5)
    {
      uint64_t v31 = theArray;
    }
    else
    {
      int v30 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v30, @"EncryptionAlgorithm", @"AES256");
      CFDictionarySetValue(v30, @"HashAlgorithm", @"SHA256");
      CFDictionarySetValue(v30, @"DHGroup", v29);
      CFDictionarySetValue(v30, @"Lifetime", cf);
      uint64_t v31 = theArray;
      CFArraySetValueAtIndex(theArray, v57, v30);
      CFRelease(v30);
      ++v57;
    }
    CFDictionaryRef v32 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v32, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v32, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v32, @"DHGroup", v29);
    CFDictionarySetValue(v32, @"Lifetime", cf);
    CFArraySetValueAtIndex(v31, v57, v32);
    CFRelease(v32);
    int v33 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v33, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v33, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v33, @"DHGroup", v29);
    CFDictionarySetValue(v33, @"Lifetime", cf);
    int v34 = v57 + 2;
    CFArraySetValueAtIndex(v31, v57 + 1, v33);
    CFRelease(v33);
    int v35 = valuePtr;
    if (valuePtr < 14)
    {
      v57 += 2;
    }
    else
    {
      CFIndex v36 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v36, @"EncryptionAlgorithm", @"AES256");
      CFDictionarySetValue(v36, @"HashAlgorithm", @"SHA512");
      CFDictionarySetValue(v36, @"DHGroup", v29);
      CFDictionarySetValue(v36, @"Lifetime", cf);
      v57 += 3;
      CFArraySetValueAtIndex(theArray, v34, v36);
      CFRelease(v36);
      int v35 = valuePtr;
    }
    if (v35 <= 2)
    {
      CFNumberRef v37 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v37, @"EncryptionAlgorithm", @"AES");
      CFDictionarySetValue(v37, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v37, @"DHGroup", v29);
      CFDictionarySetValue(v37, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57, v37);
      CFRelease(v37);
      int v38 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v38, @"EncryptionAlgorithm", @"AES");
      CFDictionarySetValue(v38, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v38, @"DHGroup", v29);
      CFDictionarySetValue(v38, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 1, v38);
      CFRelease(v38);
      long long v39 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v39, @"EncryptionAlgorithm", @"3DES");
      CFDictionarySetValue(v39, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v39, @"DHGroup", v29);
      CFDictionarySetValue(v39, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 2, v39);
      CFRelease(v39);
      int v40 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v40, @"EncryptionAlgorithm", @"3DES");
      CFDictionarySetValue(v40, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v40, @"DHGroup", v29);
      CFDictionarySetValue(v40, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 3, v40);
      CFRelease(v40);
      int v41 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v41, @"EncryptionAlgorithm", @"DES");
      CFDictionarySetValue(v41, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v41, @"DHGroup", v29);
      CFDictionarySetValue(v41, @"Lifetime", cf);
      int v53 = v57 + 5;
      CFArraySetValueAtIndex(theArray, v57 + 4, v41);
      CFRelease(v41);
      uint64_t v42 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v42, @"EncryptionAlgorithm", @"DES");
      CFDictionarySetValue(v42, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v42, @"DHGroup", v29);
      CFDictionarySetValue(v42, @"Lifetime", cf);
      v57 += 6;
      CFArraySetValueAtIndex(theArray, v53, v42);
      CFRelease(v42);
    }
    CFRelease(v29);
    signed int valuePtr = *(_DWORD *)&v62[v54];
    uint64_t v28 = v54 + 4;
  }
  while (valuePtr);
  CFRelease(cf);
  CFDictionarySetValue(theDict, @"Proposals", theArray);
  CFRelease(theArray);
  CFRelease(value);
  CFRelease(v51);
  CFRelease(v49);
  CFRelease(v48);
  CFRelease(v47);
  CFRelease(v46);
  if (v23) {
    CFRelease(v23);
  }
  if (v45) {
    CFRelease(v45);
  }
  if (!a6) {
    CFRelease(v44);
  }
  return theDict;
}

uint64_t IPSecSelfRepair()
{
  pid_t v0 = racoon_pid();
  if (v0) {
    kill(v0, 15);
  }
  return 0;
}

uint64_t IPSecFlushAll()
{
  int v0 = pfkey_open();
  if ((v0 & 0x80000000) == 0)
  {
    int v1 = v0;
    pfkey_send_spdflush(v0);
    pfkey_send_flush(v1, 0);
    pfkey_close(v1);
  }
  return 0;
}

void IPSecLogVPNInterfaceAddressEvent(uint64_t a1, uint64_t a2, int a3, char *a4, void *a5)
{
  if (a2)
  {
    unsigned int v42 = bswap32(*(_DWORD *)(a2 + 64));
    unsigned int v8 = (char *)*(unsigned int *)(a2 + 20);
    switch((int)v8)
    {
      case 1:
        unsigned int v9 = addr2ascii(2, a5, 4, v46);
        uint64_t v10 = *(unsigned int *)(a2 + 28);
        CFIndex v11 = sub_12654(*(_DWORD *)(a2 + 24));
        __int16 v12 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v11;
        int v35 = v12;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v10;
        uint64_t v31 = v9;
        uint64_t v13 = "%s: Address added. previous interface setting (name: %s, address: %s), current interface setting (name: %s"
              "%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 2:
        int v14 = addr2ascii(2, a5, 4, v46);
        uint64_t v15 = *(unsigned int *)(a2 + 28);
        uint64_t v16 = sub_12654(*(_DWORD *)(a2 + 24));
        uint64_t v17 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v16;
        int v35 = v17;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v15;
        uint64_t v31 = v14;
        uint64_t v13 = "%s: Address changed. previous interface setting (name: %s, address: %s), current interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 3:
        char v18 = addr2ascii(2, a5, 4, v46);
        uint64_t v19 = *(unsigned int *)(a2 + 28);
        CFNumberRef v20 = sub_12654(*(_DWORD *)(a2 + 24));
        CFStringRef v21 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v20;
        int v35 = v21;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v19;
        uint64_t v31 = v18;
        uint64_t v13 = "%s: Address deleted. previous interface setting (name: %s, address: %s), deleted interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 7:
        CFNumberRef v26 = addr2ascii(2, a5, 4, v46);
        uint64_t v27 = *(unsigned int *)(a2 + 28);
        uint64_t v28 = sub_12654(*(_DWORD *)(a2 + 24));
        CFNumberRef v29 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        uint64_t v40 = *(unsigned __int8 *)(a2 + 54);
        uint64_t v41 = *(unsigned __int8 *)(a2 + 53);
        int v38 = (char *)*(unsigned __int8 *)(a2 + 56);
        uint64_t v39 = *(unsigned __int8 *)(a2 + 55);
        CFIndex v36 = (char *)*(unsigned __int8 *)(a2 + 58);
        CFNumberRef v37 = (char *)*(unsigned __int8 *)(a2 + 57);
        int v34 = v28;
        int v35 = v29;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v27;
        uint64_t v31 = v26;
        uint64_t v13 = "%s: ARP collided. previous interface setting (name: %s, address: %s), conflicting interface setting (name:"
              " %s%d, family: %s, address: %s, mac: %x:%x:%x:%x:%x:%x).";
LABEL_9:
        int v30 = a4;
        break;
      default:
        int v22 = addr2ascii(2, a5, 4, v46);
        CFNumberRef v23 = (char *)*(unsigned int *)(a2 + 28);
        CFStringRef v24 = sub_12654(*(_DWORD *)(a2 + 24));
        CFNumberRef v25 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFNumberRef v37 = addr2ascii(2, &v42, 4, v44);
        int v38 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v35 = v24;
        CFIndex v36 = v25;
        uint64_t v33 = a2 + 32;
        int v34 = v23;
        uint64_t v31 = a4;
        CFDictionaryRef v32 = v22;
        uint64_t v13 = "%s: Unknown Address event (%d). previous interface setting (name: %s, address: %s), other interface settin"
              "g (name: %s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        int v30 = v8;
        break;
    }
    syslog(5, v13, a1, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41);
  }
  else
  {
    addr2ascii(2, a5, 4, v46);
    syslog(5, "%s: %d secs TIMEOUT waiting for interface to be reconfigured. previous setting (name: %s, address: %s).");
  }
}

char *sub_12654(int a1)
{
  if ((a1 - 1) < 0xE) {
    return (&off_18708)[a1 - 1];
  }
  int v1 = byte_1DE60;
  snprintf(byte_1DE60, 0x10uLL, "%d", a1);
  return v1;
}

void update_service_route(uint64_t a1, int a2, int a3, int a4, int a5, int a6, __int16 a7, int a8)
{
  uint64_t v16 = *(_DWORD **)(a1 + 1048);
  if (v16)
  {
    while (v16[2] != a2 || v16[3] != a3 || v16[4] != a4 || v16[5] != a5)
    {
      uint64_t v16 = *(_DWORD **)v16;
      if (!v16) {
        goto LABEL_7;
      }
    }
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v16 = malloc_type_calloc(1uLL, 0x28uLL, 0x10200400D048FD2uLL);
  if (v16)
  {
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = a4;
    v16[5] = a5;
    *(void *)uint64_t v16 = *(void *)(a1 + 1048);
    *(void *)(a1 + 1048) = v16;
LABEL_9:
    v16[6] = a6;
    *((_WORD *)v16 + 14) = a7;
    v16[8] = a8;
    return;
  }
  syslog(3, "%s: no memory\n", "update_service_route");
}

void *free_service_routes(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 1048);
  if (result)
  {
    do
    {
      size_t v3 = (void *)*result;
      free(result);
      uint64_t result = v3;
    }
    while (v3);
  }
  *(void *)(a1 + 1048) = 0;
  return result;
}

uint64_t find_injection(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  if (!(unint64_t)CFStringFind(a1, @"\"", 0).length)
  {
    CFRange v6 = CFStringFind(a1, @";", 0);
    if (!v6.length
      || (v10.location = v6.location + v6.length,
          v10.length = a3 - (v6.location + v6.length),
          !CFStringFindWithOptions(a1, a2, v10, 0, 0)))
    {
      CFRange v7 = CFStringFind(a1, a2, 0);
      if (!v7.length) {
        return 0;
      }
      v11.location = v7.location + v7.length;
      v11.length = a3 - (v7.location + v7.length);
      if (!CFStringFindWithOptions(a1, @";", v11, 0, 0)) {
        return 0;
      }
    }
  }
  uint64_t v8 = 1;
  SCLog();
  return v8;
}

uint64_t racoon_validate_cfg_str(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v2 = v1;
  if (!v1
    || (CFIndex Length = CFStringGetLength(v1), find_injection(v2, @"include ", Length))
    || find_injection(v2, @"privsep ", Length)
    || find_injection(v2, @"path ", Length)
    || find_injection(v2, @"timer ", Length)
    || find_injection(v2, @"listen ", Length)
    || find_injection(v2, @"remote ", Length)
    || find_injection(v2, @"sainfo ", Length)
    || find_injection(v2, @"banner ", Length)
    || find_injection(v2, @"my_identifier ", Length)
    || find_injection(v2, @"peers_identifier ", Length))
  {
    CFRelease(v2);
    return 0;
  }
  else
  {
    CFRelease(v2);
    return 1;
  }
}

uint64_t sub_12A30(FILE *a1, const __CFDictionary *a2, const char **a3)
{
  __strlcpy_chk();
  if (a2)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"EncryptionAlgorithm");
    if (isArray(Value))
    {
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        uint64_t v8 = 0;
        for (CFIndex i = 0; i != v7; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(Value, i);
          if (isString(ValueAtIndex))
          {
            if (v8) {
              __strlcat_chk();
            }
            if (!CFEqual(ValueAtIndex, @"DES")
              && !CFEqual(ValueAtIndex, @"3DES")
              && !CFEqual(ValueAtIndex, @"AES")
              && !CFEqual(ValueAtIndex, @"AES256"))
            {
              CFStringRef v24 = "incorrect encryption algorithm";
LABEL_51:
              *a3 = v24;
              return 0xFFFFFFFFLL;
            }
            __strlcat_chk();
            uint64_t v8 = 1;
          }
        }
        if (v8) {
          goto LABEL_16;
        }
      }
    }
  }
  __strlcat_chk();
LABEL_16:
  __strlcat_chk();
  fprintf(a1, "%s%s", off_1C9C8, __str);
  __strlcpy_chk();
  if (a2)
  {
    CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue(a2, @"HashAlgorithm");
    if (isArray(v11))
    {
      CFIndex v12 = CFArrayGetCount(v11);
      if (v12 >= 1)
      {
        CFIndex v13 = v12;
        uint64_t v14 = 0;
        for (CFIndex j = 0; j != v13; ++j)
        {
          uint64_t v16 = CFArrayGetValueAtIndex(v11, j);
          if (isString(v16))
          {
            if (v14) {
              __strlcat_chk();
            }
            if (!CFEqual(v16, @"SHA512")
              && !CFEqual(v16, @"SHA256")
              && !CFEqual(v16, @"SHA1")
              && !CFEqual(v16, @"MD5"))
            {
              CFStringRef v24 = "incorrect authentication algorithm";
              goto LABEL_51;
            }
            __strlcat_chk();
            uint64_t v14 = 1;
          }
        }
        if (v14) {
          goto LABEL_31;
        }
      }
    }
  }
  __strlcat_chk();
LABEL_31:
  __strlcat_chk();
  fprintf(a1, "%s%s", off_1C9C8, __str);
  __strlcpy_chk();
  if (a2)
  {
    CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(a2, @"CompressionAlgorithm");
    if (isArray(v17))
    {
      CFIndex v18 = CFArrayGetCount(v17);
      if (v18 >= 1)
      {
        CFIndex v19 = v18;
        uint64_t v20 = 0;
        for (CFIndex k = 0; k != v19; ++k)
        {
          int v22 = CFArrayGetValueAtIndex(v17, k);
          if (isString(v22))
          {
            if (v20) {
              __strlcat_chk();
            }
            if (!CFEqual(v22, @"Deflate"))
            {
              CFStringRef v24 = "incorrect compression algorithm";
              goto LABEL_51;
            }
            __strlcat_chk();
            uint64_t v20 = 1;
          }
        }
        if (v20) {
          goto LABEL_43;
        }
      }
    }
  }
  __strlcat_chk();
LABEL_43:
  __strlcat_chk();
  fprintf(a1, "%s%s", off_1C9C8, __str);
  int v26 = 3600;
  if (a2)
  {
    GetIntFromDict(a2, @"Lifetime", &v26, 3600);
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", v26);
    fprintf(a1, "%s%s", off_1C9C8, __str);
    int v26 = 0;
    if (GetIntFromDict(a2, @"PFSGroup", &v26, 0))
    {
      if (v26)
      {
        snprintf(__str, 0x400uLL, "pfs_group %d;\n", v26);
        fprintf(a1, "%s%s", off_1C9C8, __str);
      }
    }
  }
  else
  {
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", 3600);
    fprintf(a1, "%s%s", off_1C9C8, __str);
  }
  return 0;
}

uint64_t sub_12FD4(const __CFData *a1, uint64_t a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (Length / 3 + Length + Length % 3 > 1023) {
    return 0;
  }
  unint64_t v7 = Length;
  if (Length < 1)
  {
    uint64_t result = 0;
    goto LABEL_20;
  }
  uint64_t result = 0;
  unint64_t v8 = 0;
  unint64_t v9 = v7;
  do
  {
    unint64_t v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      uint64_t v12 = result + 1;
      *(unsigned char *)(a2 + result) = aAbcdefghijklmn[((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 6) & 0x3F];
      unint64_t v11 = *BytePtr & 0x3F;
      uint64_t v13 = 2;
    }
    else
    {
      if (v10 == 1)
      {
        unint64_t v11 = ((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v10) {
          goto LABEL_13;
        }
        unint64_t v11 = (unint64_t)*BytePtr >> 2;
      }
      uint64_t v13 = 1;
      uint64_t v12 = result;
    }
    result += v13;
    *(unsigned char *)(a2 + v12) = aAbcdefghijklmn[v11];
LABEL_13:
    ++v8;
    ++BytePtr;
    --v9;
  }
  while (v9);
  unint64_t v14 = v7 % 3;
  if (v14 == 2)
  {
    char v16 = aAbcdefghijklmn[4 * (*(BytePtr - 1) & 0xF)];
    uint64_t v17 = 2;
    uint64_t v18 = 1;
    uint64_t v15 = result;
LABEL_19:
    uint64_t v19 = result + v18;
    *(unsigned char *)(a2 + v15) = v16;
    result += v17;
    *(unsigned char *)(a2 + v19) = 61;
  }
  else if (v14 == 1)
  {
    uint64_t v15 = result + 1;
    *(unsigned char *)(a2 + result) = aAbcdefghijklmn[16 * (*(BytePtr - 1) & 3)];
    char v16 = 61;
    uint64_t v17 = 3;
    uint64_t v18 = 2;
    goto LABEL_19;
  }
LABEL_20:
  *(unsigned char *)(a2 + result) = 0;
  return result;
}

char *sub_13184(unsigned int a1, unsigned int a2)
{
  unsigned int v3 = bswap32(a1);
  if ((v3 & 0xFFFFFF) != 0)
  {
    if ((_WORD)v3)
    {
      if ((_BYTE)v3) {
        snprintf(byte_1DD60, 0x100uLL, "%u.%u.%u.%u");
      }
      else {
        snprintf(byte_1DD60, 0x100uLL, "%u.%u.%u");
      }
    }
    else
    {
      snprintf(byte_1DD60, 0x100uLL, "%u.%u");
    }
  }
  else
  {
    snprintf(byte_1DD60, 0x100uLL, "%u");
  }
  uint64_t result = &byte_1DD60[strlen(byte_1DD60)];
  if (a2)
  {
    int v5 = 0;
    unsigned int v6 = bswap32(a2);
    while (((v6 >> v5) & 1) == 0)
    {
      if (++v5 == 32) {
        return (char *)snprintf(result, 8uLL, "/%d");
      }
    }
    int v7 = v5;
    while (v7 != 31)
    {
      unsigned int v8 = v6 >> v7++;
      if ((v8 & 2) == 0) {
        return (char *)snprintf(result, 8uLL, "&0x%x");
      }
    }
    return (char *)snprintf(result, 8uLL, "/%d");
  }
  else
  {
    *uint64_t result = 0;
  }
  return result;
}

const void *isDictionary(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFDictionaryGetTypeID());
  }
  return result;
}

const void *isArray(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFArrayGetTypeID());
  }
  return result;
}

const void *isString(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFStringGetTypeID());
  }
  return result;
}

const void *isNumber(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFNumberGetTypeID());
  }
  return result;
}

const void *isData(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFDataGetTypeID());
  }
  return result;
}

BOOL get_array_option(const __CFDictionary *a1, const void *a2, const void *a3, CFIndex a4, char *a5, unsigned int a6, _DWORD *a7, const char *a8)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, a2);
  if (isDictionary(Value)
    && (CFArrayRef v15 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)Value, a3), isArray(v15))
    && (CFIndex Count = CFArrayGetCount(v15), Count > a4))
  {
    CFIndex v17 = Count;
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v15, a4);
    if (isString(ValueAtIndex))
    {
      *a5 = 0;
      CFStringGetCString(ValueAtIndex, a5, a6, 0);
      *a7 = strlen(a5);
    }
    return v17 > a4 + 1;
  }
  else
  {
    strlcpy(a5, a8, a6);
    int v20 = strlen(a5);
    BOOL result = 0;
    *a7 = v20;
  }
  return result;
}

size_t get_str_option(const __CFDictionary *a1, const void *a2, const void *a3, char *a4, unsigned int a5, _DWORD *a6, const char *a7)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, a2);
  if (isDictionary(Value)
    && (*a4 = 0, CFStringRef v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, a3), isString(v13)))
  {
    CFStringGetCString(v13, a4, a5, 0x8000100u);
  }
  else
  {
    strlcpy(a4, a7, a5);
  }
  size_t result = strlen(a4);
  *a6 = result;
  return result;
}

const void *get_cfstr_option(const __CFDictionary *a1, const void *a2, const void *a3)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, a2);
  if (!isDictionary(Value)) {
    return 0;
  }
  int v5 = CFDictionaryGetValue((CFDictionaryRef)Value, a3);
  if (!isString(v5)) {
    return 0;
  }
  return v5;
}

const void *get_int_option(const __CFDictionary *a1, const void *a2, const void *a3, _DWORD *a4, int a5)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, a2);
  size_t result = isDictionary(Value);
  if (result
    && (CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)Value, a3),
        size_t result = isNumber(v10),
        result))
  {
    return (const void *)CFNumberGetValue(v10, kCFNumberSInt32Type, a4);
  }
  else
  {
    *a4 = a5;
  }
  return result;
}

uint64_t GetIntFromDict(const __CFDictionary *a1, const void *a2, _DWORD *a3, int a4)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, a2);
  if (isNumber(Value) && CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, a3)) {
    return 1;
  }
  uint64_t result = 0;
  *a3 = a4;
  return result;
}

size_t GetStrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4, const char *a5)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!isString(Value) || !CFStringGetCString(Value, a3, a4, 0x8000100u)) {
    strncpy(a3, a5, a4);
  }
  return strlen(a3);
}

BOOL GetStrAddrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  return isString(Value) && CFStringGetCString(Value, a3, a4, 0x8000100u);
}

const void *GetStrNetFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  uint64_t result = isString(Value);
  if (result)
  {
    uint64_t result = (const void *)CFStringGetCString(Value, a3, a4, 0x8000100u);
    if (result) {
      return (const void *)(inet_network(a3) - 1 < 0xFFFFFFFE);
    }
  }
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindWithOptions(theString, stringToFind, rangeToSearch, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

uint64_t SCLog()
{
  return _SCLog();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return _SCNetworkReachabilityCreateWithName(allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionGetPacketContextActive()
{
  return __CTServerConnectionGetPacketContextActive();
}

uint64_t _CTServerConnectionSetPacketContextActiveByServiceType()
{
  return __CTServerConnectionSetPacketContextActiveByServiceType();
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

uint64_t __ipsec_set_strerror()
{
  return ___ipsec_set_strerror();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void add_fd()
{
  while (1)
    ;
}

void add_notifier()
{
  while (1)
    ;
}

char *__cdecl addr2ascii(int a1, const void *a2, int a3, char *a4)
{
  return _addr2ascii(a1, a2, a3, a4);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return _bcmp(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

void check_vpn_interface_address_change()
{
  while (1)
    ;
}

void check_vpn_interface_alternate()
{
  while (1)
    ;
}

void check_vpn_interface_or_service_unrecoverable()
{
  while (1)
    ;
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

void dbglog()
{
  while (1)
    ;
}

int dup(int a1)
{
  return _dup(a1);
}

void error()
{
  while (1)
    ;
}

int execle(const char *__path, const char *__arg0, ...)
{
  return _execle(__path, __arg0);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return _fscanf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

void generic_disestablish_ppp()
{
  while (1)
    ;
}

void generic_establish_ppp()
{
  while (1)
    ;
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

int getdtablesize(void)
{
  return _getdtablesize();
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return _gethostbyname(a1);
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

pid_t getpid(void)
{
  return _getpid();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

in_addr_t inet_addr(const char *a1)
{
  return _inet_addr(a1);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return _inet_aton(a1, a2);
}

in_addr_t inet_network(const char *a1)
{
  return _inet_network(a1);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return _inet_ntoa(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

caddr_t ipsec_set_policy(char *a1, int a2)
{
  return _ipsec_set_policy(a1, a2);
}

void is_ready_fd()
{
  while (1)
    ;
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

void l2tp_clear_nat_port_mapping()
{
  while (1)
    ;
}

void l2tp_set_nat_port_mapping()
{
  while (1)
    ;
}

void lcp_lowerdown()
{
  while (1)
    ;
}

void link_terminated()
{
  while (1)
    ;
}

void log_vpn_interface_address_event()
{
  while (1)
    ;
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

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

void new_phase()
{
  while (1)
    ;
}

void notice()
{
  while (1)
    ;
}

uint64_t nw_nat64_copy_prefixes()
{
  return _nw_nat64_copy_prefixes();
}

uint64_t nw_nat64_extract_v4()
{
  return _nw_nat64_extract_v4();
}

uint64_t nw_nat64_synthesize_v6()
{
  return _nw_nat64_synthesize_v6();
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

void ppp_auxiliary_probe_stop()
{
  while (1)
    ;
}

void ppp_block_public_nat_port_mapping_timer()
{
  while (1)
    ;
}

void ppp_process_auxiliary_probe_input()
{
  while (1)
    ;
}

void ppp_process_nat_port_mapping_events()
{
  while (1)
    ;
}

void ppp_session_clear()
{
  while (1)
    ;
}

void ppp_unblock_public_nat_port_mapping_timer()
{
  while (1)
    ;
}

void ppp_variable_echo_start()
{
  while (1)
    ;
}

int pthread_cancel(pthread_t a1)
{
  return _pthread_cancel(a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return _pthread_detach(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return _recvfrom(a1, a2, a3, a4, a5, a6);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

void remove_fd()
{
  while (1)
    ;
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

void set_network_signature()
{
  while (1)
    ;
}

void set_server_peer()
{
  while (1)
    ;
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

void timeout(int a1)
{
  while (1)
    ;
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

void untimeout()
{
  while (1)
    ;
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

void warning()
{
  while (1)
    ;
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}