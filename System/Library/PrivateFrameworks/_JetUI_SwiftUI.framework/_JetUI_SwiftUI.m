uint64_t sub_23834F12C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char *, uint64_t);
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v22 = a3;
  v25 = a4;
  v26 = a1;
  v7 = sub_2383600C0();
  v8 = *(void *)(v7 - 8);
  v9 = *(void *)(v8 + 64);
  v10 = MEMORY[0x270FA5388](v7);
  v24 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v12 = (char *)&v21 - v11;
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v23((char *)&v21 - v11, a1, v7);
  v13 = *(unsigned __int8 *)(v8 + 80);
  v14 = (v13 + 32) & ~v13;
  v21 = v13 | 7;
  v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  v16 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v16(v15 + v14, v12, v7);
  v17 = v24;
  v23(v24, v26, v7);
  v18 = swift_allocObject();
  v19 = v22;
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = v19;
  v16(v18 + v14, v17, v7);
  sub_238360180();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v26, v7);
}

uint64_t sub_23834F33C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *(void *)(a2 + 8);
  a3[3] = a1;
  a3[4] = v4;
  __swift_allocate_boxed_opaque_existential_1(a3);
  uint64_t v5 = sub_2383600C0();
  return MEMORY[0x23EC8D120](v5);
}

uint64_t sub_23834F394@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  sub_2383600C0();

  return sub_23834F33C(v3, v4, a1);
}

uint64_t sub_23834F41C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_238360440();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v9 = &v20[-v8 - 8];
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7);
  v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v11);
  v15 = &v20[-v14 - 8];
  sub_23834F82C(a1, (uint64_t)v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972730);
  char v16 = swift_dynamicCast();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  if (v16)
  {
    v17(v9, 0, 1, a3);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v9, a3);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, a3);
    sub_2383600C0();
    sub_2383600B0();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, a3);
  }
  else
  {
    v17(v9, 1, 1, a3);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    sub_238360230();
    sub_2383600C0();
    return sub_2383600B0();
  }
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  v2 = (int *)(sub_2383600C0() - 8);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80));
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v3 + v2[10], v1);

  return swift_deallocObject();
}

uint64_t sub_23834F7A4(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(sub_2383600C0() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_23834F41C(a1, v5, v3);
}

uint64_t sub_23834F82C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t JUComponentView.init(presenting:for:with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a3, a1, AssociatedTypeWitness);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for JUComponentView() + 36);
  swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_2383600C0();
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);

  return v9(v7, a2, v8);
}

uint64_t type metadata accessor for JUComponentView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23834FA68(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  swift_getAssociatedTypeWitness();
  uint64_t v3 = sub_2383600C0();
  return a2(v3);
}

uint64_t sub_23834FAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  uint64_t v5 = (uint64_t *)((char *)v2 + *(void *)(*v2 + 112));
  swift_beginAccess();
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_23834FF64(v6);
  uint64_t v56 = v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    uint64_t v9 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23834F82C(v9, (uint64_t)v53);
      __swift_project_boxed_opaque_existential_1(v53, v54);
      uint64_t v11 = sub_23835FD60();
      swift_unknownObjectRelease();
      swift_beginAccess();
      if (*(void *)(*v5 + 16))
      {
        sub_2383525C4(v11);
        if (v12) {
          goto LABEL_5;
        }
      }
      swift_endAccess();
      uint64_t v13 = v54;
      uint64_t v14 = v55;
      __swift_project_boxed_opaque_existential_1(v53, v54);
      uint64_t v15 = sub_2383500D8(a2, v13, *(void *)(v4 + 80), v14, *(void *)(v4 + 88));
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v5;
      v51 = (void *)*v5;
      *uint64_t v5 = 0x8000000000000000;
      unint64_t v19 = sub_2383525C4(v11);
      uint64_t v20 = *(void *)(v17 + 16);
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21)) {
        goto LABEL_48;
      }
      char v23 = v18;
      if (*(void *)(v17 + 24) >= v22)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          v26 = v51;
          if ((v18 & 1) == 0) {
            goto LABEL_15;
          }
        }
        else
        {
          sub_238352CF4();
          v26 = v51;
          if ((v23 & 1) == 0) {
            goto LABEL_15;
          }
        }
      }
      else
      {
        sub_2383528A4(v22, isUniquelyReferenced_nonNull_native);
        unint64_t v24 = sub_2383525C4(v11);
        if ((v23 & 1) != (v25 & 1)) {
          goto LABEL_51;
        }
        unint64_t v19 = v24;
        v26 = v51;
        if ((v23 & 1) == 0)
        {
LABEL_15:
          v26[(v19 >> 6) + 8] |= 1 << v19;
          uint64_t v27 = 8 * v19;
          *(void *)(v26[6] + v27) = v11;
          *(void *)(v26[7] + v27) = v15;
          uint64_t v28 = v26[2];
          BOOL v29 = __OFADD__(v28, 1);
          uint64_t v30 = v28 + 1;
          if (v29) {
            goto LABEL_49;
          }
          v26[2] = v30;
          goto LABEL_4;
        }
      }
      uint64_t v10 = v26[7];
      swift_release();
      *(void *)(v10 + 8 * v19) = v15;
LABEL_4:
      *uint64_t v5 = (uint64_t)v26;
      swift_bridgeObjectRelease();
LABEL_5:
      swift_endAccess();
      sub_2383527A0(v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
      v9 += 40;
      if (!--v8)
      {
        swift_bridgeObjectRelease();
        uint64_t v31 = v56;
        goto LABEL_21;
      }
    }
  }
  uint64_t v31 = v7;
LABEL_21:
  int64_t v32 = 0;
  uint64_t v33 = v31 + 56;
  uint64_t v34 = 1 << *(unsigned char *)(v31 + 32);
  uint64_t v35 = -1;
  if (v34 < 64) {
    uint64_t v35 = ~(-1 << v34);
  }
  unint64_t v36 = v35 & *(void *)(v31 + 56);
  int64_t v37 = (unint64_t)(v34 + 63) >> 6;
  if (v36) {
    goto LABEL_26;
  }
LABEL_27:
  int64_t v40 = v32 + 1;
  if (!__OFADD__(v32, 1))
  {
    if (v40 < v37)
    {
      unint64_t v41 = *(void *)(v33 + 8 * v40);
      ++v32;
      if (v41) {
        goto LABEL_40;
      }
      int64_t v32 = v40 + 1;
      if (v40 + 1 >= v37) {
        return swift_release();
      }
      unint64_t v41 = *(void *)(v33 + 8 * v32);
      if (v41) {
        goto LABEL_40;
      }
      int64_t v32 = v40 + 2;
      if (v40 + 2 >= v37) {
        return swift_release();
      }
      unint64_t v41 = *(void *)(v33 + 8 * v32);
      if (v41)
      {
LABEL_40:
        unint64_t v36 = (v41 - 1) & v41;
        for (unint64_t i = __clz(__rbit64(v41)) + (v32 << 6); ; unint64_t i = v38 | (v32 << 6))
        {
          uint64_t v43 = *(void *)(*(void *)(v31 + 48) + 8 * i);
          swift_beginAccess();
          unint64_t v44 = sub_2383525C4(v43);
          if (v45)
          {
            unint64_t v46 = v44;
            int v47 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v48 = *v5;
            uint64_t v52 = *v5;
            *uint64_t v5 = 0x8000000000000000;
            if (!v47)
            {
              sub_238352CF4();
              uint64_t v48 = v52;
            }
            sub_238352B5C(v46, v48);
            *uint64_t v5 = v48;
            swift_bridgeObjectRelease();
            swift_endAccess();
            sub_238360350();
            swift_release();
            if (!v36) {
              goto LABEL_27;
            }
          }
          else
          {
            swift_endAccess();
            if (!v36) {
              goto LABEL_27;
            }
          }
LABEL_26:
          unint64_t v38 = __clz(__rbit64(v36));
          v36 &= v36 - 1;
        }
      }
      int64_t v42 = v40 + 3;
      if (v42 < v37)
      {
        unint64_t v41 = *(void *)(v33 + 8 * v42);
        if (v41)
        {
          int64_t v32 = v42;
          goto LABEL_40;
        }
        while (1)
        {
          int64_t v32 = v42 + 1;
          if (__OFADD__(v42, 1)) {
            goto LABEL_50;
          }
          if (v32 >= v37) {
            return swift_release();
          }
          unint64_t v41 = *(void *)(v33 + 8 * v32);
          ++v42;
          if (v41) {
            goto LABEL_40;
          }
        }
      }
    }
    return swift_release();
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  uint64_t result = sub_238360590();
  __break(1u);
  return result;
}

uint64_t sub_23834FF64(uint64_t a1)
{
  uint64_t result = sub_238360360();
  int64_t v3 = 0;
  uint64_t v15 = result;
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
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_2383526A4(&v14, *(void *)(*(void *)(a1 + 48) + 8 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2383500D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = a3;
  uint64_t v26 = a5;
  uint64_t v24 = a1;
  uint64_t v7 = type metadata accessor for JUComponentReloader();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689728D8);
  MEMORY[0x270FA5388](v11 - 8);
  int64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2383602D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = sub_23835FD60();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v24, v7);
  sub_2383602A0();
  uint64_t v16 = sub_238360290();
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  char v18 = (char *)swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  *((void *)v18 + 2) = v16;
  *((void *)v18 + 3) = v19;
  uint64_t v20 = v25;
  *((void *)v18 + 4) = a2;
  *((void *)v18 + 5) = v20;
  uint64_t v21 = v26;
  *((void *)v18 + 6) = a4;
  *((void *)v18 + 7) = v21;
  *((void *)v18 + 8) = v15;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v17], v10, v7);
  return sub_238352244((uint64_t)v13, (uint64_t)&unk_2689728E8, (uint64_t)v18);
}

