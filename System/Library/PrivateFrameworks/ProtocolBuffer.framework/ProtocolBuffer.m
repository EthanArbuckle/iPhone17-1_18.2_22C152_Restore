uint64_t PBReaderSkipValueWithTag(void *a1, int a2, int a3)
{
  return _PBReaderSkipValueWithTag(a1, a2, a3, 0);
}

__n128 PB::Reader::recallMark(uint64_t a1, __n128 *a2)
{
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  return result;
}

uint64_t PBReaderRecallMark(uint64_t result, void *a2)
{
  *(void *)(result + 8) = *a2;
  *(void *)(result + 40) = a2[1];
  return result;
}

uint64_t PB::Reader::placeMark(uint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = a1[1];
  if (v2 < 0xFFFFFFFFFFFFFFF6 && v2 + 10 <= a1[2])
  {
    char v9 = 0;
    unsigned int v10 = 0;
    uint64_t v5 = 0;
    uint64_t v11 = *a1;
    while (1)
    {
      unint64_t v6 = v2 + 1;
      a1[1] = v2 + 1;
      char v12 = *(unsigned char *)(v11 + v2);
      v5 |= (unint64_t)(v12 & 0x7F) << v9;
      if ((v12 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v6;
      BOOL v8 = v10++ > 8;
      if (v8)
      {
LABEL_14:
        uint64_t v5 = 0;
        break;
      }
    }
  }
  else
  {
    char v3 = 0;
    unsigned int v4 = 0;
    uint64_t v5 = 0;
    while (1)
    {
      unint64_t v6 = v2 + 1;
      if (v2 == -1)
      {
        unint64_t v2 = -1;
LABEL_16:
        uint64_t v5 = 0;
        *((unsigned char *)a1 + 24) = 1;
        unint64_t v6 = v2;
        goto LABEL_19;
      }
      if (v6 > a1[2]) {
        goto LABEL_16;
      }
      char v7 = *(unsigned char *)(*a1 + v2);
      a1[1] = v6;
      v5 |= (unint64_t)(v7 & 0x7F) << v3;
      if ((v7 & 0x80) == 0) {
        break;
      }
      v3 += 7;
      unint64_t v2 = v6;
      BOOL v8 = v4++ > 8;
      if (v8) {
        goto LABEL_14;
      }
    }
    if (*((unsigned char *)a1 + 24)) {
      uint64_t v5 = 0;
    }
  }
LABEL_19:
  if (*((unsigned char *)a1 + 24)) {
    return 0;
  }
  unint64_t v14 = v6 + v5;
  if (__CFADD__(v6, v5) || (unint64_t v15 = a1[2], v14 > v15))
  {
    uint64_t v13 = 0;
    *((unsigned char *)a1 + 24) = 1;
  }
  else
  {
    *a2 = v14;
    a2[1] = v15;
    uint64_t v13 = 1;
    a1[2] = v14;
  }
  return v13;
}

void *PBDataWriterWriteUint64Field(uint64_t a1, unint64_t a2, int a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    __n128 result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unsigned int v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unsigned int v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  uint64_t v13 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      unint64_t v14 = a2 >> 7;
      unint64_t v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *uint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

uint64_t PBReaderReadBigEndianFixed16(void *a1)
{
  v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFDLL && (unint64_t v3 = v2 + 2, v2 + 2 <= v1[5]))
  {
    unsigned int v4 = *(unsigned __int16 *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    unsigned int v4 = 0;
    *((unsigned char *)v1 + 16) = 1;
  }
  uint64_t v5 = __rev16(v4);

  return v5;
}

void PBRepeatedUInt64Clear(uint64_t a1)
{
  unint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

BOOL PBRepeatedUInt64IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

void *PBRepeatedInt32Add(void *result, int a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        __n128 result = malloc_type_realloc((void *)*result, 8 * v4, 0x100004052888210uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          uint64_t v7 = v3[1];
          *((_DWORD *)result + v7) = a2;
          *unint64_t v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(_DWORD *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    __n128 result = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
    *unint64_t v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((_DWORD *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void *PBDataWriterWriteUint32Field(uint64_t a1, unsigned int a2, int a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    unint64_t v8 = v7 - result[2];
    if (v8 <= 0x10) {
      uint64_t v9 = 16;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](result, v9);
    __n128 result = *(void **)(a1 + 8);
  }
  unint64_t v10 = a2;
  if (a3 != -1)
  {
    unint64_t v11 = (8 * a3);
    unint64_t v12 = (unsigned char *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        unint64_t v13 = v11 >> 7;
        unint64_t v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *unint64_t v12 = v13;
    *(void *)(*(void *)(a1 + 8) + 8) = v12 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  unint64_t v15 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      unint64_t v16 = v10 >> 7;
      unint64_t v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  *unint64_t v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

void *PBRepeatedUInt32Add(void *result, int a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        __n128 result = malloc_type_realloc((void *)*result, 8 * v4, 0x100004052888210uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          uint64_t v7 = v3[1];
          *((_DWORD *)result + v7) = a2;
          *unint64_t v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(_DWORD *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    __n128 result = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
    *unint64_t v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((_DWORD *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void *PBDataWriterWriteInt32Field(uint64_t a1, unsigned int a2, int a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    unint64_t v8 = v7 - result[2];
    if (v8 <= 0x10) {
      uint64_t v9 = 16;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](result, v9);
    __n128 result = *(void **)(a1 + 8);
  }
  unint64_t v10 = (int)a2;
  if (a3 != -1)
  {
    unint64_t v11 = (8 * a3);
    unint64_t v12 = (unsigned char *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }
    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        unint64_t v13 = v11 >> 7;
        unint64_t v14 = v11 >> 14;
        v11 >>= 7;
      }
      while (v14);
    }
    *unint64_t v12 = v13;
    *(void *)(*(void *)(a1 + 8) + 8) = v12 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  unint64_t v15 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }
  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      unint64_t v16 = v10 >> 7;
      unint64_t v17 = v10 >> 14;
      v10 >>= 7;
    }
    while (v17);
  }
  *unint64_t v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) = v15 + 1;
  return result;
}

void PBRepeatedUInt32Clear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

void PBRepeatedInt32Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        unint64_t v7 = -1;
        break;
      }
    }
    if (v7 <= 8) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      unint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        unint64_t v10 = malloc_type_realloc(v10, 4 * v8, 0x100004052888210uLL);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 4 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }
  else
  {
    unint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
  }
}

id PBReaderReadData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = *((void *)v1 + 1);
  do
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > *((void *)v1 + 5)) {
      goto LABEL_15;
    }
    char v8 = *(unsigned char *)(*((void *)v1 + 3) + v6);
    *((void *)v1 + 1) = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
    {
      if (*((unsigned char *)v1 + 16)) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v5;
      }
      if (*((unsigned char *)v1 + 16)) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    v3 += 7;
    unint64_t v6 = v7;
  }
  while (v4++ < 9);
  uint64_t v10 = 0;
  if (*((unsigned char *)v1 + 16))
  {
LABEL_8:
    unint64_t v11 = 0;
    goto LABEL_16;
  }
LABEL_13:
  if (__CFADD__(v7, v10) || v7 + v10 > *((void *)v1 + 5))
  {
LABEL_15:
    unint64_t v11 = 0;
    *((unsigned char *)v1 + 16) = 1;
  }
  else
  {
    unint64_t v11 = objc_msgSend(*((id *)v1 + 4), "subdataWithRange:");
    v2[1] += v10;
  }
LABEL_16:

  return v11;
}

uint64_t PBReaderReadBigEndianFixed32(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v3 = v2 + 4, v2 + 4 <= v1[5]))
  {
    unsigned int v4 = *(_DWORD *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    unsigned int v4 = 0;
    *((unsigned char *)v1 + 16) = 1;
  }
  uint64_t v5 = bswap32(v4);

  return v5;
}

void PBRepeatedInt32Clear(uint64_t a1)
{
  unint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

BOOL PBRepeatedInt32IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

BOOL PBUnknownFieldAdd(void *a1, int a2, int a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a1;
  id v8 = a4;
  uint64_t v9 = 0;
  unint64_t v10 = a3 & 7 | (8 * a2);
  unint64_t v11 = v10;
  do
  {
    ++v9;
    BOOL v12 = v11 > 0x7F;
    v11 >>= 7;
  }
  while (v12);
  if (!_makeSpace(v7, v9))
  {
LABEL_68:
    BOOL v17 = 0;
    *((unsigned char *)v8 + 16) = 1;
    goto LABEL_69;
  }
  unint64_t v13 = (unsigned char *)(v7[1] + v7[3]);
  unint64_t v14 = v13;
  if (v10 < 0x80)
  {
    LOBYTE(v15) = a3 & 7 | (8 * a2);
  }
  else
  {
    do
    {
      *v14++ = v10 | 0x80;
      unint64_t v15 = v10 >> 7;
      unint64_t v16 = v10 >> 14;
      v10 >>= 7;
    }
    while (v16);
  }
  BOOL v17 = 0;
  *unint64_t v14 = v15;
  v7[3] += v14 - v13 + 1;
  switch(a3)
  {
    case 0:
      uint64_t v18 = 0;
      uint64_t v19 = *((void *)v8 + 1);
      while (1)
      {
        if (v18 == 10) {
          goto LABEL_68;
        }
        unint64_t v20 = v19 + v18 + 1;
        if (v19 + v18 == -1 || v20 > *((void *)v8 + 5)) {
          break;
        }
        int v21 = *(char *)(*((void *)v8 + 3) + v19 + v18);
        *((void *)v8 + 1) = v20;
        __src[v18++] = v21;
        if ((v21 & 0x80000000) == 0) {
          goto LABEL_48;
        }
      }
      *((unsigned char *)v8 + 16) = 1;
      __src[v18] = 0;
      LOBYTE(v18) = v18 + 1;
LABEL_48:
      size_t v31 = v18;
      if (!_makeSpace(v7, v18)) {
        goto LABEL_68;
      }
      memcpy((void *)(v7[1] + v7[3]), __src, v31);
      goto LABEL_50;
    case 1:
      if (!_makeSpace(v7, 8)) {
        goto LABEL_68;
      }
      uint64_t v22 = v7[3];
      unint64_t v23 = *((void *)v8 + 1);
      if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *((void *)v8 + 5))
      {
        *(void *)(v7[1] + v22) = *(void *)(*((void *)v8 + 3) + v23);
        *((void *)v8 + 1) += 8;
        uint64_t v22 = v7[3];
      }
      else
      {
        *((unsigned char *)v8 + 16) = 1;
      }
      size_t v45 = v22 + 8;
      goto LABEL_74;
    case 2:
      char v24 = 0;
      unsigned int v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = *((void *)v8 + 1);
      while (2)
      {
        unint64_t v28 = v27 + 1;
        if (v27 == -1)
        {
          uint64_t v27 = -1;
          goto LABEL_55;
        }
        if (v28 > *((void *)v8 + 5))
        {
LABEL_55:
          size_t v31 = 0;
          *((unsigned char *)v8 + 16) = 1;
          unint64_t v28 = v27;
          goto LABEL_59;
        }
        char v29 = *(unsigned char *)(*((void *)v8 + 3) + v27);
        *((void *)v8 + 1) = v28;
        v26 |= (unint64_t)(v29 & 0x7F) << v24;
        if (v29 < 0)
        {
          v24 += 7;
          uint64_t v27 = v28;
          BOOL v30 = v25++ >= 9;
          if (v30)
          {
            size_t v31 = 0;
            goto LABEL_59;
          }
          continue;
        }
        break;
      }
      if (*((unsigned char *)v8 + 16)) {
        size_t v31 = 0;
      }
      else {
        size_t v31 = v26;
      }
LABEL_59:
      uint64_t v47 = 0;
      unint64_t v48 = v31;
      do
      {
        ++v47;
        BOOL v12 = v48 > 0x7F;
        v48 >>= 7;
      }
      while (v12);
      BOOL v30 = __CFADD__(v28, v31);
      unint64_t v49 = v28 + v31;
      if (v30 || v49 > *((void *)v8 + 5) || !_makeSpace(v7, v47 + v31)) {
        goto LABEL_68;
      }
      uint64_t v50 = v7[1] + v7[3];
      if (v31 < 0x80)
      {
        v52 = (unsigned char *)(v7[1] + v7[3]);
        LOBYTE(v53) = v31;
      }
      else
      {
        size_t v51 = v31;
        v52 = (unsigned char *)(v7[1] + v7[3]);
        do
        {
          *v52++ = v51 | 0x80;
          size_t v53 = v51 >> 7;
          size_t v54 = v51 >> 14;
          v51 >>= 7;
        }
        while (v54);
      }
      unsigned char *v52 = v53;
      uint64_t v44 = (uint64_t)&v52[v7[3] - v50 + 1];
      v7[3] = v44;
      uint64_t v56 = *((void *)v8 + 1);
      if (__CFADD__(v56, v31) || v56 + v31 > *((void *)v8 + 5))
      {
        *((unsigned char *)v8 + 16) = 1;
      }
      else
      {
        memcpy((void *)(v7[1] + v44), (const void *)(*((void *)v8 + 3) + v56), v31);
        *((void *)v8 + 1) += v31;
LABEL_50:
        uint64_t v44 = v7[3];
      }
      size_t v45 = v44 + v31;
LABEL_74:
      v7[3] = v45;
LABEL_75:
      BOOL v17 = *((unsigned char *)v8 + 16) == 0;
LABEL_69:

      return v17;
    case 3:
      unint64_t v32 = v7[4] + 1;
      v7[4] = v32;
      if (v32 > _sMaximumRecursionDepth)
      {
        BOOL v17 = 0;
        goto LABEL_69;
      }
      while (2)
      {
        if (*((unsigned char *)v8 + 16)) {
          goto LABEL_52;
        }
        char v35 = 0;
        unsigned int v36 = 0;
        unint64_t v37 = 0;
        unint64_t v38 = *((void *)v8 + 1);
        while (2)
        {
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *((void *)v8 + 5))
          {
            unint64_t v41 = 0;
            uint64_t v42 = 0;
            *((unsigned char *)v8 + 16) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*((void *)v8 + 3) + v38);
            *((void *)v8 + 1) = v39;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              unint64_t v38 = v39;
              BOOL v12 = v36++ > 8;
              if (v12)
              {
                unint64_t v41 = 0;
                uint64_t v42 = 0;
                break;
              }
              continue;
            }
            uint64_t v42 = v37 & 7;
            unint64_t v41 = v37 >> 3;
            if (v42 == 4 && v41 == a2)
            {
LABEL_52:
              uint64_t v46 = v7[4];
              if (v46) {
                v7[4] = v46 - 1;
              }
              goto LABEL_75;
            }
          }
          break;
        }
        BOOL v17 = 0;
        if (PBUnknownFieldAdd(v7, v41, v42, v8)) {
          continue;
        }
        goto LABEL_69;
      }
    case 5:
      if (!_makeSpace(v7, 4)) {
        goto LABEL_68;
      }
      uint64_t v33 = v7[3];
      unint64_t v34 = *((void *)v8 + 1);
      if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *((void *)v8 + 5))
      {
        *(_DWORD *)(v7[1] + v33) = *(_DWORD *)(*((void *)v8 + 3) + v34);
        *((void *)v8 + 1) += 4;
        uint64_t v33 = v7[3];
      }
      else
      {
        *((unsigned char *)v8 + 16) = 1;
      }
      size_t v45 = v33 + 4;
      goto LABEL_74;
    default:
      goto LABEL_69;
  }
}

