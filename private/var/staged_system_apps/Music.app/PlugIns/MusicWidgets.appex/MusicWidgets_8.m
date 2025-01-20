void *sub_100517104(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t vars8;

  if (result)
  {

    return (void *)sub_100121638(a4);
  }
  return result;
}

uint64_t sub_10051714C()
{
  v1 = (int *)type metadata accessor for SymbolButton.Configuration(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);

  uint64_t v26 = v0;
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v6 = *(void **)(v0 + v3 + 200);
  if (v6 != (void *)1)
  {

    swift_bridgeObjectRelease();
  }
  v7 = *(void **)(v5 + 224);
  if (v7 != (void *)1)
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v8 = v4 + v2;

  uint64_t v9 = v5 + v1[9];
  uint64_t v10 = sub_100535CE0();
  uint64_t v11 = *(void *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v12(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v13 = v8 + v3;
  v14 = (id *)(v5 + v1[10]);
  if (*v14)
  {
  }
  uint64_t v15 = v13 & ~v2;
  v16 = *(void **)(v5 + v1[11] + 16);
  if (v16 != (void *)1) {

  }
  uint64_t v17 = v5 + v1[16];
  uint64_t v18 = v26 + v15;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v19 = *(void **)(v26 + v15 + 200);
  if (v19 != (void *)1)
  {

    swift_bridgeObjectRelease();
  }
  v20 = *(void **)(v18 + 224);
  if (v20 != (void *)1)
  {

    swift_bridgeObjectRelease();
  }

  uint64_t v21 = v18 + v1[9];
  if (!v12(v21, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v10);
  }
  v22 = (id *)(v18 + v1[10]);
  if (*v22)
  {
  }
  v23 = *(void **)(v18 + v1[11] + 16);
  if (v23 != (void *)1) {

  }
  uint64_t v24 = v18 + v1[16];
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1005174E0()
{
  uint64_t v1 = *(void *)(type metadata accessor for SymbolButton.Configuration(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = (v4 + v2 + v3) & ~v2;
  v6 = *(char **)(v0 + 16);
  uint64_t v7 = *(void *)(v0 + ((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100503BBC(v6, v0 + v3, v0 + v5, v7);
}

uint64_t sub_100517580()
{
  return sub_1005175A4();
}

id sub_100517588()
{
  return [*(id *)(v0 + 16) setAlpha:*(double *)(v0 + 56)];
}

uint64_t sub_10051759C()
{
  return sub_1005175A4();
}

uint64_t sub_1005175A4()
{
  if (*(void *)(v0 + 40)) {
    swift_release();
  }

  return swift_deallocObject();
}

id sub_1005175F8()
{
  double v1 = *(double *)(v0 + 24);
  if (*(unsigned char *)(v0 + 32)) {
    double v1 = 0.0;
  }
  return [*(id *)(v0 + 16) setAlpha:v1];
}

uint64_t sub_100517620()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100517660()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

id sub_100517690(id result, void *a2, void *a3)
{
  if (result != (id)1)
  {
    uint64_t v5 = result;
    swift_bridgeObjectRetain();
    id v6 = v5;
    id v7 = a2;
    return a3;
  }
  return result;
}

uint64_t sub_1005176F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unsigned char *_s11MusicCoreUI12SymbolButtonC8MaterialV5ColorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100517824);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolButton.Animation.TransitionStyle()
{
  return &type metadata for SymbolButton.Animation.TransitionStyle;
}

void destroy for SymbolButton.Transition(uint64_t a1)
{
  if (*(void *)a1)
  {

    if (*(void *)(a1 + 24)) {
      swift_release();
    }
  }
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {

    if (*(void *)(a1 + 64))
    {
      swift_release();
    }
  }
}

uint64_t initializeWithCopy for SymbolButton.Transition(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a2;
  if (*(void *)a2)
  {
    uint64_t v5 = (_OWORD *)(a2 + 24);
    uint64_t v6 = *(void *)(a2 + 24);
    uint64_t v7 = *(void *)(a2 + 8);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    id v8 = v4;
    if (v6)
    {
      uint64_t v9 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = v9;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 24) = *v5;
    }
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v10;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  uint64_t v11 = *(void **)(a2 + 40);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 64);
    uint64_t v13 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = v13;
    *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
    id v14 = v11;
    if (v12)
    {
      uint64_t v15 = *(void *)(a2 + 72);
      *(void *)(a1 + 64) = v12;
      *(void *)(a1 + 72) = v15;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    }
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v16;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t assignWithCopy for SymbolButton.Transition(uint64_t a1, long long *a2)
{
  unsigned int v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  if (*(void *)a1)
  {
    if (!v5)
    {
      sub_100517BFC(a1);
      uint64_t v16 = *((void *)a2 + 4);
      long long v17 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v17;
      *(void *)(a1 + 32) = v16;
      goto LABEL_17;
    }
    *(void *)a1 = v5;
    id v6 = v5;

    uint64_t v7 = *((void *)a2 + 1);
    uint64_t v8 = *(void *)(a1 + 24);
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 8) = v7;
    uint64_t v9 = *((void *)a2 + 3);
    if (v8)
    {
      if (v9)
      {
        uint64_t v10 = *((void *)a2 + 4);
        *(void *)(a1 + 24) = v9;
        *(void *)(a1 + 32) = v10;
        swift_retain();
        swift_release();
        goto LABEL_17;
      }
      swift_release();
      goto LABEL_15;
    }
    if (!v9)
    {
LABEL_15:
      *(_OWORD *)(a1 + 24) = *(long long *)((char *)a2 + 24);
      goto LABEL_17;
    }
    uint64_t v15 = *((void *)a2 + 4);
    *(void *)(a1 + 24) = v9;
LABEL_12:
    *(void *)(a1 + 32) = v15;
    swift_retain();
    goto LABEL_17;
  }
  if (!v5)
  {
    long long v18 = *a2;
    long long v19 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v18;
    *(_OWORD *)(a1 + 16) = v19;
    goto LABEL_17;
  }
  *(void *)a1 = v5;
  uint64_t v11 = *((void *)a2 + 1);
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(void *)(a1 + 8) = v11;
  uint64_t v13 = (long long *)((char *)a2 + 24);
  uint64_t v12 = *((void *)a2 + 3);
  id v14 = v5;
  if (v12)
  {
    uint64_t v15 = *((void *)a2 + 4);
    *(void *)(a1 + 24) = v12;
    goto LABEL_12;
  }
  *(_OWORD *)(a1 + 24) = *v13;
LABEL_17:
  v20 = (long long *)(a1 + 40);
  uint64_t v21 = *(void **)(a1 + 40);
  v23 = (long long *)((char *)a2 + 40);
  v22 = (void *)*((void *)a2 + 5);
  if (!v21)
  {
    if (!v22)
    {
      long long v35 = *v23;
      long long v36 = *(long long *)((char *)a2 + 56);
      *(void *)(a1 + 72) = *((void *)a2 + 9);
      *(_OWORD *)(a1 + 56) = v36;
LABEL_32:
      long long *v20 = v35;
      goto LABEL_34;
    }
    *(void *)(a1 + 40) = v22;
    uint64_t v29 = *((void *)a2 + 6);
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    *(void *)(a1 + 48) = v29;
    uint64_t v30 = *((void *)a2 + 8);
    id v31 = v22;
    if (!v30)
    {
      *(_OWORD *)(a1 + 64) = a2[4];
      goto LABEL_34;
    }
    uint64_t v32 = *((void *)a2 + 9);
    *(void *)(a1 + 64) = v30;
    goto LABEL_28;
  }
  if (!v22)
  {
    sub_100517BFC(a1 + 40);
    uint64_t v33 = *((void *)a2 + 9);
    long long v34 = *(long long *)((char *)a2 + 56);
    long long *v20 = *v23;
    *(_OWORD *)(a1 + 56) = v34;
    *(void *)(a1 + 72) = v33;
    goto LABEL_34;
  }
  *(void *)(a1 + 40) = v22;
  id v24 = v22;

  uint64_t v25 = *((void *)a2 + 6);
  v20 = (long long *)(a1 + 64);
  uint64_t v26 = *(void *)(a1 + 64);
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(void *)(a1 + 48) = v25;
  uint64_t v27 = *((void *)a2 + 8);
  if (!v26)
  {
    if (!v27)
    {
LABEL_31:
      long long v35 = a2[4];
      goto LABEL_32;
    }
    uint64_t v32 = *((void *)a2 + 9);
    *(void *)(a1 + 64) = v27;
LABEL_28:
    *(void *)(a1 + 72) = v32;
    swift_retain();
    goto LABEL_34;
  }
  if (!v27)
  {
    swift_release();
    goto LABEL_31;
  }
  uint64_t v28 = *((void *)a2 + 9);
  *(void *)(a1 + 64) = v27;
  *(void *)(a1 + 72) = v28;
  swift_retain();
  swift_release();
LABEL_34:
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  return a1;
}

uint64_t sub_100517BFC(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for SymbolButton.Transition(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SymbolButton.Transition(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  if (!*(void *)a1) {
    goto LABEL_7;
  }
  if (!*(void *)a2)
  {
    sub_100517BFC(a1);
LABEL_7:
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    goto LABEL_8;
  }
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v16 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v16;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
LABEL_8:
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a2 + 40);
  if (!v9)
  {
LABEL_14:
    long long v14 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v14;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    goto LABEL_15;
  }
  if (!v10)
  {
    sub_100517BFC(a1 + 40);
    goto LABEL_14;
  }
  *(void *)(a1 + 40) = v10;

  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v12 = *(void *)(a1 + 64);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  if (!v12)
  {
    if (v11)
    {
      uint64_t v17 = *(void *)(a2 + 72);
      *(void *)(a1 + 64) = v11;
      *(void *)(a1 + 72) = v17;
      goto LABEL_15;
    }
LABEL_23:
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    goto LABEL_15;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_23;
  }
  uint64_t v13 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  swift_release();
LABEL_15:
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for SymbolButton.Transition(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 81)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolButton.Transition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolButton.Transition()
{
  return &type metadata for SymbolButton.Transition;
}

void destroy for SymbolButton.Transition.View(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    swift_release();
  }
}

uint64_t initializeWithCopy for SymbolButton.Transition.View(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = (_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 24);
  id v8 = v4;
  if (v6)
  {
    uint64_t v9 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *v7;
  }
  return a1;
}

uint64_t assignWithCopy for SymbolButton.Transition.View(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a1 + 24);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v7;
  uint64_t v9 = *(void *)(a2 + 24);
  if (!v8)
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 32) = v11;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v9)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v10 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SymbolButton.Transition.View(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (!v6)
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = v8;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v7;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SymbolButton.Transition.View()
{
  return &type metadata for SymbolButton.Transition.View;
}

unint64_t sub_1005180A0()
{
  unint64_t result = qword_100678FB8;
  if (!qword_100678FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100678FB8);
  }
  return result;
}

void *sub_100518164(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1003D8D14(0, v1, 0);
    uint64_t v3 = (void *)(a1 + 56);
    do
    {
      uint64_t v4 = *(v3 - 3);
      uint64_t v5 = *(v3 - 2);
      char v6 = *((unsigned char *)v3 - 8);
      uint64_t v7 = *v3;
      sub_10003B338(v4, v5, v6);
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v9 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v8 >= v9 >> 1) {
        sub_1003D8D14((char *)(v9 > 1), v8 + 1, 1);
      }
      v3 += 6;
      _swiftEmptyArrayStorage[2] = v8 + 1;
      uint64_t v10 = &_swiftEmptyArrayStorage[4 * v8];
      v10[4] = v4;
      v10[5] = v5;
      *((unsigned char *)v10 + 48) = v6;
      v10[7] = v7;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

char *sub_100518264(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  long long v2 = (uint64_t *)(swift_bridgeObjectRetain() + 72);
  uint64_t v3 = (char *)_swiftEmptyArrayStorage;
  do
  {
    uint64_t v5 = *v2;
    if (*v2)
    {
      uint64_t v6 = *(v2 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_1003D774C(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v8 = *((void *)v3 + 2);
      unint64_t v7 = *((void *)v3 + 3);
      if (v8 >= v7 >> 1) {
        uint64_t v3 = sub_1003D774C((char *)(v7 > 1), v8 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v8 + 1;
      uint64_t v4 = &v3[16 * v8];
      *((void *)v4 + 4) = v6;
      *((void *)v4 + 5) = v5;
    }
    v2 += 6;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t TextArray.Element.init(text:accessibilityLabel:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(unsigned char *)(a7 + 16) = a3 & 1;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = a5;
  *(void *)(a7 + 40) = a6;
  return result;
}

uint64_t TextArray.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6 = a1;
  v56 = a4;
  unint64_t v7 = sub_100518164(a1);
  unint64_t v8 = sub_1003C7738();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1005325F0();
  uint64_t v11 = v9;
  v57 = (char *)v10;
  uint64_t v58 = v9;
  LODWORD(v54) = v12;
  char v59 = v12 & 1;
  uint64_t v60 = v13;
  uint64_t v14 = v7[2];
  if (v14)
  {
    v46[1] = v46;
    unint64_t v49 = v8;
    uint64_t v50 = a2;
    uint64_t v15 = v7[4];
    uint64_t v16 = v7[5];
    uint64_t v48 = v6;
    char v17 = *((unsigned char *)v7 + 48);
    uint64_t v51 = a3;
    uint64_t v18 = v7[7];
    v55 = 0;
    uint64_t v19 = v9;
    unint64_t v20 = (2 * v14) | 1;
    __chkstk_darwin();
    uint64_t v47 = v10;
    v45[2] = v21;
    sub_10003B338(v15, v16, v17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v11 = v19;
    uint64_t v22 = sub_100518720(v15, v16, v17, v18, (void (*)(uint64_t *__return_ptr, uint64_t *, void *))sub_1005189E8, (uint64_t)v45, (uint64_t)v7, (uint64_t)(v7 + 4), 1, v20);
    unint64_t v53 = v23;
    char v25 = v24;
    v55 = v26;
    swift_bridgeObjectRelease();
    int v52 = v25 & 1;
    char v27 = v17;
    uint64_t v10 = v47;
    uint64_t v6 = v48;
    sub_1000245D0(v15, v16, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = 0;
    int v52 = 0;
    v55 = _swiftEmptyArrayStorage;
    unint64_t v53 = 0xE000000000000000;
  }
  sub_1000245D0(v10, v11, v54 & 1);
  swift_bridgeObjectRelease();
  v57 = sub_100518264(v6);
  sub_10000BB04(&qword_100672798);
  sub_100400FFC();
  uint64_t v28 = sub_100534BA0();
  uint64_t v30 = v29;
  swift_bridgeObjectRelease();
  v57 = (char *)v28;
  uint64_t v58 = v30;
  uint64_t v31 = sub_1005325F0();
  uint64_t v33 = v32;
  char v35 = v34 & 1;
  uint64_t v36 = v53;
  char v37 = v52;
  uint64_t v51 = sub_100532530();
  uint64_t v39 = v38;
  char v41 = v40;
  uint64_t v54 = v42;
  sub_1000245D0(v22, v36, v37);
  swift_bridgeObjectRelease();
  sub_1000245D0(v31, v33, v35);
  uint64_t result = swift_bridgeObjectRelease();
  v44 = v56;
  uint64_t *v56 = v51;
  v44[1] = v39;
  *((unsigned char *)v44 + 16) = v41 & 1;
  v44[3] = v54;
  return result;
}

uint64_t sub_1005186A0@<X0>(uint64_t *a1@<X8>)
{
  return TextArray.body.getter(*v1, v1[1], v1[2], a1);
}

uint64_t TextArray.Element.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1003C7738();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1005325F0();
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v7;
  *(unsigned char *)(a3 + 16) = v8 & 1;
  *(void *)(a3 + 24) = v9;
  *(void *)(a3 + 32) = a1;
  *(void *)(a3 + 40) = a2;
  return result;
}

uint64_t sub_100518720(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(uint64_t *__return_ptr, uint64_t *, void *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  char v11 = a3;
  uint64_t v12 = a2;
  uint64_t v13 = a1;
  uint64_t v14 = a9;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  char v35 = a3 & 1;
  uint64_t v36 = a4;
  int64_t v15 = a10 >> 1;
  sub_10003B338(a1, a2, a3 & 1);
  if (a10 >> 1 == a9)
  {
    swift_bridgeObjectRetain();
    return v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = swift_unknownObjectRetain();
    uint64_t v17 = a8 + 32 * a9 + 16;
    while (v14 < v15)
    {
      char v18 = v11;
      uint64_t v24 = v12;
      uint64_t v19 = *(void *)(v17 - 16);
      uint64_t v20 = *(void *)(v17 - 8);
      char v21 = *(unsigned char *)v17;
      uint64_t v22 = *(void *)(v17 + 8);
      v30[0] = v19;
      v30[1] = v20;
      char v31 = v21;
      uint64_t v32 = v22;
      sub_10003B338(v19, v20, v21);
      swift_bridgeObjectRetain();
      a5(&v26, &v33, v30);
      if (v10)
      {
        sub_1000245D0(v19, v20, v21);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        sub_1000245D0(v13, v24, v18 & 1);
        swift_bridgeObjectRelease();
        return v13;
      }
      ++v14;
      sub_1000245D0(v19, v20, v21);
      swift_bridgeObjectRelease();
      sub_1000245D0(v13, v24, v18 & 1);
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v13 = v26;
      uint64_t v12 = v27;
      char v11 = v28;
      uint64_t v33 = v26;
      uint64_t v34 = v27;
      char v35 = v28;
      uint64_t v36 = v29;
      v17 += 32;
      int64_t v15 = a10 >> 1;
      if (a10 >> 1 == v14)
      {
        swift_unknownObjectRelease();
        return v13;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100518904@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100532550();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  uint64_t v7 = sub_100532550();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  sub_1000245D0(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_1005189E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100518904(a1);
}

uint64_t sub_100518A04()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_100518A24(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TextArray(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for TextArray(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for TextArray()
{
  return &type metadata for TextArray;
}

uint64_t destroy for TextArray.Element(uint64_t a1)
{
  sub_1000245D0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TextArray.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_10003B338(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TextArray.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_10003B338(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_1000245D0(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for TextArray.Element(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_1000245D0(v5, v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for TextArray.Element()
{
  return &type metadata for TextArray.Element;
}

void *sub_100518CF8()
{
  return &protocol witness table for Text;
}

uint64_t sub_100518D04(uint64_t a1, uint64_t a2)
{
  sub_100531DA0();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v6 - v4, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_100531DB0();
}

uint64_t sub_100518DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100531DA0();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v7 - v5, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_100531DB0();
}

uint64_t Text.with<A>(style:configurator:)@<X0>(int a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X7>, uint64_t a4@<X8>, uint64_t a5)
{
  uint64_t v20 = a2;
  uint64_t v21 = a4;
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin();
  char v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10051B90C(v11, v12, v10 & 1, v13, a1);
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  v20(v14);
  sub_10051A1B0((uint64_t)v9, a1, a5, v21);
  sub_1000245D0(v14, v16, v18);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a3);
}

uint64_t sub_10051903C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v98 = a4;
  uint64_t v97 = a2;
  uint64_t v95 = a1;
  uint64_t v101 = a3 & 1;
  uint64_t v96 = sub_10000BB04(&qword_100679048);
  __chkstk_darwin();
  v100 = (uint64_t *)((char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v92 = sub_10000BB04(&qword_100679050);
  __chkstk_darwin();
  char v10 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_10000BB04(&qword_100679058);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_10000BB04(&qword_100679020);
  __chkstk_darwin();
  v90 = (char *)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_10000BB04(&qword_100678FE0);
  __chkstk_darwin();
  v94 = (char *)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000BB04(&qword_100673428);
  __chkstk_darwin();
  char v17 = (uint64_t *)((char *)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000BB04(&qword_100673430);
  __chkstk_darwin();
  uint64_t v19 = (char *)&v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000BB04(&qword_100679040);
  __chkstk_darwin();
  uint64_t v22 = (char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BB04(&qword_100679030);
  __chkstk_darwin();
  uint64_t v24 = (char *)&v83 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin();
  switch(a5)
  {
    case 4:
    case 6:
      uint64_t v27 = sub_100532BE0();
      uint64_t v89 = v27;
      uint64_t KeyPath = swift_getKeyPath();
      v90 = (char *)KeyPath;
      uint64_t v29 = swift_getKeyPath();
      uint64_t v91 = a6;
      uint64_t v30 = v29;
      uint64_t v31 = swift_getKeyPath();
      uint64_t v88 = v31;
      uint64_t v32 = v95;
      uint64_t v33 = v97;
      uint64_t v34 = v101;
      sub_10003B338(v95, v97, v101);
      uint64_t v35 = v98;
      swift_bridgeObjectRetain();
      sub_10003B338(v32, v33, v34);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_1000245D0(v32, v33, v34);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v102 = v32;
      uint64_t v103 = v33;
      uint64_t v104 = v34;
      uint64_t v105 = v35;
      uint64_t v106 = KeyPath;
      uint64_t v107 = v27;
      uint64_t v108 = v30;
      long long v109 = xmmword_10053DF10;
      uint64_t v110 = v31;
      __int16 v111 = 257;
      sub_10003B338(v32, v33, v34);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v87 = sub_10000BB04(&qword_100679000);
      sub_10000BB04(&qword_100679010);
      sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
      sub_10051C28C();
      sub_100531DB0();
      char v36 = v117;
      char v37 = v118;
      long long v38 = v113;
      *(_OWORD *)char v10 = v112;
      *((_OWORD *)v10 + 1) = v38;
      long long v39 = v115;
      long long v40 = v116;
      *((_OWORD *)v10 + 2) = v114;
      *((_OWORD *)v10 + 3) = v39;
      *((_OWORD *)v10 + 4) = v40;
      v10[80] = v36;
      v10[81] = v37;
      swift_storeEnumTagMultiPayload();
      sub_10000BB04(&qword_100678FF0);
      sub_10051C160();
      sub_10051C338();
      uint64_t v41 = (uint64_t)v94;
      sub_100531DB0();
      sub_100013720(v41, (uint64_t)v100, &qword_100678FE0);
      swift_storeEnumTagMultiPayload();
      sub_10051C374(&qword_100678FD8, &qword_100678FE0, (void (*)(void))sub_10051C160, (void (*)(void))sub_10051C338);
      sub_100531DB0();
      sub_100013C44(v41, &qword_100678FE0);
      sub_1000245D0(v32, v33, v34);
      swift_release();
      goto LABEL_4;
    case 5:
      LODWORD(v86) = v101 != 0;
      uint64_t v88 = (uint64_t)&v83 - v26;
      uint64_t v87 = v25;
      uint64_t v84 = sub_100532BE0();
      uint64_t v83 = swift_getKeyPath();
      LODWORD(v85) = enum case for Text.Case.uppercase(_:);
      uint64_t v54 = sub_100532560();
      uint64_t v91 = a6;
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)(v54 - 8);
      (*(void (**)(char *, void, uint64_t))(v56 + 104))(v19, v85, v54);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v19, 0, 1, v55);
      uint64_t v57 = swift_getKeyPath();
      sub_100013720((uint64_t)v19, (uint64_t)v17 + *(int *)(v15 + 28), &qword_100673430);
      *char v17 = v57;
      sub_100013720((uint64_t)v17, (uint64_t)&v22[*(int *)(v20 + 36)], &qword_100673428);
      uint64_t v58 = v95;
      uint64_t v59 = v97;
      *(void *)uint64_t v22 = v95;
      *((void *)v22 + 1) = v59;
      v22[16] = (char)v86;
      v86 = v10;
      uint64_t v60 = v83;
      *((void *)v22 + 3) = v98;
      *((void *)v22 + 4) = v60;
      v85 = v12;
      *((void *)v22 + 5) = v84;
      LOBYTE(v57) = v101;
      sub_10003B338(v58, v59, v101);
      swift_bridgeObjectRetain();
      sub_10003B338(v58, v59, v57);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_100013C44((uint64_t)v17, &qword_100673428);
      sub_100013C44((uint64_t)v19, &qword_100673430);
      sub_1000245D0(v58, v59, v101);
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v61 = swift_getKeyPath();
      sub_100013720((uint64_t)v22, (uint64_t)v24, &qword_100679040);
      v62 = &v24[*(int *)(v87 + 36)];
      *(void *)v62 = v61;
      *((void *)v62 + 1) = 1;
      v62[16] = 0;
      sub_100013C44((uint64_t)v22, &qword_100679040);
      uint64_t v63 = v88;
      sub_10051C4C0((uint64_t)v24, v88);
      sub_100013720(v63, (uint64_t)v85, &qword_100679030);
      swift_storeEnumTagMultiPayload();
      sub_10000BB04(&qword_100676550);
      sub_10051C3FC();
      sub_1004A370C();
      uint64_t v64 = (uint64_t)v90;
      sub_100531DB0();
      sub_100013720(v64, (uint64_t)v86, &qword_100679020);
      swift_storeEnumTagMultiPayload();
      sub_10000BB04(&qword_100678FF0);
      sub_10051C160();
      sub_10051C338();
      uint64_t v65 = (uint64_t)v94;
      sub_100531DB0();
      sub_100013C44(v64, &qword_100679020);
      sub_100013720(v65, (uint64_t)v100, &qword_100678FE0);
      swift_storeEnumTagMultiPayload();
      sub_10000BB04(&qword_100679000);
      sub_10051C374(&qword_100678FD8, &qword_100678FE0, (void (*)(void))sub_10051C160, (void (*)(void))sub_10051C338);
      sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
      sub_100531DB0();
      sub_100013C44(v65, &qword_100678FE0);
      return sub_100013C44(v63, &qword_100679030);
    case 7:
      char v67 = v101;
      BOOL v68 = v101 != 0;
      uint64_t v69 = sub_100532BB0();
      uint64_t v70 = swift_getKeyPath();
      uint64_t v71 = v95;
      uint64_t v72 = v97;
      *(void *)uint64_t v12 = v95;
      *((void *)v12 + 1) = v72;
      v12[16] = v68;
      *((void *)v12 + 3) = v98;
      *((void *)v12 + 4) = v70;
      uint64_t v88 = v70;
      *((void *)v12 + 5) = v69;
      uint64_t v87 = v69;
      swift_storeEnumTagMultiPayload();
      sub_10003B338(v71, v72, v67);
      swift_bridgeObjectRetain();
      sub_10003B338(v71, v72, v67);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_10000BB04(&qword_100676550);
      sub_10051C3FC();
      uint64_t v91 = a6;
      sub_1004A370C();
      uint64_t v73 = (uint64_t)v90;
      sub_100531DB0();
      sub_100013720(v73, (uint64_t)v10, &qword_100679020);
      swift_storeEnumTagMultiPayload();
      sub_10000BB04(&qword_100678FF0);
      sub_10051C160();
      sub_10051C338();
      uint64_t v74 = (uint64_t)v94;
      sub_100531DB0();
      sub_100013C44(v73, &qword_100679020);
      sub_100013720(v74, (uint64_t)v100, &qword_100678FE0);
      swift_storeEnumTagMultiPayload();
      sub_10000BB04(&qword_100679000);
      sub_10051C374(&qword_100678FD8, &qword_100678FE0, (void (*)(void))sub_10051C160, (void (*)(void))sub_10051C338);
      sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
      sub_100531DB0();
      sub_100013C44(v74, &qword_100678FE0);
      sub_1000245D0(v71, v72, v101);
      swift_release();
      goto LABEL_7;
    case 8:
      char v75 = v101;
      BOOL v76 = v101 != 0;
      uint64_t v77 = sub_100532BB0();
      uint64_t v78 = swift_getKeyPath();
      uint64_t v79 = swift_getKeyPath();
      v80 = v100;
      uint64_t v81 = v95;
      uint64_t v82 = v97;
      void *v100 = v95;
      v80[1] = v82;
      *((unsigned char *)v80 + 16) = v76;
      v80[3] = v98;
      v80[4] = v78;
      v80[5] = v77;
      v80[6] = v79;
      v80[7] = 1;
      *((unsigned char *)v80 + 64) = 0;
      swift_storeEnumTagMultiPayload();
      sub_10003B338(v81, v82, v75);
      swift_bridgeObjectRetain();
      sub_10000BB04(&qword_100679000);
      sub_10051C374(&qword_100678FD8, &qword_100678FE0, (void (*)(void))sub_10051C160, (void (*)(void))sub_10051C338);
      sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
      return sub_100531DB0();
    default:
      uint64_t v42 = sub_100532BD0();
      uint64_t v43 = swift_getKeyPath();
      uint64_t v44 = swift_getKeyPath();
      uint64_t v45 = v95;
      uint64_t v102 = v95;
      uint64_t v46 = v97;
      uint64_t v103 = v97;
      char v47 = v101;
      uint64_t v104 = v101;
      uint64_t v105 = v98;
      uint64_t v106 = v43;
      v90 = (char *)v43;
      uint64_t v107 = v42;
      uint64_t v108 = v44;
      uint64_t v89 = v42;
      uint64_t v88 = v44;
      long long v109 = 1uLL;
      uint64_t v110 = 0;
      __int16 v111 = 0;
      sub_10003B338(v95, v97, v101);
      swift_bridgeObjectRetain();
      sub_10003B338(v45, v46, v47);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_10000BB04(&qword_100679000);
      uint64_t v91 = a6;
      sub_10000BB04(&qword_100679010);
      sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
      sub_10051C28C();
      sub_100531DB0();
      char v48 = v117;
      char v49 = v118;
      long long v50 = v113;
      *(_OWORD *)char v10 = v112;
      *((_OWORD *)v10 + 1) = v50;
      long long v51 = v115;
      long long v52 = v116;
      *((_OWORD *)v10 + 2) = v114;
      *((_OWORD *)v10 + 3) = v51;
      *((_OWORD *)v10 + 4) = v52;
      v10[80] = v48;
      v10[81] = v49;
      swift_storeEnumTagMultiPayload();
      sub_10000BB04(&qword_100678FF0);
      sub_10051C160();
      sub_10051C338();
      uint64_t v53 = (uint64_t)v94;
      sub_100531DB0();
      sub_100013720(v53, (uint64_t)v100, &qword_100678FE0);
      swift_storeEnumTagMultiPayload();
      sub_10051C374(&qword_100678FD8, &qword_100678FE0, (void (*)(void))sub_10051C160, (void (*)(void))sub_10051C338);
      sub_100531DB0();
      sub_100013C44(v53, &qword_100678FE0);
      sub_1000245D0(v45, v46, v47);
LABEL_4:
      swift_release();
      swift_release();
LABEL_7:
      swift_release();
      return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10051A1B0@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v178 = a3;
  LODWORD(v166) = a2;
  uint64_t v164 = a1;
  uint64_t v170 = a4;
  sub_100013BFC((uint64_t *)&unk_100675EC0);
  uint64_t v4 = sub_1005314B0();
  sub_100013BFC(&qword_100673428);
  uint64_t v5 = sub_1005314B0();
  sub_100013BFC(&qword_100673418);
  uint64_t v6 = sub_1005314B0();
  uint64_t v7 = sub_100531DC0();
  uint64_t v156 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v159 = (uint64_t)&v151 - v8;
  sub_10000BB04(&qword_100673430);
  __chkstk_darwin();
  char v10 = (char *)&v151 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = v5;
  uint64_t v154 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v153 = (char *)&v151 - v11;
  uint64_t v179 = v6;
  uint64_t v157 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v151 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  v155 = (char *)&v151 - v14;
  uint64_t v15 = sub_1005314B0();
  sub_100013BFC(&qword_100674410);
  uint64_t v167 = *(void *)(sub_1005314B0() - 8);
  __chkstk_darwin();
  char v17 = (char *)&v151 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  v161 = (char *)&v151 - v18;
  uint64_t v174 = v19;
  uint64_t v158 = *(void *)(sub_100531DC0() - 8);
  __chkstk_darwin();
  uint64_t v160 = (uint64_t)&v151 - v20;
  uint64_t v177 = v21;
  uint64_t v180 = v7;
  uint64_t v163 = *(void *)(sub_100531DC0() - 8);
  __chkstk_darwin();
  v162 = (char *)&v151 - v22;
  uint64_t v181 = v4;
  uint64_t v173 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v24 = (char *)&v151 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  uint64_t v26 = (char *)&v151 - v25;
  v171 = *(void (***)(char *, uint64_t))(v15 - 8);
  __chkstk_darwin();
  char v28 = (char *)&v151 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  uint64_t v30 = (char *)&v151 - v29;
  uint64_t v165 = v31;
  uint64_t v175 = v15;
  uint64_t v32 = sub_100531DC0();
  uint64_t v168 = *(void *)(v32 - 8);
  uint64_t v169 = v32;
  __chkstk_darwin();
  v176 = (char *)&v151 - v33;
  switch((char)v166)
  {
    case 4:
    case 6:
      sub_100532BE0();
      uint64_t v34 = v178;
      sub_1005327D0();
      swift_release();
      uint64_t v35 = sub_10051C038(&qword_100674FB8, (uint64_t *)&unk_100675EC0);
      uint64_t v212 = v34;
      uint64_t v213 = v35;
      uint64_t v36 = v181;
      uint64_t WitnessTable = swift_getWitnessTable();
      uint64_t v166 = WitnessTable;
      sub_100532A80();
      (*(void (**)(char *, uint64_t))(v173 + 8))(v26, v36);
      uint64_t v173 = sub_10051C038((unint64_t *)&qword_100673410, &qword_100673418);
      uint64_t v210 = WitnessTable;
      uint64_t v211 = v173;
      long long v38 = v171;
      uint64_t v39 = v175;
      uint64_t v40 = swift_getWitnessTable();
      sub_100532910();
      uint64_t v41 = v30;
      uint64_t v42 = v39;
      v38[1](v41, v39);
      uint64_t v43 = sub_10051C038(&qword_100674408, &qword_100674410);
      uint64_t v44 = v40;
      uint64_t v164 = v40;
      uint64_t v208 = v40;
      uint64_t v209 = v43;
      uint64_t v45 = v174;
      uint64_t v46 = swift_getWitnessTable();
      char v47 = v161;
      sub_10011BB48(v17, v45, v46);
      uint64_t v48 = v167 + 8;
      char v49 = *(void (**)(char *, uint64_t))(v167 + 8);
      v49(v17, v45);
      v171 = (void (**)(char *, uint64_t))v49;
      uint64_t v167 = v48;
      sub_10011BB48(v47, v45, v46);
      uint64_t v50 = (uint64_t)v17;
      uint64_t v51 = v160;
      sub_100518DFC(v50, v42, v45);
      v49((char *)v50, v45);
      uint64_t v206 = v44;
      uint64_t v207 = v46;
      uint64_t v52 = v177;
      uint64_t v53 = swift_getWitnessTable();
      uint64_t v54 = sub_10051C038(&qword_100673470, &qword_100673428);
      uint64_t v55 = v166;
      uint64_t v204 = v166;
      uint64_t v205 = v54;
      uint64_t v202 = swift_getWitnessTable();
      uint64_t v203 = v173;
      uint64_t v200 = swift_getWitnessTable();
      uint64_t v201 = v55;
      uint64_t v56 = swift_getWitnessTable();
      uint64_t v57 = (uint64_t)v162;
      sub_100518D04(v51, v52);
      (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v51, v52);
      uint64_t v198 = v53;
      uint64_t v199 = v56;
      uint64_t v58 = v165;
      swift_getWitnessTable();
      sub_100518D04(v57, v58);
      (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v57, v58);
      ((void (*)(char *, uint64_t))v171)(v161, v45);
      break;
    case 5:
      sub_100532BE0();
      uint64_t v76 = v178;
      sub_1005327D0();
      swift_release();
      uint64_t v77 = enum case for Text.Case.uppercase(_:);
      uint64_t v78 = sub_100532560();
      uint64_t v79 = *(void *)(v78 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v79 + 104))(v10, v77, v78);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v79 + 56))(v10, 0, 1, v78);
      uint64_t v80 = sub_10051C038(&qword_100674FB8, (uint64_t *)&unk_100675EC0);
      uint64_t v228 = v76;
      uint64_t v229 = v80;
      uint64_t v81 = v181;
      uint64_t v82 = swift_getWitnessTable();
      uint64_t v83 = v153;
      sub_100532A60();
      sub_100013C44((uint64_t)v10, &qword_100673430);
      (*(void (**)(char *, uint64_t))(v173 + 8))(v26, v81);
      uint64_t v84 = sub_10051C038(&qword_100673470, &qword_100673428);
      uint64_t v226 = v82;
      uint64_t v227 = v84;
      uint64_t v85 = v172;
      uint64_t v86 = swift_getWitnessTable();
      sub_100532A80();
      (*(void (**)(char *, uint64_t))(v154 + 8))(v83, v85);
      uint64_t v87 = sub_10051C038((unint64_t *)&qword_100673410, &qword_100673418);
      uint64_t v224 = v86;
      uint64_t v225 = v87;
      uint64_t v88 = v179;
      uint64_t v89 = swift_getWitnessTable();
      v90 = v155;
      sub_10011BB48(v13, v88, v89);
      uint64_t v92 = v157 + 8;
      uint64_t v91 = *(void (**)(char *, uint64_t))(v157 + 8);
      v91(v13, v88);
      uint64_t v173 = (uint64_t)v91;
      uint64_t v157 = v92;
      sub_10011BB48(v90, v88, v89);
      sub_100518D04((uint64_t)v13, v88);
      v91(v13, v88);
      uint64_t v222 = v82;
      uint64_t v223 = v87;
      uint64_t v93 = swift_getWitnessTable();
      v171 = (void (**)(char *, uint64_t))v93;
      uint64_t v94 = sub_10051C038(&qword_100674408, &qword_100674410);
      uint64_t v220 = v93;
      uint64_t v221 = v94;
      uint64_t v95 = swift_getWitnessTable();
      uint64_t v218 = v93;
      uint64_t v219 = v95;
      uint64_t v96 = v177;
      uint64_t v97 = swift_getWitnessTable();
      uint64_t v216 = v89;
      uint64_t v217 = v82;
      uint64_t v98 = v180;
      uint64_t v99 = swift_getWitnessTable();
      uint64_t v100 = (uint64_t)v162;
      uint64_t v101 = v159;
      sub_100518DFC(v159, v96, v98);
      (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v101, v98);
      uint64_t v214 = v97;
      uint64_t v215 = v99;
      uint64_t v102 = v165;
      swift_getWitnessTable();
      sub_100518D04(v100, v102);
      (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v100, v102);
      ((void (*)(char *, uint64_t))v173)(v155, v88);
      break;
    case 7:
      sub_100532BB0();
      uint64_t v103 = v178;
      sub_1005327D0();
      swift_release();
      uint64_t v104 = sub_10051C038(&qword_100674FB8, (uint64_t *)&unk_100675EC0);
      uint64_t v244 = v103;
      uint64_t v245 = v104;
      uint64_t v105 = v181;
      uint64_t v106 = swift_getWitnessTable();
      sub_10011BB48(v24, v105, v106);
      uint64_t v107 = *(void (**)(char *, uint64_t))(v173 + 8);
      v173 += 8;
      v107(v24, v105);
      uint64_t v108 = v107;
      v171 = (void (**)(char *, uint64_t))v107;
      sub_10011BB48(v26, v105, v106);
      uint64_t v109 = sub_10051C038(&qword_100673470, &qword_100673428);
      uint64_t v242 = v106;
      uint64_t v243 = v109;
      uint64_t v110 = swift_getWitnessTable();
      uint64_t v111 = sub_10051C038((unint64_t *)&qword_100673410, &qword_100673418);
      uint64_t v240 = v110;
      uint64_t v241 = v111;
      uint64_t v112 = v179;
      uint64_t v113 = swift_getWitnessTable();
      sub_100518DFC((uint64_t)v24, v112, v105);
      v108(v24, v105);
      uint64_t v238 = v106;
      uint64_t v239 = v111;
      uint64_t v114 = swift_getWitnessTable();
      uint64_t v167 = v114;
      uint64_t v115 = sub_10051C038(&qword_100674408, &qword_100674410);
      uint64_t v236 = v114;
      uint64_t v237 = v115;
      uint64_t v116 = swift_getWitnessTable();
      uint64_t v234 = v114;
      uint64_t v235 = v116;
      uint64_t v117 = v177;
      uint64_t v118 = swift_getWitnessTable();
      uint64_t v232 = v113;
      uint64_t v233 = v106;
      uint64_t v119 = v180;
      uint64_t v120 = swift_getWitnessTable();
      uint64_t v121 = (uint64_t)v162;
      uint64_t v122 = v159;
      sub_100518DFC(v159, v117, v119);
      (*(void (**)(uint64_t, uint64_t))(v156 + 8))(v122, v119);
      uint64_t v230 = v118;
      uint64_t v231 = v120;
      uint64_t v123 = v165;
      swift_getWitnessTable();
      sub_100518D04(v121, v123);
      (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v121, v123);
      ((void (*)(char *, uint64_t))v171)(v26, v105);
      break;
    case 8:
      sub_100532BB0();
      uint64_t v124 = v178;
      sub_1005327D0();
      swift_release();
      uint64_t v125 = sub_10051C038(&qword_100674FB8, (uint64_t *)&unk_100675EC0);
      uint64_t v278 = v124;
      uint64_t v279 = v125;
      uint64_t v126 = v181;
      uint64_t v127 = swift_getWitnessTable();
      sub_100532A80();
      (*(void (**)(char *, uint64_t))(v173 + 8))(v26, v126);
      uint64_t v167 = sub_10051C038((unint64_t *)&qword_100673410, &qword_100673418);
      uint64_t v276 = v127;
      uint64_t v277 = v167;
      uint64_t v128 = v175;
      uint64_t v129 = swift_getWitnessTable();
      v152 = v30;
      sub_10011BB48(v28, v128, v129);
      v130 = v171[1];
      ++v171;
      uint64_t v173 = (uint64_t)v130;
      v130(v28, v128);
      sub_10011BB48(v30, v128, v129);
      uint64_t v131 = sub_10051C038(&qword_100674408, &qword_100674410);
      uint64_t v274 = v129;
      uint64_t v275 = v131;
      uint64_t v132 = swift_getWitnessTable();
      uint64_t v272 = v129;
      uint64_t v273 = v132;
      uint64_t v133 = swift_getWitnessTable();
      uint64_t v134 = sub_10051C038(&qword_100673470, &qword_100673428);
      uint64_t v270 = v127;
      uint64_t v271 = v134;
      uint64_t v268 = swift_getWitnessTable();
      uint64_t v269 = v167;
      uint64_t v266 = swift_getWitnessTable();
      uint64_t v267 = v127;
      uint64_t v135 = swift_getWitnessTable();
      uint64_t v264 = v133;
      uint64_t v265 = v135;
      uint64_t v136 = v165;
      swift_getWitnessTable();
      sub_100518DFC((uint64_t)v28, v136, v128);
      v137 = (void (*)(char *, uint64_t))v173;
      ((void (*)(char *, uint64_t))v173)(v28, v128);
      v137(v152, v128);
      break;
    default:
      sub_100532BD0();
      uint64_t v59 = v178;
      sub_1005327D0();
      swift_release();
      uint64_t v60 = sub_10051C038(&qword_100674FB8, (uint64_t *)&unk_100675EC0);
      uint64_t v196 = v59;
      uint64_t v197 = v60;
      uint64_t v61 = v181;
      uint64_t v62 = swift_getWitnessTable();
      sub_100532A80();
      (*(void (**)(char *, uint64_t))(v173 + 8))(v26, v61);
      uint64_t v167 = sub_10051C038((unint64_t *)&qword_100673410, &qword_100673418);
      uint64_t v194 = v62;
      uint64_t v195 = v167;
      uint64_t v63 = v175;
      uint64_t v64 = swift_getWitnessTable();
      v152 = v30;
      sub_10011BB48(v28, v63, v64);
      uint64_t v65 = v171 + 1;
      v66 = v171[1];
      v66(v28, v63);
      v171 = v65;
      uint64_t v173 = (uint64_t)v66;
      sub_10011BB48(v30, v63, v64);
      uint64_t v67 = sub_10051C038(&qword_100674408, &qword_100674410);
      uint64_t v192 = v64;
      uint64_t v193 = v67;
      uint64_t v68 = swift_getWitnessTable();
      sub_100518D04((uint64_t)v28, v63);
      v66(v28, v63);
      uint64_t v190 = v64;
      uint64_t v191 = v68;
      uint64_t v69 = v177;
      uint64_t v166 = swift_getWitnessTable();
      uint64_t v70 = sub_10051C038(&qword_100673470, &qword_100673428);
      uint64_t v188 = v62;
      uint64_t v189 = v70;
      uint64_t v186 = swift_getWitnessTable();
      uint64_t v187 = v167;
      uint64_t v184 = swift_getWitnessTable();
      uint64_t v185 = v62;
      uint64_t v71 = swift_getWitnessTable();
      uint64_t v72 = (uint64_t)v162;
      uint64_t v73 = v160;
      uint64_t v74 = v166;
      sub_100518D04(v160, v69);
      (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v73, v69);
      uint64_t v182 = v74;
      uint64_t v183 = v71;
      uint64_t v75 = v165;
      swift_getWitnessTable();
      sub_100518D04(v72, v75);
      (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v72, v75);
      ((void (*)(char *, uint64_t))v173)(v152, v63);
      break;
  }
  uint64_t v138 = sub_10051C038(&qword_100674FB8, (uint64_t *)&unk_100675EC0);
  uint64_t v262 = v178;
  uint64_t v263 = v138;
  uint64_t v139 = swift_getWitnessTable();
  uint64_t v140 = sub_10051C038((unint64_t *)&qword_100673410, &qword_100673418);
  uint64_t v260 = v139;
  uint64_t v261 = v140;
  uint64_t v141 = swift_getWitnessTable();
  uint64_t v142 = sub_10051C038(&qword_100674408, &qword_100674410);
  uint64_t v258 = v141;
  uint64_t v259 = v142;
  uint64_t v143 = swift_getWitnessTable();
  uint64_t v256 = v141;
  uint64_t v257 = v143;
  uint64_t v144 = swift_getWitnessTable();
  uint64_t v145 = sub_10051C038(&qword_100673470, &qword_100673428);
  uint64_t v254 = v139;
  uint64_t v255 = v145;
  uint64_t v252 = swift_getWitnessTable();
  uint64_t v253 = v140;
  uint64_t v250 = swift_getWitnessTable();
  uint64_t v251 = v139;
  uint64_t v146 = swift_getWitnessTable();
  uint64_t v248 = v144;
  uint64_t v249 = v146;
  uint64_t v246 = swift_getWitnessTable();
  uint64_t v247 = v141;
  uint64_t v147 = v169;
  uint64_t v148 = swift_getWitnessTable();
  v149 = v176;
  sub_10011BB48(v176, v147, v148);
  return (*(uint64_t (**)(char *, uint64_t))(v168 + 8))(v149, v147);
}

uint64_t Text.with(style:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8 = sub_10051B90C(a2, a3, a4 & 1, a5, a1);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  sub_10003B338(v8, v9, v13 & 1);
  swift_bridgeObjectRetain();
  sub_10051903C(v8, v10, v14, v12, a1, a6);
  sub_1000245D0(v8, v10, v14);
  swift_bridgeObjectRelease();
  sub_1000245D0(v8, v10, v14);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10051B90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 2:
    case 4:
    case 6:
    case 7:
      sub_1005322E0();
      goto LABEL_6;
    case 5:
      sub_100532350();
      uint64_t v5 = sub_1005324B0();
      uint64_t v7 = v6;
      char v9 = v8 & 1;
      sub_1005323E0();
      uint64_t v10 = sub_100532580();
      swift_release();
      sub_1000245D0(v5, v7, v9);
      swift_bridgeObjectRelease();
      return v10;
    case 8:
      sub_1005323A0();
      goto LABEL_6;
    default:
      sub_100532390();
LABEL_6:
      uint64_t v10 = sub_100532580();
      swift_release();
      return v10;
  }
}

unint64_t sub_10051BA80()
{
  unint64_t result = qword_100678FC0;
  if (!qword_100678FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100678FC0);
  }
  return result;
}

uint64_t _s5StyleOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF8)
  {
    unsigned int v2 = a2 + 8;
    if (a2 + 8 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 8;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 8;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10051BB84);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 8;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 3) {
    unsigned int v8 = v7 - 2;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 7) {
    return v8 - 6;
  }
  else {
    return 0;
  }
}

unsigned char *_s5StyleOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 8;
  if (a3 + 8 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xF8) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v7 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x10051BC6CLL);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_10051BC94(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 3) {
    return v1 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *sub_10051BCA8(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Text.Style()
{
  return &type metadata for Text.Style;
}

unsigned char *_s9TitleKindOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10051BD94);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Text.TitleKind()
{
  return &type metadata for Text.TitleKind;
}

uint64_t sub_10051BDCC()
{
  return swift_getWitnessTable();
}

uint64_t sub_10051C038(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100013BFC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10051C08C()
{
  unint64_t result = qword_100678FC8;
  if (!qword_100678FC8)
  {
    sub_100013BFC(&qword_100678FD0);
    sub_10051C374(&qword_100678FD8, &qword_100678FE0, (void (*)(void))sub_10051C160, (void (*)(void))sub_10051C338);
    sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100678FC8);
  }
  return result;
}

unint64_t sub_10051C160()
{
  unint64_t result = qword_100678FE8;
  if (!qword_100678FE8)
  {
    sub_100013BFC(&qword_100678FF0);
    sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
    sub_10051C28C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100678FE8);
  }
  return result;
}

uint64_t sub_10051C1FC(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100013BFC(a2);
    sub_1004A370C();
    sub_10051C038(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10051C28C()
{
  unint64_t result = qword_100679008;
  if (!qword_100679008)
  {
    sub_100013BFC(&qword_100679010);
    sub_10051C1FC(&qword_100678FF8, &qword_100679000, (unint64_t *)&qword_100673410, &qword_100673418);
    sub_10051C038(&qword_100674408, &qword_100674410);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100679008);
  }
  return result;
}

uint64_t sub_10051C338()
{
  return sub_10051C374(&qword_100679018, &qword_100679020, (void (*)(void))sub_10051C3FC, (void (*)(void))sub_1004A370C);
}

uint64_t sub_10051C374(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100013BFC(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10051C3FC()
{
  unint64_t result = qword_100679028;
  if (!qword_100679028)
  {
    sub_100013BFC(&qword_100679030);
    sub_10051C1FC(&qword_100679038, &qword_100679040, &qword_100673470, &qword_100673428);
    sub_10051C038((unint64_t *)&qword_100673410, &qword_100673418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100679028);
  }
  return result;
}

uint64_t sub_10051C4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000BB04(&qword_100679030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t VerticalToggleSlider.packageDefinition.getter@<X0>(uint64_t *a1@<X8>)
{
  int v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  unsigned int v6 = (void *)v3[2];
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  uint64_t v14 = v3[9];
  uint64_t v13 = v3[8];
  uint64_t result = sub_10041A550(*v3, v5, v6);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = (uint64_t)v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v13;
  a1[9] = v14;
  return result;
}

void *VerticalToggleSlider.packageDefinition.setter(void *a1)
{
  int v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition);
  swift_beginAccess();
  sub_10041A4E8((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = v3[1];
  uint64_t v5 = (void *)v3[2];
  uint64_t v7 = *v3;
  sub_10041A4E8((uint64_t)a1, (uint64_t)v3);
  sub_10041A5E8(v8, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A550);
  sub_10041A5E8(a1, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A550);
  sub_10041A59C(v7, v4, v5);
  sub_100520540((uint64_t)v8);
  sub_10041A5E8(a1, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A59C);
  return sub_10041A5E8(v8, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A59C);
}

void (*VerticalToggleSlider.packageDefinition.modify(void *a1))(uint64_t *a1, char a2)
{
  int v3 = malloc(0x118uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition;
  v3[33] = v1;
  v3[34] = v4;
  uint64_t v5 = (uint64_t *)(v1 + v4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v8 = (void *)v5[2];
  uint64_t v9 = v5[3];
  uint64_t v10 = v5[4];
  uint64_t v11 = v5[5];
  uint64_t v12 = v5[6];
  uint64_t v13 = v5[7];
  uint64_t v14 = v5[8];
  uint64_t v15 = v5[9];
  v3[20] = *v5;
  v3[21] = v7;
  v3 += 20;
  v3[2] = v8;
  v3[3] = v9;
  v3[4] = v10;
  v3[5] = v11;
  v3[6] = v12;
  v3[7] = v13;
  v3[8] = v14;
  v3[9] = v15;
  sub_10041A550(v6, v7, v8);
  return sub_10051C7C4;
}

void sub_10051C7C4(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 160);
  uint64_t v5 = *(void *)(*a1 + 168);
  uint64_t v4 = *(void **)(*a1 + 176);
  uint64_t v7 = *(void *)(*a1 + 184);
  uint64_t v6 = *(void *)(*a1 + 192);
  uint64_t v9 = *(void *)(*a1 + 200);
  uint64_t v8 = *(void *)(*a1 + 208);
  uint64_t v10 = *(void *)(*a1 + 216);
  uint64_t v20 = *(void *)(*a1 + 224);
  uint64_t v21 = *(void *)(*a1 + 232);
  uint64_t v12 = *(void *)(*a1 + 264);
  uint64_t v11 = *(void *)(*a1 + 272);
  uint64_t v13 = (uint64_t *)(v12 + v11);
  if (a2)
  {
    sub_10041A4E8(v12 + v11, v2);
    uint64_t v18 = *v13;
    uint64_t v14 = (void *)v13[2];
    uint64_t v16 = v13[1];
    *uint64_t v13 = v3;
    v13[1] = v5;
    v13[2] = (uint64_t)v4;
    v13[3] = v7;
    v13[4] = v6;
    v13[5] = v9;
    v13[6] = v8;
    v13[7] = v10;
    v13[8] = v20;
    v13[9] = v21;
    sub_10041A550(v3, v5, v4);
    sub_10041A550(v3, v5, v4);
    sub_10041A5E8((void *)v2, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A550);
    sub_10041A59C(v18, v16, v14);
    sub_100520540(v2);
    sub_10041A59C(v3, v5, v4);
    sub_10041A5E8((void *)v2, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A59C);
    sub_10041A59C(*(void *)(v2 + 160), *(void *)(v2 + 168), *(void **)(v2 + 176));
  }
  else
  {
    sub_10041A4E8(v12 + v11, v2 + 80);
    uint64_t v19 = *v13;
    uint64_t v15 = (void *)v13[2];
    uint64_t v17 = v13[1];
    *uint64_t v13 = v3;
    v13[1] = v5;
    v13[2] = (uint64_t)v4;
    v13[3] = v7;
    v13[4] = v6;
    v13[5] = v9;
    v13[6] = v8;
    v13[7] = v10;
    v13[8] = v20;
    v13[9] = v21;
    sub_10041A5E8((void *)(v2 + 80), (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A550);
    sub_10041A550(v3, v5, v4);
    sub_10041A59C(v19, v17, v15);
    sub_100520540(v2 + 80);
    sub_10041A59C(v3, v5, v4);
    sub_10041A5E8((void *)(v2 + 80), (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A59C);
  }

  free((void *)v2);
}

BOOL VerticalToggleSlider.isOn.getter()
{
  return *(unsigned char *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) != 2;
}

void VerticalToggleSlider.isOn.setter(char a1)
{
  if (a1) {
    char v2 = 0;
  }
  else {
    char v2 = 2;
  }
  unsigned __int8 v3 = *(unsigned char *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) = v2;
  sub_100521544(v3);
}

void (*VerticalToggleSlider.isOn.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode;
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(v1 + v2) != 2;
  return sub_10051CB84;
}

void sub_10051CB84(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*((unsigned char *)a1 + 16)) {
    char v3 = 0;
  }
  else {
    char v3 = 2;
  }
  unsigned __int8 v4 = *(unsigned char *)(v2 + v1);
  *(unsigned char *)(v2 + v1) = v3;
  sub_100521544(v4);
}

void VerticalToggleSlider.value.getter()
{
  if (*(float *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue) > *(float *)(v0
                                                                                                 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue))
    __break(1u);
}

void VerticalToggleSlider.value.setter(float a1)
{
  float v2 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
  float v3 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
  if (v2 > v3)
  {
    __break(1u);
  }
  else
  {
    if (v2 > a1) {
      a1 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
    }
    if (v3 < a1) {
      a1 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
    }
    sub_10051E524(*(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange)+ (float)((float)((float)(a1 - v2) / (float)(v3 - v2))* (float)(*(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange + 4)- *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange))));
  }
}

void (*VerticalToggleSlider.value.modify(void (**a1)(float **a1, char a2)))(float **a1, char a2)
{
  uint64_t result = (void (*)(float **, char))malloc(0x28uLL);
  *a1 = result;
  uint64_t v4 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue;
  *(void *)uint64_t result = v1;
  *((void *)result + 1) = v4;
  float v5 = *(float *)(v1 + v4);
  uint64_t v6 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue;
  *((void *)result + 2) = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue;
  float v7 = *(float *)(v1 + v6);
  if (v5 > v7)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange;
    *((void *)result + 3) = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange;
    uint64_t v9 = (float *)(v1 + v8);
    float v10 = v9[1];
    float v11 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue);
    if (*v9 > v11) {
      float v11 = *v9;
    }
    if (v10 < v11) {
      float v11 = v9[1];
    }
    *((float *)result + 8) = v5 + (float)((float)(v7 - v5) * (float)((float)(v11 - *v9) / (float)(v10 - *v9)));
    return sub_10051CD4C;
  }
  return result;
}

void sub_10051CD4C(float **a1, char a2)
{
  float v2 = *a1;
  uint64_t v3 = *(void *)*a1;
  float v4 = *(float *)(v3 + *((void *)*a1 + 1));
  float v5 = *(float *)(v3 + *((void *)*a1 + 2));
  if (a2)
  {
    if (v4 <= v5) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if (v4 > v5)
  {
    __break(1u);
    return;
  }
LABEL_5:
  float v6 = v2[8];
  if (v4 > v6) {
    float v6 = v4;
  }
  if (v5 < v6) {
    float v6 = v5;
  }
  sub_10051E524(*(float *)(v3 + *((void *)v2 + 3))+ (float)((float)(*(float *)(v3 + *((void *)v2 + 3) + 4) - *(float *)(v3 + *((void *)v2 + 3)))* (float)((float)(v6 - v4) / (float)(v5 - v4))));

  free(v2);
}

float VerticalToggleSlider.minValue.getter()
{
  return *(float *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
}

void VerticalToggleSlider.minValue.setter(float a1)
{
  if (*(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue) <= a1)
  {
    v6[1] = 0xE000000000000000;
    sub_1005361C0(145);
    v7._object = (void *)0x800000010056AC70;
    v7._countAndFlagsBits = 0xD000000000000042;
    sub_100534E80(v7);
    sub_100535470();
    v8._countAndFlagsBits = 3026478;
    v8._object = (void *)0xE300000000000000;
    sub_100534E80(v8);
    sub_100535470();
    v9._countAndFlagsBits = 0xD000000000000048;
    v9._object = (void *)0x800000010056ACC0;
    sub_100534E80(v9);
    if (qword_1006703D0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_100530920();
    sub_10000EA90(v2, (uint64_t)qword_10067B560);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100530900();
    os_log_type_t v4 = sub_1005357D0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      v6[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v5 + 4) = sub_1003C5E90(0, 0xE000000000000000, v6);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s", (uint8_t *)v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue) = a1;
  }
}

void (*VerticalToggleSlider.minValue.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
  return sub_10051D07C;
}

void sub_10051D07C(uint64_t a1)
{
}

float VerticalToggleSlider.maxValue.getter()
{
  return *(float *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
}

void VerticalToggleSlider.maxValue.setter(float a1)
{
  if (*(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue) >= a1)
  {
    v6[1] = 0xE000000000000000;
    sub_1005361C0(145);
    v7._object = (void *)0x800000010056AC70;
    v7._countAndFlagsBits = 0xD000000000000042;
    sub_100534E80(v7);
    sub_100535470();
    v8._countAndFlagsBits = 3026478;
    v8._object = (void *)0xE300000000000000;
    sub_100534E80(v8);
    sub_100535470();
    v9._countAndFlagsBits = 0xD000000000000048;
    v9._object = (void *)0x800000010056ACC0;
    sub_100534E80(v9);
    if (qword_1006703D0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_100530920();
    sub_10000EA90(v2, (uint64_t)qword_10067B560);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100530900();
    os_log_type_t v4 = sub_1005357D0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      v6[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v5 + 4) = sub_1003C5E90(0, 0xE000000000000000, v6);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s", (uint8_t *)v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue) = a1;
  }
}

void (*VerticalToggleSlider.maxValue.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
  return sub_10051D33C;
}

void sub_10051D33C(uint64_t a1)
{
}

void VerticalToggleSlider.valueRange.getter()
{
  if (*(float *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue) > *(float *)(v0
                                                                                                 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue))
    __break(1u);
}

void VerticalToggleSlider.valueRange.setter(float a1, float a2)
{
  if (a1 >= a2)
  {
    v7[1] = 0xE000000000000000;
    sub_1005361C0(164);
    v8._object = (void *)0x800000010056AC70;
    v8._countAndFlagsBits = 0xD000000000000042;
    sub_100534E80(v8);
    sub_100535470();
    v9._countAndFlagsBits = 3026478;
    v9._object = (void *)0xE300000000000000;
    sub_100534E80(v9);
    sub_100535470();
    v10._countAndFlagsBits = 0xD00000000000005BLL;
    v10._object = (void *)0x800000010056AD10;
    sub_100534E80(v10);
    if (qword_1006703D0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100530920();
    sub_10000EA90(v3, (uint64_t)qword_10067B560);
    swift_bridgeObjectRetain();
    os_log_type_t v4 = sub_100530900();
    os_log_type_t v5 = sub_1005357D0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      v7[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v6 + 4) = sub_1003C5E90(0, 0xE000000000000000, v7);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s", (uint8_t *)v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    *(float *)(v2 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue) = a1;
    *(float *)(v2 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue) = a2;
  }
}

void (*VerticalToggleSlider.valueRange.modify(void (*result)(uint64_t a1)))(uint64_t a1)
{
  *(void *)uint64_t result = v1;
  float v2 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
  float v3 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
  if (v2 > v3)
  {
    __break(1u);
  }
  else
  {
    *((float *)result + 2) = v2;
    *((float *)result + 3) = v3;
    return sub_10051D630;
  }
  return result;
}

void sub_10051D630(uint64_t a1)
{
}

float VerticalToggleSlider.minLevelOffsetRatio.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_minLevelOffsetRatio;
  swift_beginAccess();
  return *(float *)v1;
}

void VerticalToggleSlider.minLevelOffsetRatio.setter(float a1)
{
  float v3 = (float *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_minLevelOffsetRatio];
  swift_beginAccess();
  float v4 = *v3;
  *float v3 = a1;
  if (v4 != a1)
  {
    sub_10051F17C(0x100000000);
    id v5 = sub_10051EB24();
    int v6 = v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
    id v7 = [v1 traitCollection];
    Swift::String v8 = v7;
    if (v6 == 2)
    {

      double v9 = 0.0;
    }
    else if (v6)
    {

      double v9 = 1.0;
    }
    else
    {
      id v10 = [v7 accessibilityContrast];

      double v9 = 0.5;
      if (v10 == (id)1) {
        double v9 = 1.0;
      }
    }
    [v5 setAlpha:v9];
  }
}

void (*VerticalToggleSlider.minLevelOffsetRatio.modify(void *a1))(uint64_t a1, char a2)
{
  float v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_minLevelOffsetRatio;
  v3[3] = v1;
  v3[4] = v4;
  id v5 = (_DWORD *)(v1 + v4);
  swift_beginAccess();
  *((_DWORD *)v3 + 10) = *v5;
  return sub_10051D82C;
}

void sub_10051D82C(uint64_t a1, char a2)
{
  float v2 = *(void **)a1;
  float v3 = *(float *)(*(void *)a1 + 40);
  if (a2)
  {
    VerticalToggleSlider.minLevelOffsetRatio.setter(v3);
  }
  else
  {
    uint64_t v5 = v2[3];
    uint64_t v4 = v2[4];
    float v6 = *(float *)(v5 + v4);
    *(float *)(v5 + v4) = v3;
    if (v3 != v6)
    {
      id v7 = (unsigned __int8 *)v2[3];
      sub_10051F17C(0x100000000);
      id v8 = sub_10051EB24();
      int v9 = v7[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
      id v10 = [v7 traitCollection];
      float v11 = v10;
      if (v9 == 2)
      {

        double v12 = 0.0;
      }
      else if (v9)
      {

        double v12 = 1.0;
      }
      else
      {
        id v13 = [v10 accessibilityContrast];

        double v12 = 0.5;
        if (v13 == (id)1) {
          double v12 = 1.0;
        }
      }
      [v8 setAlpha:v12];
    }
  }

  free(v2);
}

uint64_t VerticalToggleSlider.interactionScaleFactor.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t VerticalToggleSlider.interactionScaleFactor.setter(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*VerticalToggleSlider.interactionScaleFactor.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t VerticalToggleSlider.isTapToToggleEnabled.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isTapToToggleEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t VerticalToggleSlider.isTapToToggleEnabled.setter(char a1)
{
  float v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isTapToToggleEnabled);
  uint64_t result = swift_beginAccess();
  *float v3 = a1;
  return result;
}

uint64_t (*VerticalToggleSlider.isTapToToggleEnabled.modify())()
{
  return j__swift_endAccess;
}

uint64_t VerticalToggleSlider.isVisuallyDisabled.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isVisuallyDisabled);
  swift_beginAccess();
  return *v1;
}

void VerticalToggleSlider.isVisuallyDisabled.setter(char a1)
{
  int v3 = a1 & 1;
  uint64_t v4 = &v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isVisuallyDisabled];
  swift_beginAccess();
  int v5 = *v4;
  *uint64_t v4 = a1;
  if (v5 != v3)
  {
    if (a1) {
      unsigned int v6 = 1;
    }
    else {
      unsigned int v6 = [v1 isEnabled] ^ 1;
    }
    id v7 = *(void **)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
    if (v7)
    {
      double v8 = 0.4;
      if (!v6) {
        double v8 = 1.0;
      }
      [v7 setAlpha:v8];
    }
    id v9 = sub_10051E9E4();
    id v10 = v9;
    double v11 = 1.0;
    if (v6) {
      double v11 = 0.5;
    }
    [v9 setAlpha:v11];
  }
}

void (*VerticalToggleSlider.isVisuallyDisabled.modify(void *a1))(uint64_t *a1, char a2)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isVisuallyDisabled;
  v3[3] = v1;
  v3[4] = v4;
  int v5 = (unsigned char *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 40) = *v5;
  return sub_10051DCE4;
}

void sub_10051DCE4(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  int v3 = *(unsigned __int8 *)(*a1 + 40);
  if (a2)
  {
    VerticalToggleSlider.isVisuallyDisabled.setter(v3);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 24);
    uint64_t v4 = *(void *)(v2 + 32);
    int v6 = *(unsigned __int8 *)(v5 + v4);
    *(unsigned char *)(v5 + v4) = v3;
    if (v3 != v6)
    {
      if (v3) {
        unsigned int v7 = 1;
      }
      else {
        unsigned int v7 = [*(id *)(v2 + 24) isEnabled] ^ 1;
      }
      double v8 = *(void **)(*(void *)(v2 + 24) + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView);
      if (v8)
      {
        double v9 = 0.4;
        if (!v7) {
          double v9 = 1.0;
        }
        [v8 setAlpha:v9];
      }
      id v10 = sub_10051E9E4();
      double v11 = v10;
      double v12 = 1.0;
      if (v7) {
        double v12 = 0.5;
      }
      [v10 setAlpha:v12];
    }
  }

  free((void *)v2);
}

uint64_t VerticalToggleSlider.isContinuous.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isContinuous);
  swift_beginAccess();
  return *v1;
}

uint64_t VerticalToggleSlider.isContinuous.setter(char a1)
{
  int v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isContinuous);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*VerticalToggleSlider.isContinuous.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t VerticalToggleSlider.accessibilityAutomaticallyDisablesOnMaxValue.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue);
  swift_beginAccess();
  return *v1;
}

uint64_t VerticalToggleSlider.automaticallyDisablesOnMaxValue.setter(char a1)
{
  int v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*VerticalToggleSlider.automaticallyDisablesOnMaxValue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t VerticalToggleSlider.longPressMode.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressMode);
  swift_beginAccess();
  return *v1;
}

void VerticalToggleSlider.longPressMode.setter(unsigned __int8 a1)
{
  int v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressMode);
  swift_beginAccess();
  int v4 = *v3;
  *int v3 = a1;
  if (v4 != a1) {
    sub_10051FDBC();
  }
}

void (*VerticalToggleSlider.longPressMode.modify(void *a1))(uint64_t a1)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressMode;
  v3[3] = v1;
  v3[4] = v4;
  uint64_t v5 = (unsigned char *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 40) = *v5;
  return sub_10051E0D0;
}

void sub_10051E0D0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  int v2 = *(unsigned __int8 *)(*(void *)a1 + 40);
  uint64_t v4 = *(void *)(*(void *)a1 + 24);
  uint64_t v3 = *(void *)(*(void *)a1 + 32);
  int v5 = *(unsigned __int8 *)(v4 + v3);
  *(unsigned char *)(v4 + v3) = v2;
  if (v2 != v5) {
    sub_10051FDBC();
  }

  free(v1);
}

uint64_t VerticalToggleSlider.isBeingInteractedWith.getter()
{
  return *(unsigned char *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) & 1;
}

uint64_t VerticalToggleSlider.growAnchorPoint.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growAnchorPoint);
  swift_beginAccess();
  return *v1;
}

void VerticalToggleSlider.growAnchorPoint.setter(char a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growAnchorPoint];
  swift_beginAccess();
  *uint64_t v3 = a1;
  id v4 = sub_10051E468();
  uint64_t v5 = *v3;
  id v6 = [v1 traitCollection];
  *(void *)&double v7 = sub_100520928(v6, v5).n128_u64[0];
  double v9 = v8;

  [v4 setAnchorPoint:v7, v9];
  id v10 = sub_10051E468();
  [v1 bounds];
  [v10 setFrame:];
}

void (*VerticalToggleSlider.growAnchorPoint.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growAnchorPoint;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_10051E2D0;
}

void sub_10051E2D0(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (unsigned __int8 *)v3[3];
    uint64_t v5 = v3[4];
    id v6 = sub_10051E468();
    uint64_t v7 = v4[v5];
    id v8 = [v4 traitCollection];
    *(void *)&double v9 = sub_100520928(v8, v7).n128_u64[0];
    double v11 = v10;

    [v6 setAnchorPoint:v9, v11];
    id v12 = sub_10051E468();
    [v4 bounds];
    [v12 setFrame:];
  }

  free(v3);
}

id sub_10051E3B4()
{
  uint64_t v1 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___stretchView;
  int v2 = *(void **)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___stretchView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___stretchView];
  }
  else
  {
    [v0 bounds];
    id v8 = [objc_allocWithZone((Class)UIView) initWithFrame:v4, v5, v6, v7];
    double v9 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v8;
    id v3 = v8;

    int v2 = 0;
  }
  id v10 = v2;
  return v3;
}

id sub_10051E468()
{
  uint64_t v1 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___growView;
  int v2 = *(void **)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___growView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___growView);
  }
  else
  {
    id v4 = sub_10051E3B4();
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = [objc_allocWithZone((Class)UIView) initWithFrame:v6, v8, v10, v12];
    uint64_t v14 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v13;
    id v3 = v13;

    int v2 = 0;
  }
  id v15 = v2;
  return v3;
}

void sub_10051E524(float a1)
{
  float v2 = *(float *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue];
  *(float *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue] = a1;
  if (v2 != a1)
  {
    uint64_t v3 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode;
    if ((v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] & 1) == 0)
    {
      sub_10051F17C(0x100000000);
      id v9 = sub_10051EB24();
      int v4 = v1[v3];
      id v5 = [v1 traitCollection];
      double v6 = v5;
      if (v4 == 2)
      {

        double v7 = 0.0;
      }
      else if (v4)
      {

        double v7 = 1.0;
      }
      else
      {
        id v8 = [v5 accessibilityContrast];

        double v7 = 0.5;
        if (v8 == (id)1) {
          double v7 = 1.0;
        }
      }
      [v9 setAlpha:v7];
    }
  }
}

id sub_10051E638()
{
  uint64_t v1 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___feedbackGenerator;
  float v2 = *(void **)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___feedbackGenerator);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___feedbackGenerator);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)_UIButtonFeedbackGenerator) initWithStyle:1];
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    float v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_10051E6B0()
{
  id v1 = [v0 traitCollection];
  id v2 = [v1 accessibilityContrast];

  id v3 = sub_10051E9E4();
  id v4 = [v3 contentView];

  id v5 = [v4 layer];
  if (v2 != (id)1)
  {
    [v5 setCompositingFilter:kCAFilterPlusL];

    id v12 = sub_10051E9E4();
    id v13 = [v12 contentView];

    uint64_t v14 = self;
    id v15 = [v14 whiteColor];
    id v16 = [v15 colorWithAlphaComponent:0.18];

    [v13 setBackgroundColor:v16];
    id v17 = sub_10051EB24();
    id v18 = [v14 whiteColor];
    [v17 setBackgroundColor:v18];
LABEL_8:

    sub_10051F974();
    return;
  }
  [v5 setCompositingFilter:0];

  int v6 = v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
  id v7 = sub_10051E9E4();
  id v8 = [v7 contentView];

  if (v6 != 2)
  {
    id v19 = objc_allocWithZone((Class)UIColor);
    v22[4] = sub_1005214A8;
    v22[5] = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 1107296256;
    v22[2] = sub_100042F08;
    v22[3] = &unk_10063CF80;
    uint64_t v20 = _Block_copy(v22);
    id v21 = [v19 initWithDynamicProvider:v20];
    _Block_release(v20);
    swift_release();
    [v8 setBackgroundColor:v21];

    goto LABEL_7;
  }
  id v9 = [v0 tintColor];
  if (v9)
  {
    double v10 = v9;
    id v11 = [v9 colorWithAlphaComponent:0.2];

    [v8 setBackgroundColor:v11];
LABEL_7:
    id v18 = sub_10051EB24();
    id v17 = [v0 tintColor];
    [v18 setBackgroundColor:v17];
    goto LABEL_8;
  }
  __break(1u);
}

id sub_10051E9E4()
{
  uint64_t v1 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___visualEffectView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___visualEffectView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___visualEffectView);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:*(void *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_blurEffect)];
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_10051EA68(void *a1)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView);
  *(void *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView) = a1;
  id v7 = a1;
  if (a1)
  {
    if (!v3) {
      goto LABEL_8;
    }
    type metadata accessor for CoreAnimationPackageView();
    id v4 = v3;
    id v5 = v7;
    char v6 = sub_100535D90();

    if (v6) {
      goto LABEL_7;
    }
  }
  else if (!v3)
  {
    goto LABEL_8;
  }
  [v3 removeFromSuperview];
  id v4 = v3;
LABEL_7:

LABEL_8:
}

id sub_10051EB24()
{
  uint64_t v1 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___levelView;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___levelView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___levelView);
  }
  else
  {
    id v4 = sub_10051E9E4();
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = [objc_allocWithZone((Class)UIView) initWithFrame:v6, v8, v10, v12];
    uint64_t v14 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v13;
    id v3 = v13;

    id v2 = 0;
  }
  id v15 = v2;
  return v3;
}

void sub_10051EBE0()
{
  sub_10000BB04(&qword_100678A80);
  __chkstk_darwin();
  id v2 = &v62[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  [v0 setClipsToBounds:0];
  id v3 = sub_10051E468();
  [v3 setUserInteractionEnabled:0];

  id v4 = sub_10051E468();
  [v4 setAutoresizingMask:18];

  id v5 = sub_10051E468();
  double v6 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growAnchorPoint];
  swift_beginAccess();
  uint64_t v7 = *v6;
  id v8 = [v0 traitCollection];
  *(void *)&double v9 = sub_100520928(v8, v7).n128_u64[0];
  double v11 = v10;

  [v5 setAnchorPoint:v9, v11];
  id v12 = sub_10051E468();
  [v0 bounds];
  [v12 setFrame:];

  id v13 = sub_10051E468();
  [v0 addSubview:v13];

  id v14 = sub_10051E3B4();
  [v14 setClipsToBounds:1];

  id v15 = sub_10051E3B4();
  [v15 setUserInteractionEnabled:0];

  id v16 = sub_10051E3B4();
  [v16 setAutoresizingMask:18];

  id v17 = sub_10051E3B4();
  id v18 = sub_10051E468();
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  [v17 setFrame:v20, v22, v24, v26];
  id v27 = sub_10051E468();
  id v28 = sub_10051E3B4();
  [v27 addSubview:v28];

  id v29 = sub_10051E9E4();
  [v29 setUserInteractionEnabled:0];

  id v30 = sub_10051E9E4();
  [v30 setClipsToBounds:0];

  id v31 = sub_10051E9E4();
  [v31 setAutoresizingMask:18];

  id v32 = sub_10051E9E4();
  id v33 = sub_10051E3B4();
  [v33 bounds];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  [v32 setFrame:v35, v37, v39, v41];
  id v42 = sub_10051E9E4();
  id v43 = [v42 contentView];

  id v44 = [v43 layer];
  [v44 setCompositingFilter:kCAFilterPlusL];

  id v45 = sub_10051E3B4();
  id v46 = sub_10051E9E4();
  [v45 addSubview:v46];

  id v47 = sub_10051EB24();
  [v47 setUserInteractionEnabled:0];

  id v48 = sub_10051EB24();
  NSString v49 = sub_100534CA0();
  [v48 setAccessibilityIdentifier:v49];

  id v50 = sub_10051EB24();
  [v50 setAutoresizingMask:26];

  id v51 = sub_10051E9E4();
  id v52 = [v51 contentView];

  id v53 = sub_10051EB24();
  [v52 addSubview:v53];

  v62[4] = 1;
  sub_10051F17C(0x100000000);
  id v54 = sub_10051EB24();
  int v55 = v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
  id v56 = [v0 traitCollection];
  uint64_t v57 = v56;
  if (v55 == 2)
  {

    double v58 = 0.0;
  }
  else if (v55)
  {

    double v58 = 1.0;
  }
  else
  {
    id v59 = [v56 accessibilityContrast];

    double v58 = 0.5;
    if (v59 == (id)1) {
      double v58 = 1.0;
    }
  }
  [v54 setAlpha:v58];

  sub_10051E6B0();
  sub_10051F3D4();
  id v60 = sub_10051E3B4();
  if (qword_100670868 != -1) {
    swift_once();
  }
  sub_100535C70();
  uint64_t v61 = sub_100535CE0();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v2, 0, 1, v61);
  sub_100535CF0();
}

void sub_10051F17C(uint64_t a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) == 2)
  {
    id v57 = sub_10051EB24();
    id v2 = sub_10051E9E4();
    [v2 bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    [v57 setFrame:v4, v6, v8, v10];
  }
  else
  {
    id v12 = sub_10051E9E4();
    [v12 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v59.origin.x = v14;
    v59.origin.y = v16;
    v59.size.width = v18;
    v59.size.height = v20;
    double Height = CGRectGetHeight(v59);
    double v22 = (float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_minLevelOffsetRatio);
    swift_beginAccess();
    double v23 = Height * *v22;
    id v24 = sub_10051E9E4();
    [v24 bounds];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v60.origin.x = v26;
    v60.origin.y = v28;
    v60.size.width = v30;
    v60.size.height = v32;
    double v33 = CGRectGetHeight(v60);
    if ((a1 & 0x100000000) != 0) {
      float v34 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue);
    }
    else {
      float v34 = *(float *)&a1;
    }
    double v35 = v23 + (v33 - v23) * v34;
    id v36 = sub_10051E9E4();
    [v36 bounds];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    v61.origin.x = v38;
    v61.origin.y = v40;
    v61.size.width = v42;
    v61.size.height = v44;
    double v45 = CGRectGetHeight(v61) - v35;
    if (v45 < 0.0) {
      double v46 = 0.0;
    }
    else {
      double v46 = v45;
    }
    id v47 = sub_10051EB24();
    id v48 = sub_10051E9E4();
    [v48 bounds];
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;

    v62.origin.x = v50;
    v62.origin.y = v52;
    v62.size.width = v54;
    v62.size.height = v56;
    [v47 setFrame:CGRectMake(0.0, v46, CGRectGetWidth(v62), v35)];
  }
}

void sub_10051F3D4()
{
  uint64_t v1 = v0;
  id v2 = (uint64_t *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition];
  swift_beginAccess();
  uint64_t v3 = v2[1];
  if (v3)
  {
    double v4 = (void *)v2[2];
    uint64_t v5 = v2[4];
    uint64_t v6 = v2[5];
    uint64_t v8 = v2[6];
    uint64_t v7 = v2[7];
    uint64_t v10 = v2[8];
    uint64_t v9 = v2[9];
    uint64_t v51 = v2[3];
    uint64_t v52 = *v2;
    *(void *)&long long v53 = *v2;
    *((void *)&v53 + 1) = v3;
    CGFloat v54 = v4;
    uint64_t v55 = v51;
    uint64_t v56 = v5;
    uint64_t v57 = v6;
    uint64_t v58 = v8;
    uint64_t v59 = v7;
    uint64_t v60 = v10;
    uint64_t v61 = v9;
    double v11 = *(void **)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
    if (v11)
    {
      id v12 = v11;
      sub_10041A550(v52, v3, v4);
      CoreAnimationPackageView.reset()();
    }
    else
    {
      id v13 = objc_allocWithZone((Class)type metadata accessor for CoreAnimationPackageView());
      swift_bridgeObjectRetain_n();
      id v14 = v4;
      swift_bridgeObjectRetain_n();
      id v15 = v14;
      id v16 = CoreAnimationPackageView.init(definition:)(&v53);
      id v17 = UIView.forAutolayout.getter();

      id v12 = (char *)v17;
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
      sub_10051EA68(v12);
      id v18 = sub_10051E9E4();
      id v19 = [v18 contentView];

      [v19 addSubview:v12];
      sub_10000BB04(&qword_100671AE0);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_10053DFE0;
      CGFloat v50 = v4;
      id v21 = [v12 topAnchor];
      id v22 = sub_10051E9E4();
      id v23 = [v22 topAnchor];

      id v24 = [v21 constraintGreaterThanOrEqualToAnchor:v23];
      *(void *)(v20 + 32) = v24;
      id v25 = [v12 leadingAnchor];
      id v26 = sub_10051E9E4();
      id v27 = [v26 leadingAnchor];

      id v28 = [v25 constraintEqualToAnchor:v27];
      *(void *)(v20 + 40) = v28;
      id v29 = [v12 trailingAnchor];
      id v30 = sub_10051E9E4();
      id v31 = [v30 trailingAnchor];

      id v32 = [v29 constraintEqualToAnchor:v31];
      *(void *)(v20 + 48) = v32;
      id v33 = [v12 bottomAnchor];
      id v34 = sub_10051E9E4();
      id v35 = [v34 bottomAnchor];

      id v36 = [v33 constraintEqualToAnchor:v35];
      *(void *)(v20 + 56) = v36;
      id v37 = [v12 heightAnchor];
      id v38 = [v12 widthAnchor];

      id v39 = [v37 constraintEqualToAnchor:v38];
      *(void *)(v20 + 64) = v39;
      double v4 = v50;
      sub_100535100();
      Array<A>.activate()(v20);
      swift_bridgeObjectRelease();
    }
    CGFloat v40 = (uint64_t *)&v12[OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_stateName];
    if (v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] == 2)
    {
      swift_beginAccess();
      uint64_t v41 = *v40;
      uint64_t v42 = v40[1];
      *(_OWORD *)CGFloat v40 = xmmword_10054DEE0;
      double v43 = v12;
      sub_1003BDFD8(v41, v42);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_beginAccess();
      uint64_t v44 = *v40;
      uint64_t v45 = v40[1];
      *(_OWORD *)CGFloat v40 = xmmword_10054DED0;
      sub_1003BDFD8(v44, v45);
      swift_bridgeObjectRelease();
      sub_100123DA4(0, (unint64_t *)&qword_1006708E0);
      double v46 = (void *)sub_100535960();
      uint64_t v47 = swift_allocObject();
      *(void *)(v47 + 16) = v1;
      *(void *)(v47 + 24) = v12;
      id v48 = v1;
      double v43 = v12;
      double v49 = v12;
      OS_dispatch_queue.asyncAfter(_:block:)((uint64_t)sub_100525EF4, v47);

      swift_release();
    }
    sub_10051F974();

    sub_10041A59C(v52, v3, v4);
  }
  else
  {
    sub_10051EA68(0);
  }
}

void sub_10051F974()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
  if (v1)
  {
    int v2 = v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
    uint64_t v3 = v1;
    Class v4 = v3;
    if (v2 != 2)
    {
      id v12 = [v0 traitCollection];
      id v13 = [v12 accessibilityContrast];

      if (v13 == (id)1)
      {
        id v14 = [self whiteColor];
        id v15 = (void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_foregroundColor);
        swift_beginAccess();
        id v16 = *v15;
        *id v15 = v14;
        Class v17 = (Class)v14;

        if (*v15)
        {
          sub_1003BEF14();
        }
        else
        {
          id v25 = *(void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_packageLayer);
          if (v25)
          {
            id v26 = v25;
            Class isa = sub_1005350C0().super.isa;
            [v26 setFilters:isa];

            Class v17 = isa;
          }
        }

        id v28 = [(objc_class *)v4 layer];
        [v28 setCompositingFilter:0];
      }
      else
      {
        uint64_t v20 = (void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_foregroundColor);
        swift_beginAccess();
        id v21 = *v20;
        void *v20 = 0;

        if (*v20)
        {
          sub_1003BEF14();
        }
        else
        {
          id v32 = *(void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_packageLayer);
          if (v32)
          {
            id v33 = v32;
            Class v34 = sub_1005350C0().super.isa;
            [v33 setFilters:v34];
          }
        }
        id v35 = [(objc_class *)v4 layer];
        id v36 = kCAFilterDestOut;
        [v35 setCompositingFilter:v36];
      }
      goto LABEL_24;
    }
    id v5 = [(objc_class *)v3 layer];
    [v5 setCompositingFilter:0];

    id v6 = [v0 traitCollection];
    id v7 = [v6 accessibilityContrast];

    if (v7 != (id)1)
    {
      id v18 = (void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_foregroundColor);
      swift_beginAccess();
      id v19 = *v18;
      *id v18 = 0;

      if (*v18)
      {
        sub_1003BEF14();
      }
      else
      {
        id v29 = *(void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_packageLayer);
        if (v29)
        {
          id v30 = v29;
          Class v31 = sub_1005350C0().super.isa;
          [v30 setFilters:v31];

          Class v4 = v31;
        }
      }
      goto LABEL_24;
    }
    id v8 = [v0 tintColor];
    uint64_t v9 = (void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_foregroundColor);
    swift_beginAccess();
    uint64_t v10 = *v9;
    *uint64_t v9 = v8;
    id v11 = v8;

    if (*v9)
    {
      sub_1003BEF14();
    }
    else
    {
      id v22 = *(void **)((char *)v4 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_packageLayer);
      if (v22)
      {
        id v23 = v22;
        Class v24 = sub_1005350C0().super.isa;
        [v23 setFilters:v24];

        Class v4 = v24;
        goto LABEL_24;
      }
    }

    Class v4 = (Class)v11;
LABEL_24:
  }
}

void sub_10051FDBC()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressMode];
  swift_beginAccess();
  uint64_t v2 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressGestureRecognizer;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressGestureRecognizer];
  if (*v1 - 1 > 1)
  {
    if (!v3) {
      return;
    }
    id v6 = v3;
    [v0 removeGestureRecognizer:v6];
    id v5 = *(void **)&v0[v2];
    *(void *)&v0[v2] = 0;
  }
  else
  {
    if (v3) {
      return;
    }
    id v4 = [objc_allocWithZone((Class)UILongPressGestureRecognizer) initWithTarget:v0 action:"longPressed:"];
    [v4 setMinimumPressDuration:0.25];
    [v0 addGestureRecognizer:v4];
    id v5 = *(void **)&v0[v2];
    *(void *)&v0[v2] = v4;
  }
}

void sub_10051FEB4(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressMode];
  swift_beginAccess();
  int v4 = *v3;
  if (v4 == 2 || v4 == 1 && v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] != 2)
  {
    id v5 = (char *)[a1 state];
    if ((unint64_t)(v5 - 3) >= 3)
    {
      if (v5 == (char *)2)
      {
        id v7 = sub_10051E468();
        [a1 locationInView:v7];
        double v9 = v8;
        double v11 = v10;

        sub_10052026C(v9, v11);
      }
      else if (v5 == (char *)1)
      {
        unsigned __int8 v6 = v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
        v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] = 1;
        sub_100521544(v6);
        [v1 sendActionsForControlEvents:0x10000];
        [v1 sendActionsForControlEvents:4096];
        *(_DWORD *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialValue] = *(_DWORD *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue];
      }
    }
    else
    {
      sub_100520154();
    }
  }
}

void sub_10051FFF4(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode;
  if (v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] != 2)
  {
    int v4 = (char *)[a1 state];
    if ((unint64_t)(v4 - 3) >= 3)
    {
      if (v4 == (char *)2)
      {
        id v12 = sub_10051E468();
        [a1 locationInView:v12];
        double v14 = v13;
        double v16 = v15;

        sub_10052026C(v14, v16);
      }
      else if (v4 == (char *)1)
      {
        [v1 sendActionsForControlEvents:0x10000];
        unsigned __int8 v5 = v1[v2];
        v1[v2] = 1;
        sub_100521544(v5);
        id v6 = sub_10051E468();
        [a1 locationInView:v6];
        uint64_t v8 = v7;
        uint64_t v10 = v9;

        double v11 = &v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialDraggingLocation];
        *(void *)double v11 = v8;
        *((void *)v11 + 1) = v10;
        v11[16] = 0;
        *(_DWORD *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialValue] = *(_DWORD *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue];
      }
    }
    else
    {
      sub_100520154();
    }
  }
}

void sub_100520154()
{
  float v1 = *(float *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue];
  float v2 = *(float *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue];
  if (v1 > v2)
  {
    __break(1u);
  }
  else
  {
    float v3 = *(float *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue];
    float v4 = *(float *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange];
    float v5 = *(float *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange + 4];
    if (v4 > v3) {
      float v3 = *(float *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange];
    }
    if (v5 < v3) {
      float v3 = *(float *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange + 4];
    }
    if ((float)(v1 + (float)((float)(v2 - v1) * (float)((float)(v3 - v4) / (float)(v5 - v4)))) == v2
      && (id v6 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue],
          swift_beginAccess(),
          *v6 == 1))
    {
      unsigned __int8 v7 = v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
      v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] = 2;
    }
    else
    {
      unsigned __int8 v7 = v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
      v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] = 0;
    }
    sub_100521544(v7);
    uint64_t v8 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialDraggingLocation];
    *(void *)uint64_t v8 = 0;
    *((void *)v8 + 1) = 0;
    v8[16] = 1;
    [v0 sendActionsForControlEvents:0x40000];
  }
}

id sub_10052026C(double a1, double a2)
{
  float v4 = (double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialDraggingLocation];
  if (v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialDraggingLocation + 16])
  {
    *float v4 = a1;
    v4[1] = a2;
    double v5 = a2;
    *((unsigned char *)v4 + 16) = 0;
  }
  else
  {
    double v5 = v4[1];
  }
  id v6 = sub_10051E468();
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v42.origin.x = v8;
  v42.origin.y = v10;
  v42.size.width = v12;
  v42.size.height = v14;
  double Height = CGRectGetHeight(v42);
  double v16 = (float *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_minLevelOffsetRatio];
  swift_beginAccess();
  double v17 = Height * (1.0 - *v16);
  double v18 = (v5 - a2) * (1.0 / v17) + *(float *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialValue];
  float v19 = *(float *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange];
  float v20 = v18;
  if (v19 <= v20) {
    float v19 = v18;
  }
  if (*(float *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange + 4] < v19) {
    float v19 = *(float *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange + 4];
  }
  sub_10051E524(v19);
  if (v17 < 0.0)
  {
    __break(1u);
    goto LABEL_30;
  }
  double v21 = 0.0;
  double v22 = v17 * v18 + 0.0;
  if (v22 >= 0.0 && v22 <= v17)
  {
    if (qword_100670838 == -1)
    {
LABEL_18:
      Class v31 = &v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange];
      double v27 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange];
      double v28 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 8];
      double v29 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 16];
      double v30 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 24];
      long long v32 = *(_OWORD *)&qword_100679078;
      *Class v31 = xmmword_100679068;
      v31[1] = v32;
      goto LABEL_19;
    }
LABEL_30:
    swift_once();
    goto LABEL_18;
  }
  if (v22 >= 0.0) {
    double v21 = v17;
  }
  double v24 = vabdd_f64(v22, v21);
  double v25 = (v22 - v21) * 0.01;
  id v26 = (float64x2_t *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange];
  double v27 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange];
  double v28 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 8];
  double v29 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 16];
  double v30 = *(double *)&v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 24];
  *id v26 = vmulq_n_f64((float64x2_t)xmmword_10054DEF0, v24);
  v26[1].f64[0] = v24 * 0.01;
  v26[1].f64[1] = v25;
LABEL_19:
  sub_100524374(v27, v28, v29, v30);
  LOBYTE(v41) = 1;
  sub_10051F17C(0x100000000);
  id v33 = sub_10051EB24();
  int v34 = v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
  id v35 = [v2 traitCollection:v41];
  id v36 = v35;
  if (v34 == 2)
  {

    double v37 = 0.0;
  }
  else if (v34)
  {

    double v37 = 1.0;
  }
  else
  {
    id v38 = [v35 accessibilityContrast];

    double v37 = 0.5;
    if (v38 == (id)1) {
      double v37 = 1.0;
    }
  }
  [v33 setAlpha:v37];

  id v39 = &v2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isContinuous];
  id result = (id)swift_beginAccess();
  if (*v39) {
    return [v2 sendActionsForControlEvents:4096];
  }
  return result;
}

void sub_100520540(uint64_t a1)
{
  sub_10041A4E8(a1, (uint64_t)v51);
  uint64_t v4 = v51[0];
  uint64_t v3 = v51[1];
  uint64_t v19 = v51[3];
  uint64_t v20 = v51[4];
  double v21 = (void *)v51[5];
  uint64_t v22 = v51[6];
  uint64_t v23 = v51[7];
  uint64_t v24 = v51[8];
  uint64_t v25 = v51[2];
  double v18 = (void *)v51[9];
  double v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition);
  swift_beginAccess();
  uint64_t v6 = v5[1];
  double v7 = (void *)v5[2];
  uint64_t v8 = v5[3];
  uint64_t v9 = v5[4];
  uint64_t v10 = v5[7];
  uint64_t v27 = v5[5];
  uint64_t v28 = v5[6];
  uint64_t v11 = v5[8];
  double v29 = (void *)v5[9];
  uint64_t v30 = *v5;
  CGFloat v12 = (void *)a1;
  if (!v6)
  {
    sub_10041A4E8(a1, (uint64_t)v52);
    uint64_t v13 = v30;
    if (!v53) {
      return;
    }
    goto LABEL_13;
  }
  sub_10041A4E8(a1, (uint64_t)v52);
  uint64_t v13 = v30;
  if (!v53)
  {
LABEL_13:
    uint64_t v31 = v13;
    uint64_t v32 = v6;
    id v33 = v7;
    uint64_t v34 = v8;
    uint64_t v35 = v9;
    uint64_t v36 = v27;
    uint64_t v37 = v28;
    uint64_t v38 = v10;
    uint64_t v39 = v11;
    CGFloat v40 = v29;
    uint64_t v41 = v4;
    uint64_t v42 = v3;
    uint64_t v43 = v25;
    uint64_t v44 = v19;
    uint64_t v45 = v20;
    double v46 = v21;
    uint64_t v47 = v22;
    uint64_t v48 = v23;
    uint64_t v49 = v24;
    CGFloat v50 = v18;
    sub_10041A550(v13, v6, v7);
    sub_10041A5E8(v12, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A550);
    sub_100526068((uint64_t)&v31);
    goto LABEL_15;
  }
  BOOL v14 = v30 == v4 && v6 == v3;
  if (!v14 && (sub_100536780() & 1) == 0) {
    goto LABEL_15;
  }
  sub_100123DA4(0, (unint64_t *)&qword_1006729F0);
  double v15 = v7;
  uint64_t v16 = v8;
  double v17 = v15;
  sub_10041A550(v30, v6, v15);
  sub_10041A5E8(v12, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A550);
  if ((sub_100535D90() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v54 = v16;
  uint64_t v55 = v9;
  uint64_t v56 = v27;
  uint64_t v57 = v28;
  uint64_t v58 = v10;
  uint64_t v59 = v11;
  uint64_t v31 = v19;
  uint64_t v32 = v20;
  id v33 = v21;
  uint64_t v34 = v22;
  uint64_t v35 = v23;
  uint64_t v36 = v24;
  if ((sub_1005358A0() & 1) == 0)
  {
LABEL_14:
    sub_10041A5E8(v12, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A59C);
    sub_10041A59C(v30, v6, v17);
    goto LABEL_15;
  }
  char v26 = sub_1003D1CC0(v29, v18);
  sub_10041A5E8(v12, (void (*)(void, void, void, void, void, void, void, void, void, void))sub_10041A59C);
  sub_10041A59C(v30, v6, v17);
  if ((v26 & 1) == 0)
  {
LABEL_15:
    sub_10051EA68(0);
    sub_10051F3D4();
  }
}

long long *VerticalToggleSlider.DesignSpecs.expandedSize.unsafeMutableAddressor()
{
  if (qword_100670858 != -1) {
    swift_once();
  }
  return &static VerticalToggleSlider.DesignSpecs.expandedSize;
}

__n128 sub_100520928(id a1, uint64_t a2)
{
  id v3 = a1;
  if (a1) {
    a1 = [a1 layoutDirection];
  }
  switch((char)a2)
  {
    case 1:
      uint64_t v4 = CGPoint.topCenter.unsafeMutableAddressor();
      goto LABEL_34;
    case 2:
      if (!v3 || (unint64_t)a1 + 1 < 2) {
        goto LABEL_11;
      }
      if (a1 != (id)1) {
        goto LABEL_35;
      }
LABEL_29:
      uint64_t v4 = CGPoint.topLeft.unsafeMutableAddressor();
      goto LABEL_34;
    case 3:
      if (!v3 || (unint64_t)a1 + 1 < 2) {
        goto LABEL_31;
      }
      if (a1 != (id)1) {
        goto LABEL_35;
      }
LABEL_19:
      uint64_t v4 = CGPoint.centerRight.unsafeMutableAddressor();
      goto LABEL_34;
    case 4:
      uint64_t v4 = CGPoint.center.unsafeMutableAddressor();
      goto LABEL_34;
    case 5:
      if (!v3 || (unint64_t)a1 + 1 < 2) {
        goto LABEL_19;
      }
      if (a1 != (id)1) {
        goto LABEL_35;
      }
LABEL_31:
      uint64_t v4 = CGPoint.centerLeft.unsafeMutableAddressor();
      goto LABEL_34;
    case 6:
      if (!v3 || (unint64_t)a1 + 1 < 2) {
        goto LABEL_33;
      }
      if (a1 != (id)1) {
        goto LABEL_35;
      }
LABEL_27:
      uint64_t v4 = CGPoint.bottomRight.unsafeMutableAddressor();
      goto LABEL_34;
    case 7:
      uint64_t v4 = CGPoint.bottomCenter.unsafeMutableAddressor();
      goto LABEL_34;
    case 8:
      if (!v3 || (unint64_t)a1 + 1 < 2) {
        goto LABEL_27;
      }
      if (a1 != (id)1) {
        goto LABEL_35;
      }
LABEL_33:
      uint64_t v4 = CGPoint.bottomLeft.unsafeMutableAddressor();
      goto LABEL_34;
    default:
      if (!v3 || (unint64_t)a1 + 1 < 2) {
        goto LABEL_29;
      }
      if (a1 == (id)1)
      {
LABEL_11:
        uint64_t v4 = CGPoint.topRight.unsafeMutableAddressor();
LABEL_34:
        double v5 = v4;
        swift_beginAccess();
        return *(__n128 *)v5;
      }
      else
      {
LABEL_35:
        sub_100520928(0, a2);
        result.n128_u64[1] = v7;
      }
      return result;
  }
}

id VerticalToggleSlider.init(frame:)(double a1, double a2, double a3, double a4)
{
  double v5 = v4;
  swift_getObjectType();
  uint64_t v10 = &v4[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition];
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  uint64_t v11 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_minLevelOffsetRatio;
  uint64_t v12 = qword_100670858;
  uint64_t v13 = v4;
  if (v12 != -1) {
    swift_once();
  }
  double v14 = 1.0 / *((double *)&static VerticalToggleSlider.DesignSpecs.expandedSize + 1);
  if (qword_100670848 != -1) {
    swift_once();
  }
  float v15 = v14 * *(double *)&qword_10067C5A8;
  *(float *)&v5[v11] = v15;
  uint64_t v16 = &v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor];
  *(void *)uint64_t v16 = 0;
  v16[8] = 1;
  v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isTapToToggleEnabled] = 1;
  v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isVisuallyDisabled] = 0;
  v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isContinuous] = 1;
  v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue] = 1;
  v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressMode] = 1;
  v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growAnchorPoint] = 8;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___stretchView] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___growView] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange] = 0x3F80000000000000;
  *(_DWORD *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue] = 1065353216;
  *(_DWORD *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue] = 0;
  *(_DWORD *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue] = 1065353216;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___feedbackGenerator] = 0;
  v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] = 2;
  uint64_t v17 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_blurEffect;
  if (qword_100670830 != -1) {
    swift_once();
  }
  *(void *)&v13[v17] = [self effectWithBlurRadius:*(double *)&qword_100679060];
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___visualEffectView] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___levelView] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_sceneActivationObserver] = 0;
  *(void *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressGestureRecognizer] = 0;
  double v18 = &v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialDraggingLocation];
  *(void *)double v18 = 0;
  *((void *)v18 + 1) = 0;
  v18[16] = 1;
  *(_DWORD *)&v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialValue] = 0;
  uint64_t v19 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange;
  if (qword_100670838 != -1) {
    swift_once();
  }
  uint64_t v20 = &v13[v19];
  long long v21 = *(_OWORD *)&qword_100679078;
  *(_OWORD *)uint64_t v20 = xmmword_100679068;
  *((_OWORD *)v20 + 1) = v21;
  uint64_t v22 = &v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_stretchTransform];
  *(void *)uint64_t v22 = 0x3FF0000000000000;
  *((void *)v22 + 1) = 0;
  *((void *)v22 + 2) = 0;
  *((void *)v22 + 3) = 0x3FF0000000000000;
  *((void *)v22 + 4) = 0;
  *((void *)v22 + 5) = 0;
  uint64_t v23 = &v13[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growTransform];
  *(void *)uint64_t v23 = 0x3FF0000000000000;
  *((void *)v23 + 1) = 0;
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0x3FF0000000000000;
  *((void *)v23 + 4) = 0;
  *((void *)v23 + 5) = 0;

  v33.receiver = v13;
  v33.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  [super initWithFrame:a1, a2, a3, a4];
  [v24 setDeliversTouchesForGesturesToSuperview:0];
  sub_100123DA4(0, &qword_100672C38);
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v26 = (void *)sub_100535DC0();
  [v24 addAction:v26 forControlEvents:64];

  id v27 = [objc_allocWithZone((Class)UIPanGestureRecognizer) initWithTarget:v24 action:"dragged:"];
  [v24 addGestureRecognizer:v27];

  sub_10051FDBC();
  sub_10051EBE0();
  sub_10000BB04(&qword_100672A70);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_10053A3B0;
  *(void *)(v28 + 32) = sub_100530BA0();
  *(void *)(v28 + 40) = &protocol witness table for UITraitAccessibilityContrast;
  id v29 = v24;
  sub_100535D10();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_10053A3B0;
  *(void *)(v30 + 32) = sub_100530A50();
  *(void *)(v30 + 40) = &protocol witness table for UITraitLayoutDirection;
  id v31 = v29;
  sub_100535D10();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v31;
}

double VerticalToggleSlider.intrinsicContentSize.getter()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) == 2)
  {
    if (qword_100670850 != -1) {
      swift_once();
    }
    uint64_t v1 = &static VerticalToggleSlider.DesignSpecs.size;
  }
  else
  {
    if (qword_100670858 != -1) {
      swift_once();
    }
    uint64_t v1 = &static VerticalToggleSlider.DesignSpecs.expandedSize;
  }
  return *(double *)v1;
}

long long *VerticalToggleSlider.DesignSpecs.size.unsafeMutableAddressor()
{
  if (qword_100670850 != -1) {
    swift_once();
  }
  return &static VerticalToggleSlider.DesignSpecs.size;
}

id VerticalToggleSlider.isEnabled.getter()
{
  return sub_100523BF8((SEL *)&selRef_isEnabled);
}

uint64_t VerticalToggleSlider.isEnabled.setter(char a1)
{
  return sub_100523D1C(a1, (SEL *)&selRef_isEnabled, (SEL *)&selRef_setEnabled_, (uint64_t (*)(id))sub_100521288);
}

void sub_100521288(char a1)
{
  if ([v1 isEnabled] != (a1 & 1))
  {
    float v2 = &v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isVisuallyDisabled];
    swift_beginAccess();
    if (*v2) {
      unsigned int v3 = 1;
    }
    else {
      unsigned int v3 = [v1 isEnabled] ^ 1;
    }
    uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
    if (v4)
    {
      double v5 = 0.4;
      if (!v3) {
        double v5 = 1.0;
      }
      [v4 setAlpha:v5];
    }
    id v6 = sub_10051E9E4();
    unint64_t v7 = v6;
    double v8 = 1.0;
    if (v3) {
      double v8 = 0.5;
    }
    [v6 setAlpha:v8];
  }
}

Swift::Void __swiftcall VerticalToggleSlider.tintColorDidChange()()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  [super tintColorDidChange];
  sub_10051E6B0();
}

long long *VerticalToggleSlider.DesignSpecs.minimumTapArea.unsafeMutableAddressor()
{
  if (qword_100670860 != -1) {
    swift_once();
  }
  return &static VerticalToggleSlider.DesignSpecs.minimumTapArea;
}

id sub_1005214A8(void *a1)
{
  id v1 = [a1 userInterfaceStyle];
  if (qword_1006703E8 != -1) {
    swift_once();
  }
  id v2 = [(id)static UIColor.MusicTint.normal colorWithAlphaComponent:dbl_10054DF00[v1 == (id)2]];

  return v2;
}

void sub_100521544(unsigned __int8 a1)
{
  id v2 = v1;
  int v3 = a1;
  sub_10000BB04(&qword_100678A80);
  __chkstk_darwin();
  double v5 = &v153[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode;
  int v7 = v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
  if (v7 == 2)
  {
    if (v3 == 2) {
      return;
    }
  }
  else if (v3 == 2)
  {
    if (v7) {
      sub_10051E524(1.0);
    }
  }
  else if ((((v3 & 1) == 0) ^ v7))
  {
    return;
  }
  id v8 = sub_10051E638();
  [v8 userInteractionStarted];

  uint64_t v9 = self;
  if ([v9 areAnimationsEnabled])
  {
    int v10 = v1[v6];
    if (v3 == 2)
    {
      if (v10 == 2) {
        return;
      }
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v2;
      *(unsigned char *)(v11 + 24) = v10 & 1;
      if (v10)
      {
        uint64_t v108 = qword_1006708A0;
        id v109 = v2;
        if (v108 != -1) {
          swift_once();
        }
        uint64_t v110 = (void *)qword_1006790B8;
        [(id)qword_1006790B8 settlingDuration];
        double v112 = v111;
        [v110 mass];
        double v114 = v113;
        [v110 stiffness];
        double v116 = v115;
        [v110 damping];
        double v118 = v117;
        *(void *)&aBlock.tx = sub_100526008;
        *(void *)&aBlock.ty = v11;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_1001CB5A0;
        *(void *)&aBlock.d = &unk_10063D2C8;
        uint64_t v119 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        [v9 _animateUsingSpringWithDuration:6 delay:v119 options:0 mass:v112 stiffness:0.0 damping:v114 initialVelocity:v116 animations:v118 completion:0.0];
        _Block_release(v119);
        if (qword_1006708A8 != -1) {
          swift_once();
        }
        uint64_t v120 = (void *)qword_1006790C0;
        uint64_t v121 = swift_allocObject();
        *(void *)(v121 + 16) = v109;
        id v122 = v109;
        [v120 settlingDuration];
        double v124 = v123;
        [v120 mass];
        double v126 = v125;
        [v120 stiffness];
        double v128 = v127;
        [v120 damping];
        double v130 = v129;
        *(void *)&aBlock.tx = sub_100526024;
        *(void *)&aBlock.ty = v121;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_1001CB5A0;
        *(void *)&aBlock.d = &unk_10063D318;
        uint64_t v131 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        [v9 _animateUsingSpringWithDuration:6 delay:v131 options:0 mass:v124 stiffness:0.0 damping:v126 initialVelocity:v128 animations:v130 completion:0.0];
        _Block_release(v131);
      }
      else
      {
        uint64_t v12 = qword_100670880;
        id v13 = v2;
        if (v12 != -1) {
          swift_once();
        }
        double v14 = (void *)qword_100679098;
        [(id)qword_100679098 settlingDuration];
        double v16 = v15;
        [v14 mass];
        double v18 = v17;
        [v14 stiffness];
        double v20 = v19;
        [v14 damping];
        double v22 = v21;
        *(void *)&aBlock.tx = sub_100526008;
        *(void *)&aBlock.ty = v11;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_1001CB5A0;
        *(void *)&aBlock.d = &unk_10063D228;
        uint64_t v23 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        [v9 _animateUsingSpringWithDuration:6 delay:v23 options:0 mass:v16 stiffness:0.2 damping:v18 initialVelocity:v20 animations:v22 completion:0.0];
        _Block_release(v23);
        if (qword_100670878 != -1) {
          swift_once();
        }
        id v24 = (void *)qword_100679090;
        uint64_t v25 = swift_allocObject();
        *(void *)(v25 + 16) = v13;
        id v26 = v13;
        [v24 settlingDuration];
        double v28 = v27;
        [v24 mass];
        double v30 = v29;
        [v24 stiffness];
        double v32 = v31;
        [v24 damping];
        double v34 = v33;
        *(void *)&aBlock.tx = sub_100526014;
        *(void *)&aBlock.ty = v25;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_1001CB5A0;
        *(void *)&aBlock.d = &unk_10063D278;
        uint64_t v35 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        [v9 _animateUsingSpringWithDuration:6 delay:v35 options:0 mass:v28 stiffness:0.0 damping:v30 initialVelocity:v32 animations:v34 completion:0.0];
        _Block_release(v35);
        swift_release();
        sub_100123DA4(0, (unint64_t *)&qword_1006708E0);
        uint64_t v36 = (void *)sub_100535960();
        uint64_t v37 = swift_allocObject();
        *(void *)(v37 + 16) = v26;
        id v38 = v26;
        OS_dispatch_queue.asyncAfter(_:block:)((uint64_t)sub_10052601C, v37);
      }
LABEL_68:
      swift_release();
      swift_release();
      return;
    }
    int v55 = v3 & 1;
    if (v10 != 2)
    {
      if ((((v55 != 0) ^ v10) & 1) == 0) {
        return;
      }
      int v80 = v10 & 1;
      uint64_t v81 = swift_allocObject();
      *(void *)(v81 + 16) = v2;
      *(unsigned char *)(v81 + 24) = v80;
      uint64_t v82 = swift_allocObject();
      *(void *)(v82 + 16) = v2;
      *(unsigned char *)(v82 + 24) = v80;
      if (v80)
      {
        uint64_t v83 = qword_1006708A0;
        id v84 = v2;
        if (v83 != -1) {
          swift_once();
        }
        uint64_t v85 = (void *)qword_1006790B8;
        [(id)qword_1006790B8 settlingDuration];
        double v87 = v86;
        [v85 mass];
        double v89 = v88;
        [v85 stiffness];
        double v91 = v90;
        [v85 damping];
        double v93 = v92;
        *(void *)&aBlock.tx = sub_100525F3C;
        *(void *)&aBlock.ty = v81;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_1001CB5A0;
        *(void *)&aBlock.d = &unk_10063D098;
        uint64_t v94 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        [v9 _animateUsingSpringWithDuration:6 delay:v94 options:0 mass:v87 stiffness:0.0 damping:v89 initialVelocity:v91 animations:v93 completion:0.0];
        _Block_release(v94);
        if (qword_1006708A8 != -1) {
          swift_once();
        }
        uint64_t v95 = (void *)qword_1006790C0;
        [(id)qword_1006790C0 settlingDuration];
        double v97 = v96;
        [v95 mass];
        double v99 = v98;
        [v95 stiffness];
        double v101 = v100;
        [v95 damping];
        double v103 = v102;
        *(void *)&aBlock.tx = sub_100525F48;
        *(void *)&aBlock.ty = v82;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        uint64_t v104 = &unk_10063D0C0;
      }
      else
      {
        uint64_t v132 = qword_1006708B0;
        id v133 = v2;
        if (v132 != -1) {
          swift_once();
        }
        uint64_t v134 = (void *)qword_1006790C8;
        uint64_t v135 = swift_allocObject();
        *(void *)(v135 + 16) = v133;
        id v136 = v133;
        [v134 settlingDuration];
        double v138 = v137;
        [v134 mass];
        double v140 = v139;
        [v134 stiffness];
        double v142 = v141;
        [v134 damping];
        double v144 = v143;
        *(void *)&aBlock.tx = sub_100525F3C;
        *(void *)&aBlock.ty = v81;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_1001CB5A0;
        *(void *)&aBlock.d = &unk_10063D020;
        uint64_t v145 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        *(void *)&aBlock.tx = CFRange.init(_:);
        *(void *)&aBlock.ty = v135;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        *(void *)&aBlock.c = sub_100359584;
        *(void *)&aBlock.d = &unk_10063D048;
        uint64_t v146 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        [v9 _animateUsingSpringWithDuration:6 delay:v145 options:v146 mass:v138 stiffness:0.0 damping:v140 initialVelocity:v142 animations:v144 completion:0.0];
        _Block_release(v146);
        _Block_release(v145);
        swift_release();
        if (qword_1006708B8 != -1) {
          swift_once();
        }
        uint64_t v147 = (void *)qword_1006790D0;
        [(id)qword_1006790D0 settlingDuration];
        double v97 = v148;
        [v147 mass];
        double v99 = v149;
        [v147 stiffness];
        double v101 = v150;
        [v147 damping];
        double v103 = v151;
        *(void *)&aBlock.tx = sub_100525F48;
        *(void *)&aBlock.ty = v82;
        *(void *)&aBlock.a = _NSConcreteStackBlock;
        *(void *)&aBlock.b = 1107296256;
        uint64_t v104 = &unk_10063D070;
      }
      *(void *)&aBlock.c = sub_1001CB5A0;
      *(void *)&aBlock.d = v104;
      v152 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      [v9 _animateUsingSpringWithDuration:6 delay:v152 options:0 mass:v97 stiffness:0.0 damping:v99 initialVelocity:v101 animations:v103 completion:0.0];
      _Block_release(v152);
      goto LABEL_68;
    }
    if ((v3 & 1) == 0)
    {
      if (qword_100670890 != -1) {
        swift_once();
      }
      uint64_t v56 = (void *)qword_1006790A8;
      uint64_t v57 = swift_allocObject();
      *(void *)(v57 + 16) = v2;
      id v58 = v2;
      [v56 settlingDuration];
      double v60 = v59;
      [v56 mass];
      double v62 = v61;
      [v56 stiffness];
      double v64 = v63;
      [v56 damping];
      double v66 = v65;
      *(void *)&aBlock.tx = sub_100525F8C;
      *(void *)&aBlock.ty = v57;
      *(void *)&aBlock.a = _NSConcreteStackBlock;
      *(void *)&aBlock.b = 1107296256;
      *(void *)&aBlock.c = sub_1001CB5A0;
      *(void *)&aBlock.d = &unk_10063D110;
      uint64_t v67 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      [v9 _animateUsingSpringWithDuration:6 delay:v67 options:0 mass:v60 stiffness:0.0 damping:v62 initialVelocity:v64 animations:v66 completion:0.0];
      _Block_release(v67);
      swift_release();
    }
    if (qword_100670898 != -1) {
      swift_once();
    }
    uint64_t v68 = qword_1006790B0;
    uint64_t v69 = swift_allocObject();
    *(unsigned char *)(v69 + 16) = v55;
    *(void *)(v69 + 24) = v2;
    uint64_t v70 = swift_allocObject();
    *(void *)(v70 + 16) = v2;
    id v71 = v2;
    double v72 = 0.0;
    if (!v55) {
      double v72 = 0.1;
    }
    sub_1005253DC(v68, 2, sub_100525FCC, v69, CFRange.init(_:), v70, 0.75, v72);
    swift_release();
    swift_release();
    sub_100123DA4(0, (unint64_t *)&qword_1006708E0);
    uint64_t v73 = (void *)sub_100535960();
    uint64_t v74 = swift_allocObject();
    *(void *)(v74 + 16) = v71;
    id v75 = v71;
    OS_dispatch_queue.asyncAfter(_:block:)((uint64_t)sub_100525FD8, v74);

    swift_release();
    if (!v55)
    {
      uint64_t v76 = swift_allocObject();
      *(void *)(v76 + 16) = v75;
      *(void *)&aBlock.tx = sub_100526000;
      *(void *)&aBlock.ty = v76;
      *(void *)&aBlock.a = _NSConcreteStackBlock;
      *(void *)&aBlock.b = 1107296256;
      *(void *)&aBlock.c = sub_1001CB5A0;
      *(void *)&aBlock.d = &unk_10063D1D8;
      uint64_t v77 = _Block_copy(&aBlock);
      id v78 = v75;
      swift_release();
      [v9 animateWithDuration:0 delay:v77 options:0 animations:0.25 completion:0.7];
      _Block_release(v77);
    }
  }
  else
  {
    [v1 invalidateIntrinsicContentSize];
    [v1 setNeedsUpdateConstraints];
    id v39 = [v1 superview];
    [v39 setNeedsLayout];

    id v40 = [v1 superview];
    [v40 layoutIfNeeded];

    [v1 updateConstraintsIfNeeded];
    CGFloat v41 = 1.0;
    CGFloat v42 = 1.0;
    if (v1[v6])
    {
      uint64_t v43 = (uint64_t *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor];
      swift_beginAccess();
      if (*((unsigned char *)v43 + 8) == 1)
      {
        if (qword_100670840 != -1) {
          swift_once();
        }
        uint64_t v43 = &qword_10067C5A0;
      }
      CGFloat v42 = *(double *)v43;
    }
    if (v1[v6])
    {
      uint64_t v44 = (uint64_t *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor];
      swift_beginAccess();
      if (*((unsigned char *)v44 + 8) == 1)
      {
        if (qword_100670840 != -1) {
          swift_once();
        }
        uint64_t v44 = &qword_10067C5A0;
      }
      CGFloat v41 = *(double *)v44;
    }
    CGAffineTransformMakeScale(&aBlock, v42, v41);
    long long v45 = *(_OWORD *)&aBlock.c;
    long long v46 = *(_OWORD *)&aBlock.tx;
    uint64_t v47 = &v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growTransform];
    *(_OWORD *)uint64_t v47 = *(_OWORD *)&aBlock.a;
    *((_OWORD *)v47 + 1) = v45;
    *((_OWORD *)v47 + 2) = v46;
    id v48 = sub_10051E468();
    long long v49 = *((_OWORD *)v47 + 1);
    *(_OWORD *)&aBlock.a = *(_OWORD *)v47;
    *(_OWORD *)&aBlock.c = v49;
    *(_OWORD *)&aBlock.tx = *((_OWORD *)v47 + 2);
    [v48 setTransform:&aBlock];

    sub_10051F3D4();
    LOBYTE(aBlock.a) = 1;
    sub_10051F17C(0x100000000);
    id v50 = sub_10051EB24();
    int v51 = v1[v6];
    id v52 = [v1 traitCollection];
    uint64_t v53 = v52;
    if (v51 == 2)
    {

      double v54 = 0.0;
    }
    else if (v51)
    {

      double v54 = 1.0;
    }
    else
    {
      id v79 = [v52 accessibilityContrast];

      double v54 = 0.5;
      if (v79 == (id)1) {
        double v54 = 1.0;
      }
    }
    [v50 setAlpha:v54];

    id v105 = sub_10051E3B4();
    if (qword_100670868 != -1) {
      swift_once();
    }
    sub_100535C70();
    uint64_t v106 = sub_100535CE0();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56))(v5, 0, 1, v106);
    sub_100535CF0();

    id v107 = [self clearColor];
    UIView.Shadow.init(color:opacity:radius:offset:)((uint64_t)v107, (uint64_t)&aBlock, 0.0, 0.0, 0.0, 0.0);
    UIView.shadow.setter((uint64_t)&aBlock);
  }
}

void sub_1005228D8(char *a1, char a2)
{
  sub_10000BB04(&qword_100678A80);
  __chkstk_darwin();
  double v5 = &v26[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  [a1 invalidateIntrinsicContentSize];
  [a1 setNeedsUpdateConstraints];
  id v6 = [a1 superview];
  [v6 setNeedsLayout];

  id v7 = [a1 superview];
  [v7 layoutIfNeeded];

  [a1 updateConstraintsIfNeeded];
  uint64_t v8 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode;
  CGFloat v9 = 1.0;
  CGFloat v10 = 1.0;
  if (a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode])
  {
    uint64_t v11 = (uint64_t *)&a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor];
    swift_beginAccess();
    if (*((unsigned char *)v11 + 8) == 1)
    {
      if (qword_100670840 != -1) {
        swift_once();
      }
      uint64_t v11 = &qword_10067C5A0;
    }
    CGFloat v10 = *(double *)v11;
  }
  if (a1[v8])
  {
    uint64_t v12 = (uint64_t *)&a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor];
    swift_beginAccess();
    if (*((unsigned char *)v12 + 8) == 1)
    {
      if (qword_100670840 != -1) {
        swift_once();
      }
      uint64_t v12 = &qword_10067C5A0;
    }
    CGFloat v9 = *(double *)v12;
  }
  CGAffineTransformMakeScale(&v27, v10, v9);
  long long v13 = *(_OWORD *)&v27.c;
  long long v14 = *(_OWORD *)&v27.tx;
  double v15 = &a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growTransform];
  *(_OWORD *)double v15 = *(_OWORD *)&v27.a;
  *((_OWORD *)v15 + 1) = v13;
  *((_OWORD *)v15 + 2) = v14;
  id v16 = sub_10051E468();
  long long v17 = *((_OWORD *)v15 + 1);
  *(_OWORD *)&v27.a = *(_OWORD *)v15;
  *(_OWORD *)&v27.c = v17;
  *(_OWORD *)&v27.tx = *((_OWORD *)v15 + 2);
  [v16 setTransform:&v27];

  id v18 = sub_10051E3B4();
  if (qword_100670868 != -1) {
    swift_once();
  }
  sub_100535C70();
  uint64_t v19 = sub_100535CE0();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 0, 1, v19);
  sub_100535CF0();

  if (a2)
  {
    LOBYTE(v27.a) = 1;
    sub_10051F17C(0x100000000);
    id v20 = sub_10051EB24();
    int v21 = a1[v8];
    id v22 = [a1 traitCollection];
    uint64_t v23 = v22;
    if (v21 == 2)
    {

      double v24 = 0.0;
    }
    else if (v21)
    {

      double v24 = 1.0;
    }
    else
    {
      id v25 = [v22 accessibilityContrast];

      double v24 = 0.5;
      if (v25 == (id)1) {
        double v24 = 1.0;
      }
    }
    [v20 setAlpha:v24];

    sub_10051F3D4();
  }
  else
  {
    LOBYTE(v27.a) = 0;
    sub_10051F17C(1065353216);
  }
  sub_10051E6B0();
}

void sub_100522CB4()
{
  id v0 = [self blackColor];
  UIView.Shadow.init(color:opacity:radius:offset:)((uint64_t)v0, (uint64_t)v1, 0.3, 9.0, 0.0, 5.0);
  UIView.shadow.setter((uint64_t)v1);
}

void sub_100522D24(unsigned __int8 *a1)
{
  id v2 = sub_10051EB24();
  int v3 = a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
  id v4 = [a1 traitCollection];
  double v5 = v4;
  if (v3 == 2)
  {

    double v6 = 0.0;
  }
  else if (v3)
  {

    double v6 = 1.0;
  }
  else
  {
    id v7 = [v4 accessibilityContrast];

    double v6 = 0.5;
    if (v7 == (id)1) {
      double v6 = 1.0;
    }
  }
  [v2 setAlpha:v6];

  sub_10051F3D4();
  id v8 = [self clearColor];
  UIView.Shadow.init(color:opacity:radius:offset:)((uint64_t)v8, (uint64_t)v9, 0.0, 0.0, 0.0, 0.0);
  UIView.shadow.setter((uint64_t)v9);
}

uint64_t sub_100522E28(void *a1)
{
  if (qword_100670888 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1006790A0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  id v4 = self;
  id v5 = a1;
  [v4 begin];
  [v4 setAnimationTimingFunction:v2];
  double v6 = self;
  v9[4] = sub_10052602C;
  v9[5] = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1001CB5A0;
  v9[3] = &unk_10063D368;
  id v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  [v6 animateWithDuration:2 delay:v7 options:0 animations:0.85 completion:0.0];
  _Block_release(v7);
  [v4 commit];
  return swift_release();
}

void sub_100522FC0(uint64_t a1)
{
  id v2 = sub_10051EB24();
  id v3 = sub_10051E9E4();
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [v2 setFrame:v5, v7, v9, v11];
  if (qword_100670838 != -1) {
    swift_once();
  }
  uint64_t v12 = (_OWORD *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange);
  double v13 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange);
  double v14 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 8);
  double v15 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 16);
  double v16 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 24);
  long long v17 = *(_OWORD *)&qword_100679078;
  *uint64_t v12 = xmmword_100679068;
  v12[1] = v17;
  sub_100524374(v13, v14, v15, v16);
}

void sub_1005230A4(char a1, char *a2)
{
  sub_10000BB04(&qword_100678A80);
  __chkstk_darwin();
  double v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (qword_100670838 != -1) {
      swift_once();
    }
    double v6 = &a2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange];
    double v7 = *(double *)&a2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange];
    double v8 = *(double *)&a2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 8];
    double v9 = *(double *)&a2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 16];
    double v10 = *(double *)&a2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 24];
    long long v11 = *(_OWORD *)&qword_100679078;
    *(_OWORD *)double v6 = xmmword_100679068;
    *((_OWORD *)v6 + 1) = v11;
    sub_100524374(v7, v8, v9, v10);
    LOBYTE(v26[0]) = 1;
    sub_10051F17C(0x100000000);
    id v12 = sub_10051EB24();
    int v13 = a2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
    id v14 = [a2 traitCollection];
    double v15 = v14;
    if (v13 == 2)
    {

      double v16 = 0.0;
    }
    else if (v13)
    {

      double v16 = 1.0;
    }
    else
    {
      id v17 = [v14 accessibilityContrast];

      double v16 = 0.5;
      if (v17 == (id)1) {
        double v16 = 1.0;
      }
    }
    [v12 setAlpha:v16];
  }
  id v18 = &a2[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growTransform];
  *(void *)id v18 = 0x3FF0000000000000;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0x3FF0000000000000;
  *((void *)v18 + 4) = 0;
  *((void *)v18 + 5) = 0;
  id v19 = sub_10051E468();
  long long v20 = *((_OWORD *)v18 + 1);
  v26[0] = *(_OWORD *)v18;
  v26[1] = v20;
  v26[2] = *((_OWORD *)v18 + 2);
  [v19 setTransform:v26];

  [a2 invalidateIntrinsicContentSize];
  [a2 setNeedsUpdateConstraints];
  id v21 = [a2 superview];
  [v21 setNeedsLayout];

  id v22 = [a2 superview];
  [v22 layoutIfNeeded];

  [a2 updateConstraintsIfNeeded];
  id v23 = sub_10051E3B4();
  if (qword_100670868 != -1) {
    swift_once();
  }
  sub_100535C70();
  uint64_t v24 = sub_100535CE0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v5, 0, 1, v24);
  sub_100535CF0();

  id v25 = [self clearColor];
  UIView.Shadow.init(color:opacity:radius:offset:)((uint64_t)v25, (uint64_t)v26, 0.0, 0.0, 0.0, 0.0);
  UIView.shadow.setter((uint64_t)v26);
}

void sub_1005233F8(unsigned __int8 *a1)
{
  id v7 = sub_10051EB24();
  int v2 = a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
  id v3 = [a1 traitCollection];
  uint64_t v4 = v3;
  if (v2 == 2)
  {

    double v5 = 0.0;
  }
  else if (v2)
  {

    double v5 = 1.0;
  }
  else
  {
    id v6 = [v3 accessibilityContrast];

    double v5 = 0.5;
    if (v6 == (id)1) {
      double v5 = 1.0;
    }
  }
  [v7 setAlpha:v5];
}

void sub_1005234C8(uint64_t a1, char a2)
{
  sub_10000BB04(&qword_100678A80);
  __chkstk_darwin();
  double v5 = &v24[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode;
  CGFloat v7 = 1.0;
  CGFloat v8 = 1.0;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode))
  {
    double v9 = (uint64_t *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor);
    swift_beginAccess();
    if (*((unsigned char *)v9 + 8) == 1)
    {
      if (qword_100670840 != -1) {
        swift_once();
      }
      double v9 = &qword_10067C5A0;
    }
    CGFloat v8 = *(double *)v9;
  }
  if (*(unsigned char *)(a1 + v6))
  {
    double v10 = (uint64_t *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor);
    swift_beginAccess();
    if (*((unsigned char *)v10 + 8) == 1)
    {
      if (qword_100670840 != -1) {
        swift_once();
      }
      double v10 = &qword_10067C5A0;
    }
    CGFloat v7 = *(double *)v10;
  }
  CGAffineTransformMakeScale(&v25, v8, v7);
  long long v11 = *(_OWORD *)&v25.c;
  long long v12 = *(_OWORD *)&v25.tx;
  int v13 = (_OWORD *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growTransform);
  *int v13 = *(_OWORD *)&v25.a;
  v13[1] = v11;
  v13[2] = v12;
  id v14 = sub_10051E468();
  long long v15 = v13[1];
  *(_OWORD *)&v25.a = *v13;
  *(_OWORD *)&v25.c = v15;
  *(_OWORD *)&v25.tx = v13[2];
  [v14 setTransform:&v25];

  id v16 = sub_10051E3B4();
  if (qword_100670868 != -1) {
    swift_once();
  }
  sub_100535C70();
  uint64_t v17 = sub_100535CE0();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 0, 1, v17);
  sub_100535CF0();

  if ((a2 & 1) == 0)
  {
    if (qword_100670838 != -1) {
      swift_once();
    }
    id v18 = (_OWORD *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange);
    double v19 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange);
    double v20 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 8);
    double v21 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 16);
    double v22 = *(double *)(a1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 24);
    long long v23 = *(_OWORD *)&qword_100679078;
    *id v18 = xmmword_100679068;
    v18[1] = v23;
    sub_100524374(v19, v20, v21, v22);
  }
}

void sub_1005237B0(unsigned __int8 *a1, char a2)
{
  LOBYTE(v18) = 1;
  sub_10051F17C(0x100000000);
  id v4 = sub_10051EB24();
  int v5 = a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
  id v6 = [a1 traitCollection];
  CGFloat v7 = v6;
  if (v5 == 2)
  {

    double v8 = 0.0;
  }
  else if (v5)
  {

    double v8 = 1.0;
  }
  else
  {
    id v9 = [v6 accessibilityContrast];

    double v8 = 0.5;
    if (v9 == (id)1) {
      double v8 = 1.0;
    }
  }
  [v4 setAlpha:v8];

  double v10 = self;
  if (a2)
  {
    id v11 = [v10 blackColor];
    double v12 = 0.3;
    double v13 = 9.0;
    double v14 = 5.0;
  }
  else
  {
    id v11 = [v10 clearColor];
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
  }
  UIView.Shadow.init(color:opacity:radius:offset:)((uint64_t)v11, (uint64_t)&v15, v12, v13, 0.0, v14);
  uint64_t v18 = v15;
  long long v19 = v16;
  long long v20 = v17;
  UIView.shadow.setter((uint64_t)&v18);
}

void sub_100523924()
{
  qword_100679060 = 0x4024000000000000;
}

uint64_t sub_100523934(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) != 2)
  {
    int v2 = (uint64_t *)(a2 + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_stateName);
    swift_beginAccess();
    uint64_t v3 = *v2;
    uint64_t v4 = v2[1];
    *(_OWORD *)int v2 = xmmword_10054DF10;
    sub_1003BDFD8(v3, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall VerticalToggleSlider.didMoveToWindow()()
{
  id v1 = v0;
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  [super didMoveToWindow];
  id v2 = [v0 window];
  if (v2 && (uint64_t v3 = v2, v4 = [v2 windowScene], v3, v4))
  {
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    type metadata accessor for NotificationObserver();
    swift_allocObject();
    id v6 = UISceneDidActivateNotification;
    id v7 = v4;
    *(void *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_sceneActivationObserver] = NotificationObserver.init(name:object:dispatchOnMainThread:usesLocalNotificationCenter:handler:)(v6, (uint64_t)v4, 1, 1, (uint64_t)sub_1005259C8, v5);
  }
  else
  {
    *(void *)&v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_sceneActivationObserver] = 0;
  }
  swift_release();
}

void sub_100523B04()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    sub_10051F3D4();
  }
}

id sub_100523BAC(void *a1, uint64_t a2, SEL *a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  return [super *a3];
}

id VerticalToggleSlider.isHighlighted.getter()
{
  return sub_100523BF8((SEL *)&selRef_isHighlighted);
}

id sub_100523BF8(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  return [super a1];
}

void sub_100523C5C(void *a1, uint64_t a2, uint64_t a3, const char **a4, SEL *a5, void (*a6)(id))
{
  id v11 = (objc_class *)type metadata accessor for VerticalToggleSlider();
  v16.receiver = a1;
  v16.super_class = v11;
  double v12 = *a4;
  id v13 = a1;
  id v14 = [super v12];
  v15.receiver = v13;
  v15.super_class = v11;
  [super a3];
  a6(v14);
}

uint64_t VerticalToggleSlider.isHighlighted.setter(char a1)
{
  return sub_100523D1C(a1, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_, (uint64_t (*)(id))sub_100523D9C);
}

uint64_t sub_100523D1C(char a1, SEL *a2, SEL *a3, uint64_t (*a4)(id))
{
  id v9 = (objc_class *)type metadata accessor for VerticalToggleSlider();
  v13.receiver = v4;
  v13.super_class = v9;
  id v10 = [super a2];
  v12.receiver = v4;
  v12.super_class = v9;
  [super a1 & 1];
  return a4(v10);
}

void sub_100523D9C(char a1)
{
  id v2 = v1;
  if ([v1 isHighlighted] != (a1 & 1))
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    objc_super v4 = self;
    objc_super v5 = v2;
    if ([v4 areAnimationsEnabled])
    {
      if (qword_100670870 != -1) {
        swift_once();
      }
      id v6 = (void *)qword_100679088;
      [(id)qword_100679088 settlingDuration];
      double v8 = v7;
      [v6 mass];
      double v10 = v9;
      [v6 stiffness];
      double v12 = v11;
      [v6 damping];
      double v14 = v13;
      *(void *)&v24.tx = sub_100525EFC;
      *(void *)&v24.ty = v3;
      *(void *)&v24.a = _NSConcreteStackBlock;
      *(void *)&v24.b = 1107296256;
      *(void *)&v24.c = sub_1001CB5A0;
      *(void *)&v24.d = &unk_10063CF58;
      objc_super v15 = _Block_copy(&v24);
      swift_retain();
      swift_release();
      [v4 _animateUsingSpringWithDuration:6 delay:v15 options:0 mass:v8 stiffness:0.0 damping:v10 initialVelocity:v12 animations:v14 completion:0.0];
      _Block_release(v15);
LABEL_12:
      swift_release();
      return;
    }
    if ([v5 isHighlighted])
    {
      CGAffineTransformMakeScale(&v24, 0.95, 0.95);
      long long v17 = *(_OWORD *)&v24.a;
      long long v16 = *(_OWORD *)&v24.c;
      long long v18 = *(_OWORD *)&v24.tx;
    }
    else
    {
      long long v16 = xmmword_10053E020;
      long long v17 = xmmword_10054DC60;
      long long v18 = 0uLL;
    }
    *(_OWORD *)&v24.a = v17;
    *(_OWORD *)&v24.c = v16;
    *(_OWORD *)&v24.tx = v18;
    [v5 setTransform:&v24];
    long long v19 = *(void **)&v5[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
    if (!v19) {
      goto LABEL_12;
    }
    id v20 = v19;
    if ([v5 isHighlighted])
    {
      CGAffineTransformMakeScale(&v24, 0.9, 0.9);
      long long v22 = *(_OWORD *)&v24.a;
      long long v21 = *(_OWORD *)&v24.c;
      long long v23 = *(_OWORD *)&v24.tx;
    }
    else
    {
      long long v21 = xmmword_10053E020;
      long long v22 = xmmword_10054DC60;
      long long v23 = 0uLL;
    }
    *(_OWORD *)&v24.a = v22;
    *(_OWORD *)&v24.c = v21;
    *(_OWORD *)&v24.tx = v23;
    [v20 setTransform:&v24];
    swift_release();
  }
}

void sub_100524078(char *a1)
{
  if ([a1 isHighlighted])
  {
    CGAffineTransformMakeScale(&v10, 0.95, 0.95);
    long long v3 = *(_OWORD *)&v10.a;
    long long v2 = *(_OWORD *)&v10.c;
    long long v4 = *(_OWORD *)&v10.tx;
  }
  else
  {
    long long v2 = xmmword_10053E020;
    long long v3 = xmmword_10054DC60;
    long long v4 = 0uLL;
  }
  *(_OWORD *)&v10.a = v3;
  *(_OWORD *)&v10.c = v2;
  *(_OWORD *)&v10.tx = v4;
  [a1 setTransform:&v10];
  objc_super v5 = *(void **)&a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
  if (v5)
  {
    id v6 = v5;
    if ([a1 isHighlighted])
    {
      CGAffineTransformMakeScale(&v10, 0.9, 0.9);
      long long v8 = *(_OWORD *)&v10.a;
      long long v7 = *(_OWORD *)&v10.c;
      long long v9 = *(_OWORD *)&v10.tx;
    }
    else
    {
      long long v7 = xmmword_10053E020;
      long long v8 = xmmword_10054DC60;
      long long v9 = 0uLL;
    }
    *(_OWORD *)&v10.a = v8;
    *(_OWORD *)&v10.c = v7;
    *(_OWORD *)&v10.tx = v9;
    [v6 setTransform:&v10];
  }
}

void sub_100524184()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (unsigned __int8 *)Strong;
    long long v2 = (unsigned char *)(Strong + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isTapToToggleEnabled);
    swift_beginAccess();
    if (*v2 == 1)
    {
      [v1 sendActionsForControlEvents:0x10000];
      int v3 = v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode];
      v1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] = 2 * (v3 != 2);
      sub_100521544(v3);
      [v1 sendActionsForControlEvents:4096];
      [v1 sendActionsForControlEvents:0x40000];
    }
  }
}

double sub_100524324()
{
  double result = 0.0;
  xmmword_100679068 = 0u;
  *(_OWORD *)&qword_100679078 = 0u;
  return result;
}

BOOL sub_100524338(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

void sub_100524374(double a1, double a2, double a3, double a4)
{
  objc_super v5 = v4;
  sub_10000BB04(&qword_100678A80);
  __chkstk_darwin();
  double v11 = (char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v12 = (float64x2_t *)&v4[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange];
  if (*(double *)&v4[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange] != a1
    || *(double *)&v4[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 8] != a2
    || *(double *)&v4[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 16] != a3
    || *(double *)&v4[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 24] != a4)
  {
    id v16 = sub_10051E3B4();
    if (qword_100670868 != -1) {
      swift_once();
    }
    sub_100535C70();
    uint64_t v17 = sub_100535CE0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
    sub_100535CF0();

    float64x2_t v18 = *v12;
    float64x2_t v19 = v12[1];
    if (qword_100670838 != -1)
    {
      float64x2_t v90 = *v12;
      float64x2_t v89 = v19;
      swift_once();
      float64x2_t v19 = v89;
      float64x2_t v18 = v90;
    }
    if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v18, (float64x2_t)xmmword_100679068), (int32x4_t)vceqq_f64(v19, *(float64x2_t *)&qword_100679078))), 0xFuLL))))
    {
      id v75 = sub_10051E3B4();
      [v75 anchorPoint];
      double v77 = v76;
      double v79 = v78;

      int v80 = (double *)CGPoint.center.unsafeMutableAddressor();
      swift_beginAccess();
      if (v77 != *v80 || v79 != v80[1])
      {
        id v81 = sub_10051E3B4();
        swift_beginAccess();
        [v81 setAnchorPoint:*v80, v80[1]];

        id v82 = sub_10051E3B4();
        [v5 bounds];
        [v82 setFrame:];
      }
      uint64_t v83 = &v5[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_stretchTransform];
      *(void *)uint64_t v83 = 0x3FF0000000000000;
      *((void *)v83 + 1) = 0;
      *((void *)v83 + 2) = 0;
      *((void *)v83 + 3) = 0x3FF0000000000000;
      *((void *)v83 + 4) = 0;
      *((void *)v83 + 5) = 0;
      id v84 = sub_10051E3B4();
      long long v85 = *((_OWORD *)v83 + 1);
      *(_OWORD *)&aBlock.a = *(_OWORD *)v83;
      *(_OWORD *)&aBlock.c = v85;
      *(_OWORD *)&aBlock.tx = *((_OWORD *)v83 + 2);
      [v84 setTransform:&aBlock];

      double v86 = *(void **)&v5[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
      if (v86)
      {
        long long v87 = *((_OWORD *)v83 + 1);
        *(_OWORD *)&aBlock.a = *(_OWORD *)v83;
        *(_OWORD *)&aBlock.c = v87;
        *(_OWORD *)&aBlock.tx = *((_OWORD *)v83 + 2);
        CGAffineTransformInvert(&v94, &aBlock);
        CGAffineTransform aBlock = v94;
        [v86 setTransform:&aBlock];
      }
      id v88 = sub_10051E3B4();
      [v5 bounds];
      [v88 setFrame:];
    }
    else
    {
      id v20 = self;
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = v5;
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = sub_100525E84;
      *(void *)(v22 + 24) = v21;
      *(void *)&aBlock.tx = sub_1001BA934;
      *(void *)&aBlock.ty = v22;
      *(void *)&aBlock.a = _NSConcreteStackBlock;
      *(void *)&aBlock.b = 1107296256;
      *(void *)&aBlock.c = sub_1001F5E38;
      *(void *)&aBlock.d = &unk_10063CEE0;
      long long v23 = _Block_copy(&aBlock);
      CGAffineTransform v24 = v5;
      swift_retain();
      swift_release();
      [v20 performWithoutAnimation:v23];
      _Block_release(v23);
      char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if (isEscapingClosureAtFileLocation)
      {
        __break(1u);
      }
      else
      {
        id v26 = sub_10051E468();
        [v26 frame];
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;

        v96.origin.x = v28;
        v96.origin.y = v30;
        v96.size.width = v32;
        v96.size.height = v34;
        CGFloat v35 = CGRectGetWidth(v96) + v12->f64[1];
        id v36 = sub_10051E468();
        [v36 frame];
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        CGFloat v44 = v43;

        v97.origin.x = v38;
        v97.origin.y = v40;
        v97.size.width = v42;
        v97.size.height = v44;
        CGFloat v45 = v35 / CGRectGetWidth(v97);
        id v46 = sub_10051E468();
        [v46 frame];
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        CGFloat v52 = v51;
        CGFloat v54 = v53;

        v98.origin.x = v48;
        v98.origin.y = v50;
        v98.size.width = v52;
        v98.size.height = v54;
        CGFloat v55 = CGRectGetHeight(v98) + v12->f64[0];
        id v56 = sub_10051E468();
        [v56 frame];
        CGFloat v58 = v57;
        CGFloat v60 = v59;
        CGFloat v62 = v61;
        CGFloat v64 = v63;

        v99.origin.x = v58;
        v99.origin.y = v60;
        v99.size.width = v62;
        v99.size.height = v64;
        CGFloat Height = CGRectGetHeight(v99);
        CGAffineTransformMakeScale(&aBlock, v45, v55 / Height);
        long long v66 = *(_OWORD *)&aBlock.a;
        long long v67 = *(_OWORD *)&aBlock.c;
        long long v68 = *(_OWORD *)&aBlock.tx;
        *(_OWORD *)&v94.a = *(_OWORD *)&aBlock.a;
        *(_OWORD *)&v94.c = *(_OWORD *)&aBlock.c;
        CGFloat v69 = -v12[1].f64[1];
        *(_OWORD *)&v94.tx = *(_OWORD *)&aBlock.tx;
        CGAffineTransformMakeTranslation(&aBlock, 0.0, v69);
        static CGAffineTransform.+ infix(_:_:)(&v94, &aBlock, v93);
        uint64_t v70 = &v24[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_stretchTransform];
        *(_OWORD *)uint64_t v70 = v93[0];
        *((_OWORD *)v70 + 1) = v93[1];
        *((_OWORD *)v70 + 2) = v93[2];
        id v71 = sub_10051E3B4();
        CGAffineTransform v92 = *(CGAffineTransform *)v70;
        [v71 setTransform:&v92];

        uint64_t v72 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView;
        uint64_t v73 = *(void **)&v24[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView];
        if (v73)
        {
          CGAffineTransform v92 = *(CGAffineTransform *)v70;
          CGAffineTransformInvert(&v91, &v92);
          CGAffineTransform v92 = v91;
          [v73 setTransform:&v92];
          uint64_t v74 = *(void **)&v24[v72];
          if (v74)
          {
            *(_OWORD *)&v92.a = v66;
            *(_OWORD *)&v92.c = v67;
            *(_OWORD *)&v92.tx = v68;
            CGAffineTransformInvert(&v91, &v92);
            CGAffineTransform v92 = v91;
            [v74 setTransform:&v92];
          }
        }
        swift_release();
      }
    }
  }
}

void sub_100524B04(char *a1)
{
  if (*(double *)&a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange + 24] <= 0.0) {
    long long v2 = CGPoint.topCenter.unsafeMutableAddressor();
  }
  else {
    long long v2 = CGPoint.bottomCenter.unsafeMutableAddressor();
  }
  int v3 = (double *)v2;
  swift_beginAccess();
  double v5 = *v3;
  double v4 = v3[1];
  id v6 = sub_10051E3B4();
  [v6 anchorPoint];
  double v8 = v7;
  double v10 = v9;

  if (v8 != v5 || v10 != v4)
  {
    id v12 = sub_10051E3B4();
    [v12 setAnchorPoint:v5, v4];

    id v13 = sub_10051E3B4();
    [a1 bounds];
    [v13 setFrame:];
  }
}

void sub_100524BF0()
{
  qword_10067C5A0 = 0x4000000000000000;
}

void sub_100524C00()
{
  qword_10067C5A8 = 0x4024000000000000;
}

int64x2_t sub_100524C10()
{
  int64x2_t result = vdupq_n_s64(0x4042000000000000uLL);
  static VerticalToggleSlider.DesignSpecs.size = (__int128)result;
  return result;
}

double static VerticalToggleSlider.DesignSpecs.size.getter()
{
  return sub_1003AC0B4(&qword_100670850, (uint64_t)&static VerticalToggleSlider.DesignSpecs.size);
}

double sub_100524C4C()
{
  double result = 36.0;
  static VerticalToggleSlider.DesignSpecs.expandedSize = xmmword_10054DF20;
  return result;
}

double static VerticalToggleSlider.DesignSpecs.expandedSize.getter()
{
  return sub_1003AC0B4(&qword_100670858, (uint64_t)&static VerticalToggleSlider.DesignSpecs.expandedSize);
}

int64x2_t sub_100524C88()
{
  int64x2_t result = vdupq_n_s64(0x404A000000000000uLL);
  static VerticalToggleSlider.DesignSpecs.minimumTapArea = (__int128)result;
  return result;
}

double static VerticalToggleSlider.DesignSpecs.minimumTapArea.getter()
{
  return sub_1003AC0B4(&qword_100670860, (uint64_t)&static VerticalToggleSlider.DesignSpecs.minimumTapArea);
}

void sub_100524CC4()
{
  qword_10067C5E0 = 0x4024000000000000;
}

id sub_100524CD4()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:465.0 damping:21.0 initialVelocity:0.0];
  qword_100679088 = (uint64_t)result;
  return result;
}

id sub_100524D24()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:300.0 damping:40.0 initialVelocity:0.0];
  qword_100679090 = (uint64_t)result;
  return result;
}

id sub_100524D78()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:194.0 damping:24.0 initialVelocity:0.0];
  qword_100679098 = (uint64_t)result;
  return result;
}

id sub_100524DC8()
{
  id v0 = objc_allocWithZone((Class)CAMediaTimingFunction);
  LODWORD(v1) = 1051931443;
  LODWORD(v2) = 0.25;
  LODWORD(v3) = 1.0;
  id result = [v0 initWithControlPoints:v1 :0.0 :v2 :v3];
  qword_1006790A0 = (uint64_t)result;
  return result;
}

id sub_100524E14()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:158.0 damping:25.0 initialVelocity:0.0];
  qword_1006790A8 = (uint64_t)result;
  return result;
}

id sub_100524E64()
{
  id v0 = objc_allocWithZone((Class)CAMediaTimingFunction);
  LODWORD(v1) = 1051931443;
  LODWORD(v2) = 1.0;
  LODWORD(v3) = 1.0;
  id result = [v0 initWithControlPoints:v2 :0.0 :v1 :v3];
  qword_1006790B0 = (uint64_t)result;
  return result;
}

id sub_100524EB0()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:288.0 damping:26.5 initialVelocity:0.0];
  qword_1006790B8 = (uint64_t)result;
  return result;
}

id sub_100524F04()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:300.0 damping:40.0 initialVelocity:0.0];
  qword_1006790C0 = (uint64_t)result;
  return result;
}

id sub_100524F58()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:2.0 stiffness:500.0 damping:40.0 initialVelocity:0.0];
  qword_1006790C8 = (uint64_t)result;
  return result;
}

id sub_100524FAC()
{
  id result = [objc_allocWithZone((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:300.0 damping:40.0 initialVelocity:0.0];
  qword_1006790D0 = (uint64_t)result;
  return result;
}

id VerticalToggleSlider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  return [super dealloc];
}

void VerticalToggleSlider.accessibilitySetSliderValue(_:)(double a1)
{
  float v2 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
  float v3 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
  if (v2 > v3)
  {
    __break(1u);
  }
  else
  {
    float v4 = a1;
    if (v2 > v4) {
      float v4 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
    }
    if (v3 < v4) {
      float v4 = *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
    }
    sub_10051E524(*(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange)+ (float)((float)((float)(v4 - v2) / (float)(v3 - v2))* (float)(*(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange + 4)- *(float *)(v1 + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange))));
    sub_100520154();
  }
}

uint64_t type metadata accessor for VerticalToggleSlider()
{
  return self;
}

uint64_t sub_1005252C8()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

void sub_100525300()
{
}

void sub_100525308()
{
}

void sub_10052532C(char *a1)
{
  id v2 = sub_10051E468();
  float v3 = &a1[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growAnchorPoint];
  swift_beginAccess();
  uint64_t v4 = *v3;
  id v5 = [a1 traitCollection];
  *(void *)&double v6 = sub_100520928(v5, v4).n128_u64[0];
  double v8 = v7;

  [v2 setAnchorPoint:v6, v8];
}

id sub_1005253DC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, double a7, double a8)
{
  id v16 = self;
  [v16 begin];
  [v16 setAnimationTimingFunction:a1];
  long long v23 = a3;
  uint64_t v24 = a4;
  float64x2_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_1001CB5A0;
  uint64_t v22 = &unk_10063D390;
  uint64_t v17 = _Block_copy(&v19);
  swift_retain();
  swift_release();
  if (a5)
  {
    long long v23 = a5;
    uint64_t v24 = a6;
    float64x2_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 1107296256;
    uint64_t v21 = sub_100359584;
    uint64_t v22 = &unk_10063D3B8;
    a5 = _Block_copy(&v19);
    swift_retain();
    swift_release();
  }
  [self animateWithDuration:a2 delay:v17 options:a5 animations:a7 completion:a8];
  _Block_release(a5);
  _Block_release(v17);
  return [v16 commit];
}

void _s11MusicCoreUI20VerticalToggleSliderC5coderACSgSo7NSCoderC_tcfc_0()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition];
  _OWORD *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  uint64_t v2 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_minLevelOffsetRatio;
  if (qword_100670858 != -1) {
    swift_once();
  }
  double v3 = 1.0 / *((double *)&static VerticalToggleSlider.DesignSpecs.expandedSize + 1);
  if (qword_100670848 != -1) {
    swift_once();
  }
  float v4 = v3 * *(double *)&qword_10067C5A8;
  *(float *)&v0[v2] = v4;
  id v5 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_interactionScaleFactor];
  *(void *)id v5 = 0;
  v5[8] = 1;
  v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isTapToToggleEnabled] = 1;
  v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isVisuallyDisabled] = 0;
  v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_isContinuous] = 1;
  v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue] = 1;
  v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressMode] = 1;
  v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growAnchorPoint] = 8;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___stretchView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___growView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValueRange] = 0x3F80000000000000;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_internalValue] = 1065353216;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue] = 1065353216;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___feedbackGenerator] = 0;
  v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode] = 2;
  uint64_t v6 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_blurEffect;
  if (qword_100670830 != -1) {
    swift_once();
  }
  *(void *)&v0[v6] = [self effectWithBlurRadius:*(double *)&qword_100679060];
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___visualEffectView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___levelView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_sceneActivationObserver] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressGestureRecognizer] = 0;
  double v7 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialDraggingLocation];
  *(void *)double v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  *(_DWORD *)&v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_initialValue] = 0;
  uint64_t v8 = OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_shapeChange;
  if (qword_100670838 != -1) {
    swift_once();
  }
  double v9 = &v0[v8];
  long long v10 = *(_OWORD *)&qword_100679078;
  *double v9 = xmmword_100679068;
  v9[1] = v10;
  double v11 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_stretchTransform];
  *double v11 = 0x3FF0000000000000;
  v11[1] = 0;
  v11[2] = 0;
  v11[3] = 0x3FF0000000000000;
  v11[4] = 0;
  v11[5] = 0;
  id v12 = &v0[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_growTransform];
  *id v12 = 0x3FF0000000000000;
  v12[1] = 0;
  v12[2] = 0;
  v12[3] = 0x3FF0000000000000;
  v12[4] = 0;
  v12[5] = 0;

  sub_1005363F0();
  __break(1u);
}

BOOL _s11MusicCoreUI20VerticalToggleSliderC5point6inside4withSbSo7CGPointV_So7UIEventCSgtF_0(CGFloat a1, CGFloat a2)
{
  [v2 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (qword_100670860 != -1) {
    swift_once();
  }
  double v13 = *(double *)&static VerticalToggleSlider.DesignSpecs.minimumTapArea;
  if (qword_100670850 != -1) {
    swift_once();
  }
  double v14 = v13 - *(double *)&static VerticalToggleSlider.DesignSpecs.size;
  if (v13 - *(double *)&static VerticalToggleSlider.DesignSpecs.size < 0.0) {
    double v14 = 0.0;
  }
  double v15 = *((double *)&static VerticalToggleSlider.DesignSpecs.minimumTapArea + 1)
      - *((double *)&static VerticalToggleSlider.DesignSpecs.size + 1);
  if (*((double *)&static VerticalToggleSlider.DesignSpecs.minimumTapArea + 1)
     - *((double *)&static VerticalToggleSlider.DesignSpecs.size + 1) < 0.0)
    double v15 = 0.0;
  CGFloat v16 = -v14;
  CGFloat v17 = -v15;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  CGRect v21 = CGRectInset(v20, v16, v17);
  v19.x = a1;
  v19.y = a2;
  return CGRectContainsPoint(v21, v19);
}

void sub_1005259C8()
{
}

unint64_t sub_1005259D4()
{
  unint64_t result = qword_1006791B8;
  if (!qword_1006791B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1006791B8);
  }
  return result;
}

unint64_t sub_100525A2C()
{
  unint64_t result = qword_1006791C0;
  if (!qword_1006791C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1006791C0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for VerticalToggleSlider.LongPressMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100525B4CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalToggleSlider.LongPressMode()
{
  return &type metadata for VerticalToggleSlider.LongPressMode;
}

unsigned char *storeEnumTagSinglePayload for VerticalToggleSlider.AnchorPoint(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100525C50);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalToggleSlider.AnchorPoint()
{
  return &type metadata for VerticalToggleSlider.AnchorPoint;
}

ValueMetadata *type metadata accessor for VerticalToggleSlider.DesignSpecs()
{
  return &type metadata for VerticalToggleSlider.DesignSpecs;
}

ValueMetadata *type metadata accessor for VerticalToggleSlider.ShapeChange()
{
  return &type metadata for VerticalToggleSlider.ShapeChange;
}

uint64_t getEnumTagSinglePayload for VerticalToggleSlider.Mode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    unsigned int v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 2;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x100525D64);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 2;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 2;
  unsigned int v9 = (v7 + 2147483646) & 0x7FFFFFFF;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for VerticalToggleSlider.Mode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFE) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v7 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x100525E4CLL);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalToggleSlider.Mode()
{
  return &type metadata for VerticalToggleSlider.Mode;
}

void sub_100525E84()
{
  sub_100524B04(*(char **)(v0 + 16));
}

uint64_t sub_100525E8C()
{
  return swift_deallocObject();
}

uint64_t sub_100525E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100525EAC()
{
  return swift_release();
}

uint64_t sub_100525EB4()
{
  return swift_deallocObject();
}

uint64_t sub_100525EF4()
{
  return sub_100523934(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100525EFC()
{
  sub_100524078(*(char **)(v0 + 16));
}

uint64_t sub_100525F04()
{
  return swift_deallocObject();
}

void sub_100525F3C()
{
  sub_1005234C8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_100525F48()
{
  sub_1005237B0(*(unsigned __int8 **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_100525F54()
{
  return swift_deallocObject();
}

void sub_100525F8C()
{
  sub_100522FC0(*(void *)(v0 + 16));
}

uint64_t sub_100525F94()
{
  return swift_deallocObject();
}

void sub_100525FCC()
{
  sub_1005230A4(*(unsigned char *)(v0 + 16), *(char **)(v0 + 24));
}

void sub_100525FD8()
{
}

void sub_100526000()
{
  sub_1005233F8(*(unsigned __int8 **)(v0 + 16));
}

void sub_100526008()
{
  sub_1005228D8(*(char **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_100526014()
{
  sub_100522D24(*(unsigned __int8 **)(v0 + 16));
}

uint64_t sub_10052601C()
{
  return sub_100522E28(*(void **)(v0 + 16));
}

void sub_100526024()
{
}

void sub_10052602C()
{
}

uint64_t sub_100526068(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v2 = *(void *)(a1 + 88);
  unsigned int v3 = *(void **)(a1 + 96);
  sub_10041A59C(*(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16));
  sub_10041A59C(v5, v2, v3);
  return a1;
}

Swift::Int sub_1005261C4()
{
  return sub_1005369A0();
}

void *sub_10052626C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    unint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    unint64_t result = (void *)sub_1005362C0();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100536210();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      id v7 = [v5 layer];

      sub_100536290();
      sub_1005362D0();
      sub_1005362E0();
      sub_1005362A0();
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100536470();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1005263B0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

unint64_t WaveformPlayIndicator.__allocating_init(settings:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return WaveformPlayIndicator.init(settings:)(a1);
}

unint64_t WaveformPlayIndicator.init(settings:)(void *a1)
{
  double v33 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v32 = sub_10000BB04(&qword_1006754B0);
  uint64_t v2 = *(void *)(v32 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode] = 0;
  id v5 = &v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette];
  uint64_t v6 = self;
  unint64_t v7 = v1;
  id v31 = [v6 tintColor];
  id v8 = [v6 labelColor];
  id v9 = [v8 colorWithAlphaComponent:0.35];

  id v10 = [v6 labelColor];
  id v11 = [v10 colorWithAlphaComponent:0.2];

  id v12 = [v6 labelColor];
  id v13 = [v12 colorWithAlphaComponent:0.6];

  *id v5 = v31;
  v5[1] = v9;
  v5[2] = v11;
  v5[3] = v13;
  uint64_t v14 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_waveform;
  *(void *)(v7 + v14) = [self zero];
  *(void *)(v7 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation) = 0;
  *(void *)(v7 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_pulseTask) = 0;
  *(void *)(v7 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_barRatio) = 0x3FE0000000000000;
  double v15 = (char *)(v7 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator__isVisible);
  char v36 = 0;
  sub_100530CE0();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v15, v4, v32);
  *(void *)(v7 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator____lazy_storage___bars) = 0;
  uint64_t v16 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_cannedAnimationAsset;
  type metadata accessor for BouncyBarsAsset();
  swift_allocObject();
  *(void *)(v7 + v16) = sub_10052C124();
  CGFloat v17 = v33;
  *(void *)(v7 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_settings) = v33;
  id v18 = v17;
  id v19 = [v18 stops];
  sub_100123DA4(0, &qword_100671640);
  unint64_t v20 = sub_1005350E0();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100536470();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v22 = (objc_class *)ObjectType;
  if (__OFSUB__(v21, 1))
  {
    __break(1u);
  }
  else
  {
    *(void *)(v7 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_numberOfBars) = v21 - 1;

    v35.receiver = (id)v7;
    v35.super_class = v22;
    unint64_t v20 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
    unint64_t result = sub_100526904();
    unint64_t v7 = result;
    if (!(result >> 62))
    {
      uint64_t v24 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v24) {
        goto LABEL_6;
      }
LABEL_15:
      swift_bridgeObjectRelease();
      sub_10000BB04(&qword_100672A70);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_10053A3B0;
      *(void *)(v28 + 32) = sub_100530A60();
      *(void *)(v28 + 40) = &protocol witness table for UITraitActiveAppearance;
      id v29 = (id)v20;
      sub_100535D10();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      return (unint64_t)v29;
    }
  }
  unint64_t result = sub_100536470();
  uint64_t v24 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_6:
  if (v24 >= 1)
  {
    uint64_t v25 = 0;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        id v26 = (id)sub_100536210();
      }
      else {
        id v26 = *(id *)(v7 + 8 * v25 + 32);
      }
      double v27 = v26;
      ++v25;
      [(id)v20 addSubview:v26];
      [v27 setAlpha:0.0];
    }
    while (v24 != v25);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_100526904()
{
  uint64_t v1 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator____lazy_storage___bars;
  if (*(void *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator____lazy_storage___bars))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator____lazy_storage___bars);
  }
  else
  {
    sub_10052B5E0();
    uint64_t v2 = v3;
    *(void *)(v0 + v1) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_100526968()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode);
  uint64_t result = swift_beginAccess();
  switch(*v1)
  {
    case 1:
      uint64_t v3 = v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette;
      swift_beginAccess();
      id v4 = *(id *)(v3 + 8);
      unint64_t v5 = sub_100526904();
      unint64_t v6 = v5;
      if (v5 >> 62)
      {
        uint64_t v7 = sub_100536470();
        if (v7) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v7)
        {
LABEL_4:
          if (v7 >= 1)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if ((v6 & 0xC000000000000001) != 0) {
                id v9 = (id)sub_100536210();
              }
              else {
                id v9 = *(id *)(v6 + 8 * i + 32);
              }
              id v10 = v9;
              [v9 setBackgroundColor:v4];
            }
            goto LABEL_31;
          }
          __break(1u);
          goto LABEL_33;
        }
      }
      goto LABEL_31;
    case 2:
      id v11 = (id *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette);
      swift_beginAccess();
      id v4 = *v11;
      unint64_t v12 = sub_100526904();
      unint64_t v13 = v12;
      if (v12 >> 62)
      {
        uint64_t v14 = sub_100536470();
        if (v14)
        {
LABEL_12:
          if (v14 >= 1)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if ((v13 & 0xC000000000000001) != 0) {
                id v16 = (id)sub_100536210();
              }
              else {
                id v16 = *(id *)(v13 + 8 * j + 32);
              }
              CGFloat v17 = v16;
              [v16 setBackgroundColor:v4];
            }
            goto LABEL_31;
          }
LABEL_33:
          __break(1u);
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v14) {
          goto LABEL_12;
        }
      }
      goto LABEL_31;
    case 3:
      id v18 = (id *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette);
      swift_beginAccess();
      id v4 = *v18;
      unint64_t v19 = sub_100526904();
      unint64_t v20 = v19;
      if (v19 >> 62)
      {
        uint64_t v21 = sub_100536470();
        if (v21)
        {
LABEL_20:
          if (v21 >= 1)
          {
            for (uint64_t k = 0; k != v21; ++k)
            {
              if ((v20 & 0xC000000000000001) != 0) {
                id v23 = (id)sub_100536210();
              }
              else {
                id v23 = *(id *)(v20 + 8 * k + 32);
              }
              uint64_t v24 = v23;
              [v23 setBackgroundColor:v4];
            }
            goto LABEL_31;
          }
LABEL_34:
          __break(1u);
          JUMPOUT(0x100526C30);
        }
      }
      else
      {
        uint64_t v21 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v21) {
          goto LABEL_20;
        }
      }
LABEL_31:

      return swift_bridgeObjectRelease();
    default:
      return result;
  }
}

void sub_100526C70(unsigned __int8 a1, unsigned __int8 a2)
{
  unsigned __int8 v4 = a1;
  if (a1 == a2 && (a1 != 3 || (sub_1005285F4() & 1) != 0)) {
    return;
  }
  unint64_t v5 = sub_100526904();
  type metadata accessor for AnimationGroup();
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = (char *)_swiftEmptyArrayStorage;
  *(void *)(v6 + 16) = _swiftEmptyArrayStorage;
  *(void *)(v6 + 24) = _swiftEmptyArrayStorage;
  uint64_t v8 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_pulseTask;
  if (*(void *)&v2[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_pulseTask])
  {
    swift_retain();
    sub_100535360();
    swift_release();
  }
  *(void *)&v2[v8] = 0;
  swift_release();
  if (v4 == 3) {
    sub_100528908();
  }
  unsigned __int8 v93 = a2;
  if (a2 == 1)
  {
    id v22 = [objc_allocWithZone((Class)UICubicTimingParameters) initWithControlPoint1:0.33 controlPoint2:1.0];
    id v23 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v22 timingParameters:0.9];

    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v2;
    double v100 = sub_10052E484;
    uint64_t v101 = v24;
    CGAffineTransform aBlock = _NSConcreteStackBlock;
    uint64_t v97 = 1107296256;
    CGRect v98 = sub_1001CB5A0;
    CGRect v99 = &unk_10063D878;
    uint64_t v25 = _Block_copy(&aBlock);
    swift_retain_n();
    id v26 = v2;
    swift_release();
    [v23 addAnimations:v25];
    _Block_release(v25);
    swift_release();
    id v27 = v23;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v6 + 16) = _swiftEmptyArrayStorage;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_1003D8708(0, _swiftEmptyArrayStorage[2] + 1, 1, (char *)_swiftEmptyArrayStorage);
      *(void *)(v6 + 16) = v7;
    }
    unint64_t v30 = *((void *)v7 + 2);
    unint64_t v29 = *((void *)v7 + 3);
    if (v30 >= v29 >> 1)
    {
      uint64_t v7 = sub_1003D8708((char *)(v29 > 1), v30 + 1, 1, v7);
      *(void *)(v6 + 16) = v7;
    }
    *((void *)v7 + 2) = v30 + 1;
    id v31 = &v7[16 * v30];
    *((void *)v31 + 4) = v27;
    *((void *)v31 + 5) = 0;

    swift_release();
  }
  else if (a2 == 4)
  {
    id v9 = [objc_allocWithZone((Class)UICubicTimingParameters) initWithControlPoint1:0.5 controlPoint2:0.89];
    id v10 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v9 timingParameters:0.25];

    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v2;
    double v100 = sub_10052E48C;
    uint64_t v101 = v11;
    CGAffineTransform aBlock = _NSConcreteStackBlock;
    uint64_t v97 = 1107296256;
    CGRect v98 = sub_1001CB5A0;
    CGRect v99 = &unk_10063D8C8;
    unint64_t v12 = _Block_copy(&aBlock);
    unint64_t v13 = v2;
    swift_release();
    [v10 addAnimations:v12];
    _Block_release(v12);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    *(unsigned char *)(v14 + 24) = 4;
    double v100 = sub_10052E494;
    uint64_t v101 = v14;
    CGAffineTransform aBlock = _NSConcreteStackBlock;
    uint64_t v97 = 1107296256;
    CGRect v98 = sub_1005263B0;
    CGRect v99 = &unk_10063D918;
    double v15 = _Block_copy(&aBlock);
    id v16 = v13;
    swift_release();
    [v10 addCompletion:v15];
    _Block_release(v15);
    id v17 = v10;
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v6 + 16) = _swiftEmptyArrayStorage;
    if ((v18 & 1) == 0)
    {
      uint64_t v7 = sub_1003D8708(0, _swiftEmptyArrayStorage[2] + 1, 1, (char *)_swiftEmptyArrayStorage);
      *(void *)(v6 + 16) = v7;
    }
    unint64_t v20 = *((void *)v7 + 2);
    unint64_t v19 = *((void *)v7 + 3);
    if (v20 >= v19 >> 1)
    {
      uint64_t v7 = sub_1003D8708((char *)(v19 > 1), v20 + 1, 1, v7);
      *(void *)(v6 + 16) = v7;
    }
    *((void *)v7 + 2) = v20 + 1;
    uint64_t v21 = &v7[16 * v20];
    *((void *)v21 + 4) = v17;
    *((void *)v21 + 5) = 0;
  }
  if (v4)
  {
    int v32 = a2;
    if (a2)
    {
LABEL_22:
      if (v32 == 2)
      {
        swift_bridgeObjectRelease();
        unsigned __int8 v70 = v4;
        id v71 = [objc_allocWithZone((Class)UICubicTimingParameters) initWithControlPoint1:0.5 controlPoint2:0.89];
        id v72 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v71 timingParameters:0.15];

        uint64_t v73 = swift_allocObject();
        *(void *)(v73 + 16) = v2;
        *(unsigned char *)(v73 + 24) = v70;
        double v100 = sub_10052E3E4;
        uint64_t v101 = v73;
        CGAffineTransform aBlock = _NSConcreteStackBlock;
        uint64_t v97 = 1107296256;
        CGRect v98 = sub_1001CB5A0;
        CGRect v99 = &unk_10063D788;
        uint64_t v74 = _Block_copy(&aBlock);
        swift_retain_n();
        id v75 = v2;
        swift_release();
        [v72 addAnimations:v74];
        _Block_release(v74);
        swift_release();
        double v76 = *(char **)(v6 + 16);
        id v77 = v72;
        char v78 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v6 + 16) = v76;
        if ((v78 & 1) == 0)
        {
          double v76 = sub_1003D8708(0, *((void *)v76 + 2) + 1, 1, v76);
          *(void *)(v6 + 16) = v76;
        }
        unint64_t v80 = *((void *)v76 + 2);
        unint64_t v79 = *((void *)v76 + 3);
        if (v80 >= v79 >> 1)
        {
          double v76 = sub_1003D8708((char *)(v79 > 1), v80 + 1, 1, v76);
          *(void *)(v6 + 16) = v76;
        }
        *((void *)v76 + 2) = v80 + 1;
        id v81 = &v76[16 * v80];
        *((void *)v81 + 4) = v77;
        *((void *)v81 + 5) = 0;

        swift_release();
      }
      else
      {
        if (v32 == 3)
        {
          id v33 = [objc_allocWithZone((Class)UICubicTimingParameters) initWithControlPoint1:0.5 controlPoint2:0.89];
          id v34 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v33 timingParameters:0.15];

          uint64_t v35 = swift_allocObject();
          *(void *)(v35 + 16) = v2;
          double v100 = sub_10052E3F0;
          uint64_t v101 = v35;
          CGAffineTransform aBlock = _NSConcreteStackBlock;
          uint64_t v97 = 1107296256;
          CGRect v98 = sub_1001CB5A0;
          CGRect v99 = &unk_10063D7D8;
          char v36 = _Block_copy(&aBlock);
          swift_retain_n();
          double v37 = v2;
          swift_release();
          [v34 addAnimations:v36];
          _Block_release(v36);
          swift_release();
          CGFloat v38 = *(char **)(v6 + 16);
          id v39 = v34;
          char v40 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v6 + 16) = v38;
          if ((v40 & 1) == 0)
          {
            CGFloat v38 = sub_1003D8708(0, *((void *)v38 + 2) + 1, 1, v38);
            *(void *)(v6 + 16) = v38;
          }
          unint64_t v42 = *((void *)v38 + 2);
          unint64_t v41 = *((void *)v38 + 3);
          if (v42 >= v41 >> 1)
          {
            CGFloat v38 = sub_1003D8708((char *)(v41 > 1), v42 + 1, 1, v38);
            *(void *)(v6 + 16) = v38;
          }
          *((void *)v38 + 2) = v42 + 1;
          double v43 = &v38[16 * v42];
          *((void *)v43 + 4) = v39;
          *((void *)v43 + 5) = 0;

          swift_release();
        }
        swift_bridgeObjectRelease();
      }
      goto LABEL_53;
    }
  }
  else
  {
    unsigned __int8 v92 = v4;
    uint64_t v95 = v6;
    unint64_t v44 = swift_bridgeObjectRetain();
    unint64_t v91 = v5;
    sub_1005292A0(v44);
    uint64_t v46 = v45;
    sub_100528D04();
    uint64_t v94 = *(void *)(v46 + 16);
    if (v94)
    {
      uint64_t v47 = 0;
      CGFloat v48 = (void **)(v46 + 40);
      do
      {
        CGFloat v50 = *(v48 - 1);
        double v49 = *v48;
        id v51 = objc_allocWithZone((Class)UICubicTimingParameters);
        id v52 = v49;
        id v53 = v50;
        id v54 = [v51 initWithControlPoint1:0.32 controlPoint2:0.0, 0.67, 0.0];
        id v55 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v54 timingParameters:0.5];

        uint64_t v56 = swift_allocObject();
        *(void *)(v56 + 16) = v53;
        *(void *)(v56 + 24) = v49;
        double v100 = sub_10052E438;
        uint64_t v101 = v56;
        CGAffineTransform aBlock = _NSConcreteStackBlock;
        uint64_t v97 = 1107296256;
        CGRect v98 = sub_1001CB5A0;
        CGRect v99 = &unk_10063D828;
        double v57 = _Block_copy(&aBlock);
        swift_retain_n();
        id v58 = v53;
        id v59 = v52;
        swift_release();
        [v55 addAnimations:v57];
        _Block_release(v57);
        swift_release();
        CGFloat v60 = *(char **)(v95 + 16);
        id v61 = v55;
        char v62 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v95 + 16) = v60;
        if ((v62 & 1) == 0)
        {
          CGFloat v60 = sub_1003D8708(0, *((void *)v60 + 2) + 1, 1, v60);
          *(void *)(v95 + 16) = v60;
        }
        unint64_t v64 = *((void *)v60 + 2);
        unint64_t v63 = *((void *)v60 + 3);
        if (v64 >= v63 >> 1)
        {
          CGFloat v60 = sub_1003D8708((char *)(v63 > 1), v64 + 1, 1, v60);
          *(void *)(v95 + 16) = v60;
        }
        v48 += 2;
        *((void *)v60 + 2) = v64 + 1;
        double v65 = &v60[16 * v64];
        *((void *)v65 + 4) = v61;
        *((double *)v65 + 5) = (double)v47 * 0.03;

        swift_release();
        ++v47;
      }
      while (v94 != v47);
    }
    swift_bridgeObjectRelease();
    uint64_t v6 = v95;
    unint64_t v5 = v91;
    unsigned __int8 v4 = v92;
    int v32 = v93;
    if (v93) {
      goto LABEL_22;
    }
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_100536470();
    swift_bridgeObjectRelease();
    if (v66) {
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v66 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v66)
    {
LABEL_40:
      if (v66 < 1)
      {
        __break(1u);
        return;
      }
      for (uint64_t i = 0; i != v66; ++i)
      {
        if ((v5 & 0xC000000000000001) != 0) {
          id v68 = (id)sub_100536210();
        }
        else {
          id v68 = *(id *)(v5 + 8 * i + 32);
        }
        CGFloat v69 = v68;
        [v68 setAlpha:0.0];
      }
    }
  }
  swift_bridgeObjectRelease();
  sub_100528D04();
LABEL_53:
  uint64_t v82 = *(void *)&v2[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation];
  if (v82)
  {
    uint64_t v83 = swift_allocObject();
    *(void *)(v83 + 16) = v2;
    *(void *)(v83 + 24) = v6;
    uint64_t v84 = swift_allocObject();
    *(void *)(v84 + 16) = sub_10052E3A4;
    *(void *)(v84 + 24) = v83;
    long long v85 = *(void **)(v82 + 24);
    double v86 = v2;
    swift_retain();
    swift_retain();
    swift_retain();
    char v87 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v82 + 24) = v85;
    if ((v87 & 1) == 0)
    {
      long long v85 = sub_1003D880C(0, v85[2] + 1, 1, v85);
      *(void *)(v82 + 24) = v85;
    }
    unint64_t v89 = v85[2];
    unint64_t v88 = v85[3];
    if (v89 >= v88 >> 1)
    {
      long long v85 = sub_1003D880C((void *)(v88 > 1), v89 + 1, 1, v85);
      *(void *)(v82 + 24) = v85;
    }
    v85[2] = v89 + 1;
    float64x2_t v90 = &v85[2 * v89];
    v90[4] = sub_1001BA934;
    v90[5] = v84;
    swift_release();
    swift_release();
  }
  else
  {
    sub_10052B9D0();
  }
  swift_release();
}

uint64_t WaveformPlayIndicator.mode.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode);
  swift_beginAccess();
  return *v1;
}

void WaveformPlayIndicator.mode.setter(unsigned __int8 a1)
{
  uint64_t v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode);
  swift_beginAccess();
  unsigned __int8 v4 = *v3;
  *uint64_t v3 = a1;
  sub_100526C70(v4, a1);
}

void (*WaveformPlayIndicator.mode.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode;
  v3[3] = v1;
  v3[4] = v4;
  unint64_t v5 = (unsigned char *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 40) = *v5;
  return sub_100527A7C;
}

void sub_100527A7C(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v2 = *(void *)(*(void *)a1 + 32);
  unsigned __int8 v4 = *(unsigned char *)(v3 + v2);
  unsigned __int8 v5 = v1[40];
  *(unsigned char *)(v3 + v2) = v5;
  sub_100526C70(v4, v5);

  free(v1);
}

uint64_t type metadata accessor for BouncyBarsAsset()
{
  return self;
}

void sub_100527AF0()
{
  uint64_t v0 = self;
  id v1 = [v0 whiteColor];
  id v2 = [v0 whiteColor];
  id v3 = [v0 whiteColor];
  id v4 = [v3 colorWithAlphaComponent:0.2];

  id v5 = [v0 whiteColor];
  id v6 = [v5 colorWithAlphaComponent:0.6];

  static WaveformPlayIndicator.ColorPalette.overlay = (uint64_t)v1;
  unk_10067C5F0 = v2;
  qword_10067C5F8 = (uint64_t)v4;
  unk_10067C600 = v6;
}

uint64_t *WaveformPlayIndicator.ColorPalette.overlay.unsafeMutableAddressor()
{
  if (qword_1006708C0 != -1) {
    swift_once();
  }
  return &static WaveformPlayIndicator.ColorPalette.overlay;
}

uint64_t static WaveformPlayIndicator.ColorPalette.overlay.getter()
{
  if (qword_1006708C0 != -1) {
    swift_once();
  }
  uint64_t v0 = static WaveformPlayIndicator.ColorPalette.overlay;
  id v1 = (void *)unk_10067C5F0;
  id v2 = (void *)qword_10067C5F8;
  id v3 = (void *)unk_10067C600;
  id v4 = (id)static WaveformPlayIndicator.ColorPalette.overlay;
  id v5 = v1;
  id v6 = v2;
  id v7 = v3;
  return v0;
}

uint64_t static WaveformPlayIndicator.ColorPalette.__derived_struct_equals(_:_:)()
{
  if (sub_100535D90() & 1) != 0 && (sub_100535D90() & 1) != 0 && (sub_100535D90()) {
    return sub_100535D90() & 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_100527D7C()
{
  if (sub_100535D90() & 1) != 0 && (sub_100535D90() & 1) != 0 && (sub_100535D90()) {
    return sub_100535D90() & 1;
  }
  else {
    return 0;
  }
}

void sub_100527E2C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette;
  swift_beginAccess();
  id v2 = *(void **)v1;
  id v3 = *(void **)(v1 + 8);
  id v4 = *(void **)(v1 + 16);
  id v5 = *(void **)(v1 + 24);
  sub_100123DA4(0, (unint64_t *)&qword_1006729F0);
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  if ((sub_100535D90() & 1) == 0 || (sub_100535D90() & 1) == 0 || (sub_100535D90() & 1) == 0)
  {

    goto LABEL_7;
  }
  char v10 = sub_100535D90();

  if ((v10 & 1) == 0) {
LABEL_7:
  }
    sub_100526968();
}

void *WaveformPlayIndicator.colorPalette.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette;
  swift_beginAccess();
  id v2 = *(void **)v1;
  id v3 = *(void **)(v1 + 8);
  id v5 = *(void **)(v1 + 16);
  id v4 = *(void **)(v1 + 24);
  id v6 = v2;
  id v7 = v3;
  id v8 = v5;
  id v9 = v4;
  return v2;
}

void WaveformPlayIndicator.colorPalette.setter(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v9 = v4 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette;
  swift_beginAccess();
  char v10 = *(void **)v9;
  uint64_t v11 = *(void **)(v9 + 8);
  unint64_t v12 = *(void **)(v9 + 16);
  unint64_t v13 = *(void **)(v9 + 24);
  *(void *)uint64_t v9 = a1;
  *(void *)(v9 + 8) = a2;
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  id v14 = a1;
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  sub_100527E2C();
}

void (*WaveformPlayIndicator.colorPalette.modify(void *a1))(void ***a1, char a2)
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette;
  swift_beginAccess();
  id v5 = *(void **)v4;
  id v6 = *(void **)(v4 + 8);
  id v8 = *(void **)(v4 + 16);
  id v7 = *(void **)(v4 + 24);
  *id v3 = v5;
  v3[1] = v6;
  v3[2] = v8;
  v3[3] = v7;
  id v9 = v5;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  return sub_100528148;
}

void sub_100528148(void ***a1, char a2)
{
  id v2 = *a1;
  id v3 = **a1;
  if (a2)
  {
    WaveformPlayIndicator.colorPalette.setter(v3, v2[1], v2[2], v2[3]);
    uint64_t v4 = v2[1];
    id v5 = v2[2];
    id v6 = v2[3];
  }
  else
  {
    WaveformPlayIndicator.colorPalette.setter(v3, v2[1], v2[2], v2[3]);
  }

  free(v2);
}

id WaveformPlayIndicator.waveform.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_waveform);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void WaveformPlayIndicator.waveform.setter(void *a1)
{
  id v3 = (void **)&v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_waveform];
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  id v6 = &v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode];
  swift_beginAccess();
  if (*v6 == 2)
  {
    id v7 = self;
    id v8 = *(void **)&v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_settings];
    [v8 animationDuration];
    double v10 = v9;
    [v8 springDamping];
    double v12 = v11;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v1;
    v16[4] = sub_10052DEB8;
    v16[5] = v13;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_1001CB5A0;
    v16[3] = &unk_10063D408;
    id v14 = _Block_copy(v16);
    id v15 = v1;
    swift_release();
    [v7 animateWithDuration:0 delay:v14 usingSpringWithDamping:0 initialSpringVelocity:v10 options:0.0 animations:v12 completion:0.0];
    _Block_release(v14);
  }
}

void (*WaveformPlayIndicator.waveform.modify(void *a1))(void ****a1, char a2)
{
  id v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[9] = v1;
  swift_beginAccess();
  return sub_100528464;
}

void sub_100528464(void ****a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (char *)v3[9] + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode;
    swift_beginAccess();
    if (*v4 == 2)
    {
      id v5 = v3[9];
      id v6 = self;
      id v7 = *(void **)((char *)v5 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_settings);
      [v7 animationDuration];
      double v9 = v8;
      [v7 springDamping];
      double v11 = v10;
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v5;
      v3[4] = (void **)sub_10052EB34;
      v3[5] = (void **)v12;
      *id v3 = _NSConcreteStackBlock;
      v3[1] = (void **)1107296256;
      v3[2] = (void **)sub_1001CB5A0;
      v3[3] = (void **)&unk_10063D458;
      uint64_t v13 = _Block_copy(v3);
      id v14 = v5;
      swift_release();
      [v6 animateWithDuration:0 delay:v13 usingSpringWithDamping:0 initialSpringVelocity:v9 options:0.0 animations:v11 completion:0.0];
      _Block_release(v13);
    }
  }

  free(v3);
}

uint64_t sub_1005285F4()
{
  unint64_t v0 = sub_100526904();
  unint64_t v1 = v0;
  if (v0 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_100536470())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (v1 & 0xC000000000000001) != 0 ? (id)sub_100536210() : *(id *)(v1 + 8 * v3);
      id v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = [v4 layer];
      NSString v8 = sub_100534CA0();
      swift_bridgeObjectRelease();
      id v9 = [v7 animationForKey:v8];

      if (!v9) {
        goto LABEL_13;
      }
      id v10 = [v5 layer];
      NSString v11 = sub_100534CA0();
      swift_bridgeObjectRelease();
      id v12 = [v10 animationForKey:v11];

      if (!v12
        || (id v13 = [v5 layer],
            NSString v14 = sub_100534CA0(),
            swift_bridgeObjectRelease(),
            id v15 = [v13 animationForKey:v14],
            v15,
            v13,
            v14,
            !v15))
      {
LABEL_13:
        swift_bridgeObjectRelease_n();

        return 0;
      }

      ++v3;
      if (v6 == v2) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
LABEL_12:
  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t sub_100528908()
{
  unint64_t v0 = sub_100526904();
  unint64_t v1 = (unint64_t)sub_10052626C(v0);
  swift_bridgeObjectRelease();
  if (v1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    unint64_t v3 = 0;
    unint64_t v14 = v1 & 0xC000000000000001;
    id v13 = (void *)v1;
    uint64_t v12 = v1 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if (v14)
      {
        id v4 = (id)sub_100536210();
      }
      else
      {
        if (v3 >= *(void *)(v12 + 16)) {
          goto LABEL_13;
        }
        id v4 = *(id *)(v1 + 8 * v3 + 32);
      }
      id v5 = v4;
      if (__OFADD__(v3, 1)) {
        break;
      }
      unint64_t v15 = v3 + 1;
      NSString v6 = sub_100534CA0();
      swift_bridgeObjectRelease();
      [v5 removeAnimationForKey:v6];

      NSString v7 = sub_100534CA0();
      swift_bridgeObjectRelease();
      [v5 removeAnimationForKey:v7];

      NSString v8 = sub_100534CA0();
      swift_bridgeObjectRelease();
      [v5 removeAnimationForKey:v8];

      id v9 = [v5 presentationLayer];
      if (v9)
      {
        id v10 = v9;
        [v9 frame];
        [v5 setFrame:];
        [v10 cornerRadius];
        [v5 setCornerRadius:];
      }
      ++v3;
      unint64_t v1 = (unint64_t)v13;
      if (v15 == v2) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100536470();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_100528BF8(uint64_t a1)
{
  sub_100528D04();
  uint64_t v2 = a1 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette;
  swift_beginAccess();
  id v3 = *(id *)(v2 + 16);
  unint64_t result = sub_100526904();
  unint64_t v5 = result;
  if (!(result >> 62))
  {
    uint64_t v6 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_10:

    return swift_bridgeObjectRelease();
  }
  unint64_t result = sub_100536470();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100536210();
      }
      else {
        id v8 = *(id *)(v5 + 8 * i + 32);
      }
      id v9 = v8;
      [v8 setBackgroundColor:v3];
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

unint64_t sub_100528D04()
{
  [v0 bounds];
  double Width = CGRectGetWidth(v22);
  double v2 = *(double *)&v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_numberOfBars];
  [v0 bounds];
  double v3 = CGRectGetWidth(v23);
  id v4 = &v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode];
  swift_beginAccess();
  if (*v4 == 2)
  {
    unint64_t v5 = (id *)&v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_waveform];
    swift_beginAccess();
    id v6 = *v5;
  }
  else
  {
    id v6 = [self zero];
  }
  id v21 = v6;
  unint64_t result = sub_100526904();
  unint64_t v8 = result;
  if (result >> 62)
  {
LABEL_18:
    unint64_t result = sub_100536470();
    uint64_t v9 = result;
    if (result) {
      goto LABEL_6;
    }
LABEL_19:

    return swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9) {
    goto LABEL_19;
  }
LABEL_6:
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    double v11 = Width / (double)*(uint64_t *)&v2;
    double Width = v11 * 0.5;
    double v12 = v3 / (double)*(uint64_t *)&v2 - v11 * 0.5;
    double v3 = v11 * 0.5 * 0.5;
    double v13 = v12 * 0.5;
    while (1)
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v14 = (id)sub_100536210();
      }
      else {
        id v14 = *(id *)(v8 + 8 * v10 + 32);
      }
      unint64_t v15 = v14;
      double v2 = v13 + v3 + v11 * (double)v10;
      [v0 bounds];
      [v15 setCenter:v2, CGRectGetMidY(v24)];
      id v16 = [v15 layer];
      [v16 setCornerRadius:v11 * 0.5 * 0.5];

      id v17 = [v21 amplitudes];
      sub_100123DA4(0, &qword_100671640);
      uint64_t v18 = sub_1005350E0();

      if ((v18 & 0xC000000000000001) != 0)
      {
        id v19 = (id)sub_100536210();
      }
      else
      {
        if ((unint64_t)v10 >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_18;
        }
        id v19 = *(id *)(v18 + 8 * v10 + 32);
      }
      unint64_t v20 = v19;
      ++v10;
      swift_bridgeObjectRelease();
      [v20 doubleValue];

      [v0 bounds];
      CGRectGetHeight(v25);
      [v15 bounds];
      [v15 setBounds:];
      [v15 bounds];
      [v15 setBounds:];

      if (v9 == v10) {
        goto LABEL_19;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100529030(uint64_t a1, char *a2, char a3)
{
  sub_10000BB04(&qword_100672A60);
  __chkstk_darwin();
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v7 = &a2[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode];
  uint64_t result = swift_beginAccess();
  if (*v7 == a3)
  {
    uint64_t v9 = sub_100535300();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
    sub_1005352C0();
    uint64_t v10 = a2;
    uint64_t v11 = sub_1005352B0();
    double v12 = (void *)swift_allocObject();
    v12[2] = v11;
    v12[3] = &protocol witness table for MainActor;
    v12[4] = v10;
    *(void *)&v10[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_pulseTask] = sub_10040710C((uint64_t)v6, (uint64_t)&unk_1006794E8, (uint64_t)v12);
    return swift_release();
  }
  return result;
}

unint64_t sub_100529194(uint64_t a1)
{
  sub_100528D04();
  uint64_t v2 = a1 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette;
  swift_beginAccess();
  id v3 = *(id *)(v2 + 8);
  unint64_t result = sub_100526904();
  unint64_t v5 = result;
  if (!(result >> 62))
  {
    uint64_t v6 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_10:

    return swift_bridgeObjectRelease();
  }
  unint64_t result = sub_100536470();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100536210();
      }
      else {
        id v8 = *(id *)(v5 + 8 * i + 32);
      }
      uint64_t v9 = v8;
      [v8 setBackgroundColor:v3];
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1005292A0(unint64_t a1)
{
  unint64_t v1 = (void *)sub_10052D318(a1);
  unint64_t v2 = v1[2];
  swift_bridgeObjectRelease();
  if (v2 < 2) {
    return;
  }
  unint64_t v3 = 0;
  unint64_t v4 = v2 >> 1;
  unint64_t v5 = v2 - 1;
  uint64_t v6 = 2 * v2;
  uint64_t v7 = 5;
  unint64_t v21 = v2 >> 1;
  while (1)
  {
    if (v3 == v5) {
      goto LABEL_4;
    }
    unint64_t v8 = v1[2];
    if (v3 >= v8) {
      break;
    }
    if (v5 >= v8) {
      goto LABEL_13;
    }
    uint64_t v9 = (void *)v1[v7 - 1];
    uint64_t v10 = (void *)v1[v7];
    uint64_t v11 = (void *)v1[v6 + 2];
    double v12 = (void *)v1[v6 + 3];
    id v13 = v12;
    id v14 = v9;
    id v15 = v10;
    id v16 = v11;
    id v22 = v14;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v1 = sub_10052CF6C(v1);
    }
    id v17 = &v1[v7];
    uint64_t v18 = (void *)v1[v7];

    *(v17 - 1) = v16;
    *id v17 = v12;
    if (v5 >= v1[2]) {
      goto LABEL_14;
    }
    id v19 = &v1[v6];
    unint64_t v20 = (void *)v1[v6 + 3];

    v19[2] = v22;
    v19[3] = v10;
    unint64_t v4 = v21;
LABEL_4:
    ++v3;
    v7 += 2;
    --v5;
    v6 -= 2;
    if (v4 == v3) {
      return;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
}

void sub_1005293EC(uint64_t a1)
{
  sub_100528D04();
  unint64_t v2 = (id *)(a1 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette);
  swift_beginAccess();
  id v3 = *v2;
  unint64_t v4 = sub_100526904();
  unint64_t v5 = v4;
  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_10:

    swift_bridgeObjectRelease();
    sub_1005294FC();
    return;
  }
  uint64_t v6 = sub_100536470();
  if (!v6) {
    goto LABEL_10;
  }
LABEL_3:
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100536210();
      }
      else {
        id v8 = *(id *)(v5 + 8 * i + 32);
      }
      uint64_t v9 = v8;
      [v8 setBackgroundColor:v3];
    }
    goto LABEL_10;
  }
  __break(1u);
}

void sub_1005294FC()
{
  if (!*(void *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_cannedAnimationAsset)) {
    return;
  }
  swift_retain();
  unint64_t v3 = sub_1001AEDC0(3uLL);
  if (v3 > 2)
  {
    __break(1u);
LABEL_45:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100536470();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_5;
    }
LABEL_46:
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v2 = *((unsigned __int8 *)&off_1006319C8 + v3 + 32);
  unint64_t v4 = sub_100526904();
  unint64_t v1 = (unint64_t)sub_10052626C(v4);
  swift_bridgeObjectRelease();
  if (v1 >> 62) {
    goto LABEL_45;
  }
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5) {
    goto LABEL_46;
  }
LABEL_5:
  if (v5 >= 1)
  {
    unint64_t v6 = 0;
    unsigned int v27 = v2;
    while (1)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v7 = (id)sub_100536210();
      }
      else {
        id v7 = *(id *)(v1 + 8 * v6 + 32);
      }
      id v8 = v7;
      uint64_t v9 = sub_10052C3FC(v2, v6);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = __chkstk_darwin();
        sub_10052D6B0(v11, (void (*)(uint64_t, id))sub_10052E6DC);
        if (!v10[2]
          || (unint64_t v12 = sub_1003D9D00(1), (v13 & 1) == 0)
          || (id v14 = [*(id *)(v10[7] + 8 * v12) values]) == 0)
        {
LABEL_27:
          long long v29 = 0u;
          long long v30 = 0u;
LABEL_28:
          swift_bridgeObjectRelease();
LABEL_29:

          sub_1003CBBB0((uint64_t)&v29);
          goto LABEL_9;
        }
        id v15 = v14;
        uint64_t v16 = sub_1005350E0();

        if (*(void *)(v16 + 16))
        {
          sub_10009B1D4(v16 + 32, (uint64_t)&v29);
        }
        else
        {
          long long v29 = 0u;
          long long v30 = 0u;
        }
        swift_bridgeObjectRelease();
        uint64_t v2 = v27;
        if (!*((void *)&v30 + 1)) {
          goto LABEL_28;
        }
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_7;
        }
        if (!v10[2]) {
          goto LABEL_27;
        }
        unint64_t v17 = sub_1003D9D00(0);
        if ((v18 & 1) == 0) {
          goto LABEL_27;
        }
        id v19 = [*(id *)(v10[7] + 8 * v17) values];
        if (!v19) {
          goto LABEL_27;
        }
        unint64_t v20 = v19;
        uint64_t v21 = sub_1005350E0();

        if (*(void *)(v21 + 16))
        {
          sub_10009B1D4(v21 + 32, (uint64_t)&v29);
        }
        else
        {
          long long v29 = 0u;
          long long v30 = 0u;
        }
        swift_bridgeObjectRelease();
        uint64_t v2 = v27;
        if (!*((void *)&v30 + 1)) {
          goto LABEL_28;
        }
        if (swift_dynamicCast())
        {
          if (!v10[2] || (unint64_t v22 = sub_1003D9D00(2), (v23 & 1) == 0))
          {
            swift_bridgeObjectRelease();
LABEL_39:
            long long v29 = 0u;
            long long v30 = 0u;
            uint64_t v2 = v27;
            goto LABEL_29;
          }
          id v24 = *(id *)(v10[7] + 8 * v22);
          swift_bridgeObjectRelease();
          id v25 = [v24 values];

          if (!v25) {
            goto LABEL_39;
          }
          uint64_t v26 = sub_1005350E0();

          if (*(void *)(v26 + 16))
          {
            sub_10009B1D4(v26 + 32, (uint64_t)&v29);
          }
          else
          {
            long long v29 = 0u;
            long long v30 = 0u;
          }
          uint64_t v2 = v27;
          swift_bridgeObjectRelease();
          if (!*((void *)&v30 + 1)) {
            goto LABEL_29;
          }
          if (swift_dynamicCast())
          {
            [v8 frame];
            [v8 setFrame:];
            [v8 setCornerRadius:v28];
          }
        }
        else
        {
LABEL_7:
          swift_bridgeObjectRelease();
        }
      }

LABEL_9:
      if (v5 == ++v6) {
        goto LABEL_46;
      }
    }
  }
  __break(1u);
}

void sub_100529968(char *a1, char a2)
{
  unint64_t v4 = (id *)&a1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette];
  swift_beginAccess();
  id v5 = *v4;
  unint64_t v6 = sub_100526904();
  unint64_t v7 = v6;
  if (v6 >> 62)
  {
    uint64_t v8 = sub_100536470();
    if (!v8) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v8) {
      goto LABEL_10;
    }
  }
  if (v8 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v8; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v10 = (id)sub_100536210();
    }
    else {
      id v10 = *(id *)(v7 + 8 * i + 32);
    }
    uint64_t v11 = v10;
    [v10 setBackgroundColor:v5];
  }
LABEL_10:

  swift_bridgeObjectRelease();
  if (a2 == 3)
  {
    unint64_t v12 = self;
    char v13 = *(void **)&a1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_settings];
    [v13 animationDuration];
    double v15 = v14;
    [v13 springDamping];
    double v17 = v16;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a1;
    aBlock[4] = sub_10052EB34;
    aBlock[5] = v18;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1001CB5A0;
    aBlock[3] = &unk_10063DAD0;
    id v19 = _Block_copy(aBlock);
    unint64_t v20 = a1;
    swift_release();
    [v12 animateWithDuration:0 delay:v19 usingSpringWithDamping:0 initialSpringVelocity:v15 options:0.0 animations:v17 completion:0.0];
    _Block_release(v19);
  }
}

uint64_t sub_100529B94(char *a1, uint64_t a2)
{
  *(void *)&a1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation] = a2;
  swift_release();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_10052E6E4;
  *(void *)(v5 + 24) = v4;
  unint64_t v6 = *(void **)(a2 + 24);
  swift_retain();
  unint64_t v7 = a1;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 24) = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v6 = sub_1003D880C(0, v6[2] + 1, 1, v6);
    *(void *)(a2 + 24) = v6;
  }
  unint64_t v10 = v6[2];
  unint64_t v9 = v6[3];
  if (v10 >= v9 >> 1)
  {
    unint64_t v6 = sub_1003D880C((void *)(v9 > 1), v10 + 1, 1, v6);
    *(void *)(a2 + 24) = v6;
  }
  uint64_t v6[2] = v10 + 1;
  uint64_t v11 = &v6[2 * v10];
  v11[4] = sub_1001BAC24;
  v11[5] = v5;
  swift_release();
  return sub_10052B9D0();
}

id sub_100529CCC(char *a1)
{
  v3.receiver = a1;
  v3.super_class = (Class)swift_getObjectType();
  [super layoutSubviews];
  if (!*(void *)&a1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation]) {
    return (id)sub_100528D04();
  }
  return result;
}

Swift::Void __swiftcall WaveformPlayIndicator.layoutSubviews()()
{
  v1.receiver = v0;
  v1.super_class = (Class)swift_getObjectType();
  [super layoutSubviews];
  if (!*(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation]) {
    sub_100528D04();
  }
}

uint64_t sub_100529D6C()
{
  objc_super v1 = v0;
  [v0 bounds];
  double Width = CGRectGetWidth(v59);
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_numberOfBars];
  [v0 bounds];
  double Height = CGRectGetHeight(v60);
  uint64_t v5 = &v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette];
  swift_beginAccess();
  unint64_t v6 = (void *)*((void *)v5 + 2);
  unint64_t v7 = (void *)*((void *)v5 + 3);
  type metadata accessor for AnimationGroup();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = _swiftEmptyArrayStorage;
  *(void *)(v8 + 24) = _swiftEmptyArrayStorage;
  uint64_t v52 = v8;
  id v51 = v6;
  id v50 = v7;
  uint64_t v46 = v1;
  unint64_t v9 = sub_100526904();
  unint64_t v10 = v9;
  if (v9 >> 62)
  {
    uint64_t result = sub_100536470();
    if (!result) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t result = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!result) {
      goto LABEL_15;
    }
  }
  if (result < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = 0;
  unint64_t v47 = v10 & 0xC000000000000001;
  double v13 = Width / (double)v3 * 0.5;
  double v14 = Height * 0.7;
  uint64_t v48 = result;
  unint64_t v49 = v10;
  do
  {
    if (v47) {
      id v15 = (id)sub_100536210();
    }
    else {
      id v15 = *(id *)(v10 + 8 * v12 + 32);
    }
    float v16 = v15;
    id v17 = [objc_allocWithZone((Class)UICubicTimingParameters) initWithControlPoint1:0.11 controlPoint2:0.05];
    id v18 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v17 timingParameters:0.25];

    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v16;
    *(void *)(v19 + 24) = v50;
    *(double *)(v19 + 32) = v14;
    double v57 = (id (*)(id))sub_10052E61C;
    uint64_t v58 = v19;
    CGAffineTransform aBlock = _NSConcreteStackBlock;
    uint64_t v54 = 1107296256;
    id v55 = sub_1001CB5A0;
    uint64_t v56 = &unk_10063D990;
    unint64_t v20 = _Block_copy(&aBlock);
    id v21 = v50;
    id v22 = v16;
    swift_release();
    [v18 addAnimations:v20];
    _Block_release(v20);
    id v23 = [objc_allocWithZone((Class)UICubicTimingParameters) initWithControlPoint1:0.11 controlPoint2:0.0 0.5 0.0];
    id v24 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v23 timingParameters:0.25];

    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v22;
    *(void *)(v25 + 24) = v51;
    *(double *)(v25 + 32) = v13;
    double v57 = (id (*)(id))sub_10052E61C;
    uint64_t v58 = v25;
    CGAffineTransform aBlock = _NSConcreteStackBlock;
    uint64_t v54 = 1107296256;
    id v55 = sub_1001CB5A0;
    uint64_t v56 = &unk_10063D9E0;
    uint64_t v26 = _Block_copy(&aBlock);
    id v27 = v51;
    id v28 = v22;
    swift_release();
    [v24 addAnimations:v26];
    _Block_release(v26);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v24;
    double v57 = sub_10052E68C;
    uint64_t v58 = v29;
    CGAffineTransform aBlock = _NSConcreteStackBlock;
    uint64_t v54 = 1107296256;
    id v55 = sub_1005263B0;
    uint64_t v56 = &unk_10063DA30;
    long long v30 = _Block_copy(&aBlock);
    id v31 = v24;
    swift_release();
    [v18 addCompletion:v30];
    _Block_release(v30);
    int v32 = *(char **)(v52 + 16);
    id v33 = v18;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v52 + 16) = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      int v32 = sub_1003D8708(0, *((void *)v32 + 2) + 1, 1, v32);
      *(void *)(v52 + 16) = v32;
    }
    unint64_t v36 = *((void *)v32 + 2);
    unint64_t v35 = *((void *)v32 + 3);
    if (v36 >= v35 >> 1)
    {
      int v32 = sub_1003D8708((char *)(v35 > 1), v36 + 1, 1, v32);
      *(void *)(v52 + 16) = v32;
    }
    *((void *)v32 + 2) = v36 + 1;
    double v37 = &v32[16 * v36];
    *((void *)v37 + 4) = v33;
    *((double *)v37 + 5) = (double)v12 * 0.1;

    ++v12;
    unint64_t v10 = v49;
  }
  while (v48 != v12);
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v46;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = sub_10052EAC4;
  *(void *)(v39 + 24) = v38;
  char v40 = *(void **)(v52 + 24);
  unint64_t v41 = v46;
  swift_retain();
  char v42 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v52 + 24) = v40;
  if ((v42 & 1) == 0)
  {
    char v40 = sub_1003D880C(0, v40[2] + 1, 1, v40);
    *(void *)(v52 + 24) = v40;
  }
  unint64_t v44 = v40[2];
  unint64_t v43 = v40[3];
  if (v44 >= v43 >> 1)
  {
    char v40 = sub_1003D880C((void *)(v43 > 1), v44 + 1, 1, v40);
    *(void *)(v52 + 24) = v40;
  }
  v40[2] = v44 + 1;
  uint64_t v45 = &v40[2 * v44];
  void v45[4] = sub_1001BAC24;
  v45[5] = v39;
  swift_release();
  *(void *)&v41[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation] = v52;
  swift_retain();
  swift_release();
  sub_10052B9D0();

  return swift_release();
}

uint64_t sub_10052A3B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_100536330();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  uint64_t v6 = sub_100536350();
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  sub_1005352C0();
  v4[15] = sub_1005352B0();
  uint64_t v8 = sub_100535240();
  v4[16] = v8;
  v4[17] = v7;
  return _swift_task_switch(sub_10052A510, v8, v7);
}

uint64_t sub_10052A510()
{
  uint64_t v1 = sub_100535370();
  if ((v1 & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(v0 + 56) + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_numberOfBars);
    uint64_t v7 = 100 * v6;
    if ((unsigned __int128)(v6 * (__int128)100) >> 64 == (100 * v6) >> 63)
    {
      BOOL v8 = __OFADD__(v7, 500);
      uint64_t v9 = v7 + 500;
      if (!v8)
      {
        BOOL v8 = __OFADD__(v9, 600);
        uint64_t v10 = v9 + 600;
        *(void *)(v0 + 144) = v10;
        if (!v8)
        {
          if ((v10 & 0x8000000000000000) == 0)
          {
            uint64_t v11 = 1000000000000000 * v10;
            uint64_t v12 = ((unint64_t)v10 * (unsigned __int128)0x38D7EA4C68000uLL) >> 64;
            sub_100529D6C();
            sub_100536340();
            *(void *)(v0 + 40) = v11;
            *(void *)(v0 + 48) = v12;
            *(void *)(v0 + 16) = 0;
            *(void *)(v0 + 24) = 0;
            *(unsigned char *)(v0 + 32) = 1;
            uint64_t v1 = (uint64_t)sub_10052A658;
            uint64_t v2 = 0;
            uint64_t v3 = 0;
            return _swift_task_switch(v1, v2, v3);
          }
LABEL_15:
          __break(1u);
          return _swift_task_switch(v1, v2, v3);
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10052A658()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = sub_10052E594(&qword_1006794F0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  sub_100536870();
  sub_10052E594(&qword_1006794F8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  sub_100536360();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[19] = v5;
  v0[20] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[21] = v6;
  void *v6 = v0;
  v6[1] = sub_10052A7EC;
  uint64_t v8 = v0[11];
  uint64_t v7 = v0[12];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v7, v4);
}

uint64_t sub_10052A7EC()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 152);
  uint64_t v4 = *(void *)(*(void *)v1 + 88);
  uint64_t v5 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  v3(v4, v5);
  if (v0)
  {
    uint64_t v6 = sub_10052AA90;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    (*(void (**)(void, void))(v2[13] + 8))(v2[14], v2[12]);
    uint64_t v7 = v2[16];
    uint64_t v8 = v2[17];
    uint64_t v6 = sub_10052A98C;
  }
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_10052A98C()
{
  if (sub_100535370())
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    unint64_t v3 = *(void *)(v0 + 144);
    uint64_t v4 = (v3 * (unsigned __int128)0x38D7EA4C68000uLL) >> 64;
    uint64_t v5 = 1000000000000000 * v3;
    sub_100529D6C();
    sub_100536340();
    *(void *)(v0 + 40) = v5;
    *(void *)(v0 + 48) = v4;
    *(void *)(v0 + 16) = 0;
    *(void *)(v0 + 24) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    return _swift_task_switch(sub_10052A658, 0, 0);
  }
}

uint64_t sub_10052AA90()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[17];
  return _swift_task_switch(sub_10052EB30, v4, v5);
}

Swift::Void __swiftcall WaveformPlayIndicator.tintColorDidChange()()
{
  v10.receiver = v0;
  v10.super_class = (Class)swift_getObjectType();
  [super tintColorDidChange];
  uint64_t v1 = &v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode];
  swift_beginAccess();
  if (*v1 == 2)
  {
    id v2 = [v0 tintColor];
    if (!v2) {
      goto LABEL_15;
    }
    uint64_t v3 = v2;
    unint64_t v4 = sub_100526904();
    unint64_t v5 = v4;
    if (v4 >> 62)
    {
      uint64_t v6 = sub_100536470();
      if (v6) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v6)
      {
LABEL_5:
        if (v6 >= 1)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if ((v5 & 0xC000000000000001) != 0) {
              id v8 = (id)sub_100536210();
            }
            else {
              id v8 = *(id *)(v5 + 8 * i + 32);
            }
            uint64_t v9 = v8;
            [v8 setBackgroundColor:v3];
          }
          goto LABEL_12;
        }
        __break(1u);
LABEL_15:
        __break(1u);
        return;
      }
    }
LABEL_12:

    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall WaveformPlayIndicator.didMoveToWindow()()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  [super didMoveToWindow];
  id v1 = [v0 window];
  if (v1) {

  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100530D20();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v0;
  sub_100530D30();
  sub_10052AF30(v3);
}

unint64_t WaveformPlayIndicator.isVisible.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100530D20();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  sub_100530D30();
  return sub_10052AF30(v3);
}

unint64_t sub_10052AF30(char a1)
{
  int v1 = a1 & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100530D20();
  swift_release();
  unint64_t result = swift_release();
  if (v4 != v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100530D20();
    swift_release();
    unint64_t result = swift_release();
    if (v3 == 1) {
      return sub_100528D04();
    }
  }
  return result;
}

uint64_t WaveformPlayIndicator.isVisible.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100530D20();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10052B078@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100530D20();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

unint64_t sub_10052B0F8(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100530D20();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v2;
  sub_100530D30();
  return sub_10052AF30(v4);
}

unint64_t (*WaveformPlayIndicator.isVisible.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100530D20();
  swift_release();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 9);
  return sub_10052B268;
}

unint64_t sub_10052B268(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  char v3 = *(void **)a1;
  sub_100530D20();
  swift_release();
  swift_release();
  char v4 = *(unsigned char *)(a1 + 9);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(a1 + 9) = v2;
  id v5 = v3;
  sub_100530D30();
  return sub_10052AF30(v4);
}

uint64_t WaveformPlayIndicator.$isVisible.getter()
{
  return swift_endAccess();
}

uint64_t WaveformPlayIndicator.$isVisible.setter(uint64_t a1)
{
  uint64_t v2 = sub_10000BB04(&qword_100678540);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  sub_10000BB04(&qword_1006754B0);
  sub_100530D00();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*WaveformPlayIndicator.$isVisible.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_10000BB04(&qword_100678540);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator__isVisible;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_10000BB04(&qword_1006754B0);
  sub_100530CF0();
  swift_endAccess();
  return sub_10027CD2C;
}

void sub_10052B5E0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_numberOfBars);
  if (v1 < 0)
  {
    __break(1u);
  }
  else if (v1)
  {
    sub_1005362C0();
    do
    {
      id v2 = [objc_allocWithZone((Class)UIView) init];
      id v3 = [v2 layer];
      [v3 setCornerCurve:kCACornerCurveContinuous];

      id v4 = [v2 layer];
      [v4 setAllowsEdgeAntialiasing:1];

      id v5 = [v2 tintColor];
      [v2 setBackgroundColor:v5];

      sub_100536290();
      sub_1005362D0();
      sub_1005362E0();
      sub_1005362A0();
      --v1;
    }
    while (v1);
  }
}

void sub_10052B748(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = sub_100534CA0();
  swift_bridgeObjectRelease();
  [a3 addAnimation:a2 forKey:v5];
}

unint64_t sub_10052B814(char a1)
{
  unint64_t result = 0xD000000000000015;
  if (a1 == 1) {
    return 0xD000000000000014;
  }
  return result;
}

void WaveformPlayIndicator.init(frame:)()
{
}

uint64_t sub_10052B9D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100533280();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1005332B0();
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  __chkstk_darwin();
  id v28 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = dispatch_group_create();
  uint64_t v9 = *(void *)(*(void *)(v0 + 16) + 16);
  if (v9)
  {
    uint64_t v24 = v0;
    uint64_t v25 = v5;
    uint64_t v26 = v3;
    uint64_t v27 = v2;
    uint64_t v23 = swift_bridgeObjectRetain();
    objc_super v10 = (double *)(v23 + 40);
    do
    {
      uint64_t v11 = (void *)*((void *)v10 - 1);
      double v12 = *v10;
      v10 += 2;
      id v13 = v11;
      dispatch_group_enter(v8);
      [v13 startAnimationAfterDelay:v12];
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v8;
      unint64_t v36 = sub_10052E354;
      uint64_t v37 = v14;
      CGAffineTransform aBlock = _NSConcreteStackBlock;
      uint64_t v33 = 1107296256;
      id v34 = sub_1005263B0;
      unint64_t v35 = &unk_10063D6C0;
      id v15 = _Block_copy(&aBlock);
      id v16 = v13;
      id v17 = v8;
      swift_release();
      [v16 addCompletion:v15];
      _Block_release(v15);

      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
    uint64_t v3 = v26;
    uint64_t v2 = v27;
    uint64_t v1 = v24;
    id v5 = v25;
  }
  sub_100123DA4(0, (unint64_t *)&qword_1006708E0);
  id v18 = (void *)sub_100535960();
  unint64_t v36 = sub_10052E35C;
  uint64_t v37 = v1;
  CGAffineTransform aBlock = _NSConcreteStackBlock;
  uint64_t v33 = 1107296256;
  id v34 = sub_1001CB5A0;
  unint64_t v35 = &unk_10063D6E8;
  uint64_t v19 = _Block_copy(&aBlock);
  swift_retain();
  unint64_t v20 = v28;
  sub_1005332A0();
  id v31 = _swiftEmptyArrayStorage;
  sub_10052E594((unint64_t *)&unk_100672CA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000BB04(&qword_1006711F8);
  sub_100014CCC((unint64_t *)&qword_100672CB0, &qword_1006711F8);
  sub_1005360C0();
  sub_100535900();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v20, v30);
  return swift_release();
}

uint64_t sub_10052BDD4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = v1 + 40;
    do
    {
      uint64_t v4 = *(void (**)(uint64_t))(v3 - 8);
      uint64_t v5 = swift_retain();
      v4(v5);
      swift_release();
      v3 += 16;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10052BE68()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_10052BEA8()
{
  uint64_t v0 = sub_10052F360();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BB04(&qword_100670C90);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000ED18(v0, qword_1006791F0);
  uint64_t v6 = sub_10000EA90(v0, (uint64_t)qword_1006791F0);
  if (qword_100670320 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_10067B320;
  NSString v8 = sub_100534CA0();
  NSString v9 = sub_100534CA0();
  id v10 = [v7 URLForResource:v8 withExtension:v9];

  if (v10)
  {
    sub_10052F300();

    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v1 + 32);
    v11(v5, v3, v0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v5, 0, 1, v0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0);
    if (result != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v11)(v6, v5, v0);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v5, 1, 1, v0);
  }
  __break(1u);
  return result;
}

void sub_10052C114()
{
  qword_100679208 = 0x4059000000000000;
}

uint64_t sub_10052C124()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10052F360();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v1 + 16) = xmmword_10054DF30;
  *(void *)(v1 + 32) = 0x4030000000000000;
  if (qword_1006708C8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000EA90(v2, (uint64_t)qword_1006791F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  *(void *)(v1 + 40) = sub_10052D834((uint64_t)v5);
  *(void *)(v1 + 48) = v7;
  return v1;
}

id sub_10052C3FC(uint64_t a1, unint64_t a2)
{
  sub_10052CB7C(a1, a2);
  if (!v3)
  {
LABEL_29:
    if (qword_1006708D8 != -1) {
LABEL_47:
    }
      swift_once();
    uint64_t v31 = sub_100530920();
    sub_10000EA90(v31, (uint64_t)qword_100679210);
    int v32 = sub_100530900();
    os_log_type_t v33 = sub_1005357E0();
    if (os_log_type_enabled(v32, v33))
    {
      id v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "BouncyBars asset does not have expected layers / animations", v34, 2u);
      swift_slowDealloc();
    }
LABEL_39:

    return 0;
  }
  uint64_t v4 = v3;
  id v5 = [v3 values];
  if (!v5)
  {

    goto LABEL_29;
  }
  uint64_t v6 = v5;
  uint64_t v7 = sub_1005350E0();

  [v4 copy];
  sub_100536090();
  swift_unknownObjectRelease();
  sub_100123DA4(0, &qword_1006794C8);
  swift_dynamicCast();
  uint64_t v46 = v49;
  [v4 copy];
  sub_100536090();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  uint64_t v45 = v49;
  unint64_t v43 = v4;
  [v4 copy];
  sub_100536090();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  unint64_t v8 = 0;
  unint64_t v44 = v49;
  while (1)
  {
    uint64_t v9 = v46;
    unint64_t v10 = *(void *)(v7 + 16);
    if (v8 == v10)
    {
      uint64_t v51 = 0;
      long long v49 = 0u;
      long long v50 = 0u;
    }
    else
    {
      if (v8 >= v10) {
        goto LABEL_46;
      }
      sub_10009B1D4(v7 + 32 + 32 * v8, (uint64_t)v48);
      *(void *)&long long v49 = v8;
      sub_1001A20AC(v48, (long long *)((char *)&v49 + 8));
      ++v8;
    }
    sub_100013A18((uint64_t)&v49, (uint64_t)&v52, &qword_1006794D0);
    if (!v54)
    {
      swift_bridgeObjectRelease();
      sub_10000BB04(&qword_1006794D8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10053D3F0;
      *(unsigned char *)(inited + 32) = 0;
      *(void *)(inited + 40) = v46;
      *(unsigned char *)(inited + 48) = 1;
      *(void *)(inited + 56) = v45;
      *(unsigned char *)(inited + 64) = 2;
      *(void *)(inited + 72) = v44;
      unint64_t v36 = sub_1003CC960(inited);

      return (id)v36;
    }
    unint64_t v11 = v52;
    sub_1001A20AC(&v53, &v49);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      if (qword_1006708D8 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_100530920();
      sub_10000EA90(v37, (uint64_t)qword_100679210);
      int v32 = sub_100530900();
      os_log_type_t v38 = sub_1005357E0();
      uint64_t v39 = v43;
      if (os_log_type_enabled(v32, v38))
      {
        char v40 = v43;
        unint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, v38, "BouncyBars asset does not have expected layers / animations", v41, 2u);
        swift_slowDealloc();
        char v42 = v46;
        uint64_t v9 = v44;
        uint64_t v39 = v45;
      }
      else
      {
        char v42 = v32;
        char v40 = v44;
        int v32 = v45;
      }

      goto LABEL_39;
    }
    if (qword_1006708D0 != -1) {
      swift_once();
    }
    double v12 = v47 / *(double *)&qword_100679208;
    double v13 = v47 / *(double *)&qword_100679208 * v2[4];
    *((void *)&v50 + 1) = &type metadata for CGFloat;
    *(double *)&long long v49 = v13;
    id result = [v46 values];
    if (!result) {
      break;
    }
    id v15 = result;
    uint64_t v16 = sub_1005350E0();

    if (swift_isUniquelyReferenced_nonNull_native())
    {
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v16 = (uint64_t)sub_10052CF80(v16);
      if ((v11 & 0x8000000000000000) != 0)
      {
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
    }
    if (v11 >= *(void *)(v16 + 16)) {
      goto LABEL_42;
    }
    sub_100013D48(v16 + 32 * v11 + 32);
    sub_1001A20AC(&v49, (_OWORD *)(v16 + 32 * v11 + 32));
    Class isa = sub_1005350C0().super.isa;
    swift_bridgeObjectRelease();
    [v46 setValues:isa];

    id v18 = v45;
    NSString v19 = sub_100534CA0();
    [v18 setKeyPath:v19];

    double v20 = v2[3];
    double v21 = v20 + v2[2];
    if (v20 > v21) {
      goto LABEL_43;
    }
    double v22 = v20 + v12 * (v21 - v20);
    *((void *)&v50 + 1) = &type metadata for CGFloat;
    *(double *)&long long v49 = v22;
    id result = [v18 values];
    if (!result) {
      goto LABEL_49;
    }
    uint64_t v23 = result;
    uint64_t v24 = sub_1005350E0();

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v24 = (uint64_t)sub_10052CF80(v24);
    }
    if (v11 >= *(void *)(v24 + 16)) {
      goto LABEL_44;
    }
    sub_100013D48(v24 + 32 * v11 + 32);
    sub_1001A20AC(&v49, (_OWORD *)(v24 + 32 * v11 + 32));
    Class v25 = sub_1005350C0().super.isa;
    swift_bridgeObjectRelease();
    [v18 setValues:v25];

    uint64_t v26 = v44;
    NSString v27 = sub_100534CA0();
    [v26 setKeyPath:v27];

    *((void *)&v50 + 1) = &type metadata for CGFloat;
    *(double *)&long long v49 = v22 * 0.5;
    id result = [v26 values];
    if (!result) {
      goto LABEL_50;
    }
    id v28 = result;
    uint64_t v29 = sub_1005350E0();

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v29 = (uint64_t)sub_10052CF80(v29);
    }
    if (v11 >= *(void *)(v29 + 16)) {
      goto LABEL_45;
    }
    sub_100013D48(v29 + 32 * v11 + 32);
    sub_1001A20AC(&v49, (_OWORD *)(v29 + 32 * v11 + 32));
    Class v30 = sub_1005350C0().super.isa;
    swift_bridgeObjectRelease();
    [v26 setValues:v30];
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

void sub_10052CB7C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 40);
  if (*(void *)(v4 + 16))
  {
    uint64_t v5 = (a1 << 56) + 0x41746E6169726156;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_1001A1AC8(v5, 0xE800000000000000);
    if (v7)
    {
      sub_10009B1D4(*(void *)(v4 + 56) + 32 * v6, (uint64_t)&v18);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    swift_bridgeObjectRetain();
  }
  sub_10000BB04(&qword_100672CD0);
  sub_100123DA4(0, &qword_100671450);
  if (swift_dynamicCast())
  {
    unint64_t v8 = v20;
  }
  else
  {
    unint64_t v8 = 0;
    double v20 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    id v9 = [v8 sublayers];

    if (v9)
    {
      uint64_t v10 = sub_1005350E0();

      if ((v10 & 0xC000000000000001) == 0)
      {
        if ((a2 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
        {
          id v11 = *(id *)(v10 + 8 * a2 + 32);
          goto LABEL_16;
        }
        __break(1u);
        return;
      }
      id v11 = (id)sub_100536210();
LABEL_16:
      double v12 = v11;
      swift_bridgeObjectRelease();
      id v13 = [v12 animationKeys];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = sub_1005350E0();

        if (*(void *)(v15 + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          NSString v16 = sub_100534CA0();
          swift_bridgeObjectRelease();
          id v17 = [v12 animationForKey:v16];

          if (v17)
          {
            self;
            if (!swift_dynamicCastObjCClass()) {
          }
            }
        }
        else
        {

          swift_bridgeObjectRelease();
        }
      }
      else
      {
      }
    }
  }
}

uint64_t sub_10052CDEC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1003D1830(*a1, *a2);
}

Swift::Int sub_10052CDF8()
{
  return sub_1005261C4();
}

uint64_t sub_10052CE00()
{
  return sub_1003CF5E8();
}

Swift::Int sub_10052CE08()
{
  return sub_1003D2218();
}

uint64_t sub_10052CE10@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10052EA78(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10052CE40@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10052B814(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10052CE6C(void *a1@<X8>)
{
  *a1 = &off_100631A58;
}

uint64_t sub_10052CE7C()
{
  uint64_t v0 = sub_100530920();
  sub_10000ED18(v0, qword_100679210);
  sub_10000EA90(v0, (uint64_t)qword_100679210);
  sub_100123DA4(0, (unint64_t *)&qword_1006714C0);
  OS_os_log.init(musicCategory:)();
  return sub_100530930();
}

uint64_t sub_10052CF0C()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void *sub_10052CF58(void *a1)
{
  return sub_1003D81B0(0, a1[2], 0, a1);
}

void *sub_10052CF6C(void *a1)
{
  return sub_1003D8930(0, a1[2], 0, a1);
}

char *sub_10052CF80(uint64_t a1)
{
  return sub_1003D8A54(0, *(void *)(a1 + 16), 0, (char *)a1);
}

size_t sub_10052CF94(uint64_t a1)
{
  uint64_t v46 = sub_10000BB04((uint64_t *)&unk_100676260);
  __chkstk_darwin();
  char v40 = (char *)v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  unint64_t v44 = (void *)((char *)v39 - v3);
  __chkstk_darwin();
  uint64_t v5 = (char *)v39 - v4;
  uint64_t v45 = v6;
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  id v9 = _swiftEmptyArrayStorage;
  uint64_t v43 = v8;
  v39[1] = a1;
  if (v8)
  {
    uint64_t v41 = (v7 + 32) & ~v7;
    uint64_t v10 = (char *)_swiftEmptyArrayStorage + v41;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)(type metadata accessor for PlaylistCurators.Curator(0) - 8);
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    uint64_t v42 = *(void *)(v13 + 72);
    v39[2] = v7 | 7;
    uint64_t v15 = _swiftEmptyArrayStorage;
    NSString v16 = v40;
    while (1)
    {
      uint64_t v18 = v46;
      uint64_t v19 = (uint64_t)&v16[*(int *)(v46 + 48)];
      sub_1003E1418(v14, v19);
      uint64_t v20 = (uint64_t)v44;
      uint64_t v21 = (uint64_t)v44 + *(int *)(v18 + 48);
      void *v44 = v11;
      sub_10052E750(v19, v21);
      size_t result = sub_100013A18(v20, (uint64_t)v5, (uint64_t *)&unk_100676260);
      if (v12)
      {
        id v9 = v15;
        BOOL v17 = __OFSUB__(v12--, 1);
        if (v17) {
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v23 = v15[3];
        if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
        int64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
        if (v24 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v24;
        }
        sub_10000BB04(&qword_100679538);
        uint64_t v26 = *(void *)(v45 + 72);
        uint64_t v27 = v41;
        id v9 = (void *)swift_allocObject();
        size_t result = j__malloc_size(v9);
        if (!v26) {
          goto LABEL_34;
        }
        int64_t v28 = result - v27;
        if (result - v27 == 0x8000000000000000 && v26 == -1) {
          goto LABEL_35;
        }
        uint64_t v30 = v28 / v26;
        v9[2] = v25;
        v9[3] = 2 * (v28 / v26);
        uint64_t v31 = (char *)v9 + v27;
        uint64_t v32 = v15[3] >> 1;
        uint64_t v33 = v32 * v26;
        if (v15[2])
        {
          if (v9 < v15 || v31 >= (char *)v15 + v41 + v33)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v9 != v15)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v15[2] = 0;
        }
        uint64_t v10 = &v31[v33];
        uint64_t v35 = (v30 & 0x7FFFFFFFFFFFFFFFLL) - v32;
        swift_release();
        NSString v16 = v40;
        BOOL v17 = __OFSUB__(v35, 1);
        uint64_t v12 = v35 - 1;
        if (v17)
        {
LABEL_27:
          __break(1u);
          break;
        }
      }
      ++v11;
      sub_100013A18((uint64_t)v5, (uint64_t)v10, (uint64_t *)&unk_100676260);
      v10 += *(void *)(v45 + 72);
      v14 += v42;
      uint64_t v15 = v9;
      if (v43 == v11) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_29:
  size_t result = swift_bridgeObjectRelease();
  unint64_t v36 = v9[3];
  if (v36 >= 2)
  {
    unint64_t v37 = v36 >> 1;
    BOOL v17 = __OFSUB__(v37, v12);
    uint64_t v38 = v37 - v12;
    if (v17) {
      goto LABEL_36;
    }
    v9[2] = v38;
  }
  return (size_t)v9;
}

uint64_t sub_10052D318(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v31 = a1;
  if (a1 >> 62) {
    goto LABEL_57;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  uint64_t v3 = _swiftEmptyArrayStorage;
  uint64_t v4 = 0;
  if (v2)
  {
    uint64_t v5 = &_swiftEmptyArrayStorage[4];
    while (1)
    {
      unint64_t v6 = v1 >> 62;
      if (v1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_100536470();
        swift_bridgeObjectRelease();
        if (!v12) {
          goto LABEL_51;
        }
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_100536470();
        swift_bridgeObjectRelease();
        if (!v13) {
          goto LABEL_52;
        }
      }
      else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_51;
      }
      if ((v1 & 0xC000000000000001) != 0)
      {
        id v7 = (id)sub_100536210();
        if (!v6) {
          goto LABEL_10;
        }
      }
      else
      {
        if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          swift_bridgeObjectRetain();
          uint64_t v2 = sub_100536470();
          goto LABEL_3;
        }
        id v7 = *(id *)(v1 + 32);
        if (!v6)
        {
LABEL_10:
          if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_55;
          }
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_100536470();
      swift_bridgeObjectRelease();
      if (!v14) {
        goto LABEL_55;
      }
LABEL_11:
      sub_1003BFD40(0, 1);
      unint64_t v1 = v31;
      if (v31 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_100536470();
        swift_bridgeObjectRelease();
        if (!v15)
        {
LABEL_29:
          uint64_t v10 = 0;
          if (v4) {
            goto LABEL_19;
          }
          goto LABEL_30;
        }
      }
      else if (!*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_29;
      }
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v1 & 0x8000000000000000) != 0
        || (v1 & 0x4000000000000000) != 0)
      {
        unint64_t v1 = sub_1002F76C8(v1);
        unint64_t v31 = v1;
      }
      uint64_t v8 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v8) {
        goto LABEL_54;
      }
      uint64_t v9 = v8 - 1;
      uint64_t v10 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 8 * v9 + 0x20);
      *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
      unint64_t v1 = (unint64_t)&v31;
      sub_100535100();
      if (v4)
      {
LABEL_19:
        BOOL v11 = __OFSUB__(v4--, 1);
        if (v11) {
          goto LABEL_53;
        }
        goto LABEL_42;
      }
LABEL_30:
      unint64_t v16 = v3[3];
      if ((uint64_t)((v16 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_56;
      }
      int64_t v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
      if (v17 <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v17;
      }
      sub_10000BB04(&qword_100671998);
      unint64_t v1 = swift_allocObject();
      int64_t v19 = j__malloc_size((const void *)v1);
      uint64_t v20 = v19 - 32;
      if (v19 < 32) {
        uint64_t v20 = v19 - 17;
      }
      uint64_t v21 = v20 >> 4;
      *(void *)(v1 + 16) = v18;
      *(void *)(v1 + 24) = 2 * (v20 >> 4);
      unint64_t v22 = v1 + 32;
      uint64_t v23 = v3[3] >> 1;
      if (v3[2])
      {
        int64_t v24 = v3 + 4;
        if ((void *)v1 != v3 || v22 >= (unint64_t)v24 + 16 * v23) {
          memmove((void *)(v1 + 32), v24, 16 * v23);
        }
        v3[2] = 0;
      }
      uint64_t v5 = (void *)(v22 + 16 * v23);
      uint64_t v25 = (v21 & 0x7FFFFFFFFFFFFFFFLL) - v23;
      swift_release();
      uint64_t v3 = (void *)v1;
      BOOL v11 = __OFSUB__(v25, 1);
      uint64_t v4 = v25 - 1;
      if (v11) {
        goto LABEL_53;
      }
LABEL_42:
      *uint64_t v5 = v7;
      v5[1] = v10;
      unint64_t v1 = v31;
      if (v31 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_100536470();
        swift_bridgeObjectRelease();
        v5 += 2;
        if (!v26) {
          break;
        }
      }
      else
      {
        v5 += 2;
        if (!*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          break;
        }
      }
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v28 = v3[3];
  if (v28 < 2) {
    return (uint64_t)v3;
  }
  unint64_t v29 = v28 >> 1;
  BOOL v11 = __OFSUB__(v29, v4);
  uint64_t v30 = v29 - v4;
  if (!v11)
  {
    v3[2] = v30;
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_10052D68C()
{
  return sub_100526968();
}

void sub_10052D6B0(uint64_t a1, void (*a2)(uint64_t, id))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v9;
    if (!v15)
    {
      int64_t v9 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v9);
      if (!v15)
      {
        int64_t v9 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v9);
        if (!v15)
        {
          int64_t v9 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v9);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = *(unsigned __int8 *)(*(void *)(a1 + 48) + v11);
    id v13 = *(id *)(*(void *)(a1 + 56) + 8 * v11);
    a2(v12, v13);
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v9 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v9);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_10052D834(uint64_t a1)
{
  uint64_t v4 = sub_10052F380();
  if (v2) {
    goto LABEL_2;
  }
  uint64_t v7 = v4;
  unint64_t v8 = v5;
  uint64_t v1 = sub_100123DA4(0, &qword_100679500);
  sub_10000BB04(&qword_100679508);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10053DF50;
  *(void *)(v9 + 32) = sub_100123DA4(0, &qword_100671450);
  *(void *)(v9 + 40) = sub_100123DA4(0, &qword_100679510);
  *(void *)(v9 + 48) = sub_100123DA4(0, &qword_100679518);
  *(void *)(v9 + 56) = sub_100123DA4(0, &qword_100679520);
  *(void *)(v9 + 64) = sub_100123DA4(0, &qword_100671640);
  sub_1005358F0();
  swift_bridgeObjectRelease();
  if (!*((void *)&v18 + 1))
  {
LABEL_19:
    sub_1003CBBB0((uint64_t)&v17);
    goto LABEL_20;
  }
  sub_10000BB04(&qword_100679530);
  if (swift_dynamicCast())
  {
    uint64_t v1 = (uint64_t)v16;
    if (v16[2])
    {
      unint64_t v11 = sub_1001A1AC8(0x6579614C746F6F72, 0xE900000000000072);
      if (v12)
      {
        sub_10009B1D4(v16[7] + 32 * v11, (uint64_t)&v17);
        if (swift_dynamicCast())
        {
          if (v16[2] && (unint64_t v13 = sub_1001A1AC8(0xD000000000000010, 0x800000010056B390), (v14 & 1) != 0))
          {
            sub_10009B1D4(v16[7] + 32 * v13, (uint64_t)&v17);
          }
          else
          {
            long long v17 = 0u;
            long long v18 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v18 + 1))
          {
            if (swift_dynamicCast())
            {
              sub_10004A100(v7, v8);
              uint64_t v1 = (uint64_t)v16;
              uint64_t v15 = sub_10052F360();
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
              return v1;
            }

            goto LABEL_20;
          }

          goto LABEL_19;
        }
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_20:
  sub_10052E6FC();
  swift_allocError();
  swift_willThrow();
  sub_10004A100(v7, v8);
LABEL_2:
  uint64_t v6 = sub_10052F360();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return v1;
}

void _s11MusicCoreUI21WaveformPlayIndicatorC5coderACSgSo7NSCoderC_tcfc_0()
{
  uint64_t v1 = v0;
  uint64_t v18 = sub_10000BB04(&qword_1006754B0);
  uint64_t v2 = *(void *)(v18 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_mode] = 0;
  unint64_t v5 = &v0[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette];
  uint64_t v6 = self;
  id v17 = [v6 tintColor];
  id v7 = [v6 labelColor];
  id v8 = [v7 colorWithAlphaComponent:0.35];

  id v9 = [v6 labelColor];
  id v10 = [v9 colorWithAlphaComponent:0.2];

  id v11 = [v6 labelColor];
  id v12 = [v11 colorWithAlphaComponent:0.6];

  *(void *)unint64_t v5 = v17;
  *((void *)v5 + 1) = v8;
  *((void *)v5 + 2) = v10;
  *((void *)v5 + 3) = v12;
  uint64_t v13 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_waveform;
  *(void *)&v1[v13] = [self zero];
  *(void *)&v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_pulseTask] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_barRatio] = 0x3FE0000000000000;
  char v14 = &v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator__isVisible];
  char v19 = 0;
  sub_100530CE0();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v14, v4, v18);
  *(void *)&v1[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator____lazy_storage___bars] = 0;
  uint64_t v15 = OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_cannedAnimationAsset;
  type metadata accessor for BouncyBarsAsset();
  swift_allocObject();
  *(void *)&v1[v15] = sub_10052C124();

  sub_1005363F0();
  __break(1u);
}

uint64_t sub_10052DE80()
{
  return swift_deallocObject();
}

id sub_10052DEB8()
{
  return sub_100529CCC(*(char **)(v0 + 16));
}

uint64_t sub_10052DEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10052DED0()
{
  return swift_release();
}

unint64_t sub_10052DEE4()
{
  unint64_t result = qword_100679280;
  if (!qword_100679280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100679280);
  }
  return result;
}

uint64_t sub_10052DF38()
{
  return type metadata accessor for WaveformPlayIndicator();
}

uint64_t type metadata accessor for WaveformPlayIndicator()
{
  uint64_t result = qword_1006792B0;
  if (!qword_1006792B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10052DF8C()
{
  sub_10049B7A0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

unsigned char *storeEnumTagSinglePayload for WaveformPlayIndicator.Mode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10052E130);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WaveformPlayIndicator.Mode()
{
  return &type metadata for WaveformPlayIndicator.Mode;
}

ValueMetadata *type metadata accessor for WaveformPlayIndicator.ColorPalette()
{
  return &type metadata for WaveformPlayIndicator.ColorPalette;
}

uint64_t type metadata accessor for AnimationGroup()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for BouncyBarsAsset.MicaBundle(void *a1, void *a2)
{
  int v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  id v4 = v3;
  return a1;
}

void destroy for BouncyBarsAsset.MicaBundle(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *assignWithCopy for BouncyBarsAsset.MicaBundle(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for BouncyBarsAsset.MicaBundle(uint64_t a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for BouncyBarsAsset.MicaBundle()
{
  return &type metadata for BouncyBarsAsset.MicaBundle;
}

uint64_t assignWithCopy for AnimationGroup.Animator(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for AnimationGroup.Animator(uint64_t a1, void *a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for AnimationGroup.Animator()
{
  return &type metadata for AnimationGroup.Animator;
}

void sub_10052E354()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_10052E35C()
{
  return sub_10052BDD4(v0);
}

uint64_t sub_10052E364()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_10052E3A4()
{
  return sub_100529B94(*(char **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10052E3AC()
{
  return swift_deallocObject();
}

void sub_10052E3E4()
{
  sub_100529968(*(char **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_10052E3F0()
{
  sub_1005293EC(*(void *)(v0 + 16));
}

uint64_t sub_10052E3F8()
{
  return swift_deallocObject();
}

id sub_10052E438()
{
  uint64_t v1 = *(void **)(v0 + 24);
  [*(id *)(v0 + 16) setAlpha:1.0];

  return [v1 setAlpha:1.0];
}

unint64_t sub_10052E484()
{
  return sub_100529194(*(void *)(v0 + 16));
}

unint64_t sub_10052E48C()
{
  return sub_100528BF8(*(void *)(v0 + 16));
}

uint64_t sub_10052E494(uint64_t a1)
{
  return sub_100529030(a1, *(char **)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_10052E4A0()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_10052E4E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000F280;
  return sub_10052A3B0(a1, v4, v5, v6);
}

uint64_t sub_10052E594(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10052E5DC()
{
  return swift_deallocObject();
}

id sub_10052E620()
{
  uint64_t v1 = *(void **)(v0 + 16);
  [v1 setBackgroundColor:*(void *)(v0 + 24)];
  [v1 bounds];

  return [v1 setBounds:];
}

id sub_10052E68C(id result)
{
  if (!result) {
    return [*(id *)(v1 + 16) startAnimation];
  }
  return result;
}

uint64_t sub_10052E6A4()
{
  swift_release();

  return swift_deallocObject();
}

void sub_10052E6DC(uint64_t a1, uint64_t a2)
{
  sub_10052B748(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10052E6E4()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation) = 0;
  return swift_release();
}

unint64_t sub_10052E6FC()
{
  unint64_t result = qword_100679528;
  if (!qword_100679528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100679528);
  }
  return result;
}

uint64_t sub_10052E750(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlaylistCurators.Curator(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unsigned char *storeEnumTagSinglePayload for BouncyBarsAsset.MicaBundle.Error(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10052E850);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BouncyBarsAsset.MicaBundle.Error()
{
  return &type metadata for BouncyBarsAsset.MicaBundle.Error;
}

unsigned char *storeEnumTagSinglePayload for BouncyBarsAsset.BarAnimationKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10052E954);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BouncyBarsAsset.BarAnimationKey()
{
  return &type metadata for BouncyBarsAsset.BarAnimationKey;
}

uint64_t sub_10052E98C()
{
  return sub_100014CCC(&qword_100679540, &qword_100679548);
}

unint64_t sub_10052E9CC()
{
  unint64_t result = qword_100679550;
  if (!qword_100679550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100679550);
  }
  return result;
}

unint64_t sub_10052EA24()
{
  unint64_t result = qword_100679558;
  if (!qword_100679558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100679558);
  }
  return result;
}

uint64_t sub_10052EA78(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1006319F0;
  v6._object = a2;
  unint64_t v4 = sub_100536530(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_10052EB70()
{
  return static vDSP.formWindow<A>(usingSequence:result:isHalfWindow:)();
}

uint64_t sub_10052EB80()
{
  return type metadata accessor for vDSP.WindowSequence();
}

uint64_t sub_10052EB90()
{
  return vDSP.FFT.init(log2n:radix:ofType:)();
}

uint64_t sub_10052EBA0()
{
  return dispatch thunk of vDSP.FFT.forward(input:output:)();
}

uint64_t sub_10052EBB0()
{
  return type metadata accessor for vDSP.Radix();
}

uint64_t sub_10052EBE0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10052EBF0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10052EC00()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10052EC10()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10052EC30()
{
  return IntentItem.value.getter();
}

uint64_t sub_10052EC50()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10052EC60()
{
  return static IntentResult.result<>()();
}

uint64_t sub_10052EC70()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10052EC80()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10052EC90()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:optionsProvider:)();
}

uint64_t sub_10052ECA0()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)();
}

uint64_t sub_10052ECB0()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10052ECC0()
{
  return IntentItemSection.items.getter();
}

uint64_t sub_10052ECD0()
{
  return IntentItemSection.items.setter();
}

uint64_t sub_10052ECE0()
{
  return IntentItemSection.init(_:items:)();
}

uint64_t sub_10052ECF0()
{
  return IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)();
}

uint64_t sub_10052ED00()
{
  return IntentItemCollection.sections.getter();
}

uint64_t sub_10052ED10()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10052ED20()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10052ED30()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10052ED40()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10052ED50()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10052ED70()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10052ED80()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10052ED90()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10052EDC0()
{
  return static CocoaError.userCancelled.getter();
}

uint64_t sub_10052EDD0()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_10052EDE0()
{
  return NSNotFound.getter();
}

Class sub_10052EDF0()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_10052EE00()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

void sub_10052EE10(Swift::String _, Swift::String forHTTPHeaderField)
{
}

uint64_t sub_10052EE20()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_10052EE30()
{
  return static FormatStyle<>.iso8601.getter();
}

uint64_t sub_10052EE40()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_10052EE50()
{
  return JSONDecoder.init()();
}

uint64_t sub_10052EE60()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_10052EE70()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_10052EE80()
{
  return JSONEncoder.init()();
}

uint64_t sub_10052EE90()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_10052EEA0()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t sub_10052EEB0()
{
  return static CharacterSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052EEC0()
{
  return CharacterSet.contains(_:)();
}

uint64_t sub_10052EED0()
{
  return static CharacterSet.newlines.getter();
}

uint64_t sub_10052EEE0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_10052EEF0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052EF00()
{
  return Notification.object.getter();
}

uint64_t sub_10052EF10()
{
  return Notification.userInfo.getter();
}

uint64_t sub_10052EF20()
{
  return type metadata accessor for Notification();
}

uint64_t sub_10052EF30()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_10052EF40()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_10052EF50()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_10052EF60()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_10052EF70()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_10052EF80()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_10052EF90()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_10052EFA0()
{
  return URLComponents.url.getter();
}

uint64_t sub_10052EFB0()
{
  return URLComponents.host.setter();
}

uint64_t sub_10052EFC0()
{
  return URLComponents.path.modify();
}

uint64_t sub_10052EFD0()
{
  return URLComponents.path.getter();
}

uint64_t sub_10052EFE0()
{
  return URLComponents.scheme.getter();
}

uint64_t sub_10052EFF0()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_10052F000()
{
  return URLComponents.init(string:)();
}

uint64_t sub_10052F010()
{
  return URLComponents.init()();
}

uint64_t sub_10052F020()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_10052F030()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t sub_10052F040()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_10052F050()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_10052F060()
{
  return __DataStorage.init(length:)();
}

uint64_t sub_10052F070()
{
  return __DataStorage._length.getter();
}

uint64_t sub_10052F080()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_10052F090()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_10052F0A0()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052F0B0()
{
  return DateComponents.day.getter();
}

uint64_t sub_10052F0C0()
{
  return DateComponents.date.getter();
}

uint64_t sub_10052F0D0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_10052F0E0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_10052F0F0()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_10052F100()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_10052F110()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t sub_10052F120()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_10052F130()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t sub_10052F140()
{
  return static ParseableFormatStyle<>.dateTime.getter();
}

uint64_t sub_10052F190()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_10052F1B0()
{
  return _BridgedStoredNSError.userInfo.getter();
}

uint64_t sub_10052F1D0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10052F1E0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10052F1F0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10052F200()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_10052F210()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10052F220()
{
  return FloatingPointFormatStyle.Percent.init(locale:)();
}

uint64_t sub_10052F230()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t sub_10052F240()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t sub_10052F250()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t sub_10052F260()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10052F270()
{
  return URL.absoluteString.getter();
}

uint64_t sub_10052F280()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_10052F290()
{
  return URL.lastPathComponent.getter();
}

uint64_t sub_10052F2A0()
{
  return URL.dataRepresentation.getter();
}

void sub_10052F2B0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10052F2C0()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10052F2D0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_10052F2E0()
{
  return URL.deletingLastPathComponent()();
}

uint64_t sub_10052F2F0()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_10052F300()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052F310()
{
  return URL.path.getter();
}

void sub_10052F320(Swift::OpaquePointer queryItems)
{
}

uint64_t sub_10052F330()
{
  return URL.init(string:)();
}

uint64_t sub_10052F340()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_10052F350()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10052F360()
{
  return type metadata accessor for URL();
}

void sub_10052F370()
{
}

uint64_t sub_10052F380()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_10052F390()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t sub_10052F3A0()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t sub_10052F3B0()
{
  return Data._Representation.append(contentsOf:)();
}

NSData sub_10052F3C0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10052F3D0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052F3E0()
{
  return Data.write(to:options:)();
}

uint64_t sub_10052F3F0()
{
  return static Date.FormatStyle.TimeStyle.omitted.getter();
}

uint64_t sub_10052F400()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_10052F410()
{
  return static Date.FormatStyle.DateStyle.abbreviated.getter();
}

uint64_t sub_10052F420()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_10052F430()
{
  return Date.FormatStyle.day(_:)();
}

uint64_t sub_10052F440()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t sub_10052F450()
{
  return Date.FormatStyle.hour(_:)();
}

uint64_t sub_10052F460()
{
  return Date.FormatStyle.year(_:)();
}

uint64_t sub_10052F470()
{
  return Date.FormatStyle.month(_:)();
}

uint64_t sub_10052F480()
{
  return static Date.FormatStyle.Symbol.Day.defaultDigits.getter();
}

uint64_t sub_10052F490()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Day();
}

uint64_t sub_10052F4A0()
{
  return static Date.FormatStyle.Symbol.Hour.defaultDigits(amPM:)();
}

uint64_t sub_10052F4B0()
{
  return static Date.FormatStyle.Symbol.Hour.AMPMStyle.abbreviated.getter();
}

uint64_t sub_10052F4C0()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle();
}

uint64_t sub_10052F4D0()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour();
}

uint64_t sub_10052F4E0()
{
  return static Date.FormatStyle.Symbol.Year.defaultDigits.getter();
}

uint64_t sub_10052F4F0()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Year();
}

uint64_t sub_10052F500()
{
  return static Date.FormatStyle.Symbol.Month.abbreviated.getter();
}

uint64_t sub_10052F510()
{
  return static Date.FormatStyle.Symbol.Month.wide.getter();
}

uint64_t sub_10052F520()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Month();
}

uint64_t sub_10052F530()
{
  return static Date.FormatStyle.Symbol.Minute.defaultDigits.getter();
}

uint64_t sub_10052F540()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Minute();
}

uint64_t sub_10052F550()
{
  return static Date.FormatStyle.Symbol.Weekday.wide.getter();
}

uint64_t sub_10052F560()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Weekday();
}

uint64_t sub_10052F570()
{
  return Date.FormatStyle.minute(_:)();
}

uint64_t sub_10052F580()
{
  return Date.FormatStyle.weekday(_:)();
}

uint64_t sub_10052F590()
{
  return Date.FormatStyle.timeZone.setter();
}

uint64_t sub_10052F5A0()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t sub_10052F5B0()
{
  return static Date.distantPast.getter();
}

uint64_t sub_10052F5C0()
{
  return static Date.distantFuture.getter();
}

uint64_t sub_10052F5D0()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10052F5E0()
{
  return type metadata accessor for Date.ISO8601FormatStyle.DateTimeSeparator();
}

uint64_t sub_10052F5F0()
{
  return type metadata accessor for Date.ISO8601FormatStyle.DateSeparator();
}

uint64_t sub_10052F600()
{
  return type metadata accessor for Date.ISO8601FormatStyle.TimeSeparator();
}

uint64_t sub_10052F610()
{
  return Date.ISO8601FormatStyle.init(dateSeparator:dateTimeSeparator:timeSeparator:timeZoneSeparator:includingFractionalSeconds:timeZone:)();
}

uint64_t sub_10052F620()
{
  return type metadata accessor for Date.ISO8601FormatStyle.TimeZoneSeparator();
}

uint64_t sub_10052F630()
{
  return Date.ISO8601FormatStyle.day()();
}

uint64_t sub_10052F640()
{
  return Date.ISO8601FormatStyle.year()();
}

uint64_t sub_10052F650()
{
  return Date.ISO8601FormatStyle.month()();
}

uint64_t sub_10052F660()
{
  return type metadata accessor for Date.ISO8601FormatStyle();
}

uint64_t sub_10052F670()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_10052F680()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10052F690()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_10052F6A0()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_10052F6B0()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_10052F6C0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10052F6D0()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_10052F6E0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052F6F0()
{
  return static Date.now.getter();
}

uint64_t sub_10052F700()
{
  return Date.distance(to:)();
}

uint64_t sub_10052F710()
{
  return Date.formatted<A>(_:)();
}

uint64_t sub_10052F720()
{
  return Date.init()();
}

uint64_t sub_10052F730()
{
  return type metadata accessor for Date();
}

uint64_t sub_10052F740()
{
  return Date.init<A>(_:strategy:)();
}

uint64_t sub_10052F750()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10052F760()
{
  return static UUID.== infix(_:_:)();
}

uint64_t _s9MusicCore6PlayerC14CommandOptionsV4uuid10Foundation4UUIDVvpfi_0()
{
  return UUID.init()();
}

uint64_t sub_10052F780()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10052F790()
{
  return Locale.init(identifier:)();
}

uint64_t sub_10052F7A0()
{
  return Locale.identifier.getter();
}

uint64_t sub_10052F7B0()
{
  return Locale.LanguageCode.init(stringLiteral:)();
}

uint64_t sub_10052F7C0()
{
  return type metadata accessor for Locale.LanguageCode();
}

NSLocale sub_10052F7D0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_10052F7E0()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_10052F7F0()
{
  return static Locale.current.getter();
}

uint64_t sub_10052F800()
{
  return Locale.Language.init(identifier:)();
}

uint64_t sub_10052F810()
{
  return Locale.Language.languageCode.getter();
}

uint64_t sub_10052F820()
{
  return Locale.Language.characterDirection.getter();
}

uint64_t sub_10052F830()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_10052F840()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10052F850()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_10052F860()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_10052F870()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_10052F880()
{
  return Calendar.maximumRange(of:)();
}

uint64_t sub_10052F890()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_10052F8A0()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t sub_10052F8B0()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052F8C0()
{
  return Calendar.date(from:)();
}

uint64_t sub_10052F8D0()
{
  return static Calendar.current.getter();
}

uint64_t sub_10052F8E0()
{
  return Calendar.timeZone.getter();
}

uint64_t sub_10052F8F0()
{
  return Calendar.timeZone.setter();
}

uint64_t sub_10052F900()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10052F910()
{
  return type metadata accessor for Calendar();
}

void sub_10052F920(NSIndexSet *retstr@<X8>)
{
}

uint64_t sub_10052F930(Swift::Int a1)
{
  return *(_OWORD *)&IndexSet.insert(_:)(a1);
}

BOOL sub_10052F940(Swift::Int a1)
{
  return IndexSet.contains(_:)(a1);
}

uint64_t sub_10052F950()
{
  return IndexSet.formUnion(_:)();
}

uint64_t _s14MusicUtilities15AIDiffingUpdateV19insertedSectionsSet10Foundation05IndexG0Vvpfi_0()
{
  return IndexSet.init()();
}

uint64_t sub_10052F970()
{
  return type metadata accessor for IndexSet();
}

uint64_t sub_10052F980()
{
  return TimeZone.init(identifier:)();
}

uint64_t sub_10052F990()
{
  return TimeZone.init(secondsFromGMT:)();
}

NSTimeZone sub_10052F9A0()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_10052F9C0()
{
  return type metadata accessor for TimeZone();
}

NSIndexPath sub_10052F9D0()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_10052F9E0()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052F9F0()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_10052FA00()
{
  return IndexPath.item.getter();
}

uint64_t sub_10052FA10()
{
  return IndexPath.section.getter();
}

uint64_t sub_10052FA20()
{
  return IndexPath.count.getter();
}

uint64_t sub_10052FA30()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_10052FA40()
{
  return IndexPath.subscript.getter();
}

uint64_t sub_10052FA50()
{
  return IndexPath.subscript.setter();
}

uint64_t sub_10052FA60()
{
  return type metadata accessor for MotionMode();
}

uint64_t sub_10052FA70()
{
  return dispatch thunk of MarkupRenderer.attributedString.getter();
}

uint64_t sub_10052FA80()
{
  return MarkupRenderer.init(_:)();
}

uint64_t sub_10052FA90()
{
  return CircularProgressView.init(value:trackColor:lineWidth:lineStyle:)();
}

uint64_t sub_10052FAA0()
{
  return type metadata accessor for CircularProgressView.LineStyle();
}

uint64_t sub_10052FAB0()
{
  return type metadata accessor for CircularProgressView();
}

uint64_t sub_10052FAC0()
{
  return SplitPercentageLayout.init(axis:locations:)();
}

uint64_t sub_10052FAD0()
{
  return type metadata accessor for SplitPercentageLayout();
}

uint64_t sub_10052FAE0()
{
  return dispatch thunk of static ApproximatelyEquatable.==~ infix(_:_:)();
}

uint64_t sub_10052FAF0()
{
  return static ApproximatelyEquatable.!=~ infix(_:_:)();
}

uint64_t sub_10052FB00()
{
  return static ApproximatelyEquatable<>.==~ infix(_:_:)();
}

uint64_t sub_10052FB10()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_10052FB20()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_10052FB30()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t sub_10052FB40()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t _s9MusicCore6PlayerC18NowPlayingObserverC22__observationRegistrar33_031AD420BBF8BBF113A2662767DAC2BBLL11Observation0oH0Vvpfi_0()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_10052FB60()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_10052FB70()
{
  return type metadata accessor for CGPathFillRule();
}

uint64_t sub_10052FB80()
{
  return CGFloat.floorValue(scale:)();
}

uint64_t sub_10052FB90()
{
  return CGFloat.roundValue(scale:)();
}

uint64_t sub_10052FBA0()
{
  return CGFloat.ceilingValue(scale:)();
}

NSNumber sub_10052FBB0()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_10052FBC0()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10052FBD0()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10052FBE0()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10052FBF0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_10052FC00()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_10052FC10()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_10052FC20()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10052FC30()
{
  return GroupSessionEvent.init(originator:action:url:)();
}

uint64_t sub_10052FC40()
{
  return static GroupSessionEvent.Action.QueueChange.Item.song(_:)();
}

uint64_t sub_10052FC50()
{
  return static GroupSessionEvent.Action.QueueChange.Item.container(_:)();
}

uint64_t sub_10052FC60()
{
  return type metadata accessor for GroupSessionEvent.Action.QueueChange.Item();
}

uint64_t sub_10052FC70()
{
  return static GroupSessionEvent.Action.QueueChange.added(_:)();
}

uint64_t sub_10052FC80()
{
  return type metadata accessor for GroupSessionEvent.Action.QueueChange();
}

uint64_t sub_10052FC90()
{
  return static GroupSessionEvent.Action.updatedQueue.getter();
}

uint64_t sub_10052FCA0()
{
  return static GroupSessionEvent.Action.updatedQueue(_:)();
}

uint64_t sub_10052FCB0()
{
  return static GroupSessionEvent.Action.play.getter();
}

uint64_t sub_10052FCC0()
{
  return static GroupSessionEvent.Action.seek.getter();
}

uint64_t sub_10052FCD0()
{
  return static GroupSessionEvent.Action.skip(item:)();
}

uint64_t sub_10052FCE0()
{
  return static GroupSessionEvent.Action.pause.getter();
}

uint64_t sub_10052FCF0()
{
  return static GroupSessionEvent.Action.react(with:)();
}

uint64_t sub_10052FD00()
{
  return static GroupSessionEvent.Action.start.getter();
}

uint64_t sub_10052FD10()
{
  return type metadata accessor for GroupSessionEvent.Action();
}

uint64_t sub_10052FD20()
{
  return type metadata accessor for GroupSessionEvent();
}

uint64_t sub_10052FD30()
{
  return GroupStateObserver.isEligibleForGroupSession.getter();
}

uint64_t sub_10052FD40()
{
  return GroupStateObserver.__allocating_init()();
}

uint64_t sub_10052FD50()
{
  return type metadata accessor for GroupStateObserver();
}

uint64_t sub_10052FD60()
{
  return static GroupActivityMetadata.ActivityType.listenTogether.getter();
}

uint64_t sub_10052FD70()
{
  return type metadata accessor for GroupActivityMetadata.ActivityType();
}

uint64_t sub_10052FD80()
{
  return GroupActivityMetadata.fallbackURL.setter();
}

uint64_t sub_10052FD90()
{
  return GroupActivityMetadata.previewImage.setter();
}

uint64_t sub_10052FDA0()
{
  return GroupActivityMetadata.supportsContinuationOnTV.setter();
}

uint64_t sub_10052FDB0()
{
  return GroupActivityMetadata.type.setter();
}

uint64_t sub_10052FDC0()
{
  return GroupActivityMetadata.title.setter();
}

uint64_t sub_10052FDD0()
{
  return GroupActivityMetadata.subtitle.setter();
}

uint64_t sub_10052FDE0()
{
  return GroupActivityMetadata.init()();
}

uint64_t sub_10052FDF0()
{
  return type metadata accessor for GroupActivityMetadata();
}

uint64_t sub_10052FE00()
{
  return static GroupActivityActivationResult.== infix(_:_:)();
}

uint64_t sub_10052FE10()
{
  return type metadata accessor for GroupActivityActivationResult();
}

uint64_t sub_10052FE20()
{
  return GroupSession.showNotice(_:)();
}

uint64_t sub_10052FE30()
{
  return GroupSession.isFirstJoin.getter();
}

uint64_t sub_10052FE40()
{
  return GroupSession.localParticipant.getter();
}

uint64_t sub_10052FE50()
{
  return GroupSession.activeParticipants.getter();
}

uint64_t sub_10052FE60()
{
  return GroupSession.isLocallyInitiated.getter();
}

uint64_t sub_10052FE70()
{
  return GroupSession.$activeParticipants.getter();
}

void sub_10052FE80()
{
}

uint64_t sub_10052FE90()
{
  return static GroupSession.State.== infix(_:_:)();
}

void sub_10052FEA0()
{
}

uint64_t sub_10052FEB0()
{
  return GroupSession.state.getter();
}

uint64_t sub_10052FEC0()
{
  return GroupSession.$state.getter();
}

uint64_t sub_10052FED0()
{
  return GroupSession.Sessions.makeAsyncIterator()();
}

uint64_t sub_10052FEE0()
{
  return GroupSession.activity.getter();
}

uint64_t sub_10052FEF0()
{
  return GroupSession.activity.setter();
}

uint64_t sub_10052FF00()
{
  return static GroupActivity._identifiable(by:)();
}

uint64_t sub_10052FF30()
{
  return static GroupActivity.sessions()();
}

uint64_t sub_10052FF40()
{
  return Participant.id.getter();
}

uint64_t sub_10052FF50()
{
  return type metadata accessor for Participant();
}

uint64_t sub_10052FF60()
{
  return dispatch thunk of LibraryArtistInternalFilter.favoriteStatus.getter();
}

uint64_t sub_10052FF70()
{
  return type metadata accessor for RecentlyAddedMusicItem();
}

uint64_t sub_10052FF80()
{
  return dispatch thunk of LibraryPlaylistEntryInternalFilter.playlist.getter();
}

uint64_t sub_10052FF90()
{
  return GenericMusicItem.init(_:)();
}

uint64_t sub_10052FFA0()
{
  return type metadata accessor for GenericMusicItem();
}

uint64_t sub_10052FFB0()
{
  return static MusicLibraryAction<>.undoDislike.getter();
}

uint64_t sub_10052FFC0()
{
  return static MusicLibraryAction<>.undoFavorite.getter();
}

uint64_t sub_10052FFD0()
{
  return static MusicLibraryAction<>.removeDownload.getter();
}

uint64_t sub_10052FFE0()
{
  return static MusicLibraryAction<>.add.getter();
}

uint64_t sub_10052FFF0()
{
  return static MusicLibraryAction<>.remove.getter();
}

uint64_t sub_100530000()
{
  return static MusicLibraryAction<>.dislike.getter();
}

uint64_t sub_100530010()
{
  return static MusicLibraryAction<>.download.getter();
}

uint64_t sub_100530020()
{
  return static MusicLibraryAction<>.favorite.getter();
}

uint64_t sub_100530030()
{
  return static MusicFavoriteStatus.== infix(_:_:)();
}

uint64_t sub_100530040()
{
  return type metadata accessor for MusicFavoriteStatus();
}

uint64_t sub_100530050()
{
  return MusicSiriRepresentation.id.getter();
}

uint64_t sub_100530060()
{
  return type metadata accessor for MusicSiriRepresentation();
}

uint64_t sub_100530070()
{
  return MusicAutoupdatableRequest.autoupdatingResponse.getter();
}

uint64_t sub_100530080()
{
  return dispatch thunk of MusicAutoupdatingResponse.isLoaded.getter();
}

uint64_t sub_100530090()
{
  return dispatch thunk of MusicAutoupdatingResponse.$response.getter();
}

uint64_t sub_1005300A0()
{
  return MusicCollaborativePlaylist.JoinRequest.init(playlist:invitationURL:)();
}

uint64_t sub_1005300D0()
{
  return type metadata accessor for MusicCollaborativePlaylist.JoinRequest();
}

uint64_t sub_1005300E0()
{
  return MusicCollaborativePlaylist.EndCollaborationRequest.init(playlist:)();
}

uint64_t sub_100530100()
{
  return type metadata accessor for MusicCollaborativePlaylist.EndCollaborationRequest();
}

uint64_t sub_100530110()
{
  return MusicCollaborativePlaylist.RemoveCollaboratorRequest.init(collaborator:playlist:)();
}

uint64_t sub_100530130()
{
  return type metadata accessor for MusicCollaborativePlaylist.RemoveCollaboratorRequest();
}

uint64_t sub_100530140()
{
  return MusicCollaborativePlaylist.StartCollaborationRequest.init(playlist:invitationMode:)();
}

uint64_t sub_100530160()
{
  return type metadata accessor for MusicCollaborativePlaylist.StartCollaborationRequest();
}

uint64_t sub_100530170()
{
  return MusicCollaborativePlaylist.ResetInvitationLinkRequest.init(playlist:)();
}

uint64_t sub_100530190()
{
  return type metadata accessor for MusicCollaborativePlaylist.ResetInvitationLinkRequest();
}

uint64_t sub_1005301A0()
{
  return MusicCollaborativePlaylist.UpdateInvitationModeRequest.init(collaboration:updatedInvitationMode:)();
}

uint64_t sub_1005301C0()
{
  return type metadata accessor for MusicCollaborativePlaylist.UpdateInvitationModeRequest();
}

uint64_t sub_1005301D0()
{
  return MusicCollaborativePlaylist.PendingCollaboratorDecisionRequest.init(collaborator:playlist:)();
}

uint64_t sub_100530200()
{
  return type metadata accessor for MusicCollaborativePlaylist.PendingCollaboratorDecisionRequest();
}

uint64_t sub_100530210()
{
  return static MusicLibraryPlaylistRequest.duplicatingPlaylist(_:)();
}

uint64_t sub_100530220()
{
  return type metadata accessor for MusicLibraryPlaylistRequest.CompletionPolicy();
}

uint64_t sub_100530230()
{
  return MusicLibraryPlaylistRequest.completionPolicy.setter();
}

uint64_t sub_100530240()
{
  return static MusicLibraryPlaylistRequest.editing(_:name:description:userImage:isPublic:isVisible:curator:)();
}

uint64_t sub_100530260()
{
  return type metadata accessor for MusicLibraryPlaylistRequest();
}

uint64_t sub_100530270()
{
  return MusicLibraryPlaylistResponse.playlist.getter();
}

uint64_t sub_100530280()
{
  return type metadata accessor for MusicLibraryPlaylistResponse();
}

uint64_t sub_100530290()
{
  return MusicMovie.contentRating.getter();
}

uint64_t sub_1005302A0()
{
  return MusicMovie.url.getter();
}

uint64_t sub_1005302B0()
{
  return MusicMovie.artwork.getter();
}

uint64_t sub_1005302C0()
{
  return MusicMovie.catalogID.getter();
}

uint64_t sub_1005302D0()
{
  return type metadata accessor for MusicMovie();
}

uint64_t sub_1005302E0()
{
  return MusicOffer.Kind.rawValue.getter();
}

uint64_t sub_1005302F0()
{
  return type metadata accessor for MusicOffer.Kind();
}

uint64_t sub_100530300()
{
  return MusicOffer.kind.getter();
}

uint64_t sub_100530310()
{
  return type metadata accessor for MusicOffer();
}

uint64_t sub_100530320()
{
  return static InternalMusicPlayer.localDevice.getter();
}

uint64_t sub_100530340()
{
  return type metadata accessor for InternalMusicPlayer();
}

uint64_t sub_100530350()
{
  return UserProfile.artwork.getter();
}

uint64_t sub_100530360()
{
  return CreditArtist.artwork.getter();
}

uint64_t sub_100530370()
{
  return type metadata accessor for CreditArtist();
}

uint64_t sub_100530380()
{
  return EditorialItem.url.getter();
}

uint64_t sub_100530390()
{
  return EditorialItem.artwork.getter();
}

uint64_t sub_1005303A0()
{
  return type metadata accessor for EditorialItem();
}

uint64_t sub_1005303B0()
{
  return SocialProfile.id.getter();
}

uint64_t sub_1005303C0()
{
  return SocialProfile.url.getter();
}

uint64_t sub_1005303D0()
{
  return SocialProfile.artwork.getter();
}

uint64_t sub_1005303E0()
{
  return type metadata accessor for SocialProfile();
}

uint64_t sub_1005303F0()
{
  return UploadedAudio.contentRating.getter();
}

uint64_t sub_100530400()
{
  return UploadedAudio.artwork.getter();
}

uint64_t _s16MusicKitInternal13UploadedAudioV0A4CoreE3url10Foundation3URLVSgvg_0()
{
  return UploadedAudio.postURL.getter();
}

uint64_t sub_100530420()
{
  return UploadedAudio.catalogID.getter();
}

uint64_t sub_100530430()
{
  return type metadata accessor for UploadedAudio();
}

uint64_t sub_100530440()
{
  return UploadedVideo.contentRating.getter();
}

uint64_t sub_100530450()
{
  return UploadedVideo.artwork.getter();
}

uint64_t _s16MusicKitInternal13UploadedVideoV0A4CoreE3url10Foundation3URLVSgvg_0()
{
  return UploadedVideo.postURL.getter();
}

uint64_t sub_100530470()
{
  return UploadedVideo.catalogID.getter();
}

uint64_t sub_100530480()
{
  return type metadata accessor for UploadedVideo();
}

uint64_t sub_100530490()
{
  return VideoContentRating.isExplicit.getter();
}

uint64_t sub_1005304A0()
{
  return type metadata accessor for VideoContentRating();
}

uint64_t sub_1005304B0()
{
  return dispatch thunk of SocialProfileFilter.id.getter();
}

uint64_t sub_1005304C0()
{
  return TVShow.contentRating.getter();
}

uint64_t sub_1005304D0()
{
  return TVShow.url.getter();
}

uint64_t sub_1005304E0()
{
  return TVShow.artwork.getter();
}

uint64_t sub_1005304F0()
{
  return TVShow.catalogID.getter();
}

uint64_t sub_100530500()
{
  return type metadata accessor for TVShow();
}

uint64_t sub_100530510()
{
  return type metadata accessor for Composer();
}

uint64_t sub_100530520()
{
  return TVSeason.contentRating.getter();
}

uint64_t sub_100530530()
{
  return TVSeason.url.getter();
}

uint64_t sub_100530540()
{
  return TVSeason.artwork.getter();
}

uint64_t sub_100530550()
{
  return TVSeason.catalogID.getter();
}

uint64_t sub_100530560()
{
  return type metadata accessor for TVSeason();
}

uint64_t sub_100530570()
{
  return TVEpisode.contentRating.getter();
}

uint64_t sub_100530580()
{
  return TVEpisode.previewArtwork.getter();
}

uint64_t sub_100530590()
{
  return TVEpisode.url.getter();
}

uint64_t sub_1005305A0()
{
  return TVEpisode.artwork.getter();
}

uint64_t sub_1005305B0()
{
  return TVEpisode.catalogID.getter();
}

uint64_t sub_1005305C0()
{
  return type metadata accessor for TVEpisode();
}

uint64_t sub_1005305D0()
{
  return type metadata accessor for ArtworkImage.ReusePolicy();
}

uint64_t sub_1005305E0()
{
  return ArtworkImage.artworkCropStyle(_:)();
}

uint64_t sub_1005305F0()
{
  return ArtworkImage.artworkPlaceholder<A>(_:)();
}

uint64_t sub_100530600()
{
  return ArtworkImage.artworkReusablePolicy(_:)();
}

uint64_t sub_100530610()
{
  return ArtworkImage.artworkIdealAspectRatio(_:contentMode:)();
}

uint64_t sub_100530620()
{
  return ArtworkImage.init(_:width:height:)();
}

uint64_t sub_100530630()
{
  return ArtworkImage.init(_:width:)();
}

uint64_t sub_100530640()
{
  return ArtworkImage.init(_:height:)();
}

uint64_t sub_100530650()
{
  return ArtworkImage.init(_:)();
}

uint64_t sub_100530660()
{
  return type metadata accessor for ArtworkImage();
}

uint64_t sub_100530670()
{
  return ArtworkImage.init(_:height:)();
}

uint64_t sub_100530690()
{
  return StoreReviewGatingController.init(bag:)();
}

uint64_t sub_1005306C0()
{
  return type metadata accessor for StoreReviewGatingController();
}

uint64_t sub_1005306D0()
{
  return OrderedSet.init(arrayLiteral:)();
}

uint64_t sub_1005306E0()
{
  return OrderedSet._find(_:)();
}

uint64_t sub_1005306F0()
{
  return OrderedSet._append(_:)();
}

uint64_t sub_100530700()
{
  return type metadata accessor for OrderedSet();
}

uint64_t sub_100530710()
{
  return _HashTable.UnsafeHandle._startIterator(bucket:)();
}

uint64_t sub_100530720()
{
  return _HashTable.UnsafeHandle.subscript.setter();
}

uint64_t sub_100530730()
{
  return _HashTable.BucketIterator.currentValue.getter();
}

uint64_t sub_100530740()
{
  return _HashTable.BucketIterator.currentValue.setter();
}

void sub_100530750()
{
}

uint64_t sub_100530760()
{
  return static _HashTable.maximumCapacity(forScale:)();
}

uint64_t sub_100530770()
{
  return _HashTable.copy()();
}

uint64_t sub_100530780()
{
  return static _HashTable.scale(forCapacity:)();
}

uint64_t sub_100530790()
{
  return _HashTable.init(scale:reservedScale:)();
}

uint64_t sub_1005307A0()
{
  return UTType.identifier.getter();
}

uint64_t sub_1005307B0()
{
  return static UTType.png.getter();
}

uint64_t sub_1005307C0()
{
  return static UTType.image.getter();
}

uint64_t sub_1005307D0()
{
  return type metadata accessor for UTType();
}

uint64_t sub_1005307E0()
{
  return dispatch thunk of LegacyModelObjectConvertible.init(_:)();
}

uint64_t sub_1005307F0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100530800()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t sub_100530810()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_100530820()
{
  return OSSignpostID.init(log:object:)();
}

uint64_t sub_100530830()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_100530840()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_100530850()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_100530860()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100530870()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_100530880()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_100530890()
{
  return OSSignposter.init(subsystem:category:)();
}

uint64_t sub_1005308A0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_1005308B0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_1005308C0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_1005308D0()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_1005308E0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_1005308F0()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_100530900()
{
  return Logger.logObject.getter();
}

uint64_t sub_100530910()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100530920()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100530930()
{
  return Logger.init(_:)();
}

uint64_t sub_100530940()
{
  return MusicPlaybackIntentDescriptor.playbackIntent.getter();
}

uint64_t sub_100530950()
{
  return MusicPlaybackIntentDescriptor.init(stationSeed:)();
}

uint64_t sub_100530970()
{
  return type metadata accessor for MusicPlaybackIntentDescriptor();
}

uint64_t sub_100530980()
{
  return dispatch thunk of LanguageAwareString.attributedString.getter();
}

uint64_t sub_100530990()
{
  return static LanguageAwareString.keepStatisticsOnLanguageComponents.getter();
}

uint64_t sub_1005309A0()
{
  return type metadata accessor for LanguageAwareString();
}

uint64_t sub_1005309B0()
{
  return LanguageAwareString.init(_:attributes:baseParagraphStyle:keepStatisticsOnLanguageComponents:)();
}

uint64_t sub_1005309C0()
{
  return dispatch thunk of UIContentView.configuration.setter();
}

uint64_t sub_1005309E0()
{
  return static UIHoverEffect<>.lift.getter();
}

uint64_t sub_1005309F0()
{
  return static UIHoverEffect<>.highlight.getter();
}

uint64_t sub_100530A00()
{
  return static UIPointerShape.defaultCornerRadius.getter();
}

uint64_t sub_100530A10()
{
  return type metadata accessor for UIPointerShape();
}

uint64_t sub_100530A20()
{
  return type metadata accessor for UIPointerEffect();
}

uint64_t sub_100530A30()
{
  return type metadata accessor for UIHoverLiftEffect();
}

uint64_t sub_100530A40()
{
  return type metadata accessor for UIHoverHighlightEffect();
}

uint64_t sub_100530A50()
{
  return type metadata accessor for UITraitLayoutDirection();
}

uint64_t sub_100530A60()
{
  return type metadata accessor for UITraitActiveAppearance();
}

uint64_t sub_100530A70()
{
  return static UICellConfigurationState.DragState.== infix(_:_:)();
}

uint64_t sub_100530A80()
{
  return type metadata accessor for UICellConfigurationState.DragState();
}

uint64_t sub_100530A90()
{
  return UICellConfigurationState.cellDragState.getter();
}

uint64_t sub_100530AA0()
{
  return static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100530AB0()
{
  return type metadata accessor for UICellConfigurationState();
}

uint64_t sub_100530AC0()
{
  return UIViewConfigurationState.isDisabled.setter();
}

uint64_t sub_100530AD0()
{
  return UIViewConfigurationState.isSelected.getter();
}

uint64_t sub_100530AE0()
{
  return UIViewConfigurationState.isSelected.setter();
}

uint64_t sub_100530AF0()
{
  return UIViewConfigurationState.isHighlighted.getter();
}

uint64_t sub_100530B00()
{
  return UIViewConfigurationState.isHighlighted.setter();
}

uint64_t sub_100530B10()
{
  return UIViewConfigurationState.init(traitCollection:)();
}

uint64_t sub_100530B20()
{
  return UIViewConfigurationState.traitCollection.getter();
}

uint64_t sub_100530B30()
{
  return type metadata accessor for UIViewConfigurationState();
}

uint64_t sub_100530B40()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t sub_100530B50()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t sub_100530B60()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

void sub_100530B70(Swift::OpaquePointer a1)
{
}

uint64_t sub_100530B80()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t sub_100530B90()
{
  return type metadata accessor for NSDiffableDataSourceSnapshot();
}

uint64_t sub_100530BA0()
{
  return type metadata accessor for UITraitAccessibilityContrast();
}

uint64_t sub_100530BB0()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t sub_100530BC0()
{
  return static UIShape.rect(cornerRadius:cornerCurve:maskedCorners:)();
}

uint64_t sub_100530BD0()
{
  return type metadata accessor for UIShape();
}

uint64_t sub_100530BE0()
{
  return errno.getter();
}

uint64_t sub_100530BF0()
{
  return noErr.getter();
}

uint64_t sub_100530C00()
{
  return S_IRUSR.getter();
}

uint64_t sub_100530C10()
{
  return S_IWUSR.getter();
}

uint64_t sub_100530C20()
{
  return S_IXUSR.getter();
}

uint64_t sub_100530C30()
{
  return type metadata accessor for Publishers.Drop();
}

uint64_t sub_100530C40()
{
  return Publishers.MergeMany.init(_:)();
}

uint64_t sub_100530C50()
{
  return type metadata accessor for Publishers.ReceiveOn();
}

uint64_t sub_100530C60()
{
  return AnyCancellable.store(in:)();
}

void sub_100530C70()
{
}

uint64_t sub_100530C80()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_100530C90()
{
  return AsyncPublisher.makeAsyncIterator()();
}

uint64_t sub_100530CA0()
{
  return AsyncPublisher.init(_:)();
}

uint64_t sub_100530CB0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100530CC0()
{
  return ConnectablePublisher.autoconnect()();
}

void sub_100530CD0()
{
}

uint64_t sub_100530CE0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100530CF0()
{
  return Published.projectedValue.getter();
}

uint64_t sub_100530D00()
{
  return Published.projectedValue.setter();
}

uint64_t sub_100530D10()
{
  return static Published.subscript.modify();
}

uint64_t sub_100530D20()
{
  return static Published.subscript.getter();
}

uint64_t sub_100530D30()
{
  return static Published.subscript.setter();
}

uint64_t sub_100530D40()
{
  return type metadata accessor for Published.Publisher();
}

uint64_t sub_100530D50()
{
  return type metadata accessor for Published();
}

uint64_t sub_100530D60()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_100530D70()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_100530D80()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_100530D90()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_100530DA0()
{
  return Publisher.dropFirst(_:)();
}

uint64_t sub_100530DB0()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t sub_100530DC0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_100530DD0()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_100530DE0()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_100530DF0()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_100530E00()
{
  return AppStorage.wrappedValue.getter();
}

uint64_t sub_100530E10()
{
  return AppStorage.projectedValue.getter();
}

uint64_t sub_100530E20()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_100530E30()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_100530E40()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_100530E50()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100530E60()
{
  return LabelGroup.init(content:)();
}

uint64_t sub_100530E70()
{
  return LazyHStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_100530E80()
{
  return type metadata accessor for LazyHStack();
}

uint64_t sub_100530E90()
{
  return type metadata accessor for Prominence();
}

uint64_t sub_100530EA0()
{
  return type metadata accessor for ScrollView();
}

uint64_t sub_100530EB0()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_100530EC0()
{
  return TapGesture.init(count:)();
}

uint64_t sub_100530ED0()
{
  return type metadata accessor for TapGesture();
}

uint64_t sub_100530EE0()
{
  return Transition.animation(_:)();
}

uint64_t sub_100530EF0()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_100530F00()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100530F10()
{
  return static ContentMode.== infix(_:_:)();
}

uint64_t sub_100530F20()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100530F30()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t sub_100530F40()
{
  return type metadata accessor for DragGesture();
}

uint64_t sub_100530F50()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100530F60()
{
  return static GestureMask.all.getter();
}

uint64_t sub_100530F70()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_100530F80()
{
  return StateObject.projectedValue.getter();
}

uint64_t sub_100530F90()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_100530FA0()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_100530FB0()
{
  return type metadata accessor for ToolbarItem();
}

uint64_t sub_100530FC0()
{
  return Transaction.disablesAnimations.setter();
}

uint64_t sub_100530FE0()
{
  return type metadata accessor for _LayoutRoot();
}

uint64_t sub_100530FF0()
{
  return _LayoutRoot.init(_:)();
}

uint64_t sub_100531000()
{
  return GestureState.init(wrappedValue:)();
}

uint64_t sub_100531010()
{
  return GestureState.wrappedValue.getter();
}

uint64_t sub_100531020()
{
  return GestureState.projectedValue.getter();
}

uint64_t sub_100531030()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_100531040()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t sub_100531050()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_100531060()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_100531070()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_100531080()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_100531090()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_1005310A0()
{
  return ViewThatFits.init(in:content:)();
}

uint64_t sub_1005310B0()
{
  return type metadata accessor for ViewThatFits();
}

uint64_t sub_1005310C0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1005310D0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1005310E0()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_1005310F0()
{
  return static AnyTransition.asymmetric(insertion:removal:)();
}

uint64_t sub_100531100()
{
  return static AnyTransition.scale(scale:anchor:)();
}

uint64_t sub_100531110()
{
  return static AnyTransition.opacity.getter();
}

uint64_t sub_100531120()
{
  return AnyTransition.combined(with:)();
}

uint64_t sub_100531130()
{
  return AnyTransition.animation(_:)();
}

uint64_t sub_100531140()
{
  return AnyTransition.init<A>(_:)();
}

void sub_100531150()
{
}

uint64_t sub_100531160()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_100531170()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100531180()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_100531190()
{
  return LayoutSubview.dimensions(in:)();
}

uint64_t sub_1005311A0()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t sub_1005311B0()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t sub_1005311C0()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t sub_1005311D0()
{
  return static OpenURLAction.Result.handled.getter();
}

uint64_t sub_1005311E0()
{
  return OpenURLAction.init(handler:)();
}

uint64_t sub_1005311F0()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_100531200()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_100531210()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_100531220()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t sub_100531230()
{
  return type metadata accessor for _VariadicView.Tree();
}

uint64_t sub_100531240()
{
  return _VariadicView.Tree.init(_:content:)();
}

uint64_t sub_100531250()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_100531260()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_100531280()
{
  return GeometryReader.init(content:)();
}

uint64_t sub_100531290()
{
  return type metadata accessor for GeometryReader();
}

uint64_t sub_1005312A0()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t sub_1005312B0()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_1005312C0()
{
  return type metadata accessor for NavigationPath();
}

uint64_t sub_1005312D0()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_1005312E0()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_1005312F0()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_100531300()
{
  return PlaybackButton.init<A>(interval:state:intent:playSystemImage:pauseSystemImage:)();
}

uint64_t sub_100531310()
{
  return type metadata accessor for PlaybackButton.State();
}

uint64_t sub_100531320()
{
  return type metadata accessor for PlaybackButton();
}

uint64_t sub_100531330()
{
  return ScrollGeometry.contentSize.getter();
}

uint64_t sub_100531340()
{
  return ScrollGeometry.visibleRect.getter();
}

uint64_t sub_100531350()
{
  return ScrollGeometry.contentInsets.getter();
}

uint64_t sub_100531360()
{
  return ScrollGeometry.contentOffset.getter();
}

uint64_t sub_100531370()
{
  return type metadata accessor for ScrollGeometry();
}

uint64_t sub_100531380()
{
  return TintShapeStyle.init()();
}

uint64_t sub_100531390()
{
  return type metadata accessor for TintShapeStyle();
}

uint64_t sub_1005313A0()
{
  return static ToolbarContent._makeToolbar(content:inputs:)();
}

uint64_t sub_1005313B0()
{
  return static ToolbarContent._makeContent(content:inputs:resolved:)();
}

uint64_t sub_1005313C0()
{
  return ViewDimensions.width.getter();
}

uint64_t sub_1005313D0()
{
  return type metadata accessor for ViewDimensions();
}

uint64_t sub_1005313E0()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_1005313F0()
{
  return _UIHostingView.__allocating_init(rootView:)();
}

uint64_t sub_100531400()
{
  return dispatch thunk of _UIHostingView.__allocating_init(rootView:)();
}

uint64_t sub_100531410()
{
  return dispatch thunk of _UIHostingView.rootView.setter();
}

uint64_t sub_100531420()
{
  return type metadata accessor for _UIHostingView();
}

uint64_t sub_100531430()
{
  return ButtonMenuStyle.init()();
}

uint64_t sub_100531440()
{
  return type metadata accessor for ButtonMenuStyle();
}

uint64_t sub_100531450()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_100531460()
{
  return static DynamicTypeSize.< infix(_:_:)();
}

uint64_t sub_100531470()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100531480()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t sub_100531490()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_1005314A0()
{
  return ModifiedContent.init(content:modifier:)();
}

uint64_t sub_1005314B0()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_1005314C0()
{
  return NavigationStack.init<>(root:)();
}

uint64_t sub_1005314D0()
{
  return type metadata accessor for NavigationStack();
}

uint64_t sub_1005314E0()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_1005314F0()
{
  return type metadata accessor for ScaleTransition();
}

uint64_t sub_100531500()
{
  return ScaleTransition.init(_:anchor:)();
}

uint64_t sub_100531510()
{
  return ScrollViewProxy.scrollTo(rect:anchor:)();
}

uint64_t sub_100531520()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_100531530()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_100531540()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_100531550()
{
  return static ProposedViewSize.zero.getter();
}

uint64_t sub_100531560()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_100531570()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_100531580()
{
  return RoundedRectangle._Inset.path(in:)();
}

uint64_t sub_100531590()
{
  return type metadata accessor for RoundedRectangle._Inset();
}

uint64_t sub_1005315A0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1005315B0()
{
  return ScrollViewReader.init(content:)();
}

uint64_t sub_1005315C0()
{
  return type metadata accessor for ScrollViewReader();
}

uint64_t sub_1005315D0()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t sub_1005315E0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1005315F0()
{
  return type metadata accessor for _OverlayModifier();
}

uint64_t sub_100531600()
{
  return static ButtonBorderShape.circle.getter();
}

uint64_t sub_100531610()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t sub_100531620()
{
  return static ContentShapeKinds.hoverEffect.getter();
}

uint64_t sub_100531630()
{
  return static ContentShapeKinds.interaction.getter();
}

uint64_t sub_100531640()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t sub_100531650()
{
  return static ContentTransition.opacity.getter();
}

uint64_t sub_100531660()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_100531670()
{
  return static CustomHoverEffect<>.automatic.getter();
}

uint64_t sub_100531680()
{
  return static CustomHoverEffect<>.highlight.getter();
}

uint64_t sub_1005316A0()
{
  return EnvironmentObject.error()();
}

uint64_t sub_1005316B0()
{
  return EnvironmentObject.init()();
}

uint64_t sub_1005316C0()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1005316D0()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_1005316E0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1005316F0()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100531700()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_100531710()
{
  return EnvironmentValues.controlSize.setter();
}

uint64_t sub_100531720()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_100531730()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_100531740()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_100531750()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100531760()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100531770()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100531780()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_100531790()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_1005317A0()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_1005317B0()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_1005317C0()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t sub_1005317D0()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1005317E0()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1005317F0()
{
  return EnvironmentValues.colorSchemeContrast.getter();
}

uint64_t sub_100531800()
{
  return EnvironmentValues.displayCornerRadius.getter();
}

uint64_t sub_100531810()
{
  return EnvironmentValues.displayCornerRadius.setter();
}

uint64_t sub_100531820()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_100531830()
{
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t sub_100531840()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_100531850()
{
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t sub_100531860()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100531870()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100531880()
{
  return EnvironmentValues.defaultMinListRowHeight.getter();
}

uint64_t sub_100531890()
{
  return EnvironmentValues.defaultMinListRowHeight.setter();
}

uint64_t sub_1005318A0()
{
  return EnvironmentValues.effectiveForegroundColor.getter();
}

uint64_t sub_1005318B0()
{
  return EnvironmentValues.accessibilityShowButtonShapes.getter();
}

uint64_t sub_1005318C0()
{
  return EnvironmentValues.accessibilityReduceTransparency.getter();
}

uint64_t sub_1005318D0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1005318E0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1005318F0()
{
  return EnvironmentValues.tint.getter();
}

uint64_t sub_100531900()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_100531910()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_100531920()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t sub_100531930()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_100531940()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_100531950()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_100531960()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100531970()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100531980()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100531990()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_1005319A0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1005319B0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1005319C0()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_1005319D0()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_1005319E0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1005319F0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100531A00()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_100531A10()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_100531A20()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_100531A30()
{
  return OpacityTransition.init()();
}

uint64_t sub_100531A40()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t sub_100531A50()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t sub_100531A60()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_100531A70()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t sub_100531A80()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100531A90()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

void sub_100531AA0(Swift::String a1)
{
}

void sub_100531AB0(Swift::String a1)
{
}

uint64_t sub_100531AC0()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100531AD0()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_100531AE0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100531AF0()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_100531B00()
{
  return LocalizedStringKey.init(_:)();
}

uint64_t sub_100531B10()
{
  return PresentationSizing.proposedSize(for:context:)();
}

uint64_t sub_100531B20()
{
  return PresentationSizing.sizingOptions(context:)();
}

uint64_t sub_100531B30()
{
  return static RoundedCornerStyle.== infix(_:_:)();
}

uint64_t sub_100531B40()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100531B50()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t sub_100531B60()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t sub_100531B70()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_100531B80()
{
  return type metadata accessor for ColorSchemeContrast();
}

uint64_t sub_100531B90()
{
  return static HorizontalAlignment.listRowSeparatorLeading.getter();
}

uint64_t sub_100531BA0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100531BB0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100531BC0()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t sub_100531BD0()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t sub_100531BE0()
{
  return static SymbolRenderingMode.palette.getter();
}

uint64_t sub_100531BF0()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_100531C00()
{
  return type metadata accessor for TupleToolbarContent();
}

uint64_t sub_100531C10()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t sub_100531C20()
{
  return dispatch thunk of UIHostingController.sizeThatFits(in:)();
}

uint64_t sub_100531C30()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t sub_100531C40()
{
  return UIHostingController.safeAreaRegions.setter();
}

uint64_t sub_100531C50()
{
  return UIHostingController.__allocating_init(rootView:)();
}

uint64_t sub_100531C60()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100531C70()
{
  return dispatch thunk of UIHostingController.rootView.modify();
}

uint64_t sub_100531C80()
{
  return type metadata accessor for UIHostingController();
}

uint64_t sub_100531C90()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_100531CA0()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_100531CB0()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100531CD0()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_100531CE0()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_100531CF0()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_100531D00()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_100531D10()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_100531D20()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_100531D40()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t sub_100531D50()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100531D60()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_100531D70()
{
  return WidgetConfiguration.disfavoredLocations(_:for:)();
}

uint64_t sub_100531D80()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100531D90()
{
  return WidgetConfiguration.configurationDisplayName<A>(_:)();
}

uint64_t sub_100531DA0()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_100531DB0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100531DC0()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_100531DD0()
{
  return type metadata accessor for AutomaticHoverEffect();
}

uint64_t sub_100531DE0()
{
  return type metadata accessor for HighlightHoverEffect();
}

uint64_t sub_100531DF0()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t sub_100531E00()
{
  return static ScrollBounceBehavior.basedOnSize.getter();
}

uint64_t sub_100531E10()
{
  return type metadata accessor for ScrollBounceBehavior();
}

uint64_t sub_100531E20()
{
  return static SearchFieldPlacement.navigationBarDrawer.getter();
}

uint64_t sub_100531E30()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t sub_100531E40()
{
  return static ToolbarItemPlacement.topBarTrailing.getter();
}

uint64_t sub_100531E50()
{
  return static ToolbarItemPlacement.automatic.getter();
}

uint64_t sub_100531E60()
{
  return static ToolbarItemPlacement.principal.getter();
}

uint64_t sub_100531E70()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_100531E80()
{
  return BorderlessButtonStyle.init()();
}

uint64_t sub_100531E90()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t sub_100531EA0()
{
  return InsetGroupedListStyle.init()();
}

uint64_t sub_100531EB0()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t sub_100531EC0()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t sub_100531ED0()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100531EE0()
{
  return type metadata accessor for _ViewModifier_Content();
}

uint64_t sub_100531EF0()
{
  return static ContentUnavailableView<>.search.getter();
}

uint64_t sub_100531F00()
{
  return static HierarchicalShapeStyle.quaternary.getter();
}

uint64_t sub_100531F10()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_100531F20()
{
  return static HierarchicalShapeStyle.quinary.getter();
}

uint64_t sub_100531F30()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_100531F40()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_100531F50()
{
  return TitleAndIconLabelStyle.init()();
}

uint64_t sub_100531F60()
{
  return type metadata accessor for TitleAndIconLabelStyle();
}

uint64_t sub_100531F70()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t sub_100531F80()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t sub_100531F90()
{
  return SafeAreaPaddingModifier.init(edges:insets:)();
}

uint64_t sub_100531FA0()
{
  return type metadata accessor for SafeAreaPaddingModifier();
}

uint64_t sub_100531FB0()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t sub_100531FC0()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t sub_100531FD0()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t sub_100531FE0()
{
  return type metadata accessor for _ForegroundStyleModifier();
}

uint64_t sub_100531FF0()
{
  return CircularProgressViewStyle.init()();
}

uint64_t sub_100532000()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t sub_100532010()
{
  return static ScrollIndicatorVisibility.never.getter();
}

uint64_t sub_100532020()
{
  return static ScrollIndicatorVisibility.hidden.getter();
}

uint64_t sub_100532030()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t sub_100532040()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_100532050()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t sub_100532060()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_100532070()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t sub_100532080()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t sub_100532090()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_1005320A0()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_1005320B0()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_1005320C0()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_1005320D0()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1005320F0()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_100532100()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_100532110()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_100532130()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_100532140()
{
  return type metadata accessor for _EnvironmentKeyWritingModifier();
}

uint64_t sub_100532150()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_100532160()
{
  return static ViewAlignedScrollTargetBehavior.LimitBehavior.automatic.getter();
}

uint64_t sub_100532170()
{
  return type metadata accessor for ViewAlignedScrollTargetBehavior.LimitBehavior();
}

uint64_t sub_100532180()
{
  return ViewAlignedScrollTargetBehavior.init(limitBehavior:)();
}

uint64_t sub_100532190()
{
  return type metadata accessor for ViewAlignedScrollTargetBehavior();
}

uint64_t sub_1005321A0()
{
  return static UIHostingControllerSizingOptions.intrinsicContentSize.getter();
}

uint64_t sub_1005321B0()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t sub_1005321C0()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t sub_1005321D0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1005321E0()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t sub_1005321F0()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t sub_100532200()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_100532210()
{
  return Axis.rawValue.getter();
}

uint64_t sub_100532220()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_100532230()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100532240()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100532250()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_100532260()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100532270()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_100532280()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100532290()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_1005322A0()
{
  return Edge.Set.init(_:)();
}

uint64_t sub_1005322B0()
{
  return Edge.rawValue.getter();
}

uint64_t sub_1005322C0()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_1005322D0()
{
  return static Font.subheadline.getter();
}

uint64_t sub_1005322E0()
{
  return static Font.body.getter();
}

uint64_t sub_1005322F0()
{
  return Font.bold()();
}

uint64_t sub_100532300()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100532310()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_100532320()
{
  return static Font.Weight.light.getter();
}

uint64_t sub_100532330()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_100532340()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_100532350()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_100532360()
{
  return static Font.custom(_:size:relativeTo:)();
}

uint64_t sub_100532370()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_100532380()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_100532390()
{
  return static Font.title2.getter();
}

uint64_t sub_1005323A0()
{
  return static Font.title3.getter();
}

uint64_t sub_1005323B0()
{
  return Font.weight(_:)();
}

uint64_t sub_1005323C0()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_1005323D0()
{
  return static Font.callout.getter();
}

uint64_t sub_1005323E0()
{
  return static Font.caption.getter();
}

uint64_t sub_1005323F0()
{
  return Font.leading(_:)();
}

uint64_t sub_100532400()
{
  return static Font.caption2.getter();
}

uint64_t sub_100532410()
{
  return static Font.footnote.getter();
}

uint64_t sub_100532420()
{
  return static Font.headline.getter();
}

uint64_t sub_100532430()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_100532440()
{
  return Link.init(destination:label:)();
}

uint64_t sub_100532450()
{
  return List<>.init(content:)();
}

uint64_t sub_100532460()
{
  return Menu.init(onPresentationChanged:content:label:)();
}

uint64_t sub_100532470()
{
  return Menu.init(content:label:)();
}

uint64_t sub_100532480()
{
  return type metadata accessor for Menu();
}

uint64_t sub_100532490()
{
  return Path.init(roundedRect:cornerSize:style:)();
}

uint64_t sub_1005324A0()
{
  return Path.init(_:)();
}

uint64_t sub_1005324B0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1005324C0()
{
  return type metadata accessor for Text.WritingMode();
}

uint64_t sub_1005324D0()
{
  return Text.Measurements.size(of:in:writingMode:)();
}

uint64_t sub_1005324E0()
{
  return Text.Measurements.init()();
}

uint64_t sub_1005324F0()
{
  return type metadata accessor for Text.Measurements();
}

uint64_t sub_100532500()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_100532510()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100532520()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100532530()
{
  return Text.accessibilityLabel(_:)();
}

uint64_t sub_100532540()
{
  return Text.accessibilityLabel<A>(_:)();
}

uint64_t sub_100532550()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_100532560()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_100532570()
{
  return Text.bold()();
}

uint64_t sub_100532580()
{
  return Text.font(_:)();
}

uint64_t sub_100532590()
{
  return static Text.Suffix.alwaysVisible(_:)();
}

uint64_t sub_1005325A0()
{
  return type metadata accessor for Text.Suffix();
}

uint64_t sub_1005325B0()
{
  return static Text.LineStyle.Pattern.solid.getter();
}

uint64_t sub_1005325C0()
{
  return type metadata accessor for Text.LineStyle.Pattern();
}

uint64_t sub_1005325D0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1005325E0()
{
  return Text.init(_:)();
}

uint64_t sub_1005325F0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100532600()
{
  return Text.init(_:)();
}

uint64_t sub_100532610()
{
  return View.artworkCaching(id:limit:)();
}

uint64_t sub_100532620()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_100532630()
{
  return View.widgetURL(_:)();
}

uint64_t sub_100532640()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100532650()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100532660()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t sub_100532670()
{
  return View.fontWeight(_:)();
}

uint64_t sub_100532680()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_100532690()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t sub_1005326A0()
{
  return View.textSuffix(_:)();
}

uint64_t sub_1005326B0()
{
  return View.unredacted()();
}

uint64_t sub_1005326C0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_1005326D0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_1005326E0()
{
  return View.contextMenu<A, B>(menuItems:preview:previewAction:)();
}

uint64_t sub_1005326F0()
{
  return View.contextMenu<A, B>(menuItems:preview:)();
}

uint64_t sub_100532700()
{
  return View.contextMenu<A>(menuItems:)();
}

uint64_t sub_100532710()
{
  return View.environment<A>(_:_:)();
}

uint64_t sub_100532720()
{
  return View.hoverEffect<A>(_:isEnabled:)();
}

uint64_t sub_100532730()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_100532740()
{
  return View.swipeActions<A>(edge:allowsFullSwipe:content:)();
}

uint64_t sub_100532750()
{
  return View.accessibility(sortPriority:)();
}

uint64_t sub_100532760()
{
  return View.accessibility(hidden:)();
}

uint64_t sub_100532770()
{
  return View.sharingPicker(isPresented:item:subject:message:)();
}

uint64_t sub_100532780()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100532790()
{
  return View.scrollDisabled(_:)();
}

uint64_t sub_1005327A0()
{
  return View.bodyHeadOutdent(_:)();
}

uint64_t sub_1005327B0()
{
  return View.dynamicTypeSize(_:)();
}

uint64_t sub_1005327C0()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_1005327D0()
{
  return View.foregroundColor(_:)();
}

uint64_t sub_1005327E0()
{
  return View.foregroundStyle<A>(_:)();
}

uint64_t sub_1005327F0()
{
  return View.fullScreenCover<A>(isPresented:onDismiss:content:)();
}

uint64_t sub_100532800()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t sub_100532810()
{
  return View.compositingGroup()();
}

uint64_t sub_100532820()
{
  return View.headerProminence(_:)();
}

uint64_t sub_100532830()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t sub_100532840()
{
  return View.environmentObject<A>(_:)();
}

uint64_t sub_100532850()
{
  return View.confirmationDialog<A, B, C>(_:isPresented:titleVisibility:actions:message:)();
}

uint64_t sub_100532860()
{
  return View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:)();
}

uint64_t sub_100532870()
{
  return View.navigationBarItems<A>(trailing:)();
}

uint64_t sub_100532880()
{
  return View.presentationSizing<A>(_:)();
}

uint64_t sub_100532890()
{
  return View.scrollClipDisabled(_:)();
}

uint64_t sub_1005328A0()
{
  return View.scrollTargetLayout(isEnabled:)();
}

uint64_t sub_1005328B0()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_1005328C0()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_1005328D0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_1005328E0()
{
  return View.scrollBounceBehavior(_:axes:)();
}

uint64_t sub_1005328F0()
{
  return View.scrollTargetBehavior<A>(_:)();
}

uint64_t sub_100532900()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_100532910()
{
  return View.multilineTextAlignment(_:)();
}

uint64_t sub_100532920()
{
  return View.onScrollGeometryChange<A>(for:of:action:)();
}

uint64_t sub_100532930()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_100532940()
{
  return View.accessibilityRepresentation<A>(representation:)();
}

uint64_t sub_100532950()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_100532960()
{
  return View.id<A>(_:)();
}

uint64_t sub_100532970()
{
  return View.bold(_:)();
}

uint64_t sub_100532980()
{
  return View.alert(isPresented:content:)();
}

uint64_t sub_100532990()
{
  return View.alert<A, B, C>(_:isPresented:actions:message:)();
}

uint64_t sub_1005329A0()
{
  return View.alert<A, B>(_:isPresented:actions:)();
}

uint64_t sub_1005329B0()
{
  return View.frame(width:height:alignment:)();
}

uint64_t sub_1005329C0()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t sub_1005329D0()
{
  return View.hidden()();
}

uint64_t sub_1005329E0()
{
  return View.gesture<A>(_:including:)();
}

uint64_t sub_1005329F0()
{
  return View.overlay<A>(_:alignment:)();
}

uint64_t sub_100532A00()
{
  return View.padding(_:_:)();
}

uint64_t sub_100532A10()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_100532A20()
{
  return View.modifier<A>(_:)();
}

uint64_t sub_100532A30()
{
  return View.onAppear(perform:)();
}

uint64_t sub_100532A40()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_100532A50()
{
  return View.redacted(reason:)();
}

uint64_t sub_100532A60()
{
  return View.textCase(_:)();
}

uint64_t sub_100532A70()
{
  return View.fixedSize(horizontal:vertical:)();
}

uint64_t sub_100532A80()
{
  return View.lineLimit(_:)();
}

uint64_t sub_100532A90()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_100532AA0()
{
  return View.menuOrder(_:)();
}

uint64_t sub_100532AB0()
{
  return View.menuStyle<A>(_:)();
}

uint64_t sub_100532AC0()
{
  return View.underline(_:pattern:color:)();
}

uint64_t sub_100532AD0()
{
  return Alert.init(title:message:primaryButton:secondaryButton:)();
}

uint64_t sub_100532AE0()
{
  return static Alert.Button.destructive(_:action:)();
}

uint64_t sub_100532AF0()
{
  return static Alert.Button.cancel(_:)();
}

uint64_t sub_100532B00()
{
  return static Alert.Button.default(_:action:)();
}

uint64_t sub_100532B10()
{
  return type metadata accessor for Alert.Button();
}

uint64_t sub_100532B20()
{
  return Color.init(uiColor:)();
}

uint64_t sub_100532B30()
{
  return static Color.accentColor.getter();
}

uint64_t sub_100532B40()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_100532B50()
{
  return static Color.== infix(_:_:)();
}

uint64_t sub_100532B60()
{
  return static Color.red.getter();
}

uint64_t sub_100532B70()
{
  return Color.hash(into:)();
}

uint64_t sub_100532B80()
{
  return static Color.black.getter();
}

uint64_t sub_100532B90()
{
  return static Color.clear.getter();
}

uint64_t sub_100532BA0()
{
  return static Color.green.getter();
}

uint64_t sub_100532BB0()
{
  return static Color.white.getter();
}

uint64_t sub_100532BC0()
{
  return Color.opacity(_:)();
}

uint64_t sub_100532BD0()
{
  return static Color.primary.getter();
}

uint64_t sub_100532BE0()
{
  return static Color.secondary.getter();
}

uint64_t sub_100532BF0()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_100532C00()
{
  return Color.init(_:)();
}

uint64_t sub_100532C10()
{
  return Image.init(uiImage:)();
}

uint64_t sub_100532C20()
{
  return Image.init(systemName:)();
}

uint64_t sub_100532C30()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100532C40()
{
  return Image.renderingMode(_:)();
}

uint64_t sub_100532C50()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100532C60()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_100532C70()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t sub_100532C80()
{
  return static Image.== infix(_:_:)();
}

uint64_t sub_100532C90()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_100532CA0()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_100532CB0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100532CC0()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_100532CD0()
{
  return Label.init(title:icon:)();
}

uint64_t sub_100532CE0()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_100532CF0()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_100532D20()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t sub_100532D40()
{
  return static Shape.role.getter();
}

uint64_t sub_100532D60()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100532D70()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100532D80()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100532D90()
{
  return State.projectedValue.getter();
}

uint64_t sub_100532DA0()
{
  return type metadata accessor for State();
}

uint64_t sub_100532DB0()
{
  return Button.init<A>(intent:label:)();
}

uint64_t sub_100532DC0()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_100532DD0()
{
  return Button.init(action:label:)();
}

uint64_t sub_100532DE0()
{
  return Button<>.init<A>(_:role:action:)();
}

uint64_t sub_100532DF0()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_100532E00()
{
  return type metadata accessor for Button();
}

uint64_t sub_100532E10()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_100532E20()
{
  return type metadata accessor for HStack();
}

uint64_t sub_100532E30()
{
  return type metadata accessor for IDView();
}

uint64_t sub_100532E40()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t sub_100532E50()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t sub_100532E60()
{
  return static Layout.layoutProperties.getter();
}

uint64_t sub_100532E70()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t sub_100532E80()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_100532E90()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_100532EA0()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_100532EB0()
{
  return type metadata accessor for VStack();
}

uint64_t sub_100532EC0()
{
  return ZStack.init(alignment:content:)();
}

uint64_t sub_100532ED0()
{
  return type metadata accessor for ZStack();
}

uint64_t sub_100532EE0()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_100532EF0()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_100532F00()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_100532F10()
{
  return Binding.init(get:set:)();
}

uint64_t sub_100532F20()
{
  return type metadata accessor for Binding();
}

uint64_t sub_100532F30()
{
  return Capsule._Inset.path(in:)();
}

uint64_t sub_100532F40()
{
  return type metadata accessor for Capsule();
}

uint64_t sub_100532F50()
{
  return Divider.init()();
}

uint64_t sub_100532F60()
{
  return type metadata accessor for Divider();
}

uint64_t sub_100532F70()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100532F80()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100532F90()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100532FA0()
{
  return type metadata accessor for ForEach();
}

uint64_t sub_100532FB0()
{
  return Gesture.onEnded(_:)();
}

uint64_t sub_100532FC0()
{
  return Section<>.init(_:content:)();
}

uint64_t sub_100532FD0()
{
  return Section<>.init<A>(_:content:)();
}

uint64_t sub_100532FE0()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_100532FF0()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_100533000()
{
  return Section<>.init(content:)();
}

uint64_t sub_100533010()
{
  return type metadata accessor for Section();
}

uint64_t sub_100533020()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t sub_100533030()
{
  return Gradient.init(stops:)();
}

uint64_t sub_100533040()
{
  return Gradient.init(colors:)();
}

uint64_t sub_100533050()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t sub_100533060()
{
  return type metadata accessor for GridItem();
}

uint64_t sub_100533070()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t sub_100533080()
{
  return static Material.thin.getter();
}

uint64_t sub_100533090()
{
  return static Material.thick.getter();
}

uint64_t sub_1005330A0()
{
  return static Material.regular.getter();
}

uint64_t sub_1005330B0()
{
  return type metadata accessor for Material();
}

uint64_t sub_1005330C0()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_1005330D0()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_1005330E0()
{
  return static Alignment.top.getter();
}

uint64_t sub_1005330F0()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_100533100()
{
  return static Alignment.center.getter();
}

uint64_t sub_100533110()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100533120()
{
  return static Alignment.trailing.getter();
}

uint64_t sub_100533130()
{
  return static Animation.interpolatingSpring(mass:stiffness:damping:initialVelocity:)();
}

uint64_t sub_100533140()
{
  return Animation.delay(_:)();
}

uint64_t sub_100533150()
{
  return static Animation.easeIn(duration:)();
}

uint64_t sub_100533160()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t sub_100533170()
{
  return static Animation.default.getter();
}

uint64_t sub_100533180()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t sub_100533190()
{
  return AnyLayout.init<A>(_:)();
}

uint64_t sub_1005331A0()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_1005331B0()
{
  return LazyHGrid.init(rows:alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_1005331C0()
{
  return static MenuOrder.fixed.getter();
}

uint64_t sub_1005331D0()
{
  return type metadata accessor for MenuOrder();
}

uint64_t sub_1005331E0()
{
  return TextField<>.init<A>(_:text:onEditingChanged:onCommit:)();
}

uint64_t sub_1005331F0()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_100533200()
{
  return TupleView.init(_:)();
}

uint64_t sub_100533210()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t sub_100533220()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_100533230()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_100533240()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_100533250()
{
  return static UnitPoint.leading.getter();
}

uint64_t sub_100533260()
{
  return static UnitPoint.trailing.getter();
}

uint64_t sub_100533270()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_100533280()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100533290()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_1005332A0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1005332B0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1005332C0()
{
  return static DispatchTime.distantFuture.getter();
}

uint64_t sub_1005332D0()
{
  return static DispatchTime.now()();
}

uint64_t sub_1005332E0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1005332F0()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_100533300()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_100533310()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_100533320()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_100533330()
{
  return + infix(_:_:)();
}

uint64_t sub_100533340()
{
  return + infix(_:_:)();
}

uint64_t sub_100533350()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_100533360()
{
  return RecentlyPlayedMusicItem.siriRepresentation.getter();
}

uint64_t sub_100533370()
{
  return RecentlyPlayedMusicItem.id.getter();
}

uint64_t sub_100533380()
{
  return RecentlyPlayedMusicItem.title.getter();
}

uint64_t sub_100533390()
{
  return RecentlyPlayedMusicItem.artwork.getter();
}

uint64_t sub_1005333A0()
{
  return RecentlyPlayedMusicItem.subtitle.getter();
}

uint64_t sub_1005333B0()
{
  return type metadata accessor for RecentlyPlayedMusicItem();
}

uint64_t sub_1005333C0()
{
  return static PartialMusicProperty<A>.customLyrics.getter();
}

uint64_t sub_1005333D0()
{
  return static PartialMusicProperty<A>.offers.getter();
}

uint64_t sub_1005333E0()
{
  return static PartialMusicProperty<A>.offers.getter();
}

uint64_t sub_1005333F0()
{
  return static PartialMusicProperty<A>.tracks.getter();
}

uint64_t sub_100533400()
{
  return static PartialMusicProperty<A>.tracks.getter();
}

uint64_t sub_100533410()
{
  return type metadata accessor for MusicDataRequest.ExecutionMethod();
}

uint64_t sub_100533420()
{
  return static MusicDataRequest.preferredExecutionMethod.setter();
}

uint64_t sub_100533430()
{
  return type metadata accessor for MusicDataRequest.Source();
}

uint64_t sub_100533440()
{
  return MusicCatalogChart.items.getter();
}

uint64_t sub_100533450()
{
  return type metadata accessor for MusicSubscription.PrivacyAcknowledgementPolicy();
}

uint64_t sub_100533470()
{
  return MusicSubscription.canPlayCatalogContent.getter();
}

uint64_t sub_100533480()
{
  return type metadata accessor for MusicSubscription();
}

uint64_t sub_100533490()
{
  return MusicItemCollection.init(arrayLiteral:)();
}

uint64_t sub_1005334A0()
{
  return MusicItemCollection.hasNextBatch.getter();
}

uint64_t sub_1005334B0()
{
  return static MusicItemCollection.+= infix(_:_:)();
}

uint64_t sub_1005334D0()
{
  return static MusicItemCollection<>.== infix(_:_:)();
}

uint64_t sub_1005334E0()
{
  return type metadata accessor for MusicItemCollection();
}

uint64_t sub_1005334F0()
{
  return MusicLibraryRequest<>.filter<A>(matching:equalTo:)();
}

uint64_t sub_100533500()
{
  return MusicLibraryRequest<>.filter<A>(matching:equalTo:)();
}

uint64_t sub_100533510()
{
  return MusicLibraryRequest.wantsDetailedLibraryResponse.setter();
}

uint64_t sub_100533520()
{
  return MusicLibraryRequest.library.setter();
}

uint64_t sub_100533540()
{
  return MusicLibraryRequest.sort<A>(by:ascending:)();
}

uint64_t sub_100533550()
{
  return MusicLibraryRequest.limit.setter();
}

uint64_t sub_100533570()
{
  return MusicLibraryRequest.init()();
}

uint64_t sub_100533580()
{
  return MusicLibrarySection.item.getter();
}

uint64_t sub_100533590()
{
  return MusicLibrarySection.subscript.getter();
}

uint64_t sub_1005335A0()
{
  return MusicLibrarySection.items.getter();
}

uint64_t sub_1005335B0()
{
  return type metadata accessor for MusicPropertySource();
}

uint64_t sub_1005335C0()
{
  return MusicLibraryResponse.items.getter();
}

uint64_t sub_1005335D0()
{
  return type metadata accessor for MusicCatalogChartKind();
}

uint64_t sub_1005335E0()
{
  return MusicAttributeProperty.init(_:)();
}

uint64_t sub_100533600()
{
  return MusicCatalogChartsRequest.excludeDefaultCharts.setter();
}

uint64_t sub_100533610()
{
  return MusicCatalogChartsRequest.includeGeoLocation.setter();
}

uint64_t sub_100533620()
{
  return MusicCatalogChartsRequest.source.setter();
}

uint64_t sub_100533630()
{
  return MusicCatalogChartsRequest.init(genre:kinds:types:)();
}

uint64_t sub_100533640()
{
  return MusicCatalogChartsRequest.limit.setter();
}

uint64_t sub_100533650()
{
  return MusicCatalogChartsRequest.offset.getter();
}

uint64_t sub_100533660()
{
  return MusicCatalogChartsRequest.offset.setter();
}

uint64_t sub_100533680()
{
  return type metadata accessor for MusicCatalogChartsRequest();
}

uint64_t sub_100533690()
{
  return MusicRelationshipProperty.limit(_:)();
}

uint64_t sub_1005336A0()
{
  return MusicCatalogChartsResponse.playlistCharts.getter();
}

uint64_t sub_1005336B0()
{
  return type metadata accessor for MusicCatalogChartsResponse();
}

uint64_t sub_1005336C0()
{
  return MusicRecentlyPlayedRequest.source.setter();
}

uint64_t sub_1005336D0()
{
  return MusicRecentlyPlayedRequest.limit.setter();
}

uint64_t sub_1005336F0()
{
  return MusicRecentlyPlayedRequest.init()();
}

uint64_t sub_100533700()
{
  return MusicCatalogResourceRequest.performAutomaticLibraryMapping.setter();
}

uint64_t sub_100533710()
{
  return MusicCatalogResourceRequest.source.setter();
}

uint64_t sub_100533720()
{
  return MusicCatalogResourceRequest.properties.setter();
}

uint64_t sub_100533730()
{
  return MusicCatalogResourceRequest.init<A>(matching:equalTo:)();
}

uint64_t sub_100533740()
{
  return MusicCatalogResourceRequest.init<A>(matching:memberOf:)();
}

uint64_t sub_100533760()
{
  return type metadata accessor for MusicPersonalRecommendation.Kind();
}

uint64_t sub_100533770()
{
  return MusicPersonalRecommendation.kind.getter();
}

uint64_t sub_100533780()
{
  return MusicPersonalRecommendation.Item.friendsWhoListened.getter();
}

uint64_t sub_100533790()
{
  return MusicPersonalRecommendation.Item.siriRepresentation.getter();
}

uint64_t sub_1005337A0()
{
  return MusicPersonalRecommendation.Item.recommendationReason.getter();
}

uint64_t sub_1005337B0()
{
  return MusicPersonalRecommendation.Item.id.getter();
}

uint64_t sub_1005337C0()
{
  return MusicPersonalRecommendation.Item.title.getter();
}

uint64_t sub_1005337D0()
{
  return MusicPersonalRecommendation.Item.artwork.getter();
}

uint64_t sub_1005337E0()
{
  return MusicPersonalRecommendation.Item.subtitle.getter();
}

uint64_t sub_1005337F0()
{
  return type metadata accessor for MusicPersonalRecommendation.Item();
}

uint64_t sub_100533800()
{
  return MusicPersonalRecommendation.items.getter();
}

uint64_t sub_100533810()
{
  return MusicPersonalRecommendation.title.getter();
}

uint64_t sub_100533820()
{
  return type metadata accessor for MusicPersonalRecommendation();
}

uint64_t sub_100533830()
{
  return MusicRecentlyPlayedResponse.items.getter();
}

uint64_t sub_100533840()
{
  return MusicCatalogResourceResponse.items.getter();
}

uint64_t sub_100533850()
{
  return MusicLibrarySectionedRequest.filterSections<A>(matching:equalTo:)();
}

uint64_t sub_100533860()
{
  return MusicLibrarySectionedRequest.init()();
}

uint64_t sub_100533870()
{
  return MusicLibrarySectionedResponse.totalItemCount.getter();
}

uint64_t sub_100533880()
{
  return MusicLibrarySectionedResponse.sections.getter();
}

uint64_t sub_100533890()
{
  return MusicPersonalRecommendationsRequest.source.setter();
}

uint64_t sub_1005338A0()
{
  return type metadata accessor for MusicPersonalRecommendationsRequest.Content.AdditionalContent();
}

uint64_t sub_1005338B0()
{
  return type metadata accessor for MusicPersonalRecommendationsRequest.Content();
}

uint64_t sub_1005338C0()
{
  return MusicPersonalRecommendationsRequest.content.setter();
}

uint64_t sub_1005338E0()
{
  return MusicPersonalRecommendationsRequest.init()();
}

uint64_t sub_1005338F0()
{
  return type metadata accessor for MusicPersonalRecommendationsRequest();
}

uint64_t sub_100533900()
{
  return MusicPersonalRecommendationsResponse.recommendations.getter();
}

uint64_t sub_100533910()
{
  return type metadata accessor for MusicPersonalRecommendationsResponse();
}

uint64_t sub_100533920()
{
  return dispatch thunk of MusicItem.id.getter();
}

uint64_t sub_100533940()
{
  return MusicVideo.favoriteStatus.getter();
}

uint64_t sub_100533950()
{
  return MusicVideo.catalogID.getter();
}

uint64_t sub_100533960()
{
  return MusicVideo.albumTitle.getter();
}

uint64_t sub_100533970()
{
  return MusicVideo.contentRating.getter();
}

uint64_t sub_100533980()
{
  return MusicVideo.previewAssets.getter();
}

uint64_t sub_100533990()
{
  return MusicVideo.url.getter();
}

uint64_t sub_1005339A0()
{
  return MusicVideo.albums.getter();
}

uint64_t sub_1005339B0()
{
  return MusicVideo.artwork.getter();
}

uint64_t sub_1005339C0()
{
  return type metadata accessor for MusicVideo();
}

uint64_t sub_1005339D0()
{
  return MusicItemID.description.getter();
}

uint64_t sub_1005339E0()
{
  return MusicItemID.init(stringLiteral:)();
}

uint64_t sub_1005339F0()
{
  return MusicItemID.init(rawValue:)();
}

uint64_t sub_100533A00()
{
  return MusicItemID.init(_:)();
}

uint64_t sub_100533A10()
{
  return static MusicPlayer.PlayabilityStatus.UnplayableReason.== infix(_:_:)();
}

uint64_t sub_100533A20()
{
  return type metadata accessor for MusicPlayer.PlayabilityStatus.UnplayableReason();
}

uint64_t sub_100533A30()
{
  return type metadata accessor for MusicPlayer.PlayabilityStatus();
}

uint64_t sub_100533A40()
{
  return type metadata accessor for MusicPlayer.PreviewCapabilityStatus.UnpreviewableReason();
}

uint64_t sub_100533A50()
{
  return type metadata accessor for MusicPlayer.PreviewCapabilityStatus();
}

uint64_t sub_100533A60()
{
  return dispatch thunk of MusicPlayer.ItemState.playabilityStatus.getter();
}

uint64_t sub_100533A70()
{
  return dispatch thunk of MusicPlayer.ItemState.$playabilityStatus.getter();
}

uint64_t sub_100533A80()
{
  return dispatch thunk of MusicPlayer.ItemState.previewCapabilityStatus.getter();
}

uint64_t sub_100533A90()
{
  return dispatch thunk of MusicPlayer.ItemState.$previewCapabilityStatus.getter();
}

uint64_t sub_100533AA0()
{
  return dispatch thunk of MusicPlayer.ItemState.item.setter();
}

uint64_t sub_100533AB0()
{
  return MusicLibrary.mediaLibrary.getter();
}

uint64_t sub_100533AD0()
{
  return type metadata accessor for MusicLibrary.RemoveAction.UnsupportedReason();
}

uint64_t sub_100533AE0()
{
  return type metadata accessor for MusicLibrary.RemoveAction();
}

uint64_t sub_100533B00()
{
  return type metadata accessor for MusicLibrary.DislikeAction.UnsupportedReason();
}

uint64_t sub_100533B10()
{
  return type metadata accessor for MusicLibrary.DislikeAction();
}

uint64_t sub_100533B30()
{
  return type metadata accessor for MusicLibrary.DownloadAction.UnsupportedReason();
}

uint64_t sub_100533B40()
{
  return type metadata accessor for MusicLibrary.DownloadAction();
}

uint64_t sub_100533B50()
{
  return static MusicLibrary.DownloadStatus.DownloadPauseReasons.thermalPressure.getter();
}

uint64_t sub_100533B60()
{
  return static MusicLibrary.DownloadStatus.DownloadPauseReasons.constrainedNetwork.getter();
}

uint64_t sub_100533B70()
{
  return static MusicLibrary.DownloadStatus.DownloadPauseReasons.cellularDataDisallowed.getter();
}

uint64_t sub_100533B80()
{
  return type metadata accessor for MusicLibrary.DownloadStatus.DownloadPauseReasons();
}

uint64_t sub_100533B90()
{
  return type metadata accessor for MusicLibrary.DownloadStatus();
}

uint64_t sub_100533BA0()
{
  return type metadata accessor for MusicLibrary.FavoriteAction.UnsupportedReason();
}

uint64_t sub_100533BB0()
{
  return type metadata accessor for MusicLibrary.FavoriteAction();
}

uint64_t sub_100533BF0()
{
  return MusicLibrary.supportedStatus<A, B>(for:action:)();
}

uint64_t sub_100533C00()
{
  return type metadata accessor for MusicLibrary.UndoDislikeAction.UnsupportedReason();
}

uint64_t sub_100533C10()
{
  return type metadata accessor for MusicLibrary.UndoDislikeAction();
}

uint64_t sub_100533C20()
{
  return type metadata accessor for MusicLibrary.UndoFavoriteAction.UnsupportedReason();
}

uint64_t sub_100533C30()
{
  return type metadata accessor for MusicLibrary.UndoFavoriteAction();
}

uint64_t sub_100533C40()
{
  return type metadata accessor for MusicLibrary.RemoveDownloadAction.UnsupportedReason();
}

uint64_t sub_100533C50()
{
  return type metadata accessor for MusicLibrary.RemoveDownloadAction();
}

uint64_t sub_100533C60()
{
  return static MusicLibrary.== infix(_:_:)();
}

uint64_t sub_100533C70()
{
  return MusicLibrary.id.getter();
}

uint64_t sub_100533C90()
{
  return MusicLibrary.name.getter();
}

uint64_t sub_100533CA0()
{
  return MusicLibrary.state<A>(for:)();
}

uint64_t sub_100533CF0()
{
  return type metadata accessor for MusicLibrary.AddAction.UnsupportedReason();
}

uint64_t sub_100533D00()
{
  return type metadata accessor for MusicLibrary.AddAction();
}

uint64_t sub_100533D10()
{
  return type metadata accessor for MusicLibrary.AddStatus.UnaddableReason();
}

uint64_t sub_100533D20()
{
  return type metadata accessor for MusicLibrary.AddStatus();
}

uint64_t sub_100533D30()
{
  return dispatch thunk of MusicLibrary.ItemState.$addStatus.getter();
}

uint64_t sub_100533D40()
{
  return dispatch thunk of MusicLibrary.ItemState.downloadStatus.getter();
}

uint64_t sub_100533D50()
{
  return dispatch thunk of MusicLibrary.ItemState.$downloadStatus.getter();
}

uint64_t sub_100533D60()
{
  return dispatch thunk of MusicLibrary.ItemState.item.getter();
}

uint64_t sub_100533D70()
{
  return dispatch thunk of MusicLibrary.ItemState.item.setter();
}

uint64_t sub_100533D80()
{
  return dispatch thunk of MusicLibrary.ItemState.isAdded.getter();
}

uint64_t sub_100533D90()
{
  return dispatch thunk of MusicLibrary.ItemState.addStatus.getter();
}

uint64_t sub_100533DA0()
{
  return type metadata accessor for MusicLibrary.ItemState();
}

uint64_t sub_100533DB0()
{
  return static MusicLibrary.shared.getter();
}

uint64_t sub_100533DC0()
{
  return type metadata accessor for MusicLibrary();
}

uint64_t sub_100533DD0()
{
  return RecordLabel.url.getter();
}

uint64_t sub_100533DE0()
{
  return RecordLabel.artwork.getter();
}

uint64_t sub_100533DF0()
{
  return type metadata accessor for RecordLabel();
}

uint64_t sub_100533E00()
{
  return type metadata accessor for AudioVariant();
}

uint64_t sub_100533E10()
{
  return PreviewAsset.url.getter();
}

uint64_t sub_100533E20()
{
  return PreviewAsset.artwork.getter();
}

uint64_t sub_100533E30()
{
  return type metadata accessor for PreviewAsset();
}

uint64_t sub_100533E40()
{
  return type metadata accessor for ContentRating();
}

uint64_t sub_100533E50()
{
  return dispatch thunk of PlaylistFilter.id.getter();
}

uint64_t sub_100533E60()
{
  return dispatch thunk of LibraryPlaylistFilter.id.getter();
}

uint64_t sub_100533E70()
{
  return Song.customLyrics.getter();
}

uint64_t sub_100533E80()
{
  return Song.favoriteStatus.getter();
}

uint64_t sub_100533E90()
{
  return Song.hasCustomLyrics.getter();
}

uint64_t sub_100533EA0()
{
  return Song.hasTimeSyncedLyrics.getter();
}

uint64_t sub_100533EB0()
{
  return Song.offers.getter();
}

uint64_t sub_100533EC0()
{
  return Song.catalogID.getter();
}

uint64_t sub_100533ED0()
{
  return Song.albumTitle.getter();
}

uint64_t sub_100533EE0()
{
  return Song.audioVariants.getter();
}

uint64_t sub_100533EF0()
{
  return Song.contentRating.getter();
}

uint64_t sub_100533F00()
{
  return Song.previewAssets.getter();
}

uint64_t sub_100533F10()
{
  return static Song.== infix(_:_:)();
}

uint64_t sub_100533F20()
{
  return Song.id.getter();
}

uint64_t sub_100533F30()
{
  return Song.url.getter();
}

uint64_t sub_100533F40()
{
  return Song.title.getter();
}

uint64_t sub_100533F50()
{
  return Song.artwork.getter();
}

uint64_t sub_100533F60()
{
  return Song.hasLyrics.getter();
}

uint64_t sub_100533F70()
{
  return type metadata accessor for Song();
}

uint64_t sub_100533F80()
{
  return Album.isSingleMusicVideo.getter();
}

uint64_t sub_100533F90()
{
  return Album.favoriteStatus.getter();
}

uint64_t sub_100533FA0()
{
  return Album.siriRepresentation.getter();
}

uint64_t sub_100533FB0()
{
  return Album.isClassicalExperienceAvailable.getter();
}

uint64_t sub_100533FC0()
{
  return Album.offers.getter();
}

uint64_t sub_100533FD0()
{
  return Album.catalogID.getter();
}

uint64_t sub_100533FE0()
{
  return Album.artistName.getter();
}

uint64_t sub_100533FF0()
{
  return Album.releaseDate.getter();
}

uint64_t sub_100534000()
{
  return Album.audioVariants.getter();
}

uint64_t sub_100534010()
{
  return Album.contentRating.getter();
}

uint64_t sub_100534020()
{
  return Album.lastPlayedDate.getter();
}

uint64_t sub_100534030()
{
  return Album.id.getter();
}

uint64_t sub_100534040()
{
  return Album.url.getter();
}

uint64_t sub_100534050()
{
  return Album.title.getter();
}

uint64_t sub_100534060()
{
  return Album.tracks.getter();
}

uint64_t sub_100534070()
{
  return Album.artwork.getter();
}

uint64_t sub_100534080()
{
  return type metadata accessor for Album();
}

uint64_t sub_100534090()
{
  return Genre.url.getter();
}

uint64_t sub_1005340A0()
{
  return Genre.artwork.getter();
}

uint64_t sub_1005340B0()
{
  return type metadata accessor for Genre();
}

uint64_t sub_1005340C0()
{
  return Track.siriRepresentation.getter();
}

uint64_t sub_1005340D0()
{
  return Track.catalogID.getter();
}

uint64_t sub_1005340E0()
{
  return Track.albumTitle.getter();
}

uint64_t sub_1005340F0()
{
  return Track.artistName.getter();
}

uint64_t sub_100534100()
{
  return Track.description.getter();
}

uint64_t sub_100534110()
{
  return Track.id.getter();
}

uint64_t sub_100534120()
{
  return Track.url.getter();
}

uint64_t sub_100534130()
{
  return Track.title.getter();
}

uint64_t sub_100534140()
{
  return Track.artwork.getter();
}

uint64_t sub_100534150()
{
  return type metadata accessor for Track();
}

uint64_t sub_100534160()
{
  return Artist.favoriteStatus.getter();
}

uint64_t sub_100534170()
{
  return Artist.catalogID.getter();
}

uint64_t sub_100534180()
{
  return static Artist.== infix(_:_:)();
}

uint64_t sub_100534190()
{
  return Artist.url.getter();
}

uint64_t sub_1005341A0()
{
  return Artist.name.getter();
}

uint64_t sub_1005341B0()
{
  return Artist.subscript.getter();
}

uint64_t sub_1005341C0()
{
  return type metadata accessor for Artist();
}

uint64_t sub_1005341E0()
{
  return Artwork.init(_:)();
}

uint64_t sub_1005341F0()
{
  return type metadata accessor for Artwork.ImageFormat();
}

uint64_t sub_100534200()
{
  return Artwork.url(width:height:cropStyle:format:)();
}

uint64_t sub_100534210()
{
  return static Artwork.CropStyle.squareCenterCrop.getter();
}

uint64_t sub_100534220()
{
  return static Artwork.CropStyle.boundedBox.getter();
}

uint64_t sub_100534230()
{
  return static Artwork.CropStyle.sourceSize.getter();
}

uint64_t sub_100534240()
{
  return static Artwork.CropStyle.constrainedWidth.getter();
}

uint64_t sub_100534250()
{
  return static Artwork.CropStyle.constrainedHeight.getter();
}

uint64_t sub_100534260()
{
  return static Artwork.CropStyle.specificRectangle.getter();
}

uint64_t sub_100534270()
{
  return static Artwork.CropStyle.featuredContentCrop44.getter();
}

uint64_t sub_100534280()
{
  return static Artwork.CropStyle.featuredContentCrop270.getter();
}

uint64_t sub_100534290()
{
  return static Artwork.CropStyle.featuredContentCrop170T100B.getter();
}

uint64_t sub_1005342A0()
{
  return type metadata accessor for Artwork.CropStyle();
}

uint64_t sub_1005342B0()
{
  return Artwork.init(_:)();
}

uint64_t sub_1005342C0()
{
  return Artwork.maximumWidth.getter();
}

uint64_t sub_1005342D0()
{
  return Artwork.maximumHeight.getter();
}

uint64_t sub_1005342E0()
{
  return Artwork.backgroundColor.getter();
}

uint64_t sub_1005342F0()
{
  return Artwork.primaryTextColor.getter();
}

uint64_t sub_100534300()
{
  return Artwork.tertiaryTextColor.getter();
}

uint64_t sub_100534310()
{
  return Artwork.secondaryTextColor.getter();
}

uint64_t sub_100534320()
{
  return static Artwork.== infix(_:_:)();
}

uint64_t sub_100534330()
{
  return type metadata accessor for Artwork();
}

uint64_t sub_100534340()
{
  return Curator.url.getter();
}

uint64_t sub_100534350()
{
  return Curator.artwork.getter();
}

uint64_t sub_100534360()
{
  return type metadata accessor for Curator();
}

uint64_t sub_100534370()
{
  return Station.contentRating.getter();
}

uint64_t _s8MusicKit7StationV0A4CoreE9catalogIDAA0a4ItemF0VSgvg_0()
{
  return Station.id.getter();
}

uint64_t sub_100534390()
{
  return Station.url.getter();
}

uint64_t sub_1005343A0()
{
  return Station.artwork.getter();
}

uint64_t sub_1005343B0()
{
  return type metadata accessor for Station();
}

uint64_t sub_1005343C0()
{
  return Playlist.GeoLocation.countryCode.getter();
}

uint64_t sub_1005343D0()
{
  return Playlist.GeoLocation.name.getter();
}

uint64_t sub_1005343E0()
{
  return type metadata accessor for Playlist.GeoLocation();
}

uint64_t sub_1005343F0()
{
  return Playlist.geoLocation.getter();
}

uint64_t sub_100534400()
{
  return static Playlist.Collaborator.== infix(_:_:)();
}

uint64_t sub_100534410()
{
  return type metadata accessor for Playlist.Collaborator.Role();
}

uint64_t sub_100534420()
{
  return Playlist.Collaborator.name.getter();
}

uint64_t sub_100534430()
{
  return Playlist.Collaborator.role.getter();
}

uint64_t sub_100534440()
{
  return type metadata accessor for Playlist.Collaborator.Status();
}

uint64_t sub_100534450()
{
  return Playlist.Collaborator.handle.getter();
}

uint64_t sub_100534460()
{
  return Playlist.Collaborator.artwork.getter();
}

uint64_t sub_100534470()
{
  return Playlist.Collaborator.isPending.getter();
}

uint64_t sub_100534480()
{
  return type metadata accessor for Playlist.Collaborator();
}

uint64_t sub_100534490()
{
  return Playlist.Collaboration.invitationURL.getter();
}

uint64_t sub_1005344A0()
{
  return type metadata accessor for Playlist.Collaboration.InvitationMode();
}

uint64_t sub_1005344B0()
{
  return Playlist.Collaboration.invitationMode.getter();
}

uint64_t sub_1005344C0()
{
  return Playlist.Collaboration.collaboratorStatus.getter();
}

uint64_t sub_1005344D0()
{
  return Playlist.Collaboration.invitationExpirationDate.getter();
}

uint64_t sub_1005344E0()
{
  return type metadata accessor for Playlist.Collaboration();
}

uint64_t sub_1005344F0()
{
  return Playlist.collaboration.getter();
}

uint64_t sub_100534500()
{
  return Playlist.contentRating.getter();
}

uint64_t sub_100534510()
{
  return Playlist.favoriteStatus.getter();
}

uint64_t sub_100534520()
{
  return Playlist.editorialArtwork.getter();
}

uint64_t sub_100534530()
{
  return static Playlist.EditableComponents.tracklist.getter();
}

uint64_t sub_100534540()
{
  return type metadata accessor for Playlist.EditableComponents();
}

uint64_t sub_100534550()
{
  return Playlist.editableComponents.getter();
}

uint64_t sub_100534560()
{
  return Playlist.siriRepresentation.getter();
}

uint64_t sub_100534570()
{
  return Playlist.tracksTiledArtwork.getter();
}

uint64_t sub_100534580()
{
  return type metadata accessor for Playlist.Folder();
}

uint64_t sub_100534590()
{
  return type metadata accessor for Playlist.Variant();
}

uint64_t sub_1005345A0()
{
  return Playlist.isOwner.getter();
}

uint64_t sub_1005345B0()
{
  return Playlist.variant.getter();
}

uint64_t sub_1005345C0()
{
  return Playlist.isPublic.getter();
}

uint64_t sub_1005345D0()
{
  return Playlist.catalogID.getter();
}

uint64_t sub_1005345E0()
{
  return Playlist.curatorName.getter();
}

uint64_t sub_1005345F0()
{
  return Playlist.description.getter();
}

uint64_t sub_100534600()
{
  return Playlist.lastPlayedDate.getter();
}

uint64_t sub_100534610()
{
  return Playlist.lastModifiedDate.getter();
}

uint64_t sub_100534620()
{
  return Playlist.id.getter();
}

uint64_t sub_100534630()
{
  return Playlist.url.getter();
}

uint64_t sub_100534640()
{
  return type metadata accessor for Playlist.Kind();
}

uint64_t sub_100534650()
{
  return Playlist.kind.getter();
}

uint64_t sub_100534660()
{
  return Playlist.name.getter();
}

uint64_t sub_100534670()
{
  return Playlist.Entry.InternalItem.artwork.getter();
}

uint64_t sub_100534680()
{
  return type metadata accessor for Playlist.Entry.InternalItem();
}

uint64_t sub_100534690()
{
  return Playlist.Entry.internalItem.getter();
}

uint64_t sub_1005346A0()
{
  return Playlist.Entry.catalogID.getter();
}

uint64_t sub_1005346B0()
{
  return Playlist.Entry.description.getter();
}

uint64_t sub_1005346C0()
{
  return type metadata accessor for Playlist.Entry.Item();
}

uint64_t sub_1005346D0()
{
  return Playlist.Entry.item.getter();
}

uint64_t sub_1005346E0()
{
  return type metadata accessor for Playlist.Entry();
}

uint64_t sub_1005346F0()
{
  return Playlist.tracks.getter();
}

uint64_t sub_100534700()
{
  return Playlist.artwork.getter();
}

uint64_t sub_100534710()
{
  return Playlist.entries.getter();
}

uint64_t sub_100534720()
{
  return type metadata accessor for Playlist();
}

uint64_t sub_100534730()
{
  return RadioShow.url.getter();
}

uint64_t sub_100534740()
{
  return RadioShow.artwork.getter();
}

uint64_t sub_100534750()
{
  return type metadata accessor for RadioShow();
}

uint64_t sub_100534760()
{
  return static PHPickerFilter.images.getter();
}

uint64_t sub_100534770()
{
  return type metadata accessor for PHPickerFilter();
}

uint64_t sub_100534780()
{
  return PHPickerResult.itemProvider.getter();
}

uint64_t sub_100534790()
{
  return PHPickerResult.assetIdentifier.getter();
}

uint64_t sub_1005347A0()
{
  return type metadata accessor for PHPickerResult();
}

uint64_t sub_1005347B0()
{
  return PHPickerConfiguration.init(photoLibrary:)();
}

uint64_t sub_1005347C0()
{
  return type metadata accessor for PHPickerConfiguration.AssetRepresentationMode();
}

uint64_t sub_1005347D0()
{
  return PHPickerConfiguration.preferredAssetRepresentationMode.setter();
}

uint64_t sub_1005347E0()
{
  return PHPickerConfiguration.filter.setter();
}

uint64_t sub_1005347F0()
{
  return type metadata accessor for PHPickerConfiguration();
}

uint64_t sub_100534800()
{
  return static AppStore.requestReview(in:)();
}

uint64_t sub_100534810()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t sub_100534820()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t sub_100534830()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t sub_100534840()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t sub_100534850()
{
  return type metadata accessor for SHA256();
}

uint64_t sub_100534860()
{
  return type metadata accessor for SHA512();
}

uint64_t sub_100534870()
{
  return type metadata accessor for Insecure.MD5();
}

uint64_t sub_100534880()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_100534890()
{
  return static WidgetRenderingMode.vibrant.getter();
}

uint64_t sub_1005348A0()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_1005348B0()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_1005348C0()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_1005348D0()
{
  return static WidgetFamily.< infix(_:_:)();
}

uint64_t sub_1005348E0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1005348F0()
{
  return static WidgetLocation.homeScreen.getter();
}

uint64_t sub_100534900()
{
  return static WidgetLocation.lockScreen.getter();
}

uint64_t sub_100534910()
{
  return static WidgetLocation.iPhoneWidgetsOnMac.getter();
}

uint64_t sub_100534920()
{
  return static WidgetLocation.== infix(_:_:)();
}

uint64_t sub_100534930()
{
  return static WidgetLocation.standBy.getter();
}

uint64_t sub_100534940()
{
  return type metadata accessor for WidgetLocation();
}

uint64_t sub_100534950()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_100534980()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_100534990()
{
  return static TimelineReloadPolicy.after(_:)();
}

uint64_t sub_1005349A0()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_1005349B0()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_1005349C0()
{
  return AppIntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_1005349D0()
{
  return static TimelineEntryRelevance.== infix(_:_:)();
}

uint64_t sub_1005349E0()
{
  return TimelineEntryRelevance.init(score:duration:)();
}

uint64_t sub_1005349F0()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_100534A00()
{
  return AppIntentTimelineProvider.getTimeline(for:in:completion:)();
}

uint64_t sub_100534A20()
{
  return AppIntentTimelineProvider.getSnapshot(for:in:completion:)();
}

uint64_t sub_100534A30()
{
  return AppIntentTimelineProvider.recommendations()();
}

uint64_t sub_100534A50()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_100534A70()
{
  return Set.init()();
}

uint64_t sub_100534A80()
{
  return BinaryFloatingPoint.formatted<A>(_:)();
}

NSDictionary sub_100534A90()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100534AA0()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100534AB0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100534AC0()
{
  return Dictionary.description.getter();
}

uint64_t sub_100534AD0()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t sub_100534AE0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100534AF0()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_100534B00()
{
  return Dictionary.subscript.modify();
}

uint64_t sub_100534B10()
{
  return Dictionary.subscript.getter();
}

uint64_t sub_100534B20()
{
  return Dictionary.subscript.setter();
}

uint64_t sub_100534B30()
{
  return dispatch thunk of static FloatingPoint./ infix(_:_:)();
}

uint64_t sub_100534B40()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100534B50()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100534B60()
{
  return Character.isWhitespace.getter();
}

uint64_t sub_100534B70()
{
  return Character.isPunctuation.getter();
}

uint64_t sub_100534B80()
{
  return BidirectionalCollection.difference<A>(from:by:)();
}

uint64_t sub_100534B90()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t sub_100534BA0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100534BB0()
{
  return dispatch thunk of static Comparable.> infix(_:_:)();
}

uint64_t sub_100534BC0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_100534BD0()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_100534BE0()
{
  return type metadata accessor for ClosedRange();
}

uint64_t sub_100534BF0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100534C00()
{
  return type metadata accessor for String.IntentInputOptions();
}

uint64_t sub_100534C10()
{
  return String.init(bytesNoCopy:length:encoding:freeWhenDone:)();
}

uint64_t sub_100534C20()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100534C30()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_100534C40(Swift::String a1)
{
}

void sub_100534C50(Swift::String a1)
{
}

uint64_t sub_100534C60()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100534C70()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_100534C80()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_100534C90()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100534CA0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100534CB0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_100534CC0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100534CD0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100534CE0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100534CF0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_100534D00()
{
  return String.init(data:encoding:)();
}

uint64_t sub_100534D20()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100534D30()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100534D40()
{
  return String.init(localized:defaultValue:table:bundle:locale:comment:)();
}

uint64_t sub_100534D50()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100534D60(NSString a1)
{
  return String.init(_:)(a1)._countAndFlagsBits;
}

uint64_t sub_100534D70()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100534D80()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100534D90()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_100534DA0()
{
  return String.utf8CString.getter();
}

uint64_t sub_100534DB0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100534DC0()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100534DD0()
{
  return String.hash(into:)();
}

uint64_t sub_100534DE0()
{
  return String.Index.init<A>(utf16Offset:in:)();
}

uint64_t sub_100534DF0()
{
  return String.Index.samePosition(in:)();
}

uint64_t sub_100534E00()
{
  return String.count.getter();
}

uint64_t sub_100534E10()
{
  return String.index(after:)();
}

uint64_t sub_100534E20()
{
  return String.index(before:)();
}

uint64_t sub_100534E30()
{
  return String.index(_:offsetBy:limitedBy:)();
}

void sub_100534E40(Swift::String contentsOf)
{
}

uint64_t sub_100534E50()
{
  return String.append(contentsOf:)();
}

uint64_t sub_100534E60()
{
  return String.append<A>(contentsOf:)();
}

void sub_100534E70(Swift::String a1)
{
}

void sub_100534E80(Swift::String a1)
{
}

uint64_t sub_100534E90()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_100534EA0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100534EB0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100534EC0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100534ED0()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t sub_100534EE0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100534EF0()
{
  return String.UTF16View.count.getter();
}

uint64_t sub_100534F00()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100534F10()
{
  return String.UTF16View.distance(from:to:)();
}

BOOL sub_100534F20(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_100534F30(Swift::String repeating, Swift::Int count)
{
  return String.init(repeating:count:)(repeating, count)._countAndFlagsBits;
}

uint64_t sub_100534F40()
{
  return String.subscript.getter();
}

uint64_t sub_100534F50()
{
  return String.init<A>(_:)();
}

uint64_t sub_100534F60()
{
  return String.subscript.getter();
}

uint64_t sub_100534F70()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_100534F80()
{
  return dispatch thunk of Sequence.underestimatedCount.getter();
}

uint64_t sub_100534F90()
{
  return Sequence<>.makeIterator()();
}

uint64_t sub_100534FA0()
{
  return Sequence.compactMap<A>(_:)();
}

uint64_t sub_100534FB0()
{
  return Sequence.enumerated()();
}

uint64_t sub_100534FC0()
{
  return Sequence._copyContents(initializing:)();
}

uint64_t sub_100534FD0()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t sub_100534FE0()
{
  return Sequence.first(where:)();
}

uint64_t sub_100534FF0()
{
  return Sequence.filter(_:)();
}

uint64_t sub_100535000()
{
  return Sequence.reduce<A>(_:_:)();
}

uint64_t sub_100535010()
{
  return Sequence.sorted(by:)();
}

uint64_t sub_100535020()
{
  return Sequence.flatMap<A>(_:)();
}

uint64_t sub_100535030()
{
  return Sequence.forEach(_:)();
}

uint64_t sub_100535040()
{
  return Sequence.dropLast(_:)();
}

uint64_t sub_100535050()
{
  return Sequence<>.contains(_:)();
}

uint64_t sub_100535060()
{
  return Sequence<>.joined(separator:)();
}

uint64_t sub_100535070()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100535080()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100535090()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1005350A0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1005350B0()
{
  return Array<A>.items.getter();
}

NSArray sub_1005350C0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1005350D0()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1005350E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1005350F0()
{
  return Array.description.getter();
}

uint64_t sub_100535100()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100535110()
{
  return static Array._adoptStorage(_:count:)();
}

uint64_t sub_100535120()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t sub_100535130()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100535140()
{
  return static Array.+ infix(_:_:)();
}

void sub_100535150()
{
}

uint64_t sub_100535160()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_100535170()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

BOOL sub_100535180()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t sub_100535190()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1005351A0()
{
  return Array.count.getter();
}

uint64_t sub_1005351B0()
{
  return Array.append<A>(contentsOf:)();
}

uint64_t sub_1005351C0()
{
  return Array.append(_:)();
}

uint64_t sub_1005351D0()
{
  return Array.insert(_:at:)();
}

uint64_t sub_1005351E0()
{
  return Array.remove(at:)();
}

uint64_t sub_1005351F0()
{
  return Array.endIndex.getter();
}

uint64_t sub_100535200()
{
  return type metadata accessor for Array();
}

uint64_t sub_100535210()
{
  return Array.init<A>(_:)();
}

uint64_t sub_100535220()
{
  return Array.subscript.getter();
}

NSNumber sub_100535230()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_100535240()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100535250()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100535260()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100535270()
{
  return type metadata accessor for CheckedContinuation();
}

uint64_t sub_100535280()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t sub_1005352B0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1005352C0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1005352D0()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_1005352E0()
{
  return static TaskPriority.low.getter();
}

uint64_t sub_1005352F0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100535300()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100535310()
{
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t sub_100535320()
{
  return AsyncStream.Continuation.yield(_:)();
}

void sub_100535330()
{
}

uint64_t sub_100535340()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void sub_100535360()
{
}

uint64_t sub_100535370()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_100535390()
{
  return ThrowingTaskGroup.makeAsyncIterator()();
}

uint64_t sub_1005353B0()
{
  return type metadata accessor for ThrowingTaskGroup.Iterator();
}

uint64_t sub_1005353C0()
{
  return type metadata accessor for ThrowingTaskGroup();
}

uint64_t sub_1005353D0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber sub_1005353E0()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_1005353F0()
{
  return static Double._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100535400()
{
  return Double.description.getter();
}

uint64_t sub_100535410()
{
  return Double.write<A>(to:)();
}

NSNumber sub_100535430()
{
  return Float._bridgeToObjectiveC()();
}

uint64_t sub_100535440()
{
  return static Float._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100535450()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100535460()
{
  return static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100535470()
{
  return Float.write<A>(to:)();
}

NSSet sub_100535490()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1005354A0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1005354B0()
{
  return Set.description.getter();
}

uint64_t sub_1005354C0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1005354D0()
{
  return Set.insert(_:)();
}

uint64_t sub_1005354E0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_100535500()
{
  return type metadata accessor for Set();
}

uint64_t sub_100535510()
{
  return Set.init<A>(_:)();
}

NSNumber sub_100535520()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100535530()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100535540()
{
  return dispatch thunk of static Numeric.* infix(_:_:)();
}

uint64_t sub_100535550()
{
  return RandomAccessCollection<>.indices.getter();
}

uint64_t sub_100535560()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_100535570()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_100535580()
{
  return dispatch thunk of Collection.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_100535590()
{
  return dispatch thunk of Collection.distance(from:to:)();
}

uint64_t sub_1005355A0()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_1005355B0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_1005355C0()
{
  return Collection.firstIndex(where:)();
}

uint64_t sub_1005355E0()
{
  return Collection.count.getter();
}

uint64_t sub_1005355F0()
{
  return Collection.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_100535600()
{
  return Collection.index(_:offsetBy:)();
}

uint64_t sub_100535610()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_100535620()
{
  return Collection.distance(from:to:)();
}

uint64_t sub_100535630()
{
  return Collection<>.indices.getter();
}

uint64_t sub_100535640()
{
  return Collection<>.firstIndex(of:)();
}

uint64_t sub_100535650()
{
  return Collection<>.subscript.getter();
}

uint64_t sub_100535660()
{
  return dispatch thunk of Collection.subscript.getter();
}

uint64_t sub_100535670()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_100535680()
{
  return RangeReplaceableCollection.removeFirst()();
}

uint64_t sub_100535690()
{
  return RangeReplaceableCollection<>.popLast()();
}

uint64_t sub_1005356A0()
{
  return RangeReplaceableCollection<>.removeAll(where:)();
}

uint64_t sub_1005356B0()
{
  return Range<>.init(_:in:)();
}

uint64_t sub_1005356C0()
{
  return Range.contains(_:)();
}

uint64_t sub_1005356D0()
{
  return type metadata accessor for Range();
}

uint64_t sub_1005356E0()
{
  return static CACornerMask.all.getter();
}

void sub_1005356F0(Swift::OpaquePointer _, Swift::OpaquePointer at)
{
}

uint64_t sub_100535700()
{
  return CGContextRef.textPosition.getter();
}

uint64_t sub_100535710()
{
  return CGContextRef.textPosition.setter();
}

uint64_t sub_100535720()
{
  return CGContextRef.clip(using:)();
}

uint64_t sub_100535730()
{
  return CGContextRef.fillPath(using:)();
}

uint64_t sub_100535760()
{
  return UIEdgeInsets.horizontal.getter();
}

uint64_t sub_100535770()
{
  return UIEdgeInsets.init(edges:inset:)();
}

uint64_t sub_100535780()
{
  return UIHoverStyle.init<A>(effect:shape:)();
}

__C::UIRectCorner sub_100535790(CACornerMask a1)
{
  return UIRectCorner.init(_:)(a1);
}

uint64_t sub_1005357A0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1005357B0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1005357C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1005357D0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1005357E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1005357F0()
{
  return NSItemProvider.registerGroupActivity<A>(preparationHandler:)();
}

uint64_t sub_100535800()
{
  return NSItemProvider.loadDataRepresentation(for:completionHandler:)();
}

uint64_t sub_100535810()
{
  return UIPointerStyle.init(effect:shape:)();
}

UIBarButtonItem sub_100535820(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction, menu);
}

uint64_t sub_100535830()
{
  return CGMutablePathRef.addPath(_:transform:)();
}

uint64_t sub_100535840()
{
  return CGMutablePathRef.addEllipse(in:transform:)();
}

uint64_t sub_100535850()
{
  return CGMutablePathRef.addRoundedRect(in:cornerWidth:cornerHeight:transform:)();
}

uint64_t sub_100535860()
{
  return CGMutablePathRef.move(to:transform:)();
}

uint64_t sub_100535870()
{
  return CGMutablePathRef.addLine(to:transform:)();
}

uint64_t sub_100535880()
{
  return UIViewController.registerForTraitChanges(_:action:)();
}

uint64_t sub_100535890()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_1005358A0()
{
  return static CGAffineTransform.== infix(_:_:)();
}

uint64_t sub_1005358B0()
{
  return MPCPlaybackEngine.state<A>(for:)();
}

uint64_t sub_1005358C0()
{
  return MPCPlaybackIntent.isInGroupSession.setter();
}

uint64_t sub_1005358D0()
{
  return MPCPlayerResponse.playState(for:)();
}

uint64_t sub_1005358E0()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_1005358F0()
{
  return static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
}

uint64_t sub_100535900()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_100535910()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100535920()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100535930()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_100535940()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_100535950()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100535960()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100535970()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_100535980()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100535990()
{
  return OS_dispatch_queue.async(execute:)();
}

uint64_t sub_1005359A0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1005359B0()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_1005359C0()
{
  return static UITraitCollection.systemTraitsAffectingColorAppearance.getter();
}

uint64_t sub_1005359D0()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags();
}

uint64_t sub_1005359E0()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

uint64_t sub_1005359F0()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

void sub_100535A00()
{
}

void sub_100535A10()
{
}

uint64_t sub_100535A20()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_100535A30()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_100535A40()
{
  return MPStoreLyricsRequest.init(song:)();
}

uint64_t sub_100535A50()
{
  return type metadata accessor for NSNotificationCenter.Notifications.Iterator();
}

uint64_t sub_100535A60()
{
  return type metadata accessor for NSNotificationCenter.Notifications();
}

uint64_t sub_100535A70()
{
  return NSNotificationCenter.notifications(named:object:)();
}

uint64_t sub_100535A80()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_100535A90()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_100535AA0()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_100535AB0()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100535AC0()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t sub_100535AD0()
{
  return static UIContentSizeCategory.< infix(_:_:)();
}

uint64_t sub_100535AE0()
{
  return static UIContentSizeCategory.>= infix(_:_:)();
}

uint64_t sub_100535AF0()
{
  return UIContentSizeCategory.init(_:)();
}

uint64_t sub_100535B00()
{
  return PHPickerViewController.init(configuration:)();
}

uint64_t sub_100535B10()
{
  return PHPickerViewController.delegate.setter();
}

uint64_t sub_100535B20()
{
  return NSDirectionalEdgeInsets.horizontal.getter();
}

uint64_t sub_100535B30()
{
  return NSDirectionalEdgeInsets.vertical.getter();
}

uint64_t sub_100535B40()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

uint64_t sub_100535B50()
{
  return UIPresentationController.registerForTraitChanges(_:action:)();
}

uint64_t sub_100535B60()
{
  return UISheetPresentationControllerDetent.resolvedValue(in:)();
}

uint64_t sub_100535B70()
{
  return static UISheetPresentationControllerDetent.custom(identifier:resolver:)();
}

uint64_t sub_100535B80()
{
  return CGRect.centeringAlong(axes:in:)();
}

uint64_t sub_100535B90()
{
  return CGRect.centeringAlong(axes:bounds:scale:)();
}

uint64_t sub_100535BA0()
{
  return CGRect.applyingLayoutDirection(in:bounds:)();
}

uint64_t sub_100535BB0()
{
  return CGRect.applyingLayoutDirection(_:inBounds:)();
}

uint64_t sub_100535BC0()
{
  return CGRect.inset(by:for:)();
}

uint64_t sub_100535BD0()
{
  return CGRect.center.getter();
}

uint64_t sub_100535BE0()
{
  return CGRect.offset(by:)();
}

uint64_t sub_100535BF0()
{
  return CGSize.aspectRatio.getter();
}

uint64_t sub_100535C00()
{
  return CGSize.description.getter();
}

uint64_t sub_100535C10()
{
  return CGSize.inset(by:)();
}

uint64_t sub_100535C20()
{
  return CGSize.scaled(_:)();
}

uint64_t sub_100535C30()
{
  return static UIFont.preferredFont(forTextStyle:weight:)();
}

uint64_t sub_100535C40()
{
  return static UIFont.shortEmphasizedPreferredFont(forTextStyle:)();
}

UIMenu sub_100535C50(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t sub_100535C60()
{
  return UIView.Corner.mask.getter();
}

uint64_t sub_100535C70()
{
  return static UIView.Corner.value(_:continuous:)();
}

uint64_t sub_100535C80()
{
  return UIView.Corner.Radius.value(in:)();
}

uint64_t sub_100535C90()
{
  return type metadata accessor for UIView.Corner.Radius();
}

uint64_t sub_100535CA0()
{
  return UIView.Corner.init(radius:mask:)();
}

uint64_t sub_100535CB0()
{
  return UIView.Corner.radius.getter();
}

uint64_t sub_100535CC0()
{
  return UIView.Corner.radius.setter();
}

uint64_t sub_100535CD0()
{
  return static UIView.Corner.rounded.getter();
}

uint64_t sub_100535CE0()
{
  return type metadata accessor for UIView.Corner();
}

uint64_t sub_100535CF0()
{
  return UIView.corner.setter();
}

uint64_t sub_100535D00()
{
  return UIView.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_100535D10()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_100535D20()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t sub_100535D30()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

uint64_t sub_100535D40()
{
  return UIColor.init(_:)();
}

uint64_t sub_100535D50()
{
  return UIImage.baselineOffsetFromBottom.getter();
}

NSNumber sub_100535D60(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber sub_100535D70(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_100535D80(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100535D90()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100535DA0()
{
  return NSObject.hash(into:)();
}

uint64_t sub_100535DB0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100535DC0()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100535DD0()
{
  return UIButton.Configuration.buttonSize.setter();
}

uint64_t sub_100535DE0()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t sub_100535DF0()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t sub_100535E00()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t sub_100535E10()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_100535E20()
{
  return type metadata accessor for UIButton.Configuration.Size();
}

uint64_t sub_100535E30()
{
  return static UIButton.Configuration.gray()();
}

uint64_t sub_100535E40()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_100535E50()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_100535E60()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_100535E70()
{
  return static UIOffset./ infix(_:_:)();
}

uint64_t sub_100535E80()
{
  return _NSRange.description.getter();
}

unint64_t sub_100535E90(__C::_NSRange a1)
{
  return (unint64_t)_NSRange.intersection(_:)(a1);
}

uint64_t sub_100535EA0()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_100535EB0()
{
  return NSScanner.scanUInt64(representation:)();
}

uint64_t sub_100535EC0()
{
  return NSScanner.scanUpToCharacters(from:)();
}

uint64_t sub_100535ED0()
{
  return type metadata accessor for NSScanner.NumberRepresentation();
}

uint64_t sub_100535EE0()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_100535EF0()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100535F00()
{
  return static OS_os_log.disabled.getter();
}

uint64_t sub_100535F10()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100535F20()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100535F30()
{
  return Substring.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100535F40()
{
  return Substring.index(after:)();
}

uint64_t sub_100535F50()
{
  return Substring.index(_:offsetBy:)();
}

uint64_t sub_100535F60()
{
  return Substring.subscript.getter();
}

uint64_t sub_100535F70()
{
  return Substring.init(_:)();
}

uint64_t sub_100535F80()
{
  return Substring.subscript.getter();
}

uint64_t sub_100535F90()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_100535FA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100535FB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100535FC0()
{
  return StringProtocol.components(separatedBy:)();
}

uint64_t sub_100535FD0()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_100535FE0()
{
  return StringProtocol.capitalized.getter();
}

uint64_t sub_100535FF0()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_100536000()
{
  return StringProtocol.localizedLowercase.getter();
}

uint64_t sub_100536010()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_100536020()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_100536030()
{
  return StringProtocol.localizedCaseInsensitiveContains<A>(_:)();
}

uint64_t sub_100536040()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t sub_100536050()
{
  return StringProtocol.folding(options:locale:)();
}

uint64_t sub_100536060()
{
  return StringProtocol.padding<A>(toLength:withPad:startingAt:)();
}

uint64_t sub_100536070()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_100536080()
{
  return BinaryInteger.formatted()()._countAndFlagsBits;
}

uint64_t sub_100536090()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1005360A0()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t sub_1005360C0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1005360D0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1005360E0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1005360F0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100536100()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100536110()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100536120()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100536130()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int sub_100536140(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100536150()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100536160()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100536170()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100536180()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100536190()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_1005361A0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_1005361B0()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

void sub_1005361C0(Swift::Int a1)
{
}

uint64_t sub_1005361D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1005361E0()
{
  return type metadata accessor for Zip2Sequence();
}

void sub_1005361F0(Swift::Int a1)
{
}

uint64_t sub_100536200()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100536210()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100536220()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100536230()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_100536240()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_100536250()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100536260()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t sub_100536280()
{
  return _ArrayProtocol.filter(_:)();
}

uint64_t sub_100536290()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1005362A0()
{
  return specialized ContiguousArray._endMutation()();
}

void sub_1005362B0(Swift::Int a1)
{
}

uint64_t sub_1005362C0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1005362D0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1005362E0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1005362F0()
{
  return ContiguousArray.count.getter();
}

uint64_t sub_100536300()
{
  return ContiguousArray.append(_:)();
}

uint64_t sub_100536310()
{
  return ContiguousArray.init()();
}

uint64_t sub_100536320()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t sub_100536330()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_100536340()
{
  return ContinuousClock.init()();
}

uint64_t sub_100536350()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_100536360()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_100536370()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100536380()
{
  return type metadata accessor for IndexingIterator();
}

uint64_t sub_100536390()
{
  return _NativeDictionary.makeIterator()();
}

uint64_t sub_1005363A0()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_1005363B0()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_1005363C0()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_1005363D0()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_1005363E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1005363F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100536400()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100536410()
{
  return dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)();
}

uint64_t sub_100536420()
{
  return dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
}

uint64_t sub_100536430()
{
  return EnumeratedSequence.makeIterator()();
}

uint64_t sub_100536440()
{
  return EnumeratedSequence.Iterator.next()();
}

uint64_t sub_100536450()
{
  return type metadata accessor for EnumeratedSequence.Iterator();
}

uint64_t sub_100536460()
{
  return type metadata accessor for EnumeratedSequence();
}

uint64_t sub_100536470()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100536480()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_100536490()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1005364A0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1005364B0()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_1005364C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1005364D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1005364E0()
{
  return static CollectionDifference.Index.== infix(_:_:)();
}

uint64_t sub_1005364F0()
{
  return type metadata accessor for CollectionDifference.Change();
}

uint64_t sub_100536500()
{
  return type metadata accessor for CollectionDifference();
}

uint64_t sub_100536510()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_100536520()
{
  return dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();
}

Swift::Int sub_100536530(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100536550()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_100536560()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_100536570()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100536580()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100536590()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1005365A0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1005365B0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1005365C0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1005365D0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1005365E0()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_1005365F0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_100536600()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100536610()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100536620()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100536630()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100536640()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100536650()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100536660()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_100536680(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100536690()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t sub_1005366A0()
{
  return AsyncCompactMapSequence.base.getter();
}

uint64_t sub_1005366B0()
{
  return AsyncCompactMapSequence.Iterator.baseIterator.modify();
}

uint64_t sub_1005366C0()
{
  return AsyncCompactMapSequence.Iterator.transform.getter();
}

uint64_t sub_1005366D0()
{
  return AsyncCompactMapSequence.Iterator.init(_:transform:)();
}

uint64_t sub_1005366E0()
{
  return AsyncCompactMapSequence.transform.getter();
}

uint64_t sub_1005366F0()
{
  return AsyncCompactMapSequence.init(_:transform:)();
}

uint64_t sub_100536700()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100536710()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_100536730()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_100536740()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_100536750()
{
  return _forceBridgeFromObjectiveC<A>(_:_:)();
}

uint64_t sub_100536760()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t sub_100536770()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100536780()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100536790()
{
  return dispatch thunk of CustomDebugStringConvertible.debugDescription.getter();
}

uint64_t sub_1005367A0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1005367B0()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_1005367C0()
{
  return _copySequenceToContiguousArray<A>(_:)();
}

uint64_t sub_1005367D0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_1005367F0()
{
  return _copyCollectionToContiguousArray<A>(_:)();
}

uint64_t sub_100536800()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t sub_100536810()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_100536820()
{
  return max<A>(_:_:)();
}

uint64_t sub_100536830()
{
  return min<A>(_:_:)();
}

uint64_t sub_100536840()
{
  return zip<A, B>(_:_:)();
}

uint64_t sub_100536850()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100536860()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100536870()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t sub_1005368B0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1005368C0()
{
  return dispatch thunk of Error._code.getter();
}

uint64_t sub_1005368D0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1005368E0()
{
  return Error._code.getter();
}

uint64_t sub_1005368F0()
{
  return Error._domain.getter();
}

uint64_t sub_100536900()
{
  return Error._userInfo.getter();
}

NSNumber sub_100536910()
{
  return Int64._bridgeToObjectiveC()();
}

uint64_t sub_100536920()
{
  return print<A>(_:separator:terminator:to:)();
}

uint64_t sub_100536940()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_100536950()
{
  return Hasher.init(_seed:)();
}

void sub_100536960(Swift::UInt a1)
{
}

void sub_100536970(Swift::UInt8 a1)
{
}

void sub_100536980(Swift::UInt32 a1)
{
}

void sub_100536990(Swift::UInt64 a1)
{
}

Swift::Int sub_1005369A0()
{
  return Hasher._finalize()();
}

uint64_t sub_1005369B0()
{
  return type metadata accessor for Result();
}

NSNumber sub_1005369C0()
{
  return UInt64._bridgeToObjectiveC()();
}

uint64_t sub_1005369D0()
{
  return static UInt64._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1005369E0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1005369F0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_100536A20()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t sub_100536A30()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return _AudioFormatGetProperty(inPropertyID, inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
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

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextDrawConicGradient(CGContextRef c, CGGradientRef gradient, CGPoint center, CGFloat angle)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return _CGDataProviderCopyData(provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return _CGGradientCreateWithColors(space, colors, locations);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return _CGImageGetBytesPerRow(image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return _CGImageGetDataProvider(image);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return _CGPDFDocumentCreateWithProvider(provider);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRect(rect, transform);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  CGPoint v4 = _CGPointApplyAffineTransform(point, t);
  double y = v4.y;
  double x = v4.x;
  result.double y = y;
  result.double x = x;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return _CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return _CTFrameGetLines(frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return _CTFramesetterCreateFrame(framesetter, stringRange, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTFramesetterCreateWithAttributedString(attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  CGSize v7 = _CTFramesetterSuggestFrameSizeWithConstraints(framesetter, stringRange, frameAttributes, constraints, fitRange);
  double height = v7.height;
  double width = v7.width;
  result.double height = height;
  result.double width = width;
  return result;
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  return _CTLineGetBoundsWithOptions(line, options);
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return _CTLineGetGlyphCount(line);
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  return _CTLineGetOffsetForStringIndex(line, charIndex, secondaryOffset);
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFRange StringRange = _CTLineGetStringRange(line);
  CFIndex length = StringRange.length;
  CFIndex location = StringRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return _CTParagraphStyleCreate(settings, settingCount);
}

void CTRunDraw(CTRunRef run, CGContextRef context, CFRange range)
{
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return _CTRunGetGlyphCount(run);
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

CTRunStatus CTRunGetStatus(CTRunRef run)
{
  return _CTRunGetStatus(run);
}

void CTRunGetStringIndices(CTRunRef run, CFRange range, CFIndex *buffer)
{
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFRange StringRange = _CTRunGetStringRange(run);
  CFIndex length = StringRange.length;
  CFIndex location = StringRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

double CTRunGetTypographicBounds(CTRunRef run, CFRange range, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  return _CTRunGetTypographicBounds(run, range, ascent, descent, leading);
}

uint64_t FigOutputMonitorIsScreenProbablyBeingRecorded()
{
  return _FigOutputMonitorIsScreenProbablyBeingRecorded();
}

uint64_t ICEnvironmentNetworkTypeIsWiFi()
{
  return _ICEnvironmentNetworkTypeIsWiFi();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MPCRadioPlaybackErrorGetCategory()
{
  return _MPCRadioPlaybackErrorGetCategory();
}

uint64_t MPNSStringFromQueueLoadAction()
{
  return _MPNSStringFromQueueLoadAction();
}

uint64_t MPStoreItemMetadataStringNormalizeStoreIDValue()
{
  return _MPStoreItemMetadataStringNormalizeStoreIDValue();
}

uint64_t MRGroupSessionJoinSessionWithToken()
{
  return _MRGroupSessionJoinSessionWithToken();
}

uint64_t MRGroupSessionLeaveSessionWithIdentifier()
{
  return _MRGroupSessionLeaveSessionWithIdentifier();
}

uint64_t MSVDeviceSupportsVocalAttenuation()
{
  return _MSVDeviceSupportsVocalAttenuation();
}

uint64_t MSVLogAddStateHandler()
{
  return _MSVLogAddStateHandler();
}

uint64_t MobileGestalt_get_cellularDataCapability()
{
  return _MobileGestalt_get_cellularDataCapability();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return _MobileGestalt_get_deviceClassNumber();
}

uint64_t MobileGestalt_get_hasExtendedColorDisplay()
{
  return _MobileGestalt_get_hasExtendedColorDisplay();
}

uint64_t MobileGestalt_get_hevcDecoder8BitSupported()
{
  return _MobileGestalt_get_hevcDecoder8BitSupported();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
}

uint64_t UIViewIgnoresTouchEvents()
{
  return _UIViewIgnoresTouchEvents();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return __swift_isClassOrObjCExistentialType();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return _class_getInstanceVariable(cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

float log2f(float a1)
{
  return _log2f(a1);
}

uint64_t lround(long double __x)
{
  return _lround(__x);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id object_getIvar(id a1, Ivar a2)
{
  return _object_getIvar(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t rootless_check_datavault_flag()
{
  return _rootless_check_datavault_flag();
}

uint64_t rootless_convert_to_datavault()
{
  return _rootless_convert_to_datavault();
}

uint64_t rootless_mkdir_datavault()
{
  return _rootless_mkdir_datavault();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return _swift_continuation_throwingResumeWithError();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deallocUninitializedObject()
{
  return _swift_deallocUninitializedObject();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return _swift_dynamicCastUnknownClass();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return _swift_getFunctionTypeMetadata2();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return _swift_initEnumMetadataSingleCase();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return _swift_isUniquelyReferenced_native();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_taskGroup_addPending()
{
  return _swift_taskGroup_addPending();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakCopyAssign()
{
  return _swift_weakCopyAssign();
}

uint64_t swift_weakCopyInit()
{
  return _swift_weakCopyInit();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_weakTakeAssign()
{
  return _swift_weakTakeAssign();
}

uint64_t swift_weakTakeInit()
{
  return _swift_weakTakeInit();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
}

id objc_msgSend__monogramImageForToken_fittingSize_scale_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_monogramImageForToken:fittingSize:scale:completionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_avatarImageForContacts_scope_(void *a1, const char *a2, ...)
{
  return [a1 avatarImageForContacts:];
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return _[a1 camera];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_contactWithDisplayName_emailOrPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 contactWithDisplayName:emailOrPhoneNumber:];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return _[a1 defaultSettings];
}

id objc_msgSend_destinationScale(void *a1, const char *a2, ...)
{
  return _[a1 destinationScale];
}

id objc_msgSend_didUpdateResults(void *a1, const char *a2, ...)
{
  return _[a1 didUpdateResults];
}

id objc_msgSend_fittingSize(void *a1, const char *a2, ...)
{
  return _[a1 fittingSize];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInFunction:file:lineNumber:description:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_initWithMapItems_mapSize_useSnapshotService_(void *a1, const char *a2, ...)
{
  return [a1 initWithMapItems:mapSize:useSnapshotService:];
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return [a1 initWithSettings:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadingQueue(void *a1, const char *a2, ...)
{
  return _[a1 loadingQueue];
}

id objc_msgSend_localizedTriggerPhraseForLanguageCode_(void *a1, const char *a2, ...)
{
  return [a1 localizedTriggerPhraseForLanguageCode:];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mapItem(void *a1, const char *a2, ...)
{
  return _[a1 mapItem];
}

id objc_msgSend_mapShapshotter(void *a1, const char *a2, ...)
{
  return _[a1 mapShapshotter];
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _[a1 placemark];
}

id objc_msgSend_representationForVisualIdentity_withSize_image_(void *a1, const char *a2, ...)
{
  return [a1 representationForVisualIdentity:withSize:image:];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_rightToLeft(void *a1, const char *a2, ...)
{
  return _[a1 rightToLeft];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scopeWithPointSize_scale_rightToLeft_style_(void *a1, const char *a2, ...)
{
  return [a1 scopeWithPointSize:scale:rightToLeft:style:];
}

id objc_msgSend_searchCompleter(void *a1, const char *a2, ...)
{
  return _[a1 searchCompleter];
}

id objc_msgSend_setCenterCoordinateDistance_(void *a1, const char *a2, ...)
{
  return [a1 setCenterCoordinateDistance:];
}

id objc_msgSend_setCoordinate_(void *a1, const char *a2, ...)
{
  return [a1 setCoordinate:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setMapShapshotter_(void *a1, const char *a2, ...)
{
  return [a1 setMapShapshotter:];
}

id objc_msgSend_setQueryFragment_(void *a1, const char *a2, ...)
{
  return [a1 setQueryFragment:];
}

id objc_msgSend_setResultTypes_(void *a1, const char *a2, ...)
{
  return [a1 setResultTypes:];
}

id objc_msgSend_setSearchCompleter_(void *a1, const char *a2, ...)
{
  return [a1 setSearchCompleter:];
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitle:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_startWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 startWithCompletionHandler:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_visualIdenticalityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 visualIdenticalityIdentifier];
}