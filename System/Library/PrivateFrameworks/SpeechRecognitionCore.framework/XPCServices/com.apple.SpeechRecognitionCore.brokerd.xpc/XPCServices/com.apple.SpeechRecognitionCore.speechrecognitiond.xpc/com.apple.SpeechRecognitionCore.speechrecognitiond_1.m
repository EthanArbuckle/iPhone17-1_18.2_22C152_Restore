void sub_1000A7AB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  if (a15)
  {
    (*(void (**)(uint64_t))(*(void *)a15 + 8))(a15);
  }
  else if (a18)
  {
    --*a18;
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A7B38(void **a1, unint64_t a2, _DWORD *a3)
{
  v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      sub_100019424();
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
      v15 = (char *)sub_10002EE10(v6, v14);
    }
    else {
      v15 = 0;
    }
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
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

void *sub_1000A7C5C(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10008AF04(a1, a2);
    uint64_t v6 = (void *)a1[1];
    v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1000A7CC4(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A7CE0(uint64_t a1, int *a2, int a3)
{
  unsigned int v3 = a3;
  if (a3 >= 1)
  {
    uint64_t v6 = *(void *)(a1 + 72);
    while (1)
    {
      unsigned int v7 = v3 - 1;
      uint64_t v8 = (v3 - 1) >> 1;
      if (sub_1000A7D90((uint64_t **)a1, *(_DWORD *)(v6 + 4 * v8), *a2)) {
        break;
      }
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(int *)(v9 + 4 * v3);
      uint64_t v11 = *(int *)(v9 + 4 * v8);
      *(_DWORD *)(v9 + 4 * v3) = v11;
      uint64_t v12 = *(void *)(a1 + 24);
      *(_DWORD *)(v12 + 4 * v11) = v3;
      *(_DWORD *)(v9 + 4 * v8) = v10;
      *(_DWORD *)(v12 + 4 * v10) = v8;
      uint64_t v6 = *(void *)(a1 + 72);
      LODWORD(v10) = *(_DWORD *)(v6 + 4 * v3);
      *(_DWORD *)(v6 + 4 * v3) = *(_DWORD *)(v6 + 4 * v8);
      *(_DWORD *)(v6 + 4 * v8) = v10;
      unsigned int v3 = v7 >> 1;
      if (v7 <= 1) {
        return *(unsigned int *)(*(void *)(a1 + 48) + 4 * (int)v8);
      }
    }
  }
  LODWORD(v8) = v3;
  return *(unsigned int *)(*(void *)(a1 + 48) + 4 * (int)v8);
}

BOOL sub_1000A7D90(uint64_t **a1, int a2, int a3)
{
  unint64_t v5 = a2;
  uint64_t v6 = **a1;
  if (a2 >= (unint64_t)(((*a1)[1] - v6) >> 2)) {
    unsigned int v7 = sub_10002D8A8();
  }
  else {
    unsigned int v7 = (int *)(v6 + 4 * a2);
  }
  float v8 = *(float *)v7;
  uint64_t v9 = *a1[1];
  if (v5 >= (a1[1][1] - v9) >> 2) {
    uint64_t v10 = sub_10002D8A8();
  }
  else {
    uint64_t v10 = (int *)(v9 + 4 * v5);
  }
  if (v8 == -INFINITY || (float v11 = *(float *)v10, *(float *)v10 >= -INFINITY) && *(float *)v10 <= -INFINITY)
  {
    float v12 = *(float *)sub_10006ECE4();
  }
  else
  {
    BOOL v13 = v11 == INFINITY || v8 == INFINITY;
    float v12 = v8 + v11;
    if (v13) {
      float v12 = INFINITY;
    }
  }
  float v24 = v12;
  uint64_t v14 = **a1;
  if (a3 >= (unint64_t)(((*a1)[1] - v14) >> 2)) {
    v15 = sub_10002D8A8();
  }
  else {
    v15 = (int *)(v14 + 4 * a3);
  }
  float v16 = *(float *)v15;
  uint64_t v17 = *a1[1];
  if (a3 >= (unint64_t)((a1[1][1] - v17) >> 2)) {
    v18 = sub_10002D8A8();
  }
  else {
    v18 = (int *)(v17 + 4 * a3);
  }
  if (v16 == -INFINITY || (float v19 = *(float *)v18, *(float *)v18 >= -INFINITY) && *(float *)v18 <= -INFINITY)
  {
    float v20 = *(float *)sub_10006ECE4();
  }
  else
  {
    BOOL v21 = v19 == INFINITY || v16 == INFINITY;
    float v20 = v16 + v19;
    if (v21) {
      float v20 = INFINITY;
    }
  }
  float v23 = v20;
  return sub_100096070((uint64_t)(a1 + 2), &v24, &v23);
}

BOOL sub_1000A7F0C(BOOL result, uint64_t a2)
{
  uint64_t v3 = result;
  while (1)
  {
    uint64_t v4 = (2 * a2) | 1u;
    if ((int)v4 >= *(_DWORD *)(v3 + 96)
      || !(result = sub_1000A7D90((uint64_t **)v3, *(_DWORD *)(*(void *)(v3 + 72) + 4 * (int)v4), *(_DWORD *)(*(void *)(v3 + 72) + 4 * (int)a2))))
    {
      uint64_t v4 = a2;
    }
    unsigned int v5 = 2 * a2 + 2;
    if ((signed int)v5 < *(_DWORD *)(v3 + 96))
    {
      result = sub_1000A7D90((uint64_t **)v3, *(_DWORD *)(*(void *)(v3 + 72) + 4 * (int)v5), *(_DWORD *)(*(void *)(v3 + 72) + 4 * (int)v4));
      if (result) {
        uint64_t v4 = v5;
      }
      else {
        uint64_t v4 = v4;
      }
    }
    if (v4 == a2) {
      break;
    }
    uint64_t v6 = *(void *)(v3 + 48);
    uint64_t v7 = *(int *)(v6 + 4 * (int)a2);
    uint64_t v8 = *(int *)(v6 + 4 * (int)v4);
    *(_DWORD *)(v6 + 4 * (int)a2) = v8;
    uint64_t v9 = *(void *)(v3 + 24);
    *(_DWORD *)(v9 + 4 * v8) = a2;
    *(_DWORD *)(v6 + 4 * (int)v4) = v7;
    *(_DWORD *)(v9 + 4 * v7) = v4;
    uint64_t v10 = *(void *)(v3 + 72);
    LODWORD(v7) = *(_DWORD *)(v10 + 4 * (int)a2);
    *(_DWORD *)(v10 + 4 * (int)a2) = *(_DWORD *)(v10 + 4 * (int)v4);
    *(_DWORD *)(v10 + 4 * (int)v4) = v7;
    a2 = v4;
  }
  return result;
}

void *sub_1000A7FDC(void *a1)
{
  v2 = (void *)a1[36];
  if (v2)
  {
    a1[37] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[35];
  if (v3)
  {
    do
    {
      uint64_t v4 = (void *)*v3;
      operator delete(v3);
      uint64_t v3 = v4;
    }
    while (v4);
  }
  a1[35] = 0;
  unsigned int v5 = (void *)a1[32];
  if (v5) {
    operator delete(v5);
  }
  sub_100095B5C(a1 + 26);
  sub_10001B7F8((uint64_t)(a1 + 20));
  uint64_t v6 = (void *)a1[16];
  if (v6)
  {
    a1[17] = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)a1[13];
  if (v7) {
    operator delete(v7);
  }
  uint64_t v8 = (void *)a1[10];
  if (v8)
  {
    a1[11] = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)a1[7];
  if (v9)
  {
    a1[8] = v9;
    operator delete(v9);
  }
  return a1;
}

uint64_t sub_1000A8084(uint64_t a1)
{
  *(void *)a1 = off_1000F3010;
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  unsigned int v5 = (void **)(a1 + 24);
  sub_1000972A8(&v5);
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

uint64_t sub_1000A811C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[0] = byte_1000FE8F8;
  uint64_t v9 = qword_1000FE900;
  sub_1000A8B5C((uint64_t)v8, &v10);
  uint64_t v6 = v10;
  *(_OWORD *)(a1 + 8) = v10;
  *(void *)a1 = off_1000F3A80;
  sub_1000A81F0(v6, a2, a3);
  return a1;
}

void sub_1000A81BC(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = off_1000F3BF8;
  uint64_t v3 = (std::__shared_weak_count *)v1[2];
  if (v3) {
    sub_100018BC0(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A81F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 112);
  *(void *)(a1 + 112) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56))(a2, 0xFFFFFFFF0007, 0);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a3 + 56))(a3, 0xFFFFFFFF0007, 0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96))(a2);
  sub_100030234(a1, v9);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104))(a2);
  sub_1000302D4(a1, v10);
  sub_10002C8DC(a1 + 56);
  sub_10002C8DC(a1 + 56);
  sub_10002C774(a1 + 56, 0);
  int v11 = *sub_10002D854();
  sub_100030AA4(a1 + 56);
  float v12 = *(void **)(a1 + 64);
  LODWORD(v48) = v11;
  float v13 = sub_100030BD4(v12, 1, (float *)&v48);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, float))(*(void *)a2 + 96))(a2, v13);
  sub_100030AA4(a1 + 56);
  sub_100030234(*(void *)(a1 + 64), v14);
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104))(a2);
  sub_100030AA4(a1 + 56);
  sub_1000302D4(*(void *)(a1 + 64), v15);
  *(_DWORD *)(a1 + 80) = 2;
  int v16 = *sub_10002D854();
  unint64_t v48 = 0xFFFFFFFF00000000;
  int v49 = v16;
  int v50 = 1;
  sub_100030AA4(a1 + 56);
  sub_100030C6C(*(void **)(a1 + 64), 0, (float *)&v48);
  int v17 = *sub_10002D854();
  unint64_t v48 = 0xFFFFFFFE00000000;
  int v49 = v17;
  int v50 = 1;
  sub_100030AA4(a1 + 56);
  sub_100030C6C(*(void **)(a1 + 64), 0, (float *)&v48);
  uint64_t v18 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 72))(a2, 0);
  uint64_t v19 = v18;
  unint64_t v20 = *(void *)(a1 + 104);
  BOOL v21 = (char **)(a1 + 88);
  unint64_t v22 = *(void *)(a1 + 96);
  if (v22 >= v20)
  {
    uint64_t v24 = (uint64_t)(v22 - (void)*v21) >> 4;
    unint64_t v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 60) {
      goto LABEL_36;
    }
    uint64_t v26 = v20 - (void)*v21;
    if (v26 >> 3 > v25) {
      unint64_t v25 = v26 >> 3;
    }
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v27 = v25;
    }
    if (v27) {
      v28 = (char *)sub_10001A898(a1 + 104, v27);
    }
    else {
      v28 = 0;
    }
    v29 = &v28[16 * v24];
    v30 = &v28[16 * v27];
    *(_DWORD *)v29 = -1;
    *((void *)v29 + 1) = v19;
    float v23 = v29 + 16;
    v32 = *(char **)(a1 + 88);
    v31 = *(char **)(a1 + 96);
    if (v31 != v32)
    {
      do
      {
        *((_OWORD *)v29 - 1) = *((_OWORD *)v31 - 1);
        v29 -= 16;
        v31 -= 16;
      }
      while (v31 != v32);
      v31 = *v21;
    }
    *(void *)(a1 + 88) = v29;
    *(void *)(a1 + 96) = v23;
    *(void *)(a1 + 104) = v30;
    if (v31) {
      operator delete(v31);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v22 = -1;
    *(void *)(v22 + 8) = v18;
    float v23 = (char *)(v22 + 16);
  }
  *(void *)(a1 + 96) = v23;
  uint64_t v33 = (*(uint64_t (**)(uint64_t, void))(*(void *)a3 + 72))(a3, 0);
  uint64_t v34 = v33;
  unint64_t v36 = *(void *)(a1 + 96);
  unint64_t v35 = *(void *)(a1 + 104);
  if (v36 < v35)
  {
    *(_DWORD *)unint64_t v36 = -2;
    *(void *)(v36 + 8) = v33;
    v37 = (char *)(v36 + 16);
    goto LABEL_35;
  }
  uint64_t v38 = (uint64_t)(v36 - (void)*v21) >> 4;
  unint64_t v39 = v38 + 1;
  if ((unint64_t)(v38 + 1) >> 60) {
LABEL_36:
  }
    sub_100019424();
  uint64_t v40 = v35 - (void)*v21;
  if (v40 >> 3 > v39) {
    unint64_t v39 = v40 >> 3;
  }
  if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v41 = v39;
  }
  if (v41) {
    v42 = (char *)sub_10001A898(a1 + 104, v41);
  }
  else {
    v42 = 0;
  }
  v43 = &v42[16 * v38];
  v44 = &v42[16 * v41];
  *(_DWORD *)v43 = -2;
  *((void *)v43 + 1) = v34;
  v37 = v43 + 16;
  v46 = *(char **)(a1 + 88);
  v45 = *(char **)(a1 + 96);
  if (v45 != v46)
  {
    do
    {
      *((_OWORD *)v43 - 1) = *((_OWORD *)v45 - 1);
      v43 -= 16;
      v45 -= 16;
    }
    while (v45 != v46);
    v45 = *v21;
  }
  *(void *)(a1 + 88) = v43;
  *(void *)(a1 + 96) = v37;
  *(void *)(a1 + 104) = v44;
  if (v45) {
    operator delete(v45);
  }
LABEL_35:
  *(void *)(a1 + 96) = v37;
  uint64_t result = sub_1000C2A1C(v7, v8, 1);
  *(void *)(a1 + 8) = *(void *)(a1 + 8) & 0xFFFF00000000FFFFLL | result & 0xFFFFFFFF0004;
  return result;
}

void *sub_1000A86B0(void *a1)
{
  *a1 = off_1000F3BF8;
  v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    sub_100018BC0(v2);
  }
  return a1;
}

void sub_1000A86FC(void *a1)
{
  *a1 = off_1000F3BF8;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    sub_100018BC0(v1);
  }
  operator delete();
}

uint64_t sub_1000A8768(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)sub_1000A9108(*(void *)(a1 + 8)) + 16);
  return v1();
}

uint64_t sub_1000A87B4(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)sub_1000A9108(*(void *)(a1 + 8)) + 24);
  return v1();
}

uint64_t sub_1000A8818(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)sub_1000A9108(*(void *)(a1 + 8)) + 32);
  return v1();
}

uint64_t sub_1000A8874(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)sub_1000A9108(*(void *)(a1 + 8)) + 40);
  return v1();
}

uint64_t sub_1000A88D0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)sub_1000A9108(*(void *)(a1 + 8)) + 48);
  return v1();
}

uint64_t sub_1000A892C(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v8 = 0;
    unint64_t v5 = sub_100067D14(a1, a2, &v8);
    *(void *)(*(void *)(a1 + 8) + 8) = *(void *)(*(void *)(a1 + 8) + 8) & (~v8 | 4) | v8 & v5;
    return v5 & a2;
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(**(void **)(a1 + 8) + 24);
    return v7();
  }
}

uint64_t sub_1000A89E0(uint64_t a1)
{
  return *(void *)(a1 + 8) + 16;
}

void sub_1000A89EC()
{
}

void sub_1000A8A60()
{
}

uint64_t sub_1000A8A84(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 40);
}

uint64_t sub_1000A8A90(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 48);
}

uint64_t sub_1000A8A9C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)sub_1000A9108(*(void *)(a1 + 8)) + 112);
  return v1();
}

uint64_t sub_1000A8AF8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)sub_1000A9108(*(void *)(a1 + 8)) + 120);
  return v1();
}

void *sub_1000A8B5C@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0xD0uLL);
  uint64_t result = sub_1000A8BB8(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1000A8BA4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1000A8BB8(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1000F3B60;
  sub_1000A8CB0((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_1000A8C00(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1000A8C14(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000F3B60;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000A8C34(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000F3B60;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_1000A8C88(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t sub_1000A8CB0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000F0888;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (std::string *)(a1 + 16);
  sub_100009CF0((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)a1 = off_1000F3BB0;
  sub_1000A9814((void *)(a1 + 56));
  *(_OWORD *)(a1 + 88) = 0u;
  unint64_t v5 = (char **)(a1 + 88);
  *(_DWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(unsigned char *)(a1 + 120) = *(unsigned char *)a2;
  *(void *)(a1 + 128) = *(void *)(a2 + 8);
  *(void *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 144) = 1;
  *(_OWORD *)(a1 + 148) = xmmword_1000CB770;
  *(_DWORD *)(a1 + 164) = 0;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  sub_100009CF0(&__str, "rational");
  std::string::operator=(v4, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  unint64_t v6 = *(void *)(a1 + 104);
  unint64_t v7 = *(void *)(a1 + 96);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - (void)*v5) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      sub_100019424();
    }
    uint64_t v11 = v6 - (void)*v5;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12) {
      float v13 = (char *)sub_10001A898(a1 + 104, v12);
    }
    else {
      float v13 = 0;
    }
    uint64_t v14 = &v13[16 * v9];
    uint64_t v15 = &v13[16 * v12];
    *(_DWORD *)uint64_t v14 = 0;
    *((void *)v14 + 1) = 0;
    uint64_t v8 = v14 + 16;
    int v17 = *(char **)(a1 + 88);
    int v16 = *(char **)(a1 + 96);
    if (v16 != v17)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v16 - 1);
        v14 -= 16;
        v16 -= 16;
      }
      while (v16 != v17);
      int v16 = *v5;
    }
    *(void *)(a1 + 88) = v14;
    *(void *)(a1 + 96) = v8;
    *(void *)(a1 + 104) = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = (char *)(v7 + 16);
  }
  *(void *)(a1 + 96) = v8;
  return a1;
}

void sub_1000A8E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v18 = v15[14];
  v15[14] = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  uint64_t v19 = *v16;
  if (*v16)
  {
    v15[12] = v19;
    operator delete(v19);
  }
  v15[7] = off_1000F0D20;
  unint64_t v20 = (std::__shared_weak_count *)v15[9];
  if (v20) {
    sub_100018BC0(v20);
  }
  sub_1000305F4((uint64_t)v15);
  _Unwind_Resume(a1);
}

void sub_1000A8F2C(void *a1)
{
  sub_1000A9004(a1);
  operator delete();
}

uint64_t sub_1000A8F64(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, 0xFFFFFFFF0007);
}

uint64_t sub_1000A8F90(uint64_t a1, uint64_t a2)
{
  if ((a2 & 4) != 0)
  {
    uint64_t v4 = sub_1000A9108(a1);
    if ((*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v4 + 56))(v4, 4, 0)) {
      *(void *)(a1 + 8) |= 4uLL;
    }
  }
  return *(void *)(a1 + 8) & a2;
}

uint64_t sub_1000A9004(void *a1)
{
  *a1 = off_1000F3BB0;
  uint64_t v2 = a1[11];
  uint64_t v3 = a1[12];
  while (v2 != v3)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    v2 += 16;
  }
  uint64_t v5 = a1[14];
  a1[14] = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  unint64_t v6 = (void *)a1[11];
  if (v6)
  {
    a1[12] = v6;
    operator delete(v6);
  }
  a1[7] = off_1000F0D20;
  unint64_t v7 = (std::__shared_weak_count *)a1[9];
  if (v7) {
    sub_100018BC0(v7);
  }
  return sub_1000305F4((uint64_t)a1);
}

uint64_t sub_1000A9108(uint64_t a1)
{
  if (!*(void *)(a1 + 112)) {
    sub_10002C600();
  }
  return *(void *)(a1 + 112);
}

void sub_1000A91E4()
{
}

void *sub_1000A9208(void *a1, uint64_t a2, int a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1000F3BF8;
  if (a3)
  {
    sub_1000A92D0(*(void *)(a2 + 8), &v10);
    long long v4 = v10;
    long long v10 = 0uLL;
    uint64_t v5 = (std::__shared_weak_count *)a1[2];
    *(_OWORD *)(a1 + 1) = v4;
    if (!v5) {
      return a1;
    }
    sub_100018BC0(v5);
    unint64_t v6 = (std::__shared_weak_count *)*((void *)&v10 + 1);
    if (!*((void *)&v10 + 1)) {
      return a1;
    }
LABEL_7:
    sub_100018BC0(v6);
    return a1;
  }
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  if (!v7)
  {
    a1[1] = v8;
    a1[2] = 0;
    return a1;
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  unint64_t v6 = (std::__shared_weak_count *)a1[2];
  a1[1] = v8;
  a1[2] = v7;
  if (v6) {
    goto LABEL_7;
  }
  return a1;
}

void sub_1000A92B8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    sub_100018BC0(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000A92D0@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  long long v4 = operator new(0xD0uLL);
  uint64_t result = sub_1000A932C(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1000A9318(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_1000A932C(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1000F3B60;
  sub_1000A9388((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_1000A9374(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A9388(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000F0888;
  *(void *)(a1 + 8) = 0;
  long long v4 = (std::string *)(a1 + 16);
  sub_100009CF0((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)a1 = off_1000F3BB0;
  *(void *)(a1 + 56) = off_1000F0D20;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 72) = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  int v6 = *(_DWORD *)(a2 + 80);
  *(void *)(a1 + 88) = 0;
  uint64_t v7 = (char **)(a1 + 88);
  *(void *)(a1 + 56) = off_1000F09A8;
  *(_DWORD *)(a1 + 80) = v6;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  uint64_t v8 = *(void *)(a2 + 112);
  if (v8) {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 72))(v8, 1);
  }
  *(void *)(a1 + 112) = v8;
  long long v9 = *(_OWORD *)(a2 + 120);
  long long v10 = *(_OWORD *)(a2 + 136);
  long long v11 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = v11;
  *(_OWORD *)(a1 + 136) = v10;
  *(_OWORD *)(a1 + 120) = v9;
  sub_100009CF0(&__str, "rational");
  std::string::operator=(v4, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  sub_1000A96E4((void **)(a1 + 88), (uint64_t)(*(void *)(a2 + 96) - *(void *)(a2 + 88)) >> 4);
  uint64_t v12 = *(void *)(a2 + 88);
  for (uint64_t i = *(void *)(a2 + 96); v12 != i; v12 += 16)
  {
    uint64_t v14 = *(void *)(v12 + 8);
    if (v14) {
      uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v14 + 72))(v14, 1);
    }
    else {
      uint64_t v15 = 0;
    }
    unint64_t v17 = *(void *)(a1 + 96);
    unint64_t v16 = *(void *)(a1 + 104);
    if (v17 >= v16)
    {
      uint64_t v19 = (uint64_t)(v17 - (void)*v7) >> 4;
      unint64_t v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60) {
        sub_100019424();
      }
      uint64_t v21 = v16 - (void)*v7;
      if (v21 >> 3 > v20) {
        unint64_t v20 = v21 >> 3;
      }
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v20;
      }
      float v23 = (char *)sub_10001A898(a1 + 104, v22);
      unint64_t v25 = &v23[16 * v19];
      *(_DWORD *)unint64_t v25 = *(_DWORD *)v12;
      *((void *)v25 + 1) = v15;
      unint64_t v27 = *(char **)(a1 + 88);
      uint64_t v26 = *(char **)(a1 + 96);
      v28 = v25;
      if (v26 != v27)
      {
        do
        {
          *((_OWORD *)v28 - 1) = *((_OWORD *)v26 - 1);
          v28 -= 16;
          v26 -= 16;
        }
        while (v26 != v27);
        uint64_t v26 = *v7;
      }
      uint64_t v18 = v25 + 16;
      *(void *)(a1 + 88) = v28;
      *(void *)(a1 + 96) = v25 + 16;
      *(void *)(a1 + 104) = &v23[16 * v24];
      if (v26) {
        operator delete(v26);
      }
    }
    else
    {
      *(_DWORD *)unint64_t v17 = *(_DWORD *)v12;
      *(void *)(v17 + 8) = v15;
      uint64_t v18 = (char *)(v17 + 16);
    }
    *(void *)(a1 + 96) = v18;
  }
  return a1;
}

void sub_1000A9654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v19 = *v17;
  if (*v17)
  {
    v15[12] = v19;
    operator delete(v19);
  }
  v15[7] = v16;
  unint64_t v20 = (std::__shared_weak_count *)v15[9];
  if (v20) {
    sub_100018BC0(v20);
  }
  sub_1000305F4((uint64_t)v15);
  _Unwind_Resume(a1);
}

void sub_1000A96E4(void **a1, unint64_t a2)
{
  long long v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      sub_100019424();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    int v6 = (char *)sub_10001A898(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    long long v9 = &v6[16 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
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

void *sub_1000A9798(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    uint64_t result = sub_100031054(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1000A97F8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000A9814(void *a1)
{
  sub_1000311AC(&v3);
  sub_100067C8C(a1, &v3);
  if (v4) {
    sub_100018BC0(v4);
  }
  *a1 = off_1000F09A8;
  return a1;
}

void sub_1000A9880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11) {
    sub_100018BC0(a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A9898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = *(_DWORD *)(a4 + 24);
  if (v8 == 1)
  {
    uint64_t v34 = 0;
    unint64_t v35 = 0;
    *(void *)unint64_t v36 = 0;
    LODWORD(v43[0]) = 0;
    if (sub_1000A9D1C(a1, (int **)a3, (uint64_t *)a4, v43, (__n128 **)&v34)) {
      sub_1000AAA1C(a1, a2, &v34, LODWORD(v43[0]));
    }
    else {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168))(a2, 4, 4);
    }
    if (v34)
    {
      unint64_t v35 = v34;
      operator delete(v34);
    }
  }
  else if (v8 >= 1)
  {
    if (*(unsigned char *)(a4 + 29)
      || (sub_10009BE14(a1, (void *)a3, a4), long long v9 = *(int **)a3, *(void *)(a3 + 8) - *(void *)a3 != 4)
      || *(float *)v9 < -INFINITY
      || *(float *)v9 > -INFINITY)
    {
      sub_10009FCB4(v43);
      sub_10009BF04(a1, v43, 1);
      float v11 = *(float *)sub_10002D8A8();
      float v42 = v11;
      uint64_t v12 = **(void **)(v43[1] + 56);
      uint64_t v13 = *(void *)(v12 + 24);
      uint64_t v14 = *(void *)(v12 + 32);
      if (v13 == v14) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = *(void *)(v12 + 24);
      }
      if (v13 != v14)
      {
        unint64_t v16 = (v14 - v13) >> 4;
        if (v16 <= 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = v16;
        }
        uint64_t v18 = (float *)(v15 + 12);
        uint64_t v19 = v18;
        do
        {
          uint64_t v20 = *(int *)v19;
          v19 += 4;
          uint64_t v21 = v20 - 1;
          if (v20 - 1 < (unint64_t)((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2))
          {
            float v22 = *(v18 - 1);
            if (v22 == -INFINITY || (float v23 = *(float *)(*(void *)a3 + 4 * v21), v23 >= -INFINITY) && v23 <= -INFINITY)
            {
              float v24 = *(float *)sub_10006ECE4();
            }
            else
            {
              BOOL v25 = v23 == INFINITY || v22 == INFINITY;
              float v24 = v22 + v23;
              if (v25) {
                float v24 = INFINITY;
              }
            }
            if (v11 == -INFINITY || v24 >= -INFINITY && v24 <= -INFINITY)
            {
              float v11 = *(float *)sub_10006ECE4();
            }
            else if (v11 >= v24)
            {
              float v11 = v24;
            }
            float v42 = v11;
          }
          uint64_t v18 = v19;
          --v17;
        }
        while (v17);
      }
      sub_1000AAEC8(a3, *(int **)a3, (int *)&v42);
      if (*(unsigned char *)(a4 + 28))
      {
        memset(__p, 0, sizeof(__p));
        int v26 = *(_DWORD *)(a4 + 16);
        LOBYTE(v34) = byte_1000FE8F8;
        unint64_t v35 = (void *)qword_1000FE900;
        *(_DWORD *)unint64_t v36 = v26;
        *(void *)&v36[4] = 0;
        char v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        sub_1000AC6E4((uint64_t)&v33, (uint64_t)v43, a3, (uint64_t)__p, (uint64_t)&v34);
      }
      int v27 = *(_DWORD *)(a4 + 24);
      float v28 = *(float *)(a4 + 16);
      int v41 = *(_DWORD *)(a4 + 32);
      sub_1000AB124((uint64_t)v43, a2, (uint64_t *)a3, v27, (float *)&v41, *(_DWORD *)(a4 + 36), v28);
      v30 = *(int **)a3;
      v29 = *(unsigned char **)(a3 + 8);
      v31 = (unsigned char *)(*(void *)a3 + 4);
      if (v31 != v29)
      {
        size_t v32 = ((v29 - (unsigned char *)v30) & 0xFFFFFFFFFFFFFFFCLL) - 4;
        memmove(*(void **)a3, v31, v32);
        v30 = (int *)((char *)v30 + v32);
      }
      *(void *)(a3 + 8) = v30;
      v43[0] = (uint64_t)off_1000F3870;
      if (v44) {
        sub_100018BC0(v44);
      }
    }
    else
    {
      long long v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168);
      v10(a2, 4, 4);
    }
  }
}

void sub_1000A9C78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (a13) {
    sub_100018BC0(a13);
  }
  if (__p) {
    operator delete(__p);
  }
  *(void *)(v21 - 104) = off_1000F3870;
  float v23 = *(std::__shared_weak_count **)(v21 - 88);
  if (v23) {
    sub_100018BC0(v23);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A9D1C(uint64_t a1, int **a2, uint64_t *a3, _DWORD *a4, __n128 **a5)
{
  a5[1] = *a5;
  *a4 = -1;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 16))(a1) == -1) {
    return 1;
  }
  memset(__p, 0, sizeof(__p));
  uint64_t v8 = *a3;
  uint64_t v110 = *((unsigned int *)a3 + 3);
  if (v110 == -1) {
    uint64_t v110 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  }
  float v9 = *(float *)sub_10002D8A8();
  a2[1] = *a2;
  (*(void (**)(void))(**(void **)(v8 + 16) + 56))(*(void *)(v8 + 16));
  for (uint64_t i = a3; (int)v110 > (unint64_t)(a2[1] - *a2); a5[1] = v25)
  {
    long long v10 = sub_10002D8A8();
    float v11 = v10;
    uint64_t v13 = a2[1];
    unint64_t v12 = (unint64_t)a2[2];
    if ((unint64_t)v13 >= v12)
    {
      uint64_t v15 = *a2;
      uint64_t v16 = v13 - *a2;
      unint64_t v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 62) {
        goto LABEL_182;
      }
      uint64_t v18 = v12 - (void)v15;
      if (v18 >> 1 > v17) {
        unint64_t v17 = v18 >> 1;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v17;
      }
      if (v19)
      {
        uint64_t v20 = (char *)sub_10002EE10((uint64_t)(a2 + 2), v19);
        uint64_t v15 = *a2;
        uint64_t v13 = a2[1];
      }
      else
      {
        uint64_t v20 = 0;
      }
      uint64_t v21 = (int *)&v20[4 * v16];
      int *v21 = *v11;
      uint64_t v14 = v21 + 1;
      while (v13 != v15)
      {
        int v22 = *--v13;
        *--uint64_t v21 = v22;
      }
      *a2 = v21;
      a2[1] = v14;
      a2[2] = (int *)&v20[4 * v19];
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      *uint64_t v13 = *v10;
      uint64_t v14 = v13 + 1;
    }
    a2[1] = v14;
    LOBYTE(v113) = 0;
    sub_10002ED68((uint64_t)__p, &v113);
    float v24 = a5[1];
    unint64_t v23 = (unint64_t)a5[2];
    if ((unint64_t)v24 >= v23)
    {
      uint64_t v26 = v24 - *a5;
      if ((unint64_t)(v26 + 1) >> 60) {
        sub_100019424();
      }
      uint64_t v27 = v23 - (void)*a5;
      uint64_t v28 = v27 >> 3;
      if (v27 >> 3 <= (unint64_t)(v26 + 1)) {
        uint64_t v28 = v26 + 1;
      }
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v28;
      }
      if (v29) {
        v30 = (char *)sub_10001A898((uint64_t)(a5 + 2), v29);
      }
      else {
        v30 = 0;
      }
      v31 = &v30[16 * v26];
      *(_OWORD *)v31 = xmmword_1000CB780;
      BOOL v25 = (__n128 *)(v31 + 16);
      uint64_t v33 = *a5;
      size_t v32 = (char *)a5[1];
      if (v32 != (char *)*a5)
      {
        do
        {
          *((_OWORD *)v31 - 1) = *((_OWORD *)v32 - 1);
          v31 -= 16;
          v32 -= 16;
        }
        while (v32 != (char *)v33);
        size_t v32 = (char *)*a5;
      }
      *a5 = (__n128 *)v31;
      a5[1] = v25;
      a5[2] = (__n128 *)&v30[16 * v29];
      if (v32) {
        operator delete(v32);
      }
    }
    else
    {
      *float v24 = (__n128)xmmword_1000CB780;
      BOOL v25 = v24 + 1;
    }
  }
  uint64_t v34 = sub_10002D854();
  unint64_t v35 = v34;
  unint64_t v36 = (unint64_t)a2[2];
  uint64_t v112 = (uint64_t)(a2 + 2);
  char v37 = a2[1];
  if ((unint64_t)v37 >= v36)
  {
    uint64_t v40 = *a2;
    uint64_t v41 = v37 - *a2;
    unint64_t v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 62) {
LABEL_182:
    }
      sub_100019424();
    uint64_t v43 = v36 - (void)v40;
    if (v43 >> 1 > v42) {
      unint64_t v42 = v43 >> 1;
    }
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v44 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v44 = v42;
    }
    if (v44)
    {
      v45 = (char *)sub_10002EE10(v112, v44);
      uint64_t v40 = *a2;
      char v37 = a2[1];
    }
    else
    {
      v45 = 0;
    }
    v46 = (int *)&v45[4 * v41];
    v47 = &v45[4 * v44];
    int *v46 = *v35;
    uint64_t v38 = v46 + 1;
    while (v37 != v40)
    {
      int v48 = *--v37;
      *--v46 = v48;
    }
    *a2 = v46;
    a2[1] = v38;
    a2[2] = (int *)v47;
    if (v40) {
      operator delete(v40);
    }
  }
  else
  {
    int *v37 = *v34;
    uint64_t v38 = v37 + 1;
  }
  a2[1] = v38;
  unint64_t v49 = (unint64_t)a5[2];
  int v50 = a5[1];
  if ((unint64_t)v50 >= v49)
  {
    uint64_t v52 = v50 - *a5;
    if ((unint64_t)(v52 + 1) >> 60) {
      sub_100019424();
    }
    uint64_t v53 = v49 - (void)*a5;
    uint64_t v54 = v53 >> 3;
    if (v53 >> 3 <= (unint64_t)(v52 + 1)) {
      uint64_t v54 = v52 + 1;
    }
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v55 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v55 = v54;
    }
    if (v55) {
      v56 = (char *)sub_10001A898((uint64_t)(a5 + 2), v55);
    }
    else {
      v56 = 0;
    }
    v57 = &v56[16 * v52];
    v58 = &v56[16 * v55];
    *(_OWORD *)v57 = xmmword_1000CB780;
    v51 = (__n128 *)(v57 + 16);
    v60 = *a5;
    v59 = (char *)a5[1];
    if (v59 != (char *)*a5)
    {
      do
      {
        *((_OWORD *)v57 - 1) = *((_OWORD *)v59 - 1);
        v57 -= 16;
        v59 -= 16;
      }
      while (v59 != (char *)v60);
      v59 = (char *)*a5;
    }
    *a5 = (__n128 *)v57;
    a5[1] = v51;
    a5[2] = (__n128 *)v58;
    if (v59) {
      operator delete(v59);
    }
  }
  else
  {
    *int v50 = (__n128)xmmword_1000CB780;
    v51 = v50 + 1;
  }
  a5[1] = v51;
  (*(void (**)(void, uint64_t))(**(void **)(v8 + 16) + 24))(*(void *)(v8 + 16), v110);
  LOBYTE(v113) = 1;
  sub_10002ED68((uint64_t)__p, &v113);
  char v108 = 0;
LABEL_72:
  if (((*(uint64_t (**)(void))(**(void **)(v8 + 16) + 48))(*(void *)(v8 + 16)) & 1) != 0
    || (uint64_t v111 = (*(uint64_t (**)(void))(**(void **)(v8 + 16) + 16))(*(void *)(v8 + 16)),
        (*(void (**)(void))(**(void **)(v8 + 16) + 32))(*(void *)(v8 + 16)),
        *(void *)((char *)__p[0] + (((unint64_t)(int)v111 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << v111),
        float v61 = *(float *)&(*a2)[(int)v111],
        ((*((unsigned char *)i + 30) != 0) & v108) == 1)
    && (float v116 = v9, v117 = v61, sub_1000AC254((uint64_t)&v113, v111, &v117, &v116)))
  {
    uint64_t v39 = 1;
    goto LABEL_177;
  }
  (*(void (**)(void *__return_ptr))(*(void *)a1 + 24))(v119);
  v62 = sub_10002D8A8();
  LODWORD(v113) = v119[0];
  HIDWORD(v119[0]) = 0;
  HIDWORD(v119[0]) = *v62;
  if (*(float *)v119 == *((float *)v119 + 1)) {
    goto LABEL_94;
  }
  (*(void (**)(long long *__return_ptr, float))(*(void *)a1 + 24))(&v113, *(float *)v119);
  if (v61 == -INFINITY || *(float *)&v113 >= -INFINITY && *(float *)&v113 <= -INFINITY)
  {
    float v63 = *(float *)sub_10006ECE4();
  }
  else
  {
    BOOL v64 = *(float *)&v113 == INFINITY || v61 == INFINITY;
    float v63 = v61 + *(float *)&v113;
    if (v64) {
      float v63 = INFINITY;
    }
  }
  if (v9 == -INFINITY || v63 >= -INFINITY && v63 <= -INFINITY)
  {
    float v63 = *(float *)sub_10006ECE4();
  }
  else if (v9 < v63)
  {
    float v63 = v9;
  }
  *(float *)&long long v113 = v9;
  *((float *)v119 + 1) = v63;
  if (v9 != v63)
  {
    *a4 = v111;
    float v9 = v63;
  }
  uint64_t v39 = 0;
  char v108 = 1;
  if (v9 != -INFINITY)
  {
LABEL_94:
    unint64_t v115 = 0;
    long long v113 = 0u;
    long long v114 = 0u;
    (*(void (**)(uint64_t, uint64_t, long long *))(*(void *)a1 + 120))(a1, v111, &v113);
    while (1)
    {
      if ((void)v113)
      {
        char v66 = (*(uint64_t (**)(void))(*(void *)v113 + 16))(v113);
        uint64_t v67 = v113;
        if (v66)
        {
          char v100 = 1;
LABEL_169:
          if (v67)
          {
            (*(void (**)(uint64_t))(*(void *)v67 + 8))(v67);
            goto LABEL_174;
          }
LABEL_172:
          if (*((void *)&v114 + 1)) {
            --**((_DWORD **)&v114 + 1);
          }
LABEL_174:
          if ((v100 & 1) == 0)
          {
            uint64_t v39 = 0;
            break;
          }
          goto LABEL_72;
        }
        if ((void)v113)
        {
          uint64_t v68 = (*(uint64_t (**)(void))(*(void *)v113 + 24))();
          goto LABEL_134;
        }
      }
      else if (v115 >= (unint64_t)v114)
      {
        char v100 = 1;
        goto LABEL_172;
      }
      uint64_t v68 = *((void *)&v113 + 1) + 16 * v115;
LABEL_134:
      while (1)
      {
        v93 = *a2;
        unint64_t v94 = *(int *)(v68 + 12);
        if (v94 < a2[1] - *a2) {
          break;
        }
        v69 = sub_10002D8A8();
        v70 = v69;
        v72 = a2[1];
        unint64_t v71 = (unint64_t)a2[2];
        if ((unint64_t)v72 >= v71)
        {
          v74 = *a2;
          uint64_t v75 = v72 - *a2;
          unint64_t v76 = v75 + 1;
          if ((unint64_t)(v75 + 1) >> 62) {
            sub_100019424();
          }
          uint64_t v77 = v71 - (void)v74;
          if (v77 >> 1 > v76) {
            unint64_t v76 = v77 >> 1;
          }
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v78 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v78 = v76;
          }
          if (v78)
          {
            v79 = (char *)sub_10002EE10(v112, v78);
            v74 = *a2;
            v72 = a2[1];
          }
          else
          {
            v79 = 0;
          }
          v80 = (int *)&v79[4 * v75];
          int *v80 = *v70;
          v73 = v80 + 1;
          while (v72 != v74)
          {
            int v81 = *--v72;
            *--v80 = v81;
          }
          *a2 = v80;
          a2[1] = v73;
          a2[2] = (int *)&v79[4 * v78];
          if (v74) {
            operator delete(v74);
          }
        }
        else
        {
          int *v72 = *v69;
          v73 = v72 + 1;
        }
        a2[1] = v73;
        BYTE4(v119[0]) = 0;
        sub_10002ED68((uint64_t)__p, (unsigned char *)v119 + 4);
        v83 = a5[1];
        unint64_t v82 = (unint64_t)a5[2];
        if ((unint64_t)v83 >= v82)
        {
          uint64_t v85 = v83 - *a5;
          if ((unint64_t)(v85 + 1) >> 60) {
            sub_100019424();
          }
          uint64_t v86 = v82 - (void)*a5;
          uint64_t v87 = v86 >> 3;
          if (v86 >> 3 <= (unint64_t)(v85 + 1)) {
            uint64_t v87 = v85 + 1;
          }
          if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v88 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v88 = v87;
          }
          if (v88) {
            v89 = (char *)sub_10001A898((uint64_t)(a5 + 2), v88);
          }
          else {
            v89 = 0;
          }
          v90 = &v89[16 * v85];
          __n128 v65 = (__n128)xmmword_1000CB780;
          *(_OWORD *)v90 = xmmword_1000CB780;
          v84 = (__n128 *)(v90 + 16);
          v92 = *a5;
          v91 = a5[1];
          if (v91 != *a5)
          {
            do
            {
              __n128 v65 = v91[-1];
              *((__n128 *)v90 - 1) = v65;
              v90 -= 16;
              --v91;
            }
            while (v91 != v92);
            v91 = *a5;
          }
          *a5 = (__n128 *)v90;
          a5[1] = v84;
          a5[2] = (__n128 *)&v89[16 * v88];
          if (v91) {
            operator delete(v91);
          }
        }
        else
        {
          __n128 v65 = (__n128)xmmword_1000CB780;
          __n128 *v83 = (__n128)xmmword_1000CB780;
          v84 = v83 + 1;
        }
        a5[1] = v84;
      }
      if (v61 == -INFINITY || (float v95 = *(float *)(v68 + 8), v95 >= -INFINITY) && v95 <= -INFINITY)
      {
        float v96 = *(float *)sub_10006ECE4();
      }
      else
      {
        BOOL v97 = v95 == INFINITY || v61 == INFINITY;
        float v98 = v61 + v95;
        if (v97) {
          float v96 = INFINITY;
        }
        else {
          float v96 = v98;
        }
      }
      v65.n128_u32[0] = v93[v94];
      if (v65.n128_f32[0] == -INFINITY || v96 >= -INFINITY && v96 <= -INFINITY)
      {
        v65.n128_u32[0] = *sub_10006ECE4();
      }
      else if (v65.n128_f32[0] >= v96)
      {
        v65.n128_f32[0] = v96;
      }
      HIDWORD(v119[0]) = 0;
      HIDWORD(v119[0]) = v93[v94];
      LODWORD(v119[0]) = v65.n128_u32[0];
      v65.n128_u32[0] = HIDWORD(v119[0]);
      if (*((float *)v119 + 1) != *(float *)v119)
      {
        float v99 = *(float *)&v93[v94];
        if (v99 == -INFINITY || v96 >= -INFINITY && v96 <= -INFINITY)
        {
          float v99 = *(float *)sub_10006ECE4();
        }
        else if (v99 >= v96)
        {
          float v99 = v96;
        }
        char v100 = 0;
        *(float *)&v93[v94] = v99;
        uint64_t v67 = v113;
        if (v99 == -INFINITY) {
          goto LABEL_169;
        }
        if ((void)v113) {
          uint64_t v101 = (*(uint64_t (**)(void))(*(void *)v113 + 40))();
        }
        else {
          uint64_t v101 = v115;
        }
        unint64_t v102 = *(int *)(v68 + 12);
        uint64_t v103 = (uint64_t)&(*a5)[v102];
        *(_DWORD *)uint64_t v103 = v111;
        *(void *)(v103 + 8) = v101;
        uint64_t v104 = **(void **)(v8 + 16);
        if ((*(void *)((char *)__p[0] + ((v102 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v102))
        {
          (*(void (**)(void))(v104 + 40))();
        }
        else
        {
          (*(void (**)(void))(v104 + 24))();
          *(void *)((char *)__p[0] + (((unint64_t)*(int *)(v68 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << *(_DWORD *)(v68 + 12);
        }
      }
      if ((void)v113) {
        (*(void (**)(void, __n128))(*(void *)v113 + 32))(v113, v65);
      }
      else {
        ++v115;
      }
    }
  }
LABEL_177:
  if (__p[0]) {
    operator delete(__p[0]);
  }
  return v39;
}

void sub_1000AA95C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000AAA1C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  (*(void (**)(uint64_t))(*(void *)a2 + 200))(a2);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 256))(a2, v8);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 264))(a2, v9);
  if (a4 != -1)
  {
    int v10 = -1;
    uint64_t v11 = a4;
    int v12 = -1;
    while (1)
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176))(a2);
      if (v10 != -1) {
        break;
      }
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24))(&v25, a1, a4);
      (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a2 + 160))(a2, v13, &v25);
LABEL_15:
      int v10 = v11;
      uint64_t v11 = *(unsigned int *)(*a3 + 16 * (int)v11);
      int v12 = v13;
      if (v11 == -1) {
        goto LABEL_18;
      }
    }
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    (*(void (**)(uint64_t, uint64_t, long long *))(*(void *)a1 + 120))(a1, v11, &v22);
    uint64_t v14 = *(void *)(*a3 + 16 * v10 + 8);
    if ((void)v22)
    {
      (*(void (**)(void, uint64_t))(*(void *)v22 + 56))(v22, v14);
      if ((void)v22)
      {
        uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v22 + 24))(v22);
        goto LABEL_11;
      }
      uint64_t v14 = v24;
    }
    else
    {
      uint64_t v24 = *(void *)(*a3 + 16 * v10 + 8);
    }
    uint64_t v15 = *((void *)&v22 + 1) + 16 * v14;
LABEL_11:
    uint64_t v19 = *(void *)v15;
    int v20 = *(_DWORD *)(v15 + 8);
    int v21 = v12;
    (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a2 + 184))(a2, v13, &v19);
    if ((void)v22)
    {
      (*(void (**)(void))(*(void *)v22 + 8))(v22);
    }
    else if (*((void *)&v23 + 1))
    {
      --**((_DWORD **)&v23 + 1);
    }
    goto LABEL_15;
  }
  uint64_t v13 = 0xFFFFFFFFLL;
LABEL_18:
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 152))(a2, v13);
  if ((*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56))(a1, 4, 0)) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168))(a2, 4, 4);
  }
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56))(a2, 0xFFFFFFFF0007, 0);
  uint64_t v17 = sub_1000C29DC(v16, 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168))(a2, v17, 0xFFFFFFFF0007);
}

void sub_1000AAE74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a11)
  {
    (*(void (**)(uint64_t))(*(void *)a11 + 8))(a11);
  }
  else if (a14)
  {
    --*a14;
  }
  _Unwind_Resume(exception_object);
}

int *sub_1000AAEC8(uint64_t a1, int *a2, int *a3)
{
  int v6 = *(int **)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  uint64_t v7 = (uint64_t)a2 - *(void *)a1;
  uint64_t v8 = v7 >> 2;
  uint64_t v9 = (int *)(*(void *)a1 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
  uint64_t v11 = a1 + 16;
  unint64_t v10 = *(void *)(a1 + 16);
  if (v5 >= v10)
  {
    unint64_t v17 = ((uint64_t)(v5 - (void)v6) >> 2) + 1;
    if (v17 >> 62) {
      sub_100019424();
    }
    uint64_t v19 = v10 - (void)v6;
    if (v19 >> 1 > v17) {
      unint64_t v17 = v19 >> 1;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v17;
    }
    uint64_t v35 = a1 + 16;
    if (v20) {
      int v21 = (char *)sub_10002EE10(a1 + 16, v20);
    }
    else {
      int v21 = 0;
    }
    long long v22 = &v21[4 * v8];
    __p = v21;
    size_t v32 = v22;
    uint64_t v33 = v22;
    uint64_t v34 = &v21[4 * v20];
    if (v8 == v20)
    {
      if (v7 < 1)
      {
        if (v6 == a2) {
          unint64_t v27 = 1;
        }
        else {
          unint64_t v27 = v7 >> 1;
        }
        uint64_t v28 = (char *)sub_10002EE10(v11, v27);
        long long v22 = &v28[v27 & 0xFFFFFFFFFFFFFFFCLL];
        __p = v28;
        size_t v32 = v22;
        uint64_t v34 = &v28[4 * v29];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        unint64_t v23 = v8 + 2;
        if (v8 >= -1) {
          unint64_t v23 = v8 + 1;
        }
        v22 -= 4 * (v23 >> 1);
        size_t v32 = v22;
      }
    }
    *(_DWORD *)long long v22 = *a3;
    uint64_t v33 = v22 + 4;
    uint64_t v9 = sub_1000AC2E0((int **)a1, &__p, v9);
    if (v33 != v32) {
      v33 += (v32 - v33 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (v9 == (int *)v5)
  {
    int *v9 = *a3;
    *(void *)(a1 + 8) = v9 + 1;
  }
  else
  {
    int v12 = v9 + 1;
    uint64_t v13 = (_DWORD *)(v5 - 4);
    if (v5 < 4)
    {
      uint64_t v15 = *(int **)(a1 + 8);
    }
    else
    {
      uint64_t v14 = (int *)(v5 - 4);
      uint64_t v15 = *(int **)(a1 + 8);
      do
      {
        int v16 = *v14++;
        *v15++ = v16;
      }
      while ((unint64_t)v14 < v5);
    }
    *(void *)(a1 + 8) = v15;
    if ((int *)v5 != v12)
    {
      uint64_t v24 = (uint64_t)(v5 - (void)v12) >> 2;
      do
        *v13-- = v6[v8 - 1 + v24--];
      while (v24 * 4);
    }
    BOOL v26 = v9 <= a3 && v15 > a3;
    int *v9 = a3[v26];
  }
  return v9;
}

void sub_1000AB0EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000AB124(uint64_t a1, uint64_t a2, uint64_t *a3, int a4, float *a5, int a6, float a7)
{
  if (a4 < 1) {
    return;
  }
  (*(void (**)(uint64_t))(*(void *)a2 + 200))(a2);
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 256))(a2, v13);
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 264))(a2, v14);
  v159 = 0;
  v160 = 0;
  v161[0] = 0;
  if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 16))(a1) != -1)
  {
    uint64_t v17 = *a3;
    uint64_t v16 = a3[1];
    if ((*(int (**)(uint64_t))(*(void *)a1 + 16))(a1) < (unint64_t)((v16 - v17) >> 2))
    {
      int v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
      uint64_t v19 = *a3;
      unint64_t v20 = sub_10002D8A8();
      LODWORD(v144) = 0;
      LODWORD(v144) = *(_DWORD *)(v19 + 4 * v18);
      LODWORD(v154) = 0;
      LODWORD(v154) = *v20;
      v15.n128_u32[0] = v144;
      if (*(float *)&v144 != *(float *)&v154)
      {
        int v21 = sub_10002D854();
        BOOL v22 = !sub_100096070((uint64_t)&v158, a5, (float *)v21);
        if (!a6) {
          LOBYTE(v22) = 0;
        }
        if (v22)
        {
          uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176))(a2);
          (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 152))(a2, v23);
          uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176))(a2);
          int v157 = *sub_10002D854();
          (*(void (**)(uint64_t, uint64_t, int *))(*(void *)a2 + 160))(a2, v24, &v157);
          if ((int)v24 >= (unint64_t)((v160 - v159) >> 3))
          {
            do
            {
              int v25 = *sub_10002D8A8();
              BOOL v26 = v160;
              if ((unint64_t)v160 >= v161[0])
              {
                uint64_t v28 = (v160 - v159) >> 3;
                unint64_t v29 = v28 + 1;
                if ((unint64_t)(v28 + 1) >> 61) {
                  sub_100019424();
                }
                uint64_t v30 = v161[0] - (void)v159;
                if ((uint64_t)(v161[0] - (void)v159) >> 2 > v29) {
                  unint64_t v29 = v30 >> 2;
                }
                if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v31 = v29;
                }
                uint64_t v33 = (char *)sub_10001943C((uint64_t)v161, v31);
                uint64_t v34 = &v33[8 * v28];
                *(_DWORD *)uint64_t v34 = -1;
                *((_DWORD *)v34 + 1) = v25;
                uint64_t v35 = v159;
                unint64_t v36 = v160;
                char v37 = v34;
                while (v36 != v35)
                {
                  int v38 = *((_DWORD *)v36 - 2);
                  v36 -= 8;
                  *((_DWORD *)v37 - 2) = v38;
                  v37 -= 8;
                  *((_DWORD *)v37 + 1) = *((_DWORD *)v36 + 1);
                }
                unint64_t v27 = v34 + 8;
                v159 = v37;
                v160 = v34 + 8;
                v161[0] = &v33[8 * v32];
                if (v35) {
                  operator delete(v35);
                }
              }
              else
              {
                *(_DWORD *)v160 = -1;
                *((_DWORD *)v26 + 1) = v25;
                unint64_t v27 = v26 + 8;
              }
              v160 = v27;
            }
            while ((int)v24 >= (unint64_t)((v27 - v159) >> 3));
          }
          int v39 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
          int v40 = *sub_10002D854();
          uint64_t v41 = &v159[8 * (int)v24];
          *(_DWORD *)uint64_t v41 = v39;
          *((_DWORD *)v41 + 1) = v40;
          v156 = 0;
          unint64_t v42 = (int *)sub_10002EE10((uint64_t)&v156, 1uLL);
          int *v42 = v24;
          v154 = v42;
          v156 = &v42[v43];
          v155 = v42 + 1;
          float v44 = *(float *)(*a3 + 4 * (*(int (**)(uint64_t))(*(void *)a1 + 16))(a1));
          if (v44 == -INFINITY || (float v45 = *a5, *a5 >= -INFINITY) && *a5 <= -INFINITY)
          {
            float v46 = *(float *)sub_10006ECE4();
          }
          else
          {
            BOOL v47 = v45 == INFINITY || v44 == INFINITY;
            float v46 = v44 + v45;
            if (v47) {
              float v46 = INFINITY;
            }
          }
          float v153 = v46;
          __p = 0;
          v151 = 0;
          v152 = 0;
          unint64_t v49 = v154;
          int v48 = (char *)v155;
          if (v154 == v155) {
            goto LABEL_178;
          }
          while (1)
          {
            v147[0] = &v159;
            v147[1] = a3;
            int v148 = -1;
            float v149 = a7;
            if (v48 - (char *)v49 >= 5)
            {
              int v50 = *v49;
              v51 = sub_1000AC370(v49, (uint64_t)v147, (unint64_t)(v48 - (char *)v49) >> 2);
              uint64_t v52 = (int *)(v48 - 4);
              if (v48 - 4 == (char *)v51)
              {
                int *v51 = v50;
              }
              else
              {
                int *v51 = *v52;
                *uint64_t v52 = v50;
                sub_1000AC420((uint64_t)v49, (uint64_t)(v51 + 1), (uint64_t)v147, v51 + 1 - v49);
              }
            }
            uint64_t v53 = *(v155 - 1);
            uint64_t v54 = (float *)&v159[8 * v53];
            unint64_t v55 = *(int *)v54;
            float v56 = v54[1];
            --v155;
            if (v55 == -1)
            {
              v57 = sub_10002D854();
            }
            else if (v55 >= (a3[1] - *a3) >> 2)
            {
              v57 = sub_10002D8A8();
            }
            else
            {
              v57 = (int *)(*a3 + 4 * v55);
            }
            float v58 = *(float *)v57;
            if (*(float *)v57 == -INFINITY || v56 >= -INFINITY && v56 <= -INFINITY)
            {
              float v59 = *(float *)sub_10006ECE4();
            }
            else
            {
              BOOL v60 = v58 == INFINITY || v56 == INFINITY;
              float v59 = v56 + v58;
              if (v60) {
                float v59 = INFINITY;
              }
            }
            *(float *)&long long v144 = v59;
            if (sub_100096070((uint64_t)&v158, &v153, (float *)&v144)
              || a6 != -1 && (*(int (**)(uint64_t))(*(void *)a2 + 136))(a2) >= a6)
            {
              goto LABEL_177;
            }
            unint64_t v61 = v55 + 1;
            v62 = (char *)__p;
            float v63 = v151;
            unint64_t v64 = (v151 - (unsigned char *)__p) >> 2;
            while (v64 <= v61)
            {
              if (v63 >= v152)
              {
                unint64_t v66 = v64 + 1;
                if ((v64 + 1) >> 62) {
                  sub_100019424();
                }
                uint64_t v67 = v152 - v62;
                if ((v152 - v62) >> 1 > v66) {
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
                  v69 = (char *)sub_10002EE10((uint64_t)&v152, v68);
                  v62 = (char *)__p;
                  float v63 = v151;
                }
                else
                {
                  v69 = 0;
                }
                v70 = &v69[4 * v64];
                *(_DWORD *)v70 = 0;
                __n128 v65 = v70 + 4;
                while (v63 != v62)
                {
                  int v71 = *((_DWORD *)v63 - 1);
                  v63 -= 4;
                  *((_DWORD *)v70 - 1) = v71;
                  v70 -= 4;
                }
                __p = v70;
                v151 = v65;
                v152 = &v69[4 * v68];
                if (v62)
                {
                  operator delete(v62);
                  v62 = (char *)__p;
                }
                else
                {
                  v62 = v70;
                }
              }
              else
              {
                *(_DWORD *)float v63 = 0;
                __n128 v65 = v63 + 4;
              }
              v151 = v65;
              unint64_t v64 = (v65 - v62) >> 2;
              float v63 = v65;
            }
            int v72 = *(_DWORD *)&v62[4 * v61];
            *(_DWORD *)&v62[4 * v61] = v72 + 1;
            if (v55 == -1)
            {
              uint64_t v104 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
              int v105 = *sub_10002D854();
              *(void *)&long long v144 = 0;
              *((void *)&v144 + 1) = __PAIR64__(v53, v105);
              (*(void (**)(uint64_t, uint64_t, long long *))(*(void *)a2 + 184))(a2, v104, &v144);
              if (*(_DWORD *)__p != a4) {
                goto LABEL_177;
              }
              goto LABEL_178;
            }
            if (v72 >= a4) {
              goto LABEL_177;
            }
            unint64_t v146 = 0;
            long long v144 = 0u;
            long long v145 = 0u;
            (*(void (**)(uint64_t, unint64_t, long long *))(*(void *)a1 + 120))(a1, v55, &v144);
            while (1)
            {
              if (!(void)v144)
              {
                if (v146 >= (unint64_t)v145) {
                  goto LABEL_134;
                }
LABEL_87:
                uint64_t v73 = *((void *)&v144 + 1) + 16 * v146;
                goto LABEL_88;
              }
              if ((*(unsigned int (**)(void))(*(void *)v144 + 16))(v144)) {
                break;
              }
              if (!(void)v144) {
                goto LABEL_87;
              }
              uint64_t v73 = (*(uint64_t (**)(void))(*(void *)v144 + 24))();
LABEL_88:
              float v74 = *(float *)(v73 + 8);
              int v75 = *(_DWORD *)(v73 + 12);
              uint64_t v141 = *(void *)v73;
              float v142 = v74;
              int v143 = v75;
              if (v56 == -INFINITY || v74 >= -INFINITY && v74 <= -INFINITY)
              {
                float v76 = *(float *)sub_10006ECE4();
              }
              else
              {
                BOOL v77 = v74 == INFINITY || v56 == INFINITY;
                float v78 = v56 + v74;
                if (v77) {
                  float v76 = INFINITY;
                }
                else {
                  float v76 = v78;
                }
              }
              uint64_t v79 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176))(a2);
              int v80 = v143;
              int v81 = v160;
              if ((unint64_t)v160 >= v161[0])
              {
                uint64_t v83 = (v160 - v159) >> 3;
                unint64_t v84 = v83 + 1;
                if ((unint64_t)(v83 + 1) >> 61) {
                  sub_100019424();
                }
                uint64_t v85 = v161[0] - (void)v159;
                if ((uint64_t)(v161[0] - (void)v159) >> 2 > v84) {
                  unint64_t v84 = v85 >> 2;
                }
                if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v86 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v86 = v84;
                }
                unint64_t v88 = (char *)sub_10001943C((uint64_t)v161, v86);
                v89 = &v88[8 * v83];
                *(_DWORD *)v89 = v80;
                *((float *)v89 + 1) = v76;
                v90 = v159;
                v91 = v160;
                v92 = v89;
                while (v91 != v90)
                {
                  int v93 = *((_DWORD *)v91 - 2);
                  v91 -= 8;
                  *((_DWORD *)v92 - 2) = v93;
                  v92 -= 8;
                  *((_DWORD *)v92 + 1) = *((_DWORD *)v91 + 1);
                }
                unint64_t v82 = v89 + 8;
                v159 = v92;
                v160 = v89 + 8;
                v161[0] = &v88[8 * v87];
                if (v90) {
                  operator delete(v90);
                }
              }
              else
              {
                *(_DWORD *)v160 = v143;
                *((float *)v81 + 1) = v76;
                unint64_t v82 = v81 + 8;
              }
              v160 = v82;
              int v143 = v53;
              (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a2 + 184))(a2, v79, &v141);
              unint64_t v94 = v155;
              if (v155 >= v156)
              {
                float v96 = v154;
                uint64_t v97 = v155 - v154;
                unint64_t v98 = v97 + 1;
                if ((unint64_t)(v97 + 1) >> 62) {
                  sub_100019424();
                }
                uint64_t v99 = (char *)v156 - (char *)v154;
                if (((char *)v156 - (char *)v154) >> 1 > v98) {
                  unint64_t v98 = v99 >> 1;
                }
                if ((unint64_t)v99 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v100 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v100 = v98;
                }
                if (v100)
                {
                  uint64_t v101 = (char *)sub_10002EE10((uint64_t)&v156, v100);
                  float v96 = v154;
                  unint64_t v94 = v155;
                }
                else
                {
                  uint64_t v101 = 0;
                }
                unint64_t v102 = (int *)&v101[4 * v97];
                *unint64_t v102 = v79;
                uint64_t v95 = (uint64_t)(v102 + 1);
                while (v94 != v96)
                {
                  int v103 = *--v94;
                  *--unint64_t v102 = v103;
                }
                v154 = v102;
                v155 = (int *)v95;
                v156 = (int *)&v101[4 * v100];
                if (v96) {
                  operator delete(v96);
                }
              }
              else
              {
                int *v155 = v79;
                uint64_t v95 = (uint64_t)(v94 + 1);
              }
              v155 = (int *)v95;
              v138[0] = &v159;
              v138[1] = a3;
              int v139 = -1;
              float v140 = a7;
              sub_1000AC420((uint64_t)v154, v95, (uint64_t)v138, (v95 - (uint64_t)v154) >> 2);
              if ((void)v144) {
                (*(void (**)(void))(*(void *)v144 + 32))(v144);
              }
              else {
                ++v146;
              }
            }
            if ((void)v144)
            {
              (*(void (**)(void))(*(void *)v144 + 8))();
            }
            else
            {
LABEL_134:
              if (*((void *)&v145 + 1)) {
                --**((_DWORD **)&v145 + 1);
              }
            }
            (*(void (**)(long long *__return_ptr, uint64_t, unint64_t))(*(void *)a1 + 24))(&v144, a1, v55);
            LODWORD(v106) = v144;
            v107 = sub_10002D8A8();
            *(float *)&long long v144 = v106;
            LODWORD(v141) = 0;
            LODWORD(v141) = *v107;
            if (v106 != *(float *)&v141)
            {
              if (v56 == -INFINITY || v106 >= -INFINITY && v106 <= -INFINITY)
              {
                float v108 = *(float *)sub_10006ECE4();
              }
              else if (v106 == INFINITY || v56 == INFINITY)
              {
                float v108 = INFINITY;
              }
              else
              {
                float v108 = v56 + v106;
              }
              uint64_t v110 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176))(a2);
              uint64_t v111 = v160;
              if ((unint64_t)v160 >= v161[0])
              {
                uint64_t v113 = (v160 - v159) >> 3;
                unint64_t v114 = v113 + 1;
                if ((unint64_t)(v113 + 1) >> 61) {
                  sub_100019424();
                }
                uint64_t v115 = v161[0] - (void)v159;
                if ((uint64_t)(v161[0] - (void)v159) >> 2 > v114) {
                  unint64_t v114 = v115 >> 2;
                }
                if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v116 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v116 = v114;
                }
                v118 = (char *)sub_10001943C((uint64_t)v161, v116);
                v119 = &v118[8 * v113];
                *(_DWORD *)v119 = -1;
                *((float *)v119 + 1) = v108;
                v120 = v159;
                v121 = v160;
                v122 = v119;
                while (v121 != v120)
                {
                  int v123 = *((_DWORD *)v121 - 2);
                  v121 -= 8;
                  *((_DWORD *)v122 - 2) = v123;
                  v122 -= 8;
                  *((_DWORD *)v122 + 1) = *((_DWORD *)v121 + 1);
                }
                uint64_t v112 = v119 + 8;
                v159 = v122;
                v160 = v119 + 8;
                v161[0] = &v118[8 * v117];
                if (v120) {
                  operator delete(v120);
                }
              }
              else
              {
                *(_DWORD *)v160 = -1;
                *((float *)v111 + 1) = v108;
                uint64_t v112 = v111 + 8;
              }
              v160 = v112;
              *(void *)&long long v144 = 0;
              *((void *)&v144 + 1) = __PAIR64__(v53, LODWORD(v106));
              (*(void (**)(uint64_t, uint64_t, long long *))(*(void *)a2 + 184))(a2, v110, &v144);
              v124 = v155;
              if (v155 >= v156)
              {
                v126 = v154;
                uint64_t v127 = v155 - v154;
                unint64_t v128 = v127 + 1;
                if ((unint64_t)(v127 + 1) >> 62) {
                  sub_100019424();
                }
                uint64_t v129 = (char *)v156 - (char *)v154;
                if (((char *)v156 - (char *)v154) >> 1 > v128) {
                  unint64_t v128 = v129 >> 1;
                }
                if ((unint64_t)v129 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v130 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v130 = v128;
                }
                if (v130)
                {
                  v131 = (char *)sub_10002EE10((uint64_t)&v156, v130);
                  v126 = v154;
                  v124 = v155;
                }
                else
                {
                  v131 = 0;
                }
                v132 = (int *)&v131[4 * v127];
                int *v132 = v110;
                uint64_t v125 = (uint64_t)(v132 + 1);
                while (v124 != v126)
                {
                  int v133 = *--v124;
                  *--v132 = v133;
                }
                v154 = v132;
                v155 = (int *)v125;
                v156 = (int *)&v131[4 * v130];
                if (v126) {
                  operator delete(v126);
                }
              }
              else
              {
                int *v155 = v110;
                uint64_t v125 = (uint64_t)(v124 + 1);
              }
              v155 = (int *)v125;
              v135[0] = &v159;
              v135[1] = a3;
              int v136 = -1;
              float v137 = a7;
              sub_1000AC420((uint64_t)v154, v125, (uint64_t)v135, (v125 - (uint64_t)v154) >> 2);
            }
LABEL_177:
            unint64_t v49 = v154;
            int v48 = (char *)v155;
            if (v154 == v155) {
LABEL_178:
            }
              sub_10006CCFC(a2);
          }
        }
      }
    }
  }
  if ((*(uint64_t (**)(uint64_t, uint64_t, void, __n128))(*(void *)a1 + 56))(a1, 4, 0, v15)) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168))(a2, 4, 4);
  }
  if (v159)
  {
    v160 = v159;
    operator delete(v159);
  }
}

void sub_1000AC108(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34)
{
  if (__p) {
    operator delete(__p);
  }
  unint64_t v36 = *(void **)(v34 - 176);
  if (v36)
  {
    *(void *)(v34 - 168) = v36;
    operator delete(v36);
  }
  char v37 = *(void **)(v34 - 144);
  if (v37)
  {
    *(void *)(v34 - 136) = v37;
    operator delete(v37);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000AC208(void *a1)
{
  *a1 = off_1000F4258;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    sub_100018BC0(v2);
  }
  return a1;
}

BOOL sub_1000AC254(uint64_t a1, uint64_t a2, float *a3, float *a4)
{
  float v5 = *a3;
  if (*a3 == -INFINITY || *a4 >= -INFINITY && *a4 <= -INFINITY)
  {
    float v5 = *(float *)sub_10006ECE4();
  }
  else if (v5 >= *a4)
  {
    float v5 = *a4;
  }
  return *a4 == v5;
}

int *sub_1000AC2E0(int **a1, void *a2, int *a3)
{
  uint64_t result = (int *)a2[1];
  float v5 = *a1;
  int v6 = result;
  if (*a1 != a3)
  {
    uint64_t v7 = a3;
    int v6 = (int *)a2[1];
    do
    {
      int v8 = *--v7;
      *--int v6 = v8;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  uint64_t v9 = a1[1];
  for (uint64_t i = (_DWORD *)a2[2]; a3 != v9; ++i)
  {
    int v11 = *a3++;
    _DWORD *i = v11;
  }
  a2[2] = i;
  int v12 = *a1;
  *a1 = v6;
  a2[1] = v12;
  uint64_t v13 = a1[1];
  a1[1] = (int *)a2[2];
  a2[2] = v13;
  uint64_t v14 = a1[2];
  a1[2] = (int *)a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

int *sub_1000AC370(int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3 && sub_1000AC4C4(a2, *v9, a1[v6 + 2]))
    {
      ++v9;
      uint64_t v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t sub_1000AC420(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v6 = result;
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (int *)(result + 4 * (v4 >> 1));
    uint64_t v9 = (int *)(a2 - 4);
    uint64_t result = sub_1000AC4C4(a3, *v8, *(_DWORD *)(a2 - 4));
    if (result)
    {
      int v10 = *v9;
      do
      {
        uint64_t v11 = v8;
        int *v9 = *v8;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (int *)(v6 + 4 * v7);
        uint64_t result = sub_1000AC4C4(a3, *v8, v10);
        uint64_t v9 = v11;
      }
      while ((result & 1) != 0);
      *uint64_t v11 = v10;
    }
  }
  return result;
}

uint64_t sub_1000AC4C4(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = **(void **)a1;
  unint64_t v7 = (int *)(v6 + 8 * a2);
  uint64_t v8 = (int *)(v6 + 8 * a3);
  sub_1000AC684(a1, *v7, (int *)&v26);
  if (v26 == -INFINITY || (float v9 = *(float *)(v6 + 8 * a2 + 4), v9 >= -INFINITY) && v9 <= -INFINITY)
  {
    float v10 = *(float *)sub_10006ECE4();
  }
  else
  {
    BOOL v11 = v9 == INFINITY || v26 == INFINITY;
    float v10 = v26 + v9;
    if (v11) {
      float v10 = INFINITY;
    }
  }
  float v27 = v10;
  sub_1000AC684(a1, *v8, (int *)&v25);
  if (v25 == -INFINITY || (float v12 = *(float *)(v6 + 8 * a3 + 4), v12 >= -INFINITY) && v12 <= -INFINITY)
  {
    float v13 = *(float *)sub_10006ECE4();
  }
  else
  {
    BOOL v14 = v12 == INFINITY || v25 == INFINITY;
    float v13 = v25 + v12;
    if (v14) {
      float v13 = INFINITY;
    }
  }
  float v26 = v13;
  int v15 = *v7;
  int v16 = *(_DWORD *)(a1 + 16);
  int v17 = *v8;
  uint64_t v18 = a1 + 24;
  if (*v7 != v16 || v17 == v16)
  {
    LODWORD(result) = sub_100096070(v18, &v26, &v27);
    int v21 = result;
    BOOL v22 = v15 != v16 && v17 == v16;
    if (v22) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = result;
    }
    if (v22 && v21)
    {
      float v23 = *(float *)(a1 + 20);
      return v27 > (float)(v23 + v26) || v26 > (float)(v23 + v27);
    }
  }
  else if (sub_100096070(v18, &v26, &v27))
  {
    return 1;
  }
  else
  {
    float v24 = *(float *)(a1 + 20);
    return v27 <= (float)(v24 + v26) && v26 <= (float)(v24 + v27);
  }
  return result;
}

float sub_1000AC684@<S0>(uint64_t a1@<X0>, int a2@<W1>, int *a3@<X8>)
{
  if (*(_DWORD *)(a1 + 16) == a2)
  {
    unint64_t v4 = sub_10002D854();
  }
  else
  {
    uint64_t v5 = **(void **)(a1 + 8);
    if (a2 >= (unint64_t)((*(void *)(*(void *)(a1 + 8) + 8) - v5) >> 2)) {
      unint64_t v4 = sub_10002D8A8();
    }
    else {
      unint64_t v4 = (int *)(v5 + 4 * a2);
    }
  }
  float result = *(float *)v4;
  *a3 = *v4;
  return result;
}

void sub_1000AC6E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  sub_1000ACB60((uint64_t)&v7, a2, &v6, &v5, a5);
}

void sub_1000AC844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  *BOOL v14 = v15;
  int v17 = (std::__shared_weak_count *)v14[2];
  if (v17) {
    sub_100018BC0(v17);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000AC894(void *a1)
{
  *a1 = off_1000F4258;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    sub_100018BC0(v1);
  }
  operator delete();
}

uint64_t sub_1000AC900(uint64_t a1)
{
  return sub_1000B2714(*(void *)(a1 + 8));
}

float sub_1000AC908@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_1000B27D8(*(uint64_t **)(a1 + 8), a2, a3);
}

uint64_t sub_1000AC910(uint64_t a1, uint64_t a2)
{
  return sub_1000B289C(*(void **)(a1 + 8), a2);
}

uint64_t sub_1000AC918(uint64_t a1, uint64_t a2)
{
  return sub_1000B2928(*(void **)(a1 + 8), a2);
}

uint64_t sub_1000AC920(uint64_t a1, uint64_t a2)
{
  return sub_1000B29AC(*(void **)(a1 + 8), a2);
}

uint64_t sub_1000AC928(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v8 = 0;
    unint64_t v5 = sub_1000A0E2C(a1, a2, &v8);
    *(void *)(*(void *)(a1 + 8) + 8) = *(void *)(*(void *)(a1 + 8) + 8) & (~v8 | 4) | v8 & v5;
    return v5 & a2;
  }
  else
  {
    char v7 = *(uint64_t (**)(void))(**(void **)(a1 + 8) + 24);
    return v7();
  }
}

uint64_t sub_1000AC9DC(uint64_t a1)
{
  return *(void *)(a1 + 8) + 16;
}

void sub_1000AC9E8()
{
}

void sub_1000ACA40()
{
}

uint64_t sub_1000ACA64(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 40);
}

uint64_t sub_1000ACA70(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 48);
}

void sub_1000ACA7C()
{
}

void sub_1000ACB34()
{
}

uint64_t sub_1000ACB58(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000B2E20(*(void *)(a1 + 8), a2, a3);
}

void sub_1000ACB60(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  float v9 = operator new(0xD8uLL);
  sub_1000ACBDC(v9, a2, a3, a4, a5);
}

void sub_1000ACBC8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1000ACBDC(void *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1000F3D58;
  sub_1000ACCDC((uint64_t)(a1 + 3), a2, *a3, *a4, a5);
}

void sub_1000ACC2C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1000ACC40(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000F3D58;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000ACC60(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000F3D58;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_1000ACCB4(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1000ACCDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_1000ACEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_1000AFC40(v19, 0);
  int v21 = (uint64_t *)v18[22];
  v18[22] = 0;
  if (v21) {
    sub_1000AFD74((uint64_t)(v18 + 22), v21);
  }
  sub_1000AD170(v18);
  _Unwind_Resume(a1);
}

void sub_1000ACF74(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1000AD104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v17 = *(void *)(v15 + 136);
  *(void *)(v15 + 136) = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  sub_1000AF8A4(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_1000AD170(void *a1)
{
  *a1 = off_1000F3E58;
  uint64_t v2 = a1[17];
  a1[17] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return sub_1000AF8A4((uint64_t)a1);
}

uint64_t sub_1000AD1F0(uint64_t a1)
{
  *(void *)a1 = off_1000F3DA8;
  sub_1000AFC40((void **)(a1 + 184), 0);
  uint64_t v2 = *(uint64_t **)(a1 + 176);
  *(void *)(a1 + 176) = 0;
  if (v2) {
    sub_1000AFD74(a1 + 176, v2);
  }
  *(void *)a1 = off_1000F3E58;
  uint64_t v3 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return sub_1000AF8A4(a1);
}

void sub_1000AD2A8(uint64_t a1)
{
  *(void *)a1 = off_1000F3DA8;
  sub_1000AFC40((void **)(a1 + 184), 0);
  uint64_t v2 = *(uint64_t **)(a1 + 176);
  *(void *)(a1 + 176) = 0;
  if (v2) {
    sub_1000AFD74(a1 + 176, v2);
  }
  *(void *)a1 = off_1000F3E58;
  uint64_t v3 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  sub_1000AF8A4(a1);
  operator delete();
}

uint64_t sub_1000AD374(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, 0xFFFFFFFF0007);
}

uint64_t sub_1000AD3A0(uint64_t a1, uint64_t a2)
{
  if ((a2 & 4) != 0
    && (*(uint64_t (**)(void, uint64_t, void))(**(void **)(a1 + 136) + 56))(*(void *)(a1 + 136), 4, 0))
  {
    *(void *)(a1 + 8) |= 4uLL;
  }
  return *(void *)(a1 + 8) & a2;
}

void sub_1000AD410()
{
}

void sub_1000AD458()
{
}

void sub_1000AD47C(void *a1, int a2)
{
  v9[0] = 0;
  v9[1] = 0;
  uint64_t v8 = (float ***)v9;
  sub_1000B0B8C(a1, a2, &v8);
  unint64_t v4 = v8;
  if (v8 != v9)
  {
    do
    {
      sub_1000B0E4C((uint64_t)a1, a2, v4 + 5);
      unint64_t v5 = v4[1];
      if (v5)
      {
        do
        {
          uint64_t v6 = (float ***)v5;
          unint64_t v5 = (float **)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          uint64_t v6 = (float ***)v4[2];
          BOOL v7 = *v6 == (float **)v4;
          unint64_t v4 = v6;
        }
        while (!v7);
      }
      unint64_t v4 = v6;
    }
    while (v6 != v9);
  }
  sub_1000B0EBC((uint64_t)a1, a2);
  sub_10001B844((uint64_t)&v8, v9[0]);
}

void sub_1000AD534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t sub_1000AD550(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 136) + 16))(*(void *)(a1 + 136));
  if (result != -1)
  {
    sub_10002D854();
    operator new();
  }
  return result;
}

int *sub_1000AD62C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int *a3@<X8>)
{
  unint64_t v5 = *(float ***)(*(void *)(*(void *)(a1 + 184) + 112) + 8 * a2);
  uint64_t result = sub_10002D8A8();
  float v7 = *(float *)result;
  *a3 = *result;
  for (uint64_t i = *v5; i; uint64_t i = *(float **)i)
  {
    uint64_t result = (int *)(*(void *(**)(uint64_t *__return_ptr))(**(void **)(a1 + 136) + 24))(&v12);
    float v9 = i[3];
    if (v9 == -INFINITY || *(float *)&v12 >= -INFINITY && *(float *)&v12 <= -INFINITY)
    {
      uint64_t result = sub_10006ECE4();
      float v10 = *(float *)result;
    }
    else
    {
      BOOL v11 = *(float *)&v12 == INFINITY || v9 == INFINITY;
      float v10 = v9 + *(float *)&v12;
      if (v11) {
        float v10 = INFINITY;
      }
    }
    if (v7 == -INFINITY || v10 >= -INFINITY && v10 <= -INFINITY)
    {
      uint64_t result = sub_10006ECE4();
      float v7 = *(float *)result;
    }
    else if (v7 >= v10)
    {
      float v7 = v10;
    }
    *(float *)a3 = v7;
    if (v7 >= -INFINITY && v7 <= -INFINITY) {
      *(void *)(a1 + 8) |= 4uLL;
    }
  }
  return result;
}

void sub_1000AD76C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000F35F0;
  *(void *)(a1 + 8) = 0;
  sub_100009CF0((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)a1 = off_1000F3EA8;
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 60) = 0xFFFFFFFFLL;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0xFFFFFFFF00000000;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)a2;
  *(void *)(a1 + 112) = *(void *)(a2 + 8);
  operator new();
}

void sub_1000AD880()
{
}

void sub_1000AD8C4(uint64_t a1)
{
  sub_1000AF8A4(a1);
  operator delete();
}

void sub_1000AD8FC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)a1 = *a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = a1 + 32;
  *(void *)(a1 + 40) = a1 + 32;
  *(void *)(a1 + 48) = 0;
  operator new();
}

void sub_1000AD9F8(_Unwind_Exception *a1)
{
  sub_10007EB1C(v4);
  sub_10007EB1C(v1 + 9);
  sub_10007CD78(v2);
  sub_10007EB1C(v1 + 7);
  uint64_t v6 = *v3;
  if (*v3)
  {
    v1[2] = v6;
    operator delete(v6);
  }
  _Unwind_Resume(a1);
}

void *sub_1000ADA50(void *a1)
{
  uint64_t v2 = a1[2];
  if (v2 != a1[1])
  {
    unint64_t v3 = 0;
    uint64_t v2 = a1[1];
    do
    {
      sub_1000ADAC8(*(void *)(v2 + 8 * v3++), a1 + 9);
      uint64_t v2 = a1[1];
    }
    while (v3 < (a1[2] - v2) >> 3);
  }
  a1[2] = v2;
  return sub_10007CD78(a1 + 4);
}

uint64_t sub_1000ADAC8(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = (uint64_t *)(result + 24);
    sub_1000ADB28(&v4);
    sub_10007EB1C((uint64_t *)(v3 + 48));
    uint64_t result = sub_1000AEA8C(*a2);
    *(void *)(v3 + 64) = *(void *)(result + 56);
    *(void *)(result + 56) = v3;
  }
  return result;
}

void sub_1000ADB28(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)**a1;
  if (v2)
  {
    v1[1] = (uint64_t)v2;
    sub_1000ADB64(v1 + 3, v2, (v1[2] - (uint64_t)v2) >> 4);
  }
}

void sub_1000ADB64(uint64_t *a1, void *__p, unint64_t a3)
{
  if (a3 == 2)
  {
    uint64_t v4 = sub_1000ADE84(*a1);
    if (!__p) {
      return;
    }
    __p[4] = *(void *)(v4 + 56);
    goto LABEL_22;
  }
  if (a3 == 1)
  {
    uint64_t v4 = sub_1000ADC84(*a1);
    if (!__p) {
      return;
    }
    __p[2] = *(void *)(v4 + 56);
LABEL_22:
    *(void *)(v4 + 56) = __p;
    return;
  }
  if (a3 <= 4)
  {
    uint64_t v4 = sub_1000AE084(*a1);
    if (!__p) {
      return;
    }
    __p[8] = *(void *)(v4 + 56);
    goto LABEL_22;
  }
  if (a3 <= 8)
  {
    uint64_t v4 = sub_1000AE284(*a1);
    if (!__p) {
      return;
    }
    __p[16] = *(void *)(v4 + 56);
    goto LABEL_22;
  }
  if (a3 <= 0x10)
  {
    uint64_t v4 = sub_1000AE484(*a1);
    if (!__p) {
      return;
    }
    __p[32] = *(void *)(v4 + 56);
    goto LABEL_22;
  }
  if (a3 <= 0x20)
  {
    uint64_t v4 = sub_1000AE684(*a1);
    if (!__p) {
      return;
    }
    __p[64] = *(void *)(v4 + 56);
    goto LABEL_22;
  }
  if (a3 <= 0x40)
  {
    uint64_t v4 = sub_1000AE888(*a1);
    if (!__p) {
      return;
    }
    __p[128] = *(void *)(v4 + 56);
    goto LABEL_22;
  }
  operator delete(__p);
}

uint64_t sub_1000ADC84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x87)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x11uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 128)) {
    operator new();
  }
  return *(void *)(v1 + 128);
}

void sub_1000ADD70()
{
}

void *sub_1000ADD94(void *a1)
{
  *a1 = off_1000F1630;
  a1[1] = off_1000F1658;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000ADDFC(void *a1)
{
  *a1 = off_1000F1630;
  a1[1] = off_1000F1658;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000ADE84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x107)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x21uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 256)) {
    operator new();
  }
  return *(void *)(v1 + 256);
}

void sub_1000ADF70()
{
}

void *sub_1000ADF94(void *a1)
{
  *a1 = off_1000F16F0;
  a1[1] = off_1000F1718;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000ADFFC(void *a1)
{
  *a1 = off_1000F16F0;
  a1[1] = off_1000F1718;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AE084(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x207)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x41uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 512)) {
    operator new();
  }
  return *(void *)(v1 + 512);
}

void sub_1000AE170()
{
}

void *sub_1000AE194(void *a1)
{
  *a1 = off_1000F17B0;
  a1[1] = off_1000F17D8;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AE1FC(void *a1)
{
  *a1 = off_1000F17B0;
  a1[1] = off_1000F17D8;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AE284(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x407)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x81uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 1024)) {
    operator new();
  }
  return *(void *)(v1 + 1024);
}

void sub_1000AE370()
{
}

void *sub_1000AE394(void *a1)
{
  *a1 = off_1000F1870;
  a1[1] = off_1000F1898;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AE3FC(void *a1)
{
  *a1 = off_1000F1870;
  a1[1] = off_1000F1898;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AE484(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x807)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x101uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 2048)) {
    operator new();
  }
  return *(void *)(v1 + 2048);
}

void sub_1000AE570()
{
}

void *sub_1000AE594(void *a1)
{
  *a1 = off_1000F1930;
  a1[1] = off_1000F1958;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AE5FC(void *a1)
{
  *a1 = off_1000F1930;
  a1[1] = off_1000F1958;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AE684(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) >> 3 <= 0x200)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x201uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 4096)) {
    operator new();
  }
  return *(void *)(v1 + 4096);
}

void sub_1000AE774()
{
}

void *sub_1000AE798(void *a1)
{
  *a1 = off_1000F19F0;
  a1[1] = off_1000F1A18;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AE800(void *a1)
{
  *a1 = off_1000F19F0;
  a1[1] = off_1000F1A18;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AE888(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) >> 3 <= 0x400)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x401uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 0x2000)) {
    operator new();
  }
  return *(void *)(v1 + 0x2000);
}

void sub_1000AE978()
{
}

void *sub_1000AE99C(void *a1)
{
  *a1 = off_1000F1AB0;
  a1[1] = off_1000F1AD8;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AEA04(void *a1)
{
  *a1 = off_1000F1AB0;
  a1[1] = off_1000F1AD8;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AEA8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x207)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x41uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 512)) {
    operator new();
  }
  return *(void *)(v1 + 512);
}

void sub_1000AEB78()
{
}

void *sub_1000AEB9C(void *a1)
{
  *a1 = off_1000F17B0;
  a1[1] = off_1000F17D8;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AEC04(void *a1)
{
  *a1 = off_1000F17B0;
  a1[1] = off_1000F17D8;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AEC8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x407)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x81uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 1024)) {
    operator new();
  }
  return *(void *)(v1 + 1024);
}

void sub_1000AED78()
{
}

void *sub_1000AED9C(void *a1)
{
  *a1 = off_1000F1870;
  a1[1] = off_1000F1898;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AEE04(void *a1)
{
  *a1 = off_1000F1870;
  a1[1] = off_1000F1898;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AEE8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x807)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x101uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 2048)) {
    operator new();
  }
  return *(void *)(v1 + 2048);
}

void sub_1000AEF78()
{
}

void *sub_1000AEF9C(void *a1)
{
  *a1 = off_1000F1930;
  a1[1] = off_1000F1958;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AF004(void *a1)
{
  *a1 = off_1000F1930;
  a1[1] = off_1000F1958;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AF08C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) >> 3 <= 0x200)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x201uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 4096)) {
    operator new();
  }
  return *(void *)(v1 + 4096);
}

void sub_1000AF17C()
{
}

void *sub_1000AF1A0(void *a1)
{
  *a1 = off_1000F19F0;
  a1[1] = off_1000F1A18;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AF208(void *a1)
{
  *a1 = off_1000F19F0;
  a1[1] = off_1000F1A18;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AF290(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) >> 3 <= 0x400)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x401uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 0x2000)) {
    operator new();
  }
  return *(void *)(v1 + 0x2000);
}

void sub_1000AF380()
{
}

void *sub_1000AF3A4(void *a1)
{
  *a1 = off_1000F1AB0;
  a1[1] = off_1000F1AD8;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AF40C(void *a1)
{
  *a1 = off_1000F1AB0;
  a1[1] = off_1000F1AD8;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AF494(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) >> 3 <= 0x800)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x801uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 0x4000)) {
    operator new();
  }
  return *(void *)(v1 + 0x4000);
}

void sub_1000AF584()
{
}

void *sub_1000AF5A8(void *a1)
{
  *a1 = off_1000F1CB0;
  a1[1] = off_1000F1CD8;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AF610(void *a1)
{
  *a1 = off_1000F1CB0;
  a1[1] = off_1000F1CD8;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AF698(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (uint64_t *)(a1 + 16);
  if ((unint64_t)(*(void *)(a1 + 24) - v1) <= 0x8007)
  {
    sub_100079988((uint64_t *)(a1 + 16), 0x1001uLL);
    uint64_t v1 = *v2;
  }
  if (!*(void *)(v1 + 0x8000)) {
    operator new();
  }
  return *(void *)(v1 + 0x8000);
}

void sub_1000AF790()
{
}

void *sub_1000AF7B4(void *a1)
{
  *a1 = off_1000F1D70;
  a1[1] = off_1000F1D98;
  sub_10002E6EC(a1 + 4);
  return a1;
}

void sub_1000AF81C(void *a1)
{
  *a1 = off_1000F1D70;
  a1[1] = off_1000F1D98;
  sub_10002E6EC(a1 + 4);
  operator delete();
}

uint64_t sub_1000AF8A4(uint64_t a1)
{
  *(void *)a1 = off_1000F3EA8;
  if (*(unsigned char *)(a1 + 129))
  {
    uint64_t v2 = *(uint64_t **)(a1 + 120);
    if (v2)
    {
      sub_1000AF928(v2);
      operator delete();
    }
  }
  uint64_t v3 = *(void **)(a1 + 72);
  if (v3) {
    operator delete(v3);
  }
  return sub_1000A0B5C(a1);
}

uint64_t *sub_1000AF928(uint64_t *a1)
{
  sub_1000ADA50(a1);
  sub_10007EB1C(a1 + 10);
  sub_10007EB1C(a1 + 9);
  sub_10007CD78(a1 + 4);
  sub_10007EB1C(a1 + 7);
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = (uint64_t)v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1000AF984(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    operator new();
  }
  *a1 = a3;
  if (!a4) {
    operator new();
  }
  a1[1] = a4;
  a1[2] = a1;
  a1[3] = a1;
  sub_1000AFA9C();
}

void sub_1000AFA30(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *v1;
  *uint64_t v1 = 0;
  if (v3) {
    operator delete();
  }
  _Unwind_Resume(exception_object);
}

void sub_1000AFA9C()
{
}

void sub_1000AFB84(_Unwind_Exception *a1)
{
  sub_1000AFBA8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000AFBA8(uint64_t a1)
{
  sub_1000AFBEC(a1, *(void **)(a1 + 24));
  sub_10007EB1C((uint64_t *)(a1 + 32));
  return sub_10007F1BC(a1);
}

uint64_t sub_1000AFBEC(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    do
    {
      uint64_t v4 = (void *)*v2;
      uint64_t result = sub_100080EE0(*(void *)(v3 + 32));
      v2[3] = *(void *)(result + 56);
      *(void *)(result + 56) = v2;
      uint64_t v2 = v4;
    }
    while (v4);
  }
  return result;
}

void *sub_1000AFC40(void **a1, void *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_1000AFC90(result);
    operator delete();
  }
  return result;
}

void *sub_1000AFC90(void *a1)
{
  uint64_t v4 = a1 + 14;
  uint64_t v2 = (void *)a1[14];
  uint64_t v3 = v4[1];
  if ((int)((unint64_t)(v3 - (void)v2) >> 3) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = (void **)v2[v5];
      if (v6)
      {
        float v7 = *v6;
        if (*v6)
        {
          do
          {
            uint64_t v8 = (void *)*v7;
            operator delete(v7);
            float v7 = v8;
          }
          while (v8);
        }
        *uint64_t v6 = 0;
        operator delete();
      }
      ++v5;
    }
    while (v5 < (int)((unint64_t)(v3 - (void)v2) >> 3));
  }
  if (v2)
  {
    a1[15] = v2;
    operator delete(v2);
  }
  sub_1000AFBA8((uint64_t)(a1 + 5));
  uint64_t v9 = a1[2];
  a1[2] = 0;
  if (v9) {
    operator delete();
  }
  uint64_t v10 = a1[1];
  a1[1] = 0;
  if (v10) {
    operator delete();
  }
  return a1;
}

void sub_1000AFD74(uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v2 = *a2;
    *a2 = 0;
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    operator delete();
  }
}

void sub_1000AFDF0(uint64_t a1, uint64_t a2)
{
}

void sub_1000AFF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_1000AFC40(v19, 0);
  int v21 = (uint64_t *)v18[22];
  v18[22] = 0;
  if (v21) {
    sub_1000AFD74((uint64_t)(v18 + 22), v21);
  }
  sub_1000AD170(v18);
  _Unwind_Resume(a1);
}

void sub_1000B0034(uint64_t a1, uint64_t a2)
{
}

void sub_1000B013C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  uint64_t v17 = *(void *)(v15 + 136);
  *(void *)(v15 + 136) = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  sub_1000AF8A4(v15);
  _Unwind_Resume(a1);
}

void sub_1000B01A4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000F35F0;
  *(void *)(a1 + 8) = 0;
  sub_100009CF0((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)a1 = off_1000F3EA8;
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 60) = 0xFFFFFFFFLL;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0xFFFFFFFF00000000;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  operator new();
}

void sub_1000B0338()
{
}

uint64_t sub_1000B0378(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_1000B04E4((void *)a1, a2);
    *(void *)(a1 + 64) = *(void *)(a1 + 40);
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
    if (*(_DWORD *)(a2 + 92) == -1) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = sub_1000B03EC(a1, 0);
    }
    *(void *)(a1 + 96) = v4;
  }
  return a1;
}

void *sub_1000B03EC(uint64_t a1, int a2)
{
  int v13 = a2;
  uint64_t v3 = a2;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v4 = a1 + 8;
  if (a2 >= (unint64_t)((v6 - v5) >> 3))
  {
    uint64_t v12 = 0;
    sub_100083714(v4, a2 + 1, &v12);
  }
  else
  {
    float v7 = *(void **)(v5 + 8 * a2);
    if (v7) {
      return v7;
    }
  }
  float v7 = sub_1000B06C0((uint64_t *)(a1 + 72), 1uLL);
  *(_DWORD *)float v7 = *sub_10002D8A8();
  v7[5] = 0;
  *(_OWORD *)(v7 + 3) = 0u;
  *(_OWORD *)(v7 + 1) = 0u;
  uint64_t v8 = *(void *)(a1 + 80);
  v7[6] = v8;
  ++*(void *)(v8 + 8);
  v7[7] = 0;
  *(void *)(*(void *)(a1 + 8) + 8 * v3) = v7;
  if (*(unsigned char *)a1)
  {
    uint64_t v9 = sub_100082E58(a1 + 32, 0, 0, &v13);
    uint64_t v10 = *(void *)(a1 + 32);
    void *v9 = v10;
    v9[1] = a1 + 32;
    *(void *)(v10 + 8) = v9;
    *(void *)(a1 + 32) = v9;
    ++*(void *)(a1 + 48);
  }
  return v7;
}

void sub_1000B04E4(void *a1, uint64_t a2)
{
  sub_1000ADA50(a1);
  uint64_t v4 = (char **)(a1 + 1);
  sub_1000306A4((void **)a1 + 1, (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
  int v23 = 0;
  uint64_t v5 = *(void *)(a2 + 8);
  if (*(void *)(a2 + 16) != v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)(v5 + 8 * v6);
      if (v7)
      {
        uint64_t v8 = sub_1000B06C0(a1 + 9, 1uLL);
        *(_DWORD *)uint64_t v8 = *(_DWORD *)v7;
        *(_OWORD *)(v8 + 1) = *(_OWORD *)(v7 + 8);
        sub_1000B0884(v8 + 3, *(void *)(v7 + 24), *(void *)(v7 + 32), a1 + 10);
        *((_DWORD *)v8 + 14) = *(_DWORD *)(v7 + 56);
        *((_DWORD *)v8 + 15) = 0;
        if (*(unsigned char *)a1)
        {
          uint64_t v9 = sub_100082E58((uint64_t)(a1 + 4), 0, 0, &v23);
          uint64_t v10 = a1[4];
          void *v9 = v10;
          v9[1] = a1 + 4;
          *(void *)(v10 + 8) = v9;
          a1[4] = v9;
          ++a1[6];
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
      uint64_t v12 = (void *)a1[2];
      unint64_t v11 = a1[3];
      if ((unint64_t)v12 >= v11)
      {
        uint64_t v14 = ((char *)v12 - *v4) >> 3;
        if ((unint64_t)(v14 + 1) >> 61) {
          sub_100019424();
        }
        uint64_t v15 = v11 - (void)*v4;
        uint64_t v16 = v15 >> 2;
        if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
          uint64_t v16 = v14 + 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v16;
        }
        if (v17) {
          uint64_t v18 = (char *)sub_10001943C((uint64_t)(a1 + 3), v17);
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = &v18[8 * v14];
        *(void *)uint64_t v19 = v8;
        int v13 = v19 + 8;
        int v21 = (char *)a1[1];
        unint64_t v20 = (char *)a1[2];
        if (v20 != v21)
        {
          do
          {
            uint64_t v22 = *((void *)v20 - 1);
            v20 -= 8;
            *((void *)v19 - 1) = v22;
            v19 -= 8;
          }
          while (v20 != v21);
          unint64_t v20 = *v4;
        }
        a1[1] = v19;
        a1[2] = v13;
        a1[3] = &v18[8 * v17];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *uint64_t v12 = v8;
        int v13 = v12 + 1;
      }
      a1[2] = v13;
      unint64_t v6 = ++v23;
      uint64_t v5 = *(void *)(a2 + 8);
    }
    while (v6 < (*(void *)(a2 + 16) - v5) >> 3);
  }
}

void *sub_1000B06C0(uint64_t *a1, unint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v2 = sub_1000AEC8C(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080B6C((void *)(v2 + 8), 1);
      result[16] = 0;
      return result;
    }
    uint64_t v4 = result[16];
    goto LABEL_26;
  }
  if (a2 == 1)
  {
    uint64_t v2 = sub_1000AEA8C(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080A78((void *)(v2 + 8), 1);
      result[8] = 0;
      return result;
    }
    uint64_t v4 = result[8];
LABEL_26:
    *(void *)(v2 + 56) = v4;
    return result;
  }
  if (a2 <= 4)
  {
    uint64_t v2 = sub_1000AEE8C(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080C60((void *)(v2 + 8), 1);
      result[32] = 0;
      return result;
    }
    uint64_t v4 = result[32];
    goto LABEL_26;
  }
  if (a2 <= 8)
  {
    uint64_t v2 = sub_1000AF08C(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080D54((void *)(v2 + 8), 1);
      result[64] = 0;
      return result;
    }
    uint64_t v4 = result[64];
    goto LABEL_26;
  }
  if (a2 <= 0x10)
  {
    uint64_t v2 = sub_1000AF290(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100082874((void *)(v2 + 8), 1);
      result[128] = 0;
      return result;
    }
    uint64_t v4 = result[128];
    goto LABEL_26;
  }
  if (a2 <= 0x20)
  {
    uint64_t v2 = sub_1000AF494(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100082968((void *)(v2 + 8), 1);
      result[256] = 0;
      return result;
    }
    uint64_t v4 = result[256];
    goto LABEL_26;
  }
  if (a2 <= 0x40)
  {
    uint64_t v2 = sub_1000AF698(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100082A5C((void *)(v2 + 8), 1);
      result[512] = 0;
      return result;
    }
    uint64_t v4 = result[512];
    goto LABEL_26;
  }
  if (a2 >> 58) {
    sub_100018AF4();
  }
  return operator new(a2 << 6);
}

void *sub_1000B0884(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v5 = *a4;
  a1[3] = *a4;
  ++*(void *)(v5 + 8);
  sub_1000B08E8(a1, a2, a3, (a3 - a2) >> 4);
  return a1;
}

void sub_1000B08D4(_Unwind_Exception *a1)
{
  sub_10007EB1C(v1);
  _Unwind_Resume(a1);
}

void *sub_1000B08E8(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = sub_1000B097C(result, a4);
    uint64_t v7 = v6[1];
    while (a2 != a3)
    {
      *(void *)uint64_t v7 = *(void *)a2;
      *(_DWORD *)(v7 + 8) = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(v7 + 12) = *(_DWORD *)(a2 + 12);
      v7 += 16;
      a2 += 16;
    }
    v6[1] = v7;
  }
  return result;
}

void sub_1000B0968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9)
{
}

void *sub_1000B097C(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100019424();
  }
  uint64_t result = sub_1000B09C8(a1 + 3, a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * a2];
  return result;
}

void *sub_1000B09C8(uint64_t *a1, unint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v2 = sub_1000ADE84(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080984((void *)(v2 + 8), 1);
      result[4] = 0;
      return result;
    }
    uint64_t v4 = result[4];
    goto LABEL_26;
  }
  if (a2 == 1)
  {
    uint64_t v2 = sub_1000ADC84(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080890((void *)(v2 + 8), 1);
      result[2] = 0;
      return result;
    }
    uint64_t v4 = result[2];
LABEL_26:
    *(void *)(v2 + 56) = v4;
    return result;
  }
  if (a2 <= 4)
  {
    uint64_t v2 = sub_1000AE084(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080A78((void *)(v2 + 8), 1);
      result[8] = 0;
      return result;
    }
    uint64_t v4 = result[8];
    goto LABEL_26;
  }
  if (a2 <= 8)
  {
    uint64_t v2 = sub_1000AE284(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080B6C((void *)(v2 + 8), 1);
      result[16] = 0;
      return result;
    }
    uint64_t v4 = result[16];
    goto LABEL_26;
  }
  if (a2 <= 0x10)
  {
    uint64_t v2 = sub_1000AE484(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080C60((void *)(v2 + 8), 1);
      result[32] = 0;
      return result;
    }
    uint64_t v4 = result[32];
    goto LABEL_26;
  }
  if (a2 <= 0x20)
  {
    uint64_t v2 = sub_1000AE684(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100080D54((void *)(v2 + 8), 1);
      result[64] = 0;
      return result;
    }
    uint64_t v4 = result[64];
    goto LABEL_26;
  }
  if (a2 <= 0x40)
  {
    uint64_t v2 = sub_1000AE888(*a1);
    uint64_t result = *(void **)(v2 + 56);
    if (!result)
    {
      uint64_t result = (void *)sub_100082874((void *)(v2 + 8), 1);
      result[128] = 0;
      return result;
    }
    uint64_t v4 = result[128];
    goto LABEL_26;
  }
  if (a2 >> 60) {
    sub_100018AF4();
  }
  return operator new(16 * a2);
}

void sub_1000B0B8C(void *a1, int a2, void *a3)
{
  uint64_t v5 = **(float ***)(*(void *)(a1[23] + 112) + 8 * a2);
  if (!v5) {
    goto LABEL_26;
  }
  do
  {
    uint64_t v6 = *((unsigned int *)v5 + 2);
    uint64_t v7 = a1[17];
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v22 = 0;
    (*(void (**)(uint64_t, uint64_t, long long *))(*(void *)v7 + 120))(v7, v6, &v20);
    while (1)
    {
      if (!(void)v20)
      {
        if (v22 >= (unint64_t)v21) {
          goto LABEL_23;
        }
LABEL_8:
        uint64_t v8 = *((void *)&v20 + 1) + 16 * v22;
        goto LABEL_9;
      }
      if ((*(unsigned int (**)(void))(*(void *)v20 + 16))(v20)) {
        break;
      }
      if (!(void)v20) {
        goto LABEL_8;
      }
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v20 + 24))();
LABEL_9:
      int v9 = *(_DWORD *)(v8 + 12);
      float v10 = v5[3];
      if (v10 == -INFINITY || (float v11 = *(float *)(v8 + 8), v11 >= -INFINITY) && v11 <= -INFINITY)
      {
        float v12 = *(float *)sub_10006ECE4();
      }
      else
      {
        BOOL v13 = v11 == INFINITY || v10 == INFINITY;
        float v12 = v10 + v11;
        if (v13) {
          float v12 = INFINITY;
        }
      }
      v19[0] = v9;
      *(float *)&v19[1] = v12;
      sub_1000B0F58(a1[22], (_DWORD *)v8, (uint64_t)(v5 + 2), v19, (uint64_t)a3);
      if ((void)v20) {
        (*(void (**)(void))(*(void *)v20 + 32))(v20);
      }
      else {
        ++v22;
      }
    }
    if ((void)v20)
    {
      (*(void (**)(void))(*(void *)v20 + 8))();
      goto LABEL_25;
    }
LABEL_23:
    if (*((void *)&v21 + 1)) {
      --**((_DWORD **)&v21 + 1);
    }
LABEL_25:
    uint64_t v5 = *(float **)v5;
  }
  while (v5);
LABEL_26:
  uint64_t v16 = (void *)*a3;
  uint64_t v14 = a3 + 1;
  uint64_t v15 = v16;
  if (v16 != v14)
  {
    do
    {
      sub_1000B1038((uint64_t)a1, (uint64_t)(v15 + 5));
      unint64_t v17 = (void *)v15[1];
      if (v17)
      {
        do
        {
          uint64_t v18 = v17;
          unint64_t v17 = (void *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          uint64_t v18 = (void *)v15[2];
          BOOL v13 = *v18 == (void)v15;
          uint64_t v15 = v18;
        }
        while (!v13);
      }
      uint64_t v15 = v18;
    }
    while (v18 != v14);
  }
}

void sub_1000B0DF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a11)
  {
    (*(void (**)(uint64_t))(*(void *)a11 + 8))(a11);
  }
  else if (a14)
  {
    --*a14;
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1000B0E4C(uint64_t a1, int a2, float ***a3)
{
  int v5 = *(_DWORD *)a3;
  int v6 = *((_DWORD *)a3 + 1);
  int v7 = sub_1000B1558(a1, a3[1]);
  v10[0] = v5;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  uint64_t v8 = sub_1000B1E34(*(void *)(a1 + 120), a2);
  return sub_1000B2570(v8 + 3, (uint64_t)v10);
}

void sub_1000B0EBC(uint64_t a1, int a2)
{
  uint64_t v4 = sub_1000B1E34(*(void *)(a1 + 120), a2);
  sub_1000B2688(*(void *)(a1 + 120), (uint64_t)v4);
  uint64_t v5 = v4[3];
  uint64_t v6 = v4[4] - v5;
  if (v6)
  {
    unint64_t v7 = v6 >> 4;
    int v8 = *(_DWORD *)(a1 + 64);
    if (v7 <= 1) {
      unint64_t v7 = 1;
    }
    int v9 = (int *)(v5 + 12);
    do
    {
      int v11 = *v9;
      v9 += 4;
      int v10 = v11;
      if (v11 >= v8)
      {
        int v8 = v10 + 1;
        *(_DWORD *)(a1 + 64) = v10 + 1;
      }
      --v7;
    }
    while (v7);
  }
  sub_10008543C(a1, a2);
  *((_DWORD *)v4 + 14) |= 0xAu;
}

uint64_t sub_1000B0F58(uint64_t a1, _DWORD *a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  int v11 = a2;
  uint64_t v6 = sub_1000B1210(a5, a2, (uint64_t)&unk_1000CE129, &v11);
  if (*((_DWORD *)v6 + 10) == -1)
  {
    sub_10002D8A8();
    operator new();
  }
  unint64_t v7 = (uint64_t *)v6[6];
  uint64_t v8 = *v7;
  int v9 = operator new(0x10uLL);
  *(void *)int v9 = v8;
  v9[2] = *a4;
  v9[3] = a4[1];
  uint64_t *v7 = (uint64_t)v9;
  return 1;
}

void sub_1000B1038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t ***)(a2 + 8);
  sub_1000B1354(v4);
  uint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = *v4;
    do
    {
      float v7 = *(float *)(a2 + 4);
      if (v7 == -INFINITY || (float v8 = *((float *)v6 + 3), v8 >= -INFINITY) && v8 <= -INFINITY)
      {
        float v7 = *(float *)sub_10006ECE4();
      }
      else if (v7 >= v8)
      {
        float v7 = *((float *)v6 + 3);
      }
      *(float *)(a2 + 4) = v7;
      if (v5 == v6 || *((_DWORD *)v6 + 2) != *((_DWORD *)v5 + 2))
      {
        int v11 = (uint64_t *)*v6;
        uint64_t v5 = v6;
      }
      else
      {
        float v9 = *((float *)v5 + 3);
        if (v9 == -INFINITY || (float v10 = *((float *)v6 + 3), v10 >= -INFINITY) && v10 <= -INFINITY)
        {
          float v9 = *(float *)sub_10006ECE4();
        }
        else if (v9 >= v10)
        {
          float v9 = *((float *)v6 + 3);
        }
        *((float *)v5 + 3) = v9;
        if (v9 >= -INFINITY && v9 <= -INFINITY) {
          *(void *)(a1 + 8) |= 4uLL;
        }
        int v11 = (uint64_t *)*v6;
        float v12 = (void *)*v5;
        *uint64_t v5 = *(void *)*v5;
        operator delete(v12);
      }
      uint64_t v6 = v11;
    }
    while (v11);
    for (uint64_t i = *v4; i; uint64_t i = (uint64_t *)*i)
    {
      float v14 = *((float *)i + 3);
      if (v14 == -INFINITY || (float v15 = *(float *)(a2 + 4), v15 >= -INFINITY) && v15 <= -INFINITY)
      {
        float v16 = *(float *)sub_10006ECE4();
      }
      else
      {
        BOOL v17 = v14 == INFINITY;
        float v16 = v14 - v15;
        if (v17) {
          float v16 = INFINITY;
        }
        if (v15 == INFINITY) {
          float v16 = NAN;
        }
      }
      if ((LODWORD(v16) & 0x7FFFFFFFu) <= 0x7F7FFFFF) {
        float v16 = *(float *)(a1 + 144) * floorf((float)(v16 / *(float *)(a1 + 144)) + 0.5);
      }
      *((float *)i + 3) = v16;
    }
  }
}

uint64_t *sub_1000B1210(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v6 = (uint64_t **)(a1 + 8);
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        float v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    float v8 = (uint64_t **)(a1 + 8);
LABEL_10:
    sub_1000B12CC(a1, a4, (uint64_t)&v11);
    sub_10001AD30((uint64_t **)a1, (uint64_t)v8, v6, v11);
    return v11;
  }
  return (uint64_t *)v8;
}

float sub_1000B12CC@<S0>(uint64_t a1@<X0>, _DWORD **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0x38uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  v6[8] = **a2;
  v6[10] = -1;
  int v7 = sub_10002D8A8();
  float result = *(float *)v7;
  v6[11] = *v7;
  *((void *)v6 + 6) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_1000B133C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_1000B1354(uint64_t **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = v2;
    do
    {
      ++v3;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  else
  {
    uint64_t v3 = 0;
  }
  float result = sub_1000B13AC(v2, v3, (uint64_t)&v6);
  *a1 = result;
  return result;
}

uint64_t *sub_1000B13AC(uint64_t *result, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)a2 >= 2)
  {
    if (a2 == 2)
    {
      uint64_t v3 = (void *)*result;
      if (*(_DWORD *)(*result + 8) < *((_DWORD *)result + 2))
      {
        void *v3 = result;
        *float result = 0;
        return v3;
      }
    }
    else
    {
      if (a2 >= 0) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = a2 + 1;
      }
      uint64_t v7 = v6 >> 1;
      uint64_t v8 = a2 - (v6 >> 1);
      int v9 = result;
      if (a2 >= 4)
      {
        unint64_t v10 = v7;
        int v9 = result;
        do
        {
          --v10;
          int v9 = (uint64_t *)*v9;
        }
        while (v10 > 1);
      }
      int v11 = (uint64_t *)*v9;
      uint64_t *v9 = 0;
      float v12 = (uint64_t *)sub_1000B13AC(result, v7, a3);
      BOOL v13 = (uint64_t *)sub_1000B13AC(v11, v8, a3);
      return sub_1000B1488(v12, v13);
    }
  }
  return result;
}

uint64_t *sub_1000B1488(uint64_t *a1, uint64_t *a2)
{
  if (a1)
  {
    if (a2)
    {
      int v2 = *((_DWORD *)a1 + 2);
      if (*((_DWORD *)a2 + 2) >= v2)
      {
        uint64_t v3 = a2;
        a2 = a1;
      }
      else
      {
        uint64_t v3 = a2;
        do
        {
          uint64_t v4 = (uint64_t **)v3;
          uint64_t v3 = (uint64_t *)*v3;
        }
        while (v3 && *((_DWORD *)v3 + 2) < v2);
        *uint64_t v4 = a1;
      }
      uint64_t v5 = *a1;
      BOOL v6 = v3 != 0;
      if (*a1) {
        BOOL v7 = v3 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        do
        {
          uint64_t v8 = (uint64_t *)v5;
          int v9 = *(_DWORD *)(v5 + 8);
          if (*((_DWORD *)v3 + 2) < v9)
          {
            unint64_t v10 = v3;
            do
            {
              int v11 = (uint64_t **)v10;
              unint64_t v10 = (uint64_t *)*v10;
            }
            while (v10 && *((_DWORD *)v10 + 2) < v9);
            *a1 = (uint64_t)v3;
            uint64_t v3 = *v11;
            *int v11 = v8;
          }
          uint64_t v5 = *v8;
          BOOL v6 = v3 != 0;
          if (*v8) {
            BOOL v12 = v3 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          a1 = v8;
        }
        while (!v12);
        a1 = v8;
      }
      if (v6) {
        *a1 = (uint64_t)v3;
      }
    }
    else
    {
      return a1;
    }
  }
  return a2;
}

uint64_t sub_1000B1558(uint64_t a1, float **a2)
{
  uint64_t v4 = sub_1000B1688(*(void **)(a1 + 184), (void **)a2);
  uint64_t v5 = v4;
  if (*(void *)(a1 + 152))
  {
    uint64_t v6 = *(void *)(a1 + 160);
    if ((int)v4 >= (unint64_t)((uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 2))
    {
      sub_1000B1724(a1, a2, &v20);
      unint64_t v7 = *(void *)(v6 + 16);
      uint64_t v8 = *(_DWORD **)(v6 + 8);
      if ((unint64_t)v8 >= v7)
      {
        unint64_t v10 = *(_DWORD **)v6;
        uint64_t v11 = ((uint64_t)v8 - *(void *)v6) >> 2;
        unint64_t v12 = v11 + 1;
        if ((unint64_t)(v11 + 1) >> 62) {
          sub_100019424();
        }
        uint64_t v13 = v7 - (void)v10;
        if (v13 >> 1 > v12) {
          unint64_t v12 = v13 >> 1;
        }
        if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v12;
        }
        if (v14)
        {
          float v15 = (char *)sub_10002EE10(v6 + 16, v14);
          unint64_t v10 = *(_DWORD **)v6;
          uint64_t v8 = *(_DWORD **)(v6 + 8);
        }
        else
        {
          float v15 = 0;
        }
        float v16 = &v15[4 * v11];
        BOOL v17 = &v15[4 * v14];
        *(_DWORD *)float v16 = v20;
        int v9 = v16 + 4;
        while (v8 != v10)
        {
          int v18 = *--v8;
          *((_DWORD *)v16 - 1) = v18;
          v16 -= 4;
        }
        *(void *)uint64_t v6 = v16;
        *(void *)(v6 + 8) = v9;
        *(void *)(v6 + 16) = v17;
        if (v10) {
          operator delete(v10);
        }
      }
      else
      {
        _DWORD *v8 = v20;
        int v9 = v8 + 1;
      }
      *(void *)(v6 + 8) = v9;
    }
  }
  return v5;
}

uint64_t sub_1000B1688(void *a1, void **a2)
{
  uint64_t v8 = a2;
  uint64_t v2 = (a1[15] - a1[14]) >> 3;
  uint64_t v3 = sub_1000B182C(a1 + 1, &v8, 1);
  if (v3 != v2)
  {
    uint64_t v4 = v8;
    if (v8)
    {
      uint64_t v5 = *v8;
      if (*v8)
      {
        do
        {
          uint64_t v6 = (void *)*v5;
          operator delete(v5);
          uint64_t v5 = v6;
        }
        while (v6);
      }
      *uint64_t v4 = 0;
      operator delete();
    }
  }
  return v3;
}

int *sub_1000B1724@<X0>(uint64_t a1@<X0>, float **a2@<X1>, int *a3@<X8>)
{
  float result = sub_10002D8A8();
  float v7 = *(float *)result;
  *a3 = *result;
  for (uint64_t i = *a2; i; uint64_t i = *(float **)i)
  {
    unint64_t v9 = *((int *)i + 2);
    uint64_t v10 = **(void **)(a1 + 152);
    if (v9 >= (*(void *)(*(void *)(a1 + 152) + 8) - v10) >> 2) {
      float result = sub_10002D8A8();
    }
    else {
      float result = (int *)(v10 + 4 * v9);
    }
    float v11 = i[3];
    if (v11 == -INFINITY || (float v12 = *(float *)result, *(float *)result >= -INFINITY) && *(float *)result <= -INFINITY)
    {
      float result = sub_10006ECE4();
      float v13 = *(float *)result;
    }
    else
    {
      BOOL v14 = v11 == INFINITY || v12 == INFINITY;
      float v13 = v12 + v11;
      if (v14) {
        float v13 = INFINITY;
      }
    }
    if (v7 == -INFINITY || v13 >= -INFINITY && v13 <= -INFINITY)
    {
      float result = sub_10006ECE4();
      float v7 = *(float *)result;
    }
    else if (v7 >= v13)
    {
      float v7 = v13;
    }
    *(float *)a3 = v7;
  }
  return result;
}

uint64_t sub_1000B182C(void *a1, void *a2, int a3)
{
  a1[16] = a2;
  uint64_t v4 = a1 + 4;
  if (!a3)
  {
    uint64_t v6 = sub_1000B1D2C(v4, &dword_1000CF898);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    return *((unsigned int *)v6 + 4);
  }
  uint64_t v6 = sub_1000B1964((uint64_t)v4, &dword_1000CF898, &dword_1000CF898);
  if (!v7) {
    return *((unsigned int *)v6 + 4);
  }
  uint64_t v8 = a1[13];
  unint64_t v9 = (void *)a1[14];
  uint64_t v10 = ((uint64_t)v9 - v8) >> 3;
  *((_DWORD *)v6 + 4) = v10;
  unint64_t v11 = a1[15];
  if ((unint64_t)v9 >= v11)
  {
    if ((unint64_t)(v10 + 1) >> 61) {
      sub_100019424();
    }
    uint64_t v13 = v11 - v8;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v14 = v10 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15) {
      float v16 = (char *)sub_10001943C((uint64_t)(a1 + 15), v15);
    }
    else {
      float v16 = 0;
    }
    BOOL v17 = &v16[8 * v10];
    int v18 = &v16[8 * v15];
    *(void *)BOOL v17 = *a2;
    float v12 = v17 + 8;
    int v20 = (char *)a1[13];
    uint64_t v19 = (char *)a1[14];
    if (v19 != v20)
    {
      do
      {
        uint64_t v21 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v17 - 1) = v21;
        v17 -= 8;
      }
      while (v19 != v20);
      uint64_t v19 = (char *)a1[13];
    }
    a1[13] = v17;
    a1[14] = v12;
    a1[15] = v18;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    void *v9 = *a2;
    float v12 = v9 + 1;
  }
  a1[14] = v12;
  return v10;
}

void *sub_1000B1964(uint64_t a1, int *a2, _DWORD *a3)
{
  unint64_t v7 = sub_1000B1BE0((uint64_t *)(a1 + 48), *a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    float v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          if (sub_1000B1C38((uint64_t *)(a1 + 64), *((_DWORD *)i + 4), *a2)) {
            return i;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = sub_100083EB0((uint64_t *)(a1 + 32), 1uLL);
  void *i = 0;
  i[1] = v8;
  *((_DWORD *)i + 4) = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 40) + 1);
  float v16 = *(float *)(a1 + 56);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_10008038C(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    void *i = *v21;
LABEL_38:
    void *v21 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = i;
  *(void *)(*(void *)a1 + 8 * v3) = a1 + 24;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }
    else
    {
      v22 &= v9 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 40);
  return i;
}

void sub_1000B1BC4(_Unwind_Exception *a1)
{
  sub_100084084(v2, v1);
  _Unwind_Resume(a1);
}

unint64_t sub_1000B1BE0(uint64_t *a1, int a2)
{
  if (a2 < -1) {
    return 0;
  }
  uint64_t v2 = *a1;
  if (a2 == -1) {
    unint64_t v3 = *(uint64_t ****)(v2 + 128);
  }
  else {
    unint64_t v3 = (uint64_t ***)(*(void *)(v2 + 104) + 8 * a2);
  }
  uint64_t v5 = *v3;
  for (unint64_t result = *((char *)v5 + 8);
        ;
        result ^= (2 * result) ^ (32 * *((int *)v5 + 2)) ^ ((unint64_t)*((int *)v5 + 2) >> 59) ^ *((unsigned int *)v5 + 3))
  {
    uint64_t v5 = (uint64_t **)*v5;
    if (!v5) {
      break;
    }
  }
  return result;
}

uint64_t sub_1000B1C38(uint64_t *a1, int a2, int a3)
{
  if (a2 == a3) {
    return 1;
  }
  uint64_t result = 0;
  if (a2 >= -1 && a3 >= -1)
  {
    uint64_t v5 = *a1;
    if (a2 == -1) {
      uint64_t v6 = *(uint64_t **)(v5 + 128);
    }
    else {
      uint64_t v6 = (uint64_t *)(*(void *)(v5 + 104) + 8 * a2);
    }
    uint64_t v7 = *v6;
    if (a3 == -1) {
      unint64_t v8 = *(uint64_t ***)(v5 + 128);
    }
    else {
      unint64_t v8 = (uint64_t **)(*(void *)(v5 + 104) + 8 * a3);
    }
    if (*((unsigned __int8 *)*v8 + 8) == *(unsigned __int8 *)(v7 + 8)) {
      return sub_1000B1CB8(*v8, (uint64_t *)v7);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000B1CB8(uint64_t *a1, uint64_t *a2)
{
  while (1)
  {
    a1 = (uint64_t *)*a1;
    a2 = (uint64_t *)*a2;
    if (!a1 || a2 == 0) {
      break;
    }
    if (*((_DWORD *)a1 + 2) != *((_DWORD *)a2 + 2) || *((float *)a1 + 3) != *((float *)a2 + 3)) {
      return 0;
    }
  }
  return (a1 != 0) ^ (a2 == 0);
}

uint64_t *sub_1000B1D2C(void *a1, int *a2)
{
  unint64_t v4 = sub_1000B1BE0(a1 + 6, *a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint8x8_t v10 = *(uint64_t ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    float v12 = a1 + 8;
    do
    {
      unint64_t v13 = v11[1];
      if (v13 == v6)
      {
        if (sub_1000B1C38(v12, *((_DWORD *)v11 + 4), *a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      unint64_t v11 = (uint64_t *)*v11;
    }
    while (v11);
  }
  return v11;
}

void *sub_1000B1E34(uint64_t a1, int a2)
{
  unint64_t v3 = sub_1000B1EBC(a1, a2);
  unint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 104))
  {
    int v5 = *((_DWORD *)v3 + 14);
    if ((v5 & 4) == 0)
    {
      *((_DWORD *)v3 + 14) = v5 | 4;
      unint64_t v6 = v3[4] - v3[3] + *(void *)(a1 + 128) + 64;
      *(void *)(a1 + 128) = v6;
      *(unsigned char *)(a1 + 120) = 1;
      if (v6 > *(void *)(a1 + 112)) {
        sub_1000B1FA0(a1, v3, 0, 0.666);
      }
    }
  }
  return v4;
}

void *sub_1000B1EBC(uint64_t a1, int a2)
{
  int v3 = *(_DWORD *)(a1 + 92);
  if (v3 == a2) {
    return *(void **)(a1 + 96);
  }
  if (*(unsigned char *)(a1 + 88))
  {
    if (v3 == -1)
    {
      *(_DWORD *)(a1 + 92) = a2;
      uint8x8_t v7 = sub_1000B03EC(a1, 0);
      *(void *)(a1 + 96) = v7;
      *((_DWORD *)v7 + 14) |= 4u;
      sub_1000B23B8(v7 + 3, 0x80uLL);
      return *(void **)(a1 + 96);
    }
    uint64_t v5 = *(void *)(a1 + 96);
    if (!*(_DWORD *)(v5 + 60))
    {
      *(_DWORD *)(a1 + 92) = a2;
      *(_DWORD *)uint64_t v5 = *sub_10002D8A8();
      *(void *)(v5 + 56) = 0;
      *(void *)(v5 + 8) = 0;
      *(void *)(v5 + 16) = 0;
      *(void *)(v5 + 32) = *(void *)(v5 + 24);
      uint64_t result = *(void **)(a1 + 96);
      *((_DWORD *)result + 14) |= 4u;
      return result;
    }
    *(_DWORD *)(v5 + 56) &= ~4u;
    *(unsigned char *)(a1 + 88) = 0;
  }
  int v6 = a2 + 1;
  return sub_1000B03EC(a1, v6);
}

void sub_1000B1FA0(uint64_t a1, void *a2, char a3, float a4)
{
  if (*(unsigned char *)(a1 + 120))
  {
    if (dword_1000FF640 >= 2)
    {
      sub_100009CF0(__p, "INFO");
      sub_10002D454((BOOL *)v32, (uint64_t)__p);
      unint64_t v8 = sub_10002D07C(&std::cerr, (uint64_t)"GCCacheStore: Enter GC: object = ", 33);
      sub_10002D07C(v8, (uint64_t)"(", 1);
      unint64_t v9 = (void *)std::ostream::operator<<();
      sub_10002D07C(v9, (uint64_t)"), free recently cached = ", 26);
      uint8x8_t v10 = (void *)std::ostream::operator<<();
      sub_10002D07C(v10, (uint64_t)", cache size = ", 15);
      unint64_t v11 = (void *)std::ostream::operator<<();
      sub_10002D07C(v11, (uint64_t)", cache frac = ", 15);
      float v12 = (void *)std::ostream::operator<<();
      sub_10002D07C(v12, (uint64_t)", cache limit = ", 16);
      unint64_t v13 = (void *)std::ostream::operator<<();
      sub_10002D07C(v13, (uint64_t)"\n", 1);
      sub_10002D500(v32);
      if (v37 < 0) {
        operator delete(__p[0]);
      }
    }
    unint64_t v14 = (unint64_t)(float)((float)*(unint64_t *)(a1 + 112) * a4);
    uint64_t v15 = *(void *)(a1 + 40);
LABEL_6:
    *(void *)(a1 + 64) = v15;
    while (v15 != a1 + 32)
    {
      int v16 = *(_DWORD *)(v15 + 16);
      if (v16) {
        int v17 = v16 - 1;
      }
      else {
        int v17 = *(_DWORD *)(a1 + 92);
      }
      unint64_t v18 = sub_1000B1EBC(a1, v17);
      unint64_t v19 = *(void *)(a1 + 128);
      if (v19 <= v14 || *((_DWORD *)v18 + 15))
      {
LABEL_23:
        *((_DWORD *)v18 + 14) &= ~8u;
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
        goto LABEL_6;
      }
      if (a3)
      {
        if (v18 == a2) {
          goto LABEL_23;
        }
        int v20 = *((_DWORD *)v18 + 14);
      }
      else
      {
        int v20 = *((_DWORD *)v18 + 14);
        if ((v20 & 8) != 0 || v18 == a2) {
          goto LABEL_23;
        }
      }
      if ((v20 & 4) != 0)
      {
        unint64_t v21 = v18[4] - v18[3] + 64;
        BOOL v22 = v19 > v21;
        unint64_t v23 = v19 - v21;
        if (v22) {
          *(void *)(a1 + 128) = v23;
        }
      }
      sub_1000B24C4((void *)a1);
      uint64_t v15 = *(void *)(a1 + 64);
    }
    if ((a3 & 1) != 0 || *(void *)(a1 + 128) <= v14)
    {
      unint64_t v24 = *(void *)(a1 + 128);
      if (v14)
      {
        if (v24 > v14)
        {
          uint64_t v25 = *(void *)(a1 + 112);
          do
          {
            v25 *= 2;
            BOOL v22 = v24 > 2 * v14;
            v14 *= 2;
          }
          while (v22);
          *(void *)(a1 + 112) = v25;
        }
      }
      else if (v24)
      {
        if (byte_1000FE8F0) {
          sub_100009CF0(__p, "FATAL");
        }
        else {
          sub_100009CF0(__p, "ERROR");
        }
        sub_10002D454(&v35, (uint64_t)__p);
        sub_10002D07C(&std::cerr, (uint64_t)"GCCacheStore:GC: Unable to free all cached states", 49);
        sub_10002D500(&v35);
        if (v37 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    else
    {
      sub_1000B1FA0(a1, a2, 1, a4);
    }
    if (dword_1000FF640 >= 2)
    {
      sub_100009CF0(v32, "INFO");
      sub_10002D454(&v34, (uint64_t)v32);
      float v26 = sub_10002D07C(&std::cerr, (uint64_t)"GCCacheStore: Exit GC: object = ", 32);
      sub_10002D07C(v26, (uint64_t)"(", 1);
      float v27 = (void *)std::ostream::operator<<();
      sub_10002D07C(v27, (uint64_t)"), free recently cached = ", 26);
      uint64_t v28 = (void *)std::ostream::operator<<();
      sub_10002D07C(v28, (uint64_t)", cache size = ", 15);
      unint64_t v29 = (void *)std::ostream::operator<<();
      sub_10002D07C(v29, (uint64_t)", cache frac = ", 15);
      uint64_t v30 = (void *)std::ostream::operator<<();
      sub_10002D07C(v30, (uint64_t)", cache limit = ", 16);
      unint64_t v31 = (void *)std::ostream::operator<<();
      sub_10002D07C(v31, (uint64_t)"\n", 1);
      sub_10002D500(&v34);
      if (v33 < 0) {
        operator delete(v32[0]);
      }
    }
  }
}

void sub_1000B234C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1000B23B8(uint64_t *result, unint64_t a2)
{
  if (a2 > (result[2] - *result) >> 4)
  {
    int v3 = result;
    if (a2 >> 60) {
      sub_100019424();
    }
    uint64_t v4 = result[1] - *result;
    v5[4] = result + 3;
    v5[0] = sub_1000B09C8(result + 3, a2);
    v5[1] = v5[0] + v4;
    v5[2] = v5[0] + v4;
    v5[3] = v5[0] + 16 * a2;
    sub_100030828(v3, v5);
    return (uint64_t *)sub_1000B2464((uint64_t)v5);
  }
  return result;
}

void sub_1000B2450(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000B2464((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000B2464(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  }
  if (*(void *)a1) {
    sub_1000ADB64(*(uint64_t **)(a1 + 32), *(void **)a1, (uint64_t)(*(void *)(a1 + 24) - *(void *)a1) >> 4);
  }
  return a1;
}

uint64_t sub_1000B24C4(void *a1)
{
  int v1 = *(_DWORD *)(a1[8] + 16);
  if (!v1 || v1 - 1 == *((_DWORD *)a1 + 23))
  {
    *((_DWORD *)a1 + 23) = -1;
    a1[12] = 0;
  }
  return sub_1000B24F0(a1);
}

uint64_t sub_1000B24F0(void *a1)
{
  sub_1000ADAC8(*(void *)(a1[1] + 8 * *(int *)(a1[8] + 16)), a1 + 9);
  *(void *)(a1[1] + 8 * *(int *)(a1[8] + 16)) = 0;
  uint64_t v2 = (uint64_t *)a1[8];
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  a1[8] = v3;
  *(void *)(v4 + 8) = v3;
  *(void *)v2[1] = v4;
  --a1[6];
  return sub_10007CDDC((uint64_t)(a1 + 4), (uint64_t)v2);
}

uint64_t *sub_1000B2570(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = result;
  unint64_t v4 = result[1];
  unint64_t v5 = result[2];
  if (v4 >= v5)
  {
    uint64_t v7 = (uint64_t)(v4 - *result) >> 4;
    unint64_t v8 = v7 + 1;
    if ((unint64_t)(v7 + 1) >> 60) {
      sub_100019424();
    }
    unint64_t v9 = result + 3;
    uint64_t v10 = v5 - *v3;
    if (v10 >> 3 > v8) {
      unint64_t v8 = v10 >> 3;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v8;
    }
    v14[4] = v3 + 3;
    float v12 = sub_1000B09C8(v9, v11);
    unint64_t v13 = &v12[2 * v7];
    v14[0] = v12;
    v14[1] = v13;
    v14[3] = &v12[2 * v11];
    *unint64_t v13 = *(void *)a2;
    *((_DWORD *)v13 + 2) = *(_DWORD *)(a2 + 8);
    *((_DWORD *)v13 + 3) = *(_DWORD *)(a2 + 12);
    v14[2] = v13 + 2;
    sub_100030828(v3, v14);
    uint64_t v6 = v3[1];
    uint64_t result = (uint64_t *)sub_1000B2464((uint64_t)v14);
  }
  else
  {
    *(void *)unint64_t v4 = *(void *)a2;
    *(_DWORD *)(v4 + 8) = *(_DWORD *)(a2 + 8);
    *(_DWORD *)(v4 + 12) = *(_DWORD *)(a2 + 12);
    uint64_t v6 = v4 + 16;
    result[1] = v4 + 16;
  }
  v3[1] = v6;
  return result;
}

void sub_1000B2674(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000B2464((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000B2688(uint64_t a1, uint64_t a2)
{
  sub_1000854D8((void *)a2);
  if (*(unsigned char *)(a1 + 120))
  {
    if ((*(unsigned char *)(a2 + 56) & 4) != 0)
    {
      unint64_t v4 = *(void *)(a2 + 32) - *(void *)(a2 + 24) + *(void *)(a1 + 128);
      *(void *)(a1 + 128) = v4;
      if (v4 > *(void *)(a1 + 112))
      {
        sub_1000B1FA0(a1, (void *)a2, 0, 0.666);
      }
    }
  }
}

uint64_t sub_1000B2714(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, 4))
    {
      *(unsigned char *)(a1 + 56) = 1;
    }
    else if (!*(unsigned char *)(a1 + 56))
    {
      int v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
      if (v3 != -1)
      {
        *(_DWORD *)(a1 + 60) = v3;
        *(unsigned char *)(a1 + 56) = 1;
        if (*(_DWORD *)(a1 + 64) <= v3) {
          *(_DWORD *)(a1 + 64) = v3 + 1;
        }
      }
    }
  }
  return *(unsigned int *)(a1 + 60);
}

float sub_1000B27D8@<S0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  if ((sub_1000866D8((uint64_t)a1, a2) & 1) == 0)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 56))(&v11, a1, a2);
    uint64_t v6 = sub_1000B1E34(a1[15], a2);
    *uint64_t v6 = v11;
    v6[14] |= 9u;
  }
  uint64_t v7 = a1[15];
  if (*(_DWORD *)(v7 + 92) == a2) {
    unint64_t v8 = (float **)(v7 + 96);
  }
  else {
    unint64_t v8 = (float **)(*(void *)(v7 + 8) + 8 * ((int)a2 + 1));
  }
  unint64_t v9 = *v8;
  float result = *v9;
  *a3 = *(_DWORD *)v9;
  return result;
}

uint64_t sub_1000B289C(void *a1, uint64_t a2)
{
  if ((sub_1000867C0((uint64_t)a1, a2) & 1) == 0) {
    (*(void (**)(void *, uint64_t))(*a1 + 40))(a1, a2);
  }
  uint64_t v4 = a1[15];
  if (*(_DWORD *)(v4 + 92) == a2) {
    uint64_t v5 = v4 + 96;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 8) + 8 * ((int)a2 + 1);
  }
  return (uint64_t)(*(void *)(*(void *)v5 + 32) - *(void *)(*(void *)v5 + 24)) >> 4;
}

uint64_t sub_1000B2928(void *a1, uint64_t a2)
{
  if ((sub_1000867C0((uint64_t)a1, a2) & 1) == 0) {
    (*(void (**)(void *, uint64_t))(*a1 + 40))(a1, a2);
  }
  uint64_t v4 = a1[15];
  if (*(_DWORD *)(v4 + 92) == a2) {
    uint64_t v5 = v4 + 96;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 8) + 8 * ((int)a2 + 1);
  }
  return *(void *)(*(void *)v5 + 8);
}

uint64_t sub_1000B29AC(void *a1, uint64_t a2)
{
  if ((sub_1000867C0((uint64_t)a1, a2) & 1) == 0) {
    (*(void (**)(void *, uint64_t))(*a1 + 40))(a1, a2);
  }
  uint64_t v4 = a1[15];
  if (*(_DWORD *)(v4 + 92) == a2) {
    uint64_t v5 = v4 + 96;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 8) + 8 * ((int)a2 + 1);
  }
  return *(void *)(*(void *)v5 + 16);
}

void *sub_1000B2A30(void *a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (a3)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32))(v4);
    sub_1000B2AD0(&v8, v5);
  }
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  a1[1] = v4;
  a1[2] = v6;
  *a1 = off_1000F3C90;
  return a1;
}

void sub_1000B2AD0(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1000B2B38(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1000B467C();
  }
  _Unwind_Resume(exception_object);
}

void sub_1000B2B54(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_1000B2B8C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_1000B2BBC(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void sub_1000B2C04()
{
}

uint64_t sub_1000B2C18(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v2 < *(_DWORD *)(v3 + 64)) {
    return 0;
  }
  uint64_t v5 = sub_100086C6C(v3);
  if ((int)v5 >= *(_DWORD *)(*(void *)(a1 + 16) + 64)) {
    return 1;
  }
  uint64_t v6 = v5;
  do
  {
    sub_1000B2D78(&v20, *(void *)(a1 + 8), v6);
    unint64_t v7 = v21;
    uint64_t v8 = *(void *)(v20 + 24);
    uint64_t v9 = *(void *)(v20 + 32) - v8;
    uint64_t v10 = *(void *)(a1 + 16);
    if (v21 < v9 >> 4)
    {
      uint64_t v11 = v9 >> 4;
      int v12 = *(_DWORD *)(v10 + 64);
      unint64_t v13 = (int *)(v8 + 16 * v21 + 12);
      do
      {
        int v15 = *v13;
        v13 += 4;
        int v14 = v15;
        if (v12 <= v15)
        {
          int v12 = v14 + 1;
          *(_DWORD *)(v10 + 64) = v14 + 1;
        }
        ++v7;
      }
      while (v11 != v7);
      unint64_t v21 = v11;
    }
    sub_10008543C(v10, v6);
    int v16 = *(_DWORD *)(a1 + 24);
    uint64_t v17 = *(void *)(a1 + 16);
    int v18 = *(_DWORD *)(v17 + 64);
    --*(_DWORD *)(v20 + 60);
    BOOL v4 = v16 >= v18;
    if (v16 < v18) {
      break;
    }
    uint64_t v6 = sub_100086C6C(v17);
  }
  while ((int)v6 < *(_DWORD *)(*(void *)(a1 + 16) + 64));
  return v4;
}

void sub_1000B2D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1000B2D40(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1000B2D48(uint64_t result)
{
  return result;
}

uint64_t sub_1000B2D58(uint64_t result)
{
  *(_DWORD *)(result + ++*(_DWORD *)(result + 24) = 0;
  return result;
}

void sub_1000B2D64()
{
}

void *sub_1000B2D78(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  a1[1] = 0;
  unint64_t v7 = sub_1000B1E34(*(void *)(v6 + 120), a3);
  *a1 = v7;
  ++*((_DWORD *)v7 + 15);
  if ((sub_1000867C0(*(void *)(a2 + 8), a3) & 1) == 0) {
    (*(void (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  }
  return a1;
}

void sub_1000B2E0C(_Unwind_Exception *a1)
{
  --*(_DWORD *)(*(void *)v1 + 60);
  _Unwind_Resume(a1);
}

uint64_t sub_1000B2E20(uint64_t a1, uint64_t a2, void *a3)
{
  if ((sub_1000867C0(a1, a2) & 1) == 0) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 40))(a1, a2);
  }
  return sub_100086E74(a1, a2, a3);
}

int *sub_1000B2EA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, int *a4@<X8>)
{
  if (a3)
  {
    if ((*(int (**)(uint64_t))(*(void *)a1 + 16))(a1) >= (unint64_t)((a2[1] - *a2) >> 2)) {
      uint64_t result = sub_10002D8A8();
    }
    else {
      uint64_t result = (int *)(*a2 + 4 * (*(int (**)(uint64_t))(*(void *)a1 + 16))(a1));
    }
    *a4 = *result;
  }
  else
  {
    uint64_t result = sub_10002D8A8();
    float v8 = *(float *)result;
    *a4 = *result;
    uint64_t v9 = *a2;
    if (a2[1] != *a2)
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t result = (int *)(*(void *(**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(void *)a1 + 24))(&v14, a1, v10);
        float v11 = *(float *)(v9 + 4 * v10);
        if (v11 == -INFINITY || *(float *)&v14 >= -INFINITY && *(float *)&v14 <= -INFINITY)
        {
          uint64_t result = sub_10006ECE4();
          float v12 = *(float *)result;
        }
        else
        {
          BOOL v13 = *(float *)&v14 == INFINITY || v11 == INFINITY;
          float v12 = v11 + *(float *)&v14;
          if (v13) {
            float v12 = INFINITY;
          }
        }
        if (v8 == -INFINITY || v12 >= -INFINITY && v12 <= -INFINITY)
        {
          uint64_t result = sub_10006ECE4();
          float v8 = *(float *)result;
        }
        else if (v8 >= v12)
        {
          float v8 = v12;
        }
        *(float *)a4 = v8;
        ++v10;
        uint64_t v9 = *a2;
      }
      while (v10 < (a2[1] - *a2) >> 2);
    }
  }
  return result;
}

uint64_t sub_1000B305C(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*a1 + 136))(a1);
  if (!result) {
    return result;
  }
  uint64_t v68 = 0;
  int v69 = 0;
  signed int v70 = 0;
  (*(void (**)(uint64_t *, uint64_t *))(*a1 + 112))(a1, &v68);
LABEL_3:
  if (v68)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v68 + 16))(v68)) {
      goto LABEL_90;
    }
    if (v68)
    {
      int v7 = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 24))(v68);
      goto LABEL_9;
    }
  }
  else if (v70 >= v69)
  {
    goto LABEL_90;
  }
  int v7 = v70;
LABEL_9:
  uint64_t v8 = v7;
  uint64_t v9 = *a2;
  if (v7 != (a2[1] - *a2) >> 2)
  {
    unint64_t v10 = sub_10002D8A8();
    LODWORD(v64) = 0;
    LODWORD(v64) = *(_DWORD *)(v9 + 4 * v8);
    LODWORD(v67) = 0;
    LODWORD(v67) = *v10;
    v11.n128_u32[0] = v64;
    if (*(float *)&v64 == *(float *)&v67) {
      goto LABEL_49;
    }
    (*(void (**)(uint64_t *, uint64_t, uint64_t *, float))(*a1 + 272))(a1, v8, &v67, *(float *)&v64);
    while (1)
    {
      if ((*(unsigned int (**)(uint64_t))(*(void *)v67 + 16))(v67))
      {
        if (v67) {
          (*(void (**)(uint64_t))(*(void *)v67 + 8))(v67);
        }
        if (a3)
        {
LABEL_49:
          if (a3 == 1)
          {
            (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t, __n128))(*a1 + 24))(&v64, a1, v8, v11);
            float v21 = *(float *)(v9 + 4 * v8);
            if (v21 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
            {
              float v22 = *(float *)sub_10006ECE4();
            }
            else
            {
              BOOL v25 = *(float *)&v64 == INFINITY || v21 == INFINITY;
              float v22 = v21 + *(float *)&v64;
              if (v25) {
                float v22 = INFINITY;
              }
            }
            float v62 = v22;
            (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v8, &v62);
          }
        }
        else
        {
          (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v8);
          if (*(float *)&v64 == -INFINITY || (float v23 = *(float *)(v9 + 4 * v8), v23 >= -INFINITY) && v23 <= -INFINITY)
          {
            float v24 = *(float *)sub_10006ECE4();
          }
          else
          {
            float v24 = *(float *)&v64 - v23;
            if (*(float *)&v64 == INFINITY) {
              float v24 = INFINITY;
            }
            if (v23 == INFINITY) {
              float v24 = NAN;
            }
          }
          float v63 = v24;
          (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v8, &v63);
        }
        if (v68) {
          (*(void (**)(uint64_t))(*(void *)v68 + 32))(v68);
        }
        else {
          ++v70;
        }
        goto LABEL_3;
      }
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v67 + 24))(v67);
      uint64_t v64 = *(void *)v12;
      float v65 = *(float *)(v12 + 8);
      int v66 = *(_DWORD *)(v12 + 12);
      uint64_t v13 = v66;
      uint64_t v14 = *a2;
      if (v66 < (unint64_t)((a2[1] - *a2) >> 2))
      {
        int v15 = sub_10002D8A8();
        float v72 = 0.0;
        float v72 = *(float *)(v14 + 4 * v13);
        float v71 = 0.0;
        float v71 = *(float *)v15;
        if (v72 != v71) {
          break;
        }
      }
LABEL_45:
      (*(void (**)(uint64_t))(*(void *)v67 + 32))(v67);
    }
    if (a3)
    {
      if (a3 != 1)
      {
LABEL_44:
        (*(void (**)(uint64_t, uint64_t *))(*(void *)v67 + 80))(v67, &v64);
        goto LABEL_45;
      }
      float v16 = *(float *)(v9 + 4 * v8);
      if (v16 == -INFINITY || v65 >= -INFINITY && v65 <= -INFINITY)
      {
        float v17 = *(float *)sub_10006ECE4();
      }
      else
      {
        float v17 = INFINITY;
        if (v16 == INFINITY || v65 == INFINITY)
        {
LABEL_36:
          float v19 = *(float *)(v14 + 4 * v13);
          if (v19 >= -INFINITY && v19 <= -INFINITY) {
            goto LABEL_38;
          }
LABEL_39:
          if (v19 == INFINITY)
          {
            float v20 = NAN;
          }
          else
          {
            float v20 = INFINITY;
            if (v17 != INFINITY) {
              float v20 = v17 - v19;
            }
          }
          goto LABEL_43;
        }
        float v17 = v16 + v65;
      }
      if (v17 != -INFINITY) {
        goto LABEL_36;
      }
LABEL_38:
      float v20 = *(float *)sub_10006ECE4();
LABEL_43:
      float v65 = v20;
      goto LABEL_44;
    }
    if (v65 == -INFINITY || (float v18 = *(float *)(v14 + 4 * v13), v18 >= -INFINITY) && v18 <= -INFINITY)
    {
      float v17 = *(float *)sub_10006ECE4();
    }
    else
    {
      float v17 = INFINITY;
      if (v65 == INFINITY || v18 == INFINITY) {
        goto LABEL_29;
      }
      float v17 = v65 + v18;
    }
    if (v17 == -INFINITY) {
      goto LABEL_38;
    }
LABEL_29:
    float v19 = *(float *)(v9 + 4 * v8);
    if (v19 >= -INFINITY && v19 <= -INFINITY) {
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  while (1)
  {
LABEL_90:
    if (!v68)
    {
      if (v70 >= v69) {
        break;
      }
      goto LABEL_75;
    }
    if ((*(uint64_t (**)(uint64_t))(*(void *)v68 + 16))(v68)) {
      break;
    }
    if (v68)
    {
      uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 24))(v68);
      goto LABEL_76;
    }
LABEL_75:
    uint64_t v26 = v70;
LABEL_76:
    if (a3 == 1)
    {
      float v27 = sub_10002D8A8();
      (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v26);
      float v28 = *(float *)v27;
      if (*(float *)v27 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
      {
        float v29 = *(float *)sub_10006ECE4();
      }
      else
      {
        BOOL v30 = *(float *)&v64 == INFINITY || v28 == INFINITY;
        float v29 = v28 + *(float *)&v64;
        if (v30) {
          float v29 = INFINITY;
        }
      }
      float v61 = v29;
      (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v26, &v61);
    }
    if (v68) {
      (*(void (**)(uint64_t))(*(void *)v68 + 32))(v68);
    }
    else {
      ++v70;
    }
  }
  if ((*(int (**)(uint64_t *))(*a1 + 16))(a1) >= (unint64_t)((a2[1] - *a2) >> 2)) {
    unint64_t v31 = sub_10002D8A8();
  }
  else {
    unint64_t v31 = (int *)(*a2 + 4 * (*(int (**)(uint64_t *))(*a1 + 16))(a1));
  }
  float v32 = *(float *)v31;
  char v33 = sub_10002D854();
  *(float *)&uint64_t v64 = v32;
  LODWORD(v67) = 0;
  LODWORD(v67) = *v33;
  v34.n128_f32[0] = v32;
  if (v32 == *(float *)&v67) {
    goto LABEL_171;
  }
  BOOL v35 = sub_10002D8A8();
  *(float *)&uint64_t v64 = v32;
  LODWORD(v67) = 0;
  LODWORD(v67) = *v35;
  v34.n128_f32[0] = v32;
  if (v32 == *(float *)&v67) {
    goto LABEL_171;
  }
  uint64_t v36 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, float))(*a1 + 56))(a1, 0x2000000000, 1, v32);
  uint64_t v37 = *a1;
  if ((v36 & 0x2000000000) == 0)
  {
    uint64_t v38 = (*(uint64_t (**)(uint64_t *))(v37 + 176))(a1);
    if (a3)
    {
      float v39 = *(float *)sub_10002D854();
      if (v39 == -INFINITY || v32 >= -INFINITY && v32 <= -INFINITY)
      {
        float v40 = *(float *)sub_10006ECE4();
      }
      else if (v32 == INFINITY)
      {
        float v40 = NAN;
      }
      else
      {
        float v40 = INFINITY;
        if (v39 != INFINITY) {
          float v40 = v39 - v32;
        }
      }
    }
    else
    {
      float v40 = v32;
    }
    int v56 = (*(uint64_t (**)(uint64_t *))(*a1 + 16))(a1);
    uint64_t v64 = 0;
    float v65 = v40;
    int v66 = v56;
    (*(void (**)(uint64_t *, uint64_t, uint64_t *))(*a1 + 184))(a1, v38, &v64);
    (*(void (**)(uint64_t *, uint64_t))(*a1 + 152))(a1, v38);
    goto LABEL_171;
  }
  uint64_t v41 = (*(uint64_t (**)(uint64_t *))(v37 + 16))(a1);
  (*(void (**)(uint64_t *, uint64_t, uint64_t *))(*a1 + 272))(a1, v41, &v67);
  while (2)
  {
    if (!(*(unsigned int (**)(uint64_t))(*(void *)v67 + 16))(v67))
    {
      uint64_t v42 = (*(uint64_t (**)(uint64_t))(*(void *)v67 + 24))(v67);
      uint64_t v64 = *(void *)v42;
      float v43 = *(float *)(v42 + 8);
      float v65 = v43;
      int v66 = *(_DWORD *)(v42 + 12);
      if (a3)
      {
        float v44 = *(float *)sub_10002D854();
        if (v44 == -INFINITY || v32 >= -INFINITY && v32 <= -INFINITY)
        {
          float v45 = *(float *)sub_10006ECE4();
          goto LABEL_110;
        }
        if (v32 == INFINITY) {
          goto LABEL_117;
        }
        float v45 = INFINITY;
        if (v44 != INFINITY)
        {
          float v45 = v44 - v32;
LABEL_110:
          if (v45 == -INFINITY) {
            goto LABEL_117;
          }
        }
        if (v65 >= -INFINITY && v65 <= -INFINITY)
        {
LABEL_117:
          float v46 = *(float *)sub_10006ECE4();
        }
        else
        {
          BOOL v48 = v65 == INFINITY || v45 == INFINITY;
          float v46 = v45 + v65;
          if (v48) {
            float v46 = INFINITY;
          }
        }
      }
      else
      {
        if (v32 == -INFINITY || v43 >= -INFINITY && v43 <= -INFINITY) {
          goto LABEL_117;
        }
        BOOL v47 = v43 == INFINITY || v32 == INFINITY;
        float v46 = v32 + v43;
        if (v47) {
          float v46 = INFINITY;
        }
      }
      float v65 = v46;
      (*(void (**)(uint64_t, uint64_t *))(*(void *)v67 + 80))(v67, &v64);
      (*(void (**)(uint64_t))(*(void *)v67 + 32))(v67);
      continue;
    }
    break;
  }
  if (v67) {
    (*(void (**)(uint64_t))(*(void *)v67 + 8))(v67);
  }
  if (a3)
  {
    float v49 = *(float *)sub_10002D854();
    if (v49 == -INFINITY || v32 >= -INFINITY && v32 <= -INFINITY)
    {
      float v50 = *(float *)sub_10006ECE4();
    }
    else
    {
      BOOL v25 = v49 == INFINITY;
      float v52 = v49 - v32;
      if (v25) {
        float v52 = INFINITY;
      }
      if (v32 == INFINITY) {
        float v50 = NAN;
      }
      else {
        float v50 = v52;
      }
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v41);
    if (v50 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
    {
      float v53 = *(float *)sub_10006ECE4();
    }
    else
    {
      BOOL v54 = *(float *)&v64 == INFINITY || v50 == INFINITY;
      float v53 = v50 + *(float *)&v64;
      if (v54) {
        float v53 = INFINITY;
      }
    }
    float v59 = v53;
    (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v41, &v59);
  }
  else
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v41);
    if (v32 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
    {
      float v51 = *(float *)sub_10006ECE4();
    }
    else
    {
      BOOL v55 = *(float *)&v64 == INFINITY || v32 == INFINITY;
      float v51 = v32 + *(float *)&v64;
      if (v55) {
        float v51 = INFINITY;
      }
    }
    float v60 = v51;
    (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v41, &v60);
  }
LABEL_171:
  uint64_t v57 = (*(uint64_t (**)(uint64_t *, uint64_t, void, __n128))(*a1 + 56))(a1, 0xFFFFFFFF0007, 0, v34);
  uint64_t v58 = sub_1000C2974(v57);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*a1 + 168))(a1, v58, 0xFFFFFFFF0007);
  uint64_t result = v68;
  if (v68) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v68 + 8))(v68);
  }
  return result;
}

void sub_1000B3E68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a15) {
    (*(void (**)(uint64_t))(*(void *)a15 + 8))(a15);
  }
  _Unwind_Resume(exception_object);
}

int *sub_1000B3F38(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = sub_10002D854();
  LODWORD(v23) = 0;
  LODWORD(v23) = *a2;
  LODWORD(v21) = 0;
  LODWORD(v21) = *result;
  if (*(float *)&v23 == *(float *)&v21) {
    return result;
  }
  uint64_t result = sub_10002D8A8();
  LODWORD(v23) = 0;
  LODWORD(v23) = *a2;
  LODWORD(v21) = 0;
  LODWORD(v21) = *result;
  float v7 = *(float *)&v23;
  if (*(float *)&v23 == *(float *)&v21) {
    return result;
  }
  if (a3)
  {
    float v23 = 0;
    float v24 = 0.0;
    unsigned int v26 = 0;
    (*(void (**)(uint64_t, int **, float))(*(void *)a1 + 112))(a1, &v23, v7);
    while (1)
    {
      uint64_t result = v23;
      if (!v23) {
        break;
      }
      int v8 = (*(uint64_t (**)(int *))(*(void *)v23 + 16))(v23);
      uint64_t result = v23;
      if (v8)
      {
        if (v23) {
          return (int *)(*(uint64_t (**)(void))(*(void *)v23 + 8))();
        }
        return result;
      }
      if (!v23) {
        goto LABEL_11;
      }
      uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v23 + 24))();
      if (v23) {
        uint64_t v10 = (*(uint64_t (**)(int *))(*(void *)v23 + 24))(v23);
      }
      else {
        uint64_t v10 = v26;
      }
LABEL_12:
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24))(&v21, a1, v10);
      if (*(float *)&v21 == -INFINITY || (float v11 = *(float *)a2, *(float *)a2 >= -INFINITY) && *(float *)a2 <= -INFINITY)
      {
        float v12 = *(float *)sub_10006ECE4();
      }
      else
      {
        float v12 = *(float *)&v21 - v11;
        if (*(float *)&v21 == INFINITY) {
          float v12 = INFINITY;
        }
        if (v11 == INFINITY) {
          float v12 = NAN;
        }
      }
      float v22 = v12;
      (*(void (**)(uint64_t, uint64_t, float *))(*(void *)a1 + 160))(a1, v9, &v22);
      if (v23) {
        (*(void (**)(int *))(*(void *)v23 + 32))(v23);
      }
      else {
        ++v26;
      }
    }
    if ((int)v26 >= SLODWORD(v24)) {
      return result;
    }
LABEL_11:
    uint64_t v9 = v26;
    uint64_t v10 = v26;
    goto LABEL_12;
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t, float))(*(void *)a1 + 16))(a1, *(float *)&v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a1 + 272))(a1, v13, &v21);
  while (!(*(unsigned int (**)(uint64_t))(*(void *)v21 + 16))(v21))
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 24))(v21);
    float v23 = *(int **)v14;
    float v15 = *(float *)(v14 + 8);
    float v24 = v15;
    int v25 = *(_DWORD *)(v14 + 12);
    if (v15 == -INFINITY || (float v16 = *(float *)a2, *(float *)a2 >= -INFINITY) && *(float *)a2 <= -INFINITY)
    {
      float v17 = *(float *)sub_10006ECE4();
    }
    else if (v16 == INFINITY)
    {
      float v17 = NAN;
    }
    else
    {
      float v17 = INFINITY;
      if (v15 != INFINITY) {
        float v17 = v15 - v16;
      }
    }
    float v24 = v17;
    (*(void (**)(uint64_t, int **))(*(void *)v21 + 80))(v21, &v23);
    (*(void (**)(uint64_t))(*(void *)v21 + 32))(v21);
  }
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  (*(void (**)(int **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24))(&v23, a1, v13);
  if (*(float *)&v23 == -INFINITY || (float v18 = *(float *)a2, *(float *)a2 >= -INFINITY) && *(float *)a2 <= -INFINITY)
  {
    float v19 = *(float *)sub_10006ECE4();
  }
  else
  {
    float v19 = *(float *)&v23 - v18;
    if (*(float *)&v23 == INFINITY) {
      float v19 = INFINITY;
    }
    if (v18 == INFINITY) {
      float v19 = NAN;
    }
  }
  float v20 = v19;
  return (int *)(*(uint64_t (**)(uint64_t, uint64_t, float *))(*(void *)a1 + 160))(a1, v13, &v20);
}

void sub_1000B446C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000B44F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1000B4514()
{
  sub_1000B44E4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B4548()
{
  sub_1000B44E4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B457C(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 24);
  if (v1) {
    --*v1;
  }
  return result;
}

uint64_t sub_1000B4594()
{
  sub_1000B44E4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B45C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1000B45EC()
{
  sub_1000B44E4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B4614()
{
  sub_1000B44E4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B4648()
{
  sub_1000B44E4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B467C()
{
  sub_1000B44E4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

CFLocaleRef *sub_1000B46A4(CFLocaleRef *a1, const __CFLocale *a2)
{
  *a1 = CFLocaleCreateCopy(0, a2);
  return a1;
}

CFTypeRef *sub_1000B46D4(CFTypeRef *a1)
{
  return a1;
}

CFTypeRef *sub_1000B4704(CFTypeRef *a1)
{
  return a1;
}

void sub_1000B4734(CFLocaleRef *a1@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = (void **)a2;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  CFStringRef v6 = CFStringCreateWithCStringNoCopy(0, a2, 0x8000100u, kCFAllocatorNull);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v6);
  CFStringLowercase(MutableCopy, *a1);
  CFRelease(v6);
  if (MutableCopy)
  {
    sub_1000B4838(MutableCopy, 1, a3);
  }
  else if (*((char *)v3 + 23) < 0)
  {
    int v8 = *v3;
    unint64_t v9 = (unint64_t)v3[1];
    sub_10006770C(a3, v8, v9);
  }
  else
  {
    *(_OWORD *)a3 = *(_OWORD *)v3;
    a3[2] = v3[2];
  }
}

void sub_1000B4838(const __CFString *a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  if (a1)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    __chkstk_darwin();
    int v8 = (char *)&v10 - v7;
    CFStringGetCString(a1, (char *)&v10 - v7, v9, 0x8000100u);
    sub_100009CF0(a3, v8);
    if (a2) {
      CFRelease(a1);
    }
  }
  else
  {
    sub_100009CF0(a3, 0);
  }
}

void sub_1000B4960(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000B4984(CFStringRef theString@<X1>, CFLocaleRef *a2@<X0>, void *a3@<X8>)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  CFStringLowercase(MutableCopy, *a2);
  if (MutableCopy)
  {
    sub_1000B4838(MutableCopy, 1, a3);
  }
  else
  {
    sub_100009CF0(a3, 0);
  }
}

std::string *sub_1000B4A14@<X0>(const void **a1@<X1>, std::string *a2@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000FED78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000FED78))
  {
    operator new();
  }
  sub_100009CF0(a2, "");
  uint64_t v4 = sub_10001BF7C(qword_1000FED70, a1);
  uint64_t result = (std::string *)qword_1000FED70;
  if (qword_1000FED70 + 8 != v4)
  {
    CFStringRef v6 = (const std::string *)sub_1000B53D8(qword_1000FED70, a1);
    return std::string::operator=(a2, v6);
  }
  return result;
}

void sub_1000B533C()
{
  for (uint64_t i = 3216; i != -48; i -= 48)
    sub_1000155E0(v0 + i);
  operator delete();
}

uint64_t sub_1000B53D8(uint64_t a1, const void **a2)
{
  uint64_t v2 = *sub_1000B6084(a1, &v4, a2);
  if (!v2) {
    sub_100018C4C("map::at:  key not found");
  }
  return v2 + 56;
}

__CFArray *sub_1000B5418(CFLocaleRef *a1, const __CFString *a2)
{
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (a2)
  {
    CFIndex Length = CFStringGetLength(a2);
    v17.location = 0;
    v17.length = Length;
    CFStringRef v6 = CFStringTokenizerCreate(0, a2, v17, 4uLL, *a1);
    while (CFStringTokenizerAdvanceToNextToken(v6))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      CFIndex v8 = CurrentTokenRange.length;
      if (qword_1000FED80 != -1) {
        dispatch_once(&qword_1000FED80, &stru_1000F4438);
      }
      if (CFStringFindCharacterFromSet(a2, (CFCharacterSetRef)qword_1000FED88, CurrentTokenRange, 0, &v16))
      {
        CFIndex v9 = CurrentTokenRange.length + CurrentTokenRange.location;
LABEL_7:
        if (v9 < Length - 1)
        {
          if (qword_1000FED80 != -1) {
            dispatch_once(&qword_1000FED80, &stru_1000F4438);
          }
          CFCharacterSetRef v10 = (const __CFCharacterSet *)qword_1000FED88;
          UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v9 + 1);
          if (CFCharacterSetIsCharacterMember(v10, CharacterAtIndex))
          {
            int v12 = CFStringGetCharacterAtIndex(a2, v9);
            if ((v12 - 8208) < 2 || v12 == 173 || v12 == 45)
            {
              while (CFStringTokenizerAdvanceToNextToken(v6))
              {
                CFRange v13 = CFStringTokenizerGetCurrentTokenRange(v6);
                if (v13.location > v9)
                {
                  CFIndex v8 = v13.length - CurrentTokenRange.location + v13.location;
                  CFIndex v9 = v13.length + v13.location;
                  goto LABEL_7;
                }
              }
            }
          }
        }
        v18.location = CurrentTokenRange.location;
        v18.length = v8;
        CFStringRef v14 = CFStringCreateWithSubstring(0, a2, v18);
        CFArrayAppendValue(Mutable, v14);
        CFRelease(v14);
      }
    }
    CFRelease(v6);
  }
  return Mutable;
}

__CFArray *sub_1000B5604(uint64_t a1, const __CFString *a2)
{
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (a2)
  {
    if (sub_1000B56B0((BOOL)a2))
    {
      CFArrayAppendValue(Mutable, a2);
    }
    else if (CFStringGetLength(a2) >= 1)
    {
      CFIndex v4 = 0;
      do
      {
        v7.location = v4;
        v7.length = 1;
        CFStringRef v5 = CFStringCreateWithSubstring(0, a2, v7);
        CFArrayAppendValue(Mutable, v5);
        ++v4;
      }
      while (v4 < CFStringGetLength(a2));
    }
  }
  return Mutable;
}

BOOL sub_1000B56B0(BOOL theString)
{
  if (theString)
  {
    CFStringRef v1 = (const __CFString *)theString;
    if (qword_1000FEDA0 != -1) {
      dispatch_once(&qword_1000FEDA0, &stru_1000F44B8);
    }
    CFCharacterSetRef v2 = (const __CFCharacterSet *)qword_1000FEDA8;
    v4.length = CFStringGetLength(v1);
    v4.location = 0;
    return CFStringFindCharacterFromSet(v1, v2, v4, 0, &v3) == 0;
  }
  return theString;
}

BOOL sub_1000B573C(const __CFString *a1)
{
  return CFEqual(a1, @"\n\n");
}

CFStringRef sub_1000B5768(const __CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    if (CFStringGetLength(result) == 1)
    {
      if (qword_1000FED90 != -1) {
        dispatch_once(&qword_1000FED90, &stru_1000F4478);
      }
      CFCharacterSetRef v2 = (const __CFCharacterSet *)qword_1000FED98;
      v5.length = CFStringGetLength(v1);
      v5.location = 0;
      return (const __CFString *)(CFStringFindCharacterFromSet(v1, v2, v5, 0, &v4) == 0);
    }
    else
    {
      return (const __CFString *)(CFEqual(v1, @"\n\n"));
    }
  }
  return result;
}

CFStringRef sub_1000B581C(uint64_t a1)
{
  CFStringRef v1 = (const char *)a1;
  if (*(char *)(a1 + 23) < 0)
  {
    if (!*(void *)(a1 + 8)) {
      return 0;
    }
    CFStringRef v1 = *(const char **)a1;
  }
  else if (!*(unsigned char *)(a1 + 23))
  {
    return 0;
  }
  CFStringRef v2 = CFStringCreateWithCString(0, v1, 0x8000100u);
  CFStringRef v3 = sub_1000B5768(v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

BOOL sub_1000B588C(uint64_t a1)
{
  CFStringRef v1 = (const char *)a1;
  if (*(char *)(a1 + 23) < 0)
  {
    if (!*(void *)(a1 + 8)) {
      return 0;
    }
    CFStringRef v1 = *(const char **)a1;
  }
  else if (!*(unsigned char *)(a1 + 23))
  {
    return 0;
  }
  CFStringRef v2 = CFStringCreateWithCString(0, v1, 0x8000100u);
  BOOL v3 = sub_1000B56B0((BOOL)v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

uint64_t sub_1000B58FC(char *a1)
{
  if (a1[23] < 0)
  {
    uint64_t v1 = *((void *)a1 + 1);
    if (v1)
    {
      a1 = *(char **)a1;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v1 = a1[23];
    if (a1[23])
    {
LABEL_6:
      while ((*a1 & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[*a1] & 0x400) != 0)
      {
        ++a1;
        if (!--v1) {
          return 1;
        }
      }
    }
  }
  return 0;
}

void *sub_1000B5958(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B5990(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000B59AC(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B59E4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000B5A00(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B5A38(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000B5A54(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B5A8C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000B5AA8(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B5AE0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000B5AFC(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B5B34(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000B5B50(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B5B88(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000B5BA4(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_100009CF0(a1, a2);
  sub_100009CF0(v5 + 3, a3);
  return a1;
}

void sub_1000B5BDC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000B5BF8(id a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
  CFCharacterSetRef v3 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v3);
  CFCharacterSetInvert(MutableCopy);
  qword_1000FED88 = (uint64_t)MutableCopy;
}

void sub_1000B5C50(id a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
  CFCharacterSetRef v3 = CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
  CFCharacterSetUnion(MutableCopy, v3);
  CFCharacterSetRef v4 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v4);
  CFCharacterSetRef v5 = CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  CFCharacterSetUnion(MutableCopy, v5);
  CFCharacterSetRef v6 = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  CFCharacterSetUnion(MutableCopy, v6);
  CFCharacterSetRef v7 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  CFCharacterSetUnion(MutableCopy, v7);
  CFCharacterSetInvert(MutableCopy);
  qword_1000FED98 = (uint64_t)MutableCopy;
}

void sub_1000B5CF8(id a1)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
  CFCharacterSetRef v3 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v3);
  CFCharacterSetInvert(MutableCopy);
  qword_1000FEDA8 = (uint64_t)MutableCopy;
}

uint64_t sub_1000B5D50(uint64_t a1, const void **a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  CFCharacterSetRef v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 48 * a3;
    do
    {
      sub_1000B5DD4((uint64_t **)a1, v4, a2, (long long *)a2);
      a2 += 6;
      v6 -= 48;
    }
    while (v6);
  }
  return a1;
}

void sub_1000B5DBC(_Unwind_Exception *a1)
{
  sub_1000B626C(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_1000B5DD4(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  uint64_t v6 = sub_1000B5E6C(a1, a2, &v12, &v11, a3);
  CFCharacterSetRef v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    CFIndex v8 = (uint64_t **)v6;
    sub_1000B6018((uint64_t)a1, a4, (uint64_t)v10);
    sub_10001AD30(a1, (uint64_t)v12, v8, v10[0]);
    CFCharacterSetRef v7 = v10[0];
    v10[0] = 0;
    sub_1000B61BC((uint64_t)v10, 0);
  }
  return v7;
}

const void **sub_1000B5E6C(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  CFIndex v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2 && !sub_10001C00C((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!sub_10001C00C((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      CFStringRef v14 = (const void **)a2[1];
      do
      {
        float v15 = v14;
        CFStringRef v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      CFRange v18 = (const void **)a2;
      do
      {
        float v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        CFRange v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_10001C00C((uint64_t)(a1 + 2), a5, v15 + 4)) {
        goto LABEL_28;
      }
      uint64_t v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    int v12 = (const void **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (const void **)a2;
      return (const void **)a2;
    }
  }
  uint64_t v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      int v12 = v11;
      uint64_t v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    CFRange v16 = a2;
    do
    {
      int v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      CFRange v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (sub_10001C00C((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:
  return (const void **)sub_1000B6084((uint64_t)a1, a3, a5);
}

char *sub_1000B6018@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x50uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = sub_1000B6124(v6 + 32, a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_1000B606C(_Unwind_Exception *a1)
{
  sub_1000B61BC(v1, 0);
  _Unwind_Resume(a1);
}

void *sub_1000B6084(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        CFIndex v8 = (void *)v4;
        CFIndex v9 = (const void **)(v4 + 32);
        if (!sub_10001C00C(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_10001C00C(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    CFIndex v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

char *sub_1000B6124(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10006770C(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  uint64_t v5 = __dst + 24;
  if (*((char *)a2 + 47) < 0)
  {
    sub_10006770C(v5, *((void **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    *((void *)__dst + 5) = *((void *)a2 + 5);
    *(_OWORD *)uint64_t v5 = v6;
  }
  return __dst;
}

void sub_1000B61A0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000B61BC(uint64_t a1, uint64_t a2)
{
  CFStringRef v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_1000B6214((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void sub_1000B6214(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    CFStringRef v2 = *(void **)a1;
    operator delete(v2);
  }
}

void sub_1000B626C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1000B626C(a1, *a2);
    sub_1000B626C(a1, a2[1]);
    sub_1000B6214((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

double *sub_1000B62C8(double *__dst, long long *a2, char a3, char a4, double a5, double a6, double a7, double a8)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10006770C(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v15 = *a2;
    __dst[2] = *((double *)a2 + 2);
    *(_OWORD *)__dst = v15;
  }
  __dst[3] = a5;
  __dst[4] = a6;
  __dst[5] = a7;
  __dst[6] = a8;
  *((unsigned char *)__dst + 56) = a3;
  *((unsigned char *)__dst + 57) = a4;
  return __dst;
}

void sub_1000B6358(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a1 + 23) < 0) {
    sub_10006770C(&__dst, *(void **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __dst = *(std::string *)a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    sub_10006770C(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v7 = *(void *)(a2 + 16);
  }
  if (v7 >= 0) {
    CFCharacterSetRef v3 = __p;
  }
  else {
    CFCharacterSetRef v3 = (void **)__p[0];
  }
  if (v7 >= 0) {
    std::string::size_type v4 = HIBYTE(v7);
  }
  else {
    std::string::size_type v4 = (std::string::size_type)__p[1];
  }
  uint64_t v5 = std::string::append(&__dst, (const std::string::value_type *)v3, v4);
  v8[0] = v5->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v8 + 3) = *(_DWORD *)((char *)&v5->__r_.__value_.__r.__words[2] + 3);
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  operator new();
}

void sub_1000B6538(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  operator delete();
}

void sub_1000B65B4(uint64_t *a1)
{
  uint64_t v13 = (long long ****)a1[1];
  for (uint64_t i = (long long ****)*a1; i != v13; i += 3)
  {
    uint64_t v1 = sub_1000C15EC();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "CMDPTokenSausage -> phrase", buf, 2u);
    }
    CFStringRef v2 = *i;
    CFCharacterSetRef v3 = i[1];
    while (v2 != v3)
    {
      std::string::size_type v4 = sub_1000C15EC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CMDPTokenSausage -> token_group_array", buf, 2u);
      }
      uint64_t v5 = *v2;
      long long v6 = v2[1];
      while (v5 != v6)
      {
        uint64_t v7 = sub_1000C15EC();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          CFIndex v8 = *v5;
          if (*((char *)*v5 + 23) < 0)
          {
            sub_10006770C(buf, *(void **)v8, *((void *)v8 + 1));
          }
          else
          {
            long long v9 = *v8;
            uint64_t v16 = *((void *)v8 + 2);
            *(_OWORD *)buf = v9;
          }
          CFCharacterSetRef v10 = v16 >= 0 ? buf : *(uint8_t **)buf;
          *(_DWORD *)BOOL v17 = 136315138;
          CFRange v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CMDPTokenSausage -> token: %s\n", v17, 0xCu);
          if (SHIBYTE(v16) < 0) {
            operator delete(*(void **)buf);
          }
        }
        if (*((unsigned char *)*v5 + 57))
        {
          uint64_t v11 = sub_1000C15EC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Has space before", buf, 2u);
          }
        }
        if (*((unsigned char *)*v5 + 56))
        {
          int v12 = sub_1000C15EC();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Has space after", buf, 2u);
          }
        }
        ++v5;
      }
      v2 += 3;
    }
  }
}

void sub_1000B6820(uint64_t *a1@<X0>, int a2@<W1>, CFLocaleRef *a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  std::string::size_type v4 = (long long ****)*a1;
  float v24 = (long long ****)a1[1];
  if ((long long ****)*a1 == v24) {
    return;
  }
  do
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v7 = *v4;
    int v25 = v4;
    unsigned int v26 = v4[1];
    if (*v4 == v26) {
      goto LABEL_50;
    }
    do
    {
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v32 = 0;
      CFIndex v8 = *v7;
      if (v7[1] == *v7) {
        goto LABEL_44;
      }
      if (a2)
      {
        if (a2 != 1)
        {
          unsigned __int8 v13 = 0;
          goto LABEL_17;
        }
        long long v9 = *v8;
        if (*((char *)*v8 + 23) < 0)
        {
          sub_10006770C(&__p, *(void **)v9, *((void *)v9 + 1));
        }
        else
        {
          long long v10 = *v9;
          __p.__r_.__value_.__r.__words[2] = *((void *)v9 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v10;
        }
        unsigned __int8 v14 = sub_1000B588C((uint64_t)&__p);
      }
      else
      {
        uint64_t v11 = *v8;
        if (*((char *)*v8 + 23) < 0)
        {
          sub_10006770C(&__p, *(void **)v11, *((void *)v11 + 1));
        }
        else
        {
          long long v12 = *v11;
          __p.__r_.__value_.__r.__words[2] = *((void *)v11 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v12;
        }
        unsigned __int8 v14 = sub_1000B581C((uint64_t)&__p);
      }
      unsigned __int8 v13 = v14;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
LABEL_17:
      long long v15 = *v8;
      if (*((char *)*v8 + 23) < 0)
      {
        sub_10006770C(&__p, *(void **)v15, *((void *)v15 + 1));
      }
      else
      {
        long long v16 = *v15;
        __p.__r_.__value_.__r.__words[2] = *((void *)v15 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v16;
      }
      sub_1000B581C((uint64_t)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v13)
        {
LABEL_22:
          BOOL v17 = *v8;
          if (*((char *)*v8 + 23) < 0)
          {
            sub_10006770C(&__p, *(void **)v17, *((void *)v17 + 1));
          }
          else
          {
            long long v18 = *v17;
            __p.__r_.__value_.__r.__words[2] = *((void *)v17 + 2);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v18;
          }
          v31[0] = __p.__r_.__value_.__r.__words[2];
          *(_DWORD *)((char *)v31 + 3) = *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[2] + 3);
LABEL_40:
          operator new();
        }
      }
      else if (v13)
      {
        goto LABEL_22;
      }
      float v19 = *v8;
      if (*((char *)*v8 + 23) < 0)
      {
        sub_10006770C(__dst, *(void **)v19, *((void *)v19 + 1));
      }
      else
      {
        long long v20 = *v19;
        uint64_t v28 = *((void *)v19 + 2);
        *(_OWORD *)std::string __dst = v20;
      }
      sub_1000B4734(a3, (const char *)__dst, v29);
      sub_1000B4A14((const void **)v29, &__p);
      if (v30 < 0) {
        operator delete(v29[0]);
      }
      if (SHIBYTE(v28) < 0)
      {
        operator delete(__dst[0]);
        if (!a2)
        {
LABEL_37:
          unsigned __int8 v21 = sub_1000B581C((uint64_t)&__p);
LABEL_38:
          char v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          if (v21)
          {
            v31[0] = __p.__r_.__value_.__r.__words[2];
            *(_DWORD *)((char *)v31 + 3) = *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[2] + 3);
            goto LABEL_40;
          }
          goto LABEL_42;
        }
      }
      else if (!a2)
      {
        goto LABEL_37;
      }
      if (a2 == 1)
      {
        unsigned __int8 v21 = sub_1000B588C((uint64_t)&__p);
        goto LABEL_38;
      }
      char v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
LABEL_42:
      if (v22 < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
LABEL_44:
      if (v32 != v33 && v33 - v32 == (char *)v7[1] - (char *)*v7) {
        sub_100013234(&v35, (uint64_t)&v32);
      }
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v32;
      sub_1000191C0((void ***)&__p);
      v7 += 3;
    }
    while (v7 != v26);
    if (v35 != v36) {
      sub_100013374(a4, (uint64_t)&v35);
    }
LABEL_50:
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
    sub_100019C28((void ***)&__p);
    std::string::size_type v4 = v25 + 3;
  }
  while (v25 + 3 != v24);
}

void sub_1000B6CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  a27 = &a30;
  sub_100019C28((void ***)&a27);
  a30 = a9;
  sub_100019278((void ***)&a30);
  _Unwind_Resume(a1);
}

void sub_1000B6DF8(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = *a1;
  uint64_t v15 = a1[1];
  if (*a1 == v15) {
    return;
  }
  do
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    CFCharacterSetRef v3 = *(void **)v2;
    uint64_t v16 = v2;
    BOOL v17 = *(void **)(v2 + 8);
    if (*(void **)v2 == v17) {
      goto LABEL_32;
    }
    do
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v22 = 0;
      uint64_t v4 = *v3;
      if (v3[1] == *v3) {
        goto LABEL_29;
      }
      long long v18 = v3;
      unint64_t v5 = 0;
      do
      {
        long long v6 = *(long long **)(v4 + 8 * v5);
        if (*((char *)v6 + 23) < 0)
        {
          sub_10006770C(__dst, *(void **)v6, *((void *)v6 + 1));
        }
        else
        {
          long long v7 = *v6;
          uint64_t v21 = *((void *)v6 + 2);
          *(_OWORD *)std::string __dst = v7;
        }
        if (v21 >= 0) {
          CFIndex v8 = __dst;
        }
        else {
          CFIndex v8 = (void **)__dst[0];
        }
        CFStringRef v9 = CFStringCreateWithCString(0, (const char *)v8, 0x8000100u);
        if (CFStringCompare(@" ", v9, 0))
        {
          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v9, @" ");
          if (!v9) {
            goto LABEL_16;
          }
LABEL_15:
          CFRelease(v9);
          goto LABEL_16;
        }
        CFArrayRef ArrayBySeparatingStrings = 0;
        if (v9) {
          goto LABEL_15;
        }
LABEL_16:
        if (!ArrayBySeparatingStrings || CFArrayGetCount(ArrayBySeparatingStrings) < 2)
        {
          long long v12 = *(long long **)(v4 + 8 * v5);
          if (*((char *)v12 + 23) < 0)
          {
            sub_10006770C(&v28, *(void **)v12, *((void *)v12 + 1));
          }
          else
          {
            long long v13 = *v12;
            uint64_t v29 = *((void *)v12 + 2);
            long long v28 = v13;
          }
          operator new();
        }
        if (CFArrayGetCount(ArrayBySeparatingStrings) > 0)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
          sub_1000B4838(ValueAtIndex, 0, __p);
          operator new();
        }
        CFRelease(ArrayBySeparatingStrings);
        if (SHIBYTE(v21) < 0) {
          operator delete(__dst[0]);
        }
        ++v5;
        uint64_t v4 = *v18;
      }
      while (v5 < (uint64_t)(v18[1] - *v18) >> 3);
      CFCharacterSetRef v3 = v18;
      if (v22 != v23) {
        sub_100013234(&v25, (uint64_t)&v22);
      }
LABEL_29:
      *(void *)&long long v28 = &v22;
      sub_1000191C0((void ***)&v28);
      v3 += 3;
    }
    while (v3 != v17);
    if (v25 != v26) {
      sub_100013374(a2, (uint64_t)&v25);
    }
LABEL_32:
    *(void *)&long long v28 = &v25;
    sub_100019C28((void ***)&v28);
    uint64_t v2 = v16 + 24;
  }
  while (v16 + 24 != v15);
}

void sub_1000B73B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t *a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  a35 = &a38;
  sub_100019C28((void ***)&a35);
  a38 = a10;
  sub_100019278((void ***)&a38);
  _Unwind_Resume(a1);
}

void sub_1000B7518(uint64_t a1, int a2, int a3, int a4, const char *a5, int a6, uint64_t **a7, CFLocaleRef *a8)
{
  sub_1000B4734(a8, a5, __p);
  std::to_string(&v17, a4);
  sub_10006AEAC(a1, a2, a3, (uint64_t)&v17, (uint64_t)__p, (double)a6);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  sub_1000B820C(a7, (const void **)__p, (uint64_t)__p);
  sub_1000B4A14((const void **)__p, &v17);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  char v15 = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    std::to_string(&v16, a4);
    sub_10006AEAC(a1, a2, a3, (uint64_t)&v16, (uint64_t)&v17, (double)a6);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    sub_1000B820C(a7, (const void **)&v17.__r_.__value_.__l.__data_, (uint64_t)&v17);
    char v15 = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  }
  if (v15 < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000B7664(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000B76C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    if (*(char *)(a1 + 23) < 0)
    {
      sub_10006770C(__p, *(void **)a1, *(void *)(a1 + 8));
    }
    else
    {
      *(_OWORD *)std::string __p = *(_OWORD *)a1;
      uint64_t v13 = *(void *)(a1 + 16);
    }
    if (SHIBYTE(v13) < 0)
    {
      uint64_t v4 = (char *)__p[1];
      if (__p[1])
      {
        unint64_t v5 = (void **)__p[0];
        goto LABEL_13;
      }
LABEL_22:
      int v8 = 1;
    }
    else
    {
      uint64_t v4 = (char *)HIBYTE(v13);
      if (!HIBYTE(v13)) {
        return 0;
      }
      unint64_t v5 = __p;
      do
      {
LABEL_13:
        if (*(char *)v5 < 0 || (_DefaultRuneLocale.__runetype[*(unsigned __int8 *)v5] & 0x400) == 0) {
          goto LABEL_22;
        }
        unint64_t v5 = (void **)((char *)v5 + 1);
        --v4;
      }
      while (v4);
      if (*(char *)(a2 + 23) < 0)
      {
        sub_10006770C(v10, *(void **)a2, *(void *)(a2 + 8));
      }
      else
      {
        *(_OWORD *)long long v10 = *(_OWORD *)a2;
        uint64_t v11 = *(void *)(a2 + 16);
      }
      if (SHIBYTE(v11) < 0)
      {
        long long v7 = (char *)v10[1];
        if (v10[1])
        {
          long long v6 = (void **)v10[0];
          goto LABEL_31;
        }
        int v8 = 1;
LABEL_39:
        operator delete(v10[0]);
        goto LABEL_23;
      }
      if (!HIBYTE(v11)) {
        goto LABEL_22;
      }
      long long v6 = v10;
      long long v7 = (char *)HIBYTE(v11);
LABEL_31:
      while ((*(char *)v6 & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[*(unsigned __int8 *)v6] & 0x400) != 0)
      {
        long long v6 = (void **)((char *)v6 + 1);
        if (!--v7)
        {
          int v8 = 0;
          goto LABEL_36;
        }
      }
      int v8 = 1;
LABEL_36:
      if (v11 < 0) {
        goto LABEL_39;
      }
    }
LABEL_23:
    if (SHIBYTE(v13) < 0)
    {
      operator delete(__p[0]);
      if (v8) {
        return 0;
      }
    }
    else if (v8)
    {
      return 0;
    }
  }
  else if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(a2 + 57))
  {
    return 0;
  }
  return 1;
}

void sub_1000B7838(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000B7854(uint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_1000B6DF8(a1, v4);
  if (v4[0] != v4[1])
  {
    memset(v3, 0, sizeof(v3));
    operator new();
  }
  *a2 = 0;
  v3[0] = (void **)v4;
  sub_100019278(v3);
}

void sub_1000B8084(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  sub_10002BA20(v38);
  operator delete();
}

uint64_t sub_1000B81B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_100006F40();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t *sub_1000B820C(uint64_t **a1, const void **a2, uint64_t a3)
{
  unint64_t v5 = (uint64_t **)sub_1000B6084((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    sub_1000B828C((uint64_t)a1, a3, (uint64_t)&v7);
    sub_10001AD30(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

void *sub_1000B828C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  long long v6 = (char *)operator new(0x38uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t result = sub_10006770C(result, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t result = *(_OWORD *)a2;
    result[2] = *(void *)(a2 + 16);
  }
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_1000B8310(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_10001C078(v3, v2);
  _Unwind_Resume(a1);
}

void sub_1000B832C(void ***a1)
{
  uint64_t v2 = (uint64_t **)*a1;
  if (*v2)
  {
    sub_1000B8380((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1000B8380(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      uint64_t v6 = *v5;
      *uint64_t v5 = 0;
      if (v6) {
        sub_100019350((uint64_t)v5, v6);
      }
      long long v7 = v5 - 2;
      v5 -= 3;
    }
    while (v7 != a2);
  }
  *(void *)(a1 + 8) = a2;
}

void sub_1000B83E4(uint64_t *a1, int *a2, int *a3, uint64_t *a4, char *a5, int *a6)
{
  uint64_t v7 = *a1;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 <= 0xAAAAAAAAAAAAAAALL)
  {
    uint64_t v15 = (uint64_t)(a1 + 2);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v7) >> 3);
    if (2 * v16 > v9) {
      unint64_t v9 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v9;
    }
    uint64_t v23 = a1 + 2;
    if (v17) {
      long long v18 = (char *)sub_100019D14(v15, v17);
    }
    else {
      long long v18 = 0;
    }
    char v19 = v18;
    long long v20 = &v18[24 * v8];
    uint64_t v21 = (uint64_t)v20;
    uint64_t v22 = &v18[24 * v17];
    sub_1000B851C((uint64_t)v20, *a2, *a3, *a4, *a5, *a6);
  }
  sub_100019424();
}

void sub_1000B8508(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000B8784((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000B851C(uint64_t a1, int a2, int a3, uint64_t a4, char a5, int a6)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(unsigned char *)(a1 + 8) = a5;
  *(_DWORD *)(a1 + 12) = a6;
  operator new();
}

void sub_1000B85B8()
{
}

uint64_t sub_1000B85DC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1000B8654((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1000B8654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - ++*(_DWORD *)(result + 24) = *(_OWORD *)(a3 - 24);
      uint64_t v8 = *(void *)(a3 - 8);
      *(void *)(a3 - 8) = 0;
      *(void *)(v7 - 8) = v8;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_1000B86F4((uint64_t)v11);
  return v9;
}

uint64_t sub_1000B86F4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1000B872C(a1);
  }
  return a1;
}

void sub_1000B872C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(uint64_t **)(*(void *)(a1 + 8) + 8);
  if (v1 != v2)
  {
    uint64_t v3 = v1 + 2;
    do
    {
      uint64_t v4 = *v3;
      uint64_t *v3 = 0;
      if (v4) {
        sub_100019350((uint64_t)v3, v4);
      }
      uint64_t v5 = v3 + 1;
      v3 += 3;
    }
    while (v5 != v2);
  }
}

uint64_t sub_1000B8784(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_1000B87BC(uint64_t a1, uint64_t a2)
{
  for (uint64_t result = *(void *)(a1 + 16); result != a2; uint64_t result = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = result - 24;
    uint64_t v7 = *(void *)(result - 8);
    uint64_t v5 = (void *)(result - 8);
    uint64_t v6 = v7;
    *uint64_t v5 = 0;
    if (v7) {
      sub_100019350((uint64_t)v5, v6);
    }
  }
  return result;
}

void sub_1000B8810(uint64_t *a1, int *a2, int *a3, uint64_t *a4, char *a5, int *a6)
{
  uint64_t v7 = *a1;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 <= 0xAAAAAAAAAAAAAAALL)
  {
    uint64_t v15 = (uint64_t)(a1 + 2);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v7) >> 3);
    if (2 * v16 > v9) {
      unint64_t v9 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v9;
    }
    uint64_t v23 = a1 + 2;
    if (v17) {
      long long v18 = (char *)sub_100019D14(v15, v17);
    }
    else {
      long long v18 = 0;
    }
    char v19 = v18;
    long long v20 = &v18[24 * v8];
    uint64_t v21 = (uint64_t)v20;
    uint64_t v22 = &v18[24 * v17];
    sub_1000B851C((uint64_t)v20, *a2, *a3, *a4, *a5, *a6);
  }
  sub_100019424();
}

void sub_1000B8934(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000B8784((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000B8948()
{
}

void sub_1000B90F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  std::string __p = &a16;
  sub_10002179C(&__p);
  (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
  _Unwind_Resume(a1);
}

void sub_1000B9230(uint64_t a1)
{
  v12[0] = 0;
  v12[1] = 0;
  uint64_t v11 = v12;
  unint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 64))(a1, 0);
  if (v2)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 72))(__p, a1, v4);
      uint64_t v8 = v4;
      long long v13 = &v8;
      uint64_t v6 = sub_1000B9CCC(&v11, &v8, (uint64_t)&unk_1000CFBB9, &v13);
      uint64_t v7 = v6 + 5;
      if (*((char *)v6 + 63) < 0) {
        operator delete((void *)*v7);
      }
      *(_OWORD *)uint64_t v7 = *(_OWORD *)__p;
      v7[2] = v10;
      if (++v5 < v2) {
        uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, v5);
      }
    }
    while (v2 != v5);
  }
  operator new();
}

void sub_1000B9528(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  operator delete();
}

uint64_t sub_1000B95A0(uint64_t a1, int a2)
{
  sub_1000668E4(v35);
  if ((*((unsigned char *)&v35[4] + (unint64_t)*(v35[0] - 3)) & 5) != 0)
  {
    sub_100009CF0(&__p, "ERROR");
    sub_10002D454((BOOL *)v24, (uint64_t)&__p);
    uint64_t v4 = sub_10002D07C(&std::cerr, (uint64_t)"FstReadSymbols: Can't open file ", 32);
    int v5 = *(char *)(a1 + 23);
    if (v5 >= 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = *(void *)a1;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v7 = *(void *)(a1 + 8);
    }
    sub_10002D07C(v4, v6, v7);
    sub_10002D500(v24);
    if (SHIBYTE(v28) < 0) {
      operator delete(__p);
    }
    uint64_t v8 = 0;
    goto LABEL_41;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  *(_OWORD *)uint64_t v29 = 0u;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v32 = -1;
  if ((sub_1000C1718((uint64_t)&__p, (uint64_t)v35, a1, 0) & 1) == 0)
  {
    sub_100009CF0(v24, "ERROR");
    sub_10002D454(&v26, (uint64_t)v24);
    unint64_t v17 = sub_10002D07C(&std::cerr, (uint64_t)"FstReadSymbols: Couldn't read header from ", 42);
    int v18 = *(char *)(a1 + 23);
    if (v18 >= 0) {
      uint64_t v19 = a1;
    }
    else {
      uint64_t v19 = *(void *)a1;
    }
    if (v18 >= 0) {
      uint64_t v20 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v20 = *(void *)(a1 + 8);
    }
    goto LABEL_33;
  }
  char v9 = BYTE4(v31);
  if (BYTE4(v31))
  {
    uint64_t v10 = sub_100067684(v35, (const std::string *)a1);
    uint64_t v8 = v10;
    if (!v10)
    {
      sub_100009CF0(v24, "ERROR");
      sub_10002D454(&v26, (uint64_t)v24);
      unint64_t v17 = sub_10002D07C(&std::cerr, (uint64_t)"FstReadSymbols: Couldn't read input symbols from ", 49);
      int v22 = *(char *)(a1 + 23);
      if (v22 >= 0) {
        uint64_t v19 = a1;
      }
      else {
        uint64_t v19 = *(void *)a1;
      }
      if (v22 >= 0) {
        uint64_t v20 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        uint64_t v20 = *(void *)(a1 + 8);
      }
      goto LABEL_33;
    }
    if (a2) {
      goto LABEL_37;
    }
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    char v9 = BYTE4(v31);
  }
  if ((v9 & 2) == 0)
  {
LABEL_20:
    sub_100009CF0(v24, "ERROR");
    sub_10002D454(&v26, (uint64_t)v24);
    char v12 = sub_10002D07C(&std::cerr, (uint64_t)"FstReadSymbols: The file ", 25);
    int v13 = *(char *)(a1 + 23);
    if (v13 >= 0) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = *(void *)a1;
    }
    if (v13 >= 0) {
      uint64_t v15 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v15 = *(void *)(a1 + 8);
    }
    unint64_t v16 = sub_10002D07C(v12, v14, v15);
    sub_10002D07C(v16, (uint64_t)" doesn't contain the requested symbols", 38);
    goto LABEL_34;
  }
  uint64_t v11 = sub_100067684(v35, (const std::string *)a1);
  uint64_t v8 = v11;
  if (!v11)
  {
    sub_100009CF0(v24, "ERROR");
    sub_10002D454(&v26, (uint64_t)v24);
    unint64_t v17 = sub_10002D07C(&std::cerr, (uint64_t)"FstReadSymbols: Couldn't read output symbols from ", 50);
    int v23 = *(char *)(a1 + 23);
    if (v23 >= 0) {
      uint64_t v19 = a1;
    }
    else {
      uint64_t v19 = *(void *)a1;
    }
    if (v23 >= 0) {
      uint64_t v20 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v20 = *(void *)(a1 + 8);
    }
LABEL_33:
    sub_10002D07C(v17, v19, v20);
LABEL_34:
    sub_10002D500(&v26);
    if (v25 < 0) {
      operator delete(v24[0]);
    }
    uint64_t v8 = 0;
    goto LABEL_37;
  }
  if (a2)
  {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    goto LABEL_20;
  }
LABEL_37:
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[1]);
  }
  if (SHIBYTE(v29[0]) < 0) {
    operator delete((void *)v28);
  }
LABEL_41:
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return v8;
}

void sub_1000B99B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_10002F7F0((uint64_t)&a20);
  sub_100066F38(&a35);
  _Unwind_Resume(a1);
}

BOOL sub_1000B9A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 < 1)
  {
    return 1;
  }
  else
  {
    BOOL v8 = 0;
    uint64_t v9 = 0;
    while (1)
    {
      std::to_string(&v17, v9);
      int v10 = *(char *)(a1 + 23);
      if (v10 >= 0) {
        uint64_t v11 = (const std::string::value_type *)a1;
      }
      else {
        uint64_t v11 = *(const std::string::value_type **)a1;
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        std::string::size_type v12 = *(void *)(a1 + 8);
      }
      int v13 = std::string::insert(&v17, 0, v11, v12);
      long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      std::string::size_type v19 = v13->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v14;
      v13->__r_.__value_.__l.__size_ = 0;
      v13->__r_.__value_.__r.__words[2] = 0;
      v13->__r_.__value_.__r.__words[0] = 0;
      uint64_t v15 = (*(uint64_t (**)(uint64_t, void **, uint64_t))(*(void *)a4 + 24))(a4, __p, a2 + v9);
      if (SHIBYTE(v19) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      if (a2 + v9 != v15) {
        break;
      }
      BOOL v8 = ++v9 >= a3;
      if (a3 == v9) {
        return v8;
      }
    }
    if (byte_1000FE8F0) {
      sub_100009CF0(__p, "FATAL");
    }
    else {
      sub_100009CF0(__p, "ERROR");
    }
    sub_10002D454((BOOL *)&v17, (uint64_t)__p);
    sub_10002D07C(&std::cerr, (uint64_t)"AddAuxiliarySymbols: Symbol table clash", 39);
    sub_10002D500(&v17);
    if (SHIBYTE(v19) < 0) {
      operator delete(__p[0]);
    }
  }
  return v8;
}

void sub_1000B9C04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000B9C68(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_1000B9C68(a1, *(void *)a2);
    sub_1000B9C68(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

uint64_t *sub_1000B9CCC(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x40uLL);
    uint64_t v12 = **a4;
    v11[6] = 0;
    v11[7] = 0;
    v11[4] = v12;
    v11[5] = 0;
    sub_10001AD30(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t sub_1000B9D90(uint64_t a1, char a2)
{
  *(unsigned char *)a1 = a2;
  sub_100009CF0((void *)(a1 + 8), off_1000FE890[0]);
  return a1;
}

void *sub_1000B9DC4(void *a1)
{
  *a1 = -1;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  sub_1000BDA08(a1 + 5, 0x10uLL);
  uint64_t v3 = (void *)a1[5];
  unint64_t v2 = (void *)a1[6];
  for (a1[8] = v2 - v3 - 1; v3 != v2; ++v3)
    void *v3 = *a1;
  return a1;
}

void sub_1000B9E3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10002179C((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000B9E58(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = -1;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + ++*(_DWORD *)(result + 24) = 0;
  sub_1000BDA80((char *)(a1 + 8), *(long long **)(a2 + 8), *(long long **)(a2 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3));
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  sub_1000BD98C((void *)(a1 + 40), *(const void **)(a2 + 40), *(void *)(a2 + 48), (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

void sub_1000B9EEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10002179C((void ***)va);
  _Unwind_Resume(a1);
}

unint64_t sub_1000B9F08(uint64_t *a1, long long *a2)
{
  uint64_t v4 = a1 + 1;
  uint64_t v5 = a1[6] - a1[5];
  if ((float)((float)(unint64_t)(v5 >> 3) * 0.75) <= (float)(0xAAAAAAAAAAAAAAABLL * ((a1[2] - a1[1]) >> 3))) {
    sub_1000BA0B8(a1, v5 >> 2);
  }
  unint64_t v6 = sub_1000BA1EC((uint64_t)(a1 + 4), (uint64_t)a2);
  uint64_t v7 = a1[8];
  uint64_t v8 = a1[5];
  uint64_t v9 = v6 & v7;
  unint64_t v10 = *(void *)(v8 + 8 * (v6 & v7));
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  int v23 = a2;
  if (v10 != *a1)
  {
    char v16 = *((unsigned char *)a2 + 23);
    if (v16 >= 0) {
      uint64_t v17 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      uint64_t v17 = *((void *)a2 + 1);
    }
    if (v16 < 0) {
      a2 = *(long long **)a2;
    }
    do
    {
      int v18 = (unsigned __int8 *)(v11 + 24 * v10);
      uint64_t v19 = v18[23];
      if ((v19 & 0x80u) == 0) {
        uint64_t v20 = v18[23];
      }
      else {
        uint64_t v20 = *((void *)v18 + 1);
      }
      if (v20 == v17)
      {
        if ((v19 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v18, a2, *((void *)v18 + 1))) {
            return v10;
          }
        }
        else
        {
          if (!v18[23]) {
            return v10;
          }
          for (uint64_t i = a2; *v18 == *(unsigned __int8 *)i; uint64_t i = (long long *)((char *)i + 1))
          {
            ++v18;
            if (!--v19) {
              return v10;
            }
          }
        }
      }
      uint64_t v9 = (v9 + 1) & v7;
      unint64_t v10 = *(void *)(v8 + 8 * v9);
    }
    while (v10 != v12);
  }
  unint64_t v14 = a1[2];
  unint64_t v13 = a1[3];
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - v11) >> 3);
  *(void *)(v8 + 8 * v9) = v10;
  if (v14 >= v13)
  {
    uint64_t v15 = sub_1000BE0B4(v4, v23);
  }
  else
  {
    sub_100022F40(v4, v23);
    uint64_t v15 = v14 + 24;
  }
  a1[2] = v15;
  return v10;
}

void sub_1000BA0B8(void *a1, unint64_t a2)
{
  sub_1000BA334((uint64_t)(a1 + 5), a2);
  uint64_t v4 = (void *)a1[5];
  uint64_t v3 = (void *)a1[6];
  for (a1[8] = v3 - v4 - 1; v4 != v3; ++v4)
    *uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (a1[2] != v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = (long long *)(v5 + 24 * v6);
      if (*((char *)v7 + 23) < 0)
      {
        sub_10006770C(__p, *(void **)v7, *((void *)v7 + 1));
      }
      else
      {
        long long v8 = *v7;
        uint64_t v14 = *((void *)v7 + 2);
        *(_OWORD *)std::string __p = v8;
      }
      unint64_t v9 = sub_1000BA1EC((uint64_t)(a1 + 4), (uint64_t)__p);
      uint64_t v10 = a1[8];
      if (SHIBYTE(v14) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v11 = v10 & v9;
      uint64_t v12 = a1[5];
      if (*(void *)(v12 + 8 * (v10 & v9)) != *a1)
      {
        do
          uint64_t v11 = a1[8] & (v11 + 1);
        while (*(void *)(v12 + 8 * v11) != *a1);
      }
      *(void *)(v12 + 8 * v11) = v6++;
      uint64_t v5 = a1[1];
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v5) >> 3));
  }
}

unint64_t sub_1000BA1EC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return sub_1000BDC48((uint64_t)&v5, (uint64_t *)a2, v3);
}

uint64_t sub_1000BA22C(uint64_t *a1, uint64_t a2)
{
  unint64_t v2 = (unsigned char *)a2;
  unint64_t v4 = sub_1000BA1EC((uint64_t)(a1 + 4), a2);
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[5];
  uint64_t v7 = *a1;
  uint64_t v8 = v4 & v5;
  uint64_t v9 = *(void *)(v6 + 8 * (v4 & v5));
  if (v9 != *a1)
  {
    uint64_t v11 = a1[1];
    char v12 = v2[23];
    if (v12 >= 0) {
      uint64_t v13 = v2[23];
    }
    else {
      uint64_t v13 = *((void *)v2 + 1);
    }
    if (v12 < 0) {
      unint64_t v2 = *(unsigned char **)v2;
    }
    do
    {
      uint64_t v14 = (unsigned __int8 *)(v11 + 24 * v9);
      uint64_t v15 = v14[23];
      if ((v15 & 0x80u) == 0) {
        uint64_t v16 = v14[23];
      }
      else {
        uint64_t v16 = *((void *)v14 + 1);
      }
      if (v16 == v13)
      {
        if ((v15 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v14, v2, *((void *)v14 + 1))) {
            return v9;
          }
        }
        else
        {
          if (!v14[23]) {
            return v9;
          }
          for (uint64_t i = v2; *v14 == *i; ++i)
          {
            ++v14;
            if (!--v15) {
              return v9;
            }
          }
        }
      }
      uint64_t v8 = (v8 + 1) & v5;
      uint64_t v9 = *(void *)(v6 + 8 * v8);
    }
    while (v9 != v7);
  }
  return v7;
}

void sub_1000BA334(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    sub_1000BE1D8((char **)a1, a2 - v2);
  }
}

void sub_1000BA364(uint64_t a1, uint64_t a2)
{
  sub_1000BE2F4((uint64_t)&v6, (long long *)(*(void *)(a1 + 8) + 24 * a2 + 24), *(long long **)(a1 + 16), *(void *)(a1 + 8) + 24 * a2);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5 != v3)
  {
    do
    {
      if (*(char *)(v5 - 1) < 0) {
        operator delete(*(void **)(v5 - 24));
      }
      v5 -= 24;
    }
    while (v5 != v4);
  }
  *(void *)(a1 + 16) = v4;
  sub_1000BA0B8((void *)a1, (uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 40)) >> 3);
}

void sub_1000BA3F0(uint64_t a1)
{
}

void sub_1000BA888(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,std::locale a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_1000BA948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  if (a3 == -1) {
    return -1;
  }
  unint64_t v6 = sub_1000B9F08((uint64_t *)(a1 + 40), (long long *)a2);
  if (v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3) - 1 == a3
      && *(void *)(a1 + 32) == a3)
    {
      *(void *)(a1 + 32) = a3 + 1;
      uint64_t v9 = a3;
    }
    else
    {
      unint64_t v10 = *(void *)(a1 + 128);
      uint64_t v11 = *(uint64_t **)(a1 + 120);
      if ((unint64_t)v11 >= v10)
      {
        uint64_t v20 = *(uint64_t **)(a1 + 112);
        uint64_t v21 = v11 - v20;
        if ((unint64_t)(v21 + 1) >> 61) {
          sub_100019424();
        }
        unint64_t v22 = v10 - (void)v20;
        unint64_t v23 = (uint64_t)(v10 - (void)v20) >> 2;
        if (v23 <= v21 + 1) {
          unint64_t v23 = v21 + 1;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v23;
        }
        if (v24)
        {
          char v25 = (char *)sub_10001943C(a1 + 128, v24);
          uint64_t v20 = *(uint64_t **)(a1 + 112);
          uint64_t v11 = *(uint64_t **)(a1 + 120);
        }
        else
        {
          char v25 = 0;
        }
        BOOL v26 = (uint64_t *)&v25[8 * v21];
        uint64_t v27 = &v25[8 * v24];
        *BOOL v26 = a3;
        char v12 = v26 + 1;
        while (v11 != v20)
        {
          uint64_t v28 = *--v11;
          *--BOOL v26 = v28;
        }
        *(void *)(a1 + 112) = v26;
        *(void *)(a1 + 120) = v12;
        *(void *)(a1 + 128) = v27;
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *uint64_t v11 = a3;
        char v12 = v11 + 1;
      }
      *(void *)(a1 + 120) = v12;
      uint64_t v29 = -1 - 0x5555555555555555 * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3);
      __p[0] = &v33;
      sub_1000BE368((uint64_t **)(a1 + 136), &v33, (uint64_t)&unk_1000CFBCE, (uint64_t **)__p)[5] = v29;
      uint64_t v9 = v33;
    }
    if (v9 >= *(void *)(a1 + 24)) {
      *(void *)(a1 + ++*(_DWORD *)(result + 24) = v9 + 1;
    }
    *(unsigned char *)(a1 + 1--*(_DWORD *)(a9 + 60) = 0;
  }
  else
  {
    uint64_t v8 = sub_1000BB5AC((void *)a1, v6);
    if (v8 == a3)
    {
      return a3;
    }
    else
    {
      uint64_t v9 = v8;
      if (dword_1000FF640 >= 1)
      {
        sub_100009CF0(__p, "INFO");
        sub_10002D454(&v34, (uint64_t)__p);
        uint64_t v13 = sub_10002D07C(&std::cerr, (uint64_t)"SymbolTable::AddSymbol: symbol = ", 33);
        int v14 = *(char *)(a2 + 23);
        if (v14 >= 0) {
          uint64_t v15 = a2;
        }
        else {
          uint64_t v15 = *(void *)a2;
        }
        if (v14 >= 0) {
          uint64_t v16 = *(unsigned __int8 *)(a2 + 23);
        }
        else {
          uint64_t v16 = *(void *)(a2 + 8);
        }
        uint64_t v17 = sub_10002D07C(v13, v15, v16);
        sub_10002D07C(v17, (uint64_t)" already in symbol_map_ with key = ", 35);
        int v18 = (void *)std::ostream::operator<<();
        sub_10002D07C(v18, (uint64_t)" but supplied new key = ", 24);
        uint64_t v19 = (void *)std::ostream::operator<<();
        sub_10002D07C(v19, (uint64_t)" (ignoring new key)", 19);
        sub_10002D500(&v34);
        if (v32 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }
  return v9;
}

void sub_1000BABDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000BAC08(uint64_t a1)
{
  unint64_t v2 = (std::mutex *)(a1 + 216);
  std::mutex::lock((std::mutex *)(a1 + 216));
  int v3 = *(unsigned __int8 *)(a1 + 160);
  std::mutex::unlock(v2);
  if (!v3)
  {
    std::mutex::lock(v2);
    if (!*(unsigned char *)(a1 + 160))
    {
      uint64_t v57 = v2;
      sub_1000BD3B0((uint64_t)&v70);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v4 = *(void *)(a1 + 56);
      if (v4 != v5)
      {
        unint64_t v6 = 0;
        do
        {
          char v7 = (char *)(v5 + 24 * v6);
          if (v7[23] < 0)
          {
            uint64_t v8 = *((unsigned int *)v7 + 2);
            char v7 = *(char **)v7;
          }
          else
          {
            uint64_t v8 = v7[23];
          }
          if ((int)v8 >= 1)
          {
            do
            {
              char v10 = *v7++;
              char v9 = v10;
              int v11 = v70++;
              BOOL v12 = -v11 < 0;
              int v13 = -v11 & 0x1F;
              int v14 = v11 & 0x1F;
              if (!v12) {
                int v14 = -v13;
              }
              if (v72 >= 0) {
                uint64_t v15 = &v71;
              }
              else {
                uint64_t v15 = (long long *)v71;
              }
              *((unsigned char *)v15 + v14) ^= v9;
              --v8;
            }
            while (v8);
            uint64_t v5 = *(void *)(a1 + 48);
            uint64_t v4 = *(void *)(a1 + 56);
          }
          ++v70;
          ++v6;
        }
        while (v6 < 0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3));
      }
      if (SHIBYTE(v72) < 0)
      {
        sub_10006770C(&__dst, (void *)v71, *((unint64_t *)&v71 + 1));
      }
      else
      {
        long long __dst = v71;
        uint64_t v64 = v72;
      }
      uint64_t v16 = (void **)(a1 + 168);
      if (*(char *)(a1 + 191) < 0) {
        operator delete(*v16);
      }
      *(_OWORD *)uint64_t v16 = __dst;
      *(void *)(a1 + 184) = v64;
      sub_1000BD3B0((uint64_t)&v67);
      if (*(uint64_t *)(a1 + 32) >= 1)
      {
        uint64_t v17 = 0;
        do
        {
          sub_1000BB310((uint64_t)&__dst);
          uint64_t v20 = *(void *)(a1 + 48) + 24 * v17;
          int v21 = *(char *)(v20 + 23);
          if (v21 >= 0) {
            uint64_t v22 = *(void *)(a1 + 48) + 24 * v17;
          }
          else {
            uint64_t v22 = *(void *)v20;
          }
          if (v21 >= 0) {
            uint64_t v23 = *(unsigned __int8 *)(v20 + 23);
          }
          else {
            uint64_t v23 = *(void *)(v20 + 8);
          }
          unint64_t v24 = sub_10002D07C(&__dst, v22, v23);
          LOBYTE(v61[0]) = 9;
          sub_10002D07C(v24, (uint64_t)v61, 1);
          std::ostream::operator<<();
          std::stringbuf::str();
          if (v62 >= 0) {
            char v25 = v61;
          }
          else {
            char v25 = (void **)v61[0];
          }
          std::stringbuf::str();
          int v26 = v60;
          unsigned __int8 v27 = v60;
          if ((v60 & 0x80u) != 0) {
            int v26 = v59;
          }
          if (v26 >= 1)
          {
            uint64_t v28 = v26;
            do
            {
              char v30 = *(unsigned char *)v25;
              char v25 = (void **)((char *)v25 + 1);
              char v29 = v30;
              int v31 = v67++;
              BOOL v12 = -v31 < 0;
              int v32 = -v31 & 0x1F;
              int v33 = v31 & 0x1F;
              if (!v12) {
                int v33 = -v32;
              }
              if (v69 >= 0) {
                BOOL v34 = &v68;
              }
              else {
                BOOL v34 = (long long *)v68;
              }
              *((unsigned char *)v34 + v33) ^= v29;
              --v28;
            }
            while (v28);
            unsigned __int8 v27 = v60;
          }
          if ((v27 & 0x80) != 0) {
            operator delete(__p);
          }
          if (v62 < 0) {
            operator delete(v61[0]);
          }
          *(void *)&long long __dst = v18;
          *(void *)((char *)&__dst + *(void *)(v18 - 24)) = v19;
          if (v66 < 0) {
            operator delete(v65);
          }
          std::streambuf::~streambuf();
          std::ostream::~ostream();
          std::ios::~ios();
          ++v17;
        }
        while (v17 < *(void *)(a1 + 32));
      }
      uint64_t v35 = *(void **)(a1 + 136);
      if (v35 != (void *)(a1 + 144))
      {
        do
        {
          if (v35[4] >= *(void *)(a1 + 32))
          {
            sub_1000BB310((uint64_t)&__dst);
            uint64_t v38 = *(void *)(a1 + 48) + 24 * v35[5];
            int v39 = *(char *)(v38 + 23);
            if (v39 >= 0) {
              uint64_t v40 = *(void *)(a1 + 48) + 24 * v35[5];
            }
            else {
              uint64_t v40 = *(void *)v38;
            }
            if (v39 >= 0) {
              uint64_t v41 = *(unsigned __int8 *)(v38 + 23);
            }
            else {
              uint64_t v41 = *(void *)(v38 + 8);
            }
            uint64_t v42 = sub_10002D07C(&__dst, v40, v41);
            LOBYTE(v61[0]) = 9;
            sub_10002D07C(v42, (uint64_t)v61, 1);
            std::ostream::operator<<();
            std::stringbuf::str();
            if (v62 >= 0) {
              float v43 = v61;
            }
            else {
              float v43 = (void **)v61[0];
            }
            std::stringbuf::str();
            int v44 = v60;
            unsigned __int8 v45 = v60;
            if ((v60 & 0x80u) != 0) {
              int v44 = v59;
            }
            if (v44 >= 1)
            {
              uint64_t v46 = v44;
              do
              {
                char v48 = *(unsigned char *)v43;
                float v43 = (void **)((char *)v43 + 1);
                char v47 = v48;
                int v49 = v67++;
                BOOL v12 = -v49 < 0;
                int v50 = -v49 & 0x1F;
                int v51 = v49 & 0x1F;
                if (!v12) {
                  int v51 = -v50;
                }
                if (v69 >= 0) {
                  float v52 = &v68;
                }
                else {
                  float v52 = (long long *)v68;
                }
                *((unsigned char *)v52 + v51) ^= v47;
                --v46;
              }
              while (v46);
              unsigned __int8 v45 = v60;
            }
            if ((v45 & 0x80) != 0) {
              operator delete(__p);
            }
            if (v62 < 0) {
              operator delete(v61[0]);
            }
            *(void *)&long long __dst = v36;
            *(void *)((char *)&__dst + *(void *)(v36 - 24)) = v37;
            if (v66 < 0) {
              operator delete(v65);
            }
            std::streambuf::~streambuf();
            std::ostream::~ostream();
            std::ios::~ios();
          }
          float v53 = (void *)v35[1];
          if (v53)
          {
            do
            {
              BOOL v54 = v53;
              float v53 = (void *)*v53;
            }
            while (v53);
          }
          else
          {
            do
            {
              BOOL v54 = (void *)v35[2];
              BOOL v55 = *v54 == (void)v35;
              uint64_t v35 = v54;
            }
            while (!v55);
          }
          uint64_t v35 = v54;
        }
        while (v54 != (void *)(a1 + 144));
      }
      if (SHIBYTE(v69) < 0)
      {
        unint64_t v2 = v57;
        sub_10006770C(&__dst, (void *)v68, *((unint64_t *)&v68 + 1));
      }
      else
      {
        long long __dst = v68;
        uint64_t v64 = v69;
        unint64_t v2 = v57;
      }
      int v56 = (void **)(a1 + 192);
      if (*(char *)(a1 + 215) < 0) {
        operator delete(*v56);
      }
      *(_OWORD *)int v56 = __dst;
      *(void *)(a1 + 208) = v64;
      *(unsigned char *)(a1 + 1--*(_DWORD *)(a9 + 60) = 1;
      if (SHIBYTE(v69) < 0) {
        operator delete((void *)v68);
      }
      if (SHIBYTE(v72) < 0) {
        operator delete((void *)v71);
      }
    }
    std::mutex::unlock(v2);
  }
}

void sub_1000BB288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20)
{
  if (*(char *)(v20 - 121) < 0) {
    operator delete(*(void **)(v20 - 144));
  }
  if (*(char *)(v20 - 89) < 0) {
    operator delete(*(void **)(v20 - 112));
  }
  std::mutex::unlock(a10);
  _Unwind_Resume(a1);
}

uint64_t sub_1000BB310(uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  uint64_t v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 8));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_1000BB480(_Unwind_Exception *a1)
{
}

uint64_t sub_1000BB4A8(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

uint64_t sub_1000BB5AC(void *a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0) {
    return -1;
  }
  uint64_t v3 = a1[6];
  if (0xAAAAAAAAAAAAAAABLL * ((a1[7] - v3) >> 3) <= a2) {
    return -1;
  }
  if (a1[4] <= (int64_t)a2)
  {
    uint64_t v4 = sub_1000BA22C(a1 + 5, v3 + 24 * a2);
    a2 = v4;
    if (v4 != -1)
    {
      uint64_t v5 = a1[4];
      BOOL v6 = __OFSUB__(v4, v5);
      uint64_t v7 = v4 - v5;
      if (v7 < 0 == v6) {
        return *(void *)(a1[14] + 8 * v7);
      }
    }
  }
  return a2;
}

void sub_1000BB644(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = a2;
    if (*(void *)(a1 + 32) > a2) {
      goto LABEL_14;
    }
  }
  uint64_t v5 = (uint64_t *)(a1 + 144);
  BOOL v6 = *(void **)(a1 + 144);
  if (v6)
  {
    uint64_t v7 = (uint64_t **)(a1 + 136);
    uint64_t v8 = (uint64_t *)(a1 + 144);
    do
    {
      uint64_t v9 = v6[4];
      BOOL v10 = v9 < a2;
      if (v9 >= a2) {
        int v11 = v6;
      }
      else {
        int v11 = v6 + 1;
      }
      if (!v10) {
        uint64_t v8 = v6;
      }
      BOOL v6 = (void *)*v11;
    }
    while (*v11);
    if (v8 != v5 && v8[4] <= a2)
    {
      uint64_t v4 = v8[5];
      sub_100032B18(v7, v8);
      operator delete(v8);
      if ((v4 & 0x8000000000000000) == 0)
      {
LABEL_14:
        if (v4 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3))
        {
          sub_1000BA364(a1 + 40, v4);
          BOOL v12 = *(void **)(a1 + 136);
          if (v12 != (void *)(a1 + 144))
          {
            do
            {
              uint64_t v13 = v12[5];
              if (v13 > v4) {
                v12[5] = v13 - 1;
              }
              int v14 = (void *)v12[1];
              if (v14)
              {
                do
                {
                  uint64_t v15 = v14;
                  int v14 = (void *)*v14;
                }
                while (v14);
              }
              else
              {
                do
                {
                  uint64_t v15 = (void *)v12[2];
                  BOOL v16 = *v15 == (void)v12;
                  BOOL v12 = v15;
                }
                while (!v16);
              }
              BOOL v12 = v15;
            }
            while (v15 != (void *)(a1 + 144));
          }
          uint64_t v17 = *(void *)(a1 + 32);
          if (a2 < 0 || v17 <= a2)
          {
            uint64_t v27 = *(void *)(a1 + 112);
            uint64_t v26 = *(void *)(a1 + 120);
            uint64_t v28 = (v26 - v27) >> 3;
            if (v4 - v17 < (unint64_t)(v28 - 1))
            {
              uint64_t v29 = ~v4 + v17 + v28;
              char v30 = (void *)(v27 - 8 * v17 + 8 * v4 + 8);
              do
              {
                *(v30 - 1) = *v30;
                ++v30;
                --v29;
              }
              while (v29);
            }
            *(void *)(a1 + 120) = v26 - 8;
          }
          else
          {
            uint64_t v31 = a2 + 1;
            if (a2 + 1 < v17)
            {
              uint64_t v18 = a2;
              do
              {
                int v32 = &v31;
                sub_1000BE368((uint64_t **)(a1 + 136), &v31, (uint64_t)&unk_1000CFBCE, &v32)[5] = v18;
                uint64_t v18 = v31++;
              }
              while (v31 < *(void *)(a1 + 32));
            }
            uint64_t v19 = (void *)(a1 + 112);
            sub_1000BA334(a1 + 112, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3) - a2);
            int64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3);
            int64_t v21 = *(void *)(a1 + 32);
            if (v20 >= v21)
            {
              uint64_t v22 = (void *)*v19;
              uint64_t v23 = *v19 - 8 * a2;
              do
              {
                *(void *)(v23 + 8 * v20 - 8) = v22[v20 - v21];
                int64_t v21 = *(void *)(a1 + 32);
                BOOL v10 = v20-- <= v21;
              }
              while (!v10);
            }
            if (v21 - 1 > a2)
            {
              unint64_t v24 = (void *)*v19;
              uint64_t v25 = a2;
              do
                *v24++ = ++v25;
              while (v25 < *(void *)(a1 + 32) - 1);
            }
            *(void *)(a1 + 32) = a2;
          }
          if (*(void *)(a1 + 24) - 1 == a2) {
            *(void *)(a1 + ++*(_DWORD *)(result + 24) = a2;
          }
        }
      }
    }
  }
}

uint64_t sub_1000BB8EC(void *a1)
{
  int v6 = 0;
  std::istream::read();
  if ((*((unsigned char *)a1 + *(void *)(*a1 - 24) + 32) & 5) == 0)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v5 = 0;
    LODWORD(v3.__r_.__value_.__l.__data_) = 0;
    std::istream::read();
    operator new();
  }
  sub_100009CF0(__p, "ERROR");
  sub_10002D454((BOOL *)&v3, (uint64_t)__p);
  sub_10002D07C(&std::cerr, (uint64_t)"SymbolTable::Read: Read failed", 30);
  sub_10002D500(&v3);
  if (SHIBYTE(v5) < 0) {
    operator delete(__p[0]);
  }
  return 0;
}

void sub_1000BBC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  sub_10002D500((unsigned char *)(v30 - 49));
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  sub_100067A7C(&a24, 0);
  if (a30 < 0) {
    operator delete(a25);
  }
  _Unwind_Resume(a1);
}

BOOL sub_1000BBD40(uint64_t a1, void *a2)
{
  LODWORD(__p[0]) = 2125658996;
  std::ostream::write();
  LODWORD(v4) = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  LODWORD(__p[0]) = v4;
  std::ostream::write();
  std::ostream::write();
  __p[0] = *(void **)(a1 + 24);
  std::ostream::write();
  uint64_t v5 = *(void *)(a1 + 56) - *(void *)(a1 + 48);
  uint64_t v6 = v5 / 24;
  __p[0] = (void *)(v5 / 24);
  std::ostream::write();
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if (v6 <= 1) {
      uint64_t v6 = 1;
    }
    do
    {
      uint64_t v9 = *(void *)(a1 + 32);
      BOOL v10 = (void *)v8;
      if (v8 >= v9) {
        BOOL v10 = *(void **)(*(void *)(a1 + 112) - 8 * v9 + 8 * v8);
      }
      std::ostream::write();
      std::ostream::write();
      __p[0] = v10;
      std::ostream::write();
      ++v8;
      v7 += 24;
    }
    while (v6 != v8);
  }
  std::ostream::flush();
  int v11 = *(_DWORD *)((unsigned char *)a2 + *(void *)(*a2 - 24) + 32) & 5;
  if (v11)
  {
    sub_100009CF0(__p, "ERROR");
    sub_10002D454(&v15, (uint64_t)__p);
    sub_10002D07C(&std::cerr, (uint64_t)"SymbolTable::Write: Write failed", 32);
    sub_10002D500(&v15);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  return v11 == 0;
}

void sub_1000BBF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1000BBF84(uint64_t a1, uint64_t a2)
{
  sub_1000BC0DC(a1);
  unint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 64))(a2, 0);
  if (v4)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(a1 + 8);
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a2 + 72))(__p, a2, v6);
      sub_1000BA948(v8, (uint64_t)__p, *(void *)(v8 + 24));
      if (v10 < 0) {
        operator delete(__p[0]);
      }
      if (++v7 < v4) {
        uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 64))(a2, v7);
      }
    }
    while (v4 != v7);
  }
}

void sub_1000BC0C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000BC0DC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (!v1 || *(void *)(v1 + 8)) {
    operator new();
  }
  return result;
}

void sub_1000BC154()
{
}

BOOL sub_1000BC178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(a3 + 31);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a3 + 16);
  }
  uint64_t v19 = v3;
  if (v3)
  {
    unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 64))(a1, 0);
    if (v6)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = 0;
      do
      {
        sub_1000BB310((uint64_t)v26);
        BOOL v12 = v8 >= 0 || *(unsigned char *)a3 != 0;
        if (((v12 | v9) & 1) == 0)
        {
          sub_100009CF0(__p, "WARNING");
          sub_10002D454((BOOL *)&v22, (uint64_t)__p);
          sub_10002D07C(&std::cerr, (uint64_t)"Negative symbol table entry when not allowed", 44);
          sub_10002D500(&v22);
          if ((char)v25 < 0) {
            operator delete(__p[0]);
          }
          int v9 = 1;
        }
        (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 72))(__p, a1, v8);
        if ((v25 & 0x80u) == 0) {
          uint64_t v13 = __p;
        }
        else {
          uint64_t v13 = (void **)__p[0];
        }
        if ((v25 & 0x80u) == 0) {
          uint64_t v14 = v25;
        }
        else {
          uint64_t v14 = (uint64_t)__p[1];
        }
        BOOL v15 = sub_10002D07C(v26, (uint64_t)v13, v14);
        BOOL v16 = (unsigned char *)(a3 + 8);
        if (*(char *)(a3 + 31) < 0) {
          BOOL v16 = *(unsigned char **)(a3 + 8);
        }
        LOBYTE(v22) = *v16;
        sub_10002D07C(v15, (uint64_t)&v22, 1);
        uint64_t v17 = (void *)std::ostream::operator<<();
        LOBYTE(v22) = 10;
        sub_10002D07C(v17, (uint64_t)&v22, 1);
        if ((char)v25 < 0) {
          operator delete(__p[0]);
        }
        std::stringbuf::str();
        std::stringbuf::str();
        std::ostream::write();
        if (v23 < 0) {
          operator delete(v22);
        }
        if ((char)v25 < 0) {
          operator delete(__p[0]);
        }
        v26[0] = v21;
        *(void **)((char *)v26 + *((void *)v21 - 3)) = v20;
        if (v29 < 0) {
          operator delete(v28);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        std::ios::~ios();
        if (++v10 < v6) {
          uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, v10);
        }
      }
      while (v6 != v10);
    }
  }
  else
  {
    sub_100009CF0(v26, "ERROR");
    sub_10002D454((BOOL *)__p, (uint64_t)v26);
    sub_10002D07C(&std::cerr, (uint64_t)"Missing required field separator", 32);
    sub_10002D500(__p);
    if (v27 < 0) {
      operator delete(v26[0]);
    }
  }
  return v19 != 0;
}

void sub_1000BC56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL sub_1000BC600(uint64_t a1, uint64_t a2, int a3)
{
  if (!byte_1000FE888) {
    return 1;
  }
  BOOL result = 1;
  if (!a1 || !a2) {
    return result;
  }
  uint64_t v7 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 88))(a2);
  uint64_t v9 = v7[23];
  if ((v9 & 0x80u) == 0) {
    uint64_t v10 = v7[23];
  }
  else {
    uint64_t v10 = *((void *)v7 + 1);
  }
  uint64_t v11 = *(unsigned __int8 *)(v8 + 23);
  int v12 = (char)v11;
  if ((v11 & 0x80u) != 0) {
    uint64_t v11 = *(void *)(v8 + 8);
  }
  if (v10 != v11) {
    goto LABEL_20;
  }
  if (v12 >= 0) {
    uint64_t v13 = (unsigned __int8 *)v8;
  }
  else {
    uint64_t v13 = *(unsigned __int8 **)v8;
  }
  if ((v9 & 0x80) != 0)
  {
    BOOL result = memcmp(*(const void **)v7, v13, *((void *)v7 + 1)) == 0;
    if (result) {
      return result;
    }
    goto LABEL_22;
  }
  if (!v7[23]) {
    return 1;
  }
  BOOL result = 1;
  while (*v7 == *v13)
  {
    ++v7;
    ++v13;
    if (!--v9) {
      return result;
    }
  }
LABEL_20:
  BOOL result = 0;
LABEL_22:
  if (a3)
  {
    sub_100009CF0(__p, "WARNING");
    sub_10002D454(&v18, (uint64_t)__p);
    uint64_t v14 = sub_10002D07C(&std::cerr, (uint64_t)"CompatSymbols: Symbol table checksums do not match. ", 52);
    sub_10002D07C(v14, (uint64_t)"Table sizes are ", 16);
    (*(void (**)(uint64_t))(*(void *)a1 + 120))(a1);
    BOOL v15 = (void *)std::ostream::operator<<();
    sub_10002D07C(v15, (uint64_t)" and ", 5);
    (*(void (**)(uint64_t))(*(void *)a2 + 120))(a2);
    std::ostream::operator<<();
    sub_10002D500(&v18);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    return 0;
  }
  return result;
}

void sub_1000BC81C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000BC848(uint64_t a1, uint64_t a2)
{
  sub_1000BB310((uint64_t)v7);
  (*(void (**)(uint64_t, void *))(*(void *)a1 + 144))(a1, v7);
  std::stringbuf::str();
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  *(_OWORD *)a2 = v5;
  *(void *)(a2 + 16) = v6;
  if (v8 < 0) {
    operator delete((void *)v7[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_1000BC9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_1000BB4A8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000BC9D4(const std::string *a1)
{
  sub_10006C004(v3, a1, 8);
  uint64_t v1 = sub_1000677AC(v3);
  if (v4 < 0) {
    operator delete(v3[10]);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  std::ios::~ios();
  return v1;
}

void sub_1000BCB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void *sub_1000BCB50(void *a1)
{
  *a1 = off_1000F44E8;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    sub_100018BC0(v2);
  }
  return a1;
}

void sub_1000BCB9C(void *a1)
{
  *a1 = off_1000F44E8;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    sub_100018BC0(v1);
  }
  operator delete();
}

void sub_1000BCC08()
{
}

uint64_t sub_1000BCC74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000BC0DC(a1);
  uint64_t v6 = *(void *)(a1 + 8);
  return sub_1000BA948(v6, a2, a3);
}

uint64_t sub_1000BCCC4(uint64_t a1, uint64_t a2)
{
  sub_1000BC0DC(a1);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  return sub_1000BA948(v4, a2, v5);
}

uint64_t sub_1000BCD08(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 24);
}

uint64_t sub_1000BCD14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  sub_1000BAC08(v1);
  return v1 + 168;
}

uint64_t sub_1000BCD40(uint64_t a1, unint64_t a2)
{
  return sub_1000BB5AC(*(void **)(a1 + 8), a2);
}

void *sub_1000BCD48@<X0>(uint64_t a1@<X0>, int64_t a2@<X1>, void *a3@<X8>)
{
  return sub_1000BD880(*(void **)(a1 + 8), a2, a3);
}

uint64_t sub_1000BCD50(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t result = sub_1000BA22C(v2 + 5, a2);
  if (result != -1)
  {
    uint64_t v4 = v2[4];
    BOOL v5 = __OFSUB__(result, v4);
    uint64_t v6 = result - v4;
    if (v6 < 0 == v5) {
      return *(void *)(v2[14] + 8 * v6);
    }
  }
  return result;
}

uint64_t sub_1000BCD94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  sub_1000BAC08(v1);
  return v1 + 192;
}

BOOL sub_1000BCDC0(uint64_t a1, int64_t a2)
{
  return sub_1000BD938(*(void **)(a1 + 8), a2);
}

BOOL sub_1000BCDC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = sub_1000BA22C(v2 + 5, a2);
  if (v3 == -1) {
    return 0;
  }
  uint64_t v4 = v2[4];
  BOOL v5 = __OFSUB__(v3, v4);
  uint64_t v6 = v3 - v4;
  return v6 < 0 != v5 || *(void *)(v2[14] + 8 * v6) != -1;
}

uint64_t sub_1000BCE24(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

unint64_t sub_1000BCE2C(uint64_t a1)
{
  return 0xAAAAAAAAAAAAAAABLL
       * ((uint64_t)(*(void *)(*(void *)(a1 + 8) + 56) - *(void *)(*(void *)(a1 + 8) + 48)) >> 3);
}

void sub_1000BCE4C(uint64_t a1, uint64_t a2)
{
  sub_1000BC0DC(a1);
  uint64_t v4 = *(void *)(a1 + 8);
  sub_1000BB644(v4, a2);
}

std::string *sub_1000BCE8C(uint64_t a1, const std::string *a2)
{
  sub_1000BC0DC(a1);
  uint64_t v4 = *(std::string **)(a1 + 8);
  return std::string::operator=(v4, a2);
}

BOOL sub_1000BCECC(uint64_t a1, void *a2)
{
  return sub_1000BBD40(*(void *)(a1 + 8), a2);
}

uint64_t sub_1000BCED4(uint64_t a1, uint64_t a2)
{
  sub_10002FE48(v13);
  if (*(_DWORD *)((char *)&v13[4] + (unint64_t)*(v13[0] - 3)))
  {
    sub_100009CF0(__p, "ERROR");
    sub_10002D454(&v12, (uint64_t)__p);
    uint64_t v4 = sub_10002D07C(&std::cerr, (uint64_t)"SymbolTable::Write: Can't open file ", 36);
    int v5 = *(char *)(a2 + 23);
    if (v5 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(void *)a2;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v7 = *(void *)(a2 + 8);
    }
    sub_10002D07C(v4, v6, v7);
    sub_10002D500(&v12);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, void (__cdecl ***)(std::ofstream *__hidden)))(*(void *)a1 + 144))(a1, v13);
  }
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return v8;
}

void sub_1000BD0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
}

uint64_t sub_1000BD0FC(uint64_t a1, uint64_t a2)
{
  sub_10002FE48(v15);
  if (*(_DWORD *)((char *)&v15[4] + (unint64_t)*(v15[0] - 3)))
  {
    sub_100009CF0(&__p, "ERROR");
    sub_10002D454(&v14, (uint64_t)&__p);
    uint64_t v4 = sub_10002D07C(&std::cerr, (uint64_t)"SymbolTable::WriteText: Can't open file ", 40);
    int v5 = *(char *)(a2 + 23);
    if (v5 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(void *)a2;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v7 = *(void *)(a2 + 8);
    }
    sub_10002D07C(v4, v6, v7);
    sub_10002D500(&v14);
    if (v12 < 0) {
      operator delete(__p);
    }
    uint64_t v8 = 0;
  }
  else
  {
    LOBYTE(__p) = 0;
    sub_100009CF0(&v11, off_1000FE890[0]);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, void (__cdecl ***)(std::ofstream *__hidden), void **))(*(void *)a1 + 160))(a1, v15, &__p);
    if (v13 < 0) {
      operator delete(v11);
    }
  }
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return v8;
}

void sub_1000BD308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  sub_100030014(&a24);
  _Unwind_Resume(a1);
}

uint64_t sub_1000BD364(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
  uint64_t v4 = (void **)(a1 + 8);
  sub_10002179C(&v4);
  return a1;
}

uint64_t sub_1000BD3B0(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + ++*(_DWORD *)(result + 24) = 0;
  std::string::resize((std::string *)(a1 + 8), 0x20uLL, 0);
  return a1;
}

void sub_1000BD3FC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000BD418(uint64_t a1, uint64_t a2)
{
  sub_100067888(&v2, a2);
}

char *sub_1000BD460(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10006770C(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)long long __dst = v4;
  }
  *(_OWORD *)(__dst + ++*(_DWORD *)(result + 24) = *(long long *)((char *)a2 + 24);
  sub_1000B9E58((uint64_t)(__dst + 40), (uint64_t)a2 + 40);
  *((void *)__dst + 14) = 0;
  *((void *)__dst + 15) = 0;
  *((void *)__dst + 16) = 0;
  sub_1000BD98C((void *)__dst + 14, *((const void **)a2 + 14), *((void *)a2 + 15), (uint64_t)(*((void *)a2 + 15) - *((void *)a2 + 14)) >> 3);
  sub_1000BD56C((uint64_t *)__dst + 17, (uint64_t)a2 + 136);
  __dst[160] = 0;
  *(_OWORD *)(__dst + 168) = 0u;
  *(_OWORD *)(__dst + 184) = 0u;
  *(_OWORD *)(__dst + 200) = 0u;
  *((void *)__dst + 27) = 850045863;
  *((_OWORD *)__dst + 14) = 0u;
  *((_OWORD *)__dst + 15) = 0u;
  *((_OWORD *)__dst + 16) = 0u;
  *((void *)__dst + 34) = 0;
  return __dst;
}

void sub_1000BD528(_Unwind_Exception *a1)
{
  int v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 120) = v5;
    operator delete(v5);
  }
  sub_1000BD364(v2);
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(a1);
}

uint64_t *sub_1000BD56C(uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_1000BD5C4(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_1000BD5AC(_Unwind_Exception *a1)
{
  sub_10001B844(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_1000BD5C4(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    long long v4 = a2;
    int v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = sub_1000BD650(v5, v6, v4 + 4, (_OWORD *)v4 + 2);
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          long long v4 = v8;
        }
        while (!v9);
      }
      long long v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_1000BD650(uint64_t **a1, void *a2, uint64_t *a3, _OWORD *a4)
{
  uint64_t v6 = (void **)sub_1000BD6D8(a1, a2, &v11, &v10, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    sub_10001AD30(a1, v11, v8, v7);
  }
  return v7;
}

void *sub_1000BD6D8(void *a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (uint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      char v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        char v13 = v10;
      }
      while (v14);
    }
    uint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    BOOL v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          char v17 = v16;
          uint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          BOOL v16 = (void *)*v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        BOOL v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      char v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    char v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      char v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    int64_t v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int64_t v21 = v20;
          uint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          int64_t v20 = (void *)*v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        int64_t v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      int64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void *sub_1000BD880@<X0>(void *result@<X0>, int64_t a2@<X1>, void *a3@<X8>)
{
  if (a2 < 0 || result[4] <= a2)
  {
    uint64_t v3 = (void *)result[18];
    if (!v3) {
      return sub_100009CF0(a3, "");
    }
    long long v4 = result + 18;
    do
    {
      int64_t v5 = v3[4];
      BOOL v6 = v5 < a2;
      if (v5 >= a2) {
        uint64_t v7 = v3;
      }
      else {
        uint64_t v7 = v3 + 1;
      }
      if (!v6) {
        long long v4 = v3;
      }
      uint64_t v3 = (void *)*v7;
    }
    while (*v7);
    if (v4 == result + 18) {
      return sub_100009CF0(a3, "");
    }
    if (v4[4] > a2) {
      return sub_100009CF0(a3, "");
    }
    a2 = v4[5];
    if (a2 < 0) {
      return sub_100009CF0(a3, "");
    }
  }
  uint64_t v8 = result[6];
  if (a2 >= 0xAAAAAAAAAAAAAAABLL * ((result[7] - v8) >> 3)) {
    return sub_100009CF0(a3, "");
  }
  BOOL v9 = (long long *)(v8 + 24 * a2);
  if (*((char *)v9 + 23) < 0) {
    return sub_10006770C(a3, *(void **)v9, *((void *)v9 + 1));
  }
  long long v10 = *v9;
  a3[2] = *((void *)v9 + 2);
  *(_OWORD *)a3 = v10;
  return result;
}

BOOL sub_1000BD938(void *a1, int64_t a2)
{
  sub_1000BD880(a1, a2, v4);
  if ((v5 & 0x80000000) == 0) {
    return v5 != 0;
  }
  BOOL v2 = v4[1] != 0;
  operator delete(v4[0]);
  return v2;
}

void *sub_1000BD98C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    BOOL v6 = result;
    uint64_t result = sub_10008AF04(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1000BD9EC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000BDA08(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10008AF04(a1, a2);
    long long v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1000BDA64(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1000BDA80(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    BOOL v6 = result;
    sub_10001AAC0(result, a4);
    uint64_t result = sub_1000BDB08((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }
  return result;
}

void sub_1000BDAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_10002179C(&a9);
  _Unwind_Resume(a1);
}

char *sub_1000BDB08(uint64_t a1, long long *a2, long long *a3, char *__dst)
{
  long long v4 = __dst;
  uint64_t v11 = __dst;
  char v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    BOOL v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_10006770C(v4, *(void **)v6, *((void *)v6 + 1));
        long long v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)long long v4 = v7;
      }
      BOOL v6 = (long long *)((char *)v6 + 24);
      v4 += 24;
      char v12 = v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_1000BDBC8((uint64_t)v9);
  return v4;
}

void sub_1000BDBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1000BDBC8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1000BDC00(a1);
  }
  return a1;
}

void sub_1000BDC00(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

unint64_t sub_1000BDC48(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_1000BDFF4(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_1000BDF48(a2, a3);
  }
  else
  {
    return sub_1000BDE50(a2, a3);
  }
}

unint64_t sub_1000BDE50(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_1000BDF48(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_1000BDFF4(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_1000BE0B4(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100019424();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_100019D14(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  unint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_10006770C(v11, *(void **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v11 = v12;
  }
  unint64_t v16 = v11 + 24;
  sub_1000230C4(a1, v15);
  uint64_t v13 = a1[1];
  sub_10002325C((uint64_t)v15);
  return v13;
}

void sub_1000BE1C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10002325C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000BE1D8(char **a1, unint64_t a2)
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
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      sub_100019424();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)sub_10001943C(v4, v13);
      unint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      unint64_t v14 = 0;
    }
    uint64_t v15 = &v14[8 * v11];
    unint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    uint64_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
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

long long *sub_1000BE2F4(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      long long v7 = *v5;
      *(void *)(a4 + 16) = *((void *)v5 + 2);
      *(_OWORD *)a4 = v7;
      a4 += 24;
      *((unsigned char *)v5 + 23) = 0;
      *(unsigned char *)unint64_t v5 = 0;
      unint64_t v5 = (long long *)((char *)v5 + 24);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t *sub_1000BE368(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  long long v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        long long v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        long long v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    sub_10001AD30(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void sub_1000BE428(char *__src, int *a2, void *a3, int a4, const char *a5)
{
  strncpy(byte_1000FEDB0, __src, 0x400uLL);
  strncpy(&byte_1000FF1B0, a5, 0x400uLL);
  uint64_t v9 = 1;
  if (*a2 >= 2)
  {
    do
    {
      sub_100009CF0(&__str, *(char **)(*a3 + 8 * v9));
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        if (*__str.__r_.__value_.__l.__data_ != 45 || __str.__r_.__value_.__l.__size_ == 1)
        {
          operator delete(__str.__r_.__value_.__l.__data_);
          if (!a4) {
            goto LABEL_57;
          }
          goto LABEL_53;
        }
      }
      else if (__str.__r_.__value_.__s.__data_[0] != 45 || SHIBYTE(__str.__r_.__value_.__r.__words[2]) == 1)
      {
        break;
      }
      if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) != 0) {
        goto LABEL_13;
      }
      while (__str.__r_.__value_.__s.__data_[0] == 45)
      {
        while (1)
        {
          std::string::basic_string(&__dst, &__str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&__p);
          if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__str.__r_.__value_.__l.__data_);
          }
          std::string __str = __dst;
          if ((*((unsigned char *)&__dst.__r_.__value_.__s + 23) & 0x80) == 0) {
            break;
          }
LABEL_13:
          if (*__str.__r_.__value_.__l.__data_ != 45)
          {
            sub_10006770C(&__dst, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
            goto LABEL_19;
          }
        }
      }
      std::string __dst = __str;
LABEL_19:
      sub_100009CF0(&__p, "");
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int64_t size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else {
        int64_t size = __str.__r_.__value_.__l.__size_;
      }
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_str = &__str;
      }
      else {
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      if (size >= 1)
      {
        unint64_t v13 = (char *)p_str + size;
        unint64_t v14 = p_str;
        do
        {
          uint64_t v15 = memchr(v14, 61, size);
          if (!v15) {
            break;
          }
          if (*v15 == 61)
          {
            if (v15 != v13)
            {
              std::string::size_type v16 = v15 - (unsigned char *)p_str;
              if (v16 != -1)
              {
                std::string::basic_string(&v27, &__str, 0, v16, (std::allocator<char> *)&v31);
                if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__dst.__r_.__value_.__l.__data_);
                }
                std::string __dst = v27;
                std::string::basic_string(&v27, &__str, v16 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v31);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__p.__r_.__value_.__l.__data_);
                }
                std::string __p = v27;
              }
            }
            break;
          }
          unint64_t v14 = (std::string *)(v15 + 1);
          int64_t size = v13 - (unsigned char *)v14;
        }
        while (v13 - (unsigned char *)v14 >= 1);
      }
      uint64_t v17 = sub_1000BE8A0();
      if ((sub_1000BE954(v17, (unsigned __int8 *)&__dst, (unsigned __int8 *)&__p) & 1) == 0)
      {
        uint64_t v18 = sub_1000BEAA4();
        if ((sub_1000BEB58(v18, (unsigned __int8 *)&__dst, &__p) & 1) == 0)
        {
          uint64_t v19 = sub_1000BEC78();
          if (!sub_1000BED2C(v19, (unsigned __int8 *)&__dst, (uint64_t)&__p))
          {
            uint64_t v20 = sub_1000BEE7C();
            if (!sub_1000BEF30(v20, (unsigned __int8 *)&__dst, (uint64_t)&__p))
            {
              uint64_t v21 = sub_1000BF080();
              if (!sub_1000BF134(v21, (unsigned __int8 *)&__dst, (uint64_t)&__p))
              {
                sub_100009CF0(&v27, "FATAL");
                sub_10002D454(&v31, (uint64_t)&v27);
                uint64_t v22 = sub_10002D07C(&std::cerr, (uint64_t)"SetFlags: Bad option: ", 22);
                size_t v23 = strlen(*(const char **)(*a3 + 8 * v9));
                sub_10002D07C(v22, *(void *)(*a3 + 8 * v9), v23);
                sub_10002D500(&v31);
                if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v27.__r_.__value_.__l.__data_);
                }
              }
            }
          }
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      ++v9;
    }
    while (v9 < *a2);
  }
  if (!a4) {
    goto LABEL_57;
  }
LABEL_53:
  int v24 = *a2 - v9;
  if (v24 >= 1)
  {
    uint64_t v25 = 0;
    do
    {
      *(void *)(*a3 + v25 + 8) = *(void *)(*a3 + v25 + 8 * v9);
      v25 += 8;
    }
    while (8 * v24 != v25);
  }
  *a2 = v24 + 1;
LABEL_57:
  if (byte_1000FF644)
  {
    int v26 = 1;
    goto LABEL_64;
  }
  if (byte_1000FF645)
  {
    int v26 = 0;
LABEL_64:
    sub_1000BF284(v26);
    exit(1);
  }
}

void sub_1000BE80C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000BE8A0()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000FE8A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000FE8A8))
  {
    operator new();
  }
  return qword_1000FE8A0;
}

void sub_1000BE93C(_Unwind_Exception *a1)
{
}

uint64_t sub_1000BE954(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!v8) {
      goto LABEL_25;
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        goto LABEL_25;
      }
    }
LABEL_18:
    uint64_t v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        uint64_t v18 = v17;
        uint64_t v17 = (void *)*v17;
      }
      while (v17);
    }
    else
    {
      do
      {
        uint64_t v18 = (void *)v3[2];
        BOOL v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }
      while (!v19);
    }
    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0;
    }
  }
  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
LABEL_25:
  uint64_t v21 = (char *)v3[7];
  return sub_1000C03D0(a1, a3, v21);
}

uint64_t sub_1000BEAA4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000FE8B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000FE8B8))
  {
    operator new();
  }
  return qword_1000FE8B0;
}

void sub_1000BEB40(_Unwind_Exception *a1)
{
}

uint64_t sub_1000BEB58(uint64_t a1, unsigned __int8 *a2, std::string *__str)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0;
  }
  uint64_t v7 = a2[23];
  size_t v9 = *(const void **)a2;
  size_t v8 = *((void *)a2 + 1);
  if ((v7 & 0x80u) == 0) {
    uint64_t v10 = a2[23];
  }
  else {
    uint64_t v10 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v11 = *((unsigned __int8 *)v3 + 55);
    int v12 = (char)v11;
    if ((v11 & 0x80u) != 0) {
      uint64_t v11 = v3[5];
    }
    if (v10 != v11) {
      goto LABEL_18;
    }
    int v13 = v12 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v7 & 0x80) != 0) {
      break;
    }
    if (!v7) {
      goto LABEL_25;
    }
    unint64_t v14 = a2;
    uint64_t v15 = v7;
    while (*v14 == *v13)
    {
      ++v14;
      ++v13;
      if (!--v15) {
        goto LABEL_25;
      }
    }
LABEL_18:
    uint64_t v16 = (void *)v3[1];
    if (v16)
    {
      do
      {
        uint64_t v17 = v16;
        uint64_t v16 = (void *)*v16;
      }
      while (v16);
    }
    else
    {
      do
      {
        uint64_t v17 = (void *)v3[2];
        BOOL v18 = *v17 == (void)v3;
        uint64_t v3 = v17;
      }
      while (!v18);
    }
    uint64_t v3 = v17;
    if (v17 == v4) {
      return 0;
    }
  }
  if (memcmp(v9, v13, v8)) {
    goto LABEL_18;
  }
LABEL_25:
  std::string::operator=((std::string *)v3[7], __str);
  return 1;
}

uint64_t sub_1000BEC78()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000FE8C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000FE8C8))
  {
    operator new();
  }
  return qword_1000FE8C0;
}

void sub_1000BED14(_Unwind_Exception *a1)
{
}

BOOL sub_1000BED2C(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!v8) {
      goto LABEL_25;
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        goto LABEL_25;
      }
    }
LABEL_18:
    uint64_t v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        BOOL v18 = v17;
        uint64_t v17 = (void *)*v17;
      }
      while (v17);
    }
    else
    {
      do
      {
        BOOL v18 = (void *)v3[2];
        BOOL v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }
      while (!v19);
    }
    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0;
    }
  }
  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
LABEL_25:
  uint64_t v21 = (_DWORD *)v3[7];
  return sub_1000C057C(a1, a3, v21);
}

uint64_t sub_1000BEE7C()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000FE8D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000FE8D8))
  {
    operator new();
  }
  return qword_1000FE8D0;
}

void sub_1000BEF18(_Unwind_Exception *a1)
{
}

BOOL sub_1000BEF30(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!v8) {
      goto LABEL_25;
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        goto LABEL_25;
      }
    }
LABEL_18:
    uint64_t v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        BOOL v18 = v17;
        uint64_t v17 = (void *)*v17;
      }
      while (v17);
    }
    else
    {
      do
      {
        BOOL v18 = (void *)v3[2];
        BOOL v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }
      while (!v19);
    }
    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0;
    }
  }
  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
LABEL_25:
  uint64_t v21 = (uint64_t *)v3[7];
  return sub_1000C05FC(a1, a3, v21);
}

uint64_t sub_1000BF080()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000FE8E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1000FE8E8))
  {
    operator new();
  }
  return qword_1000FE8E0;
}

void sub_1000BF11C(_Unwind_Exception *a1)
{
}

BOOL sub_1000BF134(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!v8) {
      goto LABEL_25;
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        goto LABEL_25;
      }
    }
LABEL_18:
    uint64_t v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        BOOL v18 = v17;
        uint64_t v17 = (void *)*v17;
      }
      while (v17);
    }
    else
    {
      do
      {
        BOOL v18 = (void *)v3[2];
        BOOL v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }
      while (!v19);
    }
    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0;
    }
  }
  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
LABEL_25:
  uint64_t v21 = (double *)v3[7];
  return sub_1000C067C(a1, a3, v21);
}

void sub_1000BF284(int a1)
{
  v12[0] = 0;
  v12[1] = 0;
  uint64_t v11 = (uint64_t *)v12;
  size_t v2 = strlen(byte_1000FEDB0);
  uint64_t v3 = sub_10002D07C(&std::cout, (uint64_t)byte_1000FEDB0, v2);
  sub_10002D07C(v3, (uint64_t)"\n", 1);
  uint64_t v4 = sub_1000BE8A0();
  sub_1000BF440(v4, &v11);
  uint64_t v5 = sub_1000BEAA4();
  sub_1000BF6E0(v5, &v11);
  uint64_t v6 = sub_1000BEC78();
  sub_1000BF970(v6, &v11);
  uint64_t v7 = sub_1000BEE7C();
  sub_1000BFC00(v7, &v11);
  uint64_t v8 = sub_1000BF080();
  sub_1000BFE90(v8, &v11);
  if (byte_1000FF1B0
    && (sub_10002D07C(&std::cout, (uint64_t)"PROGRAM FLAGS:\n\n", 16),
        sub_100009CF0(__p, &byte_1000FF1B0),
        sub_1000C0120(&v11, (unsigned __int8 *)__p, 1, 0),
        v10 < 0))
  {
    operator delete(__p[0]);
    if (!a1) {
      goto LABEL_9;
    }
  }
  else if (!a1)
  {
    goto LABEL_9;
  }
  if (byte_1000FF1B0) {
    sub_10002D07C(&std::cout, (uint64_t)"LIBRARY FLAGS:\n\n", 16);
  }
  sub_100009CF0(__p, &byte_1000FF1B0);
  sub_1000C0120(&v11, (unsigned __int8 *)__p, 0, 1);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
LABEL_9:
  sub_1000B626C((uint64_t)&v11, v12[0]);
}

void sub_1000BF3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_1000B626C((uint64_t)&a15, a16);
  _Unwind_Resume(a1);
}

void sub_1000BF440(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>();
      std::string::append(&v19, ": type = ");
      std::string::append(&v19, (const std::string::value_type *)v2[9]);
      std::string::append(&v19, ", default = ");
      if (*((unsigned char *)v2 + 88)) {
        uint64_t v5 = "true";
      }
      else {
        uint64_t v5 = "false";
      }
      sub_100009CF0(&__s, v5);
      uint64_t v6 = std::string::append((std::string *)&__s, "\n  ");
      long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
      int64_t v17 = v6->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v7;
      v6->__r_.__value_.__l.__size_ = 0;
      v6->__r_.__value_.__r.__words[2] = 0;
      v6->__r_.__value_.__r.__words[0] = 0;
      if (v17 >= 0) {
        uint64_t v8 = __p;
      }
      else {
        uint64_t v8 = (void **)__p[0];
      }
      if (v17 >= 0) {
        std::string::size_type v9 = HIBYTE(v17);
      }
      else {
        std::string::size_type v9 = (std::string::size_type)__p[1];
      }
      std::string::append(&v19, (const std::string::value_type *)v8, v9);
      if (SHIBYTE(v17) < 0) {
        operator delete(__p[0]);
      }
      if (v15.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v19, (const std::string::value_type *)v2[8]);
      char v10 = (char *)v2[10];
      __s = v10;
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_10006770C(&v15, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
        char v10 = __s;
      }
      else
      {
        std::string v15 = v19;
      }
      sub_100009CF0(__p, v10);
      std::string v18 = v15;
      memset(&v15, 0, sizeof(v15));
      sub_1000C06F8(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v17) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v19.__r_.__value_.__l.__data_);
      }
      uint64_t v11 = (void *)v2[1];
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (void *)v2[2];
          BOOL v13 = *v12 == (void)v2;
          size_t v2 = v12;
        }
        while (!v13);
      }
      size_t v2 = v12;
    }
    while (v12 != v3);
  }
}

void sub_1000BF668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000BF6E0(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>();
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, (const std::string::value_type *)v2[9]);
      std::string::append(&v18, ", default = ");
      sub_1000C0994((std::string *)&__s);
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t v16 = v5->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0;
      v5->__r_.__value_.__r.__words[2] = 0;
      v5->__r_.__value_.__r.__words[0] = 0;
      if (v16 >= 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      if (v16 >= 0) {
        std::string::size_type v8 = HIBYTE(v16);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, (const std::string::value_type *)v2[8]);
      std::string::size_type v9 = (char *)v2[10];
      __s = v9;
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_10006770C(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }
      else
      {
        std::string v14 = v18;
      }
      sub_100009CF0(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000C06F8(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
      char v10 = (void *)v2[1];
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          uint64_t v11 = (void *)v2[2];
          BOOL v12 = *v11 == (void)v2;
          size_t v2 = v11;
        }
        while (!v12);
      }
      size_t v2 = v11;
    }
    while (v11 != v3);
  }
}

void sub_1000BF8F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000BF970(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>();
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, (const std::string::value_type *)v2[9]);
      std::string::append(&v18, ", default = ");
      sub_1000C0A20();
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t v16 = v5->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0;
      v5->__r_.__value_.__r.__words[2] = 0;
      v5->__r_.__value_.__r.__words[0] = 0;
      if (v16 >= 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      if (v16 >= 0) {
        std::string::size_type v8 = HIBYTE(v16);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, (const std::string::value_type *)v2[8]);
      std::string::size_type v9 = (char *)v2[10];
      __s = v9;
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_10006770C(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }
      else
      {
        std::string v14 = v18;
      }
      sub_100009CF0(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000C06F8(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
      char v10 = (void *)v2[1];
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          uint64_t v11 = (void *)v2[2];
          BOOL v12 = *v11 == (void)v2;
          size_t v2 = v11;
        }
        while (!v12);
      }
      size_t v2 = v11;
    }
    while (v11 != v3);
  }
}

void sub_1000BFB88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000BFC00(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>();
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, (const std::string::value_type *)v2[9]);
      std::string::append(&v18, ", default = ");
      sub_1000C0B68();
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t v16 = v5->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0;
      v5->__r_.__value_.__r.__words[2] = 0;
      v5->__r_.__value_.__r.__words[0] = 0;
      if (v16 >= 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      if (v16 >= 0) {
        std::string::size_type v8 = HIBYTE(v16);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, (const std::string::value_type *)v2[8]);
      std::string::size_type v9 = (char *)v2[10];
      __s = v9;
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_10006770C(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }
      else
      {
        std::string v14 = v18;
      }
      sub_100009CF0(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000C06F8(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
      char v10 = (void *)v2[1];
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          uint64_t v11 = (void *)v2[2];
          BOOL v12 = *v11 == (void)v2;
          size_t v2 = v11;
        }
        while (!v12);
      }
      size_t v2 = v11;
    }
    while (v11 != v3);
  }
}

void sub_1000BFE18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000BFE90(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>();
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, (const std::string::value_type *)v2[9]);
      std::string::append(&v18, ", default = ");
      sub_1000C0CB0();
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t v16 = v5->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0;
      v5->__r_.__value_.__r.__words[2] = 0;
      v5->__r_.__value_.__r.__words[0] = 0;
      if (v16 >= 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      if (v16 >= 0) {
        std::string::size_type v8 = HIBYTE(v16);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, (const std::string::value_type *)v2[8]);
      std::string::size_type v9 = (char *)v2[10];
      __s = v9;
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_10006770C(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }
      else
      {
        std::string v14 = v18;
      }
      sub_100009CF0(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000C06F8(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
      char v10 = (void *)v2[1];
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          uint64_t v11 = (void *)v2[2];
          BOOL v12 = *v11 == (void)v2;
          size_t v2 = v11;
        }
        while (!v12);
      }
      size_t v2 = v11;
    }
    while (v11 != v3);
  }
}

void sub_1000C00A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000C0120(void *a1, unsigned __int8 *a2, int a3, int a4)
{
  memset(&v35, 0, sizeof(v35));
  uint64_t v4 = a1 + 1;
  uint64_t v5 = (void *)*a1;
  if ((void *)*a1 == a1 + 1) {
    goto LABEL_61;
  }
  char v8 = 0;
  char v9 = 0;
  do
  {
    char v10 = (const void **)(v5 + 4);
    uint64_t v11 = *((unsigned __int8 *)v5 + 55);
    size_t v12 = v5[5];
    if ((v11 & 0x80u) == 0) {
      uint64_t v13 = *((unsigned __int8 *)v5 + 55);
    }
    else {
      uint64_t v13 = v5[5];
    }
    uint64_t v14 = a2[23];
    int v15 = (char)v14;
    if ((v14 & 0x80u) != 0) {
      uint64_t v14 = *((void *)a2 + 1);
    }
    if (v13 == v14)
    {
      if (v15 >= 0) {
        int64_t v16 = a2;
      }
      else {
        int64_t v16 = *(unsigned __int8 **)a2;
      }
      if ((v11 & 0x80) != 0)
      {
        if (((memcmp(*v10, v16, v5[5]) == 0) ^ a3)) {
          goto LABEL_53;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v5 + 55))
      {
LABEL_17:
        if ((a3 & 1) == 0) {
          goto LABEL_53;
        }
        goto LABEL_22;
      }
      std::string v17 = (unsigned __int8 *)(v5 + 4);
      uint64_t v18 = *((unsigned __int8 *)v5 + 55);
      while (*v17 == *v16)
      {
        ++v17;
        ++v16;
        if (!--v18) {
          goto LABEL_17;
        }
      }
    }
    if (a3) {
      goto LABEL_53;
    }
LABEL_22:
    std::string::size_type size = HIBYTE(v35.__r_.__value_.__r.__words[2]);
    if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v35.__r_.__value_.__l.__size_;
    }
    if (v13 != size) {
      goto LABEL_35;
    }
    if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v20 = &v35;
    }
    else {
      uint64_t v20 = (std::string *)v35.__r_.__value_.__r.__words[0];
    }
    if ((v11 & 0x80) != 0)
    {
      if (memcmp(*v10, v20, v12)) {
        goto LABEL_35;
      }
    }
    else if (v11)
    {
      uint64_t v21 = (unsigned __int8 *)(v5 + 4);
      while (*v21 == v20->__r_.__value_.__s.__data_[0])
      {
        ++v21;
        uint64_t v20 = (std::string *)((char *)v20 + 1);
        if (!--v11) {
          goto LABEL_46;
        }
      }
LABEL_35:
      if (a4)
      {
        if (v8) {
          sub_10002D07C(&std::cout, (uint64_t)"\n", 1);
        }
        uint64_t v22 = sub_10002D07C(&std::cout, (uint64_t)"Flags from: ", 12);
        int v23 = *((char *)v5 + 55);
        if (v23 >= 0) {
          uint64_t v24 = (uint64_t)(v5 + 4);
        }
        else {
          uint64_t v24 = v5[4];
        }
        if (v23 >= 0) {
          uint64_t v25 = *((unsigned __int8 *)v5 + 55);
        }
        else {
          uint64_t v25 = v5[5];
        }
        int v26 = sub_10002D07C(v22, v24, v25);
        char v8 = 1;
        sub_10002D07C(v26, (uint64_t)"\n", 1);
      }
      std::string::operator=(&v35, (const std::string *)(v5 + 4));
    }
LABEL_46:
    int v27 = *((char *)v5 + 79);
    if (v27 >= 0) {
      uint64_t v28 = (uint64_t)(v5 + 7);
    }
    else {
      uint64_t v28 = v5[7];
    }
    if (v27 >= 0) {
      uint64_t v29 = *((unsigned __int8 *)v5 + 79);
    }
    else {
      uint64_t v29 = v5[8];
    }
    uint64_t v30 = sub_10002D07C(&std::cout, v28, v29);
    char v9 = 1;
    sub_10002D07C(v30, (uint64_t)"\n", 1);
LABEL_53:
    BOOL v31 = (void *)v5[1];
    if (v31)
    {
      do
      {
        uint64_t v32 = v31;
        BOOL v31 = (void *)*v31;
      }
      while (v31);
    }
    else
    {
      do
      {
        uint64_t v32 = (void *)v5[2];
        BOOL v33 = *v32 == (void)v5;
        uint64_t v5 = v32;
      }
      while (!v33);
    }
    uint64_t v5 = v32;
  }
  while (v32 != v4);
  if (v9) {
    sub_10002D07C(&std::cout, (uint64_t)"\n", 1);
  }
LABEL_61:
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
}

void sub_1000C03B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000C03D0(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  if (((char)a2[23] & 0x80000000) == 0)
  {
    uint64_t result = 0;
    char v4 = 1;
    switch(a2[23])
    {
      case 0u:
        goto LABEL_33;
      case 1u:
        int v5 = *a2;
        if (v5 == 49) {
          goto LABEL_33;
        }
        goto LABEL_29;
      case 4u:
        if (*(_DWORD *)a2 != 1702195828) {
          return 0;
        }
        goto LABEL_21;
      case 5u:
        if (*(_DWORD *)a2 == 1936482662 && a2[4] == 101) {
          goto LABEL_32;
        }
        if (a2[23] != 1) {
          return 0;
        }
        goto LABEL_28;
      default:
        return result;
    }
  }
  uint64_t result = 0;
  uint64_t v6 = *((void *)a2 + 1);
  char v4 = 1;
  switch(v6)
  {
    case 0:
      goto LABEL_33;
    case 1:
      goto LABEL_6;
    case 4:
      if (**(_DWORD **)a2 == 1702195828 || !v6) {
        goto LABEL_21;
      }
      if (v6 != 5)
      {
        if (v6 != 1) {
          return 0;
        }
LABEL_6:
        if (**(unsigned char **)a2 != 49) {
          goto LABEL_27;
        }
LABEL_21:
        char v4 = 1;
LABEL_33:
        *a3 = v4;
        return 1;
      }
LABEL_22:
      if (**(_DWORD **)a2 == 1936482662 && *(unsigned char *)(*(void *)a2 + 4) == 101)
      {
LABEL_32:
        char v4 = 0;
        goto LABEL_33;
      }
      if (*((void *)a2 + 1) != 1) {
        return 0;
      }
LABEL_27:
      a2 = *(unsigned __int8 **)a2;
LABEL_28:
      int v5 = *a2;
LABEL_29:
      char v4 = 0;
      uint64_t result = 0;
      if (v5 == 48) {
        goto LABEL_33;
      }
      return result;
    case 5:
      goto LABEL_22;
    default:
      return result;
  }
}

BOOL sub_1000C057C(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  __endptr = 0;
  if (*(char *)(a2 + 23) >= 0) {
    char v4 = (const char *)a2;
  }
  else {
    char v4 = *(const char **)a2;
  }
  *a3 = strtol(v4, &__endptr, 0);
  uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  return v5 && *__endptr == 0;
}

BOOL sub_1000C05FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __endptr = 0;
  if (*(char *)(a2 + 23) >= 0) {
    char v4 = (const char *)a2;
  }
  else {
    char v4 = *(const char **)a2;
  }
  *a3 = strtoll(v4, &__endptr, 0);
  uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  return v5 && *__endptr == 0;
}

BOOL sub_1000C067C(uint64_t a1, uint64_t a2, double *a3)
{
  long long v7 = 0;
  if (*(char *)(a2 + 23) >= 0) {
    char v4 = (const char *)a2;
  }
  else {
    char v4 = *(const char **)a2;
  }
  *a3 = strtod(v4, &v7);
  uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  return v5 && *v7 == 0;
}

_OWORD *sub_1000C06F8(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v5 = (void **)sub_1000C07C8((uint64_t)a1, &v11, a2);
  uint64_t v6 = *v5;
  if (!*v5)
  {
    long long v7 = (uint64_t **)v5;
    uint64_t v6 = operator new(0x50uLL);
    v9[1] = a1 + 1;
    v6[2] = *(_OWORD *)a3;
    *((void *)v6 + 6) = *(void *)(a3 + 16);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(_OWORD *)((char *)v6 + 56) = *(_OWORD *)(a3 + 24);
    *((void *)v6 + 9) = *(void *)(a3 + 40);
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + ++*(_DWORD *)(result + 24) = 0;
    *(void *)(a3 + 32) = 0;
    *(void *)(a3 + 40) = 0;
    char v10 = 1;
    sub_10001AD30(a1, v11, v7, (uint64_t *)v6);
    v9[0] = 0;
    sub_1000B61BC((uint64_t)v9, 0);
  }
  return v6;
}

void *sub_1000C07C8(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        char v8 = (void *)v4;
        char v9 = (const void **)(v4 + 32);
        if (!sub_1000C0868(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_1000C0868(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    char v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t sub_1000C0868(uint64_t a1, const void **a2, const void **a3)
{
  int v5 = *((char *)a3 + 23);
  int v6 = *((char *)a2 + 23);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v7 = (size_t)a2[1];
  }
  if (v6 >= 0) {
    char v8 = a2;
  }
  else {
    char v8 = *a2;
  }
  if (v5 >= 0) {
    size_t v9 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v9 = (size_t)a3[1];
  }
  if (v5 >= 0) {
    char v10 = a3;
  }
  else {
    char v10 = *a3;
  }
  if (v9 >= v7) {
    size_t v11 = v7;
  }
  else {
    size_t v11 = v9;
  }
  int v12 = memcmp(v8, v10, v11);
  BOOL v13 = v7 < v9;
  if (v12) {
    BOOL v13 = v12 < 0;
  }
  if (v13) {
    return 1;
  }
  int v15 = memcmp(v10, v8, v11);
  BOOL v16 = v9 < v7;
  if (v15) {
    BOOL v16 = v15 < 0;
  }
  if (v16) {
    return 0;
  }
  std::string v19 = (const void **)a3[3];
  uint64_t v18 = a3 + 3;
  std::string v17 = v19;
  int v20 = *((char *)v18 + 23);
  int v23 = (const void **)a2[3];
  uint64_t v22 = a2 + 3;
  uint64_t v21 = v23;
  int v24 = *((char *)v22 + 23);
  if (v24 >= 0) {
    size_t v25 = *((unsigned __int8 *)v22 + 23);
  }
  else {
    size_t v25 = (size_t)v22[1];
  }
  if (v24 >= 0) {
    int v26 = v22;
  }
  else {
    int v26 = v21;
  }
  if (v20 >= 0) {
    size_t v27 = *((unsigned __int8 *)v18 + 23);
  }
  else {
    size_t v27 = (size_t)v18[1];
  }
  if (v20 >= 0) {
    uint64_t v28 = v18;
  }
  else {
    uint64_t v28 = v17;
  }
  if (v27 >= v25) {
    size_t v29 = v25;
  }
  else {
    size_t v29 = v27;
  }
  int v30 = memcmp(v26, v28, v29);
  if (v30) {
    return v30 < 0;
  }
  else {
    return v25 < v27;
  }
}

void sub_1000C0994(std::string *a1@<X8>)
{
  std::operator+<char>();
  size_t v2 = std::string::append(&v3, "\"");
  *a1 = *v2;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v3.__r_.__value_.__l.__data_);
  }
}

void sub_1000C0A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000C0A20()
{
  sub_1000BB310((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_1000C0B54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000BB4A8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C0B68()
{
  sub_1000BB310((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_1000C0C9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000BB4A8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C0CB0()
{
  sub_1000BB310((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_1000C0DE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000BB4A8((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000C0DF8(char *__s1, char *__s2, void **a3, int a4)
{
  if (__s1)
  {
    size_t v7 = __s1;
    uint64_t v8 = (uint64_t)(a3 + 2);
    do
    {
      size_t v9 = strpbrk(v7, __s2);
      char v10 = v9;
      if (v9) {
        char *v9 = 0;
      }
      if (!a4 || *v7)
      {
        int v12 = (char **)a3[1];
        unint64_t v11 = (unint64_t)a3[2];
        if ((unint64_t)v12 >= v11)
        {
          uint64_t v14 = ((char *)v12 - (unsigned char *)*a3) >> 3;
          if ((unint64_t)(v14 + 1) >> 61) {
            sub_100019424();
          }
          uint64_t v15 = v11 - (void)*a3;
          uint64_t v16 = v15 >> 2;
          if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
            uint64_t v16 = v14 + 1;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            uint64_t v18 = (char *)sub_10001943C(v8, v17);
          }
          else {
            uint64_t v18 = 0;
          }
          std::string v19 = (char **)&v18[8 * v14];
          void *v19 = v7;
          BOOL v13 = v19 + 1;
          uint64_t v21 = (char *)*a3;
          int v20 = (char *)a3[1];
          if (v20 != *a3)
          {
            do
            {
              uint64_t v22 = (char *)*((void *)v20 - 1);
              v20 -= 8;
              *--std::string v19 = v22;
            }
            while (v20 != v21);
            int v20 = (char *)*a3;
          }
          *a3 = v19;
          a3[1] = v13;
          a3[2] = &v18[8 * v17];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *int v12 = v7;
          BOOL v13 = v12 + 1;
        }
        a3[1] = v13;
      }
      size_t v7 = v10 + 1;
    }
    while (v10);
  }
}

uint64_t sub_1000C0F28(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned char *a5)
{
  if (*(char *)(a1 + 23) >= 0) {
    size_t v9 = (const char *)a1;
  }
  else {
    size_t v9 = *(const char **)a1;
  }
  if (a5) {
    *a5 = 0;
  }
  __endptr = 0;
  uint64_t result = strtoll(v9, &__endptr, 10);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 23);
  if ((v11 & 0x80u) != 0) {
    uint64_t v11 = *(void *)(a1 + 8);
  }
  unint64_t v12 = (unint64_t)&v9[v11];
  if (result >= 0) {
    char v13 = 1;
  }
  else {
    char v13 = a4;
  }
  if ((unint64_t)__endptr < v12 || (v13 & 1) == 0)
  {
    if (byte_1000FE8F0) {
      sub_100009CF0(__p, "FATAL");
    }
    else {
      sub_100009CF0(__p, "ERROR");
    }
    sub_10002D454(&v26, (uint64_t)__p);
    uint64_t v14 = sub_10002D07C(&std::cerr, (uint64_t)"StrToInt64: Bad integer = ", 26);
    int v15 = *(char *)(a1 + 23);
    if (v15 >= 0) {
      uint64_t v16 = a1;
    }
    else {
      uint64_t v16 = *(void *)a1;
    }
    if (v15 >= 0) {
      uint64_t v17 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v17 = *(void *)(a1 + 8);
    }
    uint64_t v18 = sub_10002D07C(v14, v16, v17);
    std::string v19 = sub_10002D07C(v18, (uint64_t)"\", source = ", 12);
    int v20 = *(char *)(a2 + 23);
    if (v20 >= 0) {
      uint64_t v21 = a2;
    }
    else {
      uint64_t v21 = *(void *)a2;
    }
    if (v20 >= 0) {
      uint64_t v22 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v22 = *(void *)(a2 + 8);
    }
    int v23 = sub_10002D07C(v19, v21, v22);
    sub_10002D07C(v23, (uint64_t)", line = ", 9);
    std::ostream::operator<<();
    sub_10002D500(&v26);
    if (v25 < 0) {
      operator delete(__p[0]);
    }
    uint64_t result = 0;
    if (a5) {
      *a5 = 1;
    }
  }
  return result;
}

void sub_1000C10B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_1000C10EC(unint64_t result)
{
  unint64_t v1 = result;
  uint64_t v2 = *(unsigned __int8 *)(result + 23);
  std::string v3 = (unsigned char *)result;
  if (*(char *)(result + 23) < 0) {
    std::string v3 = *(unsigned char **)result;
  }
  while (1)
  {
    unint64_t v4 = v1;
    if ((v2 & 0x80) != 0)
    {
      unint64_t v4 = *(void *)v1;
      uint64_t v2 = *(void *)(v1 + 8);
    }
    if (v3 == (unsigned char *)(v4 + v2)) {
      return result;
    }
    __darwin_ct_rune_t v5 = (char)*v3;
    if ((v5 & 0x80000000) == 0)
    {
      uint64_t result = _DefaultRuneLocale.__runetype[v5] & 0x500;
      if (result) {
        goto LABEL_9;
      }
LABEL_8:
      unsigned char *v3 = 95;
      goto LABEL_9;
    }
    uint64_t result = __maskrune(v5, 0x500uLL);
    if (!result) {
      goto LABEL_8;
    }
LABEL_9:
    ++v3;
    uint64_t v2 = *(unsigned __int8 *)(v1 + 23);
  }
}

BOOL sub_1000C1190()
{
  v3[1] = 0;
  int v0 = 16;
  while (1)
  {
    std::istream::tellg();
    uint64_t v1 = v6;
    if (v6 < 0) {
      break;
    }
    if ((v6 & 0xF) != 0)
    {
      std::istream::read();
      if (--v0) {
        continue;
      }
    }
    return v1 >= 0;
  }
  sub_100009CF0(__p, "ERROR");
  sub_10002D454(v3, (uint64_t)__p);
  sub_10002D07C(&std::cerr, (uint64_t)"AlignInput: Can't determine stream position", 43);
  sub_10002D500(v3);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  return v1 >= 0;
}

void sub_1000C1284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000C12B8(void *a1)
{
  int v2 = 16;
  while (1)
  {
    std::string v3 = (char *)a1 + *(void *)(*a1 - 24);
    if ((v3[32] & 5) != 0) {
      break;
    }
    (*(void (**)(void **__return_ptr))(**((void **)v3 + 5) + 32))(__p);
    if (v8 < 0) {
      break;
    }
    if ((v8 & 0xF) != 0)
    {
      std::ostream::write();
      if (--v2) {
        continue;
      }
    }
    return 1;
  }
  sub_100009CF0(__p, "ERROR");
  sub_10002D454(&v5, (uint64_t)__p);
  sub_10002D07C(&std::cerr, (uint64_t)"AlignOutput: Can't determine stream position", 44);
  sub_10002D500(&v5);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return 0;
}

void sub_1000C140C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000C1440(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24);
  if ((v1[32] & 5) != 0)
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v9 = -1;
LABEL_3:
    sub_100009CF0(__p, "ERROR");
    sub_10002D454(&v7, (uint64_t)__p);
    sub_10002D07C(&std::cerr, (uint64_t)"Cannot determine stream position", 32);
    sub_10002D500(&v7);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(_OWORD *__return_ptr))(**((void **)v1 + 5) + 32))(v8);
  if (v9 == -1) {
    goto LABEL_3;
  }
  if (v9 <= 0) {
    uint64_t v2 = -(-v9 & 0xF);
  }
  else {
    uint64_t v2 = v9 & 0xF;
  }
  if ((int)v2 >= 1)
  {
    int v4 = v2;
    do
    {
      std::ostream::write();
      --v4;
    }
    while (v4);
  }
  return v2;
}

void sub_1000C15B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000C15EC()
{
  if (qword_1000FF5B8 != -1) {
    dispatch_once(&qword_1000FF5B8, &stru_1000F45C8);
  }
  return qword_1000FF5B0;
}

void sub_1000C1630(id a1)
{
  qword_1000FF5B0 = (uint64_t)os_log_create("com.apple.SpeechRecognitionCore", "CMDPLogs");
}

uint64_t sub_1000C1660()
{
  return 0;
}

uint64_t sub_1000C1718(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    std::istream::tellg();
    uint64_t v6 = v24;
  }
  else
  {
    uint64_t v6 = 0;
  }
  std::istream::read();
  sub_100009CF0(v22, "ERROR");
  sub_10002D454((BOOL *)&__c, (uint64_t)v22);
  BOOL v7 = sub_10002D07C(&std::cerr, (uint64_t)"FstHeader::Read: Bad FST header: ", 33);
  int v8 = *(char *)(a3 + 23);
  if (v8 >= 0) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = *(void *)a3;
  }
  if (v8 >= 0) {
    uint64_t v10 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v10 = *(void *)(a3 + 8);
  }
  sub_10002D07C(v7, v9, v10);
  sub_10002D500(&__c);
  if ((v23 & 0x80000000) == 0)
  {
    if (!a4) {
      return 0;
    }
    goto LABEL_14;
  }
  operator delete(v22[0]);
  if (a4)
  {
LABEL_14:
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v21 = v6;
    std::istream::seekg();
  }
  return 0;
}

void sub_1000C1A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  if (*(char *)(v13 - 185) < 0) {
    operator delete(*(void **)(v13 - 208));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000C1AC4()
{
  return 1;
}

uint64_t sub_1000C1C2C(uint64_t a1)
{
  sub_1000BB310((uint64_t)v19);
  uint64_t v2 = sub_10002D07C(v19, (uint64_t)"fsttype: \"", 10);
  int v3 = *(char *)(a1 + 31);
  if (v3 >= 0) {
    uint64_t v4 = a1 + 8;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 31);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 16);
  }
  uint64_t v6 = sub_10002D07C(v2, v4, v5);
  BOOL v7 = sub_10002D07C(v6, (uint64_t)"\" arctype: \"", 12);
  int v8 = *(char *)(a1 + 55);
  if (v8 >= 0) {
    uint64_t v9 = a1 + 32;
  }
  else {
    uint64_t v9 = *(void *)(a1 + 32);
  }
  if (v8 >= 0) {
    uint64_t v10 = *(unsigned __int8 *)(a1 + 55);
  }
  else {
    uint64_t v10 = *(void *)(a1 + 40);
  }
  uint64_t v11 = sub_10002D07C(v7, v9, v10);
  sub_10002D07C(v11, (uint64_t)"\" version: \"", 12);
  unint64_t v12 = (void *)std::ostream::operator<<();
  sub_10002D07C(v12, (uint64_t)"\" flags: \"", 10);
  uint64_t v13 = (void *)std::ostream::operator<<();
  sub_10002D07C(v13, (uint64_t)"\" properties: \"", 15);
  long long v14 = (void *)std::ostream::operator<<();
  sub_10002D07C(v14, (uint64_t)"\" start: \"", 10);
  long long v15 = (void *)std::ostream::operator<<();
  sub_10002D07C(v15, (uint64_t)"\" numstates: \"", 14);
  long long v16 = (void *)std::ostream::operator<<();
  sub_10002D07C(v16, (uint64_t)"\" numarcs: \"", 12);
  long long v17 = (void *)std::ostream::operator<<();
  sub_10002D07C(v17, (uint64_t)"\"", 1);
  std::stringbuf::str();
  if (v20 < 0) {
    operator delete((void *)v19[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_1000C1E60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000BB4A8((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_1000C1E74(void *__dst, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10006770C(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v9 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v9;
  }
  __dst[3] = a3;
  __dst[4] = a4;
  __dst[5] = a5;
  *((_WORD *)__dst + 26) = 257;
  sub_100009CF0(__p, off_1000FE918[0]);
  *((_DWORD *)__dst + 12) = sub_1000C1F50((uint64_t)__p);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  return __dst;
}

void sub_1000C1F1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000C1F50(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4 != 3)
    {
      if (v4 == 4 && **(_DWORD **)a1 == 1684104562) {
        return 0;
      }
      goto LABEL_15;
    }
    int v3 = *(_DWORD **)a1;
  }
  else
  {
    int v2 = *(unsigned __int8 *)(a1 + 23);
    int v3 = (_DWORD *)a1;
    if (v2 != 3)
    {
      if (v2 == 4 && *(_DWORD *)a1 == 1684104562) {
        return 0;
      }
LABEL_15:
      sub_100009CF0(__p, "ERROR");
      sub_10002D454(&v15, (uint64_t)__p);
      int v8 = sub_10002D07C(&std::cerr, (uint64_t)"Unknown file read mode ", 23);
      int v9 = *(char *)(a1 + 23);
      if (v9 >= 0) {
        uint64_t v10 = (_DWORD *)a1;
      }
      else {
        uint64_t v10 = *(_DWORD **)a1;
      }
      if (v9 >= 0) {
        uint64_t v11 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        uint64_t v11 = *(void *)(a1 + 8);
      }
      sub_10002D07C(v8, (uint64_t)v10, v11);
      sub_10002D500(&v15);
      if (v14 < 0) {
        operator delete(__p[0]);
      }
      return 0;
    }
  }
  int v5 = *(unsigned __int16 *)v3;
  int v6 = *((unsigned __int8 *)v3 + 2);
  if (v5 != 24941 || v6 != 112) {
    goto LABEL_15;
  }
  return 1;
}

void sub_1000C2078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000C20A8(void *__dst, long long *a2, uint64_t a3, uint64_t a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10006770C(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v7;
  }
  __dst[3] = 0;
  __dst[4] = a3;
  __dst[5] = a4;
  *((_WORD *)__dst + 26) = 257;
  sub_100009CF0(__p, off_1000FE918[0]);
  *((_DWORD *)__dst + 12) = sub_1000C1F50((uint64_t)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  return __dst;
}

void sub_1000C214C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000C2184(uint64_t a1)
{
  sub_1000BB310((uint64_t)v36);
  int v2 = sub_10002D07C(v36, (uint64_t)"source: \"", 9);
  int v3 = *(char *)(a1 + 23);
  if (v3 >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)a1;
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  int v6 = sub_10002D07C(v2, v4, v5);
  long long v7 = sub_10002D07C(v6, (uint64_t)"\" mode: \"", 9);
  int v8 = *(_DWORD *)(a1 + 48);
  if (v8) {
    int v9 = "MAP";
  }
  else {
    int v9 = "READ";
  }
  if (v8) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 4;
  }
  uint64_t v11 = sub_10002D07C(v7, (uint64_t)v9, v10);
  char v12 = sub_10002D07C(v11, (uint64_t)"\" read_isymbols: \"", 18);
  if (*(unsigned char *)(a1 + 52)) {
    uint64_t v13 = "true";
  }
  else {
    uint64_t v13 = "false";
  }
  if (*(unsigned char *)(a1 + 52)) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 5;
  }
  uint64_t v15 = sub_10002D07C(v12, (uint64_t)v13, v14);
  long long v16 = sub_10002D07C(v15, (uint64_t)"\" read_osymbols: \"", 18);
  if (*(unsigned char *)(a1 + 53)) {
    long long v17 = "true";
  }
  else {
    long long v17 = "false";
  }
  if (*(unsigned char *)(a1 + 53)) {
    uint64_t v18 = 4;
  }
  else {
    uint64_t v18 = 5;
  }
  long long v19 = sub_10002D07C(v16, (uint64_t)v17, v18);
  char v20 = sub_10002D07C(v19, (uint64_t)"\" header: \"", 11);
  uint64_t v21 = *(void *)(a1 + 24);
  if (v21) {
    uint64_t v22 = "set";
  }
  else {
    uint64_t v22 = "null";
  }
  if (v21) {
    uint64_t v23 = 3;
  }
  else {
    uint64_t v23 = 4;
  }
  uint64_t v24 = sub_10002D07C(v20, (uint64_t)v22, v23);
  char v25 = sub_10002D07C(v24, (uint64_t)"\" isymbols: \"", 13);
  uint64_t v26 = *(void *)(a1 + 32);
  if (v26) {
    size_t v27 = "set";
  }
  else {
    size_t v27 = "null";
  }
  if (v26) {
    uint64_t v28 = 3;
  }
  else {
    uint64_t v28 = 4;
  }
  size_t v29 = sub_10002D07C(v25, (uint64_t)v27, v28);
  int v30 = sub_10002D07C(v29, (uint64_t)"\" osymbols: \"", 13);
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    uint64_t v32 = "set";
  }
  else {
    uint64_t v32 = "null";
  }
  if (v31) {
    uint64_t v33 = 3;
  }
  else {
    uint64_t v33 = 4;
  }
  uint64_t v34 = sub_10002D07C(v30, (uint64_t)v32, v33);
  sub_10002D07C(v34, (uint64_t)"\"", 1);
  std::stringbuf::str();
  if (v37 < 0) {
    operator delete((void *)v36[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_1000C2414(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000BB4A8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C2428(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a1 & 0x248000000003;
  if (a3) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = a1 & 0x10200010004 | (((a1 >> 33) & 1) << 47) | v3;
  if ((a1 & 0x10000000000) != 0 || (a3 & 1) == 0)
  {
    v4 |= a1 & 0x4A01A02A0000;
    if ((~a1 & 0x50100000000) == 0) {
      return v4 | 0x400000000000;
    }
  }
  return v4;
}

uint64_t sub_1000C2488(uint64_t a1)
{
  uint64_t v1 = 0x8106AA950000;
  if ((a1 & 0x10000000000) == 0) {
    uint64_t v1 = 0x81020A950000;
  }
  return v1 | a1 & 0x1050000004;
}

uint64_t sub_1000C24B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (a2 | a1) & 4;
  uint64_t v3 = a2 & a1;
  uint64_t v4 = a2 & a1 & 0x2802010000 | v2 | 0x10000000000;
  if ((a2 & a1 & 0x2000000) != 0) {
    v4 |= a2 & a1 & 0x40000;
  }
  uint64_t v5 = v3 & 0x280A800000 | v2 | 0x10000010000;
  if ((v3 & 0x2000000) != 0) {
    v5 |= v3 & 0x140000;
  }
  if ((v3 & 0x10000) != 0) {
    return v5;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000C2524(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a2 & 0x208000000000 | a1 & 0x20B000000003;
  if (a3) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (a2 | a1) & 4 | a1 & a2 & 0x800A00010000 | v3;
  if ((a3 & ((a1 & 0x10000000000) == 0)) != 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 0x4A05A56A0000;
  }
  uint64_t v6 = v4 | v5;
  if ((~a1 & 0x50000000000) != 0) {
    int v7 = 1;
  }
  else {
    int v7 = a3;
  }
  if (v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = a2 & 0x4F05A56A0000;
  }
  return v6 | v8;
}

uint64_t sub_1000C25AC(unint64_t a1, int a2, int a3)
{
  if ((a1 & 0x10000) != 0
    || ((a1 & 0x2000000) == 0 ? (char v3 = a2 ^ 1) : (char v3 = 0), (v4 = 0x10000000000, (v3 & 1) == 0) && a3))
  {
    uint64_t v4 = 0x10000040000;
  }
  uint64_t v5 = (a1 >> 25) & 1;
  uint64_t v6 = a1 & 0x800000;
  if ((v5 & a3) == 0) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = a1 & ((uint64_t)(a1 << 23) >> 63) & 0x405000000 | a1 & 0x142800010004 | a1 & ((int)(a1 << 15) >> 31) & 0xA000000 | v6 | v4;
  if ((v5 & a2) != 0) {
    return v7 | 0x2000000;
  }
  else {
    return v7;
  }
}

uint64_t sub_1000C2634(uint64_t a1)
{
  uint64_t v1 = 0x50CA56B0007;
  if ((a1 & 0x10000000000) == 0) {
    uint64_t v1 = 0x50800010007;
  }
  return v1 & a1;
}

unint64_t sub_1000C265C(unint64_t a1)
{
  return a1 & 0xFFFF00C30007 | (((a1 >> 18) & 3) << 20) & 0xFFFFFFFF33FFFFFFLL | (a1 >> 2) & 0xC0000 | (((a1 >> 24) & 3) << 26) & 0xFFFFFFFF3FFFFFFFLL | (a1 >> 2) & 0x3000000 | (((a1 >> 28) & 3) << 30) | (a1 >> 2) & 0x30000000;
}

uint64_t sub_1000C26A4(unint64_t a1, int a2)
{
  uint64_t v2 = a1 & 0xFFFF00000007 | 0x10000;
  uint64_t v3 = (a1 >> 2) & 0xC0000 | a1 & 0xCC300000 | v2;
  if ((a1 & 0x4000000) != 0) {
    v3 |= 0x1400000uLL;
  }
  if ((a1 & 0x8000000) != 0) {
    v3 |= 0x2800000uLL;
  }
  uint64_t v4 = (a1 >> 2) & 0x30000000 | v3;
  uint64_t v5 = a1 & 0x330C0000 | (((a1 >> 18) & 3) << 20) | v2;
  if ((a1 & 0x1000000) != 0) {
    v5 |= 0x4400000uLL;
  }
  if ((a1 & 0x2000000) != 0) {
    v5 |= 0x8800000uLL;
  }
  unint64_t v6 = (4 * a1) & 0xC0000000 | (unint64_t)v5;
  if (a2) {
    return v6;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000C273C(int a1, int a2)
{
  if (a2) {
    return a1 & 0x5A950004 | 0x816800000000;
  }
  else {
    return a1 & 0x50010004 | 0x812A00000000;
  }
}

uint64_t sub_1000C2770(uint64_t **a1, uint64_t a2, int a3, int a4, int a5, char a6, int a7, int a8, char a9, char a10, unsigned __int8 a11)
{
  uint64_t v11 = *a1;
  char v12 = a1[1];
  if (*a1 == v12) {
    return 0x956A5A950000;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *a1;
  do
  {
    uint64_t v15 = *v14++;
    v13 |= v15 & 4;
  }
  while (v14 != v12);
  uint64_t v16 = 0x50000000000;
  if (!a8) {
    uint64_t v16 = 0;
  }
  long long v17 = *a1;
  do
  {
    uint64_t v18 = *v17++;
    v16 &= v18;
  }
  while (v17 != v12);
  if (v16 == 0x50000000000)
  {
    uint64_t v19 = 0;
    LOBYTE(v20) = 1;
    uint64_t v21 = *a1;
    do
    {
      uint64_t v23 = *v21++;
      uint64_t v22 = v23;
      uint64_t v24 = v23 & 0x20000;
      if (!a7) {
        uint64_t v24 = 0;
      }
      v19 |= v22 & 0x608505680000 | v24;
      int v20 = ((v22 & 0x100000000000) != 0) & v20;
    }
    while (v21 != v12);
    BOOL v25 = v20 == 0;
    uint64_t v26 = 0x50000000000;
    if (!v25) {
      uint64_t v26 = 0x150000000000;
    }
    v13 |= v11[a2] & 0x1000000000 | v19 | v26;
  }
  char v27 = a3 ^ 1;
  unint64_t v28 = v12 - v11;
  int v29 = (a3 | a4) ^ 1;
  int v30 = (a3 ^ 1) & a4;
  LOBYTE(v31) = a7 ^ 1;
  if (v28 <= 1) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v28;
  }
  LOBYTE(v33) = 1;
  uint64_t v34 = (unint64_t *)v11;
  uint64_t v35 = a2;
  LOBYTE(v36) = 1;
  do
  {
    unint64_t v37 = *v34++;
    int v31 = BYTE2(v37) & 1 & v31;
    uint64_t v38 = (v37 >> 18) & 1;
    uint64_t v39 = (v37 >> 25) & 1;
    v29 &= v39;
    int v36 = ((v37 & 0x800000000) != 0) & v36;
    int v33 = ((v37 & 0x200000000) != 0) & v33;
    if (v35) {
      int v40 = v39;
    }
    else {
      int v40 = 1;
    }
    v30 &= v40 & v38;
    --v35;
    --v32;
  }
  while (v32);
  if (v31) {
    v13 |= 0x10000uLL;
  }
  if (v30) {
    v13 |= 0x40000uLL;
  }
  if (v29) {
    v13 |= 0x2000000uLL;
  }
  if (v36) {
    v13 |= 0x800000000uLL;
  }
  if (v33) {
    v13 |= 0x200000000uLL;
  }
  uint64_t v41 = v11[a2] & 0x2000000000 | v13;
  if ((((v27 | a11) & a9) & a4) != 0) {
    v41 |= 0x10000000uLL;
  }
  if (((a6 & a10) & (a5 ^ 1 | a11)) != 0) {
    return v41 | 0x40000000;
  }
  else {
    return v41;
  }
}

uint64_t sub_1000C2940(uint64_t a1)
{
  return a1 & 0xFFFF00000007;
}

uint64_t sub_1000C294C(uint64_t a1, int a2)
{
  uint64_t v2 = 0xC00E05430007;
  if (a2) {
    uint64_t v2 = 0xC00F05430007;
  }
  return v2 & a1;
}

uint64_t sub_1000C2974(uint64_t a1)
{
  return a1 & 0x3BFCFFFF0007;
}

uint64_t sub_1000C2988(uint64_t a1, int a2)
{
  uint64_t v2 = 176160768;
  if ((a1 & 0x10000) == 0) {
    uint64_t v2 = 0x800000;
  }
  uint64_t v3 = v2 | a1 & 0x2800010004;
  if (!a2) {
    v3 |= a1 & 0x4000000000 | 3;
  }
  if ((a2 & ((a1 & 0x10000000000) == 0)) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = a1 & 0x20000;
  }
  return v3 | v4;
}

uint64_t sub_1000C29DC(uint64_t a1, int a2)
{
  uint64_t v2 = 0x852800000000;
  if (a2) {
    uint64_t v2 = 0x812800000000;
  }
  return v2 | a1;
}

uint64_t sub_1000C29F4(uint64_t a1)
{
  uint64_t v1 = 0xCD0F00010004;
  if ((a1 & 0x10000000000) == 0) {
    uint64_t v1 = 0x850A00010004;
  }
  return v1 & a1;
}

uint64_t sub_1000C2A1C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a2 & 0x8000000000 | a1 & 0x8000000003;
  if (a3) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = a2 & a1 & 0x40000000000 | 0x5400000 | a2 & a1 & 0x810A00010000 | (a2 | a1) & 4 | v3 | 0x2000000000;
  if (a3) {
    uint64_t v4 = a2 & a1 & 0x810A00010000 | (a2 | a1) & 4 | v3 | 0x2000000000;
  }
  if ((((a1 & 0x10000000000) == 0) & a3) != 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 0x4205A56A0000;
  }
  if ((a3 & ((a2 & 0x10000000000) == 0)) != 0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = a2 & 0x4A05A56A0000;
  }
  return v6 | v5 | v4;
}

void sub_1000C2AB0()
{
  __assert_rtn("RDQSRSoundSource_block_invoke", "RDQSRSoundSource.cc", 183, "queueAttributes != NULL");
}

void sub_1000C2AE4(void *a1)
{
}

void sub_1000C2B4C()
{
}

uint64_t sub_1000C2BB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1000C2BE0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t sub_1000C2C18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1000C2C3C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_1000C2C74(_xpc_connection_s *a1)
{
  uint64_t v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = xpc_connection_get_pid(a1);
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "peer(%d) killed me", (uint8_t *)v3, 8u);
  }
  abort();
}

void sub_1000C2CF8()
{
  __assert_rtn("speechrecognitiond_new_peer_event_handler", "main.cpp", 203, "type == XPC_TYPE_DICTIONARY");
}

void sub_1000C2D24()
{
  __assert_rtn("speechrecognitiond_peer_event_handler", "main.cpp", 117, "type == XPC_TYPE_DICTIONARY");
}

void sub_1000C2D50()
{
  int v0 = RXOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "RDASRWSpeechRecognizerCreate return nil!", v1, 2u);
  }
  abort();
}

uint64_t sub_1000C2DA4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
}

void sub_1000C2DDC(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *VoiceActionsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"RDVAFSTSpotter.h", 17, @"%s", *a1);

  __break(1u);
}

void sub_1000C2E5C()
{
  int v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getVATKeywordSpotterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"RDVAFSTSpotter.h", 19, @"Unable to find class %s", "VATKeywordSpotter");

  __break(1u);
}

uint64_t sub_1000C2F30()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_1000C2F40()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000C2F50()
{
  return AttributedString.characters.getter();
}

uint64_t sub_1000C2F60()
{
  return type metadata accessor for AttributedString.CharacterView();
}

uint64_t sub_1000C2F70()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_1000C2F80()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000C2F90()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000C2FA0()
{
  return URL.absoluteURL.getter();
}

uint64_t sub_1000C2FB0()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_1000C2FC0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000C2FD0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C2FE0()
{
  return type metadata accessor for URL();
}

NSData sub_1000C2FF0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000C3000()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C3010()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C3020()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000C3030()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000C3040()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000C3050()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C3060()
{
  return static Locale.current.getter();
}

uint64_t sub_1000C3070()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000C3080()
{
  return type metadata accessor for VAComputeUnits();
}

uint64_t sub_1000C3090()
{
  return dispatch thunk of VAKeywordSpotter.startWithKeywords(params:)();
}

uint64_t sub_1000C30A0()
{
  return dispatch thunk of VAKeywordSpotter.addAudio(buffer:hostTime:)();
}

uint64_t sub_1000C30B0()
{
  return VARuntimeParameters.defaultThreshold.setter();
}

uint64_t sub_1000C30C0()
{
  return VARuntimeParameters.saveKeywordAudio.setter();
}

uint64_t sub_1000C30D0()
{
  return VARuntimeParameters.maximumBufferSamples.setter();
}

uint64_t sub_1000C30E0()
{
  return VARuntimeParameters.keywords.setter();
}

uint64_t sub_1000C30F0()
{
  return VARuntimeParameters.init()();
}

uint64_t sub_1000C3100()
{
  return type metadata accessor for VARuntimeParameters();
}

uint64_t sub_1000C3110()
{
  return static VAFixedKeywordSpotter.buildForAudioToText(delegate:jsonConfigFilename:computeUnits:)();
}

uint64_t sub_1000C3120()
{
  return type metadata accessor for VAFixedKeywordSpotter();
}

uint64_t sub_1000C3130()
{
  return VAKeywordSpottedEvent.silenceAfter.getter();
}

uint64_t sub_1000C3140()
{
  return VAKeywordSpottedEvent.speechDuring.getter();
}

uint64_t sub_1000C3150()
{
  return VAKeywordSpottedEvent.silenceBefore.getter();
}

uint64_t sub_1000C3160()
{
  return VAKeywordSpottedEvent.score.getter();
}

uint64_t sub_1000C3170()
{
  return VAKeywordSpottedEvent.keyword.getter();
}

uint64_t sub_1000C3180()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000C3190()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000C31A0()
{
  return Logger.init()();
}

uint64_t sub_1000C31B0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000C31F0()
{
  return SpeechAnalyzer.__allocating_init<A>(client:inputSequence:audioFormat:modules:options:restrictedLogging:analysisContext:didChangeVolatileRange:)();
}

uint64_t sub_1000C3200()
{
  return type metadata accessor for SpeechAnalyzer();
}

uint64_t sub_1000C3210()
{
  return type metadata accessor for SpeechDonation.AudioSource();
}

uint64_t sub_1000C3220()
{
  return SpeechDonation.init(donorBundleID:recordingDate:audioBuffers:locale:transcription:evaluation:speechAttributes:taskHint:audioSource:donorReferenceID:)();
}

uint64_t sub_1000C3230()
{
  return type metadata accessor for SpeechDonation.TranscriptionEvaluation();
}

uint64_t sub_1000C3250()
{
  return type metadata accessor for SpeechDonation();
}

uint64_t sub_1000C3260()
{
  return ClientInfo.init(identifier:)();
}

uint64_t sub_1000C3270()
{
  return type metadata accessor for ClientInfo();
}

uint64_t sub_1000C3280()
{
  return Transcriber.ModelOptions.init(supplementalModelURL:farField:modelOverrideURL:speechProfiles:userIdMask:taskForMemoryLock:atypicalSpeech:enableParallelLoading:speechProfileContainers:)();
}

uint64_t sub_1000C3290()
{
  return type metadata accessor for Transcriber.ModelOptions();
}

uint64_t sub_1000C32A0()
{
  return type metadata accessor for Transcriber.ReportingOption();
}

uint64_t sub_1000C32B0()
{
  return Transcriber.MultisegmentResult.earResultType.getter();
}

uint64_t sub_1000C32C0()
{
  return Transcriber.MultisegmentResult.transcriptions.getter();
}

uint64_t sub_1000C32D0()
{
  return Transcriber.MultisegmentResult.transcriptionTokens.getter();
}

uint64_t sub_1000C32E0()
{
  return Transcriber.MultisegmentResult.range.getter();
}

uint64_t sub_1000C32F0()
{
  return Transcriber.MultisegmentResult.segments.getter();
}

uint64_t sub_1000C3300()
{
  return type metadata accessor for Transcriber.MultisegmentResult();
}

uint64_t sub_1000C3310()
{
  return type metadata accessor for Transcriber.TranscriptionOption();
}

uint64_t sub_1000C3320()
{
  return Transcriber.multisegmentResults.getter();
}

uint64_t sub_1000C3330()
{
  return Transcriber.init(locale:taskHint:modelOptions:transcriptionOptions:reportingOptions:attributeOptions:)();
}

uint64_t sub_1000C3340()
{
  return type metadata accessor for Transcriber();
}

uint64_t sub_1000C3350()
{
  return AnalyzerInput.init(buffer:bufferStartTime:)();
}

uint64_t sub_1000C3360()
{
  return type metadata accessor for AnalyzerInput();
}

uint64_t sub_1000C3370()
{
  return type metadata accessor for EARResultType();
}

uint64_t sub_1000C3380()
{
  return dispatch thunk of AnalysisContext.profileData.setter();
}

uint64_t sub_1000C3390()
{
  return dispatch thunk of AnalysisContext.jitProfileData.setter();
}

uint64_t sub_1000C33A0()
{
  return dispatch thunk of AnalysisContext.contextualStrings.modify();
}

uint64_t sub_1000C33B0()
{
  return static AnalysisContext.ContextualStringsTag.leftContext.getter();
}

uint64_t sub_1000C33C0()
{
  return type metadata accessor for AnalysisContext.ContextualStringsTag();
}

uint64_t sub_1000C33D0()
{
  return dispatch thunk of AnalysisContext.userData.getter();
}

uint64_t sub_1000C33E0()
{
  return type metadata accessor for AnalysisContext();
}

uint64_t sub_1000C33F0()
{
  return type metadata accessor for AnalysisOptions.PowerContext();
}

uint64_t sub_1000C3400()
{
  return type metadata accessor for AnalysisOptions.ModelRetention();
}

uint64_t sub_1000C3410()
{
  return AnalysisOptions.init(priority:modelRetention:powerContext:)();
}

uint64_t sub_1000C3420()
{
  return type metadata accessor for AnalysisOptions();
}

uint64_t sub_1000C3430()
{
  return TranscriptionToken.confidence.getter();
}

uint64_t sub_1000C3440()
{
  return TranscriptionToken.silenceStart.getter();
}

uint64_t sub_1000C3450()
{
  return TranscriptionToken.hasSpaceAfter.getter();
}

uint64_t sub_1000C3460()
{
  return TranscriptionToken.phoneSequence.getter();
}

uint64_t sub_1000C3470()
{
  return TranscriptionToken.hasSpaceBefore.getter();
}

uint64_t sub_1000C3480()
{
  return TranscriptionToken.ipaPhoneSequence.getter();
}

uint64_t sub_1000C3490()
{
  return TranscriptionToken.end.getter();
}

uint64_t sub_1000C34A0()
{
  return TranscriptionToken.start.getter();
}

uint64_t sub_1000C34B0()
{
  return TranscriptionToken.tokenName.getter();
}

uint64_t sub_1000C34C0()
{
  return type metadata accessor for TranscriptionToken();
}

uint64_t sub_1000C34D0()
{
  return TranscriptionSegment.alternativeTokens.getter();
}

uint64_t sub_1000C34E0()
{
  return TranscriptionSegment.tokens.getter();
}

uint64_t sub_1000C34F0()
{
  return type metadata accessor for TranscriptionSegment();
}

uint64_t sub_1000C3500()
{
  return type metadata accessor for TaskHint();
}

NSDictionary sub_1000C3510()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000C3520()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C3530()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000C3540()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1000C3550()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000C3560()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_1000C3570(Swift::String a1)
{
}

Swift::Int sub_1000C3580()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000C3590()
{
  return String.init<A>(_:)();
}

NSArray sub_1000C35A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000C35B0()
{
  return static Array._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000C35C0()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000C35D0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C35E0()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_1000C35F0()
{
  return Array.append(_:)();
}

uint64_t sub_1000C3600()
{
  return type metadata accessor for Array();
}

uint64_t sub_1000C3610()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000C3630()
{
  return static TaskPriority.high.getter();
}

uint64_t sub_1000C3640()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000C3650()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000C3660()
{
  return static AsyncStream.makeStream(of:bufferingPolicy:)();
}

uint64_t sub_1000C3670()
{
  return AsyncStream.Continuation.yield(_:)();
}

void sub_1000C3680()
{
}

void sub_1000C3690()
{
}

uint64_t sub_1000C36A0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_1000C36B0()
{
  return CMTimeRange.end.getter();
}

uint64_t sub_1000C36C0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000C36D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000C36E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000C36F0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000C3700()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_1000C3710()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000C3720()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000C3730()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000C3740()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_1000C3750()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000C3760()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000C3770()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000C3780()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000C3790(Swift::Int a1)
{
}

uint64_t sub_1000C37A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000C37B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000C37C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000C37D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000C37E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000C37F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000C3800()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000C3810()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000C3820()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000C3830()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000C3840()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t sub_1000C3850()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000C3860()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000C3870()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000C3880()
{
  return dispatch thunk of Error._code.getter();
}

uint64_t sub_1000C3890()
{
  return dispatch thunk of Error._domain.getter();
}

uint64_t AFDeviceHighestLanguageModelCapabilityIdentifier()
{
  return _AFDeviceHighestLanguageModelCapabilityIdentifier();
}

uint64_t AFPreferencesAssistantEnabled()
{
  return _AFPreferencesAssistantEnabled();
}

OSStatus AudioFileGetGlobalInfo(AudioFilePropertyID inPropertyID, UInt32 inSpecifierSize, void *inSpecifier, UInt32 *ioDataSize, void *outPropertyData)
{
  return _AudioFileGetGlobalInfo(inPropertyID, inSpecifierSize, inSpecifier, ioDataSize, outPropertyData);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
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

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return _CFCharacterSetCreateMutableCopy(alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return _CFCharacterSetGetPredefined(theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return _CFCharacterSetIsCharacterMember(theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return _CFCopySearchPathForDirectoriesInDomains();
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return _CFLocaleCreate(allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return _CFLocaleCreateCanonicalLocaleIdentifierFromString(allocator, localeIdentifier);
}

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale)
{
  return _CFLocaleCreateCopy(allocator, locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return _CFLocaleGetValue(locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return _CFStringFindAndReplace(theString, stringToFind, replacementString, rangeToSearch, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindCharacterFromSet(theString, theSet, rangeToSearch, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return _CFURLCopyPath(anURL);
}

CFURLRef CFURLCreateByResolvingBookmarkData(CFAllocatorRef allocator, CFDataRef bookmark, CFURLBookmarkResolutionOptions options, CFURLRef relativeToURL, CFArrayRef resourcePropertiesToInclude, Boolean *isStale, CFErrorRef *error)
{
  return _CFURLCreateByResolvingBookmarkData(allocator, bookmark, options, relativeToURL, resourcePropertiesToInclude, isStale, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return _CFURLGetString(anURL);
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return _CFURLSetResourcePropertyForKey(url, key, propertyValue, error);
}

void CFURLStopAccessingSecurityScopedResource(CFURLRef url)
{
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return _ExtAudioFileCreateWithURL(inURL, inFileType, inStreamDesc, inChannelLayout, inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return _ExtAudioFileDispose(inExtAudioFile);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return _ExtAudioFileOpenURL(inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return _ExtAudioFileRead(inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return _ExtAudioFileSetProperty(inExtAudioFile, inPropertyID, inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return _ExtAudioFileWrite(inExtAudioFile, inNumberFrames, ioData);
}

IOReturn IOPMAssertionDeclareUserActivity(CFStringRef AssertionName, IOPMUserActiveType userType, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionDeclareUserActivity(AssertionName, userType, AssertionID);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

uint64_t RXGetAssetFallbackLocaleIdentifier()
{
  return _RXGetAssetFallbackLocaleIdentifier();
}

uint64_t RXGetAssetFallbackLocales()
{
  return _RXGetAssetFallbackLocales();
}

uint64_t RXIsAudioDonationOptedIn()
{
  return _RXIsAudioDonationOptedIn();
}

uint64_t RXIsAudioDonationSupported()
{
  return _RXIsAudioDonationSupported();
}

uint64_t RXIsKeywordSpotterEnabled()
{
  return _RXIsKeywordSpotterEnabled();
}

uint64_t RXIsLocaleSupportingKeywordSpotter()
{
  return _RXIsLocaleSupportingKeywordSpotter();
}

uint64_t RXIsLocaleSupportingOndeviceSpeechDetection()
{
  return _RXIsLocaleSupportingOndeviceSpeechDetection();
}

uint64_t RXIsLocaleWithNoSpaceInPostITN()
{
  return _RXIsLocaleWithNoSpaceInPostITN();
}

uint64_t RXIsLocaleWithSpecialHyphenHandling()
{
  return _RXIsLocaleWithSpecialHyphenHandling();
}

uint64_t RXIsSpeechDetectorEnabled()
{
  return _RXIsSpeechDetectorEnabled();
}

uint64_t RXIsSpeechSPIEnabled()
{
  return _RXIsSpeechSPIEnabled();
}

uint64_t RXIsUseIndependentVADEnabled()
{
  return _RXIsUseIndependentVADEnabled();
}

uint64_t RXIsVoiceActionsVisionKWSEnabled()
{
  return _RXIsVoiceActionsVisionKWSEnabled();
}

uint64_t RXLocalesSupportingSpellingMode()
{
  return _RXLocalesSupportingSpellingMode();
}

uint64_t RXLocalizedStringForSpacebar()
{
  return _RXLocalizedStringForSpacebar();
}

uint64_t RXReplaceHyphensWithSpace()
{
  return _RXReplaceHyphensWithSpace();
}

uint64_t SRSSCopyNvasrFromIPA()
{
  return _SRSSCopyNvasrFromIPA();
}

uint64_t SRSSPhoneticCheckerCopyGuesses()
{
  return _SRSSPhoneticCheckerCopyGuesses();
}

uint64_t SRSSPhoneticCheckerCreate()
{
  return _SRSSPhoneticCheckerCreate();
}

uint64_t SRSSPhoneticCheckerResultCopyText()
{
  return _SRSSPhoneticCheckerResultCopyText();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::find(this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::rfind(this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return std::locale::name(retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return std::regex_error::regex_error(this, __ecode);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::assign(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return std::string::operator=(this, __c);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::close()
{
  return std::filebuf::close();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::read()
{
  return std::istream::read();
}

uint64_t std::istream::seekg()
{
  return std::istream::seekg();
}

uint64_t std::istream::tellg()
{
  return std::istream::tellg();
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::getline()
{
  return std::istream::getline();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::istream::operator>>()
{
  return std::istream::operator>>();
}

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::write()
{
  return std::ostream::write();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return std::random_device::random_device(this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return std::random_device::operator()(this);
}

uint64_t std::ofstream::open()
{
  return std::ofstream::open();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return std::__get_classname(__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return std::__get_collation_name(retstr, __s);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return std::stoi(__str, __idx, __base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::stoll(const std::string *__str, size_t *__idx, int __base)
{
  return std::stoll(__str, __idx, __base);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
}

void std::locale::~locale(std::locale *this)
{
}

unint64_t std::stoull(const std::string *__str, size_t *__idx, int __base)
{
  return std::stoull(__str, __idx, __base);
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
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return _backtrace_symbols(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

long double log(long double __x)
{
  return _log(__x);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
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

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int rand(void)
{
  return _rand();
}

uint64_t random(void)
{
  return _random();
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return _strpbrk(__s1, __s2);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return _wmemchr(__s, __c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uint64(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return _xpc_copy(object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_track_activity()
{
  return _xpc_track_activity();
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__addRecordedSpeechSampleData_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addRecordedSpeechSampleData:length:");
}

id objc_msgSend__assetPathForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assetPathForLanguage:error:");
}

id objc_msgSend__assetQueryForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assetQueryForLanguage:");
}

id objc_msgSend__cancelDownloadForLangaugeWithError_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelDownloadForLangaugeWithError:withError:");
}

id objc_msgSend__cancelDownloadForLanguageWithError_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelDownloadForLanguageWithError:withError:");
}

id objc_msgSend__didReceiveSiriSettingChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveSiriSettingChanged:");
}

id objc_msgSend__downloadStatusDescription(void *a1, const char *a2, ...)
{
  return _[a1 _downloadStatusDescription];
}

id objc_msgSend__drainAndClearAudioConverter(void *a1, const char *a2, ...)
{
  return _[a1 _drainAndClearAudioConverter];
}

id objc_msgSend__endAllDownloadsForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endAllDownloadsForLanguage:");
}

id objc_msgSend__errorStringForCancelDownloadResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForCancelDownloadResult:");
}

id objc_msgSend__errorStringForDownloadResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForDownloadResult:");
}

id objc_msgSend__errorStringForPurgeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForPurgeResult:");
}

id objc_msgSend__errorStringForQueryResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForQueryResult:");
}

id objc_msgSend__es_compareByVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_compareByVersion:");
}

id objc_msgSend__es_contentVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_contentVersion");
}

id objc_msgSend__es_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_description");
}

id objc_msgSend__es_isCompatibleWithThisDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_isCompatibleWithThisDevice");
}

id objc_msgSend__es_isDownloading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_isDownloading");
}

id objc_msgSend__es_isInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_isInstalled");
}

id objc_msgSend__es_language(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_language");
}

id objc_msgSend__es_masteredVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_masteredVersion");
}

id objc_msgSend__es_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_path");
}

id objc_msgSend__es_quasarDir(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_quasarDir");
}

id objc_msgSend__es_quasarModelPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_quasarModelPath");
}

id objc_msgSend__es_requiredCapabilityIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_requiredCapabilityIdentifier");
}

id objc_msgSend__es_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_status");
}

id objc_msgSend__fetchContactsWithKeepGoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchContactsWithKeepGoing:");
}

id objc_msgSend__handleSpeechDetectionVADPresentChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSpeechDetectionVADPresentChange:");
}

id objc_msgSend__initWithLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithLanguage:");
}

id objc_msgSend__installedAssetForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedAssetForLanguage:error:");
}

id objc_msgSend__installedAssetFromFoundAssets_language_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedAssetFromFoundAssets:language:error:");
}

id objc_msgSend__installedLocalAssetForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedLocalAssetForLanguage:error:");
}

id objc_msgSend__isActiveDownloadForLanguage_downloadId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isActiveDownloadForLanguage:downloadId:");
}

id objc_msgSend__isDownloadingForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDownloadingForLanguage:");
}

id objc_msgSend__isDownloadingStalledForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDownloadingStalledForLanguage:");
}

id objc_msgSend__languagesWithDownloadAttempts(void *a1, const char *a2, ...)
{
  return _[a1 _languagesWithDownloadAttempts];
}

id objc_msgSend__queryAndCopyInstallationStatusForLanguagesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryAndCopyInstallationStatusForLanguagesWithError:");
}

id objc_msgSend__resumeStalledDownloadForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resumeStalledDownloadForLanguage:");
}

id objc_msgSend__sendCallback(void *a1, const char *a2, ...)
{
  return _[a1 _sendCallback];
}

id objc_msgSend__sendDownloadCallbackDictionaryWithLanguage_downloadPhase_timeRemaining_bytesWritten_bytesTotal_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:");
}

id objc_msgSend__sendMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessageToClient:");
}

id objc_msgSend__speechDonation(void *a1, const char *a2, ...)
{
  return _[a1 _speechDonation];
}

id objc_msgSend__stalledDownloadForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stalledDownloadForLanguage:");
}

id objc_msgSend__startDownloadForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDownloadForLanguage:");
}

id objc_msgSend__startObservingSpeechClientsActive(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingSpeechClientsActive];
}

id objc_msgSend__startObservingSpeechDetectionVADPresence(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingSpeechDetectionVADPresence];
}

id objc_msgSend__startObservingSystemControllerLifecycle(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingSystemControllerLifecycle];
}

id objc_msgSend__startedDownloadingEmbeddedSpeechAsset_withUrgency_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startedDownloadingEmbeddedSpeechAsset:withUrgency:error:");
}

id objc_msgSend__startedUrgentDownloadingEmbeddedSpeechAssetForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:error:");
}

id objc_msgSend__stopObservingSpeechClientsActive(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingSpeechClientsActive];
}

id objc_msgSend__waitAndFinishSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 _waitAndFinishSpeaking];
}

id objc_msgSend_activateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 activateNotifications];
}

id objc_msgSend_activeConfigurationForEverything(void *a1, const char *a2, ...)
{
  return _[a1 activeConfigurationForEverything];
}

id objc_msgSend_adaptUserProfileWithUserData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adaptUserProfileWithUserData:");
}

id objc_msgSend_addAudio_numSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAudio:numSamples:");
}

id objc_msgSend_addAudioSamplesWithAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAudioSamplesWithAudio:");
}

id objc_msgSend_addAudioSamplesWithAudio_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAudioSamplesWithAudio:count:");
}

id objc_msgSend_addKeyValuePair_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyValuePair:with:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPeerForCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPeerForCallback:");
}

id objc_msgSend_addPhraseToUserProfileWithTemplateName_wordTag_phrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPhraseToUserProfileWithTemplateName:wordTag:phrase:");
}

id objc_msgSend_addWordWithParts_templateName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addWordWithParts:templateName:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachAnalysisContextWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachAnalysisContextWithCompletionHandler:");
}

id objc_msgSend_attachProgressCallBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachProgressCallBack:");
}

id objc_msgSend_attachTranscriberWithTask_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachTranscriberWithTask:completionHandler:");
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_attributionWithAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributionWithAuditToken:");
}

id objc_msgSend_audioEngine(void *a1, const char *a2, ...)
{
  return _[a1 audioEngine];
}

id objc_msgSend_audioPCMBuffers(void *a1, const char *a2, ...)
{
  return _[a1 audioPCMBuffers];
}

id objc_msgSend_audioSessionSetupCompleted(void *a1, const char *a2, ...)
{
  return _[a1 audioSessionSetupCompleted];
}

id objc_msgSend_avIndependenRouteSoundInput(void *a1, const char *a2, ...)
{
  return _[a1 avIndependenRouteSoundInput];
}

id objc_msgSend_avSoundInput(void *a1, const char *a2, ...)
{
  return _[a1 avSoundInput];
}

id objc_msgSend_availableInputs(void *a1, const char *a2, ...)
{
  return _[a1 availableInputs];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cancelDownloadForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadForLanguage:error:");
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return _[a1 cancelDownloadSync];
}

id objc_msgSend_cancelRecognition(void *a1, const char *a2, ...)
{
  return _[a1 cancelRecognition];
}

id objc_msgSend_catalogDownloadInProgress(void *a1, const char *a2, ...)
{
  return _[a1 catalogDownloadInProgress];
}

id objc_msgSend_channelCount(void *a1, const char *a2, ...)
{
  return _[a1 channelCount];
}

id objc_msgSend_commandTaggingFromRecognitionResult_activeCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandTaggingFromRecognitionResult:activeCommands:");
}

id objc_msgSend_commonFormat(void *a1, const char *a2, ...)
{
  return _[a1 commonFormat];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_contactsWords(void *a1, const char *a2, ...)
{
  return _[a1 contactsWords];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_convertRawAudiotoPCM_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRawAudiotoPCM:count:");
}

id objc_msgSend_convertToBuffer_error_withInputFromBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertToBuffer:error:withInputFromBlock:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyInstallationStatusForLangaugesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstallationStatusForLangaugesWithError:");
}

id objc_msgSend_copyInstalledAssetPathForLangaugeWithError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledAssetPathForLangaugeWithError:error:");
}

id objc_msgSend_copyInstalledAssetPropertiesForLangaugeWithError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledAssetPropertiesForLangaugeWithError:error:");
}

id objc_msgSend_copyInstalledAssetSupportedTasksForLangaugeWithError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledAssetSupportedTasksForLangaugeWithError:error:");
}

id objc_msgSend_copyInstalledQuasarModelPathForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledQuasarModelPathForLanguage:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createCaesuraSPG(void *a1, const char *a2, ...)
{
  return _[a1 createCaesuraSPG];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createRecognitionBufferWithDelegate_task_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRecognitionBufferWithDelegate:task:");
}

id objc_msgSend_csSoundInput(void *a1, const char *a2, ...)
{
  return _[a1 csSoundInput];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSession];
}

id objc_msgSend_currentTask(void *a1, const char *a2, ...)
{
  return _[a1 currentTask];
}

id objc_msgSend_dataProfile(void *a1, const char *a2, ...)
{
  return _[a1 dataProfile];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 deactivateNotifications];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodePropertyListForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodePropertyListForKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultOption(void *a1, const char *a2, ...)
{
  return _[a1 defaultOption];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_donateWithAudioBuffers_logAudioFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateWithAudioBuffers:logAudioFile:");
}

id objc_msgSend_donorBundleID(void *a1, const char *a2, ...)
{
  return _[a1 donorBundleID];
}

id objc_msgSend_donorReferenceID(void *a1, const char *a2, ...)
{
  return _[a1 donorReferenceID];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAudio(void *a1, const char *a2, ...)
{
  return _[a1 endAudio];
}

id objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateContactsWithFetchRequest:error:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateVocabularyUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateVocabularyUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_expectedTimeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 expectedTimeRemaining];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fetchAssetsForLanguage_urgent_forceUpgrade_detailedProgress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsForLanguage:urgent:forceUpgrade:detailedProgress:completion:");
}

id objc_msgSend_fetchAssetsForLanguage_urgent_progress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsForLanguage:urgent:progress:completion:");
}

id objc_msgSend_fetchUserDataWithLanguage_keepGoing_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUserDataWithLanguage:keepGoing:completion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return _[a1 format];
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return _[a1 frameLength];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return _[a1 frequency];
}

id objc_msgSend_getJitProfileData(void *a1, const char *a2, ...)
{
  return _[a1 getJitProfileData];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalUrl];
}

id objc_msgSend_getUserProfileData(void *a1, const char *a2, ...)
{
  return _[a1 getUserProfileData];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSpaceAfter(void *a1, const char *a2, ...)
{
  return _[a1 hasSpaceAfter];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_init_delegate_silenceLookback_silenceExpect_batchDecode_enableAudioDebugging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:delegate:silenceLookback:silenceExpect:batchDecode:enableAudioDebugging:");
}

id objc_msgSend_initForWriting_settings_commonFormat_interleaved_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForWriting:settings:commonFormat:interleaved:error:");
}

id objc_msgSend_initFromFormat_toFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFromFormat:toFormat:");
}

id objc_msgSend_initWithBundleID_donorReferenceID_locale_taskHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:donorReferenceID:locale:taskHint:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfigFile_samplingRate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigFile:samplingRate:queue:");
}

id objc_msgSend_initWithConfiguration_language_overrides_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:");
}

id objc_msgSend_initWithConfiguration_language_sdapiOverrides_generalVoc_emptyVoc_pgVoc_lexiconEnh_tokenEnh_paramsetHolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:language:sdapiOverrides:generalVoc:emptyVoc:pgVoc:lexiconEnh:tokenEnh:paramsetHolder:");
}

id objc_msgSend_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:");
}

id objc_msgSend_initWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:options:error:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_locale_highPriority_farField_supportEmojiRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:locale:highPriority:farField:supportEmojiRecognition:");
}

id objc_msgSend_initWithDeliverSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeliverSamples:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDonorBundleID_donorReferenceID_recordingDate_locale_taskHint_transcription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDonorBundleID:donorReferenceID:recordingDate:locale:taskHint:transcription:");
}

id objc_msgSend_initWithExpectedFormat_deliverSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExpectedFormat:deliverSamples:");
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeysToFetch:");
}

id objc_msgSend_initWithLanguage_assetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:assetPath:");
}

id objc_msgSend_initWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocale:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithName_options_queue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:options:queue:delegate:");
}

id objc_msgSend_initWithOrthography_pronunciations_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrthography:pronunciations:tag:");
}

id objc_msgSend_initWithOrthography_pronunciations_tagName_frequency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrthography:pronunciations:tagName:frequency:");
}

id objc_msgSend_initWithPCMFormat_frameCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPCMFormat:frameCapacity:");
}

id objc_msgSend_initWithStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStream:");
}

id objc_msgSend_initWithStreamDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamDescription:");
}

id objc_msgSend_initWithSwiftSpeechAnalyzer_task_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSwiftSpeechAnalyzer:task:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_inputFormat(void *a1, const char *a2, ...)
{
  return _[a1 inputFormat];
}

id objc_msgSend_inputFormatForBus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputFormatForBus:");
}

id objc_msgSend_inputNode(void *a1, const char *a2, ...)
{
  return _[a1 inputNode];
}

id objc_msgSend_installTapOnBus_bufferSize_format_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installTapOnBus:bufferSize:format:block:");
}

id objc_msgSend_installedLanguages(void *a1, const char *a2, ...)
{
  return _[a1 installedLanguages];
}

id objc_msgSend_installedLanguagesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedLanguagesWithCompletion:");
}

id objc_msgSend_int16ChannelData(void *a1, const char *a2, ...)
{
  return _[a1 int16ChannelData];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interpretationIndices(void *a1, const char *a2, ...)
{
  return _[a1 interpretationIndices];
}

id objc_msgSend_isCSVADHidden(void *a1, const char *a2, ...)
{
  return _[a1 isCSVADHidden];
}

id objc_msgSend_isCSVADPresent(void *a1, const char *a2, ...)
{
  return _[a1 isCSVADPresent];
}

id objc_msgSend_isCallActive(void *a1, const char *a2, ...)
{
  return _[a1 isCallActive];
}

id objc_msgSend_isCarPlayActive(void *a1, const char *a2, ...)
{
  return _[a1 isCarPlayActive];
}

id objc_msgSend_isCommandPhraseTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCommandPhraseTag:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHearstConnected(void *a1, const char *a2, ...)
{
  return _[a1 isHearstConnected];
}

id objc_msgSend_isInterleaved(void *a1, const char *a2, ...)
{
  return _[a1 isInterleaved];
}

id objc_msgSend_isParameterTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isParameterTag:");
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return _[a1 isRecording];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 isSpeaking];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return _[a1 isStalled];
}

id objc_msgSend_isSystemSleeping(void *a1, const char *a2, ...)
{
  return _[a1 isSystemSleeping];
}

id objc_msgSend_jitProfileData(void *a1, const char *a2, ...)
{
  return _[a1 jitProfileData];
}

id objc_msgSend_kickCatalogDownloadWithUrgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickCatalogDownloadWithUrgency:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mapDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapDelegate:");
}

id objc_msgSend_maxFrameSizeForKeywords(void *a1, const char *a2, ...)
{
  return _[a1 maxFrameSizeForKeywords];
}

id objc_msgSend_maximumSupportedConfigurationVersion(void *a1, const char *a2, ...)
{
  return _[a1 maximumSupportedConfigurationVersion];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return _[a1 middleName];
}

id objc_msgSend_minimumSupportedConfigurationVersion(void *a1, const char *a2, ...)
{
  return _[a1 minimumSupportedConfigurationVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nBestResults(void *a1, const char *a2, ...)
{
  return _[a1 nBestResults];
}

id objc_msgSend_newUtteranceBegins(void *a1, const char *a2, ...)
{
  return _[a1 newUtteranceBegins];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return _[a1 nickname];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathForResource_ofType_inDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:inDirectory:");
}

id objc_msgSend_peersRequestingDownloadProgress(void *a1, const char *a2, ...)
{
  return _[a1 peersRequestingDownloadProgress];
}

id objc_msgSend_personNameComponentsFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personNameComponentsFromString:");
}

id objc_msgSend_preITNRecognition(void *a1, const char *a2, ...)
{
  return _[a1 preITNRecognition];
}

id objc_msgSend_preferDecoupledIO_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferDecoupledIO:error:");
}

id objc_msgSend_preferredRouteControlConfig(void *a1, const char *a2, ...)
{
  return _[a1 preferredRouteControlConfig];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_pronunciationsForOrthography_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pronunciationsForOrthography:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purge:");
}

id objc_msgSend_purgeAssetsForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeAssetsForLanguage:error:");
}

id objc_msgSend_purgeInstalledAssetsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeInstalledAssetsWithError:");
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return _[a1 purgeSync];
}

id objc_msgSend_queryAndCopyInstallationStatusForLangaugesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryAndCopyInstallationStatusForLangaugesWithError:");
}

id objc_msgSend_queryMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMetaData:");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _[a1 queryMetaDataSync];
}

id objc_msgSend_readUserProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUserProfile:");
}

id objc_msgSend_readUserProfileFromCache(void *a1, const char *a2, ...)
{
  return _[a1 readUserProfileFromCache];
}

id objc_msgSend_recognition(void *a1, const char *a2, ...)
{
  return _[a1 recognition];
}

id objc_msgSend_recognitionBuffer(void *a1, const char *a2, ...)
{
  return _[a1 recognitionBuffer];
}

id objc_msgSend_recognitionDelegate(void *a1, const char *a2, ...)
{
  return _[a1 recognitionDelegate];
}

id objc_msgSend_recognizer(void *a1, const char *a2, ...)
{
  return _[a1 recognizer];
}

id objc_msgSend_recordingStartDate(void *a1, const char *a2, ...)
{
  return _[a1 recordingStartDate];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return _[a1 refreshState];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePeerFromCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePeerFromCallback:");
}

id objc_msgSend_removeTapOnBus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTapOnBus:");
}

id objc_msgSend_requestAccessForEntityType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAccessForEntityType:completionHandler:");
}

id objc_msgSend_requestedLanguagesForDownload(void *a1, const char *a2, ...)
{
  return _[a1 requestedLanguagesForDownload];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_routeControlOptions(void *a1, const char *a2, ...)
{
  return _[a1 routeControlOptions];
}

id objc_msgSend_runRecognitionWithResultStream_language_task_samplingRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runRecognitionWithResultStream:language:task:samplingRate:");
}

id objc_msgSend_sanitizedStringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizedStringWithString:");
}

id objc_msgSend_sendCallback(void *a1, const char *a2, ...)
{
  return _[a1 sendCallback];
}

id objc_msgSend_sendLiveRecordingOffNotificationWithInterrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLiveRecordingOffNotificationWithInterrupt:");
}

id objc_msgSend_sendLiveRecordingOnNotification(void *a1, const char *a2, ...)
{
  return _[a1 sendLiveRecordingOnNotification];
}

id objc_msgSend_sendMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessageToClient:");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActive_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:error:");
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:withOptions:error:");
}

id objc_msgSend_setAllowHapticsAndSystemSoundsDuringRecording_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowHapticsAndSystemSoundsDuringRecording:error:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetPath:");
}

id objc_msgSend_setAssetsPurgeability_forLanguages_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetsPurgeability:forLanguages:error:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAudioHardwareControlFlags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioHardwareControlFlags:error:");
}

id objc_msgSend_setAudioPCMBuffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioPCMBuffers:");
}

id objc_msgSend_setCatalogDownloadInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCatalogDownloadInProgress:");
}

id objc_msgSend_setCategory_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:withOptions:error:");
}

id objc_msgSend_setConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfidence:");
}

id objc_msgSend_setContextWithJitProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextWithJitProfileData:");
}

id objc_msgSend_setContextWithUserProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextWithUserProfileData:");
}

id objc_msgSend_setCurrentTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTask:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setDoNotBlockOnNetworkStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotBlockOnNetworkStatus:");
}

id objc_msgSend_setDonorBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDonorBundleID:");
}

id objc_msgSend_setDonorReferenceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDonorReferenceID:");
}

id objc_msgSend_setEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnd:");
}

id objc_msgSend_setFrameLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrameLength:");
}

id objc_msgSend_setHasSpaceAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasSpaceAfter:");
}

id objc_msgSend_setHasSpaceBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasSpaceBefore:");
}

id objc_msgSend_setIpaPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIpaPhoneSequence:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMXSessionProperty_value_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMXSessionProperty:value:error:");
}

id objc_msgSend_setMaxFrameSizeForKeywords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxFrameSizeForKeywords:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPeersRequestingDownloadProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeersRequestingDownloadProgress:");
}

id objc_msgSend_setPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneSequence:");
}

id objc_msgSend_setPreferredRouteControlConfig_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredRouteControlConfig:error:");
}

id objc_msgSend_setPrefersNoMicrophoneUsageIndicator_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersNoMicrophoneUsageIndicator:error:");
}

id objc_msgSend_setPurgeabilityForLanguages_withPurgeability_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurgeabilityForLanguages:withPurgeability:error:");
}

id objc_msgSend_setRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRate:");
}

id objc_msgSend_setRecognitionBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionBuffer:");
}

id objc_msgSend_setRecognitionReplacements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionReplacements:");
}

id objc_msgSend_setRecognitionReplacementsWithUseRecognitionReplacements_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionReplacementsWithUseRecognitionReplacements:completionHandler:");
}

id objc_msgSend_setRecognizeEmoji_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognizeEmoji:");
}

id objc_msgSend_setRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognizer:");
}

id objc_msgSend_setRecordingStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordingStartDate:");
}

id objc_msgSend_setRequestedLanguagesForDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestedLanguagesForDownload:");
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPowerPluggedIn:");
}

id objc_msgSend_setRouteControlOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteControlOptions:");
}

id objc_msgSend_setSampleRateConverterQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSampleRateConverterQuality:");
}

id objc_msgSend_setSilenceStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSilenceStart:");
}

id objc_msgSend_setStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStart:");
}

id objc_msgSend_setSwiftSpeechAnalyzer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwiftSpeechAnalyzer:");
}

id objc_msgSend_setTaskHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskHint:");
}

id objc_msgSend_setTextWithLeftContextText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextWithLeftContextText:");
}

id objc_msgSend_setTokenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenName:");
}

id objc_msgSend_setUseRecognitionReplacements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseRecognitionReplacements:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVoice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoice:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_set_speechDonation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_speechDonation:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_setupAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 setupAudioSession];
}

id objc_msgSend_setupDefaultAudioSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDefaultAudioSession:");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_silenceDurationMs(void *a1, const char *a2, ...)
{
  return _[a1 silenceDurationMs];
}

id objc_msgSend_silenceProbability(void *a1, const char *a2, ...)
{
  return _[a1 silenceProbability];
}

id objc_msgSend_spaceCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spaceCheck:");
}

id objc_msgSend_speechAnalyzerAudioBuffer(void *a1, const char *a2, ...)
{
  return _[a1 speechAnalyzerAudioBuffer];
}

id objc_msgSend_speechUtteranceWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechUtteranceWithString:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start_saveRuntimeAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start:saveRuntimeAudio:");
}

id objc_msgSend_startAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAndReturnError:");
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:options:then:");
}

id objc_msgSend_startDownload_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownload:then:");
}

id objc_msgSend_startListenWithOption_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListenWithOption:completion:");
}

id objc_msgSend_startRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecognition:");
}

id objc_msgSend_startRecognitionWithTranscriberModuleWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecognitionWithTranscriberModuleWrapper:");
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return _[a1 startRecording];
}

id objc_msgSend_startRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecording:");
}

id objc_msgSend_startRunningAudioEngine(void *a1, const char *a2, ...)
{
  return _[a1 startRunningAudioEngine];
}

id objc_msgSend_startWithUsedKeywords_saveRuntimeAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithUsedKeywords:saveRuntimeAudio:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopListenWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopListenWithCompletion:");
}

id objc_msgSend_stopRecording(void *a1, const char *a2, ...)
{
  return _[a1 stopRecording];
}

id objc_msgSend_stopRunningAudioEngine(void *a1, const char *a2, ...)
{
  return _[a1 stopRunningAudioEngine];
}

id objc_msgSend_stringArrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringArrayForKey:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_swiftSpeechAnalyzer(void *a1, const char *a2, ...)
{
  return _[a1 swiftSpeechAnalyzer];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_taskHint(void *a1, const char *a2, ...)
{
  return _[a1 taskHint];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tokenSausage(void *a1, const char *a2, ...)
{
  return _[a1 tokenSausage];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return _[a1 tokens];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return _[a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return _[a1 totalWritten];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateUserProfileWithPersonalData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUserProfileWithPersonalData:");
}

id objc_msgSend_updateVolatileDataWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVolatileDataWithBlock:");
}

id objc_msgSend_useRecognitionReplacements(void *a1, const char *a2, ...)
{
  return _[a1 useRecognitionReplacements];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userProfileData(void *a1, const char *a2, ...)
{
  return _[a1 userProfileData];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_voiceWithLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voiceWithLanguage:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeUtterance_toBufferCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUtterance:toBufferCallback:");
}