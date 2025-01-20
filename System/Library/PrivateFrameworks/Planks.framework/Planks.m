uint64_t PlanksNDArray.shape.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t PlanksNDArray.strides.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PlanksNDArray.__allocating_init(empty:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  PlanksNDArray.init(empty:)(a1);
  return v2;
}

void *PlanksNDArray.init(empty:)(uint64_t a1)
{
  v1[2] = sub_259DF7C50();
  swift_beginAccess();
  sub_259DF7CC0();
  sub_259DF7C20();
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_259DF86A0;
  *(void *)(v3 + 32) = a1 & (a1 >> 63);
  v1[3] = v3;
  v1[4] = &unk_2707BD8D0;
  return v1;
}

uint64_t sub_259DBEDC4(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(result + 32);
    uint64_t v4 = 1;
    while (1)
    {
      uint64_t v5 = *v3++;
      uint64_t v6 = v4 * v5;
      if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63) {
        break;
      }
      uint64_t v4 = v6;
      if (!--v2) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v6 = 0;
LABEL_7:
    uint64_t v7 = swift_allocObject();
    PlanksNDArray.init(empty:)(v6);
    swift_beginAccess();
    *(void *)(v7 + 24) = v1;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v9[0] = 0;
    uint64_t v8 = _s6Planks0A8OrderingO14computeStrides5shape5orderSaySiGAG_ACtFZ_0(v1, v9);
    swift_bridgeObjectRelease();
    swift_release();
    swift_beginAccess();
    *(void *)(v7 + 32) = v8;
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t PlanksNDArray.__allocating_init(array:shape:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_259DBEDC4(a2);
  swift_beginAccess();
  *(void *)(v3 + 16) = a1;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t PlanksNDArray.__allocating_init(array2d:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = sub_259DF7CC0();
  if (MEMORY[0x25A2EBC70](a1, v4) < 1)
  {
    __break(1u);
    goto LABEL_19;
  }
  sub_259DF7CD0();
  uint64_t v5 = MEMORY[0x25A2EBC70](v24[0], v3);
  uint64_t v6 = swift_bridgeObjectRelease();
  if (v5 < 1)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    uint64_t result = swift_bridgeObjectRelease_n();
    __break(1u);
    return result;
  }
  v24[0] = a1;
  MEMORY[0x270FA5388](v6);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v8 = sub_259DF7CC0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v11 = sub_259DBF290((void (*)(char *, char *))sub_259DC0AF0, KeyPath, v8, MEMORY[0x263F8D6C8], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v10);
  swift_release();
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v12; ++i)
    {
      v24[0] = *(void *)(v11 + 8 * i + 32);
      if (!sub_259DBF690(v24, a1, v3)) {
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_259DF86B0;
  *(void *)(v14 + 32) = MEMORY[0x25A2EBC70](a1, v4);
  sub_259DF7CD0();
  uint64_t v15 = MEMORY[0x25A2EBC70](v24[0], v3);
  swift_bridgeObjectRelease();
  *(void *)(v14 + 40) = v15;
  uint64_t v16 = sub_259DBEDC4(v14);
  swift_retain();
  if (!MEMORY[0x25A2EBC90](a1, v4)) {
    goto LABEL_17;
  }
  uint64_t v17 = 4;
  while (1)
  {
    uint64_t v18 = v17 - 4;
    char v19 = sub_259DF7C80();
    sub_259DF7C10();
    if ((v19 & 1) == 0) {
      break;
    }
    uint64_t v20 = swift_bridgeObjectRetain();
    BOOL v21 = __OFADD__(v18, 1);
    uint64_t v22 = v17 - 3;
    if (v21) {
      goto LABEL_16;
    }
LABEL_12:
    v24[3] = v20;
    swift_beginAccess();
    swift_getWitnessTable();
    sub_259DF7CA0();
    swift_endAccess();
    ++v17;
    if (v22 == MEMORY[0x25A2EBC90](a1, v4)) {
      goto LABEL_17;
    }
  }
  uint64_t v20 = sub_259DF7EA0();
  BOOL v21 = __OFADD__(v18, 1);
  uint64_t v22 = v17 - 3;
  if (!v21) {
    goto LABEL_12;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  swift_release();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_259DBF25C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = MEMORY[0x25A2EBC70](*a1, *(void *)(a3 + a2 - 8));
  *a4 = result;
  return result;
}

uint64_t sub_259DBF290(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_259DF7D30();
  if (!v18) {
    return sub_259DF7C50();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_259DF7EE0();
  uint64_t v32 = sub_259DF7EF0();
  sub_259DF7EC0();
  uint64_t v36 = v8;
  uint64_t result = sub_259DF7D20();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v34 = (void (**)(char *))(v33 + 2);
    v35 = v14;
    ++v33;
    while (1)
    {
      BOOL v21 = (void (*)(char *, void))sub_259DF7D80();
      uint64_t v22 = v12;
      v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_259DF7ED0();
      sub_259DF7D50();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

BOOL sub_259DBF690(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  sub_259DF7CC0();
  sub_259DF7CD0();
  uint64_t v5 = MEMORY[0x25A2EBC70](v7, a3);
  swift_bridgeObjectRelease();
  return v4 == v5;
}

uint64_t PlanksNDArray.__allocating_init(array3d:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = sub_259DF7CC0();
  uint64_t v5 = sub_259DF7CC0();
  if (MEMORY[0x25A2EBC70](a1, v5) < 1)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_259DF7CD0();
  uint64_t v6 = MEMORY[0x25A2EBC70](v30[0], v4);
  swift_bridgeObjectRelease();
  if (v6 < 1)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  sub_259DF7CD0();
  sub_259DF7CD0();
  swift_bridgeObjectRelease();
  uint64_t v7 = MEMORY[0x25A2EBC70](v31, v3);
  uint64_t v8 = swift_bridgeObjectRelease();
  if (v7 < 1)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    uint64_t result = swift_bridgeObjectRelease_n();
    __break(1u);
    return result;
  }
  v30[0] = a1;
  MEMORY[0x270FA5388](v8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = sub_259DF7CC0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = sub_259DBF290((void (*)(char *, char *))sub_259DC0AF0, KeyPath, v10, MEMORY[0x263F8D6C8], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v12);
  swift_release();
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v14; ++i)
    {
      v30[0] = *(void *)(v13 + 8 * i + 32);
      if (!sub_259DBFC00(v30)) {
        goto LABEL_31;
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_259DF86C0;
  *(void *)(v16 + 32) = MEMORY[0x25A2EBC70](a1, v5);
  sub_259DF7CD0();
  uint64_t v17 = MEMORY[0x25A2EBC70](v30[0], v4);
  swift_bridgeObjectRelease();
  *(void *)(v16 + 40) = v17;
  sub_259DF7CD0();
  sub_259DF7CD0();
  swift_bridgeObjectRelease();
  uint64_t v18 = MEMORY[0x25A2EBC70](v30[3], v3);
  swift_bridgeObjectRelease();
  *(void *)(v16 + 48) = v18;
  uint64_t v29 = sub_259DBEDC4(v16);
  swift_retain();
  if (!MEMORY[0x25A2EBC90](a1, v5)) {
    goto LABEL_26;
  }
  uint64_t v19 = 0;
  while (1)
  {
    char v20 = sub_259DF7C80();
    sub_259DF7C10();
    if ((v20 & 1) == 0) {
      break;
    }
    uint64_t v21 = *(void *)(a1 + 32 + 8 * v19);
    swift_bridgeObjectRetain();
    BOOL v22 = __OFADD__(v19++, 1);
    if (v22) {
      goto LABEL_25;
    }
LABEL_14:
    if (MEMORY[0x25A2EBC90](v21, v4))
    {
      uint64_t v23 = 4;
      do
      {
        uint64_t v24 = v23 - 4;
        char v25 = sub_259DF7C80();
        sub_259DF7C10();
        if (v25)
        {
          uint64_t v26 = swift_bridgeObjectRetain();
          BOOL v22 = __OFADD__(v24, 1);
          uint64_t v27 = v23 - 3;
          if (v22) {
            goto LABEL_27;
          }
        }
        else
        {
          uint64_t v26 = sub_259DF7EA0();
          BOOL v22 = __OFADD__(v24, 1);
          uint64_t v27 = v23 - 3;
          if (v22)
          {
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
        }
        uint64_t v31 = v26;
        swift_beginAccess();
        swift_getWitnessTable();
        sub_259DF7CA0();
        swift_endAccess();
        ++v23;
      }
      while (v27 != MEMORY[0x25A2EBC90](v21, v4));
    }
    swift_bridgeObjectRelease();
    if (v19 == MEMORY[0x25A2EBC90](a1, v5)) {
      goto LABEL_26;
    }
  }
  uint64_t v21 = sub_259DF7EA0();
  BOOL v22 = __OFADD__(v19++, 1);
  if (!v22) {
    goto LABEL_14;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  swift_release();
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t sub_259DBFBBC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = sub_259DF7CC0();
  uint64_t result = MEMORY[0x25A2EBC70](v3, v4);
  *a2 = result;
  return result;
}

BOOL sub_259DBFC00(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = sub_259DF7CC0();
  sub_259DF7CC0();
  sub_259DF7CD0();
  uint64_t v3 = MEMORY[0x25A2EBC70](v5, v2);
  swift_bridgeObjectRelease();
  return v1 == v3;
}

uint64_t PlanksNDArray.isEmpty.getter()
{
  return sub_259DF7D60() & 1;
}

uint64_t PlanksNDArray.ndim.getter()
{
  swift_beginAccess();
  return *(void *)(*(void *)(v0 + 24) + 16);
}

uint64_t PlanksNDArray.nbytes.getter()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_259DF7C30();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_259DBFE00@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = a2 - result;
  if (!result) {
    uint64_t v3 = 0;
  }
  *a3 = v3;
  return result;
}

uint64_t PlanksNDArray.dtype.getter()
{
  return *(void *)(*(void *)v0 + 80);
}

uint64_t PlanksNDArray.subscript.getter(void *a1)
{
  return swift_endAccess();
}

uint64_t sub_259DBFEA8(uint64_t a1, void **a2)
{
  return PlanksNDArray.subscript.getter(*a2);
}

uint64_t sub_259DBFED0(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v4 = *a3;
  swift_bridgeObjectRetain();
  return sub_259DC0B6C(a1, v4);
}

uint64_t PlanksNDArray.subscript.setter(uint64_t a1, uint64_t a2)
{
  return sub_259DC0290(a1, a2, (void (*)(void))sub_259DC0B6C);
}

{
  return sub_259DC0290(a1, a2, (void (*)(void))sub_259DC0C7C);
}

uint64_t sub_259DBFF2C(void *a1)
{
  uint64_t v3 = a1[2];
  uint64_t result = swift_beginAccess();
  if (v3 != *(void *)(*(void *)(v1 + 24) + 16))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_beginAccess();
  uint64_t v5 = *(void **)(v1 + 32);
  uint64_t v6 = v5[2];
  if (!v6 || !v3) {
    return 0;
  }
  uint64_t v7 = v5[4];
  uint64_t v8 = a1[4];
  uint64_t result = v7 * v8;
  if ((unsigned __int128)(v7 * (__int128)v8) >> 64 != (v7 * v8) >> 63)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  if (v6 != 1 && v3 != 1)
  {
    uint64_t v10 = v5 + 5;
    uint64_t v11 = a1 + 5;
    uint64_t v12 = v3 - 2;
    uint64_t v13 = v6 - 2;
    while (1)
    {
      uint64_t v15 = *v10++;
      uint64_t v14 = v15;
      uint64_t v16 = v12;
      uint64_t v17 = *v11++;
      uint64_t v18 = v14 * v17;
      if ((unsigned __int128)(v14 * (__int128)v17) >> 64 != (v14 * v17) >> 63) {
        break;
      }
      BOOL v19 = __OFADD__(result, v18);
      result += v18;
      if (v19) {
        goto LABEL_18;
      }
      if (v13)
      {
        uint64_t v12 = v16 - 1;
        --v13;
        if (v16) {
          continue;
        }
      }
      return result;
    }
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

void (*PlanksNDArray.subscript.modify(void *a1, void *a2))(void ***a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(*(void *)v2 + 80);
  v5[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  PlanksNDArray.subscript.getter(a2);
  return sub_259DC010C;
}

{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;

  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(*(void *)v2 + 80);
  v5[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  PlanksNDArray.subscript.getter(a2);
  return sub_259DC010C;
}

void sub_259DC010C(void ***a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[4];
  uint64_t v4 = (*a1)[5];
  uint64_t v5 = (*a1)[2];
  uint64_t v6 = (*a1)[3];
  uint64_t v7 = **a1;
  if (a2)
  {
    ((void (*)(void *, void *, void *))v6[2])((*a1)[4], v4, v5);
    swift_bridgeObjectRetain();
    sub_259DC0B6C((uint64_t)v3, v7);
    size_t v8 = (void (*)(void *, void *))v6[1];
    v8(v3, v5);
    v8(v4, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_259DC0B6C((uint64_t)v4, v7);
    ((void (*)(void *, void *))v6[1])(v4, v5);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_259DC020C(uint64_t a1, void *a2)
{
  return PlanksNDArray.subscript.getter(*a2);
}

uint64_t sub_259DC0234(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v4 = *a3;
  swift_bridgeObjectRetain();
  return sub_259DC0C7C(a1, v4);
}

uint64_t sub_259DC0290(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = *v3;
  a3();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 8);
  return v6(a1);
}

uint64_t PlanksNDArray.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlanksNDArray.__deallocating_deinit()
{
  PlanksNDArray.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_259DC0458(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_259DF7F40();
    __break(1u);
    return result;
  }
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_259DF7C60();
  *(void *)(result + 16) = a2;
  uint64_t v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    unint64_t v6 = 0;
LABEL_9:
    unint64_t v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  int64x2_t v7 = vdupq_n_s64(a1);
  size_t v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *size_t v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2) {
    goto LABEL_9;
  }
  return result;
}

Planks::PlanksOrdering_optional __swiftcall PlanksOrdering.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_259DF7FC0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static PlanksOrdering.allCases.getter()
{
  return &unk_2707BD970;
}

uint64_t PlanksOrdering.rawValue.getter()
{
  if (*v0) {
    return 0x614D6E6D756C6F63;
  }
  else {
    return 0x726F6A614D776F72;
  }
}

uint64_t sub_259DC05F8(char *a1, char *a2)
{
  return sub_259DF57B0(*a1, *a2);
}

uint64_t sub_259DC0604()
{
  return sub_259DF8170();
}

uint64_t sub_259DC0690()
{
  sub_259DF7B50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DC0708()
{
  return sub_259DF8170();
}

Planks::PlanksOrdering_optional sub_259DC0790(Swift::String *a1)
{
  return PlanksOrdering.init(rawValue:)(*a1);
}

void sub_259DC079C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x726F6A614D776F72;
  if (*v1) {
    uint64_t v2 = 0x614D6E6D756C6F63;
  }
  unint64_t v3 = 0xE800000000000000;
  if (*v1) {
    unint64_t v3 = 0xEB00000000726F6ALL;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_259DC07E4(void *a1@<X8>)
{
  *a1 = &unk_2707BD998;
}

uint64_t sub_259DC07F4()
{
  return sub_259DF7BF0();
}

uint64_t sub_259DC0854()
{
  return sub_259DF7BE0();
}

uint64_t default argument 1 of static PlanksReader.readMagic(_:begin:)()
{
  return 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_259DC08F0(unint64_t a1, uint64_t a2)
{
  uint64_t result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  if ((result & 1) == 0) {
    uint64_t v5 = a2;
  }
  if (*(void *)(v5 + 16) <= a1) {
    goto LABEL_7;
  }
  return result;
}

uint64_t _s6Planks0A8OrderingO14computeStrides5shape5orderSaySiGAG_ACtFZ_0(uint64_t a1, char *a2)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = v2 - 1;
  if (v2 == 1) {
    return (uint64_t)&unk_2707BD8F8;
  }
  char v7 = *a2;
  uint64_t result = sub_259DC0458(1uLL, v2);
  uint64_t v4 = (void *)result;
  if (v7)
  {
    if (!v2)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    uint64_t v8 = a1 + 32;
    unint64_t v9 = 1;
    while (2)
    {
      uint64_t v10 = 0;
      unint64_t v11 = v9 + 1;
      uint64_t v12 = 1;
      do
      {
        uint64_t v13 = *(void *)(v8 + 8 * v10);
        if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
        {
          __break(1u);
          goto LABEL_27;
        }
        v12 *= v13;
        ++v10;
      }
      while (v9 != v10);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_259DCF944(v4);
        uint64_t v4 = (void *)result;
      }
      if (v9 < v4[2])
      {
        v4[v9++ + 4] = v12;
        if (v11 != v2) {
          continue;
        }
        return (uint64_t)v4;
      }
      break;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v2)
  {
    unint64_t v14 = 0;
    uint64_t v15 = (uint64_t *)(a1 + 40);
    unint64_t v16 = v3;
    while (2)
    {
      if (v14 != v3)
      {
        unint64_t v17 = v14 + 1;
        uint64_t v18 = v15;
        unint64_t v19 = v16;
        uint64_t v20 = 1;
        do
        {
          uint64_t v21 = *v18++;
          uint64_t v22 = v20 * v21;
          if ((unsigned __int128)(v20 * (__int128)v21) >> 64 != (v20 * v21) >> 63)
          {
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
          uint64_t v20 = v22;
          --v19;
        }
        while (v19);
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_259DCF944(v4);
          uint64_t v4 = (void *)result;
        }
        if (v14 < v4[2])
        {
          v4[v14 + 4] = v20;
          --v16;
          ++v15;
          ++v14;
          if (v17 != v3) {
            continue;
          }
          return (uint64_t)v4;
        }
        goto LABEL_30;
      }
      break;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_259DC0AD8()
{
  return 8;
}

void *sub_259DC0AE4(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_259DC0AF0()
{
  return sub_259DC0B14();
}

uint64_t sub_259DC0B08()
{
  return 8;
}

uint64_t sub_259DC0B14()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DC0B6C(uint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  unint64_t v6 = sub_259DBFF2C(a2);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 + 80);
  sub_259DF7CC0();
  sub_259DF7C40();
  uint64_t v8 = v2[2];
  sub_259DC08F0(v6, v3[2]);
  char isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  uint64_t v10 = v8 & 0xFFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0) {
    uint64_t v10 = v8;
  }
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(v10+ ((*(unsigned __int8 *)(*(void *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80))+ *(void *)(*(void *)(v7 - 8) + 72) * v6, a1, v7);
  return swift_endAccess();
}

unint64_t sub_259DC0C84()
{
  unint64_t result = qword_26A3F3158;
  if (!qword_26A3F3158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3158);
  }
  return result;
}

unint64_t sub_259DC0CDC()
{
  unint64_t result = qword_26A3F3160;
  if (!qword_26A3F3160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A3F3168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3160);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_259DC0D80()
{
  return 8;
}

uint64_t sub_259DC0D8C()
{
  return 8;
}

uint64_t sub_259DC0D9C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PlanksNDArray()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PlanksNDArray(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlanksNDArray);
}

uint64_t dispatch thunk of PlanksNDArray.__allocating_init(empty:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlanksOrdering(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PlanksOrdering(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x259DC0F98);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_259DC0FC0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_259DC0FCC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlanksOrdering()
{
  return &type metadata for PlanksOrdering;
}

unint64_t sub_259DC0FE8()
{
  unint64_t result = qword_26A3F31F0;
  if (!qword_26A3F31F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F31F0);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259DC107C()
{
  uint64_t v0 = sub_259DF7A50();
  __swift_allocate_value_buffer(v0, qword_26A3F63A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F63A0);
  return sub_259DF7A40();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *static FieldType.floatingPointTypes.getter()
{
  return &unk_2707BD9C0;
}

void *static FieldType.integerTypes.getter()
{
  return &unk_2707BD9E8;
}

void *static FieldType.unsignedTypes.getter()
{
  return &unk_2707BDA10;
}

uint64_t FieldType.isFloatingPoint.getter()
{
  return sub_259DC11C0(*v0, (uint64_t)&unk_2707BDA38);
}

uint64_t sub_259DC11C0(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (2)
    {
      uint64_t v6 = a2 + v5++;
      unint64_t v7 = 0xE400000000000000;
      uint64_t v8 = 947154537;
      switch(*(unsigned char *)(v6 + 32))
      {
        case 1:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x3631746E69;
          break;
        case 2:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x3233746E69;
          break;
        case 3:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x3436746E69;
          break;
        case 4:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x38746E6975;
          break;
        case 5:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x3631746E6975;
          break;
        case 6:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x3233746E6975;
          break;
        case 7:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x3436746E6975;
          break;
        case 8:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x363174616F6C66;
          break;
        case 9:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x323374616F6C66;
          break;
        case 0xA:
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x343674616F6C66;
          break;
        case 0xB:
          uint64_t v8 = 1819242338;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 947154537;
      switch(a1)
      {
        case 1:
          unint64_t v9 = 0xE500000000000000;
          if (v8 == 0x3631746E69) {
            goto LABEL_36;
          }
          goto LABEL_37;
        case 2:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x3233746E69) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 3:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x3436746E69) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 4:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x38746E6975) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 5:
          unint64_t v9 = 0xE600000000000000;
          if (v8 != 0x3631746E6975) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 6:
          unint64_t v9 = 0xE600000000000000;
          if (v8 != 0x3233746E6975) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 7:
          unint64_t v9 = 0xE600000000000000;
          if (v8 != 0x3436746E6975) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 8:
          unint64_t v9 = 0xE700000000000000;
          if (v8 != 0x363174616F6C66) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 9:
          unint64_t v9 = 0xE700000000000000;
          if (v8 != 0x323374616F6C66) {
            goto LABEL_37;
          }
          goto LABEL_36;
        case 10:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x343674616F6C66;
          goto LABEL_35;
        case 11:
          if (v8 != 1819242338) {
            goto LABEL_37;
          }
          goto LABEL_36;
        default:
LABEL_35:
          if (v8 != v10) {
            goto LABEL_37;
          }
LABEL_36:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            return 1;
          }
LABEL_37:
          char v11 = sub_259DF80E0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11)
          {
            swift_bridgeObjectRelease();
            return 1;
          }
          if (v2 != v5) {
            continue;
          }
          swift_bridgeObjectRelease();
          break;
      }
      break;
    }
  }
  return 0;
}

uint64_t sub_259DC1560(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_259DF80E0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  unint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_259DF80E0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t FieldType.isInteger.getter()
{
  return sub_259DC11C0(*v0, (uint64_t)&unk_2707BD9E8);
}

uint64_t FieldType.isUnsigned.getter()
{
  return sub_259DC11C0(*v0, (uint64_t)&unk_2707BDA60);
}

uint64_t FieldType.size.getter()
{
  unsigned int v1 = *v0 - 1;
  if (v1 > 9) {
    return 1;
  }
  else {
    return qword_259DF89E8[(char)v1];
  }
}

uint64_t FieldType.stride.getter()
{
  unsigned int v1 = *v0 - 1;
  if (v1 > 9) {
    return 1;
  }
  else {
    return qword_259DF89E8[(char)v1];
  }
}

uint64_t FieldType.alignment.getter()
{
  unsigned int v1 = *v0 - 1;
  if (v1 > 9) {
    return 1;
  }
  else {
    return qword_259DF89E8[(char)v1];
  }
}

uint64_t FieldType.description.getter()
{
  uint64_t result = 947154537;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x3631746E69;
      break;
    case 2:
      uint64_t result = 0x3233746E69;
      break;
    case 3:
      uint64_t result = 0x3436746E69;
      break;
    case 4:
      uint64_t result = 0x38746E6975;
      break;
    case 5:
      uint64_t result = 0x3631746E6975;
      break;
    case 6:
      uint64_t result = 0x3233746E6975;
      break;
    case 7:
      uint64_t result = 0x3436746E6975;
      break;
    case 8:
      uint64_t result = 0x363174616F6C66;
      break;
    case 9:
      uint64_t result = 0x323374616F6C66;
      break;
    case 0xA:
      uint64_t result = 0x343674616F6C66;
      break;
    case 0xB:
      uint64_t result = 1819242338;
      break;
    default:
      return result;
  }
  return result;
}

void static Int8.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void sub_259DC1818(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static Int16.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void sub_259DC182C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void static Int32.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

void sub_259DC1844(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

void static Int64.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void sub_259DC185C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void static UInt8.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

void sub_259DC1874(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

void static UInt16.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

void sub_259DC188C(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

void static UInt32.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

void sub_259DC18A4(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

void static UInt64.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

void sub_259DC18BC(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

void static Float16.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

void sub_259DC18D4(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

void static Float.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

void sub_259DC18EC(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

void static Double.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

void sub_259DC1904(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

void static Bool.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = 11;
}

void sub_259DC191C(unsigned char *a1@<X8>)
{
  *a1 = 11;
}

uint64_t dispatch thunk of static FieldTypeConvertible.fieldType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_259DC193C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_259DE637C(0, v1, 0);
    uint64_t v2 = v11;
    unsigned int v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        sub_259DE637C(v7 > 1, v8 + 1, 1);
      }
      v4 += 4;
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v6;
      *(void *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_259DC1A14(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_259DE6428(0, v2, 0);
    uint64_t result = v9;
    unsigned int v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v6 = *v4;
      v4 += 2;
      uint64_t v5 = v6;
      uint64_t v10 = result;
      unint64_t v8 = *(void *)(result + 16);
      unint64_t v7 = *(void *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_259DE6428(v7 > 1, v8 + 1, 1);
        uint64_t result = v10;
      }
      *(void *)(result + 16) = v8 + 1;
      *(void *)(result + 8 * v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t PlanksReader.filePath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC6Planks12PlanksReader_filePath;
  uint64_t v4 = sub_259DF7AE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t PlanksReader.fileSize.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader_fileSize);
}

uint64_t PlanksReader.metadataSize.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader_metadataSize);
}

uint64_t PlanksReader.metadata.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 8);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 24);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t PlanksReader.__allocating_init(filePath:)(uint64_t a1, unint64_t a2)
{
  return PlanksReader.init(filePath:)(a1, a2);
}

uint64_t PlanksReader.init(filePath:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_259DF7AE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement) = 0;
  swift_bridgeObjectRetain();
  v120 = (uint8_t *)a1;
  unint64_t v10 = a2;
  sub_259DF7AF0();
  uint64_t v11 = v3 + OBJC_IVAR____TtC6Planks12PlanksReader_filePath;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_filePath, v9, v6);
  uint64_t v122 = 0;
  int v123 = 16842752;
  v121 = (uint8_t *)v11;
  sub_259DF7AD0();
  uint64_t v12 = v124;
  uint64_t v13 = OBJC_IVAR____TtC6Planks12PlanksReader_fd;
  *(_DWORD *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_fd) = v124;
  uint64_t v14 = sub_259DF7A90();
  int v15 = v14;
  if (v16)
  {
    LODWORD(v124) = v14;
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    uint64_t v22 = (void *)swift_allocError();
    _DWORD *v23 = v15;
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_259DF7A50();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A3F63A0);
    MEMORY[0x25A2EC420](v22);
    swift_bridgeObjectRetain();
    MEMORY[0x25A2EC420](v22);
    char v25 = sub_259DF7A30();
    os_log_type_t v26 = sub_259DF7DA0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v118 = v7;
      uint64_t v28 = v27;
      uint64_t v29 = v3;
      uint64_t v30 = (void *)swift_slowAlloc();
      uint64_t v116 = swift_slowAlloc();
      uint64_t v117 = v29;
      v124 = (uint8_t *)v116;
      *(_DWORD *)uint64_t v28 = 138412546;
      MEMORY[0x25A2EC420](v22);
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v128 = v31;
      v119 = (uint8_t *)v6;
      sub_259DF7DE0();
      *uint64_t v30 = v31;

      *(_WORD *)(v28 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v128 = sub_259DC6D7C((uint64_t)v120, v10, (uint64_t *)&v124);
      uint64_t v6 = (uint64_t)v119;
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v25, v26, "File error: %@ - %s", (uint8_t *)v28, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3218);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v30, -1, -1);
      uint64_t v32 = v116;
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v32, -1, -1);
      uint64_t v33 = v28;
      uint64_t v7 = v118;
      MEMORY[0x25A2EC590](v33, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_16;
  }
  uint64_t v118 = v7;
  v119 = (uint8_t *)v6;
  uint64_t v17 = OBJC_IVAR____TtC6Planks12PlanksReader_fileSize;
  *(void *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_fileSize) = v14;
  if (v14 < 12)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_259DF7A50();
    __swift_project_value_buffer(v18, (uint64_t)qword_26A3F63A0);
    swift_retain();
    unint64_t v19 = sub_259DF7A30();
    os_log_type_t v20 = sub_259DF7DA0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 134217984;
      v124 = *(uint8_t **)(v3 + v17);
      sub_259DF7DE0();
      swift_release();
      _os_log_impl(&dword_259DBD000, v19, v20, "Invalid fileSize: %lld", v21, 0xCu);
      MEMORY[0x25A2EC590](v21, -1, -1);
    }
    else
    {

      swift_release();
    }
    uint64_t v7 = v118;
    uint64_t v6 = (uint64_t)v119;
    goto LABEL_16;
  }
  uint64_t v35 = sub_259DC9338(v12, 1);
  if (qword_26A3F3148 != -1) {
    swift_once();
  }
  if (!sub_259DC3E30(v35, (uint64_t)off_26A3F35E8))
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_259DF7A50();
    __swift_project_value_buffer(v36, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    v37 = sub_259DF7A30();
    os_log_type_t v38 = sub_259DF7DA0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v124 = (uint8_t *)v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      v120 = v39 + 4;
      uint64_t v41 = swift_bridgeObjectRetain();
      uint64_t v42 = MEMORY[0x25A2EBBE0](v41, MEMORY[0x263F8E778]);
      unint64_t v44 = v43;
      swift_bridgeObjectRelease();
      uint64_t v128 = sub_259DC6D7C(v42, v44, (uint64_t *)&v124);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v45 = "Invalid magicValue begin: %s";
LABEL_25:
      _os_log_impl(&dword_259DBD000, v37, v38, v45, v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v40, -1, -1);
      MEMORY[0x25A2EC590](v39, -1, -1);

LABEL_33:
      uint64_t v7 = v118;
      uint64_t v6 = (uint64_t)v119;
LABEL_16:
      (*(void (**)(uint8_t *, uint64_t))(v7 + 8))(v121, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for PlanksReader();
      swift_deallocPartialClassInstance();
      return 0;
    }
LABEL_32:

    swift_bridgeObjectRelease_n();
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  uint64_t v46 = sub_259DC9338(*(unsigned int *)(v3 + v13), 0);
  swift_bridgeObjectRelease();
  if (!sub_259DC3E30(v46, (uint64_t)off_26A3F35E8))
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_259DF7A50();
    __swift_project_value_buffer(v49, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    v37 = sub_259DF7A30();
    os_log_type_t v38 = sub_259DF7DA0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v124 = (uint8_t *)v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      v120 = v39 + 4;
      uint64_t v50 = swift_bridgeObjectRetain();
      uint64_t v51 = MEMORY[0x25A2EBBE0](v50, MEMORY[0x263F8E778]);
      unint64_t v53 = v52;
      swift_bridgeObjectRelease();
      uint64_t v128 = sub_259DC6D7C(v51, v53, (uint64_t *)&v124);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v45 = "Invalid magicValue end: %s";
      goto LABEL_25;
    }
    goto LABEL_32;
  }
  swift_bridgeObjectRelease();
  uint64_t v47 = sub_259DC94E4();
  if (v48)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v63 = sub_259DF7A50();
    __swift_project_value_buffer(v63, (uint64_t)qword_26A3F63A0);
    swift_retain_n();
    v64 = sub_259DF7A30();
    os_log_type_t v65 = sub_259DF7DA0();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      v124 = (uint8_t *)v67;
      *(_DWORD *)v66 = 136315138;
      sub_259DC9708();
      uint64_t v68 = (uint64_t)v119;
      uint64_t v69 = sub_259DF80A0();
      uint64_t v128 = sub_259DC6D7C(v69, v70, (uint64_t *)&v124);
      uint64_t v6 = v68;
      sub_259DF7DE0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v64, v65, "Failed at reading metadata size for %s", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v67, -1, -1);
      MEMORY[0x25A2EC590](v66, -1, -1);
    }
    else
    {

      swift_release_n();
      uint64_t v6 = (uint64_t)v119;
    }
    uint64_t v7 = v118;
    goto LABEL_16;
  }
  uint64_t v54 = v47;
  type metadata accessor for PlanksReader();
  static PlanksReader.readMetadata(_:metadataSize:)(v54, (uint64_t)&v124);
  uint64_t v71 = v125;
  if (!v125)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_259DF7A50();
    __swift_project_value_buffer(v55, (uint64_t)qword_26A3F63A0);
    swift_retain_n();
    v56 = sub_259DF7A30();
    os_log_type_t v57 = sub_259DF7DA0();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      v124 = (uint8_t *)v59;
      *(_DWORD *)v58 = 136315138;
      sub_259DC9708();
      uint64_t v60 = (uint64_t)v119;
      uint64_t v61 = sub_259DF80A0();
      uint64_t v128 = sub_259DC6D7C(v61, v62, (uint64_t *)&v124);
      uint64_t v6 = v60;
      sub_259DF7DE0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v56, v57, "Failed at reading metadata for %s", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v59, -1, -1);
      MEMORY[0x25A2EC590](v58, -1, -1);
    }
    else
    {

      swift_release_n();
      uint64_t v6 = (uint64_t)v119;
    }
    uint64_t v7 = v118;
    goto LABEL_16;
  }
  uint64_t v72 = v126;
  uint64_t v73 = v127;
  v74 = (uint8_t **)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata);
  v121 = v124;
  *v74 = v124;
  v74[1] = (uint8_t *)v71;
  v74[2] = (uint8_t *)v72;
  v74[3] = (uint8_t *)v73;
  *(void *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_metadataSize) = v54;
  uint64_t v75 = qword_26A3F3140;
  swift_bridgeObjectRetain();
  uint64_t v116 = v72;
  swift_bridgeObjectRetain();
  v120 = (uint8_t *)v73;
  swift_bridgeObjectRetain();
  if (v75 != -1) {
    swift_once();
  }
  uint64_t v76 = sub_259DF7A50();
  uint64_t v77 = __swift_project_value_buffer(v76, (uint64_t)qword_26A3F63A0);
  swift_retain_n();
  uint64_t v118 = v77;
  v78 = sub_259DF7A30();
  os_log_type_t v79 = sub_259DF7D90();
  BOOL v80 = os_log_type_enabled(v78, v79);
  uint64_t v117 = v54;
  if (v80)
  {
    v81 = (uint8_t *)swift_slowAlloc();
    uint64_t v82 = swift_slowAlloc();
    v124 = (uint8_t *)v82;
    *(_DWORD *)v81 = 136315138;
    sub_259DC9708();
    uint64_t v83 = sub_259DF80A0();
    uint64_t v128 = sub_259DC6D7C(v83, v84, (uint64_t *)&v124);
    sub_259DF7DE0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259DBD000, v78, v79, "PlanksReader file path: %s", v81, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v82, -1, -1);
    MEMORY[0x25A2EC590](v81, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_retain();
  v85 = sub_259DF7A30();
  os_log_type_t v86 = sub_259DF7D90();
  BOOL v87 = os_log_type_enabled(v85, v86);
  uint64_t v88 = v116;
  if (v87)
  {
    v89 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v89 = 134217984;
    v124 = *(uint8_t **)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_fileSize);
    sub_259DF7DE0();
    swift_release();
    _os_log_impl(&dword_259DBD000, v85, v86, "PlanksReader file size: %lld", v89, 0xCu);
    MEMORY[0x25A2EC590](v89, -1, -1);
  }
  else
  {

    swift_release();
  }
  v90 = sub_259DF7A30();
  os_log_type_t v91 = sub_259DF7D90();
  if (os_log_type_enabled(v90, v91))
  {
    v92 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v92 = 134217984;
    v124 = (uint8_t *)v117;
    sub_259DF7DE0();
    _os_log_impl(&dword_259DBD000, v90, v91, "PlanksReader file metadata size: %ld", v92, 0xCu);
    MEMORY[0x25A2EC590](v92, -1, -1);
  }
  uint64_t v117 = v3;

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v93 = (uint64_t)v120;
  swift_bridgeObjectRetain_n();
  v94 = sub_259DF7A30();
  os_log_type_t v95 = sub_259DF7D90();
  if (os_log_type_enabled(v94, v95))
  {
    v96 = (uint8_t *)swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    v119 = (uint8_t *)v97;
    *(_DWORD *)v96 = 136315138;
    uint64_t v98 = v71;
    uint64_t v99 = (uint64_t)v121;
    v124 = v121;
    uint64_t v125 = v98;
    uint64_t v126 = v88;
    uint64_t v127 = (uint64_t)v120;
    uint64_t v128 = v97;
    uint64_t v100 = sub_259DC43E8();
    v124 = (uint8_t *)sub_259DC6D7C(v100, v101, &v128);
    uint64_t v93 = (uint64_t)v120;
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    sub_259DC9760(v99, v98);
    uint64_t v102 = v99;
    uint64_t v71 = v98;
    sub_259DC9760(v102, v98);
    _os_log_impl(&dword_259DBD000, v94, v95, "PlanksReader file metadata summary: %s", v96, 0xCu);
    v103 = v119;
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v103, -1, -1);
    MEMORY[0x25A2EC590](v96, -1, -1);
  }
  else
  {
    uint64_t v104 = (uint64_t)v121;
    sub_259DC9760((uint64_t)v121, v71);
    sub_259DC9760(v104, v71);
  }

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v105 = sub_259DF7A30();
  os_log_type_t v106 = sub_259DF7D90();
  if (os_log_type_enabled(v105, v106))
  {
    v107 = (uint8_t *)swift_slowAlloc();
    v120 = (uint8_t *)swift_slowAlloc();
    v124 = v120;
    *(_DWORD *)v107 = 136315138;
    v119 = v107 + 4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v108 = v71;
    uint64_t v109 = (uint64_t)v121;
    uint64_t v110 = sub_259DC671C((uint64_t)v121, v108, v88, v93);
    unint64_t v112 = v111;
    sub_259DC9760(v109, v108);
    uint64_t v128 = sub_259DC6D7C(v110, v112, (uint64_t *)&v124);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    sub_259DC9760(v109, v108);
    sub_259DC9760(v109, v108);
    _os_log_impl(&dword_259DBD000, v105, v106, "PlanksReader file metadata: %s", v107, 0xCu);
    uint64_t v113 = (uint64_t)v120;
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v113, -1, -1);
    MEMORY[0x25A2EC590](v107, -1, -1);
  }
  else
  {
    uint64_t v114 = v71;
    uint64_t v115 = (uint64_t)v121;
    sub_259DC9760((uint64_t)v121, v114);
    sub_259DC9760(v115, v114);
  }

  return v117;
}

uint64_t static PlanksReader.readMagic(_:begin:)(uint64_t a1, char a2)
{
  return sub_259DC9338(a1, a2);
}

uint64_t sub_259DC2FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = v2 - 1;
      do
      {
        uint64_t v7 = *(void *)(a1 + v5 + 40);
        char v8 = *(unsigned char *)(a1 + v5 + 64);
        char v9 = *(unsigned char *)(a1 + v5 + 65);
        __int16 v10 = *(_WORD *)(a1 + v5 + 88);
        v25[0] = *(void *)(a1 + v5 + 32);
        v25[1] = v7;
        long long v26 = *(_OWORD *)(a1 + v5 + 48);
        char v27 = v8;
        char v28 = v9;
        long long v29 = *(_OWORD *)(a1 + v5 + 72);
        __int16 v30 = v10;
        uint64_t v11 = *(void *)(a2 + v5 + 40);
        char v12 = *(unsigned char *)(a2 + v5 + 64);
        char v13 = *(unsigned char *)(a2 + v5 + 65);
        __int16 v14 = *(_WORD *)(a2 + v5 + 88);
        v19[0] = *(void *)(a2 + v5 + 32);
        v19[1] = v11;
        long long v20 = *(_OWORD *)(a2 + v5 + 48);
        char v21 = v12;
        char v22 = v13;
        long long v23 = *(_OWORD *)(a2 + v5 + 72);
        __int16 v24 = v14;
        char v15 = _s6Planks11ColumnChunkV2eeoiySbAC_ACtFZ_0((uint64_t)v25, (uint64_t)v19);
        BOOL v17 = v6-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v5 += 64;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_259DC30C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a2 + 56);
    uint64_t v4 = (uint64_t *)(a1 + 56);
    while (1)
    {
      uint64_t v5 = *((unsigned __int8 *)v4 - 8);
      uint64_t v6 = *v4;
      uint64_t v7 = *((unsigned __int8 *)v3 - 8);
      uint64_t v8 = *v3;
      BOOL v9 = *(v4 - 3) == *(v3 - 3) && *(v4 - 2) == *(v3 - 2);
      if (!v9 && (sub_259DF80E0() & 1) == 0) {
        return 0;
      }
      v4 += 4;
      unint64_t v10 = 0xE400000000000000;
      uint64_t v11 = 947154537;
      switch(v5)
      {
        case 1:
          unint64_t v10 = 0xE500000000000000;
          uint64_t v11 = 0x3631746E69;
          break;
        case 2:
          unint64_t v10 = 0xE500000000000000;
          uint64_t v11 = 0x3233746E69;
          break;
        case 3:
          unint64_t v10 = 0xE500000000000000;
          uint64_t v11 = 0x3436746E69;
          break;
        case 4:
          unint64_t v10 = 0xE500000000000000;
          uint64_t v11 = 0x38746E6975;
          break;
        case 5:
          unint64_t v10 = 0xE600000000000000;
          uint64_t v11 = 0x3631746E6975;
          break;
        case 6:
          unint64_t v10 = 0xE600000000000000;
          uint64_t v11 = 0x3233746E6975;
          break;
        case 7:
          unint64_t v10 = 0xE600000000000000;
          uint64_t v11 = 0x3436746E6975;
          break;
        case 8:
          unint64_t v10 = 0xE700000000000000;
          uint64_t v11 = 0x363174616F6C66;
          break;
        case 9:
          unint64_t v10 = 0xE700000000000000;
          uint64_t v11 = 0x323374616F6C66;
          break;
        case 10:
          unint64_t v10 = 0xE700000000000000;
          uint64_t v11 = 0x343674616F6C66;
          break;
        case 11:
          uint64_t v11 = 1819242338;
          break;
        default:
          break;
      }
      unint64_t v12 = 0xE400000000000000;
      uint64_t v13 = 947154537;
      switch(v7)
      {
        case 1:
          unint64_t v12 = 0xE500000000000000;
          if (v11 == 0x3631746E69) {
            goto LABEL_45;
          }
          goto LABEL_46;
        case 2:
          unint64_t v12 = 0xE500000000000000;
          if (v11 != 0x3233746E69) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 3:
          unint64_t v12 = 0xE500000000000000;
          if (v11 != 0x3436746E69) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 4:
          unint64_t v12 = 0xE500000000000000;
          if (v11 != 0x38746E6975) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 5:
          unint64_t v12 = 0xE600000000000000;
          if (v11 != 0x3631746E6975) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 6:
          unint64_t v12 = 0xE600000000000000;
          if (v11 != 0x3233746E6975) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 7:
          unint64_t v12 = 0xE600000000000000;
          if (v11 != 0x3436746E6975) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 8:
          unint64_t v12 = 0xE700000000000000;
          if (v11 != 0x363174616F6C66) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 9:
          unint64_t v12 = 0xE700000000000000;
          if (v11 != 0x323374616F6C66) {
            goto LABEL_46;
          }
          goto LABEL_45;
        case 10:
          unint64_t v12 = 0xE700000000000000;
          uint64_t v13 = 0x343674616F6C66;
          goto LABEL_44;
        case 11:
          if (v11 != 1819242338) {
            goto LABEL_46;
          }
          goto LABEL_45;
        default:
LABEL_44:
          if (v11 != v13) {
            goto LABEL_46;
          }
LABEL_45:
          if (v10 == v12)
          {
            swift_bridgeObjectRelease_n();
            if (v6 != v8) {
              return 0;
            }
          }
          else
          {
LABEL_46:
            char v14 = sub_259DF80E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t result = 0;
            if ((v14 & 1) == 0 || v6 != v8) {
              return result;
            }
          }
          v3 += 4;
          if (!--v2) {
            return 1;
          }
          break;
      }
    }
  }
  return 1;
}

BOOL sub_259DC3490(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 32;
    uint64_t v61 = *(void *)(a1 + 16);
    uint64_t v62 = a2 + 32;
    uint64_t v60 = a1 + 32;
    while (1)
    {
      uint64_t v5 = v4 + 40 * v3;
      uint64_t v69 = v3;
      if (*(unsigned char *)v5)
      {
        if (*(unsigned char *)v5 == 1)
        {
          unint64_t v6 = 0xE400000000000000;
          uint64_t v7 = 1635017060;
        }
        else
        {
          unint64_t v6 = 0xE500000000000000;
          uint64_t v7 = 0x7865646E69;
        }
      }
      else
      {
        unint64_t v6 = 0xE600000000000000;
        uint64_t v7 = 0x656C706D6973;
      }
      uint64_t v8 = v62 + 40 * v3;
      if (*(unsigned char *)v8)
      {
        if (*(unsigned char *)v8 == 1)
        {
          unint64_t v9 = 0xE400000000000000;
          uint64_t v10 = 1635017060;
        }
        else
        {
          unint64_t v9 = 0xE500000000000000;
          uint64_t v10 = 0x7865646E69;
        }
      }
      else
      {
        unint64_t v9 = 0xE600000000000000;
        uint64_t v10 = 0x656C706D6973;
      }
      uint64_t v11 = *(void *)(v5 + 8);
      uint64_t v67 = *(void *)(v5 + 24);
      uint64_t v68 = *(void *)(v5 + 16);
      uint64_t v66 = *(void *)(v5 + 32);
      uint64_t v12 = *(void *)(v8 + 8);
      uint64_t v64 = *(void *)(v8 + 24);
      uint64_t v65 = *(void *)(v8 + 16);
      uint64_t v63 = *(void *)(v8 + 32);
      if (v7 != v10) {
        goto LABEL_18;
      }
      if (v6 == v9)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
      }
      else
      {
LABEL_18:
        char v13 = sub_259DF80E0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0) {
          break;
        }
      }
      uint64_t v14 = *(void *)(v11 + 16);
      if (v14 != *(void *)(v12 + 16)) {
        break;
      }
      if (v14 && v11 != v12)
      {
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        uint64_t v71 = v11;
        uint64_t v72 = v12;
        uint64_t v70 = *(void *)(v11 + 16);
        while (1)
        {
          if (v16 >= *(void *)(v12 + 16))
          {
            __break(1u);
            JUMPOUT(0x259DC3D70);
          }
          unint64_t v73 = v16;
          uint64_t v18 = v11 + v15;
          uint64_t v19 = *(void *)(v11 + v15 + 32);
          uint64_t v20 = *(void *)(v11 + v15 + 40);
          uint64_t v21 = *(void *)(v11 + v15 + 48);
          uint64_t v22 = *(void *)(v11 + v15 + 56);
          char v23 = *(unsigned char *)(v18 + 64);
          int v24 = *(unsigned __int8 *)(v18 + 65);
          double v26 = *(double *)(v18 + 72);
          double v25 = *(double *)(v18 + 80);
          unsigned int v74 = *(unsigned __int16 *)(v18 + 88);
          uint64_t v27 = v15;
          uint64_t v28 = v12 + v15;
          uint64_t v29 = *(void *)(v12 + v15 + 32);
          uint64_t v30 = *(void *)(v12 + v15 + 40);
          uint64_t v31 = *(void *)(v12 + v15 + 48);
          uint64_t v32 = *(void *)(v28 + 56);
          char v33 = *(unsigned char *)(v28 + 64);
          int v34 = *(unsigned __int8 *)(v28 + 65);
          double v36 = *(double *)(v28 + 72);
          double v35 = *(double *)(v28 + 80);
          unsigned int v37 = *(unsigned __int16 *)(v28 + 88);
          if ((v19 != v29 || v20 != v30) && (sub_259DF80E0() & 1) == 0) {
            goto LABEL_130;
          }
          if (v21 != v31 || v22 != v32) {
            goto LABEL_130;
          }
          if (v23)
          {
            if ((v33 & 1) == 0) {
              goto LABEL_130;
            }
          }
          else if (v33)
          {
            goto LABEL_130;
          }
          if (v24 == 2)
          {
            uint64_t v38 = v27;
            if (v34 != 2) {
              goto LABEL_130;
            }
          }
          else
          {
            if (v34 == 2) {
              goto LABEL_130;
            }
            uint64_t v38 = v27;
            uint64_t v39 = (v24 & 1) != 0 ? 0x657A69746E617571 : 0x6572706D6F636E75;
            unint64_t v40 = (v24 & 1) != 0 ? 0xE900000000000064 : 0xEC00000064657373;
            uint64_t v41 = (v34 & 1) != 0 ? 0x657A69746E617571 : 0x6572706D6F636E75;
            unint64_t v42 = (v34 & 1) != 0 ? 0xE900000000000064 : 0xEC00000064657373;
            if (v39 == v41 && v40 == v42)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              char v43 = sub_259DF80E0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v43 & 1) == 0) {
                goto LABEL_130;
              }
            }
          }
          if (v26 != v36 || v25 != v35) {
            goto LABEL_130;
          }
          uint64_t v44 = v37 >> 8;
          int v45 = v37;
          unint64_t v46 = 0xE400000000000000;
          uint64_t v47 = 947154537;
          switch((char)v74)
          {
            case 0:
              break;
            case 1:
              unint64_t v46 = 0xE500000000000000;
              uint64_t v47 = 0x3631746E69;
              break;
            case 2:
              unint64_t v46 = 0xE500000000000000;
              uint64_t v47 = 0x3233746E69;
              break;
            case 3:
              unint64_t v46 = 0xE500000000000000;
              uint64_t v47 = 0x3436746E69;
              break;
            case 4:
              unint64_t v46 = 0xE500000000000000;
              uint64_t v47 = 0x38746E6975;
              break;
            case 5:
              unint64_t v46 = 0xE600000000000000;
              uint64_t v47 = 0x3631746E6975;
              break;
            case 6:
              unint64_t v46 = 0xE600000000000000;
              uint64_t v47 = 0x3233746E6975;
              break;
            case 7:
              unint64_t v46 = 0xE600000000000000;
              uint64_t v47 = 0x3436746E6975;
              break;
            case 8:
              unint64_t v46 = 0xE700000000000000;
              uint64_t v47 = 0x363174616F6C66;
              break;
            case 9:
              unint64_t v46 = 0xE700000000000000;
              uint64_t v47 = 0x323374616F6C66;
              break;
            case 10:
              unint64_t v46 = 0xE700000000000000;
              uint64_t v47 = 0x343674616F6C66;
              break;
            case 11:
              uint64_t v47 = 1819242338;
              break;
            default:
              uint64_t v11 = v71;
              uint64_t v12 = v72;
              uint64_t v17 = v70;
              if (v45 == 12) {
                goto LABEL_24;
              }
              goto LABEL_130;
          }
          unint64_t v48 = 0xE400000000000000;
          uint64_t v49 = 947154537;
          switch((char)v37)
          {
            case 0:
              goto LABEL_81;
            case 1:
              unint64_t v48 = 0xE500000000000000;
              uint64_t v49 = 0x3631746E69;
              goto LABEL_81;
            case 2:
              unint64_t v48 = 0xE500000000000000;
              uint64_t v49 = 0x3233746E69;
              goto LABEL_81;
            case 3:
              unint64_t v48 = 0xE500000000000000;
              uint64_t v49 = 0x3436746E69;
              goto LABEL_81;
            case 4:
              unint64_t v48 = 0xE500000000000000;
              uint64_t v49 = 0x38746E6975;
              goto LABEL_81;
            case 5:
              unint64_t v48 = 0xE600000000000000;
              uint64_t v49 = 0x3631746E6975;
              goto LABEL_81;
            case 6:
              unint64_t v48 = 0xE600000000000000;
              uint64_t v49 = 0x3233746E6975;
              goto LABEL_81;
            case 7:
              unint64_t v48 = 0xE600000000000000;
              uint64_t v49 = 0x3436746E6975;
              goto LABEL_81;
            case 8:
              unint64_t v48 = 0xE700000000000000;
              uint64_t v49 = 0x363174616F6C66;
              goto LABEL_81;
            case 9:
              unint64_t v48 = 0xE700000000000000;
              uint64_t v49 = 0x323374616F6C66;
              goto LABEL_81;
            case 10:
              unint64_t v48 = 0xE700000000000000;
              uint64_t v49 = 0x343674616F6C66;
              goto LABEL_81;
            case 11:
              uint64_t v49 = 1819242338;
LABEL_81:
              if (v47 == v49 && v46 == v48)
              {
                swift_bridgeObjectRelease_n();
                uint64_t v17 = v70;
              }
              else
              {
                char v50 = sub_259DF80E0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v17 = v70;
                if ((v50 & 1) == 0) {
                  goto LABEL_130;
                }
              }
              unint64_t v51 = 0xE400000000000000;
              uint64_t v11 = v71;
              uint64_t v52 = 947154537;
              switch(v74 >> 8)
              {
                case 1u:
                  unint64_t v51 = 0xE500000000000000;
                  uint64_t v52 = 0x3631746E69;
                  break;
                case 2u:
                  unint64_t v51 = 0xE500000000000000;
                  uint64_t v52 = 0x3233746E69;
                  break;
                case 3u:
                  unint64_t v51 = 0xE500000000000000;
                  uint64_t v52 = 0x3436746E69;
                  break;
                case 4u:
                  unint64_t v51 = 0xE500000000000000;
                  uint64_t v52 = 0x38746E6975;
                  break;
                case 5u:
                  unint64_t v51 = 0xE600000000000000;
                  uint64_t v52 = 0x3631746E6975;
                  break;
                case 6u:
                  unint64_t v51 = 0xE600000000000000;
                  uint64_t v52 = 0x3233746E6975;
                  break;
                case 7u:
                  unint64_t v51 = 0xE600000000000000;
                  uint64_t v52 = 0x3436746E6975;
                  break;
                case 8u:
                  unint64_t v51 = 0xE700000000000000;
                  uint64_t v52 = 0x363174616F6C66;
                  break;
                case 9u:
                  unint64_t v51 = 0xE700000000000000;
                  uint64_t v52 = 0x323374616F6C66;
                  break;
                case 0xAu:
                  unint64_t v51 = 0xE700000000000000;
                  uint64_t v52 = 0x343674616F6C66;
                  break;
                case 0xBu:
                  uint64_t v52 = 1819242338;
                  break;
                default:
                  break;
              }
              unint64_t v53 = 0xE400000000000000;
              uint64_t v54 = 947154537;
              uint64_t v12 = v72;
              switch(v44)
              {
                case 1:
                  unint64_t v53 = 0xE500000000000000;
                  uint64_t v54 = 0x3631746E69;
                  break;
                case 2:
                  unint64_t v53 = 0xE500000000000000;
                  uint64_t v54 = 0x3233746E69;
                  break;
                case 3:
                  unint64_t v53 = 0xE500000000000000;
                  uint64_t v54 = 0x3436746E69;
                  break;
                case 4:
                  unint64_t v53 = 0xE500000000000000;
                  uint64_t v54 = 0x38746E6975;
                  break;
                case 5:
                  unint64_t v53 = 0xE600000000000000;
                  uint64_t v54 = 0x3631746E6975;
                  break;
                case 6:
                  unint64_t v53 = 0xE600000000000000;
                  uint64_t v54 = 0x3233746E6975;
                  break;
                case 7:
                  unint64_t v53 = 0xE600000000000000;
                  uint64_t v54 = 0x3436746E6975;
                  break;
                case 8:
                  unint64_t v53 = 0xE700000000000000;
                  uint64_t v54 = 0x363174616F6C66;
                  break;
                case 9:
                  unint64_t v53 = 0xE700000000000000;
                  uint64_t v54 = 0x323374616F6C66;
                  break;
                case 10:
                  unint64_t v53 = 0xE700000000000000;
                  uint64_t v54 = 0x343674616F6C66;
                  break;
                case 11:
                  uint64_t v54 = 1819242338;
                  break;
                default:
                  break;
              }
              if (v52 == v54 && v51 == v53)
              {
                swift_bridgeObjectRelease_n();
              }
              else
              {
                char v55 = sub_259DF80E0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v55 & 1) == 0) {
                  goto LABEL_130;
                }
              }
LABEL_24:
              unint64_t v16 = v73 + 1;
              uint64_t v15 = v38 + 64;
              if (v17 == v73 + 1) {
                goto LABEL_114;
              }
              break;
            default:
              goto LABEL_130;
          }
        }
      }
LABEL_114:
      uint64_t v3 = v69 + 1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL result = v68 == v65 && v67 == v64 && v66 == v63;
      uint64_t v4 = v60;
      if (!result || v3 == v61) {
        return result;
      }
    }
LABEL_130:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return 0;
}

BOOL sub_259DC3E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (unsigned __int8 *)(a1 + 33);
  unint64_t v6 = (unsigned __int8 *)(a2 + 33);
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    int v10 = *v6++;
    int v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t static PlanksReader.readMetadataSize(_:)()
{
  uint64_t result = sub_259DC94E4();
  if (v0) {
    return v2;
  }
  return result;
}

void static PlanksReader.readMetadata(_:metadataSize:)(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_259DF76B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_259DF7A90();
  int v10 = v9;
  if (v11)
  {
    LODWORD(v38) = v9;
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    swift_allocError();
    *double v26 = v10;
    return;
  }
  uint64_t v12 = v9 - a1;
  if (__OFSUB__(v9, a1))
  {
    __break(1u);
LABEL_22:
    swift_once();
    goto LABEL_12;
  }
  if (v12 > 0)
  {
    uint64_t v13 = swift_slowAlloc();
    int v14 = sub_259DF7A70();
    if (v15)
    {
      int v31 = v14;
      LODWORD(v38) = v14;
      sub_259DC6E50();
      swift_willThrowTypedImpl();
      swift_allocError();
      *uint64_t v32 = v31;
    }
    else
    {
      sub_259DF76F0();
      swift_allocObject();
      sub_259DF76E0();
      (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F060E0], v5);
      sub_259DF76C0();
      uint64_t v16 = sub_259DC5998(v13, a1);
      unint64_t v18 = v17;
      sub_259DC97B0();
      sub_259DF76D0();
      if (v2)
      {
        sub_259DC9804(v16, v18);
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v19 = sub_259DF7A50();
        __swift_project_value_buffer(v19, (uint64_t)qword_26A3F63A0);
        MEMORY[0x25A2EC420](v2);
        MEMORY[0x25A2EC420](v2);
        uint64_t v20 = sub_259DF7A30();
        os_log_type_t v21 = sub_259DF7DA0();
        if (os_log_type_enabled(v20, v21))
        {
          os_log_t v41 = v20;
          uint64_t v22 = (uint8_t *)swift_slowAlloc();
          unsigned int v37 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v22 = 138412290;
          MEMORY[0x25A2EC420](v2);
          uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v38 = v23;
          sub_259DF7DE0();
          int v24 = v37;
          void *v37 = v23;

          os_log_t v25 = v41;
          _os_log_impl(&dword_259DBD000, v41, v21, "Failed at parsing metadata: %@", v22, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3218);
          swift_arrayDestroy();
          MEMORY[0x25A2EC590](v24, -1, -1);
          MEMORY[0x25A2EC590](v22, -1, -1);

          swift_release();
        }
        else
        {
          swift_release();
        }
        uint64_t v33 = 0;
        uint64_t v35 = 0;
        long long v34 = 0uLL;
      }
      else
      {
        sub_259DC9804(v16, v18);
        swift_release();
        uint64_t v33 = v38;
        long long v34 = v39;
        uint64_t v35 = v40;
      }
      *(void *)a2 = v33;
      *(_OWORD *)(a2 + 8) = v34;
      *(void *)(a2 + 24) = v35;
    }
    MEMORY[0x25A2EC590](v13, -1, -1);
    return;
  }
  if (qword_26A3F3140 != -1) {
    goto LABEL_22;
  }
LABEL_12:
  uint64_t v27 = sub_259DF7A50();
  __swift_project_value_buffer(v27, (uint64_t)qword_26A3F63A0);
  uint64_t v28 = sub_259DF7A30();
  os_log_type_t v29 = sub_259DF7DA0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 134217984;
    uint64_t v38 = v12;
    sub_259DF7DE0();
    _os_log_impl(&dword_259DBD000, v28, v29, "Invalid metadataOffset: %lld", v30, 0xCu);
    MEMORY[0x25A2EC590](v30, -1, -1);
  }

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
}

uint64_t sub_259DC43E8()
{
  return 0;
}

uint64_t PlanksReader.deinit()
{
  if ((sub_259DF7AA0() & 0x100000000) != 0)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksReader_filePath;
  uint64_t v2 = sub_259DF7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlanksReader.__deallocating_deinit()
{
  PlanksReader.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_259DC472C()
{
  uint64_t v1 = OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet;
  if (*(void *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_259DC193C(v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v2 = sub_259DC9920(v4);
    swift_bridgeObjectRelease();
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_259DC4810(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_259DC4828(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_259DC472C();
  return sub_259DC4870;
}

uint64_t sub_259DC4870(void *a1, uint64_t a2)
{
  return sub_259DC56CC(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet);
}

uint64_t sub_259DC487C()
{
  return sub_259DC5014(&OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName, sub_259DC489C);
}

uint64_t sub_259DC489C(uint64_t a1)
{
  if (qword_26A3F3140 != -1) {
LABEL_23:
  }
    swift_once();
  uint64_t v2 = sub_259DF7A50();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A3F63A0);
  uint64_t v3 = sub_259DF7A30();
  os_log_type_t v4 = sub_259DF7D90();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_259DBD000, v3, v4, "Building elementByName index", v5, 2u);
    MEMORY[0x25A2EC590](v5, -1, -1);
  }

  uint64_t v6 = (void *)sub_259DE058C(MEMORY[0x263F8EE78]);
  uint64_t v7 = *(void *)(*(void *)(a1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 8) + 16);
  if (!v7) {
    return (uint64_t)v6;
  }
  int v8 = (void *)(swift_bridgeObjectRetain() + 56);
  while (1)
  {
    uint64_t v11 = *(v8 - 3);
    uint64_t v10 = *(v8 - 2);
    char v12 = *((unsigned char *)v8 - 8);
    a1 = *v8;
    swift_bridgeObjectRetain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v15 = sub_259DC840C(v11, v10);
    uint64_t v16 = v6[2];
    BOOL v17 = (v14 & 1) == 0;
    uint64_t v18 = v16 + v17;
    if (__OFADD__(v16, v17))
    {
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    char v19 = v14;
    if (v6[3] < v18) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v14) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_259DE3C30();
      if (v19)
      {
LABEL_6:
        uint64_t v9 = v6[7] + 32 * v15;
        swift_bridgeObjectRelease();
        *(void *)uint64_t v9 = v11;
        *(void *)(v9 + 8) = v10;
        *(unsigned char *)(v9 + 16) = v12;
        *(void *)(v9 + 24) = a1;
        goto LABEL_7;
      }
    }
LABEL_15:
    v6[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v22 = (uint64_t *)(v6[6] + 16 * v15);
    *uint64_t v22 = v11;
    v22[1] = v10;
    uint64_t v23 = v6[7] + 32 * v15;
    *(void *)uint64_t v23 = v11;
    *(void *)(v23 + 8) = v10;
    *(unsigned char *)(v23 + 16) = v12;
    *(void *)(v23 + 24) = a1;
    uint64_t v24 = v6[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_22;
    }
    v6[2] = v26;
    swift_bridgeObjectRetain();
LABEL_7:
    v8 += 4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v7)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v6;
    }
  }
  sub_259DE3114(v18, isUniquelyReferenced_nonNull_native);
  unint64_t v20 = sub_259DC840C(v11, v10);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    if (v19) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
  uint64_t result = sub_259DF8130();
  __break(1u);
  return result;
}

uint64_t sub_259DC4B3C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_259DC4B54(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_259DC487C();
  return sub_259DC4B9C;
}

uint64_t sub_259DC4B9C(void *a1, uint64_t a2)
{
  return sub_259DC56CC(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName);
}

uint64_t sub_259DC4BA8()
{
  return sub_259DC5014(&OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement, (uint64_t (*)(uint64_t))sub_259DC4BC8);
}

uint64_t sub_259DC4BC8()
{
  if (qword_26A3F3140 != -1) {
LABEL_35:
  }
    swift_once();
  uint64_t v0 = sub_259DF7A50();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F63A0);
  uint64_t v1 = sub_259DF7A30();
  os_log_type_t v2 = sub_259DF7D90();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_259DBD000, v1, v2, "Building chunksByElement index", v3, 2u);
    MEMORY[0x25A2EC590](v3, -1, -1);
  }

  os_log_type_t v4 = (void *)sub_259DE06CC(MEMORY[0x263F8EE78]);
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  uint64_t v8 = 40;
LABEL_5:
  unint64_t v9 = *(void *)(v5 + 16);
  if (v7 <= v9) {
    unint64_t v10 = *(void *)(v5 + 16);
  }
  else {
    unint64_t v10 = v7;
  }
  uint64_t v11 = v8 + 40 * v7;
  while (v9 != v7)
  {
    if (v10 == v7)
    {
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    uint64_t v12 = *(void *)(v5 + v11);
    ++v7;
    uint64_t v13 = *(void *)(v12 + 16);
    v11 += 40;
    if (v13)
    {
      uint64_t v38 = v8;
      uint64_t v39 = v5;
      swift_bridgeObjectRetain();
      uint64_t v14 = 0;
      uint64_t v40 = v13;
      unint64_t v15 = (uint64_t *)(v12 + 40);
      while (1)
      {
        uint64_t v17 = *(v15 - 1);
        uint64_t v16 = *v15;
        swift_bridgeObjectRetain();
        sub_259DCA2C4((uint64_t)v6);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v20 = sub_259DC840C(v17, v16);
        uint64_t v21 = v4[2];
        BOOL v22 = (v19 & 1) == 0;
        uint64_t v23 = v21 + v22;
        if (__OFADD__(v21, v22)) {
          goto LABEL_33;
        }
        char v24 = v19;
        if (v4[3] >= v23)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_259DE3E00();
          }
        }
        else
        {
          sub_259DE3454(v23, isUniquelyReferenced_nonNull_native);
          unint64_t v25 = sub_259DC840C(v17, v16);
          if ((v24 & 1) != (v26 & 1))
          {
            uint64_t result = sub_259DF8130();
            __break(1u);
            return result;
          }
          unint64_t v20 = v25;
        }
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0)
        {
          v4[(v20 >> 6) + 8] |= 1 << v20;
          uint64_t v27 = (uint64_t *)(v4[6] + 16 * v20);
          *uint64_t v27 = v17;
          v27[1] = v16;
          *(void *)(v4[7] + 8 * v20) = MEMORY[0x263F8EE78];
          uint64_t v28 = v4[2];
          uint64_t v29 = v28 + 1;
          BOOL v30 = __OFADD__(v28, 1);
          swift_bridgeObjectRetain();
          if (v30) {
            goto LABEL_34;
          }
          v4[2] = v29;
        }
        swift_bridgeObjectRetain();
        uint64_t v31 = v4[7];
        swift_bridgeObjectRelease();
        uint64_t v32 = *(void **)(v31 + 8 * v20);
        char v33 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v31 + 8 * v20) = v32;
        if ((v33 & 1) == 0)
        {
          uint64_t v32 = sub_259DCF428(0, v32[2] + 1, 1, v32);
          *(void *)(v31 + 8 * v20) = v32;
        }
        unint64_t v35 = v32[2];
        unint64_t v34 = v32[3];
        if (v35 >= v34 >> 1)
        {
          uint64_t v32 = sub_259DCF428((void *)(v34 > 1), v35 + 1, 1, v32);
          *(void *)(v31 + 8 * v20) = v32;
        }
        v15 += 8;
        v32[2] = v35 + 1;
        uint64_t v36 = &v32[2 * v35];
        v36[4] = v7 - 1;
        v36[5] = v14;
        swift_bridgeObjectRelease();
        uint64_t v6 = sub_259DC4F78;
        if (v40 == ++v14)
        {
          swift_bridgeObjectRelease();
          uint64_t v6 = sub_259DC4F78;
          uint64_t v8 = v38;
          uint64_t v5 = v39;
          goto LABEL_5;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  sub_259DCA2C4((uint64_t)v6);
  return (uint64_t)v4;
}

void sub_259DC4F78(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

uint64_t sub_259DC4F88(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_259DC4FA0(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_259DC4BA8();
  return sub_259DC4FE8;
}

uint64_t sub_259DC4FE8(void *a1, uint64_t a2)
{
  return sub_259DC56CC(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement);
}

uint64_t sub_259DC4FF4()
{
  return sub_259DC5014(&OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement, (uint64_t (*)(uint64_t))sub_259DC507C);
}

uint64_t sub_259DC5014(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = a2(v2);
    *(void *)(v2 + v3) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_259DC507C()
{
  if (qword_26A3F3140 != -1) {
LABEL_67:
  }
    swift_once();
  uint64_t v0 = sub_259DF7A50();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3F63A0);
  uint64_t v1 = sub_259DF7A30();
  os_log_type_t v2 = sub_259DF7D90();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_259DBD000, v1, v2, "Building groupsByElement index", v3, 2u);
    MEMORY[0x25A2EC590](v3, -1, -1);
  }

  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  uint64_t v5 = (void *)sub_259DE06D8(MEMORY[0x263F8EE78]);
  uint64_t v6 = sub_259DC4BA8();
  int64_t v7 = 0;
  uint64_t v54 = v6 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v6 + 64);
  int64_t v55 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v56 = v6;
  while (1)
  {
    if (v10)
    {
      uint64_t v57 = (v10 - 1) & v10;
      unint64_t v12 = __clz(__rbit64(v10)) | (v7 << 6);
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_65;
      }
      if (v13 >= v55)
      {
LABEL_61:
        swift_release();
        return (uint64_t)v5;
      }
      unint64_t v14 = *(void *)(v54 + 8 * v13);
      ++v7;
      if (!v14)
      {
        int64_t v7 = v13 + 1;
        if (v13 + 1 >= v55) {
          goto LABEL_61;
        }
        unint64_t v14 = *(void *)(v54 + 8 * v7);
        if (!v14)
        {
          int64_t v7 = v13 + 2;
          if (v13 + 2 >= v55) {
            goto LABEL_61;
          }
          unint64_t v14 = *(void *)(v54 + 8 * v7);
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v55) {
              goto LABEL_61;
            }
            unint64_t v14 = *(void *)(v54 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                int64_t v7 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_66;
                }
                if (v7 >= v55) {
                  goto LABEL_61;
                }
                unint64_t v14 = *(void *)(v54 + 8 * v7);
                ++v15;
                if (v14) {
                  goto LABEL_25;
                }
              }
            }
            int64_t v7 = v15;
          }
        }
      }
LABEL_25:
      uint64_t v57 = (v14 - 1) & v14;
      unint64_t v12 = __clz(__rbit64(v14)) + (v7 << 6);
    }
    int64_t v58 = v7;
    uint64_t v59 = v5;
    uint64_t v16 = (uint64_t *)(*(void *)(v56 + 48) + 16 * v12);
    uint64_t v60 = v16[1];
    uint64_t v61 = *v16;
    uint64_t v17 = *(void *)(*(void *)(v56 + 56) + 8 * v12);
    int64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v62 = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_259DE6428(0, v18, 0);
      char v19 = v62;
      unint64_t v20 = v62[2];
      uint64_t v21 = 32;
      do
      {
        uint64_t v22 = *(void *)(v17 + v21);
        uint64_t v62 = v19;
        unint64_t v23 = v19[3];
        if (v20 >= v23 >> 1)
        {
          sub_259DE6428(v23 > 1, v20 + 1, 1);
          char v19 = v62;
        }
        void v19[2] = v20 + 1;
        v19[v20 + 4] = v22;
        v21 += 16;
        ++v20;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      char v19 = v4;
    }
    uint64_t v24 = sub_259DF7D10();
    uint64_t v25 = v19[2];
    if (v25)
    {
      uint64_t v26 = 0;
      do
      {
        uint64_t v28 = v24 + 56;
        while (1)
        {
          uint64_t v29 = v19[v26++ + 4];
          uint64_t v30 = sub_259DF8140();
          uint64_t v31 = -1 << *(unsigned char *)(v24 + 32);
          unint64_t v32 = v30 & ~v31;
          if (((*(void *)(v28 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0) {
            break;
          }
          uint64_t v33 = *(void *)(v24 + 48);
          if (*(void *)(v33 + 8 * v32) != v29)
          {
            uint64_t v34 = ~v31;
            do
            {
              unint64_t v32 = (v32 + 1) & v34;
              if (((*(void *)(v28 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0) {
                goto LABEL_35;
              }
            }
            while (*(void *)(v33 + 8 * v32) != v29);
          }
          if (v26 == v25) {
            goto LABEL_44;
          }
        }
LABEL_35:
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v62 = (void *)v24;
        sub_259DC7DD4(v29, v32, isUniquelyReferenced_nonNull_native);
        uint64_t v24 = (uint64_t)v62;
        swift_bridgeObjectRelease();
      }
      while (v26 != v25);
    }
LABEL_44:
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void *)(v24 + 16);
    if (v35)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
      uint64_t v36 = (void *)swift_allocObject();
      int64_t v37 = _swift_stdlib_malloc_size(v36);
      uint64_t v38 = v37 - 32;
      if (v37 < 32) {
        uint64_t v38 = v37 - 25;
      }
      v36[2] = v35;
      v36[3] = 2 * (v38 >> 3);
      uint64_t v39 = sub_259DC909C(&v62, v36 + 4, v35, v24);
      swift_bridgeObjectRetain();
      sub_259DCA2BC();
      if (v39 != (void *)v35) {
        goto LABEL_63;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = v4;
    }
    char v40 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v62 = v59;
    unint64_t v42 = sub_259DC840C(v61, v60);
    uint64_t v43 = v59[2];
    BOOL v44 = (v41 & 1) == 0;
    uint64_t v45 = v43 + v44;
    if (__OFADD__(v43, v44))
    {
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    char v46 = v41;
    if (v59[3] < v45) {
      break;
    }
    if (v40)
    {
      uint64_t v5 = v62;
      if (v41) {
        goto LABEL_8;
      }
    }
    else
    {
      sub_259DE3E0C();
      uint64_t v5 = v62;
      if (v46)
      {
LABEL_8:
        uint64_t v11 = v5[7];
        swift_bridgeObjectRelease();
        *(void *)(v11 + 8 * v42) = v36;
        goto LABEL_9;
      }
    }
LABEL_57:
    v5[(v42 >> 6) + 8] |= 1 << v42;
    uint64_t v49 = (uint64_t *)(v5[6] + 16 * v42);
    *uint64_t v49 = v61;
    v49[1] = v60;
    *(void *)(v5[7] + 8 * v42) = v36;
    uint64_t v50 = v5[2];
    BOOL v51 = __OFADD__(v50, 1);
    uint64_t v52 = v50 + 1;
    if (v51) {
      goto LABEL_64;
    }
    v5[2] = v52;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v10 = v57;
    int64_t v7 = v58;
  }
  sub_259DE3460(v45, v40);
  unint64_t v47 = sub_259DC840C(v61, v60);
  if ((v46 & 1) == (v48 & 1))
  {
    unint64_t v42 = v47;
    uint64_t v5 = v62;
    if (v46) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
  uint64_t result = sub_259DF8130();
  __break(1u);
  return result;
}

uint64_t sub_259DC5660(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_259DC5678(uint64_t *a1))(void *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_259DC4FF4();
  return sub_259DC56C0;
}

uint64_t sub_259DC56C0(void *a1, uint64_t a2)
{
  return sub_259DC56CC(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement);
}

uint64_t sub_259DC56CC(void *a1, uint64_t a2, void *a3)
{
  *(void *)(a1[1] + *a3) = *a1;
  return swift_bridgeObjectRelease();
}

uint64_t static PlanksReader.readFilesize(_:)()
{
  uint64_t v0 = sub_259DF7A90();
  if (v1)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    swift_allocError();
    *os_log_type_t v2 = v0;
  }
  return v0;
}

uint64_t static PlanksReader.validateMagic(_:)(uint64_t a1)
{
  uint64_t v2 = sub_259DC9338(a1, 1);
  if (qword_26A3F3148 != -1) {
    swift_once();
  }
  BOOL v3 = sub_259DC3E30(v2, (uint64_t)off_26A3F35E8);
  swift_bridgeObjectRelease();
  if (!v3)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_259DF7A50();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A3F63A0);
    uint64_t v6 = sub_259DF7A30();
    os_log_type_t v7 = sub_259DF7DA0();
    if (!os_log_type_enabled(v6, v7)) {
      goto LABEL_10;
    }
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    uint64_t v9 = "Invalid file magic begin.";
    goto LABEL_9;
  }
  uint64_t v4 = sub_259DC9338(a1, 0);
  BOOL v11 = sub_259DC3E30(v4, (uint64_t)off_26A3F35E8);
  swift_bridgeObjectRelease();
  if (!v11)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_259DF7A50();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A3F63A0);
    uint64_t v6 = sub_259DF7A30();
    os_log_type_t v7 = sub_259DF7DA0();
    if (!os_log_type_enabled(v6, v7)) {
      goto LABEL_10;
    }
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    uint64_t v9 = "Invalid file magic end.";
LABEL_9:
    _os_log_impl(&dword_259DBD000, v6, v7, v9, v8, 2u);
    MEMORY[0x25A2EC590](v8, -1, -1);
LABEL_10:

    return 0;
  }
  return 1;
}

uint64_t sub_259DC5998(uint64_t __src, uint64_t a2)
{
  if (__src)
  {
    if (a2)
    {
      if (a2 <= 14)
      {
        return sub_259DC985C((unsigned char *)__src, (unsigned char *)(__src + a2));
      }
      else
      {
        sub_259DF7780();
        swift_allocObject();
        sub_259DF7740();
        if ((unint64_t)a2 >= 0x7FFFFFFF)
        {
          sub_259DF7790();
          __src = swift_allocObject();
          *(void *)(__src + 16) = 0;
          *(void *)(__src + 24) = a2;
        }
        else
        {
          return a2 << 32;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return __src;
}

uint64_t sub_259DC5A58()
{
  uint64_t v0 = sub_259DF7AA0();
  if ((v0 & 0x100000000) != 0)
  {
    int v1 = v0;
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    uint64_t v2 = (void *)swift_allocError();
    *BOOL v3 = v1;
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_259DF7A50();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A3F63A0);
    MEMORY[0x25A2EC420](v2);
    MEMORY[0x25A2EC420](v2);
    uint64_t v5 = sub_259DF7A30();
    os_log_type_t v6 = sub_259DF7DA0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v14 = v9;
      *(_DWORD *)uint64_t v7 = 136315394;
      swift_beginAccess();
      sub_259DF7AE0();
      sub_259DC9708();
      uint64_t v10 = sub_259DF80A0();
      sub_259DC6D7C(v10, v11, &v14);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2112;
      MEMORY[0x25A2EC420](v2);
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      sub_259DF7DE0();
      *uint64_t v8 = v13;

      _os_log_impl(&dword_259DBD000, v5, v6, "Failed at closing PlanksReader(%s): %@", (uint8_t *)v7, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3218);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v8, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v9, -1, -1);
      MEMORY[0x25A2EC590](v7, -1, -1);
    }
    else
    {
    }
  }
  return swift_release();
}

uint64_t sub_259DC5D38(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_259DC4BA8();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_259DC840C(a1, a2), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_259DC1A14(v7);
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_259DC99B8(v8);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v9 + 16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

uint64_t sub_259DC5E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC4FF4();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    return v13;
  }
  uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 + 16);
  if (!v11)
  {
    uint64_t v13 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  uint64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = v14 + 32;
  while (1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)(v9 + 8 * v12 + 32);
    if ((v18 & 0x8000000000000000) == 0 && v18 < v15) {
      uint64_t v17 = *(void *)(v16 + 40 * v18 + 32);
    }
    BOOL v19 = __OFADD__(v13, v17);
    v13 += v17;
    if (v19) {
      break;
    }
    if (v11 == ++v12) {
      goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_259DC5F20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC4FF4();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v10 = sub_259DC9A2C(v9, v3);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v13 = v10;
  swift_bridgeObjectRetain();
  sub_259DC8568((uint64_t *)&v13);
  swift_bridgeObjectRelease();
  if (!v13[2])
  {
    swift_release();
    return 0;
  }
  uint64_t v11 = v13[4];
  swift_release();
  return v11;
}

void *sub_259DC6044()
{
  swift_retain();
  sub_259DF7F00();
  swift_release();
  sub_259DF7FB0();
  if (*((void *)&v10 + 1))
  {
    uint64_t v0 = (void *)MEMORY[0x263F8EE78];
    do
    {
      long long v5 = v8;
      long long v6 = v9;
      long long v7 = v10;
      if (*((void *)&v8 + 1))
      {
        sub_259DF7B60();
        sub_259DF7B60();
        __swift_project_boxed_opaque_existential_0(&v6, *((uint64_t *)&v7 + 1));
        sub_259DF80D0();
        sub_259DCA1A4((uint64_t)&v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_259DCF318(0, v0[2] + 1, 1, v0);
        }
        unint64_t v2 = v0[2];
        unint64_t v1 = v0[3];
        if (v2 >= v1 >> 1) {
          uint64_t v0 = sub_259DCF318((void *)(v1 > 1), v2 + 1, 1, v0);
        }
        v0[2] = v2 + 1;
        uint64_t v3 = &v0[2 * v2];
        v3[4] = 0;
        v3[5] = 0xE000000000000000;
      }
      else
      {
        sub_259DCA1A4((uint64_t)&v5);
      }
      sub_259DF7FB0();
    }
    while (*((void *)&v10 + 1));
  }
  else
  {
    uint64_t v0 = (void *)MEMORY[0x263F8EE78];
  }
  swift_release();
  return v0;
}

uint64_t sub_259DC61D0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_259DC4BA8();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_259DC840C(a1, a2), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)(v7 + 16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_259DC626C(uint64_t a1, uint64_t a2)
{
  return sub_259DC629C(a1, a2, sub_259DC9B54);
}

uint64_t sub_259DC6284(uint64_t a1, uint64_t a2)
{
  return sub_259DC629C(a1, a2, sub_259DC9BA8);
}

uint64_t sub_259DC629C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC4BA8();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 2;
  }
  uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_259DC9244(v9, a3);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v10 + 16);
  if (!v12) {
    goto LABEL_6;
  }
  if (*(unsigned char *)(v10 + 32) != 1)
  {
    uint64_t v13 = 0;
    goto LABEL_16;
  }
  if (v12 == 1)
  {
LABEL_6:
    uint64_t v13 = 1;
LABEL_16:
    swift_bridgeObjectRelease();
    return v13;
  }
  uint64_t v14 = 33;
  while (1)
  {
    uint64_t v15 = v14 - 31;
    if (__OFADD__(v14 - 32, 1)) {
      break;
    }
    uint64_t v13 = *(unsigned __int8 *)(v10 + v14++);
    if (v13 != 1 || v15 == v12) {
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_259DC63C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = 0;
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = *(void *)(a3 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
    if (*(void *)(v4 + 16) > a1)
    {
      char v3 = 0;
      if ((a2 & 0x8000000000000000) == 0)
      {
        uint64_t v5 = *(void *)(v4 + 40 * a1 + 40);
        if (*(void *)(v5 + 16) > a2)
        {
          int v6 = *(unsigned __int8 *)(v5 + (a2 << 6) + 65);
          if (v6 == 2)
          {
            char v3 = 0;
          }
          else if (v6)
          {
            char v7 = sub_259DF80E0();
            swift_bridgeObjectRelease();
            char v3 = v7 ^ 1;
          }
          else
          {
            swift_bridgeObjectRelease();
            char v3 = 0;
          }
        }
      }
    }
  }
  return v3 & 1;
}

uint64_t sub_259DC64B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
    uint64_t v10 = *(void *)(v9 + 8);
    char v11 = *(unsigned char *)(v9 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v10)
    {
      char v11 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    char v11 = 12;
  }
  uint64_t result = swift_bridgeObjectRelease();
LABEL_7:
  *a3 = v11;
  return result;
}

uint64_t sub_259DC6564()
{
  uint64_t v1 = sub_259DF81A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[3] = &type metadata for ColumnChunk;
  uint64_t v5 = (_OWORD *)swift_allocObject();
  v10[0] = v5;
  long long v6 = v0[1];
  v5[1] = *v0;
  v5[2] = v6;
  v5[3] = v0[2];
  *(_OWORD *)((char *)v5 + 58) = *(_OWORD *)((char *)v0 + 42);
  sub_259DCA11C((uint64_t)v0);
  sub_259DF8180();
  sub_259DF8190();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  unint64_t v7 = sub_259DC6044();
  swift_release();
  strcpy((char *)v10, "ColumnChunk(");
  BYTE5(v10[1]) = 0;
  HIWORD(v10[1]) = -5120;
  uint64_t v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3248);
  sub_259DCA148();
  sub_259DF7B30();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  return v10[0];
}

uint64_t sub_259DC671C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_259DF81A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[3] = &type metadata for FileMetadata;
  uint64_t v12 = (void *)swift_allocObject();
  v16[0] = v12;
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = a3;
  v12[5] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_259DF8180();
  sub_259DF8190();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v13 = sub_259DC6044();
  swift_release();
  strcpy((char *)v16, "FileMetadata(");
  HIWORD(v16[1]) = -4864;
  uint64_t v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3248);
  sub_259DCA148();
  sub_259DF7B30();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  return v16[0];
}

uint64_t sub_259DC68F8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = sub_259DF81A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[3] = &type metadata for SchemaElement;
  uint64_t v12 = swift_allocObject();
  v16[0] = v12;
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  *(unsigned char *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  swift_bridgeObjectRetain();
  sub_259DF8180();
  sub_259DF8190();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v13 = sub_259DC6044();
  swift_release();
  strcpy((char *)v16, "SchemaElement(");
  HIBYTE(v16[1]) = -18;
  uint64_t v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3248);
  sub_259DCA148();
  sub_259DF7B30();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  return v16[0];
}

uint64_t sub_259DC6AC8()
{
  uint64_t v1 = sub_259DF81A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &type metadata for RowGroup;
  uint64_t v5 = swift_allocObject();
  uint64_t v10 = v5;
  long long v6 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 48) = *(void *)(v0 + 32);
  sub_259DCA11C(v0);
  sub_259DF8180();
  sub_259DF8190();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  unint64_t v7 = sub_259DC6044();
  swift_release();
  uint64_t v10 = 0x70756F7247776F52;
  unint64_t v11 = 0xE900000000000028;
  uint64_t v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3248);
  sub_259DCA148();
  sub_259DF7B30();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  swift_bridgeObjectRelease();
  sub_259DF7B60();
  return v10;
}

uint64_t sub_259DC6C74@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = sub_259DF7A60();
  int v3 = result;
  if ((result & 0x100000000) != 0)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    uint64_t result = swift_allocError();
    *uint64_t v4 = v3;
  }
  else
  {
    *a1 = result;
  }
  return result;
}

uint64_t sub_259DC6CFC@<X0>(_DWORD *a1@<X8>)
{
  return sub_259DC6C74(a1);
}

uint64_t type metadata accessor for PlanksReader()
{
  uint64_t result = qword_26A3F3238;
  if (!qword_26A3F3238) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259DC6D7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_259DC6EA4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_259DCA36C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_259DCA36C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_259DC6E50()
{
  unint64_t result = qword_26A3F3220;
  if (!qword_26A3F3220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3220);
  }
  return result;
}

uint64_t sub_259DC6EA4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_259DF7DF0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_259DC7060(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_259DF7EB0();
  if (!v8)
  {
    sub_259DF7F40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_259DF7FA0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_259DC7060(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_259DC70F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_259DC72D8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_259DC72D8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_259DC70F8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_259DC7270(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_259DF7E90();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_259DF7F40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_259DF7B70();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_259DF7FA0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_259DF7F40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_259DC7270(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3278);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_259DC72D8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3278);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DC7428(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_259DF8150();
  swift_bridgeObjectRetain();
  sub_259DF7B50();
  uint64_t v8 = sub_259DF8170();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_259DF80E0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_259DF80E0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_259DC7C38(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_259DC75D8(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_259DF8140();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_259DC7DD4(a2, v9, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_259DC76D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3270);
  uint64_t v3 = sub_259DF7E60();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_259DF8150();
      sub_259DF7B50();
      uint64_t result = sub_259DF8170();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_259DC79B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3268);
  uint64_t result = sub_259DF7E60();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    BOOL v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = sub_259DF8140();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_259DC7C38(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  int64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_259DC76D4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_259DDCCC4();
      goto LABEL_22;
    }
    sub_259DC7EF8();
  }
  uint64_t v11 = *v4;
  sub_259DF8150();
  sub_259DF7B50();
  uint64_t result = sub_259DF8170();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_259DF80E0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_259DF8120();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_259DF80E0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_259DC7DD4(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_259DC79B4();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_259DDCE78();
      goto LABEL_14;
    }
    sub_259DC81A8();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_259DF8140();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_259DF8120();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_259DC7EF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3270);
  uint64_t v3 = sub_259DF7E60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_259DF8150();
    swift_bridgeObjectRetain();
    sub_259DF7B50();
    uint64_t result = sub_259DF8170();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_259DC81A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3268);
  uint64_t result = sub_259DF7E60();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = sub_259DF8140();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_259DC840C(uint64_t a1, uint64_t a2)
{
  sub_259DF8150();
  sub_259DF7B50();
  uint64_t v4 = sub_259DF8170();
  return sub_259DC8484(a1, a2, v4);
}

unint64_t sub_259DC8484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_259DF80E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_259DF80E0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_259DC8568(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_259DC9230(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_259DC85D4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_259DC85D4(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_259DF8090();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v81 = *(void *)(v79 + 8 * i);
        uint64_t v82 = v78;
        do
        {
          uint64_t v83 = *(void *)(v79 + v82);
          if (v81 >= v83) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(void *)(v79 + v82 + 8) = v83;
          *(void *)(v79 + v82) = v81;
          v82 -= 8;
        }
        while (v82 != -8);
        v78 += 8;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v95 = result;
  uint64_t v96 = v3;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      BOOL v11 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      uint64_t v94 = v8;
      if (v12 >= 2)
      {
        uint64_t v84 = *v2;
        do
        {
          unint64_t v85 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_132;
          }
          if (!v84) {
            goto LABEL_145;
          }
          os_log_type_t v86 = v11;
          BOOL v87 = v11 + 32;
          uint64_t v88 = *(void *)&v11[16 * v85 + 32];
          uint64_t v89 = *(void *)&v11[16 * v12 + 24];
          sub_259DC8C60((char *)(v84 + 8 * v88), (char *)(v84 + 8 * *(void *)&v87[16 * v12 - 16]), v84 + 8 * v89, __dst);
          if (v1) {
            break;
          }
          if (v89 < v88) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            os_log_type_t v86 = sub_259DC9088((uint64_t)v86);
          }
          if (v85 >= *((void *)v86 + 2)) {
            goto LABEL_134;
          }
          v90 = &v86[16 * v85 + 32];
          *(void *)v90 = v88;
          *((void *)v90 + 1) = v89;
          unint64_t v91 = *((void *)v86 + 2);
          if (v12 > v91) {
            goto LABEL_135;
          }
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          BOOL v11 = v86;
          *((void *)v86 + 2) = v91 - 1;
          unint64_t v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v94 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v94 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_259DF7C60();
    *(void *)(v7 + 16) = v6;
    uint64_t v3 = v96;
    uint64_t v94 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *v2;
  v92 = v2;
  uint64_t v93 = *v2 - 8;
  BOOL v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v97 = *v2;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 < v3)
    {
      uint64_t v14 = *(void *)(v10 + 8 * v9);
      uint64_t v15 = *(void *)(v10 + 8 * v13);
      uint64_t v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        uint64_t v16 = v14;
        while (1)
        {
          uint64_t v17 = *(void *)(v10 + 8 * v9);
          if (v14 < v15 == v17 >= v16) {
            break;
          }
          ++v9;
          uint64_t v16 = v17;
          if (v3 == v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13) {
          goto LABEL_138;
        }
        if (v13 < v9)
        {
          uint64_t v18 = v9 - 1;
          uint64_t v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10) {
                goto LABEL_144;
              }
              uint64_t v20 = *(void *)(v10 + 8 * v19);
              *(void *)(v10 + 8 * v19) = *(void *)(v10 + 8 * v18);
              *(void *)(v10 + 8 * v18) = v20;
            }
            BOOL v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_47;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_136;
    }
    if (v9 - v13 >= v95) {
      goto LABEL_47;
    }
    uint64_t v21 = v13 + v95;
    if (__OFADD__(v13, v95)) {
      goto LABEL_139;
    }
    if (v21 >= v3) {
      uint64_t v21 = v3;
    }
    if (v21 < v13) {
      break;
    }
    if (v9 != v21)
    {
      char v22 = (uint64_t *)(v93 + 8 * v9);
      do
      {
        uint64_t v23 = *(void *)(v10 + 8 * v9);
        uint64_t v24 = v13;
        uint64_t v25 = v22;
        do
        {
          uint64_t v26 = *v25;
          if (v23 >= *v25) {
            break;
          }
          if (!v10) {
            goto LABEL_142;
          }
          *uint64_t v25 = v23;
          v25[1] = v26;
          --v25;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      uint64_t v9 = v21;
    }
LABEL_47:
    if (v9 < v13) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v11 = sub_259DC8ED0(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v28 = *((void *)v11 + 2);
    unint64_t v27 = *((void *)v11 + 3);
    unint64_t v12 = v28 + 1;
    uint64_t v10 = v97;
    if (v28 >= v27 >> 1)
    {
      uint64_t v77 = sub_259DC8ED0((char *)(v27 > 1), v28 + 1, 1, v11);
      uint64_t v10 = v97;
      BOOL v11 = v77;
    }
    *((void *)v11 + 2) = v12;
    int64_t v29 = v11 + 32;
    uint64_t v30 = &v11[16 * v28 + 32];
    *(void *)uint64_t v30 = v13;
    *((void *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        unint64_t v31 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v36 = &v29[16 * v12];
          uint64_t v37 = *((void *)v36 - 8);
          uint64_t v38 = *((void *)v36 - 7);
          BOOL v42 = __OFSUB__(v38, v37);
          uint64_t v39 = v38 - v37;
          if (v42) {
            goto LABEL_120;
          }
          uint64_t v41 = *((void *)v36 - 6);
          uint64_t v40 = *((void *)v36 - 5);
          BOOL v42 = __OFSUB__(v40, v41);
          uint64_t v34 = v40 - v41;
          char v35 = v42;
          if (v42) {
            goto LABEL_121;
          }
          unint64_t v43 = v12 - 2;
          BOOL v44 = &v29[16 * v12 - 32];
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *((void *)v44 + 1);
          BOOL v42 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          if (v42) {
            goto LABEL_123;
          }
          BOOL v42 = __OFADD__(v34, v47);
          uint64_t v48 = v34 + v47;
          if (v42) {
            goto LABEL_126;
          }
          if (v48 >= v39)
          {
            uint64_t v66 = &v29[16 * v31];
            uint64_t v68 = *(void *)v66;
            uint64_t v67 = *((void *)v66 + 1);
            BOOL v42 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v42) {
              goto LABEL_130;
            }
            BOOL v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v60 = *((void *)v11 + 4);
            uint64_t v61 = *((void *)v11 + 5);
            BOOL v42 = __OFSUB__(v61, v60);
            uint64_t v53 = v61 - v60;
            char v54 = v42;
            goto LABEL_78;
          }
          uint64_t v33 = *((void *)v11 + 4);
          uint64_t v32 = *((void *)v11 + 5);
          BOOL v42 = __OFSUB__(v32, v33);
          uint64_t v34 = v32 - v33;
          char v35 = v42;
        }
        if (v35) {
          goto LABEL_122;
        }
        unint64_t v43 = v12 - 2;
        uint64_t v49 = &v29[16 * v12 - 32];
        uint64_t v51 = *(void *)v49;
        uint64_t v50 = *((void *)v49 + 1);
        BOOL v52 = __OFSUB__(v50, v51);
        uint64_t v53 = v50 - v51;
        char v54 = v52;
        if (v52) {
          goto LABEL_125;
        }
        int64_t v55 = &v29[16 * v31];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v42 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        if (v42) {
          goto LABEL_128;
        }
        if (__OFADD__(v53, v58)) {
          goto LABEL_129;
        }
        if (v53 + v58 >= v34)
        {
          BOOL v59 = v34 < v58;
LABEL_84:
          if (v59) {
            unint64_t v31 = v43;
          }
          goto LABEL_86;
        }
LABEL_78:
        if (v54) {
          goto LABEL_124;
        }
        uint64_t v62 = &v29[16 * v31];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v42 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v42) {
          goto LABEL_127;
        }
        if (v65 < v53) {
          goto LABEL_15;
        }
LABEL_86:
        unint64_t v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v10) {
          goto LABEL_143;
        }
        uint64_t v71 = &v29[16 * v70];
        uint64_t v72 = *(void *)v71;
        unint64_t v73 = v29;
        unsigned int v74 = &v29[16 * v31];
        uint64_t v75 = *((void *)v74 + 1);
        sub_259DC8C60((char *)(v10 + 8 * *(void *)v71), (char *)(v10 + 8 * *(void *)v74), v10 + 8 * v75, __dst);
        if (v1) {
          goto LABEL_114;
        }
        if (v75 < v72) {
          goto LABEL_117;
        }
        if (v31 > *((void *)v11 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v71 = v72;
        *(void *)&v73[16 * v70 + 8] = v75;
        unint64_t v76 = *((void *)v11 + 2);
        if (v31 >= v76) {
          goto LABEL_119;
        }
        unint64_t v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        int64_t v29 = v73;
        *((void *)v11 + 2) = v76 - 1;
        uint64_t v10 = v97;
        if (v76 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v96;
    if (v9 >= v96)
    {
      uint64_t v8 = v94;
      uint64_t v2 = v92;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  uint64_t result = sub_259DF7F40();
  __break(1u);
  return result;
}

uint64_t sub_259DC8C60(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v16 = &v4[8 * v13];
      char v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v17 = (char *)(a3 - 8);
        while (1)
        {
          uint64_t v18 = v17 + 8;
          uint64_t v19 = v6 - 8;
          uint64_t v20 = *((void *)v6 - 1);
          if (*((void *)v16 - 1) >= v20)
          {
            char v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *(void *)uint64_t v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *(void *)uint64_t v17 = v20;
            }
            uint64_t v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[8 * v10];
    char v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          uint64_t v23 = v4;
          uint64_t v15 = v6;
        }
        else
        {
          uint64_t v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }
LABEL_42:
    sub_259DC8FCC((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

char *sub_259DC8ED0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3260);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_259DC8FCC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_259DF7FA0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_259DC9088(uint64_t a1)
{
  return sub_259DC8ED0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_259DC909C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_259DC9230(uint64_t a1)
{
  return sub_259DE65D4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_259DC9244(uint64_t a1, uint64_t (*a2)(void, void))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_259DE6448(0, v2, 0);
    uint64_t v3 = v11;
    uint64_t v6 = (void *)(a1 + 40);
    do
    {
      char v7 = a2(*(v6 - 1), *v6);
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_259DE6448(v8 > 1, v9 + 1, 1);
      }
      v6 += 2;
      *(void *)(v11 + 16) = v9 + 1;
      *(unsigned char *)(v11 + v9 + 32) = v7 & 1;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_259DC9338(uint64_t a1, char a2)
{
  if (qword_26A3F3148 != -1) {
    swift_once();
  }
  int64_t v4 = *((void *)off_26A3F35E8 + 2);
  uint64_t v5 = (char *)swift_slowAlloc();
  if (a2)
  {
    int v6 = sub_259DF7A90();
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v6 = sub_259DF7A90();
    if (v8)
    {
LABEL_10:
      int v12 = v6;
      sub_259DC6E50();
      swift_willThrowTypedImpl();
      swift_allocError();
      *int64_t v13 = v12;
      return MEMORY[0x25A2EC590](v5, -1, -1);
    }
  }
  int v6 = sub_259DF7A80();
  if (!v2)
  {
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = sub_259DE4184(v5, v4);
      MEMORY[0x25A2EC590](v5, -1, -1);
      return v10;
    }
    goto LABEL_10;
  }
  return MEMORY[0x25A2EC590](v5, -1, -1);
}

uint64_t sub_259DC94E4()
{
  uint64_t v1 = (unsigned int *)swift_slowAlloc();
  int v2 = sub_259DF7A90();
  if (v3) {
    goto LABEL_10;
  }
  int v2 = sub_259DF7A80();
  if (v0) {
    return MEMORY[0x25A2EC590](v1, -1, -1);
  }
  if (v4)
  {
LABEL_10:
    int v11 = v2;
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    swift_allocError();
    *int v12 = v11;
    return MEMORY[0x25A2EC590](v1, -1, -1);
  }
  uint64_t v5 = *v1;
  if (v5 >> 25)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_259DF7A50();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A3F63A0);
    char v7 = sub_259DF7A30();
    os_log_type_t v8 = sub_259DF7DA0();
    if (os_log_type_enabled(v7, v8))
    {
      char v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)char v9 = 134217984;
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v7, v8, "Invalid metadataSize: %ld", v9, 0xCu);
      MEMORY[0x25A2EC590](v9, -1, -1);
    }

    MEMORY[0x25A2EC590](v1, -1, -1);
    return 0;
  }
  else
  {
    MEMORY[0x25A2EC590](v1, -1, -1);
    return v5;
  }
}

unint64_t sub_259DC9708()
{
  unint64_t result = qword_26A3F3228;
  if (!qword_26A3F3228)
  {
    sub_259DF7AE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3228);
  }
  return result;
}

uint64_t sub_259DC9760(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_259DC97B0()
{
  unint64_t result = qword_26A3F3230;
  if (!qword_26A3F3230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3230);
  }
  return result;
}

uint64_t sub_259DC9804(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_259DC985C(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_259DC9920(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_259DF7D10();
  uint64_t v8 = result;
  if (v2)
  {
    char v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_259DC7428(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_259DC99B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_259DF7D10();
  uint64_t v7 = result;
  if (v2)
  {
    char v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_259DC75D8(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

void *sub_259DC9A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v4 = *(void *)(a2 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v7 = *(void *)(a1 + 8 * v5 + 32);
    if ((v7 & 0x8000000000000000) == 0 && v7 < *(void *)(v4 + 16))
    {
      uint64_t v8 = *(void *)(v4 + 32 + 40 * v7 + 32);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_259DCF208(0, v6[2] + 1, 1, v6);
      }
      unint64_t v10 = v6[2];
      unint64_t v9 = v6[3];
      if (v10 >= v9 >> 1) {
        uint64_t v6 = sub_259DCF208((void *)(v9 > 1), v10 + 1, 1, v6);
      }
      v6[2] = v10 + 1;
      v6[v10 + 4] = v8;
    }
    ++v5;
  }
  while (v2 != v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_259DC9B54(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
    if (*(void *)(v5 + 16) > a1)
    {
      uint64_t result = 0;
      if ((a2 & 0x8000000000000000) == 0)
      {
        uint64_t v6 = *(void *)(v5 + 40 * a1 + 40);
        if (*(void *)(v6 + 16) > a2) {
          return *(unsigned __int8 *)(v6 + (a2 << 6) + 64);
        }
      }
    }
  }
  return result;
}

uint64_t sub_259DC9BA8(uint64_t a1, uint64_t a2)
{
  return sub_259DC63C4(a1, a2, v2);
}

uint64_t sub_259DC9BB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259DC472C();
  *a1 = result;
  return result;
}

uint64_t sub_259DC9BDC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet);
}

uint64_t sub_259DC9BE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259DC487C();
  *a1 = result;
  return result;
}

uint64_t sub_259DC9C14(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName);
}

uint64_t sub_259DC9C20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259DC4BA8();
  *a1 = result;
  return result;
}

uint64_t sub_259DC9C4C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement);
}

uint64_t sub_259DC9C58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259DC4FF4();
  *a1 = result;
  return result;
}

uint64_t sub_259DC9C84(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement);
}

uint64_t keypath_setTm(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)(*a2 + *a5) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DC9CD8()
{
  return type metadata accessor for PlanksReader();
}

uint64_t sub_259DC9CE0()
{
  uint64_t result = sub_259DF7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PlanksReader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlanksReader);
}

uint64_t dispatch thunk of PlanksReader.__allocating_init(filePath:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of PlanksReader.fieldSet.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of PlanksReader.fieldSet.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of PlanksReader.fieldSet.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of PlanksReader.elementByName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of PlanksReader.elementByName.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of PlanksReader.elementByName.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of PlanksReader.chunksByElement.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of PlanksReader.chunksByElement.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of PlanksReader.chunksByElement.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of PlanksReader.groupsByElement.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of PlanksReader.groupsByElement.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of PlanksReader.groupsByElement.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of PlanksReader.close()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of PlanksReader.totalRowGroupsCount(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of PlanksReader.totalRowsCount(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of PlanksReader.batchSizes(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of PlanksReader.batchCount(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of PlanksReader.isEncoded(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of PlanksReader.isCompressed(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of PlanksReader.fieldType(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t sub_259DCA0E4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 74, 7);
}

uint64_t sub_259DCA11C(uint64_t a1)
{
  return a1;
}

unint64_t sub_259DCA148()
{
  unint64_t result = qword_26A3F3250;
  if (!qword_26A3F3250)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F3248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3250);
  }
  return result;
}

uint64_t sub_259DCA1A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_259DCA248()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_259DCA280()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_259DCA2BC()
{
  return swift_release();
}

uint64_t sub_259DCA2C4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_259DCA2D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_259DCA36C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t ScalarType.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_259DF7900();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F582E8]) {
    return 947154537;
  }
  if (v6 == *MEMORY[0x263F582F0]) {
    return 0x3631746E69;
  }
  if (v6 == *MEMORY[0x263F582F8]) {
    return 0x3233746E69;
  }
  if (v6 == *MEMORY[0x263F58300]) {
    return 0x3436746E69;
  }
  if (v6 == *MEMORY[0x263F58308]) {
    return 0x38746E6975;
  }
  if (v6 == *MEMORY[0x263F58310]) {
    return 0x3631746E6975;
  }
  if (v6 == *MEMORY[0x263F58318]) {
    return 0x3233746E6975;
  }
  if (v6 == *MEMORY[0x263F58320]) {
    return 0x3436746E6975;
  }
  if (v6 == *MEMORY[0x263F58328]) {
    return 0x363174616F6C66;
  }
  if (v6 == *MEMORY[0x263F58340]) {
    return 0x363174616F6C6662;
  }
  if (v6 == *MEMORY[0x263F58330]) {
    return 0x323374616F6C66;
  }
  if (v6 == *MEMORY[0x263F58338]) {
    return 0x343674616F6C66;
  }
  if (v6 == *MEMORY[0x263F582E0]) {
    return 1819242338;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0x6E776F6E6B6E75;
}

uint64_t ScalarType.init(fieldType:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_259DF7900();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, **((unsigned int **)&unk_265462EA0 + *a1), v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t FieldType.init(scalarType:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_259DF7900();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(a1, v4);
  if (result == *MEMORY[0x263F582E8])
  {
    char v7 = 0;
  }
  else if (result == *MEMORY[0x263F582F0])
  {
    char v7 = 1;
  }
  else if (result == *MEMORY[0x263F582F8])
  {
    char v7 = 2;
  }
  else if (result == *MEMORY[0x263F58300])
  {
    char v7 = 3;
  }
  else if (result == *MEMORY[0x263F58308])
  {
    char v7 = 4;
  }
  else if (result == *MEMORY[0x263F58310])
  {
    char v7 = 5;
  }
  else if (result == *MEMORY[0x263F58318])
  {
    char v7 = 6;
  }
  else if (result == *MEMORY[0x263F58320])
  {
    char v7 = 7;
  }
  else if (result == *MEMORY[0x263F58328])
  {
    char v7 = 8;
  }
  else if (result == *MEMORY[0x263F58330])
  {
    char v7 = 9;
  }
  else if (result == *MEMORY[0x263F58338])
  {
    char v7 = 10;
  }
  else if (result == *MEMORY[0x263F582E0])
  {
    char v7 = 11;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    char v7 = 12;
  }
  *a2 = v7;
  return result;
}

uint64_t Array<A>.median()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  char v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v15 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = MEMORY[0x25A2EBC70](v11);
  if (v12 < 1)
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    double v16 = *(double *)&a1;
    sub_259DF7CC0();
    swift_getWitnessTable();
    sub_259DF7BD0();
    sub_259DF7CD0();
    if (v12)
    {
      swift_bridgeObjectRelease();
      sub_259DCAC84();
      sub_259DF7B00();
      *(double *)&uint64_t result = v16;
    }
    else
    {
      sub_259DF7CD0();
      swift_bridgeObjectRelease();
      sub_259DF7F50();
      int64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
      v13(v7, a2);
      v13(v10, a2);
      sub_259DCAC84();
      sub_259DF7B00();
      *(double *)&uint64_t result = v16 * 0.5;
    }
  }
  return result;
}

unint64_t sub_259DCAC84()
{
  unint64_t result = qword_26A3F3280;
  if (!qword_26A3F3280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3280);
  }
  return result;
}

uint64_t Array<A>.mean()(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v2 = MEMORY[0x25A2EBC70](v1);
  uint64_t v3 = v2 - 1;
  if (v2 < 1) {
    return 0;
  }
  double v4 = 0.0;
  uint64_t v5 = 1;
  while (1)
  {
    sub_259DF7CD0();
    sub_259DCAC84();
    sub_259DF7B00();
    double v4 = v4 + (v8 - v4) / (double)v5;
    if (!v3) {
      break;
    }
    --v3;
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      return *(void *)&v4;
    }
  }
  return *(void *)&v4;
}

uint64_t Array<A>.stddev()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t v12 = MEMORY[0x25A2EBC70](v9);
  if (v12 < 2)
  {
LABEL_13:
    double v14 = 0.0;
    return *(void *)&v14;
  }
  uint64_t v13 = v12;
  double v14 = COERCE_DOUBLE(Array<A>.mean()(a1));
  if (v15) {
    return *(void *)&v14;
  }
  uint64_t v16 = swift_bridgeObjectRetain();
  if (!MEMORY[0x25A2EBC90](v16, a2))
  {
    swift_bridgeObjectRelease();
    double v18 = 0.0;
LABEL_16:
    double v14 = sqrt(v18 / (double)v13);
    return *(void *)&v14;
  }
  uint64_t v22 = v7;
  uint64_t v23 = v13;
  uint64_t v24 = a3;
  uint64_t v17 = 0;
  double v18 = 0.0;
  while (1)
  {
    char v19 = sub_259DF7C80();
    sub_259DF7C10();
    if (v19)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, a1+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v17, a2);
      uint64_t v20 = v17 + 1;
      if (__OFADD__(v17, 1)) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }
    uint64_t result = sub_259DF7EA0();
    if (v22 != 8) {
      break;
    }
    double v25 = *(double *)&result;
    (*(void (**)(char *, double *, uint64_t))(v6 + 16))(v11, &v25, a2);
    swift_unknownObjectRelease();
    uint64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
LABEL_7:
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v11, a2);
    sub_259DCAC84();
    sub_259DF7B00();
    double v18 = v18 + (v25 - v14) * (v25 - v14);
    ++v17;
    if (v20 == MEMORY[0x25A2EBC90](a1, a2))
    {
      swift_bridgeObjectRelease();
      uint64_t v13 = v23;
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

uint64_t PlanksWriter.writeBatch(_:label:as:)(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4)
{
  v191 = a3;
  v190 = (uint8_t *)a2;
  uint64_t v182 = sub_259DF80C0();
  uint64_t v181 = *(void *)(v182 - 8);
  MEMORY[0x270FA5388](v182);
  v180 = (char *)v171 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v171 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_259DF7900();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v179 = (char *)v171 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v171 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  v192 = (char *)v171 - v18;
  MEMORY[0x270FA5388](v17);
  v186 = (char *)v171 - v19;
  v189 = (void *)sub_259DF7910();
  uint64_t v188 = *(v189 - 1);
  MEMORY[0x270FA5388](v189);
  v187 = (char *)v171 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_259DF7A20();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v184 = (char *)v171 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  unint64_t v27 = (char *)v171 - v26;
  MEMORY[0x270FA5388](v25);
  int64_t v29 = (char *)v171 - v28;
  if (sub_259DF79D0() != 2)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_259DF7A50();
    __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
    uint64_t v33 = v21;
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v29, a1, v21);
    uint64_t v34 = sub_259DF7A30();
    os_log_type_t v35 = sub_259DF7DA0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      v192 = (char *)swift_slowAlloc();
      v196 = v192;
      v191 = v36;
      *(_DWORD *)uint64_t v36 = 136315138;
      v190 = v36 + 4;
      uint64_t v37 = v187;
      sub_259DF79F0();
      sub_259DCFC20(&qword_26A3F3290, MEMORY[0x263F58358]);
      uint64_t v38 = v189;
      uint64_t v39 = sub_259DF80A0();
      unint64_t v41 = v40;
      (*(void (**)(char *, void *))(v188 + 8))(v37, v38);
      v193[0] = sub_259DC6D7C(v39, v41, (uint64_t *)&v196);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v29, v33);
      BOOL v42 = v191;
      _os_log_impl(&dword_259DBD000, v34, v35, "Invalid tensor shape: %s. Only 2D tensors supported.", v191, 0xCu);
      unint64_t v43 = v192;
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v43, -1, -1);
      MEMORY[0x25A2EC590](v42, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v29, v21);
    }

    return 0;
  }
  uint64_t v185 = v22;
  v176 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v176(v27, a1, v21);
  sub_259DCF87C(a4, (uint64_t)v9);
  uint64_t v30 = v11;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_259DCF8E4((uint64_t)v9);
    unint64_t v31 = v191;
  }
  else
  {
    BOOL v44 = v186;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v186, v9, v10);
    uint64_t v45 = v192;
    sub_259DF7970();
    sub_259DCFC20(&qword_26A3F32A8, MEMORY[0x263F58348]);
    char v46 = sub_259DF7B40();
    uint64_t v175 = v30;
    uint64_t v47 = *(void (**)(char *, uint64_t))(v30 + 8);
    v47(v45, v10);
    if (v46)
    {
      v47(v44, v10);
    }
    else
    {
      v174 = v47;
      sub_259DF7970();
      char v48 = sub_259DF78F0();
      v174(v45, v10);
      uint64_t v178 = v21;
      if ((v48 & 1) == 0)
      {
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v66 = sub_259DF7A50();
        __swift_project_value_buffer(v66, (uint64_t)qword_26A3F63A0);
        (*(void (**)(char *, char *, uint64_t))(v175 + 16))(v16, v44, v10);
        uint64_t v67 = sub_259DF7A30();
        os_log_type_t v68 = sub_259DF7DA0();
        int v69 = v68;
        if (os_log_type_enabled(v67, v68))
        {
          uint64_t v70 = v10;
          uint64_t v71 = swift_slowAlloc();
          v191 = (uint8_t *)swift_slowAlloc();
          v193[0] = (uint64_t)v191;
          *(_DWORD *)uint64_t v71 = 136315394;
          LODWORD(v190) = v69;
          uint64_t v72 = ScalarType.description.getter();
          v196 = (char *)sub_259DC6D7C(v72, v73, v193);
          sub_259DF7DE0();
          swift_bridgeObjectRelease();
          unsigned int v74 = v16;
          uint64_t v75 = v174;
          v174(v74, v70);
          *(_WORD *)(v71 + 12) = 2080;
          swift_beginAccess();
          unint64_t v76 = v192;
          sub_259DF7970();
          uint64_t v77 = ScalarType.description.getter();
          unint64_t v79 = v78;
          v75(v76, v70);
          uint64_t v204 = sub_259DC6D7C(v77, v79, v193);
          sub_259DF7DE0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_259DBD000, v67, (os_log_type_t)v190, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v71, 0x16u);
          BOOL v80 = v191;
          swift_arrayDestroy();
          MEMORY[0x25A2EC590](v80, -1, -1);
          MEMORY[0x25A2EC590](v71, -1, -1);

          v75(v186, v70);
        }
        else
        {

          v170 = v174;
          v174(v16, v10);
          v170(v44, v10);
        }
        (*(void (**)(char *, uint64_t))(v185 + 8))(v27, v178);
        return 0;
      }
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_259DF7A50();
      __swift_project_value_buffer(v49, (uint64_t)qword_26A3F63A0);
      uint64_t v50 = v179;
      (*(void (**)(char *, char *, uint64_t))(v175 + 16))(v179, v44, v10);
      uint64_t v51 = sub_259DF7A30();
      os_log_type_t v52 = sub_259DF7D90();
      int v53 = v52;
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v54 = swift_slowAlloc();
        os_log_t v173 = v51;
        uint64_t v55 = v54;
        v171[0] = swift_slowAlloc();
        v196 = (char *)v171[0];
        *(_DWORD *)uint64_t v55 = 136315394;
        v171[1] = v55 + 4;
        swift_beginAccess();
        uint64_t v56 = v192;
        int v172 = v53;
        sub_259DF7970();
        uint64_t v57 = ScalarType.description.getter();
        unint64_t v59 = v58;
        uint64_t v60 = v56;
        uint64_t v61 = v174;
        v174(v60, v10);
        v193[0] = sub_259DC6D7C(v57, v59, (uint64_t *)&v196);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v55 + 12) = 2080;
        uint64_t v62 = ScalarType.description.getter();
        v193[0] = sub_259DC6D7C(v62, v63, (uint64_t *)&v196);
        BOOL v44 = v186;
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        v61(v50, v10);
        os_log_t v64 = v173;
        _os_log_impl(&dword_259DBD000, v173, (os_log_type_t)v172, "Casting tensor of type %s to type %s.", (uint8_t *)v55, 0x16u);
        uint64_t v65 = v171[0];
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v65, -1, -1);
        MEMORY[0x25A2EC590](v55, -1, -1);
      }
      else
      {
        v174(v50, v10);
      }
      swift_beginAccess();
      uint64_t v81 = v181;
      uint64_t v82 = v180;
      uint64_t v83 = v182;
      (*(void (**)(char *, void, uint64_t))(v181 + 104))(v180, *MEMORY[0x263F8E1F8], v182);
      uint64_t v84 = v184;
      sub_259DF79C0();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v83);
      v174(v44, v10);
      swift_beginAccess();
      uint64_t v21 = v178;
      (*(void (**)(char *, char *, uint64_t))(v185 + 40))(v27, v84, v178);
    }
    unint64_t v31 = v191;
    uint64_t v30 = v175;
  }
  swift_beginAccess();
  uint64_t v85 = (uint64_t)v192;
  sub_259DF7970();
  FieldType.init(scalarType:)(v85, (char *)&v196);
  if (v196 == 12)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v86 = sub_259DF7A50();
    __swift_project_value_buffer(v86, (uint64_t)qword_26A3F63A0);
    BOOL v87 = sub_259DF7A30();
    os_log_type_t v88 = sub_259DF7DA0();
    if (os_log_type_enabled(v87, v88))
    {
      uint64_t v89 = v10;
      v90 = (uint8_t *)swift_slowAlloc();
      uint64_t v91 = v30;
      uint64_t v92 = swift_slowAlloc();
      v196 = (char *)v92;
      uint64_t v178 = v21;
      *(_DWORD *)v90 = 136315138;
      v177 = v27;
      v191 = v90 + 4;
      uint64_t v93 = v192;
      sub_259DF7970();
      uint64_t v94 = ScalarType.description.getter();
      unint64_t v96 = v95;
      (*(void (**)(char *, uint64_t))(v91 + 8))(v93, v89);
      v193[0] = sub_259DC6D7C(v94, v96, (uint64_t *)&v196);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v87, v88, "Invalid FieldType for tensor: %s", v90, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v92, -1, -1);
      MEMORY[0x25A2EC590](v90, -1, -1);

      (*(void (**)(char *, uint64_t))(v185 + 8))(v177, v178);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v185 + 8))(v27, v21);
    }
    return 0;
  }
  LODWORD(v192) = v196;
  uint64_t v97 = v187;
  sub_259DF79F0();
  v186 = (char *)sub_259DF7930();
  uint64_t v98 = *(void (**)(char *, void *))(v188 + 8);
  uint64_t v99 = v189;
  v98(v97, v189);
  sub_259DF79F0();
  uint64_t v188 = sub_259DF7930();
  v98(v97, v99);
  swift_bridgeObjectRetain();
  uint64_t v100 = v183;
  uint64_t v101 = sub_259DE1F58();
  uint64_t v102 = *(void *)(v101 + 16);
  v177 = v27;
  if (v102)
  {
    swift_bridgeObjectRetain();
    uint64_t v103 = (uint64_t)v190;
    unint64_t v104 = sub_259DC840C((uint64_t)v190, (uint64_t)v31);
    uint64_t v105 = v185;
    if (v106)
    {
      uint64_t v178 = v21;
      uint64_t v107 = *(void *)(v101 + 56) + 32 * v104;
      uint64_t v109 = *(void *)v107;
      uint64_t v108 = *(void *)(v107 + 8);
      char v110 = *(unsigned char *)(v107 + 16);
      uint64_t v111 = *(void *)(v107 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v196 = (char *)v109;
      uint64_t v197 = v108;
      LOBYTE(v198) = v110;
      uint64_t v199 = v111;
      v193[0] = v103;
      v193[1] = (uint64_t)v31;
      char v194 = (char)v192;
      uint64_t v195 = v188;
      if (!_s6Planks13SchemaElementV2eeoiySbAC_ACtFZ_0(&v196, v193))
      {
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v155 = sub_259DF7A50();
        __swift_project_value_buffer(v155, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v156 = sub_259DF7A30();
        os_log_type_t v157 = sub_259DF7DA0();
        int v158 = v157;
        BOOL v159 = os_log_type_enabled(v156, v157);
        uint64_t v160 = (uint64_t)v190;
        if (v159)
        {
          uint64_t v161 = swift_slowAlloc();
          LODWORD(v191) = v158;
          uint64_t v162 = v161;
          v189 = (void *)swift_slowAlloc();
          v196 = (char *)v189;
          *(_DWORD *)uint64_t v162 = 136315650;
          swift_bridgeObjectRetain();
          v193[0] = sub_259DC6D7C(v160, (unint64_t)v31, (uint64_t *)&v196);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v162 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v163 = sub_259DC68F8(v109, v108, v110, v111);
          unint64_t v165 = v164;
          swift_bridgeObjectRelease();
          v193[0] = sub_259DC6D7C(v163, v165, (uint64_t *)&v196);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v162 + 22) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v166 = sub_259DC68F8((uint64_t)v190, (uint64_t)v31, (char)v192, v188);
          unint64_t v168 = v167;
          swift_bridgeObjectRelease();
          v193[0] = sub_259DC6D7C(v166, v168, (uint64_t *)&v196);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_259DBD000, v156, (os_log_type_t)v191, "Invalid batch label: %s with existing schema: %s vs %s", (uint8_t *)v162, 0x20u);
          v169 = v189;
          swift_arrayDestroy();
          MEMORY[0x25A2EC590](v169, -1, -1);
          MEMORY[0x25A2EC590](v162, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, uint64_t))(v105 + 8))(v177, v178);
        return 0;
      }
      swift_bridgeObjectRelease();
      uint64_t v21 = v178;
      unint64_t v27 = v177;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v105 = v185;
  }
  unint64_t v112 = v184;
  uint64_t v113 = ((uint64_t (*)(char *, char *, uint64_t))v176)(v184, v27, v21);
  MEMORY[0x270FA5388](v113);
  uint64_t v114 = (uint64_t)v190;
  v171[-4] = v100;
  v171[-3] = v114;
  v171[-2] = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3298);
  sub_259DF79A0();
  uint64_t v117 = *(void **)(v105 + 8);
  uint64_t v116 = v105 + 8;
  uint64_t v115 = v117;
  ((void (*)(char *, uint64_t))v117)(v112, v21);
  uint64_t v118 = v197;
  if (!v197)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v144 = sub_259DF7A50();
    __swift_project_value_buffer(v144, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    v145 = sub_259DF7A30();
    os_log_type_t v146 = sub_259DF7DA0();
    if (os_log_type_enabled(v145, v146))
    {
      v189 = v115;
      v147 = (uint8_t *)swift_slowAlloc();
      uint64_t v148 = swift_slowAlloc();
      v196 = (char *)v148;
      *(_DWORD *)v147 = 136315138;
      swift_bridgeObjectRetain();
      v193[0] = sub_259DC6D7C(v114, (unint64_t)v31, (uint64_t *)&v196);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v145, v146, "Failed at writing batch: %s", v147, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v148, -1, -1);
      MEMORY[0x25A2EC590](v147, -1, -1);

      ((void (*)(char *, uint64_t))v189)(v177, v21);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v115)(v177, v21);
    }
    return 0;
  }
  v187 = 0;
  v189 = v115;
  uint64_t v178 = v21;
  uint64_t v185 = v116;
  __int16 v119 = v203;
  uint64_t v121 = v201;
  uint64_t v120 = v202;
  uint64_t v122 = v199;
  char v123 = v200;
  uint64_t v124 = v198;
  uint64_t v125 = (uint64_t)v196;
  unint64_t v126 = v200 >> 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32A0);
  uint64_t v127 = swift_allocObject();
  uint64_t v128 = v100;
  uint64_t v129 = v127;
  *(_OWORD *)(v127 + 16) = xmmword_259DF86A0;
  *(void *)(v127 + 32) = v125;
  *(void *)(v127 + 40) = v118;
  *(void *)(v127 + 48) = v124;
  *(void *)(v127 + 56) = v122;
  *(unsigned char *)(v127 + 64) = v123 & 1;
  *(unsigned char *)(v127 + 65) = v126;
  *(void *)(v127 + 72) = v121;
  *(void *)(v127 + 80) = v120;
  *(_WORD *)(v127 + 88) = v119;
  uint64_t v130 = v128 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v131 = *(void **)(v130 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v130 + 16) = v131;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v131 = sub_259DCF648(0, v131[2] + 1, 1, v131);
    *(void *)(v130 + 16) = v131;
  }
  unint64_t v134 = v131[2];
  unint64_t v133 = v131[3];
  uint64_t v135 = v178;
  v136 = v191;
  uint64_t v137 = (uint64_t)v190;
  if (v134 >= v133 >> 1)
  {
    v131 = sub_259DCF648((void *)(v133 > 1), v134 + 1, 1, v131);
    *(void *)(v130 + 16) = v131;
  }
  v131[2] = v134 + 1;
  v138 = &v131[5 * v134];
  *((unsigned char *)v138 + 32) = 1;
  v138[5] = v129;
  v138[6] = v124;
  v139 = v186;
  v138[7] = v122;
  v138[8] = v139;
  swift_endAccess();
  uint64_t v140 = *(void *)(v130 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v141 = (void *)sub_259DC193C(v140);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  char v142 = sub_259DC1560(v137, (uint64_t)v136, v141);
  swift_bridgeObjectRelease();
  if (v142)
  {
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v189)(v177, v135);
    return 1;
  }
  else
  {
    swift_beginAccess();
    v149 = *(void **)(v130 + 8);
    char v150 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v130 + 8) = v149;
    v151 = (void (*)(char *, uint64_t))v189;
    if ((v150 & 1) == 0)
    {
      v149 = sub_259DCF538(0, v149[2] + 1, 1, v149);
      *(void *)(v130 + 8) = v149;
    }
    unint64_t v153 = v149[2];
    unint64_t v152 = v149[3];
    if (v153 >= v152 >> 1)
    {
      v149 = sub_259DCF538((void *)(v152 > 1), v153 + 1, 1, v149);
      *(void *)(v130 + 8) = v149;
    }
    v149[2] = v153 + 1;
    v154 = &v149[4 * v153];
    v154[4] = v137;
    v154[5] = v136;
    *((unsigned char *)v154 + 48) = (_BYTE)v192;
    v154[7] = v188;
    swift_endAccess();
    v151(v177, v135);
    return 1;
  }
}

uint64_t PlanksWriter.writeTensor(_:label:as:batchSize:)(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4, int64_t a5)
{
  uint64_t v6 = v5;
  int64_t v148 = a5;
  uint64_t v149 = a4;
  uint64_t v141 = sub_259DF80C0();
  uint64_t v140 = *(void *)(v141 - 8);
  MEMORY[0x270FA5388](v141);
  v139 = (char *)&v132 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_259DF7A50();
  uint64_t v144 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v143 = (char *)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v142 = (char *)&v132 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v155 = (char *)&v132 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v132 - v18;
  uint64_t v20 = sub_259DF7900();
  uint64_t v147 = *(void *)(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v137 = (char *)&v132 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  os_log_t v136 = (os_log_t)((char *)&v132 - v24);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v145 = (char *)&v132 - v26;
  MEMORY[0x270FA5388](v25);
  os_log_type_t v146 = (char *)&v132 - v27;
  unint64_t v152 = (void (**)(void, void))sub_259DF7910();
  uint64_t v151 = (uint64_t)*(v152 - 1);
  MEMORY[0x270FA5388](v152);
  *(void *)&long long v150 = (char *)&v132 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_259DF7A20();
  uint64_t v29 = *(void *)(v159 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v159);
  int v158 = ((char *)&v132 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v138 = (char *)&v132 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (char *)&v132 - v35;
  MEMORY[0x270FA5388](v34);
  uint64_t v38 = (uint64_t)&v132 - v37;
  if (sub_259DF79D0() != 2)
  {
    if (qword_26A3F3140 != -1) {
LABEL_73:
    }
      swift_once();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A3F63A0);
    uint64_t v50 = v159;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v38, a1, v159);
    uint64_t v45 = sub_259DF7A30();
    os_log_type_t v51 = sub_259DF7DA0();
    if (!os_log_type_enabled(v45, v51))
    {
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v38, v50);
      goto LABEL_14;
    }
    os_log_type_t v52 = (uint8_t *)swift_slowAlloc();
    int v158 = swift_slowAlloc();
    unint64_t v164 = v158;
    os_log_type_t v157 = v52;
    *(_DWORD *)os_log_type_t v52 = 136315138;
    v156 = v52 + 4;
    uint64_t v53 = v150;
    sub_259DF79F0();
    sub_259DCFC20(&qword_26A3F3290, MEMORY[0x263F58358]);
    uint64_t v54 = v152;
    uint64_t v55 = sub_259DF80A0();
    unint64_t v57 = v56;
    (*(void (**)(uint64_t, void))(v151 + 8))(v53, v54);
    uint64_t v163 = (char *)sub_259DC6D7C(v55, v57, (uint64_t *)&v164);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v38, v50);
    uint64_t v47 = v157;
    _os_log_impl(&dword_259DBD000, v45, v51, "Invalid tensor shape: %s. Only 2D tensors supported.", v157, 0xCu);
    unint64_t v58 = v158;
    swift_arrayDestroy();
    uint64_t v49 = (uint64_t)v58;
LABEL_10:
    MEMORY[0x25A2EC590](v49, -1, -1);
    MEMORY[0x25A2EC590](v47, -1, -1);
LABEL_14:

    return 0;
  }
  uint64_t v135 = v29;
  uint64_t v154 = v6;
  uint64_t v39 = v6 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v156 = (uint8_t *)a2;
  uint64_t v40 = *(void *)(v39 + 8);
  os_log_type_t v157 = a3;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v41 = (void *)sub_259DC193C(v40);
  swift_bridgeObjectRelease();
  BOOL v42 = v157;
  swift_bridgeObjectRelease();
  uint64_t v43 = (uint64_t)v156;
  swift_bridgeObjectRelease_n();
  char v44 = sub_259DC1560(v43, (uint64_t)v42, v41);
  swift_bridgeObjectRelease();
  if (v44)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v11, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v45 = sub_259DF7A30();
    os_log_type_t v46 = sub_259DF7DA0();
    if (!os_log_type_enabled(v45, v46))
    {

      swift_bridgeObjectRelease_n();
      return 0;
    }
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v163 = (char *)v48;
    *(_DWORD *)uint64_t v47 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v161 = (uint8_t *)sub_259DC6D7C(v43, (unint64_t)v42, (uint64_t *)&v163);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v45, v46, "Invalid tensor label: %s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v49 = v48;
    goto LABEL_10;
  }
  uint64_t v59 = v135;
  (*(void (**)(char *, uint64_t, uint64_t))(v135 + 16))(v36, a1, v159);
  sub_259DCF87C(v149, (uint64_t)v19);
  uint64_t v60 = v147;
  int v61 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v147 + 48))(v19, 1, v20);
  uint64_t v134 = v11;
  unint64_t v153 = v36;
  if (v61 == 1)
  {
    uint64_t v149 = v20;
    sub_259DCF8E4((uint64_t)v19);
  }
  else
  {
    uint64_t v63 = v11;
    os_log_t v64 = v146;
    (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v146, v19, v20);
    uint64_t v65 = v145;
    sub_259DF7970();
    sub_259DCFC20(&qword_26A3F32A8, MEMORY[0x263F58348]);
    char v66 = sub_259DF7B40();
    uint64_t v67 = *(void (**)(char *, uint64_t))(v60 + 8);
    v67(v65, v20);
    if (v66)
    {
      uint64_t v149 = v20;
      v67(v64, v20);
      uint64_t v59 = v135;
    }
    else
    {
      sub_259DF7970();
      char v68 = sub_259DF78F0();
      v67(v65, v20);
      if ((v68 & 1) == 0)
      {
        uint64_t v88 = v144;
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v89 = __swift_project_value_buffer(v63, (uint64_t)qword_26A3F63A0);
        v90 = v142;
        (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v142, v89, v63);
        os_log_t v91 = v136;
        (*(void (**)(os_log_t, char *, uint64_t))(v60 + 16))(v136, v64, v20);
        uint64_t v92 = sub_259DF7A30();
        uint64_t v93 = v20;
        os_log_type_t v94 = sub_259DF7DA0();
        int v158 = v92;
        if (os_log_type_enabled(v92, v94))
        {
          uint64_t v95 = swift_slowAlloc();
          os_log_type_t v157 = (uint8_t *)swift_slowAlloc();
          uint64_t v161 = v157;
          *(_DWORD *)uint64_t v95 = 136315394;
          uint64_t v96 = ScalarType.description.getter();
          uint64_t v163 = (char *)sub_259DC6D7C(v96, v97, (uint64_t *)&v161);
          sub_259DF7DE0();
          swift_bridgeObjectRelease();
          os_log_t v98 = v91;
          uint64_t v99 = v93;
          v67((char *)v98, v93);
          *(_WORD *)(v95 + 12) = 2080;
          uint64_t v100 = v144;
          swift_beginAccess();
          uint64_t v101 = v145;
          sub_259DF7970();
          uint64_t v102 = ScalarType.description.getter();
          unint64_t v104 = v103;
          uint64_t v105 = v101;
          uint64_t v106 = v99;
          v67(v105, v99);
          uint64_t v160 = sub_259DC6D7C(v102, v104, (uint64_t *)&v161);
          sub_259DF7DE0();
          swift_bridgeObjectRelease();
          uint64_t v107 = v158;
          _os_log_impl(&dword_259DBD000, v158, v94, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v95, 0x16u);
          uint64_t v108 = v157;
          swift_arrayDestroy();
          MEMORY[0x25A2EC590](v108, -1, -1);
          MEMORY[0x25A2EC590](v95, -1, -1);

          (*(void (**)(char *, uint64_t))(v100 + 8))(v142, v134);
          v67(v146, v106);
          (*(void (**)(char *, uint64_t))(v135 + 8))(v153, v159);
        }
        else
        {

          v67((char *)v91, v93);
          (*(void (**)(char *, uint64_t))(v144 + 8))(v90, v63);
          v67(v64, v93);
          (*(void (**)(char *, uint64_t))(v135 + 8))(v36, v159);
        }
        return 0;
      }
      uint64_t v69 = v144;
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v70 = __swift_project_value_buffer(v63, (uint64_t)qword_26A3F63A0);
      uint64_t v71 = v143;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v143, v70, v63);
      uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
      unint64_t v73 = v137;
      v72(v137, v64, v20);
      unsigned int v74 = sub_259DF7A30();
      os_log_type_t v75 = sub_259DF7D90();
      LODWORD(v149) = v75;
      BOOL v76 = os_log_type_enabled(v74, v75);
      unint64_t v133 = v67;
      if (v76)
      {
        uint64_t v77 = swift_slowAlloc();
        char v142 = (char *)swift_slowAlloc();
        uint64_t v163 = v142;
        *(_DWORD *)uint64_t v77 = 136315394;
        uint64_t v132 = v77 + 4;
        swift_beginAccess();
        unint64_t v78 = v73;
        unint64_t v79 = v145;
        os_log_t v136 = v74;
        sub_259DF7970();
        uint64_t v80 = ScalarType.description.getter();
        unint64_t v82 = v81;
        v67(v79, v20);
        uint64_t v161 = (uint8_t *)sub_259DC6D7C(v80, v82, (uint64_t *)&v163);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v77 + 12) = 2080;
        uint64_t v83 = ScalarType.description.getter();
        uint64_t v161 = (uint8_t *)sub_259DC6D7C(v83, v84, (uint64_t *)&v163);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        v67(v78, v20);
        os_log_t v85 = v136;
        _os_log_impl(&dword_259DBD000, v136, (os_log_type_t)v149, "Casting tensor of type %s to type %s.", (uint8_t *)v77, 0x16u);
        uint64_t v86 = v142;
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v86, -1, -1);
        uint64_t v87 = v77;
        os_log_t v64 = v146;
        MEMORY[0x25A2EC590](v87, -1, -1);

        (*(void (**)(char *, uint64_t))(v144 + 8))(v143, v63);
      }
      else
      {
        v67(v73, v20);

        (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v63);
      }
      swift_beginAccess();
      uint64_t v109 = v140;
      char v110 = v139;
      uint64_t v111 = v141;
      (*(void (**)(char *, void, uint64_t))(v140 + 104))(v139, *MEMORY[0x263F8E1F8], v141);
      unint64_t v112 = v138;
      sub_259DF79C0();
      (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
      uint64_t v149 = v20;
      v133(v64, v20);
      swift_beginAccess();
      uint64_t v59 = v135;
      (*(void (**)(char *, char *, uint64_t))(v135 + 40))(v36, v112, v159);
    }
  }
  swift_beginAccess();
  uint64_t v29 = v150;
  sub_259DF79F0();
  uint64_t v113 = sub_259DF7930();
  uint64_t v114 = *(void (**)(uint64_t, void))(v151 + 8);
  uint64_t v115 = v152;
  v114(v29, v152);
  sub_259DF79F0();
  a1 = v29;
  uint64_t v38 = sub_259DF7930();
  v114(v29, v115);
  if (v113 >= v148) {
    uint64_t v116 = v148;
  }
  else {
    uint64_t v116 = v113;
  }
  if (v116)
  {
    LODWORD(v151) = 0;
    uint64_t v115 = 0;
    int64_t v148 = 0;
    BOOL v117 = 0;
    uint64_t v118 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v147 + 56);
    unint64_t v152 = (void (**)(void, void))(v59 + 8);
    long long v150 = xmmword_259DF86B0;
    __int16 v119 = v158;
    while (1)
    {
      BOOL v120 = v113 >= (uint64_t)v115;
      if (v116 > 0) {
        BOOL v120 = (uint64_t)v115 >= v113;
      }
      if (v120)
      {
        if ((v115 != (void (**)(void, void))v113) | v151 & 1) {
          goto LABEL_64;
        }
        if (v117)
        {
          LODWORD(v151) = 1;
          uint64_t v11 = v113;
          BOOL v117 = 1;
          uint64_t v121 = (uint64_t)v115 + v116;
          if (__OFADD__(v115, v116)) {
            goto LABEL_70;
          }
        }
        else
        {
          if (v148 == 0x8000000000000000) {
            goto LABEL_64;
          }
          BOOL v117 = 0;
          LODWORD(v151) = 1;
          uint64_t v11 = v113;
          uint64_t v121 = (uint64_t)v115 + v116;
          if (__OFADD__(v115, v116))
          {
LABEL_70:
            __break(1u);
LABEL_71:
            __break(1u);
LABEL_72:
            __break(1u);
            goto LABEL_73;
          }
        }
      }
      else
      {
        BOOL v117 = !__OFADD__(v115, v116);
        unint64_t v122 = 0x8000000000000000;
        if (!__OFADD__(v115, v116)) {
          unint64_t v122 = 0;
        }
        int64_t v148 = v122;
        if (__OFADD__(v115, v116)) {
          uint64_t v11 = (((uint64_t)v115 + v116) >> 63) ^ 0x8000000000000000;
        }
        else {
          uint64_t v11 = (uint64_t)v115 + v116;
        }
        uint64_t v121 = (uint64_t)v115 + v116;
        if (__OFADD__(v115, v116)) {
          goto LABEL_70;
        }
      }
      if (v113 >= v121) {
        a1 = v121;
      }
      else {
        a1 = v113;
      }
      if (v115 == (void (**)(void, void))a1)
      {
LABEL_64:
        (*v152)(v153, v159);
        return 1;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3260);
      uint64_t v123 = swift_allocObject();
      *(_OWORD *)(v123 + 16) = v150;
      if (a1 < (uint64_t)v115) {
        goto LABEL_71;
      }
      uint64_t v29 = v123;
      *(void *)(v123 + 32) = v115;
      *(void *)(v123 + 40) = a1;
      if (v38 < 0) {
        goto LABEL_72;
      }
      *(void *)(v123 + 48) = 0;
      *(void *)(v123 + 56) = v38;
      uint64_t v162 = v123;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32B0);
      sub_259DCFC68();
      sub_259DF7A00();
      swift_bridgeObjectRelease();
      uint64_t v29 = (uint64_t)v155;
      (*v118)(v155, 1, 1, v149);
      a1 = PlanksWriter.writeBatch(_:label:as:)((uint64_t)v119, (uint64_t)v156, v157, v29);
      sub_259DCF8E4(v29);
      if ((a1 & 1) == 0) {
        break;
      }
      (*v152)(v119, v159);
      uint64_t v115 = (void (**)(void, void))v11;
    }
    if (qword_26A3F3140 != -1) {
      goto LABEL_75;
    }
  }
  else
  {
    __break(1u);
LABEL_75:
    swift_once();
  }
  __swift_project_value_buffer(v134, (uint64_t)qword_26A3F63A0);
  uint64_t v124 = sub_259DF7A30();
  os_log_type_t v125 = sub_259DF7DA0();
  BOOL v126 = os_log_type_enabled(v124, v125);
  uint64_t v128 = v158;
  uint64_t v127 = v159;
  uint64_t v129 = v153;
  if (v126)
  {
    uint64_t v130 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v130 = 134217984;
    uint64_t v162 = (uint64_t)v115;
    sub_259DF7DE0();
    _os_log_impl(&dword_259DBD000, v124, v125, "Failed at writing batch: %ld", v130, 0xCu);
    MEMORY[0x25A2EC590](v130, -1, -1);
  }

  v131 = (void (*)(char *, uint64_t))*v152;
  (*v152)(v128, v127);
  v131(v129, v127);
  return 0;
}

uint64_t sub_259DCDE64()
{
  uint64_t result = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  if (v2 <= 0)
  {
    if (v3 < result) {
      goto LABEL_3;
    }
  }
  else if (result < v3)
  {
LABEL_3:
    BOOL v4 = __OFADD__(result, v2);
    int64_t v5 = result + v2;
    char v6 = v4;
    unint64_t v7 = 0x8000000000000000;
    if (v4) {
      int64_t v5 = (v5 >> 63) ^ 0x8000000000000000;
    }
    else {
      unint64_t v7 = 0;
    }
    *(void *)(v0 + 24) = v7;
    *(unsigned char *)(v0 + 32) = v6 ^ 1;
    *(void *)(v0 + 40) = v5;
    return result;
  }
  if (result != v3
    || (*(unsigned char *)(v0 + 48) & 1) != 0
    || (*(unsigned char *)(v0 + 32) & 1) == 0 && *(void *)(v0 + 24) == 0x8000000000000000)
  {
    return 0;
  }
  *(unsigned char *)(v0 + 48) = 1;
  return result;
}

uint64_t PlanksWriter.writeBatch<A, B>(_:label:as:quantization:)(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v79 = a8;
  uint64_t v84 = a5;
  *(void *)&long long v85 = a2;
  uint64_t v86 = a3;
  uint64_t v83 = a13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v80 = &v73[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32C0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v77 = &v73[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_259DF7910();
  MEMORY[0x270FA5388](v19 - 8);
  unint64_t v78 = &v73[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v76 = sub_259DF7A20();
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  unint64_t v82 = &v73[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v22 = sub_259DF7A10();
  v91[0] = v22;
  uint64_t v23 = sub_259DF7CC0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v25 = v83;
  computeQuantizationParameters<A, B, C>(_:upperbound:)((uint64_t)v91, v84, a7, (uint64_t)a6, v23, a12, v83, a9, (double *)&v87, a10, WitnessTable);
  uint64_t v26 = v87;
  uint64_t v27 = v88;
  v91[0] = v22;
  LODWORD(v84) = v89;
  int v74 = BYTE1(v89);
  uint64_t v28 = quantizeArray<A, B, C>(_:parameters:)((uint64_t)v91, &v87, a7, a6, v23, a12, v25, a9);
  swift_bridgeObjectRelease();
  if (!v28)
  {
    uint64_t v43 = v85;
    char v44 = v86;
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_259DF7A50();
    __swift_project_value_buffer(v45, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v46 = sub_259DF7A30();
    os_log_type_t v47 = sub_259DF7DA0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v87 = v49;
      *(_DWORD *)uint64_t v48 = 136315138;
      swift_bridgeObjectRetain();
      v91[0] = sub_259DC6D7C(v43, (unint64_t)v44, &v87);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v46, v47, "Failed at quantizing batch: %s.", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v49, -1, -1);
      MEMORY[0x25A2EC590](v48, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  sub_259DF79F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32C8);
  sub_259DF7F10();
  swift_bridgeObjectRelease();
  uint64_t v29 = v77;
  sub_259DF7950();
  uint64_t v30 = sub_259DF7960();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
  uint64_t v31 = (uint64_t)v82;
  sub_259DF79E0();
  uint64_t v32 = (uint64_t)v80;
  sub_259DF7940();
  uint64_t v33 = sub_259DF7900();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 0, 1, v33);
  uint64_t v34 = v85;
  uint64_t v35 = v86;
  uint64_t v36 = v81;
  char v37 = PlanksWriter.writeBatch(_:label:as:)(v31, v85, v86, v32);
  sub_259DCF8E4(v32);
  if ((v37 & 1) == 0)
  {
LABEL_12:
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_259DF7A50();
    __swift_project_value_buffer(v50, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v51 = sub_259DF7A30();
    os_log_type_t v52 = sub_259DF7DA0();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v87 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      swift_bridgeObjectRetain();
      v91[0] = sub_259DC6D7C(v34, (unint64_t)v35, &v87);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v51, v52, "Failed at writing quantizedTensor: %s.", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v54, -1, -1);
      MEMORY[0x25A2EC590](v53, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v31, v76);
    return 0;
  }
  uint64_t v38 = v36 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  uint64_t v39 = *(void *)(v38 + 16);
  uint64_t v83 = v38 + 16;
  if (!*(void *)(v39 + 16))
  {
    swift_endAccess();
    goto LABEL_12;
  }
  uint64_t v81 = v38;
  sub_259DCFAA8((uint64_t)&v87);
  uint64_t v40 = v88;
  if (v88)
  {
    unint64_t v41 = v90;
    long long v85 = v89;
    int v42 = v87;
  }
  else
  {
    sub_259DCF9A8(*(void *)(*(void *)v83 + 16) - 1, (uint64_t)&v87);
    int v42 = v87;
    uint64_t v40 = v88;
    long long v85 = v89;
    unint64_t v41 = v90;
  }
  swift_endAccess();
  uint64_t v56 = *(void *)(v40 + 16);
  if (v56)
  {
    LODWORD(v79) = v42;
    uint64_t v80 = v41;
    LODWORD(v86) = v84 | (v74 << 8);
    swift_bridgeObjectRetain_n();
    uint64_t v84 = v40;
    unint64_t v57 = (unsigned char *)(v40 + 64);
    unint64_t v58 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v60 = *((void *)v57 - 4);
      uint64_t v59 = *((void *)v57 - 3);
      uint64_t v62 = *((void *)v57 - 2);
      uint64_t v61 = *((void *)v57 - 1);
      char v63 = *v57;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v58 = sub_259DCF76C(0, v58[2] + 1, 1, v58);
      }
      unint64_t v65 = v58[2];
      unint64_t v64 = v58[3];
      if (v65 >= v64 >> 1) {
        unint64_t v58 = sub_259DCF76C((void *)(v64 > 1), v65 + 1, 1, v58);
      }
      v57 += 64;
      v58[2] = v65 + 1;
      char v66 = &v58[8 * v65];
      v66[4] = v60;
      v66[5] = v59;
      v66[6] = v62;
      v66[7] = v61;
      *((unsigned char *)v66 + 64) = v63;
      *((unsigned char *)v66 + 65) = 1;
      v66[9] = v26;
      v66[10] = v27;
      *((_WORD *)v66 + 44) = (_WORD)v86;
      --v56;
    }
    while (v56);
    swift_bridgeObjectRelease_n();
    uint64_t v31 = (uint64_t)v82;
    unint64_t v41 = v80;
    LOBYTE(v42) = v79;
  }
  else
  {
    unint64_t v58 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v67 = v81;
  swift_beginAccess();
  char v68 = *(void **)(v67 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v67 + 16) = v68;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    char v68 = sub_259DCF648(0, v68[2] + 1, 1, v68);
    *(void *)uint64_t v83 = v68;
  }
  unint64_t v71 = v68[2];
  unint64_t v70 = v68[3];
  if (v71 >= v70 >> 1)
  {
    char v68 = sub_259DCF648((void *)(v70 > 1), v71 + 1, 1, v68);
    *(void *)uint64_t v83 = v68;
  }
  v68[2] = v71 + 1;
  uint64_t v72 = &v68[5 * v71];
  *((unsigned char *)v72 + 32) = v42;
  v72[5] = v58;
  *((_OWORD *)v72 + 3) = v85;
  v72[8] = v41;
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v31, v76);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t PlanksWriter.writeTensor<A, B>(_:label:as:batchSize:quantization:)(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4, int64_t a5, uint64_t a6, char *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int64_t v81 = a5;
  uint64_t v85 = a6;
  *(void *)&long long v86 = a2;
  uint64_t v87 = a3;
  uint64_t v84 = a10;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v80 = &v74[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32C0);
  MEMORY[0x270FA5388](v18 - 8);
  unint64_t v78 = &v74[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = sub_259DF7910();
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v79 = &v74[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v77 = sub_259DF7A20();
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v83 = &v74[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = sub_259DF7A10();
  v92[0] = v23;
  uint64_t v24 = sub_259DF7CC0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = v84;
  computeQuantizationParameters<A, B, C>(_:upperbound:)((uint64_t)v92, v85, a8, (uint64_t)a7, v24, a13, a14, v84, (double *)&v88, a11, WitnessTable);
  uint64_t v27 = v88;
  uint64_t v28 = v89;
  v92[0] = v23;
  LODWORD(v85) = v90;
  int v75 = BYTE1(v90);
  uint64_t v29 = quantizeArray<A, B, C>(_:parameters:)((uint64_t)v92, &v88, a8, a7, v24, a13, a14, v26);
  swift_bridgeObjectRelease();
  if (!v29)
  {
    uint64_t v44 = v86;
    uint64_t v45 = v87;
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_259DF7A50();
    __swift_project_value_buffer(v46, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v47 = sub_259DF7A30();
    os_log_type_t v48 = sub_259DF7DA0();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v88 = v50;
      *(_DWORD *)uint64_t v49 = 136315138;
      swift_bridgeObjectRetain();
      v92[0] = sub_259DC6D7C(v44, (unint64_t)v45, &v88);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v47, v48, "Failed at quantizing batch: %s.", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v50, -1, -1);
      MEMORY[0x25A2EC590](v49, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  sub_259DF79F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32C8);
  sub_259DF7F10();
  swift_bridgeObjectRelease();
  uint64_t v30 = v78;
  sub_259DF7950();
  uint64_t v31 = sub_259DF7960();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 0, 1, v31);
  uint64_t v32 = (uint64_t)v83;
  sub_259DF79E0();
  uint64_t v33 = (uint64_t)v80;
  sub_259DF7940();
  uint64_t v34 = sub_259DF7900();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 0, 1, v34);
  uint64_t v35 = v86;
  uint64_t v36 = v87;
  uint64_t v37 = v82;
  char v38 = PlanksWriter.writeTensor(_:label:as:batchSize:)(v32, v86, v87, v33, v81);
  sub_259DCF8E4(v33);
  if ((v38 & 1) == 0)
  {
LABEL_12:
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_259DF7A50();
    __swift_project_value_buffer(v51, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v52 = sub_259DF7A30();
    os_log_type_t v53 = sub_259DF7DA0();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v88 = v55;
      *(_DWORD *)uint64_t v54 = 136315138;
      swift_bridgeObjectRetain();
      v92[0] = sub_259DC6D7C(v35, (unint64_t)v36, &v88);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v52, v53, "Failed at writing quantizedTensor: %s.", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v55, -1, -1);
      MEMORY[0x25A2EC590](v54, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v32, v77);
    return 0;
  }
  uint64_t v39 = v37 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  uint64_t v40 = *(void *)(v39 + 16);
  uint64_t v84 = v39 + 16;
  if (!*(void *)(v40 + 16))
  {
    swift_endAccess();
    goto LABEL_12;
  }
  uint64_t v82 = v39;
  sub_259DCFAA8((uint64_t)&v88);
  uint64_t v41 = v89;
  if (v89)
  {
    int64_t v42 = v91;
    long long v86 = v90;
    int v43 = v88;
  }
  else
  {
    sub_259DCF9A8(*(void *)(*(void *)v84 + 16) - 1, (uint64_t)&v88);
    int v43 = v88;
    uint64_t v41 = v89;
    long long v86 = v90;
    int64_t v42 = v91;
  }
  swift_endAccess();
  uint64_t v57 = *(void *)(v41 + 16);
  if (v57)
  {
    LODWORD(v80) = v43;
    int64_t v81 = v42;
    LODWORD(v87) = v85 | (v75 << 8);
    swift_bridgeObjectRetain_n();
    uint64_t v85 = v41;
    unint64_t v58 = (unsigned char *)(v41 + 64);
    uint64_t v59 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v61 = *((void *)v58 - 4);
      uint64_t v60 = *((void *)v58 - 3);
      uint64_t v63 = *((void *)v58 - 2);
      uint64_t v62 = *((void *)v58 - 1);
      char v64 = *v58;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v59 = sub_259DCF76C(0, v59[2] + 1, 1, v59);
      }
      unint64_t v66 = v59[2];
      unint64_t v65 = v59[3];
      if (v66 >= v65 >> 1) {
        uint64_t v59 = sub_259DCF76C((void *)(v65 > 1), v66 + 1, 1, v59);
      }
      v58 += 64;
      v59[2] = v66 + 1;
      uint64_t v67 = &v59[8 * v66];
      v67[4] = v61;
      v67[5] = v60;
      v67[6] = v63;
      v67[7] = v62;
      *((unsigned char *)v67 + 64) = v64;
      *((unsigned char *)v67 + 65) = 1;
      v67[9] = v27;
      v67[10] = v28;
      *((_WORD *)v67 + 44) = (_WORD)v87;
      --v57;
    }
    while (v57);
    swift_bridgeObjectRelease_n();
    uint64_t v32 = (uint64_t)v83;
    int64_t v42 = v81;
    LOBYTE(v43) = (_BYTE)v80;
  }
  else
  {
    uint64_t v59 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v68 = v82;
  swift_beginAccess();
  uint64_t v69 = *(void **)(v68 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v68 + 16) = v69;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v69 = sub_259DCF648(0, v69[2] + 1, 1, v69);
    *(void *)uint64_t v84 = v69;
  }
  unint64_t v72 = v69[2];
  unint64_t v71 = v69[3];
  if (v72 >= v71 >> 1)
  {
    uint64_t v69 = sub_259DCF648((void *)(v71 > 1), v72 + 1, 1, v69);
    *(void *)uint64_t v84 = v69;
  }
  v69[2] = v72 + 1;
  unint64_t v73 = &v69[5 * v72];
  *((unsigned char *)v73 + 32) = v43;
  v73[5] = v59;
  *((_OWORD *)v73 + 3) = v86;
  v73[8] = v42;
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v32, v77);
  swift_bridgeObjectRelease();
  return 1;
}

void *sub_259DCF208(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_259DCFB34(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259DCF318(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32D0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_259DCFCC4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259DCF428(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32E8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_259DCFDB8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259DCF538(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32D8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_259DCFF9C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259DCF648(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32E0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_259DCFEA4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_259DCF76C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32A0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 6);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_259DD0090(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_259DCF87C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259DCF8E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_259DCF944(void *a1)
{
  return sub_259DCF208(0, a1[2], 0, a1);
}

void *sub_259DCF958(void *a1)
{
  return sub_259DCF648(0, a1[2], 0, a1);
}

double sub_259DCF96C@<D0>(uint64_t a1@<X8>)
{
  return sub_259DE2D14(*(void *)(v1 + 24), *(void *)(v1 + 32), 0, 1, a1);
}

uint64_t sub_259DCF9A8@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v5 = sub_259DCF958(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = &v5[5 * a1];
    char v10 = *((unsigned char *)v8 + 32);
    uint64_t v9 = v8 + 4;
    uint64_t v11 = v9[1];
    uint64_t v12 = v9[4];
    *(unsigned char *)a2 = v10;
    *(void *)(a2 + 8) = v11;
    *(_OWORD *)(a2 + 16) = *((_OWORD *)v9 + 1);
    *(void *)(a2 + 32) = v12;
    uint64_t v13 = v6 - 1 - a1;
    if (v13 >= 0)
    {
      uint64_t result = (uint64_t)memmove(v9, v9 + 5, 40 * v13);
      void v5[2] = v7;
      *uint64_t v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DCFAA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v5 = v3[2];
    if (v5)
    {
LABEL_3:
      uint64_t v6 = v5 - 1;
      unint64_t v7 = &v3[5 * v6];
      uint64_t v8 = v7[5];
      uint64_t v9 = v7[8];
      *(unsigned char *)a1 = *((unsigned char *)v7 + 32);
      *(void *)(a1 + 8) = v8;
      *(_OWORD *)(a1 + 16) = *((_OWORD *)v7 + 3);
      *(void *)(a1 + 32) = v9;
      v3[2] = v6;
      unsigned int *v1 = v3;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_259DCF958(v3);
    uint64_t v3 = (void *)result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

char *sub_259DCFB34(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DCFC20(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_259DCFC68()
{
  unint64_t result = qword_26A3F32B8;
  if (!qword_26A3F32B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F32B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F32B8);
  }
  return result;
}

uint64_t sub_259DCFCC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

char *sub_259DCFDB8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DCFEA4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DCFF9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DD0090(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t PlanksReader.readBatch<A>(label:as:batchIndex:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_259DC4BA8();
  if (*(void *)(v12 + 16) && (unint64_t v13 = sub_259DC840C(a1, a2), (v14 & 1) != 0))
  {
    uint64_t v15 = *(void *)(*(void *)(v12 + 56) + 8 * v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v16 = *(void *)(v15 + 16);
    if (v16 && (a4 & 0x8000000000000000) == 0 && v16 > a4)
    {
      uint64_t v17 = v15 + 16 * a4;
      uint64_t v18 = *(void *)(v17 + 32);
      uint64_t v19 = *(void *)(v17 + 40);
      swift_bridgeObjectRelease();
      return sub_259DD041C(a1, a2, a3, v18, v19, a5, a6);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_259DF7A50();
  __swift_project_value_buffer(v21, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_259DF7A30();
  os_log_type_t v23 = sub_259DF7DA0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    swift_bridgeObjectRetain();
    sub_259DC6D7C(a1, a2, &v26);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v22, v23, "Found no valid indices for label: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v25, -1, -1);
    MEMORY[0x25A2EC590](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_259DD041C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void (*v64)(uint64_t *__return_ptr);
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  _OWORD v69[2];
  unsigned char v70[26];

  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_259DC487C();
  if (!*(void *)(v15 + 16) || (unint64_t v16 = sub_259DC840C(a1, a2), (v17 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_259DF7A50();
    __swift_project_value_buffer(v25, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_259DF7A30();
    os_log_type_t v27 = sub_259DF7DA0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(void *)&v69[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v68 = sub_259DC6D7C(a1, a2, (uint64_t *)v69);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v26, v27, "Invalid SchemaElement for label: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v29, -1, -1);
      uint64_t v30 = v28;
      goto LABEL_24;
    }

    goto LABEL_11;
  }
  uint64_t v18 = *(void *)(v15 + 56) + 32 * v16;
  uint64_t v19 = *(void *)(v18 + 8);
  uint64_t v63 = *(void *)v18;
  int v20 = *(unsigned __int8 *)(v18 + 16);
  unint64_t v65 = *(void *)(v18 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v64 = *(void (**)(uint64_t *__return_ptr))(a7 + 8);
  v64(&v68);
  LOBYTE(v69[0]) = v20;
  uint64_t v21 = FieldType.rawValue.getter();
  uint64_t v23 = v22;
  if (v21 != FieldType.rawValue.getter() || v23 != v24)
  {
    char v31 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_13;
    }
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_259DF7A50();
    __swift_project_value_buffer(v46, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    os_log_type_t v47 = sub_259DF7A30();
    os_log_type_t v48 = sub_259DF7DA0();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(void *)&v69[0] = v50;
      *(_DWORD *)uint64_t v49 = 136315394;
      ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v64)(&v68, a6, a7);
      uint64_t v51 = FieldType.description.getter();
      uint64_t v68 = sub_259DC6D7C(v51, v52, (uint64_t *)v69);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_259DC68F8(v63, v19, v20, v65);
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      uint64_t v68 = sub_259DC6D7C(v53, v55, (uint64_t *)v69);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v47, v48, "Invalid array type: %s for schema: %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v50, -1, -1);
      MEMORY[0x25A2EC590](v49, -1, -1);

      return 0;
    }

LABEL_11:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  swift_bridgeObjectRelease_n();
LABEL_13:
  if (a4 < 0
    || (uint64_t v32 = *(void *)(v8 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16), *(void *)(v32 + 16) <= a4)
    || a5 < 0
    || (uint64_t v33 = v32 + 40 * a4, v34 = *(void *)(v33 + 40), *(void *)(v34 + 16) <= a5))
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_259DF7A50();
    __swift_project_value_buffer(v42, (uint64_t)qword_26A3F63A0);
    uint64_t v26 = sub_259DF7A30();
    os_log_type_t v43 = sub_259DF7DA0();
    if (!os_log_type_enabled(v26, v43)) {
      goto LABEL_25;
    }
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    _os_log_impl(&dword_259DBD000, v26, v43, "Invalid index", v44, 2u);
    uint64_t v30 = v44;
LABEL_24:
    MEMORY[0x25A2EC590](v30, -1, -1);
LABEL_25:

    return 0;
  }
  uint64_t v35 = *(void *)(v33 + 64);
  uint64_t v36 = (_OWORD *)(v34 + (a5 << 6));
  long long v37 = v36[2];
  long long v38 = v36[3];
  long long v39 = v36[4];
  *(_OWORD *)&v70[10] = *(_OWORD *)((char *)v36 + 74);
  v69[1] = v38;
  *(_OWORD *)unint64_t v70 = v39;
  v69[0] = v37;
  sub_259DCA11C((uint64_t)v69);
  swift_bridgeObjectRelease();
  uint64_t v67 = 0;
  uint64_t v40 = v65 * v35;
  if ((unsigned __int128)(v65 * (__int128)v35) >> 64 == (v65 * v35) >> 63)
  {
    if ((v20 - 1) > 9) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = qword_259DF8CD0[(char)(v20 - 1)];
    }
    if ((unsigned __int128)(v40 * (__int128)v41) >> 64 == (v40 * v41) >> 63)
    {
      MEMORY[0x270FA5388](v40);
      sub_259DF7C70();
      sub_259DD4584((uint64_t)v69);
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  swift_once();
  uint64_t v56 = sub_259DF7A50();
  __swift_project_value_buffer(v56, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_259DF7A30();
  os_log_type_t v58 = sub_259DF7D90();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    uint64_t v68 = v60;
    *(_DWORD *)uint64_t v59 = 134218242;
    unint64_t v66 = MEMORY[0x25A2EBC70](v19, a6);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2080;
    ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v64)(&v66, a6, a7);
    uint64_t v61 = FieldType.description.getter();
    unint64_t v66 = sub_259DC6D7C(v61, v62, &v68);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259DBD000, v57, v58, "Loaded array of %ld elements of type %s.", (uint8_t *)v59, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v60, -1, -1);
    MEMORY[0x25A2EC590](v59, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return v19;
}

double PlanksReader.iterBatches<A>(label:as:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC4BA8();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v9 + 16);
    swift_bridgeObjectRelease();
    if (v10)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = swift_retain();
      return sub_259DD0EF4(v11, a1, a2, (void *)a3);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_259DF7A50();
  __swift_project_value_buffer(v13, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain_n();
  char v14 = sub_259DF7A30();
  os_log_type_t v15 = sub_259DF7DA0();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = v17;
    *(_DWORD *)unint64_t v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_259DC6D7C(a1, a2, &v18);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v14, v15, "Found no valid indices for label: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v17, -1, -1);
    MEMORY[0x25A2EC590](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  return result;
}

double sub_259DD0EF4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_259DC4BA8();
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_259DC840C(a2, a3), (v10 & 1) != 0))
  {
    uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_259DC5F20(a2, a3);
    *a4 = v12;
    a4[1] = a1;
    a4[2] = a2;
    a4[3] = a3;
    a4[4] = v11;
    a4[5] = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_259DF7A50();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    os_log_type_t v15 = sub_259DF7A30();
    os_log_type_t v16 = sub_259DF7DA0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      sub_259DC6D7C(a2, a3, &v19);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v15, v16, "Invalid label: %s for AsyncArraySequence.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v18, -1, -1);
      MEMORY[0x25A2EC590](v17, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
      swift_bridgeObjectRelease_n();
    }
    double result = 0.0;
    *((_OWORD *)a4 + 1) = 0u;
    *((_OWORD *)a4 + 2) = 0u;
    *(_OWORD *)a4 = 0u;
  }
  return result;
}

unint64_t PlanksReader.readArray<A>(label:as:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v51)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  swift_bridgeObjectRetain();
  uint64_t v9 = sub_259DC487C();
  if (!*(void *)(v9 + 16) || (unint64_t v10 = sub_259DC840C(a1, a2), (v11 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_259DF7A50();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    int v20 = sub_259DF7A30();
    os_log_type_t v21 = sub_259DF7DA0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v56 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      unint64_t v55 = sub_259DC6D7C(a1, a2, &v56);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v24 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v20, v21, v24, v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v23, -1, -1);
      MEMORY[0x25A2EC590](v22, -1, -1);

      return 0;
    }
    goto LABEL_26;
  }
  uint64_t v12 = *(void *)(v9 + 56) + 32 * v10;
  uint64_t v13 = *(void *)(v12 + 8);
  unint64_t v52 = *(void *)v12;
  int v14 = *(unsigned __int8 *)(v12 + 16);
  unint64_t v54 = *(void *)(v12 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v51 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 8);
  v51(&v55, a4, a5);
  uint64_t v53 = v14;
  LOBYTE(v56) = v14;
  uint64_t v15 = FieldType.rawValue.getter();
  uint64_t v17 = v16;
  if (v15 == FieldType.rawValue.getter() && v17 == v18)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v25 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_259DF7A50();
      __swift_project_value_buffer(v34, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_259DF7A30();
      os_log_type_t v36 = sub_259DF7DA0();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        uint64_t v56 = v38;
        *(_DWORD *)uint64_t v37 = 136315394;
        uint64_t v39 = sub_259DF81F0();
        unint64_t v55 = sub_259DC6D7C(v39, v40, &v56);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v41 = sub_259DC68F8(v52, v13, v53, v54);
        unint64_t v43 = v42;
        swift_bridgeObjectRelease();
        unint64_t v55 = sub_259DC6D7C(v41, v43, &v56);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v35, v36, "Invalid array type: %s for schema: %s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v38, -1, -1);
        MEMORY[0x25A2EC590](v37, -1, -1);

        return 0;
      }

      goto LABEL_27;
    }
  }
  uint64_t v26 = sub_259DC5E0C(a1, a2);
  if (v26 < 1)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_259DF7A50();
    __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    int v20 = sub_259DF7A30();
    os_log_type_t v21 = sub_259DF7DA0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v56 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      unint64_t v55 = sub_259DC6D7C(a1, a2, &v56);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v24 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_26:

LABEL_27:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v27 = v26;
  swift_bridgeObjectRetain();
  if (!*(void *)(sub_259DC4BA8() + 16) || (sub_259DC840C(a1, a2), (v28 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_259DF7A50();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    int v20 = sub_259DF7A30();
    os_log_type_t v21 = sub_259DF7DA0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v56 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      unint64_t v55 = sub_259DC6D7C(a1, a2, &v56);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v24 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v29 = v54 * v27;
  if ((unsigned __int128)(v54 * (__int128)v27) >> 64 == (v54 * v27) >> 63)
  {
    if ((v53 - 1) > 9) {
      uint64_t v30 = 1;
    }
    else {
      uint64_t v30 = qword_259DF8CD0[(char)(v53 - 1)];
    }
    if ((unsigned __int128)(v29 * (__int128)v30) >> 64 == (v29 * v30) >> 63)
    {
      MEMORY[0x270FA5388](v29);
      sub_259DF7C70();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  swift_once();
  uint64_t v44 = sub_259DF7A50();
  __swift_project_value_buffer(v44, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_259DF7A30();
  os_log_type_t v46 = sub_259DF7D90();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v56 = v48;
    *(_DWORD *)uint64_t v47 = 134218242;
    unint64_t v55 = MEMORY[0x25A2EBC70](a2, a4);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 12) = 2080;
    v51(&v55, a4, a5);
    uint64_t v49 = FieldType.description.getter();
    unint64_t v55 = sub_259DC6D7C(v49, v50, &v56);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259DBD000, v45, v46, "Loaded array of %ld elements of type %s.", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v48, -1, -1);
    MEMORY[0x25A2EC590](v47, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return a2;
}

void sub_259DD1B58(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, unsigned char *a10, uint64_t a11)
{
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(*(void *)(a11 - 8) + 72);
  uint64_t v14 = v12 * v13;
  if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
  {
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_once();
LABEL_29:
    uint64_t v38 = sub_259DF7A50();
    __swift_project_value_buffer(v38, (uint64_t)qword_26A3F63A0);
    uint64_t v39 = sub_259DF7A30();
    os_log_type_t v40 = sub_259DF7DA0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_259DBD000, v39, v40, "Invalid index", v41, 2u);
      MEMORY[0x25A2EC590](v41, -1, -1);
    }
    goto LABEL_31;
  }
  uint64_t v17 = sub_259DF7DC0();
  uint64_t v18 = *(void *)(a4 + 16);
  if (!v18) {
    goto LABEL_47;
  }
  uint64_t v52 = a4;
  uint64_t v19 = *(void *)(a4 + 32);
  if (v19 < 0
    || (uint64_t v20 = *(void *)(a5 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        uint64_t v21 = *(void *)(v20 + 16),
        v19 >= v21))
  {
LABEL_28:
    if (qword_26A3F3140 == -1) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
  uint64_t v22 = v17;
  uint64_t v23 = *(void *)(v52 + 40);
  uint64_t v51 = v14;
  uint64_t v24 = swift_bridgeObjectRetain();
  uint64_t v25 = 0;
  uint64_t v26 = (char)(a8 - 1);
  uint64_t v27 = (uint64_t *)(v24 + 56);
  while (1)
  {
    if (v19 >= v21)
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    if (v23 < 0 || (uint64_t v28 = v20 + 32 + 40 * v19, v29 = *(void *)(v28 + 8), v23 >= *(void *)(v29 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    uint64_t v30 = *(void *)(v28 + 32);
    uint64_t v31 = a9 * v30;
    if ((unsigned __int128)(a9 * (__int128)v30) >> 64 != (a9 * v30) >> 63) {
      goto LABEL_50;
    }
    if (v26 > 9) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = qword_259DF8CD0[v26];
    }
    if ((unsigned __int128)(v31 * (__int128)v32) >> 64 != (v31 * v32) >> 63) {
      goto LABEL_51;
    }
    uint64_t v33 = *(void *)(v29 + (v23 << 6) + 56);
    if (v33 != v31 * v32)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 == -1) {
        goto LABEL_33;
      }
      goto LABEL_58;
    }
    BOOL v34 = __OFADD__(v25, v33);
    uint64_t v35 = v25 + v33;
    if (v34) {
      goto LABEL_52;
    }
    if (v22)
    {
      if (v51 < v35) {
        goto LABEL_35;
      }
      if (v35 < v25) {
        goto LABEL_55;
      }
      goto LABEL_22;
    }
    if (v35 > 0)
    {
LABEL_35:
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_259DF7A50();
      __swift_project_value_buffer(v46, (uint64_t)qword_26A3F63A0);
      uint64_t v39 = sub_259DF7A30();
      os_log_type_t v47 = sub_259DF7DA0();
      if (os_log_type_enabled(v39, v47))
      {
        uint64_t v44 = swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 134218240;
        sub_259DF7DE0();
        *(_WORD *)(v44 + 12) = 2048;
        sub_259DF7DE0();
        uint64_t v45 = "Failed at computing chunk offset: %ld vs %ld ";
        uint64_t v48 = v39;
        os_log_type_t v49 = v47;
LABEL_44:
        _os_log_impl(&dword_259DBD000, v48, v49, v45, (uint8_t *)v44, 0x16u);
        MEMORY[0x25A2EC590](v44, -1, -1);

        return;
      }
LABEL_31:

      return;
    }
    if (v35 < v25)
    {
      __break(1u);
LABEL_58:
      swift_once();
LABEL_33:
      uint64_t v42 = sub_259DF7A50();
      __swift_project_value_buffer(v42, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_259DF7A30();
      os_log_type_t v43 = sub_259DF7DA0();
      if (os_log_type_enabled(v39, v43))
      {
        uint64_t v44 = swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v44 + 12) = 2048;
        sub_259DF7DE0();
        uint64_t v45 = "Found invalid chunk: %lld vs %ld";
LABEL_43:
        uint64_t v48 = v39;
        os_log_type_t v49 = v43;
        goto LABEL_44;
      }
LABEL_45:

      swift_bridgeObjectRelease_n();
      return;
    }
LABEL_22:
    swift_bridgeObjectRetain();
    sub_259DF7A70();
    if (v36)
    {
      sub_259DC6E50();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v50 = sub_259DF7A50();
      __swift_project_value_buffer(v50, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_259DF7A30();
      os_log_type_t v43 = sub_259DF7DA0();
      if (os_log_type_enabled(v39, v43))
      {
        uint64_t v44 = swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v44 + 12) = 2048;
        sub_259DF7DE0();
        uint64_t v45 = "Failed at reading chunk at %lld for %ld bytes.";
        goto LABEL_43;
      }
      goto LABEL_45;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v31)) {
      goto LABEL_53;
    }
    *a2 += v31;
    if (!--v18) {
      break;
    }
    uint64_t v19 = *(v27 - 1);
    uint64_t v26 = (char)(a8 - 1);
    if ((v19 & 0x8000000000000000) == 0)
    {
      uint64_t v37 = *v27;
      v27 += 2;
      uint64_t v23 = v37;
      uint64_t v21 = *(void *)(v20 + 16);
      uint64_t v25 = v35;
      if (v19 < v21) {
        continue;
      }
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_47:
  *a10 = 1;
}

uint64_t PlanksReader.readBatch<A, B>(label:as:quantization:batchIndex:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_259DC4BA8();
  if (*(void *)(v18 + 16) && (unint64_t v19 = sub_259DC840C(a1, a2), (v20 & 1) != 0))
  {
    uint64_t v33 = a1;
    uint64_t v21 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v22 = *(void *)(v21 + 16);
    if (v22 && (a5 & 0x8000000000000000) == 0 && v22 > a5)
    {
      uint64_t v23 = v21 + 16 * a5;
      uint64_t v24 = *(void *)(v23 + 40);
      uint64_t v32 = *(void *)(v23 + 32);
      swift_bridgeObjectRelease();
      return sub_259DD24BC(v33, a2, v32, v24, a3, a4, a6, a7, a8, a9, a10);
    }
    a1 = v33;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_259DF7A50();
  __swift_project_value_buffer(v26, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain_n();
  uint64_t v27 = sub_259DF7A30();
  os_log_type_t v28 = sub_259DF7DA0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = a1;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)uint64_t v29 = 136315138;
    swift_bridgeObjectRetain();
    sub_259DC6D7C(v30, a2, &v34);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v27, v28, "Found no valid indices for label: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v31, -1, -1);
    MEMORY[0x25A2EC590](v29, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_259DD24BC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a3 < 0
    || (uint64_t v12 = *(void *)(v11 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16), *(void *)(v12 + 16) <= a3)
    || a4 < 0
    || (uint64_t v13 = *(void *)(v12 + 40 * a3 + 40), *(void *)(v13 + 16) <= a4)
    || (uint64_t v14 = v13 + (a4 << 6), v15 = *(_WORD *)(v14 + 88), v15 == 12))
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_259DF7A50();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A3F63A0);
    uint64_t v17 = sub_259DF7A30();
    os_log_type_t v18 = sub_259DF7DA0();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl(&dword_259DBD000, v17, v18, "Invalid index.", v19, 2u);
      MEMORY[0x25A2EC590](v19, -1, -1);
    }

    return 0;
  }
  uint64_t v24 = v14 + 32;
  uint64_t v26 = *(void *)(v24 + 40);
  uint64_t v25 = *(void *)(v24 + 48);
  uint64_t v27 = sub_259DD041C(a1, a2, a6, a3, a4, a8, a11);
  if (!v27) {
    goto LABEL_15;
  }
  uint64_t v40 = v27;
  v38[0] = v26;
  v38[1] = v25;
  __int16 v39 = v15;
  uint64_t v28 = sub_259DF7CC0();
  swift_getWitnessTable();
  uint64_t v20 = rebuildArray<A, B, C>(_:parameters:)((uint64_t)&v40, v38, a7, a8, v28, a9, a10, a11);
  swift_bridgeObjectRelease();
  if (!v20)
  {
LABEL_15:
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    uint64_t v30 = sub_259DF7A30();
    os_log_type_t v31 = sub_259DF7DA0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v38[0] = v33;
      *(_DWORD *)uint64_t v32 = 136315394;
      uint64_t v34 = sub_259DF81F0();
      uint64_t v40 = sub_259DC6D7C(v34, v35, v38);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      uint64_t v36 = sub_259DF81F0();
      uint64_t v40 = sub_259DC6D7C(v36, v37, v38);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v30, v31, "Failed rebuilding of array of type %s into type %s.", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v33, -1, -1);
      MEMORY[0x25A2EC590](v32, -1, -1);
    }

    return 0;
  }
  return v20;
}

double PlanksReader.iterBatches<A, B>(label:as:quantization:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_259DC4BA8();
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_259DC840C(a1, a2), (v10 & 1) != 0))
  {
    uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 16);
    swift_bridgeObjectRelease();
    if (v12)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = swift_retain();
      return sub_259DD2ADC(v13, a1, a2, a3, (void *)a4);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_259DF7A50();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_259DF7A30();
  os_log_type_t v17 = sub_259DF7DA0();
  if (os_log_type_enabled(v16, v17))
  {
    os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)os_log_type_t v18 = 136315138;
    swift_bridgeObjectRetain();
    sub_259DC6D7C(a1, a2, &v20);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v16, v17, "Found no valid indices for label: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v19, -1, -1);
    MEMORY[0x25A2EC590](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(a4 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  return result;
}

double sub_259DD2ADC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_259DC4BA8();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_259DC840C(a2, a3), (v12 & 1) != 0))
  {
    uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_259DC5F20(a2, a3);
    *a5 = v14;
    a5[1] = a1;
    a5[2] = a2;
    a5[3] = a3;
    a5[4] = v13;
    a5[5] = a4;
    a5[6] = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_259DF7A50();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    os_log_type_t v17 = sub_259DF7A30();
    os_log_type_t v18 = sub_259DF7DA0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      swift_bridgeObjectRetain();
      sub_259DC6D7C(a2, a3, &v21);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v17, v18, "Invalid label: %s for AsyncArraySequence.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v20, -1, -1);
      MEMORY[0x25A2EC590](v19, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
      swift_bridgeObjectRelease_n();
    }
    a5[6] = 0;
    double result = 0.0;
    *((_OWORD *)a5 + 1) = 0u;
    *((_OWORD *)a5 + 2) = 0u;
    *(_OWORD *)a5 = 0u;
  }
  return result;
}

uint64_t PlanksReader.readArray<A, B>(label:as:quantization:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_259DC487C();
  if (*(void *)(v17 + 16) && (unint64_t v18 = sub_259DC840C(a1, a2), (v19 & 1) != 0))
  {
    uint64_t v40 = a3;
    uint64_t v39 = *(void *)(*(void *)(v17 + 56) + 32 * v18 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_259DC5E0C(a1, a2);
    if (v20 < 1)
    {
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v36 = sub_259DF7A50();
      __swift_project_value_buffer(v36, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain_n();
      uint64_t v30 = sub_259DF7A30();
      os_log_type_t v31 = sub_259DF7DA0();
      if (!os_log_type_enabled(v30, v31)) {
        goto LABEL_28;
      }
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v42 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_259DC6D7C(a1, a2, &v42);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v34 = "Found no valid rows for label: %s";
    }
    else
    {
      uint64_t v21 = v20;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_259DC4BA8();
      if (*(void *)(v22 + 16))
      {
        unint64_t v23 = sub_259DC840C(a1, a2);
        if (v24)
        {
          uint64_t v38 = *(void *)(*(void *)(v22 + 56) + 8 * v23);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((unsigned __int128)(v39 * (__int128)v21) >> 64 == (v39 * v21) >> 63)
          {
            uint64_t v42 = sub_259DF7C50();
            sub_259DF7CC0();
            sub_259DF7C20();
            uint64_t v25 = *(void *)(v38 + 16);
            if (!v25)
            {
LABEL_11:
              swift_bridgeObjectRelease();
              return v42;
            }
            uint64_t v39 = a1;
            uint64_t v26 = (uint64_t *)(v38 + 40);
            while (1)
            {
              uint64_t v27 = sub_259DD24BC(v39, a2, *(v26 - 1), *v26, v40, a4, a5, a6, a7, a8, a9);
              if (!v27) {
                break;
              }
              v26 += 2;
              uint64_t v41 = v27;
              swift_getWitnessTable();
              sub_259DF7CA0();
              if (!--v25) {
                goto LABEL_11;
              }
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_26A3F3140 == -1)
            {
LABEL_26:
              uint64_t v37 = sub_259DF7A50();
              __swift_project_value_buffer(v37, (uint64_t)qword_26A3F63A0);
              swift_bridgeObjectRetain_n();
              uint64_t v30 = sub_259DF7A30();
              os_log_type_t v31 = sub_259DF7DA0();
              if (os_log_type_enabled(v30, v31))
              {
                uint64_t v32 = (uint8_t *)swift_slowAlloc();
                uint64_t v33 = swift_slowAlloc();
                uint64_t v41 = v33;
                *(_DWORD *)uint64_t v32 = 136315138;
                swift_bridgeObjectRetain();
                sub_259DC6D7C(v39, a2, &v41);
                sub_259DF7DE0();
                swift_bridgeObjectRelease_n();
                uint64_t v34 = "Failed at loading array: %s";
                goto LABEL_16;
              }
LABEL_28:

              swift_bridgeObjectRelease_n();
              return 0;
            }
          }
          else
          {
            __break(1u);
          }
          swift_once();
          goto LABEL_26;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_259DF7A50();
      __swift_project_value_buffer(v35, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain_n();
      uint64_t v30 = sub_259DF7A30();
      os_log_type_t v31 = sub_259DF7DA0();
      if (!os_log_type_enabled(v30, v31)) {
        goto LABEL_28;
      }
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v42 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_259DC6D7C(a1, a2, &v42);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v34 = "Found no valid indices for label: %s";
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v30 = sub_259DF7A30();
    os_log_type_t v31 = sub_259DF7DA0();
    if (!os_log_type_enabled(v30, v31)) {
      goto LABEL_28;
    }
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v42 = v33;
    *(_DWORD *)uint64_t v32 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DC6D7C(a1, a2, &v42);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    uint64_t v34 = "Invalid SchemaElement for label: %s";
  }
LABEL_16:
  _os_log_impl(&dword_259DBD000, v30, v31, v34, v32, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x25A2EC590](v33, -1, -1);
  MEMORY[0x25A2EC590](v32, -1, -1);

  return 0;
}

void sub_259DD3460(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8)
{
  if ((unsigned __int128)(*(uint64_t *)(a1 + 8) * (__int128)*(uint64_t *)(*(void *)(a8 - 8) + 72)) >> 64 != (uint64_t)(*(void *)(a1 + 8) * *(void *)(*(void *)(a8 - 8) + 72)) >> 63)
  {
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_7;
  }
  uint64_t v8 = a4;
  sub_259DF7DC0();
  if (*(void *)(v8 + 24) == a3)
  {
    sub_259DF7A70();
    if (v13)
    {
      sub_259DC6E50();
      swift_willThrowTypedImpl();
      if (qword_26A3F3140 == -1) {
        goto LABEL_10;
      }
    }
    else
    {
      if (!__OFADD__(*a2, a6))
      {
        *a2 += a6;
        *a7 = 1;
        return;
      }
      __break(1u);
    }
    swift_once();
LABEL_10:
    uint64_t v19 = sub_259DF7A50();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A3F63A0);
    sub_259DCA11C(v8);
    uint64_t v15 = sub_259DF7A30();
    os_log_type_t v20 = sub_259DF7DA0();
    if (os_log_type_enabled(v15, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 134218240;
      sub_259DF7DE0();
      sub_259DD4584(v8);
      *(_WORD *)(v21 + 12) = 2048;
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v15, v20, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v21, 0x16u);
      uint64_t v18 = v21;
      goto LABEL_12;
    }
LABEL_13:
    sub_259DD4584(v8);
    goto LABEL_14;
  }
  if (qword_26A3F3140 != -1) {
    goto LABEL_16;
  }
LABEL_7:
  uint64_t v14 = sub_259DF7A50();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A3F63A0);
  sub_259DCA11C(v8);
  uint64_t v15 = sub_259DF7A30();
  os_log_type_t v16 = sub_259DF7DA0();
  if (!os_log_type_enabled(v15, v16)) {
    goto LABEL_13;
  }
  uint64_t v17 = swift_slowAlloc();
  *(_DWORD *)uint64_t v17 = 134218240;
  sub_259DF7DE0();
  sub_259DD4584(v8);
  *(_WORD *)(v17 + 12) = 2048;
  sub_259DF7DE0();
  _os_log_impl(&dword_259DBD000, v15, v16, "Found invalid chunk: %lld vs %ld", (uint8_t *)v17, 0x16u);
  uint64_t v18 = v17;
LABEL_12:
  MEMORY[0x25A2EC590](v18, -1, -1);
LABEL_14:
}

uint64_t AsyncArraySequence.maxBatchSize.getter()
{
  return *(void *)v0;
}

uint64_t AsyncArraySequence.maxBatchSize.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AsyncArraySequence.maxBatchSize.modify())()
{
  return nullsub_1;
}

uint64_t AsyncArraySequence.makeAsyncIterator()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v5 = v1[5];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v6;
  a1[5] = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t AsyncArraySequence.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_259DD384C, 0, 0);
}

uint64_t sub_259DD384C()
{
  if ((sub_259DF7CF0() & 1) != 0 || (v1 = (void *)v0[3], v3 = v1[4], unint64_t v2 = v1[5], v2 >= *(void *)(v3 + 16)))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v4 = v0[2];
    uint64_t v5 = v3 + 16 * v2;
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t v7 = *(void *)(v5 + 40);
    v1[5] = v2 + 1;
    uint64_t v8 = sub_259DD041C(v1[2], v1[3], *(void *)(v4 + 16), v6, v7, *(void *)(v4 + 16), *(void *)(v4 + 24));
  }
  unint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v8);
}

uint64_t sub_259DD38F0@<X0>(void *a1@<X8>)
{
  AsyncArraySequence.makeAsyncIterator()(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_259DD3940(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  void v5[2] = a2;
  v5[3] = v2;
  v5[1] = sub_259DD39F0;
  return MEMORY[0x270FA2498](sub_259DD384C, 0, 0);
}

uint64_t sub_259DD39F0(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_259DD3B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *char v12 = v6;
  v12[1] = sub_259DD3BD0;
  return MEMORY[0x270FA1E90](a1, a2, a3, a5, a6);
}

uint64_t sub_259DD3BD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t AsyncTransformedArraySequence.maxBatchSize.getter()
{
  return *(void *)v0;
}

uint64_t AsyncTransformedArraySequence.maxBatchSize.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AsyncTransformedArraySequence.maxBatchSize.modify())()
{
  return nullsub_1;
}

uint64_t AsyncTransformedArraySequence.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 48);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(void *)(a1 + 48) = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t AsyncTransformedArraySequence.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_259DD3D88, 0, 0);
}

uint64_t sub_259DD3D88()
{
  if ((sub_259DF7CF0() & 1) != 0 || (v1 = (void *)v0[3], unint64_t v2 = v1[6], v3 = v1[4], v2 >= *(void *)(v3 + 16)))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v4 = (uint64_t *)v0[2];
    uint64_t v5 = v3 + 16 * v2;
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t v7 = *(void *)(v5 + 40);
    v1[6] = v2 + 1;
    uint64_t v8 = sub_259DD24BC(v1[2], v1[3], v6, v7, v4[2], v1[5], (char *)v4[2], v4[3], v4[4], v4[5], v4[6]);
  }
  unint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v8);
}

uint64_t sub_259DD3E44@<X0>(uint64_t a1@<X8>)
{
  AsyncTransformedArraySequence.makeAsyncIterator()(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_259DD3E94(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  void v5[2] = a2;
  v5[3] = v2;
  v5[1] = sub_259DD45B0;
  return MEMORY[0x270FA2498](sub_259DD3D88, 0, 0);
}

uint64_t sub_259DD3F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *char v12 = v6;
  v12[1] = sub_259DD45B8;
  return MEMORY[0x270FA1E90](a1, a2, a3, a5, a6);
}

void sub_259DD4010(uint64_t a1, void *a2)
{
  sub_259DD1B58(a1, a2, *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(unsigned char *)(v2 + 72), *(void *)(v2 + 80), *(unsigned char **)(v2 + 88), *(void *)(v2 + 16));
}

uint64_t sub_259DD4050()
{
  return swift_getWitnessTable();
}

uint64_t sub_259DD406C()
{
  return MEMORY[0x263F8E658];
}

uint64_t sub_259DD4078()
{
  return swift_getWitnessTable();
}

uint64_t sub_259DD4094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t initializeBufferWithCopyOfBuffer for ColumnChunk(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *sub_259DD40D4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_259DD412C(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_259DD41D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t sub_259DD4230(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_259DD4278(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AsyncArraySequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259DD42DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 72);
}

uint64_t sub_259DD42E4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DD4328(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_259DD4390(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_259DD4444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  return a1;
}

uint64_t sub_259DD44A4(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_259DD44EC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for AsyncTransformedArraySequence()
{
  return swift_getGenericMetadata();
}

void sub_259DD4550(uint64_t a1, void *a2)
{
  sub_259DD3460(a1, a2, *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(unsigned char **)(v2 + 64), *(void *)(v2 + 16));
}

uint64_t sub_259DD4584(uint64_t a1)
{
  return a1;
}

uint64_t sub_259DD45BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 947154537 && v14 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(947154505, 0xE400000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDEA28(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(947154537, 0xE400000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD4F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3631746E69 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x3631746E49, 0xE500000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDF0F0(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x3631746E69, 0xE500000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD5888(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3233746E69 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x3233746E49, 0xE500000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDF7CC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x3233746E69, 0xE500000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD61F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3436746E69 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x3436746E49, 0xE500000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDFEAC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x3436746E69, 0xE500000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD6B60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x38746E6975 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x38746E4955, 0xE500000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDEA28(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x38746E6975, 0xE500000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD74D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3631746E6975 && v14 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x3631746E4955, 0xE600000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDF0F0(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x3631746E6975, 0xE600000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD7E48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3233746E6975 && v14 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x3233746E4955, 0xE600000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDF7CC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x3233746E6975, 0xE600000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD87BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3436746E6975 && v14 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x3436746E4955, 0xE600000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDFEAC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x3436746E6975, 0xE600000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD9130(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x363174616F6C66 && v14 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x363174616F6C46, 0xE700000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDF0F0(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x363174616F6C66, 0xE700000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DD9AA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x323374616F6C66 && v14 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x74616F6C46, 0xE500000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDF7CC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x323374616F6C66, 0xE700000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DDA428(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x343674616F6C66 && v14 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(0x656C62756F44, 0xE600000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDFEAC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(0x343674616F6C66, 0xE700000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_259DDADA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_259DC487C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_259DC840C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259DF7A50();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_259DBD000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v19, -1, -1);
      MEMORY[0x25A2EC590](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)(v6 + 56) + 32 * v7;
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  char v12 = *(unsigned char *)(v9 + 16);
  uint64_t v13 = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 1819242338 && v14 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_259DF7A50();
      __swift_project_value_buffer(v32, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_259DF7A30();
      os_log_type_t v34 = sub_259DF7DA0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v48 = sub_259DC6D7C(1819242306, 0xE400000000000000, v46);
        sub_259DF7DE0();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_259DC68F8(v11, v10, v12, v13);
        unint64_t v39 = v38;
        swift_bridgeObjectRelease();
        uint64_t v48 = sub_259DC6D7C(v37, v39, v46);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v36, -1, -1);
        MEMORY[0x25A2EC590](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  uint64_t v22 = sub_259DC5E0C(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_259DC4BA8();
  if (!*(void *)(v24 + 16) || (unint64_t v25 = sub_259DC840C(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_259DF7A50();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    os_log_type_t v16 = sub_259DF7A30();
    os_log_type_t v17 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_259DC6D7C(a1, a2, v46);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      os_log_type_t v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  char v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_259DF7C60();
      *(void *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x263F8EE78];
    }
    uint64_t v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_259DDEA28(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(void *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        if (qword_26A3F3140 == -1) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    uint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_259DF7A30();
    os_log_type_t v42 = sub_259DF7D90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)uint64_t v43 = 134218242;
      uint64_t v48 = *(void *)(a2 + 16);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      uint64_t v48 = sub_259DC6D7C(1819242338, 0xE400000000000000, v46);
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v44, -1, -1);
      MEMORY[0x25A2EC590](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_259DF7F40();
  __break(1u);
  *(void *)(a2 + 16) = v45;
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t PlanksReader.readDataFrame(label:columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v130 = a4;
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3420);
  uint64_t v133 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  uint64_t v116 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3428);
  uint64_t v132 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115);
  uint64_t v114 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3430);
  *(void *)&long long v126 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  unint64_t v112 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3438);
  uint64_t v125 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  char v110 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3440);
  uint64_t v123 = *(void (***)(char *, uint64_t))(v109 - 8);
  MEMORY[0x270FA5388](v109);
  uint64_t v108 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3448);
  unint64_t v122 = *(void (***)(char *, uint64_t))(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v106 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3450);
  uint64_t v121 = *(void (***)(char *, uint64_t))(v105 - 8);
  MEMORY[0x270FA5388](v105);
  unint64_t v104 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3458);
  BOOL v120 = *(void (***)(char *, uint64_t))(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v102 = (char *)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3460);
  __int16 v119 = *(void (***)(char *, uint64_t))(v101 - 8);
  MEMORY[0x270FA5388](v101);
  uint64_t v100 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3468);
  uint64_t v118 = *(void (***)(char *, uint64_t))(v99 - 8);
  MEMORY[0x270FA5388](v99);
  os_log_t v98 = (char *)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3470);
  uint64_t v18 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v96 = (char *)&v88 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3478);
  uint64_t v20 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  os_log_type_t v94 = (char *)&v88 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_259DF7880();
  uint64_t v128 = *(void *)(v22 - 8);
  uint64_t v129 = v22;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v88 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_259DDE8B4(a3, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v26 = swift_bridgeObjectRetain();
  uint64_t v27 = sub_259DC9920(v26);
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_259DC472C();
  char v29 = sub_259DDD010(v28, v27);
  swift_bridgeObjectRelease();
  if (v29)
  {
    uint64_t v131 = v25;
    swift_bridgeObjectRelease();
    sub_259DF7870();
    uint64_t v30 = *(void *)(a3 + 16);
    if (v30)
    {
      uint64_t v124 = v24;
      uint64_t v134 = v4;
      uint64_t v127 = a3;
      uint64_t v31 = v131;
      uint64_t v32 = *(void *)(v131 + 16);
      if (v32)
      {
        uint64_t v93 = (void (**)(char *, uint64_t))(v133 + 8);
        uint64_t v92 = (void (**)(char *, uint64_t))(v132 + 8);
        int64_t v91 = (void (**)(char *, uint64_t))(v126 + 8);
        long long v90 = (void (**)(char *, uint64_t))(v125 + 8);
        ++v122;
        ++v123;
        ++v120;
        ++v121;
        ++v119;
        ++v118;
        uint64_t v89 = (void (**)(char *, uint64_t))(v18 + 8);
        uint64_t v88 = (void (**)(char *, uint64_t))(v20 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v33 = 0;
        unint64_t v34 = 0;
        uint64_t v132 = v32 - 1;
        uint64_t v133 = v30 - 1;
        *(void *)&long long v35 = 136315138;
        long long v126 = v35;
        uint64_t v125 = MEMORY[0x263F8EE58] + 8;
        uint64_t v36 = v31;
        while (1)
        {
          uint64_t v38 = *(void *)(v36 + v33 + 32);
          unint64_t v37 = *(void *)(v36 + v33 + 40);
          swift_bridgeObjectRetain_n();
          uint64_t v39 = sub_259DC487C();
          if (*(void *)(v39 + 16) && (unint64_t v40 = sub_259DC840C(v38, v37), (v41 & 1) != 0))
          {
            uint64_t v42 = *(unsigned __int8 *)(*(void *)(v39 + 56) + 32 * v40 + 16);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            switch(v42)
            {
              case 1:
                uint64_t v51 = sub_259DD4F1C(v38, v37);
                swift_bridgeObjectRelease();
                if (!v51) {
                  goto LABEL_37;
                }
                uint64_t v136 = v51;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3520);
                sub_259DDE9D8(&qword_26A3F3528, &qword_26A3F3520);
                uint64_t v52 = v96;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v89)(v52, v97);
                break;
              case 2:
                uint64_t v53 = sub_259DD5888(v38, v37);
                swift_bridgeObjectRelease();
                if (!v53) {
                  goto LABEL_37;
                }
                uint64_t v136 = v53;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3510);
                sub_259DDE9D8(&qword_26A3F3518, &qword_26A3F3510);
                unint64_t v54 = v98;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v118)(v54, v99);
                break;
              case 3:
                uint64_t v55 = sub_259DD61F4(v38, v37);
                swift_bridgeObjectRelease();
                if (!v55) {
                  goto LABEL_37;
                }
                uint64_t v136 = v55;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3500);
                sub_259DDE9D8(&qword_26A3F3508, &qword_26A3F3500);
                uint64_t v56 = v100;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v119)(v56, v101);
                break;
              case 4:
                uint64_t v57 = sub_259DD6B60(v38, v37);
                swift_bridgeObjectRelease();
                if (!v57) {
                  goto LABEL_37;
                }
                uint64_t v136 = v57;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F34F0);
                sub_259DDE9D8((unint64_t *)&qword_26A3F34F8, &qword_26A3F34F0);
                os_log_type_t v58 = v102;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v120)(v58, v103);
                break;
              case 5:
                uint64_t v59 = sub_259DD74D4(v38, v37);
                swift_bridgeObjectRelease();
                if (!v59) {
                  goto LABEL_37;
                }
                uint64_t v136 = v59;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F34E0);
                sub_259DDE9D8(&qword_26A3F34E8, &qword_26A3F34E0);
                uint64_t v60 = v104;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v121)(v60, v105);
                break;
              case 6:
                uint64_t v61 = sub_259DD7E48(v38, v37);
                swift_bridgeObjectRelease();
                if (!v61) {
                  goto LABEL_37;
                }
                uint64_t v136 = v61;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F34D0);
                sub_259DDE9D8(&qword_26A3F34D8, &qword_26A3F34D0);
                unint64_t v62 = v106;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v122)(v62, v107);
                break;
              case 7:
                uint64_t v63 = sub_259DD87BC(v38, v37);
                swift_bridgeObjectRelease();
                if (!v63) {
                  goto LABEL_37;
                }
                uint64_t v136 = v63;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F34C0);
                sub_259DDE9D8(&qword_26A3F34C8, &qword_26A3F34C0);
                char v64 = v108;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v123)(v64, v109);
                break;
              case 8:
                uint64_t v65 = sub_259DD9130(v38, v37);
                swift_bridgeObjectRelease();
                if (!v65) {
                  goto LABEL_37;
                }
                uint64_t v136 = v65;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F34B0);
                sub_259DDE9D8(&qword_26A3F34B8, &qword_26A3F34B0);
                unint64_t v66 = v110;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v90)(v66, v111);
                break;
              case 9:
                uint64_t v67 = sub_259DD9AA8(v38, v37);
                swift_bridgeObjectRelease();
                if (!v67) {
                  goto LABEL_37;
                }
                uint64_t v136 = v67;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F34A0);
                sub_259DDE9D8(&qword_26A3F34A8, &qword_26A3F34A0);
                uint64_t v68 = v112;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v91)(v68, v113);
                break;
              case 10:
                uint64_t v69 = sub_259DDA428(v38, v37);
                swift_bridgeObjectRelease();
                if (!v69) {
                  goto LABEL_37;
                }
                uint64_t v136 = v69;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3490);
                sub_259DDE9D8(&qword_26A3F3498, &qword_26A3F3490);
                unint64_t v70 = v114;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v92)(v70, v115);
                break;
              case 11:
                uint64_t v71 = sub_259DDADA8(v38, v37);
                swift_bridgeObjectRelease();
                if (!v71) {
                  goto LABEL_37;
                }
                uint64_t v136 = v71;
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3480);
                sub_259DDE9D8(&qword_26A3F3488, &qword_26A3F3480);
                unint64_t v72 = v116;
                sub_259DF78D0();
                sub_259DF7860();
                swift_bridgeObjectRelease();
                (*v93)(v72, v117);
                break;
              default:
                uint64_t v43 = sub_259DD45BC(v38, v37);
                swift_bridgeObjectRelease();
                if (v43)
                {
                  uint64_t v136 = v43;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3530);
                  sub_259DDE9D8(&qword_26A3F3538, &qword_26A3F3530);
                  uint64_t v44 = v94;
                  sub_259DF78D0();
                  sub_259DF7860();
                  swift_bridgeObjectRelease();
                  (*v88)(v44, v95);
                }
                else
                {
LABEL_37:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                }
                break;
            }
            uint64_t v36 = v131;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_26A3F3140 != -1) {
              swift_once();
            }
            uint64_t v45 = sub_259DF7A50();
            __swift_project_value_buffer(v45, (uint64_t)qword_26A3F63A0);
            swift_bridgeObjectRetain();
            uint64_t v46 = sub_259DF7A30();
            os_log_type_t v47 = sub_259DF7DA0();
            if (os_log_type_enabled(v46, v47))
            {
              uint64_t v48 = swift_slowAlloc();
              uint64_t v49 = swift_slowAlloc();
              uint64_t v136 = v49;
              *(_DWORD *)uint64_t v48 = v126;
              swift_bridgeObjectRetain();
              *(void *)(v48 + 4) = sub_259DC6D7C(v38, v37, &v136);
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_259DBD000, v46, v47, "Invalid schema element: %s", (uint8_t *)v48, 0xCu);
              swift_arrayDestroy();
              uint64_t v50 = v49;
              uint64_t v36 = v131;
              MEMORY[0x25A2EC590](v50, -1, -1);
              MEMORY[0x25A2EC590](v48, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
          }
          if (v133 == v34 || v132 == v34) {
            break;
          }
          unint64_t v73 = *(void *)(v36 + 16);
          swift_bridgeObjectRetain();
          ++v34;
          v33 += 16;
          if (v34 >= v73)
          {
            __break(1u);
            goto LABEL_55;
          }
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v24 = v124;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v86 = v128;
    uint64_t v85 = v129;
    uint64_t v87 = v130;
    (*(void (**)(uint64_t, char *, uint64_t))(v128 + 32))(v130, v24, v129);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v86 + 56))(v87, 0, 1, v85);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v74 = sub_259DC472C();
    uint64_t v75 = sub_259DDE1EC(v27, v74);
    if (*(void *)(v75 + 16) <= *(void *)(v27 + 16) >> 3)
    {
      uint64_t v136 = v27;
      sub_259DDD304(v75);
    }
    else
    {
      sub_259DDD4AC(v75, v27);
    }
    swift_release();
    if (qword_26A3F3140 != -1) {
LABEL_55:
    }
      swift_once();
    uint64_t v76 = sub_259DF7A50();
    __swift_project_value_buffer(v76, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_259DF7A30();
    os_log_type_t v78 = sub_259DF7DA0();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      uint64_t v80 = swift_slowAlloc();
      uint64_t v136 = v80;
      *(_DWORD *)uint64_t v79 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_259DF7D00();
      unint64_t v83 = v82;
      swift_bridgeObjectRelease();
      uint64_t v135 = sub_259DC6D7C(v81, v83, &v136);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v77, v78, "Request columns not available in Planks file: %s", v79, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v80, -1, -1);
      MEMORY[0x25A2EC590](v79, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v128 + 56))(v130, 1, 1, v129);
  }
}

void *sub_259DDCCC4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3270);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259DF7E50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_259DDCE78()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3268);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259DF7E50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_259DDD010(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v31 = a2 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v30 = (unint64_t)(63 - v5) >> 6;
  uint64_t v32 = a1 + 56;
  uint64_t result = swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v12)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (i << 6);
      int64_t v12 = i;
      if (!*(void *)(v4 + 16)) {
        goto LABEL_40;
      }
      goto LABEL_25;
    }
    int64_t v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v12 = i + 1;
    if (!v14)
    {
      int64_t v12 = i + 2;
      if (i + 2 >= v30) {
        goto LABEL_41;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = i + 3;
        if (i + 3 >= v30) {
          goto LABEL_41;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v12);
        if (!v14) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(void *)(v4 + 16))
    {
LABEL_40:
      uint64_t v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    uint64_t v16 = v3;
    unint64_t v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_259DF8150();
    swift_bridgeObjectRetain();
    sub_259DF7B50();
    uint64_t v20 = sub_259DF8170();
    uint64_t v21 = v4;
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = v20 & ~v22;
    if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v24 = *(void *)(v21 + 48);
    uint64_t v25 = (void *)(v24 + 16 * v23);
    BOOL v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_259DF80E0() & 1) == 0)
    {
      uint64_t v27 = ~v22;
      while (1)
      {
        unint64_t v23 = (v23 + 1) & v27;
        if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v24 + 16 * v23);
        BOOL v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_259DF80E0() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      uint64_t v2 = 0;
LABEL_42:
      sub_259DCA2BC();
      return v2;
    }
LABEL_7:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    uint64_t v4 = v21;
  }
  int64_t v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    uint64_t v2 = 1;
    goto LABEL_42;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v15);
  if (v14)
  {
    int64_t v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_259DDD304(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    unint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_259DDD91C(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

uint64_t sub_259DDD4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_259DCA2BC();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_259DF8150();
      swift_bridgeObjectRetain();
      sub_259DF7B50();
      uint64_t v19 = sub_259DF8170();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    unint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_259DF80E0() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        BOOL v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_259DF80E0() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_259DDDAAC((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_259DCA2BC();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_259DDDAAC((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_259DCA2BC();
      MEMORY[0x25A2EC590](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_259DDD91C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_259DF8150();
  swift_bridgeObjectRetain();
  sub_259DF7B50();
  uint64_t v6 = sub_259DF8170();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_259DF80E0() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_259DF80E0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_259DDCCC4();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_259DDE024(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_259DDDAAC(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v38 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_43;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_43;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }
            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_43;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }
              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_43;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v15 = v14 - 1;
                  int64_t v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return sub_259DDDD8C(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
          int64_t v9 = v13;
        }
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_259DF8150();
        swift_bridgeObjectRetain();
        sub_259DF7B50();
        uint64_t v22 = sub_259DF8170();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      uint64_t v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_259DF80E0() & 1) == 0)
      {
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          unint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_259DF80E0() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_29:
      unint64_t v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_259DDDD8C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3270);
  uint64_t result = sub_259DF7E70();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_259DF8150();
    swift_bridgeObjectRetain();
    sub_259DF7B50();
    uint64_t result = sub_259DF8170();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_259DDE024(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_259DF7E40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_259DF8150();
        swift_bridgeObjectRetain();
        sub_259DF7B50();
        uint64_t v10 = sub_259DF8170();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *unint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_259DDE1EC(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_259DDE374((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_259DDE374((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x25A2EC590](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_259DDE374(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_259DF8150();
        swift_bridgeObjectRetain();
        sub_259DF7B50();
        uint64_t v20 = sub_259DF8170();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      BOOL v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_259DF80E0() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_259DF80E0() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    uint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_259DF8150();
    swift_bridgeObjectRetain();
    sub_259DF7B50();
    uint64_t v47 = sub_259DF8170();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_259DF80E0() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_259DDDD8C(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        unint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_259DF80E0() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_259DDE8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_259DE637C(0, v3, 0);
    uint64_t v4 = v13;
    uint64_t v7 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_259DF7B60();
      sub_259DF7B60();
      swift_bridgeObjectRelease();
      unint64_t v9 = *(void *)(v13 + 16);
      unint64_t v8 = *(void *)(v13 + 24);
      if (v9 >= v8 >> 1) {
        sub_259DE637C(v8 > 1, v9 + 1, 1);
      }
      v7 += 16;
      *(void *)(v13 + 16) = v9 + 1;
      uint64_t v10 = v13 + 16 * v9;
      *(void *)(v10 + 32) = a2;
      *(void *)(v10 + 40) = a3;
      --v3;
    }
    while (v3);
  }
  return v4;
}

uint64_t sub_259DDE9D8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_259DDEA28(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v9 = a3[2];
  if (!v9)
  {
LABEL_45:
    *a9 = 1;
    return;
  }
  uint64_t v11 = a3[4];
  if (v11 < 0
    || (uint64_t v12 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        uint64_t v13 = *(void *)(v12 + 16),
        v11 >= v13))
  {
LABEL_27:
    if (qword_26A3F3140 == -1)
    {
LABEL_28:
      uint64_t v30 = sub_259DF7A50();
      __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
      uint64_t v31 = sub_259DF7A30();
      os_log_type_t v32 = sub_259DF7DA0();
      if (os_log_type_enabled(v31, v32))
      {
        BOOL v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v33 = 0;
        _os_log_impl(&dword_259DBD000, v31, v32, "Invalid index", v33, 2u);
        uint64_t v34 = (uint64_t)v33;
        goto LABEL_30;
      }
LABEL_31:

      return;
    }
LABEL_55:
    swift_once();
    goto LABEL_28;
  }
  uint64_t v17 = a3[5];
  uint64_t v47 = v12 + 32;
  uint64_t v48 = *a1;
  uint64_t v45 = a1[1];
  uint64_t v46 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  swift_bridgeObjectRetain();
  uint64_t v18 = 0;
  uint64_t v19 = (char)(a7 - 1);
  uint64_t v20 = a3 + 7;
  while (1)
  {
    if (v11 >= v13)
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v17 < 0 || (uint64_t v21 = v47 + 40 * v11, v22 = *(void *)(v21 + 8), v17 >= *(void *)(v22 + 16)))
    {
LABEL_26:
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    uint64_t v23 = *(void *)(v21 + 32);
    uint64_t v24 = a8 * v23;
    if ((unsigned __int128)(a8 * (__int128)v23) >> 64 != (a8 * v23) >> 63) {
      goto LABEL_50;
    }
    if (v19 > 9) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = qword_259DF8D20[v19];
    }
    if ((unsigned __int128)(v24 * (__int128)v25) >> 64 != (v24 * v25) >> 63) {
      goto LABEL_51;
    }
    uint64_t v26 = *(void *)(v22 + (v17 << 6) + 56);
    if (v26 != v24 * v25)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 == -1) {
        goto LABEL_33;
      }
      goto LABEL_57;
    }
    uint64_t v27 = v18 + v26;
    if (__OFADD__(v18, v26)) {
      goto LABEL_52;
    }
    if (!v48)
    {
      if (v27 > 0)
      {
LABEL_35:
        swift_bridgeObjectRelease();
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v39 = sub_259DF7A50();
        __swift_project_value_buffer(v39, (uint64_t)qword_26A3F63A0);
        uint64_t v31 = sub_259DF7A30();
        os_log_type_t v40 = sub_259DF7DA0();
        if (!os_log_type_enabled(v31, v40)) {
          goto LABEL_31;
        }
        uint64_t v41 = swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 134218240;
        sub_259DF7DE0();
        *(_WORD *)(v41 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v31, v40, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v41, 0x16u);
        uint64_t v38 = v41;
      }
      else
      {
        if (v27 >= v18) {
          goto LABEL_21;
        }
        __break(1u);
LABEL_57:
        swift_once();
LABEL_33:
        uint64_t v35 = sub_259DF7A50();
        __swift_project_value_buffer(v35, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain();
        uint64_t v31 = sub_259DF7A30();
        os_log_type_t v36 = sub_259DF7DA0();
        if (!os_log_type_enabled(v31, v36)) {
          goto LABEL_46;
        }
        uint64_t v37 = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v31, v36, "Found invalid chunk: %lld vs %ld", (uint8_t *)v37, 0x16u);
        uint64_t v38 = v37;
      }
      MEMORY[0x25A2EC590](v38, -1, -1);

      return;
    }
    if (v45 < v27) {
      goto LABEL_35;
    }
    if (v27 < v18) {
      goto LABEL_54;
    }
LABEL_21:
    swift_bridgeObjectRetain();
    sub_259DF7A70();
    if (v28) {
      break;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v24)) {
      goto LABEL_53;
    }
    *a2 += v24;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    uint64_t v11 = *(v20 - 1);
    uint64_t v19 = (char)(a7 - 1);
    if ((v11 & 0x8000000000000000) == 0)
    {
      uint64_t v29 = *v20;
      v20 += 2;
      uint64_t v17 = v29;
      uint64_t v13 = *(void *)(v46 + 16);
      uint64_t v18 = v27;
      if (v11 < v13) {
        continue;
      }
    }
    goto LABEL_26;
  }
  sub_259DC6E50();
  swift_willThrowTypedImpl();
  swift_bridgeObjectRelease();
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_259DF7A50();
  __swift_project_value_buffer(v42, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_259DF7A30();
  os_log_type_t v43 = sub_259DF7DA0();
  if (os_log_type_enabled(v31, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 134218240;
    swift_bridgeObjectRelease();
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2048;
    sub_259DF7DE0();
    _os_log_impl(&dword_259DBD000, v31, v43, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v44, 0x16u);
    uint64_t v34 = v44;
LABEL_30:
    MEMORY[0x25A2EC590](v34, -1, -1);
    goto LABEL_31;
  }
LABEL_46:

  swift_bridgeObjectRelease_n();
}

void sub_259DDF0F0(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v9 = a1[1];
  if (v9 + 0x4000000000000000 < 0)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  uint64_t v11 = a3[2];
  if (!v11) {
    goto LABEL_46;
  }
  uint64_t v12 = a3[4];
  if (v12 < 0
    || (uint64_t v13 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        uint64_t v14 = *(void *)(v13 + 16),
        v12 >= v14))
  {
LABEL_28:
    if (qword_26A3F3140 == -1)
    {
LABEL_29:
      uint64_t v31 = sub_259DF7A50();
      __swift_project_value_buffer(v31, (uint64_t)qword_26A3F63A0);
      os_log_type_t v32 = sub_259DF7A30();
      os_log_type_t v33 = sub_259DF7DA0();
      if (!os_log_type_enabled(v32, v33))
      {
LABEL_32:

        return;
      }
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_259DBD000, v32, v33, "Invalid index", v34, 2u);
      uint64_t v35 = (uint64_t)v34;
LABEL_31:
      MEMORY[0x25A2EC590](v35, -1, -1);
      goto LABEL_32;
    }
LABEL_57:
    swift_once();
    goto LABEL_29;
  }
  uint64_t v18 = a3[5];
  uint64_t v48 = v13 + 32;
  uint64_t v49 = *a1;
  uint64_t v46 = 2 * v9;
  uint64_t v47 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  uint64_t v20 = (char)(a7 - 1);
  uint64_t v21 = a3 + 7;
  while (1)
  {
    if (v12 >= v14)
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
      goto LABEL_55;
    }
    if (v18 < 0 || (uint64_t v22 = v48 + 40 * v12, v23 = *(void *)(v22 + 8), v18 >= *(void *)(v23 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    uint64_t v24 = *(void *)(v22 + 32);
    uint64_t v25 = a8 * v24;
    if ((unsigned __int128)(a8 * (__int128)v24) >> 64 != (a8 * v24) >> 63) {
      goto LABEL_51;
    }
    if (v20 > 9) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = qword_259DF8D20[v20];
    }
    if ((unsigned __int128)(v25 * (__int128)v26) >> 64 != (v25 * v26) >> 63) {
      goto LABEL_52;
    }
    uint64_t v27 = *(void *)(v23 + (v18 << 6) + 56);
    if (v27 != v25 * v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 == -1) {
        goto LABEL_34;
      }
      goto LABEL_59;
    }
    uint64_t v28 = v19 + v27;
    if (__OFADD__(v19, v27)) {
      goto LABEL_53;
    }
    if (!v49)
    {
      if (v28 > 0)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v40 = sub_259DF7A50();
        __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
        os_log_type_t v32 = sub_259DF7A30();
        os_log_type_t v41 = sub_259DF7DA0();
        if (!os_log_type_enabled(v32, v41)) {
          goto LABEL_32;
        }
        uint64_t v42 = swift_slowAlloc();
        *(_DWORD *)uint64_t v42 = 134218240;
        sub_259DF7DE0();
        *(_WORD *)(v42 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v41, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v42, 0x16u);
        uint64_t v39 = v42;
      }
      else
      {
        if (v28 >= v19) {
          goto LABEL_22;
        }
        __break(1u);
LABEL_59:
        swift_once();
LABEL_34:
        uint64_t v36 = sub_259DF7A50();
        __swift_project_value_buffer(v36, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain();
        os_log_type_t v32 = sub_259DF7A30();
        os_log_type_t v37 = sub_259DF7DA0();
        if (!os_log_type_enabled(v32, v37)) {
          goto LABEL_47;
        }
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v37, "Found invalid chunk: %lld vs %ld", (uint8_t *)v38, 0x16u);
        uint64_t v39 = v38;
      }
      MEMORY[0x25A2EC590](v39, -1, -1);

      return;
    }
    if (v46 < v28) {
      goto LABEL_36;
    }
    if (v28 < v19) {
      goto LABEL_56;
    }
LABEL_22:
    swift_bridgeObjectRetain();
    sub_259DF7A70();
    if (v29)
    {
      sub_259DC6E50();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_259DF7A50();
      __swift_project_value_buffer(v43, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      os_log_type_t v32 = sub_259DF7A30();
      os_log_type_t v44 = sub_259DF7DA0();
      if (os_log_type_enabled(v32, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v44, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v45, 0x16u);
        uint64_t v35 = v45;
        goto LABEL_31;
      }
LABEL_47:

      swift_bridgeObjectRelease_n();
      return;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v25)) {
      goto LABEL_54;
    }
    *a2 += v25;
    if (!--v11) {
      break;
    }
    uint64_t v12 = *(v21 - 1);
    uint64_t v20 = (char)(a7 - 1);
    if ((v12 & 0x8000000000000000) == 0)
    {
      uint64_t v30 = *v21;
      v21 += 2;
      uint64_t v18 = v30;
      uint64_t v14 = *(void *)(v47 + 16);
      uint64_t v19 = v28;
      if (v12 < v14) {
        continue;
      }
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  *a9 = 1;
}

void sub_259DDF7CC(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v9 = a1[1];
  if ((unint64_t)(v9 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  uint64_t v11 = a3[2];
  if (!v11) {
    goto LABEL_46;
  }
  uint64_t v12 = a3[4];
  if (v12 < 0
    || (uint64_t v13 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        uint64_t v14 = *(void *)(v13 + 16),
        v12 >= v14))
  {
LABEL_28:
    if (qword_26A3F3140 == -1)
    {
LABEL_29:
      uint64_t v31 = sub_259DF7A50();
      __swift_project_value_buffer(v31, (uint64_t)qword_26A3F63A0);
      os_log_type_t v32 = sub_259DF7A30();
      os_log_type_t v33 = sub_259DF7DA0();
      if (!os_log_type_enabled(v32, v33))
      {
LABEL_32:

        return;
      }
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_259DBD000, v32, v33, "Invalid index", v34, 2u);
      uint64_t v35 = (uint64_t)v34;
LABEL_31:
      MEMORY[0x25A2EC590](v35, -1, -1);
      goto LABEL_32;
    }
LABEL_57:
    swift_once();
    goto LABEL_29;
  }
  uint64_t v18 = a3[5];
  uint64_t v47 = *a1;
  uint64_t v46 = 4 * v9;
  swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  uint64_t v20 = (char)(a7 - 1);
  uint64_t v21 = a3 + 7;
  while (1)
  {
    if (v12 >= v14)
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
      goto LABEL_55;
    }
    if (v18 < 0 || (uint64_t v22 = v13 + 32 + 40 * v12, v23 = *(void *)(v22 + 8), v18 >= *(void *)(v23 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    uint64_t v24 = *(void *)(v22 + 32);
    uint64_t v25 = a8 * v24;
    if ((unsigned __int128)(a8 * (__int128)v24) >> 64 != (a8 * v24) >> 63) {
      goto LABEL_51;
    }
    if (v20 > 9) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = qword_259DF8D20[v20];
    }
    if ((unsigned __int128)(v25 * (__int128)v26) >> 64 != (v25 * v26) >> 63) {
      goto LABEL_52;
    }
    uint64_t v27 = *(void *)(v23 + (v18 << 6) + 56);
    if (v27 != v25 * v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 == -1) {
        goto LABEL_34;
      }
      goto LABEL_59;
    }
    uint64_t v28 = v19 + v27;
    if (__OFADD__(v19, v27)) {
      goto LABEL_53;
    }
    if (!v47)
    {
      if (v28 > 0)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v40 = sub_259DF7A50();
        __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
        os_log_type_t v32 = sub_259DF7A30();
        os_log_type_t v41 = sub_259DF7DA0();
        if (!os_log_type_enabled(v32, v41)) {
          goto LABEL_32;
        }
        uint64_t v42 = swift_slowAlloc();
        *(_DWORD *)uint64_t v42 = 134218240;
        sub_259DF7DE0();
        *(_WORD *)(v42 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v41, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v42, 0x16u);
        uint64_t v39 = v42;
      }
      else
      {
        if (v28 >= v19) {
          goto LABEL_22;
        }
        __break(1u);
LABEL_59:
        swift_once();
LABEL_34:
        uint64_t v36 = sub_259DF7A50();
        __swift_project_value_buffer(v36, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain();
        os_log_type_t v32 = sub_259DF7A30();
        os_log_type_t v37 = sub_259DF7DA0();
        if (!os_log_type_enabled(v32, v37)) {
          goto LABEL_47;
        }
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v37, "Found invalid chunk: %lld vs %ld", (uint8_t *)v38, 0x16u);
        uint64_t v39 = v38;
      }
      MEMORY[0x25A2EC590](v39, -1, -1);

      return;
    }
    if (v46 < v28) {
      goto LABEL_36;
    }
    if (v28 < v19) {
      goto LABEL_56;
    }
LABEL_22:
    swift_bridgeObjectRetain();
    sub_259DF7A70();
    if (v29)
    {
      sub_259DC6E50();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_259DF7A50();
      __swift_project_value_buffer(v43, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      os_log_type_t v32 = sub_259DF7A30();
      os_log_type_t v44 = sub_259DF7DA0();
      if (os_log_type_enabled(v32, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v44, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v45, 0x16u);
        uint64_t v35 = v45;
        goto LABEL_31;
      }
LABEL_47:

      swift_bridgeObjectRelease_n();
      return;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v25)) {
      goto LABEL_54;
    }
    *a2 += v25;
    if (!--v11) {
      break;
    }
    uint64_t v12 = *(v21 - 1);
    uint64_t v20 = (char)(a7 - 1);
    if ((v12 & 0x8000000000000000) == 0)
    {
      uint64_t v30 = *v21;
      v21 += 2;
      uint64_t v18 = v30;
      uint64_t v14 = *(void *)(v13 + 16);
      uint64_t v19 = v28;
      if (v12 < v14) {
        continue;
      }
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  *a9 = 1;
}

void sub_259DDFEAC(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v9 = a1[1];
  if ((unint64_t)(v9 - 0x1000000000000000) >> 61 != 7)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  uint64_t v11 = a3[2];
  if (!v11) {
    goto LABEL_46;
  }
  uint64_t v12 = a3[4];
  if (v12 < 0
    || (uint64_t v13 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        uint64_t v14 = *(void *)(v13 + 16),
        v12 >= v14))
  {
LABEL_28:
    if (qword_26A3F3140 == -1)
    {
LABEL_29:
      uint64_t v31 = sub_259DF7A50();
      __swift_project_value_buffer(v31, (uint64_t)qword_26A3F63A0);
      os_log_type_t v32 = sub_259DF7A30();
      os_log_type_t v33 = sub_259DF7DA0();
      if (!os_log_type_enabled(v32, v33))
      {
LABEL_32:

        return;
      }
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_259DBD000, v32, v33, "Invalid index", v34, 2u);
      uint64_t v35 = (uint64_t)v34;
LABEL_31:
      MEMORY[0x25A2EC590](v35, -1, -1);
      goto LABEL_32;
    }
LABEL_57:
    swift_once();
    goto LABEL_29;
  }
  uint64_t v18 = a3[5];
  uint64_t v47 = *a1;
  uint64_t v46 = 8 * v9;
  swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  uint64_t v20 = (char)(a7 - 1);
  uint64_t v21 = a3 + 7;
  while (1)
  {
    if (v12 >= v14)
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
      goto LABEL_55;
    }
    if (v18 < 0 || (uint64_t v22 = v13 + 32 + 40 * v12, v23 = *(void *)(v22 + 8), v18 >= *(void *)(v23 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    uint64_t v24 = *(void *)(v22 + 32);
    uint64_t v25 = a8 * v24;
    if ((unsigned __int128)(a8 * (__int128)v24) >> 64 != (a8 * v24) >> 63) {
      goto LABEL_51;
    }
    if (v20 > 9) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = qword_259DF8D20[v20];
    }
    if ((unsigned __int128)(v25 * (__int128)v26) >> 64 != (v25 * v26) >> 63) {
      goto LABEL_52;
    }
    uint64_t v27 = *(void *)(v23 + (v18 << 6) + 56);
    if (v27 != v25 * v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 == -1) {
        goto LABEL_34;
      }
      goto LABEL_59;
    }
    uint64_t v28 = v19 + v27;
    if (__OFADD__(v19, v27)) {
      goto LABEL_53;
    }
    if (!v47)
    {
      if (v28 > 0)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v40 = sub_259DF7A50();
        __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
        os_log_type_t v32 = sub_259DF7A30();
        os_log_type_t v41 = sub_259DF7DA0();
        if (!os_log_type_enabled(v32, v41)) {
          goto LABEL_32;
        }
        uint64_t v42 = swift_slowAlloc();
        *(_DWORD *)uint64_t v42 = 134218240;
        sub_259DF7DE0();
        *(_WORD *)(v42 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v41, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v42, 0x16u);
        uint64_t v39 = v42;
      }
      else
      {
        if (v28 >= v19) {
          goto LABEL_22;
        }
        __break(1u);
LABEL_59:
        swift_once();
LABEL_34:
        uint64_t v36 = sub_259DF7A50();
        __swift_project_value_buffer(v36, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain();
        os_log_type_t v32 = sub_259DF7A30();
        os_log_type_t v37 = sub_259DF7DA0();
        if (!os_log_type_enabled(v32, v37)) {
          goto LABEL_47;
        }
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v37, "Found invalid chunk: %lld vs %ld", (uint8_t *)v38, 0x16u);
        uint64_t v39 = v38;
      }
      MEMORY[0x25A2EC590](v39, -1, -1);

      return;
    }
    if (v46 < v28) {
      goto LABEL_36;
    }
    if (v28 < v19) {
      goto LABEL_56;
    }
LABEL_22:
    swift_bridgeObjectRetain();
    sub_259DF7A70();
    if (v29)
    {
      sub_259DC6E50();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_259DF7A50();
      __swift_project_value_buffer(v43, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      os_log_type_t v32 = sub_259DF7A30();
      os_log_type_t v44 = sub_259DF7DA0();
      if (os_log_type_enabled(v32, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 134218240;
        swift_bridgeObjectRelease();
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2048;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v32, v44, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v45, 0x16u);
        uint64_t v35 = v45;
        goto LABEL_31;
      }
LABEL_47:

      swift_bridgeObjectRelease_n();
      return;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v25)) {
      goto LABEL_54;
    }
    *a2 += v25;
    if (!--v11) {
      break;
    }
    uint64_t v12 = *(v21 - 1);
    uint64_t v20 = (char)(a7 - 1);
    if ((v12 & 0x8000000000000000) == 0)
    {
      uint64_t v30 = *v21;
      v21 += 2;
      uint64_t v18 = v30;
      uint64_t v14 = *(void *)(v13 + 16);
      uint64_t v19 = v28;
      if (v12 < v14) {
        continue;
      }
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  *a9 = 1;
}

unint64_t sub_259DE058C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3578);
  int64_t v2 = (void *)sub_259DF7F90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 72);
  while (1)
  {
    uint64_t v5 = *(v4 - 5);
    uint64_t v6 = *(v4 - 4);
    uint64_t v8 = *(v4 - 3);
    uint64_t v7 = *(v4 - 2);
    char v9 = *((unsigned char *)v4 - 8);
    uint64_t v10 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_259DC840C(v5, v6);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v13 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v13 = v5;
    v13[1] = v6;
    uint64_t v14 = v2[7] + 32 * result;
    *(void *)uint64_t v14 = v8;
    *(void *)(v14 + 8) = v7;
    *(unsigned char *)(v14 + 16) = v9;
    *(void *)(v14 + 24) = v10;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v4 += 6;
    v2[2] = v17;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_259DE06CC(uint64_t a1)
{
  return sub_259DE06E4(a1, &qword_26A3F3588);
}

unint64_t sub_259DE06D8(uint64_t a1)
{
  return sub_259DE06E4(a1, &qword_26A3F3580);
}

unint64_t sub_259DE06E4(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_259DF7F90();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_259DC840C(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_259DE07FC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3568);
  int64_t v2 = (void *)sub_259DF7F90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_259DC840C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t PlanksWriter.filePath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  uint64_t v4 = sub_259DF7AE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_259DE0994@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  uint64_t v7 = v3[2];
  uint64_t v6 = v3[3];
  *a2 = v5;
  a2[1] = v4;
  a2[2] = v7;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_259DE0A0C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = (void *)(*a2 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  *uint64_t v6 = v3;
  v6[1] = v2;
  v6[2] = v4;
  v6[3] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DE0AB4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  uint64_t v7 = v3[2];
  uint64_t v6 = v3[3];
  *a1 = v5;
  a1[1] = v4;
  a1[2] = v7;
  a1[3] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t PlanksWriter.__allocating_init(filePath:append:)(uint64_t a1, unint64_t a2, int a3)
{
  return PlanksWriter.init(filePath:append:)(a1, a2, a3);
}

uint64_t PlanksWriter.init(filePath:append:)(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v4 = v3;
  LODWORD(v82) = a3;
  uint64_t v80 = sub_259DF7800();
  uint64_t v7 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  char v9 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_259DF7820();
  uint64_t v10 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v12 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259DF7AE0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  BOOL v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) = 0;
  swift_bridgeObjectRetain();
  uint64_t v76 = a1;
  unint64_t v81 = a2;
  sub_259DF7AF0();
  uint64_t v17 = v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  uint64_t v77 = v14;
  uint64_t v18 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  uint64_t v78 = v13;
  v18(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath, v16, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3548);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259DF86A0;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x8000000259DFA2D0;
  sub_259DF7810();
  sub_259DE1930((uint64_t)v9);
  uint64_t v20 = sub_259DF77A0();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v80);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v79);
  *(void *)(inited + 48) = v20;
  *(void *)(inited + 56) = v22;
  uint64_t v23 = inited;
  LOBYTE(inited) = (_BYTE)v82;
  unint64_t v24 = sub_259DE07FC(v23);
  uint64_t v25 = MEMORY[0x263F8EE78];
  sub_259DE07FC(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  uint64_t v26 = (void *)(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  *uint64_t v26 = 1;
  v26[1] = v25;
  v26[2] = v25;
  v26[3] = v24;
  if (inited) {
    int v27 = 520;
  }
  else {
    int v27 = 1536;
  }
  int v83 = 2;
  int v84 = v27;
  int v85 = 16777652;
  uint64_t v80 = v17;
  sub_259DF7AD0();
  uint64_t v80 = v4;
  *(_DWORD *)(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_fd) = v87;
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_259DF7A50();
  __swift_project_value_buffer(v28, (uint64_t)qword_26A3F63A0);
  unint64_t v29 = v81;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_259DF7A30();
  os_log_type_t v31 = sub_259DF7D90();
  if (os_log_type_enabled(v30, v31))
  {
    os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v87 = v33;
    *(_DWORD *)os_log_type_t v32 = 136315138;
    unint64_t v29 = v81;
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_259DC6D7C(v76, v29, &v87);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v30, v31, "PlanksWriter file path: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v33, -1, -1);
    MEMORY[0x25A2EC590](v32, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  char v36 = (char)v82;
  uint64_t v34 = v80;
  uint64_t v37 = sub_259DF7A90();
  uint64_t v38 = v37;
  if (v39)
  {
    LODWORD(v87) = v37;
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_259DF7A30();
    os_log_type_t v44 = sub_259DF7DA0();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v46 = v76;
    if (!v45)
    {

      swift_bridgeObjectRelease_n();
      return v34;
    }
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v87 = v48;
    *(_DWORD *)uint64_t v47 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_259DC6D7C(v46, v29, &v87);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v43, v44, "Failed at seeking file: %s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v49 = v48;
    goto LABEL_17;
  }
  uint64_t v40 = v76;
  if ((v36 & 1) == 0 || !v37)
  {
    sub_259DE47C8();
    swift_bridgeObjectRelease();
LABEL_28:
    swift_retain_n();
    uint64_t v43 = sub_259DF7A30();
    os_log_type_t v65 = sub_259DF7D90();
    if (!os_log_type_enabled(v43, v65))
    {

      swift_release_n();
      return v34;
    }
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    uint64_t v92 = v66;
    *(_DWORD *)uint64_t v47 = 136315138;
    unint64_t v82 = v47 + 4;
    uint64_t v67 = (uint64_t *)(v34 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
    swift_beginAccess();
    uint64_t v68 = *v67;
    uint64_t v69 = v67[1];
    uint64_t v71 = v67[2];
    uint64_t v70 = v67[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_259DC671C(v68, v69, v71, v70);
    unint64_t v74 = v73;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v34 = v80;
    swift_bridgeObjectRelease();
    uint64_t v91 = sub_259DC6D7C(v72, v74, &v92);
    sub_259DF7DE0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259DBD000, v43, v65, "PlanksWriter file metadata: %s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v49 = v66;
LABEL_17:
    MEMORY[0x25A2EC590](v49, -1, -1);
    MEMORY[0x25A2EC590](v47, -1, -1);

    return v34;
  }
  uint64_t v41 = sub_259DC94E4();
  if ((v42 & 1) == 0)
  {
    uint64_t v50 = v41;
    type metadata accessor for PlanksReader();
    static PlanksReader.readMetadata(_:metadataSize:)(v50, (uint64_t)&v87);
    uint64_t v51 = v88;
    if (v88)
    {
      uint64_t v52 = v87;
      uint64_t v53 = v34;
      uint64_t v54 = v89;
      uint64_t v55 = v90;
      swift_bridgeObjectRelease();
      uint64_t v56 = (uint64_t *)(v53 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
      swift_beginAccess();
      uint64_t *v56 = v52;
      v56[1] = v51;
      v56[2] = v54;
      v56[3] = v55;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v57 = sub_259DF7A30();
      os_log_type_t v58 = sub_259DF7D90();
      if (os_log_type_enabled(v57, v58))
      {
        int64_t v59 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)int64_t v59 = 134217984;
        uint64_t v87 = v38;
        sub_259DF7DE0();
        _os_log_impl(&dword_259DBD000, v57, v58, "PlanksWriter existing file size: %lld", v59, 0xCu);
        MEMORY[0x25A2EC590](v59, -1, -1);
      }

      uint64_t v34 = v80;
      goto LABEL_28;
    }
  }
  unint64_t v60 = v81;
  swift_bridgeObjectRetain();
  uint64_t v61 = sub_259DF7A30();
  os_log_type_t v62 = sub_259DF7DA0();
  if (os_log_type_enabled(v61, v62))
  {
    int64_t v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v87 = v64;
    *(_DWORD *)int64_t v63 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_259DC6D7C(v40, v60, &v87);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v61, v62, "Failed at reading existing file: %s", v63, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v64, -1, -1);
    MEMORY[0x25A2EC590](v63, -1, -1);
    swift_release();
  }
  else
  {
    swift_release();

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_259DE1930@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3570);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v29 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_259DF7840();
  uint64_t v3 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_259DF77F0();
  uint64_t v5 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259DF77D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_259DF77B0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_259DF77C0();
  MEMORY[0x270FA5388](v16);
  (*(void (**)(char *, void))(v18 + 104))((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F072A0]);
  uint64_t v19 = v12;
  uint64_t v20 = v28;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F07288], v19);
  uint64_t v21 = v7;
  uint64_t v22 = v29;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F072B8], v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v21, *MEMORY[0x263F072C8], v27);
  sub_259DF7830();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v22, 1, v20);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v25, v22, v20);
    return sub_259DF77E0();
  }
  return result;
}

uint64_t static PlanksWriter.initializeFile(fd:)()
{
  return sub_259DE47C8();
}

uint64_t PlanksWriter.deinit()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) & 1) == 0) {
    sub_259DE2160();
  }
  if ((sub_259DF7AA0() & 0x100000000) != 0)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  uint64_t v2 = sub_259DF7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlanksWriter.__deallocating_deinit()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) & 1) == 0) {
    sub_259DE2160();
  }
  if ((sub_259DF7AA0() & 0x100000000) != 0)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
  }
  uint64_t v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  uint64_t v2 = sub_259DF7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_259DE1F58()
{
  uint64_t v1 = (void *)sub_259DE058C(MEMORY[0x263F8EE78]);
  uint64_t v2 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)(v2 + 8) + 16);
  if (!v3) {
    return (uint64_t)v1;
  }
  uint64_t v4 = (void *)(swift_bridgeObjectRetain() + 56);
  while (1)
  {
    uint64_t v25 = v3;
    uint64_t v7 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    char v8 = *((unsigned char *)v4 - 8);
    uint64_t v9 = *v4;
    swift_bridgeObjectRetain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v12 = sub_259DC840C(v7, v6);
    uint64_t v13 = v1[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      break;
    }
    char v16 = v11;
    if (v1[3] >= v15)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v11) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_259DE3C30();
        if (v16) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_259DE3114(v15, isUniquelyReferenced_nonNull_native);
      unint64_t v17 = sub_259DC840C(v7, v6);
      if ((v16 & 1) != (v18 & 1)) {
        goto LABEL_20;
      }
      unint64_t v12 = v17;
      if (v16)
      {
LABEL_3:
        uint64_t v5 = v1[7] + 32 * v12;
        swift_bridgeObjectRelease();
        *(void *)uint64_t v5 = v7;
        *(void *)(v5 + 8) = v6;
        *(unsigned char *)(v5 + 16) = v8;
        *(void *)(v5 + 24) = v9;
        goto LABEL_4;
      }
    }
    v1[(v12 >> 6) + 8] |= 1 << v12;
    uint64_t v19 = (uint64_t *)(v1[6] + 16 * v12);
    *uint64_t v19 = v7;
    v19[1] = v6;
    uint64_t v20 = v1[7] + 32 * v12;
    *(void *)uint64_t v20 = v7;
    *(void *)(v20 + 8) = v6;
    *(unsigned char *)(v20 + 16) = v8;
    *(void *)(v20 + 24) = v9;
    uint64_t v21 = v1[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_19;
    }
    v1[2] = v23;
    swift_bridgeObjectRetain();
LABEL_4:
    v4 += 4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = v25 - 1;
    if (v25 == 1)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = sub_259DF8130();
  __break(1u);
  return result;
}

void sub_259DE2160()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_259DF7800();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v67 = (unint64_t)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v68 = sub_259DF7820();
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  os_log_type_t v65 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_259DF7A50();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A3F63A0);
  swift_retain_n();
  uint64_t v64 = v9;
  uint64_t v10 = sub_259DF7A30();
  os_log_type_t v11 = sub_259DF7D90();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v63 = v13;
    *(_DWORD *)unint64_t v12 = 136315138;
    *(void *)&long long v70 = v13;
    uint64_t v61 = v12 + 4;
    os_log_type_t v62 = v12;
    sub_259DF7AE0();
    sub_259DC9708();
    uint64_t v2 = v1;
    uint64_t v14 = sub_259DF80A0();
    uint64_t v69 = sub_259DC6D7C(v14, v15, (uint64_t *)&v70);
    sub_259DF7DE0();
    swift_release_n();
    swift_bridgeObjectRelease();
    char v16 = v62;
    _os_log_impl(&dword_259DBD000, v10, v11, "PlanksWriter: finalizing %s", v62, 0xCu);
    uint64_t v17 = v63;
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v17, -1, -1);
    MEMORY[0x25A2EC590](v16, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v18 = v3;
  uint64_t v19 = v65;
  sub_259DF7810();
  uint64_t v20 = v67;
  sub_259DE1930(v67);
  uint64_t v21 = sub_259DF77A0();
  uint64_t v23 = v22;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v20, v4);
  (*(void (**)(char *, unint64_t))(v66 + 8))(v19, v68);
  uint64_t v24 = (uint64_t *)(v18 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v69 = v24[3];
  v24[3] = 0x8000000000000000;
  sub_259DE3AA8(v21, v23, 0xD000000000000014, 0x8000000259DFA2F0, isUniquelyReferenced_nonNull_native);
  v24[3] = v69;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_259DF7720();
  swift_allocObject();
  sub_259DF7710();
  uint64_t v26 = *v24;
  uint64_t v27 = v24[1];
  uint64_t v29 = v24[2];
  uint64_t v28 = v24[3];
  *(void *)&long long v70 = v26;
  *((void *)&v70 + 1) = v27;
  uint64_t v71 = v29;
  uint64_t v72 = v28;
  sub_259DE48D4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_259DF7700();
  if (v2)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v32 = v30;
    unint64_t v33 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    LODWORD(v34) = 0;
    switch(v33 >> 62)
    {
      case 1uLL:
        if (!__OFSUB__(HIDWORD(v32), v32))
        {
          unint64_t v34 = HIDWORD(v32) - (int)v32;
          goto LABEL_13;
        }
        __break(1u);
        goto LABEL_40;
      case 2uLL:
        uint64_t v36 = *(void *)(v32 + 16);
        uint64_t v35 = *(void *)(v32 + 24);
        unint64_t v34 = v35 - v36;
        if (__OFSUB__(v35, v36))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          swift_once();
        }
        else
        {
LABEL_13:
          if ((v34 & 0x8000000000000000) != 0 || HIDWORD(v34))
          {
            sub_259DF7F40();
            __break(1u);
            JUMPOUT(0x259DE2C64);
          }
LABEL_15:
          unint64_t v68 = sub_259DE2C84();
          int v37 = sub_259DF7A90();
          if (v38)
          {
            int v39 = v37;
            LODWORD(v70) = v37;
            sub_259DC6E50();
            swift_willThrowTypedImpl();
            swift_allocError();
            _DWORD *v40 = v39;
            goto LABEL_19;
          }
          switch(v33 >> 62)
          {
            case 0uLL:
              *(void *)&long long v70 = v32;
              WORD4(v70) = v33;
              BYTE10(v70) = BYTE2(v33);
              BYTE11(v70) = BYTE3(v33);
              BYTE12(v70) = BYTE4(v33);
              BYTE13(v70) = BYTE5(v33);
              swift_retain_n();
              goto LABEL_22;
            case 1uLL:
              if (v32 >> 32 < (int)v32) {
                goto LABEL_41;
              }
              unint64_t v67 = v33 & 0x3FFFFFFFFFFFFFFFLL;
              swift_retain_n();
              sub_259DE4984(v32, v33);
              sub_259DE46D4((int)v32, v32 >> 32);
              sub_259DC9804(v32, v33);
              goto LABEL_26;
            case 2uLL:
              uint64_t v41 = *(void *)(v32 + 16);
              uint64_t v42 = *(void *)(v32 + 24);
              swift_retain_n();
              swift_retain();
              swift_retain();
              sub_259DE46D4(v41, v42);
              swift_release_n();
              swift_release();
              swift_release();
              goto LABEL_27;
            case 3uLL:
              *(void *)((char *)&v70 + 6) = 0;
              *(void *)&long long v70 = 0;
              swift_retain_n();
LABEL_22:
              int v43 = sub_259DF7AB0();
              if (v44)
              {
                int v45 = v43;
                LODWORD(v69) = v43;
                sub_259DC6E50();
                swift_willThrowTypedImpl();
                swift_allocError();
                *uint64_t v46 = v45;
                sub_259DC9804(v32, v33);
                swift_release_n();
                goto LABEL_36;
              }
LABEL_26:
              swift_release_n();
LABEL_27:
              LODWORD(v70) = v34;
              *(void *)&long long v70 = sub_259DE42A8(0, 4, (uint64_t)&v70, (uint64_t)&v70 + 4);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F34F0);
              sub_259DE4928();
              int v47 = sub_259DF7AC0();
              if (v48)
              {
                int v57 = v47;
                LODWORD(v69) = v47;
                sub_259DC6E50();
                swift_willThrowTypedImpl();
                swift_allocError();
                _DWORD *v58 = v57;
                sub_259DC9804(v32, v33);
                swift_release();
                goto LABEL_36;
              }
              swift_release();
              if (qword_26A3F3148 != -1) {
                goto LABEL_42;
              }
              break;
            default:
              JUMPOUT(0);
          }
        }
        int v49 = sub_259DF7AB0();
        if ((v50 & 1) == 0)
        {
          uint64_t v51 = sub_259DF7A30();
          os_log_type_t v52 = sub_259DF7D90();
          if (os_log_type_enabled(v51, v52))
          {
            uint64_t v53 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v53 = 134217984;
            *(void *)&long long v70 = v68;
            sub_259DF7DE0();
            _os_log_impl(&dword_259DBD000, v51, v52, "PlanksWriter: metadata offset: %lld", v53, 0xCu);
            MEMORY[0x25A2EC590](v53, -1, -1);
          }

          uint64_t v54 = sub_259DF7A30();
          os_log_type_t v55 = sub_259DF7D90();
          if (os_log_type_enabled(v54, v55))
          {
            uint64_t v56 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v56 = 67109120;
            LODWORD(v70) = v34;
            sub_259DF7DE0();
            _os_log_impl(&dword_259DBD000, v54, v55, "PlanksWriter: metadata size: %u", v56, 8u);
            MEMORY[0x25A2EC590](v56, -1, -1);
          }
          sub_259DC9804(v32, v33);
          swift_release();

          break;
        }
        int v59 = v49;
        LODWORD(v70) = v49;
        sub_259DC6E50();
        swift_willThrowTypedImpl();
        swift_allocError();
        *unint64_t v60 = v59;
LABEL_19:
        sub_259DC9804(v32, v33);
LABEL_36:
        swift_release();
        break;
      case 3uLL:
        goto LABEL_15;
      default:
        LODWORD(v34) = BYTE6(v33);
        goto LABEL_15;
    }
  }
  *(unsigned char *)(v18 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) = 1;
}

unint64_t sub_259DE2C84()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  unint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 40 * v4;
    uint64_t v6 = *(void *)(v5 + 8);
    uint64_t v7 = *(void *)(v5 + 16);
    BOOL v8 = __OFADD__(v6, v7);
    uint64_t v9 = v6 + v7;
    if (v8)
    {
      __break(1u);
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v9 = 4;
  }
  BOOL v8 = __OFADD__(v9, 4);
  uint64_t v10 = v9 + 4;
  if (v8)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v12 = v10 - 1;
  BOOL v11 = v10 < 1;
  uint64_t v13 = v10 + 2;
  if (!v11) {
    uint64_t v13 = v12;
  }
  return v13 & 0xFFFFFFFFFFFFFFFCLL;
}

double sub_259DE2D14@<D0>(uint64_t a1@<X2>, uint64_t a2@<X3>, unint64_t a3@<X4>, char a4@<W5>, uint64_t a5@<X8>)
{
  if (a4) {
    a3 = sub_259DE2C84();
  }
  sub_259DF7A90();
  if (v9)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
  }
  uint64_t v10 = sub_259DF7AB0();
  if (v11)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_259DF7A50();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A3F63A0);
    uint64_t v14 = sub_259DF7A30();
    os_log_type_t v15 = sub_259DF7DA0();
    if (os_log_type_enabled(v14, v15))
    {
      char v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v16 = 0;
      _os_log_impl(&dword_259DBD000, v14, v15, "Failed at writing column chunk data.", v16, 2u);
      MEMORY[0x25A2EC590](v16, -1, -1);
    }

    double result = 0.0;
    *(_OWORD *)(a5 + 42) = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
    *(_OWORD *)(a5 + 32) = 0u;
    *(_OWORD *)a5 = 0u;
  }
  else
  {
    *(void *)a5 = a1;
    *(void *)(a5 + 8) = a2;
    *(void *)(a5 + 16) = a3;
    *(void *)(a5 + 24) = v10;
    *(void *)(a5 + 40) = 0;
    *(void *)(a5 + 48) = 0;
    *(void *)(a5 + 32) = 0;
    *(_WORD *)(a5 + 56) = 12;
    swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_259DE2ECC()
{
  return swift_release();
}

uint64_t type metadata accessor for PlanksWriter()
{
  uint64_t result = qword_26A3F3558;
  if (!qword_26A3F3558) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259DE3114(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3578);
  char v42 = a2;
  uint64_t v6 = sub_259DF7F80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v40 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v38 = v2;
  int64_t v39 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v39) {
      break;
    }
    uint64_t v23 = v40;
    unint64_t v24 = v40[v22];
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v39) {
        goto LABEL_33;
      }
      unint64_t v24 = v40[v13];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v38;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v39) {
              goto LABEL_33;
            }
            unint64_t v24 = v40[v13];
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 32 * v21;
    uint64_t v34 = *(void *)v33;
    uint64_t v35 = *(void *)(v33 + 8);
    char v43 = *(unsigned char *)(v33 + 16);
    uint64_t v36 = *(void *)(v33 + 24);
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_259DF8150();
    sub_259DF7B50();
    uint64_t result = sub_259DF8170();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 32 * v17;
    *(void *)uint64_t v19 = v34;
    *(void *)(v19 + 8) = v35;
    *(unsigned char *)(v19 + 16) = v43;
    *(void *)(v19 + 24) = v36;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v38;
  uint64_t v23 = v40;
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
  if (v37 >= 64) {
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v37;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_259DE3454(uint64_t a1, char a2)
{
  return sub_259DE346C(a1, a2, &qword_26A3F3588);
}

uint64_t sub_259DE3460(uint64_t a1, char a2)
{
  return sub_259DE346C(a1, a2, &qword_26A3F3580);
}

uint64_t sub_259DE346C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_259DF7F80();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_259DF8150();
    sub_259DF7B50();
    uint64_t result = sub_259DF8170();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_259DE3780(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3568);
  char v42 = a2;
  uint64_t v6 = sub_259DF7F80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    int64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_259DF8150();
    sub_259DF7B50();
    uint64_t result = sub_259DF8170();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_259DE3AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_259DC840C(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_259DE3FC8();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_259DE3780(v17, a5 & 1);
  unint64_t v23 = sub_259DC840C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_259DF8130();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *unint64_t v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  *int64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

void *sub_259DE3C30()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3578);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259DF7F70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v6 + 8 * v9);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    char v24 = *(unsigned char *)(v21 + 16);
    uint64_t v25 = *(void *)(v21 + 24);
    int64_t v26 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v26 = v19;
    v26[1] = v18;
    uint64_t v27 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v27 = v22;
    *(void *)(v27 + 8) = v23;
    *(unsigned char *)(v27 + 16) = v24;
    *(void *)(v27 + 24) = v25;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v13) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v6 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_259DE3E00()
{
  return sub_259DE3E18(&qword_26A3F3588);
}

void *sub_259DE3E0C()
{
  return sub_259DE3E18(&qword_26A3F3580);
}

void *sub_259DE3E18(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_259DF7F70();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_259DE3FC8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3568);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259DF7F70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    unint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *unint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_259DE4184(char *a1, int64_t a2)
{
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3278);
    uint64_t v4 = (char *)swift_allocObject();
    size_t v5 = _swift_stdlib_malloc_size(v4);
    *((void *)v4 + 2) = a2;
    *((void *)v4 + 3) = 2 * v5 - 64;
    uint64_t v6 = v4 + 32;
    if (&v4[a2 + 32] <= a1 || v6 >= &a1[a2])
    {
      memcpy(v6, a1, a2);
      return (uint64_t)v4;
    }
  }
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

int64_t sub_259DE42A8(int64_t result, int64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v4 = a4 - a3;
  if (!a3) {
    int64_t v4 = 0;
  }
  if (result < 0 || (int64_t v5 = result, v4 < result))
  {
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (a2 < 0 || v4 < a2) {
    goto LABEL_20;
  }
  uint64_t v6 = a2 - result;
  if (a2 == result) {
    return MEMORY[0x263F8EE78];
  }
  if (v6 <= 0)
  {
    unint64_t v7 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3278);
    unint64_t v7 = (void *)swift_allocObject();
    uint64_t result = _swift_stdlib_malloc_size(v7);
    v7[2] = v6;
    v7[3] = 2 * result - 64;
  }
  uint64_t v10 = MEMORY[0x270FA5388](result);
  MEMORY[0x270FA5388](v10);
  uint64_t result = (int64_t)sub_259DE4574(a3, a4, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_259DE4BA0);
  uint64_t v12 = v5 + v11;
  if (__OFADD__(v5, v11)) {
    goto LABEL_21;
  }
  uint64_t v13 = a4 - a3;
  if (!a3) {
    uint64_t v13 = 0;
  }
  if (v12 < 0 || v13 < v12) {
    goto LABEL_22;
  }
  if (v11 == v6) {
    return (int64_t)v7;
  }
LABEL_23:
  __break(1u);
  return result;
}

char *sub_259DE444C(char *__src, int64_t a2, char *__dst, int64_t a4)
{
  int64_t v4 = __src;
  if (!a2 || !a4) {
    return v4;
  }
  if (a2 >= a4) {
    size_t v5 = a4;
  }
  else {
    size_t v5 = a2;
  }
  if ((v5 & 0x8000000000000000) == 0 && (&__dst[v5] <= __src || &__src[v5] <= __dst))
  {
    memcpy(__dst, __src, v5);
    v4 += v5;
    return v4;
  }
  uint64_t result = (char *)sub_259DF7FA0();
  __break(1u);
  return result;
}

void *sub_259DE4574(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

uint64_t sub_259DE45CC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 - a3;
  if (!a3) {
    uint64_t v4 = 0;
  }
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0 && v4 >= a2)
  {
    return a2 - result;
  }
  __break(1u);
  return result;
}

void *sub_259DE4600@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, void *(*a3)(long long *__return_ptr, uint64_t, void *)@<X3>, _OWORD *a4@<X8>)
{
  uint64_t v19 = a4;
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v10 = a2[2];
  uint64_t v9 = a2[3];
  uint64_t v11 = sub_259DE45CC(0, *a2, v10, v9);
  uint64_t result = (void *)sub_259DE45CC(v7, v8, v10, v9);
  if (__OFADD__(v11, result))
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v13 = result;
  if ((uint64_t)result + v11 < v11)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (a1) {
    uint64_t v14 = a1 + v11;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t result = a3(&v17, v14, v13);
  if (!v4)
  {
    uint64_t v15 = v18;
    uint64_t v16 = v19;
    *uint64_t v19 = v17;
    *((void *)v16 + 2) = v15;
  }
  return result;
}

uint64_t sub_259DE46D4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_259DF7750();
  if (result)
  {
    uint64_t result = sub_259DF7770();
    if (__OFSUB__(a1, result)) {
      goto LABEL_8;
    }
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  sub_259DF7760();
  uint64_t v5 = sub_259DF7AB0();
  if (v6)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    swift_allocError();
    *uint64_t v7 = v5;
  }
  return v5;
}

uint64_t sub_259DE47C8()
{
  uint64_t v0 = sub_259DF7A90();
  if (v1)
  {
    uint64_t v4 = v0;
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    uint64_t v2 = v4;
    goto LABEL_7;
  }
  if (qword_26A3F3148 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259DF7AB0();
  if (v3)
  {
    sub_259DC6E50();
    swift_willThrowTypedImpl();
LABEL_7:
    swift_allocError();
    *uint64_t v5 = v2;
  }
  return v2;
}

unint64_t sub_259DE48D4()
{
  unint64_t result = qword_26A3F3550;
  if (!qword_26A3F3550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3550);
  }
  return result;
}

unint64_t sub_259DE4928()
{
  unint64_t result = qword_26A3F34F8;
  if (!qword_26A3F34F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F34F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F34F8);
  }
  return result;
}

uint64_t sub_259DE4984(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_259DE49E4()
{
  return type metadata accessor for PlanksWriter();
}

uint64_t sub_259DE49EC()
{
  uint64_t result = sub_259DF7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PlanksWriter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlanksWriter);
}

uint64_t dispatch thunk of PlanksWriter.metadata.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of PlanksWriter.__allocating_init(filePath:append:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of PlanksWriter.finalize()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of PlanksWriter.nextChunkOffset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of PlanksWriter.close()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

char *sub_259DE4B6C@<X0>(char *a1@<X0>, int64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t result = sub_259DE444C(a1, a2, *(char **)(v3 + 16), *(void *)(v3 + 24));
  if (!v4)
  {
    *a3 = result;
    a3[1] = v7;
    a3[2] = v8;
  }
  return result;
}

void *sub_259DE4BA0@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_259DE4600(a1, *(uint64_t **)(v2 + 16), *(void *(**)(long long *__return_ptr, uint64_t, void *))(v2 + 24), a2);
}

uint64_t PlanksWriter.writeDataFrame(df:label:columnTypes:batchSize:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  os_log_t v173 = a3;
  uint64_t v172 = a2;
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3590);
  uint64_t v162 = *(void (**)(char *, uint64_t))(v158 - 8);
  MEMORY[0x270FA5388](v158);
  os_log_type_t v157 = (char *)v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3598);
  MEMORY[0x270FA5388](v156);
  uint64_t v155 = (char *)v145 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_259DF78E0();
  unint64_t v164 = *(void (***)(char *, uint64_t))(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v145 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_259DF78B0();
  int64_t v161 = *(void *)(v178 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v178);
  long long v17 = (char *)v145 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v180 = (char *)v145 - v18;
  uint64_t v169 = a1;
  uint64_t v148 = sub_259DF7850();
  uint64_t v19 = *(void *)(a4 + 64);
  uint64_t v163 = a4 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(a4 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v177 = v21 & v19;
  uint64_t v159 = v6;
  uint64_t v22 = (void *)(v6 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  uint64_t v175 = a4;
  swift_bridgeObjectRetain();
  uint64_t v160 = v22;
  swift_beginAccess();
  uint64_t v23 = 0;
  int64_t v166 = (unint64_t)(v20 + 63) >> 6;
  uint64_t v151 = a5;
  uint64_t v165 = v12;
  unint64_t v168 = v14;
  v171 = v17;
  while (v177)
  {
    unint64_t v24 = __clz(__rbit64(v177));
    v177 &= v177 - 1;
    unint64_t v25 = v24 | (v23 << 6);
LABEL_20:
    LODWORD(v176) = *(unsigned __int8 *)(*(void *)(v175 + 56) + v25);
    v187 = (void *)v172;
    uint64_t v188 = v173;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_259DF7B60();
    sub_259DF7B60();
    swift_bridgeObjectRelease();
    int64_t v30 = v187;
    unint64_t v29 = v188;
    uint64_t v31 = v160[1];
    int64_t v32 = *(void *)(v31 + 16);
    v179 = v188;
    uint64_t v33 = v187;
    if (v32)
    {
      uint64_t v174 = v23;
      uint64_t v34 = v160[2];
      uint64_t v35 = v160[3];
      v187 = (void *)MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain_n();
      uint64_t v170 = v34;
      swift_bridgeObjectRetain();
      uint64_t v167 = v35;
      swift_bridgeObjectRetain();
      sub_259DE637C(0, v32, 0);
      uint64_t v36 = v187;
      uint64_t v37 = (uint64_t *)(v31 + 40);
      do
      {
        uint64_t v39 = *(v37 - 1);
        uint64_t v38 = *v37;
        v187 = v36;
        unint64_t v41 = v36[2];
        unint64_t v40 = v36[3];
        swift_bridgeObjectRetain();
        if (v41 >= v40 >> 1)
        {
          sub_259DE637C(v40 > 1, v41 + 1, 1);
          uint64_t v36 = v187;
        }
        v37 += 4;
        v36[2] = v41 + 1;
        char v42 = &v36[2 * v41];
        v42[4] = v39;
        v42[5] = v38;
        --v32;
      }
      while (v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      a5 = v151;
      long long v17 = v171;
      uint64_t v23 = v174;
      unint64_t v29 = v179;
      int64_t v30 = v33;
    }
    else
    {
      uint64_t v36 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v43 = v36[2];
    uint64_t v14 = v168;
    if (v43)
    {
      BOOL v44 = (void *)v36[4] == v30 && v36[5] == (void)v29;
      if (v44 || (sub_259DF80E0() & 1) != 0)
      {
LABEL_52:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      if (v43 != 1)
      {
        if ((void *)v36[6] == v33 && (void *)v36[7] == v179) {
          goto LABEL_52;
        }
        char v45 = sub_259DF80E0();
        uint64_t v46 = v179;
        if (v45) {
          goto LABEL_52;
        }
        if (v43 != 2)
        {
          int v47 = v33;
          char v48 = v36 + 9;
          uint64_t v49 = 2;
          do
          {
            uint64_t v50 = v49 + 1;
            if (__OFADD__(v49, 1)) {
              goto LABEL_139;
            }
            if ((void *)*(v48 - 1) == v47 && *v48 == (void)v46) {
              goto LABEL_52;
            }
            char v52 = sub_259DF80E0();
            uint64_t v46 = v179;
            if (v52) {
              goto LABEL_52;
            }
            int v47 = v33;
            v48 += 2;
            ++v49;
          }
          while (v50 != v43);
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v53 = v160;
    swift_beginAccess();
    uint64_t v54 = (void *)v53[1];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v53[1] = v54;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v54 = sub_259DCF538(0, v54[2] + 1, 1, v54);
      v160[1] = v54;
    }
    unint64_t v57 = v54[2];
    unint64_t v56 = v54[3];
    os_log_type_t v58 = v179;
    if (v57 >= v56 >> 1)
    {
      uint64_t v61 = sub_259DCF538((void *)(v56 > 1), v57 + 1, 1, v54);
      int v59 = v33;
      os_log_type_t v58 = v179;
      uint64_t v54 = v61;
      v160[1] = v61;
    }
    else
    {
      int v59 = v33;
    }
    v54[2] = v57 + 1;
    unint64_t v60 = &v54[4 * v57];
    v60[4] = v59;
    v60[5] = v58;
    *((unsigned char *)v60 + 48) = v176;
    v60[7] = a5;
    swift_endAccess();
    uint64_t v12 = v165;
  }
  int64_t v26 = v23 + 1;
  if (__OFADD__(v23, 1)) {
    goto LABEL_142;
  }
  if (v26 >= v166) {
    goto LABEL_53;
  }
  unint64_t v27 = *(void *)(v163 + 8 * v26);
  ++v23;
  if (v27) {
    goto LABEL_19;
  }
  uint64_t v23 = v26 + 1;
  if (v26 + 1 >= v166) {
    goto LABEL_53;
  }
  unint64_t v27 = *(void *)(v163 + 8 * v23);
  if (v27) {
    goto LABEL_19;
  }
  uint64_t v23 = v26 + 2;
  if (v26 + 2 >= v166) {
    goto LABEL_53;
  }
  unint64_t v27 = *(void *)(v163 + 8 * v23);
  if (v27)
  {
LABEL_19:
    unint64_t v177 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v23 << 6);
    goto LABEL_20;
  }
  int64_t v28 = v26 + 3;
  if (v28 >= v166) {
    goto LABEL_53;
  }
  unint64_t v27 = *(void *)(v163 + 8 * v28);
  if (v27)
  {
    uint64_t v23 = v28;
    goto LABEL_19;
  }
  while (1)
  {
    uint64_t v23 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      goto LABEL_144;
    }
    if (v23 >= v166) {
      break;
    }
    unint64_t v27 = *(void *)(v163 + 8 * v23);
    ++v28;
    if (v27) {
      goto LABEL_19;
    }
  }
LABEL_53:
  swift_release();
  if (!a5)
  {
LABEL_147:
    __break(1u);
    JUMPOUT(0x259DE6350);
  }
  v187 = 0;
  uint64_t v188 = (void *)v148;
  uint64_t v189 = a5;
  uint64_t v190 = 0;
  char v191 = 0;
  uint64_t v192 = 0;
  char v193 = 0;
  uint64_t v154 = OBJC_IVAR____TtC6Planks12PlanksWriter_fd;
  uint64_t v63 = sub_259DCDE64();
  if (v64) {
    return 1;
  }
  ++v164;
  v179 = (void *)(v161 + 8);
  unint64_t v153 = (void (**)(char *, uint64_t))((char *)v162 + 8);
  long long v150 = &v184;
  *((void *)&v65 + 1) = 1;
  long long v147 = xmmword_259DF8DD0;
  *(void *)&long long v65 = 136315138;
  long long v146 = v65;
  v145[1] = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v65 = 134218498;
  long long v149 = v65;
  *(void *)&long long v65 = 136315394;
  long long v152 = v65;
  while (2)
  {
    if (__OFADD__(v63, a5)) {
      goto LABEL_145;
    }
    uint64_t v66 = v148;
    if (v148 >= v63 + a5) {
      uint64_t v66 = v63 + a5;
    }
    if (__OFSUB__(v66, v63))
    {
LABEL_146:
      __break(1u);
      goto LABEL_147;
    }
    if (v66 - v63 < 1) {
      return 1;
    }
    uint64_t v167 = v66;
    uint64_t v170 = v63;
    unint64_t v67 = sub_259DE2C84();
    LOBYTE(v185) = 1;
    *((void *)&v185 + 1) = MEMORY[0x263F8EE78];
    *(void *)v186 = v67;
    int64_t v166 = v67;
    *(_OWORD *)&v186[8] = v147;
    uint64_t v68 = 1 << *(unsigned char *)(v175 + 32);
    if (v68 < 64) {
      uint64_t v69 = ~(-1 << v68);
    }
    else {
      uint64_t v69 = -1;
    }
    unint64_t v70 = v69 & *(void *)(v175 + 64);
    swift_bridgeObjectRetain();
    swift_beginAccess();
    unint64_t v71 = 0;
    int64_t v161 = (unint64_t)(v68 + 63) >> 6;
    while (2)
    {
      if (v70)
      {
        uint64_t v176 = (v70 - 1) & v70;
        unint64_t v177 = v71;
        unint64_t v72 = __clz(__rbit64(v70)) | (v71 << 6);
        goto LABEL_83;
      }
      int64_t v73 = v71 + 1;
      if (__OFADD__(v71, 1)) {
        goto LABEL_141;
      }
      if (v73 < v161)
      {
        unint64_t v74 = *(void *)(v163 + 8 * v73);
        int64_t v75 = v71 + 1;
        if (!v74)
        {
          int64_t v75 = v71 + 2;
          if ((uint64_t)(v71 + 2) >= v161) {
            break;
          }
          unint64_t v74 = *(void *)(v163 + 8 * v75);
          if (!v74)
          {
            int64_t v75 = v71 + 3;
            if ((uint64_t)(v71 + 3) >= v161) {
              break;
            }
            unint64_t v74 = *(void *)(v163 + 8 * v75);
            if (!v74)
            {
              unint64_t v76 = v71 + 4;
              if ((uint64_t)(v71 + 4) >= v161) {
                break;
              }
              unint64_t v74 = *(void *)(v163 + 8 * v76);
              if (!v74)
              {
                while (1)
                {
                  int64_t v75 = v76 + 1;
                  if (__OFADD__(v76, 1)) {
                    break;
                  }
                  if (v75 >= v161) {
                    goto LABEL_120;
                  }
                  unint64_t v74 = *(void *)(v163 + 8 * v75);
                  ++v76;
                  if (v74) {
                    goto LABEL_82;
                  }
                }
LABEL_143:
                __break(1u);
LABEL_144:
                __break(1u);
LABEL_145:
                __break(1u);
                goto LABEL_146;
              }
              int64_t v75 = v71 + 4;
            }
          }
        }
LABEL_82:
        uint64_t v176 = (v74 - 1) & v74;
        unint64_t v177 = v75;
        unint64_t v72 = __clz(__rbit64(v74)) + (v75 << 6);
LABEL_83:
        uint64_t v77 = (uint64_t *)(*(void *)(v175 + 48) + 16 * v72);
        uint64_t v78 = *v77;
        unint64_t v79 = v77[1];
        int v80 = *(unsigned __int8 *)(*(void *)(v175 + 56) + v72);
        uint64_t v181 = v172;
        uint64_t v182 = (uint64_t)v173;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_259DF7B60();
        sub_259DF7B60();
        uint64_t v81 = v181;
        uint64_t v82 = v182;
        uint64_t v174 = v78;
        MEMORY[0x25A2EB870](v78, v79);
        sub_259DE639C(&qword_26A3F35A0, MEMORY[0x263F1BF70]);
        sub_259DF7D40();
        if (v183 < v170)
        {
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        uint64_t v181 = v170;
        uint64_t v182 = v183;
        sub_259DF7D70();
        int v83 = v14;
        (*v164)(v14, v12);
        sub_259DE639C(&qword_26A3F35A8, MEMORY[0x263F1BEE0]);
        int v84 = v17;
        uint64_t v85 = v178;
        sub_259DF7D20();
        if (v167 < v183) {
          goto LABEL_137;
        }
        uint64_t v181 = v183;
        uint64_t v182 = v167;
        sub_259DF7D70();
        uint64_t v86 = (void (*)(char *, uint64_t))*v179;
        ((void (*)(char *, uint64_t))*v179)(v84, v85);
        uint64_t v87 = *(void *)(*((void *)&v185 + 1) + 16);
        int64_t v88 = v166;
        uint64_t v14 = v83;
        if (v87)
        {
          uint64_t v89 = *((void *)&v185 + 1) + (v87 << 6);
          uint64_t v91 = *(void *)(v89 - 16);
          uint64_t v90 = *(void *)(v89 - 8);
          int64_t v88 = v91 + v90;
          if (__OFADD__(v91, v90)) {
            goto LABEL_138;
          }
        }
        if (v80)
        {
          uint64_t v92 = v86;
          swift_bridgeObjectRelease();
          long long v17 = v171;
          if (qword_26A3F3140 != -1) {
            swift_once();
          }
          uint64_t v93 = sub_259DF7A50();
          __swift_project_value_buffer(v93, (uint64_t)qword_26A3F63A0);
          swift_bridgeObjectRetain();
          os_log_type_t v94 = sub_259DF7A30();
          os_log_type_t v95 = sub_259DF7DA0();
          if (os_log_type_enabled(v94, v95))
          {
            uint64_t v96 = swift_slowAlloc();
            uint64_t v97 = swift_slowAlloc();
            uint64_t v181 = v97;
            *(_DWORD *)uint64_t v96 = v152;
            unint64_t v98 = 0xE500000000000000;
            uint64_t v99 = 0x3631746E69;
            switch(v80)
            {
              case 2:
                uint64_t v99 = 0x3233746E69;
                break;
              case 3:
                uint64_t v99 = 0x3436746E69;
                break;
              case 4:
                uint64_t v99 = 0x38746E6975;
                break;
              case 5:
                unint64_t v98 = 0xE600000000000000;
                uint64_t v99 = 0x3631746E6975;
                break;
              case 6:
                unint64_t v98 = 0xE600000000000000;
                uint64_t v99 = 0x3233746E6975;
                break;
              case 7:
                unint64_t v98 = 0xE600000000000000;
                uint64_t v99 = 0x3436746E6975;
                break;
              case 8:
                unint64_t v98 = 0xE700000000000000;
                uint64_t v99 = 0x363174616F6C66;
                break;
              case 9:
                unint64_t v98 = 0xE700000000000000;
                uint64_t v99 = 0x323374616F6C66;
                break;
              case 10:
                unint64_t v98 = 0xE700000000000000;
                uint64_t v99 = 0x343674616F6C66;
                break;
              case 11:
                unint64_t v98 = 0xE400000000000000;
                uint64_t v99 = 1819242338;
                break;
              default:
                break;
            }
            *(void *)(v96 + 4) = sub_259DC6D7C(v99, v98, &v181);
            swift_bridgeObjectRelease();
            *(_WORD *)(v96 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(void *)(v96 + 14) = sub_259DC6D7C(v174, v79, &v181);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_259DBD000, v94, v95, "Unsupported column type %s for column %s", (uint8_t *)v96, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x25A2EC590](v97, -1, -1);
            MEMORY[0x25A2EC590](v96, -1, -1);

            v92(v180, v178);
            goto LABEL_119;
          }
          swift_bridgeObjectRelease_n();

          v92(v180, v178);
        }
        else
        {
          uint64_t v162 = v86;
          uint64_t v100 = v157;
          sub_259DF78A0();
          LOBYTE(v181) = 0;
          sub_259DE63E4(&qword_26A3F35B0, &qword_26A3F3590);
          uint64_t v101 = v158;
          sub_259DF78C0();
          (*v153)(v100, v101);
          sub_259DE63E4(&qword_26A3F35B8, &qword_26A3F3598);
          sub_259DF7BA0();
          int v102 = sub_259DF7A90();
          long long v17 = v171;
          if (v103)
          {
            LODWORD(v181) = v102;
            sub_259DC6E50();
            swift_willThrowTypedImpl();
          }
          uint64_t v104 = sub_259DF7AB0();
          uint64_t v105 = v104;
          if (v106)
          {
            LODWORD(v181) = v104;
            sub_259DC6E50();
            swift_willThrowTypedImpl();
            if (qword_26A3F3140 != -1) {
              swift_once();
            }
            uint64_t v111 = sub_259DF7A50();
            __swift_project_value_buffer(v111, (uint64_t)qword_26A3F63A0);
            unint64_t v112 = sub_259DF7A30();
            os_log_type_t v113 = sub_259DF7DA0();
            if (os_log_type_enabled(v112, v113))
            {
              uint64_t v114 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v114 = 0;
              _os_log_impl(&dword_259DBD000, v112, v113, "Failed at writing column chunk data.", v114, 2u);
              MEMORY[0x25A2EC590](v114, -1, -1);
            }

            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRetain();
            uint64_t v115 = sub_259DF7A30();
            os_log_type_t v116 = sub_259DF7DA0();
            if (os_log_type_enabled(v115, v116))
            {
              uint64_t v117 = swift_slowAlloc();
              uint64_t v118 = swift_slowAlloc();
              uint64_t v181 = v118;
              *(_DWORD *)uint64_t v117 = v149;
              uint64_t v183 = v170;
              sub_259DF7DE0();
              *(_WORD *)(v117 + 12) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v183 = sub_259DC6D7C(v174, v79, &v181);
              sub_259DF7DE0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v117 + 22) = 2080;
              LOBYTE(v183) = 0;
              uint64_t v119 = FieldType.description.getter();
              uint64_t v183 = sub_259DC6D7C(v119, v120, &v181);
              sub_259DF7DE0();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_259DBD000, v115, v116, "Failed at writing batch %ld: %s %s", (uint8_t *)v117, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x25A2EC590](v118, -1, -1);
              MEMORY[0x25A2EC590](v117, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            v162(v180, v178);
LABEL_119:
            uint64_t v12 = v165;
            uint64_t v14 = v168;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_release();
            swift_beginAccess();
            uint64_t v107 = (void *)*((void *)&v185 + 1);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v107 = sub_259DCF76C(0, v107[2] + 1, 1, v107);
            }
            uint64_t v14 = v168;
            unint64_t v109 = v107[2];
            unint64_t v108 = v107[3];
            if (v109 >= v108 >> 1) {
              uint64_t v107 = sub_259DCF76C((void *)(v108 > 1), v109 + 1, 1, v107);
            }
            v107[2] = v109 + 1;
            char v110 = &v107[8 * v109];
            v110[4] = v81;
            v110[5] = v82;
            v110[6] = v88;
            v110[7] = v105;
            *((_WORD *)v110 + 32) = 0;
            v110[9] = 0;
            v110[10] = 0;
            *((_WORD *)v110 + 44) = 12;
            *((void *)&v185 + 1) = v107;
            swift_endAccess();
            v162(v180, v178);
            uint64_t v12 = v165;
          }
        }
        unint64_t v71 = v177;
        unint64_t v70 = v176;
        continue;
      }
      break;
    }
LABEL_120:
    swift_release();
    swift_beginAccess();
    uint64_t v121 = *(void *)(*((void *)&v185 + 1) + 16);
    if (v121)
    {
      uint64_t v122 = 0;
      uint64_t v123 = (uint64_t *)(*((void *)&v185 + 1) + 56);
      while (1)
      {
        uint64_t v124 = *v123;
        v123 += 8;
        BOOL v125 = __OFADD__(v122, v124);
        v122 += v124;
        if (v125) {
          goto LABEL_140;
        }
        if (!--v121) {
          goto LABEL_126;
        }
      }
    }
    uint64_t v122 = 0;
LABEL_126:
    *(void *)&v186[8] = v122;
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v126 = sub_259DF7A50();
    __swift_project_value_buffer(v126, (uint64_t)qword_26A3F63A0);
    uint64_t v127 = sub_259DF7A30();
    os_log_type_t v128 = sub_259DF7D90();
    if (os_log_type_enabled(v127, v128))
    {
      uint64_t v129 = (uint8_t *)swift_slowAlloc();
      uint64_t v130 = swift_slowAlloc();
      uint64_t v181 = v130;
      *(_DWORD *)uint64_t v129 = v146;
      v194[0] = v185;
      v194[1] = *(_OWORD *)v186;
      uint64_t v195 = *(void *)&v186[16];
      sub_259DCA11C((uint64_t)v194);
      uint64_t v131 = sub_259DC6AC8();
      unint64_t v133 = v132;
      sub_259DD4584((uint64_t)v194);
      uint64_t v183 = sub_259DC6D7C(v131, v133, &v181);
      uint64_t v14 = v168;
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v127, v128, "Written rowGroup: %s", v129, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v130, -1, -1);
      MEMORY[0x25A2EC590](v129, -1, -1);
    }

    char v134 = v185;
    uint64_t v135 = *((void *)&v185 + 1);
    long long v137 = *(_OWORD *)v186;
    uint64_t v136 = *(void *)&v186[16];
    v138 = v160;
    swift_beginAccess();
    v139 = (void *)v138[2];
    swift_bridgeObjectRetain();
    char v140 = swift_isUniquelyReferenced_nonNull_native();
    v138[2] = v139;
    if ((v140 & 1) == 0)
    {
      v139 = sub_259DCF648(0, v139[2] + 1, 1, v139);
      v160[2] = v139;
    }
    unint64_t v142 = v139[2];
    unint64_t v141 = v139[3];
    if (v142 >= v141 >> 1)
    {
      v139 = sub_259DCF648((void *)(v141 > 1), v142 + 1, 1, v139);
      v160[2] = v139;
    }
    v139[2] = v142 + 1;
    v143 = &v139[5 * v142];
    *((unsigned char *)v143 + 32) = v134;
    v143[5] = v135;
    *((_OWORD *)v143 + 3) = v137;
    v143[8] = v136;
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v63 = sub_259DCDE64();
    a5 = v151;
    uint64_t v12 = v165;
    long long v17 = v171;
    if ((v144 & 1) == 0) {
      continue;
    }
    return 1;
  }
}

uint64_t sub_259DE637C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_259DE6468(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_259DE639C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_259DE63E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_259DE6428(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_259DE65D4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_259DE6448(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_259DE6734(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_259DE6468(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32D0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DE65D4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

uint64_t sub_259DE6734(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F35C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_259DF7FA0();
  __break(1u);
  return result;
}

unint64_t sub_259DE6884(uint64_t a1)
{
  unint64_t result = sub_259DE68AC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_259DE68AC()
{
  unint64_t result = qword_26A3F35C8;
  if (!qword_26A3F35C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F35C8);
  }
  return result;
}

uint64_t sub_259DE6900()
{
  return sub_259DC671C(*v0, v0[1], v0[2], v0[3]);
}

unint64_t sub_259DE690C(uint64_t a1)
{
  unint64_t result = sub_259DE6934();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_259DE6934()
{
  unint64_t result = qword_26A3F35D0;
  if (!qword_26A3F35D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F35D0);
  }
  return result;
}

uint64_t sub_259DE6988()
{
  return sub_259DC6AC8();
}

unint64_t sub_259DE69C4(uint64_t a1)
{
  unint64_t result = sub_259DE69EC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_259DE69EC()
{
  unint64_t result = qword_26A3F35D8;
  if (!qword_26A3F35D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F35D8);
  }
  return result;
}

uint64_t sub_259DE6A40()
{
  return sub_259DC6564();
}

unint64_t sub_259DE6A84(uint64_t a1)
{
  unint64_t result = sub_259DE6AAC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_259DE6AAC()
{
  unint64_t result = qword_26A3F35E0;
  if (!qword_26A3F35E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F35E0);
  }
  return result;
}

uint64_t sub_259DE6B00()
{
  return sub_259DC68F8(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t PlanksWriter.writeBatch<A>(_:label:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v12)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char v40;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  void v68[2];
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int16 v78;

  uint64_t v6 = v5;
  uint64_t v12 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 8);
  swift_bridgeObjectRetain();
  v12(&v71, a4, a5);
  unint64_t v67 = v71;
  uint64_t v66 = MEMORY[0x25A2EBC70](a1, a4);
  uint64_t v13 = sub_259DE1F58();
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_259DC840C(a2, a3);
    if (v15)
    {
      uint64_t v16 = *(void *)(v13 + 56) + 32 * v14;
      uint64_t v18 = *(void *)v16;
      long long v17 = *(void *)(v16 + 8);
      uint64_t v19 = *(unsigned char *)(v16 + 16);
      uint64_t v20 = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v71 = v18;
      unint64_t v72 = v17;
      LOBYTE(v73) = v19;
      unint64_t v74 = v20;
      v68[0] = a2;
      v68[1] = a3;
      uint64_t v69 = v67;
      unint64_t v70 = v66;
      if (!_s6Planks13SchemaElementV2eeoiySbAC_ACtFZ_0(&v71, v68))
      {
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v53 = sub_259DF7A50();
        __swift_project_value_buffer(v53, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_259DF7A30();
        uint64_t v54 = sub_259DF7DA0();
        if (os_log_type_enabled(v43, v54))
        {
          os_log_type_t v55 = swift_slowAlloc();
          long long v65 = swift_slowAlloc();
          unint64_t v71 = v65;
          *(_DWORD *)os_log_type_t v55 = 136315650;
          swift_bridgeObjectRetain();
          v68[0] = sub_259DC6D7C(a2, a3, &v71);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v55 + 12) = 2080;
          swift_bridgeObjectRetain();
          unint64_t v56 = sub_259DC68F8(v18, v17, v19, v20);
          os_log_type_t v58 = v57;
          swift_bridgeObjectRelease();
          v68[0] = sub_259DC6D7C(v56, v58, &v71);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v55 + 22) = 2080;
          swift_bridgeObjectRetain();
          int v59 = sub_259DC68F8(a2, a3, v67, v66);
          uint64_t v61 = v60;
          swift_bridgeObjectRelease();
          v68[0] = sub_259DC6D7C(v59, v61, &v71);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_259DBD000, v43, v54, "Invalid batch label: %s with existing schema: %s vs %s", (uint8_t *)v55, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x25A2EC590](v65, -1, -1);
          int v47 = v55;
          goto LABEL_27;
        }

        swift_bridgeObjectRelease_n();
LABEL_29:
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v21 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3298);
  sub_259DF7C30();
  uint64_t v22 = v72;
  if (!v72)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    char v42 = sub_259DF7A50();
    __swift_project_value_buffer(v42, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v43 = sub_259DF7A30();
    BOOL v44 = sub_259DF7DA0();
    if (os_log_type_enabled(v43, v44))
    {
      char v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      unint64_t v71 = v46;
      *(_DWORD *)char v45 = 136315138;
      swift_bridgeObjectRetain();
      v68[0] = sub_259DC6D7C(a2, a3, &v71);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v43, v44, "Failed at writing batch: %s", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v46, -1, -1);
      int v47 = (uint64_t)v45;
LABEL_27:
      MEMORY[0x25A2EC590](v47, -1, -1);

      return 0;
    }

    goto LABEL_29;
  }
  uint64_t v63 = a3;
  char v64 = a2;
  uint64_t v23 = v78;
  unint64_t v24 = v76;
  unint64_t v25 = v77;
  os_log_type_t v62 = v6;
  unint64_t v27 = v74;
  int64_t v26 = v75;
  int64_t v28 = v73;
  unint64_t v29 = v71;
  int64_t v30 = v75 >> 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32A0);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_259DF86A0;
  *(void *)(v31 + 32) = v29;
  *(void *)(v31 + 40) = v22;
  *(void *)(v31 + 48) = v28;
  *(void *)(v31 + 56) = v27;
  *(unsigned char *)(v31 + 64) = v26 & 1;
  *(unsigned char *)(v31 + 65) = v30;
  *(void *)(v31 + 72) = v24;
  *(void *)(v31 + 80) = v25;
  *(_WORD *)(v31 + 88) = v23;
  int64_t v32 = v62 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  uint64_t v33 = *(void **)(v32 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v32 + 16) = v33;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v33 = sub_259DCF648(0, v33[2] + 1, 1, v33);
    *(void *)(v32 + 16) = v33;
  }
  uint64_t v36 = v33[2];
  uint64_t v35 = v33[3];
  if (v36 >= v35 >> 1)
  {
    uint64_t v33 = sub_259DCF648((void *)(v35 > 1), v36 + 1, 1, v33);
    *(void *)(v32 + 16) = v33;
  }
  v33[2] = v36 + 1;
  uint64_t v37 = &v33[5 * v36];
  *((unsigned char *)v37 + 32) = 1;
  v37[5] = v31;
  v37[6] = v28;
  v37[7] = v27;
  v37[8] = 1;
  swift_endAccess();
  uint64_t v38 = *(void *)(v32 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v39 = (void *)sub_259DC193C(v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  unint64_t v40 = sub_259DC1560(v64, v63, v39);
  swift_bridgeObjectRelease();
  if (v40)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    swift_beginAccess();
    char v48 = *(void **)(v32 + 8);
    uint64_t v49 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v32 + 8) = v48;
    if ((v49 & 1) == 0)
    {
      char v48 = sub_259DCF538(0, v48[2] + 1, 1, v48);
      *(void *)(v32 + 8) = v48;
    }
    uint64_t v51 = v48[2];
    uint64_t v50 = v48[3];
    if (v51 >= v50 >> 1)
    {
      char v48 = sub_259DCF538((void *)(v50 > 1), v51 + 1, 1, v48);
      *(void *)(v32 + 8) = v48;
    }
    v48[2] = v51 + 1;
    char v52 = &v48[4 * v51];
    v52[4] = v64;
    v52[5] = v63;
    *((unsigned char *)v52 + 48) = v67;
    v52[7] = v66;
    swift_endAccess();
    return 1;
  }
}

uint64_t PlanksWriter.writeArray<A>(_:label:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v25)(uint64_t *__return_ptr, uint64_t, uint64_t);
  char v26;
  uint64_t v27;
  void *v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int16 v57;

  uint64_t v9 = v5 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  uint64_t v10 = *(void *)(v9 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  size_t v11 = (void *)sub_259DC193C(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  char v12 = sub_259DC1560(a2, a3, v11);
  uint64_t v13 = swift_bridgeObjectRelease();
  if (v12)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_259DF7A50();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_259DF7A30();
    os_log_type_t v16 = sub_259DF7DA0();
    if (os_log_type_enabled(v15, v16))
    {
      long long v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v50 = v18;
      *(_DWORD *)long long v17 = 136315138;
      swift_bridgeObjectRetain();
      sub_259DC6D7C(a2, a3, &v50);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v19 = "Invalid array label: %s";
LABEL_20:
      _os_log_impl(&dword_259DBD000, v15, v16, v19, v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v18, -1, -1);
      MEMORY[0x25A2EC590](v17, -1, -1);

      return 0;
    }
    goto LABEL_21;
  }
  MEMORY[0x270FA5388](v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3298);
  sub_259DF7C30();
  uint64_t v20 = v51;
  if (!v51)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    unint64_t v40 = sub_259DF7A50();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_259DF7A30();
    os_log_type_t v16 = sub_259DF7DA0();
    if (os_log_type_enabled(v15, v16))
    {
      long long v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v50 = v18;
      *(_DWORD *)long long v17 = 136315138;
      swift_bridgeObjectRetain();
      sub_259DC6D7C(a2, a3, &v50);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v19 = "Failed at writing array: %s";
      goto LABEL_20;
    }
LABEL_21:

    swift_bridgeObjectRelease_n();
    return 0;
  }
  unint64_t v21 = a3;
  int v47 = a2;
  char v42 = v50;
  uint64_t v23 = v52;
  uint64_t v22 = v53;
  __int16 v24 = v54;
  BOOL v44 = v56;
  char v45 = v55;
  uint64_t v43 = v57;
  unint64_t v25 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 8);
  uint64_t v46 = v21;
  swift_bridgeObjectRetain();
  v25(&v50, a4, a5);
  int64_t v26 = v50;
  unint64_t v27 = MEMORY[0x25A2EBC70](a1, a4);
  swift_beginAccess();
  int64_t v28 = *(void **)(v9 + 8);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v9 + 8) = v28;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    int64_t v28 = sub_259DCF538(0, v28[2] + 1, 1, v28);
    *(void *)(v9 + 8) = v28;
  }
  uint64_t v31 = v28[2];
  int64_t v30 = v28[3];
  if (v31 >= v30 >> 1)
  {
    int64_t v28 = sub_259DCF538((void *)(v30 > 1), v31 + 1, 1, v28);
    *(void *)(v9 + 8) = v28;
  }
  v28[2] = v31 + 1;
  int64_t v32 = &v28[4 * v31];
  v32[4] = v47;
  v32[5] = v46;
  *((unsigned char *)v32 + 48) = v26;
  v32[7] = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32A0);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_259DF86A0;
  *(void *)(v33 + 32) = v42;
  *(void *)(v33 + 40) = v20;
  *(void *)(v33 + 48) = v23;
  *(void *)(v33 + 56) = v22;
  *(unsigned char *)(v33 + 64) = v24 & 1;
  *(unsigned char *)(v33 + 65) = HIBYTE(v24);
  *(void *)(v33 + 72) = v45;
  *(void *)(v33 + 80) = v44;
  *(_WORD *)(v33 + 88) = v43;
  uint64_t v34 = *(void **)(v9 + 16);
  uint64_t v35 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v9 + 16) = v34;
  if ((v35 & 1) == 0)
  {
    uint64_t v34 = sub_259DCF648(0, v34[2] + 1, 1, v34);
    *(void *)(v9 + 16) = v34;
  }
  uint64_t v37 = v34[2];
  uint64_t v36 = v34[3];
  if (v37 >= v36 >> 1)
  {
    uint64_t v34 = sub_259DCF648((void *)(v36 > 1), v37 + 1, 1, v34);
    *(void *)(v9 + 16) = v34;
  }
  v34[2] = v37 + 1;
  uint64_t v38 = &v34[5 * v37];
  uint64_t v39 = 1;
  *((unsigned char *)v38 + 32) = 1;
  v38[5] = v33;
  v38[6] = v23;
  v38[7] = v22;
  v38[8] = 1;
  swift_endAccess();
  return v39;
}

uint64_t PlanksWriter.writeBatch<A, B>(_:label:quantization:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_259DE7950(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t))PlanksWriter.writeBatch<A>(_:label:), "Failed at quantizing batch: %s") & 1;
}

uint64_t PlanksWriter.writeArray<A, B>(_:label:quantization:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_259DE7950(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t))PlanksWriter.writeArray<A>(_:label:), "Failed at quantizing array: %s") & 1;
}

uint64_t sub_259DE7950(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t), const char *a12)
{
  v69[0] = a1;
  uint64_t v18 = sub_259DF7CC0();
  uint64_t WitnessTable = swift_getWitnessTable();
  computeQuantizationParameters<A, B, C>(_:upperbound:)((uint64_t)v69, a4, a6, (uint64_t)a5, v18, a9, a10, a7, (double *)&v65, a8, WitnessTable);
  uint64_t v20 = v65;
  uint64_t v21 = v66;
  __int16 v22 = BYTE1(v67);
  v69[0] = a1;
  __int16 v23 = v67;
  uint64_t v24 = quantizeArray<A, B, C>(_:parameters:)((uint64_t)v69, &v65, a6, a5, v18, a9, a10, a7);
  if (!v24)
  {
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_259DF7A50();
    __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_259DF7A30();
    os_log_type_t v32 = sub_259DF7DA0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v65 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      v69[0] = sub_259DC6D7C(a2, a3, &v65);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      uint64_t v35 = v31;
      os_log_type_t v36 = v32;
LABEL_16:
      _os_log_impl(&dword_259DBD000, v35, v36, a12, v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v34, -1, -1);
      MEMORY[0x25A2EC590](v33, -1, -1);

      return 0;
    }
LABEL_17:

    swift_bridgeObjectRelease_n();
    return 0;
  }
  char v25 = a11(v24, a2);
  swift_bridgeObjectRelease();
  if ((v25 & 1) == 0)
  {
LABEL_12:
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_259DF7A50();
    __swift_project_value_buffer(v38, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_259DF7A30();
    os_log_type_t v39 = sub_259DF7DA0();
    if (os_log_type_enabled(v31, v39))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v65 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      v69[0] = sub_259DC6D7C(a2, a3, &v65);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      a12 = "Failed at writing quantizedData: %s.";
      uint64_t v35 = v31;
      os_log_type_t v36 = v39;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v26 = v59 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  if (!*(void *)(*(void *)(v26 + 16) + 16))
  {
    swift_endAccess();
    goto LABEL_12;
  }
  sub_259DCFAA8((uint64_t)&v65);
  uint64_t v27 = v66;
  if (v66)
  {
    uint64_t v28 = v68;
    long long v62 = v67;
    char v29 = v65;
  }
  else
  {
    sub_259DCF9A8(*(void *)(*(void *)(v26 + 16) + 16) - 1, (uint64_t)&v65);
    char v29 = v65;
    uint64_t v27 = v66;
    long long v62 = v67;
    uint64_t v28 = v68;
  }
  unint64_t v57 = (void *)(v26 + 16);
  swift_endAccess();
  uint64_t v41 = *(void *)(v27 + 16);
  if (v41)
  {
    uint64_t v58 = v26;
    uint64_t v60 = v28;
    __int16 v64 = v23 | (v22 << 8);
    swift_bridgeObjectRetain_n();
    char v42 = (unsigned char *)(v27 + 64);
    uint64_t v43 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v44 = *((void *)v42 - 4);
      uint64_t v45 = *((void *)v42 - 3);
      uint64_t v47 = *((void *)v42 - 2);
      uint64_t v46 = *((void *)v42 - 1);
      char v48 = *v42;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v43 = sub_259DCF76C(0, v43[2] + 1, 1, v43);
      }
      unint64_t v50 = v43[2];
      unint64_t v49 = v43[3];
      if (v50 >= v49 >> 1) {
        uint64_t v43 = sub_259DCF76C((void *)(v49 > 1), v50 + 1, 1, v43);
      }
      v42 += 64;
      v43[2] = v50 + 1;
      uint64_t v51 = &v43[8 * v50];
      v51[4] = v44;
      v51[5] = v45;
      v51[6] = v47;
      v51[7] = v46;
      *((unsigned char *)v51 + 64) = v48;
      *((unsigned char *)v51 + 65) = 1;
      v51[9] = v20;
      v51[10] = v21;
      *((_WORD *)v51 + 44) = v64;
      --v41;
    }
    while (v41);
    swift_bridgeObjectRelease_n();
    uint64_t v28 = v60;
    uint64_t v26 = v58;
  }
  else
  {
    uint64_t v43 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  char v52 = *(void **)(v26 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v26 + 16) = v52;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    char v52 = sub_259DCF648(0, v52[2] + 1, 1, v52);
    *unint64_t v57 = v52;
  }
  unint64_t v55 = v52[2];
  unint64_t v54 = v52[3];
  if (v55 >= v54 >> 1)
  {
    char v52 = sub_259DCF648((void *)(v54 > 1), v55 + 1, 1, v52);
    *unint64_t v57 = v52;
  }
  v52[2] = v55 + 1;
  unint64_t v56 = &v52[5 * v55];
  *((unsigned char *)v56 + 32) = v29;
  v56[5] = v43;
  *((_OWORD *)v56 + 3) = v62;
  v56[8] = v28;
  swift_endAccess();
  swift_bridgeObjectRelease();
  return 1;
}

double sub_259DE7F9C@<D0>(uint64_t a1@<X8>)
{
  return sub_259DCF96C(a1);
}

uint64_t FieldType.rawValue.getter()
{
  uint64_t result = 947154537;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x3631746E69;
      break;
    case 2:
      uint64_t result = 0x3233746E69;
      break;
    case 3:
      uint64_t result = 0x3436746E69;
      break;
    case 4:
      uint64_t result = 0x38746E6975;
      break;
    case 5:
      uint64_t result = 0x3631746E6975;
      break;
    case 6:
      uint64_t result = 0x3233746E6975;
      break;
    case 7:
      uint64_t result = 0x3436746E6975;
      break;
    case 8:
      uint64_t result = 0x363174616F6C66;
      break;
    case 9:
      uint64_t result = 0x323374616F6C66;
      break;
    case 0xA:
      uint64_t result = 0x343674616F6C66;
      break;
    case 0xB:
      uint64_t result = 1819242338;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t FileMetadata.fieldNames.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_259DC193C(v0);
  swift_bridgeObjectRelease();
  return v1;
}

Planks::SchemaElement __swiftcall SchemaElement.init(name:fieldType:fieldCount:)(Planks::SchemaElement name, Planks::FieldType fieldType, Swift::Int fieldCount)
{
  char v4 = *(unsigned char *)fieldType;
  *(Swift::String *)uint64_t v3 = name.name;
  *(unsigned char *)(v3 + 16) = v4;
  *(void *)(v3 + 24) = fieldCount;
  name.fieldCount = fieldCount;
  name.fieldType = fieldType;
  return name;
}

unsigned char *RowGroup.init(chunkType:columnChunks:beginOffset:byteSize:rowsCount:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(unsigned char *)a6 = *result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t static PlanksDefaults.batchSize.getter()
{
  return 256;
}

Planks::FileMetadata __swiftcall FileMetadata.init(version:schema:rowGroups:keyValueMetadata:)(Swift::Int version, Swift::OpaquePointer schema, Swift::OpaquePointer rowGroups, Swift::OpaquePointer keyValueMetadata)
{
  uint64_t v9 = v4;
  sub_259DE07FC(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::Int v10 = swift_bridgeObjectRelease();
  v9->_rawValue = (void *)version;
  v9[1]._rawValue = schema._rawValue;
  v9[2]._rawValue = rowGroups._rawValue;
  v9[3]._rawValue = keyValueMetadata._rawValue;
  result.keyValueMetadata._rawValue = v13;
  result.rowGroups._rawValue = v12;
  result.schema._rawValue = v11;
  result.version = v10;
  return result;
}

uint64_t ColumnChunk.init(schemaPath:beginOffset:byteSize:encoding:compression:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, char *a6@<X5>, uint64_t a7@<X8>)
{
  char v7 = *a5;
  char v8 = *a6;
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(unsigned char *)(a7 + 32) = v7;
  *(unsigned char *)(a7 + 33) = v8;
  *(void *)(a7 + 40) = 0;
  *(void *)(a7 + 48) = 0;
  *(_WORD *)(a7 + 56) = 12;
  return result;
}

uint64_t Chunkable.endOffset.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(a2 + 8))();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  BOOL v6 = __OFADD__(v4, v5);
  uint64_t result = v4 + v5;
  if (v6) {
    __break(1u);
  }
  return result;
}

void sub_259DE8288()
{
  off_26A3F35E8 = &unk_2707BDA88;
}

uint64_t planksMagic.getter()
{
  if (qword_26A3F3148 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t planksVersion.getter()
{
  return 1;
}

uint64_t planksMinFileSize.getter()
{
  return 12;
}

uint64_t planksMaxMetadataSize.getter()
{
  return 0x2000000;
}

Planks::FieldType_optional __swiftcall FieldType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_259DF7FC0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 12;
  if (v3 < 0xC) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static FieldType.allCases.getter()
{
  return &unk_2707BDBF0;
}

uint64_t sub_259DE837C()
{
  return sub_259DF5568();
}

uint64_t sub_259DE8388()
{
  return sub_259DF8170();
}

uint64_t sub_259DE83F0()
{
  FieldType.rawValue.getter();
  sub_259DF7B50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DE8454()
{
  return sub_259DF8170();
}

Planks::FieldType_optional sub_259DE84B8(Swift::String *a1)
{
  return FieldType.init(rawValue:)(*a1);
}

uint64_t sub_259DE84C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FieldType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_259DE84EC(void *a1@<X8>)
{
  *a1 = &unk_2707BDBF0;
}

uint64_t sub_259DE84FC()
{
  return sub_259DF7BF0();
}

uint64_t sub_259DE855C()
{
  return sub_259DF7BE0();
}

uint64_t SchemaElement.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SchemaElement.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SchemaElement.name.modify())()
{
  return nullsub_1;
}

void SchemaElement.fieldType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *SchemaElement.fieldType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*SchemaElement.fieldType.modify())()
{
  return nullsub_1;
}

uint64_t SchemaElement.fieldCount.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t SchemaElement.fieldCount.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*SchemaElement.fieldCount.modify())()
{
  return nullsub_1;
}

uint64_t sub_259DE86A8()
{
  uint64_t v1 = 0x707954646C656966;
  if (*v0 != 1) {
    uint64_t v1 = 0x756F43646C656966;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_259DE8704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259DEE06C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_259DE872C()
{
  return 0;
}

uint64_t sub_259DE8738(uint64_t a1)
{
  unint64_t v2 = sub_259DEBDE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_259DE8774(uint64_t a1)
{
  unint64_t v2 = sub_259DEBDE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SchemaElement.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F35F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  BOOL v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(unsigned __int8 *)(v1 + 16);
  v9[0] = *(void *)(v1 + 24);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEBDE4();
  sub_259DF81C0();
  char v14 = 0;
  uint64_t v7 = v9[1];
  sub_259DF8040();
  if (!v7)
  {
    char v13 = v10;
    char v12 = 1;
    sub_259DEBE38();
    sub_259DF8070();
    char v11 = 2;
    sub_259DF8060();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SchemaElement.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3608);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEBDE4();
  sub_259DF81B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v19 = 0;
  uint64_t v9 = sub_259DF7FE0();
  uint64_t v11 = v10;
  char v17 = 1;
  sub_259DEBE8C();
  swift_bridgeObjectRetain();
  sub_259DF8010();
  int v15 = v18;
  char v16 = 2;
  uint64_t v13 = sub_259DF8000();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v13;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DE8BA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SchemaElement.init(from:)(a1, a2);
}

uint64_t sub_259DE8BBC(void *a1)
{
  return SchemaElement.encode(to:)(a1);
}

uint64_t ChunkEncoding.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_259DF7FC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void *static ChunkEncoding.allCases.getter()
{
  return &unk_2707BDC58;
}

uint64_t ChunkEncoding.rawValue.getter()
{
  return 0x6E69616C70;
}

uint64_t sub_259DE8C50()
{
  return 1;
}

uint64_t sub_259DE8C58()
{
  return sub_259DF8170();
}

uint64_t sub_259DE8CA8()
{
  return sub_259DF7B50();
}

uint64_t sub_259DE8CBC()
{
  return sub_259DF8170();
}

uint64_t sub_259DE8D08@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_259DF7FC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_259DE8D5C(void *a1@<X8>)
{
  *a1 = 0x6E69616C70;
  a1[1] = 0xE500000000000000;
}

void sub_259DE8D74(void *a1@<X8>)
{
  *a1 = &unk_2707BDCB8;
}

uint64_t sub_259DE8D84()
{
  return sub_259DF7BF0();
}

uint64_t sub_259DE8DE4()
{
  return sub_259DF7BE0();
}

Planks::ChunkCompression_optional __swiftcall ChunkCompression.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_259DF7FC0();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static ChunkCompression.allCases.getter()
{
  return &unk_2707BDD30;
}

uint64_t ChunkCompression.rawValue.getter()
{
  if (*v0) {
    return 0x657A69746E617571;
  }
  else {
    return 0x6572706D6F636E75;
  }
}

uint64_t sub_259DE8EEC(char *a1, char *a2)
{
  return sub_259DF56FC(*a1, *a2);
}

uint64_t sub_259DE8EF8()
{
  return sub_259DF8170();
}

uint64_t sub_259DE8F88()
{
  sub_259DF7B50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DE9004()
{
  return sub_259DF8170();
}

Planks::ChunkCompression_optional sub_259DE9090(Swift::String *a1)
{
  return ChunkCompression.init(rawValue:)(*a1);
}

void sub_259DE909C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6572706D6F636E75;
  if (*v1) {
    uint64_t v2 = 0x657A69746E617571;
  }
  unint64_t v3 = 0xEC00000064657373;
  if (*v1) {
    unint64_t v3 = 0xE900000000000064;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_259DE90E8(void *a1@<X8>)
{
  *a1 = &unk_2707BDD58;
}

uint64_t sub_259DE90F8()
{
  return sub_259DF7BF0();
}

uint64_t sub_259DE9158()
{
  return sub_259DF7BE0();
}

uint64_t ColumnChunk.schemaPath.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ColumnChunk.schemaPath.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ColumnChunk.schemaPath.modify())()
{
  return nullsub_1;
}

uint64_t ColumnChunk.beginOffset.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ColumnChunk.beginOffset.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*ColumnChunk.beginOffset.modify())()
{
  return nullsub_1;
}

uint64_t ColumnChunk.byteSize.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t ColumnChunk.byteSize.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*ColumnChunk.byteSize.modify())()
{
  return nullsub_1;
}

void ColumnChunk.encoding.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

unsigned char *ColumnChunk.encoding.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 32) = *result;
  return result;
}

uint64_t (*ColumnChunk.encoding.modify())()
{
  return nullsub_1;
}

void ColumnChunk.compression.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 33);
}

unsigned char *ColumnChunk.compression.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 33) = *result;
  return result;
}

uint64_t (*ColumnChunk.compression.modify())()
{
  return nullsub_1;
}

__n128 ColumnChunk.quantization.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int16 v2 = *(_WORD *)(v1 + 56);
  __n128 result = *(__n128 *)(v1 + 40);
  *a1 = result;
  a1[1].n128_u16[0] = v2;
  return result;
}

__n128 ColumnChunk.quantization.setter(__n128 *a1)
{
  unsigned __int16 v2 = a1[1].n128_u16[0];
  __n128 result = *a1;
  *(__n128 *)(v1 + 40) = *a1;
  *(_WORD *)(v1 + 56) = v2;
  return result;
}

uint64_t (*ColumnChunk.quantization.modify())()
{
  return nullsub_1;
}

BOOL sub_259DE934C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_259DE9360()
{
  return sub_259DF8160();
}

uint64_t sub_259DE938C()
{
  uint64_t result = 0x6150616D65686373;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x66664F6E69676562;
      break;
    case 2:
      uint64_t result = 0x657A695365747962;
      break;
    case 3:
      uint64_t result = 0x676E69646F636E65;
      break;
    case 4:
      uint64_t result = 0x73736572706D6F63;
      break;
    case 5:
      uint64_t result = 0x617A69746E617571;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259DE9470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259DEE1CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_259DE9498(uint64_t a1)
{
  unint64_t v2 = sub_259DEBEE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_259DE94D4(uint64_t a1)
{
  unint64_t v2 = sub_259DEBEE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ColumnChunk.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3618);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v18 = *(void *)(v1 + 24);
  uint64_t v19 = v7;
  int v24 = *(unsigned __int8 *)(v1 + 32);
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 33);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v14 = *(void *)(v1 + 40);
  uint64_t v15 = v8;
  int v16 = *(unsigned __int16 *)(v1 + 56);
  int v17 = v7;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEBEE0();
  sub_259DF81C0();
  LOBYTE(v21) = 0;
  uint64_t v9 = v20;
  sub_259DF8040();
  if (!v9)
  {
    char v10 = v24;
    char v11 = v17;
    LOBYTE(v21) = 1;
    sub_259DF8080();
    LOBYTE(v21) = 2;
    sub_259DF8080();
    LOBYTE(v21) = v10;
    char v25 = 3;
    sub_259DEBF34();
    sub_259DF8030();
    LOBYTE(v21) = v11;
    char v25 = 4;
    sub_259DEBF88();
    sub_259DF8030();
    uint64_t v21 = v14;
    uint64_t v22 = v15;
    __int16 v23 = v16;
    char v25 = 5;
    sub_259DEBFDC();
    sub_259DF8030();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ColumnChunk.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3640);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEBEE0();
  sub_259DF81B0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  LOBYTE(v20) = 0;
  uint64_t v9 = sub_259DF7FE0();
  uint64_t v11 = v10;
  LOBYTE(v20) = 1;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_259DF8020();
  LOBYTE(v20) = 2;
  uint64_t v18 = sub_259DF8020();
  char v23 = 3;
  sub_259DEC030();
  sub_259DF7FD0();
  int v22 = v20;
  char v23 = 4;
  sub_259DEC084();
  sub_259DF7FD0();
  int v17 = v20;
  char v23 = 5;
  sub_259DEC0D8();
  sub_259DF7FD0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __int16 v13 = v21;
  long long v14 = v20;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  uint64_t v15 = v18;
  *(void *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v15;
  *(unsigned char *)(a2 + 32) = v22;
  *(unsigned char *)(a2 + 33) = v17;
  *(_OWORD *)(a2 + 40) = v14;
  *(_WORD *)(a2 + 56) = v13;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DE9A98()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_259DE9AA0()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_259DE9AA8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t result = v1 + v2;
  if (__OFADD__(v1, v2)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_259DE9ABC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ColumnChunk.init(from:)(a1, a2);
}

uint64_t sub_259DE9AD4(void *a1)
{
  return ColumnChunk.encode(to:)(a1);
}

Planks::RowGroupType_optional __swiftcall RowGroupType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_259DF7FC0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static RowGroupType.allCases.getter()
{
  return &unk_2707BDDE8;
}

uint64_t RowGroupType.rawValue.getter()
{
  uint64_t v1 = 1635017060;
  if (*v0 != 1) {
    uint64_t v1 = 0x7865646E69;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656C706D6973;
  }
}

uint64_t sub_259DE9BA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_259DF5600(*a1, *a2);
}

uint64_t sub_259DE9BB0()
{
  return sub_259DF8170();
}

uint64_t sub_259DE9C44()
{
  sub_259DF7B50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DE9CC4()
{
  return sub_259DF8170();
}

Planks::RowGroupType_optional sub_259DE9D54(Swift::String *a1)
{
  return RowGroupType.init(rawValue:)(*a1);
}

void sub_259DE9D60(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE600000000000000;
  unint64_t v4 = 0xE400000000000000;
  uint64_t v5 = 1635017060;
  if (v2 != 1)
  {
    uint64_t v5 = 0x7865646E69;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x656C706D6973;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_259DE9DB0(void *a1@<X8>)
{
  *a1 = &unk_2707BDE10;
}

uint64_t sub_259DE9DC0()
{
  return sub_259DF7BF0();
}

uint64_t sub_259DE9E20()
{
  return sub_259DF7BE0();
}

void RowGroup.chunkType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *RowGroup.chunkType.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*RowGroup.chunkType.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.columnChunks.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RowGroup.columnChunks.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*RowGroup.columnChunks.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.beginOffset.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t RowGroup.beginOffset.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*RowGroup.beginOffset.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.byteSize.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t RowGroup.byteSize.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*RowGroup.byteSize.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.rowsCount.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t RowGroup.rowsCount.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*RowGroup.rowsCount.modify())()
{
  return nullsub_1;
}

uint64_t sub_259DE9F90()
{
  uint64_t result = 0x7079546B6E756863;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x68436E6D756C6F63;
      break;
    case 2:
      uint64_t result = 0x66664F6E69676562;
      break;
    case 3:
      uint64_t result = 0x657A695365747962;
      break;
    case 4:
      uint64_t result = 0x6E756F4373776F72;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259DEA050@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259DEE4A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_259DEA078(uint64_t a1)
{
  unint64_t v2 = sub_259DEC288();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_259DEA0B4(uint64_t a1)
{
  unint64_t v2 = sub_259DEC288();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RowGroup.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3660);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  uint64_t v12[3] = *((void *)v1 + 2);
  uint64_t v13 = v9;
  uint64_t v10 = *((void *)v1 + 3);
  v12[1] = *((void *)v1 + 4);
  v12[2] = v10;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEC288();
  sub_259DF81C0();
  char v20 = v8;
  char v19 = 0;
  sub_259DEC2DC();
  sub_259DF8070();
  if (!v2)
  {
    uint64_t v14 = v13;
    char v18 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3678);
    sub_259DEC57C(&qword_26A3F3680, &qword_26A3F3678, (void (*)(void))sub_259DEC330);
    sub_259DF8070();
    char v17 = 2;
    sub_259DF8080();
    char v16 = 3;
    sub_259DF8080();
    char v15 = 4;
    sub_259DF8060();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t RowGroup.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3690);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEC288();
  sub_259DF81B0();
  if (!v2)
  {
    char v22 = 0;
    sub_259DEC384();
    sub_259DF8010();
    char v9 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3678);
    char v21 = 1;
    sub_259DEC57C(&qword_26A3F36A0, &qword_26A3F3678, (void (*)(void))sub_259DEC3D8);
    sub_259DF8010();
    uint64_t v11 = v17;
    char v20 = 2;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_259DF8020();
    char v19 = 3;
    uint64_t v15 = sub_259DF8020();
    char v18 = 4;
    uint64_t v12 = sub_259DF8000();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)a2 = v9;
    uint64_t v13 = v16;
    *(void *)(a2 + 8) = v11;
    *(void *)(a2 + 16) = v13;
    *(void *)(a2 + 24) = v15;
    *(void *)(a2 + 32) = v12;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DEA658@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RowGroup.init(from:)(a1, a2);
}

uint64_t sub_259DEA670(void *a1)
{
  return RowGroup.encode(to:)(a1);
}

uint64_t FileMetadata.version.getter()
{
  return *(void *)v0;
}

uint64_t FileMetadata.version.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*FileMetadata.version.modify())()
{
  return nullsub_1;
}

uint64_t FileMetadata.schema.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FileMetadata.schema.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*FileMetadata.schema.modify())()
{
  return nullsub_1;
}

uint64_t FileMetadata.rowGroups.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FileMetadata.rowGroups.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*FileMetadata.rowGroups.modify())()
{
  return nullsub_1;
}

uint64_t FileMetadata.keyValueMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FileMetadata.keyValueMetadata.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*FileMetadata.keyValueMetadata.modify())()
{
  return nullsub_1;
}

uint64_t sub_259DEA7BC(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v27) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12)
        {
          int64_t v4 = v11 + 3;
          if (v11 + 3 >= v27) {
            return 1;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v4);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    char v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_259DC840C(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    int v24 = (void *)(*(void *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_259DF80E0();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v27) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_259DEA9DC()
{
  unint64_t result = 0x6E6F6973726576;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x616D65686373;
      break;
    case 2:
      unint64_t result = 0x70756F7247776F72;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259DEAA70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259DEE704(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_259DEAA98(uint64_t a1)
{
  unint64_t v2 = sub_259DEC42C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_259DEAAD4(uint64_t a1)
{
  unint64_t v2 = sub_259DEC42C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FileMetadata.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F36B0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[1];
  uint64_t v14 = v1[2];
  uint64_t v15 = v8;
  uint64_t v13 = v1[3];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEC42C();
  uint64_t v9 = v4;
  sub_259DF81C0();
  LOBYTE(v17) = 0;
  sub_259DF8060();
  if (!v2)
  {
    uint64_t v11 = v13;
    uint64_t v10 = v14;
    uint64_t v17 = v15;
    char v16 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F36C0);
    sub_259DEC57C(&qword_26A3F36C8, &qword_26A3F36C0, (void (*)(void))sub_259DEC480);
    sub_259DF8070();
    uint64_t v17 = v10;
    char v16 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F36D8);
    sub_259DEC57C(&qword_26A3F36E0, &qword_26A3F36D8, (void (*)(void))sub_259DEC4D4);
    sub_259DF8070();
    uint64_t v17 = v11;
    char v16 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F36F0);
    sub_259DEC63C(&qword_26A3F36F8);
    sub_259DF8070();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v9);
}

uint64_t FileMetadata.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3700);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = sub_259DE07FC(MEMORY[0x263F8EE78]);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEC42C();
  sub_259DF81B0();
  if (!v2)
  {
    LOBYTE(v18) = 0;
    uint64_t v9 = sub_259DF8000();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F36C0);
    char v17 = 1;
    sub_259DEC57C(&qword_26A3F3708, &qword_26A3F36C0, (void (*)(void))sub_259DEC528);
    sub_259DF8010();
    uint64_t v15 = v9;
    uint64_t v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F36D8);
    char v17 = 2;
    sub_259DEC57C(&qword_26A3F3718, &qword_26A3F36D8, (void (*)(void))sub_259DEC5E8);
    swift_bridgeObjectRetain();
    sub_259DF8010();
    uint64_t v12 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F36F0);
    char v17 = 3;
    sub_259DEC63C(&qword_26A3F3728);
    swift_bridgeObjectRetain();
    sub_259DF8010();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v15;
    a2[1] = v11;
    a2[2] = v12;
    a2[3] = v13;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259DEB174@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return FileMetadata.init(from:)(a1, a2);
}

uint64_t sub_259DEB18C(void *a1)
{
  return FileMetadata.encode(to:)(a1);
}

uint64_t FileMetadata.rowsCount.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(v1 + 64);
  while (1)
  {
    uint64_t v5 = *v4;
    v4 += 5;
    BOOL v6 = __OFADD__(result, v5);
    result += v5;
    if (v6) {
      break;
    }
    if (!--v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t FileMetadata.dataByteSize.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(v1 + 56);
  while (1)
  {
    uint64_t v5 = *v4;
    v4 += 5;
    BOOL v6 = __OFADD__(result, v5);
    result += v5;
    if (v6) {
      break;
    }
    if (!--v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

double QuantizationParameters.bias.getter()
{
  return *(double *)v0;
}

void QuantizationParameters.bias.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*QuantizationParameters.bias.modify())()
{
  return nullsub_1;
}

double QuantizationParameters.scale.getter()
{
  return *(double *)(v0 + 8);
}

void QuantizationParameters.scale.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*QuantizationParameters.scale.modify())()
{
  return nullsub_1;
}

void QuantizationParameters.physicalType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

unsigned char *QuantizationParameters.physicalType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 16) = *result;
  return result;
}

uint64_t (*QuantizationParameters.physicalType.modify())()
{
  return nullsub_1;
}

void QuantizationParameters.logicalType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

unsigned char *QuantizationParameters.logicalType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 17) = *result;
  return result;
}

uint64_t (*QuantizationParameters.logicalType.modify())()
{
  return nullsub_1;
}

Planks::QuantizationParameters __swiftcall QuantizationParameters.init(bias:scale:physicalType:logicalType:)(Swift::Double bias, Swift::Double scale, Planks::FieldType physicalType, Planks::FieldType logicalType)
{
  char v5 = *(unsigned char *)physicalType;
  char v6 = *(unsigned char *)logicalType;
  *(Swift::Double *)uint64_t v4 = bias;
  *(Swift::Double *)(v4 + 8) = scale;
  *(unsigned char *)(v4 + 16) = v5;
  *(unsigned char *)(v4 + 17) = v6;
  result.scale = scale;
  result.bias = bias;
  result.physicalType = physicalType;
  return result;
}

uint64_t sub_259DEB304()
{
  return sub_259DF8170();
}

uint64_t sub_259DEB34C()
{
  return sub_259DF8170();
}

uint64_t sub_259DEB390()
{
  uint64_t result = 1935763810;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656C616373;
      break;
    case 2:
      uint64_t result = 0x6C61636973796870;
      break;
    case 3:
      uint64_t result = 0x546C616369676F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259DEB424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_259DEE8C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_259DEB44C(uint64_t a1)
{
  unint64_t v2 = sub_259DEC6A0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_259DEB488(uint64_t a1)
{
  unint64_t v2 = sub_259DEC6A0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t QuantizationParameters.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3730);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v12 = *(unsigned __int8 *)(v1 + 16);
  char v8 = *(unsigned char *)(v1 + 17);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEC6A0();
  sub_259DF81C0();
  char v18 = 0;
  sub_259DF8050();
  if (!v2)
  {
    char v9 = v12;
    char v17 = 1;
    sub_259DF8050();
    char v16 = v9;
    char v15 = 2;
    sub_259DEBE38();
    sub_259DF8070();
    char v14 = v8;
    char v13 = 3;
    sub_259DF8070();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t QuantizationParameters.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3740);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_259DEC6A0();
  sub_259DF81B0();
  if (!v2)
  {
    char v22 = 0;
    sub_259DF7FF0();
    uint64_t v10 = v9;
    char v21 = 1;
    sub_259DF7FF0();
    uint64_t v12 = v11;
    char v19 = 2;
    sub_259DEBE8C();
    sub_259DF8010();
    char v14 = v20;
    char v17 = 3;
    sub_259DF8010();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v15 = v18;
    *(void *)a2 = v10;
    *(void *)(a2 + 8) = v12;
    *(unsigned char *)(a2 + 16) = v14;
    *(unsigned char *)(a2 + 17) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_259DEB8E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return QuantizationParameters.init(from:)(a1, a2);
}

uint64_t sub_259DEB900(void *a1)
{
  return QuantizationParameters.encode(to:)(a1);
}

uint64_t _s6Planks22QuantizationParametersV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    uint64_t v4 = FieldType.rawValue.getter();
    uint64_t v6 = v5;
    if (v4 == FieldType.rawValue.getter() && v6 == v7)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v8 = sub_259DF80E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v3 = 0;
      if ((v8 & 1) == 0) {
        return v3 & 1;
      }
    }
    uint64_t v9 = FieldType.rawValue.getter();
    uint64_t v11 = v10;
    if (v9 == FieldType.rawValue.getter() && v11 == v12) {
      char v3 = 1;
    }
    else {
      char v3 = sub_259DF80E0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

uint64_t _s6Planks11ColumnChunkV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 33);
  long long v6 = *(_OWORD *)(a1 + 40);
  __int16 v7 = *(_WORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  int v10 = *(unsigned __int8 *)(a2 + 32);
  int v11 = *(unsigned __int8 *)(a2 + 33);
  long long v12 = *(_OWORD *)(a2 + 40);
  __int16 v13 = *(_WORD *)(a2 + 56);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    uint64_t result = 0;
    if (v2 != v9 || v3 != v8) {
      return result;
    }
LABEL_9:
    if (v4)
    {
      if (!v10) {
        return 0;
      }
    }
    else if (v10)
    {
      return 0;
    }
    if (v5 == 2)
    {
      if (v11 != 2) {
        return 0;
      }
LABEL_33:
      if (v7 == 12)
      {
        if (v13 != 12) {
          return 0;
        }
      }
      else
      {
        long long v27 = v6;
        __int16 v28 = v7;
        if (v13 == 12) {
          return 0;
        }
        long long v25 = v12;
        __int16 v26 = v13;
        if ((_s6Planks22QuantizationParametersV2eeoiySbAC_ACtFZ_0((double *)&v27, (double *)&v25) & 1) == 0) {
          return 0;
        }
      }
      return 1;
    }
    if (v11 != 2)
    {
      long long v22 = v6;
      long long v24 = v12;
      if (v5) {
        uint64_t v16 = 0x657A69746E617571;
      }
      else {
        uint64_t v16 = 0x6572706D6F636E75;
      }
      if (v5) {
        unint64_t v17 = 0xE900000000000064;
      }
      else {
        unint64_t v17 = 0xEC00000064657373;
      }
      if (v11) {
        uint64_t v18 = 0x657A69746E617571;
      }
      else {
        uint64_t v18 = 0x6572706D6F636E75;
      }
      if (v11) {
        unint64_t v19 = 0xE900000000000064;
      }
      else {
        unint64_t v19 = 0xEC00000064657373;
      }
      if (v16 == v18 && v17 == v19)
      {
        swift_bridgeObjectRelease_n();
        long long v6 = v22;
        long long v12 = v24;
      }
      else
      {
        char v20 = sub_259DF80E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = 0;
        long long v6 = v22;
        long long v12 = v24;
        if ((v20 & 1) == 0) {
          return result;
        }
      }
      goto LABEL_33;
    }
    return 0;
  }
  long long v21 = *(_OWORD *)(a1 + 40);
  long long v23 = *(_OWORD *)(a2 + 40);
  char v15 = sub_259DF80E0();
  uint64_t result = 0;
  if ((v15 & 1) != 0 && v2 == v9)
  {
    long long v6 = v21;
    long long v12 = v23;
    if (v3 == v8) {
      goto LABEL_9;
    }
  }
  return result;
}

uint64_t _s6Planks12FileMetadataV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v3 = a1[2];
  uint64_t v2 = a1[3];
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  if ((sub_259DC30C4(a1[1], a2[1]) & 1) == 0 || !sub_259DC3490(v3, v5)) {
    return 0;
  }
  return sub_259DEA7BC(v2, v4);
}

BOOL _s6Planks13SchemaElementV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a2[3];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_259DF80E0(), result = 0, (v5 & 1) != 0))
  {
    uint64_t v7 = FieldType.rawValue.getter();
    uint64_t v9 = v8;
    if (v7 == FieldType.rawValue.getter() && v9 == v10)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v11 = sub_259DF80E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL result = 0;
      if ((v11 & 1) == 0) {
        return result;
      }
    }
    return v2 == v3;
  }
  return result;
}

unint64_t sub_259DEBDE4()
{
  unint64_t result = qword_26A3F35F8;
  if (!qword_26A3F35F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F35F8);
  }
  return result;
}

unint64_t sub_259DEBE38()
{
  unint64_t result = qword_26A3F3600;
  if (!qword_26A3F3600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3600);
  }
  return result;
}

unint64_t sub_259DEBE8C()
{
  unint64_t result = qword_26A3F3610;
  if (!qword_26A3F3610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3610);
  }
  return result;
}

unint64_t sub_259DEBEE0()
{
  unint64_t result = qword_26A3F3620;
  if (!qword_26A3F3620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3620);
  }
  return result;
}

unint64_t sub_259DEBF34()
{
  unint64_t result = qword_26A3F3628;
  if (!qword_26A3F3628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3628);
  }
  return result;
}

unint64_t sub_259DEBF88()
{
  unint64_t result = qword_26A3F3630;
  if (!qword_26A3F3630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3630);
  }
  return result;
}

unint64_t sub_259DEBFDC()
{
  unint64_t result = qword_26A3F3638;
  if (!qword_26A3F3638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3638);
  }
  return result;
}

unint64_t sub_259DEC030()
{
  unint64_t result = qword_26A3F3648;
  if (!qword_26A3F3648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3648);
  }
  return result;
}

unint64_t sub_259DEC084()
{
  unint64_t result = qword_26A3F3650;
  if (!qword_26A3F3650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3650);
  }
  return result;
}

unint64_t sub_259DEC0D8()
{
  unint64_t result = qword_26A3F3658;
  if (!qword_26A3F3658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3658);
  }
  return result;
}

uint64_t _s6Planks8RowGroupV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t v4 = *((void *)a1 + 2);
  uint64_t v6 = *((void *)a1 + 3);
  uint64_t v5 = *((void *)a1 + 4);
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  unint64_t v10 = 0xE400000000000000;
  uint64_t v11 = 1635017060;
  if (v2 != 1)
  {
    uint64_t v11 = 0x7865646E69;
    unint64_t v10 = 0xE500000000000000;
  }
  if (*a1) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0x656C706D6973;
  }
  if (v2) {
    unint64_t v13 = v10;
  }
  else {
    unint64_t v13 = 0xE600000000000000;
  }
  unint64_t v14 = 0xE400000000000000;
  uint64_t v15 = 1635017060;
  if (*(unsigned char *)a2 != 1)
  {
    uint64_t v15 = 0x7865646E69;
    unint64_t v14 = 0xE500000000000000;
  }
  if (*(unsigned char *)a2) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0x656C706D6973;
  }
  if (*(unsigned char *)a2) {
    unint64_t v17 = v14;
  }
  else {
    unint64_t v17 = 0xE600000000000000;
  }
  uint64_t v22 = *(void *)(a2 + 32);
  if (v12 == v16 && v13 == v17)
  {
    uint64_t v18 = v5;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v18 = v5;
    char v19 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v19 & 1) == 0) {
      return result;
    }
  }
  unsigned int v21 = sub_259DC2FD0(v3, v8) & (v4 == v7);
  if (v6 != v9) {
    unsigned int v21 = 0;
  }
  if (v18 == v22) {
    return v21;
  }
  else {
    return 0;
  }
}

unint64_t sub_259DEC288()
{
  unint64_t result = qword_26A3F3668;
  if (!qword_26A3F3668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3668);
  }
  return result;
}

unint64_t sub_259DEC2DC()
{
  unint64_t result = qword_26A3F3670;
  if (!qword_26A3F3670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3670);
  }
  return result;
}

unint64_t sub_259DEC330()
{
  unint64_t result = qword_26A3F3688;
  if (!qword_26A3F3688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3688);
  }
  return result;
}

unint64_t sub_259DEC384()
{
  unint64_t result = qword_26A3F3698;
  if (!qword_26A3F3698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3698);
  }
  return result;
}

unint64_t sub_259DEC3D8()
{
  unint64_t result = qword_26A3F36A8;
  if (!qword_26A3F36A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F36A8);
  }
  return result;
}

unint64_t sub_259DEC42C()
{
  unint64_t result = qword_26A3F36B8;
  if (!qword_26A3F36B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F36B8);
  }
  return result;
}

unint64_t sub_259DEC480()
{
  unint64_t result = qword_26A3F36D0;
  if (!qword_26A3F36D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F36D0);
  }
  return result;
}

unint64_t sub_259DEC4D4()
{
  unint64_t result = qword_26A3F36E8;
  if (!qword_26A3F36E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F36E8);
  }
  return result;
}

unint64_t sub_259DEC528()
{
  unint64_t result = qword_26A3F3710;
  if (!qword_26A3F3710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3710);
  }
  return result;
}

uint64_t sub_259DEC57C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_259DEC5E8()
{
  unint64_t result = qword_26A3F3720;
  if (!qword_26A3F3720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3720);
  }
  return result;
}

uint64_t sub_259DEC63C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3F36F0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_259DEC6A0()
{
  unint64_t result = qword_26A3F3738;
  if (!qword_26A3F3738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3738);
  }
  return result;
}

unint64_t sub_259DEC6F8()
{
  unint64_t result = qword_26A3F3748;
  if (!qword_26A3F3748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3748);
  }
  return result;
}

uint64_t sub_259DEC74C()
{
  return sub_259DEC8F4(&qword_26A3F3750, &qword_26A3F3758);
}

unint64_t sub_259DEC778()
{
  unint64_t result = qword_26A3F3760;
  if (!qword_26A3F3760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3760);
  }
  return result;
}

uint64_t sub_259DEC7CC()
{
  return sub_259DEC8F4(&qword_26A3F3768, &qword_26A3F3770);
}

unint64_t sub_259DEC7F8()
{
  unint64_t result = qword_26A3F3778;
  if (!qword_26A3F3778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3778);
  }
  return result;
}

uint64_t sub_259DEC84C()
{
  return sub_259DEC8F4(&qword_26A3F3780, &qword_26A3F3788);
}

unint64_t sub_259DEC878()
{
  unint64_t result = qword_26A3F3790;
  if (!qword_26A3F3790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3790);
  }
  return result;
}

uint64_t sub_259DEC8CC()
{
  return sub_259DEC8F4(&qword_26A3F3798, &qword_26A3F37A0);
}

uint64_t sub_259DEC8F4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of Chunkable.beginOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Chunkable.byteSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Chunkable.endOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for PlanksDefaults()
{
  return &type metadata for PlanksDefaults;
}

uint64_t getEnumTagSinglePayload for FieldType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FieldType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0x259DECAECLL);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FieldType()
{
  return &type metadata for FieldType;
}

uint64_t initializeWithCopy for SchemaElement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SchemaElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for SchemaElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

ValueMetadata *type metadata accessor for SchemaElement()
{
  return &type metadata for SchemaElement;
}

uint64_t getEnumTagSinglePayload for ChunkEncoding(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ChunkEncoding(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x259DECD20);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259DECD48()
{
  return 0;
}

ValueMetadata *type metadata accessor for ChunkEncoding()
{
  return &type metadata for ChunkEncoding;
}

unsigned char *storeEnumTagSinglePayload for ChunkCompression(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x259DECE2CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChunkCompression()
{
  return &type metadata for ChunkCompression;
}

uint64_t destroy for ColumnChunk()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ColumnChunk(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ColumnChunk(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ColumnChunk(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColumnChunk(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 58)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColumnChunk(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 58) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 58) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColumnChunk()
{
  return &type metadata for ColumnChunk;
}

ValueMetadata *type metadata accessor for RowGroupType()
{
  return &type metadata for RowGroupType;
}

uint64_t initializeWithCopy for RowGroup(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RowGroup(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for RowGroup(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for RowGroup(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RowGroup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RowGroup()
{
  return &type metadata for RowGroup;
}

uint64_t destroy for FileMetadata()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for FileMetadata(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for FileMetadata(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FileMetadata(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6Planks13SchemaElementVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_259DED3D8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FileMetadata()
{
  return &type metadata for FileMetadata;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for QuantizationParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF5 && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 245);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 0xC;
  int v5 = v3 - 12;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for QuantizationParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 245;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 11;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuantizationParameters()
{
  return &type metadata for QuantizationParameters;
}

ValueMetadata *type metadata accessor for QuantizationParameters.CodingKeys()
{
  return &type metadata for QuantizationParameters.CodingKeys;
}

uint64_t _s6Planks22QuantizationParametersV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s6Planks22QuantizationParametersV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x259DED648);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FileMetadata.CodingKeys()
{
  return &type metadata for FileMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RowGroup.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RowGroup.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x259DED7DCLL);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RowGroup.CodingKeys()
{
  return &type metadata for RowGroup.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ColumnChunk.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ColumnChunk.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x259DED970);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_259DED998(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ColumnChunk.CodingKeys()
{
  return &type metadata for ColumnChunk.CodingKeys;
}

uint64_t _s6Planks12RowGroupTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s6Planks12RowGroupTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x259DEDB0CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SchemaElement.CodingKeys()
{
  return &type metadata for SchemaElement.CodingKeys;
}

unint64_t sub_259DEDB48()
{
  unint64_t result = qword_26A3F37A8;
  if (!qword_26A3F37A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37A8);
  }
  return result;
}

unint64_t sub_259DEDBA0()
{
  unint64_t result = qword_26A3F37B0;
  if (!qword_26A3F37B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37B0);
  }
  return result;
}

unint64_t sub_259DEDBF8()
{
  unint64_t result = qword_26A3F37B8;
  if (!qword_26A3F37B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37B8);
  }
  return result;
}

unint64_t sub_259DEDC50()
{
  unint64_t result = qword_26A3F37C0;
  if (!qword_26A3F37C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37C0);
  }
  return result;
}

unint64_t sub_259DEDCA8()
{
  unint64_t result = qword_26A3F37C8;
  if (!qword_26A3F37C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37C8);
  }
  return result;
}

unint64_t sub_259DEDD00()
{
  unint64_t result = qword_26A3F37D0;
  if (!qword_26A3F37D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37D0);
  }
  return result;
}

unint64_t sub_259DEDD58()
{
  unint64_t result = qword_26A3F37D8;
  if (!qword_26A3F37D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37D8);
  }
  return result;
}

unint64_t sub_259DEDDB0()
{
  unint64_t result = qword_26A3F37E0;
  if (!qword_26A3F37E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37E0);
  }
  return result;
}

unint64_t sub_259DEDE08()
{
  unint64_t result = qword_26A3F37E8;
  if (!qword_26A3F37E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37E8);
  }
  return result;
}

unint64_t sub_259DEDE60()
{
  unint64_t result = qword_26A3F37F0;
  if (!qword_26A3F37F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37F0);
  }
  return result;
}

unint64_t sub_259DEDEB8()
{
  unint64_t result = qword_26A3F37F8;
  if (!qword_26A3F37F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F37F8);
  }
  return result;
}

unint64_t sub_259DEDF10()
{
  unint64_t result = qword_26A3F3800;
  if (!qword_26A3F3800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3800);
  }
  return result;
}

unint64_t sub_259DEDF68()
{
  unint64_t result = qword_26A3F3808;
  if (!qword_26A3F3808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3808);
  }
  return result;
}

unint64_t sub_259DEDFC0()
{
  unint64_t result = qword_26A3F3810;
  if (!qword_26A3F3810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3810);
  }
  return result;
}

unint64_t sub_259DEE018()
{
  unint64_t result = qword_26A3F3818;
  if (!qword_26A3F3818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3818);
  }
  return result;
}

uint64_t sub_259DEE06C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x707954646C656966 && a2 == 0xE900000000000065 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x756F43646C656966 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_259DEE1CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6150616D65686373 && a2 == 0xEA00000000006874;
  if (v2 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x66664F6E69676562 && a2 == 0xEB00000000746573 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657A695365747962 && a2 == 0xE800000000000000 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E69646F636E65 && a2 == 0xE800000000000000 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x73736572706D6F63 && a2 == 0xEB000000006E6F69 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x617A69746E617571 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_259DEE4A4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7079546B6E756863 && a2 == 0xE900000000000065;
  if (v2 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x68436E6D756C6F63 && a2 == 0xEC000000736B6E75 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x66664F6E69676562 && a2 == 0xEB00000000746573 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x657A695365747962 && a2 == 0xE800000000000000 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E756F4373776F72 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_259DEE704(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616D65686373 && a2 == 0xE600000000000000 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x70756F7247776F72 && a2 == 0xE900000000000073 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000259DFA3D0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_259DEE8C0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1935763810 && a2 == 0xE400000000000000;
  if (v2 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C616373 && a2 == 0xE500000000000000 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61636973796870 && a2 == 0xEC00000065707954 || (sub_259DF80E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x546C616369676F6CLL && a2 == 0xEB00000000657079)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_259DEEA94()
{
  unint64_t result = qword_26A3F3820;
  if (!qword_26A3F3820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3820);
  }
  return result;
}

unint64_t sub_259DEEAE8()
{
  unint64_t result = qword_26A3F3828;
  if (!qword_26A3F3828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3828);
  }
  return result;
}

unint64_t sub_259DEEB3C()
{
  unint64_t result = qword_26A3F3830;
  if (!qword_26A3F3830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3830);
  }
  return result;
}

unint64_t sub_259DEEB90()
{
  unint64_t result = qword_26A3F3838;
  if (!qword_26A3F3838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3838);
  }
  return result;
}

uint64_t sub_259DEEBF8(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_259DEEC18, 0, 0);
}

uint64_t sub_259DEEC18()
{
  if ((sub_259DF7CF0() & 1) != 0
    || (uint64_t v1 = v0[3],
        uint64_t v2 = (int *)type metadata accessor for AsyncTensorSequence(),
        uint64_t v3 = v2[9],
        unint64_t v4 = *(void *)(v1 + v3),
        uint64_t v5 = *(void *)(v1 + v2[8]),
        v4 >= *(void *)(v5 + 16)))
  {
    uint64_t v10 = v0[2];
    uint64_t v11 = sub_259DF7A20();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  else
  {
    uint64_t v6 = v0[2];
    uint64_t v7 = v5 + 16 * v4;
    int v8 = *(NSObject **)(v7 + 32);
    uint64_t v9 = *(void *)(v7 + 40);
    *(void *)(v1 + v3) = v4 + 1;
    sub_259DEEFE0(*(void *)(v1 + 16), *(void *)(v1 + 24), v8, v9, v1 + v2[7], v6);
  }
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t PlanksReader.readBatch(label:as:batchIndex:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_259DC4BA8();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_259DC840C(a1, a2), (v12 & 1) != 0))
  {
    uint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v14 = *(void *)(v13 + 16);
    if (v14 && (a4 & 0x8000000000000000) == 0 && v14 > a4)
    {
      uint64_t v15 = v13 + 16 * a4;
      uint64_t v16 = *(NSObject **)(v15 + 32);
      uint64_t v17 = *(void *)(v15 + 40);
      swift_bridgeObjectRelease();
      return sub_259DEEFE0(a1, a2, v16, v17, a3, a5);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_259DF7A50();
  __swift_project_value_buffer(v19, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain_n();
  char v20 = sub_259DF7A30();
  os_log_type_t v21 = sub_259DF7DA0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v25 = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain();
    sub_259DC6D7C(a1, a2, &v25);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v20, v21, "Found no valid indices for label: %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v23, -1, -1);
    MEMORY[0x25A2EC590](v22, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = sub_259DF7A20();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(a5, 1, 1, v24);
}

uint64_t sub_259DEEFE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, NSObject *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7 = v6;
  uint64_t v211 = a5;
  uint64_t v209 = a4;
  uint64_t v210 = (uint64_t)a3;
  uint64_t v215 = a6;
  uint64_t v199 = sub_259DF80C0();
  uint64_t v198 = *(void *)(v199 - 8);
  MEMORY[0x270FA5388](v199);
  uint64_t v197 = (char *)&v184 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32C0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v184 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v201 = sub_259DF7910();
  uint64_t v200 = *(void *)(v201 - 8);
  MEMORY[0x270FA5388](v201);
  v207 = (uint64_t *)((char *)&v184 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_259DF7A20();
  uint64_t v216 = *(void *)(v15 - 8);
  v217 = (void (*)(void, void))v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  v205 = (char *)&v184 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v204 = (char *)&v184 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  __int16 v203 = (char *)&v184 - v21;
  MEMORY[0x270FA5388](v20);
  v208 = (char *)&v184 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v206 = (uint64_t)&v184 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  __int16 v28 = (char *)&v184 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v184 - v29;
  uint64_t v213 = sub_259DF7900();
  v214 = *(void (**)(char *, uint64_t))(v213 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v213);
  v196 = (char *)&v184 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v195 = (char *)&v184 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v202 = (char *)&v184 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  os_log_type_t v39 = (char *)&v184 - v38;
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  char v42 = (char *)&v184 - v41;
  uint64_t v43 = MEMORY[0x270FA5388](v40);
  uint64_t v45 = (char *)&v184 - v44;
  MEMORY[0x270FA5388](v43);
  v212 = (char *)&v184 - v46;
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_259DC487C();
  if (!*(void *)(v47 + 16) || (unint64_t v48 = sub_259DC840C(a1, a2), (v49 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_259DF7A50();
    __swift_project_value_buffer(v67, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v58 = sub_259DF7A30();
    os_log_type_t v68 = sub_259DF7DA0();
    BOOL v69 = os_log_type_enabled(v58, v68);
    uint64_t v61 = v217;
    if (v69)
    {
      unint64_t v70 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      *(void *)&v223[0] = v71;
      *(_DWORD *)unint64_t v70 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v221[0] = sub_259DC6D7C(a1, a2, (uint64_t *)v223);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v58, v68, "Invalid SchemaElement for label: %s", v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v71, -1, -1);
      uint64_t v66 = v70;
      goto LABEL_12;
    }
LABEL_13:

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(void, void)))(v216 + 56))(v215, 1, 1, v61);
  }
  uint64_t v193 = (uint64_t)v13;
  uint64_t v50 = *(void *)(v47 + 56) + 32 * v48;
  uint64_t v51 = *(void *)(v50 + 8);
  char v191 = *(void (**)(char *, char *, uint64_t))v50;
  int v52 = *(unsigned __int8 *)(v50 + 16);
  uint64_t v190 = *(void (**)(void, void, void))(v50 + 24);
  uint64_t v194 = v51;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v192 = v52;
  LOBYTE(v223[0]) = v52;
  ScalarType.init(fieldType:)((char *)v223, (uint64_t)v30);
  uint64_t v53 = v214;
  unint64_t v54 = (char *)v214 + 48;
  unint64_t v55 = (unsigned int (*)(char *, uint64_t, uint64_t))*((void *)v214 + 6);
  uint64_t v56 = v213;
  if (v55(v30, 1, v213) == 1)
  {
    sub_259DF5368((uint64_t)v30, &qword_26A3F3288);
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v57 = sub_259DF7A50();
    __swift_project_value_buffer(v57, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_259DF7A30();
    os_log_type_t v59 = sub_259DF7DA0();
    BOOL v60 = os_log_type_enabled(v58, v59);
    uint64_t v61 = v217;
    if (v60)
    {
      long long v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      *(void *)&v223[0] = v63;
      *(_DWORD *)long long v62 = 136315138;
      LOBYTE(v221[0]) = v192;
      uint64_t v64 = FieldType.description.getter();
      *(void *)&v221[0] = sub_259DC6D7C(v64, v65, (uint64_t *)v223);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v58, v59, "Invalid ScalarType for element: %s", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v63, -1, -1);
      uint64_t v66 = v62;
LABEL_12:
      MEMORY[0x25A2EC590](v66, -1, -1);

      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(void, void)))(v216 + 56))(v215, 1, 1, v61);
    }
    goto LABEL_13;
  }
  uint64_t v188 = v7;
  uint64_t v189 = v39;
  int64_t v75 = (void (*)(void, void, void))v53[4];
  int64_t v73 = v53 + 4;
  unint64_t v74 = (void (*)(char *, uint64_t, uint64_t))v75;
  v75(v212, v30, v56);
  sub_259DCF87C(v211, (uint64_t)v28);
  v187 = v54;
  if (v55(v28, 1, v56) == 1)
  {
    long long v185 = v74;
    v186 = v73;
    sub_259DF5368((uint64_t)v28, &qword_26A3F3288);
    unint64_t v76 = v217;
    uint64_t v77 = v214;
  }
  else
  {
    v74(v45, (uint64_t)v28, v56);
    if ((sub_259DF78F0() & 1) == 0)
    {
      uint64_t v135 = v214;
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v136 = sub_259DF7A50();
      __swift_project_value_buffer(v136, (uint64_t)qword_26A3F63A0);
      uint64_t v137 = v213;
      ((void (*)(char *, char *, uint64_t))v135[2])(v42, v45, v213);
      swift_bridgeObjectRetain();
      v138 = sub_259DF7A30();
      os_log_type_t v139 = sub_259DF7DA0();
      int v140 = v139;
      if (os_log_type_enabled(v138, v139))
      {
        uint64_t v141 = swift_slowAlloc();
        uint64_t v211 = swift_slowAlloc();
        *(void *)&v223[0] = v211;
        *(_DWORD *)uint64_t v141 = 136315394;
        LODWORD(v210) = v140;
        uint64_t v142 = ScalarType.description.getter();
        *(void *)&v221[0] = sub_259DC6D7C(v142, v143, (uint64_t *)v223);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        char v144 = (void (*)(char *, uint64_t))v135[1];
        v144(v42, v137);
        *(_WORD *)(v141 + 12) = 2080;
        LOBYTE(v221[0]) = v192;
        uint64_t v145 = FieldType.description.getter();
        *(void *)&v221[0] = sub_259DC6D7C(v145, v146, (uint64_t *)v223);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v138, (os_log_type_t)v210, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v141, 0x16u);
        uint64_t v147 = v211;
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v147, -1, -1);
        MEMORY[0x25A2EC590](v141, -1, -1);
      }
      else
      {
        char v144 = (void (*)(char *, uint64_t))v135[1];
        v144(v42, v137);

        swift_bridgeObjectRelease_n();
      }
      uint64_t v148 = v212;
      uint64_t v149 = v215;
      sub_259DF7990();
      v144(v45, v137);
      v144(v148, v137);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, void (*)(void, void)))(v216 + 56))(v149, 0, 1, v217);
    }
    long long v185 = v74;
    v186 = v73;
    uint64_t v77 = v214;
    (*((void (**)(char *, uint64_t))v214 + 1))(v45, v56);
    unint64_t v76 = v217;
  }
  uint64_t v78 = v189;
  unint64_t v79 = (void (*)(char *, char *, uint64_t))v188;
  uint64_t v80 = v193;
  if (v210 < 0
    || (uint64_t v81 = *(void *)&v188[OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16], *(void *)(v81 + 16) <= v210)
    || (uint64_t v82 = v81 + 40 * v210,
        long long v84 = *(_OWORD *)(v82 + 32),
        long long v83 = *(_OWORD *)(v82 + 48),
        uint64_t v222 = *(void *)(v82 + 64),
        v221[0] = v84,
        v221[1] = v83,
        v209 < 0)
    || *(void *)(*((void *)&v221[0] + 1) + 16) <= v209)
  {
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v129 = sub_259DF7A50();
    __swift_project_value_buffer(v129, (uint64_t)qword_26A3F63A0);
    uint64_t v130 = sub_259DF7A30();
    os_log_type_t v131 = sub_259DF7DA0();
    BOOL v132 = os_log_type_enabled(v130, v131);
    uint64_t v133 = v215;
    if (v132)
    {
      char v134 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v134 = 0;
      _os_log_impl(&dword_259DBD000, v130, v131, "Invalid index", v134, 2u);
      MEMORY[0x25A2EC590](v134, -1, -1);
    }

    ((void (*)(char *, uint64_t))v77[1])(v212, v213);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(void, void)))(v216 + 56))(v133, 1, 1, v76);
  }
  else
  {
    uint64_t v210 = (uint64_t)v55;
    uint64_t v85 = (_OWORD *)(*((void *)&v221[0] + 1) + (v209 << 6));
    long long v86 = v85[2];
    long long v87 = v85[3];
    long long v88 = v85[4];
    *(_OWORD *)&v224[10] = *(_OWORD *)((char *)v85 + 74);
    v223[1] = v87;
    *(_OWORD *)v224 = v88;
    v223[0] = v86;
    char v220 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
    uint64_t v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_259DF86B0;
    uint64_t v90 = (void (*)(char *, char *, uint64_t))v190;
    *(void *)(v89 + 32) = v222;
    *(void *)(v89 + 40) = v90;
    sub_259DCA11C((uint64_t)v221);
    sub_259DCA11C((uint64_t)v223);
    sub_259DF7920();
    uint64_t v91 = v212;
    char v184 = (void (*)(char *, char *, uint64_t))v77[2];
    uint64_t v209 = (uint64_t)(v77 + 2);
    v184(v78, v212, v56);
    sub_259DF7950();
    uint64_t v92 = sub_259DF7960();
    uint64_t v93 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56))(v80, 0, 1, v92);
    MEMORY[0x270FA5388](v93);
    os_log_type_t v94 = (void (*)(char *, char *, uint64_t))v194;
    *(&v184 - 8) = v191;
    *(&v184 - 7) = v94;
    *((unsigned char *)&v184 - 48) = v192;
    *(&v184 - 5) = v90;
    *(&v184 - 4) = (void (*)(char *, char *, uint64_t))v221;
    *(&v184 - 3) = (void (*)(char *, char *, uint64_t))v223;
    *(&v184 - 2) = v79;
    *(&v184 - 1) = (void (*)(char *, char *, uint64_t))&v220;
    os_log_type_t v95 = v208;
    sub_259DF79B0();
    swift_bridgeObjectRelease();
    sub_259DD4584((uint64_t)v221);
    sub_259DD4584((uint64_t)v223);
    if ((v220 & 1) == 0)
    {
      uint64_t v150 = v216;
      (*(void (**)(char *, void))(v216 + 8))(v95, v76);
      ((void (*)(char *, uint64_t))v77[1])(v91, v56);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(void, void)))(v150 + 56))(v215, 1, 1, v76);
    }
    uint64_t v96 = v95;
    uint64_t v97 = v216;
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v98 = sub_259DF7A50();
    uint64_t v99 = __swift_project_value_buffer(v98, (uint64_t)qword_26A3F63A0);
    uint64_t v100 = *(void (**)(char *, char *, void (*)(void, void)))(v97 + 16);
    uint64_t v101 = v203;
    v100(v203, v96, v76);
    int v102 = v204;
    v100(v204, v96, v76);
    char v103 = v205;
    v100(v205, v96, v76);
    uint64_t v194 = v99;
    uint64_t v104 = sub_259DF7A30();
    os_log_type_t v105 = sub_259DF7D90();
    int v106 = v105;
    BOOL v107 = os_log_type_enabled(v104, v105);
    unint64_t v108 = v214;
    if (v107)
    {
      uint64_t v109 = swift_slowAlloc();
      int v192 = v106;
      uint64_t v110 = v109;
      uint64_t v193 = swift_slowAlloc();
      uint64_t v219 = v193;
      *(_DWORD *)uint64_t v110 = 136315650;
      uint64_t v111 = v207;
      char v191 = (void (*)(char *, char *, uint64_t))v104;
      sub_259DF79F0();
      sub_259DF4730(&qword_26A3F3290, MEMORY[0x263F58358]);
      uint64_t v112 = v201;
      uint64_t v113 = sub_259DF80A0();
      unint64_t v115 = v114;
      (*(void (**)(uint64_t *, uint64_t))(v200 + 8))(v111, v112);
      uint64_t v218 = sub_259DC6D7C(v113, v115, &v219);
      os_log_type_t v116 = v101;
      v207 = &v219;
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      uint64_t v117 = v108;
      uint64_t v118 = *(void (**)(char *, void))(v216 + 8);
      v118(v116, v217);
      *(_WORD *)(v110 + 12) = 2048;
      uint64_t v119 = sub_259DF7980();
      v118(v102, v217);
      uint64_t v218 = v119;
      sub_259DF7DE0();
      *(_WORD *)(v110 + 22) = 2080;
      unint64_t v120 = v189;
      sub_259DF7970();
      uint64_t v121 = ScalarType.description.getter();
      unint64_t v123 = v122;
      uint64_t v124 = v120;
      uint64_t v125 = v213;
      ((void (*)(char *, uint64_t))v117[1])(v124, v213);
      uint64_t v218 = sub_259DC6D7C(v121, v123, &v219);
      uint64_t v126 = v118;
      uint64_t v96 = v208;
      sub_259DF7DE0();
      unint64_t v76 = v217;
      swift_bridgeObjectRelease();
      v126(v103, v76);
      uint64_t v97 = v216;
      os_log_t v127 = (os_log_t)v191;
      _os_log_impl(&dword_259DBD000, (os_log_t)v191, (os_log_type_t)v192, "Loaded tensor %s of %ld elements of type %s.", (uint8_t *)v110, 0x20u);
      uint64_t v128 = v193;
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v128, -1, -1);
      MEMORY[0x25A2EC590](v110, -1, -1);
    }
    else
    {
      uint64_t v126 = *(void (**)(char *, void))(v97 + 8);
      v126(v102, v76);
      v126(v101, v76);
      v126(v103, v76);

      uint64_t v125 = v213;
    }
    uint64_t v151 = v212;
    uint64_t v152 = v206;
    sub_259DCF87C(v211, v206);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v210)(v152, 1, v125) == 1)
    {
      (*((void (**)(char *, uint64_t))v214 + 1))(v151, v125);
      sub_259DF5368(v152, &qword_26A3F3288);
LABEL_46:
      uint64_t v156 = v215;
      (*(void (**)(uint64_t, char *, void (*)(void, void)))(v97 + 32))(v215, v96, v76);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, void (*)(void, void)))(v97 + 56))(v156, 0, 1, v76);
    }
    unint64_t v153 = v202;
    v185(v202, v152, v125);
    sub_259DF4730(&qword_26A3F32A8, MEMORY[0x263F58348]);
    uint64_t v154 = v125;
    if (sub_259DF7B40())
    {
      uint64_t v155 = (void (*)(char *, uint64_t))*((void *)v214 + 1);
      v155(v153, v154);
      v155(v151, v154);
      goto LABEL_46;
    }
    v217 = (void (*)(void, void))v126;
    os_log_type_t v157 = v195;
    uint64_t v158 = v125;
    uint64_t v159 = v184;
    v184(v195, v151, v158);
    uint64_t v160 = v196;
    v159(v196, v153, v154);
    int64_t v161 = sub_259DF7A30();
    os_log_type_t v162 = sub_259DF7D90();
    int v163 = v162;
    if (os_log_type_enabled(v161, v162))
    {
      uint64_t v164 = swift_slowAlloc();
      uint64_t v211 = swift_slowAlloc();
      uint64_t v219 = v211;
      *(_DWORD *)uint64_t v164 = 136315394;
      uint64_t v165 = v214;
      uint64_t v210 = (uint64_t)v161;
      uint64_t v166 = ScalarType.description.getter();
      uint64_t v218 = sub_259DC6D7C(v166, v167, &v219);
      v207 = &v219;
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      LODWORD(v209) = v163;
      unint64_t v168 = (void (*)(char *, uint64_t))v165[1];
      uint64_t v213 = (unint64_t)(v165 + 1) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v168(v157, v154);
      *(_WORD *)(v164 + 12) = 2080;
      uint64_t v169 = ScalarType.description.getter();
      uint64_t v218 = sub_259DC6D7C(v169, v170, &v219);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      v214 = v168;
      v168(v160, v154);
      os_log_t v171 = (os_log_t)v210;
      _os_log_impl(&dword_259DBD000, (os_log_t)v210, (os_log_type_t)v209, "Casting tensor of type %s to type %s.", (uint8_t *)v164, 0x16u);
      uint64_t v172 = v211;
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v172, -1, -1);
      uint64_t v173 = v164;
      uint64_t v151 = v212;
      MEMORY[0x25A2EC590](v173, -1, -1);
    }
    else
    {
      uint64_t v174 = (void (*)(char *, uint64_t))*((void *)v214 + 1);
      uint64_t v213 = ((unint64_t)v214 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v174(v157, v154);
      v214 = v174;
      v174(v160, v154);
    }
    uint64_t v175 = v215;
    uint64_t v176 = v198;
    unint64_t v177 = v197;
    uint64_t v178 = v199;
    (*(void (**)(char *, void, uint64_t))(v198 + 104))(v197, *MEMORY[0x263F8E1F8], v199);
    v179 = v153;
    v180 = v208;
    sub_259DF79C0();
    (*(void (**)(char *, uint64_t))(v176 + 8))(v177, v178);
    uint64_t v181 = v179;
    uint64_t v182 = v214;
    v214(v181, v154);
    uint64_t v183 = v216;
    v217(v180, v76);
    v182(v151, v154);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void (*)(void, void)))(v183 + 56))(v175, 0, 1, v76);
  }
}

uint64_t PlanksReader.iterBatches(label:as:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_259DC4BA8();
  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_259DC840C(a1, a2), (v13 & 1) != 0))
  {
    uint64_t v14 = *(void *)(*(void *)(v11 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(v14 + 16);
    swift_bridgeObjectRelease();
    if (v15)
    {
      sub_259DCF87C(a3, (uint64_t)v10);
      swift_bridgeObjectRetain();
      uint64_t v16 = swift_retain();
      return sub_259DF0B28(v16, a1, a2, (uint64_t)v10, a4);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_259DF7A50();
  __swift_project_value_buffer(v18, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_259DF7A30();
  os_log_type_t v20 = sub_259DF7DA0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_259DC6D7C(a1, a2, &v25);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v19, v20, "Found no valid indices for label: %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v22, -1, -1);
    MEMORY[0x25A2EC590](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v23 = type metadata accessor for AsyncTensorSequence();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a4, 1, 1, v23);
}

uint64_t sub_259DF0B28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for AsyncTensorSequence();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)((char *)v14 + *(int *)(v12 + 36)) = 0;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_259DC4BA8();
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_259DC840C(a2, a3), (v17 & 1) != 0))
  {
    uint64_t v18 = *(void *)(*(void *)(v15 + 56) + 8 * v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14[1] = a1;
    v14[2] = a2;
    v14[3] = a3;
    sub_259DCF87C(a4, (uint64_t)v14 + *(int *)(v10 + 28));
    *(void *)((char *)v14 + *(int *)(v10 + 32)) = v18;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_259DC5F20(a2, a3);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    swift_release();
    sub_259DF5368(a4, &qword_26A3F3288);
    *uint64_t v14 = v20;
    sub_259DF4684((uint64_t)v14, a5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(a5, 0, 1, v10);
    return sub_259DF54D4((uint64_t)v14);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_259DF7A50();
    __swift_project_value_buffer(v22, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_259DF7A30();
    os_log_type_t v24 = sub_259DF7DA0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v33 = v11;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v34 = a5;
      uint64_t v26 = (uint8_t *)v25;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v32 = a4;
      uint64_t v28 = v27;
      uint64_t v36 = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_259DC6D7C(a2, a3, &v36);
      uint64_t v11 = v33;
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v23, v24, "Invalid label: %s for AsyncTensorSequence.", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v28, -1, -1);
      uint64_t v29 = v26;
      a5 = v34;
      MEMORY[0x25A2EC590](v29, -1, -1);

      swift_release();
      uint64_t v30 = v32;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_release();
      uint64_t v30 = a4;
    }
    sub_259DF5368(v30, &qword_26A3F3288);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a5, 1, 1, v10);
  }
}

uint64_t PlanksReader.readTensor(label:as:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v218 = a3;
  uint64_t v222 = a4;
  uint64_t v206 = sub_259DF80C0();
  uint64_t v205 = *(void *)(v206 - 8);
  MEMORY[0x270FA5388](v206);
  uint64_t v204 = (char *)&v190 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v215 = (char *)&v190 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_259DF7910();
  uint64_t v208 = *(void *)(v11 - 8);
  uint64_t v209 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v216 = (char *)&v190 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259DF7A20();
  uint64_t v223 = *(void *)(v13 - 8);
  uint64_t v224 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v212 = (char *)&v190 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v211 = (char *)&v190 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v210 = (char *)&v190 - v19;
  MEMORY[0x270FA5388](v18);
  v217 = (char *)&v190 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v213 = (uint64_t)&v190 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v190 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v190 - v27;
  os_log_t v220 = (os_log_t)sub_259DF7900();
  Class isa = v220[-1].isa;
  uint64_t v30 = MEMORY[0x270FA5388](v220);
  v207 = (char *)&v190 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  __int16 v203 = (char *)&v190 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  v214 = (char *)&v190 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v190 - v37;
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  uint64_t v41 = (char *)&v190 - v40;
  uint64_t v42 = MEMORY[0x270FA5388](v39);
  uint64_t v44 = (char *)&v190 - v43;
  MEMORY[0x270FA5388](v42);
  uint64_t v219 = (char *)&v190 - v45;
  swift_bridgeObjectRetain();
  uint64_t v46 = sub_259DC487C();
  uint64_t v47 = *(void *)(v46 + 16);
  uint64_t v221 = a1;
  if (v47 && (unint64_t v48 = sub_259DC840C(a1, a2), (v49 & 1) != 0))
  {
    os_log_t v201 = v5;
    uint64_t v50 = *(void *)(v46 + 56) + 32 * v48;
    uint64_t v51 = *(void *)(v50 + 8);
    uint64_t v198 = *(void *)v50;
    int v52 = *(unsigned __int8 *)(v50 + 16);
    uint64_t v197 = *(void *)(v50 + 24);
    uint64_t v202 = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v200 = v52;
    LOBYTE(v227) = v52;
    ScalarType.init(fieldType:)((char *)&v227, (uint64_t)v28);
    uint64_t v53 = (char *)isa + 48;
    unint64_t v54 = (unsigned int (*)(char *, uint64_t, os_log_t))*((void *)isa + 6);
    os_log_t v55 = v220;
    if (v54(v28, 1, v220) == 1)
    {
      sub_259DF5368((uint64_t)v28, &qword_26A3F3288);
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v56 = sub_259DF7A50();
      __swift_project_value_buffer(v56, (uint64_t)qword_26A3F63A0);
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_259DF7A30();
      os_log_type_t v58 = sub_259DF7DA0();
      BOOL v59 = os_log_type_enabled(v57, v58);
      uint64_t v60 = v224;
      if (v59)
      {
        uint64_t v61 = (uint8_t *)swift_slowAlloc();
        uint64_t v62 = swift_slowAlloc();
        uint64_t v227 = v62;
        *(_DWORD *)uint64_t v61 = 136315138;
        LOBYTE(v226) = v200;
        uint64_t v63 = FieldType.description.getter();
        uint64_t v226 = sub_259DC6D7C(v63, v64, &v227);
        sub_259DF7DE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v57, v58, "Invalid ScalarType for element: %s", v61, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v62, -1, -1);
        MEMORY[0x25A2EC590](v61, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v223 + 56))(v222, 1, 1, v60);
    }
    v196 = v38;
    Class v199 = isa;
    unint64_t v74 = (char *)isa + 32;
    int64_t v75 = (void (*)(char *, char *, os_log_t))*((void *)isa + 4);
    unint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, os_log_t))v54;
    uint64_t v77 = v219;
    uint64_t v78 = v28;
    unint64_t v79 = v74;
    v75(v219, v78, v55);
    sub_259DCF87C(v218, (uint64_t)v26);
    uint64_t v195 = v76;
    int v80 = v76((uint64_t)v26, 1, v55);
    uint64_t v81 = (uint64_t)v53;
    if (v80 == 1)
    {
      uint64_t v194 = (void (*)(char *, uint64_t, os_log_t))v75;
      sub_259DF5368((uint64_t)v26, &qword_26A3F3288);
      uint64_t v82 = v77;
      Class v83 = v199;
      goto LABEL_20;
    }
    v75(v44, v26, v55);
    if (sub_259DF78F0())
    {
      uint64_t v194 = (void (*)(char *, uint64_t, os_log_t))v75;
      Class v83 = v199;
      (*((void (**)(char *, os_log_t))v199 + 1))(v44, v55);
      uint64_t v82 = v77;
LABEL_20:
      uint64_t v84 = v221;
      uint64_t v85 = sub_259DC5E0C(v221, a2);
      long long v86 = v196;
      if (v85 < 1)
      {
        swift_bridgeObjectRelease();
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v139 = sub_259DF7A50();
        __swift_project_value_buffer(v139, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain_n();
        os_log_type_t v131 = sub_259DF7A30();
        os_log_type_t v132 = sub_259DF7DA0();
        BOOL v140 = os_log_type_enabled(v131, v132);
        uint64_t v134 = v223;
        if (v140)
        {
          uint64_t v135 = (uint8_t *)swift_slowAlloc();
          uint64_t v136 = swift_slowAlloc();
          uint64_t v227 = v136;
          uint64_t v137 = v82;
          *(_DWORD *)uint64_t v135 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v226 = sub_259DC6D7C(v84, a2, &v227);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          v138 = "Found no valid rows for label: %s";
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v87 = v85;
        swift_bridgeObjectRetain();
        uint64_t v88 = sub_259DC4BA8();
        if (*(void *)(v88 + 16))
        {
          unint64_t v89 = sub_259DC840C(v221, a2);
          if (v90)
          {
            uint64_t v193 = v79;
            uint64_t v221 = v81;
            uint64_t v91 = *(void *)(*(void *)(v88 + 56) + 8 * v89);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            char v225 = 0;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3150);
            uint64_t v92 = swift_allocObject();
            *(_OWORD *)(v92 + 16) = xmmword_259DF86B0;
            uint64_t v93 = v197;
            *(void *)(v92 + 32) = v87;
            *(void *)(v92 + 40) = v93;
            sub_259DF7920();
            os_log_type_t v94 = (void (*)(char *, char *, os_log_t))*((void *)v83 + 2);
            os_log_t v95 = v220;
            uint64_t v192 = (uint64_t)v83 + 16;
            char v191 = v94;
            v94(v86, v82, v220);
            uint64_t v96 = v215;
            sub_259DF7950();
            uint64_t v97 = sub_259DF7960();
            uint64_t v98 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v96, 0, 1, v97);
            MEMORY[0x270FA5388](v98);
            os_log_t v99 = v201;
            *(&v190 - 8) = v91;
            *(&v190 - 7) = (uint64_t)v99;
            uint64_t v100 = v202;
            *(&v190 - 6) = v198;
            *(&v190 - 5) = v100;
            *((unsigned char *)&v190 - 32) = v200;
            *(&v190 - 3) = v93;
            *(&v190 - 2) = (uint64_t)&v225;
            uint64_t v101 = v217;
            sub_259DF79B0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v225 & 1) == 0)
            {
              Class v155 = v83;
              uint64_t v156 = v223;
              uint64_t v157 = v224;
              (*(void (**)(char *, uint64_t))(v223 + 8))(v101, v224);
              (*((void (**)(char *, os_log_t))v155 + 1))(v219, v95);
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v156 + 56))(v222, 1, 1, v157);
            }
            uint64_t v102 = v223;
            if (qword_26A3F3140 != -1) {
              swift_once();
            }
            uint64_t v103 = sub_259DF7A50();
            uint64_t v104 = __swift_project_value_buffer(v103, (uint64_t)qword_26A3F63A0);
            os_log_type_t v105 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
            int v106 = v210;
            uint64_t v107 = v224;
            v105(v210, v101, v224);
            unint64_t v108 = v211;
            v105(v211, v101, v107);
            uint64_t v109 = v212;
            v105(v212, v101, v107);
            uint64_t v215 = (char *)v104;
            uint64_t v110 = sub_259DF7A30();
            os_log_type_t v111 = sub_259DF7D90();
            int v112 = v111;
            if (os_log_type_enabled(v110, v111))
            {
              uint64_t v113 = swift_slowAlloc();
              os_log_t v201 = v110;
              uint64_t v114 = v113;
              uint64_t v202 = swift_slowAlloc();
              uint64_t v227 = v202;
              *(_DWORD *)uint64_t v114 = 136315650;
              unint64_t v115 = v216;
              sub_259DF79F0();
              sub_259DF4730(&qword_26A3F3290, MEMORY[0x263F58358]);
              int v200 = v112;
              uint64_t v116 = v209;
              uint64_t v117 = sub_259DF80A0();
              uint64_t v118 = v106;
              unint64_t v120 = v119;
              (*(void (**)(char *, uint64_t))(v208 + 8))(v115, v116);
              uint64_t v226 = sub_259DC6D7C(v117, v120, &v227);
              sub_259DF7DE0();
              swift_bridgeObjectRelease();
              uint64_t v121 = *(void (**)(char *, uint64_t))(v223 + 8);
              v121(v118, v224);
              *(_WORD *)(v114 + 12) = 2048;
              uint64_t v122 = sub_259DF7980();
              v121(v108, v224);
              uint64_t v226 = v122;
              sub_259DF7DE0();
              *(_WORD *)(v114 + 22) = 2080;
              unint64_t v123 = v196;
              sub_259DF7970();
              uint64_t v124 = ScalarType.description.getter();
              unint64_t v126 = v125;
              os_log_t v127 = v220;
              (*((void (**)(char *, os_log_t))v199 + 1))(v123, v220);
              uint64_t v226 = sub_259DC6D7C(v124, v126, &v227);
              sub_259DF7DE0();
              swift_bridgeObjectRelease();
              uint64_t v216 = (char *)v121;
              v121(v109, v224);
              uint64_t v102 = v223;
              os_log_t v128 = v201;
              _os_log_impl(&dword_259DBD000, v201, (os_log_type_t)v200, "Loaded tensor %s of %ld elements of type %s.", (uint8_t *)v114, 0x20u);
              uint64_t v129 = v202;
              swift_arrayDestroy();
              MEMORY[0x25A2EC590](v129, -1, -1);
              MEMORY[0x25A2EC590](v114, -1, -1);
            }
            else
            {
              uint64_t v158 = *(void (**)(char *, uint64_t))(v102 + 8);
              uint64_t v159 = v224;
              v158(v108, v224);
              v158(v106, v159);
              uint64_t v216 = (char *)v158;
              v158(v109, v159);

              os_log_t v127 = v220;
            }
            uint64_t v160 = v219;
            uint64_t v161 = v213;
            sub_259DCF87C(v218, v213);
            int v162 = v195(v161, 1, v127);
            int v163 = v217;
            uint64_t v164 = v214;
            if (v162 == 1)
            {
              (*((void (**)(char *, os_log_t))v199 + 1))(v160, v127);
              sub_259DF5368(v161, &qword_26A3F3288);
            }
            else
            {
              v194(v214, v161, v127);
              sub_259DF4730(&qword_26A3F32A8, MEMORY[0x263F58348]);
              os_log_t v165 = v127;
              if ((sub_259DF7B40() & 1) == 0)
              {
                uint64_t v169 = v203;
                unint64_t v170 = v191;
                v191(v203, v160, v127);
                os_log_t v171 = v207;
                v170(v207, v164, v127);
                uint64_t v172 = sub_259DF7A30();
                os_log_type_t v173 = sub_259DF7D90();
                if (os_log_type_enabled(v172, v173))
                {
                  uint64_t v174 = swift_slowAlloc();
                  uint64_t v221 = swift_slowAlloc();
                  uint64_t v227 = v221;
                  *(_DWORD *)uint64_t v174 = 136315394;
                  uint64_t v175 = ScalarType.description.getter();
                  uint64_t v226 = sub_259DC6D7C(v175, v176, &v227);
                  sub_259DF7DE0();
                  swift_bridgeObjectRelease();
                  unint64_t v177 = (void (*)(char *, os_log_t))*((void *)v199 + 1);
                  v177(v169, v165);
                  *(_WORD *)(v174 + 12) = 2080;
                  os_log_t v220 = v172;
                  uint64_t v178 = v207;
                  uint64_t v179 = ScalarType.description.getter();
                  uint64_t v226 = sub_259DC6D7C(v179, v180, &v227);
                  sub_259DF7DE0();
                  swift_bridgeObjectRelease();
                  v177(v178, v165);
                  uint64_t v172 = v220;
                  _os_log_impl(&dword_259DBD000, v220, v173, "Casting tensor of type %s to type %s.", (uint8_t *)v174, 0x16u);
                  uint64_t v181 = v221;
                  swift_arrayDestroy();
                  MEMORY[0x25A2EC590](v181, -1, -1);
                  MEMORY[0x25A2EC590](v174, -1, -1);
                }
                else
                {
                  unint64_t v177 = (void (*)(char *, os_log_t))*((void *)v199 + 1);
                  v177(v169, v165);
                  v177(v171, v165);
                }

                uint64_t v182 = v222;
                uint64_t v183 = v205;
                char v184 = v204;
                uint64_t v185 = v206;
                (*(void (**)(char *, void, uint64_t))(v205 + 104))(v204, *MEMORY[0x263F8E1F8], v206);
                v186 = v214;
                v187 = v217;
                sub_259DF79C0();
                (*(void (**)(char *, uint64_t))(v183 + 8))(v184, v185);
                v177(v186, v165);
                uint64_t v188 = v223;
                uint64_t v189 = v224;
                ((void (*)(char *, uint64_t))v216)(v187, v224);
                v177(v219, v165);
                return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v188 + 56))(v182, 0, 1, v189);
              }
              uint64_t v166 = (void (*)(char *, os_log_t))*((void *)v199 + 1);
              v166(v164, v127);
              v166(v160, v127);
            }
            uint64_t v167 = v222;
            uint64_t v168 = v224;
            (*(void (**)(uint64_t, char *, uint64_t))(v102 + 32))(v222, v163, v224);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v102 + 56))(v167, 0, 1, v168);
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_26A3F3140 != -1) {
          swift_once();
        }
        uint64_t v130 = sub_259DF7A50();
        __swift_project_value_buffer(v130, (uint64_t)qword_26A3F63A0);
        swift_bridgeObjectRetain_n();
        os_log_type_t v131 = sub_259DF7A30();
        os_log_type_t v132 = sub_259DF7DA0();
        BOOL v133 = os_log_type_enabled(v131, v132);
        uint64_t v134 = v223;
        if (v133)
        {
          uint64_t v135 = (uint8_t *)swift_slowAlloc();
          uint64_t v136 = swift_slowAlloc();
          uint64_t v227 = v136;
          uint64_t v137 = v82;
          *(_DWORD *)uint64_t v135 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v226 = sub_259DC6D7C(v221, a2, &v227);
          sub_259DF7DE0();
          swift_bridgeObjectRelease_n();
          v138 = "Found no valid indices for label: %s";
LABEL_36:
          _os_log_impl(&dword_259DBD000, v131, v132, v138, v135, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25A2EC590](v136, -1, -1);
          MEMORY[0x25A2EC590](v135, -1, -1);

          (*((void (**)(char *, os_log_t))v199 + 1))(v137, v220);
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v134 + 56))(v222, 1, 1, v224);
        }
      }
      swift_bridgeObjectRelease_n();

      (*((void (**)(char *, os_log_t))v199 + 1))(v82, v220);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v134 + 56))(v222, 1, 1, v224);
    }
    Class v141 = v199;
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v142 = sub_259DF7A50();
    __swift_project_value_buffer(v142, (uint64_t)qword_26A3F63A0);
    os_log_t v143 = v220;
    (*((void (**)(char *, char *, os_log_t))v141 + 2))(v41, v44, v220);
    swift_bridgeObjectRetain();
    char v144 = sub_259DF7A30();
    os_log_type_t v145 = sub_259DF7DA0();
    int v146 = v145;
    if (os_log_type_enabled(v144, v145))
    {
      uint64_t v147 = swift_slowAlloc();
      uint64_t v221 = swift_slowAlloc();
      uint64_t v227 = v221;
      *(_DWORD *)uint64_t v147 = 136315394;
      LODWORD(v218) = v146;
      uint64_t v148 = ScalarType.description.getter();
      uint64_t v226 = sub_259DC6D7C(v148, v149, &v227);
      sub_259DF7DE0();
      swift_bridgeObjectRelease();
      uint64_t v150 = (void (*)(char *, os_log_t))*((void *)v141 + 1);
      v150(v41, v143);
      *(_WORD *)(v147 + 12) = 2080;
      LOBYTE(v226) = v200;
      uint64_t v151 = FieldType.description.getter();
      uint64_t v226 = sub_259DC6D7C(v151, v152, &v227);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_259DBD000, v144, (os_log_type_t)v218, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v147, 0x16u);
      uint64_t v153 = v221;
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v153, -1, -1);
      MEMORY[0x25A2EC590](v147, -1, -1);
    }
    else
    {
      uint64_t v150 = (void (*)(char *, os_log_t))*((void *)v141 + 1);
      v150(v41, v143);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v154 = v222;
    sub_259DF7990();
    v150(v44, v143);
    v150(v219, v143);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v223 + 56))(v154, 0, 1, v224);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_259DF7A50();
    __swift_project_value_buffer(v65, (uint64_t)qword_26A3F63A0);
    swift_bridgeObjectRetain_n();
    uint64_t v66 = sub_259DF7A30();
    os_log_type_t v67 = sub_259DF7DA0();
    BOOL v68 = os_log_type_enabled(v66, v67);
    uint64_t v69 = v223;
    uint64_t v70 = v224;
    if (v68)
    {
      uint64_t v71 = (uint8_t *)swift_slowAlloc();
      uint64_t v72 = swift_slowAlloc();
      uint64_t v227 = v72;
      *(_DWORD *)uint64_t v71 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v226 = sub_259DC6D7C(v221, a2, &v227);
      sub_259DF7DE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_259DBD000, v66, v67, "Invalid SchemaElement for label: %s", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2EC590](v72, -1, -1);
      MEMORY[0x25A2EC590](v71, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v222, 1, 1, v70);
  }
}

void sub_259DF27AC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v9 = a3[2];
  if (v9)
  {
    uint64_t v11 = a3[4];
    if ((v11 & 0x8000000000000000) == 0)
    {
      uint64_t v12 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
      uint64_t v13 = *(void *)(v12 + 16);
      if (v11 < v13)
      {
        uint64_t v16 = a1;
        uint64_t v17 = a3[5];
        uint64_t v47 = v12 + 32;
        uint64_t v44 = a2 - a1;
        uint64_t v45 = *(void *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
        swift_bridgeObjectRetain();
        uint64_t v18 = 0;
        uint64_t v19 = (char)(a7 - 1);
        uint64_t v20 = a3 + 7;
        uint64_t v46 = v16;
        while (1)
        {
          if (v11 >= v13)
          {
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
            goto LABEL_52;
          }
          if (v17 < 0 || (uint64_t v21 = v47 + 40 * v11, v22 = *(void *)(v21 + 8), v17 >= *(void *)(v22 + 16)))
          {
LABEL_25:
            swift_bridgeObjectRelease();
            break;
          }
          if (v19 > 9) {
            uint64_t v23 = 1;
          }
          else {
            uint64_t v23 = qword_259DF9D88[v19];
          }
          uint64_t v24 = a8 * v23;
          if ((unsigned __int128)(a8 * (__int128)v23) >> 64 != (a8 * v23) >> 63) {
            goto LABEL_48;
          }
          uint64_t v25 = *(void *)(v21 + 32);
          if ((unsigned __int128)(v24 * (__int128)v25) >> 64 != (v24 * v25) >> 63) {
            goto LABEL_49;
          }
          uint64_t v26 = *(void *)(v22 + (v17 << 6) + 56);
          if (v26 != v24 * v25)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            if (qword_26A3F3140 == -1) {
              goto LABEL_31;
            }
            goto LABEL_54;
          }
          BOOL v27 = __OFADD__(v18, v26);
          uint64_t v28 = v18 + v26;
          if (v27) {
            goto LABEL_50;
          }
          if (v16)
          {
            if (v44 < v28) {
              goto LABEL_33;
            }
            if (v28 < v18) {
              goto LABEL_51;
            }
          }
          else
          {
            if (v28 > 0)
            {
LABEL_33:
              swift_bridgeObjectRelease();
              if (qword_26A3F3140 != -1) {
                swift_once();
              }
              uint64_t v39 = sub_259DF7A50();
              __swift_project_value_buffer(v39, (uint64_t)qword_26A3F63A0);
              uint64_t v32 = sub_259DF7A30();
              os_log_type_t v40 = sub_259DF7DA0();
              if (os_log_type_enabled(v32, v40))
              {
                uint64_t v37 = swift_slowAlloc();
                *(_DWORD *)uint64_t v37 = 134218240;
                sub_259DF7DE0();
                *(_WORD *)(v37 + 12) = 2048;
                sub_259DF7DE0();
                uint64_t v38 = "Failed at computing chunk offset: %ld vs %ld ";
                uint64_t v41 = v32;
                os_log_type_t v42 = v40;
                goto LABEL_42;
              }
              goto LABEL_29;
            }
            if (v28 < v18)
            {
              __break(1u);
LABEL_54:
              swift_once();
LABEL_31:
              uint64_t v35 = sub_259DF7A50();
              __swift_project_value_buffer(v35, (uint64_t)qword_26A3F63A0);
              swift_bridgeObjectRetain();
              uint64_t v32 = sub_259DF7A30();
              os_log_type_t v36 = sub_259DF7DA0();
              if (os_log_type_enabled(v32, v36))
              {
                uint64_t v37 = swift_slowAlloc();
                *(_DWORD *)uint64_t v37 = 134218240;
                swift_bridgeObjectRelease();
                sub_259DF7DE0();
                swift_bridgeObjectRelease();
                *(_WORD *)(v37 + 12) = 2048;
                sub_259DF7DE0();
                uint64_t v38 = "Found invalid chunk: %lld vs %ld";
                goto LABEL_41;
              }
LABEL_43:

              swift_bridgeObjectRelease_n();
              return;
            }
          }
          swift_bridgeObjectRetain();
          sub_259DF7A70();
          if (v29)
          {
            sub_259DC6E50();
            swift_willThrowTypedImpl();
            swift_bridgeObjectRelease();
            if (qword_26A3F3140 != -1) {
              swift_once();
            }
            uint64_t v43 = sub_259DF7A50();
            __swift_project_value_buffer(v43, (uint64_t)qword_26A3F63A0);
            swift_bridgeObjectRetain();
            uint64_t v32 = sub_259DF7A30();
            os_log_type_t v36 = sub_259DF7DA0();
            if (os_log_type_enabled(v32, v36))
            {
              uint64_t v37 = swift_slowAlloc();
              *(_DWORD *)uint64_t v37 = 134218240;
              swift_bridgeObjectRelease();
              sub_259DF7DE0();
              swift_bridgeObjectRelease();
              *(_WORD *)(v37 + 12) = 2048;
              sub_259DF7DE0();
              uint64_t v38 = "Failed at reading chunk at %lld for %ld bytes.";
LABEL_41:
              uint64_t v41 = v32;
              os_log_type_t v42 = v36;
LABEL_42:
              _os_log_impl(&dword_259DBD000, v41, v42, v38, (uint8_t *)v37, 0x16u);
              MEMORY[0x25A2EC590](v37, -1, -1);

              return;
            }
            goto LABEL_43;
          }
          swift_bridgeObjectRelease();
          if (!--v9)
          {
            swift_bridgeObjectRelease();
            goto LABEL_45;
          }
          uint64_t v11 = *(v20 - 1);
          uint64_t v19 = (char)(a7 - 1);
          uint64_t v16 = v46;
          if ((v11 & 0x8000000000000000) == 0)
          {
            uint64_t v30 = *v20;
            v20 += 2;
            uint64_t v17 = v30;
            uint64_t v13 = *(void *)(v45 + 16);
            uint64_t v18 = v28;
            if (v11 < v13) {
              continue;
            }
          }
          goto LABEL_25;
        }
      }
    }
    if (qword_26A3F3140 != -1) {
LABEL_52:
    }
      swift_once();
    uint64_t v31 = sub_259DF7A50();
    __swift_project_value_buffer(v31, (uint64_t)qword_26A3F63A0);
    uint64_t v32 = sub_259DF7A30();
    os_log_type_t v33 = sub_259DF7DA0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_259DBD000, v32, v33, "Invalid index", v34, 2u);
      MEMORY[0x25A2EC590](v34, -1, -1);
    }
LABEL_29:
  }
  else
  {
LABEL_45:
    *a9 = 1;
  }
}

uint64_t PlanksReader.readBatch<A, B>(label:as:quantization:batchIndex:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X3>, unint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_259DC4BA8();
  if (*(void *)(v22 + 16) && (unint64_t v23 = sub_259DC840C(a1, a2), (v24 & 1) != 0))
  {
    uint64_t v37 = a7;
    uint64_t v25 = *(void *)(*(void *)(v22 + 56) + 8 * v23);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v26 = *(void *)(v25 + 16);
    if (v26 && (a5 & 0x8000000000000000) == 0 && v26 > a5)
    {
      uint64_t v27 = v25 + 16 * a5;
      uint64_t v28 = *(void *)(v27 + 32);
      uint64_t v36 = *(void *)(v27 + 40);
      swift_bridgeObjectRelease();
      return sub_259DF30F8(a1, a2, v28, v36, a3, a4, a6, v37, a9, a8, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_259DF7A50();
  __swift_project_value_buffer(v30, (uint64_t)qword_26A3F63A0);
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_259DF7A30();
  os_log_type_t v32 = sub_259DF7DA0();
  if (os_log_type_enabled(v31, v32))
  {
    os_log_type_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v39 = v34;
    *(_DWORD *)os_log_type_t v33 = 136315138;
    swift_bridgeObjectRetain();
    sub_259DC6D7C(a1, a2, &v39);
    sub_259DF7DE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259DBD000, v31, v32, "Found no valid indices for label: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v34, -1, -1);
    MEMORY[0x25A2EC590](v33, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v35 = sub_259DF7A20();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(a9, 1, 1, v35);
}

uint64_t sub_259DF30F8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unsigned char *a6@<X5>, char *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16 = v15;
  uint64_t v126 = a8;
  os_log_t v127 = a6;
  unint64_t v121 = a2;
  uint64_t v122 = a1;
  uint64_t v124 = a7;
  uint64_t v125 = a14;
  uint64_t v119 = a13;
  uint64_t v115 = a12;
  uint64_t v116 = a15;
  uint64_t v123 = a11;
  uint64_t v114 = a10;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F32C0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v113 = &v107[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = sub_259DF7900();
  uint64_t v120 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v118 = &v107[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = sub_259DF7910();
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v117 = &v107[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
  MEMORY[0x270FA5388](v27 - 8);
  char v29 = &v107[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3880);
  MEMORY[0x270FA5388](v30 - 8);
  os_log_type_t v32 = &v107[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v33 = sub_259DF7A20();
  uint64_t v128 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = &v107[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v36 = *(void *)(v16 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
    if (*(void *)(v36 + 16) > a3 && (a4 & 0x8000000000000000) == 0)
    {
      uint64_t v37 = *(void *)(v36 + 40 * a3 + 40);
      if (*(void *)(v37 + 16) > a4)
      {
        uint64_t v38 = v37 + (a4 << 6);
        unsigned int v39 = *(unsigned __int16 *)(v38 + 88);
        if (*(_WORD *)(v38 + 88) != 12)
        {
          int v108 = *(_WORD *)(v38 + 88);
          uint64_t v109 = v35;
          uint64_t v110 = a5;
          uint64_t v112 = a9;
          uint64_t v46 = v38 + 32;
          uint64_t v48 = *(void *)(v46 + 40);
          uint64_t v47 = *(void *)(v46 + 48);
          unsigned int v111 = v39 >> 8;
          (*(void (**)(uint64_t *__return_ptr, uint64_t))(v125 + 8))(v129, v126);
          LOBYTE(v132) = v39;
          uint64_t v49 = FieldType.rawValue.getter();
          uint64_t v51 = v50;
          if (v49 == FieldType.rawValue.getter() && v51 == v52)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v53 = sub_259DF80E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v53 & 1) == 0) {
              goto LABEL_26;
            }
          }
          (*(void (**)(uint64_t *__return_ptr, char *))(v123 + 8))(v129, v124);
          LOBYTE(v132) = v111;
          uint64_t v54 = FieldType.rawValue.getter();
          uint64_t v56 = v55;
          if (v54 == FieldType.rawValue.getter() && v56 == v57)
          {
            swift_bridgeObjectRelease_n();
LABEL_21:
            (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v120 + 56))(v29, 1, 1, v23);
            unint64_t v59 = v121;
            sub_259DEEFE0(v122, v121, a3, a4, (uint64_t)v29, (uint64_t)v32);
            sub_259DF5368((uint64_t)v29, &qword_26A3F3288);
            if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v128 + 48))(v32, 1, v33) == 1)
            {
              sub_259DF5368((uint64_t)v32, &qword_26A3F3880);
              uint64_t v60 = v112;
              if (qword_26A3F3140 != -1) {
                swift_once();
              }
              uint64_t v61 = sub_259DF7A50();
              __swift_project_value_buffer(v61, (uint64_t)qword_26A3F63A0);
              swift_bridgeObjectRetain_n();
              uint64_t v62 = sub_259DF7A30();
              os_log_type_t v63 = sub_259DF7DA0();
              if (os_log_type_enabled(v62, v63))
              {
                unint64_t v64 = (uint8_t *)swift_slowAlloc();
                uint64_t v65 = swift_slowAlloc();
                v129[0] = v65;
                *(_DWORD *)unint64_t v64 = 136315138;
                swift_bridgeObjectRetain();
                uint64_t v132 = sub_259DC6D7C(v122, v59, v129);
                uint64_t v60 = v112;
                sub_259DF7DE0();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_259DBD000, v62, v63, "Failed reading batch: %s.", v64, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x25A2EC590](v65, -1, -1);
                MEMORY[0x25A2EC590](v64, -1, -1);
              }
              else
              {

                swift_bridgeObjectRelease_n();
              }
              unint64_t v76 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v128 + 56);
              uint64_t v77 = v60;
            }
            else
            {
              unint64_t v79 = v109;
              (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v128 + 32))(v109, v32, v33);
              uint64_t v80 = v126;
              uint64_t v132 = sub_259DF7A10();
              v129[0] = v48;
              v129[1] = v47;
              char v130 = v108;
              char v131 = v111;
              uint64_t v81 = sub_259DF7CC0();
              uint64_t WitnessTable = swift_getWitnessTable();
              uint64_t v82 = v116;
              uint64_t v105 = v116;
              uint64_t v84 = v123;
              Class v83 = v124;
              uint64_t v122 = v33;
              uint64_t v85 = v115;
              uint64_t v86 = v125;
              uint64_t v87 = rebuildArray<A, B, C>(_:parameters:)((uint64_t)&v132, v129, v124, v80, v81, v123, v115, v125);
              swift_bridgeObjectRelease();
              if (v87)
              {
                sub_259DF79F0();
                uint64_t v88 = v114;
                sub_259DF7940();
                unint64_t v89 = v113;
                sub_259DF7950();
                uint64_t v90 = sub_259DF7960();
                uint64_t v91 = (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v90 - 8) + 56))(v89, 0, 1, v90);
                os_log_t v127 = v107;
                MEMORY[0x270FA5388](v91);
                *(void *)&v107[-80] = v83;
                *(void *)&v107[-72] = v80;
                *(void *)&v107[-64] = v88;
                *(void *)&v107[-56] = v84;
                uint64_t v92 = v119;
                *(void *)&v107[-48] = v85;
                *(void *)&v107[-40] = v92;
                *(void *)&v107[-32] = v86;
                *(void *)&v107[-24] = v82;
                uint64_t v105 = v87;
                uint64_t v93 = v112;
                sub_259DF79B0();
                uint64_t v94 = v122;
                (*(void (**)(unsigned char *, uint64_t))(v128 + 8))(v79, v122);
                swift_bridgeObjectRelease();
                return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v128 + 56))(v93, 0, 1, v94);
              }
              uint64_t v95 = v112;
              uint64_t v33 = v122;
              if (qword_26A3F3140 != -1) {
                swift_once();
              }
              uint64_t v96 = sub_259DF7A50();
              __swift_project_value_buffer(v96, (uint64_t)qword_26A3F63A0);
              uint64_t v97 = sub_259DF7A30();
              os_log_type_t v98 = sub_259DF7DA0();
              if (os_log_type_enabled(v97, v98))
              {
                uint64_t v99 = swift_slowAlloc();
                uint64_t v100 = swift_slowAlloc();
                v129[0] = v100;
                *(_DWORD *)uint64_t v99 = 136315394;
                uint64_t v101 = sub_259DF81F0();
                uint64_t v132 = sub_259DC6D7C(v101, v102, v129);
                sub_259DF7DE0();
                swift_bridgeObjectRelease();
                *(_WORD *)(v99 + 12) = 2080;
                uint64_t v103 = sub_259DF81F0();
                uint64_t v132 = sub_259DC6D7C(v103, v104, v129);
                sub_259DF7DE0();
                uint64_t v95 = v112;
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_259DBD000, v97, v98, "Failed rebuilding of array of type %s into type %s.", (uint8_t *)v99, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x25A2EC590](v100, -1, -1);
                MEMORY[0x25A2EC590](v99, -1, -1);
              }

              (*(void (**)(unsigned char *, uint64_t))(v128 + 8))(v109, v33);
              unint64_t v76 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v128 + 56);
              uint64_t v77 = v95;
            }
            uint64_t v78 = 1;
            return v76(v77, v78, 1, v33);
          }
          char v58 = sub_259DF80E0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v58) {
            goto LABEL_21;
          }
LABEL_26:
          if (qword_26A3F3140 != -1) {
            swift_once();
          }
          uint64_t v66 = sub_259DF7A50();
          __swift_project_value_buffer(v66, (uint64_t)qword_26A3F63A0);
          os_log_type_t v67 = sub_259DF7A30();
          os_log_type_t v68 = sub_259DF7DA0();
          if (os_log_type_enabled(v67, v68))
          {
            uint64_t v69 = swift_slowAlloc();
            uint64_t v70 = swift_slowAlloc();
            v129[0] = v70;
            *(_DWORD *)uint64_t v69 = 136315394;
            uint64_t v71 = sub_259DF81F0();
            uint64_t v132 = sub_259DC6D7C(v71, v72, v129);
            sub_259DF7DE0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v69 + 12) = 2080;
            LOBYTE(v132) = v111;
            uint64_t v73 = FieldType.description.getter();
            uint64_t v132 = sub_259DC6D7C(v73, v74, v129);
            sub_259DF7DE0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_259DBD000, v67, v68, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v69, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x25A2EC590](v70, -1, -1);
            MEMORY[0x25A2EC590](v69, -1, -1);
          }

          uint64_t v75 = v112;
          sub_259DF7990();
          unint64_t v76 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v128 + 56);
          uint64_t v77 = v75;
          uint64_t v78 = 0;
          return v76(v77, v78, 1, v33);
        }
      }
    }
  }
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_259DF7A50();
  __swift_project_value_buffer(v40, (uint64_t)qword_26A3F63A0);
  uint64_t v41 = sub_259DF7A30();
  os_log_type_t v42 = sub_259DF7DA0();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v43 = 0;
    _os_log_impl(&dword_259DBD000, v41, v42, "Invalid index.", v43, 2u);
    MEMORY[0x25A2EC590](v43, -1, -1);
  }

  uint64_t v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v128 + 56);
  return v44(a9, 1, 1, v33);
}

void sub_259DF3E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned char *a10)
{
  if ((a5 - 1) > 9u) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = qword_259DF9D88[(char)(a5 - 1)];
  }
  uint64_t v12 = a6 * v11;
  if ((unsigned __int128)(a6 * (__int128)v11) >> 64 != (a6 * v11) >> 63)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v13 = *(void *)(a7 + 32);
  if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once();
    goto LABEL_10;
  }
  if (*(void *)(a8 + 24) == v12 * v13)
  {
    sub_259DF7A70();
    if ((v14 & 1) == 0)
    {
      *a10 = 1;
      return;
    }
    sub_259DC6E50();
    swift_willThrowTypedImpl();
    if (qword_26A3F3140 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_259DF7A50();
    __swift_project_value_buffer(v20, (uint64_t)qword_26A3F63A0);
    sub_259DCA11C(a8);
    uint64_t v16 = sub_259DF7A30();
    os_log_type_t v21 = sub_259DF7DA0();
    if (os_log_type_enabled(v16, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 134218240;
      sub_259DF7DE0();
      sub_259DD4584(a8);
      *(_WORD *)(v22 + 12) = 2048;
      sub_259DF7DE0();
      _os_log_impl(&dword_259DBD000, v16, v21, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v22, 0x16u);
      uint64_t v19 = v22;
      goto LABEL_16;
    }
LABEL_17:
    sub_259DD4584(a8);
    goto LABEL_18;
  }
  if (qword_26A3F3140 != -1) {
    goto LABEL_21;
  }
LABEL_10:
  uint64_t v15 = sub_259DF7A50();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A3F63A0);
  sub_259DCA11C(a8);
  uint64_t v16 = sub_259DF7A30();
  os_log_type_t v17 = sub_259DF7DA0();
  if (!os_log_type_enabled(v16, v17)) {
    goto LABEL_17;
  }
  uint64_t v18 = swift_slowAlloc();
  *(_DWORD *)uint64_t v18 = 134218240;
  sub_259DF7DE0();
  sub_259DD4584(a8);
  *(_WORD *)(v18 + 12) = 2048;
  sub_259DF7DE0();
  _os_log_impl(&dword_259DBD000, v16, v17, "Found invalid chunk: %lld vs %ld", (uint8_t *)v18, 0x16u);
  uint64_t v19 = v18;
LABEL_16:
  MEMORY[0x25A2EC590](v19, -1, -1);
LABEL_18:
}

uint64_t AsyncTensorSequence.maxBatchSize.getter()
{
  return *(void *)v0;
}

uint64_t AsyncTensorSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  return sub_259DF4684(v1, a1);
}

uint64_t AsyncTensorSequence.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_259DF418C, 0, 0);
}

uint64_t sub_259DF418C()
{
  if ((sub_259DF7CF0() & 1) != 0
    || (uint64_t v1 = v0[3],
        uint64_t v2 = (int *)type metadata accessor for AsyncTensorSequence(),
        uint64_t v3 = v2[9],
        unint64_t v4 = *(void *)(v1 + v3),
        uint64_t v5 = *(void *)(v1 + v2[8]),
        v4 >= *(void *)(v5 + 16)))
  {
    uint64_t v10 = v0[2];
    uint64_t v11 = sub_259DF7A20();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  else
  {
    uint64_t v6 = v0[2];
    uint64_t v7 = v5 + 16 * v4;
    uint64_t v8 = *(NSObject **)(v7 + 32);
    uint64_t v9 = *(void *)(v7 + 40);
    *(void *)(v1 + v3) = v4 + 1;
    sub_259DEEFE0(*(void *)(v1 + 16), *(void *)(v1 + 24), v8, v9, v1 + v2[7], v6);
  }
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_259DF4284@<X0>(uint64_t a1@<X8>)
{
  return sub_259DF5304(v1, a1);
}

uint64_t sub_259DF4290(uint64_t a1)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_259DF433C;
  return MEMORY[0x270FA2498](sub_259DF418C, 0, 0);
}

uint64_t sub_259DF433C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_259DF4434(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_26A3F3878 + dword_26A3F3878);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_259DF4508;
  return v5(a1);
}

uint64_t sub_259DF4508()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for AsyncTensorSequence()
{
  uint64_t result = qword_26A3F3860;
  if (!qword_26A3F3860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_259DF4650(uint64_t a1, uint64_t a2)
{
  sub_259DF27AC(a1, a2, *(void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(unsigned char *)(v2 + 48), *(void *)(v2 + 56), *(unsigned char **)(v2 + 64));
}

uint64_t sub_259DF4684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AsyncTensorSequence();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259DF46E8()
{
  return sub_259DF4730(qword_26A3F3848, (void (*)(uint64_t))type metadata accessor for AsyncTensorSequence);
}

uint64_t sub_259DF4730(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for AsyncTensorSequence(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[7];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_259DF7900();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(uint64_t *)((char *)v4 + v16) = *(uint64_t *)((char *)a2 + v16);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AsyncTensorSequence(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_259DF7900();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AsyncTensorSequence(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[7];
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  uint64_t v10 = sub_259DF7900();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AsyncTensorSequence(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_259DF7900();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for AsyncTensorSequence(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_259DF7900();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

void *assignWithTake for AsyncTensorSequence(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_259DF7900();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncTensorSequence(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_259DF5074);
}

uint64_t sub_259DF5074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AsyncTensorSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_259DF513C);
}

uint64_t sub_259DF513C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3F3288);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_259DF51E8()
{
  sub_259DF52AC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_259DF52AC()
{
  if (!qword_26A3F3870)
  {
    sub_259DF7900();
    unint64_t v0 = sub_259DF7DB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A3F3870);
    }
  }
}

uint64_t sub_259DF5304(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AsyncTensorSequence();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_259DF5368(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_259DF53C4()
{
  return sub_259DF7C30();
}

uint64_t sub_259DF5414@<X0>(uint64_t *a1@<X8>)
{
  sub_259DF5480();
  uint64_t result = sub_259DF7730();
  *a1 = result;
  return result;
}

unint64_t sub_259DF5480()
{
  unint64_t result = qword_26A3F3888;
  if (!qword_26A3F3888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3888);
  }
  return result;
}

uint64_t sub_259DF54D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AsyncTensorSequence();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_259DF5530(uint64_t a1, uint64_t a2)
{
  sub_259DF3E28(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned char *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(unsigned char **)(v2 + 72));
}

uint64_t sub_259DF5568()
{
  uint64_t v0 = FieldType.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == FieldType.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_259DF80E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_259DF5600(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 1635017060;
    }
    else {
      uint64_t v3 = 0x7865646E69;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE400000000000000;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 1635017060;
      }
      else {
        uint64_t v6 = 0x7865646E69;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE400000000000000;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    uint64_t v3 = 0x656C706D6973;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x656C706D6973)
  {
LABEL_21:
    char v8 = sub_259DF80E0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_259DF56FC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x657A69746E617571;
  }
  else {
    uint64_t v3 = 0x6572706D6F636E75;
  }
  if (v2) {
    unint64_t v4 = 0xEC00000064657373;
  }
  else {
    unint64_t v4 = 0xE900000000000064;
  }
  if (a2) {
    uint64_t v5 = 0x657A69746E617571;
  }
  else {
    uint64_t v5 = 0x6572706D6F636E75;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000064;
  }
  else {
    unint64_t v6 = 0xEC00000064657373;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_259DF80E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_259DF57B0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x614D6E6D756C6F63;
  }
  else {
    uint64_t v3 = 0x726F6A614D776F72;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xEB00000000726F6ALL;
  }
  if (a2) {
    uint64_t v5 = 0x614D6E6D756C6F63;
  }
  else {
    uint64_t v5 = 0x726F6A614D776F72;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000726F6ALL;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_259DF80E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t computeQuantizationParameters<A, B, C>(_:upperbound:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, double *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v72 = a8;
  uint64_t v73 = a6;
  unint64_t v74 = a9;
  uint64_t v75 = a5;
  uint64_t v64 = a2;
  uint64_t v67 = a4;
  uint64_t v70 = *(void *)(a4 - 8);
  uint64_t v63 = a10;
  MEMORY[0x270FA5388](a1);
  uint64_t v66 = (char *)v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = *(void *)(v15 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v18 = (char *)v54 - v17;
  uint64_t v57 = sub_259DF7DB0();
  uint64_t v56 = *(void *)(v57 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v57);
  char v58 = (char *)v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v54 - v22;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v21);
  uint64_t v65 = (char *)v54 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v69 = (char *)v54 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)v54 - v29;
  uint64_t v71 = a7;
  uint64_t v62 = *(void *)(a7 + 16);
  uint64_t v59 = a11;
  uint64_t v60 = a1;
  sub_259DF7BB0();
  uint64_t v55 = v24;
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v32 = v31(v23, 1, a3);
  os_log_type_t v68 = v30;
  v54[1] = AssociatedTypeWitness;
  v54[0] = v18;
  if (v32 == 1)
  {
    swift_getAssociatedConformanceWitness();
    sub_259DF80F0();
    sub_259DF80B0();
    uint64_t v33 = v56;
    uint64_t v34 = v57;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v23, v57);
    uint64_t v35 = v55;
  }
  else
  {
    uint64_t v35 = v55;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v30, v23, a3);
    uint64_t v34 = v57;
    uint64_t v33 = v56;
  }
  uint64_t v36 = v58;
  sub_259DF7BC0();
  int v37 = v31(v36, 1, a3);
  uint64_t v38 = v67;
  if (v37 == 1)
  {
    swift_getAssociatedConformanceWitness();
    sub_259DF80F0();
    unsigned int v39 = v69;
    sub_259DF80B0();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v34);
  }
  else
  {
    unsigned int v39 = v69;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v69, v36, a3);
  }
  uint64_t v40 = v70;
  uint64_t v41 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v66, v64, v38);
  if (sub_259DF7E10() < 65)
  {
    char v43 = sub_259DF7E20();
    uint64_t v44 = sub_259DF7E00();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v38);
    if (v43) {
      double v42 = (double)v44;
    }
    else {
      double v42 = (double)(unint64_t)v44;
    }
  }
  else
  {
    sub_259DCAC84();
    sub_259DF6A1C();
    sub_259DF7B10();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v38);
    double v42 = v77[0];
  }
  uint64_t v45 = v68;
  uint64_t v46 = v65;
  sub_259DF7F60();
  sub_259DCAC84();
  sub_259DF7B00();
  double v47 = v42 / v77[0];
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v46, v39, a3);
  sub_259DF7B00();
  double v48 = -(v77[0] * v47);
  (*(void (**)(double *__return_ptr, uint64_t))(v72 + 8))(v77, v38);
  char v49 = LOBYTE(v77[0]);
  (*(void (**)(char *__return_ptr, uint64_t))(v73 + 8))(&v76, a3);
  uint64_t v50 = *(void (**)(char *, uint64_t))(v35 + 8);
  v50(v39, a3);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v50)(v45, a3);
  char v52 = v76;
  char v53 = v74;
  *unint64_t v74 = v48;
  v53[1] = v47;
  *((unsigned char *)v53 + 16) = v49;
  *((unsigned char *)v53 + 17) = v52;
  return result;
}

uint64_t quantizeArray<A, B, C>(_:parameters:)(uint64_t a1, uint64_t *a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v16)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(uint64_t *__return_ptr, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void v51[12];
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;

  uint64_t v54 = a7;
  uint64_t v55 = a1;
  uint64_t v13 = *a2;
  uint64_t v14 = a2[1];
  uint64_t v57 = *((unsigned __int8 *)a2 + 16);
  int v15 = *((unsigned __int8 *)a2 + 17);
  uint64_t v16 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a6 + 8);
  v16(&v59, a3, a6);
  uint64_t v56 = v15;
  LOBYTE(v58) = v15;
  uint64_t v17 = FieldType.rawValue.getter();
  uint64_t v19 = v18;
  if (v17 == FieldType.rawValue.getter() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_259DF7A50();
      __swift_project_value_buffer(v33, (uint64_t)qword_26A3F63A0);
      uint64_t v34 = sub_259DF7A30();
      uint64_t v35 = sub_259DF7DA0();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        int v37 = swift_slowAlloc();
        uint64_t v59 = v37;
        *(_DWORD *)uint64_t v36 = 136315394;
        v16(&v58, a3, a6);
        uint64_t v38 = FieldType.description.getter();
        char v58 = sub_259DC6D7C(v38, v39, &v59);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        LOBYTE(v58) = v56;
        uint64_t v40 = FieldType.description.getter();
        char v58 = sub_259DC6D7C(v40, v41, &v59);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v34, v35, "Invalid input type %s for quantization logical type: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v37, -1, -1);
        MEMORY[0x25A2EC590](v36, -1, -1);
      }

      return 0;
    }
  }
  uint64_t v22 = *(void (**)(uint64_t *__return_ptr, char *, uint64_t))(a8 + 8);
  v22(&v59, a4, a8);
  LOBYTE(v58) = v57;
  uint64_t v23 = FieldType.rawValue.getter();
  uint64_t v25 = v24;
  if (v23 == FieldType.rawValue.getter() && v25 == v26)
  {
    uint64_t v27 = swift_bridgeObjectRelease_n();
LABEL_9:
    MEMORY[0x270FA5388](v27);
    v51[2] = a3;
    v51[3] = a4;
    v51[4] = a5;
    v51[5] = a6;
    v51[6] = v54;
    v51[7] = a8;
    v51[8] = v30;
    v51[9] = v29;
    v51[10] = v13;
    v51[11] = v14;
    char v52 = v57;
    char v53 = v56;
    return sub_259DF6D20((void (*)(char *, char *))sub_259DF760C, (uint64_t)v51, a5, a4, MEMORY[0x263F8E628], v29, MEMORY[0x263F8E658], v31);
  }
  uint64_t v28 = sub_259DF80E0();
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_bridgeObjectRelease();
  if (v28) {
    goto LABEL_9;
  }
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  double v42 = sub_259DF7A50();
  __swift_project_value_buffer(v42, (uint64_t)qword_26A3F63A0);
  char v43 = sub_259DF7A30();
  uint64_t v44 = sub_259DF7DA0();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v59 = v46;
    *(_DWORD *)uint64_t v45 = 136315394;
    v22(&v58, a4, a8);
    double v47 = FieldType.description.getter();
    char v58 = sub_259DC6D7C(v47, v48, &v59);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    LOBYTE(v58) = v57;
    char v49 = FieldType.description.getter();
    char v58 = sub_259DC6D7C(v49, v50, &v59);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259DBD000, v43, v44, "Invalid output type %s for quantization physical type: %s", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v46, -1, -1);
    MEMORY[0x25A2EC590](v45, -1, -1);
  }

  return 0;
}

uint64_t rebuildArray<A, B, C>(_:parameters:)(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v16)(uint64_t *__return_ptr, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void v51[12];
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;

  uint64_t v54 = a7;
  uint64_t v55 = a1;
  uint64_t v13 = *a2;
  uint64_t v14 = a2[1];
  uint64_t v57 = *((unsigned __int8 *)a2 + 16);
  int v15 = *((unsigned __int8 *)a2 + 17);
  uint64_t v16 = *(void (**)(uint64_t *__return_ptr, char *, uint64_t))(a6 + 8);
  v16(&v59, a3, a6);
  uint64_t v56 = v15;
  LOBYTE(v58) = v15;
  uint64_t v17 = FieldType.rawValue.getter();
  uint64_t v19 = v18;
  if (v17 == FieldType.rawValue.getter() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v21 = sub_259DF80E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_26A3F3140 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_259DF7A50();
      __swift_project_value_buffer(v33, (uint64_t)qword_26A3F63A0);
      uint64_t v34 = sub_259DF7A30();
      uint64_t v35 = sub_259DF7DA0();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        int v37 = swift_slowAlloc();
        uint64_t v59 = v37;
        *(_DWORD *)uint64_t v36 = 136315394;
        v16(&v58, a3, a6);
        uint64_t v38 = FieldType.description.getter();
        char v58 = sub_259DC6D7C(v38, v39, &v59);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        LOBYTE(v58) = v56;
        uint64_t v40 = FieldType.description.getter();
        char v58 = sub_259DC6D7C(v40, v41, &v59);
        sub_259DF7DE0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_259DBD000, v34, v35, "Invalid input type %s for quantization logical type: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2EC590](v37, -1, -1);
        MEMORY[0x25A2EC590](v36, -1, -1);
      }

      return 0;
    }
  }
  uint64_t v22 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a8 + 8);
  v22(&v59, a4, a8);
  LOBYTE(v58) = v57;
  uint64_t v23 = FieldType.rawValue.getter();
  uint64_t v25 = v24;
  if (v23 == FieldType.rawValue.getter() && v25 == v26)
  {
    uint64_t v27 = swift_bridgeObjectRelease_n();
LABEL_9:
    MEMORY[0x270FA5388](v27);
    v51[2] = a3;
    v51[3] = a4;
    v51[4] = a5;
    v51[5] = a6;
    v51[6] = v54;
    v51[7] = a8;
    v51[8] = v30;
    v51[9] = v29;
    v51[10] = v13;
    v51[11] = v14;
    char v52 = v57;
    char v53 = v56;
    return sub_259DF6D20((void (*)(char *, char *))sub_259DF7638, (uint64_t)v51, a5, a3, MEMORY[0x263F8E628], v29, MEMORY[0x263F8E658], v31);
  }
  uint64_t v28 = sub_259DF80E0();
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_bridgeObjectRelease();
  if (v28) {
    goto LABEL_9;
  }
  if (qword_26A3F3140 != -1) {
    swift_once();
  }
  double v42 = sub_259DF7A50();
  __swift_project_value_buffer(v42, (uint64_t)qword_26A3F63A0);
  char v43 = sub_259DF7A30();
  uint64_t v44 = sub_259DF7DA0();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v59 = v46;
    *(_DWORD *)uint64_t v45 = 136315394;
    v22(&v58, a4, a8);
    double v47 = FieldType.description.getter();
    char v58 = sub_259DC6D7C(v47, v48, &v59);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    LOBYTE(v58) = v57;
    char v49 = FieldType.description.getter();
    char v58 = sub_259DC6D7C(v49, v50, &v59);
    sub_259DF7DE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_259DBD000, v43, v44, "Invalid output type %s for quantization physical type: %s", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2EC590](v46, -1, -1);
    MEMORY[0x25A2EC590](v45, -1, -1);
  }

  return 0;
}

unint64_t sub_259DF6A1C()
{
  unint64_t result = qword_26A3F3890;
  if (!qword_26A3F3890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3F3890);
  }
  return result;
}

uint64_t sub_259DF6A70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X6>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, uint64_t a7)
{
  v26[2] = a4;
  v26[1] = a3;
  v26[0] = a7;
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v10);
  uint64_t v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)v26 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v26 - v21;
  (*(void (**)(char *))(v23 + 16))(v12);
  sub_259DCAC84();
  sub_259DF7B00();
  double v27 = v27 * a6 + a5;
  sub_259DF7E30();
  sub_259DF7F30();
  sub_259DF8100();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v17, a2);
  sub_259DF7F20();
  sub_259DF8110();
  v24(v17, a2);
  v24(v20, a2);
  return ((uint64_t (*)(char *, uint64_t))v24)(v22, a2);
}

uint64_t sub_259DF6D20(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  uint64_t v59 = a4;
  uint64_t v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v53 = (char *)&v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v41 = (char *)&v40 - v17;
  uint64_t v18 = sub_259DF7DB0();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v51 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v50 = *((void *)v15 - 1);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  char v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v30 = (char *)&v40 - v29;
  uint64_t v31 = sub_259DF7B90();
  uint64_t v61 = sub_259DF7EE0();
  uint64_t v56 = sub_259DF7EF0();
  sub_259DF7EC0();
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  uint64_t v59 = v30;
  uint64_t result = sub_259DF7B80();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    uint64_t v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_259DF7DD0();
      uint64_t result = (*v33)(v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v23, AssociatedTypeWitness);
      sub_259DF7ED0();
      if (!--v31)
      {
        uint64_t v35 = v54;
        uint64_t v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  uint64_t v36 = v51;
LABEL_9:
  sub_259DF7DD0();
  uint64_t v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    int v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    char v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    uint64_t v38 = (void (**)(char *, uint64_t))(v35 + 8);
    unsigned int v39 = v41;
    int v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_259DF7ED0();
      sub_259DF7DD0();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v37, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

uint64_t sub_259DF741C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  char v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  if (sub_259DF7E10() < 65)
  {
    v9[1] = a3;
    sub_259DF7E20();
    sub_259DF7E00();
  }
  else
  {
    sub_259DCAC84();
    sub_259DF6A1C();
    sub_259DF7B10();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a2);
  return sub_259DF7B20();
}

uint64_t sub_259DF760C(uint64_t a1, uint64_t a2)
{
  return sub_259DF7664(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, double, double, void, void, uint64_t))sub_259DF6A70);
}

uint64_t sub_259DF7638(uint64_t a1, uint64_t a2)
{
  return sub_259DF7664(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, double, double, void, void, uint64_t))sub_259DF741C);
}

uint64_t sub_259DF7664(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void, void, void, void, void, void, void, double, double, void, void, uint64_t))
{
  return a3(a1, *(unsigned __int16 *)(v3 + 96), *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(double *)(v3 + 80), *(double *)(v3 + 88), *(void *)(v3 + 64), *(void *)(v3 + 72), a2);
}

uint64_t sub_259DF76B0()
{
  return MEMORY[0x270EEDD88]();
}

uint64_t sub_259DF76C0()
{
  return MEMORY[0x270EEDDA0]();
}

uint64_t sub_259DF76D0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_259DF76E0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_259DF76F0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_259DF7700()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_259DF7710()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_259DF7720()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_259DF7730()
{
  return MEMORY[0x270EEE298]();
}

uint64_t sub_259DF7740()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_259DF7750()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_259DF7760()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_259DF7770()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_259DF7780()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_259DF7790()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_259DF77A0()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_259DF77B0()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_259DF77C0()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_259DF77D0()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_259DF77E0()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_259DF77F0()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_259DF7800()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_259DF7810()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_259DF7820()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_259DF7830()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_259DF7840()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_259DF7850()
{
  return MEMORY[0x270F05918]();
}

uint64_t sub_259DF7860()
{
  return MEMORY[0x270F05930]();
}

uint64_t sub_259DF7870()
{
  return MEMORY[0x270F05980]();
}

uint64_t sub_259DF7880()
{
  return MEMORY[0x270F05988]();
}

uint64_t sub_259DF7890()
{
  return MEMORY[0x270F059A8]();
}

uint64_t sub_259DF78A0()
{
  return MEMORY[0x270F059D8]();
}

uint64_t sub_259DF78B0()
{
  return MEMORY[0x270F059F0]();
}

uint64_t sub_259DF78C0()
{
  return MEMORY[0x270F05A40]();
}

uint64_t sub_259DF78D0()
{
  return MEMORY[0x270F05A68]();
}

uint64_t sub_259DF78E0()
{
  return MEMORY[0x270F05B28]();
}

uint64_t sub_259DF78F0()
{
  return MEMORY[0x270F4DD80]();
}

uint64_t sub_259DF7900()
{
  return MEMORY[0x270F4DD98]();
}

uint64_t sub_259DF7910()
{
  return MEMORY[0x270F4DDB0]();
}

uint64_t sub_259DF7920()
{
  return MEMORY[0x270F4DDB8]();
}

uint64_t sub_259DF7930()
{
  return MEMORY[0x270F4DDC0]();
}

uint64_t sub_259DF7940()
{
  return MEMORY[0x270F4DDC8]();
}

uint64_t sub_259DF7950()
{
  return MEMORY[0x270F4DDD8]();
}

uint64_t sub_259DF7960()
{
  return MEMORY[0x270F4DDF0]();
}

uint64_t sub_259DF7970()
{
  return MEMORY[0x270F4E150]();
}

uint64_t sub_259DF7980()
{
  return MEMORY[0x270F4E158]();
}

uint64_t sub_259DF7990()
{
  return MEMORY[0x270F4E188]();
}

uint64_t sub_259DF79A0()
{
  return MEMORY[0x270F4E1B0]();
}

uint64_t sub_259DF79B0()
{
  return MEMORY[0x270F4E1E0]();
}

uint64_t sub_259DF79C0()
{
  return MEMORY[0x270F4E218]();
}

uint64_t sub_259DF79D0()
{
  return MEMORY[0x270F4E228]();
}

uint64_t sub_259DF79E0()
{
  return MEMORY[0x270F4E240]();
}

uint64_t sub_259DF79F0()
{
  return MEMORY[0x270F4E250]();
}

uint64_t sub_259DF7A00()
{
  return MEMORY[0x270F4E268]();
}

uint64_t sub_259DF7A10()
{
  return MEMORY[0x270F4E2B0]();
}

uint64_t sub_259DF7A20()
{
  return MEMORY[0x270F4E2F8]();
}

uint64_t sub_259DF7A30()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259DF7A40()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_259DF7A50()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259DF7A60()
{
  return MEMORY[0x270FA1510]();
}

uint64_t sub_259DF7A70()
{
  return MEMORY[0x270FA1518]();
}

uint64_t sub_259DF7A80()
{
  return MEMORY[0x270FA1520]();
}

uint64_t sub_259DF7A90()
{
  return MEMORY[0x270FA1528]();
}

uint64_t sub_259DF7AA0()
{
  return MEMORY[0x270FA1530]();
}

uint64_t sub_259DF7AB0()
{
  return MEMORY[0x270FA1538]();
}

uint64_t sub_259DF7AC0()
{
  return MEMORY[0x270FA1540]();
}

uint64_t sub_259DF7AD0()
{
  return MEMORY[0x270FA1568]();
}

uint64_t sub_259DF7AE0()
{
  return MEMORY[0x270FA1618]();
}

uint64_t sub_259DF7AF0()
{
  return MEMORY[0x270FA1620]();
}

uint64_t sub_259DF7B00()
{
  return MEMORY[0x270F9D010]();
}

uint64_t sub_259DF7B10()
{
  return MEMORY[0x270F9D030]();
}

uint64_t sub_259DF7B20()
{
  return MEMORY[0x270F9D040]();
}

uint64_t sub_259DF7B30()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_259DF7B40()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_259DF7B50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259DF7B60()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_259DF7B70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_259DF7B80()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_259DF7B90()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_259DF7BA0()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_259DF7BB0()
{
  return MEMORY[0x270F9D9F0]();
}

uint64_t sub_259DF7BC0()
{
  return MEMORY[0x270F9D9F8]();
}

uint64_t sub_259DF7BD0()
{
  return MEMORY[0x270F9DA00]();
}

uint64_t sub_259DF7BE0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_259DF7BF0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_259DF7C00()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_259DF7C10()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_259DF7C20()
{
  return MEMORY[0x270F9DBE0]();
}

uint64_t sub_259DF7C30()
{
  return MEMORY[0x270F9DBE8]();
}

uint64_t sub_259DF7C40()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_259DF7C50()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_259DF7C60()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_259DF7C70()
{
  return MEMORY[0x270F9DC28]();
}

uint64_t sub_259DF7C80()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_259DF7C90()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_259DF7CA0()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_259DF7CB0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_259DF7CC0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_259DF7CD0()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_259DF7CF0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_259DF7D00()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_259DF7D10()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_259DF7D20()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_259DF7D30()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_259DF7D40()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_259DF7D50()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_259DF7D60()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_259DF7D70()
{
  return MEMORY[0x270F9E1D8]();
}

uint64_t sub_259DF7D80()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_259DF7D90()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_259DF7DA0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_259DF7DB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_259DF7DC0()
{
  return MEMORY[0x270F9E400]();
}

uint64_t sub_259DF7DD0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_259DF7DE0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_259DF7DF0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_259DF7E00()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_259DF7E10()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_259DF7E20()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_259DF7E30()
{
  return MEMORY[0x270F9E660]();
}

uint64_t sub_259DF7E40()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_259DF7E50()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_259DF7E60()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_259DF7E70()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_259DF7E80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_259DF7E90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_259DF7EA0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_259DF7EB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_259DF7EC0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_259DF7ED0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_259DF7EE0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_259DF7EF0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_259DF7F00()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_259DF7F10()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_259DF7F20()
{
  return MEMORY[0x270F9EE68]();
}

uint64_t sub_259DF7F30()
{
  return MEMORY[0x270F9EE70]();
}

uint64_t sub_259DF7F40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_259DF7F50()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_259DF7F60()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_259DF7F70()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_259DF7F80()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_259DF7F90()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_259DF7FA0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_259DF7FB0()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_259DF7FC0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_259DF7FD0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_259DF7FE0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_259DF7FF0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_259DF8000()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_259DF8010()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_259DF8020()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_259DF8030()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_259DF8040()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_259DF8050()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_259DF8060()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_259DF8070()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_259DF8080()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_259DF8090()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_259DF80A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_259DF80B0()
{
  return MEMORY[0x270F9F740]();
}

uint64_t sub_259DF80C0()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_259DF80D0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_259DF80E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_259DF80F0()
{
  return MEMORY[0x270F9FA70]();
}

uint64_t sub_259DF8100()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_259DF8110()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_259DF8120()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_259DF8130()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_259DF8140()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_259DF8150()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259DF8160()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_259DF8170()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_259DF8180()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_259DF8190()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_259DF81A0()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_259DF81B0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_259DF81C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_259DF81F0()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}