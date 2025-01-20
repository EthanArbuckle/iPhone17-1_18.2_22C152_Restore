void *sub_1E4494E10(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v5 = a4 + 64;
  v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    v7 = ~(-1 << -(char)v6);
  }
  else {
    v7 = -1;
  }
  v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  v10 = a2;
  v25 = -1 << *(unsigned char *)(a4 + 32);
  v26 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = 16 * v15;
    v20 = (void *)(*(void *)(a4 + 48) + 16 * v15);
    v21 = v20[1];
    v22 = (uint64_t *)(*(void *)(a4 + 56) + v19);
    v24 = *v22;
    v23 = v22[1];
    *v10 = *v20;
    v10[1] = v21;
    v10[2] = v24;
    v10[3] = v23;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      sub_1E44957E4(v24, v23);
      goto LABEL_38;
    }
    v10 += 4;
    swift_bridgeObjectRetain();
    result = (void *)sub_1E44957E4(v24, v23);
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v16 >= v13) {
      goto LABEL_33;
    }
    v17 = *(void *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(void *)(v5 + 8 * v11);
        if (v17) {
          goto LABEL_14;
        }
        v18 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_33;
        }
        v17 = *(void *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(void *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(void *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(void *)(v5 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v25;
      result = v26;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1E449503C(__int16 a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sub_1E451B7B8();
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  MEMORY[0x1F4188790](v2);
  v33 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E451B7E8();
  uint64_t v34 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E451B7D8();
  LOWORD(v42[0]) = a1;
  uint64_t v7 = sub_1E44AF788((uint64_t)v42, (uint64_t)v42 + 2);
  uint64_t v9 = v7;
  unint64_t v10 = v8;
  unint64_t v37 = v8;
  uint64_t v38 = v7;
  switch(v8 >> 62)
  {
    case 1uLL:
      if (v7 >> 32 < (int)v7) {
        goto LABEL_30;
      }
      sub_1E44957E4(v38, v37);
      sub_1E44E1578((int)v9, v9 >> 32);
      uint64_t v15 = v38;
LABEL_8:
      unint64_t v16 = v37;
      break;
    case 2uLL:
      uint64_t v11 = *(void *)(v7 + 16);
      uint64_t v12 = *(void *)(v38 + 24);
      sub_1E44957E4(v38, v37);
      swift_retain();
      swift_retain();
      uint64_t v13 = v11;
      uint64_t v14 = v38;
      sub_1E44E1578(v13, v12);
      swift_release();
      swift_release();
      uint64_t v15 = v14;
      goto LABEL_8;
    case 3uLL:
      sub_1E449583C(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
      memset(v42, 0, 14);
      goto LABEL_5;
    default:
      v42[0] = (void *)v7;
      LOWORD(v42[1]) = v8;
      BYTE2(v42[1]) = BYTE2(v8);
      BYTE3(v42[1]) = BYTE3(v8);
      BYTE4(v42[1]) = BYTE4(v8);
      BYTE5(v42[1]) = BYTE5(v8);
      sub_1E449583C(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
LABEL_5:
      sub_1E451B7A8();
      uint64_t v15 = v9;
      unint64_t v16 = v10;
      break;
  }
  sub_1E4496E64(v15, v16);
  uint64_t v17 = swift_bridgeObjectRetain();
  v42[0] = sub_1E44A962C(v17);
  sub_1E44A9FA0(v42);
  swift_bridgeObjectRelease();
  v18 = v42[0];
  uint64_t v19 = v42[0][2];
  if (v19)
  {
    v32[1] = 0;
    swift_retain();
    v32[0] = v18;
    v20 = v18 + 7;
    uint64_t v39 = v4;
    v40 = v6;
    while (2)
    {
      uint64_t v21 = *(v20 - 1);
      unint64_t v22 = *v20;
      unint64_t v23 = *v20 >> 62;
      v20 += 4;
      switch(v23)
      {
        case 1uLL:
          if (v21 >> 32 < (int)v21)
          {
            __break(1u);
LABEL_27:
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
          }
          sub_1E44957E4(v21, v22);
          if (sub_1E451B038() && __OFSUB__((int)v21, sub_1E451B068())) {
            goto LABEL_29;
          }
          sub_1E451B058();
          sub_1E449583C(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
          v6 = v40;
LABEL_12:
          sub_1E451B7A8();
LABEL_13:
          sub_1E4496E64(v21, v22);
          if (--v19) {
            continue;
          }
          swift_release();
          break;
        case 2uLL:
          uint64_t v25 = *(void *)(v21 + 16);
          uint64_t v24 = *(void *)(v21 + 24);
          sub_1E44957E4(v21, v22);
          swift_retain();
          swift_retain();
          if (sub_1E451B038() && __OFSUB__(v25, sub_1E451B068())) {
            goto LABEL_28;
          }
          if (__OFSUB__(v24, v25)) {
            goto LABEL_27;
          }
          sub_1E451B058();
          sub_1E449583C(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
          uint64_t v4 = v39;
          v6 = v40;
          sub_1E451B7A8();
          swift_release();
          swift_release();
          goto LABEL_13;
        case 3uLL:
          sub_1E449583C(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
          memset(v42, 0, 14);
          goto LABEL_12;
        default:
          v42[0] = (void *)v21;
          LOWORD(v42[1]) = v22;
          BYTE2(v42[1]) = BYTE2(v22);
          BYTE3(v42[1]) = BYTE3(v22);
          BYTE4(v42[1]) = BYTE4(v22);
          BYTE5(v42[1]) = BYTE5(v22);
          sub_1E449583C(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
          goto LABEL_12;
      }
      break;
    }
  }
  swift_release();
  v26 = v33;
  sub_1E451B7C8();
  uint64_t v27 = v36;
  uint64_t v43 = v36;
  uint64_t v44 = sub_1E449583C(&qword_1EBFF5810, MEMORY[0x1E4F24F80]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v42);
  uint64_t v29 = v35;
  (*(void (**)(uint64_t *, char *, uint64_t))(v35 + 16))(boxed_opaque_existential_1, v26, v27);
  __swift_project_boxed_opaque_existential_1(v42, v43);
  sub_1E451B088();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v27);
  uint64_t v30 = v41;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  sub_1E4496E64(v38, v37);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v4);
  return v30;
}

uint64_t sub_1E44957E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1E449583C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *sub_1E4495884@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_1E44AFD64(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_1E44E1C00((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1E44958FC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1E44958FC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1E451B078();
  swift_allocObject();
  uint64_t result = sub_1E451B028();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_1E4495DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4496278(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  if (!a2 || !*(void *)(a2 + 16)) {
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_1E4496570(v6, v5);
  if ((v10 & 1) == 0
    || (uint64_t v11 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v9),
        uint64_t v12 = *v11,
        uint64_t v13 = v11[1],
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        !a3)
    || !*(void *)(a3 + 16)
    || (sub_1E4496570(v12, v13), (v14 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_15:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v23 = (id)sub_1E449A224(v6, v5);
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5858);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  sub_1E4496F6C(v25);
  swift_bridgeObjectRelease();
  id v15 = objc_allocWithZone((Class)TPSContextualInfo);
  unint64_t v16 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v15, sel_initWithDictionary_, v16);

  if (!v17) {
    goto LABEL_15;
  }
  id v18 = objc_msgSend(v17, sel_usageEvents);
  if (!v18) {
    goto LABEL_17;
  }
  uint64_t v19 = v18;
  sub_1E449AE1C(0, &qword_1EBFF50C8);
  unint64_t v20 = sub_1E451B948();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v21)
  {
LABEL_17:

    goto LABEL_15;
  }
  unint64_t v22 = (uint64_t *)(a4 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v23 = v17;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v26 = *v22;
  *unint64_t v22 = 0x8000000000000000;
  sub_1E449ACAC((uint64_t)v23, v6, v5, isUniquelyReferenced_nonNull_native);
  *unint64_t v22 = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_16:
}

unint64_t sub_1E4496570(uint64_t a1, uint64_t a2)
{
  sub_1E451BEB8();
  sub_1E451B8B8();
  uint64_t v4 = sub_1E451BEE8();

  return sub_1E44965E8(a1, a2, v4);
}

unint64_t sub_1E44965E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E451BDE8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1E451BDE8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1E44966CC()
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = sub_1E451B7B8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1E451B898();
  uint64_t v4 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  unint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E451B7E8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v33 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E451B7D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5970);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E451FE30;
  *(void *)(inited + 32) = swift_getKeyPath();
  *(void *)(inited + 40) = swift_getKeyPath();
  *(void *)(inited + 48) = swift_getKeyPath();
  v38[0] = inited;
  sub_1E451B968();
  uint64_t v11 = v38[0];
  unint64_t v35 = v38[0] & 0xC000000000000001;
  if ((v38[0] & 0xC000000000000001) == 0 && *(void *)((v38[0] & 0xFFFFFFFFFFFFFF8) + 0x10) < 3uLL) {
    goto LABEL_28;
  }
  uint64_t v26 = v8;
  uint64_t v27 = v3;
  uint64_t v28 = v1;
  uint64_t v29 = v0;
  uint64_t v12 = 0;
  uint64_t v31 = v7;
  uint64_t v13 = v32;
  uint64_t v34 = v38[0];
  do
  {
    if (v35) {
      MEMORY[0x1E4E804B0](v12, v11);
    }
    else {
      swift_retain();
    }
    unint64_t v37 = v13;
    id v14 = v13;
    swift_getAtKeyPath();

    sub_1E451B888();
    uint64_t v15 = sub_1E451B878();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v36);
    if (v17 >> 60 == 15)
    {
      swift_release();
    }
    else
    {
      switch(v17 >> 62)
      {
        case 1uLL:
          if (v15 >> 32 < (int)v15)
          {
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
LABEL_27:
            __break(1u);
LABEL_28:
            __break(1u);
          }
          sub_1E44957E4(v15, v17);
          if (sub_1E451B038() && __OFSUB__((int)v15, sub_1E451B068())) {
            goto LABEL_27;
          }
          sub_1E451B058();
          sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
          uint64_t v7 = v31;
          sub_1E451B7A8();
LABEL_20:
          sub_1E4496EBC(v15, v17);
          swift_release();
          sub_1E4496EBC(v15, v17);
          uint64_t v13 = v32;
          break;
        case 2uLL:
          uint64_t v18 = *(void *)(v15 + 16);
          uint64_t v30 = *(void *)(v15 + 24);
          sub_1E44DB650(v15, v17);
          swift_retain();
          swift_retain();
          if (sub_1E451B038() && __OFSUB__(v18, sub_1E451B068())) {
            goto LABEL_26;
          }
          if (__OFSUB__(v30, v18)) {
            goto LABEL_25;
          }
          sub_1E451B058();
          sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
          uint64_t v7 = v31;
          sub_1E451B7A8();
          swift_release();
          swift_release();
          goto LABEL_20;
        case 3uLL:
          sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
          memset(v38, 0, 14);
          goto LABEL_22;
        default:
          v38[0] = v15;
          LOWORD(v38[1]) = v17;
          BYTE2(v38[1]) = BYTE2(v17);
          BYTE3(v38[1]) = BYTE3(v17);
          BYTE4(v38[1]) = BYTE4(v17);
          BYTE5(v38[1]) = BYTE5(v17);
          sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
LABEL_22:
          sub_1E451B7A8();
          sub_1E4496EBC(v15, v17);
          swift_release();
          sub_1E4496EBC(v15, v17);
          break;
      }
    }
    ++v12;
    uint64_t v11 = v34;
  }
  while (v12 != 3);
  swift_bridgeObjectRelease();
  uint64_t v19 = v27;
  unint64_t v20 = v33;
  sub_1E451B7C8();
  uint64_t v21 = v29;
  uint64_t v39 = v29;
  uint64_t v40 = sub_1E4496ED0(&qword_1EBFF5810, MEMORY[0x1E4F24F80]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
  uint64_t v23 = v28;
  (*(void (**)(uint64_t *, char *, uint64_t))(v28 + 16))(boxed_opaque_existential_1, v19, v21);
  __swift_project_boxed_opaque_existential_1(v38, v39);
  sub_1E451B088();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v21);
  uint64_t v24 = v37;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v7);
  return v24;
}

uint64_t sub_1E4496E64(uint64_t a1, unint64_t a2)
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

uint64_t sub_1E4496EBC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1E4496E64(a1, a2);
  }
  return a1;
}

uint64_t sub_1E4496ED0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1E4496F18()
{
  unint64_t result = qword_1EBFF5820;
  if (!qword_1EBFF5820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5820);
  }
  return result;
}

uint64_t sub_1E4496F6C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5910);
    uint64_t v2 = sub_1E451BD18();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    unint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_1E4497328(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_1E4497328(v35, v36);
    sub_1E4497328(v36, &v32);
    uint64_t result = sub_1E451BBA8();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_1E4497328(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1E44E1E84();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

_OWORD *sub_1E4497328(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1E4497F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

void sub_1E44986BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1E449A224(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1E4496570(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1E44F5160();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1E44F4538(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1E449ACAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1E4496570(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1E44F5160();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1E44F3BEC(v15, a4 & 1);
  unint64_t v20 = sub_1E4496570(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_1E451BE58();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  *char v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_1E449AE1C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1E449B1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a5;
  v19[3] = a6;
  v19[4] = v18;
  v19[5] = a7;
  v19[6] = a8;
  v19[7] = a1;
  v19[8] = a2;
  switch(a3)
  {
    case 9:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1E451B9D8();
      break;
    case 17:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1E451B9F8();
      break;
    case 25:
    case 33:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1E451B9E8();
      break;
    default:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1E451BA08();
      break;
  }
  uint64_t v20 = sub_1E451BA28();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 0, 1, v20);
  char v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EAE48760;
  v21[5] = v19;
  sub_1E4505618((uint64_t)v17, (uint64_t)&unk_1EAE48770, (uint64_t)v21);
  return swift_release();
}

id sub_1E449B404(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int64_t v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = v7;
  v11[4] = sub_1E44AE1C0;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1E44AA230;
  v11[3] = &block_descriptor_85;
  uint64_t v9 = _Block_copy(v11);
  sub_1E449B574(a2);
  swift_retain();
  sub_1E449B574((uint64_t)sub_1E44AE1C0);
  swift_release();
  objc_msgSend(a1, sel_setCompletionBlock_, v9);
  _Block_release(v9);
  swift_release();
  swift_release();
  return objc_msgSend(*(id *)(v3 + OBJC_IVAR___TPSSearchItemIndexer_queue), sel_addOperation_, a1);
}

uint64_t sub_1E449B574(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1E449B5D4(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 264) = a3;
  *(void *)(v4 + 272) = v3;
  *(unsigned char *)(v4 + 481) = a2;
  *(void *)(v4 + 256) = a1;
  type metadata accessor for UserGuideIndexItem(0);
  *(void *)(v4 + 280) = swift_task_alloc();
  uint64_t v5 = sub_1E451B668();
  *(void *)(v4 + 288) = v5;
  *(void *)(v4 + 296) = *(void *)(v5 - 8);
  *(void *)(v4 + 304) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44AD0B0, v3, 0);
}

uint64_t sub_1E449B6C8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E449B75C()
{
  uint64_t v1 = v0[10] + 16;
  id v2 = objc_allocWithZone(MEMORY[0x1E4FAF4A0]);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  v0[18] = objc_msgSend(v2, sel_initWithTransactionName_, v3);

  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4E812E0](v1);
  v0[19] = v4;
  if (v4)
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v0[20] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1E44ADF10;
    return sub_1E44ADCC4();
  }
  else
  {
    int64_t v8 = (uint64_t (*)(void))(v0[11] + *(int *)v0[11]);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[22] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1E44ADDFC;
    return v8();
  }
}

uint64_t sub_1E449B928(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  char v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *char v11 = v2;
  v11[1] = sub_1E44AE0C8;
  return sub_1E449BA04(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1E449BA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[13] = a7;
  v8[14] = a8;
  v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[8] = a2;
  uint64_t v9 = sub_1E451B668();
  v8[15] = v9;
  v8[16] = *(void *)(v9 - 8);
  v8[17] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E449B75C, 0, 0);
}

uint64_t sub_1E449BAD0(uint64_t a1, uint64_t a2)
{
  return sub_1E449B1C4(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1E449BD7C(unint64_t a1)
{
  unint64_t v2 = sub_1E44AA0E0(MEMORY[0x1E4FBC860]);
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1E451BCD8();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v17 = a1 & 0xC000000000000001;
    unint64_t v6 = a1;
    do
    {
      if (v17) {
        id v7 = (id)MEMORY[0x1E4E804B0](v5, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      ++v5;
      id v9 = objc_msgSend(v7, sel_identifier, v17);
      uint64_t v10 = sub_1E451B868();
      uint64_t v12 = v11;

      uint64_t v13 = sub_1E44966CC();
      uint64_t v15 = v14;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1E449BEF4((uint64_t)v13, v15, v10, v12, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 = v6;
    }
    while (v3 != v5);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1E449BEF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1E4496570(a3, a4);
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
    sub_1E44F54C4();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      uint64_t result = sub_1E4496E64(*(void *)v21, *(void *)(v21 + 8));
      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + 8) = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1E449C07C(v17, a5 & 1);
  unint64_t v23 = sub_1E4496570(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
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

uint64_t sub_1E449C07C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58E8);
  char v6 = a2;
  uint64_t v7 = sub_1E451BD08();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
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
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      long long v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_1E44957E4(v37, *((unint64_t *)&v37 + 1));
      }
      sub_1E451BEB8();
      sub_1E451B8B8();
      uint64_t result = sub_1E451BEE8();
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
            goto LABEL_39;
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
      uint64_t v19 = 16 * v18;
      uint64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      void *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_1E449C488(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  uint64_t v5 = sub_1E451B868();
  uint64_t v7 = v6;

  *a3 = v5;
  a3[1] = v7;
}

id getHMClientConnectionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHMClientConnectionClass_softClass_1;
  uint64_t v7 = getHMClientConnectionClass_softClass_1;
  if (!getHMClientConnectionClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getHMClientConnectionClass_block_invoke_1;
    v3[3] = &unk_1E6E6AE20;
    v3[4] = &v4;
    __getHMClientConnectionClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E449D120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E449D524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E449D7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1E449EF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E449F0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E449F1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E449F654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E449FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E44A0E38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E44A16AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
}

void sub_1E44A234C(_Unwind_Exception *a1)
{
}

void sub_1E44A2FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44A33EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_1E44A35D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_1E44A4258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1E44A482C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  objc_destroyWeak(v51);
  objc_destroyWeak(v50);
  objc_destroyWeak(location);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v52 - 232), 8);
  _Block_object_dispose((const void *)(v52 - 176), 8);
  objc_destroyWeak((id *)(v52 - 184));
  _Unwind_Resume(a1);
}

void sub_1E44A5E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *a14, id *location)
{
  objc_destroyWeak(v15);
  _Block_object_dispose(&STACK[0x330], 8);
  objc_destroyWeak(location);
  _Block_object_dispose(&STACK[0x458], 8);
  _Block_object_dispose(&STACK[0x488], 8);
  _Block_object_dispose(&STACK[0x4B8], 8);
  _Block_object_dispose(&STACK[0x4E8], 8);
  _Block_object_dispose(&STACK[0x518], 8);
  _Block_object_dispose(&STACK[0x548], 8);
  _Block_object_dispose(&STACK[0x578], 8);
  _Block_object_dispose(&STACK[0x5F8], 8);
  _Block_object_dispose(&STACK[0x628], 8);
  _Block_object_dispose(&STACK[0x6C0], 8);
  _Block_object_dispose(&STACK[0x6F0], 8);
  _Block_object_dispose(&STACK[0x720], 8);
  _Block_object_dispose(&STACK[0x750], 8);
  _Block_object_dispose(&STACK[0x780], 8);
  _Block_object_dispose(&STACK[0x7B0], 8);
  _Block_object_dispose(&STACK[0x818], 8);
  _Block_object_dispose((const void *)(v16 - 160), 8);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v16 - 168));
  _Unwind_Resume(a1);
}

void sub_1E44A6420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak(v28);
  _Unwind_Resume(a1);
}

void sub_1E44A6780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1E44A6944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44A6BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44A715C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose((const void *)(v28 - 80), 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1E44A7AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1E44A814C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44A865C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44A8A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x1F4186498](v1, v6, v7);
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t objectdestroyTm_1()
{
  _Block_release(*(const void **)(v0 + 40));

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t objectdestroy_3Tm()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1E44A9530(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void *sub_1E44A9540(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t *, void *, uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v6 = (void *)swift_allocObject();
  int64_t v7 = _swift_stdlib_malloc_size(v6);
  uint64_t v8 = v7 - 32;
  if (v7 < 32) {
    uint64_t v8 = v7 - 1;
  }
  v6[2] = v3;
  v6[3] = 2 * (v8 >> 5);
  uint64_t v9 = a3(&v11, v6 + 4, v3, a1);
  swift_bridgeObjectRetain();
  sub_1E44E1E84();
  if (v9 != v3)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v6;
}

void *sub_1E44A962C(uint64_t a1)
{
  return sub_1E44A9540(a1, &qword_1EBFF5948, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t))sub_1E4494E10);
}

char *sub_1E44A964C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5958);
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  char v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1E44A9750(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E44A964C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1E44A9770(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1E451BDB8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_1E44AA00C(0, v3, 1, a1);
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
    goto LABEL_151;
  }
  uint64_t v103 = result;
  v100 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x1E4FBC860];
    v106 = (char *)(MEMORY[0x1E4FBC860] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x1E4FBC860] + 16);
      uint64_t v10 = MEMORY[0x1E4FBC860];
LABEL_117:
      uint64_t result = v10;
      uint64_t v102 = v7;
      if (v11 >= 2)
      {
        uint64_t v92 = *v100;
        do
        {
          unint64_t v93 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v92) {
            goto LABEL_159;
          }
          uint64_t v94 = result;
          uint64_t v95 = *(void *)(result + 32 + 16 * v93);
          uint64_t v96 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_1E44E0BEC((char *)(v92 + 32 * v95), (char *)(v92 + 32 * *(void *)(result + 32 + 16 * (v11 - 1))), v92 + 32 * v96, v106);
          if (v1) {
            break;
          }
          if (v96 < v95) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_1E44E0F18(v94);
            uint64_t v94 = result;
          }
          if (v93 >= *(void *)(v94 + 16)) {
            goto LABEL_148;
          }
          v97 = (void *)(v94 + 32 + 16 * v93);
          void *v97 = v95;
          v97[1] = v96;
          unint64_t v98 = *(void *)(v94 + 16);
          if (v11 > v98) {
            goto LABEL_149;
          }
          memmove((void *)(v94 + 32 + 16 * (v11 - 1)), (const void *)(v94 + 32 + 16 * v11), 16 * (v98 - v11));
          uint64_t result = v94;
          *(void *)(v94 + 16) = v98 - 1;
          unint64_t v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v102 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v102 = MEMORY[0x1E4FBC860];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5868);
    uint64_t result = sub_1E451B988();
    *(void *)(result + 16) = v6;
    uint64_t v102 = result;
    v106 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v101 = *a1 + 8;
  uint64_t v99 = *a1 - 32;
  uint64_t v10 = MEMORY[0x1E4FBC860];
  uint64_t v104 = v3;
  uint64_t v105 = v9;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    char v13 = (uint64_t *)(v9 + 32 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    uint64_t v15 = (void *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_1E451BDE8();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v19 = (void *)(v101 + 32 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      unint64_t v21 = (void *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_1E451BDE8();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 4;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 32 * v18;
        uint64_t v24 = 32 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            unint64_t v27 = (_OWORD *)(v9 + v24);
            uint64_t v28 = v9 + v23;
            uint64_t v29 = *(void *)(v9 + v24);
            uint64_t v30 = *(void *)(v9 + v24 + 8);
            long long v31 = *(_OWORD *)(v9 + v24 + 16);
            long long v32 = *(_OWORD *)(v9 + v23 - 16);
            *unint64_t v27 = *(_OWORD *)(v9 + v23 - 32);
            v27[1] = v32;
            *(void *)(v28 - 32) = v29;
            *(void *)(v28 - 24) = v30;
            *(_OWORD *)(v28 - 16) = v31;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_44:
      uint64_t v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v103) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1E44E0E1C(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v43 = *(void *)(v10 + 16);
    unint64_t v42 = *(void *)(v10 + 24);
    unint64_t v11 = v43 + 1;
    if (v43 >= v42 >> 1)
    {
      uint64_t result = (uint64_t)sub_1E44E0E1C((char *)(v42 > 1), v43 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v44 = v10 + 32;
    uint64_t v45 = (uint64_t *)(v10 + 32 + 16 * v43);
    *uint64_t v45 = v12;
    v45[1] = v8;
    if (v43)
    {
      uint64_t v9 = v105;
      while (1)
      {
        unint64_t v46 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v51 = v44 + 16 * v11;
          uint64_t v52 = *(void *)(v51 - 64);
          uint64_t v53 = *(void *)(v51 - 56);
          BOOL v57 = __OFSUB__(v53, v52);
          uint64_t v54 = v53 - v52;
          if (v57) {
            goto LABEL_134;
          }
          uint64_t v56 = *(void *)(v51 - 48);
          uint64_t v55 = *(void *)(v51 - 40);
          BOOL v57 = __OFSUB__(v55, v56);
          uint64_t v49 = v55 - v56;
          char v50 = v57;
          if (v57) {
            goto LABEL_135;
          }
          unint64_t v58 = v11 - 2;
          v59 = (uint64_t *)(v44 + 16 * (v11 - 2));
          uint64_t v61 = *v59;
          uint64_t v60 = v59[1];
          BOOL v57 = __OFSUB__(v60, v61);
          uint64_t v62 = v60 - v61;
          if (v57) {
            goto LABEL_136;
          }
          BOOL v57 = __OFADD__(v49, v62);
          uint64_t v63 = v49 + v62;
          if (v57) {
            goto LABEL_138;
          }
          if (v63 >= v54)
          {
            v81 = (uint64_t *)(v44 + 16 * v46);
            uint64_t v83 = *v81;
            uint64_t v82 = v81[1];
            BOOL v57 = __OFSUB__(v82, v83);
            uint64_t v84 = v82 - v83;
            if (v57) {
              goto LABEL_144;
            }
            BOOL v74 = v49 < v84;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v75 = *(void *)(v10 + 32);
            uint64_t v76 = *(void *)(v10 + 40);
            BOOL v57 = __OFSUB__(v76, v75);
            uint64_t v68 = v76 - v75;
            char v69 = v57;
            goto LABEL_98;
          }
          uint64_t v48 = *(void *)(v10 + 32);
          uint64_t v47 = *(void *)(v10 + 40);
          BOOL v57 = __OFSUB__(v47, v48);
          uint64_t v49 = v47 - v48;
          char v50 = v57;
        }
        if (v50) {
          goto LABEL_137;
        }
        unint64_t v58 = v11 - 2;
        v64 = (uint64_t *)(v44 + 16 * (v11 - 2));
        uint64_t v66 = *v64;
        uint64_t v65 = v64[1];
        BOOL v67 = __OFSUB__(v65, v66);
        uint64_t v68 = v65 - v66;
        char v69 = v67;
        if (v67) {
          goto LABEL_139;
        }
        v70 = (uint64_t *)(v44 + 16 * v46);
        uint64_t v72 = *v70;
        uint64_t v71 = v70[1];
        BOOL v57 = __OFSUB__(v71, v72);
        uint64_t v73 = v71 - v72;
        if (v57) {
          goto LABEL_141;
        }
        if (__OFADD__(v68, v73)) {
          goto LABEL_143;
        }
        if (v68 + v73 >= v49)
        {
          BOOL v74 = v49 < v73;
LABEL_104:
          if (v74) {
            unint64_t v46 = v58;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v69) {
          goto LABEL_140;
        }
        v77 = (uint64_t *)(v44 + 16 * v46);
        uint64_t v79 = *v77;
        uint64_t v78 = v77[1];
        BOOL v57 = __OFSUB__(v78, v79);
        uint64_t v80 = v78 - v79;
        if (v57) {
          goto LABEL_142;
        }
        if (v80 < v68) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v85 = v46 - 1;
        if (v46 - 1 >= v11)
        {
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
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v86 = v9;
        v87 = (uint64_t *)(v44 + 16 * v85);
        uint64_t v88 = *v87;
        v89 = (void *)(v44 + 16 * v46);
        uint64_t v90 = v89[1];
        uint64_t result = sub_1E44E0BEC((char *)(v86 + 32 * *v87), (char *)(v86 + 32 * *v89), v86 + 32 * v90, v106);
        if (v1) {
          goto LABEL_114;
        }
        if (v90 < v88) {
          goto LABEL_131;
        }
        if (v46 > *(void *)(v10 + 16)) {
          goto LABEL_132;
        }
        uint64_t *v87 = v88;
        *(void *)(v44 + 16 * v85 + _Block_object_dispose(&STACK[0x240], 8) = v90;
        unint64_t v91 = *(void *)(v10 + 16);
        if (v46 >= v91) {
          goto LABEL_133;
        }
        unint64_t v11 = v91 - 1;
        uint64_t result = (uint64_t)memmove((void *)(v44 + 16 * v46), v89 + 2, 16 * (v91 - 1 - v46));
        *(void *)(v10 + 16) = v91 - 1;
        BOOL v74 = v91 > 2;
        uint64_t v9 = v105;
        if (!v74) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
    uint64_t v9 = v105;
LABEL_15:
    uint64_t v3 = v104;
    if (v8 >= v104)
    {
      uint64_t v7 = v102;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v103)) {
    goto LABEL_153;
  }
  if (v12 + v103 >= v3) {
    uint64_t v33 = v3;
  }
  else {
    uint64_t v33 = v12 + v103;
  }
  if (v33 >= v12)
  {
    if (v8 != v33)
    {
      uint64_t v34 = v99 + 32 * v8;
      do
      {
        int64_t v35 = (uint64_t *)(v9 + 32 * v8);
        uint64_t result = *v35;
        uint64_t v36 = v35[1];
        uint64_t v37 = v12;
        uint64_t v38 = v34;
        do
        {
          if (result == *(void *)v38 && v36 == *(void *)(v38 + 8)) {
            break;
          }
          uint64_t result = sub_1E451BDE8();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          uint64_t result = *(void *)(v38 + 32);
          uint64_t v36 = *(void *)(v38 + 40);
          long long v40 = *(_OWORD *)(v38 + 48);
          long long v41 = *(_OWORD *)(v38 + 16);
          *(_OWORD *)(v38 + 32) = *(_OWORD *)v38;
          *(_OWORD *)(v38 + 4_Block_object_dispose(&STACK[0x240], 8) = v41;
          *(void *)uint64_t v38 = result;
          *(void *)(v38 + _Block_object_dispose(&STACK[0x240], 8) = v36;
          *(_OWORD *)(v38 + 16) = v40;
          v38 -= 32;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v34 += 32;
      }
      while (v8 != v33);
      uint64_t v8 = v33;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

void sub_1E44A9E20(uint64_t a1)
{
  sub_1E44A9E28(a1, *(void *)(v1 + 16));
}

void sub_1E44A9E28(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1E451B0C8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

unint64_t sub_1E44A9E8C()
{
  unint64_t result = qword_1EBFF58D0;
  if (!qword_1EBFF58D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBFF58D0);
  }
  return result;
}

uint64_t sub_1E44A9ECC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = sub_1E451B258();
    uint64_t v11 = v10;

    uint64_t v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *uint64_t v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1E44A9FA0(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E44E1550(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_1E44A9770(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1E44AA00C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 32 * a3 - 32;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 32 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    while (1)
    {
      BOOL v13 = result == *(void *)v12 && v10 == *(void *)(v12 + 8);
      if (v13 || (uint64_t result = sub_1E451BDE8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *(void *)(v12 + 32);
      uint64_t v10 = *(void *)(v12 + 40);
      long long v14 = *(_OWORD *)(v12 + 48);
      long long v15 = *(_OWORD *)(v12 + 16);
      *(_OWORD *)(v12 + 32) = *(_OWORD *)v12;
      *(_OWORD *)(v12 + 4_Block_object_dispose(&STACK[0x240], 8) = v15;
      *(void *)uint64_t v12 = result;
      *(void *)(v12 + _Block_object_dispose(&STACK[0x240], 8) = v10;
      *(_OWORD *)(v12 + 16) = v14;
      v12 -= 32;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_1E44AA0E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58E8);
  uint64_t v2 = (void *)sub_1E451BD18();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_1E44957E4(v7, v8);
    unint64_t result = sub_1E4496570(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (uint64_t *)(v2[7] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
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

uint64_t sub_1E44AA208()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1E44AA230(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1E44AA274(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_1E44AA29C()
{
  sub_1E44AA2A8(v0[2], v0[3], v0[4], v0[5]);
}

void sub_1E44AA2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1E451B608();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1E44AA75C();
  uint64_t v12 = *(void *)(a2 + 16);
  if (v12)
  {
    uint64_t v22 = v8;
    swift_bridgeObjectRetain();
    uint64_t v13 = (uint64_t *)(a2 + 40);
    do
    {
      uint64_t v14 = *v13;
      v23[0] = *(v13 - 1);
      v23[1] = v14;
      swift_bridgeObjectRetain();
      sub_1E4496278(v23, a3, a4, a1);
      swift_bridgeObjectRelease();
      v13 += 2;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v8 = v22;
  }
  uint64_t v15 = *(void **)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_queue);
  *uint64_t v11 = v15;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4FBCBF0], v8);
  id v16 = v15;
  char v17 = sub_1E451B618();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if (v17)
  {
    uint64_t v18 = self;
    swift_beginAccess();
    sub_1E449AE1C(0, &qword_1EBFF58C0);
    swift_bridgeObjectRetain();
    uint64_t v19 = (void *)sub_1E451B7F8();
    swift_bridgeObjectRelease();
    uint64_t v20 = (void *)sub_1E451B858();
    objc_msgSend(v18, sel_archivedDataWithRootObject_forKey_, v19, v20);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall TPSFullTipUsageEventManager.updateContextualInfo(for:tipsDeliveryInfoMap:deliveryInfoMap:)(Swift::OpaquePointer a1, Swift::OpaquePointer_optional tipsDeliveryInfoMap, Swift::OpaquePointer_optional deliveryInfoMap)
{
  uint64_t v4 = *(void **)&tipsDeliveryInfoMap.is_nil;
  rawValue = tipsDeliveryInfoMap.value._rawValue;
  uint64_t v7 = *(NSObject **)&v3[OBJC_IVAR___TPSFullTipUsageEventManager_queue];
  uint64_t v8 = (Swift::OpaquePointer *)swift_allocObject();
  v8[2]._rawValue = v3;
  v8[3]._rawValue = a1._rawValue;
  v8[4]._rawValue = rawValue;
  v8[5]._rawValue = v4;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1E44AA29C;
  *(void *)(v9 + 24) = v8;
  v13[4] = sub_1E44AA208;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1E44AA274;
  v13[3] = &block_descriptor_4;
  uint64_t v10 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v11 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
}

uint64_t sub_1E44AA75C()
{
  uint64_t v1 = sub_1E451B608();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (void *)((char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_queue);
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4FBCBF0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_1E451B618();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v4, v1);
  if (v5)
  {
    if ((*(unsigned char *)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_initialized) & 1) == 0)
    {
      *(unsigned char *)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_initialized) = 1;
      sub_1E44ECD5C();
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1E45203E0;
      *(void *)(inited + 32) = sub_1E449AE1C(0, &qword_1EBFF58A0);
      *(void *)(inited + 40) = sub_1E449AE1C(0, &qword_1EBFF58E0);
      *(void *)(inited + 4_Block_object_dispose(&STACK[0x240], 8) = sub_1E449AE1C(0, &qword_1EBFF58C0);
      sub_1E44DCA3C(inited);
      swift_setDeallocating();
      id v9 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
      uint64_t v10 = (void *)sub_1E451B938();
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v9, sel_initWithArray_, v10);

      v18[1] = 0;
      sub_1E451BA58();

      uint64_t v12 = self;
      uint64_t v13 = (void *)sub_1E451BA48();
      swift_bridgeObjectRelease();
      uint64_t v14 = (void *)sub_1E451B858();
      id v15 = objc_msgSend(v12, sel_unarchivedObjectOfClasses_forKey_, v13, v14);

      sub_1E451BB78();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5848);
      if (swift_dynamicCast()) {
        unint64_t v16 = v18[0];
      }
      else {
        unint64_t v16 = sub_1E44E2ABC(MEMORY[0x1E4FBC860]);
      }
      char v17 = (unint64_t *)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
      swift_beginAccess();
      *char v17 = v16;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1E44AAA94(uint64_t a1, unint64_t a2)
{
  return sub_1E44AAAC0(a1, a2, (uint64_t (*)(void))sub_1E44AA0E0, (void (*)(uint64_t, uint64_t))sub_1E449503C);
}

uint64_t sub_1E44AAAC0(uint64_t a1, unint64_t a2, uint64_t (*a3)(void), void (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = sub_1E451B668();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v12 = (int)a1;
      uint64_t v13 = a1 >> 32;
      goto LABEL_6;
    case 2uLL:
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
LABEL_6:
      if (v12 == v13) {
        goto LABEL_7;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_7;
    default:
      if ((a2 & 0xFF000000000000) != 0)
      {
LABEL_3:
        sub_1E451AFD8();
        swift_allocObject();
        sub_1E451AFC8();
        sub_1E44AD698();
        sub_1E451AFB8();
        swift_release();
        return v17[12];
      }
      else
      {
LABEL_7:
        sub_1E451B648();
        sub_1E451B718();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        uint64_t v14 = a3(MEMORY[0x1E4FBC860]);
        uint64_t v15 = 2;
        a4(2, v14);
        swift_bridgeObjectRelease();
      }
      return v15;
  }
}

uint64_t type metadata accessor for UserGuideIndexHelper()
{
  return self;
}

uint64_t sub_1E44AADC8()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  uint64_t v4 = sub_1E451B758();
  uint64_t v6 = v5;
  v0[16] = v4;
  v0[17] = v5;
  sub_1E44AFE28(v3);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  v0[18] = v7;
  v0[19] = (v2 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v7(v3, 1, v1) == 1)
  {
    uint64_t v9 = v0[6];
    uint64_t v8 = v0[7];
    uint64_t v10 = v0[5];
    sub_1E44DD780(v0[11], &qword_1EBFF52B0);
    sub_1E451B648();
    sub_1E451BC08();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    sub_1E451B738();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    sub_1E44ED71C();
    swift_allocError();
    *(void *)uint64_t v11 = v4;
    *(void *)(v11 + _Block_object_dispose(&STACK[0x240], 8) = v6;
    *(unsigned char *)(v11 + 16) = 2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  else
  {
    uint64_t v14 = v0[15];
    uint64_t v15 = v0[12];
    uint64_t v16 = v0[13];
    uint64_t v17 = v0[11];
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
    v0[20] = v18;
    v0[21] = (v16 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    v18(v14, v17, v15);
    uint64_t v19 = (void *)swift_task_alloc();
    v0[22] = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_1E44E6EF0;
    uint64_t v20 = v0[15];
    uint64_t v21 = v0[9];
    return sub_1E44AB880(v21, v20);
  }
}

uint64_t sub_1E44AB040(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_1E451B668();
  void v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = type metadata accessor for UserGuideIndexHelper.UserGuideAttributes(0);
  v3[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  uint64_t v5 = sub_1E451B1D8();
  v3[12] = v5;
  v3[13] = *(void *)(v5 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44AADC8, 0, 0);
}

void sub_1E44AB1E0(uint64_t a1, void **a2, int a3, uint64_t a4)
{
  int64_t v35 = a2;
  uint64_t v31 = a4;
  int v30 = a3;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5890);
  uint64_t v5 = *(void *)(v32 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v32);
  uint64_t v7 = sub_1E451B1D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E451AFA8();
  uint64_t v33 = *(void *)(v11 - 8);
  uint64_t v34 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_1E451AF98();
  sub_1E451B148();
  id v14 = objc_msgSend(self, sel_sharedInstance);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v29 = sub_1E451AF88();
    uint64_t v28 = sub_1E451B858();
    swift_bridgeObjectRelease();
    sub_1E451B868();
    uint64_t v16 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
    int v17 = *MEMORY[0x1E4F28A00];
    uint64_t v18 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v32);
    unint64_t v19 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v20 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v20 + v19, (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    aBlock[4] = sub_1E44ED8D4;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E45042E0;
    aBlock[3] = &block_descriptor_20_0;
    uint64_t v21 = _Block_copy(aBlock);
    swift_release();
    uint64_t v23 = (void *)v28;
    uint64_t v22 = (void *)v29;
    LODWORD(v24) = v17;
    id v25 = objc_msgSend(v15, sel_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler_, v29, v28, 0, v16, v21, v24);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v34);
    uint64_t v26 = *v35;
    *int64_t v35 = v25;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E44AB5C0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  char v2 = *(unsigned char *)(v0 + 72) & 1;
  *(void *)(v0 + 32) = 0;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x240], 8) = v3;
  *(void *)(v3 + 16) = v0 + 32;
  *(void *)(v3 + 24) = v1;
  *(unsigned char *)(v3 + 32) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1E44ECDBC;
  uint64_t v5 = MEMORY[0x1E4F277C0];
  return MEMORY[0x1F4188160](v0 + 16, 0, 0, 0xD000000000000017, 0x80000001E45278F0, sub_1E44ED8BC, v3, v5);
}

uint64_t sub_1E44AB6D8(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 72) = a2;
  *(void *)(v2 + 40) = a1;
  return MEMORY[0x1F4188298](sub_1E44AB5C0, 0, 0);
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse(uint64_t a1)
{
  return sub_1E449B6C8(a1, (uint64_t *)&unk_1EBFF5710);
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideAttributes(uint64_t a1)
{
  return sub_1E449B6C8(a1, qword_1EBFF5490);
}

uint64_t sub_1E44AB73C()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  sub_1E451B648();
  sub_1E451B138();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v1, v2);
  uint64_t v5 = swift_task_alloc();
  v0[14] = v5;
  *(void *)uint64_t v5 = v0;
  *(void *)(v5 + _Block_object_dispose(&STACK[0x240], 8) = sub_1E44E74CC;
  uint64_t v6 = v0[4];
  *(unsigned char *)(v5 + 72) = 0;
  *(void *)(v5 + 40) = v6;
  return MEMORY[0x1F4188298](sub_1E44AB5C0, 0, 0);
}

uint64_t sub_1E44AB880(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  v2[5] = swift_task_alloc();
  v2[6] = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse(0);
  v2[7] = swift_task_alloc();
  uint64_t v3 = sub_1E451B668();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44AB73C, 0, 0);
}

uint64_t sub_1E44AB9B0()
{
  v21[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v18 = sub_1E451B668();
  uint64_t v0 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1E451B0B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1E451B1D8();
  uint64_t v7 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E44ABD80();
  id v10 = objc_msgSend(self, sel_defaultManager);
  uint64_t v11 = (void *)sub_1E451B168();
  v21[0] = 0;
  unsigned int v12 = objc_msgSend(v10, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v11, 1, 0, v21);

  if (v12)
  {
    id v13 = v21[0];
    sub_1E451B0A8();
    sub_1E451B098();
    sub_1E451B158();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    id v14 = v21[0];
    uint64_t v15 = (void *)sub_1E451B0D8();

    swift_willThrow();
    sub_1E451B648();
    v21[0] = 0;
    v21[1] = (id)0xE000000000000000;
    sub_1E451BC08();
    sub_1E451B8C8();
    sub_1E451B1B8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    uint64_t v20 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
    sub_1E451BCB8();
    sub_1E451B738();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v19);
}

uint64_t sub_1E44ABD80()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v1 = (char *)&v15 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1E451B1D8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v15 - v7;
  id v9 = objc_msgSend(self, sel_defaultManager);
  id v10 = objc_msgSend(self, sel_appGroupIdentifier);
  if (!v10)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v9, sel_containerURLForSecurityApplicationGroupIdentifier_, v10);

  if (!v12)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
    goto LABEL_7;
  }
  sub_1E451B1A8();

  id v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v13(v1, v6, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    v13(v8, v1, v2);
    sub_1E451B178();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
LABEL_7:
  sub_1E44DD780((uint64_t)v1, &qword_1EBFF52B0);
  uint64_t result = sub_1E451BCC8();
  __break(1u);
  return result;
}

uint64_t sub_1E44AC080()
{
  uint64_t v1 = *(void *)(v0 + 120);
  unint64_t v2 = *(void *)(v0 + 128);

  *(void *)(v0 + 232) = v1;
  *(void *)(v0 + 240) = v2;
  char v3 = sub_1E44AF444(*(void *)(v0 + 144), v1, v2);
  if (v3 == 2)
  {
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v4 = *(void *)(v0 + 184);
    uint64_t v6 = *(void *)(v0 + 168);
    swift_bridgeObjectRelease();
    sub_1E451B648();
    sub_1E451B718();
    sub_1E4496E64(v1, v2);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    char v9 = v3;
    sub_1E451B648();
    sub_1E451BC08();
    uint64_t result = sub_1E451B8C8();
    uint64_t v10 = 0;
    switch(v2 >> 62)
    {
      case 1uLL:
        LODWORD(v10) = HIDWORD(v1) - v1;
        if (!__OFSUB__(HIDWORD(v1), v1))
        {
          uint64_t v10 = (int)v10;
          goto LABEL_10;
        }
        __break(1u);
        goto LABEL_29;
      case 2uLL:
        uint64_t v12 = *(void *)(v1 + 16);
        uint64_t v11 = *(void *)(v1 + 24);
        BOOL v13 = __OFSUB__(v11, v12);
        uint64_t v10 = v11 - v12;
        if (!v13) {
          goto LABEL_10;
        }
LABEL_29:
        __break(1u);
        return result;
      case 3uLL:
        goto LABEL_10;
      default:
        uint64_t v10 = BYTE6(v2);
LABEL_10:
        uint64_t v14 = *(void *)(v0 + 192);
        uint64_t v15 = *(void *)(v0 + 168);
        uint64_t v16 = *(void *)(v0 + 176);
        uint64_t v17 = *(void *)(v0 + 152);
        *(void *)(v0 + 136) = v10;
        sub_1E451BDC8();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B8C8();
        sub_1E451B728();
        swift_bridgeObjectRelease();
        uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
        v18(v14, v15);
        if (v17 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = v17;
        }
        *(void *)(v0 + 24_Block_object_dispose(&STACK[0x240], 8) = v19;
        if (v9
          && (uint64_t v20 = *(void *)(v0 + 160),
              uint64_t v22 = *(void *)(v20 + 112),
              uint64_t v21 = *(void *)(v20 + 120),
              swift_bridgeObjectRetain(),
              uint64_t v23 = sub_1E44FAF58(v22, v21),
              (*(void *)(v0 + 256) = v24) != 0))
        {
          uint64_t v25 = v23;
          uint64_t v26 = v24;
          if (sub_1E4510DDC(v1, v2, v23))
          {
            unint64_t v45 = *(void *)(v0 + 200);
            uint64_t v43 = *(void *)(v0 + 184);
            uint64_t v44 = *(void *)(v0 + 168);
            uint64_t v27 = sub_1E4511114(*(void *)(v0 + 144), v25, v26);
            uint64_t v29 = v28;
            uint64_t v42 = v30;
            *(void *)(v0 + 264) = v30;
            sub_1E451B648();
            sub_1E451BC08();
            sub_1E451B8C8();
            uint64_t v31 = MEMORY[0x1E4FBB1A0];
            MEMORY[0x1E4E801D0](v27, MEMORY[0x1E4FBB1A0]);
            sub_1E451B8C8();
            swift_bridgeObjectRelease();
            sub_1E451B8C8();
            MEMORY[0x1E4E801D0](v29, v31);
            sub_1E451B8C8();
            swift_bridgeObjectRelease();
            sub_1E451B8C8();
            MEMORY[0x1E4E801D0](v42, v31);
            sub_1E451B8C8();
            swift_bridgeObjectRelease();
            sub_1E451B718();
            swift_bridgeObjectRelease();
            v18(v43, v44);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1E450D430(v29);
            *(void *)(v0 + 272) = sub_1E450DD8C(v45, v27);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (*(void *)(v42 + 16))
            {
              uint64_t v32 = (void *)swift_task_alloc();
              *(void *)(v0 + 280) = v32;
              void *v32 = v0;
              v32[1] = sub_1E450A2AC;
              return sub_1E450B21C(v42, v25, v26);
            }
            else
            {
              swift_bridgeObjectRelease();
              *(void *)(v0 + 296) = v26;
              uint64_t v39 = (void *)swift_task_alloc();
              *(void *)(v0 + 304) = v39;
              *uint64_t v39 = v0;
              v39[1] = sub_1E450A484;
              uint64_t v40 = *(void *)(v0 + 272);
              uint64_t v41 = *(void *)(v0 + 248);
              return sub_1E450B994(v40, v41, v25, v26);
            }
          }
          uint64_t v37 = *(void *)(v0 + 184);
          uint64_t v38 = *(void *)(v0 + 168);
          swift_bridgeObjectRelease();
          sub_1E451B648();
          sub_1E451B718();
          v18(v37, v38);
          int64_t v35 = (void *)swift_task_alloc();
          *(void *)(v0 + 320) = v35;
          *int64_t v35 = v0;
          uint64_t v36 = sub_1E450A644;
        }
        else
        {
          uint64_t v33 = *(void *)(v0 + 184);
          uint64_t v34 = *(void *)(v0 + 168);
          sub_1E451B648();
          sub_1E451B718();
          v18(v33, v34);
          int64_t v35 = (void *)swift_task_alloc();
          *(void *)(v0 + 360) = v35;
          *int64_t v35 = v0;
          uint64_t v36 = sub_1E450AADC;
        }
        v35[1] = v36;
        uint64_t result = sub_1E450963C();
        break;
    }
  }
  return result;
}

uint64_t sub_1E44AC73C()
{
  int v1 = *(unsigned __int8 *)(v0 + 400);
  sub_1E44AB9B0();
  unint64_t v2 = swift_bridgeObjectRetain();
  *(void *)(v0 + 200) = sub_1E450DBFC(v2);
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x240], 8) = 0;
  uint64_t v3 = swift_bridgeObjectRelease();
  if (v1 == 1)
  {
    uint64_t v4 = (void *)sub_1E44AD550(v3);
    *(void *)(v0 + 216) = v4;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_1E44ACEB0;
    uint64_t v5 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 8_Block_object_dispose(&STACK[0x240], 8) = 0x40000000;
    *(void *)(v0 + 96) = sub_1E44A9ECC;
    *(void *)(v0 + 104) = &block_descriptor_3;
    *(void *)(v0 + 112) = v5;
    objc_msgSend(v4, sel_fetchLastClientStateWithCompletionHandler_, v0 + 80);
    return MEMORY[0x1F41881E8](v0 + 16);
  }
  *(_OWORD *)(v0 + 232) = xmmword_1E4520140;
  char v6 = sub_1E44AF444(*(void *)(v0 + 144), 0, 0xC000000000000000);
  if (v6 == 2)
  {
    uint64_t v8 = *(void *)(v0 + 176);
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 168);
    swift_bridgeObjectRelease();
    sub_1E451B648();
    sub_1E451B718();
    sub_1E4496E64(0, 0xC000000000000000);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  char v11 = v6;
  sub_1E451B648();
  sub_1E451BC08();
  sub_1E451B8C8();
  uint64_t v12 = *(void *)(v0 + 192);
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v14 = *(void *)(v0 + 176);
  uint64_t v15 = *(void *)(v0 + 152);
  *(void *)(v0 + 136) = 0;
  sub_1E451BDC8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v16(v12, v13);
  if (v15 <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v15;
  }
  *(void *)(v0 + 24_Block_object_dispose(&STACK[0x240], 8) = v17;
  if (v11
    && (uint64_t v18 = *(void *)(v0 + 160),
        uint64_t v20 = *(void *)(v18 + 112),
        uint64_t v19 = *(void *)(v18 + 120),
        swift_bridgeObjectRetain(),
        uint64_t v21 = sub_1E44FAF58(v20, v19),
        (*(void *)(v0 + 256) = v22) != 0))
  {
    uint64_t v23 = v21;
    uint64_t v24 = v22;
    if (sub_1E4510DDC(0, 0xC000000000000000, v21))
    {
      unint64_t v44 = *(void *)(v0 + 200);
      uint64_t v25 = *(void *)(v0 + 184);
      uint64_t v43 = *(void *)(v0 + 168);
      uint64_t v26 = sub_1E4511114(*(void *)(v0 + 144), v23, v24);
      uint64_t v28 = v27;
      uint64_t v42 = v29;
      *(void *)(v0 + 264) = v29;
      sub_1E451B648();
      sub_1E451BC08();
      sub_1E451B8C8();
      uint64_t v30 = MEMORY[0x1E4FBB1A0];
      MEMORY[0x1E4E801D0](v26, MEMORY[0x1E4FBB1A0]);
      sub_1E451B8C8();
      swift_bridgeObjectRelease();
      sub_1E451B8C8();
      MEMORY[0x1E4E801D0](v28, v30);
      sub_1E451B8C8();
      swift_bridgeObjectRelease();
      sub_1E451B8C8();
      MEMORY[0x1E4E801D0](v42, v30);
      sub_1E451B8C8();
      swift_bridgeObjectRelease();
      sub_1E451B718();
      swift_bridgeObjectRelease();
      v16(v25, v43);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1E450D430(v28);
      *(void *)(v0 + 272) = sub_1E450DD8C(v44, v26);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v42 + 16))
      {
        uint64_t v31 = (void *)swift_task_alloc();
        *(void *)(v0 + 280) = v31;
        *uint64_t v31 = v0;
        v31[1] = sub_1E450A2AC;
        return sub_1E450B21C(v42, v23, v24);
      }
      else
      {
        swift_bridgeObjectRelease();
        *(void *)(v0 + 296) = v24;
        uint64_t v38 = (void *)swift_task_alloc();
        *(void *)(v0 + 304) = v38;
        *uint64_t v38 = v0;
        v38[1] = sub_1E450A484;
        uint64_t v39 = *(void *)(v0 + 272);
        uint64_t v40 = *(void *)(v0 + 248);
        return sub_1E450B994(v39, v40, v23, v24);
      }
    }
    uint64_t v36 = *(void *)(v0 + 184);
    uint64_t v37 = *(void *)(v0 + 168);
    swift_bridgeObjectRelease();
    sub_1E451B648();
    sub_1E451B718();
    v16(v36, v37);
    uint64_t v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v34;
    *uint64_t v34 = v0;
    int64_t v35 = sub_1E450A644;
  }
  else
  {
    uint64_t v32 = *(void *)(v0 + 184);
    uint64_t v33 = *(void *)(v0 + 168);
    sub_1E451B648();
    sub_1E451B718();
    v16(v32, v33);
    uint64_t v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 360) = v34;
    *uint64_t v34 = v0;
    int64_t v35 = sub_1E450AADC;
  }
  v34[1] = v35;
  return sub_1E450963C();
}

uint64_t sub_1E44ACEB0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 224) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 160);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E450AF68;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 160);
    uint64_t v4 = sub_1E44AC080;
  }
  return MEMORY[0x1F4188298](v4, v5, 0);
}

uint64_t sub_1E44ACFD8(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 152) = a3;
  *(void *)(v4 + 160) = v3;
  *(unsigned char *)(v4 + 400) = a2;
  *(void *)(v4 + 144) = a1;
  uint64_t v5 = sub_1E451B668();
  *(void *)(v4 + 16_Block_object_dispose(&STACK[0x240], 8) = v5;
  *(void *)(v4 + 176) = *(void *)(v5 - 8);
  *(void *)(v4 + 184) = swift_task_alloc();
  *(void *)(v4 + 192) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44AC73C, v3, 0);
}

uint64_t sub_1E44AD0B0()
{
  uint64_t v2 = v0[37];
  uint64_t v1 = v0[38];
  uint64_t v3 = v0[36];
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  sub_1E451B758();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B718();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[39] = v4;
  v0[40] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v1, v3);
  type metadata accessor for UserGuideIndexHelper();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[41] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1E44FC73C;
  uint64_t v6 = v0[35];
  uint64_t v7 = v0[32];
  return sub_1E44AB040(v6, v7);
}

uint64_t sub_1E44AD208()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  unint64_t v4 = v0[11];
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_1E44FC460(v4);
  MEMORY[0x1E4E801D0](v5, MEMORY[0x1E4FBB1A0]);
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[17] = v6;
  v0[18] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v3);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1E451BCD8();
    v0[19] = v14;
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v0[19] = v7;
    if (v7)
    {
LABEL_3:
      uint64_t v8 = v0[11];
      v0[20] = MEMORY[0x1E4FBC860];
      if ((v8 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x1E4E804B0](0);
      }
      else {
        id v9 = *(id *)(v8 + 32);
      }
      uint64_t v10 = (uint64_t)v9;
      v0[21] = v9;
      v0[22] = 1;
      char v11 = (void *)swift_task_alloc();
      v0[23] = v11;
      *char v11 = v0;
      v11[1] = sub_1E44FBAE8;
      uint64_t v12 = v0[12];
      return sub_1E449B5D4(v10, 1, v12);
    }
  }
  v0[25] = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
  uint64_t v15 = (void *)swift_task_alloc();
  v0[26] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_1E44FBD88;
  uint64_t v16 = v0[11];
  return sub_1E44FE1A4(v16);
}

uint64_t sub_1E44AD48C(uint64_t a1, uint64_t a2)
{
  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  uint64_t v4 = sub_1E451B668();
  v3[14] = v4;
  v3[15] = *(void *)(v4 - 8);
  v3[16] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44AD208, v2, 0);
}

id sub_1E44AD554()
{
  uint64_t v1 = *(void **)(v0 + 136);
  if (v1)
  {
    id v2 = *(id *)(v0 + 136);
LABEL_5:
    id v11 = v1;
    return v2;
  }
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  id result = objc_msgSend(v3, sel_spotlightBundleIdentifier);
  if (result)
  {
    uint64_t v5 = result;
    sub_1E451B868();

    id v6 = objc_allocWithZone(MEMORY[0x1E4F23838]);
    uint64_t v7 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v6, sel_initWithName_protectionClass_bundleIdentifier_, v7, 0, v8);

    uint64_t v10 = *(void **)(v0 + 136);
    *(void *)(v0 + 136) = v9;
    id v2 = v9;

    uint64_t v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1E44AD668@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1E44AD6EC(a1);
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(void *)(a2 + _Block_object_dispose(&STACK[0x240], 8) = v5;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

unint64_t sub_1E44AD698()
{
  unint64_t result = qword_1EBFF53A8[0];
  if (!qword_1EBFF53A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBFF53A8);
  }
  return result;
}

uint64_t sub_1E44AD6EC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5918);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1E44AD9A4();
  sub_1E451BF08();
  if (!v1)
  {
    v9[16] = 0;
    uint64_t v7 = sub_1E451BD58();
    v9[15] = 1;
    sub_1E44AF844();
    sub_1E451BD48();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unsigned char *storeEnumTagSinglePayload for ClientStateMetaData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        break;
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1E44AD978()
{
  if (*v0) {
    return 0x6873616863;
  }
  else {
    return 118;
  }
}

unint64_t sub_1E44AD9A4()
{
  unint64_t result = qword_1EBFF5390;
  if (!qword_1EBFF5390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5390);
  }
  return result;
}

uint64_t type metadata accessor for UserGuideIndexItem(uint64_t a1)
{
  return sub_1E449B6C8(a1, qword_1EBFF52E8);
}

uint64_t sub_1E44ADA18()
{
  uint64_t v1 = self;
  v0[8] = v1;
  id v2 = objc_msgSend(v1, sel_standardUserDefaults);
  int v3 = (void *)sub_1E451B858();
  id v4 = objc_msgSend(v2, sel_integerForKey_, v3);

  if (v4 == (id)1)
  {
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    uint64_t v8 = v0[6];
    uint64_t v7 = v0[7];
    uint64_t v9 = v0[5];
    sub_1E451B648();
    sub_1E451BC08();
    sub_1E451B8C8();
    v0[2] = v4;
    sub_1E451BDC8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    v0[3] = 1;
    sub_1E451BDC8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    sub_1E451B718();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v0[9] = sub_1E45057FC();
    id v11 = (uint64_t (__cdecl *)())((char *)&dword_1EAE48748 + dword_1EAE48748);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[10] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_1E450832C;
    return v11();
  }
}

uint64_t sub_1E44ADCC4()
{
  v1[4] = v0;
  uint64_t v2 = sub_1E451B668();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44ADA18, 0, 0);
}

uint64_t sub_1E44ADD84()
{
  (*(void (**)(void))(v0 + 104))(0);

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44ADDFC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E4508C4C;
  }
  else {
    uint64_t v2 = sub_1E44ADD84;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44ADF10()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16_Block_object_dispose(&STACK[0x240], 8) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1E4508A9C, 0, 0);
  }
  else
  {

    uint64_t v5 = (uint64_t (*)(void))(*(void *)(v2 + 88) + **(int **)(v2 + 88));
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v2 + 176) = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_1E44ADDFC;
    return v5();
  }
}

uint64_t sub_1E44AE0C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_1E44AE1C0()
{
  sub_1E44AE1CC(*(void (**)(id))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_1E44AE1CC(void (*a1)(id), uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v4 = a3 + 16;
    swift_beginAccess();
    uint64_t v5 = (void *)MEMORY[0x1E4E812E0](v4);
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = objc_msgSend(v5, sel_error);
    }
    else
    {
      id v7 = 0;
    }
    a1(v7);
  }
}

uint64_t sub_1E44AE268()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E44DAA10;
  return sub_1E44AE300(v2, v3);
}

uint64_t sub_1E44AE300(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E451B668();
  v2[2] = v4;
  v2[3] = *(void *)(v4 - 8);
  v2[4] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[5] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4505E40;
  return sub_1E44AD48C(a2, 50);
}

void SearchItemIndexer.indexUserGuides(_:qualityOfService:completionHandler:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    uint64_t v9 = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EBFF5430);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    *(void *)(v10 + 24) = a1;
    id v11 = (void *)swift_allocObject();
    v11[2] = a2;
    v11[3] = v4;
    v11[4] = 0xD000000000000020;
    v11[5] = 0x80000001E45280F0;
    void v11[6] = &unk_1EAE486F8;
    v11[7] = v10;
    id v12 = objc_allocWithZone((Class)sub_1E451B6F8());
    swift_bridgeObjectRetain();
    swift_retain();
    id v13 = v4;
    swift_retain();
    id v17 = (id)sub_1E451B6E8();
    uint64_t v14 = (void *)sub_1E451B858();
    objc_msgSend(v17, sel_setName_, v14);

    objc_msgSend(v17, sel_setQualityOfService_, a2);
    sub_1E449B404(v17, a3, a4);
    swift_release();
    swift_release();

    return;
  }
  uint64_t v16 = sub_1E4508DF4((uint64_t)&unk_1F4016780);
  SearchItemIndexer.deleteAllItems(ofTypes:qualityOfService:completionHandler:)(v16, a2, a3, a4);

  swift_bridgeObjectRelease();
}

uint64_t sub_1E44AE72C()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  sub_1E451B648();
  sub_1E451B728();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1E44AE7E0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E44AE72C, 0, 0);
  }
}

uint64_t sub_1E44AE92C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E44AE0C8;
  return sub_1E44AE9C4(v2, v3);
}

uint64_t sub_1E44AE9C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E451B668();
  v2[2] = v4;
  v2[3] = *(void *)(v4 - 8);
  v2[4] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[5] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E44AE7E0;
  return sub_1E44ACFD8(a2, 1, 20);
}

void SearchItemIndexer.indexTips(_:qualityOfService:completionHandler:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    uint64_t v9 = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EBFF5438);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    *(void *)(v10 + 24) = a1;
    id v11 = (void *)swift_allocObject();
    v11[2] = a2;
    v11[3] = v4;
    v11[4] = 0xD00000000000001ELL;
    v11[5] = 0x80000001E45280A0;
    void v11[6] = &unk_1EAE486D8;
    v11[7] = v10;
    id v12 = objc_allocWithZone((Class)sub_1E451B6F8());
    swift_bridgeObjectRetain();
    swift_retain();
    id v13 = v4;
    swift_retain();
    id v17 = (id)sub_1E451B6E8();
    uint64_t v14 = (void *)sub_1E451B858();
    objc_msgSend(v17, sel_setName_, v14);

    objc_msgSend(v17, sel_setQualityOfService_, a2);
    sub_1E449B404(v17, a3, a4);
    swift_release();
    swift_release();

    return;
  }
  uint64_t v16 = sub_1E4508DF4((uint64_t)&unk_1F4016728);
  SearchItemIndexer.deleteAllItems(ofTypes:qualityOfService:completionHandler:)(v16, a2, a3, a4);

  swift_bridgeObjectRelease();
}

uint64_t sub_1E44AEDE8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void *)(v4 + *a1);
  if (v6)
  {
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v9 = v4;
    uint64_t v11 = *(void *)(v4 + OBJC_IVAR___TPSSearchItemIndexer_name);
    uint64_t v12 = *(void *)(v4 + OBJC_IVAR___TPSSearchItemIndexer_name + 8);
    swift_bridgeObjectRetain();
    sub_1E451B8C8();
    swift_bridgeObjectRetain();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(a4);
    uint64_t v7 = swift_allocObject();
    swift_defaultActor_initialize();
    *(void *)(v7 + 136) = 0;
    *(void *)(v7 + 112) = v11;
    *(void *)(v7 + 120) = v12;
    *(unsigned char *)(v7 + 12_Block_object_dispose(&STACK[0x240], 8) = 0;
    *(void *)(v9 + v5) = v7;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v7;
}

uint64_t sub_1E44AEF40()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_deviceGuideIdentifier);
  sub_1E451B868();

  id v2 = objc_msgSend(v0, sel_productVersion);
  sub_1E451B868();

  id v3 = objc_msgSend(v0, sel_deviceName);
  sub_1E451B868();

  id v4 = objc_msgSend(v0, sel_deviceSymbol);
  sub_1E451B868();

  id v5 = objc_allocWithZone((Class)sub_1E451B798());
  return sub_1E451B748();
}

unint64_t sub_1E44AF090()
{
  unint64_t v22 = MEMORY[0x1E4FBC860];
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_idsDevices);
  sub_1E44DAE80();
  uint64_t v2 = sub_1E451B948();

  id v3 = (objc_class *)type metadata accessor for UserGuideManager.CloudDeviceDataSource();
  id v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtCC10TipsDaemon16UserGuideManagerP33_6C8AE7B9624AFE54883FB7DC9DB35E3D21CloudDeviceDataSource_devices] = v2;
  v21.receiver = v4;
  v21.super_class = v3;
  id v5 = objc_msgSendSuper2(&v21, sel_init);
  id v6 = objc_msgSend(v0, sel_visionProDeviceInfoUsingDataSource_, v5);
  if (v6)
  {
    uint64_t v7 = v6;
    sub_1E44DABD8(v6);
    MEMORY[0x1E4E801A0]();
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1E451B978();
    }
    sub_1E451B998();
    sub_1E451B968();
  }
  uint64_t v8 = self;
  id v9 = objc_msgSend(v8, sel_watchDeviceInfo);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_1E44DABD8(v9);
    MEMORY[0x1E4E801A0]();
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1E451B978();
    }
    sub_1E451B998();
    sub_1E451B968();
  }
  id v11 = objc_msgSend(v8, sel_homePodDeviceInfo);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_1E44DABD8(v11);
    MEMORY[0x1E4E801A0]();
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1E451B978();
    }
    sub_1E451B998();
    sub_1E451B968();
  }
  id v13 = objc_msgSend(v0, sel_tvDeviceInfoUsingDataSource_, v5);
  if (v13)
  {
    uint64_t v14 = v13;
    sub_1E44DABD8(v13);
    MEMORY[0x1E4E801A0]();
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1E451B978();
    }
    sub_1E451B998();
    sub_1E451B968();
  }
  id v15 = objc_msgSend(v8, sel_airPodsDeviceInfo);
  if (v15)
  {
    uint64_t v16 = v15;
    sub_1E44DABD8(v15);
    MEMORY[0x1E4E801A0]();
    if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1E451B978();
    }
    sub_1E451B998();
    sub_1E451B968();
  }
  unint64_t v17 = v22;
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_1E451BCD8();
    swift_bridgeObjectRelease();

    if (v20) {
      return v17;
    }
    goto LABEL_23;
  }
  uint64_t v18 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);

  if (!v18)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return 0;
  }
  return v17;
}

uint64_t sub_1E44AF444(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1E451B668();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      if ((int)a2 != a2 >> 32) {
        goto LABEL_7;
      }
      return 0;
    case 2uLL:
      if (*(void *)(a2 + 16) != *(void *)(a2 + 24)) {
        goto LABEL_7;
      }
      return 0;
    case 3uLL:
      return result;
    default:
      if ((a3 & 0xFF000000000000) == 0) {
        return 0;
      }
LABEL_7:
      __int16 v11 = sub_1E44AAA94(a2, a3);
      uint64_t v13 = v12;
      unint64_t v15 = v14;
      if (v11 == 2)
      {
        swift_bridgeObjectRetain();
        sub_1E44AA0E0(MEMORY[0x1E4FBC860]);
        swift_bridgeObjectRelease();
        sub_1E449BD7C(a1);
        swift_bridgeObjectRelease();
        sub_1E44957E4(v13, v15);
        uint64_t v16 = sub_1E449503C(2);
        unint64_t v18 = v17;
        swift_bridgeObjectRelease();
        char v19 = sub_1E44AF898(v13, v15, v16, v18);
        sub_1E4496E64(v16, v18);
        sub_1E4496E64(v13, v15);
        if (v19)
        {
          sub_1E4496E64(v13, v15);
          return 2;
        }
        else
        {
          sub_1E451B648();
          sub_1E451B718();
          sub_1E4496E64(v13, v15);
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          return 1;
        }
      }
      else
      {
        __int16 v20 = v11;
        sub_1E451B648();
        uint64_t v23 = 0;
        unint64_t v24 = 0xE000000000000000;
        sub_1E451BC08();
        sub_1E451B8C8();
        __int16 v22 = v20;
        sub_1E451BDC8();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B8C8();
        __int16 v22 = 2;
        sub_1E451BDC8();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B8C8();
        sub_1E451B718();
        swift_bridgeObjectRelease();
        sub_1E4496E64(v13, v15);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        return 0;
      }
  }
}

uint64_t sub_1E44AF788(uint64_t a1, uint64_t a2)
{
  v8[3] = MEMORY[0x1E4FBB2B8];
  v8[4] = MEMORY[0x1E4F27EF0];
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E4FBB2B8]);
  id v3 = (unsigned char *)*v2;
  if (*v2 && (id v4 = (unsigned char *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_1E44AFD64(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_1E44E1C00((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      uint64_t v6 = sub_1E44958FC((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

unint64_t sub_1E44AF844()
{
  unint64_t result = qword_1EBFF52C0;
  if (!qword_1EBFF52C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF52C0);
  }
  return result;
}

uint64_t sub_1E44AF898(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v_Block_object_dispose(&STACK[0x240], 8) = HIDWORD(result) - result;
      if (!__OFSUB__(HIDWORD(result), result))
      {
        uint64_t v8 = (int)v8;
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_26;
    case 2uLL:
      uint64_t v10 = *(void *)(result + 16);
      uint64_t v9 = *(void *)(result + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      break;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
          goto LABEL_11;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (v11) {
            goto LABEL_28;
          }
          goto LABEL_11;
        case 3uLL:
          char v17 = v8 == 0;
          goto LABEL_24;
        default:
          uint64_t v12 = BYTE6(a4);
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (result >> 32 < (int)result) {
                    goto LABEL_29;
                  }
                  sub_1E44957E4(a3, a4);
                  sub_1E44957E4(v7, a2);
                  char v17 = sub_1E44AFF74((int)v7, v7 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_1E4496E64(a3, a4);
                  uint64_t v18 = v7;
                  unint64_t v19 = a2;
                  goto LABEL_23;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(result + 16);
                  uint64_t v22 = *(void *)(result + 24);
                  sub_1E44957E4(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_1E44AFF74(v21, v22, v20, a3, a4);
                  sub_1E4496E64(a3, a4);
                  swift_release();
                  swift_release();
                  break;
                case 3uLL:
                  sub_1E44957E4(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1E44957E4(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = v7;
LABEL_22:
                  char v17 = sub_1E44E1AF8(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
LABEL_23:
                  sub_1E4496E64(v18, v19);
                  break;
              }
            }
          }
          else
          {
            char v17 = 0;
          }
LABEL_24:
          unint64_t result = v17 & 1;
          break;
      }
      break;
  }
  return result;
}

uint64_t sub_1E44AFB00@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1E44957E4(a2, a3);
      uint64_t v10 = (char *)sub_1E451B038();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1E451B068();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      __s1 = sub_1E451B058();
      if (__s1 >= v9) {
        size_t v12 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v12 = __s1;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      if (!v10)
      {
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return __s1;
      }
      int v13 = memcmp(v7, v10, v12);
      __s1 = sub_1E4496E64(a2, a3);
      BOOL v8 = v13 == 0;
LABEL_24:
      char v22 = v8;
LABEL_29:
      *a4 = v22;
      return __s1;
    case 2uLL:
      uint64_t v14 = *(void *)(a2 + 16);
      uint64_t v15 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v16 = (char *)sub_1E451B038();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_1E451B068();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_32;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_31;
      }
      __s1 = sub_1E451B058();
      if (__s1 >= v19) {
        size_t v20 = v19;
      }
      else {
        size_t v20 = __s1;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v16) {
        goto LABEL_38;
      }
      int v21 = memcmp(v7, v16, v20);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v21 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v22 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v24 = a3;
      char v25 = BYTE2(a3);
      char v26 = BYTE3(a3);
      char v27 = BYTE4(a3);
      char v28 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_1E44AFD64(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
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

uint64_t sub_1E44AFE28@<X0>(uint64_t a1@<X8>)
{
  sub_1E451B758();
  unint64_t v2 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  sub_1E451B788();
  if (v3)
  {
    id v4 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  char v5 = self;
  id v6 = objc_msgSend(v5, sel_userGuideURLForIdentifier_version_platformIndependent_subPath_, v2, v4, sub_1E451B778() & 1, 0);

  if (v6)
  {
    sub_1E451B1A8();

    uint64_t v7 = sub_1E451B1D8();
    BOOL v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_1E451B1D8();
    BOOL v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }

  return v8(v10, v11, 1, v9);
}

uint64_t sub_1E44AFF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1E451B038();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1E451B068();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1E451B058();
  sub_1E44AFB00(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

void sub_1E44B029C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreTelephonyLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6AE40;
    uint64_t v6 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!CoreTelephonyLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CoreTelephonyClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getCoreTelephonyClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCoreTelephonyClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreTelephonyLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreTelephonyLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCTCellularPlanManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CellularPlanManagerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CellularPlanManagerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6AE98;
    uint64_t v6 = 0;
    CellularPlanManagerLibraryCore_frameworkLibrary = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!CellularPlanManagerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CTCellularPlanManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    unint64_t v2 = (void *)__getCTCellularPlanManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCTCellularPlanManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CellularPlanManagerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CellularPlanManagerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44B0AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6AEB0;
    uint64_t v6 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!PassKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKPassLibrary");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getPKPassLibraryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPKPassLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44B0EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1E44B1930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCoreTelephonyClientClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreTelephonyLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6B028;
    uint64_t v6 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!CoreTelephonyLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CoreTelephonyClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getCoreTelephonyClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCoreTelephonyClientClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreTelephonyLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreTelephonyLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E44B1FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AssistantServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6B040;
    uint64_t v6 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AFPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    unint64_t v2 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getVTPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VoiceTriggerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VoiceTriggerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6B058;
    uint64_t v6 = 0;
    VoiceTriggerLibraryCore_frameworkLibrary = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!VoiceTriggerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VTPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getVTPreferencesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVTPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44B2B9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1E44B2CA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E44B3094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1E44B3258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44B3C00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E44B54FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  objc_destroyWeak(v38);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v39 - 184), 8);
  _Block_object_dispose((const void *)(v39 - 136), 8);
  objc_destroyWeak((id *)(v39 - 88));
  _Unwind_Resume(a1);
}

void sub_1E44B620C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void *__getAFAssistantRestrictedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    uint64_t v5[2] = 3221225472;
    v5[3] = __AssistantServicesLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6E6BA88;
    uint64_t v7 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_0;
    if (AssistantServicesLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_0;
LABEL_5:
  uint64_t result = dlsym(v2, "AFAssistantRestricted");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFAssistantRestrictedSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getHKMedicalIDStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6BAA0;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKMedicalIDStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHKMedicalIDStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKMedicalIDStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAFAssistantRestrictedSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary();
  uint64_t result = dlsym(v2, "AFAssistantRestricted");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFAssistantRestrictedSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E6BD98;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary_1;
  id v1 = (void *)v3[0];
  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getAFPreferencesClass_block_invoke_0(uint64_t a1)
{
  AssistantServicesLibrary();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    return (Class)+[TPSCloudDeviceValidation idsService];
  }
  return result;
}

void sub_1E44B8C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44B93E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44B9628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44BA64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCoreTelephonyClientClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreTelephonyLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6BE78;
    uint64_t v6 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CoreTelephonyLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CoreTelephonyClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getCoreTelephonyClientClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCoreTelephonyClientClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreTelephonyLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CoreTelephonyLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1E44BA984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMClientConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HomeKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6BEB0;
    uint64_t v6 = 0;
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HomeKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HMClientConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHMClientConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HomeKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44BACC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPKPeerPaymentIsSetupSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    uint64_t v5[2] = 3221225472;
    v5[3] = __PassKitCoreLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6E6BF40;
    uint64_t v7 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_0;
    if (PassKitCoreLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_0;
LABEL_5:
  uint64_t result = dlsym(v2, "PKPeerPaymentIsSetup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKPeerPaymentIsSetupSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E44BD428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKAccountServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitCoreLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6BFA8;
    uint64_t v6 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PassKitCoreLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKAccountService");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getPKAccountServiceClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPKAccountServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1E44BD920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44BDCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44BE12C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getSPBeaconManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SPOwnerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SPOwnerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C068;
    uint64_t v6 = 0;
    SPOwnerLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SPOwnerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SPBeaconManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getSPBeaconManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSPBeaconManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SPOwnerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SPOwnerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHMClientConnectionClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HomeKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C080;
    uint64_t v6 = 0;
    HomeKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HomeKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HMClientConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHMClientConnectionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HomeKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getPKPeerPaymentIsAvailableSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_2)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    uint64_t v5[2] = 3221225472;
    v5[3] = __PassKitCoreLibraryCore_block_invoke_2;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6E6C098;
    uint64_t v7 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_2;
    if (PassKitCoreLibraryCore_frameworkLibrary_2)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_2;
LABEL_5:
  uint64_t result = dlsym(v2, "PKPeerPaymentIsAvailable");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKPeerPaymentIsAvailableSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1E44BEEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVTPreferencesClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VoiceTriggerLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VoiceTriggerLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C100;
    uint64_t v6 = 0;
    VoiceTriggerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!VoiceTriggerLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VTPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getVTPreferencesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVTPreferencesClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E44BF290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVTPreferencesClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VoiceTriggerLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VoiceTriggerLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C118;
    uint64_t v6 = 0;
    VoiceTriggerLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!VoiceTriggerLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VTPreferences");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getVTPreferencesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVTPreferencesClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getHMClientConnectionClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HomeKitLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C268;
    uint64_t v6 = 0;
    HomeKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HomeKitLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HMClientConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHMClientConnectionClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HomeKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1E44C03AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ScreenTimeCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C2A8;
    uint64_t v6 = 0;
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("STManagementState");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSTManagementStateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ScreenTimeCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ScreenTimeCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44C0BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHeartRhythmAvailabilityClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C2C0;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKHeartRhythmAvailability");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHKHeartRhythmAvailabilityClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKHeartRhythmAvailabilityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E44C0E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    return (Class)HealthKitLibrary();
  }
  return result;
}

uint64_t HealthKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __HealthKitLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E6C2D8;
    uint64_t v5 = 0;
    HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = HealthKitLibraryCore_frameworkLibrary_1;
  uint64_t v1 = (void *)v3[0];
  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HealthKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  uint64_t result = dlsym(v2, "HKFeatureIdentifierIrregularRhythmNotifications");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getHKFeatureIdentifierSleepTrackingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  uint64_t result = dlsym(v2, "HKFeatureIdentifierSleepTracking");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHKFeatureIdentifierAFibBurdenSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  uint64_t result = dlsym(v2, "HKFeatureIdentifierAFibBurden");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  uint64_t result = dlsym(v2, "HKFeatureIdentifierMenstrualCyclesWristTemperatureInput");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

void *__getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  uint64_t result = dlsym(v2, "HKFeatureIdentifierSleepingWristTemperatureMeasurements");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

void *__getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  uint64_t result = dlsym(v2, "HKFeatureAvailabilityContextTipsAppVisibility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void *__getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary();
  uint64_t result = dlsym(v2, "HKFeatureAvailabilityContextTipsAppNotificationEligibility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

void sub_1E44C1B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPassLibraryClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __PassKitCoreLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C2F0;
    uint64_t v6 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!PassKitCoreLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKPassLibrary");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getPKPassLibraryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPKPassLibraryClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void sub_1E44C2D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKFeatureStatusManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C308;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKFeatureStatusManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getHKFeatureStatusManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKFeatureStatusManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1E44C312C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthChecklistUtilitiesClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C320;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKHealthChecklistUtilities");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getHKHealthChecklistUtilitiesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKHealthChecklistUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void sub_1E44C3588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSTManagementStateClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ScreenTimeCoreLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C338;
    uint64_t v6 = 0;
    ScreenTimeCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("STManagementState");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSTManagementStateClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ScreenTimeCoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ScreenTimeCoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E44C4224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void *__getAFAssistantRestrictedSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary_0();
  uint64_t result = dlsym(v2, "AFAssistantRestricted");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFAssistantRestrictedSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary_0()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E6C3F0;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary_2;
  uint64_t v1 = (void *)v3[0];
  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getAFPreferencesClass_block_invoke_1(uint64_t a1)
{
  AssistantServicesLibrary_0();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    return (Class)+[TPSWelcomeDocument supportsSecureCoding];
  }
  return result;
}

void sub_1E44C6428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose((const void *)(v59 - 224), 8);
  _Block_object_dispose((const void *)(v59 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1E44C7B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44C8E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Unwind_Resume(a1);
}

Class __getFMDFMIPManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!FindMyDeviceLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __FindMyDeviceLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C638;
    uint64_t v6 = 0;
    FindMyDeviceLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!FindMyDeviceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("FMDFMIPManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getFMDFMIPManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FindMyDeviceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FindMyDeviceLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44CA950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKSPSleepStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SleepLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SleepLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C650;
    uint64_t v6 = 0;
    SleepLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!SleepLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKSPSleepStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHKSPSleepStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKSPSleepStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SleepLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SleepLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44CB260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44CB6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44CBB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASDSubscriptionEntitlementsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppStoreDaemonLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C6E0;
    uint64_t v6 = 0;
    AppStoreDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppStoreDaemonLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ASDSubscriptionEntitlements");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getASDSubscriptionEntitlementsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getASDSubscriptionEntitlementsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppStoreDaemonLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppStoreDaemonLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44CC18C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthRecordsAccountInfoStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_4)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_4;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C720;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKHealthRecordsAccountInfoStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHKHealthRecordsAccountInfoStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKHealthRecordsAccountInfoStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void *__getAFAssistantRestrictedSymbolLoc_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)AssistantServicesLibrary_1();
  uint64_t result = dlsym(v2, "AFAssistantRestricted");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAFAssistantRestrictedSymbolLoc_ptr_2 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary_3)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke_3;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E6C738;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = AssistantServicesLibraryCore_frameworkLibrary_3;
  uint64_t v1 = (void *)v3[0];
  if (!AssistantServicesLibraryCore_frameworkLibrary_3)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AssistantServicesLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary_3 = result;
  return result;
}

TPSPairedDevicesCondition *__getAFPreferencesClass_block_invoke_2(uint64_t a1)
{
  AssistantServicesLibrary_1();
  uint64_t result = (TPSPairedDevicesCondition *)objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (TPSPairedDevicesCondition *)__getAFPreferencesClass_block_invoke_cold_1();
    return [(TPSPairedDevicesCondition *)v3 init];
  }
  return result;
}

void sub_1E44CCE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44CD1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44CD494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMClientConnectionClass_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HomeKitLibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C778;
    uint64_t v6 = 0;
    HomeKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HomeKitLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HMClientConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHMClientConnectionClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HomeKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1E44CDCFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getASDIAPHistoryClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AppStoreDaemonLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AppStoreDaemonLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C808;
    uint64_t v6 = 0;
    AppStoreDaemonLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppStoreDaemonLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ASDIAPHistory");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getASDIAPHistoryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getASDIAPHistoryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppStoreDaemonLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AppStoreDaemonLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1E44CE4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44CE6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1E44CE9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44CECE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44CEE48(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1E44CF390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1E44CFD60(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1E44D0060(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1E44D0510(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1E44D067C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1E44D0A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRUsageInformationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CarPlayLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CarPlayLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6C960;
    uint64_t v6 = 0;
    CarPlayLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CarPlayLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CRUsageInformation");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCRUsageInformationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCRUsageInformationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CarPlayLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CarPlayLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E44D14B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44D2620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getPKPeerPaymentHasCashFamilyAccountsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary_4)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    uint64_t v5[2] = 3221225472;
    v5[3] = __PassKitCoreLibraryCore_block_invoke_4;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6E6CA30;
    uint64_t v7 = 0;
    PassKitCoreLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_4;
    if (PassKitCoreLibraryCore_frameworkLibrary_4)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_4;
LABEL_5:
  uint64_t result = dlsym(v2, "PKPeerPaymentHasCashFamilyAccounts");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKPeerPaymentHasCashFamilyAccountsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitCoreLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary_4 = result;
  return result;
}

id TPSHMManagerSpeakersConfiguredChangedNotificationString()
{
  uint64_t v0 = NSString;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v1 = (void *)getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr;
  uint64_t v9 = getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr;
  if (!getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v2 = (void *)HomeKitLibrary();
    v7[3] = (uint64_t)dlsym(v2, "HMHomeManagerSpeakersConfiguredChangedNotification");
    getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr = v7[3];
    uint64_t v1 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v1)
  {
    long long v5 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  uint64_t v3 = [v0 stringWithUTF8String:*v1];

  return v3;
}

void *__getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HomeKitLibrary();
  uint64_t result = dlsym(v2, "HMHomeManagerSpeakersConfiguredChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t HomeKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary_3)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __HomeKitLibraryCore_block_invoke_3;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6E6CA48;
    uint64_t v5 = 0;
    HomeKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = HomeKitLibraryCore_frameworkLibrary_3;
  uint64_t v1 = (void *)v3[0];
  if (!HomeKitLibraryCore_frameworkLibrary_3)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HomeKitLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void __getHMClientConnectionClass_block_invoke_3(uint64_t a1)
{
  HomeKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("HMClientConnection");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHMClientConnectionClass_softClass_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
    +[TPSDataMigrator performMigrationIfNeeded];
  }
}

void sub_1E44D3BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44D3D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMClientConnectionClass_block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HomeKitLibraryCore_frameworkLibrary_4)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HomeKitLibraryCore_block_invoke_4;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6CB00;
    uint64_t v6 = 0;
    HomeKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HomeKitLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HMClientConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHMClientConnectionClass_softClass_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HomeKitLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  HomeKitLibraryCore_frameworkLibrary_4 = result;
  return result;
}

Class __getHKHealthChecklistUtilitiesClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary_5)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke_5;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E6CB18;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary_5 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary_5)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKHealthChecklistUtilities");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getHKHealthChecklistUtilitiesClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKHealthChecklistUtilitiesClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_5 = result;
  return result;
}

void sub_1E44D4AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44D4C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44D4DAC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1E44D4EF4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1E44D5014(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1E44D5198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44D5324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E44D6690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E44D675C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1E44D8544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void type metadata accessor for LNTranscriptActionSource(uint64_t a1)
{
}

void type metadata accessor for TPSContextualEventType(uint64_t a1)
{
}

void type metadata accessor for QualityOfService(uint64_t a1)
{
}

void sub_1E44DA0B4(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_1E44DA0C0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x240], 8) = 0;
  return result;
}

BOOL sub_1E44DA0D0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void type metadata accessor for TPSAssetsConfigurationUserInterfaceStyle(uint64_t a1)
{
}

void sub_1E44DA0F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t Task<>.init(qualityOfService:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E44DA274(a1);
  uint64_t v11 = sub_1E451BA28();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a4;
  v12[5] = a2;
  v12[6] = a3;
  return sub_1E44DA538((uint64_t)v10, (uint64_t)&unk_1EAE48370, (uint64_t)v12, a4);
}

uint64_t sub_1E44DA274(uint64_t a1)
{
  switch(a1)
  {
    case 9:
      uint64_t result = sub_1E451B9D8();
      break;
    case 17:
      uint64_t result = sub_1E451B9F8();
      break;
    case 25:
    case 33:
      uint64_t result = sub_1E451B9E8();
      break;
    default:
      uint64_t result = sub_1E451BA08();
      break;
  }
  return result;
}

uint64_t sub_1E44DA340(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  void *v6 = v4;
  v6[1] = sub_1E44DAA10;
  return v8(a1);
}

uint64_t sub_1E44DA41C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1E44DA45C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[5];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E44AE0C8;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE48368 + dword_1EAE48368);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1E44DA538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1E451BA28();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) != 1)
  {
    sub_1E451BA18();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E44DA6DC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E451B9A8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a2;
  v10[4] = a3;
  return swift_task_create();
}

uint64_t sub_1E44DA6DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E44DA73C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E44DA818;
  return v6(a1);
}

uint64_t sub_1E44DA818()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1E44DA910()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E44DA948(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E44AE0C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE48378 + dword_1EAE48378);
  return v6(a1, v4);
}

id sub_1E44DAAAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserGuideManager.CloudDeviceDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id UserGuideManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id UserGuideManager.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id UserGuideManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E44DABD8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_model);
  sub_1E451B868();

  id v3 = objc_msgSend(a1, sel_maxOSVersion);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_1E451B868();
  }
  id v5 = objc_msgSend(a1, sel_displayName);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_1E451B868();
  }
  id v7 = objc_msgSend(a1, sel_symbolIdentifier);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_1E451B868();
  }
  id v9 = objc_allocWithZone((Class)sub_1E451B798());
  return sub_1E451B748();
}

uint64_t _s10TipsDaemon16UserGuideManagerC10userGuidesSay0A4Core0cD0CGyFZ_0()
{
  uint64_t v3 = MEMORY[0x1E4FBC860];
  uint64_t v0 = self;
  if (objc_msgSend(v0, sel_supportsUserGuide))
  {
    sub_1E44AEF40();
    MEMORY[0x1E4E801A0]();
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1E451B978();
    }
    sub_1E451B998();
    sub_1E451B968();
  }
  if (objc_msgSend(v0, sel_supportsCloudDeviceUserGuide))
  {
    unint64_t v1 = sub_1E44AF090();
    if (v1) {
      sub_1E450D264(v1);
    }
  }
  return v3;
}

uint64_t type metadata accessor for UserGuideManager()
{
  return self;
}

uint64_t type metadata accessor for UserGuideManager.CloudDeviceDataSource()
{
  return self;
}

unint64_t sub_1E44DAE80()
{
  unint64_t result = qword_1EBFF5A38;
  if (!qword_1EBFF5A38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBFF5A38);
  }
  return result;
}

uint64_t sub_1E44DAEC0(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return MEMORY[0x1F4188298](sub_1E44DAEE0, 0, 0);
}

id sub_1E44DAEE0()
{
  v0[2] = MEMORY[0x1E4FBC860];
  unint64_t v1 = v0[4];
  swift_bridgeObjectRetain();
  v0[3] = v1;
  id result = (id)swift_bridgeObjectRetain();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1E451BCD8();
    id result = (id)swift_bridgeObjectRelease();
    unint64_t v4 = v0[4];
    if (v7)
    {
LABEL_3:
      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_1E451BCD8();
        id result = (id)swift_bridgeObjectRelease();
        if (!v10)
        {
LABEL_26:
          __break(1u);
          return result;
        }
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_1E451BCD8();
        id result = (id)swift_bridgeObjectRelease();
        if (v11)
        {
LABEL_5:
          if ((v4 & 0xC000000000000001) == 0)
          {
            if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_25:
              __break(1u);
              goto LABEL_26;
            }
            id result = *(id *)(v4 + 32);
LABEL_8:
            v0[5] = result;
            if (v4 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v5 = sub_1E451BCD8();
              id result = (id)swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (v5)
            {
              sub_1E44DB664(0, 1);
              uint64_t v6 = (void *)swift_task_alloc();
              v0[6] = v6;
              void *v6 = v0;
              v6[1] = sub_1E44DB12C;
              return (id)TPSTip.csSearchableItemWithThumbnail.getter();
            }
            goto LABEL_25;
          }
LABEL_23:
          id result = (id)MEMORY[0x1E4E804B0](0, v4);
          goto LABEL_8;
        }
        __break(1u);
      }
      else if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_5;
      }
      __break(1u);
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t v4 = v0[4];
    if (v3) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease_n();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v9 = MEMORY[0x1E4FBC860];
  return (id)v8(v9);
}

uint64_t sub_1E44DB12C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();

  return MEMORY[0x1F4188298](sub_1E44DB248, 0, 0);
}

uint64_t sub_1E44DB248()
{
  uint64_t v1 = v0 + 3;
  if (v0[7])
  {
    MEMORY[0x1E4E801A0]();
    if (*(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[2] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    while (1)
    {
      sub_1E451B998();
      sub_1E451B968();
      uint64_t v2 = *v1;
      unint64_t v3 = (unint64_t)*v1 >> 62;
      if (!v3)
      {
        if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_13;
        }
        if ((v2 & 0xC000000000000001) != 0) {
          goto LABEL_26;
        }
        goto LABEL_6;
      }
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_1E451BCD8();
      swift_bridgeObjectRelease();
      if (!v10) {
        goto LABEL_13;
      }
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_1E451BCD8();
      swift_bridgeObjectRelease();
      if (v11) {
        break;
      }
      while (1)
      {
        __break(1u);
LABEL_25:
        if ((v2 & 0xC000000000000001) != 0) {
          break;
        }
LABEL_6:
        if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v4 = *(id *)(v2 + 32);
          goto LABEL_8;
        }
LABEL_23:
        __break(1u);
      }
LABEL_26:
      id v4 = (id)MEMORY[0x1E4E804B0](0, v2);
LABEL_8:
      v0[5] = v4;
      if (v3)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_1E451BCD8();
        swift_bridgeObjectRelease();
        if (v9)
        {
LABEL_10:
          sub_1E44DB664(0, 1);
          uint64_t v5 = (void *)swift_task_alloc();
          v0[6] = v5;
          *uint64_t v5 = v0;
          v5[1] = sub_1E44DB12C;
          return TPSTip.csSearchableItemWithThumbnail.getter();
        }
      }
      else if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_10;
      }
      __break(1u);
LABEL_18:
      sub_1E451B978();
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    if (!v12)
    {
      __break(1u);
      goto LABEL_23;
    }
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v7 = v0[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v7);
}

uint64_t sub_1E44DB4C4()
{
  objc_msgSend(v0, sel_lastModifiedDate);
  return sub_1E451BDC8();
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_1E44DB530(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1E44DB550(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_language()
{
  return sel_language;
}

void sub_1E44DB568(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1E44DB588(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void keypath_setTm(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  id v7 = (id)sub_1E451B858();
  objc_msgSend(v6, *a5, v7);
}

uint64_t sub_1E44DB5F8@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  objc_msgSend(*a1, sel_lastModifiedDate);
  uint64_t result = sub_1E451BDC8();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1E44DB650(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1E44957E4(a1, a2);
  }
  return a1;
}

uint64_t sub_1E44DB664(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1E451BCD8();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_32;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_34:
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_37:
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_35;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_37;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_38;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *unint64_t v3 = MEMORY[0x1E4E804C0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  sub_1E44A9E8C();
  uint64_t result = swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1E451BCD8();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v17 = v22 - v2;
      if (!__OFSUB__(v22, v2)) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v17 = v16 - v2;
      if (!__OFSUB__(v16, v2))
      {
LABEL_21:
        BOOL v18 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v18[8 * v17]) {
          uint64_t result = (uint64_t)memmove(v14, v18, 8 * v17);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v19 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v20 = v19 + v5;
          if (!__OFADD__(v19, v5))
          {
LABEL_26:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v20;
            goto LABEL_27;
          }
LABEL_44:
          __break(1u);
          return result;
        }
LABEL_42:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_1E451BCD8();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v20 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_26;
        }
        goto LABEL_44;
      }
    }
    __break(1u);
    goto LABEL_42;
  }
LABEL_27:

  return sub_1E451B968();
}

id TPSTip.csSearchableItem.getter()
{
  uint64_t v1 = sub_1E451B2B8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E451AF18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = 0;
  if ((objc_msgSend(v0, sel_type) & 2) != 0)
  {
    if ((objc_msgSend(v0, sel_isIntro) & 1) != 0
      || (objc_msgSend(v0, sel_isOutro) & 1) != 0
      || (objc_msgSend(v0, sel_isLinkedArticle) & 1) != 0)
    {
      return 0;
    }
    else
    {
      id v11 = objc_msgSend(v0, sel_identifier);
      id v32 = (id)sub_1E451B868();

      uint64_t v33 = sub_1E44DC6E0();
      id v12 = TPSTip.csAttributeSet.getter();
      uint64_t v31 = v2;
      if (!v12) {
        id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F23850]), sel_init);
      }
      uint64_t v13 = v12;
      id v32 = objc_allocWithZone(MEMORY[0x1E4F23840]);
      uint64_t v14 = (void *)sub_1E451B858();
      swift_bridgeObjectRelease();
      uint64_t v15 = (void *)sub_1E451B858();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(v32, sel_initWithUniqueIdentifier_domainIdentifier_attributeSet_, v14, v15, v13);

      id v16 = objc_msgSend(v9, sel_uniqueIdentifier);
      uint64_t v30 = sub_1E451B868();
      uint64_t v33 = v17;

      id v32 = objc_msgSend(v9, sel_attributeSet);
      id v18 = objc_msgSend(v0, sel_language);
      uint64_t v19 = sub_1E451B868();
      uint64_t v21 = v20;

      id v22 = objc_msgSend(v0, sel_bodyContent);
      if (v22
        && (uint64_t v23 = v22,
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5240),
            uint64_t v24 = sub_1E451B948(),
            v23,
            uint64_t v25 = sub_1E44DC7A8(v24),
            swift_bridgeObjectRelease(),
            v25))
      {
        uint64_t v26 = sub_1E44DC8F8(v25);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v26 = 0;
      }
      *(void *)&long long v37 = v30;
      *((void *)&v37 + 1) = v33;
      *(void *)&long long v38 = v32;
      *((void *)&v38 + 1) = v19;
      *(void *)&long long v39 = v21;
      *((void *)&v39 + 1) = v26;
      id v27 = objc_msgSend(v9, sel_attributeSet, v26);
      sub_1E44F87E0((uint64_t)v8);
      sub_1E451BB08();

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      id v28 = objc_msgSend(v9, sel_attributeSet);
      long long v34 = v37;
      long long v35 = v38;
      long long v36 = v39;
      sub_1E44DD584();
      sub_1E451BAF8();

      sub_1E451B278();
      uint64_t v29 = (void *)sub_1E451B288();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v1);
      objc_msgSend(v9, sel_setExpirationDate_, v29);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v9;
}

uint64_t TPSTip.csSearchableItemWithThumbnail.getter()
{
  v1[167] = v0;
  v1[173] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5160);
  v1[179] = swift_task_alloc();
  v1[185] = swift_task_alloc();
  v1[186] = swift_task_alloc();
  v1[187] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  v1[188] = swift_task_alloc();
  v1[189] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44DBE80, 0, 0);
}

uint64_t sub_1E44DBE80()
{
  uint64_t v1 = *(void *)(v0 + 1384);
  uint64_t v2 = *(void *)(v0 + 1336);
  *(void *)(v0 + 1520) = TPSTip.csSearchableItem.getter();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 152_Block_object_dispose(&STACK[0x240], 8) = v3;
  *(void *)(v3 + 16) = v2;
  swift_asyncLet_begin();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 1536) = v4;
  *(void *)(v4 + 16) = v2;
  swift_asyncLet_begin();
  *(_DWORD *)(v0 + 1544) = *(_DWORD *)(v1 + 48);
  uint64_t v5 = *(void *)(v0 + 1512);
  return MEMORY[0x1F41881D8](v0 + 16, v5, sub_1E44DBFA4, v0 + 1296);
}

uint64_t sub_1E44DBFA4()
{
  sub_1E44DD718(v0[189], v0[186]);
  uint64_t v1 = v0[188];
  return MEMORY[0x1F41881D8](v0 + 82, v1, sub_1E44DC01C, v0 + 168);
}

uint64_t sub_1E44DC01C()
{
  return MEMORY[0x1F4188298](sub_1E44DC038, 0, 0);
}

uint64_t sub_1E44DC038()
{
  uint64_t v1 = *(void *)(v0 + 1520);
  sub_1E44DD718(*(void *)(v0 + 1504), *(void *)(v0 + 1488) + *(int *)(v0 + 1544));
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 1488);
    uint64_t v3 = *(void *)(v0 + 1480);
    uint64_t v4 = *(void *)(v0 + 1384);
    uint64_t v5 = v2 + *(int *)(v0 + 1544);
    id v22 = *(id *)(v0 + 1520);
    id v6 = objc_msgSend(v22, sel_attributeSet);
    uint64_t v7 = v3 + *(int *)(v4 + 48);
    sub_1E44DD718(v2, v3);
    sub_1E44DD718(v5, v7);
    uint64_t v8 = sub_1E451B1D8();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    uint64_t v10 = 0;
    if (v21(v3, 1, v8) != 1)
    {
      uint64_t v11 = *(void *)(v0 + 1480);
      uint64_t v10 = (void *)sub_1E451B168();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
    }
    uint64_t v12 = *(void *)(v0 + 1488);
    uint64_t v13 = *(void *)(v0 + 1432);
    uint64_t v14 = *(void *)(v0 + 1384);
    uint64_t v20 = v12 + *(int *)(v0 + 1544);
    sub_1E44DD780(v7, &qword_1EBFF52B0);
    objc_msgSend(v6, sel_setThumbnailURL_, v10);

    id v15 = objc_msgSend(v22, sel_attributeSet);
    uint64_t v16 = v13 + *(int *)(v14 + 48);
    sub_1E44DD718(v12, v13);
    sub_1E44DD718(v20, v16);
    if (v21(v16, 1, v8) == 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = (void *)sub_1E451B168();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v16, v8);
    }
    sub_1E44DD780(*(void *)(v0 + 1432), &qword_1EBFF52B0);
    objc_msgSend(v15, sel_setDarkThumbnailURL_, v17);
  }
  sub_1E44DD780(*(void *)(v0 + 1488), &qword_1EBFF5160);
  uint64_t v18 = *(void *)(v0 + 1504);
  return MEMORY[0x1F41881D0](v0 + 656, v18, sub_1E44DC2D0, v0 + 1392);
}

uint64_t sub_1E44DC2D0()
{
  return MEMORY[0x1F4188298](sub_1E44DC2EC, 0, 0);
}

uint64_t sub_1E44DC2EC()
{
  swift_task_dealloc();
  uint64_t v1 = *(void *)(v0 + 1512);
  return MEMORY[0x1F41881D0](v0 + 16, v1, sub_1E44DC360, v0 + 1440);
}

uint64_t sub_1E44DC360()
{
  return MEMORY[0x1F4188298](sub_1E44DC37C, 0, 0);
}

uint64_t sub_1E44DC37C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 1520);
  return v1(v2);
}

uint64_t TPSTip.indexable.getter()
{
  if ((objc_msgSend(v0, sel_type) & 2) == 0
    || (objc_msgSend(v0, sel_isIntro) & 1) != 0
    || (objc_msgSend(v0, sel_isOutro) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(v0, sel_isLinkedArticle) ^ 1;
  }
}

void *TPSTip.csAttributeSet.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5210);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1E451B5D8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v9 = objc_msgSend(v0, sel_type);
  uint64_t v10 = 0;
  if ((v9 & 2) != 0)
  {
    if ((objc_msgSend(v1, sel_isIntro) & 1) != 0
      || (objc_msgSend(v1, sel_isOutro) & 1) != 0
      || (objc_msgSend(v1, sel_isLinkedArticle) & 1) != 0)
    {
      return 0;
    }
    else
    {
      sub_1E44A9E8C();
      sub_1E451BB38();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
      sub_1E451B5B8();
      id v12 = objc_allocWithZone(MEMORY[0x1E4F23850]);
      uint64_t v13 = (void *)sub_1E451B5C8();
      id v14 = objc_msgSend(v12, sel_initWithContentType_, v13);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      uint64_t v10 = sub_1E44DD7DC(v14);
    }
  }
  return v10;
}

CSSearchableItemAttributeSet __swiftcall TPSTip.addAttributes(to:)(CSSearchableItemAttributeSet to)
{
  uint64_t v1 = sub_1E44DD7DC(to.super.isa);

  return (CSSearchableItemAttributeSet)v1;
}

uint64_t sub_1E44DC6E0()
{
  uint64_t v1 = 1936746868;
  id v2 = objc_msgSend(v0, sel_collectionIdentifiers);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_1E451B948();

    if (*(void *)(v4 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_1E451B8C8();
      swift_bridgeObjectRelease();
      return 0x2E73706974;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v1;
}

uint64_t sub_1E44DC7A8(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x1E4FBC860];
  sub_1E4513F48(0, v2, 0);
  uint64_t v3 = v9;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5240);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5860);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1E4513F48(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v9;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1E4513F48((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v9;
      }
      *(void *)(v3 + 16) = v6 + 1;
      *(void *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_1E44DC8F8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1E4513F28(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5860);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5850);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1E4513F28(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1E4513F28((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      *(void *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1E44DCA3C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1E4513F68(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58D8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1E4513F68(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1E4513F68((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_1E4497328(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1E44DCB68(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E44DDAB8;
  return sub_1E44DCC04(a1);
}

uint64_t sub_1E44DCC04(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_1E451B1D8();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44DCCD4, 0, 0);
}

uint64_t sub_1E44DCCD4()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = (void *)v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5438);
  id v6 = v5;
  sub_1E44ABD80();
  sub_1E451B178();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  type metadata accessor for ThumbnailFetcher();
  swift_allocObject();
  v0[8] = sub_1E44E3C10(v6, v1);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[9] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1E44DCE14;
  uint64_t v8 = v0[2];
  return sub_1E44E3E40(v8, 0);
}

uint64_t sub_1E44DCE14()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_1E44DCF9C;
  }
  else
  {
    uint64_t v1 = sub_1E44DCF2C;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

uint64_t sub_1E44DCF2C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44DCF9C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[2];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v3, 1, 1, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1E44DD03C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1E44DA818;
  return sub_1E44DD0D8(a1);
}

uint64_t sub_1E44DD0D8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_1E451B1D8();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44DD1A8, 0, 0);
}

uint64_t sub_1E44DD1A8()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = (void *)v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5438);
  id v6 = v5;
  sub_1E44ABD80();
  sub_1E451B178();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  type metadata accessor for ThumbnailFetcher();
  swift_allocObject();
  v0[8] = sub_1E44E3C10(v6, v1);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[9] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1E44DD2E8;
  uint64_t v8 = v0[2];
  return sub_1E44E3E40(v8, 1);
}

uint64_t sub_1E44DD2E8()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_1E44DDAB0;
  }
  else
  {
    uint64_t v1 = sub_1E44DDAB4;
  }
  return MEMORY[0x1F4188298](v1, 0, 0);
}

void *sub_1E44DD400()
{
  id v1 = objc_msgSend(v0, sel_fullContent);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_bodyText);

    if (v3) {
      goto LABEL_9;
    }
  }
  id v4 = objc_msgSend(v0, sel_fullContent);
  if (!v4
    || (uint64_t v5 = v4, v6 = objc_msgSend(v4, sel_bodyContent), v5, !v6))
  {
    id v10 = objc_msgSend(v0, sel_notification);
    uint64_t v9 = v10;
    if (!v10) {
      return v9;
    }
    id v3 = objc_msgSend(v10, sel_text);

    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5240);
  sub_1E451B948();

  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1E451B938();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v7, sel_altTextRepresentationForContent_, v8);

  if (v3)
  {
LABEL_9:
    uint64_t v9 = (void *)sub_1E451B868();

    return v9;
  }
  return 0;
}

unint64_t sub_1E44DD584()
{
  unint64_t result = qword_1EBFF51C8;
  if (!qword_1EBFF51C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51C8);
  }
  return result;
}

uint64_t sub_1E44DD5D8(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_1E44DAA10;
  return sub_1E44DCB68(a1);
}

uint64_t sub_1E44DD678(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_1E44AE0C8;
  return sub_1E44DD03C(a1);
}

uint64_t sub_1E44DD718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E44DD780(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1E44DD7DC(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(v1, sel_fullContent);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, sel_title);

    if (v6)
    {
      sub_1E451B868();

      uint64_t v5 = (void *)sub_1E451B858();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  objc_msgSend(a1, sel_setDisplayName_, v5);

  id v7 = objc_msgSend(v2, sel_identifier);
  if (!v7)
  {
    sub_1E451B868();
    id v7 = (id)sub_1E451B858();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(a1, sel_setUniqueIdentifier_, v7);

  sub_1E44DC6E0();
  uint64_t v8 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setDomainIdentifier_, v8);

  id v9 = objc_msgSend(v2, sel_collectionIdentifiers);
  if (v9)
  {
    uint64_t v10 = sub_1E451B948();

    if (*(void *)(v10 + 16)) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
  }
  sub_1E451BB18();
  id v11 = objc_msgSend(v2, sel_keywords);
  objc_msgSend(a1, sel_setKeywords_, v11);

  sub_1E44DD400();
  if (v12)
  {
    uint64_t v13 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_msgSend(a1, sel_setContentDescription_, v13);

  id v14 = objc_msgSend(v2, sel_fullContentAssets);
  id v15 = objc_msgSend(v14, sel_alt);

  objc_msgSend(a1, sel_setTextContent_, v15);
  id v16 = objc_msgSend(v2, sel_correlationID);
  if (v16)
  {
    uint64_t v17 = v16;
    sub_1E451B868();
  }
  sub_1E451BB28();
  return a1;
}

BOOL TPSTargetingConditionJoinType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_1E44DDAE4()
{
  return sub_1E451BEC8();
}

void *sub_1E44DDB14@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x240], 8) = v2;
  return result;
}

unint64_t TPSTargetingConditionStatusType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_1E44DDB58@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x240], 8) = v3;
  return result;
}

unint64_t sub_1E44DDB7C()
{
  unint64_t result = qword_1EAE48430;
  if (!qword_1EAE48430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48430);
  }
  return result;
}

unint64_t sub_1E44DDBD4()
{
  unint64_t result = qword_1EAE48438;
  if (!qword_1EAE48438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48438);
  }
  return result;
}

unint64_t sub_1E44DDC2C()
{
  unint64_t result = qword_1EAE48440;
  if (!qword_1EAE48440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48440);
  }
  return result;
}

uint64_t sub_1E44DDC80()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44DDCC8()
{
  return sub_1E451BEE8();
}

ValueMetadata *type metadata accessor for TPSTargetingConditionJoinType()
{
  return &type metadata for TPSTargetingConditionJoinType;
}

ValueMetadata *type metadata accessor for TPSTargetingConditionStatusType()
{
  return &type metadata for TPSTargetingConditionStatusType;
}

ValueMetadata *type metadata accessor for TPSTargetingConditionValidateType()
{
  return &type metadata for TPSTargetingConditionValidateType;
}

uint64_t sub_1E44DDD58(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5298);
  if (swift_dynamicCast())
  {
    sub_1E44E1E4C(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_1E451B088();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_1E44E1C7C((uint64_t)v38);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      id v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      id v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_1E451BC58();
      }
      if (v4) {
        id v6 = (unsigned char *)(v4 + v5);
      }
      else {
        id v6 = 0;
      }
      id v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_1E44E1CDC(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_1E451B8D8();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_1E44E1D40(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x1F4188790](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_1E44DFFB4((void *(*)(uint64_t *__return_ptr, char *, char *))sub_1E44E1DE0);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_1E451B228();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_1E44E19F0(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_1E451B908();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_1E451BC58();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_1E44E19F0(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_1E451B8E8();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_1E451B238();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_1E451B238();
    sub_1E4496EBC(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_1E4496EBC((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

BOOL sub_1E44DE280(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1E44DE294()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44DE2DC()
{
  return sub_1E451BEC8();
}

uint64_t sub_1E44DE308()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44DE34C(uint64_t a1, unint64_t a2, __int16 a3)
{
  uint64_t v6 = sub_1E451B668();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v10 = sub_1E44AAAC0(a1, a2, (uint64_t (*)(void))sub_1E44E2998, (void (*)(uint64_t, uint64_t))sub_1E44DE6E4);
  uint64_t v12 = v11;
  unint64_t v14 = v13;
  if (v10 != a3)
  {
    __int16 v20 = v10;
    sub_1E451B648();
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_1E451BC08();
    sub_1E451B8C8();
    __int16 v25 = v20;
    sub_1E451BDC8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    __int16 v25 = a3;
    sub_1E451BDC8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
LABEL_8:
    sub_1E451B8C8();
    sub_1E451B718();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    uint64_t v15 = sub_1E44DE6E4(2);
    unint64_t v17 = v16;
    sub_1E44957E4(v12, v14);
    char v18 = sub_1E44AF898(v15, v17, v12, v14);
    sub_1E4496E64(v12, v14);
    sub_1E4496E64(v15, v17);
    if (v18)
    {
      sub_1E4496E64(v12, v14);
      return 1;
    }
    sub_1E451B648();
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_1E451BC08();
    sub_1E451B8C8();
    sub_1E44957E4(v12, v14);
    sub_1E451B208();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E4496E64(v12, v14);
    sub_1E451B8C8();
    uint64_t v21 = sub_1E44DE6E4(2);
    unint64_t v23 = v22;
    sub_1E451B208();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E4496E64(v21, v23);
    goto LABEL_8;
  }
  sub_1E451B648();
  sub_1E451B718();
LABEL_9:
  sub_1E4496E64(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

uint64_t sub_1E44DE6E4(__int16 a1)
{
  uint64_t v2 = 0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1E451B7B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E451B7E8();
  uint64_t v29 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E451B7D8();
  LOWORD(v32) = a1;
  uint64_t v10 = sub_1E44AF788((uint64_t)&v32, (uint64_t)&v32 + 2);
  uint64_t v12 = v10;
  unint64_t v13 = v11;
  uint64_t v30 = v7;
  switch(v11 >> 62)
  {
    case 1uLL:
      uint64_t v28 = v4;
      if (v10 >> 32 < (int)v10) {
        __break(1u);
      }
      sub_1E44957E4(v10, v11);
      sub_1E44E1578((int)v12, v12 >> 32);
      sub_1E4496E64(v12, v13);
      uint64_t v4 = v28;
      goto LABEL_9;
    case 2uLL:
      uint64_t v14 = v4;
      uint64_t v28 = 0;
      uint64_t v16 = *(void *)(v10 + 16);
      uint64_t v15 = *(void *)(v10 + 24);
      sub_1E44957E4(v10, v11);
      swift_retain();
      swift_retain();
      uint64_t v17 = v16;
      uint64_t v4 = v14;
      uint64_t v18 = v28;
      sub_1E44E1578(v17, v15);
      uint64_t v2 = v18;
      swift_release();
      swift_release();
      goto LABEL_6;
    case 3uLL:
      sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
      *(void *)&long long v32 = 0;
      *(void *)((char *)&v32 + 6) = 0;
      goto LABEL_5;
    default:
      *(void *)&long long v32 = v10;
      WORD4(v32) = v11;
      BYTE10(v32) = BYTE2(v11);
      BYTE11(v32) = BYTE3(v11);
      BYTE12(v32) = BYTE4(v11);
      BYTE13(v32) = BYTE5(v11);
      sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
LABEL_5:
      sub_1E451B7A8();
LABEL_6:
      sub_1E4496E64(v12, v13);
LABEL_9:
      uint64_t v19 = swift_bridgeObjectRetain();
      *(void *)&long long v32 = sub_1E44A9540(v19, &qword_1EBFF5950, (uint64_t (*)(uint64_t *, void *, uint64_t, uint64_t))sub_1E44E0F2C);
      sub_1E44E03DC((void **)&v32);
      if (v2)
      {
        swift_release();
        __break(1u);
        JUMPOUT(0x1E44DEC0CLL);
      }
      swift_bridgeObjectRelease();
      uint64_t v20 = v32;
      uint64_t v21 = *(void *)(v32 + 16);
      if (v21)
      {
        swift_retain();
        unint64_t v22 = (uint64_t *)(v20 + 56);
        do
        {
          uint64_t v24 = *(v22 - 1);
          uint64_t v23 = *v22;
          long long v32 = *(_OWORD *)(v22 - 3);
          uint64_t v33 = v24;
          uint64_t v34 = v23;
          sub_1E44DF0C0((unint64_t *)&v32);
          v22 += 4;
          --v21;
        }
        while (v21);
        swift_release();
      }
      swift_release();
      sub_1E451B7C8();
      uint64_t v34 = v3;
      uint64_t v35 = sub_1E4496ED0(&qword_1EBFF5810, MEMORY[0x1E4F24F80]);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v32);
      (*(void (**)(uint64_t *, char *, uint64_t))(v4 + 16))(boxed_opaque_existential_1, v6, v3);
      __swift_project_boxed_opaque_existential_1(&v32, v34);
      sub_1E451B088();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v26 = v31;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
      sub_1E4496E64(v12, v13);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v30);
      return v26;
  }
}

uint64_t sub_1E44DEC1C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_1E4496570(v6, v5);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v9 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v11 == a1[4] && v10 == a1[5])
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v13 = sub_1E451BDE8();
    swift_bridgeObjectRelease();
    if (v13) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1E44DECE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a5[2];
  if (!v5) {
    return 0;
  }
  if (a5[4] == a1 && a5[5] == a2) {
    return 1;
  }
  uint64_t result = sub_1E451BDE8();
  if (result) {
    return 1;
  }
  if (v5 == 1) {
    return 0;
  }
  uint64_t v11 = a5 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v14 = *(v11 - 1) == a1 && *v11 == a2;
    if (v14 || (sub_1E451BDE8() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v11 += 2;
    if (v13 == v5) {
      return result;
    }
  }
  __break(1u);
  return result;
}

BOOL sub_1E44DEDA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1E44DEDC0()
{
  if (*v0) {
    return 0x4764657865646E69;
  }
  else {
    return 0x6E6F6973726576;
  }
}

uint64_t sub_1E44DEE08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1E44E2360(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1E44DEE30()
{
  return 0;
}

void sub_1E44DEE3C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1E44DEE48(uint64_t a1)
{
  unint64_t v2 = sub_1E44E22C4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E44DEE84(uint64_t a1)
{
  unint64_t v2 = sub_1E44E22C4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E44DEEC0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BD0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44E22C4();
  sub_1E451BF18();
  char v13 = 0;
  sub_1E451BDA8();
  if (!v3)
  {
    v11[1] = a3;
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5828);
    sub_1E44E2688(&qword_1EBFF5B90);
    sub_1E451BD98();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1E44DF070@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1E44E2478(a1);
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(void *)(a2 + _Block_object_dispose(&STACK[0x240], 8) = v5;
  }
  return result;
}

uint64_t sub_1E44DF0A0(void *a1)
{
  return sub_1E44DEEC0(a1, *v1, *((void *)v1 + 1));
}

uint64_t sub_1E44DF0C0(unint64_t *a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  unint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1E44DDD58(v3, v4);
  uint64_t v9 = v7;
  unint64_t v10 = v8;
  switch(v8 >> 62)
  {
    case 1uLL:
      if (v7 >> 32 < (int)v7)
      {
        __break(1u);
LABEL_15:
        __break(1u);
      }
      sub_1E44957E4(v7, v8);
      sub_1E44E1578((int)v9, v9 >> 32);
      break;
    case 2uLL:
      uint64_t v11 = *(void *)(v7 + 16);
      uint64_t v12 = *(void *)(v7 + 24);
      sub_1E44957E4(v7, v8);
      swift_retain();
      swift_retain();
      sub_1E44E1578(v11, v12);
      if (v2)
      {
        swift_release();
        swift_release();
        __break(1u);
LABEL_17:
        swift_release();
        swift_release();
        __break(1u);
        JUMPOUT(0x1E44DF5A4);
      }
      uint64_t v2 = 0;
      swift_release();
      swift_release();
      break;
    default:
      sub_1E451B7E8();
      sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
      sub_1E451B7A8();
      break;
  }
  sub_1E4496E64(v9, v10);
  sub_1E4496E64(v9, v10);
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1E44DDD58(v5, v6);
  uint64_t v15 = v13;
  unint64_t v16 = v14;
  switch(v14 >> 62)
  {
    case 1uLL:
      if (v13 >> 32 < (int)v13) {
        goto LABEL_15;
      }
      sub_1E44957E4(v13, v14);
      sub_1E44E1578((int)v15, v15 >> 32);
      break;
    case 2uLL:
      uint64_t v17 = *(void *)(v13 + 16);
      uint64_t v18 = *(void *)(v13 + 24);
      sub_1E44957E4(v13, v14);
      swift_retain();
      swift_retain();
      sub_1E44E1578(v17, v18);
      if (v2) {
        goto LABEL_17;
      }
      swift_release();
      swift_release();
      break;
    default:
      sub_1E451B7E8();
      sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
      sub_1E451B7A8();
      break;
  }
  sub_1E4496E64(v15, v16);
  return sub_1E4496E64(v15, v16);
}

uint64_t sub_1E44DF5C4()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_1E451BEB8();
  sub_1E451BED8();
  swift_bridgeObjectRetain();
  sub_1E44E1658((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1E451BEE8();
}

uint64_t sub_1E44DF634(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  sub_1E451BED8();
  swift_bridgeObjectRetain();
  sub_1E44E1658(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E44DF694()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_1E451BEB8();
  sub_1E451BED8();
  swift_bridgeObjectRetain();
  sub_1E44E1658((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1E451BEE8();
}

uint64_t sub_1E44DF700(__int16 *a1, __int16 *a2)
{
  __int16 v2 = *a2;
  uint64_t v3 = sub_1E44DE6E4(*a1);
  unint64_t v5 = v4;
  uint64_t v6 = sub_1E44DE6E4(v2);
  unint64_t v8 = v7;
  char v9 = sub_1E44AF898(v3, v5, v6, v7);
  sub_1E4496E64(v6, v8);
  sub_1E4496E64(v3, v5);
  return v9 & 1;
}

unint64_t sub_1E44DF798()
{
  unint64_t result = qword_1EAE48448;
  if (!qword_1EAE48448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48448);
  }
  return result;
}

void *sub_1E44DF7FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5958);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1E44E1150((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1E44E1E84();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

void *sub_1E44DF8E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5958);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1E44E1350((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1E44E1E84();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

void sub_1E44DF9CC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
}

void sub_1E44DF9E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
}

void sub_1E44DF9F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v6)
  {
    if (v6 <= 0)
    {
      if (v5 != a3)
      {
LABEL_7:
        sub_1E449AE1C(0, a5);
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5970);
      char v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      v9[2] = v6;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v5 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

void *sub_1E44DFAEC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5948);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5868);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_1E44DFC10(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5950);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48450);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_1E44DFD34(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1E44DFE8C(a1, a2, a3, a4, &qword_1EBFF5288, &qword_1EBFF5850);
}

void *sub_1E44DFD48(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1E44DFE8C(a1, a2, a3, a4, &qword_1EBFF5940, &qword_1EBFF5860);
}

char *sub_1E44DFD5C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5978);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_1E44DFE64(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1E44DFE8C(a1, a2, a3, a4, &qword_1EBFF5BD8, &qword_1EBFF5B98);
}

void *sub_1E44DFE78(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_1E44DFE8C(a1, a2, a3, a4, &qword_1EBFF5290, &qword_1EBFF5248);
}

void *sub_1E44DFE8C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

char *sub_1E44DFFB4(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  char v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_1E4520140;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_1E451B038() && __OFSUB__((int)v4, sub_1E451B068())) {
        goto LABEL_24;
      }
      sub_1E451B078();
      swift_allocObject();
      uint64_t v13 = sub_1E451B018();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      unint64_t result = sub_1E44E0328((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *char v5 = v4;
        goto LABEL_19;
      }
      *char v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1E451B1E8();
      unint64_t result = sub_1E44E0328(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

void *sub_1E44E02B8(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_1E44E0328(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)sub_1E451B038();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  unint64_t result = (char *)sub_1E451B068();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_1E451B058();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_1E44E03DC(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E44E1564(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_1E44E0448(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1E44E0448(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1E451BDB8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_1E44E0B08(0, v3, 1, a1);
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
    goto LABEL_151;
  }
  uint64_t v106 = result;
  uint64_t v103 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x1E4FBC860];
    v109 = (char *)(MEMORY[0x1E4FBC860] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x1E4FBC860] + 16);
      uint64_t v10 = MEMORY[0x1E4FBC860];
LABEL_117:
      uint64_t result = v10;
      uint64_t v105 = v7;
      if (v11 >= 2)
      {
        uint64_t v95 = *v103;
        do
        {
          unint64_t v96 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = result;
          uint64_t v98 = *(void *)(result + 32 + 16 * v96);
          uint64_t v99 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_1E44E0BEC((char *)(v95 + 32 * v98), (char *)(v95 + 32 * *(void *)(result + 32 + 16 * (v11 - 1))), v95 + 32 * v99, v109);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_1E44E0F18(v97);
            uint64_t v97 = result;
          }
          if (v96 >= *(void *)(v97 + 16)) {
            goto LABEL_148;
          }
          v100 = (void *)(v97 + 32 + 16 * v96);
          void *v100 = v98;
          v100[1] = v99;
          unint64_t v101 = *(void *)(v97 + 16);
          if (v11 > v101) {
            goto LABEL_149;
          }
          memmove((void *)(v97 + 32 + 16 * (v11 - 1)), (const void *)(v97 + 32 + 16 * v11), 16 * (v101 - v11));
          uint64_t result = v97;
          *(void *)(v97 + 16) = v101 - 1;
          unint64_t v11 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v105 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v105 = MEMORY[0x1E4FBC860];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48450);
    uint64_t result = sub_1E451B988();
    *(void *)(result + 16) = v6;
    uint64_t v105 = result;
    v109 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v104 = *a1 + 8;
  uint64_t v102 = *a1 + 24;
  uint64_t v10 = MEMORY[0x1E4FBC860];
  uint64_t v107 = v3;
  uint64_t v108 = *a1;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    uint64_t v13 = (uint64_t *)(v9 + 32 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    uint64_t v15 = (void *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_1E451BDE8();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v19 = (void *)(v104 + 32 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      uint64_t v21 = (void *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_1E451BDE8();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 4;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 32 * v18;
        uint64_t v24 = 32 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            unint64_t v27 = (_OWORD *)(v9 + v24);
            uint64_t v28 = v9 + v23;
            long long v29 = *(_OWORD *)(v9 + v24);
            uint64_t v30 = *(void *)(v9 + v24 + 16);
            uint64_t v31 = *(void *)(v9 + v24 + 24);
            long long v32 = *(_OWORD *)(v9 + v23 - 16);
            *unint64_t v27 = *(_OWORD *)(v9 + v23 - 32);
            v27[1] = v32;
            *(_OWORD *)(v28 - 32) = v29;
            *(void *)(v28 - 16) = v30;
            *(void *)(v28 - _Block_object_dispose(&STACK[0x240], 8) = v31;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_44:
      uint64_t v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v106) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1E44E0E1C(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v45 = *(void *)(v10 + 16);
    unint64_t v44 = *(void *)(v10 + 24);
    unint64_t v11 = v45 + 1;
    if (v45 >= v44 >> 1)
    {
      uint64_t result = (uint64_t)sub_1E44E0E1C((char *)(v44 > 1), v45 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v46 = v10 + 32;
    uint64_t v47 = (uint64_t *)(v10 + 32 + 16 * v45);
    *uint64_t v47 = v12;
    v47[1] = v8;
    if (v45)
    {
      uint64_t v9 = v108;
      while (1)
      {
        unint64_t v48 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v53 = v46 + 16 * v11;
          uint64_t v54 = *(void *)(v53 - 64);
          uint64_t v55 = *(void *)(v53 - 56);
          BOOL v59 = __OFSUB__(v55, v54);
          uint64_t v56 = v55 - v54;
          if (v59) {
            goto LABEL_134;
          }
          uint64_t v58 = *(void *)(v53 - 48);
          uint64_t v57 = *(void *)(v53 - 40);
          BOOL v59 = __OFSUB__(v57, v58);
          uint64_t v51 = v57 - v58;
          char v52 = v59;
          if (v59) {
            goto LABEL_135;
          }
          unint64_t v60 = v11 - 2;
          uint64_t v61 = (uint64_t *)(v46 + 16 * (v11 - 2));
          uint64_t v63 = *v61;
          uint64_t v62 = v61[1];
          BOOL v59 = __OFSUB__(v62, v63);
          uint64_t v64 = v62 - v63;
          if (v59) {
            goto LABEL_136;
          }
          BOOL v59 = __OFADD__(v51, v64);
          uint64_t v65 = v51 + v64;
          if (v59) {
            goto LABEL_138;
          }
          if (v65 >= v56)
          {
            uint64_t v83 = (uint64_t *)(v46 + 16 * v48);
            uint64_t v85 = *v83;
            uint64_t v84 = v83[1];
            BOOL v59 = __OFSUB__(v84, v85);
            uint64_t v86 = v84 - v85;
            if (v59) {
              goto LABEL_144;
            }
            BOOL v76 = v51 < v86;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v77 = *(void *)(v10 + 32);
            uint64_t v78 = *(void *)(v10 + 40);
            BOOL v59 = __OFSUB__(v78, v77);
            uint64_t v70 = v78 - v77;
            char v71 = v59;
            goto LABEL_98;
          }
          uint64_t v50 = *(void *)(v10 + 32);
          uint64_t v49 = *(void *)(v10 + 40);
          BOOL v59 = __OFSUB__(v49, v50);
          uint64_t v51 = v49 - v50;
          char v52 = v59;
        }
        if (v52) {
          goto LABEL_137;
        }
        unint64_t v60 = v11 - 2;
        uint64_t v66 = (uint64_t *)(v46 + 16 * (v11 - 2));
        uint64_t v68 = *v66;
        uint64_t v67 = v66[1];
        BOOL v69 = __OFSUB__(v67, v68);
        uint64_t v70 = v67 - v68;
        char v71 = v69;
        if (v69) {
          goto LABEL_139;
        }
        uint64_t v72 = (uint64_t *)(v46 + 16 * v48);
        uint64_t v74 = *v72;
        uint64_t v73 = v72[1];
        BOOL v59 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v59) {
          goto LABEL_141;
        }
        if (__OFADD__(v70, v75)) {
          goto LABEL_143;
        }
        if (v70 + v75 >= v51)
        {
          BOOL v76 = v51 < v75;
LABEL_104:
          if (v76) {
            unint64_t v48 = v60;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v71) {
          goto LABEL_140;
        }
        uint64_t v79 = (uint64_t *)(v46 + 16 * v48);
        uint64_t v81 = *v79;
        uint64_t v80 = v79[1];
        BOOL v59 = __OFSUB__(v80, v81);
        uint64_t v82 = v80 - v81;
        if (v59) {
          goto LABEL_142;
        }
        if (v82 < v70) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v87 = v48 - 1;
        if (v48 - 1 >= v11)
        {
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
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v88 = v10;
        uint64_t v89 = v9;
        uint64_t v90 = (uint64_t *)(v46 + 16 * v87);
        uint64_t v91 = *v90;
        uint64_t v92 = (void *)(v46 + 16 * v48);
        uint64_t v93 = v92[1];
        uint64_t result = sub_1E44E0BEC((char *)(v89 + 32 * *v90), (char *)(v89 + 32 * *v92), v89 + 32 * v93, v109);
        if (v1) {
          goto LABEL_114;
        }
        if (v93 < v91) {
          goto LABEL_131;
        }
        if (v48 > *(void *)(v88 + 16)) {
          goto LABEL_132;
        }
        *uint64_t v90 = v91;
        *(void *)(v46 + 16 * v87 + _Block_object_dispose(&STACK[0x240], 8) = v93;
        unint64_t v94 = *(void *)(v88 + 16);
        if (v48 >= v94) {
          goto LABEL_133;
        }
        uint64_t v10 = v88;
        unint64_t v11 = v94 - 1;
        uint64_t result = (uint64_t)memmove((void *)(v46 + 16 * v48), v92 + 2, 16 * (v94 - 1 - v48));
        *(void *)(v88 + 16) = v94 - 1;
        BOOL v76 = v94 > 2;
        uint64_t v9 = v108;
        if (!v76) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
    uint64_t v9 = v108;
LABEL_15:
    uint64_t v3 = v107;
    if (v8 >= v107)
    {
      uint64_t v7 = v105;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v106)) {
    goto LABEL_153;
  }
  if (v12 + v106 >= v3) {
    uint64_t v33 = v3;
  }
  else {
    uint64_t v33 = v12 + v106;
  }
  if (v33 >= v12)
  {
    if (v8 != v33)
    {
      uint64_t v34 = (void *)(v102 + 32 * v8);
      do
      {
        uint64_t v35 = (uint64_t *)(v9 + 32 * v8);
        uint64_t result = *v35;
        uint64_t v36 = v35[1];
        uint64_t v37 = v12;
        long long v38 = v34;
        do
        {
          uint64_t v39 = (long long *)(v38 - 7);
          if (result == *(v38 - 7) && v36 == *(v38 - 6)) {
            break;
          }
          uint64_t result = sub_1E451BDE8();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          long long v42 = *v39;
          long long v41 = *(_OWORD *)(v38 - 5);
          *(v38 - 4) = *v38;
          v38 -= 4;
          uint64_t result = v38[1];
          uint64_t v36 = v38[2];
          uint64_t v43 = v38[3];
          v39[2] = v42;
          v39[3] = v41;
          *(v38 - 3) = result;
          *(v38 - 2) = v36;
          *(v38 - 1) = v43;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v34 += 4;
      }
      while (v8 != v33);
      uint64_t v8 = v33;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_1E44E0B08(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 32 * a3 + 24;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 32 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    uint64_t v12 = (void *)v8;
    while (1)
    {
      uint64_t v13 = (long long *)(v12 - 7);
      BOOL v14 = result == *(v12 - 7) && v10 == *(v12 - 6);
      if (v14 || (uint64_t result = sub_1E451BDE8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      long long v16 = *v13;
      long long v15 = *(_OWORD *)(v12 - 5);
      *(v12 - 4) = *v12;
      v12 -= 4;
      uint64_t result = v12[1];
      uint64_t v10 = v12[2];
      uint64_t v17 = v12[3];
      v13[2] = v16;
      v13[3] = v15;
      *(v12 - 3) = result;
      *(v12 - 2) = v10;
      *(v12 - 1) = v17;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1E44E0BEC(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 31;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 5;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 31;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 5;
  if (v10 >= v12 >> 5)
  {
    if (a4 != __src || &__src[32 * v13] <= a4) {
      memmove(a4, __src, 32 * v13);
    }
    BOOL v14 = &v4[32 * v13];
    if (v7 >= v6 || v11 < 32) {
      goto LABEL_48;
    }
    uint64_t v18 = (char *)(a3 - 32);
    while (1)
    {
      uint64_t v19 = v18 + 32;
      uint64_t v20 = v6 - 32;
      BOOL v21 = *((void *)v14 - 4) == *((void *)v6 - 4) && *((void *)v14 - 3) == *((void *)v6 - 3);
      if (v21 || (sub_1E451BDE8() & 1) == 0)
      {
        uint64_t v20 = v14 - 32;
        if (v19 != v14)
        {
          v14 -= 32;
LABEL_45:
          long long v23 = *((_OWORD *)v20 + 1);
          *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
          *((_OWORD *)v18 + 1) = v23;
          goto LABEL_46;
        }
        BOOL v22 = v18 >= v14;
        v14 -= 32;
        if (v22) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v19 != v6)
        {
          v6 -= 32;
          goto LABEL_45;
        }
        BOOL v22 = v18 >= v6;
        v6 -= 32;
        if (v22) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v18 -= 32;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[32 * v10] <= a4) {
    memmove(a4, __dst, 32 * v10);
  }
  BOOL v14 = &v4[32 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v15 || (sub_1E451BDE8() & 1) == 0) {
        break;
      }
      long long v16 = v6;
      BOOL v15 = v7 == v6;
      v6 += 32;
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 32;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    long long v16 = v4;
    BOOL v15 = v7 == v4;
    v4 += 32;
    if (v15) {
      goto LABEL_21;
    }
LABEL_20:
    long long v17 = *((_OWORD *)v16 + 1);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
    *((_OWORD *)v7 + 1) = v17;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0x1FuLL : 0)) & 0xFFFFFFFFFFFFFFE0]) {
    memmove(v6, v4, 32 * ((v14 - v4) / 32));
  }
  return 1;
}

char *sub_1E44E0E1C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5960);
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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

char *sub_1E44E0F18(uint64_t a1)
{
  return sub_1E44E0E1C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1E44E0F2C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    *char v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v27 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = 16 * v16;
    BOOL v21 = (uint64_t *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    uint64_t v24 = (uint64_t *)(*(void *)(a4 + 56) + v20);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    *int64_t v11 = v23;
    v11[1] = v22;
    void v11[2] = v25;
    v11[3] = v26;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 4;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v27;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1E44E1150(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1E44E1350(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_1E44E1550(void *a1)
{
  return sub_1E44DFAEC(0, a1[2], 0, a1);
}

void *sub_1E44E1564(void *a1)
{
  return sub_1E44DFC10(0, a1[2], 0, a1);
}

uint64_t sub_1E44E1578(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1E451B038();
  if (!result || (uint64_t result = sub_1E451B068(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1E451B058();
      sub_1E451B7E8();
      sub_1E4496ED0(&qword_1EBFF5818, MEMORY[0x1E4F25170]);
      return sub_1E451B7A8();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1E44E1658(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  int64_t v8 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      int64_t v8 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_19;
      }
      uint64_t v10 = *(void *)(v12 + 8 * v8);
      if (!v10) {
        break;
      }
    }
LABEL_18:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1E451B8B8();
    swift_bridgeObjectRelease();
    sub_1E451B8B8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1E451BEE8();
    v7 ^= result;
  }
  int64_t v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_1E451BEC8();
  }
  uint64_t v10 = *(void *)(v12 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1E44E1820(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a2 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a2 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  int64_t v9 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v15 >= v6) {
      goto LABEL_19;
    }
    unint64_t v16 = *(void *)(v18 + 8 * v15);
    ++v9;
    if (!v16)
    {
      int64_t v9 = v15 + 1;
      if (v15 + 1 >= v6) {
        goto LABEL_19;
      }
      unint64_t v16 = *(void *)(v18 + 8 * v9);
      if (!v16) {
        break;
      }
    }
LABEL_18:
    unint64_t v5 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = (uint64_t *)(*(void *)(a2 + 56) + 16 * v11);
    uint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    swift_bridgeObjectRetain();
    sub_1E44957E4(v13, v14);
    sub_1E451B8B8();
    swift_bridgeObjectRelease();
    sub_1E451B268();
    sub_1E4496E64(v13, v14);
    uint64_t result = sub_1E451BEE8();
    v8 ^= result;
  }
  int64_t v17 = v15 + 2;
  if (v17 >= v6)
  {
LABEL_19:
    swift_release();
    return sub_1E451BEC8();
  }
  unint64_t v16 = *(void *)(v18 + 8 * v17);
  if (v16)
  {
    int64_t v9 = v17;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v9 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v9 >= v6) {
      goto LABEL_19;
    }
    unint64_t v16 = *(void *)(v18 + 8 * v9);
    ++v17;
    if (v16) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1E44E19F0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1E451B918();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4E80170](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1E44E1A6C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1E451BC18();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1E44E1AF8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1E44AFB00((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1E44E1C00(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1E451B078();
  swift_allocObject();
  uint64_t result = sub_1E451B028();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1E451B218();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1E44E1C7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *sub_1E44E1CDC(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_1E44AFD64(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_1E44E1C00((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_1E44958FC((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_1E44E1D40(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1E451B078();
      swift_allocObject();
      sub_1E451B048();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1E451B218();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_1E44E1DE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_1E44E02B8((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1E44E1E64, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_1E44E1E4C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1E44E1E64@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1E44E1A6C(a1, a2);
}

uint64_t sub_1E44E1E84()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for UserGuideClientState.IndexState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UserGuideClientState.IndexState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1E44E1FE8);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1E44E2010(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E44E201C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideClientState.IndexState()
{
  return &type metadata for UserGuideClientState.IndexState;
}

uint64_t initializeBufferWithCopyOfBuffer for UserGuideClientState(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for UserGuideClientState()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for UserGuideClientState(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for UserGuideClientState(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserGuideClientState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserGuideClientState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserGuideClientState()
{
  return &type metadata for UserGuideClientState;
}

unint64_t sub_1E44E2194(uint64_t a1)
{
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = sub_1E44E21C4();
  unint64_t result = sub_1E44E2218();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1E44E21C4()
{
  unint64_t result = qword_1EBFF5458[0];
  if (!qword_1EBFF5458[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EBFF5458);
  }
  return result;
}

unint64_t sub_1E44E2218()
{
  unint64_t result = qword_1EBFF5B78;
  if (!qword_1EBFF5B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5B78);
  }
  return result;
}

unint64_t sub_1E44E2270()
{
  unint64_t result = qword_1EAE48458;
  if (!qword_1EAE48458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48458);
  }
  return result;
}

unint64_t sub_1E44E22C4()
{
  unint64_t result = qword_1EBFF5440;
  if (!qword_1EBFF5440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5440);
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

uint64_t sub_1E44E2360(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1E451BDE8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4764657865646E69 && a2 == 0xED00007365646975)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1E451BDE8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1E44E2478(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5920);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1E44E2998(MEMORY[0x1E4FBC860]);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1E44E22C4();
  sub_1E451BF08();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = sub_1E451BD58();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5828);
    v9[30] = 1;
    sub_1E44E2688(&qword_1EBFF5830);
    sub_1E451BD48();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_1E44E2688(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBFF5828);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for UserGuideClientState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UserGuideClientState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E44E2848);
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

unsigned char *sub_1E44E2870(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideClientState.CodingKeys()
{
  return &type metadata for UserGuideClientState.CodingKeys;
}

unint64_t sub_1E44E2890()
{
  unint64_t result = qword_1EAE48460;
  if (!qword_1EAE48460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48460);
  }
  return result;
}

unint64_t sub_1E44E28E8()
{
  unint64_t result = qword_1EBFF5450;
  if (!qword_1EBFF5450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5450);
  }
  return result;
}

unint64_t sub_1E44E2940()
{
  unint64_t result = qword_1EBFF5448;
  if (!qword_1EBFF5448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5448);
  }
  return result;
}

unint64_t sub_1E44E2998(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BC8);
  int v2 = (void *)sub_1E451BD18();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1E4496570(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    char v12 = (void *)(v2[7] + 16 * result);
    *char v12 = v8;
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

unint64_t sub_1E44E2ABC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48490);
  int v2 = (void *)sub_1E451BD18();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1E4496570(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_1E44E2BD8(uint64_t a1)
{
  return sub_1E44E2C28(a1, &qword_1EBFF5908, &qword_1EAE48488, (uint64_t (*)(uint64_t *, unint64_t))sub_1E4497328);
}

unint64_t sub_1E44E2C00(uint64_t a1)
{
  return sub_1E44E2C28(a1, &qword_1EBFF5900, &qword_1EBFF5BE0, (uint64_t (*)(uint64_t *, unint64_t))sub_1E4497328);
}

unint64_t sub_1E44E2C28(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t *, unint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    id v8 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_1E451BD18();
  id v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1E44E3AAC(v11, (uint64_t)&v20, a3);
    uint64_t v12 = v20;
    uint64_t v13 = v21;
    unint64_t result = sub_1E4496570(v20, v21);
    if (v15) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v16 = (uint64_t *)(v8[6] + 16 * result);
    *unint64_t v16 = v12;
    v16[1] = v13;
    unint64_t result = a4(&v22, v8[7] + 32 * result);
    uint64_t v17 = v8[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v8[2] = v19;
    v11 += 48;
    if (!--v9)
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

unint64_t sub_1E44E2D68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58F8);
  int v2 = (void *)sub_1E451BD18();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1E4496570(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

uint64_t sub_1E44E2E7C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E44E2ECC()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void __swiftcall TPSFullTipUsageEventManager.contextualInfo(for:)(TPSContextualInfo_optional *__return_ptr retstr, Swift::String a2)
{
}

uint64_t sub_1E44E2F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  sub_1E44AA75C();
  id v8 = (uint64_t *)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  uint64_t v9 = *v8;
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1E4496570(a2, a3);
    if (v11)
    {
      BOOL v12 = *(void **)(*(void *)(v9 + 56) + 8 * v10);
      id v13 = v12;
    }
    else
    {
      BOOL v12 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v12 = 0;
  }
  *a4 = v12;
  return swift_endAccess();
}

uint64_t sub_1E44E301C@<X0>(void *a1@<X8>)
{
  return sub_1E44E2F58(v1[2], v1[3], v1[4], a1);
}

uint64_t TPSFullTipUsageEventManager.contextualInfoMap()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5848);
  sub_1E451BAD8();
  return v1;
}

uint64_t sub_1E44E3160@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_1E44AA75C();
  unsigned int v4 = (void *)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E44E31CC@<X0>(void *a1@<X8>)
{
  return sub_1E44E3160(*(void *)(v1 + 16), a1);
}

Swift::Void __swiftcall TPSFullTipUsageEventManager.removeUsageEventCache()()
{
  uint64_t v1 = *(NSObject **)&v0[OBJC_IVAR___TPSFullTipUsageEventManager_queue];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_1E44E3630;
  *(void *)(v3 + 24) = v2;
  v7[4] = sub_1E44E3B28;
  v7[5] = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1E44AA274;
  v7[3] = &block_descriptor_13;
  unsigned int v4 = _Block_copy(v7);
  uint64_t v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
}

void sub_1E44E3410(uint64_t a1)
{
  uint64_t v2 = sub_1E451B608();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = (void *)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  void *v6 = MEMORY[0x1E4FBC868];
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_queue);
  *uint64_t v5 = v7;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCBF0], v2);
  id v8 = v7;
  LOBYTE(v7) = sub_1E451B618();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v7)
  {
    uint64_t v9 = self;
    sub_1E449AE1C(0, &qword_1EBFF58C0);
    swift_bridgeObjectRetain();
    unint64_t v10 = (void *)sub_1E451B7F8();
    swift_bridgeObjectRelease();
    char v11 = (void *)sub_1E451B858();
    objc_msgSend(v9, sel_archivedDataWithRootObject_forKey_, v10, v11);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E44E35F8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E44E3630()
{
  sub_1E44E3410(*(void *)(v0 + 16));
}

uint64_t sub_1E44E3638()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id TPSFullTipUsageEventManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id TPSFullTipUsageEventManager.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v1 = sub_1E451BAB8();
  MEMORY[0x1F4188790](v1);
  uint64_t v2 = sub_1E451B5F8();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = sub_1E451BAC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&ObjectType - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap;
  id v8 = v0;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)&v0[v7] = sub_1E44E2ABC(MEMORY[0x1E4FBC860]);
  uint64_t v10 = OBJC_IVAR___TPSFullTipUsageEventManager_queue;
  sub_1E449AE1C(0, &qword_1EBFF58B8);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC68], v3);
  sub_1E451B5E8();
  uint64_t v14 = v9;
  sub_1E44E392C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5880);
  sub_1E44E3984();
  sub_1E451BB88();
  *(void *)&v8[v10] = sub_1E451BAE8();
  v8[OBJC_IVAR___TPSFullTipUsageEventManager_initialized] = 0;

  v13.receiver = v8;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

unint64_t sub_1E44E392C()
{
  unint64_t result = qword_1EBFF58B0;
  if (!qword_1EBFF58B0)
  {
    sub_1E451BAB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF58B0);
  }
  return result;
}

unint64_t sub_1E44E3984()
{
  unint64_t result = qword_1EBFF5888;
  if (!qword_1EBFF5888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBFF5880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5888);
  }
  return result;
}

id TPSFullTipUsageEventManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TPSFullTipUsageEventManager()
{
  return self;
}

uint64_t sub_1E44E3AAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1E44E3B10@<X0>(void *a1@<X8>)
{
  return sub_1E44E31CC(a1);
}

uint64_t sub_1E44E3B34@<X0>(void *a1@<X8>)
{
  return sub_1E44E301C(a1);
}

uint64_t sub_1E44E3B4C()
{
  return 1;
}

uint64_t sub_1E44E3B54()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44E3B98()
{
  return sub_1E451BEC8();
}

uint64_t sub_1E44E3BC0()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44E3C10(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v21 = sub_1E451B128();
  uint64_t v6 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1E451B1D8();
  uint64_t v9 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  char v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  id v12 = a1;
  id v13 = objc_msgSend(v12, sel_identifier);
  uint64_t v14 = sub_1E451B868();
  uint64_t v16 = v15;

  uint64_t v23 = v14;
  uint64_t v24 = v16;
  uint64_t v17 = v21;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F276A8], v21);
  sub_1E4496F18();
  sub_1E451B1C8();

  uint64_t v18 = a2;
  uint64_t v19 = v22;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v18, v22);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v3 + OBJC_IVAR____TtC10TipsDaemon16ThumbnailFetcher_storageLocation, v11, v19);
  return v3;
}

uint64_t sub_1E44E3E40(uint64_t a1, uint64_t a2)
{
  void v3[6] = a2;
  v3[7] = v2;
  void v3[5] = a1;
  uint64_t v4 = sub_1E451B668();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  v3[12] = swift_task_alloc();
  uint64_t v5 = sub_1E451B1D8();
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44E3F94, 0, 0);
}

uint64_t sub_1E44E3F94()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[12];
  sub_1E44E5188(v0[6], v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[14];
  if (v4 == 1)
  {
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[10];
    uint64_t v9 = v0[7];
    uint64_t v10 = v0[6];
    uint64_t v31 = v0[8];
    uint64_t v33 = v0[5];
    sub_1E44DD780(v0[12], &qword_1EBFF52B0);
    sub_1E451B648();
    sub_1E451BC08();
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    sub_1E451B8C8();
    id v11 = objc_msgSend(*(id *)(v9 + 16), sel_identifier);
    sub_1E451B868();

    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    v0[4] = v10;
    type metadata accessor for TPSAssetsConfigurationUserInterfaceStyle(0);
    sub_1E451BCB8();
    sub_1E451B8C8();
    sub_1E451B738();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v31);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v33, 1, 1, v5);
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = (uint64_t (*)(void))v0[1];
    return v22();
  }
  id v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v12(v0[15], v0[12], v0[13]);
  id v13 = objc_msgSend(self, sel_defaultManager);
  sub_1E451B1B8();
  uint64_t v14 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  unsigned int v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  uint64_t v16 = v0[15];
  if (v15)
  {
    uint64_t v17 = v0[14];
    uint64_t v18 = v0[9];
    uint64_t v19 = v0[10];
    uint64_t v20 = v0[7];
    uint64_t v30 = v0[8];
    uint64_t v32 = v0[5];
    uint64_t v34 = v0[13];
    sub_1E451B648();
    sub_1E451BC08();
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(*(id *)(v20 + 16), sel_identifier);
    sub_1E451B868();

    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    sub_1E451B148();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B728();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v30);
    v12(v32, v16, v34);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v32, 0, 1, v34);
    goto LABEL_5;
  }
  uint64_t v25 = v0[6];
  uint64_t v24 = v0[7];
  uint64_t v26 = (void *)swift_task_alloc();
  v0[16] = v26;
  v26[2] = v24;
  v26[3] = v25;
  v26[4] = v16;
  uint64_t v27 = (void *)swift_task_alloc();
  v0[17] = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_1E44E444C;
  uint64_t v28 = v0[11];
  uint64_t v29 = v0[5];
  return MEMORY[0x1F4188160](v29, 0, 0, 0xD000000000000017, 0x80000001E4527560, sub_1E44E5690, v26, v28);
}

uint64_t sub_1E44E444C()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E44E4610;
  }
  else {
    uint64_t v2 = sub_1E44E457C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44E457C()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E44E4610()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

void sub_1E44E46AC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v43 = a4;
  id v47 = a3;
  uint64_t v40 = a1;
  uint64_t v45 = sub_1E451B1D8();
  uint64_t v41 = *(void *)(v45 - 8);
  MEMORY[0x1F4188790](v45);
  uint64_t v42 = v5;
  unint64_t v44 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5250);
  uint64_t v6 = *(void *)(v39 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v39);
  id v8 = objc_msgSend(*(id *)(a2 + 16), sel_fullContentAssets);
  id v9 = objc_msgSend(*(id *)(a2 + 16), sel_language);
  sub_1E451B868();

  uint64_t v10 = a2;
  id v11 = objc_msgSend(*(id *)(a2 + 16), sel_assetFileInfoManager);
  id v12 = objc_allocWithZone(MEMORY[0x1E4FAF3C0]);
  id v13 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, v8, v13, v47, v11);

  id v47 = objc_msgSend(v14, sel_cacheIdentifierForType_, 2);
  unsigned int v15 = self;
  id v38 = v14;
  id v46 = objc_msgSend(v15, sel_assetPathFromAssetConfiguration_type_, v14, 2);
  sub_1E44E569C();
  id v37 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (v37)
  {
    int v16 = *MEMORY[0x1E4F28A00];
    uint64_t v17 = swift_allocObject();
    uint64_t v36 = v10;
    swift_weakInit();
    uint64_t v18 = v6;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v20 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v21 = v39;
    v19(v20, v40, v39);
    uint64_t v22 = v41;
    uint64_t v23 = v44;
    uint64_t v24 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v44, v43, v45);
    unint64_t v25 = (*(unsigned __int8 *)(v18 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    unint64_t v26 = (v7 + *(unsigned __int8 *)(v22 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v27 + v25, v20, v21);
    (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v27 + v26, v23, v24);
    aBlock[4] = sub_1E44E5870;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E45042E0;
    aBlock[3] = &block_descriptor_5;
    uint64_t v28 = _Block_copy(aBlock);
    swift_release();
    id v29 = v37;
    id v31 = v46;
    id v30 = v47;
    LODWORD(v32) = v16;
    id v33 = objc_msgSend(v37, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v46, v47, 0, v28, v32);

    _Block_release(v28);
    uint64_t v34 = *(void **)(v36 + 24);
    *(void *)(v36 + 24) = v33;
  }
  else
  {

    __break(1u);
  }
}

uint64_t sub_1E44E4B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v45 = a11;
  uint64_t v13 = sub_1E451B668();
  uint64_t v43 = *(void *)(v13 - 8);
  uint64_t v44 = v13;
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  int v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v41 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  uint64_t v22 = (char *)&v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v41 - v23;
  uint64_t v25 = sub_1E451B1D8();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v28 = (char *)&v41 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v30 = Strong;
    sub_1E44E59F0(a3, (uint64_t)&v46);
    if (v48)
    {
      int v31 = swift_dynamicCast();
      uint64_t v42 = *(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56);
      v42(v24, v31 ^ 1u, 1, v25);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v25);
        sub_1E44E5E5C();
        sub_1E451B648();
        unint64_t v46 = 0;
        unint64_t v47 = 0xE000000000000000;
        sub_1E451BC08();
        swift_bridgeObjectRelease();
        unint64_t v46 = 0xD000000000000012;
        unint64_t v47 = 0x80000001E4527610;
        sub_1E451B148();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B8C8();
        id v39 = objc_msgSend(*(id *)(v30 + 16), sel_identifier);
        sub_1E451B868();
        uint64_t v41 = a12;

        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B728();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v43 + 8))(v18, v44);
        (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v22, v41, v25);
        v42(v22, 0, 1, v25);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5250);
        sub_1E451B9C8();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v28, v25);
      }
    }
    else
    {
      sub_1E44DD780((uint64_t)&v46, &qword_1EBFF5990);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v24, 1, 1, v25);
    }
    swift_release();
    sub_1E44DD780((uint64_t)v24, &qword_1EBFF52B0);
  }
  sub_1E451B648();
  unint64_t v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  unint64_t v49 = 0xD00000000000001DLL;
  unint64_t v50 = 0x80000001E45275F0;
  swift_beginAccess();
  uint64_t v32 = swift_weakLoadStrong();
  if (v32)
  {
    id v33 = *(id *)(v32 + 16);
    swift_release();
    id v34 = objc_msgSend(v33, sel_identifier);

    sub_1E451B868();
  }
  uint64_t v35 = v44;
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  if (a9)
  {
    swift_getErrorValue();
    sub_1E451BE68();
  }
  uint64_t v36 = v43;
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v35);
  if (a9)
  {
    uint64_t v37 = (uint64_t)a9;
  }
  else
  {
    sub_1E44E599C();
    uint64_t v37 = swift_allocError();
  }
  unint64_t v49 = v37;
  id v38 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5250);
  return sub_1E451B9B8();
}

uint64_t sub_1E44E5188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v25 = sub_1E451B128();
  uint64_t v3 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E451B1D8();
  uint64_t v28 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(*(id *)(v2 + 16), sel_fullContentAssets);
  id v10 = objc_msgSend(*(id *)(v2 + 16), sel_language);
  sub_1E451B868();

  id v11 = objc_msgSend(*(id *)(v2 + 16), sel_assetFileInfoManager);
  id v12 = objc_allocWithZone(MEMORY[0x1E4FAF3C0]);
  uint64_t v13 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, v9, v13, v26, v11);

  id v15 = objc_msgSend(v14, sel_cacheIdentifierForType_, 2);
  if (v15)
  {
    int v16 = v15;
    uint64_t v17 = sub_1E451B868();
    uint64_t v19 = v18;

    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v8, v2 + OBJC_IVAR____TtC10TipsDaemon16ThumbnailFetcher_storageLocation, v6);
    uint64_t v29 = v17;
    uint64_t v30 = v19;
    uint64_t v20 = v25;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F276B8], v25);
    sub_1E4496F18();
    uint64_t v21 = v27;
    sub_1E451B1C8();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v6);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v21, 0, 1, v6);
  }
  else
  {

    uint64_t v23 = v27;
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56);
    return v24(v23, 1, 1, v6);
  }
}

uint64_t sub_1E44E54E4()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC10TipsDaemon16ThumbnailFetcher_storageLocation;
  uint64_t v2 = sub_1E451B1D8();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x1F4186488](v0, v3, v4);
}

uint64_t sub_1E44E5594()
{
  return type metadata accessor for ThumbnailFetcher();
}

uint64_t type metadata accessor for ThumbnailFetcher()
{
  uint64_t result = qword_1EBFF51A0;
  if (!qword_1EBFF51A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1E44E55E8()
{
  uint64_t result = sub_1E451B1D8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1E44E5690(uint64_t a1)
{
  sub_1E44E46AC(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_1E44E569C()
{
  unint64_t result = qword_1EBFF5260;
  if (!qword_1EBFF5260)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBFF5260);
  }
  return result;
}

uint64_t sub_1E44E56DC()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E44E5714()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5250);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_1E451B1D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x1F4186498](v0, v10, v11);
}

uint64_t sub_1E44E5870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5250) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = *(void *)(v16 + 64);
  uint64_t v19 = *(void *)(sub_1E451B1D8() - 8);
  return sub_1E44E4B20(a1, a2, a3, a4, a5, a6, a7, a8, a9, *(void *)(v9 + 16), v9 + v17, v9 + ((v17 + v18 + *(unsigned __int8 *)(v19 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80)));
}

unint64_t sub_1E44E599C()
{
  unint64_t result = qword_1EAE484A0;
  if (!qword_1EAE484A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE484A0);
  }
  return result;
}

uint64_t sub_1E44E59F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E44E5A58(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  v29[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1E451B128();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1E451B1D8();
  uint64_t v7 = *(void *)(v27 - 8);
  uint64_t result = MEMORY[0x1F4188790](v27);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11)
  {
    id v25 = self;
    unsigned int v24 = *MEMORY[0x1E4F276B8];
    uint64_t v23 = *(void (**)(char *, void, uint64_t))(v4 + 104);
    uint64_t v26 = v4 + 104;
    id v12 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v13 = (void (**)(char *, uint64_t))(v7 + 8);
    swift_bridgeObjectRetain();
    v22[1] = a1;
    id v14 = (void **)(a1 + 40);
    do
    {
      uint64_t v16 = *v14;
      v29[0] = *(v14 - 1);
      v29[1] = v16;
      v23(v6, v24, v3);
      sub_1E4496F18();
      swift_bridgeObjectRetain();
      sub_1E451B1C8();
      (*v12)(v6, v3);
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v25, sel_defaultManager);
      uint64_t v18 = (void *)sub_1E451B168();
      v29[0] = 0;
      unsigned int v19 = objc_msgSend(v17, sel_removeItemAtURL_error_, v18, v29);

      if (v19)
      {
        id v15 = v29[0];
      }
      else
      {
        id v20 = v29[0];
        uint64_t v21 = (void *)sub_1E451B0D8();

        swift_willThrow();
      }
      v14 += 2;
      (*v13)(v10, v27);
      --v11;
    }
    while (v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1E44E5D3C()
{
  v7[1] = *(id *)MEMORY[0x1E4F143B8];
  id v0 = objc_msgSend(self, sel_defaultManager);
  uint64_t v1 = (void *)sub_1E451B168();
  v7[0] = 0;
  unsigned int v2 = objc_msgSend(v0, sel_removeItemAtURL_error_, v1, v7);

  id v3 = v7[0];
  if (v2)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = v7[0];
    uint64_t v6 = (void *)sub_1E451B0D8();

    swift_willThrow();
  }
}

void sub_1E44E5E5C()
{
  v22[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  MEMORY[0x1F4188790](v1 - 8);
  id v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E451B1D8();
  uint64_t v21 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_defaultManager);
  sub_1E451B1B8();
  uint64_t v8 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  unsigned __int8 v9 = objc_msgSend(v7, sel_fileExistsAtPath_, v8);

  if (v9)
  {
    sub_1E451BAA8();
    if (!v0) {
      sub_1E44DD780((uint64_t)v3, &qword_1EBFF52B0);
    }
    goto LABEL_7;
  }
  sub_1E451B198();
  uint64_t v10 = (void *)sub_1E451B168();
  v22[0] = 0;
  unsigned int v11 = objc_msgSend(v7, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v10, 1, 0, v22);

  id v12 = v22[0];
  if (v11)
  {
    id v13 = v22[0];
    id v14 = (void *)sub_1E451B168();
    id v15 = (void *)sub_1E451B168();
    v22[0] = 0;
    unsigned int v16 = objc_msgSend(v7, sel_copyItemAtURL_toURL_error_, v14, v15, v22);

    id v12 = v22[0];
    if (v16)
    {
      id v17 = *(void (**)(char *, uint64_t))(v21 + 8);
      id v18 = v22[0];
      v17(v6, v4);
LABEL_7:

      return;
    }
  }
  id v19 = v12;
  sub_1E451B0D8();

  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
}

uint64_t getEnumTagSinglePayload for ThumbnailFetcher.AssetLoadError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ThumbnailFetcher.AssetLoadError(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1E44E6230);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E44E6258()
{
  return 0;
}

ValueMetadata *type metadata accessor for ThumbnailFetcher.AssetLoadError()
{
  return &type metadata for ThumbnailFetcher.AssetLoadError;
}

unint64_t sub_1E44E6274()
{
  unint64_t result = qword_1EAE484A8;
  if (!qword_1EAE484A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EAE484A8);
  }
  return result;
}

id GenerativeModelsAvailabilityValidation.__allocating_init(targetContext:)()
{
  id v1 = objc_allocWithZone(v0);
  int v2 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithTargetContext_, v2);

  return v3;
}

id GenerativeModelsAvailabilityValidation.init(targetContext:)()
{
  id v1 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  id v2 = objc_msgSendSuper2(&v4, sel_initWithTargetContext_, v1);

  return v2;
}

uint64_t type metadata accessor for GenerativeModelsAvailabilityValidation()
{
  return self;
}

id GenerativeModelsAvailabilityValidation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GenerativeModelsAvailabilityValidation.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GenerativeModelsAvailabilityValidation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E44E65EC(void *a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_1E451B668();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = &v27[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1E451B3E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  id v12 = &v27[-v11];
  uint64_t v13 = sub_1E451B408();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  unsigned int v16 = &v27[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_1E451B438();
  uint64_t v30 = *(void *)(v17 - 8);
  uint64_t v31 = v17;
  MEMORY[0x1F4188790](v17);
  id v19 = &v27[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1E451B3F8();
  sub_1E451B428();
  (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v13);
  sub_1E451B418();
  (*(void (**)(unsigned char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E4F63D38], v6);
  int v28 = sub_1E451B3D8();
  uint64_t v29 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v29(v10, v6);
  unsigned __int8 v20 = objc_msgSend(a1, sel_BOOLValue);
  sub_1E451B658();
  uint64_t v35 = 0;
  unint64_t v36 = 0xE000000000000000;
  sub_1E451BC08();
  id v21 = objc_msgSend(a1, sel_name);
  if (v21)
  {
    uint64_t v22 = v21;
    sub_1E451B868();
  }
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  id v23 = objc_msgSend(a1, sel_targetContext);
  if (v23)
  {
    unsigned int v24 = v23;
    sub_1E451B818();
  }
  else
  {
    sub_1E44E2BD8(MEMORY[0x1E4FBC860]);
  }
  char v25 = v28 ^ v20;
  sub_1E451B828();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B708();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v5, v33);
  (*(void (**)(uint64_t, BOOL, void))(v34 + 16))(v34, (v25 & 1) == 0, 0);
  v29(v12, v6);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v30 + 8))(v19, v31);
}

uint64_t sub_1E44E6AE8(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v14 = MEMORY[0x1E4FBC860];
  if (a3 >> 62) {
    goto LABEL_17;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_1E451BCD8())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1E4E804B0](i - 4, a3) : *(id *)(a3 + 8 * i);
      uint64_t v8 = v7;
      uint64_t v9 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v13 = v7;
      a1(&v12, &v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }

      if (v12)
      {
        MEMORY[0x1E4E801A0]();
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1E451B978();
        }
        sub_1E451B998();
        sub_1E451B968();
      }
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1E44E6C88(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x656C61636F6CLL;
    }
    else {
      uint64_t v3 = 0x727474416373696DLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE600000000000000;
    }
    else {
      unint64_t v4 = 0xEE00736574756269;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x656C61636F6CLL;
      }
      else {
        uint64_t v6 = 0x727474416373696DLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE600000000000000;
      }
      else {
        unint64_t v7 = 0xEE00736574756269;
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
    uint64_t v3 = 0x64496B6F6F62;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x64496B6F6F62)
  {
LABEL_21:
    char v8 = sub_1E451BDE8();
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

uint64_t sub_1E44E6DAC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000013;
  }
  else {
    unint64_t v3 = 0x6449646C697562;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0x80000001E4527220;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000013;
  }
  else {
    unint64_t v5 = 0x6449646C697562;
  }
  if (a2) {
    unint64_t v6 = 0x80000001E4527220;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1E451BDE8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1E44E6E58(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6873616863;
  }
  else {
    uint64_t v3 = 118;
  }
  if (v2) {
    unint64_t v4 = 0xE100000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6873616863;
  }
  else {
    uint64_t v5 = 118;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE100000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1E451BDE8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1E44E6EF0()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    BOOL v2 = sub_1E44E740C;
  }
  else
  {
    BOOL v2 = sub_1E44E700C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44E700C()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = *(void *)(v1 + 24);
  if (!v2)
  {
    uint64_t v16 = v0[15];
    uint64_t v17 = v0[12];
    uint64_t v18 = v0[13];
    uint64_t v20 = v0[6];
    uint64_t v19 = v0[7];
    uint64_t v21 = v0[5];
    swift_bridgeObjectRelease();
    sub_1E451B648();
    sub_1E451B738();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_1E44ED71C();
    swift_allocError();
    *(void *)uint64_t v22 = 0;
    *(void *)(v22 + _Block_object_dispose(&STACK[0x240], 8) = 0;
    *(unsigned char *)(v22 + 16) = 4;
    swift_willThrow();
    sub_1E44ED7F8(v1, type metadata accessor for UserGuideIndexHelper.UserGuideAttributes);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    goto LABEL_5;
  }
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[18];
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[10];
  sub_1E44E3AAC(v1 + *(int *)(v0[8] + 28), v6, &qword_1EBFF52B0);
  if (v4(v6, 1, v5) == 1)
  {
    uint64_t v7 = v0[15];
    uint64_t v8 = v0[12];
    uint64_t v9 = v0[13];
    uint64_t v11 = v0[9];
    uint64_t v10 = v0[10];
    uint64_t v13 = v0[6];
    uint64_t v12 = v0[7];
    uint64_t v14 = v0[5];
    swift_bridgeObjectRelease();
    sub_1E44DD780(v10, &qword_1EBFF52B0);
    sub_1E451B648();
    sub_1E451B738();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    sub_1E44ED71C();
    swift_allocError();
    *(_OWORD *)uint64_t v15 = xmmword_1E4520570;
    *(unsigned char *)(v15 + 16) = 4;
    swift_willThrow();
    sub_1E44ED7F8(v11, type metadata accessor for UserGuideIndexHelper.UserGuideAttributes);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v23 = (uint64_t (*)(void))v0[1];
    goto LABEL_7;
  }
  uint64_t v43 = (void (*)(uint64_t))v0[20];
  uint64_t v45 = v0[16];
  uint64_t v46 = v0[17];
  uint64_t v42 = v0[15];
  uint64_t v47 = v3;
  uint64_t v24 = v0[13];
  uint64_t v25 = v0[14];
  uint64_t v26 = v0[12];
  uint64_t v27 = (uint64_t *)v0[9];
  int v28 = (void *)v0[2];
  v43(v25);
  uint64_t v29 = v27[1];
  uint64_t v44 = *v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1E451B768();
  uint64_t v40 = v31;
  uint64_t v41 = v30;
  uint64_t v32 = v27[5];
  uint64_t v39 = v27[4];
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_1E451B788();
  uint64_t v37 = v34;
  uint64_t v38 = v33;
  sub_1E44ED7F8((uint64_t)v27, type metadata accessor for UserGuideIndexHelper.UserGuideAttributes);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v42, v26);
  uint64_t v35 = type metadata accessor for UserGuideIndexItem(0);
  ((void (*)(char *, uint64_t, uint64_t))v43)((char *)v28 + *(int *)(v35 + 40), v25, v26);
  *int v28 = v45;
  v28[1] = v46;
  v28[2] = v44;
  v28[3] = v29;
  v28[4] = v47;
  v28[5] = v2;
  v28[6] = v41;
  v28[7] = v40;
  v28[8] = v39;
  v28[9] = v32;
  v28[10] = v38;
  v28[11] = v37;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v23 = (uint64_t (*)(void))v0[1];
LABEL_7:
  return v23();
}

uint64_t sub_1E44E740C()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[15], v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E44E74CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[17] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E44E7638, 0, 0);
  }
}

uint64_t sub_1E44E7638()
{
  unint64_t v1 = *(void *)(v0 + 128);
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  uint64_t v2 = 0;
  switch(v1 >> 62)
  {
    case 1uLL:
      int v3 = *(_DWORD *)(v0 + 120);
      int v4 = *(_DWORD *)(v0 + 124);
      BOOL v5 = __OFSUB__(v4, v3);
      LODWORD(v2) = v4 - v3;
      if (v5)
      {
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x1E44E798CLL);
      }
      uint64_t v2 = (int)v2;
LABEL_6:
      uint64_t v29 = *(void *)(v0 + 136);
      uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 96);
      uint64_t v9 = *(void *)(v0 + 80);
      uint64_t v10 = *(void *)(v0 + 64);
      *(void *)(v0 + 16) = v2;
      sub_1E451BDC8();
      sub_1E451B8C8();
      swift_bridgeObjectRelease();
      sub_1E451B728();
      swift_bridgeObjectRelease();
      v8(v9, v10);
      sub_1E451AFD8();
      swift_allocObject();
      sub_1E451AFC8();
      sub_1E44ED770((unint64_t *)&unk_1EBFF50D0, (void (*)(uint64_t))type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse);
      sub_1E451AFB8();
      uint64_t v12 = *(void *)(v0 + 120);
      unint64_t v11 = *(void *)(v0 + 128);
      if (v29)
      {
        swift_release();
        sub_1E4496E64(v12, v11);
      }
      else
      {
        uint64_t v14 = *(uint64_t **)(v0 + 56);
        uint64_t v15 = *(void *)(v0 + 40);
        uint64_t v16 = *(void **)(v0 + 24);
        uint64_t v17 = v14[1];
        uint64_t v28 = *v14;
        uint64_t v18 = (uint64_t *)((char *)v14
                        + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24));
        uint64_t v19 = v18[1];
        uint64_t v27 = *v18;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_1E44E94D0();
        uint64_t v25 = v21;
        uint64_t v26 = v20;
        swift_release();
        sub_1E4496E64(v12, v11);
        uint64_t v22 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
        sub_1E44E3AAC((uint64_t)v18 + *(int *)(v22 + 20), v15, &qword_1EBFF52B0);
        sub_1E44ED7F8((uint64_t)v14, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse);
        *uint64_t v16 = v28;
        v16[1] = v17;
        v16[2] = v27;
        void v16[3] = v19;
        v16[4] = v26;
        v16[5] = v25;
        uint64_t v23 = type metadata accessor for UserGuideIndexHelper.UserGuideAttributes(0);
        sub_1E44ED858(v15, (uint64_t)v16 + *(int *)(v23 + 28), &qword_1EBFF52B0);
      }
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
      return v13();
    case 2uLL:
      uint64_t v6 = *(void *)(*(void *)(v0 + 120) + 16);
      uint64_t v7 = *(void *)(*(void *)(v0 + 120) + 24);
      BOOL v5 = __OFSUB__(v7, v6);
      uint64_t v2 = v7 - v6;
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v2 = *(unsigned __int8 *)(v0 + 134);
      goto LABEL_6;
  }
}

uint64_t sub_1E44E799C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_1E451B668();
  void v3[5] = v4;
  void v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  uint64_t v5 = sub_1E451B1D8();
  v3[8] = v5;
  v3[9] = *(void *)(v5 - 8);
  v3[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44E7ABC, 0, 0);
}

uint64_t sub_1E44E7ABC()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v10 = v0[6];
  uint64_t v11 = v0[5];
  uint64_t v5 = v0[3];
  uint64_t v6 = type metadata accessor for UserGuideIndexItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v5 + *(int *)(v6 + 40), v4);
  swift_bridgeObjectRetain();
  sub_1E451B648();
  sub_1E451BC08();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E44ED770(&qword_1EBFF5B60, MEMORY[0x1E4F276F0]);
  sub_1E451BDC8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v3, v11);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[11] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1E44E7D74;
  uint64_t v8 = v0[3];
  return sub_1E44E805C(v8);
}

uint64_t sub_1E44E7D74(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_1E44E7FD4;
  }
  else
  {
    *(void *)(v4 + 104) = a1;
    uint64_t v5 = sub_1E44E7E9C;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1E44E7E9C()
{
  unint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = (int8x16_t *)swift_task_alloc();
  int8x16_t v10 = *(int8x16_t *)(v0 + 24);
  v6[1] = vextq_s8(v10, v10, 8uLL);
  uint64_t v7 = sub_1E44E6AE8((void (*)(uint64_t *__return_ptr, id *))sub_1E44EA60C, (uint64_t)v6, v1);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_1E44F0D44(v10.i64[0], v5, type metadata accessor for UserGuideIndexItem);
  *(void *)(v5 + *(int *)(type metadata accessor for UserGuideIndexRequest(0) + 20)) = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_1E44E7FD4()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E44E805C(uint64_t a1)
{
  v2[45] = a1;
  v2[46] = v1;
  uint64_t v3 = sub_1E451B398();
  v2[47] = v3;
  v2[48] = *(void *)(v3 - 8);
  v2[49] = swift_task_alloc();
  uint64_t v4 = sub_1E451B388();
  v2[50] = v4;
  v2[51] = *(void *)(v4 - 8);
  v2[52] = swift_task_alloc();
  uint64_t v5 = sub_1E451B668();
  v2[53] = v5;
  v2[54] = *(void *)(v5 - 8);
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v2[57] = swift_task_alloc();
  uint64_t v6 = sub_1E451B1D8();
  v2[58] = v6;
  v2[59] = *(void *)(v6 - 8);
  v2[60] = swift_task_alloc();
  v2[61] = swift_task_alloc();
  v2[62] = swift_task_alloc();
  v2[63] = swift_task_alloc();
  v2[64] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44E82AC, 0, 0);
}

uint64_t sub_1E44E82AC()
{
  uint64_t v1 = *(void *)(v0 + 512);
  uint64_t v2 = *(void *)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 472);
  uint64_t v4 = *(void *)(v0 + 456);
  uint64_t v5 = *(void *)(v0 + 424);
  uint64_t v6 = *(void *)(v0 + 432);
  uint64_t v7 = *(void *)(v0 + 360);
  uint64_t v8 = v7 + *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 520) = v9;
  *(void *)(v0 + 52_Block_object_dispose(&STACK[0x240], 8) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v1, v8, v2);
  uint64_t v10 = *(void *)(v7 + 16);
  uint64_t v11 = *(void *)(v7 + 24);
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  sub_1E451B138();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v0 + 536) = v12;
  *(void *)(v0 + 544) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v4, v5);
  uint64_t v13 = swift_task_alloc();
  *(void *)(v0 + 552) = v13;
  *(void *)uint64_t v13 = v0;
  *(void *)(v13 + _Block_object_dispose(&STACK[0x240], 8) = sub_1E44E8498;
  long long v14 = *(_OWORD *)(v0 + 504);
  *(unsigned char *)(v13 + 80) = 1;
  *(void *)(v13 + 40) = v10;
  *(void *)(v13 + 4_Block_object_dispose(&STACK[0x240], 8) = v11;
  *(_OWORD *)(v13 + 24) = v14;
  return MEMORY[0x1F4188298](sub_1E44E97AC, 0, 0);
}

uint64_t sub_1E44E8498()
{
  *(void *)(*(void *)v1 + 560) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E44E93A0;
  }
  else {
    uint64_t v2 = sub_1E44E85D8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44E85D8()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
  uint64_t v2 = *(void *)(v0 + 456);
  uint64_t v3 = *(void *)(v0 + 424);
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  sub_1E451B138();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  sub_1E451B188();
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_defaultManager);
  sub_1E451B1B8();
  uint64_t v6 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  unsigned __int8 v7 = objc_msgSend(v5, sel_fileExistsAtPath_, v6);

  if (v7)
  {
    id v8 = objc_msgSend(v4, sel_defaultManager);
    uint64_t v9 = (void *)sub_1E451B168();
    *(void *)(v0 + 352) = 0;
    unsigned int v10 = objc_msgSend(v8, sel_removeItemAtURL_error_, v9, v0 + 352);

    uint64_t v11 = *(void **)(v0 + 352);
    if (v10)
    {
      uint64_t v12 = *(void *)(v0 + 560);
      id v13 = v11;
    }
    else
    {
      id v14 = v11;
      uint64_t v15 = (void *)sub_1E451B0D8();

      swift_willThrow();
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 560);
  }
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
  uint64_t v17 = *(void *)(v0 + 504);
  uint64_t v18 = *(void *)(v0 + 488);
  uint64_t v19 = *(void *)(v0 + 464);
  id v20 = objc_msgSend(v4, sel_defaultManager);
  sub_1E451B1B8();
  uint64_t v21 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_createFileAtPath_contents_attributes_, v21, 0, 0);

  sub_1E449AE1C(0, &qword_1EBFF5BA8);
  v16(v18, v17, v19);
  id v22 = sub_1E44E9CF8(v18, (SEL *)&selRef_fileHandleForReadingFromURL_error_);
  if (v12)
  {
    uint64_t v23 = *(void *)(v0 + 504);
    uint64_t v24 = *(void *)(v0 + 512);
    uint64_t v25 = *(void *)(v0 + 496);
    uint64_t v26 = *(void *)(v0 + 464);
    uint64_t v27 = *(void *)(v0 + 472);
    sub_1E44E9AC4();
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v28(v25, v26);
    v28(v23, v26);
    v28(v24, v26);
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
  else
  {
    uint64_t v29 = v22;
    uint64_t v30 = *(void *)(v0 + 480);
    (*(void (**)(uint64_t, void, void))(v0 + 520))(v30, *(void *)(v0 + 496), *(void *)(v0 + 464));
    id v33 = sub_1E44E9CF8(v30, (SEL *)&selRef_fileHandleForWritingToURL_error_);
    uint64_t v34 = *(void *)(v0 + 416);
    uint64_t v35 = *(void *)(v0 + 392);
    uint64_t v37 = *(void *)(v0 + 376);
    uint64_t v36 = *(void *)(v0 + 384);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 408) + 104))(v34, *MEMORY[0x1E4FBAC88], *(void *)(v0 + 400));
    (*(void (**)(uint64_t, void, uint64_t))(v36 + 104))(v35, *MEMORY[0x1E4FBAC90], v37);
    sub_1E44F1E88(v34, v29, v33, v35);
    uint64_t v38 = *(void *)(v0 + 408);
    uint64_t v39 = *(void *)(v0 + 416);
    uint64_t v40 = *(void *)(v0 + 400);
    (*(void (**)(void, void))(*(void *)(v0 + 384) + 8))(*(void *)(v0 + 392), *(void *)(v0 + 376));
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v40);
    uint64_t v41 = sub_1E451B1F8();
    unint64_t v43 = v42;
    uint64_t v86 = (_OWORD *)(v0 + 136);
    uint64_t v87 = v0 + 96;
    unint64_t v88 = v0 + 312;
    uint64_t v85 = (_OWORD *)(v0 + 168);
    sub_1E451B648();
    sub_1E451BC08();
    swift_bridgeObjectRelease();
    uint64_t v44 = 0;
    uint64_t v91 = v33;
    switch(v43 >> 62)
    {
      case 1uLL:
        LODWORD(v44) = HIDWORD(v41) - v41;
        if (!__OFSUB__(HIDWORD(v41), v41))
        {
          uint64_t v44 = (int)v44;
          goto LABEL_17;
        }
        __break(1u);
        goto LABEL_37;
      case 2uLL:
        uint64_t v46 = *(void *)(v41 + 16);
        uint64_t v45 = *(void *)(v41 + 24);
        BOOL v47 = __OFSUB__(v45, v46);
        uint64_t v44 = v45 - v46;
        if (!v47) {
          goto LABEL_17;
        }
LABEL_37:
        __break(1u);
        goto LABEL_38;
      case 3uLL:
        goto LABEL_17;
      default:
        uint64_t v44 = BYTE6(v43);
LABEL_17:
        unint64_t v90 = v43;
        unint64_t v43 = v41;
        uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
        uint64_t v49 = *(void *)(v0 + 448);
        uint64_t v50 = *(void *)(v0 + 424);
        *(void *)(v0 + 32_Block_object_dispose(&STACK[0x240], 8) = v44;
        sub_1E451BDC8();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B728();
        swift_bridgeObjectRelease();
        v48(v49, v50);
        sub_1E44ECD5C();
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1E4520580;
        *(void *)(inited + 32) = sub_1E449AE1C(0, &qword_1EBFF58A0);
        *(void *)(inited + 40) = sub_1E449AE1C(0, &qword_1EBFF5BB8);
        *(void *)(inited + 4_Block_object_dispose(&STACK[0x240], 8) = sub_1E449AE1C(0, &qword_1EBFF58E0);
        *(void *)(inited + 56) = sub_1E449AE1C(0, &qword_1EBFF5BB0);
        *(void *)(inited + 64) = sub_1E449AE1C(0, &qword_1EBFF5BC0);
        *(void *)(inited + 72) = sub_1E449AE1C(0, (unint64_t *)&qword_1EBFF5258);
        sub_1E44DCA3C(inited);
        swift_setDeallocating();
        id v52 = objc_allocWithZone(MEMORY[0x1E4F1CAD0]);
        unint64_t v53 = (void *)sub_1E451B938();
        swift_bridgeObjectRelease();
        id v54 = objc_msgSend(v52, sel_initWithArray_, v53);

        sub_1E451BA58();
        uint64_t v55 = self;
        uint64_t v56 = (void *)sub_1E451BA48();
        swift_bridgeObjectRelease();
        uint64_t v57 = (void *)sub_1E451B248();
        *(void *)(v0 + 320) = 0;
        id v58 = objc_msgSend(v55, sel_unarchivedObjectOfClasses_fromData_error_, v56, v57, v0 + 320);

        BOOL v59 = *(void **)(v0 + 320);
        if (!v58)
        {
          uint64_t v66 = *(void *)(v0 + 504);
          uint64_t v89 = *(void *)(v0 + 512);
          uint64_t v67 = v41;
          uint64_t v68 = *(void *)(v0 + 496);
          uint64_t v70 = *(void *)(v0 + 464);
          uint64_t v69 = *(void *)(v0 + 472);
          id v71 = v59;
          sub_1E451B0D8();

          swift_willThrow();
          sub_1E4496E64(v67, v90);

          sub_1E44E9AC4();
          uint64_t v72 = *(void (**)(uint64_t, uint64_t))(v69 + 8);
          v72(v68, v70);
          v72(v66, v70);
          v72(v89, v70);
          goto LABEL_9;
        }
        id v60 = v59;
        sub_1E451BB78();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5240);
        if (!swift_dynamicCast()) {
          goto LABEL_32;
        }
        uint64_t v61 = *(void *)(v0 + 312);
        *(void *)(v0 + 28_Block_object_dispose(&STACK[0x240], 8) = 0xD000000000000012;
        *(void *)(v0 + 296) = 0x80000001E45277D0;
        sub_1E451BBC8();
        if (*(void *)(v61 + 16))
        {
          unint64_t v62 = sub_1E4510B9C(v87);
          uint64_t v63 = (_OWORD *)(v0 + 232);
          uint64_t v64 = v0 + 168;
          if (v65)
          {
            sub_1E44ED660(*(void *)(v61 + 56) + 32 * v62, (uint64_t)v85);
          }
          else
          {
            *uint64_t v85 = 0u;
            *(_OWORD *)(v0 + 184) = 0u;
          }
        }
        else
        {
          uint64_t v64 = v0 + 168;
          *uint64_t v85 = 0u;
          *(_OWORD *)(v0 + 184) = 0u;
          uint64_t v63 = (_OWORD *)(v0 + 232);
        }
        sub_1E44ED858(v64, (uint64_t)v86, &qword_1EBFF5990);
        if (*(void *)(v0 + 160))
        {
          sub_1E4497328(v86, v63);
        }
        else
        {
          *(void *)(v0 + 256) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5B98);
          *(void *)(v0 + 232) = MEMORY[0x1E4FBC860];
          sub_1E44DD780((uint64_t)v86, &qword_1EBFF5990);
        }
        swift_bridgeObjectRelease();
        sub_1E44ED60C(v87);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5B98);
        if (swift_dynamicCast())
        {
          unint64_t v73 = *(void *)(v0 + 336);
          sub_1E451B648();
          sub_1E451BC08();
          swift_bridgeObjectRelease();
          unint64_t v88 = v73;
          if (v73 >> 62)
          {
LABEL_38:
            swift_bridgeObjectRetain();
            uint64_t v74 = sub_1E451BCD8();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v74 = *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
          uint64_t v76 = *(void *)(v0 + 440);
          uint64_t v77 = *(void *)(v0 + 424);
          *(void *)(v0 + 344) = v74;
          sub_1E451BDC8();
          sub_1E451B8C8();
          swift_bridgeObjectRelease();
          sub_1E451B728();
          sub_1E4496E64(v43, v90);
          swift_bridgeObjectRelease();

          v75(v76, v77);
        }
        else
        {
LABEL_32:
          sub_1E4496E64(v41, v90);

          unint64_t v88 = MEMORY[0x1E4FBC860];
        }
        uint64_t v79 = *(void *)(v0 + 504);
        uint64_t v78 = *(void *)(v0 + 512);
        uint64_t v80 = *(void *)(v0 + 496);
        uint64_t v81 = *(void *)(v0 + 472);
        uint64_t v82 = *(void *)(v0 + 464);
        sub_1E44E9AC4();
        uint64_t v83 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
        v83(v80, v82);
        v83(v79, v82);
        v83(v78, v82);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v84 = *(uint64_t (**)(unint64_t))(v0 + 8);
        uint64_t result = v84(v88);
        break;
    }
  }
  return result;
}

uint64_t sub_1E44E93A0()
{
  (*(void (**)(void, void))(v0[59] + 8))(v0[64], v0[58]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E44E94D0()
{
  uint64_t v0 = sub_1E451B318();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E451B338();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unsigned __int8 v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52D0);
  MEMORY[0x1F4188790](v8 - 8);
  unsigned int v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1E451B2C8();
  sub_1E451B328();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1E451B308();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v11 = sub_1E451B2E8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1E44DD780((uint64_t)v10, &qword_1EBFF52D0);
    id v13 = objc_msgSend(self, sel_tps_userLanguageCode);
    uint64_t v14 = sub_1E451B868();
  }
  else
  {
    uint64_t v14 = sub_1E451B2D8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  return v14;
}

uint64_t sub_1E44E9784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 80) = a5;
  *(void *)(v5 + 40) = a3;
  *(void *)(v5 + 4_Block_object_dispose(&STACK[0x240], 8) = a4;
  *(void *)(v5 + 24) = a1;
  *(void *)(v5 + 32) = a2;
  return MEMORY[0x1F4188298](sub_1E44E97AC, 0, 0);
}

uint64_t sub_1E44E97AC()
{
  uint64_t v1 = *(void *)(v0 + 48);
  long long v8 = *(_OWORD *)(v0 + 32);
  char v2 = *(unsigned char *)(v0 + 80) & 1;
  *(void *)(v0 + 16) = 0;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(void *)(v3 + 16) = v0 + 16;
  *(_OWORD *)(v3 + 24) = v8;
  *(void *)(v3 + 40) = v1;
  *(unsigned char *)(v3 + 4_Block_object_dispose(&STACK[0x240], 8) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  uint64_t v5 = sub_1E451B1D8();
  *uint64_t v4 = v0;
  v4[1] = sub_1E44E98D8;
  uint64_t v6 = *(void *)(v0 + 24);
  return MEMORY[0x1F4188160](v6, 0, 0, 0xD000000000000023, 0x80000001E4527830, sub_1E44ED6BC, v3, v5);
}

uint64_t sub_1E44E98D8()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_1E44E9A58;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_1E44E99F4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44E99F4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44E9A58()
{
  swift_task_dealloc();

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1E44E9AC4()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = sub_1E451B668();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E451B648();
  id v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  id v12 = (id)0xD00000000000001FLL;
  unint64_t v13 = 0x80000001E4527810;
  sub_1E451B138();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v4 = objc_msgSend(self, sel_defaultManager);
  uint64_t v5 = (void *)sub_1E451B168();
  id v12 = 0;
  unsigned int v6 = objc_msgSend(v4, sel_removeItemAtURL_error_, v5, &v12);

  id v7 = v12;
  if (v6)
  {
    id v8 = v7;
  }
  else
  {
    v11[1] = v12;
    id v9 = v12;
    unsigned int v10 = (void *)sub_1E451B0D8();

    swift_willThrow();
  }
}

id sub_1E44E9CF8(uint64_t a1, SEL *a2)
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = (void *)sub_1E451B168();
  v13[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, v4, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_1E451B1D8();
    id v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_1E451B0D8();

    swift_willThrow();
    uint64_t v11 = sub_1E451B1D8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_1E44E9E50()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t *sub_1E44E9E60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v9 = a2[9];
    a1[8] = a2[8];
    a1[9] = v9;
    uint64_t v10 = a2[11];
    uint64_t v11 = *(int *)(a3 + 40);
    uint64_t v16 = (char *)a1 + v11;
    uint64_t v17 = (char *)a2 + v11;
    a1[10] = a2[10];
    a1[11] = v10;
    uint64_t v12 = sub_1E451B1D8();
    unint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v16, v17, v12);
  }
  return v3;
}

uint64_t sub_1E44E9FA8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_1E451B1D8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1E44EA048(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  uint64_t v9 = a2[11];
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v14 = (char *)a1 + v10;
  uint64_t v15 = (char *)a2 + v10;
  a1[10] = a2[10];
  a1[11] = v9;
  uint64_t v11 = sub_1E451B1D8();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v14, v15, v11);
  return a1;
}

void *sub_1E44EA140(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1E44EA27C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  long long v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

void *sub_1E44EA308(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 40);
  unint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_1E44EA3E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E44EA3F8);
}

uint64_t sub_1E44EA3F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1E451B1D8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1E44EA4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E44EA4BC);
}

uint64_t sub_1E44EA4BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1E451B1D8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1E44EA564()
{
  uint64_t result = sub_1E451B1D8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1E44EA60C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1E44ECFB4(*a1, *(void *)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for UserGuideIndexRequest(uint64_t a1)
{
  return sub_1E449B6C8(a1, (uint64_t *)&unk_1EBFF5B80);
}

void sub_1E44EA664(uint64_t a1, id *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v11 = a6 & 1;
  id v12 = *a2;
  sub_1E44EA6F0(a3, a2, a4, a5, v11, a1);
}

void sub_1E44EA6F0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v37 = a2;
  uint64_t v33 = a6;
  int v32 = a5;
  uint64_t v31 = a4;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BA0);
  uint64_t v7 = *(void *)(v34 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v34);
  uint64_t v9 = sub_1E451B1D8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1E451AFA8();
  uint64_t v35 = *(void *)(v13 - 8);
  uint64_t v36 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_1E451AF98();
  sub_1E449AE1C(0, (unint64_t *)&qword_1EBFF5260);
  id v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v30 = sub_1E451AF88();
    uint64_t v31 = sub_1E451B858();
    sub_1E451B868();
    uint64_t v18 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
    int v19 = *MEMORY[0x1E4F28A00];
    uint64_t v20 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v34);
    unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v22 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22 + v21, (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
    aBlock[4] = sub_1E44ED6D8;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E45042E0;
    aBlock[3] = &block_descriptor_6;
    uint64_t v23 = _Block_copy(aBlock);
    swift_release();
    uint64_t v24 = (void *)v30;
    uint64_t v25 = (void *)v31;
    LODWORD(v26) = v19;
    id v27 = objc_msgSend(v17, sel_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler_, v30, v31, 0, v18, v23, v26);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v36);
    uint64_t v28 = *v37;
    *uint64_t v37 = v27;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E44EAAD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  MEMORY[0x1F4188790](v10 - 8);
  id v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1E451B1D8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  int v19 = (char *)v25 - v18;
  sub_1E44E3AAC(a3, (uint64_t)v25, &qword_1EBFF5990);
  if (v25[3])
  {
    int v20 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, v20 ^ 1u, 1, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BA0);
      sub_1E451B9C8();
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    }
  }
  else
  {
    sub_1E44DD780((uint64_t)v25, &qword_1EBFF5990);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  }
  sub_1E44DD780((uint64_t)v12, &qword_1EBFF52B0);
  if (a9)
  {
    uint64_t v22 = (uint64_t)a9;
  }
  else
  {
    sub_1E44ED71C();
    uint64_t v22 = swift_allocError();
    *(void *)uint64_t v23 = 0;
    *(void *)(v23 + _Block_object_dispose(&STACK[0x240], 8) = 0;
    *(unsigned char *)(v23 + 16) = 1;
  }
  v25[0] = v22;
  id v24 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BA0);
  return sub_1E451B9B8();
}

void sub_1E44EAD8C(uint64_t a1, id *a2, uint64_t a3, char a4)
{
  int v7 = a4 & 1;
  id v8 = *a2;
  sub_1E44AB1E0(a3, a2, v7, a1);
}

uint64_t sub_1E44EAE00(int a1, int a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10)
{
  sub_1E44E3AAC(a3, (uint64_t)&v15, &qword_1EBFF5990);
  if (v16)
  {
    if (swift_dynamicCast())
    {
      long long v15 = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5890);
      return sub_1E451B9C8();
    }
  }
  else
  {
    sub_1E44DD780((uint64_t)&v15, &qword_1EBFF5990);
  }
  if (a9)
  {
    uint64_t v11 = (uint64_t)a9;
  }
  else
  {
    sub_1E44ED71C();
    uint64_t v11 = swift_allocError();
    *(void *)uint64_t v12 = 0;
    *(void *)(v12 + _Block_object_dispose(&STACK[0x240], 8) = 0;
    *(unsigned char *)(v12 + 16) = 1;
  }
  *(void *)&long long v15 = v11;
  id v13 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5890);
  return sub_1E451B9B8();
}

uint64_t sub_1E44EAEFC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48500);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44F0E00();
  sub_1E451BF18();
  v8[15] = 0;
  sub_1E451BD88();
  if (!v1)
  {
    v8[14] = 1;
    sub_1E451BD88();
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
    v8[13] = 2;
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    sub_1E44ED770(&qword_1EAE48508, (void (*)(uint64_t))type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
    sub_1E451BD98();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1E44EB0DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5938);
  uint64_t v22 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  id v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (void *)((char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = a1[3];
  uint64_t v25 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1E44F0E00();
  sub_1E451BF08();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  v21[1] = v4;
  uint64_t v13 = (uint64_t)v6;
  uint64_t v14 = v22;
  uint64_t v15 = v23;
  char v28 = 0;
  uint64_t v16 = (uint64_t)v11;
  *uint64_t v11 = sub_1E451BD38();
  v11[1] = v17;
  char v27 = 1;
  void v11[2] = sub_1E451BD38();
  void v11[3] = v18;
  char v26 = 2;
  sub_1E44ED770(qword_1EBFF5510, (void (*)(uint64_t))type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
  uint64_t v19 = v24;
  sub_1E451BD48();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v19);
  sub_1E44F0CBC(v13, v16 + *(int *)(v9 + 24), type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
  sub_1E44F0D44(v16, v15, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return sub_1E44ED7F8(v16, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
}

uint64_t sub_1E44EB440(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1E44E6C88(*a1, *a2);
}

uint64_t sub_1E44EB44C()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44EB4F4()
{
  sub_1E451B8B8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E44EB588()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44EB62C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1E44F1980();
  *a1 = result;
  return result;
}

void sub_1E44EB65C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE600000000000000;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x656C61636F6CLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x727474416373696DLL;
    unint64_t v4 = 0xEE00736574756269;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x64496B6F6F62;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1E44EB6C0()
{
  uint64_t v1 = 0x656C61636F6CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x727474416373696DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x64496B6F6F62;
  }
}

uint64_t sub_1E44EB720@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1E44F1980();
  *a1 = result;
  return result;
}

void sub_1E44EB748(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1E44EB754(uint64_t a1)
{
  unint64_t v2 = sub_1E44F0E00();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E44EB790(uint64_t a1)
{
  unint64_t v2 = sub_1E44F0E00();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E44EB7CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E44EB0DC(a1, a2);
}

uint64_t sub_1E44EB7E4(void *a1)
{
  return sub_1E44EAEFC(a1);
}

uint64_t sub_1E44EB7FC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E44EB808@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v38 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(0);
  MEMORY[0x1F4188790](v38);
  int v32 = (uint64_t *)((char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_1E451B898();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v34 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v11 = sub_1E451B1D8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v37 = (uint64_t)v10;
  v13(v10, 1, 1, v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v14 = v40;
  sub_1E451BEF8();
  if (!v14)
  {
    uint64_t v29 = v12;
    uint64_t v30 = v11;
    uint64_t v31 = v13;
    uint64_t v40 = v12 + 56;
    uint64_t v15 = v37;
    uint64_t v16 = v38;
    __swift_project_boxed_opaque_existential_1(v39, v39[3]);
    sub_1E451BDF8();
    uint64_t v17 = v34;
    sub_1E451B888();
    uint64_t v18 = sub_1E451B878();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v36);
    if (v20 >> 60 != 15)
    {
      sub_1E451AFD8();
      swift_allocObject();
      sub_1E451AFC8();
      sub_1E44ED770(qword_1EBFF55C0, (void (*)(uint64_t))type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper);
      sub_1E451AFB8();
      swift_release();
      sub_1E4496EBC(v18, v20);
      unint64_t v21 = v32;
      uint64_t v22 = *v32;
      uint64_t v23 = v32[1];
      swift_bridgeObjectRelease();
      *uint64_t v9 = v22;
      v9[1] = v23;
      sub_1E44DD780(v15, &qword_1EBFF52B0);
      uint64_t v24 = (char *)v21 + *(int *)(v16 + 20);
      uint64_t v25 = v30;
      (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v15, v24, v30);
      v31((char *)v15, 0, 1, v25);
    }
    uint64_t v26 = v33;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    sub_1E44F0D44((uint64_t)v9, v26, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1E44ED7F8((uint64_t)v9, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
}

uint64_t sub_1E44EBBFC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE484E8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44F0DAC();
  sub_1E451BF18();
  v8[15] = 0;
  sub_1E451BD68();
  if (!v1)
  {
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    v8[14] = 1;
    sub_1E451B1D8();
    sub_1E44ED770(&qword_1EAE484F8, MEMORY[0x1E4F276F0]);
    sub_1E451BD78();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1E44EBDB4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48548);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44F192C();
  sub_1E451BF18();
  v8[15] = 0;
  sub_1E451BD88();
  if (!v1)
  {
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(0);
    v8[14] = 1;
    sub_1E451B1D8();
    sub_1E44ED770(&qword_1EAE484F8, MEMORY[0x1E4F276F0]);
    sub_1E451BD98();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1E44EBF6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v20 = sub_1E451B1D8();
  uint64_t v17 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5930);
  uint64_t v19 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (uint64_t *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44F192C();
  sub_1E451BF08();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v16 = v8;
  uint64_t v12 = v19;
  uint64_t v11 = v20;
  char v23 = 0;
  uint64_t v13 = v21;
  *uint64_t v10 = sub_1E451BD38();
  v10[1] = v14;
  char v22 = 1;
  sub_1E44ED770(&qword_1EBFF52A8, MEMORY[0x1E4F276F0]);
  sub_1E451BD48();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))((char *)v10 + *(int *)(v16 + 20), v5, v11);
  sub_1E44F0D44((uint64_t)v10, v18, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1E44ED7F8((uint64_t)v10, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper);
}

uint64_t sub_1E44EC294@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  uint64_t v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  MEMORY[0x1F4188790](v4);
  uint64_t v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5928);
  uint64_t v14 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse(0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44F0C68();
  sub_1E451BF08();
  if (!v2)
  {
    sub_1E44ED770(qword_1EBFF5670, (void (*)(uint64_t))type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
    sub_1E451BD48();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_1E44F0CBC(v15, (uint64_t)v11, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
    sub_1E44F0CBC((uint64_t)v11, v13, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1E44EC4FC()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0x6449646C697562;
  }
}

uint64_t sub_1E44EC53C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1E44F19CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1E44EC564(uint64_t a1)
{
  unint64_t v2 = sub_1E44F0DAC();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E44EC5A0(uint64_t a1)
{
  unint64_t v2 = sub_1E44F0DAC();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E44EC5DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E44EB808(a1, a2);
}

uint64_t sub_1E44EC5F4(void *a1)
{
  return sub_1E44EBBFC(a1);
}

uint64_t sub_1E44EC60C(char *a1, char *a2)
{
  return sub_1E44E6DAC(*a1, *a2);
}

uint64_t sub_1E44EC618()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44EC6A0()
{
  sub_1E451B8B8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E44EC714()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44EC798@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1E451BD28();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_1E44EC7F8(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0x6449646C697562;
  if (*v1) {
    unint64_t v2 = 0xD000000000000013;
  }
  unint64_t v3 = 0x80000001E4527220;
  if (!*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1E44EC83C()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0x6449646C697562;
  }
}

uint64_t sub_1E44EC87C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1E451BD28();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1E44EC8E0(uint64_t a1)
{
  unint64_t v2 = sub_1E44F192C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E44EC91C(uint64_t a1)
{
  unint64_t v2 = sub_1E44F192C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E44EC958@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E44EBF6C(a1, a2);
}

uint64_t sub_1E44EC970(void *a1)
{
  return sub_1E44EBDB4(a1);
}

uint64_t sub_1E44EC988()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44EC9E4()
{
  return sub_1E451B8B8();
}

uint64_t sub_1E44ECA04()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E44ECA5C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1E451BD28();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1E44ECAB0(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t sub_1E44ECAD4()
{
  return 0x707365526B6F6F62;
}

uint64_t sub_1E44ECAF4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1E451BD28();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1E44ECB4C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1E44ECB58(uint64_t a1)
{
  unint64_t v2 = sub_1E44F0C68();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E44ECB94(uint64_t a1)
{
  unint64_t v2 = sub_1E44F0C68();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E44ECBD0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E44EC294(a1, a2);
}

uint64_t sub_1E44ECBE8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48510);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44F0C68();
  sub_1E451BF18();
  type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  sub_1E44ED770(&qword_1EAE48518, (void (*)(uint64_t))type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
  sub_1E451BD98();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1E44ECD5C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58D8);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_1EBFF5970;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_1EBFF5968;
  }

  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t sub_1E44ECDBC()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1E44ECF48;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1E44ECED8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44ECED8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);

  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v2, v1);
}

uint64_t sub_1E44ECF48()
{
  swift_task_dealloc();

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_1E44ECFB4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1E451B2B8();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v36 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E451B1D8();
  uint64_t v35 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a2 + 80);
  id v39 = *(id *)a2;
  uint64_t v40 = v12;
  uint64_t v41 = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  id v13 = objc_msgSend(a1, sel_attributeSet);
  uint64_t v14 = (void *)sub_1E451B858();
  id v15 = objc_msgSend(v13, sel_attributeForKey_, v14);

  if (v15)
  {
    sub_1E451BB78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v43, 0, sizeof(v43));
  }
  sub_1E44ED858((uint64_t)v43, (uint64_t)&v44, &qword_1EBFF5990);
  if (!*((void *)&v45 + 1)) {
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v34 = v42;
  if (!objc_msgSend(v13, sel_attributeForKey_, *MEMORY[0x1E4F22CE8])
    || (sub_1E451BB78(),
        swift_unknownObjectRelease(),
        sub_1E44DD780((uint64_t)&v44, &qword_1EBFF5990),
        !objc_msgSend(v13, sel_attributeForKey_, *MEMORY[0x1E4F22CD0])))
  {
    long long v44 = 0u;
    long long v45 = 0u;
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();

    sub_1E44DD780((uint64_t)&v44, &qword_1EBFF5990);
    return 0;
  }
  sub_1E451BB78();
  swift_unknownObjectRelease();
  sub_1E44DD780((uint64_t)&v44, &qword_1EBFF5990);
  objc_allocWithZone((Class)sub_1E451B698());
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_1E451B678();
  uint64_t v17 = sub_1E451B688();
  if (!v18)
  {

    return 0;
  }
  uint64_t v19 = v17;
  v33[0] = v18;
  *(void *)&long long v44 = 0x6469754772657375;
  *((void *)&v44 + 1) = 0xEA00000000002E65;
  sub_1E451B8C8();
  uint64_t v34 = v44;
  id v20 = objc_msgSend(v16, sel_supportSiteURL);
  id v39 = v16;
  v33[1] = v19;
  if (v20)
  {
    sub_1E451B1A8();

    uint64_t v21 = v35;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v11, v8, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v11, 0, 1, v6);
    int v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v11, 1, v6);
    uint64_t v24 = v36;
    uint64_t v23 = v37;
    if (v22 == 1)
    {
      id v20 = 0;
    }
    else
    {
      id v20 = (id)sub_1E451B168();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v6);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v11, 1, 1, v6);
    uint64_t v24 = v36;
    uint64_t v23 = v37;
  }
  objc_msgSend(v13, sel_setContentURL_, v20);

  uint64_t v26 = (void *)sub_1E451B858();
  objc_msgSend(v13, sel_setDomainIdentifier_, v26);

  if (v41) {
    char v27 = (void *)sub_1E451B858();
  }
  else {
    char v27 = 0;
  }
  objc_msgSend(v13, sel_setVersion_, v27);

  uint64_t v28 = (void *)sub_1E451B858();
  objc_msgSend(v13, sel_setKind_, v28);

  uint64_t v29 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUniqueIdentifier_, v29);

  uint64_t v30 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setDomainIdentifier_, v30);

  objc_msgSend(a1, sel_setAttributeSet_, v13);
  sub_1E451B278();
  uint64_t v31 = (void *)sub_1E451B288();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v38);
  objc_msgSend(a1, sel_setExpirationDate_, v31);

  id v32 = a1;
  return a1;
}

uint64_t sub_1E44ED60C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1E44ED660(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1E44ED6BC(uint64_t a1)
{
  sub_1E44EA664(a1, *(id **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48));
}

uint64_t sub_1E44ED6CC()
{
  return objectdestroyTm(&qword_1EBFF5BA0);
}

uint64_t sub_1E44ED6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1E44ED918(a1, a2, a3, a4, a5, a6, a7, a8, a9, &qword_1EBFF5BA0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1E44EAAD0);
}

unint64_t sub_1E44ED71C()
{
  unint64_t result = qword_1EAE484C8;
  if (!qword_1EAE484C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1EAE484C8);
  }
  return result;
}

uint64_t sub_1E44ED770(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(uint64_t a1)
{
  return sub_1E449B6C8(a1, qword_1EBFF56A8);
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(uint64_t a1)
{
  return sub_1E449B6C8(a1, qword_1EBFF5540);
}

uint64_t sub_1E44ED7F8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E44ED858(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_1E44ED8BC(uint64_t a1)
{
  sub_1E44EAD8C(a1, *(id **)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

uint64_t sub_1E44ED8C8()
{
  return objectdestroyTm(&qword_1EBFF5890);
}

uint64_t sub_1E44ED8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1E44ED918(a1, a2, a3, a4, a5, a6, a7, a8, a9, &qword_1EBFF5890, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1E44EAE00);
}

uint64_t sub_1E44ED918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10, uint64_t (*a11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v20 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a10) - 8);
  uint64_t v23 = v11 + ((*(unsigned __int8 *)(v20 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));

  return a11(a1, a2, a3, a4, a5, a6, a7, a8, a9, v23);
}

uint64_t *sub_1E44ED9FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1E451B1D8();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_1E44EDB70(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1E451B1D8();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_1E44EDC40(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1E451B1D8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_1E44EDD64(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E451B1D8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_1E44EDEFC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1E451B1D8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void *sub_1E44EE010(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1E451B1D8();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1E44EE198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E44EE1AC);
}

uint64_t sub_1E44EE1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_1E44EE26C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E44EE280);
}

uint64_t sub_1E44EE280(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1E44EE32C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E44F14AC(a1, a2, a3, (uint64_t)&unk_1E45205E0, (uint64_t (*)(uint64_t))sub_1E44EE34C);
}

void sub_1E44EE34C()
{
  if (!qword_1EBFF52B8)
  {
    sub_1E451B1D8();
    unint64_t v0 = sub_1E451BB68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBFF52B8);
    }
  }
}

uint64_t *sub_1E44EE3A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (uint64_t *)((char *)a1 + v7);
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v7 + 8);
    *uint64_t v8 = *(uint64_t *)((char *)a2 + v7);
    v8[1] = v10;
    uint64_t v11 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
    uint64_t v12 = (char *)v8 + v11;
    int v13 = &v9[v11];
    uint64_t v14 = sub_1E451B1D8();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v13, 1, v14))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return v3;
}

uint64_t sub_1E44EE554(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v6 = sub_1E451B1D8();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

void *sub_1E44EE644(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  uint64_t v10 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_1E451B1D8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

void *sub_1E44EE7A4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v10 = (char *)v7 + v9;
  uint64_t v11 = (char *)v8 + v9;
  uint64_t v12 = sub_1E451B1D8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

_OWORD *sub_1E44EE990(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  *(_OWORD *)((char *)a1 + v5) = *(_OWORD *)((char *)a2 + v5);
  uint64_t v8 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v9 = &v6[v8];
  uint64_t v10 = &v7[v8];
  uint64_t v11 = sub_1E451B1D8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

void *sub_1E44EEAC0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)((char *)a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v13 = (char *)v9 + v12;
  uint64_t v14 = (char *)v10 + v12;
  uint64_t v15 = sub_1E451B1D8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_1E44EEC7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E44EEC90);
}

uint64_t sub_1E44EEC90(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1E44EED40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E44EED54);
}

uint64_t sub_1E44EED54(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1E44EEDFC()
{
  uint64_t result = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1E44EEE94(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = *(int *)(v4 + 24);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    uint64_t v12 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
    uint64_t v13 = (char *)v9 + v12;
    uint64_t v14 = &v10[v12];
    uint64_t v15 = sub_1E451B1D8();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
      memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return a1;
}

uint64_t sub_1E44EF050(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  swift_bridgeObjectRelease();
  uint64_t v3 = v2 + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v4 = sub_1E451B1D8();
  uint64_t v7 = *(void *)(v4 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v3, 1, v4);
  if (!result)
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
    return v6(v3, v4);
  }
  return result;
}

void *sub_1E44EF144(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  uint64_t v10 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_1E451B1D8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

void *sub_1E44EF2B0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (char *)a2 + v4;
  *uint64_t v5 = *(void *)((char *)a2 + v4);
  v5[1] = *(void *)((char *)a2 + v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v8 = (char *)v5 + v7;
  uint64_t v9 = &v6[v7];
  uint64_t v10 = sub_1E451B1D8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

_OWORD *sub_1E44EF4A0(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  *(_OWORD *)((char *)a1 + v5) = *(_OWORD *)((char *)a2 + v5);
  uint64_t v8 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v9 = &v6[v8];
  uint64_t v10 = &v7[v8];
  uint64_t v11 = sub_1E451B1D8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

void *sub_1E44EF5DC(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_1E451B1D8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_1E44EF79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E44EF7B0);
}

uint64_t sub_1E44EF7B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1E44EF81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E44EF830);
}

uint64_t sub_1E44EF830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_1E44EF8A0()
{
  uint64_t result = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1E44EF92C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_1E451B1D8();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v9, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
      memcpy(v10, v9, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v10, v9, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t sub_1E44EFAC8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1E451B1D8();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_1E44EFBA8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_1E451B1D8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v8, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v9, v8, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v8, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  }
  return a1;
}

void *sub_1E44EFCF4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E451B1D8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_1E44EFECC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1E451B1D8();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_1E44EFFE8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1E451B1D8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_1E44F0190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E44F01A4);
}

uint64_t sub_1E44F01A4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1E44F0258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E44F026C);
}

uint64_t sub_1E44F026C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1E44F0318()
{
  sub_1E44EE34C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_1E44F03BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a2[7];
    a1[6] = a2[6];
    a1[7] = v10;
    uint64_t v11 = a2[9];
    a1[8] = a2[8];
    a1[9] = v11;
    uint64_t v12 = a2[11];
    a1[10] = a2[10];
    a1[11] = v12;
    uint64_t v13 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
    uint64_t v18 = (char *)a2 + v13;
    uint64_t v19 = (char *)v4 + v13;
    uint64_t v14 = sub_1E451B1D8();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17(v19, v18, v14);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1E44F0528(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  uint64_t v3 = sub_1E451B1D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_bridgeObjectRelease();
}

void *sub_1E44F05E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  uint64_t v9 = a2[9];
  a1[8] = a2[8];
  a1[9] = v9;
  uint64_t v10 = a2[11];
  a1[10] = a2[10];
  a1[11] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  uint64_t v15 = (char *)a2 + v11;
  int v16 = (char *)a1 + v11;
  uint64_t v12 = sub_1E451B1D8();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v16, v15, v12);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1E44F0708(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1E44F0870(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  long long v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_1E44F0920(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1E44F0A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E44F0A34);
}

uint64_t sub_1E44F0A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UserGuideIndexItem(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1E44F0AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E44F0B08);
}

uint64_t sub_1E44F0B08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UserGuideIndexItem(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1E44F0BC4()
{
  uint64_t result = type metadata accessor for UserGuideIndexItem(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1E44F0C5C()
{
  return MEMORY[0x1E4FBB1B0];
}

unint64_t sub_1E44F0C68()
{
  unint64_t result = qword_1EBFF54F8;
  if (!qword_1EBFF54F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF54F8);
  }
  return result;
}

uint64_t sub_1E44F0CBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(uint64_t a1)
{
  return sub_1E449B6C8(a1, qword_1EBFF55F0);
}

uint64_t sub_1E44F0D44(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1E44F0DAC()
{
  unint64_t result = qword_1EAE484F0;
  if (!qword_1EAE484F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE484F0);
  }
  return result;
}

unint64_t sub_1E44F0E00()
{
  unint64_t result = qword_1EBFF5658;
  if (!qword_1EBFF5658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5658);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E44F0F20);
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

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys;
}

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys;
}

uint64_t *sub_1E44F0F70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1E451B1D8();
    unint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1E44F1058(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1E451B1D8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1E44F10D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1E451B1D8();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_1E44F1168(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1E44F1204(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1E44F1280(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1E451B1D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1E44F130C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E44F1320);
}

uint64_t sub_1E44F1320(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1E451B1D8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1E44F13D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E44F13E4);
}

uint64_t sub_1E44F13E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1E451B1D8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1E44F148C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E44F14AC(a1, a2, a3, (uint64_t)&unk_1E45205C8, MEMORY[0x1E4F276F0]);
}

uint64_t sub_1E44F14AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t result = a5(319);
  if (v6 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1E44F15DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys;
}

unint64_t sub_1E44F1618()
{
  unint64_t result = qword_1EAE48520;
  if (!qword_1EAE48520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48520);
  }
  return result;
}

unint64_t sub_1E44F1670()
{
  unint64_t result = qword_1EAE48528;
  if (!qword_1EAE48528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48528);
  }
  return result;
}

unint64_t sub_1E44F16C8()
{
  unint64_t result = qword_1EAE48530;
  if (!qword_1EAE48530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48530);
  }
  return result;
}

unint64_t sub_1E44F1720()
{
  unint64_t result = qword_1EBFF5668;
  if (!qword_1EBFF5668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5668);
  }
  return result;
}

unint64_t sub_1E44F1778()
{
  unint64_t result = qword_1EBFF5660;
  if (!qword_1EBFF5660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5660);
  }
  return result;
}

unint64_t sub_1E44F17D0()
{
  unint64_t result = qword_1EAE48538;
  if (!qword_1EAE48538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48538);
  }
  return result;
}

unint64_t sub_1E44F1828()
{
  unint64_t result = qword_1EAE48540;
  if (!qword_1EAE48540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48540);
  }
  return result;
}

unint64_t sub_1E44F1880()
{
  unint64_t result = qword_1EBFF5508;
  if (!qword_1EBFF5508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5508);
  }
  return result;
}

unint64_t sub_1E44F18D8()
{
  unint64_t result = qword_1EBFF5500;
  if (!qword_1EBFF5500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5500);
  }
  return result;
}

unint64_t sub_1E44F192C()
{
  unint64_t result = qword_1EBFF55A8;
  if (!qword_1EBFF55A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF55A8);
  }
  return result;
}

uint64_t sub_1E44F1980()
{
  unint64_t v0 = sub_1E451BD28();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_1E44F19CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6449646C697562 && a2 == 0xE700000000000000;
  if (v2 || (sub_1E451BDE8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001E4527910)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1E451BDE8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unsigned char *_s10TipsDaemon20UserGuideIndexHelperC20UserGuideCDSResponseV14MiscAttributesV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1E44F1B88);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys;
}

unint64_t sub_1E44F1BC4()
{
  unint64_t result = qword_1EAE48550;
  if (!qword_1EAE48550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48550);
  }
  return result;
}

unint64_t sub_1E44F1C1C()
{
  unint64_t result = qword_1EBFF55B8;
  if (!qword_1EBFF55B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF55B8);
  }
  return result;
}

unint64_t sub_1E44F1C74()
{
  unint64_t result = qword_1EBFF55B0;
  if (!qword_1EBFF55B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF55B0);
  }
  return result;
}

void sub_1E44F1CD8(void *a1, void *a2)
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  v11[0] = 0;
  if (objc_msgSend(a1, sel_closeAndReturnError_, v11))
  {
    id v3 = v11[0];
  }
  else
  {
    id v4 = v11[0];
    uint64_t v5 = (void *)sub_1E451B0D8();

    swift_willThrow();
  }
  v11[0] = 0;
  unsigned int v6 = objc_msgSend(a2, sel_closeAndReturnError_, v11);
  id v7 = v11[0];
  if (v6)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = v11[0];
    uint64_t v10 = (void *)sub_1E451B0D8();

    swift_willThrow();
  }
}

uint64_t sub_1E44F1E08(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
  {
    uint64_t v3 = result;
    sub_1E44957E4(result, a2);
    sub_1E44F2214();
    sub_1E451BA98();
    return sub_1E4496EBC(v3, a2);
  }
  return result;
}

void sub_1E44F1E88(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v9 = sub_1E451B398();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1E451B388();
  MEMORY[0x1F4188790](v13);
  (*(void (**)(char *, uint64_t))(v15 + 16))((char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a4, v9);
  *(void *)(swift_allocObject() + 16) = a3;
  sub_1E451B368();
  swift_allocObject();
  id v16 = a3;
  sub_1E451B378();
  if (!v4)
  {
    while (2)
    {
      uint64_t v20 = sub_1E451BA88();
      unint64_t v22 = v21;
      if (v21 >> 60 != 15)
      {
        uint64_t v23 = v20;
        v24[0] = v20;
        v24[1] = v21;
        sub_1E44957E4(v20, v21);
        sub_1E44F2214();
        sub_1E451B348();
        sub_1E4496EBC(v23, v22);
        switch(v22 >> 62)
        {
          case 1uLL:
            sub_1E4496EBC(v23, v22);
            LODWORD(v19) = HIDWORD(v23) - v23;
            if (__OFSUB__(HIDWORD(v23), v23))
            {
              __break(1u);
LABEL_13:
              __break(1u);
              JUMPOUT(0x1E44F21B0);
            }
            uint64_t v19 = (int)v19;
LABEL_4:
            if (v19 >= 0x8000) {
              continue;
            }
            goto LABEL_10;
          case 2uLL:
            uint64_t v18 = *(void *)(v23 + 16);
            uint64_t v17 = *(void *)(v23 + 24);
            sub_1E4496EBC(v23, v22);
            uint64_t v19 = v17 - v18;
            if (!__OFSUB__(v17, v18)) {
              goto LABEL_4;
            }
            goto LABEL_13;
          default:
            sub_1E4496EBC(v23, v22);
            goto LABEL_10;
        }
      }
      break;
    }
LABEL_10:
    sub_1E451B358();
    swift_release();
  }
  sub_1E44F1CD8(a2, v16);
}

uint64_t sub_1E44F21C0()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E44F21F8(uint64_t a1, unint64_t a2)
{
  return sub_1E44F1E08(a1, a2);
}

unint64_t sub_1E44F2214()
{
  unint64_t result = qword_1EBFF5B68;
  if (!qword_1EBFF5B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5B68);
  }
  return result;
}

void sub_1E44F2268(uint64_t a1, id *a2, uint64_t *a3)
{
  uint64_t v7 = a1 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a1 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v12 = 0;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    id v20 = *(id *)(*(void *)(a1 + 56) + 8 * i);
    id v18 = v20;
    sub_1E44F29BC(&v20, a2, a3);
    if (v3)
    {
      swift_release();

      return;
    }

    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v11) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v12);
    if (!v16)
    {
      int64_t v17 = v12 + 1;
      if (v12 + 1 >= v11) {
        goto LABEL_26;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (v16) {
        goto LABEL_14;
      }
      int64_t v17 = v12 + 2;
      if (v12 + 2 >= v11) {
        goto LABEL_26;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (v16) {
        goto LABEL_14;
      }
      int64_t v17 = v12 + 3;
      if (v12 + 3 >= v11) {
        goto LABEL_26;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (v16)
      {
LABEL_14:
        int64_t v12 = v17;
        goto LABEL_15;
      }
      int64_t v19 = v12 + 4;
      if (v12 + 4 >= v11)
      {
LABEL_26:
        swift_release();
        return;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v19);
      v12 += 4;
      if (!v16) {
        break;
      }
    }
LABEL_15:
    unint64_t v10 = (v16 - 1) & v16;
  }
  while (1)
  {
    int64_t v12 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v12 >= v11) {
      goto LABEL_26;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v12);
    ++v19;
    if (v16) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
}

uint64_t sub_1E44F2588(uint64_t a1, void *aBlock)
{
  v2[2] = a1;
  v2[3] = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E44F2638;
  return sub_1E44F7428(a1);
}

uint64_t sub_1E44F2638(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v6 = *v1;
  *(void *)(v3 + 40) = a1;
  swift_task_dealloc();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 4_Block_object_dispose(&STACK[0x240], 8) = v4;
  *uint64_t v4 = v6;
  v4[1] = sub_1E44F2770;
  return MEMORY[0x1F4164180](a1);
}

uint64_t sub_1E44F2770()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    BOOL v2 = sub_1E44F290C;
  }
  else
  {
    swift_bridgeObjectRelease();
    BOOL v2 = sub_1E44F288C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44F288C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
  _Block_release(*(const void **)(v0 + 24));
  BOOL v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E44F290C()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = (void *)sub_1E451B0C8();

  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  _Block_release(*(const void **)(v0 + 24));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id sub_1E44F29BC(id *a1, id *a2, uint64_t *a3)
{
  uint64_t v40 = a3;
  uint64_t v41 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52C8);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  unint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = sub_1E451B2B8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  int64_t v17 = (char *)&v36 - v16;
  id v18 = *a1;
  id result = objc_msgSend(*a1, sel_displayType);
  if (result != (id)2) {
    return result;
  }
  uint64_t v39 = v3;
  sub_1E44F2D64((uint64_t)v10);
  id v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v20(v10, 1, v11) == 1)
  {
    sub_1E44DD780((uint64_t)v10, &qword_1EBFF52C8);
    goto LABEL_11;
  }
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v38 = v12 + 32;
  v37(v17, v10, v11);
  unint64_t v21 = v41;
  if (!*v41)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
    goto LABEL_9;
  }
  id v22 = *v41;
  uint64_t v36 = v20;
  id v23 = v22;
  sub_1E44F2D64((uint64_t)v8);

  if (v36(v8, 1, v11) == 1)
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    sub_1E44DD780((uint64_t)v8, &qword_1EBFF52C8);
    goto LABEL_10;
  }
  v37(v15, v8, v11);
  char v24 = sub_1E451B298();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v12 + 8);
  v25(v15, v11);
  v25(v17, v11);
  if (v24)
  {
LABEL_10:
    uint64_t v26 = *v21;
    *unint64_t v21 = v18;
    id v27 = v18;
  }
LABEL_11:
  id result = objc_msgSend(v18, sel_isHintInelgibile);
  if (result)
  {
    id v28 = objc_msgSend(v18, sel_correlationIdentifier);
    uint64_t v29 = sub_1E451B868();
    unint64_t v31 = v30;

    uint64_t v32 = HIBYTE(v31) & 0xF;
    if ((v31 & 0x2000000000000000) == 0) {
      uint64_t v32 = v29 & 0xFFFFFFFFFFFFLL;
    }
    if (v32)
    {
      id v33 = objc_msgSend(v18, sel_hintIneligibleReason);
      uint64_t v34 = v40;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v42 = *v34;
      *uint64_t v34 = 0x8000000000000000;
      sub_1E44F4C48((uint64_t)v33, v29, v31, isUniquelyReferenced_nonNull_native);
      *uint64_t v34 = v42;
      swift_bridgeObjectRelease();
    }
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1E44F2D64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52C8);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v22 - v8;
  id v10 = objc_msgSend(v2, sel_hintDisplayedDates);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = sub_1E451B2B8();
    uint64_t v13 = sub_1E451B948();

    uint64_t v14 = *(void *)(v13 + 16);
    uint64_t v15 = *(void *)(v12 - 8);
    if (v14)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v13+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(*(void *)(v12 - 8) + 72) * (v14 - 1), v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v12);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
    }
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v12) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(a1, v9, v12);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v12);
    }
  }
  else
  {
    uint64_t v16 = sub_1E451B2B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 1, 1, v16);
  }
  id v17 = objc_msgSend(v2, sel_hintWouldHaveBeenDisplayedDate);
  if (v17)
  {
    id v18 = v17;
    sub_1E451B2A8();

    uint64_t v19 = sub_1E451B2B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v7, 0, 1, v19);
  }
  else
  {
    uint64_t v21 = sub_1E451B2B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v7, 1, 1, v21);
  }
  sub_1E44F8670((uint64_t)v7, a1);
  return sub_1E44DD780((uint64_t)v9, &qword_1EBFF52C8);
}

uint64_t sub_1E44F30D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    uint64_t ObjectType = swift_getObjectType();
    *(void *)&long long v11 = a2;
    uint64_t v9 = *(_OWORD **)(*(void *)(v3 + 64) + 40);
    swift_unknownObjectRetain();
    sub_1E4497328(&v11, v9);
    return swift_continuation_throwingResume();
  }
}

id DeviceProfileExporter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id DeviceProfileExporter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DeviceProfileExporter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DeviceProfileExporter()
{
  return self;
}

uint64_t sub_1E44F32B4()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E44F32F4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E44AE0C8;
  uint64_t v5 = (uint64_t (*)(uint64_t, void *))((char *)&dword_1EAE48558 + dword_1EAE48558);
  return v5(v2, v3);
}

uint64_t sub_1E44F33AC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E44DAA10;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EAE488A0 + dword_1EAE488A0);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E44F34B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E44DAA10;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE488A8 + dword_1EAE488A8);
  return v8(a1, v4, v5, v6);
}

char *sub_1E44F357C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5958);
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
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1E44F3680(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48590);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

double sub_1E44F37A4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1E4496570(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1E44F568C(&qword_1EBFF5900, (void (*)(unsigned char *, uint64_t))sub_1E4497328);
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1E4497328((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1E44F4710(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1E44F38C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BC8);
  char v42 = a2;
  uint64_t v6 = sub_1E451BD08();
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
  uint64_t v39 = v2;
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
    char v24 = (void *)(v5 + 64);
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
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1E451BEB8();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
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
    id v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  char v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1E44F3BEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48490);
  char v38 = a2;
  uint64_t v6 = sub_1E451BD08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1E451BEB8();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1E44F3EFC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58F8);
  char v37 = a2;
  uint64_t v6 = sub_1E451BD08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1E451BEB8();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1E44F4208(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, unsigned char *))
{
  uint64_t v6 = v4;
  uint64_t v8 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v9 = sub_1E451BD08();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v38 = v8 + 64;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & *(void *)(v8 + 64);
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v14 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v37) {
      break;
    }
    unint64_t v22 = (void *)(v8 + 64);
    unint64_t v23 = *(void *)(v38 + 8 * v21);
    ++v16;
    if (!v23)
    {
      int64_t v16 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v38 + 8 * v16);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v37)
        {
LABEL_34:
          swift_release();
          if ((v39 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v38 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v16 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v37) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v38 + 8 * v16);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v24;
      }
    }
LABEL_21:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_22:
    char v25 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v20);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    uint64_t v28 = *(void *)(v8 + 56) + 32 * v20;
    if (v39)
    {
      a4(v28, v40);
    }
    else
    {
      sub_1E44ED660(v28, (uint64_t)v40);
      swift_bridgeObjectRetain();
    }
    sub_1E451BEB8();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
    uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v14 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v30) & ~*(void *)(v14 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v14 + 8 * v31);
      }
      while (v35 == -1);
      unint64_t v17 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v10 + 48) + 16 * v17);
    void *v18 = v27;
    v18[1] = v26;
    uint64_t result = ((uint64_t (*)(unsigned char *, unint64_t))a4)(v40, *(void *)(v10 + 56) + 32 * v17);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v8 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
  if (v36 >= 64) {
    bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v36;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v6 = v10;
  return result;
}

unint64_t sub_1E44F4538(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1E451BB98();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1E451BEB8();
        swift_bridgeObjectRetain();
        sub_1E451B8B8();
        uint64_t v9 = sub_1E451BEE8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1E44F4710(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1E451BB98();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1E451BEB8();
        swift_bridgeObjectRetain();
        sub_1E451B8B8();
        uint64_t v10 = sub_1E451BEE8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *unint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          int64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *int64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1E44F48E8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1E451BB98();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1E451BEB8();
        swift_bridgeObjectRetain();
        sub_1E451B8B8();
        uint64_t v9 = sub_1E451BEE8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          int64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1E44F4AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1E4496570(a3, a4);
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
    sub_1E44F4FA4();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      BOOL v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1E44F38C4(v17, a5 & 1);
  unint64_t v23 = sub_1E4496570(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  char v25 = (uint64_t *)(v20[6] + 16 * v14);
  *char v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
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

uint64_t sub_1E44F4C48(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1E4496570(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1E44F5314();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1E44F3EFC(result, a4 & 1);
  uint64_t result = sub_1E4496570(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_1E44F4DAC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1E4496570(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1E44F568C(&qword_1EBFF5908, (void (*)(unsigned char *, uint64_t))sub_1E4497328);
      goto LABEL_7;
    }
    sub_1E44F4208(v15, a4 & 1, &qword_1EBFF5908, (void (*)(uint64_t, unsigned char *))sub_1E4497328);
    unint64_t v21 = sub_1E4496570(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_1E451BE58();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    char v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_1E4497328(a1, v19);
  }
LABEL_13:
  sub_1E44F4F38(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1E44F4F38(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1E4497328(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_1E44F4FA4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E451BCF8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
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

id sub_1E44F5160()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48490);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E451BCF8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1E44F5314()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E451BCF8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1E44F54C4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E451BCF8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    void *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    id result = (void *)sub_1E44957E4(v24, *((unint64_t *)&v24 + 1));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1E44F568C(uint64_t *a1, void (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v5 = *v2;
  uint64_t v6 = sub_1E451BCF8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v4 = v7;
    return result;
  }
  int64_t v27 = v4;
  id result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v11);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = 32 * v17;
    sub_1E44ED660(*(void *)(v5 + 56) + 32 * v17, (uint64_t)v29);
    int64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *int64_t v23 = v20;
    v23[1] = v21;
    a2(v29, *(void *)(v7 + 56) + v22);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v4 = v27;
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

_OWORD *sub_1E44F587C(char a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  LOBYTE(v27) = a1;
  uint64_t v9 = MEMORY[0x1E4FBB390];
  uint64_t v28 = MEMORY[0x1E4FBB390];
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_1E4496570(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      return sub_1E4497328(&v27, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1E44F568C(&qword_1EBFF5900, (void (*)(unsigned char *, uint64_t))sub_1E4497328);
    goto LABEL_7;
  }
  sub_1E44F4208(v15, a4 & 1, &qword_1EBFF5900, (void (*)(uint64_t, unsigned char *))sub_1E4497328);
  unint64_t v21 = sub_1E4496570(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    id result = (_OWORD *)sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v27, v9);
  MEMORY[0x1F4188790](v23);
  unint64_t v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v26 + 16))(v25);
  sub_1E44F6508(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1E44F5A98(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  *(void *)&long long v27 = a1;
  uint64_t v9 = MEMORY[0x1E4FBB550];
  uint64_t v28 = MEMORY[0x1E4FBB550];
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_1E4496570(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      return sub_1E4497328(&v27, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1E44F568C(&qword_1EBFF5900, (void (*)(unsigned char *, uint64_t))sub_1E4497328);
    goto LABEL_7;
  }
  sub_1E44F4208(v15, a4 & 1, &qword_1EBFF5900, (void (*)(uint64_t, unsigned char *))sub_1E4497328);
  unint64_t v21 = sub_1E4496570(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    id result = (_OWORD *)sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v27, v9);
  MEMORY[0x1F4188790](v23);
  unint64_t v25 = (uint64_t *)((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  sub_1E44F6484(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1E44F5CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6)
{
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  uint64_t v29 = MEMORY[0x1E4FBB1A0];
  *(void *)&long long v28 = a1;
  *((void *)&v28 + 1) = a2;
  char v11 = (void *)*a6;
  unint64_t v13 = sub_1E4496570(a3, a4);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a5 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = (void *)*a6;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = (_OWORD *)(v19[7] + 32 * v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      return sub_1E4497328(&v28, v20);
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a5 & 1) == 0)
  {
    sub_1E44F568C(&qword_1EBFF5900, (void (*)(unsigned char *, uint64_t))sub_1E4497328);
    goto LABEL_7;
  }
  sub_1E44F4208(v16, a5 & 1, &qword_1EBFF5900, (void (*)(uint64_t, unsigned char *))sub_1E4497328);
  unint64_t v22 = sub_1E4496570(a3, a4);
  if ((v17 & 1) != (v23 & 1))
  {
LABEL_14:
    id result = (_OWORD *)sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v13 = v22;
  uint64_t v19 = (void *)*a6;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v28, v10);
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (uint64_t *)((char *)&v28 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v27 + 16))(v26);
  sub_1E44F6400(v13, a3, a4, *v26, v26[1], v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1E44F5ED0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, uint64_t *a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v31 = v12;
  *(void *)&long long v30 = a1;
  unint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_1E4496570(a2, a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v21 = (void *)*a5;
    if (v19)
    {
LABEL_8:
      unint64_t v22 = (_OWORD *)(v21[7] + 32 * v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      return sub_1E4497328(&v30, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_1E44F568C(&qword_1EBFF5900, (void (*)(unsigned char *, uint64_t))sub_1E4497328);
    goto LABEL_7;
  }
  sub_1E44F4208(v18, a4 & 1, &qword_1EBFF5900, (void (*)(uint64_t, unsigned char *))sub_1E4497328);
  unint64_t v24 = sub_1E4496570(a2, a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    id result = (_OWORD *)sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  unint64_t v21 = (void *)*a5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v30, v12);
  MEMORY[0x1F4188790](v26);
  long long v28 = (uint64_t *)((char *)&v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  sub_1E44F635C(v15, a2, a3, *v28, v21, a6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1E44F6104(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, uint64_t a6)
{
  uint64_t v31 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a1, a6);
  unint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_1E4496570(a2, a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v21 = (void *)*a5;
    if (v19)
    {
LABEL_8:
      unint64_t v22 = (_OWORD *)(v21[7] + 32 * v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      return sub_1E4497328(v30, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_1E44F568C(&qword_1EBFF5900, (void (*)(unsigned char *, uint64_t))sub_1E4497328);
    goto LABEL_7;
  }
  sub_1E44F4208(v18, a4 & 1, &qword_1EBFF5900, (void (*)(uint64_t, unsigned char *))sub_1E4497328);
  unint64_t v24 = sub_1E4496570(a2, a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    id result = (_OWORD *)sub_1E451BE58();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  unint64_t v21 = (void *)*a5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)v30, v31);
  MEMORY[0x1F4188790](v26);
  long long v28 = (char *)v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v28);
  sub_1E44F658C(v15, a2, a3, (uint64_t)v28, v21, a6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1E44F635C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t *a6)
{
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(a6);
  *(void *)&long long v16 = a4;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  char v11 = (void *)(a5[6] + 16 * a1);
  *char v11 = a2;
  v11[1] = a3;
  id result = sub_1E4497328(&v16, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v13 = a5[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a5[2] = v15;
  }
  return result;
}

_OWORD *sub_1E44F6400(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v13 = MEMORY[0x1E4FBB1A0];
  *(void *)&long long v12 = a4;
  *((void *)&v12 + 1) = a5;
  a6[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v7 = (void *)(a6[6] + 16 * a1);
  *uint64_t v7 = a2;
  v7[1] = a3;
  id result = sub_1E4497328(&v12, (_OWORD *)(a6[7] + 32 * a1));
  uint64_t v9 = a6[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a6[2] = v11;
  }
  return result;
}

_OWORD *sub_1E44F6484(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&long long v11 = a4;
  uint64_t v12 = MEMORY[0x1E4FBB550];
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  id result = sub_1E4497328(&v11, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

_OWORD *sub_1E44F6508(unint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  LOBYTE(v11) = a4;
  uint64_t v12 = MEMORY[0x1E4FBB390];
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  id result = sub_1E4497328(&v11, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

_OWORD *sub_1E44F658C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v19 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v13 = (void *)(a5[6] + 16 * a1);
  *uint64_t v13 = a2;
  v13[1] = a3;
  id result = sub_1E4497328(&v18, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v15 = a5[2];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    a5[2] = v17;
  }
  return result;
}

uint64_t sub_1E44F6660()
{
  uint64_t v1 = sub_1E451B668();
  v0[70] = v1;
  v0[71] = *(void *)(v1 - 8);
  v0[72] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44F6748, 0, 0);
}

uint64_t sub_1E44F6748()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5958);
  uint64_t inited = swift_initStackObject();
  v0[73] = inited;
  *(_OWORD *)(inited + 16) = xmmword_1E4520CE0;
  *(void *)(inited + 32) = sub_1E451B868();
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 4_Block_object_dispose(&STACK[0x240], 8) = sub_1E451B868();
  *(void *)(inited + 56) = v3;
  *(void *)(inited + 64) = sub_1E451B868();
  *(void *)(inited + 72) = v4;
  *(void *)(inited + 80) = sub_1E451B868();
  *(void *)(inited + 8_Block_object_dispose(&STACK[0x240], 8) = v5;
  *(void *)(inited + 96) = sub_1E451B868();
  *(void *)(inited + 104) = v6;
  *(void *)(inited + 112) = sub_1E451B868();
  *(void *)(inited + 120) = v7;
  *(void *)(inited + 12_Block_object_dispose(&STACK[0x240], 8) = sub_1E451B868();
  *(void *)(inited + 136) = v8;
  *(void *)(inited + 144) = sub_1E451B868();
  *(void *)(inited + 152) = v9;
  *(void *)(inited + 160) = sub_1E451B868();
  *(void *)(inited + 16_Block_object_dispose(&STACK[0x240], 8) = v10;
  *(void *)(inited + 176) = sub_1E451B868();
  *(void *)(inited + 184) = v11;
  *(void *)(inited + 192) = sub_1E451B868();
  *(void *)(inited + 200) = v12;
  *(void *)(inited + 20_Block_object_dispose(&STACK[0x240], 8) = sub_1E451B868();
  *(void *)(inited + 216) = v13;
  *(void *)(inited + 224) = sub_1E451B868();
  *(void *)(inited + 232) = v14;
  *(void *)(inited + 240) = sub_1E451B868();
  *(void *)(inited + 24_Block_object_dispose(&STACK[0x240], 8) = v15;
  *(void *)(inited + 256) = sub_1E451B868();
  *(void *)(inited + 264) = v16;
  *(void *)(inited + 272) = sub_1E451B868();
  *(void *)(inited + 280) = v17;
  uint64_t v18 = sub_1E451B868();
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v21 = (char *)inited;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v21 = sub_1E44F357C(0, 17, 1, (char *)inited);
  }
  unint64_t v23 = *((void *)v21 + 2);
  unint64_t v22 = *((void *)v21 + 3);
  if (v23 >= v22 >> 1) {
    unint64_t v21 = sub_1E44F357C((char *)(v22 > 1), v23 + 1, 1, v21);
  }
  v0[74] = v21;
  *((void *)v21 + 2) = v23 + 1;
  unint64_t v24 = &v21[16 * v23];
  *((void *)v24 + 4) = v18;
  *((void *)v24 + 5) = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[75] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA60]), sel_initWithCapacity_, *((void *)v21 + 2));
  uint64_t v25 = *((void *)v21 + 2);
  v0[76] = v25;
  if (v25)
  {
    uint64_t v26 = self;
    v0[77] = v26;
    v0[78] = 0;
    uint64_t v27 = v0[74];
    v0[79] = *(void *)(v27 + 32);
    v0[80] = *(void *)(v27 + 40);
    id v28 = objc_allocWithZone((Class)TPSDeviceCapability);
    swift_bridgeObjectRetain();
    id v29 = objc_msgSend(v28, sel_init);
    v0[81] = v29;
    objc_msgSend(v29, sel_setType_, 2);
    id v30 = v29;
    uint64_t v31 = (void *)sub_1E451B858();
    objc_msgSend(v30, sel_setKey_, v31);

    id v32 = objc_msgSend(v26, sel_targetValidationForCapability_, v30);
    v0[82] = v32;
    v0[2] = v0;
    v0[7] = v0 + 55;
    v0[3] = sub_1E44F6BF8;
    uint64_t v33 = swift_continuation_init();
    v0[46] = MEMORY[0x1E4F143A8];
    v0[47] = 0x40000000;
    v0[48] = sub_1E44F30D4;
    v0[49] = &block_descriptor;
    v0[50] = v33;
    objc_msgSend(v32, sel_getCurrentStateWithCompletion_, v0 + 46);
    return MEMORY[0x1F41881E8](v0 + 2);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    BOOL v34 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v35 = v0[75];
    return v34(v35);
  }
}

uint64_t sub_1E44F6BF8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 664) = v1;
  if (v1) {
    uint64_t v2 = sub_1E44F70D8;
  }
  else {
    uint64_t v2 = sub_1E44F6D34;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44F6D34()
{
  sub_1E4497328((_OWORD *)(v0 + 440), (_OWORD *)(v0 + 408));
  sub_1E44ED660(v0 + 408, v0 + 472);
  sub_1E449AE1C(0, &qword_1EBFF58C8);
  if (swift_dynamicCast())
  {
    uint64_t v1 = *(void **)(v0 + 648);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    __swift_destroy_boxed_opaque_existential_1(v0 + 408);
  }
  else
  {
    uint64_t v2 = *(void **)(v0 + 648);
    uint64_t v3 = *(void *)(v0 + 640);
    uint64_t v4 = *(void *)(v0 + 632);
    uint64_t v5 = *(void **)(v0 + 600);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 408), *(void *)(v0 + 432));
    uint64_t v6 = sub_1E451BDD8();
    *(void *)(v0 + 536) = v4;
    *(void *)(v0 + 544) = v3;
    swift_bridgeObjectRetain();
    objc_msgSend(v5, sel___swift_setObject_forKeyedSubscript_, v6, sub_1E451BE38());

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 408);
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = *(void *)(v0 + 624) + 1;
  if (v7 == *(void *)(v0 + 608))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v9 = *(void *)(v0 + 600);
    return v8(v9);
  }
  else
  {
    *(void *)(v0 + 624) = v7;
    uint64_t v11 = *(void **)(v0 + 616);
    uint64_t v12 = *(void *)(v0 + 592) + 16 * v7;
    *(void *)(v0 + 632) = *(void *)(v12 + 32);
    *(void *)(v0 + 640) = *(void *)(v12 + 40);
    id v13 = objc_allocWithZone((Class)TPSDeviceCapability);
    swift_bridgeObjectRetain();
    id v14 = objc_msgSend(v13, sel_init);
    *(void *)(v0 + 64_Block_object_dispose(&STACK[0x240], 8) = v14;
    objc_msgSend(v14, sel_setType_, 2);
    id v15 = v14;
    uint64_t v16 = (void *)sub_1E451B858();
    objc_msgSend(v15, sel_setKey_, v16);

    id v17 = objc_msgSend(v11, sel_targetValidationForCapability_, v15);
    *(void *)(v0 + 656) = v17;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 440;
    *(void *)(v0 + 24) = sub_1E44F6BF8;
    uint64_t v18 = swift_continuation_init();
    *(void *)(v0 + 36_Block_object_dispose(&STACK[0x240], 8) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 376) = 0x40000000;
    *(void *)(v0 + 384) = sub_1E44F30D4;
    *(void *)(v0 + 392) = &block_descriptor;
    *(void *)(v0 + 400) = v18;
    objc_msgSend(v17, sel_getCurrentStateWithCompletion_, v0 + 368);
    return MEMORY[0x1F41881E8](v0 + 16);
  }
}

uint64_t sub_1E44F70D8()
{
  uint64_t v1 = (void *)v0[83];
  uint64_t v2 = v0[72];
  uint64_t v3 = v0[71];
  uint64_t v16 = (void *)v0[81];
  uint64_t v17 = v0[70];
  swift_willThrow();
  sub_1E451B628();
  v0[63] = 0;
  v0[64] = 0xE000000000000000;
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  v0[65] = 0xD00000000000001DLL;
  v0[66] = 0x80000001E4527A60;
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B738();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v17);
  uint64_t v4 = v0[78] + 1;
  if (v4 == v0[76])
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v6 = v0[75];
    return v5(v6);
  }
  else
  {
    v0[78] = v4;
    uint64_t v8 = (void *)v0[77];
    uint64_t v9 = v0[74] + 16 * v4;
    v0[79] = *(void *)(v9 + 32);
    v0[80] = *(void *)(v9 + 40);
    id v10 = objc_allocWithZone((Class)TPSDeviceCapability);
    swift_bridgeObjectRetain();
    id v11 = objc_msgSend(v10, sel_init);
    v0[81] = v11;
    objc_msgSend(v11, sel_setType_, 2);
    id v12 = v11;
    id v13 = (void *)sub_1E451B858();
    objc_msgSend(v12, sel_setKey_, v13);

    id v14 = objc_msgSend(v8, sel_targetValidationForCapability_, v12);
    v0[82] = v14;
    v0[2] = v0;
    v0[7] = v0 + 55;
    v0[3] = sub_1E44F6BF8;
    uint64_t v15 = swift_continuation_init();
    v0[46] = MEMORY[0x1E4F143A8];
    v0[47] = 0x40000000;
    v0[48] = sub_1E44F30D4;
    v0[49] = &block_descriptor;
    v0[50] = v15;
    objc_msgSend(v14, sel_getCurrentStateWithCompletion_, v0 + 46);
    return MEMORY[0x1F41881E8](v0 + 2);
  }
}

uint64_t sub_1E44F7428(uint64_t a1)
{
  v1[96] = a1;
  uint64_t v2 = sub_1E451B668();
  v1[97] = v2;
  v1[98] = *(void *)(v2 - 8);
  v1[99] = swift_task_alloc();
  uint64_t v3 = sub_1E451B2B8();
  v1[100] = v3;
  v1[101] = *(void *)(v3 - 8);
  v1[102] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52C8);
  v1[103] = swift_task_alloc();
  v1[104] = swift_task_alloc();
  v1[105] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44F7590, 0, 0);
}

id sub_1E44F7590()
{
  uint64_t v94 = v0;
  unint64_t v1 = sub_1E44E2C00(MEMORY[0x1E4FBC860]);
  uint64_t v2 = self;
  *(unsigned char *)(v0 + 144) = objc_msgSend(v2, sel_isSeniorUser);
  *(void *)(v0 + 16_Block_object_dispose(&STACK[0x240], 8) = MEMORY[0x1E4FBB390];
  sub_1E4497328((_OWORD *)(v0 + 144), (_OWORD *)(v0 + 176));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v1;
  *(void *)(v0 + 744) = 0x8000000000000000;
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 176, v4);
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = (char *)swift_task_alloc();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v7, v5, v4);
  sub_1E44F587C(*v7, 3487349, 0xE300000000000000, isUniquelyReferenced_nonNull_native, v93);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  swift_task_dealloc();
  uint64_t v8 = v93[0];
  swift_bridgeObjectRelease();
  id v90 = v2;
  id result = objc_msgSend(v2, sel_sharedInstance);
  if (!result)
  {
    __break(1u);
    goto LABEL_23;
  }
  id v10 = result;
  id v11 = *(void **)(v0 + 768);
  id v12 = objc_msgSend(result, sel_userType);

  *(void *)(v0 + 232) = MEMORY[0x1E4FBB550];
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x240], 8) = v12;
  sub_1E4497328((_OWORD *)(v0 + 208), (_OWORD *)(v0 + 240));
  LOBYTE(v12) = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v8;
  uint64_t v13 = *(void *)(v0 + 264);
  uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 240, v13);
  uint64_t v15 = *(void *)(v13 - 8);
  uint64_t v16 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 16))(v16, v14, v13);
  sub_1E44F5A98(*v16, 0x6570795472657375, 0xE800000000000000, (char)v12, v93);
  __swift_destroy_boxed_opaque_existential_1(v0 + 240);
  swift_task_dealloc();
  uint64_t v17 = v93[0];
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v11, sel_experiment);
  id v19 = objc_msgSend(v18, sel_camp);

  *(void *)(v0 + 296) = MEMORY[0x1E4FBB550];
  *(void *)(v0 + 272) = v19;
  sub_1E4497328((_OWORD *)(v0 + 272), (_OWORD *)(v0 + 304));
  LOBYTE(v15) = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v17;
  uint64_t v20 = *(void *)(v0 + 328);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 304, v20);
  uint64_t v22 = *(void *)(v20 - 8);
  unint64_t v23 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v22 + 16))(v23, v21, v20);
  sub_1E44F5A98(*v23, 0x656D697265707865, 0xEE00706D6143746ELL, v15, v93);
  __swift_destroy_boxed_opaque_existential_1(v0 + 304);
  swift_task_dealloc();
  *(void *)(v0 + 744) = v93[0];
  swift_bridgeObjectRelease();
  id result = objc_msgSend(v90, sel_sharedInstance);
  if (!result)
  {
LABEL_23:
    __break(1u);
    return result;
  }
  unint64_t v24 = result;
  id v25 = objc_msgSend(result, sel_lastMajorVersionUpdateDate);

  uint64_t v91 = (_OWORD *)(v0 + 432);
  if (v25)
  {
    sub_1E451B2A8();

    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
  }
  uint64_t v27 = *(void *)(v0 + 840);
  uint64_t v28 = *(void *)(v0 + 832);
  uint64_t v29 = *(void *)(v0 + 808);
  uint64_t v30 = *(void *)(v0 + 800);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v28, v26, 1, v30);
  sub_1E44F8670(v28, v27);
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
  int v32 = v31(v27, 1, v30);
  uint64_t v33 = *(void *)(v0 + 840);
  uint64_t v87 = v31;
  if (v32 == 1)
  {
    sub_1E44DD780(v33, &qword_1EBFF52C8);
    sub_1E44F37A4(0xD00000000000001CLL, 0x80000001E4527990, (_OWORD *)(v0 + 368));
    sub_1E44DD780(v0 + 368, &qword_1EAE48580);
    uint64_t v34 = *(void *)(v0 + 744);
  }
  else
  {
    uint64_t v35 = *(void *)(v0 + 808);
    uint64_t v36 = *(void *)(v0 + 800);
    *(void *)(v0 + 360) = v36;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 336));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v35 + 32))(boxed_opaque_existential_1, v33, v36);
    sub_1E4497328((_OWORD *)(v0 + 336), (_OWORD *)(v0 + 496));
    uint64_t v38 = *(void *)(v0 + 744);
    char v39 = swift_isUniquelyReferenced_nonNull_native();
    v93[0] = v38;
    *(void *)(v0 + 744) = 0x8000000000000000;
    uint64_t v40 = *(void *)(v0 + 520);
    uint64_t v41 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 496, v40);
    uint64_t v42 = *(void *)(v40 - 8);
    uint64_t v43 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v43, v41, v40);
    sub_1E44F6104(v43, 0xD00000000000001CLL, 0x80000001E4527990, v39, v93, v36);
    __swift_destroy_boxed_opaque_existential_1(v0 + 496);
    swift_task_dealloc();
    uint64_t v34 = v93[0];
    swift_bridgeObjectRelease();
  }
  uint64_t v89 = (_OWORD *)(v0 + 560);
  long long v44 = (unint64_t *)(v0 + 752);
  unint64_t v88 = (id *)(v0 + 760);
  long long v45 = *(void **)(v0 + 768);
  id v46 = objc_msgSend(self, sel_tps_userLanguageCode);
  uint64_t v47 = sub_1E451B868();
  uint64_t v49 = v48;

  *(void *)(v0 + 424) = MEMORY[0x1E4FBB1A0];
  *(void *)(v0 + 400) = v47;
  *(void *)(v0 + 40_Block_object_dispose(&STACK[0x240], 8) = v49;
  sub_1E4497328((_OWORD *)(v0 + 400), v91);
  LOBYTE(v49) = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v34;
  uint64_t v50 = *(void *)(v0 + 456);
  uint64_t v51 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)v91, v50);
  uint64_t v52 = *(void *)(v50 - 8);
  unint64_t v53 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v52 + 16))(v53, v51, v50);
  sub_1E44F5CB4(*v53, v53[1], 0xD00000000000001ALL, 0x80000001E45279B0, v49, v93);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
  swift_task_dealloc();
  *(void *)(v0 + 744) = v93[0];
  swift_bridgeObjectRelease();
  id v54 = objc_msgSend(v45, sel_tipStatusController);
  id v55 = objc_msgSend(v54, sel_tipStatusMap);

  if (v55)
  {
    sub_1E449AE1C(0, &qword_1EBFF58A8);
    uint64_t v56 = sub_1E451B818();
  }
  else
  {
    uint64_t v56 = 0;
  }
  unint64_t v57 = sub_1E44E2D68(MEMORY[0x1E4FBC860]);
  *long long v44 = v57;
  *unint64_t v88 = 0;
  if (v56)
  {
    sub_1E44F2268(v56, v88, (uint64_t *)(v0 + 752));
    swift_bridgeObjectRelease();
    unint64_t v58 = *v44;
    id v59 = *v88;
  }
  else
  {
    unint64_t v58 = v57;
    id v59 = 0;
  }
  *(void *)(v0 + 552) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5840);
  *(void *)(v0 + 52_Block_object_dispose(&STACK[0x240], 8) = v58;
  sub_1E4497328((_OWORD *)(v0 + 528), v89);
  swift_bridgeObjectRetain();
  uint64_t v60 = *(void *)(v0 + 744);
  char v61 = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v60;
  uint64_t v62 = *(void *)(v0 + 584);
  uint64_t v63 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)v89, v62);
  uint64_t v64 = *(void *)(v62 - 8);
  char v65 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v64 + 16))(v65, v63, v62);
  sub_1E44F5ED0(*v65, 0x626967696C656E69, 0xEE0073706954656CLL, v61, v93, &qword_1EBFF5840);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
  swift_task_dealloc();
  *(void *)(v0 + 744) = v93[0];
  swift_bridgeObjectRelease();
  if (v59)
  {
    uint64_t v66 = *(void *)(v0 + 824);
    uint64_t v67 = *(void *)(v0 + 800);
    id v68 = v59;
    sub_1E44F2D64(v66);
    int v69 = v87(v66, 1, v67);
    uint64_t v70 = *(void *)(v0 + 824);
    if (v69 == 1)
    {

      sub_1E44DD780(v70, &qword_1EBFF52C8);
    }
    else
    {
      id v71 = *(void **)(v0 + 816);
      uint64_t v72 = *(void *)(v0 + 808);
      uint64_t v73 = *(void *)(v0 + 800);
      id v92 = v71;
      (*(void (**)(void *, uint64_t, uint64_t))(v72 + 32))(v71, v70, v73);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BE8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1E4520CF0;
      *(void *)(inited + 32) = 0x4449706974;
      *(void *)(inited + 40) = 0xE500000000000000;
      id v75 = objc_msgSend(v68, sel_correlationIdentifier);
      uint64_t v76 = sub_1E451B868();
      uint64_t v78 = v77;

      *(void *)(inited + 4_Block_object_dispose(&STACK[0x240], 8) = v76;
      *(void *)(inited + 56) = v78;
      *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
      strcpy((char *)(inited + 80), "displayedDate");
      *(_WORD *)(inited + 94) = -4864;
      *(void *)(inited + 120) = v73;
      uint64_t v79 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 96));
      (*(void (**)(uint64_t *, void *, uint64_t))(v72 + 16))(v79, v71, v73);
      unint64_t v80 = sub_1E44E2C00(inited);
      *(void *)(v0 + 712) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5850);
      *(void *)(v0 + 68_Block_object_dispose(&STACK[0x240], 8) = v80;
      sub_1E4497328((_OWORD *)(v0 + 688), (_OWORD *)(v0 + 464));
      uint64_t v81 = *(void *)(v0 + 744);
      LOBYTE(v80) = swift_isUniquelyReferenced_nonNull_native();
      v93[0] = v81;
      uint64_t v82 = *(void *)(v0 + 488);
      uint64_t v83 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 464, v82);
      uint64_t v84 = *(void *)(v82 - 8);
      uint64_t v85 = (uint64_t *)swift_task_alloc();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v84 + 16))(v85, v83, v82);
      sub_1E44F5ED0(*v85, 0xD000000000000010, 0x80000001E4527A20, v80, v93, &qword_1EBFF5850);
      __swift_destroy_boxed_opaque_existential_1(v0 + 464);
      swift_task_dealloc();
      *(void *)(v0 + 744) = v93[0];
      swift_bridgeObjectRelease();

      (*(void (**)(id, uint64_t))(v72 + 8))(v92, v73);
    }
  }
  uint64_t v86 = (void *)swift_task_alloc();
  *(void *)(v0 + 84_Block_object_dispose(&STACK[0x240], 8) = v86;
  *uint64_t v86 = v0;
  v86[1] = sub_1E44F81CC;
  return (id)sub_1E44F6660();
}

uint64_t sub_1E44F81CC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 856) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1E44F82CC, 0, 0);
}

uint64_t sub_1E44F82CC()
{
  uint64_t v12 = v0;
  uint64_t v10 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5988);
  sub_1E451B808();
  sub_1E44F37A4(0xD000000000000012, 0x80000001E45279D0, (_OWORD *)(v0 + 624));
  sub_1E44DD780(v0 + 624, &qword_1EAE48580);
  uint64_t v1 = *(void **)(v0 + 856);
  uint64_t v2 = *(void *)(v0 + 792);
  uint64_t v3 = *(void *)(v0 + 784);
  uint64_t v4 = *(void *)(v0 + 776);
  sub_1E451B628();
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_1E451BC08();
  unint64_t v5 = v11;
  *(void *)(v0 + 720) = v10;
  *(void *)(v0 + 72_Block_object_dispose(&STACK[0x240], 8) = v5;
  sub_1E451B8C8();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 736) = v6;
  sub_1E451BCB8();

  sub_1E451B728();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v7 = *(void *)(v0 + 744);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1E44F8670(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1E44F86DC()
{
  unint64_t result = qword_1EAE48598;
  if (!qword_1EAE48598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48598);
  }
  return result;
}

unint64_t sub_1E44F8734()
{
  unint64_t result = qword_1EAE485A0[0];
  if (!qword_1EAE485A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EAE485A0);
  }
  return result;
}

unint64_t sub_1E44F878C()
{
  unint64_t result = qword_1EBFF51D0;
  if (!qword_1EBFF51D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51D0);
  }
  return result;
}

uint64_t sub_1E44F87E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5158);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v33 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1E451B108();
  uint64_t v4 = *(void *)(v32 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v32);
  uint64_t v31 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v30 = (char *)&v27 - v7;
  uint64_t v29 = sub_1E451B6D8();
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E451B6B8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v17 = self;
  swift_bridgeObjectRetain();
  objc_msgSend(v17, sel_isPhoneUI);
  sub_1E451B6A8();
  id v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v28 = v10;
  v18(v14, v16, v10);
  swift_bridgeObjectRetain();
  sub_1E451B6C8();
  id v19 = objc_msgSend(*(id *)(v1 + 16), sel_displayName);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_1E451B868();
  }
  uint64_t v21 = v30;
  sub_1E451B0E8();
  uint64_t v22 = v29;
  v35[3] = v29;
  v35[4] = sub_1E44F9A08(&qword_1EBFF5220);
  v35[5] = sub_1E44F9A08(&qword_1EBFF5218);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
  uint64_t v24 = v27;
  (*(void (**)(uint64_t *, char *, uint64_t))(v27 + 16))(boxed_opaque_existential_1, v9, v22);
  uint64_t v25 = v32;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v31, v21, v32);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v33, 1, 1, v25);
  sub_1E451AF08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v25);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v28);
}

uint64_t sub_1E44F8C40()
{
  return sub_1E44F99F4(*(uint64_t (**)(uint64_t))(v0 + 8), v0, MEMORY[0x1E4FBC860]);
}

uint64_t sub_1E44F8C80(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1E44F8CA0, 0, 0);
}

uint64_t sub_1E44F8CA0()
{
  **(void **)(v0 + 16) = MEMORY[0x1E4FBC860];
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1E44F8CCC()
{
  unint64_t result = qword_1EAE485B8;
  if (!qword_1EAE485B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE485B8);
  }
  return result;
}

unint64_t sub_1E44F8D24()
{
  unint64_t result = qword_1EBFF51D8;
  if (!qword_1EBFF51D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51D8);
  }
  return result;
}

unint64_t sub_1E44F8D7C()
{
  unint64_t result = qword_1EAE485C0;
  if (!qword_1EAE485C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EAE485C8);
    sub_1E44F8D24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE485C0);
  }
  return result;
}

uint64_t sub_1E44F8DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1E44F934C();
  *uint64_t v5 = v2;
  v5[1] = sub_1E44AE0C8;
  return MEMORY[0x1F40D3D68](a1, a2, v6);
}

uint64_t sub_1E44F8EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1E44AE0C8;
  return MEMORY[0x1F40D46A0](a1, a2, a3);
}

uint64_t sub_1E44F8F60()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5158);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1E451B0F8();
  uint64_t v3 = *(void *)(v12[0] - 8);
  MEMORY[0x1F4188790](v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E451B338();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v7 = sub_1E451B848();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = sub_1E451B108();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = sub_1E451AF68();
  __swift_allocate_value_buffer(v10, qword_1EBFF7330);
  __swift_project_value_buffer(v10, (uint64_t)qword_1EBFF7330);
  sub_1E451B838();
  sub_1E451B2F8();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x1E4F275D0], v12[0]);
  sub_1E451B118();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1E451AF58();
}

id sub_1E44F9238()
{
  return *(id *)(v0 + 16);
}

unint64_t sub_1E44F9244()
{
  unint64_t result = qword_1EBFF51C0;
  if (!qword_1EBFF51C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51C0);
  }
  return result;
}

unint64_t sub_1E44F929C()
{
  unint64_t result = qword_1EBFF51E0;
  if (!qword_1EBFF51E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51E0);
  }
  return result;
}

unint64_t sub_1E44F92F4()
{
  unint64_t result = qword_1EBFF5208;
  if (!qword_1EBFF5208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5208);
  }
  return result;
}

unint64_t sub_1E44F934C()
{
  unint64_t result = qword_1EAE485E0;
  if (!qword_1EAE485E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE485E0);
  }
  return result;
}

uint64_t sub_1E44F93A0()
{
  return MEMORY[0x1E4F188B0];
}

unint64_t sub_1E44F93B0()
{
  unint64_t result = qword_1EBFF51E8;
  if (!qword_1EBFF51E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51E8);
  }
  return result;
}

unint64_t sub_1E44F9408()
{
  unint64_t result = qword_1EBFF51F0;
  if (!qword_1EBFF51F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51F0);
  }
  return result;
}

unint64_t sub_1E44F9460()
{
  unint64_t result = qword_1EBFF51F8;
  if (!qword_1EBFF51F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51F8);
  }
  return result;
}

uint64_t sub_1E44F94B4@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBFF51B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E451AF68();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBFF7330);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1E44F9560()
{
  unint64_t result = qword_1EAE485E8;
  if (!qword_1EAE485E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE485F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE485E8);
  }
  return result;
}

uint64_t sub_1E44F95BC(uint64_t a1)
{
  unint64_t v2 = sub_1E44F878C();

  return MEMORY[0x1F40D3BC8](a1, v2);
}

unint64_t sub_1E44F960C()
{
  unint64_t result = qword_1EBFF5200;
  if (!qword_1EBFF5200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5200);
  }
  return result;
}

uint64_t sub_1E44F9664(uint64_t a1)
{
  unint64_t v2 = sub_1E44F9460();

  return MEMORY[0x1F40D4970](a1, v2);
}

ValueMetadata *type metadata accessor for SpotlightIndexedEntity.IndexEntityQuery()
{
  return &type metadata for SpotlightIndexedEntity.IndexEntityQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for SpotlightIndexedEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SpotlightIndexedEntity(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SpotlightIndexedEntity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRetain();
  id v7 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SpotlightIndexedEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for SpotlightIndexedEntity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpotlightIndexedEntity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SpotlightIndexedEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x240], 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 4_Block_object_dispose(&STACK[0x240], 8) = 1;
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
      *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 4_Block_object_dispose(&STACK[0x240], 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SpotlightIndexedEntity()
{
  return &type metadata for SpotlightIndexedEntity;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_1E44F99F4(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1E44F9A08(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1E451B6D8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E44F9A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[35] = a4;
  v5[36] = v4;
  v5[33] = a2;
  v5[34] = a3;
  v5[32] = a1;
  uint64_t v6 = sub_1E451B668();
  v5[37] = v6;
  v5[38] = *(void *)(v6 - 8);
  v5[39] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44F9B14, 0, 0);
}

uint64_t sub_1E44F9B14()
{
  uint64_t v1 = *(int **)(v0 + 272);
  objc_msgSend(*(id *)(v0 + 288), sel_beginIndexBatch);
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v2;
  *unint64_t v2 = v0;
  v2[1] = sub_1E44F9BF8;
  uint64_t v3 = *(void *)(v0 + 288);
  return v5(v3);
}

uint64_t sub_1E44F9BF8()
{
  *(void *)(*(void *)v1 + 32_Block_object_dispose(&STACK[0x240], 8) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1E44F9F94;
  }
  else {
    unint64_t v2 = sub_1E44F9D0C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44F9D0C()
{
  uint64_t v1 = (void *)v0[36];
  uint64_t v2 = sub_1E451B248();
  v0[42] = v2;
  v0[10] = v0;
  v0[11] = sub_1E44F9E14;
  uint64_t v3 = swift_continuation_init();
  v0[23] = MEMORY[0x1E4F143A8];
  v0[24] = 0x40000000;
  v0[25] = sub_1E44FBA50;
  v0[26] = &block_descriptor_2;
  v0[27] = v3;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v2, v0 + 23);
  return MEMORY[0x1F41881E8](v0 + 10);
}

uint64_t sub_1E44F9E14()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 344) = v1;
  if (v1) {
    uint64_t v2 = sub_1E44FA380;
  }
  else {
    uint64_t v2 = sub_1E44F9F24;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44F9F24()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44F9F94()
{
  uint64_t v1 = v0[38];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[37];
  id v7 = (id)v0[36];
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1E451BE68();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  uint64_t v4 = sub_1E451B248();
  v0[44] = v4;
  v0[2] = v0;
  v0[3] = sub_1E44FA170;
  uint64_t v5 = swift_continuation_init();
  v0[18] = MEMORY[0x1E4F143A8];
  v0[19] = 0x40000000;
  v0[20] = sub_1E44FBA50;
  v0[21] = &block_descriptor_0;
  v0[22] = v5;
  objc_msgSend(v7, sel_endIndexBatchWithClientState_completionHandler_, v4, v0 + 18);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E44FA170()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 360) = v1;
  if (v1) {
    uint64_t v2 = sub_1E44FA2FC;
  }
  else {
    uint64_t v2 = sub_1E44FA280;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44FA280()
{
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44FA2FC()
{
  uint64_t v1 = (void *)v0[44];
  uint64_t v2 = (void *)v0[41];
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1E44FA380()
{
  uint64_t v1 = *(void **)(v0 + 336);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E44FA3F8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5910);
    uint64_t v2 = sub_1E451BD18();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1E44ED660(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1E4497328(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1E4497328(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1E4497328(v36, v37);
    sub_1E4497328(v37, &v33);
    uint64_t result = sub_1E451BBA8();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1E4497328(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1E44E1E84();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_1E44FA96C(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR___TPSContextualEventBuilder_eventType];
  *(void *)uint64_t v3 = 0;
  v3[8] = 1;
  uint64_t v4 = &v1[OBJC_IVAR___TPSContextualEventBuilder_stream];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v1[OBJC_IVAR___TPSContextualEventBuilder_dictionary] = a1;
  unint64_t v5 = self;
  uint64_t v6 = v1;
  swift_bridgeObjectRetain();
  id v7 = (void *)sub_1E451B7F8();
  id v8 = objc_msgSend(v5, sel_typeFromEventDictionary_, v7);

  *(void *)uint64_t v3 = v8;
  v3[8] = 0;
  if (!*(void *)(a1 + 16) || (unint64_t v9 = sub_1E4496570(0x6D6165727473, 0xE600000000000000), (v10 & 1) == 0))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1E44ED660(*(void *)(a1 + 56) + 32 * v9, (uint64_t)&v18);
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1))
  {
LABEL_7:
    sub_1E44FAEF8((uint64_t)&v18);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  int v11 = swift_dynamicCast();
  uint64_t v12 = v15;
  uint64_t v13 = v16;
  if (!v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
LABEL_8:
  *(void *)uint64_t v4 = v12;
  *((void *)v4 + 1) = v13;

  swift_bridgeObjectRelease();
  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for TipsContextualEventBuilder();
  return objc_msgSendSuper2(&v17, sel_init);
}

id sub_1E44FAB54()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_eventType + 8)) {
    return 0;
  }
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_eventType);
  switch(v2)
  {
    case 0:
      uint64_t v5 = *(void *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_stream);
      uint64_t v6 = *(void *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_stream + 8);
      uint64_t v7 = sub_1E451B868();
      if (!v6)
      {
        swift_bridgeObjectRelease();
        return 0;
      }
      if (v5 == v7 && v6 == v8)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v10 = sub_1E451BDE8();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0) {
          return 0;
        }
      }
      uint64_t v15 = self;
      uint64_t v16 = swift_bridgeObjectRetain();
      sub_1E44FA3F8(v16);
      swift_bridgeObjectRelease();
      objc_super v17 = (void *)sub_1E451B7F8();
      swift_bridgeObjectRelease();
      id v1 = objc_msgSend(v15, sel_contextualBiomeEventFromDuetEventDictionary_, v17);

      return v1;
    case 3:
      uint64_t v11 = swift_bridgeObjectRetain();
      sub_1E44FA3F8(v11);
      swift_bridgeObjectRelease();
      uint64_t v4 = (objc_class *)MEMORY[0x1E4FAF420];
      goto LABEL_15;
    case 2:
      uint64_t v3 = swift_bridgeObjectRetain();
      sub_1E44FA3F8(v3);
      swift_bridgeObjectRelease();
      uint64_t v4 = (objc_class *)MEMORY[0x1E4FAF438];
LABEL_15:
      id v12 = objc_allocWithZone(v4);
      uint64_t v13 = (void *)sub_1E451B7F8();
      swift_bridgeObjectRelease();
      id v1 = objc_msgSend(v12, sel_initWithDictionary_, v13);

      return v1;
  }
  return 0;
}

id TipsContextualEventBuilder.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void TipsContextualEventBuilder.init()()
{
}

id TipsContextualEventBuilder.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsContextualEventBuilder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TipsContextualEventBuilder()
{
  return self;
}

uint64_t method lookup function for TipsContextualEventBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TipsContextualEventBuilder);
}

uint64_t sub_1E44FAEF8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E44FAF58(uint64_t a1, uint64_t a2)
{
  return sub_1E44FAF80(a1, a2, (void (*)(void))sub_1E45040A8);
}

uint64_t sub_1E44FAF80(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4 = sub_1E451B668();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(self, sel_standardUserDefaults);
  *(void *)&v19[0] = 0xD00000000000001ELL;
  *((void *)&v19[0] + 1) = 0x80000001E4527D90;
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  unint64_t v9 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_objectForKey_, v9);

  if (v10)
  {
    sub_1E451BB78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v19, 0, sizeof(v19));
  }
  sub_1E4503B0C((uint64_t)v19, (uint64_t)v20);
  if (v20[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v12 = v17;
      unint64_t v11 = v18;
      switch(v18 >> 62)
      {
        case 1uLL:
          uint64_t v13 = (int)v17;
          uint64_t v14 = v17 >> 32;
          goto LABEL_12;
        case 2uLL:
          uint64_t v13 = *(void *)(v17 + 16);
          uint64_t v14 = *(void *)(v17 + 24);
LABEL_12:
          if (v13 == v14) {
            goto LABEL_13;
          }
          goto LABEL_8;
        case 3uLL:
          goto LABEL_13;
        default:
          if ((v18 & 0xFF000000000000) != 0)
          {
LABEL_8:
            sub_1E451AFD8();
            swift_allocObject();
            sub_1E451AFC8();
            a3();
            sub_1E451AFB8();
            sub_1E4496E64(v12, v11);
            swift_release();
            return LOWORD(v20[0]);
          }
LABEL_13:
          sub_1E4496E64(v17, v18);
          break;
      }
    }
  }
  else
  {
    sub_1E44DD780((uint64_t)v20, &qword_1EBFF5990);
  }
  sub_1E451B648();
  sub_1E451B718();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

uint64_t sub_1E44FB384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E44FB3AC(a1, a2, a3, a4, (void (*)(void))sub_1E4504054);
}

uint64_t sub_1E44FB3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v13 = sub_1E451B668();
  MEMORY[0x1F4188790](v13);
  sub_1E451B008();
  swift_allocObject();
  sub_1E451AFF8();
  a5();
  uint64_t v6 = sub_1E451AFE8();
  unint64_t v8 = v7;
  swift_release();
  id v9 = objc_msgSend(self, sel_standardUserDefaults);
  id v10 = (void *)sub_1E451B248();
  sub_1E451B8C8();
  unint64_t v11 = (void *)sub_1E451B858();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setObject_forKey_, v10, v11);

  return sub_1E4496E64(v6, v8);
}

uint64_t sub_1E44FB67C(uint64_t a1, uint64_t a2)
{
  return sub_1E44FB694(a1, a2, (uint64_t (*)(uint64_t, uint64_t))sub_1E449503C);
}

uint64_t sub_1E44FB694(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1E451B668();
  MEMORY[0x1F4188790](v6);
  swift_bridgeObjectRetain();
  uint64_t v7 = a3(a1, a2);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_1E451B008();
  swift_allocObject();
  sub_1E451AFF8();
  sub_1E4503AB8();
  uint64_t v10 = sub_1E451AFE8();
  swift_release();
  sub_1E4496E64(v7, v9);
  return v10;
}

uint64_t sub_1E44FB8B8(uint64_t a1)
{
  uint64_t result = sub_1E451BA78();
  int64_t v3 = 0;
  uint64_t v18 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1E4501B30(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1E44FBA50(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x1F4188208](v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1E44FBAE8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  if (v0) {
    uint64_t v4 = sub_1E44FBF84;
  }
  else {
    uint64_t v4 = sub_1E44FBC14;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

id sub_1E44FBC14()
{
  uint64_t v1 = *(void *)(v0 + 176);
  if (v1 == *(void *)(v0 + 152))
  {
    *(void *)(v0 + 200) = *(void *)(v0 + 160);
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 20_Block_object_dispose(&STACK[0x240], 8) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_1E44FBD88;
    uint64_t v3 = *(void *)(v0 + 88);
    return (id)sub_1E44FE1A4(v3);
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 88);
    if ((v5 & 0xC000000000000001) != 0) {
      id result = (id)MEMORY[0x1E4E804B0](*(void *)(v0 + 176));
    }
    else {
      id result = *(id *)(v5 + 8 * v1 + 32);
    }
    uint64_t v6 = (uint64_t)result;
    *(void *)(v0 + 16_Block_object_dispose(&STACK[0x240], 8) = result;
    *(void *)(v0 + 176) = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
    }
    else
    {
      unint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 184) = v7;
      *unint64_t v7 = v0;
      v7[1] = sub_1E44FBAE8;
      uint64_t v8 = *(void *)(v0 + 96);
      return (id)sub_1E449B5D4(v6, 1, v8);
    }
  }
  return result;
}

uint64_t sub_1E44FBD88()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  if (v0) {
    uint64_t v4 = sub_1E44FC33C;
  }
  else {
    uint64_t v4 = sub_1E44FBEB4;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E44FBEB4()
{
  uint64_t v1 = *(void *)(v0 + 200);
  if (*(void *)(v1 + 16))
  {
    sub_1E44ED71C();
    swift_allocError();
    *(void *)uint64_t v2 = v1;
    *(void *)(v2 + _Block_object_dispose(&STACK[0x240], 8) = 0;
    *(unsigned char *)(v2 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id sub_1E44FBF84()
{
  uint64_t v1 = *(void **)(v0 + 192);
  *(void *)(v0 + 80) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v5 = *(void *)(v0 + 112);

    uint64_t v6 = *(void **)(v0 + 16);
    uint64_t v7 = *(void *)(v0 + 24);
    char v8 = *(unsigned char *)(v0 + 32);
    sub_1E451B648();
    *(void *)(v0 + 56) = 0;
    *(void *)(v0 + 64) = 0xE000000000000000;
    sub_1E451BC08();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 40) = 0xD000000000000010;
    *(void *)(v0 + 4_Block_object_dispose(&STACK[0x240], 8) = 0x80000001E4527CF0;
    sub_1E451B758();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B738();
    swift_bridgeObjectRelease();
    v3(v4, v5);
    sub_1E44ED71C();
    uint64_t v9 = swift_allocError();
    *(void *)uint64_t v10 = v6;
    *(void *)(v10 + _Block_object_dispose(&STACK[0x240], 8) = v7;
    *(unsigned char *)(v10 + 16) = v8;
    sub_1E4503638(v6, v7, v8);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *(void **)(v0 + 160);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v12 = sub_1E44F3680(0, v12[2] + 1, 1, *(void **)(v0 + 160));
    }
    unint64_t v14 = v12[2];
    unint64_t v13 = v12[3];
    if (v14 >= v13 >> 1) {
      uint64_t v12 = sub_1E44F3680((void *)(v13 > 1), v14 + 1, 1, v12);
    }
    unint64_t v15 = *(void **)(v0 + 168);
    void v12[2] = v14 + 1;
    v12[v14 + 4] = v9;

    sub_1E4503664(v6, v7, v8);
    uint64_t v16 = *(void *)(v0 + 176);
    if (v16 == *(void *)(v0 + 152))
    {
      *(void *)(v0 + 200) = v12;
      swift_bridgeObjectRelease();
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 20_Block_object_dispose(&STACK[0x240], 8) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_1E44FBD88;
      uint64_t v18 = *(void *)(v0 + 88);
      return (id)sub_1E44FE1A4(v18);
    }
    else
    {
      *(void *)(v0 + 160) = v12;
      uint64_t v21 = *(void *)(v0 + 88);
      if ((v21 & 0xC000000000000001) != 0) {
        id result = (id)MEMORY[0x1E4E804B0](v16);
      }
      else {
        id result = *(id *)(v21 + 8 * v16 + 32);
      }
      uint64_t v22 = (uint64_t)result;
      *(void *)(v0 + 16_Block_object_dispose(&STACK[0x240], 8) = result;
      *(void *)(v0 + 176) = v16 + 1;
      if (__OFADD__(v16, 1))
      {
        __break(1u);
      }
      else
      {
        char v23 = (void *)swift_task_alloc();
        *(void *)(v0 + 184) = v23;
        *char v23 = v0;
        v23[1] = sub_1E44FBAE8;
        uint64_t v24 = *(void *)(v0 + 96);
        return (id)sub_1E449B5D4(v22, 1, v24);
      }
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v20();
  }
  return result;
}

uint64_t sub_1E44FC33C()
{
  uint64_t v1 = (void *)v0[27];
  id v2 = (void (*)(uint64_t, uint64_t))v0[17];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[14];
  sub_1E451B648();
  sub_1E451B738();

  v2(v3, v4);
  uint64_t v5 = v0[25];
  if (*(void *)(v5 + 16))
  {
    sub_1E44ED71C();
    swift_allocError();
    *(void *)uint64_t v6 = v5;
    *(void *)(v6 + _Block_object_dispose(&STACK[0x240], 8) = 0;
    *(unsigned char *)(v6 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

char *sub_1E44FC460(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x1E4FBC860];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v16 = MEMORY[0x1E4FBC860];
    id result = sub_1E44A9750(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v16;
    unint64_t v15 = v1 & 0xC000000000000001;
    unint64_t v6 = v1;
    while (v2 != v5)
    {
      if (v15) {
        id v7 = (id)MEMORY[0x1E4E804B0](v5, v1);
      }
      else {
        id v7 = *(id *)(v1 + 8 * v5 + 32);
      }
      char v8 = v7;
      uint64_t v9 = sub_1E451B758();
      uint64_t v11 = v10;

      unint64_t v13 = *(void *)(v16 + 16);
      unint64_t v12 = *(void *)(v16 + 24);
      if (v13 >= v12 >> 1) {
        sub_1E44A9750((char *)(v12 > 1), v13 + 1, 1);
      }
      ++v5;
      *(void *)(v16 + 16) = v13 + 1;
      uint64_t v14 = v16 + 16 * v13;
      *(void *)(v14 + 32) = v9;
      *(void *)(v14 + 40) = v11;
      unint64_t v1 = v6;
      if (v2 == v5) {
        return (char *)v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1E44FC5CC(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x1E4FBC860];
    if (!v6) {
      break;
    }
    uint64_t v13 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1E451BC88();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x1E4E804B0](v8, a3);
      }
      else {
        id v9 = *(id *)(a3 + 8 * v8 + 32);
      }
      uint64_t v10 = v9;
      id v11 = v9;
      a1(&v12, &v11);

      if (v3) {
        return swift_release();
      }
      ++v8;
      sub_1E451BC68();
      sub_1E451BC98();
      sub_1E451BCA8();
      sub_1E451BC78();
      if (v6 == v8) {
        return v13;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1E44FC73C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 336) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 272);
  if (v0) {
    uint64_t v4 = sub_1E44FDF2C;
  }
  else {
    uint64_t v4 = sub_1E44FC868;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E44FC868(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 264);
  int v3 = *(unsigned __int8 *)(v1 + 481);
  if (v2 <= 1) {
    uint64_t v2 = 1;
  }
  *(void *)(v1 + 344) = v2;
  if (v3 == 1)
  {
    uint64_t v4 = (void *)sub_1E44AD550(a1);
    *(void *)(v1 + 352) = v4;
    *(void *)(v1 + 16) = v1;
    *(void *)(v1 + 56) = v1 + 224;
    *(void *)(v1 + 24) = sub_1E44FCF9C;
    uint64_t v5 = swift_continuation_init();
    *(void *)(v1 + 144) = MEMORY[0x1E4F143A8];
    *(void *)(v1 + 152) = 0x40000000;
    *(void *)(v1 + 160) = sub_1E44A9ECC;
    *(void *)(v1 + 16_Block_object_dispose(&STACK[0x240], 8) = &block_descriptor_12;
    *(void *)(v1 + 176) = v5;
    objc_msgSend(v4, sel_fetchLastClientStateWithCompletionHandler_, v1 + 144);
    uint64_t v6 = v1 + 16;
LABEL_5:
    return MEMORY[0x1F41881E8](v6);
  }
  *(_OWORD *)(v1 + 36_Block_object_dispose(&STACK[0x240], 8) = xmmword_1E4520140;
  uint64_t v7 = *(void *)(v1 + 272);
  uint64_t v9 = *(void *)(v7 + 112);
  uint64_t v8 = *(void *)(v7 + 120);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1E44FAF80(v9, v8, (void (*)(void))sub_1E44E21C4);
  *(void *)(v1 + 384) = v11;
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  *(void *)(v1 + 392) = v10;
  if ((sub_1E44DE34C(0, 0xC000000000000000, v10) & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
    uint64_t v23 = *(void *)(v1 + 304);
    uint64_t v24 = *(void *)(v1 + 288);
    sub_1E451B648();
    sub_1E451B718();
    v22(v23, v24);
    uint64_t v25 = (void *)swift_task_alloc();
    *(void *)(v1 + 440) = v25;
    *uint64_t v25 = v1;
    v25[1] = sub_1E44FDA74;
    return sub_1E44FEC1C();
  }
  uint64_t v14 = *(void *)(v1 + 304);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
  uint64_t v15 = *(void *)(v1 + 288);
  char v16 = sub_1E44DEC1C(*(uint64_t **)(v1 + 280), v12, v13);
  sub_1E451B648();
  sub_1E451BC08();
  *(void *)(v1 + 240) = 0;
  *(void *)(v1 + 24_Block_object_dispose(&STACK[0x240], 8) = 0xE000000000000000;
  sub_1E451B8C8();
  swift_bridgeObjectRetain();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  *(unsigned char *)(v1 + 480) = v16;
  sub_1E451BCB8();
  sub_1E451B718();
  swift_bridgeObjectRelease();
  v40(v14, v15);
  if (v16 == 2)
  {
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
    uint64_t v27 = *(void *)(v1 + 304);
    uint64_t v28 = *(void *)(v1 + 288);
    sub_1E451B648();
    sub_1E451BC08();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B718();
    swift_bridgeObjectRelease();
    v26(v27, v28);
    sub_1E451B758();
    sub_1E451B8C8();
    uint64_t v29 = swift_bridgeObjectRelease();
    long long v30 = (void *)sub_1E44AD550(v29);
    *(void *)(v1 + 400) = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5958);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1E45210F0;
    *(void *)(v31 + 32) = 0x6469754772657375;
    *(void *)(v31 + 40) = 0xEA00000000002E65;
    uint64_t v32 = sub_1E451B938();
    *(void *)(v1 + 40_Block_object_dispose(&STACK[0x240], 8) = v32;
    swift_bridgeObjectRelease();
    *(void *)(v1 + 80) = v1;
    *(void *)(v1 + 8_Block_object_dispose(&STACK[0x240], 8) = sub_1E44FD728;
    uint64_t v33 = swift_continuation_init();
    *(void *)(v1 + 184) = MEMORY[0x1E4F143A8];
    *(void *)(v1 + 192) = 0x40000000;
    *(void *)(v1 + 200) = sub_1E44FBA50;
    *(void *)(v1 + 20_Block_object_dispose(&STACK[0x240], 8) = &block_descriptor_11;
    *(void *)(v1 + 216) = v33;
    objc_msgSend(v30, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v32);
    uint64_t v6 = v1 + 80;
    goto LABEL_5;
  }
  if (v16 == 1)
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
    uint64_t v18 = *(void *)(v1 + 304);
    uint64_t v19 = *(void *)(v1 + 280);
    uint64_t v20 = *(void *)(v1 + 288);
    swift_bridgeObjectRelease();
    sub_1E451B648();
    sub_1E451BC08();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    sub_1E451B718();
    swift_bridgeObjectRelease();
    sub_1E4496E64(0, 0xC000000000000000);
    v17(v18, v20);
    sub_1E4503F20(v19, type metadata accessor for UserGuideIndexItem);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = *(uint64_t (**)(void))(v1 + 8);
    return v21();
  }
  else
  {
    uint64_t v34 = *(void *)(v1 + 384);
    __int16 v35 = *(_WORD *)(v1 + 392);
    uint64_t v36 = (void *)swift_task_alloc();
    *(void *)(v1 + 424) = v36;
    *uint64_t v36 = v1;
    v36[1] = sub_1E44FD90C;
    uint64_t v37 = *(void *)(v1 + 344);
    uint64_t v38 = *(void *)(v1 + 280);
    return sub_1E44FF9F4(v38, v37, v35, v34);
  }
}

uint64_t sub_1E44FCF9C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 360) = v2;
  uint64_t v3 = *(void *)(v1 + 272);
  if (v2) {
    uint64_t v4 = sub_1E44FDF9C;
  }
  else {
    uint64_t v4 = sub_1E44FD0BC;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E44FD0BC()
{
  uint64_t v1 = *(void *)(v0 + 224);
  unint64_t v2 = *(void *)(v0 + 232);

  *(void *)(v0 + 36_Block_object_dispose(&STACK[0x240], 8) = v1;
  *(void *)(v0 + 376) = v2;
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v3 + 112);
  uint64_t v5 = *(void *)(v3 + 120);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1E44FAF80(v4, v5, (void (*)(void))sub_1E44E21C4);
  *(void *)(v0 + 384) = v7;
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    *(void *)(v0 + 392) = v6;
    if (sub_1E44DE34C(v1, v2, v6))
    {
      uint64_t v10 = *(void *)(v0 + 304);
      __int16 v35 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
      uint64_t v34 = *(void *)(v0 + 288);
      char v11 = sub_1E44DEC1C(*(uint64_t **)(v0 + 280), v8, v9);
      sub_1E451B648();
      sub_1E451BC08();
      *(void *)(v0 + 240) = 0;
      *(void *)(v0 + 24_Block_object_dispose(&STACK[0x240], 8) = 0xE000000000000000;
      sub_1E451B8C8();
      swift_bridgeObjectRetain();
      sub_1E451B8C8();
      swift_bridgeObjectRelease();
      sub_1E451B8C8();
      *(unsigned char *)(v0 + 480) = v11;
      sub_1E451BCB8();
      sub_1E451B718();
      swift_bridgeObjectRelease();
      v35(v10, v34);
      if (v11 == 2)
      {
        uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
        uint64_t v22 = *(void *)(v0 + 304);
        uint64_t v23 = *(void *)(v0 + 288);
        sub_1E451B648();
        sub_1E451BC08();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B718();
        swift_bridgeObjectRelease();
        v21(v22, v23);
        sub_1E451B758();
        sub_1E451B8C8();
        uint64_t v24 = swift_bridgeObjectRelease();
        uint64_t v25 = (void *)sub_1E44AD550(v24);
        *(void *)(v0 + 400) = v25;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5958);
        uint64_t v26 = swift_allocObject();
        *(_OWORD *)(v26 + 16) = xmmword_1E45210F0;
        *(void *)(v26 + 32) = 0x6469754772657375;
        *(void *)(v26 + 40) = 0xEA00000000002E65;
        uint64_t v27 = sub_1E451B938();
        *(void *)(v0 + 40_Block_object_dispose(&STACK[0x240], 8) = v27;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 80) = v0;
        *(void *)(v0 + 8_Block_object_dispose(&STACK[0x240], 8) = sub_1E44FD728;
        uint64_t v28 = swift_continuation_init();
        *(void *)(v0 + 184) = MEMORY[0x1E4F143A8];
        *(void *)(v0 + 192) = 0x40000000;
        *(void *)(v0 + 200) = sub_1E44FBA50;
        *(void *)(v0 + 20_Block_object_dispose(&STACK[0x240], 8) = &block_descriptor_11;
        *(void *)(v0 + 216) = v28;
        objc_msgSend(v25, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v27);
        return MEMORY[0x1F41881E8](v0 + 80);
      }
      else if (v11 == 1)
      {
        uint64_t v12 = *(void *)(v0 + 304);
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
        uint64_t v13 = *(void *)(v0 + 280);
        uint64_t v14 = *(void *)(v0 + 288);
        swift_bridgeObjectRelease();
        sub_1E451B648();
        sub_1E451BC08();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B8C8();
        sub_1E451B718();
        swift_bridgeObjectRelease();
        sub_1E4496E64(v1, v2);
        v36(v12, v14);
        sub_1E4503F20(v13, type metadata accessor for UserGuideIndexItem);
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
        return v15();
      }
      else
      {
        uint64_t v29 = *(void *)(v0 + 384);
        __int16 v30 = *(_WORD *)(v0 + 392);
        uint64_t v31 = (void *)swift_task_alloc();
        *(void *)(v0 + 424) = v31;
        *uint64_t v31 = v0;
        v31[1] = sub_1E44FD90C;
        uint64_t v32 = *(void *)(v0 + 344);
        uint64_t v33 = *(void *)(v0 + 280);
        return sub_1E44FF9F4(v33, v32, v30, v29);
      }
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  uint64_t v18 = *(void *)(v0 + 304);
  uint64_t v19 = *(void *)(v0 + 288);
  sub_1E451B648();
  sub_1E451B718();
  v17(v18, v19);
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v20;
  void *v20 = v0;
  v20[1] = sub_1E44FDA74;
  return sub_1E44FEC1C();
}

uint64_t sub_1E44FD728()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 416) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 272);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E44FE040;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 272);
    uint64_t v4 = sub_1E44FD850;
  }
  return MEMORY[0x1F4188298](v4, v5, 0);
}

uint64_t sub_1E44FD850()
{
  uint64_t v1 = *(void **)(v0 + 408);

  uint64_t v2 = *(void *)(v0 + 384);
  __int16 v3 = *(_WORD *)(v0 + 392);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1E44FD90C;
  uint64_t v5 = *(void *)(v0 + 344);
  uint64_t v6 = *(void *)(v0 + 280);
  return sub_1E44FF9F4(v6, v5, v3, v2);
}

uint64_t sub_1E44FD90C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 432) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 272);
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v4 = sub_1E44FE10C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E45042DC;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E44FDA74()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 472) = v0;
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = sub_1E44FDE94;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = sub_1E44FDB98;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E44FDB98()
{
  unint64_t v1 = sub_1E44E2998(MEMORY[0x1E4FBC860]);
  v0[56] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[57] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1E44FDC4C;
  uint64_t v3 = v0[43];
  uint64_t v4 = v0[35];
  return sub_1E44FF9F4(v4, v3, 2, v1);
}

uint64_t sub_1E44FDC4C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = sub_1E44FDE24;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 272);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E44FDD8C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E44FDD8C()
{
  uint64_t v1 = v0[35];
  sub_1E4496E64(v0[46], v0[47]);
  sub_1E4503F20(v1, type metadata accessor for UserGuideIndexItem);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1E44FDE24()
{
  swift_bridgeObjectRelease();
  v0[59] = v0[58];
  uint64_t v1 = v0[34];
  return MEMORY[0x1F4188298](sub_1E44FDE94, v1, 0);
}

uint64_t sub_1E44FDE94()
{
  uint64_t v1 = v0[35];
  sub_1E4496E64(v0[46], v0[47]);
  sub_1E4503F20(v1, type metadata accessor for UserGuideIndexItem);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1E44FDF2C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44FDF9C()
{
  uint64_t v1 = (void *)v0[44];
  uint64_t v2 = v0[35];
  swift_willThrow();
  sub_1E4503F20(v2, type metadata accessor for UserGuideIndexItem);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1E44FE040()
{
  uint64_t v1 = (void *)v0[51];
  uint64_t v2 = (void *)v0[50];
  uint64_t v3 = v0[46];
  unint64_t v4 = v0[47];
  uint64_t v5 = v0[35];
  swift_willThrow();
  sub_1E4496E64(v3, v4);
  sub_1E4503F20(v5, type metadata accessor for UserGuideIndexItem);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1E44FE10C()
{
  uint64_t v1 = v0[35];
  sub_1E4496E64(v0[46], v0[47]);
  sub_1E4503F20(v1, type metadata accessor for UserGuideIndexItem);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1E44FE1A4(uint64_t a1)
{
  v2[29] = a1;
  v2[30] = v1;
  uint64_t v3 = sub_1E451B668();
  v2[31] = v3;
  v2[32] = *(void *)(v3 - 8);
  v2[33] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44FE264, v1, 0);
}

uint64_t sub_1E44FE264()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = *(void *)(v1 + 112);
  v0[34] = v2;
  uint64_t v3 = *(void *)(v1 + 120);
  v0[35] = v3;
  swift_bridgeObjectRetain();
  sub_1E44FAF80(v2, v3, (void (*)(void))sub_1E44E21C4);
  if (v4)
  {
    uint64_t v5 = sub_1E44FC460(v0[29]);
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = sub_1E44DF8E4(v6);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_1E4503690((uint64_t)v7);
    swift_release();
    uint64_t v9 = sub_1E4501CE0((uint64_t)v5, v8);
    uint64_t v10 = swift_task_alloc();
    *(void *)(v10 + 16) = v5;
    uint64_t v11 = swift_bridgeObjectRetain();
    v0[36] = sub_1E4503940(v11, sub_1E4503728, v10);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v12 = MEMORY[0x1E4FBC860];
    sub_1E44E2998(MEMORY[0x1E4FBC860]);
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_1E44DF7FC(v9);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v14 = v13[2];
    if (v14)
    {
      sub_1E44A9750(0, v14, 0);
      uint64_t v15 = v13 + 5;
      do
      {
        swift_bridgeObjectRetain();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        unint64_t v17 = *(void *)(v12 + 16);
        unint64_t v16 = *(void *)(v12 + 24);
        if (v17 >= v16 >> 1) {
          sub_1E44A9750((char *)(v16 > 1), v17 + 1, 1);
        }
        *(void *)(v12 + 16) = v17 + 1;
        uint64_t v18 = v12 + 16 * v17;
        *(void *)(v18 + 32) = 0x6469754772657375;
        *(void *)(v18 + 40) = 0xEA00000000002E65;
        v15 += 2;
        --v14;
      }
      while (v14);
      uint64_t v19 = v0[32];
      uint64_t v20 = v0[33];
      uint64_t v21 = v0[31];
      swift_release();
      sub_1E451B648();
      sub_1E451BC08();
      swift_bridgeObjectRelease();
      MEMORY[0x1E4E801D0](v12, MEMORY[0x1E4FBB1A0]);
      sub_1E451B8C8();
      swift_bridgeObjectRelease();
      sub_1E451B718();
      swift_bridgeObjectRelease();
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
      uint64_t v23 = (void *)sub_1E44AD550(v22);
      v0[37] = v23;
      uint64_t v24 = sub_1E451B938();
      v0[38] = v24;
      swift_release();
      v0[2] = v0;
      v0[3] = sub_1E44FE68C;
      uint64_t v25 = swift_continuation_init();
      v0[18] = MEMORY[0x1E4F143A8];
      v0[19] = 0x40000000;
      v0[20] = sub_1E44FBA50;
      v0[21] = &block_descriptor_1;
      v0[22] = v25;
      objc_msgSend(v23, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v24);
      return MEMORY[0x1F41881E8](v0 + 2);
    }
    swift_release();
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

uint64_t sub_1E44FE68C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 312) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 240);
    swift_release();
    uint64_t v4 = sub_1E44FEB14;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 240);
    uint64_t v4 = sub_1E44FE7B4;
  }
  return MEMORY[0x1F4188298](v4, v5, 0);
}

uint64_t sub_1E44FE7B4()
{
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 288);

  uint64_t v4 = (void *)sub_1E44AD550(v3);
  objc_msgSend(v4, sel_beginIndexBatch);

  uint64_t v6 = (void *)sub_1E44AD550(v5);
  *(void *)(v0 + 320) = v6;
  uint64_t v7 = sub_1E44FB694(2, v2, (uint64_t (*)(uint64_t, uint64_t))sub_1E44DE6E4);
  unint64_t v9 = v8;
  uint64_t v10 = sub_1E451B248();
  *(void *)(v0 + 32_Block_object_dispose(&STACK[0x240], 8) = v10;
  sub_1E4496E64(v7, v9);
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x240], 8) = sub_1E44FE92C;
  uint64_t v11 = swift_continuation_init();
  *(void *)(v0 + 184) = MEMORY[0x1E4F143A8];
  *(void *)(v0 + 192) = 0x40000000;
  *(void *)(v0 + 200) = sub_1E44FBA50;
  *(void *)(v0 + 20_Block_object_dispose(&STACK[0x240], 8) = &block_descriptor_5;
  *(void *)(v0 + 216) = v11;
  objc_msgSend(v6, sel_endIndexBatchWithClientState_completionHandler_, v10, v0 + 184);
  return MEMORY[0x1F41881E8](v0 + 80);
}

uint64_t sub_1E44FE92C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 336) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 240);
    swift_release();
    uint64_t v4 = sub_1E44FEB98;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 240);
    uint64_t v4 = sub_1E44FEA54;
  }
  return MEMORY[0x1F4188298](v4, v5, 0);
}

uint64_t sub_1E44FEA54()
{
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 272);

  sub_1E44FB3AC(v4, v2, 2, v3, (void (*)(void))sub_1E44E2218);
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1E44FEB14()
{
  swift_willThrow();
  uint64_t v1 = *(void **)(v0 + 304);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E44FEB98()
{
  swift_willThrow();
  uint64_t v1 = *(void **)(v0 + 328);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E44FEC1C()
{
  v1[32] = v0;
  uint64_t v2 = sub_1E451B668();
  v1[33] = v2;
  v1[34] = *(void *)(v2 - 8);
  v1[35] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E44FECDC, v0, 0);
}

uint64_t sub_1E44FECDC()
{
  uint64_t v2 = v0[34];
  uint64_t v1 = v0[35];
  uint64_t v3 = v0[33];
  sub_1E451B648();
  sub_1E451B718();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  v0[36] = v4;
  v0[37] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v5 = v4(v1, v3);
  v0[38] = sub_1E44AD550(v5);
  return MEMORY[0x1F4188298](sub_1E44FEDA0, 0, 0);
}

uint64_t sub_1E44FEDA0()
{
  objc_msgSend(*(id *)(v0 + 304), sel_beginIndexBatch);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1E44FEE5C;
  v1[15] = *(void *)(v0 + 304);
  return MEMORY[0x1F4188298](sub_1E44FF6FC, 0, 0);
}

uint64_t sub_1E44FEE5C()
{
  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E44FF18C;
  }
  else {
    uint64_t v2 = sub_1E44FEF70;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44FEF70()
{
  uint64_t v1 = (void *)v0[38];
  uint64_t v2 = sub_1E451B248();
  v0[41] = v2;
  v0[10] = v0;
  v0[11] = sub_1E44FF07C;
  uint64_t v3 = swift_continuation_init();
  v0[23] = MEMORY[0x1E4F143A8];
  v0[24] = 0x40000000;
  v0[25] = sub_1E44FBA50;
  v0[26] = &block_descriptor_24;
  v0[27] = v3;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v2, v0 + 23);
  return MEMORY[0x1F41881E8](v0 + 10);
}

uint64_t sub_1E44FF07C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 336) = v1;
  if (v1) {
    uint64_t v2 = sub_1E44FF4E8;
  }
  else {
    uint64_t v2 = sub_1E44FF470;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44FF18C()
{
  id v7 = (id)v0[38];
  uint64_t v2 = v0[35];
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[36];
  uint64_t v3 = v0[33];
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1E451BE68();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  uint64_t v4 = sub_1E451B248();
  v0[43] = v4;
  v0[2] = v0;
  v0[3] = sub_1E44FF360;
  uint64_t v5 = swift_continuation_init();
  v0[18] = MEMORY[0x1E4F143A8];
  v0[19] = 0x40000000;
  v0[20] = sub_1E44FBA50;
  v0[21] = &block_descriptor_22;
  v0[22] = v5;
  objc_msgSend(v7, sel_endIndexBatchWithClientState_completionHandler_, v4);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E44FF360()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 352) = v1;
  if (v1) {
    uint64_t v2 = sub_1E44FF654;
  }
  else {
    uint64_t v2 = sub_1E44FF5D4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44FF470()
{
  uint64_t v1 = *(void **)(v0 + 304);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E44FF4E8()
{
  uint64_t v1 = (void *)v0[41];
  swift_willThrow();

  v0[45] = v0[42];
  uint64_t v2 = v0[32];
  return MEMORY[0x1F4188298](sub_1E44FF564, v2, 0);
}

uint64_t sub_1E44FF564()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44FF5D4()
{
  swift_willThrow();
  *(void *)(v0 + 360) = *(void *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 256);
  return MEMORY[0x1F4188298](sub_1E44FF564, v1, 0);
}

uint64_t sub_1E44FF654()
{
  uint64_t v1 = (void *)v0[43];
  uint64_t v2 = (void *)v0[40];
  swift_willThrow();

  v0[45] = v0[44];
  uint64_t v3 = v0[32];
  return MEMORY[0x1F4188298](sub_1E44FF564, v3, 0);
}

uint64_t sub_1E44FF6DC(uint64_t a1)
{
  *(void *)(v1 + 120) = a1;
  return MEMORY[0x1F4188298](sub_1E44FF6FC, 0, 0);
}

uint64_t sub_1E44FF6FC()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = sub_1E451B938();
  v0[16] = v2;
  v0[2] = v0;
  v0[3] = sub_1E44FF810;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E44FBA50;
  v0[13] = &block_descriptor_26;
  v0[14] = v3;
  objc_msgSend(v1, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v2, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E44FF810()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_1E44FF984;
  }
  else {
    uint64_t v2 = sub_1E44FF920;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E44FF920()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E44FF984()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E44FF9F4(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = v4;
  *(_WORD *)(v5 + 216) = a3;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 64) = a2;
  uint64_t v7 = *(void *)(type metadata accessor for UserGuideIndexItem(0) - 8);
  *(void *)(v5 + 8_Block_object_dispose(&STACK[0x240], 8) = v7;
  *(void *)(v5 + 96) = *(void *)(v7 + 64);
  *(void *)(v5 + 104) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  *(void *)(v5 + 112) = swift_task_alloc();
  *(void *)(v5 + 120) = type metadata accessor for UserGuideIndexRequest(0);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v5 + 12_Block_object_dispose(&STACK[0x240], 8) = v8;
  type metadata accessor for UserGuideIndexHelper();
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 136) = v9;
  *unint64_t v9 = v5;
  v9[1] = sub_1E44FFB78;
  return sub_1E44E799C(v8, a1);
}

uint64_t sub_1E44FFB78()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v4 = sub_1E45006F4;
  }
  else {
    uint64_t v4 = sub_1E44FFCA4;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E44FFCA4()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(uint64_t **)(v0 + 56);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = v4[4];
  uint64_t v8 = v4[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1E44F4AC0(v7, v8, v5, v6, isUniquelyReferenced_nonNull_native);
  *(void *)(v0 + 152) = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E44E2998(MEMORY[0x1E4FBC860]);
  swift_bridgeObjectRelease();
  unint64_t v10 = *(void *)(v1 + *(int *)(v2 + 20));
  if (!(v10 >> 62))
  {
    int64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v16 = *(void *)(v0 + 64);
    if (v16) {
      goto LABEL_3;
    }
LABEL_16:
    __break(1u);
    return MEMORY[0x1F4187D90](v12, v13, v16, v14, v15);
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1E451BCD8();
  int64_t v11 = v12;
  uint64_t v16 = *(void *)(v0 + 64);
  if (!v16) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v17 = sub_1E45015C4(0, v11, v16, v10, v16);
  *(void *)(v0 + 160) = v17;
  uint64_t v18 = *(void *)(v17 + 16);
  *(void *)(v0 + 16_Block_object_dispose(&STACK[0x240], 8) = v18;
  if (v18)
  {
    uint64_t v44 = *(void *)(v0 + 88);
    unint64_t v19 = sub_1E4503B74();
    *(void *)(v0 + 176) = v19;
    *(void *)(v0 + 184) = 0;
    uint64_t v20 = *(void *)(v0 + 112);
    uint64_t v42 = *(void *)(v0 + 104);
    uint64_t v43 = v20;
    uint64_t v21 = *(void *)(v0 + 80);
    uint64_t v47 = *(void *)(v0 + 72);
    uint64_t v48 = *(void *)(v0 + 152);
    __int16 v46 = *(_WORD *)(v0 + 216);
    uint64_t v22 = *(void *)(v0 + 56);
    uint64_t v45 = *(void *)(v17 + 32);
    uint64_t v23 = sub_1E451BA28();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56);
    swift_bridgeObjectRetain();
    v25(v20, 1, 1, v23);
    sub_1E4503BD0(v22, v42);
    unint64_t v26 = (*(unsigned __int8 *)(v44 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v21;
    *(void *)(v27 + 24) = v19;
    *(void *)(v27 + 32) = v45;
    *(void *)(v27 + 40) = v21;
    *(void *)(v27 + 4_Block_object_dispose(&STACK[0x240], 8) = v17;
    *(_WORD *)(v27 + 56) = 2;
    *(void *)(v27 + 64) = v48;
    *(_WORD *)(v27 + 72) = v46;
    *(void *)(v27 + 80) = v47;
    sub_1E4503D80(v42, v27 + v26);
    uint64_t v28 = v23;
    LODWORD(v23) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v43, 1, v23);
    swift_retain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v29 = *(void *)(v0 + 112);
    if (v23 == 1)
    {
      sub_1E44DD780(*(void *)(v0 + 112), &qword_1EBFF5898);
      if (*(void *)(v27 + 16)) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_1E451BA18();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v29, v28);
      if (*(void *)(v27 + 16))
      {
LABEL_6:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v30 = sub_1E451B9A8();
        uint64_t v32 = v31;
        swift_unknownObjectRelease();
        if (v32 | v30)
        {
          *(void *)(v0 + 16) = 0;
          *(void *)(v0 + 24) = 0;
          *(void *)(v0 + 32) = v30;
          *(void *)(v0 + 40) = v32;
        }
      }
    }
    uint64_t v39 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v40 = swift_task_create();
    *(void *)(v0 + 192) = v40;
    uint64_t v41 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v41;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
    *uint64_t v41 = v0;
    v41[1] = sub_1E45001A8;
    uint64_t v15 = MEMORY[0x1E4FBC0F0];
    uint64_t v13 = v40;
    uint64_t v16 = v39;
    uint64_t v14 = v12;
    return MEMORY[0x1F4187D90](v12, v13, v16, v14, v15);
  }
  uint64_t v33 = *(void *)(v0 + 152);
  uint64_t v34 = *(void *)(v0 + 128);
  uint64_t v35 = *(void *)(v0 + 80);
  swift_bridgeObjectRelease();
  sub_1E44FB3AC(*(void *)(v35 + 112), *(void *)(v35 + 120), 2, v33, (void (*)(void))sub_1E44E2218);
  sub_1E4503F20(v34, type metadata accessor for UserGuideIndexRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v37 = *(void *)(v0 + 152);
  return v36(2, v37);
}

uint64_t sub_1E45001A8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 20_Block_object_dispose(&STACK[0x240], 8) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E4500774;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    uint64_t v4 = sub_1E45002F0;
  }
  return MEMORY[0x1F4188298](v4, v5, 0);
}

uint64_t sub_1E45002F0()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 168);
  swift_release();
  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v0 + 152);
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v5 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease();
    sub_1E44FB3AC(*(void *)(v5 + 112), *(void *)(v5 + 120), 2, v3, (void (*)(void))sub_1E44E2218);
    sub_1E4503F20(v4, type metadata accessor for UserGuideIndexRequest);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    uint64_t v7 = *(void *)(v0 + 152);
    return v6(2, v7);
  }
  uint64_t v9 = *(void *)(v0 + 176);
  uint64_t v10 = *(void *)(v0 + 184) + 1;
  *(void *)(v0 + 184) = v10;
  uint64_t v11 = *(void *)(v0 + 160);
  uint64_t v34 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 104);
  uint64_t v12 = *(void *)(v0 + 112);
  uint64_t v14 = *(void *)(v0 + 88);
  uint64_t v15 = *(void *)(v0 + 80);
  uint64_t v32 = v9;
  uint64_t v33 = *(void *)(v0 + 72);
  __int16 v31 = *(_WORD *)(v0 + 216);
  uint64_t v16 = *(void *)(v0 + 56);
  uint64_t v17 = *(void *)(v11 + 8 * v10 + 32);
  uint64_t v18 = sub_1E451BA28();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v12, 1, 1, v18);
  sub_1E4503BD0(v16, v13);
  unint64_t v20 = (*(unsigned __int8 *)(v14 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v15;
  *(void *)(v21 + 24) = v32;
  *(void *)(v21 + 32) = v17;
  *(void *)(v21 + 40) = v15;
  *(void *)(v21 + 4_Block_object_dispose(&STACK[0x240], 8) = v11;
  *(_WORD *)(v21 + 56) = 2;
  *(void *)(v21 + 64) = v34;
  *(_WORD *)(v21 + 72) = v31;
  *(void *)(v21 + 80) = v33;
  sub_1E4503D80(v13, v21 + v20);
  LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v12, 1, v18);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v22 = *(void *)(v0 + 112);
  if (v12 == 1)
  {
    sub_1E44DD780(*(void *)(v0 + 112), &qword_1EBFF5898);
    if (*(void *)(v21 + 16)) {
      goto LABEL_7;
    }
  }
  else
  {
    sub_1E451BA18();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v22, v18);
    if (*(void *)(v21 + 16))
    {
LABEL_7:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v23 = sub_1E451B9A8();
      uint64_t v25 = v24;
      swift_unknownObjectRelease();
      if (v25 | v23)
      {
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v23;
        *(void *)(v0 + 40) = v25;
      }
    }
  }
  uint64_t v26 = MEMORY[0x1E4FBC848] + 8;
  uint64_t v27 = swift_task_create();
  *(void *)(v0 + 192) = v27;
  uint64_t v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
  *uint64_t v28 = v0;
  v28[1] = sub_1E45001A8;
  uint64_t v30 = MEMORY[0x1E4FBC0F0];
  return MEMORY[0x1F4187D90](v29, v27, v26, v29, v30);
}

uint64_t sub_1E45006F4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E4500774()
{
  sub_1E4503F20(*(void *)(v0 + 128), type metadata accessor for UserGuideIndexRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E4500810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __int16 a7, uint64_t a8)
{
  *(void *)(v8 + 56) = v14;
  *(void *)(v8 + 64) = v15;
  *(_WORD *)(v8 + 146) = v13;
  *(_WORD *)(v8 + 144) = a7;
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 4_Block_object_dispose(&STACK[0x240], 8) = a8;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  uint64_t v10 = sub_1E451B668();
  *(void *)(v8 + 72) = v10;
  *(void *)(v8 + 80) = *(void *)(v10 - 8);
  *(void *)(v8 + 8_Block_object_dispose(&STACK[0x240], 8) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E45008F0, a5, 0);
}

uint64_t sub_1E45008F0()
{
  unint64_t v1 = v0[3];
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[5];
  v0[2] = v2;
  sub_1E451BDC8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v0[12] = sub_1E44AD550(v7);
  uint64_t v8 = *(void *)(v6 + 16);
  if (v8
    && (unint64_t v9 = v0[3],
        uint64_t v10 = *(void *)(v0[5] + 8 * v8 + 24),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        unsigned __int8 v11 = sub_1E4501844(v9, v10),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v11 & 1) != 0))
  {
    uint64_t v12 = 144;
    uint64_t v13 = 6;
  }
  else
  {
    uint64_t v12 = 146;
    uint64_t v13 = 7;
  }
  uint64_t v14 = sub_1E44FB694(*(unsigned __int16 *)((char *)v0 + v12), v0[v13], (uint64_t (*)(uint64_t, uint64_t))sub_1E44DE6E4);
  uint64_t v16 = v15;
  uint64_t v17 = v0[8];
  uint64_t v18 = v0[3];
  v0[13] = v15;
  v0[14] = v14;
  uint64_t v19 = swift_task_alloc();
  v0[15] = v19;
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = v17;
  unint64_t v20 = (void *)swift_task_alloc();
  v0[16] = v20;
  void *v20 = v0;
  v20[1] = sub_1E4500B78;
  return sub_1E44F9A4C(v14, v16, (uint64_t)&unk_1EAE48660, v19);
}

uint64_t sub_1E4500B78()
{
  uint64_t v2 = (void *)*v1;
  v2[17] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[4];
    return MEMORY[0x1F4188298](sub_1E4500CE0, v3, 0);
  }
  else
  {
    uint64_t v4 = (void *)v2[12];
    sub_1E4496E64(v2[14], v2[13]);

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_1E4500CE0()
{
  unint64_t v1 = (void *)v0[12];
  sub_1E4496E64(v0[14], v0[13]);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1E4500D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  return MEMORY[0x1F4188298](sub_1E4500D8C, 0, 0);
}

uint64_t sub_1E4500D8C()
{
  unint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = (void *)v0[16];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  sub_1E44FC5CC((void (*)(uint64_t *__return_ptr, id *))sub_1E4504034, v4, v1);
  swift_task_dealloc();
  sub_1E449AE1C(0, (unint64_t *)&qword_1EBFF5258);
  uint64_t v5 = sub_1E451B938();
  v0[19] = v5;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_1E4500F18;
  uint64_t v6 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E44FBA50;
  v0[13] = &block_descriptor_20;
  v0[14] = v6;
  objc_msgSend(v3, sel_indexSearchableItems_completionHandler_, v5, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E4500F18()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_1E450108C;
  }
  else {
    uint64_t v2 = sub_1E4501028;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4501028()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450108C()
{
  uint64_t v1 = *(void **)(v0 + 152);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_1E45010FC@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v20 = a3;
  uint64_t v19 = sub_1E451AF18();
  uint64_t v5 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  uint64_t v10 = *(void *)(a2 + 64);
  unint64_t v9 = *(void *)(a2 + 72);
  id v11 = objc_msgSend(v8, sel_uniqueIdentifier);
  uint64_t v12 = sub_1E451B868();
  uint64_t v14 = v13;

  id v15 = objc_msgSend(v8, sel_attributeSet);
  *(void *)&long long v24 = v12;
  *((void *)&v24 + 1) = v14;
  *(void *)&long long v25 = v15;
  *((void *)&v25 + 1) = v10;
  long long v26 = v9;
  swift_bridgeObjectRetain();
  id v16 = objc_msgSend(v8, (SEL)&selRef_setLabel_ + 7);
  sub_1E44F87E0((uint64_t)v7);
  sub_1E451BB08();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  id v17 = objc_msgSend(v8, (SEL)&selRef_setLabel_ + 7);
  long long v21 = v24;
  long long v22 = v25;
  long long v23 = v26;
  sub_1E44DD584();
  sub_1E451BAF8();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  void *v20 = v8;
  return v8;
}

uint64_t sub_1E45012EC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E4501328(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t))sub_1E44DF9E0, (unint64_t *)&qword_1EBFF58D0, 0x1E4FAF4B8);
}

uint64_t sub_1E4501328(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t *, uint64_t, uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t v13 = a1 + a3;
  if (__OFADD__(a1, a3))
  {
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    if (v25 < v13) {
      uint64_t v13 = v25;
    }
    if (v13 < v8) {
      goto LABEL_39;
    }
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    if (v26 >= v8) {
      goto LABEL_7;
    }
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v10 = a7;
  id v11 = a6;
  uint64_t v7 = a5;
  unint64_t v9 = a2;
  uint64_t v8 = a1;
  unint64_t v12 = a2 >> 62;
  if (a2 >> 62) {
    goto LABEL_31;
  }
  uint64_t v14 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v14 < v13) {
    uint64_t v13 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v13 < a1) {
    goto LABEL_39;
  }
  if (v14 < a1) {
    goto LABEL_35;
  }
LABEL_7:
  if (v8 < 0)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v15 < v13) {
    goto LABEL_37;
  }
  if (v13 < 0)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if ((v9 & 0xC000000000000001) != 0 && v13 != v8)
  {
    if (v13 > (unint64_t)v8)
    {
      sub_1E449AE1C(0, v11);
      uint64_t v16 = v8;
      do
      {
        uint64_t v17 = v16 + 1;
        sub_1E451BC28();
        uint64_t v16 = v17;
      }
      while (v13 != v17);
      goto LABEL_18;
    }
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
LABEL_18:
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1E451BCE8();
    id v11 = v18;
    uint64_t v8 = v19;
    uint64_t v13 = v20;
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v21 = v7(v10, v11, v8, v13);
    goto LABEL_29;
  }
  uint64_t v10 = v9 & 0xFFFFFFFFFFFFFF8;
  id v11 = (unint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
  uint64_t v13 = (2 * v13) | 1;
  swift_bridgeObjectRetain();
  if ((v13 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_23:
  sub_1E451BE08();
  swift_unknownObjectRetain_n();
  uint64_t v22 = swift_dynamicCastClass();
  if (!v22)
  {
    swift_unknownObjectRelease();
    uint64_t v22 = MEMORY[0x1E4FBC860];
  }
  uint64_t v23 = *(void *)(v22 + 16);
  swift_release();
  if (__OFSUB__((unint64_t)v13 >> 1, v8)) {
    goto LABEL_41;
  }
  if (v23 != ((unint64_t)v13 >> 1) - v8)
  {
LABEL_42:
    swift_unknownObjectRelease();
    goto LABEL_22;
  }
  uint64_t v21 = swift_dynamicCastClass();
  if (!v21)
  {
    swift_unknownObjectRelease();
    uint64_t v21 = MEMORY[0x1E4FBC860];
  }
LABEL_29:
  swift_unknownObjectRelease();
  return v21;
}

uint64_t sub_1E45015C4(uint64_t a1, int64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v9 = a1;
  int64_t v10 = 0;
  int64_t v11 = a1;
  while (1)
  {
    BOOL v12 = v11 <= a2;
    if (a3 > 0) {
      BOOL v12 = v11 >= a2;
    }
    if (v12) {
      break;
    }
    BOOL v13 = __OFADD__(v11, a3);
    v11 += a3;
    if (v13) {
      int64_t v11 = (v11 >> 63) ^ 0x8000000000000000;
    }
    BOOL v13 = __OFADD__(v10++, 1);
    if (v13)
    {
      __break(1u);
      break;
    }
  }
  uint64_t v32 = MEMORY[0x1E4FBC860];
  uint64_t result = (uint64_t)sub_1E4513F88(0, v10, 0);
  uint64_t v15 = v32;
  if (v10)
  {
    while (1)
    {
      BOOL v16 = v9 <= a2;
      if (a3 > 0) {
        BOOL v16 = v9 >= a2;
      }
      if (v16) {
        break;
      }
      if (__OFADD__(v9, a3)) {
        int64_t v17 = ((v9 + a3) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v17 = v9 + a3;
      }
      uint64_t result = sub_1E4501328(v9, a4, a5, (uint64_t)v31, (uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t))sub_1E44DF9CC, (unint64_t *)&qword_1EBFF5258, 0x1E4F23840);
      if (v6) {
        goto LABEL_37;
      }
      uint64_t v18 = result;
      uint64_t v6 = 0;
      uint64_t v32 = v15;
      unint64_t v20 = *(void *)(v15 + 16);
      unint64_t v19 = *(void *)(v15 + 24);
      if (v20 >= v19 >> 1)
      {
        uint64_t result = (uint64_t)sub_1E4513F88((void *)(v19 > 1), v20 + 1, 1);
        uint64_t v15 = v32;
      }
      *(void *)(v15 + 16) = v20 + 1;
      *(void *)(v15 + 8 * v20 + 32) = v18;
      uint64_t v9 = v17;
      if (!--v10) {
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  else
  {
    int64_t v17 = v9;
LABEL_23:
    BOOL v21 = v17 <= a2;
    if (a3 > 0) {
      BOOL v21 = v17 >= a2;
    }
    if (v21)
    {
LABEL_26:
      swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        int64_t v22 = __OFADD__(v17, a3) ? ((v17 + a3) >> 63) ^ 0x8000000000000000 : v17 + a3;
        uint64_t v23 = sub_1E4501328(v17, a4, a5, (uint64_t)v30, (uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t))sub_1E44DF9CC, (unint64_t *)&qword_1EBFF5258, 0x1E4F23840);
        if (v6) {
          break;
        }
        uint64_t v24 = v23;
        uint64_t v6 = 0;
        uint64_t v32 = v15;
        unint64_t v26 = *(void *)(v15 + 16);
        unint64_t v25 = *(void *)(v15 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_1E4513F88((void *)(v25 > 1), v26 + 1, 1);
          uint64_t v15 = v32;
        }
        *(void *)(v15 + 16) = v26 + 1;
        *(void *)(v15 + 8 * v26 + 32) = v24;
        BOOL v27 = v22 <= a2;
        if (a3 > 0) {
          BOOL v27 = v22 >= a2;
        }
        int64_t v17 = v22;
        if (v27) {
          goto LABEL_26;
        }
      }
LABEL_37:
      swift_bridgeObjectRelease();
      swift_release();
    }
    return v15;
  }
  return result;
}

id sub_1E4501844(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x1E4E804B0](0, v3))
  {
    int64_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x1E4E804B0](0, a2);
LABEL_22:
    BOOL v13 = v12;
    sub_1E449AE1C(0, (unint64_t *)&qword_1EBFF5258);
    char v14 = sub_1E451BB58();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x1E4E804B0](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        unint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x1E4E804B0](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        BOOL v21 = v20;
        unint64_t v5 = sub_1E451BB58();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      unint64_t v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        BOOL v27 = *v25++;
        unint64_t v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_1E451BB58();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_1E4501B30(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1E451BEB8();
  swift_bridgeObjectRetain();
  sub_1E451B8B8();
  uint64_t v8 = sub_1E451BEE8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1E451BDE8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1E451BDE8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1E4502F00(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1E4501CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
  uint64_t v26 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25[0] + 16 * v5);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      ++v5;
      sub_1E451BEB8();
      swift_bridgeObjectRetain();
      sub_1E451B8B8();
      uint64_t v9 = sub_1E451BEE8();
      uint64_t v10 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(v2 + 48);
        BOOL v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_1E451BDE8() & 1) != 0)
        {
          uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
          uint64_t v27 = v5;
LABEL_19:
          char v19 = *(unsigned char *)(v2 + 32);
          unint64_t v20 = (unint64_t)((1 << v19) + 63) >> 6;
          size_t v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
          {
            MEMORY[0x1F4188790](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            uint64_t v22 = sub_1E4502744((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            unint64_t v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            uint64_t v22 = sub_1E4502744((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x1E4E81220](v23, -1, -1);
          }
          return v22;
        }
        uint64_t v15 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v15;
          if (((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
            break;
          }
          uint64_t v16 = (void *)(v12 + 16 * v11);
          BOOL v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_1E451BDE8() & 1) != 0)
          {
            uint64_t v27 = v5;
            uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_1E4501FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
                  sub_1E44E1E84();
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
      uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_1E451BEB8();
      swift_bridgeObjectRetain();
      sub_1E451B8B8();
      uint64_t v19 = sub_1E451BEE8();
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
    if (v24 || (sub_1E451BDE8() & 1) != 0)
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
        uint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1E451BDE8() & 1) == 0);
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
      MEMORY[0x1F4188790](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_1E4502970((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_1E44E1E84();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_1E4502970((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_1E44E1E84();
      MEMORY[0x1E4E81220](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1E4502464()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5268);
  uint64_t v3 = sub_1E451BBE8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                  *unint64_t v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1E451BEB8();
      sub_1E451B8B8();
      uint64_t result = sub_1E451BEE8();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1E4502744(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  unint64_t v30 = (unint64_t *)result;
  uint64_t v31 = v6 - 1;
  uint64_t v8 = *a5;
  unint64_t v7 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_1E4502C68(v30, a2, v31, a3);
  }
  uint64_t v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9) {
      goto LABEL_29;
    }
    uint64_t v11 = v8 + 16 * v7;
    uint64_t v13 = *(void *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_1E451BEB8();
    swift_bridgeObjectRetain();
    sub_1E451B8B8();
    uint64_t v14 = sub_1E451BEE8();
    uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = 1 << v16;
    if (((1 << v16) & *(void *)(v32 + 8 * (v16 >> 6))) == 0) {
      goto LABEL_4;
    }
    uint64_t v19 = *(void *)(a3 + 48);
    uint64_t v20 = (void *)(v19 + 16 * v16);
    BOOL v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_1E451BDE8() & 1) == 0)
    {
      uint64_t v24 = ~v15;
      for (unint64_t i = v16 + 1; ; unint64_t i = v26 + 1)
      {
        unint64_t v26 = i & v24;
        if (((*(void *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        BOOL v27 = (void *)(v19 + 16 * v26);
        BOOL v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_1E451BDE8() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v17 = v26 >> 6;
          uint64_t v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_15:
    unint64_t v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      uint64_t v23 = v31 - 1;
      if (__OFSUB__(v31, 1)) {
        goto LABEL_30;
      }
      --v31;
      if (!v23) {
        return MEMORY[0x1E4FBC870];
      }
    }
LABEL_5:
    uint64_t v8 = *a5;
    unint64_t v7 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v7 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1E4502970(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v39 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
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
          goto LABEL_16;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_45;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_15;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_45;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v15 = v14 - 1;
                int64_t v36 = v9 + 6;
                while (v14 != v36)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_1E4502C68(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v13 = v18;
        }
LABEL_15:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_16:
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1E451BEB8();
        swift_bridgeObjectRetain();
        sub_1E451B8B8();
        uint64_t v22 = sub_1E451BEE8();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        BOOL v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_1E451BDE8() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1E451BDE8() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1E4502C68(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5268);
  uint64_t result = sub_1E451BBF8();
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
    sub_1E451BEB8();
    swift_bridgeObjectRetain();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
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
    BOOL v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *BOOL v28 = v18;
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

uint64_t sub_1E4502F00(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1E4502464();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1E450309C();
      goto LABEL_22;
    }
    sub_1E4503250();
  }
  uint64_t v11 = *v4;
  sub_1E451BEB8();
  sub_1E451B8B8();
  uint64_t result = sub_1E451BEE8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1E451BDE8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1E451BE48();
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
          uint64_t result = sub_1E451BDE8();
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

void *sub_1E450309C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5268);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E451BBD8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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

uint64_t sub_1E4503250()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5268);
  uint64_t v3 = sub_1E451BBE8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
    sub_1E451BEB8();
    swift_bridgeObjectRetain();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
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

void (*sub_1E4503500(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1E45035B0(v6, a2, a3);
  return sub_1E4503568;
}

void sub_1E4503568(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1E45035B0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1E4E804B0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1E4503630;
  }
  __break(1u);
  return result;
}

void sub_1E4503630(id *a1)
{
}

id sub_1E4503638(id result, uint64_t a2, char a3)
{
  if (a3 == 3 || a3 == 2) {
    return (id)swift_bridgeObjectRetain();
  }
  if (a3 == 1) {
    return result;
  }
  return result;
}

void sub_1E4503664(void *a1, uint64_t a2, char a3)
{
  if (a3 == 3 || a3 == 2)
  {
    swift_bridgeObjectRelease();
  }
  else if (a3 == 1)
  {
  }
}

uint64_t sub_1E4503690(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1E451BA78();
  uint64_t v8 = result;
  if (v2)
  {
    id v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1E4501B30(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1E4503728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1E44DECE0(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_1E4503730(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  unint64_t v23 = (unint64_t *)result;
  uint64_t v24 = 0;
  int64_t v6 = 0;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v26 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v18 >= v26) {
      return sub_1E4514398(v23, a2, v24, a3);
    }
    unint64_t v19 = *(void *)(v25 + 8 * v18);
    ++v6;
    if (!v19)
    {
      int64_t v6 = v18 + 1;
      if (v18 + 1 >= v26) {
        return sub_1E4514398(v23, a2, v24, a3);
      }
      unint64_t v19 = *(void *)(v25 + 8 * v6);
      if (!v19)
      {
        int64_t v6 = v18 + 2;
        if (v18 + 2 >= v26) {
          return sub_1E4514398(v23, a2, v24, a3);
        }
        unint64_t v19 = *(void *)(v25 + 8 * v6);
        if (!v19) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v19 - 1) & v19;
    unint64_t v11 = __clz(__rbit64(v19)) + (v6 << 6);
LABEL_5:
    unint64_t v12 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    unint64_t v15 = (uint64_t *)(*(void *)(a3 + 56) + 16 * v11);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    LOBYTE(v17) = a4(v13, v14, v17, v16);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17)
    {
      *(unint64_t *)((char *)v23 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
        return sub_1E4514398(v23, a2, v24, a3);
      }
    }
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v26) {
    return sub_1E4514398(v23, a2, v24, a3);
  }
  unint64_t v19 = *(void *)(v25 + 8 * v20);
  if (v19)
  {
    int64_t v6 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v6 >= v26) {
      return sub_1E4514398(v23, a2, v24, a3);
    }
    unint64_t v19 = *(void *)(v25 + 8 * v6);
    ++v20;
    if (v19) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1E4503940(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x1E4F143B8];
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_1E4503730((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_1E4503730((uint64_t)v11, v8, v6, a2);
    MEMORY[0x1E4E81220](v11, -1, -1);
  }
  return a3;
}

unint64_t sub_1E4503AB8()
{
  unint64_t result = qword_1EBFF51B0;
  if (!qword_1EBFF51B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF51B0);
  }
  return result;
}

uint64_t sub_1E4503B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1E4503B74()
{
  unint64_t result = qword_1EBFF5B70;
  if (!qword_1EBFF5B70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBFF5430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5B70);
  }
  return result;
}

uint64_t sub_1E4503BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserGuideIndexItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4503C34()
{
  uint64_t v1 = (int *)(type metadata accessor for UserGuideIndexItem(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 88) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[12];
  uint64_t v7 = sub_1E451B1D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1E4503D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserGuideIndexItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4503DE4(uint64_t a1)
{
  type metadata accessor for UserGuideIndexItem(0);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v11 = *(void *)(v1 + 64);
  __int16 v8 = *(_WORD *)(v1 + 56);
  size_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *size_t v9 = v2;
  v9[1] = sub_1E44AE0C8;
  return sub_1E4500810(a1, v3, v4, v5, v6, v7, v8, v11);
}

uint64_t sub_1E4503F20(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E4503F80(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + _Block_object_dispose(&STACK[0x240], 8) = sub_1E44DAA10;
  *(_OWORD *)(v4 + 136) = v5;
  *(void *)(v4 + 12_Block_object_dispose(&STACK[0x240], 8) = a1;
  return MEMORY[0x1F4188298](sub_1E4500D8C, 0, 0);
}

id sub_1E4504034@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  return sub_1E45010FC(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_1E4504054()
{
  unint64_t result = qword_1EBFF5188;
  if (!qword_1EBFF5188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5188);
  }
  return result;
}

unint64_t sub_1E45040A8()
{
  unint64_t result = qword_1EBFF5190;
  if (!qword_1EBFF5190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5190);
  }
  return result;
}

void destroy for UserGuideItemIndexingError(uint64_t a1)
{
}

uint64_t _s10TipsDaemon26UserGuideItemIndexingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1E4503638(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UserGuideItemIndexingError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1E4503638(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1E4503664(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for UserGuideItemIndexingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1E4503664(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserGuideItemIndexingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UserGuideItemIndexingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1E450429C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_1E45042B4(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideItemIndexingError()
{
  return &type metadata for UserGuideItemIndexingError;
}

uint64_t sub_1E45042E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, long long *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v12 = sub_1E451B868();
    uint64_t v14 = v13;
    if (a3)
    {
LABEL_3:
      *((void *)&v24 + 1) = swift_getObjectType();
      *(void *)&long long v23 = a3;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
LABEL_6:
  swift_retain();
  swift_unknownObjectRetain();
  if (!a4)
  {
    unint64_t v17 = 0xF000000000000000;
    if (a6) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v18 = 0;
    goto LABEL_11;
  }
  id v15 = a4;
  a4 = (void *)sub_1E451B258();
  unint64_t v17 = v16;

  if (!a6) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v18 = sub_1E451B868();
  a6 = v19;
LABEL_11:
  id v20 = a7;
  v22(v12, v14, &v23, a4, v17, a5, v18, a6, a7);

  swift_bridgeObjectRelease();
  sub_1E4496EBC((uint64_t)a4, v17);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1E44DD780((uint64_t)&v23, &qword_1EBFF5990);
}

uint64_t sub_1E45044C0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E4504584(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  int v4 = (void *)(*a2 + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  *int v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4504734@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  return sub_1E44E3AAC(v3, a1, &qword_1EBFF52B0);
}

uint64_t sub_1E45048D0(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  MEMORY[0x1F4188790](v4 - 8);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E44E3AAC(a1, (uint64_t)v6, &qword_1EBFF52B0);
  uint64_t v7 = *a2 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  sub_1E45055B0((uint64_t)v6, v7);
  return swift_endAccess();
}

id AssetsDownloadOperation.__allocating_init(_:assetURLPath:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL];
  uint64_t v11 = sub_1E451B1D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(_DWORD *)&v9[OBJC_IVAR___TPSAssetsDownloadOperation_priority] = *MEMORY[0x1E4F28A00];
  *(void *)&v9[OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem] = 0;
  uint64_t v12 = &v9[OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  uint64_t v13 = &v9[OBJC_IVAR___TPSAssetsDownloadOperation_assetURLPath];
  *(void *)uint64_t v13 = a3;
  *((void *)v13 + 1) = a4;
  v15.receiver = v9;
  v15.super_class = v4;
  return objc_msgSendSuper2(&v15, sel_init);
}

id AssetsDownloadOperation.init(_:assetURLPath:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = &v4[OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL];
  uint64_t v10 = sub_1E451B1D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(_DWORD *)&v4[OBJC_IVAR___TPSAssetsDownloadOperation_priority] = *MEMORY[0x1E4F28A00];
  *(void *)&v4[OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem] = 0;
  uint64_t v11 = &v4[OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier];
  *(void *)uint64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  uint64_t v12 = &v4[OBJC_IVAR___TPSAssetsDownloadOperation_assetURLPath];
  *(void *)uint64_t v12 = a3;
  *((void *)v12 + 1) = a4;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for AssetsDownloadOperation();
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t type metadata accessor for AssetsDownloadOperation()
{
  uint64_t result = qword_1EAE48698;
  if (!qword_1EAE48698) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E4504CD8()
{
  sub_1E44E569C();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (v1)
  {
    uint64_t v2 = v1;
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
    int v5 = *(_DWORD *)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_priority);
    uint64_t v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1E45051E8;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1E45042E0;
    aBlock[3] = &block_descriptor_7;
    uint64_t v7 = _Block_copy(aBlock);
    swift_release();
    LODWORD(v_Block_object_dispose(&STACK[0x240], 8) = v5;
    id v9 = objc_msgSend(v2, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v3, v4, 0, v7, v8);
    _Block_release(v7);

    uint64_t v10 = *(void **)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem);
    *(void *)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem) = v9;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E4504EA8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1E4504EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  objc_super v14 = &v28[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x1F4188790](v12);
  unint64_t v16 = &v28[-v15 - 8];
  uint64_t v17 = sub_1E451B1D8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  id v20 = &v28[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess();
  uint64_t v21 = MEMORY[0x1E4E812E0](a10 + 16);
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    sub_1E44E3AAC(a3, (uint64_t)v28, &qword_1EBFF5990);
    if (v29)
    {
      int v23 = swift_dynamicCast();
      long long v24 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v18 + 56);
      v24(v16, v23 ^ 1u, 1, v17);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) != 1)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v18 + 32))(v20, v16, v17);
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v18 + 16))(v14, v20, v17);
        v24(v14, 0, 1, v17);
        uint64_t v25 = (uint64_t)v22 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
        swift_beginAccess();
        sub_1E45055B0((uint64_t)v14, v25);
        swift_endAccess();
        objc_msgSend(v22, sel_finishWithError_, 0);

        (*(void (**)(unsigned char *, uint64_t))(v18 + 8))(v20, v17);
        return;
      }
    }
    else
    {
      sub_1E44DD780((uint64_t)v28, &qword_1EBFF5990);
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    }
    int64_t v26 = a9;
    sub_1E44DD780((uint64_t)v16, &qword_1EBFF52B0);
    if (a9) {
      int64_t v26 = (void *)sub_1E451B0C8();
    }
    objc_msgSend(v22, sel_finishWithError_, v26);
  }
}

void sub_1E45051E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_1E4504EE0(a1, a2, a3, a4, a5, a6, a7, a8, a9, v9);
}

id AssetsDownloadOperation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AssetsDownloadOperation.init()()
{
}

id AssetsDownloadOperation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssetsDownloadOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4505324@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E4505380@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  return sub_1E44E3AAC(v3, a2, &qword_1EBFF52B0);
}

uint64_t sub_1E4505460()
{
  return type metadata accessor for AssetsDownloadOperation();
}

void sub_1E4505468()
{
  sub_1E44EE34C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AssetsDownloadOperation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssetsDownloadOperation);
}

uint64_t dispatch thunk of AssetsDownloadOperation.assetIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AssetsDownloadOperation.downloadedURL.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AssetsDownloadOperation.__allocating_init(_:assetURLPath:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1E45055B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF52B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4505618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E451BA28();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E451BA18();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E44DA6DC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E451B9A8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

BOOL SearchItemIndexer.IndexItemType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

void *static SearchItemIndexer.IndexItemType.allCases.getter()
{
  return &unk_1F40166C8;
}

void sub_1E45057EC(void *a1@<X8>)
{
  *a1 = &unk_1F40166F8;
}

uint64_t sub_1E45057FC()
{
  uint64_t v1 = OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer;
  if (*(void *)(v0 + OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR___TPSSearchItemIndexer_name);
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR___TPSSearchItemIndexer_name + 8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5438);
    uint64_t v2 = swift_allocObject();
    swift_bridgeObjectRetain();
    swift_defaultActor_initialize();
    *(void *)(v2 + 136) = 0;
    *(void *)(v2 + 112) = v4;
    *(void *)(v2 + 120) = v3;
    *(unsigned char *)(v2 + 12_Block_object_dispose(&STACK[0x240], 8) = 0;
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_1E45058AC()
{
  sub_1E44A9E8C();
  uint64_t v0 = sub_1E451BB38();
  uint64_t v2 = v1;
  id v3 = objc_allocWithZone((Class)type metadata accessor for SearchItemIndexer());
  id result = SearchItemIndexer.init(name:)(v0, v2);
  qword_1EBFF52D8 = (uint64_t)result;
  return result;
}

id SearchItemIndexer.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return SearchItemIndexer.init(name:)(a1, a2);
}

id static SearchItemIndexer.default.getter()
{
  if (qword_1EBFF52E0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1EBFF52D8;

  return v0;
}

id SearchItemIndexer.init(name:)(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = OBJC_IVAR___TPSSearchItemIndexer_queue;
  id v8 = objc_allocWithZone(MEMORY[0x1E4F28F08]);
  uint64_t v9 = v3;
  id v10 = objc_msgSend(v8, sel_init);
  uint64_t v11 = (void *)sub_1E451B858();
  objc_msgSend(v10, sel_setName_, v11);

  objc_msgSend(v10, sel_setMaxConcurrentOperationCount_, 1);
  *(void *)&v3[v7] = v10;
  *(void *)&v9[OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer] = 0;
  *(void *)&v9[OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer] = 0;
  *(void *)&v9[OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer] = 0;
  uint64_t v12 = &v9[OBJC_IVAR___TPSSearchItemIndexer_name];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;

  v14.receiver = v9;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

id SearchItemIndexer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void SearchItemIndexer.init()()
{
}

id SearchItemIndexer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void SearchItemIndexer.deleteAllItems(ofTypes:qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EBFF5438);
  uint64_t v9 = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EBFF5430);
  id v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = v8;
  v10[4] = v9;
  uint64_t v11 = (void *)swift_allocObject();
  id v11[2] = a2;
  void v11[3] = v4;
  v11[4] = 0xD000000000000027;
  v11[5] = 0x80000001E45280C0;
  void v11[6] = &unk_1EAE486E8;
  v11[7] = v10;
  id v12 = objc_allocWithZone((Class)sub_1E451B6F8());
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v13 = v4;
  swift_retain();
  id v16 = (id)sub_1E451B6E8();
  objc_super v14 = (void *)sub_1E451B858();
  objc_msgSend(v16, sel_setName_, v14);

  objc_msgSend(v16, sel_setQualityOfService_, a2);
  sub_1E449B404(v16, a3, a4);
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1E4505E40()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    id v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E4505F8C, 0, 0);
  }
}

uint64_t sub_1E4505F8C()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  sub_1E451B648();
  sub_1E451B728();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void SearchItemIndexer.reindexTips(_:qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EBFF5438);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = (void *)swift_allocObject();
  id v11[2] = a2;
  void v11[3] = v4;
  v11[4] = 0xD000000000000020;
  v11[5] = 0x80000001E4528120;
  void v11[6] = &unk_1EAE48708;
  v11[7] = v10;
  id v12 = objc_allocWithZone((Class)sub_1E451B6F8());
  swift_retain();
  swift_bridgeObjectRetain();
  id v13 = v4;
  swift_retain();
  id v15 = (id)sub_1E451B6E8();
  objc_super v14 = (void *)sub_1E451B858();
  objc_msgSend(v15, sel_setName_, v14);

  objc_msgSend(v15, sel_setQualityOfService_, a2);
  sub_1E449B404(v15, a3, a4);
  swift_release();
  swift_release();
}

uint64_t sub_1E45061F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1E451B668();
  v2[2] = v4;
  v2[3] = *(void *)(v4 - 8);
  v2[4] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[5] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E45062F8;
  return sub_1E44ACFD8(a2, 0, 20);
}

uint64_t sub_1E45062F8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E4506444, 0, 0);
  }
}

uint64_t sub_1E4506444()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  sub_1E451B648();
  sub_1E451B728();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void SearchItemIndexer.reindexUserGuides(_:qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EBFF5430);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = (void *)swift_allocObject();
  id v11[2] = a2;
  void v11[3] = v4;
  v11[4] = 0xD000000000000027;
  v11[5] = 0x80000001E4528150;
  void v11[6] = &unk_1EAE48718;
  v11[7] = v10;
  id v12 = objc_allocWithZone((Class)sub_1E451B6F8());
  swift_retain();
  swift_bridgeObjectRetain();
  id v13 = v4;
  swift_retain();
  id v15 = (id)sub_1E451B6E8();
  objc_super v14 = (void *)sub_1E451B858();
  objc_msgSend(v15, sel_setName_, v14);

  objc_msgSend(v15, sel_setQualityOfService_, a2);
  sub_1E449B404(v15, a3, a4);
  swift_release();
  swift_release();
}

uint64_t sub_1E4506794(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_1E451B668();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[7] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1E4506884;
  return sub_1E44FEC1C();
}

uint64_t sub_1E4506884()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v2 + 64) = v6;
    void *v6 = v3;
    v6[1] = sub_1E4506A04;
    uint64_t v7 = *(void *)(v2 + 24);
    return sub_1E44AD48C(v7, 50);
  }
}

uint64_t sub_1E4506A04()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E4506B50, 0, 0);
  }
}

uint64_t sub_1E4506B50()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_1E451B648();
  sub_1E451B728();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void SearchItemIndexer.deleteAllItems(qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EBFF5438);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a1;
  v8[3] = v3;
  v8[4] = 0xD00000000000001FLL;
  void v8[5] = 0x80000001E4528180;
  v8[6] = &unk_1EAE48728;
  v8[7] = v7;
  id v9 = objc_allocWithZone((Class)sub_1E451B6F8());
  swift_retain_n();
  id v10 = v3;
  id v12 = (id)sub_1E451B6E8();
  uint64_t v11 = (void *)sub_1E451B858();
  objc_msgSend(v12, sel_setName_, v11);

  objc_msgSend(v12, sel_setQualityOfService_, a1);
  sub_1E449B404(v12, a2, a3);
  swift_release_n();
}

uint64_t sub_1E4506E64()
{
  uint64_t v1 = sub_1E451B668();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1EAE48748 + dword_1EAE48748);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1E4506F64;
  return v4();
}

uint64_t sub_1E4506F64()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1E45070B0, 0, 0);
  }
}

uint64_t sub_1E45070B0()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  sub_1E451B648();
  sub_1E451B728();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1E4507164()
{
  v1[15] = v0;
  v1[16] = *v0;
  uint64_t v2 = sub_1E451B1D8();
  v1[17] = v2;
  v1[18] = *(void *)(v2 - 8);
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  uint64_t v3 = sub_1E451B668();
  v1[21] = v3;
  v1[22] = *(void *)(v3 - 8);
  v1[23] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E45072B8, v0, 0);
}

uint64_t sub_1E45072B8()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  sub_1E451B648();
  sub_1E451B718();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v4 = sub_1E44AD554();
  v0[24] = v4;
  v0[2] = v0;
  v0[3] = sub_1E450740C;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E44FBA50;
  v0[13] = &block_descriptor_2;
  v0[14] = v5;
  objc_msgSend(v4, sel_deleteAllSearchableItemsWithCompletionHandler_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E450740C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 200) = v2;
  uint64_t v3 = *(void *)(v1 + 120);
  if (v2) {
    id v4 = sub_1E4507628;
  }
  else {
    id v4 = sub_1E450752C;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E450752C()
{
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 144);

  sub_1E44ABD80();
  sub_1E451B178();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  sub_1E44E5D3C();
  v5(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1E4507628()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E450777C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  void v3[5] = a3;
  v3[3] = a1;
  uint64_t v4 = sub_1E451B668();
  void v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4507840, 0, 0);
}

uint64_t sub_1E4507840()
{
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(v0 + 120) = v2;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << v2;
  if (-(-1 << v2) < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 56);
  uint64_t v6 = (void *)swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = __clz(__rbit64(v5));
    uint64_t v9 = (v5 - 1) & v5;
    goto LABEL_5;
  }
  unint64_t v13 = 63 - v4;
  if ((unint64_t)(63 - v4) > 0x7F)
  {
    unint64_t v14 = v6[8];
    if (v14)
    {
      uint64_t v7 = 1;
LABEL_13:
      uint64_t v9 = (v14 - 1) & v14;
      unint64_t v8 = __clz(__rbit64(v14)) + (v7 << 6);
LABEL_5:
      *(void *)(v0 + 72) = v7;
      *(void *)(v0 + 80) = v9;
      uint64_t v10 = *(void *)(v6[6] + 8 * v8);
      if (v10)
      {
        if (v10 == 1)
        {
          uint64_t v11 = (void *)swift_task_alloc();
          *(void *)(v0 + 104) = v11;
          *uint64_t v11 = v0;
          v11[1] = sub_1E4507E8C;
          return sub_1E44FEC1C();
        }
        else
        {
          *(void *)(v0 + 16) = v10;
          uint64_t v16 = MEMORY[0x1E4FBB550];
          return MEMORY[0x1F4185D40](&type metadata for SearchItemIndexer.IndexItemType, v0 + 16, &type metadata for SearchItemIndexer.IndexItemType, v16);
        }
      }
      else
      {
        id v15 = (void *)swift_task_alloc();
        *(void *)(v0 + 8_Block_object_dispose(&STACK[0x240], 8) = v15;
        *id v15 = v0;
        v15[1] = sub_1E4507ACC;
        return sub_1E450963C();
      }
    }
    if (v13 >= 0xC0)
    {
      unint64_t v14 = v6[9];
      if (v14)
      {
        uint64_t v7 = 2;
        goto LABEL_13;
      }
      if (v13 >= 0x100)
      {
        unint64_t v14 = v6[10];
        if (v14)
        {
          uint64_t v7 = 3;
          goto LABEL_13;
        }
        if (v13 >= 0x140)
        {
          unint64_t v14 = v6[11];
          if (v14)
          {
            uint64_t v7 = 4;
            goto LABEL_13;
          }
          uint64_t v17 = 0;
          uint64_t v18 = v13 >> 6;
          if (v18 <= 5) {
            uint64_t v18 = 5;
          }
          uint64_t v19 = v18 - 5;
          while (v19 != v17)
          {
            unint64_t v14 = v6[v17++ + 12];
            if (v14)
            {
              uint64_t v7 = v17 + 4;
              goto LABEL_13;
            }
          }
        }
      }
    }
  }
  swift_release();
  swift_task_dealloc();
  id v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_1E4507ACC()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    char v2 = sub_1E450824C;
  }
  else {
    char v2 = sub_1E4507BE0;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4507BE0()
{
  sub_1E451B648();
  sub_1E451B728();
  uint64_t v1 = (ValueMetadata *)(*(uint64_t (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
  int64_t v5 = *(void *)(v0 + 72);
  unint64_t v6 = *(void *)(v0 + 80);
  if (!v6)
  {
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
    }
    else
    {
      int64_t v14 = (unint64_t)((1 << *(unsigned char *)(v0 + 120)) + 63) >> 6;
      uint64_t v1 = *(ValueMetadata **)(v0 + 24);
      if (v13 >= v14) {
        goto LABEL_28;
      }
      p_Description = &v1[3].Description;
      unint64_t v16 = *((void *)&v1[3].Description + v13);
      ++v5;
      if (v16)
      {
LABEL_11:
        uint64_t v8 = (v16 - 1) & v16;
        unint64_t v9 = __clz(__rbit64(v16)) + (v5 << 6);
        goto LABEL_3;
      }
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v16 = (unint64_t)p_Description[v5];
      if (v16) {
        goto LABEL_11;
      }
      int64_t v5 = v13 + 2;
      if (v13 + 2 >= v14) {
        goto LABEL_28;
      }
      unint64_t v16 = (unint64_t)p_Description[v5];
      if (v16) {
        goto LABEL_11;
      }
      int64_t v18 = v13 + 3;
      if (v18 >= v14)
      {
LABEL_28:
        swift_release();
        swift_task_dealloc();
        uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
        return v19();
      }
      unint64_t v16 = (unint64_t)p_Description[v18];
      if (v16)
      {
        int64_t v5 = v18;
        goto LABEL_11;
      }
      while (1)
      {
        int64_t v5 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          break;
        }
        if (v5 >= v14) {
          goto LABEL_28;
        }
        unint64_t v16 = (unint64_t)p_Description[v5];
        ++v18;
        if (v16) {
          goto LABEL_11;
        }
      }
    }
    __break(1u);
    return MEMORY[0x1F4185D40](v1, v2, v3, v4);
  }
  unint64_t v7 = __clz(__rbit64(v6));
  uint64_t v8 = (v6 - 1) & v6;
  unint64_t v9 = v7 | (v5 << 6);
  uint64_t v1 = *(ValueMetadata **)(v0 + 24);
LABEL_3:
  *(void *)(v0 + 72) = v5;
  *(void *)(v0 + 80) = v8;
  uint64_t v10 = *(void *)(v1[3].Kind + 8 * v9);
  if (v10)
  {
    if (v10 == 1)
    {
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_1E4507E8C;
      return sub_1E44FEC1C();
    }
    *(void *)(v0 + 16) = v10;
    uint64_t v1 = &type metadata for SearchItemIndexer.IndexItemType;
    uint64_t v4 = MEMORY[0x1E4FBB550];
    uint64_t v2 = v0 + 16;
    uint64_t v3 = &type metadata for SearchItemIndexer.IndexItemType;
    return MEMORY[0x1F4185D40](v1, v2, v3, v4);
  }
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x240], 8) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_1E4507ACC;
  return sub_1E450963C();
}

uint64_t sub_1E4507E8C()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E45082BC;
  }
  else {
    uint64_t v2 = sub_1E4507FA0;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4507FA0()
{
  sub_1E451B648();
  sub_1E451B728();
  uint64_t v1 = (ValueMetadata *)(*(uint64_t (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
  int64_t v5 = *(void *)(v0 + 72);
  unint64_t v6 = *(void *)(v0 + 80);
  if (!v6)
  {
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
    }
    else
    {
      int64_t v14 = (unint64_t)((1 << *(unsigned char *)(v0 + 120)) + 63) >> 6;
      uint64_t v1 = *(ValueMetadata **)(v0 + 24);
      if (v13 >= v14) {
        goto LABEL_28;
      }
      p_Description = &v1[3].Description;
      unint64_t v16 = *((void *)&v1[3].Description + v13);
      ++v5;
      if (v16)
      {
LABEL_11:
        uint64_t v8 = (v16 - 1) & v16;
        unint64_t v9 = __clz(__rbit64(v16)) + (v5 << 6);
        goto LABEL_3;
      }
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v16 = (unint64_t)p_Description[v5];
      if (v16) {
        goto LABEL_11;
      }
      int64_t v5 = v13 + 2;
      if (v13 + 2 >= v14) {
        goto LABEL_28;
      }
      unint64_t v16 = (unint64_t)p_Description[v5];
      if (v16) {
        goto LABEL_11;
      }
      int64_t v18 = v13 + 3;
      if (v18 >= v14)
      {
LABEL_28:
        swift_release();
        swift_task_dealloc();
        uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
        return v19();
      }
      unint64_t v16 = (unint64_t)p_Description[v18];
      if (v16)
      {
        int64_t v5 = v18;
        goto LABEL_11;
      }
      while (1)
      {
        int64_t v5 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          break;
        }
        if (v5 >= v14) {
          goto LABEL_28;
        }
        unint64_t v16 = (unint64_t)p_Description[v5];
        ++v18;
        if (v16) {
          goto LABEL_11;
        }
      }
    }
    __break(1u);
    return MEMORY[0x1F4185D40](v1, v2, v3, v4);
  }
  unint64_t v7 = __clz(__rbit64(v6));
  uint64_t v8 = (v6 - 1) & v6;
  unint64_t v9 = v7 | (v5 << 6);
  uint64_t v1 = *(ValueMetadata **)(v0 + 24);
LABEL_3:
  *(void *)(v0 + 72) = v5;
  *(void *)(v0 + 80) = v8;
  uint64_t v10 = *(void *)(v1[3].Kind + 8 * v9);
  if (v10)
  {
    if (v10 == 1)
    {
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_1E4507E8C;
      return sub_1E44FEC1C();
    }
    *(void *)(v0 + 16) = v10;
    uint64_t v1 = &type metadata for SearchItemIndexer.IndexItemType;
    uint64_t v4 = MEMORY[0x1E4FBB550];
    uint64_t v2 = v0 + 16;
    uint64_t v3 = &type metadata for SearchItemIndexer.IndexItemType;
    return MEMORY[0x1F4185D40](v1, v2, v3, v4);
  }
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x240], 8) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_1E4507ACC;
  return sub_1E450963C();
}

uint64_t sub_1E450824C()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E45082BC()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450832C()
{
  *(void *)(*(void *)v1 + 8_Block_object_dispose(&STACK[0x240], 8) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1E45088BC;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1E4508448;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4508448()
{
  *(void *)(v0 + 96) = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EBFF5438);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1E4508500;
  return sub_1E450963C();
}

uint64_t sub_1E4508500()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1E450892C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1E450861C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E450861C()
{
  *(void *)(v0 + 120) = sub_1E44AEDE8(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EBFF5430);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 12_Block_object_dispose(&STACK[0x240], 8) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1E45086E0;
  return sub_1E44FEC1C();
}

uint64_t sub_1E45086E0()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1E450899C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1E45087FC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E45087FC()
{
  id v1 = objc_msgSend(*(id *)(v0 + 64), sel_standardUserDefaults);
  uint64_t v2 = (void *)sub_1E451B858();
  objc_msgSend(v1, sel_setInteger_forKey_, 1, v2);

  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1E45088BC()
{
  swift_release();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450892C()
{
  swift_release();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450899C()
{
  swift_release();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E4508A9C()
{
  id v1 = *(void **)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v8 = *(void (**)(void *))(v0 + 104);
  sub_1E451B648();
  sub_1E451BC08();
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x240], 8) = 0xE000000000000000;
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  *(void *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
  sub_1E451BCB8();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  id v5 = v1;
  v8(v1);

  swift_task_dealloc();
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1E4508C4C()
{
  id v1 = *(void **)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v8 = *(void (**)(void *))(v0 + 104);
  sub_1E451B648();
  sub_1E451BC08();
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x240], 8) = 0xE000000000000000;
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  *(void *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
  sub_1E451BCB8();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  id v5 = v1;
  v8(v1);

  swift_task_dealloc();
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1E4508DF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48750);
    uint64_t v3 = sub_1E451BBF8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      uint64_t v7 = *(void *)(v6 + 8 * v4);
      sub_1E451BEB8();
      sub_1E451BEC8();
      uint64_t result = sub_1E451BEE8();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(void *)(v14 + 8 * v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(void *)(v14 + 8 * v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(void *)(v14 + 8 * v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1E4508F38()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E4508F80()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1E44DAA10;
  return sub_1E450777C(v2, v3, v4);
}

uint64_t sub_1E4509038()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E44DAA10;
  return sub_1E45061F8(v2, v3);
}

uint64_t sub_1E45090D8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1E44DAA10;
  return sub_1E4506794(v2, v3);
}

uint64_t sub_1E4509174()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1E44DAA10;
  return sub_1E4506E64();
}

unint64_t sub_1E450920C()
{
  unint64_t result = qword_1EAE48730;
  if (!qword_1EAE48730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48730);
  }
  return result;
}

unint64_t sub_1E4509264()
{
  unint64_t result = qword_1EAE48738;
  if (!qword_1EAE48738)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAE48740);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48738);
  }
  return result;
}

uint64_t type metadata accessor for SearchItemIndexer()
{
  return self;
}

uint64_t method lookup function for SearchItemIndexer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SearchItemIndexer);
}

uint64_t dispatch thunk of SearchItemIndexer.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

ValueMetadata *type metadata accessor for SearchItemIndexer.IndexItemType()
{
  return &type metadata for SearchItemIndexer.IndexItemType;
}

uint64_t sub_1E4509320()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4509358()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4509390()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E45093D8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1E4509428()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E4509468(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1E44DAA10;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EAE48768 + dword_1EAE48768);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1E4509534()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E450956C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E44DAA10;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE48778 + dword_1EAE48778);
  return v6(a1, v4);
}

uint64_t sub_1E450963C()
{
  v1[32] = v0;
  v1[33] = *v0;
  uint64_t v2 = sub_1E451B1D8();
  v1[34] = v2;
  v1[35] = *(void *)(v2 - 8);
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  uint64_t v3 = sub_1E451B668();
  v1[38] = v3;
  v1[39] = *(void *)(v3 - 8);
  v1[40] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E4509790, v0, 0);
}

uint64_t sub_1E4509790()
{
  uint64_t v2 = v0[39];
  uint64_t v1 = v0[40];
  uint64_t v3 = v0[38];
  sub_1E451B648();
  sub_1E451B718();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  v0[41] = v4;
  v0[42] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v5 = v4(v1, v3);
  v0[43] = sub_1E44AD550(v5);
  return MEMORY[0x1F4188298](sub_1E4509858, 0, 0);
}

uint64_t sub_1E4509858()
{
  objc_msgSend(*(id *)(v0 + 344), sel_beginIndexBatch);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1E4509914;
  v1[15] = *(void *)(v0 + 344);
  return MEMORY[0x1F4188298](sub_1E450B108, 0, 0);
}

uint64_t sub_1E4509914()
{
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E4509C44;
  }
  else {
    uint64_t v2 = sub_1E4509A28;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4509A28()
{
  uint64_t v1 = (void *)v0[43];
  uint64_t v2 = sub_1E451B248();
  v0[46] = v2;
  v0[10] = v0;
  v0[11] = sub_1E4509B34;
  uint64_t v3 = swift_continuation_init();
  v0[23] = MEMORY[0x1E4F143A8];
  v0[24] = 0x40000000;
  v0[25] = sub_1E44FBA50;
  v0[26] = &block_descriptor_27;
  v0[27] = v3;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v2, v0 + 23);
  return MEMORY[0x1F41881E8](v0 + 10);
}

uint64_t sub_1E4509B34()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 376) = v1;
  if (v1) {
    uint64_t v2 = sub_1E450A08C;
  }
  else {
    uint64_t v2 = sub_1E4509F28;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4509C44()
{
  id v7 = (id)v0[43];
  uint64_t v2 = v0[40];
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[41];
  uint64_t v3 = v0[38];
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1E451BE68();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  uint64_t v4 = sub_1E451B248();
  v0[48] = v4;
  v0[2] = v0;
  v0[3] = sub_1E4509E18;
  uint64_t v5 = swift_continuation_init();
  v0[18] = MEMORY[0x1E4F143A8];
  v0[19] = 0x40000000;
  v0[20] = sub_1E44FBA50;
  v0[21] = &block_descriptor_25;
  v0[22] = v5;
  objc_msgSend(v7, sel_endIndexBatchWithClientState_completionHandler_, v4);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E4509E18()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 392) = v1;
  if (v1) {
    uint64_t v2 = sub_1E450A214;
  }
  else {
    uint64_t v2 = sub_1E450A194;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4509F28()
{
  uint64_t v1 = *(void **)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 256);

  return MEMORY[0x1F4188298](sub_1E4509F9C, v2, 0);
}

uint64_t sub_1E4509F9C()
{
  uint64_t v1 = v0[36];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[34];
  uint64_t v4 = v0[35];
  sub_1E44ABD80();
  sub_1E451B178();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v1, v3);
  sub_1E44E5D3C();
  v5(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1E450A08C()
{
  uint64_t v1 = (void *)v0[46];
  swift_willThrow();

  v0[50] = v0[47];
  uint64_t v2 = v0[32];
  return MEMORY[0x1F4188298](sub_1E450A108, v2, 0);
}

uint64_t sub_1E450A108()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450A194()
{
  swift_willThrow();
  *(void *)(v0 + 400) = *(void *)(v0 + 360);
  uint64_t v1 = *(void *)(v0 + 256);
  return MEMORY[0x1F4188298](sub_1E450A108, v1, 0);
}

uint64_t sub_1E450A214()
{
  uint64_t v1 = (void *)v0[48];
  uint64_t v2 = (void *)v0[45];
  swift_willThrow();

  v0[50] = v0[49];
  uint64_t v3 = v0[32];
  return MEMORY[0x1F4188298](sub_1E450A108, v3, 0);
}

uint64_t sub_1E450A2AC(__int16 a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  id v7 = *(void **)v3;
  *(void *)(*(void *)v3 + 28_Block_object_dispose(&STACK[0x240], 8) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v8 = v6[20];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x1F4188298](sub_1E450AFE8, v8, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6[37] = a2;
    uint64_t v9 = (void *)swift_task_alloc();
    v6[38] = v9;
    *uint64_t v9 = v7;
    v9[1] = sub_1E450A484;
    uint64_t v10 = v6[31];
    uint64_t v11 = v6[34];
    return sub_1E450B994(v11, v10, a1, a2);
  }
}

uint64_t sub_1E450A484()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 312) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_1E450B05C;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 160);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E450A5D0;
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E450A5D0()
{
  sub_1E4496E64(v0[29], v0[30]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E450A644()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    *(void *)(v2 + 352) = v0;
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_1E450AA68;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_1E450A770;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E450A770()
{
  unint64_t v1 = sub_1E44AA0E0(MEMORY[0x1E4FBC860]);
  v0[41] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[42] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1E450A828;
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[25];
  return sub_1E450B994(v4, v3, 2, v1);
}

uint64_t sub_1E450A828()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 344) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_1E450A9EC;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 160);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E450A968;
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E450A968()
{
  uint64_t v1 = v0[29];
  unint64_t v2 = v0[30];
  swift_bridgeObjectRelease();
  sub_1E4496E64(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1E450A9EC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[44] = v0[43];
  uint64_t v1 = v0[20];
  return MEMORY[0x1F4188298](sub_1E450AA68, v1, 0);
}

uint64_t sub_1E450AA68()
{
  sub_1E4496E64(v0[29], v0[30]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E450AADC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 392) = v0;
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_1E450AEE8;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_1E450AC00;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E450AC00()
{
  unint64_t v1 = sub_1E44AA0E0(MEMORY[0x1E4FBC860]);
  v0[46] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[47] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1E450ACB8;
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[25];
  return sub_1E450B994(v4, v3, 2, v1);
}

uint64_t sub_1E450ACB8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 384) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_1E450AE78;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 160);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1E450ADF8;
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E450ADF8()
{
  sub_1E4496E64(v0[29], v0[30]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E450AE78()
{
  swift_bridgeObjectRelease();
  v0[49] = v0[48];
  uint64_t v1 = v0[20];
  return MEMORY[0x1F4188298](sub_1E450AEE8, v1, 0);
}

uint64_t sub_1E450AEE8()
{
  sub_1E4496E64(v0[29], v0[30]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E450AF68()
{
  uint64_t v1 = *(void **)(v0 + 216);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E450AFE8()
{
  sub_1E4496E64(v0[29], v0[30]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E450B05C()
{
  sub_1E4496E64(v0[29], v0[30]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1E450B0E8(uint64_t a1)
{
  *(void *)(v1 + 120) = a1;
  return MEMORY[0x1F4188298](sub_1E450B108, 0, 0);
}

uint64_t sub_1E450B108()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = sub_1E451B938();
  v0[16] = v2;
  v0[2] = v0;
  v0[3] = sub_1E44FF810;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E44FBA50;
  v0[13] = &block_descriptor_29;
  v0[14] = v3;
  objc_msgSend(v1, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v2, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E450B21C(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(_WORD *)(v4 + 160) = a2;
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 40) = *v3;
  uint64_t v5 = sub_1E451B1D8();
  *(void *)(v4 + 4_Block_object_dispose(&STACK[0x240], 8) = v5;
  *(void *)(v4 + 56) = *(void *)(v5 - 8);
  *(void *)(v4 + 64) = swift_task_alloc();
  *(void *)(v4 + 72) = swift_task_alloc();
  uint64_t v6 = sub_1E451B668();
  *(void *)(v4 + 80) = v6;
  *(void *)(v4 + 8_Block_object_dispose(&STACK[0x240], 8) = *(void *)(v6 - 8);
  *(void *)(v4 + 96) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E450B378, v3, 0);
}

uint64_t sub_1E450B378()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  MEMORY[0x1E4E801D0](v4, MEMORY[0x1E4FBB1A0]);
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B718();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = *(void *)(v0 + 24);
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t *)(v7 + 40);
    do
    {
      uint64_t v12 = *(v8 - 1);
      uint64_t v13 = *v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v14 = sub_1E4496570(v12, v13);
      LOBYTE(v12) = v15;
      swift_bridgeObjectRelease();
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1E44F54C4();
        }
        swift_bridgeObjectRelease();
        uint64_t v9 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v14);
        uint64_t v10 = *v9;
        unint64_t v11 = v9[1];
        sub_1E44F48E8(v14, v6);
        swift_bridgeObjectRelease();
        sub_1E4496E64(v10, v11);
      }
      swift_bridgeObjectRelease();
      v8 += 2;
      --v5;
    }
    while (v5);
    uint64_t v16 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = swift_bridgeObjectRetain();
  }
  *(void *)(v0 + 104) = v6;
  uint64_t v17 = *(void *)(v0 + 16);
  uint64_t v18 = *(unsigned __int16 *)(v0 + 160);
  *(void *)(v0 + 112) = sub_1E44AD550(v16);
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1E44FB67C(v18, v6);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 120) = v19;
  *(void *)(v0 + 12_Block_object_dispose(&STACK[0x240], 8) = v21;
  uint64_t v22 = swift_task_alloc();
  *(void *)(v0 + 136) = v22;
  *(void *)(v22 + 16) = v17;
  int v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v23;
  *int v23 = v0;
  v23[1] = sub_1E450B61C;
  return sub_1E44F9A4C(v19, v21, (uint64_t)&unk_1EAE487B8, v22);
}

uint64_t sub_1E450B61C()
{
  uint64_t v2 = (void *)*v1;
  v2[19] = v0;
  swift_task_dealloc();
  unint64_t v3 = v2[16];
  uint64_t v4 = v2[15];
  uint64_t v5 = (void *)v2[14];
  if (v0)
  {
    uint64_t v6 = v2[4];
    swift_bridgeObjectRelease();
    sub_1E4496E64(v4, v3);

    swift_task_dealloc();
    uint64_t v7 = sub_1E450B91C;
  }
  else
  {
    uint64_t v6 = v2[4];
    sub_1E4496E64(v2[15], v2[16]);

    swift_task_dealloc();
    uint64_t v7 = sub_1E450B7D8;
  }
  return MEMORY[0x1F4188298](v7, v6, 0);
}

uint64_t sub_1E450B7D8()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v6 + 112);
  uint64_t v9 = *(void *)(v6 + 120);
  uint64_t v10 = *(unsigned __int16 *)(v0 + 160);
  swift_bridgeObjectRetain();
  sub_1E44FB384(v8, v9, v10, v1);
  swift_bridgeObjectRelease();
  sub_1E44ABD80();
  sub_1E451B178();
  unint64_t v11 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v11(v3, v5);
  sub_1E44E5A58(v7, v2);
  v11(v2, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  uint64_t v13 = *(void *)(v0 + 104);
  uint64_t v14 = *(unsigned __int16 *)(v0 + 160);
  return v12(v14, v13);
}

uint64_t sub_1E450B91C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450B994(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  *(void *)(v5 + 96) = a4;
  *(void *)(v5 + 104) = v4;
  *(_WORD *)(v5 + 184) = a3;
  *(void *)(v5 + 80) = a1;
  *(void *)(v5 + 8_Block_object_dispose(&STACK[0x240], 8) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  *(void *)(v5 + 112) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E450BA30, v4, 0);
}

uint64_t sub_1E450BA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = *(void *)(v5 + 80);
  if (!(v6 >> 62))
  {
    int64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v8 = *(void *)(v5 + 88);
    if (v8) {
      goto LABEL_3;
    }
LABEL_16:
    __break(1u);
    return MEMORY[0x1F4187D90](a1, a2, a3, a4, a5);
  }
  swift_bridgeObjectRetain();
  int64_t v7 = sub_1E451BCD8();
  a1 = swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v5 + 88);
  if (!v8) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v9 = *(void *)(v5 + 96);
  __int16 v10 = *(_WORD *)(v5 + 184);
  unint64_t v11 = *(void *)(v5 + 80);
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1E450D030(0, v7, v8, v11, v8);
  *(void *)(v5 + 120) = v12;
  uint64_t v13 = swift_allocObject();
  *(void *)(v5 + 12_Block_object_dispose(&STACK[0x240], 8) = v13;
  *(_WORD *)(v13 + 16) = v10;
  *(void *)(v13 + 24) = v9;
  uint64_t v14 = *(void *)(v12 + 16);
  *(void *)(v5 + 136) = v14;
  if (v14)
  {
    uint64_t v15 = sub_1E450E2A4(&qword_1EAE487C8, &qword_1EBFF5438);
    *(void *)(v5 + 144) = v15;
    *(void *)(v5 + 152) = 0;
    uint64_t v16 = *(void *)(v5 + 104);
    uint64_t v17 = *(void *)(v5 + 112);
    uint64_t v18 = *(void *)(v12 + 32);
    uint64_t v19 = sub_1E451BA28();
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    swift_bridgeObjectRetain();
    v21(v17, 1, 1, v19);
    uint64_t v22 = (void *)swift_allocObject();
    id v22[2] = v16;
    v22[3] = v15;
    v22[4] = v18;
    v22[5] = v16;
    v22[6] = v13;
    LODWORD(v21) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v17, 1, v19);
    swift_retain_n();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v23 = *(void *)(v5 + 112);
    if (v21 == 1)
    {
      sub_1E44DD780(*(void *)(v5 + 112), &qword_1EBFF5898);
      if (v16) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_1E451BA18();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v23, v19);
      if (v22[2])
      {
LABEL_6:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v24 = sub_1E451B9A8();
        uint64_t v26 = v25;
        swift_unknownObjectRelease();
        if (v26 | v24)
        {
          *(void *)(v5 + 16) = 0;
          *(void *)(v5 + 24) = 0;
          *(void *)(v5 + 32) = v24;
          *(void *)(v5 + 40) = v26;
        }
      }
    }
    uint64_t v31 = MEMORY[0x1E4FBC848] + 8;
    uint64_t v32 = swift_task_create();
    *(void *)(v5 + 160) = v32;
    unint64_t v33 = (void *)swift_task_alloc();
    *(void *)(v5 + 16_Block_object_dispose(&STACK[0x240], 8) = v33;
    a1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
    void *v33 = v5;
    v33[1] = sub_1E450BE58;
    a5 = MEMORY[0x1E4FBC0F0];
    a2 = v32;
    a3 = v31;
    a4 = a1;
    return MEMORY[0x1F4187D90](a1, a2, a3, a4, a5);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v27 = *(void *)(v13 + 24);
  uint64_t v28 = *(unsigned __int16 *)(v13 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_task_dealloc();
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  return v29(v28, v27);
}

uint64_t sub_1E450BE58()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = sub_1E450C2C8;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 104);
    uint64_t v4 = sub_1E450BF8C;
  }
  return MEMORY[0x1F4188298](v4, v5, 0);
}

uint64_t sub_1E450BF8C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[17];
  swift_release();
  if (v1 + 1 == v2)
  {
    uint64_t v3 = v0[16];
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v4 = *(void *)(v3 + 24);
    uint64_t v5 = *(unsigned __int16 *)(v3 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    swift_task_dealloc();
    unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v6(v5, v4);
  }
  uint64_t v8 = v0[18];
  uint64_t v9 = v0[19] + 1;
  v0[19] = v9;
  uint64_t v10 = v0[16];
  uint64_t v11 = v0[13];
  uint64_t v12 = v0[14];
  uint64_t v13 = *(void *)(v0[15] + 8 * v9 + 32);
  uint64_t v14 = sub_1E451BA28();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v12, 1, 1, v14);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v11;
  void v16[3] = v8;
  v16[4] = v13;
  v16[5] = v11;
  v16[6] = v10;
  LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v17 = v0[14];
  if (v12 == 1)
  {
    sub_1E44DD780(v0[14], &qword_1EBFF5898);
    if (v11) {
      goto LABEL_7;
    }
  }
  else
  {
    sub_1E451BA18();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v14);
    if (v16[2])
    {
LABEL_7:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v18 = sub_1E451B9A8();
      uint64_t v20 = v19;
      swift_unknownObjectRelease();
      if (v20 | v18)
      {
        v0[2] = 0;
        v0[3] = 0;
        v0[4] = v18;
        v0[5] = v20;
      }
    }
  }
  uint64_t v21 = MEMORY[0x1E4FBC848] + 8;
  uint64_t v22 = swift_task_create();
  v0[20] = v22;
  uint64_t v23 = (void *)swift_task_alloc();
  v0[21] = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5980);
  *uint64_t v23 = v0;
  v23[1] = sub_1E450BE58;
  uint64_t v25 = MEMORY[0x1E4FBC0F0];
  return MEMORY[0x1F4187D90](v24, v22, v21, v24, v25);
}

uint64_t sub_1E450C2C8()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450C338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[12] = a4;
  uint64_t v8 = sub_1E451B668();
  v6[15] = v8;
  v6[16] = *(void *)(v8 - 8);
  v6[17] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E450C400, a5, 0);
}

uint64_t sub_1E450C400()
{
  unint64_t v1 = v0[12];
  sub_1E451B648();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v4 = v0[16];
  uint64_t v3 = v0[17];
  uint64_t v5 = v0[15];
  v0[11] = v2;
  sub_1E451BDC8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B728();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  unint64_t v6 = (void *)swift_task_alloc();
  v0[18] = v6;
  void *v6 = v0;
  v6[1] = sub_1E450C5A8;
  uint64_t v7 = v0[12];
  return sub_1E44DAEC0(v7);
}

uint64_t sub_1E450C5A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 104);
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1E450C6C0, v2, 0);
}

uint64_t sub_1E450C6C0()
{
  uint64_t v20 = v0;
  unint64_t v1 = v0[19];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    uint64_t v2 = v0[14];
    unint64_t v3 = v0[12];
    swift_beginAccess();
    uint64_t v4 = sub_1E449BD7C(v3);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = 0x8000000000000000;
    sub_1E450D51C(v4, (uint64_t)sub_1E450D9E8, 0, isUniquelyReferenced_nonNull_native, &v19);
    *(void *)(v2 + 24) = v19;
    swift_bridgeObjectRelease();
    uint64_t v6 = v0[19];
    uint64_t v7 = v0[14];
    uint64_t v8 = swift_endAccess();
    v0[20] = sub_1E44AD550(v8);
    swift_beginAccess();
    uint64_t v9 = *(void *)(v2 + 24);
    uint64_t v10 = *(unsigned __int16 *)(v7 + 16);
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1E44FB67C(v10, v9);
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v0[21] = v11;
    v0[22] = v13;
    uint64_t v14 = swift_task_alloc();
    v0[23] = v14;
    *(void *)(v14 + 16) = v6;
    uint64_t v15 = (void *)swift_task_alloc();
    v0[24] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_1E450C938;
    return sub_1E44F9A4C(v11, v13, (uint64_t)&unk_1EAE487E0, v14);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_1E450C938()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[13];
    uint64_t v4 = sub_1E450CB48;
  }
  else
  {
    unint64_t v5 = v2[22];
    uint64_t v7 = (void *)v2[20];
    uint64_t v6 = v2[21];
    uint64_t v8 = v2[13];
    swift_bridgeObjectRelease();
    sub_1E4496E64(v6, v5);

    swift_task_dealloc();
    uint64_t v4 = sub_1E450CA90;
    uint64_t v3 = v8;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1E450CA90()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(void *)(v1 + 112);
  uint64_t v5 = *(void *)(v1 + 120);
  uint64_t v6 = *(unsigned __int16 *)(v2 + 16);
  swift_bridgeObjectRetain();
  sub_1E44FB384(v4, v5, v6, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1E450CB48()
{
  unint64_t v1 = v0[22];
  uint64_t v3 = (void *)v0[20];
  uint64_t v2 = v0[21];
  swift_bridgeObjectRelease();
  sub_1E4496E64(v2, v1);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1E450CBE8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 12_Block_object_dispose(&STACK[0x240], 8) = a2;
  return MEMORY[0x1F4188298](sub_1E450CC08, 0, 0);
}

uint64_t sub_1E450CC08()
{
  unint64_t v1 = (void *)v0[15];
  sub_1E450E264();
  uint64_t v2 = sub_1E451B938();
  v0[17] = v2;
  v0[2] = v0;
  v0[3] = sub_1E450CD20;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E44FBA50;
  v0[13] = &block_descriptor_23;
  v0[14] = v3;
  objc_msgSend(v1, sel_indexSearchableItems_completionHandler_, v2, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E450CD20()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_1E450CE94;
  }
  else {
    uint64_t v2 = sub_1E450CE30;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E450CE30()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E450CE94()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1E450CF04(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 12_Block_object_dispose(&STACK[0x240], 8) = a2;
  return MEMORY[0x1F4188298](sub_1E450CF24, 0, 0);
}

uint64_t sub_1E450CF24()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = sub_1E451B938();
  v0[17] = v2;
  v0[2] = v0;
  v0[3] = sub_1E450CD20;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1E44FBA50;
  v0[13] = &block_descriptor_11_0;
  v0[14] = v3;
  objc_msgSend(v1, sel_deleteSearchableItemsWithIdentifiers_completionHandler_, v2, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1E450D030(uint64_t a1, int64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v9 = a1;
  int64_t v10 = 0;
  int64_t v11 = a1;
  while (1)
  {
    BOOL v12 = v11 <= a2;
    if (a3 > 0) {
      BOOL v12 = v11 >= a2;
    }
    if (v12) {
      break;
    }
    BOOL v13 = __OFADD__(v11, a3);
    v11 += a3;
    if (v13) {
      int64_t v11 = (v11 >> 63) ^ 0x8000000000000000;
    }
    BOOL v13 = __OFADD__(v10++, 1);
    if (v13)
    {
      __break(1u);
      break;
    }
  }
  uint64_t v32 = MEMORY[0x1E4FBC860];
  uint64_t result = (uint64_t)sub_1E4513FA8(0, v10, 0);
  uint64_t v15 = v32;
  if (v10)
  {
    while (1)
    {
      BOOL v16 = v9 <= a2;
      if (a3 > 0) {
        BOOL v16 = v9 >= a2;
      }
      if (v16) {
        break;
      }
      if (__OFADD__(v9, a3)) {
        int64_t v17 = ((v9 + a3) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v17 = v9 + a3;
      }
      uint64_t result = sub_1E45012EC(v9, a4, a5, (uint64_t)v31);
      if (v6) {
        goto LABEL_37;
      }
      uint64_t v18 = result;
      uint64_t v6 = 0;
      uint64_t v32 = v15;
      unint64_t v20 = *(void *)(v15 + 16);
      unint64_t v19 = *(void *)(v15 + 24);
      if (v20 >= v19 >> 1)
      {
        uint64_t result = (uint64_t)sub_1E4513FA8((void *)(v19 > 1), v20 + 1, 1);
        uint64_t v15 = v32;
      }
      *(void *)(v15 + 16) = v20 + 1;
      *(void *)(v15 + 8 * v20 + 32) = v18;
      uint64_t v9 = v17;
      if (!--v10) {
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  else
  {
    int64_t v17 = v9;
LABEL_23:
    BOOL v21 = v17 <= a2;
    if (a3 > 0) {
      BOOL v21 = v17 >= a2;
    }
    if (v21)
    {
LABEL_26:
      swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        int64_t v22 = __OFADD__(v17, a3) ? ((v17 + a3) >> 63) ^ 0x8000000000000000 : v17 + a3;
        uint64_t v23 = sub_1E45012EC(v17, a4, a5, (uint64_t)v30);
        if (v6) {
          break;
        }
        uint64_t v24 = v23;
        uint64_t v6 = 0;
        uint64_t v32 = v15;
        unint64_t v26 = *(void *)(v15 + 16);
        unint64_t v25 = *(void *)(v15 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_1E4513FA8((void *)(v25 > 1), v26 + 1, 1);
          uint64_t v15 = v32;
        }
        *(void *)(v15 + 16) = v26 + 1;
        *(void *)(v15 + 8 * v26 + 32) = v24;
        BOOL v27 = v22 <= a2;
        if (a3 > 0) {
          BOOL v27 = v22 >= a2;
        }
        int64_t v17 = v22;
        if (v27) {
          goto LABEL_26;
        }
      }
LABEL_37:
      swift_bridgeObjectRelease();
      swift_release();
    }
    return v15;
  }
  return result;
}

uint64_t sub_1E450D264(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1E4E804C0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1E450D828(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1E451BCD8();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_1E451B968();
}

uint64_t sub_1E450D430(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_1E44F357C((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1E450D51C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v55 = a1;
  uint64_t v56 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v57 = v8;
  uint64_t v58 = 0;
  uint64_t v59 = v11 & v9;
  uint64_t v60 = a2;
  uint64_t v61 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1E450DA34(&v52);
  uint64_t v12 = *((void *)&v52 + 1);
  if (!*((void *)&v52 + 1)) {
    goto LABEL_27;
  }
  uint64_t v13 = v52;
  uint64_t v15 = v53;
  uint64_t v14 = v54;
  BOOL v16 = (void *)*a5;
  unint64_t v18 = sub_1E4496570(v52, *((uint64_t *)&v52 + 1));
  uint64_t v19 = v16[2];
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  char v22 = v17;
  if (v16[3] >= v21)
  {
    if (a4)
    {
      unint64_t v25 = (void *)*a5;
      if (v17) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_1E44F54C4();
      unint64_t v25 = (void *)*a5;
      if (v22) {
        goto LABEL_12;
      }
    }
LABEL_14:
    v25[(v18 >> 6) + 8] |= 1 << v18;
    BOOL v27 = (uint64_t *)(v25[6] + 16 * v18);
    *BOOL v27 = v13;
    v27[1] = v12;
    uint64_t v28 = (void *)(v25[7] + 16 * v18);
    *uint64_t v28 = v15;
    v28[1] = v14;
    uint64_t v29 = v25[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    void v25[2] = v31;
LABEL_16:
    sub_1E450DA34(&v52);
    for (uint64_t i = *((void *)&v52 + 1); *((void *)&v52 + 1); uint64_t i = *((void *)&v52 + 1))
    {
      uint64_t v34 = v52;
      uint64_t v36 = v53;
      uint64_t v35 = v54;
      uint64_t v37 = (void *)*a5;
      unint64_t v39 = sub_1E4496570(v52, i);
      uint64_t v40 = v37[2];
      BOOL v41 = (v38 & 1) == 0;
      uint64_t v42 = v40 + v41;
      if (__OFADD__(v40, v41)) {
        goto LABEL_28;
      }
      char v43 = v38;
      if (v37[3] < v42)
      {
        sub_1E449C07C(v42, 1);
        unint64_t v44 = sub_1E4496570(v34, i);
        if ((v43 & 1) != (v45 & 1)) {
          goto LABEL_30;
        }
        unint64_t v39 = v44;
      }
      __int16 v46 = (void *)*a5;
      if (v43)
      {
        swift_bridgeObjectRelease();
        uint64_t v33 = v46[7] + 16 * v39;
        sub_1E4496E64(*(void *)v33, *(void *)(v33 + 8));
        *(void *)uint64_t v33 = v36;
        *(void *)(v33 + _Block_object_dispose(&STACK[0x240], 8) = v35;
      }
      else
      {
        v46[(v39 >> 6) + 8] |= 1 << v39;
        uint64_t v47 = (uint64_t *)(v46[6] + 16 * v39);
        *uint64_t v47 = v34;
        v47[1] = i;
        uint64_t v48 = (void *)(v46[7] + 16 * v39);
        *uint64_t v48 = v36;
        v48[1] = v35;
        uint64_t v49 = v46[2];
        BOOL v30 = __OFADD__(v49, 1);
        uint64_t v50 = v49 + 1;
        if (v30) {
          goto LABEL_29;
        }
        v46[2] = v50;
      }
      sub_1E450DA34(&v52);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1E44E1E84();
    return swift_release();
  }
  sub_1E449C07C(v21, a4 & 1);
  unint64_t v23 = sub_1E4496570(v13, v12);
  if ((v22 & 1) == (v24 & 1))
  {
    unint64_t v18 = v23;
    unint64_t v25 = (void *)*a5;
    if ((v22 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    uint64_t v26 = v25[7] + 16 * v18;
    sub_1E4496E64(*(void *)v26, *(void *)(v26 + 8));
    *(void *)uint64_t v26 = v15;
    *(void *)(v26 + _Block_object_dispose(&STACK[0x240], 8) = v14;
    goto LABEL_16;
  }
LABEL_30:
  uint64_t result = sub_1E451BE58();
  __break(1u);
  return result;
}

uint64_t sub_1E450D828(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1E451BCD8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1E451BCD8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1E450E2A4(&qword_1EAE487F8, &qword_1EAE487F0);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE487F0);
            uint64_t v10 = sub_1E4503500(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1E451B798();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1E450D9E8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  a2[2] = v4;
  a2[3] = v5;
  *a2 = v3;
  a2[1] = v2;
  swift_bridgeObjectRetain();

  return sub_1E44957E4(v4, v5);
}

void sub_1E450DA34(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  int64_t v5 = v1[3];
  unint64_t v4 = v1[4];
  int64_t v6 = v5;
  if (!v4)
  {
    int64_t v17 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      return;
    }
    int64_t v18 = (unint64_t)(v1[2] + 64) >> 6;
    if (v17 < v18)
    {
      uint64_t v19 = v1[1];
      unint64_t v20 = *(void *)(v19 + 8 * v17);
      if (v20)
      {
LABEL_9:
        uint64_t v7 = (v20 - 1) & v20;
        unint64_t v8 = __clz(__rbit64(v20)) + (v17 << 6);
        int64_t v6 = v17;
        goto LABEL_3;
      }
      int64_t v21 = v5 + 2;
      int64_t v6 = v5 + 1;
      if (v5 + 2 < v18)
      {
        unint64_t v20 = *(void *)(v19 + 8 * v21);
        if (v20)
        {
LABEL_12:
          int64_t v17 = v21;
          goto LABEL_9;
        }
        int64_t v6 = v5 + 2;
        if (v5 + 3 < v18)
        {
          unint64_t v20 = *(void *)(v19 + 8 * (v5 + 3));
          if (v20)
          {
            int64_t v17 = v5 + 3;
            goto LABEL_9;
          }
          int64_t v21 = v5 + 4;
          int64_t v6 = v5 + 3;
          if (v5 + 4 < v18)
          {
            unint64_t v20 = *(void *)(v19 + 8 * v21);
            if (v20) {
              goto LABEL_12;
            }
            int64_t v17 = v5 + 5;
            int64_t v6 = v5 + 4;
            if (v5 + 5 < v18)
            {
              unint64_t v20 = *(void *)(v19 + 8 * v17);
              if (v20) {
                goto LABEL_9;
              }
              int64_t v6 = v18 - 1;
              int64_t v22 = v5 + 6;
              while (v18 != v22)
              {
                unint64_t v20 = *(void *)(v19 + 8 * v22++);
                if (v20)
                {
                  int64_t v17 = v22 - 1;
                  goto LABEL_9;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v6;
    v1[4] = 0;
    *a1 = 0u;
    a1[1] = 0u;
    return;
  }
  uint64_t v7 = (v4 - 1) & v4;
  unint64_t v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
  uint64_t v9 = 16 * v8;
  uint64_t v10 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v8);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (uint64_t *)(*(void *)(v3 + 56) + v9);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  v1[3] = v6;
  v1[4] = v7;
  BOOL v16 = (void (*)(void *))v1[5];
  v23[0] = v11;
  v23[1] = v12;
  v23[2] = v14;
  v23[3] = v15;
  swift_bridgeObjectRetain();
  sub_1E44957E4(v14, v15);
  v16(v23);
  swift_bridgeObjectRelease();

  sub_1E4496E64(v14, v15);
}

uint64_t sub_1E450DBFC(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v4 = &selRef_frameworkBundle;
      int64_t v5 = &selRef_frameworkBundle;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v6 = (id)MEMORY[0x1E4E804B0](v3, a1);
LABEL_7:
        uint64_t v7 = v6;
        unint64_t v8 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_18;
        }
        if (([v6 v4[504]] & 2) == 0
          || ([v7 v5[123]] & 1) != 0
          || objc_msgSend(v7, sel_isOutro)
          || (objc_msgSend(v7, sel_isLinkedArticle) & 1) != 0)
        {
        }
        else
        {
          sub_1E451BC68();
          sub_1E451BC98();
          int64_t v5 = &selRef_frameworkBundle;
          sub_1E451BCA8();
          sub_1E451BC78();
          unint64_t v4 = &selRef_frameworkBundle;
        }
        ++v3;
        if (v8 == v2) {
          return v10;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      uint64_t v2 = sub_1E451BCD8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    id v6 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1E450DD8C(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  uint64_t v25 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v19 = v3;
      unint64_t v5 = 0;
      uint64_t v23 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v24 = v3 & 0xC000000000000001;
      uint64_t v21 = v4;
      int64_t v22 = (void *)(v3 + 32);
      unint64_t v20 = a2 + 7;
      while (1)
      {
        if (v24)
        {
          id v6 = (id)MEMORY[0x1E4E804B0](v5, v19);
        }
        else
        {
          if (v5 >= *(void *)(v23 + 16))
          {
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          id v6 = (id)v22[v5];
        }
        uint64_t v7 = v6;
        if (__OFADD__(v5++, 1)) {
          goto LABEL_31;
        }
        id v9 = objc_msgSend(v6, sel_identifier);
        uint64_t v10 = sub_1E451B868();
        unint64_t v3 = (unint64_t)v11;

        uint64_t v12 = (void *)a2[2];
        if (v12) {
          break;
        }

        swift_bridgeObjectRelease();
LABEL_5:
        if (v5 == v4) {
          return v25;
        }
      }
      uint64_t v13 = a2;
      BOOL v14 = a2[4] == v10 && a2[5] == v3;
      if (v14 || (sub_1E451BDE8() & 1) != 0) {
        break;
      }
      if (v12 == (void *)1)
      {
LABEL_27:

        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      unint64_t v15 = v20;
      uint64_t v16 = 1;
      while (1)
      {
        a2 = (void *)(v16 + 1);
        if (__OFADD__(v16, 1)) {
          break;
        }
        BOOL v17 = *(v15 - 1) == v10 && *v15 == v3;
        if (v17 || (sub_1E451BDE8() & 1) != 0) {
          goto LABEL_16;
        }
        v15 += 2;
        ++v16;
        if (a2 == v12) {
          goto LABEL_27;
        }
      }
LABEL_32:
      __break(1u);
LABEL_33:
      uint64_t v4 = sub_1E451BCD8();
      if (!v4) {
        return MEMORY[0x1E4FBC860];
      }
    }
LABEL_16:
    swift_bridgeObjectRelease();
    sub_1E451BC68();
    sub_1E451BC98();
    sub_1E451BCA8();
    unint64_t v3 = (unint64_t)&v25;
    sub_1E451BC78();
LABEL_17:
    uint64_t v4 = v21;
    a2 = v13;
    goto LABEL_5;
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1E450DFB4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1E44AE0C8;
  v5[15] = a1;
  v5[16] = v4;
  return MEMORY[0x1F4188298](sub_1E450CF24, 0, 0);
}

uint64_t sub_1E450E064()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E450E09C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1E450E0EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_1E44DAA10;
  return sub_1E450C338(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1E450E1B4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E44DAA10;
  v5[15] = a1;
  v5[16] = v4;
  return MEMORY[0x1F4188298](sub_1E450CC08, 0, 0);
}

unint64_t sub_1E450E264()
{
  unint64_t result = qword_1EBFF5258;
  if (!qword_1EBFF5258)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBFF5258);
  }
  return result;
}

uint64_t sub_1E450E2A4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1E450E2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[16] = a5;
  v6[17] = v5;
  v6[14] = a3;
  v6[15] = a4;
  v6[12] = a1;
  v6[13] = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48860);
  v6[18] = v7;
  v6[19] = *(void *)(v7 - 8);
  v6[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5210);
  v6[21] = swift_task_alloc();
  uint64_t v8 = sub_1E451B538();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48868);
  v6[25] = v9;
  v6[26] = *(void *)(v9 - 8);
  v6[27] = swift_task_alloc();
  uint64_t v10 = sub_1E451B4F8();
  v6[28] = v10;
  v6[29] = *(void *)(v10 - 8);
  v6[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48828);
  v6[31] = swift_task_alloc();
  uint64_t v11 = sub_1E451B478();
  v6[32] = v11;
  v6[33] = *(void *)(v11 - 8);
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  uint64_t v12 = sub_1E451B548();
  v6[36] = v12;
  v6[37] = *(void *)(v12 - 8);
  v6[38] = swift_task_alloc();
  uint64_t v13 = sub_1E451B578();
  v6[39] = v13;
  v6[40] = *(void *)(v13 - 8);
  v6[41] = swift_task_alloc();
  uint64_t v14 = sub_1E451B668();
  v6[42] = v14;
  v6[43] = *(void *)(v14 - 8);
  v6[44] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E450E6AC, 0, 0);
}

uint64_t sub_1E450E6AC()
{
  uint64_t v1 = v0[43];
  uint64_t v2 = v0[44];
  uint64_t v26 = v0[40];
  uint64_t v27 = v0[39];
  uint64_t v3 = v0[37];
  uint64_t v22 = v0[42];
  uint64_t v23 = v0[38];
  uint64_t v24 = v0[36];
  uint64_t v25 = v0[41];
  uint64_t v29 = v0[35];
  uint64_t v30 = v0[33];
  uint64_t v31 = v0[34];
  uint64_t v32 = v0[32];
  uint64_t v28 = v0[31];
  uint64_t v33 = v0[21];
  sub_1E451B628();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B718();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v0[45] = v4;
  v0[46] = (v1 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v2, v22);
  uint64_t v5 = self;
  swift_bridgeObjectRetain();
  id v6 = objc_msgSend(v5, sel_defaultEnvironment);
  unint64_t v7 = sub_1E4510B5C();
  uint64_t v8 = MEMORY[0x1E4F4AD18];
  v0[2] = v6;
  v0[5] = v7;
  v0[6] = v8;
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v23, *MEMORY[0x1E4F4ACB0], v24);
  sub_1E451B568();
  uint64_t v9 = sub_1E451B558();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  v0[47] = v9;
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v12 = sub_1E451B488();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v28, 1, 1, v12);
  swift_bridgeObjectRetain();
  sub_1E451B468();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v31, v29, v32);
  swift_bridgeObjectRetain();
  sub_1E451B4E8();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = sub_1E451B5D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v33, 1, 1, v14);
  sub_1E451B528();
  sub_1E451B518();
  sub_1E451B458();
  swift_allocObject();
  uint64_t v15 = sub_1E451B448();
  v0[48] = v15;
  uint64_t v16 = (void *)swift_task_alloc();
  v0[49] = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_1E450EAF0;
  uint64_t v17 = v0[30];
  uint64_t v18 = v0[27];
  uint64_t v19 = v0[24];
  uint64_t v20 = MEMORY[0x1E4F4AC78];
  return MEMORY[0x1F4108A48](v18, v17, v19, v15, v20, ObjectType, v11);
}

uint64_t sub_1E450EAF0()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 400) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[23] + 8))(v2[24], v2[22]);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_1E450EEB0;
  }
  else {
    uint64_t v3 = sub_1E450EC74;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_1E450EC74()
{
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  sub_1E451B508();
  sub_1E451B588();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v6 = *(void *)(v0 + 232);
  uint64_t v16 = *(void *)(v0 + 240);
  uint64_t v17 = *(void *)(v0 + 256);
  uint64_t v7 = *(void *)(v0 + 216);
  uint64_t v15 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v8 = *(void *)(v0 + 208);
  uint64_t v11 = *(void **)(v0 + 88);
  uint64_t v10 = *(_OWORD **)(v0 + 96);
  if (v11)
  {
    id v12 = objc_msgSend(*(id *)(v0 + 88), sel_value);

    sub_1E451BB78();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v16, v15);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v17);
  }
  else
  {
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v16, v15);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v17);
    *uint64_t v10 = 0u;
    v10[1] = 0u;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_1E450EEB0()
{
  uint64_t v1 = v0[44];
  uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[45];
  uint64_t v8 = v0[42];
  uint64_t v2 = v0[35];
  uint64_t v3 = v0[33];
  uint64_t v11 = v0[32];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[29];
  uint64_t v10 = v0[28];
  sub_1E451B628();
  sub_1E451BC08();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1E451BE68();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  v9(v1, v8);
  swift_willThrow();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1E450F254(int a1, int a2, uint64_t a3, void *aBlock, void *a5)
{
  v5[10] = a5;
  v5[11] = _Block_copy(aBlock);
  uint64_t v8 = sub_1E451B868();
  uint64_t v10 = v9;
  v5[12] = v9;
  uint64_t v11 = sub_1E451B868();
  uint64_t v13 = v12;
  v5[13] = v12;
  if (a3) {
    uint64_t v14 = sub_1E451B818();
  }
  else {
    uint64_t v14 = 0;
  }
  v5[14] = v14;
  a5;
  uint64_t v15 = (void *)swift_task_alloc();
  v5[15] = v15;
  *uint64_t v15 = v5;
  v15[1] = sub_1E4510DD8;
  return sub_1E450E2E8((uint64_t)(v5 + 2), v8, v10, v11, v13);
}

uint64_t sub_1E450F398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[24] = a6;
  v7[25] = v6;
  v7[22] = a4;
  v7[23] = a5;
  v7[20] = a2;
  v7[21] = a3;
  v7[19] = a1;
  uint64_t v8 = sub_1E451B5A8();
  v7[26] = v8;
  v7[27] = *(void *)(v8 - 8);
  v7[28] = swift_task_alloc();
  uint64_t v9 = sub_1E451B4D8();
  v7[29] = v9;
  v7[30] = *(void *)(v9 - 8);
  v7[31] = swift_task_alloc();
  uint64_t v10 = sub_1E451B668();
  v7[32] = v10;
  v7[33] = *(void *)(v10 - 8);
  v7[34] = swift_task_alloc();
  v7[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE48828);
  v7[36] = swift_task_alloc();
  uint64_t v11 = sub_1E451B478();
  v7[37] = v11;
  v7[38] = *(void *)(v11 - 8);
  v7[39] = swift_task_alloc();
  v7[40] = swift_task_alloc();
  uint64_t v12 = sub_1E451B548();
  v7[41] = v12;
  v7[42] = *(void *)(v12 - 8);
  v7[43] = swift_task_alloc();
  uint64_t v13 = sub_1E451B578();
  v7[44] = v13;
  v7[45] = *(void *)(v13 - 8);
  v7[46] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E450F680, 0, 0);
}

uint64_t sub_1E450F680()
{
  uint64_t v1 = v0;
  uint64_t v36 = 0x65756C6176;
  uint64_t v3 = v0[45];
  uint64_t v2 = v0[46];
  uint64_t v4 = v0[43];
  uint64_t v5 = v0[42];
  uint64_t v35 = v0[41];
  uint64_t v27 = v0[44];
  uint64_t v28 = v0[36];
  uint64_t v33 = v0[24];
  uint64_t v6 = self;
  swift_bridgeObjectRetain();
  id v7 = objc_msgSend(v6, sel_defaultEnvironment);
  unint64_t v8 = sub_1E4510B5C();
  v0[2] = v7;
  uint64_t v9 = v0 + 2;
  uint64_t v10 = MEMORY[0x1E4F4AD18];
  v9[3] = v8;
  v9[4] = v10;
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x1E4F4ACB0], v35);
  sub_1E451B568();
  uint64_t v11 = sub_1E451B558();
  uint64_t v34 = v12;
  swift_bridgeObjectRelease();
  v9[45] = v11;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  uint64_t v13 = sub_1E451B488();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v28, 1, 1, v13);
  swift_bridgeObjectRetain();
  sub_1E451B468();
  if (v33
    && (uint64_t v14 = v1[24], *(void *)(v14 + 16))
    && (unint64_t v15 = sub_1E4496570(0x79747265706F7270, 0xEC000000656D614ELL), (v16 & 1) != 0))
  {
    uint64_t v17 = (uint64_t *)(*(void *)(v14 + 56) + 16 * v15);
    unint64_t v18 = v17[1];
    uint64_t v36 = *v17;
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v18 = 0xE500000000000000;
  }
  v1[48] = v36;
  v1[49] = v18;
  uint64_t v19 = v1[38];
  uint64_t v31 = v1[37];
  uint64_t v32 = v1[40];
  uint64_t v20 = v1[35];
  uint64_t v21 = v1[33];
  uint64_t v29 = v1[32];
  uint64_t v30 = v1[39];
  sub_1E451B628();
  sub_1E451BC08();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B718();
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v1[50] = v22;
  v1[51] = (v21 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v22(v20, v29);
  sub_1E451B4B8();
  swift_bridgeObjectRetain();
  sub_1E451B4C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v30, v32, v31);
  sub_1E451B598();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v24 = (void *)swift_task_alloc();
  v1[52] = v24;
  *uint64_t v24 = v1;
  v24[1] = sub_1E450FAC8;
  uint64_t v25 = v1[28];
  return MEMORY[0x1F4108A58](v25, ObjectType, v34);
}

uint64_t sub_1E450FAC8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 424) = a1;
  *(void *)(v3 + 432) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_1E451009C;
  }
  else {
    uint64_t v4 = sub_1E450FBDC;
  }
  return MEMORY[0x1F4188298](v4, 0, 0);
}

uint64_t sub_1E450FBDC()
{
  uint64_t v1 = *(void **)(v0 + 424);
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = (void *)sub_1E451BB48();
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = objc_msgSend(v2, sel_value);

      sub_1E451BB78();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 56) = 0u;
      *(_OWORD *)(v0 + 72) = 0u;
    }
    sub_1E44E59F0(v0 + 56, v0 + 88);
    if (*(void *)(v0 + 112))
    {
      if (swift_dynamicCast())
      {
        uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
        uint64_t v9 = *(void *)(v0 + 272);
        uint64_t v26 = *(void *)(v0 + 256);
        sub_1E451B628();
        sub_1E451BC08();
        sub_1E451B8C8();
        sub_1E451B8C8();
        swift_bridgeObjectRelease();
        sub_1E451B8C8();
        sub_1E451B8C8();
        sub_1E451B8C8();
        sub_1E451B8C8();
        sub_1E451B718();

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        v28(v9, v26);
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {

      swift_unknownObjectRelease();
      sub_1E44FAEF8(v0 + 88);
    }
    uint64_t v10 = *(void *)(v0 + 320);
    uint64_t v11 = *(void *)(v0 + 296);
    uint64_t v12 = *(void *)(v0 + 304);
    uint64_t v14 = *(void *)(v0 + 240);
    uint64_t v13 = *(void *)(v0 + 248);
    uint64_t v15 = *(void *)(v0 + 232);
    uint64_t v16 = *(void *)(v0 + 152);
    (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 208));
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    sub_1E4503B0C(v0 + 56, v16);
  }
  else
  {
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v5 = *(void *)(v0 + 304);
    uint64_t v27 = *(void *)(v0 + 296);
    uint64_t v29 = *(void *)(v0 + 320);
    uint64_t v6 = *(void *)(v0 + 280);
    uint64_t v19 = *(void *)(v0 + 256);
    uint64_t v7 = *(void *)(v0 + 240);
    uint64_t v23 = *(void *)(v0 + 232);
    uint64_t v24 = *(void *)(v0 + 248);
    uint64_t v8 = *(void *)(v0 + 216);
    uint64_t v20 = *(void *)(v0 + 208);
    uint64_t v21 = *(void *)(v0 + 224);
    uint64_t v25 = *(_OWORD **)(v0 + 152);
    sub_1E451B628();
    sub_1E451BC08();
    sub_1E451B8C8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    sub_1E451B8C8();
    sub_1E451B8C8();
    sub_1E451B8C8();
    sub_1E451B738();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    v22(v6, v19);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v21, v20);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v24, v23);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v29, v27);
    *uint64_t v25 = 0u;
    v25[1] = 0u;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_1E451009C()
{
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[50];
  uint64_t v14 = v0[40];
  uint64_t v12 = v0[38];
  uint64_t v13 = v0[37];
  uint64_t v1 = v0[35];
  uint64_t v9 = v0[30];
  uint64_t v10 = v0[29];
  uint64_t v11 = v0[31];
  uint64_t v2 = v0[27];
  uint64_t v7 = v0[28];
  uint64_t v5 = v0[32];
  uint64_t v6 = v0[26];
  sub_1E451B628();
  sub_1E451BC08();
  sub_1E451B8C8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  sub_1E451B8C8();
  swift_getErrorValue();
  sub_1E451BE68();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B738();
  swift_bridgeObjectRelease();
  v8(v1, v5);
  swift_willThrow();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v7, v6);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1E45104FC(int a1, int a2, uint64_t a3, void *aBlock, void *a5)
{
  v5[10] = a5;
  v5[11] = _Block_copy(aBlock);
  uint64_t v8 = sub_1E451B868();
  uint64_t v10 = v9;
  v5[12] = v9;
  uint64_t v11 = sub_1E451B868();
  uint64_t v13 = v12;
  v5[13] = v12;
  if (a3) {
    a3 = sub_1E451B818();
  }
  v5[14] = a3;
  a5;
  uint64_t v14 = (void *)swift_task_alloc();
  v5[15] = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_1E4510640;
  return sub_1E450F398((uint64_t)(v5 + 2), v8, v10, v11, v13, a3);
}

uint64_t sub_1E4510640()
{
  uint64_t v2 = v0;
  uint64_t v3 = (void *)*v1;
  id v4 = *(void **)(*v1 + 80);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v6 = (void (**)(void, void, void))v3[11];
    uint64_t v7 = (void *)sub_1E451B0C8();

    ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
    _Block_release(v6);
  }
  else
  {
    sub_1E4503B0C((uint64_t)(v3 + 2), (uint64_t)(v3 + 6));
    uint64_t v8 = v3[9];
    if (v8)
    {
      uint64_t v9 = __swift_project_boxed_opaque_existential_1(v3 + 6, v3[9]);
      uint64_t v10 = *(void *)(v8 - 8);
      uint64_t v11 = swift_task_alloc();
      (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v11, v9, v8);
      uint64_t v12 = sub_1E451BDD8();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v8);
      swift_task_dealloc();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v3 + 6));
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = (void (**)(void, void, void))v3[11];
    v13[2](v13, v12, 0);
    _Block_release(v13);
    swift_unknownObjectRelease();
  }
  uint64_t v14 = *(uint64_t (**)(void))(v5 + 8);
  return v14();
}

id AppIntentsHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id AppIntentsHelper.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR___TPSAppIntentsHelper_clientLabel];
  *(void *)uint64_t v2 = 0xD000000000000019;
  *((void *)v2 + 1) = 0x80000001E45286D0;
  *(_WORD *)&v0[OBJC_IVAR___TPSAppIntentsHelper_source] = 3;
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_init);
}

id AppIntentsHelper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppIntentsHelper()
{
  return self;
}

uint64_t sub_1E4510A8C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1E44AE0C8;
  uint64_t v8 = (uint64_t (*)(int, int, uint64_t, void *, void *))((char *)&dword_1EAE48810 + dword_1EAE48810);
  return v8(v2, v3, v4, v5, v6);
}

unint64_t sub_1E4510B5C()
{
  unint64_t result = qword_1EAE48830;
  if (!qword_1EAE48830)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAE48830);
  }
  return result;
}

unint64_t sub_1E4510B9C(uint64_t a1)
{
  uint64_t v2 = sub_1E451BBA8();

  return sub_1E4510CB4(a1, v2);
}

uint64_t sub_1E4510BE4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1E44DAA10;
  uint64_t v8 = (uint64_t (*)(int, int, uint64_t, void *, void *))((char *)&dword_1EAE48838 + dword_1EAE48838);
  return v8(v2, v3, v4, v5, v6);
}

unint64_t sub_1E4510CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1E4510D7C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1E4E80430](v9, a1);
      sub_1E44ED60C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1E4510D7C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1E4510DDC(uint64_t a1, unint64_t a2, __int16 a3)
{
  uint64_t v6 = sub_1E451B668();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v10 = sub_1E44AAA94(a1, a2);
  uint64_t v12 = v11;
  unint64_t v14 = v13;
  if (v10 == a3)
  {
    uint64_t v15 = sub_1E449503C(a3);
    unint64_t v17 = v16;
    sub_1E44957E4(v12, v14);
    char v18 = sub_1E44AF898(v15, v17, v12, v14);
    sub_1E4496E64(v12, v14);
    sub_1E4496E64(v15, v17);
    if (v18)
    {
      sub_1E4496E64(v12, v14);
      return 1;
    }
    sub_1E451B648();
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_1E451BC08();
    sub_1E451B8C8();
    sub_1E44957E4(v12, v14);
    sub_1E451B208();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E4496E64(v12, v14);
    sub_1E451B8C8();
    uint64_t v21 = sub_1E449503C(a3);
    unint64_t v23 = v22;
    sub_1E451B208();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E4496E64(v21, v23);
  }
  else
  {
    __int16 v20 = v10;
    sub_1E451B648();
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_1E451BC08();
    sub_1E451B8C8();
    __int16 v25 = v20;
    sub_1E451BDC8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
    sub_1E451B8C8();
    __int16 v25 = a3;
    sub_1E451BDC8();
    sub_1E451B8C8();
    swift_bridgeObjectRelease();
  }
  sub_1E451B8C8();
  sub_1E451B718();
  swift_bridgeObjectRelease();
  sub_1E4496E64(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

void *sub_1E4511114(unint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  sub_1E44AA0E0(MEMORY[0x1E4FBC860]);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_1E449BD7C(a1);
  swift_bridgeObjectRelease();
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1E44FB8B8(v7);
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_1E44FB8B8(v9);
  uint64_t v11 = v10;
  if (*(void *)(v8 + 16) <= *(void *)(v10 + 16) >> 3)
  {
    uint64_t v18 = v10;
    swift_bridgeObjectRetain();
    sub_1E4511818(v8);
    uint64_t v12 = v18;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1E4501FF4(v8, v11);
  }
  if (*(void *)(v11 + 16) <= *(void *)(v8 + 16) >> 3)
  {
    swift_bridgeObjectRetain();
    sub_1E4511818(v11);
    uint64_t v13 = v8;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1E4501FF4(v11, v8);
  }
  uint64_t v14 = sub_1E45119C0(v11, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1E4512BEC(v14, a2, a3, 2, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v16 = sub_1E44DF7FC(v12);
  swift_bridgeObjectRelease();
  sub_1E44DF7FC(v15);
  swift_release();
  sub_1E44DF7FC(v13);
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_1E45112EC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5278);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E4512E60();
  sub_1E451BF18();
  char v13 = 0;
  sub_1E451BDA8();
  if (!v3)
  {
    v11[1] = a3;
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5228);
    sub_1E451321C(&qword_1EBFF5230, (void (*)(void))sub_1E4512EB4);
    sub_1E451BD98();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1E45114B0()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0x6E6F6973726576;
  }
}

uint64_t sub_1E45114F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1E4512F08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1E4511518(uint64_t a1)
{
  unint64_t v2 = sub_1E4512E60();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E4511554(uint64_t a1)
{
  unint64_t v2 = sub_1E4512E60();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E4511590@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1E4512FF8(a1);
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(void *)(a2 + _Block_object_dispose(&STACK[0x240], 8) = v5;
  }
  return result;
}

uint64_t sub_1E45115C0(void *a1)
{
  return sub_1E45112EC(a1, *v1, *((void *)v1 + 1));
}

uint64_t sub_1E45115E0()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_1E451BEB8();
  sub_1E451BED8();
  swift_bridgeObjectRetain();
  sub_1E44E1820((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1E451BEE8();
}

uint64_t sub_1E4511650(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  sub_1E451BED8();
  swift_bridgeObjectRetain();
  sub_1E44E1820(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E45116B0()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_1E451BEB8();
  sub_1E451BED8();
  swift_bridgeObjectRetain();
  sub_1E44E1820((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1E451BEE8();
}

uint64_t sub_1E451171C(__int16 *a1, unsigned __int16 *a2)
{
  int v2 = (unsigned __int16)*a1;
  if (v2 != *a2) {
    return 0;
  }
  uint64_t v3 = sub_1E449503C(*a1);
  unint64_t v5 = v4;
  uint64_t v6 = sub_1E449503C(v2);
  unint64_t v8 = v7;
  char v9 = sub_1E44AF898(v3, v5, v6, v7);
  sub_1E4496E64(v6, v8);
  sub_1E4496E64(v3, v5);
  return v9 & 1;
}

unint64_t sub_1E45117C4()
{
  unint64_t result = qword_1EAE48870;
  if (!qword_1EAE48870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48870);
  }
  return result;
}

uint64_t sub_1E4511818(uint64_t result)
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
  unint64_t result = swift_bridgeObjectRetain();
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
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1E4512088(v12, v13);
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
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

uint64_t sub_1E45119C0(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E4F143B8];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_1E4511B48((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_1E4511B48((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x1E4E81220](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_1E4511B48(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
        unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_1E451BEB8();
        swift_bridgeObjectRetain();
        sub_1E451B8B8();
        uint64_t v20 = sub_1E451BEE8();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        unint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      uint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_1E451BDE8() & 1) == 0)
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
          if (v32 || (sub_1E451BDE8() & 1) != 0)
          {
            unint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      unint64_t result = swift_bridgeObjectRelease();
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
    unint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_1E451BEB8();
    swift_bridgeObjectRetain();
    sub_1E451B8B8();
    uint64_t v47 = sub_1E451BEE8();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_1E451BDE8() & 1) != 0)
    {
LABEL_76:
      unint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_1E4502C68(v57, a2, v61, v5);
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
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_1E451BDE8() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      unint64_t result = swift_bridgeObjectRelease();
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

uint64_t sub_1E4512088(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1E451BEB8();
  swift_bridgeObjectRetain();
  sub_1E451B8B8();
  uint64_t v6 = sub_1E451BEE8();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1E451BDE8() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1E451BDE8() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1E450309C();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_1E4512218(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1E4512218(unint64_t result)
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
    uint64_t v8 = sub_1E451BB98();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_1E451BEB8();
        swift_bridgeObjectRetain();
        sub_1E451B8B8();
        uint64_t v10 = sub_1E451BEE8();
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
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    unint64_t result = swift_release();
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
    JUMPOUT(0x1E45123E0);
  }
  *(void *)(v3 + 16) = v17;
  ++*(_DWORD *)(v3 + 36);
  return result;
}

uint64_t sub_1E45123F0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = 0;
  int64_t v8 = 0;
  __s1[2] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *(void *)(a3 + 56);
  uint64_t v9 = a3 + 56;
  uint64_t v10 = v11;
  uint64_t v12 = 1 << *(unsigned char *)(v9 - 24);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v10;
  uint64_t v62 = v9;
  int64_t v63 = (unint64_t)(v12 + 63) >> 6;
  do
  {
    uint64_t v59 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v15 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        BOOL v17 = __OFADD__(v8++, 1);
        if (v17)
        {
          __break(1u);
LABEL_85:
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
          goto LABEL_89;
        }
        if (v8 >= v63) {
          goto LABEL_83;
        }
        unint64_t v18 = *(void *)(v62 + 8 * v8);
        if (!v18)
        {
          int64_t v19 = v8 + 1;
          if (v8 + 1 >= v63) {
            goto LABEL_83;
          }
          unint64_t v18 = *(void *)(v62 + 8 * v19);
          if (!v18)
          {
            int64_t v19 = v8 + 2;
            if (v8 + 2 >= v63) {
              goto LABEL_83;
            }
            unint64_t v18 = *(void *)(v62 + 8 * v19);
            if (!v18)
            {
              int64_t v19 = v8 + 3;
              if (v8 + 3 >= v63) {
                goto LABEL_83;
              }
              unint64_t v18 = *(void *)(v62 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  int64_t v8 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    break;
                  }
                  if (v8 >= v63) {
                    goto LABEL_83;
                  }
                  unint64_t v18 = *(void *)(v62 + 8 * v8);
                  ++v19;
                  if (v18) {
                    goto LABEL_19;
                  }
                }
LABEL_89:
                __break(1u);
LABEL_90:
                __break(1u);
LABEL_91:
                __break(1u);
LABEL_92:
                __break(1u);
LABEL_93:
                __break(1u);
              }
            }
          }
          int64_t v8 = v19;
        }
LABEL_19:
        unint64_t v14 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v16);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      uint64_t v23 = *(void *)(v6 + 16);
      swift_bridgeObjectRetain();
      if (v23)
      {
        swift_bridgeObjectRetain();
        unint64_t v24 = sub_1E4496570(v21, v22);
        if (v25)
        {
          uint64_t v26 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v24);
          uint64_t v27 = *v26;
          unint64_t v28 = v26[1];
          sub_1E44957E4(*v26, v28);
        }
        else
        {
          uint64_t v27 = 0;
          unint64_t v28 = 0xF000000000000000;
        }
        swift_bridgeObjectRelease();
        if (!*(void *)(v5 + 16))
        {
LABEL_24:
          uint64_t v29 = 0;
          unint64_t v30 = 0xF000000000000000;
          goto LABEL_31;
        }
      }
      else
      {
        uint64_t v27 = 0;
        unint64_t v28 = 0xF000000000000000;
        if (!*(void *)(v5 + 16)) {
          goto LABEL_24;
        }
      }
      swift_bridgeObjectRetain();
      unint64_t v31 = sub_1E4496570(v21, v22);
      if (v32)
      {
        BOOL v33 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v31);
        uint64_t v29 = *v33;
        unint64_t v30 = v33[1];
        sub_1E44957E4(*v33, v30);
      }
      else
      {
        uint64_t v29 = 0;
        unint64_t v30 = 0xF000000000000000;
      }
      swift_bridgeObjectRelease();
LABEL_31:
      if (v28 >> 60 == 15)
      {
        if (v30 >> 60 != 15) {
          break;
        }
        goto LABEL_6;
      }
      if (v30 >> 60 == 15) {
        break;
      }
      unint64_t v61 = v16;
      uint64_t v34 = 0;
      switch(v28 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v27), v27)) {
            goto LABEL_85;
          }
          uint64_t v34 = HIDWORD(v27) - (int)v27;
LABEL_38:
          sub_1E44957E4(v27, v28);
          break;
        case 2uLL:
          uint64_t v36 = *(void *)(v27 + 16);
          uint64_t v35 = *(void *)(v27 + 24);
          uint64_t v34 = v35 - v36;
          if (!__OFSUB__(v35, v36)) {
            goto LABEL_38;
          }
          goto LABEL_86;
        case 3uLL:
          break;
        default:
          uint64_t v34 = BYTE6(v28);
          break;
      }
      switch(v30 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v29), v29)) {
            goto LABEL_88;
          }
          if (v34 == HIDWORD(v29) - v29) {
            goto LABEL_49;
          }
          goto LABEL_78;
        case 2uLL:
          uint64_t v38 = *(void *)(v29 + 16);
          uint64_t v37 = *(void *)(v29 + 24);
          BOOL v17 = __OFSUB__(v37, v38);
          uint64_t v39 = v37 - v38;
          if (v17) {
            goto LABEL_87;
          }
          if (v34 != v39)
          {
LABEL_78:
            sub_1E4496EBC(v29, v30);
            sub_1E4496EBC(v27, v28);
            uint64_t v50 = v27;
            unint64_t v51 = v28;
            goto LABEL_79;
          }
LABEL_49:
          if (v34 >= 1)
          {
            switch(v28 >> 62)
            {
              case 1uLL:
                if (v27 >> 32 < (int)v27) {
                  goto LABEL_90;
                }
                sub_1E44DB650(v27, v28);
                sub_1E44DB650(v29, v30);
                uint64_t v45 = sub_1E451B038();
                if (v45)
                {
                  uint64_t v57 = v45;
                  uint64_t v46 = sub_1E451B068();
                  if (__OFSUB__((int)v27, v46)) {
                    goto LABEL_93;
                  }
                  uint64_t v47 = v57 + (int)v27 - v46;
                }
                else
                {
                  uint64_t v47 = 0;
                }
                sub_1E451B058();
                sub_1E44AFB00(v47, v29, v30, (char *)__s1);
                if (v60) {
                  goto LABEL_95;
                }
                sub_1E4496EBC(v29, v30);
                sub_1E4496EBC(v27, v28);
                sub_1E4496EBC(v29, v30);
                sub_1E4496EBC(v27, v28);
                sub_1E4496EBC(v27, v28);
                char v49 = __s1[0];
                swift_bridgeObjectRelease();
                uint64_t v6 = a4;
                uint64_t v5 = a5;
                if ((v49 & 1) == 0) {
                  goto LABEL_80;
                }
                continue;
              case 2uLL:
                uint64_t v56 = *(void *)(v27 + 24);
                uint64_t v58 = *(void *)(v27 + 16);
                sub_1E44DB650(v29, v30);
                swift_retain();
                swift_retain();
                uint64_t v40 = sub_1E451B038();
                unint64_t v55 = v14;
                if (v40)
                {
                  uint64_t v41 = v40;
                  uint64_t v42 = sub_1E451B068();
                  uint64_t v43 = v58;
                  if (__OFSUB__(v58, v42)) {
                    goto LABEL_92;
                  }
                  uint64_t v44 = v41 + v58 - v42;
                }
                else
                {
                  uint64_t v44 = 0;
                  uint64_t v43 = v58;
                }
                if (__OFSUB__(v56, v43)) {
                  goto LABEL_91;
                }
                sub_1E451B058();
                sub_1E44AFB00(v44, v29, v30, (char *)__s1);
                if (v60)
                {
                  sub_1E4496EBC(v29, v30);
                  swift_release();
                  swift_release();
                  __break(1u);
LABEL_95:
                  sub_1E4496EBC(v29, v30);
                  sub_1E4496EBC(v27, v28);
                  __break(1u);
LABEL_96:
                  sub_1E4496EBC(v29, v30);
                  __break(1u);
                  JUMPOUT(0x1E4512BBCLL);
                }
                sub_1E4496EBC(v29, v30);
                swift_release();
                swift_release();
                sub_1E4496EBC(v29, v30);
                sub_1E4496EBC(v27, v28);
                char v48 = __s1[0];
                sub_1E4496EBC(v27, v28);
                swift_bridgeObjectRelease();
                uint64_t v6 = a4;
                uint64_t v5 = a5;
                unint64_t v14 = v55;
                if ((v48 & 1) == 0) {
                  goto LABEL_80;
                }
                continue;
              case 3uLL:
                memset(__s1, 0, 14);
                sub_1E44957E4(v29, v30);
                goto LABEL_61;
              default:
                __s1[0] = v27;
                LOWORD(__s1[1]) = v28;
                BYTE2(__s1[1]) = BYTE2(v28);
                BYTE3(__s1[1]) = BYTE3(v28);
                BYTE4(__s1[1]) = BYTE4(v28);
                BYTE5(__s1[1]) = BYTE5(v28);
                sub_1E44957E4(v29, v30);
LABEL_61:
                sub_1E44AFB00((uint64_t)__s1, v29, v30, &v67);
                if (v60) {
                  goto LABEL_96;
                }
                sub_1E4496EBC(v29, v30);
                sub_1E4496EBC(v29, v30);
                sub_1E4496EBC(v27, v28);
                sub_1E4496EBC(v27, v28);
                swift_bridgeObjectRelease();
                uint64_t v6 = a4;
                uint64_t v5 = a5;
                if ((v67 & 1) == 0) {
                  goto LABEL_80;
                }
                continue;
            }
          }
LABEL_52:
          sub_1E4496EBC(v29, v30);
          sub_1E4496EBC(v27, v28);
          sub_1E4496EBC(v27, v28);
          break;
        case 3uLL:
          if (v34) {
            goto LABEL_78;
          }
          goto LABEL_52;
        default:
          if (v34 != BYTE6(v30)) {
            goto LABEL_78;
          }
          goto LABEL_49;
      }
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v6 = a4;
      uint64_t v5 = a5;
    }
    unint64_t v61 = v16;
    sub_1E4496EBC(v27, v28);
    uint64_t v50 = v29;
    unint64_t v51 = v30;
LABEL_79:
    sub_1E4496EBC(v50, v51);
    swift_bridgeObjectRelease();
    uint64_t v6 = a4;
    uint64_t v5 = a5;
LABEL_80:
    *(unint64_t *)((char *)a1 + ((v61 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v61;
    uint64_t v7 = v59 + 1;
  }
  while (!__OFADD__(v59, 1));
  __break(1u);
LABEL_83:
  swift_retain();
  return sub_1E4502C68(a1, a2, v59, a3);
}

uint64_t sub_1E4512BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  char v9 = *(unsigned char *)(a1 + 32);
  unsigned int v10 = v9 & 0x3F;
  unint64_t v11 = (unint64_t)((1 << v9) + 63) >> 6;
  size_t v12 = 8 * v11;
  swift_bridgeObjectRetain_n();
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v10 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1E45123F0((void *)((char *)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0)), v11, a1, a3, a5);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v5) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v15 = (void *)swift_slowAlloc();
    bzero(v15, v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1E45123F0((unint64_t *)v15, v11, a1, a3, a5);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x1E4E81220](v15, -1, -1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

ValueMetadata *type metadata accessor for TipsClientState()
{
  return &type metadata for TipsClientState;
}

unint64_t sub_1E4512E30(uint64_t a1)
{
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = sub_1E45040A8();
  unint64_t result = sub_1E4504054();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1E4512E60()
{
  unint64_t result = qword_1EBFF5170;
  if (!qword_1EBFF5170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5170);
  }
  return result;
}

unint64_t sub_1E4512EB4()
{
  unint64_t result = qword_1EBFF5168;
  if (!qword_1EBFF5168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5168);
  }
  return result;
}

uint64_t sub_1E4512F08(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1E451BDE8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001E45288C0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1E451BDE8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1E4512FF8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5270);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1E44AA0E0(MEMORY[0x1E4FBC860]);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1E4512E60();
  sub_1E451BF08();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = sub_1E451BD58();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5228);
    v9[30] = 1;
    sub_1E451321C(&qword_1EBFF5238, (void (*)(void))sub_1E44AF844);
    sub_1E451BD48();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_1E451321C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBFF5228);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TipsClientState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E4513364);
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

ValueMetadata *type metadata accessor for TipsClientState.CodingKeys()
{
  return &type metadata for TipsClientState.CodingKeys;
}

unint64_t sub_1E45133A0()
{
  unint64_t result = qword_1EAE48878;
  if (!qword_1EAE48878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE48878);
  }
  return result;
}

unint64_t sub_1E45133F8()
{
  unint64_t result = qword_1EBFF5180;
  if (!qword_1EBFF5180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5180);
  }
  return result;
}

unint64_t sub_1E4513450()
{
  unint64_t result = qword_1EBFF5178;
  if (!qword_1EBFF5178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5178);
  }
  return result;
}

uint64_t static TipKitContentManager.updateContent(meta:documents:clientConditions:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EAE48888 + dword_1EAE48888);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4513558;
  return v7(a1, a2);
}

uint64_t sub_1E4513558(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  unsigned int v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t sub_1E45137F4(uint64_t a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  v4[2] = _Block_copy(aBlock);
  if (a1) {
    a1 = sub_1E451B818();
  }
  v4[3] = a1;
  if (a2) {
    a2 = sub_1E451B818();
  }
  v4[4] = a2;
  if (a3) {
    uint64_t v8 = sub_1E451BA68();
  }
  else {
    uint64_t v8 = 0;
  }
  v4[5] = v8;
  unint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EAE48888 + dword_1EAE48888);
  char v9 = (void *)swift_task_alloc();
  void v4[6] = v9;
  *char v9 = v4;
  v9[1] = sub_1E4513940;
  return v11(a1, a2);
}

uint64_t sub_1E4513940(char a1)
{
  int v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v5 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    char v9 = (void *)sub_1E451B0C8();

    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 16));
  unsigned int v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

id TipKitContentManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id TipKitContentManager.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipKitContentManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4513BEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *unsigned int v4 = v3;
  v4[1] = sub_1E44DAA10;
  return v6();
}

uint64_t sub_1E4513CB8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1E44DAA10;
  return v7();
}

uint64_t sub_1E4513D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E451BA28();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1E451BA18();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1E44DA6DC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E451B9A8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void *sub_1E4513F28(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E44DFD34(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1E4513F48(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E44DFD48(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1E4513F68(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E44DFD5C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1E4513F88(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E44DFE64(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1E4513FA8(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E44DFE78(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1E4513FC8(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E4F143B8];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1F4188790](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_1E4514120((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_1E4514120((uint64_t)v7, v4, v2);
    MEMORY[0x1E4E81220](v7, -1, -1);
  }
  return v2;
}

uint64_t sub_1E4514120(uint64_t result, uint64_t a2, uint64_t a3)
{
  int64_t v19 = (unint64_t *)result;
  uint64_t v20 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_18:
    uint64_t v15 = *(void *)(*(void *)(a3 + 56) + 8 * v11);
    if (*(void *)(v15 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v16 = sub_1E4496570(0xD000000000000010, 0x80000001E4528980);
      if ((v17 & 1) != 0
        && (sub_1E44ED660(*(void *)(v15 + 56) + 32 * v16, (uint64_t)v22),
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5878),
            (swift_dynamicCast() & 1) != 0))
      {
        uint64_t v21 = *(void *)(v23 + 16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t result = swift_bridgeObjectRelease();
        if (v21)
        {
          *(unint64_t *)((char *)v19 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
          BOOL v12 = __OFADD__(v20++, 1);
          if (v12) {
            goto LABEL_32;
          }
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t result = swift_bridgeObjectRelease();
      }
    }
  }
  BOOL v12 = __OFADD__(v4++, 1);
  if (v12)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v4 >= v9) {
    return sub_1E4514658(v19, a2, v20, a3);
  }
  unint64_t v13 = *(void *)(v5 + 8 * v4);
  if (v13)
  {
LABEL_17:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_18;
  }
  int64_t v14 = v4 + 1;
  if (v4 + 1 >= v9) {
    return sub_1E4514658(v19, a2, v20, a3);
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v4 + 2;
  if (v4 + 2 >= v9) {
    return sub_1E4514658(v19, a2, v20, a3);
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v4 + 3;
  if (v4 + 3 >= v9) {
    return sub_1E4514658(v19, a2, v20, a3);
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
LABEL_16:
    int64_t v4 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return sub_1E4514658(v19, a2, v20, a3);
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_17;
    }
  }
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1E4514398(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5BC8);
  uint64_t result = sub_1E451BD18();
  uint64_t v9 = result;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v41 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v40) {
        return v9;
      }
      unint64_t v16 = v39[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v40) {
          return v9;
        }
        unint64_t v16 = v39[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v40) {
            return v9;
          }
          unint64_t v16 = v39[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v40) {
              return v9;
            }
            unint64_t v16 = v39[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v40) {
                  return v9;
                }
                unint64_t v16 = v39[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v41 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = 16 * v14;
    uint64_t v20 = v4;
    uint64_t v21 = (uint64_t *)(*(void *)(v4 + 48) + v19);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    unint64_t v24 = (uint64_t *)(*(void *)(v4 + 56) + v19);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    sub_1E451BEB8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v30 = __clz(__rbit64((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v29 == v32;
        if (v29 == v32) {
          unint64_t v29 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v29);
      }
      while (v34 == -1);
      unint64_t v30 = __clz(__rbit64(~v34)) + (v29 << 6);
    }
    *(void *)(v12 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    uint64_t v35 = 16 * v30;
    uint64_t v36 = (void *)(*(void *)(v9 + 48) + v35);
    *uint64_t v36 = v23;
    v36[1] = v22;
    uint64_t v37 = (void *)(*(void *)(v9 + 56) + v35);
    *uint64_t v37 = v25;
    v37[1] = v26;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t v4 = v20;
    uint64_t v11 = v41;
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1E4514658(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF58F0);
  uint64_t result = sub_1E451BD18();
  uint64_t v9 = result;
  unint64_t v32 = a1;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v33) {
        return v9;
      }
      unint64_t v16 = v32[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v33) {
          return v9;
        }
        unint64_t v16 = v32[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= v33) {
            return v9;
          }
          unint64_t v16 = v32[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= v33) {
              return v9;
            }
            unint64_t v16 = v32[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= v33) {
                  return v9;
                }
                unint64_t v16 = v32[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
    sub_1E451BEB8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1E451B8B8();
    uint64_t result = sub_1E451BEE8();
    uint64_t v22 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
      }
      while (v29 == -1);
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    unint64_t v30 = (void *)(*(void *)(v9 + 48) + 16 * v25);
    *unint64_t v30 = v20;
    v30[1] = v19;
    *(void *)(*(void *)(v9 + 56) + 8 * v25) = v21;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1E45148F4(uint64_t a1, uint64_t a2)
{
  v2[33] = a1;
  v2[34] = a2;
  uint64_t v3 = sub_1E451B668();
  v2[35] = v3;
  v2[36] = *(void *)(v3 - 8);
  v2[37] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E45149B4, 0, 0);
}

uint64_t sub_1E45149B4()
{
  uint64_t v1 = *(void *)(v0 + 264);
  if (!v1) {
    goto LABEL_12;
  }
  if (!*(void *)(v1 + 16)) {
    goto LABEL_12;
  }
  unint64_t v2 = sub_1E4496570(0x79726576696C6564, 0xEC0000006F666E49);
  if ((v3 & 1) == 0) {
    goto LABEL_12;
  }
  sub_1E44ED660(*(void *)(v1 + 56) + 32 * v2, v0 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5838);
  if (!swift_dynamicCast()) {
    goto LABEL_12;
  }
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 248);
  if (!v5
    || !*(void *)(v5 + 16)
    || (unint64_t v7 = sub_1E4496570(0x746E656D75636F64, 0xE900000000000073), (v8 & 1) == 0)
    || (sub_1E44ED660(*(void *)(v5 + 56) + 32 * v7, v0 + 80),
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5870),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_12:
    uint64_t v14 = *(void *)(v0 + 288);
    uint64_t v13 = *(void *)(v0 + 296);
    uint64_t v15 = *(void *)(v0 + 280);
    sub_1E451B638();
    sub_1E451B728();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    goto LABEL_13;
  }
  uint64_t v33 = (_OWORD *)(v0 + 48);
  char v31 = (_OWORD *)(v0 + 208);
  uint64_t v10 = *(void *)(v0 + 240);
  uint64_t v30 = sub_1E4513FC8(v6);
  swift_bridgeObjectRelease();
  uint64_t v35 = MEMORY[0x1E4FBC860];
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v32 = v9;
  if (v11)
  {
    uint64_t v12 = (uint64_t *)(v10 + 32);
    uint64_t v34 = MEMORY[0x1E4FBC860];
    while (1)
    {
      uint64_t v18 = *v12;
      if (*(void *)(*v12 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v19 = sub_1E4496570(0x746E65746E6F63, 0xE700000000000000);
        if (v20)
        {
          sub_1E44ED660(*(void *)(v18 + 56) + 32 * v19, v0 + 144);
          if (swift_dynamicCast())
          {
            if (*(void *)(*(void *)(v0 + 256) + 16))
            {
              sub_1E4496570(1768843629, 0xE400000000000000);
              char v22 = v21;
              swift_bridgeObjectRelease();
              if (v22)
              {
                uint64_t v23 = v34;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  sub_1E4513F48(0, *(void *)(v34 + 16) + 1, 1);
                  uint64_t v23 = v35;
                }
                unint64_t v25 = *(void *)(v23 + 16);
                unint64_t v24 = *(void *)(v23 + 24);
                unint64_t v26 = v25 + 1;
                if (v25 >= v24 >> 1)
                {
                  sub_1E4513F48((void *)(v24 > 1), v25 + 1, 1);
                  unint64_t v26 = v25 + 1;
                  uint64_t v23 = v35;
                }
                *(void *)(v23 + 16) = v26;
                uint64_t v34 = v23;
                *(void *)(v23 + 8 * v25 + 32) = v18;
                goto LABEL_18;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
        }
        swift_bridgeObjectRelease();
      }
LABEL_18:
      ++v12;
      if (!--v11) {
        goto LABEL_31;
      }
    }
  }
  uint64_t v34 = MEMORY[0x1E4FBC860];
LABEL_31:
  swift_bridgeObjectRelease();
  *(void *)(v0 + 200) = v4;
  *(void *)(v0 + 176) = v30;
  sub_1E4497328((_OWORD *)(v0 + 176), v31);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1E44F4DAC(v31, 0x79726576696C6564, 0xEC0000006F666E49, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 136) = v32;
  *(void *)(v0 + 112) = v34;
  sub_1E4497328((_OWORD *)(v0 + 112), v33);
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_1E44F4DAC(v33, 0x746E656D75636F64, 0xE900000000000073, v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = (void *)sub_1E451B7F8();
  *(void *)(v0 + 304) = v29;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5988);
  sub_1E451B808();
  *(void *)(v0 + 312) = 0;

LABEL_13:
  swift_task_dealloc();
  unint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16(0);
}

uint64_t sub_1E4514ED8()
{
  *(void *)(*(void *)v1 + 32_Block_object_dispose(&STACK[0x240], 8) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v2 = sub_1E4515064;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v2 = sub_1E4514FF4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4514FF4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(1);
}

uint64_t sub_1E4515064()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t type metadata accessor for TipKitContentManager()
{
  return self;
}

uint64_t sub_1E4515104()
{
  _Block_release(*(const void **)(v0 + 40));

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1E4515154()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_1E44AE0C8;
  unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))((char *)&dword_1EAE48890 + dword_1EAE48890);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_1E4515224()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E451525C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E44AE0C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EAE488B0 + dword_1EAE488B0);
  return v6(a1, v4);
}

id CloudDeviceHasPhoneOrPadValidation.__allocating_init(targetContext:)()
{
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithTargetContext_, v2);

  return v3;
}

id CloudDeviceHasPhoneOrPadValidation.init(targetContext:)()
{
  id v1 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  id v2 = objc_msgSendSuper2(&v4, sel_initWithTargetContext_, v1);

  return v2;
}

id CloudDeviceHasPhoneOrPadValidation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CloudDeviceHasPhoneOrPadValidation.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CloudDeviceHasPhoneOrPadValidation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CloudDeviceHasPhoneOrPadValidation()
{
  return self;
}

uint64_t sub_1E4515638(void *a1, uint64_t a2)
{
  uint64_t v25 = a2;
  uint64_t v3 = sub_1E451B668();
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v24 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_idsDevices);
  sub_1E44DAE80();
  unint64_t v7 = sub_1E451B948();

  if (v7 >> 62) {
    goto LABEL_22;
  }
  uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; uint64_t v8 = sub_1E451BCD8())
  {
    uint64_t v9 = 4;
    while (1)
    {
      id v10 = (v7 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1E4E804B0](v9 - 4, v7) : *(id *)(v7 + 8 * v9);
      uint64_t v11 = v10;
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1)) {
        break;
      }
      id v13 = objc_msgSend(v10, sel_deviceType);

      if (v13 == (id)2 || v13 == (id)4)
      {
        int v15 = 1;
        goto LABEL_15;
      }
      ++v9;
      if (v12 == v8) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
  }
LABEL_13:
  int v15 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  unsigned int v16 = objc_msgSend(a1, sel_BOOLValue);
  sub_1E451B658();
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_1E451BC08();
  id v17 = objc_msgSend(a1, sel_name);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_1E451B868();
  }
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  id v19 = objc_msgSend(a1, sel_targetContext);
  if (v19)
  {
    char v20 = v19;
    sub_1E451B818();
  }
  else
  {
    sub_1E44E2BD8(MEMORY[0x1E4FBC860]);
  }
  sub_1E451B828();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B708();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
  return (*(uint64_t (**)(uint64_t, void, void))(v25 + 16))(v25, v15 ^ v16 ^ 1, 0);
}

uint64_t sub_1E45159DC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1E4515A3C()
{
  swift_bridgeObjectRelease();

  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1E4515A6C()
{
  sub_1E4515A3C();

  return MEMORY[0x1F4188210](v0);
}

uint64_t type metadata accessor for CoreSpotlightIndexer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1E4515AB0()
{
  return v0;
}

uint64_t sub_1E4515ABC()
{
  return sub_1E4515AB0();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t destroy for ClientStateMetaData(uint64_t a1)
{
  return sub_1E4496E64(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s10TipsDaemon19ClientStateMetaDataVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_1E44957E4(v3, v4);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ClientStateMetaData(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_1E44957E4(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_1E4496E64(v5, v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ClientStateMetaData(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x240], 8) = *(_OWORD *)(a2 + 8);
  sub_1E4496E64(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientStateMetaData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ClientStateMetaData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + _Block_object_dispose(&STACK[0x240], 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientStateMetaData()
{
  return &type metadata for ClientStateMetaData;
}

uint64_t sub_1E4515CBC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5280);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E44AD9A4();
  sub_1E451BF18();
  LOBYTE(v14) = 0;
  sub_1E451BDA8();
  if (!v4)
  {
    uint64_t v14 = a3;
    uint64_t v15 = v13;
    char v16 = 1;
    sub_1E4512EB4();
    sub_1E451BD98();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1E4515E44(char *a1, char *a2)
{
  return sub_1E44E6E58(*a1, *a2);
}

uint64_t sub_1E4515E50()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E4515EC4()
{
  sub_1E451B8B8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4515F24()
{
  return sub_1E451BEE8();
}

uint64_t sub_1E4515F94@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1E451BD28();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_1E4515FF4(uint64_t *a1@<X8>)
{
  uint64_t v2 = 118;
  if (*v1) {
    uint64_t v2 = 0x6873616863;
  }
  unint64_t v3 = 0xE100000000000000;
  if (*v1) {
    unint64_t v3 = 0xE500000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1E4516024@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1E451BD28();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_1E4516088(uint64_t a1)
{
  unint64_t v2 = sub_1E44AD9A4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E45160C4(uint64_t a1)
{
  unint64_t v2 = sub_1E44AD9A4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E4516100(void *a1)
{
  return sub_1E4515CBC(a1, *v1, *((void *)v1 + 1), *((void *)v1 + 2));
}

ValueMetadata *type metadata accessor for ClientStateMetaData.CodingKeys()
{
  return &type metadata for ClientStateMetaData.CodingKeys;
}

unint64_t sub_1E451615C()
{
  unint64_t result = qword_1EAE488C0;
  if (!qword_1EAE488C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE488C0);
  }
  return result;
}

unint64_t sub_1E45161B4()
{
  unint64_t result = qword_1EBFF53A0;
  if (!qword_1EBFF53A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF53A0);
  }
  return result;
}

unint64_t sub_1E451620C()
{
  unint64_t result = qword_1EBFF5398;
  if (!qword_1EBFF5398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBFF5398);
  }
  return result;
}

id GenerativeModelsEligibilityValidation.__allocating_init(targetContext:)()
{
  id v1 = objc_allocWithZone(v0);
  unint64_t v2 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithTargetContext_, v2);

  return v3;
}

id GenerativeModelsEligibilityValidation.init(targetContext:)()
{
  id v1 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for GenerativeModelsEligibilityValidation();
  id v2 = objc_msgSendSuper2(&v4, sel_initWithTargetContext_, v1);

  return v2;
}

uint64_t type metadata accessor for GenerativeModelsEligibilityValidation()
{
  return self;
}

id GenerativeModelsEligibilityValidation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GenerativeModelsEligibilityValidation.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsEligibilityValidation();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GenerativeModelsEligibilityValidation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsEligibilityValidation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4516584(void *a1, uint64_t a2)
{
  uint64_t v27 = a2;
  uint64_t v3 = sub_1E451B668();
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E451B3E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E451B408();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1E451B438();
  uint64_t v14 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  char v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E451B3F8();
  sub_1E451B428();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_1E451B418();
  unsigned __int8 v17 = sub_1E451B3C8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  unsigned __int8 v18 = objc_msgSend(a1, sel_BOOLValue);
  sub_1E451B658();
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  sub_1E451BC08();
  id v19 = objc_msgSend(a1, sel_name);
  if (v19)
  {
    char v20 = v19;
    sub_1E451B868();
  }
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  id v21 = objc_msgSend(a1, sel_targetContext);
  if (v21)
  {
    uint64_t v22 = v21;
    sub_1E451B818();
  }
  else
  {
    sub_1E44E2BD8(MEMORY[0x1E4FBC860]);
  }
  sub_1E451B828();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E451B8C8();
  sub_1E451B8C8();
  swift_bridgeObjectRelease();
  sub_1E451B708();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v26);
  (*(void (**)(uint64_t, BOOL, void))(v27 + 16))(v27, ((v17 ^ v18) & 1) == 0, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v24);
}

void __getCoreTelephonyClientClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  [(TPSDictationLanguageValidation *)v0 validateWithCompletion:v2];
}

uint64_t __getCTCellularPlanManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TPSHeadEnrollmentValidation validateWithCompletion:](v0);
}

void __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](v0, v1, v2);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVTPreferencesClass_block_invoke_cold_1(v0);
}

void __getVTPreferencesClass_block_invoke_cold_1()
{
}

uint64_t __getHKMedicalIDStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TPSContactsTrustedAccountValidation validateBeneficiaryAssignmentWithCompletion:](v0);
}

uint64_t __getHMClientConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TPSAppStoreRegionValidation validateWithCompletion:](v0);
}

uint64_t __getPKAccountServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(v0);
}

void __getSPBeaconManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  [(TPSPairedWatchValidation *)v0 validateWithCompletion:v2];
}

uint64_t __getSTManagementStateClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TPSNRElectrocardiogramValidation validateWithCompletion:](v0);
}

uint64_t __getHKHeartRhythmAvailabilityClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKHealthStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKFeatureStatusManagerClass_block_invoke_cold_1(v0);
}

void __getHKFeatureStatusManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[TPSNRDeviceCapabilityValidation validateWithCompletion:](v0, v1);
}

void __getHKHealthChecklistUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  -[TPSInclusivityCondition _valuesFromValueTypeArray:](v0, v1);
}

uint64_t __getFMDFMIPManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TPSSleepSetupValidation validateWithCompletion:](v0);
}

uint64_t __getHKSPSleepStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_cold_1(v0);
}

uint64_t __getASDSubscriptionEntitlementsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_2(v0);
}

uint64_t __getHKHealthRecordsAccountInfoStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1(v0);
}

uint64_t __getASDIAPHistoryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_1(v0);
}

uint64_t __getCRUsageInformationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[TPSUserTypesValidation validateWithCompletion:](v0);
}

uint64_t sub_1E451AF08()
{
  return MEMORY[0x1F40D45B8]();
}

uint64_t sub_1E451AF18()
{
  return MEMORY[0x1F40D4620]();
}

uint64_t sub_1E451AF38()
{
  return MEMORY[0x1F40D46B0]();
}

uint64_t sub_1E451AF48()
{
  return MEMORY[0x1F40D4820]();
}

uint64_t sub_1E451AF58()
{
  return MEMORY[0x1F40D48B8]();
}

uint64_t sub_1E451AF68()
{
  return MEMORY[0x1F40D48D0]();
}

uint64_t sub_1E451AF88()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1E451AF98()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1E451AFA8()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1E451AFB8()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1E451AFC8()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1E451AFD8()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1E451AFE8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1E451AFF8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1E451B008()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1E451B018()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1E451B028()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1E451B038()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1E451B048()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1E451B058()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1E451B068()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1E451B078()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1E451B088()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1E451B098()
{
  return MEMORY[0x1F40E3FB8]();
}

uint64_t sub_1E451B0A8()
{
  return MEMORY[0x1F40E4000]();
}

uint64_t sub_1E451B0B8()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1E451B0C8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1E451B0D8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1E451B0E8()
{
  return MEMORY[0x1F40E4570]();
}

uint64_t sub_1E451B0F8()
{
  return MEMORY[0x1F40E4588]();
}

uint64_t sub_1E451B108()
{
  return MEMORY[0x1F40E45B8]();
}

uint64_t sub_1E451B118()
{
  return MEMORY[0x1F40E45C8]();
}

uint64_t sub_1E451B128()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1E451B138()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1E451B148()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1E451B158()
{
  return MEMORY[0x1F40E4978]();
}

uint64_t sub_1E451B168()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1E451B178()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1E451B188()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1E451B198()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1E451B1A8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1E451B1B8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1E451B1C8()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1E451B1D8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1E451B1E8()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1E451B1F8()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1E451B208()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1E451B218()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1E451B228()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1E451B238()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1E451B248()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1E451B258()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1E451B268()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1E451B278()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1E451B288()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1E451B298()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1E451B2A8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1E451B2B8()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1E451B2C8()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1E451B2D8()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1E451B2E8()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1E451B2F8()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1E451B308()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1E451B318()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1E451B328()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1E451B338()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1E451B348()
{
  return MEMORY[0x1F4183240]();
}

uint64_t sub_1E451B358()
{
  return MEMORY[0x1F4183248]();
}

uint64_t sub_1E451B368()
{
  return MEMORY[0x1F4183250]();
}

uint64_t sub_1E451B378()
{
  return MEMORY[0x1F4183258]();
}

uint64_t sub_1E451B388()
{
  return MEMORY[0x1F4183260]();
}

uint64_t sub_1E451B398()
{
  return MEMORY[0x1F4183268]();
}

uint64_t sub_1E451B3C8()
{
  return MEMORY[0x1F411BD10]();
}

uint64_t sub_1E451B3D8()
{
  return MEMORY[0x1F411BD18]();
}

uint64_t sub_1E451B3E8()
{
  return MEMORY[0x1F411BD28]();
}

uint64_t sub_1E451B3F8()
{
  return MEMORY[0x1F411BD38]();
}

uint64_t sub_1E451B408()
{
  return MEMORY[0x1F411BD58]();
}

uint64_t sub_1E451B418()
{
  return MEMORY[0x1F411BD60]();
}

uint64_t sub_1E451B428()
{
  return MEMORY[0x1F411BD88]();
}

uint64_t sub_1E451B438()
{
  return MEMORY[0x1F411BDA8]();
}

uint64_t sub_1E451B448()
{
  return MEMORY[0x1F4108900]();
}

uint64_t sub_1E451B458()
{
  return MEMORY[0x1F4108910]();
}

uint64_t sub_1E451B468()
{
  return MEMORY[0x1F4108A30]();
}

uint64_t sub_1E451B478()
{
  return MEMORY[0x1F4108A38]();
}

uint64_t sub_1E451B488()
{
  return MEMORY[0x1F4108A40]();
}

uint64_t sub_1E451B4B8()
{
  return MEMORY[0x1F4108A80]();
}

uint64_t sub_1E451B4C8()
{
  return MEMORY[0x1F4108A88]();
}

uint64_t sub_1E451B4D8()
{
  return MEMORY[0x1F4108A90]();
}

uint64_t sub_1E451B4E8()
{
  return MEMORY[0x1F4108AA8]();
}

uint64_t sub_1E451B4F8()
{
  return MEMORY[0x1F4108AB0]();
}

uint64_t sub_1E451B508()
{
  return MEMORY[0x1F4108AB8]();
}

uint64_t sub_1E451B518()
{
  return MEMORY[0x1F4108AE0]();
}

uint64_t sub_1E451B528()
{
  return MEMORY[0x1F4108AF0]();
}

uint64_t sub_1E451B538()
{
  return MEMORY[0x1F4108AF8]();
}

uint64_t sub_1E451B548()
{
  return MEMORY[0x1F4108B28]();
}

uint64_t sub_1E451B558()
{
  return MEMORY[0x1F4108B38]();
}

uint64_t sub_1E451B568()
{
  return MEMORY[0x1F4108B50]();
}

uint64_t sub_1E451B578()
{
  return MEMORY[0x1F4108B60]();
}

uint64_t sub_1E451B588()
{
  return MEMORY[0x1F4108BD0]();
}

uint64_t sub_1E451B598()
{
  return MEMORY[0x1F4108D50]();
}

uint64_t sub_1E451B5A8()
{
  return MEMORY[0x1F4108D58]();
}

uint64_t sub_1E451B5B8()
{
  return MEMORY[0x1F4187850]();
}

uint64_t sub_1E451B5C8()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1E451B5D8()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1E451B5E8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1E451B5F8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1E451B608()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1E451B618()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1E451B628()
{
  return MEMORY[0x1F4164188]();
}

uint64_t sub_1E451B638()
{
  return MEMORY[0x1F4164190]();
}

uint64_t sub_1E451B648()
{
  return MEMORY[0x1F4164198]();
}

uint64_t sub_1E451B658()
{
  return MEMORY[0x1F41641A0]();
}

uint64_t sub_1E451B668()
{
  return MEMORY[0x1F41641A8]();
}

uint64_t sub_1E451B678()
{
  return MEMORY[0x1F41641B0]();
}

uint64_t sub_1E451B688()
{
  return MEMORY[0x1F41641B8]();
}

uint64_t sub_1E451B698()
{
  return MEMORY[0x1F41641C0]();
}

uint64_t sub_1E451B6A8()
{
  return MEMORY[0x1F41641C8]();
}

uint64_t sub_1E451B6B8()
{
  return MEMORY[0x1F41641D0]();
}

uint64_t sub_1E451B6C8()
{
  return MEMORY[0x1F41641D8]();
}

uint64_t sub_1E451B6D8()
{
  return MEMORY[0x1F41641E0]();
}

uint64_t sub_1E451B6E8()
{
  return MEMORY[0x1F41641E8]();
}

uint64_t sub_1E451B6F8()
{
  return MEMORY[0x1F41641F0]();
}

uint64_t sub_1E451B708()
{
  return MEMORY[0x1F41641F8]();
}

uint64_t sub_1E451B718()
{
  return MEMORY[0x1F4164200]();
}

uint64_t sub_1E451B728()
{
  return MEMORY[0x1F4164208]();
}

uint64_t sub_1E451B738()
{
  return MEMORY[0x1F4164210]();
}

uint64_t sub_1E451B748()
{
  return MEMORY[0x1F4164218]();
}

uint64_t sub_1E451B758()
{
  return MEMORY[0x1F4164220]();
}

uint64_t sub_1E451B768()
{
  return MEMORY[0x1F4164228]();
}

uint64_t sub_1E451B778()
{
  return MEMORY[0x1F4164230]();
}

uint64_t sub_1E451B788()
{
  return MEMORY[0x1F4164238]();
}

uint64_t sub_1E451B798()
{
  return MEMORY[0x1F4164240]();
}

uint64_t sub_1E451B7A8()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1E451B7B8()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t sub_1E451B7C8()
{
  return MEMORY[0x1F40E0490]();
}

uint64_t sub_1E451B7D8()
{
  return MEMORY[0x1F40E04A0]();
}

uint64_t sub_1E451B7E8()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_1E451B7F8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1E451B808()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1E451B818()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1E451B828()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1E451B838()
{
  return MEMORY[0x1F40E60A8]();
}

uint64_t sub_1E451B848()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1E451B858()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E451B868()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E451B878()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1E451B888()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1E451B898()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1E451B8A8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E451B8B8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E451B8C8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E451B8D8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E451B8E8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1E451B8F8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1E451B908()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1E451B918()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1E451B928()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1E451B938()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1E451B948()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1E451B958()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1E451B968()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1E451B978()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1E451B988()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1E451B998()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1E451B9A8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E451B9B8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1E451B9C8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1E451B9D8()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1E451B9E8()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1E451B9F8()
{
  return MEMORY[0x1F4187CE8]();
}

uint64_t sub_1E451BA08()
{
  return MEMORY[0x1F4187CF0]();
}

uint64_t sub_1E451BA18()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1E451BA28()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1E451BA48()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1E451BA58()
{
  return MEMORY[0x1F40E6448]();
}

uint64_t sub_1E451BA68()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1E451BA78()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1E451BA88()
{
  return MEMORY[0x1F40E6590]();
}

uint64_t sub_1E451BA98()
{
  return MEMORY[0x1F40E6598]();
}

uint64_t sub_1E451BAA8()
{
  return MEMORY[0x1F40E6638]();
}

uint64_t sub_1E451BAB8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1E451BAC8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1E451BAD8()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1E451BAE8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1E451BAF8()
{
  return MEMORY[0x1F40D4A88]();
}

uint64_t sub_1E451BB08()
{
  return MEMORY[0x1F40D4A90]();
}

uint64_t sub_1E451BB18()
{
  return MEMORY[0x1F4164248]();
}

uint64_t sub_1E451BB28()
{
  return MEMORY[0x1F4164250]();
}

uint64_t sub_1E451BB38()
{
  return MEMORY[0x1F4164258]();
}

uint64_t sub_1E451BB48()
{
  return MEMORY[0x1F4108D68]();
}

uint64_t sub_1E451BB58()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1E451BB68()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1E451BB78()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1E451BB88()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1E451BB98()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1E451BBA8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1E451BBB8()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1E451BBC8()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1E451BBD8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1E451BBE8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1E451BBF8()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1E451BC08()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1E451BC18()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E451BC28()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1E451BC38()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E451BC48()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1E451BC58()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E451BC68()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1E451BC78()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1E451BC88()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1E451BC98()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1E451BCA8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1E451BCB8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1E451BCC8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1E451BCD8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E451BCE8()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1E451BCF8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1E451BD08()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1E451BD18()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E451BD28()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1E451BD38()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1E451BD48()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1E451BD58()
{
  return MEMORY[0x1F41855A8]();
}

uint64_t sub_1E451BD68()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1E451BD78()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1E451BD88()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1E451BD98()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1E451BDA8()
{
  return MEMORY[0x1F41856D0]();
}

uint64_t sub_1E451BDB8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1E451BDC8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E451BDD8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1E451BDE8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E451BDF8()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1E451BE08()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1E451BE38()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1E451BE48()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1E451BE58()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1E451BE68()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1E451BE78()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1E451BE88()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1E451BE98()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1E451BEA8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E451BEB8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E451BEC8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E451BED8()
{
  return MEMORY[0x1F4185ED8]();
}

uint64_t sub_1E451BEE8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1E451BEF8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1E451BF08()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1E451BF18()
{
  return MEMORY[0x1F4185FF0]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1F417CDF8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1F41881C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
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

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
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