uint64_t JUComponentView.Coordinator.deinit()
{
  sub_238356A28(v0 + 16, &qword_268972738);
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  swift_getAssociatedTypeWitness();
  uint64_t v2 = sub_238360440();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t JUComponentView.Coordinator.__deallocating_deinit()
{
  JUComponentView.Coordinator.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_23835043C()
{
  uint64_t v0 = swift_allocObject();
  sub_238350474();
  return v0;
}

uint64_t *sub_238350474()
{
  uint64_t v1 = *v0;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  v0[6] = 0;
  uint64_t v2 = (uint64_t)v0 + *(void *)(v1 + 104);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v2, 1, 1, AssociatedTypeWitness);
  uint64_t v4 = *(void *)(*v0 + 112);
  *(uint64_t *)((char *)v0 + v4) = sub_238354074(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t JUComponentView.makeCoordinator()()
{
  return sub_23835417C();
}

void *JUComponentView.makeView(context:)()
{
  return sub_2383541C0();
}

uint64_t JUComponentView.updateView(_:context:)(void *a1, uint64_t a2, uint64_t a3)
{
  v122 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = type metadata accessor for JUComponentReloader();
  uint64_t v105 = *(void *)(v8 - 8);
  uint64_t v106 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v104 = (uint64_t)&v99 - v9;
  uint64_t v119 = sub_23835FEA0();
  uint64_t v116 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  v115 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_2383600C0();
  MEMORY[0x270FA5388](v12 - 8);
  v113 = (char *)&v99 - v13;
  uint64_t v14 = sub_238360190();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v114 = (uint64_t)&v99 - v15;
  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t v110 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v111 = (char *)&v99 - v17;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v120 = v7;
  uint64_t v121 = v6;
  uint64_t v19 = swift_getAssociatedConformanceWitness();
  v142[0] = v16;
  v142[1] = AssociatedTypeWitness;
  v142[2] = AssociatedConformanceWitness;
  uint64_t v143 = v19;
  uint64_t v123 = v19;
  uint64_t v20 = sub_23835FD50();
  uint64_t v117 = *(void *)(v20 - 8);
  uint64_t v118 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  v103 = (char *)&v99 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v128 = (char *)&v99 - v24;
  uint64_t v137 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v23);
  v100 = (char *)&v99 - v25;
  uint64_t v136 = AssociatedTypeWitness;
  uint64_t v26 = sub_238360440();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v102 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v127 = (char *)&v99 - v28;
  uint64_t v29 = v26;
  uint64_t v134 = *(void *)(v26 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  int64_t v32 = (char *)&v99 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  v101 = (char *)&v99 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v108 = (char *)&v99 - v36;
  MEMORY[0x270FA5388](v35);
  v126 = (char *)&v99 - v37;
  swift_getWitnessTable();
  uint64_t v38 = sub_23835FFA0();
  uint64_t v129 = *(void *)(v38 - 8);
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  unint64_t v41 = (char *)&v99 - v40;
  uint64_t v133 = a3;
  uint64_t v130 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v39);
  v131 = (char *)&v99 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = AssociatedConformanceWitness;
  uint64_t v135 = v3;
  uint64_t v112 = v16;
  uint64_t v44 = v43;
  sub_238360140();
  uint64_t v138 = a2;
  sub_23835FF80();
  uint64_t v45 = v148;
  swift_beginAccess();
  sub_238354240(v45 + 16, (uint64_t)v147);
  swift_release();
  sub_238354240((uint64_t)v149, (uint64_t)v142);
  sub_238354240((uint64_t)v147, (uint64_t)&v144);
  v109 = v32;
  uint64_t v125 = v29;
  if (v143)
  {
    sub_238354240((uint64_t)v142, (uint64_t)v141);
    if (*((void *)&v145 + 1))
    {
      v139[0] = v144;
      v139[1] = v145;
      uint64_t v140 = v146;
      char v46 = MEMORY[0x23EC8D510](v141, v139);
      sub_238354310((uint64_t)v139);
      int v47 = &qword_268972738;
      sub_238356A28((uint64_t)v147, &qword_268972738);
      sub_238356A28((uint64_t)v149, &qword_268972738);
      sub_238354310((uint64_t)v141);
    }
    else
    {
      sub_238356A28((uint64_t)v147, &qword_268972738);
      sub_238356A28((uint64_t)v149, &qword_268972738);
      sub_238354310((uint64_t)v141);
      char v46 = 0;
      int v47 = (uint64_t *)&unk_268972740;
    }
  }
  else
  {
    sub_238356A28((uint64_t)v147, &qword_268972738);
    sub_238356A28((uint64_t)v149, &qword_268972738);
    if (*((void *)&v145 + 1)) {
      int v47 = (uint64_t *)&unk_268972740;
    }
    else {
      int v47 = &qword_268972738;
    }
    if (*((void *)&v145 + 1)) {
      char v46 = 0;
    }
    else {
      char v46 = -1;
    }
  }
  uint64_t v48 = v133;
  uint64_t v50 = v129;
  uint64_t v49 = v130;
  v51 = v41;
  sub_238356A28((uint64_t)v142, v47);
  uint64_t v52 = v131;
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v131, v135, v48);
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v41, v138, v44);
  uint64_t v124 = v44;
  if (v46)
  {
    v53 = v126;
    sub_23834FA68(v48, MEMORY[0x263F1B730]);
    uint64_t v54 = v127;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v137 + 56))(v53, 0, 1, v136);
    v99 = v51;
    sub_23835FF80();
    uint64_t v55 = v142[0] + *(void *)(*(void *)v142[0] + 104);
    swift_beginAccess();
    uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v134 + 16);
    v57 = v108;
    uint64_t v58 = v125;
    v56(v108, v55, v125);
    swift_release();
    v59 = &v54[*(int *)(TupleTypeMetadata2 + 48)];
    v56(v54, (uint64_t)v53, v58);
    v56(v59, (uint64_t)v57, v58);
    uint64_t v60 = v136;
    v61 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v137 + 48);
    if (v61(v54, 1, v136) == 1)
    {
      v62 = *(void (**)(char *, uint64_t))(v134 + 8);
      v62(v57, v58);
      v62(v126, v58);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v99, v124);
      (*(void (**)(char *, uint64_t))(v130 + 8))(v131, v133);
      uint64_t v63 = v58;
      if (v61(v59, 1, v60) == 1) {
        return ((uint64_t (*)(char *, uint64_t))v62)(v127, v58);
      }
    }
    else
    {
      v66 = v101;
      v56(v101, (uint64_t)v127, v58);
      unsigned int v67 = v61(v59, 1, v60);
      v68 = v66;
      uint64_t v69 = v124;
      uint64_t v63 = v58;
      uint64_t v70 = v134;
      v71 = v99;
      if (v67 != 1)
      {
        uint64_t v74 = v136;
        uint64_t v73 = v137;
        v75 = v100;
        (*(void (**)(char *, char *, uint64_t))(v137 + 32))(v100, v59, v136);
        LODWORD(TupleTypeMetadata2) = sub_238360240();
        v76 = v68;
        v77 = *(void (**)(char *, uint64_t))(v73 + 8);
        v77(v75, v74);
        v78 = *(void (**)(char *, uint64_t))(v70 + 8);
        v78(v108, v63);
        v78(v126, v63);
        (*(void (**)(char *, uint64_t))(v129 + 8))(v71, v69);
        uint64_t v65 = v133;
        (*(void (**)(char *, uint64_t))(v130 + 8))(v131, v133);
        v77(v76, v74);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v78)(v127, v63);
        if (TupleTypeMetadata2) {
          return result;
        }
        goto LABEL_20;
      }
      v72 = *(void (**)(char *, uint64_t))(v134 + 8);
      v72(v108, v63);
      v72(v126, v63);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v71, v69);
      (*(void (**)(char *, uint64_t))(v130 + 8))(v131, v133);
      (*(void (**)(char *, uint64_t))(v137 + 8))(v68, v136);
    }
    (*(void (**)(char *, uint64_t))(v102 + 8))(v127, TupleTypeMetadata2);
    uint64_t v65 = v133;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v50 + 8))(v41, v44);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v52, v48);
    uint64_t v65 = v48;
    uint64_t v63 = v125;
  }
LABEL_20:
  sub_23835FF80();
  uint64_t v79 = v141[0];
  uint64_t v80 = v135;
  uint64_t v81 = v63;
  uint64_t v82 = v112;
  sub_238360140();
  swift_beginAccess();
  sub_2383542A8((uint64_t)v142, v79 + 16);
  swift_endAccess();
  swift_release();
  sub_23835FF80();
  uint64_t v83 = v149[0];
  v84 = v109;
  sub_23834FA68(v65, MEMORY[0x263F1B730]);
  uint64_t v85 = v136;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v137 + 56))(v84, 0, 1, v136);
  uint64_t v86 = v83 + *(void *)(*(void *)v83 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v134 + 40))(v86, v84, v81);
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v110 + 16))(v111, v80, v82);
  uint64_t v87 = (uint64_t)v113;
  sub_23834FA68(v65, MEMORY[0x263F1B740]);
  uint64_t v88 = v116;
  sub_23834F12C(v87, v85, v123, v114);
  v89 = v115;
  sub_23835FF90();
  sub_2383514F8();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v89, v119);
  v90 = v128;
  sub_23835FD40();
  v91 = v122;
  sub_23835FD00();
  uint64_t v92 = *(void *)(sub_23835FCF0() + 16);
  swift_bridgeObjectRelease();
  if (!v92) {
    return (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v90, v118);
  }
  uint64_t v93 = v118;
  __swift_instantiateConcreteTypeFromMangledName(qword_268972748);
  swift_retain();
  uint64_t v94 = sub_238360150();
  swift_release();
  uint64_t v95 = v117;
  uint64_t v96 = (uint64_t)v103;
  (*(void (**)(char *, char *, uint64_t))(v117 + 16))(v103, v90, v93);
  uint64_t v97 = v104;
  sub_2383515B8(v96, (uint64_t)v91, v104);
  id v98 = v91;
  sub_23835FF80();
  sub_23834FAD0(v94, v97);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v97, v106);
  return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v128, v93);
}

uint64_t sub_2383514F8()
{
  sub_23835FE40();
  if (v3)
  {
    sub_238356A84(&v2, (uint64_t)v4);
    __swift_project_boxed_opaque_existential_1(v4, v4[3]);
    uint64_t v0 = sub_23835FC70();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_238356A28((uint64_t)&v2, qword_268972910);
    sub_238360170();
    return sub_238360160();
  }
  return v0;
}

uint64_t sub_2383515B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = sub_23835FD50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for JUComponentReloader();
  *(void *)(a3 + *(int *)(result + 36)) = a2;
  return result;
}

void *sub_2383516F0()
{
  return sub_2383541C0();
}

uint64_t sub_2383516FC(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return JetViewRepresentable.makeUIView(context:)(a1, a2, WitnessTable);
}

uint64_t sub_23835175C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return JetViewRepresentable.updateUIView(_:context:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_2383517CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static JetViewRepresentable.dismantleUIView(_:coordinator:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_238351838@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23835417C();
  *a1 = result;
  return result;
}

uint64_t sub_23835186C()
{
  return sub_23835FEC0();
}

uint64_t sub_2383518B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F01780](a1, a2, a3, WitnessTable);
}

uint64_t sub_23835192C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F01718](a1, a2, a3, WitnessTable);
}

uint64_t sub_2383519A8()
{
  return sub_238360000();
}

void sub_2383519C4()
{
}

uint64_t sub_238351A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v16;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  v8[8] = swift_getAssociatedTypeWitness();
  v8[9] = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[10] = AssociatedTypeWitness;
  v8[11] = *(void *)(AssociatedTypeWitness - 8);
  v8[12] = swift_task_alloc();
  sub_238360440();
  v8[13] = swift_task_alloc();
  uint64_t v10 = sub_238360330();
  v8[14] = v10;
  v8[15] = *(void *)(v10 - 8);
  v8[16] = swift_task_alloc();
  uint64_t v11 = sub_238360320();
  v8[17] = v11;
  v8[18] = *(void *)(v11 - 8);
  v8[19] = swift_task_alloc();
  v8[20] = sub_2383602A0();
  v8[21] = sub_238360290();
  uint64_t v13 = sub_238360280();
  v8[22] = v13;
  v8[23] = v12;
  return MEMORY[0x270FA2498](sub_238351C78, v13, v12);
}

uint64_t sub_238351C78()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  swift_checkMetadataState();
  sub_238360130();
  sub_238360300();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = sub_238360290();
  v0[24] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[25] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_238351D94;
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[13];
  uint64_t v8 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v7, v4, v8, v6);
}

uint64_t sub_238351D94()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 184);
  uint64_t v3 = *(void *)(v1 + 176);
  return MEMORY[0x270FA2498](sub_238351ED8, v3, v2);
}

uint64_t sub_238351ED8()
{
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[10];
  uint64_t v2 = v0[11];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[12], v1, v3);
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    sub_238360370();
    uint64_t v6 = sub_238360470();
    swift_bridgeObjectRelease();
    type metadata accessor for JUComponentReloader();
    sub_238352178(v6);
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_238360290();
    v0[24] = v7;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[25] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_238351D94;
    uint64_t v9 = v0[17];
    uint64_t v10 = v0[13];
    uint64_t v11 = MEMORY[0x263F8F500];
    return MEMORY[0x270FA1F68](v10, v7, v11, v9);
  }
}