BOOL _makeSpace(void *a1, uint64_t a2)
{
  id v3 = a1;
  unsigned int v4 = v3;
  uint64_t v5 = *((void *)v3 + 3);
  BOOL v6 = __CFADD__(v5, a2);
  unint64_t v7 = v5 + a2;
  if (v6) {
    goto LABEL_3;
  }
  if (v7 <= *((void *)v3 + 2))
  {
    BOOL v8 = *((void *)v3 + 1) != 0;
    goto LABEL_15;
  }
  unint64_t v9 = 1;
  while (1)
  {
    unint64_t v10 = v9;
    if (v9 >= v7) {
      break;
    }
    v9 *= 2;
    if ((v10 & 0x8000000000000000) != 0)
    {
      unint64_t v10 = -1;
      break;
    }
  }
  size_t v11 = v10 <= 0x10 ? 16 : v10;
  BOOL v12 = malloc_type_realloc(*((void **)v3 + 1), v11, 0x2F04AA8BuLL);
  if (!v12)
  {
LABEL_3:
    BOOL v8 = 0;
  }
  else
  {
    v4[1] = v12;
    v4[2] = v11;
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

uint64_t PBReaderPlaceMark(void *a1, unint64_t *a2)
{
  id v3 = a1;
  char v4 = 0;
  unsigned int v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = v3[1];
  do
  {
    unint64_t v8 = v7 + 1;
    if (v7 == -1 || v8 > v3[5]) {
      goto LABEL_9;
    }
    char v9 = *(unsigned char *)(v3[3] + v7);
    v3[1] = v8;
    v6 |= (unint64_t)(v9 & 0x7F) << v4;
    if ((v9 & 0x80) == 0)
    {
      uint64_t v6 = v6;
      if (!*((unsigned char *)v3 + 16)) {
        goto LABEL_8;
      }
LABEL_11:
      uint64_t v12 = 0;
      goto LABEL_13;
    }
    v4 += 7;
    unint64_t v7 = v8;
  }
  while (v5++ < 9);
  uint64_t v6 = 0;
  if (*((unsigned char *)v3 + 16)) {
    goto LABEL_11;
  }
LABEL_8:
  unint64_t v11 = v8 + v6;
  if (v11 > v3[5])
  {
LABEL_9:
    uint64_t v12 = 0;
    *((unsigned char *)v3 + 16) = 1;
    goto LABEL_13;
  }
  *a2 = v11;
  a2[1] = v3[5];
  v3[5] = v3[1] + v6;
  uint64_t v12 = 1;
LABEL_13:

  return v12;
}

uint64_t _PBReaderSkipValueWithTag(void *a1, int a2, int a3, uint64_t a4)
{
  unint64_t v7 = a1;
  unint64_t v8 = v7;
  uint64_t v9 = 0;
  switch(a3)
  {
    case 0:
      unsigned int v10 = 0;
      unint64_t v11 = v7[1];
      uint64_t v9 = 1;
      do
      {
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > v7[5]) {
          goto LABEL_43;
        }
        int v13 = *(char *)(v7[3] + v11);
        v7[1] = v12;
        if ((v13 & 0x80000000) == 0) {
          break;
        }
        unint64_t v11 = v12;
        BOOL v14 = v10++ > 8;
      }
      while (!v14);
      goto LABEL_46;
    case 1:
      unint64_t v15 = v7[1];
      if (v15 > 0xFFFFFFFFFFFFFFF7) {
        goto LABEL_43;
      }
      unint64_t v16 = v15 + 8;
      goto LABEL_42;
    case 2:
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = v7[1];
      while (2)
      {
        unint64_t v21 = v20 + 1;
        if (v20 == -1)
        {
          uint64_t v20 = -1;
          goto LABEL_38;
        }
        if (v21 > v7[5])
        {
LABEL_38:
          uint64_t v19 = 0;
          *((unsigned char *)v7 + 16) = 1;
          unint64_t v21 = v20;
          goto LABEL_41;
        }
        char v22 = *(unsigned char *)(v7[3] + v20);
        v7[1] = v21;
        v19 |= (unint64_t)(v22 & 0x7F) << v17;
        if (v22 < 0)
        {
          v17 += 7;
          uint64_t v20 = v21;
          BOOL v23 = v18++ >= 9;
          if (v23)
          {
            uint64_t v19 = 0;
            goto LABEL_41;
          }
          continue;
        }
        break;
      }
      uint64_t v19 = v19;
      if (*((unsigned char *)v7 + 16)) {
        uint64_t v19 = 0;
      }
LABEL_41:
      BOOL v23 = __CFADD__(v21, v19);
      unint64_t v16 = v21 + v19;
      if (v23) {
        goto LABEL_43;
      }
LABEL_42:
      if (v16 > v7[5])
      {
LABEL_43:
        uint64_t v9 = 1;
        *((unsigned char *)v8 + 16) = 1;
        goto LABEL_46;
      }
      v7[1] = v16;
LABEL_45:
      uint64_t v9 = 1;
LABEL_46:

      return v9;
    case 3:
      uint64_t v9 = 1;
      if (*((unsigned char *)v7 + 16)) {
        goto LABEL_46;
      }
      unint64_t v24 = a4 + 1;
      do
      {
        char v25 = 0;
        unsigned int v26 = 0;
        unint64_t v27 = 0;
        unint64_t v28 = v8[1];
        while (1)
        {
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > v8[5])
          {
            unint64_t v31 = 0;
            uint64_t v32 = 0;
            *((unsigned char *)v8 + 16) = 1;
            goto LABEL_32;
          }
          char v30 = *(unsigned char *)(v8[3] + v28);
          v8[1] = v29;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0) {
            break;
          }
          v25 += 7;
          unint64_t v28 = v29;
          BOOL v14 = v26++ > 8;
          if (v14)
          {
            unint64_t v31 = 0;
            uint64_t v32 = 0;
            goto LABEL_32;
          }
        }
        uint64_t v32 = v27 & 7;
        unint64_t v31 = v27 >> 3;
        if (v32 == 4 && v31 == a2) {
          goto LABEL_45;
        }
LABEL_32:
        if (v24 >= 0x41) {
          goto LABEL_43;
        }
        _PBReaderSkipValueWithTag(v8, v31, v32, v24);
      }
      while (!*((unsigned char *)v8 + 16));
      goto LABEL_46;
    case 5:
      unint64_t v34 = v7[1];
      if (v34 > 0xFFFFFFFFFFFFFFFBLL) {
        goto LABEL_43;
      }
      unint64_t v16 = v34 + 4;
      goto LABEL_42;
    default:
      goto LABEL_46;
  }
}

std::string *PB::Reader::read(std::string *result, std::string *this)
{
  uint64_t v2 = result;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
  }
  unint64_t size = result->__r_.__value_.__l.__size_;
  if (size < 0xFFFFFFFFFFFFFFF6 && size + 10 <= result->__r_.__value_.__r.__words[2])
  {
    char v10 = 0;
    unsigned int v11 = 0;
    std::string::size_type v12 = 0;
    std::string::size_type v13 = result->__r_.__value_.__r.__words[0];
    while (1)
    {
      unint64_t v7 = size + 1;
      result->__r_.__value_.__l.__size_ = size + 1;
      char v14 = *(unsigned char *)(v13 + size);
      v12 |= (unint64_t)(v14 & 0x7F) << v10;
      if ((v14 & 0x80) == 0) {
        break;
      }
      v10 += 7;
      unint64_t size = v7;
      BOOL v9 = v11++ > 8;
      if (v9)
      {
LABEL_17:
        std::string::size_type v12 = 0;
        break;
      }
    }
  }
  else
  {
    char v4 = 0;
    unsigned int v5 = 0;
    std::string::size_type v6 = 0;
    while (1)
    {
      unint64_t v7 = size + 1;
      if (size == -1)
      {
        unint64_t size = -1;
LABEL_19:
        std::string::size_type v12 = 0;
        result[1].__r_.__value_.__s.__data_[0] = 1;
        unint64_t v7 = size;
        goto LABEL_23;
      }
      if (v7 > result->__r_.__value_.__r.__words[2]) {
        goto LABEL_19;
      }
      char v8 = *(unsigned char *)(result->__r_.__value_.__r.__words[0] + size);
      result->__r_.__value_.__l.__size_ = v7;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        break;
      }
      v4 += 7;
      unint64_t size = v7;
      BOOL v9 = v5++ > 8;
      if (v9) {
        goto LABEL_17;
      }
    }
    if (result[1].__r_.__value_.__s.__data_[0]) {
      std::string::size_type v12 = 0;
    }
    else {
      std::string::size_type v12 = v6;
    }
  }
LABEL_23:
  if (!result[1].__r_.__value_.__s.__data_[0])
  {
    if (__CFADD__(v7, v12) || v7 + v12 > result->__r_.__value_.__r.__words[2])
    {
      result[1].__r_.__value_.__s.__data_[0] = 1;
    }
    else
    {
      __n128 result = std::string::insert(this, 0, (const std::string::value_type *)(result->__r_.__value_.__r.__words[0] + v7), v12);
      v2->__r_.__value_.__l.__size_ += v12;
    }
  }
  return result;
}

