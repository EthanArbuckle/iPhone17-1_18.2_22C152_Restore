uint64_t usbuf_hexdump(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  int v28;

  if ((a5 & 0xFF00) != 0) {
    v8 = BYTE1(a5);
  }
  else {
    v8 = 32;
  }
  v27 = a3;
  if ((int)a3 >= 1)
  {
    v9 = a5;
    v11 = result;
    v12 = 0;
    if ((_BYTE)a5) {
      v13 = a5;
    }
    else {
      v13 = 16;
    }
    v26 = a4;
    v28 = a5;
    while (1)
    {
      if (a4) {
        usbuf_printf(v11, "%s", a3, a4, a5, a6, a7, a8, a4);
      }
      if ((v9 & 0x10000) == 0) {
        usbuf_printf(v11, "%04x  ", a3, a4, a5, a6, a7, a8, v12);
      }
      if ((v9 & 0x20000) == 0)
      {
        v14 = 0;
        do
        {
          if (v12 + v14 >= v27) {
            usbuf_printf(v11, "   ", a3, a4, a5, a6, a7, a8, v24);
          }
          else {
            usbuf_printf(v11, "%c%02x", a3, a4, a5, a6, a7, a8, v8);
          }
          ++v14;
        }
        while (v13 != v14);
      }
      v9 = v28;
      if ((v28 & 0x40000) == 0) {
        break;
      }
LABEL_29:
      result = usbuf_printf(v11, "\n", a3, a4, a5, a6, a7, a8, v24);
      v12 += v13;
      a2 += v13;
      a4 = v26;
      if ((int)v12 >= (int)v27) {
        return result;
      }
    }
    usbuf_printf(v11, "  |", a3, a4, a5, a6, a7, a8, v24);
    v21 = 0;
    while (v12 + v21 < v27)
    {
      if (*(unsigned __int8 *)(a2 + v21) - 32 > 0x5E)
      {
        v22 = v11;
        v23 = ".";
        goto LABEL_26;
      }
      usbuf_printf(v11, "%c", v15, v16, v17, v18, v19, v20, *(unsigned char *)(a2 + v21));
LABEL_27:
      if (v13 == ++v21)
      {
        usbuf_printf(v11, "|", v15, v16, v17, v18, v19, v20, v25);
        v9 = v28;
        goto LABEL_29;
      }
    }
    v22 = v11;
    v23 = " ";
LABEL_26:
    usbuf_printf(v22, v23, v15, v16, v17, v18, v19, v20, v25);
    goto LABEL_27;
  }
  return result;
}

uint64_t usbuf_putbuf(uint64_t a1)
{
  v1 = (const char *)usbuf_data(a1);
  return printf("%s", v1);
}

uint64_t usbuf_printf_drain(void *a1, const char *a2, int a3)
{
  uint64_t result = printf("%.*s", a3, a2);
  if ((result & 0x80000000) != 0) {
    return -*__error();
  }
  if (a1) {
    *a1 += result;
  }
  return result;
}

void *usbuf_new(_OWORD *a1, uint64_t a2, int a3, unsigned __int16 a4)
{
  if (a1)
  {
    v7 = a1;
    *((void *)a1 + 8) = 0;
    a1[2] = 0u;
    a1[3] = 0u;
    *a1 = 0u;
    a1[1] = 0u;
    int v8 = *((_DWORD *)a1 + 12);
  }
  else
  {
    v9 = malloc_type_calloc(1uLL, 0x48uLL, 0x1090040CEDE3635uLL);
    v7 = v9;
    if (!v9) {
      return v7;
    }
    int v8 = *((_DWORD *)v9 + 12) | 0x80000;
    *((_DWORD *)v9 + 12) = v8;
  }
  int v10 = v8 | a4;
  size_t v11 = a3;
  v7[4] = a3;
  void *v7 = a2;
  *((_DWORD *)v7 + 12) = v10 | 0x200000;
  if (!a2)
  {
    if (v10)
    {
      if (a3 > 4095)
      {
        signed int v13 = (a3 + 4095) & 0xFFFFF000;
      }
      else
      {
        int v12 = 16;
        do
        {
          signed int v13 = v12;
          v12 *= 2;
        }
        while (v13 < a3);
      }
      size_t v11 = v13;
      v7[4] = v13;
    }
    v14 = malloc_type_calloc(1uLL, v11, 0x56875E78uLL);
    void *v7 = v14;
    int v15 = *((_DWORD *)v7 + 12);
    if (v14)
    {
      *((_DWORD *)v7 + 12) = v15 | 0x10000;
    }
    else
    {
      if ((v15 & 0x80000) != 0) {
        free(v7);
      }
      return 0;
    }
  }
  return v7;
}

