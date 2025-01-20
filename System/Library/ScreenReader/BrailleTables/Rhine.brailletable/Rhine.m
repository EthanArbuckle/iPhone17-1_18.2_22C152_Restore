BOOL in(BOOL __c, int a2)
{
  unsigned int v2;
  char *v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  int v7;
  size_t v8;
  BOOL v10;

  if (__c)
  {
    v2 = __c;
    switch(a2)
    {
      case 0:
        goto LABEL_52;
      case 1:
        goto LABEL_4;
      case 2:
        if (memchr("0123456789", __c, 0xBuLL)) {
          goto LABEL_80;
        }
LABEL_4:
        v3 = "IVXLCDM";
        goto LABEL_74;
      case 3:
        v4 = __c - 97;
        goto LABEL_53;
      case 4:
        goto LABEL_42;
      case 5:
        if (memchr("-.", __c, 3uLL)) {
          goto LABEL_80;
        }
LABEL_42:
        v3 = ",;:/?+=(*)";
        goto LABEL_88;
      case 6:
        goto LABEL_13;
      case 7:
        if ((__c + 64) >= 0x1Fu) {
          goto LABEL_44;
        }
        goto LABEL_80;
      case 8:
        v3 = "bcdfghjklmnpqrstvwxz";
        goto LABEL_50;
      case 9:
        goto LABEL_10;
      case 10:
        v5 = ((__c & 0xDF) - 65);
        goto LABEL_45;
      case 11:
        __c = 1;
        if (v2 == 45 || (v2 - 48) < 0xAu) {
          return __c;
        }
LABEL_10:
        __c = 1;
        if ((vmaxv_u16((uint16x4_t)vceq_s16(vdup_n_s16(v2), (int16x4_t)0x9C009A008C008ALL)) & 1) != 0
          || v2 > 0xBF
          || (v2 - 65) < 0x1Au)
        {
          return __c;
        }
LABEL_13:
        v6 = v2 <= 0xDE && v2 - 97 >= 0x1A;
        return !v6;
      case 12:
        v3 = "MNmn";
        goto LABEL_63;
      case 13:
        v3 = ".\"!'><$CQXY\x7F";
        goto LABEL_19;
      case 14:
        v3 = ":+);=cqxy?(";
        v7 = v2;
        v8 = 12;
        goto LABEL_89;
      case 15:
LABEL_44:
        v5 = __c - 65;
LABEL_45:
        v6 = v5 >= 0x1A;
        return !v6;
      case 16:
        v3 = "'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB";
LABEL_19:
        v7 = v2;
        v8 = 13;
        goto LABEL_89;
      case 17:
        v3 = "[]\x82\x91\x92";
        goto LABEL_70;
      case 18:
        v3 = "\x84\x93\x94";
        goto LABEL_72;
      case 19:
        v3 = ".'\"\x82\x91\x92";
        goto LABEL_79;
      case 20:
        v3 = ".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB";
LABEL_50:
        v7 = v2;
        v8 = 21;
        goto LABEL_89;
      case 21:
        if (memchr(".:\x1E \xA0\xB0", __c, 7uLL)) {
          goto LABEL_80;
        }
LABEL_52:
        v4 = v2 - 48;
LABEL_53:
        v6 = v4 >= 0xA;
        return !v6;
      case 22:
        v3 = ",;:!?";
        goto LABEL_70;
      case 23:
        v3 = "()!?";
        goto LABEL_63;
      case 24:
        v3 = ".-'";
        goto LABEL_72;
      case 25:
        if (!memchr("*/:", __c, 4uLL)) {
          goto LABEL_60;
        }
        goto LABEL_80;
      case 26:
LABEL_60:
        v3 = "+-=";
        goto LABEL_72;
      case 27:
        v3 = "\xB9\xB2\xB3\xBC\xBD\xBE";
        goto LABEL_79;
      case 28:
        v3 = "_#$%&\x80\x83\x86\x87\x89\x99\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAC\xAE\xAF\xB0\xB1\xB2\xB3\xB5\xB6\xB9\xBA"
             "\xBC\xBD\xBE\xC5.:/h";
        v7 = v2;
        v8 = 36;
        goto LABEL_89;
      case 29:
        v3 = ".:/h";
LABEL_63:
        v7 = v2;
        v8 = 5;
        goto LABEL_89;
      case 30:
        v10 = __c == 176;
        if (__c == 137) {
          v10 = 1;
        }
        return __c == 37 || v10;
      case 31:
        v3 = "\x80$\xA5\xA2\xA3\xA4";
        goto LABEL_79;
      case 32:
        v3 = "({[<\x91";
        goto LABEL_70;
      case 33:
        v3 = ")}]>\x9B";
LABEL_70:
        v7 = v2;
        v8 = 6;
        goto LABEL_89;
      case 34:
        return (__c & 0xE0) == 64;
      case 35:
        return (char)__c > 95;
      case 36:
        __c = 1;
        if (v2 != 9 && v2 != 32) {
          return v2 == 160;
        }
        return __c;
      case 37:
        return __c < 0x21 || __c == 160;
      case 38:
        v3 = ",;:";
LABEL_72:
        v7 = v2;
        v8 = 4;
        goto LABEL_89;
      case 39:
        v3 = "\"!'><$\x7F";
LABEL_74:
        v7 = v2;
        v8 = 8;
        goto LABEL_89;
      case 40:
        v3 = "#\"!'><$\x7F";
        v7 = v2;
        v8 = 9;
        goto LABEL_89;
      case 41:
        if (__c & 0xF8) == 0x28 || (__c - 33) < 0x1F && ((0x7C00003Fu >> (__c - 33)))
        {
LABEL_80:
          __c = 1;
        }
        else
        {
LABEL_79:
          v7 = v2;
          v8 = 7;
LABEL_89:
          __c = memchr(v3, v7, v8) != 0;
        }
        break;
      case 42:
        return (__c - 96) < 0x1B || (__c & 0xFE) == 56;
      case 43:
        __c = 1;
        if (v2 != 9 && v2 != 32 && v2 != 125) {
          return v2 == 160;
        }
        return __c;
      case 44:
        v3 = "#0-1|4$k'\x7F";
        goto LABEL_88;
      case 45:
        v3 = "#123456789";
LABEL_88:
        v7 = v2;
        v8 = 11;
        goto LABEL_89;
      default:
        return 0;
    }
  }
  return __c;
}

uint64_t char_count(unsigned __int8 *a1, unsigned __int8 a2)
{
  uint64_t result = 0;
  unsigned int v4 = *a1;
  if (v4 >= 0x21 && v4 != 160)
  {
    LODWORD(result) = 0;
    v5 = a1 + 1;
    do
    {
      if (v4 == a2) {
        uint64_t result = (result + 1);
      }
      else {
        uint64_t result = result;
      }
      unsigned int v6 = *v5++;
      unsigned int v4 = v6;
    }
    while (v6 >= 0x21 && v4 != 160);
  }
  return result;
}

unsigned __int8 *find_in(unsigned __int8 *a1, int a2)
{
  unsigned __int8 v2 = *a1;
  if (!*a1) {
    return 0;
  }
  unsigned int v4 = a1;
  while (!in(v2, a2))
  {
    int v5 = *++v4;
    unsigned __int8 v2 = v5;
    if (!v5) {
      return 0;
    }
  }
  return v4;
}

uint64_t get_binary_dots(unsigned __int8 a1, uint64_t a2)
{
  int v2 = a1;
  uint64_t result = 0;
  if (a2)
  {
    while (*(unsigned __int8 *)(a2 + result) != v2)
    {
      if (++result == 256) {
        return 0;
      }
    }
  }
  else
  {
    while (brl_set_ansi[result] != v2)
    {
      if (++result == 256) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t get_binary_char(unsigned __int8 a1, uint64_t a2)
{
  int v2 = &brl_set_ansi[a1];
  if (a2) {
    int v2 = (char *)(a2 + *v2);
  }
  return *v2;
}

uint64_t lower_digit(unsigned __int8 a1)
{
  if (a1 - 58 >= 0xFFFFFFF6) {
    v1 = &asc_2A2CA[a1 - 48];
  }
  else {
    v1 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * a1);
  }
  return *v1;
}

uint64_t antoine_digit(unsigned __int8 a1)
{
  if (a1 - 58 >= 0xFFFFFFF6) {
    v1 = &a123456789[a1 - 48];
  }
  else {
    v1 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * a1);
  }
  return *v1;
}

uint64_t equals_nocase(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    do
      int v2 = *a1++;
    while (v2 == 173 || v2 == 30);
    int v4 = *a2;
    if (((v4 ^ v2) & 0xFFFFFFDF) != 0) {
      break;
    }
    if (!*(a1 - 1) && v4 != 0) {
      break;
    }
    if (!*++a2) {
      return 1;
    }
  }
  return 0;
}

uint64_t equals(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    do
      int v2 = *a1++;
    while (v2 == 173 || v2 == 30);
    if (v2 != *a2) {
      break;
    }
    if (!*++a2) {
      return 1;
    }
  }
  return 0;
}

unsigned __int8 **has_whitespace(unsigned __int8 **result, unsigned __int8 **a2)
{
  if (result != a2)
  {
    BOOL v3 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
    int v4 = 1;
    do
    {
      uint64_t result = (unsigned __int8 **)result[6];
      if (!result) {
        return result;
      }
      int v5 = **result;
      if (((_WORD)result[3] & 0x20E4) != 0)
      {
        if (v5 == 45) {
          goto LABEL_12;
        }
      }
      else
      {
        if (**result <= 0x2Cu)
        {
          if (v5 != 9 && v5 != 32) {
            continue;
          }
          goto LABEL_21;
        }
        if (v5 == 45)
        {
          if (nLangIDGlb != 9) {
            goto LABEL_26;
          }
LABEL_12:
          if ((nSubLangIDGlb & 0xFFFFFFFD) == 1) {
            continue;
          }
LABEL_21:
          if (v3)
          {
            if (v4 > 1) {
              return (unsigned __int8 **)(&dword_0 + 1);
            }
          }
          else
          {
LABEL_26:
            if (nLangIDGlb != 12 && nLangIDGlb != 9 || v4 > 2) {
              return (unsigned __int8 **)(&dword_0 + 1);
            }
          }
          ++v4;
          continue;
        }
        if (v5 == 160) {
          goto LABEL_21;
        }
      }
    }
    while (result != a2);
  }
  return 0;
}

BOOL zweiformig_enabled(int a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(int *)((char *)&dword_8 + (void)pLangGlb);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = *pLangGlb + 4;
    int v5 = v3 + 1;
    while (*(v4 - 1) != (unsigned char *)&dword_0 + 2 || *(unsigned __int16 *)*(v4 - 3) != a1)
    {
      v4 += 5;
      if (!--v5) {
        goto LABEL_6;
      }
    }
    v12 = *v4;
    return ((unint64_t)v12 & (a3 | 0x80000000)) == 0;
  }
LABEL_6:
  int v6 = *(int *)((char *)&dword_18 + (void)pLangGlb);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = (char **)(*(void *)((char *)&dword_10 + (void)pLangGlb) + 56);
    int v8 = v6 + 1;
    while (*(v7 - 4) != (unsigned char *)&dword_0 + 2 || *(unsigned __int16 *)*(v7 - 6) != a1)
    {
      v7 += 8;
      if (!--v8) {
        goto LABEL_11;
      }
    }
    v12 = *v7;
    return ((unint64_t)v12 & (a3 | 0x80000000)) == 0;
  }
LABEL_11:
  BOOL v9 = (a3 & 0x100) == 0;
  if ((char)a1 != 97) {
    BOOL v9 = 0;
  }
  if ((char)a1 == 104) {
    BOOL v10 = (a3 & 0x80) == 0;
  }
  else {
    BOOL v10 = v9;
  }
  if (a1 == 117) {
    BOOL v10 = (a3 & 0x100) == 0;
  }
  return a2 == 2 && v10;
}

BOOL equals_zweiformig(const char *a1, uint64_t a2)
{
  size_t v4 = strlen(a1);
  uint64_t v5 = v4;
  if (v4 == 2) {
    goto LABEL_9;
  }
  if (v4 != 3) {
    return 0;
  }
  unsigned __int8 v6 = a1[2];
  if (!v6 || (v6 + 33) <= 0xE0u && (v6 - 91) < 0xE6u) {
    return 0;
  }
  if (nLangIDGlb != 9)
  {
LABEL_9:
    int v7 = *(unsigned __int8 *)a1;
  }
  else
  {
    int v7 = *(unsigned __int8 *)a1;
    if ((v7 | 4) == 0x45) {
      return 0;
    }
  }
  if (!v7 || (v7 + 33) <= 0xE0u && (v7 - 91) < 0xE6u) {
    return 0;
  }
  int v9 = nLangIDGlb;
  int v10 = *((unsigned __int8 *)a1 + 1);
  if (v7 == 220 && nLangIDGlb == 7 && v10 == 72) {
    return 1;
  }
  v11 = *(unsigned __int16 **)((char *)&stru_20.vmsize + (void)pLangGlb);
  unsigned __int16 v12 = *v11;
  if (!*v11) {
    return 0;
  }
  int v13 = (char)v10;
  unsigned __int16 v14 = (char)(v7 | 0x20) | (unsigned __int16)((char)v10 << 8) | 0x2000;
  v15 = v11 + 1;
  while (v12 != v14 || !zweiformig_enabled(v14, v5, a2))
  {
    BOOL result = 0;
    int v16 = *v15++;
    unsigned __int16 v12 = v16;
    if (!v16) {
      return result;
    }
  }
  if (v9 != 7) {
    return 1;
  }
  return memchr("CQX", v13, 4uLL) == 0;
}

uint64_t equals_mehrformig(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if ((unint64_t)(v1 - 3) <= 1)
  {
    uint64_t v3 = 0;
    while (1)
    {
      char v4 = *(unsigned char *)(*(void *)a1 + v3);
      if (!v4 || (v4 + 33) <= 0xE0u && (v4 - 91) < 0xE6u) {
        break;
      }
      if (v1 == ++v3)
      {
        int v5 = *(int *)((char *)&dword_18 + (void)pLangGlb);
        if (v5 < 0) {
          return 0;
        }
        uint64_t v6 = *(void *)((char *)&dword_10 + (void)pLangGlb) + 56;
        int v7 = v5 + 1;
        while (v1 != *(void *)(v6 - 32)
             || (*(unsigned char *)(v6 + 1) & 0x80) != 0
             || !equals_nocase(*(unsigned __int8 **)a1, *(unsigned __int8 **)(v6 - 48)))
        {
          v6 += 64;
          if (!--v7) {
            return 0;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

BOOL is_url(unsigned __int8 *a1)
{
  if (nLangIDGlb == 10) {
    return 0;
  }
  int v2 = a1;
  if (equals_nocase(a1, "www"))
  {
    int v3 = 1;
    int v4 = -1;
  }
  else
  {
    int v3 = equals_nocase(v2, "ftp");
    int v4 = -v3;
  }
  int v5 = *v2;
  if (v5 != 160 && v5 > 0x20 || (v5 & 0xFE) == 30)
  {
    int v19 = 0;
    int v18 = 0;
    while (1)
    {
      if (v5 <= 90)
      {
        switch(v5)
        {
          case '(':
          case ')':
          case ',':
          case '/':
          case ';':
          case '<':
          case '>':
            goto LABEL_25;
          case '*':
          case '+':
          case '-':
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
          case '=':
          case '?':
            goto LABEL_38;
          case '.':
            if (v2[1] >= 0x21u && v2[2] > 0x20u) {
              ++v4;
            }
            goto LABEL_29;
          case ':':
            int v13 = v2;
            unsigned __int16 v14 = "//";
            break;
          case '@':
            int v4 = 0;
            if (v18 >= 1) {
              int v19 = 1;
            }
            ++v18;
            goto LABEL_29;
          default:
            if ((v5 - 34) >= 2) {
              goto LABEL_38;
            }
            goto LABEL_25;
        }
        while (1)
        {
          do
          {
            int v16 = *++v13;
            int v15 = v16;
          }
          while (v16 == 173 || v15 == 30);
          if (v15 != *(unsigned __int8 *)v14) {
            goto LABEL_29;
          }
          if (++v14 == "")
          {
            if (v19) {
              goto LABEL_29;
            }
            BOOL result = 0;
            if (v4 <= 0 && v18 <= 0)
            {
              int v19 = 0;
              ++v3;
              ++v4;
              goto LABEL_29;
            }
            return result;
          }
        }
      }
      char v8 = v5 - 123;
      if ((v5 - 123) > 0x32) {
        goto LABEL_24;
      }
      if (((1 << v8) & 0x4000018000000) == 0) {
        break;
      }
LABEL_29:
      int v10 = *++v2;
      int v5 = v10;
      if ((v10 == 160 || v5 <= 0x20) && (v5 & 0xFE) != 30) {
        goto LABEL_54;
      }
    }
    if (((1 << v8) & 5) == 0)
    {
LABEL_24:
      if ((v5 - 91) >= 3)
      {
LABEL_38:
        if ((char)v5 < -64) {
          return 0;
        }
        goto LABEL_29;
      }
    }
LABEL_25:
    unsigned int v9 = v2[1];
    if (v9 >= 0x21 && v9 != 160 && !memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v9, 0x15uLL)) {
      int v19 = 1;
    }
    goto LABEL_29;
  }
  int v18 = 0;
  int v19 = 0;
LABEL_54:
  if (v3 > 0) {
    return v4 > 0;
  }
  BOOL result = 0;
  if (v18 >= 1 && !v19) {
    return v4 > 0;
  }
  return result;
}

uint64_t no_exception(int a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned int v4 = *a2;
  uint64_t result = v4 == 9;
  if (v4 == 9)
  {
    ++a2;
  }
  else if (v4 < 3)
  {
    return 1;
  }
  BOOL v6 = a1 == 0;
  uint64_t v7 = -1;
  if (!v6) {
    uint64_t v7 = 1;
  }
  do
  {
    if (nLangIDGlb == 9 && *a2 == 8)
    {
      if (nSubLangIDGlb != 1) {
        return v4 != 9;
      }
      ++a2;
    }
    unsigned int v8 = *a3;
    unsigned int v9 = a3;
    while (1)
    {
      if (v8 == 30 || v8 == 173) {
        goto LABEL_26;
      }
      unsigned int v10 = *a2;
      if (v10 != 91)
      {
        if (v10 != v8 && v10 != *((unsigned __int8 *)pExcMapGlb + v8)) {
          break;
        }
        goto LABEL_25;
      }
      v11 = a2 + 1;
      int v12 = 1;
      do
      {
        a2 = v11;
        unsigned int v10 = *v11;
        if (v10 == 93) {
          break;
        }
        if (v10 == v8 || v10 == *((unsigned __int8 *)pExcMapGlb + v8)) {
          int v12 = 0;
        }
        ++v11;
      }
      while (a2[1] > 2u);
      if (v12) {
        break;
      }
LABEL_25:
      ++a2;
LABEL_26:
      v9 += v7;
      unsigned int v8 = *v9;
      if (!*v9)
      {
        unsigned int v10 = *a2;
        if (v10 >= 3)
        {
          do
LABEL_34:
            unsigned int v13 = *++a2;
          while (v13 > 2);
          goto LABEL_35;
        }
LABEL_28:
        if (v10 != 2) {
          return result;
        }
        goto LABEL_35;
      }
    }
    if (v10 >= 3) {
      goto LABEL_34;
    }
    if (!v8) {
      goto LABEL_28;
    }
    if (v10) {
      return result;
    }
LABEL_35:
    ;
  }
  while (*++a2);
  return v4 != 9;
}

uint64_t init_index(uint64_t result, uint64_t a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result - 1;
    int v3 = 1;
    do
    {
      seg_index[*(unsigned __int8 *)(v2 + a2)] = v3;
      seg_start[*(unsigned __int8 *)(v2 + a2)] = v2 + a2;
      ++v3;
      --a2;
    }
    while (a2);
  }
  return result;
}

unsigned __int8 *reset_index(unsigned __int8 *a1)
{
  unsigned int v3 = *a1;
  uint64_t result = a1 + 1;
  uint64_t v2 = v3;
  do
  {
    seg_index[v2] = 0;
    unsigned int v4 = *result++;
    uint64_t v2 = v4;
  }
  while (v4);
  return result;
}

uint64_t is_any_number(unsigned __int8 *a1)
{
  if (*a1 == 30) {
    uint64_t v1 = a1 + 1;
  }
  else {
    uint64_t v1 = a1;
  }
  uint64_t v2 = *v1;
  if ((v2 | 0x80) == 0xA0)
  {
    uint64_t v3 = 1;
    if (v1[1] == 30) {
      uint64_t v3 = 2;
    }
    uint64_t v2 = v1[v3];
    if (v1[1] == 30) {
      v1 += 2;
    }
    else {
      ++v1;
    }
  }
  if (!in(v2, 2)) {
    goto LABEL_21;
  }
  do
  {
    unsigned int v4 = v1;
    int v5 = v1[1];
    BOOL v6 = v5 == 30;
    if (v5 == 30) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    if (v6) {
      v1 += 2;
    }
    else {
      ++v1;
    }
    uint64_t v8 = v4[v7];
  }
  while (in(v8, 2));
  if (*v4 && (!memchr("IVXLCDM", *v4, 8uLL) || !in(v8, 9)))
  {
    if (v8 == 30) {
      unsigned int v10 = v1 + 1;
    }
    else {
      unsigned int v10 = v1;
    }
    unsigned int v9 = *v10;
    if ((v9 | 0x80) == 0xA0)
    {
      uint64_t v11 = 1;
      if (v10[1] == 30) {
        uint64_t v11 = 2;
      }
      unsigned int v9 = v10[v11];
    }
    if (v9 <= 1) {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
LABEL_21:
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

BOOL is_decimal_number(unsigned __int8 *a1)
{
  uint64_t v1 = a1 + 1;
  if (*a1 != 30) {
    uint64_t v1 = a1;
  }
  int v2 = *v1;
  if ((v2 | 0x80) == 0xA0)
  {
    uint64_t v3 = 1;
    if (v1[1] == 30) {
      uint64_t v3 = 2;
    }
    int v2 = v1[v3];
    if (v1[1] == 30) {
      v1 += 2;
    }
    else {
      ++v1;
    }
  }
  if ((v2 - 58) < 0xFFFFFFF6)
  {
LABEL_18:
    if ((v2 | 2) == 0x2E) {
      return v1[1] - 48 < 0xA;
    }
  }
  else
  {
    while (1)
    {
      int v4 = v1[1];
      BOOL v5 = v4 == 30;
      uint64_t v6 = v4 == 30 ? 2 : 1;
      int v2 = v1[v6];
      if (v5) {
        v1 += 2;
      }
      else {
        ++v1;
      }
      if (!v2) {
        break;
      }
      if ((v2 - 58) <= 0xFFFFFFF5) {
        goto LABEL_18;
      }
    }
  }
  return 0;
}

BOOL is_number(unsigned __int8 *a1)
{
  uint64_t v1 = a1 + 1;
  if (*a1 != 30) {
    uint64_t v1 = a1;
  }
  int v2 = *v1;
  if (!*v1) {
    goto LABEL_8;
  }
  if ((v2 - 58) > 0xFFFFFFF5) {
    return 1;
  }
  if (v2 != 43 && v2 != 45)
  {
LABEL_8:
    if (v2 != stru_B8.segname[(void)pLangGlb]
      && v2 != stru_B8.segname[(void)pLangGlb + 2])
    {
      return 0;
    }
  }
  int v3 = v1[1];
  if (!v1[1]) {
    goto LABEL_14;
  }
  if ((v3 - 58) > 0xFFFFFFF5) {
    return 1;
  }
  if (v3 == 30)
  {
    BOOL result = 1;
    if (v1[2] - 58 > 0xFFFFFFF5) {
      return result;
    }
  }
  else
  {
LABEL_14:
    BOOL result = 0;
  }
  int v5 = stru_B8.segname[(void)pLangGlb];
  if (v3 == v5 || v3 == stru_B8.segname[(void)pLangGlb + 2])
  {
    int v6 = v1[2];
    if (v1[2])
    {
      if ((v6 - 58) > 0xFFFFFFF5) {
        return 1;
      }
      if (v6 == 30)
      {
        int v7 = v1[3];
        if (v1[3])
        {
          unsigned int v8 = v7 - 58;
          BOOL v9 = (v7 - 58) > 0xFFFFFFF5;
          if (v8 >= 0xFFFFFFF6 || !result) {
            return v9;
          }
          int v11 = 30;
LABEL_28:
          if (v11 == v5 || v11 == stru_B8.segname[(void)pLangGlb + 2])
          {
            int v12 = v1[3];
            if (v1[3])
            {
              if ((v12 - 58) <= 0xFFFFFFF5)
              {
                if (v12 == 30) {
                  return v1[4] - 48 < 0xA;
                }
                return 0;
              }
              return 1;
            }
          }
          return 0;
        }
      }
    }
  }
  if (result)
  {
    int v11 = v1[2];
    goto LABEL_28;
  }
  return result;
}

void *is_roman_number(unsigned __int8 *a1)
{
  if (*a1 == 30) {
    uint64_t v1 = a1 + 1;
  }
  else {
    uint64_t v1 = a1;
  }
  if (!*v1) {
    return 0;
  }
  BOOL result = memchr("IVXLCDM", *v1, 8uLL);
  if (!result) {
    return result;
  }
  int v4 = v1 + 1;
  int v3 = v1[1];
  if (!v1[1]) {
    return &dword_0 + 1;
  }
  if (v3 == 30)
  {
    int v3 = v1[2];
    int v4 = v1 + 2;
  }
  if (!v3) {
    return 0;
  }
  BOOL result = memchr("IVXLCDM", v3, 8uLL);
  if (!result) {
    return result;
  }
  int v5 = v4[1];
  if (v4[1])
  {
    if (v5 == 30) {
      int v5 = v4[2];
    }
    if (v5) {
      return (void *)(memchr("IVXLCDM", v5, 8uLL) != 0);
    }
    return 0;
  }
  return &dword_0 + 1;
}

unint64_t is_figure(int a1, unsigned __int8 *a2, uint64_t a3, int a4)
{
  if ((uint64_t)&a2[-a3] < 0)
  {
    unint64_t v5 = 0;
LABEL_9:
    uint64_t v7 = *a2;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = -1;
    if (a1) {
      uint64_t v6 = 1;
    }
    while (a2[v4])
    {
      if (a2[v4] - 58 >= 0xFFFFFFF6)
      {
        ++v5;
        v4 += v6;
        if ((uint64_t)&a2[v4 - a3] >= 0) {
          continue;
        }
      }
      a2 += v4;
      goto LABEL_9;
    }
    uint64_t v7 = 0;
    a2 += v4;
  }
  if (v7 == stru_B8.segname[(void)pLangGlb + 2])
  {
    unsigned int v8 = a2[1];
    if (v8 != 45 && v8 > 0x20) {
      return 0;
    }
  }
  if (!a1 && v7 == stru_B8.segname[(void)pLangGlb])
  {
    unsigned int v9 = a2[1];
    if (v9 != 45 && v9 > 0x20) {
      return 0;
    }
  }
  if ((v7 | 2) == 0x2F)
  {
    if (a1 || v5 > 2 || a2[1] - 58 < 0xFFFFFFF6 || a2[2] - 58 < 0xFFFFFFF6)
    {
      if (a4) {
        return v5;
      }
    }
    else if (!a2[3] || a4 || a2[3] - 58 < 0xFFFFFFF6)
    {
      return v5;
    }
  }
  if (in(v7, 25)) {
    return 0;
  }
  return v5;
}

char *create_buffer(int a1, uint64_t a2, uint64_t a3)
{
  BOOL result = byte_9D9D8;
  if (a2 - a3 < 0)
  {
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    BOOL v9 = a1 == 0;
    uint64_t v7 = -1;
    if (!v9) {
      uint64_t v7 = 1;
    }
    do
    {
      unsigned int v8 = *(unsigned __int8 *)(a2 + v5);
      BOOL v9 = v8 > 0x20 || v8 == 30;
      if (!v9) {
        break;
      }
      if (v8 != 30 && v8 != 173)
      {
        if (v8 > 0x60) {
          LOBYTE(v8) = v8 & 0xDF;
        }
        byte_9D9D8[v6++] = v8;
      }
      if (v6 > 0xE) {
        break;
      }
      uint64_t v10 = v7 + a2 - a3 + v5;
      v5 += v7;
    }
    while ((v10 & 0x8000000000000000) == 0);
  }
  byte_9D9D8[v6] = 0;
  return result;
}

unint64_t is_generic_abbrev(unsigned __int8 *a1)
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
    return 0;
  }
  unint64_t v3 = 0;
  while (1)
  {
    int v4 = *a1;
    if ((!in(*a1, 9) || a1[1] != 46) && ((v4 | 0x80) != 0xA0 || !in(a1[1], 9) || a1[2] != 46)) {
      break;
    }
    if ((v4 | 0x80) == 0xA0) {
      uint64_t v5 = a1 + 1;
    }
    else {
      uint64_t v5 = a1;
    }
    if ((v4 | 0x80) == 0xA0) {
      unint64_t v6 = v3 + 1;
    }
    else {
      unint64_t v6 = v3;
    }
    unint64_t v3 = v6 + 2;
    a1 = v5 + 2;
  }
  if (v3 <= 3) {
    return 0;
  }
  else {
    return v3 - 1;
  }
}

uint64_t is_common_abbrev(unsigned __int8 *a1)
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
    return 0;
  }
  unint64_t v3 = *(unsigned char **)(*(void *)&stru_20.segname[(void)pLangGlb + 16] + 8 * hash_map[*a1]);
  int v4 = *v3;
  if (!*v3) {
    return 0;
  }
  int v5 = a1[1];
  while (1)
  {
    if (v4 == 36) {
      ++v3;
    }
    int v6 = *v3;
    if (v6 == v5 || ((v5 ^ v6) & 0xDF) == 0) {
      break;
    }
    int v11 = a1 + 1;
    int v9 = a1[1];
    if (!*v3) {
      goto LABEL_33;
    }
LABEL_31:
    while (*++v3)
      ;
LABEL_36:
    int v19 = *++v3;
    int v4 = v19;
    if (!v19) {
      return 0;
    }
  }
  int v8 = 1;
  LOBYTE(v9) = a1[1];
  uint64_t v10 = a1 + 1;
  do
  {
    int v11 = v10 + 1;
    if (v6 == 46)
    {
      if ((*v11 | 0x80) == 0xA0) {
        int v11 = v10 + 2;
      }
      else {
        int v11 = v10 + 1;
      }
      int v12 = 0;
    }
    else
    {
      int v12 = v8 + 1;
      if (v8 >= 1)
      {
        if ((_BYTE)v9)
        {
          uint64_t result = 0;
          if ((v9 + 33) > 0xE0u || (v9 - 91) > 0xE5u) {
            return result;
          }
        }
      }
    }
    int v14 = *++v3;
    int v6 = v14;
    int v9 = *v11;
    int v15 = (v9 ^ v14) & 0xDF;
    BOOL v16 = v14 == v9 || v15 == 0;
    int v8 = v12;
    uint64_t v10 = v11;
  }
  while (v16);
  if (v6) {
    goto LABEL_31;
  }
LABEL_33:
  if (v9 != 46) {
    goto LABEL_36;
  }
  unsigned int v18 = v11[1];
  if (v18 >= 0x41 && v18 != 160) {
    goto LABEL_36;
  }
  if (nLangIDGlb != 7
    || (v18 <= 0x2F && ((1 << v18) & 0xA00100000000) != 0 || v18 == 160) && in(v11[2], 9) && in(v11[3], 9))
  {
    return v11 - a1;
  }
  create_buffer(1, (uint64_t)a1, 0);
  int v20 = no_exception(1, "\tIE\x01AU\x01\xC4\x55\x01EU\x01CH\x01SCH\x01ST\x01", (unsigned __int8 *)byte_9D9D8);
  uint64_t result = 0;
  if (!v20) {
    return v11 - a1;
  }
  return result;
}

BOOL is_separator(unsigned __int8 *a1)
{
  BOOL result = 0;
  int v3 = *a1;
  if (v3 != 30 && v3 != 173)
  {
    if (in(*a1, 9)) {
      return 0;
    }
    else {
      return !v3 || v3 != 46 && !memchr(",;:!?", v3, 6uLL) || !in(a1[1], 11);
    }
  }
  return result;
}

uint64_t is_measurement(unsigned __int8 *a1, int a2, int a3)
{
  int v5 = a1;
  if (!a3)
  {
    unsigned int v6 = *a1;
    if (!*a1) {
      return 0;
    }
    goto LABEL_10;
  }
  if (equals_nocase(a1, "<pt56>") && in(v5[6], 9)) {
    v5 += 6;
  }
  unsigned int v6 = *v5;
  if (!memchr("bcdfghjklmnpqrstvwxz", v6 | 0x20, 0x15uLL) || !memchr("bcdfghjklmnpqrstvwxz", v5[1] | 0x20u, 0x15uLL))
  {
    if (!v6) {
      return 0;
    }
LABEL_10:
    if (memchr("bcdfghjklmnpqrstvwxz", v6, 0x15uLL) && v5[1] && memchr("bcdfghjklmnpqrstvwxz", v5[1], 0x15uLL)) {
      goto LABEL_13;
    }
    if (!a3) {
      goto LABEL_27;
    }
    if ((v6 + 64) < 0x1Fu)
    {
LABEL_32:
      create_buffer(1, (uint64_t)v5, 0);
      if (no_exception(1, "\tAR\x01gy\x01HA\x01OZ\x01PA\x01UG\x01UL\x01YD\x01ZE\x01", (unsigned __int8 *)byte_9D9D8)&& is_separator(v5 + 2))
      {
        return 1;
      }
      create_buffer(1, (uint64_t)v5, 0);
      if (no_exception(1, "\tATM\x01IHT\x01IND\x01LER\x01RAD\x01KAT\x01MIN\x01MOL\x01SE[CK\x01YRD\x01", (unsigned __int8 *)byte_9D9D8))
      {
        int v11 = v5 + 3;
        return is_separator(v11);
      }
      return 0;
    }
    if ((v6 - 91) <= 0xE5u)
    {
LABEL_27:
      if (v6 <= 0xDE && (v6 - 123) < 0xE6u) {
        return 0;
      }
    }
    if (v6 <= 0x77 && (v6 - 97) >= 3u && v6 != 111 && v6 != 117)
    {
      unint64_t v12 = is_generic_abbrev(v5);
      if (a2)
      {
        if (!v12)
        {
          if (!strncmp((const char *)v5 + 1, "'.", 2uLL) || (int v13 = v5[1], v13 != 39) && v13 != 46)
          {
            if (is_separator(v5 + 1)) {
              return 1;
            }
          }
        }
      }
    }
    goto LABEL_32;
  }
LABEL_13:
  if (is_common_abbrev(v5) || is_url(v5)) {
    return 0;
  }
  create_buffer(1, (uint64_t)v5, 0);
  int v7 = no_exception(1, byte_4B83A, (unsigned __int8 *)byte_9D9D8);
  uint64_t result = 0;
  if (!v7)
  {
    uint64_t v9 = 0;
    while (1)
    {
      int v10 = v5[v9 + 1];
      if ((!a3 || !memchr("bcdfghjklmnpqrstvwxz", v10 | 0x20u, 0x15uLL))
        && (!v10 || !memchr("bcdfghjklmnpqrstvwxz", v10, 0x15uLL)))
      {
        break;
      }
      uint64_t result = 0;
      if (++v9 == 4) {
        return result;
      }
    }
    int v11 = &v5[v9 + 1];
    if ((unint64_t)(v9 + 1) > 1) {
      return is_separator(v11);
    }
    int v14 = (const char *)&v5[v9 + 2];
    if (!strncmp(v14, "'.", 2uLL)) {
      return is_separator(v11);
    }
    uint64_t result = 0;
    int v15 = *(unsigned __int8 *)v14;
    if (v15 != 39 && v15 != 46) {
      return is_separator(v11);
    }
  }
  return result;
}

uint64_t timespec_follows(unsigned char *a1)
{
  int v1 = *a1;
  if (!*a1) {
    return 0;
  }
  for (uint64_t i = (uint64_t)a1; ; ++i)
  {
    int v3 = memchr(".:\x1E \xA0\xB0", v1, 7uLL);
    if ((v1 - 58) <= 0xFFFFFFF5 && !v3) {
      break;
    }
    int v4 = *(unsigned __int8 *)(i + 1);
    int v1 = v4;
    if (!v4) {
      return 0;
    }
  }
  if (v1 == 45
    && *(unsigned __int8 *)(i + 1) - 1 <= 0x1F
    && *(unsigned __int8 *)(i + 2) - 58 > 0xFFFFFFF5)
  {
    return 1;
  }
  unsigned int v6 = *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pLangGlb);
  create_buffer(1, i, 0);

  return no_exception(1, v6, (unsigned __int8 *)byte_9D9D8);
}

void *append_list_element(void *result, const char *a2, uint64_t a3)
{
  if (!bMemoryOverflow)
  {
    int v5 = result;
    uint64_t result = malloc_type_malloc(0x38uLL, 0x1030040B94BF364uLL);
    if (result)
    {
      unsigned int v6 = result;
      *uint64_t result = a2;
      result[2] = 0;
      uint64_t result = (void *)strlen(a2);
      v6[1] = result;
      v6[3] = a3;
      v6[4] = 0;
      uint64_t v7 = v5[6];
      v6[5] = v5;
      v6[6] = v7;
      uint64_t v8 = v5[6];
      if (v8) {
        *(void *)(v8 + 40) = v6;
      }
      v5[6] = v6;
    }
    else
    {
      bMemoryOverflow = 1;
    }
  }
  return result;
}

void *terminate_upper(uint64_t a1)
{
  int v1 = *(unsigned __int8 **)(a1 + 48);
  int v2 = (unsigned __int8 *)*((void *)v1 + 6);
  if (v2)
  {
    while (1)
    {
      int v3 = **(unsigned __int8 **)v2;
      if ((v3 == 9 || v3 == 160 || v3 == 32) && (int v4 = (unsigned __int8 *)*((void *)v2 + 6)) != 0)
      {
        if ((v4[24] & 0xC0) != 0) {
          int v5 = (unsigned __int8 *)*((void *)v2 + 6);
        }
        else {
          int v5 = v1;
        }
        int v1 = (unsigned __int8 *)*((void *)v5 + 6);
        if (!v1) {
          return append_list_element(v5, *(const char **)&stru_68.segname[(void)pLangGlb], 2);
        }
      }
      else
      {
        int v5 = v1;
        int v1 = v2;
      }
      if ((v1[24] & 0xDC) != 0 || **(unsigned char **)v1 == 47)
      {
        int v2 = (unsigned __int8 *)*((void *)v1 + 6);
        int v5 = v1;
        if (v2) {
          continue;
        }
      }
      return append_list_element(v5, *(const char **)&stru_68.segname[(void)pLangGlb], 2);
    }
  }
  int v5 = *(unsigned __int8 **)(a1 + 48);
  return append_list_element(v5, *(const char **)&stru_68.segname[(void)pLangGlb], 2);
}

const char **uppersign_follows(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2) {
    return 0;
  }
  int v3 = *(const char ***)(v2 + 48);
  if (!v3) {
    return v3;
  }
  int v5 = pLangGlb;
  int v6 = nLangIDGlb;
  while (1)
  {
    uint64_t v7 = (uint64_t)v3[3];
    if (v7 != 2) {
      goto LABEL_13;
    }
    if (*(unsigned __int8 *)*v3 != **(unsigned __int8 **)((char *)&stru_20.filesize + (void)v5)) {
      break;
    }
    uint64_t v8 = (unsigned __int8 *)v3[6];
    if (!v8 || *((void *)v8 + 1) != 1 || (v8[35] & 8) == 0) {
      break;
    }
    int v3 = (const char **)*((void *)v8 + 6);
    if (!v3) {
      return 0;
    }
    uint64_t v7 = (uint64_t)v3[3];
LABEL_13:
    if ((v7 & 0x10DC) == 0) {
      goto LABEL_14;
    }
LABEL_24:
    int v3 = (const char **)v3[6];
    if (!v3) {
      return 0;
    }
  }
  uint64_t v7 = 2;
LABEL_14:
  uint64_t v9 = *v3;
  int v10 = *(unsigned __int8 *)*v3;
  if (v10 == 9 || v10 == 32 || v10 == 160) {
    goto LABEL_24;
  }
  BOOL v11 = (v10 - 45) <= 1 && v6 == 9;
  if (v11
    || !strcmp(*v3, *(const char **)&stru_68.segname[(void)v5 + 8])
    || !strcmp(v9, *(const char **)((char *)&stru_68.size + (void)v5))
    || v10 == 47)
  {
    goto LABEL_24;
  }
  if (v7 != 2 || !v3[6] || strcmp(v9, a2)) {
    return 0;
  }
  return v3;
}

uint64_t lowerchar_follows(uint64_t result, int a2)
{
  if (!result) {
    return result;
  }
  int v2 = a2;
  int v3 = (unsigned __int8 **)result;
  if (a2)
  {
    if (*(void *)(result + 48)) {
      goto LABEL_4;
    }
    return 1;
  }
  uint64_t v13 = *(void *)(result + 40);
  if (v13)
  {
    unint64_t v14 = *(void *)(v13 + 24);
    if (v14 == 64
      || v14 == 128
      || v14 <= 2 && (uint64_t v16 = *(void *)(v13 + 40)) != 0 && ((v17 = *(void *)(v16 + 24), v17 == 128) || v17 == 64))
    {
      if (*(uint64_t *)(result + 8) < 3) {
        return 1;
      }
      int v15 = *(const char **)result;
      if (!strcmp(*(const char **)result, "CHF") || !strcmp(v15, "EUR") || !strcmp(v15, "SFR")) {
        return 1;
      }
    }
  }
  unsigned int v18 = v3[6];
  if (!v18 || *((void *)v18 + 3) == 64) {
    return 1;
  }
  int v19 = **(unsigned __int8 **)v18;
  if (**(unsigned char **)v18
    && memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", **(unsigned __int8 **)v18, 0x15uLL))
  {
    uint64_t result = 1;
    char v20 = v19 - 39;
    if ((v19 - 39) > 0x38) {
      return result;
    }
    if (((1 << v20) & 0x100000000000041) == 0)
    {
      if (((1 << v20) & 0x100020) == 0) {
        return result;
      }
      goto LABEL_4;
    }
    v21 = (unsigned __int8 *)*((void *)v18 + 6);
    if (!v21 || *((void *)v21 + 3) != 1024 || lowerchar_follows()) {
      return 1;
    }
  }
  do
  {
LABEL_4:
    int v3 = (unsigned __int8 **)v3[6];
    if (!v3) {
      return v2 == 0;
    }
  }
  while (v3[3] == (unsigned char *)&dword_0 + 2);
  while (1)
  {
    int v4 = (uint64_t *)v3[3];
    if (!v4) {
      goto LABEL_21;
    }
    if (v4 == &stru_3D8.fileoff) {
      break;
    }
    if (((unsigned __int16)v4 & 0xB00) != 0
      || (v4 & 1) != 0 && ((int v6 = **v3, v6 != 10) ? (v7 = v6 == 13) : (v7 = 1), v7))
    {
LABEL_37:
      int v2 = 0;
      return v2 == 0;
    }
    if ((v4 & 0xC0) == 0)
    {
      uint64_t v8 = *v3;
      uint64_t v9 = **v3;
      BOOL v10 = in(v9, 11);
      BOOL v11 = v9 == 45 || !v10;
      if (!v11 && v8[(void)v3[1] - 1] != 46) {
        goto LABEL_37;
      }
      if (v4 == (uint64_t *)&stru_20)
      {
        uint64_t v12 = (uint64_t)v3[1];
        if (v12 == 1)
        {
          if (in(v9, 41)) {
            goto LABEL_37;
          }
        }
        else if (v12 >= 2 && v9 == 39)
        {
          goto LABEL_37;
        }
      }
      else if (v2 && v4 == (uint64_t *)((char *)&dword_0 + 2))
      {
        return v2 == 0;
      }
    }
LABEL_21:
    int v3 = (unsigned __int8 **)v3[6];
    if (!v3) {
      return v2 == 0;
    }
  }
  if (!v2)
  {
    uint64_t v5 = (uint64_t)v3[1];
    if (v5 <= 2 && (v5 != 2 || !is_roman_number(*v3))) {
      goto LABEL_21;
    }
    if (**(unsigned char **)v3[5] == 47) {
      goto LABEL_21;
    }
  }
  v3[3] = (unsigned char *)(&stru_3D8 + 40);
  int v2 = 1;
  return v2 == 0;
}

uint64_t upperchar_follows(uint64_t a1, int a2)
{
  for (uint64_t i = (unsigned char *)(a1 + 3); ; ++i)
  {
    int v4 = *(i - 2);
    if (v4 != 173 && v4 != 30) {
      break;
    }
  }
  if (in(*(i - 2), 9))
  {
    for (uint64_t j = 1; ; uint64_t j = v8)
    {
      if (!(_BYTE)v4) {
        goto LABEL_17;
      }
      if (v4 == 45) {
        return j;
      }
      if ((v4 + 33) <= 0xE0u && (v4 - 91) < 0xE6u) {
        break;
      }
      uint64_t v8 = 1;
      if (!a2 || j) {
        return v8;
      }
LABEL_32:
      int v4 = *(i - 1);
      BOOL v11 = in(*(i - 1), 11) || v4 == 30;
      if (!v11 && v4 != 173) {
        return v8;
      }
      ++i;
    }
    if (v4 == 30 || v4 == 173)
    {
      uint64_t v8 = j;
      goto LABEL_32;
    }
LABEL_17:
    uint64_t v8 = 0;
    if (a2 && j)
    {
      int v9 = *(i - 1);
      if (*(i - 1))
      {
        uint64_t v8 = 1;
        if ((v9 + 33) > 0xE0u || (v9 - 91) > 0xE5u) {
          return v8;
        }
      }
      if (!in(*(i - 1), 11)) {
        return 1;
      }
      if (v9 == 173 || v9 == 30)
      {
        uint64_t v10 = *i;
        if (*i)
        {
          uint64_t v8 = 1;
          if ((v10 + 33) > 0xE0u || (v10 - 91) > 0xE5u) {
            return v8;
          }
        }
        if (!in(v10, 11)) {
          return 1;
        }
      }
      uint64_t v8 = 0;
    }
    goto LABEL_32;
  }
  return 1;
}

size_t brl_add_exception(size_t result, int a2)
{
  if (!result || !*(unsigned char *)result) {
    return result;
  }
  if (a2)
  {
    int v3 = &bwd_exceptions;
    int v4 = 100;
    while (*v3)
    {
      v3 += 160;
      if (!--v4) {
        return result;
      }
    }
  }
  else
  {
    int v3 = &exceptions;
    int v5 = 100;
    while (*v3)
    {
      v3 += 160;
      if (!--v5) {
        return result;
      }
    }
  }
  *((void *)v3 + 19) = 122880;
  int v6 = *(unsigned __int8 *)result;
  if (!*(unsigned char *)result) {
    return result;
  }
  uint64_t v7 = 0;
  while (v6 <= 124)
  {
    if (v6 == 9 || v6 == 32) {
      goto LABEL_22;
    }
LABEL_20:
    size_t v8 = result + v7++;
    int v6 = *(unsigned __int8 *)(v8 + 1);
    if (!v6) {
      return result;
    }
  }
  if (v6 != 160 && v6 != 125) {
    goto LABEL_20;
  }
LABEL_22:
  *((void *)v3 + 17) = v7;
  if ((unint64_t)(v7 - 65) < 0xFFFFFFFFFFFFFFC1) {
    return result;
  }
  uint64_t v9 = result + v7 + 2;
  uint64_t result = __strncpy_chk();
  v3[*((void *)v3 + 17)] = 0;
  unsigned __int8 v10 = *v3;
  if (a2)
  {
    if (*v3)
    {
      BOOL v11 = (unsigned __int8 *)(v3 + 1);
      do
      {
        if ((v10 + 33) > 0xE0u || (v10 - 91) >= 0xE6u) {
          *(v11 - 1) = v10 | 0x20;
        }
        int v12 = *v11++;
        unsigned __int8 v10 = v12;
      }
      while (v12);
    }
  }
  else if (*v3)
  {
    uint64_t v13 = (unsigned __int8 *)(v3 + 1);
    do
    {
      if (v10 > 0xDEu || (v10 - 123) >= 0xE6u) {
        *(v13 - 1) = v10 & 0xDF;
      }
      int v14 = *v13++;
      unsigned __int8 v10 = v14;
    }
    while (v14);
  }
  while (2)
  {
    int v15 = *(unsigned __int8 *)(v9 - 1);
    if (v15 > 0x1F)
    {
      if (v15 != 160 && v15 != 32) {
        goto LABEL_59;
      }
      goto LABEL_38;
    }
    if (v15 == 9)
    {
LABEL_38:
      ++v9;
      continue;
    }
    break;
  }
  if (!*(unsigned char *)(v9 - 1))
  {
LABEL_45:
    uint64_t result = strlen((const char *)(v9 - 1));
    size_t v16 = result;
    *((void *)v3 + 18) = result;
    uint64_t i = &byte_29F12;
    goto LABEL_46;
  }
LABEL_59:
  size_t v16 = 0;
  while (2)
  {
    if (v15 <= 124)
    {
      if (v15 == 9 || v15 == 32) {
        break;
      }
      goto LABEL_66;
    }
    if (v15 != 160 && v15 != 125)
    {
LABEL_66:
      int v15 = *(unsigned __int8 *)(v9 + v16++);
      if (!v15) {
        goto LABEL_45;
      }
      continue;
    }
    break;
  }
  *((void *)v3 + 18) = v16;
  for (uint64_t i = (char *)(v9 + v16); ; ++i)
  {
    int v23 = *i;
    if (v23 != 9 && v23 != 160 && v23 != 32) {
      break;
    }
  }
LABEL_46:
  if (v16 - 65 <= 0xFFFFFFFFFFFFFFBFLL)
  {
    *int v3 = 0;
    return result;
  }
  unsigned int v18 = v3 + 65;
  __strncpy_chk();
  v3[*((void *)v3 + 18) + 65] = 0;
  if (!a2)
  {
    char v19 = *v18;
    if (*v18)
    {
      char v20 = (unsigned __int8 *)(v3 + 66);
      do
      {
        if ((v19 + 33) > 0xE0u || (v19 - 91) >= 0xE6u) {
          *(v20 - 1) = v19 | 0x20;
        }
        int v21 = *v20++;
        char v19 = v21;
      }
      while (v21);
    }
  }
  uint64_t result = __tolower(*i);
  if ((int)result > 108)
  {
    if (result == 109)
    {
      uint64_t v22 = 0x8000;
    }
    else
    {
      if (result != 115) {
        return result;
      }
      uint64_t v22 = 0x2000;
    }
    goto LABEL_78;
  }
  if (result == 98)
  {
    uint64_t v22 = 0x4000;
LABEL_78:
    *((void *)v3 + 19) = v22;
    return result;
  }
  if (result == 101)
  {
    uint64_t v22 = 0x10000;
    goto LABEL_78;
  }
  return result;
}

void brl_clear_exceptions()
{
  v0 = &exceptions;
  uint64_t v1 = 100;
  do
  {
    char *v0 = 0;
    v0[65] = 0;
    *((void *)v0 + 17) = 0;
    *((void *)v0 + 18) = 0;
    v0 += 160;
    --v1;
  }
  while (v1);
  int v2 = &bwd_exceptions;
  uint64_t v3 = 100;
  do
  {
    *int v2 = 0;
    v2[65] = 0;
    *((void *)v2 + 17) = 0;
    *((void *)v2 + 18) = 0;
    v2 += 160;
    --v3;
  }
  while (v3);
}

uint64_t brl_get_table(__int16 a1)
{
  if ((unsigned __int16)(a1 - 3) > 0xCu) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_90CC0 + (__int16)(a1 - 3));
  }
}

uint64_t brl_set_language(int a1, uint64_t a2)
{
  int v2 = a1 & 0x3FF;
  nLangIDGlb = v2;
  int v3 = a1 >> 10;
  nSubLangIDGlb = a1 >> 10;
  switch(v2)
  {
    case 12:
      int v4 = &BWD_LANG_FR;
      int v5 = &LANG_FR;
      break;
    case 10:
      int v4 = &BWD_LANG_ES;
      int v5 = &LANG_ES;
      break;
    case 9:
      if (v3 == 1)
      {
        int v4 = &BWD_LANG_ENU;
        int v5 = &LANG_ENU;
      }
      else if (v3 == 3)
      {
        int v4 = &BWD_LANG_UEB;
        int v5 = &LANG_UEB;
      }
      else
      {
        int v4 = &BWD_LANG_EN;
        int v5 = &LANG_EN;
      }
      break;
    default:
      int v4 = &BWD_LANG_DE;
      int v5 = &LANG_DE;
      break;
  }
  pLangGlb = v5;
  pBwdLangGlb = v4;
  nEncodingGlb = a2;
  bUpShiftGlb = a2 & 0x10000;
  pCharmapGlb = brl_get_table(a2);
  return 0;
}

uint64_t brl_get_binary_dots(unsigned __int8 a1)
{
  int v1 = a1;
  if (pCharmapGlb)
  {
    uint64_t v2 = 0;
    while (*(unsigned __int8 *)(pCharmapGlb + v2) != a1)
    {
      if (++v2 == 256)
      {
        int v1 = 0;
        goto LABEL_7;
      }
    }
    int v1 = v2;
  }
LABEL_7:
  uint64_t result = 0;
  while (brl_set_ansi[result] != v1)
  {
    if (++result == 256) {
      return 0;
    }
  }
  return result;
}

uint64_t brl_convert_to_utf(unsigned char *a1, unsigned char *a2, int a3)
{
  if (!a1 || !a2 && a3 > 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1 != a2 && (a3 & 0x80000000) == 0)
  {
    unsigned int v5 = *a1;
    if (*a1)
    {
      int v6 = 0;
      do
      {
        if (v5 > 0x1F)
        {
          if (v6 >= a3 - 2)
          {
            if (a3 > 0) {
              return 4294967294;
            }
            v6 += 2;
          }
          else
          {
            if (pCharmapGlb)
            {
              uint64_t v7 = 0;
              while (*(unsigned __int8 *)(pCharmapGlb + v7) != v5)
              {
                if (++v7 == 256)
                {
                  unsigned int v5 = 0;
                  goto LABEL_24;
                }
              }
              unsigned int v5 = v7;
            }
LABEL_24:
            uint64_t v8 = 0;
            while (brl_set_ansi[v8] != v5)
            {
              if (++v8 == 256)
              {
                LODWORD(v8) = 0;
                break;
              }
            }
            uint64_t v9 = v6;
            unsigned __int8 v10 = &a2[v6];
            *unsigned __int8 v10 = -30;
            v9 += 2;
            v10[1] = (v8 >> 6) | 0xA0;
            a2[v9] = v8 & 0x3F | 0x80;
            int v6 = v9;
          }
        }
        else if (v6 >= a3)
        {
          if (a3 > 0) {
            return 4294967294;
          }
        }
        else
        {
          a2[v6] = v5;
        }
        unsigned int v11 = *++a1;
        unsigned int v5 = v11;
        int v12 = v6 + 1;
        if (!v11) {
          break;
        }
      }
      while (v6++ < 2147483643);
    }
    else
    {
      int v12 = 0;
    }
    if (v12 >= a3)
    {
      if (a3 > 0) {
        return 4294967294;
      }
    }
    else
    {
      a2[v12] = 0;
    }
    return (v12 + 1);
  }
  return v3;
}

uint64_t brl_convert_from_utf(unsigned __int8 *a1, unsigned __int8 *a2, int a3)
{
  if (!a1 || !a2 && a3 > 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1 != a2 && (a3 & 0x80000000) == 0)
  {
    unsigned __int8 v5 = *a1;
    if (!*a1)
    {
      LODWORD(v6) = 0;
LABEL_43:
      if ((int)v6 >= a3)
      {
        if (a3 > 0) {
          return 4294967294;
        }
      }
      else
      {
        a2[v6] = 0;
      }
      return (v6 + 1);
    }
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3)
      {
        if (a3 > 0) {
          return 4294967294;
        }
        goto LABEL_36;
      }
      if (v5 - 196 < 0x1C) {
        break;
      }
      if (v5 - 192 >= 4)
      {
        if (v5 == 226)
        {
          unsigned __int8 v11 = a1[1];
          if ((v11 & 0xFC) == 0xA0 && (unsigned __int8 v12 = a1[2], (v12 & 0xC0) == 0x80))
          {
            uint64_t v13 = &brl_set_ansi[v12 & 0x3F | (v11 << 6)];
            if (pCharmapGlb) {
              uint64_t v13 = (char *)(pCharmapGlb + *v13);
            }
            a2[v7] = *v13;
            a1 += 2;
          }
          else
          {
            a2[v7] = 32;
            a1 += 2;
          }
          goto LABEL_36;
        }
        if ((v5 & 0xF0) == 0xE0)
        {
          if ((char)a1[1] > -65) {
            goto LABEL_35;
          }
          uint64_t v8 = a1 + 2;
          int v9 = (char)a1[2];
        }
        else
        {
          if ((v5 & 0xF8) != 0xF0 || (char)a1[1] > -65 || (char)a1[2] > -65)
          {
LABEL_35:
            a2[v7] = v5;
            goto LABEL_36;
          }
          uint64_t v8 = a1 + 3;
          int v9 = (char)a1[3];
        }
        goto LABEL_13;
      }
      uint64_t v8 = a1 + 1;
      int v10 = (char)a1[1];
      if (v10 > -65) {
        goto LABEL_35;
      }
      a2[v7] = v10 & 0x7F | (v5 << 6);
LABEL_15:
      a1 = v8;
LABEL_36:
      int v14 = *++a1;
      unsigned __int8 v5 = v14;
      unint64_t v6 = v7 + 1;
      if (v14) {
        BOOL v15 = v7 >= 0x7FFFFFFD;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15) {
        goto LABEL_43;
      }
    }
    uint64_t v8 = a1 + 1;
    int v9 = (char)a1[1];
LABEL_13:
    if (v9 > -65) {
      goto LABEL_35;
    }
    a2[v7] = 32;
    goto LABEL_15;
  }
  return v3;
}

void brl_process_command(unsigned __int8 *a1)
{
  if (!a1) {
    return;
  }
  int v2 = *a1;
  if (!*a1) {
    return;
  }
  uint64_t v3 = a1 + 1;
  while (v2 <= 124)
  {
    if (v2 == 9 || v2 == 32) {
      goto LABEL_13;
    }
LABEL_10:
    int v4 = *v3++;
    int v2 = v4;
    if (!v4)
    {
      uint64_t v3 = (unsigned __int8 *)&byte_29F12;
      goto LABEL_16;
    }
  }
  if (v2 != 160 && v2 != 125) {
    goto LABEL_10;
  }
LABEL_13:
  while (1)
  {
    int v5 = *v3;
    if (v5 != 9 && v5 != 160 && v5 != 32) {
      break;
    }
    ++v3;
  }
LABEL_16:
  if (equals_nocase(a1, "ETC"))
  {
    brl_clear_exceptions();
    return;
  }
  if (equals_nocase(a1, "ETA"))
  {
    size_t v6 = (size_t)v3;
    int v7 = 0;
    goto LABEL_24;
  }
  if (!equals_nocase(a1, "ETB"))
  {
    if (equals_nocase(a1, "FLN"))
    {
      if (equals_nocase(v3, "ch"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 7;
        nSubLangIDGlb = 2;
        pLangGlb = &LANG_DE;
        int v9 = off_95000;
        int v10 = &BWD_LANG_DE;
      }
      else if (equals_nocase(v3, "ueb"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 9;
        nSubLangIDGlb = 3;
        pLangGlb = &LANG_UEB;
        int v9 = off_95000;
        int v10 = &BWD_LANG_UEB;
      }
      else if (equals_nocase(v3, "enu"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 9;
        nSubLangIDGlb = 1;
        pLangGlb = &LANG_ENU;
        int v9 = off_95000;
        int v10 = &BWD_LANG_ENU;
      }
      else if (equals_nocase(v3, "en"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 9;
        nSubLangIDGlb = 2;
        pLangGlb = &LANG_EN;
        int v9 = off_95000;
        int v10 = &BWD_LANG_EN;
      }
      else
      {
        if (!equals_nocase(v3, "fr"))
        {
          int v33 = equals_nocase(v3, "es");
          uint64_t v34 = nEncodingGlb & 0x10000;
          uint64_t table = brl_get_table(nEncodingGlb);
          if (v33)
          {
            nLangIDGlb = 10;
            nSubLangIDGlb = 1;
            pLangGlb = &LANG_ES;
            v35 = &BWD_LANG_ES;
          }
          else
          {
            nLangIDGlb = 7;
            nSubLangIDGlb = 1;
            pLangGlb = &LANG_DE;
            v35 = &BWD_LANG_DE;
          }
          pBwdLangGlb = v35;
          bUpShiftGlb = v34;
          goto LABEL_77;
        }
        int v8 = nEncodingGlb;
        nLangIDGlb = 12;
        nSubLangIDGlb = 1;
        pLangGlb = &LANG_FR;
        int v9 = off_95000;
        int v10 = &BWD_LANG_FR;
      }
      v9[135] = (char *)v10;
      bUpShiftGlb = *(void *)&v8 & 0x10000;
      uint64_t table = brl_get_table(v8);
LABEL_77:
      pCharmapGlb = table;
      return;
    }
    if (!equals_nocase(a1, "TBL"))
    {
      if (equals_nocase(a1, "FGR"))
      {
        uint64_t v13 = lFlags;
        unint64_t v14 = lFlags & 0xFFFFFFFFFFFF0000;
        lFlags &= 0xFFFFFFFFFFFF0000;
        b8DotBraille = 0;
        BOOL v15 = "1.5";
        size_t v16 = v3;
        while (1)
        {
          do
            int v17 = *v16++;
          while (v17 == 173 || v17 == 30);
          if (v17 != *(unsigned __int8 *)v15) {
            break;
          }
          if (++v15 == "")
          {
            uint64_t v19 = v14 | 0x7FFE;
            goto LABEL_71;
          }
        }
        for (uint64_t i = v3; ; ++i)
        {
          int v22 = *i;
          if (v22 != 30 && v22 != 173) {
            break;
          }
        }
        if (v22 != 49)
        {
          for (uint64_t j = v3; ; ++j)
          {
            int v24 = *j;
            if (v24 != 30 && v24 != 173) {
              break;
            }
          }
          if (v24 != 48)
          {
            unsigned int v28 = *v3 - 56;
            BOOL v29 = v28 > 0x2B;
            uint64_t v30 = (1 << v28) & 0x80000000801;
            if (!v29 && v30 != 0) {
              b8DotBraille = 1;
            }
            return;
          }
        }
        uint64_t v19 = v13 | 0xFFFF;
      }
      else
      {
        uint64_t v20 = 0;
        while (!equals_nocase(a1, (unsigned __int8 *)(&off_90BE8)[v20]))
        {
          v20 += 3;
          if (v20 == 27) {
            return;
          }
        }
        int v25 = equals_nocase(v3, "ON");
        unint64_t v26 = (unint64_t)(&off_90BE8)[v20 + 1];
        if (v25 == (LODWORD((&off_90BE8)[v20 + 2]) == 0)) {
          uint64_t v19 = lFlags & ~v26;
        }
        else {
          uint64_t v19 = lFlags | v26;
        }
      }
LABEL_71:
      lFlags = v19;
      return;
    }
    if (equals_nocase(v3, "ANSI"))
    {
      int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
    }
    else
    {
      if (equals_nocase(v3, "IBM437"))
      {
        int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
        uint64_t v12 = 3;
        goto LABEL_86;
      }
      if (equals_nocase(v3, "IBM850"))
      {
        int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
        uint64_t v12 = 4;
        goto LABEL_86;
      }
      if (equals_nocase(v3, "US437"))
      {
        int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
        uint64_t v12 = 7;
        goto LABEL_86;
      }
      int v32 = equals_nocase(v3, "TBFR2007");
      int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
      if (v32)
      {
        uint64_t v12 = 14;
        goto LABEL_86;
      }
    }
    uint64_t v12 = 0;
LABEL_86:
    brl_set_language(v11, v12);
    return;
  }
  size_t v6 = (size_t)v3;
  int v7 = 1;
LABEL_24:

  brl_add_exception(v6, v7);
}

uint64_t is_nemeth_enabled()
{
  if (nLangIDGlb != 9 || nSubLangIDGlb == 2) {
    return 0;
  }
  else {
    return byte_9D9E8 & 1 | ((lFlags & 0x40000000) == 0);
  }
}

uint64_t is_antoine_enabled()
{
  if (nLangIDGlb == 12) {
    return byte_9D9E8 & 1 | ((lFlags & 0x40000000) == 0);
  }
  else {
    return 0;
  }
}

void enter_numeric_mode()
{
  BOOL v0 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
  if (v0 && (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
    byte_9D9EC = 1;
  }
}

void terminate_numeric_mode()
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
  {
    byte_9D9EC = 0;
    dword_9D9F0 = 0;
  }
}

uint64_t upper_digit(unsigned __int8 a1)
{
  if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
  {
    if (nLangIDGlb != 12 || (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0 || a1 - 58 < 0xFFFFFFF6) {
      goto LABEL_14;
    }
    int v2 = "#123456789";
LABEL_17:
    uint64_t v3 = &v2[a1 - 48];
    return *v3;
  }
  if (((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0) && a1 - 58 >= 0xFFFFFFF6)
  {
    int v2 = "),;:/?+=(*";
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v3 = *(const char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * a1);
  return *v3;
}

uint64_t get_separator(int a1)
{
  if (a1 && (nLangIDGlb == 9 ? (BOOL v1 = nSubLangIDGlb == 3) : (BOOL v1 = 0), v1))
  {
    return 33;
  }
  else
  {
    if (nLangIDGlb != 9 || nSubLangIDGlb == 2) {
      return stru_B8.segname[(void)pLangGlb + 2];
    }
    char v2 = 39;
    if ((byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
      return stru_B8.segname[(void)pLangGlb + 2];
    }
  }
  return v2;
}

uint64_t std_char(uint64_t result)
{
  if (qword_9D9F8 <= 0)
  {
    BOOL v1 = (unsigned char *)qword_9DA00;
    uint64_t v2 = qword_9DA08;
  }
  else
  {
    BOOL v1 = (unsigned char *)qword_9DA00;
    uint64_t v2 = qword_9DA08;
    if (!--qword_9D9F8)
    {
      if (qword_9DA00 == qword_9DA08) {
        return result;
      }
      *(unsigned char *)qword_9DA00 = 30;
      qword_9DA00 = (uint64_t)++v1;
    }
  }
  if (v1 != (unsigned char *)v2)
  {
    unsigned char *v1 = result;
    qword_9DA00 = (uint64_t)(v1 + 1);
  }
  return result;
}

uint64_t std_string(unsigned char *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    uint64_t result = std_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }
  while (v4);
  return result;
}

void increment_cursor()
{
  if (qword_9D9F8 >= 2) {
    ++qword_9D9F8;
  }
}

uint64_t inc_char(uint64_t result)
{
  if (qword_9D9F8 >= 2) {
    ++qword_9D9F8;
  }
  return std_char(result);
}

uint64_t inc_string(unsigned char *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    if (qword_9D9F8 >= 2) {
      ++qword_9D9F8;
    }
    uint64_t result = std_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }
  while (v4);
  return result;
}

uint64_t map_char(uint64_t result)
{
  if (result)
  {
    int v1 = result;
    uint64_t v2 = &OBJC_INSTANCE_METHODS_NSObject;
    if (result != 150 || (lFlags & 0x20000000) == 0)
    {
      uint64_t v3 = *(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb);
      int v4 = off_95000;
      if (*v3 != result)
      {
        if result < 0xC0u || nLangIDGlb == 12 || (lFlags & 0x40000) == 0 || (byte_9D9E8)
        {
          uint64_t v3 = *(unsigned __int8 **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8
                                                                                          * result);
        }
        else
        {
          uint64_t v3 = *(unsigned __int8 **)(*(void *)&stru_20.segname[(void)pLangGlb + 8] + 8 * (result & 0x3F));
          if (nLangIDGlb == 9 && nSubLangIDGlb == 2 && *v3 == 34) {
            ++v3;
          }
        }
      }
      unsigned __int8 v7 = *v3;
      size_t v6 = v3 + 1;
      unsigned __int8 v5 = v7;
      while (v1 != 151 || v5 != 45 || (v2[422].entrysize & 0x20000000) == 0)
      {
        if (**(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb) != v5
          || (uint64_t v8 = qword_9DA00, v9 = qword_9DA00 - qword_9DA10, qword_9DA00 == qword_9DA10))
        {
          if (*v6 && qword_9D9F8 >= 2) {
            ++qword_9D9F8;
          }
          goto LABEL_37;
        }
        int v11 = (unsigned __int8 *)(qword_9DA00 - 1);
        int v10 = *(unsigned __int8 *)(qword_9DA00 - 1);
        if (v10 != v5)
        {
          if (*v6 && qword_9D9F8 >= 2) {
            ++qword_9D9F8;
          }
          int v12 = *((_DWORD *)v4 + 268);
          if ((v12 == 12 || v12 == 9) && v10 == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)pLangGlb))
          {
            int64_t v13 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb - 8]);
            unint64_t v14 = *(const char **)&stru_68.sectname[(void)pLangGlb];
            int64_t v15 = strlen(v14);
            if (v9 >= v13
              && (int v17 = (unsigned __int8 *)(qword_9DA00 - v13),
                  !strncmp((const char *)(qword_9DA00 - v13), *(const char **)&stru_68.segname[(void)pLangGlb - 8], v13)))
            {
              int v11 = v17;
            }
            else if (v9 >= v15 && !strncmp((const char *)(v8 - v15), v14, v15))
            {
              int v11 = (unsigned __int8 *)(v8 - v15);
            }
            uint64_t v2 = &OBJC_INSTANCE_METHODS_NSObject;
            int v4 = off_95000;
            unsigned __int8 *v11 = v5;
            unsigned __int8 v5 = **(unsigned char **)((char *)&stru_20.filesize + (void)pLangGlb);
          }
          goto LABEL_37;
        }
LABEL_38:
        int v16 = *v6++;
        unsigned __int8 v5 = v16;
        if (!v16) {
          return result;
        }
      }
      unsigned __int8 v5 = -106;
LABEL_37:
      uint64_t result = std_char((char)v5);
      goto LABEL_38;
    }
    return std_char(4294967190);
  }
  return result;
}

uint64_t map_string(unsigned char *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    uint64_t result = map_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }
  while (v4);
  return result;
}

uint64_t add_char(uint64_t result)
{
  uint64_t v1 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = result;
  qword_9DA00 = v1 + 1;
  return result;
}

unsigned __int8 *add_string(unsigned char *a1)
{
  uint64_t v1 = (unsigned char *)qword_9DA00;
  char v4 = *a1;
  uint64_t result = a1 + 1;
  char v3 = v4;
  do
  {
    *v1++ = v3;
    int v5 = *result++;
    char v3 = v5;
  }
  while (v5);
  qword_9DA00 = (uint64_t)v1;
  return result;
}

uint64_t number_precedes(int a1)
{
  uint64_t v2 = qword_9DA18;
  if ((qword_9DA18 & 0xC0) != 0)
  {
    if (a1) {
      return 1;
    }
    char v3 = (unsigned __int8 *)qword_9DA20;
    goto LABEL_4;
  }
  if ((unint64_t)qword_9DA18 < 3)
  {
    if ((qword_9DA28 & 0xC0) == 0)
    {
      size_t v6 = (unsigned __int8 *)qword_9DA30;
      if (qword_9DA28 != 4) {
        goto LABEL_11;
      }
      if (**(unsigned char **)qword_9DA30 != 46) {
        goto LABEL_12;
      }
      uint64_t v12 = *(void *)(qword_9DA30 + 40);
      if (!v12 || *(void *)(v12 + 24) != 64) {
        goto LABEL_12;
      }
      return 1;
    }
    if (a1) {
      return 1;
    }
    char v3 = *(unsigned __int8 **)qword_9DA30;
LABEL_4:
    int v4 = *v3;
    if (v4 == upper_digit(0x30u)) {
      goto LABEL_10;
    }
    return 1;
  }
LABEL_10:
  size_t v6 = (unsigned __int8 *)qword_9DA30;
LABEL_11:
  if (v6)
  {
LABEL_12:
    LODWORD(result) = v2 == 0x2000;
    do
    {
      uint64_t v7 = *((void *)v6 + 3);
      if (v7 > 127)
      {
        if (v7 == 128) {
          goto LABEL_32;
        }
        if (v7 == 1024 || v7 == 512)
        {
LABEL_21:
          if (result) {
            BOOL v8 = **(unsigned __int8 **)v6 == 181;
          }
          else {
            BOOL v8 = 0;
          }
          if (!v8 && result != 0) {
            return 0;
          }
LABEL_29:
          LODWORD(result) = 1;
          goto LABEL_30;
        }
      }
      else
      {
        if (v7 == 4 || v7 == 32) {
          goto LABEL_21;
        }
        if (v7 == 64)
        {
LABEL_32:
          if (result == 1)
          {
            if (a1) {
              return 1;
            }
            int v10 = **(unsigned __int8 **)v6;
            unsigned __int8 v11 = upper_digit(0x30u);
            uint64_t result = 1;
            if (v10 != v11) {
              return result;
            }
          }
          else
          {
            LODWORD(result) = 0;
          }
          goto LABEL_30;
        }
      }
      if ((v7 & 0x1E000) != 0 && !result) {
        goto LABEL_29;
      }
      if ((unint64_t)v7 > 2) {
        return 0;
      }
LABEL_30:
      size_t v6 = (unsigned __int8 *)*((void *)v6 + 5);
    }
    while (v6);
  }
  return 0;
}

BOOL number_follows(int a1)
{
  uint64_t v2 = 1;
  if (*(unsigned char *)(qword_9DA38 + 1) == 30)
  {
    uint64_t v2 = 2;
    char v3 = (unsigned __int8 *)(qword_9DA38 + 2);
  }
  else
  {
    char v3 = (unsigned __int8 *)(qword_9DA38 + 1);
  }
  if ((*(unsigned __int8 *)(qword_9DA38 + v2) | 0x80) == 0xA0)
  {
    int v4 = *++v3;
    if (v4 == 30) {
      ++v3;
    }
  }
  if (is_number(v3))
  {
    if (a1 || *v3 != 48) {
      return 1;
    }
    uint64_t v5 = 48;
  }
  else
  {
    uint64_t v5 = *v3;
  }
  if (in(v5, 9))
  {
    int v6 = v3[1];
    if (v3[1])
    {
      if (memchr("\xB9\xB2\xB3\xBC\xBD\xBE", v3[1], 7uLL)
        || v6 == 30 && v3[2] && memchr("\xB9\xB2\xB3\xBC\xBD\xBE", v3[2], 7uLL))
      {
        return 1;
      }
    }
  }
  if (v5 != 35) {
    return 0;
  }
  int v8 = v3[1];
  BOOL result = 1;
  if (v8 != 46 && v8 != 44)
  {
    if (v8 == 30)
    {
      int v9 = v3[2];
      if (v9 != 46) {
        return v9 == 44;
      }
      return result;
    }
    return 0;
  }
  return result;
}

unsigned __int8 **escape_number(unsigned __int8 **result, char a2)
{
  if ((qword_9DA28 & 0xC0) != 0)
  {
    uint64_t v2 = result;
    int v3 = **result;
    switch(**result)
    {
      case '!':
      case '*':
      case '/':
      case ':':
      case ';':
      case '?':
        if (((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0) && !dword_9D9F0)
        {
          if (qword_9DA28 == 128
            || (v5 = *(char **)result[5], (BOOL result = (unsigned __int8 **)strchr(v5, 44)) == 0)
            && (BOOL result = (unsigned __int8 **)strchr(v5, 46)) == 0)
          {
            if (v3 != 33 || v2[3] == (unsigned __int8 *)&dword_8) {
              goto LABEL_3;
            }
          }
        }
        break;
      case '(':
      case ')':
      case ',':
      case '=':
        if (((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0) && !dword_9D9F0)
        {
          uint64_t v4 = *((void *)result[5] + 1) + *(void *)result[5];
          if (*(unsigned char *)(v4 - 1))
          {
            BOOL result = (unsigned __int8 **)memchr(",;:/?+=(*)", *(unsigned __int8 *)(v4 - 1), 0xBuLL);
            if (result) {
              goto LABEL_3;
            }
          }
        }
        break;
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
LABEL_3:
        if (qword_9D9F8 >= 2) {
          ++qword_9D9F8;
        }
        a2 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
        goto LABEL_8;
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'h':
      case 'i':
      case 'j':
        if (qword_9D9F8 >= 2) {
          ++qword_9D9F8;
        }
LABEL_8:
        BOOL result = (unsigned __int8 **)map_char(a2);
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t add_num(uint64_t result)
{
  int v1 = result;
  LOBYTE(result) = *(unsigned char *)qword_9DA38;
  for (uint64_t i = qword_9DA00 + 1; ; ++i)
  {
    if (result != 30 && result != 173)
    {
      if (v1)
      {
        LOBYTE(result) = upper_digit(result);
      }
      else
      {
        if ((result - 58) >= 0xF6u) {
          int v3 = &asc_2A2CA[result - 48];
        }
        else {
          int v3 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * result);
        }
        LOBYTE(result) = *v3;
      }
    }
    *(unsigned char *)(i - 1) = result;
    uint64_t v4 = qword_9DA38;
    BOOL result = *(unsigned __int8 *)++qword_9DA38;
    if (*(unsigned char *)qword_9DA38)
    {
      BOOL v5 = (result - 58) >= 0xF6u || result == 30;
      if (v5 || result == 173) {
        continue;
      }
    }
    break;
  }
  qword_9DA00 = i;
  qword_9DA38 = v4 + 2;
  return result;
}

uint64_t add_time(int a1)
{
  if (nLangIDGlb != 9)
  {
    uint64_t result = add_num(0);
    if (!a1) {
      return result;
    }
    goto LABEL_5;
  }
  uint64_t result = add_num(1);
  uint64_t v3 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = 44;
  qword_9DA00 = v3 + 1;
  if (a1)
  {
LABEL_5:
    uint64_t result = upper_digit(0x30u);
    uint64_t v4 = qword_9DA00;
    *(unsigned char *)qword_9DA00 = result;
    qword_9DA00 = v4 + 1;
  }
  return result;
}

uint64_t is_newline(unsigned __int8 *a1)
{
  uint64_t v1 = (uint64_t)&a1[-qword_9DA40];
  if ((uint64_t)&a1[-qword_9DA40] >= 1)
  {
    unsigned __int8 v4 = *a1;
    uint64_t v2 = a1 - 1;
    unsigned __int8 v3 = v4;
    while (v3 >= 0x20u)
    {
      unsigned __int8 v3 = *v2;
      unsigned int v5 = *v2;
      if (v5 > 0x20 && v5 != 45 && v5 != 124 && v5 != 160) {
        return 0;
      }
      --v2;
      if (v1-- <= 1) {
        return 1;
      }
    }
  }
  return 1;
}

BOOL is_date(unsigned __int8 *a1)
{
  int v1 = *a1;
  if ((v1 - 58) < 0xFFFFFFF6) {
    return 0;
  }
  int v2 = 0;
  do
  {
    int v3 = v1 - 48;
    for (uint64_t i = a1 + 2; ; ++i)
    {
      int v1 = *(i - 1);
      if (v1 != 173 && v1 != 30) {
        break;
      }
    }
    int v2 = v3 + 10 * v2;
    a1 = i - 1;
  }
  while ((v1 - 58) >= 0xFFFFFFF6);
  if ((v2 - 32) < 0xFFFFFFE1) {
    return 0;
  }
  int v6 = *i;
  if ((v6 - 58) < 0xFFFFFFF6) {
    return 0;
  }
  int v8 = 0;
  do
  {
    int v9 = v6 - 48;
    do
    {
      int v10 = *++i;
      int v6 = v10;
    }
    while (v10 == 173 || v6 == 30);
    int v8 = v9 + 10 * v8;
  }
  while ((v6 - 58) >= 0xFFFFFFF6);
  return (v8 - 1) < 0xC;
}

uint64_t is_lower_num(unsigned __int8 *a1)
{
  int v1 = a1;
  uint64_t v2 = -(uint64_t)a1;
  int v3 = a1;
  for (i = a1; ; int v3 = i)
  {
    int v6 = *++i;
    int v5 = v6;
    if (v6 != 30 && v5 != 173)
    {
      if (!v5) {
        return 0;
      }
      if ((v5 - 58) < 0xFFFFFFF6) {
        break;
      }
    }
    --v2;
  }
  if (v5 == 46
    && (nLangIDGlb == 10
     || v3[2] && memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v3[2], 0xDuLL))
    || !memchr(".:/h", v5, 5uLL))
  {
    return 0;
  }
  for (uint64_t j = 2; ; ++j)
  {
    int v8 = v3[j];
    BOOL v9 = v8 == 173 || v8 == 30;
    if (!v9 && (v5 == 47 || v8 != v5))
    {
      if (!v3[j]) {
        goto LABEL_24;
      }
      if ((v8 - 58) <= 0xFFFFFFF5) {
        break;
      }
    }
  }
  if ((v8 | 2) == 0x2F) {
    return 0;
  }
LABEL_24:
  uint64_t v10 = qword_9DA40;
  if (qword_9DA40 < (unint64_t)v1)
  {
    int v11 = *(v1 - 1);
    if (v11 != v5)
    {
      uint64_t v12 = 0;
      BOOL v13 = v5 != 47 && v11 == 45;
      BOOL v14 = !v13;
      if (v11 == 47 || !v14) {
        return v12;
      }
    }
  }
  if (v5 == 46)
  {
    unsigned int v15 = v3[2];
    if (!v3[2])
    {
      if (is_newline(v1)) {
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    if (v15 - 58 <= 0xFFFFFFF5)
    {
      if ((v15 < 0x21 || v15 == 160) && is_newline(v1)) {
        goto LABEL_45;
      }
      if (memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v15, 0x15uLL))
      {
        unsigned int v16 = v3[3];
        BOOL v17 = 1;
        if (v16 < 0x21 || v16 == 160) {
          goto LABEL_60;
        }
      }
LABEL_46:
      if ((uint64_t)&v1[-v10] < 2 || (unsigned int v18 = *(v1 - 1), v18 >= 0x21) && v18 != 160)
      {
LABEL_53:
        if ((v15 | 0x80) == 0xA0)
        {
          unsigned int v19 = v3[3];
          if (!v3[3] || (BOOL v17 = 1, v19 != 45) && v19 <= 0xDE && v19 - 97 >= 0x1A)
          {
            create_buffer(1, (uint64_t)(v3 + 3), qword_9DA40);
            BOOL v17 = no_exception(1, "\tJAN\x01FEB\x01M[A\xC4\x5DR\x01APR\x01MA[IY\x01JU[NL\x01AUG\x01SEP\x01O[CK]T\x01NOV\x01DE[CZ\x01SE[CK\x01MI\x01ST[DU\x01TAG\x01MO[NR\x01JAH\x01D[IO\x01FR\x01S[AO\x01ABE\x01NAC\x01TEIL\x01AUFL\x01ZEHN\x01HUNDERT\x01TAUSEND\x01MILLI\x01", (unsigned __int8 *)byte_9D9D8) != 0;
          }
          goto LABEL_60;
        }
        goto LABEL_59;
      }
      if ((*(v1 - 2) - 44) >= 0x10u || ((0xC005u >> (*(v1 - 2) - 44)) & 1) == 0)
      {
        create_buffer(0, (uint64_t)(v1 - 2), v10);
        BOOL v17 = 1;
        if (no_exception(1, "\t[MNRS]ED", (unsigned __int8 *)byte_9D9D8)) {
          goto LABEL_60;
        }
        unsigned int v15 = v3[2];
        goto LABEL_53;
      }
LABEL_45:
      BOOL v17 = 1;
      goto LABEL_60;
    }
  }
LABEL_59:
  BOOL v17 = 0;
LABEL_60:
  BOOL v20 = 0;
  int v21 = *i;
  if (i - v1 <= 2 && v21 == 46) {
    BOOL v20 = is_date(v1);
  }
  BOOL v59 = v20;
  int v22 = 0;
  int v23 = 1;
  unsigned int v24 = 1;
  while (1)
  {
    int v25 = v23;
    for (uint64_t k = (uint64_t)&(v1++)[v2]; ; ++k)
    {
      uint64_t v27 = *v1;
      if ((v27 - 30) >= 2 && v27 != 173) {
        break;
      }
      ++v1;
    }
    char v28 = v27 - 46;
    if ((v27 - 46) > 0x3A) {
      break;
    }
    if (((1 << v28) & 0xFFC) != 0)
    {
      if (!v25)
      {
        ++v24;
        int v22 = 1;
      }
      int v23 = v25 + 1;
    }
    else
    {
      if (((1 << v28) & 0x400000000001003) == 0) {
        break;
      }
      if (v25) {
        int v29 = 1;
      }
      else {
        int v29 = v17;
      }
      if (v29 != 1) {
        return 0;
      }
      if (v21 == 47)
      {
        if (v27 == 104) {
          goto LABEL_99;
        }
        int v30 = v1[1];
        if (!v1[1]
          || (v30 - 58) <= 0xFFFFFFF5
          && (v30 != 173 && v30 != 30 || v1[2] - 58 < 0xFFFFFFF6))
        {
          return 0;
        }
        if (v27 != 47) {
          goto LABEL_99;
        }
      }
      int v31 = v1[1];
      if (!v1[1]) {
        goto LABEL_96;
      }
      int v23 = 0;
      if ((v31 - 58) <= 0xFFFFFFF5)
      {
        if (v31 != 173 && v31 != 30) {
          goto LABEL_96;
        }
        int v23 = 0;
        if (v1[2] - 58 < 0xFFFFFFF6) {
          goto LABEL_96;
        }
      }
    }
  }
  if (v25 | v22) {
    int v32 = 1;
  }
  else {
    int v32 = v17;
  }
  if (v32 != 1) {
    return 0;
  }
LABEL_96:
  if (v21 > 57)
  {
    if (v21 == 104 || v21 == 58)
    {
      uint64_t v12 = 0;
      if (v27 != 32 || nLangIDGlb != 10 || v24 > 2) {
        return v12;
      }
      if (qword_9DA38 > (unint64_t)qword_9DA40)
      {
        uint64_t v12 = 0;
        if (v21 == 104 || *(unsigned __int8 *)(qword_9DA38 - 1) == v21) {
          return v12;
        }
        goto LABEL_160;
      }
      if (v21 == 104) {
        return 0;
      }
    }
  }
  else
  {
    if (v21 == 46)
    {
      unint64_t v36 = qword_9DA38;
      if ((uint64_t)&i[-qword_9DA38] <= 2
        && v22
        && v24 == 2
        && (timespec_follows(v1)
         || (unint64_t v36 = qword_9DA38, v38 = qword_9DA40, qword_9DA38 - qword_9DA40 >= 3)
         && *(unsigned char *)(qword_9DA38 - 1) == 32
         && ((uint64_t v39 = *(unsigned __int8 *)(qword_9DA38 - 2), (v39 & 0xFE) == 0x2C) || in(v39, 21))
         && in(*(unsigned __int8 *)(v36 - 3), 21)
         || v36 > v38 && *(unsigned char *)(v36 - 1) == 91 && *v1 == 93))
      {
        if (v25 == 1) {
          int v37 = timespec_follows(v1);
        }
        else {
          int v37 = 0;
        }
        add_time(v37);
      }
      else if (v17 {
             || (int v40 = stru_B8.segname[(void)pLangGlb], v40 == 46)
      }
             || v40 != *v1 && ((uint64_t)&i[-v36] > 3 || v25 != 3))
      {
        uint64_t v12 = 0;
        int v41 = v24 > 1 || v17;
        BOOL v42 = v24 <= 2 && nLangIDGlb == 9;
        if (v42 || !v41) {
          return v12;
        }
        int v22 = 0;
        BOOL v44 = k <= 8 && v25 == 4 && v24 == 3;
        BOOL v45 = v59;
        if (!v44) {
          BOOL v45 = 0;
        }
        BOOL v59 = v45;
        goto LABEL_160;
      }
      return 0;
    }
    if (v21 == 47)
    {
LABEL_99:
      if (v24)
      {
        if (nLangIDGlb != 10) {
          int v22 = 0;
        }
        goto LABEL_160;
      }
      if (*(unsigned char *)qword_9DA38 != 48
        && v3[2] != 48
        && (v27 < 0x21 || in(v27, 25) || v1[1] - 58 <= 0xFFFFFFF5))
      {
        if (qword_9DA48)
        {
          uint64_t v33 = qword_9DA30;
          if (*(void *)(qword_9DA30 + 24) == 2 && *(void *)(qword_9DA30 + 8) == 1)
          {
            uint64_t v34 = *(void *)(qword_9DA30 + 40);
            if (v34)
            {
              if (*(void *)(v34 + 24) == 64)
              {
                v35 = *(char **)v34;
                if (!strchr(*(char **)v34, 44) && !strchr(v35, 46))
                {
                  if (byte_9DA50 == 1) {
                    **(unsigned char **)uint64_t v33 = 31;
                  }
                  else {
                    *(void *)(v33 + 24) = 0;
                  }
                }
              }
            }
          }
        }
        goto LABEL_160;
      }
      return 0;
    }
  }
LABEL_160:
  uint64_t v46 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = 35;
  qword_9DA00 = v46 + 1;
  if (nLangIDGlb == 10) {
    int v47 = v22 == 0;
  }
  else {
    int v47 = v22;
  }
  BOOL v49 = nLangIDGlb == 9 || v47 != 0;
  add_num(v49);
  if (v24 > 1)
  {
    while (1)
    {
      if (nLangIDGlb == 9)
      {
        if (*i != 46 && (v24 & 1) == 0)
        {
          BOOL v51 = v47 != 0;
LABEL_181:
          uint64_t v53 = !v51;
          int v47 = !v51;
          goto LABEL_182;
        }
      }
      else
      {
        BOOL v51 = v47 != 0;
        if (!v59 || !v47 || nLangIDGlb != 7) {
          goto LABEL_181;
        }
      }
      uint64_t v52 = qword_9DA00;
      *(unsigned char *)qword_9DA00 = 35;
      qword_9DA00 = v52 + 1;
      uint64_t v53 = 1;
LABEL_182:
      add_num(v53);
      int v54 = *(unsigned __int8 *)qword_9DA38;
      if (*(unsigned char *)qword_9DA38)
      {
        if ((v54 - 58) > 0xFFFFFFF5 || (v54 != 173 ? (BOOL v55 = v54 == 30) : (BOOL v55 = 1), v55))
        {
          int v56 = *i;
          if (*(unsigned __int8 *)(qword_9DA38 - 1) == v56)
          {
            if ((v56 != 47) | v24 & 1) {
              continue;
            }
          }
        }
      }
      uint64_t v57 = qword_9DA38 - 1;
      goto LABEL_193;
    }
  }
  uint64_t v57 = qword_9DA38;
LABEL_193:
  qword_9DA38 = v57 - 1;
  return 1;
}

unsigned __int8 *matching_brace_pos(unsigned __int8 *result)
{
  uint64_t v1 = 0;
  unsigned int v2 = 0;
  int v3 = *result;
  int v4 = v3;
  int v5 = v3;
  int v6 = v3;
  int v7 = v3;
  int v8 = v3;
  int v9 = v3;
  int v10 = v3;
  int v11 = v3;
  int v12 = v3;
  while (1)
  {
    if (v12 <= 90)
    {
      if (v6 == 60) {
        uint64_t v18 = v1 + 1;
      }
      else {
        uint64_t v18 = v1;
      }
      uint64_t v19 = v1 - (v7 == 60);
      if (v12 == 62) {
        int v20 = v7;
      }
      else {
        int v20 = v8;
      }
      if (v12 == 62) {
        int v21 = v7;
      }
      else {
        int v21 = v9;
      }
      if (v12 == 62) {
        int v22 = v7;
      }
      else {
        int v22 = v10;
      }
      if (v12 == 62) {
        int v23 = v7;
      }
      else {
        int v23 = v11;
      }
      if (v12 != 62) {
        uint64_t v19 = v1;
      }
      if (v12 == 60) {
        int v24 = v6;
      }
      else {
        int v24 = v7;
      }
      if (v12 == 60)
      {
        int v20 = v6;
        int v21 = v6;
        int v22 = v6;
        int v23 = v6;
      }
      else
      {
        uint64_t v18 = v19;
      }
      if (v4 == 40) {
        uint64_t v25 = v1 + 1;
      }
      else {
        uint64_t v25 = v1;
      }
      if (v12 == 41) {
        int v26 = v5;
      }
      else {
        int v26 = v6;
      }
      if (v12 == 41)
      {
        int v7 = v5;
        int v8 = v5;
        int v9 = v5;
        int v10 = v5;
        int v11 = v5;
        v1 -= v5 == 40;
      }
      if (v12 == 40) {
        int v27 = v4;
      }
      else {
        int v27 = v5;
      }
      if (v12 == 40)
      {
        int v26 = v4;
        int v7 = v4;
        int v8 = v4;
        int v9 = v4;
        int v10 = v4;
        int v11 = v4;
        uint64_t v1 = v25;
      }
      if (v12 > 59)
      {
        int v7 = v24;
        int v8 = v20;
        int v9 = v21;
        int v10 = v22;
        int v11 = v23;
        uint64_t v1 = v18;
      }
      else
      {
        int v5 = v27;
        int v6 = v26;
      }
    }
    else if (v12 <= 92)
    {
      if (v12 == 91)
      {
        if (v10 == 91) {
          ++v1;
        }
        int v11 = v10;
      }
      else if (v3 == 123)
      {
        int v29 = result[1];
        if (v29 == 125 || v29 == 123)
        {
          int v4 = 123;
          int v5 = 123;
          int v6 = 123;
          int v7 = 123;
          int v8 = 123;
          int v9 = 123;
          int v10 = 123;
          int v11 = 123;
          ++result;
        }
        else
        {
          int v4 = 123;
          int v5 = 123;
          int v6 = 123;
          int v7 = 123;
          int v8 = 123;
          int v9 = 123;
          int v10 = 123;
          int v11 = 123;
        }
      }
      else
      {
        int v4 = v3;
        int v5 = v3;
        int v6 = v3;
        int v7 = v3;
        int v8 = v3;
        int v9 = v3;
        int v10 = v3;
        int v11 = v3;
      }
    }
    else
    {
      uint64_t v13 = v1 - (v11 == 91);
      if (v8 == 123) {
        uint64_t v14 = v1 + 1;
      }
      else {
        uint64_t v14 = v1;
      }
      if (v12 == 125) {
        int v15 = v9;
      }
      else {
        int v15 = v10;
      }
      if (v12 == 125) {
        int v16 = v9;
      }
      else {
        int v16 = v11;
      }
      if (v12 == 125) {
        v1 -= v9 == 123;
      }
      int v17 = v12 == 123 ? v8 : v9;
      if (v12 == 123)
      {
        int v15 = v8;
        int v16 = v8;
        uint64_t v1 = v14;
      }
      if (v12 == 93)
      {
        uint64_t v1 = v13;
      }
      else
      {
        int v9 = v17;
        int v10 = v15;
        int v11 = v16;
      }
    }
    if (v2 >= 2 && !v1) {
      break;
    }
    ++v2;
    int v28 = *++result;
    int v12 = v28;
    if (!v28) {
      return 0;
    }
  }
  return result;
}

uint64_t add_basis_char(uint64_t result, int a2)
{
  BOOL v2 = qword_9D9F8 == 1;
  if (qword_9D9F8 >= 1)
  {
    --qword_9D9F8;
    if (v2)
    {
      uint64_t v3 = qword_9DA00;
      *(unsigned char *)qword_9DA00 = 30;
      qword_9DA00 = v3 + 1;
    }
  }
  if ((result & 0x7F) == 0x20)
  {
    if (a2)
    {
      int v4 = (char *)qword_9DA00;
      char v5 = 32;
    }
    else
    {
      if (byte_9DA50 != 1) {
        return result;
      }
      int v4 = (char *)qword_9DA00;
      char v5 = 31;
    }
    *int v4 = v5;
    qword_9DA00 = (uint64_t)(v4 + 1);
  }
  else if (result && ((result & 0xDF) - 91) >= 0xE6u)
  {
    uint64_t v6 = qword_9DA00;
    *(unsigned char *)qword_9DA00 = result | 0x20;
    qword_9DA00 = v6 + 1;
  }
  else
  {
    return map_char(result);
  }
  return result;
}

void *insert_list_element(void *result, const char *a2, uint64_t a3)
{
  if (!bMemoryOverflow)
  {
    char v5 = result;
    uint64_t result = malloc_type_malloc(0x38uLL, 0x1030040B94BF364uLL);
    if (result)
    {
      uint64_t v6 = result;
      *uint64_t result = a2;
      result[2] = 0;
      uint64_t result = (void *)strlen(a2);
      v6[1] = result;
      v6[3] = a3;
      v6[4] = 0;
      v6[5] = v5[5];
      v6[6] = v5;
      uint64_t v7 = v5[5];
      if (v7) {
        *(void *)(v7 + 48) = v6;
      }
      if ((void *)qword_9DA48 == v5) {
        qword_9DA48 = (uint64_t)v6;
      }
      v5[5] = v6;
    }
    else
    {
      bMemoryOverflow = 1;
    }
  }
  return result;
}

void add_list_element()
{
  if (bMemoryOverflow) {
    return;
  }
  uint64_t v0 = qword_9DA48;
  uint64_t v1 = malloc_type_malloc(0x38uLL, 0x1030040B94BF364uLL);
  if (!v0)
  {
    qword_9DA48 = (uint64_t)v1;
    if (v1)
    {
      v1[5] = 0;
      goto LABEL_7;
    }
LABEL_18:
    bMemoryOverflow = 1;
    return;
  }
  uint64_t v2 = qword_9DA30;
  *(void *)(qword_9DA30 + 48) = v1;
  if (!v1) {
    goto LABEL_18;
  }
  v1[5] = v2;
  uint64_t v1 = *(void **)(v2 + 48);
LABEL_7:
  qword_9DA30 = (uint64_t)v1;
  v1[6] = 0;
  v1[2] = 0;
  int v3 = nLangIDGlb;
  BOOL v4 = nSubLangIDGlb == 2 && nLangIDGlb == 7;
  __int16 v5 = lFlags;
  unint64_t v6 = lFlags & 0xFFFFFFFF67FFFFFFLL | 0x80000000;
  if (!v4) {
    unint64_t v6 = lFlags & 0xFFFFFFFF77FFFFFFLL ^ 0x90000000;
  }
  v1[4] = v6;
  if ((byte_9D9EC & 1) != 0 || byte_9DA54)
  {
    if (v3 == 7 && (byte_9D9E8 & 1) == 0)
    {
      uint64_t v7 = v6 | 0x7FFE;
LABEL_29:
      v1[4] = v7;
      return;
    }
LABEL_22:
    uint64_t v7 = v6 | 0xFFFF;
    goto LABEL_29;
  }
  if (byte_9DA58 == 1)
  {
    if (v3 != 7)
    {
      if (v3 != 12) {
        return;
      }
      goto LABEL_22;
    }
    uint64_t v8 = 12664;
LABEL_28:
    uint64_t v7 = v6 | v8;
    goto LABEL_29;
  }
  if (v3 == 7 && v5 != 12664 && (byte_9DA60 & 1) == 0)
  {
    uint64_t v8 = 10752;
    goto LABEL_28;
  }
}

uint64_t set_list_element(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = qword_9DA30;
  if (qword_9DA30)
  {
    *(void *)qword_9DA30 = result;
    *(void *)(v3 + 8) = a2;
    *(void *)(v3 + 24) = a3;
  }
  return result;
}

void open_math_passage()
{
  if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
  {
    if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
      goto LABEL_17;
    }
    if (nLangIDGlb == 7)
    {
      uint64_t v2 = 0;
      uint64_t v3 = qword_9DA00;
      char v4 = 33;
      do
      {
        *(unsigned char *)(v3 + v2) = v4;
        char v4 = asc_246B3[++v2];
      }
      while (v2 != 2);
      goto LABEL_23;
    }
  }
  else if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
  {
    if (nSubLangIDGlb == 3)
    {
      uint64_t v2 = 0;
      uint64_t v3 = qword_9DA00;
      char v6 = 127;
      do
      {
        *(unsigned char *)(v3 + v2) = v6;
        char v6 = a3_5[++v2];
      }
      while (v2 != 3);
      goto LABEL_23;
    }
  }
  else if (nSubLangIDGlb == 3)
  {
LABEL_17:
    uint64_t v2 = 0;
    uint64_t v3 = qword_9DA00;
    char v5 = 35;
    do
    {
      *(unsigned char *)(v3 + v2) = v5;
      char v5 = asc_2A449[++v2];
    }
    while (v2 != 3);
LABEL_23:
    qword_9DA00 = v3 + v2;
  }
  byte_9DA54 = 1;
  byte_9D9E8 = 1;
}

uint64_t close_math_passage(uint64_t result)
{
  BOOL v1 = nLangIDGlb != 9 || nSubLangIDGlb == 2;
  if (v1 || (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
  {
    uint64_t v2 = &byte_29F12;
    if (nLangIDGlb == 7) {
      uint64_t v2 = "'.";
    }
    if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
      char v4 = "#.";
    }
    else {
      char v4 = v2;
    }
    if (result) {
      goto LABEL_16;
    }
  }
  else
  {
    if (nSubLangIDGlb == 3) {
      char v4 = " \x7F5";
    }
    else {
      char v4 = &byte_29F12;
    }
    if (result)
    {
LABEL_16:
      char v7 = *v4;
      char v6 = (unsigned __int8 *)(v4 + 1);
      char v5 = v7;
      do
      {
        uint64_t result = std_char(v5);
        int v8 = *v6++;
        char v5 = v8;
      }
      while (v8);
      goto LABEL_26;
    }
  }
  int v9 = (char *)qword_9DA00;
  char v12 = *v4;
  int v11 = (unsigned __int8 *)(v4 + 1);
  char v10 = v12;
  do
  {
    *v9++ = v10;
    int v13 = *v11++;
    char v10 = v13;
  }
  while (v13);
  qword_9DA00 = (uint64_t)v9;
LABEL_26:
  byte_9D9E8 = 0;
  return result;
}

uint64_t is_decimal_braille(unint64_t a1)
{
  while (a1 > qword_9DA20)
  {
    int v1 = *(unsigned __int8 *)--a1;
    if (v1 == stru_B8.segname[(void)pLangGlb + 1]) {
      return 1;
    }
  }
  return 0;
}

BOOL is_upper_dash()
{
  if (dword_9DA68 != 2) {
    return 0;
  }
  if (*(unsigned __int8 *)qword_9DA20 != 151) {
    return 0;
  }
  int v0 = *(unsigned __int8 *)(qword_9DA20 + 1);
  if (!*(unsigned char *)(qword_9DA20 + 1)) {
    return 0;
  }
  if ((v0 + 64) >= 0x1Fu) {
    return (v0 - 65) < 0x1A;
  }
  return 1;
}

void add_seg(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = &unk_9D000;
  if ((a1 & 0x1C) == 0 && qword_9DA18 == a1) {
    return;
  }
  uint64_t v3 = &unk_9D000;
  char v4 = (unsigned char *)qword_9DA00;
  char v5 = &unk_9D000;
  char v6 = &unk_9D000;
  char v7 = &unk_9D000;
  uint64_t v8 = qword_9DA00 - qword_9DA20;
  if (qword_9DA00 == qword_9DA20)
  {
    int v13 = (unsigned __int8 **)qword_9DA30;
    goto LABEL_363;
  }
  *(unsigned char *)qword_9DA00 = 0;
  qword_9DA00 = (uint64_t)(v4 + 1);
  add_list_element();
  uint64_t v9 = qword_9DA18;
  if (qword_9DA18 == 2048)
  {
    if ((lFlags & 0x4000000) != 0)
    {
LABEL_359:
      uint64_t v10 = v8;
      goto LABEL_360;
    }
    uint64_t v10 = v8;
    if (dword_9DA80) {
      goto LABEL_360;
    }
    uint64_t v9 = 2048;
    uint64_t v14 = (unsigned __int8 *)qword_9DA38;
    int v15 = "'.";
    while (1)
    {
      do
        int v16 = *v14++;
      while (v16 == 173 || v16 == 30);
      if (v16 != *(unsigned __int8 *)v15) {
        break;
      }
      if (++v15 == "") {
        goto LABEL_360;
      }
    }
    unsigned int v21 = *(unsigned __int8 *)qword_9DA38;
    uint64_t v9 = 2048;
    if (v21 >= 0x21 && v21 != 160)
    {
      uint64_t v22 = 0;
      uint64_t v23 = qword_9DA00;
      uint64_t v24 = qword_9DA00 - 1;
      char v25 = 39;
      do
      {
        *(unsigned char *)(v24 + v22) = v25;
        char v25 = asc_29F0C[++v22];
      }
      while (v22 != 2);
      uint64_t v10 = v8 + 2;
      *(unsigned char *)(v23 + 1) = 0;
      qword_9DA00 = v23 + 2;
      uint64_t v9 = 2048;
    }
LABEL_360:
    int v13 = (unsigned __int8 **)qword_9DA30;
    if (!qword_9DA30) {
      goto LABEL_362;
    }
LABEL_361:
    *int v13 = (unsigned __int8 *)qword_9DA20;
    v13[1] = (unsigned __int8 *)v10;
    v13[3] = (unsigned __int8 *)v9;
    goto LABEL_362;
  }
  if (qword_9DA18 == 4096)
  {
    int v13 = (unsigned __int8 **)qword_9DA30;
    qword_9DA78 = qword_9DA30;
    uint64_t v9 = 4096;
    uint64_t v10 = v8;
    if (!qword_9DA30) {
      goto LABEL_362;
    }
    goto LABEL_361;
  }
  uint64_t v10 = v8;
  if (qword_9DA18 != 0x2000) {
    goto LABEL_360;
  }
  if (nLangIDGlb == 9 && nSubLangIDGlb == 2)
  {
    if (byte_9DA60 != 1 || (lFlags & 0x40000) == 0)
    {
      if (v8 != dword_9DA68) {
        goto LABEL_52;
      }
      BOOL v11 = qword_9DA28 == 64 || v1 == 64;
      if (!v11) {
        goto LABEL_52;
      }
      goto LABEL_17;
    }
    uint64_t v26 = qword_9DA30;
    if (qword_9DA30)
    {
      *(void *)qword_9DA30 = *(void *)((char *)&stru_20.maxprot + (void)pLangGlb);
      *(void *)(v26 + 8) = 1;
      *(void *)(v26 + 24) = 2;
    }
    add_list_element();
    goto LABEL_50;
  }
  if (nLangIDGlb == 12 && dword_9DA68 == 1)
  {
    char v18 = *(unsigned char *)qword_9DA70;
    if (*(unsigned char *)qword_9DA70)
    {
      if (((v18 + 33) > 0xE0u || (v18 - 91) >= 0xE6u)
        && *(unsigned char *)(qword_9DA70 - 1) == 32)
      {
        int v19 = *(unsigned __int8 *)(qword_9DA70 - 2);
        if (!in(*(unsigned __int8 *)(qword_9DA70 - 2), 9))
        {
          uint64_t v10 = v8;
          if (!v19) {
            goto LABEL_52;
          }
          int v20 = memchr(",;:", v19, 4uLL);
          uint64_t v10 = v8;
          if (!v20) {
            goto LABEL_52;
          }
LABEL_17:
          uint64_t v12 = qword_9DA30;
          if (!qword_9DA30) {
            goto LABEL_52;
          }
LABEL_51:
          *(void *)(v12 + 32) |= 0xFFFFuLL;
          goto LABEL_52;
        }
LABEL_50:
        uint64_t v12 = qword_9DA30;
        uint64_t v10 = v8;
        if (!qword_9DA30) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
  }
LABEL_52:
  if (nLangIDGlb != 10)
  {
    int v28 = &unk_9D000;
    if ((lFlags & 0x80000) != 0)
    {
      if (nLangIDGlb != 7)
      {
        char v35 = 0;
        goto LABEL_80;
      }
    }
    else if (nLangIDGlb != 7 || (byte_9D9E8 & 1) == 0)
    {
      goto LABEL_92;
    }
    if (*(unsigned __int8 *)qword_9DA20 == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)pLangGlb)) {
      goto LABEL_92;
    }
    char v35 = 1;
LABEL_80:
    char v36 = *(unsigned char *)qword_9DA70;
    if (!*(unsigned char *)qword_9DA70
      || (v36 + 33) <= 0xE0u && (v36 - 91) < 0xE6u
      || (v10 < 2 || dword_9DA68 != 1 || dword_9D9F0)
      && ((lFlags & 0x100000) == 0 || (v35 & byte_9D9E8 & 1) != 0))
    {
      goto LABEL_92;
    }
    goto LABEL_88;
  }
  int v27 = *(unsigned __int8 *)qword_9DA70;
  int v28 = (void *)&unk_9D000;
  if (!*(unsigned char *)qword_9DA70) {
    goto LABEL_92;
  }
  unsigned int v29 = (v27 + 64);
  unsigned int v30 = v27 - 65;
  BOOL v32 = v29 < 0x1F || v30 < 0x1A;
  if (v32 && dword_9DA68 == 1)
  {
    if ((lFlags & 0x80000) == 0) {
      goto LABEL_92;
    }
LABEL_88:
    uint64_t v37 = qword_9DA30;
    if (qword_9DA30)
    {
      *(void *)qword_9DA30 = *(uint64_t *)((char *)&stru_20.filesize + (void)pLangGlb);
      *(void *)(v37 + 8) = 1;
      *(void *)(v37 + 24) = 2;
    }
    goto LABEL_90;
  }
  if (dword_9DA68 <= 1) {
    BOOL v32 = 0;
  }
  if (v32 && (lFlags & 0x100000) == 0)
  {
    uint64_t v34 = qword_9DA30;
    if (qword_9DA30)
    {
      *(void *)qword_9DA30 = *(void *)&stru_68.sectname[(void)pLangGlb];
      *(void *)(v34 + 8) = 2;
      *(void *)(v34 + 24) = 2;
    }
LABEL_90:
    add_list_element();
    uint64_t v10 = v8;
    if (qword_9DA30) {
      *(void *)(qword_9DA30 + 32) = *(void *)(*(void *)(qword_9DA30 + 40) + 32);
    }
  }
LABEL_92:
  uint64_t v204 = v1;
  if (v10 < 2 || !exceptions[0] || dword_9DA68 > 1 || !qword_9DA30 || (~*(_DWORD *)(qword_9DA30 + 32) & 0x7FFELL) == 0)
  {
LABEL_136:
    uint64_t v64 = nLangIDGlb;
    if (nLangIDGlb != 7) {
      goto LABEL_144;
    }
    if ((unint64_t v65 = lFlags, v66 = byte_9D9E8, (lFlags & 0x100000) != 0) && !byte_9D9E8
      || (v67 = v10, v68 = nLangIDGlb, v69 = is_upper_dash(), v64 = v68, uint64_t v10 = v67, v69))
    {
      if (((v65 >> 19) & 1 | v66) != 1) {
        goto LABEL_144;
      }
      uint64_t v70 = v10;
      uint64_t v71 = v64;
      BOOL v72 = is_upper_dash();
      uint64_t v64 = v71;
      uint64_t v10 = v70;
      if (!v72) {
        goto LABEL_144;
      }
    }
    uint64_t v73 = dword_9DA68;
    if (dword_9DA68 <= 1 && v10 != dword_9DA68)
    {
LABEL_144:
      int v13 = (unsigned __int8 **)qword_9DA30;
      uint64_t v2 = (void *)&unk_9D000;
      char v7 = &unk_9D000;
      char v6 = (void *)&unk_9D000;
      if (qword_9DA30)
      {
        uint64_t v74 = *(unsigned int *)((char *)&dword_8 + (void)pLangGlb);
        if ((v74 & 0x80000000) != 0) {
          goto LABEL_232;
        }
        uint64_t v75 = 0;
        v196 = pLangGlb;
        v76 = (unsigned __int8 **)*pLangGlb;
        v77 = (unsigned char *)qword_9DA38;
        uint64_t v194 = qword_9DA28 & 0xD0;
        v198 = (unsigned __int8 *)(qword_9DA38 + 1);
        __sa = (char *)(qword_9DA28 & 0xC0);
        unint64_t v208 = qword_9DA28;
        v78 = (unsigned __int8 *)qword_9DA20;
        v79 = "";
        while (1)
        {
          if (v76[2] == (unsigned __int8 *)v10)
          {
            v80 = *v76;
            int v81 = *(unsigned __int16 *)*v76;
            if (*(unsigned __int16 *)v78 == v81)
            {
              v82 = (unsigned __int16 *)v76[4];
              if ((v13[4] & v82 & 0x9000FFFF) == 0)
              {
                v83 = v78;
                v84 = *v76;
                do
                {
                  do
                    int v85 = *v83++;
                  while (v85 == 173 || v85 == 30);
                  if (v85 != v81) {
                    goto LABEL_150;
                  }
                  int v87 = *++v84;
                  LOBYTE(v81) = v87;
                }
                while (v87);
                if (v64 == 12)
                {
                  uint64_t v88 = *v76[1];
                  if (v88 != 46) {
                    goto LABEL_163;
                  }
                }
                uint64_t v88 = *v76[1];
                if ((uint64_t)v76[3] > 1) {
                  goto LABEL_163;
                }
                if (!*v76[1]) {
                  goto LABEL_174;
                }
                v89 = v77;
                unsigned int v200 = v64;
                uint64_t v90 = v10;
                if (!memchr(".-'", v88, 4uLL))
                {
                  uint64_t v10 = v90;
                  uint64_t v64 = v200;
                  v77 = v89;
                  v79 = "";
LABEL_163:
                  if (v88 == 40)
                  {
                    if (*v77 == 39) {
                      goto LABEL_150;
                    }
                    uint64_t v88 = 40;
                  }
                  else if (v204 == 8 && v88 == 35)
                  {
                    goto LABEL_150;
                  }
LABEL_174:
                  if (((unsigned __int16)v82 & 0x8001) != 1 || *v77 != 46)
                  {
                    if ((v82 & 0x800000) == 0
                      || v208 <= 2
                      && ((v108 = v13[5]) == 0
                       || **(unsigned __int8 **)v108 == *(unsigned __int8 *)v196[10]
                       || (v109 = (unsigned __int8 *)*((void *)v108 + 5)) == 0
                       || *((void *)v109 + 3) != 0x400000)
                      && ((unsigned int v110 = *v77, v110 < 0x21) || v110 == 160))
                    {
                      v93 = "US";
                      while (1)
                      {
                        do
                          int v94 = *v80++;
                        while (v94 == 173 || v94 == 30);
                        if (v94 != *(unsigned __int8 *)v93) {
                          break;
                        }
                        if (++v93 == v79)
                        {
                          if (*(v77 - 3) == 36 || *v77 == 36) {
                            goto LABEL_150;
                          }
                          break;
                        }
                      }
                      if ((v82 & 0x400000) == 0) {
                        goto LABEL_436;
                      }
                      int v111 = *v77;
                      if (!*v77) {
                        goto LABEL_437;
                      }
                      uint64_t v112 = v10;
                      uint64_t v113 = v64;
                      v114 = v77;
                      int v201 = *v77;
                      v115 = memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v201, 0x15uLL);
                      int v111 = v201;
                      v79 = "";
                      v77 = v114;
                      uint64_t v64 = v113;
                      uint64_t v10 = v112;
                      if (!v115)
                      {
LABEL_437:
                        v116 = v13[5];
                        if (!v116) {
                          goto LABEL_438;
                        }
                        if (*((void *)v116 + 3) < 3uLL) {
                          goto LABEL_438;
                        }
                        v117 = *(unsigned char **)v116;
                        if (!*v117) {
                          goto LABEL_438;
                        }
                        uint64_t v118 = v10;
                        uint64_t v119 = v64;
                        v120 = v77;
                        int v202 = v111;
                        v121 = memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB",
                                 *v117,
                                 0x15uLL);
                        int v111 = v202;
                        v79 = "";
                        v77 = v120;
                        uint64_t v64 = v119;
                        uint64_t v10 = v118;
                        if (!v121)
                        {
LABEL_438:
                          if (!v111 || v111 != 9 && v111 != 160 && v111 != 32) {
                            goto LABEL_436;
                          }
                          uint64_t v122 = *v198;
                          if (!*v198) {
                            goto LABEL_439;
                          }
                          uint64_t v203 = v10;
                          uint64_t v123 = v64;
                          v124 = v77;
                          v125 = memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *v198, 0x15uLL);
                          v79 = "";
                          v77 = v124;
                          uint64_t v64 = v123;
                          uint64_t v10 = v203;
                          if (!v125)
                          {
LABEL_439:
                            BOOL v126 = v122;
                            uint64_t v127 = v10;
                            uint64_t v128 = v64;
                            v129 = v77;
                            BOOL v130 = in(v126, 25);
                            v79 = "";
                            v77 = v129;
                            uint64_t v64 = v128;
                            uint64_t v10 = v127;
                            if (!v130)
                            {
                              BOOL v131 = is_url(v198);
                              v79 = "";
                              v77 = v129;
                              uint64_t v64 = v128;
                              uint64_t v10 = v127;
                              if (!v131)
                              {
LABEL_436:
                                if (!__sa) {
                                  goto LABEL_190;
                                }
                                BOOL v96 = v88;
                                uint64_t v97 = v10;
                                uint64_t v98 = v64;
                                v99 = v77;
                                v100 = v79;
                                BOOL v101 = in(v96, 5);
                                v79 = v100;
                                v77 = v99;
                                uint64_t v64 = v98;
                                uint64_t v10 = v97;
                                if (!v101)
                                {
LABEL_190:
                                  if (v64 == 9 && (v82 & 0x40) != 0)
                                  {
                                    int v102 = *v77;
                                    if (v102 == 34)
                                    {
                                      uint64_t v135 = v10;
                                      uint64_t v136 = v64;
                                      v137 = v77;
                                      v138 = v79;
                                      BOOL v139 = in(*v198, 9);
                                      v79 = v138;
                                      v77 = v137;
                                      uint64_t v64 = v136;
                                      uint64_t v10 = v135;
                                      if (v139) {
                                        goto LABEL_150;
                                      }
                                    }
                                    else if (v102 == 39)
                                    {
                                      uint64_t v103 = v10;
                                      uint64_t v104 = v64;
                                      v105 = v77;
                                      v106 = v79;
                                      v107 = memchr("MNmn", (char)*v198, 5uLL);
                                      v79 = v106;
                                      v77 = v105;
                                      uint64_t v64 = v104;
                                      uint64_t v10 = v103;
                                      if (v107) {
                                        goto LABEL_150;
                                      }
                                    }
                                    if (v208 == 32 && **(unsigned char **)v13[5] == 46) {
                                      goto LABEL_150;
                                    }
                                  }
                                  if (qword_9D9F8 < 1)
                                  {
                                    v140 = &unk_9D000;
                                  }
                                  else
                                  {
                                    v140 = (void *)&unk_9D000;
                                    if (qword_9D9F8 <= v10)
                                    {
                                      qword_9D9F8 = 0;
                                      *int v13 = "\x1E";
                                      v13[1] = (unsigned char *)(&dword_0 + 1);
                                      v13[3] = (unsigned char *)(&dword_0 + 1);
                                      uint64_t v141 = v10;
                                      add_list_element();
                                      uint64_t v10 = v141;
                                      __sa = (char *)(qword_9DA28 & 0xC0);
                                    }
                                  }
                                  if (__sa && *v76[1] - 107 >= 0xFFFFFFF6 && (uint64_t)v76[2] >= 2)
                                  {
                                    uint64_t v178 = v10;
                                    v179 = (void *)v140[326];
                                    if (v179)
                                    {
                                      void *v179 = "-";
                                      v179[1] = 1;
                                      v179[3] = 4;
                                    }
                                    add_list_element();
                                    uint64_t v10 = v178;
                                  }
                                  v180 = v76[3];
                                  int v13 = (unsigned __int8 **)v140[326];
                                  if (v13)
                                  {
                                    *int v13 = v76[1];
                                    v13[1] = v180;
                                    v13[3] = (unsigned char *)&stru_20;
                                  }
                                  v181 = (unsigned __int16 *)v76[4];
                                  if ((v181 & 0x400000) == 0)
                                  {
                                    if ((v181 & 0x200000) != 0)
                                    {
                                      v182 = v13[5];
                                      if (!v182 || (int v183 = **(unsigned __int8 **)v182, v183 != 45) && v183 != 151)
                                      {
                                        v184 = (unsigned __int8 *)qword_9DA38;
                                        if (*(unsigned char *)qword_9DA38 != 45)
                                        {
                                          v185 = " - ";
                                          while (1)
                                          {
                                            do
                                              int v186 = *v184++;
                                            while (v186 == 173 || v186 == 30);
                                            if (v186 != *(unsigned __int8 *)v185) {
                                              break;
                                            }
                                            if (++v185 == "") {
                                              goto LABEL_426;
                                            }
                                          }
                                          v13[3] = (unsigned __int8 *)0x200000;
                                          if (v182)
                                          {
                                            if (*((void *)v182 + 3) == 2)
                                            {
                                              v190 = (unsigned __int8 *)*((void *)v182 + 5);
                                              if (v190)
                                              {
                                                if (*((void *)v190 + 3) == 0x200000) {
                                                  *((void *)v182 + 3) = 0;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                    goto LABEL_426;
                                  }
                                  uint64_t v188 = v10;
                                  v13[3] = (unsigned __int8 *)0x400000;
                                  int v189 = *(unsigned __int8 *)qword_9DA38;
                                  if ((v189 == 9 || v189 == 160 || v189 == 32)
                                    && in(*(unsigned __int8 *)(qword_9DA38 + 1), 11))
                                  {
                                    uint64_t v1 = 0;
                                  }
                                  else
                                  {
                                    if (v180 == (unsigned char *)&dword_0 + 1)
                                    {
                                      uint64_t v3 = (void *)&unk_9D000;
                                      uint64_t v1 = v204;
                                      uint64_t v2 = (void *)&unk_9D000;
                                      char v7 = (void *)&unk_9D000;
                                      uint64_t v10 = v188;
                                      goto LABEL_232;
                                    }
LABEL_426:
                                    uint64_t v1 = v204;
                                  }
                                  uint64_t v2 = (void *)&unk_9D000;
                                  char v7 = (void *)&unk_9D000;
                                  char v6 = (void *)&unk_9D000;
                                  if (nLangIDGlb == 7
                                    && ((_BYTE)v13[4] & 0x40) != 0
                                    && **v13 == **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb))
                                  {
                                    ++*v13;
                                  }
                                  if (v76[2] == (unsigned char *)&dword_0 + 1) {
                                    v13[4] = (unsigned __int8 *)((unint64_t)v13[4] | 0x8000000);
                                  }
                                  char v4 = (unsigned char *)qword_9DA20;
                                  uint64_t v3 = &unk_9D000;
                                  qword_9DA00 = qword_9DA20;
                                  goto LABEL_363;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  goto LABEL_150;
                }
                if (*v89)
                {
                  unsigned int __ca = *v89;
                  v91 = memchr(".-'", __ca, 4uLL);
                  uint64_t v10 = v90;
                  uint64_t v64 = v200;
                  v77 = v89;
                  v79 = "";
                  if (v91) {
                    goto LABEL_150;
                  }
                  BOOL v92 = in(__ca, 25);
                  v79 = "";
                  v77 = v89;
                  uint64_t v64 = v200;
                  uint64_t v10 = v90;
                  if ((__ca - 58) > 0xF5u) {
                    goto LABEL_150;
                  }
                }
                else
                {
                  BOOL v92 = in(0, 25);
                  uint64_t v10 = v90;
                  uint64_t v64 = v200;
                  v77 = v89;
                  v79 = "";
                }
                if (!v92)
                {
                  v132 = v13[5];
                  if (!v132
                    || (v133 = *(unsigned char **)v132, !*v133)
                    || (v134 = memchr(".-'", *v133, 4uLL),
                        v79 = "",
                        v77 = v89,
                        uint64_t v64 = v200,
                        uint64_t v10 = v90,
                        !v134))
                  {
                    if (!v194) {
                      goto LABEL_163;
                    }
                  }
                }
              }
            }
          }
LABEL_150:
          v76 += 5;
          BOOL v11 = v75++ == v74;
          if (v11)
          {
            uint64_t v3 = (void *)&unk_9D000;
            uint64_t v1 = v204;
            uint64_t v2 = (void *)&unk_9D000;
            char v7 = (void *)&unk_9D000;
LABEL_232:
            char v5 = &unk_9D000;
            if (v10 >= 2)
            {
              char v142 = *(unsigned char *)qword_9DA20;
              if (*(unsigned char *)qword_9DA20)
              {
                uint64_t v9 = 1163264;
                char v6 = (void *)&unk_9D000;
                if ((v142 + 64) >= 0x1Fu)
                {
                  BOOL v143 = (v142 - 91) >= 0xE6u;
                  uint64_t v144 = 114688;
LABEL_266:
                  if (!v143) {
                    uint64_t v9 = v144;
                  }
                }
                goto LABEL_360;
              }
              uint64_t v9 = 114688;
LABEL_293:
              char v6 = (void *)&unk_9D000;
              goto LABEL_360;
            }
            v13[4] = (unsigned __int8 *)((unint64_t)v13[4] | 0x8000000);
            int v145 = *(unsigned __int8 *)qword_9DA20;
            if ((v145 - 91) >= 0xFFFFFFE6)
            {
              LOBYTE(v145) = v145 | 0x20;
              *(unsigned char *)qword_9DA20 = v145;
            }
            if (nLangIDGlb == 12)
            {
              uint64_t v8 = v10;
              uint64_t v153 = qword_9DA38;
              unsigned __int8 v154 = *(unsigned char *)qword_9DA38;
              if (!memchr(".!?", *(char *)qword_9DA38, 4uLL)
                || *(unsigned __int8 *)(v153 + 1) > 0x20u
                || *(unsigned __int8 *)(v153 - 2) >= 0x21u)
              {
                uint64_t v164 = *(unsigned __int8 *)(v153 - 2);
                if (*(unsigned char *)(v153 - 2))
                {
                  if (memchr("({[<\x91", *(unsigned __int8 *)(v153 - 2), 6uLL)
                    || memchr(")}]>\x9B", v164, 6uLL)
                    || in(v164, 25) && (v164 != 45 || v154 == 45)
                    || memchr(".'\"\x82\x91\x92", v164, 7uLL))
                  {
                    goto LABEL_355;
                  }
                }
                else if (in(0, 25))
                {
                  goto LABEL_355;
                }
                if (v154)
                {
                  if (memchr("({[<\x91", v154, 6uLL)
                    || memchr(")}]>\x9B", v154, 6uLL)
                    || in(v154, 25) && (v154 != 45 || v164 == 45)
                    || memchr(".'\"\x82\x91\x92", v154, 7uLL))
                  {
                    goto LABEL_355;
                  }
                }
                else if (in(0, 25))
                {
                  goto LABEL_355;
                }
                if (((_BYTE)v13[4] & 0x40) != 0) {
                  goto LABEL_355;
                }
              }
              uint64_t v9 = 4;
              uint64_t v3 = (void *)&unk_9D000;
            }
            else
            {
              if (nLangIDGlb == 9)
              {
                uint64_t v8 = v10;
                v155 = (unsigned __int8 *)qword_9DA38;
                uint64_t v156 = *(unsigned __int8 *)(qword_9DA38 - 2);
                if (*(unsigned char *)(qword_9DA38 - 2))
                {
                  v157 = memchr("({[<\x91", *(unsigned __int8 *)(qword_9DA38 - 2), 6uLL);
                  int v158 = nSubLangIDGlb;
                  BOOL v159 = nSubLangIDGlb != 2;
                  if (v157) {
                    BOOL v160 = nSubLangIDGlb == 2;
                  }
                  else {
                    BOOL v160 = 1;
                  }
                  if (!v160)
                  {
                    int v161 = *v155;
                    if (v161 != 9 && v161 != 160 && v161 != 32) {
                      goto LABEL_355;
                    }
                  }
                  if (memchr(")}]>\x9B", v156, 6uLL))
                  {
                    if (v158 != 2)
                    {
                      int v162 = *v155;
                      if (v162 != 9 && v162 != 160 && v162 != 32) {
                        goto LABEL_355;
                      }
                    }
                  }
                  BOOL v163 = in(v156, 25);
                  if (v156 != 45 && v163) {
                    goto LABEL_355;
                  }
                  if (memchr("_#$%&\x80\x83\x86\x87\x89\x99\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAC\xAE\xAF\xB0\xB1\xB2\xB3\xB5\xB6\xB9\xBA\xBC\xBD\xBE\xC5.:/h", v156, 0x24uLL)|| memchr(".'\"\x82\x91\x92", v156, 7uLL))
                  {
                    goto LABEL_355;
                  }
                }
                else
                {
                  BOOL v159 = nSubLangIDGlb != 2;
                  if (in(0, 25)) {
                    goto LABEL_355;
                  }
                }
                uint64_t v169 = *v155;
                if (*v155)
                {
                  if (memchr("({[<\x91", *v155, 6uLL))
                    BOOL v170 = v159;
                  else {
                    BOOL v170 = 0;
                  }
                  if (v170 && (!v156 || v156 != 9 && v156 != 160 && v156 != 32)) {
                    goto LABEL_355;
                  }
                  BOOL v171 = memchr(")}]>\x9B", v169, 6uLL) && v159;
                  if (v171 && (!v156 || v156 != 9 && v156 != 160 && v156 != 32)) {
                    goto LABEL_355;
                  }
                  BOOL v172 = in(v169, 25);
                  if (v169 != 45 && v172) {
                    goto LABEL_355;
                  }
                  if (memchr("_#$%&\x80\x83\x86\x87\x89\x99\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAC\xAE\xAF\xB0\xB1\xB2\xB3\xB5\xB6\xB9\xBA\xBC\xBD\xBE\xC5.:/h", v169, 0x24uLL))
                  {
                    goto LABEL_355;
                  }
                  if (v169 == 34) {
                    goto LABEL_355;
                  }
                  if (v169 == 46)
                  {
                    unsigned int v173 = v155[1];
                    if (v173 >= 0x21 && v173 != 45) {
                      goto LABEL_355;
                    }
                  }
                }
                else if (in(0, 25))
                {
                  goto LABEL_355;
                }
                if (((_BYTE)v13[4] & 0x40) != 0) {
                  goto LABEL_355;
                }
                uint64_t v9 = 4;
              }
              else
              {
                if (nLangIDGlb != 7)
                {
                  uint64_t v9 = 4;
                  uint64_t v3 = (void *)&unk_9D000;
                  goto LABEL_293;
                }
                uint64_t v8 = v10;
                if (*(unsigned char *)qword_9DA38 != 39 && ((_BYTE)v13[4] & 0x40) == 0)
                {
                  uint64_t v9 = 4;
                  uint64_t v3 = (void *)&unk_9D000;
                  char v6 = (void *)&unk_9D000;
                  goto LABEL_359;
                }
LABEL_355:
                uint64_t v9 = 32;
                if ((v145 & 0x80u) != 0) {
                  uint64_t v9 = 4;
                }
              }
              uint64_t v3 = &unk_9D000;
              uint64_t v2 = &unk_9D000;
              char v7 = &unk_9D000;
            }
            char v6 = &unk_9D000;
            char v5 = &unk_9D000;
            goto LABEL_359;
          }
        }
      }
      char v5 = (void *)&unk_9D000;
LABEL_362:
      char v4 = (unsigned char *)v3[320];
      v5[324] = v4;
      goto LABEL_363;
    }
    char v5 = &unk_9D000;
    v146 = (unsigned char *)qword_9DA20;
    uint64_t v2 = (void *)&unk_9D000;
    char v7 = (void *)&unk_9D000;
    char v6 = (void *)&unk_9D000;
    if (v10 >= 1)
    {
      uint64_t v147 = 0;
      uint64_t v148 = v10 - 1;
      while (1)
      {
        --v147;
        int v149 = *(unsigned __int8 *)(qword_9DA38 + v147);
        if (v149 != 173 && v149 != 30)
        {
          v146[v148] = v149;
          BOOL v152 = v148-- <= 0;
          if (v152) {
            break;
          }
        }
      }
    }
    unsigned int v151 = *v146;
    if (v151 == 45)
    {
      unsigned int v151 = 151;
      unsigned char *v146 = -105;
    }
    BOOL v152 = v146[v10 - 1] != 45 || v10 < 3;
    if (!v152)
    {
      dword_9DA68 = v73 + 1;
      uint64_t v73 = (int)v73 + 1;
    }
    if (v10 == v73)
    {
      if (v151)
      {
        BOOL v143 = v151 - 123 >= 0xFFFFFFE6 || v151 >= 0xDF;
        uint64_t v9 = 512;
        uint64_t v144 = 1024;
        goto LABEL_266;
      }
      uint64_t v9 = 1024;
    }
    else
    {
      uint64_t v9 = 512;
    }
    goto LABEL_360;
  }
  uint64_t v38 = 0;
  uint64_t v39 = (char *)v28[324];
  uint64_t v40 = qword_9D9F8;
  uint64_t v207 = qword_9DA00;
  int v41 = 1;
  BOOL v42 = v39;
  uint64_t v43 = v10;
  *(void *)__c = v39;
  while (1)
  {
    BOOL v44 = &exceptions[160 * v38];
    uint64_t v45 = *((void *)v44 + 19);
    if ((v45 & 0x1C000) != 0)
    {
      uint64_t v46 = *(void *)&exceptions[160 * v38 + 136];
    }
    else
    {
      if (v42 != v39) {
        goto LABEL_132;
      }
      uint64_t v46 = v10;
      if (*(void *)&exceptions[160 * v38 + 136] != v10) {
        goto LABEL_132;
      }
    }
    if (v46 > v43) {
      goto LABEL_132;
    }
    uint64_t v47 = 0;
    v48 = &exceptions[160 * v38 + 136];
    int v49 = *v44;
    do
    {
      if (v42[v47] != v49) {
        goto LABEL_132;
      }
      int v49 = exceptions[160 * v38 + 1 + v47++];
    }
    while (v49);
    if (v46 == v10) {
      break;
    }
    if ((v45 & 0x4000) != 0 && v42 == v39)
    {
LABEL_117:
      v50 = (char *)(v42 - v39);
      if (v40 <= v42 - v39)
      {
        uint64_t v197 = v40;
      }
      else
      {
        if (v40 <= (uint64_t)&v50[v46]) {
          uint64_t v51 = (uint64_t)(v50 + 1);
        }
        else {
          uint64_t v51 = v40 - v46 + *(void *)&exceptions[160 * v38 + 144];
        }
        uint64_t v197 = v51;
        qword_9D9F8 = v51;
      }
      __s = &v42[v47];
      uint64_t v52 = &exceptions[160 * v38];
      int64_t v55 = *((void *)v52 + 18);
      uint64_t v53 = (size_t *)(v52 + 144);
      int64_t v54 = v55;
      uint64_t v193 = v207;
      uint64_t v195 = v10;
      size_t v56 = v55;
      uint64_t v199 = v10;
      int64_t v57 = v55 - v46;
      if (v55 > v46)
      {
        uint64_t v195 = v57 + v10;
        uint64_t v193 = v207 + v57;
        qword_9DA00 = v207 + v57;
        size_t v58 = strlen(__s);
        v48 = &exceptions[160 * v38 + 136];
        memmove(&v42[v54], __s, v58 + 1);
        size_t v56 = *v53;
      }
      memcpy(v42, &exceptions[160 * v38 + 65], v56);
      v43 -= *(void *)v48;
      v42 += *v53;
      if (__s <= v42)
      {
        int v41 = 0;
        uint64_t v10 = v195;
        uint64_t v207 = v193;
        uint64_t v3 = (void *)&unk_9D000;
      }
      else
      {
        if (v46 <= v54) {
          uint64_t v59 = v54;
        }
        else {
          uint64_t v59 = v46;
        }
        size_t v60 = *v53 + v59 - v46;
        uint64_t v61 = v60 + v199 - v47;
        uint64_t v3 = &unk_9D000;
        uint64_t v207 = v207 + v60 - v47;
        qword_9DA00 = v207;
        size_t v62 = strlen(__s);
        memmove(v42, __s, v62 + 1);
        uint64_t v10 = v61;
        int v41 = 0;
      }
      uint64_t v39 = *(char **)__c;
      uint64_t v40 = v197;
      goto LABEL_132;
    }
    if (v42[v47])
    {
      if ((v45 & 0x8000) != 0 && v42 > v39) {
        goto LABEL_117;
      }
    }
    else if ((v45 & 0x10000) != 0)
    {
      goto LABEL_117;
    }
LABEL_132:
    if (++v38 == 100)
    {
      uint64_t v38 = 0;
      BOOL v11 = v41 == 0;
      uint64_t v63 = v41 != 0;
      if (!v11) {
        ++v42;
      }
      v43 -= v63;
      int v41 = 1;
      if (v43 <= 1) {
        goto LABEL_136;
      }
    }
  }
  if ((v45 & 0x2000) == 0) {
    goto LABEL_132;
  }
  char v6 = &unk_9D000;
  int v13 = (unsigned __int8 **)qword_9DA30;
  if (qword_9D9F8 >= 1 && qword_9D9F8 <= v10)
  {
    qword_9D9F8 = 0;
    uint64_t v2 = (void *)&unk_9D000;
    v166 = &unk_9D000;
    if (qword_9DA30)
    {
      *(void *)qword_9DA30 = "\x1E";
      v13[1] = (unsigned char *)(&dword_0 + 1);
      v13[3] = (unsigned char *)(&dword_0 + 1);
    }
    add_list_element();
    int v13 = (unsigned __int8 **)qword_9DA30;
  }
  else
  {
    uint64_t v2 = (void *)&unk_9D000;
    v166 = (void *)&unk_9D000;
  }
  if (v13)
  {
    v167 = &exceptions[160 * v38];
    v168 = (unsigned __int8 *)*((void *)v167 + 18);
    *int v13 = (unsigned __int8 *)(v167 + 65);
    v13[1] = v168;
    v13[3] = (unsigned char *)&stru_20;
  }
  char v4 = (unsigned char *)v166[324];
  v3[320] = v4;
  char v7 = (void *)&unk_9D000;
LABEL_363:
  uint64_t v174 = v6[319];
  if (v174 >= 1 && v13 != 0)
  {
    v13[2] = (unsigned __int8 *)v174;
    v6[319] = 0;
  }
  v7[325] = v2[323];
  v2[323] = v1;
  if (v1 > 255)
  {
    if (v1 == 256)
    {
      if (nLangIDGlb == 7)
      {
        *char v4 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
        v3[320] = v4 + 1;
      }
      return;
    }
    if (v1 != 0x2000) {
      return;
    }
LABEL_374:
    if (is_url((unsigned __int8 *)qword_9DA38))
    {
      if ((lFlags & 0x200000) == 0)
      {
        uint64_t v176 = 0;
        v2[323] = 2048;
        char v177 = 39;
        do
        {
          v4[v176] = v177;
          char v177 = asc_29F0F[++v176];
        }
        while (v176 != 2);
        v3[320] = v4 + 2;
LABEL_389:
        dword_9DA68 = 0;
        byte_9DA60 = 0;
        qword_9DA70 = qword_9DA38;
        return;
      }
      if (nLangIDGlb == 12) {
        byte_9D9EC = 1;
      }
    }
    if (v1 == 64) {
      goto LABEL_384;
    }
    goto LABEL_389;
  }
  if (v1 == 64) {
    goto LABEL_374;
  }
  if (v1 != 128) {
    return;
  }
LABEL_384:
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
    byte_9D9EC = 1;
  }
}

void add_whitespace()
{
  for (uint64_t i = qword_9DA00 + 1; ; ++i)
  {
    uint64_t v1 = (unsigned char *)(qword_9DA38 + 1);
    int v2 = *(unsigned __int8 *)(qword_9DA38 + 1);
    if (v2 != 9 && v2 != 160 && v2 != 32) {
      break;
    }
    ++qword_9DA38;
    *(unsigned char *)(i - 1) = *v1;
    qword_9DA00 = i;
  }
  if (byte_9DA50 == 1)
  {
    *(unsigned char *)(i - 1) = 31;
    qword_9DA00 = i;
  }
  byte_9D9EC = 0;
}

void skip_whitespace(int a1)
{
  uint64_t v1 = qword_9DA38;
  if (*(unsigned char *)qword_9DA38)
  {
    int v2 = *(unsigned __int8 *)(qword_9DA38 + 1);
    if (v2 == 30)
    {
      ++qword_9DA38;
      qword_9D9F8 = qword_9DA00 - qword_9DA20 + 1;
      int v2 = *(unsigned __int8 *)(v1 + 2);
      ++v1;
    }
    if (v2 == 32)
    {
      if (!a1 && (lFlags & 0x8000000) != 0) {
        return;
      }
    }
    else if (!a1 || v2 != 160)
    {
      return;
    }
    int v3 = *(unsigned __int8 *)(v1 + 2);
    if (v3 != 9 && v3 != 32 && v3 != 160)
    {
      qword_9DA38 = v1 + 1;
      if (byte_9DA50 == 1)
      {
        add_seg(2);
        uint64_t v4 = qword_9DA00;
        *(unsigned char *)qword_9DA00 = 31;
        qword_9DA00 = v4 + 1;
      }
    }
  }
}

void remove_whitespace(int a1)
{
  if (qword_9DA18 == 2 && (a1 || (lFlags & 0x8000000) == 0))
  {
    if (qword_9DA00 - qword_9DA20 == 1 || (qword_9DA00 - qword_9DA20 == 2 ? (BOOL v1 = byte_9DA50 == 0) : (BOOL v1 = 1), !v1))
    {
      if (*(unsigned char *)qword_9DA20 == 32)
      {
        qword_9DA18 = 0;
        if (byte_9DA50 == 1)
        {
          add_seg(2);
          uint64_t v2 = qword_9DA00;
          *(unsigned char *)qword_9DA00 = 31;
          qword_9DA00 = v2 + 1;
        }
      }
    }
  }
}

uint64_t no_abbrev()
{
  BOOL v0 = nSubLangIDGlb == 3 && nLangIDGlb == 9;
  uint64_t result = 1;
  if (!v0)
  {
    uint64_t v2 = qword_9DA18;
    if (qword_9DA18 != 0x2000)
    {
      int v3 = (unsigned __int8 *)qword_9DA38;
      if (nLangIDGlb == 7)
      {
        uint64_t v4 = "So.";
        char v5 = (unsigned __int8 *)qword_9DA38;
        while (1)
        {
          do
            int v6 = *v5++;
          while (v6 == 173 || v6 == 30);
          if (v6 != *(unsigned __int8 *)v4) {
            break;
          }
          if (++v4 == "")
          {
            if (*(unsigned __int8 *)(qword_9DA38 + 3) < 0x41u)
            {
              BOOL v8 = 0;
              uint64_t v9 = 2;
              goto LABEL_34;
            }
            break;
          }
        }
        uint64_t v10 = "gen.";
        BOOL v11 = (unsigned __int8 *)qword_9DA38;
        while (1)
        {
          do
            int v12 = *v11++;
          while (v12 == 173 || v12 == 30);
          if (v12 != *(unsigned __int8 *)v10) {
            break;
          }
          if (++v10 == "")
          {
            int v14 = *(unsigned __int8 *)(qword_9DA38 + 4);
            if (*(unsigned char *)(qword_9DA38 + 4))
            {
              BOOL v8 = 0;
              uint64_t v9 = 3;
              if ((v14 + 33) > 0xE0u) {
                goto LABEL_34;
              }
              if ((v14 - 91) > 0xE5u) {
                goto LABEL_34;
              }
              if ((v14 | 0x80) == 0xA0)
              {
                char v15 = *(unsigned char *)(qword_9DA38 + 5);
                if (v15)
                {
                  BOOL v8 = 0;
                  uint64_t v9 = 3;
                  if ((v15 + 33) > 0xE0u || (v15 - 91) > 0xE5u) {
                    goto LABEL_34;
                  }
                }
              }
            }
            break;
          }
        }
      }
      unint64_t v16 = is_generic_abbrev((unsigned __int8 *)qword_9DA38);
      if (v16)
      {
        uint64_t v9 = v16;
        BOOL v8 = 0;
      }
      else
      {
        unint64_t v17 = is_common_abbrev(v3);
        if (!v17) {
          return 1;
        }
        uint64_t v9 = v17;
        BOOL v8 = v17 > 2;
        int v3 = (unsigned __int8 *)qword_9DA38;
      }
LABEL_34:
      if (is_url(v3)) {
        return 1;
      }
      if (v2 == 2) {
        qword_9DA18 = 1;
      }
      if (v8) {
        uint64_t v18 = 0x2000;
      }
      else {
        uint64_t v18 = 32;
      }
      add_seg(v18);
      do
      {
        int v19 = (unsigned char *)qword_9DA38;
        if (v8 && in(*(unsigned __int8 *)qword_9DA38, 9))
        {
          qword_9DA38 = (uint64_t)(v19 + 1);
          uint64_t v20 = qword_9DA00;
          *(unsigned char *)qword_9DA00 = *v19 & 0xDF;
          qword_9DA00 = v20 + 1;
        }
        else
        {
          qword_9DA38 = (uint64_t)(v19 + 1);
          add_basis_char((char)*v19, 0);
        }
        --v9;
      }
      while (v9);
      add_basis_char(*(char *)qword_9DA38, 0);
      if (*(unsigned char *)qword_9DA38
        && *(unsigned char *)(qword_9DA38 + 1) == 32
        && *(unsigned __int8 *)(qword_9DA38 + 2) - 58 >= 0xFFFFFFF6)
      {
        skip_whitespace(0);
      }
      uint64_t result = 0;
      dword_9D9F0 = 0;
    }
  }
  return result;
}

uint64_t no_locution()
{
  uint64_t result = 1;
  if (nLangIDGlb == 12
    && qword_9DA18 != 0x2000
    && (lFlags & 0x4000) == 0
    && (byte_9D9EC & 1) == 0
    && (byte_9DA54 & 1) == 0)
  {
    int v1 = *(int *)((char *)&dword_8 + (void)pLangGlb);
    if ((v1 & 0x80000000) == 0)
    {
      uint64_t v2 = (unsigned __int8 *)qword_9DA38;
      int v3 = *pLangGlb + 2;
      int v4 = v1 + 1;
      while ((*((unsigned char *)v3 + 17) & 0x40) == 0
           || !equals_nocase(v2, (unsigned __int8 *)*(v3 - 2))
           || (*v3)[(void)v2] > 0x40u)
      {
        v3 += 5;
        if (!--v4) {
          return 1;
        }
      }
      add_seg(0x2000);
      char v5 = *(v3 - 2);
      int v6 = (unsigned char *)qword_9DA00;
      char v9 = *v5;
      char v7 = v5 + 1;
      char v8 = v9;
      do
      {
        *v6++ = v8;
        int v10 = *v7++;
        char v8 = v10;
      }
      while (v10);
      uint64_t result = 0;
      qword_9DA00 = (uint64_t)v6;
      qword_9DA38 = (uint64_t)&(*v3)[qword_9DA38 - 1];
    }
  }
  return result;
}

BOOL is_mathematics()
{
  if (qword_9DA18 == 0x2000) {
    return 0;
  }
  if (byte_9D9E8) {
    return 1;
  }
  return strchr((char *)(qword_9DA38 + 1), 61) != 0;
}

uint64_t is_supersub()
{
  BOOL v0 = (unsigned __int8 *)(qword_9DA38 + 1);
  int v1 = *(unsigned __int8 *)(qword_9DA38 + 1);
  if (*(unsigned char *)(qword_9DA38 + 1))
  {
    if ((v1 - 58) < 0xF6u && !in(*(unsigned __int8 *)(qword_9DA38 + 1), 25))
    {
      uint64_t v2 = memchr("({[<\x91", v1, 6uLL);
      if (v1 != 30 && v2 == 0) {
        return 0;
      }
    }
  }
  else
  {
    uint64_t result = in(0, 25);
    if (!result) {
      return result;
    }
  }
  return equals_nocase(v0, "<PT") ^ 1;
}

void process_dash(int a1, int a2)
{
  if (nLangIDGlb == 10 || nLangIDGlb == 12)
  {
    if (nLangIDGlb == 10 && qword_9DA18 != 2)
    {
      uint64_t v6 = qword_9DA00;
      *(unsigned char *)qword_9DA00 = 32;
      qword_9DA00 = v6 + 1;
    }
  }
  else if (nLangIDGlb != 9 || nSubLangIDGlb != 3)
  {
    if (*(unsigned __int8 *)qword_9DA20 == 160) {
      *(unsigned char *)qword_9DA20 = 32;
    }
    remove_whitespace(1);
  }
  if (*(unsigned char *)qword_9DA38
    && (*(unsigned __int8 *)(qword_9DA38 + 1) - 150 < 2 || *(unsigned char *)(qword_9DA38 + 1) == 45))
  {
    ++qword_9DA38;
  }
  if (a1 == 151
    || (nLangIDGlb == 9 ? (BOOL v8 = nSubLangIDGlb == 2) : (BOOL v8 = 1),
        v8 || (uint64_t v9 = 16, (byte_9D9E8 & 1) == 0) && (lFlags & 0x40000000) != 0))
  {
    uint64_t v9 = 4;
  }
  add_seg(v9);
  uint64_t v10 = qword_9DA00;
  if (nLangIDGlb == 7) {
    char v11 = -105;
  }
  else {
    char v11 = a1;
  }
  *(unsigned char *)qword_9DA00 = v11;
  qword_9DA00 = v10 + 1;
  if (a2)
  {
    add_seg(4);
    uint64_t v12 = qword_9DA00;
    *(unsigned char *)qword_9DA00 = a1;
    qword_9DA00 = v12 + 1;
  }
  int v13 = nLangIDGlb;
  BOOL v15 = nLangIDGlb == 7 || nLangIDGlb == 10;
  if (a1 == 151 && v15)
  {
    unsigned int v16 = *(unsigned __int8 *)(qword_9DA38 + 1);
    if (v16 >= 0x21
      && v16 != 160
      && !memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *(unsigned __int8 *)(qword_9DA38 + 1), 0x15uLL)
      && !memchr("({[<\x91", v16, 6uLL)
      && !memchr(")}]>\x9B", v16, 6uLL)
      && !memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v16, 0xDuLL))
    {
      add_seg(2);
      uint64_t v17 = qword_9DA00;
      *(unsigned char *)qword_9DA00 = 32;
      qword_9DA00 = v17 + 1;
      return;
    }
  }
  if (v13 == 12) {
    goto LABEL_53;
  }
  if (v13 != 7)
  {
    if (a1 == 151 && v13 == 10) {
      return;
    }
    goto LABEL_57;
  }
  if (*(unsigned char *)(qword_9DA38 + 1) != 32 || *(unsigned __int8 *)(qword_9DA38 + 2) - 48 >= 0xA)
  {
LABEL_53:
    if (a1 == 151) {
      return;
    }
LABEL_57:
    if (v13 == 9 && nSubLangIDGlb == 3) {
      return;
    }
  }

  skip_whitespace(1);
}

void process_quotes(char a1, int a2, char a3)
{
  char v3 = a3;
  char v4 = a2;
  char v5 = a1;
  if ((qword_9DA18 & 0xC0) != 0 && *(unsigned __int8 *)(qword_9DA38 + 1) - 58 >= 0xFFFFFFF6) {
    goto LABEL_46;
  }
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
  {
    int v7 = *(unsigned __int8 *)qword_9DA38;
    if (a2 == 39) {
      char v8 = 39;
    }
    else {
      char v8 = 34;
    }
    if (v7 == 34) {
      char v5 = 30;
    }
    else {
      char v5 = a1;
    }
    if (v7 == 34) {
      char v4 = v8;
    }
    else {
      char v4 = a2;
    }
    if (v7 == 34) {
      char v3 = 31;
    }
    else {
      char v3 = a3;
    }
  }
  add_seg(4);
  uint64_t v9 = qword_9DA38;
  unsigned __int8 v10 = *(unsigned char *)qword_9DA38;
  uint64_t v11 = qword_9DA28;
  BOOL v12 = *(unsigned char *)qword_9DA38 != 34 || (qword_9DA28 | 2) == 2;
  if (v12 || (int v18 = *(unsigned __int8 *)(qword_9DA38 + 1), v18 != 59) && v18 != 44 || *(unsigned char *)(qword_9DA38 + 2) != 34)
  {
    if ((qword_9DA28 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
      goto LABEL_42;
    }
    int v14 = (unsigned __int8 *)(qword_9DA38 + 1);
    int v13 = *(unsigned __int8 *)(qword_9DA38 + 1);
    if (!in(*(unsigned __int8 *)(qword_9DA38 + 1), 9) && !is_number((unsigned __int8 *)(v9 + 1)))
    {
      BOOL v15 = "..";
      while (1)
      {
        do
          int v16 = *v14++;
        while (v16 == 173 || v16 == 30);
        if (v16 != *(unsigned __int8 *)v15) {
          break;
        }
        if (++v15 == "") {
          goto LABEL_42;
        }
      }
      if (v13 == v10 && v11 != 4)
      {
LABEL_42:
        if (!v11) {
          goto LABEL_45;
        }
        goto LABEL_43;
      }
      if (v13 && memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v13, 0xDuLL))
      {
        uint64_t v23 = (unsigned __int8 *)(v9 + 2);
        if (in(*(unsigned __int8 *)(v9 + 2), 9) || is_number((unsigned __int8 *)(v9 + 2))) {
          goto LABEL_42;
        }
        uint64_t v24 = "..";
        while (1)
        {
          do
            int v25 = *v23++;
          while (v25 == 173 || v25 == 30);
          if (v25 != *(unsigned __int8 *)v24) {
            break;
          }
          if (++v24 == "") {
            goto LABEL_42;
          }
        }
      }
      if (!v11)
      {
        uint64_t v22 = (char *)qword_9DA00;
LABEL_67:
        *uint64_t v22 = v3;
        goto LABEL_47;
      }
      if (!*(unsigned char *)(v9 - 1) || !memchr("({[<\x91", *(unsigned __int8 *)(v9 - 1), 6uLL))
      {
        uint64_t v22 = (char *)qword_9DA00;
        int v27 = *(unsigned __int8 *)(qword_9DA00 - 1);
        if (v27 != 145 && v27 != 171) {
          goto LABEL_67;
        }
      }
    }
LABEL_43:
    unsigned __int8 v21 = *(unsigned char *)(v9 - 1);
    if (!in(v21, 9) && (v21 - 58) < 0xF6u) {
      goto LABEL_45;
    }
LABEL_46:
    uint64_t v22 = (char *)qword_9DA00;
    *(unsigned char *)qword_9DA00 = v4;
    goto LABEL_47;
  }
  uint64_t v19 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = v3;
  qword_9DA00 = v19 + 1;
  ++qword_9DA38;
  add_seg(4);
  uint64_t v20 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
  qword_9DA00 = v20 + 1;
  ++qword_9DA38;
  add_seg(4);
LABEL_45:
  uint64_t v22 = (char *)qword_9DA00;
  *(unsigned char *)qword_9DA00 = v5;
LABEL_47:
  qword_9DA00 = (uint64_t)(v22 + 1);
}

void process_supersub()
{
  int v0 = 0;
  int v1 = *(unsigned __int8 *)(qword_9DA00 - 1);
  BOOL v9 = v1 == 51;
  BOOL v2 = v1 != 51;
  uint64_t v3 = 16;
  if (!v9) {
    uint64_t v3 = 128;
  }
  qword_9DA18 = v3;
  while (1)
  {
    if (is_supersub())
    {
      uint64_t v4 = qword_9DA38;
      goto LABEL_8;
    }
    if (v0 < 1) {
      break;
    }
    uint64_t v4 = qword_9DA38;
    if (!*(unsigned char *)(qword_9DA38 + 1)) {
      break;
    }
LABEL_8:
    char v5 = (unsigned __int8 *)(v4 + 1);
    qword_9DA38 = v4 + 1;
    if (*(unsigned char *)(v4 + 1) == 30)
    {
      qword_9D9F8 = qword_9DA00 - qword_9DA20 + 1;
      char v5 = (unsigned __int8 *)(v4 + 2);
      qword_9DA38 = v4 + 2;
    }
    if (!v2 || nLangIDGlb != 7)
    {
      uint64_t v7 = *v5;
      if (!*v5)
      {
LABEL_40:
        if (in(0, 25)) {
          goto LABEL_59;
        }
LABEL_41:
        uint64_t v12 = 32;
        goto LABEL_42;
      }
      goto LABEL_20;
    }
    if (((unint64_t)qword_9DA28 < 3 || (qword_9DA28 & 0x1E024) != 0) && (lFlags & 1) == 0)
    {
      uint64_t v6 = (unsigned char *)qword_9DA00;
      if (qword_9DA00 - qword_9DA20 == 1 && !is_mathematics())
      {
        *uint64_t v6 = *(v6 - 1);
        qword_9DA00 = (uint64_t)(v6 + 1);
        *(v6 - 1) = stru_B8.segname[(void)pLangGlb + 3];
        char v5 = (unsigned __int8 *)qword_9DA38;
      }
    }
    uint64_t v7 = *v5;
    if (v7 == 45)
    {
      if (is_decimal_number(v5 + 1)) {
        add_seg(32);
      }
      uint64_t v23 = qword_9DA00;
      *(unsigned char *)qword_9DA00 = -106;
      qword_9DA00 = v23 + 1;
      BOOL v2 = 1;
    }
    else
    {
      if (!*v5) {
        goto LABEL_40;
      }
LABEL_20:
      if ((v7 - 58) < 0xF6u)
      {
        if (in(v7, 25) || memchr("\xB9\xB2\xB3\xBC\xBD\xBE", v7, 7uLL))
        {
LABEL_59:
          add_seg(16);
          int v19 = *(unsigned __int8 *)qword_9DA38;
          uint64_t v20 = qword_9DA00;
          BOOL v2 = 0;
          if (v19 == 45) {
            LOBYTE(v19) = -106;
          }
          *(unsigned char *)qword_9DA00 = v19;
          qword_9DA00 = v20 + 1;
        }
        else
        {
          if ((int)v7 <= 122)
          {
            if (v7 == 60 || v7 == 62) {
              goto LABEL_59;
            }
            goto LABEL_75;
          }
          if (v7 == 123)
          {
            BOOL v2 = 0;
            ++v0;
          }
          else if (v7 == 125)
          {
            BOOL v2 = 0;
            --v0;
          }
          else
          {
LABEL_75:
            if (memchr("({[<\x91", v7, 6uLL))
            {
              add_seg(16);
              BOOL v2 = 0;
              uint64_t v24 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
              qword_9DA00 = v24 + 1;
              ++v0;
            }
            else if (memchr(")}]>\x9B", v7, 6uLL))
            {
              add_seg(16);
              BOOL v2 = 0;
              uint64_t v25 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
              qword_9DA00 = v25 + 1;
              --v0;
            }
            else
            {
              if (v7 != 9 && v7 != 160 && v7 != 32) {
                goto LABEL_41;
              }
              uint64_t v12 = 0;
LABEL_42:
              add_seg(v12);
              BOOL v2 = 0;
              uint64_t v13 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
              qword_9DA00 = v13 + 1;
            }
          }
        }
      }
      else
      {
        if (qword_9DA18 != 128) {
          add_seg(64);
        }
        int v8 = nLangIDGlb;
        if (nLangIDGlb != 7)
        {
          BOOL v9 = nLangIDGlb == 9 && nSubLangIDGlb == 2;
          BOOL v10 = v9;
          if (nLangIDGlb != 10 && !v10) {
            goto LABEL_43;
          }
        }
        if (v2 || qword_9DA00 == qword_9DA20)
        {
          if (is_lower_num((unsigned __int8 *)qword_9DA38))
          {
            BOOL v2 = 0;
            qword_9DA18 = 128;
          }
          else
          {
            int v8 = nLangIDGlb;
            if (nLangIDGlb == 7)
            {
              if (v2)
              {
                if (!is_decimal_number((unsigned __int8 *)qword_9DA38)) {
                  goto LABEL_52;
                }
                if (qword_9DA18 != 64)
                {
                  add_seg(0);
                  uint64_t v11 = qword_9DA00;
                  *(unsigned char *)qword_9DA00 = 32;
                  qword_9DA00 = v11 + 1;
                }
              }
              goto LABEL_62;
            }
LABEL_43:
            if (v8 == 12) {
              goto LABEL_51;
            }
LABEL_47:
            if (v8 == 9 && nSubLangIDGlb == 3 && (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
LABEL_51:
              char v14 = upper_digit(*(unsigned char *)qword_9DA38);
              uint64_t v15 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = v14;
              goto LABEL_56;
            }
LABEL_52:
            uint64_t v16 = *(unsigned __int8 *)qword_9DA38;
            if ((v16 - 58) >= 0xFFFFFFF6) {
              uint64_t v17 = &asc_2A2CA[v16 - 48];
            }
            else {
              uint64_t v17 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * v16);
            }
            char v18 = *v17;
            uint64_t v15 = qword_9DA00;
            *(unsigned char *)qword_9DA00 = v18;
LABEL_56:
            qword_9DA00 = v15 + 1;
          }
        }
        else
        {
          if (nLangIDGlb != 7) {
            goto LABEL_47;
          }
LABEL_62:
          add_seg(64);
          char v21 = upper_digit(*(unsigned char *)qword_9DA38);
          BOOL v2 = 0;
          uint64_t v22 = qword_9DA00;
          *(unsigned char *)qword_9DA00 = v21;
          qword_9DA00 = v22 + 1;
        }
      }
    }
  }
  BOOL v26 = nLangIDGlb != 9 || nSubLangIDGlb == 2;
  if (!v26 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
  {
    add_seg(16);
    uint64_t v27 = qword_9DA00;
    *(unsigned char *)qword_9DA00 = 33;
    qword_9DA00 = v27 + 1;
  }
}

uint64_t wh_forward_translate(char *__src, char *__dst, size_t size, _DWORD *a4)
{
  int v5 = size;
  uint64_t v7 = __src;
  if (a4) {
    *a4 = 0;
  }
  if (!__src) {
    return 87;
  }
  if (*__src == 123)
  {
    int v8 = matching_brace_pos((unsigned __int8 *)__src);
    if (v8 > (unsigned __int8 *)v7)
    {
      BOOL v9 = v8;
      while (1)
      {
        if (*v9 != 125) {
          goto LABEL_12;
        }
        brl_process_command((unsigned __int8 *)v7 + 1);
        int v12 = v9[1];
        uint64_t v11 = v9 + 1;
        int v10 = v12;
        uint64_t v7 = (char *)v11;
        if (v12 != 123) {
          break;
        }
        uint64_t v13 = matching_brace_pos(v11);
        BOOL v24 = v13 > v11;
        BOOL v9 = v13;
        if (!v24) {
          goto LABEL_12;
        }
      }
      if (!v10) {
        return 0;
      }
    }
  }
LABEL_12:
  if (!__dst) {
    return 87;
  }
  uint64_t result = 87;
  uint64_t v15 = (v5 - 1);
  if (v5 < 1 || v7 == __dst) {
    return result;
  }
  *__dst = 0;
  if (!*v7) {
    return 0;
  }
  bMemoryOverflow = 0;
  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
  qword_9DA38 = (uint64_t)v7;
  char v17 = *v7;
  if (*v7)
  {
    uint64_t v18 = 0;
    int v19 = (unsigned __int8 *)(v7 + 1);
    unsigned __int8 v20 = 32;
    while (1)
    {
      if (v20 == 32 && v17 >= 0x21u)
      {
        unsigned __int8 v20 = v17;
        if ((v17 - 58) < 0xF6u) {
          goto LABEL_23;
        }
        unsigned __int8 v20 = 0;
      }
      else if (v20 >= 0x21u)
      {
LABEL_23:
        if (v17 == v20) {
          ++v18;
        }
        else {
          unsigned __int8 v20 = 0;
        }
      }
      qword_9DA38 = (uint64_t)v19;
      int v21 = *v19++;
      char v17 = v21;
      if (!v21)
      {
        uint64_t v22 = (char *)(v19 - 1);
        goto LABEL_31;
      }
    }
  }
  uint64_t v18 = 0;
  unsigned __int8 v20 = 32;
  uint64_t v22 = v7;
LABEL_31:
  uint64_t v23 = v22 - v7;
  if (v5 < 2 * v23) {
    return 111;
  }
  BOOL v24 = v18 > 3 && v20 > 0x20u;
  if (v24 || b8DotBraille)
  {
    if (a4)
    {
      if (v23 >= 1)
      {
        for (uint64_t i = 0; i != v23; ++i)
          a4[i] = i;
      }
      a4[v23] = v23 - 1;
    }
    strcpy(__dst, v7);
    return 0;
  }
  qword_9DA40 = (uint64_t)v7;
  qword_9DA10 = (uint64_t)__dst;
  qword_9DA08 = (uint64_t)&__dst[v15];
  __dst[v15] = 0;
  pExcMapGlb = &brl_set_classmap;
  uint64_t v25 = malloc_type_malloc(v5, 0xD661D933uLL);
  qword_9DA88 = (uint64_t)v25;
  if (!v25) {
    return 8;
  }
  *uint64_t v25 = 0;
  v25[v15] = 0;
  BOOL v26 = (unsigned __int8 **)&unk_9D000;
  qword_9DA20 = (uint64_t)(v25 + 1);
  uint64_t v27 = &unk_9D000;
  qword_9DA00 = (uint64_t)(v25 + 1);
  qword_9DA78 = 0;
  qword_9DA30 = 0;
  qword_9DA48 = 0;
  byte_9D9E8 = 0;
  dword_9DA80 = 0;
  byte_9DA90 = 0;
  dword_9D9F0 = 0;
  byte_9DA58 = 0;
  byte_9DA54 = 0;
  byte_9D9EC = 0;
  byte_9DA50 = a4 != 0;
  unint64_t v28 = lFlags;
  if (nLangIDGlb == 10)
  {
    unint64_t v29 = 0;
    unint64_t v28 = lFlags & 0xFFFFFFFFFBFFFFFFLL;
    lFlags &= ~0x4000000uLL;
  }
  else
  {
    unint64_t v29 = ((unint64_t)lFlags >> 15) & 0x800;
  }
  v990 = a4;
  qword_9DA18 = v29;
  qword_9DA28 = 0;
  qword_9D9F8 = 0;
  if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && (v28 & 0x40000000) == 0) {
    lFlags = v28 & 0xFFFFFFFFF7FFFFFFLL;
  }
  int v31 = (unsigned __int8 *)qword_9DA40;
  qword_9DA38 = qword_9DA40;
  unsigned __int8 v32 = *(unsigned char *)qword_9DA40;
  if (*(unsigned char *)qword_9DA40)
  {
    while (2)
    {
      unint64_t v33 = qword_9DA18;
      if (qword_9DA18 == 2048)
      {
        int v34 = lFlags;
        if ((lFlags & 0x4000000) != 0) {
          goto LABEL_108;
        }
        if (dword_9DA80)
        {
          char v35 = v31;
          char v36 = "'.";
          while (1)
          {
            do
              int v37 = *v35++;
            while (v37 == 173 || v37 == 30);
            if (v37 != *(unsigned __int8 *)v36) {
              break;
            }
            if (++v36 == "") {
              goto LABEL_64;
            }
          }
          int v45 = v32;
          if (v32 == 30)
          {
LABEL_143:
            qword_9D9F8 = v27[320] - qword_9DA20 + 1;
            goto LABEL_1523;
          }
LABEL_116:
          if (v45 != 173 || (v34 & 0x20000000) != 0)
          {
            uint64_t v46 = (unsigned __int8 *)v27[320];
            *uint64_t v46 = v32;
            v27[320] = v46 + 1;
            int v47 = *v16[327];
            if (v47 == 9 || v47 == 160 || v47 == 32) {
LABEL_121:
            }
              add_whitespace();
          }
          goto LABEL_1523;
        }
LABEL_64:
        if (v32 >= 0x21u && v32 != 160)
        {
          if (!memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v32, 0x15uLL)
            && !memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v32, 0xDuLL)
            && !memchr("({[<\x91", v32, 6uLL)
            && !memchr(")}]>\x9B", v32, 6uLL)
            || (unsigned int v39 = v31[1], v39 >= 0x21)
            && v39 != 160
            && !memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v31[1], 0x15uLL)
            && !memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v39, 0xDuLL))
          {
LABEL_108:
            int v45 = v32;
            if (v32 == 30) {
              goto LABEL_1523;
            }
            goto LABEL_116;
          }
        }
      }
      switch(v32)
      {
        case 0x1Bu:
          int v162 = v31[1];
          int v161 = (char *)(v31 + 1);
          if (!v162) {
            goto LABEL_1523;
          }
          v16[327] = (unsigned __int8 *)v161;
          int v163 = *v161;
          if (v163 == 51) {
            goto LABEL_969;
          }
          if (v163 != 52) {
            goto LABEL_1523;
          }
LABEL_462:
          add_seg(4096);
          uint64_t v164 = qword_9DA28;
          if (nLangIDGlb == 7 && qword_9DA28 == 0x2000)
          {
            v165 = (unsigned char *)v27[320];
            unsigned char *v165 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
            v27[320] = v165 + 1;
          }
          v166 = v16[327];
          if (*v166)
          {
            v167 = v166 + 1;
            do
            {
              if (*v167 != 127) {
                break;
              }
              v16[327] = v167;
            }
            while (*v167++);
            v166 = v167 - 1;
          }
          v315 = "'.";
          v316 = v166;
          while (1)
          {
            do
            {
              int v318 = *++v316;
              int v317 = v318;
            }
            while (v318 == 173 || v317 == 30);
            if (v317 != *(unsigned __int8 *)v315) {
              break;
            }
            if (++v315 == "")
            {
              qword_9DA18 = 0;
LABEL_873:
              v320 = v166 + 3;
              v166 += 2;
              v16[327] = v166;
              v321 = "'.";
              while (1)
              {
                do
                  int v322 = *v320++;
                while (v322 == 173 || v322 == 30);
                if (v322 != *(unsigned __int8 *)v321) {
                  goto LABEL_881;
                }
                if (++v321 == "") {
                  goto LABEL_873;
                }
              }
            }
          }
LABEL_881:
          if (nLangIDGlb != 12 || v164 == 0x2000)
          {
            char v325 = **(unsigned char **)&stru_68.segname[(void)pLangGlb + 8];
            v324 = (char *)v27[320];
          }
          else
          {
            v324 = (char *)v27[320];
            char v325 = 58;
          }
          char *v324 = v325;
          v27[320] = v324 + 1;
          BOOL v326 = nLangIDGlb == 9 && nSubLangIDGlb == 2;
          if (v326 && v164 == 0x2000) {
            char v327 = 44;
          }
          else {
            char v327 = **(unsigned char **)&stru_68.segname[(void)pLangGlb + 8];
          }
          goto LABEL_893;
        case 0x1Eu:
          goto LABEL_143;
        case 0x1Fu:
        case 0xADu:
          goto LABEL_1523;
        case 0x20u:
          BOOL v170 = v33 == 64 && (lFlags & 0x10000) == 0;
          if (!v170 || (*(v31 - 1) | 2) == 0x2E || v31[1] - 58 < 0xFFFFFFF6) {
            goto LABEL_1313;
          }
          uint64_t v171 = qword_9DA40;
          int v988 = *(unsigned __int8 *)qword_9DA20;
          unsigned __int8 v986 = upper_digit(0x30u);
          BOOL v172 = v988 == v986;
          unint64_t v173 = is_figure(0, v31 - 1, v171, v172);
          unint64_t v174 = is_figure(1, v31 + 1, v171, v172);
          if (v173 <= v174)
          {
            if (v174 >= 2) {
              goto LABEL_1308;
            }
          }
          else if (v174 >= 2 && v173 + ~v174 < 2)
          {
LABEL_1308:
            if (v174 < 5 || v988 == v986 && is_figure(1, v31 + 1, v171, 0) >= 4)
            {
              char separator = get_separator(1);
              v447 = (unsigned char *)v27[320];
              unsigned char *v447 = separator;
              v27[320] = v447 + 1;
              if (byte_9DA50 != 1) {
                goto LABEL_1523;
              }
              v447[1] = 31;
              uint64_t v74 = v447 + 2;
              goto LABEL_1522;
            }
          }
LABEL_1313:
          if (byte_9D9EC == 1)
          {
LABEL_1314:
            add_seg(2);
            v448 = (unsigned char *)v27[320];
            unsigned char *v448 = 32;
            v27[320] = v448 + 1;
            goto LABEL_121;
          }
          if (nLangIDGlb == 7)
          {
            if ((v33 & 0xC0) != 0) {
              goto LABEL_1319;
            }
            if (byte_9D9E8 != 1) {
              goto LABEL_1640;
            }
            if ((v33 & 0x2000) == 0 || dword_9DA68)
            {
              uint64_t v16 = (unsigned __int8 **)&unk_9D000;
              uint64_t v27 = (void *)&unk_9D000;
              goto LABEL_1640;
            }
            uint64_t v27 = &unk_9D000;
            uint64_t v16 = (unsigned __int8 **)&unk_9D000;
            if (qword_9DA00 - qword_9DA20 <= 4)
            {
LABEL_1319:
              if (is_measurement(v31 + 1, 1, 1)) {
                goto LABEL_1323;
              }
              int v31 = v16[327];
              unsigned int v449 = v31[1];
              if (v449 - 137 <= 0x3C && ((1 << (v449 + 119)) & 0x1000108000000001) != 0) {
                goto LABEL_1323;
              }
              if (v31[1])
              {
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                uint64_t v27 = &unk_9D000;
                if (v449 == 37
                  || memchr("\x80$\xA5\xA2\xA3\xA4", v31[1], 7uLL)
                  || (v449 > 0xDE || v449 - 123 >= 0xFFFFFFE6)
                  && (unsigned __int8 v615 = v31[2]) != 0
                  && ((v615 + 33) > 0xE0u || (v615 - 91) >= 0xE6u))
                {
LABEL_1323:
                  add_seg(2);
                  if (byte_9D9E8 == 1)
                  {
                    v450 = (char *)v27[320];
                    if (byte_9DA50 == 1) {
                      *v450++ = 31;
                    }
                    char v451 = 127;
                    goto LABEL_1327;
                  }
                  if ((lFlags & 0x8000000) == 0 || (int v452 = v16[327][1], v452 == 37) || v452 == 137 || v452 == 176)
                  {
                    if (byte_9DA50 != 1) {
                      goto LABEL_1523;
                    }
                    uint64_t v53 = (char *)v27[320];
                    char v54 = 31;
                    goto LABEL_1521;
                  }
                  goto LABEL_127;
                }
              }
              else
              {
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                uint64_t v27 = &unk_9D000;
              }
            }
          }
LABEL_1640:
          char v542 = qword_9DA18;
          if (qword_9DA18 == 32)
          {
            if (*(v31 - 1) != 46) {
              goto LABEL_1314;
            }
          }
          else
          {
            if (qword_9DA18 != 0x2000) {
              goto LABEL_1654;
            }
            if (number_precedes(1)) {
              goto LABEL_1314;
            }
          }
          int v543 = v31[1];
          if (!v31[1]) {
            goto LABEL_1654;
          }
          if (memchr(",;:!?", v31[1], 6uLL))
          {
            if (v543 == 63) {
              goto LABEL_1654;
            }
          }
          else if (v543 != 46)
          {
            goto LABEL_1654;
          }
          if ((byte_9D9E8 & 1) != 0 || v31[2] > 0x20u)
          {
LABEL_1654:
            if ((v542 & 0xC0) == 0) {
              goto LABEL_1314;
            }
            unsigned int v544 = v31[1];
            if (v544 > 0x88)
            {
              if (v544 != 176 && v544 != 137) {
                goto LABEL_1663;
              }
            }
            else
            {
              if (!v31[1]) {
                goto LABEL_1314;
              }
              if (v544 != 37) {
                goto LABEL_1663;
              }
            }
            if (nLangIDGlb != 9 || nSubLangIDGlb != 3)
            {
LABEL_1665:
              if (byte_9DA50 == 1)
              {
                add_seg(2);
                v545 = (unsigned char *)v27[320];
                unsigned char *v545 = 31;
                v27[320] = v545 + 1;
              }
              if (byte_9D9E8 != 1) {
                goto LABEL_1523;
              }
              if (nLangIDGlb != 7) {
                goto LABEL_1523;
              }
              int v546 = v16[327][1];
              if (v546 != 37 && v546 != 176 && v546 != 137) {
                goto LABEL_1523;
              }
LABEL_452:
              add_seg(2);
              uint64_t v53 = (char *)v27[320];
LABEL_732:
              char v54 = 127;
              goto LABEL_1521;
            }
LABEL_1663:
            if ((lFlags & 0x8000000) != 0
              || v544 != 42
              && (!memchr("+-=", v31[1], 4uLL)
               || is_number(v31 + 1)
               || !is_number(v31 + 2)
               && (v544 == 45 && !strchr((char *)v31 + 2, 61) || v31[2] != 32 || !is_number(v31 + 3))))
            {
              goto LABEL_1314;
            }
            goto LABEL_1665;
          }
          if (byte_9DA50 == 1)
          {
            add_seg(32);
            uint64_t v27 = &unk_9D000;
            uint64_t v194 = (char *)qword_9DA00;
            char v195 = 31;
          }
          else
          {
            add_seg(0);
            uint64_t v27 = &unk_9D000;
            uint64_t v194 = (char *)qword_9DA00;
            char v195 = 32;
          }
LABEL_1631:
          *uint64_t v194 = v195;
          v180 = v194 + 1;
          goto LABEL_1632;
        case 0x21u:
        case 0x28u:
        case 0x29u:
        case 0x3Bu:
        case 0x3Fu:
        case 0xA9u:
        case 0xAEu:
          if (v32 == 63 || v32 == 40)
          {
            BOOL v69 = off_95000;
            if (byte_9D9E8 != 1) {
              goto LABEL_310;
            }
            if (v32 == 40)
            {
LABEL_303:
              if (*((_DWORD *)v69 + 268) == 7 && (qword_9DA18 & 0xC0) != 0)
              {
                int v111 = v16[327];
                if (*v111 == 40 && v111[1] - 58 >= 0xFFFFFFF6)
                {
                  uint64_t v113 = (char *)v27[320];
                  unint64_t v356 = (unint64_t)v113;
                  while (v356 > qword_9DA20)
                  {
                    int v357 = *(unsigned __int8 *)--v356;
                    if (v357 == stru_B8.segname[(void)pLangGlb + 1])
                    {
                      char v112 = 50;
                      goto LABEL_308;
                    }
                  }
                }
              }
              add_seg(16);
              char v112 = *v16[327];
              uint64_t v113 = (char *)v27[320];
LABEL_308:
              *uint64_t v113 = v112;
              v27[320] = v113 + 1;
              if (*v16[327] != 41) {
                goto LABEL_152;
              }
              goto LABEL_1523;
            }
          }
          else
          {
            BOOL v69 = off_95000;
            if (v32 == 33)
            {
              if (v31[1] == 44
                && (v33 < 3
                 || (int v70 = *(v31 - 1)) != 0
                 && (memchr("({[<\x91", *(v31 - 1), 6uLL)
                  || memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v70, 0xDuLL))))
              {
                add_seg(32);
                open_math_passage();
                goto LABEL_181;
              }
LABEL_310:
              int v114 = *((_DWORD *)v69 + 268);
              BOOL v116 = v114 == 9 && nSubLangIDGlb != 3;
              if (v114 != 12 && !v116)
              {
LABEL_318:
                if (v114 == 9 && nSubLangIDGlb == 3)
                {
                  if (v32 != 63 || v33 >= 3 && (!*(v31 - 1) || !memchr("({[<\x91", *(v31 - 1), 6uLL)))
                    goto LABEL_1430;
                  goto LABEL_1435;
                }
                if (v114 != 7) {
                  goto LABEL_1430;
                }
                if (v32 == 63 && v33 == 0x2000)
                {
                  if (dword_9DA68 > 1)
                  {
LABEL_391:
                    ++dword_9DA68;
                    uint64_t v53 = (char *)v27[320];
                    char v54 = 63;
                    goto LABEL_1521;
                  }
                  int v340 = *(v31 - 1);
                  if (!*(v31 - 1)) {
                    goto LABEL_1424;
                  }
                  if ((v340 + 33) > 0xE0u || (v340 - 91) >= 0xE6u)
                  {
                    unsigned __int8 v379 = v31[1];
                    if (v379)
                    {
                      uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                      uint64_t v27 = (void *)&unk_9D000;
                      if ((v379 + 33) > 0xE0u || (v379 - 91) >= 0xE6u) {
                        goto LABEL_391;
                      }
                    }
                    else
                    {
                      uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                      uint64_t v27 = &unk_9D000;
                    }
                  }
                }
                else
                {
                  if (v32 != 63) {
                    goto LABEL_1424;
                  }
                  if (v33 < 3)
                  {
LABEL_1419:
                    int v478 = v31[1];
                    if (v478 == 63 || v478 == 32)
                    {
                      add_seg(16);
                      if ((unint64_t)qword_9DA18 <= 2 && v16[327][1] == 63)
                      {
                        uint64_t v53 = (char *)v27[320];
                        char v54 = 33;
                      }
                      else
                      {
                        uint64_t v53 = (char *)v27[320];
                        char v54 = 126;
                      }
                      goto LABEL_1521;
                    }
                    goto LABEL_1424;
                  }
                  int v340 = *(v31 - 1);
                }
                if (v340 == 63) {
                  goto LABEL_1419;
                }
LABEL_1424:
                if (byte_9D9E8) {
                  goto LABEL_1435;
                }
                if ((v33 & 0xC) != 0 && memchr("!?", (char)v32, 3uLL) && v31[1] >= 0x21u)
                {
                  if (v33 != 16 && (lFlags & 0x40) != 0) {
                    goto LABEL_1430;
                  }
                  goto LABEL_1435;
                }
                if (v33 == 16)
                {
LABEL_1435:
                  add_seg(32);
                  v482 = (unsigned char *)v27[320];
                  unsigned char *v482 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
                  v27[320] = v482 + 1;
                  uint64_t v109 = 8;
LABEL_1436:
                  add_seg(v109);
                  uint64_t v51 = (char *)v16[327];
                  goto LABEL_1437;
                }
LABEL_1430:
                add_seg(8);
                int v479 = *v16[327];
                v480 = (unsigned char *)v27[320];
                v481 = v480 + 1;
                if (*((_DWORD *)v69 + 268) == 10 && v479 == 33) {
                  LOBYTE(v479) = -95;
                }
                unsigned char *v480 = v479;
                goto LABEL_1439;
              }
              if (v32 == 40)
              {
                if (v33 != 0x2000 || !dword_9D9F0) {
                  goto LABEL_1430;
                }
              }
              else if (v32 != 41 || v33 != 0x2000 || !dword_9D9F0)
              {
                goto LABEL_318;
              }
              unsigned int v243 = v31[1];
              if (v31[1])
              {
                if ((v243 + 33) > 0xE0u || (v243 - 91) >= 0xE6u)
                {
                  uint64_t v250 = *(void *)((char *)&stru_20.cmd + (void)pLangGlb);
                  uint64_t v251 = v32;
                  goto LABEL_955;
                }
                if (v243 > 0xDE || (v243 - 123) >= 0xE6u)
                {
                  v244 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
                  v245 = (unsigned char *)v27[320];
                  char v248 = *v244;
                  v246 = v244 + 1;
                  char v247 = v248;
                  do
                  {
                    *v245++ = v247;
                    int v249 = *v246++;
                    char v247 = v249;
                  }
                  while (v249);
                  v27[320] = v245;
                  dword_9D9F0 = 0;
                }
              }
              add_seg(32);
              uint64_t v250 = *(void *)((char *)&stru_20.cmd + (void)pLangGlb);
              uint64_t v251 = *v16[327];
LABEL_955:
              uint64_t v51 = *(char **)(v250 + 8 * v251);
LABEL_1437:
              LOBYTE(v51) = *v51;
LABEL_1438:
              v483 = (unsigned char *)v27[320];
              unsigned char *v483 = (_BYTE)v51;
              v481 = v483 + 1;
LABEL_1439:
              v27[320] = v481;
              goto LABEL_1523;
            }
            if (v32 != 41 || (byte_9D9E8 & 1) == 0) {
              goto LABEL_310;
            }
          }
          remove_whitespace(0);
          goto LABEL_303;
        case 0x22u:
        case 0xABu:
        case 0xBBu:
          char v95 = -85;
          int v96 = 34;
          char v97 = -69;
          goto LABEL_861;
        case 0x23u:
          if (nLangIDGlb != 7)
          {
            if (nLangIDGlb == 9 && number_follows(1) && nSubLangIDGlb != 3)
            {
              if (nSubLangIDGlb != 1)
              {
                add_seg(32);
                uint64_t v53 = (char *)v27[320];
                char v54 = 34;
                goto LABEL_1521;
              }
              if ((lFlags & 0x80000) != 0)
              {
                add_seg(2);
                uint64_t v176 = (unsigned char *)v27[320];
                *uint64_t v176 = **(unsigned char **)((char *)&stru_20.filesize + (void)pLangGlb);
                v27[320] = v176 + 1;
              }
              add_seg(32);
              uint64_t v177 = 0;
              uint64_t v178 = v27[320];
              char v179 = 110;
              do
              {
                *(unsigned char *)(v178 + v177) = v179;
                char v179 = aNo_0[++v177];
              }
              while (v177 != 3);
              v180 = (unsigned char *)(v178 + 3);
              goto LABEL_1632;
            }
            goto LABEL_1292;
          }
          if (is_mathematics()
            || (int v336 = v31[1], in(v31[1], 25))
            || v336 == 32 && in(v31[2], 25)
            || (uint64_t v441 = (uint64_t)&v31[-qword_9DA40], (unint64_t)v31 > qword_9DA40) && in(*(v31 - 1), 25)
            || v441 >= 2 && *(v31 - 1) == 32 && in(*(v31 - 2), 25))
          {
            remove_whitespace(0);
          }
          else if ((v336 | 2) != 0x2E && (lFlags & 2) == 0)
          {
LABEL_1292:
            uint64_t v337 = 4;
            goto LABEL_1293;
          }
          uint64_t v337 = 32;
LABEL_1293:
          add_seg(v337);
          uint64_t v53 = (char *)v27[320];
          char v54 = 35;
          goto LABEL_1521;
        case 0x24u:
          if (v31[1] == 36 && v31[2] >= 0x21u && (lFlags & 0x5000000) == 0)
          {
            add_seg(2048);
            v411 = (unsigned char *)v27[320];
            unsigned char *v411 = 36;
            v27[320] = v411 + 1;
            ++v16[327];
            dword_9DA80 = 1;
            goto LABEL_1523;
          }
          if ((v33 & 0xC0) != 0 && byte_9D9E8 != 0 && nLangIDGlb == 7)
          {
            add_seg(2);
            int v183 = (unsigned char *)v27[320];
            *int v183 = 127;
            v27[320] = v183 + 1;
          }
          add_seg(4);
          uint64_t v53 = (char *)v27[320];
          goto LABEL_509;
        case 0x25u:
        case 0x89u:
          if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
          {
            if (nLangIDGlb == 12)
            {
              if ((lFlags & 0x40000000) != 0) {
                int v102 = byte_9D9E8;
              }
              else {
                int v102 = 1;
              }
              if (v102 == 1)
              {
                add_seg(32);
                uint64_t v103 = 0;
                uint64_t v104 = v27[320];
                char v105 = 39;
                do
                {
                  *(unsigned char *)(v104 + v103) = v105;
                  char v105 = asc_2A4AF[++v103];
                }
                while (v103 != 4);
                v106 = (char *)(v104 + 4);
                v27[320] = v104 + 4;
                if (*v16[327] != 137)
                {
LABEL_698:
                  v259 = v16[327];
                  if (v259[1] == 32 && in(v259[2], 25)) {
                    goto LABEL_152;
                  }
                  goto LABEL_1523;
                }
                char v107 = 35;
LABEL_697:
                char *v106 = v107;
                v27[320] = v106 + 1;
                goto LABEL_698;
              }
            }
            else
            {
              if ((v33 & 0xC0) != 0 && nLangIDGlb == 7) {
                int v257 = byte_9D9E8;
              }
              else {
                int v257 = 0;
              }
              if (v257 == 1)
              {
                add_seg(2);
                v258 = (unsigned char *)v27[320];
                unsigned char *v258 = 127;
                v27[320] = v258 + 1;
              }
            }
          }
          else if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
          {
            uint64_t v156 = 16;
LABEL_696:
            add_seg(v156);
            char v107 = *v16[327];
            v106 = (char *)v27[320];
            goto LABEL_697;
          }
          uint64_t v156 = 4;
          goto LABEL_696;
        case 0x27u:
          unsigned int v184 = v31[1];
          if (v184 == 46 && byte_9DA54 != 0)
          {
            if (nSubLangIDGlb == 3 && nLangIDGlb == 9 || nLangIDGlb == 7) {
              uint64_t v273 = 32;
            }
            else {
              uint64_t v273 = 0;
            }
            add_seg(v273);
            if (byte_9D9E8 == 1)
            {
              close_math_passage(0);
LABEL_1137:
              ++v16[327];
              byte_9DA54 = 0;
              goto LABEL_1523;
            }
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
            {
              uint64_t v352 = 0;
              uint64_t v353 = v27[320];
              char v354 = 60;
              do
              {
                *(unsigned char *)(v353 + v352) = v354;
                char v354 = asc_2A493[++v352];
              }
              while (v352 != 2);
            }
            else
            {
              if (nLangIDGlb != 7) {
                goto LABEL_1137;
              }
              uint64_t v403 = 0;
              uint64_t v353 = v27[320];
              char v404 = 39;
              do
              {
                *(unsigned char *)(v353 + v403) = v404;
                char v404 = asc_29F0C[++v403];
              }
              while (v403 != 2);
            }
            v27[320] = v353 + 2;
            goto LABEL_1137;
          }
          if (v184 == 46 && dword_9DA80)
          {
            add_seg(32 * (nLangIDGlb == 7));
            int v186 = *(unsigned char **)&stru_B8.segname[(void)pLangGlb - 8];
            v187 = (unsigned char *)v27[320];
            char v190 = *v186;
            uint64_t v188 = v186 + 1;
            char v189 = v190;
            do
            {
              *v187++ = v189;
              int v191 = *v188++;
              char v189 = v191;
            }
            while (v191);
            v27[320] = v187;
            ++v16[327];
            dword_9DA80 = 0;
            goto LABEL_1523;
          }
          if (v184 == 46 && qword_9DA78)
          {
LABEL_969:
            add_seg(0);
            qword_9DA18 = 32;
            v344 = (void *)qword_9DA78;
            if (qword_9DA78
              && (qword_9DA78 == qword_9DA30
               || !has_whitespace(*(unsigned __int8 ***)(qword_9DA78 + 48), (unsigned __int8 **)qword_9DA30)))
            {
              uint64_t v386 = v344[1] - 1;
              v346 = off_95000;
              int v345 = 0;
              if (*(unsigned char *)(*v344 + v386) != 44)
              {
                *(unsigned char *)(*v344 + v386) = 0;
                if (nLangIDGlb == 12)
                {
                  int v345 = 0;
                  *(unsigned char *)void *v344 = **(unsigned char **)&stru_68.segname[(void)pLangGlb + 8];
                }
              }
            }
            else
            {
              int v345 = 1;
              v346 = off_95000;
            }
            v387 = v16[327];
            int v388 = v387[1];
            if (*v387 == 51)
            {
              if (v388 == 45 && (*((_DWORD *)v346 + 268) != 9 || nSubLangIDGlb != 2)) {
                goto LABEL_1106;
              }
              if (in(v387[1], 11)) {
                goto LABEL_1102;
              }
            }
            if (v388 == 46 && in(v387[2], 11))
            {
LABEL_1102:
              v389 = *(unsigned char **)((char *)&stru_68.size + (void)pLangGlb);
              v390 = (unsigned char *)v27[320];
              char v393 = *v389;
              v391 = v389 + 1;
              char v392 = v393;
              do
              {
                *v390++ = v392;
                int v394 = *v391++;
                char v392 = v394;
              }
              while (v394);
              v27[320] = v390;
              if (*((_DWORD *)v346 + 268) == 12) {
                byte_9D9EC = 1;
              }
LABEL_1444:
              v484 = v16[327];
              if (*v484 == 39) {
                v16[327] = ++v484;
              }
              if (v484[1] == 39)
              {
                v485 = v484 + 2;
                do
                {
                  if (*v485 != 46) {
                    break;
                  }
                  v16[327] = v485;
                  int v486 = v485[1];
                  v485 += 2;
                }
                while (v486 == 39);
              }
              qword_9DA78 = 0;
              goto LABEL_1523;
            }
LABEL_1106:
            if (v345)
            {
              int v395 = *((_DWORD *)v346 + 268);
              if (v395 == 12 || v395 == 9 && nSubLangIDGlb == 1)
              {
                v396 = (void *)qword_9DA30;
                v397 = *(void **)(qword_9DA30 + 40);
                if (v397 && *v397 == *(uint64_t *)((char *)&stru_20.filesize + (void)pLangGlb))
                {
                  v398 = *(const char **)&stru_68.segname[(void)pLangGlb + 8];
                  v396 = *(void **)(qword_9DA30 + 40);
                }
                else
                {
                  v398 = *(const char **)&stru_68.segname[(void)pLangGlb + 8];
                }
                insert_list_element(v396, v398, 4096);
              }
              else
              {
                v454 = *(unsigned char **)((char *)&stru_68.size + (void)pLangGlb);
                v455 = (unsigned char *)v27[320];
                char v458 = *v454;
                v456 = v454 + 1;
                char v457 = v458;
                do
                {
                  *v455++ = v457;
                  int v459 = *v456++;
                  char v457 = v459;
                }
                while (v459);
                uint64_t v27 = &unk_9D000;
                qword_9DA00 = (uint64_t)v455;
              }
              uint64_t v16 = (unsigned __int8 **)&unk_9D000;
            }
            goto LABEL_1444;
          }
          if ((v33 & 0x20E0) == 0 && is_number(v31 + 1))
          {
            uint64_t v351 = 64;
LABEL_1296:
            add_seg(v351);
LABEL_1297:
            uint64_t v53 = (char *)v27[320];
            char v54 = 39;
            goto LABEL_1521;
          }
          if (v33 != 64 || (unint64_t)qword_9DA28 >= 3 && (qword_9DA28 & 0x24) == 0 && !byte_9D9E8) {
            goto LABEL_1771;
          }
          if (v184 < 0x21 || v184 == 160) {
            goto LABEL_1763;
          }
          if (v184 == 39)
          {
            unsigned int v402 = v31[2];
            if (v402 != 46 && v402 >= 0x21 && (v402 != 39 || v31[3] != 46))
            {
LABEL_1771:
              int v575 = nLangIDGlb;
              int v576 = nSubLangIDGlb;
              BOOL v578 = nLangIDGlb == 9 && nSubLangIDGlb != 3;
              if (v33 == 0x2000 && v578)
              {
                v579 = (unsigned char *)qword_9DA00;
                if (qword_9DA00 - qword_9DA20 == 1 && equals_nocase(v31 - 1, "O'CLOCK"))
                {
                  unsigned char *v579 = 39;
                  uint64_t v27 = &unk_9D000;
                  qword_9DA00 = (uint64_t)(v579 + 1);
                  goto LABEL_1633;
                }
                BOOL v580 = 0;
              }
              else
              {
                BOOL v580 = nLangIDGlb == 12;
                if (v33 == 0x2000 && nLangIDGlb == 12)
                {
                  v581 = (unsigned char *)qword_9DA00;
                  if (qword_9DA00 - qword_9DA20 == 1
                    && (equals_nocase(v31 + 1, "EN")
                     || equals_nocase(v31 + 1, "OR")
                     || equals_nocase(v31 + 1, "TR")))
                  {
                    unsigned char *v581 = 46;
                    uint64_t v27 = &unk_9D000;
                    qword_9DA00 = (uint64_t)(v581 + 1);
                    goto LABEL_1633;
                  }
                  BOOL v580 = 1;
                }
                else if (v33 == 64)
                {
                  if (!v184)
                  {
LABEL_1851:
                    add_seg(32);
                    v541 = *(char **)((char *)&stru_108.offset + *(void *)((char *)&stru_20.cmd + (void)pLangGlb));
                    goto LABEL_1852;
                  }
                  if ((v184 - 58) > 0xF5u)
                  {
                    char v582 = get_separator(0);
                    uint64_t v27 = &unk_9D000;
                    uint64_t v583 = qword_9DA00;
                    *(unsigned char *)qword_9DA00 = v582;
                    v180 = (unsigned char *)(v583 + 1);
                    goto LABEL_1632;
                  }
                }
              }
              if (v184 == 46)
              {
                if (v31[2] >= 0x20u && (lFlags & 0x800000) == 0 && (v33 < 3 || v33 == 0x2000))
                {
                  if (v576 == 3 && v575 == 9 || v575 == 7) {
                    uint64_t v587 = 32;
                  }
                  else {
                    uint64_t v587 = 0;
                  }
                  add_seg(v587);
                  uint64_t v588 = qword_9DA00;
                  if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                  {
                    uint64_t v589 = 0;
                    char v590 = 60;
                    do
                    {
                      *(unsigned char *)(v588 + v589) = v590;
                      char v590 = asc_2A49F[++v589];
                    }
                    while (v589 != 2);
                  }
                  else
                  {
                    uint64_t v616 = 0;
                    char v617 = 39;
                    do
                    {
                      *(unsigned char *)(v588 + v616) = v617;
                      char v617 = asc_29F0C[++v616];
                    }
                    while (v616 != 2);
                  }
                  uint64_t v27 = &unk_9D000;
                  qword_9DA00 = v588 + 2;
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                  ++qword_9DA38;
                  byte_9D9EC = 1;
                  goto LABEL_1523;
                }
              }
              else if (v184 == 36 && (lFlags & 0x1000000) == 0 && (v33 < 3 || v33 == 0x2000))
              {
                add_seg(2048);
                uint64_t v591 = 0;
                uint64_t v592 = qword_9DA00;
                char v593 = 39;
                do
                {
                  *(unsigned char *)(v592 + v591) = v593;
                  char v593 = asc_29F0F[++v591];
                }
                while (v591 != 2);
                uint64_t v27 = &unk_9D000;
                qword_9DA00 = v592 + 2;
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
LABEL_181:
                ++v16[327];
                goto LABEL_1523;
              }
              int v594 = dword_9D9F0;
              if (v184 && v33 == 0x2000 && (v578 || v580) && dword_9D9F0)
              {
                if (v184 > 0xDE || (v184 - 123) >= 0xE6u)
                {
                  if (!in(v31[2], 11)) {
                    goto LABEL_1854;
                  }
                }
                else if ((v184 + 64) < 0x1Fu)
                {
LABEL_1854:
                  uint64_t v27 = &unk_9D000;
                  v324 = (char *)qword_9DA00;
                  *(unsigned char *)qword_9DA00 = **(unsigned char **)((char *)&stru_108.offset
                                                     + *(void *)((char *)&stru_20.cmd + (void)pLangGlb));
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                  char v327 = *(unsigned char *)++qword_9DA38 & 0xDF;
LABEL_893:
                  v324[1] = v327;
                  uint64_t v74 = v324 + 2;
                  goto LABEL_1522;
                }
                if ((v184 - 91) >= 0xE6u) {
                  goto LABEL_1854;
                }
              }
              int v595 = v575 == 9 || v580;
              if (v33 == 0x2000 && v595 && v594)
              {
                if (v575 != 9 || v576 != 3)
                {
                  v596 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
                  v597 = (unsigned char *)qword_9DA00;
                  char v600 = *v596;
                  v598 = v596 + 1;
                  char v599 = v600;
                  do
                  {
                    *v597++ = v599;
                    int v601 = *v598++;
                    char v599 = v601;
                  }
                  while (v601);
                  qword_9DA00 = (uint64_t)v597;
                }
                dword_9D9F0 = 0;
              }
              goto LABEL_1851;
            }
          }
          else if ((v184 - 58) < 0xF6u || !strstr((char *)v31 + 2, "''"))
          {
            goto LABEL_1771;
          }
LABEL_1763:
          if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
          {
            add_seg(32);
            if (*(unsigned char *)(qword_9DA38 + 1) != 39 || byte_9D9E8 == 1 && *(unsigned char *)(qword_9DA38 + 2) == 46)
            {
              uint64_t v572 = 0;
              uint64_t v573 = qword_9DA00;
              char v574 = 60;
              do
              {
                *(unsigned char *)(v573 + v572) = v574;
                char v574 = aM_37[++v572];
              }
              while (v572 != 3);
            }
            else
            {
              uint64_t v572 = 0;
              ++qword_9DA38;
              uint64_t v573 = qword_9DA00;
              char v606 = 60;
              do
              {
                *(unsigned char *)(v573 + v572) = v606;
                char v606 = aSec_0[++v572];
              }
              while (v572 != 4);
            }
            goto LABEL_1868;
          }
          if (nLangIDGlb != 9 || nSubLangIDGlb != 3)
          {
            if (nLangIDGlb == 7 && byte_9D9E8)
            {
              add_seg(2);
              uint64_t v603 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = 127;
              qword_9DA00 = v603 + 1;
            }
            add_seg(32);
            if (nLangIDGlb == 9 || nLangIDGlb == 7)
            {
              uint64_t v604 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = 34;
              qword_9DA00 = v604 + 1;
            }
            if (*(unsigned char *)(qword_9DA38 + 1) == 39 && (byte_9D9E8 != 1 || *(unsigned char *)(qword_9DA38 + 2) != 46))
            {
              ++qword_9DA38;
              uint64_t v605 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = 42;
              qword_9DA00 = v605 + 1;
            }
            uint64_t v27 = &unk_9D000;
            uint64_t v194 = (char *)qword_9DA00;
            char v195 = 42;
            goto LABEL_1631;
          }
          add_seg(32);
          if (*(unsigned char *)(qword_9DA38 + 1) == 39 && (byte_9D9E8 != 1 || *(unsigned char *)(qword_9DA38 + 2) != 46))
          {
            uint64_t v572 = 0;
            ++qword_9DA38;
            uint64_t v573 = qword_9DA00;
            char v584 = 39;
            do
            {
              *(unsigned char *)(v573 + v572) = v584;
              char v584 = asc_246CB[++v572];
            }
            while (v572 != 2);
LABEL_1868:
            v180 = (unsigned char *)(v573 + v572);
            goto LABEL_1328;
          }
          goto LABEL_1629;
        case 0x2Au:
          if (v33 == 256) {
            goto LABEL_1202;
          }
          if (!v33 && is_number(v31 + 1))
          {
            add_seg(16);
            uint64_t v53 = (char *)v27[320];
            char v54 = 42;
            goto LABEL_1521;
          }
          int v313 = v31[1];
          if (v313 == 30)
          {
            if (v31[2] != 42) {
              goto LABEL_1202;
            }
            v314 = v31 + 3;
          }
          else
          {
            if (v313 != 42) {
              goto LABEL_1202;
            }
            v314 = v31 + 2;
          }
          if (!is_number(v314) && (!*v314 || !memchr("({[<\x91", *v314, 6uLL)))
          {
LABEL_1202:
            if (number_follows(1)
              || (int v426 = v31[1], v426 == 35)
              || v426 == 32 && v31[2] == 35
              || is_mathematics() && (unint64_t)v31 > qword_9DA40 && *(v31 - 1) == 32)
            {
              if (number_precedes(1)
                || (unint64_t)v31 > qword_9DA40 && *(v31 - 1) == 35
                || (uint64_t)&v31[-qword_9DA40] >= 2 && *(v31 - 1) == 32 && *(v31 - 2) == 35
                || (BOOL v427 = is_mathematics(), v33) && v427)
              {
                remove_whitespace(0);
                add_seg(16);
                uint64_t v59 = (char *)v27[320];
                char v60 = 42;
                goto LABEL_150;
              }
            }
            add_seg(256);
            v428 = (unsigned char *)v27[320];
            if (nLangIDGlb == 9 && nSubLangIDGlb != 3)
            {
              if (qword_9DA28 == 0x2000) {
                *v428++ = 32;
              }
              *v428++ = 42;
              uint64_t v16 = (unsigned __int8 **)&unk_9D000;
              uint64_t v27 = &unk_9D000;
            }
            unsigned char *v428 = 42;
            v27[320] = v428 + 1;
            if (nLangIDGlb == 7)
            {
              __int16 v429 = lFlags;
              if ((lFlags & 6) == 0)
              {
                v430 = v16[327] + 1;
                if (equals_nocase(v430, "in"))
                {
                  if ((v429 & 0x400) != 0 || !equals_nocase(v430, "interess"))
                  {
                    v428[1] = 105;
                    v27[320] = v428 + 2;
                    goto LABEL_181;
                  }
                }
              }
            }
            goto LABEL_1523;
          }
          add_seg(128);
          if (nLangIDGlb == 12)
          {
            v372 = (unsigned char *)v27[320];
            unsigned char *v372 = 34;
            v27[320] = v372 + 1;
            byte_9D9EC = 1;
            goto LABEL_1360;
          }
          if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
            {
              char v414 = lFlags;
              goto LABEL_1302;
            }
            if (nLangIDGlb != 7)
            {
LABEL_1357:
              uint64_t v27 = &unk_9D000;
              v463 = (char *)qword_9DA00;
              char v464 = 48;
              goto LABEL_1358;
            }
            uint64_t v27 = &unk_9D000;
            v463 = (char *)qword_9DA00;
            char v464 = 124;
          }
          else
          {
            if ((byte_9D9E8 & 1) == 0)
            {
              char v414 = lFlags;
              if ((lFlags & 0x40000000) != 0)
              {
                if (nSubLangIDGlb != 3) {
                  goto LABEL_1357;
                }
LABEL_1302:
                uint64_t v442 = qword_9DA00;
                if ((v414 & 4) == 0)
                {
                  *(unsigned char *)qword_9DA00 = 60;
                  ++v442;
                }
                uint64_t v443 = 0;
                char v444 = 42;
                do
                {
                  *(unsigned char *)(v442 + v443) = v444;
                  char v444 = asc_2A483[v443++ + 5];
                }
                while (v443 != 2);
                v445 = (unsigned char *)(v442 + 2);
                uint64_t v27 = (void *)&unk_9D000;
                goto LABEL_1359;
              }
            }
            uint64_t v27 = &unk_9D000;
            v463 = (char *)qword_9DA00;
            char v464 = 62;
          }
LABEL_1358:
          char *v463 = v464;
          v445 = v463 + 1;
LABEL_1359:
          v27[320] = v445;
          uint64_t v16 = (unsigned __int8 **)&unk_9D000;
LABEL_1360:
          v465 = v16[327];
          v16[327] = v465 + 1;
          if (v465[1] == 30)
          {
            qword_9D9F8 = 1;
            v16[327] = v465 + 2;
          }
          goto LABEL_1728;
        case 0x2Bu:
        case 0x3Du:
        case 0xB1u:
        case 0xD7u:
        case 0xF7u:
          if ((number_precedes(1)
             || (uint64_t)&v31[-qword_9DA40] >= 2 && *(v31 - 1) == 32 && *(v31 - 2) == 35)
            && !is_number(v31)
            || is_mathematics())
          {
            remove_whitespace(0);
          }
          if (nLangIDGlb != 7
            || *v16[327] != 61
            || (lFlags & 0x20000) != 0
            || (byte_9D9E8 & 1) != 0
            || number_follows(1)
            || number_precedes(1))
          {
            add_seg(16);
            unsigned int v110 = (unsigned char *)v27[320];
            *unsigned int v110 = *v16[327];
            v27[320] = v110 + 1;
          }
          else
          {
            add_seg(32);
            uint64_t v415 = 0;
            uint64_t v416 = v27[320];
            char v417 = 34;
            do
            {
              *(unsigned char *)(v416 + v415) = v417;
              char v417 = asc_2A480[++v415];
            }
            while (v415 != 2);
            v418 = (unsigned char *)(v416 + 2);
            v27[320] = v416 + 2;
            v419 = v16[327];
            if (*v419)
            {
              uint64_t v420 = qword_9DA20;
              do
              {
                int v422 = *++v419;
                int v421 = v422;
                if (v422 != 61 && v421 != 30) {
                  break;
                }
                v16[327] = v419;
                int v424 = *v419;
                if (v424 == 30)
                {
                  qword_9D9F8 = (uint64_t)&v418[-v420 + 1];
                  int v425 = 30;
                }
                else
                {
                  *v418++ = v424;
                  v27[320] = v418;
                  v419 = v16[327];
                  int v425 = *v419;
                }
              }
              while (v425);
            }
          }
          if (!v33) {
            goto LABEL_1523;
          }
          if (!number_follows(1)) {
            goto LABEL_298;
          }
          goto LABEL_152;
        case 0x2Cu:
          if ((v33 & 0xC0) == 0 && is_number(v31)) {
            add_seg(64);
          }
          int v141 = nLangIDGlb;
          if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
          {
            uint64_t v143 = qword_9DA18;
          }
          else
          {
            uint64_t v143 = qword_9DA18;
            if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
            {
              if ((qword_9DA18 & 0xC0) != 0) {
                goto LABEL_1297;
              }
              if (qword_9DA18 != 16)
              {
                if (qword_9DA18 != 4) {
                  goto LABEL_703;
                }
                if (*(v16[327] - 1) != 45 || !qword_9DA48 || *(void *)(qword_9DA30 + 24) != 64)
                {
LABEL_997:
                  add_seg(8);
LABEL_998:
                  uint64_t v53 = (char *)v27[320];
                  char v54 = 44;
                  goto LABEL_1521;
                }
              }
              uint64_t v351 = 32;
              goto LABEL_1296;
            }
          }
LABEL_703:
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && v143 == 64) {
            goto LABEL_998;
          }
          if ((v143 & 0xC0) == 0) {
            goto LABEL_712;
          }
          v260 = v16[327];
          int v261 = v260[1];
          if (!v260[1]) {
            goto LABEL_712;
          }
          if ((v261 - 58) > 0xFFFFFFF5)
          {
            v432 = (unsigned char *)v27[320];
            if (nLangIDGlb == 9)
            {
              unsigned char *v432 = get_separator(0);
              v433 = v432 + 1;
LABEL_1403:
              v27[320] = v433;
              goto LABEL_1523;
            }
          }
          else
          {
            if (nLangIDGlb != 7 || v261 != 40 || v260[2] - 58 < 0xFFFFFFF6)
            {
LABEL_712:
              if (v143 == 64)
              {
                v262 = v16[327];
                if ((v262[1] != 32
                   || (int v263 = is_any_number(v262 + 2)) == 0
                   || (v263 + 33) <= 0xE0u && (v263 - 91) <= 0xE5u)
                  && number_follows(1))
                {
                  if (v141 == 9)
                  {
                    char v264 = get_separator(0);
                    goto LABEL_965;
                  }
                  LOBYTE(v51) = stru_B8.segname[(void)pLangGlb + 1];
                  goto LABEL_1438;
                }
              }
              goto LABEL_997;
            }
            v432 = (unsigned char *)v27[320];
          }
          unsigned char *v432 = stru_B8.segname[(void)pLangGlb + 1];
          v433 = v432 + 1;
          goto LABEL_1403;
        case 0x2Du:
          uint64_t v192 = v31[1];
          if (v192 == 46)
          {
            unsigned int v193 = v31[2];
            if (v193 >= 0x21
              && v193 != 160
              && !in(v31[2], 5)
              && (lFlags & 0x800000) == 0
              && (lFlags & 0x7FFE) != 0x7FFE)
            {
              if ((v193 - 58) >= 0xF6u && nLangIDGlb == 9)
              {
                add_seg(4);
                uint64_t v27 = &unk_9D000;
                uint64_t v194 = (char *)qword_9DA00;
                char v195 = -106;
                goto LABEL_1631;
              }
              add_seg(32);
              uint64_t v460 = qword_9DA00;
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
              {
                uint64_t v461 = 0;
                char v462 = 60;
                do
                {
                  *(unsigned char *)(v460 + v461) = v462;
                  char v462 = asc_2A46F[++v461];
                }
                while (v461 != 3);
              }
              else
              {
                uint64_t v461 = 0;
                char v519 = 45;
                do
                {
                  *(unsigned char *)(v460 + v461) = v519;
                  char v519 = asc_2A1CF[++v461];
                }
                while (v461 != 2);
              }
              uint64_t v27 = &unk_9D000;
              qword_9DA00 = v460 + v461;
              uint64_t v16 = (unsigned __int8 **)&unk_9D000;
              ++qword_9DA38;
              byte_9DA54 = 1;
              goto LABEL_1523;
            }
          }
          else if ((v33 & 0x20C0) == 0 && v192 == 44 && v31[2] - 58 >= 0xFFFFFFF6)
          {
            uint64_t v339 = 64;
            goto LABEL_1116;
          }
          if (v33 == 0x2000)
          {
            if (v192 < 0x21
              || v192 == 160
              || (v274 = memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v192, 0x15uLL), v192 != 45)
              && v274)
            {
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
                byte_9D9EC = 0;
              }
LABEL_1117:
              uint64_t v53 = (char *)v27[320];
              char v54 = 45;
              goto LABEL_1521;
            }
          }
          else if (v33 <= 8 && is_number(v31))
          {
            add_seg(16);
            uint64_t v53 = (char *)v27[320];
            char v54 = -106;
            goto LABEL_1521;
          }
          if (!number_follows(1)
            && v192 != 35
            && (v192 != 32 || v31[2] != 35)
            && ((BOOL v377 = is_mathematics(), v378 = qword_9DA40, !v377)
             || (unint64_t)v31 <= qword_9DA40
             || (uint64_t v16 = (unsigned __int8 **)&unk_9D000, v27 = (void *)&unk_9D000, (*(v31 - 1) | 0x80) != 0xA0))
            || !number_precedes(1)
            && ((uint64_t v378 = qword_9DA40, (unint64_t)v31 <= qword_9DA40) || *(v31 - 1) != 35)
            && ((uint64_t)&v31[-qword_9DA40] < 2 || (*(v31 - 1) | 0x80) != 0xA0 || *(v31 - 2) != 35)
            && ((BOOL v380 = is_mathematics(), !v33) || !v380))
          {
            if (v192 == 45)
            {
              uint64_t v381 = v31[2];
              if (v381 == 45)
              {
                if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                {
                  byte_9D9EC = 0;
                  dword_9D9F0 = 0;
                }
                add_seg(32);
                uint64_t v382 = qword_9DA00 + 2;
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                do
                {
                  uint64_t v383 = v382;
                  *(unsigned char *)(v382 - 2) = 45;
                  uint64_t v384 = qword_9DA38++;
                  if (!*(unsigned char *)qword_9DA38) {
                    break;
                  }
                  int v385 = *(unsigned __int8 *)(v384 + 2);
                  uint64_t v382 = v383 + 1;
                }
                while (v385 == 45);
                *(unsigned char *)(v383 - 1) = 45;
                uint64_t v27 = &unk_9D000;
                qword_9DA00 = v383;
                goto LABEL_1523;
              }
              if ((v33 & 0xC8) != 0) {
                goto LABEL_1373;
              }
              if ((v381 < 0x21 || v381 == 160 || in(v381, 9))
                && (*(unsigned __int8 *)(qword_9DA00 - 1) | 2) != 0x2E)
              {
                if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                {
                  byte_9D9EC = 0;
                  dword_9D9F0 = 0;
LABEL_2005:
                  int v614 = 150;
                  goto LABEL_2007;
                }
LABEL_2006:
                int v614 = 151;
                goto LABEL_2007;
              }
            }
            if (v33 == 2)
            {
              BOOL v466 = in(v192, 9);
              int v467 = nLangIDGlb;
              if (v466)
              {
                if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                {
                  byte_9D9EC = 0;
                }
                else if (nLangIDGlb == 7)
                {
                  add_seg(0x2000);
                  v562 = (char *)qword_9DA00;
                  if ((lFlags & 8) == 0)
                  {
                    char v563 = -105;
LABEL_1712:
                    char *v562 = v563;
                    uint64_t v27 = &unk_9D000;
                    qword_9DA00 = (uint64_t)(v562 + 1);
                    dword_9D9F0 = 0;
LABEL_2003:
                    uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                    goto LABEL_1523;
                  }
LABEL_1711:
                  char v563 = 45;
                  goto LABEL_1712;
                }
                add_seg(4);
                v562 = (char *)qword_9DA00;
                goto LABEL_1711;
              }
LABEL_1379:
              BOOL v469 = v467 == 9 && nSubLangIDGlb == 3;
              int v470 = v469;
              if (v469)
              {
                byte_9D9EC = 0;
                dword_9D9F0 = 0;
              }
              if (v33 > 2) {
                goto LABEL_1389;
              }
              if (v33 == 1)
              {
                if (*(v31 - 1) == 46)
                {
LABEL_1389:
                  add_seg(4);
                  uint64_t v27 = &unk_9D000;
                  v471 = (char *)qword_9DA00;
                  char v472 = 45;
LABEL_2002:
                  char *v471 = v472;
                  qword_9DA00 = (uint64_t)(v471 + 1);
                  goto LABEL_2003;
                }
                if (!is_number(v31)) {
                  goto LABEL_2000;
                }
              }
              else if (!is_number(v31))
              {
                if (v33 == 2 && (v192 | 0x80) == 0xA0 && in(v31[2], 9))
                {
                  uint64_t v607 = v31[3];
                  if (v607 < 0x21
                    || (v642 = memchr(")}]>\x9B", v31[3], 6uLL), v607 == 46)
                    || v642
                    || in(v607, 9)
                    && ((unsigned int v643 = v31[4], v643 < 0x21) || (v644 = memchr(")}]>\x9B", v31[4], 6uLL), v643 == 46) || v644))
                  {
                    uint64_t v608 = (uint64_t)&v31[-v378];
                    if (v608 >= 2)
                    {
                      if ((int v609 = *(v31 - 2), in(*(v31 - 2), 9))
                        && (v608 == 2
                         || (uint64_t v610 = *(v31 - 3), v610 < 0x21)
                         || in(v610, 9) && (v608 == 3 || *(v31 - 4) < 0x21u))
                        || v609
                        && ((v611 = memchr(")}]>\x9B", v609, 6uLL), v609 == 46) || v611)
                        && (v608 == 2
                         || (uint64_t v612 = *(v31 - 3), v612 < 0x21)
                         || in(v612, 9)
                         && (v608 == 3
                          || (uint64_t v613 = *(v31 - 4), v613 < 0x21)
                          || in(v613, 9) && (v608 == 4 || *(v31 - 5) <= 0x20u))))
                      {
                        int v614 = 45;
LABEL_2007:
                        process_dash(v614, 0);
                        uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                        uint64_t v27 = (void *)&unk_9D000;
                        goto LABEL_1523;
                      }
                    }
                  }
                }
LABEL_2000:
                if ((unint64_t)qword_9DA28 <= 1)
                {
                  add_seg(4);
                  uint64_t v27 = &unk_9D000;
                  v471 = (char *)qword_9DA00;
                  char v472 = -105;
                  goto LABEL_2002;
                }
                if (v470) {
                  goto LABEL_2005;
                }
                goto LABEL_2006;
              }
              add_seg(16);
              uint64_t v27 = &unk_9D000;
              v471 = (char *)qword_9DA00;
              char v472 = -106;
              goto LABEL_2002;
            }
LABEL_1373:
            int v467 = nLangIDGlb;
            if (v33 == 0x2000 && nLangIDGlb == 9)
            {
              v468 = (unsigned __int8 *)qword_9DA20;
              if (qword_9DA00 - qword_9DA20 == 2 && ((uint64_t)&v31[-v378] < 3 || *(v31 - 3) <= 0x20u))
              {
                v564 = "TO";
                while (1)
                {
                  do
                    int v565 = *v468++;
                  while (v565 == 173 || v565 == 30);
                  if (v565 != *(unsigned __int8 *)v564) {
                    break;
                  }
                  if (++v564 == "")
                  {
                    uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                    uint64_t v27 = (void *)&unk_9D000;
                    if (equals_nocase(v31 + 1, "DAY")
                      || equals_nocase(v31 + 1, "NIGHT")
                      || equals_nocase(v31 + 1, "MORROW"))
                    {
                      goto LABEL_1523;
                    }
                    break;
                  }
                }
              }
              int v467 = 9;
            }
            goto LABEL_1379;
          }
          if (is_mathematics()
            || v192 == 35
            || v192 == 32 && v31[2] == 35
            || (unint64_t)v31 > qword_9DA40 && *(v31 - 1) == 35
            || (uint64_t)&v31[-qword_9DA40] >= 2 && *(v31 - 1) == 32 && *(v31 - 2) == 35)
          {
LABEL_927:
            remove_whitespace(0);
            add_seg(16);
            uint64_t v59 = (char *)v27[320];
            char v60 = -106;
            goto LABEL_150;
          }
          if ((v192 | 0x80) == 0xA0)
          {
            process_dash(45, 0);
            uint64_t v16 = (unsigned __int8 **)&unk_9D000;
            uint64_t v27 = (void *)&unk_9D000;
            goto LABEL_1523;
          }
          if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
          {
            if (nLangIDGlb == 12)
            {
              uint64_t v518 = 16;
              if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0) {
                goto LABEL_1759;
              }
              goto LABEL_1758;
            }
          }
          else
          {
            uint64_t v518 = 16;
            if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0) {
              goto LABEL_1759;
            }
          }
          if (nLangIDGlb == 9 && nSubLangIDGlb == 1) {
            goto LABEL_1760;
          }
LABEL_1758:
          uint64_t v518 = 4;
LABEL_1759:
          add_seg(v518);
LABEL_1760:
          uint64_t v27 = &unk_9D000;
          uint64_t v194 = (char *)qword_9DA00;
          char v195 = 45;
          goto LABEL_1631;
        case 0x2Eu:
          if (v33 - 1 > 1)
          {
            BOOL v198 = 0;
          }
          else
          {
            unsigned int v196 = v31[1];
            BOOL v198 = v196 < 0x21 || v196 == 160;
          }
          if ((v33 & 0x20C0) == 0 && is_number(v31))
          {
            add_seg(64);
            unint64_t v33 = qword_9DA18;
            int v31 = v16[327];
          }
          unsigned int v275 = v31[1];
          if (v33 == 64 && (v275 - 48) <= 9u)
          {
            if (nLangIDGlb == 9)
            {
              if (nSubLangIDGlb == 2)
              {
                uint64_t v53 = (char *)v27[320];
              }
              else
              {
                uint64_t v53 = (char *)v27[320];
                if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
                {
LABEL_509:
                  char v54 = 36;
                  goto LABEL_1521;
                }
              }
              char v54 = stru_B8.segname[(void)pLangGlb + 1];
              goto LABEL_1521;
            }
            if (nLangIDGlb == 12)
            {
              v276 = (unsigned char *)v27[320];
              if ((lFlags & 0x40000) != 0)
              {
                unsigned char *v276 = 47;
                v277 = v276 + 1;
LABEL_1036:
                v27[320] = v277;
                goto LABEL_1523;
              }
            }
            else
            {
              v276 = (unsigned char *)v27[320];
            }
            unsigned char *v276 = get_separator(0);
            v277 = v276 + 1;
            goto LABEL_1036;
          }
          if ((v275 | 2) == 0x2E)
          {
            if (nLangIDGlb != 7) {
              goto LABEL_1559;
            }
            if (v198) {
              goto LABEL_1275;
            }
            if ((v33 & 0xC) == 0 || v275 == 46) {
              goto LABEL_1559;
            }
LABEL_1274:
            if (!in(v31[1], 5)) {
              goto LABEL_1560;
            }
LABEL_1275:
            if ((lFlags & 0x40) == 0)
            {
              add_seg(4);
              v438 = (unsigned char *)v27[320];
              unsigned char *v438 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
              v27[320] = v438 + 1;
              int v31 = v16[327];
              unsigned int v275 = v31[1];
            }
LABEL_1559:
            if (v275 == 46) {
              goto LABEL_1562;
            }
LABEL_1560:
            if (qword_9DA18 == 32 && *(v31 - 1) == 46)
            {
LABEL_1562:
              if (nLangIDGlb == 9
                && nSubLangIDGlb == 3
                && ((BYTE3(lFlags) >> 6) & 1 & ~byte_9D9E8) == 0
                && qword_9DA18 == 64)
              {
                int v520 = 9;
              }
              else
              {
                add_seg(32);
                int v520 = nLangIDGlb;
                if (nLangIDGlb == 12)
                {
                  if ((lFlags & 0x40000) == 0)
                  {
LABEL_1597:
                    v531 = (char *)v27[320];
                    char v532 = 46;
LABEL_1599:
                    char *v531 = v532;
                    uint64_t v74 = v531 + 1;
                    v533 = v16[327];
                    if (!*v533) {
                      goto LABEL_1522;
                    }
                    char v534 = byte_9D9E8 ^ 1;
                    uint64_t v535 = qword_9DA18;
                    while (1)
                    {
                      int v537 = v533[1];
                      v536 = v533 + 1;
                      if (v537 != 46) {
                        goto LABEL_1522;
                      }
                      v16[327] = v536;
                      if (nLangIDGlb == 12)
                      {
                        if ((lFlags & 0x40000) != 0) {
                          goto LABEL_1613;
                        }
                      }
                      else
                      {
                        BOOL v538 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
                        if (v538
                          && ((*(_DWORD *)&v534 & ((BYTE3(lFlags) & 0x40) >> 6) & 1) != 0 || v535 != 64))
                        {
LABEL_1613:
                          char v539 = **(unsigned char **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
                          goto LABEL_1614;
                        }
                      }
                      char v539 = 46;
LABEL_1614:
                      *v74++ = v539;
                      v533 = v16[327];
                      if (!*v533) {
                        goto LABEL_1522;
                      }
                    }
                  }
LABEL_1598:
                  char v532 = **(unsigned char **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
                  v531 = (char *)v27[320];
                  goto LABEL_1599;
                }
              }
              if (v520 != 9
                || nSubLangIDGlb != 3
                || ((BYTE3(lFlags) >> 6) & 1 & ~byte_9D9E8) == 0 && qword_9DA18 == 64)
              {
                goto LABEL_1597;
              }
              goto LABEL_1598;
            }
            int v437 = nLangIDGlb;
            BOOL v523 = nLangIDGlb == 9 && nSubLangIDGlb != 3 || nLangIDGlb == 12;
            if (qword_9DA18 == 0x2000 && v523 && dword_9D9F0)
            {
              if (!v275) {
                goto LABEL_1590;
              }
              if ((v275 + 33) <= 0xE0u && (v275 - 91) < 0xE6u)
              {
                uint64_t v27 = &unk_9D000;
                if (v275 > 0xDE || (v275 - 123) >= 0xE6u)
                {
                  v524 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
                  v525 = (unsigned char *)qword_9DA00;
                  char v528 = *v524;
                  v526 = v524 + 1;
                  char v527 = v528;
                  do
                  {
                    *v525++ = v527;
                    int v529 = *v526++;
                    char v527 = v529;
                  }
                  while (v529);
                  uint64_t v27 = &unk_9D000;
                  qword_9DA00 = (uint64_t)v525;
                  dword_9D9F0 = 0;
                }
LABEL_1590:
                add_seg(32);
                if (nLangIDGlb != 12 || (lFlags & 0x40000) != 0)
                {
                  char v530 = **(unsigned char **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
LABEL_1853:
                  v602 = (unsigned char *)v27[320];
                  unsigned char *v602 = v530;
                  v27[320] = v602 + 1;
                  goto LABEL_1633;
                }
                goto LABEL_1630;
              }
              if (nLangIDGlb == 12)
              {
                v450 = (char *)qword_9DA00;
                if ((lFlags & 0x40000) == 0)
                {
                  char v451 = 46;
LABEL_1327:
                  char *v450 = v451;
                  v180 = v450 + 1;
LABEL_1328:
                  uint64_t v27 = (void *)&unk_9D000;
LABEL_1632:
                  v27[320] = v180;
LABEL_1633:
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                  goto LABEL_1523;
                }
              }
              else
              {
                v450 = (char *)qword_9DA00;
              }
              char v451 = **(unsigned char **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
              goto LABEL_1327;
            }
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
            {
              uint64_t v540 = 8;
              if (qword_9DA18 == 64 && !byte_9D9E8 && (lFlags & 0x40000000) != 0)
              {
LABEL_1621:
                v541 = *(char **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
LABEL_1852:
                char v530 = *v541;
                uint64_t v27 = &unk_9D000;
                goto LABEL_1853;
              }
LABEL_1628:
              add_seg(v540);
LABEL_1629:
              uint64_t v27 = &unk_9D000;
LABEL_1630:
              uint64_t v194 = (char *)v27[320];
              char v195 = 46;
              goto LABEL_1631;
            }
            if (nLangIDGlb == 12)
            {
              if ((lFlags & 0x40000) == 0)
              {
                uint64_t v540 = 32;
                goto LABEL_1628;
              }
              goto LABEL_1627;
            }
            goto LABEL_1625;
          }
          if (v33 == 64)
          {
            if ((v275 | 0x80) != 0xA0) {
              goto LABEL_1241;
            }
          }
          else if (v33 == 2 && (v275 - 58) > 0xF5u)
          {
LABEL_1241:
            if (!v198) {
              goto LABEL_1265;
            }
            goto LABEL_1247;
          }
          if (!v198)
          {
            if (v275 == 46 || (v33 & 0xC) == 0)
            {
              uint64_t v16 = (unsigned __int8 **)&unk_9D000;
              uint64_t v27 = (void *)&unk_9D000;
              goto LABEL_1559;
            }
            uint64_t v16 = (unsigned __int8 **)&unk_9D000;
            uint64_t v27 = &unk_9D000;
            if (nLangIDGlb != 7) {
              goto LABEL_1559;
            }
            goto LABEL_1274;
          }
          if ((!number_follows(1) || !number_precedes(1)) && !is_mathematics())
          {
            if (nLangIDGlb != 7) {
              goto LABEL_1559;
            }
            goto LABEL_1275;
          }
LABEL_1247:
          if (number_follows(1) && number_precedes(1) || is_mathematics())
          {
            remove_whitespace(0);
            add_seg(16);
            uint64_t v59 = (char *)v27[320];
            char v60 = 46;
LABEL_150:
            *uint64_t v59 = v60;
            uint64_t v61 = v59 + 1;
LABEL_151:
            v27[320] = v61;
            goto LABEL_152;
          }
LABEL_1265:
          int v437 = nLangIDGlb;
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            if (v33 == 64 && !byte_9D9E8 && (lFlags & 0x40000000) != 0) {
              goto LABEL_1621;
            }
            goto LABEL_1626;
          }
LABEL_1625:
          if (v437 != 9)
          {
LABEL_1627:
            uint64_t v540 = 4;
            goto LABEL_1628;
          }
LABEL_1626:
          uint64_t v540 = 8;
          goto LABEL_1628;
        case 0x2Fu:
          uint64_t v199 = off_95000;
          if (v33 == 2 && ((unsigned int v200 = v31[1], v201 = 1, v200 < 0x21) || v200 == 160)
            || (int v201 = 0, v202 = 0, is_mathematics()))
          {
            remove_whitespace(0);
            unint64_t v33 = qword_9DA18;
            int v202 = v201;
          }
          uint64_t v203 = &unk_9D000;
          if (!v33)
          {
            int v332 = v16[327][1];
            if (v332 != 9 && v332 != 160 && v332 != 32) {
              goto LABEL_931;
            }
          }
          int v204 = byte_9D9E8;
          if (byte_9D9E8) {
            goto LABEL_543;
          }
          if (is_any_number(v16[327] + 1) == 47) {
            goto LABEL_931;
          }
          if (v33 == 64 && qword_9DA48)
          {
            if (*(void *)(qword_9DA30 + 24) == 4 && **(unsigned char **)qword_9DA30 == 47)
            {
LABEL_931:
              add_seg(4);
              goto LABEL_932;
            }
          }
          else
          {
LABEL_543:
            if (!v33 && is_number(v16[327] + 1)) {
              goto LABEL_1000;
            }
          }
          if (!is_mathematics() || v33 == 64 && nLangIDGlb == 9 && nSubLangIDGlb != 2 && is_number(v16[327] + 1))
          {
            BOOL v205 = number_follows(0);
            if (v205 && number_precedes(0))
            {
              if (qword_9DA48) {
                char v206 = v202;
              }
              else {
                char v206 = 1;
              }
              if ((v206 & 1) != 0
                || (uint64_t v207 = (char **)qword_9DA30, *(void *)(qword_9DA30 + 24) != 2)
                || (uint64_t v208 = *(void *)(qword_9DA30 + 8), v208 != 1) && (v208 != 2 || !byte_9DA50)
                || (uint64_t v209 = *(void *)(qword_9DA30 + 40)) == 0
                || *(void *)(v209 + 24) != 64
                || (v210 = *(char ***)(v209 + 40)) != 0 && memchr("|/\xF7", **v210, 4uLL))
              {
LABEL_1911:
                if (nLangIDGlb == 9) {
                  int v618 = v202 ^ 1;
                }
                else {
                  int v618 = 0;
                }
                if (v618 == 1 && nSubLangIDGlb == 2)
                {
                  v619 = v16[327];
                  unsigned int v620 = v619[1];
                  if (v620 < 0x21 || v620 == 160)
                  {
LABEL_1952:
                    remove_whitespace(1);
                    if (((v202 & 1) != 0 || qword_9DA28 == 1 && v203[329] && **(unsigned char **)qword_9DA30 == 11)
                      && ((int v634 = *((_DWORD *)v199 + 268), v634 == 7) || v634 == 9 && nSubLangIDGlb == 3)
                      && !strchr((char *)v16[327] + 1, 61))
                    {
                      uint64_t v635 = 4;
                    }
                    else
                    {
                      uint64_t v635 = 16;
                    }
                    add_seg(v635);
                    if (v202)
                    {
                      BOOL v638 = nLangIDGlb == 9 && nSubLangIDGlb != 2;
                      if ((nLangIDGlb == 12 || v638) && !strchr((char *)(qword_9DA38 + 1), 61))
                      {
                        uint64_t v27 = &unk_9D000;
                        v413 = (char *)qword_9DA00;
                        char v639 = 124;
                      }
                      else
                      {
                        uint64_t v27 = &unk_9D000;
                        v413 = (char *)qword_9DA00;
                        char v639 = 47;
                      }
                      char *v413 = v639;
                      int v412 = 1;
                      goto LABEL_1978;
                    }
                    uint64_t v27 = &unk_9D000;
                    uint64_t v640 = qword_9DA00;
                    *(unsigned char *)qword_9DA00 = 47;
                    int v641 = 1;
                    goto LABEL_2010;
                  }
                  int v621 = 0;
                  uint64_t v622 = 2;
                  do
                  {
                    if (v620 == 47) {
                      ++v621;
                    }
                    unsigned int v620 = v619[v622];
                    if (v620 < 0x21) {
                      break;
                    }
                    ++v622;
                  }
                  while (v620 != 160);
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                  uint64_t v203 = (void *)&unk_9D000;
                  uint64_t v199 = off_95000;
                  if (v621 == 1 && qword_9DA00 - qword_9DA20 <= 2)
                  {
                    uint64_t v27 = &unk_9D000;
                    while (1)
                    {
                      int v623 = *v619;
                      if (v623 == 47)
                      {
                        add_seg(0);
                      }
                      else
                      {
                        if (!*v619 || (v623 - 58) < 0xFFFFFFF6)
                        {
                          qword_9DA38 = (uint64_t)(v619 - 1);
                          if ((v202 & 1) == 0) {
                            goto LABEL_298;
                          }
LABEL_152:
                          int v62 = 0;
LABEL_153:
                          skip_whitespace(v62);
                          goto LABEL_1523;
                        }
                        add_seg(64);
                        char v624 = upper_digit(*(unsigned char *)qword_9DA38);
                        uint64_t v625 = qword_9DA00;
                        *(unsigned char *)qword_9DA00 = v624;
                        qword_9DA00 = v625 + 1;
                      }
                      v619 = (unsigned __int8 *)++qword_9DA38;
                    }
                  }
                }
                if (nSubLangIDGlb == 2) {
                  int v626 = 0;
                }
                else {
                  int v626 = v618;
                }
                if (v626 == 1)
                {
                  v627 = v16[327];
                  unsigned int v628 = v627[1];
                  if (v628 < 0x21 || v628 == 160) {
                    goto LABEL_1958;
                  }
                  int v629 = 0;
                  uint64_t v630 = 2;
                  do
                  {
                    if (v628 == 47) {
                      ++v629;
                    }
                    unsigned int v628 = v627[v630];
                    if (v628 < 0x21) {
                      break;
                    }
                    ++v630;
                  }
                  while (v628 != 160);
                  if (v629 != 1 || qword_9DA00 - qword_9DA20 > 2)
                  {
LABEL_1958:
                    if ((lFlags & 0x20000) != 0)
                    {
                      v636 = (unsigned char *)qword_9DA00;
                    }
                    else
                    {
                      v636 = (unsigned char *)qword_9DA00;
                      if ((lFlags & 0x200) == 0 && nSubLangIDGlb != 3)
                      {
                        *(unsigned char *)qword_9DA00 = stru_B8.segname[(void)pLangGlb + 3];
                        ++v636;
                      }
                    }
                    unsigned char *v636 = 124;
                    uint64_t v27 = &unk_9D000;
                    qword_9DA00 = (uint64_t)(v636 + 1);
                    uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                    if ((v202 & 1) == 0) {
                      goto LABEL_298;
                    }
                    goto LABEL_152;
                  }
                  uint64_t v631 = qword_9DA00 + 1;
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                  uint64_t v27 = &unk_9D000;
                  while (1)
                  {
                    int v632 = *v627;
                    if (v632 == 47)
                    {
                      char v633 = 45;
                    }
                    else
                    {
                      if (!*v627 || (v632 - 58) < 0xF6u)
                      {
                        qword_9DA38 = (uint64_t)(v627 - 1);
                        if ((v202 & 1) == 0) {
                          goto LABEL_298;
                        }
                        goto LABEL_152;
                      }
                      char v633 = upper_digit(v632);
                    }
                    *(unsigned char *)(v631 - 1) = v633;
                    qword_9DA00 = v631;
                    v627 = (unsigned __int8 *)++qword_9DA38;
                    ++v631;
                  }
                }
                goto LABEL_1952;
              }
              if (nLangIDGlb == 9
                && nSubLangIDGlb != 2
                && ((lFlags & 0x40000000) == 0 ? (int v211 = 1) : (int v211 = v204), v211 == 1))
              {
                v207[3] = (unsigned char *)&stru_20;
                v212 = *v207;
                char v213 = 52;
              }
              else
              {
                if (byte_9DA50 != 1)
                {
                  v207[3] = 0;
                  goto LABEL_1910;
                }
                v212 = *v207;
                char v213 = 31;
              }
              char *v212 = v213;
              (*v207)[1] = 0;
LABEL_1910:
              uint64_t v16 = (unsigned __int8 **)&unk_9D000;
              goto LABEL_1911;
            }
            int v358 = nLangIDGlb;
            BOOL v360 = nLangIDGlb == 9 && nSubLangIDGlb == 1;
            if (nLangIDGlb != 12 && !v360)
            {
              char v361 = v204 ^ 1;
              if (nLangIDGlb != 7) {
                char v361 = 1;
              }
              if ((v361 & 1) == 0)
              {
                add_seg(16);
                uint64_t v27 = (void *)&unk_9D000;
LABEL_932:
                v333 = (unsigned char *)v27[320];
                unsigned char *v333 = 47;
                v27[320] = v333 + 1;
                skip_whitespace(0);
                if (v202) {
                  goto LABEL_152;
                }
                goto LABEL_298;
              }
              uint64_t v436 = 4;
              goto LABEL_1545;
            }
            if (v205 && number_precedes(0))
            {
              if (v202)
              {
                add_seg(16);
                int v412 = 0;
                uint64_t v27 = &unk_9D000;
                v413 = (char *)qword_9DA00;
                *(unsigned char *)qword_9DA00 = 124;
LABEL_1978:
                qword_9DA00 = (uint64_t)(v413 + 1);
                skip_whitespace(v412);
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                goto LABEL_152;
              }
              if ((lFlags & 0x8000000) == 0)
              {
                if (qword_9DA48)
                {
                  v474 = (void *)qword_9DA30;
                  if (*(void *)(qword_9DA30 + 24) == 2)
                  {
                    uint64_t v475 = *(void *)(qword_9DA30 + 8);
                    if (v475 == 1 || v475 == 2 && byte_9DA50)
                    {
                      uint64_t v476 = *(void *)(qword_9DA30 + 40);
                      if (v476)
                      {
                        if (*(void *)(v476 + 24) == 64)
                        {
                          v477 = *(char ***)(v476 + 40);
                          if (!v477 || !memchr("|/\xF7", **v477, 4uLL))
                          {
                            if (byte_9DA50 == 1)
                            {
                              *(unsigned char *)void *v474 = 31;
                              *(unsigned char *)(*v474 + 1) = 0;
                            }
                            else
                            {
                              v474[3] = 0;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              add_seg(16);
              int v641 = 0;
              uint64_t v27 = &unk_9D000;
              uint64_t v640 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = 124;
LABEL_2010:
              qword_9DA00 = v640 + 1;
              skip_whitespace(v641);
              uint64_t v16 = (unsigned __int8 **)&unk_9D000;
LABEL_298:
              if (is_mathematics()) {
                goto LABEL_152;
              }
              goto LABEL_1523;
            }
            if (v358 == 12)
            {
              int v435 = byte_9D9EC;
              if ((lFlags & 0x40000) == 0)
              {
                if ((lFlags & 0xE) != 0) {
                  int v435 = 1;
                }
                if ((v435 | byte_9DA54)) {
                  goto LABEL_1264;
                }
                if (v33 == 0x2000
                  && *(unsigned char *)qword_9DA20
                  && (*(unsigned char *)qword_9DA20 & 0xDFu) - 91 >= 0xFFFFFFE6
                  && qword_9DA00 - qword_9DA20 == 1)
                {
                  add_list_element();
                  uint64_t v568 = qword_9DA30;
                  if (qword_9DA30)
                  {
                    *(void *)qword_9DA30 = *(void *)((char *)&stru_20.maxprot + (void)pLangGlb);
                    *(void *)(v568 + 8) = 1;
                    *(void *)(v568 + 24) = 32;
                  }
                  byte_9D9EC = 1;
LABEL_1264:
                  uint64_t v436 = 32;
LABEL_1544:
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
LABEL_1545:
                  uint64_t v27 = &unk_9D000;
                  goto LABEL_1546;
                }
                uint64_t v436 = 32;
                add_seg(32);
                uint64_t v27 = &unk_9D000;
                uint64_t v570 = qword_9DA00;
                *(unsigned char *)qword_9DA00 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
                qword_9DA00 = v570 + 1;
LABEL_1751:
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
LABEL_1546:
                add_seg(v436);
                uint64_t v517 = qword_9DA00;
                *(unsigned char *)qword_9DA00 = 47;
                qword_9DA00 = v517 + 1;
                if (v202) {
                  goto LABEL_152;
                }
                goto LABEL_298;
              }
              if ((lFlags & 6) != 0) {
                int v435 = 1;
              }
              if (((v435 | byte_9DA54) & 1) == 0)
              {
                if (v33 != 0x2000
                  || !*(unsigned char *)qword_9DA20
                  || (*(unsigned char *)qword_9DA20 & 0xDFu) - 91 < 0xFFFFFFE6
                  || qword_9DA00 - qword_9DA20 != 1)
                {
                  add_seg(32);
                  uint64_t v27 = &unk_9D000;
                  uint64_t v571 = qword_9DA00;
                  *(unsigned char *)qword_9DA00 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
                  qword_9DA00 = v571 + 1;
                  uint64_t v436 = 4;
                  goto LABEL_1751;
                }
                add_list_element();
                uint64_t v569 = qword_9DA30;
                if (qword_9DA30)
                {
                  *(void *)qword_9DA30 = *(void *)((char *)&stru_20.maxprot + (void)pLangGlb);
                  *(void *)(v569 + 8) = 1;
                  *(void *)(v569 + 24) = 32;
                }
                byte_9D9EC = 1;
              }
            }
            uint64_t v436 = 4;
            goto LABEL_1544;
          }
LABEL_1000:
          add_seg(16);
          v355 = (unsigned char *)v27[320];
          unsigned char *v355 = *v16[327];
          v27[320] = v355 + 1;
          if (v202) {
            goto LABEL_152;
          }
          goto LABEL_298;
        case 0x30u:
        case 0x31u:
        case 0x32u:
        case 0x33u:
        case 0x34u:
        case 0x35u:
        case 0x36u:
        case 0x37u:
        case 0x38u:
        case 0x39u:
          add_seg(64);
          if (qword_9DA18 == 2048)
          {
            size_t v56 = (char *)v27[320];
            *size_t v56 = *v16[327];
            int64_t v57 = off_95000;
            goto LABEL_913;
          }
          int64_t v57 = off_95000;
          if ((byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
          {
            unsigned __int8 v137 = *v16[327];
            goto LABEL_674;
          }
          int v83 = nLangIDGlb;
          if (nLangIDGlb != 7)
          {
            BOOL v84 = nLangIDGlb == 9 && nSubLangIDGlb == 2;
            BOOL v85 = v84;
            if (nLangIDGlb != 10 && !v85) {
              goto LABEL_223;
            }
          }
          if (v27[320] != qword_9DA20 || (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
            goto LABEL_223;
          }
          if (!is_lower_num(v16[327]))
          {
            int v83 = nLangIDGlb;
LABEL_223:
            if (v83 == 9 && nSubLangIDGlb == 1)
            {
              uint64_t v86 = *v16[327];
              if ((v86 - 58) < 0xFFFFFFF6)
              {
                int v87 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * v86);
                goto LABEL_911;
              }
              v252 = &asc_2A2CA[v86];
LABEL_910:
              int v87 = v252 - 48;
              goto LABEL_911;
            }
            uint64_t v117 = *v16[327];
            if (v83 == 12)
            {
              if ((v117 - 58) >= 0xF6u)
              {
                v252 = &a123456789[v117];
                goto LABEL_910;
              }
              int v87 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * v117);
LABEL_911:
              char v140 = *v87;
              size_t v56 = (char *)v27[320];
LABEL_912:
              *size_t v56 = v140;
LABEL_913:
              v27[320] = v56 + 1;
              goto LABEL_914;
            }
            unsigned __int8 v137 = *v16[327];
LABEL_674:
            char v253 = upper_digit(v137);
            size_t v56 = (char *)v27[320];
            *size_t v56 = v253;
            goto LABEL_913;
          }
          qword_9DA18 = 128;
          v138 = v16[327];
          if (*v138 == 46)
          {
            int v139 = v138[1];
            if (!v138[1] || !memchr(",;:!?", v138[1], 6uLL) && (v139 != 32 || v138[2] != 45 || v138[3] != 32))
            {
              add_seg(0);
              size_t v56 = (char *)v27[320];
              char v140 = 32;
              goto LABEL_912;
            }
          }
LABEL_914:
          if (*((_DWORD *)v57 + 268) == 9 && nSubLangIDGlb != 3 && (lFlags & 0x80) == 0)
          {
            v329 = v16[327];
            if (equals_nocase(v329 + 1, "ST") && !in(v329[3], 11))
            {
              v330 = (char *)v27[320];
              char v331 = 124;
            }
            else
            {
              if (!equals_nocase(v329 + 1, "TH") || in(v329[3], 11)) {
                goto LABEL_1523;
              }
              v330 = (char *)v27[320];
              char v331 = 52;
            }
            char *v330 = v331;
            v27[320] = v330 + 1;
            v16[327] += 2;
            add_seg(0);
          }
LABEL_1523:
          int v31 = v16[327] + 1;
          v16[327] = v31;
          unsigned __int8 v32 = *v31;
          if (!*v31) {
            break;
          }
          continue;
        case 0x3Au:
          if (v33 == 2)
          {
            unsigned int v214 = v31[1];
            if (v214 < 0x21 || v214 == 160)
            {
              int v215 = 1;
              v216 = off_95000;
              if (number_follows(1) && number_precedes(1)) {
                goto LABEL_905;
              }
              goto LABEL_901;
            }
          }
          else if ((v33 & 0xC0) != 0)
          {
            v216 = off_95000;
            if (is_number(v31 + 1)) {
              goto LABEL_956;
            }
            int v215 = 0;
LABEL_901:
            if (is_mathematics() && (unint64_t)v31 > qword_9DA40 && *(v31 - 1) == 32)
            {
              if (v215)
              {
LABEL_905:
                remove_whitespace(0);
                int v328 = 1;
LABEL_1150:
                if (*((_DWORD *)v216 + 268) == 9 && nSubLangIDGlb == 1)
                {
                  add_seg(32);
                  uint64_t v405 = 0;
                  uint64_t v406 = v27[320];
                  char v407 = 33;
                  do
                  {
                    *(unsigned char *)(v406 + v405) = v407;
                    char v407 = asc_246B3[++v405];
                  }
                  while (v405 != 2);
                  v27[320] = v406 + 2;
                  if (v328) {
                    goto LABEL_152;
                  }
                }
                else
                {
                  add_seg(16);
                  v408 = (unsigned char *)v27[320];
                  unsigned char *v408 = 58;
                  v27[320] = v408 + 1;
                  if (v328) {
                    goto LABEL_152;
                  }
                }
                goto LABEL_1523;
              }
LABEL_956:
              if (timespec_follows(v31 + 1))
              {
                uint64_t v341 = 32;
                if (*((_DWORD *)v216 + 268) == 9 && nSubLangIDGlb == 1)
                {
                  if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0) {
                    goto LABEL_963;
                  }
                  uint64_t v341 = 4;
                }
                add_seg(v341);
LABEL_963:
                v342 = (unsigned char *)v27[320];
                unsigned char *v342 = 58;
                v27[320] = v342 + 1;
                if (v16[327][2] - 58 > 0xFFFFFFF5) {
                  goto LABEL_1523;
                }
                add_seg(64);
                char v264 = upper_digit(0x30u);
LABEL_965:
                v343 = (unsigned char *)v27[320];
                unsigned char *v343 = v264;
                uint64_t v74 = v343 + 1;
                goto LABEL_1522;
              }
              if (is_mathematics())
              {
                int v328 = 0;
                goto LABEL_1150;
              }
              int v453 = *((_DWORD *)v216 + 268);
              if (v453 != 9 || nSubLangIDGlb == 2)
              {
                if (v453 != 12 || !(byte_9D9E8 & 1 | ((lFlags & 0x40000000) == 0))) {
                  goto LABEL_1399;
                }
              }
              else if (((BYTE3(lFlags) >> 6) & 1 & ~byte_9D9E8) != 0)
              {
LABEL_1399:
                add_seg(8);
LABEL_1400:
                uint64_t v27 = &unk_9D000;
                uint64_t v194 = (char *)qword_9DA00;
                char v195 = 58;
                goto LABEL_1631;
              }
              if (v33 != 2)
              {
                unsigned int v473 = *(unsigned __int8 *)(qword_9DA38 + 1);
                if (v473 >= 0x21 && v473 != 160) {
                  goto LABEL_1400;
                }
              }
              goto LABEL_1399;
            }
LABEL_237:
            add_seg(8);
            uint64_t v53 = (char *)v27[320];
            char v54 = 58;
            goto LABEL_1521;
          }
          int v215 = 0;
          v216 = off_95000;
          goto LABEL_901;
        case 0x3Cu:
          uint64_t v144 = v31[1];
          if (v144 != 61)
          {
            if (v144 == 62)
            {
              if ((byte_9D9E8 & 1) != 0 || number_precedes(1)) {
                remove_whitespace(0);
              }
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && (byte_9D9E8 & 1) == 0)
              {
                add_seg(4);
                v431 = (unsigned char *)v27[320];
                unsigned char *v431 = -117;
                v27[320] = v431 + 1;
                add_seg(4);
                v399 = (char *)v27[320];
                char v400 = -101;
              }
              else
              {
                add_seg(16);
                int v145 = (unsigned char *)v27[320];
                v146 = v145 + 1;
                if (nLangIDGlb == 7)
                {
                  *int v145 = 33;
                  v27[320] = v146;
                  uint64_t v147 = 32;
                  goto LABEL_1234;
                }
                *int v145 = 60;
                v27[320] = v146;
                add_seg(32);
                v399 = (char *)v27[320];
                char v400 = 62;
              }
              goto LABEL_1235;
            }
            char v334 = byte_9D9E8;
            if (byte_9D9E8)
            {
              int v335 = nLangIDGlb;
            }
            else
            {
              int v362 = number_precedes(0);
              int v335 = nLangIDGlb;
              if (!v362) {
                goto LABEL_1466;
              }
            }
            if (v335 == 7)
            {
              if (equals_nocase(v31 + 1, "PT56>") && in(v31[6], 9))
              {
                if (v33 == 2)
                {
                  unsigned int v487 = *(unsigned __int8 *)(qword_9DA00 - 1);
                  if ((v487 > 0x20 || ((1 << v487) & 0x180000200) == 0) && v487 != 160) {
                    goto LABEL_1465;
                  }
                  if (qword_9DA28 != 16)
                  {
                    remove_whitespace(1);
                    if (byte_9D9E8 == 1)
                    {
                      add_seg(2);
                      uint64_t v488 = qword_9DA00;
                      *(unsigned char *)qword_9DA00 = 127;
                      qword_9DA00 = v488 + 1;
                    }
                  }
                }
                else if (v33 != 16 && (v33 != 0x2000 || (*(unsigned char *)(qword_9DA00 - 1) & 0xDFu) - 65 >= 0x1A))
                {
LABEL_1465:
                  int v335 = 7;
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                  goto LABEL_1466;
                }
                add_seg(32);
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                uint64_t v27 = &unk_9D000;
                uint64_t v489 = qword_9DA00;
                *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
                qword_9DA00 = v489 + 1;
                uint64_t v490 = qword_9DA38;
                qword_9DA38 += 5;
                if (byte_9D9E8 == 1)
                {
                  unsigned int v493 = *(unsigned __int8 *)(v490 + 6);
                  v491 = (char *)(v490 + 6);
                  unsigned int v492 = v493;
                  if (v493)
                  {
                    do
                    {
                      if (v492 <= 0xDE && v492 - 123 <= 0xFFFFFFE5 && v492 != 173 && v492 != 30) {
                        break;
                      }
                      qword_9DA38 = (uint64_t)v491;
                      add_basis_char(*v491, 0);
                      v491 = (char *)(qword_9DA38 + 1);
                      unsigned int v492 = *(unsigned __int8 *)(qword_9DA38 + 1);
                    }
                    while (*(unsigned char *)(qword_9DA38 + 1));
                  }
                }
                goto LABEL_1523;
              }
              int v335 = 7;
            }
LABEL_1466:
            if (equals_nocase(v31 + 1, "PT"))
            {
              int v495 = v31[3];
              v494 = (char *)(v31 + 3);
              if ((v495 - 58) >= 0xFFFFFFF6)
              {
                if (strchr(v494, 62))
                {
                  add_seg(1);
                  unint64_t v496 = 0;
                  for (uint64_t j = v16[327] + 3; ; ++j)
                  {
                    v16[327] = j;
                    int v498 = *j;
                    if (!*j || v498 == 62) {
                      break;
                    }
                    char v499 = v498 - 49;
                    if ((v499 & 0xF8) != 0) {
                      uint64_t v500 = 0;
                    }
                    else {
                      uint64_t v500 = 1 << v499;
                    }
                    v496 |= v500;
                  }
                  v501 = &brl_set_ansi[v496];
                  if (pCharmapGlb) {
                    v501 = (char *)(pCharmapGlb + *v501);
                  }
                  if (*v501 <= 0x1Fu)
                  {
                    uint64_t v27 = &unk_9D000;
                    uint64_t v502 = qword_9DA00;
                    *(unsigned char *)qword_9DA00 = 32;
                    qword_9DA00 = v502 + 1;
                    uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                    goto LABEL_1523;
                  }
                  char v503 = brl_set_ansi[v496];
                  v504 = (unsigned char *)qword_9DA00;
                  uint64_t v505 = qword_9DA00;
                  *(unsigned char *)qword_9DA00 = v503;
                  qword_9DA00 = v505 + 1;
                  if (nLangIDGlb == 12 && v496 == 8)
                  {
                    uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                    uint64_t v27 = (void *)&unk_9D000;
                    if (!is_supersub()) {
                      goto LABEL_1523;
                    }
                    byte_9D9EC = 1;
                  }
                  else if ((nLangIDGlb - 9) <= 1 && v496 == 44)
                  {
                    uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                    uint64_t v27 = (void *)&unk_9D000;
                    if (!is_supersub()) {
                      goto LABEL_1523;
                    }
                  }
                  else
                  {
                    uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                    uint64_t v27 = &unk_9D000;
                    if (nLangIDGlb != 7 || v496 > 0x29 || ((1 << v496) & 0x20200001000) == 0) {
                      goto LABEL_1523;
                    }
                    if (!is_supersub())
                    {
                      if (((unint64_t)qword_9DA28 < 3 || (qword_9DA28 & 0x1E024) != 0)
                        && (lFlags & 1) == 0
                        && in(*(unsigned __int8 *)(qword_9DA38 + 1), 9)
                        && !is_mathematics())
                      {
                        v504[1] = v503;
                        qword_9DA00 = (uint64_t)(v504 + 2);
                        unsigned char *v504 = stru_B8.segname[(void)pLangGlb + 3];
                      }
                      goto LABEL_1523;
                    }
                  }
LABEL_1728:
                  process_supersub();
                  goto LABEL_1523;
                }
              }
            }
            if (v334)
            {
              if (v335 != 7) {
                goto LABEL_1515;
              }
            }
            else if (!number_precedes(0) || v335 != 7)
            {
LABEL_1510:
              if (!v144
                || v144 != 32
                && v144 != 160
                && !memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v144, 0x15uLL))
              {
                add_seg(4);
                uint64_t v27 = &unk_9D000;
                uint64_t v53 = (char *)qword_9DA00;
                char v54 = -117;
                goto LABEL_1521;
              }
              if (!number_precedes(1))
              {
                char v515 = 0;
                goto LABEL_1526;
              }
LABEL_1515:
              remove_whitespace(0);
              char v515 = byte_9D9E8;
              int v335 = nLangIDGlb;
              if (byte_9D9E8 == 1 && nLangIDGlb == 7)
              {
                if (v16[327][1] == 61)
                {
                  add_seg(32);
                  uint64_t v27 = &unk_9D000;
                  uint64_t v281 = qword_9DA00;
                  __int16 v282 = 14624;
                  goto LABEL_1519;
                }
LABEL_1530:
                add_seg(16);
                uint64_t v27 = &unk_9D000;
                v439 = (char *)qword_9DA00;
                char v440 = 60;
                goto LABEL_1531;
              }
LABEL_1526:
              if ((v515 & 1) == 0 && v335 == 9 && nSubLangIDGlb == 3)
              {
                add_seg(4);
                uint64_t v27 = &unk_9D000;
                v439 = (char *)qword_9DA00;
                char v440 = -117;
                goto LABEL_1531;
              }
              goto LABEL_1530;
            }
            if (in(v144, 9))
            {
              if (v33 != 2)
              {
                if (v33 != 16 && (v33 != 0x2000 || (*(unsigned char *)(qword_9DA00 - 1) & 0xDFu) - 65 >= 0x1A)) {
                  goto LABEL_1509;
                }
LABEL_1501:
                add_seg(32);
                uint64_t v27 = &unk_9D000;
                uint64_t v508 = qword_9DA00;
                *(unsigned char *)qword_9DA00 = *v16[327];
                qword_9DA00 = v508 + 1;
                if (byte_9D9E8 == 1)
                {
                  v509 = v16[327];
                  unsigned int v512 = v509[1];
                  v510 = (char *)(v509 + 1);
                  unsigned int v511 = v512;
                  if (v512)
                  {
                    do
                    {
                      if (v511 <= 0xDE && v511 - 123 <= 0xFFFFFFE5 && v511 != 173 && v511 != 30) {
                        break;
                      }
                      v16[327] = (unsigned __int8 *)v510;
                      add_basis_char(*v510, 0);
                      v513 = v16[327];
                      unsigned int v514 = v513[1];
                      v510 = (char *)(v513 + 1);
                      unsigned int v511 = v514;
                    }
                    while (v514);
                  }
                }
                goto LABEL_1523;
              }
              unsigned int v506 = *(unsigned __int8 *)(qword_9DA00 - 1);
              if (v506 <= 0x20 && ((1 << v506) & 0x180000200) != 0 || v506 == 160)
              {
                if (qword_9DA28 != 16)
                {
                  remove_whitespace(1);
                  if (byte_9D9E8 == 1)
                  {
                    add_seg(2);
                    uint64_t v507 = qword_9DA00;
                    *(unsigned char *)qword_9DA00 = 127;
                    qword_9DA00 = v507 + 1;
                  }
                }
                goto LABEL_1501;
              }
            }
LABEL_1509:
            if (v334) {
              goto LABEL_1515;
            }
            goto LABEL_1510;
          }
          if ((byte_9D9E8 & 1) != 0 || number_precedes(1)) {
            remove_whitespace(0);
          }
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && (byte_9D9E8 & 1) == 0)
          {
            add_seg(4);
            v217 = (char *)v27[320];
            char v401 = -117;
            goto LABEL_1232;
          }
          add_seg(16);
          v217 = (char *)v27[320];
          if (nLangIDGlb == 7) {
            char v218 = 57;
          }
          else {
            char v218 = 60;
          }
          goto LABEL_1119;
        case 0x3Eu:
          if (v31[1] == 61)
          {
            if ((byte_9D9E8 & 1) != 0 || number_precedes(1)) {
              remove_whitespace(0);
            }
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && (byte_9D9E8 & 1) == 0)
            {
              add_seg(4);
              v217 = (char *)v27[320];
              char v401 = -101;
LABEL_1232:
              char *v217 = v401;
              uint64_t v147 = 16;
            }
            else
            {
              add_seg(16);
              v217 = (char *)v27[320];
              if (nLangIDGlb == 7) {
                char v218 = 111;
              }
              else {
                char v218 = 62;
              }
LABEL_1119:
              char *v217 = v218;
              uint64_t v147 = 32;
            }
            v27[320] = v217 + 1;
LABEL_1234:
            add_seg(v147);
            v399 = (char *)v27[320];
            char v400 = 61;
LABEL_1235:
            char *v399 = v400;
            v27[320] = v399 + 1;
            ++v16[327];
LABEL_1533:
            if ((byte_9D9E8 & 1) != 0 || number_follows(1)) {
              goto LABEL_152;
            }
            goto LABEL_1523;
          }
          char v278 = byte_9D9E8 ^ 1;
          if (v33 == 2) {
            char v278 = 0;
          }
          if (v278)
          {
            add_seg(4);
            uint64_t v53 = (char *)v27[320];
            char v54 = -101;
            goto LABEL_1521;
          }
          if ((byte_9D9E8 & 1) != 0 || number_precedes(1))
          {
            remove_whitespace(0);
            char v279 = byte_9D9E8;
            int v280 = nLangIDGlb;
            if (byte_9D9E8 == 1 && nLangIDGlb == 7)
            {
              if (v16[327][1] == 61)
              {
                add_seg(32);
                uint64_t v281 = v27[320];
                __int16 v282 = 28448;
LABEL_1519:
                *(_WORD *)uint64_t v281 = v282;
                ++v16[327];
                *(unsigned char *)(v281 + 2) = 61;
                v516 = (unsigned char *)(v281 + 3);
                goto LABEL_1532;
              }
              goto LABEL_1282;
            }
          }
          else
          {
            char v279 = 0;
            int v280 = nLangIDGlb;
          }
          if ((v279 & 1) == 0 && v280 == 9 && nSubLangIDGlb == 3)
          {
            add_seg(4);
            v439 = (char *)v27[320];
            char v440 = -101;
LABEL_1531:
            char *v439 = v440;
            v516 = v439 + 1;
LABEL_1532:
            v27[320] = v516;
            goto LABEL_1533;
          }
LABEL_1282:
          add_seg(16);
          v439 = (char *)v27[320];
          char v440 = 62;
          goto LABEL_1531;
        case 0x41u:
        case 0x42u:
        case 0x43u:
        case 0x44u:
        case 0x45u:
        case 0x46u:
        case 0x47u:
        case 0x48u:
        case 0x49u:
        case 0x4Au:
        case 0x4Bu:
        case 0x4Cu:
        case 0x4Du:
        case 0x4Eu:
        case 0x4Fu:
        case 0x50u:
        case 0x51u:
        case 0x52u:
        case 0x53u:
        case 0x54u:
        case 0x55u:
        case 0x56u:
        case 0x57u:
        case 0x58u:
        case 0x59u:
        case 0x5Au:
        case 0x8Au:
        case 0x8Cu:
        case 0xC0u:
        case 0xC1u:
        case 0xC2u:
        case 0xC3u:
        case 0xC4u:
        case 0xC5u:
        case 0xC6u:
        case 0xC7u:
        case 0xC8u:
        case 0xC9u:
        case 0xCAu:
        case 0xCBu:
        case 0xCCu:
        case 0xCDu:
        case 0xCEu:
        case 0xCFu:
        case 0xD0u:
        case 0xD1u:
        case 0xD2u:
        case 0xD3u:
        case 0xD4u:
        case 0xD5u:
        case 0xD6u:
        case 0xD8u:
        case 0xD9u:
        case 0xDAu:
        case 0xDBu:
        case 0xDCu:
        case 0xDDu:
        case 0xDEu:
          if (v32 == 72 && v33 == 64 && v31[1] - 58 >= 0xFFFFFFF6)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 || nLangIDGlb == 12) {
              goto LABEL_235;
            }
            goto LABEL_237;
          }
          if (!no_abbrev() || !no_locution()) {
            goto LABEL_1523;
          }
          if (qword_9DA18 != 0x2000 && (qword_9DA18 != 4 || *(v16[327] - 1) != 45)) {
            dword_9D9F0 = 0;
          }
          if (byte_9D9E8 == 1 && nLangIDGlb == 7 && (qword_9DA18 & 0xC0) != 0)
          {
            int v40 = *v16[327];
            if (v40 == 197 || v40 == 181)
            {
              add_seg(2);
              int v41 = (unsigned char *)v27[320];
              *int v41 = 127;
              v27[320] = v41 + 1;
            }
          }
          add_seg(0x2000);
          BOOL v42 = v16[327];
          if (*v42 >= 0x5Bu) {
            byte_9DA60 = 1;
          }
          if (qword_9DA18 == 2048) {
            goto LABEL_1691;
          }
          if (nLangIDGlb != 12 && nLangIDGlb != 9)
          {
            uint64_t v98 = v27[320] - qword_9DA20;
            if (v98)
            {
              int v99 = dword_9DA68;
              if (dword_9DA68 > 1) {
                goto LABEL_263;
              }
              if (v98 >= 4
                && (lFlags & 0x100000) == 0
                && (unsigned __int16)lFlags != 0xFFFFLL
                && !upperchar_follows((uint64_t)v42, 1))
              {
                add_seg(2);
                v363 = (unsigned char *)v27[320];
                unsigned char *v363 = 33;
                v27[320] = v363 + 1;
                int v364 = dword_9DA68;
                v365 = (void *)qword_9DA30;
                v366 = memchr("CQX", **(char **)qword_9DA30, 4uLL);
                if (v364)
                {
                  if (v366 && (~(_WORD)lFlags & 0x7FFE) != 0) {
                    insert_list_element(v365, *(const char **)((char *)&stru_20.filesize + (void)pLangGlb), 2);
                  }
                }
                else
                {
                  if (v366 && (~(_WORD)lFlags & 0x7FFE) != 0)
                  {
                    insert_list_element(v365, *(const char **)((char *)&stru_20.maxprot + (void)pLangGlb), 2);
                    v365 = (void *)qword_9DA30;
                  }
                  insert_list_element(v365, *(const char **)((char *)&stru_20.maxprot + (void)pLangGlb), 2);
                  uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                  uint64_t v27 = &unk_9D000;
                }
                add_seg(0x2000);
                v434 = (unsigned char *)v27[320];
                unsigned char *v434 = 36;
                v27[320] = v434 + 1;
                int v100 = 1;
                goto LABEL_1690;
              }
              if (v99) {
LABEL_263:
              }
                int v100 = v99 + 1;
              else {
                int v100 = 2;
              }
            }
            else
            {
              if (v42[1] != 45 || v42[2] >= 0x21u) {
                goto LABEL_1689;
              }
              int v100 = dword_9DA68 + 2;
            }
LABEL_1690:
            dword_9DA68 = v100;
LABEL_1691:
            v553 = (unsigned char *)v27[320];
            unsigned char *v553 = *v16[327];
            uint64_t v67 = v553 + 1;
            v27[320] = v67;
            if (!dword_9D9F0) {
              goto LABEL_1523;
            }
            v554 = v16[327];
            if (v554[1] != 45) {
              goto LABEL_1523;
            }
            unsigned int v555 = v554[2];
            if (v555 && (v555 <= 0xDE ? (BOOL v556 = v555 - 123 > 0xFFFFFFE5) : (BOOL v556 = 1), v556))
            {
              if (nLangIDGlb == 9 && (nSubLangIDGlb & 0xFFFFFFFE) != 2)
              {
                v557 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
                char v560 = *v557;
                v558 = v557 + 1;
                char v559 = v560;
                do
                {
                  *v67++ = v559;
                  int v561 = *v558++;
                  char v559 = v561;
                }
                while (v561);
                goto LABEL_1703;
              }
            }
            else if (nLangIDGlb != 9 || nSubLangIDGlb != 2)
            {
              goto LABEL_1523;
            }
            goto LABEL_1706;
          }
          if ((lFlags & 0x100000) != 0 || dword_9D9F0) {
            goto LABEL_1689;
          }
          int v43 = v42[1];
          if (!v42[1]) {
            goto LABEL_1682;
          }
          if ((v43 + 33) > 0xE0u || (v43 - 91) > 0xE5u) {
            goto LABEL_1060;
          }
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
            goto LABEL_1682;
          }
          if (v43 == 46)
          {
            unsigned int v373 = v42[2];
            if (v42[2]
              && ((v373 + 33) > 0xE0u || (v373 - 91) >= 0xE6u)
              && v42[3] == 46)
            {
              unsigned int v374 = v42[4];
              if (v42[4])
              {
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                uint64_t v27 = &unk_9D000;
                if (v374 <= 0xDE && v374 - 123 <= 0xFFFFFFE5 && v373 < 0xDF)
                {
LABEL_1060:
                  v375 = *(const char **)&stru_68.sectname[(void)pLangGlb];
                  dword_9D9F0 = 1;
                  v376 = (char *)v27[320];
                  if (v376 == (char *)qword_9DA20)
                  {
LABEL_1687:
                    add_list_element();
                    uint64_t v551 = qword_9DA30;
                    if (qword_9DA30)
                    {
                      size_t v552 = strlen(v375);
                      *(void *)qword_9DA30 = v375;
                      *(void *)(v551 + 8) = v552;
                      *(void *)(v551 + 24) = 2;
                    }
                    goto LABEL_1689;
                  }
                  goto LABEL_1683;
                }
              }
              else
              {
                uint64_t v16 = (unsigned __int8 **)&unk_9D000;
                uint64_t v27 = &unk_9D000;
                if (v373 < 0xDF) {
                  goto LABEL_1060;
                }
              }
            }
          }
          else if (v43 == 39)
          {
            unsigned __int8 v44 = v42[2];
            if (v44)
            {
              if ((v44 + 33) > 0xE0u || (v44 - 91) >= 0xE6u) {
                goto LABEL_1060;
              }
            }
          }
LABEL_1682:
          v375 = *(const char **)((char *)&stru_20.filesize + (void)pLangGlb);
          v376 = (char *)v27[320];
          if (v376 == (char *)qword_9DA20)
          {
            if (upperchar_follows((uint64_t)v42, 0)) {
              goto LABEL_1687;
            }
LABEL_1689:
            int v100 = dword_9DA68 + 1;
            goto LABEL_1690;
          }
LABEL_1683:
          char v549 = *v375;
          v548 = (unsigned __int8 *)(v375 + 1);
          char v547 = v549;
          do
          {
            *v376++ = v547;
            int v550 = *v548++;
            char v547 = v550;
          }
          while (v550);
          v27[320] = v376;
          goto LABEL_1689;
        case 0x5Bu:
          if ((lFlags & 0x2000000) != 0 && v31[1] - 58 <= 0xFFFFFFF5)
          {
            v219 = matching_brace_pos(v31);
            if (v219 > v31 && *v219 == 93)
            {
              add_seg(0);
              byte_9DA58 = 1;
              goto LABEL_1523;
            }
          }
          if (byte_9D9E8) {
            uint64_t v239 = 16;
          }
          else {
            uint64_t v239 = 4;
          }
          add_seg(v239);
          v240 = (unsigned char *)v27[320];
          unsigned char *v240 = *v16[327];
          v27[320] = v240 + 1;
          v241 = v16[327];
          unsigned int v242 = v241[1];
          if (v242 > 0x77)
          {
            if (v242 != 160 && v242 != 120) {
              goto LABEL_152;
            }
          }
          else if (v242 != 9 && v242 != 32)
          {
            goto LABEL_152;
          }
          if (v241[2] != 93) {
            goto LABEL_152;
          }
          add_seg(1);
          v302 = v16[327] + 1;
          v16[327] = v302;
          unsigned __int8 v303 = *v302;
          v304 = (unsigned __int8 *)v27[320];
          unsigned __int8 *v304 = v303;
          v27[320] = v304 + 1;
          if (byte_9D9E8) {
            uint64_t v305 = 16;
          }
          else {
            uint64_t v305 = 4;
          }
          add_seg(v305);
          v306 = v16[327] + 1;
          v16[327] = v306;
          LOBYTE(v51) = *v306;
          goto LABEL_1438;
        case 0x5Du:
          if (byte_9DA58 == 1)
          {
            add_seg(0);
            byte_9DA58 = 0;
            goto LABEL_1523;
          }
          remove_whitespace(0);
          if (byte_9D9E8) {
            uint64_t v283 = 16;
          }
          else {
            uint64_t v283 = 4;
          }
          add_seg(v283);
          uint64_t v53 = (char *)v27[320];
          char v54 = 93;
          goto LABEL_1521;
        case 0x5Fu:
          BOOL v222 = nLangIDGlb == 9 && nSubLangIDGlb != 3 || nLangIDGlb == 12;
          if (v33 == 0x2000 && v222 && dword_9D9F0 != 0)
          {
            unsigned int v284 = v31[1];
            if (v31[1])
            {
              if ((v284 + 33) > 0xE0u || (v284 - 91) >= 0xE6u)
              {
                v367 = *(unsigned char **)&stru_2E8.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb)];
                uint64_t v74 = (char *)v27[320];
                char v370 = *v367;
                v368 = v367 + 1;
                char v369 = v370;
                do
                {
                  *v74++ = v369;
                  int v371 = *v368++;
                  char v369 = v371;
                }
                while (v371);
                goto LABEL_1522;
              }
              if (v284 > 0xDE || (v284 - 123) >= 0xE6u)
              {
                v285 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
                v286 = (unsigned char *)v27[320];
                char v289 = *v285;
                v287 = v285 + 1;
                char v288 = v289;
                do
                {
                  *v286++ = v288;
                  int v290 = *v287++;
                  char v288 = v290;
                }
                while (v290);
                v27[320] = v286;
                dword_9D9F0 = 0;
              }
            }
            add_seg(32);
            v291 = *(unsigned char **)&stru_2E8.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb)];
            uint64_t v74 = (char *)v27[320];
            char v294 = *v291;
            v292 = v291 + 1;
            char v293 = v294;
            do
            {
              *v74++ = v293;
              int v295 = *v292++;
              char v293 = v295;
            }
            while (v295);
            goto LABEL_1522;
          }
          add_seg(4);
          uint64_t v53 = (char *)v27[320];
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            for (int k = v16[327][1]; k == 95; int k = v226[2])
            {
              *v53++ = 95;
              v226 = v16[327];
              v16[327] = v226 + 1;
            }
          }
          char v54 = 95;
          goto LABEL_1521;
        case 0x61u:
        case 0x62u:
        case 0x63u:
        case 0x64u:
        case 0x65u:
        case 0x66u:
        case 0x67u:
        case 0x68u:
        case 0x69u:
        case 0x6Au:
        case 0x6Bu:
        case 0x6Cu:
        case 0x6Du:
        case 0x6Eu:
        case 0x6Fu:
        case 0x70u:
        case 0x71u:
        case 0x72u:
        case 0x73u:
        case 0x74u:
        case 0x75u:
        case 0x76u:
        case 0x77u:
        case 0x78u:
        case 0x79u:
        case 0x7Au:
        case 0x9Au:
        case 0x9Cu:
        case 0xE0u:
        case 0xE1u:
        case 0xE2u:
        case 0xE3u:
        case 0xE4u:
        case 0xE5u:
        case 0xE6u:
        case 0xE7u:
        case 0xE8u:
        case 0xE9u:
        case 0xEAu:
        case 0xEBu:
        case 0xECu:
        case 0xEDu:
        case 0xEEu:
        case 0xEFu:
        case 0xF0u:
        case 0xF1u:
        case 0xF2u:
        case 0xF3u:
        case 0xF4u:
        case 0xF5u:
        case 0xF6u:
        case 0xF8u:
        case 0xF9u:
        case 0xFAu:
        case 0xFBu:
        case 0xFCu:
        case 0xFDu:
        case 0xFEu:
          if (v32 == 226)
          {
            if ((v31[1] & 0xFC) == 0xA0 && (v31[2] & 0xC0) == 0x80)
            {
              add_seg(1);
              v48 = v16[327];
              unsigned __int8 v49 = v48[2];
              v48 += 2;
              unint64_t v50 = v49 & 0x3F | ((unint64_t)(*(v48 - 1) & 3) << 6);
              v16[327] = v48;
              uint64_t v51 = &brl_set_ansi[v50];
              uint64_t v52 = &brl_set_ansi[v50];
              if (pCharmapGlb) {
                uint64_t v52 = (char *)(pCharmapGlb + *v51);
              }
              if (*v52 > 0x1Fu) {
                goto LABEL_1437;
              }
LABEL_127:
              uint64_t v53 = (char *)v27[320];
              char v54 = 32;
LABEL_1521:
              *uint64_t v53 = v54;
              uint64_t v74 = v53 + 1;
LABEL_1522:
              v27[320] = v74;
              goto LABEL_1523;
            }
          }
          else if (v32 == 239 && v31[1] == 187 && v31[2] == 191)
          {
            add_seg(0);
            v16[327] += 2;
            goto LABEL_127;
          }
          if (v33 == 2)
          {
            if (qword_9DA28 == 64 || qword_9DA28 == 128)
            {
              if (v32 != 120) {
                goto LABEL_154;
              }
LABEL_146:
              if ((v31[1] | 0x80) == 0xA0 && (is_number(v31 + 2) || v31[2] == 35))
              {
                remove_whitespace(0);
                add_seg(16);
                uint64_t v59 = (char *)v27[320];
                char v60 = -41;
                goto LABEL_150;
              }
              goto LABEL_154;
            }
            BOOL v58 = is_mathematics();
            char v55 = 0;
            if (v32 == 120 && v58) {
              goto LABEL_146;
            }
          }
          else
          {
            if (v33 != 64)
            {
LABEL_154:
              char v55 = 0;
              goto LABEL_155;
            }
            if (v32 == 104 && v31[1] - 58 >= 0xFFFFFFF6)
            {
              if (nLangIDGlb == 9 && nSubLangIDGlb != 2 || nLangIDGlb == 12)
              {
LABEL_235:
                if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
                {
                  uint64_t v53 = (char *)v27[320];
                  char v54 = 104;
                  goto LABEL_1521;
                }
              }
              else if (nLangIDGlb == 9 && nSubLangIDGlb == 2 && (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
              {
LABEL_679:
                uint64_t v109 = 0x2000;
                goto LABEL_1436;
              }
              goto LABEL_237;
            }
            char v55 = 1;
          }
LABEL_155:
          if (nLangIDGlb != 7)
          {
            if (nLangIDGlb == 9 && v32 == 115 && !in(v31[1], 11))
            {
              char v63 = nSubLangIDGlb == 1 ? v55 : 0;
              if ((v63 & 1) != 0 || v33 == 0x2000 && dword_9D9F0)
              {
                add_seg(32);
                uint64_t v64 = 0;
                uint64_t v65 = v27[320];
                char v66 = 46;
                do
                {
                  *(unsigned char *)(v65 + v64) = v66;
                  char v66 = aS_30[++v64];
                }
                while (v64 != 2);
                uint64_t v67 = (unsigned char *)(v65 + 2);
LABEL_1703:
                v27[320] = v67;
LABEL_1706:
                dword_9D9F0 = 0;
                goto LABEL_1523;
              }
            }
            goto LABEL_365;
          }
          if (v33 == 4)
          {
            if (*(v31 - 1) != 181 && (byte_9D9E8 & 1) != 0)
            {
              int v68 = 7;
              unint64_t v33 = 4;
              goto LABEL_348;
            }
          }
          else
          {
            if (byte_9D9E8)
            {
LABEL_192:
              int v68 = 7;
              goto LABEL_348;
            }
            if ((v33 & 0xC2) != 0)
            {
LABEL_227:
              int v88 = (v33 & 0xCC) != 0 || v33 == 2 && (qword_9DA28 & 0xC0) != 0 || (lFlags & 0x40) == 0;
              if (is_measurement(v31, v88, 0))
              {
                add_seg(32);
                if ((byte_9D9E8 & 1) == 0 && (!qword_9DA28 || no_exception(1, byte_4B94B, v16[327])))
                {
                  uint64_t v118 = (unsigned char *)v27[320];
                  *uint64_t v118 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
                  v27[320] = v118 + 1;
                }
                for (m = (char *)v16[327]; ; v16[327] = (unsigned __int8 *)m)
                {
                  add_basis_char(*m, 0);
                  v120 = v16[327];
                  unsigned int v122 = v120[1];
                  m = (char *)(v120 + 1);
                  unsigned int v121 = v122;
                  if (!v122 || v121 <= 0xDE && v121 - 123 <= 0xFFFFFFE5 && v121 != 173 && v121 != 30) {
                    break;
                  }
                }
                goto LABEL_1523;
              }
              int v68 = nLangIDGlb;
              unint64_t v33 = qword_9DA18;
LABEL_348:
              if (v68 == 7 && v33 <= 8)
              {
                uint64_t v123 = v16[327];
                v124 = "gen.";
                v125 = v123;
                do
                {
                  do
                    int v126 = *v125++;
                  while (v126 == 173 || v126 == 30);
                  if (v126 != *v124) {
                    goto LABEL_365;
                  }
                  ++v124;
                }
                while (v124 != "");
                if ((lFlags & 4) == 0)
                {
                  int v128 = v123[4];
                  if (v123[4])
                  {
                    if ((v128 + 33) > 0xE0u
                      || (v128 - 91) > 0xE5u
                      || (v128 | 0x80) == 0xA0
                      && (unsigned __int8 v129 = v123[5]) != 0
                      && ((v129 + 33) > 0xE0u || (v129 - 91) >= 0xE6u))
                    {
                      v16[327] = v123 + 3;
                      add_seg(32);
                      uint64_t v299 = 0;
                      uint64_t v300 = v27[320];
                      char v301 = 38;
                      do
                      {
                        *(unsigned char *)(v300 + v299) = v301;
                        char v301 = aN_37[++v299];
                      }
                      while (v299 != 3);
                      uint64_t v74 = (char *)(v300 + 3);
                      goto LABEL_1522;
                    }
                  }
                }
              }
LABEL_365:
              if (!no_abbrev() || !no_locution()) {
                goto LABEL_1523;
              }
              if (qword_9DA18 != 0x2000)
              {
                dword_9D9F0 = 0;
                if (nLangIDGlb == 9 && (lFlags & 0x100000) == 0)
                {
                  unsigned __int8 v130 = v16[327][1];
                  if (v130)
                  {
                    if ((v130 + 33) > 0xE0u || (v130 - 91) >= 0xE6u)
                    {
                      add_seg(32);
                      BOOL v131 = (unsigned char *)v27[320];
                      *BOOL v131 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
                      v27[320] = v131 + 1;
                    }
                  }
                }
              }
              add_seg(0x2000);
              LODWORD(v51) = *v16[327];
              if (v51 >= 0x7B) {
                byte_9DA60 = 1;
              }
              if (qword_9DA18 != 2048)
              {
                if (dword_9D9F0)
                {
                  v132 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
                  uint64_t v51 = (char *)v27[320];
                  char v135 = *v132;
                  v133 = v132 + 1;
                  char v134 = v135;
                  do
                  {
                    *v51++ = v134;
                    int v136 = *v133++;
                    char v134 = v136;
                  }
                  while (v136);
                  v27[320] = v51;
                  dword_9D9F0 = 0;
                  LODWORD(v51) = *v16[327];
                }
                if (v51 == 156)
                {
                  uint64_t v53 = (char *)v27[320];
                  char v54 = -116;
                  goto LABEL_1521;
                }
                if (v51 == 154)
                {
                  uint64_t v53 = (char *)v27[320];
                  char v54 = -118;
                  goto LABEL_1521;
                }
                LOBYTE(v51) = v51 & 0xDF;
              }
              goto LABEL_1438;
            }
          }
          BOOL v72 = (v33 & 0xC) != 0 && (unint64_t)qword_9DA28 < 0x21;
          if (v33 && !v72) {
            goto LABEL_192;
          }
          goto LABEL_227;
        case 0x7Bu:
          uint64_t v148 = matching_brace_pos(v31);
          if (v148 > v31)
          {
            int v149 = v148;
            if (*v148 == 125)
            {
              add_seg(0);
              brl_process_command(v16[327] + 1);
              v16[327] = v149;
              goto LABEL_1523;
            }
          }
          if (byte_9D9E8) {
            uint64_t v254 = 16;
          }
          else {
            uint64_t v254 = 4;
          }
          add_seg(v254);
          uint64_t v59 = (char *)v27[320];
          char v60 = 123;
          goto LABEL_150;
        case 0x7Cu:
        case 0x7Eu:
          if (byte_9D9E8 != 1 || nLangIDGlb != 7)
          {
            uint64_t v109 = 4;
            goto LABEL_1436;
          }
          remove_whitespace(0);
          add_seg(16);
          v157 = v16[327];
          int v158 = *v157;
          if (v158 == 126 && v157[1] == 126)
          {
            BOOL v159 = (unsigned char *)v27[320];
            *BOOL v159 = 33;
            v27[320] = v159 + 1;
            ++v16[327];
            add_seg(32);
            BOOL v160 = (unsigned char *)v27[320];
            LOBYTE(v158) = 63;
          }
          else
          {
            BOOL v160 = (unsigned char *)v27[320];
          }
          *BOOL v160 = v158;
          uint64_t v61 = v160 + 1;
          goto LABEL_151;
        case 0x7Du:
          remove_whitespace(0);
          if (byte_9D9E8) {
            uint64_t v150 = 16;
          }
          else {
            uint64_t v150 = 4;
          }
          add_seg(v150);
          uint64_t v53 = (char *)v27[320];
          char v54 = 125;
          goto LABEL_1521;
        case 0x7Fu:
          goto LABEL_462;
        case 0x82u:
        case 0x91u:
        case 0x92u:
          if ((v33 & 0x20C0) == 0) {
            goto LABEL_845;
          }
          unsigned __int8 v89 = v31[1];
          if (!in(v89, 9) && (v89 - 58) < 0xF6u) {
            goto LABEL_845;
          }
          uint64_t v90 = v31 + 2;
          while (2)
          {
            if (in(v89, 9)) {
              goto LABEL_246;
            }
            if (!v89) {
              goto LABEL_843;
            }
            if ((v89 - 58) >= 0xF6u)
            {
LABEL_246:
              unsigned __int8 v91 = *v90++;
              unsigned __int8 v89 = v91;
              continue;
            }
            break;
          }
          if (v89 - 130 > 0x10
            || ((1 << (v89 + 126)) & 0x18001) == 0
            || (char v307 = *v90, !in(*v90, 9)) && (v307 - 58) <= 0xF5u)
          {
LABEL_843:
            if (!qword_9DA48
              || *(void *)(qword_9DA30 + 24) != 4
              || (**(unsigned __int8 **)qword_9DA30 - 130 <= 0x10
                ? (BOOL v308 = ((1 << (**(unsigned char **)qword_9DA30 + 126)) & 0x18001) == 0)
                : (BOOL v308 = 1),
                  v308 || (uint64_t v309 = *(void *)(qword_9DA30 + 40)) == 0 || (*(_DWORD *)(v309 + 24) & 0x1E0C0) == 0))
            {
              unsigned __int8 v32 = 39;
            }
          }
LABEL_845:
          int v96 = v32;
          char v95 = -111;
LABEL_846:
          char v97 = -110;
          goto LABEL_861;
        case 0x84u:
        case 0x93u:
        case 0x94u:
          if ((v33 & 0x20C0) == 0) {
            goto LABEL_860;
          }
          unsigned __int8 v92 = v31[1];
          if (!in(v92, 9) && (v92 - 58) < 0xF6u) {
            goto LABEL_860;
          }
          v93 = v31 + 2;
          while (2)
          {
            if (in(v92, 9)) {
              goto LABEL_254;
            }
            if (!v92) {
              goto LABEL_858;
            }
            if ((v92 - 58) >= 0xF6u)
            {
LABEL_254:
              unsigned __int8 v94 = *v93++;
              unsigned __int8 v92 = v94;
              continue;
            }
            break;
          }
          if (v92 - 132 > 0x10
            || ((1 << (v92 + 124)) & 0x18001) == 0
            || (char v310 = *v93, !in(*v93, 9)) && (v310 - 58) <= 0xF5u)
          {
LABEL_858:
            if (!qword_9DA48
              || *(void *)(qword_9DA30 + 24) != 4
              || (**(unsigned __int8 **)qword_9DA30 - 132 <= 0x10
                ? (BOOL v311 = ((1 << (**(unsigned char **)qword_9DA30 + 124)) & 0x18001) == 0)
                : (BOOL v311 = 1),
                  v311 || (uint64_t v312 = *(void *)(qword_9DA30 + 40)) == 0 || (*(_DWORD *)(v312 + 24) & 0x1E0C0) == 0))
            {
              unsigned __int8 v32 = 34;
            }
          }
LABEL_860:
          int v96 = v32;
          char v95 = -109;
          char v97 = -108;
LABEL_861:
          process_quotes(v95, v96, v97);
          goto LABEL_1523;
        case 0x8Bu:
        case 0x9Bu:
          char v95 = -111;
          int v96 = 39;
          goto LABEL_846;
        case 0x96u:
          int v227 = nLangIDGlb;
          int v228 = nSubLangIDGlb;
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            byte_9D9EC = 0;
            dword_9D9F0 = 0;
          }
          if (byte_9D9E8 == 1) {
            goto LABEL_927;
          }
          if (number_follows(1) && number_precedes(1)) {
            goto LABEL_641;
          }
          int v230 = v31[1];
          if ((v230 | 2) == 0x2E) {
            goto LABEL_949;
          }
          BOOL v232 = v227 != 9 || v228 != 3;
          if (v230 == 150) {
            goto LABEL_1170;
          }
          goto LABEL_1166;
        case 0x97u:
          int v227 = nLangIDGlb;
          int v233 = nSubLangIDGlb;
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            byte_9D9EC = 0;
            dword_9D9F0 = 0;
          }
          if (byte_9D9E8 == 1) {
            goto LABEL_927;
          }
          if (number_follows(1) && number_precedes(1))
          {
LABEL_641:
            int v235 = 45;
LABEL_1168:
            int v410 = 0;
LABEL_1169:
            process_dash(v235, v410);
            goto LABEL_1523;
          }
          int v338 = v31[1];
          if ((v338 | 2) == 0x2E)
          {
LABEL_949:
            uint64_t v339 = 32;
LABEL_1116:
            add_seg(v339);
            goto LABEL_1117;
          }
          BOOL v232 = v227 != 9 || v233 != 3;
          if (v338 != 151)
          {
LABEL_1166:
            if (!v232)
            {
              int v235 = 150;
              goto LABEL_1168;
            }
          }
LABEL_1170:
          int v410 = v227 != 7 && v232;
          int v235 = 151;
          goto LABEL_1169;
        case 0xA0u:
          BOOL v151 = nLangIDGlb != 7 || byte_9D9E8 == 0;
          if (v151 || (v33 & 0xC0) == 0 && ((v33 & 0x2000) == 0 || dword_9DA68 || v27[320] - qword_9DA20 > 4)) {
            goto LABEL_440;
          }
          if (is_measurement(v31 + 1, 1, 1)) {
            goto LABEL_730;
          }
          int v31 = v16[327];
          unsigned int v265 = v31[1];
          if (v265 - 137 <= 0x3C && ((1 << (v265 + 119)) & 0x1000108000000001) != 0) {
            goto LABEL_730;
          }
          if (!v31[1]) {
            goto LABEL_440;
          }
          if (v265 == 37 || memchr("\x80$\xA5\xA2\xA3\xA4", v31[1], 7uLL)) {
            goto LABEL_730;
          }
          if ((v265 > 0xDE || v265 - 123 >= 0xFFFFFFE6) && (unsigned __int8 v567 = v31[2]) != 0)
          {
            uint64_t v16 = (unsigned __int8 **)&unk_9D000;
            uint64_t v27 = (void *)&unk_9D000;
            if ((v567 + 33) > 0xE0u || (v567 - 91) >= 0xE6u)
            {
LABEL_730:
              add_seg(2);
              uint64_t v53 = (char *)v27[320];
              if (byte_9DA50 == 1) {
                *v53++ = 31;
              }
              goto LABEL_732;
            }
          }
          else
          {
            uint64_t v16 = (unsigned __int8 **)&unk_9D000;
            uint64_t v27 = (void *)&unk_9D000;
          }
LABEL_440:
          int v152 = nLangIDGlb;
          BOOL v153 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
          if (v153 || (qword_9DA18 & 0xC0) == 0 || (int v154 = v31[1], v154 != 37) && v154 != 176 && v154 != 137)
          {
            add_seg(2);
            v255 = (unsigned char *)v27[320];
            unsigned char *v255 = *v16[327];
            v27[320] = v255 + 1;
            goto LABEL_121;
          }
          if (byte_9DA50 == 1)
          {
            add_seg(2);
            v155 = (unsigned char *)v27[320];
            unsigned char *v155 = 31;
            v27[320] = v155 + 1;
            int v152 = nLangIDGlb;
          }
          if (byte_9D9E8 == 1 && v152 == 7) {
            goto LABEL_452;
          }
          goto LABEL_1523;
        case 0xA7u:
          if (nLangIDGlb != 7)
          {
            if (nLangIDGlb != 9 || nSubLangIDGlb != 3)
            {
              v297 = v31 + 1;
              do
              {
                if (*v297 != 167) {
                  break;
                }
                v16[327] = v297;
              }
              while (*v297++);
            }
            add_seg(4);
            uint64_t v53 = (char *)v27[320];
            char v54 = -89;
            goto LABEL_1521;
          }
          add_seg(32);
          v236 = (unsigned char *)v27[320];
          unsigned char *v236 = 48;
          v27[320] = v236 + 1;
          v237 = v16[327] + 1;
          if (is_any_number(v237) || *v237 == 167)
          {
            int v62 = 1;
            goto LABEL_153;
          }
          v236[1] = 35;
          uint64_t v74 = v236 + 2;
          goto LABEL_1522;
        case 0xB2u:
        case 0xB3u:
        case 0xB9u:
        case 0xBCu:
        case 0xBDu:
        case 0xBEu:
          if (qword_9DA28 == 64) {
            remove_whitespace(1);
          }
          if (nLangIDGlb == 12
            && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
            && (qword_9DA18 == 64 || qword_9DA18 == 2 && qword_9DA28 == 64)
            && **(unsigned __int8 **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * *v16[327]) == stru_B8.segname[(void)pLangGlb + 3])
          {
            add_seg(128);
            uint64_t v73 = *(void *)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * *v16[327]);
            uint64_t v74 = (char *)v27[320];
            char v75 = *(unsigned char *)(v73 + 1);
            v76 = (unsigned __int8 *)(v73 + 2);
            do
            {
              *v74++ = v75;
              int v77 = *v76++;
              char v75 = v77;
            }
            while (v77);
          }
          else
          {
            add_seg(128);
            v78 = *(unsigned char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * *v16[327]);
            uint64_t v74 = (char *)v27[320];
            char v81 = *v78;
            v79 = v78 + 1;
            char v80 = v81;
            do
            {
              *v74++ = v80;
              int v82 = *v79++;
              char v80 = v82;
            }
            while (v82);
          }
          goto LABEL_1522;
        case 0xDFu:
          if (v33 == 0x2000
            && nLangIDGlb == 7
            && (dword_9DA68 > 1
             || (char v347 = *(v31 - 1)) != 0
             && ((v347 + 33) > 0xE0u || (v347 - 91) >= 0xE6u)
             && (unsigned __int8 v348 = v31[1]) != 0
             && ((v348 + 33) > 0xE0u || (v348 - 91) >= 0xE6u)))
          {
            ++dword_9DA68;
          }
          add_seg(0x2000);
          uint64_t v53 = (char *)v27[320];
          if (nSubLangIDGlb != 2)
          {
            char v54 = -33;
            goto LABEL_1521;
          }
          uint64_t v349 = 0;
          char v350 = 83;
          do
          {
            v53[v349] = v350;
            char v350 = aSs_0[++v349];
          }
          while (v349 != 2);
          uint64_t v74 = v53 + 2;
          goto LABEL_1522;
        case 0xFFu:
          goto LABEL_679;
        default:
          if (v32 >= 0x20u)
          {
            BOOL v268 = (v33 & 0xC0) != 0 && byte_9D9E8 != 0 && nLangIDGlb == 7;
            if (v268
              && (v32 - 137 <= 0x3C && ((1 << (v32 + 119)) & 0x1000108000000001) != 0
               || v32 == 37
               || memchr("\x80$\xA5\xA2\xA3\xA4", v32, 7uLL)))
            {
              add_seg(2);
              v269 = (unsigned char *)v27[320];
              unsigned char *v269 = 127;
              v27[320] = v269 + 1;
            }
            uint64_t v169 = 4;
          }
          else
          {
            uint64_t v169 = 1;
          }
          add_seg(v169);
          v270 = (unsigned char *)v27[320];
          unsigned char *v270 = *v16[327];
          v27[320] = v270 + 1;
          byte_9D9EC = 0;
          goto LABEL_1523;
      }
      break;
    }
  }
  add_seg(0);
  qword_9D9F8 = 0;
  v27[320] = qword_9DA10;
  qword_9DA28 = 0;
  byte_9DA94 = 0;
  dword_9DA80 = 0;
  dword_9D9F0 = 0;
  uint64_t v645 = qword_9DA48;
  qword_9DA30 = qword_9DA48;
  if (qword_9DA48)
  {
    uint64_t v646 = 0;
    while (1)
    {
      v647 = *(unsigned __int8 **)v645;
      v26[324] = *(unsigned __int8 **)v645;
      uint64_t v648 = *(void *)(v645 + 16);
      qword_9D9F8 = v648;
      v649 = *(unsigned __int8 ***)(v645 + 48);
      if (v649) {
        uint64_t v650 = (uint64_t)v649[3];
      }
      else {
        uint64_t v650 = 0;
      }
      qword_9DA98 = v650;
      uint64_t v651 = *(void *)(v645 + 24);
      if ((v651 & 0xFFFFFFFFFFFFDF0FLL) != 0) {
        byte_9DA94 = 0;
      }
      if (v651 > 127) {
        break;
      }
      if (v651 <= 15)
      {
        switch(v651)
        {
          case 0:
            goto LABEL_2922;
          case 1:
            unsigned __int8 v654 = *v647;
            v653 = v647 + 1;
            unsigned __int8 v652 = v654;
            do
            {
              std_char((char)v652);
              int v655 = *v653++;
              unsigned __int8 v652 = v655;
            }
            while (v655);
            goto LABEL_2922;
          case 2:
            int v662 = nLangIDGlb;
            int v663 = dword_9D9F0;
            if (nLangIDGlb != 7 || !dword_9D9F0) {
              goto LABEL_2219;
            }
            if (lowerchar_follows(v645, 1))
            {
              v664 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
              char v667 = *v664;
              v666 = v664 + 1;
              char v665 = v667;
              do
              {
                std_char(v665);
                int v668 = *v666++;
                char v665 = v668;
              }
              while (v668);
              int v663 = 0;
              dword_9D9F0 = 0;
              int v662 = nLangIDGlb;
            }
            else
            {
              int v662 = nLangIDGlb;
              int v663 = dword_9D9F0;
LABEL_2219:
              if (v662 == 10 && v663)
              {
                int v704 = *v26[324];
                if (v704 == 9 || v704 == 160 || v704 == 32)
                {
                  int v663 = 0;
                  dword_9D9F0 = 0;
                }
                int v662 = 10;
                goto LABEL_2437;
              }
            }
            switch(v662)
            {
              case 9:
                uint64_t v779 = *(void *)(qword_9DA30 + 48);
                if (!v779 || *(void *)(v779 + 8) != 1 || (*(unsigned char *)(v779 + 35) & 8) == 0)
                {
                  int v662 = 9;
                  goto LABEL_2437;
                }
                break;
              case 10:
                goto LABEL_2437;
              case 12:
                break;
              default:
                v705 = (const char *)v26[324];
LABEL_2448:
                char v791 = *v705;
                v790 = (unsigned __int8 *)(v705 + 1);
                char v789 = v791;
                do
                {
                  std_char(v789);
                  int v792 = *v790++;
                  char v789 = v792;
                }
                while (v792);
                goto LABEL_2922;
            }
            v705 = (const char *)v26[324];
            v706 = pLangGlb;
            v707 = *(const char **)((char *)&stru_20.filesize + (void)pLangGlb);
            if (!strcmp(v705, v707))
            {
              v882 = v707;
              if (v662 != 12) {
                v882 = *(const char **)&stru_68.sectname[(void)v706];
              }
              v883 = uppersign_follows(qword_9DA30, v882);
              qword_9DA78 = (uint64_t)v883;
              if (v883)
              {
                if ((byte_9DA90 & 1) == 0 && !v663)
                {
                  if (v662 == 9)
                  {
                    if (uppersign_follows((uint64_t)v883, *(const char **)&stru_68.sectname[(void)v706])) {
                      goto LABEL_2841;
                    }
                  }
                  else
                  {
                    v913 = uppersign_follows((uint64_t)v883, v707);
                    if (uppersign_follows((uint64_t)v913, v707))
                    {
                      inc_string(*(unsigned char **)&stru_68.segname[(void)v706 - 8]);
                      byte_9DA90 = 1;
                      goto LABEL_2922;
                    }
                  }
                  char v916 = *v705;
                  v915 = (unsigned __int8 *)(v705 + 1);
                  char v914 = v916;
                  do
                  {
                    std_char(v914);
                    int v917 = *v915++;
                    char v914 = v917;
                  }
                  while (v917);
                }
              }
              else
              {
                byte_9DA90 = 0;
                if (!v663)
                {
                  char v901 = *v705;
                  v900 = (unsigned __int8 *)(v705 + 1);
                  char v899 = v901;
                  do
                  {
                    std_char(v899);
                    int v902 = *v900++;
                    char v899 = v902;
                  }
                  while (v902);
                }
              }
              goto LABEL_2922;
            }
            if (((1 << v662) & 0x1600) == 0) {
              goto LABEL_2448;
            }
LABEL_2437:
            v705 = (const char *)v26[324];
            v706 = pLangGlb;
            v780 = *(const char **)&stru_68.sectname[(void)pLangGlb];
            if (strcmp(v705, v780)) {
              goto LABEL_2448;
            }
            uint64_t v781 = qword_9DA30;
            v782 = uppersign_follows(qword_9DA30, v780);
            qword_9DA78 = (uint64_t)v782;
            if (v782)
            {
              if (v663) {
                goto LABEL_2922;
              }
              uint64_t v783 = (uint64_t)v782;
              if (v662 == 12 || v662 == 9 && nSubLangIDGlb != 3) {
                goto LABEL_2443;
              }
              if (uppersign_follows((uint64_t)v782, v780))
              {
LABEL_2841:
                inc_string(*(unsigned char **)&stru_68.segname[(void)v706 - 8]);
                dword_9D9F0 = 1;
                goto LABEL_2922;
              }
              if (v662 == 9)
              {
LABEL_2443:
                v784 = uppersign_follows(v783, v780);
                if (uppersign_follows((uint64_t)v784, v780)) {
                  goto LABEL_2841;
                }
              }
              char v787 = *v705;
              v786 = (unsigned __int8 *)(v705 + 1);
              char v785 = v787;
              do
              {
                std_char(v785);
                int v788 = *v786++;
                char v785 = v788;
              }
              while (v788);
            }
            else
            {
              if (v662 == 9 && v663)
              {
                terminate_upper(v781);
              }
              else
              {
                char v888 = *v705;
                v887 = (unsigned __int8 *)(v705 + 1);
                char v886 = v888;
                do
                {
                  std_char(v886);
                  int v889 = *v887++;
                  char v886 = v889;
                }
                while (v889);
              }
              dword_9D9F0 = 0;
            }
            goto LABEL_2922;
          case 4:
            if (nLangIDGlb == 7)
            {
              int v669 = *v647;
              if (!*v647)
              {
                LOBYTE(v696) = 0;
                goto LABEL_2894;
              }
              if (memchr("[]\x82\x91\x92", *v647, 6uLL)) {
                BOOL v670 = v646 == v650;
              }
              else {
                BOOL v670 = 0;
              }
              BOOL v671 = !v670 || (v646 & 0x1E0E4) == 0;
              if (v671 || ***(unsigned char ***)(v645 + 40) == 46 || **v649 == 46)
              {
                if (memchr("\x84\x93\x94", v669, 4uLL)
                  && v646 == v650
                  && (v646 & 0x1E0E4) != 0
                  && ***(unsigned char ***)(v645 + 40) != 46
                  && **v649 != 46)
                {
                  if (v648 >= 2) {
                    qword_9D9F8 = v648 + 1;
                  }
                  uint64_t v672 = 39;
LABEL_2138:
                  std_char(v672);
                }
              }
              else
              {
                inc_string("''");
              }
            }
            else if (nLangIDGlb == 9 {
                   && nSubLangIDGlb != 2
            }
                   && ((BYTE3(lFlags) >> 6) & 1 & ~byte_9D9E8) == 0
                   && (v646 & 0xD0) != 0)
            {
              v686 = *(unsigned char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * *v647);
              if (*v686)
              {
                if (memchr(",;:/?+=(*)", *v686, 0xBuLL))
                {
                  if (v648 >= 2) {
                    qword_9D9F8 = v648 + 1;
                  }
                  uint64_t v672 = 127;
                  goto LABEL_2138;
                }
              }
            }
            v877 = (char *)v26[324];
            int v696 = *v877;
            if (v696 == 223 && nLangIDGlb == 7)
            {
              if ((*(unsigned char *)(qword_9DA30 + 32) & 0x40) != 0)
              {
                uint64_t v697 = 126;
                goto LABEL_2921;
              }
              LOBYTE(v696) = -33;
              goto LABEL_2894;
            }
            if (v696 == 196 || v696 == 214)
            {
              if (nLangIDGlb != 7) {
                goto LABEL_2894;
              }
            }
            else
            {
              if (v696 != 220 || nLangIDGlb != 7) {
                goto LABEL_2894;
              }
              LOBYTE(v696) = -36;
            }
            if ((*(unsigned char *)(qword_9DA30 + 32) & 0x40) == 0)
            {
              char v879 = **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
              if (qword_9D9F8 >= 2) {
                ++qword_9D9F8;
              }
              std_char(v879);
              uint64_t v701 = *v877;
              goto LABEL_2895;
            }
            goto LABEL_2894;
          case 8:
            if (nLangIDGlb == 7)
            {
              int v673 = *v647;
              if (*v647)
              {
                if (memchr("()!?", *v647, 5uLL))
                {
                  uint64_t v674 = *(void *)(v645 + 32);
                  if ((v674 & 4) == 0)
                  {
                    if ((v646 & 0x1E0C0) != 0
                      || (v646 & 0x24) != 0
                      && ((v894 = **(unsigned char ***)(v645 + 40), !*v894)
                       || !memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB",
                             *v894,
                             0x15uLL)))
                    {
                      if ((v650 & 0x1E0C0) != 0
                        || (v650 & 0x24) != 0
                        && (!**v649 || !memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", **v649, 0x15uLL)))
                      {
                        goto LABEL_2817;
                      }
                    }
                  }
                  if ((v674 & 0x42) == 0)
                  {
                    if (!v646
                      || v646 == 2
                      && ((v896 = **(unsigned char ***)(v645 + 40), !*v896)
                       || !memchr(".,:;!?-_'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB",
                             *v896,
                             0x15uLL)))
                    {
                      if (!v650 || v650 == 2 && (**v649 | 0x80) == 0xA0) {
                        goto LABEL_2817;
                      }
                    }
                  }
                }
                if (memchr(",;:!?", v673, 6uLL))
                {
                  if ((v650 & 0x1E020) != 0)
                  {
                    if (!**v649 || !memchr(".\"!'><$CQXY\x7F", **v649, 0xDuLL))
                    {
LABEL_2817:
                      map_char(**(char **)((char *)&stru_20.maxprot + (void)pLangGlb));
                      goto LABEL_2818;
                    }
                  }
                  else if (v650 == 2)
                  {
                    if (**v649 != **(unsigned __int8 **)((char *)&stru_20.filesize + (void)pLangGlb)) {
                      goto LABEL_2809;
                    }
                    goto LABEL_2817;
                  }
                }
              }
              if ((v646 & 0xC) == 0) {
                goto LABEL_2809;
              }
              if ((v650 & 0xC) == 0) {
                goto LABEL_2809;
              }
              if ((*(unsigned char *)(v645 + 32) & 4) != 0) {
                goto LABEL_2809;
              }
              v895 = **(unsigned char ***)(v645 + 40);
              if (!*v895
                || !memchr("({[<\x91", *v895, 6uLL)
                || !**v649
                || !memchr(")}]>\x9B", **v649, 6uLL))
              {
                goto LABEL_2809;
              }
              goto LABEL_2817;
            }
            int v687 = nSubLangIDGlb;
            BOOL v688 = nLangIDGlb == 9;
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
            {
              int v689 = *v647;
              if (*v647)
              {
                if (memchr(",;:!?", *v647, 6uLL)) {
                  BOOL v690 = 1;
                }
                else {
                  BOOL v690 = v689 == 46;
                }
                BOOL v688 = 1;
                int v687 = 3;
                if (v690 && (v650 & 0x1E000) != 0) {
                  goto LABEL_2817;
                }
              }
              else
              {
                BOOL v688 = 1;
                int v687 = 3;
              }
            }
            if (!v688 || v687 == 2)
            {
              BOOL v880 = v687 == 2 && v688;
              if (!v880 || (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
              {
LABEL_2809:
                escape_number((unsigned __int8 **)v645, **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb));
                goto LABEL_2818;
              }
              int v687 = 2;
            }
            else if ((byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
              goto LABEL_2809;
            }
            if ((v646 & 0xD0) == 0) {
              goto LABEL_2809;
            }
            if (v687 == 2)
            {
              if (v648 >= 2) {
                qword_9D9F8 = v648 + 1;
              }
              uint64_t v881 = 39;
            }
            else
            {
              if (v648 >= 2) {
                qword_9D9F8 = v648 + 1;
              }
              uint64_t v881 = 127;
            }
            std_char(v881);
LABEL_2818:
            uint64_t v701 = (char)*v26[324];
            goto LABEL_2895;
          default:
            goto LABEL_2120;
        }
      }
      if (v651 != 16)
      {
        if (v651 == 32) {
          goto LABEL_2049;
        }
        if (v651 != 64) {
          goto LABEL_2120;
        }
        if (nLangIDGlb == 12)
        {
          if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
          {
            if ((byte_9DA94 & 1) == 0)
            {
              if (v648 >= 2) {
                qword_9D9F8 = v648 + 1;
              }
              uint64_t v656 = 39;
              goto LABEL_2529;
            }
            goto LABEL_2530;
          }
          goto LABEL_2160;
        }
        BOOL v691 = nLangIDGlb == 9;
        if (nLangIDGlb == 9 && nSubLangIDGlb != 2)
        {
          if ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
          {
            if ((byte_9DA94 & 1) == 0)
            {
              if (v648 >= 2) {
                qword_9D9F8 = v648 + 1;
              }
              uint64_t v656 = 35;
LABEL_2529:
              std_char(v656);
              byte_9DA94 = 1;
            }
LABEL_2530:
            v824 = v26[324];
            unsigned __int8 v827 = *v824;
            v826 = v824 + 1;
            unsigned __int8 v825 = v827;
            do
            {
              std_char((char)v825);
              int v828 = *v826++;
              unsigned __int8 v825 = v828;
            }
            while (v828);
            goto LABEL_2922;
          }
          BOOL v691 = 1;
        }
        if (v691 && nSubLangIDGlb == 3)
        {
          if (byte_9D9E8) {
            goto LABEL_2530;
          }
        }
        else
        {
LABEL_2160:
          if (v646 == 128) {
            goto LABEL_2530;
          }
        }
        if (v648 >= 2) {
          qword_9D9F8 = v648 + 1;
        }
        std_char(35);
        goto LABEL_2530;
      }
      int v677 = nLangIDGlb;
      if (nLangIDGlb == 12)
      {
        if ((lFlags & 0x20000) == 0
          && (*(unsigned char *)(v645 + 32) & 2) == 0
          && ((v646 & 0xD0) == 0 || (lFlags & 0x40000000) != 0 && (byte_9D9E8 & 1) == 0))
        {
          if (v648 >= 2) {
            qword_9D9F8 = v648 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
        }
        int v696 = *v647;
        if (v696 <= 0x2E)
        {
          if (v696 == 42 || v696 == 46)
          {
LABEL_2873:
            uint64_t v697 = 42;
            goto LABEL_2921;
          }
        }
        else
        {
          if (v696 == 47 || v696 == 247)
          {
            if ((lFlags & 0x40000) != 0) {
              uint64_t v697 = 58;
            }
            else {
              uint64_t v697 = 47;
            }
            goto LABEL_2921;
          }
          if (v696 == 124) {
            goto LABEL_2193;
          }
        }
        goto LABEL_2894;
      }
      if (nLangIDGlb == 7)
      {
        if ((lFlags & 0x20000) == 0
          && (byte_9D9E8 & 1) == 0
          && v646 != 16
          && (*v647 != 46 || v650 == 2 && **v649 == 32))
        {
          if (v648 >= 2) {
            qword_9D9F8 = v648 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
          goto LABEL_2863;
        }
        if (v645 == qword_9DA48 || v646 == 32 || v646 == 16 || v646 == 2 && ***(unsigned char ***)(v645 + 40) != 31) {
          goto LABEL_2863;
        }
        if (byte_9D9E8 && *v647 == 47)
        {
LABEL_2878:
          uint64_t v697 = 56;
          goto LABEL_2921;
        }
        if ((v646 & 0x81) != 0)
        {
          int v702 = ***(unsigned __int8 ***)(v645 + 40);
          if (v702 == 34) {
            goto LABEL_2863;
          }
          int v703 = *v647;
          if (v703 == 51)
          {
            if (v702 == 124)
            {
              LOBYTE(v696) = 51;
LABEL_2877:
              uint64_t v697 = (char)v696;
              goto LABEL_2921;
            }
LABEL_2860:
            if (v648 >= 2) {
              qword_9D9F8 = v648 + 1;
            }
            std_char(32);
            v647 = v26[324];
LABEL_2863:
            int v696 = *v647;
            if (v696 <= 0x5A)
            {
              switch(*v647)
              {
                case '(':
                  uint64_t v697 = 50;
                  goto LABEL_2921;
                case ')':
                  uint64_t v697 = 96;
                  goto LABEL_2921;
                case '*':
                case '+':
                case ',':
                case '-':
                case '0':
                case '1':
                case '2':
                  goto LABEL_2894;
                case '.':
                case '3':
                  goto LABEL_2877;
                case '/':
                  goto LABEL_2878;
                default:
                  if ((v696 - 57) < 2) {
                    goto LABEL_2877;
                  }
                  if (v696 == 33) {
                    goto LABEL_2873;
                  }
                  goto LABEL_2894;
              }
            }
            if (*v647 > 0x7Au)
            {
              switch(*v647)
              {
                case '{':
                  uint64_t v905 = 0;
                  char v906 = 33;
                  do
                  {
                    std_char(v906);
                    char v906 = asc_24719[++v905];
                  }
                  while (v905 != 2);
                  break;
                case '|':
                  goto LABEL_2878;
                case '}':
                  uint64_t v907 = 0;
                  char v908 = 33;
                  do
                  {
                    std_char(v908);
                    char v908 = asc_20E77[++v907];
                  }
                  while (v907 != 2);
                  break;
                case '~':
                  uint64_t v697 = 63;
                  goto LABEL_2921;
                default:
                  goto LABEL_2894;
              }
              goto LABEL_2922;
            }
            switch(v696)
            {
              case '[':
LABEL_2913:
                uint64_t v697 = 123;
                goto LABEL_2921;
              case ']':
LABEL_2919:
                uint64_t v697 = 125;
                goto LABEL_2921;
              case 'o':
                goto LABEL_2877;
            }
LABEL_2894:
            uint64_t v701 = (char)v696;
            goto LABEL_2895;
          }
        }
        else
        {
          int v703 = *v647;
        }
        if ((v703 - 91) <= 0x22 && ((1 << (v703 - 91)) & 0x500000005) != 0
          || (v703 - 40) < 2)
        {
          goto LABEL_2863;
        }
        goto LABEL_2860;
      }
      int v698 = nSubLangIDGlb;
      if (nSubLangIDGlb == 1)
      {
        int v699 = lFlags;
      }
      else if (nLangIDGlb != 9 {
             || nSubLangIDGlb == 2
      }
             || (int v699 = lFlags, (byte_9D9E8 & 1) == 0) && (lFlags & 0x40000000) != 0)
      {
        if (nSubLangIDGlb != 3)
        {
          int v696 = *v647;
          if (v696 <= 0x95)
          {
            switch(*v647)
            {
              case '*':
              case '.':
                goto LABEL_2829;
              case '+':
                uint64_t v884 = 0;
                char v885 = 60;
                do
                {
                  std_char(v885);
                  char v885 = asc_25A0D[++v884];
                }
                while (v884 != 2);
                break;
              case '/':
                goto LABEL_2822;
              default:
                goto LABEL_2894;
            }
            goto LABEL_2922;
          }
          switch(v696)
          {
            case 150:
              std_char(60);
              uint64_t v701 = 4294967190;
              goto LABEL_2895;
            case 215:
LABEL_2829:
              uint64_t v903 = 0;
              char v904 = 60;
              do
              {
                std_char(v904);
                char v904 = asc_25A0A[++v903];
              }
              while (v903 != 2);
              goto LABEL_2922;
            case 247:
LABEL_2822:
              uint64_t v897 = 0;
              char v898 = 60;
              do
              {
                std_char(v898);
                char v898 = asc_25A2C[++v897];
              }
              while (v897 != 2);
              goto LABEL_2922;
          }
          goto LABEL_2894;
        }
        if ((lFlags & 0x20000) == 0)
        {
          int v696 = *v647;
          if (v696 == 61) {
            goto LABEL_2894;
          }
          if (v648 >= 2) {
            qword_9D9F8 = v648 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
        }
        int v696 = *v647;
        if (v696 <= 0x7B)
        {
          switch(*v647)
          {
            case '*':
            case '.':
              goto LABEL_2896;
            case '+':
              uint64_t v697 = 43;
              goto LABEL_2921;
            case '/':
              goto LABEL_2193;
            default:
              goto LABEL_2894;
          }
        }
        if (*v647 > 0xD6u)
        {
          if (v696 == 215)
          {
LABEL_2896:
            uint64_t v697 = 40;
            goto LABEL_2921;
          }
          if (v696 == 247) {
            goto LABEL_2193;
          }
        }
        else
        {
          if (v696 == 124) {
            goto LABEL_2193;
          }
          if (v696 == 150)
          {
LABEL_2835:
            uint64_t v697 = 45;
            goto LABEL_2921;
          }
        }
        goto LABEL_2894;
      }
      int v696 = *v647;
      if ((v699 & 0x20000) == 0)
      {
        if (v696 == 61)
        {
          v700 = &unk_9D000;
LABEL_2199:
          if (v677 == 9 && v698 != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            uint64_t v909 = v700[320];
            if (v909 != qword_9DA10)
            {
              int v910 = *(unsigned __int8 *)(v909 - 1);
              if (v910 != 9 && v910 != 32 && v910 != 160) {
                std_char(32);
              }
            }
            char v911 = 36;
            for (uint64_t n = 1; n != 4; ++n)
            {
              std_char(v911);
              char v911 = aK_16[n];
            }
            byte_9DA94 = 0;
            goto LABEL_2922;
          }
          uint64_t v701 = 61;
          goto LABEL_2895;
        }
        BOOL v891 = v645 != qword_9DA48 && v646 == 0;
        if ((v646 & 0xD0) != 0) {
          BOOL v891 = 1;
        }
        if (nLangIDGlb != 9 || !v891 || (v699 & 0x40000000) != 0 && (byte_9D9E8 & 1) == 0)
        {
          if (v648 >= 2) {
            qword_9D9F8 = v648 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
          int v696 = *v647;
        }
      }
      if (v696 <= 61)
      {
        v700 = (void *)&unk_9D000;
        switch(v696)
        {
          case '!':
            if (nLangIDGlb != 9
              || nSubLangIDGlb == 2
              || (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0
              || (v647[1] == 61 || !v647[1])
              && (v647[1] || !v650 || (v650 & 0x22) != 0 || v650 == 16 && ***(unsigned char ***)(v645 + 48) == 61))
            {
              goto LABEL_2922;
            }
            uint64_t v697 = 33;
            goto LABEL_2921;
          case '""':
          case '#':
          case '$':
          case '&':
          case '\'':
          case ',':
          case '-':
            goto LABEL_2894;
          case '%':
            if (nLangIDGlb != 9 || nSubLangIDGlb == 2 || (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
              uint64_t v701 = 37;
              goto LABEL_2895;
            }
            uint64_t v918 = 0;
            char v919 = 34;
            do
            {
              std_char(v919);
              char v919 = asc_2476D[++v918];
            }
            while (v918 != 2);
            goto LABEL_2922;
          case '(':
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)) {
              goto LABEL_2913;
            }
            uint64_t v701 = 40;
            goto LABEL_2895;
          case ')':
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)) {
              goto LABEL_2919;
            }
            uint64_t v701 = 41;
            goto LABEL_2895;
          case '*':
          case '.':
            goto LABEL_2836;
          case '+':
            uint64_t v697 = 48;
            goto LABEL_2921;
          case '/':
            goto LABEL_2783;
          default:
            if (v696 != 60)
            {
              if (v696 != 61) {
                goto LABEL_2894;
              }
              int v677 = nLangIDGlb;
              int v698 = nSubLangIDGlb;
              goto LABEL_2199;
            }
            if (nLangIDGlb != 9 || nSubLangIDGlb == 2 || (byte_9D9E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
              uint64_t v701 = 60;
              goto LABEL_2895;
            }
            uint64_t v932 = 0;
            char v933 = 33;
            do
            {
              std_char(v933);
              char v933 = aK_6[++v932];
            }
            while (v932 != 2);
            break;
        }
        goto LABEL_2922;
      }
      if (v696 <= 124)
      {
        if (v696 <= 92)
        {
          if (v696 == 62)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
            {
              uint64_t v928 = 0;
              char v929 = 36;
              do
              {
                std_char(v929);
                char v929 = asc_25971[++v928];
              }
              while (v928 != 2);
              goto LABEL_2922;
            }
            uint64_t v701 = 62;
            goto LABEL_2895;
          }
          if (v696 == 91)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
            {
              uint64_t v920 = 0;
              char v921 = 34;
              do
              {
                std_char(v921);
                char v921 = asc_247A7[++v920];
              }
              while (v920 != 2);
              goto LABEL_2922;
            }
            uint64_t v701 = 91;
            goto LABEL_2895;
          }
        }
        else
        {
          switch(v696)
          {
            case ']':
              if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
              {
                uint64_t v924 = 0;
                char v925 = 34;
                do
                {
                  std_char(v925);
                  char v925 = asc_247C8[++v924];
                }
                while (v924 != 2);
                goto LABEL_2922;
              }
              uint64_t v701 = 93;
              goto LABEL_2895;
            case '{':
              if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
              {
                uint64_t v926 = 0;
                char v927 = 36;
                do
                {
                  std_char(v927);
                  char v927 = asc_2A4BF[++v926];
                }
                while (v926 != 2);
                goto LABEL_2922;
              }
              uint64_t v701 = 123;
              goto LABEL_2895;
            case '|':
              goto LABEL_2783;
          }
        }
        goto LABEL_2894;
      }
      if (v696 <= 149)
      {
        if (v696 == 125)
        {
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            uint64_t v930 = 0;
            char v931 = 36;
            do
            {
              std_char(v931);
              char v931 = asc_2A4C2[++v930];
            }
            while (v930 != 2);
            goto LABEL_2922;
          }
          uint64_t v701 = 125;
          goto LABEL_2895;
        }
        if (v696 == 137)
        {
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            char v922 = 34;
            for (iuint64_t i = 1; ii != 4; ++ii)
            {
              std_char(v922);
              char v922 = asc_2A4BB[ii];
            }
            goto LABEL_2922;
          }
          uint64_t v701 = 4294967177;
          goto LABEL_2895;
        }
        goto LABEL_2894;
      }
      if (v696 != 150)
      {
        if (v696 == 215)
        {
LABEL_2836:
          uint64_t v697 = 49;
          goto LABEL_2921;
        }
        if (v696 == 247)
        {
LABEL_2783:
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            uint64_t v892 = 0;
            char v893 = 36;
            do
            {
              std_char(v893);
              char v893 = asc_2A4B4[++v892];
            }
            while (v892 != 2);
            goto LABEL_2922;
          }
LABEL_2193:
          uint64_t v697 = 124;
LABEL_2921:
          std_char(v697);
          goto LABEL_2922;
        }
        goto LABEL_2894;
      }
      if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_9D9E8 & 1) != 0 || (lFlags & 0x40000000) == 0)) {
        goto LABEL_2835;
      }
      uint64_t v701 = 45;
LABEL_2895:
      map_char(v701);
LABEL_2922:
      if (qword_9D9F8 >= 1)
      {
        qword_9D9F8 = 0;
        std_char(30);
      }
      uint64_t v646 = *(void *)(qword_9DA30 + 24);
      qword_9DA28 = v646;
      uint64_t v645 = *(void *)(qword_9DA30 + 48);
      qword_9DA30 = v645;
      uint64_t v16 = (unsigned __int8 **)&unk_9D000;
      if (!v645)
      {
        uint64_t v27 = &unk_9D000;
        if (dword_9D9F0)
        {
          v934 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
          char v937 = *v934;
          v936 = v934 + 1;
          char v935 = v937;
          do
          {
            std_char(v935);
            int v938 = *v936++;
            char v935 = v938;
          }
          while (v938);
          dword_9D9F0 = 0;
        }
        goto LABEL_2986;
      }
    }
    if (v651 <= 2047)
    {
      if (v651 <= 511)
      {
        if (v651 == 128 || v651 == 256) {
          goto LABEL_2049;
        }
LABEL_2120:
        uint64_t v680 = *(void *)(v645 + 8);
        if (v680 >= 1)
        {
          v681 = v647 - 1;
          int v682 = 1;
          uint64_t v683 = *(void *)(v645 + 8);
          do
          {
            seg_index[v681[v683]] = v682;
            seg_start[v681[v683]] = &v681[v683];
            ++v682;
            --v683;
          }
          while (v683);
        }
        if (nLangIDGlb == 12 && bMemoryOverflow == 0)
        {
          v692 = (char *)malloc_type_malloc(v680 + 1, 0xBE9DCDBBuLL);
          if (v692)
          {
            v989 = v692;
            strcpy(v692, (const char *)v26[324]);
          }
          else
          {
            v989 = 0;
            bMemoryOverflow = 1;
          }
        }
        else
        {
          v989 = 0;
        }
        if ((*(int *)((unsigned char *)&dword_18 + (void)pLangGlb) & 0x80000000) == 0)
        {
          uint64_t v708 = 0;
          v709 = *(unsigned __int8 ***)((char *)&dword_10 + (void)pLangGlb);
          while (1)
          {
            uint64_t v710 = (uint64_t)v709[2];
            v711 = *v709;
            uint64_t v712 = **v709;
            uint64_t v713 = (int)seg_index[v712];
            if (v710 <= v713)
            {
              if (seg_index[v711[v710 - 1]])
              {
                if (seg_index[v711[1]])
                {
                  uint64_t v714 = qword_9DA30;
                  if ((*(_DWORD *)(qword_9DA30 + 32) & v709[7] & 0x9000FFFF) == 0) {
                    break;
                  }
                }
              }
            }
LABEL_2240:
            v709 += 8;
            BOOL v24 = v708++ < *(int *)((char *)&dword_18 + (void)pLangGlb);
            if (!v24) {
              goto LABEL_2355;
            }
          }
          v715 = (unsigned char *)seg_start[v712];
          qword_9DA38 = (uint64_t)v715;
          v716 = *v709;
LABEL_2243:
          while (2)
          {
            uint64_t v717 = 1;
            while (1)
            {
              int v718 = v716[v717];
              if (!v716[v717]) {
                break;
              }
              int v719 = v715[v717++];
              if (v719 != v718) {
                goto LABEL_2246;
              }
            }
            v722 = &v715[v717];
            uint64_t v987 = v715 - v26[324];
            if (v987) {
              goto LABEL_2251;
            }
            uint64_t v724 = qword_9DA28;
            int v977 = nLangIDGlb;
            if (nLangIDGlb != 7) {
              goto LABEL_2262;
            }
            if (qword_9DA28 != 8)
            {
              if (qword_9DA28 != 4)
              {
LABEL_2262:
                if ((v724 & 0xC0) != 0)
                {
                  *(void *)__cc = v714;
                  v728 = v722;
                  uint64_t v729 = v724;
                  BOOL v730 = in(*v709[1], 5);
                  uint64_t v724 = v729;
                  v722 = v728;
                  BOOL v26 = (unsigned __int8 **)&unk_9D000;
                  uint64_t v714 = *(void *)__cc;
                  if (v730) {
                    goto LABEL_2246;
                  }
                }
LABEL_2264:
                v731 = v709[6];
                if (!*v722)
                {
                  if (((unsigned __int16)v731 & 0x2000) != 0)
                  {
                    if (*v709[1] != 45)
                    {
                      v978 = v709[6];
                      __s = v722;
                      goto LABEL_2307;
                    }
                    if ((v724 & 0x30) == 0)
                    {
                      v978 = v709[6];
                      __s = v722;
                      if (v724 != 4) {
                        goto LABEL_2307;
                      }
                      *(void *)__c = v714;
                      v740 = **(unsigned char ***)(v714 + 40);
                      if (*v740)
                      {
                        int v741 = *v740;
                        if (memchr("({[<\x91", v741, 6uLL) || memchr(")}]>\x9B", v741, 6uLL)) {
                          goto LABEL_2307;
                        }
                      }
                      uint64_t v714 = *(void *)__c;
                    }
                  }
                  goto LABEL_2246;
                }
                if (((unsigned __int16)v731 & 0x4000) == 0) {
                  goto LABEL_2246;
                }
                int v732 = *v709[1];
                if (v732 == 45)
                {
                  if ((v724 & 0x30) != 0)
                  {
                    if (**(unsigned char **)v714 != 60) {
                      goto LABEL_2246;
                    }
                  }
                  else if (v724 == 4)
                  {
                    v978 = v709[6];
                    __s = v722;
                    v759 = **(unsigned char ***)(v714 + 40);
                    if (!*v759) {
                      goto LABEL_2246;
                    }
                    uint64_t v723 = v714;
                    int __ca = *v759;
                    if (!memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", __ca, 0xDuLL)
                      && !memchr("({[<\x91", __ca, 6uLL)
                      && !memchr(")}]>\x9B", __ca, 6uLL))
                    {
                      goto LABEL_2352;
                    }
LABEL_2354:
                    v742 = v709[5];
                    v743 = &v715[v710];
                    int v744 = 1;
LABEL_2306:
                    if (no_exception(v744, v742, v743))
                    {
LABEL_2307:
                      unsigned int v747 = *v716;
                      v746 = v716 + 1;
                      uint64_t v745 = v747;
                      do
                      {
                        seg_index[v745] = 0;
                        unsigned int v748 = *v746++;
                        uint64_t v745 = v748;
                      }
                      while (v748);
                      if (qword_9D9F8 > v987)
                      {
                        if (qword_9D9F8 <= v710 + v987) {
                          uint64_t v749 = v987 + 1;
                        }
                        else {
                          uint64_t v749 = (uint64_t)&v709[3][qword_9D9F8 - v710];
                        }
                        qword_9D9F8 = v749;
                      }
                      v750 = v715;
                      if ((lFlags & 0x20000000) != 0)
                      {
                        v750 = v715;
                        if (v987 >= 2)
                        {
                          v750 = v715;
                          if ((v978 & 0x20000) != 0)
                          {
                            v750 = v715;
                            if (*(v715 - 1) != 173)
                            {
                              if (nLangIDGlb != 12 || (int v751 = no_exception(0, byte_4B9FE, v715 - 1), v750 = v715, v751))
                              {
                                unsigned char *v715 = -83;
                                v750 = (void *)++qword_9DA38;
                              }
                            }
                          }
                        }
                      }
                      memcpy(v750, v709[1], (size_t)v709[3]);
                      v713 -= (uint64_t)v709[2];
                      v752 = (char *)&v709[3][qword_9DA38];
                      qword_9DA38 = (uint64_t)v752;
                      if ((lFlags & 0x20000000) != 0)
                      {
                        v753 = __s;
                        if (v987 >= 2 && (v709[6] & 0x40000) != 0)
                        {
                          BOOL v754 = *(v752 - 1) == 173 || v713 < 2;
                          if (!v754 && *__s != 173)
                          {
                            char *v752 = -83;
                            v752 = (char *)++qword_9DA38;
                          }
                        }
                      }
                      else
                      {
                        v753 = __s;
                      }
                      if (v753 > v752)
                      {
                        *(void *)(qword_9DA30 + 8) = &v752[*(void *)(qword_9DA30 + 8)] - v715 - v717;
                        size_t v755 = strlen(v753);
                        memmove(v752, v753, v755 + 1);
                      }
                      uint64_t v714 = qword_9DA30;
                      uint64_t v756 = *(void *)(qword_9DA30 + 8);
                      if (v756 >= 1)
                      {
                        uint64_t v757 = (uint64_t)(v26[324] - 1);
                        int v758 = 1;
                        do
                        {
                          seg_index[*(unsigned __int8 *)(v757 + v756)] = v758;
                          seg_start[*(unsigned __int8 *)(v757 + v756)] = v757 + v756;
                          ++v758;
                          --v756;
                        }
                        while (v756);
                      }
                      uint64_t v710 = (uint64_t)v709[2];
                      v716 = *v709;
                      if (v710 > (int)seg_index[**v709] || !seg_index[v716[v710 - 1]] || !seg_index[v716[1]]) {
                        goto LABEL_2240;
                      }
                      v715 = (unsigned char *)qword_9DA38;
                      if (*(unsigned __int16 *)qword_9DA38 == *(unsigned __int16 *)v716) {
                        continue;
                      }
                      goto LABEL_2246;
                    }
                    goto LABEL_2352;
                  }
                }
                __s = v722;
                v978 = v709[6];
                if (v977 == 7 && v724 == 32 && *v709[1])
                {
                  uint64_t v723 = v714;
                  if (***(unsigned char ***)(v714 + 40) == 39 && memchr(":+);=cqxy?(", v732, 0xCuLL))
                  {
LABEL_2352:
                    uint64_t v714 = v723;
                    goto LABEL_2246;
                  }
                }
                else
                {
                  uint64_t v723 = v714;
                }
                goto LABEL_2354;
              }
              v725 = **(unsigned char ***)(v714 + 40);
              if (!*v725) {
                goto LABEL_2264;
              }
              uint64_t v979 = qword_9DA28;
              *(void *)__cb = v714;
              v726 = memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *v725, 0xDuLL);
              uint64_t v724 = v979;
              uint64_t v714 = *(void *)__cb;
              v722 = &v715[v717];
              if (!v726) {
                goto LABEL_2264;
              }
            }
            break;
          }
          uint64_t v727 = *(void *)(*(void *)(v714 + 40) + 40);
          if (v727 && (*(_DWORD *)(v727 + 24) & 0x1C000) != 0)
          {
LABEL_2251:
            if (*v722) {
              goto LABEL_2252;
            }
            int v733 = nLangIDGlb;
            if (nLangIDGlb == 7)
            {
              if (qword_9DA98 == 8
                || qword_9DA98 == 4
                && (v734 = **(unsigned char ***)(v714 + 48), *v734)
                && (*(void *)__cd = v714,
                    v735 = v722,
                    v736 = memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *v734, 0xDuLL),
                    v722 = v735,
                    BOOL v26 = (unsigned __int8 **)&unk_9D000,
                    uint64_t v714 = *(void *)__cd,
                    v736))
              {
                uint64_t v737 = *(void *)(*(void *)(v714 + 48) + 48);
                if (v737)
                {
                  if ((*(_DWORD *)(v737 + 24) & 0x1C000) != 0)
                  {
LABEL_2252:
                    if ((v709[6] & 0x8000) == 0) {
                      goto LABEL_2246;
                    }
                    v978 = v709[6];
                    __s = v722;
                    uint64_t v723 = v714;
                    if (!no_exception(1, v709[5], &v715[v710])) {
                      goto LABEL_2352;
                    }
                    goto LABEL_2305;
                  }
                }
              }
            }
            if ((v709[6] & 0x10000) == 0) {
              goto LABEL_2246;
            }
            int v738 = *v709[1];
            if (v733 == 12 && v738 == 63 && qword_9DA98 == 8)
            {
              if (***(unsigned char ***)(v714 + 48) == 63) {
                goto LABEL_2246;
              }
              goto LABEL_2304;
            }
            if (v733 != 12 || v738 != 47) {
              goto LABEL_2304;
            }
            if ((lFlags & 0x40000) != 0 && qword_9DA98 == 4)
            {
              if (***(unsigned char ***)(v714 + 48) == 46) {
                goto LABEL_2246;
              }
              goto LABEL_2304;
            }
            if ((lFlags & 0x40000) != 0 || qword_9DA98 != 32 || ***(unsigned char ***)(v714 + 48) != 47)
            {
LABEL_2304:
              v978 = v709[6];
              __s = v722;
              uint64_t v723 = v714;
LABEL_2305:
              v742 = v709[4];
              v743 = v715 - 1;
              int v744 = 0;
              goto LABEL_2306;
            }
LABEL_2246:
            v720 = (unsigned __int16 *)(v715 + 1);
            while (v713 > v710)
            {
              --v713;
              qword_9DA38 = (uint64_t)v720;
              int v721 = *v720;
              v720 = (unsigned __int16 *)((char *)v720 + 1);
              v716 = *v709;
              if (v721 == *(unsigned __int16 *)*v709)
              {
                v715 = (char *)v720 - 1;
                goto LABEL_2243;
              }
            }
            goto LABEL_2240;
          }
          goto LABEL_2262;
        }
LABEL_2355:
        escape_number((unsigned __int8 **)qword_9DA30, 45);
        if (qword_9DA98 == 32
          && ((int v760 = ***(unsigned __int8 ***)(qword_9DA30 + 48), v760 != 33)
            ? (BOOL v761 = v760 == **(unsigned __int8 **)((char *)&stru_108.offset
                                                   + *(void *)((char *)&stru_20.cmd + (void)pLangGlb)))
            : (BOOL v761 = 1),
              v761))
        {
          char v762 = 0;
          v763 = off_95000;
        }
        else
        {
          v763 = off_95000;
          if (qword_9DA28 != 32
            || ((int v764 = ***(unsigned __int8 ***)(qword_9DA30 + 40), v764 != 33)
              ? (BOOL v765 = v764 == **(unsigned __int8 **)((char *)&stru_108.offset
                                                     + *(void *)((char *)&stru_20.cmd + (void)pLangGlb)))
              : (BOOL v765 = 1),
                !v765))
          {
            if ((__int16 v766 = lFlags, (lFlags & 0x1000) == 0) && equals_zweiformig(*(const char **)qword_9DA30, lFlags)
              || (nLangIDGlb == 9 || nLangIDGlb == 12)
              && (v766 & 0x4000) == 0
              && equals_mehrformig(qword_9DA30))
            {
              if (qword_9D9F8 >= 2) {
                ++qword_9D9F8;
              }
              map_char(**(char **)((char *)&stru_20.maxprot + (void)pLangGlb));
              v767 = v989;
              if (v989)
              {
                v769 = (unsigned __int8 *)(v989 + 1);
                char v768 = *v989;
                do
                {
                  map_char(v768);
                  int v770 = *v769++;
                  char v768 = v770;
                }
                while (v770);
                char v762 = 1;
              }
              else
              {
                char v762 = 0;
              }
              goto LABEL_2381;
            }
          }
          char v762 = 0;
        }
        v767 = v989;
LABEL_2381:
        uint64_t v771 = qword_9DA30;
        if (*(uint64_t *)(qword_9DA30 + 8) < 1)
        {
LABEL_2431:
          if (v767) {
            free(v989);
          }
          goto LABEL_2922;
        }
        uint64_t v772 = 0;
        v773 = v26[324];
        while (1)
        {
          seg_index[*v773] = 0;
          if ((v762 & 1) == 0)
          {
            int v774 = *((_DWORD *)v763 + 268);
            unsigned int v775 = *v773;
            if (v774 == 9 && nSubLangIDGlb == 3 && byte_9D9E8 != 0)
            {
              if (!*v773) {
                goto LABEL_2430;
              }
              if (v772 && (v775 - 97) <= 9u)
              {
                if (qword_9D9F8 >= 2) {
                  ++qword_9D9F8;
                }
                map_char(**(char **)((char *)&stru_20.maxprot + (void)pLangGlb));
                uint64_t v778 = (char)*v773;
LABEL_2427:
                map_char(v778);
                goto LABEL_2430;
              }
            }
            if (*v773 > 0x57u)
            {
              switch(v775)
              {
                case 0x58u:
                  if (v774 == 7 && (~*(_DWORD *)(v771 + 32) & 0x14) == 0)
                  {
                    uint64_t v778 = 120;
                    goto LABEL_2429;
                  }
                  uint64_t v778 = 88;
                  goto LABEL_2427;
                case 0x59u:
                  if (v774 == 7 && (~*(_DWORD *)(v771 + 32) & 0x84) == 0)
                  {
                    uint64_t v778 = 121;
                    goto LABEL_2429;
                  }
                  uint64_t v778 = 89;
                  goto LABEL_2427;
                case 0xDFu:
                  if (v774 == 7 && (~*(_DWORD *)(v771 + 32) & 0x1CLL) == 0)
                  {
                    uint64_t v778 = 126;
                    goto LABEL_2429;
                  }
                  uint64_t v778 = 4294967263;
                  goto LABEL_2427;
              }
LABEL_2420:
              uint64_t v778 = (char)v775;
              if (v775 < 0x40 || (int)v778 >= 96) {
                goto LABEL_2429;
              }
              goto LABEL_2427;
            }
            if (*v773)
            {
              if (v775 == 67)
              {
                if (v774 == 7 && (*(unsigned char *)(v771 + 32) & 4) != 0)
                {
                  uint64_t v778 = 99;
                  goto LABEL_2429;
                }
                uint64_t v778 = 67;
                goto LABEL_2427;
              }
              if (v775 == 81)
              {
                if (v774 == 7 && (~*(_DWORD *)(v771 + 32) & 0xCLL) == 0)
                {
                  uint64_t v778 = 113;
LABEL_2429:
                  std_char(v778);
                  goto LABEL_2430;
                }
                uint64_t v778 = 81;
                goto LABEL_2427;
              }
              goto LABEL_2420;
            }
          }
LABEL_2430:
          v773 = v26[324] + 1;
          v26[324] = v773;
          uint64_t v771 = qword_9DA30;
          if (++v772 >= *(void *)(qword_9DA30 + 8)) {
            goto LABEL_2431;
          }
        }
      }
      if (v651 != 512)
      {
        if (v651 == 1024)
        {
          int v657 = dword_9D9F0;
          int v658 = lowerchar_follows(v645, dword_9D9F0);
          int v659 = v658;
          if (v657)
          {
            escape_number((unsigned __int8 **)v645, **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb));
          }
          else
          {
            if (v658) {
              v693 = *(unsigned char **)&stru_68.sectname[(void)pLangGlb];
            }
            else {
              v693 = *(unsigned char **)&stru_68.segname[(void)pLangGlb - 8];
            }
            inc_string(v693);
          }
          signed __int8 v817 = *v647;
          do
          {
            add_basis_char(v817, 1);
            v818 = v26[324] + 1;
            v26[324] = v818;
            signed __int8 v817 = *v818;
          }
          while (*v818);
          if (v659 && dword_9D9F0)
          {
            v819 = *(unsigned char **)&stru_68.segname[(void)pLangGlb];
            char v822 = *v819;
            v821 = v819 + 1;
            char v820 = v822;
            do
            {
              std_char(v820);
              int v823 = *v821++;
              char v820 = v823;
            }
            while (v823);
          }
          dword_9D9F0 = v659 == 0;
          goto LABEL_2922;
        }
        goto LABEL_2120;
      }
      unsigned int v678 = *v647;
      if (*v647 && (v678 > 0xDE || (v678 - 123) >= 0xE6u)) {
        BOOL v679 = v646 != 2 || ***(unsigned __int8 ***)(v645 + 40) != 127;
      }
      else {
        BOOL v679 = 0;
      }
      while (1)
      {
        if ((_BYTE)v678)
        {
          if ((v678 + 33) > 0xE0u || (v678 - 91) >= 0xE6u)
          {
            v804 = v647 + 1;
            int v803 = (char)v647[1];
            if (v647[1])
            {
              unsigned int v805 = v647[1];
              if ((v805 > 0xDE || (v803 - 123) >= 0xE6u)
                && v805 != 45
                && (v805 != 100 || (unsigned int v806 = v647[2]) != 0 && (v806 > 0xDE || v806 - 123 >= 0xFFFFFFE6))
                && (!memchr("bcdfgkpt", v803, 9uLL) || v647[2] != 114))
              {
                v807 = "ler";
                while (1)
                {
                  do
                    int v808 = *v804++;
                  while (v808 == 173 || v808 == 30);
                  if (v808 != *(unsigned __int8 *)v807) {
                    break;
                  }
                  if (++v807 == "") {
                    goto LABEL_2505;
                  }
                }
                v810 = (char *)(v647 + 2);
                while (v805 == 30 || v805 == 173)
                {
                  char v811 = *v810++;
                  LOBYTE(v805) = v811;
                }
                if (v805 != 115)
                {
                  v793 = *(unsigned char **)((char *)&stru_20.filesize + (void)pLangGlb);
                  char v796 = *v793;
                  v795 = v793 + 1;
                  char v794 = v796;
                  do
                  {
                    if (qword_9D9F8 >= 2) {
                      ++qword_9D9F8;
                    }
                    std_char(v794);
                    BOOL v679 = 0;
                    int v797 = *v795++;
                    char v794 = v797;
                  }
                  while (v797);
                  goto LABEL_2511;
                }
              }
            }
LABEL_2505:
            if (!v679)
            {
              v812 = *(unsigned char **)&stru_68.sectname[(void)pLangGlb];
              char v815 = *v812;
              v814 = v812 + 1;
              char v813 = v815;
              do
              {
                if (qword_9D9F8 >= 2) {
                  ++qword_9D9F8;
                }
                std_char(v813);
                int v816 = *v814++;
                char v813 = v816;
              }
              while (v816);
            }
LABEL_2510:
            BOOL v679 = 1;
            goto LABEL_2511;
          }
          if (v679)
          {
            if (v678 != 45) {
              goto LABEL_2477;
            }
            goto LABEL_2510;
          }
        }
        else if (v679)
        {
LABEL_2477:
          v798 = *(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb);
          char v801 = *v798;
          v800 = v798 + 1;
          char v799 = v801;
          do
          {
            if (qword_9D9F8 >= 2) {
              ++qword_9D9F8;
            }
            std_char(v799);
            int v802 = *v800++;
            char v799 = v802;
          }
          while (v802);
          BOOL v679 = 0;
        }
LABEL_2511:
        add_basis_char((char)*v647, 1);
        v647 = v26[324] + 1;
        v26[324] = v647;
        LOBYTE(v678) = *v647;
        if (!*v647) {
          goto LABEL_2922;
        }
      }
    }
    if (v651 < 0x200000)
    {
      if (v651 != 2048)
      {
        if (v651 == 4096) {
          goto LABEL_2049;
        }
        goto LABEL_2120;
      }
      int v675 = *v647;
      if (v675 == 39 || v675 == 36)
      {
        v676 = off_95000;
        if (v647[1] == 36)
        {
          dword_9DA80 = v675 == 36;
          if (nLangIDGlb != 12)
          {
            if (nLangIDGlb == 7)
            {
              std_char((char)*v647);
              std_char((char)v647[1]);
              v647 = v26[324];
LABEL_2557:
              v26[324] = v647 + 2;
              int v675 = v647[2];
              v647 += 2;
              goto LABEL_2558;
            }
            if (nLangIDGlb != 9 || nSubLangIDGlb == 1)
            {
              unsigned __int8 v829 = v647[2];
              if (v829 && ((v829 + 33) > 0xE0u || (v829 - 91) >= 0xE6u))
              {
                unsigned __int8 v830 = v647[3];
                if (v830)
                {
                  if ((v830 + 33) > 0xE0u || (v830 - 91) > 0xE5u) {
                    goto LABEL_2557;
                  }
                }
              }
            }
          }
          BOOL v832 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
          if (v675 == 36)
          {
            if (v832) {
              inc_string("!{");
            }
            v833 = *(unsigned char **)((char *)&stru_68.reloff + (void)pLangGlb);
          }
          else
          {
            if (v832) {
              inc_string(">{");
            }
            v833 = *(unsigned char **)((char *)&stru_68.offset + (void)pLangGlb);
          }
          inc_string(v833);
          goto LABEL_2557;
        }
      }
      else
      {
        v676 = off_95000;
      }
LABEL_2558:
      if (v675)
      {
        int v834 = 0;
        do
        {
          if (v675 < 0x20u
            || v675 - 150 <= 0x17 && ((1 << (v675 + 106)) & 0x800403) != 0)
          {
            uint64_t v835 = (char)v675;
          }
          else
          {
            v836 = v647;
            v837 = "'.";
            while (1)
            {
              do
                int v838 = *v836++;
              while (v838 == 173 || v838 == 30);
              if (v838 != *(unsigned __int8 *)v837) {
                break;
              }
              if (++v837 == "")
              {
                if (*((_DWORD *)v676 + 268) != 7)
                {
                  v26[324] = v647 + 1;
                  goto LABEL_2565;
                }
                v840 = pLangGlb;
                if (!*(void *)&stru_20.segname[(void)pLangGlb])
                {
LABEL_2600:
                  unint64_t v846 = 0;
                  while (brl_set_ansi[v846] != v675)
                  {
                    if (++v846 == 256)
                    {
                      LOBYTE(v846) = 0;
                      goto LABEL_2622;
                    }
                  }
                  if ((v846 & 0xC0) != 0)
                  {
                    uint64_t v855 = (v846 >> 2) & 0x20 | (v846 >> 3) & 8;
                    goto LABEL_2621;
                  }
                  if (v846 <= 0x28 && ((1 << v846) & 0x10100000100) != 0)
                  {
                    v857 = v647;
                    v858 = "'.";
                    while (1)
                    {
                      do
                        int v859 = *v857++;
                      while (v859 == 173 || v859 == 30);
                      if (v859 != *(unsigned __int8 *)v858) {
                        break;
                      }
                      if (++v858 == "") {
                        goto LABEL_2622;
                      }
                    }
                    uint64_t v855 = v846 & 0x3F;
LABEL_2621:
                    std_char(brl_set_ansi[v855]);
                  }
LABEL_2622:
                  if (*v647 != 45 || (lFlags & 0x20000000) == 0)
                  {
                    uint64_t v835 = brl_set_ansi[v846 & 0x3F];
                    goto LABEL_2564;
                  }
LABEL_2625:
                  uint64_t v835 = 4294967190;
                  goto LABEL_2564;
                }
LABEL_2578:
                if (v834)
                {
                  if (v675 <= 0xDEu && (v675 - 123) < 0xE6u)
                  {
                    BOOL v841 = v675 > 0x20u;
                    int v834 = nSubLangIDGlb != 1 || v841;
                    goto LABEL_2614;
                  }
                  v848 = *(unsigned char **)&stru_B8.sectname[(void)v840];
LABEL_2612:
                  inc_string(v848);
LABEL_2613:
                  int v834 = 0;
                }
                else
                {
                  if ((v675 + 33) <= 0xE0u && (v675 - 91) < 0xE6u) {
                    goto LABEL_2613;
                  }
                  if (nSubLangIDGlb == 1)
                  {
                    unsigned __int8 v847 = v647[1];
                    if (!v847 || (v847 + 33) <= 0xE0u && (v847 - 91) < 0xE6u)
                    {
                      v848 = *(unsigned char **)((char *)&stru_68.reserved2 + (void)v840);
                      goto LABEL_2612;
                    }
                    v856 = *(unsigned char **)((char *)&stru_68.flags + (void)v840);
                  }
                  else
                  {
                    v856 = *(unsigned char **)((char *)&stru_68.reserved2 + (void)v840);
                  }
                  inc_string(v856);
                  int v834 = 1;
                }
LABEL_2614:
                uint64_t v849 = *v647;
                if (v849 == 45 && (lFlags & 0x20000000) != 0) {
                  goto LABEL_2625;
                }
                v850 = *(unsigned char **)(*(void *)&stru_20.segname[(void)pLangGlb] + 8 * v849);
                char v853 = *v850;
                v852 = v850 + 1;
                char v851 = v853;
                do
                {
                  std_char(v851);
                  int v854 = *v852++;
                  char v851 = v854;
                }
                while (v854);
                goto LABEL_2565;
              }
            }
            v840 = pLangGlb;
            if (*(void *)&stru_20.segname[(void)pLangGlb]) {
              goto LABEL_2578;
            }
            if (*((_DWORD *)v676 + 268) != 12) {
              goto LABEL_2600;
            }
            if ((v675 + 33) > 0xE0u || (v675 - 91) >= 0xE6u)
            {
              uint64_t v842 = 1;
              do
              {
                uint64_t v843 = v842;
                unsigned int v844 = v647[v842];
                if (!v647[v842])
                {
                  if (v842 < 3) {
                    goto LABEL_2646;
                  }
                  goto LABEL_2638;
                }
                ++v842;
              }
              while ((v844 - 58) > 0xF5u
                   || (v844 + 33) > 0xE0u
                   || (v844 - 91) > 0xE5u);
              if (v844 > 0xDE) {
                goto LABEL_2646;
              }
              if ((v844 - 123) > 0xE5u || v843 <= 2) {
                goto LABEL_2646;
              }
              do
              {
LABEL_2638:
                unsigned __int8 v861 = v647[v843];
                if (v861 && ((v861 + 33) > 0xE0u || (v861 - 91) >= 0xE6u)) {
                  v647[v843] = v861 | 0x60;
                }
                --v843;
              }
              while (v843);
              if (qword_9D9F8 >= 2) {
                ++qword_9D9F8;
              }
              std_char(36);
              LOBYTE(v675) = *v26[324];
            }
LABEL_2646:
            uint64_t v862 = 0;
            while (brl_set_tbfr2007[v862] != v675)
            {
              if (++v862 == 256)
              {
                LOBYTE(v862) = 0;
                break;
              }
            }
            uint64_t v863 = 0;
            while (brl_set_ansi[v863] != v862)
            {
              if (++v863 == 256) {
                goto LABEL_2565;
              }
            }
            int v864 = v863 & 0xC0;
            switch(v864)
            {
              case 192:
                uint64_t v835 = 33;
                break;
              case 128:
                uint64_t v835 = 34;
                break;
              case 64:
                uint64_t v835 = 36;
                break;
              default:
                goto LABEL_2565;
            }
          }
LABEL_2564:
          std_char(v835);
LABEL_2565:
          v647 = v26[324] + 1;
          v26[324] = v647;
          LOBYTE(v675) = *v647;
        }
        while (*v647);
      }
      unsigned int v865 = *((_DWORD *)v676 + 268);
      BOOL v24 = v865 > 0xC;
      int v866 = (1 << v865) & 0x1600;
      if (!v24 && v866 != 0)
      {
        v868 = *(unsigned char **)&stru_B8.segname[(void)pLangGlb - 8];
        char v871 = *v868;
        v870 = v868 + 1;
        char v869 = v871;
        do
        {
          std_char(v869);
          int v872 = *v870++;
          char v869 = v872;
        }
        while (v872);
        if (dword_9DA80) {
          BOOL v873 = nLangIDGlb == 9;
        }
        else {
          BOOL v873 = 0;
        }
        if (v873 && nSubLangIDGlb == 3)
        {
          uint64_t v875 = 0;
          char v876 = 33;
          do
          {
            std_char(v876);
            char v876 = asc_20E77[++v875];
          }
          while (v875 != 2);
        }
        dword_9DA80 = 0;
      }
      goto LABEL_2922;
    }
    if (v651 != 0x200000 && v651 != 0x400000) {
      goto LABEL_2120;
    }
LABEL_2049:
    escape_number((unsigned __int8 **)v645, **(unsigned char **)((char *)&stru_20.maxprot + (void)pLangGlb));
    if (nLangIDGlb == 7)
    {
      if (*(void *)(v645 + 24) == 32)
      {
        v660 = *(unsigned __int8 **)v645;
        if (byte_9D9E8 == 1)
        {
          v661 = "'.";
          goto LABEL_2058;
        }
        v685 = "!,";
        goto LABEL_2167;
      }
    }
    else
    {
      if (nLangIDGlb != 9 || nSubLangIDGlb != 3)
      {
        if (nLangIDGlb == 12 && *(void *)(v645 + 24) == 256)
        {
          if (qword_9D9F8 >= 2) {
            ++qword_9D9F8;
          }
          std_char(33);
        }
        goto LABEL_2169;
      }
      if (*(void *)(v645 + 24) == 32)
      {
        v660 = *(unsigned __int8 **)v645;
        if (byte_9D9E8 == 1)
        {
          v661 = "#.";
LABEL_2058:
          if (!strcmp((const char *)v660, v661)) {
            byte_9D9E8 = 0;
          }
          goto LABEL_2169;
        }
        v685 = "## ";
LABEL_2167:
        if (!strcmp((const char *)v660, v685)) {
          byte_9D9E8 = 1;
        }
        goto LABEL_2169;
      }
    }
    do
    {
LABEL_2169:
      BOOL v694 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
      if (v694 && *(void *)(qword_9DA30 + 24) == 256)
      {
        if (qword_9D9F8 >= 2) {
          ++qword_9D9F8;
        }
        std_char(33);
      }
      v695 = (char *)v26[324];
      std_char(*v695);
      v26[324] = (unsigned __int8 *)(v695 + 1);
    }
    while (v695[1]);
    goto LABEL_2922;
  }
LABEL_2986:
  if (byte_9DA54 == 1)
  {
    if (byte_9D9E8 == 1)
    {
      close_math_passage(1);
    }
    else if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
    {
      uint64_t v942 = 0;
      char v943 = 60;
      do
      {
        std_char(v943);
        char v943 = asc_2A493[++v942];
      }
      while (v942 != 2);
    }
    else if (nLangIDGlb == 7)
    {
      uint64_t v940 = 0;
      char v941 = 39;
      do
      {
        std_char(v941);
        char v941 = asc_29F0C[++v940];
      }
      while (v940 != 2);
    }
    byte_9DA54 = 0;
  }
  if (dword_9DA80)
  {
    v944 = *(unsigned char **)&stru_B8.segname[(void)pLangGlb - 8];
    char v947 = *v944;
    v946 = v944 + 1;
    char v945 = v947;
    do
    {
      std_char(v945);
      int v948 = *v946++;
      char v945 = v948;
    }
    while (v948);
    dword_9DA80 = 0;
  }
  uint64_t v949 = qword_9DA48;
  if (qword_9DA48)
  {
    do
    {
      v950 = (void *)v949;
      uint64_t v949 = *(void *)(v949 + 48);
      qword_9DA48 = v949;
      free(v950);
    }
    while (v949);
    qword_9DA30 = (uint64_t)v950;
  }
  free((void *)qword_9DA88);
  qword_9DA88 = 0;
  v951 = (unsigned char *)v27[320];
  unsigned char *v951 = 0;
  uint64_t v952 = qword_9DA08;
  if (v951 == (unsigned char *)qword_9DA08) {
    return 111;
  }
  if (bMemoryOverflow) {
    return 8;
  }
  if (v990)
  {
    qword_9D9F8 = 0;
    v953 = (unsigned __int8 *)qword_9DA40;
    v16[327] = (unsigned __int8 *)qword_9DA40;
    v954 = (char *)qword_9DA10;
    v27[320] = qword_9DA10;
    if (v954 != (char *)v952)
    {
      uint64_t v955 = 0;
      uint64_t v956 = 0;
      uint64_t v957 = 0;
      do
      {
        unsigned int v958 = *v954;
        if (!*v954 || v958 < 0x21 || v958 == 160)
        {
          unsigned int v959 = *v953;
          if (*v953)
          {
            int64_t v960 = 0;
            v961 = v953 + 1;
            while (v959 >= 0x21 && v959 != 160)
            {
              v16[327] = &v961[v960];
              int64_t v962 = v960 + 1;
              unsigned int v959 = v961[v960++];
              if (!v959) {
                goto LABEL_3027;
              }
            }
            int64_t v962 = v960;
          }
          else
          {
            int64_t v962 = 0;
          }
LABEL_3027:
          unint64_t v963 = v962;
          if (v956 >= 2) {
            unint64_t v963 = v962 / (v956 - 1);
          }
          uint64_t v964 = v955 + v962;
          uint64_t v965 = v955 + v962 - 1;
          if (v963 <= 1) {
            uint64_t v966 = 1;
          }
          else {
            uint64_t v966 = v963;
          }
          uint64_t v967 = qword_9DA10;
          v968 = &v954[-qword_9DA10];
          while (v957 < (uint64_t)v968)
          {
            v990[v957] = v955;
            if (!*(unsigned char *)(v967 + v957) || !memchr("#\"!'><$\x7F", *(unsigned __int8 *)(v967 + v957), 9uLL))
            {
              v955 += v966;
              qword_9D9F8 = v955;
            }
            if (v955 >= v964)
            {
              qword_9D9F8 = v965;
              uint64_t v955 = v965;
            }
            ++v957;
          }
          if (v956 >= 2 && v957 >= 2) {
            v990[v957 - 1] = v965;
          }
          unsigned int v969 = *v954;
          uint64_t v16 = (unsigned __int8 **)&unk_9D000;
          uint64_t v27 = &unk_9D000;
          if (!*v954)
          {
LABEL_3060:
            v990[v957] = v965;
            break;
          }
          while (v969 < 0x21 || v969 == 160)
          {
            if (v969 == 31)
            {
              size_t v970 = strlen(v954);
              memmove(v954, v954 + 1, v970);
              v954 = (char *)qword_9DA00;
            }
            else
            {
              LODWORD(v965) = v965 + 1;
              v990[v957++] = v965;
              qword_9DA00 = (uint64_t)++v954;
            }
            unsigned int v969 = *v954;
            if (!*v954) {
              goto LABEL_3060;
            }
          }
          v953 = (unsigned __int8 *)qword_9DA38;
          unsigned int v971 = *(unsigned __int8 *)qword_9DA38;
          if (*(unsigned char *)qword_9DA38)
          {
            v972 = (unsigned __int8 *)(qword_9DA38 + 1);
            do
            {
              if (v971 >= 0x21 && v971 != 160) {
                break;
              }
              qword_9DA38 = (uint64_t)v972;
              unsigned int v973 = *v972++;
              unsigned int v971 = v973;
            }
            while (v973);
            v953 = v972 - 1;
          }
          uint64_t v956 = 0;
          uint64_t v955 = (uint64_t)&v953[-qword_9DA40];
          qword_9D9F8 = (uint64_t)&v953[-qword_9DA40];
          uint64_t v952 = qword_9DA08;
        }
        else
        {
          if (!memchr("#\"!'><$\x7F", v958, 9uLL)) {
            ++v956;
          }
          v27[320] = ++v954;
        }
      }
      while (v954 != (char *)v952);
    }
  }
  if (!(nEncodingGlb | bUpShiftGlb)) {
    return 0;
  }
  v974 = (unsigned char *)qword_9DA10;
  unsigned int v975 = *(unsigned __int8 *)qword_9DA10;
  if (*(unsigned char *)qword_9DA10)
  {
    do
    {
      if (pCharmapGlb && v975 >= 0x21 && v975 != 160 && (v975 - 150 > 0x17 || ((1 << (v975 + 106)) & 0x800003) == 0))
      {
        LOBYTE(v975) = *(unsigned char *)(pCharmapGlb + v975);
        unsigned char *v974 = v975;
      }
      if (bUpShiftGlb)
      {
        if ((char)v975 >= 96) {
          unsigned char *v974 = v975 & 0xDF;
        }
      }
      unsigned int v976 = *++v974;
      unsigned int v975 = v976;
    }
    while (v976);
  }
  uint64_t result = 0;
  v27[320] = v974;
  return result;
}

uint64_t backward_disabled(unsigned __int8 *a1)
{
  int v1 = *(int *)((char *)&dword_8 + (void)pBwdLangGlb);
  if (v1 < 0) {
    return 1;
  }
  uint64_t v3 = a1 - 1;
  uint64_t v4 = a1 + 1;
  int v5 = (unsigned __int8 **)(*pBwdLangGlb + 4);
  int v6 = v1 + 1;
  while (*(v5 - 2) != (unsigned char *)&dword_0 + 1
       || **(v5 - 4) != *a1
       || !no_exception(0, *v5, v3)
       || !no_exception(1, v5[1], v4))
  {
    v5 += 8;
    if (!--v6) {
      return 1;
    }
  }
  return 0;
}

uint64_t bwd_fetch_char(char *a1, char *__s1, int a3, int a4)
{
  if (*__s1 == stru_B8.segname[(void)pLangGlb + 3])
  {
    int v8 = __s1[1];
    *a1 = v8;
    switch(nLangIDGlb)
    {
      case 12:
        if (v8 != 58)
        {
          if (v8 != 124) {
            goto LABEL_28;
          }
          char v9 = __s1[2];
          if (!memchr("123", v9, 4uLL) || __s1[3] && memchr("#123456789", __s1[3], 0xBuLL))
          {
            LOBYTE(v8) = 32;
          }
          else
          {
            if (v9 == 51) {
              char v21 = -77;
            }
            else {
              char v21 = -71;
            }
            if (v9 == 50) {
              LOBYTE(v8) = -78;
            }
            else {
              LOBYTE(v8) = v21;
            }
          }
          goto LABEL_27;
        }
        goto LABEL_24;
      case 9:
        if (nSubLangIDGlb == 1)
        {
          if (v8 <= 48)
          {
            if (v8 == 47)
            {
              LOBYTE(v8) = 36;
            }
            else
            {
              if (v8 != 48) {
                goto LABEL_28;
              }
              LOBYTE(v8) = 43;
            }
            goto LABEL_27;
          }
          if (v8 == 124) {
            goto LABEL_24;
          }
          if (v8 != 49)
          {
LABEL_28:
            if (memchr("+-*/=.:", v8, 8uLL)) {
              return 1;
            }
            goto LABEL_29;
          }
LABEL_26:
          LOBYTE(v8) = 42;
          goto LABEL_27;
        }
        break;
      case 7:
        if (v8 == 33)
        {
          if (__s1[2] != 40)
          {
            LOBYTE(v8) = 33;
            goto LABEL_28;
          }
          goto LABEL_26;
        }
        if (v8 == 56)
        {
LABEL_24:
          LOBYTE(v8) = 47;
LABEL_27:
          *a1 = v8;
          goto LABEL_28;
        }
        break;
      default:
        goto LABEL_28;
    }
    if (v8 != 40) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
LABEL_29:
  if (a4)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)((char *)&dword_10 + (void)pBwdLangGlb);
    do
    {
      if (!strcmp(__s1, *(const char **)(v11 + 8 * v10)))
      {
        char v22 = v10 - 64;
        goto LABEL_96;
      }
      ++v10;
    }
    while (v10 != 64);
  }
  for (unint64_t i = 30; i != 256; ++i)
  {
    if (strcmp(__s1, *(const char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * i))) {
      continue;
    }
    if ((int)i <= 60)
    {
      if (i == 30)
      {
        if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
        {
LABEL_83:
          char v22 = 34;
          goto LABEL_96;
        }
        goto LABEL_66;
      }
      if (i == 31)
      {
        if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
          goto LABEL_83;
        }
        goto LABEL_66;
      }
      goto LABEL_60;
    }
    if ((int)i <= 138)
    {
      switch(i)
      {
        case 0x3D:
          if (nLangIDGlb == 12) {
            goto LABEL_83;
          }
          goto LABEL_66;
        case 0x5D:
          char v22 = 93;
          goto LABEL_96;
        case 0x82:
          char v22 = -111;
          goto LABEL_96;
      }
      goto LABEL_60;
    }
    if ((int)i > 145)
    {
      switch(i)
      {
        case 0x92:
          char v22 = -110;
          goto LABEL_96;
        case 0x94:
          goto LABEL_83;
        case 0x9B:
          char v22 = 62;
          goto LABEL_96;
      }
LABEL_60:
      if ((_BYTE)i && (uint64_t v15 = memchr("'\"\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", i, 0xDuLL), i >= 0x80) && v15) {
        char v13 = 34;
      }
      else {
        char v13 = i;
      }
      goto LABEL_65;
    }
    if (i != 139) {
      goto LABEL_60;
    }
    char v13 = 60;
LABEL_65:
    *a1 = v13;
LABEL_66:
    if (!a3) {
      return 1;
    }
    BOOL v17 = nLangIDGlb != 9 || nSubLangIDGlb != 3;
    uint64_t result = 1;
    if (nLangIDGlb == 10 || !v17) {
      return result;
    }
    a3 = 0;
  }
  if (a4) {
    return 0;
  }
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)((char *)&dword_10 + (void)pBwdLangGlb);
  while (strcmp(__s1, *(const char **)(v20 + 8 * v19)))
  {
    if (++v19 == 64) {
      return 0;
    }
  }
  char v22 = v19 - 64;
LABEL_96:
  *a1 = v22;
  return 1;
}

BOOL bwd_fetch_ueb_char(unsigned char *a1, char *__s1)
{
  uint64_t v4 = *(void *)((char *)&stru_20.cmd + (void)pLangGlb);
  uint64_t v5 = 33;
  while (strcmp(__s1, *(const char **)(v4 + 8 * v5)))
  {
    if (++v5 == 256)
    {
      LOBYTE(v5) = __s1[2];
      BOOL result = in(v5, 9);
      if (!result) {
        return result;
      }
      break;
    }
  }
  *a1 = v5;
  return 1;
}

uint64_t bwd_rightchar_follows(unsigned __int8 *a1)
{
  char v2 = 0;
  uint64_t v3 = pBwdLangGlb;
  int v4 = nLangIDGlb;
  BOOL v5 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
  char v6 = v5;
  char v7 = v6 ^ 1;
  while (1)
  {
    unsigned int v8 = *a1;
    if (v8 - 46 >= 2)
    {
      if (!*a1) {
        return v2 & (v8 < 0x21);
      }
    }
    else if (v8 == a1[1])
    {
      return v2 & (v8 < 0x21);
    }
    if (!no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)v3), a1)
      && !no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v3 + 8], a1))
    {
      return v2 & (v8 < 0x21);
    }
    if (v4 == 7)
    {
      char v9 = a1;
      uint64_t v10 = "'<=";
      while (1)
      {
        do
          int v11 = *v9++;
        while (v11 == 173 || v11 == 30);
        if (v11 != *(unsigned __int8 *)v10) {
          break;
        }
        if (++v10 == "")
        {
          ++a1;
          char v13 = *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v3);
          goto LABEL_29;
        }
      }
    }
    BOOL v5 = v8 == 39;
    char v13 = *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v3);
    if (v5) {
      char v14 = v7;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0
      && no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v3), a1 + 1))
    {
      ++a1;
    }
LABEL_29:
    char v2 = 1;
    a1 += no_exception(1, v13, a1) + 1;
  }
}

uint64_t bwd_char(uint64_t result)
{
  if (qword_9D9F8 <= 0)
  {
    int v1 = (unsigned char *)qword_9DA00;
    uint64_t v2 = qword_9DA08;
  }
  else
  {
    int v1 = (unsigned char *)qword_9DA00;
    uint64_t v2 = qword_9DA08;
    if (!--qword_9D9F8)
    {
      if (qword_9DA00 == qword_9DA08) {
        return result;
      }
      *(unsigned char *)qword_9DA00 = 30;
      qword_9DA00 = (uint64_t)++v1;
    }
  }
  if (v1 != (unsigned char *)v2)
  {
    unsigned char *v1 = result;
    qword_9DA00 = (uint64_t)(v1 + 1);
  }
  return result;
}

uint64_t bwd_string(unsigned char *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    uint64_t result = bwd_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }
  while (v4);
  return result;
}

void bwd_increment_cursor()
{
  if (qword_9D9F8 >= 2) {
    ++qword_9D9F8;
  }
}

BOOL bwd_is_number(unsigned char *a1)
{
  if (*a1 != 35) {
    return 0;
  }
  unsigned int v2 = a1[1];
  if (a1[1])
  {
    if (v2 - 107 > 0xFFFFFFF5) {
      return 1;
    }
    int v3 = 0;
    if (v2 == 39)
    {
      char v5 = 1;
      goto LABEL_14;
    }
    if (v2 == 30)
    {
      int v3 = 1;
      BOOL result = 1;
      if (a1[2] - 107 > 0xFFFFFFF5) {
        return result;
      }
    }
  }
  else
  {
    int v3 = 0;
  }
  if (v2 == stru_B8.segname[(void)pLangGlb + 1])
  {
    char v5 = 0;
  }
  else
  {
    char v5 = 0;
    if (v2 != stru_B8.segname[(void)pLangGlb + 2]) {
      goto LABEL_15;
    }
  }
LABEL_14:
  if (a1[2] - 107 > 0xFFFFFFF5) {
    return 1;
  }
LABEL_15:
  int v6 = nLangIDGlb;
  if (nLangIDGlb != 9)
  {
    if (!v3) {
      goto LABEL_34;
    }
    goto LABEL_23;
  }
  if (v2 <= 0x2D
    && ((1 << v2) & 0x209000000000) != 0
    && a1[2]
    && memchr(",;:/?+=(*)", a1[2], 0xBuLL))
  {
    return 1;
  }
  if (v3)
  {
LABEL_23:
    unsigned int v7 = a1[2];
    if ((v7 == 39
       || v7 == stru_B8.segname[(void)pLangGlb + 1]
       || v7 == stru_B8.segname[(void)pLangGlb + 2])
      && a1[3] - 107 > 0xFFFFFFF5)
    {
      return 1;
    }
    char v8 = v3 ^ 1;
    if (v6 != 9) {
      char v8 = 1;
    }
    if ((v8 & 1) == 0
      && v7 <= 0x2D
      && ((1 << v7) & 0x209000000000) != 0
      && a1[3]
      && memchr(",;:/?+=(*)", a1[3], 0xBuLL))
    {
      return 1;
    }
  }
LABEL_34:
  if (((v5 & 1) != 0
     || v2 == stru_B8.segname[(void)pLangGlb + 1]
     || v2 == stru_B8.segname[(void)pLangGlb + 2])
    && a1[2] == 30
    && a1[3] - 107 > 0xFFFFFFF5)
  {
    return 1;
  }
  if (v6 == 9)
  {
    if (v2 > 0x2D
      || ((1 << v2) & 0x209000000000) == 0
      || a1[2] != 30
      || !a1[3]
      || !memchr(",;:/?+=(*)", a1[3], 0xBuLL))
    {
      goto LABEL_63;
    }
    return 1;
  }
  if (v6 != 7) {
    goto LABEL_63;
  }
  if (v2 == 45 && (a1[2] | 2) == 0x2E && a1[3] - 107 > 0xFFFFFFF5
    || v3
    && a1[2] == 45
    && (a1[3] | 2) == 0x2E
    && a1[4] - 107 > 0xFFFFFFF5)
  {
    return 1;
  }
  if (v2 != 45) {
    goto LABEL_63;
  }
  int v9 = a1[2];
  if (v9 == 46 || v9 == 44)
  {
    if (a1[3] == 30 && a1[4] - 107 > 0xFFFFFFF5) {
      return 1;
    }
  }
  else if (v9 == 30 && (a1[3] | 2) == 0x2E && a1[4] - 107 >= 0xFFFFFFF6)
  {
    return 1;
  }
LABEL_63:
  BOOL result = 0;
  if (v6 == 12 || (lFlags & 0x40000000) != 0) {
    return result;
  }
  if (!v2)
  {
    if (v3) {
      goto LABEL_73;
    }
    return 0;
  }
  uint64_t v10 = memchr(",;:/?+=(*)", v2, 0xBuLL);
  BOOL v11 = v10 == 0;
  BOOL result = v10 != 0;
  if (v11) {
    char v12 = v3;
  }
  else {
    char v12 = 0;
  }
  if (v12)
  {
LABEL_73:
    if (a1[2]) {
      return memchr(",;:/?+=(*)", a1[2], 0xBuLL) != 0;
    }
    return 0;
  }
  return result;
}

uint64_t bwd_add_char(uint64_t result)
{
  uint64_t v1 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = result;
  qword_9DA00 = v1 + 1;
  return result;
}

unsigned __int8 *bwd_add_string(unsigned __int8 *a1)
{
  int v3 = *a1;
  BOOL result = a1 + 1;
  int v2 = v3;
  int v4 = (unsigned char *)qword_9DA00;
  do
  {
    if (v2 == 39) {
      LOBYTE(v2) = 46;
    }
    *v4++ = v2;
    int v5 = *result++;
    int v2 = v5;
  }
  while (v5);
  qword_9DA00 = (uint64_t)v4;
  return result;
}

void bwd_add_list_element()
{
  if (bMemoryOverflow) {
    return;
  }
  uint64_t v0 = qword_9DA48;
  uint64_t v1 = malloc_type_malloc(0x38uLL, 0x1030040B94BF364uLL);
  if (!v0)
  {
    qword_9DA48 = (uint64_t)v1;
    if (v1)
    {
      v1[5] = 0;
      goto LABEL_8;
    }
LABEL_12:
    bMemoryOverflow = 1;
    return;
  }
  uint64_t v2 = qword_9DA30;
  *(void *)(qword_9DA30 + 48) = v1;
  if (!v1) {
    goto LABEL_12;
  }
  v1[5] = v2;
  uint64_t v1 = *(void **)(v2 + 48);
LABEL_8:
  qword_9DA30 = (uint64_t)v1;
  v1[6] = 0;
  v1[2] = 0;
  unint64_t v3 = lFlags & 0xFFFFFFFF7FEFFBFFLL;
  v1[4] = lFlags & 0xFFFFFFFF7FEFFBFFLL | 0x80000000;
  if ((byte_9D9EC & 1) != 0 || byte_9DA54)
  {
    if (nLangIDGlb == 7) {
      uint64_t v4 = 2147516414;
    }
    else {
      uint64_t v4 = 2147549183;
    }
    v1[4] = v3 | v4;
  }
}

uint64_t bwd_set_list_element(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = qword_9DA30;
  if (qword_9DA30)
  {
    *(void *)qword_9DA30 = result;
    *(void *)(v3 + 8) = a2;
    *(void *)(v3 + 24) = a3;
  }
  return result;
}

void bwd_add_space()
{
  uint64_t v0 = qword_9DA00;
  if (byte_9DA50) {
    char v1 = 31;
  }
  else {
    char v1 = 32;
  }
  *(unsigned char *)qword_9DA00 = v1;
  qword_9DA00 = v0 + 1;
}

uint64_t bwd_keep_contraction()
{
  uint64_t v0 = (unsigned __int8 *)qword_9DA20;
  if (qword_9DA00 - qword_9DA20 < 2) {
    return 1;
  }
  if (nLangIDGlb == 7)
  {
    int v2 = *(unsigned __int8 *)(qword_9DA00 - 2);
    return v2 == 44 || v2 == 33;
  }
  else
  {
    if (nLangIDGlb == 9 && nSubLangIDGlb != 3)
    {
      int v5 = "*+";
      while (1)
      {
        do
          int v6 = *v0++;
        while (v6 == 173 || v6 == 30);
        if (v6 != *(unsigned __int8 *)v5) {
          break;
        }
        if (++v5 == "") {
          return 1;
        }
      }
    }
    if (nLangIDGlb == 12) {
      return no_exception(1, "\tq.\x01[82cklmntvx])\x01[bdlms]=\x01[9aekx]+\x01", (unsigned __int8 *)(qword_9DA00 - 2));
    }
    else {
      return 0;
    }
  }
}

void bwd_add_seg(uint64_t a1)
{
  BOOL v1 = (a1 & 0x7000004) == 0 && qword_9DA18 == a1;
  if (v1) {
    return;
  }
  unsigned __int8 v144 = 0;
  uint64_t v2 = qword_9DA38;
  uint64_t v3 = &unk_9D000;
  uint64_t v143 = qword_9DA38;
  if ((qword_9DA18 & 0x102400) == 0)
  {
    int v5 = (unsigned __int8 *)qword_9DA00;
    unint64_t v6 = qword_9DA20;
    goto LABEL_45;
  }
  int v4 = bwd_keep_contraction();
  int v5 = (unsigned __int8 *)qword_9DA00;
  unint64_t v6 = qword_9DA20;
  if (v4) {
    goto LABEL_45;
  }
  unsigned int v7 = pBwdLangGlb;
  int v8 = nLangIDGlb;
  BOOL v9 = nLangIDGlb == 9;
  BOOL v10 = nSubLangIDGlb == 3 && nLangIDGlb == 9;
  BOOL __src = v10;
  if (nSubLangIDGlb == 3) {
    BOOL v9 = 0;
  }
  BOOL v134 = v9;
  unsigned __int8 v137 = pLangGlb;
  BOOL v11 = *(unsigned __int8 **)&stru_20.segname[(void)pBwdLangGlb + 16];
  uint64_t v12 = v2;
  while (1)
  {
    char v13 = v5 - 1;
    if (!no_exception(0, v11, v5 - 1)
      && !no_exception(0, *(unsigned __int8 **)((char *)&dword_18 + (void)v7), v5 - 1))
    {
      break;
    }
    v3[320] = v13;
    uint64_t v14 = v12 - 1;
    qword_9DA38 = v12 - 1;
    uint64_t v15 = (uint64_t)&v13[-v6];
    if (v8 == 7)
    {
      if (v15 <= 1) {
        goto LABEL_31;
      }
      uint64_t v16 = v5 - 3;
      BOOL v17 = "'<=";
      while (1)
      {
        do
          int v18 = *v16++;
        while (v18 == 173 || v18 == 30);
        if (v18 != *(unsigned __int8 *)v17) {
          break;
        }
        if (++v17 == "") {
          goto LABEL_30;
        }
      }
    }
    BOOL v100 = v15 <= 1;
    BOOL v20 = __src;
    if (v100) {
      BOOL v20 = 0;
    }
    if (v20
      && *(v5 - 3) == 39
      && no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v7 + 8], v5 - 3))
    {
LABEL_30:
      char v13 = v5 - 2;
      qword_9DA00 = (uint64_t)(v5 - 2);
      uint64_t v14 = v12 - 2;
      qword_9DA38 = v12 - 2;
    }
LABEL_31:
    if ((uint64_t)&v13[-v6] < 1) {
      goto LABEL_40;
    }
    int v5 = v13 - 1;
    if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v7), v13 - 1))
    {
      int v21 = *v5;
    }
    else if (!v134 || *v13 != 46 || (int v21 = *v5, v21 != 61))
    {
LABEL_40:
      int v5 = v13;
      goto LABEL_41;
    }
    if (v21 != *(unsigned __int8 *)v137[11]
      && !no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v7 + 8], v13 - 1))
    {
      goto LABEL_40;
    }
    qword_9DA00 = (uint64_t)(v13 - 1);
    qword_9DA38 = --v14;
LABEL_41:
    uint64_t v2 = v143;
    uint64_t v12 = v14;
    uint64_t v3 = (void *)&unk_9D000;
    if (bwd_keep_contraction()) {
      goto LABEL_45;
    }
  }
  uint64_t v2 = v143;
LABEL_45:
  uint64_t v22 = (uint64_t)&v5[-v6];
  if ((unint64_t)v5 <= v6) {
    goto LABEL_238;
  }
  unsigned __int8 *v5 = 0;
  v3[320] = v5 + 1;
  bwd_add_list_element();
  uint64_t v23 = qword_9DA18;
  if (qword_9DA18 != 0x2000)
  {
    uint64_t v25 = qword_9DA30;
    goto LABEL_235;
  }
  unsigned __int8 v135 = (dword_9DAA0 != 0) | byte_9DA90;
  if (!((dword_9DAA0 != 0) | byte_9DA90 & 1))
  {
    BOOL v24 = &unk_9D000;
    if ((byte_9DAA4 & 1) == 0 && !dword_9D9F0)
    {
      int v130 = 0;
      uint64_t v23 = 0x2000;
      goto LABEL_113;
    }
    byte_9DAA4 = 0;
    if (nLangIDGlb != 7)
    {
      int v130 = 1;
      uint64_t v23 = 1024;
      goto LABEL_113;
    }
    BOOL v26 = (unsigned __int8 *)qword_9DA20;
    uint64_t v27 = (void *)qword_9DA30;
    if (qword_9DA30)
    {
      *(void *)qword_9DA30 = qword_9DA20;
      v27[1] = v22;
      v27[3] = 32;
    }
    int v28 = *v26;
    int v29 = **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb);
    BOOL v30 = v28 != v29;
    if (v27 && v28 != v29) {
      v27[4] = 0x100000;
    }
    v3[320] = v26;
    word_9DAA6 = 0;
    unsigned __int8 v31 = *v26;
    unsigned __int8 v32 = v26;
    while (1)
    {
      if ((char)v31 > 95)
      {
        if (v31 == 126)
        {
          unsigned __int8 v31 = -33;
          goto LABEL_69;
        }
        if (v31 == 96)
        {
          unsigned __int8 v31 = -28;
          goto LABEL_69;
        }
      }
      else
      {
        if (v31 == 56)
        {
          unsigned __int8 v31 = -4;
          goto LABEL_69;
        }
        if (v31 == 57)
        {
          unsigned __int8 v31 = -10;
LABEL_69:
          *unsigned __int8 v32 = v31;
LABEL_70:
          unint64_t v33 = v32;
          goto LABEL_71;
        }
      }
      if (**(unsigned __int8 **)((char *)&stru_20.nsects + (void)pLangGlb) != v31) {
        goto LABEL_70;
      }
      unint64_t v33 = v32 + 1;
      unsigned __int8 v43 = v32[1];
      if (!v43) {
        goto LABEL_70;
      }
      byte_9DAA5 = v31;
      LOBYTE(word_9DAA6) = v43;
      *((void *)v24 + 324) = v33;
      if (bwd_fetch_char((char *)&v144, &byte_9DAA5, 0, 1)) {
        *unint64_t v33 = v144;
      }
      LOBYTE(word_9DAA6) = 0;
      unsigned __int8 v31 = *v33;
      BOOL v24 = &unk_9D000;
LABEL_71:
      if (**(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb) == v31)
      {
        if (v33[1] != 126) {
          BOOL v30 = 0;
        }
        goto LABEL_110;
      }
      int v34 = v33;
      char v35 = *(unsigned __int8 **)&stru_68.sectname[(void)pLangGlb];
      while (1)
      {
        do
          int v36 = *v34++;
        while (v36 == 173 || v36 == 30);
        if (v36 != *v35) {
          break;
        }
        if (!*++v35)
        {
          unint64_t v33 = &v33[strlen(*(const char **)&stru_68.sectname[(void)pLangGlb]) - 1];
          BOOL v30 = 1;
          goto LABEL_104;
        }
      }
      unsigned int v39 = *(const char **)((char *)&stru_20.filesize + (void)pLangGlb);
      if (*(unsigned __int8 *)v39 != v31)
      {
        BOOL v24 = &unk_9D000;
        if (v31)
        {
          if (v31 > 0xDEu || (v31 - 123) >= 0xE6u)
          {
            if (v30) {
              v31 &= ~0x20u;
            }
          }
          else if (v31 <= 0xBFu && (v31 - 91) <= 0xE5u)
          {
            goto LABEL_100;
          }
        }
        else
        {
LABEL_100:
          byte_9DAA5 = *v26;
          if (bwd_fetch_char((char *)&v144, &byte_9DAA5, 0, 0)) {
            unsigned __int8 v31 = v144;
          }
          else {
            unsigned __int8 v31 = *v33;
          }
          BOOL v24 = &unk_9D000;
        }
        *v26++ = v31;
        v3[320] = v26;
        goto LABEL_110;
      }
      size_t v40 = strlen(v39);
      unsigned int v41 = v33[v40];
      if (v33[v40] && (v41 <= 0xDE ? (BOOL v42 = v41 - 123 >= 0xFFFFFFE6) : (BOOL v42 = 1), v42))
      {
        BOOL v30 = 0;
        v33[v40] = v41 & 0xDF;
      }
      else
      {
        BOOL v30 = 0;
      }
      unint64_t v33 = &v33[v40 - 1];
LABEL_104:
      BOOL v24 = &unk_9D000;
LABEL_110:
      unsigned __int8 v32 = v33 + 1;
      *((void *)v24 + 324) = v33 + 1;
      unsigned __int8 v31 = v33[1];
      if (!v31)
      {
        *BOOL v26 = 0;
        int v5 = v26 + 1;
        v3[320] = v5;
        *((void *)v24 + 324) = v5;
        goto LABEL_304;
      }
    }
  }
  int v130 = 0;
  dword_9DAA0 = 0;
  uint64_t v23 = 0x100000;
  BOOL v24 = &unk_9D000;
LABEL_113:
  uint64_t v25 = qword_9DA30;
  if (v22 < 2 || !bwd_exceptions[0])
  {
    uint64_t v44 = (uint64_t)&v5[-v6];
    if (!qword_9DA30) {
      goto LABEL_212;
    }
    goto LABEL_118;
  }
  if ((~*(_DWORD *)(qword_9DA30 + 32) & 0x7FFELL) == 0)
  {
    uint64_t v44 = (uint64_t)&v5[-v6];
    goto LABEL_122;
  }
  uint64_t v75 = 0;
  v76 = (char *)*((void *)v24 + 324);
  uint64_t v127 = qword_9DA08;
  uint64_t v129 = v23;
  BOOL v131 = v76;
  uint64_t v133 = v3[320];
  int v77 = 1;
  v78 = v76;
  uint64_t v44 = v22;
  while (2)
  {
    while (2)
    {
      v79 = &bwd_exceptions[160 * v75];
      uint64_t v82 = *((void *)v79 + 19);
      char v81 = v79 + 152;
      int v80 = v82;
      if ((v82 & 0x1C000) != 0)
      {
        uint64_t v83 = *(void *)&bwd_exceptions[160 * v75 + 136];
LABEL_176:
        if (v83 <= v22)
        {
          uint64_t v84 = 0;
          int v85 = bwd_exceptions[160 * v75];
          while (v78[v84] == v85)
          {
            int v85 = bwd_exceptions[160 * v75 + 1 + v84++];
            if (!v85)
            {
              if (v83 == v44)
              {
                if ((v80 & 0x2000) != 0)
                {
                  unsigned int v122 = (void *)qword_9DA30;
                  if (qword_9DA30)
                  {
                    uint64_t v123 = &bwd_exceptions[160 * v75 + 65];
                    uint64_t v124 = *(void *)&bwd_exceptions[160 * v75 + 144];
                    *(void *)qword_9DA30 = v123;
                    v122[1] = v124;
                    v122[3] = 32;
                    if ((v80 & 0x600) == 0
                      && ((v135 & 1) != 0
                       || (char v125 = *v123) != 0
                       && ((v125 + 33) > 0xE0u || (v125 - 91) >= 0xE6u)))
                    {
                      v122[4] = 0x100000;
                    }
                  }
                  int v5 = (unsigned __int8 *)*((void *)v24 + 324);
                  goto LABEL_303;
                }
              }
              else
              {
                if ((v80 & 0x4000) == 0 || v78 != v76)
                {
                  if (v78[v84])
                  {
                    if ((v80 & 0x8000) == 0 || v78 <= v76) {
                      break;
                    }
                  }
                  else if ((v80 & 0x10000) == 0)
                  {
                    break;
                  }
                }
                uint64_t v86 = &bwd_exceptions[160 * v75];
                int64_t v89 = *((void *)v86 + 18);
                int v88 = (size_t *)(v86 + 144);
                size_t v87 = v89;
                uint64_t v90 = v89 - v83;
                __srcb = &v78[v84];
                if (v89 <= v83 || v127 - v133 <= v90)
                {
                  uint64_t v139 = v44;
                }
                else
                {
                  uint64_t v139 = v90 + v44;
                  v133 += v90;
                  qword_9DA00 = v133;
                  __dst = &v78[v87];
                  size_t v91 = strlen(&v78[v84]);
                  memmove(__dst, __srcb, v91 + 1);
                  size_t v87 = *v88;
                }
                memcpy(v78, &bwd_exceptions[160 * v75 + 65], v87);
                v76 = v131;
                if ((v81[1] & 6) == 0 && v78 != v131)
                {
                  char v92 = *v78;
                  if (*v78)
                  {
                    if ((v92 + 33) > 0xE0u || (v92 - 91) >= 0xE6u) {
                      char *v78 = v92 | 0x20;
                    }
                  }
                }
                v22 -= *(void *)&bwd_exceptions[160 * v75 + 136];
                size_t v93 = *v88;
                v78 += *v88;
                uint64_t v44 = v139;
                if (__srcb <= v78)
                {
                  int v77 = 0;
                  uint64_t v3 = (void *)&unk_9D000;
                }
                else
                {
                  uint64_t v94 = v139 + v93 - v84;
                  uint64_t v3 = &unk_9D000;
                  uint64_t v133 = v133 + v93 - v84;
                  qword_9DA00 = v133;
                  size_t v95 = strlen(__srcb);
                  memmove(v78, __srcb, v95 + 1);
                  v76 = v131;
                  uint64_t v44 = v94;
                  int v77 = 0;
                }
                BOOL v24 = &unk_9D000;
              }
              break;
            }
          }
        }
      }
      else if (v78 == v76)
      {
        uint64_t v83 = v44;
        if (*(void *)&bwd_exceptions[160 * v75 + 136] == v44) {
          goto LABEL_176;
        }
      }
      if (++v75 != 100) {
        continue;
      }
      break;
    }
    uint64_t v75 = 0;
    BOOL v1 = v77 == 0;
    uint64_t v96 = v77 != 0;
    if (!v1) {
      ++v78;
    }
    v22 -= v96;
    int v77 = 1;
    if (v22 > 1) {
      continue;
    }
    break;
  }
  uint64_t v25 = qword_9DA30;
  uint64_t v2 = v143;
  uint64_t v23 = v129;
  if (!qword_9DA30)
  {
LABEL_212:
    int v45 = nLangIDGlb;
    char v74 = 1;
    goto LABEL_214;
  }
LABEL_118:
  if ((v23 & 0x100400) != 0 && v44 <= 1 && ((qword_9DA28 | a1) & 0xC0) != 0)
  {
    int v45 = nLangIDGlb;
    goto LABEL_224;
  }
LABEL_122:
  uint64_t v46 = *(unsigned int *)((char *)&dword_8 + (void)pLangGlb);
  int v45 = nLangIDGlb;
  if ((v46 & 0x80000000) != 0)
  {
    char v74 = 0;
LABEL_214:
    if (v44 >= 2)
    {
      char v97 = (void *)v25;
      uint64_t v98 = v44;
      int v99 = (char *)*((void *)v24 + 324);
      if (v45 == 9 && !no_exception(1, byte_4BA48, *((unsigned __int8 **)v24 + 324)))
      {
        uint64_t v44 = v98;
        uint64_t v25 = (uint64_t)v97;
        goto LABEL_225;
      }
      if (bwd_fetch_char((char *)&v144, v99, 0, 1))
      {
        if ((v74 & 1) == 0)
        {
          *char v97 = v99;
          v97[1] = 1;
          v97[3] = 32;
        }
        if (v97 != 0 && (v135 & 1) != 0) {
          v97[4] = 0x100000;
        }
        *(_WORD *)int v99 = v144;
        int v5 = (unsigned __int8 *)(v99 + 2);
        qword_9DA20 = (uint64_t)v5;
        v3[320] = v5;
        goto LABEL_238;
      }
      uint64_t v44 = v98;
      uint64_t v25 = (uint64_t)v97;
    }
LABEL_224:
    if (v45 != 9)
    {
LABEL_234:
      uint64_t v22 = v44;
LABEL_235:
      uint64_t v104 = &unk_9D000;
      uint64_t v44 = v22;
      if (!v25)
      {
LABEL_237:
        int v5 = (unsigned __int8 *)v3[320];
        v104[324] = v5;
        goto LABEL_238;
      }
LABEL_236:
      *(void *)uint64_t v25 = v104[324];
      *(void *)(v25 + 8) = v44;
      *(void *)(v25 + 24) = v23;
      goto LABEL_237;
    }
LABEL_225:
    if (v2 - qword_9DA38 >= 1)
    {
      BOOL v100 = *(unsigned char *)qword_9DA38 != 47 || v44 < 3;
      if (!v100 && *(unsigned char *)(qword_9DA38 - 2) == 47)
      {
        if ((v130 & 1) != 0
          || (uint64_t v101 = v44,
              uint64_t v102 = v25,
              int v103 = no_exception(0, byte_4BA52, (unsigned __int8 *)(qword_9DA38 - 1)),
              uint64_t v25 = v102,
              uint64_t v44 = v101,
              v103))
        {
          *(void *)(v25 + 32) |= 0x2000uLL;
          uint64_t v104 = (void *)&unk_9D000;
          goto LABEL_236;
        }
      }
    }
    goto LABEL_234;
  }
  uint64_t v128 = v23;
  uint64_t v47 = 0;
  v48 = *pLangGlb;
  int v5 = (unsigned __int8 *)*((void *)v24 + 324);
  __srca = (unsigned __int8 *)qword_9DA38;
  int v138 = nSubLangIDGlb;
  unint64_t v132 = qword_9DA28;
  uint64_t v49 = v44;
  uint64_t v50 = v25;
  uint64_t v51 = *(unsigned int *)((char *)&dword_8 + (void)pLangGlb);
  while (1)
  {
    uint64_t v52 = v48[3];
    if (v52 != v44)
    {
      if (v45 != 9) {
        goto LABEL_157;
      }
      int v54 = no_exception(1, "\t.[cdjlmnts", &v5[v52]);
      uint64_t v46 = v51;
      uint64_t v25 = v50;
      uint64_t v44 = v49;
      if (!v54) {
        goto LABEL_170;
      }
      goto LABEL_130;
    }
    if (v45 != 9) {
      break;
    }
LABEL_130:
    if (v52 > 1) {
      goto LABEL_135;
    }
    int v53 = *__srca;
    if ((v135 & (v53 == 35)) == 0) {
      goto LABEL_132;
    }
LABEL_170:
    v48 += 5;
    BOOL v1 = v47++ == v46;
    if (v1)
    {
      char v74 = 0;
      uint64_t v2 = v143;
      BOOL v24 = &unk_9D000;
      uint64_t v23 = v128;
      goto LABEL_214;
    }
  }
  if (v52 <= 1)
  {
    int v53 = *__srca;
LABEL_132:
    if (v53 == 45)
    {
      int v55 = __srca[1];
      if (v55 == 32 || v55 == 45)
      {
LABEL_157:
        if (v45 == 7)
        {
          uint64_t v66 = *(void *)(v25 + 32);
          if ((v66 & 2) != 0 && v44 == 1)
          {
            int v68 = (unsigned char *)v48[1];
            if (*v68 == 39)
            {
              BOOL v69 = v68 + 1;
              int v70 = v5;
              while (1)
              {
                do
                  int v71 = *v70++;
                while (v71 == 173 || v71 == 30);
                if (v71 != *v69) {
                  break;
                }
                if (!*++v69)
                {
                  uint64_t v60 = v48[4];
                  goto LABEL_169;
                }
              }
            }
          }
        }
        goto LABEL_170;
      }
    }
  }
LABEL_135:
  if (v138 == 3)
  {
    unsigned int v56 = *(unsigned __int8 *)v48[1];
    if (*(unsigned char *)v48[1])
    {
      if (v56 > 0xDE || v56 - 123 >= 0xFFFFFFE6)
      {
        if ((v132 & 4) != 0)
        {
          int v58 = no_exception(1, byte_4BA41, **(unsigned __int8 ***)(v25 + 40));
          uint64_t v46 = v51;
          uint64_t v25 = v50;
          uint64_t v44 = v49;
          if (!v58) {
            goto LABEL_157;
          }
        }
        int v59 = no_exception(1, "\x7F|\x01\"&\x01", __srca);
        uint64_t v46 = v51;
        uint64_t v25 = v50;
        uint64_t v44 = v49;
        if (!v59) {
          goto LABEL_157;
        }
      }
    }
  }
  uint64_t v60 = v48[4];
  if ((v60 & 0x800000) != 0)
  {
    if (v132 > 2) {
      goto LABEL_157;
    }
    unsigned int v67 = *__srca;
    if (v67 >= 0x21 && v67 != 160) {
      goto LABEL_157;
    }
  }
  uint64_t v61 = (unsigned __int8 *)v48[1];
  int v62 = v5;
  do
  {
    do
      int v63 = *v62++;
    while (v63 == 173 || v63 == 30);
    if (v63 != *v61) {
      goto LABEL_157;
    }
  }
  while (*++v61);
  uint64_t v66 = *(void *)(v25 + 32);
LABEL_169:
  if ((v66 & v60 & 0x9000FFFF) != 0) {
    goto LABEL_170;
  }
  uint64_t v116 = v48[2];
  *(void *)uint64_t v25 = *v48;
  *(void *)(v25 + 8) = v116;
  uint64_t v117 = 1024;
  if (v130) {
    uint64_t v117 = 0x100000;
  }
  if (v135) {
    uint64_t v117 = 1049600;
  }
  *(void *)(v25 + 24) = 32;
  *(void *)(v25 + 32) = v117;
  if (v52 < v44)
  {
    bwd_add_list_element();
    uint64_t v118 = v48[3];
    uint64_t v119 = (unsigned char *)(qword_9DA20 + v118);
    uint64_t v2 = v143;
    if ((v128 & 0x400) != 0 && v119[1] == 115)
    {
      uint64_t v120 = qword_9DA30;
      if (qword_9DA30)
      {
        uint64_t v121 = v49 + ~v118;
        *(void *)qword_9DA30 = v119 + 1;
        goto LABEL_297;
      }
    }
    else
    {
      *uint64_t v119 = 39;
      uint64_t v120 = qword_9DA30;
      if (qword_9DA30)
      {
        uint64_t v121 = v49 - v48[3];
        *(void *)qword_9DA30 = v119;
LABEL_297:
        *(void *)(v120 + 8) = v121;
        *(void *)(v120 + 24) = 32;
      }
    }
    int v5 = (unsigned __int8 *)v3[320];
    qword_9DA20 = (uint64_t)v5;
    goto LABEL_238;
  }
LABEL_303:
  v3[320] = v5;
LABEL_304:
  uint64_t v2 = v143;
LABEL_238:
  char v105 = (unsigned __int8 *)qword_9DA38;
  uint64_t v106 = v2 - qword_9DA38;
  if (v2 - qword_9DA38 < 1)
  {
    uint64_t v113 = (void *)qword_9DA30;
  }
  else
  {
    do
    {
      char v107 = pBwdLangGlb;
      v108 = *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb);
      if (v106 == 1 || *v105 != **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb))
      {
        if (no_exception(1, v108, v105)) {
          qword_9DA18 = 0x1000000;
        }
        else {
          qword_9DA18 = 0x4000000;
        }
      }
      else
      {
        if (no_exception(1, v108, v105 + 1))
        {
          qword_9DA18 = 0x1000000;
          qword_9DA38 = (uint64_t)++v105;
        }
        else
        {
          qword_9DA18 = 0x4000000;
        }
        uint64_t v2 = v143;
      }
      if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v107), v105)) {
        BOOL v109 = v2 - (uint64_t)v105 < 2;
      }
      else {
        BOOL v109 = 1;
      }
      if (v109)
      {
        unsigned int v110 = (void *)&unk_9D000;
      }
      else
      {
        *v5++ = *v105;
        unsigned int v110 = &unk_9D000;
        qword_9DA00 = (uint64_t)v5;
        char v105 = (unsigned __int8 *)++qword_9DA38;
      }
      unsigned __int8 *v5 = *v105;
      ++qword_9DA38;
      uint64_t v111 = qword_9DA20;
      v5[1] = 0;
      char v112 = v5 + 1;
      v110[320] = v112 + 1;
      bwd_add_list_element();
      uint64_t v113 = (void *)qword_9DA30;
      if (qword_9DA30)
      {
        uint64_t v114 = qword_9DA18;
        *(void *)qword_9DA30 = qword_9DA20;
        v113[1] = &v112[-v111];
        v113[3] = v114;
      }
      int v5 = (unsigned __int8 *)v110[320];
      qword_9DA20 = (uint64_t)v5;
      char v105 = (unsigned __int8 *)qword_9DA38;
      uint64_t v106 = v2 - qword_9DA38;
    }
    while (v2 - qword_9DA38 > 0);
  }
  if (qword_9D9F8 >= 1 && v113)
  {
    v113[2] = qword_9D9F8;
    qword_9D9F8 = 0;
  }
  if (qword_9DA18) {
    qword_9DA28 = qword_9DA18;
  }
  qword_9DA18 = a1;
  uint64_t v115 = 0x4000;
  if (a1 > 127)
  {
    if (a1 >= 0x100000)
    {
      if (a1 == 0x4000000 || a1 == 0x2000000) {
        goto LABEL_279;
      }
      if (a1 != 0x100000) {
        goto LABEL_273;
      }
    }
    else
    {
      if (a1 == 128) {
        goto LABEL_279;
      }
      if (a1 != 1024 && a1 != 0x2000)
      {
LABEL_273:
        if ((qword_9DA28 & 0x1024C0) != 0)
        {
          uint64_t v115 = 0x10000;
          goto LABEL_279;
        }
        return;
      }
    }
    uint64_t v115 = 0x8000;
    goto LABEL_279;
  }
  if ((unint64_t)a1 >= 3
    && ((unint64_t)(a1 - 4) > 0x3C || ((1 << (a1 - 4)) & 0x1000000010000001) == 0))
  {
    goto LABEL_273;
  }
LABEL_279:
  qword_95448 = v115;
}

BOOL bwd_find_leftchar(uint64_t a1, char *__s2, int a3)
{
  if (a1)
  {
    uint64_t v5 = a1;
    do
    {
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6 == 0x2000000)
      {
        if (!strcmp(*(const char **)v5, __s2)) {
          return 1;
        }
      }
      else if (v6 == 0x4000000 && !strcmp(*(const char **)v5, __s2))
      {
        break;
      }
      uint64_t v5 = *(void *)(v5 + 40);
    }
    while (v5);
  }
  unsigned int v7 = (unsigned __int8 *)(qword_9DA38 + a3);
  uint64_t v8 = 1;
  if (!no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v7)) {
    return *v7 < 0x21u;
  }
  return v8;
}

void bwd_resolve_nospace()
{
  BOOL v0 = nLangIDGlb != 9 || nSubLangIDGlb == 3;
  if (!v0 && qword_9DA18 == 0x2000)
  {
    BOOL v1 = (unsigned __int8 *)qword_9DA20;
    if (qword_9DA00 - qword_9DA20 == 1)
    {
      if ((*(unsigned __int8 *)qword_9DA20 | 2) == 0x2B)
      {
LABEL_17:
        uint64_t v5 = qword_9DA38;
        int v6 = *(char *)qword_9DA38;
        if (!memchr(".,+(=", v6, 6uLL) && (!memchr("/;:", v6, 4uLL) || *(unsigned __int8 *)(v5 + 1) >= 0x21u))
        {
          bwd_add_seg(1);
          uint64_t v7 = qword_9DA00;
          if (byte_9DA50) {
            char v8 = 31;
          }
          else {
            char v8 = 32;
          }
          *(unsigned char *)qword_9DA00 = v8;
          qword_9DA00 = v7 + 1;
        }
      }
    }
    else if (qword_9DA00 - qword_9DA20 == 2)
    {
      uint64_t v2 = "*+";
      while (1)
      {
        do
          int v3 = *v1++;
        while (v3 == 173 || v3 == 30);
        if (v3 != *(unsigned __int8 *)v2) {
          break;
        }
        if (++v2 == "") {
          goto LABEL_17;
        }
      }
    }
  }
}

uint64_t bwd_add_rightchars()
{
  BOOL v0 = pBwdLangGlb;
  BOOL v1 = (unsigned __int8 *)qword_9DA38;
  while (1)
  {
    uint64_t v2 = *(unsigned __int8 **)((char *)&dword_18 + (void)v0);
    if (!no_exception(1, v2, v1 + 1))
    {
      uint64_t result = no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v0 + 8], v1 + 1);
      if (!result) {
        return result;
      }
    }
    if (v1[1] == 30 && v1[2])
    {
      qword_9D9F8 = 1;
      ++v1;
    }
    qword_9DA38 = (uint64_t)(v1 + 1);
    if (no_exception(1, v2, v1 + 1)) {
      uint64_t v4 = 0x1000000;
    }
    else {
      uint64_t v4 = 0x4000000;
    }
    bwd_add_seg(v4);
    uint64_t v5 = qword_9DA00;
    uint64_t v6 = qword_9DA00;
    *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
    uint64_t v7 = (unsigned char *)(v6 + 1);
    qword_9DA00 = (uint64_t)v7;
    BOOL v1 = (unsigned __int8 *)qword_9DA38;
    if (nLangIDGlb == 7)
    {
      char v8 = (unsigned __int8 *)qword_9DA38;
      BOOL v9 = "'<=";
      while (1)
      {
        do
          int v10 = *v8++;
        while (v10 == 173 || v10 == 30);
        if (v10 != *(unsigned __int8 *)v9) {
          break;
        }
        if (++v9 == "")
        {
          BOOL v1 = (unsigned __int8 *)++qword_9DA38;
          goto LABEL_25;
        }
      }
    }
    if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && *(unsigned char *)qword_9DA38 == 39)
    {
      uint64_t v12 = (unsigned char *)(qword_9DA38 + 1);
      if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), (unsigned __int8 *)(qword_9DA38 + 1)))
      {
        if (v1[2] >= 0x21u)
        {
          qword_9DA38 = (uint64_t)v12;
          *(unsigned char *)(v5 + 1) = *v12;
          uint64_t v7 = (unsigned char *)(v5 + 2);
          qword_9DA00 = v5 + 2;
          BOOL v1 = (unsigned __int8 *)qword_9DA38;
        }
      }
    }
LABEL_25:
    if (v1[1] == 30 && v1[2])
    {
      qword_9DA38 = (uint64_t)(v1 + 1);
      qword_9D9F8 = 1;
      ++v1;
    }
    BOOL v0 = pBwdLangGlb;
    if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), v1)
      && v1[1] >= 0x21u)
    {
      qword_9DA18 = 0x4000000;
      qword_9DA38 = (uint64_t)(v1 + 1);
      *uint64_t v7 = v1[1];
      qword_9DA00 = (uint64_t)(v7 + 1);
      BOOL v1 = (unsigned __int8 *)qword_9DA38;
      uint64_t v13 = qword_9DA38 + 1;
      unsigned int v14 = *(unsigned __int8 *)(qword_9DA38 + 1);
      BOOL v0 = pBwdLangGlb;
      if (v14 != 30) {
        goto LABEL_33;
      }
      if (*(unsigned char *)(qword_9DA38 + 2))
      {
        ++qword_9DA38;
        qword_9D9F8 = 1;
        unsigned int v14 = v1[2];
        BOOL v1 = (unsigned __int8 *)v13;
LABEL_33:
        if (v14 >= 0x21
          && !no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v1 + 1)
          && *(void *)(qword_9DA30 + 24) == 0x4000000
          && !strcmp(*(const char **)qword_9DA30, (const char *)qword_9DA20))
        {
          qword_9DA18 = 0x2000000;
        }
      }
    }
  }
}

uint64_t bwd_no_locution()
{
  int v0 = nLangIDGlb;
  BOOL v1 = nLangIDGlb != 9 || nSubLangIDGlb == 3;
  if (!v1)
  {
    if (qword_9DA18 == 0x2000)
    {
      int v23 = *(unsigned __int8 *)(qword_9DA00 - 1);
      if (v23 != 45 && v23 != *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb)) {
        return 1;
      }
    }
    uint64_t v25 = qword_9DA38;
    BOOL v26 = "o.c";
    uint64_t v27 = (unsigned __int8 *)qword_9DA38;
    do
    {
      do
        int v28 = *v27++;
      while (v28 == 173 || v28 == 30);
      if (v28 != *v26) {
        goto LABEL_6;
      }
      ++v26;
    }
    while (v26 != "");
    unsigned int v30 = *(unsigned __int8 *)(qword_9DA38 + 3);
    if (v30 < 0x21) {
      goto LABEL_57;
    }
    if (no_exception(1, "\t[/,:;+(\x01", (unsigned __int8 *)(qword_9DA38 + 3)))
    {
      if (v30 == 45 || *(unsigned __int8 *)(v25 + 4) < 0x21u) {
        goto LABEL_57;
      }
    }
    else if (v30 == 45)
    {
LABEL_57:
      bwd_add_seg(0x2000);
      uint64_t v31 = 0;
      uint64_t v32 = qword_9DA00;
      int v33 = 79;
      do
      {
        if (v33 == 39) {
          LOBYTE(v33) = 46;
        }
        *(unsigned char *)(v32 + v31) = v33;
        int v33 = aOClock[++v31];
      }
      while (v31 != 7);
      qword_9DA00 = v32 + 7;
      uint64_t v22 = 2;
LABEL_62:
      qword_9DA38 += v22;
      bwd_add_rightchars();
      return 0;
    }
    if (v30 == *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb)) {
      goto LABEL_57;
    }
  }
LABEL_6:
  if (v0 != 12) {
    return 1;
  }
  if (qword_9DA18 == 0x2000)
  {
    int v2 = *(unsigned __int8 *)(qword_9DA00 - 1);
    if (v2 != 45 && v2 != *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb)) {
      return 1;
    }
  }
  uint64_t result = 1;
  if ((lFlags & 0x4000) == 0 && (byte_9D9EC & 1) == 0 && (byte_9DA54 & 1) == 0)
  {
    int v5 = *(int *)((char *)&dword_8 + (void)pLangGlb);
    if ((v5 & 0x80000000) == 0)
    {
      int v6 = 0;
      uint64_t v7 = (unsigned __int8 **)*pLangGlb;
      uint64_t v8 = qword_9DA38;
      BOOL v9 = pBwdLangGlb;
      while ((*((unsigned char *)v7 + 33) & 0x40) == 0)
      {
LABEL_19:
        v7 += 5;
        BOOL v1 = v6++ == v5;
        if (v1) {
          return 1;
        }
      }
      int v10 = v7[1];
      BOOL v11 = (unsigned __int8 *)v8;
      do
      {
        do
          int v12 = *v11++;
        while (v12 == 173 || v12 == 30);
        if (v12 != *v10) {
          goto LABEL_19;
        }
      }
      while (*++v10);
      uint64_t v15 = v7[3];
      unsigned int v16 = v15[v8];
      if (v16 >= 0x21)
      {
        if (no_exception(1, "\t[=):;/,+?\x01", &v15[v8]) {
          && (BOOL v17 = &v15[v8], no_exception(1, "a+\x01", v17 - 1)))
        }
        {
          if (v16 == 45 || v17[1] < 0x21u) {
            goto LABEL_38;
          }
        }
        else if (v16 == 45)
        {
          goto LABEL_38;
        }
        if (v16 != *((unsigned __int8 *)&stru_20.filesize + (void)v9) || (*v7)[(void)v7[2] - 1] != 85) {
          goto LABEL_19;
        }
      }
LABEL_38:
      bwd_add_seg(0x2000);
      int v18 = *v7 + 1;
      int v19 = **v7;
      BOOL v20 = (unsigned char *)qword_9DA00;
      do
      {
        if (v19 == 39) {
          LOBYTE(v19) = 46;
        }
        *v20++ = v19;
        int v21 = *v18++;
        int v19 = v21;
      }
      while (v21);
      qword_9DA00 = (uint64_t)v20;
      uint64_t v22 = (uint64_t)(v7[3] - 1);
      goto LABEL_62;
    }
  }
  return result;
}

char **bwd_add_abbrev_char(char **result, int a2)
{
  int v2 = **result;
  if (v2 > 56)
  {
    switch(v2)
    {
      case '9':
        BOOL v3 = a2 == 0;
        char v4 = -42;
        char v5 = -10;
        break;
        BOOL v3 = a2 == 0;
        char v4 = -60;
        char v5 = -28;
        break;
      case '~':
        int v6 = (char *)qword_9DA00;
        char v5 = -33;
LABEL_27:
        *int v6 = v5;
        uint64_t v10 = (uint64_t)(v6 + 1);
LABEL_28:
        qword_9DA00 = v10;
        goto LABEL_29;
      default:
        goto LABEL_24;
    }
LABEL_22:
    if (!v3) {
      char v5 = v4;
    }
LABEL_26:
    int v6 = (char *)qword_9DA00;
    goto LABEL_27;
  }
  if (v2 != 46)
  {
    if (v2 == 52)
    {
      uint64_t v11 = 0;
      uint64_t v12 = qword_9DA00;
      int v13 = 67;
      do
      {
        if (v13 == 39) {
          LOBYTE(v13) = 46;
        }
        *(unsigned char *)(v12 + v11) = v13;
        int v13 = aCh_4[++v11];
      }
      while (v11 != 2);
      uint64_t v10 = v12 + 2;
      goto LABEL_28;
    }
    if (v2 == 56)
    {
      BOOL v3 = a2 == 0;
      char v4 = -36;
      char v5 = -4;
      goto LABEL_22;
    }
LABEL_24:
    char v5 = v2 & 0xDF;
    if (!a2) {
      char v5 = **result;
    }
    goto LABEL_26;
  }
  uint64_t v7 = qword_9DA00;
  uint64_t v8 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = 46;
  qword_9DA00 = v8 + 1;
  if (((*result)[1] | 0x80) != 0xA0)
  {
    if (byte_9DA50) {
      char v9 = 31;
    }
    else {
      char v9 = 32;
    }
    *(unsigned char *)(v7 + 1) = v9;
    uint64_t v10 = v7 + 2;
    goto LABEL_28;
  }
LABEL_29:
  ++*result;
  return result;
}

unint64_t bwd_generic_abbrev(unsigned char *a1)
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
    return 0;
  }
  int v2 = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    if ((v2 - 123) <= 0xFFFFFFE4 && (v2 & 0xFE) != 0x38) {
      break;
    }
    char v4 = &a1[v3];
    if (a1[v3 + 1] != 46) {
      break;
    }
    v3 += 2;
    int v2 = v4[2];
  }
  while (v2);
  if (v3 <= 3) {
    return 0;
  }
  else {
    return v3 - 1;
  }
}

uint64_t bwd_no_abbrev(uint64_t a1)
{
  BOOL v2 = (nSubLangIDGlb != 3 || nLangIDGlb != 9) && dword_9D9F0 == 0;
  if (!v2 || (qword_9DA18 & 0x1024C0) != 0) {
    return 1;
  }
  uint64_t v4 = qword_9DA38;
  int v5 = *(char *)qword_9DA38;
  switch(v5)
  {
    case '8':
      uint64_t v6 = 31;
      break;
      uint64_t v6 = 27;
      break;
    case '9':
      uint64_t v6 = 30;
      break;
    default:
      uint64_t v6 = hash_map[*(unsigned __int8 *)qword_9DA38];
      break;
  }
  uint64_t v7 = *(char **)(a1 + 8 * v6);
  if (!*v7)
  {
LABEL_44:
    unint64_t v19 = bwd_generic_abbrev((unsigned char *)qword_9DA38);
    if (!v19) {
      return 1;
    }
    unint64_t v20 = v19;
    unsigned int v21 = *(unsigned __int8 *)(v19 + v4 + 1);
    if (v21 > 0x40) {
      return 1;
    }
    int v22 = v21 == 32
       && *(unsigned __int8 *)(v19 + v4 + 2) == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)pLangGlb);
    bwd_add_seg(32);
    do
    {
      bwd_add_abbrev_char((char **)&qword_9DA38, v22);
      --v20;
    }
    while (v20);
    uint64_t v30 = qword_9DA00;
    *(unsigned char *)qword_9DA00 = 46;
    qword_9DA00 = v30 + 1;
    goto LABEL_64;
  }
  int v8 = *(unsigned __int8 *)(qword_9DA38 + 1);
  while (1)
  {
    char v35 = v7;
    int v9 = *v7;
    uint64_t v10 = v9 == 36 ? v7 + 1 : v7;
    int v11 = *v10;
    uint64_t v12 = (unsigned __int8 *)(qword_9DA38 + 1);
    if (v11 == v8 || ((v8 ^ v11) & 0xFFFFFFDF) == 0)
    {
      do
      {
        if (v11 == 46)
        {
          if ((v12[1] | 0x80) == 0xA0) {
            v12 += 2;
          }
          else {
            ++v12;
          }
        }
        else
        {
          ++v12;
        }
        int v14 = *++v10;
        int v11 = v14;
        int v15 = *v12;
        unsigned int v16 = (v15 ^ v14) & 0xFFFFFFDF;
      }
      while (v14 == v15 || v16 == 0);
      if (v11)
      {
LABEL_40:
        while (*++v10)
          ;
        goto LABEL_43;
      }
    }
    else
    {
      int v15 = v8;
      if (*v10) {
        goto LABEL_40;
      }
    }
    if (v15 == 46) {
      break;
    }
LABEL_43:
    uint64_t v7 = v10 + 1;
    if (!v10[1]) {
      goto LABEL_44;
    }
  }
  bwd_add_seg(32);
  int v23 = (unsigned __int8 *)qword_9DA38;
  BOOL v24 = "qf.";
  do
  {
    do
      int v25 = *v23++;
    while (v25 == 173 || v25 == 30);
    if (v25 != *v24)
    {
      bwd_add_abbrev_char((char **)&qword_9DA38, v9 == 36);
      goto LABEL_66;
    }
    ++v24;
  }
  while (v24 != "");
  uint64_t v27 = 0;
  uint64_t v28 = qword_9DA00;
  int v29 = 80;
  do
  {
    if (v29 == 39) {
      LOBYTE(v29) = 46;
    }
    *(unsigned char *)(v28 + v27) = v29;
    int v29 = aPro_0[++v27];
  }
  while (v27 != 3);
  qword_9DA00 = v28 + 3;
LABEL_66:
  if (v9 == 36) {
    char v35 = ++v7;
  }
  if (*v7)
  {
    do
      bwd_add_abbrev_char(&v35, 0);
    while (*v35);
  }
  uint64_t v31 = qword_9DA00;
  uint64_t v32 = qword_9DA00;
  *(unsigned char *)qword_9DA00 = 46;
  qword_9DA00 = v32 + 1;
  qword_9DA38 = (uint64_t)v12;
  unsigned int v33 = v12[1];
  if (v33 < 0x41 || v33 == 160)
  {
LABEL_64:
    bwd_add_rightchars();
    return 0;
  }
  uint64_t result = 0;
  if (byte_9DA50) {
    char v34 = 31;
  }
  else {
    char v34 = 32;
  }
  *(unsigned char *)(v31 + 1) = v34;
  qword_9DA00 = v31 + 2;
  return result;
}

uint64_t wh_backward_translate(unsigned char *a1, uint64_t a2, size_t size, _DWORD *a4)
{
  unsigned int v4 = size;
  if (a4) {
    *a4 = 0;
  }
  uint64_t result = 87;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  if ((unsigned char *)a2 == a1) {
    return result;
  }
  uint64_t v7 = (size - 1);
  if ((int)size < 1) {
    return result;
  }
  *(unsigned char *)a2 = 0;
  if (!*a1) {
    return 0;
  }
  bMemoryOverflow = 0;
  pExcMapGlb = &brl_set_classbwd;
  qword_9DA10 = a2;
  int v8 = (unsigned char *)(a2 + v7);
  qword_9DA08 = (uint64_t)v8;
  *int v8 = 0;
  int v9 = &unk_9D000;
  qword_9DA38 = (uint64_t)a1;
  uint64_t v10 = (unsigned char *)(a2 + 1);
  qword_9DA00 = a2 + 1;
  int v11 = 32;
  unsigned __int8 v849 = 32;
  LOBYTE(v12) = *a1;
  BOOL __src = (unsigned char *)(a2 + 1);
  if (*a1)
  {
    uint64_t v13 = 0;
    int v14 = (unsigned char *)(a2 + 1);
    int v15 = a1;
    unsigned int v16 = a1;
    while (v10 == v8)
    {
      uint64_t v10 = v8;
LABEL_71:
      v9[327] = v16 + 1;
      LODWORD(v12) = *++v16;
      if (!v12) {
        goto LABEL_74;
      }
    }
    *uint64_t v10 = v12;
    if (v12 == 35)
    {
      if (*(v10 - 1) == 30)
      {
        *(_WORD *)(v10 - 1) = 7715;
        goto LABEL_19;
      }
    }
    else
    {
      if (v12 == 30)
      {
        LOBYTE(v12) = *(v10 - 1);
        if ((_BYTE)v12)
        {
          if (memchr("\"!'><$\x7F", *(v10 - 1), 8uLL))
          {
            *uint64_t v10 = v12;
            *(v10 - 1) = 30;
          }
          else
          {
            LOBYTE(v12) = 30;
          }
          int v9 = (void *)&unk_9D000;
LABEL_59:
          if ((char)v12 == v11) {
            int v29 = v11;
          }
          else {
            int v29 = 0;
          }
          if ((char)v12 == v11) {
            uint64_t v30 = v13 + 1;
          }
          else {
            uint64_t v30 = v13;
          }
          if (v11 >= 0x21u) {
            int v28 = v29;
          }
          else {
            int v28 = v11;
          }
          if (v11 >= 0x21u) {
            uint64_t v13 = v30;
          }
          goto LABEL_70;
        }
LABEL_19:
        LOBYTE(v12) = 30;
        goto LABEL_59;
      }
      if (v12 < 0x21u
        || v12 - 150 <= 0x17 && ((1 << (v12 + 106)) & 0x800403) != 0)
      {
        goto LABEL_59;
      }
    }
    BOOL v17 = (unsigned __int8 *)v9[327];
    int v18 = *v17;
    if (v18 == 226)
    {
      unsigned __int8 v20 = v17[1];
      if ((v20 & 0xFC) == 0xA0)
      {
        unsigned __int8 v23 = v17[2];
        unsigned int v21 = v17 + 2;
        unsigned __int8 v22 = v23;
        if ((v23 & 0xC0) == 0x80)
        {
          unint64_t v24 = v22 & 0x3F;
          if (b8DotBraille) {
            unint64_t v25 = v24 & 0xFFFFFFFFFFFFFF3FLL | ((unint64_t)(v20 & 3) << 6);
          }
          else {
            unint64_t v25 = v24;
          }
          uint64_t v12 = brl_set_ansi[v25];
          v9[327] = v21;
          goto LABEL_50;
        }
      }
    }
    else if (v18 == 239 && v17[1] == 187)
    {
      int v19 = v17[2];
      unsigned int v16 = v17 + 2;
      if (v19 == 191) {
        goto LABEL_71;
      }
    }
    if (pCharmapGlb)
    {
      uint64_t v26 = 0;
      while (*(unsigned __int8 *)(pCharmapGlb + v26) != v12)
      {
        if (++v26 == 256)
        {
          LODWORD(v26) = 0;
          break;
        }
      }
      uint64_t v12 = (int)v26;
    }
    else
    {
      uint64_t v12 = (char)v12;
    }
    if (!b8DotBraille)
    {
      uint64_t v27 = 0;
      while (brl_set_ansi[v27] != v12)
      {
        if (++v27 == 256) {
          goto LABEL_50;
        }
      }
      if ((v27 & 0xC0) != 0) {
        uint64_t v12 = brl_set_ansi[v27 & 0x3F];
      }
    }
LABEL_50:
    if (v12 < 33)
    {
      LOBYTE(v12) = 32;
      *uint64_t v10 = 32;
      if (v11 != 32) {
        goto LABEL_59;
      }
      int v28 = 32;
    }
    else
    {
      *uint64_t v10 = v12;
      if (v11 != 32) {
        goto LABEL_59;
      }
      int v28 = 0;
      if ((_BYTE)v12)
      {
        if ((v12 - 58) <= 0xF5u)
        {
          int v28 = 0;
          if (v12 != 42)
          {
            int v11 = v12;
            if (v12 != 108) {
              goto LABEL_59;
            }
          }
        }
      }
    }
LABEL_70:
    int v14 = v10 + 1;
    qword_9DA00 = (uint64_t)(v10 + 1);
    unsigned int v16 = (unsigned __int8 *)v9[327];
    int v11 = v28;
    ++v10;
    goto LABEL_71;
  }
  int v15 = a1;
  uint64_t v13 = 0;
  int v14 = (unsigned char *)(a2 + 1);
LABEL_74:
  unsigned __int8 v849 = v11;
  *int v14 = 0;
  if (v14 == v8) {
    return 111;
  }
  uint64_t v847 = v13;
  if (v4 < 2 * (v9[327] - (void)v15)) {
    return 111;
  }
  BOOL v31 = v13 > 3 && v849 > 0x20u;
  if (v31 || b8DotBraille)
  {
    if (a4)
    {
      uint64_t v518 = (uint64_t)&v14[~a2];
      if (v518 >= 1)
      {
        for (uint64_t i = 0; i != v518; ++i)
          a4[i] = i;
      }
      a4[v518] = v518 - 1;
    }
    memmove((void *)a2, __src, (size_t)&v14[-a2]);
    return 0;
  }
  uint64_t v32 = malloc_type_malloc(v4, 0x9B20992uLL);
  qword_9DA88 = (uint64_t)v32;
  unsigned int v33 = (void *)a2;
  if (!v32) {
    return 8;
  }
  uint64_t v839 = (uint64_t)v15;
  *uint64_t v32 = 0;
  v32[v7] = 0;
  qword_9DA20 = (uint64_t)(v32 + 1);
  char v34 = &unk_9D000;
  qword_9DA00 = (uint64_t)(v32 + 1);
  byte_9DBA8 = 0;
  byte_9DBAC = 0;
  dword_9D9F0 = 0;
  byte_9DAA4 = 0;
  byte_9DA90 = 0;
  dword_9DAA0 = 0;
  byte_9DA54 = 0;
  byte_9D9EC = 0;
  char v35 = &unk_9D000;
  qword_9DA30 = 0;
  qword_9DA48 = 0;
  qword_95448 = 0x4000;
  qword_9DA28 = 0;
  int v36 = &unk_9D000;
  qword_9D9F8 = 0;
  byte_9DA50 = a4 != 0;
  qword_9DA18 = ((unint64_t)lFlags >> 15) & 0x800;
  int k = (unsigned char **)&unk_9D000;
  qword_9DA38 = (uint64_t)__src;
  int v38 = *__src;
  if (!*__src) {
    goto LABEL_1310;
  }
  unsigned int v39 = __src;
  while (2)
  {
    if ((lFlags & 0x4000000) != 0) {
      goto LABEL_90;
    }
    switch(v38)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 31:
        uint64_t v40 = 1;
        goto LABEL_88;
      case 9:
      case 32:
      case 160:
        uint64_t v42 = 2;
        goto LABEL_96;
      case 30:
        BOOL v44 = (unint64_t)qword_9DA18 >= 3 && (qword_9DA18 & 0x7000004) == 0;
        if (!v44)
        {
          bwd_add_seg(1);
          int v45 = (char *)v34[320];
          char v46 = 30;
          goto LABEL_102;
        }
        unsigned int v72 = v39[1];
        if (v72 < 0x21
          || v72 == 160
          || no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v39 + 1)
          && ((unsigned int v73 = v39[2], v73 < 0x21) || v73 == 160))
        {
          bwd_add_seg(1);
          uint64_t v86 = (unsigned char *)v34[320];
          *uint64_t v86 = 30;
          v34[320] = v86 + 1;
          bwd_add_rightchars();
        }
        else
        {
          v36[319] = v34[320] - qword_9DA20 + 1;
        }
        goto LABEL_485;
      case 35:
        if (!bwd_is_number(v39))
        {
          bwd_add_seg(0x2000);
          int k = (unsigned char **)&unk_9D000;
          uint64_t v83 = (unsigned char *)v34[320];
          unsigned char *v83 = *(unsigned char *)qword_9DA38;
          uint64_t v84 = v83 + 1;
          v34[320] = v84;
          if (nLangIDGlb == 12
            && &v84[-qword_9DA20] == (unsigned char *)&dword_0 + 1
            && no_exception(1, "\t[=)/?\x01", (unsigned __int8 *)(qword_9DA38 + 1)))
          {
            bwd_add_seg(4);
            LOBYTE(v38) = *(unsigned char *)++qword_9DA38;
            goto LABEL_90;
          }
          goto LABEL_92;
        }
        bwd_resolve_nospace();
        char v57 = qword_9DA18;
        if ((qword_9DA18 & 0x102400) == 0) {
          goto LABEL_540;
        }
        int v58 = (unsigned __int8 *)qword_9DA38;
        int v59 = (unsigned __int8 *)(qword_9DA38 + 1);
        if (*(unsigned char *)(qword_9DA38 + 1) == 44
          && *(unsigned __int8 *)(qword_9DA38 + 2) - 107 >= 0xFFFFFFF6)
        {
          int v60 = *(unsigned __int8 *)(qword_9DA38 - 1);
          if (!*(unsigned char *)(qword_9DA38 - 1)
            || !memchr("bcdfghjklmnpqrstvwxz", *(unsigned __int8 *)(qword_9DA38 - 1), 0x15uLL)
            && (v60 != 30 || !*(v58 - 2) || !memchr("bcdfghjklmnpqrstvwxz", *(v58 - 2), 0x15uLL)))
          {
            goto LABEL_540;
          }
        }
        if (nLangIDGlb != 7) {
          goto LABEL_537;
        }
        if ((byte_9DAA4 & 1) != 0 || dword_9D9F0) {
          goto LABEL_540;
        }
        int v61 = *(v58 - 1);
        if (v61 == 115)
        {
          unsigned int v33 = (void *)a2;
          char v34 = (void *)&unk_9D000;
          int v36 = (void *)&unk_9D000;
          if (*(v58 - 2) == **(unsigned __int8 **)((char *)&stru_20.nsects + (void)pLangGlb)) {
            goto LABEL_540;
          }
        }
        else if (v61 == 46)
        {
          unsigned int v33 = (void *)a2;
          char v34 = &unk_9D000;
          int v36 = &unk_9D000;
          if (*(v58 - 2) != stru_B8.segname[(void)pLangGlb + 3]) {
            goto LABEL_540;
          }
        }
        else
        {
          unsigned int v33 = (void *)a2;
          char v34 = (void *)&unk_9D000;
          int v36 = (void *)&unk_9D000;
          if (v61 == 30
            && (*(v58 - 2) == 46 && *(v58 - 3) != stru_B8.segname[(void)pLangGlb + 3]
             || *(v58 - 2) == 115 && *(v58 - 3) == **(unsigned __int8 **)((char *)&stru_20.nsects + (void)pLangGlb)))
          {
            goto LABEL_540;
          }
        }
LABEL_537:
        if (!no_exception(0, "\t-\x01", v58 - 1)
          && !no_exception(1, "\t-\x01[abcdefghij]-\x01", v59)
          && !backward_disabled(v58))
        {
          bwd_add_seg(0x2000);
          int k = (unsigned char **)&unk_9D000;
          goto LABEL_237;
        }
LABEL_540:
        if ((v57 & 0xC0) != 0) {
          goto LABEL_541;
        }
        if (nLangIDGlb == 7)
        {
          int v232 = *(unsigned __int8 *)(qword_9DA38 - 1);
          if (v232 == 46)
          {
            int v233 = *(unsigned __int8 *)(qword_9DA38 - 2);
          }
          else
          {
            if (v232 != 30 || *(unsigned char *)(qword_9DA38 - 2) != 46) {
              goto LABEL_561;
            }
            int v233 = *(unsigned __int8 *)(qword_9DA38 - 3);
          }
          if (v233 != stru_B8.segname[(void)pLangGlb + 3])
          {
LABEL_541:
            if ((lFlags & 0x40000000) == 0
              && nLangIDGlb == 7
              && (uint64_t v229 = qword_9DA38, *(unsigned __int8 *)(qword_9DA38 - 1) - 107 >= 0xFFFFFFF6)
              && *(unsigned __int8 *)(qword_9DA38 - 2) - 107 >= 0xFFFFFFF6
              && *(unsigned char *)(qword_9DA38 - 3)
              && memchr(",;:/?+=(*)", *(unsigned __int8 *)(qword_9DA38 - 3), 0xBuLL)
              && *(unsigned char *)(v229 - 4)
              && memchr(",;:/?+=(*)", *(unsigned __int8 *)(v229 - 4), 0xBuLL))
            {
              bwd_add_seg(32);
              int v230 = (char *)v34[320];
              char v231 = 46;
            }
            else
            {
              bwd_add_seg(2);
              int v230 = (char *)v34[320];
              if (byte_9DA50) {
                char v231 = 31;
              }
              else {
                char v231 = 32;
              }
            }
            *int v230 = v231;
            v34[320] = v230 + 1;
          }
        }
LABEL_561:
        bwd_add_seg(64);
        v234 = (unsigned char *)v34[320];
        unsigned char *v234 = *(unsigned char *)qword_9DA38;
        int v235 = v234 + 1;
        v34[320] = v234 + 1;
        v236 = (unsigned __int8 *)qword_9DA38;
        uint64_t v238 = qword_9DA38 + 1;
        unsigned int v237 = *(unsigned __int8 *)(qword_9DA38 + 1);
        if (v237 == 30)
        {
          ++qword_9DA38;
          v36[319] = &v235[-qword_9DA20];
          unsigned int v237 = v236[2];
          v236 = (unsigned __int8 *)v238;
        }
        if (v237 <= 0x2E && ((1 << v237) & 0x608000000000) != 0)
        {
          qword_9DA38 = (uint64_t)(v236 + 1);
          v234[1] = v236[1];
          int v235 = v234 + 2;
          v34[320] = v234 + 2;
          v236 = (unsigned __int8 *)qword_9DA38;
        }
        uint64_t v239 = qword_9DA20;
        while (1)
        {
          v240 = v236 + 1;
          int v241 = v236[1];
          if (v236[1])
          {
            if (v241 == 30 || (v241 - 97) < 0xA) {
              goto LABEL_620;
            }
          }
          unsigned int v243 = pLangGlb;
          if (v241 == stru_B8.segname[(void)pLangGlb + 1]
            || v241 == stru_B8.segname[(void)pLangGlb + 2])
          {
            int v244 = v236[2];
            if (v236[2])
            {
              if (v244 == 30 || (v244 - 97) < 0xA) {
                goto LABEL_620;
              }
            }
          }
          int v246 = nLangIDGlb;
          if (nLangIDGlb == 7)
          {
            if (v241 != 41) {
              goto LABEL_616;
            }
            int v247 = *v236;
            if (v247 != 106 && (v247 != 41 || *(v236 - 1) != 106)) {
              goto LABEL_616;
            }
            goto LABEL_620;
          }
          BOOL v248 = nLangIDGlb == 9;
          int v249 = nSubLangIDGlb;
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2) {
            break;
          }
LABEL_605:
          BOOL v253 = v248 && v249 == 3;
          if ((!v253 || v241 != 33 && v241 != 124) && (!v248 || v241 != 124 && v241 != 52 || in(v236[2], 11)))
          {
LABEL_616:
            if (!v241 || v246 == 12 || (lFlags & 0x40000000) != 0 || !memchr(",;:/?+=(*)", v241, 0xBuLL))
            {
              int v256 = *(unsigned __int8 *)(qword_9DA20 + 1);
              if ((v256 - 107) < 0xFFFFFFF6) {
                goto LABEL_640;
              }
              int v257 = pBwdLangGlb;
              if (no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v236)
                && no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v257 + 8], v236 - 1))
              {
                v34[320] = v235 - 2;
                qword_9DA38 = (uint64_t)(v236 - 1);
                bwd_add_seg(0x4000000);
                v258 = (unsigned char *)v34[320];
                unsigned char *v258 = *(unsigned char *)qword_9DA38;
                v34[320] = v258 + 1;
                ++qword_9DA38;
                bwd_add_seg(0x1000000);
                v259 = (char *)qword_9DA38;
                goto LABEL_651;
              }
              if (*(v236 - 1) - 107 >= 0xFFFFFFF6
                && ((int v260 = *v236, v260 == 61) || v260 == 44 || v260 == 41 && v256 != 106))
              {
                v34[320] = v235 - 1;
                bwd_add_seg(0x4000000);
                v259 = (char *)qword_9DA38;
LABEL_651:
                char v264 = *v259;
                unsigned int v265 = (unsigned char *)v34[320];
                *unsigned int v265 = v264;
                v262 = v265 + 1;
                unsigned int v33 = (void *)a2;
LABEL_652:
                v34[320] = v262;
              }
              else
              {
LABEL_640:
                BOOL v44 = v246 == 7;
                unsigned int v33 = (void *)a2;
                if (v44 && v241 == stru_B8.segname[(void)v243 + 3] && v236[2] == 42)
                {
                  unsigned int v261 = v236[3];
                  if (v261 < 0x21 || v261 == 42 && v236[4] <= 0x20u)
                  {
                    qword_9DA38 = (uint64_t)(v236 + 1);
                    bwd_add_seg(32);
                    v262 = (unsigned char *)v34[320];
                    uint64_t v263 = qword_9DA38;
                    do
                    {
                      qword_9DA38 = v263 + 1;
                      *v262++ = 39;
                      uint64_t v263 = qword_9DA38;
                    }
                    while (*(unsigned char *)(qword_9DA38 + 1) == 42);
                    goto LABEL_652;
                  }
                }
              }
              if (nLangIDGlb == 7
                && (uint64_t v266 = qword_9DA38, v267 = *(unsigned __int8 *)(qword_9DA38 + 1), *(unsigned char *)(qword_9DA38 + 1))
                && ((BOOL v268 = memchr("\"!'><$\x7F", *(unsigned __int8 *)(qword_9DA38 + 1), 8uLL), v267 != 33)
                  ? (BOOL v269 = v268 == 0)
                  : (BOOL v269 = 1),
                    !v269
                 && (v267 != stru_B8.segname[(void)pLangGlb + 3] || *(unsigned char *)(v266 + 2) != 41)
                 && (v267 != **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb)
                  || (unint64_t)qword_9DA28 <= 2
                  && (v270 = (unsigned char *)(v266 + 2),
                      no_exception(1, "arm\x01er\x01f[<8\x01fach\x01st\x01te\x01", (unsigned __int8 *)(v266 + 2)))&& (unsigned int v271 = *v270, *v270)&& (v271 > 0xDE || v271 - 123 >= 0xFFFFFFE6))))
              {
                bwd_add_seg(2);
                v272 = (char *)v34[320];
                if (byte_9DA50) {
                  char v273 = 31;
                }
                else {
                  char v273 = 32;
                }
                char *v272 = v273;
                v34[320] = v272 + 1;
              }
              else
              {
                bwd_add_rightchars();
              }
              goto LABEL_668;
            }
          }
LABEL_620:
          qword_9DA38 = (uint64_t)(v236 + 1);
          int v254 = *v240;
          if (v254 == 30)
          {
            qword_9D9F8 = (uint64_t)&v235[-v239];
            int v255 = 30;
          }
          else
          {
            *v235++ = v254;
            v34[320] = v235;
            v240 = (unsigned __int8 *)qword_9DA38;
            int v255 = *(unsigned __int8 *)qword_9DA38;
          }
          if (v255 == stru_B8.segname[(void)pLangGlb + 3]
            && v240[1]
            && v240[2] - 107 >= 0xFFFFFFF6)
          {
            qword_9DA38 = (uint64_t)(v240 + 1);
            *v235++ = v240[1];
            v34[320] = v235;
            v236 = (unsigned __int8 *)qword_9DA38;
            int v255 = *(unsigned __int8 *)qword_9DA38;
            if (*(unsigned char *)qword_9DA38) {
              goto LABEL_627;
            }
          }
          else
          {
            v236 = v240;
            if (v255)
            {
LABEL_627:
              if (memchr(",;:/?+=(*)", v255, 0xBuLL)) {
                qword_9DA18 = 128;
              }
            }
          }
        }
        if ((lFlags & 0x40000000) == 0)
        {
          if (!v236[1])
          {
LABEL_599:
            if (v241 == stru_B8.segname[(void)v243 + 3]
              && v236[2] == 124
              && v236[3] - 107 >= 0xFFFFFFF6)
            {
              uint64_t v252 = v236[4];
              if ((v252 - 107) > 0xF5u || !in(v252, 9)) {
                goto LABEL_620;
              }
            }
            BOOL v248 = 1;
            goto LABEL_605;
          }
          if (memchr("#0-1|4$k'\x7F", v236[1], 0xBuLL)) {
            goto LABEL_620;
          }
        }
        if ((v241 == 58 || v241 == 45) && v236[2] - 107 >= 0xFFFFFFF6)
        {
          uint64_t v251 = v236[3];
          if ((v251 - 107) > 0xF5u || !in(v251, 9)) {
            goto LABEL_620;
          }
        }
        goto LABEL_599;
      case 41:
        if (nLangIDGlb == 7 && (unint64_t)qword_9DA18 <= 8)
        {
          unsigned int v75 = v39[1];
          if (v75 > 0x28)
          {
            if (v75 != 41) {
              goto LABEL_462;
            }
            unsigned int v75 = v39[2];
            if (v75 == 30)
            {
              unsigned int v75 = v39[3];
              if (v75 != 62)
              {
LABEL_174:
                if (v75 != 35) {
                  goto LABEL_479;
                }
              }
            }
            else if (v75 != 35)
            {
              goto LABEL_462;
            }
          }
          else
          {
            if (v75 != 30) {
              goto LABEL_174;
            }
            int v99 = v39[2];
            if (v99 != 35)
            {
              if (v99 != 41)
              {
                unsigned int v33 = (void *)a2;
                char v34 = (void *)&unk_9D000;
                int v36 = (void *)&unk_9D000;
                char v35 = (void *)&unk_9D000;
                if (v99 != 62) {
                  goto LABEL_479;
                }
                goto LABEL_463;
              }
              unsigned int v75 = v39[3];
              unsigned int v33 = (void *)a2;
              char v34 = &unk_9D000;
              int v36 = (void *)&unk_9D000;
              char v35 = (void *)&unk_9D000;
              if (v75 != 35)
              {
LABEL_462:
                if (v75 != 62) {
                  goto LABEL_479;
                }
              }
            }
          }
LABEL_463:
          bwd_add_seg(32);
          uint64_t v196 = 0;
          uint64_t v197 = v34[320];
          int v198 = 65;
          do
          {
            if (v198 == 39) {
              LOBYTE(v198) = 46;
            }
            *(unsigned char *)(v197 + v196) = v198;
            int v198 = aArt[++v196];
          }
          while (v196 != 4);
          unsigned int v193 = (char *)(v197 + 4);
          v34[320] = v197 + 4;
          uint64_t v194 = (unsigned __int8 *)qword_9DA38;
          int v199 = *(unsigned __int8 *)(qword_9DA38 + 1);
          if (v199 == 30)
          {
            ++qword_9DA38;
            *v193++ = 30;
            v34[320] = v193;
            uint64_t v194 = (unsigned __int8 *)qword_9DA38;
            int v199 = *(unsigned __int8 *)(qword_9DA38 + 1);
          }
          if (v199 == 41)
          {
            qword_9DA38 = (uint64_t)(v194 + 1);
            int v199 = v194[2];
            ++v194;
          }
          if (v199 == 30)
          {
            qword_9DA38 = (uint64_t)(v194 + 1);
            *v193++ = 30;
            v34[320] = v193;
            uint64_t v194 = (unsigned __int8 *)qword_9DA38;
          }
          goto LABEL_473;
        }
        if (nLangIDGlb == 12 && qword_9DA18 == 0x2000)
        {
          int v63 = (unsigned char *)v34[320];
          if (memchr("cklmntvx28", (char)*(v63 - 1), 0xBuLL) && !in(v39[1], 11))
          {
            *int v63 = 41;
            v34[320] = v63 + 1;
            goto LABEL_485;
          }
        }
        else if ((unint64_t)qword_9DA18 < 9)
        {
          goto LABEL_479;
        }
        int v89 = *(v39 - 1);
        if (v89 != 33 && v89 != 44)
        {
          unsigned int v90 = v39[1];
          uint64_t v91 = 0x4000000;
          if (v90 < 0x21 || v90 == 160) {
            goto LABEL_480;
          }
        }
        goto LABEL_479;
      case 45:
        bwd_resolve_nospace();
        uint64_t v64 = (unsigned char *)v34[320];
        uint64_t v65 = (unsigned __int8 *)qword_9DA20;
        uint64_t v66 = &v64[-qword_9DA20];
        if (&v64[-qword_9DA20] != (unsigned char *)&dword_0 + 1)
        {
          int v67 = nLangIDGlb;
          uint64_t v68 = qword_9DA18;
          if (nLangIDGlb == 12 && qword_9DA18 == 0x2000)
          {
            if (v66 != (unsigned char *)&dword_0 + 3)
            {
LABEL_204:
              int k = (unsigned char **)&unk_9D000;
              if (no_exception(1, byte_4BA79, (unsigned __int8 *)(qword_9DA38 + 1)))
              {
                bwd_add_seg(4);
                size_t v87 = (unsigned char *)v34[320];
                *size_t v87 = *(unsigned char *)qword_9DA38;
                v34[320] = v87 + 1;
                ++qword_9DA38;
LABEL_87:
                uint64_t v40 = 32;
LABEL_88:
                bwd_add_seg(v40);
LABEL_89:
                LOBYTE(v38) = *k[327];
LABEL_90:
                unsigned int v41 = (unsigned char *)v34[320];
LABEL_91:
                *unsigned int v41 = v38;
                v34[320] = v41 + 1;
                goto LABEL_92;
              }
              int v67 = 12;
              uint64_t v68 = 0x2000;
              goto LABEL_253;
            }
            BOOL v69 = "\t*t(\x01";
LABEL_200:
            if (no_exception(1, (unsigned __int8 *)v69, v65))
            {
              int v85 = (unsigned char *)qword_9DA38;
              if (no_exception(1, byte_4BA65, (unsigned __int8 *)(qword_9DA38 + 1)))
              {
                *uint64_t v64 = *v85;
                v34[320] = v64 + 1;
                goto LABEL_485;
              }
            }
            goto LABEL_204;
          }
          goto LABEL_251;
        }
        uint64_t v76 = qword_9DA28;
        BOOL v77 = *(unsigned char *)qword_9DA20 != 45 || qword_9DA28 == 4;
        if (v77
          || (v78 = (unsigned char *)qword_9DA38,
              v79 = (unsigned char *)(qword_9DA38 + 1),
              !no_exception(1, "-\x01ci\x01l[\xC0\x7B\x01", (unsigned __int8 *)(qword_9DA38 + 1))))
        {
          int v67 = nLangIDGlb;
          uint64_t v68 = qword_9DA18;
          if (nLangIDGlb == 12)
          {
            int v36 = (void *)&unk_9D000;
            if (qword_9DA18 == 0x2000)
            {
              BOOL v69 = "\t[.*\x01";
              goto LABEL_200;
            }
          }
          else
          {
            int v36 = (void *)&unk_9D000;
          }
LABEL_251:
          if (v67 != 12 && v67 != 7)
          {
            char v106 = 1;
            goto LABEL_431;
          }
LABEL_253:
          uint64_t v100 = qword_9DA38;
          unsigned int v101 = *(unsigned __int8 *)(qword_9DA38 - 1);
          if (v101 < 0x21 || (v101 != 36 ? (BOOL v102 = v68 == 0x2000000) : (BOOL v102 = 1), v102))
          {
            unsigned int v103 = *(unsigned __int8 *)(qword_9DA38 + 1);
            if (v103 < 0x21 || v103 == 160)
            {
              int k = (unsigned char **)&unk_9D000;
              bwd_add_seg(0x2000);
              goto LABEL_270;
            }
          }
          if (v67 == 7)
          {
            uint64_t v104 = *(unsigned __int8 **)((char *)&stru_20.cmd + (void)pBwdLangGlb);
            if (!no_exception(1, v104, (unsigned __int8 *)(qword_9DA38 - 1))
              || *(unsigned __int8 *)(v100 - 2) >= 0x21u
              && !no_exception(1, v104, (unsigned __int8 *)(v100 - 2))
              || (int v105 = *(unsigned __int8 *)(v100 + 1), !in(*(unsigned __int8 *)(v100 + 1), 41))
              && (!v105 || (v105 - 123) <= 0xE4u && (v105 & 0xFE) != 0x38))
            {
              if (v101 <= 0x20 && *(unsigned char *)(v100 + 1) == 46)
              {
LABEL_429:
                bwd_add_seg(0);
                int k = (unsigned char **)&unk_9D000;
                ++qword_9DA38;
                byte_9DA54 = 1;
                goto LABEL_682;
              }
              char v106 = 0;
              unsigned int v33 = (void *)a2;
              char v34 = &unk_9D000;
              int v36 = (void *)&unk_9D000;
              char v35 = (void *)&unk_9D000;
              goto LABEL_431;
            }
            qword_9DA18 = 0x2000000;
            bwd_add_seg(0x2000);
            int k = (unsigned char **)&unk_9D000;
LABEL_270:
            char v107 = (unsigned char *)v34[320];
            unsigned char *v107 = *k[327];
            v34[320] = v107 + 1;
            goto LABEL_403;
          }
          char v106 = 1;
          int v36 = (void *)&unk_9D000;
LABEL_431:
          if ((v68 & 0x1024E0) != 0
            && (int v187 = *(unsigned __int8 *)(qword_9DA38 - 1),
                int v188 = **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb),
                v187 != v188)
            && (v187 != 30 || *(unsigned __int8 *)(qword_9DA38 - 2) != v188)
            || (v68 & 0x1024E1) == 0 && ((unsigned int v189 = *(unsigned __int8 *)(qword_9DA38 + 1), v189 < 0x21) || v189 == 160))
          {
            int k = (unsigned char **)&unk_9D000;
            uint64_t v42 = 4;
LABEL_96:
            bwd_add_seg(v42);
            unsigned __int8 v43 = (unsigned char *)v34[320];
            *unsigned __int8 v43 = *k[327];
            v34[320] = v43 + 1;
            byte_9D9EC = 0;
            byte_9DAA4 = 0;
            byte_9DBAC = 0;
            goto LABEL_92;
          }
          if (v66 != (unsigned char *)&dword_0 + 1) {
            char v106 = 1;
          }
          if ((v106 & 1) != 0
            || *v65 != **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb)
            || qword_9DA28 != 64
            || !bwd_is_number((unsigned char *)(qword_9DA38 + 1)))
          {
LABEL_479:
            uint64_t v91 = 0x2000;
LABEL_480:
            bwd_add_seg(v91);
            int k = (unsigned char **)&unk_9D000;
            goto LABEL_89;
          }
          qword_9DA18 = 0;
          bwd_add_seg(32);
          char v190 = (char *)v34[320];
          if (byte_9DA50) {
            char v191 = 31;
          }
          else {
            char v191 = 32;
          }
          char *v190 = v191;
          int k = (unsigned char **)&unk_9D000;
          v190[1] = *(unsigned char *)qword_9DA38;
          v190[2] = v191;
          uint64_t v47 = v190 + 3;
LABEL_103:
          v34[320] = v47;
          goto LABEL_92;
        }
        if (nLangIDGlb == 7)
        {
          if (!*v79 || *v79 == 30 && !v78[2])
          {
            qword_9DA18 = 0x2000;
            *uint64_t v64 = *v78;
            char v34 = &unk_9D000;
            qword_9DA00 = (uint64_t)(v64 + 1);
LABEL_405:
            unsigned int v33 = (void *)a2;
LABEL_668:
            int k = (unsigned char **)&unk_9D000;
            goto LABEL_669;
          }
          qword_9DA18 = 0;
          if ((unint64_t)(v76 - 1) >= 2 && **(unsigned char **)qword_9DA30 == 30)
          {
            uint64_t v80 = *(void *)(qword_9DA30 + 40);
            if (v80)
            {
              if (*(void *)(v80 + 24) == 2)
              {
                bwd_add_seg(2);
                uint64_t v81 = qword_9DA00;
                if (byte_9DA50) {
                  char v82 = 31;
                }
                else {
                  char v82 = 32;
                }
                *(unsigned char *)qword_9DA00 = v82;
                qword_9DA00 = v81 + 1;
              }
            }
          }
        }
        else
        {
          qword_9DA18 = 0;
        }
        bwd_add_seg(4);
        char v34 = &unk_9D000;
        uint64_t v109 = qword_9DA00;
        *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
        qword_9DA00 = v109 + 1;
        if (nLangIDGlb != 7) {
          goto LABEL_279;
        }
        uint64_t v110 = qword_9DA38;
        uint64_t v111 = (unsigned __int8 *)(qword_9DA38 + 1);
        if (no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), (unsigned __int8 *)(qword_9DA38 + 1)))goto LABEL_279; {
        unsigned int v226 = *v111;
        }
        if (v226 > 0x1F) {
          goto LABEL_528;
        }
        if (v226 == 9) {
          goto LABEL_279;
        }
        if (v226 != 30) {
          goto LABEL_530;
        }
        unsigned int v226 = *(unsigned __int8 *)(v110 + 2);
        if (v226 != 9)
        {
LABEL_528:
          if (v226 != 32 && v226 != 160)
          {
LABEL_530:
            bwd_add_seg(2);
            uint64_t v227 = qword_9DA00;
            if (byte_9DA50) {
              char v228 = 31;
            }
            else {
              char v228 = 32;
            }
            *(unsigned char *)qword_9DA00 = v228;
            qword_9DA00 = v227 + 1;
          }
        }
        goto LABEL_279;
      case 48:
        if (nLangIDGlb != 7 || (unint64_t)qword_9DA18 > 8) {
          goto LABEL_479;
        }
        unsigned int v71 = v39[1];
        if (v71 > 0x2F)
        {
          if (v71 == 48)
          {
            unsigned int v71 = v39[2];
            if (v71 == 30)
            {
              unsigned int v71 = v39[3];
              if (v71 == 62) {
                goto LABEL_455;
              }
              goto LABEL_157;
            }
            if (v71 == 35) {
              goto LABEL_455;
            }
          }
        }
        else
        {
          if (v71 != 30)
          {
LABEL_157:
            if (v71 != 35) {
              goto LABEL_479;
            }
            goto LABEL_455;
          }
          int v98 = v39[2];
          if (v98 == 35) {
            goto LABEL_455;
          }
          if (v98 != 48)
          {
            unsigned int v33 = (void *)a2;
            char v34 = (void *)&unk_9D000;
            int v36 = (void *)&unk_9D000;
            char v35 = (void *)&unk_9D000;
            if (v98 != 62) {
              goto LABEL_479;
            }
LABEL_455:
            bwd_add_seg(32);
            uint64_t v192 = (unsigned char *)v34[320];
            *uint64_t v192 = -89;
            unsigned int v193 = v192 + 1;
            v34[320] = v192 + 1;
            uint64_t v194 = (unsigned __int8 *)qword_9DA38;
            int v195 = *(unsigned __int8 *)(qword_9DA38 + 1);
            if (v195 == 30)
            {
              ++qword_9DA38;
              v192[1] = 30;
              unsigned int v193 = v192 + 2;
              v34[320] = v192 + 2;
              uint64_t v194 = (unsigned __int8 *)qword_9DA38;
              int v195 = *(unsigned __int8 *)(qword_9DA38 + 1);
            }
            if (v195 == 48)
            {
              qword_9DA38 = (uint64_t)(v194 + 1);
              *v193++ = -89;
              v34[320] = v193;
              uint64_t v194 = (unsigned __int8 *)qword_9DA38;
              int v195 = *(unsigned __int8 *)(qword_9DA38 + 1);
            }
            if (v195 == 30)
            {
              qword_9DA38 = (uint64_t)(v194 + 1);
              *v193++ = 30;
              v34[320] = v193;
              uint64_t v194 = (unsigned __int8 *)qword_9DA38;
            }
LABEL_473:
            int v200 = v194[2];
            if (v194[2]
              && ((v200 - 107) > 0xFFFFFFF5 || v200 == 30 && v194[3] - 107 >= 0xFFFFFFF6))
            {
              if (byte_9DA50) {
                char v203 = 31;
              }
              else {
                char v203 = 32;
              }
              *unsigned int v193 = v203;
              v34[320] = v193 + 1;
LABEL_485:
              int k = (unsigned char **)&unk_9D000;
            }
            else
            {
              int v202 = v194[1];
              uint64_t v201 = (uint64_t)(v194 + 1);
              int k = (unsigned char **)&unk_9D000;
              if (v202 == 35) {
                qword_9DA38 = v201;
              }
            }
            goto LABEL_92;
          }
          unsigned int v71 = v39[3];
          unsigned int v33 = (void *)a2;
          char v34 = &unk_9D000;
          int v36 = (void *)&unk_9D000;
          char v35 = (void *)&unk_9D000;
          if (v71 == 35) {
            goto LABEL_455;
          }
        }
        if (v71 != 62) {
          goto LABEL_479;
        }
        goto LABEL_455;
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
        goto LABEL_87;
      default:
        bwd_resolve_nospace();
        int v48 = nLangIDGlb;
        if (nLangIDGlb == 7)
        {
          int k = (unsigned char **)&unk_9D000;
          uint64_t v49 = (unsigned __int8 *)qword_9DA38;
          int v50 = *(unsigned __int8 *)qword_9DA38;
          if (v50 == **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb))
          {
            unint64_t v51 = qword_9DA18;
            if (*(unsigned char *)(qword_9DA38 + 1) == 45 && (qword_9DA18 == 0x2000 || qword_9DA18 == 32))
            {
              bwd_add_seg(2);
              uint64_t v52 = (char *)v34[320];
              if (byte_9DA50) {
                char v53 = 31;
              }
              else {
                char v53 = 32;
              }
              *uint64_t v52 = v53;
              v34[320] = v52 + 1;
              ++qword_9DA38;
              bwd_add_seg(32);
              int v54 = (unsigned char *)v34[320];
              *int v54 = 45;
              v34[320] = v54 + 1;
              int v55 = (unsigned __int8 *)(qword_9DA38 + 1);
              char v35 = (void *)&unk_9D000;
              if (*(unsigned __int8 *)(qword_9DA38 + 1) < 0x21u) {
                goto LABEL_92;
              }
              unsigned int v56 = pBwdLangGlb;
              if (no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), (unsigned __int8 *)(qword_9DA38 + 1))|| no_exception(1, *(unsigned __int8 **)((char *)&stru_20.cmd + (void)v56), v55)|| no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v56 + 8], v55))
              {
                goto LABEL_92;
              }
              goto LABEL_116;
            }
          }
          else
          {
            unint64_t v51 = qword_9DA18;
          }
          if (v50 == 39 && v51 == 0x2000)
          {
            if (*(unsigned char *)(qword_9DA38 + 1) && memchr("\"!'><$\x7F", *(unsigned __int8 *)(qword_9DA38 + 1), 8uLL))
            {
              if (v34[320] - qword_9DA20 == 1) {
                qword_9DA18 = 32;
              }
              uint64_t v88 = 2;
LABEL_236:
              bwd_add_seg(v88);
LABEL_237:
              char v97 = (unsigned char *)v34[320];
              *char v97 = *k[327];
              v34[320] = v97 + 1;
              goto LABEL_670;
            }
            goto LABEL_289;
          }
          if (v50 == 46)
          {
            if (v51 >= 3 && v51 != 64) {
              goto LABEL_289;
            }
            if (*(unsigned char *)(qword_9DA38 + 1) == 35)
            {
              uint64_t v88 = 32;
              goto LABEL_236;
            }
            if (v51 >= 3) {
              goto LABEL_289;
            }
          }
          else
          {
            if (v51 >= 3) {
              goto LABEL_285;
            }
            if (!*(unsigned char *)qword_9DA38) {
              goto LABEL_289;
            }
          }
          char v112 = memchr("\"!'><$\x7F", *(unsigned __int8 *)qword_9DA38, 8uLL);
          if (v50 != 39 && v112 && v49[1] <= 0x20u)
          {
            bwd_add_seg(0);
            goto LABEL_670;
          }
LABEL_285:
          if (v50 == 33)
          {
            int v113 = v49[1];
            if (v113 == 123)
            {
              uint64_t v114 = "!{";
            }
            else
            {
              if (v113 != 61)
              {
                BOOL v116 = qword_95448 == 0x4000;
                goto LABEL_296;
              }
              uint64_t v114 = "!=";
            }
            char v35 = &unk_9D000;
            if (bwd_find_leftchar(qword_9DA30, v114, 2)) {
              uint64_t v282 = 0x4000000;
            }
            else {
              uint64_t v282 = 0x2000000;
            }
            bwd_add_seg(v282);
            char v177 = *(unsigned char *)qword_9DA38;
LABEL_402:
            char v34 = &unk_9D000;
            uint64_t v178 = qword_9DA00;
            *(unsigned char *)qword_9DA00 = v177;
            *(unsigned char *)(v178 + 1) = *(unsigned char *)++qword_9DA38;
            qword_9DA00 = v178 + 2;
            bwd_add_rightchars();
            unsigned int v33 = (void *)a2;
LABEL_403:
            int v36 = (void *)&unk_9D000;
            goto LABEL_92;
          }
LABEL_289:
          if (qword_95448 == 0x4000)
          {
            if (v50 == 34)
            {
              int v115 = v49[1];
              if (v115 == 111)
              {
                if (v49[2] == 44) {
                  goto LABEL_676;
                }
              }
              else if (v115 == 57 && v49[2] == 46)
              {
LABEL_676:
                bwd_add_seg(1);
                uint64_t v274 = qword_9DA00;
                if (*(unsigned char *)(qword_9DA38 + 1) == 111) {
                  char v275 = 62;
                }
                else {
                  char v275 = 60;
                }
                *(unsigned char *)qword_9DA00 = v275;
                qword_9DA00 = v274 + 1;
                uint64_t v276 = qword_9DA38;
                qword_9DA38 += 2;
                if (*(unsigned char *)(v276 + 3) == 35)
                {
                  *(unsigned char *)(v274 + 1) = 32;
                  qword_9DA00 = v274 + 2;
                  *(unsigned char *)qword_9DA38 = 32;
                }
                bwd_add_rightchars();
                goto LABEL_682;
              }
            }
            BOOL v116 = 1;
          }
          else
          {
            BOOL v116 = 0;
          }
LABEL_296:
          if (no_exception(1, "\t''[=()\x01", v49))
          {
            int v117 = v49[2];
            if (v117 == 40)
            {
              uint64_t v118 = 0x2000000;
            }
            else
            {
              if (v117 == 61)
              {
                char v35 = &unk_9D000;
                if (bwd_find_leftchar(qword_9DA30, "'=", 3)) {
                  uint64_t v118 = 0x4000000;
                }
                else {
                  uint64_t v118 = 0x2000000;
                }
                goto LABEL_401;
              }
              uint64_t v118 = 0x4000000;
            }
            char v35 = (void *)&unk_9D000;
LABEL_401:
            bwd_add_seg(v118);
            char v177 = *(unsigned char *)++qword_9DA38;
            goto LABEL_402;
          }
          char v119 = !v116;
          if (v50 != 62) {
            char v119 = 1;
          }
          if ((v119 & 1) == 0)
          {
            int v120 = v49[1];
            if (v120 == 123)
            {
              uint64_t v121 = (char *)(v49 + 2);
              unsigned int v122 = ">}";
LABEL_698:
              unsigned int v33 = (void *)a2;
              char v34 = &unk_9D000;
              int v36 = (void *)&unk_9D000;
              if (strstr(v121, v122))
              {
                bwd_add_seg(1);
                ++qword_9DA38;
                uint64_t v283 = (char *)(qword_9DA00 + 1);
                if (*(unsigned char *)qword_9DA38 == 123)
                {
                  *(unsigned char *)qword_9DA00 = 91;
                  while (1)
                  {
                    unsigned int v284 = (char *)(qword_9DA38 + 1);
                    if (!*(unsigned char *)(qword_9DA38 + 1)) {
                      goto LABEL_1297;
                    }
                    ++qword_9DA38;
                    v285 = v284;
                    v286 = ">}";
                    while (1)
                    {
                      do
                        int v287 = *v285++;
                      while (v287 == 173 || v287 == 30);
                      if (v287 != *(unsigned __int8 *)v286) {
                        break;
                      }
                      if (++v286 == "")
                      {
                        char v350 = 93;
                        goto LABEL_843;
                      }
                    }
                    *v283++ = *v284;
                  }
                }
                *(unsigned char *)qword_9DA00 = 47;
LABEL_714:
                char v289 = (char *)(qword_9DA38 + 1);
                if (*(unsigned char *)(qword_9DA38 + 1))
                {
                  ++qword_9DA38;
                  int v290 = v289;
                  v291 = ">|";
                  do
                  {
                    do
                      int v292 = *v290++;
                    while (v292 == 173 || v292 == 30);
                    if (v292 != *v291)
                    {
                      *v283++ = *v289;
                      goto LABEL_714;
                    }
                    ++v291;
                  }
                  while (v291 != "");
                  char v350 = 47;
LABEL_843:
                  *uint64_t v283 = v350;
                  qword_9DA00 = (uint64_t)(v283 + 1);
                  ++qword_9DA38;
                }
                else
                {
LABEL_1297:
                  qword_9DA00 = (uint64_t)v283;
                }
                goto LABEL_1298;
              }
              goto LABEL_309;
            }
            if (v120 == 124)
            {
              uint64_t v121 = (char *)(v49 + 2);
              unsigned int v122 = ">|";
              goto LABEL_698;
            }
          }
          unsigned int v33 = (void *)a2;
          char v34 = (void *)&unk_9D000;
          int v36 = (void *)&unk_9D000;
LABEL_309:
          if ((byte_9DBAC & 1) != 0 || byte_9DBA8)
          {
            uint64_t v123 = (unsigned __int8 *)qword_9DA38;
            uint64_t v124 = *(unsigned __int8 **)((char *)&stru_68.size + (void)pLangGlb);
            while (1)
            {
              do
                int v125 = *v123++;
              while (v125 == 173 || v125 == 30);
              if (v125 != *v124) {
                break;
              }
              if (!*++v124)
              {
                int k = (unsigned char **)&unk_9D000;
                qword_9DA38 = strlen(*(const char **)((char *)&stru_68.size + (void)pLangGlb)) + qword_9DA38 - 1;
                byte_9DBAC = 0;
                byte_9DBA8 = 0;
                goto LABEL_682;
              }
            }
            unsigned int v33 = (void *)a2;
            char v34 = &unk_9D000;
            int v36 = (void *)&unk_9D000;
          }
          goto LABEL_320;
        }
        unint64_t v51 = qword_9DA18;
        if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
        {
          char v92 = (char *)qword_9DA38;
          int v93 = *(unsigned __int8 *)qword_9DA38;
          if (v93 == 34)
          {
            int v94 = *(char *)(qword_9DA38 + 1);
            size_t v95 = ":-01";
            size_t v96 = 5;
          }
          else
          {
            if (v93 != 62) {
              goto LABEL_320;
            }
            int v94 = *(char *)(qword_9DA38 + 1);
            size_t v95 = ":&01367|";
            size_t v96 = 9;
          }
          if (memchr(v95, v94, v96) && v92[2] && bwd_fetch_ueb_char(&v849, v92))
          {
            bwd_add_seg(0x2000);
            v108 = (unsigned __int8 *)v34[320];
            unsigned __int8 *v108 = v849;
            v34[320] = v108 + 1;
            int k = (unsigned char **)&unk_9D000;
            qword_9DA38 += 2;
            goto LABEL_670;
          }
        }
        else if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
        {
          goto LABEL_309;
        }
LABEL_320:
        char v128 = byte_9DAA4;
        int v129 = dword_9D9F0;
        if ((byte_9DAA4 & 1) != 0 || dword_9D9F0)
        {
          unsigned __int8 v144 = (unsigned char *)qword_9DA38;
          int v145 = (unsigned __int8 *)qword_9DA38;
          v146 = *(unsigned __int8 **)&stru_68.segname[(void)pLangGlb];
          while (1)
          {
            do
              int v147 = *v145++;
            while (v147 == 173 || v147 == 30);
            if (v147 != *v146) {
              break;
            }
            if (!*++v146)
            {
              if ((v51 & 0x102400) != 0
                && (v48 == 12 || v48 == 9)
                && ((uint64_t v150 = *(unsigned __int8 *)(qword_9DA38 + strlen(*(const char **)&stru_68.segname[(void)pLangGlb])),
                     in(v150, 11))
                 || in(v150, 41)))
              {
                BOOL v151 = (unsigned char *)v34[320];
                *BOOL v151 = *v144;
                v34[320] = v151 + 1;
              }
              else
              {
                bwd_add_seg(0);
                qword_9DA38 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb]) + qword_9DA38 - 1;
              }
              dword_9D9F0 = 0;
              goto LABEL_405;
            }
          }
        }
        int v130 = byte_9DA54;
        if (byte_9DA54 == 1)
        {
          BOOL v131 = (unsigned __int8 *)qword_9DA38;
          unint64_t v132 = "'.";
          while (1)
          {
            do
              int v133 = *v131++;
            while (v133 == 173 || v133 == 30);
            if (v133 != *(unsigned __int8 *)v132) {
              break;
            }
            if (++v132 == "")
            {
              int k = (unsigned char **)&unk_9D000;
              bwd_add_seg(0);
              ++qword_9DA38;
              byte_9DA54 = 0;
              goto LABEL_670;
            }
          }
        }
        if (dword_9D9F0) {
          int v130 = 1;
        }
        if (v48 == 7)
        {
          if (v130)
          {
            uint64_t v135 = qword_9DA38;
            if (*(unsigned char *)qword_9DA38 == 39
              && in(*(unsigned __int8 *)(qword_9DA38 + 1), 9)
              && in(*(unsigned __int8 *)(v135 - 1), 9))
            {
              bwd_add_seg(32);
              int k = (unsigned char **)&unk_9D000;
              int v136 = (unsigned char *)v34[320];
              *int v136 = *(unsigned char *)qword_9DA38;
              v34[320] = v136 + 1;
              unsigned int v33 = (void *)a2;
              goto LABEL_670;
            }
          }
        }
        uint64_t v137 = qword_95448;
        if (qword_95448 == 0x4000)
        {
          int v138 = (unsigned __int8 *)qword_9DA38;
          uint64_t v139 = (unsigned __int8 *)qword_9DA38;
          char v140 = *(unsigned __int8 **)&stru_68.segname[(void)pLangGlb + 16];
          while (1)
          {
            do
              int v141 = *v139++;
            while (v141 == 173 || v141 == 30);
            if (v141 != *v140) {
              break;
            }
            if (!*++v140)
            {
              int k = (unsigned char **)&unk_9D000;
              qword_9DA38 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb + 16]) + qword_9DA38 - 1;
              byte_9DBAC = 0;
              byte_9DBA8 = 1;
              goto LABEL_348;
            }
          }
          BOOL v172 = *(unsigned __int8 **)&stru_68.segname[(void)pLangGlb - 8];
          unint64_t v173 = (unsigned __int8 *)qword_9DA38;
          while (1)
          {
            do
              int v174 = *v173++;
            while (v174 == 173 || v174 == 30);
            if (v174 != *v172) {
              break;
            }
            if (!*++v172)
            {
              bwd_add_seg(0);
              int k = (unsigned char **)&unk_9D000;
              qword_9DA38 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb - 8]) + qword_9DA38 - 1;
              dword_9D9F0 = 1;
              goto LABEL_682;
            }
          }
          BOOL v152 = v48 == 12;
          if (v48 == 12)
          {
            int v183 = (unsigned __int8 *)qword_9DA38;
            unsigned int v184 = ":$";
            do
            {
              do
                int v185 = *v183++;
              while (v185 == 173 || v185 == 30);
              if (v185 != *v184) {
                goto LABEL_486;
              }
              ++v184;
            }
            while (v184 != "");
            bwd_add_seg(0);
            int k = (unsigned char **)&unk_9D000;
            ++qword_9DA38;
            byte_9DA90 = 1;
            dword_9DAA0 = 1;
LABEL_682:
            unsigned int v33 = (void *)a2;
            goto LABEL_1300;
          }
LABEL_486:
          int v204 = *(unsigned __int8 **)&stru_68.sectname[(void)pLangGlb];
          do
          {
            do
              int v205 = *v138++;
            while (v205 == 173 || v205 == 30);
            if (v205 != *v204) {
              goto LABEL_363;
            }
          }
          while (*++v204);
          bwd_add_seg(0);
          uint64_t v208 = (unsigned char *)(qword_9DA38 + strlen(*(const char **)&stru_68.sectname[(void)pLangGlb]));
          uint64_t v209 = v208 - 1;
          qword_9DA38 = (uint64_t)(v208 - 1);
          if (!*v208
            || v208[1] != *((unsigned char *)&stru_20.filesize + (void)pBwdLangGlb)
            || ((v210 = v208[2] - 100, BOOL v31 = v210 > 0x1A, v211 = (1 << v210) & 0x4008001, !v31)
              ? (BOOL v212 = v211 == 0)
              : (BOOL v212 = 1),
                !v212 && v209[4] < 0x41u))
          {
            byte_9DAA4 = 1;
            goto LABEL_1299;
          }
          dword_9DAA0 = 1;
          bwd_add_seg(0x2000);
          int k = (unsigned char **)&unk_9D000;
          ++qword_9DA38;
          char v34 = &unk_9D000;
          uint64_t v213 = qword_9DA00;
          *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38 & 0xDF;
          qword_9DA00 = v213 + 1;
          bwd_add_seg(4);
          char v214 = *(unsigned char *)++qword_9DA38;
LABEL_810:
          uint64_t v331 = qword_9DA00;
          *(unsigned char *)qword_9DA00 = v214;
          qword_9DA00 = v331 + 1;
          goto LABEL_348;
        }
        BOOL v152 = v48 == 12;
LABEL_363:
        if (v48 == 7)
        {
          unsigned int v153 = *(unsigned __int8 *)(qword_9DA38 - 1);
          if (v153 < 0x21 || v153 == 61)
          {
            char v179 = (unsigned __int8 *)qword_9DA38;
            v180 = "!,";
            do
            {
              do
                int v181 = *v179++;
              while (v181 == 173 || v181 == 30);
              if (v181 != *v180) {
                goto LABEL_366;
              }
              ++v180;
            }
            while (v180 != "");
            if (*(unsigned __int8 *)(qword_9DA38 + 2) >= 0x21u) {
              goto LABEL_429;
            }
          }
LABEL_366:
          if (qword_95448 != 0x4000) {
            goto LABEL_758;
          }
          int v154 = (unsigned __int8 *)qword_9DA38;
          v155 = "'.";
          do
          {
            do
              int v156 = *v154++;
            while (v156 == 173 || v156 == 30);
            if (v156 != *v155) {
              goto LABEL_379;
            }
            ++v155;
          }
          while (v155 != "");
          if (*(unsigned __int8 *)(qword_9DA38 + 2) >= 0x21u)
          {
            bwd_add_seg(0);
            uint64_t v158 = qword_9DA38++;
            uint64_t v159 = *(unsigned __int8 *)(v158 + 2);
            if (v159 == 46)
            {
              bwd_add_seg(32);
              uint64_t v160 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = 46;
              int v161 = (unsigned char *)(v160 + 1);
              for (uint64_t j = qword_9DA38; ; uint64_t j = qword_9DA38)
              {
                int v164 = *(unsigned __int8 *)(j + 1);
                uint64_t v163 = j + 1;
                if (v164 != 46) {
                  break;
                }
                qword_9DA38 = v163;
                *v161++ = 46;
              }
              char v34 = &unk_9D000;
            }
            else
            {
              if (!in(v159, 5))
              {
                byte_9D9EC = 1;
                goto LABEL_1299;
              }
              bwd_add_seg(32);
              char v34 = &unk_9D000;
              uint64_t v351 = qword_9DA00;
              *(unsigned char *)qword_9DA00 = 46;
              int v161 = (unsigned char *)(v351 + 1);
            }
            qword_9DA00 = (uint64_t)v161;
            bwd_add_rightchars();
            goto LABEL_405;
          }
        }
LABEL_379:
        if (qword_95448 != 0x4000) {
          goto LABEL_758;
        }
        v165 = (unsigned __int8 *)qword_9DA38;
        v166 = pLangGlb;
        v167 = *(unsigned __int8 **)((char *)&stru_68.reloff + (void)pLangGlb);
        v168 = (unsigned __int8 *)qword_9DA38;
        while (1)
        {
          do
            int v169 = *v165++;
          while (v169 == 173 || v169 == 30);
          if (v169 != *v167) {
            break;
          }
          if (!*++v167)
          {
LABEL_520:
            bwd_add_seg(2048);
            uint64_t v222 = qword_9DA00;
            uint64_t v223 = qword_9DA00;
            *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
            v224 = (unsigned __int8 *)(v223 + 1);
            qword_9DA00 = (uint64_t)v224;
            if ((int)strlen(*(const char **)((char *)&stru_68.reloff + (void)pLangGlb)) >= 2)
            {
              uint64_t v225 = 1;
              do
                *(unsigned char *)(v222 + v225++) = *(unsigned char *)++qword_9DA38;
              while (v225 < (int)strlen(*(const char **)((char *)&stru_68.reloff + (void)pLangGlb)));
              v224 = (unsigned __int8 *)(v222 + v225);
LABEL_1284:
              qword_9DA00 = (uint64_t)v224;
            }
            unsigned int v512 = (unsigned __int8 *)(qword_9DA38 + 1);
            if (*(unsigned char *)(qword_9DA38 + 1))
            {
              ++qword_9DA38;
              v513 = *(unsigned __int8 **)&stru_B8.segname[(void)pLangGlb - 8];
              unsigned int v514 = v512;
              do
              {
                do
                  int v515 = *v514++;
                while (v515 == 173 || v515 == 30);
                if (v515 != *v513)
                {
                  *v224++ = *v512;
                  goto LABEL_1284;
                }
              }
              while (*++v513);
              unsigned __int8 *v224 = *v512;
              qword_9DA00 = (uint64_t)(v224 + 1);
              if ((int)strlen(*(const char **)&stru_B8.segname[(void)pLangGlb - 8]) < 2) {
                goto LABEL_1298;
              }
              uint64_t v310 = 1;
              do
                v224[v310++] = *(unsigned char *)++qword_9DA38;
              while (v310 < (int)strlen(*(const char **)&stru_B8.segname[(void)pLangGlb - 8]));
              goto LABEL_1296;
            }
            goto LABEL_1298;
          }
        }
        BOOL v215 = v48 == 9 && nSubLangIDGlb == 1;
        int v216 = v215;
        if (v215)
        {
          v217 = *(unsigned __int8 **)((char *)&stru_68.flags + (void)pLangGlb);
          char v218 = (unsigned __int8 *)qword_9DA38;
          while (1)
          {
            do
              int v219 = *v218++;
            while (v219 == 173 || v219 == 30);
            if (v219 != *v217) {
              break;
            }
            if (!*++v217) {
              goto LABEL_520;
            }
          }
        }
        v277 = *(unsigned __int8 **)((char *)&stru_68.offset + (void)pLangGlb);
        char v278 = (unsigned __int8 *)qword_9DA38;
        do
        {
          do
            int v279 = *v278++;
          while (v279 == 173 || v279 == 30);
          if (v279 != *v277)
          {
            if (v216)
            {
              char v294 = *(unsigned __int8 **)((char *)&stru_68.flags + (void)pLangGlb);
              int v295 = (unsigned __int8 *)qword_9DA38;
              while (1)
              {
                do
                  int v296 = *v295++;
                while (v296 == 173 || v296 == 30);
                if (v296 != *v294) {
                  break;
                }
                if (!*++v294) {
                  goto LABEL_732;
                }
              }
            }
            int v311 = *(unsigned __int8 *)qword_9DA38;
            if (v311 == **(unsigned __int8 **)&stru_68.segname[(void)pLangGlb + 8])
            {
              if (v48 != 7)
              {
                if (v48 != 9 || nSubLangIDGlb != 3)
                {
                  if (v48 != 9) {
                    goto LABEL_963;
                  }
                  int v395 = *(unsigned __int8 *)(qword_9DA38 + 1);
                  BOOL v396 = nSubLangIDGlb == 1 && v395 == 107;
                  BOOL v397 = v396;
                  if (v395 != 61 && !v397) {
                    goto LABEL_963;
                  }
                }
                goto LABEL_780;
              }
              if (*(unsigned char *)(qword_9DA38 + 1) != 108)
              {
LABEL_963:
                byte_9DBAC = 1;
                byte_9DBA8 = 0;
                goto LABEL_1299;
              }
            }
            else
            {
LABEL_758:
              if (v48 != 7)
              {
LABEL_778:
                v168 = (unsigned __int8 *)qword_9DA38;
                if (qword_95448 != 0x4000) {
                  goto LABEL_786;
                }
                int v311 = *(unsigned __int8 *)qword_9DA38;
                v166 = pLangGlb;
LABEL_780:
                if (v311 == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)v166))
                {
                  if (v48 != 9 || v168[1] != 61 || v168[2] <= 0x20u)
                  {
                    bwd_add_seg(0);
                    dword_9DAA0 = 1;
                    byte_9DA90 = 0;
                    goto LABEL_1299;
                  }
                  goto LABEL_799;
                }
                v168 = (unsigned __int8 *)qword_9DA38;
LABEL_786:
                if (v48 == 7)
                {
                  int v322 = v168;
                  v323 = "!$";
                  do
                  {
                    do
                      int v324 = *v322++;
                    while (v324 == 173 || v324 == 30);
                    if (v324 != *v323) {
                      goto LABEL_799;
                    }
                    ++v323;
                  }
                  while (v323 != "");
                  if (v51 == 0x2000
                    && !dword_9DAA0
                    && qword_9DA00 - qword_9DA20 >= 1
                    && *(unsigned __int8 *)qword_9DA20 == **(unsigned __int8 **)((char *)&stru_20.maxprot
                                                                               + (void)pLangGlb))
                  {
                    memmove((void *)qword_9DA20, (const void *)(qword_9DA20 + 1), --qword_9DA00 - qword_9DA20);
                  }
                  else
                  {
                    dword_9DAA0 = 1;
                  }
                  byte_9DA90 = 0;
                  byte_9DAA4 = 0;
                  dword_9D9F0 = 0;
                  uint64_t v347 = 0x2000;
                  goto LABEL_842;
                }
LABEL_799:
                if (v152)
                {
                  BOOL v326 = v168;
                  char v327 = "?//";
                  while (1)
                  {
                    do
                      int v328 = *v326++;
                    while (v328 == 173 || v328 == 30);
                    if (v328 != *(unsigned __int8 *)v327) {
                      break;
                    }
                    if (++v327 == "") {
                      goto LABEL_807;
                    }
                  }
                }
                int v332 = v168;
                v333 = "..";
                do
                {
                  do
                    int v334 = *v332++;
                  while (v334 == 173 || v334 == 30);
                  if (v334 != *v333) {
                    goto LABEL_819;
                  }
                  ++v333;
                }
                while (v333 != "");
                if (*(v168 - 1) != 39)
                {
LABEL_828:
                  bwd_add_seg(32);
                  uint64_t v340 = qword_9DA00;
                  *(unsigned char *)qword_9DA00 = 46;
                  uint64_t v341 = (unsigned char *)(v340 + 1);
                  uint64_t v342 = qword_9DA38 + 1;
                  for (int k = (unsigned char **)&unk_9D000;
                        *(unsigned __int8 *)(qword_9DA38 + 1) == *(unsigned __int8 *)qword_9DA38;
                        uint64_t v342 = qword_9DA38 + 1)
                  {
                    qword_9DA38 = v342;
                    *v341++ = 46;
                  }
                  char v34 = &unk_9D000;
LABEL_831:
                  qword_9DA00 = (uint64_t)v341;
                  bwd_add_rightchars();
LABEL_348:
                  unsigned int v33 = (void *)a2;
                  goto LABEL_669;
                }
LABEL_819:
                if (v48 == 12 || v48 == 9)
                {
                  int v336 = v168;
                  uint64_t v337 = "//";
                  while (1)
                  {
                    do
                      int v338 = *v336++;
                    while (v338 == 173 || v338 == 30);
                    if (v338 != *(unsigned __int8 *)v337) {
                      break;
                    }
                    if (++v337 == "") {
                      goto LABEL_828;
                    }
                  }
                }
                uint64_t v343 = qword_9DA18;
                if (qword_9DA18 == 0x2000 && v152)
                {
                  int v345 = *v168;
                  if (v345 == *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb))
                  {
                    v346 = (unsigned char *)qword_9DA20;
                    if (qword_9DA00 - qword_9DA20 == 1
                      && no_exception(1, "\t[cdjlmnst\x01", (unsigned __int8 *)qword_9DA20))
                    {
                      *v346 &= ~0x20u;
LABEL_851:
                      uint64_t v330 = 4;
                      goto LABEL_808;
                    }
                    uint64_t v352 = qword_9DA20;
                    if (qword_9DA00 - qword_9DA20 == 2
                      && no_exception(1, "\t-[cdjlmnst\x01", (unsigned __int8 *)qword_9DA20))
                    {
                      *(unsigned char *)(v352 + 1) &= ~0x20u;
                      goto LABEL_851;
                    }
                  }
                  if (no_exception(1, byte_4BA82, v168))
                  {
                    if (v168[1] == 115)
                    {
                      bwd_add_seg(4);
                      LOBYTE(v345) = *(unsigned char *)qword_9DA38;
                    }
                    char v34 = &unk_9D000;
                    uint64_t v353 = qword_9DA00;
                    *(unsigned char *)qword_9DA00 = v345;
                    qword_9DA00 = v353 + 1;
                    int k = (unsigned char **)&unk_9D000;
                    ++qword_9DA38;
                    unsigned int v33 = (void *)a2;
                    int v36 = (void *)&unk_9D000;
                    char v35 = (void *)&unk_9D000;
                    if (!bwd_no_abbrev(*(void *)&stru_20.segname[(void)pLangGlb + 16])
                      || !bwd_no_locution())
                    {
                      goto LABEL_92;
                    }
                    bwd_add_seg(0);
                    if (*(unsigned char *)qword_9DA38 == 115) {
                      uint64_t v40 = 32;
                    }
                    else {
                      uint64_t v40 = 0x2000;
                    }
                    goto LABEL_88;
                  }
                }
                if (v48 != 7)
                {
LABEL_878:
                  int v361 = nSubLangIDGlb;
                  if (v48 == 9 && nSubLangIDGlb != 3)
                  {
                    if (v137 != 0x4000 && (v343 & 0x2000003) == 0) {
                      goto LABEL_904;
                    }
                    int v362 = v168;
                    v363 = "'=";
                    do
                    {
                      do
                        int v364 = *v362++;
                      while (v364 == 173 || v364 == 30);
                      if (v364 != *v363) {
                        goto LABEL_890;
                      }
                      ++v363;
                    }
                    while (v363 != "");
                    if (v168[2] != 32)
                    {
                      uint64_t v347 = 0x2000000;
LABEL_842:
                      bwd_add_seg(v347);
                      int k = (unsigned char **)&unk_9D000;
                      char v34 = &unk_9D000;
                      uint64_t v348 = qword_9DA00;
                      *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38++;
                      *(unsigned char *)(v348 + 1) = *(unsigned char *)qword_9DA38;
                      uint64_t v349 = (unsigned char *)(v348 + 2);
LABEL_929:
                      qword_9DA00 = (uint64_t)v349;
                      goto LABEL_348;
                    }
                  }
LABEL_890:
                  if (v137 == 0x4000 || (v343 & 0x2000003) != 0)
                  {
                    uint64_t v384 = v168;
                    int v385 = ".wh";
                    do
                    {
                      do
                        int v386 = *v384++;
                      while (v386 == 173 || v386 == 30);
                      if (v386 != *v385) {
                        goto LABEL_892;
                      }
                      ++v385;
                    }
                    while (v385 != "");
                    unsigned int v388 = v168[3];
                    BOOL v389 = v388 > 0x20 || ((1 << v388) & 0x100000201) == 0;
                    if (!v389 || v388 == 160 || v388 <= 0x1F)
                    {
                      bwd_add_seg(1);
                      uint64_t v390 = 0;
                      uint64_t v391 = qword_9DA00;
                      int v392 = 83;
                      do
                      {
                        if (v392 == 39) {
                          LOBYTE(v392) = 46;
                        }
                        *(unsigned char *)(v391 + v390) = v392;
                        int v392 = aSdg[++v390];
                      }
                      while (v390 != 3);
                      uint64_t v393 = v391 + 3;
                      goto LABEL_946;
                    }
                  }
LABEL_892:
                  if (v48 == 7)
                  {
                    v366 = v168;
                    v367 = "!-";
                    do
                    {
                      do
                        int v368 = *v366++;
                      while (v368 == 173 || v368 == 30);
                      if (v368 != *v367) {
                        goto LABEL_904;
                      }
                      ++v367;
                    }
                    while (v367 != "");
                    bwd_add_seg(32);
                    char v34 = &unk_9D000;
                    char v370 = (char *)qword_9DA00;
                    if (v343) {
                      char v371 = 124;
                    }
                    else {
                      char v371 = 45;
                    }
                    goto LABEL_903;
                  }
LABEL_904:
                  if (v137 == 0x4000 || (v343 & 0x2000003) != 0)
                  {
                    int v373 = *(v168 - 1);
                    if (v373 != 33 && v373 != 44)
                    {
                      if ((int v438 = *v168, v438 != 61) && v438 != 40
                        || v343 != 0x2000000
                        && v373 != 45
                        && v168[1] != 45
                        && !bwd_rightchar_follows(v168 + 1))
                      {
                        char v439 = !v152;
                        if (v438 != 61) {
                          char v439 = 1;
                        }
                        if ((v439 & 1) != 0
                          || (int v440 = v168[1], (v440 - 46) >= 2) && v440 != 115
                          || (unsigned int v441 = v168[2], v441 >= 0x41) && v441 != 115)
                        {
                          if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.cmd + (void)pBwdLangGlb), v168))
                          {
                            bwd_add_seg(0x2000000);
                            uint64_t v442 = qword_9DA00;
                            uint64_t v443 = qword_9DA00;
                            *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
                            char v444 = (unsigned char *)(v443 + 1);
                            qword_9DA00 = (uint64_t)v444;
                            v445 = (unsigned __int8 *)qword_9DA38;
                            uint64_t v446 = qword_9DA38 + 1;
                            if (*(unsigned char *)(qword_9DA38 + 1) == 30)
                            {
                              ++qword_9DA38;
                              qword_9D9F8 = 1;
                              v445 = (unsigned __int8 *)v446;
                            }
                            if (nLangIDGlb == 7)
                            {
                              v447 = v445;
                              v448 = "'<=";
                              while (1)
                              {
                                do
                                  int v449 = *v447++;
                                while (v449 == 173 || v449 == 30);
                                if (v449 != *(unsigned __int8 *)v448) {
                                  break;
                                }
                                if (++v448 == "")
                                {
                                  qword_9DA38 = (uint64_t)++v445;
                                  goto LABEL_1143;
                                }
                              }
                            }
                            if (nLangIDGlb == 9
                              && nSubLangIDGlb == 3
                              && *v445 == 39
                              && no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), v445 + 1)&& v445[2] >= 0x21u)
                            {
                              qword_9DA38 = (uint64_t)(v445 + 1);
                              *(unsigned char *)(v442 + 1) = v445[1];
                              char v444 = (unsigned char *)(v442 + 2);
                              qword_9DA00 = v442 + 2;
                              v445 = (unsigned __int8 *)qword_9DA38;
                            }
LABEL_1143:
                            if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), v445)&& v445[1] >= 0x21u)
                            {
                              qword_9DA38 = (uint64_t)(v445 + 1);
                              *char v444 = v445[1];
                              qword_9DA00 = (uint64_t)(v444 + 1);
                              v445 = (unsigned __int8 *)qword_9DA38;
                            }
                            unsigned int v33 = (void *)a2;
                            int k = (unsigned char **)&unk_9D000;
                            char v34 = (void *)&unk_9D000;
                            int v36 = (void *)&unk_9D000;
                            char v35 = (void *)&unk_9D000;
                            if (v445[1] <= 0x20u) {
                              qword_9DA18 = 0x2000;
                            }
                            goto LABEL_92;
                          }
                        }
                      }
                    }
                  }
                  if (v137 == 0x10000)
                  {
                    char v394 = 0;
                  }
                  else
                  {
                    if (v137 == 0x8000
                      && no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)pBwdLangGlb], v168))
                    {
                      bwd_add_seg(0x2000000);
                      unsigned int v374 = (unsigned __int8 *)qword_9DA38;
                      uint64_t v375 = qword_9DA38 + 1;
                      if (*(unsigned char *)(qword_9DA38 + 1) == 30)
                      {
                        ++qword_9DA38;
                        qword_9D9F8 = 1;
                        unsigned int v374 = (unsigned __int8 *)v375;
                      }
                      if (nLangIDGlb == 7)
                      {
                        unsigned int v376 = *v374;
                        if (v376 <= 0x28)
                        {
                          if (v376 == 34)
                          {
                            if (v374[1] != 62) {
                              goto LABEL_1262;
                            }
                            goto LABEL_1261;
                          }
                          if (v376 == 39)
                          {
                            int v379 = v374[1];
                            uint64_t v378 = (uint64_t)(v374 + 1);
                            int v377 = v379;
                            if (v379 == 40)
                            {
                              char v499 = (char *)v378;
                              uint64_t v500 = "')";
                              goto LABEL_1252;
                            }
                            if (v377 != 41)
                            {
                              if (v377 == 58) {
                                goto LABEL_1260;
                              }
                              BOOL v380 = (unsigned __int8 *)v378;
                              uint64_t v381 = "<=";
                              while (1)
                              {
                                do
                                  int v382 = *v380++;
                                while (v382 == 173 || v382 == 30);
                                if (v382 != *(unsigned __int8 *)v381) {
                                  break;
                                }
                                if (++v381 == "") {
                                  goto LABEL_1261;
                                }
                              }
                              uint64_t v501 = qword_9DA30;
                              if (bwd_find_leftchar(qword_9DA30, "'=", 2)) {
                                goto LABEL_1261;
                              }
                              if (bwd_find_leftchar(v501, "=", 2)) {
                                goto LABEL_1260;
                              }
                              char v499 = (char *)v378;
                              uint64_t v500 = "'=";
LABEL_1252:
                              if (!strstr(v499, v500)) {
                                qword_9DA38 = v378;
                              }
                              goto LABEL_1262;
                            }
                            if (!bwd_find_leftchar(qword_9DA30, "'(", 2)) {
LABEL_1260:
                            }
                              qword_9DA38 = v378;
LABEL_1261:
                            bwd_add_seg(0x4000000);
                            goto LABEL_1262;
                          }
                          goto LABEL_1262;
                        }
                        if (v376 == 41) {
                          goto LABEL_1261;
                        }
                        if (v376 != 60)
                        {
LABEL_1262:
                          uint64_t v502 = qword_9DA00;
                          uint64_t v503 = qword_9DA00;
                          *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
                          v504 = (unsigned char *)(v503 + 1);
                          qword_9DA00 = (uint64_t)v504;
                          uint64_t v505 = (unsigned __int8 *)qword_9DA38;
                          if (nLangIDGlb == 7)
                          {
                            unsigned int v506 = (unsigned __int8 *)qword_9DA38;
                            uint64_t v507 = "'<=";
                            while (1)
                            {
                              do
                                int v508 = *v506++;
                              while (v508 == 173 || v508 == 30);
                              if (v508 != *(unsigned __int8 *)v507) {
                                break;
                              }
                              if (++v507 == "")
                              {
                                uint64_t v505 = (unsigned __int8 *)++qword_9DA38;
                                goto LABEL_1277;
                              }
                            }
                          }
                          if (nLangIDGlb == 9
                            && nSubLangIDGlb == 3
                            && *(unsigned char *)qword_9DA38 == 39
                            && no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), (unsigned __int8 *)(qword_9DA38 + 1))&& v505[2] >= 0x21u)
                          {
                            qword_9DA38 = (uint64_t)(v505 + 1);
                            *(unsigned char *)(v502 + 1) = v505[1];
                            v504 = (unsigned char *)(v502 + 2);
                            qword_9DA00 = v502 + 2;
                            uint64_t v505 = (unsigned __int8 *)qword_9DA38;
                          }
LABEL_1277:
                          if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), v505))
                          {
                            unsigned int v511 = v505[1];
                            v510 = v505 + 1;
                            if (v511 >= 0x21)
                            {
                              qword_9DA38 = (uint64_t)v510;
                              unsigned char *v504 = *v510;
                              qword_9DA00 = (uint64_t)(v504 + 1);
                            }
                          }
                          goto LABEL_1298;
                        }
                        uint64_t v458 = qword_9DA30;
                        int v459 = "<=";
                      }
                      else
                      {
                        if (nLangIDGlb != 9 || nSubLangIDGlb == 3) {
                          goto LABEL_1262;
                        }
                        unsigned int v456 = *v374;
                        if (v456 > 0x3B)
                        {
                          if (v456 != 127)
                          {
                            if (v456 == 60)
                            {
                              if (bwd_find_leftchar(qword_9DA30, "=", 2))
                              {
                                bwd_add_seg(0x4000000);
                                uint64_t v461 = qword_9DA38 + 1;
                              }
                              else
                              {
                                uint64_t v461 = (uint64_t)(v374 + 1);
                              }
                              qword_9DA38 = v461;
                            }
                            goto LABEL_1262;
                          }
                          uint64_t v458 = qword_9DA30;
                          int v459 = "\x7F=";
                        }
                        else
                        {
                          if (v456 != 36)
                          {
                            if (v456 != 41) {
                              goto LABEL_1262;
                            }
                            goto LABEL_1261;
                          }
                          uint64_t v458 = qword_9DA30;
                          int v459 = "$=";
                        }
                      }
                      if (!bwd_find_leftchar(v458, v459, 2)) {
                        goto LABEL_1262;
                      }
                      goto LABEL_1261;
                    }
                    char v394 = 1;
                    if (*(v168 - 1) != 150 && (v343 & 0xC0) == 0)
                    {
LABEL_993:
                      if (v152
                        && (lFlags & 0x40000000) == 0
                        && v343 != 0x2000
                        && *v168 == stru_B8.segname[(void)pLangGlb + 3]
                        && (v168[1] && memchr("#123456789", v168[1], 0xBuLL)
                         || no_exception(1, *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pBwdLangGlb), v168 + 1)))
                      {
                        if ((v343 & 0xC0) != 0)
                        {
                          bwd_add_seg(2);
                          uint64_t v411 = qword_9DA00;
                          if (byte_9DA50) {
                            char v412 = 31;
                          }
                          else {
                            char v412 = 32;
                          }
                          *(unsigned char *)qword_9DA00 = v412;
                          qword_9DA00 = v411 + 1;
                        }
                        bwd_add_seg(64);
                        unsigned __int8 v413 = *(unsigned char *)qword_9DA38;
                        char v414 = (unsigned __int8 *)qword_9DA00;
                        while (1)
                        {
                          *char v414 = v413;
                          qword_9DA00 = (uint64_t)++v414;
                          v840 = (unsigned __int8 *)qword_9DA38;
                          uint64_t v415 = (unsigned __int8 *)(qword_9DA38 + 1);
                          int v416 = *(unsigned __int8 *)(qword_9DA38 + 1);
                          if (!*(unsigned char *)(qword_9DA38 + 1)
                            || !memchr("#123456789", *(unsigned __int8 *)(qword_9DA38 + 1), 0xBuLL))
                          {
                            char v417 = pBwdLangGlb;
                            if (!no_exception(1, *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pBwdLangGlb), v415)&& (v416 != 36 || *v840 != 35 || v840[2] != 35)&& (v416 != stru_B8.segname[(void)pLangGlb + 1]&& v416 != stru_B8.segname[(void)pLangGlb + 2]|| !v840[2]|| !memchr("#123456789", v840[2], 0xBuLL)))
                            {
                              break;
                            }
                          }
                          qword_9DA38 = (uint64_t)v415;
                          unsigned __int8 v413 = *v415;
                        }
                        unsigned int v33 = (void *)a2;
                        int k = (unsigned char **)&unk_9D000;
                        char v34 = &unk_9D000;
                        int v36 = (void *)&unk_9D000;
                        char v35 = (void *)&unk_9D000;
                        if (!*(unsigned char *)(qword_9DA20 + 1)
                          || !memchr("#123456789", *(unsigned __int8 *)(qword_9DA20 + 1), 0xBuLL)
                          || !no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)v417), v840)|| !no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v417 + 8], v840 - 1))
                        {
                          goto LABEL_92;
                        }
                        qword_9DA00 = (uint64_t)(v414 - 2);
                        qword_9DA38 = (uint64_t)(v840 - 1);
                        bwd_add_seg(0x4000000);
                        uint64_t v460 = qword_9DA00;
                        *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
                        qword_9DA00 = v460 + 1;
                        ++qword_9DA38;
                        uint64_t v40 = 0x1000000;
                        goto LABEL_88;
                      }
                      BOOL v418 = v48 != 9 || v361 == 2;
                      int v419 = !v418;
                      if (!v418 && (lFlags & 0x40000000) == 0)
                      {
                        uint64_t v420 = v168;
                        int v421 = "$k ";
                        do
                        {
                          do
                            int v422 = *v420++;
                          while (v422 == 173 || v422 == 30);
                          if (v422 != *v421) {
                            goto LABEL_1033;
                          }
                          ++v421;
                        }
                        while (v421 != "");
                        bwd_add_seg(32);
                        char v34 = &unk_9D000;
                        uint64_t v424 = qword_9DA00;
                        *(unsigned char *)qword_9DA00 = 61;
                        uint64_t v393 = v424 + 1;
                        goto LABEL_947;
                      }
LABEL_1033:
                      int v425 = *v168;
                      BOOL v841 = pLangGlb;
                      if (v425 != stru_B8.segname[(void)pLangGlb + 3]
                        || v152 && *(unsigned char *)qword_9DA20 && (*(unsigned char *)qword_9DA20 & 0xDFu) - 91 > 0xFFFFFFE5
                        || !no_exception(1, *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pBwdLangGlb), v168 + 1))
                      {
                        if (v48 == 7)
                        {
                          int v426 = v168;
                          BOOL v427 = "\"!(";
                          while (1)
                          {
                            do
                              int v428 = *v426++;
                            while (v428 == 173 || v428 == 30);
                            if (v428 != *(unsigned __int8 *)v427) {
                              break;
                            }
                            if (++v427 == "") {
                              goto LABEL_1055;
                            }
                          }
                        }
                        if (v419)
                        {
                          v430 = v168;
                          v431 = "$k";
                          while (1)
                          {
                            do
                              int v432 = *v430++;
                            while (v432 == 173 || v432 == 30);
                            if (v432 != *(unsigned __int8 *)v431) {
                              break;
                            }
                            if (++v431 == "") {
                              goto LABEL_1055;
                            }
                          }
                        }
                        if (v48 == 7 && v343 == 0x2000)
                        {
                          uint64_t v451 = qword_9DA00;
                          if (qword_9DA00 - qword_9DA20 >= 3)
                          {
                            int v452 = v168;
                            int v453 = "!,*nc";
                            while (1)
                            {
                              do
                                int v454 = *v452++;
                              while (v454 == 173 || v454 == 30);
                              if (v454 != *(unsigned __int8 *)v453) {
                                break;
                              }
                              if (++v453 == "") {
                                goto LABEL_1162;
                              }
                            }
                            char v462 = v168;
                            v463 = "!,*";
                            do
                            {
                              do
                                int v464 = *v462++;
                              while (v464 == 173 || v464 == 30);
                              if (v464 != *v463) {
                                goto LABEL_1163;
                              }
                              ++v463;
                            }
                            while (v463 != "");
                            if (v168[3] <= 0x20u)
                            {
LABEL_1162:
                              *(_WORD *)qword_9DA00 = 26916;
                              *(unsigned char *)(v451 + 2) = 110;
                              uint64_t v393 = v451 + 3;
LABEL_946:
                              char v34 = &unk_9D000;
LABEL_947:
                              qword_9DA00 = v393;
                              int k = (unsigned char **)&unk_9D000;
                              uint64_t v372 = qword_9DA38 + 2;
                              goto LABEL_948;
                            }
                          }
                        }
LABEL_1163:
                        if (v48 == 7 && v343 == 0x2000) {
                          char v467 = v128;
                        }
                        else {
                          char v467 = 1;
                        }
                        if ((v467 & 1) == 0 && !v129)
                        {
                          v468 = v168;
                          BOOL v469 = "'s";
                          do
                          {
                            do
                              int v470 = *v468++;
                            while (v470 == 173 || v470 == 30);
                            if (v470 != *v469)
                            {
                              char v472 = v168;
                              unsigned int v473 = "'n";
                              while (1)
                              {
                                do
                                  int v474 = *v472++;
                                while (v474 == 173 || v474 == 30);
                                if (v474 != *(unsigned __int8 *)v473) {
                                  goto LABEL_1190;
                                }
                                if (++v473 == "") {
                                  goto LABEL_1186;
                                }
                              }
                            }
                            ++v469;
                          }
                          while (v469 != "");
LABEL_1186:
                          if (v168[2] < 0x21u
                            || (uint64_t v476 = pBwdLangGlb,
                                no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v168 + 2))|| no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v476 + 8], v168 + 2))
                          {
                            bwd_add_seg(32);
                            int k = (unsigned char **)&unk_9D000;
                            char v34 = &unk_9D000;
                            uint64_t v477 = qword_9DA00;
                            *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38++;
                            *(unsigned char *)(v477 + 1) = *(unsigned char *)qword_9DA38;
                            uint64_t v341 = (unsigned char *)(v477 + 2);
                            goto LABEL_831;
                          }
                        }
LABEL_1190:
                        BOOL v478 = v48 == 9 && v361 == 3;
                        int v479 = v478;
                        if (v478)
                        {
                          v480 = v168;
                          v481 = "!*";
                          do
                          {
                            do
                              int v482 = *v480++;
                            while (v482 == 173 || v482 == 30);
                            if (v482 != *v481) {
                              goto LABEL_1206;
                            }
                            ++v481;
                          }
                          while (v481 != "");
                          bwd_add_seg(32);
                          char v34 = &unk_9D000;
                          char v370 = (char *)qword_9DA00;
                          char v371 = 42;
LABEL_903:
                          *char v370 = v371;
                          qword_9DA00 = (uint64_t)(v370 + 1);
                          int k = (unsigned char **)&unk_9D000;
                          uint64_t v372 = qword_9DA38 + 1;
LABEL_948:
                          qword_9DA38 = v372;
                          goto LABEL_348;
                        }
LABEL_1206:
                        if (v48 == 9)
                        {
                          v484 = v168;
                          v485 = "****";
                          do
                          {
                            do
                              int v486 = *v484++;
                            while (v486 == 173 || v486 == 30);
                            if (v486 != *v485) {
                              goto LABEL_1217;
                            }
                            ++v485;
                          }
                          while (v485 != "");
                          bwd_add_seg(0x2000);
                          uint64_t v488 = qword_9DA00 + 1;
                          do
                          {
                            *(unsigned char *)(v488 - 1) = 42;
                            uint64_t v489 = qword_9DA38++;
                            ++v488;
                          }
                          while (*(unsigned char *)(v489 + 2) == 42);
                          *(unsigned char *)(v488 - 1) = 42;
                          char v34 = &unk_9D000;
                          qword_9DA00 = v488;
LABEL_279:
                          bwd_add_seg(0);
                          goto LABEL_405;
                        }
LABEL_1217:
                        if (v48 == 7)
                        {
                          uint64_t v490 = v168;
                          v491 = "'*";
                          while (1)
                          {
                            do
                              int v492 = *v490++;
                            while (v492 == 173 || v492 == 30);
                            if (v492 != *(unsigned __int8 *)v491) {
                              break;
                            }
                            if (++v491 == "")
                            {
                              bwd_add_seg(32);
                              v494 = (unsigned char *)qword_9DA00;
                              do
                              {
                                *v494++ = 42;
                                uint64_t v495 = qword_9DA38++;
                              }
                              while (*(unsigned char *)(v495 + 2) == 42);
                              char v34 = &unk_9D000;
                              qword_9DA00 = (uint64_t)v494;
                              goto LABEL_405;
                            }
                          }
                          if (no_exception(1, byte_4BA94, v168))
                          {
                            bwd_add_seg(4);
                            int k = (unsigned char **)&unk_9D000;
                            char v34 = &unk_9D000;
                            uint64_t v496 = qword_9DA00;
                            *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38++;
                            *(unsigned char *)(v496 + 1) = *(unsigned char *)qword_9DA38;
                            qword_9DA00 = v496 + 2;
                            byte_9D9EC = 0;
                            byte_9DAA4 = 0;
                            byte_9DBAC = 0;
                            goto LABEL_348;
                          }
                        }
                        if (v152 && no_exception(1, "\t<|\x01<| \x01", v168))
                        {
                          bwd_add_seg(4);
                          int k = (unsigned char **)&unk_9D000;
                          ++qword_9DA38;
                          char v34 = &unk_9D000;
                          uint64_t v497 = qword_9DA00;
                          *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
                          qword_9DA00 = v497 + 1;
                          unsigned int v33 = (void *)a2;
                          int v36 = (void *)&unk_9D000;
                          char v35 = (void *)&unk_9D000;
                          if (*(unsigned char *)(qword_9DA38 + 1) != 117) {
                            goto LABEL_92;
                          }
                          unsigned int v498 = *(unsigned __int8 *)(qword_9DA38 + 2);
                          if (v498 >= 0x41 && (v498 != 115 || *(unsigned __int8 *)(qword_9DA38 + 3) > 0x40u)) {
                            goto LABEL_92;
                          }
                          bwd_add_seg(0x2000);
                          ++qword_9DA38;
                          int v45 = (char *)qword_9DA00;
                          char v46 = 85;
LABEL_102:
                          *int v45 = v46;
                          uint64_t v47 = v45 + 1;
                          goto LABEL_103;
                        }
                        if (v479)
                        {
                          if (v425 == *(unsigned __int8 *)v841[11]
                            && no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v168 + 1))
                          {
                            bwd_add_seg(0);
                            int k = (unsigned char **)&unk_9D000;
                            ++qword_9DA38;
                            bwd_add_seg(0x1000000);
                            goto LABEL_809;
                          }
                          if (no_exception(1, "\t$[)-m\x01", v168)) {
                            goto LABEL_1247;
                          }
                        }
                        else if (v48 != 9)
                        {
                          goto LABEL_1248;
                        }
                        if (no_exception(1, "\t\x7F[|l/\x7F\x01\"&\x01", v168))
                        {
LABEL_1247:
                          uint64_t v347 = 4;
                          goto LABEL_842;
                        }
LABEL_1248:
                        unsigned int v33 = (void *)a2;
                        int k = (unsigned char **)&unk_9D000;
                        char v34 = (void *)&unk_9D000;
                        int v36 = (void *)&unk_9D000;
                        char v35 = (void *)&unk_9D000;
                        if (!bwd_no_abbrev((uint64_t)v841[7]) || !bwd_no_locution()) {
                          goto LABEL_92;
                        }
                        uint64_t v40 = 0x2000;
                        goto LABEL_88;
                      }
LABEL_1055:
                      if ((v343 & 0xC0) != 0
                        && (lFlags & 0x8000000) == 0
                        && (v48 != 9 || v361 != 1 || v168[1] != 47)
                        && (!v152 || v168[1] != 124))
                      {
                        bwd_add_seg(2);
                        uint64_t v434 = qword_9DA00;
                        if (byte_9DA50) {
                          char v435 = 31;
                        }
                        else {
                          char v435 = 32;
                        }
                        *(unsigned char *)qword_9DA00 = v435;
                        qword_9DA00 = v434 + 1;
                      }
                      bwd_add_seg(4);
                      uint64_t v436 = qword_9DA00;
                      *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38++;
                      *(unsigned char *)(v436 + 1) = *(unsigned char *)qword_9DA38;
                      qword_9DA00 = v436 + 2;
                      if (nLangIDGlb == 12)
                      {
                        if (*(unsigned char *)qword_9DA38 == 124)
                        {
                          int v437 = (unsigned char *)(qword_9DA38 + 1);
                          if (*(unsigned __int8 *)(qword_9DA38 + 1) - 49 <= 2
                            && (!*(unsigned char *)(qword_9DA38 + 2)
                             || !memchr("#123456789", *(unsigned __int8 *)(qword_9DA38 + 2), 0xBuLL)))
                          {
                            goto LABEL_1070;
                          }
                        }
                      }
                      else if (nLangIDGlb == 7 && *(unsigned char *)qword_9DA38 == 33)
                      {
                        int v437 = (unsigned char *)(qword_9DA38 + 1);
LABEL_1070:
                        qword_9DA38 = (uint64_t)v437;
                        *(unsigned char *)(v436 + 2) = *v437;
                        qword_9DA00 = v436 + 3;
                      }
                      int k = (unsigned char **)&unk_9D000;
                      char v457 = (unsigned char *)qword_9DA38;
                      unsigned int v33 = (void *)a2;
                      char v34 = (void *)&unk_9D000;
                      int v36 = (void *)&unk_9D000;
                      char v35 = (void *)&unk_9D000;
                      if (!bwd_is_number((unsigned char *)(qword_9DA38 + 1))
                        || (lFlags & 0x8000000) != 0
                        || nLangIDGlb == 9 && nSubLangIDGlb == 1 && *v457 == 47)
                      {
                        goto LABEL_92;
                      }
LABEL_116:
                      bwd_add_seg(2);
                      unsigned int v41 = (unsigned char *)v34[320];
                      if (byte_9DA50) {
                        LOBYTE(v38) = 31;
                      }
                      else {
                        LOBYTE(v38) = 32;
                      }
                      goto LABEL_91;
                    }
                  }
                  v398 = pBwdLangGlb;
                  if (no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)pBwdLangGlb + 8], v168))
                  {
                    bwd_add_seg(0x4000000);
                    uint64_t v399 = qword_9DA00;
                    uint64_t v400 = qword_9DA00;
                    *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
                    char v401 = (unsigned char *)(v400 + 1);
                    qword_9DA00 = (uint64_t)v401;
                    unsigned int v402 = (unsigned __int8 *)qword_9DA38;
                    uint64_t v403 = qword_9DA38 + 1;
                    if (*(unsigned char *)(qword_9DA38 + 1) == 30)
                    {
                      ++qword_9DA38;
                      qword_9D9F8 = 1;
                      unsigned int v402 = (unsigned __int8 *)v403;
                    }
                    if (nLangIDGlb == 7)
                    {
                      char v404 = v402;
                      uint64_t v405 = "'<=";
                      while (1)
                      {
                        do
                          int v406 = *v404++;
                        while (v406 == 173 || v406 == 30);
                        if (v406 != *(unsigned __int8 *)v405) {
                          break;
                        }
                        if (++v405 == "")
                        {
                          qword_9DA38 = (uint64_t)++v402;
                          goto LABEL_985;
                        }
                      }
                    }
                    if (nLangIDGlb == 9
                      && nSubLangIDGlb == 3
                      && *v402 == 39
                      && no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), v402 + 1)&& v402[2] >= 0x21u)
                    {
                      qword_9DA38 = (uint64_t)(v402 + 1);
                      *(unsigned char *)(v399 + 1) = v402[1];
                      char v401 = (unsigned char *)(v399 + 2);
                      qword_9DA00 = v399 + 2;
                      unsigned int v402 = (unsigned __int8 *)qword_9DA38;
                    }
LABEL_985:
                    unsigned int v33 = (void *)a2;
                    int k = (unsigned char **)&unk_9D000;
                    char v34 = &unk_9D000;
                    int v36 = (void *)&unk_9D000;
                    char v35 = (void *)&unk_9D000;
                    if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), v402))
                    {
                      unsigned int v409 = v402[1];
                      v408 = v402 + 1;
                      if (v409 >= 0x21)
                      {
                        qword_9DA38 = (uint64_t)v408;
                        *char v401 = *v408;
                        qword_9DA00 = (uint64_t)(v401 + 1);
                      }
                    }
                    goto LABEL_92;
                  }
                  if ((v343 & 0xC0) != 0) {
                    char v410 = 0;
                  }
                  else {
                    char v410 = v394;
                  }
                  if ((v410 & 1) == 0
                    && !in(v168[1], 9)
                    && no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)v398), v168))
                  {
LABEL_807:
                    uint64_t v330 = 0x1000000;
LABEL_808:
                    bwd_add_seg(v330);
                    int k = (unsigned char **)&unk_9D000;
LABEL_809:
                    char v214 = *(unsigned char *)qword_9DA38;
                    char v34 = &unk_9D000;
                    goto LABEL_810;
                  }
                  goto LABEL_993;
                }
                if ((v343 & 0x20C0) != 0)
                {
                  if (no_exception(1, "\t[.,][.'$\"<>\x7F\x01'[.,\x01", v168))
                  {
LABEL_873:
                    if (*v168 == 39)
                    {
                      bwd_add_seg(0);
                      ++qword_9DA38;
                    }
                  }
                  else
                  {
                    unsigned int v354 = *(v168 - 1);
                    if (v354 > 0x3D || ((1 << v354) & 0x2000420000000000) == 0 || *v168 != 46) {
                      goto LABEL_866;
                    }
                  }
                  bwd_add_seg(0x1000000);
                  int k = (unsigned char **)&unk_9D000;
                  char v359 = *(unsigned char *)qword_9DA38;
                  uint64_t v349 = (unsigned char *)qword_9DA00;
                  while (1)
                  {
                    *v349++ = v359;
                    BOOL v360 = (char *)(qword_9DA38 + 1);
                    if ((*(unsigned __int8 *)(qword_9DA38 + 1) | 2) != 0x2E) {
                      break;
                    }
                    ++qword_9DA38;
                    char v359 = *v360;
                  }
                  char v34 = &unk_9D000;
                  goto LABEL_929;
                }
LABEL_866:
                v355 = v168;
                unint64_t v356 = "..";
                while (1)
                {
                  do
                    int v357 = *v355++;
                  while (v357 == 173 || v357 == 30);
                  if (v357 != *(unsigned __int8 *)v356) {
                    goto LABEL_878;
                  }
                  if (++v356 == "") {
                    goto LABEL_873;
                  }
                }
              }
              v168 = (unsigned __int8 *)qword_9DA38;
              int v311 = *(unsigned __int8 *)qword_9DA38;
            }
            if (v311 == 33)
            {
              v315 = v168 + 1;
              int v316 = v168[1];
              if (v316 == 46 || v316 == 127)
              {
LABEL_775:
                v320 = v168 + 1;
                unsigned int v33 = (void *)a2;
                int k = (unsigned char **)&unk_9D000;
                char v34 = (void *)&unk_9D000;
                int v36 = (void *)&unk_9D000;
                char v35 = (void *)&unk_9D000;
                do
                {
                  qword_9DA38 = (uint64_t)v320;
                  int v321 = *v320++;
                }
                while (v321 == 33);
                goto LABEL_92;
              }
              int v317 = "!\x7F";
              while (1)
              {
                do
                  int v318 = *v315++;
                while (v318 == 173 || v318 == 30);
                if (v318 != *(unsigned __int8 *)v317) {
                  break;
                }
                if (++v317 == "") {
                  goto LABEL_775;
                }
              }
            }
            else if (v311 == 39 && v168[1] == 127)
            {
              BOOL v312 = v168[2] == 127;
              byte_9DBAC = v168[2] != 127;
              byte_9DBA8 = v312;
              uint64_t v313 = (uint64_t)(v168 + 1);
              unsigned int v33 = (void *)a2;
              int k = (unsigned char **)&unk_9D000;
              char v34 = (void *)&unk_9D000;
              int v36 = (void *)&unk_9D000;
              char v35 = (void *)&unk_9D000;
              do
              {
                qword_9DA38 = v313;
                int v314 = *(unsigned __int8 *)++v313;
              }
              while (v314 == 127);
              goto LABEL_92;
            }
            goto LABEL_778;
          }
        }
        while (*++v277);
LABEL_732:
        bwd_add_seg(2048);
        uint64_t v299 = qword_9DA00;
        uint64_t v300 = qword_9DA00;
        *(unsigned char *)qword_9DA00 = *(unsigned char *)qword_9DA38;
        v224 = (unsigned __int8 *)(v300 + 1);
        qword_9DA00 = (uint64_t)v224;
        if ((int)strlen(*(const char **)((char *)&stru_68.offset + (void)pLangGlb)) >= 2)
        {
          uint64_t v301 = 1;
          do
            *(unsigned char *)(v299 + v301++) = *(unsigned char *)++qword_9DA38;
          while (v301 < (int)strlen(*(const char **)((char *)&stru_68.offset + (void)pLangGlb)));
          v224 = (unsigned __int8 *)(v299 + v301);
LABEL_736:
          qword_9DA00 = (uint64_t)v224;
        }
        v302 = (unsigned __int8 *)(qword_9DA38 + 1);
        unsigned int v303 = *(unsigned __int8 *)(qword_9DA38 + 1);
        BOOL v304 = v303 > 0x20 || ((1 << v303) & 0x100000201) == 0;
        if (v304 && v303 != 160)
        {
          ++qword_9DA38;
          uint64_t v305 = *(unsigned __int8 **)&stru_B8.segname[(void)pLangGlb - 8];
          v306 = v302;
          do
          {
            do
              int v307 = *v306++;
            while (v307 == 173 || v307 == 30);
            if (v307 != *v305)
            {
              *v224++ = *v302;
              goto LABEL_736;
            }
          }
          while (*++v305);
          unsigned __int8 *v224 = *v302;
          qword_9DA00 = (uint64_t)(v224 + 1);
          if ((int)strlen(*(const char **)&stru_B8.segname[(void)pLangGlb - 8]) < 2) {
            goto LABEL_1298;
          }
          uint64_t v310 = 1;
          do
            v224[v310++] = *(unsigned char *)++qword_9DA38;
          while (v310 < (int)strlen(*(const char **)&stru_B8.segname[(void)pLangGlb - 8]));
LABEL_1296:
          uint64_t v283 = (char *)&v224[v310];
          goto LABEL_1297;
        }
LABEL_1298:
        bwd_add_rightchars();
LABEL_1299:
        unsigned int v33 = (void *)a2;
        int k = (unsigned char **)&unk_9D000;
LABEL_1300:
        char v34 = (void *)&unk_9D000;
LABEL_669:
        int v36 = (void *)&unk_9D000;
LABEL_670:
        char v35 = (void *)&unk_9D000;
LABEL_92:
        unsigned int v39 = k[327] + 1;
        k[327] = v39;
        int v38 = *v39;
        if (*v39) {
          continue;
        }
LABEL_1310:
        bwd_add_seg(0);
        v36[319] = 0;
        v34[320] = v33;
        bwd_char(0);
        HIBYTE(word_9DAA6) = 0;
        qword_9DA28 = 0;
        uint64_t v520 = qword_9DA48;
        v35[326] = qword_9DA48;
        if (!v520)
        {
          char v813 = a4;
          uint64_t v812 = v839;
          goto LABEL_2059;
        }
        v521 = off_95000;
        v522 = &unk_9D000;
        while (2)
        {
          BOOL v523 = *(char **)v520;
          v522[324] = *(void *)v520;
          uint64_t v524 = *(void *)(v520 + 16);
          v36[319] = v524;
          uint64_t v525 = *(void *)(v520 + 48);
          if (v525) {
            uint64_t v526 = *(void *)(v525 + 24);
          }
          else {
            uint64_t v526 = 0;
          }
          qword_9DA98 = v526;
          uint64_t v527 = *(void *)(v520 + 24);
          if (v527 > 127)
          {
            if (v527 > 0xFFFFFF)
            {
              if (v527 == 0x1000000 || v527 == 0x2000000 || v527 == 0x4000000)
              {
LABEL_1334:
                if (bwd_fetch_char((char *)&v849, v523, v527 == 0x4000000, 0))
                {
                  if (v849 != 34)
                  {
                    if (v849 == 63)
                    {
                      v522 = (void *)&unk_9D000;
                      if (v527 == 0x1000000 || nLangIDGlb != 9 || nSubLangIDGlb == 3) {
                        uint64_t v652 = 63;
                      }
                      else {
                        uint64_t v652 = 34;
                      }
                    }
                    else
                    {
                      v522 = (void *)&unk_9D000;
                      if (v849 == 133)
                      {
                        char v534 = 46;
                        for (uint64_t m = 1; m != 4; ++m)
                        {
                          bwd_char(v534);
                          char v534 = asc_2472B[m];
                        }
                        goto LABEL_2050;
                      }
                      uint64_t v652 = (char)v849;
                    }
                    bwd_char(v652);
                    goto LABEL_2050;
                  }
                  if (nLangIDGlb == 9
                    && nSubLangIDGlb == 3
                    && *v523 == 40
                    && (!v525 || v527 == 0x1000000 || *(void *)(v525 + 24) <= 2uLL))
                  {
                    uint64_t v544 = 63;
                  }
                  else
                  {
                    uint64_t v544 = 34;
                  }
LABEL_1607:
                  bwd_char(v544);
                }
                else
                {
                  char v547 = *v523;
                  int v546 = (unsigned __int8 *)(v523 + 1);
                  char v545 = v547;
                  do
                  {
                    bwd_char(v545);
                    int v548 = *v546++;
                    char v545 = v548;
                  }
                  while (v548);
                }
LABEL_1608:
                v522 = (void *)&unk_9D000;
                goto LABEL_2050;
              }
LABEL_1361:
              if (v524 >= 1)
              {
                v36[319] = 0;
                bwd_char(30);
                uint64_t v520 = v35[326];
                uint64_t v527 = *(void *)(v520 + 24);
              }
              dword_9DAA0 = (v527 >> 20) & 1;
              dword_9D9F0 = (v527 >> 10) & 1;
              if ((v527 >> 20)) {
                byte_9DA90 = 0;
              }
              else {
                dword_9DAA0 = byte_9DA90 == 1;
              }
              BOOL v653 = 0;
              unsigned __int8 v654 = *(unsigned __int8 **)v520;
              qword_9DA20 = v34[320];
              while (1)
              {
                unsigned int v655 = *v654;
                if (v653)
                {
                  if (*v654)
                  {
                    if (v655 > 0xDE || (v655 - 123) >= 0xE6u)
                    {
                      LOBYTE(v655) = v655 & 0xDF;
                    }
                    else if (v655 == 124)
                    {
                      LOBYTE(v655) = -9;
                    }
                  }
                  bwd_char((char)v655);
                  BOOL v653 = *v654 != *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb);
                }
                else
                {
                  uint64_t v656 = v521[133];
                  if (v655 == **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)v656))
                  {
                    int v657 = nLangIDGlb;
                    if (nLangIDGlb == 7)
                    {
                      if (v654 == *(unsigned __int8 **)v35[326] || memchr("cqxy~", (char)v654[1], 6uLL))
                      {
LABEL_1632:
                        int v657 = nLangIDGlb;
LABEL_1633:
                        BOOL v653 = v657 == 12;
LABEL_1640:
                        byte_9DAA5 = v655;
                        LOBYTE(word_9DAA6) = v654[1];
                        if (v654[1])
                        {
                          --*(void *)(v35[326] + 8);
                          ++v654;
                        }
                        while (v657 == 12 || v657 == 9)
                        {
                          v660 = v521[133];
                          if (byte_9DAA5 != **(unsigned char **)((char *)&stru_20.maxprot + (void)v660)) {
                            break;
                          }
                          int v661 = *v654;
                          if (v661 != **(unsigned __int8 **)((char *)&stru_20.filesize + (void)v660) || !v654[1]) {
                            break;
                          }
                          bwd_char((char)v661);
                          int v657 = nLangIDGlb;
                          ++v654;
                        }
                        if (!bwd_fetch_char((char *)&v849, &byte_9DAA5, 0, 1))
                        {
                          unsigned int v662 = *v654;
                          unsigned __int8 v849 = *v654;
                          int v36 = (void *)&unk_9D000;
                          v522 = &unk_9D000;
                          goto LABEL_1655;
                        }
                        unsigned int v662 = v849;
                        v522 = (void *)&unk_9D000;
                        if (v657 == 7)
                        {
                          int v36 = (void *)&unk_9D000;
                          if (v849 == 36)
                          {
                            if (v654[1] && (v654[1] & 0xDFu) - 91 >= 0xFFFFFFE6)
                            {
                              unsigned int v662 = 154;
                              unsigned __int8 v849 = -102;
                            }
                            else
                            {
                              unsigned int v662 = 36;
                            }
                            goto LABEL_1656;
                          }
LABEL_1655:
                          if (v662)
                          {
LABEL_1656:
                            if (v662 > 0xDE || (v662 - 123) >= 0xE6u) {
                              LOBYTE(v662) = v662 & 0xDF;
                            }
                          }
                        }
                        else
                        {
                          int v36 = (void *)&unk_9D000;
                          if (v849) {
                            goto LABEL_1656;
                          }
                        }
                        bwd_char((char)v662);
                        goto LABEL_1660;
                      }
                    }
                    else
                    {
                      if (nLangIDGlb != 12 && nLangIDGlb != 9) {
                        goto LABEL_1633;
                      }
                      if (v654 == *(unsigned __int8 **)v35[326]
                        || *(v654 - 1) == *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb))
                      {
                        goto LABEL_1632;
                      }
                    }
                  }
                  int v657 = nLangIDGlb;
                  if (v655 == **(unsigned __int8 **)((char *)&stru_20.nsects + (void)v656) && nLangIDGlb != 12)
                  {
                    BOOL v653 = 0;
                    goto LABEL_1640;
                  }
                  bwd_char((char)v655);
                  BOOL v653 = 0;
                  int v36 = (void *)&unk_9D000;
                }
                v522 = (void *)&unk_9D000;
LABEL_1660:
                int v663 = *++v654;
                v664 = &unk_9D000;
                char v665 = (unsigned __int8 *)v847;
                if (!v663)
                {
                  *(unsigned char *)v34[320] = 0;
                  v666 = (char *)v522[324];
                  unsigned __int8 v843 = *(v666 - 1);
                  unsigned __int8 v849 = v843;
                  *(v666 - 1) = 0;
                  uint64_t v667 = v35[326];
                  uint64_t v668 = *(void *)(v667 + 8);
                  if (v668 >= 1)
                  {
                    int v669 = (unsigned __int8 *)(v666 - 1);
                    int v670 = 1;
                    do
                    {
                      seg_index[v669[v668]] = v670;
                      seg_start[v669[v668]] = &v669[v668];
                      ++v670;
                      --v668;
                    }
                    while (v668);
                  }
                  if ((*(int *)((unsigned char *)&dword_8 + (void)pBwdLangGlb) & 0x80000000) == 0)
                  {
                    uint64_t v671 = 0;
                    uint64_t v672 = *pBwdLangGlb;
                    int v673 = off_95000;
                    while (1)
                    {
                      uint64_t v674 = v672[2];
                      uint64_t v675 = **v672;
                      uint64_t v676 = (int)seg_index[v675];
                      if ((uint64_t)v674 > v676
                        || !seg_index[(*v672)[(void)v674 - 1]]
                        || (*(_DWORD *)(v667 + 32) & v672[7] & 0x9000FFFF) != 0)
                      {
                        goto LABEL_1727;
                      }
                      int v677 = (unsigned __int8 *)seg_start[v675];
                      v664[327] = v677;
                      unsigned int v678 = *v672;
LABEL_1674:
                      char v665 = (unsigned __int8 *)v676;
                      while (1)
                      {
                        uint64_t v679 = 1;
                        while (1)
                        {
                          int v680 = v678[v679];
                          if (!v678[v679]) {
                            break;
                          }
                          int v681 = v677[v679++];
                          if (v681 != v680) {
                            goto LABEL_1721;
                          }
                        }
                        v848 = v665;
                        int v682 = &v677[v679];
                        if (v677 == (unsigned __int8 *)qword_9DA20) {
                          break;
                        }
                        int v683 = (char)*(v677 - 1);
                        if (v683 == 32) {
                          break;
                        }
                        int v685 = *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb);
                        if (v685 == v683
                          && !strchr(v678, v683)
                          && no_exception(1, byte_2AFC0, v677))
                        {
                          break;
                        }
                        int v686 = *v682;
                        if ((v686 | 0x20) == 0x20 || v686 == v685 && !strchr(v678, (char)v685))
                        {
                          if ((*((unsigned char *)v672 + 50) & 1) == 0) {
                            goto LABEL_1718;
                          }
                          int v687 = no_exception(0, (unsigned __int8 *)v672[4], v677 - 1);
                          unsigned int v33 = (void *)a2;
                        }
                        else
                        {
                          if ((*((unsigned char *)v672 + 49) & 0x80) == 0)
                          {
LABEL_1718:
                            unsigned int v33 = (void *)a2;
LABEL_1719:
                            v664 = &unk_9D000;
                            char v665 = v848;
                            char v35 = &unk_9D000;
                            goto LABEL_1720;
                          }
                          unsigned int v33 = (void *)a2;
                          if (!no_exception(1, (unsigned __int8 *)v672[5], (unsigned __int8 *)&v674[(void)v677]))goto LABEL_1719; {
                          int v687 = no_exception(0, (unsigned __int8 *)v672[4], v677 - 1);
                          }
                        }
                        char v35 = (void *)&unk_9D000;
                        if (!v687) {
                          goto LABEL_1717;
                        }
LABEL_1695:
                        unsigned int v690 = *v678;
                        int v689 = (unsigned __int8 *)(v678 + 1);
                        uint64_t v688 = v690;
                        do
                        {
                          seg_index[v688] = 0;
                          unsigned int v691 = *v689++;
                          uint64_t v688 = v691;
                        }
                        while (v691);
                        int64_t v692 = (int64_t)v672[3];
                        uint64_t v693 = v692 - (void)v674;
                        if (v692 <= (uint64_t)v674)
                        {
                          v695 = v677;
                        }
                        else
                        {
                          uint64_t v694 = qword_9DA00;
                          v695 = v677;
                          if (qword_9DA08 - qword_9DA00 > v693)
                          {
                            *(void *)(v667 + 8) += v693;
                            qword_9DA00 = v694 + v693;
                            int v696 = &v677[v692];
                            size_t v697 = strlen((const char *)&v677[v679]);
                            memmove(v696, &v677[v679], v697 + 1);
                            v695 = (unsigned __int8 *)qword_9DA38;
                            int64_t v692 = (int64_t)v672[3];
                          }
                        }
                        memcpy(v695, v672[1], v692);
                        int v699 = (unsigned __int8 *)v672[2];
                        int v698 = v672[3];
                        v664 = &unk_9D000;
                        uint64_t v700 = qword_9DA38;
                        qword_9DA38 += (uint64_t)v698;
                        uint64_t v701 = (unsigned char *)qword_9DA38;
                        if ((unint64_t)v682 > qword_9DA38)
                        {
                          *(void *)(qword_9DA30 + 8) = &v698[v700 + *(void *)(qword_9DA30 + 8)]
                                                       - (char *)v677
                                                       - v679;
                          qword_9DA00 = &v701[qword_9DA00] - v677 - v679;
                          size_t v702 = strlen((const char *)&v677[v679]);
                          memmove(v701, &v677[v679], v702 + 1);
                          v664 = &unk_9D000;
                        }
                        uint64_t v667 = qword_9DA30;
                        uint64_t v703 = *(void *)(qword_9DA30 + 8);
                        if (v703 >= 1)
                        {
                          uint64_t v704 = qword_9DA20 - 1;
                          int v705 = 1;
                          do
                          {
                            seg_index[*(unsigned __int8 *)(v704 + v703)] = v705;
                            seg_start[*(unsigned __int8 *)(v704 + v703)] = v704 + v703;
                            ++v705;
                            --v703;
                          }
                          while (v703);
                        }
                        char v665 = (unsigned __int8 *)(v848 - v699);
                        uint64_t v674 = v672[2];
                        v521 = off_95000;
                        int v673 = off_95000;
                        if ((uint64_t)v674 > v848 - v699)
                        {
                          char v35 = (void *)&unk_9D000;
                          goto LABEL_1727;
                        }
                        unsigned int v678 = *v672;
                        char v35 = (void *)&unk_9D000;
                        if (!seg_index[v674[(void)*v672 - 1]]) {
                          goto LABEL_1727;
                        }
                        int v677 = (unsigned __int8 *)qword_9DA38;
                        if (*(unsigned __int8 *)qword_9DA38 != *v678) {
                          goto LABEL_1721;
                        }
                      }
                      int v684 = *v682;
                      unsigned int v33 = (void *)a2;
                      if ((v684 | 0x20) == 0x20
                        || *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb) == v684
                        && !strchr(v678, (char)v684))
                      {
                        break;
                      }
                      char v35 = (void *)&unk_9D000;
                      if ((*((unsigned char *)v672 + 49) & 0x40) != 0
                        && no_exception(1, (unsigned __int8 *)v672[5], (unsigned __int8 *)&v674[(void)v677]))
                      {
                        goto LABEL_1695;
                      }
LABEL_1717:
                      v664 = (void *)&unk_9D000;
                      char v665 = v848;
LABEL_1720:
                      v521 = off_95000;
LABEL_1721:
                      v706 = v677 + 1;
                      uint64_t v676 = (uint64_t)v665;
                      int v673 = off_95000;
                      while (2)
                      {
                        if (v676 > (uint64_t)v674)
                        {
                          --v676;
                          v664[327] = v706;
                          int v707 = *v706++;
                          unsigned int v678 = *v672;
                          if (v707 != **v672) {
                            continue;
                          }
                          int v677 = v706 - 1;
                          goto LABEL_1674;
                        }
                        break;
                      }
                      if ((uint64_t)v665 >= (uint64_t)v674) {
                        char v665 = (unsigned __int8 *)v674;
                      }
LABEL_1727:
                      v672 += 8;
                      BOOL v31 = v671++ < *(int *)((char *)&dword_8 + (void)v673[135]);
                      if (!v31)
                      {
                        v522 = &unk_9D000;
                        v666 = (char *)qword_9DA20;
                        char v34 = &unk_9D000;
                        int v36 = (void *)&unk_9D000;
                        goto LABEL_1730;
                      }
                    }
                    char v35 = (void *)&unk_9D000;
                    if ((*((unsigned char *)v672 + 49) & 0x20) == 0) {
                      goto LABEL_1717;
                    }
                    goto LABEL_1695;
                  }
LABEL_1730:
                  uint64_t v847 = (uint64_t)v665;
                  *(v666 - 1) = v843;
                  uint64_t v708 = *v666;
                  uint64_t v709 = 1;
                  do
                  {
                    seg_index[v708] = 0;
                    uint64_t v708 = v666[v709++];
                  }
                  while (v708);
                  LOBYTE(word_9DAA6) = 0;
                  while (2)
                  {
                    uint64_t v710 = v521[133];
                    v711 = *(const char **)&stru_68.segname[(void)v710 - 8];
                    uint64_t v712 = v666;
                    uint64_t v713 = v711;
                    while (1)
                    {
                      do
                        int v714 = *v712++;
                      while (v714 == 173 || v714 == 30);
                      if (v714 != *(unsigned __int8 *)v713) {
                        break;
                      }
                      if (!*(unsigned __int8 *)++v713)
                      {
LABEL_1748:
                        dword_9D9F0 = 1;
LABEL_1749:
                        size_t v722 = strlen(v711);
                        size_t v723 = strlen(v666) - v722 + 1;
                        uint64_t v724 = v666;
                        v725 = (unsigned __int8 *)&v666[v722];
                        v521 = off_95000;
                        goto LABEL_1750;
                      }
                    }
                    v711 = *(const char **)&stru_68.sectname[(void)v710];
                    uint64_t v717 = v666;
                    int v718 = v711;
                    while (1)
                    {
                      do
                        int v719 = *v717++;
                      while (v719 == 173 || v719 == 30);
                      if (v719 != *(unsigned __int8 *)v718) {
                        break;
                      }
                      if (!*(unsigned __int8 *)++v718) {
                        goto LABEL_1748;
                      }
                    }
                    v711 = *(const char **)&stru_68.segname[(void)v710];
                    v726 = v666;
                    uint64_t v727 = v711;
                    while (1)
                    {
                      do
                        int v728 = *v726++;
                      while (v728 == 173 || v728 == 30);
                      if (v728 != *(unsigned __int8 *)v727) {
                        break;
                      }
                      if (!*(unsigned __int8 *)++v727)
                      {
                        dword_9D9F0 = 0;
                        goto LABEL_1749;
                      }
                    }
                    if (nLangIDGlb == 7)
                    {
                      v731 = v666;
                      int v732 = "!$";
                      while (1)
                      {
                        do
                          int v733 = *v731++;
                        while (v733 == 173 || v733 == 30);
                        if (v733 != *(unsigned __int8 *)v732) {
                          break;
                        }
                        if (++v732 == "")
                        {
                          dword_9DAA0 = 1;
                          byte_9DA90 = 0;
LABEL_1786:
                          v736 = (unsigned __int8 *)(v666 + 2);
                          size_t v723 = strlen(v666) - 1;
                          goto LABEL_1787;
                        }
                      }
                    }
                    uint64_t v735 = *v666;
                    if (v735 == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)v710))
                    {
                      if (nLangIDGlb != 9
                        || nSubLangIDGlb == 3
                        || !equals_nocase((unsigned __int8 *)v666 - 1, "O'CLOCK"))
                      {
                        v736 = (unsigned __int8 *)(v666 + 1);
                        if (in(v666[1], 9))
                        {
                          dword_9DAA0 = 1;
                          byte_9DA90 = 0;
                          goto LABEL_1776;
                        }
                        v522[324] = v736;
LABEL_1751:
                        v666 = (char *)v522[324];
                        if (!*v666)
                        {
                          v34[320] = v666;
                          goto LABEL_2050;
                        }
                        continue;
                      }
LABEL_1814:
                      uint64_t v746 = (uint64_t)(v666 + 1);
LABEL_1815:
                      v522[324] = v746;
                      goto LABEL_1751;
                    }
                    break;
                  }
                  if (nLangIDGlb == 12)
                  {
                    uint64_t v737 = v666;
                    int v738 = ":$";
                    while (1)
                    {
                      do
                        int v739 = *v737++;
                      while (v739 == 173 || v739 == 30);
                      if (v739 != *(unsigned __int8 *)v738) {
                        break;
                      }
                      if (++v738 == "")
                      {
                        dword_9DAA0 = 1;
                        byte_9DA90 = 1;
                        goto LABEL_1786;
                      }
                    }
                  }
                  if (nLangIDGlb == 9)
                  {
                    int v741 = v666;
                    v742 = "**";
                    while (1)
                    {
                      do
                        int v743 = *v741++;
                      while (v743 == 173 || v743 == 30);
                      if (v743 != *(unsigned __int8 *)v742) {
                        break;
                      }
                      if (++v742 == "")
                      {
                        size_t v745 = strlen(v666);
                        memmove(v666, v666 + 1, v745);
                        uint64_t v746 = v522[324] + 1;
                        goto LABEL_1815;
                      }
                    }
                    if (dword_9D9F0)
                    {
                      if ((*(unsigned char *)(v35[326] + 25) & 4) != 0 && !strcmp(v666, ".s"))
                      {
                        dword_9D9F0 = 0;
                        v736 = (unsigned __int8 *)(v666 + 1);
LABEL_1776:
                        size_t v723 = strlen(v666);
LABEL_1787:
                        uint64_t v724 = v666;
                        v725 = v736;
LABEL_1750:
                        memmove(v724, v725, v723);
                        goto LABEL_1751;
                      }
                      BOOL v747 = 1;
                      goto LABEL_1806;
                    }
                    BOOL v747 = 0;
                  }
                  else
                  {
                    BOOL v747 = dword_9D9F0 != 0;
                  }
                  if (nLangIDGlb == 12 && v735 == 247)
                  {
                    char *v666 = 47;
                    v522[324] = v666 + 1;
                    goto LABEL_1751;
                  }
LABEL_1806:
                  if (v735 == 150 || v735 == 151 && (lFlags & 0x20000000) == 0)
                  {
                    char v748 = 45;
                    goto LABEL_1813;
                  }
                  if (in(v735, 41))
                  {
                    byte_9DAA5 = v735;
                    if (!bwd_fetch_char((char *)&v849, &byte_9DAA5, 0, 0)) {
                      goto LABEL_1814;
                    }
                    char v748 = v849;
                    goto LABEL_1813;
                  }
                  if (dword_9DAA0) {
                    int v749 = 1;
                  }
                  else {
                    int v749 = v747;
                  }
                  if (v749 != 1)
                  {
                    switch(v735)
                    {
                      case 0:
                        goto LABEL_1814;
                      case 0x8C:
                        char v748 = -100;
                        break;
                      case 0x8A:
                        char v748 = -102;
                        break;
                      default:
                        if ((v735 + 33) <= 0xE0u && (v735 - 91) < 0xE6u) {
                          goto LABEL_1814;
                        }
                        char v748 = v735 | 0x20;
                        break;
                    }
LABEL_1813:
                    char *v666 = v748;
                    goto LABEL_1814;
                  }
                  if (v735)
                  {
                    if (v735 == 154)
                    {
                      char v750 = -118;
                      goto LABEL_1834;
                    }
                    if (v735 == 156)
                    {
                      char v750 = -116;
                      goto LABEL_1834;
                    }
                    if (v735 > 0xDE || (v735 - 123) >= 0xE6u)
                    {
                      char v750 = v735 & 0xDF;
LABEL_1834:
                      char *v666 = v750;
                    }
                  }
                  dword_9DAA0 = 0;
                  goto LABEL_1814;
                }
              }
            }
            if (v527 == 128) {
              goto LABEL_1353;
            }
            if (v527 != 2048) {
              goto LABEL_1361;
            }
            v536 = v521[133];
            v522 = &unk_9D000;
            if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
            {
              int v537 = *(const char **)((char *)&stru_68.flags + (void)v536);
              BOOL v538 = v523;
              char v539 = v537;
              do
              {
                do
                  int v540 = *v538++;
                while (v540 == 173 || v540 == 30);
                if (v540 != *(unsigned __int8 *)v539) {
                  goto LABEL_1399;
                }
              }
              while (*(unsigned __int8 *)++v539);
              BOOL v543 = 1;
            }
            else
            {
LABEL_1399:
              BOOL v543 = 0;
              int v537 = *(const char **)((char *)&stru_68.offset + (void)v536);
            }
            char v563 = &v523[strlen(v537)];
            qword_9DA20 = (uint64_t)v563;
            LOBYTE(v564) = *v563;
            if (!*v563) {
              goto LABEL_2049;
            }
LABEL_1401:
            uint64_t v565 = *(void *)&stru_20.segname[(void)pLangGlb];
            if (!v565)
            {
              if (nLangIDGlb == 12)
              {
                switch(v564)
                {
                  case '!':
                    int v628 = v563[1];
                    v627 = v563 + 1;
                    if (!v628)
                    {
                      uint64_t v573 = 4294967220;
                      goto LABEL_1591;
                    }
                    uint64_t v629 = 0;
                    qword_9DA20 = (uint64_t)v627;
                    do
                    {
                      if (brl_set_ansi[v629] == *v627) {
                        goto LABEL_1531;
                      }
                      ++v629;
                    }
                    while (v629 != 256);
                    LOBYTE(v629) = 0;
LABEL_1531:
                    uint64_t v564 = brl_set_ansi[(v629 & 0x3F) + 192];
                    break;
                  case '""':
                    int v631 = v563[1];
                    uint64_t v630 = v563 + 1;
                    if (!v631)
                    {
                      uint64_t v573 = 94;
                      goto LABEL_1591;
                    }
                    uint64_t v632 = 0;
                    qword_9DA20 = (uint64_t)v630;
                    do
                    {
                      if (brl_set_ansi[v632] == *v630) {
                        goto LABEL_1537;
                      }
                      ++v632;
                    }
                    while (v632 != 256);
                    LOBYTE(v632) = 0;
LABEL_1537:
                    uint64_t v564 = brl_set_ansi[(v632 & 0x7F) + 128];
                    break;
                  case '$':
                    if (v563[1] == 36)
                    {
                      qword_9DA20 = (uint64_t)(v563 + 1);
                      unsigned int v644 = v563[2];
                      uint64_t v643 = (uint64_t)(v563 + 2);
                      unsigned int v642 = v644;
                      if (!v644) {
                        goto LABEL_1592;
                      }
                      while (1)
                      {
                        if (v642 - 58 <= 0xFFFFFFF5 && v642 <= 0xDE && v642 - 123 < 0xFFFFFFE6) {
                          goto LABEL_1592;
                        }
                        uint64_t v645 = 0;
                        qword_9DA20 = v643;
                        do
                        {
                          if (brl_set_ansi[v645] == v642) {
                            goto LABEL_1566;
                          }
                          ++v645;
                        }
                        while (v645 != 256);
                        LOBYTE(v645) = 0;
LABEL_1566:
                        bwd_char(brl_set_tbfr2007[brl_set_ansi[(v645 & 0xBF) + 64]]);
                        unsigned int v646 = *(unsigned __int8 *)++v643;
                        unsigned int v642 = v646;
                        if (!v646) {
                          goto LABEL_1592;
                        }
                      }
                    }
                    if (!v563[1])
                    {
                      uint64_t v573 = 4294967208;
LABEL_1591:
                      bwd_char(v573);
                      goto LABEL_1592;
                    }
                    uint64_t v647 = 0;
                    qword_9DA20 = (uint64_t)(v563 + 1);
                    do
                    {
                      if (brl_set_ansi[v647] == v563[1]) {
                        goto LABEL_1572;
                      }
                      ++v647;
                    }
                    while (v647 != 256);
                    LOBYTE(v647) = 0;
LABEL_1572:
                    uint64_t v564 = brl_set_ansi[(v647 & 0xBF) + 64];
                    break;
                  default:
                    v566 = *(const char **)&stru_B8.segname[(void)pLangGlb - 8];
                    char v633 = v563;
                    int v634 = v566;
                    while (1)
                    {
                      do
                        int v635 = *v633++;
                      while (v635 == 173 || v635 == 30);
                      if (v635 != *(unsigned __int8 *)v634) {
                        break;
                      }
                      if (!*(unsigned __int8 *)++v634)
                      {
LABEL_1409:
                        size_t v572 = (size_t)&v563[strlen(v566)];
                        goto LABEL_1525;
                      }
                    }
                    uint64_t v564 = v564;
                    break;
                }
                uint64_t v573 = brl_set_tbfr2007[v564];
                goto LABEL_1591;
              }
              switch(v564)
              {
                case '\'':
                  int v639 = v563[1];
                  v585 = v563 + 1;
                  int v638 = v639;
                  if (v639 == 46)
                  {
                    qword_9DA20 = (uint64_t)v585;
                    goto LABEL_1592;
                  }
                  if (v638 != 39)
                  {
                    if (!v638)
                    {
                      uint64_t v573 = 39;
                      goto LABEL_1591;
                    }
                    uint64_t v651 = 0;
                    qword_9DA20 = (uint64_t)v585;
                    do
                    {
                      if (brl_set_ansi[v651] == *v585) {
                        goto LABEL_1589;
                      }
                      ++v651;
                    }
                    while (v651 != 256);
                    LODWORD(v651) = 0;
LABEL_1589:
                    uint64_t v649 = (int)v651 | 0x80;
                    goto LABEL_1590;
                  }
                  break;
                case '$':
                  int v641 = v563[1];
                  v585 = v563 + 1;
                  int v640 = v641;
                  if (v641 != 36)
                  {
                    if (!v640)
                    {
                      uint64_t v573 = 36;
                      goto LABEL_1591;
                    }
                    uint64_t v650 = 0;
                    qword_9DA20 = (uint64_t)v585;
                    do
                    {
                      if (brl_set_ansi[v650] == *v585) {
                        goto LABEL_1583;
                      }
                      ++v650;
                    }
                    while (v650 != 256);
                    LODWORD(v650) = 0;
LABEL_1583:
                    uint64_t v649 = (int)v650 | 0xC0;
                    goto LABEL_1590;
                  }
                  break;
                case '""':
                  int v586 = v563[1];
                  v585 = v563 + 1;
                  int v584 = v586;
                  if (v586 != 34)
                  {
                    if (!v584)
                    {
                      uint64_t v573 = 34;
                      goto LABEL_1591;
                    }
                    uint64_t v648 = 0;
                    qword_9DA20 = (uint64_t)v585;
                    do
                    {
                      if (brl_set_ansi[v648] == *v585) {
                        goto LABEL_1578;
                      }
                      ++v648;
                    }
                    while (v648 != 256);
                    LODWORD(v648) = 0;
LABEL_1578:
                    uint64_t v649 = (int)v648 | 0x40;
LABEL_1590:
                    uint64_t v573 = brl_set_ansi[v649];
                    goto LABEL_1591;
                  }
                  break;
                default:
                  uint64_t v573 = (char)v564;
                  goto LABEL_1591;
              }
              qword_9DA20 = (uint64_t)v585;
              uint64_t v573 = (char)*v585;
              goto LABEL_1591;
            }
            v566 = *(const char **)&stru_B8.segname[(void)pLangGlb - 8];
            unsigned __int8 v567 = v563;
            uint64_t v568 = v566;
            while (1)
            {
              do
                int v569 = *v567++;
              while (v569 == 173 || v569 == 30);
              if (v569 != *(unsigned __int8 *)v568) {
                break;
              }
              if (!*(unsigned __int8 *)++v568) {
                goto LABEL_1409;
              }
            }
            dword_9DAA0 = 0;
            if (v543)
            {
              char v574 = v563;
              int v575 = *(unsigned __int8 **)((char *)&stru_68.reserved2 + (void)pLangGlb);
              do
              {
                do
                  int v576 = *v574++;
                while (v576 == 173 || v576 == 30);
                if (v576 != *v575) {
                  goto LABEL_1438;
                }
              }
              while (*++v575);
              size_t v579 = strlen(*(const char **)((char *)&stru_68.reserved2 + (void)pLangGlb));
              BOOL v580 = (unsigned __int8 *)&v563[v579];
              unsigned int v581 = v563[v579];
              if (v563[v579])
              {
                if (v581 > 0xDE || v581 - 123 >= 0xFFFFFFE6)
                {
                  unsigned int v583 = 0;
                  qword_9DA20 = (uint64_t)&v563[v579];
                  BOOL v543 = 1;
LABEL_1489:
                  char v563 = (char *)v580;
LABEL_1494:
                  unsigned int v594 = *v563;
                  goto LABEL_1495;
                }
              }
LABEL_1438:
              uint64_t v587 = v563;
              uint64_t v588 = *(unsigned __int8 **)&stru_B8.sectname[(void)pLangGlb];
              do
              {
                do
                  int v589 = *v587++;
                while (v589 == 173 || v589 == 30);
                if (v589 != *v588) {
                  goto LABEL_1450;
                }
              }
              while (*++v588);
              BOOL v580 = (unsigned __int8 *)&v563[strlen(*(const char **)&stru_B8.sectname[(void)pLangGlb])];
              unsigned int v592 = *v580;
              if (!*v580 || (v592 <= 0xDE ? (BOOL v593 = v592 - 123 >= 0xFFFFFFE6) : (BOOL v593 = 1), !v593))
              {
LABEL_1450:
                if (nSubLangIDGlb == 1)
                {
                  unsigned int v583 = 0;
                  unsigned int v594 = *v563;
                  BOOL v543 = v594 > 0x20;
LABEL_1495:
                  if (v594 < 0x21) {
                    goto LABEL_1592;
                  }
                  uint64_t v615 = 0;
                  while (1)
                  {
                    uint64_t v616 = *(unsigned __int8 **)(v565 + 8 * v615);
                    char v617 = v563;
                    while (1)
                    {
                      do
                        int v618 = *v617++;
                      while (v618 == 173 || v618 == 30);
                      if (v618 != *v616) {
                        break;
                      }
                      if (!*++v616)
                      {
                        int v621 = v543 | v583;
                        BOOL v622 = (v615 - 91) >= 0xE6u || (v615 + 33) >= 0xE1u;
                        char v623 = v615 | 0x20;
                        if (!v622) {
                          char v623 = v615;
                        }
                        if (!(_BYTE)v615) {
                          char v623 = v615;
                        }
                        BOOL v624 = (v615 - 123) >= 0xE6u || v615 >= 0xDFu;
                        char v625 = v615 & 0xDF;
                        if (!v624) {
                          char v625 = v615;
                        }
                        if (!(_BYTE)v615) {
                          char v625 = v615;
                        }
                        if (v621 == 1) {
                          char v626 = v625;
                        }
                        else {
                          char v626 = v623;
                        }
                        bwd_char(v626);
                        size_t v572 = strlen(*(const char **)(*(void *)&stru_20.segname[(void)pLangGlb] + 8 * v615))
                             + qword_9DA20;
LABEL_1525:
                        qword_9DA20 = v572 - 1;
LABEL_1592:
                        char v563 = (char *)(qword_9DA20 + 1);
                        qword_9DA20 = (uint64_t)v563;
                        LOBYTE(v564) = *v563;
                        if (!*v563) {
                          goto LABEL_2049;
                        }
                        goto LABEL_1401;
                      }
                    }
                    if (++v615 == 256) {
                      goto LABEL_1592;
                    }
                  }
                }
                unsigned int v583 = 0;
                goto LABEL_1491;
              }
            }
            else
            {
              if (nSubLangIDGlb == 1)
              {
                int v595 = v563;
                v596 = *(unsigned __int8 **)((char *)&stru_68.flags + (void)pLangGlb);
                do
                {
                  do
                    int v597 = *v595++;
                  while (v597 == 173 || v597 == 30);
                  if (v597 != *v596) {
                    goto LABEL_1461;
                  }
                }
                while (*++v596);
                size_t v600 = strlen(*(const char **)((char *)&stru_68.flags + (void)pLangGlb));
                unsigned int v583 = 0;
                v563 += v600;
                qword_9DA20 = (uint64_t)v563;
LABEL_1491:
                BOOL v543 = 1;
                goto LABEL_1494;
              }
LABEL_1461:
              int v601 = v563;
              v602 = *(unsigned __int8 **)&stru_B8.sectname[(void)pLangGlb];
              do
              {
                do
                  int v603 = *v601++;
                while (v603 == 173 || v603 == 30);
                if (v603 != *v602) {
                  goto LABEL_1475;
                }
              }
              while (*++v602);
              BOOL v580 = (unsigned __int8 *)&v563[strlen(*(const char **)&stru_B8.sectname[(void)pLangGlb])];
              unsigned int v606 = *v580;
              if (!*v580 || (v606 <= 0xDE ? (BOOL v607 = v606 - 123 >= 0xFFFFFFE6) : (BOOL v607 = 1), !v607))
              {
LABEL_1475:
                uint64_t v608 = v563;
                int v609 = *(unsigned __int8 **)((char *)&stru_68.reserved2 + (void)pLangGlb);
                do
                {
                  do
                    int v610 = *v608++;
                  while (v610 == 173 || v610 == 30);
                  if (v610 != *v609) {
                    goto LABEL_1492;
                  }
                }
                while (*++v609);
                size_t v613 = strlen(*(const char **)((char *)&stru_68.reserved2 + (void)pLangGlb));
                BOOL v580 = (unsigned __int8 *)&v563[v613];
                unsigned int v583 = v563[v613];
                if (v563[v613])
                {
                  if (v583 > 0xDE || v583 - 123 >= 0xFFFFFFE6)
                  {
                    BOOL v543 = 0;
                    qword_9DA20 = (uint64_t)&v563[v613];
                    unsigned int v583 = 1;
                    dword_9DAA0 = 1;
                    goto LABEL_1489;
                  }
LABEL_1492:
                  unsigned int v583 = 0;
                }
                BOOL v543 = 0;
                goto LABEL_1494;
              }
            }
            unsigned int v583 = 0;
            BOOL v543 = 0;
            qword_9DA20 = (uint64_t)v580;
            goto LABEL_1489;
          }
          if (v527 <= 3)
          {
            if ((unint64_t)(v527 - 1) >= 2)
            {
              if (v527) {
                goto LABEL_1361;
              }
            }
            else
            {
              char v530 = *v523;
              int v529 = (unsigned __int8 *)(v523 + 1);
              char v528 = v530;
              do
              {
                bwd_char(v528);
                int v531 = *v529++;
                char v528 = v531;
              }
              while (v531);
            }
            goto LABEL_1608;
          }
          if (v527 == 4) {
            goto LABEL_1334;
          }
          if (v527 != 32)
          {
            if (v527 != 64) {
              goto LABEL_1361;
            }
LABEL_1353:
            if ((nLangIDGlb != 12 || (lFlags & 0x40000000) != 0)
              && bwd_fetch_char((char *)&v849, v523, 0, 0))
            {
              uint64_t v544 = (char)v849;
              goto LABEL_1607;
            }
            v522 = &unk_9D000;
            qword_9DA20 = (uint64_t)(v523 + 1);
            if (v523[1] == 45)
            {
              qword_9DA20 = (uint64_t)(v523 + 2);
              bwd_char(45);
              if (*(unsigned char *)qword_9DA20 == 44)
              {
                ++qword_9DA20;
                bwd_char(44);
              }
            }
            uint64_t v549 = qword_9DA28;
            int v550 = nLangIDGlb;
            if ((unint64_t)qword_9DA28 < 3)
            {
LABEL_1373:
              if (v550 == 9) {
                goto LABEL_1374;
              }
              BOOL v842 = 0;
            }
            else
            {
              if (nLangIDGlb != 9 || (lFlags & 0x40000000) != 0)
              {
                int v551 = *(unsigned __int8 *)qword_9DA20;
                if ((v551 | 2) == 0x2E)
                {
                  ++qword_9DA20;
                  bwd_char((char)v551);
                  int v550 = nLangIDGlb;
                }
                goto LABEL_1373;
              }
LABEL_1374:
              BOOL v842 = 0;
              unsigned int v552 = *(unsigned __int8 *)qword_9DA20;
              int v550 = 9;
              if (v552 >= 0x21 && v552 != 160)
              {
                int v553 = 0;
                v554 = (unsigned __int8 *)(qword_9DA20 + 1);
                unsigned int v555 = (unsigned __int8 *)(qword_9DA20 + 1);
                unsigned int v556 = *(unsigned __int8 *)qword_9DA20;
                do
                {
                  if (v556 == 45) {
                    ++v553;
                  }
                  unsigned int v557 = *v555++;
                  unsigned int v556 = v557;
                }
                while (v557 >= 0x21 && v556 != 160);
                if (v553 == 2)
                {
                  int v558 = 0;
                  do
                  {
                    if (v552 == 36) {
                      ++v558;
                    }
                    unsigned int v559 = *v554++;
                    unsigned int v552 = v559;
                  }
                  while (v559 >= 0x21 && v552 != 160);
                  BOOL v842 = v558 == 0;
                }
                else
                {
                  BOOL v842 = 0;
                }
                int v550 = 9;
              }
            }
            if (v550 == 12
              || (lFlags & 0x40000000) != 0
              || !*(unsigned char *)qword_9DA20
              || !memchr(",;:/?+=(*)", *(unsigned __int8 *)qword_9DA20, 0xBuLL))
            {
              int v754 = 1;
              uint64_t v755 = 64;
            }
            else
            {
              int v754 = 0;
              uint64_t v755 = 128;
            }
            uint64_t v756 = qword_9DA30;
            *(void *)(qword_9DA30 + 24) = v755;
            uint64_t v757 = qword_9DA98;
            if (qword_9DA98 == 2)
            {
              int v758 = *(uint64_t **)(*(void *)(v756 + 48) + 48);
              if (v758)
              {
                v759 = *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)v521[133]);
                create_buffer(1, *v758, 0);
                int v760 = ":";
                if (no_exception(1, v759, (unsigned __int8 *)byte_9D9D8)) {
                  goto LABEL_1891;
                }
                uint64_t v549 = qword_9DA28;
                uint64_t v757 = qword_9DA98;
                goto LABEL_1865;
              }
LABEL_1890:
              int v760 = ".";
            }
            else
            {
LABEL_1865:
              if (v549 != 0x2000000) {
                goto LABEL_1890;
              }
              int v760 = ".";
              if (v757 != 0x4000000) {
                goto LABEL_1891;
              }
              BOOL v761 = **(unsigned __int8 ***)(qword_9DA30 + 40);
              char v762 = "'=";
              do
              {
                do
                  int v763 = *v761++;
                while (v763 == 173 || v763 == 30);
                if (v763 != *v762) {
                  goto LABEL_1890;
                }
                ++v762;
              }
              while (v762 != "");
              BOOL v765 = **(unsigned __int8 ***)(qword_9DA30 + 48);
              __int16 v766 = v765;
              v767 = "'=";
              while (1)
              {
                do
                  int v768 = *v766++;
                while (v768 == 173 || v768 == 30);
                if (v768 != *(unsigned __int8 *)v767) {
                  break;
                }
                if (++v767 == "")
                {
                  int v760 = ":";
                  goto LABEL_1891;
                }
              }
              while (1)
              {
                int v770 = *v765;
                if (v770 != 173 && v770 != 30) {
                  break;
                }
                ++v765;
              }
              if (v770 == 58) {
                int v760 = ":";
              }
              else {
                int v760 = ".";
              }
            }
LABEL_1891:
            uint64_t v772 = (char *)qword_9DA20;
            unsigned __int8 v773 = *(unsigned char *)qword_9DA20;
            while (2)
            {
              if (v773 == 30)
              {
                v36[319] = 0;
                uint64_t v774 = 30;
                goto LABEL_1924;
              }
              if (v773 == 39 && nLangIDGlb == 7)
              {
                uint64_t v774 = 39;
                goto LABEL_1924;
              }
              unsigned int v775 = pLangGlb;
              if (stru_B8.segname[(void)pLangGlb + 1] == v773)
              {
                int v776 = lFlags;
                if ((lFlags & 0x40000000) != 0) {
                  goto LABEL_1923;
                }
                int v777 = v772[1];
                if (nLangIDGlb == 12)
                {
                  if (!v772[1]
                    || !memchr("#123456789", v777, 0xBuLL)
                    || !*(v772 - 1)
                    || !memchr("#123456789", *(v772 - 1), 0xBuLL))
                  {
                    BOOL v778 = 0;
                    int v779 = nSubLangIDGlb;
                    if ((v776 & 0x40000000) != 0) {
                      goto LABEL_1931;
                    }
LABEL_1914:
                    if (v773 != 35)
                    {
                      int v36 = (void *)&unk_9D000;
                      v522 = &unk_9D000;
                      if (v773 != 58)
                      {
                        if (v773 == 124)
                        {
                          int v781 = v772[1];
                          if ((v781 - 49) <= 2
                            && (!v772[2] || !memchr("#123456789", v772[2], 0xBuLL)))
                          {
                            qword_9DA20 = (uint64_t)(v772 + 1);
                            if (v781 == 51)
                            {
                              uint64_t v774 = 4294967219;
                            }
                            else if (v781 == 50)
                            {
                              uint64_t v774 = 4294967218;
                            }
                            else
                            {
                              uint64_t v774 = 4294967225;
                            }
LABEL_1924:
                            bwd_char(v774);
                            goto LABEL_1925;
                          }
LABEL_2007:
                          uint64_t v774 = 32;
                          goto LABEL_1924;
                        }
                        goto LABEL_2029;
                      }
                      goto LABEL_2037;
                    }
                    int v36 = (void *)&unk_9D000;
                    v522 = &unk_9D000;
                    if (v772[1] == 36 && v772[2] == 35)
                    {
                      if (v772[3] == 35)
                      {
                        bwd_char(4294967177);
                        uint64_t v795 = qword_9DA20 + 3;
                      }
                      else
                      {
                        bwd_char(37);
                        uint64_t v795 = qword_9DA20 + 2;
                      }
                      qword_9DA20 = v795;
                      goto LABEL_1925;
                    }
LABEL_2016:
                    uint64_t v774 = 48;
                    goto LABEL_1924;
                  }
LABEL_1923:
                  uint64_t v774 = stru_B8.segname[(void)v775];
                  goto LABEL_1924;
                }
                if ((v777 - 107) >= 0xFFFFFFF6
                  && *(v772 - 1) - 107 >= 0xFFFFFFF6)
                {
                  goto LABEL_1923;
                }
              }
              BOOL v778 = nLangIDGlb == 9;
              int v779 = nSubLangIDGlb;
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
              {
                if ((lFlags & 0x40000000) != 0)
                {
                  if (v773 == 33)
                  {
                    uint64_t v786 = 32;
                    goto LABEL_1989;
                  }
                  if (v773 == 124) {
                    goto LABEL_1955;
                  }
                }
                int v779 = 3;
                BOOL v778 = 1;
                goto LABEL_1931;
              }
              if (nLangIDGlb == 12 && (lFlags & 0x40000000) == 0) {
                goto LABEL_1914;
              }
LABEL_1931:
              if (v773)
              {
                BOOL v782 = (lFlags & 0x40000000) == 0;
                if ((v773 - 107) >= 0xF6u)
                {
                  if ((lFlags & 0x40000000) != 0)
                  {
                    int v36 = (void *)&unk_9D000;
                    v522 = (void *)&unk_9D000;
                  }
                  else
                  {
                    int v784 = *(v772 - 1);
                    int v36 = &unk_9D000;
                    v522 = &unk_9D000;
                    if (*(v772 - 1)
                      && (memchr(",;:/?+=(*)", *(v772 - 1), 0xBuLL)
                       || v784 == 30 && *(v772 - 2) && memchr(",;:/?+=(*)", *(v772 - 2), 0xBuLL))
                      && *(unsigned __int8 *)(v34[320] - 1) != stru_B8.segname[(void)v775])
                    {
                      if (qword_9D9F8 >= 2) {
                        ++qword_9D9F8;
                      }
                      if (*(void *)(qword_9DA30 + 24) == 64)
                      {
                        bwd_char(47);
                        uint64_t v772 = (char *)qword_9DA20;
                      }
                      else
                      {
                        char v802 = *v760;
                        int v803 = (unsigned __int8 *)(v760 + 1);
                        do
                        {
                          bwd_char(v802);
                          int v804 = *v803++;
                          char v802 = v804;
                        }
                        while (v804);
                      }
                    }
                  }
                  int v789 = *v772;
                  if (v789 == 106) {
                    uint64_t v790 = 48;
                  }
                  else {
                    uint64_t v790 = (char)(v789 - 48);
                  }
                  bwd_char(v790);
                  int v754 = 1;
                  goto LABEL_1925;
                }
                if ((lFlags & 0x40000000) == 0 && memchr(",;:/?+=(*)", v773, 0xBuLL))
                {
                  int v783 = *(v772 - 1);
                  if (*(v772 - 1))
                  {
                    int v36 = &unk_9D000;
                    v522 = &unk_9D000;
                    if ((v783 - 107) > 0xFFFFFFF5
                      || v783 == 30 && *(v772 - 2) - 107 >= 0xFFFFFFF6)
                    {
                      if (qword_9D9F8 >= 2) {
                        ++qword_9D9F8;
                      }
                      if (*(void *)(qword_9DA30 + 24) == 64)
                      {
                        bwd_char(47);
                        uint64_t v772 = (char *)qword_9DA20;
                      }
                      else
                      {
                        char v798 = *v760;
                        char v799 = (unsigned __int8 *)(v760 + 1);
                        do
                        {
                          bwd_char(v798);
                          int v800 = *v799++;
                          char v798 = v800;
                        }
                        while (v800);
                      }
                    }
                  }
                  else
                  {
                    int v36 = (void *)&unk_9D000;
                    v522 = (void *)&unk_9D000;
                  }
                  uint64_t v801 = 0;
                  while (*v772 != asc_2A2CA[v801])
                  {
                    if (++v801 == 10) {
                      goto LABEL_1925;
                    }
                  }
                  if (v801)
                  {
                    uint64_t v774 = (char)(v801 + 48);
                    goto LABEL_1924;
                  }
                  goto LABEL_2016;
                }
                char v785 = !v842;
                if (v773 != 45) {
                  char v785 = 1;
                }
                if ((v785 & 1) == 0)
                {
LABEL_1955:
                  uint64_t v786 = 47;
                  goto LABEL_1989;
                }
              }
              else
              {
                BOOL v782 = (lFlags & 0x40000000) == 0;
              }
              if (v778)
              {
                if (v773 == 52)
                {
                  if (!v772[1])
                  {
                    int v36 = &unk_9D000;
                    if (qword_9D9F8 >= 2) {
                      ++qword_9D9F8;
                    }
                    uint64_t v796 = 0;
                    char v797 = 116;
                    v522 = (void *)&unk_9D000;
                    do
                    {
                      bwd_char(v797);
                      char v797 = aTh_3[++v796];
                    }
                    while (v796 != 2);
                    goto LABEL_1925;
                  }
                }
                else if (v773 == 124 && !v772[1])
                {
                  int v36 = &unk_9D000;
                  if (qword_9D9F8 >= 2) {
                    ++qword_9D9F8;
                  }
                  uint64_t v787 = 0;
                  char v788 = 115;
                  v522 = (void *)&unk_9D000;
                  do
                  {
                    bwd_char(v788);
                    char v788 = aSt_0[++v787];
                  }
                  while (v787 != 2);
                  goto LABEL_1925;
                }
              }
              if (bwd_fetch_char((char *)&v849, v772, 0, 0))
              {
                char v791 = v849;
                if (v849 == 149) {
                  char v791 = 46;
                }
                bwd_char(v791);
                v522 = &unk_9D000;
                ++qword_9DA20;
                int v36 = (void *)&unk_9D000;
                goto LABEL_1925;
              }
              if (v773 && v778 && v779 != 2 && v782 && memchr("#0-1|4$k'\x7F", v773, 0xBuLL))
              {
                if (v773 > 0x30u)
                {
                  v522 = &unk_9D000;
                  if (v773 <= 0x7Bu)
                  {
                    int v36 = (void *)&unk_9D000;
                    if (v773 == 49)
                    {
                      uint64_t v774 = 42;
                      goto LABEL_1924;
                    }
                    if (v773 == 52) {
                      goto LABEL_2007;
                    }
                    goto LABEL_2029;
                  }
                  int v36 = (void *)&unk_9D000;
                  if (v773 != 124)
                  {
                    if (v773 == 127)
                    {
                      int v807 = v772[1];
                      unsigned int v806 = v772 + 1;
                      int v805 = v807;
                      if (v807 && memchr(",;:/?+=(*)", v805, 0xBuLL))
                      {
                        qword_9DA20 = (uint64_t)v806;
                        if (bwd_fetch_char((char *)&v849, v806, 0, 0)) {
                          uint64_t v774 = (char)v849;
                        }
                        else {
                          uint64_t v774 = (char)v805;
                        }
                        goto LABEL_1924;
                      }
LABEL_1925:
                      uint64_t v772 = (char *)(v522[324] + 1);
                      v522[324] = v772;
                      unsigned __int8 v773 = *v772;
                      if (!*v772)
                      {
                        if (nLangIDGlb == 7)
                        {
                          BOOL v808 = *(void *)(qword_9DA30 + 24) == 128 && v754 == 0;
                          v521 = off_95000;
                          if (v808) {
                            bwd_char(46);
                          }
                          char v35 = (void *)&unk_9D000;
                          goto LABEL_2050;
                        }
                        char v35 = &unk_9D000;
LABEL_2049:
                        v521 = off_95000;
                        goto LABEL_2050;
                      }
                      continue;
                    }
                    goto LABEL_2029;
                  }
                }
                else
                {
                  v522 = &unk_9D000;
                  if (v773 > 0x26u)
                  {
                    int v36 = (void *)&unk_9D000;
                    if (v773 == 39)
                    {
                      uint64_t v774 = 44;
                      goto LABEL_1924;
                    }
                    if (v773 == 48)
                    {
                      uint64_t v774 = 43;
                      goto LABEL_1924;
                    }
                    goto LABEL_2029;
                  }
                  int v36 = (void *)&unk_9D000;
                  if (v773 == 35) {
                    goto LABEL_2007;
                  }
                  if (v773 != 36)
                  {
LABEL_2029:
                    uint64_t v774 = (char)v773;
                    goto LABEL_1924;
                  }
                  int v794 = v772[1];
                  uint64_t v793 = (uint64_t)(v772 + 1);
                  int v792 = v794;
                  if (v794 != 124)
                  {
                    if (v792 == 107)
                    {
                      qword_9DA20 = v793;
                      uint64_t v774 = 61;
                    }
                    else
                    {
                      uint64_t v774 = 46;
                    }
                    goto LABEL_1924;
                  }
                  qword_9DA20 = v793;
                }
LABEL_2037:
                uint64_t v774 = 47;
                goto LABEL_1924;
              }
              break;
            }
            uint64_t v786 = (char)v773;
LABEL_1989:
            bwd_char(v786);
            int v36 = (void *)&unk_9D000;
            v522 = (void *)&unk_9D000;
            goto LABEL_1925;
          }
          int v560 = *v523;
          v522 = &unk_9D000;
          if (in(*v523, 9))
          {
            if (v523[1] != 46)
            {
              if ((*(unsigned char *)(v520 + 34) & 0x10) == 0) {
                goto LABEL_1391;
              }
              LOBYTE(v560) = v560 & 0xDF;
            }
          }
          else
          {
LABEL_1391:
            BOOL v561 = (v560 - 91) >= 0xE6u || (v560 + 33) >= 0xE1u;
            char v562 = v560 | 0x20;
            if (!v561) {
              char v562 = v560;
            }
            if (v560) {
              LOBYTE(v560) = v562;
            }
            else {
              LOBYTE(v560) = 0;
            }
          }
          bwd_char((char)v560);
          int v751 = (unsigned char *)(qword_9DA20 + 1);
          qword_9DA20 = (uint64_t)v751;
          LOBYTE(v752) = *v751;
          if (*v751)
          {
            uint64_t v753 = v35[326];
            do
            {
              if ((*(unsigned char *)(v753 + 33) & 4) != 0
                && ((v752 + 33) > 0xE0u || (v752 - 91) >= 0xE6u))
              {
                bwd_char((char)(v752 | 0x20));
                uint64_t v753 = v35[326];
                int v751 = (unsigned char *)qword_9DA20;
              }
              else
              {
                bwd_char((char)v752);
              }
              qword_9DA20 = (uint64_t)(v751 + 1);
              int v752 = *++v751;
            }
            while (v752);
          }
LABEL_2050:
          if ((uint64_t)v36[319] >= 1)
          {
            v36[319] = 0;
            bwd_char(30);
          }
          uint64_t v809 = v35[326];
          qword_9DA28 = *(void *)(v809 + 24);
          uint64_t v520 = *(void *)(v809 + 48);
          v35[326] = v520;
          if (v520) {
            continue;
          }
          break;
        }
        v810 = &unk_9D000;
        uint64_t v811 = qword_9DA48;
        uint64_t v812 = v839;
        if (qword_9DA48)
        {
          char v813 = a4;
          do
          {
            v814 = (void *)v811;
            uint64_t v811 = *(void *)(v811 + 48);
            v810[329] = v811;
            free(v814);
            v810 = (void *)&unk_9D000;
          }
          while (v811);
          v35[326] = v814;
        }
        else
        {
          char v813 = a4;
        }
LABEL_2059:
        free((void *)qword_9DA88);
        qword_9DA88 = 0;
        char v815 = (unsigned char *)v34[320];
        *char v815 = 0;
        if (v815 == (unsigned char *)qword_9DA08) {
          return 111;
        }
        if (bMemoryOverflow) {
          return 8;
        }
        memmove(v33, __src, v815 - (unsigned char *)v33);
        if (v813)
        {
          v36[319] = 0;
          qword_9DA40 = v812;
          qword_9DA38 = v812;
          v34[320] = v33;
          uint64_t v816 = qword_9DA08;
          if ((void *)qword_9DA08 != v33)
          {
            int64_t v817 = 0;
            v818 = 0;
            v819 = (unsigned __int8 *)v33;
            while (1)
            {
              unsigned int v820 = *v819;
              v821 = &unk_9D000;
              if (*v819)
              {
                if (v820 == 31)
                {
                  *v819++ = 32;
                  ++v847;
LABEL_2071:
                  v34[320] = v819;
                  goto LABEL_2109;
                }
                if (v820 >= 0x21 && v820 != 160)
                {
                  ++v847;
                  ++v819;
                  goto LABEL_2071;
                }
              }
              char v822 = (unsigned __int8 *)qword_9DA38;
              unsigned int v823 = *(unsigned __int8 *)qword_9DA38;
              if (!*(unsigned char *)qword_9DA38) {
                break;
              }
              uint64_t v824 = 0;
              do
              {
                if (v823 < 0x21) {
                  break;
                }
                if (v823 == 160) {
                  break;
                }
                qword_9DA38 = (uint64_t)&v822[++v824];
                unsigned int v823 = *(unsigned __int8 *)qword_9DA38;
              }
              while (*(unsigned char *)qword_9DA38);
              v822 += v824;
              uint64_t v825 = v824 - 1;
              if (!v824 || v824 >= v847) {
                goto LABEL_2081;
              }
              uint64_t v826 = v847 / (unint64_t)v824;
LABEL_2082:
              unsigned __int8 v827 = &v818[v825];
              if (v817 >= v819 - (unsigned char *)v33)
              {
                int64_t v831 = v817;
              }
              else
              {
                uint64_t v828 = 0;
                unsigned __int8 v829 = v818;
                do
                {
                  v813[v817 + v828++] = v829;
                  if (v828 % v826) {
                    BOOL v830 = 0;
                  }
                  else {
                    BOOL v830 = (uint64_t)v829 < (uint64_t)v827;
                  }
                  if (v830) {
                    v36[319] = ++v829;
                  }
                  int64_t v831 = v817 + v828;
                }
                while (v817 + v828 < v819 - (unsigned char *)v33);
                if (v831 - 1 >= 1 && (unint64_t)(v819 - ((unsigned char *)v33 + v817)) >= 2) {
                  v813[v817 - 1 + v828] = v827;
                }
                v821 = (void *)&unk_9D000;
              }
              unsigned int v832 = *v819;
              if (!*v819)
              {
LABEL_2111:
                uint64_t result = 0;
                v813[v831] = v827;
                return result;
              }
              v833 = v819 + 1;
              int v834 = v825 + v818 + 1;
              int64_t v817 = v831;
              while (v832 < 0x21 || v832 == 160)
              {
                v813[v817] = v834;
                int64_t v831 = v817 + 1;
                v34[320] = v833;
                unsigned int v835 = *v833++;
                unsigned int v832 = v835;
                ++v834;
                ++v817;
                if (!v835)
                {
                  LODWORD(v827) = v834 - 1;
                  goto LABEL_2111;
                }
              }
              unsigned int v836 = *v822;
              if (*v822)
              {
                v837 = v822 + 1;
                do
                {
                  if (v836 >= 0x21 && v836 != 160) {
                    break;
                  }
                  v821[327] = v837;
                  unsigned int v838 = *v837++;
                  unsigned int v836 = v838;
                }
                while (v838);
                char v822 = v837 - 1;
              }
              uint64_t v847 = 0;
              v819 = v833 - 1;
              v818 = &v822[-v812];
              v36[319] = &v822[-v812];
LABEL_2109:
              uint64_t result = 0;
              if (v819 == (unsigned __int8 *)v816) {
                return result;
              }
            }
            uint64_t v825 = -1;
LABEL_2081:
            uint64_t v826 = 1;
            goto LABEL_2082;
          }
        }
        return 0;
    }
  }
}

id sub_1F1EC()
{
  if (qword_9DBB8 != -1) {
    dispatch_once(&qword_9DBB8, &stru_90D48);
  }
  int v0 = (void *)qword_9DBB0;

  return v0;
}

void sub_1FA90(id a1)
{
  qword_9DBB0 = (uint64_t)os_log_create("com.apple.accessibility", "BRLTranslation.RTFC");

  _objc_release_x1();
}

void sub_1FAEC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_1FB0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1FB28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1FB44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1FBB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1FC1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1FC54()
{
  sub_1FAD4();
  sub_1FAEC(&dword_0, v0, v1, "RTFC error: '%@' result:%d");
}

void sub_1FCBC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1FD28()
{
  sub_1FAD4();
  sub_1FAEC(&dword_0, v0, v1, "Error translating text: '%@' ansi_result:%d");
}

void sub_1FD90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1FDC8()
{
  sub_1FAD4();
  sub_1FAEC(&dword_0, v0, v1, "Error translating braille: '%@', result: %d");
}

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}