void PBDataWriterWriteDataField(uint64_t a1, void *a2, int a3)
{
  id v18 = a2;
  unsigned int v5 = (const void *)[v18 bytes];
  size_t v6 = [v18 length];
  unint64_t v7 = *(void **)(a1 + 8);
  unint64_t v8 = v7[3];
  if (v8 < v7[1] + v6 + 16)
  {
    if (v8 - v7[2] <= v6 + 16) {
      uint64_t v9 = v6 + 16;
    }
    else {
      uint64_t v9 = v8 - v7[2];
    }
    -[PBMutableData _pb_growCapacityBy:](v7, v9);
    unint64_t v7 = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v10 = (8 * a3) | 2u;
    unsigned int v11 = (unsigned char *)v7[1];
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        unint64_t v12 = v10 >> 7;
        unint64_t v13 = v10 >> 14;
        v10 >>= 7;
      }
      while (v13);
    }
    *unsigned int v11 = v12;
    *(void *)(*(void *)(a1 + 8) + 8) = v11 + 1;
    unint64_t v7 = *(void **)(a1 + 8);
  }
  char v14 = (unsigned char *)v7[1];
  if (v6 < 0x80)
  {
    LOBYTE(v16) = v6;
  }
  else
  {
    size_t v15 = v6;
    do
    {
      *v14++ = v15 | 0x80;
      size_t v16 = v15 >> 7;
      size_t v17 = v15 >> 14;
      v15 >>= 7;
    }
    while (v17);
  }
  *char v14 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) = v14 + 1;
  memcpy(*(void **)(*(void *)(a1 + 8) + 8), v5, v6);
  *(void *)(*(void *)(a1 + 8) + 8) += v6;
}

id PBReaderReadString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0;
  unint64_t v6 = *((void *)v1 + 1);
  do
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1 || v7 > *((void *)v1 + 5)) {
      goto LABEL_15;
    }
    char v8 = *(unsigned char *)(*((void *)v1 + 3) + v6);
    *((void *)v1 + 1) = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
    {
      if (*((unsigned char *)v1 + 16)) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v5;
      }
      if (*((unsigned char *)v1 + 16)) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
  }
  while (!v9);
  uint64_t v10 = 0;
  if (*((unsigned char *)v1 + 16))
  {
LABEL_8:
    unsigned int v11 = 0;
    goto LABEL_16;
  }
LABEL_13:
  BOOL v9 = __CFADD__(v7, v10);
  unint64_t v12 = v7 + v10;
  if (v9 || v12 > *((void *)v1 + 5))
  {
LABEL_15:
    unsigned int v11 = 0;
    *((unsigned char *)v1 + 16) = 1;
  }
  else
  {
    uint64_t v14 = [*((id *)v1 + 4) bytes] + *((void *)v1 + 1);
    unsigned int v11 = (void *)[[NSString alloc] initWithBytes:v14 length:v10 encoding:4];
    v2[1] += v10;
  }
LABEL_16:

  return v11;
}

void PBDataWriterWriteStringField(uint64_t a1, void *a2, int a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((unint64_t)[v5 length] <= 0xA5
    && (size_t __n = 0,
        objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 1000, &__n, 4, 4, 0, objc_msgSend(v5, "length"), 0)))
  {
    size_t v6 = __n;
    unint64_t v7 = *(void **)(a1 + 8);
    size_t v8 = v7[3];
    if (v8 < v7[1] + __n + 16)
    {
      if (v8 - v7[2] <= __n + 16) {
        uint64_t v9 = __n + 16;
      }
      else {
        uint64_t v9 = v8 - v7[2];
      }
      -[PBMutableData _pb_growCapacityBy:](v7, v9);
      unint64_t v7 = *(void **)(a1 + 8);
    }
    if (a3 != -1)
    {
      unint64_t v10 = (8 * a3) | 2u;
      unsigned int v11 = (unsigned char *)v7[1];
      if (v10 < 0x80)
      {
        LOBYTE(v12) = (8 * a3) | 2;
      }
      else
      {
        do
        {
          *v11++ = v10 | 0x80;
          unint64_t v12 = v10 >> 7;
          unint64_t v13 = v10 >> 14;
          v10 >>= 7;
        }
        while (v13);
      }
      *unsigned int v11 = v12;
      *(void *)(*(void *)(a1 + 8) + 8) = v11 + 1;
      unint64_t v7 = *(void **)(a1 + 8);
    }
    unint64_t v38 = (unsigned char *)v7[1];
    if (v6 < 0x80)
    {
      LOBYTE(v40) = v6;
    }
    else
    {
      size_t v39 = v6;
      do
      {
        *v38++ = v39 | 0x80;
        size_t v40 = v39 >> 7;
        size_t v41 = v39 >> 14;
        v39 >>= 7;
      }
      while (v41);
    }
    *unint64_t v38 = v40;
    *(void *)(*(void *)(a1 + 8) + 8) = v38 + 1;
    memcpy(*(void **)(*(void *)(a1 + 8) + 8), __src, v6);
    *(void *)(*(void *)(a1 + 8) + 8) += v6;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1AD0EB790]();
    size_t v15 = [v5 dataUsingEncoding:4];
    if ([v15 length])
    {
      id v16 = v15;
      size_t v17 = (const void *)[v16 bytes];
      size_t v18 = [v16 length];
      uint64_t v19 = *(void **)(a1 + 8);
      unint64_t v20 = v19[3];
      if (v20 < v19[1] + v18 + 16)
      {
        if (v20 - v19[2] <= v18 + 16) {
          uint64_t v21 = v18 + 16;
        }
        else {
          uint64_t v21 = v20 - v19[2];
        }
        -[PBMutableData _pb_growCapacityBy:](v19, v21);
        uint64_t v19 = *(void **)(a1 + 8);
      }
      if (a3 != -1)
      {
        unint64_t v22 = (8 * a3) | 2u;
        BOOL v23 = (unsigned char *)v19[1];
        if (v22 < 0x80)
        {
          LOBYTE(v24) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v23++ = v22 | 0x80;
            unint64_t v24 = v22 >> 7;
            unint64_t v25 = v22 >> 14;
            v22 >>= 7;
          }
          while (v25);
        }
        *BOOL v23 = v24;
        *(void *)(*(void *)(a1 + 8) + 8) = v23 + 1;
        uint64_t v19 = *(void **)(a1 + 8);
      }
      uint64_t v33 = (unsigned char *)v19[1];
      if (v18 < 0x80)
      {
        LOBYTE(v35) = v18;
      }
      else
      {
        size_t v34 = v18;
        do
        {
          *v33++ = v34 | 0x80;
          size_t v35 = v34 >> 7;
          size_t v36 = v34 >> 14;
          v34 >>= 7;
        }
        while (v36);
      }
      *uint64_t v33 = v35;
      *(void *)(*(void *)(a1 + 8) + 8) = v33 + 1;
      memcpy(*(void **)(*(void *)(a1 + 8) + 8), v17, v18);
      *(void *)(*(void *)(a1 + 8) + 8) += v18;
    }
    else
    {
      unsigned int v26 = *(void **)(a1 + 8);
      unint64_t v27 = v26[3];
      if (v27 < v26[1] + 16)
      {
        if (v27 - v26[2] <= 0x10) {
          uint64_t v28 = 16;
        }
        else {
          uint64_t v28 = v27 - v26[2];
        }
        -[PBMutableData _pb_growCapacityBy:](v26, v28);
        unsigned int v26 = *(void **)(a1 + 8);
      }
      if (a3 != -1)
      {
        unint64_t v29 = (8 * a3) | 2u;
        char v30 = (unsigned char *)v26[1];
        if (v29 < 0x80)
        {
          LOBYTE(v31) = (8 * a3) | 2;
        }
        else
        {
          do
          {
            *v30++ = v29 | 0x80;
            unint64_t v31 = v29 >> 7;
            unint64_t v32 = v29 >> 14;
            v29 >>= 7;
          }
          while (v32);
        }
        *char v30 = v31;
        *(void *)(*(void *)(a1 + 8) + 8) = v30 + 1;
        unsigned int v26 = *(void **)(a1 + 8);
      }
      unint64_t v37 = (unsigned char *)v26[1];
      *unint64_t v37 = 0;
      *(void *)(*(void *)(a1 + 8) + 8) = v37 + 1;
    }
  }
}

void *PBDataWriterWriteSubmessage(uint64_t a1, void *a2, int a3)
{
  uint64_t v7 = 0;
  id v5 = a2;
  PBDataWriterPlaceMark(a1, &v7, a3);
  [v5 writeTo:a1];

  return PBDataWriterRecallMark(a1, &v7);
}

void *PBDataWriterWriteDoubleField(uint64_t a1, int a2, double a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    __n128 result = *(void **)(a1 + 8);
  }
  if (a2 != -1)
  {
    unint64_t v9 = (8 * a2) | 1u;
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  *(double *)result[1] = a3;
  *(void *)(*(void *)(a1 + 8) + 8) += 8;
  return result;
}

void *PBDataWriterPlaceMark(uint64_t a1, void *a2, int a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 10)
  {
    if (v7 - result[2] <= 0xA) {
      uint64_t v8 = 10;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    __n128 result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 2u;
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  ++result[1];
  *a2 = *(void *)(*(void *)(a1 + 8) + 8) - *(void *)(*(void *)(a1 + 8) + 16);
  return result;
}

void *PBDataWriterRecallMark(uint64_t a1, uint64_t *a2)
{
  __n128 result = *(void **)(a1 + 8);
  uint64_t v5 = result[1];
  uint64_t v6 = result[2];
  uint64_t v7 = *a2;
  size_t v8 = v5 - (*a2 + v6);
  unint64_t v9 = -1;
  unint64_t v10 = v8;
  do
  {
    ++v9;
    BOOL v11 = v10 > 0x7F;
    v10 >>= 7;
  }
  while (v11);
  if (v9)
  {
    unint64_t v12 = result[3];
    if (v12 < v5 + v9)
    {
      unint64_t v13 = v12 - v6;
      if (v13 <= v9) {
        uint64_t v14 = v9;
      }
      else {
        uint64_t v14 = v13;
      }
      -[PBMutableData _pb_growCapacityBy:](result, v14);
      uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 16);
      uint64_t v7 = *a2;
    }
    __n128 result = memmove((void *)(v6 + v7 + v9), (const void *)(v6 + v7), v8);
    uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 16);
    uint64_t v7 = *a2;
  }
  size_t v15 = (unsigned char *)(v6 + v7 - 1);
  if (v8 < 0x80)
  {
    LOBYTE(v16) = v8;
  }
  else
  {
    do
    {
      *v15++ = v8 | 0x80;
      size_t v16 = v8 >> 7;
      size_t v17 = v8 >> 14;
      v8 >>= 7;
    }
    while (v17);
  }
  *size_t v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8) += v9;
  return result;
}

void *PBDataWriterWriteBOOLField(uint64_t a1, char a2, int a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    __n128 result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  unint64_t v13 = (unsigned char *)result[1];
  *unint64_t v13 = a2;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

void *PBDataWriterWriteInt64Field(uint64_t a1, unint64_t a2, int a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    __n128 result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  unint64_t v13 = (unsigned char *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }
  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      unint64_t v14 = a2 >> 7;
      unint64_t v15 = a2 >> 14;
      a2 >>= 7;
    }
    while (v15);
  }
  *unint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

void PBRepeatedInt32Copy(uint64_t a1, uint64_t a2)
{
}

void PBRepeatedInt64Clear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

uint64_t PBHashBytes(uint64_t a1, uint64_t a2)
{
  if ((int)a2 < 4)
  {
    unsigned int v2 = 0;
    LODWORD(v3) = a2;
  }
  else
  {
    unsigned int v2 = 0;
    uint64_t v3 = (int)a2;
    unsigned int v4 = (unsigned __int8 *)(a1 + 3);
    do
    {
      unsigned int v5 = *(v4 - 3) + 16 * v2;
      unsigned int v6 = *(v4 - 2) + 16 * (v5 ^ (16 * (v5 >> 28)));
      unsigned int v7 = *(v4 - 1) + 16 * (v6 ^ (16 * (v6 >> 28)));
      int v8 = *v4;
      v4 += 4;
      int v9 = v8 + 16 * (v7 ^ (16 * (v7 >> 28)));
      uint64_t v10 = v3;
      unsigned int v2 = (v9 ^ ((v9 & 0xF0000000) >> 24)) & ~(v9 & 0xF0000000);
      v3 -= 4;
    }
    while (v10 > 7);
  }
  switch(v3)
  {
    case 1:
      uint64_t v11 = a2 << 32;
LABEL_13:
      int v14 = *(unsigned __int8 *)(a1 + ((v11 - 0x100000000) >> 32)) + 16 * v2;
      return (v14 ^ ((v14 & 0xF0000000) >> 24)) & ~(v14 & 0xF0000000);
    case 3:
      uint64_t v11 = a2 << 32;
      int v12 = *(unsigned __int8 *)(a1 + (((a2 << 32) - 0x300000000) >> 32)) + 16 * v2;
      unsigned int v2 = (v12 ^ ((v12 & 0xF0000000) >> 24)) & ~(v12 & 0xF0000000);
      goto LABEL_12;
    case 2:
      uint64_t v11 = a2 << 32;
LABEL_12:
      int v13 = *(unsigned __int8 *)(a1 + ((v11 - 0x200000000) >> 32)) + 16 * v2;
      unsigned int v2 = (v13 ^ ((v13 & 0xF0000000) >> 24)) & ~(v13 & 0xF0000000);
      goto LABEL_13;
  }
  return v2;
}

