uint64_t __gen2_der_heim_oid_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 4 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_heim_octet_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_printable_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_ia5_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_heim_bit_string_cmp(unint64_t *a1, void *a2)
{
  unint64_t v2 = *a1;
  if (*a1 != *a2) {
    return v2 - *a2;
  }
  if (!v2) {
    return 0;
  }
  v3 = (char *)a1[1];
  v4 = (unsigned __int8 *)a2[1];
  unint64_t v5 = v2 >> 3;
  uint64_t result = memcmp(v3, v4, v2 >> 3);
  if (result) {
    return result;
  }
  if ((v2 & 7) == 0) {
    return 0;
  }
  v7 = (unsigned __int8 *)&v3[v5];
  if (&v3[v5] < &v3[(v2 + 7) >> 3] && v7 >= (unsigned __int8 *)v3) {
    return (*v7 >> (8 - (v2 & 7))) - (v4[v5] >> (8 - (v2 & 7)));
  }
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_heim_integer_cmp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a1 + 16));
  if (!v2)
  {
    size_t v3 = *(void *)a1;
    if (*(void *)a1 == *(void *)a2) {
      return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v3);
    }
    return v3 - *(void *)a2;
  }
  return v2;
}

uint64_t __gen2_der_heim_bmp_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 2 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_heim_universal_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 4 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_heim_len_unsigned(unsigned int a1)
{
  uint64_t v1 = 1;
  do
  {
    unsigned int v2 = a1;
    a1 >>= 8;
    ++v1;
  }
  while (v2 > 0xFF);
  if (v2 <= 0x7F) {
    return v1 - 1;
  }
  else {
    return v1;
  }
}

uint64_t __gen2_heim_len_unsigned64(unint64_t a1)
{
  uint64_t v1 = 1;
  do
  {
    unint64_t v2 = a1;
    a1 >>= 8;
    ++v1;
  }
  while (v2 > 0xFF);
  if (v2 <= 0x7F) {
    return v1 - 1;
  }
  else {
    return v1;
  }
}

