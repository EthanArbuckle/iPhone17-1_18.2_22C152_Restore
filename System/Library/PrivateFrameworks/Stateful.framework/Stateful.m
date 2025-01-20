uint64_t variable initialization expression of Contexts.UIKit.queue()
{
  sub_23FEF8AB0();
  return sub_23FF06330();
}

unint64_t sub_23FEF8AB0()
{
  unint64_t result = qword_268C65158;
  if (!qword_268C65158)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C65158);
  }
  return result;
}

uint64_t variable initialization expression of StateObservingNSObject.cancellableSubs()
{
  return MEMORY[0x263F8EE78];
}

double variable initialization expression of StateObservingNSObject.configuration@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of StateValue._lastAccessedValue@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
}

uint64_t variable initialization expression of PublishedValue.$__lazy_storage_$_valueDidChange()
{
  return 0;
}

uint64_t variable initialization expression of PublishedValue._previousValue@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 1, 1, a1);
}

double variable initialization expression of StateObserver.configuration@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of StateObserver.cancellableSubs()
{
  return MEMORY[0x263F8EE78];
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_268C65160)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268C65160);
    }
  }
}

void StateObserver.__allocating_init()()
{
}

void *sub_23FEF8C0C(void *result)
{
  uint64_t v2 = result[2];
  v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  double result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
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
  double result = sub_23FEF8D08(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65170);
  double result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    double result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void *sub_23FEF8D08(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_268C65180);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C65170);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23FEF8E2C(void *a1, int64_t a2, char a3)
{
  double result = sub_23FEF8E4C(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

void *sub_23FEF8E4C(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_268C65180);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C65170);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_23FEF8F70(uint64_t a1)
{
  uint64_t v2 = sub_23FF064C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  unint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65168);
  uint64_t v9 = MEMORY[0x270FA5388](v7 - 8, v8);
  v50 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  v14 = (char *)&v42 - v13;
  uint64_t v16 = MEMORY[0x270FA5388](v12, v15);
  v18 = (char *)&v42 - v17;
  MEMORY[0x270FA5388](v16, v19);
  v21 = (char *)&v42 - v20;
  *((void *)&v61 + 1) = swift_getObjectType();
  *(void *)&long long v60 = a1;
  swift_unknownObjectRetain();
  sub_23FF064A0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v21, 0, 1, v2);
  uint64_t v22 = MEMORY[0x263F8EE78];
  uint64_t v63 = MEMORY[0x263F8EE78];
  sub_23FEF95DC((uint64_t)v21, (uint64_t)v18);
  uint64_t v23 = v3 + 48;
  v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v51(v18, 1, v2) == 1)
  {
LABEL_28:
    sub_23FEF9708((uint64_t)v18, &qword_268C65168);
    sub_23FEF9708((uint64_t)v21, &qword_268C65168);
    return v22;
  }
  else
  {
    v43 = (void (**)(char *, char *, uint64_t))(v3 + 32);
    v53 = v59;
    v42 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v52 = MEMORY[0x263F8EE58] + 8;
    v24 = v51;
    uint64_t v49 = v2;
    v48 = v6;
    v47 = v18;
    v46 = v14;
    v45 = v21;
    uint64_t v44 = v23;
    while (1)
    {
      sub_23FEF9708((uint64_t)v18, &qword_268C65168);
      sub_23FEF95DC((uint64_t)v21, (uint64_t)v14);
      uint64_t result = v24(v14, 1, v2);
      if (result == 1) {
        break;
      }
      (*v43)(v6, v14, v2);
      sub_23FF064B0();
      sub_23FF06400();
      sub_23FF06440();
      if (*((void *)&v62 + 1))
      {
        v28 = (void *)MEMORY[0x263F8EE78];
        do
        {
          long long v58 = v60;
          v59[0] = v61;
          v59[1] = v62;
          long long v55 = v60;
          sub_23FEF96AC((uint64_t)v53, (uint64_t)&v56);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268C65170);
          if ((swift_dynamicCast() & 1) == 0) {
            long long v57 = 0uLL;
          }
          sub_23FEF9708((uint64_t)&v58, &qword_268C65178);
          if ((void)v57)
          {
            long long v54 = v57;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v28 = sub_23FEF8D08(0, v28[2] + 1, 1, v28);
            }
            unint64_t v30 = v28[2];
            unint64_t v29 = v28[3];
            long long v31 = v54;
            if (v30 >= v29 >> 1)
            {
              v32 = sub_23FEF8D08((void *)(v29 > 1), v30 + 1, 1, v28);
              long long v31 = v54;
              v28 = v32;
            }
            v28[2] = v30 + 1;
            *(_OWORD *)&v28[2 * v30 + 4] = v31;
          }
          sub_23FF06440();
        }
        while (*((void *)&v62 + 1));
      }
      else
      {
        v28 = (void *)MEMORY[0x263F8EE78];
      }
      swift_release();
      swift_release();
      v33 = (void *)MEMORY[0x263F8EE78];
      *(void *)&long long v60 = MEMORY[0x263F8EE78];
      uint64_t v34 = v28[2];
      if (v34)
      {
        v35 = (long long *)(v28 + 4);
        do
        {
          long long v54 = *v35;
          uint64_t ObjectType = swift_getObjectType();
          uint64_t v37 = *((void *)&v54 + 1);
          v38 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v54 + 1) + 8);
          swift_unknownObjectRetain();
          if (v38(ObjectType, v37))
          {
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&long long v60 = v33;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_23FEF8E2C(0, v33[2] + 1, 1);
              v33 = (void *)v60;
            }
            unint64_t v41 = v33[2];
            unint64_t v40 = v33[3];
            if (v41 >= v40 >> 1)
            {
              sub_23FEF8E2C((void *)(v40 > 1), v41 + 1, 1);
              v33 = (void *)v60;
            }
            v33[2] = v41 + 1;
            *(_OWORD *)&v33[2 * v41 + 4] = v54;
          }
          else
          {
            swift_unknownObjectRelease();
          }
          ++v35;
          --v34;
        }
        while (v34);
      }
      swift_bridgeObjectRelease();
      sub_23FEF8C0C(v33);
      uint64_t v25 = (uint64_t)v50;
      unint64_t v6 = v48;
      sub_23FF06490();
      uint64_t v2 = v49;
      (*v42)(v6, v49);
      v21 = v45;
      sub_23FEF9708((uint64_t)v45, &qword_268C65168);
      sub_23FEF9644(v25, (uint64_t)v21);
      v18 = v47;
      sub_23FEF95DC((uint64_t)v21, (uint64_t)v47);
      v24 = v51;
      int v26 = v51(v18, 1, v2);
      v14 = v46;
      if (v26 == 1)
      {
        uint64_t v22 = v63;
        goto LABEL_28;
      }
    }
    __break(1u);
  }
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

uint64_t sub_23FEF95DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FEF9644(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FEF96AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23FEF9708(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23FEF976C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      sub_23FF060E0();
      uint64_t result = sub_23FF06380();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t sub_23FEF9930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = a2;
  uint64_t v22 = a1;
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v9, v14);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *(uint64_t **)(v17 + 16);
  uint64_t v25 = v7;
  uint64_t v26 = v18;
  long long v23 = *(_OWORD *)(v17 + 32);
  long long v27 = v23;
  uint64_t v28 = v19;
  _s16CollectByTriggerV5InnerCMa();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v22, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v4 + *(int *)(v6 + 52), v7);
  LOBYTE(v6) = *(unsigned char *)(v4 + *(int *)(v6 + 56));
  swift_allocObject();
  v24 = sub_23FEF9B98((uint64_t)v16, (uint64_t)v11, v6);
  swift_getWitnessTable();
  sub_23FF06210();
  return swift_release();
}

uint64_t *sub_23FEF9B44(uint64_t a1, uint64_t a2, char a3)
{
  return sub_23FEF9B98(a1, a2, a3);
}

uint64_t *sub_23FEF9B98(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = *(void *)(*v3 + 152);
  uint64_t v9 = (_DWORD *)swift_slowAlloc();
  *uint64_t v9 = 0;
  *(uint64_t *)((char *)v3 + v8) = (uint64_t)v9;
  uint64_t v10 = *(void *)(*v3 + 160);
  uint64_t v11 = (_DWORD *)swift_slowAlloc();
  *uint64_t v11 = 0;
  *(uint64_t *)((char *)v3 + v10) = (uint64_t)v11;
  uint64_t v12 = *(void *)(*v3 + 168);
  swift_getAssociatedTypeWitness();
  *(uint64_t *)((char *)v3 + v12) = sub_23FF062E0();
  uint64_t v13 = (uint64_t)v3 + *(void *)(*v3 + 176);
  *(void *)(v13 + 32) = 0;
  *(_OWORD *)uint64_t v13 = 0u;
  *(_OWORD *)(v13 + 16) = 0u;
  *(uint64_t *)((char *)v3 + *(void *)(*v3 + 184)) = 0;
  *(uint64_t *)((char *)v3 + *(void *)(*v3 + 192)) = 0;
  uint64_t v14 = (uint64_t)v3 + *(void *)(*v3 + 200);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v15 = sub_23FF060E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v7 + 96) - 8) + 32))((uint64_t)v3 + *(void *)(*v3 + 128), a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v7 + 88) - 8) + 32))((uint64_t)v3 + *(void *)(*v3 + 136), a2);
  *((unsigned char *)v3 + *(void *)(*v3 + 144)) = a3;
  return v3;
}

uint64_t *sub_23FEF9E60()
{
  uint64_t v1 = *v0;
  MEMORY[0x2455DCD70](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 152)), -1, -1);
  MEMORY[0x2455DCD70](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 160)), -1, -1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 96) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 128));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 136));
  swift_bridgeObjectRelease();
  sub_23FEFC2BC((uint64_t)v0 + *(void *)(*v0 + 176));
  swift_release();
  uint64_t v2 = (uint64_t)v0 + *(void *)(*v0 + 200);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_23FF060E0();
  uint64_t v3 = sub_23FF06380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t sub_23FEFA0A8()
{
  sub_23FEF9E60();

  return MEMORY[0x270FA0228]();
}

uint64_t _s16CollectByTriggerV5InnerCMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_23FEFA114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_23FEFA11C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_23FEFA1F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = *(void *)(v8 + 64);
  unint64_t v12 = v11 + ((v6 + v9) & ~v9) + 1;
  uint64_t v13 = (*(unsigned char *)(v5 + 80) | *(unsigned char *)(v8 + 80));
  if (v13 > 7 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v12 > 0x18)
  {
    uint64_t v16 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v13 + 16) & ~v13));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v18 = ((unint64_t)a2 + v10) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)v4 + v10) & v17, v18, v7);
    *(unsigned char *)((((unint64_t)v4 + v10) & v17) + v11) = *(unsigned char *)(v18 + v11);
  }
  return v4;
}

uint64_t sub_23FEFA36C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v6 = *(uint64_t (**)(unint64_t))(v5 + 8);
  unint64_t v7 = (*(void *)(v4 + 56) + a1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);

  return v6(v7);
}

uint64_t sub_23FEFA410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v12, v13);
  *(unsigned char *)(*(void *)(v9 + 48) + v12) = *(unsigned char *)(*(void *)(v9 + 48) + v13);
  return a1;
}

uint64_t sub_23FEFA4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 40);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v12, v13);
  *(unsigned char *)(*(void *)(v9 + 40) + v12) = *(unsigned char *)(*(void *)(v9 + 40) + v13);
  return a1;
}

uint64_t sub_23FEFA588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v12, v13);
  *(unsigned char *)(*(void *)(v9 + 32) + v12) = *(unsigned char *)(*(void *)(v9 + 32) + v13);
  return a1;
}

