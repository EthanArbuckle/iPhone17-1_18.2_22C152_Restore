void *sub_1B6E10B04(void *result, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int *v11;
  int v12;

  v3 = *(void *)(*result + 24);
  v4 = *(unsigned int *)(v3 + 8 * a2);
  if ((int)v4 >= 1)
  {
    v5 = 0;
    v6 = *(int *)(v3 + 8 * a2 + 4);
    v7 = result[3] + 4 * v6;
    v8 = *(void *)(*result + 48) + 4 * v6;
    do
    {
      v9 = *(_DWORD *)(v7 + 4 * v5);
      if (*(int *)(*result + 12) <= 0)
      {
        v10 = *(int *)(result[12] + 4 * *(int *)(v8 + 4 * v5));
        v9 = v10 - 1;
        v11 = (int *)(result[18] + 4 * v10);
        do
        {
          v12 = *v11++;
          ++v9;
        }
        while (v12 != *(_DWORD *)(v7 + 4 * v5));
      }
      *(unsigned char *)(a3 + v5++) = *(unsigned char *)(result[21] + v9);
    }
    while (v5 != v4);
  }
  return result;
}

uint64_t sub_1B6E10B94(void *a1, int a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 24);
  uint64_t v4 = *(unsigned int *)(v3 + 8 * a2);
  if ((int)v4 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  LODWORD(v6) = 0;
  uint64_t v7 = *(int *)(v3 + 8 * a2 + 4);
  uint64_t v8 = a1[3] + 4 * v7;
  uint64_t v9 = *(void *)(v2 + 48) + 4 * v7;
  int v10 = *(_DWORD *)(v2 + 12);
  do
  {
    int v11 = *(_DWORD *)(v8 + 4 * v5);
    if (v10 <= 0)
    {
      uint64_t v12 = *(int *)(a1[12] + 4 * *(int *)(v9 + 4 * v5));
      int v11 = v12 - 1;
      v13 = (int *)(a1[18] + 4 * v12);
      do
      {
        int v14 = *v13++;
        ++v11;
      }
      while (v14 != *(_DWORD *)(v8 + 4 * v5));
    }
    uint64_t v6 = *(unsigned __int8 *)(a1[21] + v11) | v6;
    ++v5;
  }
  while (v5 != v4);
  return v6;
}

void sub_1B6E10C30(void *a1, unint64_t a2, unsigned char *a3)
{
  unint64_t v4 = a2;
  uint64_t v7 = (unsigned char *)a1[1];
  uint64_t v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      uint64_t v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = &v7[-*a1];
    unint64_t v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0) {
      abort();
    }
    unint64_t v10 = v6 - *a1;
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      uint64_t v12 = operator new(v11);
    }
    else {
      uint64_t v12 = 0;
    }
    int v14 = &v8[(void)v12];
    v15 = &v8[(void)v12 + v4];
    v16 = &v8[(void)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    v17 = (unsigned char *)*a1;
    if (v7 != (unsigned char *)*a1)
    {
      do
      {
        char v18 = *--v7;
        *--int v14 = v18;
      }
      while (v7 != v17);
      uint64_t v7 = (unsigned char *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void sub_1B6E10D58(void **a1, unint64_t a2, _WORD *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(_WORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 1)
  {
    if (a2)
    {
      uint64_t v16 = 2 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 2;
      }
      while (v16);
      unint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    uint64_t v11 = a2 + (v10 >> 1);
    if (v11 < 0) {
      abort();
    }
    uint64_t v12 = v10 >> 1;
    unint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 > v11) {
      uint64_t v11 = v13;
    }
    if (v13 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v14 = v11;
    }
    if (v14) {
      v15 = (char *)sub_1B645A9E0(v6, v14);
    }
    else {
      v15 = 0;
    }
    char v18 = &v15[2 * v12];
    v19 = &v18[2 * a2];
    uint64_t v20 = 2 * a2;
    v21 = v18;
    do
    {
      *(_WORD *)v21 = *a3;
      v21 += 2;
      v20 -= 2;
    }
    while (v20);
    v22 = &v15[2 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 2)
    {
      __int16 v25 = *((_WORD *)i - 1);
      *((_WORD *)v18 - 1) = v25;
      v18 -= 2;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void sub_1B6E10E70(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 2);
    if (v9 >> 62) {
      abort();
    }
    uint64_t v10 = v8 >> 2;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 1 > v9) {
      unint64_t v9 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)sub_1B64282E0(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    uint64_t v14 = &v13[4 * v10];
    v15 = &v13[4 * v12];
    bzero(v14, 4 * a2);
    uint64_t v16 = &v14[4 * a2];
    char v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        int v19 = *((_DWORD *)v17 - 1);
        v17 -= 4;
        *((_DWORD *)v14 - 1) = v19;
        v14 -= 4;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

char *sub_1B6E10F80(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    abort();
  }
  result = (char *)sub_1B645A9E0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void sub_1B6E10FBC()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9E48C60, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9E48C60))
  {
    qword_1E9E48C18 = (uint64_t)"bilinear";
    unk_1E9E48C20 = xmmword_1B6ED0490;
    qword_1E9E48C30 = (uint64_t)"catmark";
    xmmword_1E9E48C38 = xmmword_1B6ED04A0;
    qword_1E9E48C48 = (uint64_t)"loop";
    *(_OWORD *)algn_1E9E48C50 = xmmword_1B6ED04B0;
    __cxa_guard_release(&qword_1E9E48C60);
  }
}

uint64_t sub_1B6E11060(unsigned int a1)
{
  return LODWORD(qword_1E9E48C18[3 * a1 + 1]);
}

uint64_t sub_1B6E11098(unsigned int a1)
{
  return HIDWORD(qword_1E9E48C18[3 * a1 + 1]);
}

uint64_t sub_1B6E110D0(unsigned int a1)
{
  return LODWORD(qword_1E9E48C18[3 * a1 + 2]);
}

uint64_t sub_1B6E11108(unsigned int a1)
{
  return HIDWORD(qword_1E9E48C18[3 * a1 + 2]);
}

id *sub_1B6E11140(id *a1)
{
  return a1;
}

void sub_1B6E11180()
{
}

id sub_1B6E1127C(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v6 = (void *)MEMORY[0x1BA9B76E0]();
  uint64_t v10 = objc_msgSend_commandBuffer(a3[1], v7, v8, v9);
  uint64_t v14 = objc_msgSend_blitCommandEncoder(v10, v11, v12, v13);
  uint64_t v16 = objc_msgSend_newBufferWithBytes_length_options_(*a3, v15, a1, a2, 0);
  char v18 = objc_msgSend_newBufferWithLength_options_(*a3, v17, a2, 32);
  objc_msgSend_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(v14, v19, (uint64_t)v16, 0, v18, 0, a2);
  objc_msgSend_endEncoding(v14, v20, v21, v22);
  objc_msgSend_commit(v10, v23, v24, v25);
  objc_msgSend_waitUntilCompleted(v10, v26, v27, v28);

  return v18;
}

void sub_1B6E11360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1B6E11394(uint64_t a1, int a2, uint64_t *a3, void *a4, void *a5, void *a6, int a7, unint64_t a8)
{
  *(void *)a1 = &unk_1F0FB29D0;
  *(_DWORD *)(a1 + 8) = a2;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  sub_1B6E11448(a2, a7, a8, a3, (void *)(a1 + 40), a4, a1 + 16, a5, (void *)(a1 + 64), a6, (void *)(a1 + 88), 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0);
  return a1;
}

void sub_1B6E11448(int a1, int a2, unint64_t a3, uint64_t *a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  unsigned __int8 v33 = a2;
  if (a2) {
    unint64_t v24 = 0;
  }
  else {
    unint64_t v24 = a3;
  }
  sub_1B642863C((uint64_t)a5, (a4[1] - *a4) >> 2);
  v35 = a6;
  v39 = (void *)a7;
  sub_1B642863C(a7, (uint64_t)(a6[1] - *a6) >> 2);
  v36 = a8;
  sub_1B642863C((uint64_t)a9, (uint64_t)(a8[1] - *a8) >> 2);
  sub_1B642860C((uint64_t)a11, (uint64_t)(a10[1] - *a10) >> 2);
  if (a13) {
    sub_1B642860C((uint64_t)a13, (uint64_t)(a12[1] - *a12) >> 2);
  }
  if (a15) {
    sub_1B642860C((uint64_t)a15, (uint64_t)(a14[1] - *a14) >> 2);
  }
  if (a17) {
    sub_1B642860C((uint64_t)a17, (uint64_t)(a16[1] - *a16) >> 2);
  }
  if (a19) {
    sub_1B642860C((uint64_t)a19, (uint64_t)(a18[1] - *a18) >> 2);
  }
  if (a21) {
    sub_1B642860C((uint64_t)a21, (uint64_t)(a20[1] - *a20) >> 2);
  }
  uint64_t v25 = *a4;
  if (v24 >= (a4[1] - *a4) >> 2)
  {
    unint64_t v27 = 0;
    unint64_t v26 = 0;
  }
  else
  {
    unint64_t v26 = 0;
    unint64_t v27 = 0;
    int v28 = 0;
    do
    {
      if (((v24 == a1) & v33) != 0) {
        unint64_t v29 = a3;
      }
      else {
        unint64_t v29 = v24;
      }
      uint64_t v30 = *(int *)(*v35 + 4 * v29);
      uint64_t v31 = *(int *)(v25 + 4 * v29);
      *(_DWORD *)(*a5 + 4 * v27) = v28;
      *(_DWORD *)(*v39 + 4 * v27) = v30;
      memcpy((void *)(*a9 + 4 * v28), (const void *)(*v36 + 4 * v31), 4 * v30);
      memcpy((void *)(*a11 + 4 * v28), (const void *)(*a10 + 4 * v31), 4 * v30);
      if (a13 && *a13 != a13[1]) {
        memcpy((void *)(*a13 + 4 * v28), (const void *)(*a12 + 4 * v31), 4 * v30);
      }
      if (a15 && *a15 != a15[1]) {
        memcpy((void *)(*a15 + 4 * v28), (const void *)(*a14 + 4 * v31), 4 * v30);
      }
      if (a17 && *a17 != a17[1]) {
        memcpy((void *)(*a17 + 4 * v28), (const void *)(*a16 + 4 * v31), 4 * v30);
      }
      if (a19 && *a19 != a19[1]) {
        memcpy((void *)(*a19 + 4 * v28), (const void *)(*a18 + 4 * v31), 4 * v30);
      }
      if (a21 && *a21 != a21[1]) {
        memcpy((void *)(*a21 + 4 * v28), (const void *)(*a20 + 4 * v31), 4 * v30);
      }
      v28 += v30;
      ++v27;
      v26 += v30;
      unint64_t v24 = v29 + 1;
      uint64_t v25 = *a4;
    }
    while (v29 + 1 < (a4[1] - *a4) >> 2);
  }
  sub_1B642863C((uint64_t)a5, v27);
  sub_1B642863C((uint64_t)v39, v27);
  sub_1B642863C((uint64_t)a9, v26);
  if (a13 && *a13 != a13[1]) {
    sub_1B642860C((uint64_t)a13, v26);
  }
  if (a15 && *a15 != a15[1]) {
    sub_1B642860C((uint64_t)a15, v26);
  }
  if (a17 && *a17 != a17[1]) {
    sub_1B642860C((uint64_t)a17, v26);
  }
  if (a19 && *a19 != a19[1]) {
    sub_1B642860C((uint64_t)a19, v26);
  }
  if (a21 && *a21 != a21[1])
  {
    sub_1B642860C((uint64_t)a21, v26);
  }
}

void sub_1B6E11884(void *a1)
{
  sub_1B6E118BC(a1);

  JUMPOUT(0x1BA9B6D80);
}

void *sub_1B6E118BC(void *a1)
{
  *a1 = &unk_1F0FB29D0;
  uint64_t v2 = (void *)a1[11];
  if (v2)
  {
    a1[12] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[8];
  if (v3)
  {
    a1[9] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    a1[6] = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)a1[2];
  if (v5)
  {
    a1[3] = v5;
    operator delete(v5);
  }
  return a1;
}

void sub_1B6E1193C()
{
}

uint64_t *sub_1B6E119A0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v3 = sub_1B6E11D50(v2);
    MEMORY[0x1BA9B6D80](v3, 0x1090C40B2129F33);
  }
  return a1;
}

uint64_t sub_1B6E119E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 216);
  if (((*(void *)(*(void *)a1 + 224) - v2) >> 2) - 1 >= a2) {
    return *(unsigned int *)(v2 + 4 * a2);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B6E11A14(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)result + 248) = a2;
  return result;
}

uint64_t sub_1B6E11A20(void *a1)
{
  return *a1 + 192;
}

uint64_t sub_1B6E11A2C(void *a1)
{
  return *a1 + 216;
}

uint64_t sub_1B6E11A38(void *a1)
{
  return *a1 + 24;
}

uint64_t sub_1B6E11A44(void *a1)
{
  return *a1 + 48;
}

void sub_1B6E11A50(uint64_t a1, uint64_t a2, float a3)
{
  if (a3 != 0.0) {
    sub_1B6E11A74(**(void **)a1, *(_DWORD *)(a2 + 8), *(_DWORD *)(a1 + 8), **(void **)a1, a3);
  }
}

void sub_1B6E11A74(uint64_t a1, int a2, int a3, uint64_t a4, float a5)
{
  if (*(_DWORD *)(a1 + 248) <= a2)
  {
    uint64_t v11 = *(int *)(*(void *)(a1 + 216) + 4 * a2);
    if ((int)v11 >= 1)
    {
      uint64_t v12 = *(int *)(*(void *)(a1 + 192) + 4 * a2);
      uint64_t v13 = v12 + v11;
      do
      {
        sub_1B6E11E14(a1, *(_DWORD *)(*(void *)(a1 + 24) + 4 * v12), a3, *(_DWORD *)(a1 + 244), *(_DWORD *)(a1 + 240), a4, *(float *)(*(void *)(a4 + 48) + 4 * v12), a5);
        ++v12;
      }
      while (v12 < v13);
    }
  }
  else
  {
    int v10 = *(_DWORD *)(a1 + 240);
    int v9 = *(_DWORD *)(a1 + 244);
    sub_1B6E11E14(a1, a2, a3, v9, v10, a4, a5, 1.0);
  }
}

void sub_1B6E11B58(uint64_t a1, unsigned int **a2, float a3)
{
  if (a3 != 0.0)
  {
    uint64_t v3 = **a2;
    if ((int)v3 >= 1)
    {
      uint64_t v6 = (int *)a2[1];
      uint64_t v7 = (float *)a2[2];
      do
      {
        if (*v7 != 0.0) {
          sub_1B6E11A74(**(void **)a1, *v6, *(_DWORD *)(a1 + 8), **(void **)a1, *v7 * a3);
        }
        ++v6;
        ++v7;
        --v3;
      }
      while (v3);
    }
  }
}

uint64_t sub_1B6E11BE8(uint64_t a1, int a2, int a3, char a4)
{
  *(_OWORD *)(a1 + 48) = 0u;
  uint64_t v7 = (void **)(a1 + 48);
  *(_OWORD *)(a1 + 192) = 0u;
  uint64_t v8 = a1 + 192;
  *(void *)(a1 + 240) = 0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  int v9 = 2 * a2;
  if (a2 >= 2621440) {
    int v9 = 5242880;
  }
  int v10 = (void **)(a1 + 24);
  *(_OWORD *)(a1 + 128) = 0uLL;
  *(_OWORD *)(a1 + 144) = 0uLL;
  *(_OWORD *)(a1 + 96) = 0uLL;
  *(_OWORD *)(a1 + 112) = 0uLL;
  *(_OWORD *)(a1 + 64) = 0uLL;
  *(_OWORD *)(a1 + 80) = 0uLL;
  *(_OWORD *)(a1 + 16) = 0uLL;
  *(_OWORD *)(a1 + 32) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *(_DWORD *)(a1 + 248) = a2;
  if (v9 <= a2) {
    int v9 = a2;
  }
  unint64_t v11 = v9;
  *(unsigned char *)(a1 + 252) = a4;
  sub_1B6427A50((void **)a1, v9);
  sub_1B6427A50(v10, v11);
  sub_1B656C00C(v7, v11);
  if (a3)
  {
    sub_1B642863C((uint64_t)v10, a2);
    sub_1B642860C((uint64_t)v7, a2);
    sub_1B642863C(a1, a2);
    sub_1B642863C(v8, a2);
    sub_1B642863C(a1 + 216, a2);
    uint64_t v12 = *(void *)(a1 + 24);
    if (a2 >= 1)
    {
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)(a1 + 192);
      uint64_t v15 = *(void *)(a1 + 216);
      uint64_t v16 = *(_DWORD **)a1;
      uint64_t v17 = *(void *)(a1 + 48);
      do
      {
        *(_DWORD *)(v14 + 4 * v13) = v13;
        *(_DWORD *)(v15 + 4 * v13) = 1;
        v16[v13] = v13;
        *(_DWORD *)(v12 + 4 * v13) = v13;
        *(_DWORD *)(v17 + 4 * v13++) = 1065353216;
      }
      while (a2 != v13);
    }
    unint64_t v18 = (unint64_t)(*(void *)(a1 + 32) - v12) >> 2;
    *(_DWORD *)(a1 + 240) = v18;
    *(_DWORD *)(a1 + 244) = v18 - 1;
  }
  return a1;
}

uint64_t sub_1B6E11D50(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 216);
  if (v2)
  {
    *(void *)(a1 + 224) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 192);
  if (v3)
  {
    *(void *)(a1 + 200) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(a1 + 168);
  if (v4)
  {
    *(void *)(a1 + 176) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a1 + 144);
  if (v5)
  {
    *(void *)(a1 + 152) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(void **)(a1 + 120);
  if (v6)
  {
    *(void *)(a1 + 128) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *(void **)(a1 + 96);
  if (v7)
  {
    *(void *)(a1 + 104) = v7;
    operator delete(v7);
  }
  uint64_t v8 = *(void **)(a1 + 72);
  if (v8)
  {
    *(void *)(a1 + 80) = v8;
    operator delete(v8);
  }
  int v9 = *(void **)(a1 + 48);
  if (v9)
  {
    *(void *)(a1 + 56) = v9;
    operator delete(v9);
  }
  int v10 = *(void **)(a1 + 24);
  if (v10)
  {
    *(void *)(a1 + 32) = v10;
    operator delete(v10);
  }
  unint64_t v11 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v11;
    operator delete(v11);
  }
  return a1;
}

float sub_1B6E11E14(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, float a7, float a8)
{
  if (*(unsigned char *)(a1 + 252)
    && *(void *)a1 != *(void *)(a1 + 8)
    && (*(_DWORD *)(*(void *)a1 + 4 * a4) == a3 ? (BOOL v8 = a4 < a5) : (BOOL v8 = 0), v8))
  {
    uint64_t v9 = a4;
    while (*(_DWORD *)(*(void *)(a1 + 24) + 4 * v9) != a2)
    {
      if (a5 == ++v9) {
        goto LABEL_11;
      }
    }
    uint64_t v11 = *(void *)(a6 + 48);
    float result = (float)(a7 * a8) + *(float *)(v11 + 4 * v9);
    *(float *)(v11 + 4 * v9) = result;
  }
  else
  {
LABEL_11:
    sub_1B6E11E80(a1, a2, a3, a6, a7 * a8);
  }
  return result;
}

void sub_1B6E11E80(uint64_t a1, int a2, int a3, uint64_t a4, float a5)
{
  uint64_t v40 = a4;
  uint64_t v9 = *(int **)(a1 + 8);
  if (*(int **)a1 == v9 || *(v9 - 1) != a3)
  {
    uint64_t v13 = *(void *)(a1 + 192);
    uint64_t v12 = a1 + 192;
    if ((int)((unint64_t)(*(void *)(a1 + 200) - v13) >> 2) <= a3)
    {
      unint64_t v14 = a3 + 1;
      sub_1B642863C(v12, v14);
      sub_1B642863C(a1 + 216, v14);
      uint64_t v13 = *(void *)(a1 + 192);
      uint64_t v9 = *(int **)(a1 + 8);
    }
    uint64_t v15 = (*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 2;
    uint64_t v11 = a3;
    *(_DWORD *)(v13 + 4 * a3) = v15;
    uint64_t v10 = *(void *)(a1 + 216);
    *(_DWORD *)(v10 + 4 * a3) = 0;
    *(_DWORD *)(a1 + 244) = v15;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 216);
    uint64_t v11 = a3;
  }
  unint64_t v16 = *(void *)(a1 + 16);
  ++*(_DWORD *)(a1 + 240);
  ++*(_DWORD *)(v10 + 4 * v11);
  if ((unint64_t)v9 >= v16)
  {
    unint64_t v18 = *(int **)a1;
    uint64_t v19 = ((uint64_t)v9 - *(void *)a1) >> 2;
    unint64_t v20 = v19 + 1;
    if ((unint64_t)(v19 + 1) >> 62) {
      goto LABEL_40;
    }
    unint64_t v21 = v16 - (void)v18;
    unint64_t v22 = (uint64_t)(v16 - (void)v18) >> 1;
    if (v22 > v20) {
      unint64_t v20 = v22;
    }
    if (v21 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v23 = v20;
    }
    if (v23)
    {
      unint64_t v24 = (char *)sub_1B64282E0(a1 + 16, v23);
      unint64_t v18 = *(int **)a1;
      uint64_t v9 = *(int **)(a1 + 8);
    }
    else
    {
      unint64_t v24 = 0;
    }
    uint64_t v25 = (int *)&v24[4 * v19];
    unint64_t v26 = &v24[4 * v23];
    *uint64_t v25 = a3;
    uint64_t v17 = v25 + 1;
    while (v9 != v18)
    {
      int v27 = *--v9;
      *--uint64_t v25 = v27;
    }
    *(void *)a1 = v25;
    *(void *)(a1 + 8) = v17;
    *(void *)(a1 + 16) = v26;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *uint64_t v9 = a3;
    uint64_t v17 = v9 + 1;
  }
  unint64_t v28 = *(void *)(a1 + 40);
  *(void *)(a1 + 8) = v17;
  unint64_t v29 = *(char **)(a1 + 32);
  if ((unint64_t)v29 < v28)
  {
    *(_DWORD *)unint64_t v29 = a2;
    uint64_t v30 = v29 + 4;
    goto LABEL_39;
  }
  uint64_t v31 = *(char **)(a1 + 24);
  uint64_t v32 = (v29 - v31) >> 2;
  unint64_t v33 = v32 + 1;
  if ((unint64_t)(v32 + 1) >> 62) {
LABEL_40:
  }
    abort();
  uint64_t v34 = v28 - (void)v31;
  if (v34 >> 1 > v33) {
    unint64_t v33 = v34 >> 1;
  }
  if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v35 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v35 = v33;
  }
  if (v35)
  {
    v36 = (char *)sub_1B64282E0(a1 + 40, v35);
    uint64_t v31 = *(char **)(a1 + 24);
    unint64_t v29 = *(char **)(a1 + 32);
  }
  else
  {
    v36 = 0;
  }
  v37 = &v36[4 * v32];
  v38 = &v36[4 * v35];
  *(_DWORD *)v37 = a2;
  uint64_t v30 = v37 + 4;
  while (v29 != v31)
  {
    int v39 = *((_DWORD *)v29 - 1);
    v29 -= 4;
    *((_DWORD *)v37 - 1) = v39;
    v37 -= 4;
  }
  *(void *)(a1 + 24) = v37;
  *(void *)(a1 + 32) = v30;
  *(void *)(a1 + 40) = v38;
  if (v31) {
    operator delete(v31);
  }
LABEL_39:
  *(void *)(a1 + 32) = v30;
  sub_1B6E120C8((uint64_t)&v40, a5);
}

void sub_1B6E120C8(uint64_t a1, float a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(float **)(*(void *)a1 + 56);
  uint64_t v5 = (void *)(*(void *)a1 + 64);
  if ((unint64_t)v4 >= *v5)
  {
    uint64_t v7 = (float *)v3[6];
    uint64_t v8 = v4 - v7;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62) {
      abort();
    }
    uint64_t v10 = *v5 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      uint64_t v12 = (char *)sub_1B64282E0((uint64_t)v5, v11);
      uint64_t v7 = (float *)v3[6];
      uint64_t v4 = (float *)v3[7];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = (float *)&v12[4 * v8];
    unint64_t v14 = &v12[4 * v11];
    float *v13 = a2;
    uint64_t v6 = v13 + 1;
    while (v4 != v7)
    {
      int v15 = *((_DWORD *)v4-- - 1);
      *((_DWORD *)v13-- - 1) = v15;
    }
    v3[6] = v13;
    v3[7] = v6;
    v3[8] = v14;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *uint64_t v4 = a2;
    uint64_t v6 = v4 + 1;
  }
  v3[7] = v6;
}

uint64_t sub_1B6E121A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  sub_1B6E17EAC((void *)(a1 + 32), a2);
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 24) = 1;
  if ((*(unsigned char *)(a1 + 9) & 0x10) != 0)
  {
    uint64_t v5 = (char *)(a1 + 144);
    unint64_t v6 = *(int *)(a1 + 12);
    if (v6 == -1)
    {
      sub_1B642863C((uint64_t)v5, (int)((uint64_t)(*(void *)(**(void **)(*(void *)a1 + 40) + 464)- *(void *)(**(void **)(*(void *)a1 + 40) + 456)) >> 3));
      uint64_t v7 = *(void *)(a1 + 144);
      unint64_t v8 = *(void *)(a1 + 152) - v7;
      if ((int)(v8 >> 2) >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = (v8 >> 2);
        do
        {
          *(_DWORD *)(v7 + 4 * v9) = v9;
          ++v9;
        }
        while (v10 != v9);
      }
    }
    else
    {
      sub_1B6E15808(v5, *(char **)(a1 + 16), *(void *)(a1 + 16) + 4 * v6, v6);
    }
  }
  return a1;
}

uint64_t sub_1B6E12274(void *a1, _DWORD *a2, int *a3, unsigned int a4)
{
  uint64_t v6 = a3[1];
  uint64_t v7 = *(void *)(*(void *)(*a1 + 40) + 8 * v6);
  if ((a4 & 0x80000000) != 0)
  {
    int v8 = *(_DWORD *)(a1[12] + 4 * v6);
  }
  else
  {
    int v8 = *(_DWORD *)(*(void *)(a1[15] + 24 * a4) + 4 * v6);
    int v9 = *(_DWORD *)(a1[18] + 4 * a4);
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = (int *)sub_1B6E19D0C(v7, *a3, v9);
      goto LABEL_6;
    }
  }
  uint64_t v12 = *a3;
  uint64_t v13 = *(void *)(v7 + 24);
  uint64_t v10 = (int *)(*(void *)(v7 + 48) + 4 * *(int *)(v13 + 8 * v12 + 4));
  uint64_t v11 = *(unsigned int *)(v13 + 8 * v12);
LABEL_6:
  if ((int)v11 >= 1)
  {
    uint64_t v14 = v11;
    do
    {
      int v15 = *v10++;
      *a2++ = v15 + v8;
      --v14;
    }
    while (v14);
  }
  return v11;
}

uint64_t sub_1B6E12328(void *a1, uint64_t a2, int *a3, int a4, unsigned int a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3[1];
  int v8 = *(void **)(*(void *)(*a1 + 40) + 8 * v7);
  if ((a5 & 0x80000000) != 0)
  {
    int v9 = a1 + 12;
    unsigned int v10 = -1;
  }
  else
  {
    int v9 = (void *)(a1[15] + 24 * a5);
    unsigned int v10 = *(_DWORD *)(a1[18] + 4 * a5);
  }
  unsigned int v11 = *(_DWORD *)(*v9 + 4 * v7);
  if (!a4) {
    goto LABEL_8;
  }
  int v12 = dword_1B6ED0764[a4];
  uint64_t v13 = dword_1B6ED07A4[a4];
  switch(v12)
  {
    case 2:
      uint64_t v14 = (char *)&unk_1B6ED0620 + 64 * v13;
      sub_1B6E1A1C4(v8, *a3, v22, v13, v10);
      goto LABEL_11;
    case 1:
      uint64_t v14 = (char *)&unk_1B6ED0520 + 64 * v13;
      sub_1B6E19FE4(v8, *a3, v22, v13, v10);
LABEL_11:
      uint64_t v15 = 0;
      int v16 = v22[0];
      do
      {
        uint64_t v17 = *(unsigned int *)&v14[v15];
        int v18 = v16;
        if ((v17 & 0x80000000) == 0) {
          int v18 = v22[v17];
        }
        *(_DWORD *)(a2 + v15) = v18 + v11;
        v15 += 4;
      }
      while (v15 != 64);
      return 16;
    case 0:
LABEL_8:
      sub_1B6E19E44(v8, *a3, v22, 0, v10);
      uint64_t v14 = (char *)&unk_1B6ED04E0;
      goto LABEL_11;
  }
  if (v11)
  {
    uint64_t v20 = 0;
    int32x4_t v21 = vdupq_n_s32(v11);
    do
    {
      *(int32x4_t *)(a2 + v20 * 4) = vaddq_s32(*(int32x4_t *)&v22[v20], v21);
      v20 += 4;
    }
    while (v20 != 16);
  }
  return 16;
}

BOOL sub_1B6E124A4(uint64_t *a1, int a2, int a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(*(void *)(*a1 + 40) + 8 * a2);
  if ((*(unsigned char *)(v4[12] + a3) & 1) != 0
    || ((*(unsigned __int8 *)(v3 + 8) >> 2) & 0xF) > a2
    && (*(unsigned char *)(*(void *)(*(void *)(*(void *)(v3 + 64) + 8 * a2) + 408) + a3) & 1) != 0)
  {
    return 0;
  }
  uint64_t v5 = v4[3];
  uint64_t v6 = (int *)*(unsigned int *)(v5 + 8 * a3);
  v8[0] = (int *)(v4[6] + 4 * *(int *)(v5 + 8 * a3 + 4));
  v8[1] = v6;
  return (sub_1B6E198BC((uint64_t)v4, v8) & 0x800) == 0;
}

BOOL sub_1B6E1253C(uint64_t a1, int a2, int a3, unsigned int a4)
{
  v20[1] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)(*(void *)(*(void *)a1 + 40) + 8 * a2);
  if ((a4 & 0x80000000) != 0
    || sub_1B6E196B0(*(void *)(*(void *)(*(void *)a1 + 40) + 8 * a2), a3, *(_DWORD *)(*(void *)(a1 + 144) + 4 * a4)))
  {
    unsigned int v9 = -1;
  }
  else
  {
    unsigned int v9 = *(_DWORD *)(*(void *)(a1 + 144) + 4 * a4);
  }
  if (*(_DWORD *)(v7[3] + 8 * a3) != 4) {
    return 0;
  }
  sub_1B6E196D8(v7, a3, v20, v9);
  unsigned int v10 = (*(_WORD *)(a1 + 8) & 8) != 0 ? 6016 : 1924;
  unsigned int v11 = (*(_WORD *)(a1 + 8) & 8) != 0 ? 4608 : 516;
  int16x4_t v12 = (int16x4_t)vand_s8((int8x8_t)vceq_s16((int16x4_t)vand_s8(v20[0], (int8x8_t)vdup_n_s16(v10)), vdup_n_s16(v11)), (int8x8_t)0x8000400020001);
  v12.i32[0] = vaddv_s16(v12) & 0xF;
  uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
  v13.i16[0] = vaddlv_u8(v13);
  int v14 = (v20[0].u16[0] >> 1) & 1;
  int v15 = (v20[0].u16[1] >> 1) & 1;
  int v16 = (v20[0].u16[2] >> 1) & 1;
  if (v13.i32[0] != 3 || v15 + v14 + v16 + ((v20[0].u16[3] >> 1) & 1) != 1) {
    return 0;
  }
  if (a2 > 1) {
    return 1;
  }
  if (v14)
  {
    int v19 = v20[0].i16[2] & 0x780;
  }
  else if (v15)
  {
    int v19 = v20[0].i16[3] & 0x780;
  }
  else if (v16)
  {
    int v19 = v20[0].i16[0] & 0x780;
  }
  else
  {
    int v19 = v20[0].i16[1] & 0x780;
  }
  return v19 == 128;
}

BOOL sub_1B6E126E8(uint64_t a1, int a2, int a3, unsigned int a4)
{
  int v5 = a2;
  v27[1] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)(*(void *)(*(void *)a1 + 40) + 8 * a2);
  if ((a4 & 0x80000000) != 0 || sub_1B6E196B0((uint64_t)v7, a3, *(_DWORD *)(*(void *)(a1 + 144) + 4 * a4))) {
    unsigned int v9 = -1;
  }
  else {
    unsigned int v9 = *(_DWORD *)(*(void *)(a1 + 144) + 4 * a4);
  }
  __int16 v10 = sub_1B6E198F8(v7, a3, v9);
  char v11 = v10;
  BOOL v12 = (v10 & 2) == 0;
  char v13 = v12 | v10;
  if ((*(_WORD *)(a1 + 8) & 8) == 0 || (v10 & 0x1010) == 0) {
    goto LABEL_25;
  }
  unsigned int v14 = (v10 & 0x4001) != 0x4000;
  if ((v10 & 0x5001) == 0x5000)
  {
    int v24 = v5;
    sub_1B6E196D8(v7, a3, v27, v9);
    uint64_t v15 = 0;
    __int16 v26 = 0;
    int v25 = 0;
    while (1)
    {
      __int16 v16 = v27[0].i16[v15];
      if ((v16 & 0x4000) != 0)
      {
        sub_1B6E12924(v7, a3, v15, 7, (uint64_t)&v25, v9);
        int v17 = (v16 & 0x2000) != 0 ? 2 : 1;
        if (v17 != (unsigned __int16)v25) {
          break;
        }
      }
      if (++v15 == 4)
      {
        unsigned int v14 = 1;
        goto LABEL_17;
      }
    }
    unsigned int v14 = 0;
LABEL_17:
    int v5 = v24;
  }
  char v13 = v14 != 0;
  if (v5 <= 1 && (v11 & 2) != 0)
  {
    sub_1B6E196D8(v7, a3, v27, v9);
    int16x8_t v18 = vdupq_n_s16(v14);
    unsigned __int32 v19 = vmovn_s16(v18).u32[0];
    *(int8x8_t *)v18.i8 = vbic_s8(*(int8x8_t *)v18.i8, (int8x8_t)vceq_s16((int16x4_t)vand_s8(v27[0], (int8x8_t)vdup_n_s16(0x782u)), (int16x4_t)0x82008200820082));
    if (vmovn_s16(v18).u32[0] == v19 && v14 != 0) {
      return 1;
    }
  }
  else
  {
LABEL_25:
    if (v13) {
      return 1;
    }
  }
  BOOL result = 0;
  if (*(unsigned char *)(a1 + 24)) {
    char v22 = v12;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0 && (v11 & 4) != 0 && (v11 & 1) == 0) {
    return sub_1B6E1253C(a1, v5, a3, v9);
  }
  return result;
}

uint64_t sub_1B6E12924(void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  if ((a6 & 0x80000000) != 0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(void *)(a1[57] + 8 * a6);
  }
  int v7 = 1;
  uint64_t v8 = *(int *)(a1[3] + 4 * ((2 * a2) | 1));
  uint64_t v9 = *(int *)(a1[6] + 4 * v8 + 4 * a3);
  int v10 = 2 * v9;
  uint64_t v11 = a1[42];
  uint64_t v12 = a1[45] + 4 * *(int *)(v11 + 8 * v9 + 4);
  uint64_t v13 = *(unsigned int *)(v11 + 4 * v10);
  if ((int)v13 < 1)
  {
LABEL_8:
    LODWORD(v14) = -1;
  }
  else
  {
    uint64_t v14 = 0;
    int v15 = *(_DWORD *)(a1[9] + 4 * v8 + 4 * a3);
    while (*(_DWORD *)(v12 + 4 * v14) != v15)
    {
      if (v13 == ++v14) {
        goto LABEL_8;
      }
    }
  }
  int v16 = ((int)v14 + 1) % (int)v13;
  *(_DWORD *)(a5 + 2) = 0;
  *(_WORD *)a5 = 1;
  uint64_t v17 = a1[30];
  int v18 = v14;
  while (1)
  {
    uint64_t result = *(int *)(v12 + 4 * v18);
    int v20 = *(unsigned __int8 *)(v17 + result);
    if (v6)
    {
      uint64_t result = *(unsigned __int8 *)(*(void *)(v6 + 48) + result);
      if (result) {
        v20 |= 6u;
      }
    }
    if ((v20 & a4) != 0) {
      break;
    }
    *(_WORD *)a5 = ++v7;
    int v18 = ((int)v13 - 1 + v18) % (int)v13;
    if (v18 == v16)
    {
      int v18 = ((int)v14 + 1) % (int)v13;
      goto LABEL_16;
    }
  }
  do
  {
LABEL_16:
    uint64_t v21 = *(int *)(v12 + 4 * v16);
    int v22 = *(unsigned __int8 *)(v17 + v21);
    if (v6)
    {
      uint64_t result = v22 | 6u;
      if (*(unsigned char *)(*(void *)(v6 + 48) + v21)) {
        v22 |= 6u;
      }
    }
    if ((v22 & a4) != 0) {
      break;
    }
    *(_WORD *)a5 = ++v7;
    int v16 = (v16 + 1) % (int)v13;
  }
  while (v16 != v14);
  *(_WORD *)(a5 + 2) = v18;
  return result;
}

uint64_t sub_1B6E12A58(uint64_t a1, int a2, int a3, unsigned int a4)
{
  v15[1] = *(int8x8_t *)MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(*(void *)(*(void *)a1 + 40) + 8 * a2);
  if ((a4 & 0x80000000) != 0 || sub_1B6E196B0((uint64_t)v6, a3, *(_DWORD *)(*(void *)(a1 + 144) + 4 * a4))) {
    unsigned int v8 = -1;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(a1 + 144) + 4 * a4);
  }
  sub_1B6E196D8(v6, a3, v15, v8);
  __int16 v9 = sub_1B6E1988C((unsigned __int16 *)v15, 4);
  if ((v9 & 0x1000) == 0) {
    goto LABEL_8;
  }
  if ((*(_WORD *)(a1 + 8) & 8) != 0)
  {
    int8x8_t v11 = vand_s8((int8x8_t)vshl_u16((uint16x4_t)v15[0], (uint16x4_t)0xFFF7FFF6FFF5FFF4), (int8x8_t)0x8000400020001);
    LOWORD(v10) = v11.i16[0] | v11.i16[2] | ((v11.i32[0] | v11.i32[1]) >> 16);
  }
  else
  {
    if ((v9 & 4) == 0)
    {
LABEL_8:
      LOWORD(v10) = 0;
      goto LABEL_11;
    }
    unsigned int v10 = (v15[0].u16[1] >> 1) & 2 | (v15[0].u16[0] >> 2) & 1 | v15[0].i8[4] & 4 | (8 * ((v15[0].u16[3] >> 2) & 1));
  }
LABEL_11:
  unsigned int v10 = (unsigned __int16)v10;
  if (v9)
  {
    int8x16_t v13 = vbicq_s8(vbslq_s8((int8x16_t)vmovl_s16(vceqz_s16((int16x4_t)vand_s8(v15[0], (int8x8_t)0x10001000100010))), (int8x16_t)xmmword_1B6E50330, (int8x16_t)xmmword_1B6ED04D0), (int8x16_t)vmovl_s16(vceqz_s16((int16x4_t)vand_s8(v15[0], (int8x8_t)0x1000100010001))));
    *(int8x8_t *)v13.i8 = vorr_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL));
    unsigned int v10 = v13.i32[0] | (unsigned __int16)v10 | v13.i32[1];
    switch((__int16)v10)
    {
      case 1:
      case 4:
        int v14 = 10;
        break;
      case 2:
      case 8:
        int v14 = 5;
        break;
      default:
        goto LABEL_12;
    }
    v10 |= v14;
  }
  else
  {
LABEL_12:
    if (!v10) {
      return 0;
    }
  }
  return dword_1B6ED0720[v10];
}

uint64_t sub_1B6E12C5C(uint64_t a1, int a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unsigned int v8 = *(void **)(*(void *)(*(void *)a1 + 40) + 8 * a2);
  if ((a5 & 0x80000000) != 0 || sub_1B6E196B0((uint64_t)v8, a3, *(_DWORD *)(*(void *)(a1 + 144) + 4 * a5)))
  {
    LODWORD(v10) = -1;
    uint64_t result = (uint64_t)sub_1B6E196D8(v8, a3, v41, 0xFFFFFFFF);
  }
  else
  {
    uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 144) + 4 * a5);
    uint64_t result = (uint64_t)sub_1B6E196D8(v8, a3, v41, v10);
    if ((v10 & 0x80000000) == 0) {
      uint64_t result = (uint64_t)sub_1B6E10B04(*(void **)(v8[57] + 8 * v10), a3, (uint64_t)v40);
    }
  }
  uint64_t v12 = v8[3];
  uint64_t v13 = *(unsigned int *)(v12 + 8 * a3);
  if ((int)v13 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v39 = (2 * a3) | 1;
    uint64_t v15 = v8[6] + 4 * *(int *)(v12 + 4 * v39);
    int v16 = 7;
    if ((*(_WORD *)(a1 + 8) & 8) == 0) {
      int v16 = 3;
    }
    uint64_t v37 = v15;
    int v38 = v16;
    do
    {
      BOOL v17 = (v10 & 0x80000000) != 0 || (v40[v14] & 1) == 0;
      if ((*(_WORD *)(a1 + 8) & 8) != 0
        && ((v41[v14] & 0x1000) != 0 ? (BOOL v18 = (v41[v14] & 0x780) != 256) : (BOOL v18 = 0), v18)
        || !v17)
      {
        __int16 v20 = v41[v14];
        uint64_t v21 = a4 + 6 * v14;
        if (v20)
        {
          uint64_t v22 = *(int *)(v8[6] + 4 * *(int *)(v8[3] + 4 * v39) + 4 * v14);
          uint64_t v23 = v8[36];
          uint64_t v24 = v8[33];
          uint64_t v25 = *(int *)(v24 + 8 * v22 + 4);
          uint64_t v26 = *(unsigned int *)(v24 + 8 * v22);
          uint64_t v27 = v8[39];
          *(_WORD *)(v21 + 4) = 0;
          *(_DWORD *)uint64_t v21 = 0;
          if ((int)v26 < 1)
          {
LABEL_29:
            if ((v20 & 8) == 0) {
              goto LABEL_30;
            }
          }
          else
          {
            uint64_t v28 = 0;
            uint64_t v29 = v23 + 4 * v25;
            uint64_t v30 = v27 + 2 * v25;
            while (*(_DWORD *)(v29 + 4 * v28) != a3 || v14 != *(unsigned __int16 *)(v30 + 2 * v28))
            {
              if (v26 == ++v28) {
                goto LABEL_29;
              }
            }
            uint64_t v33 = a4 + 6 * v14;
            *(_WORD *)(v33 + 2) = v28;
            *(_WORD *)uint64_t v21 = 1;
            *(unsigned char *)(v33 + 4) = 2;
            if ((v20 & 8) == 0)
            {
LABEL_30:
              if ((*(_WORD *)(a1 + 8) & 8) != 0)
              {
                uint64_t v32 = a4 + 6 * v14;
                char v31 = *(unsigned char *)(v32 + 4) & 0xFD | (2 * ((v20 & 0x4780) == 17408));
                *(unsigned char *)(v32 + 4) = v31;
              }
              else
              {
                char v31 = *(unsigned char *)(a4 + 6 * v14 + 4);
              }
              goto LABEL_35;
            }
          }
        }
        else
        {
          uint64_t result = sub_1B6E12924(v8, a3, v14, v38, v21, v10);
          if ((v20 & 8) == 0) {
            goto LABEL_30;
          }
        }
      }
      else
      {
        uint64_t v19 = a4 + 6 * v14;
        *(_WORD *)(v19 + 4) = 0;
        *(_DWORD *)uint64_t v19 = 0;
        __int16 v20 = v41[v14];
        if ((v20 & 8) == 0) {
          goto LABEL_30;
        }
      }
      uint64_t v34 = a4 + 6 * v14;
      char v31 = *(unsigned char *)(v34 + 4) | 2;
      *(unsigned char *)(v34 + 4) = v31;
LABEL_35:
      if ((v31 & 2) == 0 && (v20 & 7) == 6 && *(unsigned char *)(a1 + 24))
      {
        unint64_t v35 = (unsigned __int16 *)(a4 + 6 * v14);
        int v36 = *v35;
        if (!*v35) {
          int v36 = *(_DWORD *)(v8[33] + 8 * *(int *)(v37 + 4 * v14));
        }
        *((unsigned char *)v35 + 4) = v31 & 0xFD | (2 * (v36 == 1));
      }
      ++v14;
    }
    while (v14 != v13);
  }
  return result;
}

void sub_1B6E12F80(_WORD *a1, uint64_t a2)
{
  if ((int)sub_1B6E16D5C(a2) >= 1)
  {
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    do
    {
      v5 += sub_1B6E16D78(a2, v4);
      v6 += sub_1B6E16D9C(a2, v4++);
    }
    while (v4 < (int)sub_1B6E16D5C(a2));
    if (v6 && v5)
    {
      sub_1B642863C(a2 + 32, v6);
      sub_1B6428494(a2 + 56, v5);
      if ((*(unsigned char *)(*(void *)a1 + 8) & 1) == 0)
      {
        int v7 = 3;
        sub_1B6E169BC(a2, &v7, v5);
      }
      if ((a1[4] & 4) != 0) {
        sub_1B6E13070(a2 + 224, v5, &dword_1B6ED0760);
      }
    }
  }
}

void sub_1B6E13070(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_1B6E15910((void **)a1, a2 - v3, a3);
  }
}

void sub_1B6E130A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  int v5 = sub_1B6E16D8C(a2);
  sub_1B6E169F8(a2, (unint64_t)(a1[19] - a1[18]) >> 2);
  uint64_t v6 = a1[18];
  if ((int)((unint64_t)(a1[19] - v6) >> 2) >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      unsigned int v8 = (sub_1B6E1BBB4(**(void **)(v4 + 40), *(_DWORD *)(v6 + 4 * v7)) >> 2) & 7;
      sub_1B6E16B3C(a2, v8, v7);
      unsigned int v9 = *((unsigned __int16 *)a1 + 4);
      if (*(unsigned char *)(v4 + 8))
      {
        if ((v9 & 2) != 0) {
          int v13 = 4;
        }
        else {
          int v13 = 3;
        }
        int v15 = v13;
        uint64_t v12 = &v15;
      }
      else
      {
        int v10 = (v9 >> 13) & 1;
        if (v8 == 5) {
          int v10 = 1;
        }
        if ((v9 & 0x700) == 0x300) {
          int v11 = 9;
        }
        else {
          int v11 = 6;
        }
        if (v10) {
          int v11 = 3;
        }
        int v14 = v11;
        uint64_t v12 = &v14;
      }
      sub_1B6E16AB0(a2, v12, v5, v7++);
      uint64_t v6 = a1[18];
    }
    while (v7 < (int)((unint64_t)(a1[19] - v6) >> 2));
  }
}

unint64_t sub_1B6E131C8(void *a1, int a2, uint64_t a3, char a4, unsigned __int8 a5)
{
  char v7 = a2;
  uint64_t v8 = *a1;
  BOOL v9 = *(_DWORD *)(*(void *)(*(void *)(*(void *)(*a1 + 88) + 24 * a2) + 24) + 8 * a3) != 4;
  if (a2 < 1)
  {
    int v12 = 0;
    LOWORD(v11) = 0;
    int v10 = 0;
  }
  else
  {
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    uint64_t v13 = *(void *)(v8 + 64);
    uint64_t v14 = *(void *)(v8 + 40);
    int v15 = 1;
    unsigned int v16 = a2;
    uint64_t v17 = a2;
    do
    {
      BOOL v18 = *(void **)(v13 + 8 * --v16);
      int v19 = a3;
      a3 = *(int *)(v18[33] + 4 * (int)a3);
      if (*(_DWORD *)(*(void *)(*(void *)(v14 + 8 * v16) + 24) + 8 * a3) == 4)
      {
        int v10 = (*(unsigned __int8 *)(v18[42] + v19) >> 3) & 3;
        int v20 = v15 + v12;
        if (v10 == 1) {
          int v21 = v15 + v12;
        }
        else {
          int v21 = v12;
        }
        if (v10 == 2)
        {
          int v22 = v15 + v11;
        }
        else
        {
          int v20 = v21;
          int v22 = v11;
        }
        if (v10 == 3)
        {
          v11 += v15;
        }
        else
        {
          int v12 = v20;
          int v11 = v22;
        }
        int v15 = 2 * (v15 & 0x7FFF);
      }
      else
      {
        uint64_t v23 = v18[11];
        uint64_t v24 = *(unsigned int *)(v23 + 8 * a3);
        if ((int)v24 < 1)
        {
LABEL_18:
          BOOL v9 = 1;
        }
        else
        {
          uint64_t v25 = 0;
          uint64_t v26 = v18[15] + 4 * *(int *)(v23 + 4 * (int)((2 * a3) | 1));
          while (*(_DWORD *)(v26 + 4 * v25) != v19)
          {
            if (v24 == ++v25) {
              goto LABEL_18;
            }
          }
          BOOL v9 = 1;
          int v10 = v25;
        }
      }
    }
    while (v17-- > 1);
  }
  int v28 = sub_1B6E17F1C(a1 + 4, a3);
  if (v9) {
    int v29 = v10;
  }
  else {
    int v29 = 0;
  }
  uint64_t v30 = (v28 + v29) & 0xFFFFFFF | (a5 << 28);
  if (v9) {
    int v31 = 16;
  }
  else {
    int v31 = 0;
  }
  return v30 | ((unint64_t)(v7 & 0xF | ((a4 & 0xF) << 8) | (v12 << 22) | ((v11 & 0x3FF) << 12) | v31) << 32);
}

void sub_1B6E1336C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a1 + 8) & 1) == 0) {
    sub_1B6E139FC(a1, a2, a3);
  }
  sub_1B6E1337C(a1, a2, a3);
}

void sub_1B6E1337C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  sub_1B6E121A4((uint64_t)v3, a1, a2, a3);
  operator new();
}

void sub_1B6E139FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B6E121A4((uint64_t)v3, a1, a2, a3);
  sub_1B6E13ADC(v3);
  operator new();
}

void sub_1B6E13ADC(uint64_t *a1)
{
  v80 = a1 + 9;
  uint64_t v81 = *a1;
  sub_1B6E15468((void **)a1 + 9, *(int *)(*a1 + 28));
  unint64_t v2 = a1[14];
  uint64_t v79 = (uint64_t)(a1 + 14);
  unint64_t v3 = (char *)a1[13];
  if ((unint64_t)v3 >= v2)
  {
    int v5 = (char *)a1[12];
    uint64_t v6 = (v3 - v5) >> 2;
    unint64_t v7 = v6 + 1;
    if ((unint64_t)(v6 + 1) >> 62) {
LABEL_97:
    }
      abort();
    uint64_t v8 = v2 - (void)v5;
    if (v8 >> 1 > v7) {
      unint64_t v7 = v8 >> 1;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v7;
    }
    if (v9)
    {
      int v10 = (char *)sub_1B64282E0(v79, v9);
      int v5 = (char *)a1[12];
      unint64_t v3 = (char *)a1[13];
    }
    else
    {
      int v10 = 0;
    }
    int v11 = &v10[4 * v6];
    int v12 = &v10[4 * v9];
    *(_DWORD *)int v11 = 0;
    uint64_t v4 = v11 + 4;
    while (v3 != v5)
    {
      int v13 = *((_DWORD *)v3 - 1);
      v3 -= 4;
      *((_DWORD *)v11 - 1) = v13;
      v11 -= 4;
    }
    a1[12] = (uint64_t)v11;
    a1[13] = (uint64_t)v4;
    a1[14] = (uint64_t)v12;
    if (v5) {
      operator delete(v5);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v3 = 0;
    uint64_t v4 = v3 + 4;
  }
  a1[13] = (uint64_t)v4;
  uint64_t v14 = a1 + 15;
  sub_1B64279A8(a1 + 15, (a1[19] - a1[18]) >> 2);
  if ((int)((unint64_t)(a1[19] - a1[18]) >> 2) >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = *v14 + 24 * v15;
      BOOL v18 = (_DWORD **)(v16 + 8);
      uint64_t v17 = *(_DWORD **)(v16 + 8);
      int v20 = (void *)(v16 + 16);
      unint64_t v19 = *(void *)(v16 + 16);
      if ((unint64_t)v17 >= v19)
      {
        int v22 = *(_DWORD **)v16;
        uint64_t v23 = ((uint64_t)v17 - *(void *)v16) >> 2;
        unint64_t v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 62) {
          goto LABEL_97;
        }
        uint64_t v25 = v19 - (void)v22;
        if (v25 >> 1 > v24) {
          unint64_t v24 = v25 >> 1;
        }
        if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v24;
        }
        if (v26)
        {
          uint64_t v27 = (char *)sub_1B64282E0((uint64_t)v20, v26);
          uint64_t v17 = *v18;
          int v22 = *(_DWORD **)v16;
        }
        else
        {
          uint64_t v27 = 0;
        }
        int v28 = &v27[4 * v23];
        *(_DWORD *)int v28 = 0;
        int v21 = v28 + 4;
        while (v17 != v22)
        {
          int v29 = *--v17;
          *((_DWORD *)v28 - 1) = v29;
          v28 -= 4;
        }
        *(void *)uint64_t v16 = v28;
        *BOOL v18 = v21;
        *int v20 = &v27[4 * v26];
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        _DWORD *v17 = 0;
        int v21 = v17 + 1;
      }
      *BOOL v18 = v21;
      ++v15;
    }
    while (v15 < (int)((unint64_t)(a1[19] - a1[18]) >> 2));
  }
  uint64_t v30 = v81;
  if ((int)(-1431655765 * ((*(void *)(v81 + 96) - *(void *)(v81 + 88)) >> 3)) >= 1)
  {
    uint64_t v31 = 0;
    while (1)
    {
      uint64_t v32 = *(void *)(*(void *)(v30 + 40) + 8 * v31);
      uint64_t v34 = (int *)a1[13];
      unint64_t v33 = a1[14];
      int v35 = *(_DWORD *)(v32 + 8) + *(v34 - 1);
      if ((unint64_t)v34 >= v33)
      {
        uint64_t v37 = (int *)a1[12];
        uint64_t v38 = v34 - v37;
        unint64_t v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 62) {
          goto LABEL_97;
        }
        uint64_t v40 = v33 - (void)v37;
        if (v40 >> 1 > v39) {
          unint64_t v39 = v40 >> 1;
        }
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v41 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          uint64_t v42 = (char *)sub_1B64282E0(v79, v41);
          uint64_t v37 = (int *)a1[12];
          uint64_t v34 = (int *)a1[13];
        }
        else
        {
          uint64_t v42 = 0;
        }
        v43 = (int *)&v42[4 * v38];
        int *v43 = v35;
        int v36 = v43 + 1;
        while (v34 != v37)
        {
          int v44 = *--v34;
          *--v43 = v44;
        }
        a1[12] = (uint64_t)v43;
        a1[13] = (uint64_t)v36;
        a1[14] = (uint64_t)&v42[4 * v41];
        if (v37) {
          operator delete(v37);
        }
      }
      else
      {
        *uint64_t v34 = v35;
        int v36 = v34 + 1;
      }
      a1[13] = (uint64_t)v36;
      uint64_t v45 = a1[18];
      if ((int)((unint64_t)(a1[19] - v45) >> 2) >= 1)
      {
        uint64_t v46 = 0;
        do
        {
          uint64_t v47 = *v14 + 24 * v46;
          v48 = (_DWORD **)(v47 + 8);
          int v49 = *(_DWORD *)(*(void *)(v47 + 8) - 4);
          int v50 = sub_1B6E1BBA4(v32, *(_DWORD *)(v45 + 4 * v46)) + v49;
          v51 = *(_DWORD **)(v47 + 8);
          unint64_t v52 = *(void *)(v47 + 16);
          if ((unint64_t)v51 >= v52)
          {
            v54 = *(_DWORD **)v47;
            uint64_t v55 = ((uint64_t)v51 - *(void *)v47) >> 2;
            unint64_t v56 = v55 + 1;
            if ((unint64_t)(v55 + 1) >> 62) {
              goto LABEL_97;
            }
            uint64_t v57 = v52 - (void)v54;
            if (v57 >> 1 > v56) {
              unint64_t v56 = v57 >> 1;
            }
            if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v58 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v58 = v56;
            }
            if (v58)
            {
              v59 = (char *)sub_1B64282E0(v47 + 16, v58);
              v51 = *v48;
              v54 = *(_DWORD **)v47;
            }
            else
            {
              v59 = 0;
            }
            v60 = &v59[4 * v55];
            *(_DWORD *)v60 = v50;
            v53 = v60 + 4;
            while (v51 != v54)
            {
              int v61 = *--v51;
              *((_DWORD *)v60 - 1) = v61;
              v60 -= 4;
            }
            *(void *)uint64_t v47 = v60;
            *v48 = v53;
            *(void *)(v47 + 16) = &v59[4 * v58];
            if (v54) {
              operator delete(v54);
            }
          }
          else
          {
            _DWORD *v51 = v50;
            v53 = v51 + 1;
          }
          *v48 = v53;
          ++v46;
          uint64_t v45 = a1[18];
        }
        while (v46 < (int)((unint64_t)(a1[19] - v45) >> 2));
      }
      if (*(int *)v32 >= 1) {
        break;
      }
LABEL_95:
      ++v31;
      uint64_t v30 = v81;
      if (v31 >= (int)(-1431655765 * ((*(void *)(v81 + 96) - *(void *)(v81 + 88)) >> 3))) {
        return;
      }
    }
    int v62 = 0;
    while (1)
    {
      if (sub_1B6E124A4(a1, v31, v62))
      {
        v64 = (int *)a1[10];
        unint64_t v63 = a1[11];
        if ((unint64_t)v64 >= v63)
        {
          uint64_t v66 = ((uint64_t)v64 - *v80) >> 3;
          unint64_t v67 = v66 + 1;
          if ((unint64_t)(v66 + 1) >> 61) {
            goto LABEL_97;
          }
          uint64_t v68 = v63 - *v80;
          if (v68 >> 2 > v67) {
            unint64_t v67 = v68 >> 2;
          }
          if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v69 = v67;
          }
          v71 = (char *)sub_1B64285D4((uint64_t)(a1 + 11), v69);
          v72 = (int *)&v71[8 * v66];
          int *v72 = v62;
          v72[1] = v31;
          v73 = (char *)a1[9];
          v74 = (char *)a1[10];
          v75 = v72;
          while (v74 != v73)
          {
            uint64_t v76 = *((void *)v74 - 1);
            v74 -= 8;
            *((void *)v75 - 1) = v76;
            v75 -= 2;
          }
          v65 = v72 + 2;
          a1[9] = (uint64_t)v75;
          a1[10] = (uint64_t)(v72 + 2);
          a1[11] = (uint64_t)&v71[8 * v70];
          if (v73) {
            operator delete(v73);
          }
        }
        else
        {
          int *v64 = v62;
          v64[1] = v31;
          v65 = v64 + 2;
        }
        a1[10] = (uint64_t)v65;
        if (sub_1B6E126E8((uint64_t)a1, v31, v62, 0xFFFFFFFF))
        {
          unsigned int v77 = 1;
          v78 = a1 + 7;
LABEL_93:
          *v78 += v77;
          goto LABEL_94;
        }
        ++*((_DWORD *)a1 + 15);
        if ((a1[1] & 0x700) == 0x400)
        {
          unsigned int v77 = (sub_1B6E198F8((void *)v32, v62, 0xFFFFFFFF) >> 2) & 1;
          v78 = a1 + 8;
          goto LABEL_93;
        }
      }
LABEL_94:
      if (++v62 >= *(_DWORD *)v32) {
        goto LABEL_95;
      }
    }
  }
}

void sub_1B6E14058(uint64_t a1, void *a2)
{
  uint64_t v4 = 0;
  v176[35] = *MEMORY[0x1E4F143B8];
  uint64_t v145 = *(void *)a1;
  do
  {
    int v5 = (char *)&v174 + v4 * 8;
    *(_DWORD *)int v5 = 6;
    *(void *)(v5 + 4) = 0;
    *(void *)(v5 + 20) = 0;
    *(void *)(v5 + 12) = 0;
    *((_DWORD *)v5 + 7) = 0;
    *((void *)v5 + 4) = &v176[v4 + 5];
    *((void *)v5 + 5) = 0x100000000;
    *((void *)v5 + 7) = 0;
    *((void *)v5 + 8) = &v176[v4 + 9];
    *((void *)v5 + 9) = 0x100000000;
    v4 += 12;
    *((void *)v5 + 11) = 0;
  }
  while (v4 != 36);
  int v6 = *(_DWORD *)(a1 + 56);
  int v174 = 6;
  int v175 = v6;
  BOOL v7 = v6 > 0;
  int v8 = *(unsigned char *)(a1 + 9) & 7;
  switch(v8)
  {
    case 4:
      int v11 = &v174 + 24 * (v6 > 0);
      int v12 = *(_DWORD *)(a1 + 60);
      int v13 = *(_DWORD *)(a1 + 64);
      BOOL v14 = __OFSUB__(v12, v13);
      int v15 = v12 - v13;
      *int v11 = 7;
      v11[1] = v15;
      unsigned int v149 = v7;
      if ((v15 < 0) ^ v14 | (v15 == 0)) {
        unsigned int v16 = v7;
      }
      else {
        unsigned int v16 = v7 + 1;
      }
      uint64_t v17 = &v174 + 24 * v16;
      int *v17 = 8;
      v17[1] = v13;
      unsigned int v146 = v16;
      if (v13 <= 0) {
        unsigned int v10 = v16;
      }
      else {
        unsigned int v10 = v16 + 1;
      }
      break;
    case 3:
      BOOL v18 = &v174 + 24 * (v6 > 0);
      int v19 = *(_DWORD *)(a1 + 60);
      int v20 = v18[1];
      BOOL v14 = __OFADD__(v20, v19);
      int v21 = v20 + v19;
      *BOOL v18 = 9;
      v18[1] = v21;
      if ((v21 < 0) ^ v14 | (v21 == 0)) {
        unsigned int v10 = v7;
      }
      else {
        unsigned int v10 = v7 + 1;
      }
      unsigned int v149 = v7;
      unsigned int v146 = v7;
      break;
    case 2:
      unsigned int v146 = 0;
      unsigned int v149 = 0;
      int v9 = *(_DWORD *)(a1 + 60);
      int v175 = v9 + v6;
      if ((v175 < 0) ^ __OFADD__(v9, v6) | (v175 == 0)) {
        unsigned int v10 = 0;
      }
      else {
        unsigned int v10 = 1;
      }
      break;
    default:
      unsigned int v146 = 2;
      unsigned int v10 = v6 > 0;
      unsigned int v149 = 1;
      break;
  }
  sub_1B6E168E8((uint64_t)a2, v10);
  uint64_t v157 = 0;
  int v156 = 0;
  if (v10)
  {
    uint64_t v22 = v10;
    uint64_t v23 = &v175;
    do
    {
      int v24 = *v23;
      int v155 = *(v23 - 1);
      sub_1B6E16B50(a2, &v155, v24, (int *)&v157 + 1, (int *)&v157, &v156);
      v23 += 24;
      --v22;
    }
    while (v22);
  }
  __int16 v148 = *(_WORD *)(a1 + 8);
  sub_1B6E12F80((_WORD *)a1, (uint64_t)a2);
  if (*(void *)(a1 + 144) != *(void *)(a1 + 152)) {
    sub_1B6E130A0((uint64_t *)a1, (uint64_t)a2);
  }
  if (v10)
  {
    uint64_t v25 = 0;
    uint64_t v151 = v10;
    do
    {
      unint64_t v26 = &v174 + 24 * v25;
      *((void *)v26 + 1) = sub_1B6E16DD4((uint64_t)a2, v25);
      *((void *)v26 + 2) = sub_1B6E16E7C((uint64_t)a2, v25);
      if ((v148 & 4) != 0) {
        v176[12 * v25 + 2] = sub_1B6E16D28((uint64_t)a2, v25);
      }
      uint64_t v27 = *(void *)(a1 + 144);
      uint64_t v28 = *(void *)(a1 + 152);
      if (v27 != v28)
      {
        int v29 = &v176[12 * v25 + 3];
        uint64_t v30 = v28 - v27;
        unint64_t v31 = (unint64_t)(v28 - v27) >> 2;
        if (v31)
        {
          uint64_t v32 = &v174 + 24 * v25;
          unsigned int v34 = v32[11];
          unint64_t v33 = v32 + 11;
          if (v34 < v31)
          {
            int v35 = (void **)(&v174 + 24 * v25);
            operator delete(v35[7]);
            *int v29 = (uint64_t)(v35 + 6);
            *unint64_t v33 = 1;
            int v36 = operator new((2 * v30) & 0x7FFFFFFF8);
            v35[7] = v36;
            *int v29 = (uint64_t)v36;
            *unint64_t v33 = v31;
          }
        }
        else
        {
          uint64_t v37 = (void **)(&v174 + 24 * v25);
          operator delete(v37[7]);
          *int v29 = (uint64_t)(v37 + 6);
          *((_DWORD *)v37 + 11) = 1;
        }
        uint64_t v38 = &v174 + 24 * v25;
        v38[10] = v31;
        unint64_t v39 = v38 + 16;
        unint64_t v40 = *(void *)(a1 + 152) - *(void *)(a1 + 144);
        unint64_t v41 = v40 >> 2;
        if ((v40 >> 2))
        {
          uint64_t v42 = &v174 + 24 * v25;
          unsigned int v44 = v42[19];
          v43 = v42 + 19;
          if (v44 < v41)
          {
            uint64_t v45 = (void **)(&v174 + 24 * v25);
            operator delete(v45[11]);
            void *v39 = v45 + 10;
            _DWORD *v43 = 1;
            uint64_t v46 = operator new((2 * v40) & 0x7FFFFFFF8);
            v45[11] = v46;
            void *v39 = v46;
            _DWORD *v43 = v41;
          }
        }
        else
        {
          uint64_t v47 = (void **)(&v174 + 24 * v25);
          operator delete(v47[11]);
          void *v39 = v47 + 10;
          *((_DWORD *)v47 + 19) = 1;
        }
        LODWORD(v176[12 * v25 + 8]) = v41;
        if ((int)((*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2) >= 1)
        {
          uint64_t v48 = 0;
          do
          {
            sub_1B6E17114((uint64_t)a2, v48, &v170);
            int v49 = sub_1B6E16D10((uint64_t)a2, v25, 0);
            int v50 = v49;
            if ((v170 - 1) > 8) {
              int v51 = -1;
            }
            else {
              int v51 = dword_1B6ED07F0[(int)v170 - 1];
            }
            *(void *)(*v29 + 8 * v48) = sub_1B6E1712C((uint64_t)a2, v48) + 4 * v51 * v49;
            *(void *)(*v39 + 8 * v48) = sub_1B6E171D8((uint64_t)a2, v48) + 8 * v50;
            ++v48;
          }
          while (v48 < (int)((*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2));
        }
      }
      ++v25;
    }
    while (v25 != v151);
  }
  unint64_t v52 = &v172;
  uint64_t v171 = 0x100000000;
  v173 = 0;
  v53 = &v168;
  __p = 0;
  v166 = &v168;
  uint64_t v167 = 0x100000000;
  v169 = 0;
  v170 = &v172;
  v54 = &v164;
  v162 = &v164;
  uint64_t v163 = 0x100000000;
  int v55 = *(unsigned char *)(a1 + 9) & 7;
  switch(v55)
  {
    case 2:
      operator new();
    case 3:
      operator new();
    case 4:
      operator new();
  }
  uint64_t v56 = *(void *)(a1 + 144);
  uint64_t v57 = *(void *)(a1 + 152);
  if (v56 != v57)
  {
    uint64_t v58 = v57 - v56;
    unint64_t v59 = (unint64_t)(v57 - v56) >> 2;
    if (v59)
    {
      if (HIDWORD(v171) >= v59) {
        goto LABEL_57;
      }
      operator delete(v173);
      v170 = &v172;
      HIDWORD(v171) = 1;
      unint64_t v52 = (uint64_t *)operator new((2 * v58) & 0x7FFFFFFF8);
      v173 = v52;
      int v60 = v59;
    }
    else
    {
      operator delete(v173);
      int v60 = 1;
    }
    v170 = v52;
    HIDWORD(v171) = v60;
LABEL_57:
    LODWORD(v171) = v59;
    unint64_t v61 = *(void *)(a1 + 152) - *(void *)(a1 + 144);
    if ((v61 >> 2))
    {
      if (HIDWORD(v167) >= (v61 >> 2)) {
        goto LABEL_62;
      }
      operator delete(v169);
      v166 = &v168;
      HIDWORD(v167) = 1;
      v53 = (uint64_t *)operator new((2 * v61) & 0x7FFFFFFF8);
      v169 = v53;
      int v62 = v61 >> 2;
    }
    else
    {
      operator delete(v169);
      int v62 = 1;
    }
    v166 = v53;
    HIDWORD(v167) = v62;
LABEL_62:
    LODWORD(v167) = v61 >> 2;
    unint64_t v63 = *(void *)(a1 + 152) - *(void *)(a1 + 144);
    if ((v63 >> 2))
    {
      if (HIDWORD(v163) >= (v63 >> 2)) {
        goto LABEL_67;
      }
      operator delete(__p);
      v162 = &v164;
      HIDWORD(v163) = 1;
      v54 = (uint64_t *)operator new((2 * v63) & 0x7FFFFFFF8);
      __p = v54;
      int v64 = v63 >> 2;
    }
    else
    {
      operator delete(__p);
      int v64 = 1;
    }
    v162 = v54;
    HIDWORD(v163) = v64;
LABEL_67:
    LODWORD(v163) = v63 >> 2;
    if ((int)((*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2) >= 1)
    {
      uint64_t v65 = 0;
      do
      {
        int v66 = *(unsigned char *)(a1 + 9) & 7;
        if (v66 == 2) {
          operator new();
        }
        if (v66 == 3) {
          operator new();
        }
        ++v65;
      }
      while (v65 < (int)((*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2));
    }
  }
  uint64_t v67 = *(void *)(a1 + 72);
  if ((int)((unint64_t)(*(void *)(a1 + 80) - v67) >> 3) >= 1)
  {
    uint64_t v68 = 0;
    v141 = &v174 + 24 * v146;
    v140 = (_DWORD **)(v141 + 2);
    v142 = &v176[12 * v149];
    v143 = &v174 + 24 * v149;
    v144 = a2 + 33;
    do
    {
      unint64_t v69 = (int *)(v67 + 8 * v68);
      uint64_t v70 = v69 + 1;
      v71 = *(void **)(*(void *)(v145 + 40) + 8 * v69[1]);
      __int16 v72 = sub_1B6E198F8(v71, *v69, 0xFFFFFFFF);
      memset(v161, 0, sizeof(v161));
      BOOL v73 = sub_1B6E126E8(a1, v69[1], *v69, 0xFFFFFFFF);
      int v74 = v69[1];
      int v75 = *v69;
      BOOL v152 = v73;
      uint64_t v147 = v68;
      if (v73)
      {
        int v76 = sub_1B6E12A58(a1, v74, v75, 0xFFFFFFFF);
        int v77 = v76;
        int v150 = 0;
        float v78 = 0.0;
        if ((v148 & 4) == 0 || v76)
        {
          int v80 = v76;
        }
        else
        {
          if ((v72 & 0x1040) == 0) {
            goto LABEL_90;
          }
          LODWORD(v158) = 0;
          LODWORD(v154) = 0;
          if (!sub_1B6E1A334(v71, *v69, &v158, &v154)) {
            goto LABEL_90;
          }
          float v79 = (float)((*(_WORD *)(a1 + 8) >> 4) - *v70);
          if (*(float *)&v158 <= v79) {
            float v79 = *(float *)&v158;
          }
          if (v79 > 0.0)
          {
            int v77 = 0;
            int v150 = 1;
            int v80 = 1 << v154;
            float v78 = v79;
          }
          else
          {
LABEL_90:
            int v77 = 0;
            int v80 = 0;
            int v150 = 0;
          }
        }
        sub_1B6E12328((void *)a1, v176[0], v69, v77, 0xFFFFFFFF);
        v176[0] += 64;
        uint64_t v84 = *v70;
        if (v84 == ((*(unsigned __int8 *)(*(void *)a1 + 8) >> 2) & 0xF)) {
          LOBYTE(v85) = 0;
        }
        else {
          int v85 = (*(unsigned __int8 *)(*(void *)(*(void *)(*(void *)(*(void *)a1 + 64) + 8 * v84) + 408)
        }
                                    + *v69) >> 1) & 0xF;
        v86 = &v174;
      }
      else
      {
        sub_1B6E12C5C(a1, v74, v75, (uint64_t)v161, 0xFFFFFFFF);
        int v81 = *(unsigned char *)(a1 + 9) & 7;
        float v78 = 0.0;
        if (v81 == 2)
        {
          v82 = v142;
          int v83 = sub_1B6E155A0((void *)a1, 0, (_DWORD *)*v142, v69, (__int16 *)v161, 0xFFFFFFFF);
          goto LABEL_98;
        }
        if (v81 != 4)
        {
          if (v81 == 3)
          {
            v82 = v142;
            int v83 = sub_1B6E15508((void *)a1, 0, (_DWORD *)*v142, v69, (uint64_t)v161, 0xFFFFFFFF);
            goto LABEL_98;
          }
          int v150 = 0;
          int v80 = 0;
          LOBYTE(v85) = 0;
          goto LABEL_100;
        }
        if ((v72 & 4) == 0)
        {
          v82 = v142;
          int v83 = sub_1B6E15638((void *)a1, 0, (_DWORD *)*v142, v69, (uint64_t)v161, 0xFFFFFFFF);
LABEL_98:
          int v150 = 0;
          int v80 = 0;
          LOBYTE(v85) = 0;
          *v82 += 4 * v83;
LABEL_100:
          v86 = v143;
          goto LABEL_101;
        }
        int v117 = sub_1B6E15638((void *)a1, 0, *v140, v69, (uint64_t)v161, 0xFFFFFFFF);
        int v150 = 0;
        int v80 = 0;
        LOBYTE(v85) = 0;
        *v140 += v117;
        v86 = v141;
      }
LABEL_101:
      unint64_t v87 = sub_1B6E131C8((void *)a1, *v70, *v69, v80, v85);
      v88 = (unint64_t *)*((void *)v86 + 2);
      *((void *)v86 + 2) = v88 + 1;
      unint64_t *v88 = v87;
      if ((v148 & 4) != 0)
      {
        v89 = (float *)a2[31];
        v90 = (float *)a2[32];
        uint64_t v91 = v90 - v89;
        if ((int)v91 < 1)
        {
LABEL_106:
          if ((unint64_t)v90 >= *v144)
          {
            unint64_t v94 = v91 + 1;
            if ((unint64_t)(v91 + 1) >> 62) {
              abort();
            }
            uint64_t v95 = *v144 - (void)v89;
            if (v95 >> 1 > v94) {
              unint64_t v94 = v95 >> 1;
            }
            if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v96 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v96 = v94;
            }
            if (v96)
            {
              v97 = (char *)sub_1B64282E0((uint64_t)v144, v96);
              v89 = (float *)a2[31];
              v90 = (float *)a2[32];
            }
            else
            {
              v97 = 0;
            }
            v98 = (float *)&v97[4 * v91];
            float *v98 = v78;
            v93 = v98 + 1;
            while (v90 != v89)
            {
              int v99 = *((_DWORD *)v90-- - 1);
              *((_DWORD *)v98-- - 1) = v99;
            }
            a2[31] = v98;
            a2[32] = v93;
            a2[33] = &v97[4 * v96];
            if (v89)
            {
              operator delete(v89);
              v89 = (float *)a2[31];
            }
            else
            {
              v89 = v98;
            }
          }
          else
          {
            float *v90 = v78;
            v93 = v90 + 1;
          }
          a2[32] = v93;
          LODWORD(v92) = ((unint64_t)((char *)v93 - (char *)v89) >> 2) - 1;
        }
        else
        {
          uint64_t v92 = 0;
          while (v89[v92] != v78)
          {
            if (((unint64_t)((char *)v90 - (char *)v89) >> 2) == ++v92) {
              goto LABEL_106;
            }
          }
        }
        v100 = (_DWORD *)*((void *)v86 + 3);
        _DWORD *v100 = v92;
        *((void *)v86 + 3) = v100 + 1;
      }
      uint64_t v101 = *(void *)(a1 + 144);
      uint64_t v102 = *(void *)(a1 + 152);
      if (v101 != v102 && (int)((unint64_t)(v102 - v101) >> 2) >= 1)
      {
        int v103 = v80;
        uint64_t v104 = 0;
        while (1)
        {
          uint64_t v154 = *(void *)v69;
          sub_1B6E17114((uint64_t)a2, v104, &v153);
          if (v153 != 3) {
            break;
          }
          *(void *)(*((void *)v86 + 4) + 8 * v104) += 4
                                                        * (int)sub_1B6E12274((void *)a1, *(_DWORD **)(*((void *)v86 + 4) + 8 * v104), (int *)&v154, v104);
          uint64_t v105 = *((void *)v86 + 8);
          v106 = *(unint64_t **)(v105 + 8 * v104);
          *(void *)(v105 + 8 * v104) = v106 + 1;
          unint64_t *v106 = v87;
LABEL_154:
          if (++v104 >= (int)((*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2)) {
            goto LABEL_155;
          }
        }
        if (sub_1B6E196B0(*(void *)(*(void *)(*(void *)a1 + 40) + 8 * *v70), *v69, *(_DWORD *)(*(void *)(a1 + 144) + 4 * v104)))
        {
          if (v152)
          {
            int v107 = v103;
            if (v150)
            {
              sub_1B6E12328((void *)a1, *(void *)(*((void *)v86 + 4) + 8 * v104), (int *)&v154, 0, v104);
              int v108 = 1;
              LOBYTE(v107) = v103;
LABEL_144:
              if ((v153 - 1) > 8) {
                uint64_t v110 = -1;
              }
              else {
                uint64_t v110 = qword_1B6ED0818[v153 - 1];
              }
              *(void *)(*((void *)v86 + 4) + 8 * v104) += 4 * v110;
              BOOL v111 = v108 == 0;
              if (v108) {
                unint64_t v112 = (unint64_t)(v107 & 0xF) << 40;
              }
              else {
                unint64_t v112 = 0;
              }
              uint64_t v113 = 0x2000000000;
              if (v111) {
                uint64_t v113 = 0;
              }
              unint64_t v114 = v87 & 0xFFFFF01FFFFFFFFFLL | v113 | v112;
              uint64_t v115 = *((void *)v86 + 8);
              v116 = *(unint64_t **)(v115 + 8 * v104);
              *(void *)(v115 + 8 * v104) = v116 + 1;
              unint64_t *v116 = v114;
              goto LABEL_154;
            }
LABEL_136:
            sub_1B6E12328((void *)a1, *(void *)(*((void *)v86 + 4) + 8 * v104), (int *)&v154, v107, v104);
            int v108 = 1;
            goto LABEL_144;
          }
          uint64_t v158 = 0;
          uint64_t v159 = 0;
          v109 = (__int16 *)v161;
          uint64_t v160 = 0;
        }
        else
        {
          if (sub_1B6E126E8(a1, *v70, *v69, v104))
          {
            int v107 = sub_1B6E12A58(a1, *v70, *v69, v104);
            goto LABEL_136;
          }
          uint64_t v158 = 0;
          uint64_t v159 = 0;
          uint64_t v160 = 0;
          v109 = (__int16 *)&v158;
          sub_1B6E12C5C(a1, *v70, *v69, (uint64_t)&v158, v104);
        }
        if (v153 == 9)
        {
          sub_1B6E15508((void *)a1, v166[v104], *(_DWORD **)(*((void *)v86 + 4) + 8 * v104), (int *)&v154, (uint64_t)v109, v104);
        }
        else if (v153 == 6)
        {
          sub_1B6E155A0((void *)a1, v170[v104], *(_DWORD **)(*((void *)v86 + 4) + 8 * v104), (int *)&v154, v109, v104);
        }
        int v108 = 0;
        LOBYTE(v107) = 0;
        goto LABEL_144;
      }
LABEL_155:
      uint64_t v68 = v147 + 1;
      uint64_t v67 = *(void *)(a1 + 72);
    }
    while (v147 + 1 < (int)((unint64_t)(*(void *)(a1 + 80) - v67) >> 3));
  }
  sub_1B6E16F0C((uint64_t)a2);
  int v118 = *(unsigned char *)(a1 + 9) & 7;
  switch(v118)
  {
    case 2:
      a2[16] = 0;
      a2[17] = 0;
      break;
    case 4:
      sub_1B6E2C810(0, *(_DWORD *)a2, a2 + 10, a2 + 13, -1);
      break;
    case 3:
      a2[16] = 0;
      a2[17] = 0;
      break;
  }
  uint64_t v119 = *(void *)(a1 + 144);
  uint64_t v120 = *(void *)(a1 + 152);
  if (v119 != v120)
  {
    v121 = a2 + 25;
    sub_1B6428494((uint64_t)v121, (v120 - v119) >> 2);
    if ((int)((*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2) >= 1)
    {
      uint64_t v122 = 0;
      while (1)
      {
        v123 = (void *)v162[v122];
        if ((int)((v123[3] - v123[2]) >> 2) < 1)
        {
          (*(void (**)(uint64_t))(*v123 + 8))(v162[v122]);
          v162[v122] = 0;
        }
        else
        {
          sub_1B6E156D0((void *)v162[v122]);
          sub_1B642863C((uint64_t)(v123 + 5), (int)((uint64_t)(v123[3] - v123[2]) >> 2));
          v124 = (int *)v123[2];
          unint64_t v125 = v123[3] - (void)v124;
          if ((int)(v125 >> 2) >= 1)
          {
            int v126 = 0;
            v127 = (_DWORD *)v123[5];
            uint64_t v128 = (v125 >> 2);
            do
            {
              *v127++ = v126;
              int v129 = *v124++;
              v126 += v129;
              --v128;
            }
            while (v128);
          }
        }
        int v130 = *(unsigned char *)(a1 + 9) & 7;
        if (v130 != 2) {
          break;
        }
        v136 = (void *)v170[v122];
        if (v136)
        {
          v137 = (void *)v136[4];
          if (v137)
          {
            v136[5] = v137;
            operator delete(v137);
          }
          v134 = v136;
          unsigned int v135 = 1232653951;
LABEL_185:
          MEMORY[0x1BA9B6D80](v134, v135 | 0x1070C4000000000);
        }
LABEL_186:
        *(void *)(*v121 + 8 * v122) = v162[v122];
        if (++v122 >= (int)((*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2)) {
          goto LABEL_187;
        }
      }
      if (v130 != 3) {
        goto LABEL_186;
      }
      v131 = (void *)v166[v122];
      if (!v131) {
        goto LABEL_186;
      }
      v132 = (void *)v131[8];
      if (v132)
      {
        v131[9] = v132;
        operator delete(v132);
      }
      v133 = (void *)v131[5];
      if (v133)
      {
        v131[6] = v133;
        operator delete(v133);
      }
      v134 = v131;
      unsigned int v135 = 537674454;
      goto LABEL_185;
    }
  }
LABEL_187:
  operator delete(__p);
  operator delete(v169);
  operator delete(v173);
  uint64_t v138 = 36;
  do
  {
    v139 = (char *)&v174 + v138 * 8;
    operator delete((&v173)[v138]);
    *((void *)v139 - 4) = v139 - 16;
    *((_DWORD *)v139 - 5) = 1;
    operator delete((&v169)[v138]);
    *((void *)v139 - 8) = v139 - 48;
    *((_DWORD *)v139 - 13) = 1;
    v138 -= 12;
  }
  while (v138 * 8);
}

void sub_1B6E15468(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      abort();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    int v6 = (char *)sub_1B64285D4(v3, a2);
    BOOL v7 = &v6[v5];
    int v9 = &v6[8 * v8];
    unsigned int v10 = (char *)*a1;
    int v11 = (char *)a1[1];
    int v12 = v7;
    if (v11 != *a1)
    {
      int v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t sub_1B6E15508(void *a1, uint64_t a2, _DWORD *a3, int *a4, uint64_t a5, unsigned int a6)
{
  if ((a6 & 0x80000000) != 0)
  {
    BOOL v7 = a1 + 12;
    int v8 = -1;
  }
  else
  {
    BOOL v7 = (void *)(a1[15] + 24 * a6);
    int v8 = *(_DWORD *)(a1[18] + 4 * a6);
  }
  unsigned int v10 = (int *)sub_1B6E295F0(a2, *(void *)(*(void *)(*a1 + 40) + 8 * a4[1]), *a4, a5, *(unsigned int *)(*v7 + 4 * a4[1]), v8);
  uint64_t result = v9;
  if ((int)v9 >= 1)
  {
    uint64_t v12 = v9;
    do
    {
      int v13 = *v10++;
      *a3++ = v13;
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t sub_1B6E155A0(void *a1, uint64_t a2, _DWORD *a3, int *a4, __int16 *a5, unsigned int a6)
{
  if ((a6 & 0x80000000) != 0)
  {
    BOOL v7 = a1 + 12;
    unsigned int v8 = -1;
  }
  else
  {
    BOOL v7 = (void *)(a1[15] + 24 * a6);
    unsigned int v8 = *(_DWORD *)(a1[18] + 4 * a6);
  }
  unsigned int v10 = sub_1B6E26D60(a2, *(void *)(*(void *)(*a1 + 40) + 8 * a4[1]), *a4, a5, *(_DWORD *)(*v7 + 4 * a4[1]), v8);
  uint64_t result = v9;
  if ((int)v9 >= 1)
  {
    uint64_t v12 = v9;
    do
    {
      int v13 = *(_DWORD *)v10;
      unsigned int v10 = (void *)((char *)v10 + 4);
      *a3++ = v13;
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t sub_1B6E15638(void *a1, void *a2, _DWORD *a3, int *a4, uint64_t a5, unsigned int a6)
{
  if ((a6 & 0x80000000) != 0)
  {
    BOOL v7 = a1 + 12;
    int v8 = -1;
  }
  else
  {
    BOOL v7 = (void *)(a1[15] + 24 * a6);
    int v8 = *(_DWORD *)(a1[18] + 4 * a6);
  }
  unsigned int v10 = (int *)sub_1B6E2C440(a2, *(void *)(*(void *)(*a1 + 40) + 8 * a4[1]), *a4, a5, *(_DWORD *)(*v7 + 4 * a4[1]), v8);
  uint64_t result = v9;
  if ((int)v9 >= 1)
  {
    uint64_t v12 = v9;
    do
    {
      int v13 = *v10++;
      *a3++ = v13;
      --v12;
    }
    while (v12);
  }
  return result;
}

void sub_1B6E156D0(void *a1)
{
  sub_1B6E157A0(&v11, (uint64_t)(a1 + 2));
  unint64_t v2 = (void *)a1[2];
  *((_OWORD *)a1 + 1) = v11;
  uint64_t v3 = v12;
  uint64_t v4 = a1[4];
  *(void *)&long long v11 = v2;
  uint64_t v12 = v4;
  a1[4] = v3;
  if (v2)
  {
    *((void *)&v11 + 1) = v2;
    operator delete(v2);
  }
  sub_1B6E157A0(&v11, (uint64_t)(a1 + 8));
  int64_t v5 = (void *)a1[8];
  *((_OWORD *)a1 + 4) = v11;
  uint64_t v6 = v12;
  uint64_t v7 = a1[10];
  *(void *)&long long v11 = v5;
  uint64_t v12 = v7;
  a1[10] = v6;
  if (v5)
  {
    *((void *)&v11 + 1) = v5;
    operator delete(v5);
  }
  sub_1B6E157A0(&v11, (uint64_t)(a1 + 11));
  int v8 = (void *)a1[11];
  *(_OWORD *)(a1 + 11) = v11;
  uint64_t v9 = v12;
  uint64_t v10 = a1[13];
  *(void *)&long long v11 = v8;
  uint64_t v12 = v10;
  a1[13] = v9;
  if (v8)
  {
    *((void *)&v11 + 1) = v8;
    operator delete(v8);
  }
}

void *sub_1B6E157A0(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    sub_1B646FFA4(a1, v5 >> 2);
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *sub_1B6E15808(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      abort();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_1B646FFA4(v7, v11);
    int v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      BOOL v18 = v9;
      int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  BOOL v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  unsigned int v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    BOOL v18 = v9;
    int v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v12 = &v9[v17];
  return result;
}

void sub_1B6E15910(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      size_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      uint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      abort();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      unint64_t v15 = (char *)sub_1B64282E0(v6, v14);
    }
    else {
      unint64_t v15 = 0;
    }
    BOOL v18 = &v15[4 * v12];
    int v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    int v21 = v18;
    do
    {
      *(_DWORD *)int v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    uint64_t v22 = &v15[4 * v14];
    uint64_t v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void *sub_1B6E15A30(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (void *)a2;
  *(_OWORD *)(a1 + 48) = 0u;
  v139 = (char **)(a1 + 48);
  *(_OWORD *)(a1 + 96) = 0u;
  v132 = (void **)(a1 + 96);
  *(_OWORD *)(a1 + 144) = 0u;
  v136 = (uint64_t *)(a1 + 144);
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  v133 = (void **)(a1 + 24);
  int v130 = (char **)(a1 + 72);
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  int v3 = sub_1B6E16D5C(a2);
  if (v3 < 1)
  {
    unint64_t v9 = 0;
    int v4 = 0;
  }
  else
  {
    int v4 = 0;
    int v5 = 0;
    for (int i = 0; i != v3; ++i)
    {
      int v7 = sub_1B6E16D78((uint64_t)v2, i);
      sub_1B6E16D44((uint64_t)v2, i, &v144);
      if ((v144 - 1) > 8) {
        int v8 = -1;
      }
      else {
        int v8 = dword_1B6ED0860[v144 - 1];
      }
      v4 += v7;
      v5 += v8 * v7;
    }
    unint64_t v9 = v5;
  }
  v137 = (void *)(a1 + 120);
  uint64_t v10 = (void *)(a1 + 168);
  unint64_t v11 = v3;
  sub_1B65A5A78((char **)a1, v3);
  sub_1B6427A50(v133, v9);
  sub_1B65A5A78(v130, v3);
  sub_1B6E16E9C((uint64_t)v2, &v144);
  int v131 = v3;
  if ((v144 - 1) > 8) {
    int v12 = -1;
  }
  else {
    int v12 = dword_1B6ED0860[v144 - 1];
  }
  sub_1B6427A50(v132, v12 * v4);
  int v13 = sub_1B6E170F8((uint64_t)v2);
  sub_1B64279A8(v137, v13);
  int v14 = sub_1B6E170F8((uint64_t)v2);
  sub_1B64279A8(v136, v14);
  int v15 = sub_1B6E170F8((uint64_t)v2);
  sub_1B64279A8(v10, v15);
  int v140 = v4;
  unint64_t v16 = v4;
  if ((int)sub_1B6E170F8((uint64_t)v2) >= 1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    do
    {
      sub_1B65A5A78((char **)(*v137 + v17), v11);
      uint64_t v19 = *v136;
      sub_1B6E17114((uint64_t)v2, v18, &v144);
      if ((v144 - 1) > 8) {
        int v20 = -1;
      }
      else {
        int v20 = dword_1B6ED0860[v144 - 1];
      }
      sub_1B6427A50((void **)(v19 + v17), v20 * v140);
      sub_1B6E1638C((char **)(*v10 + v17), v16);
      ++v18;
      v17 += 24;
    }
    while (v18 < (int)sub_1B6E170F8((uint64_t)v2));
  }
  sub_1B6E1638C(v139, v16);
  int v21 = (void *)a1;
  if (v131 >= 1)
  {
    int v22 = 0;
    uint64_t v135 = (uint64_t)v2;
    do
    {
      sub_1B6E16D44((uint64_t)v2, v22, &v143);
      int v138 = v22;
      int v23 = sub_1B6E16D78((uint64_t)v2, v22);
      uint64_t v24 = a1;
      int v25 = v23;
      uint64_t v26 = (*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 2;
      int v27 = -1431655765 * ((*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 2);
      int v28 = v143;
      int v29 = *(_DWORD **)(a1 + 8);
      unint64_t v30 = *(void *)(a1 + 16);
      if ((unint64_t)v29 >= v30)
      {
        uint64_t v33 = ((uint64_t)v29 - *(void *)a1) >> 4;
        unint64_t v34 = v33 + 1;
        if ((unint64_t)(v33 + 1) >> 60) {
          goto LABEL_109;
        }
        uint64_t v35 = v30 - *(void *)a1;
        if (v35 >> 3 > v34) {
          unint64_t v34 = v35 >> 3;
        }
        if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v36 = v34;
        }
        uint64_t v37 = (char *)sub_1B6427C8C(a1 + 16, v36);
        unint64_t v39 = &v37[16 * v33];
        *(_DWORD *)unint64_t v39 = v28;
        *((_DWORD *)v39 + 1) = v25;
        *((_DWORD *)v39 + 2) = v26;
        *((_DWORD *)v39 + 3) = v27;
        unint64_t v41 = *(char **)a1;
        unint64_t v40 = *(char **)(a1 + 8);
        uint64_t v24 = a1;
        uint64_t v42 = v39;
        if (v40 == *(char **)a1)
        {
          int v32 = v138;
        }
        else
        {
          int v32 = v138;
          do
          {
            int v43 = *((_DWORD *)v40 - 4);
            v40 -= 16;
            *((_DWORD *)v42 - 4) = v43;
            v42 -= 16;
            uint64_t v44 = *(void *)(v40 + 4);
            *((_DWORD *)v42 + 3) = *((_DWORD *)v40 + 3);
            *(void *)(v42 + 4) = v44;
          }
          while (v40 != v41);
          unint64_t v40 = *(char **)a1;
        }
        unint64_t v31 = v39 + 16;
        *(void *)a1 = v42;
        *(void *)(a1 + 8) = v39 + 16;
        *(void *)(a1 + 16) = &v37[16 * v38];
        if (v40)
        {
          operator delete(v40);
          uint64_t v24 = a1;
        }
      }
      else
      {
        *int v29 = v143;
        v29[1] = v23;
        unint64_t v31 = v29 + 4;
        v29[2] = v26;
        v29[3] = v27;
        int v32 = v138;
      }
      *(void *)(v24 + 8) = v31;
      uint64_t v45 = (char *)sub_1B6E16DD4((uint64_t)v2, v32);
      sub_1B6E16470((uint64_t)v133, *(void *)(a1 + 32), v45, &v45[4 * v46], v46);
      sub_1B6E16E9C((uint64_t)v2, &v142);
      uint64_t v47 = a1;
      int v48 = v142;
      unint64_t v49 = *(void *)(a1 + 80);
      unint64_t v50 = *(void *)(a1 + 88);
      if (v49 >= v50)
      {
        uint64_t v52 = (uint64_t)(v49 - (void)*v130) >> 4;
        unint64_t v53 = v52 + 1;
        if ((unint64_t)(v52 + 1) >> 60) {
LABEL_109:
        }
          abort();
        uint64_t v54 = v50 - (void)*v130;
        if (v54 >> 3 > v53) {
          unint64_t v53 = v54 >> 3;
        }
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v55 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v55 = v53;
        }
        uint64_t v56 = (char *)sub_1B6427C8C(a1 + 88, v55);
        uint64_t v58 = &v56[16 * v52];
        *(_DWORD *)uint64_t v58 = v48;
        *((_DWORD *)v58 + 1) = v140;
        *((void *)v58 + 1) = 0;
        uint64_t v47 = a1;
        int v60 = *(char **)(a1 + 72);
        unint64_t v59 = *(char **)(a1 + 80);
        unint64_t v61 = v58;
        if (v59 != v60)
        {
          do
          {
            int v62 = *((_DWORD *)v59 - 4);
            v59 -= 16;
            *((_DWORD *)v61 - 4) = v62;
            v61 -= 16;
            uint64_t v63 = *(void *)(v59 + 4);
            *((_DWORD *)v61 + 3) = *((_DWORD *)v59 + 3);
            *(void *)(v61 + 4) = v63;
          }
          while (v59 != v60);
          unint64_t v59 = *v130;
        }
        int v51 = v58 + 16;
        *(void *)(a1 + 72) = v61;
        *(void *)(a1 + 80) = v58 + 16;
        *(void *)(a1 + 88) = &v56[16 * v57];
        if (v59)
        {
          operator delete(v59);
          uint64_t v47 = a1;
        }
      }
      else
      {
        *(_DWORD *)unint64_t v49 = v142;
        *(_DWORD *)(v49 + 4) = v140;
        int v51 = (char *)(v49 + 16);
        *(void *)(v49 + 8) = 0;
      }
      *(void *)(v47 + 80) = v51;
      uint64_t v64 = v47;
      uint64_t v65 = (char *)sub_1B6E16EA8((uint64_t)v2, v32);
      sub_1B6E16470((uint64_t)v132, *(void *)(v64 + 104), v65, &v65[4 * v66], v66);
      if ((int)sub_1B6E170F8((uint64_t)v2) >= 1)
      {
        uint64_t v67 = 0;
        do
        {
          sub_1B6E17114((uint64_t)v2, v67, &v141);
          int v68 = v141;
          unint64_t v69 = (char **)(*v137 + 24 * v67);
          v71 = v69 + 1;
          unint64_t v70 = (unint64_t)v69[1];
          BOOL v73 = v69 + 2;
          unint64_t v72 = (unint64_t)v69[2];
          if (v70 >= v72)
          {
            uint64_t v76 = (uint64_t)(v70 - (void)*v69) >> 4;
            unint64_t v77 = v76 + 1;
            if ((unint64_t)(v76 + 1) >> 60) {
              goto LABEL_109;
            }
            uint64_t v78 = v72 - (void)*v69;
            if (v78 >> 3 > v77) {
              unint64_t v77 = v78 >> 3;
            }
            if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v79 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v79 = v77;
            }
            int v80 = (char *)sub_1B6427C8C((uint64_t)v73, v79);
            v82 = &v80[16 * v76];
            *(_DWORD *)v82 = v68;
            *((_DWORD *)v82 + 1) = v140;
            *((void *)v82 + 1) = 0;
            int v83 = *v71;
            uint64_t v84 = *v69;
            int v85 = v82;
            if (*v71 != *v69)
            {
              do
              {
                int v86 = *((_DWORD *)v83 - 4);
                v83 -= 16;
                *((_DWORD *)v85 - 4) = v86;
                v85 -= 16;
                uint64_t v87 = *(void *)(v83 + 4);
                *((_DWORD *)v85 + 3) = *((_DWORD *)v83 + 3);
                *(void *)(v85 + 4) = v87;
              }
              while (v83 != v84);
              int v83 = *v69;
            }
            *unint64_t v69 = v85;
            int v75 = v82 + 16;
            void *v71 = v82 + 16;
            void *v73 = &v80[16 * v81];
            if (v83) {
              operator delete(v83);
            }
            int v74 = v140;
          }
          else
          {
            *(_DWORD *)unint64_t v70 = v141;
            int v74 = v140;
            *(_DWORD *)(v70 + 4) = v140;
            int v75 = (char *)(v70 + 16);
            *(void *)(v70 + 8) = 0;
          }
          void *v71 = v75;
          v88 = (char *)sub_1B6E17148((uint64_t)v2, v138, v67);
          sub_1B6E16470(*v136 + 24 * v67, *(void *)(*v136 + 24 * v67 + 8), v88, &v88[4 * v89], v89);
          uint64_t v90 = sub_1B6E171AC((uint64_t)v2, v138, v67);
          if (v74 >= 1)
          {
            uint64_t v91 = v90;
            uint64_t v92 = 0;
            do
            {
              uint64_t v93 = *(void *)(v91 + 8 * v92);
              unint64_t v94 = (char **)(*v10 + 24 * v67);
              unint64_t v96 = v94 + 1;
              unint64_t v95 = (unint64_t)v94[1];
              v98 = v94 + 2;
              unint64_t v97 = (unint64_t)v94[2];
              if (v95 >= v97)
              {
                unint64_t v100 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v95 - (void)*v94) >> 2);
                unint64_t v101 = v100 + 1;
                if (v100 + 1 > 0x1555555555555555) {
                  goto LABEL_109;
                }
                unint64_t v102 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v97 - (void)*v94) >> 2);
                if (2 * v102 > v101) {
                  unint64_t v101 = 2 * v102;
                }
                if (v102 >= 0xAAAAAAAAAAAAAAALL) {
                  unint64_t v103 = 0x1555555555555555;
                }
                else {
                  unint64_t v103 = v101;
                }
                if (v103) {
                  uint64_t v104 = (char *)sub_1B6560D34((uint64_t)v98, v103);
                }
                else {
                  uint64_t v104 = 0;
                }
                uint64_t v105 = &v104[12 * v100];
                *(void *)uint64_t v105 = v93;
                *((_DWORD *)v105 + 2) = 0;
                v106 = *v96;
                int v107 = *v94;
                int v108 = v105;
                if (*v96 != *v94)
                {
                  do
                  {
                    uint64_t v109 = *(void *)(v106 - 12);
                    v106 -= 12;
                    int v110 = *((_DWORD *)v106 + 2);
                    *(void *)(v108 - 12) = v109;
                    v108 -= 12;
                    *((_DWORD *)v108 + 2) = v110;
                  }
                  while (v106 != v107);
                  v106 = *v94;
                }
                *unint64_t v94 = v108;
                int v99 = v105 + 12;
                *unint64_t v96 = v105 + 12;
                void *v98 = &v104[12 * v103];
                if (v106) {
                  operator delete(v106);
                }
              }
              else
              {
                *(void *)unint64_t v95 = v93;
                *(_DWORD *)(v95 + 8) = 0;
                int v99 = (char *)(v95 + 12);
              }
              *unint64_t v96 = v99;
              ++v92;
            }
            while (v92 != v140);
          }
          ++v67;
          unint64_t v2 = (void *)v135;
        }
        while (v67 < (int)sub_1B6E170F8(v135));
      }
      int v111 = sub_1B6E16D78((uint64_t)v2, v138);
      unint64_t v112 = (void *)(a1 + 64);
      int v21 = (void *)a1;
      if (v111 >= 1)
      {
        int v113 = 0;
        unint64_t v114 = *(char **)(a1 + 56);
        do
        {
          unint64_t v115 = 0xAAAAAAAAAAAAAAABLL * ((v114 - *v139) >> 2);
          uint64_t v116 = v2[28];
          int v117 = 0;
          if ((int)v115 < (int)((unint64_t)(v2[29] - v116) >> 2))
          {
            uint64_t v118 = *(unsigned int *)(v116 + 4 * (int)v115);
            if ((v118 & 0x80000000) == 0) {
              int v117 = *(_DWORD *)(v2[31] + 4 * v118);
            }
          }
          uint64_t v119 = *(void *)(v2[7] + 8 * (int)v115);
          if ((unint64_t)v114 >= *v112)
          {
            if (v115 + 1 > 0x1555555555555555) {
              goto LABEL_109;
            }
            unint64_t v120 = 0x5555555555555556 * ((uint64_t)(*v112 - (void)*v139) >> 2);
            if (v120 <= v115 + 1) {
              unint64_t v120 = v115 + 1;
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v112 - (void)*v139) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
              unint64_t v121 = 0x1555555555555555;
            }
            else {
              unint64_t v121 = v120;
            }
            if (v121)
            {
              uint64_t v122 = (char *)sub_1B6560D34((uint64_t)v112, v121);
              int v21 = (void *)a1;
            }
            else
            {
              uint64_t v122 = 0;
            }
            v123 = &v122[12 * v115];
            *(void *)v123 = v119;
            *((_DWORD *)v123 + 2) = v117;
            unint64_t v125 = (char *)v21[6];
            v124 = (char *)v21[7];
            int v126 = v123;
            if (v124 != v125)
            {
              do
              {
                uint64_t v127 = *(void *)(v124 - 12);
                v124 -= 12;
                int v128 = *((_DWORD *)v124 + 2);
                *(void *)(v126 - 12) = v127;
                v126 -= 12;
                *((_DWORD *)v126 + 2) = v128;
              }
              while (v124 != v125);
              v124 = *v139;
            }
            unint64_t v114 = v123 + 12;
            v21[6] = v126;
            v21[7] = v123 + 12;
            v21[8] = &v122[12 * v121];
            if (v124)
            {
              operator delete(v124);
              int v21 = (void *)a1;
            }
            unint64_t v112 = (void *)(a1 + 64);
          }
          else
          {
            *(void *)unint64_t v114 = v119;
            *((_DWORD *)v114 + 2) = v117;
            v114 += 12;
          }
          v21[7] = v114;
          ++v113;
        }
        while (v113 != v111);
      }
      int v22 = v138 + 1;
    }
    while (v138 + 1 != v131);
  }
  return v21;
}

void sub_1B6E1638C(char **a1, unint64_t a2)
{
  int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 2) < a2)
  {
    if (a2 >= 0x1555555555555556) {
      abort();
    }
    uint64_t v5 = (a1[1] - *a1) / 12;
    uint64_t v6 = (char *)sub_1B6560D34(v3, a2);
    int v7 = &v6[12 * v5];
    unint64_t v9 = &v6[12 * v8];
    unint64_t v11 = *a1;
    uint64_t v10 = a1[1];
    int v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *(void *)(v10 - 12);
        v10 -= 12;
        int v14 = *((_DWORD *)v10 + 2);
        *(void *)(v12 - 12) = v13;
        v12 -= 12;
        *((_DWORD *)v12 + 2) = v14;
      }
      while (v10 != v11);
      uint64_t v10 = *a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

char *sub_1B6E16470(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  int v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 2)
  {
    uint64_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 2);
    if (v14 >> 62) {
      abort();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 2;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 1 > v14) {
      unint64_t v14 = v16 >> 1;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      uint64_t v18 = (char *)sub_1B64282E0(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    int v28 = &v18[4 * v15];
    __p = v18;
    unint64_t v34 = v28;
    unint64_t v36 = &v18[4 * v17];
    uint64_t v29 = 4 * a5;
    unint64_t v30 = &v28[4 * a5];
    do
    {
      int v31 = *(_DWORD *)v7;
      v7 += 4;
      *(_DWORD *)int v28 = v31;
      v28 += 4;
      v29 -= 4;
    }
    while (v29);
    uint64_t v35 = v30;
    uint64_t v5 = sub_1B6E16644((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 2;
  if (v20 >= a5)
  {
    int v21 = &__src[4 * a5];
    int v23 = *(char **)(v9 - 8);
LABEL_17:
    uint64_t v24 = &v5[4 * a5];
    int v25 = &v23[-4 * a5];
    uint64_t v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      uint64_t v26 = v23;
      do
      {
        int v27 = *(_DWORD *)v25;
        v25 += 4;
        *(_DWORD *)uint64_t v26 = v27;
        v26 += 4;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-4 * ((v23 - v24) >> 2)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  int v21 = &__src[4 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[4 * v20], a4 - v21);
  }
  int v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

char *sub_1B6E16644(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(char **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  int v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    int v7 = *(char **)(a2 + 8);
    do
    {
      int v9 = *((_DWORD *)v8 - 1);
      v8 -= 4;
      *((_DWORD *)v7 - 1) = v9;
      v7 -= 4;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    int v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  uint64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

double sub_1B6E1670C(uint64_t a1, int a2)
{
  *(_DWORD *)a1 = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(void *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 144) = 3;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(void *)(a1 + 264) = 0;
  return result;
}

uint64_t sub_1B6E16764(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *(void *)(a1 + 136);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v5 = *(void *)(a1 + 200);
  uint64_t v4 = *(void *)(a1 + 208);
  if ((int)((unint64_t)(v4 - v5) >> 3) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)(v5 + 8 * v6);
      if (v7)
      {
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
        uint64_t v5 = *(void *)(a1 + 200);
        uint64_t v4 = *(void *)(a1 + 208);
      }
      ++v6;
    }
    while (v6 < (int)((unint64_t)(v4 - v5) >> 3));
  }
  uint64_t v8 = *(void **)(a1 + 248);
  if (v8)
  {
    *(void *)(a1 + 256) = v8;
    operator delete(v8);
  }
  int v9 = *(void **)(a1 + 224);
  if (v9)
  {
    *(void *)(a1 + 232) = v9;
    operator delete(v9);
  }
  uint64_t v10 = *(void **)(a1 + 200);
  if (v10)
  {
    *(void *)(a1 + 208) = v10;
    operator delete(v10);
  }
  uint64_t v18 = (void **)(a1 + 176);
  sub_1B6E171F4(&v18);
  uint64_t v11 = *(void **)(a1 + 152);
  if (v11)
  {
    *(void *)(a1 + 160) = v11;
    operator delete(v11);
  }
  int64_t v12 = *(void **)(a1 + 104);
  if (v12)
  {
    *(void *)(a1 + 112) = v12;
    operator delete(v12);
  }
  uint64_t v13 = *(void **)(a1 + 80);
  if (v13)
  {
    *(void *)(a1 + 88) = v13;
    operator delete(v13);
  }
  unint64_t v14 = *(void **)(a1 + 56);
  if (v14)
  {
    *(void *)(a1 + 64) = v14;
    operator delete(v14);
  }
  uint64_t v15 = *(void **)(a1 + 32);
  if (v15)
  {
    *(void *)(a1 + 40) = v15;
    operator delete(v15);
  }
  uint64_t v16 = *(void **)(a1 + 8);
  if (v16)
  {
    *(void *)(a1 + 16) = v16;
    operator delete(v16);
  }
  return a1;
}

void sub_1B6E168E8(uint64_t a1, int a2)
{
}

void sub_1B6E168F4(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - *a1) >> 2) < a2)
  {
    if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
      abort();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v6 = (char *)sub_1B6E172E4(v3, a2);
    uint64_t v7 = &v6[v5];
    int v9 = &v6[20 * v8];
    uint64_t v11 = *a1;
    uint64_t v10 = a1[1];
    int64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        int v13 = *((_DWORD *)v10 - 5);
        v10 -= 20;
        *((_DWORD *)v12 - 5) = v13;
        v12 -= 20;
        *(_OWORD *)(v12 + 4) = *(_OWORD *)(v10 + 4);
      }
      while (v10 != v11);
      uint64_t v10 = *a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_1B6E169BC(uint64_t a1, _DWORD *a2, int a3)
{
  *(_DWORD *)(a1 + 144) = *a2;
  unsigned int v3 = *a2 - 1;
  if (v3 > 8) {
    int v4 = -1;
  }
  else {
    int v4 = dword_1B6ED0888[v3];
  }
  sub_1B642863C(a1 + 152, v4 * a3);
}

void sub_1B6E169F8(uint64_t a1, int a2)
{
}

void sub_1B6E16A04(uint64_t *a1, unint64_t a2)
{
  unsigned int v3 = (void *)a1[1];
  unint64_t v4 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_1B6E1732C(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 56 * a2;
    while (v3 != (void *)v7)
    {
      v3 -= 7;
      sub_1B6E1728C((uint64_t)(a1 + 2), v3);
    }
    a1[1] = v7;
  }
}

void sub_1B6E16AB0(uint64_t a1, _DWORD *a2, int a3, int a4)
{
  uint64_t v5 = *(void *)(a1 + 176);
  *(_DWORD *)(v5 + 56 * a4 + 4) = *a2;
  unsigned int v6 = *a2 - 1;
  if (v6 > 8) {
    int v7 = -1;
  }
  else {
    int v7 = dword_1B6ED0888[v6];
  }
  uint64_t v8 = v5 + 56 * a4;
  sub_1B642863C(v8 + 8, v7 * a3);

  sub_1B6428494(v8 + 32, a3);
}

uint64_t sub_1B6E16B3C(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(*(void *)(result + 176) + 56 * a3) = a2;
  return result;
}

void sub_1B6E16B50(void *a1, int *a2, int a3, int *a4, int *a5, int *a6)
{
  if (a3 >= 1)
  {
    if (a6) {
      int v12 = *a6;
    }
    else {
      int v12 = 0;
    }
    int v13 = *a2;
    int v14 = *a4;
    int v15 = *a5;
    uint64_t v16 = (uint64_t)(a1 + 3);
    unint64_t v17 = a1[3];
    uint64_t v18 = (_DWORD *)a1[2];
    if ((unint64_t)v18 >= v17)
    {
      int v35 = v12;
      uint64_t v20 = a1[1];
      unint64_t v21 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v18 - v20) >> 2);
      unint64_t v22 = v21 + 1;
      if (v21 + 1 > 0xCCCCCCCCCCCCCCCLL) {
        abort();
      }
      unint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v17 - v20) >> 2);
      if (2 * v23 > v22) {
        unint64_t v22 = 2 * v23;
      }
      if (v23 >= 0x666666666666666) {
        unint64_t v24 = 0xCCCCCCCCCCCCCCCLL;
      }
      else {
        unint64_t v24 = v22;
      }
      int v25 = (char *)sub_1B6E172E4(v16, v24);
      uint64_t v26 = &v25[20 * v21];
      int v28 = &v25[20 * v27];
      *(_DWORD *)uint64_t v26 = v13;
      *((_DWORD *)v26 + 1) = a3;
      *((_DWORD *)v26 + 2) = v14;
      *((_DWORD *)v26 + 3) = v15;
      *((_DWORD *)v26 + 4) = v35;
      uint64_t v19 = v26 + 20;
      uint64_t v30 = a1[1];
      uint64_t v29 = a1[2];
      if (v29 != v30)
      {
        do
        {
          int v31 = *(_DWORD *)(v29 - 20);
          v29 -= 20;
          *((_DWORD *)v26 - 5) = v31;
          v26 -= 20;
          *(_OWORD *)(v26 + 4) = *(_OWORD *)(v29 + 4);
        }
        while (v29 != v30);
        uint64_t v29 = a1[1];
      }
      a1[1] = v26;
      a1[2] = v19;
      a1[3] = v28;
      if (v29) {
        operator delete((void *)v29);
      }
    }
    else
    {
      *uint64_t v18 = v13;
      v18[1] = a3;
      v18[2] = v14;
      v18[3] = v15;
      uint64_t v19 = v18 + 5;
      v18[4] = v12;
    }
    a1[2] = v19;
    unsigned int v32 = *a2 - 1;
    if (v32 > 8) {
      int v33 = -1;
    }
    else {
      int v33 = dword_1B6ED0888[v32];
    }
    int v34 = v33 * a3;
    *a4 += v34;
    *a5 += a3;
    if (a6)
    {
      if (*a2 != 7) {
        int v34 = 0;
      }
      *a6 += v34;
    }
  }
}

uint64_t sub_1B6E16D10(uint64_t a1, int a2, int a3)
{
  return (*(_DWORD *)(*(void *)(a1 + 8) + 20 * a2 + 12) + a3);
}

uint64_t sub_1B6E16D28(uint64_t a1, int a2)
{
  return *(void *)(a1 + 224) + 4 * *(int *)(*(void *)(a1 + 8) + 20 * a2 + 12);
}

uint64_t sub_1B6E16D44@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = *(_DWORD *)(*(void *)(result + 8) + 20 * a2);
  return result;
}

uint64_t sub_1B6E16D5C(uint64_t a1)
{
  return -858993459 * ((*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 2);
}

uint64_t sub_1B6E16D78(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(void *)(a1 + 8) + 20 * a2 + 4);
}

uint64_t sub_1B6E16D8C(uint64_t a1)
{
  return (*(void *)(a1 + 64) - *(void *)(a1 + 56)) >> 3;
}

uint64_t sub_1B6E16D9C(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) + 20 * a2) - 1;
  if (v2 > 8) {
    int v3 = -1;
  }
  else {
    int v3 = dword_1B6ED0888[v2];
  }
  return (v3 * *(_DWORD *)(*(void *)(a1 + 8) + 20 * a2 + 4));
}

uint64_t sub_1B6E16DD4(uint64_t a1, int a2)
{
  return *(void *)(a1 + 32) + 4 * *(int *)(*(void *)(a1 + 8) + 20 * a2 + 8);
}

uint64_t sub_1B6E16E28(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  unsigned int v4 = *(_DWORD *)(v3 + 20 * a2) - 1;
  if (v4 > 8) {
    int v5 = -1;
  }
  else {
    int v5 = dword_1B6ED0888[v4];
  }
  return *(void *)(a1 + 32) + 4 * (*(_DWORD *)(v3 + 20 * a2 + 8) + v5 * a3);
}

uint64_t sub_1B6E16E7C(uint64_t a1, int a2)
{
  return *(void *)(a1 + 56) + 8 * *(int *)(*(void *)(a1 + 8) + 20 * a2 + 12);
}

uint64_t sub_1B6E16E9C@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(result + 144);
  return result;
}

uint64_t sub_1B6E16EA8(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 152);
  if (v2 == *(void *)(a1 + 160)) {
    return 0;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 144) - 1;
  if (v3 > 8) {
    int v4 = -1;
  }
  else {
    int v4 = dword_1B6ED0888[v3];
  }
  return v2 + 4 * *(_DWORD *)(*(void *)(a1 + 8) + 20 * a2 + 12) * v4;
}

uint64_t sub_1B6E16F0C(uint64_t result)
{
  uint64_t v1 = result;
  unsigned int v2 = *(_DWORD *)(result + 144) - 1;
  if (v2 > 8) {
    int v3 = -1;
  }
  else {
    int v3 = dword_1B6ED0888[v2];
  }
  uint64_t v4 = *(void *)(result + 8);
  if ((int)(-858993459 * ((*(void *)(result + 16) - v4) >> 2)) >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = -858993459 * ((*(void *)(result + 16) - v4) >> 2);
    do
    {
      uint64_t v7 = v4 + 20 * v5;
      int v9 = *(_DWORD *)(v7 + 4);
      uint64_t v8 = (int *)(v7 + 4);
      if (v9 >= 1)
      {
        int v10 = 0;
        int v11 = *(_DWORD *)(v4 + 20 * v5);
        do
        {
          double result = sub_1B6E16E28(v1, v5, v10);
          uint64_t v12 = (v10 + *(_DWORD *)(v4 + 20 * v5 + 12)) * (uint64_t)v3;
          switch(v11)
          {
            case 3:
              uint64_t v13 = *(void *)(v1 + 152);
              int v14 = (_DWORD *)(v13 + 4 * (int)v12);
              *int v14 = *(_DWORD *)result;
              v14[1] = *(_DWORD *)(result + 4);
              uint64_t v15 = 3;
              uint64_t v16 = 2;
              int v17 = 2;
              int v18 = 3;
              goto LABEL_13;
            case 4:
              uint64_t v13 = *(void *)(v1 + 152);
              *(_DWORD *)(v13 + 4 * (int)v12) = *(_DWORD *)result;
              uint64_t v15 = 2;
              uint64_t v16 = 1;
              int v17 = 1;
              int v18 = 2;
              goto LABEL_13;
            case 6:
              uint64_t v13 = *(void *)(v1 + 152);
              uint64_t v19 = (_DWORD *)(v13 + 4 * (int)v12);
              _DWORD *v19 = *(_DWORD *)(result + 20);
              v19[1] = *(_DWORD *)(result + 24);
              int v18 = 3;
              int v17 = 2;
              uint64_t v16 = 10;
              uint64_t v15 = 9;
              goto LABEL_13;
            case 9:
              uint64_t v13 = *(void *)(v1 + 152);
              uint64_t v20 = (_DWORD *)(v13 + 4 * v12);
              *uint64_t v20 = *(_DWORD *)result;
              v20[1] = *(_DWORD *)(result + 20);
              int v18 = 3;
              int v17 = 2;
              uint64_t v16 = 10;
              uint64_t v15 = 15;
LABEL_13:
              *(_DWORD *)(v13 + 4 * ((int)v12 + v17)) = *(_DWORD *)(result + 4 * v16);
              *(_DWORD *)(v13 + 4 * ((int)v12 + v18)) = *(_DWORD *)(result + 4 * v15);
              break;
            default:
              break;
          }
          ++v10;
        }
        while (v10 < *v8);
      }
      ++v5;
    }
    while (v5 != v6);
  }
  return result;
}

uint64_t sub_1B6E170F8(uint64_t a1)
{
  return -1227133513 * ((*(void *)(a1 + 184) - *(void *)(a1 + 176)) >> 3);
}

uint64_t sub_1B6E17114@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = *(_DWORD *)(*(void *)(result + 176) + 56 * a2 + 4);
  return result;
}

uint64_t sub_1B6E1712C(uint64_t a1, int a2)
{
  return *(void *)(*(void *)(a1 + 176) + 56 * a2 + 8);
}

uint64_t sub_1B6E17148(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 176);
  unsigned int v4 = *(_DWORD *)(v3 + 56 * a3 + 4) - 1;
  if (v4 > 8) {
    int v5 = -1;
  }
  else {
    int v5 = dword_1B6ED0888[v4];
  }
  return *(void *)(v3 + 56 * a3 + 8) + 4 * *(_DWORD *)(*(void *)(a1 + 8) + 20 * a2 + 12) * v5;
}

uint64_t sub_1B6E171AC(uint64_t a1, int a2, int a3)
{
  return *(void *)(*(void *)(a1 + 176) + 56 * a3 + 32) + 8 * *(int *)(*(void *)(a1 + 8) + 20 * a2 + 12);
}

uint64_t sub_1B6E171D8(uint64_t a1, int a2)
{
  return *(void *)(*(void *)(a1 + 176) + 56 * a2 + 32);
}

void sub_1B6E171F4(void ***a1)
{
  uint64_t v1 = *a1;
  unsigned int v2 = **a1;
  if (v2)
  {
    unsigned int v4 = v1[1];
    int v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 7;
        sub_1B6E1728C((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1B6E1728C(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[4];
  if (v3)
  {
    a2[5] = v3;
    operator delete(v3);
  }
  unsigned int v4 = (void *)a2[1];
  if (v4)
  {
    a2[2] = v4;
    operator delete(v4);
  }
}

void *sub_1B6E172E4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
    sub_1B63C8620();
  }
  return operator new(20 * a2);
}

void sub_1B6E1732C(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 56 * ((56 * a2 - 56) / 0x38) + 56;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x492492492492492) {
      abort();
    }
    unint64_t v10 = 0x6DB6DB6DB6DB6DB7 * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x249249249249249) {
      unint64_t v11 = 0x492492492492492;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      uint64_t v12 = (char *)sub_1B65A7710(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v15 = v12;
    uint64_t v16 = &v12[56 * v8];
    int v18 = &v12[56 * v11];
    size_t v14 = 56 * ((56 * a2 - 56) / 0x38) + 56;
    bzero(v16, v14);
    int v17 = &v16[v14];
    sub_1B6E174BC(a1, &v15);
    sub_1B6E175B0(&v15);
  }
}

void sub_1B6E174BC(uint64_t *a1, void *a2)
{
  sub_1B6E17534((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

__n128 sub_1B6E17534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      *(void *)(v8 - 56) = *(void *)(a3 + v7 - 56);
      *(void *)(v8 - 40) = 0;
      *(void *)(v8 - 32) = 0;
      *(void *)(v8 - 48) = 0;
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(a3 + v7 - 48);
      *(void *)(v8 - 32) = *(void *)(a3 + v7 - 32);
      *(void *)(v9 - 48) = 0;
      *(void *)(v9 - 40) = 0;
      *(void *)(v9 - 32) = 0;
      *(void *)(v8 - 24) = 0;
      *(void *)(v8 - 16) = 0;
      *(void *)(v8 - 8) = 0;
      __n128 result = *(__n128 *)(a3 + v7 - 24);
      *(__n128 *)(v8 - 24) = result;
      *(void *)(v8 - 8) = *(void *)(a3 + v7 - 8);
      *(void *)(v9 - 24) = 0;
      *(void *)(v9 - 16) = 0;
      *(void *)(v9 - 8) = 0;
      v7 -= 56;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void **sub_1B6E175B0(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1B6E175E4(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 56;
    sub_1B6E1728C(v4, (void *)(i - 56));
  }
}

uint64_t sub_1B6E1762C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(uint64_t **)(a1 + 40);
  uint64_t v9 = (int *)*v8;
  int v10 = *(_DWORD *)(*v8 + 8);
  if (!v10)
  {
    uint64_t v12 = "Failure in TopologyRefinerFactory<>::Create() -- mesh contains no vertices.";
LABEL_12:
    sub_1B6E240DC(4, (uint64_t)v12, a3, a4, a5, a6, a7, a8, v25);
    return 0;
  }
  int v11 = *v9;
  if (!*v9)
  {
    uint64_t v12 = "Failure in TopologyRefinerFactory<>::Create() -- meshes without faces not yet supported.";
    goto LABEL_12;
  }
  if (v9[5] >= 0x10000)
  {
    sub_1B6E240DC(4, (uint64_t)"Failure in TopologyRefinerFactory<>::Create() -- face with %d vertices > %d max.", a3, a4, a5, a6, a7, a8, v9[5]);
    return 0;
  }
  size_t v13 = (int *)(*((void *)v9 + 3) + 4 * (2 * v11 - 2));
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  unint64_t v16 = v14 + v15;
  if (!(v14 + v15))
  {
    uint64_t v12 = "Failure in TopologyRefinerFactory<>::Create() -- mesh contains no face-vertices.";
    goto LABEL_12;
  }
  if (*(_DWORD *)a1 == 2 && v16 != 3 * v11)
  {
    uint64_t v12 = "Failure in TopologyRefinerFactory<>::Create() -- non-triangular faces not supported by Loop scheme.";
    goto LABEL_12;
  }
  sub_1B642863C((uint64_t)(v9 + 12), v16);
  int v18 = v9[1];
  if (v18 >= 1)
  {
    sub_1B642863C((uint64_t)(v9 + 18), (int)((uint64_t)(*((void *)v9 + 7) - *((void *)v9 + 6)) >> 2));
    sub_1B642863C((uint64_t)(v9 + 30), 2 * v9[1]);
    uint64_t v19 = (int *)(*((void *)v9 + 18) + 4 * (2 * v18 - 2));
    unint64_t v20 = v19[1] + (uint64_t)*v19;
    sub_1B642863C((uint64_t)(v9 + 42), v20);
    sub_1B6459120((uint64_t)(v9 + 48), v20);
    int v21 = 2 * v10 - 2;
    unint64_t v22 = (8 * ((unint64_t)v21 >> 1)) | 4;
    unint64_t v23 = *(int *)(*((void *)v9 + 33) + v22) + (uint64_t)*(int *)(*((void *)v9 + 33) + 4 * v21);
    sub_1B642863C((uint64_t)(v9 + 72), v23);
    sub_1B6459120((uint64_t)(v9 + 78), v23);
    unint64_t v24 = *(int *)(*((void *)v9 + 42) + v22) + (uint64_t)*(int *)(*((void *)v9 + 42) + 4 * v21);
    sub_1B642863C((uint64_t)(v9 + 90), v24);
    sub_1B6459120((uint64_t)(v9 + 96), v24);
  }
  return 1;
}

uint64_t sub_1B6E177D4(uint64_t a1, int a2, void (*a3)(uint64_t, char *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(int ***)(a1 + 40);
  size_t v13 = (unsigned int *)*v12;
  int v14 = (*v12)[1];
  if (v14)
  {
    if (!v13[5])
    {
      uint64_t v15 = "Failure in TopologyRefinerFactory<>::Create() -- maximum valence not assigned.";
LABEL_12:
      sub_1B6E240DC(4, (uint64_t)v15, (uint64_t)a3, a4, a5, a6, a7, a8, v23);
      return 0;
    }
LABEL_5:
    if (!a2 || sub_1B6E18C6C(v13, a3, a4))
    {
      sub_1B6E2B59C(a1);
      return 1;
    }
    if (v14) {
      uint64_t v15 = "Failure in TopologyRefinerFactory<>::Create() -- invalid topology detected as fully specified.";
    }
    else {
      uint64_t v15 = "Failure in TopologyRefinerFactory<>::Create() -- invalid topology detected from partial specification.";
    }
    goto LABEL_12;
  }
  if (sub_1B6E1A564(*v12)) {
    goto LABEL_5;
  }
  sub_1B6E240DC(4, (uint64_t)"Failure in TopologyRefinerFactory<>::Create() -- vertex with valence %d > %d max.", v16, v17, v18, v19, v20, v21, v13[5]);
  return 0;
}

uint64_t sub_1B6E178AC(uint64_t a1)
{
  uint64_t v2 = **(void **)(a1 + 40);
  int v64 = *(_DWORD *)(a1 + 4);
  int v57 = v64 & 3;
  BOOL v61 = (v64 & 3) == 0 && (int)sub_1B6E11108(*(_DWORD *)a1) > 0;
  if (*(int *)(v2 + 4) >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(v2 + 240);
      uint64_t v6 = *(void *)(v2 + 216);
      BOOL v7 = *(_DWORD *)(*(void *)(v2 + 144) + v3) < 2;
      char v8 = *(unsigned char *)(v5 + v4);
      char v9 = v8 & 0xFD | (2 * v7);
      *(unsigned char *)(v5 + v4) = v9;
      int v10 = v8 & 1;
      if (!v7 && v10 == 0)
      {
        float v12 = *(float *)(v6 + 4 * v4);
      }
      else
      {
        *(_DWORD *)(v6 + 4 * v4) = 1092616192;
        char v9 = *(unsigned char *)(v5 + v4);
        float v12 = 10.0;
      }
      char v13 = v9 & 0xFB | (4 * (v12 >= 10.0));
      *(unsigned char *)(v5 + v4) = v13;
      if (v12 < 10.0 && *(float *)(v6 + 4 * v4) > 0.0) {
        char v15 = 8;
      }
      else {
        char v15 = 0;
      }
      *(unsigned char *)(v5 + v4++) = v15 | v13 & 0xF7;
      v3 += 8;
    }
    while (v4 < *(int *)(v2 + 4));
  }
  int v16 = sub_1B6E110D0(*(_DWORD *)a1);
  if (v16 >= 0) {
    int v17 = v16;
  }
  else {
    int v17 = v16 + 1;
  }
  if (*(int *)(v2 + 8) >= 1)
  {
    uint64_t v18 = 0;
    int v59 = v17 >> 1;
    int v60 = v16;
    while (1)
    {
      uint64_t v19 = *(void *)(v2 + 336);
      uint64_t v20 = (8 * v18) | 4;
      uint64_t v21 = (int *)(*(void *)(v2 + 360) + 4 * *(int *)(v19 + v20));
      uint64_t v22 = *(unsigned int *)(v19 + 8 * v18);
      uint64_t v58 = v21;
      if ((int)v22 < 1)
      {
        int v26 = 0;
        int v25 = 0;
        int v24 = 0;
        int v23 = 0;
      }
      else
      {
        int v23 = 0;
        int v24 = 0;
        int v25 = 0;
        int v26 = 0;
        uint64_t v27 = v22;
        do
        {
          uint64_t v28 = *v21++;
          unsigned int v29 = *(unsigned __int8 *)(*(void *)(v2 + 240) + v28);
          v26 += (v29 >> 1) & 1;
          v25 += (v29 >> 2) & 1;
          v24 += (v29 >> 3) & 1;
          v23 += v29 & 1;
          --v27;
        }
        while (v27);
      }
      uint64_t v30 = *(void *)(v2 + 432);
      uint64_t v31 = *(void *)(v2 + 408);
      uint64_t v32 = *(void *)(v2 + 264);
      uint64_t v33 = *(unsigned int *)(v32 + 8 * v18);
      uint64_t v62 = *(int *)(v32 + v20);
      uint64_t v63 = *(void *)(v2 + 288);
      if (v33 != 1) {
        break;
      }
      BOOL v34 = v22 == 2;
      if (v57 != 2 || v22 != 2) {
        goto LABEL_34;
      }
      BOOL v34 = 1;
LABEL_38:
      *(_DWORD *)(v31 + 4 * v18) = 1092616192;
LABEL_39:
      __int16 v35 = *(_WORD *)(v30 + 2 * v18) & 0xFFEF | (16 * (*(float *)(v31 + 4 * v18) >= 10.0));
      *(_WORD *)(v30 + 2 * v18) = v35;
      float v36 = *(float *)(v31 + 4 * v18);
      if (v36 < 10.0 && v36 > 0.0) {
        __int16 v38 = 32;
      }
      else {
        __int16 v38 = 0;
      }
      *(_WORD *)(v30 + 2 * v18) = v35 & 0xFF9F | ((v24 != 0) << 6) | v38;
      char v39 = sub_1B6E18700(*(float *)(v31 + 4 * v18), (uint64_t)&v64, v24 + v25);
      __int16 v40 = *(_WORD *)(v30 + 2 * v18);
      __int16 v41 = v40 & 0xF871;
      int v42 = *(_DWORD *)&v34 & ((v40 & 0x10) >> 4);
      if (v42) {
        __int16 v43 = 8;
      }
      else {
        __int16 v43 = 0;
      }
      __int16 v44 = (v41 | (4 * (v26 != 0))) & 0xF87F | ((v39 & 0xF) << 7) | v43;
      __int16 v45 = v44 | (2 * (v33 != v60));
      if (v26) {
        __int16 v45 = v44 | (2 * (v33 != v59));
      }
      if (v42) {
        __int16 v46 = v44;
      }
      else {
        __int16 v46 = v45;
      }
      *(_WORD *)(v30 + 2 * v18) = v46 & 0x87FF | ((v25 != 0) << 12) | (((v25 | v46 & 0x10) != 0) << 14);
      if (!v25) {
        goto LABEL_68;
      }
      float v47 = *(float *)(v31 + 4 * v18);
      if ((v46 & 0x10) == 0) {
        float v47 = 0.0;
      }
      int v48 = sub_1B6E18700(v47, (uint64_t)&v64, v25);
      if (v48 == 8)
      {
        if (v25 != v22) {
          goto LABEL_68;
        }
        __int16 v50 = *(_WORD *)(v30 + 2 * v18);
        if ((int)v22 <= 2 && (v50 & 0x10) == 0) {
          goto LABEL_68;
        }
LABEL_66:
        LOWORD(v51) = v50 & 0xBFFF;
        goto LABEL_67;
      }
      if (v48 != 4) {
        goto LABEL_68;
      }
      int v49 = *(unsigned __int16 *)(v30 + 2 * v18);
      __int16 v50 = v49 | 0x2000;
      *(_WORD *)(v30 + 2 * v18) = v49 | 0x2000;
      if ((v49 & 3) != 0) {
        goto LABEL_68;
      }
      if ((v49 & 4) != 0) {
        goto LABEL_66;
      }
      if (v60 == 6)
      {
        uint64_t v54 = *(void *)(v2 + 240);
        if (((*(unsigned __int8 *)(v54 + v58[3]) ^ *(unsigned __int8 *)(v54 + *v58)) & 4) != 0
          || ((*(unsigned __int8 *)(v54 + v58[4]) ^ *(unsigned __int8 *)(v54 + v58[1])) & 4) != 0)
        {
          __int16 v55 = 0x4000;
        }
        else
        {
          __int16 v55 = 0;
        }
        LOWORD(v51) = v55 | v50 & 0xBFFF;
      }
      else
      {
        if (v60 != 4) {
          goto LABEL_68;
        }
        unsigned int v51 = v49 & 0xFFFF9FFF | 0x2000 | ((((*(unsigned __int8 *)(*(void *)(v2 + 240) + v58[2]) ^ *(unsigned __int8 *)(*(void *)(v2 + 240) + *v58)) >> 2) & 1) << 14);
      }
LABEL_67:
      *(_WORD *)(v30 + 2 * v18) = v51;
LABEL_68:
      if (v61 && (*(_WORD *)(v30 + 2 * v18) & 4) != 0 && (int)v33 >= 1)
      {
        uint64_t v52 = (int *)(v63 + 4 * v62);
        do
        {
          uint64_t v53 = *v52++;
          *(unsigned char *)(*(void *)(v2 + 96) + v53) |= 1u;
          *(unsigned char *)(a1 + 8) |= 2u;
          --v33;
        }
        while (v33);
      }
      if (++v18 >= *(int *)(v2 + 8)) {
        return 1;
      }
    }
    BOOL v34 = 0;
LABEL_34:
    if ((*(_WORD *)(v30 + 2 * v18) & 1) == 0 || v23 == 2 && !v26 && (int)v33 > (int)v22) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  return 1;
}

uint64_t sub_1B6E17D40(uint64_t a1)
{
  uint64_t v2 = **(void **)(a1 + 40);
  int v3 = sub_1B6E110D0(*(_DWORD *)a1);
  if (v3 >= 0) {
    int v4 = v3;
  }
  else {
    int v4 = v3 + 1;
  }
  if ((int)((*(void *)(**(void **)(a1 + 40) + 464) - *(void *)(**(void **)(a1 + 40) + 456)) >> 3) < 1) {
    return 1;
  }
  int v5 = 0;
  int v6 = v4 >> 1;
  while (sub_1B6E1BBA4(v2, v5))
  {
    sub_1B6E1BBC4(v2, v5++, v6);
    if (v5 >= (int)((*(void *)(**(void **)(a1 + 40) + 464) - *(void *)(**(void **)(a1 + 40) + 456)) >> 3)) {
      return 1;
    }
  }
  sub_1B6E240DC(4, (uint64_t)"Failure in TopologyRefinerFactory<>::Create() -- face-varying channel %d has no values.", v7, v8, v9, v10, v11, v12, v5);
  return 0;
}

void sub_1B6E17E0C(void *a1, uint64_t a2)
{
  int v4 = sub_1B6E11098(*(_DWORD *)a2);
  int v5 = *(unsigned int ***)(a2 + 40);
  int v6 = *v5;
  uint64_t v7 = (int)**v5;
  uint64_t v8 = **v5;
  sub_1B642863C((uint64_t)a1, v7 + 1);
  uint64_t v9 = (_DWORD *)*a1;
  if ((int)v7 < 1)
  {
    int v10 = 0;
  }
  else
  {
    int v10 = 0;
    uint64_t v11 = (int *)*((void *)v6 + 3);
    uint64_t v12 = v8;
    char v13 = (_DWORD *)*a1;
    do
    {
      *v13++ = v10;
      int v15 = *v11;
      v11 += 2;
      int v14 = v15;
      if (v15 == v4) {
        int v14 = 1;
      }
      v10 += v14;
      --v12;
    }
    while (v12);
  }
  v9[(int)v8] = v10;
}

void *sub_1B6E17EAC(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_1B6E17E0C(a1, a2);
  return a1;
}

uint64_t sub_1B6E17EDC(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_1B6E17F10(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 8) - 4);
}

uint64_t sub_1B6E17F1C(void *a1, int a2)
{
  return *(unsigned int *)(*a1 + 4 * a2);
}

uint64_t sub_1B6E17F28(uint64_t a1)
{
  int v5 = (void **)(a1 + 120);
  sub_1B6E18388(&v5);
  int v5 = (void **)(a1 + 96);
  sub_1B6E18388(&v5);
  int v5 = (void **)(a1 + 72);
  sub_1B639030C(&v5);

  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }

  int v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1B6E17FC0()
{
}

uint64_t sub_1B6E18054(void *a1, uint64_t a2, void **a3)
{
  sub_1B6E1646C(&v45, a2);
  unint64_t v5 = v46 - v45;
  uint64_t v7 = v47;
  uint64_t v6 = v48;
  uint64_t v9 = v49;
  uint64_t v8 = v50;
  sub_1B6E18408(a1, v45, v46, v5);
  if (v6 == v7) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = objc_msgSend_newBufferWithBytes_length_options_(*a3, v10, v47, v6 - v7, 0);
  }
  uint64_t v12 = (void *)a1[3];
  a1[3] = v11;

  int v15 = (void *)a1[3];
  if (!v15) {
    goto LABEL_29;
  }
  objc_msgSend_setLabel_(v15, v13, @"OSD PatchIndexBuffer", v14);
  uint64_t v17 = v8 == v9 ? 0 : objc_msgSend_newBufferWithBytes_length_options_(*a3, v16, v49, v8 - v9, 0);
  uint64_t v18 = (void *)a1[4];
  a1[4] = v17;

  uint64_t v21 = (void *)a1[4];
  if (!v21
    || ((objc_msgSend_setLabel_(v21, v19, @"OSD PatchParamBuffer", v20), v51 != v52)
      ? (uint64_t v22 = v51)
      : (uint64_t v22 = 0),
        (sub_1B6E18408(a1 + 5, v22, &v22[v5], v5), v54 == v53)
      ? (uint64_t v24 = 0)
      : (uint64_t v24 = objc_msgSend_newBufferWithBytes_length_options_(*a3, v23, v53, v54 - v53, 0)),
        (int v25 = (void *)a1[8], a1[8] = v24, v25, !a1[8]) && v54 != v53))
  {
LABEL_29:
    uint64_t v43 = 0;
    goto LABEL_30;
  }
  int v26 = -1431655765 * ((v56 - v55) >> 3);
  uint64_t v27 = a1 + 9;
  sub_1B64279A8(a1 + 9, v26);
  uint64_t v28 = a1 + 12;
  sub_1B6E18300((uint64_t)(a1 + 12), v26);
  unsigned int v29 = a1 + 15;
  sub_1B6E18300((uint64_t)v29, v26);
  if (v26 >= 1)
  {
    uint64_t v30 = 0;
    uint64_t v31 = 8 * v26;
    uint64_t v32 = 8;
    do
    {
      sub_1B6E18408((void *)(*v27 + v32 - 8), *(long long **)(v55 + v32 - 8), (long long *)(*(void *)(v55 + v32 - 8) + 16 * v5), v5);
      uint64_t v34 = *(void *)(v57 + v32 - 8);
      uint64_t v35 = *(void *)(v57 + v32);
      uint64_t v36 = v35 == v34 ? 0 : objc_msgSend_newBufferWithBytes_length_options_(*a3, v33, v34, v35 - v34, 0);
      uint64_t v37 = *(void **)(*v28 + v30);
      *(void *)(*v28 + v30) = v36;

      if (!*(void *)(*v28 + v30)) {
        goto LABEL_29;
      }
      uint64_t v39 = *(void *)(v58 + v32 - 8);
      uint64_t v40 = *(void *)(v58 + v32);
      uint64_t v41 = v40 == v39 ? 0 : objc_msgSend_newBufferWithBytes_length_options_(*a3, v38, v39, v40 - v39, 0);
      int v42 = *(void **)(*v29 + v30);
      *(void *)(*v29 + v30) = v41;

      if (!*(void *)(*v29 + v30)) {
        goto LABEL_29;
      }
      v32 += 24;
      v30 += 8;
    }
    while (v31 != v30);
  }
  uint64_t v43 = 1;
LABEL_30:
  sub_1B657B714((uint64_t)&v45);
  return v43;
}

void sub_1B6E182E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1B6E18300(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = (v3 - *(void *)a1) >> 3;
  if (a2 <= v4)
  {
    if (a2 < v4)
    {
      uint64_t v6 = *(void *)a1 + 8 * a2;
      while (v3 != v6)
      {
        uint64_t v7 = *(void **)(v3 - 8);
        v3 -= 8;
      }
      *(void *)(a1 + 8) = v6;
    }
  }
  else
  {
    unint64_t v5 = a2 - v4;
    sub_1B6E18588((char **)a1, v5);
  }
}

void sub_1B6E18388(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_OWORD *sub_1B6E18408(void *a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  __n128 result = (_OWORD *)*a1;
  if (a4 > (v8 - (uint64_t)result) >> 4)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      abort();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_1B657F2A0(a1, v11);
    char v13 = (_OWORD *)a1[1];
    uint64_t v12 = (_OWORD **)(a1 + 1);
    __n128 result = v13;
    uint64_t v14 = v13;
    if (v6 != a3)
    {
      uint64_t v14 = result;
      do
      {
        *(_DWORD *)uint64_t v14 = *(_DWORD *)v6;
        uint64_t v15 = *(void *)((char *)v6 + 4);
        *((_DWORD *)v14 + 3) = *((_DWORD *)v6 + 3);
        *(void *)((char *)v14++ + 4) = v15;
        ++v6;
      }
      while (v6 != a3);
    }
LABEL_26:
    int64_t v25 = (char *)v14 - (char *)result;
    goto LABEL_27;
  }
  uint64_t v17 = (_OWORD *)a1[1];
  uint64_t v12 = (_OWORD **)(a1 + 1);
  int v16 = v17;
  unint64_t v18 = v17 - result;
  if (v18 >= a4)
  {
    uint64_t v14 = result;
    if (a2 != a3)
    {
      int v26 = result;
      do
      {
        long long v27 = *v6++;
        *v26++ = v27;
        ++v14;
      }
      while (v6 != a3);
    }
    goto LABEL_26;
  }
  uint64_t v19 = &a2[v18];
  if (v16 != result)
  {
    uint64_t v20 = 16 * v18;
    do
    {
      long long v21 = *v6++;
      *result++ = v21;
      v20 -= 16;
    }
    while (v20);
    __n128 result = *v12;
  }
  uint64_t v22 = (char *)result;
  if (v19 != a3)
  {
    uint64_t v22 = (char *)result;
    int v23 = result;
    do
    {
      *(_DWORD *)int v23 = *(_DWORD *)v19;
      uint64_t v24 = *(void *)((char *)v19 + 4);
      *((_DWORD *)v23 + 3) = *((_DWORD *)v19 + 3);
      *(void *)((char *)v23 + 4) = v24;
      v22 += 16;
      ++v19;
      ++v23;
    }
    while (v19 != a3);
  }
  int64_t v25 = v22 - (char *)result;
LABEL_27:
  *uint64_t v12 = (_OWORD *)((char *)result + v25);
  return result;
}

void sub_1B6E18588(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - *a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      abort();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - *a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    uint64_t v25 = v4;
    if (v12) {
      char v13 = (char *)sub_1B64285D4(v4, v12);
    }
    else {
      char v13 = 0;
    }
    uint64_t v14 = &v13[8 * v10];
    uint64_t v15 = &v13[8 * v12];
    uint64_t v24 = v15;
    bzero(v14, 8 * a2);
    int v16 = &v14[8 * a2];
    v23.i64[1] = (uint64_t)v16;
    unint64_t v18 = *a1;
    uint64_t v17 = a1[1];
    if (v17 == *a1)
    {
      int64x2_t v20 = vdupq_n_s64((unint64_t)v17);
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *(void *)uint64_t v17 = 0;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      int64x2_t v20 = *(int64x2_t *)a1;
      int v16 = (char *)v23.i64[1];
      uint64_t v15 = v24;
    }
    *a1 = v14;
    a1[1] = v16;
    int64x2_t v23 = v20;
    long long v21 = a1[2];
    a1[2] = v15;
    uint64_t v24 = v21;
    uint64_t v22 = v20.i64[0];
    sub_1B6E186AC((uint64_t)&v22);
  }
}

uint64_t sub_1B6E186AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_1B6E18700(float a1, uint64_t a2, int a3)
{
  if (a3 <= 2 && a1 <= 0.0) {
    return (1 << a3);
  }
  else {
    return 8;
  }
}

uint64_t sub_1B6E18720(float a1, uint64_t a2, int a3, float *a4)
{
  if (a1 > 0.0) {
    return 8;
  }
  if (a3 < 1) {
    return 1;
  }
  unsigned int v5 = 0;
  uint64_t v6 = a3;
  do
  {
    float v7 = *a4++;
    if (v7 > 0.0) {
      ++v5;
    }
    --v6;
  }
  while (v6);
  if (v5 <= 2) {
    return (1 << v5);
  }
  else {
    return 8;
  }
}

double sub_1B6E18774(_WORD *a1, int a2, float *a3, float *a4, float a5, float a6)
{
  int v6 = a5 > 0.0 && a6 <= 0.0;
  if (a5 <= 0.0 || a6 > 0.0) {
    a5 = 0.0;
  }
  if (a4 && (*a1 & 0x60) != 0)
  {
    if (a2 >= 1)
    {
      uint64_t v7 = a2;
      do
      {
        if (*a3 > 0.0 && *a4 <= 0.0)
        {
          a5 = a5 + *a3;
          ++v6;
        }
        ++a4;
        ++a3;
        --v7;
      }
      while (v7);
    }
  }
  else if (a2 >= 1)
  {
    uint64_t v8 = a2;
    do
    {
      float v9 = *a3++;
      float v10 = v9;
      v6 += v9 > 0.0 && v9 <= 1.0;
      if (v9 <= 0.0 || v9 > 1.0) {
        float v10 = -0.0;
      }
      a5 = a5 + v10;
      --v8;
    }
    while (v8);
  }
  if (!v6) {
    return 0.0;
  }
  *(float *)&double result = a5 / (float)v6;
  if (*(float *)&result > 1.0) {
    *(float *)&double result = 1.0;
  }
  return result;
}

float sub_1B6E18844(_WORD *a1, int a2, float *a3, float a4)
{
  if (a2 >= 2 && (*a1 & 0x60) != 0)
  {
    float v4 = 0.0;
    if (a4 > 0.0)
    {
      float v4 = 10.0;
      if (a4 < 10.0)
      {
        int v5 = 0;
        uint64_t v6 = a2;
        float v7 = 0.0;
        do
        {
          float v8 = *a3++;
          float v9 = v8;
          int v10 = v8 > 0.0 && v8 < 10.0;
          if (v8 <= 0.0 || v8 >= 10.0) {
            float v9 = -0.0;
          }
          float v7 = v7 + v9;
          v5 += v10;
          --v6;
        }
        while (v6);
        BOOL v11 = v5 != 0;
        int v12 = v5 - 1;
        if (v12 != 0 && v11) {
          a4 = (float)((float)((float)(v7 - a4) / (float)v12) * 0.25) + (float)(a4 * 0.75);
        }
        return fmaxf(a4 + -1.0, 0.0);
      }
    }
  }
  else
  {
    float v4 = 0.0;
    if (a4 > 0.0)
    {
      float v4 = 10.0;
      if (a4 < 10.0)
      {
        float v4 = 0.0;
        if (a4 > 1.0) {
          return a4 + -1.0;
        }
      }
    }
  }
  return v4;
}

_WORD *sub_1B6E18920(_WORD *result, int a2, float *a3, float *a4)
{
  if (a2 > 1 && (*result & 0x60) != 0)
  {
    if ((*result & 0x60) == 0x20)
    {
      int v4 = 0;
      uint64_t v5 = a2;
      float v6 = 0.0;
      uint64_t v7 = a2;
      float v8 = a3;
      do
      {
        float v9 = *v8++;
        float v10 = v9;
        v4 += v9 > 0.0 && v9 < 10.0;
        if (v9 <= 0.0 || v9 >= 10.0) {
          float v10 = -0.0;
        }
        float v6 = v6 + v10;
        --v7;
      }
      while (v7);
      if (v4)
      {
        while (1)
        {
          float v11 = *a3;
          float v12 = 0.0;
          if (*a3 <= 0.0) {
            goto LABEL_16;
          }
          float v12 = 10.0;
          if (v11 >= 10.0) {
            goto LABEL_16;
          }
          if (v4 == 1) {
            break;
          }
          float v13 = (float)((float)((float)((float)(v6 - v11) / (float)(v4 - 1)) * 0.25) + (float)(v11 * 0.75)) + -1.0;
          float v12 = 0.0;
          if (v13 <= 0.0) {
            goto LABEL_16;
          }
LABEL_17:
          *a4++ = v13;
          ++a3;
          if (!--v5) {
            return result;
          }
        }
        float v12 = v11 + -1.0;
        if (v11 <= 1.0) {
          float v12 = 0.0;
        }
LABEL_16:
        float v13 = v12;
        goto LABEL_17;
      }
      do
      {
        float v14 = *a3++;
        *a4++ = v14;
        --v5;
      }
      while (v5);
    }
  }
  else if (a2 >= 1)
  {
    uint64_t v15 = a2;
    do
    {
      float v16 = *a3;
      float v17 = 0.0;
      if (*a3 > 0.0)
      {
        float v17 = 10.0;
        if (v16 < 10.0)
        {
          float v17 = 0.0;
          if (v16 > 1.0) {
            float v17 = v16 + -1.0;
          }
        }
      }
      *a4++ = v17;
      ++a3;
      --v15;
    }
    while (v15);
  }
  return result;
}

double sub_1B6E18A78(_OWORD *a1)
{
  double result = 0.0;
  a1[28] = 0u;
  a1[29] = 0u;
  a1[26] = 0u;
  a1[27] = 0u;
  a1[24] = 0u;
  a1[25] = 0u;
  a1[22] = 0u;
  a1[23] = 0u;
  a1[20] = 0u;
  a1[21] = 0u;
  a1[18] = 0u;
  a1[19] = 0u;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *sub_1B6E18ABC(void *a1)
{
  int v4 = a1 + 57;
  uint64_t v2 = (void **)a1[57];
  uint64_t v3 = v4[1];
  if ((int)((unint64_t)(v3 - (void)v2) >> 3) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if (v2[v5])
      {
        float v6 = sub_1B6E0F71C(v2[v5]);
        MEMORY[0x1BA9B6D80](v6, 0x1070C408374ED18);
        uint64_t v2 = (void **)a1[57];
        uint64_t v3 = a1[58];
      }
      ++v5;
    }
    while (v5 < (int)((unint64_t)(v3 - (void)v2) >> 3));
  }
  if (v2)
  {
    a1[58] = v2;
    operator delete(v2);
  }
  uint64_t v7 = (void *)a1[54];
  if (v7)
  {
    a1[55] = v7;
    operator delete(v7);
  }
  float v8 = (void *)a1[51];
  if (v8)
  {
    a1[52] = v8;
    operator delete(v8);
  }
  float v9 = (void *)a1[48];
  if (v9)
  {
    a1[49] = v9;
    operator delete(v9);
  }
  float v10 = (void *)a1[45];
  if (v10)
  {
    a1[46] = v10;
    operator delete(v10);
  }
  float v11 = (void *)a1[42];
  if (v11)
  {
    a1[43] = v11;
    operator delete(v11);
  }
  float v12 = (void *)a1[39];
  if (v12)
  {
    a1[40] = v12;
    operator delete(v12);
  }
  float v13 = (void *)a1[36];
  if (v13)
  {
    a1[37] = v13;
    operator delete(v13);
  }
  float v14 = (void *)a1[33];
  if (v14)
  {
    a1[34] = v14;
    operator delete(v14);
  }
  uint64_t v15 = (void *)a1[30];
  if (v15)
  {
    a1[31] = v15;
    operator delete(v15);
  }
  float v16 = (void *)a1[27];
  if (v16)
  {
    a1[28] = v16;
    operator delete(v16);
  }
  float v17 = (void *)a1[24];
  if (v17)
  {
    a1[25] = v17;
    operator delete(v17);
  }
  unint64_t v18 = (void *)a1[21];
  if (v18)
  {
    a1[22] = v18;
    operator delete(v18);
  }
  uint64_t v19 = (void *)a1[18];
  if (v19)
  {
    a1[19] = v19;
    operator delete(v19);
  }
  int64x2_t v20 = (void *)a1[15];
  if (v20)
  {
    a1[16] = v20;
    operator delete(v20);
  }
  long long v21 = (void *)a1[12];
  if (v21)
  {
    a1[13] = v21;
    operator delete(v21);
  }
  uint64_t v22 = (void *)a1[9];
  if (v22)
  {
    a1[10] = v22;
    operator delete(v22);
  }
  int64x2_t v23 = (void *)a1[6];
  if (v23)
  {
    a1[7] = v23;
    operator delete(v23);
  }
  uint64_t v24 = (void *)a1[3];
  if (v24)
  {
    a1[4] = v24;
    operator delete(v24);
  }
  return a1;
}

BOOL sub_1B6E18C6C(unsigned int *a1, void (*a2)(uint64_t, char *, uint64_t), uint64_t a3)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *((void *)a1 + 6);
  if (((*((void *)a1 + 7) - v6) & 0x3FFFFFFFCLL) == 0)
  {
    if (!a2) {
      return 0;
    }
    snprintf(__str, 0x400uLL, "%s - missing face-verts", "MISSING_FACE_VERTS");
    a2(3, __str, a3);
    BOOL v60 = 1;
LABEL_65:
    BOOL v62 = 0;
    if (v60 && ((*((void *)a1 + 37) - *((void *)a1 + 36)) & 0x3FFFFFFFCLL) == 0)
    {
      snprintf(__str, 0x400uLL, "%s - missing vert-faces", "MISSING_VERT_FACES");
      uint64_t v61 = 4;
      goto LABEL_68;
    }
    return v62;
  }
  uint64_t v7 = *((void *)a1 + 36);
  if (((*((void *)a1 + 37) - v7) & 0x3FFFFFFFCLL) == 0)
  {
    BOOL v60 = a2 != 0;
    goto LABEL_65;
  }
  uint64_t v8 = *a1;
  if ((int)v8 >= 1)
  {
    uint64_t v9 = 0;
    while (1)
    {
      float v10 = (unsigned int *)(*((void *)a1 + 3) + 8 * v9);
      uint64_t v11 = *v10;
      if ((int)v11 >= 1) {
        break;
      }
LABEL_14:
      if (++v9 == v8) {
        goto LABEL_15;
      }
    }
    uint64_t v12 = 0;
    uint64_t v13 = v6 + 4 * (int)v10[1];
    uint64_t v14 = *((void *)a1 + 33);
    while (1)
    {
      uint64_t v15 = *(int *)(v13 + 4 * v12);
      uint64_t v16 = *(unsigned int *)(v14 + 8 * v15);
      if ((int)v16 < 1) {
        break;
      }
      uint64_t v17 = *(int *)(v14 + 8 * v15 + 4);
      unint64_t v18 = (int *)(v7 + 4 * v17);
      uint64_t v19 = (unsigned __int16 *)(*((void *)a1 + 39) + 2 * v17);
      while (1)
      {
        int v20 = *v18++;
        if (v9 == v20 && v12 == *v19) {
          break;
        }
        ++v19;
        if (!--v16) {
          goto LABEL_61;
        }
      }
      if (++v12 == v11) {
        goto LABEL_14;
      }
    }
LABEL_61:
    if (!a2) {
      return 0;
    }
    snprintf(__str, 0x400uLL, "%s - face %d correlation of vert %d failed");
    goto LABEL_63;
  }
LABEL_15:
  uint64_t v21 = *((void *)a1 + 21);
  if (((*((void *)a1 + 22) - v21) & 0x3FFFFFFFCLL) == 0)
  {
    if (!a2) {
      return 0;
    }
    snprintf(__str, 0x400uLL, "%s - missing edge-faces", "MISSING_EDGE_FACES");
    a2(0, __str, a3);
    BOOL v64 = 1;
LABEL_76:
    BOOL v62 = 0;
    if (v64 && ((*((void *)a1 + 10) - *((void *)a1 + 9)) & 0x3FFFFFFFCLL) == 0)
    {
      snprintf(__str, 0x400uLL, "%s - missing face-edges", "MISSING_FACE_EDGES");
      uint64_t v61 = 2;
      goto LABEL_68;
    }
    return v62;
  }
  uint64_t v22 = *((void *)a1 + 9);
  if (((*((void *)a1 + 10) - v22) & 0x3FFFFFFFCLL) == 0)
  {
    BOOL v64 = a2 != 0;
    goto LABEL_76;
  }
  if ((int)v8 >= 1)
  {
    uint64_t v23 = 0;
    while (1)
    {
      uint64_t v24 = (unsigned int *)(*((void *)a1 + 3) + 8 * v23);
      uint64_t v25 = *v24;
      if ((int)v25 >= 1) {
        break;
      }
LABEL_28:
      if (++v23 == v8) {
        goto LABEL_29;
      }
    }
    uint64_t v26 = 0;
    uint64_t v27 = v22 + 4 * (int)v24[1];
    uint64_t v28 = *((void *)a1 + 18);
    while (1)
    {
      uint64_t v29 = *(int *)(v27 + 4 * v26);
      uint64_t v30 = *(unsigned int *)(v28 + 8 * v29);
      if ((int)v30 < 1) {
        break;
      }
      uint64_t v31 = *(int *)(v28 + 8 * v29 + 4);
      uint64_t v32 = (int *)(v21 + 4 * v31);
      uint64_t v33 = (unsigned __int16 *)(*((void *)a1 + 24) + 2 * v31);
      while (1)
      {
        int v34 = *v32++;
        if (v23 == v34 && v26 == *v33) {
          break;
        }
        ++v33;
        if (!--v30) {
          goto LABEL_73;
        }
      }
      if (++v26 == v25) {
        goto LABEL_28;
      }
    }
LABEL_73:
    if (!a2) {
      return 0;
    }
    snprintf(__str, 0x400uLL, "%s - face %d correlation of edge %d failed", "FAILED_CORRELATION_FACE_EDGE", v23, v26);
    uint64_t v61 = 8;
    goto LABEL_68;
  }
LABEL_29:
  uint64_t v35 = *((void *)a1 + 15);
  if (((*((void *)a1 + 16) - v35) & 0x3FFFFFFFCLL) == 0)
  {
    if (!a2) {
      return 0;
    }
    snprintf(__str, 0x400uLL, "%s - missing edge-verts", "MISSING_EDGE_VERTS");
    BOOL v65 = 1;
    a2(1, __str, a3);
LABEL_84:
    BOOL v62 = 0;
    if (v65 && ((*((void *)a1 + 46) - *((void *)a1 + 45)) & 0x3FFFFFFFCLL) == 0)
    {
      snprintf(__str, 0x400uLL, "%s - missing vert-edges", "MISSING_VERT_EDGES");
      uint64_t v61 = 5;
      goto LABEL_68;
    }
    return v62;
  }
  uint64_t v36 = *((void *)a1 + 45);
  if (((*((void *)a1 + 46) - v36) & 0x3FFFFFFFCLL) == 0)
  {
    BOOL v65 = a2 != 0;
    goto LABEL_84;
  }
  uint64_t v37 = a1[1];
  if ((int)v37 >= 1)
  {
    uint64_t v38 = 0;
    uint64_t v39 = *((void *)a1 + 42);
LABEL_33:
    uint64_t v40 = 0;
    char v41 = 1;
    while (1)
    {
      char v42 = v41;
      uint64_t v43 = *(int *)(v35 + 8 * v38 + 4 * v40);
      uint64_t v44 = *(unsigned int *)(v39 + 8 * v43);
      if ((int)v44 < 1) {
        break;
      }
      uint64_t v45 = *(int *)(v39 + 8 * v43 + 4);
      __int16 v46 = (int *)(v36 + 4 * v45);
      uint64_t v47 = (unsigned __int16 *)(*((void *)a1 + 48) + 2 * v45);
      while (1)
      {
        int v48 = *v46++;
        if (v38 == v48 && v40 == *v47) {
          break;
        }
        ++v47;
        if (!--v44) {
          goto LABEL_81;
        }
      }
      char v41 = 0;
      uint64_t v40 = 1;
      if ((v42 & 1) == 0)
      {
        if (++v38 != v37) {
          goto LABEL_33;
        }
        goto LABEL_42;
      }
    }
LABEL_81:
    if (!a2) {
      return 0;
    }
    snprintf(__str, 0x400uLL, "%s - edge %d correlation of vert %d failed");
LABEL_63:
    uint64_t v61 = 7;
LABEL_68:
    a2(v61, __str, a3);
    return 0;
  }
LABEL_42:
  unsigned int v49 = 2 * a1[5];
  int v74 = &v75;
  __p = 0;
  if (v49 >= 0x21)
  {
    __p = operator new(4 * v49);
    int v74 = (uint64_t *)__p;
  }
  if ((int)a1[2] < 1)
  {
LABEL_87:
    unint64_t v66 = a1[1];
    if ((int)v66 < 1)
    {
      BOOL v62 = 1;
    }
    else
    {
      uint64_t v67 = 0;
      BOOL v62 = 0;
      uint64_t v68 = 4;
      while (1)
      {
        if ((*(unsigned char *)(*((void *)a1 + 30) + v67) & 1) == 0)
        {
          if (*(_DWORD *)(*((void *)a1 + 15) + v68 - 4) == *(_DWORD *)(*((void *)a1 + 15) + v68))
          {
            if (!a2) {
              goto LABEL_106;
            }
            snprintf(__str, 0x400uLL, "%s - Error in eIndex = %d:  degenerate edge not tagged marked non-manifold", "DEGENERATE_EDGE", v67);
            uint64_t v71 = 12;
            goto LABEL_105;
          }
          int v69 = *(_DWORD *)(*((void *)a1 + 18) + v68 - 4);
          if ((v69 - 3) <= 0xFFFFFFFD) {
            break;
          }
        }
        BOOL v62 = ++v67 >= v66;
        v68 += 8;
        if (v66 == v67) {
          goto LABEL_106;
        }
      }
      if (!a2) {
        goto LABEL_106;
      }
      snprintf(__str, 0x400uLL, "%s - edge %d with %d incident faces not tagged non-manifold", "NON_MANIFOLD_EDGE", v67, v69);
      uint64_t v71 = 13;
LABEL_105:
      a2(v71, __str, a3);
    }
  }
  else
  {
    uint64_t v50 = 0;
    while (1)
    {
      if ((*(_WORD *)(*((void *)a1 + 54) + 2 * v50) & 0x801) == 0)
      {
        uint64_t v51 = *((void *)a1 + 33);
        uint64_t v52 = (8 * v50) | 4;
        uint64_t v53 = *(int *)(v51 + v52);
        uint64_t v54 = *((void *)a1 + 36);
        uint64_t v55 = *(int *)(v51 + 8 * v50);
        uint64_t v56 = *((void *)a1 + 42);
        uint64_t v72 = *(int *)(v56 + v52);
        uint64_t v73 = *((void *)a1 + 45);
        uint64_t v57 = *(unsigned int *)(v56 + 8 * v50);
        if (!sub_1B6E193EC(a1, v50, v74, (int *)v74 + v55))
        {
          if (a2)
          {
            snprintf(__str, 0x400uLL, "%s - vertex %d cannot orient incident faces and edges", "FAILED_ORIENTATION_INCIDENT_FACES_EDGES", v50);
            uint64_t v70 = 11;
            goto LABEL_98;
          }
          goto LABEL_99;
        }
        if ((int)v55 >= 1)
        {
          uint64_t v58 = 0;
          while (*(_DWORD *)(v54 + 4 * v53 + 4 * v58) == *((_DWORD *)v74 + v58))
          {
            if (v55 == ++v58) {
              goto LABEL_54;
            }
          }
          if (a2)
          {
            snprintf(__str, 0x400uLL, "%s - vertex %d orientation failure at incident face %d", "FAILED_ORIENTATION_INCIDENT_FACE", v50, v58);
            uint64_t v70 = 10;
LABEL_98:
            a2(v70, __str, a3);
            goto LABEL_99;
          }
          goto LABEL_99;
        }
LABEL_54:
        if ((int)v57 >= 1) {
          break;
        }
      }
LABEL_47:
      if (++v50 >= (int)a1[2]) {
        goto LABEL_87;
      }
    }
    uint64_t v59 = 0;
    while (*(_DWORD *)(v73 + 4 * v72 + 4 * v59) == *((_DWORD *)v74 + v55 + v59))
    {
      if (v57 == ++v59) {
        goto LABEL_47;
      }
    }
    if (a2)
    {
      snprintf(__str, 0x400uLL, "%s - vertex %d orientation failure at incident edge %d", "FAILED_ORIENTATION_INCIDENT_EDGE", v50, v59);
      uint64_t v70 = 9;
      goto LABEL_98;
    }
LABEL_99:
    BOOL v62 = 0;
  }
LABEL_106:
  operator delete(__p);
  return v62;
}

uint64_t sub_1B6E193EC(void *a1, __int32 __c, _DWORD *a3, int *a4)
{
  uint64_t v5 = a1[42];
  uint64_t v6 = 8 * __c;
  uint64_t v7 = *(unsigned int *)(v5 + v6);
  uint64_t v8 = a1[33];
  int v9 = *(_DWORD *)(v8 + v6);
  if (v9) {
    BOOL v10 = (int)v7 < 2;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (int)v7 - v9 <= 1)
  {
    unint64_t v15 = (8 * ((unint64_t)(2 * __c) >> 1)) | 4;
    int v60 = v9;
    uint64_t v58 = v7;
    if (v7 == v9)
    {
      uint64_t v16 = *(int *)(a1[36] + 4 * *(int *)(v8 + v15));
      int v17 = (2 * v16) | 1;
      uint64_t v18 = a1[3];
      uint64_t v19 = (__int32 *)(a1[6] + 4 * *(int *)(v18 + 4 * v17));
      size_t v20 = *(int *)(v18 + 8 * v16);
      uint64_t v21 = &v19[v20];
      uint64_t v22 = wmemchr(v19, __c, v20);
      if (v22) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = v21;
      }
      unint64_t v24 = (unint64_t)((char *)v23 - (char *)v19) >> 2;
      int v25 = *(_DWORD *)(a1[9] + 4 * *(int *)(a1[3] + 4 * v17) + 4 * (int)v24);
    }
    else
    {
      LODWORD(v24) = 0;
      uint64_t v26 = (int *)(a1[45] + 4 * *(int *)(v5 + v15));
      LODWORD(v16) = -1;
      int v25 = -1;
      do
      {
        uint64_t v28 = *v26++;
        int v27 = v28;
        uint64_t v29 = a1[18];
        if (*(_DWORD *)(v29 + 8 * v28) == 1)
        {
          uint64_t v16 = *(int *)(a1[21] + 4 * *(int *)(v29 + 4 * ((2 * v27) | 1)));
          int v30 = (2 * v16) | 1;
          uint64_t v31 = a1[3];
          uint64_t v32 = (__int32 *)(a1[6] + 4 * *(int *)(v31 + 4 * v30));
          size_t v33 = *(int *)(v31 + 8 * v16);
          int v34 = &v32[v33];
          uint64_t v35 = wmemchr(v32, __c, v33);
          uint64_t v36 = v35 ? v35 : v34;
          unint64_t v24 = (unint64_t)((char *)v36 - (char *)v32) >> 2;
          int v37 = *(_DWORD *)(a1[9] + 4 * *(int *)(a1[3] + 4 * v30) + 4 * (int)v24);
          int v25 = v27;
          if (v27 == v37) {
            break;
          }
        }
        --v7;
      }
      while (v7);
    }
    *a3 = v16;
    *a4 = v25;
    uint64_t v38 = a4 + 1;
    uint64_t v39 = v58 - 1;
    int v40 = 1;
    __int32 v41 = v25;
    LODWORD(v42) = v24;
    int v43 = v60;
    while (1)
    {
      __int32 v44 = v41;
      uint64_t v45 = a1[3];
      int v46 = *(_DWORD *)(v45 + 8 * (int)v16);
      uint64_t v47 = a1[9];
      if (v42) {
        int v46 = v42;
      }
      __int32 v41 = *(_DWORD *)(v47 + 4 * *(int *)(v45 + 8 * v16 + 4) + 4 * (v46 - 1));
      if (v41 == v44 || v41 == v25) {
        break;
      }
      __int32 *v38 = v41;
      if (v40 < v43)
      {
        uint64_t v49 = a1[18];
        uint64_t v50 = (int *)(a1[21] + 4 * *(int *)(v49 + 4 * ((2 * v41) | 1)));
        int v51 = *(_DWORD *)(v49 + 8 * v41);
        if (v51 == 1)
        {
          int v52 = *v50;
          if (*v50 == v16) {
            return 0;
          }
        }
        else
        {
          if (!v51) {
            return 0;
          }
          int v52 = *v50;
        }
        uint64_t v16 = v50[v52 == v16];
        uint64_t v53 = (__int32 *)(v47 + 4 * *(int *)(v45 + 4 * (int)((2 * v16) | 1)));
        size_t v54 = *(int *)(v45 + 8 * v16);
        uint64_t v55 = &v53[v54];
        uint64_t v56 = wmemchr(v53, v41, v54);
        int v43 = v60;
        if (v56) {
          uint64_t v57 = v56;
        }
        else {
          uint64_t v57 = v55;
        }
        unint64_t v42 = (unint64_t)((char *)v57 - (char *)v53) >> 2;
        a3[v40++] = v16;
      }
      ++v38;
      if (!--v39) {
        return 1;
      }
    }
  }
  return 0;
}

BOOL sub_1B6E196B0(uint64_t a1, int a2, int a3)
{
  return (sub_1B6E10B94(*(void **)(*(void *)(a1 + 456) + 8 * a3), a2) & 1) == 0;
}

void *sub_1B6E196D8(void *result, int a2, _WORD *a3, unsigned int a4)
{
  uint64_t v4 = (2 * a2) | 1;
  uint64_t v5 = result[3];
  uint64_t v6 = (int *)(result[6] + 4 * *(int *)(v5 + 4 * v4));
  uint64_t v7 = *(unsigned int *)(v5 + 8 * a2);
  if ((a4 & 0x80000000) != 0)
  {
    if ((int)v7 >= 1)
    {
      do
      {
        uint64_t v21 = *v6++;
        *a3++ = *(_WORD *)(result[54] + 2 * v21);
        --v7;
      }
      while (v7);
    }
  }
  else if ((int)v7 >= 1)
  {
    uint64_t v8 = 0;
    int v9 = *(void **)(result[57] + 8 * a4);
    uint64_t v10 = v9[3] + 4 * *(int *)(*(void *)(*v9 + 24) + 4 * v4);
    do
    {
      uint64_t v11 = v6[v8];
      int v12 = *(_DWORD *)(v10 + 4 * v8);
      if (*(int *)(*v9 + 12) <= 0)
      {
        uint64_t v13 = *(int *)(v9[12] + 4 * v11);
        int v12 = v13 - 1;
        uint64_t v14 = (int *)(v9[18] + 4 * v13);
        do
        {
          int v15 = *v14++;
          ++v12;
        }
        while (v15 != *(_DWORD *)(v10 + 4 * v8));
      }
      unsigned int v16 = *(unsigned __int8 *)(v9[21] + v12);
      LOWORD(v11) = *(_WORD *)(result[54] + 2 * v11);
      if (v16)
      {
        __int16 v17 = v11 & 0xD867;
        __int16 v18 = v17 | 0x2200;
        if ((v16 & 0x80u) == 0) {
          int v19 = ~(v16 >> 3) & 8;
        }
        else {
          LOWORD(v19) = 0;
        }
        __int16 v20 = v17 | 0x410 | v19;
        if ((v16 & 8) != 0) {
          __int16 v20 = v18;
        }
        LODWORD(v11) = v20 & 0xAFF8 | (((v16 >> 7) & 1) << 14) | v16 & 2 | (v16 >> 2) & 1 | 0x1004;
      }
      a3[v8++] = v11;
    }
    while (v8 != v7);
  }
  return result;
}

void *sub_1B6E19808(void *result, int a2, unsigned char *a3, unsigned int a4)
{
  uint64_t v4 = result[3];
  uint64_t v5 = (int *)(result[9] + 4 * *(int *)(v4 + 8 * a2 + 4));
  uint64_t v6 = *(unsigned int *)(v4 + 8 * a2);
  if ((a4 & 0x80000000) != 0)
  {
    if ((int)v6 >= 1)
    {
      do
      {
        uint64_t v10 = *v5++;
        *a3++ = *(unsigned char *)(result[30] + v10);
        --v6;
      }
      while (v6);
    }
  }
  else if ((int)v6 >= 1)
  {
    uint64_t v7 = *(void *)(result[57] + 8 * a4);
    do
    {
      uint64_t v8 = *v5++;
      char v9 = *(unsigned char *)(result[30] + v8);
      if (*(unsigned char *)(*(void *)(v7 + 48) + v8)) {
        v9 |= 6u;
      }
      *a3++ = v9;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t sub_1B6E1988C(unsigned __int16 *a1, int a2)
{
  uint64_t result = *a1;
  if (a2 >= 2)
  {
    uint64_t v4 = a1 + 1;
    uint64_t v5 = a2 - 1;
    do
    {
      int v6 = *v4++;
      uint64_t result = v6 | result;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t sub_1B6E198BC(uint64_t a1, int **a2)
{
  uint64_t v2 = *(void *)(a1 + 432);
  uint64_t result = *(unsigned __int16 *)(v2 + 2 * **a2);
  uint64_t v4 = *((unsigned int *)a2 + 2);
  if ((int)v4 >= 2)
  {
    uint64_t v5 = *a2 + 1;
    uint64_t v6 = v4 - 1;
    do
    {
      uint64_t v7 = *v5++;
      uint64_t result = *(unsigned __int16 *)(v2 + 2 * v7) | result;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t sub_1B6E198F8(void *a1, int a2, unsigned int a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1[3];
  uint64_t v6 = *(int *)(v5 + 8 * a2 + 4);
  uint64_t v7 = a1[6];
  size_t v8 = *(unsigned int *)(v5 + 8 * a2);
  if ((a3 & 0x80000000) != 0)
  {
    uint64_t v26 = a1[54];
    uint64_t v12 = *(unsigned __int16 *)(v26 + 2 * *(int *)(v7 + 4 * v6));
    if ((int)v8 >= 2)
    {
      size_t v27 = v8 - 1;
      uint64_t v28 = (int *)(v7 + 4 * v6 + 4);
      do
      {
        uint64_t v29 = *v28++;
        uint64_t v12 = *(unsigned __int16 *)(v26 + 2 * v29) | v12;
        --v27;
      }
      while (v27);
    }
  }
  else
  {
    char v9 = *(void **)(a1[57] + 8 * a3);
    uint64_t v10 = v32;
    uint64_t v31 = v32;
    __p = 0;
    if (v8 >= 0x41)
    {
      uint64_t v10 = operator new(v8);
      __p = v10;
      uint64_t v31 = v10;
    }
    sub_1B6E10B04(v9, a2, (uint64_t)v10);
    uint64_t v11 = a1[54];
    uint64_t v12 = *(unsigned __int16 *)(v11 + 2 * *(int *)(v7 + 4 * v6));
    unsigned int v13 = *v31;
    if (v13)
    {
      if ((v13 & 0x80u) == 0) {
        int v14 = ~(v13 >> 3) & 8;
      }
      else {
        LOWORD(v14) = 0;
      }
      __int16 v15 = v12 & 0xD867 | v14 | 0x410;
      if ((v13 & 8) != 0) {
        __int16 v15 = v12 & 0xD867 | 0x2200;
      }
      uint64_t v12 = v15 & 0xAFF8 | (((v13 >> 7) & 1) << 14) | v13 & 2 | (v13 >> 2) & 1 | 0x1004;
    }
    if ((int)v8 >= 2)
    {
      unsigned int v16 = v31 + 1;
      __int16 v17 = (int *)(v7 + 4 * v6 + 4);
      size_t v18 = v8 - 1;
      do
      {
        uint64_t v19 = *v17++;
        int v20 = *(unsigned __int16 *)(v11 + 2 * v19);
        LODWORD(v19) = *v16++;
        unsigned int v21 = v19;
        if (v19)
        {
          __int16 v22 = v20 & 0xD867;
          __int16 v23 = v22 | 0x2200;
          if ((v21 & 0x80u) == 0) {
            int v24 = ~(v21 >> 3) & 8;
          }
          else {
            LOWORD(v24) = 0;
          }
          __int16 v25 = v22 | v24 | 0x410;
          if ((v21 & 8) != 0) {
            __int16 v25 = v23;
          }
          int v20 = v25 & 0xAFF8 | (((v21 >> 7) & 1) << 14) | v21 & 2 | (v21 >> 2) & 1 | 0x1004;
        }
        uint64_t v12 = v20 | v12;
        --v18;
      }
      while (v18);
    }
    operator delete(__p);
  }
  return v12;
}

uint64_t sub_1B6E19B0C(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 456) + 8 * a3);
  uint64_t v4 = *(int *)(v3[12] + 4 * a2);
  uint64_t v5 = v3[21];
  int v6 = *(unsigned __int16 *)(*(void *)(a1 + 432) + 2 * a2);
  unsigned int v7 = *(unsigned __int8 *)(v5 + v4);
  if ((v7 & 1) == 0) {
    return *(unsigned __int16 *)(*(void *)(a1 + 432) + 2 * a2);
  }
  uint64_t v9 = *(unsigned __int16 *)(v3[9] + 2 * a2);
  __int16 v10 = v6 & 0xD867;
  int v11 = ~(v7 >> 3) & 8;
  if ((v7 & 0x80u) != 0) {
    LOWORD(v11) = 0;
  }
  __int16 v12 = v10 | 0x410 | v11;
  if ((v7 & 8) != 0) {
    __int16 v13 = v6 & 0xD867 | 0x2200;
  }
  else {
    __int16 v13 = v12;
  }
  uint64_t result = v13 & 0xAFF8 | (((v7 >> 7) & 1) << 14) | v7 & 2 | (v7 >> 2) & 1 | 0x1004;
  if (v9 >= 2)
  {
    int v14 = (unsigned __int8 *)(v4 + v5 + 1);
    uint64_t v15 = v9 - 1;
    do
    {
      unsigned int v17 = *v14++;
      unsigned int v16 = v17;
      int v18 = v6;
      if (v17)
      {
        if ((v16 & 0x80u) == 0) {
          int v19 = ~(v16 >> 3) & 8;
        }
        else {
          LOWORD(v19) = 0;
        }
        __int16 v20 = v10 | v19 | 0x410;
        if ((v16 & 8) != 0) {
          __int16 v20 = v6 & 0xD867 | 0x2200;
        }
        int v18 = v20 & 0xAFF8 | (((v16 >> 7) & 1) << 14) | v16 & 2 | (v16 >> 2) & 1 | 0x1004;
      }
      uint64_t result = v18 | result;
      --v15;
    }
    while (v15);
  }
  return result;
}

uint64_t sub_1B6E19C00(void *a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = a1[33];
  uint64_t v5 = *(unsigned int *)(v4 + 8 * a2);
  if ((int)v5 < 1) {
    return 0;
  }
  int v6 = 0;
  uint64_t v7 = *(int *)(v4 + 8 * a2 + 4);
  size_t v8 = (int *)(a1[36] + 4 * v7);
  uint64_t v9 = (__int16 *)(a1[39] + 2 * v7);
  int v10 = *(_DWORD *)(a1[42] + 8 * a2);
  uint64_t v11 = (v5 - 1);
  uint64_t v12 = v5;
  do
  {
    int v14 = *v8++;
    int v13 = v14;
    if ((a4 & 0x80000000) != 0)
    {
      int v18 = (int *)(a1[3] + 4 * ((2 * v13) | 1));
      unsigned int v16 = a1 + 6;
    }
    else
    {
      uint64_t v15 = *(uint64_t **)(a1[57] + 8 * a4);
      uint64_t v17 = *v15;
      unsigned int v16 = v15 + 3;
      int v18 = (int *)(*(void *)(v17 + 24) + 4 * ((2 * v13) | 1));
    }
    uint64_t v19 = *v16 + 4 * *v18;
    __int16 v20 = *v9;
    unsigned int v21 = (_DWORD *)(a3 + 4 * v6);
    _DWORD *v21 = *(_DWORD *)(v19 + 4 * ((*v9 + 1) & 3));
    uint64_t v22 = v6 + 2;
    v21[1] = *(_DWORD *)(v19 + 4 * (((_BYTE)v20 + 2) & 3));
    if (v10 > (int)v5 && !v11)
    {
      *(_DWORD *)(a3 + 4 * v22) = *(_DWORD *)(v19 + 4 * (((_BYTE)v20 - 1) & 3));
      uint64_t v22 = (v6 + 3);
    }
    --v11;
    ++v9;
    int v6 = v22;
    --v12;
  }
  while (v12);
  return v22;
}

uint64_t sub_1B6E19D0C(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 456) + 8 * a3);
  return v3[3] + 4 * *(int *)(*(void *)(*v3 + 24) + 8 * a2 + 4);
}

uint64_t sub_1B6E19D3C(void *a1, int a2, unsigned __int16 *a3, uint64_t a4, unsigned int a5)
{
  int v5 = *a3;
  if (!*a3) {
    return 0;
  }
  int v6 = 0;
  uint64_t v7 = a1[33];
  uint64_t v8 = *(int *)(v7 + 8 * a2 + 4);
  uint64_t v9 = a1[36] + 4 * v8;
  int v10 = *(_DWORD *)(v7 + 8 * a2);
  uint64_t v11 = a1[39] + 2 * v8;
  int v12 = a3[1];
  do
  {
    uint64_t v13 = (v12 % v10);
    int v14 = *(_DWORD *)(v9 + 4 * v13);
    if ((a5 & 0x80000000) != 0)
    {
      int v18 = (int *)(a1[3] + 4 * ((2 * v14) | 1));
      unsigned int v16 = a1 + 6;
    }
    else
    {
      uint64_t v15 = *(uint64_t **)(a1[57] + 8 * a5);
      uint64_t v17 = *v15;
      unsigned int v16 = v15 + 3;
      int v18 = (int *)(*(void *)(v17 + 24) + 4 * ((2 * v14) | 1));
    }
    uint64_t v19 = *v16 + 4 * *v18;
    __int16 v20 = *(_WORD *)(v11 + 2 * v13);
    unsigned int v21 = (_DWORD *)(a4 + 4 * v6);
    _DWORD *v21 = *(_DWORD *)(v19 + 4 * (((_BYTE)v20 + 1) & 3));
    uint64_t v22 = v6 + 2;
    v21[1] = *(_DWORD *)(v19 + 4 * (((_BYTE)v20 + 2) & 3));
    if (v5 == 1 && (a3[2] & 1) == 0)
    {
      *(_DWORD *)(a4 + 4 * v22) = *(_DWORD *)(v19 + 4 * (((_BYTE)v20 - 1) & 3));
      uint64_t v22 = (v6 + 3);
    }
    ++v12;
    int v6 = v22;
    --v5;
  }
  while (v5);
  return v22;
}

uint64_t sub_1B6E19E44(void *a1, int a2, _DWORD *a3, int a4, unsigned int a5)
{
  int v5 = (int *)((char *)&unk_1B6ED08B4 + 4 * a4);
  int v6 = (2 * a2) | 1;
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[6];
  uint64_t v9 = v8 + 4 * *(int *)(v7 + 4 * v6);
  if ((a5 & 0x80000000) != 0)
  {
    uint64_t v11 = a5;
    uint64_t v13 = v9;
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v11 = a5;
    int v12 = *(void **)(a1[57] + 8 * a5);
    uint64_t v13 = v12[3] + 4 * *(int *)(*(void *)(*v12 + 24) + 4 * v10);
  }
  uint64_t v14 = 0;
  *a3 = *(_DWORD *)(v13 + 4 * *v5);
  a3[1] = *(_DWORD *)(v13 + 4 * v5[1]);
  a3[2] = *(_DWORD *)(v13 + 4 * v5[2]);
  a3[3] = *(_DWORD *)(v13 + 4 * v5[3]);
  uint64_t v15 = a1[36];
  uint64_t v16 = a1[33];
  uint64_t v17 = a1[39];
  int v18 = a3 + 6;
  do
  {
    uint64_t v19 = *(int *)(v16 + 8 * *(int *)(v9 + 4 * v5[v14]) + 4);
    __int16 v20 = (_DWORD *)(v15 + 4 * v19);
    if (*v20 == a2)
    {
      char v21 = 0;
    }
    else if (v20[1] == a2)
    {
      char v21 = 1;
    }
    else if (v20[2] == a2)
    {
      char v21 = 2;
    }
    else if (v20[3] == a2)
    {
      char v21 = 3;
    }
    else
    {
      char v21 = -1;
    }
    uint64_t v22 = (v21 + 2) & 3;
    int v23 = v20[v22];
    if ((a5 & 0x80000000) != 0)
    {
      uint64_t v25 = v8 + 4 * *(int *)(v7 + 4 * ((2 * v23) | 1));
    }
    else
    {
      int v24 = *(void **)(a1[57] + 8 * v11);
      uint64_t v25 = v24[3] + 4 * *(int *)(*(void *)(*v24 + 24) + 4 * ((2 * v23) | 1));
    }
    char v26 = *(_WORD *)(v17 + 2 * v19 + 2 * v22);
    ++v14;
    *(v18 - 2) = *(_DWORD *)(v25 + 4 * ((v26 + 1) & 3));
    *(v18 - 1) = *(_DWORD *)(v25 + 4 * ((v26 + 2) & 3));
    *int v18 = *(_DWORD *)(v25 + 4 * ((v26 - 1) & 3));
    v18 += 3;
  }
  while (v14 != 4);
  return 16;
}

uint64_t sub_1B6E19FE4(void *a1, int a2, _DWORD *a3, int a4, unsigned int a5)
{
  uint64_t v5 = 0;
  uint64_t v6 = (2 * a2) | 1;
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[6];
  uint64_t v9 = v8 + 4 * *(int *)(v7 + 4 * v6);
  uint64_t v10 = a1[36];
  uint64_t v11 = a1[33];
  uint64_t v12 = *(int *)(v11 + 8 * *(int *)(v9 + 4 * (((_BYTE)a4 + 2) & 3)) + 4);
  uint64_t v13 = v10 + 4 * v12;
  uint64_t v14 = *(int *)(v11 + 8 * *(int *)(v9 + 4 * (((_BYTE)a4 - 1) & 3)) + 4);
  uint64_t v15 = v10 + 4 * v14;
  uint64_t v16 = a1[39];
  uint64_t v17 = v16 + 2 * v12;
  char v18 = -1;
  char v19 = -1;
  do
  {
    if (*(_DWORD *)(v13 + 4 * v5) == a2) {
      char v18 = v5;
    }
    if (*(_DWORD *)(v15 + 4 * v5) == a2) {
      char v19 = v5;
    }
    ++v5;
  }
  while (v5 != 4);
  unsigned int v20 = (v18 + 2) & 3;
  unsigned int v21 = (v19 + 2) & 3;
  unsigned int v22 = (v19 - 1) & 3;
  uint64_t v23 = *(int *)(v13 + 4 * ((v18 + 1) & 3));
  uint64_t v24 = *(int *)(v13 + 4 * ((v18 + 2) & 3));
  __int16 v25 = *(_WORD *)(v17 + 2 * ((v18 + 1) & 3));
  __int16 v26 = *(_WORD *)(v17 + 2 * v20);
  uint64_t v27 = v16 + 2 * v14;
  __int16 v28 = *(_WORD *)(v27 + 2 * v21);
  __int16 v29 = *(_WORD *)(v27 + 2 * v22);
  if ((a5 & 0x80000000) == 0)
  {
    int v30 = *(void **)(a1[57] + 8 * a5);
    uint64_t v7 = *(void *)(*v30 + 24);
    uint64_t v8 = v30[3];
    uint64_t v9 = v8 + 4 * *(int *)(v7 + 4 * v6);
  }
  uint64_t v31 = *(int *)(v7 + 8 * v23 + 4);
  uint64_t v32 = *(int *)(v7 + 8 * v24 + 4);
  uint64_t v33 = *(int *)(v7 + 8 * *(int *)(v15 + 4 * v21) + 4);
  uint64_t v34 = *(int *)(v7 + 8 * *(int *)(v15 + 4 * v22) + 4);
  *a3 = *(_DWORD *)(v9 + 4 * (((_BYTE)a4 + 1) & 3));
  a3[1] = *(_DWORD *)(v9 + 4 * (((_BYTE)a4 + 2) & 3));
  a3[2] = *(_DWORD *)(v9 + 4 * (((_BYTE)a4 - 1) & 3));
  a3[3] = *(_DWORD *)(v9 + 4 * a4);
  uint64_t v35 = v8 + 4 * v32;
  a3[4] = *(_DWORD *)(v8 + 4 * v31 + 4 * (((_BYTE)v25 + 2) & 3));
  a3[5] = *(_DWORD *)(v35 + 4 * (((_BYTE)v26 + 1) & 3));
  a3[6] = *(_DWORD *)(v35 + 4 * (((_BYTE)v26 + 2) & 3));
  int v36 = *(_DWORD *)(v35 + 4 * (((_BYTE)v26 - 1) & 3));
  uint64_t v37 = v8 + 4 * v33;
  a3[7] = v36;
  a3[8] = *(_DWORD *)(v37 + 4 * (((_BYTE)v28 + 1) & 3));
  a3[9] = *(_DWORD *)(v37 + 4 * (((_BYTE)v28 + 2) & 3));
  a3[10] = *(_DWORD *)(v37 + 4 * (((_BYTE)v28 - 1) & 3));
  a3[11] = *(_DWORD *)(v8 + 4 * v34 + 4 * (((_BYTE)v29 + 2) & 3));
  return 12;
}

uint64_t sub_1B6E1A1C4(void *a1, int a2, _DWORD *a3, int a4, unsigned int a5)
{
  int v5 = (2 * a2) | 1;
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[6];
  uint64_t v8 = v7 + 4 * *(int *)(v6 + 4 * v5);
  uint64_t v9 = *(int *)(v8 + 4 * (((_BYTE)a4 + 2) & 3));
  int v10 = 2 * v9;
  uint64_t v11 = a1[33];
  uint64_t v12 = *(int *)(v11 + 8 * v9 + 4);
  uint64_t v13 = a1[36] + 4 * v12;
  uint64_t v14 = *(unsigned int *)(v11 + 4 * v10);
  uint64_t v15 = a1[39] + 2 * v12;
  if ((int)v14 < 1)
  {
LABEL_5:
    LOBYTE(v16) = -1;
  }
  else
  {
    uint64_t v16 = 0;
    while (*(_DWORD *)(v13 + 4 * v16) != a2)
    {
      if (v14 == ++v16) {
        goto LABEL_5;
      }
    }
  }
  unsigned int v17 = ((_BYTE)v16 - 1) & 3;
  uint64_t v18 = *(int *)(v13 + 4 * (((_BYTE)v16 + 1) & 3));
  uint64_t v19 = *(int *)(v13 + 4 * (((_BYTE)v16 + 2) & 3));
  uint64_t v20 = *(int *)(v13 + 4 * (((_BYTE)v16 - 1) & 3));
  __int16 v21 = *(_WORD *)(v15 + 2 * (((_BYTE)v16 + 1) & 3));
  __int16 v22 = *(_WORD *)(v15 + 2 * (((_BYTE)v16 + 2) & 3));
  __int16 v23 = *(_WORD *)(v15 + 2 * v17);
  if ((a5 & 0x80000000) == 0)
  {
    uint64_t v24 = *(void **)(a1[57] + 8 * a5);
    uint64_t v6 = *(void *)(*v24 + 24);
    uint64_t v7 = v24[3];
    uint64_t v8 = v7 + 4 * *(int *)(v6 + 4 * v5);
  }
  uint64_t v25 = *(int *)(v6 + 8 * v18 + 4);
  uint64_t v26 = *(int *)(v6 + 8 * v19 + 4);
  uint64_t v27 = *(int *)(v6 + 8 * v20 + 4);
  *a3 = *(_DWORD *)(v8 + 4 * a4);
  a3[1] = *(_DWORD *)(v8 + 4 * (((_BYTE)a4 + 1) & 3));
  a3[2] = *(_DWORD *)(v8 + 4 * (((_BYTE)a4 + 2) & 3));
  a3[3] = *(_DWORD *)(v8 + 4 * (((_BYTE)a4 - 1) & 3));
  uint64_t v28 = v7 + 4 * v26;
  a3[4] = *(_DWORD *)(v7 + 4 * v25 + 4 * (((_BYTE)v21 + 2) & 3));
  a3[5] = *(_DWORD *)(v28 + 4 * (((_BYTE)v22 + 1) & 3));
  a3[6] = *(_DWORD *)(v28 + 4 * (((_BYTE)v22 + 2) & 3));
  a3[7] = *(_DWORD *)(v28 + 4 * (((_BYTE)v22 - 1) & 3));
  a3[8] = *(_DWORD *)(v7 + 4 * v27 + 4 * (((_BYTE)v23 + 2) & 3));
  return 9;
}

uint64_t sub_1B6E1A334(void *a1, int a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = *(int *)(v4 + 8 * a2 + 4);
  uint64_t v6 = *(unsigned int *)(v4 + 8 * a2);
  uint64_t v7 = (int *)(a1[6] + 4 * v5);
  uint64_t v8 = a1[54];
  if ((int)v6 < 2)
  {
    __int16 v11 = *(_WORD *)(v8 + 2 * *v7);
  }
  else
  {
    uint64_t v9 = v6 - 1;
    int v10 = v7 + 1;
    __int16 v11 = *(_WORD *)(v8 + 2 * *v7);
    do
    {
      uint64_t v12 = *v10++;
      v11 |= *(_WORD *)(v8 + 2 * v12);
      --v9;
    }
    while (v9);
  }
  if ((v11 & 0x707) != 0x200) {
    return 0;
  }
  uint64_t v13 = ((*(_WORD *)(v8 + 2 * *v7) & 0x780) == 512) | (2 * ((*(_WORD *)(v8 + 2 * v7[1]) & 0x780) == 512)) | (4 * ((*(_WORD *)(v8 + 2 * v7[2]) & 0x780) == 512)) | (8 * ((*(_WORD *)(v8 + 2 * v7[3]) & 0x780) == 512));
  if ((0xEDB7uLL >> v13)) {
    return 0;
  }
  int v14 = dword_1B6ED08D0[v13];
  uint64_t v15 = a1[45];
  uint64_t v16 = a1[42];
  unsigned int v17 = (int *)(v15 + 4 * *(int *)(v16 + 8 * v7[v14] + 4));
  uint64_t v18 = a1[27];
  if (*(float *)(v18 + 4 * *v17) != *(float *)(v18 + 4 * v17[2])) {
    return 0;
  }
  if (*(float *)(v18 + 4 * v17[1]) != *(float *)(v18 + 4 * v17[3])) {
    return 0;
  }
  uint64_t v19 = (int *)(v15 + 4 * *(int *)(v16 + 8 * v7[((_BYTE)v14 + 1) & 3] + 4));
  if (*(float *)(v18 + 4 * *v19) != *(float *)(v18 + 4 * v19[2])
    || *(float *)(v18 + 4 * v19[1]) != *(float *)(v18 + 4 * v19[3]))
  {
    return 0;
  }
  if (a3) {
    *a3 = *(_DWORD *)(v18 + 4 * *(int *)(a1[9] + 4 * v5 + 4 * v14));
  }
  if (a4) {
    *a4 = v14;
  }
  return 1;
}

uint64_t sub_1B6E1A4D0(void *a1, int a2, int a3)
{
  uint64_t v3 = a1[42];
  uint64_t v4 = (int *)(a1[45] + 4 * *(int *)(v3 + 8 * a2 + 4));
  uint64_t v5 = *(unsigned int *)(v3 + 8 * a2);
  if (a2 == a3)
  {
    if ((int)v5 >= 1)
    {
      uint64_t v6 = a1[15];
      while (1)
      {
        uint64_t v8 = *v4++;
        uint64_t result = v8;
        if (*(_DWORD *)(v6 + 8 * v8) == *(_DWORD *)(v6 + 8 * v8 + 4)) {
          break;
        }
        if (!--v5) {
          return 0xFFFFFFFFLL;
        }
      }
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  if ((int)v5 < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = a1[15];
  while (1)
  {
    uint64_t v10 = *v4++;
    uint64_t result = v10;
    __int16 v11 = (_DWORD *)(v9 + 8 * v10);
    if (*v11 == a3 || v11[1] == a3) {
      break;
    }
    if (!--v5) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

BOOL sub_1B6E1A564(int *a1)
{
  int v2 = a1[2];
  unint64_t v3 = *a1;
  uint64_t v4 = a1 + 66;
  sub_1B642863C((uint64_t)(a1 + 66), 2 * v2);
  sub_1B642863C((uint64_t)(a1 + 84), 2 * v2);
  sub_1B642860C((uint64_t)(a1 + 102), v2);
  sub_1B6E1BBD4((uint64_t)(a1 + 108), v2);
  bzero(*((void **)a1 + 54), 2 * a1[2]);
  *a1 = v3;
  sub_1B642863C((uint64_t)(a1 + 6), 2 * v3);
  uint64_t v5 = (char *)*((void *)a1 + 12);
  unint64_t v6 = *((void *)a1 + 13) - (void)v5;
  if (v3 <= v6)
  {
    if (v3 < v6) {
      *((void *)a1 + 13) = &v5[v3];
    }
  }
  else
  {
    sub_1B6E1BCF8((void **)a1 + 12, v3 - v6);
    uint64_t v5 = (char *)*((void *)a1 + 12);
  }
  bzero(v5, *a1);
  a1[1] = 0;
  sub_1B642863C((uint64_t)(a1 + 36), 0);
  sub_1B642860C((uint64_t)(a1 + 54), 0);
  uint64_t v7 = *((void *)a1 + 30);
  if (*((void *)a1 + 31) != v7) {
    *((void *)a1 + 31) = v7;
  }
  sub_1B642863C((uint64_t)(a1 + 18), (int)((uint64_t)(*((void *)a1 + 7) - *((void *)a1 + 6)) >> 2));
  int v8 = 4 * v2;
  unint64_t v9 = 4 * v2;
  sub_1B6427A50((void **)a1 + 15, v8);
  sub_1B6427A50((void **)a1 + 21, v9);
  sub_1B6427A50((void **)a1 + 18, v9);
  int v10 = 2;
  v176 = a1 + 36;
  v177 = a1 + 42;
  v179[0] = 0;
  v179[1] = 0;
  v178 = (uint64_t *)v179;
  uint64_t v11 = *((void *)a1 + 18);
  unint64_t v12 = (unint64_t)(*((void *)a1 + 19) - v11) >> 2;
  if ((v12 & 0x80000000) == 0) {
    int v13 = (unint64_t)(*((void *)a1 + 19) - v11) >> 2;
  }
  else {
    int v13 = v12 + 1;
  }
  int v14 = v13 >> 1;
  int v174 = v14;
  int v175 = 2;
  if ((int)v12 >= 2)
  {
    uint64_t v15 = 0;
    uint64_t v16 = (_DWORD *)(v11 + 4);
    do
    {
      *(v16 - 1) = 0;
      _DWORD *v16 = v175 * v15;
      v16 += 2;
      ++v15;
      int v14 = v174;
    }
    while (v15 < v174);
    int v10 = v175;
  }
  sub_1B642863C((uint64_t)(a1 + 42), v14 * v10);
  int v17 = 6;
  v170 = v4;
  uint64_t v171 = a1 + 72;
  v173[0] = 0;
  v173[1] = 0;
  uint64_t v172 = v173;
  uint64_t v18 = *((void *)a1 + 33);
  unint64_t v19 = (unint64_t)(*((void *)a1 + 34) - v18) >> 2;
  if ((v19 & 0x80000000) == 0) {
    int v20 = (unint64_t)(*((void *)a1 + 34) - v18) >> 2;
  }
  else {
    int v20 = v19 + 1;
  }
  int v21 = v20 >> 1;
  int v168 = v21;
  int v169 = 6;
  if ((int)v19 < 2)
  {
    int v24 = 6;
  }
  else
  {
    uint64_t v22 = 0;
    __int16 v23 = (_DWORD *)(v18 + 4);
    do
    {
      *(v23 - 1) = 0;
      _DWORD *v23 = v169 * v22;
      v23 += 2;
      ++v22;
      int v21 = v168;
    }
    while (v22 < v168);
    int v24 = v169;
  }
  sub_1B642863C((uint64_t)(a1 + 72), v21 * v24);
  uint64_t v164 = a1 + 84;
  v165 = a1 + 90;
  v167[0] = 0;
  v167[1] = 0;
  v166 = (uint64_t *)v167;
  uint64_t v25 = *((void *)a1 + 42);
  unint64_t v26 = (unint64_t)(*((void *)a1 + 43) - v25) >> 2;
  if ((v26 & 0x80000000) == 0) {
    int v27 = (unint64_t)(*((void *)a1 + 43) - v25) >> 2;
  }
  else {
    int v27 = v26 + 1;
  }
  int v28 = v27 >> 1;
  int v162 = v28;
  int v163 = 6;
  if ((int)v26 > 1)
  {
    uint64_t v29 = 0;
    int v30 = (_DWORD *)(v25 + 4);
    do
    {
      *(v30 - 1) = 0;
      *int v30 = v163 * v29;
      v30 += 2;
      ++v29;
      int v28 = v162;
    }
    while (v29 < v162);
    int v17 = v163;
  }
  uint64_t v31 = (void **)(a1 + 30);
  sub_1B642863C((uint64_t)(a1 + 90), v28 * v17);
  __p = 0;
  uint64_t v160 = 0;
  v161 = 0;
  if ((int)v3 >= 1)
  {
    uint64_t v32 = 0;
    int v155 = (int **)(a1 + 34);
    uint64_t v154 = v3;
    while (1)
    {
      uint64_t v33 = (unsigned int *)(*((void *)a1 + 3) + 8 * v32);
      uint64_t v34 = *v33;
      if ((int)v34 >= 1) {
        break;
      }
LABEL_197:
      if (++v32 == v154) {
        goto LABEL_198;
      }
    }
    uint64_t v35 = 0;
    uint64_t v36 = (int)v33[1];
    uint64_t v157 = *((void *)a1 + 9) + 4 * v36;
    uint64_t v158 = *((void *)a1 + 6) + 4 * v36;
    uint64_t v156 = v34;
    while (1)
    {
      int v37 = *(_DWORD *)(v158 + 4 * v35);
      uint64_t v38 = v35 + 1;
      uint64_t v39 = (v35 + 1);
      if (v35 + 1 == v34) {
        uint64_t v39 = 0;
      }
      int v40 = *(_DWORD *)(v158 + 4 * v39);
      if (v37 == v40)
      {
        __int32 v41 = v160;
        if (v160 < v161)
        {
          *(_DWORD *)uint64_t v160 = a1[1];
          unint64_t v42 = v160 + 4;
LABEL_64:
          uint64_t v160 = v42;
LABEL_65:
          LODWORD(v52) = a1[1];
          a1[1] = v52 + 1;
          BOOL v62 = (int *)*((void *)a1 + 16);
          uint64_t v61 = (int *)*((void *)a1 + 17);
          if (v62 >= v61)
          {
            BOOL v64 = (int *)*v31;
            uint64_t v65 = ((char *)v62 - (unsigned char *)*v31) >> 2;
            unint64_t v66 = v65 + 1;
            if ((unint64_t)(v65 + 1) >> 62) {
              goto LABEL_217;
            }
            uint64_t v67 = (char *)v61 - (char *)v64;
            if (v67 >> 1 > v66) {
              unint64_t v66 = v67 >> 1;
            }
            if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v68 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v68 = v66;
            }
            if (v68)
            {
              int v69 = (char *)sub_1B64282E0((uint64_t)v155, v68);
              BOOL v64 = (int *)*((void *)a1 + 15);
              BOOL v62 = (int *)*((void *)a1 + 16);
            }
            else
            {
              int v69 = 0;
            }
            uint64_t v70 = (int *)&v69[4 * v65];
            *uint64_t v70 = v37;
            uint64_t v63 = v70 + 1;
            while (v62 != v64)
            {
              int v71 = *--v62;
              *--uint64_t v70 = v71;
            }
            uint64_t v61 = (int *)&v69[4 * v68];
            *((void *)a1 + 15) = v70;
            *((void *)a1 + 16) = v63;
            *((void *)a1 + 17) = v61;
            if (v64)
            {
              operator delete(v64);
              uint64_t v61 = *v155;
            }
          }
          else
          {
            *BOOL v62 = v37;
            uint64_t v63 = v62 + 1;
          }
          *((void *)a1 + 16) = v63;
          if (v63 >= v61)
          {
            uint64_t v73 = (int *)*v31;
            uint64_t v74 = ((char *)v63 - (unsigned char *)*v31) >> 2;
            unint64_t v75 = v74 + 1;
            if ((unint64_t)(v74 + 1) >> 62) {
              goto LABEL_217;
            }
            uint64_t v76 = (char *)v61 - (char *)v73;
            if (v76 >> 1 > v75) {
              unint64_t v75 = v76 >> 1;
            }
            if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v77 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v77 = v75;
            }
            if (v77)
            {
              uint64_t v78 = (char *)sub_1B64282E0((uint64_t)v155, v77);
              uint64_t v73 = (int *)*((void *)a1 + 15);
              uint64_t v63 = (int *)*((void *)a1 + 16);
            }
            else
            {
              uint64_t v78 = 0;
            }
            unint64_t v79 = (int *)&v78[4 * v74];
            *unint64_t v79 = v40;
            uint64_t v72 = v79 + 1;
            while (v63 != v73)
            {
              int v80 = *--v63;
              *--unint64_t v79 = v80;
            }
            *((void *)a1 + 15) = v79;
            *((void *)a1 + 16) = v72;
            *((void *)a1 + 17) = &v78[4 * v77];
            if (v73) {
              operator delete(v73);
            }
          }
          else
          {
            *uint64_t v63 = v40;
            uint64_t v72 = v63 + 1;
          }
          *((void *)a1 + 16) = v72;
          uint64_t v81 = v176;
          v82 = (int *)*((void *)v176 + 1);
          unint64_t v83 = *((void *)v176 + 2);
          if ((unint64_t)v82 >= v83)
          {
            int v85 = *(int **)v176;
            uint64_t v86 = ((uint64_t)v82 - *(void *)v176) >> 2;
            unint64_t v87 = v86 + 1;
            if ((unint64_t)(v86 + 1) >> 62) {
              goto LABEL_217;
            }
            uint64_t v88 = v83 - (void)v85;
            if (v88 >> 1 > v87) {
              unint64_t v87 = v88 >> 1;
            }
            if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v89 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v89 = v87;
            }
            if (v89)
            {
              uint64_t v90 = (char *)sub_1B64282E0((uint64_t)(v176 + 4), v89);
              int v85 = *(int **)v81;
              v82 = (int *)*((void *)v81 + 1);
            }
            else
            {
              uint64_t v90 = 0;
            }
            uint64_t v91 = &v90[4 * v86];
            *(_DWORD *)uint64_t v91 = 0;
            uint64_t v84 = v91 + 4;
            while (v82 != v85)
            {
              int v92 = *--v82;
              *((_DWORD *)v91 - 1) = v92;
              v91 -= 4;
            }
            *(void *)uint64_t v81 = v91;
            *((void *)v81 + 1) = v84;
            *((void *)v81 + 2) = &v90[4 * v89];
            if (v85) {
              operator delete(v85);
            }
          }
          else
          {
            int *v82 = 0;
            uint64_t v84 = v82 + 1;
          }
          *((void *)v81 + 1) = v84;
          uint64_t v93 = v176;
          int v94 = v175 * v174;
          unint64_t v95 = (int *)*((void *)v176 + 1);
          unint64_t v96 = *((void *)v176 + 2);
          if ((unint64_t)v95 >= v96)
          {
            v98 = *(int **)v176;
            uint64_t v99 = ((uint64_t)v95 - *(void *)v176) >> 2;
            unint64_t v100 = v99 + 1;
            if ((unint64_t)(v99 + 1) >> 62) {
              goto LABEL_217;
            }
            uint64_t v101 = v96 - (void)v98;
            if (v101 >> 1 > v100) {
              unint64_t v100 = v101 >> 1;
            }
            if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v102 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v102 = v100;
            }
            if (v102)
            {
              unint64_t v103 = (char *)sub_1B64282E0((uint64_t)(v176 + 4), v102);
              v98 = *(int **)v93;
              unint64_t v95 = (int *)*((void *)v93 + 1);
            }
            else
            {
              unint64_t v103 = 0;
            }
            uint64_t v104 = (int *)&v103[4 * v99];
            *uint64_t v104 = v94;
            unint64_t v97 = v104 + 1;
            while (v95 != v98)
            {
              int v105 = *--v95;
              *--uint64_t v104 = v105;
            }
            *(void *)uint64_t v93 = v104;
            *((void *)v93 + 1) = v97;
            *((void *)v93 + 2) = &v103[4 * v102];
            if (v98) {
              operator delete(v98);
            }
          }
          else
          {
            *unint64_t v95 = v94;
            unint64_t v97 = v95 + 1;
          }
          *((void *)v93 + 1) = v97;
          uint64_t v106 = ++v174;
          sub_1B642863C((uint64_t)v177, v175 * v106);
          sub_1B6E1B1F0((uint64_t)&v162, v37, v52);
          sub_1B6E1B1F0((uint64_t)&v162, v40, v52);
          uint64_t v31 = (void **)(a1 + 30);
          uint64_t v34 = v156;
          goto LABEL_130;
        }
        int v46 = __p;
        uint64_t v47 = (v160 - __p) >> 2;
        unint64_t v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 62) {
          goto LABEL_217;
        }
        uint64_t v49 = v161 - __p;
        if ((v161 - __p) >> 1 > v48) {
          unint64_t v48 = v49 >> 1;
        }
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v50 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50)
        {
          int v51 = (char *)sub_1B64282E0((uint64_t)&v161, v50);
          int v46 = __p;
          __int32 v41 = v160;
        }
        else
        {
          int v51 = 0;
        }
        uint64_t v58 = &v51[4 * v47];
        *(_DWORD *)uint64_t v58 = a1[1];
        unint64_t v42 = v58 + 4;
        while (v41 != v46)
        {
          int v59 = *((_DWORD *)v41 - 1);
          v41 -= 4;
          *((_DWORD *)v58 - 1) = v59;
          v58 -= 4;
        }
        int v60 = &v51[4 * v50];
        __p = v58;
        goto LABEL_62;
      }
      int v180 = *(_DWORD *)(v158 + 4 * v35);
      uint64_t v43 = *(unsigned int *)(*v164 + 8 * v37);
      if ((int)v43 <= v163)
      {
        uint64_t v45 = (char *)(*v165 + 4 * *(int *)(*v164 + 4 * ((2 * v37) | 1)));
      }
      else
      {
        v181[0] = &v180;
        __int32 v44 = sub_1B6E1BE00(&v166, &v180, (uint64_t)&unk_1B6E4FDF8, v181);
        uint64_t v45 = (char *)v44[5];
        uint64_t v43 = ((unint64_t)((char *)v44[6] - v45) >> 2);
      }
      if ((int)v43 < 1) {
        goto LABEL_65;
      }
      while (1)
      {
        uint64_t v53 = *(int *)v45;
        v45 += 4;
        uint64_t v52 = v53;
        size_t v54 = (char *)*v31 + 8 * v53;
        if (*v54 == v40 || v54[1] == v40) {
          break;
        }
        if (!--v43) {
          goto LABEL_65;
        }
      }
      if (v52 == -1) {
        goto LABEL_65;
      }
      int v180 = v52;
      LODWORD(v55) = *(_DWORD *)(*(void *)v176 + 8 * v52);
      if ((int)v55 <= v175)
      {
        uint64_t v57 = *v177 + 4 * *(int *)(*(void *)v176 + 4 * (int)((2 * v52) | 1));
      }
      else
      {
        v181[0] = &v180;
        uint64_t v56 = sub_1B6E1BE00(&v178, &v180, (uint64_t)&unk_1B6E4FDF8, v181);
        uint64_t v57 = (uint64_t)v56[5];
        unint64_t v55 = ((unint64_t)v56[6] - v57) >> 2;
      }
      if (v32 == *(_DWORD *)(v57 + 4 * ((int)v55 - 1)))
      {
        int v108 = v160;
        int v107 = v161;
        if (v160 >= v161)
        {
          int v117 = __p;
          uint64_t v118 = (v160 - __p) >> 2;
          unint64_t v119 = v118 + 1;
          if ((unint64_t)(v118 + 1) >> 62) {
            goto LABEL_217;
          }
          uint64_t v120 = v161 - __p;
          if ((v161 - __p) >> 1 > v119) {
            unint64_t v119 = v120 >> 1;
          }
          if ((unint64_t)v120 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v121 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v121 = v119;
          }
          if (v121)
          {
            uint64_t v122 = (char *)sub_1B64282E0((uint64_t)&v161, v121);
            int v117 = __p;
            int v108 = v160;
          }
          else
          {
            uint64_t v122 = 0;
          }
          v124 = &v122[4 * v118];
          *(_DWORD *)v124 = v52;
          uint64_t v109 = v124 + 4;
          while (v108 != v117)
          {
            int v125 = *((_DWORD *)v108 - 1);
            v108 -= 4;
            *((_DWORD *)v124 - 1) = v125;
            v124 -= 4;
          }
          int v107 = &v122[4 * v121];
          __p = v124;
          v161 = v107;
          if (v117)
          {
            operator delete(v117);
            int v107 = v161;
          }
        }
        else
        {
          *(_DWORD *)uint64_t v160 = v52;
          uint64_t v109 = v160 + 4;
        }
        if (v109 < v107)
        {
          *(_DWORD *)uint64_t v109 = a1[1];
          unint64_t v42 = v109 + 4;
          goto LABEL_64;
        }
        int v46 = __p;
        uint64_t v126 = (v109 - __p) >> 2;
        unint64_t v127 = v126 + 1;
        if ((unint64_t)(v126 + 1) >> 62) {
          goto LABEL_217;
        }
        uint64_t v128 = v107 - __p;
        if (v128 >> 1 > v127) {
          unint64_t v127 = v128 >> 1;
        }
        if ((unint64_t)v128 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v129 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v129 = v127;
        }
        if (v129)
        {
          int v130 = (char *)sub_1B64282E0((uint64_t)&v161, v129);
          int v46 = __p;
        }
        else
        {
          int v130 = 0;
        }
        int v131 = &v130[4 * v126];
        *(_DWORD *)int v131 = a1[1];
        unint64_t v42 = v131 + 4;
        while (v109 != v46)
        {
          int v132 = *((_DWORD *)v109 - 1);
          v109 -= 4;
          *((_DWORD *)v131 - 1) = v132;
          v131 -= 4;
        }
        int v60 = &v130[4 * v129];
        __p = v131;
LABEL_62:
        v161 = v60;
        if (v46) {
          operator delete(v46);
        }
        goto LABEL_64;
      }
      if ((int)v55 >= 2) {
        break;
      }
      if (v37 == *((_DWORD *)*v31 + 2 * v52))
      {
        int v110 = v160;
        if (v160 < v161)
        {
LABEL_156:
          *(_DWORD *)int v110 = v52;
          v123 = v110 + 4;
LABEL_196:
          uint64_t v160 = v123;
          goto LABEL_130;
        }
        int v111 = __p;
        uint64_t v133 = (v160 - __p) >> 2;
        unint64_t v134 = v133 + 1;
        if ((unint64_t)(v133 + 1) >> 62) {
LABEL_217:
        }
          abort();
        uint64_t v135 = v161 - __p;
        if ((v161 - __p) >> 1 > v134) {
          unint64_t v134 = v135 >> 1;
        }
        if ((unint64_t)v135 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v115 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v115 = v134;
        }
        if (v115)
        {
          uint64_t v116 = (char *)sub_1B64282E0((uint64_t)&v161, v115);
          int v111 = __p;
          int v110 = v160;
        }
        else
        {
          uint64_t v116 = 0;
        }
        v136 = &v116[4 * v133];
        *(_DWORD *)v136 = v52;
        v123 = v136 + 4;
        while (v110 != v111)
        {
          int v138 = *((_DWORD *)v110 - 1);
          v110 -= 4;
          *((_DWORD *)v136 - 1) = v138;
          v136 -= 4;
        }
LABEL_194:
        __p = v136;
        v161 = &v116[4 * v115];
        if (v111) {
          operator delete(v111);
        }
        goto LABEL_196;
      }
LABEL_130:
      sub_1B6E1B1F0((uint64_t)&v174, v52, v32);
      sub_1B6E1B1F0((uint64_t)&v168, v37, v32);
      *(_DWORD *)(v157 + 4 * v35++) = v52;
      if (v38 == v34) {
        goto LABEL_197;
      }
    }
    int v110 = v160;
    if (v160 < v161) {
      goto LABEL_156;
    }
    int v111 = __p;
    uint64_t v112 = (v160 - __p) >> 2;
    unint64_t v113 = v112 + 1;
    if ((unint64_t)(v112 + 1) >> 62) {
      goto LABEL_217;
    }
    uint64_t v114 = v161 - __p;
    if ((v161 - __p) >> 1 > v113) {
      unint64_t v113 = v114 >> 1;
    }
    if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v115 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v115 = v113;
    }
    if (v115)
    {
      uint64_t v116 = (char *)sub_1B64282E0((uint64_t)&v161, v115);
      int v111 = __p;
      int v110 = v160;
    }
    else
    {
      uint64_t v116 = 0;
    }
    v136 = &v116[4 * v112];
    *(_DWORD *)v136 = v52;
    v123 = v136 + 4;
    while (v110 != v111)
    {
      int v137 = *((_DWORD *)v110 - 1);
      v110 -= 4;
      *((_DWORD *)v136 - 1) = v137;
      v136 -= 4;
    }
    goto LABEL_194;
  }
LABEL_198:
  int v139 = sub_1B6E1B3A4(&v174);
  int v140 = sub_1B6E1B3A4(&v168);
  int v141 = sub_1B6E1B3A4(&v162);
  int v142 = a1[5];
  if (v140 > v142) {
    int v142 = v140;
  }
  if (v141 <= v142) {
    int v143 = v142;
  }
  else {
    int v143 = v141;
  }
  a1[4] = v139;
  a1[5] = v143;
  if (v143 < 0x10000)
  {
    unint64_t v144 = a1[1];
    sub_1B642863C((uint64_t)(a1 + 36), 2 * v144);
    sub_1B642860C((uint64_t)(a1 + 54), v144);
    uint64_t v145 = *((void *)a1 + 30);
    unint64_t v146 = *((void *)a1 + 31) - v145;
    if (v144 <= v146)
    {
      uint64_t v147 = a1 + 60;
      __int16 v148 = a1 + 108;
      if (v144 < v146) {
        *((void *)a1 + 31) = v145 + v144;
      }
    }
    else
    {
      uint64_t v147 = a1 + 60;
      sub_1B6E1BCF8((void **)a1 + 30, v144 - v146);
      __int16 v148 = a1 + 108;
    }
    if ((int)v144 >= 1) {
      bzero(*((void **)a1 + 30), a1[1]);
    }
    unsigned int v149 = __p;
    if ((int)((unint64_t)(v160 - __p) >> 2) >= 1)
    {
      uint64_t v150 = 0;
      do
      {
        uint64_t v151 = *(int *)&v149[4 * v150];
        *(unsigned char *)(*v147 + v151) |= 1u;
        BOOL v152 = (int *)((char *)*v31 + 8 * v151);
        *(_WORD *)(*v148 + 2 * *v152) |= 1u;
        *(_WORD *)(*v148 + 2 * v152[1]) |= 1u;
        ++v150;
        unsigned int v149 = __p;
      }
      while (v150 < (int)((unint64_t)(v160 - __p) >> 2));
    }
    sub_1B6E1B614((uint64_t)a1);
    sub_1B6E1B680((uint64_t)a1);
  }
  if (__p) {
    operator delete(__p);
  }
  sub_1B6E1BEC8((uint64_t)&v166, v167[0]);
  sub_1B6E1BEC8((uint64_t)&v172, v173[0]);
  sub_1B6E1BEC8((uint64_t)&v178, v179[0]);
  return v143 < 0x10000;
}

void sub_1B6E1B1F0(uint64_t a1, int a2, int a3)
{
  int v25 = a2;
  uint64_t v5 = **(void **)(a1 + 8);
  int v6 = *(_DWORD *)(v5 + 8 * a2);
  uint64_t v7 = *(int *)(v5 + 8 * a2 + 4);
  if (v6 >= *(_DWORD *)(a1 + 4))
  {
    unint64_t v26 = &v25;
    int v8 = sub_1B6E1BE00((uint64_t **)(a1 + 24), &v25, (uint64_t)&unk_1B6E4FDF8, &v26);
    unint64_t v9 = (void **)(v8 + 5);
    uint64_t v10 = *(int *)(a1 + 4);
    if (v6 <= (int)v10)
    {
      sub_1B642863C((uint64_t)(v8 + 5), v10 + 1);
      memcpy(*v9, (const void *)(**(void **)(a1 + 16) + 4 * v7), 4 * *(int *)(a1 + 4));
      *((_DWORD *)*v9 + *(int *)(a1 + 4)) = a3;
    }
    else
    {
      uint64_t v11 = v8;
      uint64_t v12 = (uint64_t)(v8 + 7);
      int v13 = v8[7];
      int v14 = (char *)v8[6];
      if (v14 >= (char *)v13)
      {
        uint64_t v16 = (char *)*v9;
        uint64_t v17 = (v14 - (unsigned char *)*v9) >> 2;
        unint64_t v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 62) {
          abort();
        }
        uint64_t v19 = (char *)v13 - v16;
        if (v19 >> 1 > v18) {
          unint64_t v18 = v19 >> 1;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20)
        {
          int v21 = (char *)sub_1B64282E0(v12, v20);
          uint64_t v16 = (char *)v11[5];
          int v14 = (char *)v11[6];
        }
        else
        {
          int v21 = 0;
        }
        uint64_t v22 = &v21[4 * v17];
        __int16 v23 = (uint64_t *)&v21[4 * v20];
        *(_DWORD *)uint64_t v22 = a3;
        uint64_t v15 = (uint64_t *)(v22 + 4);
        while (v14 != v16)
        {
          int v24 = *((_DWORD *)v14 - 1);
          v14 -= 4;
          *((_DWORD *)v22 - 1) = v24;
          v22 -= 4;
        }
        v11[5] = (uint64_t *)v22;
        v11[6] = v15;
        v11[7] = v23;
        if (v16) {
          operator delete(v16);
        }
      }
      else
      {
        *(_DWORD *)int v14 = a3;
        uint64_t v15 = (uint64_t *)(v14 + 4);
      }
      v11[6] = v15;
    }
  }
  else
  {
    *(_DWORD *)(**(void **)(a1 + 16) + 4 * ((int)v7 + v6)) = a3;
  }
  ++*(_DWORD *)(**(void **)(a1 + 8) + 8 * v25);
}

uint64_t sub_1B6E1B3A4(int *a1)
{
  int v2 = (int *)**((void **)a1 + 1);
  int v3 = *v2;
  LODWORD(v4) = *a1;
  if (*((void *)a1 + 5))
  {
    if ((int)v4 < 2)
    {
      char v5 = 0;
      uint64_t v8 = a1[1];
    }
    else
    {
      char v5 = 0;
      int v6 = v2 + 3;
      uint64_t v7 = 1;
      do
      {
        *int v6 = v3;
        uint64_t v8 = a1[1];
        uint64_t v4 = *a1;
        v5 |= v3 > (int)v8 * (int)v7;
        v3 += *(v6 - 1);
        ++v7;
        v6 += 2;
      }
      while (v7 < v4);
    }
    char v12 = v5 | (v3 > (int)v8 * (int)v4);
    __p = 0;
    int v27 = 0;
    uint64_t v28 = 0;
    if (v5 & 1 | (v3 > (int)v8 * (int)v4))
    {
      p_p = &__p;
      sub_1B642863C((uint64_t)&__p, v3);
      LODWORD(v4) = *a1;
      uint64_t v8 = a1[1];
    }
    else
    {
      p_p = (void **)*((void *)a1 + 2);
    }
    int v25 = 0;
    if ((int)v4 >= 1)
    {
      int v14 = 0;
      do
      {
        uint64_t v15 = **((void **)a1 + 1);
        uint64_t v16 = *(int *)(v15 + 8 * v14);
        uint64_t v17 = *(int *)(v15 + 8 * v14 + 4);
        unint64_t v18 = (char *)*p_p;
        int v19 = a1[1];
        if ((int)v16 <= v19)
        {
          unint64_t v20 = (uint64_t *)(**((void **)a1 + 2) + 4 * v19 * v14);
        }
        else
        {
          uint64_t v29 = &v25;
          unint64_t v20 = sub_1B6E1BE00((uint64_t **)a1 + 3, &v25, (uint64_t)&unk_1B6E4FDF8, &v29)[5];
          if ((int)v8 <= (int)v16) {
            uint64_t v8 = v16;
          }
          else {
            uint64_t v8 = v8;
          }
        }
        memmove(&v18[4 * v17], v20, 4 * v16);
        int v14 = v25 + 1;
        int v25 = v14;
      }
      while (v14 < *a1);
    }
    uint64_t v21 = *((void *)a1 + 2);
    if (v12)
    {
      uint64_t v22 = *(void **)v21;
      *(void *)uint64_t v21 = __p;
      *(void *)(v21 + 8) = v27;
      uint64_t v23 = *(void *)(v21 + 16);
      *(void *)(v21 + 16) = v28;
      __p = v22;
      uint64_t v28 = v23;
      if (!v22) {
        return v8;
      }
      goto LABEL_29;
    }
    sub_1B642863C(*((void *)a1 + 2), v3);
    uint64_t v22 = __p;
    if (__p)
    {
LABEL_29:
      int v27 = v22;
      operator delete(v22);
    }
  }
  else
  {
    if ((int)v4 < 2)
    {
      uint64_t v8 = *v2;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 1;
      LODWORD(v8) = *v2;
      do
      {
        uint64_t v11 = v2[v9 + 2];
        memmove((void *)(**((void **)a1 + 2) + 4 * v3), (const void *)(**((void **)a1 + 2) + 4 * v2[v9 + 3]), 4 * v11);
        int v2 = (int *)**((void **)a1 + 1);
        v2[v9 + 3] = v3;
        v3 += v11;
        if ((int)v8 <= (int)v11) {
          uint64_t v8 = v11;
        }
        else {
          uint64_t v8 = v8;
        }
        ++v10;
        v9 += 2;
      }
      while (v10 < *a1);
    }
    sub_1B642863C(*((void *)a1 + 2), v3);
  }
  return v8;
}

uint64_t sub_1B6E1B614(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if ((int)v1 >= 1)
  {
    int v2 = (void *)result;
    for (uint64_t i = 0; i != v1; ++i)
    {
      uint64_t v4 = v2[54];
      if ((*(_WORD *)(v4 + 2 * i) & 1) == 0)
      {
        uint64_t result = sub_1B6E1B940(v2, i);
        if ((result & 1) == 0) {
          *(_WORD *)(v4 + 2 * i) |= 1u;
        }
      }
    }
  }
  return result;
}

void sub_1B6E1B680(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  uint64_t v52 = *(unsigned int *)(a1 + 4);
  sub_1B6459120(a1 + 312, (uint64_t)(*(void *)(a1 + 296) - *(void *)(a1 + 288)) >> 2);
  sub_1B6459120(a1 + 384, (uint64_t)(*(void *)(a1 + 368) - *(void *)(a1 + 360)) >> 2);
  sub_1B6459120(a1 + 192, (uint64_t)(*(void *)(a1 + 176) - *(void *)(a1 + 168)) >> 2);
  if ((int)v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v4 = (unsigned int *)(*(void *)(a1 + 264) + 8 * i);
      uint64_t v5 = *v4;
      if ((int)v5 >= 1)
      {
        uint64_t v6 = (int)v4[1];
        uint64_t v7 = (int *)(*(void *)(a1 + 288) + 4 * v6);
        uint64_t v8 = (_WORD *)(*(void *)(a1 + 312) + 2 * v6);
        int v9 = -1;
        do
        {
          uint64_t v10 = *v7;
          if (v10 == v9) {
            uint64_t v11 = (unsigned __int16)*(v8 - 1) + 1;
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = *(void *)(a1 + 24);
          uint64_t v13 = *(void *)(a1 + 48) + 4 * *(int *)(v12 + 4 * (int)((2 * v10) | 1));
          int v14 = (__int32 *)(v13 + 4 * v11);
          uint64_t v15 = v13 + 4 * *(int *)(v12 + 8 * v10);
          uint64_t v16 = wmemchr(v14, i, (v15 - (uint64_t)v14) >> 2);
          if (v16) {
            int v17 = (int)v16;
          }
          else {
            int v17 = v15;
          }
          *v8++ = (v14 + ((v17 - v14) & 0x3FFFC) - v13) >> 2;
          int v18 = *v7++;
          int v9 = v18;
          --v5;
        }
        while (v5);
      }
    }
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)(a1 + 360);
    uint64_t v21 = *(void *)(a1 + 336);
    uint64_t v22 = *(void *)(a1 + 384);
    while (1)
    {
      uint64_t v23 = (unsigned int *)(v21 + 8 * v19);
      uint64_t v24 = *v23;
      if ((int)v24 >= 1) {
        break;
      }
LABEL_26:
      if (*(_DWORD *)(a1 + 20) > (int)v24) {
        LODWORD(v24) = *(_DWORD *)(a1 + 20);
      }
      *(_DWORD *)(a1 + 20) = v24;
      if (++v19 == v2) {
        goto LABEL_29;
      }
    }
    uint64_t v25 = 0;
    uint64_t v26 = (int)v23[1];
    uint64_t v27 = v20 + 4 * v26;
    uint64_t v28 = v22 + 2 * v26;
    uint64_t v29 = *(void *)(a1 + 120);
    while (1)
    {
      uint64_t v30 = *(int *)(v27 + 4 * v25);
      uint64_t v31 = (int *)(v29 + 8 * v30);
      int v33 = *v31;
      uint64_t v32 = v31[1];
      if (v33 != v32) {
        break;
      }
      if (v25)
      {
        BOOL v34 = v30 == *(_DWORD *)(v27 + 4 * v25 - 4);
        goto LABEL_20;
      }
      __int16 v35 = 0;
LABEL_23:
      *(_WORD *)(v28 + 2 * v25++) = v35;
      if (v24 == v25) {
        goto LABEL_26;
      }
    }
    BOOL v34 = v19 == v32;
LABEL_20:
    __int16 v35 = v34;
    goto LABEL_23;
  }
LABEL_29:
  if ((int)v52 >= 1)
  {
    for (uint64_t j = 0; j != v52; ++j)
    {
      int v37 = (unsigned int *)(*(void *)(a1 + 144) + 8 * j);
      uint64_t v38 = *v37;
      if ((int)v38 >= 1)
      {
        uint64_t v39 = (int)v37[1];
        int v40 = (int *)(*(void *)(a1 + 168) + 4 * v39);
        __int32 v41 = (_WORD *)(*(void *)(a1 + 192) + 2 * v39);
        int v42 = -1;
        do
        {
          uint64_t v43 = *v40;
          if (v43 == v42) {
            uint64_t v44 = (unsigned __int16)*(v41 - 1) + 1;
          }
          else {
            uint64_t v44 = 0;
          }
          uint64_t v45 = *(void *)(a1 + 24);
          uint64_t v46 = *(void *)(a1 + 72) + 4 * *(int *)(v45 + 4 * (int)((2 * v43) | 1));
          uint64_t v47 = (__int32 *)(v46 + 4 * v44);
          uint64_t v48 = v46 + 4 * *(int *)(v45 + 8 * v43);
          uint64_t v49 = wmemchr(v47, j, (v48 - (uint64_t)v47) >> 2);
          if (v49) {
            int v50 = (int)v49;
          }
          else {
            int v50 = v48;
          }
          *v41++ = (v47 + ((v50 - v47) & 0x3FFFC) - v46) >> 2;
          int v51 = *v40++;
          int v42 = v51;
          --v38;
        }
        while (v38);
      }
    }
  }
}

uint64_t sub_1B6E1B940(void *a1, __int32 __c)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[36];
  uint64_t v5 = a1[33];
  unint64_t v6 = (8 * ((unint64_t)(2 * __c) >> 1)) | 4;
  uint64_t v7 = *(int *)(v5 + v6);
  uint64_t v8 = 8 * __c;
  uint64_t v9 = *(int *)(v5 + v8);
  uint64_t v10 = a1[42];
  uint64_t v11 = *(int *)(v10 + v6);
  uint64_t v12 = a1[45];
  uint64_t v13 = *(int *)(v10 + v8);
  int v14 = &v17;
  __p = 0;
  if ((v13 + v9) >= 0x21)
  {
    int v14 = (uint64_t *)operator new(4 * (v13 + v9));
    __p = v14;
  }
  uint64_t v15 = sub_1B6E193EC(a1, __c, v14, (int *)v14 + v9);
  if (v15)
  {
    memcpy((void *)(v4 + 4 * v7), v14, 4 * v9);
    memcpy((void *)(v12 + 4 * v11), (char *)v14 + 4 * v9, 4 * v13);
  }
  operator delete(__p);
  return v15;
}

void sub_1B6E1BA7C()
{
}

uint64_t sub_1B6E1BBA4(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 456) + 8 * a2) + 16);
}

uint64_t sub_1B6E1BBB4(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 456) + 8 * a2) + 8);
}

void sub_1B6E1BBC4(uint64_t a1, int a2, int a3)
{
}

void sub_1B6E1BBD4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 2 * a2;
    }
  }
  else
  {
    sub_1B6E1BC04((char **)a1, a2 - v2);
  }
}

void sub_1B6E1BC04(char **a1, unint64_t a2)
{
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[1];
  if (a2 <= (v5 - v6) >> 1)
  {
    a1[1] = &v6[2 * a2];
  }
  else
  {
    uint64_t v7 = *a1;
    uint64_t v8 = v6 - *a1;
    uint64_t v9 = a2 + (v8 >> 1);
    if (v9 < 0) {
      abort();
    }
    uint64_t v10 = v8 >> 1;
    unint64_t v11 = v5 - v7;
    if (v11 > v9) {
      uint64_t v9 = v11;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v12 = v9;
    }
    if (v12)
    {
      uint64_t v13 = (char *)sub_1B645A9E0(v4, v12);
      uint64_t v7 = *a1;
      unint64_t v6 = a1[1];
    }
    else
    {
      uint64_t v13 = 0;
    }
    int v14 = &v13[2 * v10];
    uint64_t v15 = &v13[2 * v12];
    uint64_t v16 = &v14[2 * a2];
    if (v6 != v7)
    {
      do
      {
        __int16 v17 = *((_WORD *)v6 - 1);
        v6 -= 2;
        *((_WORD *)v14 - 1) = v17;
        v14 -= 2;
      }
      while (v6 != v7);
      uint64_t v7 = *a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void sub_1B6E1BCF8(void **a1, unint64_t a2)
{
  uint64_t v5 = (char *)a1[1];
  uint64_t v4 = a1[2];
  if (v4 - v5 >= a2)
  {
    a1[1] = &v5[a2];
  }
  else
  {
    unint64_t v6 = (unint64_t)*a1;
    uint64_t v7 = (char *)(v5 - (unsigned char *)*a1);
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      abort();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (char *)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = &v11[v10];
    uint64_t v13 = &v7[(void)v11 + a2];
    if (v5 == (char *)v6)
    {
      unint64_t v11 = &v7[(void)v11];
    }
    else
    {
      int v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[(void)v11] = v15;
      }
      while (v5 != (char *)v6);
      uint64_t v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = v13;
    a1[2] = v12;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

uint64_t **sub_1B6E1BE00(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        unint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      unint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v9 = a1 + 1;
LABEL_10:
    unint64_t v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((void *)v11 + 6) = 0;
    *((void *)v11 + 7) = 0;
    *((void *)v11 + 5) = 0;
    sub_1B644FF08(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void sub_1B6E1BEC8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1B6E1BEC8(a1, *a2);
    sub_1B6E1BEC8(a1, a2[1]);
    uint64_t v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

uint64_t sub_1B6E1BF2C(uint64_t a1, uint64_t a2, void **a3)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  uint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24) - v5;
  *(_DWORD *)(a1 + 48) = v6 >> 2;
  if ((int)(v6 >> 2) < 1)
  {
    uint64_t v27 = *(void **)(a1 + 8);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;

    uint64_t v28 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    uint64_t v29 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend_newBufferWithBytes_length_options_(*a3, (const char *)a2, v5, v6, 0);
    unint64_t v9 = *(void **)a1;
    *(void *)a1 = v8;

    uint64_t v11 = objc_msgSend_newBufferWithBytes_length_options_(*a3, v10, *(void *)(a2 + 40), *(void *)(a2 + 48) - *(void *)(a2 + 40), 0);
    uint64_t v12 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v11;

    uint64_t v14 = objc_msgSend_newBufferWithBytes_length_options_(*a3, v13, *(void *)(a2 + 64), *(void *)(a2 + 72) - *(void *)(a2 + 64), 0);
    char v15 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v14;

    uint64_t v17 = objc_msgSend_newBufferWithBytes_length_options_(*a3, v16, *(void *)(a2 + 88), *(void *)(a2 + 96) - *(void *)(a2 + 88), 0);
    int v18 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v17;

    objc_msgSend_setLabel_(*(void **)a1, v19, @"StencilTable Sizes", v20);
    objc_msgSend_setLabel_(*(void **)(a1 + 8), v21, @"StencilTable Offsets", v22);
    objc_msgSend_setLabel_(*(void **)(a1 + 16), v23, @"StencilTable Indices", v24);
    objc_msgSend_setLabel_(*(void **)(a1 + 24), v25, @"StencilTable Weights", v26);
  }
  uint64_t v30 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  uint64_t v31 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;

  return a1;
}

void sub_1B6E1C07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_1B6E1C0BC(id *a1)
{
  return a1;
}

void sub_1B6E1C114()
{
}

BOOL sub_1B6E1C1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6)
{
  v110[21] = *MEMORY[0x1E4F143B8];
  id v12 = objc_alloc_init(MEMORY[0x1E4F351F8]);
  uint64_t v13 = sub_1B65A4EFC();
  objc_msgSend_setLanguageVersion_(v12, v14, v13, v15);
  objc_msgSend_setPreprocessorMacros_(v12, v16, 0, v17);
  objc_msgSend_setAdditionalCompilerArguments_(v12, v18, @" -w ", v19);
  BOOL v23 = *(int *)(a4 + 4) > 0 || *(_DWORD *)(a5 + 4) > 0;
  if (v23) {
    printf("Using OPENSUBDIV_MTL_COMPUTE_USE_DERIVATIVES");
  }
  v109[0] = @"LENGTH";
  uint64_t v24 = objc_msgSend_numberWithInt_(NSNumber, v20, *(unsigned int *)(a2 + 4), v21);
  v110[0] = v24;
  v109[1] = @"SRC_STRIDE";
  uint64_t v27 = objc_msgSend_numberWithInt_(NSNumber, v25, *(unsigned int *)(a2 + 8), v26);
  v110[1] = v27;
  v109[2] = @"DST_STRIDE";
  uint64_t v30 = objc_msgSend_numberWithInt_(NSNumber, v28, *(unsigned int *)(a3 + 8), v29);
  v110[2] = v30;
  v109[3] = @"WORK_GROUP_SIZE";
  objc_msgSend_numberWithInt_(NSNumber, v31, *(unsigned int *)(a1 + 24), v32);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  v110[3] = v33;
  v109[4] = @"OPENSUBDIV_MTL_COMPUTE_USE_DERIVATIVES";
  uint64_t v36 = objc_msgSend_numberWithBool_(NSNumber, v34, v23, v35);
  v109[5] = @"PARAMETER_BUFFER_INDEX";
  v109[6] = @"SIZES_BUFFER_INDEX";
  v110[6] = &unk_1F103BDC8;
  v110[7] = &unk_1F103BDE0;
  v109[7] = @"OFFSETS_BUFFER_INDEX";
  v109[8] = @"INDICES_BUFFER_INDEX";
  v110[8] = &unk_1F103BDF8;
  v110[9] = &unk_1F103BE10;
  v109[9] = @"WEIGHTS_BUFFER_INDEX";
  v109[10] = @"SRC_VERTEX_BUFFER_INDEX";
  v110[10] = &unk_1F103BE28;
  v110[11] = &unk_1F103BE40;
  v109[11] = @"DST_VERTEX_BUFFER_INDEX";
  v109[12] = @"DU_WEIGHTS_BUFFER_INDEX";
  v110[12] = &unk_1F103BE58;
  v110[13] = &unk_1F103BE70;
  v109[13] = @"DV_WEIGHTS_BUFFER_INDEX";
  v109[14] = @"DU_DERIVATIVE_BUFFER_INDEX";
  v110[14] = &unk_1F103BE88;
  v110[15] = &unk_1F103BEA0;
  v109[15] = @"DV_DERIVATIVE_BUFFER_INDEX";
  v109[16] = @"PATCH_ARRAYS_BUFFER_INDEX";
  v110[16] = &unk_1F103BEB8;
  v110[17] = &unk_1F103BED0;
  v109[17] = @"PATCH_COORDS_BUFFER_INDEX";
  v109[18] = @"PATCH_INDICES_BUFFER_INDEX";
  v110[18] = &unk_1F103BEE8;
  v110[19] = &unk_1F103BF00;
  v110[4] = v36;
  v110[5] = &unk_1F103BDB0;
  v109[19] = @"PATCH_PARAMS_BUFFER_INDEX";
  v109[20] = @"CFX_OPTIMIZE_OPENSUBDIV_STORAGE";
  v110[20] = &unk_1F103BDB0;
  uint64_t v99 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v110, (uint64_t)v109, 21);

  objc_msgSend_setPreprocessorMacros_(v12, v38, (uint64_t)v99, v39);
  sub_1B65A2694((uint64_t)v105);
  sub_1B6E267EC();
  if ((v104 & 0x80u) == 0) {
    int v40 = __p;
  }
  else {
    int v40 = (void **)__p[0];
  }
  if ((v104 & 0x80u) == 0) {
    uint64_t v41 = v104;
  }
  else {
    uint64_t v41 = (uint64_t)__p[1];
  }
  sub_1B65A7F00(v106, (uint64_t)v40, v41);
  if ((char)v104 < 0) {
    operator delete(__p[0]);
  }
  sub_1B65A7F00(v106, (uint64_t)aLine0OsdMtlcom, 9645);
  id v42 = [NSString alloc];
  std::stringbuf::str();
  if ((v104 & 0x80u) == 0) {
    uint64_t v45 = objc_msgSend_initWithUTF8String_(v42, v43, (uint64_t)__p, v44);
  }
  else {
    uint64_t v45 = objc_msgSend_initWithUTF8String_(v42, v43, (uint64_t)__p[0], v44);
  }
  uint64_t v47 = (void *)v45;
  if ((char)v104 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v48 = *a6;
  id v102 = 0;
  uint64_t v49 = objc_msgSend_newLibraryWithSource_options_error_(v48, v46, (uint64_t)v47, (uint64_t)v12, &v102);
  id v50 = v102;
  int v51 = *(void **)a1;
  *(void *)a1 = v49;

  if (!*(void *)a1)
  {
    if (v50)
    {
      objc_msgSend_localizedDescription(v50, v52, v53, v54);
      id v33 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v92) = objc_msgSend_UTF8String(v33, v89, v90, v91);
    }
    else
    {
      int v92 = "";
    }
    sub_1B6E240DC(4, (uint64_t)"Error compiling MTL Shader: %s\n", v53, v54, v55, v56, v57, v58, (char)v92);
    BOOL v84 = 0;
    if (!v50) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  id v33 = (id)objc_msgSend_newFunctionWithName_(*(void **)a1, v52, @"eval_stencils", v54);
  int v59 = *a6;
  id v101 = v50;
  id v61 = (id)objc_msgSend_newComputePipelineStateWithFunction_error_(v59, v60, (uint64_t)v33, (uint64_t)&v101);
  id v62 = v101;

  uint64_t v63 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v61;

  if (*(void *)(a1 + 8))
  {
    id v61 = (id)objc_msgSend_newFunctionWithName_(*(void **)a1, v64, @"eval_patches", v66);
    int v71 = *a6;
    id v100 = v62;
    uint64_t v73 = objc_msgSend_newComputePipelineStateWithFunction_error_(v71, v72, (uint64_t)v61, (uint64_t)&v100);
    id v50 = v100;

    unint64_t v75 = *(void **)(a1 + 16);
    uint64_t v74 = (uint64_t *)(a1 + 16);
    uint64_t *v74 = v73;

    uint64_t v83 = *v74;
    BOOL v84 = *v74 != 0;
    if (!v83)
    {
      if (v50)
      {
        objc_msgSend_localizedDescription(v50, v76, v77, v78);
        id v62 = objc_claimAutoreleasedReturnValue();
        LOBYTE(v88) = objc_msgSend_UTF8String(v62, v85, v86, v87);
      }
      else
      {
        uint64_t v88 = "";
      }
      sub_1B6E240DC(4, (uint64_t)"Error compiling MTL Pipeline eval_patches:  %s\n", v77, v78, v79, v80, v81, v82, (char)v88);
      if (v50) {

      }
      BOOL v84 = 0;
    }
    goto LABEL_42;
  }
  if (v62)
  {
    objc_msgSend_localizedDescription(v62, v64, v65, v66);
    id v61 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v96) = objc_msgSend_UTF8String(v61, v93, v94, v95);
  }
  else
  {
    unint64_t v96 = "";
  }
  sub_1B6E240DC(4, (uint64_t)"Error compiling MTL Pipeline eval_stencils: %s\n", v65, v66, v67, v68, v69, v70, (char)v96);
  BOOL v84 = 0;
  if (v62)
  {
    id v50 = v62;
LABEL_42:

    goto LABEL_43;
  }
  id v50 = 0;
LABEL_43:

LABEL_44:
  v105[0] = *MEMORY[0x1E4FBA408];
  uint64_t v97 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v105 + *(void *)(v105[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v106[0] = v97;
  v106[1] = MEMORY[0x1E4FBA470] + 16;
  if (v107 < 0) {
    operator delete((void *)v106[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1BA9B6D30](&v108);

  return v84;
}

void sub_1B6E1C8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  sub_1B65A296C((uint64_t)&a21);
  _Unwind_Resume(a1);
}

BOOL sub_1B6E1C9E0(uint64_t a1, void *a2, _DWORD *a3, void *a4, int *a5, void *a6, uint64_t a7, void *a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, int a16, int a17, uint64_t a18)
{
  id v70 = a2;
  id v22 = a4;
  id v69 = a6;
  id v68 = a8;
  id v73 = a10;
  id v23 = a11;
  id v71 = a12;
  id v72 = a13;
  id v24 = a14;
  id v25 = a15;
  uint64_t v26 = *(void *)(a1 + 8);
  if (v26 && a17 - a16 >= 1)
  {
    uint64_t v27 = a1;
    uint64_t v64 = (uint64_t)v23;
    id v63 = *(id *)a18;
    id v28 = *(id *)(a18 + 8);
    v78[0] = a16;
    v78[1] = a17;
    int v32 = *a5;
    v78[2] = *a3;
    v78[3] = v32;
    *(void *)&long long v33 = *(void *)a7;
    DWORD2(v33) = *(_DWORD *)(a7 + 8);
    *(void *)&long long v34 = *(void *)a9;
    DWORD2(v34) = *(_DWORD *)(a9 + 8);
    long long v79 = v33;
    long long v80 = v34;
    uint64_t v35 = *(void **)(a18 + 16);
    uint64_t v36 = *(void *)(a18 + 24);
    if (v36)
    {
      int v37 = v28;
      id v38 = v35;
      id v39 = *(id *)(a18 + 24);
      BOOL v40 = 0;
      objc_msgSend_setBytes_length_atIndex_(v39, v41, (uint64_t)v78, 48, 0);
    }
    else
    {
      BOOL v40 = v35 == 0;
      int v37 = v28;
      if (v35)
      {
        id v38 = v35;
      }
      else
      {
        objc_msgSend_commandBuffer(v28, v29, v30, v31);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_computeCommandEncoder(v38, v43, v44, v45);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBytes_length_atIndex_(v39, v46, (uint64_t)v78, 48, 0);
    }
    objc_msgSend_setBuffer_offset_atIndex_(v39, v42, (uint64_t)v73, 0, 1);
    objc_msgSend_setBuffer_offset_atIndex_(v39, v47, (uint64_t)v72, 0, 4);
    objc_msgSend_setBuffer_offset_atIndex_(v39, v48, v64, 0, 2);
    objc_msgSend_setBuffer_offset_atIndex_(v39, v49, (uint64_t)v71, 0, 3);
    objc_msgSend_setBuffer_offset_atIndex_(v39, v50, (uint64_t)v70, 0, 6);
    objc_msgSend_setBuffer_offset_atIndex_(v39, v51, (uint64_t)v22, 0, 5);
    if (v24 && v25)
    {
      objc_msgSend_setBuffer_offset_atIndex_(v39, v52, (uint64_t)v24, 0, 7);
      objc_msgSend_setBuffer_offset_atIndex_(v39, v53, (uint64_t)v25, 0, 8);
    }
    objc_msgSend_setBuffer_offset_atIndex_(v39, v52, (uint64_t)v69, 0, 9);
    objc_msgSend_setBuffer_offset_atIndex_(v39, v54, (uint64_t)v68, 0, 10);
    objc_msgSend_setComputePipelineState_(v39, v55, *(void *)(v27 + 8), v56);
    uint64_t v57 = *(int *)(v27 + 24);
    uint64_t v76 = (a17 - a16 + (int)v57 - 1) / (int)v57;
    int64x2_t v77 = vdupq_n_s64(1uLL);
    uint64_t v74 = v57;
    int64x2_t v75 = v77;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v39, v58, (uint64_t)&v76, (uint64_t)&v74);
    if (!v36) {
      objc_msgSend_endEncoding(v39, v59, v60, v61);
    }
    if (v40) {
      objc_msgSend_commit(v38, v59, v60, v61);
    }

    id v23 = (id)v64;
  }

  return v26 != 0;
}

void sub_1B6E1CD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1B6E1CDA0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (unsigned __int16)a2;
  uint64_t v4 = **(void **)(a1 + 88);
  if ((a2 & 3) == 2) {
    sub_1B6E1BBA4(v4, SHIDWORD(a2));
  }
  if (((*(unsigned __int8 *)(a1 + 8) >> 2) & 0xFu) >= ((v3 >> 6) & 0xF)) {
    int v5 = (v3 >> 6) & 0xF;
  }
  else {
    int v5 = (*(unsigned __int8 *)(a1 + 8) >> 2) & 0xF;
  }
  if (!(v3 & 8 | v5)) {
    operator new();
  }
  sub_1B6E1193C();
}

void sub_1B6E1CFF4(uint64_t *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v8 = *(_DWORD *)*a1;
  if (v8)
  {
    if (v8 == 2)
    {
      sub_1B6E1D9F8((uint64_t)a1, a2, a3, a4);
      sub_1B6E1E140(a1, a2, (uint64_t *)a3, (uint64_t *)a4);
      sub_1B6E1E410(a1, a2, (uint64_t *)a3, (uint64_t *)a4);
    }
    else if (v8 == 1)
    {
      sub_1B6E1D9F8((uint64_t)a1, a2, a3, a4);
      sub_1B6E1DB9C(a1, a2, (uint64_t *)a3, (uint64_t *)a4);
      sub_1B6E1DE6C(a1, a2, (uint64_t *)a3, (uint64_t *)a4);
    }
  }
  else
  {
    sub_1B6E1D9F8((uint64_t)a1, a2, a3, a4);
    sub_1B6E1E6E4((uint64_t)a1, a2, (uint64_t *)a3, (uint64_t *)a4);
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)(*(void *)(*a1 + 64) + 8 * (a2 - 1));
    uint64_t v11 = *(void *)(v10 + 8);
    unsigned int v12 = 2 * *(_DWORD *)(v11 + 20);
    uint64_t v20 = &v23;
    unsigned int v21 = v12;
    int v22 = 32;
    __p = 0;
    if (v12 >= 0x21)
    {
      unint64_t v9 = operator new(4 * v12);
      __p = v9;
      uint64_t v20 = (uint64_t *)v9;
      int v22 = v12;
    }
    int v13 = *(_DWORD *)(v11 + 8);
    if (v13 >= 1)
    {
      for (uint64_t i = 0; i < v13; ++i)
      {
        int v15 = *(_DWORD *)(*(void *)(v10 + 240) + 4 * i);
        if (v15 != -1)
        {
          int v16 = *(_DWORD *)(a4 + 8);
          v19[0] = *(void *)a4;
          v19[1] = (v16 + v15);
          uint64_t v17 = (i + *(_DWORD *)(a3 + 8));
          v18[0] = *(void *)a3;
          v18[1] = v17;
          sub_1B6E11A50((uint64_t)v19, (uint64_t)v18, 1.0);
          int v13 = *(_DWORD *)(v11 + 8);
        }
      }
      unint64_t v9 = __p;
    }
    operator delete(v9);
  }
}

void sub_1B6E1D254(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6 = *(void *)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  uint64_t v7 = *(void *)(v6 + 8);
  if (*(int *)(v6 + 52) >= 1)
  {
    int v8 = *(_DWORD *)v7;
    if (*(int *)v7 >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        int v10 = *(_DWORD *)(*(void *)(v6 + 168) + 4 * v9);
        if (v10 != -1)
        {
          uint64_t v11 = (unsigned int *)(*(void *)(v7 + 24) + 8 * v9);
          uint64_t v12 = *v11;
          if ((int)v12 >= 1)
          {
            int v13 = (int *)(*(void *)(v7 + 48) + 4 * (int)v11[1]);
            float v14 = 1.0 / (float)(int)v12;
            do
            {
              uint64_t v15 = (*((_DWORD *)a4 + 2) + v10);
              uint64_t v34 = *a4;
              uint64_t v35 = v15;
              int v16 = *v13++;
              uint64_t v17 = (*((_DWORD *)a3 + 2) + v16);
              uint64_t v32 = *a3;
              uint64_t v33 = v17;
              sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, v14);
              --v12;
            }
            while (v12);
            int v8 = *(_DWORD *)v7;
          }
        }
        ++v9;
      }
      while (v9 < v8);
    }
  }
  int v18 = *(_DWORD *)(v7 + 4);
  if (v18 >= 1)
  {
    uint64_t v19 = 0;
    for (uint64_t i = 0; i < v18; ++i)
    {
      int v21 = *(_DWORD *)(*(void *)(v6 + 216) + 4 * i);
      if (v21 != -1)
      {
        int v22 = (_DWORD *)(*(void *)(v7 + 120) + v19);
        uint64_t v23 = (*((_DWORD *)a4 + 2) + v21);
        uint64_t v34 = *a4;
        uint64_t v35 = v23;
        uint64_t v24 = (*((_DWORD *)a3 + 2) + *v22);
        uint64_t v32 = *a3;
        uint64_t v33 = v24;
        sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, 0.5);
        uint64_t v25 = (*((_DWORD *)a4 + 2) + v21);
        uint64_t v34 = *a4;
        uint64_t v35 = v25;
        uint64_t v26 = (*((_DWORD *)a3 + 2) + v22[1]);
        uint64_t v32 = *a3;
        uint64_t v33 = v26;
        sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, 0.5);
        int v18 = *(_DWORD *)(v7 + 4);
      }
      v19 += 8;
    }
  }
  int v27 = *(_DWORD *)(v7 + 8);
  if (v27 >= 1)
  {
    for (uint64_t j = 0; j < v27; ++j)
    {
      int v29 = *(_DWORD *)(*(void *)(v6 + 240) + 4 * j);
      if (v29 != -1)
      {
        int v30 = *((_DWORD *)a4 + 2);
        uint64_t v34 = *a4;
        uint64_t v35 = (v30 + v29);
        uint64_t v31 = (j + *((_DWORD *)a3 + 2));
        uint64_t v32 = *a3;
        uint64_t v33 = v31;
        sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, 1.0);
        int v27 = *(_DWORD *)(v7 + 8);
      }
    }
  }
}

void sub_1B6E1D460(int **a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  int v10 = **a1;
  if (v10)
  {
    if (v10 == 2)
    {
      sub_1B6E1E858((uint64_t)a1, a2, (uint64_t)a3, (uint64_t)a4, a5);
      sub_1B6E1F450((uint64_t)a1, a2, a3, a4, a5);
      sub_1B6E1F890((uint64_t)a1, a2, (uint64_t)a3, (uint64_t)a4, a5);
    }
    else if (v10 == 1)
    {
      sub_1B6E1E858((uint64_t)a1, a2, (uint64_t)a3, (uint64_t)a4, a5);
      sub_1B6E1EA24((uint64_t)a1, a2, a3, a4, a5);
      sub_1B6E1EE64((uint64_t)a1, a2, (uint64_t)a3, (uint64_t)a4, a5);
    }
  }
  else
  {
    sub_1B6E1E858((uint64_t)a1, a2, (uint64_t)a3, (uint64_t)a4, a5);
    sub_1B6E1FE7C((uint64_t)a1, a2, a3, a4, a5);
    sub_1B6E20100((uint64_t)a1, a2, a3, a4, a5);
  }
}

uint64_t sub_1B6E1D5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B6E1D600(a1, a2, a3, -1);
}

uint64_t sub_1B6E1D600(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a2 && a3 && ((*(void *)(a3 + 24) - *(void *)(a3 + 16)) & 0x3FFFFFFFCLL) != 0)
  {
    uint64_t v7 = **(void **)(a1 + 88);
    if (a4 < 0) {
      int v8 = *(_DWORD *)(v7 + 8);
    }
    else {
      int v8 = sub_1B6E1BBA4(v7, a4);
    }
    uint64_t v9 = (*(void *)(a2 + 24) - *(void *)(a2 + 16)) >> 2;
    if (a4 < 0) {
      int v10 = *(_DWORD *)(a1 + 20);
    }
    else {
      int v10 = sub_1B6E2B834(a1, a4);
    }
    if (v10 == v9 || v10 - v8 == v9) {
      sub_1B6E1193C();
    }
  }
  return 0;
}

void sub_1B6E1D9F8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  if (*(_DWORD *)(v4 + 52))
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)(v4 + 8);
    uint64_t v9 = *(unsigned int *)(v8 + 20);
    uint64_t v24 = (float *)&v27;
    int v25 = v9;
    int v26 = 16;
    __p = 0;
    if (v9 >= 0x11)
    {
      uint64_t v7 = operator new(4 * v9);
      __p = v7;
      uint64_t v24 = (float *)v7;
      int v26 = v9;
    }
    int v10 = *(_DWORD *)v8;
    if (*(int *)v8 >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        int v12 = *(_DWORD *)(*(void *)(v4 + 168) + 4 * v11);
        if (v12 != -1)
        {
          int v13 = (unsigned int *)(*(void *)(v8 + 24) + 8 * v11);
          uint64_t v14 = *v13;
          if ((int)v14 >= 1)
          {
            uint64_t v15 = *(void *)(v8 + 48) + 4 * (int)v13[1];
            int v16 = v24;
            uint64_t v17 = v14;
            do
            {
              *v16++ = 1.0 / (float)(int)v14;
              --v17;
            }
            while (v17);
            unint64_t v18 = 0;
            uint64_t v19 = 4 * v14;
            do
            {
              uint64_t v20 = (*(_DWORD *)(a4 + 8) + v12);
              v23[0] = *(void *)a4;
              v23[1] = v20;
              uint64_t v21 = (*(_DWORD *)(a3 + 8) + *(_DWORD *)(v15 + v18));
              v22[0] = *(void *)a3;
              v22[1] = v21;
              sub_1B6E11A50((uint64_t)v23, (uint64_t)v22, v24[v18 / 4]);
              v18 += 4;
            }
            while (v19 != v18);
            int v10 = *(_DWORD *)v8;
          }
        }
        ++v11;
      }
      while (v11 < v10);
      uint64_t v7 = __p;
    }
    operator delete(v7);
  }
}

void sub_1B6E1DB9C(uint64_t *a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7 = 0;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *a1;
  uint64_t v9 = *(void **)(*(void *)(v8 + 64) + 8 * (a2 - 1));
  uint64_t v10 = v9[1];
  uint64_t v38 = v9[2];
  int v46 = *(_DWORD *)(v8 + 4);
  uint64_t v11 = *(unsigned int *)(v10 + 16);
  uint64_t v47 = (float *)&v50;
  int v48 = v11;
  int v49 = 8;
  uint64_t v44 = v10;
  __p = 0;
  if (v11 >= 9)
  {
    uint64_t v7 = operator new(4 * v11);
    __p = v7;
    uint64_t v47 = (float *)v7;
    int v49 = v11;
  }
  int v12 = *(_DWORD *)(v10 + 4);
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i < v12; ++i)
    {
      uint64_t v14 = *(int *)(v9[27] + 4 * i);
      if (v14 != -1)
      {
        uint64_t v15 = (_DWORD *)(*(void *)(v10 + 120) + 8 * i);
        uint64_t v16 = *(void *)(v10 + 168);
        uint64_t v17 = (unsigned int *)(*(void *)(v10 + 144) + 8 * i);
        uint64_t v18 = *v17;
        uint64_t v19 = (int)v17[1];
        v43[0] = v52;
        v43[1] = 0;
        v43[2] = v47;
        memset(&v43[3], 0, 13);
        int v45 = i;
        if (*(float *)(*(void *)(v10 + 216) + 4 * i) <= 0.0) {
          int v20 = 1;
        }
        else {
          int v20 = 4;
        }
        sub_1B656FFE8(&v46, (int *)&v44, (uint64_t)v43, v20, (*(unsigned __int16 *)(*(void *)(v38 + 432) + 2 * v14) >> 7) & 0xF);
        uint64_t v21 = (*((_DWORD *)a4 + 2) + v14);
        uint64_t v41 = *a4;
        uint64_t v42 = v21;
        uint64_t v22 = (*((_DWORD *)a3 + 2) + *v15);
        uint64_t v39 = *a3;
        uint64_t v40 = v22;
        sub_1B6E11A50((uint64_t)&v41, (uint64_t)&v39, v52[0]);
        uint64_t v23 = (*((_DWORD *)a4 + 2) + v14);
        uint64_t v41 = *a4;
        uint64_t v42 = v23;
        uint64_t v24 = (*((_DWORD *)a3 + 2) + v15[1]);
        uint64_t v39 = *a3;
        uint64_t v40 = v24;
        sub_1B6E11A50((uint64_t)&v41, (uint64_t)&v39, v52[1]);
        if (SLODWORD(v43[4]) >= 1 && (int)v18 >= 1)
        {
          uint64_t v25 = 0;
          uint64_t v26 = v16 + 4 * v19;
          do
          {
            uint64_t v27 = *(int *)(v26 + 4 * v25);
            if (BYTE4(v43[4]))
            {
              int v28 = *(_DWORD *)(v9[21] + 4 * v27);
              uint64_t v29 = *a4;
              int v30 = *((_DWORD *)a4 + 2);
              uint64_t v41 = *a4;
              uint64_t v42 = (v30 + v14);
            }
            else
            {
              uint64_t v31 = 0;
              uint64_t v32 = *(void *)(v10 + 24);
              uint64_t v33 = *(int *)(v32 + 8 * v27 + 4);
              int v34 = *(_DWORD *)(v32 + 8 * v27);
              do
                uint64_t v35 = *(unsigned int *)(*(void *)(v10 + 72) + 4 * v33 + 4 * v31++);
              while (i != v35);
              uint64_t v36 = *(void *)(v10 + 48) + 4 * v33;
              if ((int)v31 + 1 < v34) {
                int v34 = 0;
              }
              int v28 = *(_DWORD *)(v36 + 4 * ((int)v31 - v34 + 1));
              uint64_t v37 = (*((_DWORD *)a4 + 2) + v14);
              uint64_t v41 = *a4;
              uint64_t v42 = v37;
              uint64_t v29 = *a3;
              int v30 = *((_DWORD *)a3 + 2);
            }
            uint64_t v39 = v29;
            uint64_t v40 = (v30 + v28);
            sub_1B6E11A50((uint64_t)&v41, (uint64_t)&v39, v47[v25++]);
          }
          while (v25 != v18);
        }
        int v12 = *(_DWORD *)(v10 + 4);
      }
    }
    uint64_t v7 = __p;
  }
  operator delete(v7);
}

void sub_1B6E1DE6C(uint64_t *a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7 = 0;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *a1;
  uint64_t v9 = *(void **)(*(void *)(v8 + 64) + 8 * (a2 - 1));
  uint64_t v11 = v9[1];
  uint64_t v10 = v9[2];
  int v52 = *(_DWORD *)(v8 + 4);
  unsigned int v12 = 2 * *(_DWORD *)(v11 + 20);
  uint64_t v53 = &v56;
  unsigned int v54 = v12;
  int v55 = 32;
  v47[0] = v11;
  v47[1] = v10;
  uint64_t v36 = v10;
  __p = 0;
  if (v12 >= 0x21)
  {
    uint64_t v7 = operator new(4 * v12);
    __p = v7;
    uint64_t v53 = (uint64_t *)v7;
    int v55 = v12;
  }
  int v13 = *(_DWORD *)(v11 + 8);
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i < v13; ++i)
    {
      int v15 = *(_DWORD *)(v9[30] + 4 * i);
      if (v15 != -1)
      {
        uint64_t v39 = *(void *)(v11 + 360);
        uint64_t v16 = *(void *)(v11 + 336);
        uint64_t v17 = (8 * i) | 4;
        uint64_t v38 = *(int *)(v16 + v17);
        uint64_t v18 = *(int *)(v16 + 8 * i);
        uint64_t v19 = *(void *)(v11 + 264);
        uint64_t v37 = *(int *)(v19 + v17);
        uint64_t v20 = *(unsigned int *)(v19 + 8 * i);
        float v46 = 0.0;
        uint64_t v21 = v53;
        int v40 = v18;
        uint64_t v22 = (_DWORD *)v53 + v18;
        v45[0] = &v46;
        v45[1] = v53;
        v45[2] = v22;
        memset(&v45[3], 0, 13);
        int v48 = i;
        int v49 = v15;
        int v50 = *(_DWORD *)(*(void *)(v47[0] + 336) + 8 * i);
        int v51 = *(_DWORD *)(*(void *)(v47[0] + 264) + 8 * i);
        uint64_t v23 = *(void *)(v11 + 288);
        sub_1B65703B8(&v52, (uint64_t)v47, (uint64_t)v45, (*(unsigned __int16 *)(*(void *)(v11 + 432) + 2 * i) >> 7) & 0xF, (*(unsigned __int16 *)(*(void *)(v36 + 432) + 2 * v15) >> 7) & 0xF);
        if (SLODWORD(v45[4]) >= 1 && (int)v20 >= 1)
        {
          uint64_t v24 = (int *)(v23 + 4 * v37);
          do
          {
            uint64_t v25 = *v24++;
            int v26 = *(_DWORD *)(v9[21] + 4 * v25);
            int v27 = *((_DWORD *)a4 + 2);
            uint64_t v43 = *a4;
            uint64_t v44 = (v27 + v15);
            uint64_t v41 = v43;
            uint64_t v42 = (v27 + v26);
            LODWORD(v25) = *v22++;
            sub_1B6E11A50((uint64_t)&v43, (uint64_t)&v41, *(float *)&v25);
            --v20;
          }
          while (v20);
        }
        if (SHIDWORD(v45[3]) >= 1)
        {
          uint64_t v28 = v40;
          if (v40 >= 1)
          {
            uint64_t v29 = (int *)(v39 + 4 * v38);
            do
            {
              uint64_t v30 = *v29++;
              int v31 = *(_DWORD *)(*(void *)(v11 + 120)
                              + 8 * v30
                              + 4 * (i == *(_DWORD *)(*(void *)(v11 + 120) + 8 * v30)));
              uint64_t v32 = (*((_DWORD *)a4 + 2) + v15);
              uint64_t v43 = *a4;
              uint64_t v44 = v32;
              uint64_t v33 = (*((_DWORD *)a3 + 2) + v31);
              uint64_t v41 = *a3;
              uint64_t v42 = v33;
              LODWORD(v30) = *(_DWORD *)v21;
              uint64_t v21 = (uint64_t *)((char *)v21 + 4);
              sub_1B6E11A50((uint64_t)&v43, (uint64_t)&v41, *(float *)&v30);
              --v28;
            }
            while (v28);
          }
        }
        uint64_t v34 = (*((_DWORD *)a4 + 2) + v15);
        uint64_t v43 = *a4;
        uint64_t v44 = v34;
        uint64_t v35 = (*((_DWORD *)a3 + 2) + i);
        uint64_t v41 = *a3;
        uint64_t v42 = v35;
        sub_1B6E11A50((uint64_t)&v43, (uint64_t)&v41, v46);
        int v13 = *(_DWORD *)(v11 + 8);
      }
    }
    uint64_t v7 = __p;
  }
  operator delete(v7);
}

void sub_1B6E1E140(uint64_t *a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7 = 0;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *a1;
  uint64_t v9 = *(void **)(*(void *)(v8 + 64) + 8 * (a2 - 1));
  uint64_t v10 = v9[1];
  uint64_t v38 = v9[2];
  int v46 = *(_DWORD *)(v8 + 4);
  uint64_t v11 = *(unsigned int *)(v10 + 16);
  uint64_t v47 = (float *)&v50;
  int v48 = v11;
  int v49 = 8;
  uint64_t v44 = v10;
  __p = 0;
  if (v11 >= 9)
  {
    uint64_t v7 = operator new(4 * v11);
    __p = v7;
    uint64_t v47 = (float *)v7;
    int v49 = v11;
  }
  int v12 = *(_DWORD *)(v10 + 4);
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i < v12; ++i)
    {
      uint64_t v14 = *(int *)(v9[27] + 4 * i);
      if (v14 != -1)
      {
        int v15 = (_DWORD *)(*(void *)(v10 + 120) + 8 * i);
        uint64_t v16 = *(void *)(v10 + 168);
        uint64_t v17 = (unsigned int *)(*(void *)(v10 + 144) + 8 * i);
        uint64_t v18 = *v17;
        uint64_t v19 = (int)v17[1];
        v43[0] = v52;
        v43[1] = 0;
        v43[2] = v47;
        memset(&v43[3], 0, 13);
        int v45 = i;
        if (*(float *)(*(void *)(v10 + 216) + 4 * i) <= 0.0) {
          int v20 = 1;
        }
        else {
          int v20 = 4;
        }
        sub_1B6570AAC(&v46, (int *)&v44, (uint64_t)v43, v20, (*(unsigned __int16 *)(*(void *)(v38 + 432) + 2 * v14) >> 7) & 0xF);
        uint64_t v21 = (*((_DWORD *)a4 + 2) + v14);
        uint64_t v41 = *a4;
        uint64_t v42 = v21;
        uint64_t v22 = (*((_DWORD *)a3 + 2) + *v15);
        uint64_t v39 = *a3;
        uint64_t v40 = v22;
        sub_1B6E11A50((uint64_t)&v41, (uint64_t)&v39, v52[0]);
        uint64_t v23 = (*((_DWORD *)a4 + 2) + v14);
        uint64_t v41 = *a4;
        uint64_t v42 = v23;
        uint64_t v24 = (*((_DWORD *)a3 + 2) + v15[1]);
        uint64_t v39 = *a3;
        uint64_t v40 = v24;
        sub_1B6E11A50((uint64_t)&v41, (uint64_t)&v39, v52[1]);
        if (SLODWORD(v43[4]) >= 1 && (int)v18 >= 1)
        {
          uint64_t v25 = 0;
          uint64_t v26 = v16 + 4 * v19;
          do
          {
            uint64_t v27 = *(int *)(v26 + 4 * v25);
            if (BYTE4(v43[4]))
            {
              int v28 = *(_DWORD *)(v9[21] + 4 * v27);
              uint64_t v29 = *a4;
              int v30 = *((_DWORD *)a4 + 2);
              uint64_t v41 = *a4;
              uint64_t v42 = (v30 + v14);
            }
            else
            {
              uint64_t v31 = 0;
              uint64_t v32 = *(void *)(v10 + 24);
              uint64_t v33 = *(int *)(v32 + 8 * v27 + 4);
              int v34 = *(_DWORD *)(v32 + 8 * v27);
              do
                uint64_t v35 = *(unsigned int *)(*(void *)(v10 + 72) + 4 * v33 + 4 * v31++);
              while (i != v35);
              uint64_t v36 = *(void *)(v10 + 48) + 4 * v33;
              if ((int)v31 + 1 < v34) {
                int v34 = 0;
              }
              int v28 = *(_DWORD *)(v36 + 4 * ((int)v31 - v34 + 1));
              uint64_t v37 = (*((_DWORD *)a4 + 2) + v14);
              uint64_t v41 = *a4;
              uint64_t v42 = v37;
              uint64_t v29 = *a3;
              int v30 = *((_DWORD *)a3 + 2);
            }
            uint64_t v39 = v29;
            uint64_t v40 = (v30 + v28);
            sub_1B6E11A50((uint64_t)&v41, (uint64_t)&v39, v47[v25++]);
          }
          while (v25 != v18);
        }
        int v12 = *(_DWORD *)(v10 + 4);
      }
    }
    uint64_t v7 = __p;
  }
  operator delete(v7);
}

void sub_1B6E1E410(uint64_t *a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7 = 0;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *a1;
  uint64_t v9 = *(void **)(*(void *)(v8 + 64) + 8 * (a2 - 1));
  uint64_t v11 = v9[1];
  uint64_t v10 = v9[2];
  int v52 = *(_DWORD *)(v8 + 4);
  unsigned int v12 = 2 * *(_DWORD *)(v11 + 20);
  uint64_t v53 = &v56;
  unsigned int v54 = v12;
  int v55 = 32;
  v47[0] = v11;
  v47[1] = v10;
  uint64_t v36 = v10;
  __p = 0;
  if (v12 >= 0x21)
  {
    uint64_t v7 = operator new(4 * v12);
    __p = v7;
    uint64_t v53 = (uint64_t *)v7;
    int v55 = v12;
  }
  int v13 = *(_DWORD *)(v11 + 8);
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i < v13; ++i)
    {
      int v15 = *(_DWORD *)(v9[30] + 4 * i);
      if (v15 != -1)
      {
        uint64_t v39 = *(void *)(v11 + 360);
        uint64_t v16 = *(void *)(v11 + 336);
        uint64_t v17 = (8 * i) | 4;
        uint64_t v38 = *(int *)(v16 + v17);
        uint64_t v18 = *(int *)(v16 + 8 * i);
        uint64_t v19 = *(void *)(v11 + 264);
        uint64_t v37 = *(int *)(v19 + v17);
        uint64_t v20 = *(unsigned int *)(v19 + 8 * i);
        float v46 = 0.0;
        uint64_t v21 = v53;
        int v40 = v18;
        uint64_t v22 = (_DWORD *)v53 + v18;
        v45[0] = &v46;
        v45[1] = v53;
        v45[2] = v22;
        memset(&v45[3], 0, 13);
        int v48 = i;
        int v49 = v15;
        int v50 = *(_DWORD *)(*(void *)(v47[0] + 336) + 8 * i);
        int v51 = *(_DWORD *)(*(void *)(v47[0] + 264) + 8 * i);
        uint64_t v23 = *(void *)(v11 + 288);
        sub_1B6570C90(&v52, (uint64_t)v47, (uint64_t)v45, (*(unsigned __int16 *)(*(void *)(v11 + 432) + 2 * i) >> 7) & 0xF, (*(unsigned __int16 *)(*(void *)(v36 + 432) + 2 * v15) >> 7) & 0xF);
        if (SLODWORD(v45[4]) >= 1 && (int)v20 >= 1)
        {
          uint64_t v24 = (int *)(v23 + 4 * v37);
          do
          {
            uint64_t v25 = *v24++;
            int v26 = *(_DWORD *)(v9[21] + 4 * v25);
            int v27 = *((_DWORD *)a4 + 2);
            uint64_t v43 = *a4;
            uint64_t v44 = (v27 + v15);
            uint64_t v41 = v43;
            uint64_t v42 = (v27 + v26);
            LODWORD(v25) = *v22++;
            sub_1B6E11A50((uint64_t)&v43, (uint64_t)&v41, *(float *)&v25);
            --v20;
          }
          while (v20);
        }
        if (SHIDWORD(v45[3]) >= 1)
        {
          uint64_t v28 = v40;
          if (v40 >= 1)
          {
            uint64_t v29 = (int *)(v39 + 4 * v38);
            do
            {
              uint64_t v30 = *v29++;
              int v31 = *(_DWORD *)(*(void *)(v11 + 120)
                              + 8 * v30
                              + 4 * (i == *(_DWORD *)(*(void *)(v11 + 120) + 8 * v30)));
              uint64_t v32 = (*((_DWORD *)a4 + 2) + v15);
              uint64_t v43 = *a4;
              uint64_t v44 = v32;
              uint64_t v33 = (*((_DWORD *)a3 + 2) + v31);
              uint64_t v41 = *a3;
              uint64_t v42 = v33;
              LODWORD(v30) = *(_DWORD *)v21;
              uint64_t v21 = (uint64_t *)((char *)v21 + 4);
              sub_1B6E11A50((uint64_t)&v43, (uint64_t)&v41, *(float *)&v30);
              --v28;
            }
            while (v28);
          }
        }
        uint64_t v34 = (*((_DWORD *)a4 + 2) + v15);
        uint64_t v43 = *a4;
        uint64_t v44 = v34;
        uint64_t v35 = (*((_DWORD *)a3 + 2) + i);
        uint64_t v41 = *a3;
        uint64_t v42 = v35;
        sub_1B6E11A50((uint64_t)&v43, (uint64_t)&v41, v46);
        int v13 = *(_DWORD *)(v11 + 8);
      }
    }
    uint64_t v7 = __p;
  }
  operator delete(v7);
}

void sub_1B6E1E6E4(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(unsigned int *)(v9 + 16);
  uint64_t v24 = &v27;
  int v25 = v10;
  int v26 = 8;
  __p = 0;
  if (v10 >= 9)
  {
    uint64_t v7 = operator new(4 * v10);
    __p = v7;
    uint64_t v24 = (uint64_t *)v7;
    int v26 = v10;
  }
  int v11 = *(_DWORD *)(v9 + 4);
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    for (uint64_t i = 0; i < v11; ++i)
    {
      int v14 = *(_DWORD *)(*(void *)(v8 + 216) + 4 * i);
      if (v14 != -1)
      {
        int v15 = (_DWORD *)(*(void *)(v9 + 120) + v12);
        uint64_t v16 = (*((_DWORD *)a4 + 2) + v14);
        uint64_t v22 = *a4;
        uint64_t v23 = v16;
        uint64_t v17 = (*((_DWORD *)a3 + 2) + *v15);
        uint64_t v20 = *a3;
        uint64_t v21 = v17;
        sub_1B6E11A50((uint64_t)&v22, (uint64_t)&v20, 0.5);
        uint64_t v18 = (*((_DWORD *)a4 + 2) + v14);
        uint64_t v22 = *a4;
        uint64_t v23 = v18;
        uint64_t v19 = (*((_DWORD *)a3 + 2) + v15[1]);
        uint64_t v20 = *a3;
        uint64_t v21 = v19;
        sub_1B6E11A50((uint64_t)&v22, (uint64_t)&v20, 0.5);
        int v11 = *(_DWORD *)(v9 + 4);
      }
      v12 += 8;
    }
    uint64_t v7 = __p;
  }
  operator delete(v7);
}

void sub_1B6E1E858(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  if (*(_DWORD *)(v5 + 52))
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)(v5 + 8);
    uint64_t v10 = *(void **)(*(void *)(v9 + 456) + 8 * a5);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(v5 + 16) + 456) + 8 * a5);
    int v26 = (int *)v9;
    uint64_t v12 = *(unsigned int *)(v9 + 20);
    uint64_t v29 = (float *)&v32;
    int v30 = v12;
    int v31 = 16;
    __p = 0;
    if (v12 >= 0x11)
    {
      uint64_t v8 = operator new(4 * v12);
      __p = v8;
      uint64_t v29 = (float *)v8;
      int v31 = v12;
    }
    int v13 = *v26;
    if (*v26 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = *(int *)(*(void *)(v5 + 168) + 4 * v14);
        if (v15 != -1)
        {
          uint64_t v16 = (unsigned int *)(*(void *)(*v10 + 24) + 8 * v14);
          uint64_t v17 = *v16;
          if ((int)v17 >= 1)
          {
            int v18 = *(_DWORD *)(*(void *)(v11 + 96) + 4 * v15);
            uint64_t v19 = v10[3] + 4 * (int)v16[1];
            uint64_t v20 = v29;
            uint64_t v21 = *v16;
            do
            {
              *v20++ = 1.0 / (float)(int)v17;
              --v21;
            }
            while (v21);
            unint64_t v22 = 0;
            uint64_t v23 = 4 * v17;
            do
            {
              uint64_t v24 = (*(_DWORD *)(a4 + 8) + v18);
              v28[0] = *(void *)a4;
              v28[1] = v24;
              uint64_t v25 = (*(_DWORD *)(a3 + 8) + *(_DWORD *)(v19 + v22));
              v27[0] = *(void *)a3;
              v27[1] = v25;
              sub_1B6E11A50((uint64_t)v28, (uint64_t)v27, v29[v22 / 4]);
              v22 += 4;
            }
            while (v23 != v22);
            int v13 = *v26;
          }
        }
        ++v14;
      }
      while (v14 < v13);
      uint64_t v8 = __p;
    }
    operator delete(v8);
  }
}

void sub_1B6E1EA24(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  v68[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  int v60 = *(_DWORD *)(*(void *)a1 + 4);
  uint64_t v9 = v8[1];
  uint64_t v10 = *(void *)(v8[60] + 8 * a5);
  uint64_t v11 = *(void *)(*(void *)(v9 + 456) + 8 * a5);
  uint64_t v48 = v8[2];
  uint64_t v12 = *(void **)(*(void *)(v48 + 456) + 8 * a5);
  uint64_t v51 = v9;
  uint64_t v13 = *(unsigned int *)(v9 + 16);
  uint64_t v14 = v66;
  id v63 = v66;
  int v64 = v13;
  int v65 = 8;
  __p = 0;
  if (v13 < 9)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = operator new(4 * v13);
    __p = v15;
    id v63 = v15;
    int v65 = v13;
    uint64_t v14 = v15;
  }
  v59[0] = v68;
  v59[1] = 0;
  v59[2] = v14;
  memset(&v59[3], 0, 13);
  if (*(unsigned char *)(v11 + 12) || !**(_DWORD **)a1)
  {
    LODWORD(v59[3]) = 2;
    LODWORD(v59[4]) = 0;
    v68[0] = 0x3F0000003F000000;
    char v49 = 1;
  }
  else
  {
    char v49 = 0;
  }
  uint64_t v57 = v51;
  if (*(int *)(v51 + 4) >= 1)
  {
    int v52 = v12;
    uint64_t v16 = 0;
    int v50 = v8;
    do
    {
      uint64_t v17 = *(int *)(v8[27] + 4 * v16);
      if (v17 != -1)
      {
        int v18 = (int *)(v52[18] + 4 * *(int *)(v52[12] + 4 * v17));
        if (*(unsigned char *)(v52[21] + *v18))
        {
          uint64_t v40 = v52[9];
          uint64_t v41 = *(unsigned __int16 *)(v40 + 2 * v17);
          if (*(_WORD *)(v40 + 2 * v17))
          {
            uint64_t v42 = 0;
            do
            {
              sub_1B6E10810((void *)v11, v16, *(unsigned __int16 *)(*(void *)(v10 + 40)+ 2 * (v42 + *(int *)(*(void *)(*(void *)(v10 + 32) + 96) + 4 * v17))), &v61);
              int v43 = v18[v42];
              uint64_t v44 = (*((_DWORD *)a4 + 2) + v43);
              uint64_t v55 = *a4;
              uint64_t v56 = v44;
              uint64_t v45 = (*((_DWORD *)a3 + 2) + v61);
              uint64_t v53 = *a3;
              uint64_t v54 = v45;
              sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, 0.5);
              uint64_t v46 = (*((_DWORD *)a4 + 2) + v43);
              uint64_t v55 = *a4;
              uint64_t v56 = v46;
              uint64_t v47 = (*((_DWORD *)a3 + 2) + v62);
              uint64_t v53 = *a3;
              uint64_t v54 = v47;
              sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, 0.5);
              ++v42;
            }
            while (v41 != v42);
          }
        }
        else
        {
          if ((v49 & 1) == 0)
          {
            int v58 = v16;
            if (*(float *)(*(void *)(v51 + 216) + 4 * v16) <= 0.0) {
              int v19 = 1;
            }
            else {
              int v19 = 4;
            }
            sub_1B656FFE8(&v60, (int *)&v57, (uint64_t)v59, v19, (*(unsigned __int16 *)(*(void *)(v48 + 432) + 2 * v17) >> 7) & 0xF);
          }
          sub_1B6E10810((void *)v11, v16, 0, &v61);
          int v20 = *v18;
          uint64_t v21 = (*((_DWORD *)a4 + 2) + v20);
          uint64_t v55 = *a4;
          uint64_t v56 = v21;
          uint64_t v22 = (*((_DWORD *)a3 + 2) + v61);
          uint64_t v53 = *a3;
          uint64_t v54 = v22;
          sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, *(float *)v68);
          uint64_t v23 = (*((_DWORD *)a4 + 2) + v20);
          uint64_t v55 = *a4;
          uint64_t v56 = v23;
          uint64_t v24 = (*((_DWORD *)a3 + 2) + v62);
          uint64_t v53 = *a3;
          uint64_t v54 = v24;
          sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, *((float *)v68 + 1));
          if (SLODWORD(v59[4]) >= 1)
          {
            uint64_t v25 = (unsigned int *)(*(void *)(v51 + 144) + 8 * v16);
            uint64_t v26 = *v25;
            if ((int)v26 >= 1)
            {
              uint64_t v27 = 0;
              uint64_t v28 = *(void *)(v51 + 168) + 4 * (int)v25[1];
              do
              {
                uint64_t v29 = *(int *)(v28 + 4 * v27);
                if (BYTE4(v59[4]))
                {
                  int v30 = *(_DWORD *)(v52[12] + 4 * *(int *)(v50[21] + 4 * v29));
                  uint64_t v31 = *a4;
                  int v32 = *((_DWORD *)a4 + 2);
                  uint64_t v55 = *a4;
                  uint64_t v56 = (v32 + v20);
                }
                else
                {
                  uint64_t v33 = 0;
                  uint64_t v34 = (2 * (int)v29) | 1;
                  uint64_t v35 = *(void *)(v51 + 24);
                  uint64_t v36 = *(void *)(v51 + 72) + 4 * *(int *)(v35 + 4 * v34);
                  int v37 = *(_DWORD *)(v35 + 8 * v29);
                  do
                    uint64_t v38 = *(unsigned int *)(v36 + 4 * v33++);
                  while (v16 != v38);
                  if ((int)v33 + 1 < v37) {
                    int v37 = 0;
                  }
                  int v30 = *(_DWORD *)(*(void *)(v11 + 24)
                                  + 4 * *(int *)(*(void *)(*(void *)v11 + 24) + 4 * v34)
                                  + 4 * ((int)v33 - v37 + 1));
                  uint64_t v39 = (*((_DWORD *)a4 + 2) + v20);
                  uint64_t v55 = *a4;
                  uint64_t v56 = v39;
                  uint64_t v31 = *a3;
                  int v32 = *((_DWORD *)a3 + 2);
                }
                uint64_t v53 = v31;
                uint64_t v54 = (v32 + v30);
                sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, *(float *)&v63[4 * v27++]);
              }
              while (v27 != v26);
            }
          }
        }
      }
      ++v16;
      uint64_t v8 = v50;
    }
    while (v16 < *(int *)(v51 + 4));
    uint64_t v15 = __p;
  }
  operator delete(v15);
}

void sub_1B6E1EE64(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(_DWORD **)a1;
  uint64_t v8 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  int v86 = *(_DWORD *)(*(void *)a1 + 4);
  uint64_t v65 = v8[1];
  uint64_t v61 = v8[2];
  uint64_t v66 = *(void *)(*(void *)(v65 + 456) + 8 * a5);
  if (*(unsigned char *)(v66 + 12)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = *v7 == 0;
  }
  BOOL v73 = v9;
  id v72 = *(void **)(v8[60] + 8 * a5);
  uint64_t v10 = *(void **)(*(void *)(v61 + 456) + 8 * a5);
  unsigned int v11 = *(_DWORD *)(v65 + 20);
  uint64_t v94 = &v97;
  int v95 = 2 * v11;
  int v96 = 32;
  v98 = 0;
  if (2 * v11 >= 0x21)
  {
    v98 = operator new(8 * v11);
    uint64_t v94 = (uint64_t *)v98;
    int v96 = 2 * v11;
    unsigned int v11 = *(_DWORD *)(v65 + 20);
  }
  uint64_t v12 = 0;
  unint64_t v89 = &v92;
  unsigned int v90 = v11;
  int v91 = 16;
  __p = 0;
  if (v11 >= 0x11)
  {
    uint64_t v12 = operator new(4 * v11);
    __p = v12;
    unint64_t v89 = (uint64_t *)v12;
    int v91 = v11;
  }
  v81[0] = v65;
  v81[1] = v61;
  if (*(int *)(v65 + 8) >= 1)
  {
    int v62 = v10;
    uint64_t v13 = 0;
    int v64 = v8;
    while (1)
    {
      int v69 = *(_DWORD *)(v8[30] + 4 * v13);
      if (v69 != -1)
      {
        uint64_t v14 = *(int *)(*(void *)(v66 + 96) + 4 * v13);
        uint64_t v15 = (_DWORD *)(*(void *)(v66 + 144) + 4 * v14);
        uint64_t v16 = *(int *)(v62[12] + 4 * v69);
        uint64_t v17 = (int *)(v62[18] + 4 * v16);
        uint64_t v18 = *v17;
        uint64_t v19 = v62[21];
        BOOL v20 = v73;
        if (*(unsigned char *)(v19 + v18)) {
          BOOL v20 = 0;
        }
        if (v20)
        {
          unint64_t v21 = (v18 + *(_DWORD *)(a4 + 8));
          uint64_t v74 = *(float **)a4;
          unint64_t v75 = v21;
          uint64_t v22 = (*(_DWORD *)(a3 + 8) + *v15);
          long long v79 = *(float **)a3;
          uint64_t v80 = v22;
          uint64_t v23 = &v74;
          uint64_t v24 = &v79;
          float v25 = 1.0;
        }
        else
        {
          if (*(unsigned char *)(v19 + v18))
          {
            uint64_t v71 = *(unsigned __int16 *)(v62[9] + 2 * v69);
            if (*(_WORD *)(v62[9] + 2 * v69))
            {
              uint64_t v41 = 0;
              uint64_t v63 = *(void *)(v66 + 168) + v14;
              uint64_t v68 = v19 + v16;
              do
              {
                uint64_t v42 = *(unsigned __int16 *)(v72[5] + 2 * (v41 + *(int *)(*(void *)(v72[4] + 96) + 4 * v69)));
                int v43 = v15;
                int v44 = v15[v42];
                int v45 = v17[v41];
                int v46 = *(_DWORD *)(a4 + 8);
                if (!v73 && (*(unsigned char *)(v68 + v41) & 8) != 0)
                {
                  sub_1B6E1066C((void *)v66, v13, *(unsigned __int16 *)(v72[5] + 2 * (v41 + *(int *)(*(void *)(v72[4] + 96) + 4 * v69))), &v87);
                  if ((*(unsigned char *)(v63 + v42) & 0x10) != 0)
                  {
                    if ((*(unsigned char *)(v63 + v42) & 0x20) != 0)
                    {
                      unsigned int v53 = v42 == 0;
                      uint64_t v51 = v72;
                      int v52 = v13;
                    }
                    else
                    {
                      uint64_t v51 = v72;
                      int v52 = v13;
                      unsigned int v53 = v42;
                    }
                    float v54 = sub_1B6E24EC4(v51, v52, v53, v69);
                    float v50 = v54 + (float)((float)(1.0 - v54) * 0.75);
                    float v49 = (float)(1.0 - v54) * 0.125;
                  }
                  else
                  {
                    float v49 = 0.125;
                    float v50 = 0.75;
                  }
                  unint64_t v55 = (*(_DWORD *)(a4 + 8) + v45);
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = v55;
                  uint64_t v56 = (*(_DWORD *)(a3 + 8) + v87);
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v56;
                  sub_1B6E11A50((uint64_t)&v74, (uint64_t)&v79, v49);
                  unint64_t v57 = (*(_DWORD *)(a4 + 8) + v45);
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = v57;
                  uint64_t v58 = (*(_DWORD *)(a3 + 8) + HIDWORD(v87));
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v58;
                  sub_1B6E11A50((uint64_t)&v74, (uint64_t)&v79, v49);
                  unint64_t v59 = (*(_DWORD *)(a4 + 8) + v45);
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = v59;
                  uint64_t v60 = (*(_DWORD *)(a3 + 8) + v44);
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v60;
                  float v48 = v50;
                }
                else
                {
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = (v46 + v45);
                  uint64_t v47 = (*(_DWORD *)(a3 + 8) + v44);
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v47;
                  float v48 = 1.0;
                }
                sub_1B6E11A50((uint64_t)&v74, (uint64_t)&v79, v48);
                ++v41;
                uint64_t v15 = v43;
              }
              while (v71 != v41);
            }
            goto LABEL_26;
          }
          uint64_t v26 = *(int *)(*(void *)(v65 + 336) + 8 * v13);
          float v78 = 0.0;
          uint64_t v27 = v94;
          int v67 = v26;
          uint64_t v28 = (_DWORD *)v94 + v26;
          uint64_t v74 = &v78;
          unint64_t v75 = (unint64_t)v94;
          uint64_t v76 = v28;
          memset(v77, 0, 13);
          int v82 = v13;
          int v83 = v69;
          int v84 = *(_DWORD *)(*(void *)(v81[0] + 336) + 8 * v13);
          int v85 = *(_DWORD *)(*(void *)(v81[0] + 264) + 8 * v13);
          sub_1B65703B8(&v86, (uint64_t)v81, (uint64_t)&v74, (*(unsigned __int16 *)(*(void *)(v65 + 432) + 2 * v13) >> 7) & 0xF, (*(unsigned __int16 *)(*(void *)(v61 + 432) + 2 * v69) >> 7) & 0xF);
          int v70 = *v15;
          int v29 = *v17;
          if (v77[2] >= 1)
          {
            uint64_t v30 = *(void *)(v65 + 264);
            uint64_t v31 = *(unsigned int *)(v30 + 8 * v13);
            if ((int)v31 >= 1)
            {
              int v32 = (int *)(*(void *)(v65 + 288) + 4 * *(int *)(v30 + ((8 * v13) | 4)));
              do
              {
                uint64_t v33 = *v32++;
                int v34 = *(_DWORD *)(v62[12] + 4 * *(int *)(v64[21] + 4 * v33));
                int v35 = *(_DWORD *)(a4 + 8);
                long long v79 = *(float **)a4;
                uint64_t v80 = (v35 + v29);
                uint64_t v87 = v79;
                uint64_t v88 = (v35 + v34);
                LODWORD(v33) = *v28++;
                sub_1B6E11A50((uint64_t)&v79, (uint64_t)&v87, *(float *)&v33);
                --v31;
              }
              while (v31);
            }
          }
          if (v77[1] >= 1)
          {
            sub_1B6E10910((void *)v66, v13, v89);
            if (v67 >= 1)
            {
              uint64_t v36 = 0;
              do
              {
                uint64_t v37 = (*(_DWORD *)(a4 + 8) + v29);
                long long v79 = *(float **)a4;
                uint64_t v80 = v37;
                uint64_t v38 = (*(_DWORD *)(a3 + 8) + *(_DWORD *)((char *)v89 + v36));
                uint64_t v87 = *(float **)a3;
                uint64_t v88 = v38;
                sub_1B6E11A50((uint64_t)&v79, (uint64_t)&v87, *(float *)((char *)v27 + v36));
                v36 += 4;
              }
              while (4 * v67 != v36);
            }
          }
          uint64_t v39 = (*(_DWORD *)(a4 + 8) + v29);
          long long v79 = *(float **)a4;
          uint64_t v80 = v39;
          uint64_t v40 = (*(_DWORD *)(a3 + 8) + v70);
          uint64_t v87 = *(float **)a3;
          uint64_t v88 = v40;
          float v25 = v78;
          uint64_t v23 = &v79;
          uint64_t v24 = &v87;
        }
        sub_1B6E11A50((uint64_t)v23, (uint64_t)v24, v25);
      }
LABEL_26:
      ++v13;
      uint64_t v8 = v64;
      if (v13 >= *(int *)(v65 + 8))
      {
        uint64_t v12 = __p;
        break;
      }
    }
  }
  operator delete(v12);
  operator delete(v98);
}

void sub_1B6E1F450(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  v68[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  int v60 = *(_DWORD *)(*(void *)a1 + 4);
  uint64_t v9 = v8[1];
  uint64_t v10 = *(void *)(v8[60] + 8 * a5);
  uint64_t v11 = *(void *)(*(void *)(v9 + 456) + 8 * a5);
  uint64_t v48 = v8[2];
  uint64_t v12 = *(void **)(*(void *)(v48 + 456) + 8 * a5);
  uint64_t v51 = v9;
  uint64_t v13 = *(unsigned int *)(v9 + 16);
  uint64_t v14 = v66;
  uint64_t v63 = v66;
  int v64 = v13;
  int v65 = 8;
  __p = 0;
  if (v13 < 9)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = operator new(4 * v13);
    __p = v15;
    uint64_t v63 = v15;
    int v65 = v13;
    uint64_t v14 = v15;
  }
  v59[0] = v68;
  v59[1] = 0;
  v59[2] = v14;
  memset(&v59[3], 0, 13);
  if (*(unsigned char *)(v11 + 12) || !**(_DWORD **)a1)
  {
    LODWORD(v59[3]) = 2;
    LODWORD(v59[4]) = 0;
    v68[0] = 0x3F0000003F000000;
    char v49 = 1;
  }
  else
  {
    char v49 = 0;
  }
  uint64_t v57 = v51;
  if (*(int *)(v51 + 4) >= 1)
  {
    int v52 = v12;
    uint64_t v16 = 0;
    float v50 = v8;
    do
    {
      uint64_t v17 = *(int *)(v8[27] + 4 * v16);
      if (v17 != -1)
      {
        uint64_t v18 = (int *)(v52[18] + 4 * *(int *)(v52[12] + 4 * v17));
        if (*(unsigned char *)(v52[21] + *v18))
        {
          uint64_t v40 = v52[9];
          uint64_t v41 = *(unsigned __int16 *)(v40 + 2 * v17);
          if (*(_WORD *)(v40 + 2 * v17))
          {
            uint64_t v42 = 0;
            do
            {
              sub_1B6E10810((void *)v11, v16, *(unsigned __int16 *)(*(void *)(v10 + 40)+ 2 * (v42 + *(int *)(*(void *)(*(void *)(v10 + 32) + 96) + 4 * v17))), &v61);
              int v43 = v18[v42];
              uint64_t v44 = (*((_DWORD *)a4 + 2) + v43);
              uint64_t v55 = *a4;
              uint64_t v56 = v44;
              uint64_t v45 = (*((_DWORD *)a3 + 2) + v61);
              uint64_t v53 = *a3;
              uint64_t v54 = v45;
              sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, 0.5);
              uint64_t v46 = (*((_DWORD *)a4 + 2) + v43);
              uint64_t v55 = *a4;
              uint64_t v56 = v46;
              uint64_t v47 = (*((_DWORD *)a3 + 2) + v62);
              uint64_t v53 = *a3;
              uint64_t v54 = v47;
              sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, 0.5);
              ++v42;
            }
            while (v41 != v42);
          }
        }
        else
        {
          if ((v49 & 1) == 0)
          {
            int v58 = v16;
            if (*(float *)(*(void *)(v51 + 216) + 4 * v16) <= 0.0) {
              int v19 = 1;
            }
            else {
              int v19 = 4;
            }
            sub_1B6570AAC(&v60, (int *)&v57, (uint64_t)v59, v19, (*(unsigned __int16 *)(*(void *)(v48 + 432) + 2 * v17) >> 7) & 0xF);
          }
          sub_1B6E10810((void *)v11, v16, 0, &v61);
          int v20 = *v18;
          uint64_t v21 = (*((_DWORD *)a4 + 2) + v20);
          uint64_t v55 = *a4;
          uint64_t v56 = v21;
          uint64_t v22 = (*((_DWORD *)a3 + 2) + v61);
          uint64_t v53 = *a3;
          uint64_t v54 = v22;
          sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, *(float *)v68);
          uint64_t v23 = (*((_DWORD *)a4 + 2) + v20);
          uint64_t v55 = *a4;
          uint64_t v56 = v23;
          uint64_t v24 = (*((_DWORD *)a3 + 2) + v62);
          uint64_t v53 = *a3;
          uint64_t v54 = v24;
          sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, *((float *)v68 + 1));
          if (SLODWORD(v59[4]) >= 1)
          {
            float v25 = (unsigned int *)(*(void *)(v51 + 144) + 8 * v16);
            uint64_t v26 = *v25;
            if ((int)v26 >= 1)
            {
              uint64_t v27 = 0;
              uint64_t v28 = *(void *)(v51 + 168) + 4 * (int)v25[1];
              do
              {
                uint64_t v29 = *(int *)(v28 + 4 * v27);
                if (BYTE4(v59[4]))
                {
                  int v30 = *(_DWORD *)(v52[12] + 4 * *(int *)(v50[21] + 4 * v29));
                  uint64_t v31 = *a4;
                  int v32 = *((_DWORD *)a4 + 2);
                  uint64_t v55 = *a4;
                  uint64_t v56 = (v32 + v20);
                }
                else
                {
                  uint64_t v33 = 0;
                  uint64_t v34 = (2 * (int)v29) | 1;
                  uint64_t v35 = *(void *)(v51 + 24);
                  uint64_t v36 = *(void *)(v51 + 72) + 4 * *(int *)(v35 + 4 * v34);
                  int v37 = *(_DWORD *)(v35 + 8 * v29);
                  do
                    uint64_t v38 = *(unsigned int *)(v36 + 4 * v33++);
                  while (v16 != v38);
                  if ((int)v33 + 1 < v37) {
                    int v37 = 0;
                  }
                  int v30 = *(_DWORD *)(*(void *)(v11 + 24)
                                  + 4 * *(int *)(*(void *)(*(void *)v11 + 24) + 4 * v34)
                                  + 4 * ((int)v33 - v37 + 1));
                  uint64_t v39 = (*((_DWORD *)a4 + 2) + v20);
                  uint64_t v55 = *a4;
                  uint64_t v56 = v39;
                  uint64_t v31 = *a3;
                  int v32 = *((_DWORD *)a3 + 2);
                }
                uint64_t v53 = v31;
                uint64_t v54 = (v32 + v30);
                sub_1B6E11A50((uint64_t)&v55, (uint64_t)&v53, *(float *)&v63[4 * v27++]);
              }
              while (v27 != v26);
            }
          }
        }
      }
      ++v16;
      uint64_t v8 = v50;
    }
    while (v16 < *(int *)(v51 + 4));
    uint64_t v15 = __p;
  }
  operator delete(v15);
}

void sub_1B6E1F890(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(_DWORD **)a1;
  uint64_t v8 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  int v86 = *(_DWORD *)(*(void *)a1 + 4);
  uint64_t v65 = v8[1];
  uint64_t v61 = v8[2];
  uint64_t v66 = *(void *)(*(void *)(v65 + 456) + 8 * a5);
  if (*(unsigned char *)(v66 + 12)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = *v7 == 0;
  }
  BOOL v73 = v9;
  id v72 = *(void **)(v8[60] + 8 * a5);
  uint64_t v10 = *(void **)(*(void *)(v61 + 456) + 8 * a5);
  unsigned int v11 = *(_DWORD *)(v65 + 20);
  uint64_t v94 = &v97;
  int v95 = 2 * v11;
  int v96 = 32;
  v98 = 0;
  if (2 * v11 >= 0x21)
  {
    v98 = operator new(8 * v11);
    uint64_t v94 = (uint64_t *)v98;
    int v96 = 2 * v11;
    unsigned int v11 = *(_DWORD *)(v65 + 20);
  }
  uint64_t v12 = 0;
  unint64_t v89 = &v92;
  unsigned int v90 = v11;
  int v91 = 16;
  __p = 0;
  if (v11 >= 0x11)
  {
    uint64_t v12 = operator new(4 * v11);
    __p = v12;
    unint64_t v89 = (uint64_t *)v12;
    int v91 = v11;
  }
  v81[0] = v65;
  v81[1] = v61;
  if (*(int *)(v65 + 8) >= 1)
  {
    int v62 = v10;
    uint64_t v13 = 0;
    int v64 = v8;
    while (1)
    {
      int v69 = *(_DWORD *)(v8[30] + 4 * v13);
      if (v69 != -1)
      {
        uint64_t v14 = *(int *)(*(void *)(v66 + 96) + 4 * v13);
        uint64_t v15 = (_DWORD *)(*(void *)(v66 + 144) + 4 * v14);
        uint64_t v16 = *(int *)(v62[12] + 4 * v69);
        uint64_t v17 = (int *)(v62[18] + 4 * v16);
        uint64_t v18 = *v17;
        uint64_t v19 = v62[21];
        BOOL v20 = v73;
        if (*(unsigned char *)(v19 + v18)) {
          BOOL v20 = 0;
        }
        if (v20)
        {
          unint64_t v21 = (v18 + *(_DWORD *)(a4 + 8));
          uint64_t v74 = *(float **)a4;
          unint64_t v75 = v21;
          uint64_t v22 = (*(_DWORD *)(a3 + 8) + *v15);
          long long v79 = *(float **)a3;
          uint64_t v80 = v22;
          uint64_t v23 = &v74;
          uint64_t v24 = &v79;
          float v25 = 1.0;
        }
        else
        {
          if (*(unsigned char *)(v19 + v18))
          {
            uint64_t v71 = *(unsigned __int16 *)(v62[9] + 2 * v69);
            if (*(_WORD *)(v62[9] + 2 * v69))
            {
              uint64_t v41 = 0;
              uint64_t v63 = *(void *)(v66 + 168) + v14;
              uint64_t v68 = v19 + v16;
              do
              {
                uint64_t v42 = *(unsigned __int16 *)(v72[5] + 2 * (v41 + *(int *)(*(void *)(v72[4] + 96) + 4 * v69)));
                int v43 = v15;
                int v44 = v15[v42];
                int v45 = v17[v41];
                int v46 = *(_DWORD *)(a4 + 8);
                if (!v73 && (*(unsigned char *)(v68 + v41) & 8) != 0)
                {
                  sub_1B6E1066C((void *)v66, v13, *(unsigned __int16 *)(v72[5] + 2 * (v41 + *(int *)(*(void *)(v72[4] + 96) + 4 * v69))), &v87);
                  if ((*(unsigned char *)(v63 + v42) & 0x10) != 0)
                  {
                    if ((*(unsigned char *)(v63 + v42) & 0x20) != 0)
                    {
                      unsigned int v53 = v42 == 0;
                      uint64_t v51 = v72;
                      int v52 = v13;
                    }
                    else
                    {
                      uint64_t v51 = v72;
                      int v52 = v13;
                      unsigned int v53 = v42;
                    }
                    float v54 = sub_1B6E24EC4(v51, v52, v53, v69);
                    float v50 = v54 + (float)((float)(1.0 - v54) * 0.75);
                    float v49 = (float)(1.0 - v54) * 0.125;
                  }
                  else
                  {
                    float v49 = 0.125;
                    float v50 = 0.75;
                  }
                  unint64_t v55 = (*(_DWORD *)(a4 + 8) + v45);
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = v55;
                  uint64_t v56 = (*(_DWORD *)(a3 + 8) + v87);
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v56;
                  sub_1B6E11A50((uint64_t)&v74, (uint64_t)&v79, v49);
                  unint64_t v57 = (*(_DWORD *)(a4 + 8) + v45);
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = v57;
                  uint64_t v58 = (*(_DWORD *)(a3 + 8) + HIDWORD(v87));
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v58;
                  sub_1B6E11A50((uint64_t)&v74, (uint64_t)&v79, v49);
                  unint64_t v59 = (*(_DWORD *)(a4 + 8) + v45);
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = v59;
                  uint64_t v60 = (*(_DWORD *)(a3 + 8) + v44);
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v60;
                  float v48 = v50;
                }
                else
                {
                  uint64_t v74 = *(float **)a4;
                  unint64_t v75 = (v46 + v45);
                  uint64_t v47 = (*(_DWORD *)(a3 + 8) + v44);
                  long long v79 = *(float **)a3;
                  uint64_t v80 = v47;
                  float v48 = 1.0;
                }
                sub_1B6E11A50((uint64_t)&v74, (uint64_t)&v79, v48);
                ++v41;
                uint64_t v15 = v43;
              }
              while (v71 != v41);
            }
            goto LABEL_26;
          }
          uint64_t v26 = *(int *)(*(void *)(v65 + 336) + 8 * v13);
          float v78 = 0.0;
          uint64_t v27 = v94;
          int v67 = v26;
          uint64_t v28 = (_DWORD *)v94 + v26;
          uint64_t v74 = &v78;
          unint64_t v75 = (unint64_t)v94;
          uint64_t v76 = v28;
          memset(v77, 0, 13);
          int v82 = v13;
          int v83 = v69;
          int v84 = *(_DWORD *)(*(void *)(v81[0] + 336) + 8 * v13);
          int v85 = *(_DWORD *)(*(void *)(v81[0] + 264) + 8 * v13);
          sub_1B6570C90(&v86, (uint64_t)v81, (uint64_t)&v74, (*(unsigned __int16 *)(*(void *)(v65 + 432) + 2 * v13) >> 7) & 0xF, (*(unsigned __int16 *)(*(void *)(v61 + 432) + 2 * v69) >> 7) & 0xF);
          int v70 = *v15;
          int v29 = *v17;
          if (v77[2] >= 1)
          {
            uint64_t v30 = *(void *)(v65 + 264);
            uint64_t v31 = *(unsigned int *)(v30 + 8 * v13);
            if ((int)v31 >= 1)
            {
              int v32 = (int *)(*(void *)(v65 + 288) + 4 * *(int *)(v30 + ((8 * v13) | 4)));
              do
              {
                uint64_t v33 = *v32++;
                int v34 = *(_DWORD *)(v62[12] + 4 * *(int *)(v64[21] + 4 * v33));
                int v35 = *(_DWORD *)(a4 + 8);
                long long v79 = *(float **)a4;
                uint64_t v80 = (v35 + v29);
                uint64_t v87 = v79;
                uint64_t v88 = (v35 + v34);
                LODWORD(v33) = *v28++;
                sub_1B6E11A50((uint64_t)&v79, (uint64_t)&v87, *(float *)&v33);
                --v31;
              }
              while (v31);
            }
          }
          if (v77[1] >= 1)
          {
            sub_1B6E10910((void *)v66, v13, v89);
            if (v67 >= 1)
            {
              uint64_t v36 = 0;
              do
              {
                uint64_t v37 = (*(_DWORD *)(a4 + 8) + v29);
                long long v79 = *(float **)a4;
                uint64_t v80 = v37;
                uint64_t v38 = (*(_DWORD *)(a3 + 8) + *(_DWORD *)((char *)v89 + v36));
                uint64_t v87 = *(float **)a3;
                uint64_t v88 = v38;
                sub_1B6E11A50((uint64_t)&v79, (uint64_t)&v87, *(float *)((char *)v27 + v36));
                v36 += 4;
              }
              while (4 * v67 != v36);
            }
          }
          uint64_t v39 = (*(_DWORD *)(a4 + 8) + v29);
          long long v79 = *(float **)a4;
          uint64_t v80 = v39;
          uint64_t v40 = (*(_DWORD *)(a3 + 8) + v70);
          uint64_t v87 = *(float **)a3;
          uint64_t v88 = v40;
          float v25 = v78;
          uint64_t v23 = &v79;
          uint64_t v24 = &v87;
        }
        sub_1B6E11A50((uint64_t)v23, (uint64_t)v24, v25);
      }
LABEL_26:
      ++v13;
      uint64_t v8 = v64;
      if (v13 >= *(int *)(v65 + 8))
      {
        uint64_t v12 = __p;
        break;
      }
    }
  }
  operator delete(v12);
  operator delete(v98);
}

void sub_1B6E1FE7C(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  uint64_t v8 = 0;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  uint64_t v31 = v30[1];
  uint64_t v9 = *(void *)(v30[60] + 8 * a5);
  uint64_t v10 = *(void **)(*(void *)(v31 + 456) + 8 * a5);
  unsigned int v11 = *(void **)(*(void *)(v30[2] + 456) + 8 * a5);
  uint64_t v12 = *(unsigned int *)(v31 + 16);
  uint64_t v38 = &v41;
  int v39 = v12;
  int v40 = 8;
  __p = 0;
  if (v12 >= 9)
  {
    uint64_t v8 = operator new(4 * v12);
    __p = v8;
    uint64_t v38 = (uint64_t *)v8;
    int v40 = v12;
  }
  if (*(int *)(v31 + 4) >= 1)
  {
    int v29 = v11;
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(int *)(v30[27] + 4 * v13);
      if (v14 != -1)
      {
        uint64_t v15 = (int *)(v29[18] + 4 * *(int *)(v29[12] + 4 * v14));
        if (*(unsigned char *)(v29[21] + *v15))
        {
          uint64_t v21 = v29[9];
          uint64_t v22 = *(unsigned __int16 *)(v21 + 2 * v14);
          if (*(_WORD *)(v21 + 2 * v14))
          {
            uint64_t v23 = 0;
            do
            {
              sub_1B6E10810(v10, v13, *(unsigned __int16 *)(*(void *)(v9 + 40)+ 2 * (v23 + *(int *)(*(void *)(*(void *)(v9 + 32) + 96) + 4 * v14))), &v36);
              int v24 = v15[v23];
              uint64_t v25 = (*((_DWORD *)a4 + 2) + v24);
              uint64_t v34 = *a4;
              uint64_t v35 = v25;
              uint64_t v26 = (*((_DWORD *)a3 + 2) + v36);
              uint64_t v32 = *a3;
              uint64_t v33 = v26;
              sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, 0.5);
              uint64_t v27 = (*((_DWORD *)a4 + 2) + v24);
              uint64_t v34 = *a4;
              uint64_t v35 = v27;
              uint64_t v28 = (*((_DWORD *)a3 + 2) + v37);
              uint64_t v32 = *a3;
              uint64_t v33 = v28;
              sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, 0.5);
              ++v23;
            }
            while (v22 != v23);
          }
        }
        else
        {
          sub_1B6E10810(v10, v13, 0, &v36);
          int v16 = *v15;
          uint64_t v17 = (*((_DWORD *)a4 + 2) + *v15);
          uint64_t v34 = *a4;
          uint64_t v35 = v17;
          uint64_t v18 = (*((_DWORD *)a3 + 2) + v36);
          uint64_t v32 = *a3;
          uint64_t v33 = v18;
          sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, 0.5);
          uint64_t v19 = (*((_DWORD *)a4 + 2) + v16);
          uint64_t v34 = *a4;
          uint64_t v35 = v19;
          uint64_t v20 = (*((_DWORD *)a3 + 2) + v37);
          uint64_t v32 = *a3;
          uint64_t v33 = v20;
          sub_1B6E11A50((uint64_t)&v34, (uint64_t)&v32, 0.5);
        }
      }
      ++v13;
    }
    while (v13 < *(int *)(v31 + 4));
    uint64_t v8 = __p;
  }
  operator delete(v8);
}

void sub_1B6E20100(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  uint64_t v8 = v7[2];
  float v49 = v7;
  uint64_t v50 = v7[1];
  uint64_t v9 = v7[60];
  uint64_t v10 = *(void *)(v8 + 456);
  uint64_t v51 = *(void *)(*(void *)(v50 + 456) + 8 * a5);
  if (*(unsigned char *)(v51 + 12)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = **(_DWORD **)a1 == 0;
  }
  BOOL v55 = v11;
  float v54 = *(void **)(v9 + 8 * a5);
  uint64_t v47 = *(void **)(v10 + 8 * a5);
  unsigned int v12 = *(_DWORD *)(v50 + 20);
  uint64_t v66 = &v69;
  int v67 = 2 * v12;
  int v68 = 32;
  int v70 = 0;
  if (2 * v12 >= 0x21)
  {
    int v70 = operator new(8 * v12);
    uint64_t v66 = (uint64_t *)v70;
    int v68 = 2 * v12;
    unsigned int v12 = *(_DWORD *)(v50 + 20);
  }
  uint64_t v13 = 0;
  uint64_t v61 = &v64;
  unsigned int v62 = v12;
  int v63 = 16;
  __p = 0;
  if (v12 >= 0x11)
  {
    uint64_t v13 = operator new(4 * v12);
    __p = v13;
    uint64_t v61 = (uint64_t *)v13;
    int v63 = v12;
  }
  if (*(int *)(v50 + 8) >= 1)
  {
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *(int *)(v49[30] + 4 * v14);
      if (v15 != -1)
      {
        uint64_t v16 = *(int *)(*(void *)(v51 + 96) + 4 * v14);
        uint64_t v17 = (_DWORD *)(*(void *)(v51 + 144) + 4 * v16);
        uint64_t v18 = *(int *)(v47[12] + 4 * v15);
        uint64_t v19 = (int *)(v47[18] + 4 * v18);
        uint64_t v20 = *v19;
        uint64_t v21 = v47[21];
        BOOL v22 = v55;
        if (*(unsigned char *)(v21 + v20)) {
          BOOL v22 = 0;
        }
        if (v22)
        {
          uint64_t v23 = (v20 + *((_DWORD *)a4 + 2));
          uint64_t v58 = *a4;
          uint64_t v59 = v23;
          int v24 = *v17;
        }
        else
        {
          if (*(unsigned char *)(v21 + v20))
          {
            uint64_t v53 = *(unsigned __int16 *)(v47[9] + 2 * v15);
            if (*(_WORD *)(v47[9] + 2 * v15))
            {
              uint64_t v27 = 0;
              uint64_t v48 = *(void *)(v51 + 168) + v16;
              uint64_t v52 = v21 + v18;
              do
              {
                uint64_t v28 = *(unsigned __int16 *)(v54[5] + 2 * (v27 + *(int *)(*(void *)(v54[4] + 96) + 4 * v15)));
                int v29 = v17;
                int v30 = v17[v28];
                int v31 = v19[v27];
                int v32 = *((_DWORD *)a4 + 2);
                if (!v55 && (*(unsigned char *)(v52 + v27) & 8) != 0)
                {
                  sub_1B6E1066C((void *)v51, v14, *(unsigned __int16 *)(v54[5] + 2 * (v27 + *(int *)(*(void *)(v54[4] + 96) + 4 * v15))), v60);
                  if ((*(unsigned char *)(v48 + v28) & 0x10) != 0)
                  {
                    if ((*(unsigned char *)(v48 + v28) & 0x20) != 0)
                    {
                      unsigned int v39 = v28 == 0;
                      int v37 = v54;
                      int v38 = v14;
                    }
                    else
                    {
                      int v37 = v54;
                      int v38 = v14;
                      unsigned int v39 = v28;
                    }
                    float v40 = sub_1B6E24EC4(v37, v38, v39, v15);
                    float v36 = v40 + (float)((float)(1.0 - v40) * 0.75);
                    float v35 = (float)(1.0 - v40) * 0.125;
                  }
                  else
                  {
                    float v35 = 0.125;
                    float v36 = 0.75;
                  }
                  uint64_t v41 = (*((_DWORD *)a4 + 2) + v31);
                  uint64_t v58 = *a4;
                  uint64_t v59 = v41;
                  uint64_t v42 = (*((_DWORD *)a3 + 2) + v60[0]);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v42;
                  sub_1B6E11A50((uint64_t)&v58, (uint64_t)&v56, v35);
                  uint64_t v43 = (*((_DWORD *)a4 + 2) + v31);
                  uint64_t v58 = *a4;
                  uint64_t v59 = v43;
                  uint64_t v44 = (*((_DWORD *)a3 + 2) + v60[1]);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v44;
                  sub_1B6E11A50((uint64_t)&v58, (uint64_t)&v56, v35);
                  uint64_t v45 = (*((_DWORD *)a4 + 2) + v31);
                  uint64_t v58 = *a4;
                  uint64_t v59 = v45;
                  uint64_t v46 = (*((_DWORD *)a3 + 2) + v30);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v46;
                  float v34 = v36;
                }
                else
                {
                  uint64_t v58 = *a4;
                  uint64_t v59 = (v32 + v31);
                  uint64_t v33 = (*((_DWORD *)a3 + 2) + v30);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v33;
                  float v34 = 1.0;
                }
                sub_1B6E11A50((uint64_t)&v58, (uint64_t)&v56, v34);
                ++v27;
                uint64_t v17 = v29;
              }
              while (v53 != v27);
            }
            goto LABEL_18;
          }
          int v24 = *v17;
          uint64_t v25 = (*((_DWORD *)a4 + 2) + v20);
          uint64_t v58 = *a4;
          uint64_t v59 = v25;
        }
        uint64_t v26 = (*((_DWORD *)a3 + 2) + v24);
        uint64_t v56 = *a3;
        uint64_t v57 = v26;
        sub_1B6E11A50((uint64_t)&v58, (uint64_t)&v56, 1.0);
      }
LABEL_18:
      if (++v14 >= *(int *)(v50 + 8))
      {
        uint64_t v13 = __p;
        break;
      }
    }
  }
  operator delete(v13);
  operator delete(v70);
}

uint64_t sub_1B6E20518(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1F4188790](a1, a2);
  signed int v6 = v5;
  int v8 = v7;
  uint64_t v177 = v9;
  uint64_t v10 = v3;
  uint64_t v11 = v2;
  uint64_t v12 = 0;
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  do
  {
    uint64_t v13 = v2 + v12;
    *(_DWORD *)uint64_t v13 = 0;
    *(void *)(v13 + 8) = v2 + v12 + 24;
    *(void *)(v13 + 344) = 0;
    *(void *)(v13 + 16) = 0x2800000028;
    v12 += 352;
  }
  while (v12 != 1408);
  do
  {
    uint64_t v14 = v2 + v12;
    *(_DWORD *)uint64_t v14 = 0;
    *(void *)(v14 + 8) = v2 + v12 + 24;
    *(void *)(v14 + 344) = 0;
    *(void *)(v14 + 16) = 0x2800000028;
    v12 += 352;
  }
  while (v14 + 352 != v2 + 2816);
  uint64_t v15 = 2816;
  do
  {
    uint64_t v16 = v2 + v15;
    *(_DWORD *)uint64_t v16 = 0;
    *(void *)(v16 + 8) = v2 + v15 + 24;
    *(void *)(v16 + 344) = 0;
    *(void *)(v16 + 16) = 0x2800000028;
    v15 += 352;
  }
  while (v16 + 352 != v2 + 4224);
  uint64_t v17 = 4224;
  do
  {
    uint64_t v18 = v2 + v17;
    *(_DWORD *)uint64_t v18 = 0;
    *(void *)(v18 + 8) = v2 + v17 + 24;
    *(void *)(v18 + 344) = 0;
    *(void *)(v18 + 16) = 0x2800000028;
    v17 += 352;
  }
  while (v18 + 352 != v2 + 5632);
  uint64_t v19 = 5632;
  do
  {
    uint64_t v20 = v2 + v19;
    *(_DWORD *)uint64_t v20 = 0;
    *(void *)(v20 + 8) = v2 + v19 + 24;
    *(void *)(v20 + 344) = 0;
    *(void *)(v20 + 16) = 0x2800000028;
    v19 += 352;
  }
  while (v20 + 352 != v2 + 7040);
  uint64_t v21 = *(void *)(v3 + 48) + 4 * *(int *)(*(void *)(v3 + 24) + 4 * ((2 * v4) | 1));
  uint64_t v181 = v21;
  if ((v5 & 0x80000000) == 0) {
    uint64_t v181 = sub_1B6E19D0C(v3, v4, v5);
  }
  int v176 = v8;
  uint64_t v22 = 0;
  v190 = (void *)v10;
  uint64_t v23 = *(int *)(v10 + 20);
  do
  {
    int v24 = &(&v204)[v22];
    *int v24 = &v207[v22 * 8];
    v24[1] = 0x2800000000;
    v24[22] = 0;
    v22 += 23;
  }
  while (v22 != 92);
  unsigned int v25 = v6;
  uint64_t v26 = v23 + (v6 >= 0);
  unsigned int v27 = 2 * v26;
  uint64_t v178 = v11;
  uint64_t v174 = v26;
  int v175 = (int *)(v11 + 2816);
  if (v26)
  {
    if (v206 < v27)
    {
      operator delete(v208);
      v204 = v207;
      unsigned int v206 = 40;
      v208 = operator new(4 * v27);
      v204 = v208;
      unsigned int v206 = v27;
    }
    unsigned int v205 = v27;
    if (v211 < v27)
    {
      operator delete(v213);
      v209 = v212;
      unsigned int v211 = 40;
      v213 = operator new(4 * v27);
      v209 = v213;
      unsigned int v211 = v27;
    }
    unsigned int v210 = v27;
    if (v216 < v27)
    {
      operator delete(v218);
      v214 = v217;
      unsigned int v216 = 40;
      v218 = operator new(4 * v27);
      v214 = v218;
      unsigned int v216 = v27;
    }
    unsigned int v215 = v27;
    if (v221 < v27)
    {
      operator delete(v223);
      v219 = v222;
      unsigned int v221 = 40;
      v223 = operator new(4 * v27);
      v219 = v223;
      unsigned int v221 = v27;
    }
  }
  else
  {
    operator delete(v208);
    v204 = v207;
    unsigned int v205 = v27;
    unsigned int v206 = 40;
    operator delete(v213);
    v209 = v212;
    unsigned int v210 = v27;
    unsigned int v211 = 40;
    operator delete(v218);
    v214 = v217;
    unsigned int v216 = 40;
    unsigned int v215 = v27;
    operator delete(v223);
    v219 = v222;
    unsigned int v221 = 40;
  }
  uint64_t v28 = 0;
  unsigned int v220 = v27;
  int v29 = 4;
  do
  {
    *(_DWORD *)(v11 + 4 * v28 + 7040) = *(_DWORD *)(v21 + 4 * v28) + v176;
    int v30 = (unsigned __int16 *)(v177 + 6 * v28);
    int v31 = *(_DWORD *)(v21 + 4 * v28);
    int v32 = (uint64_t *)&(&v204)[23 * v28];
    if (*v30)
    {
      int v33 = sub_1B6E19D3C(v190, v31, v30, *v32, v25);
      if ((v33 & 1) == 0) {
        goto LABEL_27;
      }
    }
    else
    {
      int v33 = sub_1B6E19C00(v190, v31, *v32, v25);
      if ((v33 & 1) == 0)
      {
LABEL_27:
        char v34 = 0;
        if (v33 >= 0) {
          int v35 = v33;
        }
        else {
          int v35 = v33 + 1;
        }
        int v36 = v35 >> 1;
        float v37 = 6.2832 / (float)v36;
        int v38 = v36;
        goto LABEL_36;
      }
    }
    uint64_t v39 = v33 - 1;
    if ((int)v39 >= 0) {
      int v40 = v33 - 1;
    }
    else {
      int v40 = v33;
    }
    int v36 = v40 >> 1;
    int v38 = v36 + 1;
    float v37 = 3.1416 / (float)v36;
    *(_DWORD *)(*v32 + 4 * v33) = *(_DWORD *)(*v32 + 4 * v39);
    char v34 = 1;
LABEL_36:
    v193[v28] = v34;
    *((_DWORD *)&v203[357] + v28) = v36;
    *((_DWORD *)&v203[359] + v28) = v38;
    *((float *)&v203[353] + v28) = v37;
    uint64_t v41 = v28 + 1;
    int v42 = *(_DWORD *)(v181 + 4 * ((v28 + 1) & 3));
    int v43 = *(_DWORD *)(v181 + 4 * (((_BYTE)v28 - 1) & 3));
    *((_DWORD *)&v203[355] + v28) = -1;
    if (v38 >= 1)
    {
      uint64_t v44 = 0;
      int v45 = 0;
      uint64_t v46 = *v32;
      uint64_t v47 = 2 * v38;
      while (1)
      {
        uint64_t v48 = v44 + 2;
        if (*(_DWORD *)(v46 + 4 * v44) == v42)
        {
          uint64_t v49 = v47 - 2 == v44 ? 0 : v44 + 2;
          if (*(_DWORD *)(v46 + 4 * v49) == v43) {
            break;
          }
        }
        ++v45;
        uint64_t v44 = v48;
        if (v47 == v48) {
          goto LABEL_46;
        }
      }
      *((_DWORD *)&v203[355] + v28) = v45;
    }
LABEL_46:
    int v29 = v29 + v33 - 3;
    ++v28;
  }
  while (v41 != 4);
  for (uint64_t i = 0; i != 176; i += 44)
  {
    uint64_t v51 = &v203[i + 177];
    *(_DWORD *)uint64_t v51 = 0;
    v51[1] = &v203[i + 180];
    v51[43] = 0;
    v51[2] = (void *)0x2800000028;
  }
  unsigned int v180 = v29;
  for (uint64_t j = 0; j != 176; j += 44)
  {
    uint64_t v53 = &v203[j + 1];
    *(_DWORD *)uint64_t v53 = 0;
    v53[1] = &v203[j + 4];
    v53[43] = 0;
    v53[2] = (void *)0x2800000028;
  }
  float v54 = v202;
  v199 = v202;
  unsigned int v200 = v174;
  int v201 = 10;
  v203[0] = 0;
  LODWORD(v55) = v174;
  if (v174 >= 0xB)
  {
    float v54 = operator new(352 * v174);
    v203[0] = v54;
    v199 = v54;
    int v201 = v174;
    LODWORD(v55) = v200;
  }
  if (v55)
  {
    uint64_t v55 = v55;
    do
    {
      *(_DWORD *)float v54 = 0;
      v54[1] = v54 + 3;
      v54[43] = 0;
      v54[2] = 0x2800000028;
      v54 += 44;
      --v55;
    }
    while (v55);
  }
  unsigned int v56 = 4 * v174;
  uint64_t v57 = v197;
  v194 = v197;
  unsigned int v195 = 4 * v174;
  int v196 = 40;
  v198 = 0;
  if ((4 * v174) >= 0x29)
  {
    uint64_t v57 = operator new(352 * v56);
    v198 = v57;
    v194 = v57;
    int v196 = 4 * v174;
    unsigned int v56 = v195;
  }
  if (v56)
  {
    uint64_t v58 = v56;
    do
    {
      *(_DWORD *)uint64_t v57 = 0;
      v57[1] = v57 + 3;
      v57[43] = 0;
      v57[2] = 0x2800000028;
      v57 += 44;
      --v58;
    }
    while (v58);
  }
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  do
  {
    int v187 = *(_DWORD *)(v181 + 4 * v60);
    uint64_t v182 = v60;
    int v61 = *((_DWORD *)&v203[359] + v60);
    uint64_t v179 = v61;
    uint64_t v188 = v59;
    int v191 = v61;
    if (v61 >= 1)
    {
      uint64_t v62 = 0;
      float v63 = 1.0 / (float)((float)v61 + 5.0);
      uint64_t v183 = 352 * v61;
      v185 = (uint64_t *)&(&v204)[23 * v60];
      int v64 = -1;
      uint64_t v65 = 2;
      uint64_t v66 = 4;
      do
      {
        int v67 = (v61 + v64) % v61;
        uint64_t v68 = *v185;
        uint64_t v69 = (int *)(*v185 + v66);
        int v70 = *(v69 - 1);
        int v71 = *v69;
        if (v183 - 352 == v62) {
          uint64_t v72 = 0;
        }
        else {
          uint64_t v72 = v65;
        }
        int v73 = *(_DWORD *)(v68 + 4 * v72);
        int v74 = *(_DWORD *)(v68 + 8 * v67);
        int v75 = *(_DWORD *)(v68 + 8 * v67 + 4);
        sub_1B6E21AC8((uint64_t)&v199[v62], 4u);
        sub_1B6E21B58((int *)&v199[v62], v187, v63 * (float)(int)v179);
        sub_1B6E21B58((int *)&v199[v62], v73, v63 + v63);
        sub_1B6E21B58((int *)&v199[v62], v70, v63 + v63);
        sub_1B6E21B58((int *)&v199[v62], v71, v63);
        sub_1B6E21AC8((uint64_t)&v194[v188 + v62], 4u);
        sub_1B6E21B58((int *)&v194[v188 + v62], v73, 0.33333);
        int v76 = v74;
        int v61 = v191;
        sub_1B6E21B58((int *)&v194[v188 + v62], v76, -0.33333);
        sub_1B6E21B58((int *)&v194[v188 + v62], v71, 0.16667);
        sub_1B6E21B58((int *)&v194[v188 + v62], v75, -0.16667);
        v62 += 352;
        v66 += 8;
        ++v64;
        v65 += 2;
      }
      while (v183 != v62);
    }
    if ((*(unsigned char *)(v177 + 6 * v182 + 4) & 2) != 0)
    {
      sub_1B6E21AC8(v178 + 352 * v182, v180);
      sub_1B6E21B58((int *)(v178 + 352 * v182), v187, 1.0);
      sub_1B6E21AC8((uint64_t)&v203[44 * v182 + 177], v180);
      sub_1B6E21B58((int *)&v203[44 * v182 + 177], *(_DWORD *)(v181 + 4 * v182), 0.66667);
      sub_1B6E21B58((int *)&v203[44 * v182 + 177], *(_DWORD *)(v181 + 4 * (((_BYTE)v182 + 1) & 3)), 0.33333);
      sub_1B6E21AC8((uint64_t)&v203[44 * v182 + 1], v180);
      sub_1B6E21B58((int *)&v203[44 * v182 + 1], *(_DWORD *)(v181 + 4 * v182), 0.66667);
      sub_1B6E21B58((int *)&v203[44 * v182 + 1], *(_DWORD *)(v181 + 4 * (((_BYTE)v182 - 1) & 3)), 0.33333);
    }
    else if (v193[v182])
    {
      int64x2_t v77 = (int **)&(&v204)[23 * v182];
      int v78 = **v77;
      int v79 = (*v77)[2 * (int)v179 - 1];
      uint64_t v80 = (int *)(v178 + 352 * v182);
      sub_1B6E21AC8((uint64_t)v80, v180);
      sub_1B6E21B58(v80, v78, 0.16667);
      sub_1B6E21B58(v80, v79, 0.16667);
      sub_1B6E21B58(v80, v187, 0.66667);
      float v81 = (float)*((int *)&v203[357] + v182);
      float v82 = *((float *)&v203[353] + v182);
      __float2 v83 = __sincosf_stret(v82);
      float v84 = 1.0 / (float)(v83.__cosval + (float)(v81 * 3.0));
      LODWORD(v80) = (*v77)[1];
      float v85 = (float)(v84 * (float)-(float)((float)((float)(v83.__cosval * 2.0) + 1.0) * sqrtf(v83.__cosval + 1.0)))
          / sqrtf(1.0 - v83.__cosval);
      sub_1B6E21AC8((uint64_t)&v203[44 * v182 + 177], v180);
      sub_1B6E21B58((int *)&v203[44 * v182 + 177], v78, 0.16667);
      sub_1B6E21B58((int *)&v203[44 * v182 + 177], v79, -0.16667);
      int v86 = (int *)&v203[44 * v182 + 1];
      sub_1B6E21AC8((uint64_t)v86, v180);
      sub_1B6E21B58(v86, v187, (float)(v83.__sinval * -4.0) * v84);
      sub_1B6E21B58(v86, v78, v85);
      sub_1B6E21B58(v86, (int)v80, v83.__sinval * v84);
      sub_1B6E21B58(v86, v79, v85);
      if (v191 >= 3)
      {
        unint64_t v87 = 0;
        int v88 = 1;
        do
        {
          float v89 = sinf(v82 * (float)v88);
          float v90 = v84 * (float)(v89 * 4.0);
          float v91 = v84 * (float)(v89 + sinf(v82 * (float)++v88));
          uint64_t v92 = &(*v77)[v87 / 4];
          int v93 = v92[3];
          sub_1B6E21B58(v86, v92[2], v90);
          sub_1B6E21B58(v86, v93, v91);
          v87 += 8;
        }
        while (8 * (v179 - 1) - 8 != v87);
      }
      uint64_t v94 = *v86;
      if ((int)v94 >= 1)
      {
        int v95 = (float *)((char *)v203[44 * v182 + 2] + 4);
        do
        {
          *int v95 = *v95 * 0.33333;
          v95 += 2;
          --v94;
        }
        while (v94);
      }
    }
    else
    {
      float v96 = *((float *)&v203[353] + v182);
      float v97 = (float)v61;
      if (v61 > 29)
      {
        float v99 = cosf(6.2832 / v97);
        float v98 = 1.0
            / (float)((float)((float)((float)(v99 + 5.0) + sqrtf((float)(v99 + 9.0) * (float)(v99 + 1.0))) * v97)
                    * 0.0625);
      }
      else
      {
        float v98 = flt_1E9DDA474[v179];
      }
      sub_1B6E21AC8(v178 + 352 * v182, v180);
      id v100 = (int *)&v203[44 * v182 + 177];
      sub_1B6E21AC8((uint64_t)v100, v180);
      id v101 = (int *)&v203[44 * v182 + 1];
      sub_1B6E21AC8((uint64_t)v101, v180);
      if (v61 >= 1)
      {
        uint64_t v102 = 0;
        uint64_t v103 = 0;
        float v104 = v98 * 0.5;
        float v105 = 1.0 / v97;
        do
        {
          int v106 = v179 - 1 + v103 - ((int)v179 - 1 + (int)v103) / v61 * v191;
          sub_1B6E21BB4((int *)(v178 + 352 * v182), (int *)&v199[v102], v105);
          __float2 v107 = __sincosf_stret(v96 * (float)(int)v103);
          sub_1B6E21BB4(v100, (int *)&v199[v102], v104 * v107.__cosval);
          sub_1B6E21BB4(v100, (int *)&v199[352 * v106], v104 * v107.__cosval);
          sub_1B6E21BB4(v101, (int *)&v199[v102], v104 * v107.__sinval);
          uint64_t v108 = (int *)&v199[352 * v106];
          int v61 = v191;
          sub_1B6E21BB4(v101, v108, v104 * v107.__sinval);
          ++v103;
          v102 += 352;
        }
        while (v179 != v103);
      }
    }
    uint64_t v60 = v182 + 1;
    uint64_t v59 = v188 + 352 * v174;
  }
  while (v182 != 3);
  unint64_t v109 = 0;
  uint64_t v110 = 0;
  int v111 = (char *)(v177 + 4);
  do
  {
    char v112 = *v111;
    v111 += 6;
    if ((v112 & 2) != 0)
    {
      sub_1B6E21C30((int *)(v178 + v109 + 1408), (int *)&v203[v109 / 8 + 177]);
      sub_1B6E21C30((int *)(v178 + v109 + 2816), (int *)&v203[v109 / 8 + 1]);
    }
    else
    {
      int v113 = *((_DWORD *)&v203[355] + v110);
      float v114 = *((float *)&v203[353] + v110);
      float v115 = v114 * (float)v113;
      float v116 = v114 * (float)((v113 + 1) % *((_DWORD *)&v203[359] + v110));
      if (v193[v110] && *((int *)&v203[357] + v110) < 2)
      {
        sub_1B6E21AC8(v178 + v109 + 1408, v180);
        sub_1B6E21B58((int *)(v178 + v109 + 1408), *(_DWORD *)(v181 + 4 * v110), 0.66667);
        sub_1B6E21B58((int *)(v178 + v109 + 1408), *(_DWORD *)(v181 + 4 * (((_BYTE)v110 + 1) & 3)), 0.33333);
        sub_1B6E21AC8(v178 + v109 + 2816, v180);
        sub_1B6E21B58((int *)(v178 + v109 + 2816), *(_DWORD *)(v181 + 4 * v110), 0.66667);
        sub_1B6E21B58((int *)(v178 + v109 + 2816), *(_DWORD *)(v181 + 4 * (((_BYTE)v110 - 1) & 3)), 0.33333);
      }
      else
      {
        sub_1B6E21C30((int *)(v178 + v109 + 1408), (int *)(v178 + v109));
        __float2 v117 = __sincosf_stret(v115);
        sub_1B6E21BB4((int *)(v178 + v109 + 1408), (int *)&v203[v109 / 8 + 177], v117.__cosval);
        sub_1B6E21BB4((int *)(v178 + v109 + 1408), (int *)&v203[v109 / 8 + 1], v117.__sinval);
        sub_1B6E21C30((int *)(v178 + v109 + 2816), (int *)(v178 + v109));
        __float2 v118 = __sincosf_stret(v116);
        sub_1B6E21BB4((int *)(v178 + v109 + 2816), (int *)&v203[v109 / 8 + 177], v118.__cosval);
        sub_1B6E21BB4((int *)(v178 + v109 + 2816), (int *)&v203[v109 / 8 + 1], v118.__sinval);
      }
    }
    ++v110;
    v109 += 352;
  }
  while (v110 != 4);
  uint64_t v119 = 0;
  uint64_t v120 = 0;
  float v121 = -2.0;
  uint64_t v122 = v175;
  while (2)
  {
    uint64_t v192 = v120 + 1;
    uint64_t v123 = (v120 + 1) & 3;
    uint64_t v124 = ((_BYTE)v120 - 1) & 3;
    int v125 = *((_DWORD *)&v203[355] + v120);
    uint64_t v126 = (int *)&v194[352 * v125 + v119];
    unint64_t v127 = (int *)&v194[352 * ((v125 + 1) % *((_DWORD *)&v203[359] + v120)) + v119];
    float v128 = cosf(*((float *)&v203[353] + v120));
    float v129 = cosf(*((float *)&v203[353] + v124));
    float v130 = cosf(*((float *)&v203[353] + v123));
    float v131 = (float)(v128 * v121) + 3.0;
    float v132 = v131 - v130;
    float v133 = v128 + v128;
    float v134 = v131 - v129;
    v189 = v127;
    if (!v193[v120])
    {
      sub_1B6E21AC8((uint64_t)(v122 + 352), v180);
      sub_1B6E21BB4(v122 + 352, v122 - 704, v130 / 3.0);
      sub_1B6E21BB4(v122 + 352, v122 - 352, v132 / 3.0);
      uint64_t v140 = v178;
      sub_1B6E21BB4(v122 + 352, (int *)(v178 + 352 * v123 + 2816), v133 / 3.0);
      sub_1B6E21BB4(v122 + 352, v126, 0.33333);
      sub_1B6E21AC8((uint64_t)(v122 + 704), v180);
      sub_1B6E21BB4(v122 + 704, v122 - 704, v129 / 3.0);
      sub_1B6E21BB4(v122 + 704, v122, v134 / 3.0);
      sub_1B6E21BB4(v122 + 704, (int *)(v178 + 352 * (((_BYTE)v120 - 1) & 3) + 1408), v133 / 3.0);
      sub_1B6E21BB4(v122 + 704, v189, -0.33333);
      goto LABEL_101;
    }
    int v135 = *((_DWORD *)&v203[357] + v120);
    v136 = v122 + 352;
    sub_1B6E21AC8((uint64_t)(v122 + 352), v180);
    if (v135 < 2)
    {
      sub_1B6E21B58(v122 + 352, *(_DWORD *)(v181 + 4 * v120), 0.44444);
      sub_1B6E21B58(v122 + 352, *(_DWORD *)(v181 + 4 * (((_BYTE)v120 + 2) & 3)), 0.11111);
      sub_1B6E21B58(v122 + 352, *(_DWORD *)(v181 + 4 * v123), 0.22222);
      sub_1B6E21B58(v122 + 352, *(_DWORD *)(v181 + 4 * v124), 0.22222);
      sub_1B6E21C30(v122 + 704, v122 + 352);
      uint64_t v140 = v178;
LABEL_101:
      unint64_t v146 = v122;
LABEL_102:
      uint64_t v147 = v192;
      goto LABEL_103;
    }
    int v137 = v122 - 704;
    float v138 = v130 / 3.0;
    sub_1B6E21BB4(v122 + 352, v122 - 704, v130 / 3.0);
    float v139 = v132 / 3.0;
    v186 = v122 - 352;
    sub_1B6E21BB4(v122 + 352, v122 - 352, v132 / 3.0);
    uint64_t v140 = v178;
    float v141 = v133 / 3.0;
    v184 = (int *)(v178 + 352 * v123 + 2816);
    sub_1B6E21BB4(v122 + 352, v184, v133 / 3.0);
    sub_1B6E21BB4(v122 + 352, v126, 0.33333);
    int v142 = v122;
    int v143 = v122 + 704;
    sub_1B6E21AC8((uint64_t)v143, v180);
    float v144 = v129 / 3.0;
    sub_1B6E21BB4(v143, v137, v144);
    float v145 = v134 / 3.0;
    sub_1B6E21BB4(v143, v142, v145);
    sub_1B6E21BB4(v143, (int *)(v178 + 352 * v124 + 1408), v133 / 3.0);
    sub_1B6E21BB4(v143, v189, -0.33333);
    if (v193[v124])
    {
      sub_1B6E21AC8((uint64_t)v136, v180);
      sub_1B6E21BB4(v136, v137, v138);
      sub_1B6E21BB4(v136, v186, v139);
      sub_1B6E21BB4(v136, v184, v141);
      sub_1B6E21BB4(v136, v126, 0.33333);
      sub_1B6E21C30(v143, v136);
      unint64_t v146 = v142;
      float v121 = -2.0;
      goto LABEL_102;
    }
    __int16 v148 = (int *)(v178 + 352 * v124 + 1408);
    int v149 = v193[v123];
    unint64_t v146 = v142;
    float v121 = -2.0;
    uint64_t v147 = v192;
    if (v149)
    {
      sub_1B6E21AC8((uint64_t)v143, v180);
      sub_1B6E21BB4(v143, v137, v144);
      sub_1B6E21BB4(v143, v142, v145);
      sub_1B6E21BB4(v143, v148, v141);
      sub_1B6E21BB4(v143, v189, -0.33333);
      sub_1B6E21C30(v136, v143);
    }
LABEL_103:
    v119 += 352 * v174;
    uint64_t v122 = v146 + 88;
    uint64_t v120 = v147;
    if (v147 != 4) {
      continue;
    }
    break;
  }
  for (uint64_t k = 0; k != 4; ++k)
  {
    uint64_t v151 = *(unsigned int *)(v140 + 352 * k);
    if ((int)v151 >= 1)
    {
      BOOL v152 = *(_DWORD **)(v140 + 352 * k + 8);
      do
      {
        *v152 += v176;
        v152 += 2;
        --v151;
      }
      while (v151);
    }
    uint64_t v153 = *(unsigned int *)(v140 + 352 * k + 1408);
    if ((int)v153 >= 1)
    {
      uint64_t v154 = *(_DWORD **)(v140 + 352 * k + 1416);
      do
      {
        *v154 += v176;
        v154 += 2;
        --v153;
      }
      while (v153);
    }
    uint64_t v155 = *(unsigned int *)(v140 + 352 * k + 2816);
    if ((int)v155 >= 1)
    {
      uint64_t v156 = *(_DWORD **)(v140 + 352 * k + 2824);
      do
      {
        *v156 += v176;
        v156 += 2;
        --v155;
      }
      while (v155);
    }
    uint64_t v157 = *(unsigned int *)(v140 + 352 * k + 4224);
    if ((int)v157 >= 1)
    {
      uint64_t v158 = *(_DWORD **)(v140 + 352 * k + 4232);
      do
      {
        *v158 += v176;
        v158 += 2;
        --v157;
      }
      while (v157);
    }
    uint64_t v159 = *(unsigned int *)(v140 + 352 * k + 5632);
    if ((int)v159 >= 1)
    {
      uint64_t v160 = *(_DWORD **)(v140 + 352 * k + 5640);
      do
      {
        *v160 += v176;
        v160 += 2;
        --v159;
      }
      while (v159);
    }
  }
  if (v195)
  {
    unint64_t v161 = 0;
    uint64_t v162 = 344;
    do
    {
      int v163 = &v194[v162];
      uint64_t v164 = &v194[v162 - 336];
      operator delete(*(void **)&v194[v162]);
      *uint64_t v164 = v163 - 320;
      *((_DWORD *)v163 - 81) = 40;
      ++v161;
      v162 += 352;
    }
    while (v161 < v195);
  }
  operator delete(v198);
  if (v200)
  {
    unint64_t v165 = 0;
    uint64_t v166 = 344;
    do
    {
      uint64_t v167 = &v199[v166];
      int v168 = &v199[v166 - 336];
      operator delete(*(void **)&v199[v166]);
      *int v168 = v167 - 320;
      *((_DWORD *)v167 - 81) = 40;
      ++v165;
      v166 += 352;
    }
    while (v165 < v200);
  }
  operator delete(v203[0]);
  unint64_t v169 = 1408;
  do
  {
    operator delete(v203[v169 / 8]);
    *(void *)&v202[v169 + 3184] = &v202[v169 + 3200];
    *(_DWORD *)&v202[v169 + 3196] = 40;
    v169 -= 352;
  }
  while (v169);
  uint64_t v170 = 176;
  do
  {
    operator delete(v203[v170 + 176]);
    v203[v170 + 134] = &v203[v170 + 136];
    HIDWORD(v203[v170 + 135]) = 40;
    v170 -= 44;
  }
  while (v170 * 8);
  uint64_t v171 = 92;
  do
  {
    uint64_t v172 = (char *)&(&v204)[v171];
    operator delete(v203[v171 + 360]);
    *((void *)v172 - 23) = v172 - 168;
    *((_DWORD *)v172 - 43) = 40;
    v171 -= 23;
  }
  while (v171 * 8);
  return v178;
}

void sub_1B6E21AC8(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)a1 = 0;
  if (*(_DWORD *)(a1 + 16) < (signed int)a2)
  {
    if (a2)
    {
      if (*(_DWORD *)(a1 + 20) < a2)
      {
        operator delete(*(void **)(a1 + 344));
        *(void *)(a1 + 8) = a1 + 24;
        *(_DWORD *)(a1 + 20) = 40;
        int v4 = operator new(8 * a2);
        *(void *)(a1 + 344) = v4;
        *(void *)(a1 + 8) = v4;
        *(_DWORD *)(a1 + 20) = a2;
      }
    }
    else
    {
      operator delete(*(void **)(a1 + 344));
      *(void *)(a1 + 8) = a1 + 24;
      *(_DWORD *)(a1 + 20) = 40;
    }
    *(_DWORD *)(a1 + 16) = a2;
  }
}

float sub_1B6E21B58(int *a1, int a2, float result)
{
  int v3 = *a1;
  uint64_t v4 = *((void *)a1 + 1);
  if (*a1 < 1)
  {
LABEL_5:
    uint64_t v7 = v4 + 8 * v3;
    *(_DWORD *)uint64_t v7 = a2;
    *(float *)(v7 + 4) = result;
    *a1 = v3 + 1;
  }
  else
  {
    int v5 = (float *)(v4 + 4);
    uint64_t v6 = *a1;
    while (*((_DWORD *)v5 - 1) != a2)
    {
      v5 += 2;
      if (!--v6) {
        goto LABEL_5;
      }
    }
    uint64_t result = *v5 + result;
    *int v5 = result;
  }
  return result;
}

void sub_1B6E21BB4(int *a1, int *a2, float a3)
{
  if (*a2 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      sub_1B6E21B58(a1, *(_DWORD *)(*((void *)a2 + 1) + v6), *(float *)(*((void *)a2 + 1) + v6 + 4) * a3);
      ++v7;
      v6 += 8;
    }
    while (v7 < *a2);
  }
}

int *sub_1B6E21C30(int *a1, int *a2)
{
  sub_1B6E21AC8((uint64_t)a1, a2[4]);
  int v4 = *a2;
  *a1 = *a2;
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      *(void *)(*((void *)a1 + 1) + 8 * v5) = *(void *)(*((void *)a2 + 1) + 8 * v5);
      ++v5;
    }
    while (v5 < *a1);
  }
  return a1;
}

double sub_1B6E21C98(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *(void *)a1 = &unk_1F0FB2A78;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 24) = *a4;
  *(_DWORD *)(a1 + 32) = -1;
  *(_WORD *)(a1 + 36) = 0;
  *(void *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 112) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_DWORD *)(a3 + 12) = *(_DWORD *)(a2 + 12) + 1;
  return result;
}

void *sub_1B6E21D40(void *a1)
{
  *a1 = &unk_1F0FB2A78;
  int v4 = a1 + 60;
  uint64_t v2 = (void *)a1[60];
  uint64_t v3 = v4[1];
  if ((int)((unint64_t)(v3 - (void)v2) >> 3) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if (v2[v5])
      {
        uint64_t v6 = sub_1B6E2428C(v2[v5]);
        MEMORY[0x1BA9B6D80](v6, 0x70C4089CF00AFLL);
        uint64_t v2 = (void *)a1[60];
        uint64_t v3 = a1[61];
      }
      ++v5;
    }
    while (v5 < (int)((unint64_t)(v3 - (void)v2) >> 3));
  }
  if (v2)
  {
    a1[61] = v2;
    operator delete(v2);
  }
  uint64_t v7 = (void *)a1[57];
  if (v7)
  {
    a1[58] = v7;
    operator delete(v7);
  }
  int v8 = (void *)a1[54];
  if (v8)
  {
    a1[55] = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)a1[51];
  if (v9)
  {
    a1[52] = v9;
    operator delete(v9);
  }
  uint64_t v10 = (void *)a1[48];
  if (v10)
  {
    a1[49] = v10;
    operator delete(v10);
  }
  uint64_t v11 = (void *)a1[45];
  if (v11)
  {
    a1[46] = v11;
    operator delete(v11);
  }
  uint64_t v12 = (void *)a1[42];
  if (v12)
  {
    a1[43] = v12;
    operator delete(v12);
  }
  uint64_t v13 = (void *)a1[39];
  if (v13)
  {
    a1[40] = v13;
    operator delete(v13);
  }
  uint64_t v14 = (void *)a1[36];
  if (v14)
  {
    a1[37] = v14;
    operator delete(v14);
  }
  uint64_t v15 = (void *)a1[33];
  if (v15)
  {
    a1[34] = v15;
    operator delete(v15);
  }
  uint64_t v16 = (void *)a1[30];
  if (v16)
  {
    a1[31] = v16;
    operator delete(v16);
  }
  uint64_t v17 = (void *)a1[27];
  if (v17)
  {
    a1[28] = v17;
    operator delete(v17);
  }
  uint64_t v18 = (void *)a1[24];
  if (v18)
  {
    a1[25] = v18;
    operator delete(v18);
  }
  uint64_t v19 = (void *)a1[21];
  if (v19)
  {
    a1[22] = v19;
    operator delete(v19);
  }
  uint64_t v20 = (void *)a1[18];
  if (v20)
  {
    a1[19] = v20;
    operator delete(v20);
  }
  uint64_t v21 = (void *)a1[15];
  if (v21)
  {
    a1[16] = v21;
    operator delete(v21);
  }
  return a1;
}

void sub_1B6E21EE0(void *a1)
{
  uint64_t v2 = (int *)a1[1];
  unint64_t v3 = *v2;
  uint64_t v4 = a1[51];
  unint64_t v5 = a1[52] - v4;
  if (v3 <= v5)
  {
    if (v3 < v5) {
      a1[52] = v4 + v3;
    }
  }
  else
  {
    sub_1B6E23E78(a1 + 51, v3 - v5);
    uint64_t v2 = (int *)a1[1];
  }
  unint64_t v6 = v2[1];
  uint64_t v7 = a1[54];
  unint64_t v8 = a1[55] - v7;
  if (v6 <= v8)
  {
    if (v6 < v8) {
      a1[55] = v7 + v6;
    }
  }
  else
  {
    sub_1B6E23E78(a1 + 54, v6 - v8);
    uint64_t v2 = (int *)a1[1];
  }
  unint64_t v9 = v2[2];
  uint64_t v10 = a1[57];
  unint64_t v11 = a1[58] - v10;
  if (v9 <= v11)
  {
    if (v9 < v11) {
      a1[58] = v10 + v9;
    }
  }
  else
  {
    sub_1B6E23E78(a1 + 57, v9 - v11);
  }
}

uint64_t sub_1B6E21FA4(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 36) = (a2 & 1) == 0;
  *(unsigned char *)(a1 + 37) = (a2 & 2) != 0;
  uint64_t v4 = (*(void *)(*(void *)(a1 + 8) + 464) - *(void *)(*(void *)(a1 + 8) + 456)) >> 3;
  sub_1B6E220E0(a1);
  unint64_t v5 = *(_DWORD **)(a1 + 16);
  int v6 = *(_DWORD *)(a1 + 52);
  int v7 = *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 44);
  *unint64_t v5 = *(_DWORD *)(a1 + 40);
  v5[1] = v7;
  v5[2] = *(_DWORD *)(a1 + 56) + v6 + *(_DWORD *)(a1 + 60);
  sub_1B6E22148(a1, v8, v9);
  sub_1B6E2337C(a1);
  sub_1B6E233E4(a1);
  sub_1B6E23478(a1);
  if ((a2 & 4) != 0) {
    char v10 = 1;
  }
  else {
    char v10 = -1;
  }
  v12[0] = v10;
  if ((int)v4 < 1)
  {
    sub_1B6E221F8(a1, v12);
    sub_1B6E23718(a1);
    sub_1B6E23944(a1);
    return sub_1B6E23A34(a1);
  }
  else
  {
    v12[0] = v10 | 0x10;
    sub_1B6E221F8(a1, v12);
    sub_1B6E23718(a1);
    sub_1B6E23944(a1);
    sub_1B6E23A34(a1);
    return sub_1B6E2237C(a1);
  }
}

uint64_t sub_1B6E220E0(uint64_t a1)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  if (!*(unsigned char *)(a1 + 36)) {
    sub_1B6E2259C((void *)a1);
  }

  return sub_1B6E22634(a1);
}

uint64_t sub_1B6E22148(uint64_t a1, uint8x8_t a2, uint8x8_t a3)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  a3.i32[0] = HIDWORD(v7[0]);
  a2.i32[0] = v7[0];
  int16x8_t v4 = (int16x8_t)vmovl_u8(a2);
  *(int8x8_t *)v4.i8 = vorr_s8((int8x8_t)(v4.i64[0] & 0xFFE0FFE0FFE0FFE0), (int8x8_t)0x18001000080000);
  v4.i32[0] = vmovn_s16(v4).u32[0];
  int16x8_t v5 = (int16x8_t)vmovl_u8(a3);
  *(int8x8_t *)v5.i8 = vorr_s8((int8x8_t)(v5.i64[0] & 0xFFE0FFE0FFE0FFE0), (int8x8_t)0x19001100090001);
  v4.i32[1] = vmovn_s16(v5).u32[0];
  v7[0] = v4.i64[0];
  sub_1B6E22B18(a1, v7);
  sub_1B6E22B98(a1, v7);
  return sub_1B6E22C24(a1, v7);
}

uint64_t sub_1B6E221F8(uint64_t result, char *a2)
{
  uint64_t v3 = result;
  char v4 = *a2;
  if (*a2)
  {
    double result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
    char v4 = *a2;
    if ((*a2 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  double result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
  char v4 = *a2;
  if ((*a2 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  double result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 48))(v3);
  char v4 = *a2;
  if ((*a2 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  double result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 56))(v3);
  char v4 = *a2;
  if ((*a2 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  double result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 64))(v3);
  if ((*a2 & 0x20) != 0) {
LABEL_7:
  }
    double result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 72))(v3);
LABEL_8:
  if (*(_DWORD *)(v3 + 28)) {
    int v5 = 6;
  }
  else {
    int v5 = 4;
  }
  if (*(_DWORD *)(*(void *)(v3 + 8) + 20) > v5) {
    int v5 = *(_DWORD *)(*(void *)(v3 + 8) + 20);
  }
  *(_DWORD *)(*(void *)(v3 + 16) + 20) = v5;
  return result;
}

uint64_t sub_1B6E2237C(uint64_t result)
{
  if ((int)((*(void *)(*(void *)(result + 8) + 464) - *(void *)(*(void *)(result + 8) + 456)) >> 3) >= 1) {
    operator new();
  }
  return result;
}

uint64_t sub_1B6E2259C(void *a1)
{
  uint64_t v2 = a1[1];
  int v3 = *(_DWORD *)(v2 + 8);
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = a1[57];
    do
    {
      if (*(unsigned char *)(v5 + v4))
      {
        *(_DWORD *)(a1[30] + 4 * v4) = 2;
        int v3 = *(_DWORD *)(v2 + 8);
      }
      ++v4;
    }
    while (v4 < v3);
  }
  sub_1B6E23D40(a1);
  int v6 = *(uint64_t (**)(void *))(*a1 + 24);

  return v6(a1);
}

uint64_t sub_1B6E22634(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 36);
  *(_DWORD *)(result + 64) = 0;
  uint64_t v2 = *(int **)(result + 120);
  unint64_t v3 = *(void *)(result + 128) - (void)v2;
  unint64_t v4 = v3 >> 2;
  if (v1)
  {
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        v2[v5] = v5;
        ++v5;
      }
      while ((v3 >> 2) != v5);
    }
    *(_DWORD *)(result + 40) = v4;
    *(_DWORD *)(result + 68) = 0;
    uint64_t v6 = *(void *)(result + 144);
    unint64_t v7 = *(void *)(result + 152) - v6;
    unint64_t v8 = v7 >> 2;
    if ((int)(v7 >> 2) >= 1)
    {
      uint64_t v9 = 0;
      uint64_t v10 = (v7 >> 2);
      do
      {
        *(_DWORD *)(v6 + 4 * v9) = v9;
        ++v9;
      }
      while (v10 != v9);
    }
    *(_DWORD *)(result + 44) = v8;
    *(_DWORD *)(result + 72) = v8;
    unint64_t v11 = *(_DWORD **)(result + 192);
    unint64_t v12 = *(void *)(result + 200) - (void)v11;
    unint64_t v13 = v12 >> 2;
    if ((int)(v12 >> 2) >= 1)
    {
      uint64_t v14 = (v12 >> 2);
      do
      {
        *v11++ = v8;
        LODWORD(v8) = v8 + 1;
        --v14;
      }
      while (v14);
    }
    *(_DWORD *)(result + 48) = v13;
    if (*(unsigned char *)(result + 37))
    {
      *(_DWORD *)(result + 76) = 0;
      uint64_t v15 = *(void *)(result + 168);
      unint64_t v16 = *(void *)(result + 176) - v15;
      unint64_t v17 = v16 >> 2;
      if ((int)(v16 >> 2) < 1)
      {
        int v20 = 0;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = (v16 >> 2);
        do
        {
          *(_DWORD *)(v15 + 4 * v18) = v18;
          ++v18;
        }
        while (v19 != v18);
        int v20 = *(_DWORD *)(result + 76);
      }
      *(_DWORD *)(result + 52) = v17;
      int v30 = v20 + v17;
      *(_DWORD *)(result + 80) = v30;
      int v31 = *(_DWORD **)(result + 216);
      unint64_t v32 = *(void *)(result + 224) - (void)v31;
      unint64_t v33 = v32 >> 2;
      if ((int)(v32 >> 2) >= 1)
      {
        uint64_t v34 = (v32 >> 2);
        do
        {
          *v31++ = v30++;
          --v34;
        }
        while (v34);
        int v30 = *(_DWORD *)(result + 80);
      }
      *(_DWORD *)(result + 56) = v33;
      int v35 = v30 + v33;
      *(_DWORD *)(result + 84) = v30 + v33;
      int v36 = *(_DWORD **)(result + 240);
      unint64_t v37 = *(void *)(result + 248) - (void)v36;
      unint64_t v38 = v37 >> 2;
      if ((int)(v37 >> 2) >= 1)
      {
        uint64_t v39 = (v37 >> 2);
        do
        {
          *v36++ = v35++;
          --v39;
        }
        while (v39);
      }
      *(_DWORD *)(result + 60) = v38;
    }
    else
    {
      *(_DWORD *)(result + 84) = 0;
      uint64_t v24 = *(void *)(result + 240);
      unint64_t v25 = *(void *)(result + 248) - v24;
      unint64_t v26 = v25 >> 2;
      if ((int)(v25 >> 2) < 1)
      {
        int v29 = 0;
      }
      else
      {
        uint64_t v27 = 0;
        uint64_t v28 = (v25 >> 2);
        do
        {
          *(_DWORD *)(v24 + 4 * v27) = v27;
          ++v27;
        }
        while (v28 != v27);
        int v29 = *(_DWORD *)(result + 84);
      }
      *(_DWORD *)(result + 60) = v26;
      int v63 = v29 + v26;
      *(_DWORD *)(result + 76) = v63;
      int v64 = *(_DWORD **)(result + 168);
      unint64_t v65 = *(void *)(result + 176) - (void)v64;
      unint64_t v66 = v65 >> 2;
      if ((int)(v65 >> 2) >= 1)
      {
        uint64_t v67 = (v65 >> 2);
        do
        {
          *v64++ = v63++;
          --v67;
        }
        while (v67);
        int v63 = *(_DWORD *)(result + 76);
      }
      *(_DWORD *)(result + 52) = v66;
      int v68 = v63 + v66;
      *(_DWORD *)(result + 80) = v63 + v66;
      uint64_t v69 = *(_DWORD **)(result + 216);
      unint64_t v70 = *(void *)(result + 224) - (void)v69;
      unint64_t v71 = v70 >> 2;
      if ((int)(v70 >> 2) >= 1)
      {
        uint64_t v72 = (v70 >> 2);
        do
        {
          *v69++ = v68++;
          --v72;
        }
        while (v72);
      }
      *(_DWORD *)(result + 56) = v71;
    }
  }
  else
  {
    if ((int)v4 < 1)
    {
      int v23 = 0;
    }
    else
    {
      int v21 = 0;
      uint64_t v22 = (v3 >> 2);
      do
      {
        if (*v2) {
          int v23 = v21 + 1;
        }
        else {
          int v23 = v21;
        }
        if (!*v2) {
          int v21 = -1;
        }
        *v2++ = v21;
        int v21 = v23;
        --v22;
      }
      while (v22);
    }
    *(_DWORD *)(result + 40) = v23;
    *(_DWORD *)(result + 68) = 0;
    int v40 = *(int **)(result + 144);
    unint64_t v41 = *(void *)(result + 152) - (void)v40;
    if ((int)(v41 >> 2) < 1)
    {
      int v44 = 0;
    }
    else
    {
      int v42 = 0;
      uint64_t v43 = (v41 >> 2);
      do
      {
        if (*v40) {
          int v44 = v42 + 1;
        }
        else {
          int v44 = v42;
        }
        if (!*v40) {
          int v42 = -1;
        }
        *v40++ = v42;
        int v42 = v44;
        --v43;
      }
      while (v43);
    }
    *(_DWORD *)(result + 44) = v44;
    *(_DWORD *)(result + 72) = v44;
    int v45 = *(int **)(result + 192);
    unint64_t v46 = *(void *)(result + 200) - (void)v45;
    if ((int)(v46 >> 2) < 1)
    {
      int v47 = 0;
    }
    else
    {
      int v47 = 0;
      uint64_t v48 = (v46 >> 2);
      do
      {
        int v49 = v47 + v44;
        if (*v45)
        {
          ++v47;
          int v50 = v49;
        }
        else
        {
          int v50 = -1;
        }
        *v45++ = v50;
        --v48;
      }
      while (v48);
    }
    *(_DWORD *)(result + 48) = v47;
    if (*(unsigned char *)(result + 37))
    {
      *(_DWORD *)(result + 76) = 0;
      uint64_t v51 = *(int **)(result + 168);
      unint64_t v52 = *(void *)(result + 176) - (void)v51;
      if ((int)(v52 >> 2) < 1)
      {
        int v56 = 0;
        int v53 = 0;
      }
      else
      {
        int v53 = 0;
        uint64_t v54 = (v52 >> 2);
        do
        {
          if (*v51) {
            int v55 = v53;
          }
          else {
            int v55 = -1;
          }
          if (*v51) {
            ++v53;
          }
          *v51++ = v55;
          --v54;
        }
        while (v54);
        int v56 = *(_DWORD *)(result + 76);
      }
      *(_DWORD *)(result + 52) = v53;
      int v73 = v56 + v53;
      *(_DWORD *)(result + 80) = v73;
      int v74 = *(int **)(result + 216);
      unint64_t v75 = *(void *)(result + 224) - (void)v74;
      if ((int)(v75 >> 2) < 1)
      {
        int v76 = 0;
      }
      else
      {
        int v76 = 0;
        uint64_t v77 = (v75 >> 2);
        do
        {
          int v78 = v76 + v73;
          if (*v74)
          {
            ++v76;
            int v79 = v78;
          }
          else
          {
            int v79 = -1;
          }
          *v74++ = v79;
          --v77;
        }
        while (v77);
        int v73 = *(_DWORD *)(result + 80);
      }
      *(_DWORD *)(result + 56) = v76;
      int v80 = v73 + v76;
      *(_DWORD *)(result + 84) = v80;
      float v81 = *(int **)(result + 240);
      unint64_t v82 = *(void *)(result + 248) - (void)v81;
      if ((int)(v82 >> 2) < 1)
      {
        int v83 = 0;
      }
      else
      {
        int v83 = 0;
        uint64_t v84 = (v82 >> 2);
        do
        {
          int v85 = v83 + v80;
          if (*v81)
          {
            ++v83;
            int v86 = v85;
          }
          else
          {
            int v86 = -1;
          }
          *v81++ = v86;
          --v84;
        }
        while (v84);
      }
      *(_DWORD *)(result + 60) = v83;
    }
    else
    {
      *(_DWORD *)(result + 84) = 0;
      uint64_t v57 = *(int **)(result + 240);
      unint64_t v58 = *(void *)(result + 248) - (void)v57;
      if ((int)(v58 >> 2) < 1)
      {
        int v62 = 0;
        int v59 = 0;
      }
      else
      {
        int v59 = 0;
        uint64_t v60 = (v58 >> 2);
        do
        {
          if (*v57) {
            int v61 = v59;
          }
          else {
            int v61 = -1;
          }
          if (*v57) {
            ++v59;
          }
          *v57++ = v61;
          --v60;
        }
        while (v60);
        int v62 = *(_DWORD *)(result + 84);
      }
      *(_DWORD *)(result + 60) = v59;
      int v87 = v62 + v59;
      *(_DWORD *)(result + 76) = v87;
      int v88 = *(int **)(result + 168);
      unint64_t v89 = *(void *)(result + 176) - (void)v88;
      if ((int)(v89 >> 2) < 1)
      {
        int v90 = 0;
      }
      else
      {
        int v90 = 0;
        uint64_t v91 = (v89 >> 2);
        do
        {
          int v92 = v90 + v87;
          if (*v88)
          {
            ++v90;
            int v93 = v92;
          }
          else
          {
            int v93 = -1;
          }
          *v88++ = v93;
          --v91;
        }
        while (v91);
        int v87 = *(_DWORD *)(result + 76);
      }
      *(_DWORD *)(result + 52) = v90;
      int v94 = v87 + v90;
      *(_DWORD *)(result + 80) = v94;
      int v95 = *(int **)(result + 216);
      unint64_t v96 = *(void *)(result + 224) - (void)v95;
      if ((int)(v96 >> 2) < 1)
      {
        int v97 = 0;
      }
      else
      {
        int v97 = 0;
        uint64_t v98 = (v96 >> 2);
        do
        {
          int v99 = v97 + v94;
          if (*v95)
          {
            ++v97;
            int v100 = v99;
          }
          else
          {
            int v100 = -1;
          }
          *v95++ = v100;
          --v98;
        }
        while (v98);
      }
      *(_DWORD *)(result + 56) = v97;
    }
  }
  return result;
}

uint64_t sub_1B6E22B18(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = **(int **)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 336);
  unint64_t v6 = *(void *)(a1 + 344) - v5;
  BOOL v7 = v4 >= v6;
  unint64_t v8 = v4 - v6;
  if (v8 != 0 && v7)
  {
    sub_1B6E1BCF8((void **)(a1 + 336), v8);
    unint64_t v4 = **(int **)(a1 + 16);
  }
  else if (!v7)
  {
    *(void *)(a1 + 344) = v5 + v4;
  }
  sub_1B642863C(a1 + 264, v4);

  return sub_1B6E22CD0(a1, a2);
}

uint64_t sub_1B6E22B98(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = *(int *)(*(void *)(a1 + 16) + 4);
  uint64_t v5 = *(void *)(a1 + 360);
  unint64_t v6 = *(void *)(a1 + 368) - v5;
  BOOL v7 = v4 >= v6;
  unint64_t v8 = v4 - v6;
  if (v8 != 0 && v7)
  {
    sub_1B6E1BCF8((void **)(a1 + 360), v8);
    unint64_t v4 = *(int *)(*(void *)(a1 + 16) + 4);
  }
  else if (!v7)
  {
    *(void *)(a1 + 368) = v5 + v4;
  }
  sub_1B642863C(a1 + 288, v4);
  sub_1B6E22EC0(a1, a2);

  return sub_1B6E230B0(a1, a2);
}

uint64_t sub_1B6E22C24(uint64_t a1, unsigned char *a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 36);
  uint64_t v5 = (void *)(a1 + 384);
  unint64_t v6 = *(int *)(*(void *)(a1 + 16) + 8);
  uint64_t v7 = *(void *)(a1 + 384);
  unint64_t v8 = *(void *)(a1 + 392) - v7;
  if (v4)
  {
    if (v6 > v8)
    {
      uint64_t v9 = a2;
LABEL_6:
      sub_1B6E10C30(v5, v6 - v8, v9);
      goto LABEL_9;
    }
  }
  else if (v6 > v8)
  {
    uint64_t v9 = a2 + 4;
    goto LABEL_6;
  }
  if (v6 < v8) {
    *(void *)(a1 + 392) = v7 + v6;
  }
LABEL_9:
  sub_1B642863C(a1 + 312, *(int *)(*(void *)(a1 + 16) + 8));
  sub_1B6E231C0(a1, a2);
  sub_1B6E2325C(a1, a2);

  return sub_1B6E232EC(a1, a2);
}

uint64_t sub_1B6E22CD0(uint64_t result, unsigned char *a2)
{
  int v2 = **(_DWORD **)(result + 8);
  if (*(unsigned char *)(result + 36))
  {
    if (v2 >= 1)
    {
      uint64_t v3 = 0;
      int v4 = *(_DWORD *)(result + 64);
      do
      {
        int v5 = *(_DWORD *)(*(void *)(result + 88) + 8 * v3);
        if (v5 == 4)
        {
          *(unsigned char *)(*(void *)(result + 336) + v4) = *a2;
          uint64_t v6 = v4 + 1;
          *(unsigned char *)(*(void *)(result + 336) + v6) = a2[1];
          uint64_t v7 = v4 + 2;
          *(unsigned char *)(*(void *)(result + 336) + v7) = a2[2];
          uint64_t v8 = v4 + 3;
          *(unsigned char *)(*(void *)(result + 336) + v8) = a2[3];
          uint64_t v9 = *(void *)(result + 264);
          *(_DWORD *)(v9 + 4 * v4) = v3;
          *(_DWORD *)(v9 + 4 * v6) = v3;
          *(_DWORD *)(v9 + 4 * v7) = v3;
          *(_DWORD *)(v9 + 4 * v8) = v3;
          v4 += 4;
        }
        else if (v5 >= 1)
        {
          int v10 = 0;
          uint64_t v11 = v4;
          do
          {
            if (v5 <= 4) {
              int v12 = v10;
            }
            else {
              int v12 = 0;
            }
            *(unsigned char *)(*(void *)(result + 336) + v11) = a2[v12];
            *(_DWORD *)(*(void *)(result + 264) + 4 * v11) = v3;
            ++v10;
            ++v11;
          }
          while (v5 != v10);
          v4 += v10;
        }
        ++v3;
      }
      while (v3 < **(int **)(result + 8));
    }
  }
  else if (v2 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = (unsigned int *)(*(void *)(result + 88) + 8 * v13);
      uint64_t v15 = *v14;
      unint64_t v16 = (int *)(*(void *)(result + 120) + 4 * (int)v14[1]);
      if ((*(unsigned char *)(*(void *)(result + 408) + v13) & 1) != 0 && v15 == 4)
      {
        *(unsigned char *)(*(void *)(result + 336) + *v16) = *a2;
        *(unsigned char *)(*(void *)(result + 336) + v16[1]) = a2[1];
        *(unsigned char *)(*(void *)(result + 336) + v16[2]) = a2[2];
        *(unsigned char *)(*(void *)(result + 336) + v16[3]) = a2[3];
        uint64_t v17 = *(void *)(result + 264);
        *(_DWORD *)(v17 + 4 * *v16) = v13;
        *(_DWORD *)(v17 + 4 * v16[1]) = v13;
        *(_DWORD *)(v17 + 4 * v16[2]) = v13;
        *(_DWORD *)(v17 + 4 * v16[3]) = v13;
      }
      else if ((int)v15 >= 1)
      {
        uint64_t v18 = 0;
        BOOL v19 = (*(unsigned char *)(*(void *)(result + 408) + v13) & 1) == 0;
        do
        {
          uint64_t v20 = v16[v18];
          if (v20 != -1)
          {
            if ((int)v15 <= 4) {
              uint64_t v21 = v18;
            }
            else {
              uint64_t v21 = 0;
            }
            *(unsigned char *)(*(void *)(result + 336) + v20) = a2[4 * v19 + v21];
            *(_DWORD *)(*(void *)(result + 264) + 4 * v16[v18]) = v13;
          }
          ++v18;
        }
        while (v15 != v18);
      }
      ++v13;
    }
    while (v13 < **(int **)(result + 8));
  }
  return result;
}

uint64_t sub_1B6E22EC0(uint64_t result, unsigned char *a2)
{
  int v2 = **(_DWORD **)(result + 8);
  if (*(unsigned char *)(result + 36))
  {
    if (v2 >= 1)
    {
      uint64_t v3 = 0;
      int v4 = *(_DWORD *)(result + 68);
      do
      {
        int v5 = *(_DWORD *)(*(void *)(result + 104) + 8 * v3);
        if (v5 == 4)
        {
          *(unsigned char *)(*(void *)(result + 360) + v4) = *a2;
          uint64_t v6 = v4 + 1;
          *(unsigned char *)(*(void *)(result + 360) + v6) = a2[1];
          uint64_t v7 = v4 + 2;
          *(unsigned char *)(*(void *)(result + 360) + v7) = a2[2];
          uint64_t v8 = v4 + 3;
          *(unsigned char *)(*(void *)(result + 360) + v8) = a2[3];
          uint64_t v9 = *(void *)(result + 288);
          *(_DWORD *)(v9 + 4 * v4) = v3;
          *(_DWORD *)(v9 + 4 * v6) = v3;
          *(_DWORD *)(v9 + 4 * v7) = v3;
          *(_DWORD *)(v9 + 4 * v8) = v3;
          v4 += 4;
        }
        else if (v5 >= 1)
        {
          int v10 = 0;
          uint64_t v11 = v4;
          do
          {
            if (v5 <= 4) {
              int v12 = v10;
            }
            else {
              int v12 = 0;
            }
            *(unsigned char *)(*(void *)(result + 360) + v11) = a2[v12];
            *(_DWORD *)(*(void *)(result + 288) + 4 * v11) = v3;
            ++v10;
            ++v11;
          }
          while (v5 != v10);
          v4 += v10;
        }
        ++v3;
      }
      while (v3 < **(int **)(result + 8));
    }
  }
  else if (v2 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = (unsigned int *)(*(void *)(result + 104) + 8 * v13);
      uint64_t v15 = *v14;
      unint64_t v16 = (int *)(*(void *)(result + 144) + 4 * (int)v14[1]);
      if ((*(unsigned char *)(*(void *)(result + 408) + v13) & 1) != 0 && v15 == 4)
      {
        *(unsigned char *)(*(void *)(result + 360) + *v16) = *a2;
        *(unsigned char *)(*(void *)(result + 360) + v16[1]) = a2[1];
        *(unsigned char *)(*(void *)(result + 360) + v16[2]) = a2[2];
        *(unsigned char *)(*(void *)(result + 360) + v16[3]) = a2[3];
        uint64_t v17 = *(void *)(result + 288);
        *(_DWORD *)(v17 + 4 * *v16) = v13;
        *(_DWORD *)(v17 + 4 * v16[1]) = v13;
        *(_DWORD *)(v17 + 4 * v16[2]) = v13;
        *(_DWORD *)(v17 + 4 * v16[3]) = v13;
      }
      else if ((int)v15 >= 1)
      {
        uint64_t v18 = 0;
        BOOL v19 = (*(unsigned char *)(*(void *)(result + 408) + v13) & 1) == 0;
        do
        {
          uint64_t v20 = v16[v18];
          if (v20 != -1)
          {
            if ((int)v15 <= 4) {
              uint64_t v21 = v18;
            }
            else {
              uint64_t v21 = 0;
            }
            *(unsigned char *)(*(void *)(result + 360) + v20) = a2[4 * v19 + v21];
            *(_DWORD *)(*(void *)(result + 288) + 4 * v16[v18]) = v13;
          }
          ++v18;
        }
        while (v15 != v18);
      }
      ++v13;
    }
    while (v13 < **(int **)(result + 8));
  }
  return result;
}

uint64_t sub_1B6E230B0(uint64_t result, unsigned char *a2)
{
  int v2 = *(_DWORD *)(*(void *)(result + 8) + 4);
  if (*(unsigned char *)(result + 36))
  {
    if (v2 >= 1)
    {
      int v3 = 0;
      uint64_t v4 = *(int *)(result + 72);
      do
      {
        *(unsigned char *)(*(void *)(result + 360) + v4) = *a2;
        *(unsigned char *)(*(void *)(result + 360) + v4 + 1) = a2[1];
        int v5 = (_DWORD *)(*(void *)(result + 288) + 4 * v4);
        *int v5 = v3;
        v5[1] = v3++;
        v4 += 2;
      }
      while (v3 < *(_DWORD *)(*(void *)(result + 8) + 4));
    }
  }
  else if (v2 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = (int *)(*(void *)(result + 192) + 8 * v6);
      if (*(unsigned char *)(*(void *)(result + 432) + v6))
      {
        *(unsigned char *)(*(void *)(result + 360) + *v7) = *a2;
        *(unsigned char *)(*(void *)(result + 360) + v7[1]) = a2[1];
        uint64_t v12 = *(void *)(result + 288);
        *(_DWORD *)(v12 + 4 * *v7) = v6;
        *(_DWORD *)(v12 + 4 * v7[1]) = v6;
      }
      else
      {
        uint64_t v8 = 0;
        char v9 = 1;
        do
        {
          char v10 = v9;
          uint64_t v11 = v7[v8];
          if (v11 != -1)
          {
            *(unsigned char *)(*(void *)(result + 360) + v11) = a2[v8 + 4];
            *(_DWORD *)(*(void *)(result + 288) + 4 * v7[v8]) = v6;
          }
          char v9 = 0;
          uint64_t v8 = 1;
        }
        while ((v10 & 1) != 0);
      }
      ++v6;
    }
    while (v6 < *(int *)(*(void *)(result + 8) + 4));
  }
  return result;
}

uint64_t sub_1B6E231C0(uint64_t result, unsigned char *a2)
{
  if (*(_DWORD *)(result + 52))
  {
    int v2 = *(int **)(result + 8);
    int v3 = *v2;
    if (*(unsigned char *)(result + 36))
    {
      if (v3 >= 1)
      {
        uint64_t v4 = 0;
        uint64_t v5 = *(void *)(result + 312) + 4 * *(int *)(result + 76);
        do
        {
          *(_DWORD *)(v5 + 4 * v4) = v4;
          ++v4;
        }
        while ((int)v4 < *v2);
      }
    }
    else if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        uint64_t v7 = *(int *)(*(void *)(result + 168) + 4 * i);
        if (v7 != -1)
        {
          if (*(unsigned char *)(*(void *)(result + 408) + i))
          {
            *(unsigned char *)(*(void *)(result + 384) + v7) = *a2;
            int v2 = *(int **)(result + 8);
          }
          *(_DWORD *)(*(void *)(result + 312) + 4 * v7) = i;
          int v3 = *v2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1B6E2325C(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  int v3 = *(_DWORD *)(v2 + 4);
  if (*(unsigned char *)(result + 36))
  {
    if (v3 >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = *(void *)(result + 312) + 4 * *(int *)(result + 80);
      do
      {
        *(_DWORD *)(v5 + 4 * v4) = v4;
        ++v4;
      }
      while ((int)v4 < *(_DWORD *)(v2 + 4));
    }
  }
  else if (v3 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(int *)(*(void *)(result + 216) + 4 * v6);
      if (v7 != -1)
      {
        if (*(unsigned char *)(*(void *)(result + 432) + v6))
        {
          *(unsigned char *)(*(void *)(result + 384) + v7) = *a2;
          uint64_t v2 = *(void *)(result + 8);
        }
        *(_DWORD *)(*(void *)(result + 312) + 4 * v7) = v6;
      }
      ++v6;
    }
    while (v6 < *(int *)(v2 + 4));
  }
  return result;
}

uint64_t sub_1B6E232EC(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  int v3 = *(_DWORD *)(v2 + 8);
  if (*(unsigned char *)(result + 36))
  {
    if (v3 >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = *(void *)(result + 312) + 4 * *(int *)(result + 84);
      do
      {
        *(_DWORD *)(v5 + 4 * v4) = v4;
        ++v4;
      }
      while ((int)v4 < *(_DWORD *)(v2 + 8));
    }
  }
  else if (v3 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(int *)(*(void *)(result + 240) + 4 * v6);
      if (v7 != -1)
      {
        if (*(unsigned char *)(*(void *)(result + 456) + v6))
        {
          *(unsigned char *)(*(void *)(result + 384) + v7) = *a2;
          uint64_t v2 = *(void *)(result + 8);
        }
        *(_DWORD *)(*(void *)(result + 312) + 4 * v7) = v6;
      }
      ++v6;
    }
    while (v6 < *(int *)(v2 + 8));
  }
  return result;
}

uint64_t sub_1B6E2337C(uint64_t a1)
{
  uint64_t v2 = *(int **)(a1 + 16);
  uint64_t v3 = *((void *)v2 + 12);
  unint64_t v4 = *v2;
  unint64_t v5 = *((void *)v2 + 13) - v3;
  if (v4 <= v5)
  {
    if (v4 < v5) {
      *((void *)v2 + 13) = v3 + v4;
    }
  }
  else
  {
    sub_1B6E1BCF8((void **)v2 + 12, v4 - v5);
  }

  return sub_1B6E2350C(a1);
}

uint64_t sub_1B6E233E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(v2 + 240);
  unint64_t v4 = *(int *)(v2 + 4);
  unint64_t v5 = *(void *)(v2 + 248) - v3;
  if (v4 <= v5)
  {
    if (v4 < v5) {
      *(void *)(v2 + 248) = v3 + v4;
    }
  }
  else
  {
    sub_1B6E1BCF8((void **)(v2 + 240), v4 - v5);
  }
  uint64_t v6 = *(int *)(a1 + 44);
  if ((int)v6 >= 1)
  {
    uint64_t v7 = *(int *)(a1 + 68);
    uint64_t v8 = v7 + v6;
    do
      *(unsigned char *)(*(void *)(*(void *)(a1 + 16) + 240) + v7++) = 0;
    while (v7 < v8);
  }

  return sub_1B6E2354C(a1);
}

uint64_t sub_1B6E23478(uint64_t a1)
{
  sub_1B6E1BBD4(*(void *)(a1 + 16) + 432, *(int *)(*(void *)(a1 + 16) + 8));
  sub_1B6E2358C(a1);
  sub_1B6E23638((void *)a1);
  uint64_t result = sub_1B6E236D8(a1);
  if (!*(unsigned char *)(a1 + 36))
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (*(int *)(v3 + 8) >= 1)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(unsigned char *)(*(void *)(a1 + 384) + v4))
        {
          *(_WORD *)(*(void *)(v3 + 432) + 2 * v4) |= 0x800u;
          uint64_t v3 = *(void *)(a1 + 16);
        }
        ++v4;
      }
      while (v4 < *(int *)(v3 + 8));
    }
  }
  return result;
}

uint64_t sub_1B6E2350C(uint64_t result)
{
  uint64_t v1 = *(int *)(result + 40);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(result + 64);
    uint64_t v3 = v1 + v2;
    do
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 16) + 96) + v2) = *(unsigned char *)(*(void *)(*(void *)(result + 8)
                                                                                           + 96)
                                                                               + *(int *)(*(void *)(result + 264)
                                                                                        + 4 * v2));
      ++v2;
    }
    while (v2 < v3);
  }
  return result;
}

uint64_t sub_1B6E2354C(uint64_t result)
{
  uint64_t v1 = *(int *)(result + 48);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(result + 72);
    uint64_t v3 = v1 + v2;
    do
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 16) + 240) + v2) = *(unsigned char *)(*(void *)(*(void *)(result + 8)
                                                                                            + 240)
                                                                                + *(int *)(*(void *)(result + 288)
                                                                                         + 4 * v2));
      ++v2;
    }
    while (v2 < v3);
  }
  return result;
}

uint64_t sub_1B6E2358C(uint64_t result)
{
  uint64_t v1 = *(int *)(result + 52);
  if (v1)
  {
    uint64_t v2 = *(int *)(result + 76);
    uint64_t v3 = v2 + v1;
    if (*(int *)(*(void *)(result + 8) + 12) <= 0)
    {
      if ((int)v1 >= 1)
      {
        do
        {
          *(_WORD *)(*(void *)(*(void *)(result + 16) + 432) + 2 * v2) = 128;
          if (*(_DWORD *)(*(void *)(*(void *)(result + 8) + 24)
                         + 8 * *(int *)(*(void *)(result + 312) + 4 * v2)) != *(_DWORD *)(result + 32))
            *(_WORD *)(*(void *)(*(void *)(result + 16) + 432) + 2 * v2) |= 2u;
          ++v2;
        }
        while (v2 < v3);
      }
    }
    else if ((int)v1 >= 1)
    {
      do
        *(_WORD *)(*(void *)(*(void *)(result + 16) + 432) + 2 * v2++) = 128;
      while (v2 < (int)v3);
    }
  }
  return result;
}

void *sub_1B6E23638(void *result)
{
  uint64_t v1 = result[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    do
    {
      uint64_t v4 = *(int *)(result[27] + 4 * v2);
      if (v4 != -1)
      {
        unsigned int v5 = *(unsigned __int8 *)(*(void *)(v1 + 240) + v2);
        unsigned int v6 = v3 & 0xFFFF883A | v5 & 1 | (4 * ((v5 >> 1) & 1)) & 0xFFFFFFBF | (((v5 >> 3) & 1) << 6);
        unsigned int v7 = v5 >> 2;
        int v8 = (~v5 & 5) == 0;
        if ((v5 & 0xC) != 0) {
          int v9 = 512;
        }
        else {
          int v9 = 128;
        }
        unsigned int v3 = v6 & 0xFFFFCFFF | (v8 << 14) | ((v7 & 1) << 12) & 0xDFFF | ((v7 & 1) << 13) | v9;
        *(_WORD *)(*(void *)(result[2] + 432) + 2 * v4) = v3;
        uint64_t v1 = result[1];
      }
      ++v2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return result;
}

uint64_t sub_1B6E236D8(uint64_t result)
{
  uint64_t v1 = *(int *)(result + 60);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(result + 84);
    uint64_t v3 = v1 + v2;
    do
    {
      *(_WORD *)(*(void *)(*(void *)(result + 16) + 432) + 2 * v2) = *(_WORD *)(*(void *)(*(void *)(result + 8)
                                                                                                + 432)
                                                                                    + 2
                                                                                    * *(int *)(*(void *)(result + 312)
                                                                                             + 4 * v2));
      ++v2;
    }
    while (v2 < v3);
  }
  return result;
}

void sub_1B6E23718(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v26 = *(_DWORD *)(a1 + 24);
  char v2 = v26;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 + 216);
  v3 += 216;
  *(void *)(v3 + 8) = v4;
  sub_1B6E23D10(v3, *(int *)(v3 - 212), &dword_1B6ED08AC);
  uint64_t v27 = (float *)&v29;
  uint64_t v28 = 0x1000000000;
  __p = 0;
  if ((v2 & 0x60) != 0 && (uint64_t v5 = *(unsigned int *)(*(void *)(a1 + 8) + 20), v5 >= 0x11))
  {
    operator delete(0);
    unsigned int v6 = operator new(4 * v5);
    __p = v6;
    uint64_t v27 = (float *)v6;
    HIDWORD(v28) = v5;
  }
  else
  {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(int *)(a1 + 48);
  if ((int)v7 >= 1)
  {
    uint64_t v8 = *(int *)(a1 + 72);
    uint64_t v9 = v7 + v8;
    while (1)
    {
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(v10 + 216);
      uint64_t v12 = *(void *)(v10 + 240);
      if ((*(unsigned char *)(v12 + v8) & 4) != 0)
      {
        *(_DWORD *)(v11 + 4 * v8) = 1092616192;
      }
      else if ((*(unsigned char *)(v12 + v8) & 8) != 0)
      {
        uint64_t v13 = *(int *)(*(void *)(a1 + 288) + 4 * v8);
        uint64_t v14 = *(void **)(a1 + 8);
        uint64_t v15 = v14[27];
        float v16 = *(float *)(v15 + 4 * v13);
        if ((v26 & 0x60) != 0)
        {
          uint64_t v17 = *(int *)(v14[15]
                       + 8 * v13
                       + 4 * (((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 360) + v8) >> 3) & 3));
          uint64_t v18 = v14[42];
          int v19 = *(_DWORD *)(v18 + 8 * v17);
          uint64_t v20 = v27;
          if (v19 >= 1)
          {
            uint64_t v21 = (int *)(v14[45] + 4 * *(int *)(v18 + 8 * v17 + 4));
            uint64_t v22 = *(unsigned int *)(v18 + 8 * v17);
            int v23 = v27;
            do
            {
              uint64_t v24 = *v21++;
              *v23++ = *(float *)(v15 + 4 * v24);
              --v22;
            }
            while (v22);
          }
          float v25 = sub_1B6E18844(&v26, v19, v20, v16);
          goto LABEL_14;
        }
        if (v16 <= 0.0) {
          goto LABEL_21;
        }
        float v25 = 10.0;
        if (v16 >= 10.0)
        {
LABEL_14:
          *(float *)(v11 + 4 * v8) = v25;
          if (v25 > 0.0) {
            goto LABEL_23;
          }
        }
        else
        {
          if (v16 > 1.0)
          {
            float v25 = v16 + -1.0;
            goto LABEL_14;
          }
LABEL_21:
          *(_DWORD *)(v11 + 4 * v8) = 0;
        }
        *(unsigned char *)(v12 + v8) &= ~8u;
      }
LABEL_23:
      if (++v8 >= v9)
      {
        unsigned int v6 = __p;
        break;
      }
    }
  }
  operator delete(v6);
}

void sub_1B6E23944(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(v2 + 416) = *(void *)(v2 + 408);
  sub_1B6E23D10(v2 + 408, *(int *)(v2 + 8), &dword_1B6ED08AC);
  uint64_t v3 = *(int *)(a1 + 60);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = *(int *)(a1 + 84);
    uint64_t v5 = v3 + v4;
    do
    {
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v7 = *(void *)(v6 + 408);
      uint64_t v8 = *(void *)(v6 + 432);
      __int16 v9 = *(_WORD *)(v8 + 2 * v4);
      if ((v9 & 0x10) != 0)
      {
        *(_DWORD *)(v7 + 4 * v4) = 1092616192;
      }
      else if ((v9 & 0x20) != 0)
      {
        float v10 = *(float *)(*(void *)(*(void *)(a1 + 8) + 408) + 4 * *(int *)(*(void *)(a1 + 312) + 4 * v4));
        if (v10 <= 0.0) {
          goto LABEL_12;
        }
        float v11 = 10.0;
        if (v10 >= 10.0)
        {
LABEL_9:
          *(float *)(v7 + 4 * v4) = v11;
          if (v11 > 0.0) {
            goto LABEL_14;
          }
        }
        else
        {
          if (v10 > 1.0)
          {
            float v11 = v10 + -1.0;
            goto LABEL_9;
          }
LABEL_12:
          *(_DWORD *)(v7 + 4 * v4) = 0;
        }
        *(_WORD *)(v8 + 2 * v4) &= ~0x20u;
      }
LABEL_14:
      ++v4;
    }
    while (v4 < v5);
  }
}

uint64_t sub_1B6E23A34(uint64_t result)
{
  uint64_t v1 = result;
  int v42 = *(_DWORD *)(result + 24);
  uint64_t v2 = *(int *)(result + 56);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = *(int *)(result + 80);
    uint64_t v4 = v2 + v3;
    do
    {
      uint64_t v5 = *(void *)(v1 + 16);
      uint64_t v6 = *(void *)(v5 + 432);
      __int16 v7 = *(_WORD *)(v6 + 2 * v3);
      if ((v7 & 0x40) != 0)
      {
        uint64_t v8 = (int *)(*(void *)(v1 + 192) + 8 * *(int *)(*(void *)(v1 + 312) + 4 * v3));
        if (*(unsigned char *)(*(void *)(v1 + 384) + v3))
        {
          uint64_t v11 = *v8;
          if (v11 != -1 && (*(unsigned char *)(*(void *)(v5 + 240) + v11) & 8) != 0)
          {
            __int16 v13 = v7 & 0xF83F | 0x40;
            __int16 v14 = 512;
          }
          else
          {
            uint64_t v12 = v8[1];
            if (v12 == -1)
            {
              __int16 v13 = v7 & 0xF83F;
              __int16 v14 = 128;
            }
            else
            {
              __int16 v13 = v7 & 0xF83F;
              if ((*(unsigned char *)(*(void *)(v5 + 240) + v12) & 8) != 0)
              {
                v13 |= 0x40u;
                __int16 v14 = 512;
              }
              else
              {
                __int16 v14 = 128;
              }
            }
          }
          __int16 v10 = v14 | v13;
        }
        else
        {
          int v9 = ((*(unsigned __int8 *)(*(void *)(v5 + 240) + v8[1]) >> 3) & 1)
             + ((*(unsigned __int8 *)(*(void *)(v5 + 240) + *v8) >> 3) & 1);
          *(_WORD *)(v6 + 2 * v3) = v7 & 0xFFBF | ((v9 != 0) << 6);
          uint64_t result = sub_1B6E18700(0.0, (uint64_t)&v42, v9);
          __int16 v10 = *(_WORD *)(v6 + 2 * v3) & 0xF87F | ((result & 0xF) << 7);
        }
        *(_WORD *)(v6 + 2 * v3) = v10;
      }
      ++v3;
    }
    while (v3 < v4);
  }
  uint64_t v15 = *(int *)(v1 + 60);
  if ((int)v15 >= 1)
  {
    uint64_t v16 = *(int *)(v1 + 84);
    uint64_t v17 = v15 + v16;
    do
    {
      uint64_t v18 = *(int *)(*(void *)(v1 + 312) + 4 * v16);
      int v19 = *(void **)(v1 + 8);
      unsigned int v20 = *(unsigned __int16 *)(v19[54] + 2 * v18);
      if ((v20 & 0x60) == 0) {
        goto LABEL_34;
      }
      uint64_t v21 = *(void **)(v1 + 16);
      uint64_t v22 = v21[54];
      __int16 v23 = *(_WORD *)(v22 + 2 * v16);
      if ((v20 & 0x40) == 0 && (((v23 & 0x20) == 0) & (v20 >> 5)) == 0) {
        goto LABEL_34;
      }
      uint64_t v24 = v21[45];
      if ((int)((unint64_t)(v21[46] - v24) >> 2) < 1)
      {
        uint64_t v31 = v19[42];
        uint64_t v32 = *(unsigned int *)(v31 + 8 * v18);
        if ((int)v32 >= 1)
        {
          uint64_t v33 = *(int *)(v31 + 8 * v18 + 4);
          uint64_t v34 = (int *)(v19[45] + 4 * v33);
          int v35 = (unsigned __int16 *)(v19[48] + 2 * v33);
          int32x2_t v28 = 0;
          uint64_t v36 = v21[30];
          do
          {
            uint64_t v37 = *v34++;
            uint64_t v38 = *(void *)(v1 + 192) + 8 * v37;
            LODWORD(v37) = *v35++;
            int32x2_t v28 = vadd_s32(v28, (int32x2_t)(*(void *)&vshl_u32((uint32x2_t)vand_s8((int8x8_t)vdup_n_s32(*(unsigned __int8 *)(v36 + *(int *)(v38 + 4 * v37))), (int8x8_t)0xFF000000FFLL), (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1));
            --v32;
          }
          while (v32);
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v25 = v21[42];
        uint64_t v26 = *(unsigned int *)(v25 + 8 * (int)v16);
        if ((int)v26 >= 1)
        {
          uint64_t v27 = (int *)(v24 + 4 * *(int *)(v25 + 8 * v16 + 4));
          int32x2_t v28 = 0;
          uint64_t v29 = v21[30];
          do
          {
            uint64_t v30 = *v27++;
            int32x2_t v28 = vadd_s32(v28, (int32x2_t)(*(void *)&vshl_u32((uint32x2_t)vand_s8((int8x8_t)vdup_n_s32(*(unsigned __int8 *)(v29 + v30)), (int8x8_t)0xFF000000FFLL), (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1));
            --v26;
          }
          while (v26);
LABEL_30:
          __int32 v39 = v28.i32[0];
          __int16 v40 = (v28.i32[0] > 0) << 6;
          __int32 v41 = v28.i32[1];
          goto LABEL_32;
        }
      }
      __int32 v41 = 0;
      __int32 v39 = 0;
      __int16 v40 = 0;
LABEL_32:
      *(_WORD *)(v22 + 2 * v16) = v40 | v23 & 0xFFBF;
      if ((v23 & 0x30) == 0)
      {
        uint64_t result = sub_1B6E18700(0.0, (uint64_t)&v42, v41 + v39);
        *(_WORD *)(v22 + 2 * v16) = ((result & 0xF) << 7) | *(_WORD *)(v22 + 2 * v16) & 0xF87F;
      }
LABEL_34:
      ++v16;
    }
    while (v16 < v17);
  }
  return result;
}

void sub_1B6E23D10(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_1B6E23FA4((void **)a1, a2 - v3, a3);
  }
}

void *sub_1B6E23D40(void *result)
{
  uint64_t v1 = result[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    for (uint64_t i = 0; i < *(int *)(v1 + 4); ++i)
    {
      unint64_t v3 = (_DWORD *)(result[24] + 8 * i);
      uint64_t v4 = result[54];
      if (*(unsigned char *)(v4 + i))
      {
        int v7 = 2;
        *unint64_t v3 = 2;
      }
      else
      {
        uint64_t v5 = (int *)(*(void *)(v1 + 120) + 8 * i);
        uint64_t v6 = result[57];
        if (*(unsigned char *)(v6 + *v5))
        {
          *unint64_t v3 = 1;
          *(_DWORD *)(result[27] + 4 * i) = 1;
        }
        if ((*(unsigned char *)(v6 + v5[1]) & 1) == 0) {
          goto LABEL_10;
        }
        int v7 = 1;
      }
      v3[1] = v7;
      *(_DWORD *)(result[27] + 4 * i) = v7;
LABEL_10:
      uint64_t v8 = *(void *)(v1 + 168);
      uint64_t v9 = *(void *)(v1 + 144);
      uint64_t v10 = *(int *)(v9 + ((8 * i) | 4));
      uint64_t v11 = *(unsigned int *)(v9 + 8 * i);
      if (v11 == 2)
      {
        char v12 = *(unsigned char *)(v4 + i) & 0xE1 | (2
                                         * ((*(unsigned char *)(result[51] + *(int *)(v8 + 4 * v10 + 4)) ^ *(unsigned char *)(result[51] + *(int *)(v8 + 4 * v10))) & 1));
      }
      else if ((int)v11 > 1)
      {
        __int16 v13 = (int *)(v8 + 4 * v10);
        uint64_t v15 = *v13;
        __int16 v14 = v13 + 1;
        int v16 = *(unsigned __int8 *)(result[51] + v15);
        char v17 = *(unsigned char *)(v4 + i) & 0xE1;
        *(unsigned char *)(v4 + i) = v17;
        uint64_t v18 = v11 - 1;
        while (1)
        {
          uint64_t v19 = *v14++;
          if ((*(unsigned __int8 *)(result[51] + v19) ^ v16)) {
            break;
          }
          if (!--v18) {
            goto LABEL_20;
          }
        }
        char v12 = v17 | 2;
      }
      else
      {
        char v12 = *(unsigned char *)(v4 + i) & 0xE1;
      }
      *(unsigned char *)(v4 + i) = v12;
LABEL_20:
      uint64_t v1 = result[1];
    }
  }
  return result;
}

void sub_1B6E23E78(void *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v5 = (unsigned char *)a1[1];
  uint64_t v4 = a1[2];
  if (v4 - (uint64_t)v5 >= a2)
  {
    if (a2)
    {
      uint64_t v11 = &v5[a2];
      do
      {
        *v5++ &= 0xE0u;
        --v2;
      }
      while (v2);
      uint64_t v5 = v11;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = &v5[-*a1];
    unint64_t v7 = (unint64_t)&v6[a2];
    if ((uint64_t)&v6[a2] < 0) {
      abort();
    }
    unint64_t v8 = v4 - *a1;
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v9 = v7;
    }
    if (v9) {
      uint64_t v10 = operator new(v9);
    }
    else {
      uint64_t v10 = 0;
    }
    char v12 = &v6[(void)v10];
    __int16 v13 = &v6[(void)v10 + v2];
    __int16 v14 = &v6[(void)v10];
    do
    {
      *v14++ &= 0xE0u;
      --v2;
    }
    while (v2);
    uint64_t v15 = (unsigned char *)*a1;
    if (v5 != (unsigned char *)*a1)
    {
      do
      {
        char v16 = *--v5;
        *--char v12 = v16;
      }
      while (v5 != v15);
      uint64_t v5 = (unsigned char *)*a1;
    }
    *a1 = v12;
    a1[1] = v13;
    a1[2] = (char *)v10 + v9;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void sub_1B6E23FA4(void **a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  size_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      char v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      size_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      abort();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      uint64_t v15 = (char *)sub_1B64282E0(v6, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v18 = &v15[4 * v12];
    uint64_t v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    uint64_t v21 = v18;
    do
    {
      *(_DWORD *)uint64_t v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    uint64_t v22 = &v15[4 * v14];
    __int16 v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void *sub_1B6E240C4(void *result)
{
  off_1E9E48C68 = result;
  return result;
}

void *sub_1B6E240D0(void *result)
{
  off_1E9E48C70 = result;
  return result;
}

uint64_t sub_1B6E240DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v10 = v9;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x2800uLL, v11, &a9);
  if (off_1E9E48C68) {
    return off_1E9E48C68(v10, __str);
  }
  else {
    return printf("%s: %s\n", off_1E6146650[v10], __str);
  }
}

uint64_t sub_1B6E241AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x2800uLL, v9, &a9);
  if (off_1E9E48C70) {
    return off_1E9E48C70(__str);
  }
  else {
    return fprintf((FILE *)*MEMORY[0x1E4F143D8], "Warning: %s\n", __str);
  }
}

void *sub_1B6E2426C(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD *result = a2;
  result[1] = *(void *)(a2 + 8);
  result[2] = a3;
  result[3] = *(void *)(a2 + 16);
  result[4] = a4;
  result[6] = 0;
  result[7] = 0;
  result[5] = 0;
  return result;
}

uint64_t sub_1B6E2428C(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
  return a1;
}

void *sub_1B6E242C0(uint64_t *a1)
{
  *(_WORD *)(a1[4] + 8) = *(_WORD *)(a1[2] + 8);
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[4];
  *(unsigned char *)(v3 + 12) = *(unsigned char *)(v2 + 12);
  *(_WORD *)(v3 + 13) = *(_WORD *)(v2 + 13);
  sub_1B6E2438C(a1);
  sub_1B6E24498(a1);
  sub_1B6E24520((uint64_t)a1);
  sub_1B6E245D8(a1);
  sub_1B6E24660((int **)a1);
  uint64_t v4 = a1[4];
  if (!*(unsigned char *)(v4 + 13))
  {
    sub_1B6E247B4(a1);
    sub_1B6E248FC(a1);
    uint64_t v4 = a1[4];
  }
  if (*(_DWORD *)(v4 + 16) <= *(_DWORD *)(a1[3] + 8))
  {
    return sub_1B6E10718((void **)v4);
  }
  else
  {
    return sub_1B6E10734((void *)v4);
  }
}

void sub_1B6E2438C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  int v3 = *(_DWORD *)(*a1 + 52);
  uint64_t v4 = *(int *)(*a1 + 56);
  if ((int)v4 >= 1)
  {
    uint64_t v5 = *(int *)(v2 + 80);
    uint64_t v6 = v4 + v5;
    do
    {
      uint64_t v7 = *(int *)(*(void *)(v2 + 312) + 4 * v5);
      if (*(unsigned char *)(*(void *)(a1[2] + 48) + v7)) {
        int v8 = *(_DWORD *)(*(void *)(a1[1] + 144) + 8 * v7);
      }
      else {
        int v8 = 1;
      }
      v3 += v8;
      ++v5;
    }
    while (v5 < v6);
  }
  uint64_t v9 = *(int *)(v2 + 60);
  if ((int)v9 >= 1)
  {
    uint64_t v10 = *(int *)(v2 + 84);
    uint64_t v11 = v9 + v10;
    uint64_t v12 = *(void *)(v2 + 312);
    do
      v3 += *(unsigned __int16 *)(*(void *)(a1[2] + 72) + 2 * *(int *)(v12 + 4 * v10++));
    while (v10 < v11);
  }
  sub_1B6E0F72C((void *)a1[4]);
  uint64_t v13 = a1[4];
  uint64_t v14 = *(void *)(v13 + 168);
  unint64_t v15 = *(void *)(v13 + 176) - v14;
  if (v3 <= v15)
  {
    if (v3 < v15) {
      *(void *)(v13 + 176) = v14 + v3;
    }
  }
  else
  {
    sub_1B6E1BCF8((void **)(v13 + 168), v3 - v15);
  }
  __int16 v16 = 0;
  sub_1B6E0F7E8((uint64_t)(a1 + 5), v3, &v16);
}

void *sub_1B6E24498(void *a1)
{
  *(_DWORD *)(a1[4] + 16) = 0;
  if (*(unsigned char *)(*a1 + 37))
  {
    sub_1B6E24C10(a1);
    sub_1B6E24C60(a1);
    return sub_1B6E24DD0(a1);
  }
  else
  {
    sub_1B6E24DD0(a1);
    sub_1B6E24C10(a1);
    return sub_1B6E24C60(a1);
  }
}

void sub_1B6E24520(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 168);
  unint64_t v4 = *(int *)(v2 + 16);
  unint64_t v5 = *(void *)(v2 + 176) - v3;
  if (v4 <= v5)
  {
    if (v4 < v5) {
      *(void *)(v2 + 176) = v3 + v4;
    }
  }
  else
  {
    sub_1B6E1BCF8((void **)(v2 + 168), v4 - v5);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(v2 + 13))
  {
    sub_1B6E0F894(v2 + 192, *(int *)(v2 + 16));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  sub_1B6459120(a1 + 40, *(int *)(v2 + 16));
  sub_1B642863C(*(void *)(a1 + 32) + 144, *(int *)(*(void *)(a1 + 32) + 16));
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(int *)(v6 + 16) >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)(v6 + 144);
    do
    {
      *(_DWORD *)(v8 + 4 * v7) = v7;
      ++v7;
    }
    while (v7 < *(int *)(v6 + 16));
  }
}

void *sub_1B6E245D8(void *result)
{
  LODWORD(v1) = *(_DWORD *)(*result + 44);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = 0;
    do
      *(unsigned char *)(*(void *)(result[4] + 48) + v2++) = 0;
    while (v2 < *(int *)(*result + 44));
    LODWORD(v1) = *(_DWORD *)(*result + 44);
  }
  if ((int)v1 < *(_DWORD *)(result[3] + 4))
  {
    uint64_t v1 = (int)v1;
    do
    {
      *(unsigned char *)(*(void *)(result[4] + 48) + v1) = *(unsigned char *)(*(void *)(result[2] + 48)
                                                                + *(int *)(*(void *)(*result + 288) + 4 * v1));
      ++v1;
    }
    while (v1 < *(int *)(result[3] + 4));
  }
  return result;
}

int **sub_1B6E24660(int **result)
{
  uint64_t v1 = result;
  uint64_t v2 = *result;
  int v3 = (*result)[13];
  if (v3 >= 1)
  {
    int v4 = v2[19];
    int v5 = v3 + v4;
    uint64_t v6 = *(int *)(*((void *)result[4] + 12) + 4 * v4);
    do
    {
      *(unsigned char *)(*((void *)result[4] + 21) + v6) = 0;
      ++v4;
      ++v6;
    }
    while (v4 < v5);
    uint64_t v2 = *result;
  }
  uint64_t v7 = v2[14];
  if ((int)v7 >= 1)
  {
    uint64_t v8 = v2[20];
    uint64_t v9 = v7 + v8;
    if (*((unsigned char *)result[2] + 13)) {
      int v10 = 1;
    }
    else {
      int v10 = 9;
    }
    do
    {
      uint64_t v11 = v1[4];
      uint64_t v12 = *((void *)v11 + 9);
      if (*(_WORD *)(v12 + 2 * v8))
      {
        if ((*(unsigned char *)(*((void *)v1[2] + 6) + *(int *)(*((void *)*v1 + 39) + 4 * v8)) & 9) != 0) {
          int v13 = v10;
        }
        else {
          int v13 = 0;
        }
        uint64_t result = (int **)memset((void *)(*((void *)v11 + 21) + *(int *)(*((void *)v11 + 12) + 4 * v8)), v13, *(unsigned __int16 *)(v12 + 2 * v8));
      }
      ++v8;
    }
    while (v8 < v9);
    uint64_t v2 = *v1;
  }
  uint64_t v14 = v2[15];
  if ((int)v14 >= 1)
  {
    uint64_t v15 = v2[21];
    uint64_t v16 = v14 + v15;
    do
    {
      uint64_t v17 = *(int *)(*((void *)*v1 + 39) + 4 * v15);
      uint64_t result = (int **)memcpy((void *)(*((void *)v1[4] + 21) + *(int *)(*((void *)v1[4] + 12) + 4 * v15++)), (const void *)(*((void *)v1[2] + 21) + *(int *)(*((void *)v1[2] + 12) + 4 * v17)), *(unsigned __int16 *)(*((void *)v1[2] + 9) + 2 * v17));
    }
    while (v15 < v16);
  }
  return result;
}

void *sub_1B6E247B4(void *result)
{
  uint64_t v1 = *result;
  if (*(_DWORD *)(*result + 32) == 4) {
    __int16 v2 = 2;
  }
  else {
    __int16 v2 = 3;
  }
  uint64_t v3 = *(int *)(v1 + 56);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = *(int *)(v1 + 80);
    uint64_t v5 = v3 + v4;
    uint64_t v6 = (void *)result[4];
    uint64_t v7 = v6[9];
    uint64_t v8 = v6[12];
    uint64_t v9 = v6[21];
    do
    {
      uint64_t v10 = *(int *)(v8 + 4 * v4);
      uint64_t v11 = (char *)(v9 + v10);
      if ((*(unsigned char *)(v9 + v10) & 1) != 0 && (*(unsigned char *)(*(void *)(v1 + 384) + v4) & 1) == 0)
      {
        uint64_t v12 = *(unsigned __int16 *)(v7 + 2 * v4);
        if (*(_WORD *)(v7 + 2 * v4))
        {
          __int16 v13 = 0;
          uint64_t v14 = (_WORD *)(v6[24] + 4 * v10 + 2);
          do
          {
            char v15 = *v11++;
            if ((v15 & 0x18) != 0)
            {
              *(v14 - 1) = v13;
              *uint64_t v14 = v2 - 1 + v13;
            }
            v13 += v2;
            v14 += 2;
            --v12;
          }
          while (v12);
        }
      }
      ++v4;
    }
    while (v4 < v5);
  }
  uint64_t v16 = *(int *)(v1 + 60);
  if ((int)v16 >= 1)
  {
    uint64_t v17 = *(int *)(v1 + 84);
    uint64_t v18 = v16 + v17;
    do
    {
      uint64_t v19 = (void *)result[4];
      uint64_t v20 = *(int *)(v19[12] + 4 * v17);
      uint64_t v21 = (char *)(v19[21] + v20);
      if ((*v21 & 1) != 0 && (*(unsigned char *)(*(void *)(*result + 384) + v17) & 1) == 0)
      {
        uint64_t v22 = *(unsigned __int16 *)(v19[9] + 2 * v17);
        if (*(_WORD *)(v19[9] + 2 * v17))
        {
          __int16 v23 = (_DWORD *)(*(void *)(result[2] + 192)
                         + 4
                         * *(int *)(*(void *)(result[2] + 96)
                                  + 4 * *(int *)(*(void *)(*result + 312) + 4 * v17)));
          uint64_t v24 = (_DWORD *)(v19[24] + 4 * v20);
          do
          {
            char v25 = *v21++;
            if ((v25 & 0x18) != 0) {
              *uint64_t v24 = *v23;
            }
            ++v24;
            ++v23;
            --v22;
          }
          while (v22);
        }
      }
      ++v17;
    }
    while (v17 < v18);
  }
  return result;
}

void sub_1B6E248FC(void *a1)
{
  __int16 v2 = 0;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(a1[2] + 14);
  uint64_t v4 = *(unsigned int *)(a1[3] + 20);
  __int16 v40 = &v41;
  __p = 0;
  if (v4 >= 0x11)
  {
    __int16 v2 = operator new(4 * v4);
    __p = v2;
    __int16 v40 = (uint64_t *)v2;
  }
  uint64_t v5 = *(int *)(*a1 + 60);
  if ((int)v5 >= 1)
  {
    uint64_t v6 = *(int *)(*a1 + 84);
    uint64_t v7 = v5 + v6;
    while (1)
    {
      uint64_t v8 = (void *)a1[4];
      uint64_t v9 = *(int *)(v8[12] + 4 * v6);
      uint64_t v10 = (char *)(v8[21] + v9);
      if ((*v10 & 1) == 0) {
        goto LABEL_9;
      }
      uint64_t v11 = *a1;
      if (*(unsigned char *)(*(void *)(*a1 + 384) + v6)) {
        goto LABEL_9;
      }
      uint64_t v12 = *(int *)(*(void *)(v11 + 312) + 4 * v6);
      __int16 v13 = (void *)a1[1];
      if ((*(_WORD *)(v13[54] + 2 * v12) & 0x60) == 0) {
        goto LABEL_9;
      }
      uint64_t v14 = (void *)a1[3];
      __int16 v15 = *(_WORD *)(v14[54] + 2 * v6);
      if ((v15 & 0x30) != 0) {
        goto LABEL_9;
      }
      uint64_t v16 = *(unsigned __int16 *)(v8[9] + 2 * v6);
      if ((v15 & 0x40) == 0)
      {
        if (*(_WORD *)(v8[9] + 2 * v6))
        {
          do
          {
            if ((*v10 & 0x10) != 0) {
              *uint64_t v10 = *v10 & 0xC7 | 8;
            }
            ++v10;
            --v16;
          }
          while (v16);
        }
        goto LABEL_9;
      }
      uint64_t v17 = v8[24];
      uint64_t v18 = v14[45];
      if (((v14[46] - v18) & 0x3FFFFFFFCLL) != 0)
      {
        uint64_t v20 = v14[42];
        uint64_t v19 = (uint64_t *)(v18 + 4 * *(int *)(v20 + 8 * v6 + 4));
        LODWORD(v20) = *(_DWORD *)(v20 + 8 * (int)v6);
      }
      else
      {
        uint64_t v21 = v13[42];
        uint64_t v20 = *(unsigned int *)(v21 + 8 * v12);
        uint64_t v19 = v40;
        if ((int)v20 >= 1)
        {
          uint64_t v22 = 0;
          uint64_t v23 = *(int *)(v21 + 8 * v12 + 4);
          uint64_t v24 = v13[45] + 4 * v23;
          uint64_t v25 = v13[48] + 2 * v23;
          uint64_t v26 = *(void *)(v11 + 192);
          do
          {
            *((_DWORD *)v40 + v22) = *(_DWORD *)(v26
                                               + 8 * *(int *)(v24 + 4 * v22)
                                               + 4 * *(unsigned __int16 *)(v25 + 2 * v22));
            ++v22;
          }
          while (v20 != v22);
        }
      }
      if (v16) {
        break;
      }
LABEL_9:
      if (++v6 >= v7)
      {
        __int16 v2 = __p;
        goto LABEL_51;
      }
    }
    uint64_t v27 = 0;
    uint64_t v28 = v17 + 4 * v9;
    while (1)
    {
      char v29 = v10[v27];
      if ((v29 & 0x30) == 0x10)
      {
        uint64_t v30 = (unsigned __int16 *)(v28 + 4 * v27);
        uint64_t v31 = *v30;
        unint64_t v32 = v30[1];
        if (v32 <= v31)
        {
          if (v31 <= v32) {
            goto LABEL_41;
          }
          if ((int)v31 + 1 < (int)v20)
          {
            do
            {
              char v36 = *(unsigned char *)(*(void *)(a1[3] + 240) + *((int *)v19 + v31 + 1));
              if ((v36 & 8) != 0) {
                break;
              }
              uint64_t v37 = v31 + 2;
              ++v31;
            }
            while (v37 < (int)v20);
            if ((v36 & 8) != 0) {
              goto LABEL_42;
            }
          }
          unint64_t v38 = 0;
          do
          {
            char v34 = *(unsigned char *)(*(void *)(a1[3] + 240) + *((int *)v19 + v38));
            if ((v34 & 8) != 0) {
              break;
            }
            BOOL v35 = v38++ >= v32;
          }
          while (!v35);
        }
        else
        {
          unint64_t v33 = v31 + 1;
          do
          {
            char v34 = *(unsigned char *)(*(void *)(a1[3] + 240) + *((int *)v19 + v33));
            if ((v34 & 8) != 0) {
              break;
            }
            BOOL v35 = v33++ >= v32;
          }
          while (!v35);
        }
        if ((v34 & 8) == 0) {
LABEL_41:
        }
          v10[v27] = v29 & 0xC7 | 8;
      }
LABEL_42:
      if (++v27 == v16)
      {
        if (v3 && v16 == 2)
        {
          char v39 = *v10;
          if ((*v10 & 0x20) != 0 && (v10[1] & 0x10) == 0)
          {
LABEL_50:
            *uint64_t v10 = v39 & 0xDF;
          }
          else if ((*v10 & 0x10) == 0 && (v10[1] & 0x20) != 0)
          {
            char v39 = *++v10;
            goto LABEL_50;
          }
        }
        goto LABEL_9;
      }
    }
  }
LABEL_51:
  operator delete(v2);
}

void *sub_1B6E24C10(void *result)
{
  uint64_t v1 = *(int *)(*result + 52);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(*result + 76);
    uint64_t v3 = v1 + v2;
    uint64_t v4 = result[4];
    uint64_t v5 = *(void *)(v4 + 96);
    uint64_t v6 = *(void *)(v4 + 72);
    int v7 = *(_DWORD *)(v4 + 16);
    do
    {
      *(_DWORD *)(v5 + 4 * v2) = v7;
      *(_WORD *)(v6 + 2 * v2) = 1;
      int v7 = *(_DWORD *)(v4 + 16) + 1;
      *(_DWORD *)(v4 + 16) = v7;
      ++v2;
    }
    while (v2 < v3);
  }
  return result;
}

void *sub_1B6E24C60(void *result)
{
  uint64_t v1 = *result;
  uint64_t v2 = *(int *)(*result + 56);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = *(int *)(v1 + 80);
    uint64_t v4 = v2 + v3;
    uint64_t v5 = *(void *)(v1 + 312);
    uint64_t v6 = result[4];
    uint64_t v7 = *(void *)(v6 + 96);
    uint64_t v8 = *(void *)(result[2] + 48);
    int v9 = *(_DWORD *)(v6 + 16);
    uint64_t v10 = *(void *)(v6 + 72);
    do
    {
      uint64_t v11 = *(int *)(v5 + 4 * v3);
      *(_DWORD *)(v7 + 4 * v3) = v9;
      if (*(unsigned char *)(v8 + v11))
      {
        uint64_t v13 = result[1];
        uint64_t v14 = *(void *)(v13 + 144);
        uint64_t v12 = *(unsigned int *)(v14 + 8 * v11);
        if (v12 != 1)
        {
          uint64_t v15 = *(void *)(v13 + 168);
          uint64_t v16 = *(int *)(v14 + 8 * v11 + 4);
          if ((int)v12 >= 1)
          {
            uint64_t v17 = 0;
            uint64_t v18 = result[5] + 2 * v9;
            do
            {
              *(_WORD *)(v18 + 2 * v17) = v17;
              ++v17;
            }
            while (v12 != v17);
          }
          uint64_t v19 = *(void *)(*(void *)v6 + 264);
          uint64_t v20 = *(unsigned int *)(v19 + 8 * (int)v3);
          if ((int)v20 >= 1)
          {
            uint64_t v21 = 0;
            uint64_t v22 = v15 + 4 * v16;
            unint64_t v23 = (8 * ((unint64_t)(2 * (int)v3) >> 1)) | 4;
            uint64_t v24 = *(void *)(result[3] + 288) + 4 * *(int *)(*(void *)(result[3] + 264) + v23);
            uint64_t v25 = *(void *)(v6 + 120) + 2 * *(int *)(v19 + v23);
            uint64_t v26 = *(void *)(v1 + 264);
            do
            {
              int v27 = *(_DWORD *)(v26 + 4 * *(int *)(v24 + 4 * v21));
              if (v12 == 2)
              {
                if (v27 == *(_DWORD *)(v22 + 4)) {
                  *(_WORD *)(v25 + 2 * v21) = 1;
                }
              }
              else if ((int)v12 >= 1)
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (v27 == *(_DWORD *)(v22 + 4 * i)) {
                    *(_WORD *)(v25 + 2 * v21) = i;
                  }
                }
              }
              ++v21;
            }
            while (v21 != v20);
          }
        }
      }
      else
      {
        LODWORD(v12) = 1;
      }
      *(_WORD *)(v10 + 2 * v3) = v12;
      int v9 = *(_DWORD *)(v6 + 16) + v12;
      *(_DWORD *)(v6 + 16) = v9;
      ++v3;
    }
    while (v3 < v4);
  }
  return result;
}

void *sub_1B6E24DD0(void *result)
{
  uint64_t v1 = *result;
  uint64_t v2 = *(int *)(*result + 60);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = *(int *)(v1 + 84);
    uint64_t v4 = v2 + v3;
    uint64_t v5 = *(void *)(v1 + 312);
    uint64_t v6 = result[4];
    uint64_t v7 = *(void *)(v6 + 96);
    uint64_t v8 = (void *)result[2];
    uint64_t v9 = v8[12];
    uint64_t v10 = v8[21];
    int v11 = *(_DWORD *)(v6 + 16);
    uint64_t v12 = *(void *)(v6 + 72);
    do
    {
      uint64_t v13 = *(int *)(v5 + 4 * v3);
      *(_DWORD *)(v7 + 4 * v3) = v11;
      if (*(unsigned char *)(v10 + *(int *)(v9 + 4 * v13)))
      {
        unint64_t v14 = *(unsigned __int16 *)(v8[9] + 2 * v13);
        if (v14 >= 2)
        {
          uint64_t v15 = result[5] + 2 * v11;
          for (uint64_t i = 1; i != v14; ++i)
            *(_WORD *)(v15 + 2 * i) = i;
          uint64_t v17 = *(void *)(*(void *)v6 + 264);
          uint64_t v18 = *(unsigned int *)(v17 + 8 * v3);
          if ((int)v18 >= 1)
          {
            uint64_t v19 = (__int16 *)(v8[15] + 2 * *(int *)(*(void *)(*v8 + 264) + 4 * (int)((2 * v13) | 1)));
            uint64_t v20 = (_WORD *)(*(void *)(v6 + 120) + 2 * *(int *)(v17 + 8 * (int)v3 + 4));
            do
            {
              __int16 v21 = *v19++;
              *v20++ = v21;
              --v18;
            }
            while (v18);
          }
        }
      }
      else
      {
        LODWORD(v14) = 1;
      }
      *(_WORD *)(v12 + 2 * v3) = v14;
      int v11 = *(_DWORD *)(v6 + 16) + v14;
      *(_DWORD *)(v6 + 16) = v11;
      ++v3;
    }
    while (v3 < v4);
  }
  return result;
}

float sub_1B6E24EC4(void *a1, int a2, unsigned int a3, int a4)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (int *)v65;
  int v63 = v65;
  uint64_t v64 = 0x1000000000;
  unint64_t v66 = 0;
  uint64_t v7 = a1[1];
  uint64_t v8 = *(void *)(v7 + 360);
  uint64_t v9 = a2;
  uint64_t v10 = (2 * a2) | 1;
  uint64_t v11 = *(void *)(v7 + 336);
  uint64_t v12 = *(int *)(v11 + 4 * v10);
  uint64_t v13 = (int *)(v8 + 4 * v12);
  uint64_t v14 = *(unsigned int *)(v11 + 8 * a2);
  uint64_t v15 = (void *)a1[3];
  uint64_t v16 = v15[45];
  if (((v15[46] - v16) & 0x3FFFFFFFCLL) != 0)
  {
    uint64_t v6 = (int *)(v16 + 4 * *(int *)(v15[42] + 8 * a4 + 4));
    goto LABEL_11;
  }
  if (!v14)
  {
    uint64_t v18 = a2;
    operator delete(0);
    uint64_t v9 = v18;
    uint64_t v64 = 0x1000000000;
    uint64_t v19 = (float *)v61;
    unint64_t v58 = (float *)v61;
    int v59 = 0;
    int v60 = 32;
    int v62 = 0;
    int v63 = v65;
    goto LABEL_13;
  }
  if (v14 <= 0x10)
  {
    LODWORD(v64) = v14;
    uint64_t v17 = *(void *)(a1[1] + 384) + 2 * *(int *)(*(void *)(a1[1] + 336) + 4 * v10);
  }
  else
  {
    uint64_t v55 = a2;
    operator delete(0);
    uint64_t v6 = (int *)operator new(4 * v14);
    unint64_t v66 = v6;
    int v63 = v6;
    LODWORD(v64) = v14;
    HIDWORD(v64) = v14;
    if ((int)v14 < 1)
    {
      uint64_t v9 = v55;
      goto LABEL_11;
    }
    uint64_t v17 = *(void *)(a1[1] + 384) + 2 * *(int *)(*(void *)(a1[1] + 336) + 4 * v10);
    uint64_t v9 = v55;
  }
  uint64_t v20 = 0;
  uint64_t v21 = *(void *)(*a1 + 192);
  do
  {
    v6[v20] = *(_DWORD *)(v21 + 8 * v13[v20] + 4 * *(unsigned __int16 *)(v17 + 2 * v20));
    ++v20;
  }
  while (v14 != v20);
LABEL_11:
  uint64_t v19 = (float *)v61;
  unint64_t v58 = (float *)v61;
  int v59 = 2 * v14;
  int v60 = 32;
  int v62 = 0;
  if ((2 * v14) >= 0x21)
  {
    unsigned int v22 = a3;
    uint64_t v23 = v9;
    uint64_t v24 = (float *)operator new(4 * (2 * v14));
    uint64_t v9 = v23;
    a3 = v22;
    uint64_t v19 = v24;
    int v62 = v24;
    unint64_t v58 = v24;
    int v60 = 2 * v14;
  }
LABEL_13:
  uint64_t v25 = (unsigned __int16 *)(*(void *)(a1[2] + 192) + 4 * *(int *)(*(void *)(a1[2] + 96) + 4 * v9) + 4 * a3);
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  uint64_t v28 = (v27 - v26);
  if (v27 <= v26)
  {
    uint64_t v29 = a1[1];
    if (v26 <= v27)
    {
      LODWORD(v28) = 0;
      uint64_t v31 = a1[3];
    }
    else
    {
      uint64_t v39 = *(void *)(v29 + 216);
      uint64_t v31 = a1[3];
      uint64_t v40 = *(void *)(v31 + 216);
      if ((int)v26 + 1 >= (int)v14)
      {
        uint64_t v41 = 0;
      }
      else
      {
        uint64_t v41 = (v14 + ~v26);
        int v42 = (int *)(4 * v12 + 4 * v26 + v8 + 4);
        uint64_t v43 = &v6[v26 + 1];
        uint64_t v44 = v41;
        int v45 = v19;
        do
        {
          uint64_t v46 = *v42++;
          *int v45 = *(float *)(v39 + 4 * v46);
          uint64_t v47 = *v43++;
          v45[(int)v14] = *(float *)(v40 + 4 * v47);
          ++v45;
          --v44;
        }
        while (v44);
      }
      uint64_t v48 = v27 + 1;
      int v49 = &v19[v41];
      LODWORD(v28) = v27 + v41 + 1;
      do
      {
        uint64_t v50 = *v13++;
        *int v49 = *(float *)(v39 + 4 * v50);
        uint64_t v51 = *v6++;
        v49[(int)v14] = *(float *)(v40 + 4 * v51);
        ++v49;
        --v48;
      }
      while (v48);
    }
  }
  else
  {
    uint64_t v29 = a1[1];
    uint64_t v30 = *(void *)(v29 + 216);
    uint64_t v31 = a1[3];
    uint64_t v32 = *(void *)(v31 + 216);
    unint64_t v33 = &v6[v26 + 1];
    char v34 = (int *)(4 * v12 + 4 * v26 + v8 + 4);
    uint64_t v35 = v28;
    char v36 = v19;
    do
    {
      uint64_t v37 = *v34++;
      float *v36 = *(float *)(v30 + 4 * v37);
      uint64_t v38 = *v33++;
      v36[(int)v14] = *(float *)(v32 + 4 * v38);
      ++v36;
      --v35;
    }
    while (v35);
  }
  int v57 = *(_DWORD *)(*a1 + 24);
  double v52 = sub_1B6E18774(&v57, v28, v19, &v19[(int)v14], *(float *)(*(void *)(v29 + 408) + 4 * v9), *(float *)(*(void *)(v31 + 408) + 4 * a4));
  float v53 = *(float *)&v52;
  operator delete(v62);
  operator delete(v66);
  return v53;
}

double sub_1B6E25270(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  sub_1B6E21C98(a1, a2, a3, a4);
  *uint64_t v4 = &unk_1F0FB2AD8;
  v4[65] = 0;
  v4[63] = 0;
  v4[64] = 0;
  *(void *)&double result = 0x300000001;
  *(void *)((char *)v4 + 28) = 0x300000001;
  return result;
}

void *sub_1B6E252B8(void *a1)
{
  *a1 = &unk_1F0FB2AD8;
  uint64_t v2 = (void *)a1[63];
  if (v2)
  {
    a1[64] = v2;
    operator delete(v2);
  }

  return sub_1B6E21D40(a1);
}

void sub_1B6E2531C(void *a1)
{
  sub_1B6E252B8(a1);

  JUMPOUT(0x1BA9B6D80);
}

void sub_1B6E25354(uint64_t a1)
{
  uint64_t v2 = *(int **)(a1 + 8);
  uint64_t v4 = *((void *)v2 + 9);
  uint64_t v3 = *((void *)v2 + 10);
  uint64_t v6 = *((void *)v2 + 15);
  uint64_t v5 = *((void *)v2 + 16);
  uint64_t v8 = *v2;
  unint64_t v7 = v2[1];
  unint64_t v9 = v2[2];
  int v19 = 4;
  sub_1B6E13070(a1 + 504, 2 * v8, &v19);
  uint64_t v10 = *(int **)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 504);
  if (*v10 >= 1)
  {
    int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = (_DWORD *)(v11 + 4);
    do
    {
      *uint64_t v14 = v12;
      v14 += 2;
      ++v13;
      v12 += 4;
    }
    while (v13 < *v10);
  }
  unint64_t v15 = (unint64_t)(*(void *)(a1 + 512) - v11) >> 2;
  *(void *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 96) = v15;
  uint64_t v16 = *((void *)v10 + 3);
  unint64_t v17 = (unint64_t)(*((void *)v10 + 4) - v16) >> 2;
  *(void *)(a1 + 104) = v16;
  *(_DWORD *)(a1 + 112) = v17;
  int v18 = 0;
  sub_1B6E13070(a1 + 120, 4 * v8, &v18);
  sub_1B6E13070(a1 + 144, (int)((v3 - v4) >> 2), &v18);
  sub_1B6E13070(a1 + 192, (int)((v5 - v6) >> 2), &v18);
  sub_1B6E13070(a1 + 168, 0, &v18);
  sub_1B6E13070(a1 + 216, v7, &v18);
  sub_1B6E13070(a1 + 240, v9, &v18);
}

void *sub_1B6E2548C(void *a1)
{
  uint64_t v2 = (int *)a1[2];
  if (*((void *)v2 + 4) == *((void *)v2 + 3))
  {
    sub_1B6E254E8((uint64_t)a1);
    uint64_t v2 = (int *)a1[2];
  }
  sub_1B642863C((uint64_t)(v2 + 12), 3 * *v2);

  return sub_1B6E25564(a1);
}

void sub_1B6E254E8(uint64_t a1)
{
  uint64_t v2 = *(int **)(a1 + 16);
  uint64_t v3 = *v2;
  int v8 = 3;
  sub_1B6E13070((uint64_t)(v2 + 6), 2 * v3, &v8);
  uint64_t v4 = *(int **)(a1 + 16);
  if (*v4 >= 1)
  {
    int v5 = 0;
    uint64_t v6 = 0;
    unint64_t v7 = (_DWORD *)(*((void *)v4 + 3) + 4);
    do
    {
      *unint64_t v7 = v5;
      v7 += 2;
      ++v6;
      v5 += 3;
    }
    while (v6 < *v4);
  }
}

void *sub_1B6E25564(void *result)
{
  uint64_t v1 = (int *)result[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *((void *)v1 + 6);
    uint64_t v4 = *((void *)v1 + 9);
    uint64_t v5 = result[15];
    uint64_t v6 = result[27];
    unint64_t v7 = (int *)(result[11] + 4);
    int v8 = (int *)(*((void *)v1 + 3) + 4);
    do
    {
      uint64_t v9 = *v8;
      v8 += 2;
      uint64_t v10 = (int *)(v3 + 4 * v9);
      uint64_t v11 = (int *)(v4 + 4 * v9);
      uint64_t v12 = *v7;
      v7 += 2;
      int v13 = *(_DWORD *)(v6 + 4 * *v11);
      int v14 = *(_DWORD *)(v6 + 4 * v11[1]);
      unint64_t v15 = (_DWORD *)(v5 + 4 * v12);
      int v16 = *(_DWORD *)(v6 + 4 * v11[2]);
      if (*v15 != -1)
      {
        unint64_t v17 = (_DWORD *)(*(void *)(result[2] + 48)
                       + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * *v15) | 1)));
        _DWORD *v17 = *(_DWORD *)(result[30] + 4 * *v10);
        v17[1] = v13;
        v17[2] = v16;
      }
      int v18 = v15[1];
      if (v18 != -1)
      {
        int v19 = (_DWORD *)(*(void *)(result[2] + 48)
                       + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v18) | 1)));
        _DWORD *v19 = v13;
        v19[1] = *(_DWORD *)(result[30] + 4 * v10[1]);
        void v19[2] = v14;
      }
      int v20 = v15[2];
      if (v20 != -1)
      {
        uint64_t v21 = (_DWORD *)(*(void *)(result[2] + 48)
                       + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v20) | 1)));
        _DWORD *v21 = v16;
        v21[1] = v14;
        v21[2] = *(_DWORD *)(result[30] + 4 * v10[2]);
      }
      int v22 = v15[3];
      if (v22 != -1)
      {
        uint64_t v23 = (_DWORD *)(*(void *)(result[2] + 48)
                       + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v22) | 1)));
        _DWORD *v23 = v14;
        v23[1] = v16;
        void v23[2] = v13;
      }
      ++v2;
    }
    while (v2 < *v1);
  }
  return result;
}

void *sub_1B6E256AC(void *a1)
{
  uint64_t v2 = (int *)a1[2];
  if (*((void *)v2 + 4) == *((void *)v2 + 3))
  {
    sub_1B6E254E8((uint64_t)a1);
    uint64_t v2 = (int *)a1[2];
  }
  sub_1B642863C((uint64_t)(v2 + 18), 3 * *v2);

  return sub_1B6E25708(a1);
}

void *sub_1B6E25708(void *result)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (int *)result[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *((void *)v1 + 3);
    uint64_t v4 = *((void *)v1 + 6);
    uint64_t v5 = *((void *)v1 + 9);
    uint64_t v6 = result[11];
    uint64_t v7 = result[15];
    uint64_t v8 = result[13];
    uint64_t v9 = result[18];
    uint64_t v10 = result[24];
    uint64_t v11 = *((void *)v1 + 15);
    do
    {
      uint64_t v12 = (8 * v2) | 4;
      uint64_t v13 = *(int *)(v3 + v12);
      int v14 = (_DWORD *)(v4 + 4 * v13);
      unint64_t v15 = (int *)(v5 + 4 * v13);
      uint64_t v16 = *(int *)(v6 + v12);
      uint64_t v17 = *(int *)(v8 + v12);
      for (uint64_t i = 4; i != 28; i += 8)
      {
        uint64_t v20 = *v15++;
        uint64_t v19 = v20;
        uint64_t v21 = (_DWORD *)(v11 + 8 * v20);
        BOOL v22 = *v21 != v21[1] && *v14 != *v21;
        uint64_t v23 = v10 + 8 * v19;
        int v24 = *(_DWORD *)(v23 + 4 * v22);
        uint64_t v25 = (int *)((char *)&v36 + i);
        LODWORD(v23) = *(_DWORD *)(v23 + 4 * !v22);
        *(v25 - 1) = v24;
        *uint64_t v25 = v23;
        ++v14;
      }
      uint64_t v26 = (_DWORD *)(v7 + 4 * v16);
      uint64_t v27 = (_DWORD *)(v9 + 4 * v17);
      if (*v26 != -1)
      {
        uint64_t v28 = (_DWORD *)(*(void *)(result[2] + 72)
                       + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * *v26) | 1)));
        int v29 = v39;
        *uint64_t v28 = v36;
        v28[1] = *v27;
        void v28[2] = v29;
      }
      int v30 = v26[1];
      if (v30 != -1)
      {
        uint64_t v31 = *(void *)(result[2] + 72) + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v30) | 1));
        *(void *)uint64_t v31 = v37;
        *(_DWORD *)(v31 + 8) = v27[1];
      }
      int v32 = v26[2];
      if (v32 != -1)
      {
        uint64_t v33 = *(void *)(result[2] + 72) + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v32) | 1));
        *(_DWORD *)uint64_t v33 = v27[2];
        *(void *)(v33 + 4) = v38;
      }
      int v34 = v26[3];
      if (v34 != -1)
      {
        uint64_t v35 = (_DWORD *)(*(void *)(result[2] + 72)
                       + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v34) | 1)));
        _DWORD *v35 = v27[2];
        v35[1] = *v27;
        v35[2] = v27[1];
      }
      ++v2;
    }
    while (v2 < *v1);
  }
  return result;
}

void *sub_1B6E2590C(void *a1)
{
  sub_1B642863C(a1[2] + 120, 2 * *(int *)(a1[2] + 4));
  sub_1B6E2595C(a1);

  return sub_1B6E25A18(a1);
}

void *sub_1B6E2595C(void *result)
{
  uint64_t v1 = (int *)result[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *((void *)v1 + 9);
    uint64_t v4 = result[18];
    uint64_t v5 = result[27];
    uint64_t v6 = (int *)(result[13] + 4);
    uint64_t v7 = (int *)(*((void *)v1 + 3) + 4);
    do
    {
      uint64_t v8 = *v7;
      v7 += 2;
      uint64_t v9 = (int *)(v3 + 4 * v8);
      uint64_t v10 = *v6;
      v6 += 2;
      int v11 = *(_DWORD *)(v5 + 4 * *v9);
      int v12 = *(_DWORD *)(v5 + 4 * v9[1]);
      uint64_t v13 = (int *)(v4 + 4 * v10);
      int v14 = *(_DWORD *)(v5 + 4 * v9[2]);
      uint64_t v15 = *v13;
      if (v15 != -1)
      {
        uint64_t v16 = (_DWORD *)(*(void *)(result[2] + 120) + 8 * v15);
        _DWORD *v16 = v11;
        v16[1] = v14;
      }
      uint64_t v17 = v13[1];
      if (v17 != -1)
      {
        int v18 = (_DWORD *)(*(void *)(result[2] + 120) + 8 * v17);
        *int v18 = v12;
        v18[1] = v11;
      }
      uint64_t v19 = v13[2];
      if (v19 != -1)
      {
        uint64_t v20 = (_DWORD *)(*(void *)(result[2] + 120) + 8 * v19);
        *uint64_t v20 = v14;
        v20[1] = v12;
      }
      ++v2;
    }
    while (v2 < *v1);
  }
  return result;
}

void *sub_1B6E25A18(void *result)
{
  uint64_t v1 = result[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (int *)(result[24] + 4);
    uint64_t v4 = (int *)(*(void *)(v1 + 120) + 4);
    do
    {
      uint64_t v5 = *(v3 - 1);
      if (v5 != -1)
      {
        uint64_t v6 = (_DWORD *)(*(void *)(result[2] + 120) + 8 * v5);
        *uint64_t v6 = *(_DWORD *)(result[27] + 4 * v2);
        v6[1] = *(_DWORD *)(result[30] + 4 * *(v4 - 1));
      }
      uint64_t v7 = *v3;
      if (v7 != -1)
      {
        uint64_t v8 = (_DWORD *)(*(void *)(result[2] + 120) + 8 * v7);
        *uint64_t v8 = *(_DWORD *)(result[27] + 4 * v2);
        v8[1] = *(_DWORD *)(result[30] + 4 * *v4);
      }
      ++v2;
      v3 += 2;
      v4 += 2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return result;
}

void sub_1B6E25AC0(void *a1)
{
  int v2 = 2 * (((*(void *)(a1[1] + 176) - *(void *)(a1[1] + 168)) >> 2) + ((a1[19] - a1[18]) >> 2));
  sub_1B642863C(a1[2] + 144, 2 * *(int *)(a1[2] + 4));
  sub_1B642863C(a1[2] + 168, v2);
  sub_1B6459120(a1[2] + 192, v2);
  *(_DWORD *)(a1[2] + 16) = *(_DWORD *)(a1[1] + 16);
  sub_1B6E25B9C(a1);
  sub_1B6E25CD0(a1);
  uint64_t v3 = a1[2];
  uint64_t v4 = (int *)(*(void *)(v3 + 144) + 4 * (2 * *(_DWORD *)(v3 + 4) - 2));
  unint64_t v5 = v4[1] + (uint64_t)*v4;
  sub_1B642863C(v3 + 168, v5);
  uint64_t v6 = a1[2] + 192;

  sub_1B6459120(v6, v5);
}

void *sub_1B6E25B9C(void *result)
{
  uint64_t v1 = (int *)result[1];
  int v2 = *v1;
  if (*v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[11];
    uint64_t v5 = result[15];
    uint64_t v6 = result[13];
    uint64_t v7 = result[18];
    do
    {
      uint64_t v8 = *(unsigned int *)(v6 + 8 * v3);
      if ((int)v8 >= 1)
      {
        uint64_t v9 = (8 * v3) | 4;
        uint64_t v10 = (_DWORD *)(v5 + 4 * *(int *)(v4 + v9));
        int v11 = (int *)(v7 + 4 * *(int *)(v6 + v9));
        int v12 = v10[3];
        unsigned int v13 = 1;
        do
        {
          uint64_t v15 = *v11++;
          uint64_t v14 = v15;
          if (v15 != -1)
          {
            uint64_t v16 = result[2];
            uint64_t v17 = *(void *)(v16 + 144);
            int v18 = (_DWORD *)(v17 + 8 * v14);
            *int v18 = 2;
            if (v14) {
              int v19 = *(v18 - 1) + *(v18 - 2);
            }
            else {
              int v19 = 0;
            }
            unsigned int v20 = v13 % 3;
            int v21 = 2 * v14;
            v18[1] = v19;
            int v22 = *(_DWORD *)(v16 + 16);
            if (v22 <= 2) {
              int v22 = 2;
            }
            *(_DWORD *)(v16 + 16) = v22;
            uint64_t v23 = *(int *)(v17 + 4 * (v21 | 1));
            int v24 = (_DWORD *)(*(void *)(v16 + 168) + 4 * v23);
            uint64_t v25 = (_WORD *)(*(void *)(v16 + 192) + 2 * v23);
            if (*v10 == -1)
            {
              uint64_t v26 = 0;
            }
            else
            {
              *int v24 = *v10;
              *uint64_t v25 = v20;
              uint64_t v26 = 1;
            }
            if (v12 != -1)
            {
              v24[v26] = v12;
              v25[v26] = v20;
              LODWORD(v26) = v26 + 1;
            }
            *int v18 = v26;
          }
          ++v13;
          ++v10;
          --v8;
        }
        while (v8);
        int v2 = *v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E25CD0(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[24];
    do
    {
      uint64_t v5 = (_DWORD *)(v4 + 8 * v3);
      if (*v5 != -1 || v5[1] != -1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = *(void *)(v1 + 144);
        uint64_t v8 = *(int *)(v7 + ((8 * v3) | 4));
        uint64_t v9 = *(unsigned int *)(v7 + 8 * v3);
        uint64_t v10 = *(void *)(v1 + 168) + 4 * v8;
        uint64_t v11 = *(void *)(v1 + 192) + 2 * v8;
        int v12 = (_DWORD *)(*(void *)(v1 + 120) + 8 * v3);
        char v13 = 1;
        do
        {
          char v14 = v13;
          uint64_t v15 = (int)v5[v6];
          if (v15 != -1)
          {
            uint64_t v16 = result[2];
            uint64_t v17 = *(void *)(v16 + 144);
            int v18 = (_DWORD *)(v17 + 8 * v15);
            *int v18 = v9;
            if (v15) {
              int v19 = *(v18 - 1) + *(v18 - 2);
            }
            else {
              int v19 = 0;
            }
            v18[1] = v19;
            int v20 = *(_DWORD *)(v16 + 16);
            if (v20 <= (int)v9) {
              int v20 = v9;
            }
            *(_DWORD *)(v16 + 16) = v20;
            if ((int)v9 < 1)
            {
              int v21 = 0;
            }
            else
            {
              int v21 = 0;
              uint64_t v22 = *(int *)(v17 + 4 * (int)((2 * v15) | 1));
              uint64_t v23 = *(void *)(v16 + 168) + 4 * v22;
              uint64_t v24 = *(void *)(v16 + 192) + 2 * v22;
              uint64_t v25 = *(void *)(v1 + 24);
              uint64_t v26 = result[11];
              uint64_t v27 = result[15];
              uint64_t v28 = v9;
              int v29 = (int *)v10;
              int v30 = (unsigned __int16 *)v11;
              do
              {
                uint64_t v32 = *v29++;
                uint64_t v31 = v32;
                LODWORD(v32) = *v30++;
                uint64_t v33 = v32;
                uint64_t v34 = (2 * v31) | 1;
                BOOL v35 = v6;
                if (*v12 != v12[1]) {
                  BOOL v35 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(v25 + 4 * v34) + 4 * v33) != v12[v6];
                }
                uint64_t v36 = v27 + 4 * *(int *)(v26 + 4 * v34);
                unsigned int v37 = v35 + v33;
                if (v37 == *(_DWORD *)(v25 + 8 * v31)) {
                  unsigned int v38 = 0;
                }
                else {
                  unsigned int v38 = v37;
                }
                int v39 = *(_DWORD *)(v36 + 4 * v38);
                if (v39 != -1)
                {
                  *(_DWORD *)(v23 + 4 * v21) = v39;
                  *(_WORD *)(v24 + 2 * v21++) = v33;
                }
                --v28;
              }
              while (v28);
            }
            *int v18 = v21;
          }
          char v13 = 0;
          uint64_t v6 = 1;
        }
        while ((v14 & 1) != 0);
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void sub_1B6E25E90(uint64_t a1)
{
  int v2 = ((*(void *)(*(void *)(a1 + 8) + 296) - *(void *)(*(void *)(a1 + 8) + 288)) >> 2)
     + 3 * ((*(void *)(*(void *)(a1 + 8) + 176) - *(void *)(*(void *)(a1 + 8) + 168)) >> 2);
  sub_1B642863C(*(void *)(a1 + 16) + 264, 2 * *(int *)(*(void *)(a1 + 16) + 8));
  sub_1B642863C(*(void *)(a1 + 16) + 288, v2);
  sub_1B6459120(*(void *)(a1 + 16) + 312, v2);
  if (*(_DWORD *)(a1 + 84))
  {
    sub_1B6E26060((void *)a1);
    sub_1B6E25F7C((void *)a1);
  }
  else
  {
    sub_1B6E25F7C((void *)a1);
    sub_1B6E26060((void *)a1);
  }
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = (int *)(*(void *)(v3 + 264) + 4 * (2 * *(_DWORD *)(v3 + 8) - 2));
  unint64_t v5 = v4[1] + (uint64_t)*v4;
  sub_1B642863C(v3 + 288, v5);
  uint64_t v6 = *(void *)(a1 + 16) + 312;

  sub_1B6459120(v6, v5);
}

void *sub_1B6E25F7C(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 288);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 264) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 312);
        uint64_t v11 = (void *)result[2];
        int v12 = (_DWORD *)(v11[33] + 8 * v5);
        *int v12 = v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = result[11];
          uint64_t v20 = result[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            LODWORD(v22) = *v16++;
            __int16 v23 = v22;
            int v24 = *(_DWORD *)(v20 + 4 * *(int *)(v19 + 8 * v21 + 4) + 4 * v22);
            if (v24 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v24;
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            --v8;
          }
          while (v8);
        }
        *int v12 = v14;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E26060(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 192);
        uint64_t v11 = (void *)result[2];
        int v12 = (_DWORD *)(v11[33] + 8 * v5);
        *int v12 = 2 * v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = result[11];
          uint64_t v20 = result[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            LODWORD(v22) = *v16++;
            uint64_t v23 = v22;
            unsigned int v24 = v22 + 1 - 3 * ((1431655766 * (unint64_t)(v22 + 1)) >> 32);
            uint64_t v25 = v20 + 4 * *(int *)(v19 + 8 * v21 + 4);
            int v26 = *(_DWORD *)(v25 + 4 * v24);
            if (v26 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v26;
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            int v27 = *(_DWORD *)(v25 + 12);
            if (v27 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v27;
              *(_WORD *)(v18 + 2 * v14++) = v23
                                            + 2
                                            - 3 * ((1431655766 * (unint64_t)(v23 + 2)) >> 32);
            }
            int v28 = *(_DWORD *)(v25 + 4 * v23);
            if (v28 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v28;
              *(_WORD *)(v18 + 2 * v14++) = v24;
            }
            --v8;
          }
          while (v8);
        }
        *int v12 = v14;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void sub_1B6E261B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = ((*(void *)(v2 + 368) - *(void *)(v2 + 360)) >> 2)
     + 2 * (*(_DWORD *)(v2 + 4) + ((*(void *)(v2 + 176) - *(void *)(v2 + 168)) >> 2));
  sub_1B642863C(*(void *)(a1 + 16) + 336, 2 * *(int *)(*(void *)(a1 + 16) + 8));
  sub_1B642863C(*(void *)(a1 + 16) + 360, v3);
  sub_1B6459120(*(void *)(a1 + 16) + 384, v3);
  if (*(_DWORD *)(a1 + 84))
  {
    sub_1B6E26398((void *)a1);
    sub_1B6E262A0((void *)a1);
  }
  else
  {
    sub_1B6E262A0((void *)a1);
    sub_1B6E26398((void *)a1);
  }
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = (int *)(*(void *)(v4 + 336) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  unint64_t v6 = v5[1] + (uint64_t)*v5;
  sub_1B642863C(v4 + 360, v6);
  uint64_t v7 = *(void *)(a1 + 16) + 384;

  sub_1B6459120(v7, v6);
}

void *sub_1B6E262A0(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 360);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 336) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 384);
        uint64_t v11 = result[2];
        uint64_t v12 = *(void *)(v11 + 336);
        int v13 = (_DWORD *)(v12 + 8 * v5);
        _DWORD *v13 = v8;
        if (v5) {
          int v14 = *(v13 - 1) + *(v13 - 2);
        }
        else {
          int v14 = 0;
        }
        v13[1] = v14;
        int v15 = *(_DWORD *)(v11 + 20);
        if (v15 <= (int)v8) {
          int v15 = v8;
        }
        *(_DWORD *)(v11 + 20) = v15;
        if ((int)v8 < 1)
        {
          int v16 = 0;
        }
        else
        {
          int v16 = 0;
          uint64_t v17 = (int *)(v6 + 4 * v9);
          uint64_t v18 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v19 = *(int *)(v12 + 4 * (int)((2 * v5) | 1));
          uint64_t v20 = *(void *)(v11 + 360) + 4 * v19;
          uint64_t v21 = *(void *)(v11 + 384) + 2 * v19;
          uint64_t v22 = result[24];
          do
          {
            uint64_t v23 = *v17++;
            uint64_t v24 = v22 + 8 * v23;
            LODWORD(v23) = *v18++;
            int v25 = *(_DWORD *)(v24 + 4 * v23);
            if (v25 != -1)
            {
              *(_DWORD *)(v20 + 4 * v16) = v25;
              *(_WORD *)(v21 + 2 * v16++) = 1;
            }
            --v8;
          }
          while (v8);
        }
        _DWORD *v13 = v16;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E26398(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = *(unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *(int *)(*(void *)(v1 + 144) + 8 * v3 + 4);
        uint64_t v9 = *(void *)(v1 + 192);
        uint64_t v10 = *(void *)(v1 + 120);
        uint64_t v11 = result[24];
        uint64_t v12 = result[2];
        int v13 = v7 + 2;
        uint64_t v14 = *(void *)(v12 + 336);
        int v15 = (_DWORD *)(v14 + 8 * v5);
        _DWORD *v15 = v7 + 2;
        if (v5) {
          int v16 = *(v15 - 1) + *(v15 - 2);
        }
        else {
          int v16 = 0;
        }
        v15[1] = v16;
        if (*(_DWORD *)(v12 + 20) > v13) {
          int v13 = *(_DWORD *)(v12 + 20);
        }
        *(_DWORD *)(v12 + 20) = v13;
        if ((int)v7 < 1)
        {
          int v19 = 0;
        }
        else
        {
          uint64_t v17 = 0;
          BOOL v18 = 0;
          int v19 = 0;
          uint64_t v20 = v6 + 4 * v8;
          uint64_t v21 = v9 + 2 * v8;
          uint64_t v22 = (_DWORD *)(v10 + 8 * v3);
          uint64_t v23 = v11 + 8 * v3;
          uint64_t v24 = *(int *)(v14 + 4 * (int)((2 * v5) | 1));
          uint64_t v25 = *(void *)(v12 + 360) + 4 * v24;
          uint64_t v26 = *(void *)(v12 + 384) + 2 * v24;
          uint64_t v27 = result[13];
          uint64_t v28 = result[18];
          int v29 = -1;
          do
          {
            uint64_t v30 = *(unsigned __int16 *)(v21 + 2 * v17);
            uint64_t v31 = (2 * *(int *)(v20 + 4 * v17)) | 1;
            uint64_t v32 = v28 + 4 * *(int *)(v27 + 4 * v31);
            if (v17)
            {
              int v33 = *(_DWORD *)(v32
                              + 4
                              * (v30
                                             + 1
                                             - 3 * ((1431655766 * (unint64_t)(v30 + 1)) >> 32)));
              int v34 = *(_DWORD *)(v32 + 4 * v30);
            }
            else
            {
              if (*v22 != v22[1]) {
                BOOL v18 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(*(void *)(v1 + 24) + 4 * v31) + 4 * v30) != *v22;
              }
              int v35 = *(_DWORD *)(v23 + 4 * !v18);
              int v29 = *(_DWORD *)(v23 + 4 * v18);
              int v33 = *(_DWORD *)(v32
                              + 4
                              * (v30
                                             + 1
                                             - 3 * ((1431655766 * (unint64_t)(v30 + 1)) >> 32)));
              int v34 = *(_DWORD *)(v32 + 4 * v30);
              if (v35 != -1)
              {
                *(_DWORD *)(v25 + 4 * v19) = v35;
                *(_WORD *)(v26 + 2 * v19++) = 0;
              }
            }
            if (v33 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v33;
              *(_WORD *)(v26 + 2 * v19++) = 1;
            }
            if (v34 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v34;
              *(_WORD *)(v26 + 2 * v19++) = 0;
            }
            if (!v17 && v29 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v29;
              *(_WORD *)(v26 + 2 * v19++) = 0;
            }
            ++v17;
          }
          while (v7 != v17);
        }
        _DWORD *v15 = v19;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E265A0(void *result)
{
  uint64_t v1 = (int *)result[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 4;
    *(void *)&long long v4 = 0x200000002;
    *((void *)&v4 + 1) = 0x200000002;
    do
    {
      uint64_t v5 = result[15] + 4 * *(int *)(result[11] + v3);
      uint64_t v6 = result[18] + 4 * *(int *)(result[13] + v3);
      uint64_t v7 = result[51];
      if (*(unsigned char *)(v7 + v2))
      {
        *(_OWORD *)uint64_t v5 = v4;
        *(_DWORD *)uint64_t v6 = 2;
        *(void *)(v6 + 4) = 0x200000002;
        *(unsigned char *)(v7 + v2) &= 0xE1u;
      }
      else
      {
        uint64_t v8 = *(int *)(*((void *)v1 + 3) + v3);
        uint64_t v9 = (int *)(*((void *)v1 + 6) + 4 * v8);
        if ((*(unsigned char *)(result[57] + v9[1]) & 1)
           + (*(unsigned char *)(result[57] + *v9) & 1)
           + (*(unsigned char *)(result[57] + v9[2]) & 1))
        {
          int v10 = *(unsigned char *)(result[54] + *(int *)(*((void *)v1 + 9) + 4 * v8 + 4)) & 0xE | (*(unsigned __int8 *)(result[54] + *(int *)(*((void *)v1 + 9) + 4 * v8)) >> 1) & 0xF | (2 * *(unsigned __int8 *)(result[54] + *(int *)(*((void *)v1 + 9) + 4 * v8 + 8))) & 0xC;
          *(unsigned char *)(v7 + v2) = *(unsigned char *)(v7 + v2) & 0xE1 | (2 * v10);
          if (v10)
          {
            *(_DWORD *)(v5 + 12) = 1;
            *(_DWORD *)uint64_t v6 = 1;
            *(void *)(v6 + 4) = 0x100000001;
          }
          uint64_t v11 = result[57];
          if (*(unsigned char *)(v11 + *v9))
          {
            *(_DWORD *)uint64_t v5 = 1;
            *(_DWORD *)uint64_t v6 = 1;
          }
          if (*(unsigned char *)(v11 + v9[1]))
          {
            *(_DWORD *)(v5 + 4) = 1;
            *(_DWORD *)(v6 + 4) = 1;
          }
          if (*(unsigned char *)(v11 + v9[2]))
          {
            *(_DWORD *)(v5 + 8) = 1;
            *(_DWORD *)(v6 + 8) = 1;
          }
        }
      }
      ++v2;
      uint64_t v1 = (int *)result[1];
      v3 += 8;
    }
    while (v2 < *v1);
  }
  return result;
}

void sub_1B6E26704(uint64_t a1@<X8>)
{
  sub_1B65B8BB0(&v8, "#define OSD_METAL_IOS 1\n");
  sub_1B65B8BB0(__p, aLine0OsdMtlpat);
  if ((v7 & 0x80u) == 0) {
    uint64_t v2 = __p;
  }
  else {
    uint64_t v2 = (void **)__p[0];
  }
  if ((v7 & 0x80u) == 0) {
    std::string::size_type v3 = v7;
  }
  else {
    std::string::size_type v3 = (std::string::size_type)__p[1];
  }
  long long v4 = std::string::append(&v8, (const std::string::value_type *)v2, v3);
  if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
  {
    sub_1B65B9034((unsigned char *)a1, v4->__r_.__value_.__l.__data_, v4->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    *(void *)(a1 + 16) = *((void *)&v4->__r_.__value_.__l + 2);
    *(_OWORD *)a1 = v5;
  }
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_1B6E267B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1B6E267EC()
{
  sub_1B65A2694((uint64_t)v6);
  sub_1B65A7F00(v7, (uint64_t)"#define OSD_PATCH_BASIS_METAL 1\n", 32);
  sub_1B65B8BB0(__p, aCopyright2016P);
  if ((v5 & 0x80u) == 0) {
    v0 = __p;
  }
  else {
    v0 = (void **)__p[0];
  }
  if ((v5 & 0x80u) == 0) {
    uint64_t v1 = v5;
  }
  else {
    uint64_t v1 = (uint64_t)__p[1];
  }
  sub_1B65A7F00(v7, (uint64_t)v0, v1);
  if ((char)v5 < 0) {
    operator delete(__p[0]);
  }
  std::stringbuf::str();
  v6[0] = *MEMORY[0x1E4FBA408];
  uint64_t v2 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v6 + *(void *)(v6[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v7[0] = v2;
  v7[1] = MEMORY[0x1E4FBA470] + 16;
  if (v8 < 0) {
    operator delete((void *)v7[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1BA9B6D30](&v9);
}

void sub_1B6E269A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_1B65A296C((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void *sub_1B6E269D8@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if ((a1 - 2) > 7) {
    uint64_t v2 = "";
  }
  else {
    uint64_t v2 = off_1E6146678[a1 - 2];
  }
  return sub_1B65B8BB0(a2, v2);
}

uint64_t sub_1B6E26A08(int a1)
{
  sub_1B65A2694((uint64_t)v14);
  sub_1B6E269D8(a1, &__p);
  if ((v13 & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if ((v13 & 0x80u) == 0) {
    uint64_t v3 = v13;
  }
  else {
    uint64_t v3 = v12;
  }
  sub_1B65A7F00(v15, (uint64_t)p_p, v3);
  if ((char)v13 < 0) {
    operator delete(__p);
  }
  sub_1B6E26704((uint64_t)&__p);
  if ((v13 & 0x80u) == 0) {
    long long v4 = &__p;
  }
  else {
    long long v4 = __p;
  }
  if ((v13 & 0x80u) == 0) {
    uint64_t v5 = v13;
  }
  else {
    uint64_t v5 = v12;
  }
  sub_1B65A7F00(v15, (uint64_t)v4, v5);
  if ((char)v13 < 0) {
    operator delete(__p);
  }
  if ((a1 - 6) > 3) {
    uint64_t v6 = "";
  }
  else {
    uint64_t v6 = off_1E61466B8[a1 - 6];
  }
  sub_1B65B8BB0(&__p, v6);
  if ((v13 & 0x80u) == 0) {
    unsigned __int8 v7 = &__p;
  }
  else {
    unsigned __int8 v7 = __p;
  }
  if ((v13 & 0x80u) == 0) {
    uint64_t v8 = v13;
  }
  else {
    uint64_t v8 = v12;
  }
  sub_1B65A7F00(v15, (uint64_t)v7, v8);
  if ((char)v13 < 0) {
    operator delete(__p);
  }
  std::stringbuf::str();
  v14[0] = *MEMORY[0x1E4FBA408];
  uint64_t v9 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v15[0] = v9;
  v15[1] = MEMORY[0x1E4FBA470] + 16;
  if (v16 < 0) {
    operator delete((void *)v15[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1BA9B6D30](&v17);
}

void sub_1B6E26C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

uint64_t sub_1B6E26C8C(uint64_t a1, uint64_t a2, void **a3, uint64_t a4)
{
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = a4;
  *(void *)(a1 + 16) = a2;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v6 = **(int **)(*(void *)(a2 + 88) + 24 * (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0xF));
  unint64_t v7 = 7 * v6;
  int v8 = 112 * v6;
  if (v8 >= 104857600) {
    int v9 = 104857600;
  }
  else {
    int v9 = v8;
  }
  sub_1B6427A50(a3 + 2, v7);
  sub_1B6427A50(a3 + 8, v9);
  sub_1B656C00C(a3 + 11, v9);
  int v10 = *(void ***)(a1 + 8);
  if (v10)
  {
    sub_1B6427A50(v10 + 2, v7);
    sub_1B6427A50(v10 + 8, v7);
    sub_1B656C00C(v10 + 11, v7);
  }
  return a1;
}

void *sub_1B6E26D60(uint64_t a1, uint64_t a2, int a3, __int16 *a4, unsigned int a5, unsigned int a6)
{
  uint64_t v8 = *(void *)(a2 + 24);
  int v9 = (int32x4_t *)(*(void *)(a2 + 48) + 4 * *(int *)(v8 + 8 * a3 + 4));
  uint64_t v10 = *(unsigned int *)(v8 + 8 * a3);
  if ((a6 & 0x80000000) == 0) {
    return (void *)sub_1B6E26DF0(a1, a2);
  }
  unint64_t v11 = 0;
  int v12 = -1;
  do
  {
    __int16 v14 = *(_WORD *)(*(void *)(a2 + 432) + 2 * v9->i32[v11]);
    if ((v14 & 0x780) != 0x80 || (__int16 v15 = *a4) != 0) {
      LOBYTE(v15) = 1;
    }
    if ((v14 & 2) != 0)
    {
      if (v12 < 0) {
        int v12 = v11;
      }
      else {
        LOBYTE(v15) = 1;
      }
    }
    if (v11 > 2) {
      break;
    }
    ++v11;
    a4 += 3;
  }
  while ((v15 & 1) == 0);
  if ((v15 & 1) == 0) {
    return sub_1B6E27528((void **)a1, a2, a3, v12, v9, v10, a5, a6);
  }
  else {
    return (void *)sub_1B6E26DF0(a1, a2);
  }
}

uint64_t sub_1B6E26DF0(uint64_t a1, uint64_t a2)
{
  double v3 = MEMORY[0x1F4188790](a1, a2);
  int v5 = v4;
  uint64_t v98 = v6;
  uint64_t v8 = v7;
  v122[16] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *(void *)(v7 + 16);
  if (v2 < 0) {
    int v10 = *(_DWORD *)(v9 + 20);
  }
  else {
    int v10 = sub_1B6E2B834(v9, v2);
  }
  int v97 = v5;
  int v11 = 0;
  int v12 = (void *)(v8 + 48);
  int v13 = *(_DWORD *)(v8 + 24);
  __int16 v14 = *(char **)(v8 + 40);
  do
  {
    int v15 = v13 + v10;
    if ((unint64_t)v14 >= *v12)
    {
      uint64_t v17 = *(char **)(v8 + 32);
      uint64_t v18 = (v14 - v17) >> 2;
      unint64_t v19 = v18 + 1;
      if ((unint64_t)(v18 + 1) >> 62) {
LABEL_105:
      }
        abort();
      uint64_t v20 = *v12 - (void)v17;
      if (v20 >> 1 > v19) {
        unint64_t v19 = v20 >> 1;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v19;
      }
      if (v21)
      {
        uint64_t v22 = (char *)sub_1B64282E0(v8 + 48, v21);
        uint64_t v17 = *(char **)(v8 + 32);
        __int16 v14 = *(char **)(v8 + 40);
      }
      else
      {
        uint64_t v22 = 0;
      }
      uint64_t v23 = &v22[4 * v18];
      *(_DWORD *)uint64_t v23 = v15;
      char v16 = v23 + 4;
      while (v14 != v17)
      {
        int v24 = *((_DWORD *)v14 - 1);
        v14 -= 4;
        *((_DWORD *)v23 - 1) = v24;
        v23 -= 4;
      }
      *(void *)(v8 + 32) = v23;
      *(void *)(v8 + 40) = v16;
      *(void *)(v8 + 48) = &v22[4 * v21];
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      *(_DWORD *)__int16 v14 = v15;
      char v16 = v14 + 4;
    }
    *(void *)(v8 + 40) = v16;
    int v13 = *(_DWORD *)(v8 + 24) + 1;
    *(_DWORD *)(v8 + 24) = v13;
    ++v11;
    __int16 v14 = v16;
  }
  while (v11 != 16);
  sub_1B6E21C94(v99, v3);
  v122[0] = v99;
  v122[1] = &v104;
  v122[2] = &v109;
  v122[3] = &v101;
  v122[4] = &v108;
  v122[5] = &v112;
  v122[6] = &v113;
  v122[7] = &v105;
  v122[8] = &v107;
  v122[9] = v115;
  v122[10] = &v114;
  v122[11] = &v110;
  v122[12] = v103;
  v122[13] = v111;
  v122[14] = &v106;
  v122[15] = &v102;
  unsigned int v25 = v100;
  uint64_t v26 = &v118;
  __float2 v118 = &v120;
  uint64_t v119 = 0x1000000010;
  uint64_t v27 = 16;
  float v121 = 0;
  do
  {
    *((_DWORD *)v26 + 4) = 0;
    v26[3] = (uint64_t *)(v26 + 5);
    v26[45] = 0;
    v26[4] = (uint64_t *)0x2800000028;
    v26 += 44;
    --v27;
  }
  while (v27);
  uint64_t v28 = 0;
  int v29 = (char *)&unk_1B6ED0970;
  do
  {
    uint64_t v30 = 0;
    uint64_t v31 = 4 * v28;
    uint64_t v32 = v122;
    do
    {
      sub_1B6E21AC8((uint64_t)&v118[44 * v30 + 44 * v31], v25);
      for (uint64_t i = 0; i != 16; i += 4)
      {
        float v34 = *(float *)&v29[i];
        if (v34 != 0.0) {
          sub_1B6E21BB4((int *)&v118[44 * v30 + 44 * v31], (int *)v32[i], v34);
        }
      }
      ++v30;
      ++v32;
    }
    while (v30 != 4);
    ++v28;
    v29 += 16;
  }
  while (v28 != 4);
  uint64_t v35 = 0;
  for (uint64_t j = 0; j != 4; ++j)
  {
    uint64_t v37 = 0;
    unsigned int v38 = (char *)&unk_1B6ED0970;
    do
    {
      sub_1B6E29210((uint64_t)v116, v25);
      uint64_t v39 = 0;
      uint64_t v40 = v35;
      do
      {
        float v41 = *(float *)&v38[v39];
        if (v41 != 0.0) {
          sub_1B6E21BB4(v116, (int *)((char *)v118 + v40), v41);
        }
        v40 += 352;
        v39 += 4;
      }
      while (v39 != 16);
      sub_1B6E28874((unsigned int *)v116, *(void **)v8);
      operator delete(__p);
      ++v37;
      v38 += 16;
    }
    while (v37 != 4);
    v35 += 1408;
  }
  if (*(void *)(v8 + 8))
  {
    for (uint64_t k = 0; k != 16; ++k)
    {
      int v43 = *(_DWORD *)(v98 + 4 * dword_1B6ED09B0[k]);
      uint64_t v44 = *(void **)(v8 + 8);
      int v45 = (char *)v44[3];
      unint64_t v46 = v44[4];
      if ((unint64_t)v45 >= v46)
      {
        uint64_t v48 = (char *)v44[2];
        uint64_t v49 = (v45 - v48) >> 2;
        unint64_t v50 = v49 + 1;
        if ((unint64_t)(v49 + 1) >> 62) {
          goto LABEL_105;
        }
        uint64_t v51 = v46 - (void)v48;
        if (v51 >> 1 > v50) {
          unint64_t v50 = v51 >> 1;
        }
        if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v52 = v50;
        }
        if (v52)
        {
          float v53 = (char *)sub_1B64282E0((uint64_t)(v44 + 4), v52);
          uint64_t v48 = (char *)v44[2];
          int v45 = (char *)v44[3];
        }
        else
        {
          float v53 = 0;
        }
        uint64_t v54 = &v53[4 * v49];
        *(_DWORD *)uint64_t v54 = 1;
        uint64_t v47 = v54 + 4;
        while (v45 != v48)
        {
          int v55 = *((_DWORD *)v45 - 1);
          v45 -= 4;
          *((_DWORD *)v54 - 1) = v55;
          v54 -= 4;
        }
        v44[2] = v54;
        v44[3] = v47;
        v44[4] = &v53[4 * v52];
        if (v48) {
          operator delete(v48);
        }
      }
      else
      {
        *(_DWORD *)int v45 = 1;
        uint64_t v47 = v45 + 4;
      }
      int v56 = v43 + v97;
      v44[3] = v47;
      int v57 = *(void **)(v8 + 8);
      unint64_t v58 = (char *)v57[9];
      unint64_t v59 = v57[10];
      if ((unint64_t)v58 >= v59)
      {
        int v61 = (char *)v57[8];
        uint64_t v62 = (v58 - v61) >> 2;
        unint64_t v63 = v62 + 1;
        if ((unint64_t)(v62 + 1) >> 62) {
          goto LABEL_105;
        }
        uint64_t v64 = v59 - (void)v61;
        if (v64 >> 1 > v63) {
          unint64_t v63 = v64 >> 1;
        }
        if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v65 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v65 = v63;
        }
        if (v65)
        {
          unint64_t v66 = (char *)sub_1B64282E0((uint64_t)(v57 + 10), v65);
          int v61 = (char *)v57[8];
          unint64_t v58 = (char *)v57[9];
        }
        else
        {
          unint64_t v66 = 0;
        }
        uint64_t v67 = &v66[4 * v62];
        *(_DWORD *)uint64_t v67 = v56;
        int v60 = v67 + 4;
        while (v58 != v61)
        {
          int v68 = *((_DWORD *)v58 - 1);
          v58 -= 4;
          *((_DWORD *)v67 - 1) = v68;
          v67 -= 4;
        }
        v57[8] = v67;
        v57[9] = v60;
        v57[10] = &v66[4 * v65];
        if (v61) {
          operator delete(v61);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v58 = v56;
        int v60 = v58 + 4;
      }
      v57[9] = v60;
      uint64_t v69 = *(void **)(v8 + 8);
      unint64_t v70 = (char *)v69[12];
      unint64_t v71 = v69[13];
      if ((unint64_t)v70 >= v71)
      {
        int v73 = (char *)v69[11];
        uint64_t v74 = (v70 - v73) >> 2;
        unint64_t v75 = v74 + 1;
        if ((unint64_t)(v74 + 1) >> 62) {
          goto LABEL_105;
        }
        uint64_t v76 = v71 - (void)v73;
        if (v76 >> 1 > v75) {
          unint64_t v75 = v76 >> 1;
        }
        if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v77 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v77 = v75;
        }
        if (v77)
        {
          int v78 = (char *)sub_1B64282E0((uint64_t)(v69 + 13), v77);
          int v73 = (char *)v69[11];
          unint64_t v70 = (char *)v69[12];
        }
        else
        {
          int v78 = 0;
        }
        int v79 = &v78[4 * v74];
        *(_DWORD *)int v79 = 1065353216;
        uint64_t v72 = v79 + 4;
        while (v70 != v73)
        {
          int v80 = *((_DWORD *)v70 - 1);
          v70 -= 4;
          *((_DWORD *)v79 - 1) = v80;
          v79 -= 4;
        }
        v69[11] = v79;
        v69[12] = v72;
        v69[13] = &v78[4 * v77];
        if (v73) {
          operator delete(v73);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v70 = 1065353216;
        uint64_t v72 = v70 + 4;
      }
      v69[12] = v72;
    }
  }
  uint64_t v81 = *(int *)(v8 + 28);
  *(_DWORD *)(v8 + 28) = v81 + 1;
  uint64_t v82 = *(void *)(v8 + 32);
  if (v119)
  {
    unint64_t v83 = 0;
    uint64_t v84 = 43;
    do
    {
      int v85 = &v118[v84];
      int v86 = &v118[v84 - 42];
      operator delete((void *)v118[v84]);
      uint64_t *v86 = (uint64_t)(v85 - 40);
      *((_DWORD *)v85 - 81) = 40;
      ++v83;
      v84 += 44;
    }
    while (v83 < v119);
  }
  operator delete(v121);
  for (uint64_t m = 0; m != -1408; m -= 352)
  {
    int v88 = &v99[m];
    operator delete(*(void **)&v115[m + 1752]);
    *((void *)v88 + 837) = &v115[m + 1432];
    *((_DWORD *)v88 + 1677) = 40;
  }
  for (uint64_t n = 0; n != -1408; n -= 352)
  {
    int v90 = &v99[n];
    operator delete(*(void **)&v115[n + 344]);
    *((void *)v90 + 661) = &v115[n + 24];
    *((_DWORD *)v90 + 1325) = 40;
  }
  for (iuint64_t i = 0; ii != -1408; ii -= 352)
  {
    int v92 = &v99[ii];
    operator delete(*(void **)&v111[ii + 344]);
    *((void *)v92 + 485) = v92 + 3896;
    *((_DWORD *)v92 + 973) = 40;
  }
  uint64_t v93 = 1408;
  do
  {
    int v94 = &v99[v93];
    operator delete(*(void **)&v103[v93 + 344]);
    *((void *)v94 + 133) = v94 + 1080;
    *((_DWORD *)v94 + 269) = 40;
    v93 -= 352;
  }
  while (v93);
  uint64_t v95 = 1408;
  do
  {
    operator delete(*(void **)&v99[v95 - 8]);
    *(void *)&v99[v95 - 344] = &v99[v95 - 328];
    *(_DWORD *)&v99[v95 - 332] = 40;
    v95 -= 352;
  }
  while (v95);
  return v82 + (v81 << 6);
}

void *sub_1B6E27528(void **a1, uint64_t a2, int a3, int a4, int32x4_t *a5, uint64_t a6, unsigned int a7, unsigned int a8)
{
  uint64_t v247 = *MEMORY[0x1E4F143B8];
  unsigned int v16 = 2 * *(_DWORD *)(a2 + 20) + 16;
  sub_1B6E29210((uint64_t)&v244, v16);
  sub_1B6E29210((uint64_t)&v241, v16);
  uint64_t v17 = sub_1B6E29210((uint64_t)&v238, v16);
  sub_1B6E28AEC(v17, a2, (uint64_t)a5, a6, a4, a8, (int *)&v244, (int *)&v241, (int *)&v238);
  uint64_t v18 = v244;
  if ((int)v244 >= 1)
  {
    unint64_t v19 = v245;
    do
    {
      *v19 += a7;
      v19 += 2;
      --v18;
    }
    while (v18);
  }
  uint64_t v20 = v241;
  if ((int)v241 >= 1)
  {
    unint64_t v21 = v242;
    do
    {
      *v21 += a7;
      v21 += 2;
      --v20;
    }
    while (v20);
  }
  uint64_t v22 = v238;
  if ((int)v238 >= 1)
  {
    uint64_t v23 = v239;
    do
    {
      *v23 += a7;
      v23 += 2;
      --v22;
    }
    while (v22);
  }
  uint64_t v24 = 0;
  v237[0] = vaddq_s32(*a5, vdupq_n_s32(a7));
  uint64_t v25 = *(void *)(a2 + 24);
  uint64_t v26 = *(void *)(a2 + 48);
  uint64_t v27 = v26 + 4 * *(int *)(v25 + 4 * ((2 * a3) | 1));
  uint64_t v28 = *(void *)(a2 + 288);
  uint64_t v29 = *(void *)(a2 + 264);
  uint64_t v30 = *(void *)(a2 + 312);
  uint64_t v31 = 4;
  do
  {
    uint64_t v32 = *(int *)(v27 + 4 * v24);
    uint64_t v33 = *(int *)(v29 + 8 * v32 + 4);
    float v34 = (_DWORD *)(v28 + 4 * v33);
    uint64_t v35 = v30 + 2 * v33;
    if (v24 == a4)
    {
      uint64_t v36 = *(unsigned int *)(v29 + 8 * v32);
      if ((int)v36 < 1)
      {
LABEL_16:
        LODWORD(v37) = -1;
      }
      else
      {
        uint64_t v37 = 0;
        while (v34[v37] != a3)
        {
          if (v36 == ++v37) {
            goto LABEL_16;
          }
        }
      }
      *((_DWORD *)v237 + v31) = *(_DWORD *)(v26
                                          + 4 * *(int *)(v25 + 8 * (int)v34[((int)v37 + 1) % (int)v36] + 4)
                                          + 4
                                          * ((*(_WORD *)(v35 + 2 * (((int)v37 + 1) % (int)v36)) - 1) & 3))
                              + a7;
      unsigned int v38 = (_DWORD *)(v26
                     + 4 * *(int *)(v25 + 8 * (int)v34[((int)v36 + (int)v37 - 1) % (int)v36] + 4)
                     + 4 * ((*(_WORD *)(v35 + 2 * (((int)v36 + (int)v37 - 1) % (int)v36)) + 1) & 3));
    }
    else
    {
      if (*v34 == a3)
      {
        char v39 = 0;
      }
      else if (v34[1] == a3)
      {
        char v39 = 1;
      }
      else if (v34[2] == a3)
      {
        char v39 = 2;
      }
      else if (v34[3] == a3)
      {
        char v39 = 3;
      }
      else
      {
        char v39 = -1;
      }
      uint64_t v40 = (v39 + 2) & 3;
      char v41 = *(_WORD *)(v35 + 2 * v40);
      uint64_t v42 = v26 + 4 * *(int *)(v25 + 8 * (int)v34[v40] + 4);
      int v43 = (_DWORD *)v237 + v31;
      unsigned int v44 = *(_DWORD *)(v42 + 4 * ((v41 + 2) & 3)) + a7;
      _DWORD *v43 = *(_DWORD *)(v42 + 4 * ((v41 + 1) & 3)) + a7;
      v43[1] = v44;
      unsigned int v38 = (_DWORD *)(v42 + 4 * ((v41 - 1) & 3));
    }
    *((_DWORD *)v237 + v31 + 2) = *v38 + a7;
    v31 += 3;
    ++v24;
  }
  while (v24 != 4);
  sub_1B6E29210((uint64_t)&v234, v16);
  sub_1B6E29210((uint64_t)&v231, v16);
  sub_1B6E29210((uint64_t)&v228, v16);
  sub_1B6E29210((uint64_t)&v225, v16);
  sub_1B6E29210((uint64_t)&v222, v16);
  sub_1B6E29210((uint64_t)&v219, v16);
  sub_1B6E29210((uint64_t)&v216, v16);
  sub_1B6E21BB4((int *)&v231, (int *)&v241, 12.0);
  int v45 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4]);
  int v46 = v231;
  uint64_t v47 = v232;
  if ((int)v231 < 1)
  {
LABEL_33:
    unint64_t v50 = (_DWORD *)(v232 + 8 * (int)v231);
    *unint64_t v50 = v45;
    v50[1] = -1062557013;
    unsigned int v231 = ++v46;
  }
  else
  {
    uint64_t v48 = (float *)(v232 + 4);
    uint64_t v49 = v231;
    while (*((_DWORD *)v48 - 1) != v45)
    {
      v48 += 2;
      if (!--v49) {
        goto LABEL_33;
      }
    }
    *uint64_t v48 = *v48 + -5.3333;
  }
  int v51 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 1]);
  if (v46 < 1)
  {
LABEL_39:
    uint64_t v54 = (_DWORD *)(v47 + 8 * v46);
    _DWORD *v54 = v51;
    v54[1] = -1070945621;
    unsigned int v231 = ++v46;
  }
  else
  {
    uint64_t v52 = v46;
    float v53 = (float *)(v47 + 4);
    while (*((_DWORD *)v53 - 1) != v51)
    {
      v53 += 2;
      if (!--v52) {
        goto LABEL_39;
      }
    }
    float *v53 = *v53 + -2.6667;
  }
  uint64_t v55 = dword_1B6ED09F0[16 * (uint64_t)a4 + 2];
  int v56 = *((_DWORD *)v237 + v55);
  int v214 = a8;
  if (v46 < 1)
  {
LABEL_45:
    unint64_t v59 = (_DWORD *)(v47 + 8 * v46);
    _DWORD *v59 = v56;
    v59[1] = -1087722837;
    unsigned int v231 = ++v46;
  }
  else
  {
    uint64_t v57 = v46;
    unint64_t v58 = (float *)(v47 + 4);
    while (*((_DWORD *)v58 - 1) != v56)
    {
      v58 += 2;
      if (!--v57) {
        goto LABEL_45;
      }
    }
    *unint64_t v58 = *v58 + -0.66667;
  }
  int v60 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 3]);
  if (v46 < 1)
  {
LABEL_51:
    unint64_t v63 = (_DWORD *)(v47 + 8 * v46);
    *unint64_t v63 = v60;
    v63[1] = -1079334229;
    unsigned int v231 = ++v46;
  }
  else
  {
    uint64_t v61 = v46;
    uint64_t v62 = (float *)(v47 + 4);
    while (*((_DWORD *)v62 - 1) != v60)
    {
      v62 += 2;
      if (!--v61) {
        goto LABEL_51;
      }
    }
    *uint64_t v62 = *v62 + -1.3333;
  }
  int v64 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 6]);
  v213 = a5;
  if (v46 < 1)
  {
LABEL_57:
    uint64_t v67 = (_DWORD *)(v47 + 8 * v46);
    *uint64_t v67 = v64;
    v67[1] = -1096111445;
    unsigned int v231 = ++v46;
  }
  else
  {
    uint64_t v65 = v46;
    unint64_t v66 = (float *)(v47 + 4);
    while (*((_DWORD *)v66 - 1) != v64)
    {
      v66 += 2;
      if (!--v65) {
        goto LABEL_57;
      }
    }
    *unint64_t v66 = *v66 + -0.33333;
  }
  int v68 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 7]);
  uint64_t v212 = v55;
  if (v46 < 1)
  {
LABEL_63:
    unint64_t v71 = (_DWORD *)(v47 + 8 * v46);
    _DWORD *v71 = v68;
    v71[1] = -1087722837;
    unsigned int v231 = v46 + 1;
  }
  else
  {
    uint64_t v69 = v46;
    unint64_t v70 = (float *)(v47 + 4);
    while (*((_DWORD *)v70 - 1) != v68)
    {
      v70 += 2;
      if (!--v69) {
        goto LABEL_63;
      }
    }
    *unint64_t v70 = *v70 + -0.66667;
  }
  sub_1B6E21BB4((int *)&v228, (int *)&v241, -6.0);
  int v72 = v228;
  uint64_t v73 = v229;
  if ((int)v228 < 1)
  {
LABEL_69:
    uint64_t v76 = (_DWORD *)(v229 + 8 * (int)v228);
    *uint64_t v76 = v45;
    v76[1] = 1076538027;
    unsigned int v228 = ++v72;
  }
  else
  {
    uint64_t v74 = (float *)(v229 + 4);
    uint64_t v75 = v228;
    while (*((_DWORD *)v74 - 1) != v45)
    {
      v74 += 2;
      if (!--v75) {
        goto LABEL_69;
      }
    }
    float *v74 = *v74 + 2.6667;
  }
  if (v72 < 1)
  {
LABEL_75:
    int v79 = (_DWORD *)(v73 + 8 * v72);
    *int v79 = v51;
    v79[1] = 1068149419;
    unsigned int v228 = ++v72;
  }
  else
  {
    uint64_t v77 = v72;
    int v78 = (float *)(v73 + 4);
    while (*((_DWORD *)v78 - 1) != v51)
    {
      v78 += 2;
      if (!--v77) {
        goto LABEL_75;
      }
    }
    float *v78 = *v78 + 1.3333;
  }
  if (v72 < 1)
  {
LABEL_81:
    uint64_t v82 = (_DWORD *)(v73 + 8 * v72);
    _DWORD *v82 = v56;
    v82[1] = 1051372203;
    unsigned int v228 = ++v72;
  }
  else
  {
    uint64_t v80 = v72;
    uint64_t v81 = (float *)(v73 + 4);
    while (*((_DWORD *)v81 - 1) != v56)
    {
      v81 += 2;
      if (!--v80) {
        goto LABEL_81;
      }
    }
    *uint64_t v81 = *v81 + 0.33333;
  }
  if (v72 < 1)
  {
LABEL_87:
    int v85 = (_DWORD *)(v73 + 8 * v72);
    *int v85 = v60;
    v85[1] = 1059760811;
    unsigned int v228 = ++v72;
  }
  else
  {
    uint64_t v83 = v72;
    uint64_t v84 = (float *)(v73 + 4);
    while (*((_DWORD *)v84 - 1) != v60)
    {
      v84 += 2;
      if (!--v83) {
        goto LABEL_87;
      }
    }
    *uint64_t v84 = *v84 + 0.66667;
  }
  if (v72 < 1)
  {
LABEL_93:
    int v88 = (_DWORD *)(v73 + 8 * v72);
    _DWORD *v88 = v64;
    v88[1] = 1059760811;
    unsigned int v228 = ++v72;
  }
  else
  {
    uint64_t v86 = v72;
    int v87 = (float *)(v73 + 4);
    while (*((_DWORD *)v87 - 1) != v64)
    {
      v87 += 2;
      if (!--v86) {
        goto LABEL_93;
      }
    }
    *int v87 = *v87 + 0.66667;
  }
  if (v72 < 1)
  {
LABEL_99:
    uint64_t v91 = (_DWORD *)(v73 + 8 * v72);
    *uint64_t v91 = v68;
    v91[1] = 1068149419;
    unsigned int v228 = v72 + 1;
  }
  else
  {
    uint64_t v89 = v72;
    int v90 = (float *)(v73 + 4);
    while (*((_DWORD *)v90 - 1) != v68)
    {
      v90 += 2;
      if (!--v89) {
        goto LABEL_99;
      }
    }
    float *v90 = *v90 + 1.3333;
  }
  sub_1B6E21C30((int *)&v225, (int *)&v231);
  int v92 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 8]);
  int v93 = v225;
  uint64_t v94 = v226;
  if ((int)v225 < 1)
  {
LABEL_105:
    int v97 = (_DWORD *)(v226 + 8 * (int)v225);
    _DWORD *v97 = v92;
    v97[1] = 1065353216;
    unsigned int v225 = ++v93;
  }
  else
  {
    uint64_t v95 = (float *)(v226 + 4);
    uint64_t v96 = v225;
    while (*((_DWORD *)v95 - 1) != v92)
    {
      v95 += 2;
      if (!--v96) {
        goto LABEL_105;
      }
    }
    *uint64_t v95 = *v95 + 1.0;
  }
  if (v93 < 1)
  {
LABEL_111:
    unsigned int v100 = (_DWORD *)(v94 + 8 * v93);
    _DWORD *v100 = v64;
    v100[1] = -1082130432;
    unsigned int v225 = v93 + 1;
  }
  else
  {
    uint64_t v98 = v93;
    int v99 = (float *)(v94 + 4);
    while (*((_DWORD *)v99 - 1) != v64)
    {
      v99 += 2;
      if (!--v98) {
        goto LABEL_111;
      }
    }
    *int v99 = *v99 + -1.0;
  }
  sub_1B6E21BB4((int *)&v222, (int *)&v238, 12.0);
  int v101 = v222;
  uint64_t v102 = v223;
  if ((int)v222 < 1)
  {
LABEL_117:
    uint64_t v105 = (_DWORD *)(v223 + 8 * (int)v222);
    *uint64_t v105 = v45;
    v105[1] = -1062557013;
    unsigned int v222 = ++v101;
  }
  else
  {
    uint64_t v103 = (float *)(v223 + 4);
    uint64_t v104 = v222;
    while (*((_DWORD *)v103 - 1) != v45)
    {
      v103 += 2;
      if (!--v104) {
        goto LABEL_117;
      }
    }
    *uint64_t v103 = *v103 + -5.3333;
  }
  if (v101 < 1)
  {
LABEL_123:
    uint64_t v108 = (_DWORD *)(v102 + 8 * v101);
    *uint64_t v108 = v51;
    v108[1] = -1079334229;
    unsigned int v222 = ++v101;
  }
  else
  {
    uint64_t v106 = v101;
    uint64_t v107 = (float *)(v102 + 4);
    while (*((_DWORD *)v107 - 1) != v51)
    {
      v107 += 2;
      if (!--v106) {
        goto LABEL_123;
      }
    }
    *uint64_t v107 = *v107 + -1.3333;
  }
  if (v101 < 1)
  {
LABEL_129:
    int v111 = (_DWORD *)(v102 + 8 * v101);
    *int v111 = v56;
    v111[1] = -1087722837;
    unsigned int v222 = ++v101;
  }
  else
  {
    uint64_t v109 = v101;
    uint64_t v110 = (float *)(v102 + 4);
    while (*((_DWORD *)v110 - 1) != v56)
    {
      v110 += 2;
      if (!--v109) {
        goto LABEL_129;
      }
    }
    *uint64_t v110 = *v110 + -0.66667;
  }
  if (v101 < 1)
  {
LABEL_135:
    uint64_t v114 = (_DWORD *)(v102 + 8 * v101);
    *uint64_t v114 = v60;
    v114[1] = -1070945621;
    unsigned int v222 = ++v101;
  }
  else
  {
    uint64_t v112 = v101;
    uint64_t v113 = (float *)(v102 + 4);
    while (*((_DWORD *)v113 - 1) != v60)
    {
      v113 += 2;
      if (!--v112) {
        goto LABEL_135;
      }
    }
    *uint64_t v113 = *v113 + -2.6667;
  }
  int v115 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 4]);
  if (v101 < 1)
  {
LABEL_141:
    __float2 v118 = (_DWORD *)(v102 + 8 * v101);
    *__float2 v118 = v115;
    v118[1] = -1096111445;
    unsigned int v222 = ++v101;
  }
  else
  {
    uint64_t v116 = v101;
    __float2 v117 = (float *)(v102 + 4);
    while (*((_DWORD *)v117 - 1) != v115)
    {
      v117 += 2;
      if (!--v116) {
        goto LABEL_141;
      }
    }
    *__float2 v117 = *v117 + -0.33333;
  }
  int v119 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 15]);
  if (v101 < 1)
  {
LABEL_147:
    uint64_t v122 = (_DWORD *)(v102 + 8 * v101);
    *uint64_t v122 = v119;
    v122[1] = -1087722837;
    unsigned int v222 = v101 + 1;
  }
  else
  {
    uint64_t v120 = v101;
    float v121 = (float *)(v102 + 4);
    while (*((_DWORD *)v121 - 1) != v119)
    {
      v121 += 2;
      if (!--v120) {
        goto LABEL_147;
      }
    }
    float *v121 = *v121 + -0.66667;
  }
  sub_1B6E21BB4((int *)&v219, (int *)&v238, -6.0);
  int v123 = v219;
  uint64_t v124 = v220;
  if ((int)v219 < 1)
  {
LABEL_153:
    unint64_t v127 = (_DWORD *)(v220 + 8 * (int)v219);
    _DWORD *v127 = v45;
    v127[1] = 1076538027;
    unsigned int v219 = ++v123;
  }
  else
  {
    int v125 = (float *)(v220 + 4);
    uint64_t v126 = v219;
    while (*((_DWORD *)v125 - 1) != v45)
    {
      v125 += 2;
      if (!--v126) {
        goto LABEL_153;
      }
    }
    *int v125 = *v125 + 2.6667;
  }
  if (v123 < 1)
  {
LABEL_159:
    float v130 = (_DWORD *)(v124 + 8 * v123);
    *float v130 = v51;
    v130[1] = 1059760811;
    unsigned int v219 = ++v123;
  }
  else
  {
    uint64_t v128 = v123;
    float v129 = (float *)(v124 + 4);
    while (*((_DWORD *)v129 - 1) != v51)
    {
      v129 += 2;
      if (!--v128) {
        goto LABEL_159;
      }
    }
    *float v129 = *v129 + 0.66667;
  }
  if (v123 < 1)
  {
LABEL_165:
    float v133 = (_DWORD *)(v124 + 8 * v123);
    _DWORD *v133 = v56;
    v133[1] = 1051372203;
    unsigned int v219 = ++v123;
  }
  else
  {
    uint64_t v131 = v123;
    float v132 = (float *)(v124 + 4);
    while (*((_DWORD *)v132 - 1) != v56)
    {
      v132 += 2;
      if (!--v131) {
        goto LABEL_165;
      }
    }
    float *v132 = *v132 + 0.33333;
  }
  if (v123 < 1)
  {
LABEL_171:
    v136 = (_DWORD *)(v124 + 8 * v123);
    _DWORD *v136 = v60;
    v136[1] = 1068149419;
    unsigned int v219 = ++v123;
  }
  else
  {
    uint64_t v134 = v123;
    int v135 = (float *)(v124 + 4);
    while (*((_DWORD *)v135 - 1) != v60)
    {
      v135 += 2;
      if (!--v134) {
        goto LABEL_171;
      }
    }
    *int v135 = *v135 + 1.3333;
  }
  if (v123 < 1)
  {
LABEL_177:
    float v139 = (_DWORD *)(v124 + 8 * v123);
    _DWORD *v139 = v115;
    v139[1] = 1059760811;
    unsigned int v219 = ++v123;
  }
  else
  {
    uint64_t v137 = v123;
    float v138 = (float *)(v124 + 4);
    while (*((_DWORD *)v138 - 1) != v115)
    {
      v138 += 2;
      if (!--v137) {
        goto LABEL_177;
      }
    }
    *float v138 = *v138 + 0.66667;
  }
  if (v123 < 1)
  {
LABEL_183:
    int v142 = (_DWORD *)(v124 + 8 * v123);
    _DWORD *v142 = v119;
    v142[1] = 1068149419;
    unsigned int v219 = v123 + 1;
  }
  else
  {
    uint64_t v140 = v123;
    float v141 = (float *)(v124 + 4);
    while (*((_DWORD *)v141 - 1) != v119)
    {
      v141 += 2;
      if (!--v140) {
        goto LABEL_183;
      }
    }
    float *v141 = *v141 + 1.3333;
  }
  sub_1B6E21C30((int *)&v216, (int *)&v222);
  int v143 = *((_DWORD *)v237 + dword_1B6ED09F0[16 * (uint64_t)a4 + 14]);
  int v144 = v216;
  uint64_t v145 = v217;
  if ((int)v216 < 1)
  {
LABEL_189:
    __int16 v148 = (_DWORD *)(v217 + 8 * (int)v216);
    *__int16 v148 = v143;
    v148[1] = 1065353216;
    unsigned int v216 = ++v144;
  }
  else
  {
    unint64_t v146 = (float *)(v217 + 4);
    uint64_t v147 = v216;
    while (*((_DWORD *)v146 - 1) != v143)
    {
      v146 += 2;
      if (!--v147) {
        goto LABEL_189;
      }
    }
    *unint64_t v146 = *v146 + 1.0;
  }
  if (v144 < 1)
  {
LABEL_195:
    uint64_t v151 = (_DWORD *)(v145 + 8 * v144);
    *uint64_t v151 = v115;
    v151[1] = -1082130432;
    unsigned int v216 = v144 + 1;
  }
  else
  {
    uint64_t v149 = v144;
    uint64_t v150 = (float *)(v145 + 4);
    while (*((_DWORD *)v150 - 1) != v115)
    {
      v150 += 2;
      if (!--v149) {
        goto LABEL_195;
      }
    }
    *uint64_t v150 = *v150 + -1.0;
  }
  sub_1B6E21BB4((int *)&v234, (int *)&v244, 36.0);
  int v152 = v234;
  uint64_t v153 = v235;
  if ((int)v234 < 1)
  {
LABEL_201:
    uint64_t v156 = (_DWORD *)(v235 + 8 * (int)v234);
    *uint64_t v156 = v45;
    v156[1] = -1048576000;
    unsigned int v234 = ++v152;
  }
  else
  {
    uint64_t v154 = (float *)(v235 + 4);
    uint64_t v155 = v234;
    while (*((_DWORD *)v154 - 1) != v45)
    {
      v154 += 2;
      if (!--v155) {
        goto LABEL_201;
      }
    }
    *uint64_t v154 = *v154 + -16.0;
  }
  if (v152 < 1)
  {
LABEL_207:
    uint64_t v159 = (_DWORD *)(v153 + 8 * v152);
    *uint64_t v159 = v51;
    v159[1] = -1065353216;
    unsigned int v234 = ++v152;
  }
  else
  {
    uint64_t v157 = v152;
    uint64_t v158 = (float *)(v153 + 4);
    while (*((_DWORD *)v158 - 1) != v51)
    {
      v158 += 2;
      if (!--v157) {
        goto LABEL_207;
      }
    }
    *uint64_t v158 = *v158 + -4.0;
  }
  if (v152 < 1)
  {
LABEL_213:
    uint64_t v162 = (_DWORD *)(v153 + 8 * v152);
    _DWORD *v162 = v60;
    v162[1] = -1065353216;
    unsigned int v234 = v152 + 1;
  }
  else
  {
    uint64_t v160 = v152;
    unint64_t v161 = (float *)(v153 + 4);
    while (*((_DWORD *)v161 - 1) != v60)
    {
      v161 += 2;
      if (!--v160) {
        goto LABEL_213;
      }
    }
    float *v161 = *v161 + -4.0;
  }
  sub_1B6E21BB4((int *)&v234, (int *)&v222, -4.0);
  sub_1B6E21BB4((int *)&v234, (int *)&v231, -4.0);
  int v163 = *((_DWORD *)v237 + v212);
  unsigned int v164 = v234;
  if ((int)v234 < 1)
  {
LABEL_219:
    uint64_t v167 = (_DWORD *)(v235 + 8 * (int)v234);
    *uint64_t v167 = v163;
    v167[1] = -1082130432;
    unsigned int v234 = v164 + 1;
  }
  else
  {
    unint64_t v165 = (float *)(v235 + 4);
    uint64_t v166 = v234;
    while (*((_DWORD *)v165 - 1) != v163)
    {
      v165 += 2;
      if (!--v166) {
        goto LABEL_219;
      }
    }
    float *v165 = *v165 + -1.0;
  }
  sub_1B6E21BB4((int *)&v234, (int *)&v228, -1.0);
  sub_1B6E21BB4((int *)&v234, (int *)&v219, -1.0);
  uint64_t v168 = (uint64_t)a1[2];
  if (v214 < 0) {
    int v169 = *(_DWORD *)(v168 + 20);
  }
  else {
    int v169 = sub_1B6E2B834(v168, v214);
  }
  int v170 = v213->i32[a4] + a7;
  int v171 = a4 + 1;
  int v172 = v213->i32[(a4 + 1) & 3] + a7;
  int v173 = a4 + 3;
  __int32 v215 = v213->i32[(a4 + 3) & 3];
  int v174 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 6) = v174 + 1;
  int v175 = 3 * a4;
  *((_DWORD *)&v237[1] + 3 * a4 + 2) = v174 + v169;
  sub_1B6E28874(&v231, *a1);
  int v176 = a1[1];
  if (v176) {
    sub_1B6E28FCC(v170, v176);
  }
  int v177 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 6) = v177 + 1;
  int v178 = v177 + v169;
  if (v171 <= 0) {
    int v179 = -(-v171 & 3);
  }
  else {
    int v179 = (a4 + 1) & 3;
  }
  int v180 = 3 * v179;
  *((_DWORD *)&v237[1] + 3 * v179) = v178;
  sub_1B6E28874(&v228, *a1);
  uint64_t v181 = a1[1];
  if (v181) {
    sub_1B6E28FCC(v172, v181);
  }
  int v182 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 6) = v182 + 1;
  *((_DWORD *)&v237[1] + v180 + 1) = v182 + v169;
  sub_1B6E28874(&v225, *a1);
  uint64_t v183 = a1[1];
  if (v183) {
    sub_1B6E28FCC(v172, v183);
  }
  int v184 = v215 + a7;
  int v185 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 6) = v185 + 1;
  *((_DWORD *)&v237[1] + v175) = v185 + v169;
  sub_1B6E28874(&v222, *a1);
  v186 = a1[1];
  if (v186) {
    sub_1B6E28FCC(v170, v186);
  }
  int v187 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 6) = v187 + 1;
  int v188 = v187 + v169;
  if (v173 <= 0) {
    int v189 = -(-v173 & 3);
  }
  else {
    int v189 = v173 & 3;
  }
  int v190 = 3 * v189;
  *((_DWORD *)&v237[1] + 3 * v189 + 2) = v188;
  sub_1B6E28874(&v219, *a1);
  int v191 = a1[1];
  if (v191) {
    sub_1B6E28FCC(v184, v191);
  }
  int v192 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 6) = v192 + 1;
  *((_DWORD *)&v237[1] + v190 + 1) = v192 + v169;
  sub_1B6E28874(&v216, *a1);
  v193 = a1[1];
  if (v193) {
    sub_1B6E28FCC(v184, v193);
  }
  int v194 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 6) = v194 + 1;
  *((_DWORD *)&v237[1] + v175 + 1) = v194 + v169;
  sub_1B6E28874(&v234, *a1);
  unsigned int v195 = a1[1];
  if (v195) {
    sub_1B6E28FCC(v170, v195);
  }
  uint64_t v196 = 0;
  v197 = a1 + 6;
  v198 = (char *)a1[5];
  do
  {
    uint64_t v199 = dword_1B6ED0AF0[v196];
    if ((unint64_t)v198 >= *v197)
    {
      int v201 = (char *)a1[4];
      uint64_t v202 = (v198 - v201) >> 2;
      unint64_t v203 = v202 + 1;
      if ((unint64_t)(v202 + 1) >> 62) {
        abort();
      }
      uint64_t v204 = *v197 - (void)v201;
      if (v204 >> 1 > v203) {
        unint64_t v203 = v204 >> 1;
      }
      if ((unint64_t)v204 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v205 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v205 = v203;
      }
      if (v205)
      {
        unsigned int v206 = (char *)sub_1B64282E0((uint64_t)(a1 + 6), v205);
        int v201 = (char *)a1[4];
        v198 = (char *)a1[5];
      }
      else
      {
        unsigned int v206 = 0;
      }
      v207 = &v206[4 * v202];
      *(_DWORD *)v207 = *((_DWORD *)v237 + v199);
      unsigned int v200 = v207 + 4;
      while (v198 != v201)
      {
        int v208 = *((_DWORD *)v198 - 1);
        v198 -= 4;
        *((_DWORD *)v207 - 1) = v208;
        v207 -= 4;
      }
      a1[4] = v207;
      a1[5] = v200;
      a1[6] = &v206[4 * v205];
      if (v201) {
        operator delete(v201);
      }
    }
    else
    {
      *(_DWORD *)v198 = *((_DWORD *)v237 + v199);
      unsigned int v200 = v198 + 4;
    }
    a1[5] = v200;
    ++v196;
    v198 = (char *)v200;
  }
  while (v196 != 16);
  uint64_t v209 = *((int *)a1 + 7);
  *((_DWORD *)a1 + 7) = v209 + 1;
  unsigned int v210 = a1[4];
  operator delete(__p);
  operator delete(v221);
  operator delete(v224);
  operator delete(v227);
  operator delete(v230);
  operator delete(v233);
  operator delete(v236);
  operator delete(v240);
  operator delete(v243);
  operator delete(v246);
  return &v210[8 * v209];
}

void sub_1B6E28874(unsigned int *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t)(a2 + 4);
  unint64_t v6 = a2[4];
  uint64_t v7 = (char *)a2[3];
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (char *)a2[2];
    uint64_t v10 = (v7 - v9) >> 2;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 62) {
LABEL_53:
    }
      abort();
    uint64_t v12 = v6 - (void)v9;
    if (v12 >> 1 > v11) {
      unint64_t v11 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      __int16 v14 = (char *)sub_1B64282E0(v5, v13);
      uint64_t v9 = (char *)a2[2];
      uint64_t v7 = (char *)a2[3];
    }
    else
    {
      __int16 v14 = 0;
    }
    int v15 = &v14[4 * v10];
    unsigned int v16 = &v14[4 * v13];
    *(_DWORD *)int v15 = v4;
    uint64_t v8 = v15 + 4;
    while (v7 != v9)
    {
      int v17 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v17;
      v15 -= 4;
    }
    a2[2] = v15;
    a2[3] = v8;
    a2[4] = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v7 = v4;
    uint64_t v8 = v7 + 4;
  }
  a2[3] = v8;
  if ((int)v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      int v19 = *(_DWORD *)(*((void *)a1 + 1) + 8 * i);
      unint64_t v21 = (char *)a2[9];
      unint64_t v20 = a2[10];
      if ((unint64_t)v21 >= v20)
      {
        uint64_t v23 = (char *)a2[8];
        uint64_t v24 = (v21 - v23) >> 2;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62) {
          goto LABEL_53;
        }
        uint64_t v26 = v20 - (void)v23;
        if (v26 >> 1 > v25) {
          unint64_t v25 = v26 >> 1;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          uint64_t v28 = (char *)sub_1B64282E0((uint64_t)(a2 + 10), v27);
          uint64_t v23 = (char *)a2[8];
          unint64_t v21 = (char *)a2[9];
        }
        else
        {
          uint64_t v28 = 0;
        }
        uint64_t v29 = &v28[4 * v24];
        *(_DWORD *)uint64_t v29 = v19;
        uint64_t v22 = v29 + 4;
        while (v21 != v23)
        {
          int v30 = *((_DWORD *)v21 - 1);
          v21 -= 4;
          *((_DWORD *)v29 - 1) = v30;
          v29 -= 4;
        }
        a2[8] = v29;
        a2[9] = v22;
        a2[10] = &v28[4 * v27];
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v21 = v19;
        uint64_t v22 = v21 + 4;
      }
      a2[9] = v22;
      int v31 = *(_DWORD *)(*((void *)a1 + 1) + 8 * i + 4);
      uint64_t v33 = (char *)a2[12];
      unint64_t v32 = a2[13];
      if ((unint64_t)v33 >= v32)
      {
        uint64_t v35 = (char *)a2[11];
        uint64_t v36 = (v33 - v35) >> 2;
        unint64_t v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 62) {
          goto LABEL_53;
        }
        uint64_t v38 = v32 - (void)v35;
        if (v38 >> 1 > v37) {
          unint64_t v37 = v38 >> 1;
        }
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v39 = v37;
        }
        if (v39)
        {
          uint64_t v40 = (char *)sub_1B64282E0((uint64_t)(a2 + 13), v39);
          uint64_t v35 = (char *)a2[11];
          uint64_t v33 = (char *)a2[12];
        }
        else
        {
          uint64_t v40 = 0;
        }
        char v41 = &v40[4 * v36];
        *(_DWORD *)char v41 = v31;
        float v34 = v41 + 4;
        while (v33 != v35)
        {
          int v42 = *((_DWORD *)v33 - 1);
          v33 -= 4;
          *((_DWORD *)v41 - 1) = v42;
          v41 -= 4;
        }
        a2[11] = v41;
        a2[12] = v34;
        a2[13] = &v40[4 * v39];
        if (v35) {
          operator delete(v35);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v33 = v31;
        float v34 = v33 + 4;
      }
      a2[12] = v34;
    }
  }
}

void sub_1B6E28AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, int *a7, int *a8, int *a9)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  int v14 = *(_DWORD *)(a2 + 20);
  int v15 = v76;
  uint64_t v74 = (int *)v76;
  uint64_t v75 = 0x2800000000;
  uint64_t v77 = 0;
  unsigned int v16 = 2 * v14;
  if (v14)
  {
    if (v16 < 0x29) {
      goto LABEL_6;
    }
    operator delete(0);
    uint64_t v74 = (int *)v76;
    HIDWORD(v75) = 40;
    int v15 = operator new(4 * v16);
    uint64_t v77 = v15;
    int v17 = v16;
  }
  else
  {
    operator delete(0);
    int v17 = 40;
  }
  uint64_t v74 = (int *)v15;
  HIDWORD(v75) = v17;
LABEL_6:
  LODWORD(v75) = v16;
  int v18 = sub_1B6E19C00((void *)a2, *(_DWORD *)(a3 + 4 * a5), (uint64_t)v15, a6);
  int v19 = v18;
  if (v18 >= 0) {
    int v20 = v18;
  }
  else {
    int v20 = v18 + 1;
  }
  uint64_t v21 = (v20 >> 1);
  unsigned int v22 = v18 + 1;
  if (v18 < 2)
  {
    float v54 = -6.2832;
    float v55 = -6.2832;
  }
  else
  {
    uint64_t v23 = 0;
    if (a5 + 3 <= 0) {
      int v24 = -(-(a5 + 3) & 3);
    }
    else {
      int v24 = (a5 + 3) & 3;
    }
    if (a5 + 1 <= 0) {
      int v25 = -(-(a5 + 1) & 3);
    }
    else {
      int v25 = (a5 + 1) & 3;
    }
    uint64_t v26 = v74;
    int v27 = *(_DWORD *)(a3 + 4 * v25);
    int v28 = *(_DWORD *)(a3 + 4 * v24);
    int v29 = -1;
    int v30 = -1;
    do
    {
      int v32 = *v26;
      v26 += 2;
      int v31 = v32;
      if (v32 == v27) {
        int v29 = v23;
      }
      if (v31 == v28) {
        int v30 = v23;
      }
      ++v23;
    }
    while (v21 != v23);
    float v54 = (float)v29 * 6.2832;
    float v55 = (float)v30 * 6.2832;
  }
  int v69 = 0;
  unint64_t v70 = &v72;
  uint64_t v73 = 0;
  uint64_t v71 = 0x2800000028;
  int v64 = 0;
  uint64_t v65 = &v67;
  int v68 = 0;
  uint64_t v66 = 0x2800000028;
  sub_1B6E21AC8((uint64_t)&v69, v22);
  sub_1B6E21AC8((uint64_t)&v64, v22);
  float v33 = (float)(int)v21;
  float v34 = cosf(6.2832 / (float)(int)v21);
  if (v19 >= 2)
  {
    uint64_t v35 = 0;
    float v36 = 1.0
        / (float)((float)((float)((float)(v34 + 5.0) + sqrtf((float)(v34 + 9.0) * (float)(v34 + 1.0))) * v33) * 0.0625);
    float v37 = 2.0 / (float)(v33 + 5.0);
    float v57 = 1.0 / (float)(v33 + 5.0);
    do
    {
      uint64_t v38 = v35 + 1;
      if (v35 + 1 == v21) {
        int v39 = 0;
      }
      else {
        int v39 = v35 + 1;
      }
      uint64_t v40 = &v74[2 * v35];
      int v42 = *v40;
      int v41 = v40[1];
      float v43 = *(float *)&v74[2 * v39];
      unint64_t v59 = &v61;
      __p = 0;
      uint64_t v60 = 0x2800000004;
      int v44 = *(_DWORD *)(a3 + 4 * a5);
      v62[0] = v33 / (float)(v33 + 5.0);
      int v61 = v44;
      int v58 = 1;
      if (v44 == LODWORD(v43))
      {
        v62[0] = v37 + (float)(v33 / (float)(v33 + 5.0));
        uint64_t v45 = 1;
      }
      else
      {
        v62[2] = 2.0 / (float)(v33 + 5.0);
        uint64_t v45 = 2;
        v62[1] = v43;
        int v58 = 2;
      }
      uint64_t v46 = 0;
      while (SLODWORD(v62[v46 - 1]) != v42)
      {
        v46 += 2;
        if (2 * v45 == v46)
        {
          uint64_t v47 = &v62[2 * v45 - 1];
          *(_DWORD *)uint64_t v47 = v42;
          v47[1] = v37;
          int v58 = ++v45;
          goto LABEL_37;
        }
      }
      v62[v46] = v37 + v62[v46];
LABEL_37:
      uint64_t v48 = 0;
      while (SLODWORD(v62[v48 - 1]) != v41)
      {
        v48 += 2;
        if (2 * v45 == v48)
        {
          uint64_t v49 = &v62[2 * v45 - 1];
          *(_DWORD *)uint64_t v49 = v41;
          v49[1] = v57;
          int v58 = v45 + 1;
          goto LABEL_42;
        }
      }
      v62[v48] = v57 + v62[v48];
LABEL_42:
      sub_1B6E21BB4(a7, &v58, 1.0 / v33);
      __float2 v50 = __sincosf_stret((float)((float)(int)v35 * 6.2832) / v33);
      __float2 v51 = __sincosf_stret((float)((float)v39 * 6.2832) / v33);
      sub_1B6E21BB4(&v69, &v58, v36 * (float)((float)(v51.__cosval * 0.5) + (float)(v50.__cosval * 0.5)));
      sub_1B6E21BB4(&v64, &v58, v36 * (float)((float)(v51.__sinval * 0.5) + (float)(v50.__sinval * 0.5)));
      operator delete(__p);
      ++v35;
    }
    while (v38 != v21);
  }
  sub_1B6E21C30(a8, a7);
  __float2 v52 = __sincosf_stret(v54 / v33);
  sub_1B6E21BB4(a8, &v69, v52.__cosval);
  sub_1B6E21BB4(a8, &v64, v52.__sinval);
  sub_1B6E21C30(a9, a7);
  __float2 v53 = __sincosf_stret(v55 / v33);
  sub_1B6E21BB4(a9, &v69, v53.__cosval);
  sub_1B6E21BB4(a9, &v64, v53.__sinval);
  operator delete(v68);
  operator delete(v73);
  operator delete(v77);
}

void sub_1B6E28FCC(int a1, void *a2)
{
  uint64_t v4 = (uint64_t)(a2 + 4);
  unint64_t v5 = a2[4];
  unint64_t v6 = (char *)a2[3];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = (char *)a2[2];
    uint64_t v9 = (v6 - v8) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      goto LABEL_50;
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      unint64_t v13 = (char *)sub_1B64282E0(v4, v12);
      uint64_t v8 = (char *)a2[2];
      unint64_t v6 = (char *)a2[3];
    }
    else
    {
      unint64_t v13 = 0;
    }
    int v14 = &v13[4 * v9];
    int v15 = &v13[4 * v12];
    *(_DWORD *)int v14 = 1;
    uint64_t v7 = v14 + 4;
    while (v6 != v8)
    {
      int v16 = *((_DWORD *)v6 - 1);
      v6 -= 4;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    a2[2] = v14;
    a2[3] = v7;
    a2[4] = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v6 = 1;
    uint64_t v7 = v6 + 4;
  }
  unint64_t v17 = a2[10];
  a2[3] = v7;
  int v18 = (char *)a2[9];
  if ((unint64_t)v18 >= v17)
  {
    int v20 = (char *)a2[8];
    uint64_t v21 = (v18 - v20) >> 2;
    unint64_t v22 = v21 + 1;
    if ((unint64_t)(v21 + 1) >> 62) {
      goto LABEL_50;
    }
    uint64_t v23 = v17 - (void)v20;
    if (v23 >> 1 > v22) {
      unint64_t v22 = v23 >> 1;
    }
    if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v24 = v22;
    }
    if (v24)
    {
      int v25 = (char *)sub_1B64282E0((uint64_t)(a2 + 10), v24);
      int v20 = (char *)a2[8];
      int v18 = (char *)a2[9];
    }
    else
    {
      int v25 = 0;
    }
    uint64_t v26 = &v25[4 * v21];
    int v27 = &v25[4 * v24];
    *(_DWORD *)uint64_t v26 = a1;
    int v19 = v26 + 4;
    while (v18 != v20)
    {
      int v28 = *((_DWORD *)v18 - 1);
      v18 -= 4;
      *((_DWORD *)v26 - 1) = v28;
      v26 -= 4;
    }
    a2[8] = v26;
    a2[9] = v19;
    a2[10] = v27;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *(_DWORD *)int v18 = a1;
    int v19 = v18 + 4;
  }
  unint64_t v29 = a2[13];
  a2[9] = v19;
  int v30 = (char *)a2[12];
  if ((unint64_t)v30 < v29)
  {
    *(_DWORD *)int v30 = 1065353216;
    int v31 = v30 + 4;
    goto LABEL_49;
  }
  int v32 = (char *)a2[11];
  uint64_t v33 = (v30 - v32) >> 2;
  unint64_t v34 = v33 + 1;
  if ((unint64_t)(v33 + 1) >> 62) {
LABEL_50:
  }
    abort();
  uint64_t v35 = v29 - (void)v32;
  if (v35 >> 1 > v34) {
    unint64_t v34 = v35 >> 1;
  }
  if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v36 = v34;
  }
  if (v36)
  {
    float v37 = (char *)sub_1B64282E0((uint64_t)(a2 + 13), v36);
    int v32 = (char *)a2[11];
    int v30 = (char *)a2[12];
  }
  else
  {
    float v37 = 0;
  }
  uint64_t v38 = &v37[4 * v33];
  int v39 = &v37[4 * v36];
  *(_DWORD *)uint64_t v38 = 1065353216;
  int v31 = v38 + 4;
  while (v30 != v32)
  {
    int v40 = *((_DWORD *)v30 - 1);
    v30 -= 4;
    *((_DWORD *)v38 - 1) = v40;
    v38 -= 4;
  }
  a2[11] = v38;
  a2[12] = v31;
  a2[13] = v39;
  if (v32) {
    operator delete(v32);
  }
LABEL_49:
  a2[12] = v31;
}

uint64_t sub_1B6E29210(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)a1 = 0;
  uint64_t v4 = (void *)(a1 + 24);
  *(void *)(a1 + 8) = a1 + 24;
  *(void *)(a1 + 16) = 0x2800000000;
  *(void *)(a1 + 344) = 0;
  if (!a2)
  {
    operator delete(0);
    int v5 = 40;
    goto LABEL_5;
  }
  if (a2 >= 0x29)
  {
    operator delete(0);
    *(void *)(a1 + 8) = v4;
    *(_DWORD *)(a1 + 20) = 40;
    uint64_t v4 = operator new(8 * a2);
    *(void *)(a1 + 344) = v4;
    int v5 = a2;
LABEL_5:
    *(void *)(a1 + 8) = v4;
    *(_DWORD *)(a1 + 20) = v5;
  }
  *(_DWORD *)(a1 + 16) = a2;
  return a1;
}

uint64_t sub_1B6E292AC(uint64_t a1, uint64_t a2, void **a3, uint64_t a4, char a5)
{
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = a4;
  *(void *)(a1 + 16) = a2;
  *(unsigned char *)(a1 + 24) = a5;
  *(_DWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  uint64_t v7 = **(int **)(*(void *)(a2 + 88) + 24 * (((unint64_t)*(unsigned __int8 *)(a2 + 8) >> 2) & 0xF));
  unint64_t v8 = 20 * v7;
  int v9 = 320 * v7;
  if (v9 >= 104857600) {
    int v10 = 104857600;
  }
  else {
    int v10 = v9;
  }
  sub_1B6427A50(a3 + 2, v8);
  sub_1B6427A50(a3 + 8, v10);
  sub_1B656C00C(a3 + 11, v10);
  uint64_t v11 = *(void ***)(a1 + 8);
  if (v11)
  {
    sub_1B6427A50(v11 + 2, v8);
    sub_1B6427A50(v11 + 8, v8);
    sub_1B656C00C(v11 + 11, v8);
  }
  return a1;
}

uint64_t sub_1B6E2938C(uint64_t a1, uint64_t a2)
{
  double v2 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  sub_1B6E21C94(v27, v2);
  uint64_t v7 = 0;
  unint64_t v8 = (unsigned char *)(v4 + 2);
  uint64_t v9 = 5632;
  uint64_t v10 = 7040;
  uint64_t v11 = 4224;
  do
  {
    if (*(v8 - 2))
    {
      sub_1B6E28874((unsigned int *)&v27[v7], *v6);
      unint64_t v12 = v6[1];
      if (v12) {
        sub_1B6E28FCC(*(_DWORD *)&v27[v10], v12);
      }
    }
    if (*(v8 - 1))
    {
      sub_1B6E28874((unsigned int *)&v27[v7 + 1408], *v6);
      unint64_t v13 = v6[1];
      if (v13) {
        sub_1B6E28FCC(*(_DWORD *)&v27[v10], v13);
      }
    }
    if (*v8)
    {
      sub_1B6E28874((unsigned int *)&v27[v7 + 2816], *v6);
      int v14 = v6[1];
      if (v14) {
        sub_1B6E28FCC(*(_DWORD *)&v27[v10], v14);
      }
    }
    if (v8[1])
    {
      sub_1B6E28874((unsigned int *)&v27[v11], *v6);
      int v15 = v6[1];
      if (v15) {
        sub_1B6E28FCC(*(_DWORD *)&v27[v10], v15);
      }
    }
    if (v8[2])
    {
      sub_1B6E28874((unsigned int *)&v27[v9], *v6);
      int v16 = v6[1];
      if (v16) {
        sub_1B6E28FCC(*(_DWORD *)&v27[v10], v16);
      }
    }
    v7 += 352;
    v8 += 5;
    v9 += 352;
    v10 += 4;
    v11 += 352;
  }
  while (v7 != 1408);
  for (uint64_t i = 0; i != -1408; i -= 352)
  {
    int v18 = &v27[i];
    operator delete(*(void **)&v27[i + 7032]);
    *((void *)v18 + 837) = &v27[i + 6712];
    *((_DWORD *)v18 + 1677) = 40;
  }
  for (uint64_t j = 0; j != -1408; j -= 352)
  {
    int v20 = &v27[j];
    operator delete(*(void **)&v27[j + 5624]);
    *((void *)v20 + 661) = &v27[j + 5304];
    *((_DWORD *)v20 + 1325) = 40;
  }
  for (uint64_t k = 0; k != -1408; k -= 352)
  {
    unint64_t v22 = &v27[k];
    operator delete(*(void **)&v27[k + 4216]);
    *((void *)v22 + 485) = v22 + 3896;
    *((_DWORD *)v22 + 973) = 40;
  }
  uint64_t v23 = 1408;
  do
  {
    unint64_t v24 = &v27[v23];
    operator delete(*(void **)&v27[v23 + 1400]);
    *((void *)v24 + 133) = v24 + 1080;
    *((_DWORD *)v24 + 269) = 40;
    v23 -= 352;
  }
  while (v23);
  uint64_t v25 = 1408;
  do
  {
    operator delete(*(void **)&v27[v25 - 8]);
    *(void *)&v27[v25 - 344] = &v27[v25 - 328];
    *(_DWORD *)&v27[v25 - 332] = 40;
    v25 -= 352;
  }
  while (v25);
  return 1;
}

uint64_t sub_1B6E295F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v10 = 0;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)(a1 + 56);
  unint64_t v12 = *(char **)(a1 + 48);
  do
  {
    if ((unint64_t)v12 >= *v11)
    {
      int v14 = *(char **)(a1 + 40);
      uint64_t v15 = (v12 - v14) >> 2;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 62) {
        goto LABEL_72;
      }
      uint64_t v17 = *v11 - (void)v14;
      if (v17 >> 1 > v16) {
        unint64_t v16 = v17 >> 1;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18)
      {
        int v19 = (char *)sub_1B64282E0((uint64_t)v11, v18);
        int v14 = *(char **)(a1 + 40);
        unint64_t v12 = *(char **)(a1 + 48);
      }
      else
      {
        int v19 = 0;
      }
      int v20 = &v19[4 * v15];
      *(_DWORD *)int v20 = -1;
      unint64_t v13 = v20 + 4;
      while (v12 != v14)
      {
        int v21 = *((_DWORD *)v12 - 1);
        v12 -= 4;
        *((_DWORD *)v20 - 1) = v21;
        v20 -= 4;
      }
      *(void *)(a1 + 40) = v20;
      *(void *)(a1 + 48) = v13;
      *(void *)(a1 + 56) = &v19[4 * v18];
      if (v14) {
        operator delete(v14);
      }
    }
    else
    {
      *(_DWORD *)unint64_t v12 = -1;
      unint64_t v13 = v12 + 4;
    }
    *(void *)(a1 + 48) = v13;
    ++v10;
    unint64_t v12 = v13;
  }
  while (v10 != 20);
  uint64_t v22 = *(void *)(a1 + 40) + 80 * *(int *)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 16);
  if (a6 < 0) {
    int v24 = *(_DWORD *)(v23 + 20);
  }
  else {
    int v24 = sub_1B6E2B834(v23, a6);
  }
  if (!*(unsigned char *)(a1 + 24)) {
    goto LABEL_64;
  }
  int v25 = *(_DWORD *)(a2 + 12);
  unsigned int v26 = a6;
  uint64_t v27 = *(void *)(a2 + 72) + 4 * *(int *)(*(void *)(a2 + 24) + 4 * ((2 * a3) | 1));
  sub_1B6E19808((void *)a2, a3, v66, v26);
  uint64_t v28 = 0;
  int v64 = v25 << 28;
  unint64_t v29 = dword_1B6ED0B30;
  do
  {
    if ((v66[v28] & 2) != 0) {
      goto LABEL_46;
    }
    uint64_t v30 = *(int *)(v27 + 4 * v28);
    uint64_t v31 = *(void *)(a2 + 144);
    uint64_t v32 = *(unsigned int *)(v31 + 8 * v30);
    if ((int)v32 < 1)
    {
LABEL_29:
      int v35 = 0;
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v34 = *(void *)(a2 + 168) + 4 * *(int *)(v31 + 4 * (int)((2 * v30) | 1));
      while (*(_DWORD *)(v34 + 4 * v33) != a3)
      {
        if (v32 == ++v33) {
          goto LABEL_29;
        }
      }
      int v35 = *(_DWORD *)(v34 + 4 * (((int)v33 + 1) % (int)v32));
    }
    if (v35 == -1 || v35 >= a3) {
      goto LABEL_46;
    }
    unint64_t v36 = *(unsigned char **)(a1 + 64);
    float v37 = *(unsigned char **)(a1 + 72);
    if (v36 == v37) {
      break;
    }
    uint64_t v38 = (_DWORD *)(*(void *)(a2 + 72) + 4 * *(int *)(*(void *)(a2 + 24) + 4 * ((2 * v35) | 1)));
    if (*v38 == v30)
    {
      uint64_t v39 = 0;
    }
    else if (v38[1] == v30)
    {
      uint64_t v39 = 1;
    }
    else if (v38[2] == v30)
    {
      uint64_t v39 = 2;
    }
    else
    {
      uint64_t v39 = v38[3] == v30 ? 3 : -1;
    }
    int __key = v35 | v64;
    int v40 = bsearch(&__key, v36, (v37 - v36) >> 2, 4uLL, (int (__cdecl *)(const void *, const void *))sub_1B6E29A88);
    if (!v40) {
      break;
    }
    uint64_t v41 = *(void *)(a1 + 40)
        + ((uint64_t)((unint64_t)(5 * (((unint64_t)v40 - *(void *)(a1 + 64)) >> 2)) << 34) >> 30);
    int v42 = &dword_1B6ED0B30[4 * v39];
    for (uint64_t i = 3; i != -1; --i)
    {
      uint64_t v44 = *v42++;
      *(_DWORD *)(v22 + 4 * v29[i]) = *(_DWORD *)(v41 + 4 * v44);
    }
LABEL_46:
    ++v28;
    v29 += 4;
  }
  while (v28 != 4);
  int v45 = v64 | a3;
  unint64_t v46 = *(void *)(a1 + 80);
  uint64_t v47 = *(int **)(a1 + 72);
  if ((unint64_t)v47 < v46)
  {
    *uint64_t v47 = v45;
    uint64_t v48 = v47 + 1;
    goto LABEL_63;
  }
  uint64_t v49 = *(int **)(a1 + 64);
  uint64_t v50 = v47 - v49;
  unint64_t v51 = v50 + 1;
  if ((unint64_t)(v50 + 1) >> 62) {
LABEL_72:
  }
    abort();
  uint64_t v52 = v46 - (void)v49;
  if (v52 >> 1 > v51) {
    unint64_t v51 = v52 >> 1;
  }
  if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v53 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v53 = v51;
  }
  if (v53)
  {
    float v54 = (char *)sub_1B64282E0(a1 + 80, v53);
    uint64_t v49 = *(int **)(a1 + 64);
    uint64_t v47 = *(int **)(a1 + 72);
  }
  else
  {
    float v54 = 0;
  }
  float v55 = (int *)&v54[4 * v50];
  int v56 = &v54[4 * v53];
  *float v55 = v45;
  uint64_t v48 = v55 + 1;
  while (v47 != v49)
  {
    int v57 = *--v47;
    *--float v55 = v57;
  }
  *(void *)(a1 + 64) = v55;
  *(void *)(a1 + 72) = v48;
  *(void *)(a1 + 80) = v56;
  if (v49) {
    operator delete(v49);
  }
LABEL_63:
  *(void *)(a1 + 72) = v48;
LABEL_64:
  uint64_t v58 = 0;
  unint64_t v59 = v66;
  uint64_t v60 = v22;
  do
  {
    for (uint64_t j = 0; j != 5; ++j)
    {
      if (*(_DWORD *)(v60 + 4 * j) == -1)
      {
        *(_DWORD *)(v60 + 4 * j) = *(_DWORD *)(a1 + 28) + v24;
        ++*(_DWORD *)(a1 + 28);
        char v62 = 1;
      }
      else
      {
        char v62 = 0;
      }
      v59[j] = v62;
    }
    ++v58;
    v59 += 5;
    v60 += 20;
  }
  while (v58 != 4);
  sub_1B6E2938C(a1, a2);
  ++*(_DWORD *)(a1 + 32);
  return v22;
}

uint64_t sub_1B6E29A88(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void sub_1B6E29A98(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 8))
  {
    sub_1B6E21EE0(*(void **)a1);
    *(unsigned char *)(a1 + 8) = 1;
  }
  uint64_t v4 = *(void *)(*(void *)a1 + 408);
  if ((*(unsigned char *)(v4 + a2) & 1) == 0)
  {
    *(unsigned char *)(v4 + a2) |= 1u;
    int v5 = *(void **)(*(void *)a1 + 8);
    uint64_t v6 = v5[3];
    uint64_t v7 = *(unsigned int *)(v6 + 8 * a2);
    if ((int)v7 >= 1)
    {
      uint64_t v8 = *(int *)(v6 + 8 * a2 + 4);
      uint64_t v9 = (int *)(v5[9] + 4 * v8);
      int v10 = (int *)(v5[6] + 4 * v8);
      do
      {
        uint64_t v11 = *v9++;
        *(unsigned char *)(*(void *)(*(void *)a1 + 432) + v11) |= 1u;
        uint64_t v12 = *v10++;
        *(unsigned char *)(*(void *)(*(void *)a1 + 456) + v12) |= 1u;
        --v7;
      }
      while (v7);
    }
  }
}

double sub_1B6E29B5C(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  sub_1B6E21C98(a1, a2, a3, a4);
  *uint64_t v4 = &unk_1F0FB2B38;
  *(void *)&double result = 0x400000000;
  *(void *)((char *)v4 + 28) = 0x400000000;
  return result;
}

void sub_1B6E29BA0(void *a1)
{
  sub_1B6E21D40(a1);

  JUMPOUT(0x1BA9B6D80);
}

void sub_1B6E29BD8(uint64_t a1)
{
  double v2 = *(int **)(a1 + 8);
  uint64_t v3 = *((void *)v2 + 7) - *((void *)v2 + 6);
  uint64_t v4 = *((void *)v2 + 10) - *((void *)v2 + 9);
  uint64_t v5 = *((void *)v2 + 16) - *((void *)v2 + 15);
  unint64_t v6 = *v2;
  unint64_t v7 = v2[1];
  unint64_t v8 = v2[2];
  int v13 = 0;
  uint64_t v9 = *((void *)v2 + 3);
  unint64_t v10 = (unint64_t)(*((void *)v2 + 4) - v9) >> 2;
  *(void *)(a1 + 88) = v9;
  *(_DWORD *)(a1 + 96) = v10;
  uint64_t v11 = *((void *)v2 + 3);
  unint64_t v12 = (unint64_t)(*((void *)v2 + 4) - v11) >> 2;
  *(void *)(a1 + 104) = v11;
  *(_DWORD *)(a1 + 112) = v12;
  sub_1B6E13070(a1 + 120, (int)(v3 >> 2), &v13);
  sub_1B6E13070(a1 + 144, (int)(v4 >> 2), &v13);
  sub_1B6E13070(a1 + 192, (int)(v5 >> 2), &v13);
  sub_1B6E13070(a1 + 168, v6, &v13);
  sub_1B6E13070(a1 + 216, v7, &v13);
  sub_1B6E13070(a1 + 240, v8, &v13);
}

void *sub_1B6E29CC0(void *a1)
{
  double v2 = (int *)a1[2];
  if (*((void *)v2 + 4) == *((void *)v2 + 3))
  {
    sub_1B6E29D1C((uint64_t)a1);
    double v2 = (int *)a1[2];
  }
  sub_1B642863C((uint64_t)(v2 + 12), 4 * *v2);

  return sub_1B6E29D8C(a1);
}

void sub_1B6E29D1C(uint64_t a1)
{
  sub_1B642863C(*(void *)(a1 + 16) + 24, 2 * **(int **)(a1 + 16));
  double v2 = *(int **)(a1 + 16);
  if (*v2 >= 1)
  {
    int v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = (_DWORD *)(*((void *)v2 + 3) + 4);
    do
    {
      *(v5 - 1) = 4;
      *uint64_t v5 = v3;
      ++v4;
      v3 += 4;
      v5 += 2;
    }
    while (v4 < *v2);
  }
}

void *sub_1B6E29D8C(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = *(void *)(v1 + 48);
    uint64_t v6 = *(void *)(v1 + 72);
    uint64_t v7 = result[11];
    uint64_t v8 = result[15];
    do
    {
      uint64_t v9 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v9 >= 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = (8 * v3) | 4;
        uint64_t v12 = *(int *)(v4 + v11);
        uint64_t v13 = v5 + 4 * v12;
        uint64_t v14 = v6 + 4 * v12;
        uint64_t v15 = v8 + 4 * *(int *)(v7 + v11);
        do
        {
          int v16 = *(_DWORD *)(v15 + 4 * v10);
          if (v16 != -1)
          {
            if (v10) {
              int v17 = v10;
            }
            else {
              int v17 = v9;
            }
            int v18 = *(_DWORD *)(result[21] + 4 * v3);
            LODWORD(v19) = v17 - 1;
            uint64_t v20 = result[27];
            int v21 = *(_DWORD *)(v20 + 4 * *(int *)(v14 + 4 * (v17 - 1)));
            int v22 = *(_DWORD *)(result[30] + 4 * *(int *)(v13 + 4 * v10));
            int v23 = *(_DWORD *)(v20 + 4 * *(int *)(v14 + 4 * v10));
            int v24 = (_DWORD *)(*(void *)(result[2] + 48)
                           + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v16) | 1)));
            if (v9 == 4)
            {
              uint64_t v19 = (int)v19;
              LODWORD(v25) = v17 - 2;
              if (!v19) {
                LODWORD(v25) = 3;
              }
              v24[v10] = v22;
              if (v25) {
                int v26 = v25 - 1;
              }
              else {
                int v26 = 3;
              }
              v24[v26] = v23;
              uint64_t v25 = (int)v25;
            }
            else
            {
              *int v24 = v22;
              v24[1] = v23;
              uint64_t v25 = 2;
              uint64_t v19 = 3;
            }
            v24[v25] = v18;
            v24[v19] = v21;
          }
          ++v10;
        }
        while (v9 != v10);
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E29EC4(void *a1)
{
  int v2 = (int *)a1[2];
  if (*((void *)v2 + 4) == *((void *)v2 + 3))
  {
    sub_1B6E29D1C((uint64_t)a1);
    int v2 = (int *)a1[2];
  }
  sub_1B642863C((uint64_t)(v2 + 18), 4 * *v2);

  return sub_1B6E29F20(a1);
}

void *sub_1B6E29F20(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = *(void *)(v1 + 48);
    uint64_t v6 = *(void *)(v1 + 72);
    uint64_t v7 = result[11];
    uint64_t v8 = result[15];
    uint64_t v9 = result[13];
    uint64_t v10 = result[18];
    do
    {
      uint64_t v11 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v11 >= 1)
      {
        uint64_t v12 = 0;
        uint64_t v13 = (8 * v3) | 4;
        uint64_t v14 = *(int *)(v4 + v13);
        uint64_t v15 = v5 + 4 * v14;
        uint64_t v16 = v6 + 4 * v14;
        uint64_t v17 = v8 + 4 * *(int *)(v7 + v13);
        uint64_t v18 = v10 + 4 * *(int *)(v9 + v13);
        do
        {
          int v19 = *(_DWORD *)(v17 + 4 * v12);
          if (v19 != -1)
          {
            if (v12) {
              int v20 = v12;
            }
            else {
              int v20 = v11;
            }
            LODWORD(v21) = v20 - 1;
            uint64_t v22 = *(int *)(v16 + 4 * (v20 - 1));
            uint64_t v23 = *(void *)(v1 + 120);
            int v24 = (_DWORD *)(v23 + 8 * v22);
            uint64_t v25 = *(int *)(v16 + 4 * v12);
            int v26 = *(_DWORD *)(v15 + 4 * v12);
            uint64_t v27 = (_DWORD *)(v23 + 8 * v25);
            BOOL v29 = *v24 == v24[1] || *v24 != v26;
            BOOL v31 = *v27 != v27[1] && *v27 != v26;
            uint64_t v32 = result[24];
            int v33 = *(_DWORD *)(v32 + 8 * v22 + 4 * v29);
            int v34 = *(_DWORD *)(v32 + 8 * v25 + 4 * v31);
            int v35 = *(_DWORD *)(v18 + 4 * (int)v21);
            int v36 = *(_DWORD *)(v18 + 4 * v12);
            float v37 = (_DWORD *)(*(void *)(result[2] + 72)
                           + 4 * *(int *)(*(void *)(result[2] + 24) + 4 * ((2 * v19) | 1)));
            if (v11 == 4)
            {
              uint64_t v21 = (int)v21;
              LODWORD(v38) = v20 - 2;
              if (!v21) {
                LODWORD(v38) = 3;
              }
              v37[v12] = v34;
              if (v38) {
                int v39 = v38 - 1;
              }
              else {
                int v39 = 3;
              }
              v37[v39] = v36;
              uint64_t v38 = (int)v38;
            }
            else
            {
              _DWORD *v37 = v34;
              v37[1] = v36;
              uint64_t v38 = 2;
              uint64_t v21 = 3;
            }
            v37[v38] = v35;
            v37[v21] = v33;
          }
          ++v12;
        }
        while (v11 != v12);
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2A0A4(void *a1)
{
  sub_1B642863C(a1[2] + 120, 2 * *(int *)(a1[2] + 4));
  sub_1B6E2A0F4(a1);

  return sub_1B6E2A194(a1);
}

void *sub_1B6E2A0F4(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = *(void *)(v1 + 72);
    uint64_t v6 = result[13];
    uint64_t v7 = result[18];
    do
    {
      uint64_t v8 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v8 >= 1)
      {
        uint64_t v9 = (8 * v3) | 4;
        uint64_t v10 = (int *)(v5 + 4 * *(int *)(v4 + v9));
        uint64_t v11 = (int *)(v7 + 4 * *(int *)(v6 + v9));
        do
        {
          uint64_t v13 = *v11++;
          uint64_t v12 = v13;
          if (v13 != -1)
          {
            uint64_t v14 = (_DWORD *)(*(void *)(result[2] + 120) + 8 * v12);
            *uint64_t v14 = *(_DWORD *)(result[21] + 4 * v3);
            v14[1] = *(_DWORD *)(result[27] + 4 * *v10);
          }
          ++v10;
          --v8;
        }
        while (v8);
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2A194(void *result)
{
  uint64_t v1 = result[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(v1 + 120);
    uint64_t v4 = result[24];
    do
    {
      uint64_t v5 = 0;
      char v6 = 1;
      do
      {
        char v7 = v6;
        uint64_t v8 = *(int *)(v4 + 8 * v2 + 4 * v5);
        if (v8 != -1)
        {
          uint64_t v9 = (_DWORD *)(*(void *)(result[2] + 120) + 8 * v8);
          *uint64_t v9 = *(_DWORD *)(result[27] + 4 * v2);
          v9[1] = *(_DWORD *)(result[30] + 4 * *(int *)(v3 + 8 * v2 + 4 * v5));
        }
        char v6 = 0;
        uint64_t v5 = 1;
      }
      while ((v7 & 1) != 0);
      ++v2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return result;
}

void sub_1B6E2A218(void *a1)
{
  int v2 = 2
     * (((*(void *)(a1[1] + 176) - *(void *)(a1[1] + 168)) >> 2)
      + ((*(void *)(a1[1] + 56) - *(void *)(a1[1] + 48)) >> 2));
  sub_1B642863C(a1[2] + 144, 2 * *(int *)(a1[2] + 4));
  sub_1B642863C(a1[2] + 168, v2);
  sub_1B6459120(a1[2] + 192, v2);
  *(_DWORD *)(a1[2] + 16) = *(_DWORD *)(a1[1] + 16);
  sub_1B6E2A2F4(a1);
  sub_1B6E2A430(a1);
  uint64_t v3 = a1[2];
  uint64_t v4 = (int *)(*(void *)(v3 + 144) + 4 * (2 * *(_DWORD *)(v3 + 4) - 2));
  unint64_t v5 = v4[1] + (uint64_t)*v4;
  sub_1B642863C(v3 + 168, v5);
  uint64_t v6 = a1[2] + 192;

  sub_1B6459120(v6, v5);
}

void *sub_1B6E2A2F4(void *result)
{
  uint64_t v1 = (int *)result[1];
  int v2 = *v1;
  if (*v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[11];
    uint64_t v5 = result[15];
    uint64_t v6 = result[13];
    uint64_t v7 = result[18];
    do
    {
      uint64_t v8 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = (8 * v3) | 4;
        uint64_t v11 = v5 + 4 * *(int *)(v4 + v10);
        uint64_t v12 = v7 + 4 * *(int *)(v6 + v10);
        do
        {
          uint64_t v13 = *(int *)(v12 + 4 * v9);
          if (v13 == -1)
          {
            ++v9;
          }
          else
          {
            uint64_t v14 = result[2];
            uint64_t v15 = *(void *)(v14 + 144);
            uint64_t v16 = (_DWORD *)(v15 + 8 * v13);
            _DWORD *v16 = 2;
            if (v13) {
              int v17 = *(v16 - 1) + *(v16 - 2);
            }
            else {
              int v17 = 0;
            }
            int v18 = 2 * v13;
            v16[1] = v17;
            int v19 = *(_DWORD *)(v14 + 16);
            if (v19 <= 2) {
              int v19 = 2;
            }
            *(_DWORD *)(v14 + 16) = v19;
            uint64_t v20 = *(int *)(v15 + 4 * (v18 | 1));
            uint64_t v21 = (_DWORD *)(*(void *)(v14 + 168) + 4 * v20);
            uint64_t v22 = (__int16 *)(*(void *)(v14 + 192) + 2 * v20);
            uint64_t v23 = v9 + 1;
            if (v9 + 1 >= v8) {
              unsigned int v24 = 0;
            }
            else {
              unsigned int v24 = v9 + 1;
            }
            int v25 = *(_DWORD *)(v11 + 4 * v9);
            if (v25 == -1)
            {
              uint64_t v27 = 0;
            }
            else
            {
              _DWORD *v21 = v25;
              if (v8 == 4) {
                __int16 v26 = v24;
              }
              else {
                __int16 v26 = 1;
              }
              __int16 *v22 = v26;
              uint64_t v27 = 1;
            }
            int v28 = *(_DWORD *)(v11 + 4 * v24);
            if (v28 != -1)
            {
              v21[v27] = v28;
              __int16 v29 = ((_BYTE)v24 + 2) & 3;
              if (v8 != 4) {
                __int16 v29 = 2;
              }
              v22[v27] = v29;
              LODWORD(v27) = v27 + 1;
            }
            _DWORD *v16 = v27;
            uint64_t v9 = v23;
          }
        }
        while (v9 != v8);
        int v2 = *v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2A430(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[24];
    do
    {
      uint64_t v5 = (_DWORD *)(v4 + 8 * v3);
      if (*v5 != -1 || v5[1] != -1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = *(void *)(v1 + 144);
        uint64_t v8 = *(int *)(v7 + ((8 * v3) | 4));
        uint64_t v9 = *(unsigned int *)(v7 + 8 * v3);
        uint64_t v10 = *(void *)(v1 + 168) + 4 * v8;
        uint64_t v11 = *(void *)(v1 + 192) + 2 * v8;
        uint64_t v12 = (_DWORD *)(*(void *)(v1 + 120) + 8 * v3);
        char v13 = 1;
        do
        {
          char v14 = v13;
          uint64_t v15 = (int)v5[v6];
          if (v15 != -1)
          {
            uint64_t v16 = result[2];
            uint64_t v17 = *(void *)(v16 + 144);
            int v18 = (_DWORD *)(v17 + 8 * v15);
            *int v18 = v9;
            if (v15) {
              int v19 = *(v18 - 1) + *(v18 - 2);
            }
            else {
              int v19 = 0;
            }
            v18[1] = v19;
            int v20 = *(_DWORD *)(v16 + 16);
            if (v20 <= (int)v9) {
              int v20 = v9;
            }
            *(_DWORD *)(v16 + 16) = v20;
            if ((int)v9 < 1)
            {
              int v21 = 0;
            }
            else
            {
              int v21 = 0;
              uint64_t v22 = *(int *)(v17 + 4 * (int)((2 * v15) | 1));
              uint64_t v23 = *(void *)(v16 + 168) + 4 * v22;
              uint64_t v24 = *(void *)(v16 + 192) + 2 * v22;
              uint64_t v25 = *(void *)(v1 + 24);
              uint64_t v26 = result[11];
              uint64_t v27 = result[15];
              uint64_t v28 = v9;
              __int16 v29 = (int *)v10;
              uint64_t v30 = (unsigned __int16 *)v11;
              do
              {
                uint64_t v32 = *v29++;
                uint64_t v31 = v32;
                LODWORD(v32) = *v30++;
                unsigned int v33 = v32;
                uint64_t v34 = (2 * v31) | 1;
                BOOL v35 = v6;
                if (*v12 != v12[1]) {
                  BOOL v35 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(v25 + 4 * v34) + 4 * v33) != v12[v6];
                }
                int v36 = 2 * v31;
                uint64_t v37 = v27 + 4 * *(int *)(v26 + 4 * v34);
                if (v35 + v33 == *(_DWORD *)(v26 + 4 * v36)) {
                  unsigned int v38 = 0;
                }
                else {
                  unsigned int v38 = v35 + v33;
                }
                int v39 = *(_DWORD *)(v37 + 4 * v38);
                if (v39 != -1)
                {
                  int v40 = *(_DWORD *)(v25 + 4 * v36);
                  *(_DWORD *)(v23 + 4 * v21) = v39;
                  if (v35) {
                    __int16 v41 = 3;
                  }
                  else {
                    __int16 v41 = 0;
                  }
                  if (v40 != 4) {
                    LOWORD(v33) = v41;
                  }
                  *(_WORD *)(v24 + 2 * v21++) = v33;
                }
                --v28;
              }
              while (v28);
            }
            *int v18 = v21;
          }
          char v13 = 0;
          uint64_t v6 = 1;
        }
        while ((v14 & 1) != 0);
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void sub_1B6E2A608(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
  int v3 = (((v2[22] - v2[21]) >> 1) & 0xFFFFFFFE) + ((v2[7] - v2[6]) >> 2) + ((v2[37] - v2[36]) >> 2);
  sub_1B642863C(*(void *)(a1 + 16) + 264, 2 * *(int *)(*(void *)(a1 + 16) + 8));
  sub_1B642863C(*(void *)(a1 + 16) + 288, v3);
  sub_1B6459120(*(void *)(a1 + 16) + 312, v3);
  if (*(_DWORD *)(a1 + 84))
  {
    sub_1B6E2A808((void *)a1);
    sub_1B6E2A8E4((void *)a1);
    sub_1B6E2A714((void *)a1);
  }
  else
  {
    sub_1B6E2A714((void *)a1);
    sub_1B6E2A808((void *)a1);
    sub_1B6E2A8E4((void *)a1);
  }
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = (int *)(*(void *)(v4 + 264) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  unint64_t v6 = v5[1] + (uint64_t)*v5;
  sub_1B642863C(v4 + 288, v6);
  uint64_t v7 = *(void *)(a1 + 16) + 312;

  sub_1B6459120(v7, v6);
}

void *sub_1B6E2A714(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 288);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 264) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 312);
        uint64_t v11 = (void *)result[2];
        uint64_t v12 = (_DWORD *)(v11[33] + 8 * v5);
        *uint64_t v12 = v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = result[11];
          uint64_t v20 = result[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            LODWORD(v22) = *v16++;
            __int16 v23 = v22;
            int v24 = *(_DWORD *)(v20 + 4 * *(int *)(v19 + 8 * v21 + 4) + 4 * v22);
            if (v24 != -1)
            {
              int v25 = *(_DWORD *)(v19 + 8 * v21);
              *(_DWORD *)(v17 + 4 * v14) = v24;
              if (v25 != 4) {
                __int16 v23 = 0;
              }
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            --v8;
          }
          while (v8);
        }
        *uint64_t v12 = v14;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2A808(void *result)
{
  uint64_t v1 = (int *)result[1];
  int v2 = *v1;
  if (*v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[21];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = (unsigned int *)(result[11] + 8 * v3);
        uint64_t v7 = result[15];
        uint64_t v8 = *v6;
        uint64_t v9 = (int)v6[1];
        uint64_t v10 = (void *)result[2];
        uint64_t v11 = (_DWORD *)(v10[33] + 8 * v5);
        *uint64_t v11 = v8;
        if (v5) {
          int v12 = *(v11 - 1) + *(v11 - 2);
        }
        else {
          int v12 = 0;
        }
        v11[1] = v12;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          uint64_t v13 = 0;
          int v14 = 0;
          uint64_t v15 = v7 + 4 * v9;
          uint64_t v16 = v10[36] + 4 * v12;
          uint64_t v17 = v10[39] + 2 * v12;
          do
          {
            int v18 = *(_DWORD *)(v15 + 4 * v13);
            if (v18 != -1)
            {
              *(_DWORD *)(v16 + 4 * v14) = v18;
              __int16 v19 = ((_BYTE)v13 + 2) & 3;
              if (v8 != 4) {
                __int16 v19 = 2;
              }
              *(_WORD *)(v17 + 2 * v14++) = v19;
            }
            ++v13;
          }
          while (v8 != v13);
        }
        *uint64_t v11 = v14;
        int v2 = *v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2A8E4(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 192);
        uint64_t v11 = (void *)result[2];
        int v12 = (_DWORD *)(v11[33] + 8 * v5);
        *int v12 = 2 * v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = result[11];
          uint64_t v20 = result[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            LODWORD(v22) = *v16++;
            uint64_t v23 = v22;
            uint64_t v24 = v20 + 4 * *(int *)(v19 + 8 * v21 + 4);
            int v25 = *(_DWORD *)(v19 + 8 * v21);
            if (v22 + 1 == v25) {
              unsigned int v26 = 0;
            }
            else {
              unsigned int v26 = v23 + 1;
            }
            int v27 = *(_DWORD *)(v24 + 4 * v26);
            if (v27 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v27;
              if (v25 == 4) {
                __int16 v28 = v23;
              }
              else {
                __int16 v28 = 3;
              }
              *(_WORD *)(v18 + 2 * v14++) = v28;
            }
            int v29 = *(_DWORD *)(v24 + 4 * v23);
            if (v29 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v29;
              if (v25 == 4) {
                __int16 v30 = v26;
              }
              else {
                __int16 v30 = 1;
              }
              *(_WORD *)(v18 + 2 * v14++) = v30;
            }
            --v8;
          }
          while (v8);
        }
        *int v12 = v14;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void sub_1B6E2AA14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = ((*(void *)(v2 + 56) - *(void *)(v2 + 48)) >> 2)
     + 2 * *(_DWORD *)(v2 + 4)
     + ((*(void *)(v2 + 176) - *(void *)(v2 + 168)) >> 2)
     + ((*(void *)(v2 + 368) - *(void *)(v2 + 360)) >> 2);
  sub_1B642863C(*(void *)(a1 + 16) + 336, 2 * *(int *)(*(void *)(a1 + 16) + 8));
  sub_1B642863C(*(void *)(a1 + 16) + 360, v3);
  sub_1B6459120(*(void *)(a1 + 16) + 384, v3);
  if (*(_DWORD *)(a1 + 84))
  {
    sub_1B6E2AC1C((void *)a1);
    sub_1B6E2AD14((void *)a1);
    sub_1B6E2AB24((void *)a1);
  }
  else
  {
    sub_1B6E2AB24((void *)a1);
    sub_1B6E2AC1C((void *)a1);
    sub_1B6E2AD14((void *)a1);
  }
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = (int *)(*(void *)(v4 + 336) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  unint64_t v6 = v5[1] + (uint64_t)*v5;
  sub_1B642863C(v4 + 360, v6);
  uint64_t v7 = *(void *)(a1 + 16) + 384;

  sub_1B6459120(v7, v6);
}

void *sub_1B6E2AB24(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 360);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 336) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 384);
        uint64_t v11 = result[2];
        uint64_t v12 = *(void *)(v11 + 336);
        int v13 = (_DWORD *)(v12 + 8 * v5);
        _DWORD *v13 = v8;
        if (v5) {
          int v14 = *(v13 - 1) + *(v13 - 2);
        }
        else {
          int v14 = 0;
        }
        v13[1] = v14;
        int v15 = *(_DWORD *)(v11 + 20);
        if (v15 <= (int)v8) {
          int v15 = v8;
        }
        *(_DWORD *)(v11 + 20) = v15;
        if ((int)v8 < 1)
        {
          int v16 = 0;
        }
        else
        {
          int v16 = 0;
          uint64_t v17 = (int *)(v6 + 4 * v9);
          uint64_t v18 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v19 = *(int *)(v12 + 4 * (int)((2 * v5) | 1));
          uint64_t v20 = *(void *)(v11 + 360) + 4 * v19;
          uint64_t v21 = *(void *)(v11 + 384) + 2 * v19;
          uint64_t v22 = result[24];
          do
          {
            uint64_t v24 = *v17++;
            uint64_t v23 = v24;
            LODWORD(v24) = *v18++;
            int v25 = *(_DWORD *)(v22 + 8 * v23 + 4 * v24);
            if (v25 != -1)
            {
              *(_DWORD *)(v20 + 4 * v16) = v25;
              *(_WORD *)(v21 + 2 * v16++) = 1;
            }
            --v8;
          }
          while (v8);
        }
        _DWORD *v13 = v16;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2AC1C(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[21];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        int v6 = *(_DWORD *)(*(void *)(v1 + 24) + 8 * v3);
        uint64_t v7 = *(int *)(result[13] + 8 * v3 + 4);
        uint64_t v8 = result[18];
        uint64_t v9 = result[2];
        uint64_t v10 = *(void *)(v9 + 336);
        uint64_t v11 = (int *)(v10 + 8 * v5);
        *uint64_t v11 = v6;
        if (v5) {
          int v12 = *(v11 - 1) + *(v11 - 2);
        }
        else {
          int v12 = 0;
        }
        v11[1] = v12;
        int v13 = *(_DWORD *)(v9 + 20);
        if (v13 <= v6) {
          int v13 = v6;
        }
        *(_DWORD *)(v9 + 20) = v13;
        if (v6 < 1)
        {
          int v15 = 0;
        }
        else
        {
          int v14 = 0;
          int v15 = 0;
          uint64_t v16 = v8 + 4 * v7;
          uint64_t v17 = *(int *)(v10 + 4 * (int)((2 * v5) | 1));
          uint64_t v18 = *(void *)(v9 + 360) + 4 * v17;
          uint64_t v19 = *(void *)(v9 + 384) + 2 * v17;
          do
          {
            if (v14) {
              int v20 = v14;
            }
            else {
              int v20 = v6;
            }
            int v21 = *(_DWORD *)(v16 + 4 * (v20 - 1));
            if (v21 != -1)
            {
              *(_DWORD *)(v18 + 4 * v15) = v21;
              *(_WORD *)(v19 + 2 * v15++) = 0;
            }
            ++v14;
          }
          while (v6 != v14);
        }
        *uint64_t v11 = v15;
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2AD14(void *result)
{
  uint64_t v1 = result[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = *(unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *(int *)(*(void *)(v1 + 144) + 8 * v3 + 4);
        uint64_t v9 = *(void *)(v1 + 192);
        uint64_t v10 = *(void *)(v1 + 120);
        uint64_t v11 = result[24];
        uint64_t v12 = result[2];
        int v13 = v7 + 2;
        uint64_t v14 = *(void *)(v12 + 336);
        int v15 = (int *)(v14 + 8 * v5);
        int *v15 = v7 + 2;
        if (v5) {
          int v16 = *(v15 - 1) + *(v15 - 2);
        }
        else {
          int v16 = 0;
        }
        uint64_t v17 = (int *)(v11 + 8 * v3);
        int v18 = 2 * v5;
        v15[1] = v16;
        if (*(_DWORD *)(v12 + 20) > v13) {
          int v13 = *(_DWORD *)(v12 + 20);
        }
        *(_DWORD *)(v12 + 20) = v13;
        uint64_t v19 = *(int *)(v14 + 4 * (v18 | 1));
        int v20 = (int *)(*(void *)(v12 + 360) + 4 * v19);
        int v21 = (__int16 *)(*(void *)(v12 + 384) + 2 * v19);
        if (*v17 == -1)
        {
          int v22 = 0;
        }
        else
        {
          *int v20 = *v17;
          __int16 *v21 = 0;
          int v22 = 1;
        }
        int v23 = v17[1];
        if (v23 != -1)
        {
          v20[v22] = v23;
          v21[v22++] = 0;
        }
        if ((int)v7 >= 1)
        {
          uint64_t v24 = 0;
          uint64_t v25 = v6 + 4 * v8;
          uint64_t v26 = v9 + 2 * v8;
          uint64_t v27 = result[13];
          uint64_t v28 = result[18];
          int v29 = (_DWORD *)(v10 + 8 * v3);
          do
          {
            uint64_t v30 = *(unsigned __int16 *)(v26 + 2 * v24);
            uint64_t v31 = (2 * *(int *)(v25 + 4 * v24)) | 1;
            int v32 = *(_DWORD *)(v28 + 4 * *(int *)(v27 + 4 * v31) + 4 * v30);
            if (v32 != -1)
            {
              v20[v22] = v32;
              v21[v22++] = 1;
              if (!v24 && v22 == 3)
              {
                if (*v29 == v29[1])
                {
                  int v33 = v20[1];
                  __int16 v34 = v21[1];
                }
                else
                {
                  int v35 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(*(void *)(v1 + 24) + 4 * v31) + 4 * v30);
                  int v33 = v20[1];
                  __int16 v34 = v21[1];
                  if (v35 == *v29)
                  {
                    int v36 = *v20;
                    *int v20 = v33;
                    __int16 v37 = *v21;
                    __int16 *v21 = v34;
                    __int16 v34 = v37;
                    int v33 = v36;
                  }
                }
                v20[1] = v20[2];
                int8x8_t v20[2] = v33;
                v21[1] = v21[2];
                v21[2] = v34;
                int v22 = 3;
              }
            }
            ++v24;
          }
          while (v7 != v24);
        }
        int *v15 = v22;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return result;
}

void *sub_1B6E2AEE0(void *result)
{
  uint64_t v1 = (int *)result[1];
  if (*v1 >= 1)
  {
    for (uint64_t i = 0; i < *v1; ++i)
    {
      uint64_t v3 = (2 * i) | 1;
      uint64_t v4 = (_DWORD *)(result[15] + 4 * *(int *)(result[11] + 4 * v3));
      uint64_t v5 = (_DWORD *)(result[18] + 4 * *(int *)(result[13] + 4 * v3));
      uint64_t v6 = *((void *)v1 + 3);
      uint64_t v7 = *(unsigned int *)(v6 + 8 * i);
      uint64_t v8 = result[51];
      if (*(unsigned char *)(v8 + i))
      {
        if ((int)v7 >= 1)
        {
          do
          {
            *v4++ = 2;
            *v5++ = 2;
            --v7;
          }
          while (v7);
        }
        *(_DWORD *)(result[21] + 4 * i) = 2;
        char v22 = *(unsigned char *)(v8 + i) & 0xE1;
      }
      else
      {
        if ((int)v7 < 1) {
          goto LABEL_22;
        }
        uint64_t v9 = 0;
        int v10 = 0;
        uint64_t v11 = *((void *)v1 + 6) + 4 * *(int *)(v6 + 4 * v3);
        uint64_t v12 = result[57];
        do
        {
          if (*(unsigned char *)(v12 + *(int *)(v11 + 4 * v9)))
          {
            int v10 = 1;
            v4[v9] = 1;
            if (v9) {
              int v13 = v9;
            }
            else {
              int v13 = v7;
            }
            v5[v9] = 1;
            v5[v13 - 1] = 1;
          }
          ++v9;
        }
        while (v7 != v9);
        if (!v10) {
          goto LABEL_22;
        }
        *(_DWORD *)(result[21] + 4 * i) = 1;
        uint64_t v14 = (int *)(*((void *)v1 + 9) + 4 * *(int *)(v6 + 4 * v3));
        uint64_t v15 = *(unsigned int *)(v6 + 8 * i);
        if (v15 == 3)
        {
          int v21 = *(unsigned char *)(result[54] + v14[1]) & 0xE | (*(unsigned __int8 *)(result[54] + *v14) >> 1) & 0xF | (2 * *(unsigned __int8 *)(result[54] + v14[2])) & 0xC;
          char v20 = *(unsigned char *)(v8 + i);
        }
        else
        {
          if (v15 != 4)
          {
            int v23 = *(unsigned char *)(v8 + i) & 0xE1;
            *(unsigned char *)(v8 + i) &= 0xE1u;
            if ((int)v15 >= 1)
            {
              do
              {
                uint64_t v24 = *v14++;
                v23 |= *(unsigned char *)(result[54] + v24) & 0x1E;
                *(unsigned char *)(v8 + i) = v23;
                --v15;
              }
              while (v15);
            }
            goto LABEL_22;
          }
          uint64_t v16 = result[54];
          unsigned int v17 = *(unsigned __int8 *)(v16 + *v14);
          int v18 = *(unsigned char *)(v16 + v14[1]) & 0xE;
          int v19 = (2 * *(unsigned __int8 *)(v16 + v14[2])) & 0xC;
          LOBYTE(v16) = 4 * *(unsigned char *)(v16 + v14[3]);
          char v20 = *(unsigned char *)(v8 + i);
          int v21 = v18 | (v17 >> 1) & 0xF | v19 | v16 & 8;
        }
        char v22 = v20 & 0xE1 | (2 * (v21 & 0xF));
      }
      *(unsigned char *)(v8 + i) = v22;
LABEL_22:
      uint64_t v1 = (int *)result[1];
    }
  }
  return result;
}

void sub_1B6E2B0C4(uint64_t a1, int a2, int a3)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 8) & 0xC0 | 1;
  *(unsigned char *)(a1 + 12) &= 0xC0u;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a1 + 16) & 0xF000 | 0xF0;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  sub_1B6E2B22C((void **)(a1 + 40), 0xAuLL);
  operator new();
}

void sub_1B6E2B22C(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      abort();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_1B64285D4(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    int v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      int v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_1B6E2B2D0(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    uint64_t v6 = (char *)sub_1B6428204(v3, a2);
    uint64_t v7 = &v6[24 * v5];
    uint64_t v9 = &v6[24 * v8];
    uint64_t v11 = (char *)*a1;
    int v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      int v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_1B6E2B3BC(void *a1)
{
  sub_1B6E2B7F8((uint64_t)(a1 + 11), (uint64_t)(a1[6] - a1[5]) >> 3);
  int v2 = (void *)a1[11];
  v2[1] = 0;
  uint64_t v3 = (void *)a1[5];
  *int v2 = *v3;
  v2[2] = 0;
  uint64_t v4 = (void *)a1[8];
  unint64_t v5 = a1[9] - (void)v4;
  unint64_t v6 = v5 >> 3;
  if ((v5 >> 3))
  {
    v2[2] = *v4;
    if ((int)v6 >= 2)
    {
      uint64_t v7 = (v5 >> 3) - 1;
      uint64_t v8 = v2 + 5;
      uint64_t v9 = v3 + 1;
      int v10 = v4 + 1;
      do
      {
        *(v8 - 1) = *(v10 - 1);
        uint64_t v11 = *v9++;
        *(v8 - 2) = v11;
        uint64_t v12 = *v10++;
        *uint64_t v8 = v12;
        v8 += 3;
        --v7;
      }
      while (v7);
    }
    long long v13 = &v2[3 * (int)v6];
    v13[1] = *(void *)((char *)v4 + ((uint64_t)((v5 << 29) - 0x100000000) >> 29));
    void *v13 = *(void *)((char *)v3 + ((uint64_t)(v5 << 29) >> 29));
    v13[2] = 0;
  }
}

void sub_1B6E2B488(uint64_t a1, int a2, int a3)
{
}

void *sub_1B6E2B490(void *a1)
{
  uint64_t v3 = a1[5];
  uint64_t v2 = a1[6];
  if ((int)((unint64_t)(v2 - v3) >> 3) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(v3 + 8 * v4);
      if (v5)
      {
        uint64_t v6 = sub_1B6E18C68(v5);
        MEMORY[0x1BA9B6D80](v6, 0x10B0C4095CCE9FBLL);
        uint64_t v3 = a1[5];
        uint64_t v2 = a1[6];
      }
      ++v4;
    }
    while (v4 < (int)((unint64_t)(v2 - v3) >> 3));
  }
  uint64_t v7 = (void *)a1[8];
  uint64_t v8 = a1[9];
  if ((int)((unint64_t)(v8 - (void)v7) >> 3) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = v7[v9];
      if (v10)
      {
        (*(void (**)(void))(*(void *)v10 + 8))(v7[v9]);
        uint64_t v7 = (void *)a1[8];
        uint64_t v8 = a1[9];
      }
      ++v9;
    }
    while (v9 < (int)((unint64_t)(v8 - (void)v7) >> 3));
  }
  uint64_t v11 = (void *)a1[11];
  if (v11)
  {
    a1[12] = v11;
    operator delete(v11);
    uint64_t v7 = (void *)a1[8];
  }
  if (v7)
  {
    a1[9] = v7;
    operator delete(v7);
  }
  uint64_t v12 = (void *)a1[5];
  if (v12)
  {
    a1[6] = v12;
    operator delete(v12);
  }
  return a1;
}

int32x2_t sub_1B6E2B59C(uint64_t a1)
{
  uint64_t v1 = *(int ***)(a1 + 40);
  if (*(int ***)(a1 + 48) == v1)
  {
    int v4 = 0;
    LODWORD(v5) = 0;
    int v6 = 0;
    int32x2_t v3 = 0;
  }
  else
  {
    uint64_t v2 = *v1;
    int32x2_t v3 = *(int32x2_t *)(*v1 + 1);
    int v4 = **v1;
    uint64_t v5 = (*((void *)v2 + 7) - *((void *)v2 + 6)) >> 2;
    int v6 = v2[5];
  }
  int32x2_t result = vrev64_s32(v3);
  *(int32x2_t *)(a1 + 20) = result;
  *(_DWORD *)(a1 + 28) = v4;
  *(_DWORD *)(a1 + 32) = v5;
  *(_DWORD *)(a1 + 36) = v6;
  return result;
}

uint64_t sub_1B6E2B5EC(uint64_t result, uint64_t a2)
{
  *(int32x2_t *)(result + 20) = vadd_s32(*(int32x2_t *)(result + 20), vrev64_s32(*(int32x2_t *)(a2 + 4)));
  int v2 = *(_DWORD *)(result + 32) + ((*(void *)(a2 + 56) - *(void *)(a2 + 48)) >> 2);
  *(_DWORD *)(result + 28) += *(_DWORD *)a2;
  *(_DWORD *)(result + 32) = v2;
  int v3 = *(_DWORD *)(a2 + 20);
  if (*(_DWORD *)(result + 36) > v3) {
    int v3 = *(_DWORD *)(result + 36);
  }
  *(_DWORD *)(result + 36) = v3;
  return result;
}

uint64_t sub_1B6E2B638(void *a1, uint64_t a2)
{
  unint64_t v6 = a1[7];
  uint64_t v4 = (uint64_t)(a1 + 7);
  unint64_t v5 = v6;
  uint64_t v7 = *(uint64_t **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = a1[5];
    uint64_t v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - v9;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13) {
      uint64_t v14 = (char *)sub_1B64285D4(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = (uint64_t *)&v14[8 * v10];
    uint64_t v16 = &v14[8 * v13];
    uint64_t *v15 = a2;
    uint64_t v8 = v15 + 1;
    int v18 = (char *)a1[5];
    unsigned int v17 = (char *)a1[6];
    if (v17 != v18)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *--uint64_t v15 = v19;
      }
      while (v17 != v18);
      unsigned int v17 = (char *)a1[5];
    }
    a1[5] = v15;
    a1[6] = v8;
    a1[7] = v16;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *uint64_t v7 = a2;
    uint64_t v8 = v7 + 1;
  }
  a1[6] = v8;

  return sub_1B6E2B5EC((uint64_t)a1, a2);
}

void sub_1B6E2B724(void *a1, uint64_t a2)
{
  unint64_t v6 = a1[10];
  uint64_t v4 = (uint64_t)(a1 + 10);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = a1[8];
    uint64_t v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - v9;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13) {
      uint64_t v14 = (char *)sub_1B64285D4(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = &v14[8 * v10];
    uint64_t v16 = &v14[8 * v13];
    *(void *)uint64_t v15 = a2;
    uint64_t v8 = v15 + 8;
    int v18 = (char *)a1[8];
    unsigned int v17 = (char *)a1[9];
    if (v17 != v18)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      unsigned int v17 = (char *)a1[8];
    }
    a1[8] = v15;
    a1[9] = v8;
    a1[10] = v16;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *uint64_t v7 = a2;
    uint64_t v8 = v7 + 1;
  }
  a1[9] = v8;
}

void sub_1B6E2B7F8(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1B6E2C2B8((char **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

uint64_t sub_1B6E2B834(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if ((int)((unint64_t)(*(void *)(a1 + 48) - v2) >> 3) < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    uint64_t v6 = sub_1B6E1BBA4(*(void *)(v2 + 8 * v5++), a2) + v6;
    uint64_t v2 = *(void *)(a1 + 40);
  }
  while (v5 < (int)((unint64_t)(*(void *)(a1 + 48) - v2) >> 3));
  return v6;
}

void sub_1B6E2B8B0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!*(_DWORD *)(**(void **)(a1 + 40) + 8))
  {
    uint64_t v10 = "Failure in TopologyRefiner::RefineUniform() -- base level is uninitialized.";
    goto LABEL_5;
  }
  if (*(void *)(a1 + 72) != *(void *)(a1 + 64))
  {
    uint64_t v10 = "Failure in TopologyRefiner::RefineUniform() -- previous refinements already applied.";
LABEL_5:
    sub_1B6E240DC(4, (uint64_t)v10, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  *(unsigned char *)(a1 + 12) = a2;
  int v11 = a2 & 0xF;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 8) & 0xC3 | (4 * (a2 & 0xF)) | 1;
  sub_1B6E11060(*(_DWORD *)a1);
  if (v11) {
    operator new();
  }

  sub_1B6E2B3BC((void *)a1);
}

uint64_t sub_1B6E2BA94(uint64_t result, _WORD *a2, unsigned int a3)
{
  unint64_t v4 = (_WORD *)result;
  int v5 = 15;
  if ((*a2 & 0x100) != 0)
  {
    int32x2_t result = sub_1B6E11098(a3);
    BOOL v6 = result == 4;
    if (result == 4) {
      int v5 = 11;
    }
    else {
      int v5 = 15;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  int v7 = v5 | *v4 & 0xFFF0;
  *unint64_t v4 = v5 | *v4 & 0xFFF0;
  if (v6 | ((unsigned __int16)(*a2 & 0x200) >> 9)) {
    int v8 = 0;
  }
  else {
    int v8 = 16;
  }
  unsigned int v9 = v8 | v7 & 0xFFFFFFEF;
  *unint64_t v4 = v9;
  unsigned int v10 = (v9 & 0xFFFFFC1F | ((unsigned __int16)*a2 >> 4) & 0x20) ^ 0x3E0;
  *unint64_t v4 = v10;
  *unint64_t v4 = v10 & 0xFBFF | *a2 & 0x400;
  return result;
}

void sub_1B6E2BB50(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v18 = a2;
  if (!*(_DWORD *)(**(void **)(a1 + 40) + 8))
  {
    unsigned int v10 = "Failure in TopologyRefiner::RefineAdaptive() -- base level is uninitialized.";
    goto LABEL_15;
  }
  if (*(void *)(a1 + 72) != *(void *)(a1 + 64))
  {
    unsigned int v10 = "Failure in TopologyRefiner::RefineAdaptive() -- previous refinements already applied.";
LABEL_15:
    sub_1B6E240DC(4, (uint64_t)v10, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  if (*(_DWORD *)a1 != 1)
  {
    unsigned int v10 = "Failure in TopologyRefiner::RefineAdaptive() -- currently only supported for Catmark scheme.";
    goto LABEL_15;
  }
  *(unsigned char *)(a1 + 8) &= ~1u;
  *(_WORD *)(a1 + 16) = a2;
  int v11 = a2 & 0xF;
  sub_1B6E2BA94((uint64_t)&v17, &v18, 1u);
  if ((v17 & 0x400) != 0)
  {
    uint64_t v12 = *(uint64_t **)(**(void **)(a1 + 40) + 456);
    unint64_t v13 = *(void *)(**(void **)(a1 + 40) + 464) - (void)v12;
    if ((int)(v13 >> 3) < 1) {
      goto LABEL_11;
    }
    char v14 = 0;
    uint64_t v15 = (v13 >> 3);
    do
    {
      uint64_t v16 = *v12++;
      v14 |= *(unsigned char *)(v16 + 12) == 0;
      --v15;
    }
    while (v15);
    if ((v14 & 1) == 0) {
LABEL_11:
    }
      LOWORD(v17) = v17 & 0xFBFF;
  }
  sub_1B6E11060(*(_DWORD *)a1);
  if (v11) {
    operator new();
  }
  *(unsigned char *)(a1 + 8) = ((*(_DWORD *)(a1 + 72) - *(_DWORD *)(a1 + 64)) >> 1) & 0x3C | *(unsigned char *)(a1 + 8) & 0xC3;
  sub_1B6E2B3BC((void *)a1);
}

void sub_1B6E2BE50(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (*a3)
  {
    unint64_t v4 = *(int **)(*(void *)a2 + 8);
    if ((*a3 & 0x400) != 0) {
      uint64_t v5 = (*((void *)v4 + 58) - *((void *)v4 + 57)) >> 3;
    }
    else {
      LODWORD(v5) = 0;
    }
    if (*v4 >= 1)
    {
      uint64_t v6 = 0;
      int v36 = *(_DWORD *)(*(void *)a2 + 32);
      int v37 = v4[3];
      do
      {
        if (*(unsigned char *)(*((void *)v4 + 12) + v6)) {
          goto LABEL_70;
        }
        uint64_t v7 = *((void *)v4 + 3);
        if (!v37)
        {
          uint64_t v8 = *(unsigned int *)(v7 + 8 * v6);
          if (v8 != v36)
          {
            if ((int)v8 >= 1)
            {
              uint64_t v25 = 0;
              uint64_t v26 = *((void *)v4 + 6) + 4 * *(int *)(v7 + ((8 * v6) | 4));
              do
              {
                uint64_t v27 = *(int *)(v26 + 4 * v25);
                uint64_t v28 = *((void *)v4 + 33);
                uint64_t v29 = *(unsigned int *)(v28 + 8 * v27);
                if ((int)v29 >= 1)
                {
                  uint64_t v30 = (int *)(*((void *)v4 + 36) + 4 * *(int *)(v28 + 8 * v27 + 4));
                  do
                  {
                    int v31 = *v30++;
                    sub_1B6E29A98(a2, v31);
                    --v29;
                  }
                  while (v29);
                }
                ++v25;
              }
              while (v25 != v8);
            }
            goto LABEL_70;
          }
        }
        uint64_t v9 = *(unsigned int *)(v7 + 8 * v6);
        sub_1B6E196D8(v4, v6, &v39, 0xFFFFFFFF);
        unsigned int v10 = sub_1B6E1988C(&v39, v9);
        if ((v10 & 0x800) != 0) {
          goto LABEL_16;
        }
        if ((v10 & 1) != 0 && (*(_WORD *)a3 & 0x200) != 0) {
          goto LABEL_69;
        }
        if (v10 & 2) != 0 && (*(_WORD *)a3)
        {
          if ((v10 & 0x780) == 0x80) {
            goto LABEL_69;
          }
          if (v4[3] <= 1 && (int)v9 >= 1)
          {
            int v33 = &v39;
            do
            {
              __int16 v34 = *v33++;
              if ((v34 & 0x782) == 0x82) {
                goto LABEL_69;
              }
              --v9;
            }
            while (v9);
          }
        }
        if ((v10 & 0x780) == 0x80)
        {
LABEL_16:
          LOWORD(v11) = *(_WORD *)a3;
          goto LABEL_17;
        }
        if ((v10 & 0x80) == 0) {
          goto LABEL_69;
        }
        if ((v10 & 0x60) != 0)
        {
          if ((~*(unsigned __int16 *)a3 & 0xC) == 0) {
            goto LABEL_69;
          }
          int v32 = sub_1B6E1A334(v4, v6, 0, 0);
          LOWORD(v11) = *(_WORD *)a3;
          if (v32)
          {
            if ((v11 & 4) != 0) {
              goto LABEL_69;
            }
          }
          else if ((v11 & 8) != 0)
          {
            goto LABEL_69;
          }
        }
        else
        {
          if ((v10 & 0x1010) == 0) {
            goto LABEL_16;
          }
          if ((v10 & 0x4000) != 0)
          {
            if (((v10 >> 7) & 0xF) >= 8)
            {
              LOWORD(v11) = *(_WORD *)a3;
              if ((*(_WORD *)a3 & 0x100) != 0) {
                goto LABEL_69;
              }
            }
            else if (((v10 >> 7) & 4) != 0)
            {
              int v11 = *(unsigned __int16 *)a3;
              if ((v10 & 4) != 0) {
                int v35 = 2;
              }
              else {
                int v35 = 128;
              }
              if ((v11 & v35) != 0) {
                goto LABEL_69;
              }
            }
            else
            {
              if (((v10 >> 7) & 2) == 0) {
                goto LABEL_16;
              }
              LOWORD(v11) = *(_WORD *)a3;
              if ((*(_WORD *)a3 & 0x40) != 0) {
                goto LABEL_69;
              }
            }
          }
          else
          {
            if ((v10 & 4) != 0)
            {
              if ((v10 & 0x400) == 0) {
                goto LABEL_16;
              }
              LOWORD(v11) = *(_WORD *)a3;
              if ((v10 & 8) != 0) {
                goto LABEL_17;
              }
            }
            else
            {
              LOWORD(v11) = *(_WORD *)a3;
              if ((v10 & 0x400) == 0)
              {
                if ((v11 & 0x10) != 0) {
                  goto LABEL_69;
                }
                goto LABEL_17;
              }
            }
            if ((v11 & 0x20) != 0) {
              goto LABEL_69;
            }
          }
        }
LABEL_17:
        if ((v11 & 0x400) != 0 && (int)v5 >= 1)
        {
          int v12 = 0;
          LOBYTE(v13) = 0;
          while (1)
          {
            if (sub_1B6E196B0((uint64_t)v4, v6, v12)) {
              goto LABEL_29;
            }
            uint64_t v14 = *((void *)v4 + 3);
            int v15 = *(_DWORD *)(v14 + 8 * v6);
            if (v15 >= 1)
            {
              uint64_t v16 = (int *)(*((void *)v4 + 6) + 4 * *(int *)(v14 + 4 * ((2 * v6) | 1)));
              int v17 = &v39;
              uint64_t v18 = *(unsigned int *)(v14 + 8 * v6);
              do
              {
                int v19 = *v16++;
                *v17++ = sub_1B6E19B0C((uint64_t)v4, v19, v12);
                --v18;
              }
              while (v18);
            }
            unsigned int v20 = sub_1B6E1988C(&v39, v15);
            if ((v20 & 1) != 0 && (*(_WORD *)a3 & 0x200) != 0)
            {
LABEL_28:
              LOBYTE(v13) = 1;
              goto LABEL_29;
            }
            if ((v20 & 2) != 0)
            {
              LOBYTE(v13) = 1;
              if (v20 & 0x80) == 0 || (*(_WORD *)a3) {
                goto LABEL_29;
              }
            }
            else if ((v20 & 0x80) == 0)
            {
              goto LABEL_28;
            }
            if ((v20 & 0x4000) == 0) {
              break;
            }
            if (((v20 >> 7) & 0xF) < 8)
            {
              if (((v20 >> 7) & 4) != 0)
              {
                if ((v20 & 4) != 0) {
                  __int16 v24 = 2;
                }
                else {
                  __int16 v24 = 128;
                }
                LOBYTE(v13) = (unsigned __int16)(*(_WORD *)a3 & v24) != 0;
                goto LABEL_29;
              }
              if (((v20 >> 7) & 2) != 0)
              {
                int v13 = (*(unsigned __int16 *)a3 >> 6) & 1;
                goto LABEL_29;
              }
              goto LABEL_44;
            }
            int v13 = HIBYTE(*(unsigned __int16 *)a3) & 1;
LABEL_29:
            if ((v13 & 1) == 0 && ++v12 < (int)v5) {
              continue;
            }
            if ((v13 & 1) == 0) {
              goto LABEL_70;
            }
LABEL_69:
            sub_1B6E29A98(a2, v6);
            goto LABEL_70;
          }
          if ((v20 & 4) == 0)
          {
            unsigned int v21 = *(unsigned __int16 *)a3;
            int v22 = (v21 >> 4) & 1;
            int v23 = (v21 >> 5) & 1;
            if ((v20 & 0x400) != 0) {
              LOBYTE(v13) = v23;
            }
            else {
              LOBYTE(v13) = v22;
            }
            goto LABEL_29;
          }
          if ((v20 & 0x400) != 0)
          {
            LOBYTE(v13) = (v20 & 8) == 0 && (*(_WORD *)a3 & 0x20) != 0;
            goto LABEL_29;
          }
LABEL_44:
          LOBYTE(v13) = 0;
          goto LABEL_29;
        }
LABEL_70:
        ++v6;
      }
      while (v6 < *v4);
    }
  }
}

void sub_1B6E2C2B8(char **a1, unint64_t a2)
{
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v5 - v6) >> 3) >= a2)
  {
    a1[1] = &v6[24 * (24 * a2 / 0x18)];
  }
  else
  {
    uint64_t v7 = *a1;
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v6 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - v7) >> 3);
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
      int v12 = (char *)sub_1B6428204(v4, v11);
      uint64_t v7 = *a1;
      uint64_t v6 = a1[1];
    }
    else
    {
      int v12 = 0;
    }
    int v13 = &v12[24 * v8];
    uint64_t v14 = &v12[24 * v11];
    int v15 = &v13[24 * (24 * a2 / 0x18)];
    if (v6 != v7)
    {
      do
      {
        long long v16 = *(_OWORD *)(v6 - 24);
        *((void *)v13 - 1) = *((void *)v6 - 1);
        *(_OWORD *)(v13 - 24) = v16;
        v13 -= 24;
        v6 -= 24;
      }
      while (v6 != v7);
      uint64_t v7 = *a1;
    }
    *a1 = v13;
    a1[1] = v15;
    a1[2] = v14;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

double sub_1B6E2C41C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  return result;
}

uint64_t sub_1B6E2C440(void *a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6)
{
  if (a6 < 0)
  {
    uint64_t v12 = *(void *)(a2 + 24);
    unint64_t v10 = (int *)(*(void *)(a2 + 48) + 4 * *(int *)(v12 + 8 * a3 + 4));
    unint64_t v11 = (int *)*(unsigned int *)(v12 + 8 * a3);
  }
  else
  {
    unint64_t v10 = (int *)sub_1B6E19D0C(a2, a3, a6);
  }
  int v66 = a3;
  v67[0] = v10;
  v67[1] = v11;
  uint64_t v13 = 0;
  if ((sub_1B6E198BC(a2, v67) & 4) != 0)
  {
    int v15 = (char **)(a1 + 5);
    int v31 = (char *)a1[5];
    int v32 = (void **)(a1 + 4);
    int v33 = a1 + 6;
    do
    {
      int v34 = v67[0][v13] + a5;
      if ((unint64_t)v31 >= *v33)
      {
        int v36 = (char *)*v32;
        uint64_t v37 = (v31 - (unsigned char *)*v32) >> 2;
        unint64_t v38 = v37 + 1;
        if ((unint64_t)(v37 + 1) >> 62) {
          goto LABEL_76;
        }
        uint64_t v39 = *v33 - (void)v36;
        if (v39 >> 1 > v38) {
          unint64_t v38 = v39 >> 1;
        }
        if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v40 = v38;
        }
        if (v40)
        {
          __int16 v41 = (char *)sub_1B64282E0((uint64_t)(a1 + 6), v40);
          int v31 = *v15;
          int v36 = (char *)*v32;
        }
        else
        {
          __int16 v41 = 0;
        }
        int v42 = &v41[4 * v37];
        *(_DWORD *)int v42 = v34;
        int v35 = v42 + 4;
        while (v31 != v36)
        {
          int v43 = *((_DWORD *)v31 - 1);
          v31 -= 4;
          *((_DWORD *)v42 - 1) = v43;
          v42 -= 4;
        }
        *int v32 = v42;
        char *v15 = v35;
        *int v33 = &v41[4 * v40];
        if (v36) {
          operator delete(v36);
        }
      }
      else
      {
        *(_DWORD *)int v31 = v34;
        int v35 = v31 + 4;
      }
      char *v15 = v35;
      ++v13;
      int v31 = v35;
    }
    while (v13 != 4);
    unint64_t v44 = a1[12];
    int v45 = (char *)a1[11];
    if ((unint64_t)v45 >= v44)
    {
      unint64_t v53 = (char *)a1[10];
      uint64_t v54 = (v45 - v53) >> 2;
      unint64_t v55 = v54 + 1;
      if ((unint64_t)(v54 + 1) >> 62) {
        goto LABEL_76;
      }
      uint64_t v56 = v44 - (void)v53;
      if (v56 >> 1 > v55) {
        unint64_t v55 = v56 >> 1;
      }
      if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v57 = v55;
      }
      if (v57)
      {
        uint64_t v58 = (char *)sub_1B64282E0((uint64_t)(a1 + 12), v57);
        unint64_t v53 = (char *)a1[10];
        int v45 = (char *)a1[11];
      }
      else
      {
        uint64_t v58 = 0;
      }
      char v62 = (int *)&v58[4 * v54];
      unint64_t v63 = &v58[4 * v57];
      *char v62 = v66;
      unint64_t v46 = v62 + 1;
      while (v45 != v53)
      {
        int v64 = *((_DWORD *)v45 - 1);
        v45 -= 4;
        *--char v62 = v64;
      }
      a1[10] = v62;
      a1[11] = v46;
      a1[12] = v63;
      if (v53) {
        operator delete(v53);
      }
    }
    else
    {
      *(_DWORD *)int v45 = v66;
      unint64_t v46 = v45 + 4;
    }
    a1[11] = v46;
    return (uint64_t)(*v15 - 16);
  }
  int v15 = (char **)(a1 + 2);
  uint64_t v14 = (char *)a1[2];
  long long v16 = (void **)(a1 + 1);
  int v17 = a1 + 3;
  do
  {
    int v18 = v67[0][v13] + a5;
    if ((unint64_t)v14 >= *v17)
    {
      unsigned int v20 = (char *)*v16;
      uint64_t v21 = (v14 - (unsigned char *)*v16) >> 2;
      unint64_t v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) >> 62) {
        goto LABEL_76;
      }
      uint64_t v23 = *v17 - (void)v20;
      if (v23 >> 1 > v22) {
        unint64_t v22 = v23 >> 1;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v24 = v22;
      }
      if (v24)
      {
        uint64_t v25 = (char *)sub_1B64282E0((uint64_t)(a1 + 3), v24);
        uint64_t v14 = *v15;
        unsigned int v20 = (char *)*v16;
      }
      else
      {
        uint64_t v25 = 0;
      }
      uint64_t v26 = &v25[4 * v21];
      *(_DWORD *)uint64_t v26 = v18;
      int v19 = v26 + 4;
      while (v14 != v20)
      {
        int v27 = *((_DWORD *)v14 - 1);
        v14 -= 4;
        *((_DWORD *)v26 - 1) = v27;
        v26 -= 4;
      }
      int *v16 = v26;
      char *v15 = v19;
      void *v17 = &v25[4 * v24];
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v14 = v18;
      int v19 = v14 + 4;
    }
    char *v15 = v19;
    ++v13;
    uint64_t v14 = v19;
  }
  while (v13 != 4);
  unint64_t v28 = a1[9];
  uint64_t v29 = (char *)a1[8];
  if ((unint64_t)v29 >= v28)
  {
    uint64_t v47 = (char *)a1[7];
    uint64_t v48 = (v29 - v47) >> 2;
    unint64_t v49 = v48 + 1;
    if (!((unint64_t)(v48 + 1) >> 62))
    {
      uint64_t v50 = v28 - (void)v47;
      if (v50 >> 1 > v49) {
        unint64_t v49 = v50 >> 1;
      }
      if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v51 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v51 = v49;
      }
      if (v51)
      {
        uint64_t v52 = (char *)sub_1B64282E0((uint64_t)(a1 + 9), v51);
        uint64_t v47 = (char *)a1[7];
        uint64_t v29 = (char *)a1[8];
      }
      else
      {
        uint64_t v52 = 0;
      }
      unint64_t v59 = (int *)&v52[4 * v48];
      uint64_t v60 = &v52[4 * v51];
      int *v59 = v66;
      uint64_t v30 = v59 + 1;
      while (v29 != v47)
      {
        int v61 = *((_DWORD *)v29 - 1);
        v29 -= 4;
        *--unint64_t v59 = v61;
      }
      a1[7] = v59;
      a1[8] = v30;
      a1[9] = v60;
      if (v47) {
        operator delete(v47);
      }
      goto LABEL_67;
    }
LABEL_76:
    abort();
  }
  *(_DWORD *)uint64_t v29 = v66;
  uint64_t v30 = v29 + 4;
LABEL_67:
  a1[8] = v30;
  return (uint64_t)(*v15 - 16);
}

void sub_1B6E2C810(void *a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  unint64_t v8 = a1;
  uint64_t v10 = a1[7];
  uint64_t v9 = a1[8];
  uint64_t v11 = v9 - v10;
  uint64_t v37 = a1[10];
  uint64_t v39 = a1[11];
  unint64_t v12 = (v39 - v37) >> 2;
  unint64_t v13 = v12 + ((v9 - v10) >> 2);
  uint64_t v14 = *(void **)(*(void *)(*a1 + 40) + 8 * (((unint64_t)*(unsigned __int8 *)(*a1 + 8) >> 2) & 0xF));
  sub_1B642863C((uint64_t)a3, 4 * v13);
  if (v13)
  {
    uint64_t v15 = *a3;
    if (v9 != v10)
    {
      uint64_t v16 = 0;
      if ((unint64_t)(v11 >> 2) <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v11 >> 2;
      }
      do
      {
        sub_1B6E2CA58(v14, *(_DWORD *)(v8[7] + 4 * v16), v15, a5);
        v15 += 16;
        ++v16;
      }
      while (v17 != v16);
    }
    if (v39 != v37)
    {
      uint64_t v18 = 0;
      if (v12 <= 1) {
        unint64_t v12 = 1;
      }
      do
      {
        sub_1B6E2CA58(v14, *(_DWORD *)(v8[10] + 4 * v18), v15, a5);
        v15 += 16;
        ++v18;
      }
      while (v12 != v18);
    }
  }
  uint64_t v19 = (2 * a2) | 1;
  sub_1B642863C((uint64_t)a4, *(int *)(*v8 + 20) * v19);
  uint64_t v20 = 0;
  int v21 = 0;
  unint64_t v22 = ((unint64_t)*(unsigned __int8 *)(*v8 + 8) >> 2) & 0xF;
  uint64_t v23 = (int)v19;
  uint64_t v24 = (v22 + 1);
  unint64_t v25 = (8 * ((unint64_t)(2 * a2) >> 1)) | 4;
  unint64_t v40 = v22;
  __int16 v41 = v8;
  uint64_t v38 = v24;
  do
  {
    uint64_t v26 = *(void *)(*(void *)(*v8 + 40) + 8 * v20);
    int v27 = *(_DWORD *)(v26 + 8);
    if (v20 == v22 && v27 >= 1)
    {
      uint64_t v43 = v20;
      int v28 = 0;
      uint64_t v29 = v21 * (int)v23;
      uint64_t v30 = 4 * v29 + 4;
      do
      {
        uint64_t v31 = *a4;
        int v32 = (int *)(*a4 + 4 * v29);
        *int v32 = 0;
        int v33 = sub_1B6E19C00((void *)v26, v28, (uint64_t)(v32 + 1), 0xFFFFFFFF);
        if (v33 >= 1)
        {
          uint64_t v34 = v33;
          int v35 = (_DWORD *)(v31 + v30);
          do
          {
            *v35++ += v21;
            --v34;
          }
          while (v34);
        }
        if (v33)
        {
          v32[v33 + 1] = v32[v33];
          int v33 = ~v33;
        }
        if (v33 >= 0) {
          int v36 = v33;
        }
        else {
          int v36 = v33 + 1;
        }
        *int v32 = v36 >> 1;
        v29 += v23;
        ++v28;
        int v27 = *(_DWORD *)(v26 + 8);
        v30 += v25;
      }
      while (v28 < v27);
      unint64_t v8 = v41;
      uint64_t v20 = v43;
      uint64_t v24 = v38;
      unint64_t v22 = v40;
    }
    v21 += v27;
    ++v20;
  }
  while (v20 != v24);
}

uint64_t sub_1B6E2CA58(void *a1, int a2, uint64_t a3, int a4)
{
  if (a4 < 0) {
    uint64_t result = a1[6] + 4 * *(int *)(a1[3] + 4 * ((2 * a2) | 1));
  }
  else {
    uint64_t result = sub_1B6E19D0C((uint64_t)a1, a2, a4);
  }
  uint64_t v8 = 0;
  uint64_t v9 = a1[36];
  uint64_t v10 = a1[33];
  uint64_t v11 = a1[42];
  do
  {
    uint64_t v12 = *(int *)(result + 4 * v8);
    int v13 = 2 * v12;
    uint64_t v14 = *(unsigned int *)(v10 + 8 * v12);
    if ((int)v14 < 1)
    {
LABEL_9:
      LODWORD(v15) = -1;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = v9 + 4 * *(int *)(v10 + 8 * v12 + 4);
      while (*(_DWORD *)(v16 + 4 * v15) != a2)
      {
        if (v14 == ++v15) {
          goto LABEL_9;
        }
      }
    }
    *(_DWORD *)(a3 + 4 * v8++) = v15 | ((((int)v15 + 1) % *(_DWORD *)(v11 + 4 * v13)) << 8);
  }
  while (v8 != 4);
  return result;
}

uint64_t sub_1B6E2CB2C(uint64_t a1, int *a2)
{
  unint64_t v4 = *a2;
  uint64_t v5 = **(void **)(a1 + 40);
  *(_DWORD *)(v5 + 8) = v4;
  sub_1B642863C(v5 + 264, 2 * v4);
  sub_1B642863C(v5 + 336, 2 * v4);
  sub_1B642860C(v5 + 408, v4);
  sub_1B6E1BBD4(v5 + 432, v4);
  bzero(*(void **)(v5 + 432), 2 * *(int *)(v5 + 8));
  unint64_t v6 = a2[1];
  uint64_t v7 = **(int ***)(a1 + 40);
  *uint64_t v7 = v6;
  sub_1B642863C((uint64_t)(v7 + 6), 2 * v6);
  uint64_t v8 = (char *)*((void *)v7 + 12);
  unint64_t v9 = *((void *)v7 + 13) - (void)v8;
  if (v6 <= v9)
  {
    if (v6 < v9) {
      *((void *)v7 + 13) = &v8[v6];
    }
  }
  else
  {
    sub_1B6E1BCF8((void **)v7 + 12, v6 - v9);
    uint64_t v8 = (char *)*((void *)v7 + 12);
  }
  bzero(v8, *v7);
  if (a2[1] >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *((void *)a2 + 1);
    uint64_t v12 = **(void **)(a1 + 40);
    int v13 = *(_DWORD **)(v12 + 24);
    do
    {
      int v14 = *(_DWORD *)(v11 + 4 * v10);
      _DWORD *v13 = v14;
      if (v10) {
        int v15 = *(v13 - 1) + *(v13 - 2);
      }
      else {
        int v15 = 0;
      }
      v13[1] = v15;
      if (*(_DWORD *)(v12 + 20) > v14) {
        int v14 = *(_DWORD *)(v12 + 20);
      }
      *(_DWORD *)(v12 + 20) = v14;
      ++v10;
      v13 += 2;
    }
    while (v10 < a2[1]);
  }
  return 1;
}

uint64_t sub_1B6E2CC74(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a2 + 4) >= 1)
  {
    uint64_t v2 = 0;
    int v3 = 0;
    uint64_t v4 = **(void **)(a1 + 40);
    uint64_t v5 = *(void *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 48);
    int v7 = *(unsigned __int8 *)(a2 + 88);
    uint64_t v8 = *(void *)(a2 + 16);
    do
    {
      unint64_t v9 = (unsigned int *)(v5 + 8 * v2);
      uint64_t v10 = *v9;
      uint64_t v11 = (_DWORD *)(v6 + 4 * (int)v9[1]);
      if (v7)
      {
        *uint64_t v11 = *(_DWORD *)(v8 + 4 * v3++);
        if ((int)v10 >= 2)
        {
          unint64_t v12 = v10 + 1;
          int v13 = (int *)(v8 + 4 * v3);
          do
          {
            int v14 = *v13++;
            v11[(v12-- - 2)] = v14;
            ++v3;
          }
          while (v12 > 2);
        }
      }
      else if ((int)v10 >= 1)
      {
        int v15 = (int *)(v8 + 4 * v3);
        v3 += v10;
        do
        {
          int v16 = *v15++;
          *v11++ = v16;
          --v10;
        }
        while (v10);
      }
      ++v2;
    }
    while (v2 < *(int *)(a2 + 4));
  }
  return 1;
}

uint64_t sub_1B6E2CD28(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(int *)(a2 + 24) >= 1)
  {
    uint64_t v4 = *(void *)(a2 + 32);
    if (v4)
    {
      if (*(void *)(a2 + 40))
      {
        uint64_t v5 = 0;
        uint64_t v6 = (int *)(v4 + 4);
        do
        {
          int v7 = sub_1B6E1A4D0(**(void ***)(a1 + 40), *(v6 - 1), *v6);
          if (v7 == -1)
          {
            snprintf(__str, 0x400uLL, "Edge %d specified to be sharp does not exist (%d, %d)", v5, *(v6 - 1), *v6);
            sub_1B6E241AC((uint64_t)"%s", v8, v9, v10, v11, v12, v13, v14, (char)__str);
          }
          else
          {
            *(_DWORD *)(*(void *)(**(void **)(a1 + 40) + 216) + 4 * v7) = *(_DWORD *)(*(void *)(a2 + 40)
                                                                                            + 4 * v5);
          }
          ++v5;
          v6 += 2;
        }
        while (v5 < *(int *)(a2 + 24));
      }
    }
  }
  if (*(int *)(a2 + 48) >= 1 && *(void *)(a2 + 56) && *(void *)(a2 + 64))
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = *(unsigned int *)(*(void *)(a2 + 56) + 4 * v15);
      if ((v16 & 0x80000000) != 0 || (uint64_t v17 = **(void **)(a1 + 40), (int)v16 >= *(_DWORD *)(v17 + 8)))
      {
        snprintf(__str, 0x400uLL, "Vertex %d specified to be sharp does not exist", *(_DWORD *)(*(void *)(a2 + 56) + 4 * v15));
        sub_1B6E241AC((uint64_t)"%s", v18, v19, v20, v21, v22, v23, v24, (char)__str);
      }
      else
      {
        *(_DWORD *)(*(void *)(v17 + 408) + 4 * v16) = *(_DWORD *)(*(void *)(a2 + 64) + 4 * v15);
      }
      ++v15;
    }
    while (v15 < *(int *)(a2 + 48));
  }
  if (*(int *)(a2 + 72) >= 1)
  {
    uint64_t v25 = 0;
    do
    {
      uint64_t v26 = *(int *)(*(void *)(a2 + 80) + 4 * v25);
      uint64_t v27 = *(void *)(**(void **)(a1 + 40) + 96);
      *(unsigned char *)(v27 + v26) |= 1u;
      *(unsigned char *)(a1 + 8) |= 2u;
      ++v25;
    }
    while (v25 < *(int *)(a2 + 72));
  }
  return 1;
}

uint64_t sub_1B6E2CF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1B6E241AC((uint64_t)"%s", a2, a3, a4, a5, a6, a7, a8, a2);
}

uint64_t sub_1B6E2CF54(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a2 + 92) >= 1) {
    sub_1B6E1BA7C();
  }
  return 1;
}

uint64_t sub_1B6E2D07C(uint64_t a1)
{
  return a1;
}

BOOL sub_1B6E2D0A8(uint64_t a1, void **a2)
{
  uint64_t v3 = objc_msgSend_newBufferWithLength_options_(*a2, (const char *)a2, 4 * *(_DWORD *)(a1 + 4) * *(_DWORD *)a1, 0);
  uint64_t v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v3;

  int v7 = *(void **)(a1 + 8);
  if (v7)
  {
    *(unsigned char *)(a1 + 16) = 1;
    objc_msgSend_setLabel_(v7, v5, @"OSD VertexBuffer", v6);
  }
  return v7 != 0;
}

void sub_1B6E2D114()
{
}

void *sub_1B6E2D1A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4 = a4;
  *(unsigned char *)(a1 + 16) = 1;
  int v7 = (void *)(objc_msgSend_contents(*(void **)(a1 + 8), a2, a3, a4) + 4 * *(_DWORD *)a1 * (int)a3);
  size_t v8 = 4 * *(_DWORD *)a1 * v4;

  return memcpy(v7, a2, v8);
}

id sub_1B6E2D210(uint64_t a1)
{
  return *(id *)(a1 + 8);
}

uint64_t sub_1B6E2D218(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  return sub_1B6E2D248(a1, a2, &v5, &v4, a3);
}

uint64_t sub_1B6E2D248(uint64_t a1, unint64_t a2, uint64_t *a3, _DWORD *a4, uint64_t a5)
{
  if (a2 < 0x18) {
    return 3;
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    *a3 = i + 1;
    *((unsigned char *)&v22 + i) = *(unsigned char *)(a1 + i);
  }
  if (v22 != 179426549) {
    return 3;
  }
  for (uint64_t j = 0; j != 4; ++j)
  {
    *a3 = j + 5;
    *((unsigned char *)&v22 + j) = *(unsigned char *)(a1 + 4 + j);
  }
  uint64_t v8 = 0;
  *a4 = v22;
  *a3 = 9;
  *(unsigned char *)(a5 + 8) = *(unsigned char *)(a1 + 8);
  uint64_t v9 = (*a3)++;
  *(unsigned char *)(a5 + 9) = *(unsigned char *)(a1 + v9);
  uint64_t v10 = *a3;
  char v11 = 1;
  do
  {
    uint64_t v12 = v10;
    char v13 = v11;
    *a3 = ++v10;
    *((unsigned char *)&v22 + v8) = *(unsigned char *)(a1 + v12);
    uint64_t v8 = 1;
    char v11 = 0;
  }
  while ((v13 & 1) != 0);
  uint64_t v14 = 0;
  *(_WORD *)(a5 + 10) = v22;
  do
  {
    *a3 = v10 + v14 + 1;
    *((unsigned char *)&v22 + v14) = *(unsigned char *)(a1 + v14 + v10);
    ++v14;
  }
  while (v14 != 4);
  uint64_t v15 = 0;
  *(_DWORD *)a5 = v22;
  uint64_t v16 = v10 + 4;
  uint64_t v17 = (char *)(v10 + 4 + a1);
  uint64_t v18 = v16 + 2;
  do
  {
    *a3 = v18 - 1;
    char v19 = *v17++;
    *((unsigned char *)&v22 + v15++) = v19;
    ++v18;
  }
  while (v15 != 4);
  uint64_t result = 0;
  *(_DWORD *)(a5 + 4) = v22;
  *a3 = v18 - 1;
  int v20 = *v17;
  *a3 = v18;
  int v21 = v17[1];
  *a3 = v18 + 2;
  *(_DWORD *)(a5 + 12) = v20;
  *(_DWORD *)(a5 + 16) = v21;
  return result;
}

uint64_t sub_1B6E2D3C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7, int a8, int a9, uint64_t a10)
{
  v29[0] = a2;
  v29[1] = a3;
  uint64_t v30 = 0;
  int v28 = 0;
  uint64_t v16 = sub_1B6E2D248(a2, a3, &v30, &v28, (uint64_t)&v31);
  if (!v16)
  {
    if (v33 == 1 && v34 == 0)
    {
      uint64_t v16 = 2;
      if (a6)
      {
        if (a7)
        {
          int v18 = v32;
          if (v32)
          {
            if (v31 <= a3 && (int v19 = v28, v19 == sub_1B6E306C0(v29[0] + 8, v31 - 8)))
            {
              uint64_t v27 = 0;
              memset(v26, 0, sizeof(v26));
              __p = 0;
              uint64_t v24 = 0;
              uint64_t v25 = 0;
              uint64_t v16 = sub_1B6E2DBC8(a4, a5, a7, a8, a9, (int **)v26);
              if (!v16)
              {
                uint64_t v20 = sub_1B6E2DD5C(v26, &__p);
                uint64_t v16 = v20;
                if (!v20) {
                  uint64_t v16 = sub_1B6E2D538(v20, v26, &__p, v21, a6, v18, (uint64_t)v29, a10);
                }
              }
              if (__p)
              {
                uint64_t v24 = __p;
                operator delete(__p);
              }
              sub_1B640A148((uint64_t)v26);
            }
            else
            {
              return 3;
            }
          }
        }
      }
    }
    else
    {
      return 4;
    }
  }
  return v16;
}

uint64_t sub_1B6E2D538(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = *(void *)(a7 + 16);
  unsigned int v14 = *(_DWORD *)(a7 + 8) - v13;
  uint64_t v15 = *(void *)a7 + v13;
  unsigned int v86 = v14;
  uint64_t v87 = v15;
  sub_1B6E30624((uint64_t)&v86);
  unint64_t v16 = a2[4] - a2[3];
  unint64_t v17 = v16 >> 2;
  if ((int)(v16 >> 2) < 1) {
    return 2;
  }
  unint64_t v59 = a2;
  uint64_t v60 = a3;
  __int16 v85 = 0x8000;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  int v79 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  sub_1B6E2D9F8((uint64_t)&v82, a5);
  sub_1B6E2D9F8((uint64_t)&v79, a5);
  sub_1B6E2D9F8((uint64_t)&v76, a5);
  sub_1B6E2D9F8((uint64_t)&v73, 31 * a5);
  unint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v67 = 0;
  int v68 = 0;
  uint64_t v69 = 0;
  __p = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  sub_1B642863C((uint64_t)&v70, a5);
  sub_1B642863C((uint64_t)&v67, a5);
  sub_1B642863C((uint64_t)&__p, a5);
  if (a6 < 1)
  {
    uint64_t v55 = 0;
    goto LABEL_46;
  }
  uint64_t v57 = a6;
  uint64_t v58 = 0;
  uint64_t v61 = (v16 >> 2);
  uint64_t v62 = 4 * a5;
  do
  {
    uint64_t v18 = 0;
    char v63 = 1;
    do
    {
      uint64_t v19 = *(int *)(*a3 + 4 * v18);
      if (a5 >= 1) {
        bzero(v67, v62);
      }
      uint64_t v20 = *(int *)(a2[3] + 4 * v19);
      if ((int)v20 >= 1)
      {
        unsigned int v21 = 0;
        uint64_t v22 = *(int *)(*a2 + 4 * v19);
        uint64_t v23 = v20 + v22;
        uint64_t v24 = a2[6];
        uint64_t v25 = v67;
        do
        {
          int v26 = *(_DWORD *)(v24 + 4 * v22);
          if (v26 < 0) {
            break;
          }
          if (v26 >= (int)v17)
          {
            uint64_t v55 = 2;
            goto LABEL_46;
          }
          if (a5 >= 1)
          {
            uint64_t v27 = (int *)(a8 + 4 * v26 * a5);
            uint64_t v28 = a5;
            uint64_t v29 = v25;
            do
            {
              int v30 = *v27++;
              *v29++ += v30;
              --v28;
            }
            while (v28);
          }
          ++v21;
          ++v22;
        }
        while (v22 < v23);
        if (v21 < 2) {
          goto LABEL_19;
        }
        if (a5 < 1)
        {
          BOOL v54 = sub_1B6E2DA28(&v86, &v85) != (v63 & 1);
          goto LABEL_39;
        }
        unsigned int v31 = v67;
        uint64_t v32 = a5;
        do
        {
          *unsigned int v31 = (int)(*v31 + (v21 >> 1)) / (int)v21;
          ++v31;
          --v32;
        }
        while (v32);
      }
LABEL_19:
      int v33 = sub_1B6E2DA28(&v86, &v85);
      int v34 = v63 & 1;
      BOOL v35 = v33 == v34;
      BOOL v36 = v33 != v34;
      if (v35)
      {
        if (a5 < 1)
        {
          char v63 = 0;
          goto LABEL_40;
        }
        char v63 = v36;
        uint64_t v37 = 0;
        do
        {
          if (sub_1B6E2DA28(&v86, (_WORD *)v76 + v37))
          {
            BOOL v38 = sub_1B6E2DA28(&v86, (_WORD *)v82 + v37);
            BOOL v39 = sub_1B6E2DA28(&v86, (_WORD *)v73 + (31 * v37));
            int v40 = v39 + 2 * sub_1B6E2DA28(&v86, (_WORD *)v73 + 31 * (int)v37 + v39 + 1);
            int v41 = v40 + 4 * sub_1B6E2DA28(&v86, (_WORD *)v73 + 31 * (int)v37 + v40 + 3);
            int v42 = v41 + 8 * sub_1B6E2DA28(&v86, (_WORD *)v73 + 31 * (int)v37 + v41 + 7);
            int v43 = v42 + 16 * sub_1B6E2DA28(&v86, (_WORD *)v73 + 31 * (int)v37 + v42 + 15);
            if (v43 > 30) {
              int v44 = sub_1B6E2DB18(&v86, 6, (_WORD *)v79 + v37) + 32;
            }
            else {
              int v44 = v43 + 1;
            }
            if (!v38) {
              int v44 = -v44;
            }
          }
          else
          {
            int v44 = 0;
          }
          *((_DWORD *)__p + v37++) = v44;
        }
        while (v37 != a5);
        a2 = v59;
        a3 = v60;
        goto LABEL_33;
      }
      if (a5 >= 1)
      {
        char v63 = v36;
        bzero(__p, v62);
LABEL_33:
        int v45 = (int *)v67;
        unint64_t v46 = (int *)__p;
        uint64_t v47 = v70;
        uint64_t v48 = 4 * (int)v19 * a5;
        uint64_t v49 = a5;
        do
        {
          int v51 = *v45++;
          int v50 = v51;
          int v52 = *v46++;
          int v53 = v52 + v50;
          *v47++ = v53;
          *(_DWORD *)(a8 + v48) = v53;
          v48 += 4;
          --v49;
        }
        while (v49);
        goto LABEL_40;
      }
      BOOL v54 = 1;
LABEL_39:
      char v63 = v54;
LABEL_40:
      ++v18;
    }
    while (v18 != v61);
    uint64_t v55 = 0;
    a8 += 4 * (int)v17 * a5;
    ++v58;
  }
  while (v58 != v57);
LABEL_46:
  if (__p)
  {
    uint64_t v65 = __p;
    operator delete(__p);
  }
  if (v67)
  {
    int v68 = v67;
    operator delete(v67);
  }
  if (v70)
  {
    uint64_t v71 = v70;
    operator delete(v70);
  }
  if (v73)
  {
    uint64_t v74 = v73;
    operator delete(v73);
  }
  if (v76)
  {
    uint64_t v77 = v76;
    operator delete(v76);
  }
  if (v79)
  {
    uint64_t v80 = v79;
    operator delete(v79);
  }
  if (v82)
  {
    uint64_t v83 = v82;
    operator delete(v82);
  }
  return v55;
}

void sub_1B6E2D9F8(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 2 * a2;
    }
  }
  else
  {
    sub_1B6E2FA1C((char **)a1, a2 - v2);
  }
}

BOOL sub_1B6E2DA28(unsigned int *a1, _WORD *a2)
{
  unsigned int v2 = a1[7];
  unsigned int v3 = a1[8];
  if (v2 > 0x40000000)
  {
    unsigned int v10 = a1[7];
  }
  else
  {
    int v4 = a1[10];
    do
    {
      v3 *= 2;
      a1[10] = --v4;
      if (!v4)
      {
        uint64_t v5 = *((void *)a1 + 2);
        *((void *)a1 + 2) = v5 + 1;
        unint64_t v6 = *a1;
        if (v5 + 1 >= v6) {
          int v7 = 65280;
        }
        else {
          int v7 = *(unsigned __int8 *)(*((void *)a1 + 1) + v5 + 1) << 8;
        }
        unint64_t v8 = v5 + 2;
        *((void *)a1 + 2) = v8;
        if (v8 >= v6) {
          int v9 = 255;
        }
        else {
          int v9 = *(unsigned __int8 *)(*((void *)a1 + 1) + v8);
        }
        v3 |= v7 | v9;
        int v4 = 16;
        a1[10] = 16;
      }
      unsigned int v10 = 2 * v2;
      BOOL v11 = v2 >= 0x20000001;
      v2 *= 2;
    }
    while (!v11);
  }
  unsigned int v12 = (unsigned __int16)*a2;
  unsigned int v13 = (HIWORD(v10) * v12) & 0xFFFF0000;
  unsigned int v14 = v10 - v13;
  BOOL v15 = v3 >= v13;
  *a2 = *((_WORD *)a1 + ((v12 >> 7) & 0x1FE | v15) + 24) + v12;
  if (v3 < v13) {
    unsigned int v16 = v13;
  }
  else {
    unsigned int v16 = v14;
  }
  if (v3 < v13) {
    unsigned int v13 = 0;
  }
  a1[7] = v16;
  a1[8] = v3 - v13;
  return v15;
}

uint64_t sub_1B6E2DB18(unsigned int *a1, int a2, _WORD *a3)
{
  int v6 = 0;
  if (sub_1B6E2DA28(a1, a3))
  {
    int v7 = a2;
    do
    {
      a2 = v7 + 1;
      v6 |= 1 << v7;
      BOOL v8 = sub_1B6E2DA28(a1, a3);
      int v7 = a2;
    }
    while (v8);
  }
  int v9 = 0;
  if (a2)
  {
    int v10 = a2 - 1;
    do
    {
      __int16 v12 = 0x8000;
      v9 |= sub_1B6E2DA28(a1, &v12) << v10--;
    }
    while (v10 != -1);
  }
  return (v9 + v6);
}

uint64_t sub_1B6E2DBC8(uint64_t a1, int *a2, int a3, int a4, int a5, int **a6)
{
  uint64_t result = 2;
  if (a1 && a2 && a3 >= 1)
  {
    sub_1B6E2E040((uint64_t)a6, a3);
    if (a5 >= 1)
    {
      BOOL v11 = *a6;
      uint64_t v12 = a5;
      unsigned int v13 = a2;
      do
      {
        uint64_t v14 = *v13++;
        v11[v14 + 1] += 2;
        --v12;
      }
      while (v12);
    }
    sub_1B6E2E0EC(a6);
    if (a4 < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v27 = a1;
      uint64_t v17 = a4;
      while (1)
      {
        int v18 = *(_DWORD *)(a1 + 4 * v15);
        uint64_t v19 = (v18 - 1);
        if (v18 < 1) {
          break;
        }
        if (v18 == 1)
        {
          uint64_t v20 = v16;
        }
        else
        {
          uint64_t v20 = (v18 + v16);
          if ((int)v20 > a5) {
            return 2;
          }
          uint64_t v21 = (int)v16;
          uint64_t v22 = &a2[(int)v16 + 1];
          do
          {
            int v23 = *(v22 - 1);
            int v24 = *v22;
            if (v23 != *v22)
            {
              sub_1B6E2E12C((uint64_t *)a6, *(v22 - 1), *v22);
              sub_1B6E2E12C((uint64_t *)a6, v24, v23);
            }
            ++v22;
            --v19;
          }
          while (v19);
          int v25 = a2[v21];
          int v26 = a2[(int)v20 - 1];
          if (v25 != v26)
          {
            sub_1B6E2E12C((uint64_t *)a6, a2[v21], a2[(int)v20 - 1]);
            sub_1B6E2E12C((uint64_t *)a6, v26, v25);
          }
          a1 = v27;
        }
        ++v15;
        uint64_t v16 = v20;
        if (v15 == v17) {
          return 0;
        }
      }
      return 2;
    }
  }
  return result;
}

uint64_t sub_1B6E2DD5C(void *a1, void *a2)
{
  unint64_t v2 = a1[4] - a1[3];
  unint64_t v3 = v2 >> 2;
  if ((int)(v2 >> 2) < 1) {
    return 2;
  }
  long long v38 = 0u;
  memset(v37, 0, sizeof(v37));
  unint64_t v6 = (v2 >> 2);
  sub_1B642863C((uint64_t)a2, v6);
  __p = 0;
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  sub_1B6E2E18C((uint64_t)&__p, v6, 0);
  if (v35)
  {
    BOOL v39 = __p;
    int v40 = 0;
    sub_1B6E2E420(&v39, v35);
  }
  int v7 = 0;
  int v8 = 0;
  LODWORD(v39) = 0;
  while (1)
  {
    unint64_t v9 = (unint64_t)v8 >> 6;
    uint64_t v10 = *((void *)__p + v9);
    if ((v10 & (1 << v8)) != 0)
    {
      *((void *)__p + v9) = v10 & ~(1 << v8);
      *(_DWORD *)(*a2 + 4 * v7) = v8;
      sub_1B6E2E584(v37, &v39);
      uint64_t v11 = *((void *)&v38 + 1);
      ++v7;
      if (*((void *)&v38 + 1)) {
        break;
      }
    }
LABEL_20:
    int v8 = v39 + 1;
    LODWORD(v39) = v8;
    if (v8 >= (int)v3)
    {
      uint64_t v19 = 0;
      do
      {
        unint64_t v20 = *(int *)(*a2 + 4 * v19);
        uint64_t v21 = (char *)__p;
        *(void *)((char *)__p + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
        uint64_t v22 = *(int *)(*a1 + 4 * v20);
        uint64_t v23 = *(int *)(a1[3] + 4 * v20);
        uint64_t v24 = v23 + v22;
        uint64_t v25 = a1[6];
        if ((int)v23 >= 1)
        {
          uint64_t v26 = v22;
          do
          {
            if (((*(void *)&v21[((unint64_t)*(int *)(v25 + 4 * v26) >> 3) & 0x1FFFFFFFFFFFFFF8] >> *(_DWORD *)(v25 + 4 * v26)) & 1) == 0) {
              *(_DWORD *)(v25 + 4 * v26) = -1;
            }
            ++v26;
          }
          while (v26 < v24);
        }
        uint64_t v27 = (int *)(v25 + 4 * v22);
        uint64_t v28 = (int *)(v25 + 4 * v24);
        unint64_t v29 = 126 - 2 * __clz(v28 - v27);
        if (v23) {
          uint64_t v30 = v29;
        }
        else {
          uint64_t v30 = 0;
        }
        sub_1B6E2ED40(v27, v28, (uint64_t)&v39, v30, 1);
        ++v19;
      }
      while (v19 != v6);
      uint64_t v31 = 2 * (v7 != v3);
      goto LABEL_33;
    }
  }
  while (1)
  {
    uint64_t v12 = *(int *)(*(void *)(*((void *)&v37[0] + 1) + (((unint64_t)v38 >> 7) & 0x1FFFFFFFFFFFFF8))
                 + 4 * (v38 & 0x3FF));
    *(void *)&long long v38 = v38 + 1;
    *((void *)&v38 + 1) = v11 - 1;
    if ((unint64_t)v38 >= 0x800)
    {
      operator delete(**((void ***)&v37[0] + 1));
      *((void *)&v37[0] + 1) += 8;
      *(void *)&long long v38 = v38 - 1024;
    }
    uint64_t v13 = *(int *)(a1[3] + 4 * v12);
    if ((int)v13 >= 1) {
      break;
    }
LABEL_19:
    uint64_t v11 = *((void *)&v38 + 1);
    if (!*((void *)&v38 + 1)) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = *(int *)(*a1 + 4 * v12);
  uint64_t v15 = v13 + v14;
  while (1)
  {
    int v33 = 0;
    unint64_t v16 = *(unsigned int *)(a1[6] + 4 * v14);
    int v33 = v16;
    if ((v16 & 0x80000000) != 0) {
      break;
    }
    if ((int)v16 >= (int)v3 || v16 == v12) {
      break;
    }
    uint64_t v18 = *((void *)__p + (v16 >> 6));
    if ((v18 & (1 << v16)) != 0)
    {
      *((void *)__p + (v16 >> 6)) = v18 & ~(1 << v16);
      *(_DWORD *)(*a2 + 4 * v7) = v16;
      sub_1B6E2E584(v37, &v33);
      ++v7;
    }
    if (++v14 >= v15) {
      goto LABEL_19;
    }
  }
  uint64_t v31 = 2;
LABEL_33:
  if (__p) {
    operator delete(__p);
  }
  sub_1B6E2F924(v37);
  return v31;
}

void sub_1B6E2E040(uint64_t a1, int a2)
{
  sub_1B642863C(a1, a2 + 1);
  sub_1B642863C(a1 + 24, a2);
  uint64_t v4 = *(void *)(a1 + 8) - *(void *)a1;
  if (v4 >= 1) {
    bzero(*(void **)a1, 4 * (((unint64_t)v4 >> 2) - ((unint64_t)v4 > 3)) + 4);
  }
  uint64_t v5 = *(void **)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32) - (void)v5;
  if (v6 >= 1)
  {
    bzero(v5, 4 * (((unint64_t)v6 >> 2) - ((unint64_t)v6 > 3)) + 4);
  }
}

void sub_1B6E2E0EC(int **a1)
{
  unint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  unint64_t v3 = (char *)v1 - (char *)*a1;
  if ((int)(v3 >> 2) >= 2)
  {
    uint64_t v4 = (v3 >> 2);
    int v7 = *v2;
    uint64_t v5 = v2 + 1;
    int v6 = v7;
    uint64_t v8 = v4 - 1;
    do
    {
      v6 += *v5;
      *v5++ = v6;
      --v8;
    }
    while (v8);
  }
  sub_1B642863C((uint64_t)(a1 + 6), *(v1 - 1));
}

uint64_t *sub_1B6E2E12C(uint64_t *result, int a2, int a3)
{
  uint64_t v3 = result[3];
  int v4 = *(_DWORD *)(v3 + 4 * a2);
  uint64_t v5 = *result;
  if (v4 <= 0)
  {
    LODWORD(v5) = *(_DWORD *)(v5 + 4 * a2);
    uint64_t v6 = result[6];
LABEL_7:
    *(_DWORD *)(v3 + 4 * a2) = v4 + 1;
    *(_DWORD *)(v6 + 4 * ((int)v5 + v4)) = a3;
  }
  else
  {
    uint64_t v5 = *(int *)(v5 + 4 * a2);
    uint64_t v6 = result[6];
    uint64_t v7 = 4 * v5;
    uint64_t v8 = *(unsigned int *)(v3 + 4 * a2);
    while (*(_DWORD *)(v6 + v7) != a3)
    {
      v7 += 4;
      if (!--v8) {
        goto LABEL_7;
      }
    }
  }
  return result;
}

void sub_1B6E2E18C(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = a2 - v5;
  if (a2 <= v5)
  {
    *(void *)(a1 + 8) = a2;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 16);
    unint64_t v9 = v8 << 6;
    if (v8 << 6 < v6 || v5 > (v8 << 6) - v6)
    {
      uint64_t v21 = 0;
      long long v22 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0) {
        abort();
      }
      unint64_t v11 = v8 << 7;
      if (v11 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0)) {
        unint64_t v11 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      }
      if (v9 <= 0x3FFFFFFFFFFFFFFELL) {
        unint64_t v12 = v11;
      }
      else {
        unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      sub_1B656D5D0(&v21, v12);
      uint64_t v13 = *(unint64_t **)a1;
      unint64_t v14 = *(void *)(a1 + 8);
      *(void *)&long long v22 = v14 + v6;
      uint64_t v23 = v21;
      int v24 = 0;
      sub_1B6E2E2EC(v13, 0, (uint64_t)&v13[v14 >> 6], v14 & 0x3F, (uint64_t)&v23, (uint64_t)&v19);
      uint64_t v17 = v19;
      LODWORD(v18) = v20;
      uint64_t v15 = *(char **)a1;
      *(void *)a1 = v21;
      uint64_t v21 = v15;
      long long v16 = *(_OWORD *)(a1 + 8);
      *(_OWORD *)(a1 + 8) = v22;
      long long v22 = v16;
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      uint64_t v17 = (char *)(*(void *)a1 + 8 * (v5 >> 6));
      uint64_t v18 = *(void *)(a1 + 8) & 0x3FLL;
      *(void *)(a1 + 8) = a2;
    }
    if (a2 != v5)
    {
      if (a3)
      {
        uint64_t v21 = v17;
        LODWORD(v22) = v18;
        sub_1B6E2E420(&v21, v6);
      }
      else
      {
        uint64_t v21 = v17;
        LODWORD(v22) = v18;
        sub_1B6E2E4D4((uint64_t)&v21, v6);
      }
    }
  }
}

unint64_t *sub_1B6E2E2EC@<X0>(unint64_t *__src@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8 = a4 - (unint64_t)a2 + 8 * (a3 - (void)__src);
  if (v8 <= 0)
  {
    long long v16 = *(unint64_t **)a5;
  }
  else
  {
    unint64_t v9 = __src;
    __src = *(unint64_t **)a5;
    if (a2)
    {
      if (v8 >= (unint64_t)(64 - a2)) {
        int64_t v10 = 64 - a2;
      }
      else {
        int64_t v10 = v8;
      }
      v8 -= v10;
      uint64_t v11 = *v9++;
      *__src = *__src & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2)) | v11 & (0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2);
      unint64_t v12 = v10 + *(unsigned int *)(a5 + 8);
      __src = (unint64_t *)((char *)__src + ((v12 >> 3) & 0x3FFFFFF8));
      *(void *)a5 = __src;
      *(_DWORD *)(a5 + 8) = v12 & 0x3F;
    }
    if (v8 >= 0) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = v8 + 63;
    }
    uint64_t v14 = v13 >> 6;
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(__src, v9, 8 * v14);
      __src = *(unint64_t **)a5;
    }
    uint64_t v15 = v8 - (v14 << 6);
    long long v16 = &__src[v14];
    *(void *)a5 = v16;
    if (v15 >= 1)
    {
      unint64_t *v16 = *v16 & ~(0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8)) | v9[v14] & (0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8));
      *(_DWORD *)(a5 + 8) = v15;
    }
  }
  *(void *)a6 = v16;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return __src;
}

void *sub_1B6E2E420(void *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  int v4 = *((_DWORD *)result + 2);
  unint64_t v5 = (void *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    unint64_t v2 = a2 - v6;
    _OWORD *result = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    uint64_t result = memset(v5, 255, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int64_t v8 = &v5[v7];
    *uint64_t v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void sub_1B6E2E4D4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  unint64_t v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int64_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void sub_1B6E2E584(void *a1, _DWORD *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 7) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_1B6E2E60C(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(_DWORD *)(*(void *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
}

void sub_1B6E2E60C(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x400;
  unint64_t v4 = v2 - 1024;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_29:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v29 = 1;
      }
      else {
        unint64_t v29 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v30 = (char *)sub_1B64285D4(v5, v29);
      uint64_t v31 = &v30[8 * (v29 >> 2)];
      int v33 = &v30[8 * v32];
      int v34 = (uint64_t *)a1[1];
      unint64_t v8 = v31;
      uint64_t v35 = a1[2] - (void)v34;
      if (v35)
      {
        unint64_t v8 = &v31[v35 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v36 = 8 * (v35 >> 3);
        uint64_t v37 = &v30[8 * (v29 >> 2)];
        do
        {
          uint64_t v38 = *v34++;
          *(void *)uint64_t v37 = v38;
          v37 += 8;
          v36 -= 8;
        }
        while (v36);
      }
      goto LABEL_26;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      unint64_t v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_29;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_1B6E2E8D4(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_1B6E2E9EC((uint64_t)a1, &v54);
    int v40 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v41 = *v40;
    unint64_t v9 = (char *)(v40 + 1);
    uint64_t v10 = v41;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_29;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v30 = (char *)sub_1B64285D4((uint64_t)(a1 + 3), v46);
      uint64_t v31 = &v30[8 * (v46 >> 2)];
      int v33 = &v30[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      unint64_t v8 = v31;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v31[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        int v51 = &v30[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)int v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_26:
      BOOL v39 = (char *)*a1;
      *a1 = v30;
      a1[1] = v31;
      a1[2] = v8;
      a1[3] = v33;
      if (v39)
      {
        operator delete(v39);
        unint64_t v8 = (char *)a1[2];
      }
      goto LABEL_29;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  uint64_t v56 = a1 + 3;
  *(void *)&long long v54 = sub_1B64285D4((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  int v53 = operator new(0x1000uLL);
  sub_1B6E2EB0C(&v54, &v53);
  uint64_t v27 = (char *)a1[2];
  if (v27 == (char *)a1[1])
  {
    uint64_t v28 = (char *)a1[2];
  }
  else
  {
    do
    {
      v27 -= 8;
      sub_1B6E2EC24((uint64_t)&v54, v27);
    }
    while (v27 != (char *)a1[1]);
    uint64_t v28 = (char *)a1[2];
  }
  int v42 = (char *)*a1;
  long long v43 = v54;
  long long v44 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  uint64_t v45 = a1[3];
  *(_OWORD *)a1 = v43;
  *((_OWORD *)a1 + 1) = v44;
  *(void *)&long long v55 = v28;
  *((void *)&v55 + 1) = v45;
  if (v28 != v27) {
    *(void *)&long long v55 = &v28[(v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8];
  }
  if (v42) {
    operator delete(v42);
  }
}

void sub_1B6E2E8D4(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_1B64285D4(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_1B6E2E9EC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_1B64285D4(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_1B6E2EB0C(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_1B64285D4(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_1B6E2EC24(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_1B64285D4(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

int *sub_1B6E2ED40(int *result, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    uint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          int v22 = *(a2 - 1);
          int v23 = *v11;
          if (v22 > *v11)
          {
            *unint64_t v11 = v22;
            *(a2 - 1) = v23;
          }
          break;
        case 3uLL:
          int v24 = v11[1];
          int v25 = *(a2 - 1);
          if (v24 <= v25) {
            int v26 = *(a2 - 1);
          }
          else {
            int v26 = v11[1];
          }
          if (v24 >= v25) {
            int v24 = *(a2 - 1);
          }
          *(a2 - 1) = v24;
          v11[1] = v26;
          int v27 = *(a2 - 1);
          if (v27 <= *v11) {
            int v28 = *v11;
          }
          else {
            int v28 = *(a2 - 1);
          }
          if (v27 >= *v11) {
            int v27 = *v11;
          }
          *(a2 - 1) = v27;
          int v30 = *v11;
          int v29 = v11[1];
          if (v28 <= v29) {
            int v30 = v11[1];
          }
          if (v28 < v29) {
            int v29 = v28;
          }
          *unint64_t v11 = v30;
          v11[1] = v29;
          break;
        case 4uLL:
          int v32 = v11[1];
          int v31 = v11[2];
          if (*v11 <= v31) {
            int v33 = v11[2];
          }
          else {
            int v33 = *v11;
          }
          if (*v11 < v31) {
            int v31 = *v11;
          }
          v11[2] = v31;
          *unint64_t v11 = v33;
          int v34 = *(a2 - 1);
          if (v32 <= v34) {
            int v35 = *(a2 - 1);
          }
          else {
            int v35 = v32;
          }
          if (v32 < v34) {
            int v34 = v32;
          }
          *(a2 - 1) = v34;
          int v36 = *v11;
          if (*v11 <= v35) {
            int v37 = v35;
          }
          else {
            int v37 = *v11;
          }
          if (v36 >= v35) {
            int v36 = v35;
          }
          *unint64_t v11 = v37;
          v11[1] = v36;
          int v38 = v11[2];
          int v39 = *(a2 - 1);
          if (v38 <= v39) {
            int v40 = *(a2 - 1);
          }
          else {
            int v40 = v11[2];
          }
          if (v38 >= v39) {
            int v38 = *(a2 - 1);
          }
          *(a2 - 1) = v38;
          int v41 = v11[1];
          if (v41 <= v40) {
            int v42 = v40;
          }
          else {
            int v42 = v11[1];
          }
          if (v41 >= v40) {
            int v41 = v40;
          }
          v11[1] = v42;
          v11[2] = v41;
          break;
        case 5uLL:
          int v43 = *v11;
          int v44 = v11[1];
          if (*v11 <= v44) {
            int v45 = v11[1];
          }
          else {
            int v45 = *v11;
          }
          if (v43 >= v44) {
            int v43 = v11[1];
          }
          *unint64_t v11 = v45;
          v11[1] = v43;
          int v46 = v11[3];
          int v47 = *(a2 - 1);
          if (v46 <= v47) {
            int v48 = *(a2 - 1);
          }
          else {
            int v48 = v11[3];
          }
          if (v46 >= v47) {
            int v46 = *(a2 - 1);
          }
          *(a2 - 1) = v46;
          v11[3] = v48;
          int v49 = *(a2 - 1);
          int v50 = v11[2];
          if (v49 <= v50) {
            int v51 = v11[2];
          }
          else {
            int v51 = *(a2 - 1);
          }
          if (v49 >= v50) {
            int v49 = v11[2];
          }
          *(a2 - 1) = v49;
          int v53 = v11[2];
          int v52 = v11[3];
          int v54 = v11[1];
          if (v51 <= v52) {
            int v53 = v11[3];
          }
          if (v51 < v52) {
            int v52 = v51;
          }
          v11[2] = v53;
          v11[3] = v52;
          int v55 = *(a2 - 1);
          if (v54 <= v55) {
            int v56 = *(a2 - 1);
          }
          else {
            int v56 = v54;
          }
          if (v54 < v55) {
            int v55 = v54;
          }
          *(a2 - 1) = v55;
          int v57 = *v11;
          int v59 = v11[2];
          int v58 = v11[3];
          if (v58 <= *v11) {
            int v60 = *v11;
          }
          else {
            int v60 = v11[3];
          }
          if (v58 >= v57) {
            int v58 = *v11;
          }
          if (v60 <= v59) {
            int v57 = v11[2];
          }
          if (v60 < v59) {
            int v59 = v60;
          }
          if (v58 <= v56) {
            int v61 = v56;
          }
          else {
            int v61 = v58;
          }
          if (v58 >= v56) {
            int v58 = v56;
          }
          if (v61 <= v59) {
            int v56 = v59;
          }
          *unint64_t v11 = v57;
          v11[1] = v56;
          if (v61 >= v59) {
            int v62 = v59;
          }
          else {
            int v62 = v61;
          }
          v11[2] = v62;
          v11[3] = v58;
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 95) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return sub_1B6E2F680(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x201)
    {
      sub_1B6E2F1E4(v11, &v11[v15 >> 1], a2 - 1);
      sub_1B6E2F1E4(v11 + 1, v17 - 1, a2 - 2);
      sub_1B6E2F1E4(v11 + 2, &v11[v16 + 1], a2 - 3);
      sub_1B6E2F1E4(v17 - 1, v17, &v11[v16 + 1]);
      int v18 = *v11;
      *unint64_t v11 = *v17;
      int *v17 = v18;
      if (a5) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_1B6E2F1E4(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_14;
      }
    }
    if (*(v11 - 1) <= *v11)
    {
      uint64_t result = sub_1B6E2F26C(v11, a2);
      unint64_t v11 = result;
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v19 = sub_1B6E2F31C(v11, a2);
    if ((v20 & 1) == 0) {
      goto LABEL_17;
    }
    BOOL v21 = sub_1B6E2F3D0(v11, v19);
    unint64_t v11 = v19 + 1;
    uint64_t result = (int *)sub_1B6E2F3D0(v19 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v19;
      if (v21) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v21)
    {
LABEL_17:
      uint64_t result = (int *)sub_1B6E2ED40(v10, v19, a3, -v13, a5 & 1);
      unint64_t v11 = v19 + 1;
LABEL_19:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  char v63 = v11 + 1;
  BOOL v65 = v11 == a2 || v63 == a2;
  if (a5)
  {
    if (!v65)
    {
      uint64_t v66 = 0;
      uint64_t v67 = v11;
      do
      {
        int v69 = *v67;
        int v68 = v67[1];
        uint64_t v67 = v63;
        if (v68 > v69)
        {
          uint64_t v70 = v66;
          while (1)
          {
            *(int *)((char *)v11 + v70 + 4) = v69;
            if (!v70) {
              break;
            }
            int v69 = *(int *)((char *)v11 + v70 - 4);
            v70 -= 4;
            if (v68 <= v69)
            {
              uint64_t v71 = (int *)((char *)v11 + v70 + 4);
              goto LABEL_125;
            }
          }
          uint64_t v71 = v11;
LABEL_125:
          int *v71 = v68;
        }
        char v63 = v67 + 1;
        v66 += 4;
      }
      while (v67 + 1 != a2);
    }
  }
  else if (!v65)
  {
    do
    {
      int v73 = *v10;
      int v72 = v10[1];
      uint64_t v10 = v63;
      if (v72 > v73)
      {
        do
        {
          *char v63 = v73;
          int v73 = *(v63 - 2);
          --v63;
        }
        while (v72 > v73);
        *char v63 = v72;
      }
      char v63 = v10 + 1;
    }
    while (v10 + 1 != a2);
  }
  return result;
}

uint64_t sub_1B6E2F1E4(int *a1, int *a2, int *a3)
{
  int v3 = *a2;
  int v4 = *a1;
  int v5 = *a3;
  if (*a2 > *a1)
  {
    if (v5 > v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 <= v4) {
      return 1;
    }
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 > v3)
  {
    *a2 = v5;
    *a3 = v3;
    int v6 = *a1;
    if (*a2 <= *a1) {
      return 1;
    }
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

int *sub_1B6E2F26C(int *a1, int *a2)
{
  int v2 = *a1;
  if (*a1 <= *(a2 - 1))
  {
    int v5 = a1 + 1;
    do
    {
      int v3 = v5;
      if (v5 >= a2) {
        break;
      }
      ++v5;
    }
    while (v2 <= *v3);
  }
  else
  {
    int v3 = a1;
    do
    {
      int v4 = v3[1];
      ++v3;
    }
    while (v2 <= v4);
  }
  if (v3 < a2)
  {
    do
      int v6 = *--a2;
    while (v2 > v6);
  }
  if (v3 < a2)
  {
    int v7 = *v3;
    int v8 = *a2;
    do
    {
      *int v3 = v8;
      *a2 = v7;
      do
      {
        int v9 = v3[1];
        ++v3;
        int v7 = v9;
      }
      while (v2 <= v9);
      do
      {
        int v10 = *--a2;
        int v8 = v10;
      }
      while (v2 > v10);
    }
    while (v3 < a2);
  }
  if (v3 - 1 != a1) {
    *a1 = *(v3 - 1);
  }
  *(v3 - 1) = v2;
  return v3;
}

int *sub_1B6E2F31C(int *a1, int *a2)
{
  uint64_t v2 = 0;
  int v3 = *a1;
  do
    int v4 = a1[++v2];
  while (v4 > v3);
  int v5 = &a1[v2];
  int v6 = &a1[v2 - 1];
  if (v2 == 1)
  {
    do
    {
      if (v5 >= a2) {
        break;
      }
      int v8 = *--a2;
    }
    while (v8 <= v3);
  }
  else
  {
    do
      int v7 = *--a2;
    while (v7 <= v3);
  }
  if (v5 < a2)
  {
    int v9 = *a2;
    int v10 = &a1[v2];
    unint64_t v11 = a2;
    do
    {
      *int v10 = v9;
      *unint64_t v11 = v4;
      do
      {
        int v12 = v10[1];
        ++v10;
        int v4 = v12;
      }
      while (v12 > v3);
      do
      {
        int v13 = *--v11;
        int v9 = v13;
      }
      while (v13 <= v3);
    }
    while (v10 < v11);
    int v6 = v10 - 1;
  }
  if (v6 != a1) {
    *a1 = *v6;
  }
  *int v6 = v3;
  return v6;
}

BOOL sub_1B6E2F3D0(_DWORD *a1, int *a2)
{
  uint64_t v2 = 1;
  switch(a2 - a1)
  {
    case 0:
    case 1:
      return v2;
    case 2:
      int v3 = *(a2 - 1);
      int v4 = *a1;
      if (v3 > *a1)
      {
        *a1 = v3;
        *(a2 - 1) = v4;
      }
      return 1;
    case 3:
      int v20 = a1[1];
      int v21 = *(a2 - 1);
      if (v20 <= v21) {
        int v22 = *(a2 - 1);
      }
      else {
        int v22 = a1[1];
      }
      if (v20 >= v21) {
        int v20 = *(a2 - 1);
      }
      *(a2 - 1) = v20;
      a1[1] = v22;
      int v23 = *(a2 - 1);
      if (v23 <= *a1) {
        int v24 = *a1;
      }
      else {
        int v24 = *(a2 - 1);
      }
      if (v23 >= *a1) {
        int v23 = *a1;
      }
      *(a2 - 1) = v23;
      int v26 = *a1;
      int v25 = a1[1];
      if (v24 <= v25) {
        int v26 = a1[1];
      }
      if (v24 < v25) {
        int v25 = v24;
      }
      *a1 = v26;
      a1[1] = v25;
      return 1;
    case 4:
      int v48 = a1[1];
      int v47 = a1[2];
      if (*a1 <= v47) {
        int v49 = a1[2];
      }
      else {
        int v49 = *a1;
      }
      if (*a1 < v47) {
        int v47 = *a1;
      }
      a1[2] = v47;
      *a1 = v49;
      int v50 = *(a2 - 1);
      if (v48 <= v50) {
        int v51 = *(a2 - 1);
      }
      else {
        int v51 = v48;
      }
      if (v48 < v50) {
        int v50 = v48;
      }
      *(a2 - 1) = v50;
      int v52 = *a1;
      if (*a1 <= v51) {
        int v53 = v51;
      }
      else {
        int v53 = *a1;
      }
      if (v52 >= v51) {
        int v52 = v51;
      }
      *a1 = v53;
      a1[1] = v52;
      int v54 = a1[2];
      int v55 = *(a2 - 1);
      if (v54 <= v55) {
        int v56 = *(a2 - 1);
      }
      else {
        int v56 = a1[2];
      }
      if (v54 >= v55) {
        int v54 = *(a2 - 1);
      }
      *(a2 - 1) = v54;
      int v57 = a1[1];
      if (v57 <= v56) {
        int v58 = v56;
      }
      else {
        int v58 = a1[1];
      }
      if (v57 >= v56) {
        int v57 = v56;
      }
      a1[1] = v58;
      a1[2] = v57;
      return 1;
    case 5:
      int v27 = *a1;
      int v28 = a1[1];
      if (*a1 <= v28) {
        int v29 = a1[1];
      }
      else {
        int v29 = *a1;
      }
      if (v27 >= v28) {
        int v27 = a1[1];
      }
      *a1 = v29;
      a1[1] = v27;
      int v30 = a1[3];
      int v31 = *(a2 - 1);
      if (v30 <= v31) {
        int v32 = *(a2 - 1);
      }
      else {
        int v32 = a1[3];
      }
      if (v30 >= v31) {
        int v30 = *(a2 - 1);
      }
      *(a2 - 1) = v30;
      a1[3] = v32;
      int v33 = *(a2 - 1);
      int v34 = a1[2];
      if (v33 <= v34) {
        int v35 = a1[2];
      }
      else {
        int v35 = *(a2 - 1);
      }
      if (v33 >= v34) {
        int v33 = a1[2];
      }
      *(a2 - 1) = v33;
      int v37 = a1[2];
      int v36 = a1[3];
      int v38 = a1[1];
      if (v35 <= v36) {
        int v37 = a1[3];
      }
      if (v35 < v36) {
        int v36 = v35;
      }
      a1[2] = v37;
      a1[3] = v36;
      int v39 = *(a2 - 1);
      if (v38 <= v39) {
        int v40 = *(a2 - 1);
      }
      else {
        int v40 = v38;
      }
      if (v38 < v39) {
        int v39 = v38;
      }
      *(a2 - 1) = v39;
      int v41 = *a1;
      int v43 = a1[2];
      int v42 = a1[3];
      if (v42 <= *a1) {
        int v44 = *a1;
      }
      else {
        int v44 = a1[3];
      }
      if (v42 >= v41) {
        int v42 = *a1;
      }
      if (v44 <= v43) {
        int v41 = a1[2];
      }
      if (v44 < v43) {
        int v43 = v44;
      }
      if (v42 <= v40) {
        int v45 = v40;
      }
      else {
        int v45 = v42;
      }
      if (v42 >= v40) {
        int v42 = v40;
      }
      if (v45 <= v43) {
        int v40 = v43;
      }
      *a1 = v41;
      a1[1] = v40;
      if (v45 >= v43) {
        int v46 = v43;
      }
      else {
        int v46 = v45;
      }
      a1[2] = v46;
      a1[3] = v42;
      return 1;
    default:
      int v6 = a1 + 2;
      int v5 = a1[2];
      int v8 = *a1;
      int v7 = a1[1];
      if (v7 <= v5) {
        int v9 = a1[2];
      }
      else {
        int v9 = a1[1];
      }
      if (v7 < v5) {
        int v5 = a1[1];
      }
      if (v5 <= v8) {
        int v10 = *a1;
      }
      else {
        int v10 = v5;
      }
      if (v5 >= v8) {
        int v5 = *a1;
      }
      *int v6 = v5;
      if (v10 <= v9) {
        int v11 = v9;
      }
      else {
        int v11 = v8;
      }
      if (v10 >= v9) {
        int v10 = v9;
      }
      *a1 = v11;
      a1[1] = v10;
      int v12 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      int v13 = 0;
      uint64_t v14 = 12;
      break;
  }
  while (1)
  {
    int v15 = *v12;
    int v16 = *v6;
    if (*v12 > v16)
    {
      uint64_t v17 = v14;
      while (1)
      {
        *(_DWORD *)((char *)a1 + v17) = v16;
        uint64_t v18 = v17 - 4;
        if (v17 == 4) {
          break;
        }
        int v16 = *(_DWORD *)((char *)a1 + v17 - 8);
        v17 -= 4;
        if (v15 <= v16)
        {
          uint64_t v19 = (_DWORD *)((char *)a1 + v18);
          goto LABEL_27;
        }
      }
      uint64_t v19 = a1;
LABEL_27:
      _DWORD *v19 = v15;
      if (++v13 == 8) {
        return v12 + 1 == a2;
      }
    }
    int v6 = v12;
    v14 += 4;
    if (++v12 == a2) {
      return 1;
    }
  }
}

int *sub_1B6E2F680(int *a1, int *a2, int *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    int v6 = a2;
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 5)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      int v12 = &a1[v10];
      do
      {
        sub_1B6E2F860((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    int v13 = v6;
    if (v6 != a3)
    {
      uint64_t v14 = v6;
      do
      {
        int v15 = *v14;
        if (*v14 > *a1)
        {
          *uint64_t v14 = *a1;
          *a1 = v15;
          sub_1B6E2F860((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 5)
    {
      uint64_t v16 = (unint64_t)v8 >> 2;
      do
      {
        uint64_t v17 = 0;
        int v18 = *a1;
        uint64_t v19 = a1;
        do
        {
          int v20 = &v19[v17 + 1];
          uint64_t v21 = (2 * v17) | 1;
          uint64_t v17 = 2 * v17 + 2;
          if (v17 >= v16)
          {
            int v22 = *v20;
            uint64_t v17 = v21;
          }
          else
          {
            int v22 = *v20;
            int v23 = v20[1];
            if (*v20 >= v23) {
              int v22 = v20[1];
            }
            if (*v20 <= v23) {
              uint64_t v17 = v21;
            }
            else {
              ++v20;
            }
          }
          int *v19 = v22;
          uint64_t v19 = v20;
        }
        while (v17 <= (uint64_t)((unint64_t)(v16 - 2) >> 1));
        if (v20 == --v6)
        {
          *int v20 = v18;
        }
        else
        {
          *int v20 = *v6;
          *int v6 = v18;
          uint64_t v24 = (char *)v20 - (char *)a1 + 4;
          if (v24 >= 5)
          {
            unint64_t v25 = (((unint64_t)v24 >> 2) - 2) >> 1;
            int v26 = &a1[v25];
            int v27 = *v26;
            int v28 = *v20;
            if (*v26 > *v20)
            {
              do
              {
                *int v20 = v27;
                int v20 = v26;
                if (!v25) {
                  break;
                }
                unint64_t v25 = (v25 - 1) >> 1;
                int v26 = &a1[v25];
                int v27 = *v26;
              }
              while (*v26 > v28);
              *int v20 = v28;
            }
          }
        }
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_1B6E2F860(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 2)
    {
      uint64_t v6 = v4 >> 1;
      uint64_t v7 = (v4 >> 1) + 1;
      uint64_t v8 = (int *)(result + 4 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 >= a3)
      {
        int v10 = *v8;
      }
      else
      {
        int v10 = *v8;
        int v11 = v8[1];
        if (*v8 >= v11) {
          int v10 = v8[1];
        }
        if (*v8 > v11)
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      int v12 = *a4;
      if (v10 <= *a4)
      {
        do
        {
          *a4 = v10;
          a4 = v8;
          if (v5 < v7) {
            break;
          }
          uint64_t v13 = (2 * v7) | 1;
          uint64_t v8 = (int *)(result + 4 * v13);
          uint64_t v7 = 2 * v7 + 2;
          if (v7 >= a3)
          {
            int v10 = *v8;
            uint64_t v7 = v13;
          }
          else
          {
            int v10 = *v8;
            int v14 = v8[1];
            if (*v8 >= v14) {
              int v10 = v8[1];
            }
            if (*v8 <= v14) {
              uint64_t v7 = v13;
            }
            else {
              ++v8;
            }
          }
        }
        while (v10 <= v12);
        *a4 = v12;
      }
    }
  }
  return result;
}

uint64_t sub_1B6E2F924(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  int v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      int v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 512;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 1024;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }

  return sub_1B6E2F9CC((uint64_t)a1);
}

uint64_t sub_1B6E2F9CC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

void sub_1B6E2FA1C(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      memset_pattern16(*(void **)(v4 - 8), &unk_1B6ED0B70, 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    uint64_t v10 = a2 + (v9 >> 1);
    if (v10 < 0) {
      abort();
    }
    uint64_t v11 = v9 >> 1;
    unint64_t v12 = v5 - v8;
    if (v12 > v10) {
      uint64_t v10 = v12;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v10;
    }
    if (v13)
    {
      int v14 = (char *)sub_1B645A9E0(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      int v14 = 0;
    }
    int v15 = &v14[2 * v11];
    uint64_t v16 = &v14[2 * v13];
    memset_pattern16(v15, &unk_1B6ED0B70, 2 * a2);
    uint64_t v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      __int16 v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

uint64_t sub_1B6E2FB38(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8, uint64_t a9, uint64_t a10, unint64_t a11, uint64_t *a12, _DWORD *a13)
{
  uint64_t v13 = 2;
  if (a5 && a6 && a9)
  {
    int v14 = a5;
    if (4 * a5 * a6 * a9 + 1024 >= a11 && HIDWORD(a11) == 0)
    {
      uint64_t v23 = 0;
      memset(v22, 0, sizeof(v22));
      __p = 0;
      int v20 = 0;
      uint64_t v21 = 0;
      uint64_t v13 = sub_1B6E2DBC8(a2, a3, a6, a7, a8, (int **)v22);
      if (!v13)
      {
        uint64_t v13 = sub_1B6E2DD5C(v22, &__p);
        if (!v13) {
          uint64_t v13 = sub_1B6E2FC58(a1, a4, v22, &__p, v14, a9, a10, a11, a12, a13);
        }
      }
      if (__p)
      {
        int v20 = __p;
        operator delete(__p);
      }
      sub_1B640A148((uint64_t)v22);
    }
    else
    {
      return 1;
    }
  }
  return v13;
}

uint64_t sub_1B6E2FC58(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, int a6, uint64_t a7, unint64_t a8, uint64_t *a9, _DWORD *a10)
{
  v15[0] = a7;
  v15[1] = a8;
  *(_DWORD *)a7 = 179426549;
  *(_DWORD *)(a7 + 8) = 1;
  *(_DWORD *)(a7 + 16) = a6;
  *(unsigned char *)(a7 + 20) = *a10;
  *(unsigned char *)(a7 + 21) = a10[1];
  *(_WORD *)(a7 + 22) = 0;
  uint64_t v16 = 24;
  uint64_t result = sub_1B6E2FD08(a1, a2, a3, a4, a5, a6, (uint64_t)v15);
  if (!result)
  {
    unint64_t v12 = v16;
    *a9 = v16;
    if (v12 <= a8)
    {
      uint64_t v13 = v15[0];
      *(_DWORD *)(v15[0] + 12) = v12;
      int v14 = sub_1B6E306C0(v13 + 8, *a9 - 8);
      uint64_t result = 0;
      *(_DWORD *)(v13 + 4) = v14;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_1B6E2FD08(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v12 = *(void *)(a7 + 16);
  int v13 = *(_DWORD *)(a7 + 8) - v12;
  uint64_t v14 = *(void *)a7 + v12;
  int v85 = v13;
  uint64_t v86 = v14;
  sub_1B6E305D4((uint64_t)&v85);
  unint64_t v15 = a3[4] - a3[3];
  if ((int)(v15 >> 2) < 1) {
    return 2;
  }
  __int16 v84 = 0x8000;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v78 = 0;
  int v79 = 0;
  uint64_t v80 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  int v72 = 0;
  int v73 = 0;
  uint64_t v74 = 0;
  sub_1B6E2D9F8((uint64_t)&v81, a5);
  sub_1B6E2D9F8((uint64_t)&v78, a5);
  sub_1B6E2D9F8((uint64_t)&v75, a5);
  sub_1B6E2D9F8((uint64_t)&v72, 31 * a5);
  int v69 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  __p = 0;
  int v64 = 0;
  uint64_t v65 = 0;
  sub_1B642863C((uint64_t)&v69, a5);
  sub_1B642863C((uint64_t)&v66, a5);
  sub_1B642863C((uint64_t)&__p, a5);
  if (a6 < 1)
  {
LABEL_40:
    uint64_t v54 = 0;
    *(void *)(v7 + 16) += sub_1B6E3045C((uint64_t)&v85);
    goto LABEL_42;
  }
  uint64_t v59 = (v15 >> 2);
  int v60 = a3;
  uint64_t v16 = a5;
  uint64_t v56 = 4 * (int)((v15 >> 2) * a5);
  uint64_t v58 = 0;
  uint64_t v57 = v7;
  unint64_t v61 = v15 >> 2;
LABEL_4:
  uint64_t v17 = 0;
  char v18 = 1;
  while (1)
  {
    char v19 = v18;
    uint64_t v20 = *(int *)(*a4 + 4 * v17);
    if (a5 >= 1)
    {
      uint64_t v21 = v69;
      int v22 = v66;
      uint64_t v23 = (int *)(a2 + 4 * (int)v20 * a5);
      uint64_t v24 = v16;
      do
      {
        int v25 = *v23++;
        *v21++ = v25;
        *v22++ = 0;
        --v24;
      }
      while (v24);
    }
    uint64_t v26 = *(int *)(a3[3] + 4 * v20);
    if ((int)v26 >= 1) {
      break;
    }
LABEL_20:
    if (a5 < 1)
    {
LABEL_24:
      char v18 = 1;
    }
    else
    {
      int v38 = (int *)v69;
      int v39 = (int *)v66;
      char v18 = 1;
      uint64_t v40 = v16;
      int v41 = __p;
      do
      {
        int v43 = *v38++;
        int v42 = v43;
        int v44 = *v39++;
        int v45 = v42 - v44;
        *v41++ = v45;
        v18 &= v45 == 0;
        --v40;
      }
      while (v40);
    }
    sub_1B6E3024C((uint64_t)&v85, (v19 ^ v18) & 1, &v84);
    if ((v18 & 1) == 0 && a5 >= 1)
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      do
      {
        unsigned int v49 = *(_DWORD *)((char *)__p + v47);
        int v50 = (char *)v75 + v46;
        if (v49)
        {
          sub_1B6E3024C((uint64_t)&v85, 1, v50);
          int v51 = (char *)v81 + v46;
          if ((v49 & 0x80000000) != 0)
          {
            sub_1B6E3024C((uint64_t)&v85, 0, v51);
            unsigned int v49 = -v49;
          }
          else
          {
            sub_1B6E3024C((uint64_t)&v85, 1, v51);
          }
          if (v49 > 0x1F)
          {
            sub_1B6E3024C((uint64_t)&v85, 1, (_WORD *)v72 + v48);
            sub_1B6E3024C((uint64_t)&v85, 1, (_WORD *)v72 + (v48 + 2));
            sub_1B6E3024C((uint64_t)&v85, 1, (_WORD *)v72 + (v48 + 6));
            sub_1B6E3024C((uint64_t)&v85, 1, (_WORD *)v72 + (v48 + 14));
            sub_1B6E3024C((uint64_t)&v85, 1, (_WORD *)v72 + (v48 + 30));
            sub_1B6E303A4((uint64_t)&v85, v49 - 32, 6, (char *)v78 + v46);
            goto LABEL_37;
          }
          unsigned int v53 = v49 - 1;
          sub_1B6E3024C((uint64_t)&v85, (v49 - 1) & 1, (_WORD *)v72 + v48);
          sub_1B6E3024C((uint64_t)&v85, ((v49 - 1) >> 1) & 1, (_WORD *)v72 + v48 + (((_BYTE)v49 + 1) & 1) + 1);
          sub_1B6E3024C((uint64_t)&v85, (v53 >> 2) & 1, (_WORD *)v72 + v48 + (v53 & 3) + 3);
          sub_1B6E3024C((uint64_t)&v85, (v53 >> 3) & 1, (_WORD *)v72 + v48 + (v53 & 7) + 7);
          unsigned int v52 = (v49 - 1) >> 4;
          int v50 = (char *)v72 + 2 * v48 + 2 * ((v49 - 1) & 0xF) + 30;
        }
        else
        {
          unsigned int v52 = 0;
        }
        sub_1B6E3024C((uint64_t)&v85, v52, v50);
LABEL_37:
        v48 += 31;
        v46 += 2;
        v47 += 4;
      }
      while (31 * a5 != v48);
    }
    ++v17;
    a3 = v60;
    uint64_t v16 = a5;
    if (v17 == v59)
    {
      uint64_t v7 = v57;
      a2 += v56;
      if (++v58 == a6) {
        goto LABEL_40;
      }
      goto LABEL_4;
    }
  }
  unsigned int v27 = 0;
  uint64_t v28 = *(int *)(*a3 + 4 * v20);
  uint64_t v29 = v26 + v28;
  uint64_t v30 = a3[6];
  int v31 = v66;
  while (1)
  {
    int v32 = *(_DWORD *)(v30 + 4 * v28);
    if (v32 < 0)
    {
LABEL_16:
      if (v27 < 2) {
        goto LABEL_20;
      }
      if (a5 >= 1)
      {
        int v36 = v66;
        uint64_t v37 = v16;
        do
        {
          _DWORD *v36 = (int)(*v36 + (v27 >> 1)) / (int)v27;
          ++v36;
          --v37;
        }
        while (v37);
        goto LABEL_20;
      }
      goto LABEL_24;
    }
    if (v32 >= (int)v61) {
      break;
    }
    if (a5 >= 1)
    {
      uint64_t v33 = 4 * v32 * a5;
      uint64_t v34 = v16;
      int v35 = v31;
      do
      {
        *v35++ += *(_DWORD *)(a2 + v33);
        v33 += 4;
        --v34;
      }
      while (v34);
    }
    ++v27;
    if (++v28 >= v29) {
      goto LABEL_16;
    }
  }
  uint64_t v54 = 2;
LABEL_42:
  if (__p)
  {
    int v64 = __p;
    operator delete(__p);
  }
  if (v66)
  {
    uint64_t v67 = v66;
    operator delete(v66);
  }
  if (v69)
  {
    uint64_t v70 = v69;
    operator delete(v69);
  }
  if (v72)
  {
    int v73 = v72;
    operator delete(v72);
  }
  if (v75)
  {
    uint64_t v76 = v75;
    operator delete(v75);
  }
  if (v78)
  {
    int v79 = v78;
    operator delete(v78);
  }
  if (v81)
  {
    uint64_t v82 = v81;
    operator delete(v81);
  }
  return v54;
}

uint64_t sub_1B6E3024C(uint64_t result, int a2, _WORD *a3)
{
  unsigned int v3 = (unsigned __int16)*a3;
  int v4 = *(_DWORD *)(result + 28);
  unsigned int v5 = (v4 * v3) >> 16;
  if (a2)
  {
    *(_DWORD *)(result + 24) += v5;
    unsigned int v5 = v4 - v5;
    __int16 v6 = v3 - *(_WORD *)(result + 2 * (v3 >> 8) + 48);
  }
  else
  {
    __int16 v6 = *(_WORD *)(result + 2 * ((unsigned __int16)~(_WORD)v3 >> 8) + 48) + v3;
  }
  *(_DWORD *)(result + 28) = v5;
  *a3 = v6;
  if (v5 <= 0x4000)
  {
    unsigned int v7 = *(_DWORD *)(result + 24);
    int v8 = *(_DWORD *)(result + 40);
    while (1)
    {
      v7 *= 2;
      v5 *= 2;
      *(_DWORD *)(result + 24) = v7;
      *(_DWORD *)(result + 28) = v5;
      *(_DWORD *)(result + 40) = ++v8;
      if (v8 == 8) {
        break;
      }
LABEL_17:
      if (v5 > 0x4000) {
        return result;
      }
    }
    if (HIBYTE(v7))
    {
      uint64_t v10 = *(void *)(result + 16) + *(void *)(result + 8);
      ++*(unsigned char *)(v10 - 1);
      uint64_t v11 = *(void *)(result + 16);
      if (*(_DWORD *)(result + 44))
      {
        do
        {
          *(unsigned char *)(*(void *)(result + 8) + v11) = 0;
          int v12 = *(_DWORD *)(result + 44);
          uint64_t v11 = *(void *)(result + 16) + 1;
          *(void *)(result + 16) = v11;
          *(_DWORD *)(result + 44) = --v12;
        }
        while (v12);
      }
    }
    else
    {
      int v9 = *(_DWORD *)(result + 44);
      if ((v7 + v5) >> 24)
      {
        *(_DWORD *)(result + 44) = v9 + 1;
LABEL_16:
        int v8 = 0;
        unsigned int v7 = (unsigned __int16)v7;
        *(_DWORD *)(result + 24) = (unsigned __int16)v7;
        *(_DWORD *)(result + 40) = 0;
        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(result + 16);
      if (v9)
      {
        do
        {
          *(unsigned char *)(*(void *)(result + 8) + v11) = -1;
          int v13 = *(_DWORD *)(result + 44);
          uint64_t v11 = *(void *)(result + 16) + 1;
          *(void *)(result + 16) = v11;
          *(_DWORD *)(result + 44) = --v13;
        }
        while (v13);
      }
    }
    *(unsigned char *)(*(void *)(result + 8) + v11) = *(_WORD *)(result + 26);
    ++*(void *)(result + 16);
    LOWORD(v7) = *(_WORD *)(result + 24);
    unsigned int v5 = *(_DWORD *)(result + 28);
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_1B6E303A4(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  int v5 = a3;
  unsigned int v6 = a2;
  for (int i = 1 << a3; v6 >= 1 << v5; int i = 1 << v5)
  {
    sub_1B6E3024C(a1, 1, a4);
    ++v5;
    v6 -= i;
  }
  uint64_t result = sub_1B6E3024C(a1, 0, a4);
  if (v5)
  {
    int v10 = v5 - 1;
    do
    {
      __int16 v11 = 0x8000;
      uint64_t result = sub_1B6E3024C(a1, (v6 >> v10--) & 1, &v11);
    }
    while (v10 != -1);
  }
  return result;
}

uint64_t sub_1B6E3045C(uint64_t a1)
{
  int v1 = 0;
  int v2 = *(_DWORD *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 24);
  do
  {
    if ((v3 | ((2 << v1) - 1)) > *(_DWORD *)(a1 + 28) - 1) {
      break;
    }
    ++v1;
  }
  while (v1 != 16);
  unsigned int v4 = v3 | ~(-1 << v1);
  *(_DWORD *)(a1 + 24) = v4;
  if (v2 <= 7)
  {
    int v5 = v2 - 8;
    do
      unsigned int v4 = (2 * v4) | 1;
    while (!__CFADD__(v5++, 1));
    *(_DWORD *)(a1 + 24) = v4;
    *(_DWORD *)(a1 + 40) = 8;
  }
  if (HIBYTE(v4))
  {
    uint64_t v7 = *(void *)(a1 + 16) + *(void *)(a1 + 8);
    ++*(unsigned char *)(v7 - 1);
    if (*(_DWORD *)(a1 + 44))
    {
      uint64_t v8 = *(void *)(a1 + 16);
      do
      {
        *(unsigned char *)(*(void *)(a1 + 8) + v8) = 0;
        int v9 = *(_DWORD *)(a1 + 44);
        uint64_t v8 = *(void *)(a1 + 16) + 1;
        *(void *)(a1 + 16) = v8;
        *(_DWORD *)(a1 + 44) = --v9;
      }
      while (v9);
    }
  }
  else if (*(_DWORD *)(a1 + 44))
  {
    uint64_t v10 = *(void *)(a1 + 16);
    do
    {
      *(unsigned char *)(*(void *)(a1 + 8) + v10) = -1;
      int v11 = *(_DWORD *)(a1 + 44);
      uint64_t v10 = *(void *)(a1 + 16) + 1;
      *(void *)(a1 + 16) = v10;
      *(_DWORD *)(a1 + 44) = --v11;
    }
    while (v11);
  }
  *(unsigned char *)(*(void *)(a1 + 8) + *(void *)(a1 + 16)) = *(_WORD *)(a1 + 26);
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16) + 1;
  *(void *)(a1 + 16) = v13;
  *(unsigned char *)(v12 + v13) = BYTE1(*(_DWORD *)(a1 + 24));
  unint64_t v14 = *(void *)(a1 + 16) + 1;
  *(void *)(a1 + 16) = v14;
  if (v2 >= 1)
  {
    *(unsigned char *)(*(void *)(a1 + 8) + v14) = *(_DWORD *)(a1 + 24);
    unint64_t v14 = *(void *)(a1 + 16) + 1;
    *(void *)(a1 + 16) = v14;
  }
  if (v14 >= 2)
  {
    uint64_t v15 = *(void *)(a1 + 8) - 1;
    while (*(unsigned __int8 *)(v15 + v14) == 255)
    {
      *(void *)(a1 + 16) = --v14;
      if (v14 <= 1) {
        return 1;
      }
    }
  }
  return v14;
}

uint64_t sub_1B6E305D4(uint64_t result)
{
  uint64_t v1 = 0;
  *(void *)&long long v2 = 0xFFFF00000000;
  *((void *)&v2 + 1) = 0xFFFF00000000;
  *(_OWORD *)(result + 24) = v2;
  *(void *)(result + 16) = 0;
  *(void *)(result + 40) = 0;
  uint64_t v3 = 0x217u;
  do
  {
    *(_WORD *)(result + v1 * 2 + 48) = word_1B6ED0B88[v1];
    *(_WORD *)(result + v3 * 2) = word_1B6ED0B88[v3 - 280];
    --v3;
    ++v1;
  }
  while (v1 != 256);
  return result;
}

void *sub_1B6E30624(uint64_t a1)
{
  *(void *)&long long v1 = 0xFFFF000000000000;
  *((void *)&v1 + 1) = 0xFFFF000000000000;
  *(_OWORD *)(a1 + 24) = v1;
  *(void *)(a1 + 40) = 16;
  unsigned int v2 = *(_DWORD *)a1;
  if (*(int *)a1 < 1)
  {
    int v4 = -16777216;
    goto LABEL_7;
  }
  uint64_t v3 = *(unsigned __int8 **)(a1 + 8);
  int v4 = *v3 << 24;
  *(_DWORD *)(a1 + 32) = v4;
  if (v2 == 1)
  {
LABEL_7:
    int v5 = v4 | 0xFF0000;
    goto LABEL_8;
  }
  int v5 = v4 | (v3[1] << 16);
  *(_DWORD *)(a1 + 32) = v5;
  if (v2 <= 2)
  {
LABEL_8:
    int v6 = v5 | 0xFF00;
    goto LABEL_9;
  }
  int v6 = v5 | (v3[2] << 8);
  *(_DWORD *)(a1 + 32) = v6;
  if (v2 == 3)
  {
LABEL_9:
    int v7 = 255;
    goto LABEL_10;
  }
  int v7 = v3[3];
LABEL_10:
  *(_DWORD *)(a1 + 32) = v7 | v6;
  *(void *)(a1 + 16) = 3;
  return memcpy((void *)(a1 + 48), &unk_1B6ED0D88, 0x400uLL);
}

uint64_t sub_1B6E306C0(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = (unsigned __int8 *)result;
  LODWORD(result) = -1;
  do
  {
    int v3 = *v2++;
    uint64_t result = (dword_1B6ED1188[v3 ^ BYTE3(result)] ^ (result << 8));
    --a2;
  }
  while (a2);
  return result;
}

void sub_1B6E306F8(uint64_t a1, uint64_t a2, void **a3)
{
  do
  {
    int v7 = *(void **)(a1 - 8);
    a1 -= 8;
    int v6 = v7;
    if (v7) {
  }
    }
  while (a1 != a2);
  uint64_t v8 = *a3;
  if (*a3)
  {
  }
}

void sub_1B6E30764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    int v7 = *(void **)(a1 - 8);
    a1 -= 8;
    int v6 = v7;
    if (v7) {
  }
    }
  while (a1 != a2);
  uint64_t v8 = *(void **)(a3 + 560);
  if (v8)
  {
  }
}

void sub_1B6E307D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1B6E30800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    int v7 = *(void **)(a1 - 8);
    a1 -= 8;
    int v6 = v7;
    if (v7) {
  }
    }
  while (a1 != a2);
  uint64_t v8 = *(void **)(a3 + 480);
  if (v8)
  {
  }
}

void sub_1B6E3086C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    int v7 = *(void **)(a1 - 8);
    a1 -= 8;
    int v6 = v7;
    if (v7) {
  }
    }
  while (a1 != a2);
  uint64_t v8 = *(void **)(a3 + 688);
  if (v8)
  {
  }
}

void sub_1B6E308D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1B63F2F54(16, @"Unreachable code: Internal consistency error", a3, a4, a5, a6, a7, a8, vars0);
  __break(1u);
}

uint64_t sub_1B6E30938()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1B6E30948()
{
  return MEMORY[0x1F40E3040]();
}

uint64_t sub_1B6E30958()
{
  return MEMORY[0x1F40E3048]();
}

uint64_t sub_1B6E30968()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1B6E30978()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1B6E30988()
{
  return MEMORY[0x1F40E3080]();
}

uint64_t sub_1B6E30998()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1B6E309A8()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1B6E309B8()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1B6E309C8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1B6E309D8()
{
  return MEMORY[0x1F40E3130]();
}

uint64_t sub_1B6E309E8()
{
  return MEMORY[0x1F40E3138]();
}

uint64_t sub_1B6E309F8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1B6E30A08()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1B6E30A18()
{
  return MEMORY[0x1F40E3290]();
}

uint64_t sub_1B6E30A28()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1B6E30A38()
{
  return MEMORY[0x1F40E32D8]();
}

uint64_t sub_1B6E30A48()
{
  return MEMORY[0x1F40E3358]();
}

uint64_t sub_1B6E30A58()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1B6E30A68()
{
  return MEMORY[0x1F40E3380]();
}

uint64_t sub_1B6E30A78()
{
  return MEMORY[0x1F40E33A0]();
}

uint64_t sub_1B6E30A88()
{
  return MEMORY[0x1F40E33E8]();
}

uint64_t sub_1B6E30A98()
{
  return MEMORY[0x1F40E3408]();
}

uint64_t sub_1B6E30AA8()
{
  return MEMORY[0x1F40E3418]();
}

uint64_t sub_1B6E30AB8()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1B6E30AC8()
{
  return MEMORY[0x1F40E3460]();
}

uint64_t sub_1B6E30AD8()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1B6E30AE8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1B6E30AF8()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1B6E30B08()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1B6E30B18()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1B6E30B28()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1B6E30B38()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1B6E30B48()
{
  return MEMORY[0x1F40E3748]();
}

uint64_t sub_1B6E30B58()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1B6E30B68()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1B6E30B78()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1B6E30B88()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1B6E30B98()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1B6E30BA8()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1B6E30BB8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1B6E30BC8()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1B6E30BD8()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1B6E30BE8()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1B6E30BF8()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1B6E30C08()
{
  return MEMORY[0x1F40E3AB0]();
}

uint64_t sub_1B6E30C18()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1B6E30C28()
{
  return MEMORY[0x1F40E3FC8]();
}

uint64_t sub_1B6E30C38()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1B6E30C48()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1B6E30C58()
{
  return MEMORY[0x1F40E41E8]();
}

uint64_t sub_1B6E30C68()
{
  return MEMORY[0x1F40E41F0]();
}

uint64_t sub_1B6E30C78()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1B6E30C88()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1B6E30C98()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1B6E30CA8()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1B6E30CB8()
{
  return MEMORY[0x1F40E4248]();
}

uint64_t sub_1B6E30CC8()
{
  return MEMORY[0x1F40E4250]();
}

uint64_t sub_1B6E30CD8()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1B6E30CE8()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1B6E30D38()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1B6E30D68()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B6E30D78()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B6E30D88()
{
  return MEMORY[0x1F40E46B8]();
}

uint64_t sub_1B6E30D98()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1B6E30DA8()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1B6E30DB8()
{
  return MEMORY[0x1F40E48A0]();
}

uint64_t sub_1B6E30DC8()
{
  return MEMORY[0x1F40E48B0]();
}

uint64_t sub_1B6E30DD8()
{
  return MEMORY[0x1F40E48B8]();
}

uint64_t sub_1B6E30DE8()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1B6E30DF8()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1B6E30E08()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1B6E30E18()
{
  return MEMORY[0x1F40E4910]();
}

uint64_t sub_1B6E30E28()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1B6E30E38()
{
  return MEMORY[0x1F40E4920]();
}

uint64_t sub_1B6E30E48()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1B6E30E58()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1B6E30E68()
{
  return MEMORY[0x1F40E4990]();
}

uint64_t sub_1B6E30E78()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B6E30E88()
{
  return MEMORY[0x1F40E49C0]();
}

uint64_t sub_1B6E30E98()
{
  return MEMORY[0x1F40E49D0]();
}

uint64_t sub_1B6E30EA8()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1B6E30EB8()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1B6E30EC8()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1B6E30ED8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1B6E30EE8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B6E30EF8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1B6E30F08()
{
  return MEMORY[0x1F40E4AD8]();
}

uint64_t sub_1B6E30F18()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B6E30F28()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1B6E30F38()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1B6E30F48()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B6E30F58()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1B6E30F68()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1B6E30F78()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1B6E30F88()
{
  return MEMORY[0x1F40E4C58]();
}

uint64_t sub_1B6E30F98()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1B6E30FA8()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1B6E30FB8()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1B6E30FC8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B6E30FD8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B6E30FE8()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1B6E30FF8()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1B6E31008()
{
  return MEMORY[0x1F40E4E48]();
}

uint64_t sub_1B6E31018()
{
  return MEMORY[0x1F40E4E50]();
}

uint64_t sub_1B6E31028()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1B6E31038()
{
  return MEMORY[0x1F40E4E70]();
}

uint64_t sub_1B6E31048()
{
  return MEMORY[0x1F40E4E98]();
}

uint64_t sub_1B6E31058()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B6E31068()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1B6E31078()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1B6E31088()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1B6E31098()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B6E310A8()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1B6E310B8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1B6E310C8()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1B6E310D8()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1B6E310E8()
{
  return MEMORY[0x1F40E5428]();
}

uint64_t sub_1B6E310F8()
{
  return MEMORY[0x1F40E5430]();
}

uint64_t sub_1B6E31108()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B6E31118()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B6E31128()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1B6E31138()
{
  return MEMORY[0x1F4187498]();
}

uint64_t sub_1B6E31148()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1B6E31158()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1B6E31168()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1B6E31178()
{
  return MEMORY[0x1F41882F8]();
}

uint64_t sub_1B6E31188()
{
  return MEMORY[0x1F4188300]();
}

uint64_t sub_1B6E31198()
{
  return MEMORY[0x1F4188308]();
}

uint64_t sub_1B6E311A8()
{
  return MEMORY[0x1F4188310]();
}

uint64_t sub_1B6E311B8()
{
  return MEMORY[0x1F4188358]();
}

uint64_t sub_1B6E311C8()
{
  return MEMORY[0x1F4188360]();
}

uint64_t sub_1B6E311D8()
{
  return MEMORY[0x1F4188368]();
}

uint64_t sub_1B6E311E8()
{
  return MEMORY[0x1F4188380]();
}

uint64_t sub_1B6E311F8()
{
  return MEMORY[0x1F4188388]();
}

uint64_t sub_1B6E31208()
{
  return MEMORY[0x1F41883A8]();
}

uint64_t sub_1B6E31218()
{
  return MEMORY[0x1F41883B0]();
}

uint64_t sub_1B6E31228()
{
  return MEMORY[0x1F41883B8]();
}

uint64_t sub_1B6E31238()
{
  return MEMORY[0x1F41883C8]();
}

uint64_t sub_1B6E31248()
{
  return MEMORY[0x1F41883D8]();
}

uint64_t sub_1B6E31258()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1B6E31268()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1B6E31278()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1B6E31288()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1B6E31298()
{
  return MEMORY[0x1F4188588]();
}

uint64_t sub_1B6E312A8()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1B6E312B8()
{
  return MEMORY[0x1F41885C0]();
}

uint64_t sub_1B6E312C8()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1B6E312D8()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1B6E312E8()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1B6E312F8()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1B6E31308()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1B6E31318()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1B6E31328()
{
  return MEMORY[0x1F41884D0]();
}

uint64_t sub_1B6E31338()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1B6E31348()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1B6E31358()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1B6E31368()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1B6E31378()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1B6E31388()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1B6E31398()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1B6E313A8()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1B6E313B8()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1B6E313C8()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1B6E313D8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B6E313E8()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1B6E313F8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B6E31408()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1B6E31418()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B6E31428()
{
  return MEMORY[0x1F4186D98]();
}

uint64_t sub_1B6E31438()
{
  return MEMORY[0x1F4186DA8]();
}

uint64_t sub_1B6E31448()
{
  return MEMORY[0x1F4186DF0]();
}

uint64_t sub_1B6E31458()
{
  return MEMORY[0x1F4186E00]();
}

uint64_t sub_1B6E31468()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1B6E31478()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1B6E31488()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1B6E31498()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1B6E314A8()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1B6E314B8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B6E314C8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B6E314D8()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1B6E314E8()
{
  return MEMORY[0x1F4183338]();
}

uint64_t sub_1B6E314F8()
{
  return MEMORY[0x1F4183340]();
}

uint64_t sub_1B6E31508()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1B6E31518()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1B6E31528()
{
  return MEMORY[0x1F41833D0]();
}

uint64_t sub_1B6E31538()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1B6E31548()
{
  return MEMORY[0x1F4183498]();
}

uint64_t sub_1B6E31558()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1B6E31568()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1B6E31578()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1B6E31588()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1B6E31598()
{
  return MEMORY[0x1F4183510]();
}

uint64_t sub_1B6E315A8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B6E315B8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B6E315C8()
{
  return MEMORY[0x1F4183658]();
}

uint64_t sub_1B6E315D8()
{
  return MEMORY[0x1F4183680]();
}

uint64_t sub_1B6E315E8()
{
  return MEMORY[0x1F4183688]();
}

uint64_t sub_1B6E315F8()
{
  return MEMORY[0x1F4183690]();
}

uint64_t sub_1B6E31608()
{
  return MEMORY[0x1F41883F0]();
}

uint64_t sub_1B6E31618()
{
  return MEMORY[0x1F4188420]();
}

uint64_t sub_1B6E31628()
{
  return MEMORY[0x1F41836D0]();
}

uint64_t sub_1B6E31638()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B6E31648()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1B6E31658()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1B6E31668()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1B6E31678()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1B6E31688()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1B6E31698()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1B6E316A8()
{
  return MEMORY[0x1F4183788]();
}

uint64_t sub_1B6E316B8()
{
  return MEMORY[0x1F4183790]();
}

uint64_t sub_1B6E316C8()
{
  return MEMORY[0x1F4183798]();
}

uint64_t sub_1B6E316D8()
{
  return MEMORY[0x1F41837C0]();
}

uint64_t sub_1B6E316E8()
{
  return MEMORY[0x1F4183820]();
}

uint64_t sub_1B6E316F8()
{
  return MEMORY[0x1F4183830]();
}

uint64_t sub_1B6E31708()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B6E31718()
{
  return MEMORY[0x1F4183850]();
}

uint64_t sub_1B6E31728()
{
  return MEMORY[0x1F4183870]();
}

uint64_t sub_1B6E31738()
{
  return MEMORY[0x1F40E6058]();
}

uint64_t sub_1B6E31748()
{
  return MEMORY[0x1F40E6060]();
}

uint64_t sub_1B6E31758()
{
  return MEMORY[0x1F40E6068]();
}

uint64_t sub_1B6E31768()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B6E31778()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B6E31788()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B6E31798()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B6E317A8()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1B6E317B8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1B6E317C8()
{
  return MEMORY[0x1F40E6200]();
}

uint64_t sub_1B6E317D8()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1B6E317E8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1B6E317F8()
{
  return MEMORY[0x1F40E6278]();
}

uint64_t sub_1B6E31808()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1B6E31818()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B6E31828()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1B6E31838()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1B6E31848()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1B6E31858()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1B6E31868()
{
  return MEMORY[0x1F41838E8]();
}

uint64_t sub_1B6E31878()
{
  return MEMORY[0x1F4183900]();
}

uint64_t sub_1B6E31888()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1B6E31898()
{
  return MEMORY[0x1F4183940]();
}

uint64_t sub_1B6E318A8()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1B6E318B8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B6E318C8()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B6E318D8()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1B6E318E8()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1B6E318F8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1B6E31908()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1B6E31918()
{
  return MEMORY[0x1F4183A18]();
}

uint64_t sub_1B6E31928()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1B6E31938()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1B6E31948()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B6E31958()
{
  return MEMORY[0x1F4183A58]();
}

uint64_t sub_1B6E31968()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1B6E31978()
{
  return MEMORY[0x1F4183A68]();
}

uint64_t sub_1B6E31988()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1B6E31998()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B6E319A8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1B6E319B8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1B6E319C8()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_1B6E319D8()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1B6E319E8()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1B6E319F8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1B6E31A08()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1B6E31A28()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1B6E31A38()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_1B6E31A48()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1B6E31A58()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1B6E31A68()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1B6E31A78()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B6E31A88()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1B6E31A98()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1B6E31AA8()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1B6E31AB8()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_1B6E31AC8()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1B6E31AD8()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1B6E31AE8()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1B6E31AF8()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1B6E31B08()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1B6E31B18()
{
  return MEMORY[0x1F4183DA0]();
}

uint64_t sub_1B6E31B28()
{
  return MEMORY[0x1F4183DA8]();
}

uint64_t sub_1B6E31B38()
{
  return MEMORY[0x1F4183DC0]();
}

uint64_t sub_1B6E31B48()
{
  return MEMORY[0x1F4183DC8]();
}

uint64_t sub_1B6E31B58()
{
  return MEMORY[0x1F4183DD0]();
}

uint64_t sub_1B6E31B98()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1B6E31BA8()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1B6E31BB8()
{
  return MEMORY[0x1F4183E18]();
}

uint64_t sub_1B6E31BC8()
{
  return MEMORY[0x1F4183E20]();
}

uint64_t sub_1B6E31BD8()
{
  return MEMORY[0x1F4183E38]();
}

uint64_t sub_1B6E31BE8()
{
  return MEMORY[0x1F4183E40]();
}

uint64_t sub_1B6E31BF8()
{
  return MEMORY[0x1F4183E48]();
}

uint64_t sub_1B6E31C08()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B6E31C18()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B6E31C28()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B6E31C38()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B6E31C48()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B6E31C58()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1B6E31C68()
{
  return MEMORY[0x1F4183EB8]();
}

uint64_t sub_1B6E31C78()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B6E31C88()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1B6E31C98()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B6E31CA8()
{
  return MEMORY[0x1F4183F10]();
}

uint64_t sub_1B6E31CB8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1B6E31CC8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B6E31CD8()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1B6E31CE8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1B6E31CF8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1B6E31D08()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1B6E31D18()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1B6E31D28()
{
  return MEMORY[0x1F4183FB8]();
}

uint64_t sub_1B6E31D38()
{
  return MEMORY[0x1F4183FC0]();
}

uint64_t sub_1B6E31D48()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1B6E31D58()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1B6E31D68()
{
  return MEMORY[0x1F4183FE8]();
}

uint64_t sub_1B6E31D78()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1B6E31D88()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1B6E31D98()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B6E31DC8()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1B6E31DD8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B6E31DE8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B6E31E08()
{
  return MEMORY[0x1F4187E10]();
}

uint64_t sub_1B6E31E28()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1B6E31E48()
{
  return MEMORY[0x1F4187E50]();
}

uint64_t sub_1B6E31E58()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1B6E31E68()
{
  return MEMORY[0x1F4184090]();
}

uint64_t sub_1B6E31E78()
{
  return MEMORY[0x1F40E63F0]();
}

uint64_t sub_1B6E31E88()
{
  return MEMORY[0x1F41840A0]();
}

uint64_t sub_1B6E31E98()
{
  return MEMORY[0x1F41840B0]();
}

uint64_t sub_1B6E31EA8()
{
  return MEMORY[0x1F41840C0]();
}

uint64_t sub_1B6E31EB8()
{
  return MEMORY[0x1F41840C8]();
}

uint64_t sub_1B6E31EC8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1B6E31ED8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1B6E31EE8()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1B6E31EF8()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B6E31F08()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1B6E31F18()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1B6E31F28()
{
  return MEMORY[0x1F4184270]();
}

uint64_t sub_1B6E31F38()
{
  return MEMORY[0x1F41842A0]();
}

uint64_t sub_1B6E31F48()
{
  return MEMORY[0x1F41842A8]();
}

uint64_t sub_1B6E31F58()
{
  return MEMORY[0x1F41842B0]();
}

uint64_t sub_1B6E31F78()
{
  return MEMORY[0x1F41842C0]();
}

uint64_t sub_1B6E31F98()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1B6E31FA8()
{
  return MEMORY[0x1F4188450]();
}

uint64_t sub_1B6E31FB8()
{
  return MEMORY[0x1F41842E0]();
}

uint64_t sub_1B6E31FC8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1B6E31FD8()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1B6E31FE8()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1B6E31FF8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1B6E32018()
{
  return MEMORY[0x1F4184380]();
}

uint64_t sub_1B6E32028()
{
  return MEMORY[0x1F4184390]();
}

uint64_t sub_1B6E32038()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1B6E32048()
{
  return MEMORY[0x1F41843A0]();
}

uint64_t sub_1B6E32058()
{
  return MEMORY[0x1F41843A8]();
}

uint64_t sub_1B6E32068()
{
  return MEMORY[0x1F41843C0]();
}

uint64_t sub_1B6E32078()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1B6E32088()
{
  return MEMORY[0x1F41843D8]();
}

uint64_t sub_1B6E32098()
{
  return MEMORY[0x1F4184410]();
}

uint64_t sub_1B6E320A8()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_1B6E320B8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1B6E320C8()
{
  return MEMORY[0x1F4188480]();
}

uint64_t sub_1B6E320D8()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1B6E320E8()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1B6E320F8()
{
  return MEMORY[0x1F40D9658]();
}

uint64_t sub_1B6E32108()
{
  return MEMORY[0x1F41873C0]();
}

uint64_t sub_1B6E32118()
{
  return MEMORY[0x1F41876B0]();
}

uint64_t sub_1B6E32128()
{
  return MEMORY[0x1F40D9688]();
}

uint64_t sub_1B6E32138()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B6E32148()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B6E32158()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1B6E32168()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B6E32178()
{
  return MEMORY[0x1F4188760]();
}

uint64_t sub_1B6E32188()
{
  return MEMORY[0x1F41875A0]();
}

uint64_t sub_1B6E32198()
{
  return MEMORY[0x1F41875A8]();
}

uint64_t sub_1B6E321A8()
{
  return MEMORY[0x1F41873E0]();
}

uint64_t sub_1B6E321B8()
{
  return MEMORY[0x1F41873E8]();
}

uint64_t sub_1B6E321C8()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1B6E321D8()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1B6E321E8()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1B6E321F8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1B6E32208()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1B6E32218()
{
  return MEMORY[0x1F4187098]();
}

uint64_t sub_1B6E32228()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1B6E32238()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1B6E32248()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1B6E32258()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1B6E32268()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1B6E32278()
{
  return MEMORY[0x1F4187178]();
}

uint64_t sub_1B6E32288()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1B6E32298()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1B6E322A8()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1B6E322B8()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1B6E322C8()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1B6E322E8()
{
  return MEMORY[0x1F4187268]();
}

uint64_t sub_1B6E322F8()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1B6E32308()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1B6E32318()
{
  return MEMORY[0x1F41873D0]();
}

uint64_t sub_1B6E32328()
{
  return MEMORY[0x1F4186B58]();
}

uint64_t sub_1B6E32338()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1B6E32348()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1B6E32358()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B6E32368()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1B6E32378()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1B6E32388()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1B6E32398()
{
  return MEMORY[0x1F41873D8]();
}

uint64_t sub_1B6E323A8()
{
  return MEMORY[0x1F40E6B20]();
}

uint64_t sub_1B6E323B8()
{
  return MEMORY[0x1F40E6B40]();
}

uint64_t sub_1B6E323C8()
{
  return MEMORY[0x1F40E6B48]();
}

uint64_t sub_1B6E323D8()
{
  return MEMORY[0x1F40E6B50]();
}

uint64_t sub_1B6E323E8()
{
  return MEMORY[0x1F40E6B58]();
}

uint64_t sub_1B6E323F8()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1B6E32408()
{
  return MEMORY[0x1F4188730]();
}

uint64_t sub_1B6E32418()
{
  return MEMORY[0x1F4188738]();
}

uint64_t sub_1B6E32428()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1B6E32448()
{
  return MEMORY[0x1F41845E0]();
}

uint64_t sub_1B6E32458()
{
  return MEMORY[0x1F41845E8]();
}

uint64_t sub_1B6E32478()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_1B6E32498()
{
  return MEMORY[0x1F4184610]();
}

uint64_t sub_1B6E324A8()
{
  return MEMORY[0x1F4184618]();
}

uint64_t sub_1B6E324B8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B6E324C8()
{
  return MEMORY[0x1F4184680]();
}

uint64_t sub_1B6E324D8()
{
  return MEMORY[0x1F4184688]();
}

uint64_t sub_1B6E324F8()
{
  return MEMORY[0x1F41846D0]();
}

uint64_t sub_1B6E32508()
{
  return MEMORY[0x1F41846D8]();
}

uint64_t sub_1B6E32518()
{
  return MEMORY[0x1F41846E8]();
}

uint64_t sub_1B6E32528()
{
  return MEMORY[0x1F4184720]();
}

uint64_t sub_1B6E32538()
{
  return MEMORY[0x1F4184730]();
}

uint64_t sub_1B6E32548()
{
  return MEMORY[0x1F4184738]();
}

uint64_t sub_1B6E32558()
{
  return MEMORY[0x1F4184770]();
}

uint64_t sub_1B6E32568()
{
  return MEMORY[0x1F4184780]();
}

uint64_t sub_1B6E32578()
{
  return MEMORY[0x1F4184788]();
}

uint64_t sub_1B6E32588()
{
  return MEMORY[0x1F4184790]();
}

uint64_t sub_1B6E32598()
{
  return MEMORY[0x1F4184798]();
}

uint64_t sub_1B6E325A8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B6E325B8()
{
  return MEMORY[0x1F41847D8]();
}

uint64_t sub_1B6E325C8()
{
  return MEMORY[0x1F4184808]();
}

uint64_t sub_1B6E325D8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B6E325E8()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1B6E325F8()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1B6E32608()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1B6E32618()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1B6E32628()
{
  return MEMORY[0x1F40E6CA0]();
}

uint64_t sub_1B6E32638()
{
  return MEMORY[0x1F40E6CB8]();
}

uint64_t sub_1B6E32648()
{
  return MEMORY[0x1F40E6CF0]();
}

uint64_t sub_1B6E32658()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1B6E32668()
{
  return MEMORY[0x1F40E6D40]();
}

uint64_t sub_1B6E32678()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1B6E32688()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1B6E32698()
{
  return MEMORY[0x1F41848C0]();
}

uint64_t sub_1B6E326A8()
{
  return MEMORY[0x1F41848F0]();
}

uint64_t sub_1B6E326B8()
{
  return MEMORY[0x1F4184910]();
}

uint64_t sub_1B6E326C8()
{
  return MEMORY[0x1F4184938]();
}

uint64_t sub_1B6E326D8()
{
  return MEMORY[0x1F4184940]();
}

uint64_t sub_1B6E326E8()
{
  return MEMORY[0x1F4184950]();
}

uint64_t sub_1B6E326F8()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1B6E32708()
{
  return MEMORY[0x1F4184970]();
}

uint64_t sub_1B6E32718()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B6E32728()
{
  return MEMORY[0x1F4184988]();
}

uint64_t sub_1B6E32738()
{
  return MEMORY[0x1F4184998]();
}

uint64_t sub_1B6E32748()
{
  return MEMORY[0x1F41849A0]();
}

uint64_t sub_1B6E32758()
{
  return MEMORY[0x1F41849A8]();
}

uint64_t sub_1B6E32768()
{
  return MEMORY[0x1F41849B0]();
}

uint64_t sub_1B6E32778()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1B6E32788()
{
  return MEMORY[0x1F4184AA8]();
}

uint64_t sub_1B6E32798()
{
  return MEMORY[0x1F4184AB0]();
}

uint64_t sub_1B6E327B8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B6E327C8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B6E327D8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1B6E327E8()
{
  return MEMORY[0x1F4184B48]();
}

uint64_t sub_1B6E327F8()
{
  return MEMORY[0x1F4184B50]();
}

uint64_t sub_1B6E32808()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1B6E32818()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1B6E32828()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1B6E32838()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B6E32848()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1B6E32858()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B6E32868()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B6E32878()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B6E32888()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1B6E32898()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1B6E328B8()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1B6E328C8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B6E328D8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B6E328E8()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t sub_1B6E328F8()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1B6E32908()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1B6E32918()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B6E32928()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1B6E32938()
{
  return MEMORY[0x1F4184DA0]();
}

uint64_t sub_1B6E32948()
{
  return MEMORY[0x1F4184DB0]();
}

uint64_t sub_1B6E32958()
{
  return MEMORY[0x1F4184DB8]();
}

uint64_t sub_1B6E32968()
{
  return MEMORY[0x1F4184DC0]();
}

uint64_t sub_1B6E32978()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1B6E32988()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1B6E32998()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1B6E329A8()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_1B6E329B8()
{
  return MEMORY[0x1F4184E10]();
}

uint64_t sub_1B6E329C8()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_1B6E329D8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B6E329E8()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1B6E329F8()
{
  return MEMORY[0x1F4184E88]();
}

uint64_t sub_1B6E32A08()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1B6E32A18()
{
  return MEMORY[0x1F4184ED0]();
}

uint64_t sub_1B6E32A28()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1B6E32A38()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1B6E32A48()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1B6E32A58()
{
  return MEMORY[0x1F4184F00]();
}

uint64_t sub_1B6E32A68()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1B6E32A78()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1B6E32A88()
{
  return MEMORY[0x1F4184F38]();
}

uint64_t sub_1B6E32A98()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1B6E32AA8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1B6E32AB8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1B6E32AC8()
{
  return MEMORY[0x1F4184F88]();
}

uint64_t sub_1B6E32AD8()
{
  return MEMORY[0x1F4187F38]();
}

uint64_t sub_1B6E32AE8()
{
  return MEMORY[0x1F4187F68]();
}

uint64_t sub_1B6E32AF8()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1B6E32B08()
{
  return MEMORY[0x1F4184FF0]();
}

uint64_t sub_1B6E32B18()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B6E32B28()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1B6E32B38()
{
  return MEMORY[0x1F41850B0]();
}

uint64_t sub_1B6E32B48()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_1B6E32B58()
{
  return MEMORY[0x1F4185128]();
}

uint64_t sub_1B6E32B68()
{
  return MEMORY[0x1F4185130]();
}

uint64_t sub_1B6E32B78()
{
  return MEMORY[0x1F41851D8]();
}

uint64_t sub_1B6E32B88()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t sub_1B6E32B98()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1B6E32BA8()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1B6E32BB8()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1B6E32BC8()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1B6E32BD8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B6E32BE8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B6E32BF8()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1B6E32C08()
{
  return MEMORY[0x1F4185348]();
}

uint64_t sub_1B6E32C18()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B6E32C28()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B6E32C38()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B6E32C48()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1B6E32C58()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B6E32C68()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1B6E32C78()
{
  return MEMORY[0x1F4185390]();
}

uint64_t sub_1B6E32C88()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B6E32C98()
{
  return MEMORY[0x1F41853E8]();
}

uint64_t sub_1B6E32CB8()
{
  return MEMORY[0x1F4185480]();
}

uint64_t sub_1B6E32CC8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1B6E32CE8()
{
  return MEMORY[0x1F41854D0]();
}

uint64_t sub_1B6E32CF8()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1B6E32D08()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1B6E32D18()
{
  return MEMORY[0x1F41854E8]();
}

uint64_t sub_1B6E32D28()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1B6E32D38()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1B6E32D48()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1B6E32D58()
{
  return MEMORY[0x1F4185510]();
}

uint64_t sub_1B6E32D68()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1B6E32D78()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1B6E32D88()
{
  return MEMORY[0x1F4185560]();
}

uint64_t sub_1B6E32D98()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1B6E32DA8()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1B6E32DB8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1B6E32DC8()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_1B6E32DD8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1B6E32DE8()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_1B6E32DF8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B6E32E08()
{
  return MEMORY[0x1F41855A0]();
}

uint64_t sub_1B6E32E18()
{
  return MEMORY[0x1F41855A8]();
}

uint64_t sub_1B6E32E28()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1B6E32E38()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1B6E32E48()
{
  return MEMORY[0x1F41855C0]();
}

uint64_t sub_1B6E32E58()
{
  return MEMORY[0x1F41855C8]();
}

uint64_t sub_1B6E32E68()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1B6E32E78()
{
  return MEMORY[0x1F41855D8]();
}

uint64_t sub_1B6E32E88()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1B6E32E98()
{
  return MEMORY[0x1F41855E8]();
}

uint64_t sub_1B6E32EA8()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1B6E32EB8()
{
  return MEMORY[0x1F41855F8]();
}

uint64_t sub_1B6E32EC8()
{
  return MEMORY[0x1F4185600]();
}

uint64_t sub_1B6E32ED8()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1B6E32EE8()
{
  return MEMORY[0x1F4185618]();
}

uint64_t sub_1B6E32EF8()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1B6E32F08()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1B6E32F18()
{
  return MEMORY[0x1F4185640]();
}

uint64_t sub_1B6E32F28()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1B6E32F38()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1B6E32F48()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1B6E32F58()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1B6E32F68()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1B6E32F78()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_1B6E32F88()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1B6E32F98()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_1B6E32FA8()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B6E32FB8()
{
  return MEMORY[0x1F41856C8]();
}

uint64_t sub_1B6E32FC8()
{
  return MEMORY[0x1F41856D0]();
}

uint64_t sub_1B6E32FD8()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1B6E32FE8()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1B6E32FF8()
{
  return MEMORY[0x1F41856E8]();
}

uint64_t sub_1B6E33008()
{
  return MEMORY[0x1F41856F0]();
}

uint64_t sub_1B6E33018()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1B6E33028()
{
  return MEMORY[0x1F4185700]();
}

uint64_t sub_1B6E33038()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1B6E33048()
{
  return MEMORY[0x1F4185718]();
}

uint64_t sub_1B6E33058()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1B6E33068()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1B6E33078()
{
  return MEMORY[0x1F4185748]();
}

uint64_t sub_1B6E33088()
{
  return MEMORY[0x1F4185750]();
}

uint64_t sub_1B6E33098()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B6E330A8()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1B6E330B8()
{
  return MEMORY[0x1F4185778]();
}

uint64_t sub_1B6E330C8()
{
  return MEMORY[0x1F4185780]();
}

uint64_t sub_1B6E330D8()
{
  return MEMORY[0x1F4185788]();
}

uint64_t sub_1B6E330E8()
{
  return MEMORY[0x1F41857B0]();
}

uint64_t sub_1B6E330F8()
{
  return MEMORY[0x1F41857B8]();
}

uint64_t sub_1B6E33108()
{
  return MEMORY[0x1F41857C0]();
}

uint64_t sub_1B6E33118()
{
  return MEMORY[0x1F41857C8]();
}

uint64_t sub_1B6E33128()
{
  return MEMORY[0x1F41857D0]();
}

uint64_t sub_1B6E33138()
{
  return MEMORY[0x1F41857D8]();
}

uint64_t sub_1B6E33148()
{
  return MEMORY[0x1F41857E0]();
}

uint64_t sub_1B6E33158()
{
  return MEMORY[0x1F41857E8]();
}

uint64_t sub_1B6E33168()
{
  return MEMORY[0x1F41857F0]();
}

uint64_t sub_1B6E33178()
{
  return MEMORY[0x1F41857F8]();
}

uint64_t sub_1B6E33188()
{
  return MEMORY[0x1F4185810]();
}

uint64_t sub_1B6E33198()
{
  return MEMORY[0x1F4185818]();
}

uint64_t sub_1B6E331A8()
{
  return MEMORY[0x1F4185828]();
}

uint64_t sub_1B6E331B8()
{
  return MEMORY[0x1F4185830]();
}

uint64_t sub_1B6E331C8()
{
  return MEMORY[0x1F4185838]();
}

uint64_t sub_1B6E331D8()
{
  return MEMORY[0x1F4185840]();
}

uint64_t sub_1B6E331E8()
{
  return MEMORY[0x1F4185848]();
}

uint64_t sub_1B6E331F8()
{
  return MEMORY[0x1F4185850]();
}

uint64_t sub_1B6E33208()
{
  return MEMORY[0x1F4185858]();
}

uint64_t sub_1B6E33218()
{
  return MEMORY[0x1F4185860]();
}

uint64_t sub_1B6E33228()
{
  return MEMORY[0x1F4185868]();
}

uint64_t sub_1B6E33238()
{
  return MEMORY[0x1F4185870]();
}

uint64_t sub_1B6E33248()
{
  return MEMORY[0x1F4185878]();
}

uint64_t sub_1B6E33258()
{
  return MEMORY[0x1F4185880]();
}

uint64_t sub_1B6E33268()
{
  return MEMORY[0x1F41858B0]();
}

uint64_t sub_1B6E33278()
{
  return MEMORY[0x1F41858B8]();
}

uint64_t sub_1B6E33288()
{
  return MEMORY[0x1F41858C0]();
}

uint64_t sub_1B6E33298()
{
  return MEMORY[0x1F41858C8]();
}

uint64_t sub_1B6E332A8()
{
  return MEMORY[0x1F41858D0]();
}

uint64_t sub_1B6E332B8()
{
  return MEMORY[0x1F41858D8]();
}

uint64_t sub_1B6E332C8()
{
  return MEMORY[0x1F41858E0]();
}

uint64_t sub_1B6E332D8()
{
  return MEMORY[0x1F41858E8]();
}

uint64_t sub_1B6E332E8()
{
  return MEMORY[0x1F41858F8]();
}

uint64_t sub_1B6E332F8()
{
  return MEMORY[0x1F4185908]();
}

uint64_t sub_1B6E33308()
{
  return MEMORY[0x1F4185910]();
}

uint64_t sub_1B6E33318()
{
  return MEMORY[0x1F4185918]();
}

uint64_t sub_1B6E33328()
{
  return MEMORY[0x1F4185920]();
}

uint64_t sub_1B6E33338()
{
  return MEMORY[0x1F4185928]();
}

uint64_t sub_1B6E33348()
{
  return MEMORY[0x1F4185930]();
}

uint64_t sub_1B6E33358()
{
  return MEMORY[0x1F4185938]();
}

uint64_t sub_1B6E33368()
{
  return MEMORY[0x1F4185940]();
}

uint64_t sub_1B6E33378()
{
  return MEMORY[0x1F4185948]();
}

uint64_t sub_1B6E33388()
{
  return MEMORY[0x1F4185950]();
}

uint64_t sub_1B6E33398()
{
  return MEMORY[0x1F4185958]();
}

uint64_t sub_1B6E333A8()
{
  return MEMORY[0x1F4185960]();
}

uint64_t sub_1B6E333B8()
{
  return MEMORY[0x1F4185968]();
}

uint64_t sub_1B6E333C8()
{
  return MEMORY[0x1F4185970]();
}

uint64_t sub_1B6E333D8()
{
  return MEMORY[0x1F4185978]();
}

uint64_t sub_1B6E333E8()
{
  return MEMORY[0x1F4185980]();
}

uint64_t sub_1B6E333F8()
{
  return MEMORY[0x1F4185988]();
}

uint64_t sub_1B6E33408()
{
  return MEMORY[0x1F4185990]();
}

uint64_t sub_1B6E33418()
{
  return MEMORY[0x1F4185998]();
}

uint64_t sub_1B6E33428()
{
  return MEMORY[0x1F41859A0]();
}

uint64_t sub_1B6E33438()
{
  return MEMORY[0x1F41859B8]();
}

uint64_t sub_1B6E33448()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1B6E33458()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1B6E33468()
{
  return MEMORY[0x1F4185A00]();
}

uint64_t sub_1B6E33478()
{
  return MEMORY[0x1F4185A18]();
}

uint64_t sub_1B6E33488()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1B6E33498()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B6E334A8()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1B6E334B8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B6E334C8()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1B6E334D8()
{
  return MEMORY[0x1F4185A60]();
}

uint64_t sub_1B6E334E8()
{
  return MEMORY[0x1F4185A70]();
}

uint64_t sub_1B6E334F8()
{
  return MEMORY[0x1F4185A78]();
}

uint64_t sub_1B6E33508()
{
  return MEMORY[0x1F4185A80]();
}

uint64_t sub_1B6E33518()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1B6E33528()
{
  return MEMORY[0x1F4185A98]();
}

uint64_t sub_1B6E33538()
{
  return MEMORY[0x1F4185AA8]();
}

uint64_t sub_1B6E33548()
{
  return MEMORY[0x1F4185AB8]();
}

uint64_t sub_1B6E33558()
{
  return MEMORY[0x1F4185AC8]();
}

uint64_t sub_1B6E33568()
{
  return MEMORY[0x1F4185AD0]();
}

uint64_t sub_1B6E33578()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1B6E33588()
{
  return MEMORY[0x1F4185AF8]();
}

uint64_t sub_1B6E33598()
{
  return MEMORY[0x1F4185B08]();
}

uint64_t sub_1B6E335A8()
{
  return MEMORY[0x1F4185B10]();
}

uint64_t sub_1B6E335B8()
{
  return MEMORY[0x1F4185B18]();
}

uint64_t sub_1B6E335C8()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1B6E335D8()
{
  return MEMORY[0x1F4185B38]();
}

uint64_t sub_1B6E335E8()
{
  return MEMORY[0x1F4185B48]();
}

uint64_t sub_1B6E335F8()
{
  return MEMORY[0x1F4185B60]();
}

uint64_t sub_1B6E33608()
{
  return MEMORY[0x1F4185B70]();
}

uint64_t sub_1B6E33618()
{
  return MEMORY[0x1F4185B78]();
}

uint64_t sub_1B6E33628()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1B6E33638()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1B6E33648()
{
  return MEMORY[0x1F4185BE8]();
}

uint64_t sub_1B6E33658()
{
  return MEMORY[0x1F4185BF0]();
}

uint64_t sub_1B6E33668()
{
  return MEMORY[0x1F4185BF8]();
}

uint64_t sub_1B6E33678()
{
  return MEMORY[0x1F4185C00]();
}

uint64_t sub_1B6E33688()
{
  return MEMORY[0x1F4185C08]();
}

uint64_t sub_1B6E33698()
{
  return MEMORY[0x1F4185C10]();
}

uint64_t sub_1B6E336A8()
{
  return MEMORY[0x1F4185C18]();
}

uint64_t sub_1B6E336B8()
{
  return MEMORY[0x1F4185C20]();
}

uint64_t sub_1B6E336C8()
{
  return MEMORY[0x1F4185C28]();
}

uint64_t sub_1B6E336D8()
{
  return MEMORY[0x1F4185C30]();
}

uint64_t sub_1B6E336E8()
{
  return MEMORY[0x1F4185C88]();
}

uint64_t sub_1B6E336F8()
{
  return MEMORY[0x1F4185C90]();
}

uint64_t sub_1B6E33708()
{
  return MEMORY[0x1F4185C98]();
}

uint64_t sub_1B6E33718()
{
  return MEMORY[0x1F4185CA0]();
}

uint64_t sub_1B6E33728()
{
  return MEMORY[0x1F4185CA8]();
}

uint64_t sub_1B6E33738()
{
  return MEMORY[0x1F4185CB0]();
}

uint64_t sub_1B6E33748()
{
  return MEMORY[0x1F4185CB8]();
}

uint64_t sub_1B6E33758()
{
  return MEMORY[0x1F4185CC0]();
}

uint64_t sub_1B6E33768()
{
  return MEMORY[0x1F4185CC8]();
}

uint64_t sub_1B6E33778()
{
  return MEMORY[0x1F4185CD0]();
}

uint64_t sub_1B6E33788()
{
  return MEMORY[0x1F4185CD8]();
}

uint64_t sub_1B6E33798()
{
  return MEMORY[0x1F4185CE0]();
}

uint64_t sub_1B6E337A8()
{
  return MEMORY[0x1F4185CE8]();
}

uint64_t sub_1B6E337B8()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1B6E337C8()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1B6E337D8()
{
  return MEMORY[0x1F4185D48]();
}

uint64_t sub_1B6E337E8()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1B6E337F8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1B6E33808()
{
  return MEMORY[0x1F4185DB8]();
}

uint64_t sub_1B6E33818()
{
  return MEMORY[0x1F4185DC8]();
}

uint64_t sub_1B6E33828()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B6E33838()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B6E33868()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1B6E33878()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B6E33888()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B6E33898()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B6E338A8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B6E338B8()
{
  return MEMORY[0x1F4185E38]();
}

uint64_t sub_1B6E338C8()
{
  return MEMORY[0x1F4185E40]();
}

uint64_t sub_1B6E338D8()
{
  return MEMORY[0x1F4185E78]();
}

uint64_t sub_1B6E338E8()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1B6E338F8()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_1B6E33908()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1B6E33918()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B6E33928()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B6E33938()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1B6E33948()
{
  return MEMORY[0x1F4185ED8]();
}

uint64_t sub_1B6E33958()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1B6E33968()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1B6E33978()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1B6E33988()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B6E33998()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_1B6E339A8()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1B6E339B8()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1B6E339C8()
{
  return MEMORY[0x1F4185F30]();
}

uint64_t sub_1B6E339D8()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1B6E339E8()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1B6E339F8()
{
  return MEMORY[0x1F4185F58]();
}

uint64_t sub_1B6E33A08()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1B6E33A18()
{
  return MEMORY[0x1F4185FB0]();
}

uint64_t sub_1B6E33A28()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1B6E33A38()
{
  return MEMORY[0x1F4185FC0]();
}

uint64_t sub_1B6E33A48()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B6E33A58()
{
  return MEMORY[0x1F4185FD8]();
}

uint64_t sub_1B6E33A68()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1B6E33A78()
{
  return MEMORY[0x1F4185FE8]();
}

uint64_t sub_1B6E33A88()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1B6E33A98()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_1B6E33AA8()
{
  return MEMORY[0x1F4186138]();
}

uint64_t sub_1B6E33AB8()
{
  return MEMORY[0x1F4186288]();
}

uint64_t sub_1B6E33AC8()
{
  return MEMORY[0x1F4186290]();
}

uint64_t sub_1B6E33AD8()
{
  return MEMORY[0x1F4186298]();
}

uint64_t sub_1B6E33AE8()
{
  return MEMORY[0x1F41862A0]();
}

uint64_t sub_1B6E33B18()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1B6E33B28()
{
  return MEMORY[0x1F4188198]();
}

uint64_t sub_1B6E33B48()
{
  return MEMORY[0x1F4186318]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

void CFBundleGetPackageInfo(CFBundleRef bundle, UInt32 *packageType, UInt32 *packageCreator)
{
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D79C8](theDict, key);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1F40D80A0](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x1F40D80D0](rl);
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80E0](allocator, activities, repeats, order, block);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1F40D8208](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8218](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.locatiouint64_t n = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x1F40D8548](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8798](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D87C0](anURL);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9830](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo, releaseCallback);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1F40D9840](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x1F40D9848](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x1F40D9850](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9860](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9948](options, a2, *(void *)&a3, *(void *)&a4);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x1F40D9968]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x1F40D9A38]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B90](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x1F40D9C70]();
}

uint64_t CGColorTRCGetGammaID()
{
  return MEMORY[0x1F40D9C78]();
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1F40D9C90]();
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1F40D9C98]();
}

uint64_t CGColorTransformConvertData()
{
  return MEMORY[0x1F40D9CA0]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGColorTransformGetColorSpace()
{
  return MEMORY[0x1F40D9CB0]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFStringRef CGFontCopyFullName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DA3C8](font);
}

CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph)
{
  return (CFStringRef)MEMORY[0x1F40DA3D0](font, glyph);
}

void CGFontRelease(CGFontRef font)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1F40DA9A8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CGImageSourceStatus CGImageSourceGetStatusAtIndex(CGImageSourceRef isrc, size_t index)
{
  return MEMORY[0x1F40E9A10](isrc, index);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

uint64_t CSIsNull()
{
  return MEMORY[0x1F4115608]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1F4115668]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x1F41156E0]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x1F4115880]();
}

uint64_t CSSymbolicatorForeachSymbolWithMangledNameAtTime()
{
  return MEMORY[0x1F41158E8]();
}

uint64_t CSSymbolicatorGetTask()
{
  return MEMORY[0x1F41159B8]();
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x1F40DF2D0](font, attributes);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x1F40DF368](font, glyph, matrix);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  MEMORY[0x1F40DF4A0](font, *(void *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x1F40DF4A8](font);
  return result;
}

CGRect CTFontGetBoundingBox(CTFontRef font)
{
  MEMORY[0x1F40DF4B8](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x1F40DF4E0](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1F40DF510](font, characters, glyphs, count);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  MEMORY[0x1F40DF528](font);
  return result;
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1F40DF6B8](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1F40DF6E0](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1F40DF6E8](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x1F40DF700](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1F40DF7E0](line);
}

void CTRunGetAdvances(CTRunRef run, CFRange range, CGSize *buffer)
{
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF8B8](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1F40DF8D8](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t MTLDataTypeGetAlignment()
{
  return MEMORY[0x1F40EDE10]();
}

uint64_t MTLDataTypeString()
{
  return MEMORY[0x1F40EDE18]();
}

uint64_t MTLGetShaderCachePath()
{
  return MEMORY[0x1F40EDE20]();
}

uint64_t MTLPixelFormatGetInfo()
{
  return MEMORY[0x1F40EDE30]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1F40EDE38]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x1F40EDE48]();
}

uint64_t MTLValidationEnabled()
{
  return MEMORY[0x1F40EDE68]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1F40E70B0](retstr, table);
}

void NSLog(NSString *format, ...)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1F40E71B0](enumerator, key, value);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4166AA8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x1F40D90D8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _SCNShadableConvertShaderToMetalIfNeeded()
{
  return MEMORY[0x1F40F67F0]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1F4166FA8]();
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5E8](this, __str, __pos, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
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

uint64_t std::stringbuf::basic_stringbuf()
{
  return MEMORY[0x1F417E9A8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::move(std::ios_base *this, std::ios_base *a2)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __invert_d4()
{
  return MEMORY[0x1F40C9BE8]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x1F40C9C00]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincospif_stret(float a1)
{
  MEMORY[0x1F40C9C90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

double __tanpi(double a1)
{
  MEMORY[0x1F40C9CF0](a1);
  return result;
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1F40C9E08](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1F40C9E60]();
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  MEMORY[0x1F40CA150]((__n128)x);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x1F40CA188]((__n128)x, (__n128)y);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  MEMORY[0x1F40CA190]((__n128)x);
  return result;
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_immortalize()
{
  return MEMORY[0x1F4186380]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1F41863A0]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

void *__cdecl aligned_alloc(size_t __alignment, size_t __size)
{
  return (void *)MEMORY[0x1F40CA390](__alignment, __size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x1F40CA498](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1F40CA570](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

float cbrtf(float a1)
{
  MEMORY[0x1F40CA690](a1);
  return result;
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814D8](cls, protocol);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1F4181550](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

uint64_t clear_mapped_memory()
{
  return MEMORY[0x1F41159F8]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BC0](crc, buf, *(void *)&len);
}

uint64_t create_mapped_memory_cache_for_task()
{
  return MEMORY[0x1F4115A08]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

uint64_t destroy_mapped_memory_cache()
{
  return MEMORY[0x1F4115A18]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

double drand48(void)
{
  MEMORY[0x1F40CBDE8]();
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1F40CC528](mhp, segname, sectname, size);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x1F40CC808](*(void *)&a2, a1);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1F40CC958](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return MEMORY[0x1F40CC960](*(void *)&mem_entry, *(void *)&owner, *(void *)&ledger_tag, *(void *)&ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40CCA80](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB88](alignment, size, type_id);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB0](size, type_id);
}

uint64_t mapped_memory_read()
{
  return MEMORY[0x1F4115BD8]();
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1F4181750](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x1F4181798])(a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x1F40CD678]();
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x1F40CD6A0]();
}

int os_workgroup_join(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return MEMORY[0x1F40CD6F8](wg, token_out);
}

void os_workgroup_leave(os_workgroup_t wg, os_workgroup_join_token_t token)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

uint64_t proc_disable_wakemon()
{
  return MEMORY[0x1F40CD850]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD918](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD940](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1F40CD950](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1F40CD958](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1F40CD9E0](a1, a2);
}

void pthread_exit(void *a1)
{
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAB0](a1, *(void *)&a2);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  return MEMORY[0x1F40CDAD0](__override);
}

pthread_override_t pthread_override_qos_class_start_np(pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  return (pthread_override_t)MEMORY[0x1F40CDAD8](__pthread, *(void *)&__qos_class, *(void *)&__relative_priority);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x1F40CDB40]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x1F40CE018](*(void *)&a1, a2, a3);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1F41881C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtAnyKeyPath()
{
  return MEMORY[0x1F4186548]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getAtPartialKeyPath()
{
  return MEMORY[0x1F4186558]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getFunctionTypeMetadata3()
{
  return MEMORY[0x1F41865D8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1F4186600]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getTypeByMangledNameInContext()
{
  return MEMORY[0x1F4186660]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x1F4186720]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1F4186780]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x1F4186800]();
}

uint64_t swift_unknownObjectUnownedCopyAssign()
{
  return MEMORY[0x1F4186808]();
}

uint64_t swift_unknownObjectUnownedCopyInit()
{
  return MEMORY[0x1F4186810]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_unknownObjectUnownedTakeAssign()
{
  return MEMORY[0x1F4186830]();
}

uint64_t swift_unknownObjectUnownedTakeInit()
{
  return MEMORY[0x1F4186838]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x1F40CE428](a1);
  return result;
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
}

vDSP_DFT_Setup vDSP_DFT_zop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1F40D1978](__Previous, __Length, *(void *)&__Direction);
}

void vDSP_measqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_zvabs(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

uint64_t vImageDecodeVectorHalf()
{
  return MEMORY[0x1F40D2870]();
}

uint64_t vImageEncodeVectorHalf()
{
  return MEMORY[0x1F40D2898]();
}

uint64_t vImageEncodeVectorOptionsCreate()
{
  return MEMORY[0x1F40D28A0]();
}

uint64_t vImageEncodeVectorOptionsFree()
{
  return MEMORY[0x1F40D28A8]();
}

uint64_t vImageEncodeVectorOptionsSetQuantization()
{
  return MEMORY[0x1F40D28B0]();
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1F40CE6E0](*(void *)&target_task, address, *(void *)&control, state);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1F40CE8B0](__s, *(void *)&__c, __n);
}