uint64_t PBRepeatedInt32Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void *PBDataWriterWriteFloatField(uint64_t a1, int a2, float a3)
{
  __n128 result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    __n128 result = *(void **)(a1 + 8);
  }
  if (a2 != -1)
  {
    unint64_t v9 = (8 * a2) | 5u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    __n128 result = *(void **)(a1 + 8);
  }
  *(float *)result[1] = a3;
  *(void *)(*(void *)(a1 + 8) + 8) += 4;
  return result;
}

void PBRepeatedUInt64Copy(uint64_t a1, uint64_t a2)
{
}

void PBRepeatedInt64Copy(uint64_t a1, uint64_t a2)
{
}

uint64_t PBDataWriterWriteBareVarint(unsigned char *a1, unint64_t a2)
{
  unsigned int v2 = a1;
  if (a2 < 0x80)
  {
    LOBYTE(v3) = a2;
  }
  else
  {
    do
    {
      *v2++ = a2 | 0x80;
      unint64_t v3 = a2 >> 7;
      unint64_t v4 = a2 >> 14;
      a2 >>= 7;
    }
    while (v4);
  }
  *unsigned int v2 = v3;
  return v2 - a1 + 1;
}

void PBRepeatedDoubleClear(uint64_t a1)
{
  unsigned int v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

uint64_t PBReaderReadVarIntBuf(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    if (a2 == v5) {
      return 0;
    }
    char v7 = *(unsigned char *)(a1 + v5);
    v6 |= (unint64_t)(v7 & 0x7F) << v4;
    ++v5;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v4 += 7;
    if (v5 == 10)
    {
      uint64_t result = 0;
      *a4 = 11;
      *a3 = 0;
      return result;
    }
  }
  *a3 = v6;
  *a4 = v5;
  return 1;
}

id PBRepeatedUInt64NSArray(void *a1)
{
  unsigned int v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1[1]];
  if (a1[1])
  {
    unint64_t v3 = 0;
    do
    {
      char v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(*a1 + 8 * v3)];
      [v2 addObject:v4];

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

uint64_t PBRepeatedInt64Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

void *PBRepeatedUInt64Add(void *result, uint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = malloc_type_realloc((void *)*result, 16 * v4, 0x100004000313F17uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          uint64_t v7 = v3[1];
          result[v7] = a2;
          *unint64_t v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(void *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    uint64_t result = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *unint64_t v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      result[v6] = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

uint64_t PB::Reader::Reader(uint64_t this, const unsigned __int8 *a2, uint64_t a3)
{
  *(void *)this = a2;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = a3;
  *(unsigned char *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = a2;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = a3;
  *(unsigned char *)(this + 24) = 0;
  return this;
}

void PBRepeatedUInt64Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        unint64_t v7 = -1;
        break;
      }
    }
    if (v7 <= 8) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = malloc_type_realloc(v10, 8 * v8, 0x100004000313F17uLL);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 8 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }
  else
  {
    unint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
  }
}

void PBRepeatedInt64Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        unint64_t v7 = -1;
        break;
      }
    }
    if (v7 <= 8) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = malloc_type_realloc(v10, 8 * v8, 0x100004000313F17uLL);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 8 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }
  else
  {
    unint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
  }
}

void *PBDataWriterWriteSfixed32Field(uint64_t a1, int a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 5u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 4;
  return result;
}

unint64_t PBReaderReadBigEndianFixed64(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFF7 && (unint64_t v3 = v2 + 8, v2 + 8 <= v1[5]))
  {
    unint64_t v4 = *(void *)(v1[3] + v2);
    v1[1] = v3;
  }
  else
  {
    unint64_t v4 = 0;
    *((unsigned char *)v1 + 16) = 1;
  }
  unint64_t v5 = bswap64(v4);

  return v5;
}

void *PBDataWriterWriteSfixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 1u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }
  *(void *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 8;
  return result;
}

void *PBDataWriterWriteFixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 1u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }
  *(void *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 8;
  return result;
}

void *PBDataWriterWriteFixed32Field(uint64_t a1, int a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 5u;
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }
  *(_DWORD *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8) += 4;
  return result;
}

void *PBDataWriterWriteSint32Field(uint64_t a1, int a2, int a3)
{
  unint64_t v5 = (2 * a2) ^ (a2 >> 31);
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    uint64_t v10 = (unsigned char *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }
    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    *uint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }
  int v13 = (unsigned char *)result[1];
  if (v5 < 0x80)
  {
    LOBYTE(v14) = v5;
  }
  else
  {
    do
    {
      *v13++ = v5 | 0x80;
      unint64_t v14 = v5 >> 7;
      unint64_t v15 = v5 >> 14;
      v5 >>= 7;
    }
    while (v15);
  }
  *int v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
  return result;
}

void *PBDataWriterWriteSint64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = 2 * a2;
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v8 = result[3];
  if (v8 < result[1] + 16)
  {
    unint64_t v9 = v8 - result[2];
    if (v9 <= 0x10) {
      uint64_t v10 = 16;
    }
    else {
      uint64_t v10 = v9;
    }
    -[PBMutableData _pb_growCapacityBy:](result, v10);
    uint64_t result = *(void **)(a1 + 8);
  }
  unint64_t v11 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    unint64_t v12 = (8 * a3);
    int v13 = (unsigned char *)result[1];
    if (v12 < 0x80)
    {
      LOBYTE(v14) = 8 * a3;
    }
    else
    {
      do
      {
        *v13++ = v12 | 0x80;
        unint64_t v14 = v12 >> 7;
        unint64_t v15 = v12 >> 14;
        v12 >>= 7;
      }
      while (v15);
    }
    *int v13 = v14;
    *(void *)(*(void *)(a1 + 8) + 8) = v13 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }
  size_t v16 = (unsigned char *)result[1];
  if (v11 < 0x80)
  {
    uint64_t v17 = v6 ^ (a2 >> 63);
  }
  else
  {
    do
    {
      *v16++ = v11 | 0x80;
      uint64_t v17 = v11 >> 7;
      unint64_t v18 = v11 >> 14;
      v11 >>= 7;
    }
    while (v18);
  }
  *size_t v16 = v17;
  *(void *)(*(void *)(a1 + 8) + 8) = v16 + 1;
  return result;
}

void PBDataWriterWriteSubgroup(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 8);
  unint64_t v7 = v6[3];
  id v22 = v5;
  if (v7 < v6[1] + 8)
  {
    unint64_t v8 = v7 - v6[2];
    if (v8 <= 8) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](v6, v9);
    id v5 = v22;
  }
  if (a3 != -1)
  {
    unint64_t v10 = (8 * a3) | 3u;
    unint64_t v11 = *(unsigned char **)(*(void *)(a1 + 8) + 8);
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 3;
    }
    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        unint64_t v12 = v10 >> 7;
        unint64_t v13 = v10 >> 14;
        v10 >>= 7;
      }
      while (v13);
    }
    *unint64_t v11 = v12;
    *(void *)(*(void *)(a1 + 8) + 8) = v11 + 1;
  }
  [v5 writeTo:a1];
  unint64_t v14 = *(void **)(a1 + 8);
  unint64_t v15 = v14[3];
  if (v15 < v14[1] + 8)
  {
    unint64_t v16 = v15 - v14[2];
    if (v16 <= 8) {
      uint64_t v17 = 8;
    }
    else {
      uint64_t v17 = v16;
    }
    -[PBMutableData _pb_growCapacityBy:](v14, v17);
  }
  if (a3 != -1)
  {
    unint64_t v18 = (8 * a3) | 4u;
    uint64_t v19 = *(unsigned char **)(*(void *)(a1 + 8) + 8);
    if (v18 < 0x80)
    {
      LOBYTE(v20) = (8 * a3) | 4;
    }
    else
    {
      do
      {
        *v19++ = v18 | 0x80;
        unint64_t v20 = v18 >> 7;
        unint64_t v21 = v18 >> 14;
        v18 >>= 7;
      }
      while (v21);
    }
    *uint64_t v19 = v20;
    *(void *)(*(void *)(a1 + 8) + 8) = v19 + 1;
  }
}

void sub_1A8FDDBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void _textFormatDictionary(void *a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v6)
  {
    if (*(uint64_t *)a3 >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        [*(id *)(a3 + 8) appendString:@"  "];
        ++v7;
      }
      while (v7 < *(void *)a3);
    }
    [*(id *)(a3 + 8) appendString:v6];
    [*(id *)(a3 + 8) appendString:@" {\n"];
    ++*(void *)a3;
  }
  unint64_t v8 = [v5 allKeys];
  uint64_t v9 = [v8 sortedArrayUsingSelector:sel_compare_];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v16 = objc_msgSend(v5, "objectForKey:", v15, (void)v19);
        _textFormat(v16, v15, a3);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  if (v6)
  {
    uint64_t v17 = (*(void *)a3)--;
    if (v17 >= 2)
    {
      uint64_t v18 = 0;
      do
      {
        objc_msgSend(*(id *)(a3 + 8), "appendString:", @"  ", (void)v19);
        ++v18;
      }
      while (v18 < *(void *)a3);
    }
    objc_msgSend(*(id *)(a3 + 8), "appendString:", @"}\n", (void)v19);
  }
}

void _textFormat(void *a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [v6 description];

    id v6 = (id)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    id v9 = v6;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          _textFormat(*(void *)(*((void *)&v20 + 1) + 8 * v13++), v9, a3);
        }
        while (v11 != v13);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
LABEL_11:

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v6;
    unint64_t v15 = [v5 dataUsingEncoding:4];
    _textFormatData(v15, v14, a3);

    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    _textFormatData(v5, v6, a3);
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    id v9 = v6;
    if (*(uint64_t *)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        [*(id *)(a3 + 8) appendString:@"  "];
        ++v16;
      }
      while (v16 < *(void *)a3);
    }
    [*(id *)(a3 + 8) appendString:v9];
    [*(id *)(a3 + 8) appendString:@": "];
    uint64_t v17 = *(void **)(a3 + 8);
    uint64_t v18 = [v8 description];
    [v17 appendString:v18];

    [*(id *)(a3 + 8) appendString:@"\n"];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    _textFormatDictionary(v5, v6, a3);
  }
  else
  {
    uint64_t v19 = objc_opt_class();
    NSLog(&cfstr_UnhandledValue.isa, v19);
  }
LABEL_24:
}

void _textFormatData(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (*(uint64_t *)a3 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      [*(id *)(a3 + 8) appendString:@"  "];
      ++v7;
    }
    while (v7 < *(void *)a3);
  }
  [*(id *)(a3 + 8) appendString:v6];
  [*(id *)(a3 + 8) appendString:@": \""];
  id v16 = v5;
  id v8 = (unsigned __int8 *)[v16 bytes];
  uint64_t v9 = [v16 length];
  if (v9)
  {
    for (uint64_t i = v9; i; --i)
    {
      int v12 = *v8++;
      uint64_t v11 = v12;
      if (v12 <= 33)
      {
        switch((int)v11)
        {
          case 0:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\0";
            goto LABEL_21;
          case 7:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\a";
            goto LABEL_21;
          case 8:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\b";
            goto LABEL_21;
          case 9:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\t";
            goto LABEL_21;
          case 10:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\n";
            goto LABEL_21;
          case 12:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\f";
            goto LABEL_21;
          case 13:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\r";
            goto LABEL_21;
          default:
            goto LABEL_24;
        }
      }
      switch(v11)
      {
        case '""':
          uint64_t v13 = *(void **)(a3 + 8);
          id v14 = @"\\\"";
          break;
        case '\'':
          uint64_t v13 = *(void **)(a3 + 8);
          id v14 = @"\\'";
          break;
        case '\\':
          uint64_t v13 = *(void **)(a3 + 8);
          id v14 = @"\\\\"";
          break;
        default:
LABEL_24:
          unint64_t v15 = *(void **)(a3 + 8);
          if ((v11 - 32) < 0x3C || (v11 - 93) <= 0x20) {
            objc_msgSend(v15, "appendFormat:", @"%c", v11);
          }
          else {
            objc_msgSend(v15, "appendFormat:", @"\\%03hho", v11);
          }
          continue;
      }
LABEL_21:
      [v13 appendString:v14];
    }
  }
  [*(id *)(a3 + 8) appendString:@"\"\n"];
}