uint64_t sub_23FEFA644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v12, v13);
  *(unsigned char *)(*(void *)(v9 + 24) + v12) = *(unsigned char *)(*(void *)(v9 + 24) + v13);
  return a1;
}

uint64_t sub_23FEFA700(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v7 + 64);
  if (v8 <= v6) {
    unsigned int v11 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v7 + 84);
  }
  if (v11 <= 0xFE) {
    unsigned int v11 = 254;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(*(void *)(v4 - 8) + 64) + v9;
  int v13 = a2 - v11;
  if (a2 <= v11) {
    goto LABEL_26;
  }
  uint64_t v14 = v10 + (v12 & ~v9) + 1;
  char v15 = 8 * v14;
  if (v14 > 3) {
    goto LABEL_9;
  }
  unsigned int v17 = ((v13 + ~(-1 << v15)) >> v15) + 1;
  if (HIWORD(v17))
  {
    int v16 = *(_DWORD *)((char *)a1 + v14);
    if (v16) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v17 <= 0xFF)
    {
      if (v17 < 2) {
        goto LABEL_26;
      }
LABEL_9:
      int v16 = *((unsigned __int8 *)a1 + v14);
      if (!*((unsigned char *)a1 + v14)) {
        goto LABEL_26;
      }
LABEL_16:
      int v18 = (v16 - 1) << v15;
      if (v14 > 3) {
        int v18 = 0;
      }
      if (v10 + (v12 & ~v9) == -1)
      {
        int v20 = 0;
      }
      else
      {
        if (v14 <= 3) {
          int v19 = v10 + (v12 & ~v9) + 1;
        }
        else {
          int v19 = 4;
        }
        switch(v19)
        {
          case 2:
            int v20 = *a1;
            break;
          case 3:
            int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            int v20 = *(_DWORD *)a1;
            break;
          default:
            int v20 = *(unsigned __int8 *)a1;
            break;
        }
      }
      return v11 + (v20 | v18) + 1;
    }
    int v16 = *(unsigned __int16 *)((char *)a1 + v14);
    if (*(unsigned __int16 *)((char *)a1 + v14)) {
      goto LABEL_16;
    }
  }
LABEL_26:
  if (v6 == v11) {
    return (*(uint64_t (**)(void))(v5 + 48))();
  }
  unint64_t v22 = ((unint64_t)a1 + v12) & ~v9;
  if (v8 == v11) {
    return (*(uint64_t (**)(unint64_t))(v7 + 48))(v22);
  }
  unsigned int v23 = *(unsigned __int8 *)(v22 + v10);
  if (v23 < 2) {
    return 0;
  }
  return ((v23 + 2147483646) & 0x7FFFFFFF) + 1;
}

void sub_23FEFA924(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = *(void *)(v8 + 64);
  if (v9 <= v7) {
    unsigned int v12 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v8 + 84);
  }
  if (v12 <= 0xFE) {
    unsigned int v12 = 254;
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + v10;
  size_t v14 = v11 + (v13 & ~v10) + 1;
  BOOL v15 = a3 >= v12;
  unsigned int v16 = a3 - v12;
  if (v16 != 0 && v15)
  {
    if (v14 <= 3)
    {
      unsigned int v20 = ((v16 + ~(-1 << (8 * v14))) >> (8 * v14)) + 1;
      if (HIWORD(v20))
      {
        int v17 = 4;
      }
      else if (v20 >= 0x100)
      {
        int v17 = 2;
      }
      else
      {
        int v17 = v20 > 1;
      }
    }
    else
    {
      int v17 = 1;
    }
  }
  else
  {
    int v17 = 0;
  }
  if (v12 < a2)
  {
    unsigned int v18 = ~v12 + a2;
    if (v14 < 4)
    {
      int v19 = (v18 >> (8 * v14)) + 1;
      if (v11 + (v13 & ~v10) != -1)
      {
        int v21 = v18 & ~(-1 << (8 * v14));
        bzero(a1, v14);
        if (v14 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v14 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v14);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v14] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v14] = v19;
        return;
      case 3:
        goto LABEL_45;
      case 4:
        *(_DWORD *)&a1[v14] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v14] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v14] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_45:
      __break(1u);
      JUMPOUT(0x23FEFAC18);
    case 4:
      *(_DWORD *)&a1[v14] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v7 == v12)
        {
          unint64_t v22 = *(void (**)(void))(v6 + 56);
          v22();
        }
        else
        {
          unint64_t v23 = (unint64_t)&a1[v13] & ~v10;
          if (v9 == v12)
          {
            v24 = *(void (**)(unint64_t))(v8 + 56);
            v24(v23);
          }
          else
          {
            *(unsigned char *)(v23 + v11) = a2 + 1;
          }
        }
      }
      return;
  }
}

uint64_t _s16CollectByTriggerVMa()
{
  return swift_getGenericMetadata();
}

void sub_23FEFAC58(uint64_t a1)
{
  uint64_t v35 = *v1;
  uint64_t v3 = *(void *)(v35 + 104);
  uint64_t v4 = *(void *)(v35 + 80);
  swift_getAssociatedTypeWitness();
  uint64_t v34 = v4;
  swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_23FF060E0();
  uint64_t v6 = sub_23FF06380();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v6, v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v9, v12);
  BOOL v15 = (char *)&v31 - v14;
  uint64_t v16 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v13, v17);
  int v19 = (char *)&v31 - v18;
  sub_23FF06140();
  if ((sub_23FF06120() & 1) == 0)
  {
    if (a1 < 0)
    {
      __break(1u);
    }
    else if (a1)
    {
      goto LABEL_4;
    }
    __break(1u);
    goto LABEL_18;
  }
LABEL_4:
  v32 = v11;
  uint64_t v33 = v3;
  uint64_t v37 = v7;
  os_unfair_lock_t v36 = *(os_unfair_lock_t *)((char *)v1 + *(void *)(*v1 + 152));
  os_unfair_lock_lock(v36);
  unsigned int v20 = (uint64_t *)((char *)v1 + *(void *)(*v1 + 192));
  swift_beginAccess();
  uint64_t v21 = *v20;
  sub_23FF06140();
  if (sub_23FF06120()) {
    goto LABEL_13;
  }
  uint64_t v31 = a1;
  sub_23FF06140();
  char v22 = sub_23FF06120();
  uint64_t v23 = sub_23FF06140();
  if ((v22 & 1) == 0)
  {
    uint64_t v24 = v31;
    if (sub_23FF06120())
    {
LABEL_10:
      uint64_t v23 = sub_23FF06140();
      goto LABEL_12;
    }
    if (((v21 | v24) & 0x8000000000000000) == 0)
    {
      uint64_t v23 = v21 + v24;
      if (!__OFADD__(v21, v24))
      {
        if ((v23 & 0x8000000000000000) == 0) {
          goto LABEL_12;
        }
LABEL_19:
        __break(1u);
        return;
      }
      goto LABEL_10;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
LABEL_12:
  *unsigned int v20 = v23;
LABEL_13:
  swift_endAccess();
  uint64_t v25 = (uint64_t)v1 + *(void *)(*v1 + 200);
  swift_beginAccess();
  uint64_t v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v15, v25, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v6);
    os_unfair_lock_unlock(v36);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v15, v5);
    long long v27 = (uint64_t *)((char *)v1 + *(void *)(*v1 + 168));
    swift_beginAccess();
    uint64_t v28 = *v27;
    swift_getAssociatedTypeWitness();
    swift_bridgeObjectRetain();
    *long long v27 = sub_23FF062E0();
    swift_bridgeObjectRelease();
    unint64_t v29 = v32;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v32, 1, 1, v5);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 40))(v25, v29, v6);
    swift_endAccess();
    os_unfair_lock_unlock(v36);
    unint64_t v30 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 160));
    os_unfair_lock_lock(v30);
    uint64_t v38 = v28;
    sub_23FF060C0();
    swift_bridgeObjectRelease();
    sub_23FF060A0();
    os_unfair_lock_unlock(v30);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v5);
  }
}

void sub_23FEFB1A0()
{
  unint64_t v1 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 152));
  os_unfair_lock_lock(v1);
  uint64_t v2 = v0 + *(void *)(*(void *)v0 + 176);
  swift_beginAccess();
  sub_23FEFC254(v2, (uint64_t)&v7);
  if (*((void *)&v8 + 1))
  {
    sub_23FEFC734(&v7, (uint64_t)v10);
    uint64_t v3 = *(void *)(*(void *)v0 + 184);
    uint64_t v4 = *(void *)(v0 + v3);
    swift_getAssociatedTypeWitness();
    swift_retain();
    uint64_t v5 = sub_23FF062E0();
    uint64_t v6 = (uint64_t *)(v0 + *(void *)(*(void *)v0 + 168));
    swift_beginAccess();
    uint64_t *v6 = v5;
    swift_bridgeObjectRelease();
    uint64_t v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    swift_beginAccess();
    sub_23FEFC1EC((uint64_t)&v7, v2);
    swift_endAccess();
    *(void *)(v0 + v3) = 0;
    swift_release();
    os_unfair_lock_unlock(v1);
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_23FF060D0();
    if (v4)
    {
      swift_retain();
      sub_23FF06100();
      swift_release_n();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    sub_23FEFC2BC((uint64_t)&v7);
    os_unfair_lock_unlock(v1);
  }
}

uint64_t sub_23FEFB3A4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)v1;
  uint64_t v5 = *(os_unfair_lock_s **)(v1 + *(void *)(*(void *)v1 + 152));
  os_unfair_lock_lock(v5);
  uint64_t v6 = v1 + *(void *)(*(void *)v1 + 176);
  swift_beginAccess();
  sub_23FEFC254(v6, (uint64_t)v14);
  long long v7 = v15;
  sub_23FEFC2BC((uint64_t)v14);
  if (v7)
  {
    os_unfair_lock_unlock(v5);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    return sub_23FF060D0();
  }
  else
  {
    sub_23FEFC31C((uint64_t)a1, (uint64_t)v14);
    swift_beginAccess();
    sub_23FEFC1EC((uint64_t)v14, v6);
    swift_endAccess();
    uint64_t v9 = v4[14];
    uint64_t v10 = v4[11];
    swift_getAssociatedTypeWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    sub_23FF06110();
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = v4[10];
    v11[3] = v10;
    v11[4] = v4[12];
    v11[5] = v4[13];
    v11[6] = v9;
    v11[7] = v4[15];
    swift_retain();
    uint64_t v12 = sub_23FF060F0();
    *(void *)(v2 + *(void *)(*(void *)v2 + 184)) = v12;
    swift_retain();
    swift_release();
    v14[0] = v12;
    swift_getWitnessTable();
    sub_23FF06210();
    os_unfair_lock_unlock(v5);
    uint64_t v13 = *(os_unfair_lock_s **)(v2 + *(void *)(*(void *)v2 + 160));
    os_unfair_lock_lock(v13);
    BOOL v15 = v4;
    uint64_t WitnessTable = swift_getWitnessTable();
    v14[0] = v2;
    swift_retain();
    sub_23FF060B0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    os_unfair_lock_unlock(v13);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_23FF06140();
    sub_23FF06160();
    return swift_release();
  }
}