uint64_t sub_238352178(uint64_t a1)
{
  uint64_t v2 = sub_23835FCF0();
  if (*(void *)(sub_2383537C4(a1, v2) + 16))
  {
    char v3 = sub_23835FCE0();
    uint64_t result = swift_release();
    if ((v3 & 1) == 0) {
      return sub_23835FD00();
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_238352244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2383602D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2383602C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_238356A28(a1, &qword_2689728D8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_238360280();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2383523F0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2383524CC;
  return v6(a1);
}

uint64_t sub_2383524CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_2383525C4(uint64_t a1)
{
  uint64_t v2 = sub_2383605A0();

  return sub_238352608(a1, v2);
}

unint64_t sub_238352608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2383526A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_2383605A0();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2383536A0(a2, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
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

uint64_t sub_2383527A0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  uint64_t v5 = sub_2383605A0();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(v4 + 48);
  if (*(void *)(v8 + 8 * v7) != a1)
  {
    uint64_t v9 = ~v6;
    do
    {
      unint64_t v7 = (v7 + 1) & v9;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        return 0;
      }
    }
    while (*(void *)(v8 + 8 * v7) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v2;
  uint64_t v14 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_238352E98();
    uint64_t v11 = v14;
  }
  uint64_t v12 = *(void *)(*(void *)(v11 + 48) + 8 * v7);
  sub_238353518(v7);
  uint64_t *v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2383528A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689728D0);
  uint64_t result = sub_238360540();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  uint64_t *v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_2383605A0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_238352B5C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_238360460();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_2383605A0();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
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
  *uint64_t v18 = v20 & v19;
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

void *sub_238352CF4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689728D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_238360530();
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_238352E98()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972908);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2383604A0();
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

uint64_t sub_238353030()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972908);
  uint64_t result = sub_2383604B0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v26 = v1;
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
    uint64_t result = sub_2383605A0();
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

uint64_t sub_238353294()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972908);
  uint64_t result = sub_2383604B0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    uint64_t v27 = v1;
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
      uint64_t result = sub_2383605A0();
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
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_238353518(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_238360460();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(v3 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v6);
        uint64_t v12 = sub_2383605A0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            int64_t v15 = (void *)(v10 + 8 * v2);
            if (v2 != v6 || (int64_t v2 = v6, v15 >= v11 + 1))
            {
              void *v15 = *v11;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
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
  uint64_t v16 = *(void *)(v3 + 16);
  BOOL v17 = __OFSUB__(v16, 1);
  uint64_t v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_2383536A0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_238353294();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_238352E98();
      goto LABEL_14;
    }
    sub_238353030();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_2383605A0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_238360580();
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

uint64_t sub_2383537C4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_23835394C((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_23835394C((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x23EC8D9C0](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_23835394C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    uint64_t v43 = 0;
    int64_t v6 = 0;
    uint64_t v40 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v49 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = a3 + 56;
    do
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
LABEL_62:
            __break(1u);
            goto LABEL_63;
          }
          if (v13 >= v49) {
            goto LABEL_60;
          }
          unint64_t v14 = *(void *)(v40 + 8 * v13);
          ++v6;
          if (!v14)
          {
            int64_t v6 = v13 + 1;
            if (v13 + 1 >= v49) {
              goto LABEL_60;
            }
            unint64_t v14 = *(void *)(v40 + 8 * v6);
            if (!v14)
            {
              int64_t v6 = v13 + 2;
              if (v13 + 2 >= v49) {
                goto LABEL_60;
              }
              unint64_t v14 = *(void *)(v40 + 8 * v6);
              if (!v14)
              {
                int64_t v15 = v13 + 3;
                if (v15 >= v49)
                {
LABEL_60:
                  swift_retain();
                  return sub_238353DF0(v42, a2, v43, a3);
                }
                unint64_t v14 = *(void *)(v40 + 8 * v15);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v6 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v6 >= v49) {
                      goto LABEL_60;
                    }
                    unint64_t v14 = *(void *)(v40 + 8 * v6);
                    ++v15;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
LABEL_63:
                  __break(1u);
                  goto LABEL_64;
                }
                int64_t v6 = v15;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          unint64_t v12 = __clz(__rbit64(v14)) + (v6 << 6);
        }
        sub_2383569CC(*(void *)(a4 + 48) + 40 * v12, (uint64_t)v47);
        v45[0] = v47[0];
        v45[1] = v47[1];
        uint64_t v46 = v48;
        uint64_t v16 = sub_238360480();
        uint64_t v17 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v18 = v16 & ~v17;
        if ((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18)) {
          break;
        }
LABEL_6:
        uint64_t result = sub_238354310((uint64_t)v45);
      }
      uint64_t v19 = ~v17;
      while (1)
      {
        sub_2383569CC(*(void *)(a3 + 48) + 40 * v18, (uint64_t)v44);
        char v20 = MEMORY[0x23EC8D510](v44, v45);
        sub_238354310((uint64_t)v44);
        if (v20) {
          break;
        }
        unint64_t v18 = (v18 + 1) & v19;
        if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
          goto LABEL_6;
        }
      }
      uint64_t result = sub_238354310((uint64_t)v45);
      *(unint64_t *)((char *)v42 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      BOOL v21 = __OFADD__(v43++, 1);
    }
    while (!v21);
    __break(1u);
  }
  uint64_t v43 = 0;
  int64_t v22 = 0;
  uint64_t v39 = a3 + 56;
  uint64_t v23 = 1 << *(unsigned char *)(a3 + 32);
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  else {
    uint64_t v24 = -1;
  }
  unint64_t v25 = v24 & *(void *)(a3 + 56);
  int64_t v41 = (unint64_t)(v23 + 63) >> 6;
  uint64_t v26 = a4 + 56;
  while (v25)
  {
    unint64_t v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    int64_t v49 = v22;
    unint64_t v28 = v27 | (v22 << 6);
LABEL_52:
    sub_2383569CC(*(void *)(a3 + 48) + 40 * v28, (uint64_t)v47);
    uint64_t v33 = sub_238360480();
    uint64_t v34 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v35 = v33 & ~v34;
    if ((*(void *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35))
    {
      uint64_t v36 = ~v34;
      while (1)
      {
        sub_2383569CC(*(void *)(a4 + 48) + 40 * v35, (uint64_t)v45);
        char v37 = MEMORY[0x23EC8D510](v45, v47);
        sub_238354310((uint64_t)v45);
        if (v37) {
          break;
        }
        unint64_t v35 = (v35 + 1) & v36;
        if (((*(void *)(v26 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0) {
          goto LABEL_35;
        }
      }
      uint64_t result = sub_238354310((uint64_t)v47);
      *(unint64_t *)((char *)v42 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      BOOL v21 = __OFADD__(v43++, 1);
      int64_t v22 = v49;
      if (v21)
      {
        __break(1u);
        goto LABEL_60;
      }
    }
    else
    {
LABEL_35:
      uint64_t result = sub_238354310((uint64_t)v47);
      int64_t v22 = v49;
    }
  }
  int64_t v29 = v22 + 1;
  if (__OFADD__(v22, 1)) {
    goto LABEL_62;
  }
  if (v29 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v29);
  int64_t v31 = v22 + 1;
  if (v30) {
    goto LABEL_51;
  }
  int64_t v31 = v22 + 2;
  if (v22 + 2 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v31);
  if (v30) {
    goto LABEL_51;
  }
  int64_t v31 = v22 + 3;
  if (v22 + 3 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v31);
  if (v30)
  {
LABEL_51:
    unint64_t v25 = (v30 - 1) & v30;
    int64_t v49 = v31;
    unint64_t v28 = __clz(__rbit64(v30)) + (v31 << 6);
    goto LABEL_52;
  }
  int64_t v32 = v22 + 4;
  if (v22 + 4 >= v41) {
    goto LABEL_60;
  }
  unint64_t v30 = *(void *)(v39 + 8 * v32);
  if (v30)
  {
    int64_t v31 = v22 + 4;
    goto LABEL_51;
  }
  while (1)
  {
    int64_t v31 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v31 >= v41) {
      goto LABEL_60;
    }
    unint64_t v30 = *(void *)(v39 + 8 * v31);
    ++v32;
    if (v30) {
      goto LABEL_51;
    }
  }
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_238353DF0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972900);
  uint64_t result = sub_2383604C0();
  uint64_t v6 = result;
  unint64_t v30 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
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
      if (v15 >= a2)
      {
LABEL_37:
        swift_release();
        return v6;
      }
      unint64_t v16 = v30[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          goto LABEL_37;
        }
        unint64_t v16 = v30[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            goto LABEL_37;
          }
          unint64_t v16 = v30[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              goto LABEL_37;
            }
            unint64_t v16 = v30[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  goto LABEL_37;
                }
                unint64_t v16 = v30[v11];
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
    sub_2383569CC(*(void *)(a4 + 48) + 40 * v14, (uint64_t)v31);
    uint64_t result = sub_238360480();
    uint64_t v18 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v12 + 8 * v20);
      }
      while (v25 == -1);
      unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(void *)(v12 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v6 + 48) + 40 * v21;
    long long v27 = v31[0];
    long long v28 = v31[1];
    *(void *)(v26 + 32) = v32;
    *(_OWORD *)uint64_t v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(void *)(v6 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      goto LABEL_37;
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

unint64_t sub_238354074(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689728D0);
  uint64_t v3 = (void *)sub_238360550();
  long long v13 = *(_OWORD *)(a1 + 32);
  unint64_t result = sub_2383525C4(*(void *)(a1 + 32));
  if (v5)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v6 = (long long *)(a1 + 48);
  uint64_t v7 = v1 - 1;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v13;
    *(void *)(v3[7] + 8 * result) = *((void *)&v13 + 1);
    uint64_t v8 = v3[2];
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9) {
      break;
    }
    v3[2] = v10;
    if (!v7) {
      goto LABEL_8;
    }
    long long v11 = *v6++;
    long long v13 = v11;
    swift_retain();
    unint64_t result = sub_2383525C4(v11);
    --v7;
    if (v12) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23835417C()
{
  type metadata accessor for JUComponentView.Coordinator();
  uint64_t v0 = swift_allocObject();
  sub_238350474();
  return v0;
}

void *sub_2383541C0()
{
  uint64_t v0 = (void *)sub_23835FD10();
  LODWORD(v1) = 1132068864;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 0, v1);
  LODWORD(v2) = 1132068864;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 0, v2);
  return v0;
}

uint64_t type metadata accessor for JUComponentReloader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_238354240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2383542A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_238354310(uint64_t a1)
{
  return a1;
}

uint64_t sub_238354364(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2383543A0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2383543BC()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_2383543C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_2383543D0()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    uint64_t result = sub_2383600C0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2383544E0(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = v9 | 7 | *(_DWORD *)(v5 + 80);
  if (v11 != 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || ((v9 + 16) & ~v9) + *(void *)(*(void *)(v7 - 8) + 64) + (v10 & ~(v9 | 7uLL)) > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    uint64_t v15 = v7;
    uint64_t v16 = ~(v9 | 7);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    uint64_t v17 = (void *)(((unint64_t)a1 + v10) & v16);
    uint64_t v18 = (void *)(((unint64_t)a2 + v10) & v16);
    *uint64_t v17 = *v18;
    unint64_t v19 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
    *unint64_t v19 = *v20;
    uint64_t v21 = ((unint64_t)v19 + v9 + 8) & ~v9;
    uint64_t v22 = ((unint64_t)v20 + v9 + 8) & ~v9;
    unint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    swift_retain();
    swift_retain();
    v23(v21, v22, v15);
  }
  return a1;
}

uint64_t sub_2383546E8(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v3)(a1, AssociatedTypeWitness);
  uint64_t v4 = *(void *)(v3 + 56);
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v9 + 80);
  swift_release();
  swift_release();
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 8);

  return v7((v6 + ((((v4 + a1 + (v6 | 7)) & ~(v6 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v6, v5);
}

uint64_t sub_238354820(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v10 | 7) + v6;
  uint64_t v12 = v11 + a1;
  long long v13 = (void *)((v11 + a2) & ~(v10 | 7));
  uint64_t v14 = (void *)(v12 & ~(v10 | 7));
  *uint64_t v14 = *v13;
  uint64_t v15 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v15 = *v16;
  uint64_t v17 = ((unint64_t)v15 + v10 + 8) & ~v10;
  uint64_t v18 = ((unint64_t)v16 + v10 + 8) & ~v10;
  swift_retain();
  swift_retain();
  v9(v17, v18, v7);
  return a1;
}

uint64_t sub_238354968(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_retain();
  swift_release();
  long long v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v13 = *v14;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  return a1;
}

uint64_t sub_238354AD0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v10 | 7) + v6;
  uint64_t v12 = v11 + a1;
  long long v13 = (void *)((v11 + a2) & ~(v10 | 7));
  uint64_t v14 = (void *)(v12 & ~(v10 | 7));
  *uint64_t v14 = *v13;
  uint64_t v15 = (void *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v15 = *v16;
  v9(((unint64_t)v15 + v10 + 8) & ~v10, ((unint64_t)v16 + v10 + 8) & ~v10, v7);
  return a1;
}

uint64_t sub_238354BF8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v9 | 7) + v6;
  uint64_t v11 = (void *)((v10 + a1) & ~(v9 | 7));
  uint64_t v12 = (void *)((v10 + a2) & ~(v9 | 7));
  *uint64_t v11 = *v12;
  swift_release();
  long long v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  return a1;
}