uint64_t PB::Base::formattedText(PB::Base *this)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v4);
  char v8 = 0;
  LOBYTE(__p) = 0;
  (*(void (**)(PB::Base *, void *, void))(*(void *)this + 32))(this, v4, 0);
  std::stringbuf::str();
  if (v8 < 0) {
    operator delete(__p);
  }
  v4[0] = *MEMORY[0x1E4FBA408];
  uint64_t v2 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v4 + *(void *)(v4[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v4[2] = v2;
  v4[3] = MEMORY[0x1E4FBA470] + 16;
  if (v5 < 0) {
    operator delete((void *)v4[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1AD0EB550](&v6);
}

void sub_1A8FDE574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void PB::TextFormatter::~TextFormatter(void **this)
{
  if (*((char *)this + 303) < 0) {
    operator delete(this[35]);
  }
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *this = (void *)*MEMORY[0x1E4FBA408];
  unint64_t v4 = *(void **)(v2 + 72);
  *(void **)((char *)this + *(void *)(v3 - 24)) = *(void **)(v2 + 64);
  this[2] = v4;
  this[3] = (void *)(MEMORY[0x1E4FBA470] + 16);
  if (*((char *)this + 111) < 0) {
    operator delete(this[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1AD0EB550](this + 16);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA488] + 104;
  *(void *)(a1 + 128) = MEMORY[0x1E4FBA488] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x1E4FBA488] + 64;
  *(void *)(a1 + 16) = MEMORY[0x1E4FBA488] + 64;
  char v5 = (void *)MEMORY[0x1E4FBA408];
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA408] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x1E4FBA408] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  char v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x1E4FBA488] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_1A8FDE980(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x1AD0EB550](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1AD0EB550](a1 + 128);
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5D72948, MEMORY[0x1E4FBA1C8]);
}

void sub_1A8FDEB40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

PB::Data *PB::Data::Data(PB::Data *this, const unsigned __int8 *a2, uint64_t a3)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  PB::Data::assign((void **)this, a2, &a2[a3]);
  return this;
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  PB::Data::assign((void **)this, a2, &a2[a3]);
  return this;
}

void PB::Data::assign(void **this, const unsigned __int8 *__src, const unsigned __int8 *a3)
{
  size_t v3 = a3 - __src;
  if (a3 >= __src)
  {
    uint64_t v6 = *this;
    if ((unint64_t)this[1] < v3)
    {
      uint64_t v6 = malloc_type_realloc(v6, a3 - __src, 0xDBF3321BuLL);
      if (!v6)
      {
        free(*this);
        *this = 0;
        this[1] = 0;
        return;
      }
      *this = v6;
    }
    this[1] = (void *)v3;
    memcpy(v6, __src, v3);
  }
}

PB::Data *PB::Data::Data(PB::Data *this, const PB::Data *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v3 = *((void *)a2 + 1);
  if (v3) {
    PB::Data::assign((void **)this, *(const unsigned __int8 **)a2, (const unsigned __int8 *)(*(void *)a2 + v3));
  }
  return this;
}

{
  uint64_t v3;

  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v3 = *((void *)a2 + 1);
  if (v3) {
    PB::Data::assign((void **)this, *(const unsigned __int8 **)a2, (const unsigned __int8 *)(*(void *)a2 + v3));
  }
  return this;
}

void PB::Data::clear(void **this)
{
  *this = 0;
  this[1] = 0;
}

BOOL PB::Data::operator==(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

void *PBRepeatedDoubleAdd(void *result, double a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = malloc_type_realloc((void *)*result, 16 * v4, 0x100004000313F17uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          uint64_t v7 = v3[1];
          *(double *)&result[v7] = a2;
          *uint64_t v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(double *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    uint64_t result = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *uint64_t v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *(double *)&result[v6] = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

id PBRepeatedDoubleNSArray(void *a1)
{
  size_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1[1]];
  if (a1[1])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [NSNumber numberWithDouble:*(double *)(*a1 + 8 * v3)];
      [v2 addObject:v4];

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

void PBRepeatedDoubleSet(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        unint64_t v7 = -1;
        break;
      }
    }
    if (v7 <= 8) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = malloc_type_realloc(v10, 8 * v8, 0x100004000313F17uLL);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 8 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }
  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedDoubleIsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

uint64_t PBRepeatedDoubleHash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

void PBRepeatedDoubleCopy(uint64_t a1, uint64_t a2)
{
}

void *PBRepeatedFloatAdd(void *result, float a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = malloc_type_realloc((void *)*result, 8 * v4, 0x100004052888210uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          uint64_t v7 = v3[1];
          *((float *)result + v7) = a2;
          *unint64_t v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(float *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    uint64_t result = malloc_type_malloc(0x20uLL, 0x100004052888210uLL);
    *unint64_t v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((float *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void PBRepeatedFloatClear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

id PBRepeatedFloatNSArray(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1[1]];
  if (a1[1])
  {
    unint64_t v4 = 0;
    do
    {
      LODWORD(v3) = *(_DWORD *)(*a1 + 4 * v4);
      uint64_t v5 = [NSNumber numberWithFloat:v3];
      [v2 addObject:v5];

      ++v4;
    }
    while (v4 < a1[1]);
  }
  return v2;
}

void PBRepeatedFloatSet(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        unint64_t v7 = -1;
        break;
      }
    }
    if (v7 <= 8) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = malloc_type_realloc(v10, 4 * v8, 0x100004052888210uLL);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 4 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }
  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedFloatIsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

uint64_t PBRepeatedFloatHash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void PBRepeatedFloatCopy(uint64_t a1, uint64_t a2)
{
}

id PBRepeatedInt32NSArray(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1[1]];
  if (a1[1])
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = [NSNumber numberWithInt:*(unsigned int *)(*a1 + 4 * v3)];
      [v2 addObject:v4];

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

void *PBRepeatedInt64Add(void *result, uint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = malloc_type_realloc((void *)*result, 16 * v4, 0x100004000313F17uLL);
        if (result)
        {
          v3[2] = 2 * v4;
          uint64_t v7 = v3[1];
          result[v7] = a2;
          *unint64_t v3 = result;
          v3[1] = v7 + 1;
        }
      }
    }
    else
    {
      *(void *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    uint64_t result = malloc_type_malloc(0x40uLL, 0x100004000313F17uLL);
    *unint64_t v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      result[v6] = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

id PBRepeatedInt64NSArray(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1[1]];
  if (a1[1])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [NSNumber numberWithLongLong:*(void *)(*a1 + 8 * v3)];
      [v2 addObject:v4];

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

BOOL PBRepeatedInt64IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

id PBRepeatedUInt32NSArray(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1[1]];
  if (a1[1])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*a1 + 4 * v3)];
      [v2 addObject:v4];

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

void PBRepeatedUInt32Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        unint64_t v7 = -1;
        break;
      }
    }
    if (v7 <= 8) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = malloc_type_realloc(v10, 4 * v8, 0x100004052888210uLL);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, 4 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }
  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedUInt32IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

uint64_t PBRepeatedUInt32Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void PBRepeatedUInt32Copy(uint64_t a1, uint64_t a2)
{
}

uint64_t PBRepeatedUInt64Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

void *PBRepeatedBOOLAdd(void *result, char a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t v7 = 2 * v4;
        uint64_t result = malloc_type_realloc((void *)*result, 2 * v4, 0x100004077774924uLL);
        if (result)
        {
          v3[2] = v7;
          uint64_t v8 = v3[1];
          *((unsigned char *)result + v8) = a2;
          *unint64_t v3 = result;
          v3[1] = v8 + 1;
        }
      }
    }
    else
    {
      *(unsigned char *)(*result + v5) = a2;
      result[1] = v5 + 1;
    }
  }
  else
  {
    result[2] = 8;
    uint64_t result = malloc_type_malloc(8uLL, 0x100004077774924uLL);
    *unint64_t v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((unsigned char *)result + v6) = a2;
      v3[1] = v6 + 1;
    }
    else
    {
      v3[2] = 0;
    }
  }
  return result;
}

void PBRepeatedBOOLClear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
}

id PBRepeatedBOOLNSArray(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1[1]];
  if (a1[1])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(*a1 + v3)];
      [v2 addObject:v4];

      ++v3;
    }
    while (v3 < a1[1]);
  }
  return v2;
}

void PBRepeatedBOOLSet(uint64_t a1, void *__src, size_t __n)
{
  if (__n)
  {
    size_t v6 = 1;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= __n) {
        break;
      }
      v6 *= 2;
      if ((v7 & 0x8000000000000000) != 0)
      {
        unint64_t v7 = -1;
        break;
      }
    }
    if (v7 <= 8) {
      size_t v8 = 8;
    }
    else {
      size_t v8 = v7;
    }
    if (v8 >= __n)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = malloc_type_realloc(v10, v8, 0x100004077774924uLL);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }
      memcpy(v10, __src, __n);
      *(void *)(a1 + 8) = __n;
    }
  }
  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
  }
}

BOOL PBRepeatedBOOLIsEqual(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t PBRepeatedBOOLHash(uint64_t *a1)
{
  return PBHashBytes(*a1, a1[1]);
}

void PBRepeatedBOOLCopy(uint64_t a1, uint64_t a2)
{
}

void *PB::Reader::read(void *result, char **a2)
{
  unint64_t v3 = result;
  uint64_t v4 = *a2;
  a2[1] = *a2;
  unint64_t v5 = result[1];
  if (v5 < 0xFFFFFFFFFFFFFFF6 && v5 + 10 <= result[2])
  {
    char v12 = 0;
    unsigned int v13 = 0;
    size_t v14 = 0;
    uint64_t v15 = *result;
    while (1)
    {
      unint64_t v9 = v5 + 1;
      result[1] = v5 + 1;
      char v16 = *(unsigned char *)(v15 + v5);
      v14 |= (unint64_t)(v16 & 0x7F) << v12;
      if ((v16 & 0x80) == 0) {
        break;
      }
      v12 += 7;
      unint64_t v5 = v9;
      BOOL v11 = v13++ > 8;
      if (v11)
      {
LABEL_14:
        size_t v14 = 0;
        break;
      }
    }
  }
  else
  {
    char v6 = 0;
    unsigned int v7 = 0;
    size_t v8 = 0;
    while (1)
    {
      unint64_t v9 = v5 + 1;
      if (v5 == -1)
      {
        unint64_t v5 = -1;
LABEL_16:
        size_t v14 = 0;
        *((unsigned char *)result + 24) = 1;
        unint64_t v9 = v5;
        goto LABEL_20;
      }
      if (v9 > result[2]) {
        goto LABEL_16;
      }
      char v10 = *(unsigned char *)(*result + v5);
      result[1] = v9;
      v8 |= (unint64_t)(v10 & 0x7F) << v6;
      if ((v10 & 0x80) == 0) {
        break;
      }
      v6 += 7;
      unint64_t v5 = v9;
      BOOL v11 = v7++ > 8;
      if (v11) {
        goto LABEL_14;
      }
    }
    if (*((unsigned char *)result + 24)) {
      size_t v14 = 0;
    }
    else {
      size_t v14 = v8;
    }
  }
LABEL_20:
  if (!*((unsigned char *)result + 24))
  {
    if (__CFADD__(v9, v14) || v9 + v14 > result[2])
    {
      *((unsigned char *)result + 24) = 1;
      return result;
    }
    uint64_t v17 = (const void *)(*result + v9);
    unint64_t v18 = (unint64_t)a2[2];
    if (v18 - (unint64_t)v4 >= v14)
    {
      if (!v14)
      {
LABEL_38:
        a2[1] = &v4[v14];
        v3[1] += v14;
        return result;
      }
      long long v21 = v4;
    }
    else
    {
      if (v4)
      {
        a2[1] = v4;
        operator delete(v4);
        unint64_t v18 = 0;
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
      }
      if ((v14 & 0x8000000000000000) != 0) {
        goto LABEL_40;
      }
      uint64_t v19 = 2 * v18;
      if (2 * v18 <= v14) {
        uint64_t v19 = v14;
      }
      size_t v20 = v18 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v19;
      if ((v20 & 0x8000000000000000) != 0) {
LABEL_40:
      }
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      long long v21 = (char *)operator new(v20);
      uint64_t v4 = v21;
      *a2 = v21;
      a2[1] = v21;
      a2[2] = &v21[v20];
    }
    uint64_t result = memmove(v21, v17, v14);
    goto LABEL_38;
  }
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void PB::Reader::read(PB::Reader *this, void **a2)
{
  free(*a2);
  *a2 = 0;
  a2[1] = 0;
  unint64_t v4 = *((void *)this + 1);
  if (v4 < 0xFFFFFFFFFFFFFFF6 && v4 + 10 <= *((void *)this + 2))
  {
    char v11 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)this;
    while (1)
    {
      unint64_t v8 = v4 + 1;
      *((void *)this + 1) = v4 + 1;
      char v15 = *(unsigned char *)(v14 + v4);
      v13 |= (unint64_t)(v15 & 0x7F) << v11;
      if ((v15 & 0x80) == 0) {
        break;
      }
      v11 += 7;
      unint64_t v4 = v8;
      BOOL v10 = v12++ > 8;
      if (v10)
      {
LABEL_14:
        uint64_t v13 = 0;
        break;
      }
    }
  }
  else
  {
    char v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = v4 + 1;
      if (v4 == -1)
      {
        unint64_t v4 = -1;
LABEL_16:
        uint64_t v13 = 0;
        *((unsigned char *)this + 24) = 1;
        unint64_t v8 = v4;
        goto LABEL_20;
      }
      if (v8 > *((void *)this + 2)) {
        goto LABEL_16;
      }
      char v9 = *(unsigned char *)(*(void *)this + v4);
      *((void *)this + 1) = v8;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        break;
      }
      v5 += 7;
      unint64_t v4 = v8;
      BOOL v10 = v6++ > 8;
      if (v10) {
        goto LABEL_14;
      }
    }
    if (*((unsigned char *)this + 24)) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v7;
    }
  }