uint64_t sub_23FEFB71C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v6);
  long long v8 = &v13[-v7];
  uint64_t v9 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(v3 + 152));
  os_unfair_lock_lock(v9);
  uint64_t v10 = (uint64_t)v1 + *(void *)(*v1 + 176);
  swift_beginAccess();
  sub_23FEFC254(v10, (uint64_t)v13);
  uint64_t v11 = v14;
  sub_23FEFC2BC((uint64_t)v13);
  if (v11)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, AssociatedTypeWitness);
    swift_beginAccess();
    sub_23FF06300();
    sub_23FF062F0();
    swift_endAccess();
  }
  os_unfair_lock_unlock(v9);
  return sub_23FF06130();
}

void sub_23FEFB8E8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v35 = *v1;
  uint64_t v3 = v35;
  uint64_t v36 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_23FF060E0();
  uint64_t v6 = sub_23FF06380();
  uint64_t v32 = *(void *)(v6 - 8);
  uint64_t v33 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  uint64_t v31 = (char *)&v31 - v9;
  uint64_t v34 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v31 - v11;
  uint64_t v13 = *(void *)(v3 + 184);
  if (*(uint64_t *)((char *)v1 + v13))
  {
    swift_retain();
    sub_23FF06100();
    swift_release();
    uint64_t v3 = *v1;
  }
  uint64_t v14 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(v3 + 152));
  os_unfair_lock_lock(v14);
  uint64_t v40 = 0;
  memset(v39, 0, sizeof(v39));
  uint64_t v15 = (uint64_t)v1 + *(void *)(*v1 + 176);
  swift_beginAccess();
  sub_23FEFC1EC((uint64_t)v39, v15);
  swift_endAccess();
  *(uint64_t *)((char *)v1 + v13) = 0;
  swift_release();
  uint64_t v16 = (uint64_t *)((char *)v1 + *(void *)(*v1 + 168));
  swift_beginAccess();
  uint64_t v38 = *v16;
  swift_getAssociatedTypeWitness();
  sub_23FF06300();
  swift_getWitnessTable();
  if (sub_23FF06310())
  {
    os_unfair_lock_unlock(v14);
    uint64_t v17 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 160));
    os_unfair_lock_lock(v17);
LABEL_10:
    sub_23FF060A0();
    os_unfair_lock_unlock(v17);
    return;
  }
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
  v18(v12, v36, v5);
  int v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48))(v12, 1, AssociatedTypeWitness);
  uint64_t v20 = *v1;
  if (v19 != 1)
  {
    if (*((unsigned char *)v1 + *(void *)(v20 + 144)) == 1)
    {
      uint64_t v24 = (uint64_t *)((char *)v1 + *(void *)(v20 + 192));
      swift_beginAccess();
      uint64_t v25 = *v24;
      sub_23FF06140();
      if ((sub_23FF06120() & 1) == 0)
      {
        if (v25 < 0)
        {
LABEL_23:
          __break(1u);
          return;
        }
        if (!v25)
        {
          unint64_t v29 = v31;
          v18(v31, v36, v5);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v29, 0, 1, v5);
          uint64_t v30 = (uint64_t)v2 + *(void *)(*v2 + 200);
          swift_beginAccess();
          (*(void (**)(uint64_t, char *, uint64_t))(v32 + 40))(v30, v29, v33);
          swift_endAccess();
          goto LABEL_18;
        }
      }
      uint64_t v26 = *v16;
      swift_bridgeObjectRetain();
      *uint64_t v16 = sub_23FF062E0();
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v14);
      uint64_t v14 = *(os_unfair_lock_s **)((char *)v2 + *(void *)(*v2 + 160));
      os_unfair_lock_lock(v14);
      uint64_t v37 = v26;
      sub_23FF060C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      *uint64_t v16 = sub_23FF062E0();
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v14);
      uint64_t v14 = *(os_unfair_lock_s **)((char *)v1 + *(void *)(*v1 + 160));
      os_unfair_lock_lock(v14);
    }
    sub_23FF060A0();
LABEL_18:
    os_unfair_lock_unlock(v14);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v5);
    return;
  }
  uint64_t v21 = (uint64_t *)((char *)v1 + *(void *)(v20 + 192));
  swift_beginAccess();
  uint64_t v22 = *v21;
  sub_23FF06140();
  if (sub_23FF06120())
  {
LABEL_9:
    uint64_t v23 = *v16;
    swift_bridgeObjectRetain();
    *uint64_t v16 = sub_23FF062E0();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v14);
    uint64_t v17 = *(os_unfair_lock_s **)((char *)v2 + *(void *)(*v2 + 160));
    os_unfair_lock_lock(v17);
    uint64_t v37 = v23;
    sub_23FF060C0();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (v22 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v22) {
    goto LABEL_9;
  }
  long long v27 = v31;
  v18(v31, v36, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v27, 0, 1, v5);
  uint64_t v28 = (uint64_t)v2 + *(void *)(*v2 + 200);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 40))(v28, v27, v33);
  swift_endAccess();
  os_unfair_lock_unlock(v14);
}

uint64_t sub_23FEFC06C(void *a1)
{
  return sub_23FEFB3A4(a1);
}

uint64_t sub_23FEFC090(uint64_t a1)
{
  return sub_23FEFB71C(a1);
}

void sub_23FEFC0B4(uint64_t a1)
{
}

void sub_23FEFC0D8(uint64_t a1)
{
}

unint64_t sub_23FEFC0FC()
{
  return 0xD000000000000010;
}

uint64_t sub_23FEFC118()
{
  return sub_23FF06060();
}

void sub_23FEFC13C()
{
}

uint64_t sub_23FEFC160()
{
  return swift_getWitnessTable();
}

uint64_t sub_23FEFC17C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23FEFC198()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23FEFC1B8()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23FEFC1D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23FEF9930(a1, a4, a2);
}