uint64_t sub_238354D48(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v11 = 0x7FFFFFFF;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  if (v11 <= v6) {
    unsigned int v12 = v6;
  }
  else {
    unsigned int v12 = v11;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = v10 | 7;
  uint64_t v14 = (v10 | 7) + *(void *)(v5 + 64);
  if (a2 <= v12) {
    goto LABEL_28;
  }
  uint64_t v15 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(v7 - 8) + 64) + (v14 & ~v13);
  char v16 = 8 * v15;
  if (v15 <= 3)
  {
    unsigned int v19 = ((a2 - v12 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      int v17 = *(_DWORD *)((char *)a1 + v15);
      if (!v17) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      int v17 = *(unsigned __int16 *)((char *)a1 + v15);
      if (!*(unsigned __int16 *)((char *)a1 + v15)) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_28:
      if (v6 >= v11)
      {
        uint64_t v25 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
        return v25(a1, v6, AssociatedTypeWitness);
      }
      else
      {
        unint64_t v23 = (unint64_t *)(((((unint64_t)a1 + v14) & ~v13) + 15) & 0xFFFFFFFFFFFFFFF8);
        if ((v9 & 0x80000000) != 0)
        {
          uint64_t v26 = *(uint64_t (**)(unint64_t))(v8 + 48);
          return v26(((unint64_t)v23 + v10 + 8) & ~v10);
        }
        else
        {
          unint64_t v24 = *v23;
          if (v24 >= 0xFFFFFFFF) {
            LODWORD(v24) = -1;
          }
          return (v24 + 1);
        }
      }
    }
  }
  int v17 = *((unsigned __int8 *)a1 + v15);
  if (!*((unsigned char *)a1 + v15)) {
    goto LABEL_28;
  }
LABEL_18:
  int v20 = (v17 - 1) << v16;
  if (v15 > 3) {
    int v20 = 0;
  }
  if (v15)
  {
    if (v15 <= 3) {
      int v21 = v15;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v12 + (v22 | v20) + 1;
}

void sub_238355070(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= 0x7FFFFFFF) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  if (v12 <= v8) {
    unsigned int v13 = v8;
  }
  else {
    unsigned int v13 = v12;
  }
  uint64_t v14 = (v11 | 7) + *(void *)(v7 + 64);
  size_t v15 = ((v11 + 16) & ~v11) + *(void *)(v9 + 64);
  size_t v16 = (v14 & ~(v11 | 7)) + v15;
  if (a3 <= v13)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v13 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
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
  if (v13 < a2)
  {
    unsigned int v18 = ~v13 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
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
      bzero(a1, (v14 & ~(v11 | 7)) + v15);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_62;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_62:
      __break(1u);
      JUMPOUT(0x238355498);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v8 >= v12)
        {
          uint64_t v26 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
          v26(a1, a2, v8, AssociatedTypeWitness);
        }
        else
        {
          int v22 = (unsigned char *)((unint64_t)&a1[v14] & ~(v11 | 7));
          if (v12 >= a2)
          {
            long long v27 = (void *)((unint64_t)(v22 + 15) & 0xFFFFFFFFFFFFFFF8);
            if ((v10 & 0x80000000) != 0)
            {
              int64_t v29 = *(void (**)(unint64_t, uint64_t))(v9 + 56);
              v29(((unint64_t)v27 + v11 + 8) & ~v11, a2);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v28 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v28 = (a2 - 1);
              }
              *long long v27 = v28;
            }
          }
          else
          {
            if (v15 <= 3) {
              int v23 = ~(-1 << (8 * v15));
            }
            else {
              int v23 = -1;
            }
            if (v15)
            {
              int v24 = v23 & (~v12 + a2);
              if (v15 <= 3) {
                int v25 = v15;
              }
              else {
                int v25 = 4;
              }
              bzero(v22, v15);
              switch(v25)
              {
                case 2:
                  *(_WORD *)int v22 = v24;
                  break;
                case 3:
                  *(_WORD *)int v22 = v24;
                  v22[2] = BYTE2(v24);
                  break;
                case 4:
                  *(_DWORD *)int v22 = v24;
                  break;
                default:
                  *int v22 = v24;
                  break;
              }
            }
          }
        }
      }
      return;
  }
}

uint64_t sub_2383554D4()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = sub_238360440();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for JUComponentView.Coordinator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for JUComponentView.Coordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for JUComponentView.Coordinator);
}

uint64_t sub_2383555CC()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_23835FD50();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_23835570C(char *a1, char *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *(void *)a2;
  *(void *)a1 = *(void *)a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (char *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedConformanceWitness();
    swift_bridgeObjectRetain();
    uint64_t v9 = (int *)sub_23835FD50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(&v7[v9[13]], &a2[v9[13]], AssociatedTypeWitness);
    uint64_t v10 = v9[14];
    uint64_t v11 = &v7[v10];
    unsigned int v12 = &a2[v10];
    uint64_t v13 = sub_238360190();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    *(void *)&v7[v9[15]] = *(void *)&a2[v9[15]];
    uint64_t v14 = *(int *)(a3 + 36);
    size_t v15 = *(void **)&a2[v14];
    *(void *)&v7[v14] = v15;
    swift_retain();
    id v16 = v15;
  }
  return v7;
}

void sub_238355904(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v4 = sub_23835FD50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1 + *(int *)(v4 + 52), AssociatedTypeWitness);
  uint64_t v5 = a1 + *(int *)(v4 + 56);
  uint64_t v6 = sub_238360190();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
}

char *sub_238355A80(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  swift_bridgeObjectRetain();
  uint64_t v7 = (int *)sub_23835FD50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(&a1[v7[13]], &a2[v7[13]], AssociatedTypeWitness);
  uint64_t v8 = v7[14];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_238360190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  *(void *)&a1[v7[15]] = *(void *)&a2[v7[15]];
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = *(void **)&a2[v12];
  *(void *)&a1[v12] = v13;
  swift_retain();
  id v14 = v13;
  return a1;
}

char *sub_238355C2C(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = (int *)sub_23835FD50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(&a1[v6[13]], &a2[v6[13]], AssociatedTypeWitness);
  uint64_t v7 = v6[14];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_238360190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)&a1[v6[15]] = *(void *)&a2[v6[15]];
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = *(void **)&a2[v11];
  uint64_t v13 = *(void **)&a1[v11];
  *(void *)&a1[v11] = v12;
  id v14 = v12;

  return a1;
}

char *sub_238355DF0(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = (int *)sub_23835FD50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(&a1[v6[13]], &a2[v6[13]], AssociatedTypeWitness);
  uint64_t v7 = v6[14];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_238360190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)&a1[v6[15]] = *(void *)&a2[v6[15]];
  *(void *)&a1[*(int *)(a3 + 36)] = *(void *)&a2[*(int *)(a3 + 36)];
  return a1;
}

char *sub_238355F88(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = (int *)sub_23835FD50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40))(&a1[v6[13]], &a2[v6[13]], AssociatedTypeWitness);
  uint64_t v7 = v6[14];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_238360190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)&a1[v6[15]] = *(void *)&a2[v6[15]];
  swift_release();
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = *(void **)&a1[v11];
  *(void *)&a1[v11] = *(void *)&a2[v11];

  return a1;
}

uint64_t sub_238356138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23835614C);
}

uint64_t sub_23835614C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v6 = sub_23835FD50();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_2383562A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2383562BC);
}

uint64_t sub_2383562BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_23835FD50();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
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

uint64_t sub_2383564A8()
{
  uint64_t v1 = (int *)(type metadata accessor for JUComponentReloader() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = v0 + v2;
  swift_bridgeObjectRelease();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v4 = sub_23835FD50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v3 + *(int *)(v4 + 52), AssociatedTypeWitness);
  uint64_t v5 = v3 + *(int *)(v4 + 56);
  uint64_t v6 = sub_238360190();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2383566B8(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = *(void *)(type metadata accessor for JUComponentReloader() - 8);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[8];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v7 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_2383567E8;
  return sub_238351A04(a1, v8, v9, v10, v11, v4, v5, v6);
}

uint64_t sub_2383567E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2383568DC()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_238356914(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2383567E8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2689728F0 + dword_2689728F0);
  return v6(a1, v4);
}

uint64_t sub_2383569CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_238356A28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_238356A84(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t JUDiffableDataReader.init(observing:content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t JUDiffableDataReader.body.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  int64_t v31 = a2;
  uint64_t v4 = a1[2];
  uint64_t v30 = a1[4];
  swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_238360120();
  swift_getAssociatedTypeWitness();
  uint64_t v36 = v5;
  uint64_t v37 = sub_238360120();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v39 = swift_getWitnessTable();
  sub_23835FD90();
  uint64_t v6 = sub_238360100();
  uint64_t v29 = a1[3];
  sub_23835FE10();
  uint64_t v7 = sub_23835FF70();
  uint64_t v27 = v6;
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v34 = a1[5];
  uint64_t v35 = MEMORY[0x263F1A240];
  uint64_t v24 = v34;
  uint64_t v32 = v34;
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v28 = v7;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v36 = v6;
  uint64_t v37 = v7;
  uint64_t WitnessTable = v26;
  uint64_t v39 = v25;
  uint64_t v8 = sub_23835FCA0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - v13;
  uint64_t v15 = *((void *)v2 + 2);
  long long v23 = *v2;
  uint64_t v16 = v30;
  sub_23835FD20();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = v29;
  *(void *)(v17 + 16) = v4;
  *(void *)(v17 + 24) = v18;
  uint64_t v19 = v24;
  *(void *)(v17 + 32) = v16;
  *(void *)(v17 + 40) = v19;
  *(_OWORD *)(v17 + 48) = v23;
  *(void *)(v17 + 64) = v15;
  swift_unknownObjectRetain();
  swift_retain();
  sub_23835FCB0();
  swift_getWitnessTable();
  unsigned int v20 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v20(v14, v12, v8);
  int v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v12, v8);
  v20(v31, v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v21)(v14, v8);
}

uint64_t sub_238356E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v78 = a8;
  uint64_t v74 = a4;
  v71 = a3;
  uint64_t v65 = a2;
  uint64_t v70 = a1;
  uint64_t v79 = a9;
  uint64_t v77 = *(void *)(a6 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  v62 = (char *)v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v76 = (char *)v61 - v14;
  uint64_t v15 = sub_23835FE10();
  uint64_t v68 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  unsigned int v67 = (char *)v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v66 = (char *)v61 - v18;
  swift_getAssociatedTypeWitness();
  uint64_t v19 = sub_238360120();
  uint64_t v64 = a7;
  uint64_t v63 = a5;
  swift_getAssociatedTypeWitness();
  uint64_t v20 = sub_238360120();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v22 = swift_getWitnessTable();
  v61[3] = v19;
  uint64_t v89 = v19;
  uint64_t v90 = v20;
  v61[2] = WitnessTable;
  uint64_t v91 = WitnessTable;
  uint64_t v92 = v22;
  v61[1] = v22;
  uint64_t v23 = sub_23835FD90();
  uint64_t v24 = sub_238360440();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)v61 - v27;
  uint64_t v29 = *(void *)(v23 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v26);
  uint64_t v32 = (char *)v61 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)v61 - v33;
  uint64_t v69 = a6;
  uint64_t v75 = v15;
  uint64_t v35 = sub_23835FF70();
  uint64_t v72 = *(void *)(v35 - 8);
  uint64_t v73 = v35;
  MEMORY[0x270FA5388](v35);
  uint64_t v80 = (char *)v61 - v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v70, v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v28, 1, v23) == 1)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    sub_23835FD80();
    uint64_t v37 = v76;
    uint64_t v38 = v74;
    uint64_t v39 = v71;
    v71(v32);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v23);
    uint64_t v40 = (void *)swift_allocObject();
    uint64_t v41 = v69;
    v40[2] = v63;
    v40[3] = v41;
    uint64_t v42 = v78;
    v40[4] = v64;
    v40[5] = v42;
    v40[6] = v65;
    v40[7] = v39;
    v40[8] = v38;
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v43 = (uint64_t)v67;
    sub_238360020();
    swift_release();
    (*(void (**)(char *, uint64_t))(v77 + 8))(v37, v41);
    uint64_t v87 = v42;
    uint64_t v88 = MEMORY[0x263F1A240];
    uint64_t v44 = v75;
    swift_getWitnessTable();
    uint64_t v45 = v68;
    uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
    int v47 = v66;
    v46(v66, v43, v44);
    uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v48(v43, v44);
    v46((char *)v43, (uint64_t)v47, v44);
    sub_238357838(v43, v41, v44);
    v48(v43, v44);
    v48((uint64_t)v47, v44);
  }
  else
  {
    int64_t v49 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    v61[0] = v34;
    v49(v34, v28, v23);
    uint64_t v50 = (uint64_t)v62;
    v71(v34);
    v51 = v76;
    uint64_t v52 = v77;
    v53 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 16);
    uint64_t v54 = v69;
    v53(v76, v50, v69);
    uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v55(v50, v54);
    v53((char *)v50, (uint64_t)v51, v54);
    uint64_t v42 = v78;
    uint64_t v81 = v78;
    uint64_t v82 = MEMORY[0x263F1A240];
    swift_getWitnessTable();
    sub_238357740(v50, v54);
    v55(v50, v54);
    v55((uint64_t)v51, v54);
    (*(void (**)(void, uint64_t))(v29 + 8))(v61[0], v23);
  }
  uint64_t v85 = v42;
  uint64_t v86 = MEMORY[0x263F1A240];
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v83 = v42;
  uint64_t v84 = v56;
  uint64_t v57 = v73;
  swift_getWitnessTable();
  uint64_t v58 = v72;
  v59 = v80;
  (*(void (**)(uint64_t, char *, uint64_t))(v72 + 16))(v79, v80, v57);
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v59, v57);
}

