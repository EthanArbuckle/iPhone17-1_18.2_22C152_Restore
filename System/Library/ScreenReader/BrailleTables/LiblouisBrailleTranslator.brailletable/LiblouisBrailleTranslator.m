void sub_1108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1124(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t v8 = a3 - v7;
  if (a3 > v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(void **)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    id v12 = v10;
    v13 = objc_msgSend(v9, "substringWithRange:", v7, v8);
    [v11 appendString:v13];

    do
    {
      unint64_t v20 = v7;
      [v12 appendBytes:&v20 length:8];
      ++v7;
    }
    while (a3 != v7);
  }
  v14 = (void *)CEMEmojiTokenCopyName();
  if ([v14 length])
  {
    v15 = [@":" stringByAppendingString:v14];
    v16 = [v15 stringByAppendingString:@":"];

    v17 = (char *)[v16 length];
    [*(id *)(a1 + 40) appendString:v16];
    if (v17)
    {
      for (i = 0; i != v17; ++i)
      {
        unint64_t v20 = a3;
        [*(id *)(a1 + 48) appendBytes:&v20 length:8];
        __int16 v19 = 0;
        objc_msgSend(*(id *)(a1 + 56), "replaceBytesInRange:withBytes:length:", &i[a3], 1, &v19, 2);
      }
    }
    v14 = v16;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3 + a4;
}

id LBTLog()
{
  if (qword_25118 != -1) {
    dispatch_once(&qword_25118, &stru_20348);
  }
  v0 = (void *)qword_25110;

  return v0;
}

void sub_18BC(id a1)
{
  qword_25110 = (uint64_t)os_log_create("com.apple.Accessibility", "BRLTranslation.liblouis");

  _objc_release_x1();
}

void sub_1990(int a1, uint64_t a2)
{
  if (a1 <= 29999)
  {
    if (!a1 || a1 == 10000)
    {
      v3 = LBTLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_1B9F4();
      }
      goto LABEL_15;
    }
    if (a1 != 20000) {
      return;
    }
LABEL_13:
    v3 = LBTLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = a2;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
    }
LABEL_15:

    return;
  }
  if (a1 == 30000) {
    goto LABEL_13;
  }
  if (a1 == 40000 || a1 == 50000)
  {
    v3 = LBTLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1BA68();
    }
    goto LABEL_15;
  }
}

void sub_2C6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_2C84(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

double _lou_resetPassVariables()
{
  qword_251E0 = 0;
  double result = 0.0;
  xmmword_251C0 = 0u;
  unk_251D0 = 0u;
  xmmword_251A0 = 0u;
  unk_251B0 = 0u;
  xmmword_25180 = 0u;
  unk_25190 = 0u;
  xmmword_25160 = 0u;
  unk_25170 = 0u;
  xmmword_25140 = 0u;
  unk_25150 = 0u;
  xmmword_25120 = 0u;
  *(_OWORD *)algn_25130 = 0u;
  return result;
}

uint64_t _lou_handlePassVariableTest(uint64_t a1, int *a2, _DWORD *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a2;
  unsigned int v5 = *(unsigned __int16 *)(a1 + 2 * v4);
  if (v5 <= 0x3D)
  {
    if (v5 == 60)
    {
      if (*((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2 * ((int)v4 + 1))) < (int)*(unsigned __int16 *)(a1 + 2 * ((int)v4 + 2))) {
        goto LABEL_7;
      }
    }
    else
    {
      if (v5 != 61) {
        return v3;
      }
      if (*((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2 * ((int)v4 + 1))) == *(unsigned __int16 *)(a1 + 2 * ((int)v4 + 2))) {
        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  switch(v5)
  {
    case 0x3Eu:
      if (*((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2 * ((int)v4 + 1))) > (int)*(unsigned __int16 *)(a1 + 2 * ((int)v4 + 2))) {
        goto LABEL_7;
      }
      goto LABEL_6;
    case 0x82u:
      if (*((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2 * ((int)v4 + 1))) <= (int)*(unsigned __int16 *)(a1 + 2 * ((int)v4 + 2))) {
        goto LABEL_7;
      }
      goto LABEL_6;
    case 0x83u:
      if (*((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2 * ((int)v4 + 1))) >= (int)*(unsigned __int16 *)(a1 + 2 * ((int)v4 + 2)))
      {
LABEL_7:
        *a2 = v4 + 3;
        return 1;
      }
LABEL_6:
      *a3 = 0;
      LODWORD(v4) = *a2;
      goto LABEL_7;
  }
  return v3;
}

uint64_t _lou_handlePassVariableAction(uint64_t a1, int *a2)
{
  uint64_t v2 = *a2;
  int v3 = *(unsigned __int16 *)(a1 + 2 * v2);
  switch(v3)
  {
    case '+':
      uint64_t v5 = *(unsigned __int16 *)(a1 + 2 * ((int)v2 + 1));
      int v6 = *((_DWORD *)&xmmword_25120 + v5) + 1;
LABEL_9:
      *((_DWORD *)&xmmword_25120 + v5) = v6;
      int v4 = 2;
      goto LABEL_10;
    case '-':
      uint64_t v5 = *(unsigned __int16 *)(a1 + 2 * ((int)v2 + 1));
      int v7 = *((_DWORD *)&xmmword_25120 + v5);
      if (v7 <= 1) {
        int v7 = 1;
      }
      int v6 = v7 - 1;
      goto LABEL_9;
    case '=':
      *((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2 * ((int)v2 + 1))) = *(unsigned __int16 *)(a1 + 2 * ((int)v2 + 2));
      int v4 = 3;
LABEL_10:
      *a2 = v2 + v4;
      return 1;
  }
  return 0;
}

char *lou_setDataPath(const char *a1)
{
  _lou_logMessage(30000, "warning: lou_setDataPath is deprecated.");
  qword_259E8 = 0;
  if (!a1 || strlen(a1) > 0x7FF) {
    return 0;
  }
  uint64_t v2 = &byte_251E8;
  __strcpy_chk();
  qword_259E8 = (uint64_t)&byte_251E8;
  return v2;
}

uint64_t lou_getDataPath()
{
  return qword_259E8;
}

uint64_t _lou_getALine(_DWORD *a1)
{
  a1[9] = 0;
  while (1)
  {
    do
      int v2 = sub_2FD8((uint64_t)a1);
    while (v2 == 13);
    if (v2 == -1 || v2 == 10) {
      break;
    }
    uint64_t v3 = a1[9];
    if ((int)v3 >= 2047)
    {
      *((_WORD *)a1 + v3 + 26) = 0;
      a1[10] = 0;
LABEL_11:
      ++a1[6];
      return 1;
    }
    a1[9] = v3 + 1;
    *((_WORD *)a1 + (int)v3 + 26) = v2;
  }
  uint64_t v4 = (int)a1[9];
  *((_WORD *)a1 + v4 + 26) = 0;
  a1[10] = 0;
  if (v2 != -1) {
    goto LABEL_11;
  }
  uint64_t result = 0;
  if (v4) {
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_2FD8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 28) != 3 || *(_DWORD *)(a1 + 32) != 2)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v3 = fgetc(*(FILE **)(a1 + 16));
        uint64_t v2 = v3;
        if (v3 == -1) {
          return v2;
        }
        int v4 = *(_DWORD *)(a1 + 32);
        if (v4 <= 1)
        {
          *(_DWORD *)(a1 + 4 * v4 + 44) = v3;
          int v4 = *(_DWORD *)(a1 + 32);
        }
        int v5 = v4 + 1;
        *(_DWORD *)(a1 + 32) = v5;
        if (v5 != 2) {
          break;
        }
        uint64_t v2 = *(unsigned int *)(a1 + 44);
        if (v2 == 255)
        {
          if (*(_DWORD *)(a1 + 48) != 254) {
            goto LABEL_26;
          }
          int v6 = 2;
        }
        else
        {
          if (v2 != 254)
          {
            if ((int)v2 <= 127 && *(int *)(a1 + 48) <= 127)
            {
              *(_DWORD *)(a1 + 28) = 3;
              return v2;
            }
LABEL_26:
            sub_567C(a1, "encoding is neither big-endian, little-endian nor ASCII 8.");
            return 0xFFFFFFFFLL;
          }
          if (*(_DWORD *)(a1 + 48) != 255) {
            goto LABEL_26;
          }
          int v6 = 1;
        }
        *(_DWORD *)(a1 + 28) = v6;
      }
      int v7 = *(_DWORD *)(a1 + 28);
      if (v7 == 3) {
        return v2;
      }
      if (v7 == 2) {
        break;
      }
      if (v7 == 1)
      {
        int v9 = fgetc(*(FILE **)(a1 + 16));
        BOOL v10 = v9 == -1;
        unsigned __int16 v11 = v9 | ((_WORD)v2 << 8);
        goto LABEL_20;
      }
    }
    int v8 = fgetc(*(FILE **)(a1 + 16));
    BOOL v10 = v8 == -1;
    unsigned __int16 v11 = v2 | ((_WORD)v8 << 8);
LABEL_20:
    if (v10) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v11;
    }
  }
  *(_DWORD *)(a1 + 32) = 3;
  return *(unsigned int *)(a1 + 48);
}

uint64_t _lou_getDotsForChar(int a1, uint64_t a2)
{
  if (!a2) {
    return 0x8000;
  }
  int v4 = (unsigned int *)(a2 + 4 * _lou_charHash(a1) + 8);
  while (1)
  {
    uint64_t v5 = *v4;
    if (!v5) {
      break;
    }
    int v4 = (unsigned int *)(a2 + 8 * v5 + 8992);
    if (*((unsigned __int16 *)v4 + 2) == a1) {
      return *((unsigned __int16 *)v4 + 3);
    }
  }
  return 0x8000;
}

uint64_t _lou_getCharForDots(int a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  int v4 = (unsigned int *)(a2 + 4 * _lou_charHash(a1) + 4500);
  while (1)
  {
    uint64_t v5 = *v4;
    if (!v5) {
      break;
    }
    int v4 = (unsigned int *)(a2 + 8 * v5 + 8992);
    if (*((unsigned __int16 *)v4 + 2) == a1) {
      return *((unsigned __int16 *)v4 + 3);
    }
  }
  return 0;
}

uint64_t _lou_findOpcodeNumber(const char *a1)
{
  int v2 = dword_259F0;
  int v3 = strlen(a1);
  uint64_t v4 = dword_259F0;
  while (v3 != word_259F4[v4] || strcasecmp(a1, off_20368[v4]))
  {
    if ((v4 + 1) <= 0x74) {
      uint64_t v4 = (v4 + 1);
    }
    else {
      uint64_t v4 = 0;
    }
    if (v4 == v2) {
      return 117;
    }
  }
  dword_259F0 = v4;
  return v4;
}

char *_lou_findOpcodeName(unsigned int a1)
{
  if (a1 < 0x75) {
    return off_20368[a1];
  }
  v1 = byte_25ADE;
  __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", a1);
  return v1;
}

uint64_t _lou_extParseChars(uint64_t a1)
{
  v1 = (unsigned char *)__chkstk_darwin(a1);
  int v3 = v2;
  memset(v12, 0, 510);
  LOBYTE(v4) = *v1;
  if (*v1)
  {
    unint64_t v5 = 0;
    do
    {
      v12[v5] = (char)v4;
      unint64_t v6 = v5 + 1;
      if (v5 > 0x7FD) {
        break;
      }
      int v4 = v1[++v5];
    }
    while (v4);
    __int16 v7 = v6;
  }
  else
  {
    __int16 v7 = 0;
    unint64_t v6 = 0;
  }
  memset(v10, 0, 512);
  v12[v6] = 0;
  __int16 v11 = v7;
  if (!sub_349C(0, v10, &v11)) {
    return 0;
  }
  uint64_t v8 = LOWORD(v10[0]);
  if (LOWORD(v10[0])) {
    memcpy(v3, (char *)v10 + 2, 2 * LOWORD(v10[0]));
  }
  return v8;
}

uint64_t sub_349C(uint64_t a1, _WORD *a2, _WORD *a3)
{
  int v4 = (unsigned __int16)*a3;
  if (*a3)
  {
    __int16 v7 = 0;
    int v8 = 0;
    int v9 = 0;
    while (1)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v8 <= 2047 ? 2047 : v8;
      LODWORD(v12) = v9;
      while (1)
      {
        uint64_t v13 = (int)v12;
        v14 = &a3[(int)v12];
        uint64_t v12 = (int)v12 + 1;
        unsigned int v15 = *((unsigned __int8 *)v14 + 2);
        if (v15 >= 0x80) {
          break;
        }
        if (v15 == 92)
        {
          v16 = &a3[v12];
          unsigned int v15 = (unsigned __int16)v16[1];
          v17 = "\\Zhhhhhhhh (with a capital 'Z') is deprecated.";
          switch(v16[1])
          {
            case 'X':
              sub_573C(a1, "\\Xhhhh (with a capital 'X') is deprecated.");
              int v4 = (unsigned __int16)*a3;
              goto LABEL_11;
            case 'Y':
              v17 = "\\Yhhhhh (with a capital 'Y') is deprecated.";
              goto LABEL_24;
            case 'Z':
LABEL_24:
              sub_573C(a1, v17);
              goto LABEL_25;
            case '[':
            case ']':
            case '^':
            case '_':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'o':
            case 'p':
            case 'q':
            case 'u':
              goto LABEL_70;
            case '\\':
              goto LABEL_26;
            case 'e':
              LOWORD(v15) = 27;
              goto LABEL_26;
            case 'f':
              LOWORD(v15) = 12;
              goto LABEL_26;
            case 'n':
              LOWORD(v15) = 10;
              goto LABEL_26;
            case 'r':
              LOWORD(v15) = 13;
              goto LABEL_26;
            case 's':
              LOWORD(v15) = 32;
              goto LABEL_26;
            case 't':
              LOWORD(v15) = 9;
              goto LABEL_26;
            case 'v':
              LOWORD(v15) = 11;
              goto LABEL_26;
            case 'w':
              LOWORD(v15) = -1;
              goto LABEL_26;
            case 'x':
LABEL_11:
              if (v4 - (int)v12 < 5) {
                goto LABEL_26;
              }
              int v18 = 0;
              __int16 v19 = &a3[v13 + 3];
              uint64_t v20 = 16;
              while (2)
              {
                int v22 = *v19++;
                int v21 = v22;
                if ((v22 - 48) < 0xA)
                {
                  int v23 = -48;
                  goto LABEL_19;
                }
                if ((v21 - 97) < 6)
                {
                  int v23 = -87;
                  goto LABEL_19;
                }
                if ((v21 - 65) < 6)
                {
                  int v23 = -55;
LABEL_19:
                  v20 -= 4;
                  v18 |= (v23 + v21) << v20;
                  if (!v20)
                  {
                    LOWORD(v15) = v18;
                    goto LABEL_39;
                  }
                  continue;
                }
                break;
              }
              sub_567C(a1, "invalid %d-digit hexadecimal number", 4);
              LOWORD(v15) = -1;
LABEL_39:
              LODWORD(v12) = v13 + 5;
              goto LABEL_26;
            case 'y':
            case 'z':
LABEL_25:
              sub_567C(a1, "liblouis has not been compiled for 32-bit Unicode");
              goto LABEL_26;
            default:
              if (v15 != 34)
              {
LABEL_70:
                sub_567C(a1, "invalid escape sequence '\\%c'", (unsigned __int16)v16[1]);
                uint64_t result = 0;
                LOWORD(v8) = v7;
                goto LABEL_68;
              }
              LOWORD(v15) = 28;
LABEL_26:
              LODWORD(v12) = v12 + 1;
              break;
          }
        }
        if (v10 == v11)
        {
          sub_567C(a1, "Token too long");
          uint64_t result = 0;
          LOWORD(v8) = 2047;
          goto LABEL_68;
        }
        LOWORD(v8) = v10 + 1;
        a2[v10 + 1] = v15;
        int v4 = (unsigned __int16)*a3;
        ++v10;
        if ((int)v12 >= v4) {
          goto LABEL_67;
        }
      }
      int v24 = 7;
      while (dword_1CC20[--v24] > v15)
      {
        if (v24 <= 1)
        {
          int v24 = 0;
          break;
        }
      }
      unsigned int v25 = (255 - dword_1CC20[v24]) & v15;
      if (v24 < 1 || (int)v13 >= 2046)
      {
        int v9 = v12;
        int v26 = v10;
      }
      else
      {
        int v26 = v10;
        unsigned int v27 = 1;
        int v9 = v12;
        do
        {
          if (v9 >= (unsigned __int16)*a3) {
            break;
          }
          if (v26 >= 2047) {
            goto LABEL_69;
          }
          unsigned int v28 = (unsigned __int16)a3[v9 + 1];
          if (v28 >= 0x80 && (v28 & 0x40) == 0)
          {
            int v31 = v9;
            unsigned int v25 = v28 & 0x3F | (v25 << 6);
          }
          else
          {
            sub_573C(a1, "invalid UTF-8. Assuming Latin-1.");
            v30 = &a2[v26++];
            v30[1] = a3[(int)v12 + 1];
            int v31 = v12;
          }
          int v9 = v31 + 1;
          if (v27 >= v24) {
            break;
          }
          ++v27;
        }
        while (v31 < 2046);
      }
      if (v26 > 2046) {
        break;
      }
      if (v25 >= 0xFFFF) {
        __int16 v32 = -1;
      }
      else {
        __int16 v32 = v25;
      }
      int v8 = v26 + 1;
      a2[v26 + 1] = v32;
      int v4 = (unsigned __int16)*a3;
      __int16 v7 = v10;
      if (v9 >= v4) {
        goto LABEL_67;
      }
    }
LABEL_69:
    sub_567C(a1, "Token too long");
    uint64_t result = 0;
    LOWORD(v8) = v10;
  }
  else
  {
    LOWORD(v8) = 0;
LABEL_67:
    uint64_t result = 1;
  }
LABEL_68:
  *a2 = v8;
  return result;
}

uint64_t _lou_extParseDots(uint64_t a1)
{
  v1 = (unsigned char *)__chkstk_darwin(a1);
  int v3 = v2;
  memset(v13, 0, 510);
  LOBYTE(v4) = *v1;
  if (*v1)
  {
    unint64_t v5 = 0;
    do
    {
      v13[v5] = (char)v4;
      unint64_t v6 = v5 + 1;
      if (v5 > 0x7FD) {
        break;
      }
      int v4 = v1[++v5];
    }
    while (v4);
    __int16 v7 = v6;
  }
  else
  {
    __int16 v7 = 0;
    unint64_t v6 = 0;
  }
  memset(v11, 0, 512);
  v13[v6] = 0;
  __int16 v12 = v7;
  sub_3A80(0, v11, &v12);
  if (dword_262E0)
  {
    uint64_t v8 = 0;
    dword_262E0 = 0;
  }
  else
  {
    uint64_t v8 = LOWORD(v11[0]);
    if (LOWORD(v11[0]))
    {
      memcpy(v3, (char *)v11 + 2, 2 * LOWORD(v11[0]));
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = 0;
    }
    *((_WORD *)v3 + v9) = 0;
  }
  return v8;
}

uint64_t sub_3A80(uint64_t a1, _WORD *a2, _WORD *a3)
{
  unsigned int v4 = (unsigned __int16)*a3;
  if (!*a3) {
    goto LABEL_26;
  }
  uint64_t v5 = 0;
  int v6 = 0;
  while (2)
  {
    __int16 v9 = a3[v5 + 1];
    int v7 = 1;
    switch(v9)
    {
      case '0':
        if (!v5) {
          goto LABEL_24;
        }
        goto LABEL_27;
      case '1':
        goto LABEL_20;
      case '2':
        int v7 = 2;
        goto LABEL_20;
      case '3':
        int v7 = 4;
        goto LABEL_20;
      case '4':
        int v7 = 8;
        goto LABEL_20;
      case '5':
        int v7 = 16;
        goto LABEL_20;
      case '6':
        int v7 = 32;
        goto LABEL_20;
      case '7':
        int v7 = 64;
        goto LABEL_20;
      case '8':
        int v7 = 128;
        goto LABEL_20;
      case '9':
        int v7 = 256;
        goto LABEL_20;
      case 'A':
      case 'a':
        int v7 = 512;
        goto LABEL_20;
      case 'B':
      case 'b':
        int v7 = 1024;
        goto LABEL_20;
      case 'C':
      case 'c':
        int v7 = 2048;
        goto LABEL_20;
      case 'D':
      case 'd':
        int v7 = 4096;
        goto LABEL_20;
      case 'E':
      case 'e':
        int v7 = 0x2000;
        goto LABEL_20;
      case 'F':
      case 'f':
        int v7 = 0x4000;
LABEL_20:
        if (v5 && !v6) {
          goto LABEL_27;
        }
        if ((v7 & v6) == 0)
        {
          v6 |= v7;
LABEL_24:
          if (++v5 >= (unint64_t)v4)
          {
            if (v5)
            {
              a2[1] = v6 | 0x8000;
              *a2 = 1;
              return 1;
            }
LABEL_26:
            sub_567C(a1, "missing cell specification.");
            return 0;
          }
          continue;
        }
        sub_567C(a1, "dot specified more than once.");
        return 0;
      default:
LABEL_27:
        _lou_showString((uint64_t)&v9, 1, 0);
        sub_567C(a1, "invalid dot number %s.");
        return 0;
    }
  }
}

uint64_t lou_readCharFromFile(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (*a2 == 1)
    {
      *a2 = 0;
      qword_262E8 = result;
      dword_26308 = 0;
      qword_26300 = 0;
      qword_262F8 = (uint64_t)fopen((const char *)result, "r");
      if (!qword_262F8)
      {
        _lou_logMessage(40000, "Cannot open file '%s'", (const char *)qword_262E8);
LABEL_8:
        *a2 = 1;
        return 0xFFFFFFFFLL;
      }
    }
    else if (!qword_262F8)
    {
      goto LABEL_8;
    }
    uint64_t result = sub_2FD8((uint64_t)&qword_262E8);
    if (result != -1) {
      return result;
    }
    fclose((FILE *)qword_262F8);
    qword_262F8 = 0;
    goto LABEL_8;
  }
  return result;
}

char *_lou_getTablePath()
{
  v0 = getenv("LOUIS_TABLEPATH");
  if (v0)
  {
    v1 = &v6;
    if (*v0)
    {
      int v2 = 0;
      v1 = &v7[__sprintf_chk(&v6, 0, 0x800uLL, ",%s", v0) - 1];
    }
    else
    {
      int v2 = 1;
    }
  }
  else
  {
    int v2 = 1;
    v1 = &v6;
  }
  if (qword_259E8) {
    BOOL v3 = byte_251E8 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    v1 += sprintf(v1, ",%s%c%s%c%s", (const char *)qword_259E8, 47, "liblouis", 47, "tables");
  }
  if (v2) {
    sprintf(v1, ",%s", "./tables");
  }
  if (v6) {
    unsigned int v4 = v7;
  }
  else {
    unsigned int v4 = ".";
  }
  return strdup(v4);
}

void **_lou_defaultTableResolver(const char *a1, const char *a2)
{
  TablePath = _lou_getTablePath();
  int v5 = 0;
  for (i = a1; *i == 44; ++i)
  {
    ++v5;
LABEL_6:
    ;
  }
  if (*i) {
    goto LABEL_6;
  }
  int v7 = (void **)malloc_type_calloc(v5 + 2, 8uLL, 0x10040436913F5uLL);
  uint64_t v8 = v7;
  if (!v7) {
    _lou_outOfMemory();
  }
  __int16 v9 = strdup(a1);
  uint64_t v10 = 0;
  int v31 = v9;
  while (1)
  {
    for (j = v9 + 1; ; ++j)
    {
      int v12 = *(j - 1);
      if (!*(j - 1) || v12 == 44) {
        break;
      }
    }
    *(j - 1) = 0;
    if (!v9 || !*v9) {
      break;
    }
    uint64_t v32 = v10;
    uint64_t v13 = (char *)malloc_type_malloc(0x1000uLL, 0x11BA60ABuLL);
    if (!a2) {
      goto LABEL_29;
    }
    if (strlen(a2) > 0xFFF) {
      goto LABEL_57;
    }
    __strcpy_chk();
    LODWORD(v14) = strlen(v13);
    if ((v14 & 0x80000000) == 0)
    {
      uint64_t v14 = v14;
      while (1)
      {
        int v15 = v13[v14];
        if (v15 == 47 || v15 == 92) {
          break;
        }
        if (v14-- <= 0)
        {
          LODWORD(v14) = -1;
          break;
        }
      }
    }
    v13[(int)v14 + 1] = 0;
    size_t v17 = strlen(v13);
    if (strlen(v9) + v17 > 0xFFF) {
      goto LABEL_57;
    }
    __strcat_chk();
    if (stat(v13, (stat *)&unk_273C0) || (word_273C4 & 0x4000) != 0)
    {
LABEL_29:
      if (strlen(v9) > 0xFFF) {
        goto LABEL_57;
      }
      __strcpy_chk();
      if (stat(v13, (stat *)&unk_273C0) || (word_273C4 & 0x4000) != 0)
      {
        if (*TablePath)
        {
          unsigned int v27 = a2;
          v29 = v8;
          v30 = TablePath;
          __int16 v19 = strdup(TablePath);
          unsigned int v28 = v19;
          while (1)
          {
            for (uint64_t k = 0; ; ++k)
            {
              int v21 = v19[k];
              if (!v19[k] || v21 == 44) {
                break;
              }
            }
            v19[k] = 0;
            int v22 = k ? v19 : ".";
            size_t v23 = strlen(v22);
            if (v23 + strlen(v9) - 4095 < 0xFFFFFFFFFFFFF000) {
              break;
            }
            __sprintf_chk(v13, 0, 0x1000uLL, "%s%c%s", v22, 47, v9);
            if (!stat(v13, (stat *)&unk_273C0) && (word_273C4 & 0x4000) == 0)
            {
LABEL_50:
              _lou_logMessage(10000, "found table %s", v13);
              free(v28);
              uint64_t v8 = v29;
              TablePath = v30;
              a2 = v27;
              goto LABEL_51;
            }
            if (!v21) {
              break;
            }
            size_t v24 = strlen(v22);
            if (v24 + strlen(v9) - 4079 < 0xFFFFFFFFFFFFF000) {
              break;
            }
            __sprintf_chk(v13, 0, 0x1000uLL, "%s%c%s%c%s%c%s", v22, 47, "liblouis", 47, "tables", 47, v9);
            if (!stat(v13, (stat *)&unk_273C0) && (word_273C4 & 0x4000) == 0) {
              goto LABEL_50;
            }
            v19 += k + 1;
          }
          free(v28);
          uint64_t v8 = v29;
          TablePath = v30;
        }
LABEL_57:
        free(v13);
        LODWORD(v10) = v32;
        break;
      }
      _lou_logMessage(10000, "found table %s", v13);
LABEL_51:
      uint64_t v18 = v32;
      v8[v32] = v13;
      if (!v13) {
        goto LABEL_59;
      }
    }
    else
    {
      _lou_logMessage(10000, "found table %s", v13);
      uint64_t v18 = v10;
      v8[v10] = v13;
    }
    uint64_t v10 = v18 + 1;
    if (!v12)
    {
      free(TablePath);
      free(v31);
      v8[v10] = 0;
      return v8;
    }
    if (!v18) {
      a2 = v9;
    }
    __int16 v9 = j;
  }
  v8[v10] = 0;
LABEL_59:
  _lou_logMessage(40000, "Cannot resolve table '%s'", v9);
  unsigned int v25 = getenv("LOUIS_TABLEPATH");
  if (v25 && *v25) {
    _lou_logMessage(40000, "LOUIS_TABLEPATH=%s", v25);
  }
  free(TablePath);
  free(v31);
  sub_4354(v8);
  return 0;
}

void sub_4354(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2)
    {
      BOOL v3 = a1 + 1;
      do
      {
        free(v2);
        unsigned int v4 = *v3++;
        int v2 = v4;
      }
      while (v4);
    }
    free(a1);
  }
}

void *_lou_resolveTable(const char *a1, const char *a2)
{
  int v2 = ((void **(*)(const char *, const char *))off_24F70[0])(a1, a2);
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = -2;
    do
    {
      char v6 = v2[v4];
      ++v5;
      ++v4;
    }
    while (v6);
    int v7 = malloc_type_malloc((v4 * 8) & 0x7FFFFFFF8, 0x10040436913F5uLL);
    v7[v4 - 1] = 0;
    if (v5 != -1)
    {
      do
      {
        v7[v5] = strdup((const char *)v3[v5]);
        --v5;
      }
      while (v5 != -1);
    }
  }
  else
  {
    int v7 = 0;
  }
  if ((void **(*)(const char *, const char *))off_24F70[0] == _lou_defaultTableResolver) {
    sub_4354(v3);
  }
  return v7;
}

uint64_t (*lou_registerTableResolver(uint64_t (*result)()))()
{
  off_24F70[0] = result;
  return result;
}

void *lou_getEmphClasses(char *a1)
{
  uint64_t TranslationTable = _lou_getTranslationTable(a1);
  if (!TranslationTable) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  do
  {
    uint64_t v3 = *(void *)(TranslationTable + 1232 + 8 * v2);
    if (!v3) {
      break;
    }
    *((void *)v8 + v2++) = v3;
  }
  while (v2 != 10);
  *((void *)v8 + v2) = 0;
  size_t v4 = (8 * v2 + 8);
  uint64_t v5 = malloc_type_malloc(v4, 0xB45D7F21uLL);
  char v6 = v5;
  if (v5) {
    memcpy(v5, v8, v4);
  }
  return v6;
}

uint64_t _lou_getTranslationTable(char *a1)
{
  uint64_t v2 = 0;
  getTable(a1, 0, &v2, 0);
  uint64_t result = v2;
  if (v2)
  {
    if (sub_4C1C(v2)) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

const char **_lou_getTable(char *a1, const char *a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  getTable(a1, a2, &v9, &v8);
  uint64_t result = v9;
  if (v9)
  {
    uint64_t result = sub_4C1C((uint64_t)v9);
    uint64_t v7 = (uint64_t)v9;
    if (!result) {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a3 = v7;
  *a4 = v8;
  return result;
}

void getTable(char *__s, const char *a2, void *a3, void *a4)
{
  if (__s && *__s)
  {
    if (!a2)
    {
LABEL_14:
      a4 = 0;
      if (!a3) {
        goto LABEL_15;
      }
      goto LABEL_8;
    }
  }
  else
  {
    a3 = 0;
    if (!a2) {
      goto LABEL_14;
    }
  }
  if (!*a2) {
    goto LABEL_14;
  }
  if (!a3)
  {
LABEL_15:
    int v8 = 0;
LABEL_16:
    if (a4) {
      goto LABEL_17;
    }
LABEL_26:
    int v12 = 0;
    goto LABEL_27;
  }
LABEL_8:
  int v8 = strlen(__s);
  *a3 = 0;
  uint64_t v9 = qword_27320;
  if (!qword_27320) {
    goto LABEL_16;
  }
  uint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = (uint64_t *)v9;
    if (*(_DWORD *)(v9 + 16) == v8 && !memcmp((const void *)(v9 + 20), __s, v8)) {
      break;
    }
    uint64_t v9 = *v11;
    uint64_t v10 = v11;
    if (!*v11) {
      goto LABEL_16;
    }
  }
  if (v10)
  {
    uint64_t *v10 = *v11;
    *uint64_t v11 = qword_27320;
    qword_27320 = (uint64_t)v11;
  }
  *a3 = v11[1];
  if (!a4) {
    goto LABEL_26;
  }
LABEL_17:
  int v12 = strlen(a2);
  *a4 = 0;
  uint64_t v13 = qword_27328;
  if (qword_27328)
  {
    uint64_t v14 = 0;
    while (1)
    {
      int v15 = (uint64_t *)v13;
      if (*(_DWORD *)(v13 + 16) == v12 && !memcmp((const void *)(v13 + 20), a2, v12)) {
        break;
      }
      uint64_t v13 = *v15;
      uint64_t v14 = v15;
      if (!*v15) {
        goto LABEL_27;
      }
    }
    if (v14)
    {
      uint64_t *v14 = *v15;
      uint64_t *v15 = qword_27328;
      qword_27328 = (uint64_t)v15;
    }
    *a4 = v15[1];
    if (!a3) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_27:
  if (!a3) {
    goto LABEL_29;
  }
LABEL_28:
  if (*a3)
  {
LABEL_29:
    if (!a4 || *a4) {
      return;
    }
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    if (a3 && !*a3) {
      v16 = (void **)&v42;
    }
    else {
      v16 = 0;
    }
    goto LABEL_41;
  }
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  v16 = (void **)&v42;
  if (!a4)
  {
LABEL_42:
    unint64_t v17 = 0;
    if (__s) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_41:
  if (*a4) {
    goto LABEL_42;
  }
  unint64_t v17 = (unint64_t)&v41;
  if (__s) {
    goto LABEL_46;
  }
LABEL_45:
  if (v16)
  {
LABEL_107:
    _lou_logMessage(40000, "%s could not be compiled", __s);
    return;
  }
LABEL_46:
  if (!a2 && v17 || !((unint64_t)v16 | v17)) {
    goto LABEL_107;
  }
  if (v16) {
    _WORD *v16 = 0;
  }
  if (v17) {
    *(void *)unint64_t v17 = 0;
  }
  v40 = (void **)v17;
  dword_27C50 = 0;
  dword_273B8 = 0;
  dword_262E0 = 0;
  if (!word_259F4[0])
  {
    for (uint64_t i = 0; i != 117; ++i)
      word_259F4[i] = strlen(off_20368[i]);
  }
  if (v16)
  {
    __int16 v19 = *v16;
    uint64_t v20 = v40;
    if (!*v16)
    {
      int v21 = malloc_type_malloc(0xF710uLL, 0xA8A8903EuLL);
      _WORD *v16 = v21;
      if (!v21)
      {
        sub_567C(0, "Not enough memory");
        if (*v16) {
          free(*v16);
        }
        _WORD *v16 = 0;
        _lou_outOfMemory();
      }
      bzero(v21, 0xF710uLL);
      __int16 v19 = *v16;
      *(void *)_WORD *v16 = 0x7B900000F710;
    }
    if (!v40)
    {
      v19[154] = 0;
      v19[1] = 0;
      v19[4] = 0;
      sub_54DC((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT");
      goto LABEL_87;
    }
  }
  else
  {
    uint64_t v20 = v40;
    if (!v40)
    {
      sub_54DC((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT");
      goto LABEL_95;
    }
  }
  if (!*v20)
  {
    int v22 = malloc_type_malloc(0x4650uLL, 0x7C9CC922uLL);
    *uint64_t v20 = v22;
    if (!v22)
    {
      sub_567C(0, "Not enough memory");
      if (*v20) {
        free(*v20);
      }
      *uint64_t v20 = 0;
      _lou_outOfMemory();
    }
    bzero(v22, 0x4650uLL);
    *(void *)*uint64_t v20 = 0x233000004650;
  }
  if (v16)
  {
    size_t v23 = *v16;
    v23[154] = 0;
    v23[1] = 0;
    v23[4] = 0;
    sub_54DC((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT");
    if (!strcmp(__s, a2))
    {
      size_t v24 = (void **)_lou_resolveTable(__s, 0);
      if (v24)
      {
        if (*v24)
        {
          uint64_t v25 = 1;
          do
          {
            if (!sub_5CE4()) {
              break;
            }
          }
          while (v24[v25++]);
        }
        goto LABEL_96;
      }
      goto LABEL_93;
    }
  }
  else
  {
    sub_54DC((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT");
  }
  size_t v24 = (void **)_lou_resolveTable(a2, 0);
  if (v24)
  {
    if (*v24)
    {
      uint64_t v27 = 1;
      while (sub_5CE4())
      {
        if (!v24[v27++]) {
          goto LABEL_86;
        }
      }
      goto LABEL_96;
    }
LABEL_86:
    sub_4354(v24);
    if (v16)
    {
LABEL_87:
      size_t v24 = (void **)_lou_resolveTable(__s, 0);
      if (v24)
      {
        if (*v24)
        {
          uint64_t v29 = 1;
          do
          {
            if (!sub_5CE4()) {
              break;
            }
          }
          while (v24[v29++]);
        }
        goto LABEL_96;
      }
      goto LABEL_93;
    }
LABEL_95:
    size_t v24 = 0;
    goto LABEL_96;
  }
LABEL_93:
  ++dword_262E0;
LABEL_96:
  sub_4354(v24);
  if (dword_273B8) {
    _lou_logMessage(30000, "%s: %d warnings issued", __s, dword_273B8);
  }
  if (dword_262E0)
  {
    _lou_logMessage(40000, "%d errors found.", dword_262E0);
    if (v16)
    {
      if (*v16) {
        sub_53CC((void **)*v16);
      }
      _WORD *v16 = 0;
    }
    if (v20)
    {
      if (*v20) {
        free(*v20);
      }
      *uint64_t v20 = 0;
    }
    goto LABEL_107;
  }
  if (v16)
  {
    uint64_t v31 = 0;
    uint64_t v32 = *v16;
    uint64_t v33 = (uint64_t)*v16 + 1992;
    do
    {
      if (!*(_DWORD *)(v33 + v31)) {
        *(_DWORD *)(v33 + v31) = 4;
      }
      v31 += 36;
    }
    while (v31 != 108);
    if (!v32[233]) {
      v32[233] = 1;
    }
  }
  if (v42)
  {
    v34 = malloc_type_malloc(v8 + 24, 0xF68D34E8uLL);
    uint64_t v35 = (uint64_t)v34;
    if (!v34) {
      _lou_outOfMemory();
    }
    void *v34 = qword_27320;
    uint64_t v36 = v42;
    v34[1] = v42;
    *((_DWORD *)v34 + 4) = v8;
    memcpy((char *)v34 + 20, __s, v8);
    qword_27320 = v35;
    *a3 = v36;
  }
  if (v41)
  {
    v37 = malloc_type_malloc(v12 + 24, 0x3DF57216uLL);
    uint64_t v38 = (uint64_t)v37;
    if (!v37) {
      _lou_outOfMemory();
    }
    void *v37 = qword_27328;
    uint64_t v39 = v41;
    v37[1] = v41;
    *((_DWORD *)v37 + 4) = v12;
    memcpy((char *)v37 + 20, a2, v12);
    qword_27328 = v38;
    *a4 = v39;
  }
}

const char **sub_4C1C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 924)) {
    return (const char **)(&dword_0 + 1);
  }
  uint64_t v3 = 0;
  while (1)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 4 * v3 + 13608);
    if (v4) {
      break;
    }
LABEL_8:
    if (++v3 == 1123)
    {
      for (uint64_t i = 0; i != 1123; ++i)
      {
        for (uint64_t j = *(unsigned int *)(a1 + 4 * i + 13608); j; uint64_t j = *(unsigned int *)(v7 + 12))
        {
          uint64_t v7 = a1 + 8 * j + 31616;
          if ((*(unsigned char *)(v7 + 24) & 2) != 0)
          {
            for (uint64_t k = *(unsigned int *)(v7 + 20); k; uint64_t k = *(unsigned int *)(v9 + 16))
            {
              uint64_t v9 = a1 + 8 * k + 31616;
              if ((*(_DWORD *)(v9 + 44) & 0xFFFFFFFE) == 0x5A)
              {
                uint64_t v10 = *(int *)(a1 + 3192);
                if ((int)v10 <= 255)
                {
                  __int16 v11 = *(_WORD *)(v9 + 54);
                  *(_DWORD *)(a1 + 3192) = v10 + 1;
                  *(_WORD *)(a1 + 2 * v10 + 2680) = v11;
                }
              }
            }
          }
        }
      }
      for (uint64_t m = 0; m != 1123; ++m)
      {
        uint64_t v13 = (_DWORD *)(a1 + 4 * m + 22632);
        uint64_t v14 = *v13;
        if (v14)
        {
          do
          {
            while (1)
            {
              uint64_t v15 = a1 + 8 * v14 + 31616;
              if (*(_DWORD *)(a1 + 8 * v14 + 31660) == 74)
              {
                uint64_t v16 = _lou_stringHash((unsigned __int16 *)(a1 + 8 * v14 + 31670), 1, a1);
                if (v16 != m) {
                  break;
                }
              }
              uint64_t v14 = *(unsigned int *)(v15 + 16);
              uint64_t v13 = (_DWORD *)(v15 + 16);
              if (!*(_DWORD *)(v15 + 16)) {
                goto LABEL_33;
              }
            }
            unint64_t v17 = (_DWORD *)(a1 + 4 * v16 + 22632);
            uint64_t v18 = *v17;
            if (v18)
            {
              uint64_t v19 = a1 + 8 * v18 + 31616;
              for (int n = *(__int16 *)(a1 + 8 * v18 + 31666);
                    *(__int16 *)(v15 + 50) <= n
                 && (*(unsigned __int16 *)(v15 + 50) != (unsigned __int16)n || *(_DWORD *)(v19 + 44) != 83);
                    int n = *(__int16 *)(a1 + 8 * v18 + 31666))
              {
                uint64_t v18 = *(unsigned int *)(v19 + 16);
                unint64_t v17 = (_DWORD *)(v19 + 16);
                if (!*(_DWORD *)(v19 + 16)) {
                  break;
                }
                uint64_t v19 = a1 + 8 * v18 + 31616;
              }
            }
            uint64_t v14 = *(unsigned int *)(v15 + 16);
            *(_DWORD *)(v15 + 16) = v18;
            _DWORD *v17 = *v13;
            _DWORD *v13 = v14;
          }
          while (v14);
        }
LABEL_33:
        ;
      }
      uint64_t result = (const char **)(&dword_0 + 1);
      *(_DWORD *)(a1 + 924) = 1;
      return result;
    }
  }
  while (1)
  {
    uint64_t result = sub_57FC(a1, v4, 0);
    if (!result) {
      return result;
    }
    unsigned int v4 = *((_DWORD *)result + 3);
    if (!v4) {
      goto LABEL_8;
    }
  }
}

uint64_t lou_getTable(char *a1)
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  _lou_getTable(a1, a1, &v4, &v3);
  if (v3) {
    BOOL v1 = v4 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t _lou_getDisplayTable(const char *a1)
{
  uint64_t v2 = 0;
  getTable(0, a1, 0, &v2);
  return v2;
}

BOOL lou_checkTable(char *a1)
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  _lou_getTable(a1, a1, &v4, &v3);
  if (v4) {
    BOOL v1 = v3 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t lou_getTypeformForEmphClass(char *a1, const char *a2)
{
  uint64_t TranslationTable = _lou_getTranslationTable(a1);
  if (TranslationTable)
  {
    uint64_t v4 = 0;
    uint64_t v5 = TranslationTable + 1232;
    do
    {
      char v6 = *(const char **)(v5 + 8 * v4);
      if (!v6) {
        break;
      }
      if (!strcmp(a2, v6)) {
        return (unsigned __int16)(1 << v4);
      }
      ++v4;
    }
    while (v4 != 10);
  }
  LOWORD(v7) = 0;
  return (unsigned __int16)v7;
}

void *_lou_allocMem(int a1, unsigned int a2, int a3, int a4)
{
  if (a3 <= 1024) {
    unsigned int v4 = 1024;
  }
  else {
    unsigned int v4 = a3;
  }
  if (a4 <= 1024) {
    int v5 = 1024;
  }
  else {
    int v5 = a4;
  }
  switch(a1)
  {
    case 0:
      uint64_t result = (void *)qword_27338;
      if (v5 > dword_27330)
      {
        if (qword_27338) {
          free((void *)qword_27338);
        }
        uint64_t result = malloc_type_malloc((2 * v5 + 8), 0x1000040BDFB0063uLL);
        qword_27338 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27330 = v5;
      }
      break;
    case 1:
      if (qword_27340) {
        free((void *)qword_27340);
      }
      uint64_t result = malloc_type_calloc(v4 + 4, 4uLL, 0x100004052888210uLL);
      qword_27340 = (uint64_t)result;
      if (!result) {
        _lou_outOfMemory();
      }
      return result;
    case 2:
      if (qword_27348) {
        free((void *)qword_27348);
      }
      uint64_t result = malloc_type_calloc(v4 + 4, 8uLL, 0x100004000313F17uLL);
      qword_27348 = (uint64_t)result;
      if (!result) {
        _lou_outOfMemory();
      }
      return result;
    case 3:
      uint64_t result = (void *)qword_27358;
      if (v5 > dword_27350)
      {
        if (qword_27358) {
          free((void *)qword_27358);
        }
        uint64_t result = malloc_type_malloc((v5 + 4), 0x9D9E606FuLL);
        qword_27358 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27350 = v5;
      }
      break;
    case 4:
      if (a2 >= 3)
      {
        _lou_logMessage(50000, "Index out of bounds: %d\n", a2);
        exit(3);
      }
      uint64_t v7 = a2;
      if (v5 > dword_27360[a2])
      {
        int v8 = (void *)qword_27370[a2];
        if (v8) {
          free(v8);
        }
        uint64_t v9 = malloc_type_malloc((2 * v5 + 8), 0x1000040BDFB0063uLL);
        qword_27370[v7] = v9;
        if (!v9) {
          _lou_outOfMemory();
        }
        dword_27360[v7] = v5;
      }
      uint64_t result = (void *)qword_27370[v7];
      break;
    case 5:
      if (v4 > v5) {
        int v5 = v4;
      }
      uint64_t result = (void *)qword_27390;
      if (v5 > dword_27388)
      {
        if (qword_27390) {
          free((void *)qword_27390);
        }
        uint64_t result = malloc_type_malloc(4 * (v5 + 4), 0x100004052888210uLL);
        qword_27390 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27388 = v5;
      }
      break;
    case 6:
      if (v4 > v5) {
        int v5 = v4;
      }
      uint64_t result = (void *)qword_273A0;
      if (v5 > dword_27398)
      {
        if (qword_273A0) {
          free((void *)qword_273A0);
        }
        uint64_t result = malloc_type_malloc(4 * (v5 + 4), 0x100004052888210uLL);
        qword_273A0 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27398 = v5;
      }
      break;
    case 7:
      if (v4 > v5) {
        int v5 = v4;
      }
      uint64_t result = (void *)qword_273B0;
      if (v5 > dword_273A8)
      {
        if (qword_273B0) {
          free((void *)qword_273B0);
        }
        uint64_t result = malloc_type_malloc(4 * (v5 + 4), 0x100004052888210uLL);
        qword_273B0 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_273A8 = v5;
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void lou_free()
{
  lou_logEnd();
  v0 = (void ***)qword_27320;
  if (qword_27320)
  {
    do
    {
      sub_53CC(v0[1]);
      BOOL v1 = *v0;
      free(v0);
      v0 = (void ***)v1;
    }
    while (v1);
    qword_27320 = 0;
  }
  uint64_t v2 = (void **)qword_27328;
  if (qword_27328)
  {
    do
    {
      free(v2[1]);
      uint64_t v3 = (void **)*v2;
      free(v2);
      uint64_t v2 = v3;
    }
    while (v3);
    qword_27328 = 0;
  }
  if (qword_27338) {
    free((void *)qword_27338);
  }
  qword_27338 = 0;
  if (qword_27340) {
    free((void *)qword_27340);
  }
  qword_27340 = 0;
  if (qword_27348) {
    free((void *)qword_27348);
  }
  qword_27348 = 0;
  dword_27330 = 0;
  if (qword_27358) {
    free((void *)qword_27358);
  }
  uint64_t v4 = 0;
  qword_27358 = 0;
  dword_27350 = 0;
  do
  {
    int v5 = (void *)qword_27370[v4];
    if (v5) {
      free(v5);
    }
    qword_27370[v4] = 0;
    dword_27360[v4++] = 0;
  }
  while (v4 != 3);
  if (qword_27390) {
    free((void *)qword_27390);
  }
  qword_27390 = 0;
  dword_27388 = 0;
  if (qword_273A0) {
    free((void *)qword_273A0);
  }
  qword_273A0 = 0;
  dword_27398 = 0;
  if (qword_273B0) {
    free((void *)qword_273B0);
  }
  qword_273B0 = 0;
  dword_273A8 = 0;
  word_259F4[0] = 0;
}

void sub_53CC(void **a1)
{
  for (uint64_t i = 154; i != 164; ++i)
  {
    uint64_t v3 = a1[i];
    if (!v3) {
      break;
    }
    free(v3);
  }
  uint64_t v4 = a1[14];
  if (v4)
  {
    int v5 = a1 + 15;
    do
    {
      free(v4);
      char v6 = *v5++;
      uint64_t v4 = v6;
    }
    while (v6);
  }
  while (1)
  {
    uint64_t v7 = (void **)a1[1];
    if (!v7) {
      break;
    }
    a1[1] = *v7;
    free(v7);
  }
  while (1)
  {
    int v8 = (void **)a1[4];
    if (!v8) {
      break;
    }
    a1[4] = *v8;
    free(v8);
  }

  free(a1);
}

const char *lou_version()
{
  return "3.31.0";
}

uint64_t lou_charSize()
{
  return 2;
}

BOOL lou_compileString(char *a1, void **a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  getTable(a1, a1, &v5, &v4);
  return v5 && sub_54DC(a2) != 0;
}

void **sub_54DC(void **result)
{
  if (result)
  {
    uint64_t v1 = __chkstk_darwin();
    uint64_t v3 = v2;
    uint64_t v4 = v1;
    bzero(v7, 0x1030uLL);
    uint64_t v5 = 0;
    uint64_t v6 = v4;
    v7[4] = 1;
    v7[8] = 0;
    do
    {
      if (!*(unsigned char *)(v4 + v5)) {
        break;
      }
      *((_WORD *)&v7[11] + v5) = *(char *)(v4 + v5);
      ++v5;
    }
    while (v5 != 2047);
    *((_WORD *)&v7[11] + v5) = 0;
    unsigned char v7[7] = v5;
    if (v3 && *(void *)v3 && *(_DWORD *)(*(void *)v3 + 924))
    {
      sub_567C((uint64_t)&v6, "Table is finalized");
      return 0;
    }
    else
    {
      return sub_5EB8();
    }
  }
  return result;
}

void **_lou_compileTranslationRule(char *a1, void **a2)
{
  uint64_t v4 = 0;
  getTable(a1, 0, &v4, 0);
  return sub_54DC(a2);
}

void **_lou_compileDisplayRule(const char *a1, void **a2)
{
  uint64_t v4 = 0;
  getTable(0, a1, 0, &v4);
  return sub_54DC(a2);
}

void sub_567C(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(__str, 0x800uLL, __format, va);
  if (a1) {
    _lou_logMessage(40000, "%s:%d: error: %s");
  }
  else {
    _lou_logMessage(40000, "error: %s");
  }
  ++dword_262E0;
}

void sub_573C(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(__str, 0x800uLL, __format, va);
  if (a1) {
    _lou_logMessage(30000, "%s:%d: warning: %s");
  }
  else {
    _lou_logMessage(30000, "warning: %s");
  }
  ++dword_273B8;
}

const char **sub_57FC(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = (const char **)(a1 + 8 * a2 + 31616);
  uint64_t v4 = *(unsigned int *)(a1 + 8 * a2 + 31664);
  if (v4)
  {
    LODWORD(v5) = a3;
    unint64_t v8 = 0;
    uint64_t v9 = a1 + 8 * a2 + 31616;
    do
    {
      if ((int)v5 > 6 || (int v10 = v4, v4 == a2))
      {
        if (*v3) {
          snprintf((char *)qword_27450, 0x800uLL, "%s:%d", *v3, *((_DWORD *)v3 + 2));
        }
        else {
          strcpy((char *)qword_27450, "source unknown");
        }
        _lou_logMessage(40000, "%s: error: Character can not be (indirectly) based on itself.", (const char *)qword_27450);
        uint64_t v3 = 0;
        ++dword_262E0;
        return v3;
      }
      uint64_t v5 = (v5 + 1);
      uint64_t v11 = *(void *)(v9 + 32);
      uint64_t v12 = sub_57FC(a1, v4, v5);
      uint64_t v9 = v12;
      uint64_t v13 = v3[4];
      if (((*(void *)(v12 + 32) | *(void *)(v12 + 24)) & (unint64_t)v13) != 0)
      {
        uint64_t v20 = a1 + 8;
        while (1)
        {
          uint64_t v20 = *(void *)v20;
          if (!v20) {
            break;
          }
          if (*(const char **)(v20 + 8) == v13)
          {
            int v21 = _lou_showString(v20 + 18, *(unsigned __int16 *)(v20 + 16), 0);
            int v22 = strdup(v21);
            goto LABEL_19;
          }
        }
        int v22 = 0;
LABEL_19:
        if (*v3) {
          snprintf((char *)qword_27450, 0x800uLL, "%s:%d", *v3, *((_DWORD *)v3 + 2));
        }
        else {
          strcpy((char *)qword_27450, "source unknown");
        }
        size_t v23 = _lou_showString(v9 + 44, 1, 0);
        size_t v24 = "?";
        if (v22) {
          size_t v24 = v22;
        }
        _lou_logMessage(40000, "%s: error: Base character %s can not have the %s attribute.", (const char *)qword_27450, v23, v24);
        ++dword_262E0;
        free(v22);
        return 0;
      }
      v8 |= v11;
      uint64_t v4 = *(unsigned int *)(v12 + 48);
    }
    while (v4);
    uint64_t v14 = a1 + 8 * *(unsigned int *)(v12 + 16) + 31616;
    uint64_t v15 = *((unsigned int *)v3 + 4);
    if (v15)
    {
      uint64_t v16 = a1 + 8 * v15 + 31616;
      int v17 = *(unsigned __int16 *)(a1 + 8 * v15 + 31668);
      if (v17 != *(unsigned __int16 *)(a1 + 8 * *(unsigned int *)(v12 + 16) + 31668)
        || memcmp((const void *)(v16 + 2 * *(__int16 *)(v16 + 50) + 54), (const void *)(v14 + 2 * *(__int16 *)(v14 + 50) + 54), 2 * (__int16)v17))
      {
        uint64_t v18 = *(unsigned int *)(v16 + 44);
        if (v18 < 0x75)
        {
          uint64_t v19 = off_20368[v18];
        }
        else
        {
          uint64_t v19 = byte_25ADE;
          __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", *(_DWORD *)(v16 + 44));
        }
        uint64_t v25 = strdup(v19);
        if (*(_DWORD *)(v16 + 12) < *((_DWORD *)v3 + 14))
        {
          int v26 = *v3;
          int v27 = *((_DWORD *)v3 + 2);
          sub_5BF0(*v3, *(char **)v16);
          _lou_logMessage(10000, "%s:%d: Character already defined (%s). The existing %s rule will take precedence over the new base rule.", v26, v27, (const char *)qword_27450, v25);
          free(v25);
          *((_DWORD *)v3 + 12) = 0;
          v3[4] = 0;
          void *v3 = *(const char **)v16;
          int v28 = *(_DWORD *)(v16 + 12);
          *((_DWORD *)v3 + 2) = *(_DWORD *)(v16 + 8);
          *((_DWORD *)v3 + 14) = v28;
          goto LABEL_40;
        }
        uint64_t v29 = *(const char **)v16;
        int v30 = *(_DWORD *)(v16 + 8);
        sub_5BF0(v29, (char *)*v3);
        _lou_logMessage(10000, "%s:%d: A base rule already exists for this character (%s). The existing base rule will take precedence over the new %s rule.", v29, v30, (const char *)qword_27450, v25);
        free(v25);
        *((_DWORD *)v3 + 4) = 0;
      }
    }
    *((_DWORD *)v3 + 12) = v10;
    unint64_t v31 = (unint64_t)v3[3] | v8;
    if ((v31 & 0x30) != 0) {
      v31 |= 2uLL;
    }
    v3[3] = (const char *)v31;
    v3[4] = (const char *)v8;
    if (*(_WORD *)(v14 + 52) == 1)
    {
      uint64_t v32 = sub_5C88(*(unsigned __int16 *)(v14 + 2 * *(__int16 *)(v14 + 50) + 54), a1);
      if (v32)
      {
        unint64_t v33 = *(void *)(v32 + 24) | (unint64_t)v3[4];
        *(void *)(v32 + 24) = v33;
        if ((v33 & 0x30) != 0) {
          *(void *)(v32 + 24) = v33 | 2;
        }
      }
    }
    int v34 = *(_DWORD *)(v9 + 52);
    if (v34) {
      *((_DWORD *)v3 + 13) = v34;
    }
    *(_DWORD *)(v9 + 52) = a2;
  }
LABEL_40:
  *((_DWORD *)v3 + 15) = 1;
  return v3;
}

const char *sub_5BF0(const char *result, char *__s2)
{
  if (__s2)
  {
    if (result && !strcmp(result, __s2)) {
      return (const char *)snprintf((char *)qword_27450, 0x800uLL, "line %d");
    }
    else {
      return (const char *)snprintf((char *)qword_27450, 0x800uLL, "%s:%d");
    }
  }
  else
  {
    strcpy((char *)qword_27450, "source unknown");
  }
  return result;
}

uint64_t sub_5C88(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 18100);
  if (!v4) {
    return 0;
  }
  while (1)
  {
    uint64_t result = a2 + 8 * v4 + 31616;
    if (*(unsigned __int16 *)(a2 + 8 * v4 + 31660) == a1) {
      break;
    }
    uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
    if (!v4) {
      return 0;
    }
  }
  return result;
}

BOOL sub_5CE4()
{
  v0 = (const char *)__chkstk_darwin();
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v0;
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
  long long v30 = 0u;
  uint64_t v45 = 0;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)uint64_t v14 = 0u;
  ++dword_27C50;
  uint64_t v13 = v0;
  if (v1)
  {
    uint64_t v6 = (uint64_t *)(*v1 + 112);
    unsigned int v7 = -1;
    do
    {
      uint64_t v8 = *v6++;
      ++v7;
    }
    while (v8);
    if (v7 < 0x64)
    {
      uint64_t v9 = strdup(v0);
      *(v6 - 1) = (uint64_t)v9;
    }
    else
    {
      _lou_logMessage(30000, "Max number of source files (%i) reached", 100);
      uint64_t v9 = 0;
    }
    v14[0] = (FILE *)v9;
  }
  DWORD2(v15) = 0;
  *(void *)&long long v15 = 0;
  v14[1] = fopen(v5, "rb");
  if (v14[1])
  {
    uint64_t v12 = 0;
    while (_lou_getALine(&v13))
    {
      if (!sub_5EB8(&v13, v4, v3, &v12))
      {
        if (!dword_262E0) {
          sub_567C((uint64_t)&v13, "Rule could not be compiled");
        }
        break;
      }
    }
    fclose(v14[1]);
    sub_9938(v12);
    int v10 = dword_262E0;
  }
  else
  {
    _lou_logMessage(40000, "Cannot open table '%s'", v5);
    int v10 = ++dword_262E0;
  }
  return v10 == 0;
}

void **sub_5EB8()
{
  uint64_t v0 = __chkstk_darwin();
  v267 = v2;
  v268 = v1;
  v270 = v3;
  uint64_t v4 = v0;
  uint64_t v269 = 0;
  memset(v287, 0, 512);
  memset(v286, 0, 512);
  memset(v285, 0, 512);
  memset(v284, 0, 512);
  memset(v283, 0, 512);
  char v5 = 1;
  memset(v282, 0, 512);
  uint64_t v281 = 0;
  uint64_t v280 = 0;
  while (2)
  {
    char v6 = v5;
    if (!sub_99A4(v4, v287, 0)) {
      return (void **)(&dword_0 + 1);
    }
    uint64_t v271 = v4;
    while (1)
    {
      uint64_t v7 = 1;
      if (v287[1] == 35 || v287[1] == 60) {
        return (void **)v7;
      }
      uint64_t v4 = v271;
      if (*(_DWORD *)(v271 + 24) == 1)
      {
        uint64_t v8 = 0;
        while (v287[v8 + 1] == aIso[v8])
        {
          if (++v8 == 3)
          {
LABEL_41:
            if (v270)
            {
              sub_9B14();
            }
            else
            {
              while (_lou_getALine((_DWORD *)v271))
                ;
            }
            return (void **)(&dword_0 + 1);
          }
        }
        uint64_t v9 = 0;
        while (v287[v9 + 1] == aUtf8[v9])
        {
          if (++v9 == 5) {
            goto LABEL_41;
          }
        }
      }
      int v10 = sub_A16C(v287);
      int v11 = v10;
      if (v10 > 115) {
        break;
      }
      switch(v10)
      {
        case '6':
          if (HIDWORD(v269))
          {
            long long v15 = "nofor";
            goto LABEL_475;
          }
          uint64_t v269 = 1;
          goto LABEL_38;
        case '7':
          if (v269)
          {
            long long v15 = "noback";
LABEL_475:
            v265 = (char *)v15;
            v46 = "%s already specified.";
LABEL_476:
            uint64_t v212 = v4;
LABEL_556:
            sub_567C(v212, v46, v265, v266);
            return 0;
          }
          uint64_t v269 = 0x100000000;
LABEL_38:
          uint64_t v14 = v271;
LABEL_34:
          if (!sub_99A4(v14, v287, 0)) {
            return (void **)(&dword_0 + 1);
          }
          break;
        case '8':
        case '9':
        case ':':
        case ';':
        case '<':
          goto LABEL_23;
        case '=':
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'G':
          return (void **)sub_A348();
        case 'E':
          return (void **)sub_A5D4();
        case 'F':
          goto LABEL_52;
        case 'H':
          if (!v268) {
            return (void **)(&dword_0 + 1);
          }
          if (!sub_AAAC() || !sub_AB64()) {
            return 0;
          }
          if (LOWORD(v286[0]) == 1 && LOWORD(v285[0]) == 1)
          {
            sub_AC40(v271, HIWORD(v286[0]), HIWORD(v285[0]), v268);
            return (void **)(&dword_0 + 1);
          }
          v46 = "Exactly one character and one cell are required.";
          goto LABEL_476;
        default:
          if (v10) {
            goto LABEL_23;
          }
          memset(v279, 0, 512);
          if (!sub_99A4(v271, v287, (uint64_t)"include file name")
            || !sub_349C(v271, v279, v287))
          {
            return 0;
          }
          return sub_A1F0((const char **)v271, v279);
      }
    }
    if (v10 != 117)
    {
      if (v10 == 116)
      {
        v46 = "Macro feature is disabled.";
        goto LABEL_476;
      }
LABEL_23:
      if (!v270) {
        return (void **)(&dword_0 + 1);
      }
      uint64_t v12 = &v281;
      switch(v10)
      {
        case 1:
          sub_573C(v271, "The locale opcode is not implemented. Use the locale meta data instead.");
          return (void **)(&dword_0 + 1);
        case 2:
          LODWORD(v279[0]) = *(_DWORD *)(*v270 + 956);
          if (!sub_ADE4()) {
            return 0;
          }
          *(_DWORD *)(*v270 + 956) = v279[0];
          return (void **)(&dword_0 + 1);
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
          if ((v10 - 3) > 7)
          {
            uint64_t v19 = v271;
            long long v18 = v270;
            if (!sub_99A4(v271, v287, (uint64_t)"attribute name")) {
              return 0;
            }
            long long v43 = (void *)*v270;
            if (!*(void *)(*v270 + 8))
            {
              if (!sub_B8C8()) {
                return 0;
              }
              long long v43 = (void *)*v270;
            }
            long long v44 = sub_B9EC(v287, (uint64_t)v43);
            if (!v44)
            {
              long long v44 = sub_BA50(v271, &v287[1], v287[0], v43, 1);
              if (!v44) {
                return 0;
              }
            }
            unint64_t v17 = v44[1];
            if (v17 > 0x100 || !v17 || v17 == 4)
            {
              uint64_t v62 = *v270 + 1592;
              uint64_t v63 = -5;
              v64 = (int *)v62;
              while (1)
              {
                int v65 = *v64;
                v64 += 6;
                if (!v65 || *(void *)(v62 - 8) == v17) {
                  break;
                }
                uint64_t v62 = (uint64_t)v64;
                BOOL v66 = __CFADD__(v63++, 1);
                if (v66)
                {
                  v265 = (unsigned char *)(&dword_4 + 2);
                  v46 = "Max number of modes (%i) reached";
                  goto LABEL_541;
                }
              }
              unsigned int v16 = v63 + 6;
            }
            else
            {
              if (v17 != 16)
              {
                v46 = "mode must be \"uppercase\", \"digit\", or a custom attribute name.";
                goto LABEL_541;
              }
              unsigned int v16 = 0;
            }
          }
          else
          {
            unsigned int v16 = 0;
            int v11 = v10 + 8;
            unint64_t v17 = 16;
            long long v18 = v270;
            uint64_t v19 = v271;
          }
          uint64_t v20 = *v18;
          unsigned int v21 = v16;
          if (!*(_DWORD *)(*v18 + 24 * v16 + 1568))
          {
            uint64_t v22 = v20 + 24 * v16;
            *(_WORD *)(v22 + 1552) = 0;
            *(void *)(v22 + 1560) = v17;
            *(_DWORD *)(v22 + 1568) = 1024 << v21;
            *(_WORD *)(v22 + 1572) = v21 + 10;
          }
          switch(v11)
          {
            case 11:
              LODWORD(v279[0]) = *(_DWORD *)(v20 + 36 * (v21 + 10) + 1980);
              if (!sub_ADE4()) {
                return 0;
              }
              *(_DWORD *)(*v18 + 36 * (v21 + 10) + 1980) = v279[0];
              return (void **)(&dword_0 + 1);
            case 12:
              LODWORD(v279[0]) = *(_DWORD *)(v20 + 36 * (v21 + 10) + 1984);
              if (!sub_ADE4()) {
                return 0;
              }
              *(_DWORD *)(*v18 + 36 * (v21 + 10) + 1984) = v279[0];
              return (void **)(&dword_0 + 1);
            case 13:
              LODWORD(v279[0]) = *(_DWORD *)(v20 + 36 * (v21 + 10) + 1988);
              if (!sub_ADE4()) {
                return 0;
              }
              *(_DWORD *)(*v18 + 36 * (v21 + 10) + 1988) = v279[0];
              return (void **)(&dword_0 + 1);
            case 14:
              LODWORD(v279[0]) = *(_DWORD *)(v20 + 36 * (v21 + 10) + 1972);
              if (!sub_ADE4()) {
                return 0;
              }
              *(_DWORD *)(*v18 + 36 * (v21 + 10) + 1972) = v279[0];
              return (void **)(&dword_0 + 1);
            case 15:
              LODWORD(v279[0]) = *(_DWORD *)(v20 + 36 * (v21 + 10) + 1976);
              if (!sub_ADE4()) {
                return 0;
              }
              *(_DWORD *)(*v18 + 36 * (v21 + 10) + 1976) = v279[0];
              return (void **)(&dword_0 + 1);
            case 16:
              LODWORD(v279[0]) = *(_DWORD *)(v20 + 36 * (v21 + 10) + 1960);
              if (!sub_ADE4()) {
                return 0;
              }
              *(_DWORD *)(*v18 + 36 * (v21 + 10) + 1960) = v279[0];
              return (void **)(&dword_0 + 1);
            case 17:
              LODWORD(v279[0]) = 0;
              int v71 = sub_BC04();
              if (v71 == 2)
              {
                unsigned int v213 = v21 + 10;
                if (*(_DWORD *)(*v18 + 36 * (v21 + 10) + 1964))
                {
                  v46 = "Capital sign before last word already defined.";
                  goto LABEL_541;
                }
                LODWORD(v279[0]) = *(_DWORD *)(*v18 + 36 * v213 + 1968);
                if (sub_ADE4())
                {
                  *(_DWORD *)(*v18 + 36 * v213 + 1968) = v279[0];
                  return (void **)(&dword_0 + 1);
                }
              }
              else
              {
                if (v71 != 1)
                {
                  v46 = "Invalid lastword indicator location.";
                  goto LABEL_541;
                }
                unsigned int v72 = v21 + 10;
                if (*(_DWORD *)(*v18 + 36 * (v21 + 10) + 1968))
                {
                  v46 = "Capital sign after last word already defined.";
                  goto LABEL_541;
                }
                LODWORD(v279[0]) = *(_DWORD *)(*v18 + 36 * v72 + 1964);
                if (sub_ADE4())
                {
                  *(_DWORD *)(*v18 + 36 * v72 + 1964) = v279[0];
                  return (void **)(&dword_0 + 1);
                }
              }
              break;
            case 18:
              uint64_t v7 = sub_BDB4();
              *(_DWORD *)(*v18 + 36 * (v21 + 10) + 1992) = v7;
              return (void **)v7;
            default:
              return 0;
          }
          return 0;
        case 19:
          LODWORD(v279[0]) = *(_DWORD *)(*v270 + 960);
          if (!sub_ADE4()) {
            return 0;
          }
          *(_DWORD *)(*v270 + 960) = v279[0];
          return (void **)(&dword_0 + 1);
        case 20:
          uint64_t v68 = v271;
          if (!sub_AAAC()) {
            return 0;
          }
          uint64_t v73 = *v270;
          uint64_t v74 = *(int *)(*v270 + 2676);
          if ((int)(v74 + LOWORD(v286[0])) > 64) {
            goto LABEL_180;
          }
          if (LOWORD(v286[0]))
          {
            unint64_t v75 = 0;
            do
            {
              *(_WORD *)(v73 + 2 * v74 + 2548 + 2 * v75) = *((_WORD *)v286 + v75 + 1);
              ++v75;
            }
            while (v75 < LOWORD(v286[0]));
            *(_DWORD *)(v73 + 2676) = v74 + v75;
          }
          return (void **)(&dword_0 + 1);
        case 21:
          uint64_t v68 = v271;
          if (!sub_AAAC()) {
            return 0;
          }
          uint64_t v76 = *v270;
          uint64_t v77 = *(int *)(*v270 + 3192);
          if ((int)(v77 + LOWORD(v286[0])) > 256)
          {
            uint64_t v78 = 256;
            goto LABEL_249;
          }
          if (LOWORD(v286[0]))
          {
            unint64_t v214 = 0;
            do
            {
              *(_WORD *)(v76 + 2 * v77 + 2680 + 2 * v214) = *((_WORD *)v286 + v214 + 1);
              ++v214;
            }
            while (v214 < LOWORD(v286[0]));
            *(_DWORD *)(v76 + 3192) = v77 + v214;
          }
          return (void **)(&dword_0 + 1);
        case 22:
          uint64_t v68 = v271;
          if (!sub_AAAC()) {
            return 0;
          }
          uint64_t v79 = *v270;
          uint64_t v80 = *(int *)(*v270 + 3324);
          if ((int)(v80 + LOWORD(v286[0])) > 64)
          {
LABEL_180:
            uint64_t v78 = 64;
            goto LABEL_249;
          }
          if (LOWORD(v286[0]))
          {
            unint64_t v215 = 0;
            do
            {
              *(_WORD *)(v79 + 2 * v80 + 3196 + 2 * v215) = *((_WORD *)v286 + v215 + 1);
              ++v215;
            }
            while (v215 < LOWORD(v286[0]));
            *(_DWORD *)(v79 + 3324) = v80 + v215;
          }
          return (void **)(&dword_0 + 1);
        case 23:
          LODWORD(v279[0]) = *(_DWORD *)(*v270 + 964);
          if (!sub_ADE4()) {
            return 0;
          }
          *(_DWORD *)(*v270 + 964) = v279[0];
          return (void **)(&dword_0 + 1);
        case 24:
          LODWORD(v279[0]) = *(_DWORD *)(*v270 + 972);
          if (!sub_ADE4()) {
            return 0;
          }
          *(_DWORD *)(*v270 + 972) = v279[0];
          return (void **)(&dword_0 + 1);
        case 25:
          if (!sub_AAAC()) {
            return 0;
          }
          unint64_t v81 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)1;
          }
          uint64_t v82 = 0;
          BOOL v83 = 0;
          uint64_t v84 = *v270;
          while (1)
          {
            v85 = (char *)v286 + 2 * v82;
            int v88 = *((unsigned __int16 *)v85 + 1);
            uint64_t v86 = (uint64_t)(v85 + 2);
            int v87 = v88;
            uint64_t v89 = *(unsigned int *)(v84 + 4 * _lou_charHash(v88) + 13608);
            if (!v89) {
              break;
            }
            while (1)
            {
              uint64_t v90 = v84 + 8 * v89 + 31616;
              if (*(unsigned __int16 *)(v90 + 44) == v87) {
                break;
              }
              uint64_t v89 = *(unsigned int *)(v90 + 12);
              if (!v89) {
                goto LABEL_438;
              }
            }
            *(void *)(v90 + 24) |= 0x800uLL;
            uint64_t v84 = *v270;
            *(_DWORD *)(*v270 + 948) = 1;
            BOOL v83 = ++v82 >= v81;
            if (v82 == v81) {
              return (void **)1;
            }
          }
LABEL_438:
          _lou_showString(v86, 1, 0);
          sub_567C(v271, "Numeric mode character undefined: %s");
          return (void **)v83;
        case 26:
          if (!sub_AAAC()) {
            return 0;
          }
          unint64_t v91 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)1;
          }
          uint64_t v92 = 0;
          BOOL v83 = 0;
          uint64_t v93 = *v270;
          while (1)
          {
            v94 = (char *)v286 + 2 * v92;
            int v95 = *((unsigned __int16 *)v94 + 1);
            uint64_t v96 = *(unsigned int *)(v93 + 4 * _lou_charHash(*((_WORD *)v94 + 1)) + 13608);
            if (!v96) {
              break;
            }
            while (1)
            {
              uint64_t v97 = v93 + 8 * v96 + 31616;
              if (*(unsigned __int16 *)(v97 + 44) == v95) {
                break;
              }
              uint64_t v96 = *(unsigned int *)(v97 + 12);
              if (!v96) {
                goto LABEL_439;
              }
            }
            *(void *)(v97 + 24) |= 0x4000000uLL;
            uint64_t v93 = *v270;
            *(_DWORD *)(*v270 + 948) = 1;
            BOOL v83 = ++v92 >= v91;
            if (v92 == v91) {
              return (void **)1;
            }
          }
LABEL_439:
          sub_567C(v271, "Midendnumeric mode character undefined");
          return (void **)v83;
        case 27:
          if (!sub_AAAC()) {
            return 0;
          }
          unint64_t v98 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)1;
          }
          uint64_t v99 = 0;
          BOOL v83 = 0;
          uint64_t v100 = *v270;
          while (1)
          {
            v101 = (char *)v286 + 2 * v99;
            int v102 = *((unsigned __int16 *)v101 + 1);
            uint64_t v103 = *(unsigned int *)(v100 + 4 * _lou_charHash(*((_WORD *)v101 + 1)) + 13608);
            if (!v103) {
              break;
            }
            while (1)
            {
              uint64_t v104 = v100 + 8 * v103 + 31616;
              if (*(unsigned __int16 *)(v104 + 44) == v102) {
                break;
              }
              uint64_t v103 = *(unsigned int *)(v104 + 12);
              if (!v103) {
                goto LABEL_440;
              }
            }
            *(void *)(v104 + 24) |= 0x1000uLL;
            uint64_t v100 = *v270;
            *(_DWORD *)(*v270 + 948) = 1;
            BOOL v83 = ++v99 >= v98;
            if (v99 == v98) {
              return (void **)1;
            }
          }
LABEL_440:
          sub_567C(v271, "Numeric no contraction character undefined");
          return (void **)v83;
        case 28:
          if (!sub_AAAC()) {
            return 0;
          }
          unint64_t v105 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)1;
          }
          uint64_t v106 = 0;
          BOOL v83 = 0;
          uint64_t v107 = *v270;
          while (1)
          {
            v108 = (char *)v286 + 2 * v106;
            int v109 = *((unsigned __int16 *)v108 + 1);
            uint64_t v110 = *(unsigned int *)(v107 + 4 * _lou_charHash(*((_WORD *)v108 + 1)) + 13608);
            if (!v110) {
              break;
            }
            while (1)
            {
              uint64_t v111 = v107 + 8 * v110 + 31616;
              if (*(unsigned __int16 *)(v111 + 44) == v109) {
                break;
              }
              uint64_t v110 = *(unsigned int *)(v111 + 12);
              if (!v110) {
                goto LABEL_441;
              }
            }
            *(void *)(v111 + 24) |= 0x2000uLL;
            uint64_t v107 = *v270;
            *(_DWORD *)(*v270 + 944) = 1;
            BOOL v83 = ++v106 >= v105;
            if (v106 == v105) {
              return (void **)1;
            }
          }
LABEL_441:
          sub_567C(v271, "Sequence delimiter character undefined");
          return (void **)v83;
        case 29:
          if (!sub_AAAC()) {
            return 0;
          }
          unint64_t v112 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)1;
          }
          uint64_t v113 = 0;
          BOOL v83 = 0;
          while (1)
          {
            int v114 = *((unsigned __int16 *)v286 + v113 + 1);
            uint64_t v115 = *v270;
            uint64_t v116 = *(unsigned int *)(v115 + 4 * _lou_charHash(*((_WORD *)v286 + v113 + 1)) + 13608);
            if (!v116) {
              break;
            }
            while (1)
            {
              uint64_t v117 = v115 + 8 * v116 + 31616;
              if (*(unsigned __int16 *)(v117 + 44) == v114) {
                break;
              }
              uint64_t v116 = *(unsigned int *)(v117 + 12);
              if (!v116) {
                goto LABEL_442;
              }
            }
            *(void *)(v117 + 24) |= 0x4000uLL;
            BOOL v83 = ++v113 >= v112;
            if (v113 == v112) {
              return (void **)1;
            }
          }
LABEL_442:
          sub_567C(v271, "Sequence before character undefined");
          return (void **)v83;
        case 30:
          if (!sub_AAAC()) {
            return 0;
          }
          unint64_t v118 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)1;
          }
          uint64_t v119 = 0;
          BOOL v83 = 0;
          while (1)
          {
            int v120 = *((unsigned __int16 *)v286 + v119 + 1);
            uint64_t v121 = *v270;
            uint64_t v122 = *(unsigned int *)(v121 + 4 * _lou_charHash(*((_WORD *)v286 + v119 + 1)) + 13608);
            if (!v122) {
              break;
            }
            while (1)
            {
              uint64_t v123 = v121 + 8 * v122 + 31616;
              if (*(unsigned __int16 *)(v123 + 44) == v120) {
                break;
              }
              uint64_t v122 = *(unsigned int *)(v123 + 12);
              if (!v122) {
                goto LABEL_443;
              }
            }
            *(void *)(v123 + 24) |= 0x8000uLL;
            BOOL v83 = ++v119 >= v118;
            if (v119 == v118) {
              return (void **)1;
            }
          }
LABEL_443:
          sub_567C(v271, "Sequence after character undefined");
          return (void **)v83;
        case 31:
          uint64_t v68 = v271;
          if (!sub_AAAC()) {
            return 0;
          }
          uint64_t v124 = *v270;
          int v125 = *(_DWORD *)(*v270 + 1696);
          if (v125 + LOWORD(v286[0]) > 127) {
            goto LABEL_248;
          }
          if (LOWORD(v286[0]))
          {
            unint64_t v126 = 0;
            do
            {
              *(_WORD *)(v124 + 2 * v125 + 976 + 2 * v126) = *((_WORD *)v286 + v126 + 1);
              ++v126;
            }
            while (v126 < LOWORD(v286[0]));
            v125 += v126;
          }
          *(_DWORD *)(v124 + 1696) = v125 + 1;
          *(_WORD *)(v124 + 2 * v125 + 976) = 0;
          return (void **)(&dword_0 + 1);
        case 32:
          uint64_t v68 = v271;
          if (!sub_AAAC()) {
            return 0;
          }
          if (LOWORD(v286[0]) <= 0x7Fu)
          {
            uint64_t v216 = *v270;
            if (LOWORD(v286[0]))
            {
              unint64_t v217 = 0;
              do
              {
                *(_WORD *)(v216 + 1700 + 2 * v217) = *((_WORD *)v286 + v217 + 1);
                ++v217;
                uint64_t v218 = LOWORD(v286[0]);
              }
              while (v217 < LOWORD(v286[0]));
            }
            else
            {
              uint64_t v218 = 0;
            }
            *(_WORD *)(v216 + 2 * v218 + 1700) = 0;
            *(_DWORD *)(v216 + 1956) = LOWORD(v286[0]);
            return (void **)(&dword_0 + 1);
          }
LABEL_248:
          uint64_t v78 = 128;
LABEL_249:
          v265 = (char *)v78;
          v46 = "More than %d characters";
          goto LABEL_434;
        case 33:
          uint64_t v127 = v271;
          if (!sub_99A4(v271, v282, (uint64_t)"emphasis class"))
          {
            v46 = "emphclass must be followed by a valid class name.";
            goto LABEL_581;
          }
          uint64_t v128 = v282[0];
          v129 = (char *)malloc_type_malloc(v282[0] + 1, 0x100004077774924uLL);
          v130 = v129;
          if (v128)
          {
            v131 = (char *)&v282[1];
            uint64_t v132 = v128;
            v133 = v129;
            v134 = v270;
            do
            {
              char v135 = *v131;
              v131 += 2;
              *v133++ = v135;
              --v132;
            }
            while (v132);
          }
          else
          {
            v134 = v270;
          }
          uint64_t v222 = 0;
          uint64_t v223 = 0;
          v129[v128] = 0;
          uint64_t v224 = *v134;
          uint64_t v225 = *v134 + 1232;
          while (2)
          {
            v226 = *(const char **)(v225 + 8 * v223);
            if (v226)
            {
              if (strcmp(v130, v226))
              {
                ++v223;
                v222 += 24;
                if (v222 == 240) {
                  goto LABEL_471;
                }
                continue;
              }
              _lou_logMessage(10000, "Duplicate emphasis class: %s", v130);
              free(v130);
              return (void **)(&dword_0 + 1);
            }
            break;
          }
          if ((int)v223 > 1)
          {
            if (v223 == 2)
            {
              if (strcmp(v130, "bold"))
              {
                _lou_logMessage(40000, "Third emphasis class must be \"bold\" but got %s");
                goto LABEL_472;
              }
            }
            else if (v223 == 10)
            {
LABEL_471:
              _lou_logMessage(40000, "Max number of emphasis classes (%i) reached");
LABEL_472:
              ++dword_262E0;
              v67 = v130;
              goto LABEL_129;
            }
          }
          else if (v223)
          {
            if (v223 == 1 && strcmp(v130, "underline"))
            {
              _lou_logMessage(40000, "Second emphasis class must be \"underline\" but got %s");
              goto LABEL_472;
            }
          }
          else if (strcmp(v130, "italic"))
          {
            _lou_logMessage(40000, "First emphasis class must be \"italic\" but got %s");
            goto LABEL_472;
          }
          *(void *)(v224 + 8 * v223 + 1232) = v130;
          uint64_t v250 = *v134 + v222;
          uint64_t v7 = 1;
          *(_WORD *)(v250 + 1312) = 1 << v223;
          *(void *)(v250 + 1320) = 0;
          *(_DWORD *)(v250 + 1328) = 1 << v223;
          *(_WORD *)(v250 + 1332) = v223;
          return (void **)v7;
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 43:
        case 44:
          if (!sub_99A4(v271, v287, (uint64_t)"emphasis class")
            || !sub_349C(v271, v282, v287))
          {
            return 0;
          }
          uint64_t v31 = v282[0];
          long long v32 = malloc_type_malloc(v282[0] + 1, 0x100004077774924uLL);
          long long v33 = v32;
          if (v31)
          {
            long long v34 = (char *)&v282[1];
            uint64_t v35 = v31;
            long long v36 = v32;
            do
            {
              char v37 = *v34;
              v34 += 2;
              *v36++ = v37;
              --v35;
            }
            while (v35);
          }
          uint64_t v38 = 0;
          v32[v31] = 0;
          uint64_t v39 = *v270;
          uint64_t v40 = 3328;
          uint64_t v41 = 8468;
          while (1)
          {
            long long v42 = *(const char **)(v39 + 8 * v38 + 1232);
            if (!v42 || !strcmp(v33, v42)) {
              break;
            }
            ++v38;
            v40 += 514;
            v41 += 514;
            if (v38 == 10) {
              goto LABEL_128;
            }
          }
          if (!*(void *)(v39 + 8 * v38 + 1232))
          {
LABEL_128:
            _lou_logMessage(40000, "Emphasis class %s not declared", v33);
            ++dword_262E0;
            v67 = v33;
LABEL_129:
            free(v67);
            return 0;
          }
          uint64_t v7 = 0;
          switch(v11)
          {
            case '""':
              LODWORD(v279[0]) = *(_DWORD *)(v39 + 36 * v38 + 1980);
              if (!sub_ADE4()) {
                goto LABEL_566;
              }
              *(_DWORD *)(*v270 + 36 * v38 + 1980) = v279[0];
              goto LABEL_380;
            case '#':
              LODWORD(v279[0]) = *(_DWORD *)(v39 + 36 * v38 + 1984);
              if (!sub_ADE4()) {
                goto LABEL_566;
              }
              *(_DWORD *)(*v270 + 36 * v38 + 1984) = v279[0];
              goto LABEL_380;
            case '$':
              LODWORD(v279[0]) = *(_DWORD *)(v39 + 36 * v38 + 1988);
              if (!sub_ADE4()) {
                goto LABEL_566;
              }
              *(_DWORD *)(*v270 + 36 * v38 + 1988) = v279[0];
              goto LABEL_380;
            case '%':
              if (*(_DWORD *)(v39 + 36 * v38 + 1984)
                || *(_DWORD *)(v39 + 36 * v38 + 1960))
              {
                v232 = "Cannot define emphasis for both no context and word or phrase context, i.e. cannot have both bege"
                       "mph and begemphword or begemphphrase.";
                goto LABEL_504;
              }
              LODWORD(v279[0]) = *(_DWORD *)(v39 + 36 * v38 + 1972);
              if (!sub_ADE4()) {
                goto LABEL_566;
              }
              *(_DWORD *)(*v270 + 36 * v38 + 1972) = v279[0];
              goto LABEL_380;
            case '&':
              if (*(_DWORD *)(v39 + 36 * v38 + 1988)
                || *(_DWORD *)(v39 + 36 * v38 + 1964)
                || *(_DWORD *)(v39 + 36 * v38 + 1968))
              {
                v232 = "Cannot define emphasis for both no context and word or phrase context, i.e. cannot have both ende"
                       "mph and endemphword or endemphphrase.";
                goto LABEL_504;
              }
              LODWORD(v279[0]) = *(_DWORD *)(v39 + 36 * v38 + 1976);
              if (!sub_ADE4()) {
                goto LABEL_566;
              }
              *(_DWORD *)(*v270 + 36 * v38 + 1976) = v279[0];
              goto LABEL_380;
            case '\'':
              LODWORD(v279[0]) = *(_DWORD *)(v39 + 36 * v38 + 1960);
              if (!sub_ADE4()) {
                goto LABEL_566;
              }
              *(_DWORD *)(*v270 + 36 * v38 + 1960) = v279[0];
              goto LABEL_380;
            case '(':
              int v234 = sub_BC04();
              if (v234 == 2)
              {
                if (*(_DWORD *)(*v270 + 36 * v38 + 1964))
                {
                  v232 = "last word before already defined.";
                  goto LABEL_564;
                }
                LODWORD(v279[0]) = *(_DWORD *)(*v270 + 36 * v38 + 1968);
                if (sub_ADE4())
                {
                  *(_DWORD *)(*v270 + 36 * v38 + 1968) = v279[0];
                  goto LABEL_380;
                }
              }
              else
              {
                if (v234 != 1)
                {
                  v232 = "Invalid lastword indicator location.";
                  goto LABEL_564;
                }
                if (*(_DWORD *)(*v270 + 36 * v38 + 1968))
                {
                  v232 = "last word after already defined.";
LABEL_564:
                  uint64_t v233 = v271;
                  goto LABEL_565;
                }
                LODWORD(v279[0]) = *(_DWORD *)(*v270 + 36 * v38 + 1964);
                if (sub_ADE4())
                {
                  *(_DWORD *)(*v270 + 36 * v38 + 1964) = v279[0];
LABEL_380:
                  uint64_t v7 = 1;
LABEL_567:
                  free(v33);
                  return (void **)v7;
                }
              }
LABEL_566:
              uint64_t v7 = 0;
              goto LABEL_567;
            case ')':
              int v235 = sub_BDB4();
              *(_DWORD *)(*v270 + 36 * v38 + 1992) = v235;
              uint64_t v7 = v235 != 0;
              goto LABEL_567;
            case '+':
              uint64_t v236 = v271;
              if (!sub_AAAC()) {
                goto LABEL_566;
              }
              for (uint64_t i = 0; i != 256; ++i)
              {
                if (!*(_WORD *)(*v270 + v40 + 2 * i)) {
                  break;
                }
              }
              if (i + LOWORD(v286[0]) > 0x100) {
                goto LABEL_527;
              }
              if (!LOWORD(v286[0])) {
                goto LABEL_380;
              }
              unint64_t v238 = 0;
              uint64_t v239 = *v270 + 2 * i + v40;
              uint64_t v7 = 1;
              while (1)
              {
                unsigned __int16 v240 = *((_WORD *)v286 + v238 + 1);
                if (!sub_BEAC(v240, *v270, 0)) {
                  break;
                }
                *(_WORD *)(v239 + 2 * v238++) = v240;
                if (v238 >= LOWORD(v286[0])) {
                  goto LABEL_567;
                }
              }
              v232 = "Emphasis mode character undefined";
              goto LABEL_504;
            case ',':
              uint64_t v236 = v271;
              if (!sub_AAAC()) {
                goto LABEL_566;
              }
              for (uint64_t j = 0; j != 256; ++j)
              {
                if (!*(_WORD *)(*v270 + v41 + 2 * j)) {
                  break;
                }
              }
              if (j + LOWORD(v286[0]) > 0x100)
              {
LABEL_527:
                sub_567C(v236, "More than %d characters");
                goto LABEL_566;
              }
              if (!LOWORD(v286[0])) {
                goto LABEL_380;
              }
              unint64_t v246 = 0;
              uint64_t v247 = *v270 + 2 * j + v41;
              uint64_t v7 = 1;
              while (1)
              {
                unsigned __int16 v248 = *((_WORD *)v286 + v246 + 1);
                if (!sub_BEAC(v248, *v270, 0)) {
                  break;
                }
                *(_WORD *)(v247 + 2 * v246++) = v248;
                if (v246 >= LOWORD(v286[0])) {
                  goto LABEL_567;
                }
              }
              v232 = "Character undefined";
LABEL_504:
              uint64_t v233 = v271;
LABEL_565:
              sub_567C(v233, v232);
              goto LABEL_566;
            default:
              goto LABEL_567;
          }
        case 42:
          if (!sub_AAAC()) {
            return 0;
          }
          unint64_t v136 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)1;
          }
          uint64_t v137 = 0;
          BOOL v83 = 0;
          uint64_t v138 = *v270;
          while (1)
          {
            v139 = (char *)v286 + 2 * v137;
            int v140 = *((unsigned __int16 *)v139 + 1);
            uint64_t v141 = *(unsigned int *)(v138 + 4 * _lou_charHash(*((_WORD *)v139 + 1)) + 13608);
            if (!v141) {
              break;
            }
            while (1)
            {
              uint64_t v142 = v138 + 8 * v141 + 31616;
              if (*(unsigned __int16 *)(v142 + 44) == v140) {
                break;
              }
              uint64_t v141 = *(unsigned int *)(v142 + 12);
              if (!v141) {
                goto LABEL_444;
              }
            }
            *(void *)(v142 + 24) |= 0x200uLL;
            uint64_t v138 = *v270;
            *(_DWORD *)(*v270 + 952) = 1;
            BOOL v83 = ++v137 >= v136;
            if (v137 == v136) {
              return (void **)1;
            }
          }
LABEL_444:
          sub_567C(v271, "Capital mode character undefined");
          return (void **)v83;
        case 45:
          LODWORD(v279[0]) = *(_DWORD *)(*v270 + 2536);
          if (!sub_ADE4()) {
            return 0;
          }
          *(_DWORD *)(*v270 + 2536) = v279[0];
          return (void **)(&dword_0 + 1);
        case 46:
          LODWORD(v279[0]) = *(_DWORD *)(*v270 + 2540);
          if (!sub_ADE4()) {
            return 0;
          }
          *(_DWORD *)(*v270 + 2540) = v279[0];
          return (void **)(&dword_0 + 1);
        case 47:
          LODWORD(v279[0]) = *(_DWORD *)(*v270 + 968);
          if (!sub_ADE4()) {
            return 0;
          }
          *(_DWORD *)(*v270 + 968) = v279[0];
          return (void **)(&dword_0 + 1);
        case 48:
          LOWORD(v286[0]) = 0;
          if (!sub_99A4(v271, v287, (uint64_t)"multiple braille indicators")
            || !sub_3A80(v271, v284, v287))
          {
            return 0;
          }
          while (2)
          {
            if (!sub_99A4(v271, v287, (uint64_t)"multind opcodes")) {
              return (void **)sub_B028(v271, 48, (__int16 *)v286, v284, v281, v280, 0, 0, v269, SHIDWORD(v269), (void **)v270);
            }
            int v143 = sub_A16C(v287);
            if (v143 == 117)
            {
              v265 = _lou_showString((uint64_t)&v287[1], v287[0], 0);
              v46 = "opcode %s not defined.";
            }
            else
            {
              if ((v143 - 3) < 0x2D)
              {
                uint64_t v144 = LOWORD(v286[0]);
                ++LOWORD(v286[0]);
                *((_WORD *)v286 + v144 + 1) = v143;
                if (*(_DWORD *)(v271 + 40) >= *(_DWORD *)(v271 + 36)) {
                  return (void **)sub_B028(v271, 48, (__int16 *)v286, v284, v281, v280, 0, 0, v269, SHIDWORD(v269), (void **)v270);
                }
                continue;
              }
              v46 = "Not a braille indicator opcode.";
            }
            break;
          }
          uint64_t v212 = v271;
          goto LABEL_556;
        case 49:
        case 50:
          LODWORD(v279[0]) = 0;
          uint64_t v68 = v271;
          if (!sub_AAAC()) {
            return 0;
          }
          if (LOWORD(v286[0]) != 1)
          {
            v46 = "first operand must be 1 character";
            goto LABEL_434;
          }
          if (v269) {
            sub_573C(v271, "nofor and noback not allowed on comp6 rules");
          }
          if (sub_AB64()) {
            return (void **)sub_B028(v271, v11, (__int16 *)v286, (__int16 *)v285, v281, v280, (unsigned int *)v279, 0, v269, SHIDWORD(v269), (void **)v270);
          }
          return 0;
        case 51:
          sub_573C(v271, "class is deprecated, use attribute instead");
          goto LABEL_278;
        case 52:
          goto LABEL_26;
        case 53:
          uint64_t v12 = &v280;
LABEL_26:
          if (!*(void *)(*v270 + 8) && !sub_B8C8()
            || !sub_99A4(v271, v287, (uint64_t)"attribute name"))
          {
            return 0;
          }
          uint64_t v13 = sub_B9EC(v287, *v270);
          if (!v13)
          {
            v46 = "attribute not defined";
            goto LABEL_555;
          }
          *v12 |= (unint64_t)v13[1];
LABEL_33:
          uint64_t v14 = v271;
          goto LABEL_34;
        case 56:
          v280 |= 0x2000000uLL;
          goto LABEL_33;
        case 57:
          v281 |= 0x2000000uLL;
          goto LABEL_33;
        case 58:
        case 59:
        case 60:
          return (void **)sub_D4E0();
        case 73:
          if (sub_AAAC())
          {
            if (*(_DWORD *)(v271 + 40) >= *(_DWORD *)(v271 + 36) || (sub_AF70(), HIWORD(v285[0]) == 35))
            {
              v285[0] = 0;
            }
            else if (HIWORD(v285[0]) == 92 && LOWORD(v285[1]) == 35)
            {
              --LOWORD(v285[0]);
              __memmove_chk();
            }
          }
          if (LOWORD(v286[0]))
          {
            unint64_t v148 = 1;
            do
            {
              sub_BF1C(v271, *((unsigned __int16 *)v286 + v148), v270, 0, *(_DWORD *)(*v270 + 920));
              BOOL v66 = v148++ >= LOWORD(v286[0]);
            }
            while (!v66);
          }
          if (LOWORD(v285[0]))
          {
            unint64_t v149 = 1;
            do
            {
              sub_BF1C(v271, *((unsigned __int16 *)v285 + v149), v270, 0, *(_DWORD *)(*v270 + 920));
              BOOL v66 = v149++ >= LOWORD(v285[0]);
            }
            while (!v66);
          }
          return (void **)sub_B028(v271, 73, (__int16 *)v286, (__int16 *)v285, v281, v280, 0, 0, v269, SHIDWORD(v269), (void **)v270);
        case 74:
          goto LABEL_306;
        case 75:
          *(_DWORD *)(*v270 + 936) = 1;
          goto LABEL_306;
        case 76:
          uint64_t v150 = *v270;
          if (*(int *)(*v270 + 932) > 1) {
            goto LABEL_306;
          }
          int v151 = 2;
          goto LABEL_305;
        case 77:
          uint64_t v150 = *v270;
          if (*(int *)(*v270 + 932) > 2) {
            goto LABEL_306;
          }
          int v151 = 3;
          goto LABEL_305;
        case 78:
          uint64_t v150 = *v270;
          if (*(int *)(*v270 + 932) > 3) {
            goto LABEL_306;
          }
          int v151 = 4;
LABEL_305:
          *(_DWORD *)(v150 + 932) = v151;
LABEL_306:
          if (!v269)
          {
            v265 = "nofor";
            v266 = "noback";
            v46 = "%s or %s must be specified.";
            goto LABEL_555;
          }
          return (void **)sub_C030();
        case 79:
        case 80:
        case 83:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
          goto LABEL_327;
        case 81:
          if (!sub_AAAC()) {
            return 0;
          }
          memset(v274, 0, 512);
          if (!sub_99A4(v271, v274, (uint64_t)"dots,dots operand")) {
            return 0;
          }
          uint64_t v152 = LOWORD(v274[0]);
          int v153 = LOWORD(v274[0]) - 2;
          if (LOWORD(v274[0]) < 2u) {
            return 0;
          }
          uint64_t v154 = 0;
          uint64_t v155 = 0;
          uint64_t v156 = LOWORD(v274[0]) - 1;
          while (*((_WORD *)v274 + v155 + 1) != 44)
          {
            uint64_t v7 = 0;
            ++v155;
            v154 += 2;
            if (v156 == v155) {
              return (void **)v7;
            }
          }
          LOWORD(v274[0]) = v155;
          if (!sub_3A80(v271, v285, v274)) {
            return 0;
          }
          uint64_t v242 = LOWORD(v285[0]);
          ++LOWORD(v285[0]);
          *((_WORD *)v285 + v242 + 1) = 44;
          if (v153 == v155 && *((_WORD *)v274 + v156 + 1) == 61)
          {
            uint64_t v243 = LOWORD(v286[0]);
            v244 = (void **)v270;
            if (LOWORD(v286[0]))
            {
              for (uint64_t k = (unsigned __int16 *)v286 + 1; ; ++k)
              {
                uint64_t v245 = sub_BEAC(*k, *v270, 0);
                if (!v245 || !*(_DWORD *)(v245 + 16) && !*(_DWORD *)(v245 + 48)) {
                  break;
                }
                if (!--v243) {
                  return (void **)sub_B028(v271, 81, (__int16 *)v286, (__int16 *)v285, v281, v280, 0, 0, v269, SHIDWORD(v269), v244);
                }
              }
LABEL_553:
              uint64_t v168 = (uint64_t)k;
LABEL_554:
              v265 = _lou_showString(v168, 1, 0);
              v46 = "Character %s is not defined";
LABEL_555:
              uint64_t v212 = v271;
              goto LABEL_556;
            }
          }
          else
          {
            memset((char *)v279 + 2, 0, 510);
            memset(v288, 0, 512);
            if ((int)v155 + 1 >= v152)
            {
              __int16 v249 = 0;
            }
            else
            {
              __int16 v249 = ~(_WORD)v155 + v152;
              memcpy((char *)v279 + 2, (char *)v274 + v154 + 4, ((2 * v152 - v154 + 0x1FFFFFFFCLL) & 0x1FFFFFFFELL) + 2);
            }
            LOWORD(v279[0]) = v249;
            if (sub_3A80(v271, v288, v279))
            {
              uint64_t v251 = v288[0];
              int v252 = LOWORD(v285[0]);
              if (v288[0])
              {
                v253 = &v288[1];
                do
                {
                  __int16 v254 = *v253++;
                  __int16 v255 = v252 + 1;
                  *((_WORD *)v285 + (unsigned __int16)v252++ + 1) = v254;
                  --v251;
                }
                while (v251);
              }
              else
              {
                __int16 v255 = v285[0];
              }
              LOWORD(v285[0]) = v255;
            }
            v244 = (void **)v270;
          }
          return (void **)sub_B028(v271, 81, (__int16 *)v286, (__int16 *)v285, v281, v280, 0, 0, v269, SHIDWORD(v269), v244);
        case 82:
          LODWORD(v279[0]) = 0;
          v286[0] = 6356993;
          if (!sub_B028(v271, 82, (__int16 *)v286, 0, v281, v280, (unsigned int *)v279, 0, v269, SHIDWORD(v269), (void **)v270))return 0; {
          *(_DWORD *)(*v270 + 928) = v279[0];
          }
          return (void **)(&dword_0 + 1);
        case 84:
          uint64_t v127 = v271;
          if (!sub_AAAC()) {
            return 0;
          }
          if (HIWORD(v286[0]) != 64)
          {
            v46 = "The operand must begin with an at sign (@)";
            goto LABEL_581;
          }
          __int16 v157 = v286[0];
          if (LOWORD(v286[0]) >= 2uLL) {
            memcpy(&v283[1], &v286[1], ((2 * LOWORD(v286[0]) + 0x1FFFFFFFCLL) & 0x1FFFFFFFELL) + 2);
          }
          v283[0] = v157 - 1;
          if (sub_3A80(v271, v285, v283)) {
            return (void **)sub_B028(v271, 84, (__int16 *)v286, (__int16 *)v285, v280, v281, 0, 0, v269, SHIDWORD(v269), (void **)v270);
          }
          return 0;
        case 85:
          char v5 = 0;
          uint64_t v4 = v271;
          if (v6) {
            continue;
          }
          long long v15 = "nocross";
          goto LABEL_475;
        case 86:
          *(_DWORD *)(*v270 + 940) = 1;
LABEL_327:
          if (!sub_AAAC() || !sub_AB64()) {
            return 0;
          }
          if (LOWORD(v285[0])) {
            goto LABEL_330;
          }
          uint64_t v159 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            goto LABEL_330;
          }
          uint64_t v160 = 0;
          do
          {
            v161 = (char *)v286 + 2 * v160;
            int v164 = *((unsigned __int16 *)v161 + 1);
            v162 = v161 + 2;
            int v163 = v164;
            uint64_t v165 = *v270;
            uint64_t v166 = *(unsigned int *)(v165 + 4 * _lou_charHash(v164) + 13608);
            if (!v166) {
              goto LABEL_342;
            }
            while (1)
            {
              uint64_t v167 = v165 + 8 * v166 + 31616;
              if (*(unsigned __int16 *)(v167 + 44) == v163) {
                break;
              }
              uint64_t v166 = *(unsigned int *)(v167 + 12);
              if (!v166) {
                goto LABEL_342;
              }
            }
            if (!*(_DWORD *)(v167 + 16) && !*(_DWORD *)(v167 + 48))
            {
LABEL_342:
              uint64_t v168 = (uint64_t)v162;
              goto LABEL_554;
            }
            ++v160;
          }
          while (v160 != v159);
LABEL_330:
          uint64_t v275 = 0;
          int v158 = sub_B028(v271, v11, (__int16 *)v286, (__int16 *)v285, v281, v280, 0, &v275, v269, SHIDWORD(v269), (void **)v270);
          uint64_t v7 = v158 != 0;
          if (!((v158 == 0) | v6 & 1))
          {
            uint64_t v7 = 1;
            *(unsigned char *)(v275 + 48) = 1;
          }
          return (void **)v7;
        case 87:
        case 88:
        case 89:
        case 96:
          if (!sub_AAAC()) {
            return 0;
          }
          uint64_t v52 = LOWORD(v286[0]);
          if (!LOWORD(v286[0])) {
            return (void **)sub_B028(v271, v11, (__int16 *)v286, 0, v281, v280, 0, 0, v269, SHIDWORD(v269), (void **)v270);
          }
          uint64_t v53 = 0;
          while (1)
          {
            v54 = (char *)v286 + 2 * v53;
            int v57 = *((unsigned __int16 *)v54 + 1);
            uint64_t k = (unsigned __int16 *)(v54 + 2);
            int v56 = v57;
            uint64_t v58 = *v270;
            uint64_t v59 = *(unsigned int *)(v58 + 4 * _lou_charHash(v57) + 13608);
            if (!v59) {
              goto LABEL_553;
            }
            while (1)
            {
              uint64_t v60 = v58 + 8 * v59 + 31616;
              if (*(unsigned __int16 *)(v60 + 44) == v56) {
                break;
              }
              uint64_t v59 = *(unsigned int *)(v60 + 12);
              if (!v59) {
                goto LABEL_553;
              }
            }
            if (!*(_DWORD *)(v60 + 16) && !*(_DWORD *)(v60 + 48)) {
              goto LABEL_553;
            }
            if (++v53 == v52) {
              return (void **)sub_B028(v271, v11, (__int16 *)v286, 0, v281, v280, 0, 0, v269, SHIDWORD(v269), (void **)v270);
            }
          }
        case 109:
        case 110:
          uint64_t v68 = v271;
          if (!sub_AAAC() || !sub_AB64()) {
            return 0;
          }
          if (LOWORD(v286[0]) == 1 && LOWORD(v285[0])) {
            return (void **)sub_B028(v271, v11, (__int16 *)v286, (__int16 *)v285, v281, v280, 0, 0, v269, SHIDWORD(v269), (void **)v270);
          }
          v46 = "One Unicode character and at least one cell are required.";
LABEL_434:
          uint64_t v212 = v68;
          goto LABEL_556;
        case 112:
          uint64_t v278 = 0;
          unsigned int v277 = 0;
          memset(v279, 0, 512);
          memset(v288, 0, 512);
          unsigned int v276 = 0;
          v169 = malloc_type_malloc(0xD890uLL, 0xAE756EFDuLL);
          long long v33 = v169;
          if (!v169) {
            _lou_outOfMemory();
          }
          memset(v169, 255, 0xD890uLL);
          sub_AF70();
          sub_AAAC();
          sub_AF70();
          sub_AB64();
          if (!sub_B028(v271, 112, (__int16 *)v286, (__int16 *)v285, v281, v280, &v277, &v278, 1, SHIDWORD(v269), (void **)v270))goto LABEL_566; {
          BOOL v170 = LOWORD(v279[0]) == 1 && WORD1(v279[0]) == 45;
          }
          int v171 = v170 ? 0 : LOWORD(v279[0]);
          int v172 = _lou_pattern_compile((uint64_t)v279 + 2, v171, (unsigned __int16 *)v33 + 1, 13841, *v270, v271);
          if (!v172) {
            goto LABEL_566;
          }
          unsigned __int16 v173 = v172 + 1;
          *(_WORD *)long long v33 = v172 + 1;
          _lou_pattern_reverse((uint64_t)(v33 + 2));
          BOOL v174 = v288[0] == 1 && v288[1] == 45;
          int v175 = v174 ? 0 : v288[0];
          int v176 = _lou_pattern_compile((uint64_t)&v288[1], v175, (unsigned __int16 *)&v33[2 * v173], 13841, *v270, v271);
          if (!v176) {
            goto LABEL_566;
          }
          int v177 = v176 + v173;
          uint64_t v178 = 2 * v177;
          sub_B7D4(v271, &v276, 2 * v177, (void **)v270);
          uint64_t v179 = *v270 + 31616;
          uint64_t v278 = v179 + 8 * v277;
          v180 = (void *)(v179 + 8 * v276);
          v181 = v33;
          size_t v182 = v178;
          goto LABEL_379;
        case 113:
          uint64_t v278 = 0;
          unsigned int v277 = 0;
          memset(v279, 0, 512);
          memset(v288, 0, 512);
          unsigned int v276 = 0;
          v183 = malloc_type_malloc(0xD890uLL, 0x65060A76uLL);
          long long v33 = v183;
          if (!v183) {
            _lou_outOfMemory();
          }
          memset(v183, 255, 0xD890uLL);
          sub_AF70();
          sub_AAAC();
          sub_AF70();
          sub_AB64();
          if (!sub_B028(v271, 113, (__int16 *)v286, (__int16 *)v285, 0, 0, &v277, &v278, v269, 1, (void **)v270))goto LABEL_566; {
          BOOL v184 = LOWORD(v279[0]) == 1 && WORD1(v279[0]) == 45;
          }
          int v185 = v184 ? 0 : LOWORD(v279[0]);
          int v186 = _lou_pattern_compile((uint64_t)v279 + 2, v185, (unsigned __int16 *)v33 + 1, 13841, *v270, v271);
          if (!v186) {
            goto LABEL_566;
          }
          unsigned __int16 v187 = v186 + 1;
          *(_WORD *)long long v33 = v186 + 1;
          _lou_pattern_reverse((uint64_t)(v33 + 2));
          BOOL v188 = v288[0] == 1 && v288[1] == 45;
          int v189 = v188 ? 0 : v288[0];
          int v190 = _lou_pattern_compile((uint64_t)&v288[1], v189, (unsigned __int16 *)&v33[2 * v187], 13841, *v270, v271);
          if (!v190) {
            goto LABEL_566;
          }
          int v191 = v190 + v187;
          uint64_t v192 = 2 * v191;
          sub_B7D4(v271, &v276, 2 * v191, (void **)v270);
          uint64_t v193 = *v270 + 31616;
          uint64_t v278 = v193 + 8 * v277;
          v180 = (void *)(v193 + 8 * v276);
          v181 = v33;
          size_t v182 = v192;
LABEL_379:
          memcpy(v180, v181, v182);
          *(_DWORD *)(v278 + 40) = v276;
          goto LABEL_380;
        case 114:
LABEL_278:
          uint64_t v19 = v271;
          if (v269) {
            sub_573C(v271, "nofor and noback not allowed before class/attribute");
          }
          v145 = v270;
          if (v11 == 51)
          {
            uint64_t v146 = *v270;
            if (*(_DWORD *)(*v270 + 104) != 1)
            {
              int v147 = 2;
LABEL_422:
              *(_DWORD *)(v146 + 104) = v147;
              if (!sub_99A4(v271, v287, (uint64_t)"attribute name"))
              {
                v265 = "attribute name";
                v46 = "Expected %s";
                goto LABEL_541;
              }
              if (!*(void *)(*v270 + 8) && !sub_B8C8()) {
                return 0;
              }
              unsigned int v211 = v287[1] - 48;
              if (v211 >= 0xA) {
                unsigned int v211 = -1;
              }
              if ((v211 & 0x80000000) != 0)
              {
                v219 = (void *)*v270;
                v220 = sub_B9EC(v287, *v270);
                if (!v220)
                {
                  v220 = sub_BA50(v271, &v287[1], v287[0], v219, 1);
                  if (!v220) {
                    return 0;
                  }
                }
                unint64_t v221 = v220[1];
                if (v221 == 32 || v221 == 16) {
                  v221 |= 2uLL;
                }
              }
              else
              {
                if (v11 == 51)
                {
                  v46 = "Invalid class name: may not contain digits, use attribute instead of class";
                  goto LABEL_541;
                }
                if (v211 > 7 || v287[0] >= 2u)
                {
                  v46 = "Invalid attribute name: must be a digit between 0 and 7 or a word containing only letters";
                  goto LABEL_541;
                }
                uint64_t v228 = *v270;
                uint64_t v229 = *v270 + 8 * v211;
                unint64_t v231 = *(void *)(v229 + 40);
                v230 = (unint64_t *)(v229 + 40);
                unint64_t v221 = v231;
                if (!v231)
                {
                  unint64_t v221 = *(void *)(v228 + 24);
                  if (v221 <= 0x800000) {
                    *(void *)(v228 + 24) = 2 * v221;
                  }
                  else {
                    unint64_t v221 = 0;
                  }
                  unint64_t *v230 = v221;
                  v145 = v270;
                  uint64_t v19 = v271;
                }
              }
              memset(v279, 0, 512);
              if (!sub_AF70()) {
                return 0;
              }
              uint64_t v256 = LOWORD(v279[0]);
              if (LOWORD(v279[0]))
              {
                v257 = (unsigned __int16 *)v279 + 1;
                do
                {
                  int v258 = *v257++;
                  uint64_t v259 = sub_BF1C(v19, v258, v145, 0, *(_DWORD *)(*v145 + 920));
                  *(void *)(v259 + 24) |= v221;
                  uint64_t v260 = *(unsigned int *)(v259 + 48);
                  if (v260) {
                    uint64_t v259 = *v145 + 8 * v260 + 31616;
                  }
                  uint64_t v261 = *(unsigned int *)(v259 + 16);
                  if (v261)
                  {
                    uint64_t v262 = *v145 + 8 * v261 + 31616;
                    if (*(_WORD *)(v262 + 52) == 1)
                    {
                      uint64_t v263 = sub_5C88(*(unsigned __int16 *)(v262 + 2 * *(__int16 *)(v262 + 50) + 54), *v145);
                      if (v263) {
                        *(void *)(v263 + 24) |= v221;
                      }
                    }
                  }
                  --v256;
                }
                while (v256);
              }
              uint64_t v264 = *v145;
LABEL_603:
              ++*(_DWORD *)(v264 + 920);
              return (void **)(&dword_0 + 1);
            }
          }
          else
          {
            uint64_t v146 = *v270;
            if (v11 != 114 || *(_DWORD *)(v146 + 104) != 2)
            {
              int v147 = 1;
              goto LABEL_422;
            }
          }
          v46 = "attribute and class rules must not be both present in a table";
LABEL_541:
          uint64_t v212 = v19;
          goto LABEL_556;
        case 115:
          uint64_t v127 = v271;
          if (v269) {
            sub_573C(v271, "nofor and noback not allowed before base");
          }
          if (sub_99A4(v271, v287, (uint64_t)"attribute name"))
          {
            v194 = (void *)*v270;
            if (!*(void *)(*v270 + 8))
            {
              if (!sub_B8C8()) {
                return 0;
              }
              v194 = (void *)*v270;
            }
            v195 = sub_B9EC(v287, (uint64_t)v194);
            if (!v195)
            {
              v195 = sub_BA50(v271, &v287[1], v287[0], v194, 1);
              if (!v195) {
                return 0;
              }
            }
            unint64_t v196 = v195[1];
            if (v196 <= 0x10 && ((1 << v196) & 0x10011) != 0 || v196 > 0x100)
            {
              if (!sub_AAAC()) {
                return 0;
              }
              if (v287[0] == 1)
              {
                unsigned int v273 = 0;
                sub_BF1C(v271, v287[1], v270, &v273, *(_DWORD *)(*v270 + 920));
                if (!sub_AAAC()) {
                  return 0;
                }
                if (v287[0] == 1)
                {
                  unsigned int v272 = 0;
                  sub_BF1C(v271, v287[1], v270, &v272, *(_DWORD *)(*v270 + 920));
                  uint64_t v197 = *v270 + 8 * v273 + 31616;
                  int v198 = *(_DWORD *)(*v270 + 8 * v273 + 31664);
                  if (v198)
                  {
                    if (v198 == v272 && *(void *)(*v270 + 8 * v273 + 31648) == v195[1])
                    {
                      _lou_logMessage(10000, "%s:%d: Duplicate base rule.");
                    }
                    else
                    {
                      sub_5BF0(*(const char **)(v271 + 8), *(char **)v197);
                      _lou_logMessage(10000, "%s:%d: A different base rule already exists for this character (%s). The existing rule will take precedence over the new one.");
                    }
                  }
                  else
                  {
                    *(_DWORD *)(*v270 + 8 * v273 + 31664) = v272;
                    *(void *)(v197 + 32) = v195[1];
                    *(void *)uint64_t v197 = *(void *)(v271 + 8);
                    *(_DWORD *)(v197 + 8) = *(_DWORD *)(v271 + 24);
                    *(_DWORD *)(v197 + 56) = *(_DWORD *)(*v270 + 920);
                  }
                  uint64_t v264 = *v270;
                  goto LABEL_603;
                }
                v46 = "Exactly one base character is required.";
              }
              else
              {
                v46 = "Exactly one character followed by one base character is required.";
              }
            }
            else
            {
              v46 = "base opcode must be followed by \"uppercase\", \"digit\", or a custom attribute name.";
            }
          }
          else
          {
            v46 = "base opcode must be followed by a valid attribute name.";
          }
LABEL_581:
          uint64_t v212 = v127;
          goto LABEL_556;
        default:
          v46 = "unimplemented opcode.";
          goto LABEL_555;
      }
    }
    break;
  }
LABEL_52:
  if (!v267 || (uint64_t v23 = *v267) == 0)
  {
LABEL_60:
    if (v11 == 70)
    {
      v46 = "The uplow opcode is deprecated.";
    }
    else
    {
      v265 = _lou_showString((uint64_t)&v287[1], v287[0], 0);
      v46 = "opcode %s not defined.";
    }
    goto LABEL_476;
  }
  while (1)
  {
    long long v24 = *(const char ***)v23;
    long long v25 = **(const char ***)v23;
    if (strlen(v25) == v287[0]) {
      break;
    }
LABEL_59:
    uint64_t v23 = *(void *)(v23 + 8);
    if (!v23) {
      goto LABEL_60;
    }
  }
  long long v26 = &v287[1];
  uint64_t v27 = v287[0];
  if (v287[0])
  {
    do
    {
      int v29 = *(unsigned __int8 *)v25++;
      int v28 = v29;
      int v30 = *v26++;
      if (v30 != v28) {
        goto LABEL_59;
      }
    }
    while (--v27);
  }
  bzero(&v279[1], 0x1028uLL);
  v279[0] = *(_OWORD *)v271;
  DWORD2(v279[1]) = *(_DWORD *)(v271 + 24);
  *(void *)((char *)&v279[2] + 4) = 0;
  *(void *)((char *)&v279[1] + 12) = 0;
  v47 = (char *)malloc_type_malloc(4098 * *((int *)v24 + 9), 0x1000040A7D9112DuLL);
  v48 = v47;
  uint64_t v49 = *((unsigned int *)v24 + 9);
  if ((int)v49 < 1)
  {
    LODWORD(v50) = 0;
  }
  else
  {
    uint64_t v50 = 0;
    v51 = v47;
    while (sub_99A4(v271, v287, (uint64_t)"macro argument"))
    {
      ++v50;
      memcpy(v51, v287, 0x1002uLL);
      uint64_t v49 = *((int *)v24 + 9);
      v51 += 4098;
      if (v50 >= v49) {
        goto LABEL_145;
      }
    }
    uint64_t v49 = *((unsigned int *)v24 + 9);
  }
LABEL_145:
  if ((int)v50 < (int)v49)
  {
    v265 = (char *)v49;
    v46 = "Expected %d arguments";
    goto LABEL_476;
  }
  int v69 = *((_DWORD *)v24 + 8);
  if (v69 < 1) {
    v70 = (const char *)(v24 + 2);
  }
  else {
    v70 = v24[3];
  }
  int v199 = 0;
  uint64_t v200 = 0;
  int v201 = 0;
  for (int m = *(_DWORD *)v70; ; int m = *(_DWORD *)v210)
  {
    int v203 = m - v201;
    if (m > v201)
    {
      uint64_t v204 = 2 * v201;
      while (1)
      {
        int v205 = *(unsigned __int16 *)&v24[1][v204];
        if (v205 == 10)
        {
          if (!sub_5EB8(v279, v270, v268, v267)) {
            goto LABEL_478;
          }
          int v199 = 0;
          *(void *)((char *)&v279[2] + 4) = 0;
        }
        else
        {
          if (v199 >= 2048)
          {
            v265 = (unsigned char *)(&stru_7D8 + 40);
            v46 = "Line exceeds %d characters (post macro expansion)";
            goto LABEL_555;
          }
          v206 = (char *)v279 + 2 * v199++;
          DWORD1(v279[2]) = v199;
          *((_WORD *)v206 + 26) = v205;
        }
        v204 += 2;
        if (!--v203)
        {
          int v69 = *((_DWORD *)v24 + 8);
          int v201 = m;
          break;
        }
      }
    }
    if (v200 >= v69) {
      break;
    }
    v207 = v24[3];
    v208 = &v48[4098 * *(int *)&v207[8 * v200 + 4]];
    unsigned int v209 = *((unsigned __int16 *)v208 - 2049);
    memcpy(v288, v208 - 4096, 0x1000uLL);
    if (v209)
    {
      memcpy((char *)&v279[3] + 2 * v199 + 4, v288, 2 * v209);
      v199 += v209;
      DWORD1(v279[2]) = v199;
    }
    v210 = &v207[4 * (2 * ++v200)];
    if (v69 <= (int)v200) {
      v210 = (const char *)(v24 + 2);
    }
  }
  if (!sub_5EB8(v279, v270, v268, v267))
  {
LABEL_478:
    v227 = _lou_showString((uint64_t)&v279[3] + 4, SDWORD1(v279[2]), 0);
    _lou_logMessage(40000, "result of macro expansion was: %s", v227);
    return 0;
  }
  return (void **)(&dword_0 + 1);
}

void sub_9938(void ***a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      free(*v2);
      free(v2[1]);
      free(v2[3]);
      free(v2);
    }
    sub_9938(a1[1]);
    free(a1);
  }
}

uint64_t sub_99A4(uint64_t a1, _WORD *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(a1 + 36);
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 < v4)
  {
    uint64_t v5 = a1 + 2 * v3;
    if (*(unsigned __int16 *)(v5 + 52) <= 0x20u)
    {
      char v6 = (unsigned __int16 *)(v5 + 54);
      while (v4 - 1 != v3)
      {
        unsigned int v7 = *v6++;
        ++v3;
        if (v7 > 0x20)
        {
          *(_DWORD *)(a1 + 40) = v3;
          goto LABEL_7;
        }
      }
      *(_DWORD *)(a1 + 40) = v3 + 1;
      *a2 = 0;
      goto LABEL_22;
    }
  }
LABEL_7:
  *a2 = 0;
  if (v3 >= v4 || (unsigned int v8 = *(unsigned __int16 *)(a1 + 2 * v3 + 52), v8 < 0x21))
  {
LABEL_22:
    if (a3) {
      sub_567C(a1, "%s not specified.");
    }
    return 0;
  }
  unsigned int v9 = 0;
  int v10 = v3;
  uint64_t v11 = 2 * v3 + 54;
  do
  {
    if (v9 >= 0x800)
    {
      *(_DWORD *)(a1 + 40) = v10;
      sub_567C(a1, "more than %d characters (bytes)");
      return 0;
    }
    unsigned int v12 = v9 + 1;
    *a2 = v9 + 1;
    a2[v9 + 1] = v8;
    if (v4 - 1 == v3)
    {
      *(_DWORD *)(a1 + 40) = v3 + 1;
      a2[v12 + 1] = 0;
      return 1;
    }
    ++v10;
    unsigned int v8 = *(unsigned __int16 *)(a1 + v11);
    v11 += 2;
    ++v3;
    ++v9;
  }
  while (v8 >= 0x21);
  *(_DWORD *)(a1 + 40) = v3;
  if (!v12) {
    goto LABEL_22;
  }
  a2[v12 + 1] = 0;
  if (v3 < v4)
  {
    uint64_t v13 = (unsigned __int16 *)(a1 + 2 * v3 + 52);
    do
    {
      unsigned int v14 = *v13++;
      if (v14 > 0x20) {
        break;
      }
      *(_DWORD *)(a1 + 40) = ++v3;
    }
    while (v4 != v3);
  }
  return 1;
}

void sub_9B14()
{
  uint64_t v0 = __chkstk_darwin();
  __src = v1;
  uint64_t v2 = v0;
  uint64_t v50 = v3;
  sub_B7D4(v0, 0, 250000, v3);
  int v4 = malloc_type_malloc(0xFFF8uLL, 0x20040C05A361CuLL);
  uint64_t v5 = (uint64_t)v4;
  if (!v4) {
    _lou_outOfMemory();
  }
  bzero(v4, 0xFFF8uLL);
  uint64_t v56 = 1;
  char v6 = (unsigned int *)malloc_type_malloc(0x10uLL, 0x10220409E769576uLL);
  int v57 = v6;
  if (!v6) {
    _lou_outOfMemory();
  }
  LOWORD(v7) = 0;
  memset(v59, 0, 512);
  memset(v58, 0, 512);
  v51 = (_DWORD *)v2;
  *(void *)char v6 = 0;
  *((void *)v6 + 1) = 0xFFFF00000000;
  unsigned int v55 = 0;
  unsigned int v8 = (void *)v5;
  do
  {
    if (__src[1] == 73)
    {
      if (!sub_99A4(v2, v59, 0)) {
        goto LABEL_38;
      }
    }
    else
    {
      if (!sub_99A4(v2, v58, 0)) {
        goto LABEL_38;
      }
      sub_349C(v2, v59, v58);
    }
    uint64_t v9 = v59[0];
    if (v59[0] && v59[1] != 35 && v59[1] != 37 && v59[1] != 60)
    {
      int v10 = 0;
      v60[0] = 48;
      uint64_t v11 = &v59[1];
      do
      {
        int v13 = *v11++;
        __int16 v12 = v13;
        if ((v13 - 48) > 9)
        {
          *((_WORD *)v58 + ++v10) = v12;
          LOBYTE(v12) = 48;
        }
        v60[v10] = v12;
        --v9;
      }
      while (v9);
      *((_WORD *)v58 + v10 + 1) = 0;
      LOWORD(v58[0]) = v10;
      unsigned int v14 = v60;
      v60[v10 + 1] = 0;
      LODWORD(v15) = v10 + 3;
      do
      {
        int v16 = *v14++;
        size_t v15 = (v15 - 1);
      }
      while (v16 == 48);
      unsigned int v17 = sub_D8C8(v5, v58);
      unsigned int v18 = v17;
      if (v17 == 0xFFFF) {
        unsigned int v18 = sub_D988((int *)&v56, v5, v58);
      }
      if ((int)v15 >= 1)
      {
        uint64_t v19 = v14 - 1;
        uint64_t v20 = &v57[4 * v18];
        sub_B7D4((uint64_t)v51, v20 + 2, v15, v50);
        memcpy((char *)*v50 + 8 * v20[2] + 31616, v19, v15);
      }
      if (v17 != 0xFFFF)
      {
        LOWORD(v7) = v18;
        goto LABEL_38;
      }
      int v21 = v10;
      while (2)
      {
        int v22 = v21 - 1;
        LOWORD(v58[0]) = v21 - 1;
        __int16 v23 = *((_WORD *)v58 + (unsigned __int16)v21);
        int v24 = sub_D8C8(v5, v58);
        int v7 = v24;
        if (v24 == 0xFFFF) {
          int v7 = sub_D988((int *)&v56, v5, v58);
        }
        long long v25 = &v57[4 * v7];
        long long v26 = (__int16 *)v25 + 7;
        uint64_t v27 = *((unsigned __int16 *)v25 + 7);
        if (*((_WORD *)v25 + 7))
        {
          int v28 = *(void **)v25;
          if (((v27 - 1) & v27) != 0)
          {
            __int16 v29 = *((_WORD *)v25 + 7);
            goto LABEL_35;
          }
          int v28 = malloc_type_realloc(v28, 8 * v27, 0x100004052888210uLL);
        }
        else
        {
          int v28 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
        }
        *(void *)long long v25 = v28;
        __int16 v29 = *v26;
LABEL_35:
        *((_WORD *)v28 + 2 * v27) = v23;
        *(_WORD *)(*(void *)v25 + 4 * v27 + 2) = v18;
        *long long v26 = v29 + 1;
        LOWORD(v18) = v7;
        int v21 = v22;
        uint64_t v5 = (uint64_t)v8;
        if (v24 != 0xFFFF) {
          break;
        }
        continue;
      }
    }
LABEL_38:
    uint64_t v2 = (uint64_t)v51;
  }
  while (_lou_getALine(v51));
  uint64_t v30 = 0;
  __srca = v57;
  do
  {
    uint64_t v52 = v30;
    for (uint64_t i = (uint64_t **)v8[v30]; i; uint64_t i = (uint64_t **)*i)
    {
      long long v32 = i[1];
      unsigned int v33 = *(unsigned __int16 *)v32;
      if (*(_WORD *)v32)
      {
        __int16 v34 = v33 - 1;
        uint64_t v35 = 2 * *(unsigned __int16 *)v32;
        long long v36 = (char *)v32 + 4;
        unsigned int v37 = 1;
        while (1)
        {
          if (v37 >= v33)
          {
            __int16 v38 = 0;
          }
          else
          {
            memcpy((char *)v58 + 2, v36, ((v35 + 0x1FFFFFFFCLL) & 0x1FFFFFFFELL) + 2);
            __int16 v38 = v34;
          }
          LOWORD(v58[0]) = v38;
          int v39 = sub_D8C8((uint64_t)v8, v58);
          if (v39 != 0xFFFF) {
            break;
          }
          --v34;
          ++v37;
          v36 += 2;
          v35 -= 2;
          if (!v35)
          {
            LOWORD(v7) = -1;
            goto LABEL_50;
          }
        }
        LOWORD(v7) = v39;
      }
LABEL_50:
      uint64_t v40 = *((int *)i + 4);
      if (v40) {
        LOWORD(__srca[4 * v40 + 3]) = v7;
      }
    }
    uint64_t v30 = v52 + 1;
  }
  while (v52 != 8190);
  for (uint64_t j = 0; j != 0x1FFF; ++j)
  {
    long long v42 = (void **)v8[j];
    if (v42)
    {
      do
      {
        long long v43 = (void **)*v42;
        free(v42[1]);
        free(v42);
        long long v42 = v43;
      }
      while (v43);
    }
  }
  free(v8);
  int v44 = v56;
  if ((int)v56 >= 1)
  {
    uint64_t v45 = v56;
    v46 = __srca;
    do
    {
      if (*((_WORD *)v46 + 7))
      {
        v47 = *(void **)v46;
        sub_B7D4((uint64_t)v51, v46, 4 * *((unsigned __int16 *)v46 + 7), v50);
        memcpy((char *)*v50 + 8 * *v46 + 31616, v47, 4 * *((unsigned __int16 *)v46 + 7));
        free(v47);
      }
      else
      {
        unsigned int *v46 = 0;
      }
      v46 += 4;
      --v45;
    }
    while (v45);
  }
  sub_B7D4((uint64_t)v51, &v55, 16 * v44, v50);
  uint64_t v48 = v55;
  uint64_t v49 = *v50;
  v49[636] = v55;
  memcpy(&v49[2 * v48 + 7904], __srca, 16 * v44);
  free(__srca);
}

uint64_t sub_A16C(unsigned __int16 *a1)
{
  unsigned int v3 = *a1;
  uint64_t v1 = a1 + 1;
  uint64_t v2 = v3;
  uint64_t v4 = dword_27C54;
  while (v2 != word_259F4[v4])
  {
LABEL_8:
    if ((v4 + 1) <= 0x74) {
      uint64_t v4 = (v4 + 1);
    }
    else {
      uint64_t v4 = 0;
    }
    if (v4 == dword_27C54) {
      return 117;
    }
  }
  if (v2)
  {
    uint64_t v5 = off_20368[v4];
    char v6 = v1;
    uint64_t v7 = v2;
    do
    {
      int v9 = *v5++;
      int v8 = v9;
      int v10 = *v6++;
      if (v10 != v8) {
        goto LABEL_8;
      }
    }
    while (--v7);
  }
  dword_27C54 = v4;
  return v4;
}

void **sub_A1F0(const char **a1, _WORD *a2)
{
  uint64_t v3 = (unsigned __int16)*a2;
  if (*a2)
  {
    uint64_t v4 = 0;
    do
    {
      v8[v4] = a2[v4 + 1];
      ++v4;
    }
    while (v3 != v4);
    if (v3 >= 0x800)
    {
      sub_567C((uint64_t)a1, "Include statement too long: 'include %s'");
      return 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  v8[v3] = 0;
  uint64_t result = (void **)_lou_resolveTable(v8, *a1);
  if (result)
  {
    char v6 = result;
    if (result[1])
    {
      sub_4354(result);
      sub_567C((uint64_t)a1, "Table list not supported in include statement: 'include %s'");
      return 0;
    }
    BOOL v7 = sub_5CE4();
    sub_4354(v6);
    if (!v7)
    {
      _lou_logMessage(40000, "%s:%d: Error in included file", *a1, *((_DWORD *)a1 + 6));
      return 0;
    }
    return (void **)(&dword_0 + 1);
  }
  else
  {
    ++dword_262E0;
  }
  return result;
}

uint64_t sub_A348()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  int v8 = v7;
  uint64_t v10 = v9;
  int v12 = v11;
  uint64_t v13 = v0;
  memset(v22, 0, 512);
  memset(v21, 0, 512);
  uint64_t result = sub_AAAC();
  if (result)
  {
    uint64_t result = sub_AB64();
    if (result)
    {
      if (LOWORD(v22[0]) == 1)
      {
        uint64_t v15 = LOWORD(v21[0]);
        if (LOWORD(v21[0]))
        {
          if (v4)
          {
            if ((v10 & 0x30) != 0) {
              v10 |= 2uLL;
            }
            uint64_t v16 = sub_BF1C(v13, WORD1(v22[0]), v4, 0, *(_DWORD *)(*v4 + 920));
            uint64_t v20 = v10;
            *(void *)(v16 + 24) |= v10;
            uint64_t v17 = v15;
            do
            {
              int v18 = *((unsigned __int16 *)v21 + v17);
              uint64_t v19 = sub_5C88(v18, *v4);
              if (!v19) {
                uint64_t v19 = sub_DB10(v13, v18, v4, *(_DWORD *)(*v4 + 920));
              }
              --v17;
            }
            while ((unint64_t)(v17 + 1) > 1);
            if (v15 != 1) {
              goto LABEL_18;
            }
            *(void *)(v19 + 24) |= v20;
          }
          if (v2)
          {
            if (v15 == 1) {
              sub_AC40(v13, WORD1(v22[0]), WORD1(v21[0]), v2);
            }
          }
          if (!v4) {
            return 1;
          }
LABEL_18:
          uint64_t result = sub_B028(v13, v12, (__int16 *)v22, (__int16 *)v21, 0, 0, 0, 0, v8, v6, (void **)v4);
          if (!result) {
            return result;
          }
          return 1;
        }
        sub_567C(v13, "At least one cell is required.");
      }
      else
      {
        sub_567C(v13, "Exactly one character is required.");
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_A5D4()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  int v8 = v7;
  uint64_t v9 = v0;
  memset(v22, 0, 512);
  memset(v21, 0, 512);
  memset(v19, 0, 512);
  uint64_t result = sub_99A4(v0, v22, (uint64_t)"name operand");
  if (result)
  {
    uint64_t result = sub_AAAC();
    if (result)
    {
      memset(v20, 0, 512);
      uint64_t result = sub_99A4(v9, v20, (uint64_t)"dots operand");
      if (result)
      {
        if (v20[0])
        {
          uint64_t v11 = 0;
          while (v20[v11 + 1] != 44)
          {
            if (v20[0] == ++v11) {
              goto LABEL_11;
            }
          }
        }
        else
        {
          LODWORD(v11) = 0;
        }
        if (v11 == v20[0])
        {
LABEL_11:
          sub_567C(v9, "Dots operand must consist of two cells separated by a comma");
          return 0;
        }
        v20[v11 + 1] = 45;
        uint64_t result = sub_3A80(v9, v19, v20);
        if (result)
        {
          if (v21[0] != 2 || LOWORD(v19[0]) != 2)
          {
            sub_567C(v9, "two Unicode characters and two cells separated by a comma are needed.");
            return 0;
          }
          if (!v4) {
            goto LABEL_20;
          }
          int v18 = 0;
          uint64_t v12 = sub_BF1C(v9, (unsigned __int16)v21[1], v4, 0, *(_DWORD *)(*v4 + 920));
          *(void *)(v12 + 24) |= 0x40uLL;
          uint64_t v13 = sub_BF1C(v9, (unsigned __int16)v21[2], v4, 0, *(_DWORD *)(*v4 + 920));
          *(void *)(v13 + 24) |= 0x40uLL;
          uint64_t v14 = sub_DB10(v9, WORD1(v19[0]), v4, *(_DWORD *)(*v4 + 920));
          *(void *)(v14 + 24) |= 0x40uLL;
          uint64_t v15 = sub_DB10(v9, WORD2(v19[0]), v4, *(_DWORD *)(*v4 + 920));
          *(void *)(v15 + 24) |= 0x40uLL;
          uint64_t result = sub_B028(v9, 69, v21, (__int16 *)v19, 0, 0, (unsigned int *)&v18, 0, v8, v6, (void **)v4);
          if (result)
          {
            uint64_t result = sub_DC0C(v9, v22, v18, *v4);
            if (result)
            {
LABEL_20:
              if (v2)
              {
                sub_AC40(v9, (unsigned __int16)v21[1], WORD1(v19[0]), v2);
                sub_AC40(v9, (unsigned __int16)v21[2], WORD2(v19[0]), v2);
              }
              if (!v4) {
                return 1;
              }
              __int16 v16 = v21[2];
              __int16 v17 = WORD2(v19[0]);
              LOWORD(v19[0]) = 1;
              v21[0] = 1;
              uint64_t result = sub_B028(v9, 64, v21, (__int16 *)v19, 0, 0, 0, 0, v8, v6, (void **)v4);
              if (result)
              {
                v21[1] = v16;
                WORD1(v19[0]) = v17;
                uint64_t result = sub_B028(v9, 64, v21, (__int16 *)v19, 0, 0, 0, 0, v8, v6, (void **)v4);
                if (result) {
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_AAAC()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  memset(v5, 0, 512);
  uint64_t result = sub_99A4(v0, v5, (uint64_t)"Characters operand");
  if (result) {
    return sub_349C(v3, v2, v5);
  }
  return result;
}

uint64_t sub_AB64()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  memset(v5, 0, 512);
  uint64_t result = sub_99A4(v0, v5, (uint64_t)"Dots operand");
  if (result)
  {
    if (LOWORD(v5[0]) == 1 && WORD1(v5[0]) == 61)
    {
      *uint64_t v2 = 0;
      return 1;
    }
    else
    {
      return sub_3A80(v3, v2, v5);
    }
  }
  return result;
}

uint64_t sub_AC40(uint64_t a1, int a2, int a3, void **a4)
{
  int v8 = (char *)*a4;
  if (*a4)
  {
    uint64_t v9 = &v8[4 * _lou_charHash(a2) + 8];
    while (1)
    {
      uint64_t v10 = *(unsigned int *)v9;
      if (!v10) {
        break;
      }
      uint64_t v9 = &v8[8 * v10 + 8992];
      if (*((unsigned __int16 *)v9 + 2) == a2)
      {
        uint64_t v11 = (char *)*a4;
        if (*a4) {
          goto LABEL_13;
        }
        goto LABEL_6;
      }
    }
  }
  unsigned int v28 = 0;
  sub_DCFC(a1, &v28, a4);
  uint64_t v18 = (uint64_t)*a4 + 8 * v28;
  *(_DWORD *)(v18 + 8992) = 0;
  *(_WORD *)(v18 + 8996) = a2;
  *(_WORD *)(v18 + 8998) = a3;
  uint64_t v19 = _lou_charHash(a2);
  uint64_t v11 = (char *)*a4;
  uint64_t v20 = (uint64_t)*a4 + 4 * v19;
  unsigned int v23 = *(_DWORD *)(v20 + 8);
  int v22 = (unsigned int *)(v20 + 8);
  uint64_t v21 = v23;
  if (v23)
  {
    do
    {
      int v24 = &v11[8 * v21];
      uint64_t v21 = *((unsigned int *)v24 + 2248);
    }
    while (v21);
    *((_DWORD *)v24 + 2248) = v28;
  }
  else
  {
    *int v22 = v28;
  }
LABEL_13:
  uint64_t result = _lou_charHash(a3);
  long long v25 = &v11[4 * result + 4500];
  while (1)
  {
    uint64_t v26 = *(unsigned int *)v25;
    if (!v26) {
      break;
    }
    long long v25 = &v11[8 * v26 + 8992];
    if (*((unsigned __int16 *)v25 + 2) == a3) {
      return result;
    }
  }
LABEL_6:
  unsigned int v27 = 0;
  sub_DCFC(a1, &v27, a4);
  uint64_t v12 = (uint64_t)*a4 + 8 * v27;
  *(_DWORD *)(v12 + 8992) = 0;
  *(_WORD *)(v12 + 8996) = a3;
  *(_WORD *)(v12 + 8998) = a2;
  uint64_t result = _lou_charHash(a3);
  uint64_t v14 = (uint64_t)*a4 + 4 * result;
  uint64_t v15 = *(unsigned int *)(v14 + 4500);
  if (v15)
  {
    do
    {
      uint64_t v16 = (uint64_t)*a4 + 8 * v15;
      uint64_t v15 = *(unsigned int *)(v16 + 8992);
    }
    while (v15);
    __int16 v17 = (unsigned int *)(v16 + 8992);
  }
  else
  {
    __int16 v17 = (unsigned int *)(v14 + 4500);
  }
  unsigned int *v17 = v27;
  return result;
}

uint64_t sub_ADE4()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  int v4 = v3;
  int v6 = v5;
  int v8 = v7;
  int v10 = v9;
  uint64_t v11 = v0;
  memset(v15, 0, 512);
  memset(v14, 0, 512);
  uint64_t result = sub_99A4(v0, v15, v12);
  if (result)
  {
    uint64_t result = sub_3A80(v11, v14, v15);
    if (result) {
      return sub_B028(v11, v10, 0, (__int16 *)v14, 0, 0, v8, 0, v6, v4, v2);
    }
  }
  return result;
}

uint64_t sub_AF70()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  memset(v5, 0, 512);
  uint64_t result = sub_99A4(v0, v5, (uint64_t)"characters");
  if (result) {
    return sub_349C(v3, v2, v5);
  }
  return result;
}

uint64_t sub_B028(uint64_t a1, int a2, __int16 *a3, __int16 *a4, uint64_t a5, uint64_t a6, unsigned int *a7, uint64_t *a8, int a9, int a10, void **a11)
{
  if (a3)
  {
    int v19 = 2 * (unsigned __int16)*a3 + 60;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v19 = 60;
  if (a4) {
LABEL_3:
  }
    v19 += 2 * (unsigned __int16)*a4;
LABEL_4:
  unsigned int v97 = 0;
  sub_B7D4(a1, &v97, v19, a11);
  unsigned int v20 = v97;
  uint64_t v21 = (uint64_t)*a11 + 8 * v97 + 31616;
  if (a8) {
    *a8 = v21;
  }
  if (a7) {
    *a7 = v20;
  }
  *(void *)uint64_t v21 = *(void *)(a1 + 8);
  int v22 = *(_DWORD *)(a1 + 24);
  int v23 = *((_DWORD *)*a11 + 230);
  *((_DWORD *)*a11 + 230) = v23 + 1;
  *(_DWORD *)(v21 + 8) = v22;
  *(_DWORD *)(v21 + 12) = v23;
  *(_DWORD *)(v21 + 44) = a2;
  *(void *)(v21 + 24) = a5;
  *(void *)(v21 + 32) = a6;
  *(unsigned char *)(v21 + 48) = 0;
  if (a3)
  {
    uint64_t v24 = *a3;
    __int16 v25 = *a3;
    *(_WORD *)(v21 + 50) = v24;
    memcpy((void *)(v21 + 54), a3 + 1, 2 * v24);
    if (a4)
    {
LABEL_10:
      uint64_t v26 = *a4;
      *(_WORD *)(v21 + 52) = v26;
      memcpy((void *)(v21 + 2 * v25 + 54), a4 + 1, 2 * v26);
      goto LABEL_15;
    }
  }
  else
  {
    __int16 v25 = 0;
    *(_WORD *)(v21 + 50) = 0;
    if (a4) {
      goto LABEL_10;
    }
  }
  *(_WORD *)(v21 + 52) = 0;
LABEL_15:
  if ((a2 - 58) >= 3)
  {
    if ((a2 - 74) > 4 || a2 == 74 && *(__int16 *)(v21 + 50) > 0)
    {
      if (a10)
      {
LABEL_20:
        if (!a9)
        {
          int v27 = *(_DWORD *)(v21 + 44);
          if (v27 == 74)
          {
            unsigned int v28 = (unsigned __int16 *)(v21 + 54);
            __int16 v29 = (__int16 *)(v21 + 50);
          }
          else
          {
            unsigned int v28 = (unsigned __int16 *)(v21 + 2 * *(__int16 *)(v21 + 50) + 54);
            __int16 v29 = (__int16 *)(v21 + 52);
          }
          int v37 = *v29;
          if (v37 == 1)
          {
            if (v27 != 58 && v27 != 79)
            {
              uint64_t v38 = v97;
              uint64_t v39 = sub_DB10(a1, *v28, (uint64_t *)a11, *(_DWORD *)(v21 + 12));
              uint64_t v40 = (__int16 *)*a11;
              uint64_t v41 = (uint64_t)*a11 + 8 * v38 + 31616;
              unsigned int v42 = *((_DWORD *)*a11 + 2 * v38 + 7915) - 61;
              if (v42 <= 8) {
                *(_DWORD *)(v39 + 16) = v38;
              }
              unsigned int v45 = *(_DWORD *)(v39 + 20);
              long long v43 = (_DWORD *)(v39 + 20);
              uint64_t v44 = v45;
              if (v45)
              {
                int v46 = *(__int16 *)(v41 + 50);
                uint64_t v47 = (uint64_t)&v40[4 * v44 + 15808];
                if (v46 <= v40[4 * v44 + 15833])
                {
                  while (v40[4 * v44 + 15834])
                  {
                    if (v42 >= 9 && (*(_DWORD *)(v47 + 44) - 70) >= 0xFFFFFFF7) {
                      break;
                    }
                    uint64_t v44 = *(unsigned int *)(v47 + 20);
                    long long v43 = (_DWORD *)(v47 + 20);
                    if (!*(_DWORD *)(v47 + 20)) {
                      break;
                    }
                    uint64_t v47 = (uint64_t)&v40[4 * v44 + 15808];
                    if (v46 > v40[4 * v44 + 15833]) {
                      break;
                    }
                  }
                }
              }
              *(_DWORD *)(v41 + 20) = v44;
              *long long v43 = v38;
            }
            if (a8) {
              *a8 = (uint64_t)*a11 + 8 * v97 + 31616;
            }
          }
          else if (v37 >= 2)
          {
            unsigned int v53 = v97;
            v54 = (char *)*a11;
            uint64_t v55 = _lou_stringHash(v28, 0, 0);
            int v56 = *(_DWORD *)(v21 + 44);
            if (v56 != 58)
            {
              int v57 = &v54[4 * v55 + 27124];
              uint64_t v58 = *(unsigned int *)v57;
              if (v58)
              {
                int v59 = *(__int16 *)(v21 + 50) + v37;
                uint64_t v60 = (uint64_t)&v54[8 * v58 + 31616];
                for (int i = *(__int16 *)&v54[8 * v58 + 31666] + *(__int16 *)&v54[8 * v58 + 31668];
                      v59 <= i;
                      int i = *(__int16 *)&v54[8 * v58 + 31666] + *(__int16 *)&v54[8 * v58 + 31668])
                {
                  if (i == v59 && v56 != 83 && *(_DWORD *)(v60 + 44) == 83) {
                    break;
                  }
                  uint64_t v58 = *(unsigned int *)(v60 + 20);
                  int v57 = (char *)(v60 + 20);
                  if (!*(_DWORD *)(v60 + 20)) {
                    break;
                  }
                  uint64_t v60 = (uint64_t)&v54[8 * v58 + 31616];
                }
              }
              *(_DWORD *)(v21 + 20) = v58;
              *(_DWORD *)int v57 = v53;
            }
          }
        }
        return 1;
      }
      int v30 = *(__int16 *)(v21 + 50);
      if (v30 != 1)
      {
        if (v30 >= 2)
        {
          unsigned int v48 = v97;
          uint64_t v49 = (char *)*a11;
          uint64_t v50 = &v49[4 * _lou_stringHash((unsigned __int16 *)(v21 + 54), 0, 0) + 22632];
          uint64_t v51 = *(unsigned int *)v50;
          if (v51)
          {
            uint64_t v52 = (uint64_t)&v49[8 * v51 + 31616];
            if (*(__int16 *)(v21 + 50) <= *(__int16 *)&v49[8 * v51 + 31666])
            {
              int v85 = *(unsigned __int16 *)(v21 + 50);
              int v86 = *(unsigned __int16 *)&v49[8 * v51 + 31666];
              do
              {
                if (v85 == v86 && *(_DWORD *)(v52 + 44) == 83 && *(_DWORD *)(v21 + 44) != 83) {
                  break;
                }
                uint64_t v51 = *(unsigned int *)(v52 + 16);
                uint64_t v50 = (char *)(v52 + 16);
                if (!*(_DWORD *)(v52 + 16)) {
                  break;
                }
                uint64_t v52 = (uint64_t)&v49[8 * v51 + 31616];
                int v86 = *(unsigned __int16 *)&v49[8 * v51 + 31666];
              }
              while (*(__int16 *)&v49[8 * v51 + 31666] >= (__int16)v85);
            }
          }
          *(_DWORD *)(v21 + 16) = v51;
          *(_DWORD *)uint64_t v50 = v48;
        }
        goto LABEL_20;
      }
      uint64_t v31 = v97;
      int v32 = *(_DWORD *)(v21 + 44);
      if ((v32 - 76) <= 2)
      {
        uint64_t v33 = sub_DB10(a1, *(unsigned __int16 *)(v21 + 54), (uint64_t *)a11, *(_DWORD *)(v21 + 12));
        uint64_t v34 = (uint64_t)*a11 + 8 * v31 + 31616;
        goto LABEL_102;
      }
      unsigned int v62 = v32 - 49;
      uint64_t v63 = sub_BF1C(a1, *(unsigned __int16 *)(v21 + 54), (uint64_t *)a11, 0, *(_DWORD *)(v21 + 12));
      uint64_t v33 = v63;
      if (v62 <= 1)
      {
        *(_DWORD *)(v63 + 40) = v31;
LABEL_109:
        uint64_t v21 = (uint64_t)*a11 + 8 * v97 + 31616;
        if (a8) {
          *a8 = v21;
        }
        goto LABEL_20;
      }
      uint64_t v34 = (uint64_t)*a11 + 8 * v31 + 31616;
      unsigned int v64 = *((_DWORD *)*a11 + 2 * v31 + 7915);
      if (v64 - 61 > 8)
      {
LABEL_102:
        unsigned int v92 = *(_DWORD *)(v33 + 20);
        unint64_t v91 = (_DWORD *)(v33 + 20);
        uint64_t v90 = v92;
        if (v92)
        {
          for (uint64_t j = (uint64_t)*a11 + 8 * v90 + 31616; *((_WORD *)*a11 + 4 * v90 + 15833); uint64_t j = (uint64_t)*a11
                                                                                           + 8 * v90
                                                                                           + 31616)
          {
            if ((*(_DWORD *)(j + 44) - 61) <= 8 && (*(_DWORD *)(v34 + 44) - 61) > 8) {
              break;
            }
            uint64_t v90 = *(unsigned int *)(j + 16);
            unint64_t v91 = (_DWORD *)(j + 16);
            if (!*(_DWORD *)(j + 16)) {
              break;
            }
          }
        }
        *(_DWORD *)(v34 + 16) = v90;
        *unint64_t v91 = v31;
        goto LABEL_109;
      }
      uint64_t v65 = *(unsigned int *)(v63 + 16);
      if (!v65)
      {
        *(_DWORD *)(v63 + 16) = v31;
        goto LABEL_102;
      }
      uint64_t v66 = (uint64_t)*a11 + 8 * v65;
      v67 = (char **)(v66 + 31616);
      uint64_t v68 = *(unsigned int *)(v66 + 31660);
      if (v68 <= 0x74)
      {
        int v95 = strdup(off_20368[v68]);
      }
      else
      {
        __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", v68);
        unsigned int v64 = *(_DWORD *)(v34 + 44);
        int v95 = strdup(byte_25ADE);
        if (v64 >= 0x75)
        {
          unsigned int v94 = v64;
          int v69 = byte_25ADE;
          __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", v94);
LABEL_101:
          int v87 = strdup(v69);
          uint64_t v96 = *(const char **)a1;
          int v88 = *v67;
          int v89 = *(_DWORD *)(a1 + 24);
          sub_5BF0(*(const char **)(a1 + 8), v88);
          _lou_logMessage(10000, "%s:%d: Character already defined (%s). The existing %s rule will take precedence over the new %s rule.", v96, v89, (const char *)qword_27450, v95, v87);
          free(v95);
          free(v87);
          goto LABEL_102;
        }
      }
      int v69 = off_20368[v64];
      goto LABEL_101;
    }
    if (!a10)
    {
      uint64_t v35 = (char *)*a11;
      switch(*(_DWORD *)(v21 + 44))
      {
        case 'J':
          uint64_t v36 = 22596;
          goto LABEL_66;
        case 'K':
          uint64_t v36 = 22592;
          goto LABEL_66;
        case 'L':
          uint64_t v36 = 22600;
          goto LABEL_66;
        case 'M':
          uint64_t v36 = 22604;
          goto LABEL_66;
        case 'N':
          uint64_t v36 = 22608;
LABEL_66:
          v70 = &v35[v36];
          unsigned int v71 = v97;
          do
          {
            unsigned int v72 = v70;
            uint64_t v73 = *(unsigned int *)v70;
            if (!v73) {
              break;
            }
            uint64_t v74 = &v35[8 * v73];
            int v75 = *((__int16 *)v74 + 15833);
            v70 = v74 + 31632;
          }
          while (*(__int16 *)(v21 + 50) <= v75);
          *(_DWORD *)(v21 + 16) = v73;
          *(_DWORD *)unsigned int v72 = v71;
          if (!a9) {
            goto LABEL_70;
          }
          return 1;
        default:
          return 0;
      }
    }
    if (!a9)
    {
LABEL_70:
      uint64_t v76 = (char *)*a11;
      switch(*(_DWORD *)(v21 + 44))
      {
        case 'J':
          uint64_t v77 = 22616;
          break;
        case 'K':
          uint64_t v77 = 22612;
          break;
        case 'L':
          uint64_t v77 = 22620;
          break;
        case 'M':
          uint64_t v77 = 22624;
          break;
        case 'N':
          uint64_t v77 = 22628;
          break;
        default:
          return 0;
      }
      uint64_t v79 = &v76[v77];
      unsigned int v80 = v97;
      do
      {
        unint64_t v81 = v79;
        uint64_t v82 = *(unsigned int *)v79;
        if (!v82) {
          break;
        }
        BOOL v83 = &v76[8 * v82];
        int v84 = *((__int16 *)v83 + 15833);
        uint64_t v79 = v83 + 31636;
      }
      while (*(__int16 *)(v21 + 50) <= v84);
      *(_DWORD *)(v21 + 20) = v82;
      *(_DWORD *)unint64_t v81 = v80;
    }
  }
  return 1;
}

void sub_B7D4(uint64_t a1, _DWORD *a2, int a3, void **a4)
{
  unsigned int v5 = (a3 + 7) & 0xFFFFFFF8;
  int v6 = *a4;
  uint64_t v7 = *(unsigned int *)*a4;
  unsigned int v8 = *((_DWORD *)*a4 + 1) + v5;
  if (v8 > v7)
  {
    unsigned int v11 = v8 + (v8 >> 3);
    uint64_t v12 = malloc_type_realloc(*a4, v11, 0x950EC15FuLL);
    int v6 = v12;
    if (!v12)
    {
      sub_567C(a1, "Not enough memory for translation table.");
      _lou_outOfMemory();
    }
    bzero((char *)v12 + v7, v11 - v7);
    uint64_t v13 = (void *)qword_27320;
    if (qword_27320)
    {
      do
      {
        if ((void *)v13[1] == *a4) {
          v13[1] = v6;
        }
        uint64_t v13 = (void *)*v13;
      }
      while (v13);
    }
    *int v6 = v11;
    *a4 = v6;
  }
  if (a2)
  {
    *a2 = ((unint64_t)v6[1] + 0x7FFFF8478) >> 3;
    v6[1] += v5;
  }
}

void *sub_B8C8()
{
  uint64_t v0 = __chkstk_darwin();
  int v1 = 0;
  *(void *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_1CC10;
  while (v1 != 9)
  {
    uint64_t v2 = off_20710[v1];
    int v3 = strlen(v2);
    if (v3 >= 1)
    {
      uint64_t v4 = v3;
      unsigned int v5 = v9;
      do
      {
        unsigned __int16 v6 = *v2++;
        *v5++ = v6;
        --v4;
      }
      while (v4);
    }
    uint64_t v7 = sub_BA50(0, v9, v3, (void *)v0, 0);
    if (v7)
    {
      ++v1;
    }
    else
    {
      uint64_t result = *(void **)(v0 + 8);
      if (!result) {
        return result;
      }
      do
      {
        *(void *)(v0 + 8) = *result;
        free(result);
        uint64_t result = *(void **)(v0 + 8);
      }
      while (result);
    }
    if (!v7) {
      return 0;
    }
  }
  return (void *)(&dword_0 + 1);
}

uint64_t **sub_B9EC(unsigned __int16 *a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t ***)(a2 + 8);
  if (v2)
  {
    int v3 = a1 + 1;
    unsigned int v4 = *a1;
    do
    {
      if (v4 == *((unsigned __int16 *)v2 + 8) && !memcmp(v3, (char *)v2 + 18, 2 * v4)) {
        break;
      }
      uint64_t v2 = (uint64_t **)*v2;
    }
    while (v2);
  }
  return v2;
}

void *sub_BA50(uint64_t a1, unsigned __int16 *a2, int a3, void *a4, int a5)
{
  if (a5)
  {
    if (a3 >= 1)
    {
      uint64_t v9 = a3;
      int v10 = a2;
      do
      {
        int v11 = *v10++;
        if ((v11 & 0xFFFFFFDF) - 65 >= 0x1A) {
          sub_567C(a1, "Invalid attribute name: must be a digit between 0 and 7 or a word containing only letters");
        }
        --v9;
      }
      while (v9);
    }
    uint64_t v12 = 0;
    while (1)
    {
      if (strlen(off_20760[v12]) == a3)
      {
        if (a3 < 1)
        {
          LODWORD(v13) = 0;
        }
        else
        {
          uint64_t v13 = 0;
          while (off_20760[v12][v13] == a2[v13])
          {
            if (a3 == ++v13) {
              goto LABEL_21;
            }
          }
        }
        if (v13 == a3) {
          break;
        }
      }
      if (++v12 == 28) {
        goto LABEL_17;
      }
    }
LABEL_21:
    sub_567C(a1, "Attribute name is reserved: %s");
    return 0;
  }
LABEL_17:
  unint64_t v14 = a4[2];
  if (v14)
  {
    uint64_t v15 = 0x8000000;
    if (v14 != 256) {
      uint64_t v15 = 2 * v14;
    }
    a4[2] = v15;
  }
  else
  {
    unint64_t v14 = a4[3];
    if (v14 > 0x800000 || (a4[3] = 2 * v14, !v14))
    {
      sub_567C(a1, "character class table overflow.");
      return 0;
    }
  }
  uint64_t v16 = malloc_type_malloc(2 * (a3 - 1) + 24, 0x1DB5DB43uLL);
  if (!v16) {
    _lou_outOfMemory();
  }
  __int16 v17 = v16;
  v16[1] = 0;
  v16[2] = 0;
  void *v16 = 0;
  *((_WORD *)v16 + 8) = a3;
  memcpy((char *)v16 + 18, a2, 2 * (unsigned __int16)a3);
  void *v17 = a4[1];
  v17[1] = v14;
  a4[1] = v17;
  return v17;
}

uint64_t sub_BC04()
{
  uint64_t v0 = __chkstk_darwin();
  memset(v5, 0, 512);
  uint64_t result = sub_99A4(v0, v5, (uint64_t)"last word before or after");
  if (result)
  {
    memset(v4, 0, 512);
    uint64_t result = sub_349C(v0, v4, v5);
    if (result)
    {
      uint64_t v2 = 0;
      while (*((_WORD *)v4 + v2 + 1) == aBefore[v2])
      {
        if (++v2 == 6) {
          return 1;
        }
      }
      uint64_t v3 = 0;
      while (*((_WORD *)v4 + v3 + 1) == aAfter[v3])
      {
        if (++v3 == 5) {
          return 2;
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_BDB4()
{
  uint64_t v0 = __chkstk_darwin();
  memset(v6, 0, 512);
  uint64_t result = sub_99A4(v0, v6, (uint64_t)"number");
  if (result)
  {
    __int16 v2 = WORD1(v6[0]);
    if (WORD1(v6[0]) - 48 > 9) {
      goto LABEL_7;
    }
    unsigned __int16 v3 = 0;
    unsigned int v4 = (unsigned __int16 *)v6 + 2;
    do
    {
      unsigned __int16 v3 = v2 + 10 * v3 - 48;
      int v5 = *v4++;
      __int16 v2 = v5;
    }
    while ((v5 - 48) < 0xA);
    if (v3)
    {
      return v3;
    }
    else
    {
LABEL_7:
      sub_567C(v0, "a nonzero positive number is required");
      return 0;
    }
  }
  return result;
}

uint64_t sub_BEAC(int a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 13608);
  if (!v6) {
    return 0;
  }
  while (1)
  {
    uint64_t result = a2 + 8 * v6 + 31616;
    if (*(unsigned __int16 *)(a2 + 8 * v6 + 31660) == a1) {
      break;
    }
    uint64_t v6 = *(unsigned int *)(a2 + 8 * v6 + 31628);
    if (!v6) {
      return 0;
    }
  }
  if (a3) {
    *a3 = v6;
  }
  return result;
}

uint64_t sub_BF1C(uint64_t a1, int a2, uint64_t *a3, unsigned int *a4, int a5)
{
  unsigned __int16 v8 = a2;
  uint64_t v10 = sub_BEAC(a2, *a3, a4);
  if (!v10)
  {
    unsigned int v16 = 0;
    sub_B7D4(a1, &v16, 64, (void **)a3);
    uint64_t v11 = *a3 + 8 * v16;
    uint64_t v10 = v11 + 31616;
    *(_OWORD *)(v11 + 31664) = 0u;
    *(_OWORD *)(v11 + 31648) = 0u;
    *(_OWORD *)(v11 + 31632) = 0u;
    *(_OWORD *)(v11 + 31616) = 0u;
    *(void *)(v11 + 31616) = *(void *)(a1 + 8);
    *(_DWORD *)(v11 + 31624) = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(v11 + 31672) = a5;
    *(_WORD *)(v11 + 31660) = v8;
    uint64_t v12 = *a3 + 4 * _lou_charHash(v8);
    uint64_t v13 = *(unsigned int *)(v12 + 13608);
    if (!v13)
    {
      *(_DWORD *)(v12 + 13608) = v16;
      if (!a4) {
        return v10;
      }
      goto LABEL_5;
    }
    do
    {
      uint64_t v14 = *a3 + 8 * v13 + 31616;
      uint64_t v13 = *(unsigned int *)(*a3 + 8 * v13 + 31628);
    }
    while (v13);
    *(_DWORD *)(v14 + 12) = v16;
    if (a4) {
LABEL_5:
    }
      *a4 = v16;
  }
  return v10;
}

uint64_t sub_C030()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v5 = v0;
  word_27C58 = 0;
  __int16 v145 = 0;
  uint64_t v7 = *(int *)(v0 + 36);
  uint64_t v6 = *(int *)(v0 + 40);
  if ((int)v6 >= (int)v7) {
    goto LABEL_8;
  }
  unsigned __int16 v8 = v4;
  unsigned __int16 v9 = 0;
  int v10 = 1;
  memset(v147, 0, 510);
  do
  {
    unsigned __int16 v11 = v10;
    uint64_t v12 = &v147[v9++ - 1];
    v12[1] = *(_WORD *)(v0 + 2 * v6++ + 52);
    ++v10;
  }
  while (v7 != v6);
  __int16 v146 = v9;
  if (!v9)
  {
LABEL_8:
    sub_567C(v0, "Invalid multipass operands");
    return 0;
  }
  uint64_t v13 = 0;
  while ((unsigned __int16)v147[v13] >= 0x21u)
  {
    if (v11 == ++v13) {
      goto LABEL_8;
    }
  }
  int v136 = v3;
  unsigned int v137 = v1;
  int v134 = v2;
  memset(v144, 0, 512);
  v147[v13] = 1;
  sub_349C(v0, v144, &v146);
  uint64_t v15 = LOWORD(v144[0]);
  v139 = v8;
  if (LOWORD(v144[0]))
  {
    uint64_t v16 = 0;
    while (*((_WORD *)v144 + v16 + 1) != 1)
    {
      if (LOWORD(v144[0]) == ++v16)
      {
        LODWORD(v16) = LOWORD(v144[0]);
        break;
      }
    }
  }
  else
  {
    LODWORD(v16) = 0;
  }
  int v17 = 0;
  int v140 = 0;
  uint64_t v138 = 0;
  int v18 = 0;
  *((_WORD *)v144 + v16 + 1) = 32;
  uint64_t v135 = v15 - 1;
  while (2)
  {
    uint64_t v19 = v17;
    unsigned int v20 = (char *)v144 + 2 * v17;
    unsigned int v21 = *((unsigned __int16 *)v20 + 1);
    if (v21 > 0x5A)
    {
      if (*((unsigned __int16 *)v20 + 1) > 0x7Au)
      {
        if (v21 == 123 || v21 == 125)
        {
          uint64_t v25 = v19 + 1;
          int v26 = *((unsigned __int16 *)v144 + v19 + 2);
          if ((v26 & 0xFFFFFFDF) - 65 > 0x19)
          {
            unsigned __int16 v27 = 0;
            int v30 = v19 + 1;
          }
          else
          {
            unsigned __int16 v27 = 0;
            if (v19 + 2 > v15) {
              int v28 = v19 + 2;
            }
            else {
              int v28 = v15;
            }
            while (1)
            {
              __int16 v29 = &v147[v27++ - 1];
              v29[1] = v26;
              int v30 = v25 + 1;
              if (v25 + 1 >= v15) {
                break;
              }
              int v26 = *((unsigned __int16 *)v144 + v25++ + 2);
              if ((v26 & 0xFFFFFFDF) - 65 > 0x19) {
                goto LABEL_107;
              }
            }
            int v30 = v28;
          }
LABEL_107:
          __int16 v146 = v27;
          int v143 = v30;
          uint64_t v57 = *v139;
          unsigned int v58 = sub_E16C((char *)&v146, *v139);
          if (v58)
          {
            uint64_t v59 = v57 + 8 * v58 + 31616;
          }
          else
          {
            uint64_t v59 = v138;
            if (!v138) {
              goto LABEL_280;
            }
          }
          if (*(_DWORD *)(v59 + 44) != 69)
          {
LABEL_280:
            _lou_showString((uint64_t)v147, v27, 0);
            sub_567C(v5, "%s is not a grouping name");
            return 0;
          }
          if (v18 >= 2048) {
            goto LABEL_279;
          }
          word_28C5A[v18 + 1] = v21;
          if (v18 == 2047) {
            goto LABEL_279;
          }
          uint64_t v138 = v59;
          uint64_t v60 = &word_28C5A[v18];
          v60[2] = HIWORD(v58);
          if (v18 > 2045) {
            goto LABEL_279;
          }
          v18 += 3;
          v60[3] = v58;
        }
        else
        {
          if (v21 != 126)
          {
LABEL_282:
            sub_567C(v5, "incorrect operator '%c ' in test part");
            return 0;
          }
          if (v18 >= 2048) {
            goto LABEL_279;
          }
          int v23 = &word_28C5A[v18];
          int v22 = v18 + 1;
          __int16 v24 = 126;
LABEL_101:
          v23[1] = v24;
          int v143 = v19 + 1;
LABEL_102:
          int v18 = v22;
        }
      }
      else
      {
        switch(*((_WORD *)v20 + 1))
        {
          case '[':
            if (v140)
            {
              sub_567C(v5, "nested replacement statements");
              return 0;
            }
            if (v18 >= 2048) {
              goto LABEL_279;
            }
            int v22 = v18 + 1;
            word_28C5A[v18 + 1] = 91;
            int v143 = v19 + 1;
            int v140 = 1;
            goto LABEL_102;
          case ']':
            if (!v140)
            {
              sub_567C(v5, "unexpected end of replacement");
              return 0;
            }
            if (v18 >= 2048) {
              goto LABEL_279;
            }
            int v140 = 0;
            int v23 = &word_28C5A[v18];
            int v22 = v18 + 1;
            __int16 v24 = 93;
            goto LABEL_101;
          case '_':
            if (v18 >= 2048) {
              goto LABEL_279;
            }
            word_28C5A[v18 + 1] = 95;
            uint64_t v32 = v19 + 1;
            int v143 = v19 + 1;
            if ((int)v19 + 1 >= (int)v15) {
              goto LABEL_166;
            }
            int v33 = *((unsigned __int16 *)v144 + v32 + 1);
            if ((v33 - 48) > 9) {
              goto LABEL_166;
            }
            __int16 v34 = 0;
            uint64_t v35 = v135 - v32;
            uint64_t v36 = (unsigned __int16 *)v144 + v32 + 2;
            break;
            if (v18 >= 2048) {
              goto LABEL_279;
            }
            int v23 = &word_28C5A[v18];
            int v22 = v18 + 1;
            __int16 v24 = 96;
            goto LABEL_101;
          default:
            goto LABEL_282;
        }
        while (1)
        {
          __int16 v34 = v33 + 10 * v34 - 48;
          if (!v35) {
            break;
          }
          int v37 = *v36++;
          LOWORD(v33) = v37;
          --v35;
          LODWORD(v32) = v32 + 1;
          if ((v37 - 48) > 9) {
            goto LABEL_165;
          }
        }
        LODWORD(v32) = v15;
LABEL_165:
        int v143 = v32;
        if (!v34) {
LABEL_166:
        }
          __int16 v34 = 1;
        __int16 v145 = v34;
        if (v18 >= 2047) {
          goto LABEL_279;
        }
        uint64_t v82 = v18 + 1;
        v18 += 2;
        word_28C5A[v82 + 1] = v34;
      }
      goto LABEL_186;
    }
    switch(*((_WORD *)v20 + 1))
    {
      case ' ':
        if (v18 >= 2048) {
          goto LABEL_279;
        }
        word_28C5A[v18 + 1] = 32;
        if (v140)
        {
          sub_567C(v5, "expected end of replacement");
          return 0;
        }
        int v140 = 0;
        ++v18;
        int v143 = v19 + 1;
        goto LABEL_186;
      case '!':
        if (v18 >= 2048) {
          goto LABEL_279;
        }
        int v23 = &word_28C5A[v18];
        int v22 = v18 + 1;
        __int16 v24 = 33;
        goto LABEL_101;
      case '""':
        if (!sub_DE3C(v5, v137, 1, 0, v136)) {
          return 0;
        }
        int v143 = v19 + 1;
        if (v18 >= 2048) {
          goto LABEL_279;
        }
        word_28C5A[v18 + 1] = 34;
        sub_DF58((unsigned __int16 *)v144, &v143, (unsigned __int16 *)&v146, v5);
        LODWORD(v31) = (unsigned __int16)v146;
        if (v146) {
          goto LABEL_61;
        }
        sub_567C(v5, "empty string in test part");
        return 0;
      case '#':
        int v143 = v19 + 1;
        if (!sub_E110(v5, (unsigned __int16 *)v144, &v143, &v145)) {
          return 0;
        }
        int v42 = v143;
        int v43 = *((unsigned __int16 *)v144 + v143 + 1);
        switch(v43)
        {
          case '<':
            int v61 = v143 + 1;
            if (*((_WORD *)v144 + v143 + 2) == 61)
            {
              if (v18 > 2047) {
                goto LABEL_279;
              }
              __int16 v44 = 130;
LABEL_122:
              int v42 = v61;
              break;
            }
            if (v18 > 2047) {
              goto LABEL_279;
            }
            __int16 v44 = 60;
            break;
          case '>':
            int v61 = v143 + 1;
            if (*((_WORD *)v144 + v143 + 2) == 61)
            {
              if (v18 > 2047) {
                goto LABEL_279;
              }
              __int16 v44 = 131;
              goto LABEL_122;
            }
            if (v18 > 2047) {
              goto LABEL_279;
            }
            __int16 v44 = 62;
            break;
          case '=':
            if (v18 > 2047) {
              goto LABEL_279;
            }
            __int16 v44 = 61;
            break;
          default:
            sub_567C(v5, "incorrect comparison operator");
            return 0;
        }
        word_28C5A[v18 + 1] = v44;
        if (v18 >= 2047) {
          goto LABEL_279;
        }
        __int16 v75 = 0;
        uint64_t v76 = v18;
        word_28C5A[v18 + 2] = v145;
        uint64_t v77 = v42 + 1;
        int v143 = v77;
        __int16 v145 = 0;
        if ((int)v77 < (int)v15)
        {
          int v78 = *((unsigned __int16 *)v144 + v77 + 1);
          if ((v78 - 48) > 9)
          {
            __int16 v75 = 0;
          }
          else
          {
            __int16 v75 = 0;
            uint64_t v79 = v135 - v77;
            unsigned int v80 = (unsigned __int16 *)v144 + v77 + 2;
            while (1)
            {
              __int16 v75 = v78 + 10 * v75 - 48;
              if (!v79) {
                break;
              }
              int v81 = *v80++;
              LOWORD(v78) = v81;
              --v79;
              LODWORD(v77) = v77 + 1;
              if ((v81 - 48) > 9) {
                goto LABEL_170;
              }
            }
            LODWORD(v77) = v15;
          }
LABEL_170:
          int v143 = v77;
          __int16 v145 = v75;
        }
        if (v18 >= 2046) {
          goto LABEL_279;
        }
        v18 += 3;
        word_28C5A[v76 + 3] = v75;
        goto LABEL_186;
      case '$':
        uint64_t v45 = 0;
        LODWORD(v46) = v19 + 1;
        uint64_t v47 = (unsigned __int16 *)v144 + v19 + 2;
        while (2)
        {
          int v49 = *v47++;
          int v48 = v49;
          if (v49 <= 96)
          {
            switch(v48)
            {
              case 'D':
                uint64_t v51 = v45 | 0x100;
                break;
              case 'S':
                uint64_t v51 = v45 | 0x80;
                break;
              case 'U':
                uint64_t v51 = v45 | 0x10;
                break;
              default:
                goto LABEL_103;
            }
LABEL_91:
            LODWORD(v46) = v46 + 1;
            uint64_t v45 = v51;
            continue;
          }
          break;
        }
        int v50 = v48 - 97;
        uint64_t v51 = 0xFFFFFFFFLL;
        switch(v50)
        {
          case 0:
            goto LABEL_91;
          case 3:
            uint64_t v51 = v45 | 4;
            goto LABEL_91;
          case 11:
            uint64_t v51 = v45 | 2;
            goto LABEL_91;
          case 12:
            uint64_t v51 = v45 | 0x40;
            goto LABEL_91;
          case 15:
            uint64_t v51 = v45 | 8;
            goto LABEL_91;
          case 18:
            uint64_t v51 = v45 | 1;
            goto LABEL_91;
          case 20:
            uint64_t v51 = v45 | 0x20;
            goto LABEL_91;
          case 22:
            uint64_t v51 = v45 | 0x8000000;
            goto LABEL_91;
          case 23:
            uint64_t v51 = v45 | 0x10000000;
            goto LABEL_91;
          case 24:
            uint64_t v51 = v45 | 0x20000000;
            goto LABEL_91;
          case 25:
            uint64_t v51 = v45 | 0x40000000;
            goto LABEL_91;
          default:
            break;
        }
LABEL_103:
        int v143 = v46;
        if (!v45)
        {
          sub_567C(v5, "missing attribute");
          return 0;
        }
LABEL_127:
        if (v18 >= 2048) {
          goto LABEL_279;
        }
        word_28C5A[v18 + 1] = 36;
        if (v18 == 2047) {
          goto LABEL_279;
        }
        unsigned int v64 = &word_28C5A[v18];
        v64[2] = HIWORD(v45);
        if (v18 >= 2046) {
          goto LABEL_279;
        }
        v64[3] = WORD2(v45);
        if (v18 == 2045) {
          goto LABEL_279;
        }
        word_28C5A[v18 + 4] = WORD1(v45);
        if (v18 >= 2044) {
          goto LABEL_279;
        }
        int v65 = v18 + 4;
        unsigned int v66 = 5;
LABEL_133:
        unint64_t v67 = v18 + (unint64_t)v66;
        word_28C5A[v65 + 1] = v45;
        int v68 = *((unsigned __int16 *)v144 + (int)v46 + 1);
        if (v68 == 46)
        {
          int v143 = v46 + 1;
          if ((int)v67 >= 2048) {
            goto LABEL_279;
          }
          int v69 = &word_28C5A[v67];
          v69[1] = 1;
          if (v67 == 2047) {
            goto LABEL_279;
          }
          int v18 = v67 + 2;
          v69[2] = -1;
          goto LABEL_186;
        }
        __int16 v145 = 0;
        if ((int)v46 >= (int)v15) {
          goto LABEL_183;
        }
        if ((v68 - 48) > 9)
        {
          int v143 = v46;
LABEL_183:
          if ((int)v67 >= 2048) {
            goto LABEL_279;
          }
          word_28C5A[(int)v67 + 1] = 1;
          if (v67 == 2047) {
            goto LABEL_279;
          }
          int v18 = v67 + 2;
          word_28C5A[(int)v67 + 2] = 1;
          goto LABEL_186;
        }
        __int16 v70 = 0;
        uint64_t v71 = v135 - (int)v46;
        unsigned int v72 = (unsigned __int16 *)v144 + (int)v46 + 2;
        while (1)
        {
          __int16 v70 = v68 + 10 * v70 - 48;
          if (!v71) {
            break;
          }
          int v73 = *v72++;
          LOWORD(v68) = v73;
          --v71;
          LODWORD(v46) = v46 + 1;
          if ((v73 - 48) > 9) {
            goto LABEL_174;
          }
        }
        LODWORD(v46) = v15;
LABEL_174:
        int v143 = v46;
        __int16 v145 = v70;
        if (!v70) {
          goto LABEL_183;
        }
        if ((int)v67 >= 2048) {
          goto LABEL_279;
        }
        uint64_t v83 = (int)v67 + 1;
        word_28C5A[(int)v67 + 1] = v70;
        if (*((_WORD *)v144 + (int)v46 + 1) == 45)
        {
          uint64_t v84 = (int)v46 + 1;
          if ((int)v84 >= (int)v15) {
            goto LABEL_300;
          }
          int v85 = *((unsigned __int16 *)v144 + v84 + 1);
          if ((v85 - 48) > 9) {
            goto LABEL_300;
          }
          __int16 v70 = 0;
          uint64_t v86 = v135 - v84;
          int v87 = (unsigned __int16 *)v144 + v84 + 2;
          while (1)
          {
            __int16 v70 = v85 + 10 * v70 - 48;
            if (!v86) {
              break;
            }
            int v88 = *v87++;
            LOWORD(v85) = v88;
            --v86;
            LODWORD(v84) = v84 + 1;
            if ((v88 - 48) > 9) {
              goto LABEL_191;
            }
          }
          LODWORD(v84) = v15;
LABEL_191:
          int v143 = v84;
          __int16 v145 = v70;
          if (!v70)
          {
LABEL_300:
            sub_567C(v5, "invalid range");
            return 0;
          }
          if ((int)v67 >= 2047) {
            goto LABEL_279;
          }
          int v18 = v67 + 2;
          int v89 = &word_28C5A[(int)v83];
        }
        else
        {
          if ((int)v67 >= 2047) {
            goto LABEL_279;
          }
          int v18 = v67 + 2;
          int v89 = &word_28C5A[v83];
        }
        v89[1] = v70;
LABEL_186:
        int v17 = v143;
        if (v143 <= (int)v16) {
          continue;
        }
        if (v143 < (int)v15)
        {
          uint64_t v90 = (unsigned __int16 *)v144 + v143 + 1;
          while (1)
          {
            unsigned int v91 = *v90++;
            if (v91 > 0x20) {
              break;
            }
            if (v15 == ++v17) {
              goto LABEL_288;
            }
          }
        }
        if (v17 >= (int)v15)
        {
LABEL_288:
          word_28C5A[0] = v18;
          uint64_t v142 = 0;
          int v141 = 0;
          if (!sub_E1D8(v5, (unsigned __int16)v18, &v142, &v141)) {
            return 0;
          }
          uint64_t v128 = v142;
          if (v142)
          {
            __int16 v129 = v141;
            if (v141 < 1)
            {
              __int16 v129 = 0;
              uint64_t v132 = &unk_27000;
            }
            else
            {
              v130 = &word_27C5A;
              uint64_t v131 = v141;
              uint64_t v132 = (_WORD *)&unk_27000;
              do
              {
                __int16 v133 = *v128++;
                *v130++ = v133;
                --v131;
              }
              while (v131);
            }
            v132[1580] = v129;
          }
          return sub_B028(v5, v137, &word_27C58, word_28C5A, 0, 0, 0, 0, v134, v136, (void **)v139);
        }
        int v92 = v18;
        while (2)
        {
          unsigned int v93 = *((unsigned __int16 *)v144 + v17 + 1);
          if (v93 < 0x21)
          {
            LOWORD(v18) = v92;
            goto LABEL_288;
          }
          if (v92 >= 2048)
          {
            sub_567C(v5, "Action part in multipass operand too long");
            return 0;
          }
          uint64_t v94 = v17;
          if (*((unsigned __int16 *)v144 + v17 + 1) <= 0x3Eu)
          {
            switch(*((_WORD *)v144 + v17 + 1))
            {
              case '""':
                if (!sub_DE3C(v5, v137, 1, 1, v136)) {
                  return 0;
                }
                int v143 = v94 + 1;
                word_28C5A[v92 + 1] = 34;
                sub_DF58((unsigned __int16 *)v144, &v143, (unsigned __int16 *)&v146, v5);
                goto LABEL_214;
              case '#':
                int v143 = v17 + 1;
                if (!sub_E110(v5, (unsigned __int16 *)v144, &v143, &v145)) {
                  return 0;
                }
                uint64_t v105 = v143;
                int v106 = *((unsigned __int16 *)v144 + v143 + 1);
                if (v106 == 43 || v106 == 45)
                {
                  ++v143;
                  word_28C5A[v92 + 1] = v106;
                  if (v92 >= 2047) {
                    goto LABEL_279;
                  }
                  int v18 = v92 + 2;
                  word_28C5A[v92 + 2] = v145;
                }
                else
                {
                  if (v106 != 61)
                  {
                    sub_567C(v5, "incorrect variable operator in action part");
                    return 0;
                  }
                  word_28C5A[v92 + 1] = 61;
                  if (v92 >= 2047) {
                    goto LABEL_279;
                  }
                  __int16 v107 = 0;
                  word_28C5A[v92 + 2] = v145;
                  uint64_t v108 = v105 + 1;
                  int v143 = v108;
                  __int16 v145 = 0;
                  if ((int)v108 < (int)v15)
                  {
                    int v109 = *((unsigned __int16 *)v144 + v108 + 1);
                    if ((v109 - 48) > 9)
                    {
                      __int16 v107 = 0;
                    }
                    else
                    {
                      __int16 v107 = 0;
                      uint64_t v110 = v135 - v108;
                      uint64_t v111 = (unsigned __int16 *)v144 + v108 + 2;
                      while (1)
                      {
                        __int16 v107 = v109 + 10 * v107 - 48;
                        if (!v110) {
                          break;
                        }
                        int v112 = *v111++;
                        LOWORD(v109) = v112;
                        --v110;
                        LODWORD(v108) = v108 + 1;
                        if ((v112 - 48) > 9) {
                          goto LABEL_276;
                        }
                      }
                      LODWORD(v108) = v15;
                    }
LABEL_276:
                    int v143 = v108;
                    __int16 v145 = v107;
                  }
                  if (v92 >= 2046) {
                    goto LABEL_279;
                  }
                  int v18 = v92 + 3;
                  word_28C5A[v92 + 3] = v107;
                }
                break;
              case '$':
              case '&':
              case '\'':
              case '(':
              case ')':
                goto LABEL_302;
              case '%':
                uint64_t v113 = v17 + 1;
                int v114 = *((unsigned __int16 *)v144 + v94 + 2);
                if ((v114 & 0xFFFFFFDF) - 65 > 0x19)
                {
                  unsigned __int16 v115 = 0;
                  int v118 = v94 + 1;
                }
                else
                {
                  unsigned __int16 v115 = 0;
                  if (v94 + 2 > v15) {
                    int v116 = v94 + 2;
                  }
                  else {
                    int v116 = v15;
                  }
                  while (1)
                  {
                    uint64_t v117 = &v147[v115++ - 1];
                    v117[1] = v114;
                    int v118 = v113 + 1;
                    if (v113 + 1 >= v15) {
                      break;
                    }
                    int v114 = *((unsigned __int16 *)v144 + v113++ + 2);
                    if ((v114 & 0xFFFFFFDF) - 65 > 0x19) {
                      goto LABEL_264;
                    }
                  }
                  int v118 = v116;
                }
LABEL_264:
                __int16 v146 = v115;
                int v143 = v118;
                uint64_t v126 = *v139;
                unsigned int v122 = sub_E16C((char *)&v146, *v139);
                if (v122)
                {
                  uint64_t v127 = v126 + 8 * v122 + 31616;
                }
                else
                {
                  uint64_t v127 = v138;
                  if (!v138) {
                    goto LABEL_301;
                  }
                }
                if ((*(_DWORD *)(v127 + 44) - 58) > 2)
                {
LABEL_301:
                  _lou_showString((uint64_t)v147, v115, 0);
                  sub_567C(v5, "%s is not a swap name.");
                  return 0;
                }
                word_28C5A[v92 + 1] = 37;
                if (v92 >= 2047) {
                  goto LABEL_279;
                }
                uint64_t v138 = v127;
                unsigned int v124 = HIWORD(v122);
                int v125 = &word_28C5A[v92];
                goto LABEL_270;
              case '*':
                int v18 = v92 + 1;
                uint64_t v119 = &word_28C5A[v92];
                __int16 v120 = 42;
                goto LABEL_252;
              default:
                if (v93 == 59) {
                  goto LABEL_224;
                }
                goto LABEL_302;
            }
            goto LABEL_272;
          }
          if (*((unsigned __int16 *)v144 + v17 + 1) > 0x7Au)
          {
            if (v93 != 123 && v93 != 125)
            {
LABEL_302:
              sub_567C(v5, "incorrect operator in action part");
              return 0;
            }
LABEL_224:
            uint64_t v100 = v17 + 1;
            int v101 = *((unsigned __int16 *)v144 + v94 + 2);
            if ((v101 & 0xFFFFFFDF) - 65 > 0x19)
            {
              unsigned __int16 v27 = 0;
              int v104 = v100;
            }
            else
            {
              unsigned __int16 v27 = 0;
              if (v100 + 1 > v15) {
                int v102 = v100 + 1;
              }
              else {
                int v102 = v15;
              }
              while (1)
              {
                uint64_t v103 = &v147[v27++ - 1];
                v103[1] = v101;
                int v104 = v100 + 1;
                if (v100 + 1 >= v15) {
                  break;
                }
                int v101 = *((unsigned __int16 *)v144 + v100++ + 2);
                if ((v101 & 0xFFFFFFDF) - 65 > 0x19) {
                  goto LABEL_254;
                }
              }
              int v104 = v102;
            }
LABEL_254:
            __int16 v146 = v27;
            int v143 = v104;
            uint64_t v121 = *v139;
            unsigned int v122 = sub_E16C((char *)&v146, *v139);
            if (v122)
            {
              uint64_t v123 = v121 + 8 * v122 + 31616;
            }
            else
            {
              uint64_t v123 = v138;
              if (!v138) {
                goto LABEL_280;
              }
            }
            if (*(_DWORD *)(v123 + 44) != 69) {
              goto LABEL_280;
            }
            word_28C5A[v92 + 1] = v93;
            if (v92 >= 2047) {
              goto LABEL_279;
            }
            uint64_t v138 = v123;
            unsigned int v124 = HIWORD(v122);
            int v125 = &word_28C5A[v92];
LABEL_270:
            v125[2] = v124;
            if (v92 == 2046) {
              goto LABEL_279;
            }
            int v18 = v92 + 3;
            v125[3] = v122;
            goto LABEL_272;
          }
          if (v93 == 63)
          {
            int v18 = v92 + 1;
            uint64_t v119 = &word_28C5A[v92];
            __int16 v120 = 63;
LABEL_252:
            v119[1] = v120;
            int v143 = v94 + 1;
LABEL_272:
            int v17 = v143;
            int v92 = v18;
            if (v143 >= (int)v15) {
              goto LABEL_288;
            }
            continue;
          }
          break;
        }
        if (v93 != 64) {
          goto LABEL_302;
        }
        if (!sub_DE3C(v5, v137, 0, 1, v136)) {
          return 0;
        }
        int v143 = v94 + 1;
        sub_DFE0();
        word_28C5A[v92 + 1] = 64;
        if (!v146)
        {
          sub_567C(v5, "expected dot pattern after @ operand in action part");
          return 0;
        }
LABEL_214:
        if (v92 >= 2047) {
          goto LABEL_281;
        }
        uint64_t v95 = (unsigned __int16)v146;
        int v18 = v92 + 2;
        word_28C5A[v92 + 2] = v146;
        if (!v95) {
          goto LABEL_272;
        }
        uint64_t v96 = (2046 - v92);
        unsigned int v97 = &word_28C5A[v18 + 1];
        unint64_t v98 = v147;
        while (v96)
        {
          __int16 v99 = *v98++;
          *v97++ = v99;
          ++v18;
          --v96;
          if (!--v95) {
            goto LABEL_272;
          }
        }
LABEL_281:
        sub_567C(v5, "@ operand in action part of multipass operand too long");
        return 0;
      case '%':
        uint64_t v46 = v19 + 1;
        int v52 = *((unsigned __int16 *)v144 + v19 + 2);
        if ((v52 & 0xFFFFFFDF) - 65 > 0x19)
        {
          unsigned __int16 v53 = 0;
          goto LABEL_125;
        }
        unsigned __int16 v53 = 0;
        if (v19 + 2 > v15) {
          int v54 = v19 + 2;
        }
        else {
          int v54 = v15;
        }
        while (1)
        {
          uint64_t v55 = &v147[v53++ - 1];
          v55[1] = v52;
          int v56 = v46 + 1;
          if (v46 + 1 >= v15) {
            break;
          }
          int v52 = *((unsigned __int16 *)v144 + v46++ + 2);
          if ((v52 & 0xFFFFFFDF) - 65 > 0x19) {
            goto LABEL_124;
          }
        }
        int v56 = v54;
LABEL_124:
        LODWORD(v46) = v56;
LABEL_125:
        __int16 v146 = v53;
        int v143 = v46;
        uint64_t v62 = *v139;
        uint64_t v63 = sub_B9EC((unsigned __int16 *)&v146, *v139);
        if (v63)
        {
          uint64_t v45 = (uint64_t)v63[1];
          goto LABEL_127;
        }
        LODWORD(v45) = sub_E16C((char *)&v146, v62);
        if (v45)
        {
          uint64_t v74 = v62 + 8 * v45 + 31616;
        }
        else
        {
          uint64_t v74 = v138;
          if (!v138) {
            goto LABEL_298;
          }
        }
        if ((*(_DWORD *)(v74 + 44) - 58) > 2)
        {
LABEL_298:
          _lou_showString((uint64_t)v147, v53, 0);
          sub_567C(v5, "%s is neither a class name nor a swap name.");
          return 0;
        }
        if (v18 >= 2048
          || (word_28C5A[v18 + 1] = 37, v18 == 2047)
          || (uint64_t v138 = v74, word_28C5A[v18 + 2] = WORD1(v45), v18 > 2045))
        {
LABEL_279:
          sub_567C(v5, "multipass operand too long");
          return 0;
        }
        int v65 = v18 + 2;
        unsigned int v66 = 3;
        goto LABEL_133;
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
        goto LABEL_282;
      case '/':
        if (v18 >= 2048) {
          goto LABEL_279;
        }
        int v23 = &word_28C5A[v18];
        int v22 = v18 + 1;
        __int16 v24 = 47;
        goto LABEL_101;
      default:
        if (v21 != 64) {
          goto LABEL_282;
        }
        if (!sub_DE3C(v5, v137, 0, 0, v136)) {
          return 0;
        }
        int v143 = v19 + 1;
        if (v18 >= 2048) {
          goto LABEL_279;
        }
        word_28C5A[v18 + 1] = 64;
        sub_DFE0();
        LODWORD(v31) = (unsigned __int16)v146;
        if (!v146)
        {
          sub_567C(v5, "expected dot pattern after @ operand in test part");
          return 0;
        }
LABEL_61:
        if (v18 >= 2047) {
          goto LABEL_195;
        }
        uint64_t v38 = (2046 - v18);
        word_28C5C[v18 + 1] = v31;
        uint64_t v31 = v31;
        uint64_t v39 = &word_28C5C[v18 + 2];
        uint64_t v40 = v147;
        v18 += 2;
        do
        {
          if (!v38)
          {
LABEL_195:
            sub_567C(v5, "@ operand in test part of multipass operand too long");
            return 0;
          }
          unsigned __int16 v41 = *v40++;
          *v39++ = v41;
          ++v18;
          --v38;
          --v31;
        }
        while (v31);
        goto LABEL_186;
    }
  }
}

uint64_t sub_D4E0()
{
  uint64_t v0 = __chkstk_darwin();
  int v2 = v1;
  int v4 = v3;
  int v6 = v5;
  int v8 = v7;
  uint64_t v9 = v0;
  memset(v16, 0, 512);
  memset(v15, 0, 512);
  memset(v14, 0, 512);
  int v11 = 0;
  uint64_t result = sub_99A4(v0, v14, (uint64_t)"name operand");
  if (result)
  {
    memset(v13, 0, 512);
    uint64_t result = sub_99A4(v9, v13, (uint64_t)"matches operand");
    if (result)
    {
      memset(v12, 0, 512);
      uint64_t result = sub_99A4(v9, v12, (uint64_t)"replacements operand");
      if (result)
      {
        if ((v8 & 0xFFFFFFFE) == 0x3A)
        {
          uint64_t result = sub_349C(v9, v16, v13);
          if (!result) {
            return result;
          }
        }
        else
        {
          uint64_t result = sub_E42C();
          if (!result) {
            return result;
          }
        }
        if (v8 == 58)
        {
          uint64_t result = sub_349C(v9, v15, v12);
          if (!result) {
            return result;
          }
        }
        else
        {
          uint64_t result = sub_E42C();
          if (!result) {
            return result;
          }
        }
        uint64_t result = sub_B028(v9, v8, v16, v15, 0, 0, (unsigned int *)&v11, 0, v6, v4, v2);
        if (result) {
          return sub_DC0C(v9, v14, v11, (uint64_t)*v2) != 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_D8C8(uint64_t a1, _WORD *a2)
{
  if (!*a2) {
    return 0;
  }
  unsigned int v2 = 0;
  int v3 = a2 + 1;
  uint64_t v4 = (unsigned __int16)*a2;
  do
  {
    int v5 = *v3++;
    unsigned int v2 = v5 + 16 * v2;
    if ((v2 & 0xF0000000) != 0) {
      unsigned int v2 = v2 & 0xFFFFFFF ^ ((v2 & 0xF0000000) >> 24);
    }
    --v4;
  }
  while (v4);
  int v6 = *(uint64_t ***)(a1 + 8 * (v2 % 0x1FFF));
  if (!v6) {
    return 0xFFFFLL;
  }
  while (1)
  {
    int v7 = (unsigned __int16 *)v6[1];
    if ((unsigned __int16)*a2 == *v7) {
      break;
    }
LABEL_13:
    int v6 = (uint64_t **)*v6;
    if (!v6) {
      return 0xFFFFLL;
    }
  }
  int v8 = v7 + 1;
  uint64_t v9 = a2 + 1;
  uint64_t v10 = (unsigned __int16)*a2;
  while (1)
  {
    int v12 = *v9++;
    int v11 = v12;
    int v13 = *v8++;
    if (v11 != v13) {
      break;
    }
    if (!--v10) {
      return *((unsigned int *)v6 + 4);
    }
  }
  if (v10) {
    goto LABEL_13;
  }
  return *((unsigned int *)v6 + 4);
}

uint64_t sub_D988(int *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v6 = (unsigned __int16)*a3;
  if (*a3)
  {
    unsigned int v7 = 0;
    int v8 = a3 + 1;
    do
    {
      int v9 = *v8++;
      unsigned int v7 = v9 + 16 * v7;
      if ((v7 & 0xF0000000) != 0) {
        unsigned int v7 = v7 & 0xFFFFFFF ^ ((v7 & 0xF0000000) >> 24);
      }
      --v6;
    }
    while (v6);
    uint64_t v10 = v7 % 0x1FFF;
  }
  else
  {
    uint64_t v10 = 0;
  }
  int v11 = *a1;
  int v12 = malloc_type_malloc(0x18uLL, 0x1020040EDCEB4C7uLL);
  int v13 = v12;
  if (!v12) {
    _lou_outOfMemory();
  }
  *int v12 = *(void *)(a2 + 8 * v10);
  uint64_t v14 = malloc_type_malloc(2 * (unsigned __int16)*a3 + 2, 0x1000040BDFB0063uLL);
  v13[1] = v14;
  if (!v14) {
    _lou_outOfMemory();
  }
  _WORD *v14 = *a3;
  if (*a3)
  {
    unint64_t v15 = 1;
    do
      v14[v15] = a3[v15];
    while (v15++ < (unsigned __int16)*a3);
  }
  *((_DWORD *)v13 + 4) = v11;
  *(void *)(a2 + 8 * v10) = v13;
  int v17 = (char *)*((void *)a1 + 1);
  if ((*a1 & (*a1 - 1)) == 0)
  {
    int v17 = (char *)malloc_type_realloc(v17, 32 * *a1, 0x10220409E769576uLL);
    *((void *)a1 + 1) = v17;
  }
  if (!v17) {
    _lou_outOfMemory();
  }
  int v18 = &v17[16 * *a1];
  *(void *)int v18 = 0;
  *((void *)v18 + 1) = 0xFFFF00000000;
  uint64_t result = *a1;
  *a1 = result + 1;
  return result;
}

uint64_t sub_DB10(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  unsigned __int16 v6 = a2;
  uint64_t v8 = sub_5C88(a2, *a3);
  if (!v8)
  {
    unsigned int v14 = 0;
    sub_B7D4(a1, &v14, 64, (void **)a3);
    uint64_t v9 = *a3 + 8 * v14;
    uint64_t v8 = v9 + 31616;
    *(_OWORD *)(v9 + 31664) = 0u;
    *(_OWORD *)(v9 + 31648) = 0u;
    *(_OWORD *)(v9 + 31632) = 0u;
    *(_OWORD *)(v9 + 31616) = 0u;
    *(void *)(v9 + 31616) = *(void *)(a1 + 8);
    *(_DWORD *)(v9 + 31624) = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(v9 + 31672) = a4;
    *(_WORD *)(v9 + 31660) = v6;
    uint64_t v10 = (unsigned int *)(*a3 + 4 * _lou_charHash(v6) + 18100);
    uint64_t v11 = *v10;
    if (v11)
    {
      do
      {
        uint64_t v12 = *a3 + 8 * v11 + 31616;
        uint64_t v11 = *(unsigned int *)(*a3 + 8 * v11 + 31628);
      }
      while (v11);
      *(_DWORD *)(v12 + 12) = v14;
    }
    else
    {
      unsigned int *v10 = v14;
    }
  }
  return v8;
}

uint64_t sub_DC0C(uint64_t a1, _WORD *a2, int a3, uint64_t a4)
{
  uint64_t v8 = malloc_type_malloc(2 * (unsigned __int16)*a2 + 14, 0xA3D62DAuLL);
  uint64_t v9 = v8;
  if (!v8)
  {
    sub_567C(a1, "not enough memory");
    _lou_outOfMemory();
  }
  *uint64_t v8 = 0;
  v8[1] = 0;
  if (*a2)
  {
    unint64_t v10 = 0;
    while (1)
    {
      int v11 = (unsigned __int16)a2[v10 + 1];
      if ((v11 & 0xFFFFFFDF) - 65 > 0x19) {
        break;
      }
      *((_WORD *)v8 + v10++ + 7) = v11;
      unint64_t v12 = (unsigned __int16)*a2;
      if (v10 >= v12) {
        goto LABEL_9;
      }
    }
    sub_567C(a1, "a name may contain only letters");
    free(v9);
    return 0;
  }
  else
  {
    LOWORD(v12) = 0;
LABEL_9:
    *((_WORD *)v8 + 6) = v12;
    *((_DWORD *)v8 + 2) = a3;
    *uint64_t v8 = *(void *)(a4 + 32);
    *(void *)(a4 + 32) = v8;
    return 1;
  }
}

void sub_DCFC(uint64_t a1, _DWORD *a2, void **a3)
{
  uint64_t v4 = *a3;
  uint64_t v5 = *(unsigned int *)*a3;
  unsigned int v6 = *((_DWORD *)*a3 + 1) + 8;
  if (v6 > v5)
  {
    unsigned int v9 = v6 + (v6 >> 3);
    unint64_t v10 = malloc_type_realloc(*a3, v9, 0xD059A950uLL);
    uint64_t v4 = v10;
    if (!v10)
    {
      sub_567C(a1, "Not enough memory for display table.");
      _lou_outOfMemory();
    }
    bzero((char *)v10 + v5, v9 - v5);
    int v11 = (void *)qword_27328;
    if (qword_27328)
    {
      do
      {
        if ((void *)v11[1] == *a3) {
          v11[1] = v4;
        }
        int v11 = (void *)*v11;
      }
      while (v11);
    }
    *uint64_t v4 = v9;
    *a3 = v4;
  }
  if (a2)
  {
    *a2 = ((unint64_t)v4[1] + 0x7FFFFDCD8) >> 3;
    v4[1] += 8;
  }
}

unsigned __int16 *sub_DDE0(unsigned __int16 *result, int *a2, _WORD *a3)
{
  uint64_t v3 = *a2;
  *a3 = 0;
  if ((int)v3 < *result)
  {
    int v4 = 0;
    int v5 = v3 + 1;
    do
    {
      int v6 = result[v3 + 1];
      if ((v6 - 48) > 9) {
        break;
      }
      ++v3;
      *a2 = v5;
      int v4 = v6 + 10 * v4 - 48;
      *a3 = v4;
      ++v5;
    }
    while (v3 < *result);
  }
  return result;
}

uint64_t sub_DE3C(uint64_t a1, unsigned int a2, int a3, int a4, int a5)
{
  int v5 = (a4 != 0) ^ (a5 != 0);
  if (a2 != 74) {
    int v5 = a2 != 75;
  }
  if (v5 == (a3 == 0)) {
    return 1;
  }
  if (a3) {
    uint64_t v8 = "strings";
  }
  else {
    uint64_t v8 = "dots";
  }
  if (a4) {
    unsigned int v9 = "action";
  }
  else {
    unsigned int v9 = "test";
  }
  if (a5) {
    unint64_t v10 = "backward";
  }
  else {
    unint64_t v10 = "forward";
  }
  if (a2 < 0x75)
  {
    int v11 = off_20368[a2];
  }
  else
  {
    int v11 = byte_25ADE;
    __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", a2);
  }
  sub_567C(a1, "%s are not allowed in the %s part of a %s translation %s rule.", v8, v9, v10, v11);
  return 0;
}

void sub_DF58(unsigned __int16 *a1, int *a2, unsigned __int16 *a3, uint64_t a4)
{
  *a3 = 0;
  uint64_t v4 = *a2;
  if ((int)v4 >= *a1)
  {
LABEL_9:
    sub_567C(a4, "unterminated string");
    return;
  }
  unsigned __int16 v5 = 0;
  int v6 = v4 + 1;
  while (1)
  {
    int v7 = a1[v4 + 1];
    if (v7 != 28) {
      break;
    }
    LOWORD(v7) = 34;
LABEL_8:
    uint64_t v8 = &a3[v5++];
    *a3 = v5;
    v8[1] = v7;
    ++v4;
    *a2 = v6++;
    if (v4 >= *a1) {
      goto LABEL_9;
    }
  }
  if (v7 != 34)
  {
    if (!a1[v4 + 1]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  a3[v5 + 1] = 0;
  *a2 = v6;
}

uint64_t sub_DFE0()
{
  uint64_t v0 = (unsigned __int16 *)__chkstk_darwin();
  long long v44 = 0u;
  memset(v45, 0, sizeof(v45));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = *v0;
  int v5 = *v1;
  if (*v1 >= v4)
  {
    unsigned __int16 v12 = 0;
  }
  else
  {
    unsigned __int16 v6 = 0;
    int v7 = &v0[v5 + 1];
    while (1)
    {
      int v9 = *v7++;
      int v8 = v9;
      unsigned int v10 = v9 - 48;
      BOOL v11 = v9 != 45 && v10 >= 0xA;
      if (v11 && (v8 | 0x20u) - 97 > 5) {
        break;
      }
      int *v1 = ++v5;
      unsigned __int16 v12 = v6 + 1;
      *(&v14 + ++v6) = v8;
      if (v4 == v5) {
        goto LABEL_13;
      }
    }
    unsigned __int16 v12 = v6;
  }
LABEL_13:
  unsigned __int16 v14 = v12;
  return sub_3A80(v3, v2, &v14);
}

uint64_t sub_E110(uint64_t a1, unsigned __int16 *a2, int *a3, _WORD *a4)
{
  if ((unsigned __int16)*a4 < 0x32u) {
    return 1;
  }
  sub_567C(a1, "variable number out of range");
  return 0;
}

uint64_t sub_E16C(char *__s1, uint64_t a2)
{
  unsigned int v2 = *(uint64_t ***)(a2 + 32);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = __s1 + 2;
  unsigned int v4 = *(unsigned __int16 *)__s1;
  while (v4 != *((unsigned __int16 *)v2 + 6) || memcmp(v3, (char *)v2 + 14, 2 * v4))
  {
    unsigned int v2 = (uint64_t **)*v2;
    if (!v2) {
      return 0;
    }
  }
  return *((unsigned int *)v2 + 2);
}

uint64_t sub_E1D8(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  *a3 = 0;
  *a4 = 0;
  if (a2 < 1) {
    return 1;
  }
  int v4 = 0;
  int v5 = 0;
  while (2)
  {
    uint64_t v6 = 1;
    switch(word_28C5A[v5 + 1])
    {
      case ' ':
      case '%':
      case ';':
        return v6;
      case '!':
      case '*':
      case '+':
      case '-':
      case '?':
        goto LABEL_9;
      case '""':
      case '@':
        int v7 = (unsigned __int16)word_28C5A[v5 + 1 + 1];
        int v8 = v5 + 2;
        if (v4 >= v7)
        {
          int v5 = v8 + v7;
          v4 -= v7;
LABEL_17:
          uint64_t v6 = 1;
          if (v5 >= a2) {
            return v6;
          }
          continue;
        }
        *a3 = &word_28C5A[v8 + 1 + v4];
        *a4 = v7 - v4;
        return 1;
      case '#':
      case '&':
      case '\'':
      case '(':
      case ')':
      case ',':
      case '.':
      case '/':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ':':
LABEL_19:
        sub_567C(a1, "unhandled test suboperand: \\x%02x", (unsigned __int16)word_28C5A[v5 + 1]);
        return 0;
      case '$':
        int v9 = word_28C5C[v5 + 6];
        if (word_28C5C[v5 + 5] != v9 || v4 < v9) {
          return 1;
        }
        v5 += 7;
        v4 -= v9;
        goto LABEL_17;
      case '<':
      case '=':
      case '>':
LABEL_7:
        LODWORD(v6) = 3;
LABEL_9:
        v5 += v6;
        if (v5 >= a2) {
          return 1;
        }
        continue;
      default:
        switch(word_28C5A[v5 + 1])
        {
          case 123:
          case 125:
            return v6;
          case 124:
          case 127:
          case 128:
          case 129:
            goto LABEL_19;
          case 126:
            goto LABEL_9;
          case 130:
          case 131:
            goto LABEL_7;
          default:
            switch(word_28C5A[v5 + 1])
            {
              case '[':
              case ']':
                goto LABEL_9;
              case '_':
                v4 += (unsigned __int16)word_28C5A[v5 + 1 + 1];
                v5 += 2;
                goto LABEL_17;
              default:
                goto LABEL_19;
            }
        }
    }
  }
}

uint64_t sub_E42C()
{
  uint64_t v0 = __chkstk_darwin();
  unsigned int v2 = v1;
  int v4 = v3;
  uint64_t v5 = v0;
  unint64_t v6 = 0;
  int v7 = 0;
  long long v51 = 0u;
  memset(v52, 0, sizeof(v52));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  memset(v20, 0, 512);
  unsigned __int16 *v1 = 0;
  __int16 v21 = 0;
  unint64_t v8 = *v3;
  do
  {
    if (v6 == v8 || (int v9 = v4[v6 + 1], v9 == 44))
    {
      uint64_t result = sub_3A80(v5, v20, &v21);
      if (!result) {
        return result;
      }
      uint64_t v12 = LOWORD(v20[0]);
      unsigned __int16 v13 = LOWORD(v20[0]) + 1;
      uint64_t v14 = *v2;
      unsigned __int16 v15 = v14 + 1;
      *unsigned int v2 = v14 + 1;
      v2[v14 + 1] = v13;
      if (v12)
      {
        long long v16 = (__int16 *)v20 + 1;
        do
        {
          unsigned __int16 v17 = *v16++;
          long long v18 = &v2[v15++];
          v18[1] = v17;
          --v12;
        }
        while (v12);
        *unsigned int v2 = v15;
      }
      int v7 = 0;
      __int16 v21 = 0;
      unint64_t v8 = *v4;
    }
    else
    {
      unsigned int v10 = &v21 + (unsigned __int16)v7++;
      __int16 v21 = v7;
      v10[1] = v9;
    }
  }
  while (v6++ < v8);
  return 1;
}

void _lou_logWidecharBuf(uint64_t a1, char *__s, unsigned __int16 *a3, int a4)
{
  int v8 = 9 * a4;
  int v9 = strlen(__s);
  unsigned int v10 = (char *)malloc_type_malloc(v8 + v9 + 3, 0xA05BACABuLL);
  size_t v11 = strlen(__s);
  if ((int)v11 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      v10[v12] = __s[v12];
      ++v12;
      size_t v11 = strlen(__s);
    }
    while (v12 < (int)v11);
  }
  unsigned __int16 v13 = &v10[v11];
  if (a4 < 1)
  {
    *(_WORD *)unsigned __int16 v13 = 8318;
    long long v18 = v13 + 2;
  }
  else
  {
    uint64_t v14 = a4;
    uint64_t v15 = a4;
    long long v16 = a3;
    do
    {
      int v17 = *v16++;
      v13 += sprintf(v13, "0x%04X ", v17);
      --v15;
    }
    while (v15);
    *(_WORD *)unsigned __int16 v13 = 8318;
    long long v18 = v13 + 2;
    do
    {
      unsigned int v20 = *a3++;
      char v19 = v20;
      if (v20 >= 0x100) {
        char v19 = 32;
      }
      *v18++ = v19;
      --v14;
    }
    while (v14);
  }
  *long long v18 = 0;
  _lou_logMessage(a1, "%s", v10);

  free(v10);
}

void _lou_logMessage(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  if (__format)
  {
    if (dword_24F80 <= a1 && off_24F78 != 0)
    {
      size_t v5 = vsnprintf(0, 0, __format, va) + 1;
      unint64_t v6 = (char *)malloc_type_malloc(v5, 0xAD42D8D6uLL);
      if (v6)
      {
        int v7 = v6;
        vsnprintf(v6, v5, __format, va);
        off_24F78(a1, v7);
        free(v7);
      }
    }
  }
}

const char *(*lou_registerLogCallback(const char *(*result)(uint64_t a1, const char *a2)))(uint64_t a1, const char *a2)
{
  if (result) {
    unsigned int v1 = result;
  }
  else {
    unsigned int v1 = sub_E83C;
  }
  off_24F78 = v1;
  return result;
}

const char *sub_E83C(uint64_t a1, const char *a2)
{
  return lou_logPrint("%s", a2);
}

uint64_t lou_setLogLevel(uint64_t result)
{
  dword_24F80 = result;
  return result;
}

unint64_t lou_logFile(char *__s)
{
  unint64_t result = qword_29C60;
  if (qword_29C60)
  {
    unint64_t result = fclose((FILE *)qword_29C60);
    qword_29C60 = 0;
  }
  if (__s)
  {
    if (*__s)
    {
      unint64_t result = strlen(__s);
      if (result <= 0xFF)
      {
        if (!byte_29C68) {
          __strcpy_chk();
        }
        unint64_t result = (unint64_t)fopen(__s, "a");
        qword_29C60 = result;
        if (!result && byte_29C68)
        {
          unint64_t result = (unint64_t)fopen(&byte_29C68, "a");
          qword_29C60 = result;
        }
        if (!result)
        {
          unint64_t result = fprintf(__stderrp, "Cannot open log file %s\n", __s);
          qword_29C60 = (uint64_t)__stderrp;
        }
      }
    }
  }
  return result;
}

const char *lou_logPrint(const char *result, ...)
{
  va_start(va, result);
  if (result)
  {
    unsigned int v1 = result;
    unsigned int v2 = (FILE *)qword_29C60;
    if (!qword_29C60)
    {
      unsigned int v2 = fopen(&byte_29C68, "a");
      qword_29C60 = (uint64_t)v2;
      if (!v2)
      {
        unsigned int v2 = __stderrp;
        qword_29C60 = (uint64_t)__stderrp;
      }
    }
    vfprintf(v2, v1, va);
    fputc(10, (FILE *)qword_29C60);
    return (const char *)fflush((FILE *)qword_29C60);
  }
  return result;
}

uint64_t lou_logEnd()
{
  uint64_t result = qword_29C60;
  if (qword_29C60) {
    BOOL v1 = qword_29C60 == (void)__stderrp;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1) {
    uint64_t result = fclose((FILE *)qword_29C60);
  }
  qword_29C60 = 0;
  return result;
}

uint64_t lou_backTranslateString(char *a1, unsigned __int16 *a2, unsigned int *a3, _WORD *a4, int *a5, void *a6, void *a7, unsigned int a8)
{
  return _lou_backTranslate(a1, a1, a2, a3, a4, a5, a6, a7, 0, 0, 0, a8, 0, 0);
}

uint64_t lou_backTranslate(char *a1, unsigned __int16 *a2, unsigned int *a3, _WORD *a4, int *a5, void *a6, void *a7, char *a8, uint64_t a9, int *a10, unsigned int a11)
{
  return _lou_backTranslate(a1, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0);
}

uint64_t _lou_backTranslate(char *a1, const char *a2, unsigned __int16 *a3, unsigned int *a4, _WORD *a5, int *a6, void *a7, void *a8, char *a9, uint64_t a10, int *a11, unsigned int a12, uint64_t a13, int *a14)
{
  uint64_t result = 0;
  if (!a1) {
    return result;
  }
  long long v16 = a3;
  if (!a3 || !a4 || !a5 || !a6) {
    return result;
  }
  uint64_t v236 = 0;
  v237 = 0;
  if (!a2) {
    a2 = a1;
  }
  _lou_getTable(a1, a2, (uint64_t *)&v237, &v236);
  if (!v237) {
    return 0;
  }
  if (!_lou_isValidMode(a12)) {
    _lou_logMessage(40000, "Invalid mode parameter: %d", a12);
  }
  char v19 = &word_28C5C[466];
  if (qword_29D68)
  {
    if (*(int *)qword_29D68 < 1) {
      goto LABEL_18;
    }
  }
  else
  {
    unsigned int v20 = malloc_type_malloc(0x28uLL, 0x109004028638895uLL);
    *(_DWORD *)unsigned int v20 = 3;
    v20[1] = &unk_29D70;
    v20[2] = &unk_29D88;
    v20[3] = sub_10758;
    v20[4] = 0;
    qword_29D68 = (uint64_t)v20;
  }
  uint64_t v21 = 0;
  do
  {
    sub_1066C(v21);
    uint64_t v21 = (v21 + 1);
  }
  while ((int)v21 < *(_DWORD *)qword_29D68);
LABEL_18:
  uint64_t v22 = *a4;
  unsigned int v209 = a6;
  if ((int)v22 < 1)
  {
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    while (v16[v23])
    {
      if (v22 == ++v23)
      {
        uint64_t v23 = *a4;
        break;
      }
    }
  }
  int v24 = sub_106D4(v23);
  int v25 = v24;
  uint64_t v26 = *(void *)(qword_29D68 + 8);
  long long v27 = *(_WORD **)(v26 + 8 * v24);
  if (v23)
  {
    uint64_t v28 = v23;
    uint64_t v29 = v23;
    long long v30 = *(_WORD **)(v26 + 8 * v24);
    do
    {
      int v32 = *v16++;
      int v31 = v32;
      if ((a12 & 4) != 0) {
        __int16 DotsForChar = v31 | 0x8000;
      }
      else {
        __int16 DotsForChar = _lou_getDotsForChar(v31, v236);
      }
      *v30++ = DotsForChar;
      --v29;
    }
    while (v29);
    long long v34 = v209;
    char v19 = word_28C5C + 932;
  }
  else
  {
    uint64_t v28 = 0;
    long long v34 = v209;
  }
  v232[1] = 0;
  int v235 = 0;
  v230 = 0;
  uint64_t v231 = 0;
  uint64_t v229 = 0;
  v27[v28] = _lou_getDotsForChar(32, v236);
  v232[0] = v25;
  uint64_t v233 = v27;
  int v234 = v23;
  int v35 = sub_106D4(*v34);
  long long v36 = *(_WORD **)(*(void *)(*((void *)v19 + 429) + 8) + 8 * v35);
  unsigned int v37 = *v34;
  LODWORD(v229) = v35;
  v230 = v36;
  uint64_t v231 = v37;
  if (a9 && (int)v23 >= 1) {
    memset(a9, 255, 4 * v28);
  }
  if (a11) {
    int v38 = *a11;
  }
  else {
    int v38 = -1;
  }
  int v227 = 0;
  int v228 = v38;
  int v39 = *v34;
  if (a7)
  {
    memset(a7, 48, v39);
    int v39 = *v34;
  }
  if (a8)
  {
    memset(a8, 42, v39);
    int v39 = *v34;
  }
  uint64_t result = (uint64_t)_lou_allocMem(5, 0, v23, v39);
  __src = (void *)result;
  if (!result) {
    return result;
  }
  if ((int)v237[233] > 1 || v237[234])
  {
    uint64_t result = (uint64_t)_lou_allocMem(6, 0, v23, *v34);
    uint64_t v201 = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)_lou_allocMem(7, 0, v23, *v34);
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t result = 0;
    uint64_t v201 = 0;
  }
  long long v40 = (int *)a4;
  uint64_t v41 = (uint64_t)__src;
  uint64_t v218 = 0;
  int v214 = 0;
  if (a13 && a14)
  {
    int v214 = *a14;
    uint64_t v218 = a13;
  }
  int v42 = 0;
  int v207 = v237[234] == 0;
  int v43 = v237[233];
  long long v44 = &word_28C5C[466];
  __dst = (unsigned int *)result;
  while (2)
  {
    int v215 = v43;
    uint64_t v216 = v41;
    if (!v43)
    {
      uint64_t v126 = (uint64_t)v237;
      uint64_t v245 = 0;
      *(void *)&long long v246 = 0;
      DWORD2(v246) = 0;
      if (!v237[234] || (HIDWORD(v246) = 0, HIDWORD(v231) = 0, _lou_resetPassVariables(), int v127 = v234, v234 < 1))
      {
        LODWORD(v48) = 0;
        goto LABEL_391;
      }
      uint64_t v128 = 0;
      BOOL v129 = 1;
      while (1)
      {
        int v244 = 0;
        uint64_t v242 = 0;
        uint64_t v243 = 0;
        int v241 = 0;
        unint64_t v239 = 0;
        uint64_t v240 = 0;
        uint64_t v222 = v233;
        v226 = &v233[(int)v128];
        uint64_t v224 = (char *)sub_1076C(*v226, v126);
        if (v129)
        {
          int v130 = sub_107CC(v126, v128, 0, (uint64_t)v232, &v244, (uint64_t *)&v243, &v242, &v241, &v239);
          int v131 = v244;
          if (v130) {
            goto LABEL_330;
          }
          int v220 = v42;
          uint64_t v132 = v243;
        }
        else
        {
          int v220 = v42;
          uint64_t v132 = 0;
          int v131 = 0;
        }
        int v133 = 0;
        int v134 = v127 - v128;
        do
        {
          switch(v133)
          {
            case 0:
              if (v134 < 2) {
                break;
              }
              int v135 = sub_10904(v126, (uint64_t)v224);
              int v136 = sub_1076C((unsigned __int16)v222[(int)v128 + 1], v126);
              int v137 = sub_10904(v126, (uint64_t)v136);
              uint64_t v138 = (unsigned int *)(v126
                                    + 4
                                    * (v137
                                                   + (v135 << 8)
                                                   - 1123
                                                   * ((3824548 * (unint64_t)(v137 + (v135 << 8))) >> 32))
                                    + 22632);
LABEL_311:
              uint64_t v139 = *v138;
              if (!v139) {
                break;
              }
LABEL_312:
              uint64_t v140 = v126 + 8 * v139;
              uint64_t v132 = (unsigned __int16 *)(v140 + 31616);
              int v131 = *(_DWORD *)(v140 + 31660);
              if (v133 == 1)
              {
LABEL_313:
                if (v131 == 75
                  && sub_10964(v126, v128, (uint64_t)v232, 75, (uint64_t)v132, &v242, &v241, &v239))
                {
                  int v131 = 75;
                  goto LABEL_329;
                }
              }
              else
              {
                uint64_t v141 = *(__int16 *)(v140 + 31666);
                if (v134 >= (int)v141 && v141 != 0)
                {
                  if ((int)v141 < 1) {
                    goto LABEL_313;
                  }
                  uint64_t v143 = 8 * v139 + 31670;
                  uint64_t v144 = v226;
                  while (1)
                  {
                    __int16 v145 = sub_1076C(*(unsigned __int16 *)(v126 + v143), v126);
                    int v146 = sub_10904(v126, (uint64_t)v145);
                    int v147 = *v144++;
                    unint64_t v148 = sub_1076C(v147, v126);
                    if (v146 != sub_10904(v126, (uint64_t)v148)) {
                      break;
                    }
                    v143 += 2;
                    if (!--v141) {
                      goto LABEL_313;
                    }
                  }
                }
              }
              uint64_t v139 = *((unsigned int *)v132 + 5);
              if (!v139) {
                break;
              }
              goto LABEL_312;
            case 1:
              if (v134 < 1) {
                break;
              }
              int v134 = 1;
              uint64_t v138 = (unsigned int *)(v224 + 20);
              goto LABEL_311;
            case 2:
              int v131 = 83;
              goto LABEL_329;
          }
          ++v133;
        }
        while (v133 != 3);
LABEL_329:
        uint64_t v243 = v132;
        int v42 = v220;
        long long v44 = word_28C5C + 932;
        uint64_t v41 = v216;
LABEL_330:
        if (v131 == 75)
        {
          if (v218)
          {
            uint64_t v151 = (uint64_t)v243;
            if (v42 < v214) {
              *(void *)(v218 + 8 * v42++) = v243;
            }
          }
          else
          {
            uint64_t v151 = (uint64_t)v243;
          }
          int v43 = 0;
          int v152 = sub_10E7C(v126, (_DWORD *)&v246 + 3, a12, (uint64_t)v232, (uint64_t)&v229, v41, &v228, &v227, (unsigned int *)&v245, 75, v151, v242, v241, v239, v240);
          uint64_t v48 = HIDWORD(v246);
          if (!v152) {
            goto LABEL_391;
          }
        }
        else if (v131 == 83)
        {
          int v43 = 0;
          if (SHIDWORD(v231) >= (int)v231)
          {
            LODWORD(v48) = v128;
            goto LABEL_391;
          }
          *(_DWORD *)(v41 + 4 * (int)v128) = HIDWORD(v231);
          uint64_t v48 = (v128 + 1);
          HIDWORD(v246) = v128 + 1;
          unsigned __int16 v149 = *v226;
          uint64_t v150 = SHIDWORD(v231);
          ++HIDWORD(v231);
          v230[v150] = v149;
        }
        else
        {
          uint64_t v48 = v128;
          int v43 = 0;
        }
        BOOL v129 = (int)v48 > (int)v128;
        int v127 = v234;
        uint64_t v128 = v48;
        if ((int)v48 >= v234) {
          goto LABEL_391;
        }
      }
    }
    if (v43 != 1)
    {
      uint64_t v153 = (uint64_t)v237;
      uint64_t v245 = 0;
      long long v246 = 0uLL;
      HIDWORD(v231) = 0;
      _lou_resetPassVariables();
      int v154 = v234;
      if (v234 < 1)
      {
        LODWORD(v48) = 0;
        goto LABEL_382;
      }
      int v155 = 0;
      BOOL v156 = 1;
      while (1)
      {
        int v244 = 0;
        uint64_t v242 = 0;
        uint64_t v243 = 0;
        int v241 = 0;
        unint64_t v239 = 0;
        uint64_t v240 = 0;
        if (v156
          && sub_107CC(v153, v155, v43, (uint64_t)v232, &v244, (uint64_t *)&v243, &v242, &v241, &v239))
        {
          int v157 = v244;
          if ((v244 - 76) < 3)
          {
            if (v218)
            {
              uint64_t v158 = (uint64_t)v243;
              if (v42 < v214) {
                *(void *)(v218 + 8 * v42++) = v243;
              }
            }
            else
            {
              uint64_t v158 = (uint64_t)v243;
            }
            int v159 = sub_10E7C(v153, (_DWORD *)&v246 + 3, a12, (uint64_t)v232, (uint64_t)&v229, v41, &v228, &v227, (unsigned int *)&v245, v157, v158, v242, v241, v239, v240);
            LODWORD(v48) = HIDWORD(v246);
            if (!v159)
            {
              int v154 = v234;
              goto LABEL_382;
            }
            goto LABEL_356;
          }
          if (v244 != 83) {
            goto LABEL_368;
          }
        }
        if (SHIDWORD(v231) >= (int)v231)
        {
LABEL_368:
          LODWORD(v48) = v155;
LABEL_382:
          if ((int)v48 < v154)
          {
            LOWORD(v171) = v44[1820];
            int v172 = &v233[(int)v48];
            do
            {
              unsigned __int16 v173 = v171;
              int v174 = *v172++;
              int v171 = v174;
              if (v174 == v173)
              {
                if ((qword_29E40 & 1) == 0) {
                  goto LABEL_391;
                }
              }
              else
              {
                qword_29E40 = *((void *)sub_112D0(v171, v153) + 3);
                char v175 = qword_29E40;
                v44[1820] = v171;
                if ((v175 & 1) == 0) {
                  goto LABEL_391;
                }
              }
              LODWORD(v48) = v48 + 1;
            }
            while (v154 != v48);
            LODWORD(v48) = v154;
LABEL_391:
            long long v40 = (int *)a4;
          }
          v169 = __src;
          BOOL v170 = __dst;
          goto LABEL_393;
        }
        *(_DWORD *)(v41 + 4 * v155) = HIDWORD(v231);
        LODWORD(v48) = v155 + 1;
        HIDWORD(v246) = v155 + 1;
        __int16 v160 = v233[v155];
        uint64_t v161 = SHIDWORD(v231);
        ++HIDWORD(v231);
        v230[v161] = v160;
LABEL_356:
        BOOL v156 = (int)v48 > v155;
        int v154 = v234;
        int v155 = v48;
        if ((int)v48 >= v234) {
          goto LABEL_382;
        }
      }
    }
    long long v45 = v237;
    uint64_t v245 = 0;
    *(void *)&long long v246 = 0;
    DWORD2(v246) = 0;
    int v244 = 0;
    _lou_resetPassVariables();
    translation_directioint n = 0;
    HIDWORD(v231) = 0;
    HIDWORD(v246) = 0;
    signed int v46 = v234;
    if (v234 < 1)
    {
      LODWORD(v48) = 0;
      goto LABEL_373;
    }
    uint64_t v47 = 0;
    int v210 = 0;
    LODWORD(v48) = 0;
    uint64_t v213 = 0;
    int v212 = 117;
    while (1)
    {
      int v241 = 0;
      uint64_t v238 = 0;
      unint64_t v239 = 0;
      uint64_t v242 = 0;
      uint64_t v243 = 0;
      uint64_t v240 = 0;
      uint64_t v49 = HIDWORD(v231);
      int v50 = HIDWORD(v231) ? (unsigned __int16)v230[HIDWORD(v231) - 1] : 32;
      uint64_t v51 = *((void *)sub_1076C(v50, (uint64_t)v45) + 3);
      if (HIDWORD(v245) == 2)
      {
        if ((v51 & 0x210) == 0)
        {
          int v52 = 0;
          goto LABEL_66;
        }
      }
      else if (HIDWORD(v245) == 1 && (v51 & 0x10) != 0)
      {
        int v52 = 2;
LABEL_66:
        HIDWORD(v245) = v52;
      }
      int v219 = v42;
      int v53 = DWORD1(v246);
      if (DWORD1(v246) == 2 && (int)v49 >= 1 && (v51 & 0x4000900) == 0)
      {
        int v53 = 0;
        DWORD1(v246) = 0;
      }
      int v54 = DWORD2(v246);
      uint64_t v55 = (uint64_t)v233;
      uint64_t v223 = v51;
      uint64_t v225 = &v233[(int)v47];
      int v56 = (char *)sub_112D0((unsigned __int16)*v225, (uint64_t)v45);
      if (!sub_11860(v45, &v241, (_DWORD *)&v238 + 1, (uint64_t)&v243, &v244, v213))
      {
        uint64_t v221 = v55;
        uint64_t v205 = v49;
        int v57 = 0;
        int v58 = v46 - v47;
        BOOL v59 = (v223 & 9) == 0;
        int v60 = (a12 >> 8) & 1;
        if (v223) {
          int v61 = (a12 >> 8) & 1;
        }
        else {
          LOBYTE(v61) = 1;
        }
        char v204 = v61;
        if (v54) {
          LOBYTE(v60) = 1;
        }
        if (v53) {
          BOOL v59 = 1;
        }
        char v203 = v60 | v59;
        v202 = v230 - 1;
        int v217 = v53;
LABEL_86:
        if (v58 < 2 || v53 && (v56[25] & 1) != 0)
        {
          do
          {
            while (1)
            {
LABEL_182:
              if (!++v57) {
                goto LABEL_86;
              }
              if (v57 == 1) {
                break;
              }
              if (v57 == 2)
              {
                uint64_t v243 = (unsigned __int16 *)&unk_29D98;
                dword_29DC4 = 117;
                HIDWORD(v238) = 117;
                word_29DCC = 1;
                int v241 = 1;
                word_29DCE = *v225;
                word_29DCA = 0;
                goto LABEL_72;
              }
            }
          }
          while (v58 <= 0);
          int v58 = 1;
          unsigned int v64 = (unsigned int *)(v56 + 20);
        }
        else
        {
          int v62 = *((unsigned __int16 *)v56 + 22);
          unsigned int v63 = *((unsigned __int16 *)sub_112D0(*(unsigned __int16 *)(v221 + 2 * ((int)v47 + 1)), (uint64_t)v45) + 22)
              + (v62 << 8);
          unsigned int v64 = &v45[(v63 - 1123 * ((3824548 * (unint64_t)v63) >> 32)) + 6781];
        }
        uint64_t v65 = *v64;
        if (!v65) {
          goto LABEL_182;
        }
        while (2)
        {
          unsigned int v66 = &v45[2 * v65];
          uint64_t v67 = (uint64_t)(v66 + 7904);
          uint64_t v243 = (unsigned __int16 *)(v66 + 7904);
          unsigned int v68 = v66[7915];
          HIDWORD(v238) = v68;
          if (v68 == 74)
          {
            int v69 = (unsigned __int16 *)v66 + 15835;
            __int16 v70 = (__int16 *)(v67 + 50);
          }
          else
          {
            int v69 = (unsigned __int16 *)v66 + *((__int16 *)v66 + 15833) + 15835;
            __int16 v70 = (__int16 *)(v67 + 52);
          }
          uint64_t v71 = *v70;
          int v241 = v71;
          if (v71) {
            BOOL v72 = v58 < (int)v71;
          }
          else {
            BOOL v72 = 1;
          }
          if (v72)
          {
LABEL_111:
            uint64_t v82 = (unsigned int *)v67;
          }
          else
          {
            if ((int)v71 >= 1)
            {
              int v73 = v225;
              uint64_t v74 = v71;
              do
              {
                int v76 = (unsigned __int16)*v73++;
                int v75 = v76;
                int v77 = *v69++;
                if (v75 != v77) {
                  goto LABEL_111;
                }
              }
              while (--v74);
            }
            if ((int)v47 + (int)v71 >= v46) {
              int v78 = 32;
            }
            else {
              int v78 = *(unsigned __int16 *)(v221 + 2 * ((int)v47 + (int)v71));
            }
            uint64_t v79 = *((void *)sub_112D0(v78, (uint64_t)v45) + 3);
            uint64_t v80 = *(void *)(v67 + 24);
            if ((v80 & 0xFFFFFFFFFDFFFFFFLL) != 0 && (v80 & v223) == 0) {
              goto LABEL_111;
            }
            uint64_t v81 = *(void *)(v67 + 32);
            if ((v81 & 0xFFFFFFFFFDFFFFFFLL) != 0 && (v81 & v79) == 0) {
              goto LABEL_111;
            }
            uint64_t v82 = (unsigned int *)v67;
            switch(v68)
            {
              case 3u:
              case 4u:
              case 5u:
              case 6u:
              case 7u:
              case 0x17u:
              case 0x25u:
              case 0x26u:
              case 0x2Du:
              case 0x2Eu:
              case 0x3Du:
              case 0x3Eu:
              case 0x3Fu:
              case 0x40u:
              case 0x41u:
              case 0x42u:
              case 0x43u:
              case 0x44u:
              case 0x49u:
              case 0x4Fu:
              case 0x54u:
              case 0x5Au:
              case 0x6Eu:
                goto LABEL_72;
              case 8u:
              case 9u:
              case 0xAu:
              case 0xBu:
              case 0xCu:
              case 0xDu:
              case 0xEu:
              case 0xFu:
              case 0x10u:
              case 0x11u:
              case 0x12u:
              case 0x14u:
              case 0x15u:
              case 0x16u:
              case 0x19u:
              case 0x1Au:
              case 0x1Bu:
              case 0x1Cu:
              case 0x1Du:
              case 0x1Eu:
              case 0x1Fu:
              case 0x20u:
              case 0x21u:
              case 0x22u:
              case 0x23u:
              case 0x24u:
              case 0x27u:
              case 0x28u:
              case 0x29u:
              case 0x2Au:
              case 0x2Bu:
              case 0x2Cu:
              case 0x31u:
              case 0x32u:
              case 0x33u:
              case 0x34u:
              case 0x35u:
              case 0x36u:
              case 0x37u:
              case 0x38u:
              case 0x39u:
              case 0x3Au:
              case 0x3Bu:
              case 0x3Cu:
              case 0x45u:
              case 0x46u:
              case 0x48u:
              case 0x4Bu:
              case 0x4Cu:
              case 0x4Du:
              case 0x4Eu:
              case 0x50u:
              case 0x51u:
              case 0x52u:
              case 0x55u:
              case 0x56u:
              case 0x57u:
              case 0x58u:
              case 0x59u:
              case 0x6Fu:
              case 0x70u:
                break;
              case 0x13u:
              case 0x18u:
                if ((v223 & 2) != 0) {
                  goto LABEL_111;
                }
                uint64_t v82 = (unsigned int *)v67;
                if ((v79 & 0x82) != 0) {
                  goto LABEL_72;
                }
                break;
              case 0x2Fu:
                uint64_t v83 = 130;
                goto LABEL_178;
              case 0x30u:
                int v244 = v71;
                if (sub_11860(v45, &v241, (_DWORD *)&v238 + 1, (uint64_t)&v243, &v244, v67))
                {
                  uint64_t v213 = v67;
                  goto LABEL_72;
                }
                uint64_t v82 = (unsigned int *)v243;
                uint64_t v213 = v67;
                break;
              case 0x47u:
                uint64_t v82 = (unsigned int *)v67;
                if (!v217) {
                  break;
                }
                goto LABEL_72;
              case 0x4Au:
                int v84 = sub_10964((uint64_t)v45, v47, (uint64_t)v232, 74, v67, &v242, (int *)&v238, &v239);
                goto LABEL_159;
              case 0x53u:
                if ((v223 & 0x100) != 0 && (v79 & 0x100) != 0)
                {
                  uint64_t v82 = (unsigned int *)v67;
                  if (*(__int16 *)(v67 + 50) > 1) {
                    break;
                  }
                }
                goto LABEL_72;
              case 0x5Bu:
                if (v203) {
                  goto LABEL_111;
                }
                goto LABEL_142;
              case 0x5Cu:
                if ((v223 & 0x100) != 0) {
                  goto LABEL_111;
                }
                if ((v223 & 2) != 0) {
                  goto LABEL_72;
                }
                goto LABEL_153;
              case 0x5Du:
              case 0x5Eu:
                if ((v223 & 9) == 0) {
                  goto LABEL_111;
                }
                if ((a12 & 0x100) != 0) {
                  goto LABEL_72;
                }
                uint64_t v82 = (unsigned int *)v67;
                if ((v79 & 1) == 0) {
                  goto LABEL_72;
                }
                break;
              case 0x5Fu:
                if ((v204 & 1) != 0 || v212 == 94) {
                  goto LABEL_111;
                }
                uint64_t v82 = (unsigned int *)v67;
                if (v79) {
                  goto LABEL_72;
                }
                break;
              case 0x60u:
                if ((v223 & 9) == 0) {
                  goto LABEL_111;
                }
LABEL_142:
                if (v79) {
                  goto LABEL_72;
                }
                goto LABEL_158;
              case 0x61u:
                uint64_t v82 = (unsigned int *)v67;
                if ((v223 & 9) == 0) {
                  break;
                }
                goto LABEL_72;
              case 0x62u:
                if ((v223 & 0xB) == 0) {
                  goto LABEL_111;
                }
                goto LABEL_158;
              case 0x63u:
                if ((v223 & 9) == 0) {
                  goto LABEL_111;
                }
                goto LABEL_153;
              case 0x64u:
                if ((v223 & 0xB) == 0) {
                  goto LABEL_111;
                }
                goto LABEL_153;
              case 0x65u:
                if ((v223 & 2) == 0) {
                  goto LABEL_111;
                }
LABEL_153:
                int v85 = sub_11988((uint64_t)v45, v47, a12, (uint64_t)v232, v71);
                uint64_t v82 = (unsigned int *)v67;
                if (!v85) {
                  goto LABEL_72;
                }
                break;
              case 0x66u:
                uint64_t v82 = (unsigned int *)v67;
                if ((v223 & 2) == 0) {
                  break;
                }
                goto LABEL_72;
              case 0x67u:
                if ((v223 & 2) == 0) {
                  goto LABEL_111;
                }
                goto LABEL_158;
              case 0x68u:
                uint64_t v86 = v205;
                if (!v205) {
                  goto LABEL_72;
                }
                do
                {
                  if ((int)v86 < 1) {
                    goto LABEL_72;
                  }
                  uint64_t v87 = v86 - 1;
                  uint64_t v88 = *((void *)sub_1076C((unsigned __int16)v202[v86], (uint64_t)v45) + 3);
                  int v89 = (v88 & 0xC6) != 0;
                  if (v88) {
                    int v89 = 2;
                  }
                  uint64_t v86 = v87;
                }
                while (!v89);
                if (v89 != 2) {
                  goto LABEL_111;
                }
                goto LABEL_72;
              case 0x69u:
LABEL_158:
                int v84 = sub_11988((uint64_t)v45, v47, a12, (uint64_t)v232, v71);
                goto LABEL_159;
              case 0x6Au:
                if ((v223 & 9) == 0) {
                  goto LABEL_111;
                }
                uint64_t v82 = (unsigned int *)v67;
                if ((v79 & 0x180) != 0) {
                  goto LABEL_72;
                }
                break;
              case 0x6Bu:
                if ((v223 & 4) == 0) {
                  goto LABEL_111;
                }
                uint64_t v82 = (unsigned int *)v67;
                if ((v79 & 0x100) != 0) {
                  goto LABEL_72;
                }
                break;
              case 0x6Cu:
                if (!v217) {
                  goto LABEL_111;
                }
                uint64_t v82 = (unsigned int *)v67;
                if ((v79 & 0x100) == 0) {
                  goto LABEL_72;
                }
                break;
              case 0x6Du:
                uint64_t v83 = 260;
LABEL_178:
                uint64_t v82 = (unsigned int *)v67;
                if ((v79 & v83) != 0) {
                  goto LABEL_72;
                }
                break;
              case 0x71u:
                uint64_t v90 = &v45[2 * *(unsigned int *)(v67 + 40)];
                if (!_lou_pattern_check(v221, v47 - 1, 0xFFFFFFFF, 0xFFFFFFFFLL, (uint64_t)v90 + 31618, (uint64_t)v45)) {
                  goto LABEL_111;
                }
                int v84 = _lou_pattern_check(v221, v47 + *(__int16 *)(v67 + 52), v46, 1, (uint64_t)v90 + 2 * *((unsigned __int16 *)v90 + 15808) + 31616, (uint64_t)v45);
LABEL_159:
                uint64_t v82 = (unsigned int *)v67;
                if (v84) {
                  goto LABEL_72;
                }
                break;
              default:
                goto LABEL_111;
            }
          }
          uint64_t v65 = v82[5];
          if (!v65)
          {
            int v53 = v217;
            goto LABEL_182;
          }
          continue;
        }
      }
LABEL_72:
      if (v218)
      {
        int v42 = v219;
        if (v219 < v214)
        {
          *(void *)(v218 + 8 * v219) = v243;
          int v42 = v219 + 1;
        }
      }
      else
      {
        int v42 = v219;
      }
      int v91 = HIDWORD(v238);
      if (SHIDWORD(v238) > 36) {
        break;
      }
      if (SHIDWORD(v238) <= 18)
      {
        uint64_t v92 = (int)v47;
        switch(HIDWORD(v238))
        {
          case 3:
            uint64_t v245 = 1;
            DWORD1(v246) = 0;
            int v93 = v241;
            if (v241 < 1) {
              goto LABEL_248;
            }
            uint64_t v41 = v216;
            uint64_t v94 = (_DWORD *)(v216 + 4 * (int)v47);
            uint64_t v47 = (v47 + v241);
            do
            {
              *v94++ = HIDWORD(v231);
              --v93;
            }
            while (v93);
            break;
          case 4:
            HIDWORD(v245) = 1;
            DWORD1(v246) = 0;
            int v101 = v241;
            if (v241 < 1) {
              goto LABEL_248;
            }
            uint64_t v41 = v216;
            int v102 = (_DWORD *)(v216 + 4 * (int)v47);
            uint64_t v47 = (v47 + v241);
            do
            {
              *v102++ = HIDWORD(v231);
              --v101;
            }
            while (v101);
            break;
          case 5:
            HIDWORD(v245) = 0;
            DWORD1(v246) = 0;
            int v103 = v241;
            if (v241 < 1) {
              goto LABEL_248;
            }
            uint64_t v41 = v216;
            int v104 = (_DWORD *)(v216 + 4 * (int)v47);
            uint64_t v47 = (v47 + v241);
            do
            {
              *v104++ = HIDWORD(v231);
              --v103;
            }
            while (v103);
            break;
          case 6:
            *(void *)&long long v246 = 1;
            int v105 = v241;
            if (v241 < 1) {
              goto LABEL_248;
            }
            uint64_t v41 = v216;
            int v106 = (_DWORD *)(v216 + 4 * (int)v47);
            uint64_t v47 = (v47 + v241);
            do
            {
              *v106++ = HIDWORD(v231);
              --v105;
            }
            while (v105);
            break;
          case 7:
            *(void *)&long long v246 = 0;
            int v107 = v241;
            if (v241 < 1) {
              goto LABEL_248;
            }
            uint64_t v41 = v216;
            uint64_t v108 = (_DWORD *)(v216 + 4 * (int)v47);
            uint64_t v47 = (v47 + v241);
            do
            {
              *v108++ = HIDWORD(v231);
              --v107;
            }
            while (v107);
            break;
          default:
            goto LABEL_257;
        }
        goto LABEL_247;
      }
      uint64_t v92 = (int)v47;
      if (HIDWORD(v238) == 19) {
        goto LABEL_207;
      }
      if (HIDWORD(v238) != 23)
      {
        if (HIDWORD(v238) != 24) {
          goto LABEL_257;
        }
LABEL_207:
        *(void *)((char *)&v246 + 4) = 0x100000000;
        int v98 = v241;
        if (v241 < 1) {
          goto LABEL_248;
        }
        uint64_t v41 = v216;
        __int16 v99 = (_DWORD *)(v216 + 4 * v92);
        uint64_t v47 = (v47 + v241);
        do
        {
          *v99++ = HIDWORD(v231);
          --v98;
        }
        while (v98);
        goto LABEL_247;
      }
      DWORD1(v246) = 1;
      HIDWORD(v245) = 0;
      int v109 = v241;
      if (v241 < 1)
      {
LABEL_248:
        long long v44 = word_28C5C + 932;
        uint64_t v41 = v216;
        goto LABEL_249;
      }
      uint64_t v41 = v216;
      uint64_t v110 = (_DWORD *)(v216 + 4 * (int)v47);
      uint64_t v47 = (v47 + v241);
      do
      {
        *v110++ = HIDWORD(v231);
        --v109;
      }
      while (v109);
LABEL_247:
      long long v44 = word_28C5C + 932;
LABEL_249:
      HIDWORD(v246) = v47;
      uint64_t v100 = v47;
LABEL_286:
      signed int v46 = v234;
      uint64_t v47 = v100;
      if ((int)v100 >= v234) {
        goto LABEL_361;
      }
    }
    if (SHIDWORD(v238) <= 70)
    {
      uint64_t v92 = (int)v47;
      switch(HIDWORD(v238))
      {
        case '%':
        case '&':
        case '.':
          break;
        case '\'':
        case '(':
        case ')':
        case '*':
        case '+':
        case ',':
          goto LABEL_257;
        case '-':
          DWORD1(v246) = 0;
          break;
        case '/':
          goto LABEL_207;
        default:
          uint64_t v92 = (int)v47;
          if (HIDWORD(v238) == 61)
          {
            uint64_t v245 = 0;
            *(void *)((char *)&v246 + 4) = 0;
          }
          goto LABEL_257;
      }
      int v95 = v241;
      int v96 = v241 - 1;
      if (v241 < 1)
      {
        long long v44 = word_28C5C + 932;
        uint64_t v41 = v216;
      }
      else
      {
        uint64_t v41 = v216;
        unsigned int v97 = (_DWORD *)(v216 + 4 * (int)v47);
        uint64_t v47 = (v47 + v241);
        do
        {
          *v97++ = HIDWORD(v231);
          --v95;
        }
        while (v95);
        int v96 = -1;
        long long v44 = word_28C5C + 932;
      }
      int v241 = v96;
      goto LABEL_249;
    }
    if (SHIDWORD(v238) <= 89)
    {
      if (HIDWORD(v238) != 71)
      {
        if (HIDWORD(v238) == 73)
        {
          int v111 = v241;
          int v112 = v241 - 1;
          if (v241 < 1)
          {
            long long v44 = word_28C5C + 932;
            uint64_t v41 = v216;
          }
          else
          {
            uint64_t v41 = v216;
            uint64_t v113 = (_DWORD *)(v216 + 4 * (int)v47);
            uint64_t v47 = (v47 + v241);
            do
            {
              *v113++ = HIDWORD(v231);
              --v111;
            }
            while (v111);
            int v112 = -1;
            long long v44 = word_28C5C + 932;
          }
          int v241 = v112;
          HIDWORD(v246) = v47;
          if ((__int16)v243[25] >= 1)
          {
            uint64_t v123 = v243 + 27;
            uint64_t v124 = v243[25];
            do
            {
              unsigned int v125 = *v123++;
              if (!sub_11458(v125, (uint64_t)v45, v47, a12, (uint64_t)v232, (uint64_t)&v229, v41, &v228, &v227, (unsigned int *)&v245))goto LABEL_359; {
            }
              }
            while (--v124);
          }
          uint64_t v100 = v47;
          goto LABEL_264;
        }
        uint64_t v92 = (int)v47;
        if (HIDWORD(v238) != 74) {
          goto LABEL_257;
        }
        uint64_t v41 = v216;
        uint64_t result = sub_10E7C((uint64_t)v45, (_DWORD *)&v246 + 3, a12, (uint64_t)v232, (uint64_t)&v229, v216, &v228, &v227, (unsigned int *)&v245, 74, (uint64_t)v243, v242, v238, v239, v240);
        if (!result) {
          return result;
        }
        uint64_t v100 = HIDWORD(v246);
        goto LABEL_220;
      }
      DWORD1(v246) = 2;
LABEL_256:
      uint64_t v92 = (int)v47;
      goto LABEL_257;
    }
    if (SHIDWORD(v238) <= 107)
    {
      if (HIDWORD(v238) == 90)
      {
        uint64_t v92 = (int)v47;
        if (v212 == 90
          && !sub_117DC((uint64_t)v45, v47, (uint64_t)v232, (uint64_t)&v229, (uint64_t)a8, v216, &v228, &v227, (unsigned int *)&v245))
        {
          LODWORD(v100) = v47;
          long long v44 = word_28C5C + 932;
          uint64_t v41 = v216;
          goto LABEL_360;
        }
      }
      else
      {
        uint64_t v92 = (int)v47;
        if (HIDWORD(v238) == 106) {
          DWORD1(v246) = 1;
        }
      }
LABEL_257:
      if (!v243[25])
      {
        int v114 = v241;
        uint64_t v100 = (v241 + v47);
        uint64_t v115 = v92;
        long long v44 = word_28C5C + 932;
        uint64_t v41 = v216;
        while (sub_11458((unsigned __int16)v233[v115], (uint64_t)v45, v47, a12, (uint64_t)v232, (uint64_t)&v229, v216, &v228, &v227, (unsigned int *)&v245))
        {
          LODWORD(v47) = v47 + 1;
          ++v115;
          if (!--v114) {
            goto LABEL_263;
          }
        }
LABEL_359:
        LODWORD(v100) = v47;
        goto LABEL_360;
      }
      uint64_t v41 = v216;
      long long v44 = &word_28C5C[466];
      if (!sub_1154C(v243 + 27, (__int16)v243[26], (__int16)v243[25], (uint64_t)v45, v47, (uint64_t)v232, (uint64_t)&v229, v216, &v228, &v227, (unsigned int *)&v245))goto LABEL_359; {
      uint64_t v100 = (v241 + v47);
      }
LABEL_263:
      HIDWORD(v246) = v100;
LABEL_264:
      if ((v91 - 93) <= 1)
      {
        if (!sub_117DC((uint64_t)v45, v100, (uint64_t)v232, (uint64_t)&v229, (uint64_t)a8, v41, &v228, &v227, (unsigned int *)&v245))goto LABEL_360; {
        goto LABEL_271;
        }
      }
LABEL_267:
      if (sub_107CC((uint64_t)v45, v100, 1, (uint64_t)v232, (int *)&v238 + 1, (uint64_t *)&v243, &v242, (int *)&v238, &v239))
      {
        int v91 = HIDWORD(v238);
        if (HIDWORD(v238) == 74)
        {
          sub_10E7C((uint64_t)v45, (_DWORD *)&v246 + 3, a12, (uint64_t)v232, (uint64_t)&v229, v41, &v228, &v227, (unsigned int *)&v245, 74, (uint64_t)v243, v242, v238, v239, v240);
          uint64_t v100 = HIDWORD(v246);
        }
      }
      else
      {
        int v91 = 83;
        HIDWORD(v238) = 83;
      }
LABEL_271:
      if ((int)v100 >= 1)
      {
        int v116 = (unsigned __int16)v233[(v100 - 1)];
        if (v44[1820] == v116)
        {
          LODWORD(v117) = qword_29E40;
        }
        else
        {
          uint64_t v117 = *((void *)sub_112D0(v116, (uint64_t)v45) + 3);
          qword_29E40 = v117;
          v44[1820] = v116;
        }
        BOOL v118 = v91 != 94;
        BOOL v119 = (v118 & v117) == 0;
        if ((v118 & v117) != 0) {
          LODWORD(v48) = v100;
        }
        int v120 = v210;
        if (!v119) {
          int v120 = HIDWORD(v231);
        }
        int v210 = v120;
      }
      BOOL v121 = (v91 - 62) >= 0xA && (v91 - 83) >= 0x23;
      int v122 = v212;
      if (!v121) {
        int v122 = v91;
      }
      int v212 = v122;
      goto LABEL_286;
    }
    if (HIDWORD(v238) == 108)
    {
      DWORD1(v246) = 0;
      goto LABEL_256;
    }
    uint64_t v92 = (int)v47;
    if (HIDWORD(v238) != 117) {
      goto LABEL_257;
    }
    uint64_t v41 = v216;
    if (sub_11758((unsigned __int16)*v225, a12, (uint64_t)&v229, v47, v216))
    {
      uint64_t v100 = (v47 + 1);
      HIDWORD(v246) = v47 + 1;
LABEL_220:
      long long v44 = &word_28C5C[466];
      goto LABEL_267;
    }
    LODWORD(v100) = v47;
    long long v44 = word_28C5C + 932;
LABEL_360:
    signed int v46 = v234;
LABEL_361:
    if (v210 && (int)v100 < v46)
    {
      int v162 = (unsigned __int16)v233[(int)v100];
      if (v44[1820] == v162)
      {
        LOBYTE(v163) = qword_29E40;
      }
      else
      {
        uint64_t v163 = *((void *)sub_112D0((unsigned __int16)v233[(int)v100], (uint64_t)v45) + 3);
        qword_29E40 = v163;
        v44[1820] = v162;
      }
      long long v40 = (int *)a4;
      if (v163) {
        LODWORD(v48) = v100;
      }
      else {
        HIDWORD(v231) = v210;
      }
    }
    else
    {
      LODWORD(v48) = v100;
      long long v40 = (int *)a4;
    }
LABEL_373:
    if ((int)v48 < v46)
    {
      LOWORD(v164) = v44[1820];
      uint64_t v165 = &v233[(int)v48];
      do
      {
        unsigned __int16 v166 = v164;
        int v167 = *v165++;
        int v164 = v167;
        if (v167 == v166)
        {
          if ((qword_29E40 & 1) == 0) {
            goto LABEL_381;
          }
        }
        else
        {
          qword_29E40 = *((void *)sub_112D0(v164, (uint64_t)v45) + 3);
          char v168 = qword_29E40;
          v44[1820] = v164;
          if ((v168 & 1) == 0) {
            goto LABEL_381;
          }
        }
        LODWORD(v48) = v48 + 1;
      }
      while (v46 != v48);
      LODWORD(v48) = v46;
    }
LABEL_381:
    v169 = __src;
    BOOL v170 = __dst;
    int v43 = v215;
LABEL_393:
    *(_DWORD *)(v41 + 4 * (int)v48) = HIDWORD(v231);
    if ((const void *)v41 != v169)
    {
      memcpy(v170, v169, 4 * *v40 + 4);
      if (*v40 < 0) {
        goto LABEL_406;
      }
      uint64_t v176 = 0;
      int v177 = v234;
      while (1)
      {
        uint64_t v178 = v170[v176];
        uint64_t v179 = (_DWORD *)v41;
        if ((v178 & 0x80000000) == 0)
        {
          if ((int)v178 >= (int)v48)
          {
            if (v178 != v48 || (uint64_t v179 = (_DWORD *)(v41 + 4 * v48), (int)v48 < v177))
            {
              *long long v40 = v176;
              *((_DWORD *)v169 + v176) = HIDWORD(v231);
              goto LABEL_406;
            }
          }
          else
          {
            uint64_t v179 = (_DWORD *)(v41 + 4 * v178);
          }
        }
        *((_DWORD *)v169 + v176) = *v179;
        BOOL v72 = v176++ < *v40;
        if (!v72) {
          goto LABEL_406;
        }
      }
    }
    uint64_t v41 = v201;
    if ((int)v48 < v234)
    {
      *long long v40 = v48;
      uint64_t v41 = v201;
    }
LABEL_406:
    if (v43 > v207)
    {
      --v43;
      sub_1066C(v232[0]);
      v232[0] = v229;
      uint64_t v233 = v230;
      int v234 = HIDWORD(v231);
      int v180 = sub_106D4(*v209);
      v181 = *(_WORD **)(*(void *)(qword_29D68 + 8) + 8 * v180);
      unsigned int v182 = *v209;
      LODWORD(v229) = v180;
      v230 = v181;
      uint64_t v231 = v182;
      continue;
    }
    break;
  }
  int v183 = HIDWORD(v231);
  BOOL v184 = a5;
  if (SHIDWORD(v231) >= 1)
  {
    int v185 = v230;
    uint64_t v186 = HIDWORD(v231);
    do
    {
      __int16 v187 = *v185++;
      *v184++ = v187;
      --v186;
    }
    while (v186);
  }
  *unsigned int v209 = v183;
  if (a10)
  {
    int v188 = *v40;
    if (*v40 < 1)
    {
      int v191 = -1;
      int v190 = -1;
    }
    else
    {
      uint64_t v189 = 0;
      int v190 = -1;
      int v191 = -1;
      do
      {
        int v192 = *((_DWORD *)v169 + v189);
        if (v192 > v190)
        {
          int v193 = v191 & ~(v191 >> 31);
          do
          {
            if ((v190 & 0x80000000) == 0 && v190 < *v209)
            {
              *(_DWORD *)(a10 + 4 * v190) = v193;
              int v192 = *((_DWORD *)v169 + v189);
            }
            ++v190;
          }
          while (v190 < v192);
          int v188 = *v40;
          int v191 = v189;
        }
        ++v189;
      }
      while (v189 < v188);
      int v183 = *v209;
    }
    uint64_t v194 = v190 & ~(v190 >> 31);
    if ((int)v194 < v183)
    {
      do
        *(_DWORD *)(a10 + 4 * v194++) = v191;
      while (*v209 > (int)v194);
    }
  }
  if (a9 && *v40 >= 1)
  {
    uint64_t v195 = 0;
    do
    {
      int v196 = *((_DWORD *)v169 + v195);
      if (v196 < 0)
      {
        int v196 = 0;
      }
      else if (v196 >= *v209)
      {
        int v196 = *v209 - 1;
      }
      *(_DWORD *)&a9[4 * v195++] = v196;
    }
    while (v195 < *v40);
  }
  if (a11)
  {
    uint64_t v197 = *a11;
    if (v197 != -1)
    {
      int v198 = (int *)&a9[4 * v197];
      if (!a9) {
        int v198 = &v228;
      }
      *a11 = *v198;
    }
  }
  if (a14) {
    *a14 = v42;
  }
  return 1;
}

uint64_t sub_1066C(uint64_t result)
{
  if ((result & 0x80000000) == 0 && *(_DWORD *)qword_29D68 > (int)result)
  {
    uint64_t v1 = *(void *)(qword_29D68 + 16);
    uint64_t v2 = result;
    if (*(_DWORD *)(v1 + 4 * result))
    {
      uint64_t v3 = *(uint64_t (**)(void))(qword_29D68 + 32);
      if (v3)
      {
        uint64_t result = v3(*(void *)(*(void *)(qword_29D68 + 8) + 8 * result));
        uint64_t v1 = *(void *)(qword_29D68 + 16);
      }
    }
    *(_DWORD *)(v1 + 4 * v2) = 0;
  }
  return result;
}

uint64_t sub_106D4(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)qword_29D68;
  if ((int)v1 < 1) {
LABEL_5:
  }
    _lou_outOfMemory();
  uint64_t v2 = 0;
  while (*(_DWORD *)(*(void *)(qword_29D68 + 16) + 4 * v2))
  {
    if (v1 == ++v2) {
      goto LABEL_5;
    }
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(qword_29D68 + 24))(v2, a1);
  uint64_t v4 = qword_29D68;
  *(void *)(*(void *)(qword_29D68 + 8) + 8 * v2) = v3;
  *(_DWORD *)(*(void *)(v4 + 16) + 4 * v2) = 1;
  return v2;
}

void *sub_10758(unsigned int a1, int a2)
{
  return _lou_allocMem(4, a1, 0, a2);
}

void *sub_1076C(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 13608);
  if (v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      if (*(unsigned __int16 *)(a2 + 8 * v4 + 31660) == a1) {
        break;
      }
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!v4) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t result = &unk_24F88;
    word_24FB4 = a1;
  }
  return result;
}

uint64_t sub_107CC(uint64_t a1, int a2, int a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t *a7, int *a8, _DWORD *a9)
{
  uint64_t v9 = *(unsigned int *)(a1 + 4 * a3 + 22612);
  if (!v9) {
    return 0;
  }
  while (2)
  {
    uint64_t v18 = a1 + 8 * v9 + 31616;
    *a6 = v18;
    int v19 = *(_DWORD *)(v18 + 44);
    *a5 = v19;
    switch(v19)
    {
      case 'J':
        if (a3 == 1) {
          goto LABEL_12;
        }
        goto LABEL_13;
      case 'K':
        if (!a3) {
          goto LABEL_12;
        }
        goto LABEL_13;
      case 'L':
        if (a3 != 2) {
          goto LABEL_13;
        }
        goto LABEL_12;
      case 'M':
        if (a3 != 3) {
          goto LABEL_13;
        }
        goto LABEL_12;
      case 'N':
        if (a3 != 4) {
          goto LABEL_13;
        }
LABEL_12:
        if (!sub_10964(a1, a2, a4, v19, *a6, a7, a8, a9))
        {
LABEL_13:
          uint64_t v9 = *(unsigned int *)(*a6 + 20);
          if (!v9) {
            return 0;
          }
          continue;
        }
        return 1;
      default:
        goto LABEL_13;
    }
  }
}

uint64_t sub_10904(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 32);
  if ((v2 & 0x10) == 0)
  {
LABEL_2:
    uint64_t v3 = a2;
    return *(unsigned __int16 *)(v3 + 44);
  }
  uint64_t v4 = *(unsigned int *)(a2 + 48);
  if (v4) {
    uint64_t v3 = a1 + 8 * v4 + 31616;
  }
  else {
    uint64_t v3 = a2;
  }
  unint64_t v5 = v2 & 0xFFFFFFFFFFFFFFEFLL;
  if ((v5 & ~*(void *)(v3 + 32)) != 0)
  {
    while (1)
    {
      uint64_t v6 = *(unsigned int *)(v3 + 52);
      if (!v6) {
        break;
      }
      uint64_t v7 = a1 + 8 * v6;
      uint64_t v3 = v7 + 31616;
      if ((v5 & ~*(void *)(v7 + 31648)) == 0) {
        return *(unsigned __int16 *)(v3 + 44);
      }
    }
    goto LABEL_2;
  }
  return *(unsigned __int16 *)(v3 + 44);
}

uint64_t sub_10964(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t *a6, int *a7, _DWORD *a8)
{
  *a6 = a5 + 2 * *(__int16 *)(a5 + 50) + 54;
  *a7 = 0;
  a8[3] = a2;
  *a8 = a2;
  a8[1] = -1;
  int v8 = *a7;
  int v9 = *(__int16 *)(a5 + 52);
  uint64_t v10 = 1;
  if (*a7 < v9)
  {
    size_t v11 = a8;
    uint64_t v14 = a5;
    LODWORD(v16) = a2;
    uint64_t v17 = a1;
    BOOL v18 = 0;
    uint64_t v19 = a1 + 31670;
    do
    {
      int v59 = 1;
      int v20 = *(_DWORD *)(a3 + 16);
      if ((int)v16 > v20) {
        return 0;
      }
      uint64_t v21 = *a6;
      unsigned int v22 = *(unsigned __int16 *)(*a6 + 2 * v8);
      if (v22 > 0x5A)
      {
        switch(*(_WORD *)(*a6 + 2 * v8))
        {
          case '[':
            v11[1] = v16;
            goto LABEL_49;
          case '\\':
          case '^':
            goto LABEL_18;
          case ']':
            v11[2] = v16;
LABEL_49:
            int v24 = *a7 + 1;
            goto LABEL_76;
          case '_':
            LODWORD(v16) = v16 - *(unsigned __int16 *)(v21 + 2 * v8 + 2);
            if ((int)v16 < 0)
            {
              LODWORD(v16) = 0;
              int v59 = 0;
            }
            int v24 = v8 + 2;
            goto LABEL_76;
            if (v16) {
              goto LABEL_54;
            }
            goto LABEL_55;
          default:
            if (v22 == 126)
            {
              if (v16 != v20) {
LABEL_54:
              }
                int v59 = 0;
LABEL_55:
              int v24 = v8 + 1;
              goto LABEL_76;
            }
LABEL_18:
            if (!_lou_handlePassVariableTest(v21, a7, &v59)) {
              return 0;
            }
            break;
        }
      }
      else
      {
        switch(*(_WORD *)(*a6 + 2 * v8))
        {
          case ' ':
            *a7 = v8 + 1;
            v11[3] = v16;
            if (v11[1] == -1)
            {
              v11[1] = *v11;
              v11[2] = v16;
            }
            return 1;
          case '!':
            BOOL v18 = !v18;
            *a7 = ++v8;
            continue;
          case '""':
            goto LABEL_10;
          case '#':
            goto LABEL_18;
          case '$':
            uint64_t v56 = v19;
            uint64_t v57 = v14;
            uint64_t v28 = (unsigned __int16 *)(v21 + 2 * v8);
            unint64_t v29 = v28[4] | ((((unint64_t)v28[1] << 32) | ((unint64_t)v28[2] << 16) | v28[3]) << 16);
            if (v28[5])
            {
              uint64_t v30 = v17;
              uint64_t v55 = v11;
              unsigned int v31 = 0;
              uint64_t v32 = (int)v16;
              do
              {
                uint64_t v17 = v30;
                if (v32 >= *(int *)(a3 + 16)
                  || ((int v33 = *(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v32), a4 != 75)
                    ? (long long v34 = sub_112D0(v33, v30))
                    : (long long v34 = sub_1076C(v33, v30)),
                      (v34[3] & v29) == 0))
                {
                  LODWORD(v16) = v16 + v31;
                  int v59 = 0;
                  size_t v11 = v55;
                  goto LABEL_75;
                }
                ++v32;
                ++v31;
                uint64_t v21 = *a6;
                int v8 = *a7;
                unsigned int v35 = *(unsigned __int16 *)(*a6 + 2 * (*a7 + 5));
              }
              while (v31 < v35);
              LODWORD(v16) = v16 + v31;
              if (!v59)
              {
                size_t v11 = v55;
                goto LABEL_74;
              }
              size_t v11 = v55;
            }
            else
            {
              uint64_t v30 = v17;
              unsigned int v35 = 0;
            }
            if (v35 < *(unsigned __int16 *)(v21 + 2 * (v8 + 6)))
            {
              uint64_t v16 = (int)v16;
              do
              {
                if (v16 >= *(int *)(a3 + 16)) {
                  break;
                }
                int v52 = *(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v16);
                int v53 = a4 == 75 ? sub_1076C(v52, v30) : sub_112D0(v52, v30);
                if ((v53[3] & v29) == 0) {
                  break;
                }
                ++v16;
                ++v35;
              }
              while (v35 < *(unsigned __int16 *)(*a6 + 2 * *a7 + 12));
            }
LABEL_74:
            uint64_t v17 = v30;
LABEL_75:
            int v24 = *a7 + 7;
            uint64_t v19 = v56;
            uint64_t v14 = v57;
            break;
          case '%':
            int v36 = 0;
            uint64_t v37 = v21 + 2 * v8;
            uint64_t v38 = *(unsigned __int16 *)(v37 + 4);
            unint64_t v39 = (8 * v38) | ((unint64_t)*(unsigned __int16 *)(v37 + 2) << 19);
            uint64_t v40 = *(__int16 *)(v17 + v39 + 31666);
            uint64_t v41 = (int)v16;
            do
            {
              if ((int)v40 < 1)
              {
                LODWORD(v42) = 0;
              }
              else
              {
                uint64_t v42 = 0;
                while (*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v41) != *(unsigned __int16 *)(v19 + v39 + 2 * v42))
                {
                  if (v40 == ++v42) {
                    goto LABEL_56;
                  }
                }
              }
              if (v42 == v40)
              {
LABEL_56:
                int v50 = 0;
                goto LABEL_57;
              }
              ++v41;
              ++v36;
            }
            while (v36 != 40);
            uint64_t v43 = v21 + 2 * v8;
            if (v38 == *(unsigned __int16 *)(v43 + 6) || (unsigned int v44 = *(unsigned __int16 *)(v43 + 8), v44 < 0x29))
            {
              int v50 = 1;
              LODWORD(v16) = v16 + 40;
            }
            else
            {
              uint64_t v16 = (int)v16 + 40;
              long long v45 = (unsigned __int16 *)(v19 + v39);
              int v46 = 40;
              while ((int)v40 < 1)
              {
LABEL_46:
                ++v16;
                if (++v46 == v44) {
                  goto LABEL_47;
                }
              }
              uint64_t v47 = v45;
              uint64_t v48 = v40;
              while (1)
              {
                int v49 = *v47++;
                if (*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v16) != v49) {
                  break;
                }
                if (!--v48) {
                  goto LABEL_46;
                }
              }
LABEL_47:
              int v50 = 1;
            }
LABEL_57:
            int v59 = v50;
            int v24 = v8 + 5;
            break;
          default:
            if (v22 != 64) {
              goto LABEL_18;
            }
LABEL_10:
            int v23 = *(unsigned __int16 *)(v21 + 2 * v8 + 2);
            if (!*(_WORD *)(v21 + 2 * v8 + 2))
            {
              int v24 = v8 + v23 + 2;
LABEL_59:
              int v51 = 1;
              goto LABEL_61;
            }
            LODWORD(v25) = v8 + 2;
            int v24 = v8 + 2 + v23;
            uint64_t v25 = (int)v25;
            uint64_t v26 = (unsigned __int16 *)(*(void *)(a3 + 8) + 2 * (int)v16);
            while (1)
            {
              int v27 = *v26++;
              if (*(unsigned __int16 *)(v21 + 2 * v25) != v27) {
                break;
              }
              if (++v25 >= v24) {
                goto LABEL_59;
              }
            }
            int v51 = 0;
LABEL_61:
            int v59 = v51;
            LODWORD(v16) = v16 + v23;
            break;
        }
LABEL_76:
        *a7 = v24;
      }
      if (!v18 != (v59 != 0)) {
        return 0;
      }
      BOOL v18 = 0;
      int v8 = *a7;
      LOWORD(v9) = *(_WORD *)(v14 + 52);
    }
    while (v8 < (__int16)v9);
    return 1;
  }
  return v10;
}

uint64_t sub_10E7C(uint64_t a1, _DWORD *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, _DWORD *a8, unsigned int *a9, int a10, uint64_t a11, uint64_t a12, int a13, unint64_t a14, uint64_t a15)
{
  uint64_t v15 = a8;
  uint64_t v16 = a7;
  uint64_t v17 = a6;
  uint64_t v19 = a4;
  char v20 = a3;
  int v22 = a13;
  uint64_t v23 = a14;
  unint64_t v24 = HIDWORD(a14);
  int v61 = *(_DWORD *)(a5 + 20);
  uint64_t result = sub_11334(a14, SHIDWORD(a14), a1, a3, a4, a5, a6, a7, a8, a9, a10);
  if (result)
  {
    int v60 = *(_DWORD *)(a5 + 20);
    uint64_t v63 = a15;
    if ((int)v24 < (int)a15)
    {
      uint64_t v26 = (_DWORD *)(v17 + 4 * (v23 >> 32));
      uint64_t v27 = (int)a15 - (v23 >> 32);
      do
      {
        *v26++ = *(_DWORD *)(a5 + 20);
        --v27;
      }
      while (v27);
    }
    if (*(__int16 *)(a11 + 52) > v22)
    {
      uint64_t v55 = v23 >> 32;
      uint64_t v54 = a1 + 31616;
      int v59 = v63;
      uint64_t v28 = a11;
      int v53 = v16;
      uint64_t v56 = v17;
      uint64_t v58 = v19;
      char v57 = v20;
      while (1)
      {
        unsigned int v29 = *(unsigned __int16 *)(a12 + 2 * v22);
        if (v29 <= 0x29)
        {
          if (v29 == 34) {
            goto LABEL_38;
          }
          if (v29 != 37)
          {
LABEL_46:
            uint64_t result = _lou_handlePassVariableAction(a12, &a13);
            if (!result) {
              return result;
            }
            int v22 = a13;
            goto LABEL_52;
          }
          LODWORD(v30) = v24;
          if ((int)v24 < (int)v63)
          {
            int v31 = 0;
            uint64_t v32 = 0;
            unint64_t v33 = (8 * *(unsigned __int16 *)(a12 + 2 * v22 + 4)) | ((unint64_t)*(unsigned __int16 *)(a12 + 2 * v22 + 2) << 19);
            unint64_t v34 = v54 + v33;
            __int16 v35 = *(_WORD *)(v54 + v33 + 50);
            uint64_t v36 = v54 + v33 + 2 * v35 + 54;
            uint64_t v30 = v55;
            unint64_t v37 = a1 + 31670 + v33;
            while (1)
            {
              uint64_t v38 = v35;
              if ((int)v38 < 1)
              {
                LODWORD(v39) = 0;
              }
              else
              {
                uint64_t v39 = 0;
                while (*(unsigned __int16 *)(*(void *)(v58 + 8) + 2 * v30) != *(unsigned __int16 *)(v37 + 2 * v39))
                {
                  if (v38 == ++v39) {
                    goto LABEL_49;
                  }
                }
              }
              if (v39 == v38) {
                break;
              }
              if ((int)v39 >= v31) {
                uint64_t v40 = v32;
              }
              else {
                uint64_t v40 = 0;
              }
              int v41 = *(__int16 *)(v34 + 52);
              if ((int)v40 < v41)
              {
                if ((int)v39 >= v31) {
                  int v42 = v31;
                }
                else {
                  int v42 = 0;
                }
                int v43 = v42 - 1;
                while (v39 != ++v43)
                {
                  v40 += *(unsigned __int16 *)(v36 + 2 * v40);
                  if ((int)v40 >= v41) {
                    goto LABEL_36;
                  }
                }
                int v52 = a2;
                unsigned int v44 = v15;
                uint64_t v45 = *(unsigned __int16 *)(v36 + 2 * v40) - 1;
                int v46 = *(_DWORD *)(a5 + 20);
                if ((int)v45 + v46 >= *(_DWORD *)(a5 + 16)) {
                  return 0;
                }
                *(_DWORD *)(v56 + 4 * v30) = v46;
                memcpy((void *)(*(void *)(a5 + 8) + 2 * *(int *)(a5 + 20)), (const void *)(v36 + 2 * v40 + 2), 2 * v45);
                *(_DWORD *)(a5 + 20) += v45;
                uint64_t v32 = v40;
                int v31 = v39;
                uint64_t v15 = v44;
                a2 = v52;
              }
LABEL_36:
              if (++v30 == v63)
              {
                LODWORD(v30) = v63;
                break;
              }
              __int16 v35 = *(_WORD *)(v34 + 50);
            }
LABEL_49:
            uint64_t v16 = v53;
            uint64_t v17 = v56;
            uint64_t v19 = v58;
            uint64_t v28 = a11;
          }
          if (!v30) {
            return 0;
          }
          int v22 = a13 + 3;
          a13 += 3;
          char v20 = v57;
        }
        else
        {
          if (v29 != 42)
          {
            if (v29 == 63)
            {
              ++v22;
            }
            else
            {
              if (v29 != 64) {
                goto LABEL_46;
              }
LABEL_38:
              uint64_t v47 = a12 + 2 * v22;
              uint64_t v48 = *(unsigned __int16 *)(v47 + 2);
              uint64_t v49 = *(int *)(a5 + 20);
              if ((int)v49 + (int)v48 > *(_DWORD *)(a5 + 16)) {
                return 0;
              }
              memcpy((void *)(*(void *)(a5 + 8) + 2 * v49), (const void *)(v47 + 4), 2 * v48);
              int v50 = a13;
              int v51 = *(unsigned __int16 *)(a12 + 2 * (a13 + 1));
              *(_DWORD *)(a5 + 20) += v51;
              int v22 = v50 + v51 + 2;
            }
            a13 = v22;
            goto LABEL_52;
          }
          if (v60 - v61 >= 1)
          {
            memmove((void *)(*(void *)(a5 + 8) + 2 * v61), (const void *)(*(void *)(a5 + 8) + 2 * v60), 2 * (v60 - v61));
            *(_DWORD *)(a5 + 20) -= v60 - v61;
            int v60 = v61;
          }
          uint64_t v28 = a11;
          uint64_t result = sub_11334(v24, v63, a1, v20, v19, a5, v17, v16, v15, a9, a10);
          if (!result) {
            return result;
          }
          int v22 = ++a13;
          int v59 = HIDWORD(v63);
        }
LABEL_52:
        if (v22 >= *(__int16 *)(v28 + 52)) {
          goto LABEL_55;
        }
      }
    }
    int v59 = v63;
LABEL_55:
    *a2 = v59;
    return 1;
  }
  return result;
}

void *sub_112D0(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 18100);
  if (v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      if (*(unsigned __int16 *)(a2 + 8 * v4 + 31660) == a1) {
        break;
      }
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!v4) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t result = &unk_24FC8;
    word_24FF4 = a1;
  }
  return result;
}

uint64_t sub_11334(int a1, int a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, unsigned int *a10, int a11)
{
  int v14 = a1;
  if (a11 != 74)
  {
    if (a2 > a1)
    {
      int v20 = *(_DWORD *)(a6 + 20);
      if (a2 - a1 + v20 > *(_DWORD *)(a6 + 16)) {
        return 0;
      }
      uint64_t v21 = *(void *)(a6 + 8);
      int v22 = (_DWORD *)(a7 + 4 * a1);
      uint64_t v23 = (__int16 *)(*(void *)(a5 + 8) + 2 * a1);
      uint64_t v24 = a2 - (uint64_t)a1;
      do
      {
        *v22++ = v20;
        __int16 v25 = *v23++;
        uint64_t v26 = *(int *)(a6 + 20);
        *(_WORD *)(v21 + 2 * v26) = v25;
        int v20 = v26 + 1;
        *(_DWORD *)(a6 + 20) = v26 + 1;
        --v24;
      }
      while (v24);
    }
    return 1;
  }
  if (a2 <= a1) {
    return 1;
  }
  for (uint64_t i = 2 * a1; ; i += 2)
  {
    uint64_t result = sub_11458(*(unsigned __int16 *)(*(void *)(a5 + 8) + i), a3, v14, a4, a5, a6, a7, a8, a9, a10);
    if (!result) {
      break;
    }
    if (a2 == ++v14) {
      return 1;
    }
  }
  return result;
}

uint64_t sub_11458(unsigned int a1, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, unsigned int *a10)
{
  uint64_t v18 = *((unsigned int *)sub_112D0(a1, a2) + 4);
  if (v18) {
    return sub_1154C((unsigned __int16 *)(a2 + 8 * v18 + 31670), *(__int16 *)(a2 + 8 * v18 + 31668), *(__int16 *)(a2 + 8 * v18 + 31666), a2, a3, a5, a6, a7, a8, a9, a10);
  }

  return sub_11758(a1, a4, a6, a3, a7);
}

uint64_t sub_1154C(unsigned __int16 *a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, _DWORD *a10, unsigned int *a11)
{
  int v11 = *(_DWORD *)(a7 + 20);
  if (v11 + a3 > *(_DWORD *)(a7 + 16) || a5 + a2 > *(_DWORD *)(a6 + 16)) {
    return 0;
  }
  if (!*a10 && *a9 >= a5 && *a9 < a5 + a2)
  {
    if (a3 >= 0) {
      int v17 = a3;
    }
    else {
      int v17 = a3 + 1;
    }
    *a9 = v11 + (v17 >> 1);
    *a10 = 1;
  }
  if (a2 >= 1)
  {
    uint64_t v18 = a2;
    uint64_t v19 = (_DWORD *)(a8 + 4 * a5);
    do
    {
      *v19++ = *(_DWORD *)(a7 + 20);
      --v18;
    }
    while (v18);
  }
  if (!a3) {
    return 0;
  }
  int v20 = *(_DWORD *)(a7 + 20);
  if (v20 + a3 > *(_DWORD *)(a7 + 16)) {
    return 0;
  }
  unsigned int v22 = *a11;
  if (*a11)
  {
    uint64_t v23 = sub_1076C(*a1, a4);
    uint64_t v24 = *((unsigned int *)v23 + 12);
    if (v24) {
      uint64_t v25 = a4 + 8 * v24 + 31616;
    }
    else {
      uint64_t v25 = (uint64_t)v23;
    }
    while (1)
    {
      uint64_t v26 = *(unsigned int *)(v25 + 52);
      if (!v26) {
        break;
      }
      uint64_t v27 = a4 + 8 * v26;
      uint64_t v25 = v27 + 31616;
      if (((v23[4] | 0x10) & ~*(void *)(v27 + 31648)) == 0) {
        goto LABEL_27;
      }
    }
    uint64_t v25 = (uint64_t)v23;
LABEL_27:
    __int16 v28 = *(_WORD *)(v25 + 44);
    uint64_t v29 = *(void *)(a7 + 8);
    uint64_t v30 = *(int *)(a7 + 20);
    int v20 = v30 + 1;
    *(_DWORD *)(a7 + 20) = v30 + 1;
    *(_WORD *)(v29 + 2 * v30) = v28;
    *a11 = 0;
    unsigned int v22 = 1;
  }
  if (a11[1] || a11[2])
  {
    if (a3 > (int)v22)
    {
      uint64_t v31 = v22;
      do
      {
        uint64_t v32 = sub_1076C(a1[v31], a4);
        uint64_t v33 = *((unsigned int *)v32 + 12);
        if (v33) {
          uint64_t v34 = a4 + 8 * v33 + 31616;
        }
        else {
          uint64_t v34 = (uint64_t)v32;
        }
        while (1)
        {
          uint64_t v35 = *(unsigned int *)(v34 + 52);
          if (!v35) {
            break;
          }
          uint64_t v36 = a4 + 8 * v35;
          uint64_t v34 = v36 + 31616;
          if (((v32[4] | 0x10) & ~*(void *)(v36 + 31648)) == 0) {
            goto LABEL_39;
          }
        }
        uint64_t v34 = (uint64_t)v32;
LABEL_39:
        __int16 v37 = *(_WORD *)(v34 + 44);
        uint64_t v38 = *(void *)(a7 + 8);
        uint64_t v39 = *(int *)(a7 + 20);
        *(_DWORD *)(a7 + 20) = v39 + 1;
        *(_WORD *)(v38 + 2 * v39) = v37;
        ++v31;
      }
      while (v31 != a3);
    }
  }
  else
  {
    uint64_t v40 = &a1[v22];
    unsigned int v41 = a3 - v22;
    memcpy((void *)(*(void *)(a7 + 8) + 2 * v20), v40, 2 * (int)(a3 - v22));
    *(_DWORD *)(a7 + 20) += v41;
  }
  return 1;
}

uint64_t sub_11758(unsigned int a1, char a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_DWORD *)(a5 + 4 * a4) = *(_DWORD *)(a3 + 20);
  if ((a2 & 0x80) == 0)
  {
    uint64_t v6 = _lou_unknownDots(a1);
    size_t v7 = strlen(v6);
    uint64_t v8 = *(int *)(a3 + 20);
    if (v7 + v8 > *(int *)(a3 + 16)) {
      return 0;
    }
    if (v7)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)(a3 + 8) + 2 * v8;
      int v12 = v8 + 1;
      do
      {
        __int16 v13 = v6[v10];
        *(_DWORD *)(a3 + 20) = v12 + v10;
        *(_WORD *)(v11 + 2 * v10++) = v13;
      }
      while (v7 > v10);
    }
  }
  return 1;
}

uint64_t sub_117DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, _DWORD *a8, unsigned int *a9)
{
  unsigned __int16 v12 = 32;
  uint64_t result = sub_1154C(&v12, 1, 1, a1, a2, a3, a4, a6, a7, a8, a9);
  if (result)
  {
    if (a5) {
      *(unsigned char *)(*(int *)(a4 + 20) + a5 - 1) = 49;
    }
    return 1;
  }
  return result;
}

uint64_t sub_11860(unsigned int *a1, _DWORD *a2, _DWORD *a3, uint64_t a4, _DWORD *a5, uint64_t a6)
{
  if (*a5)
  {
    uint64_t v6 = 0;
    unsigned int v7 = *(unsigned __int16 *)(a6 + 2 * (*(__int16 *)(a6 + 50) - *a5) + 54);
    if (v7 <= 0x16)
    {
      if (*(unsigned __int16 *)(a6 + 2 * (*(__int16 *)(a6 + 50) - *a5) + 54) > 4u)
      {
        if (v7 == 5)
        {
          uint64_t v6 = a1[587];
          if (!v6) {
            goto LABEL_27;
          }
        }
        else
        {
          if (v7 != 19) {
            goto LABEL_27;
          }
          uint64_t v6 = a1[240];
          if (!v6) {
            goto LABEL_27;
          }
        }
      }
      else if (v7 == 3)
      {
        uint64_t v6 = a1[585];
        if (!v6) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v7 != 4) {
          goto LABEL_27;
        }
        uint64_t v6 = a1[586];
        if (!v6) {
          goto LABEL_27;
        }
      }
    }
    else if (*(unsigned __int16 *)(a6 + 2 * (*(__int16 *)(a6 + 50) - *a5) + 54) <= 0x2Cu)
    {
      if (v7 == 23)
      {
        uint64_t v6 = a1[241];
        if (!v6) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v7 != 24) {
          goto LABEL_27;
        }
        uint64_t v6 = a1[243];
        if (!v6) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      switch(v7)
      {
        case '-':
          uint64_t v6 = a1[634];
          if (!v6) {
            goto LABEL_27;
          }
          break;
        case '.':
          uint64_t v6 = a1[635];
          if (!v6)
          {
LABEL_27:
            --*a5;
            return v6;
          }
          break;
        case '/':
          uint64_t v6 = a1[242];
          if (!v6) {
            goto LABEL_27;
          }
          break;
        default:
          goto LABEL_27;
      }
    }
    uint64_t v8 = (uint64_t)&a1[2 * v6 + 7904];
    *(void *)a4 = v8;
    *a3 = *(_DWORD *)(v8 + 44);
    *a2 = *(__int16 *)(*(void *)a4 + 52);
    uint64_t v6 = 1;
    goto LABEL_27;
  }
  return 0;
}

uint64_t sub_11988(uint64_t a1, int a2, __int16 a3, uint64_t a4, int a5)
{
  if ((a3 & 0x100) != 0) {
    return 0;
  }
  if (a5 + a2 >= *(_DWORD *)(a4 + 16)) {
    return 1;
  }
  uint64_t v7 = a5 + a2;
  do
  {
    uint64_t v8 = sub_112D0(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v7), a1);
    uint64_t v9 = v8[3];
    if (v9) {
      return 1;
    }
    if ((v9 & 2) != 0) {
      return 0;
    }
    uint64_t v10 = *((unsigned int *)v8 + 5);
    if (!v10) {
      goto LABEL_18;
    }
    int v11 = 0;
    int v12 = 0;
    do
    {
      uint64_t v13 = a1 + 8 * v10 + 31616;
      int v14 = *(_DWORD *)(v13 + 44);
      if (*(__int16 *)(v13 + 50) >= 2)
      {
        if (v14 == 99 || v14 == 101) {
          goto LABEL_13;
        }
        int v11 = 1;
      }
      if (v14 == 110) {
        return 1;
      }
LABEL_13:
      if (v14 == 105) {
        int v12 = 1;
      }
      uint64_t v10 = *(unsigned int *)(v13 + 20);
    }
    while (v10);
    if (v11 && !v12) {
      return 0;
    }
LABEL_18:
    ++v7;
    uint64_t result = 1;
  }
  while (v7 < *(int *)(a4 + 16));
  return result;
}

_WORD *lou_translateString(char *a1, unsigned __int16 *a2, int *a3, unsigned __int16 *a4, int *a5, __int16 *a6, unsigned char *a7, int a8)
{
  return _lou_translate(a1, a1, a2, a3, a4, a5, a6, a7, 0, 0, 0, a8, 0, 0);
}

_WORD *lou_translate(char *a1, unsigned __int16 *a2, int *a3, unsigned __int16 *a4, int *a5, __int16 *a6, unsigned char *a7, void *__b, uint64_t a9, unsigned int *a10, int a11)
{
  return _lou_translate(a1, a1, a2, a3, a4, a5, a6, a7, __b, a9, a10, a11, 0, 0);
}

_WORD *_lou_translate(char *a1, const char *a2, unsigned __int16 *a3, int *a4, unsigned __int16 *a5, int *a6, __int16 *a7, unsigned char *a8, void *__b, uint64_t a10, unsigned int *a11, int a12, uint64_t a13, int *a14)
{
  uint64_t result = 0;
  if (!a1) {
    return result;
  }
  if (!a3) {
    return result;
  }
  int v17 = a4;
  if (!a4) {
    return result;
  }
  if (!a5) {
    return result;
  }
  uint64_t v19 = a6;
  if (!a6) {
    return result;
  }
  char v22 = a12;
  _lou_logMessage(0, "Performing translation: tableList=%s, inlen=%d", a1, *a4);
  _lou_logWidecharBuf(0, "Inbuf=", a3, *v17);
  if (!_lou_isValidMode(a12)) {
    _lou_logMessage(40000, "Invalid mode parameter: %d", a12);
  }
  uint64_t v156 = 0;
  int v157 = 0;
  int v154 = 0;
  uint64_t v155 = 0;
  if (a2) {
    uint64_t v23 = a2;
  }
  else {
    uint64_t v23 = a1;
  }
  uint64_t v153 = 0;
  uint64_t v141 = v23;
  _lou_getTable(a1, v23, (uint64_t *)&v157, &v156);
  if (!v157) {
    return 0;
  }
  uint64_t v24 = *v17;
  if ((v24 & 0x80000000) != 0) {
    return 0;
  }
  int v25 = *v19;
  if (*v19 < 0) {
    return 0;
  }
  if (v24)
  {
    uint64_t v26 = 0;
    while (a3[v26])
    {
      if (v24 == ++v26)
      {
        LODWORD(v26) = *v17;
        break;
      }
    }
  }
  else
  {
    LODWORD(v26) = 0;
  }
  LODWORD(v153) = -1;
  int v154 = a3;
  LODWORD(v155) = v26;
  uint64_t result = _lou_allocMem(0, 0, v26, v25);
  if (!result) {
    return result;
  }
  uint64_t v27 = v155;
  __dst = result;
  if (!a7)
  {
    bzero(result, 2 * (int)v155);
    goto LABEL_29;
  }
  if ((int)v155 < 1)
  {
LABEL_29:
    int v28 = 0;
    goto LABEL_30;
  }
  int v28 = 0;
  uint64_t v29 = a7;
  uint64_t v30 = result;
  do
  {
    __int16 v31 = *v29++;
    *v30++ = v31;
    if ((v31 & 0x3FFF) != 0) {
      int v28 = 1;
    }
    --v27;
  }
  while (v27);
LABEL_30:
  uint64_t v32 = (int *)a11;
  if (!a8 || *a8 == 88) {
    a8 = 0;
  }
  if (__b && (int)v155 >= 1)
  {
    int v33 = v28;
    memset(__b, 255, 4 * v155);
    int v28 = v33;
    uint64_t v32 = (int *)a11;
  }
  int v131 = v32;
  int v136 = v28;
  if (!v32 || (uint64_t v34 = *v32, (v34 & 0x80000000) != 0))
  {
    LODWORD(v34) = -1;
    int v149 = -1;
    int v148 = 1;
LABEL_52:
    int v135 = -1;
    goto LABEL_53;
  }
  int v148 = 0;
  int v149 = v34;
  if ((a12 & 0x22) == 0)
  {
    LODWORD(v34) = -1;
    goto LABEL_52;
  }
  if (*((unsigned char *)sub_16DC8(v154[v34], (uint64_t)v157) + 24))
  {
    int v135 = v34;
    LODWORD(v34) = v34 + 1;
  }
  else
  {
    uint64_t v35 = v34;
    while ((*((unsigned char *)sub_16DC8(v154[v35], (uint64_t)v157) + 24) & 1) == 0)
    {
      if (v35-- <= 0)
      {
        LODWORD(v35) = -1;
        break;
      }
    }
    int v135 = v35 + 1;
    if ((a12 & 0x20) == 0 && (int)v34 < (int)v155)
    {
      uint64_t v34 = (int)v34;
      do
      {
        if (*((unsigned char *)sub_16DC8(v154[v34], (uint64_t)v157) + 24)) {
          break;
        }
        ++v34;
      }
      while (v34 < (int)v155);
    }
  }
LABEL_53:
  uint64_t result = _lou_allocMem(5, 0, v155, *v19);
  if (!result) {
    return result;
  }
  __int16 v37 = (char *)result;
  if ((int)v157[233] > 1 || v157[234])
  {
    uint64_t result = _lou_allocMem(6, 0, v155, *v19);
    uint64_t v142 = (char *)result;
    if (!result) {
      return result;
    }
    uint64_t result = _lou_allocMem(7, 0, v155, *v19);
    uint64_t v139 = result;
    if (!result) {
      return result;
    }
    int v132 = v34;
  }
  else
  {
    int v132 = v34;
    uint64_t v139 = 0;
    uint64_t v142 = 0;
  }
  uint64_t v38 = a14;
  if (a8)
  {
    uint64_t v39 = _lou_allocMem(3, 0, v155, *v19);
    if (v39)
    {
      __src = v39;
      memset(v39, 42, *v19);
    }
    else
    {
      __src = 0;
    }
    uint64_t v38 = a14;
  }
  else
  {
    __src = 0;
  }
  int v40 = 0;
  uint64_t v41 = 0;
  dword_29E48 = 0;
  if (a13 && v38)
  {
    int v40 = *v38;
    uint64_t v41 = a13;
  }
  qword_29E50 = v41;
  dword_29E58 = v40;
  if (!qword_29E60)
  {
    int v42 = malloc_type_malloc(0x28uLL, 0x109004028638895uLL);
    *(_DWORD *)int v42 = 3;
    v42[1] = &unk_29E68;
    v42[2] = &unk_29E80;
    v42[3] = sub_17188;
    v42[4] = 0;
    qword_29E60 = (uint64_t)v42;
LABEL_75:
    uint64_t v43 = 0;
    do
    {
      sub_12AD8(v43);
      uint64_t v43 = (v43 + 1);
    }
    while ((int)v43 < *(_DWORD *)qword_29E60);
    goto LABEL_77;
  }
  if (*(int *)qword_29E60 >= 1) {
    goto LABEL_75;
  }
LABEL_77:
  uint64_t v150 = 0;
  uint64_t v151 = 0;
  uint64_t v152 = 0;
  int v44 = sub_12B40(*v19);
  uint64_t v45 = *(unsigned __int16 **)(*(void *)(qword_29E60 + 8) + 8 * v44);
  uint64_t v46 = v157[234] == 0;
  unsigned int v47 = *v19;
  LODWORD(v150) = v44;
  uint64_t v151 = v45;
  uint64_t v152 = v47;
  uint64_t v48 = v37;
  int v134 = v19;
  int v137 = v17;
  uint64_t v138 = a8;
  uint64_t v144 = v37;
  while (1)
  {
    int v147 = 0;
    uint64_t v145 = v46;
    uint64_t v146 = (uint64_t)v48;
    if (v46 == 1)
    {
      BOOL v72 = _lou_allocMem(1, 0, v155, v47);
      if (v72)
      {
        uint64_t v73 = (uint64_t)v72;
        uint64_t v74 = _lou_allocMem(2, 0, v155, *v19);
        if (v74)
        {
          sub_12BC4(v157, v22, (uint64_t)&v153, (uint64_t)&v150, v146, (uint64_t)__dst, (uint64_t)a8, (uint64_t)__src, v73, (uint64_t)v74, v136, &v147, &v149, &v148, v135, v132);
          uint64_t v48 = (char *)v146;
          signed int v51 = v147;
          goto LABEL_183;
        }
      }
      return 0;
    }
    if (!v46)
    {
      uint64_t v49 = v157;
      v167[0] = (uint64_t)&v153;
      if (!v157[234])
      {
        signed int v51 = 0;
        goto LABEL_183;
      }
      uint64_t v165 = 0;
      int v164 = 0;
      uint64_t v163 = 0;
      int v162 = 0;
      unint64_t v160 = 0;
      uint64_t v161 = 0;
      uint64_t v159 = 0;
      int v166 = 0;
      HIDWORD(v152) = 0;
      _lou_resetPassVariables();
      signed int v50 = v155;
      if ((int)v155 < 1)
      {
        int v71 = 0;
        signed int v51 = 0;
        uint64_t v55 = (unsigned int *)&v153;
        char v22 = a12;
LABEL_167:
        uint64_t v92 = malloc_type_malloc(2 * v71, 0x1000040BDFB0063uLL);
        int v93 = v92;
        if (!v92) {
          _lou_outOfMemory();
        }
        if (v71 >= 1)
        {
          uint64_t v94 = v71;
          int v95 = (unsigned int *)v146;
          int v96 = v92;
          do
          {
            unsigned int v98 = *v95++;
            uint64_t v97 = v98;
            __int16 v99 = __dst;
            if ((v98 & 0x80000000) == 0)
            {
              int v100 = v55[4];
              if ((int)v97 >= v100) {
                __int16 v99 = &__dst[v100 - 1];
              }
              else {
                __int16 v99 = &__dst[v97];
              }
            }
            *v96++ = *v99;
            --v94;
          }
          while (v94);
        }
        memcpy(__dst, v92, 2 * v71);
        free(v93);
        goto LABEL_180;
      }
      signed int v51 = 0;
      int v52 = 0;
      uint64_t v53 = 0;
      unsigned __int16 v158 = 0;
      BOOL v54 = 1;
      uint64_t v55 = (unsigned int *)&v153;
      uint64_t v56 = v146;
LABEL_83:
      if (v54)
      {
        uint64_t v57 = v49[5648];
        if (v57)
        {
          while (1)
          {
            uint64_t v58 = (uint64_t)&v49[2 * v57 + 7904];
            int v59 = v49[2 * v57 + 7915];
            if (sub_17248((uint64_t)v49, v51, (uint64_t)v55, v59, v58, &v164, &v163, &v162, (signed int *)&v160, (unint64_t *)&v159, &v158))break; {
            uint64_t v57 = *(unsigned int *)(v58 + 16);
            }
            if (!v57) {
              goto LABEL_87;
            }
          }
          uint64_t v53 = v58;
          int v52 = v59;
          uint64_t v56 = v146;
LABEL_112:
          uint64_t v165 = v53;
          if (v52 == 75)
          {
            char v22 = a12;
            __int16 v37 = v144;
            goto LABEL_116;
          }
          if (v52 != 83)
          {
            BOOL v54 = 1;
            goto LABEL_126;
          }
LABEL_124:
          if (SHIDWORD(v152) < (int)v152)
          {
            *(_DWORD *)(v56 + 4 * SHIDWORD(v152)) = v51;
            unsigned __int16 v69 = *(_WORD *)(*((void *)v55 + 1) + 2 * v51);
            int v166 = v51 + 1;
            uint64_t v70 = SHIDWORD(v152);
            ++HIDWORD(v152);
            v151[v70] = v69;
            BOOL v54 = 1;
            int v52 = 83;
            ++v51;
            goto LABEL_126;
          }
          uint64_t v19 = v134;
          char v22 = a12;
          __int16 v37 = v144;
LABEL_180:
          int v147 = v51;
          uint64_t v101 = *v55;
          if (v101 != v153) {
            sub_12AD8(v101);
          }
          int v17 = v137;
          a8 = v138;
          uint64_t v48 = (char *)v146;
          goto LABEL_183;
        }
LABEL_87:
        uint64_t v165 = v53;
        uint64_t v56 = v146;
      }
      int v60 = 0;
      int v61 = v50 - v51;
      while (1)
      {
        if (v60)
        {
          if (v60 != 1)
          {
            if (v60 == 2)
            {
              uint64_t v165 = v53;
              goto LABEL_124;
            }
            goto LABEL_108;
          }
          if (v61 < 1) {
            goto LABEL_108;
          }
          int v62 = (unsigned int *)((char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v55 + 1) + 2 * v51), (uint64_t)v49)+ 20);
          int v61 = 1;
        }
        else
        {
          if (v61 < 2) {
            goto LABEL_108;
          }
          int v62 = &v49[_lou_stringHash((unsigned __int16 *)(*((void *)v55 + 1) + 2 * v51), 1, (uint64_t)v49) + 5658];
        }
        uint64_t v63 = *v62;
        if (v63)
        {
          while (1)
          {
            uint64_t v53 = (uint64_t)&v49[2 * v63 + 7904];
            int v52 = v49[2 * v63 + 7915];
            if (v60 != 1) {
              break;
            }
            if (v54) {
              goto LABEL_104;
            }
LABEL_106:
            uint64_t v63 = *(unsigned int *)(v53 + 16);
            if (!v63) {
              goto LABEL_107;
            }
          }
          int v64 = SHIWORD(v49[2 * v63 + 7916]);
          if (v61 < v64) {
            goto LABEL_106;
          }
          int v65 = sub_1719C((unsigned __int16 *)&v49[2 * v63 + 7917] + 1, (unsigned __int16 *)(*((void *)v55 + 1) + 2 * v51), v64, (uint64_t)v49);
          if (!v54 || !v65) {
            goto LABEL_106;
          }
LABEL_104:
          if (v52 != 75
            || !sub_17248((uint64_t)v49, v51, (uint64_t)v55, 75, v53, &v164, &v163, &v162, (signed int *)&v160, (unint64_t *)&v159, &v158))
          {
            goto LABEL_106;
          }
          uint64_t v165 = v53;
          char v22 = a12;
          __int16 v37 = v144;
          uint64_t v56 = v146;
LABEL_116:
          if (qword_29E50)
          {
            uint64_t v66 = dword_29E48;
            if (dword_29E48 < dword_29E58)
            {
              ++dword_29E48;
              *(void *)(qword_29E50 + 8 * v66) = v53;
            }
          }
          if (!sub_17E1C((uint64_t)v49, v167, (uint64_t)&v150, v56, 75, (uint64_t)&v165, v164, v163, v162, &v166, v160, v161, SHIDWORD(v161), &v149, &v148, v159, v158, v130))
          {
            signed int v51 = v166;
            uint64_t v55 = (unsigned int *)v167[0];
            uint64_t v19 = v134;
            goto LABEL_180;
          }
          uint64_t v67 = v167[0];
          uint64_t v68 = *v55;
          if (*(_DWORD *)v167[0] != v68 && v68 != v153) {
            sub_12AD8(v68);
          }
          BOOL v54 = v166 != v51;
          int v52 = 75;
          uint64_t v55 = (unsigned int *)v67;
          signed int v51 = v166;
          uint64_t v56 = v146;
LABEL_126:
          signed int v50 = v55[4];
          if (v51 >= v50)
          {
            int v71 = HIDWORD(v152);
            uint64_t v19 = v134;
            char v22 = a12;
            __int16 v37 = v144;
            goto LABEL_167;
          }
          goto LABEL_83;
        }
LABEL_107:
        uint64_t v56 = v146;
LABEL_108:
        if (++v60 == 3) {
          goto LABEL_112;
        }
      }
    }
    int v75 = v157;
    int v76 = (unsigned int *)&v153;
    v167[0] = (uint64_t)&v153;
    uint64_t v165 = 0;
    int v164 = 0;
    uint64_t v163 = 0;
    int v162 = 0;
    unint64_t v160 = 0;
    uint64_t v161 = 0;
    uint64_t v159 = 0;
    unsigned __int16 v158 = 0;
    HIDWORD(v152) = 0;
    int v166 = 0;
    _lou_resetPassVariables();
    signed int v77 = v155;
    if ((int)v155 < 1)
    {
      signed int v51 = 0;
      uint64_t v48 = (char *)v146;
      goto LABEL_158;
    }
    signed int v78 = 0;
    uint64_t v79 = 0;
    uint64_t v80 = &v75[v46 + 5648];
    BOOL v81 = 1;
    uint64_t v48 = (char *)v146;
    while (!v81)
    {
LABEL_138:
      if (SHIDWORD(v152) >= (int)v152) {
        goto LABEL_156;
      }
      *(_DWORD *)&v48[4 * SHIDWORD(v152)] = v78;
      uint64_t v85 = *((void *)v76 + 1);
      signed int v51 = v78 + 1;
      int v166 = v78 + 1;
      LOWORD(v85) = *(_WORD *)(v85 + 2 * v78);
      uint64_t v86 = SHIDWORD(v152);
      ++HIDWORD(v152);
      v151[v86] = v85;
      BOOL v81 = 1;
LABEL_140:
      signed int v78 = v51;
      if (v51 >= (int)v76[4]) {
        goto LABEL_157;
      }
    }
    uint64_t v82 = *v80;
    if (!v82)
    {
LABEL_137:
      uint64_t v165 = v79;
      uint64_t v48 = (char *)v146;
      goto LABEL_138;
    }
    while (1)
    {
      uint64_t v83 = (uint64_t)&v75[2 * v82 + 7904];
      int v84 = v75[2 * v82 + 7915];
      if (sub_17248((uint64_t)v75, v78, (uint64_t)v76, v84, v83, &v164, &v163, &v162, (signed int *)&v160, (unint64_t *)&v159, &v158))break; {
      uint64_t v82 = *(unsigned int *)(v83 + 16);
      }
      if (!v82) {
        goto LABEL_137;
      }
    }
    uint64_t v165 = v83;
    uint64_t v48 = (char *)v146;
    if ((v84 - 76) < 3) {
      goto LABEL_145;
    }
    if (v84 == 83)
    {
      uint64_t v79 = v83;
      goto LABEL_138;
    }
    if (v84 != 74)
    {
LABEL_156:
      signed int v51 = v78;
      goto LABEL_157;
    }
LABEL_145:
    if (qword_29E50)
    {
      uint64_t v87 = dword_29E48;
      if (dword_29E48 < dword_29E58)
      {
        ++dword_29E48;
        *(void *)(qword_29E50 + 8 * v87) = v83;
      }
    }
    if (sub_17E1C((uint64_t)v75, v167, (uint64_t)&v150, v146, v84, (uint64_t)&v165, v164, v163, v162, &v166, v160, v161, SHIDWORD(v161), &v149, &v148, v159, v158, v130))
    {
      uint64_t v88 = v167[0];
      uint64_t v89 = *v76;
      if (*(_DWORD *)v167[0] != v89 && v89 != v153) {
        sub_12AD8(v89);
      }
      signed int v51 = v166;
      BOOL v81 = v166 != v78;
      int v76 = (unsigned int *)v88;
      uint64_t v79 = v83;
      uint64_t v48 = (char *)v146;
      goto LABEL_140;
    }
    signed int v51 = v166;
    int v76 = (unsigned int *)v167[0];
    uint64_t v48 = (char *)v146;
LABEL_157:
    signed int v77 = v76[4];
    uint64_t v19 = v134;
    __int16 v37 = v144;
LABEL_158:
    if (v51 < v77)
    {
      uint64_t v90 = 2 * v51;
      do
      {
        if ((*((unsigned char *)sub_18750(*(unsigned __int16 *)(*((void *)v76 + 1) + v90), (uint64_t)v75) + 24) & 1) == 0) {
          break;
        }
        ++v51;
        v90 += 2;
      }
      while (v51 != v76[4]);
      int v166 = v51;
      uint64_t v48 = (char *)v146;
    }
    int v147 = v51;
    uint64_t v91 = *v76;
    if (v91 != v153)
    {
      sub_12AD8(v91);
      uint64_t v48 = (char *)v146;
    }
    int v17 = v137;
    a8 = v138;
LABEL_183:
    *(_DWORD *)&v48[4 * SHIDWORD(v152)] = v51;
    int v102 = v142;
    if (v48 != v37)
    {
      memcpy(v139, v37, 4 * *v19 + 4);
      if (v152 < 0)
      {
        int v102 = (char *)v146;
      }
      else
      {
        uint64_t v103 = 0;
        uint64_t v104 = 4 * HIDWORD(v152) + 4;
        do
        {
          *(_DWORD *)&v37[v103] = *((_DWORD *)v139
                                  + (*(_DWORD *)(v146 + v103) & ~(*(int *)(v146 + v103) >> 31)));
          v103 += 4;
        }
        while (v104 != v103);
        int v102 = (char *)v146;
      }
    }
    if (v145 >= (int)v157[233]) {
      break;
    }
    uint64_t v46 = v145 + 1;
    sub_12AD8(v153);
    LODWORD(v153) = v150;
    int v154 = v151;
    LODWORD(v155) = HIDWORD(v152);
    int v105 = sub_12B40(*v19);
    int v106 = *(unsigned __int16 **)(*(void *)(qword_29E60 + 8) + 8 * v105);
    unsigned int v47 = *v19;
    LODWORD(v150) = v105;
    uint64_t v151 = v106;
    uint64_t v152 = v47;
    uint64_t v48 = v102;
  }
  LODWORD(v107) = HIDWORD(v152);
  if (SHIDWORD(v152) < 1)
  {
    int *v17 = *(_DWORD *)&v37[4 * SHIDWORD(v152)];
    *uint64_t v19 = v107;
    int v116 = a5;
    uint64_t v117 = __b;
  }
  else
  {
    uint64_t v108 = v151;
    uint64_t v109 = HIDWORD(v152);
    uint64_t v110 = a7;
    int v111 = a7;
    int v112 = a5;
    do
    {
      if (v110)
      {
        if ((*v108 & 0xC0) != 0) {
          __int16 v113 = 56;
        }
        else {
          __int16 v113 = 48;
        }
        *int v111 = v113;
      }
      if ((v22 & 4) != 0)
      {
        unsigned __int16 v115 = *v108 | 0x2800;
        if ((v22 & 0x40) == 0) {
          unsigned __int16 v115 = *v108;
        }
        *int v112 = v115;
      }
      else
      {
        int CharForDots = _lou_getCharForDots(*v108, v156);
        *int v112 = CharForDots;
        if (!CharForDots)
        {
          unsigned int v125 = _lou_showDots((uint64_t)v108, 1);
          _lou_logMessage(40000, "%s: no mapping for dot pattern %s in display table", v141, v125);
          return 0;
        }
      }
      ++v108;
      ++v112;
      ++v111;
      --v109;
      uint64_t v110 = a7;
    }
    while (v109);
    __int16 v37 = v144;
    int v17 = v137;
    a8 = v138;
    *int v137 = *(_DWORD *)&v144[4 * (int)v107];
    uint64_t v19 = v134;
    int *v134 = v107;
    int v116 = a5;
    uint64_t v117 = __b;
    if (a10)
    {
      uint64_t v118 = 0;
      do
      {
        int v119 = *(_DWORD *)&v144[4 * v118];
        if (v119 < 0)
        {
          int v119 = 0;
        }
        else if (v119 >= *v137)
        {
          int v119 = *v137 - 1;
        }
        *(_DWORD *)(a10 + 4 * v118++) = v119;
        uint64_t v107 = *v134;
      }
      while (v118 < v107);
    }
  }
  if (v117)
  {
    if ((int)v107 < 1)
    {
      int v122 = -1;
      int v121 = -1;
    }
    else
    {
      uint64_t v120 = 0;
      int v121 = -1;
      int v122 = -1;
      do
      {
        int v123 = *(_DWORD *)&v37[4 * v120];
        if (v123 > v122)
        {
          int v124 = v121 & ~(v121 >> 31);
          do
          {
            if ((v122 & 0x80000000) == 0 && v122 < *v17)
            {
              v117[v122] = v124;
              int v123 = *(_DWORD *)&v37[4 * v120];
            }
            ++v122;
          }
          while (v122 < v123);
          LODWORD(v107) = *v19;
          int v121 = v120;
        }
        ++v120;
      }
      while (v120 < (int)v107);
    }
    for (uint64_t i = v122 & ~(v122 >> 31); *v17 > (int)i; ++i)
      v117[i] = v121;
  }
  if (__src)
  {
    uint64_t v127 = (int)v155;
    memcpy(a8, __src, (int)v155);
    a8[v127] = 0;
    uint64_t v117 = __b;
  }
  if (v131)
  {
    uint64_t v128 = *v131;
    if (v128 != -1)
    {
      BOOL v129 = &v117[v128];
      if (!v117) {
        BOOL v129 = &v149;
      }
      int *v131 = *v129;
    }
  }
  if (a14) {
    *a14 = dword_29E48;
  }
  _lou_logMessage(0, "Translation complete: outlen=%d", *v19);
  _lou_logWidecharBuf(0, "Outbuf=", v116, *v19);
  return (_WORD *)(&dword_0 + 1);
}

uint64_t sub_12AD8(uint64_t result)
{
  if ((result & 0x80000000) == 0 && *(_DWORD *)qword_29E60 > (int)result)
  {
    uint64_t v1 = *(void *)(qword_29E60 + 16);
    uint64_t v2 = result;
    if (*(_DWORD *)(v1 + 4 * result))
    {
      uint64_t v3 = *(uint64_t (**)(void))(qword_29E60 + 32);
      if (v3)
      {
        uint64_t result = v3(*(void *)(*(void *)(qword_29E60 + 8) + 8 * result));
        uint64_t v1 = *(void *)(qword_29E60 + 16);
      }
    }
    *(_DWORD *)(v1 + 4 * v2) = 0;
  }
  return result;
}

uint64_t sub_12B40(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)qword_29E60;
  if ((int)v1 < 1) {
LABEL_5:
  }
    _lou_outOfMemory();
  uint64_t v2 = 0;
  while (*(_DWORD *)(*(void *)(qword_29E60 + 16) + 4 * v2))
  {
    if (v1 == ++v2) {
      goto LABEL_5;
    }
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(qword_29E60 + 24))(v2, a1);
  uint64_t v4 = qword_29E60;
  *(void *)(*(void *)(qword_29E60 + 8) + 8 * v2) = v3;
  *(_DWORD *)(*(void *)(v4 + 16) + 4 * v2) = 1;
  return v2;
}

uint64_t sub_12BC4(_DWORD *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int *a12, int *a13, _DWORD *a14, int a15, int a16)
{
  uint64_t v16 = (uint64_t)a1;
  v554 = (unsigned int *)a3;
  v552 = 0;
  int v551 = 0;
  uint64_t v550 = 0;
  int v549 = 0;
  unint64_t v547 = 0;
  uint64_t v548 = 0;
  uint64_t v546 = 0;
  unsigned __int16 v545 = 0;
  translation_directioint n = 1;
  if (!a1[235]) {
    goto LABEL_34;
  }
  int v17 = *(_DWORD *)(a3 + 16);
  if (v17 < 1) {
    goto LABEL_34;
  }
  int v18 = 0;
  int v19 = 0;
  uint64_t v20 = 0;
  LOWORD(v21) = 0;
  int v22 = 0;
  while (2)
  {
    int v23 = 0;
    int v24 = v17 - v22;
    uint64_t v25 = v22;
    do
    {
      if (v23)
      {
        if (v23 != 1)
        {
          if (v23 == 2) {
            goto LABEL_32;
          }
          goto LABEL_19;
        }
        if (v24 < 1) {
          goto LABEL_19;
        }
        uint64_t v26 = (unsigned int *)((char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v22), (uint64_t)a1)
                             + 20);
        int v24 = 1;
      }
      else
      {
        if (v24 < 2) {
          goto LABEL_19;
        }
        uint64_t v26 = &a1[_lou_stringHash((unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v22), 1, (uint64_t)a1) + 5658];
      }
      uint64_t v27 = *v26;
      if (v27)
      {
        while (1)
        {
          uint64_t v28 = (uint64_t)&a1[2 * v27 + 7904];
          int v19 = a1[2 * v27 + 7915];
          int v18 = SHIWORD(a1[2 * v27 + 7916]);
          if ((v23 == 1
             || v24 >= v18
             && sub_1719C((unsigned __int16 *)&a1[2 * v27 + 7917] + 1, (unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v22), SHIWORD(a1[2 * v27 + 7916]), (uint64_t)a1))&& v19 == 86)
          {
            break;
          }
          uint64_t v27 = *(unsigned int *)(v28 + 16);
          if (!v27) {
            goto LABEL_19;
          }
        }
        uint64_t v16 = (uint64_t)a1;
LABEL_24:
        int v17 = *(_DWORD *)(a3 + 16);
        if (v18 + v22 > v17) {
          goto LABEL_34;
        }
        int v21 = dword_1CC50[v20];
        uint64_t v20 = ~v20 & 1;
        if (v18 > 0)
        {
          uint64_t v29 = 0;
          do
            *(_WORD *)(a6 + 2 * v22 + 2 * v29++) |= v21;
          while (v18 != v29);
          v22 += v29;
        }
        int v19 = 86;
        goto LABEL_30;
      }
LABEL_19:
      ++v23;
    }
    while (v23 != 3);
    if (v19 != 83)
    {
      uint64_t v16 = (uint64_t)a1;
      if (v19 != 86)
      {
        int v17 = *(_DWORD *)(a3 + 16);
        goto LABEL_30;
      }
      goto LABEL_24;
    }
LABEL_32:
    uint64_t v16 = (uint64_t)a1;
    int v17 = *(_DWORD *)(a3 + 16);
    if (v22 >= v17) {
      break;
    }
    ++v22;
    *(_WORD *)(a6 + 2 * v25) |= v21;
    int v19 = 83;
LABEL_30:
    if (v22 < v17) {
      continue;
    }
    break;
  }
LABEL_34:
  *(_DWORD *)(a4 + 20) = 0;
  int v553 = 0;
  _lou_resetPassVariables();
  uint64_t v31 = a6;
  uint64_t v30 = a3;
  if (*(_DWORD *)(v16 + 2340) && *(int *)(a3 + 16) >= 1)
  {
    uint64_t v32 = 0;
    do
    {
      if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v32), v16) + 24) & 0x10) != 0) {
        *(_WORD *)(a6 + 2 * v32) |= 0x8000u;
      }
      ++v32;
    }
    while (v32 < *(int *)(a3 + 16));
  }
  uint64_t v33 = a10;
  if (*(_DWORD *)(v16 + 928) && *(int *)(a3 + 16) >= 1)
  {
    uint64_t v34 = 0;
    int v35 = 0;
    do
    {
      if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v34), v16) + 24) & 0x10) != 0)
      {
        int v36 = v35 + 1;
        if (v35 >= 1)
        {
          *(_WORD *)(a6 + 2 * v34) |= 0x1000u;
          uint64_t v33 = a10;
          if (v35 == 1)
          {
            *(_WORD *)(a6 + 2 * v34 - 2) |= 0x1000u;
            int v36 = 2;
          }
          goto LABEL_49;
        }
      }
      else
      {
        int v36 = 0;
      }
      uint64_t v33 = a10;
LABEL_49:
      ++v34;
      int v35 = v36;
    }
    while (v34 < *(int *)(a3 + 16));
  }
  unint64_t v37 = 0;
  while (2)
  {
    if (v37 >= 0xA) {
      uint64_t v38 = v16 + 24 * (v37 - 10) + 1552;
    }
    else {
      uint64_t v38 = v16 + 24 * v37 + 1312;
    }
    if (*(_DWORD *)(v38 + 16))
    {
      unint64_t v514 = v37;
      unsigned int v39 = *(unsigned __int16 *)(v38 + 20);
      uint64_t v40 = a9;
      uint64_t v541 = v38;
      if (*(int *)(v30 + 16) < 1) {
        goto LABEL_92;
      }
      uint64_t v41 = 0;
      do
      {
        BOOL v42 = sub_196BC(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v41), v16, v38);
        uint64_t v38 = v541;
        *(_DWORD *)(a9 + 4 * v41) = (*(_DWORD *)(a9 + 4 * v41) & 0xFFFFFFFA | v42) ^ 1;
        ++v41;
        uint64_t v43 = *(int *)(v30 + 16);
      }
      while (v41 < v43);
      uint64_t v33 = a10;
      uint64_t v40 = a9;
      if ((int)v43 < 1) {
        goto LABEL_92;
      }
      unsigned int v522 = v39;
      signed int v44 = 0;
      int v45 = 0;
      int v530 = *(_DWORD *)(v16 + 36 * *(unsigned __int16 *)(v541 + 20) + 1960);
      int v46 = -1;
      unsigned int v47 = -1;
      int v48 = -1;
      while (2)
      {
        int v49 = *(_DWORD *)(v40 + 4 * v44);
        if (v45) {
          int v50 = v44;
        }
        else {
          int v50 = v46;
        }
        if (v49) {
          int v51 = v48;
        }
        else {
          int v51 = v44;
        }
        if ((v49 & 1) == 0)
        {
          int v45 = 0;
          int v46 = v50;
          goto LABEL_87;
        }
        int v52 = *(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v44);
        uint64_t v53 = v16;
        __int16 v54 = *(_WORD *)(a6 + 2 * v44);
        BOOL v55 = sub_1977C(v52, v53, v38);
        uint64_t v38 = v541;
        if (v55)
        {
          uint64_t v56 = *(void *)(v541 + 8);
          if (v56)
          {
            uint64_t v57 = sub_16DC8(v52, (uint64_t)a1);
            uint64_t v38 = v541;
            int v58 = (v57[3] & v56) != 0;
          }
          else
          {
            int v58 = (unsigned __int16)(*(_WORD *)v541 & v54);
          }
          uint64_t v30 = a3;
          if (v58)
          {
            if ((v47 & 0x80000000) != 0) {
              unsigned int v47 = v44;
            }
            int v45 = 1;
            uint64_t v33 = a10;
            uint64_t v16 = (uint64_t)a1;
            goto LABEL_86;
          }
        }
        uint64_t v16 = (uint64_t)a1;
        if (!sub_1977C(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v44), (uint64_t)a1, v38)
          || (v47 & 0x80000000) != 0)
        {
          uint64_t v33 = a10;
          uint64_t v40 = a9;
          uint64_t v38 = v541;
        }
        else
        {
          uint64_t v38 = v541;
          uint64_t v33 = a10;
          *(_WORD *)(a10 + 8 * v47) = *(_WORD *)(v541 + 16) | *(void *)(a10 + 8 * v47);
          if (v45)
          {
            int v59 = *(_DWORD *)(v541 + 16);
            if (v530 && (int)v47 < v48)
            {
              int v45 = 0;
              *(_WORD *)(a10 + 8 * v46 + 2) = (*(void *)(a10 + 8 * v46) | (v59 << 16)) >> 16;
              unsigned int v47 = -1;
              int v46 = -1;
              signed int v44 = v48;
              goto LABEL_86;
            }
            int v45 = 0;
            uint64_t v60 = a10 + 8 * v44;
          }
          else
          {
            int v59 = *(_DWORD *)(v541 + 16);
            uint64_t v60 = a10 + 8 * v46;
          }
          *(_WORD *)(v60 + 2) = (*(void *)v60 | (v59 << 16)) >> 16;
          unsigned int v47 = -1;
          int v46 = -1;
LABEL_86:
          uint64_t v40 = a9;
        }
LABEL_87:
        ++v44;
        int v48 = v51;
        if (v44 < *(_DWORD *)(v30 + 16)) {
          continue;
        }
        break;
      }
      unsigned int v39 = v522;
      if ((v47 & 0x80000000) == 0)
      {
        *(_WORD *)(v33 + 8 * v47) = *(_WORD *)(v38 + 16) | *(void *)(v33 + 8 * v47);
        if (v45) {
          int v46 = *(_DWORD *)(v30 + 16);
        }
        *(_WORD *)(v33 + 8 * v46 + 2) = (*(void *)(v33 + 8 * v46) | (*(_DWORD *)(v38 + 16) << 16)) >> 16;
      }
LABEL_92:
      uint64_t v61 = v16 + 36 * v39 + 1960;
      if (!*(_DWORD *)(v16 + 36 * v39 + 1984))
      {
        int v64 = *(_DWORD *)(v16 + 36 * v39 + 1980);
        uint64_t v31 = a6;
        unint64_t v37 = v514;
        if (v64)
        {
          if (!*(_DWORD *)(v61 + 12)) {
            goto LABEL_369;
          }
          int v65 = *(_DWORD *)(v30 + 16);
          if (v65 >= 1)
          {
            for (uint64_t i = 0; i < v65; ++i)
            {
              uint64_t v67 = *(void *)(v33 + 8 * i);
              int v68 = *(_DWORD *)(v38 + 16);
              if (((unsigned __int16)v68 & (unsigned __int16)v67) != 0)
              {
                uint64_t v69 = v33 + 8 * i;
                uint64_t v70 = *(void *)(v69 + 8);
                if ((v68 & WORD1(v70)) != 0)
                {
                  *(void *)(v33 + 8 * i) = v67 & 0xFFFFFFFFFFFF0000 | ((unsigned __int16)v68 ^ 0xFFFF) & v67;
                  *(void *)(v69 + 8) = v70 & 0xFFFFFFFF0000FFFFLL | v70 & (~*(_DWORD *)(v38 + 16) << 16);
                  *(void *)(v33 + 8 * i) = v67 & 0xFFFFFFFF0000 | ((unsigned __int16)v68 ^ 0xFFFF) & v67 | ((unint64_t)(unsigned __int16)(*(_WORD *)(v38 + 16) | HIWORD(v67)) << 48);
                  int v65 = *(_DWORD *)(v30 + 16);
                }
              }
            }
          }
        }
        goto LABEL_409;
      }
      int v62 = (_DWORD *)(v16 + 36 * *(unsigned __int16 *)(v38 + 20));
      if (v62[490])
      {
        if (v62[492]) {
          BOOL v63 = 1;
        }
        else {
          BOOL v63 = v62[494] != 0;
        }
        BOOL v523 = v63;
      }
      else
      {
        BOOL v523 = 0;
      }
      uint64_t v511 = v16 + 36 * v39 + 1960;
      if (*(int *)(v30 + 16) < 1)
      {
        unsigned int v76 = -1;
        goto LABEL_187;
      }
      uint64_t v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      int v75 = v62[495];
      unsigned int v76 = -1;
      uint64_t v77 = -1;
      unsigned int v78 = -1;
      int v531 = v75;
      while (2)
      {
        unint64_t v79 = *(void *)(v33 + 8 * v71);
        int v80 = *(_DWORD *)(v38 + 16);
        if (v73)
        {
LABEL_119:
          if ((v80 & WORD1(v79)) != 0)
          {
            int v73 = 0;
            *(void *)(v33 + 8 * v71) = v79 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v79) & ~v80) << 16);
            int v83 = 1;
            if (v74 && (v78 & 0x80000000) == 0)
            {
              int v84 = *(_DWORD *)(v38 + 16);
              uint64_t v85 = *(void *)(v33 + 8 * v78);
              if (v75 && v72 == 1)
              {
                int v73 = 0;
                *(void *)(v33 + 8 * v78) = v85 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(v84 | HIWORD(v85)) << 48);
              }
              else
              {
                *(void *)(v33 + 8 * v78) = v85 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(v84 | WORD2(v85)) << 32);
                int v73 = 0;
                if (*(_DWORD *)(v40 + 4 * v71))
                {
                  uint64_t v104 = *(void *)(v33 + 8 * v71);
                  unint64_t v105 = v104 & 0xFFFFFFFF0000FFFFLL | v104 & 0xFFFF0000 | (*(_DWORD *)(v38 + 16) << 16);
                  *(void *)(v33 + 8 * v71) = v105;
                  *(void *)(v33 + 8 * v71) = v105 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_WORD *)(v38 + 16) | WORD2(v104)) << 32);
                }
              }
              goto LABEL_127;
            }
          }
          else
          {
            int v83 = 0;
            int v73 = 1;
          }
          if (!v74) {
            goto LABEL_141;
          }
        }
        else
        {
          int v81 = (unsigned __int16)*(_DWORD *)(v38 + 16);
          if ((v81 & v79) != 0)
          {
            unint64_t v79 = v79 & 0xFFFFFFFFFFFF0000 | (v81 ^ 0xFFFF) & v79;
            *(void *)(v33 + 8 * v71) = v79;
            if (v74) {
              unsigned int v82 = v71;
            }
            else {
              unsigned int v82 = v78;
            }
            if (*(_DWORD *)(v40 + 4 * v71)) {
              unsigned int v78 = v82;
            }
            else {
              unsigned int v78 = -1;
            }
            int v80 = *(_DWORD *)(v38 + 16);
            goto LABEL_119;
          }
          int v73 = 0;
          int v83 = 1;
          if (!v74)
          {
LABEL_141:
            if (*(_DWORD *)(v40 + 4 * v71))
            {
              if (sub_1977C(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v71), v16, v38))
              {
                if (!v83) {
                  unsigned int v78 = v71;
                }
                LODWORD(v92) = v76 + 1;
                if (v71 > (int)(v76 + 1))
                {
                  uint64_t v92 = (int)v92;
                  do
                    *(_DWORD *)(v40 + 4 * v92++) &= ~1u;
                  while (v71 != v92);
                }
                uint64_t v33 = a10;
                uint64_t v38 = v541;
                int v75 = v531;
                if ((v76 & 0x80000000) == 0)
                {
                  uint64_t v93 = *(void *)(a10 + 8 * v76);
                  int v94 = *(_DWORD *)(v541 + 16);
                  if (((unsigned __int16)v94 & HIWORD(v93)) == 0)
                  {
                    unsigned int v95 = v94 & WORD1(v93);
                    if (((unsigned __int16)*(_DWORD *)(v541 + 16) & WORD2(v93)) != 0 && v95 == 0) {
                      *(void *)(a10 + 8 * v76) = v93 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v541 + 16) | HIWORD(v93)) << 48);
                    }
                    uint64_t v97 = (unint64_t *)(a10 + 8 * v76);
                    if (v77 <= v76) {
                      uint64_t v98 = v76;
                    }
                    else {
                      uint64_t v98 = v77;
                    }
                    uint64_t v99 = v98 - v76;
                    while (v99)
                    {
                      unint64_t v101 = v97[1];
                      ++v97;
                      unint64_t v100 = v101;
                      int v102 = *(_DWORD *)(v541 + 16);
                      --v99;
                      if ((v102 & WORD1(v101)) != 0)
                      {
                        *uint64_t v97 = v100 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v100) & ~v102) << 16);
                        *uint64_t v97 = v100 & 0xFFFF00000000FFFFLL | ((WORD1(v100) & ~v102) << 16) | ((unint64_t)(unsigned __int16)(WORD2(v100) & ~*(_WORD *)(v541 + 16)) << 32);
                        goto LABEL_127;
                      }
                    }
                  }
                }
                goto LABEL_127;
              }
              uint64_t v33 = a10;
              uint64_t v38 = v541;
              int v75 = v531;
            }
LABEL_168:
            int v74 = 0;
            if (v71 == v78)
            {
              int v72 = 1;
              unsigned int v76 = v71;
            }
            goto LABEL_170;
          }
        }
LABEL_127:
        if ((*(_DWORD *)(v40 + 4 * v71) & 1) == 0)
        {
          char v86 = v73 ^ 1;
          if ((v78 & 0x80000000) != 0) {
            char v86 = 1;
          }
          if ((v86 & 1) == 0)
          {
            unint64_t v87 = *(void *)(v33 + 8 * v78);
            if (v75 && v72 == 1)
            {
              unint64_t v88 = (unsigned __int16)*(_DWORD *)(v38 + 16) | HIWORD(v87);
              unint64_t v89 = 0xFFFFFFFFFFFFLL;
              char v90 = 48;
            }
            else
            {
              unint64_t v88 = (unsigned __int16)(*(_DWORD *)(v38 + 16) | WORD2(v87));
              unint64_t v89 = 0xFFFF0000FFFFFFFFLL;
              char v90 = 32;
            }
            *(void *)(v33 + 8 * v78) = v89 & v87 | (v88 << v90);
          }
          unsigned int v78 = -1;
          goto LABEL_168;
        }
        if (v71 == v78)
        {
          int v74 = 1;
          int v72 = 1;
          unsigned int v76 = v71;
        }
        else
        {
          if (v523
            || (BOOL v91 = sub_1977C(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v71), v16, v38),
                int v75 = v531,
                uint64_t v38 = v541,
                v91))
          {
            v72 += v83 ^ 1;
            int v74 = 1;
            unsigned int v76 = v71;
          }
          else
          {
            int v74 = 1;
          }
          uint64_t v33 = a10;
        }
LABEL_170:
        ++v71;
        uint64_t v103 = *(int *)(v30 + 16);
        ++v77;
        if (v71 < v103) {
          continue;
        }
        break;
      }
      if (v73)
      {
        *(_WORD *)(v33 + 8 * v103 + 2) = (*(void *)(v33 + 8 * v103) & (~*(_DWORD *)(v38 + 16) << 16)) >> 16;
        char v106 = v74 ^ 1;
        if ((v78 & 0x80000000) != 0) {
          char v106 = 1;
        }
        uint64_t v61 = v511;
        if ((v106 & 1) == 0)
        {
          unint64_t v107 = *(void *)(v33 + 8 * v78);
          if (v75 && v72 == 1)
          {
            unint64_t v108 = (unsigned __int16)*(_DWORD *)(v38 + 16) | HIWORD(v107);
            unint64_t v109 = 0xFFFFFFFFFFFFLL;
            char v110 = 48;
          }
          else
          {
            unint64_t v108 = (unsigned __int16)(*(_DWORD *)(v38 + 16) | WORD2(v107));
            unint64_t v109 = 0xFFFF0000FFFFFFFFLL;
            char v110 = 32;
          }
          *(void *)(v33 + 8 * v78) = v109 & v107 | (v108 << v110);
        }
      }
      else
      {
        uint64_t v61 = v511;
      }
LABEL_187:
      LODWORD(v111) = v76 + 1;
      LODWORD(v112) = *(_DWORD *)(v30 + 16);
      if ((int)(v76 + 1) < (int)v112)
      {
        uint64_t v111 = (int)v111;
        do
        {
          *(_DWORD *)(v40 + 4 * v111++) &= ~1u;
          uint64_t v112 = *(int *)(v30 + 16);
        }
        while (v111 < v112);
      }
      if ((v76 & 0x80000000) == 0)
      {
        uint64_t v113 = *(void *)(v33 + 8 * v76);
        int v114 = *(_DWORD *)(v38 + 16);
        if (((unsigned __int16)v114 & HIWORD(v113)) == 0)
        {
          unsigned int v115 = v114 & WORD1(v113);
          if (((unsigned __int16)*(_DWORD *)(v38 + 16) & WORD2(v113)) != 0 && v115 == 0)
          {
            *(void *)(v33 + 8 * v76) = v113 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v38 + 16) | HIWORD(v113)) << 48);
            LODWORD(v112) = *(_DWORD *)(v30 + 16);
          }
          if ((int)v76 <= (int)v112 - 1) {
            uint64_t v117 = (v112 - 1);
          }
          else {
            uint64_t v117 = v76;
          }
          uint64_t v118 = (unint64_t *)(v33 + 8 * v76);
          uint64_t v119 = v117 - v76;
          while (v119)
          {
            unint64_t v121 = v118[1];
            ++v118;
            unint64_t v120 = v121;
            int v122 = *(_DWORD *)(v38 + 16);
            --v119;
            if ((v122 & WORD1(v121)) != 0)
            {
              *uint64_t v118 = v120 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v120) & ~v122) << 16);
              *uint64_t v118 = v120 & 0xFFFF00000000FFFFLL | ((WORD1(v120) & ~v122) << 16) | ((unint64_t)(unsigned __int16)(WORD2(v120) & ~*(_WORD *)(v38 + 16)) << 32);
              LODWORD(v112) = *(_DWORD *)(v30 + 16);
              break;
            }
          }
        }
      }
      if ((int)v112 >= 1)
      {
        uint64_t v123 = 0;
        uint64_t v124 = v40;
        uint64_t v125 = 0xFFFFFFFFLL;
        do
        {
          uint64_t v126 = *(void *)(v33 + 8 * v123);
          int v127 = *(_DWORD *)(v38 + 16);
          if (((unsigned __int16)v127 & HIWORD(v126)) != 0)
          {
            if ((!v123 || (*(unsigned char *)(v124 - 4) & 1) == 0)
              && (v123 + 1 == v112 || (*(unsigned char *)(v124 + 4) & 1) == 0))
            {
              *(_DWORD *)v124 |= 4u;
            }
          }
          else if (((unsigned __int16)v127 & WORD2(v126)) != 0)
          {
            if ((v127 & WORD1(v126)) != 0)
            {
              if (v125 & 0x80000000) == 0 && (*(unsigned char *)v124) {
                *(_DWORD *)(v40 + 4 * v125) &= ~4u;
              }
              uint64_t v125 = 0xFFFFFFFFLL;
            }
            else
            {
              if (!v123 || (*(unsigned char *)(v124 - 4) & 1) == 0) {
                *(_DWORD *)v124 |= 4u;
              }
              uint64_t v125 = v123;
            }
          }
          ++v123;
          uint64_t v112 = *(int *)(v30 + 16);
          v124 += 4;
        }
        while (v123 < v112);
      }
      if (*(_DWORD *)(v61 + 32))
      {
        uint64_t v128 = v16 + 36 * *(unsigned __int16 *)(v38 + 20);
        uint64_t v129 = v128 + 1960;
        if (*(_DWORD *)(v128 + 1968)) {
          BOOL v532 = 0;
        }
        else {
          BOOL v532 = *(_DWORD *)(v128 + 1976) == 0;
        }
        if ((int)v112 < 1) {
          goto LABEL_368;
        }
        uint64_t v173 = 0;
        unsigned int v174 = 0;
        int v175 = 0;
        BOOL v176 = 0;
        int v177 = 0;
        LODWORD(v178) = -1;
        int v179 = -1;
        uint64_t v180 = 0xFFFFFFFFLL;
        uint64_t v181 = 0xFFFFFFFFLL;
        uint64_t v518 = v129;
        uint64_t v526 = 0xFFFFFFFFLL;
        while (1)
        {
          int v182 = *(_DWORD *)(v40 + 4 * v173);
          BOOL v183 = (v182 & 1) == 0;
          unsigned int v184 = (v182 & 1) != 0 ? v178 : v173;
          BOOL v185 = v177 == 0;
          if (v177)
          {
            BOOL v183 = (v182 & 1) == 0;
            int v177 = (v182 & 1) != 0;
          }
          else
          {
            int v177 = v182 & 1;
          }
          uint64_t v178 = v185 ? v178 : v184;
          uint64_t v186 = *(void *)(v33 + 8 * v173);
          int v187 = *(_DWORD *)(v38 + 16);
          if (v176) {
            break;
          }
          int v190 = (unsigned __int16)(v187 & HIWORD(v186));
          if (v190)
          {
            uint64_t v181 = v173;
          }
          else
          {
            LODWORD(v186) = v187 & WORD1(v186);
            if (((unsigned __int16)v187 & WORD2(v186)) == 0 || v186 != 0) {
              goto LABEL_365;
            }
          }
          BOOL v176 = v190 == 0;
          if (v175)
          {
            if (!*(void *)(v38 + 8) || (v182 & 4) != 0)
            {
              ++v174;
              uint64_t v180 = v173;
LABEL_327:
              char v189 = v176 || v183;
              if ((v189 & 1) != 0 || v173 == v181)
              {
                if (v173 == v112 - 1 && v174 >= *(_DWORD *)(v129 + 32))
                {
                  if (v179 < (int)v180) {
                    int v179 = v112;
                  }
                  uint64_t v194 = v180;
                  sub_19994(v526, v179, v180, a10, v541, (uint64_t)a1, v40);
                  uint64_t v180 = v194;
                  uint64_t v16 = (uint64_t)a1;
                  uint64_t v38 = v541;
                  uint64_t v129 = v518;
                  uint64_t v33 = a10;
                }
                int v175 = 1;
                goto LABEL_359;
              }
              BOOL v176 = 0;
            }
            if (v179 < (int)v180) {
              int v179 = v173;
            }
            int v191 = v532;
            if (v179 == v178) {
              int v191 = 0;
            }
            v174 -= v191;
            if (v174 >= *(_DWORD *)(v129 + 32))
            {
              uint64_t v192 = v180;
              sub_19994(v526, v179, v180, a10, v541, (uint64_t)a1, v40);
              uint64_t v180 = v192;
              uint64_t v16 = (uint64_t)a1;
              uint64_t v38 = v541;
              uint64_t v129 = v518;
              uint64_t v33 = a10;
            }
LABEL_358:
            int v175 = 0;
            goto LABEL_359;
          }
LABEL_344:
          if (!v176 && v173 != v181)
          {
            BOOL v176 = 0;
            goto LABEL_358;
          }
          if (*(void *)(v38 + 8) && (v182 & 4) == 0) {
            goto LABEL_358;
          }
          int v179 = -1;
          int v175 = 1;
          uint64_t v180 = v173;
          uint64_t v526 = v173;
          unsigned int v174 = 1;
LABEL_359:
          ++v173;
          uint64_t v112 = *(int *)(v30 + 16);
          if (v173 >= v112) {
            goto LABEL_227;
          }
        }
        if (((unsigned __int16)v187 & WORD2(v186)) != 0)
        {
          if ((v187 & WORD1(v186)) == 0 && v173 != v178) {
            goto LABEL_326;
          }
        }
        else
        {
LABEL_365:
          if (v173 != v178) {
            goto LABEL_326;
          }
        }
        BOOL v176 = 0;
        if (v175) {
          int v179 = v173;
        }
LABEL_326:
        if (v175) {
          goto LABEL_327;
        }
        goto LABEL_344;
      }
LABEL_227:
      if ((int)v112 < 1) {
        goto LABEL_368;
      }
      uint64_t v130 = 0;
      int v131 = 0;
      uint64_t v132 = 0;
      int v133 = 0;
      int v134 = 0;
      int v533 = *(_DWORD *)(v16 + 36 * *(unsigned __int16 *)(v38 + 20) + 1980);
      int v135 = -1;
      int v136 = (_DWORD *)v40;
      uint64_t v137 = v33;
      int v138 = -1;
      while (2)
      {
        unint64_t v139 = *(void *)v137;
        if (v133)
        {
          int v140 = *(_DWORD *)(v38 + 16);
          if ((v140 & WORD1(v139)) != 0) {
            goto LABEL_234;
          }
          if ((WORD2(v139) & (unsigned __int16)v140) != 0)
          {
            int v135 = v130;
            goto LABEL_234;
          }
          goto LABEL_235;
        }
        int v140 = *(_DWORD *)(v38 + 16);
LABEL_234:
        __int16 v141 = v140;
        if (((unsigned __int16)v140 & (unsigned __int16)v139) != 0)
        {
LABEL_235:
          int v133 = 1;
          goto LABEL_273;
        }
        if (v134)
        {
LABEL_237:
          if ((*v136 & 1) != 0
            && ((int v142 = *(_DWORD *)(v38 + 16), ((unsigned __int16)v142 & (unsigned __int16)WORD2(*(void *)v137)) != 0)
              ? (BOOL v143 = (v142 & WORD1(*(void *)v137)) == 0)
              : (BOOL v143 = 1),
                v143))
          {
            if ((*v136 & 2) != 0
              || (int v144 = v132,
                  BOOL v145 = sub_19854(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v130), v16, v38),
                  uint64_t v38 = v541,
                  v145))
            {
              if (v533 && v131 == 1 && v138 != v135)
              {
                unint64_t v146 = *(void *)(a10 + 8 * v138);
                unint64_t v147 = HIDWORD(v146);
                unint64_t v148 = v146 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v38 + 16) | HIWORD(v146)) << 48);
                *(void *)(a10 + 8 * v138) = v148;
                *(void *)(a10 + 8 * v138) = v148 & 0xFFFF0000FFFFFFFFLL | ((v147 & (unsigned __int16)~*(_WORD *)(v38 + 16)) << 32);
                *(_DWORD *)(v40 + 4 * v138) &= ~4u;
              }
              if (sub_19854(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v130), v16, v38))
              {
                int v133 = 0;
                int v134 = 1;
                uint64_t v132 = 1;
                uint64_t v33 = a10;
                uint64_t v38 = v541;
              }
              else
              {
                uint64_t v33 = a10;
                uint64_t v38 = v541;
                if (v138 == v135) {
                  *(_WORD *)(a10 + 8 * v135 + 4) = *(_DWORD *)(a10 + 8 * v135 + 4) & ~*(_WORD *)(v541 + 16);
                }
                int v133 = 0;
                uint64_t v132 = 0;
                *(_WORD *)(v137 + 4) = *(_DWORD *)(v541 + 16) | *(_DWORD *)(v137 + 4);
                int v135 = -1;
                int v134 = 1;
                int v138 = v130;
                int v131 = 1;
              }
            }
            else
            {
              if (v144)
              {
                uint64_t v33 = a10;
                if (v138 == v135) {
                  *(_WORD *)(a10 + 8 * v135 + 4) = *(_DWORD *)(a10 + 8 * v135 + 4) & ~*(_WORD *)(v541 + 16);
                }
                int v131 = 0;
                *(_WORD *)(v137 + 4) = *(_WORD *)(v541 + 16) | *(_DWORD *)(v137 + 4);
                int v135 = -1;
                int v138 = v130;
              }
              else
              {
                uint64_t v33 = a10;
              }
              int v133 = 0;
              uint64_t v132 = 0;
              ++v131;
              int v134 = 1;
            }
          }
          else
          {
            if (v533 && v131 == 1 && v138 != v135)
            {
              unint64_t v149 = *(void *)(v33 + 8 * v138);
              unint64_t v150 = HIDWORD(v149);
              unint64_t v151 = v149 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v38 + 16) | HIWORD(v149)) << 48);
              *(void *)(v33 + 8 * v138) = v151;
              *(void *)(v33 + 8 * v138) = v151 & 0xFFFF0000FFFFFFFFLL | ((v150 & (unsigned __int16)~*(_WORD *)(v38 + 16)) << 32);
              *(_DWORD *)(v40 + 4 * v138) &= ~4u;
              unint64_t v152 = *(void *)v137;
              unint64_t v153 = *(void *)v137 & 0xFFFFFFFF0000FFFFLL | *(void *)v137 & (~*(_DWORD *)(v38 + 16) << 16);
              *(void *)uint64_t v137 = v153;
              *(void *)uint64_t v137 = v153 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v152) & ~*(_WORD *)(v38 + 16)) << 32);
            }
            if (v132
              || (*(unsigned char *)v136 & 2) != 0
              || (uint64_t v154 = v132,
                  BOOL v155 = sub_19854(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v130), v16, v38),
                  uint64_t v132 = v154,
                  uint64_t v38 = v541,
                  v155))
            {
              unint64_t v156 = *(void *)v137;
              unint64_t v157 = *(void *)v137 & 0xFFFFFFFF0000FFFFLL | *(void *)v137 & (~*(_DWORD *)(v38 + 16) << 16);
              *(void *)uint64_t v137 = v157;
              *(void *)uint64_t v137 = v157 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v156) & ~*(_WORD *)(v38 + 16)) << 32);
            }
            int v134 = 0;
            int v133 = 0;
            if (v130 == v138)
            {
              *(_DWORD *)(v40 + 4 * v138) &= ~4u;
              unint64_t v158 = *(void *)v137;
              unint64_t v159 = *(void *)v137 & 0xFFFFFFFF0000FFFFLL | *(void *)v137 & (~*(_DWORD *)(v38 + 16) << 16);
              *(void *)uint64_t v137 = v159;
              *(void *)uint64_t v137 = v159 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v158) & ~*(_WORD *)(v38 + 16)) << 32);
            }
            uint64_t v33 = a10;
          }
        }
        else
        {
          if (((unsigned __int16)v140 & WORD2(v139)) == 0)
          {
            unint64_t v163 = HIWORD(v139);
            if (((unsigned __int16)v140 & HIWORD(v139)) == 0)
            {
              int v134 = 0;
              int v133 = 0;
              goto LABEL_273;
            }
            if ((*(unsigned char *)v136 & 2) == 0)
            {
              unsigned int v517 = v132;
              int v525 = v131;
              uint64_t v164 = v38;
              if (!sub_19854(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v130), v16, v38))
              {
                int v134 = 0;
                int v133 = 0;
                uint64_t v33 = a10;
                uint64_t v38 = v164;
                int v131 = v525;
                uint64_t v132 = v517;
                goto LABEL_273;
              }
              int v140 = *(_DWORD *)(v164 + 16);
              unint64_t v139 = *(void *)v137;
              unint64_t v163 = HIWORD(*(void *)v137);
              uint64_t v33 = a10;
              uint64_t v38 = v164;
              int v131 = v525;
              uint64_t v132 = v517;
            }
            int v134 = 0;
            int v133 = 0;
            *(void *)uint64_t v137 = v139 & 0xFFFFFFFFFFFFLL | ((v163 & (unsigned __int16)~(_WORD)v140) << 48);
            goto LABEL_273;
          }
          if ((*(unsigned char *)v136 & 2) != 0)
          {
            if (!v533 || v130 == v135)
            {
              uint64_t v132 = 0;
              int v131 = 0;
              int v138 = v130;
              goto LABEL_237;
            }
          }
          else
          {
            unsigned int v516 = v132;
            int v524 = v131;
            uint64_t v160 = v38;
            if (!sub_19854(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v130), v16, v38)
              || v533 == 0
              || v130 == v135)
            {
              uint64_t v132 = 0;
              int v138 = v130;
              uint64_t v33 = a10;
              uint64_t v38 = v160;
              int v131 = 0;
              goto LABEL_237;
            }
            __int16 v141 = *(_WORD *)(v160 + 16);
            unint64_t v139 = *(void *)v137;
            uint64_t v33 = a10;
            uint64_t v38 = v160;
            int v131 = v524;
            uint64_t v132 = v516;
          }
          unint64_t v165 = v139 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(v141 | HIWORD(v139)) << 48);
          *(void *)uint64_t v137 = v165;
          if (v136[1])
          {
            *(_WORD *)(v137 + 12) = *(_DWORD *)(v38 + 16) | *(_DWORD *)(v137 + 12);
            if ((*(unsigned char *)v136 & 4) != 0)
            {
              v136[1] |= 4u;
              unint64_t v165 = *(void *)v137;
            }
          }
          int v134 = 0;
          int v133 = 0;
          *(void *)uint64_t v137 = v165 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v165) & ~*(_WORD *)(v38 + 16)) << 32);
          *v136 &= ~4u;
        }
LABEL_273:
        ++v130;
        v137 += 8;
        ++v136;
        if (v130 < *(int *)(v30 + 16)) {
          continue;
        }
        break;
      }
      if (v134)
      {
        if (v533 && v131 == 1 && v138 != v135)
        {
          unint64_t v166 = *(void *)(v33 + 8 * v138);
          unint64_t v167 = HIDWORD(v166);
          unint64_t v168 = v166 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v38 + 16) | HIWORD(v166)) << 48);
          *(void *)(v33 + 8 * v138) = v168;
          *(void *)(v33 + 8 * v138) = v168 & 0xFFFF0000FFFFFFFFLL | ((v167 & (unsigned __int16)~*(_WORD *)(v38 + 16)) << 32);
          *(_DWORD *)(v40 + 4 * v138) &= ~4u;
          unint64_t v169 = *(void *)v137;
          unint64_t v170 = *(void *)v137 & 0xFFFFFFFF0000FFFFLL | *(void *)v137 & (~*(_DWORD *)(v38 + 16) << 16);
          *(void *)uint64_t v137 = v170;
          *(void *)uint64_t v137 = v170 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v169) & ~*(_WORD *)(v38 + 16)) << 32);
        }
        if (v132)
        {
          unint64_t v171 = *(void *)v137;
          unint64_t v172 = *(void *)v137 & 0xFFFFFFFF0000FFFFLL | *(void *)v137 & (~*(_DWORD *)(v38 + 16) << 16);
          *(void *)uint64_t v137 = v172;
          *(void *)uint64_t v137 = v172 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v171) & ~*(_WORD *)(v38 + 16)) << 32);
        }
      }
LABEL_368:
      uint64_t v31 = a6;
      unint64_t v37 = v514;
      if (!*(_DWORD *)(v511 + 28))
      {
LABEL_369:
        uint64_t v196 = v16 + 36 * *(unsigned __int16 *)(v38 + 20);
        if (*(_DWORD *)(v196 + 1984))
        {
          if (!*(_DWORD *)(v196 + 1988) && *(int *)(v30 + 16) >= 1)
          {
            uint64_t v197 = 0;
            int v198 = 0;
            int v199 = 0;
            uint64_t v200 = 0xFFFFFFFFLL;
            while (1)
            {
              uint64_t v201 = *(void *)(v33 + 8 * v197);
              if (v199)
              {
                int v202 = *(_DWORD *)(v38 + 16);
                if ((v202 & WORD1(v201)) == 0 && (unsigned __int16)(WORD2(v201) & v202) == 0) {
                  goto LABEL_382;
                }
              }
              else
              {
                int v202 = *(_DWORD *)(v38 + 16);
              }
              if (((unsigned __int16)v202 & (unsigned __int16)v201) == 0)
              {
                if (v198)
                {
                  uint64_t v204 = v200;
                  if (((unsigned __int16)v202 & WORD2(v201)) == 0)
                  {
LABEL_395:
                    int v199 = 0;
                    int v198 = *(_DWORD *)(v40 + 4 * v197) & 1;
                    goto LABEL_383;
                  }
                }
                else
                {
                  uint64_t v204 = v197;
                  if (((unsigned __int16)v202 & WORD2(v201)) == 0)
                  {
                    int v199 = 0;
                    int v198 = 0;
                    goto LABEL_383;
                  }
                }
                if ((v202 & WORD1(v201)) != 0)
                {
                  *(void *)(v33 + 8 * v197) = v201 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v201) & ~v202) << 16);
                  *(void *)(v33 + 8 * v197) = v201 & 0xFFFF00000000FFFFLL | ((WORD1(v201) & ~v202) << 16) | ((unint64_t)(unsigned __int16)(WORD2(v201) & ~*(_WORD *)(v38 + 16)) << 32);
                  *(_WORD *)(v33 + 8 * (int)v204 + 4) = *(_DWORD *)(v33 + 8 * (int)v204 + 4) & ~*(_WORD *)(v38 + 16);
                  if (v197 > (int)v204)
                  {
                    uint64_t v205 = (int)v204;
                    do
                      *(_WORD *)(v33 + 8 * v205++ + 6) |= *(_WORD *)(v38 + 16);
                    while (v197 != v205);
                  }
                  int v199 = 0;
                  int v198 = 0;
                  uint64_t v200 = v204;
                  goto LABEL_383;
                }
                uint64_t v200 = v204;
                goto LABEL_395;
              }
LABEL_382:
              int v199 = 1;
LABEL_383:
              if (++v197 >= *(int *)(v30 + 16)) {
                goto LABEL_409;
              }
            }
          }
          goto LABEL_409;
        }
        if (*(int *)(v30 + 16) < 1) {
          goto LABEL_409;
        }
        uint64_t v206 = 0;
        int v207 = 0;
        while (2)
        {
          unint64_t v208 = *(void *)(v33 + 8 * v206);
          int v209 = *(_DWORD *)(v38 + 16);
          if (v207)
          {
            if ((v209 & WORD1(v208)) != 0)
            {
              int v207 = 0;
              unint64_t v210 = v208 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v208) & ~v209) << 16);
              goto LABEL_405;
            }
LABEL_404:
            unint64_t v210 = v208 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(v209 | HIWORD(v208)) << 48);
            int v207 = 1;
LABEL_405:
            *(void *)(v33 + 8 * v206) = v210;
          }
          else
          {
            if (((unsigned __int16)*(_DWORD *)(v38 + 16) & (unsigned __int16)v208) != 0)
            {
              unint64_t v208 = v208 & 0xFFFFFFFFFFFF0000 | ((unsigned __int16)*(_DWORD *)(v38 + 16) ^ 0xFFFF) & v208;
              *(void *)(v33 + 8 * v206) = v208;
              LOWORD(v209) = *(_WORD *)(v38 + 16);
              goto LABEL_404;
            }
            int v207 = 0;
          }
          if (++v206 >= *(int *)(v30 + 16)) {
            break;
          }
          continue;
        }
      }
LABEL_409:
      if (*(void *)(v38 + 8) && *(int *)(v30 + 16) >= 1)
      {
        for (uint64_t j = 0; j < *(int *)(v30 + 16); ++j)
        {
          unint64_t v212 = *(void *)(v33 + 8 * j);
          uint64_t v213 = *(unsigned int *)(v38 + 16);
          if ((v213 & HIWORD(v212)) != 0)
          {
            uint64_t v214 = *(void *)(v38 + 8);
            if (v214 == 16)
            {
              if ((*(__int16 *)(v31 + 2 * j) & 0x80000000) == 0)
              {
                uint64_t v215 = HIWORD(v212) & (v213 ^ 0xFFFFFFFFLL);
LABEL_418:
                *(void *)(v33 + 8 * j) = v212 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v215 << 48);
              }
            }
            else
            {
              uint64_t v216 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * j), v16);
              uint64_t v38 = v541;
              uint64_t v33 = a10;
              if ((v216[3] & v214) == 0)
              {
                unint64_t v212 = *(void *)(a10 + 8 * j);
                uint64_t v215 = (*(unsigned int *)(v541 + 16) ^ 0xFFFFFFFFLL) & HIWORD(v212);
                goto LABEL_418;
              }
            }
          }
        }
      }
    }
    if (++v37 != 16) {
      continue;
    }
    break;
  }
  int v497 = 0;
  int v217 = 0;
  int v502 = 0;
  int v218 = 0;
  int v493 = a2 & 1;
  int v490 = 0;
  int v491 = a2 & 0x22;
  v488 = (unsigned int *)(v16 + 22596);
  uint64_t v500 = v16 + 31670;
  unint64_t v501 = 0;
  uint64_t v499 = a5 - 4;
  int v485 = 0;
  uint64_t v486 = v16 + 2550;
  uint64_t v487 = v16 + 2682;
  uint64_t v483 = v16 + 3198;
  int v492 = 117;
  while (2)
  {
    while (2)
    {
      BOOL v494 = 1;
LABEL_423:
      uint64_t v219 = (uint64_t)v554;
      while (2)
      {
        uint64_t v220 = v553;
        if (v553 > *(_DWORD *)(v219 + 16))
        {
          int v496 = v217;
          uint64_t v458 = (uint64_t)a1;
LABEL_1036:
          if (v502 <= (int)v220)
          {
            uint64_t v459 = (uint64_t)v554;
            int v460 = v502;
            do
            {
              sub_19168(0, 1, 1, 0, v460, v458, v220, v459, a4, a5, a10, a13, a14);
              if (a11)
              {
                sub_19168(0, 1, 0, 1, v460, v458, v220, v459, a4, a5, a10, a13, a14);
                sub_19168(1uLL, 0, 0, 1, v460, v458, v220, v459, a4, a5, a10, a13, a14);
              }
              sub_19168(1uLL, 0, 1, 0, v460++, v458, v220, v459, a4, a5, a10, a13, a14);
            }
            while (v220 + 1 != v460);
          }
          int v217 = v496;
          goto LABEL_1042;
        }
        unsigned int v221 = v553 - 1;
        if (v553 < 1)
        {
          uint64_t v222 = (uint64_t)a1;
          uint64_t v223 = a4;
          goto LABEL_430;
        }
        uint64_t v222 = (uint64_t)a1;
        uint64_t v223 = a4;
        if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v221), (uint64_t)a1) + 24) & 1) == 0)
        {
LABEL_430:
          int v224 = a16;
          goto LABEL_431;
        }
        int v224 = a16;
        if (v218 != 94)
        {
          int v217 = *(_DWORD *)(a4 + 20);
          unint64_t v501 = __PAIR64__(v220, v502);
        }
LABEL_431:
        if (v220 == *(_DWORD *)(v219 + 16)) {
          goto LABEL_1035;
        }
        BOOL v225 = (int)v220 >= a15 && (int)v220 < v224;
        if (v225)
        {
          int __src = 2;
          if (!sub_18F3C(v220, v224, v222, &v553, v219, v223, a5, a10, (uint64_t *)&v552, a13, &__src, a2)) {
            goto LABEL_1042;
          }
          continue;
        }
        break;
      }
      if ((int)v220 < 2)
      {
        if (v220)
        {
          uint64_t v226 = *(void *)(v219 + 8);
          goto LABEL_444;
        }
        int v228 = 32;
      }
      else
      {
        uint64_t v226 = *(void *)(v219 + 8);
        if (*(__int16 *)(v226 + 2 * v221) == -1)
        {
          int v227 = (unsigned __int16 *)(v226 + 2 * (v220 - 2));
          goto LABEL_445;
        }
LABEL_444:
        int v227 = (unsigned __int16 *)(v226 + 2 * (int)v221);
LABEL_445:
        int v228 = *v227;
      }
      uint64_t v229 = sub_16DC8(v228, v222);
      int v230 = *(_DWORD *)(v219 + 16);
      if ((int)v220 >= v230)
      {
LABEL_1035:
        uint64_t v458 = v222;
        int v496 = v217;
        goto LABEL_1036;
      }
      int v231 = v497;
      if (!v497) {
        int v231 = *(_WORD *)(v31 + 2 * (int)v220) & 0x1000;
      }
      int v497 = v231;
      if ((*(_WORD *)(v31 + 2 * (int)v220) & 0x800) != 0)
      {
        int v454 = *(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * (int)v220);
        if ((unsigned __int16)(v454 - 127) < 0xFFA1u) {
          goto LABEL_1042;
        }
        LOWORD(__src) = 0x8000;
        uint64_t v455 = *((unsigned int *)sub_16DC8(v454, v222) + 5);
        if (v455)
        {
          while (1)
          {
            uint64_t v456 = v222 + 8 * v455 + 31616;
            if ((*(_DWORD *)(v456 + 44) - 61) <= 8 && *(_WORD *)(v456 + 52) == 1) {
              break;
            }
            uint64_t v455 = *(unsigned int *)(v456 + 16);
            if (!v455) {
              goto LABEL_1029;
            }
          }
          LOWORD(__src) = *(_WORD *)(v456 + 56);
        }
LABEL_1029:
        if (!sub_18BDC(&__src, 1, 1, 0, v220, v219, v223, a5, a13, a14)) {
          goto LABEL_1042;
        }
        int v502 = v220 + 1;
        int v553 = v220 + 1;
        continue;
      }
      break;
    }
    uint64_t v480 = (v220 - 1);
    int v495 = v217;
    uint64_t v232 = v229[3];
    int v467 = *a13;
    int v469 = *(_DWORD *)(v223 + 16);
    uint64_t v478 = *(unsigned int *)(v223 + 20);
    if ((int)v220 < a15) {
      int v230 = a15;
    }
    int v504 = v230 - v220;
    uint64_t v233 = (char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * (int)v220), v222);
    int v476 = 0;
    uint64_t v234 = 0;
    BOOL v235 = v492 == 84;
    if ((v232 & 4) == 0) {
      BOOL v235 = 1;
    }
    char v473 = v235;
    uint64_t v474 = v232 & 9;
    uint64_t v506 = v232;
    uint64_t v515 = 2 * (int)v220;
    int v498 = v220 + 2;
    int v236 = v231 | v493;
    BOOL v237 = (a2 & 0x22) != 0 && (int)v220 <= a16;
    BOOL v238 = (int)v220 < a15;
    if (!v237) {
      BOOL v238 = 1;
    }
    int v239 = 0;
    int v482 = v231 | v493;
    char v472 = (v492 != 84) & ((v232 & 4) >> 2);
    if (v236) {
      BOOL v240 = 1;
    }
    else {
      BOOL v240 = (v232 & 2) == 0;
    }
    char v477 = v240;
    if (v236) {
      BOOL v241 = 1;
    }
    else {
      BOOL v241 = (v232 & 0xB) == 0;
    }
    char v475 = v241;
    if (v236) {
      BOOL v242 = 1;
    }
    else {
      BOOL v242 = (v232 & 9) == 0;
    }
    char v479 = v242;
    if (v236) {
      BOOL v243 = 1;
    }
    else {
      BOOL v243 = (v232 & 1) == 0;
    }
    if (v236) {
      BOOL v244 = 0;
    }
    else {
      BOOL v244 = v238;
    }
    BOOL v470 = v244;
    BOOL v471 = v243;
    v481 = (unsigned int *)(v233 + 20);
    uint64_t v245 = (int)v220;
    uint64_t v507 = v31 + 2 * (int)v220;
    uint64_t v512 = (int)v220 + ~(uint64_t)(int)v220;
    uint64_t v503 = (int)v220 + 1;
    uint64_t v468 = 1 - (v220 + 1);
    uint64_t v246 = a10;
    uint64_t v527 = v219;
    uint64_t v509 = v220;
    uint64_t v542 = (int)v220;
    while (2)
    {
      if (v504 >= 2)
      {
        uint64_t v248 = _lou_stringHash((unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v542), 1, v222);
        uint64_t v245 = v542;
        uint64_t v246 = a10;
        uint64_t v247 = (unsigned int *)(v222 + 4 * v248 + 22632);
        goto LABEL_482;
      }
LABEL_483:
      if (!v234) {
        goto LABEL_734;
      }
      int v510 = v239;
      while (2)
      {
        int v534 = *(_DWORD *)(v222 + 8 * v234 + 31660);
        uint64_t v536 = v222 + 8 * v234 + 31616;
        uint64_t v339 = *(__int16 *)(v222 + 8 * v234 + 31666);
        if (v239 != 1)
        {
          if (*(_WORD *)(v222 + 8 * v234 + 31666)) {
            BOOL v253 = v504 < (int)v339;
          }
          else {
            BOOL v253 = 1;
          }
          if (v253)
          {
LABEL_499:
            uint64_t v222 = (uint64_t)a1;
            uint64_t v223 = a4;
            v338 = (unsigned __int16 *)v536;
            goto LABEL_530;
          }
          if ((int)v339 >= 1)
          {
            uint64_t v255 = 0;
            LODWORD(v256) = 0;
            uint64_t v519 = (int)v509 + (int)v339;
            while (1)
            {
              int v257 = *(unsigned __int16 *)(*(void *)(v219 + 8) + v515 + 2 * v255);
              if (v257 == 0xFFFF) {
                break;
              }
              int v258 = (unsigned char *)v339;
              uint64_t v259 = sub_16DC8(v257, (uint64_t)a1);
              uint64_t v260 = (uint64_t)v259;
              LODWORD(v261) = v256;
              if (!v255) {
                uint64_t v261 = v259[3];
              }
              uint64_t v262 = sub_16DC8(*(unsigned __int16 *)(v500 + 8 * v234 + 2 * v255), (uint64_t)a1);
              int v263 = sub_10904((uint64_t)a1, v260);
              if (v263 != sub_10904((uint64_t)a1, (uint64_t)v262))
              {
                uint64_t v31 = a6;
                uint64_t v30 = a3;
                uint64_t v246 = a10;
                uint64_t v222 = (uint64_t)a1;
                uint64_t v223 = a4;
                uint64_t v219 = v527;
                goto LABEL_567;
              }
              uint64_t v31 = a6;
              uint64_t v30 = a3;
              uint64_t v245 = v542;
              uint64_t v246 = a10;
              uint64_t v219 = v527;
              if ((*(__int16 *)(a6 + 2 * v542) & 0x80000000) == 0
                && (*(unsigned __int16 *)(v507 + 2 * v255) | *(unsigned __int16 *)(a6 + 2 * v542)) != *(unsigned __int16 *)(a6 + 2 * v542))
              {
                goto LABEL_499;
              }
              uint64_t v256 = *(void *)(v260 + 24);
              if (v512 + v255)
              {
                BOOL v264 = v256 == 2 || (v261 & v256 & 2) == 0;
                if (!v264 && ((v256 ^ v261) & 0x32) != 0) {
                  goto LABEL_499;
                }
              }
              ++v255;
              uint64_t v339 = (uint64_t)v258;
              if (v542 + v255 >= v519) {
                goto LABEL_486;
              }
            }
            uint64_t v246 = a10;
            if (v339 != 1)
            {
              uint64_t v222 = (uint64_t)a1;
              uint64_t v223 = a4;
LABEL_567:
              v338 = (unsigned __int16 *)v536;
LABEL_529:
              uint64_t v245 = v542;
              goto LABEL_530;
            }
            uint64_t v245 = v542;
            if (v255) {
              goto LABEL_499;
            }
          }
        }
LABEL_486:
        v338 = (unsigned __int16 *)v536;
        if ((*(unsigned char *)(v536 + 35) & 2) != 0 && *(void *)(v246 + 8 * v245))
        {
          uint64_t v222 = (uint64_t)a1;
          uint64_t v223 = a4;
        }
        else
        {
          int v249 = v509 + v339;
          uint64_t v223 = a4;
          if ((*(unsigned char *)(v536 + 27) & 2) == 0 || !*(void *)(v246 + 8 * v249))
          {
            int v250 = *(_DWORD *)(v219 + 16);
            if (v249 + 2 < v250 && (uint64_t v251 = *(void *)(v219 + 8), *(__int16 *)(v251 + 2 * v503) == -1))
            {
              int v252 = v498;
              uint64_t v222 = (uint64_t)a1;
              int v218 = v534;
LABEL_521:
              int v254 = *(unsigned __int16 *)(v251 + 2 * v252);
            }
            else
            {
              uint64_t v222 = (uint64_t)a1;
              int v218 = v534;
              if (v249 < v250)
              {
                uint64_t v251 = *(void *)(v219 + 8);
                int v252 = v509 + v339;
                goto LABEL_521;
              }
              int v254 = 32;
            }
            v266 = sub_16DC8(v254, v222);
            uint64_t v267 = *(void *)(v536 + 24);
            unint64_t v268 = v267 & 0xFFFFFFFFFDFFFFFFLL;
            uint64_t v269 = v267 & v506;
            if (v268) {
              BOOL v270 = v269 == 0;
            }
            else {
              BOOL v270 = 0;
            }
            if (v270) {
              goto LABEL_528;
            }
            uint64_t v271 = v266[3];
            uint64_t v272 = *(void *)(v536 + 32);
            if ((v272 & 0xFFFFFFFFFDFFFFFFLL) != 0 && (v272 & v271) == 0) {
              goto LABEL_528;
            }
            if (*(unsigned char *)(v536 + 48))
            {
              int v273 = v509;
              if ((v509 & 0x80000000) == 0)
              {
                uint64_t v274 = v509;
                while ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v274), v222) + 24) & 2) != 0)
                {
                  BOOL v225 = v274-- <= 0;
                  if (v225)
                  {
                    int v273 = -1;
                    goto LABEL_544;
                  }
                }
                int v273 = v274 + 1;
              }
LABEL_544:
              int v275 = v339;
              LODWORD(v276) = *(_DWORD *)(v219 + 16);
              LODWORD(v339) = v509;
              if ((int)v276 > (int)v509)
              {
                uint64_t v339 = v542;
                while ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v339), v222) + 24) & 2) != 0)
                {
                  ++v339;
                  uint64_t v276 = *(int *)(v219 + 16);
                  if (v339 >= v276) {
                    goto LABEL_550;
                  }
                }
                LODWORD(v339) = v339 - 1;
                LODWORD(v276) = *(_DWORD *)(v219 + 16);
              }
LABEL_550:
              unsigned int v277 = v273 & ~(v273 >> 31);
              unsigned int v278 = v339 - v277 - (v339 == v276);
              int v279 = v278 + 1;
              uint64_t v339 = (uint64_t)malloc_type_calloc((int)(v278 + 2), 1uLL, 0x100004077774924uLL);
              int v280 = sub_16E28((unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v277), v279, (unsigned char *)v339, v222);
              uint64_t v30 = a3;
              if (v280)
              {
                uint64_t v281 = v503 - v277;
                do
                {
                  if (v281 >= (int)(v509 - v277 + v275)) {
                    goto LABEL_556;
                  }
                  char v282 = *(unsigned char *)(v339 + v281++);
                }
                while ((v282 & 1) == 0);
                free((void *)v339);
                goto LABEL_555;
              }
LABEL_556:
              free((void *)v339);
              LODWORD(v339) = v275;
              v338 = (unsigned __int16 *)v536;
              int v218 = v534;
            }
            uint64_t v246 = a10;
            uint64_t v245 = v542;
            switch(v218)
            {
              case '=':
              case '>':
              case '?':
              case '@':
              case 'A':
              case 'B':
              case 'C':
              case 'D':
              case 'G':
              case 'I':
              case 'T':
              case 'X':
              case 'Y':
              case 'n':
                goto LABEL_741;
              case 'E':
              case 'F':
              case 'H':
              case 'K':
              case 'L':
              case 'M':
              case 'N':
              case 'R':
              case 'U':
              case 'o':
                goto LABEL_530;
              case 'J':
                if (!v494) {
                  goto LABEL_530;
                }
                if (sub_17248(v222, v509, v219, 74, (uint64_t)v338, &v551, &v550, &v549, (signed int *)&v547, (unint64_t *)&v546, &v545))goto LABEL_737; {
                goto LABEL_528;
                }
              case 'O':
                if (v470) {
                  goto LABEL_737;
                }
                goto LABEL_528;
              case 'P':
              case 'Q':
                if (v482) {
                  goto LABEL_530;
                }
                int v520 = v339;
                if ((int)v509 < 1)
                {
                  int v285 = 1;
                }
                else
                {
                  uint64_t v283 = 0;
                  uint64_t v284 = v249;
                  while (v284 + 1 <= *(int *)(v219 + 16)
                       && (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * (v480 + v283)), v222)+ 24) & 2) != 0&& (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v284), v222) + 24) & 2) != 0)
                  {
                    --v283;
                    ++v284;
                    if (v468 == v283)
                    {
                      int v285 = v503;
                      goto LABEL_698;
                    }
                  }
                  int v285 = 1 - v283;
                }
LABEL_698:
                int v322 = v285 - 1;
                while (2)
                {
                  if (v322 < 1)
                  {
LABEL_715:
                    uint64_t v30 = a3;
LABEL_555:
                    uint64_t v246 = a10;
                    goto LABEL_567;
                  }
                  uint64_t v323 = (int)v509 - v322;
                  int v324 = sub_1719C((unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v323), (unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v249), v322, v222);
                  if (!v324)
                  {
                    --v322;
LABEL_714:
                    if (v324) {
                      goto LABEL_715;
                    }
                    continue;
                  }
                  break;
                }
                uint64_t v325 = v478;
                while ((int)v325 > 0)
                {
                  int v326 = *(_DWORD *)(v499 + 4 * v325);
                  if (v326 == v323) {
                    break;
                  }
                  --v325;
                  if (v326 < (int)v323) {
                    goto LABEL_714;
                  }
                }
                uint64_t v327 = v503 - v322;
                int v218 = v534;
                while (v327 < v249)
                {
                  if (*(void *)(a10 + 8 * v327++)) {
                    goto LABEL_714;
                  }
                }
                uint64_t v329 = v249 + 1;
                v338 = (unsigned __int16 *)v536;
                while (v329 < v322 + v249)
                {
                  if (*(void *)(a10 + 8 * v329++)) {
                    goto LABEL_714;
                  }
                }
                if ((int)v509 <= v322)
                {
                  int v476 = v322;
                  BOOL v321 = v534 == 81;
                  uint64_t v30 = a3;
                  uint64_t v246 = a10;
                  LODWORD(v339) = v520;
                  goto LABEL_726;
                }
                unsigned int v331 = *((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * ((int)v509 + ~v322)), v222)+ 24) & 2;
                int v476 = v322;
                uint64_t v30 = a3;
                uint64_t v246 = a10;
                LODWORD(v339) = v520;
                uint64_t v245 = v542;
                if ((((v534 != 81) ^ (v331 >> 1)) & 1) == 0) {
                  goto LABEL_530;
                }
LABEL_741:
                v552 = v338;
                if ((v218 & 0xFFFFFFFE) != 0x58) {
                  goto LABEL_753;
                }
                int v217 = v495;
                if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v245), v222) + 24) & 1) == 0)
                {
                  if (v495) {
                    int v335 = HIDWORD(v501);
                  }
                  else {
                    int v335 = 0;
                  }
                  int v336 = v509;
                  if ((int)v509 < *(_DWORD *)(v219 + 16))
                  {
                    uint64_t v337 = v542;
                    do
                    {
                      if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v337), (uint64_t)a1)
                            + 24) & 1) != 0)
                        break;
                      ++v337;
                    }
                    while (v337 < *(int *)(v219 + 16));
                    int v336 = v337;
                  }
                  int v553 = v335;
                  *(_DWORD *)(a4 + 20) = v495;
                  int v217 = v495;
                  int v502 = v501;
                  if (!sub_18F3C(v335, v336, (uint64_t)a1, &v553, v219, a4, a5, a10, (uint64_t *)&v552, a13, a14, a2))goto LABEL_1042; {
                }
                  }
                goto LABEL_423;
              case 'S':
              case 'V':
                uint64_t v286 = v503;
                while (v286 < v249)
                {
                  if (*(void *)(a10 + 8 * v286++))
                  {
                    int v288 = 1;
                    goto LABEL_573;
                  }
                }
                int v288 = 0;
LABEL_573:
                if (v493 | v288 | v497) {
                  goto LABEL_530;
                }
                int v218 = 83;
                goto LABEL_741;
              case 'W':
                if (!v482) {
                  goto LABEL_737;
                }
                goto LABEL_528;
              case 'Z':
                if (v482) {
                  goto LABEL_530;
                }
                v552 = v338;
                if (!v474 && !sub_19B00(v222, v509, v219, v506)
                  || (v271 & 2) != 0
                  || !((v492 == 90) | v271 & 1)
                  || (int v218 = 90, !sub_19B70(v222, v509, a2, v219, 90, v339, v467)))
                {
                  int v218 = 83;
                }
                goto LABEL_738;
              case '[':
                if (v482) {
                  goto LABEL_530;
                }
                uint64_t v289 = v503;
                while (v289 < v249)
                {
                  if (*(void *)(a10 + 8 * v289++)) {
                    goto LABEL_530;
                  }
                }
LABEL_589:
                if (!*(_DWORD *)(v222 + 944))
                {
                  if (v474 && (v271 & 9) != 0) {
                    goto LABEL_741;
                  }
                  goto LABEL_530;
                }
                int v291 = v218;
                uint64_t v292 = v509;
                while ((int)v292 >= 1)
                {
                  uint64_t v293 = v292 - 1;
                  v294 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v292 - 2), v222);
                  uint64_t v245 = v542;
                  uint64_t v246 = a10;
                  uint64_t v292 = v293;
                  if ((v294[25] & 0x40) == 0)
                  {
                    v295 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v293), v222);
                    uint64_t v245 = v542;
                    uint64_t v246 = a10;
                    if ((v295[12] & 0x2001) == 0) {
                      goto LABEL_530;
                    }
                    break;
                  }
                }
                int v296 = v509 + (__int16)v338[25];
                int v297 = *(_DWORD *)(v219 + 16);
                if (v296 >= v297)
                {
                  int v218 = v291;
                  goto LABEL_741;
                }
                while (2)
                {
                  unint64_t v298 = *(unsigned int *)(v222 + 1696);
                  if (v298) {
                    BOOL v299 = v296 <= v297;
                  }
                  else {
                    BOOL v299 = 0;
                  }
                  if (!v299 || (int)v298 < 1)
                  {
LABEL_603:
                    int v304 = v296;
                    goto LABEL_604;
                  }
                  int v302 = 0;
                  uint64_t v303 = 488;
                  int v304 = v296;
                  while (2)
                  {
                    if (!v302)
                    {
                      int v302 = *(unsigned __int16 *)(v222 + 2 * v303);
                      if (*(_WORD *)(v222 + 2 * v303))
                      {
LABEL_612:
                        if (*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v304) == v302)
                        {
                          int v302 = 1;
                        }
                        else
                        {
                          int v304 = v296 - 1;
                          int v302 = -1;
                        }
                      }
LABEL_618:
                      if (v304 >= v297) {
                        goto LABEL_603;
                      }
                      ++v304;
                      unint64_t v305 = v303 - 487;
                      ++v303;
                      if (v305 >= v298) {
                        goto LABEL_603;
                      }
                      continue;
                    }
                    break;
                  }
                  if (v302 != 1)
                  {
                    if (*(_WORD *)(v222 + 2 * v303))
                    {
                      int v302 = -1;
                    }
                    else
                    {
                      int v304 = v296 - 1;
                      int v302 = 0;
                    }
                    goto LABEL_618;
                  }
                  int v302 = *(unsigned __int16 *)(v222 + 2 * v303);
                  if (*(_WORD *)(v222 + 2 * v303)) {
                    goto LABEL_612;
                  }
                  if (v304 >= v297)
                  {
LABEL_739:
                    uint64_t v246 = a10;
                    int v218 = v291;
                    goto LABEL_740;
                  }
LABEL_604:
                  uint64_t v301 = v304;
                  if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v304), v222) + 25) & 0x80) != 0)
                  {
                    int v296 = v301 + 1;
                    int v297 = *(_DWORD *)(v219 + 16);
                    if ((int)v301 + 1 >= v297) {
                      goto LABEL_739;
                    }
                    continue;
                  }
                  break;
                }
                BOOL v321 = (*((_WORD *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v301), v222) + 12) & 0x2001) == 0;
                uint64_t v246 = a10;
                int v218 = v291;
LABEL_726:
                uint64_t v245 = v542;
                if (!v321) {
                  goto LABEL_741;
                }
LABEL_530:
                uint64_t v234 = *((unsigned int *)v338 + 4);
                int v239 = v510;
                if (!v234)
                {
                  uint64_t v234 = 0;
                  goto LABEL_734;
                }
                continue;
              case '\\':
                if (v482) {
                  goto LABEL_530;
                }
                if (((v506 | v271) & 2) != 0) {
                  goto LABEL_737;
                }
                goto LABEL_528;
              case ']':
                char v306 = v479;
                if ((v271 & 1) == 0) {
                  char v306 = 1;
                }
                if ((v306 & 1) != 0 || (int)v478 + (__int16)v338[26] >= v469) {
                  goto LABEL_530;
                }
                uint64_t v307 = v249;
                do
                {
                  uint64_t v308 = v307 + 1;
                  if (v307 + 1 >= *(int *)(v219 + 16)) {
                    goto LABEL_528;
                  }
                  v309 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v307 + 2), v222);
                  uint64_t v307 = v308;
                }
                while ((v309[24] & 1) != 0);
                if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v308), v222) + 24) & 4) == 0) {
                  goto LABEL_528;
                }
                int v218 = 93;
                goto LABEL_1021;
              case '^':
                char v310 = v479;
                if ((v271 & 1) == 0) {
                  char v310 = 1;
                }
                if (v310) {
                  goto LABEL_530;
                }
                uint64_t v311 = v249 + 1;
                do
                {
                  if (v311 >= *(int *)(v219 + 16)) {
                    goto LABEL_695;
                  }
                  uint64_t v312 = *((void *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v311), v222) + 3);
                  uint64_t v245 = v542;
                  ++v311;
                }
                while ((v312 & 1) != 0);
                if ((v312 & 0x102) == 0)
                {
LABEL_695:
                  uint64_t v246 = a10;
                  goto LABEL_530;
                }
                int v218 = 94;
                if (sub_19B70(v222, v509, a2, v219, 94, v339, v467))
                {
LABEL_1021:
                  uint64_t v246 = a10;
LABEL_740:
                  uint64_t v245 = v542;
                  goto LABEL_741;
                }
                goto LABEL_528;
              case '_':
                if (v471 || v492 == 94) {
                  goto LABEL_530;
                }
                if (v271) {
                  goto LABEL_737;
                }
                goto LABEL_528;
                goto LABEL_589;
              case 'a':
                BOOL v313 = (v271 & 0xB) == 0;
                goto LABEL_651;
              case 'b':
                BOOL v313 = (v271 & 9) == 0;
                goto LABEL_653;
              case 'c':
                BOOL v313 = (v271 & 2) == 0;
LABEL_651:
                char v314 = v479;
                goto LABEL_677;
              case 'd':
                BOOL v313 = (v271 & 2) == 0;
LABEL_653:
                char v314 = v475;
                goto LABEL_677;
              case 'e':
                BOOL v313 = (v271 & 2) == 0;
                goto LABEL_658;
              case 'f':
                uint64_t v315 = 11;
                goto LABEL_657;
              case 'g':
                uint64_t v315 = 9;
LABEL_657:
                BOOL v313 = (v271 & v315) == 0;
LABEL_658:
                char v314 = v477;
                goto LABEL_677;
              case 'h':
                if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v542), v222) + 24) & 8) == 0
                  || (int)v509 >= 1
                  && (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v480), v222) + 24) & 2) != 0
                  || v249 >= *(_DWORD *)(v219 + 16))
                {
                  goto LABEL_528;
                }
                uint64_t v316 = v542 + (int)v339;
                int v317 = v502;
                while ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v316), v222) + 24) & 6) == 0)
                {
                  if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v316), v222) + 24) & 1) == 0
                    && ++v316 < *(int *)(v219 + 16))
                  {
                    continue;
                  }
                  goto LABEL_528;
                }
                v552 = v338;
                int v218 = 104;
                goto LABEL_914;
              case 'i':
                if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v542), v222) + 24) & 8) == 0) {
                  goto LABEL_528;
                }
                if (*(_DWORD *)(v219 + 16) - 1 <= (int)v509)
                {
                  int v317 = v502;
                  if ((v509 & 0x80000000) != 0)
                  {
LABEL_528:
                    uint64_t v246 = a10;
                    goto LABEL_529;
                  }
                }
                else
                {
                  v318 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v503), v222);
                  int v317 = v502;
                  if ((v509 & 0x80000000) != 0 || (v318[3] & 2) != 0) {
                    goto LABEL_528;
                  }
                }
                uint64_t v332 = v509;
                while ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v332), v222) + 24) & 6) == 0)
                {
                  v333 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v219 + 8) + 2 * v332), v222);
                  if ((int)v332 >= 1)
                  {
                    --v332;
                    if ((v333[3] & 1) == 0) {
                      continue;
                    }
                  }
                  goto LABEL_528;
                }
                v552 = v338;
                int v218 = 105;
LABEL_914:
                uint64_t v246 = a10;
                goto LABEL_754;
              case 'j':
                if (!v474) {
                  goto LABEL_530;
                }
                if ((v271 & 4) != 0) {
                  goto LABEL_737;
                }
                goto LABEL_528;
              case 'k':
                BOOL v313 = (v271 & 4) == 0;
                char v314 = v473;
LABEL_677:
                if (v313) {
                  char v314 = 1;
                }
                if ((v314 & 1) == 0) {
                  goto LABEL_737;
                }
                goto LABEL_528;
              case 'l':
                if ((v472 & 1) == 0) {
                  goto LABEL_528;
                }
LABEL_737:
                v552 = v338;
LABEL_738:
                uint64_t v246 = a10;
                goto LABEL_753;
              case 'm':
                if ((v271 & 4) == 0) {
                  goto LABEL_530;
                }
                v552 = v338;
                if ((v506 & 4) != 0) {
                  int v218 = 107;
                }
                else {
                  int v218 = 109;
                }
                goto LABEL_753;
              case 'p':
                if (v482) {
                  goto LABEL_530;
                }
                uint64_t v319 = v503;
                while (v319 < v249)
                {
                  if (*(void *)(a10 + 8 * v319++)) {
                    goto LABEL_530;
                  }
                }
                uint64_t v334 = v222 + 8 * *((unsigned int *)v338 + 10);
                if (!_lou_pattern_check(*(void *)(v219 + 8), v480, 0xFFFFFFFF, 0xFFFFFFFFLL, v334 + 31618, v222)
                  || !_lou_pattern_check(*(void *)(v219 + 8), v509 + (__int16)v338[25], *(_DWORD *)(v219 + 16), 1, v334 + 31616 + 2 * *(unsigned __int16 *)(v334 + 31616), v222))
                {
                  goto LABEL_528;
                }
                int v218 = 112;
                goto LABEL_1021;
              default:
                goto LABEL_528;
            }
          }
          uint64_t v222 = (uint64_t)a1;
        }
        break;
      }
      int v239 = v510;
LABEL_734:
      if (!++v239) {
        continue;
      }
      break;
    }
    if (v239 == 1)
    {
      if (v504 > 0)
      {
        int v504 = 1;
        uint64_t v247 = v481;
LABEL_482:
        uint64_t v234 = *v247;
        goto LABEL_483;
      }
      goto LABEL_483;
    }
    if (v239 != 2) {
      goto LABEL_483;
    }
    v338 = (unsigned __int16 *)&unk_29EC0;
    v552 = (unsigned __int16 *)&unk_29EC0;
    int v218 = 117;
    dword_29EEC = 117;
    LODWORD(v339) = 1;
    word_29EF2 = 1;
    word_29EF6 = *(_WORD *)(*(void *)(v219 + 8) + 2 * v245);
    word_29EF4 = 0;
LABEL_753:
    int v317 = v502;
LABEL_754:
    int v521 = v339;
    if (v476)
    {
      int v340 = v339 + v509;
      int v553 = v339 + v509;
    }
    else
    {
      int v340 = v553;
    }
    if (v317 <= v340)
    {
      do
      {
        uint64_t v341 = v246;
        sub_19168(0, 1, 1, 0, v317, v222, v340, v527, v223, a5, v246, a13, a14);
        if (a11)
        {
          sub_19168(0, 1, 0, 1, v317, v222, v340, v527, v223, a5, v341, a13, a14);
          sub_19168(1uLL, 0, 0, 1, v317, v222, v340, v527, v223, a5, v341, a13, a14);
        }
        if (v317 < v340) {
          sub_19168(1uLL, 0, 1, 0, v317, v222, v340, v527, v223, a5, a10, a13, a14);
        }
        ++v317;
        uint64_t v246 = a10;
      }
      while (v340 + 1 != v317);
    }
    int v502 = v340 + 1;
    int v543 = v340;
    if (v218 == 96)
    {
      uint64_t v342 = *(unsigned int *)(v222 + 968);
      int v217 = v495;
      v343 = (unsigned int *)v527;
      uint64_t v31 = a6;
      if (v342) {
        sub_18BDC((void *)(v222 + 8 * v342 + 31670), 0, *(__int16 *)(v222 + 8 * v342 + 31668), 0, v340, v527, v223, a5, a13, a14);
      }
      uint64_t v344 = *(unsigned int *)(v222 + 960);
      if (v344)
      {
        uint64_t v345 = v222 + 8 * v344;
        v346 = (void *)(v345 + 31670);
        int v347 = *(__int16 *)(v345 + 31668);
        goto LABEL_768;
      }
      goto LABEL_797;
    }
    uint64_t v348 = *(unsigned int *)(v222 + 960);
    int v217 = v495;
    v343 = (unsigned int *)v527;
    uint64_t v31 = a6;
    if (!v348) {
      goto LABEL_797;
    }
    if (*(_DWORD *)(v527 + 16) <= v543) {
      goto LABEL_797;
    }
    v349 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v527 + 8) + 2 * v543), v222);
    if ((v506 & 2) != 0) {
      goto LABEL_797;
    }
    if ((v349[3] & 2) == 0) {
      goto LABEL_797;
    }
    if (*(_DWORD *)(v527 + 16) > v502)
    {
      v350 = sub_16DC8(*(unsigned __int16 *)(*(void *)(v527 + 8) + 2 * v502), v222);
      if ((v506 & 4) == 0 && (v350[3] & 2) != 0) {
        goto LABEL_797;
      }
    }
    uint64_t v351 = *(void *)(v527 + 8);
    if (v543 >= 1)
    {
      unint64_t v352 = *(unsigned int *)(v222 + 2676);
      if ((int)v352 >= 1)
      {
        int v353 = *(unsigned __int16 *)(v351 + 2 * (v543 - 1));
        if (*(unsigned __int16 *)(v222 + 2548) == v353) {
          goto LABEL_797;
        }
        unint64_t v354 = 0;
        do
        {
          if (v352 - 1 == v354) {
            goto LABEL_784;
          }
          int v355 = *(unsigned __int16 *)(v486 + 2 * v354++);
        }
        while (v355 != v353);
        if (v354 < v352) {
          goto LABEL_797;
        }
      }
    }
LABEL_784:
    unint64_t v356 = *(unsigned int *)(v222 + 3192);
    if ((int)v356 >= 1)
    {
      int v357 = *(unsigned __int16 *)(v351 + 2 * v543);
      if (*(unsigned __int16 *)(v222 + 2680) == v357) {
        goto LABEL_797;
      }
      unint64_t v358 = 0;
      do
      {
        if (v356 - 1 == v358) {
          goto LABEL_790;
        }
        int v359 = *(unsigned __int16 *)(v487 + 2 * v358++);
      }
      while (v359 != v357);
      if (v358 < v356) {
        goto LABEL_797;
      }
    }
LABEL_790:
    if (v502 < *(_DWORD *)(v527 + 16))
    {
      unint64_t v360 = *(unsigned int *)(v222 + 3324);
      if ((int)v360 >= 1)
      {
        int v361 = *(unsigned __int16 *)(v351 + 2 * v502);
        if (*(unsigned __int16 *)(v222 + 3196) == v361) {
          goto LABEL_797;
        }
        unint64_t v362 = 0;
        do
        {
          if (v360 - 1 == v362) {
            goto LABEL_971;
          }
          int v363 = *(unsigned __int16 *)(v483 + 2 * v362++);
        }
        while (v363 != v361);
        if (v362 < v360) {
          goto LABEL_797;
        }
      }
    }
LABEL_971:
    v346 = (void *)(v222 + 8 * v348 + 31670);
    int v347 = *(__int16 *)(v222 + 8 * v348 + 31668);
LABEL_768:
    if (sub_18BDC(v346, 0, v347, 0, v543, (uint64_t)v343, v223, a5, a13, a14))
    {
LABEL_797:
      sub_19168(1uLL, 0, 1, 0, v543, v222, v543, (uint64_t)v343, v223, a5, a10, a13, a14);
      uint64_t v364 = *(unsigned int *)(v222 + 964);
      if (*(_DWORD *)(v222 + 948))
      {
        int v365 = v218;
        if (!*(_DWORD *)(v222 + 964)) {
          goto LABEL_834;
        }
      }
      else
      {
        if (!*(_DWORD *)(v222 + 964)) {
          goto LABEL_837;
        }
        if ((int)v343[4] > v543
          && (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v543), v222) + 24) & 4) != 0)
        {
          BOOL v367 = (v506 & 4) != 0 || v492 == 107;
          BOOL v368 = !v367;
          if ((v492 == 84 || v368)
            && !sub_18BDC((void *)(v222 + 8 * v364 + 31670), 0, *(__int16 *)(v222 + 8 * v364 + 31668), 0, v543, (uint64_t)v343, v223, a5, a13, a14))
          {
            break;
          }
        }
        if (!*(_DWORD *)(v222 + 948)) {
          goto LABEL_837;
        }
        int v365 = v218;
        uint64_t v364 = *(unsigned int *)(v222 + 964);
        if (!*(_DWORD *)(v222 + 964)) {
          goto LABEL_834;
        }
      }
      uint64_t v366 = *((void *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v543), v222) + 3);
      if (!v490)
      {
        if ((v366 & 0x104) == 0)
        {
          if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v543), v222) + 25) & 8) != 0)
          {
            uint64_t v376 = v543 + 1;
            do
            {
              if (v376 >= (int)v343[4]) {
                break;
              }
              if ((*((_WORD *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v376), v222) + 12) & 0x104) != 0) {
                goto LABEL_835;
              }
              v377 = sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v376++), v222);
            }
            while ((v377[25] & 8) != 0);
          }
LABEL_833:
          int v490 = 0;
LABEL_834:
          int v218 = v365;
          goto LABEL_837;
        }
        uint64_t v369 = *(unsigned int *)(v222 + 968);
        if (v369)
        {
          uint64_t v370 = *(unsigned int *)(v222 + 972);
          int v218 = v365;
          if (v370)
          {
            uint64_t v371 = v222 + 8 * v369 + 31616;
            uint64_t v372 = v222 + 8 * v370 + 31616;
            int v373 = *(unsigned __int16 *)(v371 + 52);
            if (v373 == *(unsigned __int16 *)(v372 + 52))
            {
              int v374 = memcmp((const void *)(v371 + 54), (const void *)(v372 + 54), 2 * (__int16)v373);
              int v375 = v497;
              if (!v374) {
                int v375 = 1;
              }
              int v497 = v375;
            }
          }
          int v490 = 1;
        }
        else
        {
LABEL_835:
          int v490 = 1;
          int v218 = v365;
        }
LABEL_836:
        sub_18BDC((void *)(v222 + 8 * v364 + 31670), 0, *(__int16 *)(v222 + 8 * v364 + 31668), 0, v543, (uint64_t)v343, v223, a5, a13, a14);
        goto LABEL_837;
      }
      if ((v366 & 0x4000904) != 0) {
        goto LABEL_834;
      }
      uint64_t v364 = *(unsigned int *)(v222 + 972);
      if (!v364) {
        goto LABEL_833;
      }
      int v490 = 0;
      int v218 = v365;
      if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v543), v222) + 25) & 0x10) != 0) {
        goto LABEL_836;
      }
LABEL_837:
      if (v218 != 74)
      {
        if (!v494) {
          goto LABEL_851;
        }
        v380 = v338;
        uint64_t v381 = *v488;
        if (!v381)
        {
LABEL_850:
          v338 = v380;
          v552 = v380;
          uint64_t v31 = a6;
          v343 = (unsigned int *)v527;
LABEL_851:
          if (qword_29E50)
          {
            uint64_t v384 = dword_29E48;
            int v385 = v521;
            int v386 = v543;
            if (dword_29E48 < dword_29E58)
            {
              ++dword_29E48;
              *(void *)(qword_29E50 + 8 * v384) = v338;
            }
LABEL_859:
            uint64_t v387 = v386;
            if ((*((_WORD *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v386), v222) + 12) & 0x2001) != 0) {
              int v388 = 0;
            }
            else {
              int v388 = v497;
            }
            if (v218 <= 107)
            {
              int v389 = v476;
              switch(v218)
              {
                case 'O':
                  goto LABEL_872;
                case 'P':
                case 'Q':
                  int v485 = v543 - (v476 + v385);
                  goto LABEL_873;
                case 'R':
                case 'S':
                case 'T':
                case 'U':
                case 'V':
                case 'X':
                case 'Y':
                  goto LABEL_873;
                case 'W':
                  BOOL v494 = 1;
                  int v218 = 87;
                  if (v388) {
                    goto LABEL_423;
                  }
                  int v497 = 0;
                  BOOL v494 = 1;
                  if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v387), (uint64_t)a1) + 24) & 1) != 0
                    || (a2 & 1) != 0)
                  {
                    goto LABEL_423;
                  }
                  int v457 = HIDWORD(v501);
                  if (!v217) {
                    int v457 = 0;
                  }
                  int v553 = v457;
                  *(_DWORD *)(a4 + 20) = v217;
                  int v497 = 1;
                  int v502 = v501;
                  continue;
                case 'Z':
                  if (v492 != 90)
                  {
                    int v218 = 90;
                    goto LABEL_919;
                  }
                  int v404 = *(_DWORD *)(a4 + 20);
                  if (v404 > 0)
                  {
                    v405 = v338;
                    int v406 = v218;
                    int v407 = 0;
                    uint64_t v408 = *(void *)(a4 + 8);
                    do
                    {
                      if ((*((unsigned char *)sub_18750(*(unsigned __int16 *)(v408 + 2 * (v404 - 1)), (uint64_t)a1)+ 24) & 1) == 0)break; {
                      uint64_t v408 = *(void *)(a4 + 8);
                      }
                      int v409 = *(_DWORD *)(a4 + 20);
                      if (*(__int16 *)(v408 + 2 * (v409 - 1)) == -1) {
                        int v407 = 1;
                      }
                      BOOL v410 = __OFSUB__(v409, 1);
                      int v404 = v409 - 1;
                      *(_DWORD *)(a4 + 20) = v404;
                    }
                    while (!((v404 < 0) ^ v410 | (v404 == 0)));
                    if (v407)
                    {
                      uint64_t v411 = *(int *)(a4 + 20);
                      *(_WORD *)(*(void *)(a4 + 8) + 2 * v411) = -1;
                      *(_DWORD *)(a4 + 20) = v411 + 1;
                    }
                    int v218 = v406;
                    v338 = v405;
                    goto LABEL_873;
                  }
                  v396 = &v338[v385 + 27];
                  int v397 = (__int16)v338[26];
                  int v218 = 90;
                  if (v338[26]) {
                    goto LABEL_921;
                  }
                  break;
                default:
                  if (v218 != 61) {
                    goto LABEL_873;
                  }
LABEL_872:
                  int v388 = 0;
                  goto LABEL_873;
              }
LABEL_886:
              if (v385 >= 1)
              {
                v528 = v338;
                int v400 = v218;
                int v401 = 0;
                uint64_t v402 = (uint64_t)v554;
                while (sub_18AC8(*(unsigned __int16 *)(*(void *)(v402 + 8) + 2 * v387), (uint64_t)a1, v543 + v401, v402, a4, a5, a13, a14, a2))
                {
                  ++v387;
                  ++v401;
                  if (v387 >= *(int *)(v402 + 16) || v401 >= v385)
                  {
                    int v390 = v543 + v401;
                    int v389 = v476;
                    int v218 = v400;
                    v338 = v528;
                    goto LABEL_917;
                  }
                }
                int v553 = v543 + v401;
                break;
              }
              int v390 = v543;
LABEL_917:
              int v553 = v390;
LABEL_926:
              if (v218 <= 92)
              {
                if (v218 == 79)
                {
                  uint64_t v429 = (uint64_t)v554;
                  int v430 = v554[4] - v385;
                  if (v430 > a15 && v491 != 0) {
                    int v430 = a15 - 1;
                  }
                  if (v390 <= v430)
                  {
                    v432 = v338 + 27;
                    uint64_t v433 = v390;
                    uint64_t v434 = v430;
                    while (sub_1719C(v432, (unsigned __int16 *)(*(void *)(v429 + 8) + 2 * v433), v385, (uint64_t)a1))
                    {
                      if (*a14)
                      {
                        uint64_t v435 = v433 + v385;
                      }
                      else
                      {
                        uint64_t v436 = *a13;
                        uint64_t v435 = v433 + v385;
                        if (v433 <= v436 && v435 > v436)
                        {
                          *a14 = 1;
                          *a13 = *(_DWORD *)(a4 + 20) - 1;
                        }
                      }
                      uint64_t v433 = v435;
                      if (v435 > v434) {
                        goto LABEL_1010;
                      }
                    }
                    LODWORD(v435) = v433;
LABEL_1010:
                    int v390 = v435;
                    int v217 = v495;
                  }
                  int v553 = v390;
                  int v218 = 79;
                }
                else
                {
                  int v537 = v388;
                  int v413 = v390;
                  if (v218 == 80) {
                    goto LABEL_978;
                  }
                  if (v218 == 81)
                  {
                    size_t v414 = 0;
                    uint64_t v415 = 0;
                    uint64_t v416 = 0;
                    v417 = v338;
                    v418 = &v338[v385];
                    v419 = v418 + 27;
                    v420 = (char *)(v418 + 28);
                    do
                    {
                      uint64_t v421 = v416;
                      int v422 = *(unsigned __int16 *)&v420[v414];
                      --v416;
                      v415 += 0x100000000;
                      v414 += 2;
                    }
                    while (v422 != 44);
                    uint64_t v423 = *(unsigned int *)(a4 + 20);
                    if ((int)v423 - (int)v416 > *(_DWORD *)(a4 + 16)) {
                      break;
                    }
                    if ((int)v423 > 0)
                    {
                      while (1)
                      {
                        int v424 = *(_DWORD *)(v499 + 4 * v423);
                        if (v424 < v485) {
                          break;
                        }
                        *(_WORD *)(*(void *)(a4 + 8) + 2 * v423 + 2 * -(int)v416 - 2) = *(_WORD *)(*(void *)(a4 + 8) + 2 * v423 - 2);
                        *(_DWORD *)(v499 + 4 * -(int)v416 + 4 * v423--) = v424;
                        if ((unint64_t)(v423 + 1) <= 1)
                        {
                          int v425 = 0;
                          goto LABEL_973;
                        }
                      }
                    }
                    int v425 = v423;
LABEL_973:
                    memcpy((void *)(*(void *)(a4 + 8) + 2 * v425), v419, v414);
                    uint64_t v438 = 0;
                    do
                      *(_DWORD *)(a5 + 4 * v425 + 4 * v438++) = *(_DWORD *)(a5 + 4 * v425);
                    while (v421 + v438 != 1);
                    *(_DWORD *)(a4 + 20) -= v416;
                    v338 = v417;
                    if (*a14 && *a13 >= v425) {
                      *a13 -= v416;
                    }
LABEL_978:
                    int v535 = v218;
                    uint64_t v439 = (uint64_t)v554;
                    if ((int)v554[4] <= a15 || v491 == 0) {
                      int v441 = v554[4];
                    }
                    else {
                      int v441 = a15;
                    }
                    int v442 = v413 + v389;
                    if (v413 + v389 <= v441)
                    {
                      char v443 = 0;
                      v529 = v338 + 27;
                      uint64_t v444 = *((void *)v554 + 1);
                      int v445 = v413 - 1;
                      do
                      {
                        if (!sub_1719C((unsigned __int16 *)(v444 + 2 * v485), (unsigned __int16 *)(v444 + 2 * v413), v389, (uint64_t)a1))break; {
                        if (v443)
                        }
                        {
                          uint64_t v446 = v445 + 1;
                          while (v446 < v413 + v389 - 1)
                          {
                            if (*(void *)(a10 + 8 * v446++)) {
                              goto LABEL_1004;
                            }
                          }
                        }
                        if (!*a14 && *a13 >= v413 - v385 && *a13 < v442)
                        {
                          *a14 = 1;
                          *a13 = *(_DWORD *)(a4 + 20) - 1;
                        }
                        int v413 = v442 + v385;
                        if (v442 + v385 > v441) {
                          break;
                        }
                        uint64_t v444 = *(void *)(v439 + 8);
                        int v449 = memcmp(v529, (const void *)(v444 + 2 * v442), 2 * v385);
                        int v442 = v413 + v389;
                        v445 += v389 + v385;
                        char v443 = 1;
                      }
                      while (!v449 && v442 <= v441);
                    }
LABEL_1004:
                    v413 -= v385;
                    int v553 = v413;
                    uint64_t v31 = a6;
                    uint64_t v30 = a3;
                    int v217 = v495;
                    int v218 = v535;
                  }
                  int v390 = v413;
                  int v388 = v537;
                }
LABEL_1012:
                if (a7)
                {
                  int v451 = *(unsigned __int8 *)(a7 + v390);
                  if ((v451 - 48) <= 9) {
                    *(unsigned char *)(a8 + *(int *)(a4 + 20)) = v451;
                  }
                }
                BOOL v452 = (v218 - 62) >= 0xA && (v218 - 83) >= 0x23;
                int v453 = v492;
                if (!v452) {
                  int v453 = v218;
                }
                int v492 = v453;
                BOOL v494 = 1;
                int v497 = v388;
                goto LABEL_423;
              }
              if ((v218 - 93) >= 2) {
                goto LABEL_1012;
              }
              LODWORD(v391) = v390;
              int v426 = v218;
              uint64_t v427 = (uint64_t)v554;
              if ((int)v391 < (int)v554[4])
              {
                uint64_t v391 = (int)v391;
                uint64_t v428 = *((void *)v554 + 1);
                do
                {
                  if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(v428 + 2 * v391), (uint64_t)a1) + 24) & 1) == 0) {
                    break;
                  }
                  uint64_t v428 = *(void *)(v427 + 8);
                  if (*(__int16 *)(v428 + 2 * v391) == -1) {
                    break;
                  }
                  ++v391;
                }
                while (v391 < *(int *)(v427 + 16));
              }
              int v553 = v391;
              int v218 = v426;
LABEL_944:
              int v390 = v391;
              goto LABEL_1012;
            }
            int v389 = v476;
            if (v218 == 109)
            {
              if (!a1[237])
              {
                uint64_t v412 = a1[241];
                if (v412)
                {
                  if (!sub_18BDC((char *)&a1[2 * v412 + 7917] + 2 * SHIWORD(a1[2 * v412 + 7916]) + 2, SHIWORD(a1[2 * v412 + 7916]), SLOWORD(a1[2 * v412 + 7917]), 0, v543, (uint64_t)v343, a4, a5, a13, a14))break; {
                }
                  }
              }
              int v218 = 107;
LABEL_919:
              v396 = &v338[v385 + 27];
              int v397 = (__int16)v338[26];
            }
            else
            {
              if (v218 == 108)
              {
                if (a1[240]
                  && (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v343 + 1) + 2 * v387), (uint64_t)a1) + 24) & 2) != 0)
                {
                  --*(_DWORD *)(a4 + 20);
                }
                int v218 = 108;
                goto LABEL_919;
              }
LABEL_873:
              if (v218 == 117)
              {
                if (!sub_18AC8(*(unsigned __int16 *)(*((void *)v554 + 1) + 2 * v387), (uint64_t)a1, v543, (uint64_t)v554, a4, a5, a13, a14, a2))break; {
                int v553 = v502;
                }
                int v218 = 117;
                int v390 = v502;
                goto LABEL_1012;
              }
              if (v218 == 73)
              {
                int v390 = v385 + v543;
                int v553 = v385 + v543;
                if ((__int16)v338[26] < 1)
                {
                  int v218 = 73;
                  goto LABEL_1012;
                }
                LODWORD(v391) = v385 + v543;
                v392 = &v338[v385 + 27];
                uint64_t v393 = v338[26];
                uint64_t v394 = (uint64_t)v554;
                do
                {
                  int v395 = *v392++;
                  if (!sub_18AC8(v395, (uint64_t)a1, v391, v394, a4, a5, a13, a14, a2)) {
                    goto LABEL_1042;
                  }
                  --v393;
                }
                while (v393);
                int v218 = 73;
                goto LABEL_944;
              }
              v396 = &v338[v385 + 27];
              int v397 = (__int16)v338[26];
              if (v218 == 81)
              {
                uint64_t v398 = 0;
                do
                  int v399 = v338[v385 + 28 + v398++];
                while (v399 != 44);
                v396 += (v398 + 1);
                v397 += ~v398;
                int v218 = 81;
                if (!v397) {
                  goto LABEL_886;
                }
                goto LABEL_921;
              }
            }
            if (!v397) {
              goto LABEL_886;
            }
LABEL_921:
            if (v389)
            {
              int v390 = v543;
              if (!sub_18BDC(v396, 0, v397, 0, v543, (uint64_t)v554, a4, a5, a13, a14)) {
                break;
              }
            }
            else
            {
              if (!sub_18BDC(v396, v385, v397, 0, v543, (uint64_t)v554, a4, a5, a13, a14)) {
                break;
              }
              int v553 = v385 + v543;
              int v390 = v385 + v543;
            }
            goto LABEL_926;
          }
          int v385 = v521;
LABEL_858:
          int v386 = v543;
          goto LABEL_859;
        }
        while (1)
        {
          uint64_t v382 = v222 + 8 * v381;
          v338 = (unsigned __int16 *)(v382 + 31616);
          int v383 = *(_DWORD *)(v382 + 31660);
          if (sub_17248(v222, v543, v527, v383, v382 + 31616, &v551, &v550, &v549, (signed int *)&v547, (unint64_t *)&v546, &v545))break; {
          uint64_t v381 = *((unsigned int *)v338 + 4);
          }
          if (!v381) {
            goto LABEL_850;
          }
        }
        v552 = v338;
        if (v383 != 74)
        {
          int v385 = 0;
          int v218 = v383;
          uint64_t v31 = a6;
          v343 = (unsigned int *)v527;
          goto LABEL_858;
        }
        uint64_t v31 = a6;
        v343 = (unsigned int *)v527;
        uint64_t v223 = a4;
      }
      if (qword_29E50)
      {
        uint64_t v378 = dword_29E48;
        if (dword_29E48 < dword_29E58)
        {
          ++dword_29E48;
          *(void *)(qword_29E50 + 8 * v378) = v338;
        }
      }
      if (!sub_17E1C(v222, (uint64_t *)&v554, v223, a5, 74, (uint64_t)&v552, v551, v550, v549, &v553, v547, v548, SHIDWORD(v548), a13, a14, v546, v545, v466))break; {
      uint64_t v379 = *v343;
      }
      if (*v554 != v379 && v379 != *(_DWORD *)v30) {
        sub_12AD8(v379);
      }
      BOOL v494 = v553 != v543;
      int v218 = 74;
      goto LABEL_423;
    }
    break;
  }
LABEL_1042:
  int v461 = v553;
  v462 = v554;
  if (v217)
  {
    uint64_t v463 = (uint64_t)a1;
    if (v553 < (int)v554[4]
      && (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v554 + 1) + 2 * v553), (uint64_t)a1) + 24) & 1) == 0)
    {
      *(_DWORD *)(a4 + 20) = v217;
      int v461 = HIDWORD(v501);
    }
  }
  else
  {
    uint64_t v463 = (uint64_t)a1;
  }
  if (v461 < (int)v462[4])
  {
    uint64_t v464 = 2 * v461;
    do
    {
      if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*((void *)v462 + 1) + v464), v463) + 24) & 1) == 0) {
        break;
      }
      ++v461;
      v464 += 2;
    }
    while (v461 != v462[4]);
  }
  *a12 = v461;
  uint64_t result = *v462;
  if (result != *(_DWORD *)v30) {
    return sub_12AD8(result);
  }
  return result;
}

uint64_t lou_translatePrehyphenated(char *a1, unsigned __int16 *a2, int *a3, unsigned __int16 *a4, int *a5, __int16 *a6, unsigned char *a7, void *__b, uint64_t a9, unsigned int *a10, uint64_t a11, uint64_t a12, int a13)
{
  uint64_t v15 = a6;
  int v17 = a4;
  uint64_t v21 = a9;
  if (a11)
  {
    if (a12)
    {
      if (a9)
      {
        int v22 = 0;
      }
      else
      {
        uint64_t v32 = a7;
        int v24 = malloc_type_malloc(4 * *a5, 0x100004052888210uLL);
        int v17 = a4;
        uint64_t v15 = a6;
        a7 = v32;
        uint64_t v21 = (uint64_t)v24;
        int v22 = v24;
        if (!v24) {
          _lou_outOfMemory();
        }
      }
      uint64_t v33 = v22;
      if (_lou_translate(a1, a1, a2, a3, v17, a5, v15, a7, __b, v21, a10, a13, 0, 0) && *a5 >= 1)
      {
        uint64_t v25 = 0;
        int v26 = 0;
        while (1)
        {
          uint64_t v27 = *(unsigned int *)(v21 + 4 * v25);
          if ((int)v27 < v26) {
            break;
          }
          if ((int)v27 <= v26) {
            char v28 = 48;
          }
          else {
            char v28 = *(unsigned char *)(a11 + v27);
          }
          *(unsigned char *)(a12 + v25++) = v28;
          int v26 = v27;
          if (v25 >= *a5) {
            goto LABEL_16;
          }
        }
        uint64_t v23 = 0;
      }
      else
      {
LABEL_16:
        uint64_t v23 = 1;
      }
      if (v33) {
        free(v33);
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    _lou_translate(a1, a1, a2, a3, a4, a5, a6, a7, __b, a9, a10, a13, 0, 0);
    return 1;
  }
  return v23;
}

void sub_16A3C()
{
}

uint64_t lou_hyphenate(char *a1, unsigned __int16 *a2, int a3, unsigned char *a4, int a5)
{
  uint64_t Table = lou_getTable(a1);
  uint64_t result = 0;
  if (a4)
  {
    if (a2)
    {
      if (Table)
      {
        uint64_t result = 0;
        if (a3 <= 99)
        {
          if (*(_DWORD *)(Table + 2544))
          {
            if (a5)
            {
              int v36 = a3;
              int v37 = 100;
              int v12 = malloc_type_malloc(0x190uLL, 0x100004052888210uLL);
              if (!lou_backTranslate(a1, a2, (unsigned int *)&v36, v38, &v37, 0, 0, 0, (uint64_t)v12, 0, 0))
              {
                free(v12);
                return 0;
              }
              uint64_t v13 = malloc_type_malloc(v37 + 1, 0x100004077774924uLL);
              int v14 = v37;
            }
            else
            {
              __memcpy_chk();
              int v12 = 0;
              int v37 = a3;
              int v14 = a3;
              uint64_t v13 = a4;
            }
            BOOL v15 = v14 < 1;
            int v35 = (int *)v12;
            int v34 = a5;
            uint64_t v16 = 0;
            if (!v15)
            {
              do
                v13[v16++] = 48;
              while (v16 < v37);
            }
            LODWORD(v17) = 0;
            v13[v16] = 0;
            while (1)
            {
              int v18 = v37;
              if ((int)v17 < v37)
              {
                uint64_t v17 = (int)v17;
                do
                {
                  int v19 = sub_16DC8(v38[v17], Table);
                  int v18 = v37;
                  if ((v19[24] & 2) != 0) {
                    break;
                  }
                  ++v17;
                }
                while (v17 < v37);
              }
              if (v17 == v18) {
                break;
              }
              uint64_t v20 = (int)v17 + 1;
              LODWORD(v21) = v20;
              if ((int)v20 < v18)
              {
                uint64_t v21 = (int)v20;
                do
                {
                  if ((*((unsigned char *)sub_16DC8(v38[v21], Table) + 24) & 2) == 0) {
                    break;
                  }
                  ++v21;
                }
                while (v21 < v37);
              }
              uint64_t result = sub_16E28(&v38[(int)v17], (int)v21 - (int)v17, &v13[(int)v17], Table);
              if (!result) {
                return result;
              }
              if ((int)v17 < 2) {
                goto LABEL_29;
              }
              uint64_t v22 = *((unsigned int *)sub_16DC8(v38[(v17 - 1)], Table) + 5);
              if (!v22) {
                goto LABEL_29;
              }
              while (1)
              {
                uint64_t v23 = Table + 8 * v22 + 31616;
                if (*(_DWORD *)(v23 + 44) == 110) {
                  break;
                }
                uint64_t v22 = *(unsigned int *)(v23 + 20);
                if (!v22) {
                  goto LABEL_29;
                }
              }
              if ((*((unsigned char *)sub_16DC8(v38[(v17 - 2)], Table) + 24) & 2) != 0) {
                char v24 = 50;
              }
              else {
LABEL_29:
              }
                char v24 = 48;
              v13[(int)v17] = v24;
              if ((int)v20 < (int)v21)
              {
                uint64_t v25 = &v13[v20];
                int v26 = ~v17 + v21;
                do
                {
                  *uint64_t v25 = *v25 & 1 | 0x30;
                  ++v25;
                  --v26;
                }
                while (v26);
              }
              if (v21 == v37)
              {
                int v18 = v21;
                break;
              }
              v13[(int)v21] = 48;
              LODWORD(v17) = v21 + 1;
            }
            if (v34)
            {
              if (a3 < 1)
              {
                uint64_t v27 = 0;
              }
              else
              {
                uint64_t v27 = a3;
                memset(a4, 48, a3);
              }
              a4[v27] = 0;
              if (v18 >= 1)
              {
                int v28 = -1;
                uint64_t v29 = v35;
                uint64_t v30 = v13;
                uint64_t v31 = v18;
                do
                {
                  int v33 = *v29++;
                  uint64_t v32 = v33;
                  if (v33 > a3 || (v32 & 0x80000000) != 0) {
                    break;
                  }
                  if ((int)v32 > v28)
                  {
                    a4[v32] = *v30;
                    int v28 = v32;
                  }
                  ++v30;
                  --v31;
                }
                while (v31);
              }
              free(v13);
              free(v35);
            }
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void *sub_16DC8(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 13608);
  if (v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      if (*(unsigned __int16 *)(a2 + 8 * v4 + 31660) == a1) {
        break;
      }
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!v4) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t result = &unk_25048;
    word_25074 = a1;
  }
  return result;
}

uint64_t sub_16E28(unsigned __int16 *a1, int a2, unsigned char *a3, uint64_t a4)
{
  uint64_t result = 0;
  if (a2 <= 2045)
  {
    uint64_t v7 = *(unsigned int *)(a4 + 2544);
    if (v7)
    {
      uint64_t v29 = malloc_type_calloc(a2 + 3, 2uLL, 0x1000040BDFB0063uLL);
      *uint64_t v29 = 46;
      if (a2 >= 1)
      {
        uint64_t v9 = a3;
        uint64_t v10 = v29 + 1;
        uint64_t v11 = a2;
        do
        {
          int v12 = *a1++;
          uint64_t v13 = sub_16DC8(v12, a4);
          *v10++ = sub_10904(a4, (uint64_t)v13);
          *v9++ = 48;
          --v11;
        }
        while (v11);
      }
      v29[a2 + 1] = 46;
      if (a2 >= -1)
      {
        uint64_t v14 = 0;
        LODWORD(v15) = 0;
        uint64_t v16 = a4 + 8 * v7 + 31616;
        int v17 = 1;
        do
        {
          if (v15 == 0xFFFF)
          {
LABEL_9:
            LODWORD(v15) = 0;
          }
          else
          {
            while (1)
            {
              uint64_t v18 = *(unsigned int *)(v16 + 16 * v15);
              if (v18)
              {
                uint64_t v19 = *(unsigned __int16 *)(v16 + 16 * v15 + 14);
                if (*(_WORD *)(v16 + 16 * v15 + 14)) {
                  break;
                }
              }
LABEL_15:
              LODWORD(v15) = *(unsigned __int16 *)(v16 + 16 * v15 + 12);
              if (v15 == 0xFFFF) {
                goto LABEL_9;
              }
            }
            uint64_t v20 = (unsigned __int16 *)(a4 + 31618 + 8 * v18);
            while (*(v20 - 1) != (unsigned __int16)v29[v14])
            {
              v20 += 2;
              if (!--v19) {
                goto LABEL_15;
              }
            }
            uint64_t v15 = *v20;
            uint64_t v21 = *(unsigned int *)(v16 + 16 * v15 + 8);
            if (v21)
            {
              uint64_t v22 = (const char *)(a4 + 8 * v21 + 31616);
              int v23 = strlen(v22);
              LODWORD(v24) = a2 + ~v14 + v23;
              unint64_t v24 = (int)v24 >= v23 ? v23 : v24;
              if ((int)v24 >= 1)
              {
                unint64_t v25 = 0;
                int v26 = &a3[v17 - v23];
                do
                {
                  int v27 = v22[v25];
                  if ((char)v26[v25] < v27) {
                    v26[v25] = v27;
                  }
                  ++v25;
                }
                while (v25 < v24);
              }
            }
          }
          ++v14;
          ++v17;
        }
        while (v14 != a2 + 2);
      }
      a3[a2] = 0;
      free(v29);
      return 1;
    }
  }
  return result;
}

uint64_t lou_dotsToChar(const char *a1, unsigned __int16 *a2, __int16 *a3, int a4)
{
  uint64_t result = 0;
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      uint64_t v7 = a3;
      if (a3)
      {
        LODWORD(v8) = a4;
        Displayuint64_t Table = _lou_getDisplayTable(a1);
        uint64_t result = 0;
        if ((int)v8 >= 1)
        {
          if (DisplayTable)
          {
            uint64_t v8 = v8;
            do
            {
              int v11 = *v6++;
              int v10 = v11;
              int v12 = v11 | 0x8000;
              if ((v11 & 0xFF00) == 0x2800) {
                int v13 = v12;
              }
              else {
                int v13 = v10;
              }
              int CharForDots = _lou_getCharForDots(v13, DisplayTable);
              if (CharForDots) {
                __int16 v15 = CharForDots;
              }
              else {
                __int16 v15 = 32;
              }
              *v7++ = v15;
              --v8;
            }
            while (v8);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t lou_charToDots(const char *a1, unsigned __int16 *a2, _WORD *a3, int a4, char a5)
{
  uint64_t result = 0;
  if (a1)
  {
    uint64_t v7 = a2;
    if (a2)
    {
      uint64_t v8 = a3;
      if (a3)
      {
        LODWORD(v10) = a4;
        Displayuint64_t Table = _lou_getDisplayTable(a1);
        uint64_t result = 0;
        if ((int)v10 >= 1)
        {
          if (DisplayTable)
          {
            uint64_t v10 = v10;
            do
            {
              int v12 = *v7++;
              __int16 DotsForChar = _lou_getDotsForChar(v12, DisplayTable);
              __int16 v14 = DotsForChar | 0x2800;
              if ((a5 & 0x40) == 0) {
                __int16 v14 = DotsForChar;
              }
              *v8++ = v14;
              --v10;
            }
            while (v10);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

void *sub_17188(unsigned int a1, int a2)
{
  return _lou_allocMem(4, a1, 0, a2);
}

uint64_t sub_1719C(unsigned __int16 *a1, unsigned __int16 *a2, int a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  if (a3 < 1) {
    return 1;
  }
  uint64_t v7 = a3;
  while (1)
  {
    int v8 = *a1++;
    uint64_t v9 = sub_16DC8(v8, a4);
    int v10 = sub_10904(a4, (uint64_t)v9);
    int v11 = *a2++;
    int v12 = sub_16DC8(v11, a4);
    if (v10 != sub_10904(a4, (uint64_t)v12)) {
      break;
    }
    if (!--v7) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_17248(uint64_t a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, int *a6, uint64_t *a7, int *a8, signed int *a9, unint64_t *a10, _WORD *a11)
{
  uint64_t v11 = a5;
  uint64_t result = 0;
  unsigned int v117 = a2;
  *a10 = 0;
  *a7 = a5 + 2 * *(__int16 *)(a5 + 50) + 54;
  *a8 = 0;
  *a6 = (a4 & 0xFFFFFFFE) != 74;
  int v14 = *a8;
  int v15 = *(__int16 *)(a5 + 52);
  if (*a8 >= v15) {
    return result;
  }
  uint64_t v16 = a8;
  uint64_t v18 = a3;
  signed int v19 = a2;
  BOOL v20 = 0;
  int v116 = 0;
  unsigned int v21 = -1;
  uint64_t v109 = a1 + 31616;
  unsigned int v22 = -1;
  while (1)
  {
    uint64_t result = 0;
    BOOL v114 = 1;
    uint64_t v23 = v117;
    if ((v117 & 0x80000000) != 0) {
      return result;
    }
    LODWORD(v24) = *(_DWORD *)(v18 + 16);
    if ((int)v117 > (int)v24) {
      return result;
    }
    uint64_t v25 = *a7;
    unsigned int v26 = *(unsigned __int16 *)(*a7 + 2 * v14);
    if (v26 <= 0x5A) {
      break;
    }
    if (*(unsigned __int16 *)(*a7 + 2 * v14) <= 0x7Au)
    {
      switch(*(_WORD *)(*a7 + 2 * v14))
      {
        case '[':
          int v27 = v14 + 1;
          unsigned int v22 = v117;
          goto LABEL_56;
        case ']':
          int v27 = v14 + 1;
          unsigned int v21 = v117;
          goto LABEL_56;
        case '_':
          v117 -= *(unsigned __int16 *)(v25 + 2 * v14 + 2);
          BOOL v114 = (v117 & 0x80000000) == 0;
          int v27 = v14 + 2;
          goto LABEL_56;
          if (v117) {
            goto LABEL_50;
          }
          goto LABEL_51;
        default:
          goto LABEL_63;
      }
    }
    if (v26 == 123 || v26 == 125)
    {
      unint64_t v28 = v109
          + ((8 * *(unsigned __int16 *)(v25 + 2 * v14 + 4)) | ((unint64_t)*(unsigned __int16 *)(v25 + 2 * v14 + 2) << 19));
      if (!v14 || v14 >= 1 && *(_WORD *)(v25 + 2 * (v14 - 1)) == 91)
      {
        *a10 = v28;
        uint64_t v29 = *a7;
        *a11 = *(_WORD *)(*a7 + 2 * v14);
        unsigned int v26 = *(unsigned __int16 *)(v29 + 2 * v14);
      }
      BOOL v114 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v23) == *(unsigned __int16 *)(v28
                                                                                          + 2
                                                                                          * ((v26 != 123) | (2 * *a6))
                                                                                          + 54);
      unsigned int v117 = v23 + 1;
      int v27 = v14 + 3;
    }
    else
    {
      if (v26 != 126) {
        goto LABEL_63;
      }
      if (v117 != v24) {
LABEL_50:
      }
        BOOL v114 = 0;
LABEL_51:
      int v27 = v14 + 1;
    }
LABEL_56:
    int *v16 = v27;
LABEL_57:
    if (!v20 != v114) {
      return 0;
    }
LABEL_58:
    BOOL v20 = 0;
    int v14 = *v16;
    LOWORD(v15) = *(_WORD *)(v11 + 52);
LABEL_59:
    if (v14 >= (__int16)v15) {
      return 0;
    }
  }
  switch(*(_WORD *)(*a7 + 2 * v14))
  {
    case ' ':
      goto LABEL_181;
    case '!':
      BOOL v20 = !v20;
      int *v16 = ++v14;
      goto LABEL_59;
    case '""':
      goto LABEL_22;
    case '#':
      goto LABEL_63;
    case '$':
      unsigned int v103 = v22;
      int v35 = v16;
      uint64_t v36 = a1;
      uint64_t v105 = v11;
      int v37 = (unsigned __int16 *)(v25 + 2 * v14);
      unint64_t v38 = v37[4] | ((((unint64_t)v37[1] << 32) | ((unint64_t)v37[2] << 16) | v37[3]) << 16);
      if (v37[5])
      {
        unsigned int v101 = v21;
        signed int v100 = v19;
        uint64_t v39 = 0;
        uint64_t v40 = 2 * v117;
        do
        {
          if (v23 + v39 >= *(int *)(v18 + 16)
            || (int v41 = *(unsigned __int16 *)(*(void *)(v18 + 8) + v40 + 2 * v39), v41 == 0xFFFF))
          {
LABEL_61:
            unsigned int v117 = v23 + v39;
            BOOL v114 = 0;
            signed int v19 = v100;
            unsigned int v21 = v101;
            goto LABEL_79;
          }
          BOOL v42 = v20;
          if (*a6) {
            uint64_t v43 = sub_18750(v41, v36);
          }
          else {
            uint64_t v43 = sub_16DC8(v41, v36);
          }
          BOOL v20 = v42;
          if ((v43[3] & v38) != 0)
          {
            uint64_t v18 = a3;
            if (v42) {
              goto LABEL_61;
            }
          }
          else
          {
            uint64_t v18 = a3;
            if (!v42) {
              goto LABEL_61;
            }
          }
          uint64_t v25 = *a7;
          int v14 = *v35;
          unsigned int v44 = *(unsigned __int16 *)(*a7 + 2 * (*v35 + 5));
          ++v39;
        }
        while (v39 < v44);
        LODWORD(v23) = v23 + v39;
        unsigned int v117 = v23;
        signed int v19 = v100;
        unsigned int v21 = v101;
        if (!v114) {
          goto LABEL_79;
        }
      }
      else
      {
        unsigned int v44 = 0;
      }
      if (v44 < *(unsigned __int16 *)(v25 + 2 * (v14 + 6)))
      {
        uint64_t v23 = (int)v23;
        while (v23 < *(int *)(v18 + 16))
        {
          int v49 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v23);
          if (v49 == 0xFFFF)
          {
            unsigned int v117 = v23;
            BOOL v114 = 0;
            goto LABEL_79;
          }
          BOOL v50 = v20;
          if (*a6) {
            int v51 = sub_18750(v49, v36);
          }
          else {
            int v51 = sub_16DC8(v49, v36);
          }
          BOOL v20 = v50;
          if ((v51[3] & v38) != 0)
          {
            uint64_t v18 = a3;
            if (v50) {
              break;
            }
          }
          else
          {
            uint64_t v18 = a3;
            if (!v50) {
              break;
            }
          }
          ++v23;
          if (++v44 >= *(unsigned __int16 *)(*a7 + 2 * *v35 + 12)) {
            break;
          }
        }
      }
      unsigned int v117 = v23;
LABEL_79:
      *v35 += 7;
      uint64_t v11 = v105;
      a1 = v36;
      uint64_t v16 = v35;
      unsigned int v22 = v103;
      if (!v114) {
        return 0;
      }
      goto LABEL_58;
    case '%':
      BOOL v45 = v20;
      int v46 = sub_187B4(v14, (int *)&v117, a1, v18, *a7);
      LODWORD(v20) = v45;
      uint64_t v18 = a3;
      BOOL v114 = v46;
      int v27 = v14 + 5;
      goto LABEL_56;
    default:
      if (v26 == 64)
      {
LABEL_22:
        uint64_t v30 = v25 + 2 * v14;
        int v31 = *(unsigned __int16 *)(v30 + 2);
        if (*(_WORD *)(v30 + 2))
        {
          int v27 = v14 + 2 + v31;
          uint64_t v32 = v14 + 2;
          if ((int)v24 <= (int)v117) {
            uint64_t v24 = v117;
          }
          else {
            uint64_t v24 = v24;
          }
          uint64_t v33 = v117;
          while (v24 != v33)
          {
            int v34 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v33);
            if (v34 == 0xFFFF || *(unsigned __int16 *)(v25 + 2 * v32) != v34)
            {
              int v47 = 0;
              goto LABEL_55;
            }
            ++v33;
            if (++v32 >= v27) {
              break;
            }
          }
        }
        else
        {
          int v27 = v14 + v31 + 2;
        }
        int v47 = 1;
LABEL_55:
        BOOL v114 = v47;
        v117 += v31;
        goto LABEL_56;
      }
      if (v26 != 47)
      {
LABEL_63:
        BOOL v48 = v20;
        uint64_t result = _lou_handlePassVariableTest(*a7, v16, &v114);
        LODWORD(v20) = v48;
        uint64_t v18 = a3;
        if (!result) {
          return result;
        }
        goto LABEL_57;
      }
      int v52 = 0;
      int v115 = 0;
      if ((int)v24 > (int)v117)
      {
        unsigned int v102 = v21;
        BOOL v53 = 0;
        int v54 = 0;
        int v98 = (unsigned __int16)*a11;
        int v55 = v14 + 1;
        BOOL v95 = *a10 == 0;
        unint64_t v107 = *a10;
        uint64_t v108 = *a6;
        uint64_t v113 = a1;
        uint64_t v99 = a1 + 31616;
        int v104 = v14 + 1;
        uint64_t v106 = v11;
        while (1)
        {
          int v115 = v23;
          int v116 = v55;
          int v56 = *(__int16 *)(v11 + 52);
          if (v55 >= v56) {
            goto LABEL_170;
          }
          __int16 v57 = *(_WORD *)(v11 + 52);
          int v58 = v55;
          do
          {
            v118[0] = 1;
            int v59 = v115;
            if (v115 >= *(_DWORD *)(v18 + 16)) {
              goto LABEL_171;
            }
            unsigned int v60 = *(unsigned __int16 *)(v25 + 2 * v58);
            if (v60 > 0x3F)
            {
              if (*(unsigned __int16 *)(v25 + 2 * v58) > 0x5Eu)
              {
                if (v60 == 125 || v60 == 123)
                {
                  unint64_t v68 = v99
                      + ((8 * *(unsigned __int16 *)(v25 + 2 * v58 + 4)) | ((unint64_t)*(unsigned __int16 *)(v25 + 2 * v58 + 2) << 19));
                  int v69 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v115);
                  uint64_t v70 = (2 * v108) | 1;
                  if (v60 == 123) {
                    uint64_t v70 = 2 * (int)v108;
                  }
                  int v62 = v69 == *(unsigned __int16 *)(v68 + 2 * v70 + 54);
                  if (v107 && v98 == 123 && v68 == v107)
                  {
                    if (v69 == *(unsigned __int16 *)(v107 + 54 + 4 * v108))
                    {
                      --v54;
                    }
                    else if (v69 == *(unsigned __int16 *)(v107 + 54 + 2 * ((2 * v108) | 1)))
                    {
                      ++v54;
                    }
                  }
                  ++v115;
                  int v82 = v58 + 3;
                }
                else
                {
                  if (v60 != 95) {
                    goto LABEL_136;
                  }
                  v115 -= *(unsigned __int16 *)(v25 + 2 * v58 + 2);
                  if (v115 < 0)
                  {
                    int v62 = 0;
                    int v115 = 0;
                    v118[0] = 0;
                  }
                  else
                  {
                    int v62 = 1;
                  }
                  int v82 = v58 + 2;
                }
LABEL_144:
                int v116 = v82;
              }
              else if (v60 == 64)
              {
LABEL_109:
                int v63 = *(unsigned __int16 *)(v25 + 2 * v58 + 2);
                LODWORD(v64) = v58 + 2;
                if (*(_WORD *)(v25 + 2 * v58 + 2))
                {
                  uint64_t v64 = (int)v64;
                  int v65 = (unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v115);
                  while (1)
                  {
                    int v67 = *v65++;
                    int v66 = v67;
                    if (v67 == 0xFFFF || *(unsigned __int16 *)(v25 + 2 * v64) != v66) {
                      break;
                    }
                    if (++v64 >= v58 + 2 + v63) {
                      goto LABEL_114;
                    }
                  }
                  int v62 = 0;
                  v118[0] = 0;
                }
                else
                {
LABEL_114:
                  int v62 = 1;
                }
                v115 += v63;
                int v116 = v58 + 2 + v63;
              }
              else
              {
                if (v60 == 91 || v60 == 93)
                {
                  int v116 = v58 + 1;
LABEL_102:
                  if (v53) {
                    break;
                  }
LABEL_146:
                  int v58 = v116;
                  goto LABEL_147;
                }
LABEL_136:
                BOOL v83 = v20;
                BOOL v84 = v53;
                _lou_handlePassVariableTest(v25, &v116, v118);
                BOOL v53 = v84;
                BOOL v20 = v83;
                uint64_t v18 = a3;
                int v62 = v118[0];
              }
              if (!v53 != (v62 != 0)) {
                break;
              }
              goto LABEL_146;
            }
            switch(*(_WORD *)(v25 + 2 * v58))
            {
              case ' ':
                int v61 = v54 != 1 || v95;
                int v52 = 1;
                unsigned int v21 = v102;
                if (!v107 || !v61) {
                  goto LABEL_172;
                }
                int v116 = v56;
                goto LABEL_102;
              case '!':
                BOOL v53 = !v53;
                int v116 = ++v58;
                goto LABEL_148;
              case '""':
                goto LABEL_109;
              case '$':
                uint64_t v71 = (unsigned __int16 *)(v25 + 2 * v58);
                unint64_t v110 = v71[4] | ((((unint64_t)v71[1] << 32) | ((unint64_t)v71[2] << 16) | v71[3]) << 16);
                unsigned int v72 = v71[5];
                if (!v72) {
                  goto LABEL_151;
                }
                int v73 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v115);
                if (v73 == 0xFFFF) {
                  goto LABEL_168;
                }
                int v96 = v54;
                uint64_t v74 = 0;
                uint64_t v75 = 2 * v115 + 2;
                break;
              case '%':
                BOOL v80 = v20;
                BOOL v81 = v53;
                int v62 = sub_187B4(v58, &v115, v113, v18, v25);
                BOOL v53 = v81;
                BOOL v20 = v80;
                uint64_t v18 = a3;
                int v82 = v58 + 5;
                goto LABEL_144;
              default:
                goto LABEL_136;
            }
            while (1)
            {
              BOOL v76 = v53;
              BOOL v77 = v20;
              if (v108) {
                unsigned int v78 = sub_18750((unsigned __int16)v73, v113);
              }
              else {
                unsigned int v78 = sub_16DC8((unsigned __int16)v73, v113);
              }
              uint64_t v18 = a3;
              int v79 = v78[6] & v110;
              BOOL v53 = v76;
              if (v76) {
                int v79 = (v78[6] & v110) == 0;
              }
              v118[0] = v79;
              int v58 = v116;
              BOOL v20 = v77;
              if (!v79)
              {
                int v115 = v59 + v74 + 1;
                uint64_t v11 = v106;
                int v54 = v96;
LABEL_169:
                BOOL v53 = 0;
                int v116 = v58 + 7;
                goto LABEL_170;
              }
              unsigned int v72 = *(unsigned __int16 *)(v25 + 2 * (v116 + 5));
              if ((int)v74 + 1 >= v72) {
                break;
              }
              int v73 = *(unsigned __int16 *)(*(void *)(a3 + 8) + v75 + 2 * v74++);
              if (v73 == 0xFFFF)
              {
                v59 += v74;
                uint64_t v11 = v106;
                int v54 = v96;
                goto LABEL_168;
              }
            }
            v59 += v74 + 1;
            int v115 = v59;
            uint64_t v11 = v106;
            int v54 = v96;
LABEL_151:
            if (v72 >= *(unsigned __int16 *)(v25 + 2 * (v58 + 6)))
            {
              v58 += 7;
              int v116 = v58;
              goto LABEL_147;
            }
            int v85 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v59);
            if (v85 == 0xFFFF)
            {
LABEL_168:
              int v115 = v59;
              v118[0] = 0;
              goto LABEL_169;
            }
            int v97 = v54;
            uint64_t v86 = 2 * v59 + 2;
            unsigned int v87 = v72 + 1;
            while (1)
            {
              BOOL v88 = v53;
              BOOL v89 = v20;
              char v90 = v108 ? sub_18750((unsigned __int16)v85, v113) : sub_16DC8((unsigned __int16)v85, v113);
              BOOL v53 = v88;
              if ((v90[3] & v110) != 0)
              {
                uint64_t v18 = a3;
                BOOL v20 = v89;
                if (v88) {
                  break;
                }
              }
              else
              {
                uint64_t v18 = a3;
                BOOL v20 = v89;
                if (!v88) {
                  break;
                }
              }
              ++v59;
              int v58 = v116;
              if (v87 >= *(unsigned __int16 *)(v25 + 2 * (v116 + 6))) {
                break;
              }
              int v85 = *(unsigned __int16 *)(*(void *)(v18 + 8) + v86);
              v86 += 2;
              ++v87;
              if (v85 == 0xFFFF)
              {
                uint64_t v11 = v106;
                int v54 = v97;
                goto LABEL_168;
              }
            }
            int v58 = v116 + 7;
            int v115 = v59;
            v116 += 7;
            uint64_t v11 = v106;
            int v54 = v97;
            if (!v118[0])
            {
              BOOL v53 = 0;
              break;
            }
LABEL_147:
            BOOL v53 = 0;
            __int16 v57 = *(_WORD *)(v11 + 52);
LABEL_148:
            int v56 = v57;
          }
          while (v58 < v57);
LABEL_170:
          LODWORD(v23) = v23 + 1;
          int v55 = v104;
          if ((int)v23 >= *(_DWORD *)(v18 + 16))
          {
LABEL_171:
            int v52 = 0;
            unsigned int v21 = v102;
            break;
          }
        }
      }
LABEL_172:
      uint64_t result = 0;
      BOOL v91 = !v20 || v52 == 0;
      char v92 = !v91;
      if (v52 | v20 && (v92 & 1) == 0)
      {
        LODWORD(v23) = v115;
        int v14 = v116;
LABEL_181:
        uint64_t result = 0;
        int *v16 = v14 + 1;
        if (v22 == -1) {
          signed int v93 = v19;
        }
        else {
          signed int v93 = v22;
        }
        if (v22 == -1) {
          unsigned int v94 = v23;
        }
        else {
          unsigned int v94 = v21;
        }
        if (v93 >= v19 && v94 != -1)
        {
          *a9 = v19;
          a9[1] = v93;
          uint64_t result = 1;
          a9[2] = v94;
          a9[3] = v23;
        }
      }
      return result;
  }
}

uint64_t sub_17E1C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, int *a10, unint64_t a11, int a12, int a13, int *a14, _DWORD *a15, uint64_t a16, unsigned __int16 a17, char a18)
{
  uint64_t v24 = a1;
  char v25 = a18;
  int v26 = a9;
  unint64_t v27 = HIDWORD(a11);
  int v144 = *(_DWORD *)(a3 + 20);
  int v142 = a15;
  uint64_t v145 = a11;
  __int16 v141 = a14;
  uint64_t result = sub_189AC(a11, SHIDWORD(a11), a1, *a2, a3, a4, a5, a14, a15, a18);
  if (result)
  {
    if (*(__int16 *)(*(void *)a6 + 52) > v26)
    {
      int v134 = a5;
      uint64_t v140 = a16;
      uint64_t v130 = 2 * a7;
      uint64_t v29 = (int)v130 | 1;
      int v136 = (unsigned __int16 *)(a16 + 54 + 2 * v29);
      uint64_t v137 = (unsigned __int16 *)(a16 + 54 + 4 * a7);
      uint64_t v132 = v24 + 54 + 2 * v29;
      int v125 = v27 + 1;
      int v135 = a17;
      int v129 = a13;
      uint64_t v131 = v24 + 54 + 4 * a7;
      uint64_t v123 = v24 + 31670;
      uint64_t v122 = v24 + 31676;
      int v138 = *(_DWORD *)(a3 + 20);
      uint64_t v121 = v24 + 31616;
      int v30 = a12;
      uint64_t v133 = a6;
      uint64_t v139 = v24;
      int v31 = a12;
      int v143 = a12;
      uint64_t v124 = a8;
      while (1)
      {
        unsigned int v32 = *(unsigned __int16 *)(a8 + 2 * v26);
        if (v32 > 0x3E) {
          break;
        }
        if (*(unsigned __int16 *)(a8 + 2 * v26) <= 0x29u)
        {
          if (v32 != 34)
          {
            if (v32 == 37)
            {
              if ((int)v27 >= v31) {
                goto LABEL_107;
              }
              int v126 = v30;
              unint64_t v33 = (8 * *(unsigned __int16 *)(a8 + 2 * v26 + 4)) | ((unint64_t)*(unsigned __int16 *)(a8 + 2 * v26 + 2) << 19);
              unint64_t v34 = v121 + v33;
              uint64_t v35 = v121 + v33 + 2 * *(__int16 *)(v121 + v33 + 50) + 54;
              uint64_t v36 = *a2;
              unint64_t v37 = v123 + v33;
              uint64_t v128 = (unsigned __int16 *)(v122 + v33);
              uint64_t v38 = v145 >> 32;
              while (1)
              {
                int v39 = *(_DWORD *)(v34 + 44);
                uint64_t v40 = *(__int16 *)(v34 + 50);
                if (v39 == 60)
                {
                  unint64_t v41 = (v40 - 2);
                  if ((int)v40 < 2)
                  {
                    LODWORD(v45) = 0;
                    int v46 = 0;
                  }
                  else
                  {
                    int v42 = *(unsigned __int16 *)(*(void *)(v36 + 8) + 2 * v38);
                    if (v42 == *(unsigned __int16 *)(v34 + 56))
                    {
                      LODWORD(v43) = 0;
                      int v44 = 0;
LABEL_26:
                      LODWORD(v45) = v43;
                      int v46 = v44;
                    }
                    else
                    {
                      int v44 = 0;
                      uint64_t v43 = 0;
                      LODWORD(v45) = (v41 >> 1) + 1;
                      int v46 = (v41 & 0xFFFFFFFE) + 2;
                      unint64_t v47 = v41 >> 1;
                      BOOL v48 = v128;
                      while (v47 != v43)
                      {
                        int v49 = *v48;
                        v48 += 2;
                        v44 += 2;
                        ++v43;
                        if (v42 == v49) {
                          goto LABEL_26;
                        }
                      }
                    }
                  }
                  if (v46 != v40) {
                    goto LABEL_28;
                  }
                }
                else
                {
                  if ((int)v40 < 1)
                  {
                    LODWORD(v45) = 0;
                  }
                  else
                  {
                    uint64_t v45 = 0;
                    while (*(unsigned __int16 *)(*(void *)(v36 + 8) + 2 * v38) != *(unsigned __int16 *)(v37 + 2 * v45))
                    {
                      if (v40 == ++v45) {
                        goto LABEL_41;
                      }
                    }
                  }
                  if (v45 != v40)
                  {
LABEL_28:
                    for (unsigned int i = 0; v45; LODWORD(v45) = v45 - 1)
                    {
                      if (v39 == 58) {
                        int v51 = 1;
                      }
                      else {
                        int v51 = *(unsigned __int16 *)(v35 + 2 * i);
                      }
                      i += v51;
                    }
                    if (v39 == 58)
                    {
                      uint64_t v52 = *(int *)(a3 + 20);
                      if ((int)v52 >= *(_DWORD *)(a3 + 16)) {
                        return 0;
                      }
                      *(_DWORD *)(a4 + 4 * v52) = v38;
                      __int16 v53 = *(_WORD *)(v35 + 2 * (int)i);
                      uint64_t v54 = *(void *)(a3 + 8);
                      uint64_t v55 = *(int *)(a3 + 20);
                      *(_DWORD *)(a3 + 20) = v55 + 1;
                      *(_WORD *)(v54 + 2 * v55) = v53;
                    }
                    else
                    {
                      uint64_t v56 = *(unsigned __int16 *)(v35 + 2 * (int)i);
                      int v57 = v56 - 1;
                      uint64_t v58 = *(int *)(a3 + 20);
                      uint64_t v59 = v56 - 1 + v58;
                      if ((int)v59 > *(_DWORD *)(a3 + 16)) {
                        return 0;
                      }
                      if (v56 >= 2)
                      {
                        do
                        {
                          *(_DWORD *)(a4 - 4 + 4 * v59) = v38;
                          uint64_t v58 = *(int *)(a3 + 20);
                          --v59;
                        }
                        while (v59 > v58);
                      }
                      if (!v56) {
                        return 0;
                      }
                      memcpy((void *)(*(void *)(a3 + 8) + 2 * (int)v58), (const void *)(v35 + 2 * (int)i + 2), (2 * v57));
                      *(_DWORD *)(a3 + 20) += v57;
                      int v31 = v143;
                    }
                  }
                }
LABEL_41:
                if (++v38 == v31)
                {
                  int v26 = a9;
                  a8 = v124;
                  a6 = v133;
                  uint64_t v24 = v139;
                  int v30 = v126;
                  goto LABEL_107;
                }
              }
            }
LABEL_85:
            uint64_t result = _lou_handlePassVariableAction(a8, &a9);
            if (!result) {
              return result;
            }
            int v26 = a9;
            goto LABEL_109;
          }
          goto LABEL_46;
        }
        if (v32 != 42)
        {
          if (v32 != 59) {
            goto LABEL_85;
          }
          if (!v140) {
            return 0;
          }
          int v65 = *v137;
          int v66 = *v136;
          unint64_t v67 = v24
              + ((8 * *(unsigned __int8 *)(a8 + 2 * v26 + 4)) | ((unint64_t)*(unsigned __int16 *)(a8 + 2 * v26 + 2) << 19));
          __int16 v68 = *(_WORD *)(v67 + 31670 + 2 * v130);
          __int16 v69 = *(_WORD *)(v67 + 31670 + 2 * ((int)v130 | 1));
          if (v135 == 123)
          {
            int v70 = 0;
            uint64_t v71 = *(int *)(*a2 + 16);
            if ((int)v71 <= v125) {
              int v72 = v27 + 1;
            }
            else {
              int v72 = *(_DWORD *)(*a2 + 16);
            }
            uint64_t v73 = (v145 >> 32) + 1;
            int v74 = HIDWORD(v145);
            while (v73 < v71)
            {
              int v75 = *(unsigned __int16 *)(*(void *)(*a2 + 8) + 2 * v73);
              v70 -= v75 == v65;
              if (v75 == v66) {
                ++v70;
              }
              ++v74;
              ++v73;
              if (v70 == 1) {
                goto LABEL_104;
              }
            }
            int v74 = v72;
LABEL_104:
            if (v74 == v71) {
              return 0;
            }
            __int16 v110 = *(_WORD *)(v67 + 31670 + 2 * v130);
            int v127 = v30;
            int v111 = sub_12B40(v71);
            uint64_t v112 = *(void **)(*(void *)(qword_29E60 + 8) + 8 * v111);
            memcpy(v112, *(const void **)(*a2 + 8), 2 * *(int *)(*a2 + 16));
            *((_WORD *)v112 + (v145 >> 32)) = v110;
            *((_WORD *)v112 + v74) = v69;
            int v113 = *(_DWORD *)(*a2 + 16);
            dword_29E90 = v111;
            int v30 = v127;
            qword_29E98 = (uint64_t)v112;
            dword_29EA0 = v113;
            *a2 = (uint64_t)&dword_29E90;
            int v31 = v143;
            int v26 = a9;
            a8 = v124;
            a6 = v133;
          }
          else
          {
            if (v134 == 74)
            {
              unint64_t v96 = v67 + 31616;
              int v65 = *(unsigned __int16 *)(v140 + 58);
              int v66 = *(unsigned __int16 *)(v140 + 60);
              __int16 v68 = *(_WORD *)(v96 + 58);
              __int16 v69 = *(_WORD *)(v96 + 60);
            }
            int v97 = 0;
            uint64_t v98 = *(void *)(a3 + 8);
            uint64_t v99 = *(unsigned int *)(a3 + 20);
            *(_WORD *)(v98 + 2 * (int)v99) = v69;
            uint64_t v100 = v99;
            a6 = v133;
            do
            {
              if ((int)v100 < 1) {
                return 0;
              }
              uint64_t v101 = v100 - 1;
              int v102 = *(unsigned __int16 *)(v98 - 2 + 2 * v100);
              v97 -= v102 == v66;
              if (v102 == v65) {
                ++v97;
              }
              uint64_t v100 = v101;
            }
            while (v97 != 1);
            *(_WORD *)(v98 + 2 * v101) = v68;
            *(_DWORD *)(a3 + 20) = v99 + 1;
          }
          uint64_t v24 = v139;
          goto LABEL_107;
        }
        int v89 = v138;
        if (v138 - v144 >= 1)
        {
          memmove((void *)(*(void *)(a3 + 8) + 2 * v144), (const void *)(*(void *)(a3 + 8) + 2 * v138), 2 * (v138 - v144));
          *(_DWORD *)(a3 + 20) -= v138 - v144;
          int v89 = v144;
        }
        int v31 = v143;
        uint64_t result = sub_189AC(v27, v143, v24, *a2, a3, a4, v134, v141, v142, v25);
        if (!result) {
          return result;
        }
        int v138 = v89;
        int v26 = ++a9;
        int v30 = v129;
LABEL_109:
        if (v26 >= *(__int16 *)(*(void *)a6 + 52)) {
          goto LABEL_123;
        }
      }
      if (*(unsigned __int16 *)(a8 + 2 * v26) > 0x7Au)
      {
        if (v32 == 123)
        {
          uint64_t v90 = a8 + 2 * v26;
          uint64_t v91 = *(unsigned __int16 *)(v90 + 2);
          uint64_t v92 = *(unsigned __int16 *)(v90 + 4);
          *(_DWORD *)(a4 + 4 * *(int *)(a3 + 20)) = v145;
          uint64_t v79 = (8 * v92) | (v91 << 19);
          uint64_t v80 = v131;
        }
        else
        {
          if (v32 != 125) {
            goto LABEL_85;
          }
          uint64_t v76 = a8 + 2 * v26;
          uint64_t v77 = *(unsigned __int16 *)(v76 + 2);
          uint64_t v78 = *(unsigned __int16 *)(v76 + 4);
          *(_DWORD *)(a4 + 4 * *(int *)(a3 + 20)) = v145;
          uint64_t v79 = (8 * v78) | (v77 << 19);
          uint64_t v80 = v132;
        }
        __int16 v93 = *(_WORD *)(v80 + v79 + 31616);
        uint64_t v94 = *(void *)(a3 + 8);
        uint64_t v95 = *(int *)(a3 + 20);
        *(_DWORD *)(a3 + 20) = v95 + 1;
        *(_WORD *)(v94 + 2 * v95) = v93;
LABEL_107:
        v26 += 3;
      }
      else
      {
        if (v32 == 63)
        {
          if (v140)
          {
            int v81 = *v137;
            int v82 = *v136;
            if (v135 == 123)
            {
              int v83 = 0;
              uint64_t v84 = *(int *)(*a2 + 16);
              if ((int)v84 <= v125) {
                unsigned int v85 = v27 + 1;
              }
              else {
                unsigned int v85 = *(_DWORD *)(*a2 + 16);
              }
              uint64_t v86 = (v145 >> 32) + 1;
              unsigned int v87 = HIDWORD(v145);
              while (v86 < v84)
              {
                int v88 = *(unsigned __int16 *)(*(void *)(*a2 + 8) + 2 * v86);
                v83 -= v88 == v81;
                if (v88 == v82) {
                  ++v83;
                }
                ++v87;
                ++v86;
                if (v83 == 1) {
                  goto LABEL_112;
                }
              }
              unsigned int v87 = v85;
LABEL_112:
              if (v87 != v84)
              {
                int v114 = sub_12B40(v84);
                uint64_t v115 = *(void *)(*(void *)(qword_29E60 + 8) + 8 * v114);
                uint64_t v116 = *a2;
                uint64_t v117 = *(unsigned int *)(*a2 + 16);
                if ((int)v117 < 1)
                {
                  int v119 = 0;
                }
                else
                {
                  uint64_t v118 = 0;
                  int v119 = 0;
                  uint64_t v120 = 2 * v117;
                  do
                  {
                    if (2 * v87 != v118) {
                      *(_WORD *)(v115 + 2 * v119++) = *(_WORD *)(*(void *)(v116 + 8) + v118);
                    }
                    v118 += 2;
                  }
                  while (v120 != v118);
                }
                dword_29EA8 = v114;
                qword_29EB0 = v115;
                dword_29EB8 = v119;
                *a2 = (uint64_t)&dword_29EA8;
                int v26 = a9;
              }
            }
            else
            {
              int v103 = 0;
              uint64_t v104 = *(int *)(a3 + 20);
              uint64_t v105 = *(unsigned int *)(a3 + 20);
              uint64_t v106 = -1;
              while (1)
              {
                uint64_t v107 = v106;
                if ((int)v105 + (int)v106 + 1 < 1) {
                  break;
                }
                uint64_t v108 = *(void *)(a3 + 8);
                int v109 = *(unsigned __int16 *)(v108 + 2 * v105 + 2 * v106);
                v103 -= v109 == v82;
                if (v109 == v81) {
                  ++v103;
                }
                uint64_t v106 = v107 - 1;
                if (v103 == 1)
                {
                  if ((int)v104 > (int)v105 + (int)v106 + 2)
                  {
                    do
                    {
                      *(_WORD *)(v108 + 2 * v104 + 2 * v107) = *(_WORD *)(v108 + 2 * v104 + 2 * v107 + 2);
                      ++v107;
                    }
                    while (v107 != -1);
                  }
                  *(_DWORD *)(a3 + 20) = v105 - 1;
                  break;
                }
              }
            }
          }
          a9 = ++v26;
          uint64_t v24 = v139;
          goto LABEL_109;
        }
        if (v32 != 64) {
          goto LABEL_85;
        }
LABEL_46:
        uint64_t v60 = *(unsigned __int16 *)(a8 + 2 * v26 + 2);
        int v61 = *(_DWORD *)(a3 + 20);
        if (v61 + (int)v60 > *(_DWORD *)(a3 + 16)) {
          return 0;
        }
        if (*(_WORD *)(a8 + 2 * v26 + 2))
        {
          uint64_t v62 = 0;
          do
          {
            *(_DWORD *)(a4 + 4 * (v62 + *(int *)(a3 + 20))) = v27;
            ++v62;
          }
          while (v60 != v62);
          int v61 = *(_DWORD *)(a3 + 20);
        }
        memcpy((void *)(*(void *)(a3 + 8) + 2 * v61), (const void *)(a8 + 2 * v26 + 4), 2 * v60);
        int v63 = a9;
        int v64 = *(unsigned __int16 *)(a8 + 2 * (a9 + 1));
        *(_DWORD *)(a3 + 20) += v64;
        int v26 = v63 + v64 + 2;
      }
      a9 = v26;
      goto LABEL_109;
    }
    int v30 = a12;
LABEL_123:
    *a10 = v30;
    return 1;
  }
  return result;
}

void *sub_18750(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 18100);
  if (v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      if (*(unsigned __int16 *)(a2 + 8 * v4 + 31660) == a1) {
        break;
      }
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!v4) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t result = &unk_25008;
    word_25034 = a1;
  }
  return result;
}

uint64_t sub_187B4(int a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a1;
  uint64_t v7 = (unsigned __int16 *)(a5 + 2 * a1);
  unint64_t v8 = (8 * v7[2]) | ((unint64_t)v7[1] << 19);
  uint64_t v9 = a3 + v8 + 31616;
  unint64_t v10 = v7[3];
  uint64_t v11 = v5;
  while (v11 - v5 < v10)
  {
    if (v11 < *(int *)(a4 + 16))
    {
      uint64_t v12 = *(__int16 *)(a3 + v8 + 31666);
      if (*(_DWORD *)(a3 + v8 + 31660) == 60)
      {
        if (*(__int16 *)(a3 + v8 + 31666) < 2)
        {
          LODWORD(v15) = 1;
        }
        else
        {
          for (uint64_t i = 0;
                *(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v11) != *(unsigned __int16 *)(a3 + v8 + 31672 + 2 * i);
                i += 2)
          {
            unint64_t v14 = i + 3;
            if (v14 >= *(unsigned __int16 *)(a3 + v8 + 31666)) {
              return 0;
            }
          }
          LODWORD(v15) = i + 1;
        }
      }
      else if ((int)v12 < 1)
      {
        LODWORD(v15) = 0;
      }
      else
      {
        uint64_t v15 = 0;
        while (*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v11) != *(unsigned __int16 *)(a3 + v8 + 31670 + 2 * v15))
        {
          if (v12 == ++v15) {
            return 0;
          }
        }
      }
      ++v11;
      if ((int)v15 < (int)v12) {
        continue;
      }
    }
    return 0;
  }
  int v17 = v5 + v10;
  uint64_t v18 = *(unsigned __int16 *)(a5 + 2 * v6 + 8);
  if (v10 < v18)
  {
    uint64_t v19 = v17;
    if (*(_DWORD *)(a4 + 16) > v17) {
      int v17 = *(_DWORD *)(a4 + 16);
    }
    uint64_t v20 = v5 + v18;
    uint64_t v21 = v8 + a3;
    uint64_t v22 = v8 + a3 + 31670;
    uint64_t v23 = v21 + 31672;
    while (v19 != v17)
    {
      uint64_t v24 = *(__int16 *)(v9 + 50);
      if (*(_DWORD *)(v9 + 44) == 60)
      {
        if (*(__int16 *)(v9 + 50) < 2)
        {
          LODWORD(v27) = 1;
        }
        else
        {
          uint64_t v25 = 0;
          while (*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v19) != *(unsigned __int16 *)(v23 + 2 * v25))
          {
            unint64_t v26 = v25 + 3;
            v25 += 2;
            if (v26 >= *(unsigned __int16 *)(v9 + 50)) {
              goto LABEL_41;
            }
          }
          LODWORD(v27) = v25 + 1;
        }
      }
      else if ((int)v24 < 1)
      {
        LODWORD(v27) = 0;
      }
      else
      {
        uint64_t v27 = 0;
        while (*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v19) != *(unsigned __int16 *)(v22 + 2 * v27))
        {
          if (v24 == ++v27) {
            goto LABEL_41;
          }
        }
      }
      if ((int)v27 < (int)v24 && ++v19 < v20) {
        continue;
      }
LABEL_41:
      int v17 = v19;
      break;
    }
  }
  *a2 = v17;
  return 1;
}

uint64_t sub_189AC(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int *a8, _DWORD *a9, char a10)
{
  int v14 = a1;
  if (a7 != 74)
  {
    if (a2 > a1)
    {
      int v19 = *(_DWORD *)(a5 + 20);
      if (a2 - a1 + v19 > *(_DWORD *)(a5 + 16)) {
        return 0;
      }
      uint64_t v20 = *(void *)(a5 + 8);
      uint64_t v21 = (__int16 *)(*(void *)(a4 + 8) + 2 * a1);
      uint64_t v22 = a2 - (uint64_t)a1;
      do
      {
        *(_DWORD *)(a6 + 4 * v19) = v14;
        __int16 v23 = *v21++;
        uint64_t v24 = *(int *)(a5 + 20);
        *(_WORD *)(v20 + 2 * v24) = v23;
        int v19 = v24 + 1;
        *(_DWORD *)(a5 + 20) = v24 + 1;
        ++v14;
        --v22;
      }
      while (v22);
    }
    return 1;
  }
  if (a2 <= a1) {
    return 1;
  }
  for (uint64_t i = 2 * a1; ; i += 2)
  {
    uint64_t result = sub_18AC8(*(unsigned __int16 *)(*(void *)(a4 + 8) + i), a3, v14, a4, a5, a6, a8, a9, a10);
    if (!result) {
      break;
    }
    if (a2 == ++v14) {
      return 1;
    }
  }
  return result;
}

uint64_t sub_18AC8(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, _DWORD *a8, char a9)
{
  __int16 v16 = a1;
  int v17 = sub_16DC8(a1, a2);
  unsigned int v18 = v17[4];
  if (v18) {
    return sub_18BDC((void *)(a2 + 8 * v18 + 31672), 1, *(__int16 *)(a2 + 8 * v18 + 31668), 0, a3, a4, a5, a6, a7, a8);
  }
  uint64_t v20 = v17[12];
  if (v20)
  {
    unsigned int v18 = *(_DWORD *)(a2 + 8 * v20 + 31632);
    if (v18) {
      return sub_18BDC((void *)(a2 + 8 * v18 + 31672), 1, *(__int16 *)(a2 + 8 * v18 + 31668), 0, a3, a4, a5, a6, a7, a8);
    }
  }

  return sub_18D2C(v16, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_18BDC(void *__src, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  uint64_t v10 = *(int *)(a7 + 20);
  if ((int)v10 + a3 > *(_DWORD *)(a7 + 16)) {
    return 0;
  }
  int v13 = a5 + a2;
  if (a5 + a2 > *(_DWORD *)(a6 + 16)) {
    return 0;
  }
  memcpy((void *)(*(void *)(a7 + 8) + 2 * v10), __src, 2 * a3);
  if (*a10 == 2)
  {
    if (*a9 == a5) {
      *a9 = *(_DWORD *)(a7 + 20);
    }
    goto LABEL_23;
  }
  if (!*a10)
  {
    int v19 = *a9;
    if (*a9 >= a5 && v19 < v13)
    {
      int v23 = *(_DWORD *)(a7 + 20);
    }
    else
    {
      if (v19 != v13 || *(_WORD *)(*(void *)(a6 + 8) + 2 * v19) != 0) {
        goto LABEL_23;
      }
      if (a3 >= 0) {
        int v22 = a3;
      }
      else {
        int v22 = a3 + 1;
      }
      int v23 = *(_DWORD *)(a7 + 20) + (v22 >> 1) + 1;
    }
    *a9 = v23;
    *a10 = 1;
  }
LABEL_23:
  if (a3 >= 1)
  {
    uint64_t v24 = 0;
    do
    {
      *(_DWORD *)(a8 + 4 * (v24 + *(int *)(a7 + 20))) = a5 + a4;
      ++v24;
    }
    while (a3 != v24);
  }
  *(_DWORD *)(a7 + 20) += a3;
  return 1;
}

uint64_t sub_18D2C(__int16 a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, _DWORD *a8, char a9)
{
  __int16 v31 = a1;
  uint64_t v13 = *(unsigned int *)(a2 + 956);
  if (v13) {
    return sub_18BDC((void *)(a2 + 8 * v13 + 31616 + 2 * *(__int16 *)(a2 + 8 * v13 + 31666) + 54), *(__int16 *)(a2 + 8 * v13 + 31666), *(__int16 *)(a2 + 8 * v13 + 31668), 0, a3, a4, a5, a6, v25, v26);
  }
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v28 = a4;
  if (a9 < 0) {
    uint64_t v15 = (char *)&unk_1EEDA;
  }
  else {
    uint64_t v15 = _lou_showString((uint64_t)&v31, 1, 1);
  }
  size_t v16 = strlen(v15);
  uint64_t v27 = (uint64_t)&v27;
  uint64_t v17 = __chkstk_darwin(v16);
  int v19 = (char *)&v27 - v18;
  if (v17)
  {
    uint64_t v20 = 0;
    unsigned int v21 = 0;
    do
    {
      uint64_t v22 = *((unsigned int *)sub_16DC8((unsigned __int16)v15[v20], a2) + 5);
      if (!v22) {
        goto LABEL_12;
      }
      while (1)
      {
        uint64_t v23 = a2 + 8 * v22 + 31616;
        if ((*(_DWORD *)(v23 + 44) - 61) <= 8 && *(_WORD *)(v23 + 52) == 1) {
          break;
        }
        uint64_t v22 = *(unsigned int *)(v23 + 16);
        if (!v22) {
          goto LABEL_12;
        }
      }
      int v24 = *(unsigned __int16 *)(v23 + 56);
      *(_WORD *)&v19[2 * v20] = v24;
      if (!v24) {
LABEL_12:
      }
        *(_WORD *)&v19[2 * v20] = _lou_charToFallbackDots((unsigned __int16)v15[v20]);
      uint64_t v20 = ++v21;
    }
    while (v16 > v21);
  }
  return sub_18BDC(v19, 1, v16, 0, a3, v28, v29, v30, a7, a8);
}

uint64_t sub_18F3C(int a1, int a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, int *a10, _DWORD *a11, char a12)
{
  LODWORD(v18) = a1;
  if (*a11 == 2
    || (uint64_t v19 = *(unsigned int *)(a3 + 2536), !v19)
    || (uint64_t result = sub_18BDC((void *)(a3 + 8 * v19 + 31670), 0, *(__int16 *)(a3 + 8 * v19 + 31668), 0, *a4, a5, a6, a7, a10, a11), result))
  {
    if ((int)v18 >= a2)
    {
      int v25 = 0;
    }
    else
    {
      int v25 = 0;
      uint64_t v18 = (int)v18;
      do
      {
        *(void *)(a8 + 8 * v18) = 0;
        int v21 = *(unsigned __int16 *)(*(void *)(a5 + 8) + 2 * v18);
        if (v21 == 0xFFFF)
        {
          int v25 = 1;
        }
        else
        {
          *a4 = v18;
          uint64_t v22 = *((unsigned int *)sub_16DC8(v21, a3) + 10);
          if (v22)
          {
            uint64_t v23 = a3 + 8 * v22 + 31616;
            *a9 = v23;
            uint64_t result = sub_18BDC((void *)(v23 + 2 * *(__int16 *)(v23 + 50) + 54), *(__int16 *)(v23 + 50), *(__int16 *)(v23 + 52), 0, *a4, a5, a6, a7, a10, a11);
            if (!result) {
              return result;
            }
          }
          else
          {
            uint64_t result = sub_18AC8(*(unsigned __int16 *)(*(void *)(a5 + 8) + 2 * v18), a3, *a4, a5, a6, a7, a10, a11, a12);
            if (!result) {
              return result;
            }
          }
        }
        ++v18;
      }
      while (a2 != v18);
    }
    if (*a11 == 2
      || (uint64_t v24 = *(unsigned int *)(a3 + 2540), !v24)
      || (uint64_t result = sub_18BDC((void *)(a3 + 8 * v24 + 31670), 0, *(__int16 *)(a3 + 8 * v24 + 31668), 0, *a4, a5, a6, a7, a10, a11), result))
    {
      *a4 = a2;
      if (!v25) {
        return 1;
      }
      __int16 __src = -1;
      uint64_t result = sub_18BDC(&__src, 0, 1, 0, a2, a5, a6, a7, a10, a11);
      if (result) {
        return 1;
      }
    }
  }
  return result;
}

unint64_t sub_19168(unint64_t result, int a2, int a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int *a12, _DWORD *a13)
{
  int v50 = result;
  uint64_t v18 = a12;
  if (a2 && a3)
  {
    for (uint64_t i = 0; i != 144; i += 24)
    {
      unsigned int v20 = *(_DWORD *)(a6 + i + 1568);
      if (v20
        && ((HIWORD(*(void *)(a11 + 8 * a5)) | WORD1(*(void *)(a11 + 8 * a5)) | (unsigned __int16)(HIDWORD(*(void *)(a11 + 8 * a5)) | *(void *)(a11 + 8 * a5))) & v20) != 0)
      {
        uint64_t result = sub_19E44(a11, a5, a6 + i + 1552, a6, a7, a8, a9, a10, a12, a13);
      }
    }
  }
  if (a2 && a4)
  {
    for (uint64_t j = 0; j != 10; ++j)
    {
      int v22 = *(_DWORD *)(a6 + 24 * j + 1328);
      if (v22)
      {
        int v23 = (unsigned __int16)(*(_WORD *)(a11 + 8 * a5 + 2) & v22) != 0;
        if ((*(_WORD *)(a11 + 8 * a5 + 2) & (unsigned __int16)v22) != 0 && a5 >= 1)
        {
          int v25 = 0;
          int v26 = (unsigned __int16)*(_DWORD *)(a6 + 24 * j + 1328);
          int v23 = 1;
          unsigned int v27 = a5 - 1;
          while (1)
          {
            uint64_t result = *(void *)(a11 + 8 * v27);
            if ((v26 & result) != 0) {
              break;
            }
            result >>= 32;
            if ((v26 & result) != 0) {
              goto LABEL_23;
            }
            ++v23;
            --v27;
            if (a5 == ++v25)
            {
              int v23 = a5 + 1;
              goto LABEL_23;
            }
          }
          int v23 = v25 + 1;
        }
      }
      else
      {
        int v23 = 0;
      }
LABEL_23:
      v55[j] = v23;
    }
    uint64_t v28 = 0;
    for (uint64_t k = 0xFFFFFFFFLL; ; uint64_t k = 0xFFFFFFFFLL)
    {
      do
      {
        int v30 = v55[v28];
        if (v30 >= 1 && ((k & 0x80000000) != 0 || v30 < v55[k])) {
          uint64_t k = v28;
        }
        ++v28;
      }
      while (v28 != 10);
      if ((k & 0x80000000) != 0) {
        break;
      }
      v55[k] = 0;
      uint64_t result = sub_19E44(a11, a5, a6 + 24 * k + 1312, a6, a7, a8, a9, a10, a12, a13);
      uint64_t v28 = 0;
    }
  }
  int v52 = a7;
  int v31 = v50;
  if (!v50 || !a4) {
    goto LABEL_65;
  }
  uint64_t v32 = 0;
  uint64_t v33 = a5 + 1;
  do
  {
    uint64_t v34 = a6 + 24 * v32;
    int v35 = *(_DWORD *)(v34 + 1328);
    if (!v35)
    {
LABEL_50:
      int v39 = 0;
      goto LABEL_53;
    }
    uint64_t v36 = *(void *)(a11 + 8 * a5);
    if (((unsigned __int16)*(_DWORD *)(v34 + 1328) & (unsigned __int16)v36) != 0)
    {
      int v37 = *(_DWORD *)(a8 + 16);
      if ((int)v33 >= v37) {
        goto LABEL_51;
      }
      uint64_t v38 = 0;
      int v39 = v37 - a5;
      int v40 = ~a5 + v37;
      while ((v35 & WORD1(*(void *)(a11 + 8 * v33 + 8 * v38))) == 0)
      {
        if (v40 == ++v38) {
          goto LABEL_53;
        }
      }
      int v39 = v38 + 1;
    }
    else
    {
      if (((unsigned __int16)*(_DWORD *)(v34 + 1328) & WORD2(v36)) == 0) {
        goto LABEL_50;
      }
      if ((int)v33 >= *(_DWORD *)(a8 + 16))
      {
LABEL_51:
        int v39 = 1;
        goto LABEL_53;
      }
      unint64_t v41 = (_DWORD *)(v34 + 1328);
      int v39 = 1;
      uint64_t v42 = a5 + 1;
      do
      {
        if ((*v41 & WORD1(*(void *)(a11 + 8 * v42))) != 0) {
          break;
        }
        uint64_t result = (unint64_t)sub_16DC8(*(unsigned __int16 *)(*(void *)(a8 + 8) + 2 * v42), a6);
        if ((*(unsigned char *)(result + 25) & 0x20) != 0) {
          break;
        }
        uint64_t result = sub_196BC(*(unsigned __int16 *)(*(void *)(a8 + 8) + 2 * v42), a6, a6 + 24 * v32 + 1312);
        if (result) {
          break;
        }
        ++v39;
        ++v42;
      }
      while (v42 < *(int *)(a8 + 16));
    }
LABEL_53:
    v55[v32++] = v39;
    uint64_t v18 = a12;
  }
  while (v32 != 10);
  uint64_t v43 = 9;
  for (int m = 9; ; int m = 9)
  {
    do
    {
      uint64_t v45 = v43;
      if (v55[m] < v55[v43]) {
        int m = v43;
      }
      --v43;
    }
    while (v45);
    if (!v55[m]) {
      break;
    }
    v55[m] = 0;
    uint64_t result = sub_19ECC(a11, a5, a6 + 24 * m + 1312, a6, v52, a8, a9, a10, a12, a13);
    uint64_t v43 = 9;
  }
  for (uint64_t n = 0; n != -240; n -= 24)
  {
    if (((HIWORD(*(void *)(a11 + 8 * a5)) | WORD1(*(void *)(a11 + 8 * a5)) | (unsigned __int16)(HIDWORD(*(void *)(a11 + 8 * a5)) | *(void *)(a11 + 8 * a5))) & *(_DWORD *)(a6 + n + 1544)) != 0) {
      uint64_t result = sub_1A018(a11, a5, a6 + n + 1528, a6, v52, a8, a9, a10, a12, a13);
    }
  }
  int v31 = v50;
LABEL_65:
  if (v31 && a3)
  {
    for (iuint64_t i = 0; ii != -144; ii -= 24)
    {
      uint64_t v48 = a6 + ii;
      unsigned int v49 = *(_DWORD *)(a6 + ii + 1688);
      if (v49)
      {
        if (((HIWORD(*(void *)(a11 + 8 * a5)) | WORD1(*(void *)(a11 + 8 * a5)) | (unsigned __int16)(HIDWORD(*(void *)(a11 + 8 * a5)) | *(void *)(a11 + 8 * a5))) & v49) != 0)
        {
          uint64_t v54 = v48 + 1672;
          sub_19ECC(a11, a5, v48 + 1672, a6, v52, a8, a9, a10, v18, a13);
          uint64_t result = sub_1A018(a11, a5, v54, a6, v52, a8, a9, a10, v18, a13);
        }
      }
    }
  }
  return result;
}

BOOL sub_196BC(int a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a2 + 36 * *(unsigned __int16 *)(a3 + 20) + 1984);
  if (*(void *)(a3 + 8) == 16 && (!v6 || !*(_DWORD *)(a2 + 952))) {
    return *((_DWORD *)sub_16DC8(a1, a2) + 6) & 1;
  }
  if (sub_1977C(a1, a2, a3)) {
    return 0;
  }
  if (!v6) {
    return 1;
  }

  return sub_19854(a1, a2, a3);
}

BOOL sub_1977C(int a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 8))
  {
    uint64_t v5 = (unsigned int *)sub_16DC8(a1, a2);
    uint64_t v6 = v5[12];
    uint64_t v7 = a2 + 8 * v6 + 31616;
    if (!v6) {
      uint64_t v7 = (uint64_t)v5;
    }
    uint64_t v8 = *(void *)(a3 + 8);
    if ((v8 & *(void *)(v7 + 24)) != 0)
    {
      return 1;
    }
    else
    {
      while (1)
      {
        uint64_t v9 = *(unsigned int *)(v7 + 52);
        if (!v9) {
          break;
        }
        uint64_t v10 = a2 + 8 * v9;
        uint64_t v7 = v10 + 31616;
        if ((*(void *)(v10 + 31640) & v8) != 0) {
          return 1;
        }
      }
      return 0;
    }
  }
  else
  {
    uint64_t v12 = (_WORD *)(a2 + 514 * *(unsigned __int16 *)(a3 + 20) + 8468);
    if (*v12)
    {
      do
      {
        int v14 = (unsigned __int16)*v12++;
        int v13 = v14;
        if (v14) {
          BOOL v15 = v13 == a1;
        }
        else {
          BOOL v15 = 1;
        }
      }
      while (!v15);
      return v13 == 0;
    }
    else
    {
      return (*((_DWORD *)sub_16DC8(a1, a2) + 6) & 1) == 0;
    }
  }
}

BOOL sub_19854(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t v7 = sub_16DC8(a1, a2);
  uint64_t v8 = v7[3];
  if (v6)
  {
    uint64_t v9 = *(void *)(a3 + 8);
    if ((v9 & v8) == 0)
    {
      uint64_t v10 = *((unsigned int *)v7 + 12);
      if (v10) {
        uint64_t v11 = a2 + 8 * v10 + 31616;
      }
      else {
        uint64_t v11 = (uint64_t)v7;
      }
      for (uint64_t i = *(unsigned int *)(v11 + 52); i; uint64_t i = *(unsigned int *)(v13 + 31668))
      {
        uint64_t v13 = a2 + 8 * i;
        if ((v7[4] & ~*(void *)(v13 + 31648)) == 0 && (*(void *)(v13 + 31640) & v9) != 0) {
          return 0;
        }
      }
      if (v9 == 4)
      {
        int v14 = *((_DWORD *)sub_16DC8(a1, a2) + 6);
        int v15 = 67111172;
      }
      else
      {
        if (v9 != 16) {
          return (*((unsigned char *)sub_16DC8(a1, a2) + 24) & 2) == 0;
        }
        int v14 = *((unsigned __int16 *)sub_16DC8(a1, a2) + 12);
        int v15 = 514;
      }
      return (v14 & v15) == 0;
    }
    return 0;
  }
  if ((v8 & 2) != 0) {
    return 0;
  }
  uint64_t v16 = a2 + 514 * *(unsigned __int16 *)(a3 + 20);
  if (!*(_WORD *)(v16 + 3328)) {
    return *((unsigned char *)sub_16DC8(a1, a2) + 24) & 1;
  }
  uint64_t v17 = (unsigned __int16 *)(v16 + 3328);
  do
  {
    int v19 = *v17++;
    int v18 = v19;
    BOOL result = v19 == 0;
    if (v19) {
      BOOL v21 = v18 == a1;
    }
    else {
      BOOL v21 = 1;
    }
  }
  while (!v21);
  return result;
}

uint64_t sub_19994(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (unsigned int *)(a6 + 36 * *(unsigned __int16 *)(a5 + 20) + 1960);
  if ((int)result <= a2)
  {
    uint64_t v12 = (int)result;
    uint64_t v13 = (unint64_t *)(a4 + 8 * (int)result);
    int v14 = a2 - result + 1;
    int v15 = (_DWORD *)(a7 + 4 * (int)result);
    do
    {
      unint64_t v16 = HIDWORD(*v13);
      unint64_t v17 = *v13 & 0xFFFFFFFFFFFFLL | ((HIWORD(*v13) & (unsigned __int16)~(unsigned __int16)*(_DWORD *)(a5 + 16)) << 48);
      unint64_t *v13 = v17;
      *v13++ = v17 & 0xFFFF0000FFFFFFFFLL | ((v16 & (unsigned __int16)~*(_WORD *)(a5 + 16)) << 32);
      *v15++ &= ~4u;
      --v14;
    }
    while (v14);
  }
  else
  {
    uint64_t v12 = (int)result;
  }
  *(_WORD *)(a4 + 8 * v12) = *(_DWORD *)(a5 + 16) | *(void *)(a4 + 8 * v12);
  if (v11[4] || v11[2])
  {
    int v18 = *(_DWORD *)(a5 + 16);
    uint64_t v19 = a4 + 8 * a2;
LABEL_8:
    *(_WORD *)(v19 + 2) = (*(void *)v19 | (v18 << 16)) >> 16;
    return result;
  }
  uint64_t v20 = v11[1];
  if (v20)
  {
    uint64_t v21 = v11[6];
    if (v21)
    {
      uint64_t v22 = a6 + 8 * v20 + 31616;
      uint64_t v23 = a6 + 8 * v21 + 31616;
      int v24 = *(unsigned __int16 *)(v22 + 52);
      if (v24 == *(unsigned __int16 *)(v23 + 52))
      {
        BOOL result = memcmp((const void *)(v22 + 54), (const void *)(v23 + 54), 2 * (__int16)v24);
        if (!result)
        {
          *(_WORD *)(a4 + 8 * a3 + 4) = *(_DWORD *)(a5 + 16) | *(_DWORD *)(a4 + 8 * a3 + 4);
          *(_DWORD *)(a7 + 4 * a3) |= 4u;
          return result;
        }
      }
    }
    int v18 = *(_DWORD *)(a5 + 16);
    uint64_t v19 = a4 + 8 * a3;
    goto LABEL_8;
  }
  return result;
}

uint64_t sub_19B00(uint64_t a1, int a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (a2 - 2);
  if (a2 < 2) {
    return 1;
  }
  while (1)
  {
    uint64_t v8 = *((void *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v5), a1) + 3);
    if ((v8 & 1) == 0) {
      break;
    }
    if (v5-- < 1) {
      return 1;
    }
  }
  return (v8 >> 1) & 1;
}

uint64_t sub_19B70(uint64_t a1, int a2, char a3, uint64_t a4, int a5, int a6, int a7)
{
  if (a6 + a2 >= *(_DWORD *)(a4 + 16)) {
    return 1;
  }
  uint64_t v12 = a6 + (uint64_t)a2;
  do
  {
    uint64_t v13 = sub_16DC8(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v12), a1);
    int v14 = *(_DWORD *)(a4 + 16);
    if ((v13[24] & 1) == 0) {
      break;
    }
    ++v12;
  }
  while (v12 < v14);
  if (v14 == v12) {
    return 1;
  }
  if (a5 == 94)
  {
    if ((*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * (int)v12), a1) + 24) & 6) == 0
      || (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a4 + 8) + (((v12 << 32) - 0x100000000) >> 31)), a1)
          + 24) & 1) == 0)
    {
      return 1;
    }
    int v14 = *(_DWORD *)(a4 + 16);
  }
  LODWORD(v16) = v12;
  if (v14 > (int)v12)
  {
    uint64_t v16 = (int)v12;
    do
    {
      if (*((unsigned char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v16), a1) + 24)) {
        break;
      }
      ++v16;
    }
    while (v16 < *(int *)(a4 + 16));
  }
  if ((a3 & 0x22) != 0 && (int)v12 <= a7 && (int)v16 > a7) {
    return 0;
  }
  if ((int)v16 <= (int)v12) {
    return 1;
  }
  uint64_t v17 = (int)v12;
  uint64_t v18 = 2 * (int)v12;
  while (2)
  {
    char v34 = 0;
    int v19 = *(_DWORD *)(a4 + 16) - v17;
    char v20 = 1;
    uint64_t v31 = v17;
    do
    {
      char v21 = v20;
      if (v20)
      {
        if (v19 < 2) {
          goto LABEL_44;
        }
        uint64_t v22 = (unsigned int *)(a1
                             + 4 * _lou_stringHash((unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v17), 1, a1)
                             + 22632);
      }
      else
      {
        if (v19 < 1) {
          break;
        }
        uint64_t v22 = (unsigned int *)((char *)sub_16DC8(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v17), a1) + 20);
        int v19 = 1;
      }
      uint64_t v23 = *v22;
      if (v23)
      {
        char v32 = v21;
        int v33 = v19;
        unint64_t v24 = v19;
        while (1)
        {
          uint64_t v25 = a1 + 8 * v23 + 31616;
          if (*(__int16 *)(a1 + 8 * v23 + 31666) < 1)
          {
            LODWORD(v26) = 0;
          }
          else
          {
            unint64_t v26 = 0;
            uint64_t v27 = a1 + 31670 + 8 * v23;
            do
            {
              uint64_t v28 = sub_16DC8(*(unsigned __int16 *)(v27 + 2 * v26), a1);
              uint64_t v29 = sub_16DC8(*(unsigned __int16 *)(*(void *)(a4 + 8) + v18 + 2 * v26), a1);
              LODWORD(v28) = sub_10904(a1, (uint64_t)v28);
              if (v28 != sub_10904(a1, (uint64_t)v29)) {
                break;
              }
            }
            while ((uint64_t)++v26 < *(__int16 *)(v25 + 50) && v26 < v24);
          }
          if (((v34 & 1) != 0 || v26 == *(__int16 *)(v25 + 50)) && (*(_DWORD *)(v25 + 44) & 0xFFFFFFFE) == 0x58) {
            return 0;
          }
          uint64_t v23 = *(unsigned int *)(v25 + 16);
          if (!v23)
          {
            uint64_t v17 = v31;
            char v21 = v32;
            int v19 = v33;
            break;
          }
        }
      }
LABEL_44:
      char v20 = 0;
      char v34 = 1;
    }
    while ((v21 & 1) != 0);
    ++v17;
    v18 += 2;
    uint64_t result = 1;
    if (v16 != v17) {
      continue;
    }
    return result;
  }
}

uint64_t sub_19E44(uint64_t result, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  uint64_t v10 = *(void *)(result + 8 * a2);
  int v11 = *(_DWORD *)(a3 + 16);
  if ((v11 & WORD1(v10)) != 0)
  {
    if (((unsigned __int16)v11 & WORD2(v10)) != 0)
    {
      unsigned int v12 = *(_DWORD *)(a4 + 36 * *(unsigned __int16 *)(a3 + 20) + 1988);
      if (!v12) {
        return result;
      }
      goto LABEL_7;
    }
    unsigned int v12 = *(_DWORD *)(a4 + 36 * *(unsigned __int16 *)(a3 + 20) + 1976);
    if (v12 || (unsigned int v12 = *(_DWORD *)(a4 + 36 * *(unsigned __int16 *)(a3 + 20) + 1968)) != 0)
    {
LABEL_7:
      int v13 = -1;
      return sub_18BDC((void *)(a4 + 8 * v12 + 31670), 0, *(__int16 *)(a4 + 8 * v12 + 31668), v13, a5, a6, a7, a8, a9, a10);
    }
    unsigned int v12 = *(_DWORD *)(a4 + 36 * *(unsigned __int16 *)(a3 + 20) + 1964);
    if (v12)
    {
      int v13 = 0;
      return sub_18BDC((void *)(a4 + 8 * v12 + 31670), 0, *(__int16 *)(a4 + 8 * v12 + 31668), v13, a5, a6, a7, a8, a9, a10);
    }
  }
  return result;
}

uint64_t sub_19ECC(uint64_t result, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  uint64_t v11 = result;
  unsigned int v12 = (unsigned int *)(a4 + 36 * *(unsigned __int16 *)(a3 + 20) + 1960);
  uint64_t v13 = a2;
  if ((*(void *)(result + 8 * a2) & *(unsigned __int16 *)(a3 + 16)) != 0)
  {
    unsigned int v14 = *v12;
    if (*v12 || (unsigned int v14 = *(_DWORD *)(a4 + 36 * *(unsigned __int16 *)(a3 + 20) + 1972)) != 0)
    {
      uint64_t v26 = a4;
      int v15 = a5;
      uint64_t v16 = a6;
      uint64_t v17 = a7;
      uint64_t v18 = a8;
      uint64_t result = sub_18BDC((void *)(a4 + 8 * v14 + 31670), 0, *(__int16 *)(a4 + 8 * v14 + 31668), 0, a5, a6, a7, a8, a9, a10);
      a4 = v26;
      a5 = v15;
      a6 = v16;
      a7 = v17;
      a8 = v18;
    }
  }
  uint64_t v19 = *(void *)(v11 + 8 * v13);
  int v20 = *(_DWORD *)(a3 + 16);
  unsigned int v21 = v20 & WORD1(v19);
  if (((unsigned __int16)v20 & WORD2(v19)) != 0 && v21 == 0)
  {
    uint64_t v23 = v12[6];
    if (v23)
    {
      uint64_t v24 = a4 + 8 * v23;
      int v25 = *(__int16 *)(v24 + 31668);
      return sub_18BDC((void *)(v24 + 31670), 0, v25, 0, a5, a6, a7, a8, a9, a10);
    }
  }
  return result;
}

uint64_t sub_1A018(uint64_t result, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  if ((*(_DWORD *)(a3 + 16) & *(unsigned __int16 *)(result + 8 * a2 + 6)) != 0)
  {
    uint64_t v10 = *(unsigned int *)(a4 + 36 * *(unsigned __int16 *)(a3 + 20) + 1980);
    if (v10) {
      return sub_18BDC((void *)(a4 + 8 * v10 + 31670), 0, *(__int16 *)(a4 + 8 * v10 + 31668), 0, a5, a6, a7, a8, a9, a10);
    }
  }
  return result;
}

uint64_t _lou_pattern_compile(uint64_t a1, int a2, unsigned __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v9 = 0;
  *(_DWORD *)a3 = 2;
  uint64_t result = sub_1A108(a1, a2, &v9, (uint64_t)a3, a4, a3, a3 + 1, a5, a6);
  if (result)
  {
    *a3 += 3;
    uint64_t result = sub_1A258((uint64_t)a3, 2u, a4, a3);
    if (result)
    {
      uint64_t result = sub_1A388((uint64_t)a3, 2u, a4, a3);
      if (result) {
        return *a3;
      }
    }
  }
  return result;
}

uint64_t sub_1A108(uint64_t a1, int a2, int *a3, uint64_t a4, int a5, unsigned __int16 *a6, _WORD *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a6;
  if ((int)v9 + 6 >= a5) {
    return 0;
  }
  *(_WORD *)(a4 + 2 * v9) = 1;
  *(_WORD *)(a4 + 2 * *a6 + 2) = -1;
  unsigned __int16 v14 = *a6 + 3;
  *a6 = v14;
  *(_WORD *)(a4 + 2 * v9 + 4) = v14;
  *(_WORD *)(a4 + 2 * *a6) = -1;
  *(_WORD *)(a4 + 2 * *a6 + 2) = v9;
  *(_WORD *)(a4 + 2 * *a6 + 4) = -1;
  if (*a3 >= a2) {
    return *a6;
  }
  while (1)
  {
    uint64_t v18 = *a6;
    uint64_t result = sub_1A73C(a1, a2, a3, a4, a5, a6, a7, a8, a9);
    if (!result) {
      break;
    }
    int v20 = *a6;
    if (v20 + 3 >= a5) {
      return 0;
    }
    *(_WORD *)(a4 + 2 * v18 + 4) = v20;
    *(_WORD *)(a4 + 2 * *a6) = -1;
    *(_WORD *)(a4 + 2 * *a6 + 2) = v18;
    *(_WORD *)(a4 + 2 * *a6 + 4) = -1;
    if (*a3 >= a2) {
      return *a6;
    }
  }
  return result;
}

uint64_t sub_1A258(uint64_t a1, unsigned int a2, uint64_t a3, _WORD *a4)
{
  for (uint64_t i = a2; ; uint64_t i = *(unsigned __int16 *)(a1 + 2 * i + 4))
  {
    int v8 = *(unsigned __int16 *)(a1 + 2 * i);
    if ((v8 - 2) >= 2) {
      break;
    }
    uint64_t result = sub_1A258(a1, *(unsigned __int16 *)(a1 + 2 * i + 6), a3, a4);
    if (!result) {
      return result;
    }
    int v8 = *(unsigned __int16 *)(a1 + 2 * i);
LABEL_6:
    if ((v8 - 4) <= 2)
    {
      uint64_t v10 = (unsigned __int16)*a4;
      if ((int)v10 + 6 >= (int)a3) {
        return 0;
      }
      uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * (i + 1));
      if (*(_WORD *)(a1 + 2 * v11) == 1) {
        return 0;
      }
      uint64_t v12 = a1 + 2 * v11;
      uint64_t v13 = *(unsigned __int16 *)(v12 + 2);
      *(_WORD *)(a1 + 2 * v10) = 1;
      uint64_t v14 = a1 + 2 * v10;
      *(_WORD *)(v14 + 2) = -1;
      *(_WORD *)(v14 + 4) = v11;
      LOWORD(v14) = *a4 + 3;
      *a4 = v14;
      *(_WORD *)(a1 + 2 * (unsigned __int16)v14) = -1;
      *(_WORD *)(a1 + 2 * ((unsigned __int16)v14 + 1)) = v11;
      *(_WORD *)(a1 + 2 * ((unsigned __int16)v14 + 2)) = i;
      *a4 += 3;
      *(_WORD *)(a1 + 2 * i + 6) = v10;
      *(_WORD *)(a1 + 2 * v13 + 4) = i;
      *(_WORD *)(a1 + 2 * (i + 1)) = v13;
      *(_WORD *)(v12 + 2) = v10;
      *(_WORD *)(v12 + 4) = v14;
    }
  }
  if (v8 != 0xFFFF) {
    goto LABEL_6;
  }
  return 1;
}

uint64_t sub_1A388(uint64_t a1, unsigned int a2, uint64_t a3, _WORD *a4)
{
  for (uint64_t i = a2; ; uint64_t i = *(unsigned __int16 *)(a1 + 2 * v16))
  {
    int v8 = *(unsigned __int16 *)(a1 + 2 * i);
    if ((v8 - 2) >= 5)
    {
      if (v8 == 0xFFFF) {
        return 1;
      }
    }
    else
    {
      uint64_t result = sub_1A388(a1, *(unsigned __int16 *)(a1 + 2 * i + 6), a3, a4);
      if (!result) {
        return result;
      }
      int v8 = *(unsigned __int16 *)(a1 + 2 * i);
    }
    if (v8 != 7)
    {
      uint64_t v16 = i + 2;
      continue;
    }
    uint64_t v10 = (unsigned __int16)*a4;
    if ((int)v10 + 12 >= (int)a3) {
      break;
    }
    uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * (i + 1));
    if (*(_WORD *)(a1 + 2 * v11) == 1) {
      break;
    }
    LODWORD(v12) = *(unsigned __int16 *)(a1 + 2 * (i + 1));
    do
      uint64_t v12 = *(unsigned __int16 *)(a1 + 2 * (v12 + 1));
    while (*(_WORD *)(a1 + 2 * v12) != 1);
    uint64_t v13 = a1 + 2 * v12;
    uint64_t v14 = *(unsigned __int16 *)(v13 + 4);
    *(_WORD *)(a1 + 2 * v10) = 1;
    uint64_t v15 = a1 + 2 * v10;
    *(_WORD *)(v15 + 2) = -1;
    *(_WORD *)(v15 + 4) = v14;
    LOWORD(v15) = *a4 + 3;
    *a4 = v15;
    *(_WORD *)(a1 + 2 * (unsigned __int16)v15) = -1;
    *(_WORD *)(a1 + 2 * ((unsigned __int16)v15 + 1)) = v11;
    *(_WORD *)(a1 + 2 * ((unsigned __int16)v15 + 2)) = i;
    *a4 += 3;
    *(_WORD *)(a1 + 2 * i + 6) = v10;
    *(_WORD *)(v13 + 4) = i;
    *(_WORD *)(a1 + 2 * (i + 1)) = v12;
    *(_WORD *)(a1 + 2 * v14 + 2) = v10;
    *(_WORD *)(a1 + 2 * v11 + 4) = v15;
    uint64_t v16 = i + 2;
    uint64_t v17 = *(unsigned __int16 *)(a1 + 2 * (i + 2));
    int v18 = *(unsigned __int16 *)(a1 + 2 * v17);
    if (v18 == 7 || v18 == 0xFFFF) {
      break;
    }
    for (uint64_t j = *(unsigned __int16 *)(a1 + 2 * (i + 2)); ; uint64_t j = *(unsigned __int16 *)(a1 + 2 * j + 4))
    {
      int v21 = *(unsigned __int16 *)(a1 + 2 * j);
      if (v21 == 7 || v21 == 0xFFFF) {
        break;
      }
    }
    uint64_t v23 = a1 + 2 * j;
    uint64_t v24 = *(unsigned __int16 *)(v23 + 2);
    uint64_t v25 = (unsigned __int16)*a4;
    uint64_t v26 = a1 + 2 * v25;
    *(_DWORD *)uint64_t v26 = -65535;
    *(_WORD *)(v26 + 4) = v17;
    LOWORD(v26) = *a4 + 3;
    *a4 = v26;
    *(_WORD *)(a1 + 2 * (unsigned __int16)v26) = -1;
    *(_WORD *)(a1 + 2 * ((unsigned __int16)v26 + 1)) = v24;
    *(_WORD *)(a1 + 2 * ((unsigned __int16)v26 + 2)) = i;
    *a4 += 3;
    uint64_t v27 = a1 + 2 * i;
    *(_WORD *)(v27 + 8) = v25;
    *(_WORD *)(v23 + 2) = i;
    *(_WORD *)(a1 + 2 * v16) = j;
    *(_WORD *)(a1 + 2 * v17 + 2) = v25;
    *(_WORD *)(a1 + 2 * v24 + 4) = v26;
    uint64_t result = sub_1A388(a1, *(unsigned __int16 *)(v27 + 8), a3, a4);
    if (!result) {
      return result;
    }
  }
  return 0;
}

uint64_t _lou_pattern_reverse(uint64_t a1)
{
  return sub_1A5A4(a1, 2);
}

uint64_t sub_1A5A4(uint64_t result, int a2)
{
  uint64_t v2 = (a2 + 2);
  uint64_t v3 = *(unsigned __int16 *)(result + 2 * v2);
  if (*(__int16 *)(result + 2 * v3) != -1)
  {
    uint64_t v5 = result;
    do
      uint64_t v3 = *(unsigned __int16 *)(result + 2 * (v3 + 2));
    while (*(__int16 *)(result + 2 * v3) != -1);
    uint64_t v6 = *(unsigned __int16 *)(result + 2 * (v3 + 1));
    uint64_t v7 = v6 + 1;
    unsigned int v8 = *(unsigned __int16 *)(result + 2 * (v6 + 1));
    *(_WORD *)(result + 2 * v2) = v6;
    *(_WORD *)(result + 2 * (v6 + 1)) = a2;
    uint64_t v9 = v6 + 2;
    *(_WORD *)(result + 2 * (v6 + 2)) = v8;
    uint64_t result = sub_1AF90(result, v6);
    if (v8 != a2)
    {
      do
      {
        LOWORD(v6) = v8;
        unsigned int v10 = *(unsigned __int16 *)(v5 + 2 * (v8 + 1));
        uint64_t result = sub_1AF90(v5, v8);
        *(_WORD *)(v5 + 2 * (v8 + 1)) = *(_WORD *)(v5 + 2 * (v8 + 2));
        *(_WORD *)(v5 + 2 * (v8 + 2)) = v10;
        unsigned int v8 = v10;
      }
      while (v10 != a2);
      uint64_t v9 = (unsigned __int16)v6 + 2;
      uint64_t v7 = (unsigned __int16)v6 + 1;
    }
    *(_WORD *)(v5 + 2 * v7) = *(_WORD *)(v5 + 2 * v9);
    *(_WORD *)(v5 + 2 * v9) = v3;
    *(_WORD *)(v5 + 2 * (v3 + 1)) = v6;
  }
  return result;
}

BOOL _lou_pattern_check(uint64_t a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v14 = a2;
  uint64_t v11 = malloc_type_malloc(4 * *(unsigned __int16 *)(a5 + 2), 0x100004052888210uLL);
  bzero(v11, 4 * *(unsigned __int16 *)(a5 + 2));
  BOOL v12 = sub_1B028(a1, &v14, a3, a4, a5, 2, 0, 0, (uint64_t)v11, a6);
  free(v11);
  return v12;
}

uint64_t sub_1A73C(uint64_t a1, int a2, int *a3, uint64_t a4, int a5, unsigned __int16 *a6, _WORD *a7, uint64_t a8, uint64_t a9)
{
  int v13 = *a3;
  unsigned int v14 = *(unsigned __int16 *)(a1 + 2 * *a3);
  if (v14 > 0x3E)
  {
    if (*(unsigned __int16 *)(a1 + 2 * *a3) > 0x5Bu)
    {
      switch(v14)
      {
        case '\\':
          *a3 = ++v13;
          if (v13 >= a2) {
            return 0;
          }
          break;
        case '^':
LABEL_26:
          uint64_t v31 = *a6;
          if ((int)v31 + 3 >= a5) {
            return 0;
          }
          __int16 v32 = 12;
LABEL_38:
          *(_WORD *)(a4 + 2 * v31) = v32;
          *a3 = v13 + 1;
LABEL_39:
          __int16 v40 = *a6;
LABEL_40:
          unsigned __int16 v29 = v40 + 3;
LABEL_77:
          *a6 = v29;
          return v29;
        case '|':
          uint64_t v30 = *a6;
          if ((int)v30 + 5 >= a5) {
            return 0;
          }
          *(_WORD *)(a4 + 2 * v30) = 7;
LABEL_74:
          int v59 = v13 + 1;
          goto LABEL_75;
      }
    }
    else
    {
      switch(v14)
      {
        case '?':
          uint64_t v51 = *a6;
          if ((int)v51 + 4 >= a5) {
            return 0;
          }
          *(_WORD *)(a4 + 2 * v51) = 6;
          *a3 = v13 + 1;
          unsigned __int16 v29 = *a6 + 4;
          goto LABEL_77;
        case '@':
          int v52 = v13 + 1;
          *a3 = v13 + 1;
          if (v13 + 1 >= a2) {
            return 0;
          }
          int v53 = *(unsigned __int16 *)(a1 + 2 * v52);
          int v54 = v13 + 2;
          if (v53 == 91)
          {
            *a3 = v54;
            if (v54 >= a2) {
              return 0;
            }
            uint64_t v55 = (unsigned __int16 *)(a1 + 2 * v54);
            int v56 = v54;
            while (1)
            {
              int v57 = *v55++;
              if (v57 == 93) {
                break;
              }
              unsigned __int16 v29 = 0;
              if (a2 == ++v56) {
                return v29;
              }
            }
            int v52 = v54;
          }
          else
          {
            int v56 = v54;
          }
          uint64_t v76 = *a6;
          if (v56 + (int)v76 - v52 + 4 >= a5) {
            return 0;
          }
          *(_WORD *)(a4 + 2 * v76) = 11;
          uint64_t v77 = (_WORD *)(a4 + 2 * *a6 + 6);
          if (v52 >= v56)
          {
            LOWORD(v66) = 1;
          }
          else
          {
            int v78 = 0;
            uint64_t v79 = (unsigned __int16 *)(a1 + 2 * v52);
            int v66 = 1;
            uint64_t v80 = v56 - (uint64_t)v52;
            do
            {
              int v82 = *v79++;
              int v81 = v82;
              if (v78 || v81 != 92)
              {
                int v78 = 0;
                v77[v66++] = v81;
              }
              else
              {
                int v78 = 1;
              }
              --v80;
            }
            while (v80);
            *a3 = v56;
            int v52 = v56;
          }
          *uint64_t v77 = v66 - 1;
          if (v53 == 91)
          {
            int v83 = v52 + 1;
            goto LABEL_133;
          }
LABEL_134:
          __int16 v40 = v66 + *a6;
          goto LABEL_40;
        case '[':
          uint64_t v24 = v13 + 1;
          *a3 = v24;
          if ((int)v24 >= a2) {
            return 0;
          }
          uint64_t v25 = 0;
          int v26 = 0;
          while (1)
          {
            int v27 = *(unsigned __int16 *)(a1 + 2 * v24 + 2 * v25);
            if (v26 || v27 != 92)
            {
              int v28 = 0;
              if (!v26 && v27 == 93)
              {
                uint64_t v60 = *a6;
                if ((int)v60 + (int)v25 + 4 >= a5) {
                  return 0;
                }
                int v61 = v25 + v24;
                *(_WORD *)(a4 + 2 * v60) = 10;
                uint64_t v62 = (_WORD *)(a4 + 2 * *a6 + 6);
                if ((int)v24 >= v61)
                {
                  LOWORD(v66) = 1;
                }
                else
                {
                  int v63 = 0;
                  int v64 = (unsigned __int16 *)(a1 + 2 * v24);
                  uint64_t v65 = v61 - v24;
                  int v66 = 1;
                  do
                  {
                    int v68 = *v64++;
                    int v67 = v68;
                    if (v63 || v67 != 92)
                    {
                      int v63 = 0;
                      v62[v66++] = v67;
                    }
                    else
                    {
                      int v63 = 1;
                    }
                    --v65;
                  }
                  while (v65);
                  LODWORD(v24) = v61;
                }
                *uint64_t v62 = v66 - 1;
                int v83 = v24 + 1;
LABEL_133:
                *a3 = v83;
                goto LABEL_134;
              }
            }
            else
            {
              int v28 = 1;
            }
            unsigned __int16 v29 = 0;
            ++v25;
            int v26 = v28;
            if (!(v24 - a2 + v25)) {
              return v29;
            }
          }
      }
    }
LABEL_71:
    uint64_t v58 = *a6;
    if ((int)v58 + 5 >= a5) {
      return 0;
    }
    *(_WORD *)(a4 + 2 * v58) = 10;
    *(_WORD *)(a4 + 2 * *a6 + 6) = 1;
    __int16 v50 = *(_WORD *)(a1 + 2 * v13);
LABEL_73:
    *(_WORD *)(a4 + 2 * *a6 + 8) = v50;
    goto LABEL_74;
  }
  switch(*(_WORD *)(a1 + 2 * *a3))
  {
    case '!':
      uint64_t v15 = *a6;
      if ((int)v15 + 10 >= a5) {
        return 0;
      }
      *a3 = v13 + 1;
      *(_WORD *)(a4 + 2 * v15) = 3;
      uint64_t v16 = *a6;
      *a6 = v16 + 4;
      *(_WORD *)(a4 + 2 * v16 + 6) = v16 + 4;
      uint64_t v17 = *a6;
      uint64_t v18 = a4 + 2 * v17;
      *(_DWORD *)uint64_t v18 = -65535;
      unsigned __int16 v19 = *a6 + 3;
      *a6 = v19;
      *(_WORD *)(v18 + 4) = v19;
      uint64_t v20 = *a6;
      int v21 = (_WORD *)(a4 + 2 * v20);
      *int v21 = 0;
      v21[1] = v17;
      *(_WORD *)(a4 + 2 * (v20 + 2)) = -1;
      if (!sub_1A73C(a1)) {
        return 0;
      }
      int v22 = *a6;
      if (v22 + 3 >= a5) {
        return 0;
      }
      *(_WORD *)(a4 + 2 * (v20 + 2)) = v22;
      uint64_t v23 = (_WORD *)(a4 + 2 * *a6);
      *uint64_t v23 = -1;
      v23[1] = v20;
      goto LABEL_7;
    case '$':
      goto LABEL_26;
    case '%':
      uint64_t v33 = *a6;
      if ((int)v33 + 5 >= a5) {
        return 0;
      }
      int v34 = v13 + 1;
      *a3 = v13 + 1;
      if (v13 + 1 >= a2) {
        return 0;
      }
      int v35 = *(unsigned __int16 *)(a1 + 2 * v34);
      int v36 = v13 + 2;
      if (v35 == 91)
      {
        *a3 = v36;
        if (v36 >= a2) {
          return 0;
        }
        int v37 = (unsigned __int16 *)(a1 + 2 * v36);
        int v38 = v13 + 2;
        while (1)
        {
          int v39 = *v37++;
          if (v39 == 93) {
            break;
          }
          unsigned __int16 v29 = 0;
          if (a2 == ++v38) {
            return v29;
          }
        }
        *(_WORD *)(a4 + 2 * v33) = 9;
        if (v36 >= v38)
        {
          LOWORD(v70) = 0;
          LOWORD(v69) = 0;
          goto LABEL_116;
        }
        int v34 = v36;
      }
      else
      {
        *(_WORD *)(a4 + 2 * v33) = 9;
        int v38 = v13 + 2;
      }
      int v69 = 0;
      int v70 = 0;
      uint64_t v71 = (unsigned __int16 *)(a1 + 2 * v34);
      while (2)
      {
        int v73 = *v71++;
        uint64_t v72 = v73;
        if (v73 > 93)
        {
          if ((int)v72 > 107)
          {
            switch(v72)
            {
              case 'l':
                v70 |= 0x20u;
                break;
              case 'u':
                v70 |= 0x10u;
                break;
              case '~':
                v70 |= 0x2000u;
                break;
              default:
                return 0;
            }
          }
          else
          {
            switch(v72)
            {
              case '^':
                v69 |= 0x100u;
                break;
              case '_':
                v70 |= 1u;
                break;
              case 'a':
                v70 |= 2u;
                break;
              default:
                return 0;
            }
          }
LABEL_96:
          *a3 = ++v34;
          if (v38 == v34)
          {
            int v36 = v38;
LABEL_116:
            *(_WORD *)(a4 + 2 * *a6 + 6) = v69;
            *(_WORD *)(a4 + 2 * *a6 + 8) = v70;
            if (v35 != 91) {
              goto LABEL_76;
            }
            int v59 = v36 + 1;
LABEL_75:
            *a3 = v59;
LABEL_76:
            unsigned __int16 v29 = *a6 + 5;
            goto LABEL_77;
          }
          continue;
        }
        break;
      }
      switch((int)v72)
      {
        case '#':
          v70 |= 4u;
          goto LABEL_96;
        case '$':
          v70 |= 0x80u;
          goto LABEL_96;
        case '.':
          v70 |= 8u;
          goto LABEL_96;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
          int v74 = (unint64_t *)(a8 + 8 * v72 - 344);
          unint64_t v75 = *v74;
          if (*v74) {
            goto LABEL_95;
          }
          unint64_t v75 = *(void *)(a8 + 24);
          *int v74 = v75;
          if (v75 <= 0x800000)
          {
            *(void *)(a8 + 24) *= 2;
LABEL_95:
            v69 |= v75 >> 16;
            goto LABEL_96;
          }
          _lou_logMessage(40000, "%s:%d: error: Too many character attributes defined", *(const char **)a9, *(_DWORD *)(a9 + 24));
          return 0;
        case '<':
          v70 |= 0x4000u;
          goto LABEL_96;
        case '>':
          v70 |= 0x8000u;
          goto LABEL_96;
        default:
          return 0;
      }
    case '(':
      uint64_t v41 = *a6;
      if ((int)v41 + 10 >= a5) {
        return 0;
      }
      int v42 = v13 + 1;
      *a3 = v13 + 1;
      if (v13 + 1 >= a2) {
        return 0;
      }
      int v43 = 0;
      int v44 = 0;
      uint64_t v45 = 2 * v42;
      while (2)
      {
        int v46 = *(unsigned __int16 *)(a1 + v45);
        if (!v44 && v46 == 92)
        {
          int v47 = 1;
          goto LABEL_54;
        }
        if (!v44 && v46 == 40)
        {
          int v47 = 0;
          ++v43;
          goto LABEL_54;
        }
        int v47 = 0;
        if (v44 || v46 != 41) {
          goto LABEL_54;
        }
        if (v43)
        {
          int v47 = 0;
          --v43;
LABEL_54:
          unsigned __int16 v29 = 0;
          ++v42;
          v45 += 2;
          int v44 = v47;
          if (a2 == v42) {
            return v29;
          }
          continue;
        }
        break;
      }
      *(_WORD *)(a4 + 2 * v41) = 2;
      uint64_t v16 = *a6;
      *a6 = v16 + 4;
      *(_WORD *)(a4 + 2 * v16 + 6) = v16 + 4;
      uint64_t v84 = a4 + 2 * *a6;
      *(_DWORD *)uint64_t v84 = -65536;
      *(_WORD *)(v84 + 4) = -1;
      if (!sub_1A108(a1)) {
        return 0;
      }
      ++*a3;
      uint64_t v23 = (_WORD *)(a4 + 2 * *a6);
LABEL_7:
      v23[2] = v16;
      break;
    case '*':
      uint64_t v48 = *a6;
      if ((int)v48 + 5 >= a5) {
        return 0;
      }
      __int16 v49 = 5;
      goto LABEL_60;
    case '+':
      uint64_t v48 = *a6;
      if ((int)v48 + 5 >= a5) {
        return 0;
      }
      __int16 v49 = 4;
LABEL_60:
      *(_WORD *)(a4 + 2 * v48) = v49;
      __int16 v50 = (*a7)++;
      goto LABEL_73;
    case '.':
      uint64_t v31 = *a6;
      if ((int)v31 + 3 >= a5) {
        return 0;
      }
      __int16 v32 = 8;
      goto LABEL_38;
    default:
      goto LABEL_71;
  }
  goto LABEL_39;
}

uint64_t sub_1AF90(uint64_t result, unsigned int a2)
{
  uint64_t v3 = result;
  int v4 = *(unsigned __int16 *)(result + 2 * a2);
  if ((v4 - 2) >= 5)
  {
    if (v4 != 7) {
      return result;
    }
    unsigned int v6 = a2 + 3;
    sub_1A5A4(result, *(unsigned __int16 *)(result + 2 * (a2 + 3)));
    __int16 v7 = *(_WORD *)(v3 + 2 * v6);
    *(_WORD *)(v3 + 2 * v6) = *(_WORD *)(v3 + 2 * (a2 + 4));
    *(_WORD *)(v3 + 2 * (a2 + 4)) = v7;
  }
  uint64_t v5 = *(unsigned __int16 *)(v3 + 2 * (a2 + 3));

  return sub_1A5A4(v3, v5);
}

BOOL sub_1B028(uint64_t a1, int *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16 = a10;
  int v51 = *a2;
  int v17 = a4 * a3;
  uint64_t v50 = a5 + 2;
  while (1)
  {
LABEL_2:
    int v18 = *(unsigned __int16 *)(a5 + 2 * a6);
    if (v18 == 0xFFFF) {
      return 1;
    }
    if (v18 == 12) {
      break;
    }
    int v19 = *a2;
    if (*a2 * (int)a4 >= v17)
    {
      BOOL result = 0;
      int v35 = v18 - 1;
      int v21 = 2;
      switch(v35)
      {
        case 0:
          break;
        case 1:
          goto LABEL_20;
        case 2:
LABEL_19:
          a7 = !a7;
LABEL_20:
          int v21 = 3;
          break;
        case 3:
        case 4:
LABEL_17:
          if (a6 == a8)
          {
            uint64_t v36 = *(unsigned __int16 *)(a5 + 2 * (a8 + 4));
            ++*(_DWORD *)(a9 + 4 * v36);
          }
          else
          {
            uint64_t v37 = *(unsigned __int16 *)(a5 + 2 * (a6 + 4));
            if (*(_DWORD *)(a9 + 4 * v37)) {
              goto LABEL_41;
            }
            *(_DWORD *)(a9 + 4 * v37) = 1;
            a8 = a6;
          }
          int v38 = *a2;
          if (sub_1B028(a1, a2, a3, a4, a5, *(unsigned __int16 *)(a5 + 2 * (a6 + 3)), a7, a8, a9, v16))return 1; {
          *a2 = v38;
          }
          uint64_t v39 = *(unsigned __int16 *)(a5 + 2 * (a8 + 4));
          int v40 = *(_DWORD *)(a9 + 4 * v39);
          *(_DWORD *)(a9 + 4 * v39) = v40 - 1;
          int v21 = 2;
          if (*(_WORD *)(a5 + 2 * a6) == 4)
          {
            uint64_t v16 = a10;
            if (v40 < 2) {
              return 0;
            }
          }
          else
          {
LABEL_31:
            uint64_t v16 = a10;
          }
          break;
        case 5:
LABEL_21:
          if (sub_1B028(a1, a2, a3, a4, a5, *(unsigned __int16 *)(a5 + 2 * (a6 + 3)), a7, a8, a9, v16))return 1; {
          *a2 = v19;
          }
          int v21 = 2;
          goto LABEL_31;
        case 6:
LABEL_23:
          if (sub_1B028(a1, a2, a3, a4, a5, *(unsigned __int16 *)(a5 + 2 * (a6 + 3)), a7, a8, a9, v16))return 1; {
          *a2 = v19;
          }
          int v21 = 4;
          goto LABEL_31;
        case 8:
          return (*(_WORD *)(a5 + 2 * (a6 + 3)) & 0x100) != 0 && !a7;
        default:
          return result;
      }
    }
    else
    {
      int v20 = v18 - 1;
      int v21 = 2;
      switch(v20)
      {
        case 0:
          goto LABEL_42;
        case 1:
          goto LABEL_20;
        case 2:
          goto LABEL_19;
        case 3:
        case 4:
          goto LABEL_17;
        case 5:
          goto LABEL_21;
        case 6:
          goto LABEL_23;
        case 7:
          goto LABEL_39;
        case 8:
          int v22 = *(unsigned __int16 *)(a1 + 2 * v19);
          uint64_t v23 = (unsigned __int16 *)(a5 + 2 * (a6 + 3));
          unsigned int v47 = a8;
          int v48 = *v23;
          uint64_t v49 = v23[1];
          int v24 = translation_direction;
          uint64_t v25 = _lou_charHash(v22);
          uint64_t v16 = a10;
          uint64_t v26 = a10 + 4 * v25;
          int v27 = (unsigned int *)(v26 + 13608);
          int v28 = (unsigned int *)(v26 + 18100);
          unsigned __int16 v29 = &unk_25090;
          if (!v24)
          {
            unsigned __int16 v29 = &unk_250D0;
            int v27 = v28;
          }
          uint64_t v30 = *v27;
          if (!v30) {
            goto LABEL_11;
          }
          while (1)
          {
            uint64_t v31 = a10 + 8 * v30 + 31616;
            if (*(unsigned __int16 *)(v31 + 44) == v22) {
              break;
            }
            uint64_t v30 = *(unsigned int *)(v31 + 12);
            if (!v30)
            {
LABEL_11:
              __int16 v32 = &unk_25090;
              if (!v24) {
                __int16 v32 = &unk_250D0;
              }
              v32[22] = v22;
              uint64_t v31 = (uint64_t)v29;
              break;
            }
          }
          a8 = v47;
          if (a7 == ((*(void *)(v31 + 24) & ((v48 << 16) & 0xFFFFFFFFFCFFFFFFLL | v49)) != 0)) {
            return 0;
          }
          int v33 = *a2 + a4;
          goto LABEL_40;
        case 9:
          uint64_t v41 = (a6 + 3);
          uint64_t v42 = *(unsigned __int16 *)(a5 + 2 * v41);
          if (!*(_WORD *)(a5 + 2 * v41)) {
            goto LABEL_36;
          }
          int v43 = (unsigned __int16 *)(v50 + 2 * v41);
          break;
        default:
          return 0;
      }
      do
      {
        int v44 = *v43++;
        if (v44 == *(unsigned __int16 *)(a1 + 2 * v19))
        {
          if (a7 == (v42 != 0)) {
            return 0;
          }
          goto LABEL_39;
        }
        --v42;
      }
      while (v42);
LABEL_36:
      if (!a7) {
        return 0;
      }
LABEL_39:
      int v33 = v19 + a4;
LABEL_40:
      *a2 = v33;
LABEL_41:
      int v21 = 2;
    }
LABEL_42:
    a6 = *(unsigned __int16 *)(a5 + 2 * (a6 + v21));
    if (*(__int16 *)(a5 + 2 * a6) != -1) {
      continue;
    }
    uint64_t v45 = a6;
    while (1)
    {
      a6 = *(unsigned __int16 *)(a5 + 2 * (v45 + 2));
      if (a6 == 0xFFFF)
      {
LABEL_50:
        a6 = v45;
        goto LABEL_2;
      }
      int v46 = *(unsigned __int16 *)(a5 + 2 * *(unsigned __int16 *)(a5 + 2 * (v45 + 2)));
      if (v46 == 3)
      {
        a7 = !a7;
        goto LABEL_49;
      }
      if ((v46 - 4) <= 1) {
        break;
      }
LABEL_49:
      uint64_t v45 = *(unsigned __int16 *)(a5 + 2 * a6 + 4);
      if (*(__int16 *)(a5 + 2 * v45) != -1) {
        goto LABEL_50;
      }
    }
    if (*a2 == v51) {
      return 0;
    }
  }
  if (*a2 * (int)a4 >= v17) {
    return !a7;
  }
  else {
    return a7;
  }
}

uint64_t _lou_stringHash(unsigned __int16 *a1, int a2, uint64_t a3)
{
  int v4 = *a1;
  if (a2)
  {
    int v4 = sub_1B53C(*a1, a3);
    int v6 = sub_1B53C(a1[1], a3);
  }
  else
  {
    int v6 = a1[1];
  }
  return (v6 + (v4 << 8) - 1123 * ((3824548 * (unint64_t)(v6 + (v4 << 8))) >> 32));
}

uint64_t sub_1B53C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2
                       + 4
                       * (result - 1123 * ((3824548 * (unint64_t)result) >> 32))
                       + 13608);
  if (v2)
  {
    while (1)
    {
      uint64_t v3 = a2 + 8 * v2 + 31616;
      if (*(unsigned __int16 *)(v3 + 44) == result) {
        break;
      }
      uint64_t v2 = *(unsigned int *)(v3 + 12);
      if (!v2) {
        return result;
      }
    }
    uint64_t v4 = *(void *)(v3 + 32);
    if ((v4 & 0x10) != 0)
    {
      uint64_t v5 = *(unsigned int *)(v3 + 48);
      if (v5) {
        uint64_t v3 = a2 + 8 * v5 + 31616;
      }
      unint64_t v6 = v4 & 0xFFFFFFFFFFFFFFEFLL;
      if ((v6 & ~*(void *)(v3 + 32)) != 0)
      {
        while (1)
        {
          uint64_t v7 = *(unsigned int *)(v3 + 52);
          if (!v7) {
            break;
          }
          uint64_t v8 = a2 + 8 * v7;
          uint64_t v3 = v8 + 31616;
          if ((v6 & ~*(void *)(v8 + 31648)) == 0) {
            return *(unsigned __int16 *)(v3 + 44);
          }
        }
      }
      else
      {
        return *(unsigned __int16 *)(v3 + 44);
      }
    }
  }
  return result;
}

uint64_t _lou_charHash(unsigned __int16 a1)
{
  return a1 % 0x463u;
}

char *_lou_showString(uint64_t a1, int a2, int a3)
{
  byte_29F60[0] = 39;
  if (a2 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = a2;
    int v7 = &dword_0 + 1;
    while (1)
    {
      int v8 = *(unsigned __int16 *)(a1 + 2 * v5);
      if (a3 || (v8 - 127) < 0xFFFFFFA1)
      {
        int v9 = __sprintf_chk(__src, 0, 0x14uLL, "%x", *(unsigned __int16 *)(a1 + 2 * v5));
        int v10 = v9;
        int v11 = v9 - 1;
        if ((v9 - 1) > 7)
        {
          unsigned int v13 = 0;
          LOBYTE(v12) = 63;
        }
        else
        {
          unint64_t v12 = 0x7A7A7A7978787878uLL >> (8 * v11);
          unsigned int v13 = dword_1CEB4[v11];
        }
        if ((int)(v9 + v7 + v13) > 2041) {
          goto LABEL_19;
        }
        unsigned int v14 = &byte_29F60[v7];
        char *v14 = 92;
        v14[1] = v12;
        if (v13)
        {
          memset(&byte_29F60[v7 + 2], 48, v13);
          v7 += v13 + 2;
        }
        else
        {
          v7 += 2;
        }
        if (v10 >= 1)
        {
          memcpy(&byte_29F60[v7], __src, v10);
          v7 += v10;
        }
      }
      else
      {
        byte_29F60[v7++] = v8;
      }
      if (++v5 >= v6 || v7 >= 2046) {
        goto LABEL_19;
      }
    }
  }
  int v7 = &dword_0 + 1;
LABEL_19:
  *(_WORD *)&byte_29F60[v7] = 39;
  return byte_29F60;
}

char *_lou_unknownDots(unsigned int a1)
{
  uint64_t v1 = 0;
  byte_2A760[0] = 92;
  uint64_t v2 = a1;
  uint64_t v3 = 1;
  int v4 = &dword_0 + 1;
  BOOL result = byte_2A760;
  do
  {
    if ((v3 & v2) != 0) {
      byte_2A760[v4++] = byte_1CC58[v1 + 8];
    }
    uint64_t v3 = *(void *)&byte_1CC58[v1 + 16];
    v1 += 16;
  }
  while (v1 != 240);
  if (v4 == 1)
  {
    LOBYTE(word_2A761) = 48;
    int v4 = &dword_0 + 2;
  }
  *(_WORD *)&byte_2A760[v4] = 47;
  return result;
}

char *_lou_showDots(uint64_t a1, int a2)
{
  BOOL result = byte_2A774;
  if (a2 < 1)
  {
    int v5 = 0;
  }
  else
  {
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = 0;
      LOWORD(v7) = 1;
      do
      {
        if (((unsigned __int16)v7 & *(_WORD *)(a1 + 2 * v4)) != 0 && v5 <= 2046) {
          byte_2A774[v5++] = byte_1CC58[v6 + 8];
        }
        uint64_t v7 = *(void *)&byte_1CC58[v6 + 16];
        v6 += 16;
      }
      while (v6 != 240);
      if (*(__int16 *)(a1 + 2 * v4) == -32768 && v5 < 2047) {
        byte_2A774[v5++] = 48;
      }
      if (v4 != a2 - 1 && v5 <= 2046) {
        byte_2A774[v5++] = 45;
      }
      ++v4;
    }
    while (v4 < a2 && v5 < 2047);
  }
  byte_2A774[v5] = 0;
  return result;
}

char *_lou_showAttributes(uint64_t a1)
{
  uint64_t v1 = 0;
  int v2 = 0;
  uint64_t v3 = 1;
  do
  {
    if ((v3 & a1) != 0 && v2 <= 2046) {
      byte_2AF74[v2++] = byte_1CD58[v1 + 8];
    }
    uint64_t v3 = *(void *)&byte_1CD58[v1 + 16];
    v1 += 16;
  }
  while (v1 != 208);
  byte_2AF74[v2] = 0;
  return byte_2AF74;
}

void _lou_outOfMemory()
{
}

BOOL _lou_isValidMode(int a1)
{
  for (uint64_t i = 0; i != 7; ++i)
    a1 &= ~dword_1CE38[i];
  return a1 == 0;
}

uint64_t _lou_charToFallbackDots(unsigned int a1)
{
  if (a1 <= 0x7F) {
    unsigned int v1 = a1;
  }
  else {
    unsigned int v1 = 63;
  }
  int v2 = &unk_1CE53;
  do
  {
    unsigned int v3 = v2[1];
    v2 += 4;
  }
  while (v1 < v3);
  return (unsigned __int16)(byte_1CE54[v1 & (*(v2 - 2) ^ 0xFFFF) | (unint64_t)*(v2 - 1)] | *v2) | 0x8000u;
}

void sub_1B9F4()
{
  sub_2C60();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s", v1, 0xCu);
}

void sub_1BA68()
{
  sub_2C60();
  sub_2C6C(&dword_0, v0, v1, "%s", v2);
}

void sub_1BAD4()
{
  sub_2C60();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Setting active table: %@", v1, 0xCu);
}

void sub_1BB48(void *a1, NSObject *a2)
{
  unsigned int v3 = [a1 activeTable];
  sub_2C60();
  sub_2C6C(&dword_0, a2, v4, "Tried to translate technical text, but there is no technical table for %@.", v5);
}

void sub_1BBD4(void *a1, NSObject *a2)
{
  unsigned int v3 = [a1 activeTable];
  sub_2C60();
  sub_2C6C(&dword_0, a2, v4, "Tried to translate text to braille, but couldn't find a table to use for %@", v5);
}

void sub_1BC60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1BC98()
{
  sub_2C60();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Error translating text: '%@' result:%d", v2, 0x12u);
}

void sub_1BD1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1BD54()
{
  sub_2C60();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Couldn't set form type data correctly! %@ %@", v2, 0x16u);
}

void sub_1BDD8()
{
  sub_2C60();
  sub_2C6C(&dword_0, v0, v1, " braille: '%@'", v2);
}

void sub_1BE44()
{
  sub_2C60();
  sub_2C6C(&dword_0, v0, v1, "Error translating braille: '%@'", v2);
}

uint64_t CEMCreateEmojiLocaleData()
{
  return _CEMCreateEmojiLocaleData();
}

uint64_t CEMEmojiTokenCopyName()
{
  return _CEMEmojiTokenCopyName();
}

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return _CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return _CFLocaleGetValue(locale, key);
}

void CFRelease(CFTypeRef cf)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fgetc(FILE *a1)
{
  return _fgetc(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__setupLocale(void *a1, const char *a2, ...)
{
  return [a1 _setupLocale];
}

id objc_msgSend_activeTable(void *a1, const char *a2, ...)
{
  return [a1 activeTable];
}

id objc_msgSend_activeTableMap(void *a1, const char *a2, ...)
{
  return [a1 activeTableMap];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_boldRanges(void *a1, const char *a2, ...)
{
  return [a1 boldRanges];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_emojiPreprocessor(void *a1, const char *a2, ...)
{
  return [a1 emojiPreprocessor];
}

id objc_msgSend_italicRanges(void *a1, const char *a2, ...)
{
  return [a1 italicRanges];
}

id objc_msgSend_languageMap(void *a1, const char *a2, ...)
{
  return [a1 languageMap];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_textFormattingPreprocessor(void *a1, const char *a2, ...)
{
  return [a1 textFormattingPreprocessor];
}

id objc_msgSend_underlineRanges(void *a1, const char *a2, ...)
{
  return [a1 underlineRanges];
}