uint64_t sub_23FEFC1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FEFC254(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FEFC2BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23FEFC31C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23FEFC380()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_23FEFC42C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(os_unfair_lock_s **)(v0 + *(void *)(*(void *)v0 + 152));
  os_unfair_lock_lock(v2);
  uint64_t v3 = (uint64_t *)(v0 + *(void *)(*(void *)v0 + 192));
  swift_beginAccess();
  uint64_t v4 = *v3;
  sub_23FF06140();
  if ((sub_23FF06120() & 1) == 0)
  {
    if (v4 < 0)
    {
      __break(1u);
      goto LABEL_24;
    }
    if (!v4) {
      goto LABEL_22;
    }
  }
  uint64_t v5 = (uint64_t *)(v1 + *(void *)(*(void *)v1 + 168));
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  sub_23FF06300();
  swift_getWitnessTable();
  if (sub_23FF06310())
  {
LABEL_22:
    os_unfair_lock_unlock(v2);
    return;
  }
  swift_beginAccess();
  uint64_t v6 = *v3;
  sub_23FF06140();
  if (sub_23FF06120()) {
    goto LABEL_12;
  }
  sub_23FF06140();
  if ((sub_23FF06120() & 1) == 0)
  {
    if ((v6 & 0x8000000000000000) == 0)
    {
      if (v6)
      {
        uint64_t v7 = v6 - 1;
        goto LABEL_11;
      }
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v7 = sub_23FF06140();
LABEL_11:
  uint64_t *v3 = v7;
LABEL_12:
  swift_endAccess();
  swift_bridgeObjectRetain();
  *uint64_t v5 = sub_23FF062E0();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v2);
  uint64_t v8 = *(os_unfair_lock_s **)(v1 + *(void *)(*(void *)v1 + 160));
  os_unfair_lock_lock(v8);
  uint64_t v9 = sub_23FF060C0();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v8);
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  uint64_t v10 = *v3;
  sub_23FF06140();
  if (sub_23FF06120())
  {
LABEL_21:
    swift_endAccess();
    goto LABEL_22;
  }
  sub_23FF06140();
  char v11 = sub_23FF06120();
  uint64_t v12 = sub_23FF06140();
  if (v11)
  {
LABEL_20:
    uint64_t *v3 = v12;
    goto LABEL_21;
  }
  if (sub_23FF06120())
  {
LABEL_18:
    uint64_t v12 = sub_23FF06140();
    goto LABEL_20;
  }
  if ((v10 | v9) < 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v12 = v10 + v9;
  if (__OFADD__(v10, v9)) {
    goto LABEL_18;
  }
  if ((v12 & 0x8000000000000000) == 0) {
    goto LABEL_20;
  }
LABEL_27:
  __break(1u);
}

uint64_t sub_23FEFC734(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t Context.description.getter(uint64_t a1, uint64_t a2)
{
  swift_getMetatypeMetadata();
  uint64_t v6 = sub_23FF064D0();
  sub_23FF062D0();
  uint64_t v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_23FF06350();

  sub_23FF062D0();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for Contexts()
{
  return &type metadata for Contexts;
}

uint64_t Configurations.AsyncDispatchedOnTrigger.composedConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FEFC810(v1, a1);
}

uint64_t sub_23FEFC810(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Configurations.AsyncDispatchedOnTrigger.init(asyncDispatched:triggered:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  a3[3] = &type metadata for Configurations.TriggeredUpdates;
  a3[4] = &protocol witness table for Configurations.TriggeredUpdates;
  *a3 = a2;
  a3[8] = &type metadata for Configurations.AsyncDispatched;
  a3[9] = &protocol witness table for Configurations.AsyncDispatched;
  a3[5] = result;
  return result;
}

uint64_t Configurations.AsyncDispatchedOnTrigger.stateDidChange(from:)(uint64_t a1)
{
  uint64_t v3 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  uint64_t v6 = (*(uint64_t (**)(void))(v3 + 8))();
  swift_release();
  return v6;
}

uint64_t sub_23FEFC954(uint64_t a1)
{
  uint64_t v3 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  uint64_t v6 = (*(uint64_t (**)(void))(v3 + 8))();
  swift_release();
  return v6;
}

uint64_t _s9CompositeVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s9CompositeVwxx(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t _s9CompositeVwcp(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *_s9CompositeVwca(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        char v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t _s9CompositeVwta(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t _s9CompositeVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s9CompositeVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations.AsyncDispatchedOnTrigger()
{
  return &type metadata for Configurations.AsyncDispatchedOnTrigger;
}

uint64_t Log.category.getter(uint64_t a1)
{
  return a1;
}

uint64_t Log.enabledInDebugKey.getter()
{
  return swift_retain();
}

void sub_23FEFCEEC()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    uint64_t v2 = sub_23FF06280();
    uint64_t v4 = v3;

    qword_268C65290 = v2;
    *(void *)algn_268C65298 = v4;
  }
  else
  {
    __break(1u);
  }
}

_DWORD *sub_23FEFCF78()
{
  __n128 result = (_DWORD *)swift_slowAlloc();
  *__n128 result = 0;
  qword_268C652A0 = (uint64_t)result;
  return result;
}

void sub_23FEFCFA4()
{
  off_268C652A8 = (_UNKNOWN *)MEMORY[0x263F8EE80];
}

Swift::Void __swiftcall Log.default(_:isPrivate:)(Swift::String _, Swift::Bool isPrivate)
{
  sub_23FEFD004(_._countAndFlagsBits, (uint64_t)_._object, isPrivate, v2, v3, v4, MEMORY[0x263F90290]);
}

Swift::Void __swiftcall Log.debug(_:isPrivate:)(Swift::String _, Swift::Bool isPrivate)
{
  sub_23FEFD004(_._countAndFlagsBits, (uint64_t)_._object, isPrivate, v2, v3, v4, MEMORY[0x263F90278]);
}

Swift::Void __swiftcall Log.error(_:isPrivate:)(Swift::String _, Swift::Bool isPrivate)
{
  sub_23FEFD004(_._countAndFlagsBits, (uint64_t)_._object, isPrivate, v2, v3, v4, MEMORY[0x263F90280]);
}

uint64_t sub_23FEFD004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v12 = a7();

  return _s8Stateful3LogV3log_4type9isPrivateySS_So03os_c1_D2_taSbtF_0(a1, a2, v12, a3, a4, a5);
}

unint64_t sub_23FEFD074(uint64_t a1, uint64_t a2)
{
  sub_23FF06470();
  sub_23FF062C0();
  uint64_t v4 = sub_23FF06480();

  return sub_23FEFD0EC(a1, a2, v4);
}

unint64_t sub_23FEFD0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23FF06450() & 1) == 0)
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
      while (!v14 && (sub_23FF06450() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23FEFD1D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C652C8);
  char v38 = a2;
  uint64_t v6 = sub_23FF06430();
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
    uint64_t v22 = (void *)(v5 + 64);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_23FF06470();
    sub_23FF062C0();
    uint64_t result = sub_23FF06480();
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
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void sub_23FEFD4E0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_23FEFD074(a2, a3);
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
    sub_23FEFD650();
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
  sub_23FEFD1D0(v15, a4 & 1);
  unint64_t v20 = sub_23FEFD074(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_23FF06460();
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
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
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

id sub_23FEFD650()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C652C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23FF06420();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
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
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
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

uint64_t _s8Stateful3LogV3log_4type9isPrivateySS_So03os_c1_D2_taSbtF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = qword_268C65148;
  swift_bridgeObjectRetain();
  if (v10 != -1) {
    swift_once();
  }
  os_unfair_lock_lock((os_unfair_lock_t)qword_268C652A0);
  if (qword_268C65150 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = off_268C652A8;
  if (*((void *)off_268C652A8 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_23FEFD074(a5, a6);
    if (v13)
    {
      unint64_t v14 = *(void **)(v11[7] + 8 * v12);
      swift_endAccess();
      id v15 = v14;
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_23FEFDCC4();
  if (qword_268C65140 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_23FF06370();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  id v15 = v16;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v20 = off_268C652A8;
  off_268C652A8 = (_UNKNOWN *)0x8000000000000000;
  sub_23FEFD4E0((uint64_t)v15, a5, a6, isUniquelyReferenced_nonNull_native);
  off_268C652A8 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_12:
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock((os_unfair_lock_t)qword_268C652A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C652B8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23FF06C30;
  *(void *)(v18 + 56) = MEMORY[0x263F8D310];
  *(void *)(v18 + 64) = sub_23FEFDD04();
  *(void *)(v18 + 32) = a1;
  *(void *)(v18 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_23FF06050();

  return swift_bridgeObjectRelease();
}

uint64_t destroy for Log()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s8Stateful3LogVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for Log(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Log(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Log(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Log(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

unint64_t sub_23FEFDCC4()
{
  unint64_t result = qword_268C652B0;
  if (!qword_268C652B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C652B0);
  }
  return result;
}

unint64_t sub_23FEFDD04()
{
  unint64_t result = qword_268C652C0;
  if (!qword_268C652C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C652C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations.Default()
{
  return &type metadata for Configurations.Default;
}

uint64_t Contexts.UIKit.init()()
{
  return sub_23FF06330();
}

id sub_23FEFDDA4()
{
  return *v0;
}

unint64_t sub_23FEFDDAC(uint64_t a1)
{
  unint64_t result = sub_23FEFDDD4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23FEFDDD4()
{
  unint64_t result = qword_268C652D0;
  if (!qword_268C652D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C652D0);
  }
  return result;
}

uint64_t sub_23FEFDE28()
{
  id v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_268C652D8);
  uint64_t v4 = sub_23FF064D0();
  sub_23FF062D0();
  id v2 = v1;
  sub_23FF06350();

  sub_23FF062D0();
  swift_bridgeObjectRelease();
  return v4;
}

ValueMetadata *type metadata accessor for Contexts.UIKit()
{
  return &type metadata for Contexts.UIKit;
}

uint64_t sub_23FEFDEC4()
{
  return 0;
}

void (*MutableStateValue.wrappedValue.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 344);
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  unint64_t v7 = malloc(v6);
  v3[4] = v7;
  StateValue.wrappedValue.getter((uint64_t)v7, v8, (uint64_t)v7);
  return sub_23FEFDFA8;
}

void sub_23FEFDFA8(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void *)(*(void *)a1 + 8);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    sub_23FF03698((uint64_t)v3, v7);
    uint64_t v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
    v8(v4, v5);
  }
  else
  {
    sub_23FF03698(*(void *)(*(void *)a1 + 32), a2);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t MutableStateValue.projectedValue.getter()
{
  return swift_retain();
}

void *MutableStateValue.__allocating_init(_:_:)(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(v1 + 376) + 8))();
  swift_allocObject();
  return sub_23FF017C0(a1, v3);
}

void *sub_23FEFE104(uint64_t a1, uint64_t a2)
{
  return sub_23FF017C0(a1, a2);
}

void sub_23FEFE15C()
{
}

uint64_t MutableStateValue.__deallocating_deinit()
{
  uint64_t v0 = StateValue.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t _s8Stateful17MutableStateValueC07wrappedD0xvs_0(uint64_t a1)
{
  uint64_t v3 = *v1;
  sub_23FEFE240();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v3 + 344) - 8) + 8);

  return v4(a1);
}

uint64_t sub_23FEFE244()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MutableStateValue()
{
  return swift_getGenericMetadata();
}

uint64_t Configurations.TriggeredUpdates.stateDidChange(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65360);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = a1;
  v11[2] = a2;
  char v12 = 0;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65368);
  sub_23FEFE690(&qword_268C65370, &qword_268C65368);
  sub_23FF061D0();
  sub_23FEFE690(&qword_268C65378, &qword_268C65360);
  uint64_t v9 = sub_23FF061B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_release();
  swift_release();
  return v9;
}

uint64_t sub_23FEFE44C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65360);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  v11[1] = a1;
  v11[2] = v8;
  char v12 = 0;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65368);
  sub_23FEFE690(&qword_268C65370, &qword_268C65368);
  sub_23FF061D0();
  sub_23FEFE690(&qword_268C65378, &qword_268C65360);
  uint64_t v9 = sub_23FF061B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  swift_release();
  swift_release();
  return v9;
}

uint64_t sub_23FEFE5FC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(qword_268C65380);
  *a2 = v3;

  return swift_bridgeObjectRetain();
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

uint64_t sub_23FEFE690(unint64_t *a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for Configurations.TriggeredUpdates()
{
  return &type metadata for Configurations.TriggeredUpdates;
}

uint64_t sub_23FEFE6E4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_23FEFE784(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(*v1 + 96)));
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 16))(a1, v4);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(*v1 + 96)));
}

uint64_t sub_23FEFE860(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_23FEFE8A0(a1);
  return v2;
}

uint64_t *sub_23FEFE8A0(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 96);
  uint64_t v5 = (_DWORD *)swift_slowAlloc();
  *uint64_t v5 = 0;
  *(uint64_t *)((char *)v1 + v4) = (uint64_t)v5;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 32))((uint64_t)v1 + *(void *)(*v1 + 88), a1);
  return v1;
}

uint64_t *sub_23FEFE950()
{
  uint64_t v1 = *v0;
  MEMORY[0x2455DCD70](*(uint64_t *)((char *)v0 + *(void *)(*v0 + 96)), -1, -1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 88));
  return v0;
}

uint64_t sub_23FEFE9EC()
{
  sub_23FEFE950();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for Synchronized()
{
  return __swift_instantiateGenericMetadata();
}

void sub_23FEFEA5C(uint64_t a1)
{
  uint64_t v3 = *v1;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(*v1 + 96)));
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 24))(v4, a1);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(void *)(*v1 + 96)));
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

unint64_t sub_23FEFEB78(uint64_t a1)
{
  unint64_t result = sub_23FEFEBA0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23FEFEBA0()
{
  unint64_t result = qword_268C65408;
  if (!qword_268C65408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C65408);
  }
  return result;
}

uint64_t sub_23FEFEBF4()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65410);
  uint64_t v4 = sub_23FF064D0();
  sub_23FF062D0();
  id v2 = v1;
  sub_23FF06350();

  sub_23FF062D0();
  swift_bridgeObjectRelease();
  return v4;
}

ValueMetadata *type metadata accessor for Contexts.PrivateQueue()
{
  return &type metadata for Contexts.PrivateQueue;
}

uint64_t Configurations.Print.stateDidChange(from:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65418);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65420);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = 0;
  uint64_t v16 = a1;
  memset(v14, 0, sizeof(v14));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65428);
  sub_23FEFE690(&qword_268C65430, &qword_268C65428);
  sub_23FF061F0();
  sub_23FEFEF18((uint64_t)v14);
  sub_23FEFE690(&qword_268C65440, &qword_268C65420);
  sub_23FF061D0();
  sub_23FEFE690(&qword_268C65448, &qword_268C65418);
  uint64_t v12 = sub_23FF061B0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v12;
}

uint64_t sub_23FEFEF18(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65438);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23FEFEF78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65418);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65420);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = 0;
  uint64_t v16 = a1;
  memset(v14, 0, sizeof(v14));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65428);
  sub_23FEFE690(&qword_268C65430, &qword_268C65428);
  sub_23FF061F0();
  sub_23FEFEF18((uint64_t)v14);
  sub_23FEFE690(&qword_268C65440, &qword_268C65420);
  sub_23FF061D0();
  sub_23FEFE690(&qword_268C65448, &qword_268C65418);
  uint64_t v12 = sub_23FF061B0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v12;
}

uint64_t sub_23FEFF1FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  a2[3] = MEMORY[0x263F8EE58] + 8;
  uint64_t v4 = swift_allocObject();
  *a2 = v4;

  return sub_23FEF96AC(a1, v4 + 16);
}

void *_s5PrintVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s5PrintVwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s5PrintVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
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

void *_s5PrintVwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5PrintVwet(uint64_t a1, int a2)
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

uint64_t _s5PrintVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations.Print()
{
  return &type metadata for Configurations.Print;
}

uint64_t sub_23FEFF3B0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23FEFF3EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_23FEFF430(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_23FEFF458(NSObject *a1, uint64_t (*a2)(uint64_t), char *a3)
{
  v42 = a2;
  v43 = a3;
  uint64_t v4 = sub_23FF06240();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23FF06260();
  uint64_t v41 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23FF062B0();
  MEMORY[0x270FA5388](v13 - 8, v14);
  dispatch_queue_get_label(0);
  sub_23FF062A0();
  uint64_t v15 = sub_23FF06290();
  uint64_t v17 = v16;
  uint64_t v18 = sub_23FF06350();
  if (v17)
  {
    if (v15 == v18 && v17 == v19)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = swift_bridgeObjectRelease();
      return v42(v22);
    }
    uint64_t v40 = v5;
    char v21 = sub_23FF06450();
    swift_bridgeObjectRelease();
    uint64_t v22 = swift_bridgeObjectRelease();
    if (v21) {
      return v42(v22);
    }
  }
  else
  {
    uint64_t v40 = v5;
    swift_bridgeObjectRelease();
  }
  sub_23FEF8AB0();
  unint64_t v23 = (void *)sub_23FF06330();
  dispatch_queue_get_label(0);
  sub_23FF062A0();
  uint64_t v24 = sub_23FF06290();
  uint64_t v26 = v25;
  uint64_t v27 = sub_23FF06350();
  if (v26)
  {
    if (v24 == v27 && v26 == v28)
    {
LABEL_22:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    char v30 = sub_23FF06450();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v30) {
      goto LABEL_23;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v32 = (void *)sub_23FF06330();
  char v33 = sub_23FF06360();

  if ((v33 & 1) == 0)
  {
    unint64_t v23 = (void *)swift_allocObject();
    uint64_t v8 = v43;
    v23[2] = v42;
    v23[3] = v8;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_23FEFF9E0;
    *(void *)(v4 + 24) = v23;
    uint64_t v49 = sub_23FEFF9E0;
    uint64_t v50 = v4;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v46 = 1107296256;
    v47 = sub_23FEFF430;
    v48 = &block_descriptor;
    uint64_t v34 = _Block_copy(&aBlock);
    uint64_t v9 = v50;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(a1, v34);
    _Block_release(v34);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return result;
    }
    __break(1u);
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v36 = swift_allocObject();
  uint64_t v37 = v43;
  *(void *)(v36 + 16) = v42;
  *(void *)(v36 + 24) = v37;
  uint64_t v49 = sub_23FEFFAF0;
  uint64_t v50 = v36;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v46 = 1107296256;
  v47 = sub_23FEFF3EC;
  v48 = &block_descriptor_9;
  char v38 = _Block_copy(&aBlock);
  swift_retain();
  sub_23FF06250();
  uint64_t v44 = MEMORY[0x263F8EE78];
  sub_23FEFFA30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65458);
  sub_23FEFFA88();
  sub_23FF06390();
  MEMORY[0x2455DC7C0](0, v12, v8, v38);
  _Block_release(v38);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
  return swift_release();
}

uint64_t sub_23FEFF9A8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23FEFF9E0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23FEFFA08()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_23FEFFA30()
{
  unint64_t result = qword_268C65450;
  if (!qword_268C65450)
  {
    sub_23FF06240();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C65450);
  }
  return result;
}