uint64_t sub_2383576AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_238356E5C(a1, *(void *)(v2 + 48), *(void (**)(void))(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_2383576C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_2383576FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_238357740(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23835FF50();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23835FF60();
}

uint64_t sub_238357838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_23835FF50();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23835FF60();
}

uint64_t sub_23835793C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_238357948()
{
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t sub_238357984(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *sub_2383579C8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
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

uint64_t sub_238357A3C(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t sub_238357A84(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_238357ACC(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for JUDiffableDataReader()
{
  return swift_getGenericMetadata();
}

uint64_t sub_238357B24()
{
  return swift_getWitnessTable();
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_238357D24()
{
  return sub_23835FD30();
}

uint64_t JUPresenterView.init(presenter:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v17 = (int *)type metadata accessor for JUPresenterView();
  uint64_t v18 = (uint64_t *)(a9 + v17[16]);
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a9 + v17[17];
  *(void *)uint64_t v19 = swift_getKeyPath();
  *(void *)(v19 + 8) = 0;
  *(_WORD *)(v19 + 16) = 0;
  uint64_t v20 = a9 + v17[18];
  *(void *)uint64_t v20 = sub_238357EC0();
  *(unsigned char *)(v20 + 8) = v21 & 1;
  *(void *)(v20 + 16) = v22;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = a5;
  v23[3] = a6;
  v23[4] = a7;
  v23[5] = a8;
  v23[6] = a10;
  v23[7] = a1;
  v23[8] = a2;
  uint64_t result = sub_23835FDC0();
  *(void *)a9 = result;
  *(void *)(a9 + 8) = v25;
  *(unsigned char *)(a9 + 16) = v26 & 1;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  return result;
}

uint64_t type metadata accessor for JUPresenterView()
{
  return swift_getGenericMetadata();
}

uint64_t sub_238357EC0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972BB8);
  sub_238360030();
  return v1;
}

uint64_t sub_238357F10(uint64_t (*a1)(void))
{
  uint64_t v2 = (void *)MEMORY[0x23EC8D670]();
  uint64_t v4 = a1();
  sub_238360220();
  swift_unknownObjectRetain();
  sub_2383601A0();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t JUPresenterView.init<A>(presenter:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a5;
  v18[3] = a6;
  v18[4] = a7;
  v18[5] = a8;
  v18[6] = a1;
  v18[7] = a2;
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a5;
  v19[3] = a7;
  v19[4] = a8;
  v19[5] = a3;
  v19[6] = a4;
  uint64_t v20 = type metadata accessor for _JUObservedPresenter();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v22 = swift_getWitnessTable();
  return JUPresenterView.init(presenter:content:)((uint64_t)sub_238358550, (uint64_t)v18, (uint64_t)sub_2383585E8, (uint64_t)v19, v20, a5, WitnessTable, v22, a9, a7);
}

uint64_t _JUObservedPresenter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_238358178(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a4 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v17 - v12;
  uint64_t v14 = swift_unknownObjectRetain();
  a2(v14);
  swift_unknownObjectRelease();
  sub_2383576C0(v11, a4, a5);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, a4);
  sub_2383576C0(v13, a4, a5);
  return ((uint64_t (*)(char *, uint64_t))v15)(v13, a4);
}

uint64_t _JUObservedPresenter.base.getter()
{
  sub_23835AD70();

  return swift_unknownObjectRetain();
}

uint64_t sub_2383582F4()
{
  return sub_23835FE70();
}

uint64_t sub_238358318(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
  MEMORY[0x270FA5388](v2 - 8);
  sub_23835C894(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2689729C8);
  return sub_23835FE80();
}

uint64_t sub_2383583B0(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 68);
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v5 = *(unsigned __int8 *)(v2 + 16);
  int v6 = *(unsigned __int8 *)(v2 + 17);
  sub_23835B694(*(void *)v2, v4, v5, *(unsigned char *)(v2 + 17));
  uint64_t v7 = sub_23835A704(v3, v4, v5 | (v6 << 8));
  sub_23835AD8C(v3, v4, v5, v6);
  return v7;
}

uint64_t sub_238358450@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_23835FE50();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_238358480(uint64_t *a1)
{
  return sub_23835FE60();
}

uint64_t sub_2383584D0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_238358508()
{
  return sub_238357F10(*(uint64_t (**)(void))(v0 + 56));
}

uint64_t sub_238358518()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_238358550()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 48);
  type metadata accessor for _JUObservedPresenter();
  uint64_t v2 = v1();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v2;
  return result;
}

uint64_t sub_2383585B0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2383585E8(uint64_t a1)
{
  return sub_238358178(a1, *(void (**)(uint64_t))(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for _JUObservedPresenter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_238358610()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972BB0);
  sub_238360040();
  return v1;
}

uint64_t sub_238358674()
{
  return sub_238360050();
}

uint64_t JUPresenterView.body.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v68 = a2;
  uint64_t v5 = sub_2383602D0();
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v67 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v65 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = *(a1 - 1);
  uint64_t v8 = *(void *)(v55 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v54 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = a1[3];
  uint64_t v56 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v74 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_23835FE10();
  uint64_t v60 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v78 = (char *)&v53 - v11;
  uint64_t v59 = sub_23835FE10();
  uint64_t v63 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v79 = (char *)&v53 - v12;
  sub_23835FDE0();
  uint64_t v62 = sub_23835FE10();
  uint64_t v64 = *(void *)(v62 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v62);
  uint64_t v58 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v61 = (char *)&v53 - v15;
  uint64_t v16 = *(void (**)(void))(v2 + 24);
  uint64_t v18 = a1[4];
  uint64_t v75 = a1[2];
  uint64_t v17 = v75;
  uint64_t v76 = v2;
  uint64_t v19 = v18;
  uint64_t v71 = v18;
  sub_23835FDD0();
  v16();
  swift_unknownObjectRelease();
  uint64_t v20 = v55;
  uint64_t v69 = *(void (**)(char *, uint64_t, void *))(v55 + 16);
  char v21 = v54;
  v69(v54, v3, a1);
  uint64_t v22 = *(unsigned __int8 *)(v20 + 80);
  uint64_t v23 = (v22 + 56) & ~v22;
  uint64_t v70 = v23 + v8;
  uint64_t v73 = v23;
  uint64_t v53 = v22 | 7;
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v17;
  uint64_t v25 = v77;
  v24[3] = v77;
  v24[4] = v19;
  uint64_t v26 = a1[6];
  uint64_t v72 = a1[5];
  v24[5] = v72;
  v24[6] = v26;
  uint64_t v27 = (char *)v24 + v23;
  uint64_t v28 = *(void (**)(char *, char *, void *))(v20 + 32);
  uint64_t v29 = v21;
  v28(v27, v21, a1);
  uint64_t v30 = v74;
  sub_238360020();
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v30, v25);
  v69(v29, v76, a1);
  uint64_t v31 = (void *)swift_allocObject();
  _OWORD v31[2] = v75;
  v31[3] = v25;
  uint64_t v32 = v72;
  v31[4] = v71;
  v31[5] = v32;
  uint64_t v33 = (char *)v31 + v73;
  v31[6] = v26;
  uint64_t v34 = v29;
  v28(v33, v29, a1);
  uint64_t v84 = v26;
  uint64_t v85 = MEMORY[0x263F1A240];
  uint64_t v74 = (char *)MEMORY[0x263F18E48];
  uint64_t v35 = v57;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v37 = v78;
  sub_23835FFF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v35);
  v69(v34, v76, a1);
  uint64_t v38 = (void *)swift_allocObject();
  uint64_t v39 = v77;
  v38[2] = v75;
  v38[3] = v39;
  uint64_t v40 = v72;
  v38[4] = v71;
  v38[5] = v40;
  uint64_t v41 = (char *)v38 + v73;
  v38[6] = v26;
  v28(v41, v34, a1);
  uint64_t v82 = WitnessTable;
  uint64_t v83 = MEMORY[0x263F1A240];
  uint64_t v42 = v59;
  uint64_t v43 = swift_getWitnessTable();
  uint64_t v44 = v65;
  sub_2383602B0();
  uint64_t v45 = v58;
  uint64_t v46 = v79;
  sub_238360010();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v44, v67);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v46, v42);
  uint64_t v47 = sub_23835C728(&qword_2689729C0, MEMORY[0x263F189F8]);
  uint64_t v80 = v43;
  uint64_t v81 = v47;
  uint64_t v48 = v62;
  uint64_t v49 = swift_getWitnessTable();
  uint64_t v50 = v61;
  sub_2383576C0(v45, v48, v49);
  v51 = *(void (**)(char *, uint64_t))(v64 + 8);
  v51(v45, v48);
  sub_2383576C0(v50, v48, v49);
  return ((uint64_t (*)(char *, uint64_t))v51)(v50, v48);
}

uint64_t sub_238358E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_23835FE00();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = a2;
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  v21[5] = a6;
  type metadata accessor for JUPresenterView();
  sub_238358610();
  if (v18)
  {
    sub_23835A4A8((uint64_t)v17);
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v17, 1, v19) == 1)
    {
      sub_238356A28((uint64_t)v17, &qword_2689729C8);
    }
    else
    {
      MEMORY[0x23EC8D120](v19);
      sub_238356A28((uint64_t)v17, &qword_2689729A8);
      sub_23835FDF0();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    sub_238358674();
  }
  sub_23835FDD0();
  sub_2383601C0();
  swift_unknownObjectRelease();
  sub_23835FDD0();
  sub_2383601B0();
  return swift_unknownObjectRelease();
}

uint64_t sub_2383590FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = sub_238360210();
  uint64_t v14 = *(void *)(v19[0] - 8);
  MEMORY[0x270FA5388](v19[0]);
  uint64_t v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = a2;
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  uint64_t v17 = type metadata accessor for JUPresenterView();
  sub_238358610();
  sub_23835A4A8((uint64_t)v13);
  sub_2383583B0(v17);
  sub_238360200();
  sub_23835FDD0();
  sub_2383601E0();
  swift_unknownObjectRelease();
  sub_23835FDD0();
  sub_2383601D0();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(char *, void))(v14 + 8))(v16, v19[0]);
}

uint64_t sub_2383592FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972AE0);
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972AE8);
  v6[11] = v8;
  v6[12] = *(void *)(v8 - 8);
  v6[13] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972AF0);
  v6[14] = v9;
  v6[15] = *(void *)(v9 - 8);
  v6[16] = swift_task_alloc();
  v6[17] = sub_2383602A0();
  v6[18] = sub_238360290();
  uint64_t v11 = sub_238360280();
  v6[19] = v11;
  v6[20] = v10;
  return MEMORY[0x270FA2498](sub_2383594C0, v11, v10);
}

uint64_t sub_2383594C0()
{
  (*(void (**)(void, void, void))(v0[12] + 104))(v0[13], *MEMORY[0x263F8F580], v0[11]);
  sub_238360340();
  sub_238360300();
  v0[21] = 0;
  uint64_t v1 = sub_238360290();
  v0[22] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[23] = v2;
  void *v2 = v0;
  v2[1] = sub_238359608;
  uint64_t v3 = v0[8];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 26, v1, v4, v3);
}

uint64_t sub_238359608()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_23835974C, v3, v2);
}

uint64_t sub_23835974C()
{
  if (*(unsigned char *)(v0 + 208) == 1)
  {
    uint64_t v2 = *(void *)(v0 + 120);
    uint64_t v1 = *(void *)(v0 + 128);
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v5 = *(void *)(v0 + 72);
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v6 = *(void *)(v0 + 64);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(void *)(v0 + 8);
    __asm { BRAA            X1, X16 }
  }
  return MEMORY[0x270FA2498](sub_23835986C, 0, 0);
}

uint64_t sub_23835986C()
{
  *(void *)(v0 + 192) = sub_238360290();
  uint64_t v2 = sub_238360280();
  return MEMORY[0x270FA2498](sub_2383598F8, v2, v1);
}

uint64_t sub_2383598F8()
{
  uint64_t v1 = v0[21];
  swift_release();
  sub_23835A130();
  v0[25] = v1;
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  return MEMORY[0x270FA2498](sub_2383599A4, v2, v3);
}

uint64_t sub_2383599A4()
{
  v0[21] = v0[25];
  uint64_t v1 = sub_238360290();
  v0[22] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[23] = v2;
  void *v2 = v0;
  v2[1] = sub_238359608;
  uint64_t v3 = v0[8];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v0 + 26, v1, v4, v3);
}

uint64_t sub_238359A74(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v1 = sub_2383600D0();
  uint64_t v28 = *(void *)(v1 - 8);
  uint64_t v29 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v25 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2383600F0();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v24 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972AF8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v22 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2383603F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23835C574();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972B08);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_238360C90;
  sub_2383603D0();
  sub_2383603E0();
  aBlock[0] = v12;
  sub_23835C728(&qword_268972B10, MEMORY[0x263F8F178]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972B18);
  sub_23835C770(&qword_268972B20, &qword_268972B18);
  sub_238360450();
  uint64_t v13 = sub_238360400();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(void *)(swift_allocObject() + 16) = v13;
  swift_unknownObjectRetain();
  uint64_t v14 = v23;
  sub_2383602E0();
  swift_getObjectType();
  uint64_t v15 = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v22, v14, v5);
  unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v16, v15, v5);
  aBlock[4] = sub_23835C6AC;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23835A024;
  aBlock[3] = &block_descriptor;
  char v18 = _Block_copy(aBlock);
  uint64_t v19 = v24;
  sub_2383600E0();
  uint64_t v20 = v25;
  sub_23835A068();
  sub_238360410();
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v29);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v27);
  swift_release();
  sub_238360430();
  return swift_unknownObjectRelease();
}