LABEL_20:
  if (!*((unsigned char *)this + 24))
  {
    if (__CFADD__(v8, v13) || v8 + v13 > *((void *)this + 2))
    {
      *((unsigned char *)this + 24) = 1;
    }
    else
    {
      PB::Data::assign(a2, (const unsigned __int8 *)(*(void *)this + v8), (const unsigned __int8 *)(*(void *)this + v8 + v13));
      *((void *)this + 1) += v13;
    }
  }
}

uint64_t PB::Reader::skip(PB::Reader *this, int a2, int a3, int a4)
{
  uint64_t v4 = 0;
  switch(a3)
  {
    case 0:
      unint64_t v6 = *((void *)this + 1);
      if (v6 < 0xFFFFFFFFFFFFFFF6 && v6 + 10 <= *((void *)this + 2))
      {
        unsigned int v36 = 0;
        uint64_t v37 = *(void *)this;
        uint64_t v4 = 1;
        do
        {
          *((void *)this + 1) = v6 + 1;
          if ((*(char *)(v37 + v6) & 0x80000000) == 0) {
            break;
          }
          ++v6;
          BOOL v10 = v36++ > 8;
        }
        while (!v10);
      }
      else
      {
        unsigned int v7 = 0;
        uint64_t v4 = 1;
        do
        {
          unint64_t v8 = v6 + 1;
          if (v6 == -1 || v8 > *((void *)this + 2)) {
            goto LABEL_68;
          }
          int v9 = *(char *)(*(void *)this + v6);
          *((void *)this + 1) = v8;
          if ((v9 & 0x80000000) == 0) {
            break;
          }
          unint64_t v6 = v8;
          BOOL v10 = v7++ > 8;
        }
        while (!v10);
      }
      return v4;
    case 1:
      unint64_t v11 = *((void *)this + 1);
      if (v11 > 0xFFFFFFFFFFFFFFF7) {
        goto LABEL_68;
      }
      unint64_t v12 = v11 + 8;
      goto LABEL_67;
    case 2:
      unint64_t v13 = *((void *)this + 1);
      if (v13 < 0xFFFFFFFFFFFFFFF6 && v13 + 10 <= *((void *)this + 2))
      {
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v16 = 0;
        uint64_t v40 = *(void *)this;
        do
        {
          unint64_t v17 = v13 + 1;
          *((void *)this + 1) = v13 + 1;
          char v41 = *(unsigned char *)(v40 + v13);
          v16 |= (unint64_t)(v41 & 0x7F) << v38;
          if ((v41 & 0x80) == 0) {
            goto LABEL_66;
          }
          v38 += 7;
          unint64_t v13 = v17;
          BOOL v10 = v39++ > 8;
        }
        while (!v10);
LABEL_61:
        uint64_t v16 = 0;
        goto LABEL_66;
      }
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      while (2)
      {
        unint64_t v17 = v13 + 1;
        if (v13 == -1)
        {
          unint64_t v13 = -1;
LABEL_63:
          uint64_t v16 = 0;
          *((unsigned char *)this + 24) = 1;
          unint64_t v17 = v13;
        }
        else
        {
          if (v17 > *((void *)this + 2)) {
            goto LABEL_63;
          }
          char v18 = *(unsigned char *)(*(void *)this + v13);
          *((void *)this + 1) = v17;
          v16 |= (unint64_t)(v18 & 0x7F) << v14;
          if (v18 < 0)
          {
            v14 += 7;
            unint64_t v13 = v17;
            BOOL v10 = v15++ > 8;
            if (v10) {
              goto LABEL_61;
            }
            continue;
          }
          if (*((unsigned char *)this + 24)) {
            uint64_t v16 = 0;
          }
        }
        break;
      }
LABEL_66:
      BOOL v42 = __CFADD__(v17, v16);
      unint64_t v12 = v17 + v16;
      if (v42) {
        goto LABEL_68;
      }
LABEL_67:
      if (v12 > *((void *)this + 2))
      {
LABEL_68:
        uint64_t v4 = 1;
        *((unsigned char *)this + 24) = 1;
        return v4;
      }
      *((void *)this + 1) = v12;
      return 1;
    case 3:
      uint64_t v4 = 1;
      if (!*((unsigned char *)this + 24)) {
        return v4;
      }
      int v21 = a4 + 1;
      break;
    case 5:
      unint64_t v35 = *((void *)this + 1);
      if (v35 > 0xFFFFFFFFFFFFFFFBLL) {
        goto LABEL_68;
      }
      unint64_t v12 = v35 + 4;
      goto LABEL_67;
    default:
      return v4;
  }
  while (1)
  {
    unint64_t v22 = *((void *)this + 1);
    if (v22 < 0xFFFFFFFFFFFFFFF6 && v22 + 10 <= *((void *)this + 2)) {
      break;
    }
    unsigned int v23 = 0;
    while (1)
    {
      unint64_t v24 = v22 + 1;
      if (v22 == -1 || v24 > *((void *)this + 2))
      {
        LODWORD(v25) = 0;
        unsigned __int8 v27 = 0;
        *((unsigned char *)this + 24) = 1;
        goto LABEL_34;
      }
      LODWORD(v25) = 0;
      int v26 = *(char *)(*(void *)this + v22);
      *((void *)this + 1) = v24;
      if ((v26 & 0x80000000) == 0) {
        break;
      }
      unint64_t v22 = v24;
      unsigned __int8 v27 = 0;
      BOOL v10 = v23++ > 8;
      if (v10) {
        goto LABEL_34;
      }
    }
    unsigned __int8 v27 = 0;
LABEL_34:
    if (a4 >= 64)
    {
      *((unsigned char *)this + 24) = 1;
      continue;
    }
    PB::Reader::skip(this, v25, v27, v21);
    if (!*((unsigned char *)this + 24)) {
      return 1;
    }
  }
  char v28 = 0;
  unsigned int v29 = 0;
  unint64_t v30 = 0;
  uint64_t v31 = *(void *)this;
  while (1)
  {
    unint64_t v32 = v22 + 1;
    *((void *)this + 1) = v22 + 1;
    char v33 = *(unsigned char *)(v31 + v22);
    v30 |= (unint64_t)(v33 & 0x7F) << v28;
    if ((v33 & 0x80) == 0) {
      break;
    }
    v28 += 7;
    unint64_t v22 = v32;
    BOOL v10 = v29++ > 8;
    if (v10)
    {
      LODWORD(v25) = 0;
      unsigned __int8 v27 = 0;
      goto LABEL_34;
    }
  }
  unsigned __int8 v27 = v30 & 7;
  unint64_t v25 = v30 >> 3;
  if ((v30 & 7) != 4 || v25 != a2) {
    goto LABEL_34;
  }
  return 1;
}

std::string *PB::TextFormatter::indent(PB::TextFormatter *this)
{
  return std::string::append((std::string *)((char *)this + 280), "  ");
}

uint64_t PB::TextFormatter::dedent(PB::TextFormatter *this)
{
  if (*((char *)this + 303) < 0)
  {
    unint64_t v1 = *((void *)this + 36);
    if (v1 > 1) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v1 = *((unsigned __int8 *)this + 303);
    if (v1 >= 2)
    {
LABEL_3:
      size_t v2 = (std::string *)((char *)this + 280);
      unint64_t v3 = std::string::erase((std::string *)((char *)this + 280), v1 - 2, 0xFFFFFFFFFFFFFFFFLL);
      std::string::operator=(v2, v3);
      return 1;
    }
  }
  return 0;
}

std::string *PB::TextFormatter::beginObject(std::string *this, const char *a2)
{
  if (a2)
  {
    unint64_t v3 = &this->__r_.__value_.__r.__words[2];
    uint64_t v4 = (std::string *)((char *)this + 280);
    int v5 = this[12].__r_.__value_.__s.__data_[15];
    if (v5 >= 0) {
      uint64_t v6 = (uint64_t)&this[11].__r_.__value_.__r.__words[2];
    }
    else {
      uint64_t v6 = this[11].__r_.__value_.__r.__words[2];
    }
    if (v5 >= 0) {
      uint64_t data = this[12].__r_.__value_.__s.__data_[15];
    }
    else {
      uint64_t data = (uint64_t)this[12].__r_.__value_.__l.__data_;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&this->__r_.__value_.__r.__words[2], v6, data);
    size_t v8 = strlen(a2);
    int v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" {\n", 3);
    return std::string::append(v4, "  ");
  }
  return this;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1AD0EB450](v23, a1);
  if (v23[0])
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      BOOL v10 = std::locale::use_facet(&__b, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      size_t v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1AD0EB460](v23);
  return a1;
}

void sub_1A8FE2BD4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1AD0EB460](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1A8FE2BA8);
}

void sub_1A8FE2C40(_Unwind_Exception *a1)
{
}

void __clang_call_terminate(void *a1)
{
}

void *PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  uint64_t result = (void *)PB::TextFormatter::dedent(this);
  if (result)
  {
    int v3 = *((char *)this + 303);
    if (v3 >= 0) {
      uint64_t v4 = (char *)this + 280;
    }
    else {
      uint64_t v4 = (char *)*((void *)this + 35);
    }
    if (v3 >= 0) {
      uint64_t v5 = *((unsigned __int8 *)this + 303);
    }
    else {
      uint64_t v5 = *((void *)this + 36);
    }
    uint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v4, v5);
    return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"}\n", 2);
  }
  return result;
}

void *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  uint64_t vars8;

  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
}

void *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  uint64_t v5 = (void *)((char *)this + 16);
  int v6 = *((char *)this + 303);
  if (v6 >= 0) {
    size_t v7 = (char *)this + 280;
  }
  else {
    size_t v7 = (char *)*((void *)this + 35);
  }
  if (v6 >= 0) {
    uint64_t v8 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v8 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v7, v8);
  size_t v9 = strlen(a2);
  BOOL v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  *(void *)((char *)v5 + *(void *)(*((void *)this + 2) - 24) + 16) = 6;
  uint64_t v11 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1);
}

void *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  uint64_t v5 = (void *)((char *)this + 16);
  int v6 = *((char *)this + 303);
  if (v6 >= 0) {
    size_t v7 = (char *)this + 280;
  }
  else {
    size_t v7 = (char *)*((void *)this + 35);
  }
  if (v6 >= 0) {
    uint64_t v8 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v8 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v7, v8);
  size_t v9 = strlen(a2);
  BOOL v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  *(void *)((char *)v5 + *(void *)(*((void *)this + 2) - 24) + 16) = 15;
  uint64_t v11 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1);
}