unint64_t sub_23FEFFA88()
{
  unint64_t result = qword_268C65460;
  if (!qword_268C65460)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C65458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C65460);
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations()
{
  return &type metadata for Configurations;
}

uint64_t Configurations.AsyncDispatched.stateDidChange(from:)(uint64_t a1, void *a2)
{
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65468);
  uint64_t v4 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65470);
  MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65478);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v24 = a2;
  uint64_t v25 = a1;
  uint64_t v17 = sub_23FF06320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  id v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C65428);
  sub_23FEF8AB0();
  sub_23FEFE690(&qword_268C65430, &qword_268C65428);
  sub_23FEFFE34();
  sub_23FF06200();
  sub_23FEFFE8C((uint64_t)v11);

  sub_23FEFE690(&qword_268C65488, &qword_268C65478);
  sub_23FF061D0();
  sub_23FEFE690(&qword_268C65490, &qword_268C65468);
  uint64_t v19 = v23;
  uint64_t v20 = sub_23FF061B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v19);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  return v20;
}

unint64_t sub_23FEFFE34()
{
  unint64_t result = qword_268C65480;
  if (!qword_268C65480)
  {
    sub_23FEF8AB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C65480);
  }
  return result;
}

uint64_t sub_23FEFFE8C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65470);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23FEFFEEC(uint64_t a1)
{
  return Configurations.AsyncDispatched.stateDidChange(from:)(a1, *v1);
}

ValueMetadata *type metadata accessor for Configurations.AsyncDispatched()
{
  return &type metadata for Configurations.AsyncDispatched;
}

void static StateObservingNSObject.context.getter()
{
}

uint64_t StateObservingNSObject.cancellableSubs.getter()
{
  sub_23FF006E0();

  return swift_bridgeObjectRetain();
}

uint64_t StateObservingNSObject.cancellableSubs.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + direct field offset for StateObservingNSObject.cancellableSubs);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*StateObservingNSObject.cancellableSubs.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t StateObservingNSObject.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + direct field offset for StateObservingNSObject.configuration;
  swift_beginAccess();
  return sub_23FF00728(v3, a1);
}

uint64_t StateObservingNSObject.configuration.setter(uint64_t a1)
{
  uint64_t v3 = v1 + direct field offset for StateObservingNSObject.configuration;
  swift_beginAccess();
  sub_23FF00790(a1, v3);
  return swift_endAccess();
}

uint64_t (*StateObservingNSObject.configuration.modify())()
{
  return j__swift_endAccess;
}

id StateObservingNSObject.__allocating_init(configuration:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return StateObservingNSObject.init(configuration:)(a1);
}

id StateObservingNSObject.init(configuration:)(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  *(void *)((char *)v1 + direct field offset for StateObservingNSObject.cancellableSubs) = MEMORY[0x263F8EE78];
  uint64_t v4 = (char *)v1 + direct field offset for StateObservingNSObject.configuration;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  long long v5 = *(_OWORD *)(v3 + 96);
  v10[0] = *(_OWORD *)(v3 + 80);
  v10[1] = v5;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for StateObservingNSObject();
  id v6 = objc_msgSendSuper2(&v11, sel_init);
  sub_23FEFC31C(a1, (uint64_t)v10);
  uint64_t v7 = (uint64_t)v6 + direct field offset for StateObservingNSObject.configuration;
  swift_beginAccess();
  id v8 = v6;
  sub_23FF00790((uint64_t)v10, v7);
  swift_endAccess();
  swift_getWitnessTable();
  StateObserving.setup()();

  __swift_destroy_boxed_opaque_existential_1(a1);
  return v8;
}

id StateObservingNSObject.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id StateObservingNSObject.init()()
{
  uint64_t v1 = *MEMORY[0x263F8EED0] & *v0;
  *(void *)((char *)v0 + direct field offset for StateObservingNSObject.cancellableSubs) = MEMORY[0x263F8EE78];
  uint64_t v2 = (char *)v0 + direct field offset for StateObservingNSObject.configuration;
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  long long v5 = *(_OWORD *)(v1 + 80);
  long long v6 = *(_OWORD *)(v1 + 96);
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for StateObservingNSObject();
  id v3 = objc_msgSendSuper2(&v7, sel_init, v5, v6);
  swift_getWitnessTable();
  StateObserving.setup()();

  return v3;
}

id sub_23FF00424()
{
  return StateObservingNSObject.init()();
}

Swift::Void __swiftcall StateObservingNSObject.update()()
{
}

id StateObservingNSObject.__deallocating_deinit()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for StateObservingNSObject();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

uint64_t sub_23FF0051C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + direct field offset for StateObservingNSObject.configuration;

  return sub_23FF00870(v2);
}

uint64_t sub_23FF00568()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t (*sub_23FF00584(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = StateObservingNSObject.configuration.modify();
  return sub_23FF005DC;
}

uint64_t sub_23FF005E0()
{
  sub_23FF006E0();

  return swift_bridgeObjectRetain();
}

uint64_t (*sub_23FF0060C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = StateObservingNSObject.cancellableSubs.modify();
  return sub_23FF005DC;
}

void sub_23FF00664(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_23FF006AC()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t sub_23FF006E0()
{
  uint64_t v1 = v0 + direct field offset for StateObservingNSObject.cancellableSubs;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_23FF00728(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_268C654A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23FF00790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_268C654A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for StateObservingNSObject()
{
  return swift_getGenericMetadata();
}

uint64_t sub_23FF00810(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t sub_23FF00818(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 104);
}

uint64_t sub_23FF00820()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23FF00870(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_268C654A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall StateObserving.setup()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_23FF0093C();
  if (v4)
  {
    sub_23FF00D44(v4, v3, v2);
    swift_release();
  }
}

uint64_t sub_23FF0093C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65540);
  uint64_t v2 = *(void (***)(char *, uint64_t))(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  long long v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C65548);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (void (**)(char *, uint64_t))((char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_23FEF8F70(v0);
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v25 = v7;
    uint64_t v26 = v2;
    uint64_t v27 = v10;
    uint64_t v28 = v1;
    uint64_t v30 = MEMORY[0x263F8EE78];
    sub_23FF063D0();
    uint64_t v13 = (uint64_t *)(v11 + 40);
    do
    {
      uint64_t v14 = *v13;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v14 + 16);
      swift_unknownObjectRetain();
      v16(ObjectType, v14);
      swift_unknownObjectRelease();
      sub_23FF063B0();
      sub_23FF063E0();
      sub_23FF063F0();
      sub_23FF063C0();
      v13 += 2;
      --v12;
    }
    while (v12);
    uint64_t v17 = v30;
    swift_bridgeObjectRelease();
    uint64_t v10 = v27;
    uint64_t v1 = v28;
    uint64_t v7 = v25;
    uint64_t v2 = v26;
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18) {
      goto LABEL_5;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v18 = *(void *)(MEMORY[0x263F8EE78] + 16);
  if (!v18) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v19 = v18 - 1;
  if (v18 == 1)
  {
    uint64_t v20 = *(void *)(v17 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)(v17 + 32);
    uint64_t v21 = sub_23FEFE690(&qword_268C65430, &qword_268C65428);
    uint64_t v27 = v2 + 1;
    uint64_t v28 = v21;
    uint64_t v26 = (void (**)(char *, uint64_t))(v7 + 8);
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v22 = 0;
    v24[1] = v20;
    uint64_t v25 = MEMORY[0x263F8EE58] + 8;
    do
    {
      uint64_t v29 = *(void *)(v17 + 8 * v22 + 40);
      uint64_t v30 = v20;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C65428);
      sub_23FF061C0();
      sub_23FEFE690(&qword_268C65550, &qword_268C65540);
      sub_23FF061D0();
      (*v27)(v5, v1);
      sub_23FEFE690(&qword_268C65558, &qword_268C65548);
      uint64_t v20 = sub_23FF061B0();
      (*v26)((char *)v10, v6);
      swift_release();
      swift_release();
      ++v22;
    }
    while (v19 != v22);
    swift_release();
    swift_bridgeObjectRelease_n();
  }
  return v20;
}

void *sub_23FF00D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v7;
  void *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (*v13)(void *, void);
  void v14[3];
  uint64_t v15;
  uint64_t v16;

  uint64_t v6 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(a3 + 48);
  v6(v14, a2, a3);
  uint64_t v7 = v15;
  sub_23FF00870((uint64_t)v14);
  if (!v7)
  {
    swift_retain();
    goto LABEL_5;
  }
  unint64_t result = ((void *(*)(void *__return_ptr, uint64_t, uint64_t))v6)(v14, a2, a3);
  uint64_t v9 = v15;
  if (v15)
  {
    uint64_t v10 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    a1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 8))(a1, v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
LABEL_5:
    v14[0] = a1;
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = a2;
    v12[3] = a3;
    v12[4] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C65428);
    sub_23FEFE690(&qword_268C65430, &qword_268C65428);
    sub_23FF06230();
    swift_release();
    uint64_t v13 = (void (*)(void *, void))(*(uint64_t (**)(void *, uint64_t, uint64_t))(a3 + 88))(v14, a2, a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C65530);
    sub_23FEFE690(&qword_268C65538, &qword_268C65530);
    sub_23FF06170();
    swift_release();
    v13(v14, 0);
    return (void *)swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_23FF00F88()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23FF00FC0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v6);
  uint64_t v8 = (char *)&v12 - v7;
  swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, AssociatedTypeWitness);
  return v10;
}

uint64_t sub_23FF01114@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(qword_268C65560);
  uint64_t v4 = swift_allocObject();
  *a2 = v4;

  return sub_23FF0133C(a1, v4 + 16);
}

uint64_t sub_23FF01178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x2455DCDC0](v6);
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = sub_23FF00FC0(a3, a4);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a3;
    *(void *)(v10 + 24) = a4;
    *(void *)(v10 + 32) = v8;
    swift_unknownObjectRetain();
    sub_23FEFF458(v9, (uint64_t (*)(uint64_t))sub_23FF012C4, (char *)v10);
    swift_unknownObjectRelease();

    return swift_release();
  }
  return result;
}