uint64_t usbuf_get_flags(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 48);
}

uint64_t usbuf_clear_flags(uint64_t result, __int16 a2)
{
  *(_DWORD *)(result + 48) &= ~a2 | 0xFFFF0000;
  return result;
}

uint64_t usbuf_set_flags(uint64_t result, unsigned __int16 a2)
{
  *(_DWORD *)(result + 48) |= a2;
  return result;
}

uint64_t usbuf_clear(uint64_t result)
{
  *(_DWORD *)(result + 48) &= ~0x20000u;
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 56) = 0;
  *(void *)(result + 64) = 0;
  return result;
}

uint64_t usbuf_setpos(uint64_t a1, uint64_t a2)
{
  if (a2 < 0 || *(void *)(a1 + 40) < a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(void *)(a1 + 40) = a2;
  return result;
}

uint64_t usbuf_count_drain(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 += (int)a3;
  return a3;
}

uint64_t usbuf_set_drain(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  return result;
}

uint64_t usbuf_drain(uint64_t *a1)
{
  uint64_t v2 = a1[5];
  uint64_t result = *((unsigned int *)a1 + 6);
  if (v2) {
    BOOL v4 = result == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    int v5 = a1[6] & 0x100004;
    if (v5 == 1048580 && !a1[8])
    {
      uint64_t result = 11;
    }
    else
    {
      uint64_t v6 = 5;
      if (v5 == 1048580) {
        uint64_t v6 = 8;
      }
      unsigned int v7 = ((uint64_t (*)(uint64_t, void, void))a1[1])(a1[2], *a1, LODWORD(a1[v6]));
      unsigned int v8 = v7;
      if ((int)v7 > 0)
      {
        uint64_t v9 = a1[5];
        uint64_t v10 = a1[8] - v7;
        size_t v11 = v9 - v7;
        BOOL v4 = v9 == v7;
        a1[5] = v11;
        a1[8] = v10;
        uint64_t v12 = *a1;
        if (v4)
        {
          uint64_t result = 0;
          *((_DWORD *)a1 + 12) = a1[6] & 0xFFDFFFFF | ((*(unsigned char *)(v12 + v8 - 1) == 10) << 21);
        }
        else
        {
          memmove((void *)*a1, (const void *)(v12 + v7), v11);
          return 0;
        }
        return result;
      }
      if (v7) {
        uint64_t result = -v7;
      }
      else {
        uint64_t result = 11;
      }
    }
    *((_DWORD *)a1 + 6) = result;
  }
  return result;
}

uint64_t usbuf_bcat(uint64_t a1, char *a2, unint64_t a3)
{
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sbuf_put_bytes(uint64_t result, char *__src, unint64_t a3)
{
  if (*(_DWORD *)(result + 24)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = a3 == 0;
  }
  if (!v3)
  {
    unint64_t v4 = a3;
    uint64_t v6 = result;
    size_t v7 = *(void *)(result + 40);
    do
    {
      uint64_t v8 = *(void *)(v6 + 32) + ~v7;
      if (v8 <= 0)
      {
        if (*(void *)(v6 + 8))
        {
          uint64_t result = usbuf_drain((uint64_t *)v6);
        }
        else
        {
          if (v4 >= 0x7FFFFFFF) {
            int v9 = 0x7FFFFFFF;
          }
          else {
            int v9 = v4;
          }
          uint64_t result = sbuf_extend(v6, v9);
          if ((result & 0x80000000) != 0)
          {
            *(_DWORD *)(v6 + 24) = 12;
            return result;
          }
        }
        if (*(_DWORD *)(v6 + 24)) {
          return result;
        }
        size_t v7 = *(void *)(v6 + 40);
        uint64_t v8 = *(void *)(v6 + 32) + ~v7;
      }
      if (v4 >= v8) {
        size_t v10 = v8;
      }
      else {
        size_t v10 = v4;
      }
      uint64_t result = (uint64_t)memcpy((void *)(*(void *)v6 + v7), __src, v10);
      size_t v7 = *(void *)(v6 + 40) + v10;
      *(void *)(v6 + 40) = v7;
      if ((*(unsigned char *)(v6 + 50) & 0x10) != 0) {
        *(void *)(v6 + 56) += v10;
      }
      __src += v10;
      v4 -= v10;
    }
    while (v4);
  }
  return result;
}

uint64_t usbuf_bcpy(uint64_t a1, char *a2, unint64_t a3)
{
  *(_DWORD *)(a1 + 48) &= ~0x20000u;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  sbuf_put_bytes(a1, a2, a3);
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t usbuf_cat(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  sbuf_put_bytes(a1, __s, v4);
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t usbuf_cpy(uint64_t a1, char *__s)
{
  *(_DWORD *)(a1 + 48) &= ~0x20000u;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  size_t v4 = strlen(__s);
  sbuf_put_bytes(a1, __s, v4);
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t usbuf_vprintf(uint64_t a1, char *__format, va_list a3)
{
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  do
  {
    unsigned int v6 = vsnprintf((char *)(*(void *)a1 + *(void *)(a1 + 40)), *(void *)(a1 + 32) - *(void *)(a1 + 40), __format, a3);
    if ((v6 & 0x80000000) != 0)
    {
      *(_DWORD *)(a1 + 24) = *__error();
      return 0xFFFFFFFFLL;
    }
    unsigned int v7 = v6;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32) + ~v8;
    if (v9 >= v6) {
      break;
    }
    if (v8 < 1 || *(void *)(a1 + 8) == 0)
    {
      int v11 = sbuf_extend(a1, v6 - v9);
      if (v11)
      {
        *(_DWORD *)(a1 + 24) = 12;
        break;
      }
    }
    else
    {
      int v11 = usbuf_drain((uint64_t *)a1);
    }
  }
  while (!v11);
  uint64_t v12 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) + ~v12 >= v7) {
    int v13 = v7;
  }
  else {
    int v13 = *(_DWORD *)(a1 + 32) + ~v12;
  }
  *(void *)(a1 + 40) = v12 + v13;
  if ((*(unsigned char *)(a1 + 50) & 0x10) != 0) {
    *(void *)(a1 + 56) += v13;
  }
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sbuf_extend(uint64_t a1, int a2)
{
  if ((*(unsigned char *)(a1 + 48) & 1) == 0) {
    return 0xFFFFFFFFLL;
  }
  int v3 = *(_DWORD *)(a1 + 32) + a2;
  if (v3 > 4095)
  {
    signed int v5 = (v3 + 4095) & 0xFFFFF000;
  }
  else
  {
    int v4 = 16;
    do
    {
      signed int v5 = v4;
      v4 *= 2;
    }
    while (v5 < v3);
  }
  uint64_t v6 = v5;
  unsigned int v7 = malloc_type_calloc(1uLL, v5, 0x9AF78578uLL);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v7;
  memcpy(v7, *(const void **)a1, *(void *)(a1 + 32));
  int v9 = *(_DWORD *)(a1 + 48);
  if ((v9 & 0x10000) != 0) {
    free(*(void **)a1);
  }
  else {
    *(_DWORD *)(a1 + 48) = v9 | 0x10000;
  }
  uint64_t result = 0;
  *(void *)a1 = v8;
  *(void *)(a1 + 32) = v6;
  return result;
}

uint64_t usbuf_printf(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return usbuf_vprintf(a1, a2, &a9);
}

uint64_t usbuf_putc(uint64_t a1, char a2)
{
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sbuf_put_byte(uint64_t result, char a2)
{
  if (*(_DWORD *)(result + 24)) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 40);
  if (*(void *)(result + 32) + ~v4 > 0)
  {
LABEL_4:
    uint64_t v5 = *(void *)v3;
    *(void *)(v3 + 40) = v4 + 1;
    *(unsigned char *)(v5 + v4) = a2;
    if ((*(unsigned char *)(v3 + 50) & 0x10) != 0) {
      ++*(void *)(v3 + 56);
    }
    return result;
  }
  if (*(void *)(result + 8))
  {
    uint64_t result = usbuf_drain((uint64_t *)result);
  }
  else
  {
    uint64_t result = sbuf_extend(result, 1);
    if ((result & 0x80000000) != 0)
    {
      *(_DWORD *)(v3 + 24) = 12;
      return result;
    }
  }
  if (!*(_DWORD *)(v3 + 24))
  {
    uint64_t v4 = *(void *)(v3 + 40);
    goto LABEL_4;
  }
  return result;
}

uint64_t usbuf_nl_terminate(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (*(unsigned char *)(v2 + *(void *)a1 - 1) == 10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((*(unsigned char *)(a1 + 50) & 0x20) == 0) {
LABEL_3:
  }
    sbuf_put_byte(a1, 10);
LABEL_4:
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t usbuf_trim(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v3 - 1;
  if (v3 >= 1)
  {
    uint64_t v5 = MEMORY[0x263EF8318];
    do
    {
      unsigned int v6 = *(char *)(*(void *)a1 + v4);
      if ((v6 & 0x80000000) != 0)
      {
        uint64_t result = __maskrune(v6, 0x4000uLL);
        if (!result) {
          return result;
        }
      }
      else
      {
        uint64_t result = *(_DWORD *)(v5 + 4 * v6 + 60) & 0x4000;
        if (!result) {
          return result;
        }
      }
      *(void *)(a1 + 40) = v4;
      if ((*(unsigned char *)(a1 + 50) & 0x10) != 0) {
        --*(void *)(a1 + 56);
      }
      unint64_t v7 = v4-- + 1;
    }
    while (v7 > 1);
  }
  return 0;
}

uint64_t usbuf_error(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t usbuf_finish(uint64_t a1)
{
  *(unsigned char *)(*(void *)a1 + *(void *)(a1 + 40)) = 0;
  int v2 = *(_DWORD *)(a1 + 48);
  if ((v2 & 2) != 0) {
    ++*(void *)(a1 + 40);
  }
  if (*(void *)(a1 + 8) && *(uint64_t *)(a1 + 40) >= 1)
  {
    int v3 = *(_DWORD *)(a1 + 24);
    do
    {
      if (v3) {
        break;
      }
      int v3 = usbuf_drain((uint64_t *)a1);
      *(_DWORD *)(a1 + 24) = v3;
    }
    while (*(uint64_t *)(a1 + 40) > 0);
    int v2 = *(_DWORD *)(a1 + 48);
  }
  *(_DWORD *)(a1 + 48) = v2 | 0x20000;
  int v4 = *(_DWORD *)(a1 + 24);
  if (!v4) {
    return 0;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t usbuf_data(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t usbuf_len(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24)) {
    return -1;
  }
  if ((*(_DWORD *)(a1 + 48) & 0x20002) == 2) {
    return *(void *)(a1 + 40) + 1;
  }
  return *(void *)(a1 + 40);
}

void usbuf_delete(_DWORD *a1)
{
  int v2 = a1[12];
  if ((v2 & 0x10000) != 0)
  {
    free(*(void **)a1);
    int v2 = a1[12];
  }
  *((void *)a1 + 8) = 0;
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  if ((v2 & 0x80000) != 0)
  {
    free(a1);
  }
}

uint64_t usbuf_done(uint64_t a1)
{
  return *(_DWORD *)(a1 + 48) & 0x20000;
}

uint64_t usbuf_start_section(uint64_t result, void *a2)
{
  int v2 = *(_DWORD *)(result + 48);
  if ((v2 & 0x100000) != 0)
  {
    *a2 = *(void *)(result + 56);
    *(void *)(result + 56) = 0;
  }
  else
  {
    if (a2) {
      *a2 = -1;
    }
    *(void *)(result + 64) = *(void *)(result + 40);
    *(_DWORD *)(result + 48) = v2 | 0x100000;
  }
  return result;
}

uint64_t usbuf_end_section(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  if (a3 >= 2 && !*(_DWORD *)(a1 + 24))
  {
    unint64_t v6 = *(void *)(a1 + 56) % a3;
    uint64_t v7 = a3 - v6;
    if (v6 && v7 >= 1)
    {
      do
      {
        sbuf_put_byte(a1, a4);
        if (*(_DWORD *)(a1 + 24)) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v7 <= 1;
        }
        --v7;
      }
      while (!v10);
    }
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (a2 == -1)
  {
    uint64_t v12 = 0;
    *(void *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 48) &= ~0x100000u;
  }
  else
  {
    uint64_t v12 = v11 + a2;
  }
  *(void *)(a1 + 56) = v12;
  if (*(_DWORD *)(a1 + 24)) {
    return -1;
  }
  else {
    return v11;
  }
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}