void PB::TextFormatter::format(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 16);
  int v6 = *(char *)(a1 + 303);
  if (v6 >= 0) {
    uint64_t v7 = a1 + 280;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 280);
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 303);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 288);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 16), v7, v8);
  size_t v9 = strlen(a2);
  BOOL v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  int v11 = *(char *)(a3 + 23);
  if (v11 >= 0) {
    uint64_t v12 = (const unsigned __int8 *)a3;
  }
  else {
    uint64_t v12 = *(const unsigned __int8 **)a3;
  }
  if (v11 >= 0) {
    uint64_t v13 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v13 = *(void *)(a3 + 8);
  }
  PB::_formatBytes((PB *)__p, v12, v13);
  if ((v17 & 0x80u) == 0) {
    BOOL v14 = __p;
  }
  else {
    BOOL v14 = (void **)__p[0];
  }
  if ((v17 & 0x80u) == 0) {
    uint64_t v15 = v17;
  }
  else {
    uint64_t v15 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v14, v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  if ((char)v17 < 0) {
    operator delete(__p[0]);
  }
}

{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void *__p[2];
  unsigned __int8 v14;

  uint64_t v5 = (void *)(a1 + 16);
  int v6 = *(char *)(a1 + 303);
  if (v6 >= 0) {
    uint64_t v7 = a1 + 280;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 280);
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 303);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 288);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 16), v7, v8);
  size_t v9 = strlen(a2);
  BOOL v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  PB::_formatBytes((PB *)__p, *(const unsigned __int8 **)a3, *(void *)(a3 + 8) - *(void *)a3);
  if ((v14 & 0x80u) == 0) {
    int v11 = __p;
  }
  else {
    int v11 = (void **)__p[0];
  }
  if ((v14 & 0x80u) == 0) {
    uint64_t v12 = v14;
  }
  else {
    uint64_t v12 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  if ((char)v14 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1A8FE3280(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PB::_formatBytes(PB *this, const unsigned __int8 *a2, uint64_t a3)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  v15[0] = 34;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v11, (uint64_t)v15, 1);
  while (a3)
  {
    int v6 = *a2++;
    int v5 = v6;
    if (v6 <= 33)
    {
      uint64_t v7 = "\\a";
      switch(v5)
      {
        case 0:
          uint64_t v7 = "\\0";
          goto LABEL_16;
        case 7:
          goto LABEL_16;
        case 8:
          uint64_t v7 = "\\b";
          goto LABEL_16;
        case 9:
          uint64_t v7 = "\\t";
          goto LABEL_16;
        case 10:
          uint64_t v7 = "\\n";
          goto LABEL_16;
        case 12:
          uint64_t v7 = "\\f";
          goto LABEL_16;
        case 13:
          uint64_t v7 = "\\r";
          goto LABEL_16;
        default:
          goto LABEL_19;
      }
    }
    switch(v5)
    {
      case '""':
        uint64_t v7 = "\\\"";
        break;
      case '\'':
        uint64_t v7 = "\\'";
        break;
      case '\\':
        uint64_t v7 = "\\\\"";
        break;
      default:
LABEL_19:
        if ((v5 - 32) < 0x3C || (v5 - 93) <= 0x20)
        {
          v15[0] = v5;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v11, (uint64_t)v15, 1);
        }
        else
        {
          *(_DWORD *)((char *)v12 + *(void *)(v11 - 24)) = *(_DWORD *)((unsigned char *)v12 + *(void *)(v11 - 24)) & 0xFFFFFFB5 | 0x40;
          v15[0] = v5;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v11, (uint64_t)v15, 1);
          *(_DWORD *)((char *)v12 + *(void *)(v11 - 24)) = *(_DWORD *)((unsigned char *)v12 + *(void *)(v11 - 24)) & 0xFFFFFFB5 | 2;
        }
        goto LABEL_17;
    }
LABEL_16:
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v11, (uint64_t)v7, 2);
LABEL_17:
    --a3;
  }
  v15[0] = 34;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v11, (uint64_t)v15, 1);
  std::stringbuf::str();
  v10[0] = *MEMORY[0x1E4FBA408];
  uint64_t v8 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  uint64_t v11 = v8;
  v12[0] = MEMORY[0x1E4FBA470] + 16;
  if (v13 < 0) {
    operator delete((void *)v12[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1AD0EB550](&v14);
}

void sub_1A8FE35D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A8FE3704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, const PB::Data *a3)
{
  int v5 = (void *)((char *)this + 16);
  int v6 = *((char *)this + 303);
  if (v6 >= 0) {
    uint64_t v7 = (char *)this + 280;
  }
  else {
    uint64_t v7 = (char *)*((void *)this + 35);
  }
  if (v6 >= 0) {
    uint64_t v8 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v8 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v7, v8);
  size_t v9 = strlen(a2);
  BOOL v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
  PB::_formatBytes((PB *)__p, *(const unsigned __int8 **)a3, *((void *)a3 + 1));
  if ((v14 & 0x80u) == 0) {
    uint64_t v11 = __p;
  }
  else {
    uint64_t v11 = (void **)__p[0];
  }
  if ((v14 & 0x80u) == 0) {
    uint64_t v12 = v14;
  }
  else {
    uint64_t v12 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  if ((char)v14 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1A8FE37F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void _dictionaryRepresentation(void *a1, unint64_t a2, int a3, void *a4)
{
  char v41 = a1;
  id v7 = a4;
  uint64_t v8 = v41;
  unint64_t v9 = v41[1];
  unint64_t v10 = v41[5];
  if (v9 >= v10) {
    goto LABEL_52;
  }
  do
  {
    if (*((unsigned char *)v8 + 16)) {
      break;
    }
    if (a3 == 6)
    {
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (v9 < v10)
      {
        unint64_t v14 = v9 + 1;
        char v15 = *(unsigned char *)(v8[3] + v9);
        v8[1] = v14;
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0) {
          goto LABEL_11;
        }
        v11 += 7;
        unint64_t v9 = v14;
        BOOL v16 = v12++ >= 9;
        if (v16)
        {
          unint64_t v13 = 0;
          goto LABEL_11;
        }
      }
      unint64_t v13 = 0;
      *((unsigned char *)v8 + 16) = 1;
LABEL_11:
      a3 = v13 & 7;
      a2 = v13 >> 3;
    }
    unsigned __int8 v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:a2];
    switch(a3)
    {
      case 0:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        uint64_t v21 = v41;
        unint64_t v22 = v41[1];
        while (1)
        {
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > v41[5]) {
            goto LABEL_22;
          }
          char v24 = *(unsigned char *)(v41[3] + v22);
          v41[1] = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
          {
            if (*((unsigned char *)v41 + 16)) {
              uint64_t v25 = 0;
            }
            else {
              uint64_t v25 = v20;
            }
            goto LABEL_23;
          }
          v18 += 7;
          unint64_t v22 = v23;
          BOOL v16 = v19++ >= 9;
          if (v16)
          {
            uint64_t v25 = 0;
            goto LABEL_23;
          }
        }
      case 1:
        uint64_t v21 = v41;
        unint64_t v26 = v41[1];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= v41[5])
        {
          uint64_t v25 = *(void *)(v41[3] + v26);
          v41[1] = v26 + 8;
        }
        else
        {
LABEL_22:
          uint64_t v25 = 0;
          *((unsigned char *)v21 + 16) = 1;
        }
LABEL_23:
        uint64_t v27 = [objc_alloc(NSNumber) initWithUnsignedLongLong:v25];
        goto LABEL_48;
      case 2:
        uint64_t v27 = PBReaderReadData(v41);
        goto LABEL_48;
      case 3:
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        unsigned int v29 = v41;
        if (*((unsigned char *)v41 + 16)) {
          goto LABEL_49;
        }
        char v30 = 0;
        unsigned int v31 = 0;
        unint64_t v32 = 0;
        break;
      case 5:
        unint64_t v39 = v41[1];
        if (v39 <= 0xFFFFFFFFFFFFFFFBLL && v39 + 4 <= v41[5])
        {
          uint64_t v40 = *(unsigned int *)(v41[3] + v39);
          v41[1] = v39 + 4;
        }
        else
        {
          uint64_t v40 = 0;
          *((unsigned char *)v41 + 16) = 1;
        }
        uint64_t v27 = [objc_alloc(NSNumber) initWithUnsignedLong:v40];
LABEL_48:
        id v28 = (id)v27;
        goto LABEL_49;
      default:
        goto LABEL_51;
    }
    while (1)
    {
      while (1)
      {
        uint64_t v33 = v29[1];
        unint64_t v34 = v33 + 1;
        if (v33 != -1 && v34 <= v29[5]) {
          break;
        }
        unint64_t v35 = 0;
        uint64_t v36 = 0;
        *((unsigned char *)v29 + 16) = 1;
LABEL_30:
        _dictionaryRepresentation(v41, v35, v36, v28);
        unsigned int v29 = v41;
        char v30 = 0;
        unsigned int v31 = 0;
        unint64_t v32 = 0;
        if (*((unsigned char *)v41 + 16)) {
          goto LABEL_49;
        }
      }
      char v37 = *(unsigned char *)(v29[3] + v33);
      v29[1] = v34;
      v32 |= (unint64_t)(v37 & 0x7F) << v30;
      if ((v37 & 0x80) == 0) {
        break;
      }
      v30 += 7;
      if (v31++ > 8)
      {
        unint64_t v35 = 0;
        uint64_t v36 = 0;
        goto LABEL_30;
      }
    }
    uint64_t v36 = v32 & 7;
    unint64_t v35 = v32 >> 3;
    if (v36 != 4) {
      goto LABEL_30;
    }
    if (a2 != v35)
    {
      uint64_t v36 = 4;
      goto LABEL_30;
    }
LABEL_49:
    if (v28)
    {
      [v7 setObject:v28 forKey:v17];
    }
LABEL_51:

    uint64_t v8 = v41;
    unint64_t v9 = v41[1];
    unint64_t v10 = v41[5];
    a3 = 6;
  }
  while (v9 < v10);
LABEL_52:
}

uint64_t PBUnknownFieldsSetMaximumRecursionDepth(uint64_t result)
{
  _sMaximumRecursionDepth = result;
  return result;
}

PB::Writer *PB::Writer::Writer(PB::Writer *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  PB::_grow((uint64_t *)this, 0x100uLL);
  return this;
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  PB::_grow((uint64_t *)this, 0x100uLL);
  return this;
}

char *PB::_grow(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = *a1;
  unint64_t v5 = a1[2] - v3;
  if (v5 <= a2) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = a1[2] - v3;
  }
  unint64_t v7 = v6 + v5;
  uint64_t result = (char *)malloc_type_realloc((void *)a1[1], v6 + v5, 0xBB50D737uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unint64_t v10 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v10, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)&result[v7];
  *a1 = (uint64_t)&result[v4 - v3];
  return result;
}

void PB::Writer::~Writer(void **this)
{
}

{
  free(this[1]);
}

uint64_t *PB::Writer::writeVarInt(uint64_t *this, unsigned int a2, int a3)
{
  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 16)) {
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  }
  unint64_t v6 = (int)a2;
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3);
    if (v7 < 0x80)
    {
      LOBYTE(v9) = 8 * a3;
    }
    else
    {
      do
      {
        uint64_t v8 = (unsigned char *)(*v5)++;
        *uint64_t v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    char v11 = (unsigned char *)(*v5)++;
    *char v11 = v9;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v13) = a2;
  }
  else
  {
    do
    {
      unsigned int v12 = (unsigned char *)(*v5)++;
      *unsigned int v12 = v6 | 0x80;
      unint64_t v13 = v6 >> 7;
      unint64_t v14 = v6 >> 14;
      v6 >>= 7;
    }
    while (v14);
  }
  char v15 = (unsigned char *)(*v5)++;
  *char v15 = v13;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned char *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned char *v11;
  unsigned char *v12;
  unint64_t v13;
  unint64_t v14;
  unsigned char *v15;

  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 16)) {
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  }
  unint64_t v6 = a2;
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3);
    if (v7 < 0x80)
    {
      LOBYTE(v9) = 8 * a3;
    }
    else
    {
      do
      {
        uint64_t v8 = (unsigned char *)(*v5)++;
        *uint64_t v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    char v11 = (unsigned char *)(*v5)++;
    *char v11 = v9;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v13) = a2;
  }
  else
  {
    do
    {
      unsigned int v12 = (unsigned char *)(*v5)++;
      *unsigned int v12 = v6 | 0x80;
      unint64_t v13 = v6 >> 7;
      unint64_t v14 = v6 >> 14;
      v6 >>= 7;
    }
    while (v14);
  }
  char v15 = (unsigned char *)(*v5)++;
  *char v15 = v13;
  return this;
}