uint64_t sub_23FF01248()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23FF01280(uint64_t a1)
{
  return sub_23FF01178(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_23FF0128C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23FF012C4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 96))(*(void *)(v0 + 16));
}

uint64_t sub_23FF012FC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_23FF0133C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_268C65560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Publisher<>.toStateChangedPublisher()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23FF06080();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v12 - v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  sub_23FF061D0();
  swift_release();
  swift_getWitnessTable();
  uint64_t v10 = sub_23FF061B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10;
}

uint64_t sub_23FF0150C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  a2[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  uint64_t v6 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);

  return v6(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
}

uint64_t sub_23FF015A8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23FF015B8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23FF0150C(a1, a2);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t StateValue.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(*(void *)v3 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v8 = (char *)&v10 - v7;
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter((uint64_t)v8);
  swift_release();
  sub_23FF02F98((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter(a3);
  return swift_release();
}

uint64_t sub_23FF0172C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_23FF03698(a1, a2);
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v4 + 80) - 8) + 8);

  return v5(a1);
}

uint64_t StateValue.previous.getter()
{
  return sub_23FF02C58((void (*)(void))sub_23FF03A40);
}

void *sub_23FF017C0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*v2 + 80);
  uint64_t v6 = sub_23FF06380();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))((char *)&v13 - v9, 1, 1, v5);
  uint64_t v11 = sub_23FF037D0((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v2[2] = a1;
  v2[3] = v11;
  v2[4] = a2;
  return v2;
}

uint64_t StateValue.ifUpdated(_:)(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v53 = a2;
  long long v54 = a1;
  uint64_t v50 = *v2;
  uint64_t v3 = *(void *)(v50 + 80);
  uint64_t v4 = sub_23FF06380();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v51 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](TupleTypeMetadata2, v6);
  uint64_t v9 = (char *)&v49 - v8;
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7, v10);
  long long v60 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  uint64_t v16 = (char *)&v49 - v15;
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  uint64_t v20 = (char *)&v49 - v19;
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v18, v22);
  uint64_t v49 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23, v25);
  uint64_t v27 = (char *)&v49 - v26;
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter((uint64_t)v27);
  swift_release();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  long long v58 = v27;
  uint64_t v56 = v3;
  v28(v20, v27, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v20, 0, 1, v3);
  long long v55 = v2;
  swift_retain();
  sub_23FEFE784((uint64_t)v16);
  swift_release();
  uint64_t v52 = TupleTypeMetadata2;
  uint64_t v29 = v9;
  uint64_t v30 = &v9[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  v31(v9, v20, v4);
  long long v57 = v30;
  uint64_t v32 = v16;
  uint64_t v33 = v4;
  uint64_t v34 = v4;
  uint64_t v35 = v56;
  v31(v30, v16, v34);
  uint64_t v59 = v21;
  uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  long long v61 = v29;
  if (v36(v29, 1, v35) != 1)
  {
    uint64_t v41 = v62;
    v31(v60, v61, v33);
    v42 = v57;
    if (v36(v57, 1, v35) != 1)
    {
      uint64_t v39 = v59;
      uint64_t v44 = v49;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v49, v42, v35);
      char v45 = sub_23FF06270();
      uint64_t v46 = *(void (**)(char *, uint64_t))(v39 + 8);
      v46(v44, v35);
      v47 = *(void (**)(char *, uint64_t))(v41 + 8);
      v47(v32, v33);
      v47(v20, v33);
      v46(v60, v35);
      v47(v61, v33);
      uint64_t v40 = (uint64_t)v58;
      if (v45) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v40, v35);
      }
LABEL_8:
      v54(v40);
      sub_23FF02F98(v40);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v40, v35);
    }
    v43 = *(void (**)(char *, uint64_t))(v41 + 8);
    v43(v32, v33);
    v43(v20, v33);
    uint64_t v39 = v59;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v35);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v51 + 8))(v61, v52);
    uint64_t v40 = (uint64_t)v58;
    goto LABEL_8;
  }
  uint64_t v37 = *(void (**)(char *, uint64_t))(v62 + 8);
  v37(v16, v33);
  v37(v20, v33);
  unsigned int v38 = v36(v57, 1, v35);
  uint64_t v39 = v59;
  if (v38 != 1) {
    goto LABEL_6;
  }
  v37(v61, v33);
  uint64_t v40 = (uint64_t)v58;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v40, v35);
}

uint64_t StateValue.ifUpdated<A>(_:_:)(void *a1, void (*a2)(uint64_t, char *), uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v91 = a4;
  uint64_t v99 = a3;
  v100 = a2;
  uint64_t v94 = *v4;
  uint64_t v6 = v94;
  uint64_t v7 = *a1;
  v113 = a1;
  uint64_t v8 = *(void *)(*MEMORY[0x263F8EA20] + v7 + 8);
  uint64_t v118 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](a1, v8);
  v104 = (char *)&v91 - v9;
  uint64_t v119 = v10;
  uint64_t v11 = sub_23FF06380();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v97 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](TupleTypeMetadata2, v12);
  v112 = (char *)&v91 - v14;
  uint64_t v106 = v11;
  uint64_t v109 = *(void *)(v11 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v13, v15);
  v96 = (char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16, v18);
  v116 = (char *)&v91 - v20;
  MEMORY[0x270FA5388](v19, v21);
  v117 = (char *)&v91 - v22;
  uint64_t v23 = *(void *)(v6 + 80);
  uint64_t v24 = sub_23FF06380();
  uint64_t v25 = swift_getTupleTypeMetadata2();
  uint64_t v101 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25, v26);
  v111 = (char *)&v91 - v28;
  uint64_t v110 = *(void *)(v24 - 8);
  uint64_t v29 = v110;
  uint64_t v31 = MEMORY[0x270FA5388](v27, v30);
  v107 = (char *)&v91 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x270FA5388](v31, v33);
  v115 = (char *)&v91 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34, v36);
  uint64_t v39 = (char *)&v91 - v38;
  uint64_t v41 = MEMORY[0x270FA5388](v37, v40);
  v43 = (char *)&v91 - v42;
  uint64_t v44 = *(void *)(v23 - 8);
  uint64_t v46 = MEMORY[0x270FA5388](v41, v45);
  v103 = (char *)&v91 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v46, v48);
  uint64_t v50 = (char *)&v91 - v49;
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter((uint64_t)v50);
  swift_release();
  uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
  v121 = v50;
  uint64_t v93 = v44 + 16;
  v92 = v51;
  v51(v43, (uint64_t)v50, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v43, 0, 1, v23);
  v114 = v5;
  swift_retain();
  sub_23FEFE784((uint64_t)v39);
  swift_release();
  uint64_t v102 = v25;
  uint64_t v52 = *(int *)(v25 + 48);
  uint64_t v53 = v111;
  long long v54 = &v111[v52];
  uint64_t v105 = v29;
  long long v55 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v55(v111, v43, v24);
  v55(v54, v39, v24);
  uint64_t v120 = v44;
  uint64_t v56 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  if (v56(v53, 1, v23) != 1)
  {
    v55(v115, v53, v24);
    int v58 = v56(v54, 1, v23);
    v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v56;
    if (v58 != 1)
    {
      uint64_t v66 = v120;
      v67 = v103;
      (*(void (**)(char *, char *, uint64_t))(v120 + 32))(v103, v54, v23);
      LODWORD(v102) = sub_23FF06270();
      v68 = *(void (**)(char *, uint64_t))(v66 + 8);
      v68(v67, v23);
      long long v57 = *(void (**)(char *, uint64_t))(v110 + 8);
      v57(v39, v24);
      v57(v43, v24);
      v68(v115, v23);
      v57(v53, v24);
      uint64_t v59 = v117;
      uint64_t v60 = (uint64_t)v107;
      if (v102) {
        return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v121, v23);
      }
LABEL_8:
      swift_getAtKeyPath();
      long long v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v118 + 56);
      v61(v59, 0, 1, v119);
      swift_retain();
      sub_23FEFE784(v60);
      swift_release();
      int v62 = v98(v60, 1, v23);
      uint64_t v95 = v23;
      if (v62)
      {
        v57((char *)v60, v24);
        uint64_t v63 = 1;
        v64 = v112;
        v65 = v116;
      }
      else
      {
        v69 = v103;
        v92(v103, v60, v23);
        v57((char *)v60, v24);
        v65 = v116;
        swift_getAtKeyPath();
        (*(void (**)(char *, uint64_t))(v120 + 8))(v69, v23);
        uint64_t v63 = 0;
        v64 = v112;
      }
      uint64_t v70 = v119;
      v61(v65, v63, 1, v119);
      uint64_t v71 = v109;
      v72 = &v64[*(int *)(TupleTypeMetadata2 + 48)];
      v73 = *(void (**)(char *, char *, uint64_t))(v109 + 16);
      v74 = v117;
      uint64_t v75 = v106;
      v73(v64, v117, v106);
      v115 = v72;
      v73(v72, v65, v75);
      uint64_t v76 = v118;
      v77 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v118 + 48);
      if (((unsigned int (*)(char *))v77)(v64) == 1)
      {
        v78 = *(void (**)(char *, uint64_t))(v71 + 8);
        v78(v116, v75);
        v78(v74, v75);
        int v79 = v77(v115, 1, v70);
        uint64_t v23 = v95;
        if (v79 == 1)
        {
          v78(v112, v75);
          return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v121, v23);
        }
      }
      else
      {
        v80 = v96;
        v73(v96, v64, v75);
        v81 = v115;
        if (v77(v115, 1, v70) != 1)
        {
          uint64_t v83 = v76 + 32;
          v84 = v104;
          (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v104, v81, v70);
          char v85 = sub_23FF06270();
          v86 = *(void (**)(char *, uint64_t))(v83 - 24);
          v86(v84, v70);
          v87 = *(void (**)(char *, uint64_t))(v109 + 8);
          v87(v116, v75);
          v87(v117, v75);
          v86(v80, v70);
          v87(v64, v75);
          uint64_t v23 = v95;
          if (v85) {
            return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v121, v23);
          }
LABEL_20:
          v88 = v104;
          uint64_t v89 = (uint64_t)v121;
          swift_getAtKeyPath();
          v100(v89, v88);
          (*(void (**)(char *, uint64_t))(v118 + 8))(v88, v119);
          sub_23FF02F98(v89);
          return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v121, v23);
        }
        v82 = *(void (**)(char *, uint64_t))(v109 + 8);
        v82(v116, v75);
        v82(v117, v75);
        (*(void (**)(char *, uint64_t))(v76 + 8))(v80, v70);
        uint64_t v23 = v95;
      }
      (*(void (**)(char *, uint64_t))(v97 + 8))(v112, TupleTypeMetadata2);
      goto LABEL_20;
    }
    long long v57 = *(void (**)(char *, uint64_t))(v110 + 8);
    v57(v39, v24);
    v57(v43, v24);
    (*(void (**)(char *, uint64_t))(v120 + 8))(v115, v23);
LABEL_7:
    uint64_t v59 = v117;
    uint64_t v60 = (uint64_t)v107;
    (*(void (**)(char *, uint64_t))(v101 + 8))(v53, v102);
    goto LABEL_8;
  }
  long long v57 = *(void (**)(char *, uint64_t))(v110 + 8);
  v57(v39, v24);
  v57(v43, v24);
  if (v56(v54, 1, v23) != 1)
  {
    v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v56;
    goto LABEL_7;
  }
  v57(v53, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v121, v23);
}