uint64_t __gen2_heim_len_int(unsigned int a1)
{
  if ((a1 & 0x80000000) != 0)
  {
    unsigned int v3 = ~a1;
    uint64_t v1 = -1;
    do
    {
      unsigned int v2 = v3;
      v3 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  else
  {
    uint64_t v1 = -1;
    do
    {
      unsigned int v2 = a1;
      a1 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  uint64_t v4 = v1 + 1;
  uint64_t v5 = v1 + 2;
  if (v2 >= 0x80) {
    return v5;
  }
  else {
    return v4;
  }
}

uint64_t _heim_len_int64(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    unint64_t v3 = ~a1;
    uint64_t v1 = -1;
    do
    {
      unint64_t v2 = v3;
      v3 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  else
  {
    uint64_t v1 = -1;
    do
    {
      unint64_t v2 = a1;
      a1 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  uint64_t v4 = v1 + 1;
  uint64_t v5 = v1 + 2;
  if (v2 >= 0x80) {
    return v5;
  }
  else {
    return v4;
  }
}

uint64_t __gen2_der_length_len(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  unint64_t v2 = a1;
  uint64_t result = 1;
  do
  {
    ++result;
    BOOL v3 = v2 > 0xFF;
    v2 >>= 8;
  }
  while (v3);
  return result;
}

uint64_t __gen2_der_length_tag(unsigned int a1)
{
  if (a1 < 0x1F) {
    return 1;
  }
  unsigned int v2 = a1;
  uint64_t result = 1;
  do
  {
    ++result;
    BOOL v3 = v2 > 0x7F;
    v2 >>= 7;
  }
  while (v3);
  return result;
}

uint64_t __gen2_der_length_integer(unsigned int *a1)
{
  unsigned int v1 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    unsigned int v4 = ~v1;
    uint64_t v2 = -1;
    do
    {
      unsigned int v3 = v4;
      v4 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  else
  {
    uint64_t v2 = -1;
    do
    {
      unsigned int v3 = v1;
      v1 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  uint64_t v5 = v2 + 1;
  uint64_t v6 = v2 + 2;
  if (v3 >= 0x80) {
    return v6;
  }
  else {
    return v5;
  }
}

uint64_t __gen2_der_length_integer64(unint64_t *a1)
{
  unint64_t v1 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    unint64_t v4 = ~v1;
    uint64_t v2 = -1;
    do
    {
      unint64_t v3 = v4;
      v4 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  else
  {
    uint64_t v2 = -1;
    do
    {
      unint64_t v3 = v1;
      v1 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  uint64_t v5 = v2 + 1;
  uint64_t v6 = v2 + 2;
  if (v3 >= 0x80) {
    return v6;
  }
  else {
    return v5;
  }
}

uint64_t __gen2_der_length_unsigned(unsigned int *a1)
{
  unsigned int v1 = *a1;
  uint64_t v2 = 1;
  do
  {
    unsigned int v3 = v1;
    v1 >>= 8;
    ++v2;
  }
  while (v3 > 0xFF);
  if (v3 <= 0x7F) {
    return v2 - 1;
  }
  else {
    return v2;
  }
}

uint64_t __gen2_der_length_unsigned64(unint64_t *a1)
{
  unint64_t v1 = *a1;
  uint64_t v2 = 1;
  do
  {
    unint64_t v3 = v1;
    v1 >>= 8;
    ++v2;
  }
  while (v3 > 0xFF);
  if (v3 <= 0x7F) {
    return v2 - 1;
  }
  else {
    return v2;
  }
}

uint64_t __gen2_der_length_enumerated(unsigned int *a1)
{
  unsigned int v1 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    unsigned int v4 = ~v1;
    uint64_t v2 = -1;
    do
    {
      unsigned int v3 = v4;
      v4 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  else
  {
    uint64_t v2 = -1;
    do
    {
      unsigned int v3 = v1;
      v1 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  uint64_t v5 = v2 + 1;
  uint64_t v6 = v2 + 2;
  if (v3 >= 0x80) {
    return v6;
  }
  else {
    return v5;
  }
}

size_t __gen2_der_length_general_string(const char **a1)
{
  return strlen(*a1);
}

size_t __gen2_der_length_utf8string(const char **a1)
{
  return strlen(*a1);
}

uint64_t __gen2_der_length_printable_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_der_length_ia5_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_der_length_bmp_string(void *a1)
{
  return 2 * *a1;
}

uint64_t __gen2_der_length_universal_string(void *a1)
{
  return 4 * *a1;
}

size_t __gen2_der_length_visible_string(const char **a1)
{
  return strlen(*a1);
}

uint64_t __gen2_der_length_octet_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_der_length_heim_integer(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*a1) {
    return 1;
  }
  int v2 = *((_DWORD *)a1 + 4);
  if (v1 == 1 && v2 != 0)
  {
    unsigned int v5 = *(unsigned __int8 *)a1[1];
    if (v5 == 1) {
      return 1;
    }
    return v1 + (v5 >> 7);
  }
  unsigned int v4 = (unsigned __int8 *)a1[1];
  if (v2)
  {
    unsigned int v5 = *v4;
    return v1 + (v5 >> 7);
  }
  return v1 + ((unint64_t)*v4 >> 7);
}

uint64_t __gen2_der_length_oid(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 < 3) {
    return 1;
  }
  unint64_t v2 = a1[1];
  uint64_t v3 = 2;
  uint64_t result = 1;
  while (1)
  {
    unsigned int v5 = (unsigned int *)(v2 + 4 * v3);
    if ((unint64_t)v5 < v2) {
      break;
    }
    unsigned int v6 = *v5;
    do
    {
      ++result;
      BOOL v7 = v6 > 0x7F;
      v6 >>= 7;
    }
    while (v7);
    if (++v3 == v1) {
      return result;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_length_generalized_time(uint64_t *a1)
{
  uint64_t v3 = 0;
  unsigned int v4 = 0;
  __gen2_heim_time2generalizedtime(*a1, &v3, 1);
  uint64_t v1 = v3;
  free(v4);
  return v1;
}

uint64_t __gen2_der_length_utctime(uint64_t *a1)
{
  uint64_t v3 = 0;
  unsigned int v4 = 0;
  __gen2_heim_time2generalizedtime(*a1, &v3, 0);
  uint64_t v1 = v3;
  free(v4);
  return v1;
}

uint64_t __gen2_der_length_BOOLean()
{
  return 1;
}

unint64_t __gen2_der_length_bit_string(void *a1)
{
  return ((unint64_t)(*a1 + 7) >> 3) + 1;
}

uint64_t __gen2_der_copy_general_string(const char **a1, char **a2)
{
  uint64_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0;
  }
  else {
    return 12;
  }
}

uint64_t __gen2_der_copy_integer(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_integer64(void *a1, void *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_unsigned(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_unsigned64(void *a1, void *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_generalized_time(void *a1, void *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_utctime(void *a1, void *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_utf8string(const char **a1, char **a2)
{
  uint64_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0;
  }
  else {
    return 12;
  }
}

uint64_t __gen2_der_copy_printable_string(uint64_t a1, unint64_t *a2)
{
  size_t v4 = *(void *)a1 + 1;
  uint64_t result = (uint64_t)malloc_type_malloc(v4, 0xFBB76D0CuLL);
  if (!result) {
    return 12;
  }
  if ((v4 & 0x8000000000000000) != 0
    || (unint64_t v6 = *(void *)a1 + 1, v6 > v4)
    || (*a2 = v6, a2[1] = result, *(void *)a1 > v6)
    || (uint64_t result = (uint64_t)memcpy((void *)result, *(const void **)(a1 + 8), *(void *)a1),
        unint64_t v7 = a2[1],
        v8 = (unsigned char *)(v7 + *(void *)a1),
        (unint64_t)v8 >= v7 + *a2)
    || (unint64_t)v8 < v7)
  {
    __break(0x5519u);
  }
  else
  {
    uint64_t result = 0;
    unsigned char *v8 = 0;
  }
  return result;
}

unint64_t __gen2_der_copy_bmp_string(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t result = (unint64_t)malloc_type_malloc(2 * *(void *)a1, 0x1000040BDFB0063uLL);
  if (result) {
    unint64_t v6 = result + 2 * v4;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = *(void *)a1;
  if (result) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (!v8) {
    return 12;
  }
  if (result > v6 || v7 > (uint64_t)(v6 - result) >> 1 || (*a2 = v7, a2[1] = result, 2 * v7 > 2 * *(void *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), 2 * v7);
    return 0;
  }
  return result;
}

unint64_t __gen2_der_copy_universal_string(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t result = (unint64_t)malloc_type_malloc(4 * *(void *)a1, 0x100004052888210uLL);
  if (result) {
    unint64_t v6 = result + 4 * v4;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = *(void *)a1;
  if (result) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (!v8) {
    return 12;
  }
  if (result > v6 || v7 > (uint64_t)(v6 - result) >> 2 || (*a2 = v7, a2[1] = result, 4 * v7 > 4 * *(void *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), 4 * v7);
    return 0;
  }
  return result;
}

uint64_t __gen2_der_copy_visible_string(const char **a1, char **a2)
{
  uint64_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0;
  }
  else {
    return 12;
  }
}

unint64_t __gen2_der_copy_octet_string(uint64_t a1, size_t *a2)
{
  if (*(void *)(a1 + 8))
  {
    size_t v4 = *(void *)a1;
    unint64_t result = (unint64_t)malloc_type_malloc(*(void *)a1, 0xE7E96A63uLL);
    size_t v6 = *(void *)a1;
    if (*(void *)a1) {
      BOOL v7 = result == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      return 12;
    }
    else
    {
      unint64_t v8 = result + v4;
      if (!result) {
        unint64_t v8 = 0;
      }
      BOOL v9 = v8 >= result;
      size_t v10 = v8 - result;
      BOOL v11 = !v9 || v6 > v10;
      if (v11 || (*a2 = v6, a2[1] = result, v6 > *(void *)a1))
      {
        __break(0x5519u);
      }
      else
      {
        memcpy((void *)result, *(const void **)(a1 + 8), v6);
        return 0;
      }
    }
  }
  else
  {
    unint64_t result = 0;
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

unint64_t __gen2_der_copy_heim_integer(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a1;
  unint64_t result = (unint64_t)malloc_type_malloc(*(void *)a1, 0xC932F669uLL);
  size_t v6 = *(void *)a1;
  if (result) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (!v7) {
    return 12;
  }
  unint64_t v8 = result + v4;
  if (!result) {
    unint64_t v8 = 0;
  }
  BOOL v9 = v8 >= result;
  size_t v10 = v8 - result;
  BOOL v11 = !v9 || v6 > v10;
  if (v11 || (*(void *)a2 = v6, *(void *)(a2 + 8) = result, v6 > *(void *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v6);
    unint64_t result = 0;
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  }
  return result;
}

unint64_t __gen2_der_copy_oid(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t result = (unint64_t)malloc_type_malloc(4 * *(void *)a1, 0x100004052888210uLL);
  if (result) {
    unint64_t v6 = result + 4 * v4;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = *(void *)a1;
  if (result) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (!v8) {
    return 12;
  }
  if (result > v6 || v7 > (uint64_t)(v6 - result) >> 2 || (*a2 = v7, a2[1] = result, 4 * v7 > 4 * *(void *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), 4 * v7);
    return 0;
  }
  return result;
}

unint64_t __gen2_der_copy_bit_string(uint64_t a1, void *a2)
{
  unint64_t v4 = *(void *)a1 + 7;
  unint64_t v5 = v4 >> 3;
  unint64_t result = (unint64_t)malloc_type_malloc(v4 >> 3, 0xA15C12B6uLL);
  unint64_t v7 = result + (v4 >> 3);
  if (!result) {
    unint64_t v7 = 0;
  }
  if (v4 >= 8 && result == 0) {
    return 12;
  }
  if (result > v7
    || (unint64_t v9 = (unint64_t)(*(void *)a1 + 7) >> 3, v9 > v7 - result)
    || (*a2 = *(void *)a1, a2[1] = result, v5 > v9)
    || v5 > (unint64_t)(*(void *)a1 + 7) >> 3)
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v4 >> 3);
    return 0;
  }
  return result;
}

unint64_t __gen2_decode_heim_any(unsigned char *a1, unint64_t a2, size_t *a3, void *a4)
{
  unint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  int v13 = 0;
  *a3 = 0;
  a3[1] = 0;
  unint64_t result = __gen2_der_get_tag(a1, a2, (int *)&v14 + 1, (int *)&v14, &v13, (uint64_t *)&v15);
  if (!result)
  {
    unint64_t result = 1859794436;
    if (a2 >= v15)
    {
      unint64_t result = (unint64_t)&a1[v15];
      if (&a1[a2] < &a1[v15] || result < (unint64_t)a1) {
        goto LABEL_23;
      }
      unint64_t result = __gen2_der_get_length((char *)result, a2 - v15, &v16, &v17);
      if (result) {
        return result;
      }
      if (v16 == 3705724653)
      {
        unint64_t result = 1859794436;
        if (a2 < v15 + v17) {
          return result;
        }
        unint64_t v16 = a2 - (v15 + v17);
        size_t v11 = a2;
      }
      else
      {
        size_t v11 = v17 + v16 + v15;
        unint64_t result = 1859794436;
        if (v11 > a2) {
          return result;
        }
      }
      unint64_t result = (unint64_t)malloc_type_malloc(v11, 0xEA45D230uLL);
      if (!result) {
        return 12;
      }
      if ((v11 & 0x8000000000000000) != 0
        || (size_t v12 = v17 + v16 + v15, v12 > v11)
        || (*a3 = v12, a3[1] = result, v12 > a2))
      {
LABEL_23:
        __break(0x5519u);
        return result;
      }
      memcpy((void *)result, a1, v12);
      unint64_t result = 0;
      if (a4) {
        *a4 = v17 + v16 + v15;
      }
    }
  }
  return result;
}

uint64_t __gen2_length_heim_any(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_length_heim_any_set(uint64_t a1)
{
  return *(void *)a1;
}

unint64_t __gen2_der_parse_hex_heim_integer(char *__s, uint64_t a2)
{
  uint64_t v3 = __s;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if (*__s == 45)
  {
    uint64_t v3 = __s + 1;
    *(_DWORD *)(a2 + 16) = 1;
  }
  int64_t v4 = strlen(v3);
  if (v4 <= 0) {
    goto LABEL_15;
  }
  size_t v5 = ((unint64_t)v4 >> 1) + 1;
  unint64_t v6 = malloc_type_malloc(v5, 0xEA67EB40uLL);
  if (!v6)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    return 12;
  }
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v6;
  size_t v7 = rk_hex_decode(v3, v6, v5);
  unint64_t result = *(void *)(a2 + 8);
  if ((v7 & 0x8000000000000000) != 0)
  {
    free((void *)result);
LABEL_15:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    return 22;
  }
  unint64_t v9 = result + *(void *)a2;
  if (v7)
  {
    size_t v10 = (const void *)(result + v7);
    size_t v11 = *(unsigned char **)(a2 + 8);
    while ((unint64_t)v11 < v9 && (unint64_t)v11 >= result)
    {
      if (*v11)
      {
        size_t v10 = v11;
        goto LABEL_18;
      }
      ++v11;
      if (!--v7) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    size_t v10 = *(const void **)(a2 + 8);
LABEL_18:
    if (v7 <= *(void *)a2
      && (unint64_t)v10 <= v9
      && result <= (unint64_t)v10
      && v7 <= v9 - (unint64_t)v10)
    {
      unint64_t result = (unint64_t)memmove((void *)result, v10, v7);
      if (v7 <= *(void *)a2)
      {
        unint64_t result = 0;
        *(void *)a2 = v7;
        return result;
      }
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_print_hex_heim_integer(uint64_t a1, char **a2)
{
  unint64_t v6 = 0;
  if (((unint64_t)rk_hex_encode(*(unsigned char **)(a1 + 8), *(void *)a1, a2) & 0x8000000000000000) != 0) {
    return 12;
  }
  if (*(_DWORD *)(a1 + 16))
  {
    int v4 = asprintf(&v6, "-%s", *a2);
    free(*a2);
    if ((v4 & 0x80000000) == 0)
    {
      uint64_t result = 0;
      *a2 = v6;
      return result;
    }
    return 12;
  }
  return 0;
}

uint64_t __gen2_der_print_heim_oid(unint64_t *a1, char a2, char **a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  __source[0] = a2;
  __source[1] = 0;
  if (!*a1) {
    return 22;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    int v7 = *(_DWORD *)(a1[1] + 4 * v6);
    size_t v8 = v5 + 2;
    do
    {
      unsigned int v9 = v7 + 9;
      v7 /= 10;
      ++v8;
    }
    while (v9 > 0x12);
    unint64_t v5 = v8 - 1;
    ++v6;
  }
  while (v6 != *a1);
  uint64_t result = (uint64_t)malloc_type_malloc(v8, 0x986FF779uLL);
  if (result)
  {
    if (v5 > 0x7FFFFFFFFFFFFFFELL)
    {
      __break(0x5519u);
      return result;
    }
    size_t v11 = (char *)result;
    *(unsigned char *)uint64_t result = 0;
    if (!*a1)
    {
LABEL_15:
      uint64_t result = 0;
      *a3 = v11;
      return result;
    }
    unint64_t v12 = 0;
    while (1)
    {
      snprintf(__str, 0x19uLL, "%d", *(_DWORD *)(a1[1] + 4 * v12));
      if (strlcat(v11, __str, v8) >= v8) {
        break;
      }
      unint64_t v13 = *a1;
      if (v12 < *a1 - 1)
      {
        if (strlcat(v11, __source, v8) >= v8) {
          break;
        }
        unint64_t v13 = *a1;
      }
      if (++v12 >= v13) {
        goto LABEL_15;
      }
    }
    free(v11);
  }
  return 12;
}

uint64_t __gen2_der_parse_heim_oid(const char *a1, const char *a2, uint64_t a3)
{
  __lasts = 0;
  if (a2) {
    int v4 = a2;
  }
  else {
    int v4 = ".";
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  unint64_t v5 = strdup(a1);
  uint64_t v6 = (uint64_t)strtok_r(v5, v4, &__lasts);
  if (v6)
  {
    uint64_t v14 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)a3;
      uint64_t v8 = *(void *)a3 + 1;
      unsigned int v9 = (char *)malloc_type_realloc(*(void **)(a3 + 8), 4 * v8, 0x61F13AC1uLL);
      if (!v9)
      {
        uint64_t v6 = 12;
LABEL_20:
        __gen2_der_free_oid(a3);
        goto LABEL_21;
      }
      size_t v10 = v9;
      uint64_t result = strtol((const char *)v6, &v14, 10);
      uint64_t v6 = 22;
      if (*v14 || result < 0 || result > 0x7FFFFFFF) {
        goto LABEL_20;
      }
      unint64_t v12 = &v10[4 * *(void *)a3];
      if (v12 >= &v10[4 * v8] || v12 < v10) {
        break;
      }
      *(_DWORD *)unint64_t v12 = result;
      if (4 * v8 < 0 || v7 >= (v8 & 0x3FFFFFFFFFFFFFFFuLL)) {
        break;
      }
      *(void *)a3 = v8;
      *(void *)(a3 + 8) = v10;
      uint64_t v6 = (uint64_t)strtok_r(0, v4, &__lasts);
      if (!v6) {
        goto LABEL_21;
      }
    }
    __break(0x5519u);
  }
  else
  {
LABEL_21:
    free(v5);
    return v6;
  }
  return result;
}

unint64_t __gen2_der_put_unsigned(unint64_t result, uint64_t a2, unsigned int *a3, uint64_t *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 <= v6)
  {
    unsigned int v7 = *a3;
    if (*a3)
    {
      uint64_t v8 = 1859794436;
      if (a2)
      {
        unsigned int v9 = (unsigned char *)result;
        do
        {
          if ((unint64_t)v9 >= v6) {
            goto LABEL_26;
          }
          if ((unint64_t)v9 < v5) {
            goto LABEL_26;
          }
          unsigned int v10 = v7;
          *unsigned int v9 = v7;
          if (a2 < 0) {
            goto LABEL_26;
          }
          --v9;
          if (!--a2) {
            break;
          }
          v7 >>= 8;
        }
        while (v10 > 0xFF);
        if (v10 > 0xFF) {
          return v8;
        }
        if ((v10 & 0x80) == 0)
        {
LABEL_18:
          uint64_t v11 = result - (void)v9;
          goto LABEL_23;
        }
        if (!a2) {
          return v8;
        }
        if ((unint64_t)v9 < v6 && (unint64_t)v9 >= v5)
        {
          *v9-- = 0;
          goto LABEL_18;
        }
        goto LABEL_26;
      }
      return v8;
    }
    if (!a2) {
      return 1859794436;
    }
    if (v4 >= 0 && v6 > result)
    {
      *(unsigned char *)uint64_t result = 0;
      uint64_t v11 = 1;
LABEL_23:
      uint64_t v8 = 0;
      *a4 = v11;
      return v8;
    }
  }
LABEL_26:
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_unsigned64(unint64_t result, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 <= v6)
  {
    unint64_t v7 = *a3;
    if (*a3)
    {
      uint64_t v8 = 1859794436;
      if (a2)
      {
        unsigned int v9 = (unsigned char *)result;
        do
        {
          if ((unint64_t)v9 >= v6) {
            goto LABEL_26;
          }
          if ((unint64_t)v9 < v5) {
            goto LABEL_26;
          }
          unint64_t v10 = v7;
          *unsigned int v9 = v7;
          if (a2 < 0) {
            goto LABEL_26;
          }
          --v9;
          if (!--a2) {
            break;
          }
          v7 >>= 8;
        }
        while (v10 > 0xFF);
        if (v10 > 0xFF) {
          return v8;
        }
        if (((char)v10 & 0x80000000) == 0)
        {
LABEL_18:
          uint64_t v11 = result - (void)v9;
          goto LABEL_23;
        }
        if (!a2) {
          return v8;
        }
        if ((unint64_t)v9 < v6 && (unint64_t)v9 >= v5)
        {
          *v9-- = 0;
          goto LABEL_18;
        }
        goto LABEL_26;
      }
      return v8;
    }
    if (!a2) {
      return 1859794436;
    }
    if (v4 >= 0 && v6 > result)
    {
      *(unsigned char *)uint64_t result = 0;
      uint64_t v11 = 1;
LABEL_23:
      uint64_t v8 = 0;
      *a4 = v11;
      return v8;
    }
  }
LABEL_26:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_integer(uint64_t result, uint64_t a2, unsigned int *a3, void *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2) {
    goto LABEL_30;
  }
  unsigned int v7 = *a3;
  if ((*a3 & 0x80000000) != 0)
  {
    unsigned int v10 = ~v7;
    uint64_t v8 = (unsigned char *)result;
    do
    {
      if (!a2) {
        return 1859794436;
      }
      if ((unint64_t)v8 >= v6) {
        goto LABEL_30;
      }
      if ((unint64_t)v8 < v5) {
        goto LABEL_30;
      }
      unsigned int v11 = v10;
      unsigned char *v8 = ~(_BYTE)v10;
      if (a2 < 0) {
        goto LABEL_30;
      }
      --v8;
      --a2;
      v10 >>= 8;
    }
    while (v11 > 0xFF);
    if ((v11 & 0x80) == 0)
    {
LABEL_27:
      uint64_t v12 = 0;
      *a4 = result - (void)v8;
      return v12;
    }
    if (!a2) {
      return 1859794436;
    }
    if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
    {
      *v8-- = -1;
      goto LABEL_27;
    }
LABEL_30:
    __break(0x5519u);
    return result;
  }
  uint64_t v8 = (unsigned char *)result;
  while (a2)
  {
    if ((unint64_t)v8 >= v6) {
      goto LABEL_30;
    }
    if ((unint64_t)v8 < v5) {
      goto LABEL_30;
    }
    unsigned int v9 = v7;
    unsigned char *v8 = v7;
    if (a2 < 0) {
      goto LABEL_30;
    }
    --v8;
    --a2;
    v7 >>= 8;
    if (v9 <= 0xFF)
    {
      if ((v9 & 0x80) == 0) {
        goto LABEL_27;
      }
      if (!a2) {
        return 1859794436;
      }
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        *v8-- = 0;
        goto LABEL_27;
      }
      goto LABEL_30;
    }
  }
  return 1859794436;
}

uint64_t __gen2_der_put_integer64(uint64_t result, uint64_t a2, unint64_t *a3, void *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2) {
    goto LABEL_30;
  }
  unint64_t v7 = *a3;
  if ((*a3 & 0x8000000000000000) != 0)
  {
    unint64_t v11 = ~v7;
    uint64_t v8 = (unsigned char *)result;
    do
    {
      if (!a2) {
        return 1859794436;
      }
      if ((unint64_t)v8 >= v6) {
        goto LABEL_30;
      }
      if ((unint64_t)v8 < v5) {
        goto LABEL_30;
      }
      unsigned char *v8 = ~(_BYTE)v11;
      if (a2 < 0) {
        goto LABEL_30;
      }
      char v12 = v11;
      --v8;
      --a2;
      BOOL v10 = v11 > 0xFF;
      v11 >>= 8;
    }
    while (v10);
    if ((v12 & 0x80000000) == 0)
    {
LABEL_27:
      uint64_t v13 = 0;
      *a4 = result - (void)v8;
      return v13;
    }
    if (!a2) {
      return 1859794436;
    }
    if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
    {
      *v8-- = -1;
      goto LABEL_27;
    }
LABEL_30:
    __break(0x5519u);
    return result;
  }
  uint64_t v8 = (unsigned char *)result;
  while (a2)
  {
    if ((unint64_t)v8 >= v6) {
      goto LABEL_30;
    }
    if ((unint64_t)v8 < v5) {
      goto LABEL_30;
    }
    unsigned char *v8 = v7;
    if (a2 < 0) {
      goto LABEL_30;
    }
    char v9 = v7;
    --v8;
    --a2;
    BOOL v10 = v7 > 0xFF;
    v7 >>= 8;
    if (!v10)
    {
      if ((v9 & 0x80000000) == 0) {
        goto LABEL_27;
      }
      if (!a2) {
        return 1859794436;
      }
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        *v8-- = 0;
        goto LABEL_27;
      }
      goto LABEL_30;
    }
  }
  return 1859794436;
}

unsigned char *__gen2_der_put_length(unsigned char *result, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (a2) {
    uint64_t v4 = a2 - 1;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = &result[-v4];
  unint64_t v6 = &result[a2 - v4];
  if (&result[-v4] <= v6)
  {
    uint64_t v7 = 1859794436;
    if (!a2) {
      return (unsigned char *)v7;
    }
    if (a3 >= 0x80)
    {
      uint64_t v9 = 0;
      while (1 - a2 != v9)
      {
        BOOL v10 = &result[v9];
        if (&result[v9] >= v6) {
          goto LABEL_24;
        }
        if (v10 < v5) {
          goto LABEL_24;
        }
        *BOOL v10 = a3;
        if (~a2 == v9) {
          goto LABEL_24;
        }
        --v9;
        BOOL v11 = a3 > 0xFF;
        a3 >>= 8;
        if (!v11)
        {
          if (&result[v9] >= v6 || &result[v9] < v5) {
            goto LABEL_24;
          }
          result[v9] = -(char)v9 | 0x80;
          if (a4)
          {
            uint64_t v8 = 1 - v9;
            goto LABEL_21;
          }
          return 0;
        }
      }
      return (unsigned char *)v7;
    }
    if ((-v4 < 0 || v4 == 0) && v6 > result)
    {
      *uint64_t result = a3;
      uint64_t v8 = 1;
LABEL_21:
      uint64_t v7 = 0;
      *a4 = v8;
      return (unsigned char *)v7;
    }
  }
LABEL_24:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_BOOLean(char *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  if (!a2) {
    return 1859794436;
  }
  uint64_t result = 0;
  if (*a3) {
    char v6 = -1;
  }
  else {
    char v6 = 0;
  }
  *a1 = v6;
  *a4 = 1;
  return result;
}

unint64_t __gen2_der_put_general_string(unint64_t result, size_t a2, const char **a3, size_t *a4)
{
  size_t v4 = a2 - 1;
  if (!a2) {
    size_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 > v6) {
    goto LABEL_17;
  }
  unint64_t v9 = result;
  BOOL v10 = *a3;
  size_t v11 = strlen(*a3);
  if (v11 > a2) {
    return 1859794436;
  }
  size_t v12 = v11;
  uint64_t result = v9 - v11 + 1;
  BOOL v13 = v10 > &v10[v12] || result > v6;
  BOOL v14 = !v13 && result >= v5;
  if (!v14 || v12 > v6 - result)
  {
LABEL_17:
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, v10, v12);
    uint64_t result = 0;
    *a4 = v12;
  }
  return result;
}

unint64_t __gen2_der_put_octet_string(unint64_t result, size_t a2, uint64_t a3, size_t *a4)
{
  size_t v4 = a2 - 1;
  if (!a2) {
    size_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 <= v5 + a2)
  {
    size_t v8 = *(void *)a3;
    if (v8 > a2) {
      return 1859794436;
    }
    if (!v8)
    {
      size_t v12 = 0;
      goto LABEL_17;
    }
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t result = result - v8 + 1;
      BOOL v10 = result <= v6 && result >= v5;
      if (v10 && v8 <= v6 - result)
      {
        memcpy((void *)result, *(const void **)(a3 + 8), v8);
        size_t v12 = *(void *)a3;
LABEL_17:
        uint64_t result = 0;
        *a4 = v12;
        return result;
      }
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_bmp_string(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2)
  {
LABEL_30:
    __break(0x5519u);
    return result;
  }
  unint64_t v7 = *a3;
  if (*a3 > a2 >> 1) {
    return 1859794436;
  }
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    BOOL v10 = (unsigned char *)(result - 2 * v7 + 2);
    while (1)
    {
      size_t v11 = v10 - 1;
      if ((unint64_t)(v10 - 1) >= v6 || (unint64_t)v11 < v5) {
        goto LABEL_30;
      }
      *size_t v11 = *(unsigned char *)(a3[1] + 2 * v9 + 1);
      unint64_t v13 = a3[1];
      BOOL v14 = v13 + v8 < v13 + 2 * *a3 && v13 + v8 >= v13;
      BOOL v15 = !v14 || (unint64_t)v10 >= v6;
      if (v15 || (unint64_t)v10 < v5) {
        goto LABEL_30;
      }
      *BOOL v10 = *(unsigned char *)(v13 + 2 * v9);
      v10 += 2;
      ++v9;
      v8 += 2;
      if (v9 >= *a3)
      {
        uint64_t v17 = 2 * *a3;
        goto LABEL_27;
      }
    }
  }
  uint64_t v17 = 0;
LABEL_27:
  uint64_t result = 0;
  if (a4) {
    *a4 = v17;
  }
  return result;
}

uint64_t __gen2_der_put_universal_string(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2)
  {
LABEL_45:
    __break(0x5519u);
    return result;
  }
  unint64_t v7 = *a3;
  if (*a3 > a2 >> 2) {
    return 1859794436;
  }
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = result - 4 * v7;
    while (1)
    {
      size_t v11 = (unsigned char *)(v10 + v8 + 1);
      if ((unint64_t)v11 >= v6 || (unint64_t)v11 < v5) {
        goto LABEL_45;
      }
      *size_t v11 = *(unsigned char *)(a3[1] + v8 + 3);
      unint64_t v13 = a3[1];
      unint64_t v14 = v13 + v8;
      BOOL v15 = v13 + v8 < v13 + 4 * *a3 && v14 >= v13;
      uint64_t v16 = (unsigned char *)(v10 + v8 + 2);
      BOOL v17 = !v15 || (unint64_t)v16 >= v6;
      if (v17 || (unint64_t)v16 < v5) {
        goto LABEL_45;
      }
      *uint64_t v16 = *(_WORD *)(v14 + 2);
      unint64_t v19 = a3[1];
      v20 = (_DWORD *)(v19 + v8);
      BOOL v21 = v19 + v8 < v19 + 4 * *a3 && (unint64_t)v20 >= v19;
      v22 = (unsigned char *)(v10 + v8 + 3);
      BOOL v23 = !v21 || (unint64_t)v22 >= v6;
      if (v23 || (unint64_t)v22 < v5) {
        goto LABEL_45;
      }
      unsigned char *v22 = BYTE1(*v20);
      unint64_t v25 = a3[1];
      v26 = (_DWORD *)(v25 + v8);
      if (v25 + v8 >= v25 + 4 * *a3) {
        goto LABEL_45;
      }
      if ((unint64_t)v26 < v25) {
        goto LABEL_45;
      }
      v27 = (unsigned char *)(v10 + v8 + 4);
      if ((unint64_t)v27 >= v6 || (unint64_t)v27 < v5) {
        goto LABEL_45;
      }
      unsigned char *v27 = *v26;
      ++v9;
      v8 += 4;
      if (v9 >= *a3)
      {
        uint64_t v28 = 4 * *a3;
        goto LABEL_42;
      }
    }
  }
  uint64_t v28 = 0;
LABEL_42:
  uint64_t result = 0;
  if (a4) {
    *a4 = v28;
  }
  return result;
}

unint64_t __gen2_der_put_heim_integer(unint64_t result, size_t a2, uint64_t a3, uint64_t *a4)
{
  size_t v4 = a2 - 1;
  if (!a2) {
    size_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 > v6) {
    goto LABEL_54;
  }
  uint64_t v10 = -(uint64_t)v4;
  size_t v11 = *(void *)a3;
  if (!*(void *)a3)
  {
    if (a2)
    {
      if (v10 > 0 || v6 <= result) {
        goto LABEL_54;
      }
      *(unsigned char *)uint64_t result = 0;
      if (a4)
      {
        uint64_t v15 = 1;
LABEL_46:
        uint64_t v12 = 0;
        *a4 = v15;
        return v12;
      }
      return 0;
    }
    return 1859794436;
  }
  uint64_t v12 = 1859794436;
  if (v11 > a2) {
    return v12;
  }
  unint64_t v13 = *(unsigned __int8 **)(a3 + 8);
  if (!*(_DWORD *)(a3 + 16))
  {
    v22 = (unsigned char *)(result - v11);
    BOOL v23 = (char *)(result - v11 + 1);
    if (v6 < (unint64_t)v23 || (unint64_t)v23 < v5 || v11 > v6 - (unint64_t)v23) {
      goto LABEL_54;
    }
    uint64_t result = (unint64_t)memcpy((void *)(result - v11 + 1), v13, *(void *)a3);
    if ((unint64_t)v23 >= v6) {
      goto LABEL_54;
    }
    if (*v23 < 0)
    {
      if (v11 == a2) {
        return v12;
      }
      if ((unint64_t)v22 >= v6 || (unint64_t)v22 < v5) {
        goto LABEL_54;
      }
      unsigned char *v22 = 0;
LABEL_51:
      uint64_t v14 = 1;
      if (!a4) {
        return 0;
      }
LABEL_45:
      uint64_t v15 = *(void *)a3 + v14;
      goto LABEL_46;
    }
LABEL_44:
    uint64_t v14 = 0;
    if (a4) {
      goto LABEL_45;
    }
    return 0;
  }
  if (v11 == 1 && *v13 == 1)
  {
    if (v10 <= 0 && v6 > result)
    {
      uint64_t v14 = 0;
      *(unsigned char *)uint64_t result = -1;
      if (!a4) {
        return 0;
      }
      goto LABEL_45;
    }
  }
  else
  {
    uint64_t v16 = v13 - 1;
    BOOL v17 = 1;
    size_t v18 = *(void *)a3;
    while (1)
    {
      unint64_t v19 = &v16[v18];
      BOOL v20 = &v16[v18] < &v13[v11] && v19 >= v13;
      if (!v20 || result >= v6 || result < v5) {
        break;
      }
      int v21 = *v19;
      LOBYTE(v19) = ~(_BYTE)v21;
      *(unsigned char *)uint64_t result = ~(_BYTE)v21;
      if (v17)
      {
        LODWORD(v19) = -v21;
        *(unsigned char *)uint64_t result = -(char)v21;
        BOOL v17 = v21 == 0;
      }
      --v18;
      --result;
      if (v18 + 1 <= 1)
      {
        if ((v19 & 0x80) != 0) {
          goto LABEL_44;
        }
        if (v11 == a2) {
          return v12;
        }
        if (result < v6 && result >= v5)
        {
          *(unsigned char *)uint64_t result = -1;
          goto LABEL_51;
        }
        break;
      }
    }
  }
LABEL_54:
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_generalized_time(unint64_t a1, size_t a2, uint64_t *a3, void *a4)
{
  uint64_t v10 = 0;
  size_t v11 = 0;
  unint64_t v7 = __gen2_heim_time2generalizedtime(*a3, &v10, 1);
  if (!v7)
  {
    size_t v9 = 0;
    unint64_t v7 = __gen2_der_put_octet_string(a1, a2, (uint64_t)&v10, &v9);
    free(v11);
    if (!v7)
    {
      unint64_t v7 = 0;
      if (a4) {
        *a4 = v9;
      }
    }
  }
  return v7;
}

uint64_t __gen2_heim_time2generalizedtime(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  if (a3) {
    uint64_t v5 = 15;
  }
  else {
    uint64_t v5 = 13;
  }
  *a2 = 0;
  a2[1] = 0;
  if (!__gen2_der_gmtime(a1, (uint64_t)&v8)) {
    return 1859794432;
  }
  unint64_t v6 = (char *)malloc_type_malloc(v5 + 1, 0x63EB7E03uLL);
  if (!v6) {
    return 12;
  }
  *a2 = v5;
  a2[1] = (uint64_t)v6;
  if (a3) {
    snprintf(v6, v5 + 1, "%04d%02d%02d%02d%02d%02dZ", (DWORD1(v9) + 1900));
  }
  else {
    snprintf(v6, v5 + 1, "%02d%02d%02d%02d%02d%02dZ", (SDWORD1(v9) % 100));
  }
  return 0;
}

unint64_t __gen2_der_put_utctime(unint64_t a1, size_t a2, uint64_t *a3, void *a4)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v7 = __gen2_heim_time2generalizedtime(*a3, &v10, 0);
  if (!v7)
  {
    size_t v9 = 0;
    unint64_t v7 = __gen2_der_put_octet_string(a1, a2, (uint64_t)&v10, &v9);
    free(v11);
    if (!v7)
    {
      unint64_t v7 = 0;
      if (a4) {
        *a4 = v9;
      }
    }
  }
  return v7;
}

uint64_t __gen2_der_put_oid(uint64_t result, unint64_t a2, void *a3, void *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2) {
    goto LABEL_37;
  }
  unint64_t v7 = *a3 - 1;
  long long v8 = (unsigned char *)result;
  while (v7 >= 2)
  {
    unint64_t v9 = a3[1];
    uint64_t v10 = (unsigned int *)(v9 + 4 * v7);
    BOOL v11 = (unint64_t)v10 < v9 + 4 * *a3 && (unint64_t)v10 >= v9;
    if (!v11) {
      goto LABEL_37;
    }
    if (!a2) {
      return 1859794436;
    }
    if ((unint64_t)v8 >= v6) {
      goto LABEL_37;
    }
    if ((unint64_t)v8 < v5) {
      goto LABEL_37;
    }
    unsigned int v12 = *v10;
    unsigned char *v8 = v12 & 0x7F;
    if ((a2 & 0x8000000000000000) != 0) {
      goto LABEL_37;
    }
    --v8;
    --a2;
    while (v12 >= 0x80)
    {
      if (!a2) {
        return 1859794436;
      }
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        v12 >>= 7;
        *v8-- = v12 | 0x80;
        BOOL v11 = a2 - 1 >= a2;
        --a2;
        if (!v11) {
          continue;
        }
      }
      goto LABEL_37;
    }
    --v7;
  }
  if (!a2) {
    return 1859794436;
  }
  if (*a3)
  {
    unint64_t v13 = (_DWORD *)a3[1];
    BOOL v14 = v13 + 1 >= &v13[*a3] || (unint64_t)v8 >= v6;
    if (!v14 && (unint64_t)v8 >= v5)
    {
      uint64_t v16 = 0;
      unsigned char *v8 = v13[1] + 40 * *v13;
      *a4 = result - (void)v8 + 1;
      return v16;
    }
  }
LABEL_37:
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_tag(unint64_t result, uint64_t a2, char a3, char a4, unsigned int a5, uint64_t *a6)
{
  if (a2) {
    uint64_t v6 = a2 - 1;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = result - v6;
  unint64_t v8 = result - v6 + a2;
  if (result - v6 > v8) {
    goto LABEL_22;
  }
  if (a5 >= 0x1F)
  {
    uint64_t v10 = 0;
    char v11 = 0;
    while (-a2 != v10)
    {
      unsigned int v12 = (unsigned char *)(result + v10);
      if (result + v10 >= v8) {
        goto LABEL_22;
      }
      if ((unint64_t)v12 < v7) {
        goto LABEL_22;
      }
      *unsigned int v12 = a5 & 0x7F | v11;
      if (~a2 == v10) {
        goto LABEL_22;
      }
      --v10;
      char v11 = 0x80;
      BOOL v13 = a5 > 0x7F;
      a5 >>= 7;
      if (!v13)
      {
        if (!(a2 + v10)) {
          return 1859794436;
        }
        BOOL v14 = (unsigned char *)(result + v10);
        if (result + v10 < v8 && (unint64_t)v14 >= v7)
        {
          *BOOL v14 = (32 * a4) | (a3 << 6) | 0x1F;
          uint64_t v9 = 1 - v10;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
    return 1859794436;
  }
  if (!a2) {
    return 1859794436;
  }
  if (v6 < 0 || v8 <= result)
  {
LABEL_22:
    __break(0x5519u);
    return result;
  }
  *(unsigned char *)uint64_t result = (32 * a4) | (a3 << 6) | a5;
  uint64_t v9 = 1;
LABEL_21:
  uint64_t result = 0;
  *a6 = v9;
  return result;
}

unsigned char *__gen2_der_put_length_and_tag(unsigned char *result, unint64_t a2, unint64_t a3, char a4, char a5, unsigned int a6, void *a7)
{
  unint64_t v7 = a2 - 1;
  if (!a2) {
    unint64_t v7 = 0;
  }
  if (&result[-v7] > &result[a2 - v7]) {
    goto LABEL_9;
  }
  BOOL v13 = result;
  unint64_t v15 = 0;
  uint64_t result = __gen2_der_put_length(result, a2, a3, (uint64_t *)&v15);
  if (result) {
    return result;
  }
  unint64_t v14 = v15;
  if (a2 < v15)
  {
LABEL_9:
    __break(0x5519u);
    return result;
  }
  uint64_t result = (unsigned char *)__gen2_der_put_tag((unint64_t)&v13[-v15], a2 - v15, a4, a5, a6, (uint64_t *)&v15);
  if (!result) {
    *a7 = v15 + v14;
  }
  return result;
}

unint64_t __gen2_der_put_bit_string(unint64_t result, unint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 > v6) {
    goto LABEL_28;
  }
  unint64_t v8 = (unint64_t)(*(void *)a3 + 7) >> 3;
  if (v8 >= a2) {
    return 1859794436;
  }
  uint64_t result = a2 + v5 - v8;
  BOOL v9 = v6 >= result && result >= v5;
  if (!v9 || v8 > v6 - result) {
    goto LABEL_28;
  }
  uint64_t v12 = a2 + v5 + ~v8 - 1;
  uint64_t result = (unint64_t)memcpy((void *)result, *(const void **)(a3 + 8), (unint64_t)(*(void *)a3 + 7) >> 3);
  if (!*(void *)a3 || (uint64_t v13 = *(void *)a3 & 7) == 0)
  {
    uint64_t v16 = (unsigned char *)(v12 + 1);
    if (v12 + 1 >= v6 || (unint64_t)v16 < v5) {
      goto LABEL_28;
    }
    *uint64_t v16 = 0;
LABEL_27:
    uint64_t result = 0;
    *a4 = v8 + 1;
    return result;
  }
  unint64_t v14 = (unsigned char *)(v12 + 1);
  if (v12 + 1 < v6 && (unint64_t)v14 >= v5)
  {
    *unint64_t v14 = 8 - v13;
    goto LABEL_27;
  }
LABEL_28:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_heim_der_set_sort(size_t *a1, size_t *a2)
{
  size_t v3 = *a1;
  unint64_t v2 = (const void *)a1[1];
  size_t v5 = *a2;
  unint64_t v4 = (const void *)a2[1];
  if (v3 >= v5) {
    size_t v6 = v5;
  }
  else {
    size_t v6 = v3;
  }
  LODWORD(result) = memcmp(v2, v4, v6);
  if (result) {
    return result;
  }
  else {
    return (v3 - v5);
  }
}

char *__gen2_der_get_class_name(unsigned int a1)
{
  if (a1 <= 3) {
    return class_names[a1];
  }
  else {
    return 0;
  }
}

uint64_t __gen2_der_get_class_num(char *a1)
{
  uint64_t v2 = 0;
  while (1)
  {
    size_t v3 = class_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1)) {
        break;
      }
    }
    if (++v2 == 4) {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

char *__gen2_der_get_type_name(unsigned int a1)
{
  if (a1 <= 1) {
    return type_names[a1];
  }
  else {
    return 0;
  }
}

uint64_t __gen2_der_get_type_num(char *a1)
{
  uint64_t v2 = 0;
  while (1)
  {
    size_t v3 = type_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1)) {
        break;
      }
    }
    if (++v2 == 2) {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

char *__gen2_der_get_tag_name(unsigned int a1)
{
  if (a1 <= 0x1E) {
    return tag_names[a1];
  }
  else {
    return 0;
  }
}

uint64_t __gen2_der_get_tag_num(char *a1)
{
  uint64_t v2 = 0;
  while (1)
  {
    size_t v3 = tag_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1)) {
        break;
      }
    }
    if (++v2 == 31) {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t __gen2_der_timegm(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 20);
  if (v1 > 2000) {
    return 0;
  }
  if (v1 < 0) {
    return -1;
  }
  uint64_t v2 = *(unsigned int *)(result + 16);
  if (v2 > 0xB) {
    return -1;
  }
  uint64_t v3 = *(int *)(result + 12);
  if ((int)v3 < 1) {
    return -1;
  }
  int v4 = v1 + 1900;
  int v5 = *(_DWORD *)(result + 20) & 3;
  if ((v1 & 3) != 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    HIDWORD(v7) = -1030792151 * (unsigned __int16)(v1 + 1900);
    LODWORD(v7) = HIDWORD(v7);
    if ((v7 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v8) = -1030792151 * (unsigned __int16)(v1 + 1900);
      LODWORD(v8) = HIDWORD(v8);
      BOOL v6 = (v8 >> 4) < 0xA3D70B;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  BOOL v9 = (char *)&ndays + 48 * v6;
  uint64_t v10 = &v9[4 * v2];
  if (v10 >= v9 + 48 || v10 < v9) {
    goto LABEL_49;
  }
  if ((int)v3 > *(_DWORD *)v10) {
    return -1;
  }
  uint64_t v12 = *(int *)(result + 8);
  if (v12 > 0x17) {
    return -1;
  }
  uint64_t v13 = *(int *)(result + 4);
  if (v13 > 0x3B) {
    return -1;
  }
  uint64_t v14 = *(int *)result;
  if (v14 > 0x3C) {
    return -1;
  }
  if (v1 < 0x47)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    int v16 = 70;
    int v17 = -1970;
    unsigned int v18 = 1970;
    do
    {
      if ((v16 & 3) == 0 && (!(v17 + 100 * (v18 / 0x64)) ? (BOOL v19 = v17 + 400 * (v18 / 0x190) == 0) : (BOOL v19 = 1), v19)) {
        uint64_t v20 = 366;
      }
      else {
        uint64_t v20 = 365;
      }
      v15 += v20;
      ++v16;
      --v17;
      ++v18;
    }
    while (v1 != v16);
  }
  if ((int)v2 < 1) {
    return v14 + 60 * (v13 + 60 * (v12 + 24 * (v3 + v15)) - 1440);
  }
  HIDWORD(v21) = -1030792151 * v4;
  LODWORD(v21) = -1030792151 * v4;
  uint64_t result = 42949672;
  BOOL v22 = (v21 >> 2) > 0x28F5C28;
  HIDWORD(v21) = -1030792151 * v4;
  LODWORD(v21) = -1030792151 * v4;
  unsigned int v23 = v21 >> 4;
  unsigned int v26 = (v22 || v23 < 0xA3D70B) && v5 == 0;
  v27 = (char *)&ndays + 48 * v26;
  for (i = v27; i < v27 + 48 && i >= v27; i += 4)
  {
    unsigned int v29 = *(_DWORD *)i;
    v15 += v29;
    if (!--v2) {
      return v14 + 60 * (v13 + 60 * (v12 + 24 * (v3 + v15)) - 1440);
    }
  }
LABEL_49:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_gmtime(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  uint64_t v4 = a1 / 86400;
  int v5 = a1 % 86400;
  int v6 = v5 % 60;
  int v7 = v5 / 3600;
  unsigned int v8 = v5 % 3600 + ((-30583 * (v5 % 3600)) >> 16);
  *(void *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_DWORD *)a2 = v6;
  *(_DWORD *)(a2 + 4) = ((__int16)v8 >> 5) + ((unsigned __int16)(v8 & 0x8000) >> 15);
  *(_DWORD *)(a2 + 8) = v7;
  if (a1 <= 0xEAF63A97FLL)
  {
    int v9 = 0;
    *(_DWORD *)(a2 + 20) = 70;
    int v10 = -1970;
    for (unsigned int i = 1970; ; ++i)
    {
      if ((((_BYTE)v9 + 70) & 3) == 0
        && (!(v10 + 100 * (i / 0x64)) ? (BOOL v12 = v10 + 400 * (i / 0x190) == 0) : (BOOL v12 = 1), v12))
      {
        uint64_t v13 = 366;
      }
      else
      {
        uint64_t v13 = 365;
      }
      BOOL v14 = __OFSUB__(v4, v13);
      uint64_t v15 = v4 - v13;
      if (v15 < 0 != v14) {
        break;
      }
      *(_DWORD *)(a2 + 20) = v9 + 71;
      --v10;
      ++v9;
      uint64_t v4 = v15;
    }
    BOOL v12 = v10 + 100 * (i / 0x64) == 0;
    unsigned int v16 = v10 + 400 * (i / 0x190);
    unsigned int v19 = (!v12 || v16 == 0) && (((_BYTE)v9 + 70) & 3) == 0;
    uint64_t v20 = (char *)&ndays + 48 * v19;
    *(_DWORD *)(a2 + 16) = 0;
    unint64_t v21 = (unint64_t)(v20 + 4);
    int v22 = 1;
    while (1)
    {
      uint64_t v23 = *(unsigned int *)(v21 - 4);
      BOOL v14 = __OFSUB__(v4, v23);
      uint64_t v24 = v4 - v23;
      if (v24 < 0 != v14) {
        break;
      }
      *(_DWORD *)(a2 + 16) = v22;
      if (v21 < (unint64_t)(v20 + 48))
      {
        ++v22;
        uint64_t v4 = v24;
        BOOL v25 = v21 >= (unint64_t)v20;
        v21 += 4;
        if (v25) {
          continue;
        }
      }
      __break(0x5519u);
      break;
    }
    *(_DWORD *)(a2 + 12) = v4 + 1;
    return a2;
  }
  return result;
}

uint64_t __gen2_der_get_unsigned(unsigned char *a1, unint64_t a2, int *a3, unint64_t *a4)
{
  uint64_t v4 = 1859794437;
  if (a2 == 5)
  {
    if (*a1) {
      return v4;
    }
  }
  else
  {
    if (a2 > 4) {
      return v4;
    }
    if (!a2)
    {
      int v5 = 0;
      goto LABEL_10;
    }
  }
  int v5 = 0;
  unint64_t v6 = a2;
  do
  {
    int v7 = *a1++;
    int v5 = v7 | (v5 << 8);
    --v6;
  }
  while (v6);
LABEL_10:
  *a3 = v5;
  uint64_t v4 = 0;
  if (a4) {
    *a4 = a2;
  }
  return v4;
}

uint64_t __gen2_der_get_unsigned64(unsigned char *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4 = 1859794437;
  if (a2 == 9)
  {
    if (*a1) {
      return v4;
    }
  }
  else
  {
    if (a2 > 8) {
      return v4;
    }
    if (!a2)
    {
      unint64_t v5 = 0;
      goto LABEL_10;
    }
  }
  unint64_t v5 = 0;
  unint64_t v6 = a2;
  do
  {
    unsigned int v7 = *a1++;
    unint64_t v5 = v7 | (v5 << 8);
    --v6;
  }
  while (v6);
LABEL_10:
  *a3 = v5;
  uint64_t v4 = 0;
  if (a4) {
    *a4 = a2;
  }
  return v4;
}

uint64_t __gen2_der_get_integer(unsigned char *a1, unint64_t a2, int *a3, unint64_t *a4)
{
  if (a2 == 5)
  {
    int v4 = *a1;
    if (*a1 && v4 != 255) {
      return 1859794437;
    }
  }
  else
  {
    if (a2 > 4) {
      return 1859794437;
    }
    if (!a2) {
      goto LABEL_17;
    }
    LOBYTE(v4) = *a1;
  }
  unint64_t v6 = a1 + 1;
  if (a1 + 1 >= a1 && v6 <= &a1[a2])
  {
    int v4 = (char)v4;
    unint64_t v7 = a2 - 1;
    while (v7)
    {
      if (v6 + 1 <= &a1[a2])
      {
        int v4 = *v6 | (v4 << 8);
        --v7;
        BOOL v8 = v6 >= v6 + 1;
        ++v6;
        if (!v8) {
          continue;
        }
      }
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_16:
  __break(0x5519u);
LABEL_17:
  int v4 = 0;
LABEL_18:
  *a3 = v4;
  uint64_t result = 0;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

uint64_t __gen2_der_get_integer64(char *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (a2 > 8) {
    return 1859794437;
  }
  if (a2)
  {
    unint64_t v5 = (unsigned __int8 *)(a1 + 1);
    if (a1 + 1 >= a1 && v5 <= (unsigned __int8 *)&a1[a2])
    {
      unint64_t v6 = *a1;
      unint64_t v7 = a2 - 1;
      while (v7)
      {
        if (v5 + 1 <= (unsigned __int8 *)&a1[a2])
        {
          unint64_t v6 = *v5 | (v6 << 8);
          --v7;
          BOOL v8 = v5 >= v5 + 1;
          ++v5;
          if (!v8) {
            continue;
          }
        }
        goto LABEL_11;
      }
      goto LABEL_13;
    }
LABEL_11:
    __break(0x5519u);
  }
  unint64_t v6 = 0;
LABEL_13:
  *a3 = v6;
  uint64_t result = 0;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

uint64_t __gen2_der_get_length(char *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v4 = 1859794437;
  if (a2)
  {
    int v6 = *a1;
    unint64_t v5 = a1 + 1;
    uint64_t v7 = v6;
    if ((v6 & 0x80000000) == 0)
    {
      *a3 = v7;
      if (!a4) {
        return 0;
      }
      goto LABEL_7;
    }
    if (v7 == 128)
    {
      *a3 = 3705724653;
      if (a4)
      {
LABEL_7:
        uint64_t v8 = 1;
LABEL_8:
        uint64_t v4 = 0;
        *a4 = v8;
        return v4;
      }
      return 0;
    }
    unint64_t v9 = v7 & 0x7F;
    if (a2 - 1 < v9) {
      return v4;
    }
    if (v9 == 5)
    {
      if (*v5) {
        return v4;
      }
    }
    else
    {
      if (v9 > 4) {
        return v4;
      }
      if (!v9)
      {
        uint64_t v10 = 0;
        goto LABEL_19;
      }
    }
    LODWORD(v10) = 0;
    unint64_t v11 = v9;
    do
    {
      unsigned int v12 = *v5++;
      uint64_t v10 = v12 | (v10 << 8);
      --v11;
    }
    while (v11);
LABEL_19:
    *a3 = v10;
    if (a4)
    {
      uint64_t v8 = v9 + 1;
      goto LABEL_8;
    }
    return 0;
  }
  return v4;
}

uint64_t __gen2_der_get_BOOLean(unsigned __int8 *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  if (!a2) {
    return 1859794437;
  }
  uint64_t result = 0;
  *a3 = *a1 != 0;
  *a4 = 1;
  return result;
}

unint64_t __gen2_der_get_general_string(char *a1, size_t __n, unint64_t *a3, void *a4)
{
  unint64_t result = (unint64_t)memchr(a1, 0, __n);
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v9 = result - (void)a1;
  if (result - (unint64_t)a1 < __n)
  {
    while (1)
    {
      uint64_t v10 = &a1[v9];
      if (&a1[__n] <= &a1[v9] || v10 < a1) {
        break;
      }
      if (*v10) {
        goto LABEL_11;
      }
      if (++v9 >= __n) {
        goto LABEL_12;
      }
    }
LABEL_23:
    __break(0x5519u);
    return result;
  }
LABEL_11:
  if (v9 != __n)
  {
    *a3 = 0;
    return 1859794443;
  }
  else
  {
LABEL_12:
    size_t v12 = __n + 1;
    unint64_t result = (unint64_t)malloc_type_malloc(__n + 1, 0x8F5DE157uLL);
    if (!result)
    {
      *a3 = 0;
      return 12;
    }
    if ((v12 & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    unint64_t v13 = result;
    unint64_t v14 = result + v12;
    unint64_t result = (unint64_t)memcpy((void *)result, a1, __n);
    uint64_t v15 = (unsigned char *)(v13 + __n);
    if (v13 + __n >= v14) {
      goto LABEL_23;
    }
    if ((unint64_t)v15 < v13) {
      goto LABEL_23;
    }
    *uint64_t v15 = 0;
    if (v15 + 1 < v15 || (unint64_t)(v15 + 1) > v14) {
      goto LABEL_23;
    }
    *a3 = v13;
    unint64_t result = 0;
    if (a4) {
      *a4 = __n;
    }
  }
  return result;
}

uint64_t __gen2_der_get_printable_string(const void *a1, size_t a2, size_t *a3, size_t *a4)
{
  if (a2 == -1)
  {
    *a3 = 0;
    a3[1] = 0;
    return 1859794439;
  }
  else
  {
    size_t v8 = a2 + 1;
    uint64_t result = (uint64_t)malloc_type_malloc(a2 + 1, 0xD3AB9DE5uLL);
    if (result)
    {
      if ((v8 & 0x8000000000000000) == 0
        && ((*a3 = v8,
             a3[1] = result,
             uint64_t result = (uint64_t)memcpy((void *)result, a1, a2),
             unint64_t v10 = a3[1],
             unint64_t v11 = (unsigned char *)(v10 + a2),
             v10 + a2 < v10 + *a3)
          ? (BOOL v12 = (unint64_t)v11 >= v10)
          : (BOOL v12 = 0),
            v12))
      {
        *unint64_t v11 = 0;
        uint64_t result = 0;
        if (a4) {
          *a4 = a2;
        }
      }
      else
      {
        __break(0x5519u);
      }
    }
    else
    {
      *a3 = 0;
      a3[1] = 0;
      return 12;
    }
  }
  return result;
}

unint64_t __gen2_der_get_bmp_string(unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (!a2)
  {
    unint64_t result = 0;
LABEL_7:
    *a3 = 0;
    a3[1] = 0;
    return result;
  }
  if (a2)
  {
    unint64_t result = 1859794440;
    goto LABEL_7;
  }
  if (HIDWORD(a2))
  {
    *a3 = 0;
    a3[1] = 0;
    return 34;
  }
  unint64_t result = (unint64_t)malloc_type_malloc(a2 & 0xFFFFFFFFFFFFFFFELL, 0x1000040BDFB0063uLL);
  unint64_t v9 = result + (a2 & 0xFFFFFFFFFFFFFFFELL);
  if (!result) {
    unint64_t v9 = 0;
  }
  if (a2 >= 2 && !result)
  {
    *a3 = 0;
    a3[1] = 0;
    return 12;
  }
  if (result > v9) {
    goto LABEL_39;
  }
  unint64_t v10 = a2 >> 1;
  if (a2 >> 1 > (uint64_t)(v9 - result) >> 1) {
    goto LABEL_39;
  }
  *a3 = v10;
  a3[1] = result;
  if (a2 >= 2)
  {
    uint64_t v11 = 0;
    unint64_t v12 = a1 + a2;
    unint64_t v13 = v10 - 1;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    unint64_t v14 = a1 + 1;
    while (1)
    {
      BOOL v15 = v14 - 1 < v12 && v14 - 1 >= a1;
      BOOL v16 = !v15 || v14 >= v12;
      if (v16 || v14 < a1) {
        break;
      }
      unsigned int v18 = __rev16(*(unsigned __int16 *)(v14 - 1));
      *(_WORD *)(result + 2 * v11) = v18;
      if (v18) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v13 == v11;
      }
      if (!v19)
      {
        free((void *)result);
        *a3 = 0;
        a3[1] = 0;
        return 1859794443;
      }
      ++v11;
      v14 += 2;
      if (v10 == v11) {
        goto LABEL_37;
      }
    }
LABEL_39:
    __break(0x5519u);
    return result;
  }
LABEL_37:
  unint64_t result = 0;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

unint64_t __gen2_der_get_universal_string(unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (!a2)
  {
    unint64_t result = 0;
    goto LABEL_5;
  }
  if ((a2 & 3) != 0)
  {
    unint64_t result = 1859794440;
LABEL_5:
    *a3 = 0;
    a3[1] = 0;
    return result;
  }
  if (HIDWORD(a2))
  {
    *a3 = 0;
    a3[1] = 0;
    return 34;
  }
  unint64_t result = (unint64_t)malloc_type_malloc(a2 & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
  unint64_t v9 = result + (a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (!result) {
    unint64_t v9 = 0;
  }
  if (a2 >= 4 && !result)
  {
    *a3 = 0;
    a3[1] = 0;
    return 12;
  }
  if (result > v9 || (unint64_t v10 = a2 >> 2, a2 >> 2 > (uint64_t)(v9 - result) >> 2))
  {
LABEL_50:
    __break(0x5519u);
    return result;
  }
  *a3 = v10;
  a3[1] = result;
  if (a2 >= 4)
  {
    uint64_t v11 = 0;
    unint64_t v12 = a1 + a2;
    unint64_t v13 = v10 - 1;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    do
    {
      unint64_t v14 = (unsigned __int8 *)(a1 + v11);
      BOOL v15 = a1 + v11 < v12 && (unint64_t)v14 >= a1;
      BOOL v16 = v14 + 1;
      BOOL v17 = !v15 || (unint64_t)v16 >= v12;
      BOOL v18 = !v17 && (unint64_t)v16 >= a1;
      BOOL v19 = v14 + 2;
      BOOL v20 = !v18 || (unint64_t)v19 >= v12;
      BOOL v21 = !v20 && (unint64_t)v19 >= a1;
      int v22 = v14 + 3;
      BOOL v23 = !v21 || (unint64_t)v22 >= v12;
      if (v23 || (unint64_t)v22 < a1) {
        goto LABEL_50;
      }
      int v25 = *v22 | (*v19 << 8) | (*v16 << 16) | (*v14 << 24);
      *(_DWORD *)(result + v11) = v25;
      if (v25) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = v13 == 0;
      }
      if (!v26)
      {
        free((void *)result);
        *a3 = 0;
        a3[1] = 0;
        return 1859794443;
      }
      v11 += 4;
      --v13;
    }
    while (--v10);
  }
  unint64_t result = 0;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

uint64_t __gen2_der_get_octet_string(const void *a1, size_t size, void *a3, void *a4)
{
  if (size)
  {
    uint64_t result = (uint64_t)malloc_type_malloc(size, 0x1E3DEEAEuLL);
    if (!result) {
      return 12;
    }
    if ((size & 0x8000000000000000) != 0)
    {
      __break(0x5519u);
      return result;
    }
    *a3 = size;
    a3[1] = result;
    memcpy((void *)result, a1, size);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = size;
  }
  return result;
}

uint64_t __gen2_der_get_octet_string_ber(unsigned char *a1, unint64_t a2, uint64_t a3, void *a4)
{
  int v27 = 0;
  uint64_t v31 = 0;
  int v30 = 0;
  uint64_t v7 = 1859794438;
  size_t v28 = 0;
  uint64_t v29 = 0;
  unint64_t v8 = a2;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  while (1)
  {
    if (!v8)
    {
      if (v27) {
        return 1859794447;
      }
      goto LABEL_39;
    }
    tag = (char *)__gen2_der_get_tag(a1, v8, (int *)&v31, (int *)&v31 + 1, &v30, &v29);
    if (tag) {
      goto LABEL_31;
    }
    if (v31) {
      goto LABEL_35;
    }
    int v10 = HIDWORD(v31);
    if (!(HIDWORD(v31) | v30)) {
      break;
    }
    if (v30 != 4) {
      goto LABEL_35;
    }
    unint64_t v11 = (unint64_t)&a1[v8];
    unint64_t v12 = &a1[v29];
    unint64_t v13 = v8 - v29;
    if (&a1[v8] < &a1[v29]) {
      goto LABEL_30;
    }
    if (a1 > v12) {
      goto LABEL_30;
    }
    unint64_t v14 = v8 - v29;
    if (v14 > v13) {
      goto LABEL_30;
    }
    tag = (char *)__gen2_der_get_length(&a1[v29], v14, &v28, &v29);
    if (tag) {
      goto LABEL_31;
    }
    a1 = &v12[v29];
    if (v11 < (unint64_t)&v12[v29] || v12 > a1 || (unint64_t v8 = v14 - v29, v8 > v11 - (unint64_t)&v12[v29]))
    {
LABEL_30:
      __break(0x5519u);
LABEL_31:
      uint64_t v7 = (uint64_t)tag;
LABEL_35:
      free(*(void **)(a3 + 8));
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      return v7;
    }
    size_t v15 = v28;
    if (v28 == 3705724653) {
      return 1859794452;
    }
    unint64_t v16 = v8 - v28;
    if (v8 < v28) {
      return 1859794437;
    }
    if (v10)
    {
      ++v27;
      goto LABEL_27;
    }
    size_t v17 = *(void *)a3 + v28;
    if (v17)
    {
      BOOL v18 = (char *)malloc_type_realloc(*(void **)(a3 + 8), *(void *)a3 + v28, 0x52F787E0uLL);
      if (!v18)
      {
        uint64_t v7 = 12;
        goto LABEL_35;
      }
      BOOL v19 = v18;
      BOOL v20 = &v18[v17];
      tag = &v18[*(void *)a3];
      BOOL v21 = v20 >= tag;
      size_t v22 = v20 - tag;
      if (!v21) {
        goto LABEL_30;
      }
      if (v19 > tag) {
        goto LABEL_30;
      }
      if (v15 > v22) {
        goto LABEL_30;
      }
      tag = (char *)memcpy(tag, a1, v15);
      if ((v17 & 0x8000000000000000) != 0) {
        goto LABEL_30;
      }
      size_t v23 = *(void *)a3 + v15;
      if (v23 > v17) {
        goto LABEL_30;
      }
      *(void *)a3 = v23;
      *(void *)(a3 + 8) = v19;
LABEL_27:
      unint64_t v24 = v11 - (void)&a1[v15];
      if (v11 < (unint64_t)&a1[v15]) {
        goto LABEL_30;
      }
      if (a1 > &a1[v15]) {
        goto LABEL_30;
      }
      unint64_t v8 = v16;
      a1 += v15;
      if (v16 > v24) {
        goto LABEL_30;
      }
    }
  }
  if (v27) {
    goto LABEL_35;
  }
LABEL_39:
  uint64_t v7 = 0;
  if (a4) {
    *a4 = a2 - v8;
  }
  return v7;
}

uint64_t __gen2_der_get_tag(unsigned char *a1, uint64_t a2, int *a3, int *a4, _DWORD *a5, uint64_t *a6)
{
  uint64_t result = 1859794437;
  if (a2)
  {
    *a3 = *a1 >> 6;
    *a4 = (*a1 >> 5) & 1;
    int v8 = *a1 & 0x1F;
    *a5 = v8;
    if (v8 == 31)
    {
      unsigned int v9 = 0;
      *a5 = 0;
      uint64_t v10 = 1;
      while (a2 != v10)
      {
        char v11 = a1[v10];
        unsigned int v12 = v11 & 0x7F | (v9 << 7);
        if (v12 < v9) {
          return 1859794436;
        }
        *a5 = v12;
        unint64_t v13 = (unint64_t)&a1[v10 + 1];
        if (v13 > (unint64_t)&a1[a2] || (unint64_t)&a1[v10] > v13)
        {
          __break(0x5519u);
          return result;
        }
        ++v10;
        unsigned int v9 = v12;
        if ((v11 & 0x80000000) == 0) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
LABEL_11:
      uint64_t result = 0;
      if (a6) {
        *a6 = v10;
      }
    }
  }
  return result;
}

unint64_t __gen2_der_get_heim_integer(unsigned __int8 *a1, size_t size, uint64_t a3, size_t *a4)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = 0;
  if (!size)
  {
    unint64_t result = 0;
    if (!a4) {
      return result;
    }
    size_t v6 = 0;
    goto LABEL_35;
  }
  size_t v6 = size;
  int v8 = (char)*a1;
  if ((v8 & 0x80000000) == 0)
  {
    BOOL v10 = size > 1 && v8 == 0;
    size_t v11 = size - v10;
    unsigned int v12 = malloc_type_malloc(size - v10, 0xBAF1374EuLL);
    if (v12)
    {
      *(void *)a3 = v11;
      *(void *)(a3 + 8) = v12;
      memcpy(v12, &a1[v10], v6 - v10);
      goto LABEL_11;
    }
    goto LABEL_34;
  }
  *(_DWORD *)(a3 + 16) = 1;
  size_t v14 = size;
  size_t v15 = (char *)a1;
  if (*a1 != 255)
  {
LABEL_21:
    unint64_t result = (unint64_t)malloc_type_malloc(v14, 0xE077C3E0uLL);
    if (result)
    {
      *(void *)a3 = v14;
      *(void *)(a3 + 8) = result;
      BOOL v18 = (unsigned __int8 *)&v15[v14 - 1];
      if (v18 < (unsigned __int8 *)&v15[v14] && v15 <= (char *)v18)
      {
        BOOL v19 = (unsigned char *)(result + v14 - 1);
        if ((unint64_t)v19 < result)
        {
LABEL_11:
          unint64_t result = 0;
          if (!a4) {
            return result;
          }
          goto LABEL_35;
        }
        BOOL v20 = 1;
        while (v18 < &a1[v6] && v18 >= a1 && (unint64_t)v19 < result + v14 && (unint64_t)v19 >= result)
        {
          int v21 = *v18;
          *BOOL v19 = ~(_BYTE)v21;
          if (v20)
          {
            *BOOL v19 = -(char)v21;
            BOOL v20 = v21 == 0;
          }
          --v18;
          if ((unint64_t)--v19 < *(void *)(a3 + 8)) {
            goto LABEL_11;
          }
        }
      }
      __break(0x5519u);
      return result;
    }
LABEL_34:
    size_t v6 = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    unint64_t result = 12;
    if (!a4) {
      return result;
    }
    goto LABEL_35;
  }
  size_t v14 = size - 1;
  if (size != 1)
  {
    size_t v15 = (char *)(a1 + 1);
    goto LABEL_21;
  }
  unint64_t v16 = malloc_type_malloc(1uLL, 0xE541E682uLL);
  if (!v16) {
    return 12;
  }
  size_t v17 = v16;
  unint64_t result = 0;
  *size_t v17 = 1;
  *(void *)a3 = 1;
  *(void *)(a3 + 8) = v17;
  if (a4) {
LABEL_35:
  }
    *a4 = v6;
  return result;
}

uint64_t __gen2_der_get_time(const void *a1, size_t a2, uint64_t *a3, size_t *a4)
{
  uint64_t v4 = 1859794432;
  if (!a2) {
    return 1859794439;
  }
  size_t v9 = a2 + 1;
  uint64_t result = (uint64_t)malloc_type_malloc(a2 + 1, 0x934C4CDDuLL);
  if (!result) {
    return 12;
  }
  unint64_t v16 = a3;
  if (((v9 | a2) & 0x8000000000000000) == 0)
  {
    size_t v11 = (char *)result;
    unint64_t v12 = result + v9;
    uint64_t result = (uint64_t)memcpy((void *)result, a1, a2);
    unint64_t v13 = &v11[a2];
    if ((unint64_t)&v11[a2] < v12 && v13 >= v11)
    {
      *unint64_t v13 = 0;
      if (v13 + 1 >= v13 && (unint64_t)(v13 + 1) <= v12)
      {
        uint64_t v20 = 0;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v17 = 0u;
        if (sscanf(v11, "%04d%02d%02d%02d%02d%02dZ", (char *)&v18 + 4, &v18, (unint64_t)&v17 | 0xC, (char *)&v17 + 8, (char *)&v17 + 4, &v17) == 6)
        {
          int v14 = DWORD1(v18);
          size_t v15 = v16;
        }
        else
        {
          if (sscanf(v11, "%02d%02d%02d%02d%02d%02dZ", (char *)&v18 + 4, &v18, (unint64_t)&v17 | 0xC, (char *)&v17 + 8, (char *)&v17 + 4, &v17) != 6)goto LABEL_17; {
          size_t v15 = v16;
          }
          if (SDWORD1(v18) > 49) {
            int v14 = DWORD1(v18) + 1900;
          }
          else {
            int v14 = DWORD1(v18) + 2000;
          }
        }
        LODWORD(v18) = v18 - 1;
        DWORD1(v18) = v14 - 1900;
        uint64_t v4 = 0;
        *size_t v15 = __gen2_der_timegm((uint64_t)&v17);
LABEL_17:
        free(v11);
        if (a4) {
          *a4 = a2;
        }
        return v4;
      }
    }
  }
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_get_oid(unsigned char *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4 = 1859794437;
  if (!a2) {
    return v4;
  }
  if (a2 == -1) {
    return 1859794439;
  }
  if (a2 > 0x3FFFFFFE) {
    return 34;
  }
  unint64_t v9 = a2 + 1;
  unint64_t result = (unint64_t)malloc_type_malloc(4 * (a2 + 1), 0x100004052888210uLL);
  if (!result) {
    return 12;
  }
  *a3 = v9;
  a3[1] = result;
  *(_DWORD *)unint64_t result = *a1 / 0x28u;
  size_t v11 = (unsigned int *)(result + 4);
  unint64_t v12 = result + 4 * v9;
  if (result + 4 < v12 && (unint64_t)v11 >= result)
  {
    int v14 = a1 + 1;
    *size_t v11 = *a1 % 0x28u;
    if (a1 + 1 >= a1 && v14 <= &a1[a2])
    {
      unint64_t v15 = 2;
      unint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        while (2)
        {
          unsigned int v17 = 0;
          unint64_t v18 = (unint64_t)&v14[v16];
          long long v19 = &v14[v16 - 1];
          unint64_t v20 = v16 - 1;
          int v21 = v14;
          while (1)
          {
            int v14 = v21 + 1;
            if ((unint64_t)(v21 + 1) > v18 || v21 > v14) {
              goto LABEL_37;
            }
            unint64_t v16 = v20;
            unsigned int v23 = *v21 & 0x7F | (v17 << 7);
            if (v23 < v17) {
              goto LABEL_35;
            }
            if (!v20) {
              break;
            }
            int v24 = (char)*v21;
            --v20;
            unsigned int v17 = *v21++ & 0x7F | (v17 << 7);
            if ((v24 & 0x80000000) == 0)
            {
              long long v19 = v14 - 1;
              goto LABEL_25;
            }
          }
          int v14 = (unsigned char *)v18;
LABEL_25:
          int v25 = (unsigned int *)(result + 4 * v15);
          if ((unint64_t)v25 >= v12 || (unint64_t)v25 < result) {
            goto LABEL_37;
          }
          *int v25 = v23;
          ++v15;
          if (v16) {
            continue;
          }
          break;
        }
        if (v15 >= 3)
        {
          if ((unint64_t)v19 >= v18) {
            goto LABEL_37;
          }
          if (*v19 < 0)
          {
LABEL_35:
            __gen2_der_free_oid((uint64_t)a3);
            return v4;
          }
        }
      }
      if (v15 <= v9)
      {
        *a3 = v15;
        uint64_t v4 = 0;
        if (a4) {
          *a4 = a2;
        }
        return v4;
      }
    }
  }
LABEL_37:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_match_tag(unsigned char *a1, uint64_t a2, int a3, int a4, unsigned int a5, void *a6)
{
  int v9 = 0;
  LODWORD(result) = __gen2_der_match_tag2(a1, a2, a3, &v9, a5, a6);
  if (v9 == a4) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = 1859794438;
  }
  if (result) {
    return result;
  }
  else {
    return v8;
  }
}

uint64_t __gen2_der_match_tag2(unsigned char *a1, uint64_t a2, int a3, int *a4, unsigned int a5, void *a6)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t result = __gen2_der_get_tag(a1, a2, (int *)&v10 + 1, a4, &v10, &v11);
  if (!result)
  {
    uint64_t result = 1859794433;
    if (HIDWORD(v10) == a3)
    {
      if (v10 >= a5)
      {
        if (v10 <= a5)
        {
          uint64_t result = 0;
          if (a6) {
            *a6 = v11;
          }
        }
      }
      else
      {
        return 1859794434;
      }
    }
    else
    {
      return 1859794438;
    }
  }
  return result;
}

char *__gen2_der_match_tag_and_length(char *a1, uint64_t a2, int a3, int *a4, unsigned int a5, void *a6, void *a7)
{
  uint64_t v18 = 0;
  uint64_t result = (char *)__gen2_der_match_tag2(a1, a2, a3, a4, a5, &v18);
  if (!result)
  {
    uint64_t v12 = v18;
    uint64_t result = &a1[v18];
    unint64_t v13 = a2 - v18;
    unint64_t v14 = a2 - v18;
    if (&a1[a2] >= &a1[v18] && result >= a1)
    {
      BOOL v16 = v13 >= v14;
      BOOL v17 = v13 == v14;
    }
    else
    {
      BOOL v16 = 1;
      BOOL v17 = 0;
    }
    if (!v17 && v16)
    {
      __break(0x5519u);
    }
    else
    {
      uint64_t result = (char *)__gen2_der_get_length(result, v13, a6, &v18);
      if (!result)
      {
        uint64_t result = 0;
        if (a7) {
          *a7 = v18 + v12;
        }
      }
    }
  }
  return result;
}

uint64_t __gen2_heim_fix_dce(unint64_t a1, unint64_t *a2)
{
  if (a1 == 3705724653) {
    return 1;
  }
  if (*a2 < a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = a1;
  return result;
}

uint64_t __gen2_der_get_bit_string(unsigned __int8 *a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t result = 1859794437;
  if (a2)
  {
    if (a2 <= 0x2000000000000000)
    {
      uint64_t result = 1859794440;
      if (*a1 <= 7u)
      {
        unint64_t v9 = a2 - 1;
        if (a2 != 1 || !*a1)
        {
          if (a2 != 1)
          {
            uint64_t v10 = malloc_type_malloc(a2 - 1, 0xFB2DB160uLL);
            if (!v10) {
              return 12;
            }
            *a3 = 8 * v9;
            a3[1] = v10;
            memcpy(v10, a1 + 1, a2 - 1);
            uint64_t v11 = *a3 - *a1;
            if ((unint64_t)(v11 + 7) >> 3 <= (unint64_t)(*a3 + 7) >> 3) {
              goto LABEL_11;
            }
            __break(0x5519u);
          }
          uint64_t v11 = 0;
          a3[1] = 0;
LABEL_11:
          *a3 = v11;
          uint64_t result = 0;
          if (a4) {
            *a4 = a2;
          }
        }
      }
    }
  }
  return result;
}

void __gen2_der_free_general_string(void **a1)
{
  *a1 = 0;
}

_DWORD *__gen2_der_free_integer(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *__gen2_der_free_integer64(void *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *__gen2_der_free_unsigned(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *__gen2_der_free_unsigned64(void *result)
{
  *uint64_t result = 0;
  return result;
}

void *__gen2_der_free_generalized_time(void *result)
{
  *uint64_t result = 0;
  return result;
}

void *__gen2_der_free_utctime(void *result)
{
  *uint64_t result = 0;
  return result;
}

void __gen2_der_free_utf8string(void **a1)
{
  *a1 = 0;
}

void __gen2_der_free_printable_string(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void __gen2_der_free_octet_string(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void __gen2_der_free_ia5_string(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void __gen2_der_free_bmp_string(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void __gen2_der_free_universal_string(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void __gen2_der_free_visible_string(void **a1)
{
  *a1 = 0;
}

void __gen2_der_free_heim_integer(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void __gen2_der_free_oid(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void __gen2_der_free_bit_string(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void asn1_abort(char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(crashreporter_info, 0x64uLL, __format, va);
  for (unsigned int i = &crashreporter_info[1]; (unint64_t)i <= 0x26A9A186CLL; ++i)
  {
    if (!*(i - 1))
    {
      __crashreporter_info__ = (uint64_t)crashreporter_info;
      abort();
    }
  }
  __break(0x5519u);
}

uint64_t __gen2_asn1_sizeofType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t __gen2_asn1_bmember_isset_bit(_DWORD *a1, char a2)
{
  return (*a1 >> a2) & 1;
}

unsigned char *__gen2_asn1_bmember_put_bit(unsigned char *result, _DWORD *a2, char a3, uint64_t a4, _DWORD *a5)
{
  if ((*a2 >> a3))
  {
    *result |= 1 << (a3 & 7 ^ 7);
    if (!*a5) {
      *a5 = 8 - (a3 & 7);
    }
  }
  return result;
}

uint64_t __gen2_asn1_decode(unint64_t a1, unsigned int a2, unsigned __int8 *a3, size_t a4, char *a5, size_t *a6)
{
  unint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a1 + 16 * (v6 + 1);
  uint64_t v8 = *(unsigned int *)(a1 + 4);
  LODWORD(v9) = a5 + v8;
  BOOL v10 = &a5[v8] >= a5 && v7 >= a1;
  unint64_t v122 = v6 + 1;
  if (!v10 || v6 + 1 > (uint64_t)(16 * (v6 + 1)) >> 4) {
    goto LABEL_242;
  }
  uint64_t v12 = (_DWORD *)a1;
  uint64_t v9 = a1 + 16;
  unint64_t v119 = a1 + 16 * (v6 + 1);
  if (a1 + 16 > v7) {
    goto LABEL_242;
  }
  if (v9 < a1) {
    goto LABEL_242;
  }
  uint64_t v9 = 16 * v122 - 16;
  if (v6 > v9 >> 4) {
    goto LABEL_242;
  }
  unint64_t v13 = a3;
  size_t v14 = a4;
  unint64_t v15 = &a3[a4];
  int v113 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 1) == 0) {
    unint64_t v15 = 0;
  }
  unint64_t v112 = (unint64_t)v15;
  if (*(_DWORD *)a1) {
    BOOL v16 = a3;
  }
  else {
    BOOL v16 = 0;
  }
  __src = v16;
  if (!v6)
  {
LABEL_209:
    if ((v113 & 2) != 0) {
      size_t v104 = 0;
    }
    else {
      size_t v104 = v14;
    }
    size_t v105 = a4 - v104;
    if (a6) {
      *a6 = v105;
    }
    if (!__src) {
      return 0;
    }
    v106 = malloc_type_malloc(v105, 0xC350CA29uLL);
    if (!v106) {
      return 12;
    }
    if ((v105 & 0x8000000000000000) != 0) {
      goto LABEL_242;
    }
    LODWORD(v9) = a5 + 16;
    if (a5 + 16 > &a5[v8]) {
      goto LABEL_242;
    }
    *(void *)a5 = v105;
    *((void *)a5 + 1) = v106;
    LODWORD(v9) = v112;
    if (v112 < (unint64_t)__src) {
      goto LABEL_242;
    }
    if (v105 > v112 - (unint64_t)__src) {
      goto LABEL_242;
    }
    memcpy(v106, __src, v105);
    if (v105 > *(void *)a5) {
      goto LABEL_242;
    }
    uint64_t result = 0;
    *(void *)a5 = v105;
    return result;
  }
  v116 = a5 + 16;
  unsigned int v118 = a2 & 0xFFFFFFFA;
  int v111 = a2 & 1;
LABEL_18:
  unint64_t v123 = v6;
  LODWORD(v9) = v119;
  if ((unint64_t)(v12 + 8) > v119) {
    goto LABEL_242;
  }
  v121 = v12 + 4;
  LODWORD(v9) = v12[4];
  switch((v9 >> 28) ^ 8)
  {
    case 0u:
      v35 = (unsigned int *)*((void *)v12 + 3);
      uint64_t v36 = *((void *)v35 + 1);
      LODWORD(v9) = v35 + 16;
      unint64_t v37 = (unint64_t)&v35[4 * v36 + 4];
      if ((unint64_t)(v35 + 4) > v37) {
        goto LABEL_242;
      }
      uint64_t v9 = v35[1];
      v38 = &a5[v8];
      v39 = &a5[v9];
      v128[0] = 0;
      if (&a5[v9] >= &a5[v8] || v39 < a5) {
        goto LABEL_242;
      }
      *(_DWORD *)v39 = 1;
      unint64_t v41 = 1;
      if ((unint64_t)(v36 - 1) > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_170;
      }
      while (2)
      {
        v42 = &v35[4 * v41];
        LODWORD(v9) = a5;
        v43 = &a5[v42[1]];
        if (v43)
        {
          if (v43 >= v38 || v43 < a5) {
            goto LABEL_242;
          }
        }
        uint64_t v45 = __gen2_asn1_decode(*((void *)v42 + 1), 0, v13);
        LODWORD(v9) = 35;
        if ((v45 - 1859794433) <= 5 && ((1 << (v45 - 1)) & 0x23) != 0)
        {
          if ((unint64_t)v42 < v37)
          {
            v47 = &v35[4 * v41];
            LODWORD(v9) = a5;
            v48 = &a5[v47[1]];
            if (!v48 || (v48 < v38 ? (BOOL v49 = v48 >= a5) : (BOOL v49 = 0), v49))
            {
              __gen2_asn1_free_top(*((void *)v47 + 1), v48);
              unint64_t v41 = (v41 + 1);
              uint64_t v36 = *((void *)v35 + 1);
              if (v36 + 1 <= v41) {
                goto LABEL_170;
              }
              continue;
            }
          }
          goto LABEL_242;
        }
        break;
      }
      uint64_t v88 = v45;
      if (v45)
      {
        if ((unint64_t)v42 >= v37) {
          goto LABEL_242;
        }
        v107 = &v35[4 * v41];
        LODWORD(v9) = a5;
        v108 = &a5[v107[1]];
        if (v108)
        {
          if (v108 >= v38 || v108 < a5) {
            goto LABEL_242;
          }
        }
        __gen2_asn1_free_top(*((void *)v107 + 1), v108);
      }
      else
      {
        *(_DWORD *)v39 = v41;
        uint64_t v9 = (uint64_t)&v13[v128[0]];
        size_t v89 = v14 - v128[0];
        if (&v13[v14] < &v13[v128[0]]) {
          goto LABEL_242;
        }
        if ((unint64_t)v13 > v9) {
          goto LABEL_242;
        }
        v14 -= v128[0];
        if (v14 > v89) {
          goto LABEL_242;
        }
        uint64_t v36 = *((void *)v35 + 1);
        v13 += v128[0];
LABEL_170:
        if (v36 + 1 > v41) {
          goto LABEL_182;
        }
        if (*v35)
        {
          *(_DWORD *)v39 = -1;
          LODWORD(v9) = a5;
          v90 = &a5[*v35];
          if (v90 && (v90 >= v38 || v90 < a5)) {
            goto LABEL_242;
          }
          uint64_t octet_string = __gen2_der_get_octet_string(v13, v14, v90, v128);
          if (!octet_string)
          {
LABEL_176:
            v78 = &v13[v14];
            uint64_t v9 = v128[0];
LABEL_177:
            v92 = &v13[v9];
            BOOL v10 = v78 >= &v13[v9];
            size_t v93 = v78 - &v13[v9];
            if (!v10) {
              goto LABEL_242;
            }
            goto LABEL_179;
          }
          return octet_string;
        }
        else
        {
          return 1859794438;
        }
      }
      return v88;
    case 9u:
    case 0xAu:
      v128[0] = 0;
      uint64_t v17 = *((void *)v12 + 3);
      if (v9 >> 28 == 1) {
        int64_t v18 = *(unsigned int *)(v17 + 4);
      }
      else {
        int64_t v18 = *(void *)(v17 + 40);
      }
      v71 = a5;
      v72 = (void **)&a5[v8];
      v73 = (void **)&a5[v12[5]];
      v74 = &a5[v8];
      v75 = v73;
      if ((v9 & 0x1000000) == 0) {
        goto LABEL_139;
      }
      v71 = (char *)malloc_type_calloc(1uLL, v18, 0xC6278757uLL);
      if (!v71) {
        return 12;
      }
      if (v18 < 1 || v73 >= v72 || v73 < (void **)a5) {
        goto LABEL_242;
      }
      v74 = &v71[v18];
      *v73 = v71;
      LODWORD(v9) = *v121;
      v75 = (void **)v71;
LABEL_139:
      LODWORD(v9) = v9 >> 28;
      if (v9 == 1)
      {
        if (v75 && (v75 >= (void **)v74 || v75 < (void **)v71)) {
          goto LABEL_242;
        }
        uint64_t result = __gen2_asn1_decode(*((void *)v12 + 3), a2, v13);
        if (result)
        {
LABEL_144:
          if (*((unsigned char *)v12 + 19))
          {
            if (v73 < v72 && v73 >= (void **)a5)
            {
              free(*v73);
              *v73 = 0;
              goto LABEL_182;
            }
            goto LABEL_242;
          }
          return result;
        }
      }
      else
      {
        if (v75 && (v75 >= (void **)v74 || v75 < (void **)v71)) {
          goto LABEL_242;
        }
        uint64_t result = (*(uint64_t (**)(unsigned __int8 *, size_t, void **, void *))(*((void *)v12 + 3) + 8))(v13, v14, v75, v128);
        if (result) {
          goto LABEL_144;
        }
      }
      uint64_t v9 = v128[0];
      v78 = &v13[v14];
      goto LABEL_177;
    case 0xBu:
      int v127 = 0;
      v128[0] = 0;
      uint64_t v125 = 0;
      unint64_t v126 = 0;
      uint64_t result = (uint64_t)__gen2_der_match_tag_and_length((char *)v13, v14, (v9 >> 22) & 3, &v127, v9 & 0x1FFFFF, &v126, &v125);
      if (result)
      {
        if ((*v121 & 0x1000000) != 0) {
          goto LABEL_182;
        }
        return result;
      }
      v79 = &v13[v14];
      v80 = &v13[v125];
      if (&v13[v125] > &v13[v14]) {
        goto LABEL_242;
      }
      if (v13 > v80) {
        goto LABEL_242;
      }
      unint64_t v81 = v14 - v125;
      unint64_t v82 = v79 - v80;
      if (v14 - v125 > v79 - v80) {
        goto LABEL_242;
      }
      unsigned int v83 = *v121;
      uint64_t v84 = a2;
      if ((a2 & 2) != 0)
      {
        uint64_t v84 = a2;
        if (v127 != ((v83 >> 21) & 1))
        {
          unint64_t v85 = *((void *)v12 + 3);
          uint64_t v9 = v85 + 16;
          if (v85 >= v85 + 16 || v85 + 32 > v9 + 16 * *(void *)(v85 + 8)) {
            goto LABEL_242;
          }
          uint64_t v84 = ((*(_DWORD *)v9 & 0xF0000FFF) == 1073741831) | a2;
        }
      }
      unint64_t v86 = v126;
      if (v126 != 3705724653)
      {
        unint64_t v87 = v126;
        if (v126 <= v81) {
          goto LABEL_186;
        }
        return 1859794437;
      }
      if ((a2 & 2) == 0) {
        return 1859794449;
      }
      unint64_t v87 = v81 - 2;
      if (v81 < 2) {
        return 1859794437;
      }
      uint64_t v84 = v84 | 4;
      unint64_t v126 = v81 - 2;
LABEL_186:
      v94 = &a5[v8];
      uint64_t v9 = v12[5];
      v95 = &a5[v9];
      if (&a5[v8] < &a5[v9] || v95 < a5) {
        goto LABEL_242;
      }
      size_t v96 = v8 - v9;
      if ((v83 & 0x1000000) != 0)
      {
        v110 = &v13[v125];
        int64_t v97 = v79 - v80;
        unint64_t v98 = v81;
        uint64_t v99 = v8;
        v100 = v79;
        unint64_t v101 = v86;
        size_t v96 = *(unsigned int *)(*((void *)v12 + 3) + 4);
        v102 = (char *)malloc_type_calloc(1uLL, v96, 0x74E89CD4uLL);
        if (!v102) {
          return 12;
        }
        unint64_t v82 = v97;
        v80 = v110;
        if (!v96 || v95 >= v94) {
          goto LABEL_242;
        }
        unint64_t v86 = v101;
        v79 = v100;
        uint64_t v8 = v99;
        unint64_t v81 = v98;
        *(void *)v95 = v102;
        unint64_t v87 = v126;
        v95 = v102;
      }
      if (v87 > v82 || !v96 && v95) {
        goto LABEL_242;
      }
      unint64_t v103 = v86;
      uint64_t result = __gen2_asn1_decode(*((void *)v12 + 3), v84, v80);
      if (!result)
      {
        if (v103 == 3705724653)
        {
          unint64_t v126 = v128[0];
        }
        else if (v128[0] != v126)
        {
          return 1859794442;
        }
        unint64_t v13 = &v80[v128[0]];
        uint64_t v9 = v79 - &v80[v128[0]];
        if (v79 < &v80[v128[0]]) {
          goto LABEL_242;
        }
        if (v80 > v13) {
          goto LABEL_242;
        }
        size_t v14 = v81 - v128[0];
        if (v81 - v128[0] > v9) {
          goto LABEL_242;
        }
        if (v103 != 3705724653) {
          goto LABEL_182;
        }
        uint64_t result = (uint64_t)__gen2_der_match_tag_and_length((char *)&v80[v128[0]], v81 - v128[0], 0, &v127, 0, &v126, &v125);
        if (!result)
        {
          if (v127)
          {
            return 1859794438;
          }
          else
          {
            if (!v126)
            {
              uint64_t v9 = v125;
              v92 = &v13[v125];
              size_t v93 = v79 - &v13[v125];
              if (v79 < &v13[v125]) {
                goto LABEL_242;
              }
LABEL_179:
              if (v13 <= v92)
              {
                v14 -= v9;
                if (v14 <= v93)
                {
                  unint64_t v13 = v92;
                  goto LABEL_182;
                }
              }
              goto LABEL_242;
            }
            return 1859794450;
          }
        }
      }
      return result;
    case 0xCu:
      v128[0] = 0;
      unsigned int v50 = (v9 & 0xFFF) + v111;
      if (v50 >= 0x15) {
        asn1_abort("type larger then asn1_template_prim: %d", v50);
      }
      uint64_t v9 = (uint64_t)&asn1_template_prim[6 * v50];
      if (v9 < (unint64_t)asn1_template_prim) {
        goto LABEL_242;
      }
      v51 = asn1_template_prim[6 * v50 + 1];
      v52 = &a5[v12[5]];
      if (v52)
      {
        LODWORD(v9) = a5 + v8;
        if (v52 >= &a5[v8]) {
          goto LABEL_242;
        }
        LODWORD(v9) = a5;
        if (v52 < a5) {
          goto LABEL_242;
        }
      }
      uint64_t result = ((uint64_t (*)(unsigned __int8 *, size_t))v51)(v13, v14);
      if (result) {
        return result;
      }
      goto LABEL_176;
    case 0xDu:
    case 0xEu:
      LODWORD(v9) = v116;
      if (v116 < a5) {
        goto LABEL_242;
      }
      uint64_t v19 = v12[5];
      v128[0] = 0;
      if (!v14) {
        goto LABEL_51;
      }
      uint64_t v20 = 0;
      int v21 = &a5[v19];
      size_t v22 = *(unsigned int *)(*((void *)v12 + 3) + 4);
      unint64_t v23 = (unint64_t)&a5[v19 + 16];
      LODWORD(v9) = v116;
      BOOL v25 = v21 >= a5 && v23 <= (unint64_t)v116;
      while (1)
      {
        if ((a2 & 4) != 0)
        {
          int v127 = 0;
          uint64_t v125 = 0;
          unint64_t v126 = 0;
          if (!__gen2_der_match_tag_and_length((char *)v13, v14, 0, &v127, 0, &v126, &v125)) {
            goto LABEL_51;
          }
        }
        if (__CFADD__(v22, v20)) {
          return 1859794436;
        }
        if (!v25) {
          goto LABEL_242;
        }
        BOOL v26 = (char *)malloc_type_realloc(*((void **)v21 + 1), v22 + v20, 0x6465CBE9uLL);
        if (!v26) {
          return 12;
        }
        int v27 = v26;
        size_t v28 = &v26[v22 + v20];
        uint64_t v29 = &v26[v20];
        if (&v26[v20] > v28 || v26 > v29) {
          goto LABEL_242;
        }
        bzero(&v26[v20], v22);
        if (v27 >= v28) {
          goto LABEL_242;
        }
        *((void *)v21 + 1) = v27;
        ++*(_DWORD *)v21;
        if (v29 >= v28) {
          goto LABEL_242;
        }
        uint64_t result = __gen2_asn1_decode(*((void *)v12 + 3), v118, v13);
        if (result) {
          return result;
        }
        LODWORD(v9) = v128[0];
        v33 = &v13[v128[0]];
        size_t v34 = v14 - v128[0];
        if (&v13[v14] < &v13[v128[0]]) {
          goto LABEL_242;
        }
        if (v13 > v33) {
          goto LABEL_242;
        }
        v14 -= v128[0];
        if (v14 > v34) {
          goto LABEL_242;
        }
        v20 += v22;
        v13 += v128[0];
        if (!v14)
        {
          unint64_t v13 = v33;
LABEL_51:
          uint64_t v8 = 16;
LABEL_182:
          uint64_t v9 = 16 * v123 - 16;
          if (v122 - 2 <= v9 >> 4)
          {
            uint64_t v12 = v121;
            unint64_t v122 = v123;
            unint64_t v6 = v123 - 1;
            if (v123 == 1) {
              goto LABEL_209;
            }
            goto LABEL_18;
          }
LABEL_242:
          __break(0x5519u);
LABEL_243:
          asn1_abort("unknown opcode: %d", v9 & 0xF0000000);
        }
      }
    case 0xFu:
      unint64_t v53 = *((void *)v12 + 3);
      uint64_t v54 = *(void *)(v53 + 8);
      unint64_t v55 = v53 + 16;
      unint64_t v56 = v53 + 16 + 16 * v54;
      if (v53 + 16 > v56) {
        goto LABEL_242;
      }
      size_t v57 = *(unsigned int *)(v53 + 4);
      if (v8 < v57) {
        goto LABEL_242;
      }
      bzero(a5, v57);
      if (!v14) {
        return 1859794437;
      }
      ++v13;
      uint64_t v58 = v14 - 1;
      if (v54) {
        BOOL v59 = v14 == 1;
      }
      else {
        BOOL v59 = 1;
      }
      if (v59) {
        goto LABEL_126;
      }
      unint64_t v60 = 0;
      if (a5) {
        BOOL v61 = v8 < 1;
      }
      else {
        BOOL v61 = 0;
      }
      LODWORD(v9) = v61;
      do
      {
        if (v53 > v55 || v55 + 16 > v56) {
          goto LABEL_242;
        }
        unint64_t v62 = *(unsigned int *)(v55 + 4);
        BOOL v63 = v58 == 0;
        if (v62 >> 3 > v60 >> 3 && v58 != 0)
        {
          v65 = &v13[v58];
          uint64_t v66 = v58;
          while (1)
          {
            v67 = v13++;
            if (v13 > v65 || v67 > v13) {
              goto LABEL_242;
            }
            uint64_t v58 = v66 - 1;
            v60 += 8;
            BOOL v63 = v66 == 1;
            if (v62 >> 3 > v60 >> 3)
            {
              if (--v66) {
                continue;
              }
            }
            break;
          }
        }
        if (v63) {
          goto LABEL_126;
        }
        if (v13) {
          BOOL v69 = v58 < 1;
        }
        else {
          BOOL v69 = 0;
        }
        if (v69) {
          char v70 = 1;
        }
        else {
          char v70 = v9;
        }
        if (v70) {
          goto LABEL_242;
        }
        if ((*v13 >> (~(_BYTE)v62 & 7))) {
          *(_DWORD *)a5 |= 1 << v62;
        }
        v55 += 16;
        --v54;
      }
      while (v54);
      if ((v58 & 0x8000000000000000) == 0)
      {
LABEL_126:
        size_t v14 = 0;
        goto LABEL_182;
      }
      goto LABEL_242;
    default:
      goto LABEL_243;
  }
}

uint64_t __gen2_asn1_encode(unint64_t a1, unsigned char *a2, size_t a3, char *a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = a1 + 16 * (v5 + 1);
  size_t v7 = a3 - 1;
  if (!a3) {
    size_t v7 = 0;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 4);
  unint64_t v118 = (unint64_t)&a2[-v7];
  unint64_t v119 = (unint64_t)&a2[a3 - v7];
  BOOL v10 = &a4[v8] >= a4 && &a2[-v7] <= &a2[a3 - v7] && v6 >= a1;
  if (!v10 || v5 + 1 > (unint64_t)((16 * (v5 + 1)) >> 4)) {
    goto LABEL_248;
  }
  unint64_t v114 = a1 + 16 * (v5 + 1);
  if (a1 + 16 > v6) {
    goto LABEL_248;
  }
  size_t v12 = a3;
  unint64_t v13 = a1;
  if (!v5) {
    goto LABEL_233;
  }
  size_t v14 = a2;
  uint64_t v15 = *(void *)(a1 + 8);
  uint64_t v16 = 0;
  unint64_t v17 = a1 + 16 * v5;
  unint64_t v111 = (unint64_t)(a4 + 16);
  size_t v12 = a3;
LABEL_16:
  uint64_t v116 = v15;
  if (v17 < v13 || v17 + 16 > v114) {
    goto LABEL_248;
  }
  int v18 = *(_DWORD *)v17;
  int v19 = *(_DWORD *)v17 >> 28;
  switch(v19 ^ 8)
  {
    case 0:
      int v24 = *(unsigned int **)(v17 + 8);
      uint64_t v25 = *((void *)v24 + 1);
      unint64_t v26 = (unint64_t)&v24[4 * v25 + 4];
      if ((unint64_t)(v24 + 4) > v26) {
        goto LABEL_248;
      }
      int v27 = &a4[v8];
      unint64_t v6 = (unint64_t)&a4[v24[1]];
      size_t v120 = 0;
      if (v6 >= (unint64_t)&a4[v8] || v6 < (unint64_t)a4) {
        goto LABEL_248;
      }
      LODWORD(v6) = *(_DWORD *)v6;
      if (v6) {
        BOOL v29 = (int)v6 <= (int)v25;
      }
      else {
        BOOL v29 = 0;
      }
      if (!v29) {
        goto LABEL_249;
      }
      if (v6 == -1)
      {
        unint64_t v96 = (unint64_t)&a4[*v24];
        if (v96 && (v96 >= (unint64_t)v27 || v96 < (unint64_t)a4)) {
          goto LABEL_248;
        }
        uint64_t v16 = __gen2_der_put_octet_string((unint64_t)v14, v12, v96, &v120) + v16;
      }
      else
      {
        int v30 = &v24[4 * (int)v6];
        unint64_t v6 = (unint64_t)(v30 + 4);
        if (v24 > v30 || v6 > v26) {
          goto LABEL_248;
        }
        v32 = &a4[v30[1]];
        if (v32)
        {
          if (v32 >= v27 || v32 < a4) {
            goto LABEL_248;
          }
        }
        uint64_t result = __gen2_asn1_encode(*((void *)v30 + 1), v14);
        if (result) {
          return result;
        }
        uint64_t v16 = 0;
      }
      size_t v80 = v120;
      BOOL v10 = v12 >= v120;
      v12 -= v120;
      if (!v10) {
        goto LABEL_248;
      }
      goto LABEL_208;
    case 9:
    case 0xA:
      size_t v120 = 0;
      LODWORD(v6) = a4;
      uint64_t v20 = &a4[v8];
      int v21 = &a4[*(unsigned int *)(v17 + 4)];
      uint64_t v22 = *(void *)(v17 + 8);
      if ((v18 & 0x1000000) != 0)
      {
        if (v21 >= v20 || v21 < a4) {
          goto LABEL_248;
        }
        unint64_t v23 = *(char **)v21;
        if (!*(void *)v21) {
          goto LABEL_232;
        }
        uint64_t v20 = &v23[*(unsigned int *)(v22 + 4)];
        int v21 = *(char **)v21;
      }
      else
      {
        unint64_t v23 = a4;
      }
      if (v19 == 1)
      {
        if (v21 && (v21 >= v20 || v21 < v23)) {
          goto LABEL_248;
        }
        uint64_t result = __gen2_asn1_encode(v22, v14);
        if (result) {
          return result;
        }
      }
      else
      {
        if (v21 && (v21 >= v20 || v21 < v23)) {
          goto LABEL_248;
        }
        uint64_t result = (*(uint64_t (**)(unsigned char *, size_t, char *, size_t *))v22)(v14, v12, v21, &v120);
        if (result) {
          return result;
        }
      }
      goto LABEL_146;
    case 0xB:
      LODWORD(v6) = a4;
      size_t v120 = 0;
      uint64_t v35 = *(unsigned int *)(v17 + 4);
      uint64_t v36 = &a4[v35];
      unint64_t v37 = v8 - v35;
      if (&a4[v8] < v36 || v36 < a4 || v37 > &a4[v8] - v36) {
        goto LABEL_248;
      }
      if ((v18 & 0x1000000) != 0)
      {
        if (v36 >= &a4[v8]) {
          goto LABEL_248;
        }
        uint64_t v36 = *(char **)v36;
        if (!v36) {
          goto LABEL_232;
        }
        uint64_t v40 = *(void *)(v17 + 8);
        unint64_t v37 = *(unsigned int *)(v40 + 4);
        if (v36 > &v36[v37]) {
          goto LABEL_248;
        }
      }
      else
      {
        uint64_t v40 = *(void *)(v17 + 8);
      }
      if (!v37 && v36) {
        goto LABEL_248;
      }
      uint64_t result = __gen2_asn1_encode(v40, v14);
      if (!result)
      {
        uint64_t result = (uint64_t)__gen2_der_put_length_and_tag(v14, v12, 0, (*(_DWORD *)v17 >> 22) & 3, (*(_DWORD *)v17 & 0x200000) != 0, *(_DWORD *)v17 & 0x1FFFFF, &v120);
        if (!result)
        {
LABEL_146:
          size_t v80 = v120;
          BOOL v10 = v12 >= v120;
          v12 -= v120;
          if (v10)
          {
            uint64_t v16 = 0;
LABEL_208:
            v14 -= v80;
            goto LABEL_232;
          }
LABEL_248:
          __break(0x5519u);
LABEL_249:
          asn1_abort("invalid choice: %d", v6);
        }
      }
      return result;
    case 0xC:
      size_t v120 = 0;
      if ((v18 & 0xFFFu) >= 0x15) {
        asn1_abort("type larger then asn1_template_prim: %d", v18 & 0xFFF);
      }
      unint64_t v41 = &a4[*(unsigned int *)(v17 + 4)];
      if (v41 && (v41 >= &a4[v8] || v41 < a4)) {
        goto LABEL_248;
      }
      uint64_t result = ((uint64_t (*)(unsigned char *, size_t))asn1_template_prim[6 * (v18 & 0xFFF)])(v14, v12);
      if (result) {
        return result;
      }
      goto LABEL_146;
    case 0xD:
      if (v111 < (unint64_t)a4) {
        goto LABEL_248;
      }
      v42 = &a4[*(unsigned int *)(v17 + 4)];
      uint64_t v43 = *(unsigned int *)(*(void *)(v17 + 8) + 4);
      size_t v120 = 0;
      if (v42 < a4 || (unint64_t)(v42 + 16) > v111) {
        goto LABEL_248;
      }
      unsigned int v45 = *(_DWORD *)v42;
      if (!*(_DWORD *)v42) {
        goto LABEL_231;
      }
      int v46 = 0;
      unint64_t v47 = *((void *)v42 + 1);
      unint64_t v48 = v47 + v45 * (unint64_t)v43;
      unint64_t v49 = v47 + v43 * (unint64_t)(v45 - 1);
      uint64_t v50 = -v43;
      while (!v49 || v49 < v48 && v49 >= v47)
      {
        uint64_t result = __gen2_asn1_encode(*(void *)(v17 + 8), v14);
        if (result) {
          return result;
        }
        BOOL v10 = v12 >= v120;
        v12 -= v120;
        if (!v10) {
          break;
        }
        v14 -= v120;
        v49 += v50;
        if (++v46 >= *(_DWORD *)v42) {
          goto LABEL_230;
        }
      }
      goto LABEL_248;
    case 0xE:
      if (v111 < (unint64_t)a4) {
        goto LABEL_248;
      }
      v51 = &a4[*(unsigned int *)(v17 + 4)];
      unint64_t v112 = v51;
      if (v51 < a4 || (unint64_t)(v51 + 16) > v111) {
        goto LABEL_248;
      }
      unint64_t v53 = &a4[*(unsigned int *)(v17 + 4)];
      size_t v54 = *(unsigned int *)v51;
      if (!v54) {
        goto LABEL_231;
      }
      if (v54 >> 28) {
        return 34;
      }
      uint64_t v108 = *(unsigned int *)(*(void *)(v17 + 8) + 4);
      v110 = (char *)*((void *)v51 + 1);
      unint64_t v55 = (void **)malloc_type_calloc(v54, 0x10uLL, 0x108004057E67DB5uLL);
      if (v55) {
        unint64_t v56 = &v55[2 * v54];
      }
      else {
        unint64_t v56 = 0;
      }
      if (!v55) {
        return 12;
      }
      size_t v57 = v55;
      if (!*(_DWORD *)v112)
      {
        size_t v59 = 0;
        uint64_t v73 = v16;
        BOOL v72 = 0;
        goto LABEL_213;
      }
      unint64_t v58 = 0;
      size_t v59 = 0;
      unint64_t v109 = (unint64_t)&v110[v54 * (unint64_t)v108];
      unint64_t v60 = v55;
      BOOL v61 = v110;
      while (1)
      {
        size_t v120 = 0;
        if (v61 && ((unint64_t)v61 >= v109 || v61 < v110)) {
          goto LABEL_248;
        }
        size_t v62 = __gen2_asn1_length(*(void *)(v17 + 8), v61);
        if (v62)
        {
          size_t v63 = v62;
          v64 = (char *)malloc_type_malloc(v62, 0xEE4ECCE9uLL);
          v65 = &v64[v63];
          if (!v64) {
            v65 = 0;
          }
          BOOL v10 = v65 >= v64;
          size_t v66 = v65 - v64;
          if (!v10 || v63 > v66 || v60 >= v56 || v60 < v57) {
            goto LABEL_248;
          }
          *unint64_t v60 = (void *)v63;
          v60[1] = v64;
          if (!v64) {
            break;
          }
        }
        if (v60 >= v56 || v60 < v57 || v61 && ((unint64_t)v61 >= v109 || v61 < v110)) {
          goto LABEL_248;
        }
        uint64_t v70 = __gen2_asn1_encode(*(void *)(v17 + 8), (char *)*v60 + (void)v60[1] - 1);
        if (v70)
        {
          uint64_t v73 = v70;
          goto LABEL_240;
        }
        if (&v61[v108] < v61)
        {
          uint64_t v73 = 1859794436;
          goto LABEL_240;
        }
        v71 = *v60;
        v60 += 2;
        v59 += (size_t)v71;
        ++v58;
        v61 += v108;
        if (v58 >= *(unsigned int *)v112)
        {
          BOOL v72 = v59 > v12;
          if (v59 <= v12) {
            uint64_t v73 = 0;
          }
          else {
            uint64_t v73 = 1859794436;
          }
          unint64_t v53 = v112;
LABEL_213:
          if (v73) {
            goto LABEL_241;
          }
          if (v72) {
            goto LABEL_248;
          }
          v12 -= v59;
          qsort(v57, *(unsigned int *)v112, 0x10uLL, (int (__cdecl *)(const void *, const void *))__gen2_heim_der_set_sort);
          uint64_t v97 = 2 * (*(_DWORD *)v112 - 1);
          do
          {
            unint64_t v98 = (const void **)&v57[v97];
            if (&v57[v97] >= v56 || v98 < (const void **)v57) {
              goto LABEL_248;
            }
            size_t v100 = (size_t)*v98;
            v14 -= (unint64_t)*v98;
            unint64_t v101 = v14 + 1;
            BOOL v102 = v119 >= (unint64_t)(v14 + 1) && (unint64_t)v101 >= v118;
            if (!v102 || v100 > v119 - (unint64_t)(v14 + 1)) {
              goto LABEL_248;
            }
            memcpy(v101, v98[1], v100);
            free((void *)v98[1]);
            v97 -= 2;
          }
          while (v97 != -2);
          free(v57);
LABEL_230:
          uint64_t v16 = 0;
LABEL_231:
          uint64_t v8 = 16;
LABEL_232:
          unint64_t v13 = a1;
          v17 -= 16;
          uint64_t v15 = v116 - 1;
          if (v116 == 1)
          {
LABEL_233:
            uint64_t result = 0;
            if (a5) {
              *a5 = a3 - v12;
            }
            return result;
          }
          goto LABEL_16;
        }
      }
      uint64_t v73 = 12;
LABEL_240:
      unint64_t v53 = v112;
LABEL_241:
      if (*(_DWORD *)v53)
      {
        unint64_t v104 = 0;
        size_t v105 = v57 + 1;
        do
        {
          v106 = *v105;
          v105 += 2;
          free(v106);
          ++v104;
        }
        while (v104 < *(unsigned int *)v53);
      }
      free(v57);
      return v73;
    case 0xF:
      v74 = *(int **)(v17 + 8);
      uint64_t v75 = *((void *)v74 + 1);
      unint64_t v6 = (unint64_t)&v74[4 * v75 + 4];
      if ((unint64_t)(v74 + 4) > v6) {
        goto LABEL_248;
      }
      int v76 = *v74;
      unint64_t v77 = (unint64_t)&v74[4 * v75];
      if (*v74)
      {
        unint64_t v78 = 31;
      }
      else
      {
        if ((unint64_t)v74 > v77 || v77 + 16 > v6) {
          goto LABEL_248;
        }
        unint64_t v78 = v74[4 * v75 + 1];
      }
      if (v75) {
        BOOL v82 = v12 == 0;
      }
      else {
        BOOL v82 = 1;
      }
      if (v82)
      {
        LOBYTE(v83) = 0;
        int v84 = 0;
LABEL_160:
        uint64_t result = 1859794436;
        if (v76 & 1 | v84)
        {
          if (!v12) {
            return result;
          }
          if ((unint64_t)v14 >= v119 || (unint64_t)v14 < v118) {
            goto LABEL_248;
          }
          *v14-- = v83;
          --v12;
        }
        if (!v12) {
          return result;
        }
        BOOL v86 = (unint64_t)v14 < v119 && (unint64_t)v14 >= v118;
        if ((v76 & 1) != 0 || !v84)
        {
          if (!v86) {
            goto LABEL_248;
          }
          char v87 = 0;
        }
        else
        {
          if (!v86) {
            goto LABEL_248;
          }
          char v87 = v84 - 1;
        }
        *v14-- = v87;
        --v12;
        goto LABEL_232;
      }
      int v84 = 0;
      int v83 = 0;
      if (a4) {
        BOOL v88 = v8 <= 0;
      }
      else {
        BOOL v88 = 0;
      }
      int v89 = !v88;
      while ((unint64_t)v74 <= v77 && v77 + 16 <= v6)
      {
        for (unint64_t i = *(unsigned int *)(v77 + 4); v78 >> 3 > i >> 3; unint64_t i = *(unsigned int *)(v77 + 4))
        {
          if (v83) {
            BOOL v91 = 1;
          }
          else {
            BOOL v91 = (v76 & 1 | v84) != 0;
          }
          if (v91)
          {
            if (!v12) {
              return 1859794436;
            }
            if ((unint64_t)v14 >= v119 || (unint64_t)v14 < v118) {
              goto LABEL_248;
            }
            *v14-- = v83;
            --v12;
          }
          int v83 = 0;
          v78 -= 8;
        }
        if (!v89) {
          break;
        }
        int v92 = *(_DWORD *)a4 >> i;
        int v93 = i & 7;
        int v94 = v83 | (1 << (v93 ^ 7));
        int v95 = 8 - v93;
        if (v84) {
          int v95 = v84;
        }
        if (v92)
        {
          int v83 = v94;
          int v84 = v95;
        }
        if (--v75)
        {
          v77 -= 16;
          if (v12) {
            continue;
          }
        }
        goto LABEL_160;
      }
      goto LABEL_248;
    default:
      asn1_abort("unknown opcode: %d", v18 & 0xF0000000);
  }
}

uint64_t __gen2_asn1_length(unint64_t a1, char *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = a1 + 16 * (v2 + 1);
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  LODWORD(v5) = a2 + v4;
  BOOL v7 = &a2[v4] < a2 || v3 < a1 || v2 + 1 > (unint64_t)((16 * (v2 + 1)) >> 4);
  if (v7 || (unint64_t v53 = a1 + 16 * (v2 + 1), a1 + 16 > v3))
  {
LABEL_109:
    __break(0x5519u);
LABEL_110:
    asn1_abort("unknown opcode: %d", v5 & 0xF0000000);
  }
  if (v2)
  {
    uint64_t v9 = 0;
    unint64_t v52 = (unint64_t)(a2 + 16);
    unint64_t v10 = a1;
    unint64_t v11 = a1 + 16 * v2;
    while (1)
    {
      if (v11 < v10) {
        goto LABEL_109;
      }
      LODWORD(v5) = v53;
      if (v11 + 16 > v53) {
        goto LABEL_109;
      }
      LODWORD(v5) = *(_DWORD *)v11;
      int v12 = *(_DWORD *)v11 >> 28;
      switch(v12 ^ 8)
      {
        case 0:
          unint64_t v5 = *(void *)(v11 + 8);
          uint64_t v23 = *(void *)(v5 + 8);
          unint64_t v24 = v5 + 16 + 16 * v23;
          if (v5 + 16 > v24) {
            goto LABEL_109;
          }
          uint64_t v25 = &a2[v4];
          unint64_t v26 = (int *)&a2[*(unsigned int *)(v5 + 4)];
          if (v26 >= (int *)&a2[v4] || v26 < (int *)a2) {
            goto LABEL_109;
          }
          int v28 = *v26;
          if (*v26) {
            BOOL v29 = v28 <= (int)v23;
          }
          else {
            BOOL v29 = 0;
          }
          if (!v29) {
            asn1_abort("invalid choice: %d", v28);
          }
          if (v28 == -1)
          {
            unint64_t v5 = *(unsigned int *)v5;
            unint64_t v50 = (unint64_t)&a2[v5];
            if (&a2[v5] && (v50 >= (unint64_t)v25 || v50 < (unint64_t)a2)) {
              goto LABEL_109;
            }
            uint64_t v47 = __gen2_der_length_octet_string(v50);
          }
          else
          {
            int v30 = (unsigned int *)(v5 + 16 * v28);
            if (v5 > (unint64_t)v30 || (unint64_t)(v30 + 4) > v24) {
              goto LABEL_109;
            }
            uint64_t v15 = *((void *)v30 + 1);
            unint64_t v5 = v30[1];
            v32 = &a2[v5];
            if (&a2[v5])
            {
              if (v32 >= v25 || v32 < a2) {
                goto LABEL_109;
              }
            }
LABEL_86:
            uint64_t v47 = __gen2_asn1_length(v15);
          }
          goto LABEL_92;
        case 9:
        case 0xA:
          unint64_t v13 = (unsigned int **)&a2[v4];
          size_t v14 = (unsigned int **)&a2[*(unsigned int *)(v11 + 4)];
          uint64_t v15 = *(void *)(v11 + 8);
          if ((v5 & 0x1000000) == 0)
          {
            unint64_t v5 = (unint64_t)a2;
            goto LABEL_82;
          }
          if (v14 >= v13 || v14 < (unsigned int **)a2) {
            goto LABEL_109;
          }
          unint64_t v5 = (unint64_t)*v14;
          if (!*v14) {
            goto LABEL_93;
          }
          unint64_t v13 = (unsigned int **)(v5 + *(unsigned int *)(v15 + 4));
          size_t v14 = (unsigned int **)*v14;
LABEL_82:
          if (v12 == 1)
          {
            if (v14 && (v14 >= v13 || (unint64_t)v14 < v5)) {
              goto LABEL_109;
            }
            goto LABEL_86;
          }
          uint64_t v40 = *(uint64_t (**)())(v15 + 16);
          if (v14 && (v14 >= v13 || (unint64_t)v14 < v5)) {
            goto LABEL_109;
          }
          unint64_t v41 = (char *)v14;
LABEL_91:
          uint64_t v47 = ((uint64_t (*)(char *))v40)(v41);
LABEL_92:
          v9 += v47;
          goto LABEL_93;
        case 0xB:
          uint64_t v34 = *(unsigned int *)(v11 + 4);
          uint64_t v35 = &a2[v34];
          unint64_t v36 = v4 - v34;
          if (&a2[v4] < v35 || v35 < a2 || v36 > &a2[v4] - v35) {
            goto LABEL_109;
          }
          if ((v5 & 0x1000000) != 0)
          {
            if (v35 >= &a2[v4]) {
              goto LABEL_109;
            }
            uint64_t v35 = *(char **)v35;
            if (!v35) {
              goto LABEL_93;
            }
            uint64_t v39 = *(void *)(v11 + 8);
            unint64_t v36 = *(unsigned int *)(v39 + 4);
            LODWORD(v5) = v35 + v36;
            if (v35 > &v35[v36]) {
              goto LABEL_109;
            }
          }
          else
          {
            uint64_t v39 = *(void *)(v11 + 8);
          }
          if (!v36 && v35) {
            goto LABEL_109;
          }
          unint64_t v48 = __gen2_asn1_length(v39);
          uint64_t v49 = __gen2_der_length_tag(*(_DWORD *)v11 & 0x1FFFFF);
          v9 += v48 + v49 + __gen2_der_length_len(v48);
LABEL_93:
          unint64_t v10 = a1;
          v11 -= 16;
          if (!--v2) {
            return v9;
          }
          break;
        case 0xC:
          if ((*(_DWORD *)v11 & 0xFFFu) >= 0x15) {
            asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)v11 & 0xFFF);
          }
          uint64_t v40 = asn1_template_prim[6 * (v5 & 0xFFF) + 2];
          unint64_t v41 = &a2[*(unsigned int *)(v11 + 4)];
          if (v41)
          {
            LODWORD(v5) = a2 + v4;
            if (v41 >= &a2[v4] || v41 < a2) {
              goto LABEL_109;
            }
          }
          goto LABEL_91;
        case 0xD:
        case 0xE:
          if (v52 < (unint64_t)a2) {
            goto LABEL_109;
          }
          uint64_t v16 = &a2[*(unsigned int *)(v11 + 4)];
          LODWORD(v5) = v52;
          if (v16 < a2 || (unint64_t)(v16 + 16) > v52) {
            goto LABEL_109;
          }
          if (!*(_DWORD *)v16) {
            goto LABEL_27;
          }
          unsigned int v18 = 0;
          unint64_t v5 = *(void *)(v11 + 8);
          uint64_t v19 = *(unsigned int *)(v5 + 4);
          unint64_t v20 = *((void *)v16 + 1);
          unint64_t v21 = v20 + v19 * (unint64_t)*(unsigned int *)v16;
          unint64_t v22 = v20;
          do
          {
            if (v22 && (v22 >= v21 || v22 < v20)) {
              goto LABEL_109;
            }
            v9 += __gen2_asn1_length(*(void *)(v11 + 8));
            v22 += v19;
            ++v18;
          }
          while (v18 < *(_DWORD *)v16);
LABEL_27:
          uint64_t v4 = 16;
          goto LABEL_93;
        case 0xF:
          unint64_t v42 = *(void *)(v11 + 8);
          unint64_t v5 = *(void *)(v42 + 8);
          unint64_t v43 = v42 + 16 + 16 * v5;
          if (v42 + 16 > v43) {
            goto LABEL_109;
          }
          if (*(unsigned char *)v42)
          {
            v9 += 5;
          }
          else
          {
            ++v9;
            if (v5)
            {
              if (a2 && v4 < 1) {
                goto LABEL_109;
              }
              unint64_t v44 = v42 + 16 * v5;
              while (1)
              {
                if (v42 > v44 || v44 + 16 > v43) {
                  goto LABEL_109;
                }
                unint64_t v45 = *(unsigned int *)(v44 + 4);
                if ((*(_DWORD *)a2 >> v45)) {
                  break;
                }
                v44 -= 16;
                if (!--v5) {
                  goto LABEL_93;
                }
              }
              v9 += (v45 >> 3) + 1;
            }
          }
          goto LABEL_93;
        default:
          goto LABEL_110;
      }
    }
  }
  return 0;
}

void __gen2_asn1_free(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = v2 + 1;
  unint64_t v4 = a1 + 16 * (v2 + 1);
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  unint64_t v6 = (uint64_t)(16 * (v2 + 1)) >> 4;
  if (a2 + v5 < a2 || v4 < a1 || v3 > v6) {
    goto LABEL_106;
  }
  unint64_t v9 = a1;
  unint64_t v10 = a1 + 16;
  unint64_t v41 = a1 + 16 * (v2 + 1);
  if (a1 + 16 > v4) {
    goto LABEL_106;
  }
  if (*(unsigned char *)a1)
  {
    if (a2 && !v5) {
      goto LABEL_106;
    }
    __gen2_der_free_octet_string(a2);
  }
  if (v10 < v9 || v2 > (uint64_t)(16 * v3 - 16) >> 4)
  {
LABEL_106:
    __break(0x5519u);
LABEL_107:
    asn1_abort("unknown opcode: %d", v6 & 0xF0000000);
  }
  if (v2)
  {
    unint64_t v40 = a2 + 16;
    while (1)
    {
      LODWORD(v6) = v41;
      if (v9 + 32 > v41) {
        goto LABEL_106;
      }
      LODWORD(v6) = *(_DWORD *)(v9 + 16);
      unsigned int v11 = v6 >> 28;
      switch((v6 >> 28) ^ 8)
      {
        case 0u:
          unint64_t v6 = *(void *)(v9 + 24);
          uint64_t v22 = *(void *)(v6 + 8);
          unint64_t v23 = v6 + 16 + 16 * v22;
          if (v6 + 16 > v23) {
            goto LABEL_106;
          }
          unint64_t v24 = a2 + v5;
          uint64_t v25 = (int *)(a2 + *(unsigned int *)(v6 + 4));
          if ((unint64_t)v25 >= a2 + v5 || (unint64_t)v25 < a2) {
            goto LABEL_106;
          }
          uint64_t v27 = *v25;
          if (!v27) {
            goto LABEL_95;
          }
          if ((int)v27 > (int)v22) {
            asn1_abort("invalid choice: %d", v27);
          }
          if (v27 == -1)
          {
            unint64_t v6 = *(unsigned int *)v6;
            unint64_t v38 = a2 + v6;
            if (a2 + v6)
            {
              if (v38 >= v24 || v38 < a2) {
                goto LABEL_106;
              }
            }
            __gen2_der_free_octet_string(v38);
          }
          else
          {
            unint64_t v28 = v6 + 16 * v27;
            if (v6 > v28 || v28 + 16 > v23) {
              goto LABEL_106;
            }
            unint64_t v6 = *(unsigned int *)(v28 + 4);
            unint64_t v30 = a2 + v6;
            if (a2 + v6)
            {
              if (v30 >= v24 || v30 < a2) {
                goto LABEL_106;
              }
            }
            __gen2_asn1_free(*(void *)(v28 + 8), v30);
          }
          goto LABEL_95;
        case 9u:
        case 0xAu:
          unint64_t v12 = a2 + v5;
          unint64_t v13 = (unint64_t *)(a2 + *(unsigned int *)(v9 + 20));
          uint64_t v14 = *(void *)(v9 + 24);
          if ((v6 & 0x1000000) != 0)
          {
            if ((unint64_t)v13 >= v12 || (unint64_t)v13 < a2) {
              goto LABEL_106;
            }
            unint64_t v6 = *v13;
            if (!*v13) {
              goto LABEL_95;
            }
            unint64_t v12 = v6 + *(unsigned int *)(v14 + 4);
            unint64_t v13 = (unint64_t *)*v13;
          }
          else
          {
            unint64_t v6 = a2;
          }
          if (v11 == 1)
          {
            if (v13 && ((unint64_t)v13 >= v12 || (unint64_t)v13 < v6)) {
              goto LABEL_106;
            }
            goto LABEL_92;
          }
          if (v13 && ((unint64_t)v13 >= v12 || (unint64_t)v13 < v6)) {
            goto LABEL_106;
          }
          (*(void (**)(unint64_t *))(v14 + 32))(v13);
          goto LABEL_93;
        case 0xBu:
          v32 = (unint64_t *)(a2 + v5);
          unint64_t v13 = (unint64_t *)(a2 + *(unsigned int *)(v9 + 20));
          uint64_t v14 = *(void *)(v9 + 24);
          if ((v6 & 0x1000000) == 0)
          {
            unint64_t v6 = a2;
            if (v13)
            {
LABEL_87:
              if (v13 >= v32 || (unint64_t)v13 < v6) {
                goto LABEL_106;
              }
            }
LABEL_92:
            __gen2_asn1_free(v14, v13);
LABEL_93:
            if (*(unsigned char *)(v9 + 19)) {
              free(v13);
            }
            goto LABEL_95;
          }
          if (v13 >= v32 || (unint64_t)v13 < a2) {
            goto LABEL_106;
          }
          unint64_t v13 = (unint64_t *)*v13;
          if (v13)
          {
            v32 = (unint64_t *)((char *)v13 + *(unsigned int *)(v14 + 4));
            unint64_t v6 = (unint64_t)v13;
            goto LABEL_87;
          }
LABEL_95:
          unint64_t v6 = 16 * v2 - 16;
          if (v3 - 2 > (uint64_t)v6 >> 4) {
            goto LABEL_106;
          }
          v9 += 16;
          unint64_t v3 = v2--;
          if (!v2) {
            return;
          }
          break;
        case 0xCu:
          if ((*(_DWORD *)(v9 + 16) & 0xFFFu) >= 0x15) {
            asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)(v9 + 16) & 0xFFF);
          }
          v33 = (void (*)(void))asn1_template_prim[6 * (v6 & 0xFFF) + 4];
          unint64_t v34 = a2 + *(unsigned int *)(v9 + 20);
          if (v34)
          {
            LODWORD(v6) = a2 + v5;
            if (v34 >= a2 + v5) {
              goto LABEL_106;
            }
            LODWORD(v6) = a2;
            if (v34 < a2) {
              goto LABEL_106;
            }
          }
          v33();
          goto LABEL_95;
        case 0xDu:
        case 0xEu:
          LODWORD(v6) = a2 + 16;
          if (v40 < a2) {
            goto LABEL_106;
          }
          LODWORD(v6) = a2;
          uint64_t v15 = (unsigned int *)(a2 + *(unsigned int *)(v9 + 20));
          if ((unint64_t)v15 >= v40 || (unint64_t)v15 < a2) {
            goto LABEL_106;
          }
          if (!*v15) {
            goto LABEL_35;
          }
          LODWORD(v6) = v15 + 16;
          if ((unint64_t)(v15 + 4) > v40) {
            goto LABEL_106;
          }
          unsigned int v17 = 0;
          unint64_t v6 = *(void *)(v9 + 24);
          uint64_t v18 = *(unsigned int *)(v6 + 4);
          unint64_t v19 = *((void *)v15 + 1);
          unint64_t v20 = v19 + *v15 * (unint64_t)v18;
          unint64_t v21 = v19;
          do
          {
            if (v21 && (v21 >= v20 || v21 < v19)) {
              goto LABEL_106;
            }
            __gen2_asn1_free(*(void *)(v9 + 24), v21);
            v21 += v18;
            ++v17;
          }
          while (v17 < *v15);
          free(*((void **)v15 + 1));
          *((void *)v15 + 1) = 0;
          *uint64_t v15 = 0;
LABEL_35:
          uint64_t v5 = 16;
          goto LABEL_95;
        case 0xFu:
          goto LABEL_95;
        default:
          goto LABEL_107;
      }
    }
  }
}

uint64_t __gen2_asn1_copy(unint64_t a1, unint64_t a2, size_t *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = v3 + 1;
  unint64_t v5 = a1 + 16 * (v3 + 1);
  unint64_t v6 = *(unsigned int *)(a1 + 4);
  unint64_t v7 = a2 + v6;
  *(void *)&long long v84 = a2;
  *((void *)&v84 + 1) = a3;
  BOOL v8 = (size_t *)((char *)a3 + v6) >= a3 && v7 >= a2;
  if (!v8 || v5 < a1 || v4 > (uint64_t)(16 * (v3 + 1)) >> 4) {
    goto LABEL_173;
  }
  unint64_t v11 = a1;
  unint64_t v7 = a1 + 16;
  if (a1 + 16 > v5 || v7 < a1 || v3 > (uint64_t)(16 * v4 - 16) >> 4) {
    goto LABEL_173;
  }
  if (*(_DWORD *)a1)
  {
    LODWORD(v7) = v84;
    if (v84 != 0 && !v6) {
      goto LABEL_173;
    }
    unint64_t v12 = __gen2_der_copy_octet_string(a2, a3);
    if (v12) {
      return v12;
    }
  }
  if (!v3) {
    return 0;
  }
  unint64_t v81 = *((void *)&v84 + 1) + 16;
  BOOL v14 = (uint64_t)v84 + 16 < (unint64_t)v84
     || (unint64_t)(*((void *)&v84 + 1) + 16) < *((void *)&v84 + 1);
  BOOL v82 = v14;
  unint64_t v83 = v11 + 16 * v3 + 16;
  while (2)
  {
    LODWORD(v7) = v83;
    if (v11 + 32 > v83) {
      goto LABEL_173;
    }
    LODWORD(v7) = *(_DWORD *)(v11 + 16);
    switch((v7 >> 28) ^ 8)
    {
      case 0u:
        unint64_t v37 = *(unsigned int **)(v11 + 24);
        uint64_t v38 = *((void *)v37 + 1);
        LODWORD(v7) = v37 + 16;
        unint64_t v39 = (unint64_t)&v37[4 * v38 + 4];
        if ((unint64_t)(v37 + 4) > v39) {
          goto LABEL_173;
        }
        uint64_t v40 = v37[1];
        unint64_t v7 = v84 + v6;
        unint64_t v41 = (int *)(v84 + v40);
        if ((uint64_t)v84 + v40 >= (unint64_t)v84 + v6 || (unint64_t)v41 < (unint64_t)v84) {
          goto LABEL_173;
        }
        int v43 = *v41;
        if (*v41) {
          BOOL v44 = v43 <= (int)v38;
        }
        else {
          BOOL v44 = 0;
        }
        if (!v44) {
          return 1859794451;
        }
        unint64_t v45 = *((void *)&v84 + 1) + v6;
        int v46 = (int *)(*((void *)&v84 + 1) + v40);
        if ((unint64_t)v46 >= *((void *)&v84 + 1) + v6 || (unint64_t)v46 < *((void *)&v84 + 1)) {
          goto LABEL_173;
        }
        *int v46 = v43;
        uint64_t v48 = *v41;
        if (v48 == -1)
        {
          uint64_t v77 = *v37;
          unint64_t v78 = v84 + v77;
          if ((void)v84 + v77)
          {
            if (v78 >= v7) {
              goto LABEL_173;
            }
            LODWORD(v7) = v84;
            if (v78 < (unint64_t)v84) {
              goto LABEL_173;
            }
          }
          LODWORD(v7) = DWORD2(v84);
          v79 = (size_t *)(*((void *)&v84 + 1) + v77);
          if (*((void *)&v84 + 1) + v77)
          {
            if ((unint64_t)v79 >= v45 || (unint64_t)v79 < *((void *)&v84 + 1)) {
              goto LABEL_173;
            }
          }
          unint64_t v56 = __gen2_der_copy_octet_string(v78, v79);
        }
        else
        {
          uint64_t v49 = &v37[4 * v48];
          if (v37 > v49 || (unint64_t)(v49 + 4) > v39) {
            goto LABEL_173;
          }
          uint64_t v51 = v49[1];
          unint64_t v52 = v84 + v51;
          if ((void)v84 + v51)
          {
            BOOL v8 = v52 >= v7;
            LODWORD(v7) = v84;
            if (v8 || v52 < (unint64_t)v84) {
              goto LABEL_173;
            }
          }
          LODWORD(v7) = DWORD2(v84);
          unint64_t v54 = *((void *)&v84 + 1) + v51;
          if (*((void *)&v84 + 1) + v51)
          {
            if (v54 >= v45 || v54 < *((void *)&v84 + 1)) {
              goto LABEL_173;
            }
          }
          unint64_t v56 = __gen2_asn1_copy(*((void *)v49 + 1), v52, v54);
        }
        unint64_t v12 = v56;
        if (v56) {
          return v12;
        }
        goto LABEL_161;
      case 9u:
      case 0xAu:
        uint64_t v15 = *(void *)(v11 + 24);
        if (v7 >> 28 == 1) {
          int64_t v16 = *(unsigned int *)(v15 + 4);
        }
        else {
          int64_t v16 = *(void *)(v15 + 40);
        }
        size_t v66 = (char *)*((void *)&v84 + 1);
        v67 = (void *)v84;
        uint64_t v68 = *(unsigned int *)(v11 + 20);
        unint64_t v69 = v84 + v6;
        uint64_t v70 = (void *)(v84 + v68);
        unint64_t v71 = *((void *)&v84 + 1) + v6;
        size_t v63 = (void **)(*((void *)&v84 + 1) + v68);
        if ((v7 & 0x1000000) != 0)
        {
          if ((unint64_t)v70 >= v69 || (unint64_t)v70 < (unint64_t)v84) {
            goto LABEL_173;
          }
          v67 = (void *)*v70;
          if (!*v70) {
            goto LABEL_161;
          }
          size_t v66 = (char *)malloc_type_calloc(1uLL, v16, 0x7732D8BEuLL);
          if (!v66) {
            return 12;
          }
          if (v16 < 1 || (unint64_t)v63 >= v71 || (unint64_t)v63 < *((void *)&v84 + 1)) {
            goto LABEL_173;
          }
          unint64_t v69 = (unint64_t)v67 + v16;
          BOOL v72 = &v66[v16];
          *size_t v63 = v66;
          LODWORD(v7) = *(_DWORD *)(v11 + 16);
          uint64_t v73 = v66;
          uint64_t v70 = v67;
        }
        else
        {
          BOOL v72 = (char *)(*((void *)&v84 + 1) + v6);
          uint64_t v73 = (char *)(*((void *)&v84 + 1) + v68);
        }
        LODWORD(v7) = v7 >> 28;
        if (v7 == 1)
        {
          if (v70 && ((unint64_t)v70 >= v69 || v70 < v67) || v73 && (v73 >= v72 || v73 < v66)) {
            goto LABEL_173;
          }
          uint64_t v74 = __gen2_asn1_copy(*(void *)(v11 + 24), v70, v73);
        }
        else
        {
          if (v70 && ((unint64_t)v70 >= v69 || v70 < v67) || v73 && (v73 >= v72 || v73 < v66)) {
            goto LABEL_173;
          }
          uint64_t v74 = (*(uint64_t (**)(void *, char *))(*(void *)(v11 + 24) + 24))(v70, v73);
        }
        unint64_t v12 = v74;
        if (v74)
        {
          if ((*(unsigned char *)(v11 + 19) & 1) == 0) {
            return v12;
          }
          if ((unint64_t)v63 < v71 && (unint64_t)v63 >= *((void *)&v84 + 1))
          {
LABEL_170:
            free(*v63);
            *size_t v63 = 0;
            return v12;
          }
LABEL_173:
          __break(0x5519u);
LABEL_174:
          asn1_abort("unknown opcode: %d", v7 & 0xF0000000);
        }
        goto LABEL_161;
      case 0xBu:
        uint64_t v57 = *(unsigned int *)(v11 + 20);
        unint64_t v58 = (void **)(*((void *)&v84 + 1) + v57);
        if ((unint64_t)(*((void *)&v84 + 1) + v57) < *((void *)&v84 + 1)) {
          goto LABEL_173;
        }
        unint64_t v59 = v84 + v6;
        unint64_t v60 = v84 + v57;
        if ((uint64_t)v84 + v57 > (unint64_t)v84 + v6) {
          goto LABEL_173;
        }
        if (v60 < (unint64_t)v84) {
          goto LABEL_173;
        }
        size_t v61 = v6 - v57;
        if (v6 - v57 > v59 - v60) {
          goto LABEL_173;
        }
        unint64_t v62 = *((void *)&v84 + 1) + v6;
        if ((unint64_t)v58 > *((void *)&v84 + 1) + v6 || v61 > v62 - (unint64_t)v58) {
          goto LABEL_173;
        }
        if ((v7 & 0x1000000) != 0)
        {
          if (v60 >= v59) {
            goto LABEL_173;
          }
          if (!*(void *)v60) {
            goto LABEL_161;
          }
          size_t v61 = *(unsigned int *)(*(void *)(v11 + 24) + 4);
          uint64_t v75 = malloc_type_calloc(1uLL, v61, 0x77DE9D74uLL);
          if (!v75) {
            return 12;
          }
          if (!v61) {
            goto LABEL_173;
          }
          if ((unint64_t)v58 >= v62) {
            goto LABEL_173;
          }
          *unint64_t v58 = v75;
          unint64_t v60 = *(void *)v60;
          if (v60 > v60 + v61) {
            goto LABEL_173;
          }
          size_t v63 = v58;
          unint64_t v58 = (void **)v75;
        }
        else
        {
          unint64_t v62 = 0;
          size_t v63 = 0;
        }
        if (!v61 && (unint64_t)v58 | v60) {
          goto LABEL_173;
        }
        uint64_t v76 = __gen2_asn1_copy(*(void *)(v11 + 24), v60, v58);
        if (v76)
        {
          unint64_t v12 = v76;
          if (!v63) {
            return v12;
          }
          if ((unint64_t)v63 < v62) {
            goto LABEL_170;
          }
          goto LABEL_173;
        }
        goto LABEL_161;
      case 0xCu:
        unsigned int v33 = *(_DWORD *)(v11 + 16) & 0xFFF;
        if (v33 >= 0x15) {
          asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)(v11 + 16) & 0xFFF);
        }
        unint64_t v7 = *(unsigned int *)(v11 + 20);
        unint64_t v34 = asn1_template_prim[6 * v33 + 3];
        unint64_t v35 = v84 + v7;
        if ((void)v84 + v7 && (v35 >= (unint64_t)v84 + v6 || v35 < (unint64_t)v84)) {
          goto LABEL_173;
        }
        unint64_t v36 = *((void *)&v84 + 1) + v7;
        if (*((void *)&v84 + 1) + v7)
        {
          LODWORD(v7) = DWORD2(v84) + v6;
          if (v36 >= *((void *)&v84 + 1) + v6) {
            goto LABEL_173;
          }
          LODWORD(v7) = DWORD2(v84);
          if (v36 < *((void *)&v84 + 1)) {
            goto LABEL_173;
          }
        }
        uint64_t v32 = v34();
        if (v32) {
          return v32;
        }
        goto LABEL_161;
      case 0xDu:
      case 0xEu:
        if (v82) {
          goto LABEL_173;
        }
        uint64_t v17 = *(unsigned int *)(v11 + 20);
        uint64_t v18 = (unsigned int *)(v84 + v17);
        unint64_t v7 = v84 + v17 + 16;
        if ((uint64_t)v84 + v17 < (unint64_t)v84 || v7 > (uint64_t)v84 + 16) {
          goto LABEL_173;
        }
        LODWORD(v7) = DWORD2(v84);
        unint64_t v20 = (unsigned int *)(*((void *)&v84 + 1) + v17);
        size_t v21 = *v18;
        if (!v21)
        {
          if ((unint64_t)v20 < *((void *)&v84 + 1)) {
            goto LABEL_173;
          }
          LODWORD(v7) = DWORD2(v84) + 16;
          if ((unint64_t)(v20 + 4) > v81) {
            goto LABEL_173;
          }
          *((void *)v20 + 1) = 0;
          unsigned int *v20 = 0;
LABEL_141:
          unint64_t v6 = 16;
LABEL_161:
          unint64_t v7 = 16 * v3 - 16;
          if (v4 - 2 > (uint64_t)v7 >> 4) {
            goto LABEL_173;
          }
          v11 += 16;
          unint64_t v4 = v3--;
          if (!v3) {
            return 0;
          }
          continue;
        }
        size_t v22 = *(unsigned int *)(*(void *)(v11 + 24) + 4);
        unint64_t v23 = malloc_type_calloc(v21, v22, 0x976FAD9CuLL);
        if (!v23) {
          return 12;
        }
        if (!v22) {
          goto LABEL_173;
        }
        if ((unint64_t)v20 < *((void *)&v84 + 1)) {
          goto LABEL_173;
        }
        LODWORD(v7) = DWORD2(v84) + 16;
        if ((unint64_t)(v20 + 4) > v81) {
          goto LABEL_173;
        }
        *((void *)v20 + 1) = v23;
        unsigned int *v20 = *v18;
        unint64_t v24 = *v18;
        if (!v24) {
          goto LABEL_141;
        }
        uint64_t v25 = 0;
        unint64_t v26 = 0;
        while (1)
        {
          unint64_t v7 = *((void *)v18 + 1);
          unint64_t v27 = v7 + v25;
          if (v7 + v25)
          {
            if (v27 >= v7 + v24 * v22 || v27 < v7) {
              goto LABEL_173;
            }
          }
          unint64_t v29 = *((void *)v20 + 1);
          unint64_t v30 = v29 + v25;
          if (v29 + v25)
          {
            unint64_t v7 = v29 + *v20 * (unint64_t)v22;
            if (v30 < v29 || v30 >= v7) {
              goto LABEL_173;
            }
          }
          uint64_t v32 = __gen2_asn1_copy(*(void *)(v11 + 24), v27, v30);
          if (v32) {
            return v32;
          }
          ++v26;
          unint64_t v24 = *v18;
          v25 += v22;
          if (v26 >= v24) {
            goto LABEL_141;
          }
        }
      case 0xFu:
        uint64_t v64 = *(void *)(v11 + 24);
        unint64_t v7 = v64 + 16 + 16 * *(void *)(v64 + 8);
        if (v64 + 16 > v7) {
          goto LABEL_173;
        }
        size_t v65 = *(unsigned int *)(v64 + 4);
        if (v6 < v65) {
          goto LABEL_173;
        }
        memcpy(*((void **)&v84 + 1), (const void *)v84, v65);
        goto LABEL_161;
      default:
        goto LABEL_174;
    }
  }
}

unint64_t __gen2_asn1_decode_top(unint64_t result, unsigned int a2, unsigned __int8 *a3, size_t a4, char *a5, size_t *a6)
{
  size_t v7 = *(unsigned int *)(result + 4);
  if (&a5[v7] < a5)
  {
    __break(0x5519u);
  }
  else
  {
    unint64_t v12 = result;
    bzero(a5, v7);
    uint64_t v13 = __gen2_asn1_decode(v12, a2, a3, a4, a5, a6);
    if (v13) {
      __gen2_asn1_free_top(v12, a5);
    }
    return v13;
  }
  return result;
}

void __gen2_asn1_free_top(unint64_t a1, char *a2)
{
  __gen2_asn1_free(a1, (unint64_t)a2);
  size_t v4 = *(unsigned int *)(a1 + 4);
  if (&a2[v4] < a2)
  {
    __break(0x5519u);
  }
  else
  {
    bzero(a2, v4);
  }
}

unint64_t __gen2_asn1_copy_top(unint64_t result, unint64_t a2, char *a3)
{
  size_t v4 = *(unsigned int *)(result + 4);
  if (&a3[v4] < a3)
  {
    __break(0x5519u);
  }
  else
  {
    unint64_t v6 = result;
    bzero(a3, v4);
    uint64_t v7 = __gen2_asn1_copy(v6, a2, (size_t *)a3);
    if (v7) {
      __gen2_asn1_free_top(v6, a3);
    }
    return v7;
  }
  return result;
}

char *rk_hex_encode(unsigned char *a1, uint64_t a2, char **a3)
{
  uint64_t v4 = a2;
  size_t v6 = (2 * a2) | 1;
  uint64_t result = (char *)malloc_type_malloc(v6, 0x23700864uLL);
  if (result) {
    unint64_t v8 = (unint64_t)&result[v6];
  }
  else {
    unint64_t v8 = 0;
  }
  if (!result)
  {
    uint64_t v10 = -1;
    goto LABEL_30;
  }
  if (!v4)
  {
    uint64_t v10 = 0;
LABEL_23:
    int64_t v16 = &result[v10];
    if ((unint64_t)&result[v10] >= v8 || v16 < result) {
      goto LABEL_31;
    }
    *int64_t v16 = 0;
    if (v16 + 1 < v16 || (unint64_t)(v16 + 1) > v8) {
      goto LABEL_31;
    }
LABEL_30:
    *a3 = result;
    return (char *)v10;
  }
  unint64_t v9 = &a1[v4];
  uint64_t v10 = 2 * v4;
  unint64_t v11 = result + 1;
  while (a1 < v9)
  {
    unint64_t v12 = &hexchar[(unint64_t)*a1 >> 4];
    if (v12 >= byte_263BE0E60 || v12 < hexchar) {
      break;
    }
    BOOL v14 = v11 - 1;
    if ((unint64_t)(v11 - 1) >= v8) {
      break;
    }
    if (v14 < result) {
      break;
    }
    *BOOL v14 = *v12;
    uint64_t v15 = &hexchar[*a1 & 0xF];
    if (v15 >= byte_263BE0E60 || v15 < hexchar || (unint64_t)v11 >= v8 || v11 < result) {
      break;
    }
    *unint64_t v11 = *v15;
    v11 += 2;
    ++a1;
    if (!--v4) {
      goto LABEL_23;
    }
  }
LABEL_31:
  __break(0x5519u);
  return result;
}

size_t rk_hex_decode(const char *a1, unsigned char *a2, size_t a3)
{
  unint64_t v5 = (unsigned __int8 *)a1;
  size_t v6 = strlen(a1);
  size_t v7 = v6 & 1;
  if (v7 + (v6 >> 1) > a3) {
    return -1;
  }
  unint64_t v9 = v6;
  if (v6)
  {
    size_t result = pos(*v5);
    if (!a3 || (*a2 = result, !*v5))
    {
LABEL_25:
      __break(0x5519u);
      return result;
    }
    ++v5;
    uint64_t v10 = a2 + 1;
  }
  else
  {
    uint64_t v10 = a2;
  }
  size_t result = strlen((const char *)v5);
  if (v9 >= 2)
  {
    unint64_t v12 = &a2[a3];
    unint64_t v13 = (unint64_t)&v5[result + 1];
    if (v9 >> 1 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v9 >> 1;
    }
    BOOL v14 = v5 + 1;
    uint64_t v15 = v11;
    while ((unint64_t)(v14 - 1) < v13 && v14 - 1 >= v5)
    {
      size_t result = pos(*(v14 - 1));
      if ((unint64_t)v14 >= v13) {
        break;
      }
      if (v14 < v5) {
        break;
      }
      char v17 = result;
      size_t result = pos(*v14);
      if (v10 >= v12 || v10 < a2) {
        break;
      }
      *v10++ = result | (16 * v17);
      v14 += 2;
      if (!--v15) {
        return v11 + v7;
      }
    }
    goto LABEL_25;
  }
  uint64_t v11 = 0;
  return v11 + v7;
}

uint64_t pos(unsigned __int8 a1)
{
  char v1 = __toupper(a1);
  uint64_t result = 0;
  while (hexchar[result])
  {
    if (v1 == hexchar[result]) {
      return result;
    }
    if (&hexchar[++result] >= byte_263BE0E60)
    {
      __break(0x5519u);
      return 0xFFFFFFFFLL;
    }
  }
  return 0xFFFFFFFFLL;
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}