uint64_t *PB::Writer::writeVarInt(uint64_t *this, unint64_t a2, int a3)
{
  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 16)) {
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v12) = a2;
  }
  else
  {
    do
    {
      char v11 = (unsigned char *)(*v5)++;
      *char v11 = a2 | 0x80;
      unint64_t v12 = a2 >> 7;
      unint64_t v13 = a2 >> 14;
      a2 >>= 7;
    }
    while (v13);
  }
  unint64_t v14 = (unsigned char *)(*v5)++;
  *unint64_t v14 = v12;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  unsigned char *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned char *v10;
  unsigned char *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned char *v14;

  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 16)) {
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  if (a2 < 0x80)
  {
    LOBYTE(v12) = a2;
  }
  else
  {
    do
    {
      char v11 = (unsigned char *)(*v5)++;
      *char v11 = a2 | 0x80;
      unint64_t v12 = a2 >> 7;
      unint64_t v13 = a2 >> 14;
      a2 >>= 7;
    }
    while (v13);
  }
  unint64_t v14 = (unsigned char *)(*v5)++;
  *unint64_t v14 = v12;
  return this;
}

uint64_t *PB::Writer::writeSInt(uint64_t *this, int a2, int a3)
{
  uint64_t v4 = this;
  unint64_t v5 = (2 * a2) ^ (a2 >> 31);
  if (this[2] < (unint64_t)(*this + 16)) {
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v4)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v4)++;
    *unint64_t v10 = v8;
  }
  if (v5 < 0x80)
  {
    LOBYTE(v12) = v5;
  }
  else
  {
    do
    {
      char v11 = (unsigned char *)(*v4)++;
      *char v11 = v5 | 0x80;
      unint64_t v12 = v5 >> 7;
      unint64_t v13 = v5 >> 14;
      v5 >>= 7;
    }
    while (v13);
  }
  unint64_t v14 = (unsigned char *)(*v4)++;
  *unint64_t v14 = v12;
  return this;
}

uint64_t *PB::Writer::writeSInt(uint64_t *this, uint64_t a2, int a3)
{
  unint64_t v5 = this;
  uint64_t v6 = 2 * a2;
  if (this[2] < (unint64_t)(*this + 16)) {
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  }
  unint64_t v7 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    unint64_t v8 = (8 * a3);
    if (v8 < 0x80)
    {
      LOBYTE(v10) = 8 * a3;
    }
    else
    {
      do
      {
        unint64_t v9 = (unsigned char *)(*v5)++;
        *unint64_t v9 = v8 | 0x80;
        unint64_t v10 = v8 >> 7;
        unint64_t v11 = v8 >> 14;
        v8 >>= 7;
      }
      while (v11);
    }
    unint64_t v12 = (unsigned char *)(*v5)++;
    *unint64_t v12 = v10;
  }
  if (v7 < 0x80)
  {
    uint64_t v14 = v6 ^ (a2 >> 63);
  }
  else
  {
    do
    {
      unint64_t v13 = (unsigned char *)(*v5)++;
      *unint64_t v13 = v7 | 0x80;
      uint64_t v14 = v7 >> 7;
      unint64_t v15 = v7 >> 14;
      v7 >>= 7;
    }
    while (v15);
  }
  BOOL v16 = (unsigned char *)(*v5)++;
  *BOOL v16 = v14;
  return this;
}

uint64_t *PB::Writer::writeFixed(uint64_t *this, int a2, int a3)
{
  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 20)) {
    this = (uint64_t *)PB::_grow(this, 0x14uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  *(_DWORD *)*unint64_t v5 = a2;
  *v5 += 4;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  unsigned char *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned char *v10;

  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 20)) {
    this = (uint64_t *)PB::_grow(this, 0x14uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  *(_DWORD *)*unint64_t v5 = a2;
  *v5 += 4;
  return this;
}

uint64_t *PB::Writer::writeFixed(uint64_t *this, uint64_t a2, int a3)
{
  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 24)) {
    this = (uint64_t *)PB::_grow(this, 0x18uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  *(void *)*unint64_t v5 = a2;
  *v5 += 8;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  unsigned char *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned char *v10;

  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 24)) {
    this = (uint64_t *)PB::_grow(this, 0x18uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  *(void *)*unint64_t v5 = a2;
  *v5 += 8;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, char a2, int a3)
{
  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 16)) {
    this = (uint64_t *)PB::_grow(this, 0x10uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  unint64_t v11 = (unsigned char *)(*v5)++;
  *unint64_t v11 = a2;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, float a2, int a3)
{
  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 20)) {
    this = (uint64_t *)PB::_grow(this, 0x14uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  *(float *)*unint64_t v5 = a2;
  *v5 += 4;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, double a2, int a3)
{
  unint64_t v5 = this;
  if (this[2] < (unint64_t)(*this + 24)) {
    this = (uint64_t *)PB::_grow(this, 0x18uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  *(double *)*unint64_t v5 = a2;
  *v5 += 8;
  return this;
}

void *PB::Writer::write(uint64_t *a1, const void **a2, int a3)
{
  int v6 = *((char *)a2 + 23);
  unint64_t v7 = (const void **)*a2;
  if (v6 >= 0) {
    size_t v8 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v8 = (size_t)a2[1];
  }
  if (a1[2] < *a1 + v8 + 16) {
    PB::_grow(a1, v8 + 16);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 2u;
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        unint64_t v10 = (unsigned char *)(*a1)++;
        *unint64_t v10 = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }
      while (v12);
    }
    unint64_t v13 = (unsigned char *)(*a1)++;
    *unint64_t v13 = v11;
  }
  LOBYTE(v14) = v8;
  if (v8 >= 0x80)
  {
    size_t v15 = v8;
    do
    {
      BOOL v16 = (unsigned char *)(*a1)++;
      *BOOL v16 = v15 | 0x80;
      size_t v14 = v15 >> 7;
      size_t v17 = v15 >> 14;
      v15 >>= 7;
    }
    while (v17);
  }
  if (v6 >= 0) {
    char v18 = a2;
  }
  else {
    char v18 = v7;
  }
  unsigned int v19 = (unsigned char *)(*a1)++;
  *unsigned int v19 = v14;
  uint64_t result = memcpy((void *)*a1, v18, v8);
  *a1 += v8;
  return result;
}

void *PB::Writer::write(uint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v5 = *(const void **)a2;
  size_t v6 = *(void *)(a2 + 8) - *(void *)a2;
  if (a1[2] < *a1 + v6 + 16) {
    PB::_grow(a1, v6 + 16);
  }
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3) | 2u;
    if (v7 < 0x80)
    {
      LOBYTE(v9) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        size_t v8 = (unsigned char *)(*a1)++;
        *size_t v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    unint64_t v11 = (unsigned char *)(*a1)++;
    *unint64_t v11 = v9;
  }
  LOBYTE(v12) = v6;
  if (v6 >= 0x80)
  {
    size_t v13 = v6;
    do
    {
      size_t v14 = (unsigned char *)(*a1)++;
      *size_t v14 = v13 | 0x80;
      size_t v12 = v13 >> 7;
      size_t v15 = v13 >> 14;
      v13 >>= 7;
    }
    while (v15);
  }
  BOOL v16 = (unsigned char *)(*a1)++;
  *BOOL v16 = v12;
  uint64_t result = memcpy((void *)*a1, v5, v6);
  *a1 += v6;
  return result;
}

void *PB::Writer::write(PB::Writer *this, const PB::Data *a2, int a3)
{
  size_t v6 = *(const void **)a2;
  size_t v5 = *((void *)a2 + 1);
  if (*((void *)this + 2) < *(void *)this + v5 + 16) {
    PB::_grow((uint64_t *)this, v5 + 16);
  }
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3) | 2u;
    if (v7 < 0x80)
    {
      LOBYTE(v9) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        size_t v8 = (unsigned char *)(*(void *)this)++;
        *size_t v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }
      while (v10);
    }
    unint64_t v11 = (unsigned char *)(*(void *)this)++;
    *unint64_t v11 = v9;
  }
  LOBYTE(v12) = v5;
  if (v5 >= 0x80)
  {
    size_t v13 = v5;
    do
    {
      size_t v14 = (unsigned char *)(*(void *)this)++;
      *size_t v14 = v13 | 0x80;
      size_t v12 = v13 >> 7;
      size_t v15 = v13 >> 14;
      v13 >>= 7;
    }
    while (v15);
  }
  BOOL v16 = (unsigned char *)(*(void *)this)++;
  *BOOL v16 = v12;
  uint64_t result = memcpy(*(void **)this, v6, v5);
  *(void *)this += v5;
  return result;
}

char *PB::Writer::writeSubgroup(PB::Writer *this, const PB::Base *a2, int a3)
{
  if (*((void *)this + 2) < (unint64_t)(*(void *)this + 8)) {
    PB::_grow((uint64_t *)this, 8uLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 3u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 3;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*(void *)this)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*(void *)this)++;
    *unint64_t v10 = v8;
  }
  uint64_t result = (char *)(*(uint64_t (**)(const PB::Base *, PB::Writer *))(*(void *)a2 + 24))(a2, this);
  if (*((void *)this + 2) < (unint64_t)(*(void *)this + 8)) {
    uint64_t result = PB::_grow((uint64_t *)this, 8uLL);
  }
  if (a3 != -1)
  {
    unint64_t v12 = (8 * a3) | 4u;
    if (v12 < 0x80)
    {
      LOBYTE(v14) = (8 * a3) | 4;
    }
    else
    {
      do
      {
        size_t v13 = (unsigned char *)(*(void *)this)++;
        *size_t v13 = v12 | 0x80;
        unint64_t v14 = v12 >> 7;
        unint64_t v15 = v12 >> 14;
        v12 >>= 7;
      }
      while (v15);
    }
    BOOL v16 = (unsigned char *)(*(void *)this)++;
    *BOOL v16 = v14;
  }
  return result;
}

uint64_t *PB::Writer::placeMark(uint64_t *result, void *a2, int a3)
{
  size_t v5 = result;
  if (result[2] < (unint64_t)(*result + 10)) {
    uint64_t result = (uint64_t *)PB::_grow(result, 0xAuLL);
  }
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 2u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 2;
    }
    else
    {
      do
      {
        unint64_t v7 = (unsigned char *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }
      while (v9);
    }
    unint64_t v10 = (unsigned char *)(*v5)++;
    *unint64_t v10 = v8;
  }
  uint64_t v11 = v5[1];
  uint64_t v12 = *v5 + 1;
  *size_t v5 = v12;
  *a2 = v12 - v11;
  return result;
}

uint64_t *PB::Writer::recallMark(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  uint64_t v5 = *a2;
  size_t v6 = *result - (*a2 + v4);
  unint64_t v7 = -1;
  unint64_t v8 = v6;
  do
  {
    ++v7;
    BOOL v9 = v8 > 0x7F;
    v8 >>= 7;
  }
  while (v9);
  if (v7)
  {
    if (result[2] < *result + v7)
    {
      PB::_grow(result, v7);
      uint64_t v4 = v3[1];
      uint64_t v5 = *a2;
    }
    uint64_t result = (uint64_t *)memmove((void *)(v4 + v5 + v7), (const void *)(v4 + v5), v6);
    uint64_t v4 = v3[1];
    uint64_t v5 = *a2;
  }
  unint64_t v10 = (unsigned char *)(v4 + v5 - 1);
  if (v6 < 0x80)
  {
    LOBYTE(v11) = v6;
  }
  else
  {
    do
    {
      *v10++ = v6 | 0x80;
      size_t v11 = v6 >> 7;
      size_t v12 = v6 >> 14;
      v6 >>= 7;
    }
    while (v12);
  }
  *unint64_t v10 = v11;
  *v3 += v7;
  return result;
}

uint64_t *PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2, int a3)
{
  PB::Writer::placeMark((uint64_t *)this, &v6, a3);
  (*(void (**)(const PB::Base *, PB::Writer *))(*(void *)a2 + 24))(a2, this);
  return PB::Writer::recallMark((uint64_t *)this, &v6);
}

void sub_1A8FE636C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5A0](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E878]();
}

{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181508](cls, outCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1F40F2870]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1F4181AB8](property, outCount);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181AF0](proto, outCount);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}