uint64_t _s8Stateful17MutableStateValueC16mutateAtomicallyyyyxzcF_0(void (*a1)(char *), uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)v2 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)&v10 - v6;
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter((uint64_t)v7);
  swift_release();
  a1(v7);
  sub_23FF035B4((uint64_t)v7, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t StateValue.deinit()
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t StateValue.publisher.getter()
{
  sub_23FF02BEC();
  uint64_t v0 = PublishedValue.publisher.getter();
  swift_release();
  return v0;
}

uint64_t sub_23FF02BEC()
{
  swift_unknownObjectRetain();
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_23FF02C40()
{
  return sub_23FF02C58((void (*)(void))PublishedValue.wrappedValue.getter);
}

uint64_t sub_23FF02C58(void (*a1)(void))
{
  sub_23FF02BEC();
  a1();

  return swift_release();
}

uint64_t StateValue.mutateImmediatelyNotifyAsync(_:)(void (*a1)(char *))
{
  uint64_t v3 = *(void *)(*(void *)v1 + 96);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v24 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v25 = AssociatedTypeWitness;
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness, v6);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = *(void *)(v4 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v7, v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v15);
  uint64_t v17 = (char *)&v24 - v16;
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter((uint64_t)v17);
  swift_release();
  a1(v17);
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter((uint64_t)v14);
  swift_release();
  char v18 = sub_23FF06270();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v14, v4);
  if ((v18 & 1) == 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v17, v4);
    (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
    uint64_t v20 = v25;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v22 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v20, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v20);
    sub_23FF038B0((uint64_t)v14);

    v19(v14, v4);
  }
  return ((uint64_t (*)(char *, uint64_t))v19)(v17, v4);
}

uint64_t sub_23FF02F98(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = sub_23FF06380();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v11 - v7, a1, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, v3);
  swift_retain();
  sub_23FEFEA5C((uint64_t)v8);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t StateValue.keyPath.getter()
{
  return swift_retain();
}

uint64_t sub_23FF03108(uint64_t a1, uint64_t a2)
{
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v4 = (char *)&v7 - v3;
  (*(void (**)(char *))(v5 + 16))((char *)&v7 - v3);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 152))(v4);
}

uint64_t property wrapper backing initializer of StateValue.lastAccessedValue(uint64_t a1)
{
  uint64_t v2 = sub_23FF037D0(a1);
  uint64_t v3 = sub_23FF06380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return v2;
}

uint64_t StateValue.projectedValue.getter()
{
  return swift_retain();
}

uint64_t StateValue.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(v1 + 104) + 8))();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 272);

  return v4(a1, v3);
}

uint64_t sub_23FF032D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_23FF017C0(a1, a2);
  return v4;
}

uint64_t StateValue.__deallocating_deinit()
{
  StateValue.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_23FF0335C()
{
  uint64_t v13 = *v0;
  uint64_t v1 = v13;
  uint64_t v12 = *(void *)(v13 + 80);
  sub_23FF06150();
  swift_getWitnessTable();
  uint64_t v2 = sub_23FF06080();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v11 - v5;
  sub_23FF02BEC();
  uint64_t v7 = PublishedValue.publisher.getter();
  swift_release();
  uint64_t v14 = v7;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v12;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v13 + 88);
  *(void *)(v8 + 40) = *(void *)(v1 + 104);
  sub_23FF061D0();
  swift_release();
  swift_release();
  swift_getWitnessTable();
  uint64_t v9 = sub_23FF061B0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v9;
}

uint64_t sub_23FF0359C()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_23FF035B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)v2 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)&v9 - v6;
  sub_23FF02BEC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_23FF03EC8((uint64_t)v7);
  return swift_release();
}

uint64_t sub_23FF03698(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)v2 + 80);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)&v11 - v6;
  sub_23FF02BEC();
  PublishedValue.wrappedValue.getter((uint64_t)v7);
  swift_release();
  char v8 = sub_23FF06270();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    sub_23FF02F98(a1);
    return sub_23FF035B4(a1, v10);
  }
  return result;
}

uint64_t sub_23FF037D0(uint64_t a1)
{
  uint64_t v2 = sub_23FF06380();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - v5;
  type metadata accessor for Synchronized();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  return sub_23FEFE860((uint64_t)v6);
}

uint64_t sub_23FF038B0(uint64_t a1)
{
  sub_23FF02F98(a1);
  sub_23FF02BEC();
  sub_23FF04F40(a1);

  return swift_release();
}

uint64_t sub_23FF038F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 144))();
}

uint64_t sub_23FF03940()
{
  return 32;
}

__n128 sub_23FF0394C(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_23FF03958()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for StateValue()
{
  return swift_getGenericMetadata();
}

uint64_t sub_23FF039C4()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23FF039D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  uint64_t v6 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v6(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_23FF03A40@<X0>(uint64_t a1@<X8>)
{
  swift_retain();
  sub_23FEFE784(a1);

  return swift_release();
}

uint64_t PublishedValue.publisher.getter()
{
  uint64_t v31 = *v0;
  uint64_t v1 = sub_23FF06190();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = sub_23FF06070();
  uint64_t v3 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26, v4);
  uint64_t v25 = (char *)&v25 - v5;
  uint64_t v6 = sub_23FF06150();
  uint64_t v7 = swift_getWitnessTable();
  uint64_t v29 = v1;
  uint64_t v30 = WitnessTable;
  uint64_t v33 = v1;
  uint64_t v34 = v6;
  uint64_t v35 = WitnessTable;
  uint64_t v36 = v7;
  uint64_t v27 = v7;
  uint64_t v8 = sub_23FF06090();
  uint64_t v28 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v25 - v10;
  swift_getWitnessTable();
  uint64_t v12 = sub_23FF06070();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  uint64_t v17 = (char *)&v25 - v16;
  uint64_t v18 = v0[3];
  if (v18)
  {
    uint64_t v19 = swift_retain();
    uint64_t v20 = sub_23FF042B0(v19);
    uint64_t v32 = v18;
    uint64_t v33 = v20;
    sub_23FF061E0();
    swift_release();
    sub_23FF06220();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v8);
    swift_getWitnessTable();
    uint64_t v21 = sub_23FF061B0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  else
  {
    uint64_t v33 = sub_23FF042B0(v15);
    uint64_t v22 = v25;
    sub_23FF06220();
    swift_release();
    uint64_t v23 = v26;
    swift_getWitnessTable();
    uint64_t v21 = sub_23FF061B0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v22, v23);
  }
  return v21;
}

uint64_t PublishedValue.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  swift_retain();
  sub_23FEFE784(a1);

  return swift_release();
}

uint64_t sub_23FF03EC8(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = sub_23FF06380();
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  uint64_t v6 = MEMORY[0x270FA5388](v4, v5);
  uint64_t v8 = (char *)&v31 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v6, v10);
  uint64_t v12 = (char *)&v31 - v11;
  uint64_t v13 = sub_23FF062B0();
  MEMORY[0x270FA5388](v13 - 8, v14);
  uint64_t v15 = *(void *)(v2 + 88);
  uint64_t v16 = (void *)sub_23FF04DB8(v3, v15);
  dispatch_queue_get_label(0);
  sub_23FF062A0();
  uint64_t v17 = sub_23FF06290();
  uint64_t v19 = v18;
  uint64_t v20 = sub_23FF06350();
  if (!v19)
  {

    swift_bridgeObjectRelease();
    uint64_t v24 = v34;
    goto LABEL_9;
  }
  if (v17 != v20 || v19 != v21)
  {
    char v23 = sub_23FF06450();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v24 = v34;
    if (v23) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v25 = (void *)sub_23FF04DB8(v3, v15);
    sub_23FF04F40(v24);

    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v24, v3);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = v34;
LABEL_11:
  swift_retain();
  sub_23FEFE784((uint64_t)v12);
  swift_release();
  char v27 = sub_23FF06270();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v9 + 8);
  v28(v12, v3);
  if (v27)
  {
    uint64_t v29 = (char *)v24;
  }
  else
  {
    swift_retain();
    sub_23FEFE784((uint64_t)v8);
    swift_release();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, v3);
    sub_23FF04EF8((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v33);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v24, v3);
    swift_retain();
    sub_23FEFEA5C((uint64_t)v12);
    swift_release();
    uint64_t v30 = ((uint64_t (*)(char *, uint64_t))v28)(v12, v3);
    sub_23FF042B0(v30);
    PublishedValue.wrappedValue.getter((uint64_t)v12);
    sub_23FF06180();
    swift_release();
    v28((char *)v24, v3);
    uint64_t v29 = v12;
  }
  return ((uint64_t (*)(char *, uint64_t))v28)(v29, v3);
}

uint64_t sub_23FF042B0(uint64_t a1)
{
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](a1, *(void *)(*v1 + 80));
  uint64_t v4 = (char *)&v7 - v3;
  if (v1[2])
  {
    uint64_t v5 = v1[2];
  }
  else
  {
    sub_23FF06190();
    PublishedValue.wrappedValue.getter((uint64_t)v4);
    uint64_t v5 = sub_23FF061A0();
    v2[2] = v5;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v5;
}

uint64_t property wrapper backing initializer of PublishedValue.value(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23FF05088(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t property wrapper backing initializer of PublishedValue.previousValue(uint64_t a1)
{
  uint64_t v2 = sub_23FF05160(a1);
  uint64_t v3 = sub_23FF06380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return v2;
}

uint64_t sub_23FF0446C(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return sub_23FF03EC8((uint64_t)v2);
}

uint64_t PublishedValue.projectedValue.getter()
{
  return swift_retain();
}

void *PublishedValue.__allocating_init(wrappedValue:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_allocObject();
  uint64_t v4 = sub_23FF05240(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 80) - 8) + 8))(a1);
  return v4;
}

void *PublishedValue.init(wrappedValue:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_23FF05240(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t PublishedValue.perform<A>(ifChanged:action:)(char *a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
{
  v64[1] = a4;
  uint64_t v68 = a3;
  v69 = a2;
  uint64_t v76 = a1;
  uint64_t v5 = *v4;
  uint64_t v6 = *(void *)(*MEMORY[0x263F8EA20] + *(void *)a1 + 8);
  uint64_t v7 = sub_23FF06380();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v67 = *(void *)(TupleTypeMetadata2 - 8);
  MEMORY[0x270FA5388](TupleTypeMetadata2, v8);
  uint64_t v75 = (char *)v64 - v9;
  uint64_t v10 = *(void *)(v5 + 80);
  uint64_t v11 = sub_23FF06380();
  uint64_t v70 = *(void *)(v11 - 8);
  uint64_t v71 = v11;
  uint64_t v13 = MEMORY[0x270FA5388](v11, v12);
  uint64_t v15 = (char *)v64 - v14;
  uint64_t v80 = v7;
  uint64_t v74 = *(void *)(v7 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v13, v16);
  uint64_t v66 = (char *)v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  v77 = (char *)v64 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  uint64_t v25 = (char *)v64 - v24;
  uint64_t v26 = *(void *)(v10 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v23, v27);
  uint64_t v30 = (char *)v64 - v29;
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v28, v32);
  v64[0] = (char *)v64 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33, v35);
  uint64_t v37 = (char *)v64 - v36;
  PublishedValue.wrappedValue.getter((uint64_t)v30);
  swift_getAtKeyPath();
  v65 = *(void (**)(char *, uint64_t))(v26 + 8);
  v65(v30, v10);
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v72 = v37;
  v38(v25, v37, v6);
  uint64_t v73 = v31;
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v78 = v25;
  v39(v25, 0, 1, v6);
  sub_23FF03A40((uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v15, 1, v10))
  {
    (*(void (**)(char *, uint64_t))(v70 + 8))(v15, v71);
    uint64_t v40 = 1;
    uint64_t v41 = v77;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v30, v15, v10);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v15, v71);
    uint64_t v41 = v77;
    swift_getAtKeyPath();
    v65(v30, v10);
    uint64_t v40 = 0;
  }
  v39(v41, v40, 1, v6);
  uint64_t v42 = v80;
  uint64_t v44 = v74;
  v43 = v75;
  uint64_t v45 = v41;
  uint64_t v46 = &v75[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v47 = *(void (**)(void))(v74 + 16);
  uint64_t v48 = v78;
  ((void (*)(char *, char *, uint64_t))v47)(v75, v78, v80);
  uint64_t v76 = v46;
  ((void (*)(char *, char *, uint64_t))v47)(v46, v45, v42);
  uint64_t v49 = v73;
  uint64_t v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48);
  if (v50(v43, 1, v6) != 1)
  {
    long long v54 = v66;
    v47();
    long long v55 = v76;
    if (v50(v76, 1, v6) != 1)
    {
      uint64_t v58 = v64[0];
      (*(void (**)(void, char *, uint64_t))(v49 + 32))(v64[0], v55, v6);
      char v59 = sub_23FF06270();
      uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v60(v58, v6);
      long long v61 = *(void (**)(char *, uint64_t))(v44 + 8);
      uint64_t v62 = v80;
      v61(v77, v80);
      v61(v78, v62);
      v60((uint64_t)v54, v6);
      v61(v43, v62);
      uint64_t v53 = v72;
      if (v59) {
        return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v53, v6);
      }
LABEL_11:
      v69(v53);
      return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v53, v6);
    }
    uint64_t v56 = *(void (**)(char *, uint64_t))(v44 + 8);
    uint64_t v57 = v80;
    v56(v77, v80);
    v56(v78, v57);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v54, v6);