uint64_t sub_238359F5C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972BA0);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2383602F0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_23835A024(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_23835A068()
{
  return sub_238360450();
}

uint64_t sub_23835A130()
{
  return swift_unknownObjectRelease();
}

uint64_t _JUObservedPresenter.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t _JUObservedPresenter.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t _JUObservedPresenter.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_23835A220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23835FDA0();
  *a1 = result;
  return result;
}

uint64_t _JUObservedPresenter<>.viewDidLoad()(uint64_t a1)
{
  return sub_23835A364(a1, MEMORY[0x263F50C00]);
}

uint64_t _JUObservedPresenter<>.viewWillAppear()(uint64_t a1)
{
  return sub_23835A364(a1, MEMORY[0x263F50C10]);
}

uint64_t _JUObservedPresenter<>.viewDidAppear()(uint64_t a1)
{
  return sub_23835A364(a1, MEMORY[0x263F50C08]);
}

uint64_t _JUObservedPresenter<>.viewWillDisappear(forReason:)()
{
  swift_unknownObjectRetain();
  sub_2383601E0();

  return swift_unknownObjectRelease();
}

uint64_t _JUObservedPresenter<>.viewDidDisappear()(uint64_t a1)
{
  return sub_23835A364(a1, MEMORY[0x263F50C18]);
}

uint64_t _JUObservedPresenter<>.viewDidReceiveMemoryWarning()(uint64_t a1)
{
  return sub_23835A364(a1, MEMORY[0x263F50C20]);
}

uint64_t sub_23835A364(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(*(void *)v2 + 80);
  swift_unknownObjectRetain();
  a2(v5, a1);

  return swift_unknownObjectRelease();
}

uint64_t sub_23835A3E0(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidLoad()(*(void *)(a2 - 8));
}

uint64_t sub_23835A3E8(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewWillAppear()(*(void *)(a2 - 8));
}

uint64_t sub_23835A3F0(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidAppear()(*(void *)(a2 - 8));
}

uint64_t sub_23835A3F8()
{
  return _JUObservedPresenter<>.viewWillDisappear(forReason:)();
}

uint64_t sub_23835A400(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidDisappear()(*(void *)(a2 - 8));
}

uint64_t sub_23835A408(uint64_t a1, uint64_t a2)
{
  return _JUObservedPresenter<>.viewDidReceiveMemoryWarning()(*(void *)(a2 - 8));
}

uint64_t _JUObservedPresenter.description.getter()
{
  return 0;
}

uint64_t sub_23835A468()
{
  return _JUObservedPresenter.description.getter();
}

unint64_t sub_23835A48C()
{
  return 0xD000000000000032;
}

uint64_t sub_23835A4A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23835FEA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23835C894(v2, (uint64_t)v10, &qword_2689729A0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_23835C820((uint64_t)v10, a1);
  }
  os_log_type_t v12 = sub_2383603C0();
  uint64_t v13 = sub_23835FFB0();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = sub_23835A914(0xD000000000000021, 0x80000002383623B0, &v17);
    _os_log_impl(&dword_23834D000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23EC8D9C0](v15, -1, -1);
    MEMORY[0x23EC8D9C0](v14, -1, -1);
  }

  sub_23835FE90();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_23835A704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23835FEA0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 0x100) != 0)
  {
    sub_23835B6A0(a1, a2);
  }
  else
  {
    swift_retain();
    os_log_type_t v10 = sub_2383603C0();
    uint64_t v11 = sub_23835FFB0();
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      *(void *)(v12 + 4) = sub_23835A914(0xD000000000000017, 0x8000000238362390, &v16);
      _os_log_impl(&dword_23834D000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23EC8D9C0](v13, -1, -1);
      MEMORY[0x23EC8D9C0](v12, -1, -1);
    }

    sub_23835FE90();
    swift_getAtKeyPath();
    sub_23835AD8C(a1, a2, a3, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v16;
  }
  return a1;
}

unint64_t sub_23835A914(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_23835A9E8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23835C7C0((uint64_t)v12, *a3);
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
      sub_23835C7C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t sub_23835A9E8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_23835AAE8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_2383604E0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_23835AAE8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23835AB80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23835AC84(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23835AC84((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23835AB80(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_23835AC1C(v2, 0);
      uint64_t result = sub_2383604D0();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_238360250();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23835AC1C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972BA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23835AC84(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268972BA8);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23835AD70()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_23835AD7C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_unknownObjectRelease();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_23835AD8C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return sub_23835AD98(a1, a2);
  }
  else {
    return swift_release();
  }
}

uint64_t sub_23835AD98(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23835ADDC()
{
  return sub_23835AE10((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_238358E84);
}

uint64_t sub_23835ADF8()
{
  return sub_23835AE10((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2383590FC);
}

uint64_t sub_23835AE10(uint64_t (*a1)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = *(void *)(type metadata accessor for JUPresenterView() - 8);
  int64_t v8 = (char *)v1 + ((*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return a1(v8, v2, v3, v4, v5, v6);
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v1 = type metadata accessor for JUPresenterView();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  sub_23835AD7C(*(void *)v2, *(void *)(v2 + 8), *(unsigned char *)(v2 + 16));
  swift_release();
  uint64_t v3 = v2 + *(int *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 1, v4))
    {
      swift_release();
      swift_release();
      uint64_t v5 = v3 + *(int *)(v4 + 32);
      uint64_t v6 = sub_23835FE00();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  sub_23835AD8C(*(void *)(v2 + *(int *)(v1 + 68)), *(void *)(v2 + *(int *)(v1 + 68) + 8), *(unsigned __int8 *)(v2 + *(int *)(v1 + 68) + 16), *(unsigned char *)(v2 + *(int *)(v1 + 68) + 17));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23835B09C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  v1[2] = v2;
  v1[3] = v3;
  v1[4] = v4;
  v1[5] = v5;
  v1[6] = v6;
  uint64_t v7 = *(void *)(type metadata accessor for JUPresenterView() - 8);
  uint64_t v8 = (uint64_t)v0 + ((*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  int64_t v9 = (void *)swift_task_alloc();
  v1[7] = v9;
  void *v9 = v1;
  v9[1] = sub_23835B1A8;
  return sub_2383592FC(v8, v2, v3, v4, v5, v6);
}

uint64_t sub_23835B1A8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23835B29C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23835B2E8()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_23835B2F4()
{
  return swift_getWitnessTable();
}

uint64_t sub_23835B310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

void sub_23835B318()
{
  sub_23835C34C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_23835B3D0(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    uint64_t v8 = *(void *)(a2 + 8);
    char v9 = *(unsigned char *)(a2 + 16);
    sub_23835B684(*(void *)a2, v8, v9);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = v9;
    uint64_t v10 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v10;
    uint64_t v11 = a3[16];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
        memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        uint64_t v18 = v13[1];
        *uint64_t v12 = *v13;
        v12[1] = v18;
        uint64_t v19 = *(int *)(v14 + 32);
        uint64_t v33 = (char *)v13 + v19;
        uint64_t v34 = (char *)v12 + v19;
        uint64_t v20 = sub_23835FE00();
        uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
        swift_retain();
        swift_retain();
        v32(v34, v33, v20);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[17];
    uint64_t v22 = a1 + v21;
    uint64_t v23 = a2 + v21;
    uint64_t v24 = *(void *)v23;
    uint64_t v25 = *(void *)(v23 + 8);
    char v26 = *(unsigned char *)(v23 + 17);
    unsigned __int8 v27 = *(unsigned char *)(v23 + 16);
    sub_23835B694(*(void *)v23, v25, v27, v26);
    *(void *)uint64_t v22 = v24;
    *(void *)(v22 + 8) = v25;
    *(unsigned char *)(v22 + 16) = v27;
    *(unsigned char *)(v22 + 17) = v26;
    uint64_t v28 = a3[18];
    uint64_t v29 = a1 + v28;
    uint64_t v30 = a2 + v28;
    *(void *)uint64_t v29 = *(void *)v30;
    *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
    *(void *)(v29 + 16) = *(void *)(v30 + 16);
  }
  swift_retain();
  return a1;
}

uint64_t sub_23835B684(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_unknownObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_23835B694(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return sub_23835B6A0(a1, a2);
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_23835B6A0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_23835B6E0(uint64_t a1, uint64_t a2)
{
  sub_23835AD7C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
    {
      swift_release();
      swift_release();
      uint64_t v6 = v4 + *(int *)(v5 + 32);
      uint64_t v7 = sub_23835FE00();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  sub_23835AD8C(*(void *)(a1 + *(int *)(a2 + 68)), *(void *)(a1 + *(int *)(a2 + 68) + 8), *(unsigned __int8 *)(a1 + *(int *)(a2 + 68) + 16), *(unsigned char *)(a1 + *(int *)(a2 + 68) + 17));

  return swift_release();
}

uint64_t sub_23835B824(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_23835B684(*(void *)a2, v7, v8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v9;
  uint64_t v10 = a3[16];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v16 = v12[1];
      *uint64_t v11 = *v12;
      v11[1] = v16;
      uint64_t v17 = *(int *)(v13 + 32);
      uint64_t v31 = (char *)v12 + v17;
      uint64_t v32 = (char *)v11 + v17;
      uint64_t v18 = sub_23835FE00();
      uint64_t v30 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
      swift_retain();
      swift_retain();
      v30(v32, v31, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
  }
  else
  {
    *uint64_t v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[17];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)v21;
  uint64_t v23 = *(void *)(v21 + 8);
  char v24 = *(unsigned char *)(v21 + 17);
  unsigned __int8 v25 = *(unsigned char *)(v21 + 16);
  sub_23835B694(*(void *)v21, v23, v25, v24);
  *(void *)uint64_t v20 = v22;
  *(void *)(v20 + 8) = v23;
  *(unsigned char *)(v20 + 16) = v25;
  *(unsigned char *)(v20 + 17) = v24;
  uint64_t v26 = a3[18];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  *(void *)(v27 + 16) = *(void *)(v28 + 16);
  swift_retain();
  return a1;
}

uint64_t sub_23835BA8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_23835B684(*(void *)a2, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  char v11 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_23835AD7C(v9, v10, v11);
  uint64_t v12 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v12;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v13 = a3[16];
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (void *)(a2 + v13);
    sub_238356A28(a1 + v13, &qword_2689729A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
        memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        *uint64_t v14 = *v15;
        v14[1] = v15[1];
        uint64_t v19 = *(int *)(v16 + 32);
        uint64_t v38 = (char *)v15 + v19;
        uint64_t v39 = (char *)v14 + v19;
        uint64_t v20 = sub_23835FE00();
        uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
        swift_retain();
        swift_retain();
        v37(v39, v38, v20);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      }
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v21 = a3[17];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)v23;
  uint64_t v25 = *(void *)(v23 + 8);
  char v26 = *(unsigned char *)(v23 + 17);
  unsigned __int8 v27 = *(unsigned char *)(v23 + 16);
  sub_23835B694(*(void *)v23, v25, v27, v26);
  uint64_t v28 = *(void *)v22;
  uint64_t v29 = *(void *)(v22 + 8);
  char v30 = *(unsigned char *)(v22 + 17);
  *(void *)uint64_t v22 = v24;
  *(void *)(v22 + 8) = v25;
  uint64_t v31 = *(unsigned __int8 *)(v22 + 16);
  *(unsigned char *)(v22 + 16) = v27;
  *(unsigned char *)(v22 + 17) = v26;
  sub_23835AD8C(v28, v29, v31, v30);
  uint64_t v32 = a3[18];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = (uint64_t *)(a2 + v32);
  uint64_t v35 = *v34;
  *(unsigned char *)(v33 + 8) = *((unsigned char *)v34 + 8);
  *(void *)uint64_t v33 = v35;
  *(void *)(v33 + 16) = v34[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23835BD48(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[16];
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      uint64_t v13 = v8[1];
      *uint64_t v7 = *v8;
      v7[1] = v13;
      uint64_t v14 = *(int *)(v10 + 32);
      uint64_t v15 = (char *)v7 + v14;
      uint64_t v16 = (char *)v8 + v14;
      uint64_t v17 = sub_23835FE00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v18 = a3[17];
  uint64_t v19 = a3[18];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(_WORD *)(v20 + 16) = *(_WORD *)(v21 + 16);
  uint64_t v22 = a1 + v19;
  uint64_t v23 = a2 + v19;
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *(void *)(v22 + 16) = *(void *)(v23 + 16);
  return a1;
}

uint64_t sub_23835BF58(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_23835AD7C(v7, v8, v9);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v10 = a3[16];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_238356A28(a1 + v10, &qword_2689729A0);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729A8);
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
        memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        uint64_t v17 = v12[1];
        *uint64_t v11 = *v12;
        v11[1] = v17;
        uint64_t v18 = *(int *)(v14 + 32);
        uint64_t v19 = (char *)v11 + v18;
        uint64_t v20 = (char *)v12 + v18;
        uint64_t v21 = sub_23835FE00();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v22 = a3[17];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  char v25 = *(unsigned char *)(v24 + 16);
  char v26 = *(unsigned char *)(v24 + 17);
  uint64_t v27 = *(void *)v23;
  uint64_t v28 = *(void *)(v23 + 8);
  char v29 = *(unsigned char *)(v23 + 17);
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  uint64_t v30 = *(unsigned __int8 *)(v23 + 16);
  *(unsigned char *)(v23 + 16) = v25;
  *(unsigned char *)(v23 + 17) = v26;
  sub_23835AD8C(v27, v28, v30, v29);
  uint64_t v31 = a3[18];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  *(void *)uint64_t v32 = *(void *)v33;
  *(unsigned char *)(v32 + 8) = *(unsigned char *)(v33 + 8);
  *(void *)(v32 + 16) = *(void *)(v33 + 16);
  swift_release();
  return a1;
}

uint64_t sub_23835C1C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23835C1D8);
}

uint64_t sub_23835C1D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2689729D0);
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 64);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_23835C28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23835C2A0);
}

uint64_t sub_23835C2A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2689729D0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 64);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_23835C34C()
{
  if (!qword_268972A58[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689729C8);
    unint64_t v0 = sub_23835FDB0();
    if (!v1) {
      atomic_store(v0, qword_268972A58);
    }
  }
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

uint64_t sub_23835C3F0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for _JUObservedPresenter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _JUObservedPresenter);
}

uint64_t dispatch thunk of _JUObservedPresenter.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_23835C460()
{
  return swift_getWitnessTable();
}

unint64_t sub_23835C574()
{
  unint64_t result = qword_268972B00;
  if (!qword_268972B00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268972B00);
  }
  return result;
}

uint64_t sub_23835C5B4()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23835C5EC()
{
  return sub_238360420();
}

uint64_t sub_23835C618()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268972AF8);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

uint64_t sub_23835C6AC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268972AF8);

  return sub_238359F5C();
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

uint64_t sub_23835C728(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23835C770(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23835C7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23835C820(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689729C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23835C888()
{
  return MEMORY[0x270F9F768](*(void *)(v0 + 32), *(void *)(v0 + 16));
}

uint64_t sub_23835C894(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23835C8FC()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v2 = (char *)&v4 - v1;
  swift_getAssociatedConformanceWitness();
  sub_238360230();
  return sub_23835DF74((uint64_t)v2);
}

uint64_t static JUComponent.component(onSelectPerform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  swift_retain();

  return sub_23835CA48(a1, a2, a3);
}

uint64_t sub_23835CA48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v12 - v8;
  *a3 = a1;
  a3[1] = a2;
  swift_getAssociatedConformanceWitness();
  sub_238360230();
  uint64_t v10 = (char *)a3 + *(int *)(type metadata accessor for JUSelectableComponentWrapper() + 36);
  *(void *)&v10[*(int *)(sub_238360070() + 28)] = 0;
  return (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))(v10, v9, AssociatedTypeWitness);
}

uint64_t sub_23835CBA4(void *a1)
{
  return get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(a1, (void (*)(uint64_t, void, void))type metadata accessor for JUComponentWrapper);
}

uint64_t type metadata accessor for JUComponentWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23835CBE8(void *a1)
{
  return get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(a1, (void (*)(uint64_t, void, void))type metadata accessor for JUSelectableComponentWrapper);
}

uint64_t type metadata accessor for JUSelectableComponentWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23835CC2C()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = sub_238360070();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_23835CCE8(void *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  unint64_t v7 = ~(unint64_t)(v6 & 0xF8) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = ((v6 & 0xF8) + 23) & v7;
  uint64_t v9 = *(void *)(v5 + 64) + 7;
  uint64_t v10 = *a2;
  if ((v6 & 0x1000F8) != 0 || (v9 & 0xFFFFFFFFFFFFFFF8) + v8 + 8 > 0x18)
  {
    *a1 = v10;
    a1 = (void *)(v10 + v8);
  }
  else
  {
    uint64_t v12 = a2[1];
    *a1 = v10;
    a1[1] = v12;
    uint64_t v13 = ((unint64_t)a1 + 23) & v7;
    uint64_t v14 = ((unint64_t)a2 + 23) & v7;
    uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v15(v13, v14, AssociatedTypeWitness);
    *(void *)((v9 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v14) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_23835CE30(uint64_t a1)
{
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(_DWORD *)(v3 + 80) & 0xF8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))((a1 + v4 + 16) & ~v4, AssociatedTypeWitness);

  return swift_release();
}

void *sub_23835CEEC(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = v6 + 16;
  uint64_t v9 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v10 = v9 + 23;
  unint64_t v11 = (unint64_t)a1 + v9 + 23;
  unint64_t v12 = ~v9 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = v11 & v12;
  unint64_t v14 = ((unint64_t)a2 + v10) & v12;
  swift_retain();
  v7(v13, v14, AssociatedTypeWitness);
  *(void *)((*(void *)(v8 + 48) + 7 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v8 + 48) + 7 + v14) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

void *sub_23835CFD8(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v9 = v8 + 23;
  unint64_t v10 = (unint64_t)a1 + v8 + 23;
  unint64_t v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = v10 & v11;
  unint64_t v13 = ((unint64_t)a2 + v9) & v11;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24))(v10 & v11, v13, AssociatedTypeWitness);
  *(void *)((*(void *)(v7 + 40) + 7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 40) + 7 + v13) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_23835D0C8(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = v5 + 32;
  uint64_t v7 = *(_DWORD *)(v5 + 80) & 0xF8;
  uint64_t v8 = v7 + 23;
  unint64_t v9 = (unint64_t)a1 + v7 + 23;
  unint64_t v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = v9 & v10;
  unint64_t v12 = ((unint64_t)a2 + v8) & v10;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))(v9 & v10, v12, AssociatedTypeWitness);
  *(void *)((*(void *)(v6 + 32) + 7 + v11) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v6 + 32) + 7 + v12) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

_OWORD *sub_23835D194(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = v5 + 40;
  uint64_t v7 = *(_DWORD *)(v5 + 80) & 0xF8;
  uint64_t v8 = v7 + 23;
  unint64_t v9 = (unint64_t)a1 + v7 + 23;
  unint64_t v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = v9 & v10;
  unint64_t v12 = ((unint64_t)a2 + v8) & v10;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 40))(v9 & v10, v12, AssociatedTypeWitness);
  *(void *)((*(void *)(v6 + 24) + 7 + v11) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v6 + 24) + 7 + v12) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23835D274(_DWORD *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = *(_DWORD *)(v5 + 80) & 0xF8;
  uint64_t v9 = v8 | 7;
  if (v7 < a2)
  {
    unint64_t v10 = ((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8)
        + ((v8 + 23) & ~v9)
        + 8;
    uint64_t v11 = v10 & 0xFFFFFFF8;
    if ((v10 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = a2 - v7 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v10);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v10);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23835D420);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v10);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v19 = *(uint64_t (**)(unint64_t))(v5 + 48);
    return v19(((unint64_t)a1 + v9 + 16) & ~v9);
  }
  else
  {
    uint64_t v18 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v18) = -1;
    }
    return (v18 + 1);
  }
}