LABEL_9:
    (*(void (**)(char *, uint64_t))(v67 + 8))(v43, TupleTypeMetadata2);
    uint64_t v53 = v72;
    goto LABEL_11;
  }
  uint64_t v51 = *(void (**)(char *, uint64_t))(v44 + 8);
  uint64_t v52 = v80;
  v51(v45, v80);
  v51(v48, v52);
  if (v50(v76, 1, v6) != 1) {
    goto LABEL_9;
  }
  v51(v43, v80);
  uint64_t v53 = v72;
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v53, v6);
}

uint64_t PublishedValue.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t PublishedValue.__deallocating_deinit()
{
  PublishedValue.deinit();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_23FF04DB8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v6);
  uint64_t v8 = (char *)&v12 - v7;
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, AssociatedTypeWitness);
  return v10;
}

uint64_t sub_23FF04EF8(uint64_t a1)
{
  swift_retain();
  sub_23FEFEA5C(a1);

  return swift_release();
}

uint64_t sub_23FF04F40(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v5 = (char *)&v9 - v4;
  (*(void (**)(char *))(v3 + 16))((char *)&v9 - v4);
  swift_retain();
  sub_23FEFEA5C((uint64_t)v5);
  swift_release();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t v7 = v6(v5, v2);
  sub_23FF042B0(v7);
  PublishedValue.wrappedValue.getter((uint64_t)v5);
  sub_23FF06180();
  swift_release();
  return v6(v5, v2);
}

uint64_t sub_23FF05088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Synchronized();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  return sub_23FEFE860((uint64_t)v6);
}

uint64_t sub_23FF05160(uint64_t a1)
{
  uint64_t v2 = sub_23FF06380();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - v5;
  type metadata accessor for Synchronized();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  return sub_23FEFE860((uint64_t)v6);
}

void *sub_23FF05240(uint64_t a1)
{
  uint64_t v3 = *(void *)(*v1 + 80);
  uint64_t v4 = sub_23FF06380();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v12 - v7;
  v1[2] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))((char *)&v12 - v7, 1, 1, v3);
  uint64_t v9 = sub_23FF05160((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v1[5] = v9;
  uint64_t v10 = sub_23FF05088(a1, v3);
  v1[3] = 0;
  v1[4] = v10;
  return v1;
}

uint64_t sub_23FF053A4@<X0>(uint64_t a1@<X8>)
{
  return PublishedValue.wrappedValue.getter(a1);
}

uint64_t sub_23FF053CC()
{
  return 16;
}

__n128 sub_23FF053D8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23FF053E4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PublishedValue()
{
  return __swift_instantiateGenericMetadata();
}

void static StateObserver.context.getter()
{
}

uint64_t StateObserver.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_23FF00728(v1 + 16, a1);
}

uint64_t StateObserver.configuration.setter(uint64_t a1)
{
  swift_beginAccess();
  sub_23FF00790(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t (*StateObserver.configuration.modify())()
{
  return j__swift_endAccess;
}

uint64_t StateObserver.cancellableSubs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StateObserver.cancellableSubs.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*StateObserver.cancellableSubs.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t StateObserver.__allocating_init(configuration:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  StateObserver.init(configuration:)(a1);
  return v2;
}

uint64_t *StateObserver.init(configuration:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  uint64_t v4 = MEMORY[0x263F8EE78];
  v1[6] = 0;
  v1[7] = v4;
  sub_23FEFC31C(a1, (uint64_t)v7);
  swift_beginAccess();
  sub_23FF00790((uint64_t)v7, (uint64_t)(v1 + 2));
  swift_endAccess();
  long long v5 = *(_OWORD *)(v3 + 96);
  v7[0] = *(_OWORD *)(v3 + 80);
  v7[1] = v5;
  type metadata accessor for StateObserver();
  swift_getWitnessTable();
  StateObserving.setup()();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v1;
}

uint64_t type metadata accessor for StateObserver()
{
  return swift_getGenericMetadata();
}

Swift::Void __swiftcall StateObserver.update()()
{
}

uint64_t StateObserver.deinit()
{
  sub_23FF00870(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StateObserver.__deallocating_deinit()
{
  sub_23FF00870(v0 + 16);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_23FF058D0()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_23FF058E4@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_23FF00728(v1 + 16, a1);
}

uint64_t sub_23FF05930(uint64_t a1)
{
  swift_beginAccess();
  sub_23FF00790(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t (*sub_23FF05984())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23FF059D8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23FF05A10(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23FF05A58())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23FF05AAC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t sub_23FF05AD0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23FF05B20()
{
  return 1;
}

void (*MutableStateBinding.wrappedValue.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 344);
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v3[4] = v7;
  StateValue.wrappedValue.getter((uint64_t)v7, v8, (uint64_t)v7);
  return sub_23FEFDFA8;
}

uint64_t MutableStateBinding.projectedValue.getter()
{
  return swift_retain();
}

void *MutableStateBinding.__allocating_init(_:_:)(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(v1 + 376) + 8))();
  swift_allocObject();
  return sub_23FF017C0(a1, v3);
}

void sub_23FF05C94()
{
}

uint64_t MutableStateBinding.__deallocating_deinit()
{
  uint64_t v0 = StateValue.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for MutableStateBinding()
{
  return swift_getGenericMetadata();
}

uint64_t Configurations.Composite.init(inner:outer:)@<X0>(long long *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  sub_23FEFC734(a1, a3);

  return sub_23FEFC734(a2, a3 + 40);
}

uint64_t Configurations.Composite.stateDidChange(from:)(uint64_t a1)
{
  uint64_t v3 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  uint64_t v6 = (*(uint64_t (**)(void))(v3 + 8))();
  swift_release();
  return v6;
}

uint64_t Configurations.Composite.inner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FEFC31C(v1, a1);
}

uint64_t Configurations.Composite.outer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23FEFC31C(v1 + 40, a1);
}

ValueMetadata *type metadata accessor for Configurations.Composite()
{
  return &type metadata for Configurations.Composite;
}

void sub_23FF05E34()
{
}

uint64_t StateBinding.projectedValue.getter()
{
  return swift_retain();
}

uint64_t StateBinding.__deallocating_deinit()
{
  uint64_t v0 = StateValue.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_23FF05F4C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for StateBinding()
{
  return swift_getGenericMetadata();
}

uint64_t static Optional<A>.mutationContext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_23FF05FD0()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23FF05FF0(uint64_t a1, uint64_t a2)
{
  return static Optional<A>.mutationContext.getter(*(void *)(a1 + 16), *(void *)(a2 - 8));
}

uint64_t sub_23FF05FFC(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23FF06050()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_23FF06060()
{
  return MEMORY[0x270EE3828]();
}

uint64_t sub_23FF06070()
{
  return MEMORY[0x270EE3930]();
}

uint64_t sub_23FF06080()
{
  return MEMORY[0x270EE3950]();
}

uint64_t sub_23FF06090()
{
  return MEMORY[0x270EE39A8]();
}

uint64_t sub_23FF060A0()
{
  return MEMORY[0x270EE3AE0]();
}

uint64_t sub_23FF060B0()
{
  return MEMORY[0x270EE3AE8]();
}

uint64_t sub_23FF060C0()
{
  return MEMORY[0x270EE3AF0]();
}

uint64_t sub_23FF060D0()
{
  return MEMORY[0x270EE3AF8]();
}

uint64_t sub_23FF060E0()
{
  return MEMORY[0x270EE3B10]();
}

uint64_t sub_23FF060F0()
{
  return MEMORY[0x270EE3B18]();
}

uint64_t sub_23FF06100()
{
  return MEMORY[0x270EE3B28]();
}

uint64_t sub_23FF06110()
{
  return MEMORY[0x270EE3B30]();
}

uint64_t sub_23FF06120()
{
  return MEMORY[0x270EE3B40]();
}

uint64_t sub_23FF06130()
{
  return MEMORY[0x270EE3B48]();
}

uint64_t sub_23FF06140()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_23FF06150()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_23FF06160()
{
  return MEMORY[0x270EE3B78]();
}

uint64_t sub_23FF06170()
{
  return MEMORY[0x270EE3BA0]();
}

uint64_t sub_23FF06180()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_23FF06190()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_23FF061A0()
{
  return MEMORY[0x270EE3CB0]();
}

uint64_t sub_23FF061B0()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_23FF061C0()
{
  return MEMORY[0x270EE3E50]();
}

uint64_t sub_23FF061D0()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_23FF061E0()
{
  return MEMORY[0x270EE3EC0]();
}

uint64_t sub_23FF061F0()
{
  return MEMORY[0x270EE3EF0]();
}

uint64_t sub_23FF06200()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_23FF06210()
{
  return MEMORY[0x270EE3FD0]();
}

uint64_t sub_23FF06220()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_23FF06230()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_23FF06240()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23FF06250()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23FF06260()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23FF06270()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23FF06280()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23FF06290()
{
  return MEMORY[0x270EF1A58]();
}

uint64_t sub_23FF062A0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_23FF062B0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_23FF062C0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23FF062D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23FF062E0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_23FF062F0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_23FF06300()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_23FF06310()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_23FF06320()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_23FF06330()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23FF06340()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23FF06350()
{
  return MEMORY[0x270FA0DC8]();
}

uint64_t sub_23FF06360()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23FF06370()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_23FF06380()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23FF06390()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23FF063A0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23FF063B0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23FF063C0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23FF063D0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23FF063E0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23FF063F0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23FF06400()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_23FF06410()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23FF06420()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23FF06430()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23FF06440()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_23FF06450()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23FF06460()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23FF06470()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23FF06480()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23FF06490()
{
  return MEMORY[0x270F9FCA0]();
}

uint64_t sub_23FF064A0()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_23FF064B0()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_23FF064C0()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_23FF064D0()
{
  return MEMORY[0x270FA0128]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}