void sub_23835D434(void *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v10 = v9 | 7;
  size_t v11 = ((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + ((v9 + 23) & ~(v9 | 7)) + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          *((unsigned char *)a1 + v11) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)((char *)a1 + v11) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)((char *)a1 + v11) = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              uint64_t v19 = *(void (**)(unint64_t, uint64_t))(v6 + 56);
              v19(((unint64_t)a1 + v10 + 16) & ~v10, a2);
            }
            else
            {
              if ((a2 & 0x80000000) != 0)
              {
                uint64_t v18 = a2 ^ 0x80000000;
                a1[1] = 0;
              }
              else
              {
                uint64_t v18 = (a2 - 1);
              }
              *a1 = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) + ((v9 + 23) & ~(v9 | 7)) == -8) {
      unsigned int v12 = a3 - v8 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (v11) {
    int v16 = 1;
  }
  else {
    int v16 = v15;
  }
  if (v11)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v11);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      *((unsigned char *)a1 + v11) = v16;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v11) = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x23835D650);
    case 4:
      *(_DWORD *)((char *)a1 + v11) = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_23835D678()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = sub_238360070();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23835D724(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_23835D838(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);

  return swift_release();
}

uint64_t sub_23835D8CC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_23835D970(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23835DA20(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23835DAC0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23835DB68(_DWORD *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  if (v6 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    uint64_t v10 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = a2 - v7 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v9);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23835DD10);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v9);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v6 < 0x7FFFFFFE)
  {
    unint64_t v18 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v18 >= 0xFFFFFFFF) {
      LODWORD(v18) = -1;
    }
    if ((v18 + 1) >= 2) {
      return v18;
    }
    else {
      return 0;
    }
  }
  else
  {
    int v17 = *(uint64_t (**)(_DWORD *))(v5 + 48);
    return v17(a1);
  }
}

void sub_23835DD24(_DWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  if (v7 <= 0x7FFFFFFE) {
    unsigned int v9 = 2147483646;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  size_t v10 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v8 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v9 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v9 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v9)
  {
    if (((v8 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v9;
    }
    else {
      int v15 = 1;
    }
    if (((v8 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v9 + a2;
      bzero(a1, v10);
      *a1 = v16;
    }
    switch(v14)
    {
      case 1:
        *((unsigned char *)a1 + v10) = v15;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v10) = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)((char *)a1 + v10) = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      *((unsigned char *)a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)((char *)a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x23835DF34);
    case 4:
      *(_DWORD *)((char *)a1 + v10) = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFE)
        {
          unint64_t v18 = (void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
          if (a2 > 0x7FFFFFFE)
          {
            *unint64_t v18 = 0;
            *(_DWORD *)unint64_t v18 = a2 - 0x7FFFFFFF;
          }
          else
          {
            *unint64_t v18 = a2;
          }
        }
        else
        {
          int v17 = *(void (**)(_DWORD *, uint64_t))(v6 + 56);
          v17(a1, a2);
        }
      }
      return;
  }
}

uint64_t sub_23835DF5C()
{
  return sub_23835E3B0();
}

uint64_t sub_23835DF74(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - v4, a1, AssociatedTypeWitness);
  sub_238360030();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_23835E084@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = sub_2383600C0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&AssociatedTypeWitness - v3;
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&AssociatedTypeWitness - v7;
  uint64_t v9 = type metadata accessor for JUComponentView();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unsigned int v13 = (char *)&AssociatedTypeWitness - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int v15 = (char *)&AssociatedTypeWitness - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v20, v5);
  sub_238360070();
  sub_238360060();
  JUComponentView.init(presenting:for:with:)((uint64_t)v8, (uint64_t)v4, (uint64_t)v13);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_2383576C0(v13, v9, WitnessTable);
  int v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  sub_2383576C0(v15, v9, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, v9);
}

uint64_t sub_23835E334(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F876B0](a1, WitnessTable);
}

uint64_t sub_23835E398()
{
  return sub_23835E3B0();
}

uint64_t sub_23835E3B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23835E404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v49 = a3;
  uint64_t v4 = sub_23835FE30();
  uint64_t v37 = v4;
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v46 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v39 = *(void *)(a2 + 24);
  uint64_t v43 = type metadata accessor for JUComponentView();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v10 = sub_238360090();
  uint64_t v45 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v38 = (char *)&v32 - v11;
  uint64_t v12 = swift_getWitnessTable();
  uint64_t v36 = v12;
  uint64_t v35 = sub_23835EE4C(&qword_268972D88, MEMORY[0x263F18FD0]);
  uint64_t v54 = v10;
  uint64_t v55 = v4;
  uint64_t v56 = v12;
  uint64_t v57 = v35;
  uint64_t v40 = MEMORY[0x263F1A938];
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v41 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v33 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v34 = (char *)&v32 - v16;
  uint64_t v17 = v7;
  uint64_t v18 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v44, a2);
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v39;
  *(void *)(v20 + 16) = v9;
  *(void *)(v20 + 24) = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v20 + v19, (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  uint64_t v50 = v9;
  uint64_t v51 = v21;
  uint64_t v52 = v47;
  uint64_t v53 = v18;
  uint64_t v22 = v38;
  sub_238360080();
  uint64_t v23 = v46;
  sub_23835FE20();
  uint64_t v24 = v33;
  uint64_t v25 = v37;
  uint64_t v26 = v36;
  uint64_t v27 = v35;
  sub_23835FFE0();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v23, v25);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v22, v10);
  uint64_t v54 = v10;
  uint64_t v55 = v25;
  uint64_t v56 = v26;
  uint64_t v57 = v27;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  char v29 = v34;
  sub_2383576C0(v24, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v41 + 8);
  v30(v24, OpaqueTypeMetadata2);
  sub_2383576C0(v29, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v30)(v29, OpaqueTypeMetadata2);
}

uint64_t sub_23835E904(void (**a1)(char *))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v4 = (char *)&v7 - v3;
  uint64_t v5 = *a1;
  type metadata accessor for JUSelectableComponentWrapper();
  sub_238360070();
  sub_238360040();
  v5(v4);
  return sub_238360050();
}

uint64_t sub_23835EA00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = sub_2383600C0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&AssociatedTypeWitness - v4;
  uint64_t v6 = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&AssociatedTypeWitness - v8;
  uint64_t v10 = type metadata accessor for JUComponentView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&AssociatedTypeWitness - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&AssociatedTypeWitness - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v21, v6);
  type metadata accessor for JUSelectableComponentWrapper();
  sub_238360070();
  sub_238360060();
  JUComponentView.init(presenting:for:with:)((uint64_t)v9, (uint64_t)v5, (uint64_t)v14);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_2383576C0(v14, v10, WitnessTable);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v14, v10);
  sub_2383576C0(v16, v10, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v10);
}

uint64_t sub_23835ECC4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F876B0](a1, WitnessTable);
}

uint64_t sub_23835ED28()
{
  return swift_getWitnessTable();
}

uint64_t sub_23835ED44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23835ED88()
{
  return sub_23835EE4C(&qword_268972D80, MEMORY[0x263F88218]);
}

uint64_t sub_23835EDD0()
{
  return swift_getWitnessTable();
}

uint64_t sub_23835EDEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23835EE30()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23835EE4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23835EE94()
{
  unint64_t v1 = (int *)(type metadata accessor for JUSelectableComponentWrapper() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_release();
  uint64_t v3 = v2 + v1[11];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v3, AssociatedTypeWitness);
  sub_238360070();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23835EFD0()
{
  uint64_t v1 = *(void *)(type metadata accessor for JUSelectableComponentWrapper() - 8);
  uint64_t v2 = (void (**)(char *))(v0
                                    + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  return sub_23835E904(v2);
}

uint64_t sub_23835F054@<X0>(uint64_t a1@<X8>)
{
  return sub_23835EA00(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_23835F060(void *a1)
{
  return get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(a1, (void (*)(uint64_t, void, void))type metadata accessor for JUComponentView);
}

uint64_t get_witness_table_5JetUI11JUComponentRzl01_ab6_SwiftB00C7Wrapper33_149180D85663AE4EE2CA26AC2F643FEFLLVyxG01_a7Engine_dB09ComponentHPyHCTm(void *a1, void (*a2)(uint64_t, void, void))
{
  a2(255, *a1, a1[1]);

  return swift_getWitnessTable();
}

uint64_t sub_23835F0D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t JetViewRepresentable.makeUIView(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t JetViewRepresentable.updateUIView(_:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t static JetViewRepresentable.dismantleUIView(_:coordinator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of JetViewRepresentable.makeView(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of JetViewRepresentable.updateView(_:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of static JetViewRepresentable.dismantleView(_:coordinator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t ShelfCollection.init<A>(shelvesOf:spacing:content:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_238360120();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268972D90);
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v34 = sub_23835F490();
  uint64_t v14 = sub_23835FD90();
  uint64_t v31 = sub_23835FD70();
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v29 = a8;
  uint64_t v30 = a9;
  uint64_t v23 = a6;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = sub_238360270();
  uint64_t v16 = swift_getWitnessTable();
  uint64_t v18 = sub_23835F540((void (*)(char *, char *))sub_23835FC1C, (uint64_t)v22, v15, a7, MEMORY[0x263F8E628], v16, MEMORY[0x263F8E658], v17);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v31 = v18;
  unint64_t v19 = (void *)swift_allocObject();
  v19[2] = a6;
  v19[3] = a7;
  v19[4] = a8;
  v19[5] = a9;
  void v19[6] = a4;
  v19[7] = a5;
  sub_238360270();
  swift_getWitnessTable();
  sub_23835FC90();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
}

unint64_t sub_23835F490()
{
  unint64_t result = qword_268972D98;
  if (!qword_268972D98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268972D90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268972D98);
  }
  return result;
}

uint64_t sub_23835F4EC()
{
  return sub_238360110();
}

uint64_t sub_23835F528()
{
  return 32;
}

__n128 sub_23835F534(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_23835F540(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_238360390();
  if (!v18) {
    return sub_238360260();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_238360510();
  uint64_t v32 = sub_238360520();
  sub_2383604F0();
  uint64_t v36 = v8;
  uint64_t result = sub_238360380();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v34 = (void (**)(char *))(v33 + 2);
    uint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_2383603B0();
      uint64_t v22 = v12;
      uint64_t v23 = v12;
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
      sub_238360500();
      sub_2383603A0();
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

uint64_t sub_23835F940()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23835F978(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 48))(*a1);
}

uint64_t ShelfCollection.init<A, B>(shelvesOf:spacing:shelfContent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_238360120();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268972D90);
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v31 = sub_23835F490();
  uint64_t v13 = sub_23835FD90();
  uint64_t v28 = sub_23835FD70();
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  uint64_t v26 = a8;
  uint64_t v27 = a9;
  uint64_t v20 = a7;
  uint64_t v21 = a8;
  uint64_t v22 = a9;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v14 = sub_238360270();
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v17 = sub_23835F540((void (*)(char *, char *))sub_23835FBF0, (uint64_t)v19, v14, a6, MEMORY[0x263F8E628], v15, MEMORY[0x263F8E658], v16);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v28 = v17;
  sub_238360270();
  swift_getWitnessTable();
  sub_23835FC80();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
}

uint64_t sub_23835FB9C()
{
  return sub_238360110();
}

uint64_t sub_23835FBD8()
{
  return 32;
}

__n128 sub_23835FBE4(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_23835FBF0()
{
  return swift_getAtKeyPath();
}

uint64_t sub_23835FC1C()
{
  return sub_23835FBF0();
}

uint64_t View.visualizeMetrics(isOn:)@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_23835FC68(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_23835FC70()
{
  return MEMORY[0x270F87580]();
}

uint64_t sub_23835FC80()
{
  return MEMORY[0x270F875A8]();
}

uint64_t sub_23835FC90()
{
  return MEMORY[0x270F875B0]();
}

uint64_t sub_23835FCA0()
{
  return MEMORY[0x270F87690]();
}

uint64_t sub_23835FCB0()
{
  return MEMORY[0x270F87698]();
}

uint64_t sub_23835FCC0()
{
  return MEMORY[0x270F876A8]();
}

uint64_t sub_23835FCE0()
{
  return MEMORY[0x270F467D0]();
}

uint64_t sub_23835FCF0()
{
  return MEMORY[0x270F467D8]();
}

uint64_t sub_23835FD00()
{
  return MEMORY[0x270F467E0]();
}

uint64_t sub_23835FD10()
{
  return MEMORY[0x270F467E8]();
}

uint64_t sub_23835FD20()
{
  return MEMORY[0x270F467F8]();
}

uint64_t sub_23835FD30()
{
  return MEMORY[0x270F46800]();
}

uint64_t sub_23835FD40()
{
  return MEMORY[0x270F46828]();
}

uint64_t sub_23835FD50()
{
  return MEMORY[0x270F46830]();
}

uint64_t sub_23835FD60()
{
  return MEMORY[0x270F46838]();
}

uint64_t sub_23835FD70()
{
  return MEMORY[0x270F82028]();
}

uint64_t sub_23835FD80()
{
  return MEMORY[0x270F82058]();
}

uint64_t sub_23835FD90()
{
  return MEMORY[0x270F82068]();
}

uint64_t sub_23835FDA0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_23835FDB0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_23835FDC0()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_23835FDD0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_23835FDE0()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_23835FDF0()
{
  return MEMORY[0x270EFFB30]();
}

uint64_t sub_23835FE00()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_23835FE10()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_23835FE20()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_23835FE30()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_23835FE40()
{
  return MEMORY[0x270F876E0]();
}

uint64_t sub_23835FE50()
{
  return MEMORY[0x270F87700]();
}

uint64_t sub_23835FE60()
{
  return MEMORY[0x270F87708]();
}

uint64_t sub_23835FE70()
{
  return MEMORY[0x270F87710]();
}

uint64_t sub_23835FE80()
{
  return MEMORY[0x270F87718]();
}

uint64_t sub_23835FE90()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_23835FEA0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_23835FEB0()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_23835FEC0()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_23835FEE0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_23835FEF0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_23835FF00()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_23835FF10()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_23835FF20()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_23835FF30()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_23835FF50()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_23835FF60()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_23835FF70()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_23835FF80()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_23835FF90()
{
  return MEMORY[0x270F02420]();
}

uint64_t sub_23835FFA0()
{
  return MEMORY[0x270F02438]();
}

uint64_t sub_23835FFB0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23835FFC0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23835FFD0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23835FFE0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_23835FFF0()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_238360000()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_238360010()
{
  return MEMORY[0x270F03F30]();
}

uint64_t sub_238360020()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_238360030()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_238360040()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_238360050()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_238360060()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_238360070()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_238360080()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_238360090()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_2383600A0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2383600B0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2383600C0()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2383600D0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2383600E0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2383600F0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_238360100()
{
  return MEMORY[0x270F45040]();
}

uint64_t sub_238360110()
{
  return MEMORY[0x270F45430]();
}

uint64_t sub_238360120()
{
  return MEMORY[0x270F45448]();
}

uint64_t sub_238360130()
{
  return MEMORY[0x270F45468]();
}

uint64_t sub_238360140()
{
  return MEMORY[0x270F45618]();
}

uint64_t sub_238360150()
{
  return MEMORY[0x270F45710]();
}

uint64_t sub_238360160()
{
  return MEMORY[0x270F45768]();
}

uint64_t sub_238360170()
{
  return MEMORY[0x270F457B0]();
}

uint64_t sub_238360180()
{
  return MEMORY[0x270F45A88]();
}

uint64_t sub_238360190()
{
  return MEMORY[0x270F45A90]();
}

uint64_t sub_2383601A0()
{
  return MEMORY[0x270F45F98]();
}

uint64_t sub_2383601B0()
{
  return MEMORY[0x270F45FA0]();
}

uint64_t sub_2383601C0()
{
  return MEMORY[0x270F45FA8]();
}

uint64_t sub_2383601D0()
{
  return MEMORY[0x270F45FB0]();
}

uint64_t sub_2383601E0()
{
  return MEMORY[0x270F45FB8]();
}

uint64_t sub_2383601F0()
{
  return MEMORY[0x270F45FC0]();
}

uint64_t sub_238360200()
{
  return MEMORY[0x270F87798]();
}

uint64_t sub_238360210()
{
  return MEMORY[0x270F45FE0]();
}

uint64_t sub_238360220()
{
  return MEMORY[0x270F46598]();
}

uint64_t sub_238360230()
{
  return MEMORY[0x270F46640]();
}

uint64_t sub_238360240()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_238360250()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_238360260()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_238360270()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_238360280()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_238360290()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2383602A0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2383602B0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2383602C0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2383602D0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2383602E0()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_2383602F0()
{
  return MEMORY[0x270FA1F40]();
}

uint64_t sub_238360300()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_238360320()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_238360330()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_238360340()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_238360350()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_238360360()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_238360370()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_238360380()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_238360390()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2383603A0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2383603B0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2383603C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2383603D0()
{
  return MEMORY[0x270FA0E58]();
}

uint64_t sub_2383603E0()
{
  return MEMORY[0x270FA0E60]();
}

uint64_t sub_2383603F0()
{
  return MEMORY[0x270FA0E70]();
}

uint64_t sub_238360400()
{
  return MEMORY[0x270FA0E80]();
}

uint64_t sub_238360410()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_238360420()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_238360430()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_238360440()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_238360450()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_238360460()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_238360470()
{
  return MEMORY[0x270F9E8A0]();
}

uint64_t sub_238360480()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_238360490()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2383604A0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2383604B0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2383604C0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2383604D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2383604E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2383604F0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_238360500()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_238360510()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_238360520()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_238360530()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_238360540()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_238360550()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_238360570()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_238360580()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_238360590()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2383605A0()
{
  return MEMORY[0x270F9FC40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
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