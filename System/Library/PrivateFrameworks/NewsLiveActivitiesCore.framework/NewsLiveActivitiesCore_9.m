uint64_t sub_257B2485C@<X0>(uint64_t *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  char v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  void v43[2];
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v54 = a5;
  v52 = *(void *)a4;
  v9 = *(void *)(a4 + 8);
  v48 = *(void *)(a4 + 16);
  v49 = v9;
  v47 = *(void *)(a4 + 24);
  LODWORD(v9) = *(unsigned __int8 *)(a4 + 32);
  v46 = *(unsigned __int8 *)(a4 + 33);
  v10 = *(unsigned __int8 *)(a4 + 34);
  v44 = v9;
  v45 = v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035EB0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ElectionEntityTheme();
  v15 = *(void *)(v14 - 8);
  v16 = MEMORY[0x270FA5388](v14);
  v18 = (void *)((char *)v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v16);
  v53 = (uint64_t)v43 - v19;
  v21 = *a1;
  v20 = a1[1];
  v50 = a1[2];
  v51 = *a2;
  v22 = *(void *)(a3 + 16);
  if (v22)
  {
    v23 = a3;
    v24 = a3 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v25 = *(void *)(v15 + 72);
    v43[1] = v23;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_257938AD0(v24, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ElectionEntityTheme);
      v26 = *v18 == v21 && v18[1] == v20;
      if (v26 || (sub_257B45BA0() & 1) != 0) {
        break;
      }
      sub_257B24EFC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ElectionEntityTheme);
      v24 += v25;
      if (!--v22)
      {
        v27 = 1;
        goto LABEL_11;
      }
    }
    sub_257B25338((uint64_t)v18, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ElectionEntityTheme);
    v27 = 0;
LABEL_11:
    v28 = v52;
  }
  else
  {
    swift_bridgeObjectRetain();
    v27 = 1;
    v28 = v52;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v27, 1, v14);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_2577270D4((uint64_t)v13, &qword_26A035EB0);
    if (qword_26A030AE0 != -1) {
      swift_once();
    }
    v29 = sub_257B44090();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A031210);
    swift_bridgeObjectRetain_n();
    v30 = sub_257B44070();
    v31 = sub_257B455A0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v56 = v33;
      *(_DWORD *)v32 = 136446210;
      swift_bridgeObjectRetain();
      v55 = sub_257AC6C6C(v21, v20, &v56);
      sub_257B45660();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_257719000, v30, v31, "Couldn't find entity in attributes with id: %{public}s.", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2BE1A0](v33, -1, -1);
      MEMORY[0x25A2BE1A0](v32, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v39 = type metadata accessor for PresidentialElectionData.Entity(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v54, 1, 1, v39);
  }
  else
  {
    sub_257B25338((uint64_t)v13, v53, (uint64_t (*)(void))type metadata accessor for ElectionEntityTheme);
    v34 = v51;
    if (v51 > 1)
    {
      v28 = 0;
      v36 = 0;
      v37 = 0;
      v38 = 0;
      v35 = 0;
    }
    else
    {
      v35 = v44 & 1 | (v46 << 8) | (v45 << 16);
      sub_257B253A0(a4);
      v37 = v48;
      v36 = v49;
      v38 = v47;
    }
    v41 = type metadata accessor for PresidentialElectionData.Entity(0);
    v42 = v54;
    sub_257B25338(v53, v54 + *(int *)(v41 + 28), (uint64_t (*)(void))type metadata accessor for ElectionEntityTheme);
    *(void *)v42 = v50;
    *(void *)(v42 + 8) = v28;
    *(void *)(v42 + 16) = v36;
    *(void *)(v42 + 24) = v37;
    *(void *)(v42 + 32) = v38;
    *(unsigned char *)(v42 + 42) = BYTE2(v35);
    *(_WORD *)(v42 + 40) = v35;
    *(unsigned char *)(v42 + 43) = v34;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v42, 0, 1, v41);
  }
}

uint64_t PoliticalPartyCode.visualOrdering.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  BOOL v3 = v1 == 7169348 && v2 == 0xE300000000000000;
  if (v3 || (sub_257B45BA0() & 1) != 0) {
    return -1;
  }
  if (v1 == 5263175 && v2 == 0xE300000000000000) {
    return 1;
  }
  return sub_257B45BA0() & 1;
}

uint64_t sub_257B24E48@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  BOOL v5 = *(void *)result == 7169348 && v4 == 0xE300000000000000;
  if (v5 || (result = sub_257B45BA0(), (result & 1) != 0))
  {
    uint64_t v6 = -1;
  }
  else if (v3 == 5263175 && v4 == 0xE300000000000000)
  {
    uint64_t v6 = 1;
  }
  else
  {
    result = sub_257B45BA0();
    uint64_t v6 = result & 1;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_257B24EFC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_257B24F5C@<X0>(uint64_t *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_257B2485C(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 48), a3);
}

uint64_t sub_257B24F6C(uint64_t *a1, void (*a2)(void, void))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035F20);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for PresidentialElectionData.Entity(0);
  uint64_t v7 = MEMORY[0x270FA5388](v41);
  uint64_t v40 = (uint64_t)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v35 = (uint64_t)v32 - v10;
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v14 = a1[2];
  unint64_t v13 = a1[3];
  uint64_t v15 = a1[4];
  char v45 = 0;
  int64_t v16 = v13 >> 1;
  v32[1] = v11;
  if (v14 == v13 >> 1)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v17 = MEMORY[0x263F8EE78];
LABEL_3:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return v17;
  }
  else
  {
    v37 = &v44;
    uint64_t v38 = v15 + 32;
    uint64_t v33 = v9;
    v19 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    if (v14 <= v16) {
      unint64_t v20 = v13 >> 1;
    }
    else {
      unint64_t v20 = v14;
    }
    uint64_t v39 = v20 - v14;
    swift_unknownObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v21 = 0;
    uint64_t v36 = ~v14 + v16;
    uint64_t v22 = v12 + 32 * v14 + 16;
    unint64_t v17 = MEMORY[0x263F8EE78];
    v34 = a2;
    while (v39 != v21)
    {
      unint64_t v23 = *(void *)(v15 + 16);
      if (v21 == v23) {
        goto LABEL_3;
      }
      if (v21 >= v23) {
        goto LABEL_22;
      }
      uint64_t v24 = *(void *)(v22 - 8);
      uint64_t v25 = *(void *)v22;
      char v26 = *(unsigned char *)(v38 + v21);
      char v27 = *(unsigned char *)(v22 + 8);
      v42[0] = *(void *)(v22 - 16);
      v42[1] = v24;
      v42[2] = v25;
      char v43 = v27;
      char v44 = v26;
      swift_bridgeObjectRetain();
      a2(v42, v37);
      swift_bridgeObjectRelease();
      if ((*v19)(v6, 1, v41) == 1)
      {
        uint64_t result = sub_2577270D4((uint64_t)v6, &qword_26A035F20);
        char v28 = 0;
      }
      else
      {
        uint64_t v29 = v35;
        sub_257B25338((uint64_t)v6, v35, type metadata accessor for PresidentialElectionData.Entity);
        sub_257B25338(v29, v40, type metadata accessor for PresidentialElectionData.Entity);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v17 = sub_257942780(0, *(void *)(v17 + 16) + 1, 1, v17);
        }
        unint64_t v31 = *(void *)(v17 + 16);
        unint64_t v30 = *(void *)(v17 + 24);
        if (v31 >= v30 >> 1) {
          unint64_t v17 = sub_257942780(v30 > 1, v31 + 1, 1, v17);
        }
        *(void *)(v17 + 16) = v31 + 1;
        uint64_t result = sub_257B25338(v40, v17+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v31, type metadata accessor for PresidentialElectionData.Entity);
        char v28 = v45;
        a2 = v34;
      }
      if (v36 != v21)
      {
        v22 += 32;
        ++v21;
        if ((v28 & 1) == 0) {
          continue;
        }
      }
      goto LABEL_3;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  return result;
}

uint64_t sub_257B252E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_257B25338(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_257B253A0(uint64_t a1)
{
  return a1;
}

void *ActivityFlexibleUpdateTheme.init(leadingGraphic:leadingKicker:trailingKicker:headline:body:caption:trailingGraphic:)(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  sub_257727130(v1, (uint64_t)v17, &qword_26A0321F0);
  sub_257727130(v13, (uint64_t)v18, &qword_26A030FE0);
  sub_257727130(v11, (uint64_t)v19, &qword_26A030FE0);
  sub_257727130(v9, (uint64_t)v20, &qword_26A030FE0);
  sub_257727130(v7, (uint64_t)v21, &qword_26A030FE0);
  sub_257727130(v5, (uint64_t)v22, &qword_26A030FE0);
  sub_257727130(v3, (uint64_t)v23, &qword_26A0321F0);
  sub_257727130((uint64_t)v17, (uint64_t)__src, &qword_26A0321F0);
  sub_257727130((uint64_t)v18, (uint64_t)&__src[704], &qword_26A030FE0);
  sub_257727130((uint64_t)v19, (uint64_t)&__src[904], &qword_26A030FE0);
  sub_257727130((uint64_t)v20, (uint64_t)&__src[1104], &qword_26A030FE0);
  sub_257727130((uint64_t)v21, (uint64_t)&__src[1304], &qword_26A030FE0);
  sub_257727130((uint64_t)v22, (uint64_t)&__src[1504], &qword_26A030FE0);
  sub_257727130((uint64_t)v23, (uint64_t)&__src[1704], &qword_26A0321F0);
  return memcpy(v15, __src, 0x968uLL);
}

uint64_t ActivityFlexibleUpdate.Graphic.init(asset:size:badge:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char v7 = *a2;
  uint64_t v8 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v9 = a4 + *(int *)(v8 + 24);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_257727130(a1, a4, (uint64_t *)&unk_26B2DD028);
  *(unsigned char *)(a4 + *(int *)(v8 + 20)) = v7;
  return sub_257AD1A88(a3, v9, &qword_26A031028);
}

uint64_t type metadata accessor for ActivityFlexibleUpdate.Graphic(uint64_t a1)
{
  return sub_2577D3074(a1, qword_26B2DC190);
}

uint64_t ActivityFlexibleUpdate.init(leadingGraphic:leadingKicker:trailingKicker:headline:body:caption:trailingGraphic:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(a9, 1, 1, v14);
  int64_t v16 = (int *)type metadata accessor for ActivityFlexibleUpdate(0);
  unint64_t v17 = (void *)(a9 + v16[5]);
  *unint64_t v17 = 0;
  v17[1] = 0;
  v18 = (void *)(a9 + v16[6]);
  void *v18 = 0;
  v18[1] = 0;
  v19 = (void *)(a9 + v16[7]);
  void *v19 = 0;
  v19[1] = 0;
  unint64_t v20 = (void *)(a9 + v16[8]);
  *unint64_t v20 = 0;
  v20[1] = 0;
  unint64_t v21 = (void *)(a9 + v16[9]);
  *unint64_t v21 = 0;
  v21[1] = 0;
  uint64_t v22 = a9 + v16[10];
  v15(v22, 1, 1, v14);
  sub_257AD1A88(a1, a9, &qword_26A032BE8);
  swift_bridgeObjectRelease();
  *unint64_t v17 = a2;
  v17[1] = a3;
  swift_bridgeObjectRelease();
  void *v18 = a4;
  v18[1] = a5;
  swift_bridgeObjectRelease();
  void *v19 = a6;
  v19[1] = a7;
  swift_bridgeObjectRelease();
  *unint64_t v20 = a8;
  v20[1] = a10;
  swift_bridgeObjectRelease();
  *unint64_t v21 = a11;
  v21[1] = a12;
  return sub_257AD1A88(a13, v22, &qword_26A032BE8);
}

uint64_t type metadata accessor for ActivityFlexibleUpdate(uint64_t a1)
{
  return sub_2577D3074(a1, qword_26B2DC230);
}

void *ActivityFlexibleUpdateTheme.Graphic.init(asset:badge:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_257727130(a1, (uint64_t)v6, &qword_26A0321F8);
  sub_257727130(a2, (uint64_t)v7, &qword_26A0321F8);
  sub_257727130((uint64_t)v6, (uint64_t)__src, &qword_26A0321F8);
  sub_257727130((uint64_t)v7, (uint64_t)&__src[352], &qword_26A0321F8);
  return memcpy(a3, __src, 0x2C0uLL);
}

double ActivityFlexibleUpdate.GraphicSize.pointSize.getter()
{
  return dbl_257B59698[*v0];
}

uint64_t ActivityFlexibleUpdate.leadingGraphic.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2577263B4(v1, a1, &qword_26A032BE8);
}

uint64_t ActivityFlexibleUpdate.leadingGraphic.setter(uint64_t a1)
{
  return sub_257AD1A88(a1, v1, &qword_26A032BE8);
}

uint64_t (*ActivityFlexibleUpdate.leadingGraphic.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.leadingKicker.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityFlexibleUpdate.leadingKicker.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ActivityFlexibleUpdate.leadingKicker.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.trailingKicker.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityFlexibleUpdate.trailingKicker.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ActivityFlexibleUpdate.trailingKicker.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.headline.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityFlexibleUpdate.headline.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ActivityFlexibleUpdate.headline.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.body.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityFlexibleUpdate.body.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ActivityFlexibleUpdate.body.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.caption.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityFlexibleUpdate.caption.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActivityFlexibleUpdate(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ActivityFlexibleUpdate.caption.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.trailingGraphic.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ActivityFlexibleUpdate(0);
  return sub_2577263B4(v1 + *(int *)(v3 + 40), a1, &qword_26A032BE8);
}

uint64_t ActivityFlexibleUpdate.trailingGraphic.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ActivityFlexibleUpdate(0);
  return sub_257AD1A88(a1, v1 + *(int *)(v3 + 40), &qword_26A032BE8);
}

uint64_t (*ActivityFlexibleUpdate.trailingGraphic.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.hash(into:)(uint64_t a1)
{
  sub_257910A54(a1);
  uint64_t v3 = (int *)type metadata accessor for ActivityFlexibleUpdate(0);
  if (*(void *)(v1 + v3[5] + 8))
  {
    sub_257B45D10();
    swift_bridgeObjectRetain();
    sub_257B45180();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_257B45D10();
  }
  if (*(void *)(v1 + v3[6] + 8))
  {
    sub_257B45D10();
    swift_bridgeObjectRetain();
    sub_257B45180();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_257B45D10();
  }
  if (*(void *)(v1 + v3[7] + 8))
  {
    sub_257B45D10();
    swift_bridgeObjectRetain();
    sub_257B45180();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_257B45D10();
  }
  if (*(void *)(v1 + v3[8] + 8))
  {
    sub_257B45D10();
    swift_bridgeObjectRetain();
    sub_257B45180();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_257B45D10();
  }
  if (*(void *)(v1 + v3[9] + 8))
  {
    sub_257B45D10();
    swift_bridgeObjectRetain();
    sub_257B45180();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_257B45D10();
  }
  return sub_257910A54(a1);
}

uint64_t ActivityFlexibleUpdate.hashValue.getter()
{
  sub_257B45CF0();
  ActivityFlexibleUpdate.hash(into:)((uint64_t)v1);
  return sub_257B45D40();
}

uint64_t sub_257B26034()
{
  sub_257B45CF0();
  ActivityFlexibleUpdate.hash(into:)((uint64_t)v1);
  return sub_257B45D40();
}

uint64_t sub_257B26078()
{
  sub_257B45CF0();
  ActivityFlexibleUpdate.hash(into:)((uint64_t)v1);
  return sub_257B45D40();
}

uint64_t ActivityFlexibleUpdateTheme.leadingGraphic.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1, (uint64_t)v4, &qword_26A0321F0);
  sub_257727130((uint64_t)v4, a1, &qword_26A0321F0);
  return sub_257B2BBA0(v4, sub_2578D3DCC);
}

uint64_t ActivityFlexibleUpdateTheme.leadingGraphic.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v3, &qword_26A0321F0);
  sub_257727130(v1, (uint64_t)v4, &qword_26A0321F0);
  sub_257B2BBA0(v4, sub_2578D6E98);
  return sub_257727130((uint64_t)v3, v1, &qword_26A0321F0);
}

uint64_t (*ActivityFlexibleUpdateTheme.leadingGraphic.modify())(void, void)
{
  return nullsub_1;
}

void *ActivityFlexibleUpdateTheme.leadingKicker.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1 + 704, (uint64_t)v4, &qword_26A030FE0);
  sub_257727130((uint64_t)v4, a1, &qword_26A030FE0);
  return sub_25779AC48(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
}

uint64_t ActivityFlexibleUpdateTheme.leadingKicker.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v4, &qword_26A030FE0);
  uint64_t v2 = v1 + 704;
  sub_257727130(v2, (uint64_t)v5, &qword_26A030FE0);
  sub_25779AC48(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  return sub_257727130((uint64_t)v4, v2, &qword_26A030FE0);
}

uint64_t (*ActivityFlexibleUpdateTheme.leadingKicker.modify())(void, void)
{
  return nullsub_1;
}

void *ActivityFlexibleUpdateTheme.trailingKicker.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1 + 904, (uint64_t)v4, &qword_26A030FE0);
  sub_257727130((uint64_t)v4, a1, &qword_26A030FE0);
  return sub_25779AC48(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
}

uint64_t ActivityFlexibleUpdateTheme.trailingKicker.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v4, &qword_26A030FE0);
  uint64_t v2 = v1 + 904;
  sub_257727130(v2, (uint64_t)v5, &qword_26A030FE0);
  sub_25779AC48(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  return sub_257727130((uint64_t)v4, v2, &qword_26A030FE0);
}

uint64_t (*ActivityFlexibleUpdateTheme.trailingKicker.modify())(void, void)
{
  return nullsub_1;
}

void *ActivityFlexibleUpdateTheme.headline.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1 + 1104, (uint64_t)v4, &qword_26A030FE0);
  sub_257727130((uint64_t)v4, a1, &qword_26A030FE0);
  return sub_25779AC48(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
}

uint64_t ActivityFlexibleUpdateTheme.headline.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v4, &qword_26A030FE0);
  uint64_t v2 = v1 + 1104;
  sub_257727130(v2, (uint64_t)v5, &qword_26A030FE0);
  sub_25779AC48(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  return sub_257727130((uint64_t)v4, v2, &qword_26A030FE0);
}

uint64_t (*ActivityFlexibleUpdateTheme.headline.modify())(void, void)
{
  return nullsub_1;
}

void *ActivityFlexibleUpdateTheme.body.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1 + 1304, (uint64_t)v4, &qword_26A030FE0);
  sub_257727130((uint64_t)v4, a1, &qword_26A030FE0);
  return sub_25779AC48(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
}

uint64_t ActivityFlexibleUpdateTheme.body.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v4, &qword_26A030FE0);
  uint64_t v2 = v1 + 1304;
  sub_257727130(v2, (uint64_t)v5, &qword_26A030FE0);
  sub_25779AC48(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  return sub_257727130((uint64_t)v4, v2, &qword_26A030FE0);
}

uint64_t (*ActivityFlexibleUpdateTheme.body.modify())(void, void)
{
  return nullsub_1;
}

void *ActivityFlexibleUpdateTheme.caption.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1 + 1504, (uint64_t)v4, &qword_26A030FE0);
  sub_257727130((uint64_t)v4, a1, &qword_26A030FE0);
  return sub_25779AC48(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
}

uint64_t ActivityFlexibleUpdateTheme.caption.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v4, &qword_26A030FE0);
  uint64_t v2 = v1 + 1504;
  sub_257727130(v2, (uint64_t)v5, &qword_26A030FE0);
  sub_25779AC48(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  return sub_257727130((uint64_t)v4, v2, &qword_26A030FE0);
}

uint64_t (*ActivityFlexibleUpdateTheme.caption.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdateTheme.trailingGraphic.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1 + 1704, (uint64_t)v4, &qword_26A0321F0);
  sub_257727130((uint64_t)v4, a1, &qword_26A0321F0);
  return sub_257B2BBA0(v4, sub_2578D3DCC);
}

uint64_t ActivityFlexibleUpdateTheme.trailingGraphic.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v4, &qword_26A0321F0);
  uint64_t v2 = v1 + 1704;
  sub_257727130(v2, (uint64_t)v5, &qword_26A0321F0);
  sub_257B2BBA0(v5, sub_2578D6E98);
  return sub_257727130((uint64_t)v4, v2, &qword_26A0321F0);
}

uint64_t (*ActivityFlexibleUpdateTheme.trailingGraphic.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdateTheme.hash(into:)(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x270FA5388](a1);
  sub_257727130(v1, (uint64_t)v61, &qword_26A0321F0);
  sub_257727130(v1 + 704, (uint64_t)v62, &qword_26A030FE0);
  sub_257727130(v1 + 904, (uint64_t)v63, &qword_26A030FE0);
  sub_257727130(v1 + 1104, (uint64_t)v64, &qword_26A030FE0);
  sub_257727130(v1 + 1304, (uint64_t)v65, &qword_26A030FE0);
  sub_257727130(v1 + 1504, (uint64_t)v66, &qword_26A030FE0);
  sub_257727130(v1 + 1704, (uint64_t)v67, &qword_26A0321F0);
  sub_257727130((uint64_t)v61, (uint64_t)v68, &qword_26A0321F0);
  if (sub_2577FFF08((uint64_t)v68) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v61, (uint64_t)&v39, &qword_26A0321F0);
    sub_257B45D10();
    sub_257727130((uint64_t)&v39, (uint64_t)&v16, &qword_26A0321F8);
    if (sub_2577FFF7C((uint64_t)&v16) == 1)
    {
      sub_257B45D10();
      sub_257B40E30((uint64_t)&v39, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
    }
    else
    {
      sub_257727130((uint64_t)&v39, (uint64_t)v37, &qword_26A0321F8);
      sub_257B45D10();
      sub_257727130((uint64_t)v37, (uint64_t)&v60, &qword_26A0318C8);
      sub_257727130((uint64_t)&v38, (uint64_t)&v59, &qword_26A031088);
      sub_257B2BBA0(v61, sub_2578D3DCC);
      sub_257B2BD00((uint64_t)&v39, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
      sub_257910674(v2);
      sub_2579106BC(v2);
      sub_257B2BD00((uint64_t)&v39, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
    }
    sub_257727130((uint64_t)v52, (uint64_t)v37, &qword_26A0321F8);
    if (sub_2577FFF7C((uint64_t)v37) == 1)
    {
      sub_257B45D10();
    }
    else
    {
      sub_257727130((uint64_t)v52, (uint64_t)v35, &qword_26A0321F8);
      sub_257B45D10();
      sub_257727130((uint64_t)v35, (uint64_t)&v58, &qword_26A0318C8);
      sub_257727130((uint64_t)v36, (uint64_t)&v57, &qword_26A031088);
      sub_257B41024((uint64_t)v35, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
      sub_257910674(v2);
      sub_2579106BC(v2);
      sub_257B2BD00((uint64_t)v52, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
    }
    sub_257B2BBA0(v61, sub_2578D6E98);
  }
  sub_257727130((uint64_t)v62, (uint64_t)v34, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v34) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v62, (uint64_t)&v39, &qword_26A030FE0);
    sub_257B45D10();
    long long v26 = v49;
    long long v27 = v50;
    uint64_t v3 = *((void *)&v50 + 1);
    uint64_t v4 = v51;
    uint64_t v28 = v51;
    long long v22 = v45;
    long long v23 = v46;
    long long v24 = v47;
    long long v25 = v48;
    long long v18 = v41;
    long long v19 = v42;
    long long v20 = v43;
    long long v21 = v44;
    long long v16 = v39;
    long long v17 = v40;
    sub_25775CDF0((uint64_t *)&v39);
    ActivityTextTheme.hash(into:)(v2);
    swift_bridgeObjectRetain();
    sub_2577AA858(v2, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2577586CC(v2, v4);
    swift_bridgeObjectRelease();
    sub_25779AC48(v62, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  }
  sub_257727130((uint64_t)v63, (uint64_t)v33, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v33) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v63, (uint64_t)&v39, &qword_26A030FE0);
    sub_257B45D10();
    long long v26 = v49;
    long long v27 = v50;
    uint64_t v5 = *((void *)&v50 + 1);
    uint64_t v6 = v51;
    uint64_t v28 = v51;
    long long v22 = v45;
    long long v23 = v46;
    long long v24 = v47;
    long long v25 = v48;
    long long v18 = v41;
    long long v19 = v42;
    long long v20 = v43;
    long long v21 = v44;
    long long v16 = v39;
    long long v17 = v40;
    sub_25775CDF0((uint64_t *)&v39);
    ActivityTextTheme.hash(into:)(v2);
    swift_bridgeObjectRetain();
    sub_2577AA858(v2, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2577586CC(v2, v6);
    swift_bridgeObjectRelease();
    sub_25779AC48(v63, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  }
  sub_257727130((uint64_t)v64, (uint64_t)v32, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v32) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v64, (uint64_t)&v39, &qword_26A030FE0);
    sub_257B45D10();
    long long v26 = v49;
    long long v27 = v50;
    uint64_t v7 = *((void *)&v50 + 1);
    uint64_t v8 = v51;
    uint64_t v28 = v51;
    long long v22 = v45;
    long long v23 = v46;
    long long v24 = v47;
    long long v25 = v48;
    long long v18 = v41;
    long long v19 = v42;
    long long v20 = v43;
    long long v21 = v44;
    long long v16 = v39;
    long long v17 = v40;
    sub_25775CDF0((uint64_t *)&v39);
    ActivityTextTheme.hash(into:)(v2);
    swift_bridgeObjectRetain();
    sub_2577AA858(v2, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2577586CC(v2, v8);
    swift_bridgeObjectRelease();
    sub_25779AC48(v64, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  }
  sub_257727130((uint64_t)v65, (uint64_t)v31, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v31) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v65, (uint64_t)&v39, &qword_26A030FE0);
    sub_257B45D10();
    long long v26 = v49;
    long long v27 = v50;
    uint64_t v9 = *((void *)&v50 + 1);
    uint64_t v10 = v51;
    uint64_t v28 = v51;
    long long v22 = v45;
    long long v23 = v46;
    long long v24 = v47;
    long long v25 = v48;
    long long v18 = v41;
    long long v19 = v42;
    long long v20 = v43;
    long long v21 = v44;
    long long v16 = v39;
    long long v17 = v40;
    sub_25775CDF0((uint64_t *)&v39);
    ActivityTextTheme.hash(into:)(v2);
    swift_bridgeObjectRetain();
    sub_2577AA858(v2, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2577586CC(v2, v10);
    swift_bridgeObjectRelease();
    sub_25779AC48(v65, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  }
  sub_257727130((uint64_t)v66, (uint64_t)v30, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v30) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v66, (uint64_t)&v39, &qword_26A030FE0);
    sub_257B45D10();
    long long v26 = v49;
    long long v27 = v50;
    uint64_t v11 = *((void *)&v50 + 1);
    uint64_t v12 = v51;
    uint64_t v28 = v51;
    long long v22 = v45;
    long long v23 = v46;
    long long v24 = v47;
    long long v25 = v48;
    long long v18 = v41;
    long long v19 = v42;
    long long v20 = v43;
    long long v21 = v44;
    long long v16 = v39;
    long long v17 = v40;
    sub_25775CDF0((uint64_t *)&v39);
    ActivityTextTheme.hash(into:)(v2);
    swift_bridgeObjectRetain();
    sub_2577AA858(v2, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2577586CC(v2, v12);
    swift_bridgeObjectRelease();
    sub_25779AC48(v66, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  }
  sub_257727130((uint64_t)v67, (uint64_t)&v39, &qword_26A0321F0);
  if (sub_2577FFF08((uint64_t)&v39) == 1) {
    return sub_257B45D10();
  }
  sub_257727130((uint64_t)v67, (uint64_t)&v16, &qword_26A0321F0);
  sub_257B45D10();
  sub_257727130((uint64_t)&v16, (uint64_t)v37, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v37) == 1)
  {
    sub_257B45D10();
    sub_257B40E30((uint64_t)&v16, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
  }
  else
  {
    sub_257727130((uint64_t)&v16, (uint64_t)v35, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)v35, (uint64_t)v56, &qword_26A0318C8);
    sub_257727130((uint64_t)v36, (uint64_t)v55, &qword_26A031088);
    sub_257B2BBA0(v67, sub_2578D3DCC);
    sub_257B2BD00((uint64_t)&v16, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
    sub_257910674(v2);
    sub_2579106BC(v2);
    sub_257B2BD00((uint64_t)&v16, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  sub_257727130((uint64_t)v29, (uint64_t)v35, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v35) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v29, (uint64_t)&v14, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)&v14, (uint64_t)v54, &qword_26A0318C8);
    sub_257727130((uint64_t)&v15, (uint64_t)v53, &qword_26A031088);
    sub_257B41024((uint64_t)&v14, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257910674(v2);
    sub_2579106BC(v2);
    sub_257B2BD00((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  return sub_257B2BBA0(v67, sub_2578D6E98);
}

uint64_t ActivityFlexibleUpdateTheme.hashValue.getter()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_257B45CF0();
  ActivityFlexibleUpdateTheme.hash(into:)((uint64_t)&v2);
  return sub_257B45D40();
}

uint64_t sub_257B27380()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_257B45CF0();
  ActivityFlexibleUpdateTheme.hash(into:)((uint64_t)&v2);
  return sub_257B45D40();
}

uint64_t sub_257B273D8()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_257B45CF0();
  ActivityFlexibleUpdateTheme.hash(into:)((uint64_t)&v2);
  return sub_257B45D40();
}

uint64_t ActivityFlexibleUpdate.Graphic.asset.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2577263B4(v1, a1, (uint64_t *)&unk_26B2DD028);
}

uint64_t ActivityFlexibleUpdate.Graphic.asset.setter(uint64_t a1)
{
  return sub_257AD1A88(a1, v1, (uint64_t *)&unk_26B2DD028);
}

uint64_t (*ActivityFlexibleUpdate.Graphic.asset.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.Graphic.size.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t ActivityFlexibleUpdate.Graphic.size.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  *(unsigned char *)(v1 + *(int *)(result + 20)) = v2;
  return result;
}

uint64_t (*ActivityFlexibleUpdate.Graphic.size.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.Graphic.badge.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  return sub_2577263B4(v1 + *(int *)(v3 + 24), a1, &qword_26A031028);
}

uint64_t ActivityFlexibleUpdate.Graphic.badge.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  return sub_257AD1A88(a1, v1 + *(int *)(v3 + 24), &qword_26A031028);
}

uint64_t (*ActivityFlexibleUpdate.Graphic.badge.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdate.Graphic.hash(into:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  ActivityAsset.hash(into:)(a1);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  uint64_t v11 = *(void *)(v1 + *(int *)(v10 + 28));
  swift_bridgeObjectRetain();
  sub_2577AA858(a1, v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v1 + *(int *)(v10 + 32));
  swift_bridgeObjectRetain();
  sub_257758128(a1, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  sub_257B45180();
  swift_bridgeObjectRelease();
  sub_2577263B4(v1 + *(int *)(v13 + 24), (uint64_t)v9, &qword_26A031028);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1) {
    return sub_257B45D10();
  }
  sub_257727130((uint64_t)v9, (uint64_t)v6, (uint64_t *)&unk_26B2DD028);
  sub_257B45D10();
  ActivityAsset.hash(into:)(a1);
  uint64_t v15 = *(void *)&v6[*(int *)(v10 + 28)];
  swift_bridgeObjectRetain();
  sub_2577AA858(a1, v15);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)&v6[*(int *)(v10 + 32)];
  swift_bridgeObjectRetain();
  sub_257758128(a1, v16);
  swift_bridgeObjectRelease();
  return sub_2577270D4((uint64_t)v6, (uint64_t *)&unk_26B2DD028);
}

uint64_t sub_257B278C8()
{
  uint64_t v1 = 1702521203;
  if (*v0 != 1) {
    uint64_t v1 = 0x6567646162;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7465737361;
  }
}

uint64_t sub_257B27914@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_257B40BC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_257B2793C(uint64_t a1)
{
  unint64_t v2 = sub_257B2C2E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_257B27978(uint64_t a1)
{
  unint64_t v2 = sub_257B2C2E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityFlexibleUpdate.Graphic.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035F28);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B2C2E8();
  sub_257B45DF0();
  char v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  sub_257B2C3D8(&qword_26A0327B0);
  sub_257B45B00();
  if (!v2)
  {
    char v13 = *(unsigned char *)(v3 + *(int *)(type metadata accessor for ActivityFlexibleUpdate.Graphic(0) + 20));
    char v12 = 1;
    sub_257B2C384();
    sub_257B45B00();
    char v11 = 2;
    sub_257B45AB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ActivityFlexibleUpdate.Graphic.hashValue.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_257B45CF0();
  ActivityAsset.hash(into:)((uint64_t)v16);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  uint64_t v9 = *(void *)(v0 + *(int *)(v8 + 28));
  swift_bridgeObjectRetain();
  sub_2577AA858((uint64_t)v16, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v0 + *(int *)(v8 + 32));
  swift_bridgeObjectRetain();
  sub_257758128((uint64_t)v16, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  sub_257B45180();
  swift_bridgeObjectRelease();
  sub_2577263B4(v0 + *(int *)(v11 + 24), (uint64_t)v7, &qword_26A031028);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v7, (uint64_t)v4, (uint64_t *)&unk_26B2DD028);
    sub_257B45D10();
    ActivityAsset.hash(into:)((uint64_t)v16);
    uint64_t v12 = *(void *)&v4[*(int *)(v8 + 28)];
    swift_bridgeObjectRetain();
    sub_2577AA858((uint64_t)v16, v12);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)&v4[*(int *)(v8 + 32)];
    swift_bridgeObjectRetain();
    sub_257758128((uint64_t)v16, v13);
    swift_bridgeObjectRelease();
    sub_2577270D4((uint64_t)v4, (uint64_t *)&unk_26B2DD028);
  }
  return sub_257B45D40();
}

uint64_t ActivityFlexibleUpdate.Graphic.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v28 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035F40);
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  char v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void (**)(void))(v7 + 56);
  unint64_t v30 = &v14[*(int *)(v12 + 24)];
  v15();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B2C2E8();
  uint64_t v16 = (uint64_t)v31;
  sub_257B45DC0();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_2577270D4((uint64_t)v30, &qword_26A031028);
  }
  else
  {
    unint64_t v31 = v14;
    char v35 = 0;
    uint64_t v17 = sub_257B2C3D8(&qword_26A0327D8);
    long long v18 = v28;
    sub_257B45A20();
    v25[1] = v17;
    uint64_t v19 = (uint64_t)v18;
    uint64_t v20 = (uint64_t)v31;
    sub_257727130(v19, (uint64_t)v31, (uint64_t *)&unk_26B2DD028);
    char v33 = 1;
    sub_257B2C4A4();
    sub_257B45A20();
    *(unsigned char *)(v20 + *(int *)(v11 + 20)) = v34;
    char v32 = 2;
    uint64_t v21 = v29;
    sub_257B459D0();
    uint64_t v22 = v21;
    uint64_t v23 = (uint64_t)v31;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v22);
    sub_257AD1A88((uint64_t)v5, (uint64_t)v30, &qword_26A031028);
    sub_257B2C4F8(v23, v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_257B2F584(v23, type metadata accessor for ActivityFlexibleUpdate.Graphic);
  }
}

uint64_t sub_257B28280@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ActivityFlexibleUpdate.Graphic.init(from:)(a1, a2);
}

uint64_t sub_257B28298(void *a1)
{
  return ActivityFlexibleUpdate.Graphic.encode(to:)(a1);
}

uint64_t sub_257B282B4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  ActivityAsset.hash(into:)(a1);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  uint64_t v13 = *(void *)(v2 + *(int *)(v12 + 28));
  swift_bridgeObjectRetain();
  sub_2577AA858(a1, v13);
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v2 + *(int *)(v12 + 32));
  swift_bridgeObjectRetain();
  sub_257758128(a1, v14);
  swift_bridgeObjectRelease();
  sub_257B45180();
  swift_bridgeObjectRelease();
  sub_2577263B4(v2 + *(int *)(a2 + 24), (uint64_t)v11, &qword_26A031028);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1) {
    return sub_257B45D10();
  }
  sub_257727130((uint64_t)v11, (uint64_t)v8, (uint64_t *)&unk_26B2DD028);
  sub_257B45D10();
  ActivityAsset.hash(into:)(a1);
  uint64_t v16 = *(void *)&v8[*(int *)(v12 + 28)];
  swift_bridgeObjectRetain();
  sub_2577AA858(a1, v16);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)&v8[*(int *)(v12 + 32)];
  swift_bridgeObjectRetain();
  sub_257758128(a1, v17);
  swift_bridgeObjectRelease();
  return sub_2577270D4((uint64_t)v8, (uint64_t *)&unk_26B2DD028);
}

uint64_t sub_257B28554(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_257B45CF0();
  ActivityAsset.hash(into:)((uint64_t)v18);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  uint64_t v12 = *(void *)(v2 + *(int *)(v11 + 28));
  swift_bridgeObjectRetain();
  sub_2577AA858((uint64_t)v18, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v2 + *(int *)(v11 + 32));
  swift_bridgeObjectRetain();
  sub_257758128((uint64_t)v18, v13);
  swift_bridgeObjectRelease();
  sub_257B45180();
  swift_bridgeObjectRelease();
  sub_2577263B4(v2 + *(int *)(a2 + 24), (uint64_t)v10, &qword_26A031028);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v10, (uint64_t)v7, (uint64_t *)&unk_26B2DD028);
    sub_257B45D10();
    ActivityAsset.hash(into:)((uint64_t)v18);
    uint64_t v14 = *(void *)&v7[*(int *)(v11 + 28)];
    swift_bridgeObjectRetain();
    sub_2577AA858((uint64_t)v18, v14);
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)&v7[*(int *)(v11 + 32)];
    swift_bridgeObjectRetain();
    sub_257758128((uint64_t)v18, v15);
    swift_bridgeObjectRelease();
    sub_2577270D4((uint64_t)v7, (uint64_t *)&unk_26B2DD028);
  }
  return sub_257B45D40();
}

NewsLiveActivitiesCore::ActivityFlexibleUpdate::GraphicSize_optional __swiftcall ActivityFlexibleUpdate.GraphicSize.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_257B45950();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t ActivityFlexibleUpdate.GraphicSize.rawValue.getter()
{
  uint64_t v1 = 0x6D756964656DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x656772616CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6C6C616D73;
  }
}

NewsLiveActivitiesCore::ActivityFlexibleUpdate::GraphicSize_optional sub_257B288B4(Swift::String *a1)
{
  return ActivityFlexibleUpdate.GraphicSize.init(rawValue:)(*a1);
}

uint64_t sub_257B288C0()
{
  return sub_257B45270();
}

uint64_t sub_257B28920()
{
  return sub_257B45230();
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.asset.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1, (uint64_t)v4, &qword_26A0321F8);
  sub_257727130((uint64_t)v4, a1, &qword_26A0321F8);
  return sub_257B2BD00((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.asset.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v3, &qword_26A0321F8);
  sub_257727130(v1, (uint64_t)v4, &qword_26A0321F8);
  sub_257B2BD00((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  return sub_257727130((uint64_t)v3, v1, &qword_26A0321F8);
}

uint64_t (*ActivityFlexibleUpdateTheme.Graphic.asset.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.badge.getter@<X0>(uint64_t a1@<X8>)
{
  sub_257727130(v1 + 352, (uint64_t)v4, &qword_26A0321F8);
  sub_257727130((uint64_t)v4, a1, &qword_26A0321F8);
  return sub_257B2BD00((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.badge.setter(uint64_t a1)
{
  sub_257727130(a1, (uint64_t)v4, &qword_26A0321F8);
  uint64_t v2 = v1 + 352;
  sub_257727130(v2, (uint64_t)v5, &qword_26A0321F8);
  sub_257B2BD00((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  return sub_257727130((uint64_t)v4, v2, &qword_26A0321F8);
}

uint64_t (*ActivityFlexibleUpdateTheme.Graphic.badge.modify())(void, void)
{
  return nullsub_1;
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.hash(into:)(uint64_t a1)
{
  sub_257727130(v1, (uint64_t)v12, &qword_26A0321F8);
  sub_257727130(v1 + 352, (uint64_t)v13, &qword_26A0321F8);
  sub_257727130((uint64_t)v12, (uint64_t)v14, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v14) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v12, (uint64_t)v6, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)v6, (uint64_t)v11, &qword_26A0318C8);
    sub_257727130((uint64_t)&v7, (uint64_t)v10, &qword_26A031088);
    sub_257B41024((uint64_t)v6, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257910674(a1);
    sub_2579106BC(a1);
    sub_257B2BD00((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  sub_257727130((uint64_t)v13, (uint64_t)v6, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v6) == 1) {
    return sub_257B45D10();
  }
  sub_257727130((uint64_t)v13, (uint64_t)v4, &qword_26A0321F8);
  sub_257B45D10();
  sub_257727130((uint64_t)v4, (uint64_t)v9, &qword_26A0318C8);
  sub_257727130((uint64_t)&v5, (uint64_t)v8, &qword_26A031088);
  sub_257B41024((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
  sub_257910674(a1);
  sub_2579106BC(a1);
  return sub_257B2BD00((uint64_t)v13, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
}

uint64_t sub_257B28DAC()
{
  if (*v0) {
    return 0x6567646162;
  }
  else {
    return 0x7465737361;
  }
}

uint64_t sub_257B28DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_257B40CF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_257B28E00(uint64_t a1)
{
  unint64_t v2 = sub_257B2C55C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_257B28E3C(uint64_t a1)
{
  unint64_t v2 = sub_257B2C55C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035F50);
  uint64_t v8 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_257727130(v1, (uint64_t)v10, &qword_26A0321F8);
  sub_257727130(v1 + 352, (uint64_t)v11, &qword_26A0321F8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B2C55C();
  sub_257B45DF0();
  sub_257727130((uint64_t)v10, (uint64_t)v9, &qword_26A0321F8);
  char v12 = 0;
  sub_257B2C5B0();
  sub_257B45AB0();
  if (!v2)
  {
    sub_257727130((uint64_t)v11, (uint64_t)v9, &qword_26A0321F8);
    char v12 = 1;
    sub_257B45AB0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v6, v4);
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.hashValue.getter()
{
  sub_257727130(v0, (uint64_t)v11, &qword_26A0321F8);
  sub_257727130(v0 + 352, (uint64_t)v12, &qword_26A0321F8);
  sub_257B45CF0();
  sub_257727130((uint64_t)v11, (uint64_t)v13, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v13) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v11, (uint64_t)v4, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)v4, (uint64_t)v10, &qword_26A0318C8);
    sub_257727130((uint64_t)&v5, (uint64_t)v9, &qword_26A031088);
    sub_257B41024((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257910674((uint64_t)v6);
    sub_2579106BC((uint64_t)v6);
    sub_257B2BD00((uint64_t)v11, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  sub_257727130((uint64_t)v12, (uint64_t)v4, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v4) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v12, (uint64_t)v2, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)v2, (uint64_t)v8, &qword_26A0318C8);
    sub_257727130((uint64_t)&v3, (uint64_t)v7, &qword_26A031088);
    sub_257B41024((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257910674((uint64_t)v6);
    sub_2579106BC((uint64_t)v6);
    sub_257B2BD00((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  return sub_257B45D40();
}

uint64_t ActivityFlexibleUpdateTheme.Graphic.init(from:)(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x270FA5388](a1);
  uint64_t v11 = v3;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035F68);
  uint64_t v4 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2577FFF3C((uint64_t)v21);
  sub_257727130((uint64_t)v21, (uint64_t)v20, &qword_26A0321F8);
  sub_257727130((uint64_t)v21, (uint64_t)&v20[352], &qword_26A0321F8);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_257B2C55C();
  sub_257B45DC0();
  if (!v1)
  {
    uint64_t v7 = v4;
    v21[375] = 0;
    sub_257B2C604();
    uint64_t v8 = v12;
    sub_257B459D0();
    sub_257727130((uint64_t)&v18, (uint64_t)v17, &qword_26A0321F8);
    sub_257727130((uint64_t)v17, (uint64_t)v20, &qword_26A0321F8);
    v21[374] = 1;
    sub_257B2BD00((uint64_t)v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
    sub_257B459D0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v6, v8);
    sub_257727130((uint64_t)&v16, (uint64_t)v13, &qword_26A0321F8);
    sub_257727130((uint64_t)&v20[352], (uint64_t)v14, &qword_26A0321F8);
    sub_257B2BD00((uint64_t)v13, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
    sub_257B2BD00((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
    sub_257727130((uint64_t)v13, (uint64_t)&v20[352], &qword_26A0321F8);
    sub_257727130((uint64_t)v17, (uint64_t)v15, &qword_26A0321F8);
    sub_257727130((uint64_t)v13, (uint64_t)&v15[352], &qword_26A0321F8);
    sub_257B40E30((uint64_t)v15, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
    sub_257B2BD00((uint64_t)v13, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
    sub_257B2BD00((uint64_t)v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
    memcpy(v11, v15, 0x2C0uLL);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  memcpy(v19, v20, sizeof(v19));
  return sub_257B40E30((uint64_t)v19, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_25780000C);
}

uint64_t sub_257B29620(uint64_t a1)
{
  return ActivityFlexibleUpdateTheme.Graphic.init(from:)(a1);
}

uint64_t sub_257B29638(void *a1)
{
  return ActivityFlexibleUpdateTheme.Graphic.encode(to:)(a1);
}

uint64_t sub_257B29654(uint64_t a1)
{
  sub_257727130(v1, (uint64_t)v12, &qword_26A0321F8);
  sub_257727130(v1 + 352, (uint64_t)v13, &qword_26A0321F8);
  sub_257727130((uint64_t)v12, (uint64_t)v14, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v14) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v12, (uint64_t)v6, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)v6, (uint64_t)v11, &qword_26A0318C8);
    sub_257727130((uint64_t)&v7, (uint64_t)v10, &qword_26A031088);
    sub_257B41024((uint64_t)v6, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257910674(a1);
    sub_2579106BC(a1);
    sub_257B2BD00((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  sub_257727130((uint64_t)v13, (uint64_t)v6, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v6) == 1) {
    return sub_257B45D10();
  }
  sub_257727130((uint64_t)v13, (uint64_t)v4, &qword_26A0321F8);
  sub_257B45D10();
  sub_257727130((uint64_t)v4, (uint64_t)v9, &qword_26A0318C8);
  sub_257727130((uint64_t)&v5, (uint64_t)v8, &qword_26A031088);
  sub_257B41024((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
  sub_257910674(a1);
  sub_2579106BC(a1);
  return sub_257B2BD00((uint64_t)v13, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
}

uint64_t sub_257B29870()
{
  sub_257727130(v0, (uint64_t)v11, &qword_26A0321F8);
  sub_257727130(v0 + 352, (uint64_t)v12, &qword_26A0321F8);
  sub_257B45CF0();
  sub_257727130((uint64_t)v11, (uint64_t)v13, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v13) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v11, (uint64_t)v4, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)v4, (uint64_t)v10, &qword_26A0318C8);
    sub_257727130((uint64_t)&v5, (uint64_t)v9, &qword_26A031088);
    sub_257B41024((uint64_t)v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257910674((uint64_t)v6);
    sub_2579106BC((uint64_t)v6);
    sub_257B2BD00((uint64_t)v11, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  sub_257727130((uint64_t)v12, (uint64_t)v4, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v4) == 1)
  {
    sub_257B45D10();
  }
  else
  {
    sub_257727130((uint64_t)v12, (uint64_t)v2, &qword_26A0321F8);
    sub_257B45D10();
    sub_257727130((uint64_t)v2, (uint64_t)v8, &qword_26A0318C8);
    sub_257727130((uint64_t)&v3, (uint64_t)v7, &qword_26A031088);
    sub_257B41024((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257910674((uint64_t)v6);
    sub_2579106BC((uint64_t)v6);
    sub_257B2BD00((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  }
  return sub_257B45D40();
}

BOOL _s22NewsLiveActivitiesCore27ActivityFlexibleUpdateThemeV7GraphicV2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  sub_257727130(v1, (uint64_t)v17, &qword_26A0321F8);
  sub_257727130(v4 + 352, (uint64_t)v18, &qword_26A0321F8);
  sub_257727130(v3, (uint64_t)v19, &qword_26A0321F8);
  sub_257727130(v3 + 352, (uint64_t)v20, &qword_26A0321F8);
  sub_257727130((uint64_t)v17, (uint64_t)v21, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v21) == 1)
  {
    sub_257727130((uint64_t)v19, (uint64_t)v15, &qword_26A0321F8);
    if (sub_2577FFF7C((uint64_t)v15) == 1) {
      goto LABEL_8;
    }
LABEL_6:
    sub_257727130((uint64_t)v17, (uint64_t)v15, &qword_26A0321F8);
    sub_257727130((uint64_t)v19, (uint64_t)v16, &qword_26A0321F8);
    uint64_t v5 = v19;
LABEL_14:
    sub_257B2BD00((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
    sub_257B40E30((uint64_t)v15, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_25780000C);
    return 0;
  }
  sub_257727130((uint64_t)v17, (uint64_t)__src, &qword_26A0321F8);
  sub_257727130((uint64_t)v19, (uint64_t)v15, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v15) == 1)
  {
    memcpy(__dst, __src, sizeof(__dst));
    sub_257727130((uint64_t)v17, (uint64_t)v12, &qword_26A0321F8);
    sub_257727130((uint64_t)v17, (uint64_t)v13, &qword_26A0321F8);
    sub_257B41024((uint64_t)v13, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257B41024((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257B41024((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_2578001C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257913084);
    goto LABEL_6;
  }
  sub_257727130((uint64_t)v19, (uint64_t)__dst, &qword_26A0321F8);
  memcpy(v10, __dst, sizeof(v10));
  sub_257727130((uint64_t)v17, (uint64_t)v12, &qword_26A0321F8);
  sub_257B2BD00((uint64_t)v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
  sub_257B41024((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
  BOOL v6 = _s22NewsLiveActivitiesCore18ActivityAssetThemeV2eeoiySbAC_ACtFZ_0((uint64_t)__src, (uint64_t)v10);
  memcpy(v13, __src, sizeof(v13));
  sub_257B41024((uint64_t)v13, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_2578001C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257913084);
  sub_257B2BD00((uint64_t)v17, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  if (!v6) {
    return 0;
  }
LABEL_8:
  sub_257727130((uint64_t)v18, (uint64_t)__src, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)__src) == 1)
  {
    sub_257727130((uint64_t)v20, (uint64_t)v15, &qword_26A0321F8);
    if (sub_2577FFF7C((uint64_t)v15) == 1) {
      return 1;
    }
    goto LABEL_13;
  }
  sub_257727130((uint64_t)v18, (uint64_t)v13, &qword_26A0321F8);
  sub_257727130((uint64_t)v20, (uint64_t)v15, &qword_26A0321F8);
  if (sub_2577FFF7C((uint64_t)v15) == 1)
  {
    memcpy(v10, v13, sizeof(v10));
    sub_257727130((uint64_t)v18, (uint64_t)__dst, &qword_26A0321F8);
    sub_257727130((uint64_t)v18, (uint64_t)v12, &qword_26A0321F8);
    sub_257B41024((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257B41024((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
    sub_257B41024((uint64_t)v10, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_2578001C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257913084);
LABEL_13:
    sub_257727130((uint64_t)v18, (uint64_t)v15, &qword_26A0321F8);
    sub_257727130((uint64_t)v20, (uint64_t)v16, &qword_26A0321F8);
    uint64_t v5 = v20;
    goto LABEL_14;
  }
  sub_257727130((uint64_t)v20, (uint64_t)v10, &qword_26A0321F8);
  memcpy(v9, v10, sizeof(v9));
  sub_257727130((uint64_t)v18, (uint64_t)__dst, &qword_26A0321F8);
  sub_257B2BD00((uint64_t)v18, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257800338);
  sub_257B41024((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257778A90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257778A90);
  BOOL v8 = _s22NewsLiveActivitiesCore18ActivityAssetThemeV2eeoiySbAC_ACtFZ_0((uint64_t)v13, (uint64_t)v9);
  memcpy(v12, v13, sizeof(v12));
  sub_257B41024((uint64_t)v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_2578001C8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257913084);
  sub_257B2BD00((uint64_t)v18, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_25780000C);
  return v8;
}

BOOL _s22NewsLiveActivitiesCore27ActivityFlexibleUpdateThemeV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  sub_257727130(v1, (uint64_t)v45, &qword_26A0321F0);
  sub_257727130(v4 + 704, (uint64_t)v46, &qword_26A030FE0);
  sub_257727130(v4 + 904, (uint64_t)v47, &qword_26A030FE0);
  sub_257727130(v4 + 1104, (uint64_t)v48, &qword_26A030FE0);
  sub_257727130(v4 + 1304, (uint64_t)v49, &qword_26A030FE0);
  sub_257727130(v4 + 1504, (uint64_t)v50, &qword_26A030FE0);
  sub_257727130(v4 + 1704, (uint64_t)v51, &qword_26A0321F0);
  sub_257727130(v3, (uint64_t)v52, &qword_26A0321F0);
  sub_257727130(v3 + 704, (uint64_t)v53, &qword_26A030FE0);
  sub_257727130(v3 + 904, (uint64_t)v54, &qword_26A030FE0);
  sub_257727130(v3 + 1104, (uint64_t)v55, &qword_26A030FE0);
  sub_257727130(v3 + 1304, (uint64_t)v56, &qword_26A030FE0);
  sub_257727130(v3 + 1504, (uint64_t)v57, &qword_26A030FE0);
  sub_257727130(v3 + 1704, (uint64_t)v58, &qword_26A0321F0);
  sub_257727130((uint64_t)v45, (uint64_t)v59, &qword_26A0321F0);
  if (sub_2577FFF08((uint64_t)v59) == 1)
  {
    sub_257727130((uint64_t)v52, (uint64_t)v42, &qword_26A0321F0);
    if (sub_2577FFF08((uint64_t)v42) == 1) {
      goto LABEL_9;
    }
LABEL_6:
    sub_257727130((uint64_t)v45, (uint64_t)v42, &qword_26A0321F0);
    sub_257727130((uint64_t)v52, (uint64_t)v44, &qword_26A0321F0);
    uint64_t v5 = v52;
LABEL_7:
    sub_257B2BBA0(v5, sub_2578D3DCC);
    sub_257B41144((uint64_t)v42);
    return 0;
  }
  sub_257727130((uint64_t)v45, (uint64_t)__src, &qword_26A0321F0);
  sub_257727130((uint64_t)v52, (uint64_t)v42, &qword_26A0321F0);
  if (sub_2577FFF08((uint64_t)v42) == 1)
  {
    memcpy(__dst, __src, sizeof(__dst));
    sub_257727130((uint64_t)v45, (uint64_t)v35, &qword_26A0321F0);
    sub_257B40E30((uint64_t)v35, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
    sub_257B40E30((uint64_t)v35, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
    sub_257B40E30((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_25780000C);
    goto LABEL_6;
  }
  sub_257727130((uint64_t)v52, (uint64_t)v33, &qword_26A0321F0);
  memcpy(v32, v33, sizeof(v32));
  sub_257727130((uint64_t)v45, (uint64_t)__dst, &qword_26A0321F0);
  sub_257B2BBA0(v45, sub_2578D3DCC);
  sub_257B40E30((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
  BOOL updated = _s22NewsLiveActivitiesCore27ActivityFlexibleUpdateThemeV7GraphicV2eeoiySbAE_AEtFZ_0((uint64_t)__src);
  memcpy(v35, __src, sizeof(v35));
  sub_257B40E30((uint64_t)v35, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_25780000C);
  sub_257B2BBA0(v45, sub_2578D6E98);
  if (!updated) {
    return 0;
  }
LABEL_9:
  sub_257727130((uint64_t)v46, (uint64_t)v41, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v41) == 1)
  {
    sub_257727130((uint64_t)v53, (uint64_t)v42, &qword_26A030FE0);
    if (sub_257727344((uint64_t)v42) == 1) {
      goto LABEL_11;
    }
LABEL_23:
    sub_257727130((uint64_t)v46, (uint64_t)v42, &qword_26A030FE0);
    sub_257727130((uint64_t)v53, (uint64_t)v43, &qword_26A030FE0);
    sub_25779AC48(v46, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
    uint64_t v7 = v53;
LABEL_52:
    sub_25779AC48(v7, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
    sub_2577B4730((uint64_t)v42);
    return 0;
  }
  sub_257727130((uint64_t)v53, (uint64_t)v42, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v42) == 1) {
    goto LABEL_23;
  }
  sub_257727130((uint64_t)v53, (uint64_t)v35, &qword_26A030FE0);
  sub_257727130((uint64_t)v46, (uint64_t)__src, &qword_26A030FE0);
  __dst[10] = __src[10];
  __dst[11] = __src[11];
  *(void *)&__dst[12] = *(void *)&__src[12];
  __dst[6] = __src[6];
  __dst[7] = __src[7];
  __dst[9] = __src[9];
  __dst[8] = __src[8];
  __dst[2] = __src[2];
  __dst[3] = __src[3];
  __dst[5] = __src[5];
  __dst[4] = __src[4];
  __dst[1] = __src[1];
  __dst[0] = __src[0];
  v33[10] = v35[10];
  v33[11] = v35[11];
  *(void *)&v33[12] = *(void *)&v35[12];
  v33[6] = v35[6];
  v33[7] = v35[7];
  v33[9] = v35[9];
  v33[8] = v35[8];
  v33[2] = v35[2];
  v33[3] = v35[3];
  v33[5] = v35[5];
  v33[4] = v35[4];
  v33[1] = v35[1];
  v33[0] = v35[0];
  sub_25779AC48(v46, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  sub_25779AC48(v53, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  if (!_s22NewsLiveActivitiesCore17ActivityTextThemeV2eeoiySbAC_ACtFZ_0((uint64_t *)__dst, (uint64_t *)v33)
    || (uint64_t v8 = *((void *)&__src[11] + 1),
        uint64_t v9 = *((void *)&v35[11] + 1),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        char v10 = sub_2577EA368(v8, v9),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v10 & 1) == 0))
  {
    sub_25779AC48(v53, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
    uint64_t v12 = v46;
LABEL_58:
    sub_25779AC48(v12, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
    return 0;
  }
  char v11 = sub_257768514(*(uint64_t *)&__src[12], *(uint64_t *)&v35[12]);
  sub_25779AC48(v53, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  sub_25779AC48(v46, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  if ((v11 & 1) == 0) {
    return 0;
  }
LABEL_11:
  sub_257727130((uint64_t)v47, (uint64_t)v40, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v40) == 1)
  {
    sub_257727130((uint64_t)v54, (uint64_t)v42, &qword_26A030FE0);
    if (sub_257727344((uint64_t)v42) == 1) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
  sub_257727130((uint64_t)v54, (uint64_t)v42, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v42) == 1)
  {
LABEL_30:
    sub_257727130((uint64_t)v47, (uint64_t)v42, &qword_26A030FE0);
    sub_257727130((uint64_t)v54, (uint64_t)v43, &qword_26A030FE0);
    sub_25779AC48(v47, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
    uint64_t v7 = v54;
    goto LABEL_52;
  }
  sub_257727130((uint64_t)v54, (uint64_t)v35, &qword_26A030FE0);
  sub_257727130((uint64_t)v47, (uint64_t)__src, &qword_26A030FE0);
  __dst[10] = __src[10];
  __dst[11] = __src[11];
  *(void *)&__dst[12] = *(void *)&__src[12];
  __dst[6] = __src[6];
  __dst[7] = __src[7];
  __dst[9] = __src[9];
  __dst[8] = __src[8];
  __dst[2] = __src[2];
  __dst[3] = __src[3];
  __dst[5] = __src[5];
  __dst[4] = __src[4];
  __dst[1] = __src[1];
  __dst[0] = __src[0];
  v33[10] = v35[10];
  v33[11] = v35[11];
  *(void *)&v33[12] = *(void *)&v35[12];
  v33[6] = v35[6];
  v33[7] = v35[7];
  v33[9] = v35[9];
  v33[8] = v35[8];
  v33[2] = v35[2];
  v33[3] = v35[3];
  v33[5] = v35[5];
  v33[4] = v35[4];
  v33[1] = v35[1];
  v33[0] = v35[0];
  sub_25779AC48(v47, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  sub_25779AC48(v54, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  if (!_s22NewsLiveActivitiesCore17ActivityTextThemeV2eeoiySbAC_ACtFZ_0((uint64_t *)__dst, (uint64_t *)v33)
    || (uint64_t v13 = *((void *)&__src[11] + 1),
        uint64_t v14 = *((void *)&v35[11] + 1),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        char v15 = sub_2577EA368(v13, v14),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v15 & 1) == 0))
  {
    sub_25779AC48(v54, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
    uint64_t v12 = v47;
    goto LABEL_58;
  }
  char v16 = sub_257768514(*(uint64_t *)&__src[12], *(uint64_t *)&v35[12]);
  sub_25779AC48(v54, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  sub_25779AC48(v47, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  if ((v16 & 1) == 0) {
    return 0;
  }
LABEL_13:
  sub_257727130((uint64_t)v48, (uint64_t)v39, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v39) == 1)
  {
    sub_257727130((uint64_t)v55, (uint64_t)v42, &qword_26A030FE0);
    if (sub_257727344((uint64_t)v42) == 1) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
  sub_257727130((uint64_t)v55, (uint64_t)v42, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v42) == 1)
  {
LABEL_37:
    sub_257727130((uint64_t)v48, (uint64_t)v42, &qword_26A030FE0);
    sub_257727130((uint64_t)v55, (uint64_t)v43, &qword_26A030FE0);
    sub_25779AC48(v48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
    uint64_t v7 = v55;
    goto LABEL_52;
  }
  sub_257727130((uint64_t)v55, (uint64_t)v35, &qword_26A030FE0);
  sub_257727130((uint64_t)v48, (uint64_t)__src, &qword_26A030FE0);
  __dst[10] = __src[10];
  __dst[11] = __src[11];
  *(void *)&__dst[12] = *(void *)&__src[12];
  __dst[6] = __src[6];
  __dst[7] = __src[7];
  __dst[9] = __src[9];
  __dst[8] = __src[8];
  __dst[2] = __src[2];
  __dst[3] = __src[3];
  __dst[5] = __src[5];
  __dst[4] = __src[4];
  __dst[1] = __src[1];
  __dst[0] = __src[0];
  v33[10] = v35[10];
  v33[11] = v35[11];
  *(void *)&v33[12] = *(void *)&v35[12];
  v33[6] = v35[6];
  v33[7] = v35[7];
  v33[9] = v35[9];
  v33[8] = v35[8];
  v33[2] = v35[2];
  v33[3] = v35[3];
  v33[5] = v35[5];
  v33[4] = v35[4];
  v33[1] = v35[1];
  v33[0] = v35[0];
  sub_25779AC48(v48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  sub_25779AC48(v55, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  if (!_s22NewsLiveActivitiesCore17ActivityTextThemeV2eeoiySbAC_ACtFZ_0((uint64_t *)__dst, (uint64_t *)v33)
    || (uint64_t v17 = *((void *)&__src[11] + 1),
        uint64_t v18 = *((void *)&v35[11] + 1),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        char v19 = sub_2577EA368(v17, v18),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v19 & 1) == 0))
  {
    sub_25779AC48(v55, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
    uint64_t v12 = v48;
    goto LABEL_58;
  }
  char v20 = sub_257768514(*(uint64_t *)&__src[12], *(uint64_t *)&v35[12]);
  sub_25779AC48(v55, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  sub_25779AC48(v48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  if ((v20 & 1) == 0) {
    return 0;
  }
LABEL_15:
  sub_257727130((uint64_t)v49, (uint64_t)v38, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v38) == 1)
  {
    sub_257727130((uint64_t)v56, (uint64_t)v42, &qword_26A030FE0);
    if (sub_257727344((uint64_t)v42) == 1) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
  sub_257727130((uint64_t)v56, (uint64_t)v42, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v42) == 1)
  {
LABEL_44:
    sub_257727130((uint64_t)v49, (uint64_t)v42, &qword_26A030FE0);
    sub_257727130((uint64_t)v56, (uint64_t)v43, &qword_26A030FE0);
    sub_25779AC48(v49, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
    uint64_t v7 = v56;
    goto LABEL_52;
  }
  sub_257727130((uint64_t)v56, (uint64_t)v35, &qword_26A030FE0);
  sub_257727130((uint64_t)v49, (uint64_t)__src, &qword_26A030FE0);
  __dst[10] = __src[10];
  __dst[11] = __src[11];
  *(void *)&__dst[12] = *(void *)&__src[12];
  __dst[6] = __src[6];
  __dst[7] = __src[7];
  __dst[9] = __src[9];
  __dst[8] = __src[8];
  __dst[2] = __src[2];
  __dst[3] = __src[3];
  __dst[5] = __src[5];
  __dst[4] = __src[4];
  __dst[1] = __src[1];
  __dst[0] = __src[0];
  v33[10] = v35[10];
  v33[11] = v35[11];
  *(void *)&v33[12] = *(void *)&v35[12];
  v33[6] = v35[6];
  v33[7] = v35[7];
  v33[9] = v35[9];
  v33[8] = v35[8];
  v33[2] = v35[2];
  v33[3] = v35[3];
  v33[5] = v35[5];
  v33[4] = v35[4];
  v33[1] = v35[1];
  v33[0] = v35[0];
  sub_25779AC48(v49, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  sub_25779AC48(v56, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  if (!_s22NewsLiveActivitiesCore17ActivityTextThemeV2eeoiySbAC_ACtFZ_0((uint64_t *)__dst, (uint64_t *)v33)
    || (uint64_t v21 = *((void *)&__src[11] + 1),
        uint64_t v22 = *((void *)&v35[11] + 1),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        char v23 = sub_2577EA368(v21, v22),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v23 & 1) == 0))
  {
    sub_25779AC48(v56, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
    uint64_t v12 = v49;
    goto LABEL_58;
  }
  char v24 = sub_257768514(*(uint64_t *)&__src[12], *(uint64_t *)&v35[12]);
  sub_25779AC48(v56, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  sub_25779AC48(v49, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  if ((v24 & 1) == 0) {
    return 0;
  }
LABEL_17:
  sub_257727130((uint64_t)v50, (uint64_t)v37, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v37) == 1)
  {
    sub_257727130((uint64_t)v57, (uint64_t)v42, &qword_26A030FE0);
    if (sub_257727344((uint64_t)v42) == 1) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
  sub_257727130((uint64_t)v57, (uint64_t)v42, &qword_26A030FE0);
  if (sub_257727344((uint64_t)v42) == 1)
  {
LABEL_51:
    sub_257727130((uint64_t)v50, (uint64_t)v42, &qword_26A030FE0);
    sub_257727130((uint64_t)v57, (uint64_t)v43, &qword_26A030FE0);
    sub_25779AC48(v50, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
    uint64_t v7 = v57;
    goto LABEL_52;
  }
  sub_257727130((uint64_t)v57, (uint64_t)v35, &qword_26A030FE0);
  sub_257727130((uint64_t)v50, (uint64_t)__src, &qword_26A030FE0);
  __dst[10] = __src[10];
  __dst[11] = __src[11];
  *(void *)&__dst[12] = *(void *)&__src[12];
  __dst[6] = __src[6];
  __dst[7] = __src[7];
  __dst[9] = __src[9];
  __dst[8] = __src[8];
  __dst[2] = __src[2];
  __dst[3] = __src[3];
  __dst[5] = __src[5];
  __dst[4] = __src[4];
  __dst[1] = __src[1];
  __dst[0] = __src[0];
  v33[10] = v35[10];
  v33[11] = v35[11];
  *(void *)&v33[12] = *(void *)&v35[12];
  v33[6] = v35[6];
  v33[7] = v35[7];
  v33[9] = v35[9];
  v33[8] = v35[8];
  v33[2] = v35[2];
  v33[3] = v35[3];
  v33[5] = v35[5];
  v33[4] = v35[4];
  v33[1] = v35[1];
  v33[0] = v35[0];
  sub_25779AC48(v50, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  sub_25779AC48(v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257724DC4);
  if (!_s22NewsLiveActivitiesCore17ActivityTextThemeV2eeoiySbAC_ACtFZ_0((uint64_t *)__dst, (uint64_t *)v33)
    || (uint64_t v25 = *((void *)&__src[11] + 1),
        uint64_t v26 = *((void *)&v35[11] + 1),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        char v27 = sub_2577EA368(v25, v26),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v27 & 1) == 0))
  {
    sub_25779AC48(v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
    uint64_t v12 = v50;
    goto LABEL_58;
  }
  char v28 = sub_257768514(*(uint64_t *)&__src[12], *(uint64_t *)&v35[12]);
  sub_25779AC48(v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  sub_25779AC48(v50, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_257725934);
  if ((v28 & 1) == 0) {
    return 0;
  }
LABEL_19:
  sub_257727130((uint64_t)v51, (uint64_t)__src, &qword_26A0321F0);
  if (sub_2577FFF08((uint64_t)__src) == 1)
  {
    sub_257727130((uint64_t)v58, (uint64_t)v42, &qword_26A0321F0);
    if (sub_2577FFF08((uint64_t)v42) == 1) {
      return 1;
    }
    goto LABEL_62;
  }
  sub_257727130((uint64_t)v51, (uint64_t)v35, &qword_26A0321F0);
  sub_257727130((uint64_t)v58, (uint64_t)v42, &qword_26A0321F0);
  if (sub_2577FFF08((uint64_t)v42) == 1)
  {
    memcpy(v33, v35, sizeof(v33));
    sub_257727130((uint64_t)v51, (uint64_t)__dst, &qword_26A0321F0);
    sub_257B40E30((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
    sub_257B40E30((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
    sub_257B40E30((uint64_t)v33, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_25780000C);
LABEL_62:
    sub_257727130((uint64_t)v51, (uint64_t)v42, &qword_26A0321F0);
    sub_257727130((uint64_t)v58, (uint64_t)v44, &qword_26A0321F0);
    uint64_t v5 = v58;
    goto LABEL_7;
  }
  sub_257727130((uint64_t)v58, (uint64_t)v32, &qword_26A0321F0);
  memcpy(v31, v32, sizeof(v31));
  sub_257727130((uint64_t)v51, (uint64_t)v33, &qword_26A0321F0);
  sub_257B2BBA0(v51, sub_2578D3DCC);
  sub_257B40E30((uint64_t)v33, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_257800338);
  BOOL v30 = _s22NewsLiveActivitiesCore27ActivityFlexibleUpdateThemeV7GraphicV2eeoiySbAE_AEtFZ_0((uint64_t)v35);
  memcpy(__dst, v35, sizeof(__dst));
  sub_257B40E30((uint64_t)__dst, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))sub_25780000C);
  sub_257B2BBA0(v51, sub_2578D6E98);
  return v30;
}

BOOL _s22NewsLiveActivitiesCore22ActivityFlexibleUpdateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v80 = &v73[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035FD8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v79 = &v73[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  char v11 = &v73[-v10];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v75 = &v73[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v77 = &v73[-v16];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v78 = &v73[-v18];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v73[-v20];
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  char v24 = &v73[-v23];
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = &v73[-v25];
  uint64_t v81 = a1;
  sub_2577263B4(a1, (uint64_t)&v73[-v25], &qword_26A032BE8);
  uint64_t v82 = a2;
  sub_2577263B4(a2, (uint64_t)v24, &qword_26A032BE8);
  uint64_t v76 = v7;
  uint64_t v27 = (uint64_t)&v11[*(int *)(v7 + 48)];
  sub_2577263B4((uint64_t)v26, (uint64_t)v11, &qword_26A032BE8);
  sub_2577263B4((uint64_t)v24, v27, &qword_26A032BE8);
  char v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v28((uint64_t)v11, 1, v4) == 1)
  {
    sub_2577270D4((uint64_t)v24, &qword_26A032BE8);
    sub_2577270D4((uint64_t)v26, &qword_26A032BE8);
    if (v28(v27, 1, v4) == 1)
    {
      sub_2577270D4((uint64_t)v11, &qword_26A032BE8);
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v29 = v11;
LABEL_7:
    sub_2577270D4((uint64_t)v29, &qword_26A035FD8);
    return 0;
  }
  sub_2577263B4((uint64_t)v11, (uint64_t)v21, &qword_26A032BE8);
  if (v28(v27, 1, v4) == 1)
  {
    sub_2577270D4((uint64_t)v24, &qword_26A032BE8);
    sub_2577270D4((uint64_t)v26, &qword_26A032BE8);
    sub_257B2F584((uint64_t)v21, type metadata accessor for ActivityFlexibleUpdate.Graphic);
    goto LABEL_6;
  }
  uint64_t v31 = v27;
  char v32 = v80;
  sub_257912DD4(v31, (uint64_t)v80);
  int updated = _s22NewsLiveActivitiesCore22ActivityFlexibleUpdateV7GraphicV2eeoiySbAE_AEtFZ_0((uint64_t)v21, (uint64_t)v32);
  sub_257B2F584((uint64_t)v32, type metadata accessor for ActivityFlexibleUpdate.Graphic);
  sub_2577270D4((uint64_t)v24, &qword_26A032BE8);
  sub_2577270D4((uint64_t)v26, &qword_26A032BE8);
  sub_257B2F584((uint64_t)v21, type metadata accessor for ActivityFlexibleUpdate.Graphic);
  sub_2577270D4((uint64_t)v11, &qword_26A032BE8);
  if ((updated & 1) == 0) {
    return 0;
  }
LABEL_11:
  char v33 = (int *)type metadata accessor for ActivityFlexibleUpdate(0);
  uint64_t v34 = v33[5];
  uint64_t v36 = v81;
  uint64_t v35 = v82;
  v37 = (void *)(v81 + v34);
  uint64_t v38 = *(void *)(v81 + v34 + 8);
  long long v39 = (void *)(v82 + v34);
  uint64_t v40 = v39[1];
  if (v38)
  {
    if (!v40) {
      return 0;
    }
    if (*v37 != *v39 || v38 != v40)
    {
      char v41 = sub_257B45BA0();
      BOOL result = 0;
      if ((v41 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v40)
  {
    return 0;
  }
  uint64_t v42 = v33[6];
  long long v43 = (void *)(v36 + v42);
  uint64_t v44 = *(void *)(v36 + v42 + 8);
  long long v45 = (void *)(v35 + v42);
  uint64_t v46 = v45[1];
  if (v44)
  {
    if (!v46) {
      return 0;
    }
    if (*v43 != *v45 || v44 != v46)
    {
      char v47 = sub_257B45BA0();
      BOOL result = 0;
      if ((v47 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v46)
  {
    return 0;
  }
  uint64_t v48 = v33[7];
  long long v49 = (void *)(v36 + v48);
  uint64_t v50 = *(void *)(v36 + v48 + 8);
  uint64_t v51 = (void *)(v35 + v48);
  uint64_t v52 = v51[1];
  if (v50)
  {
    if (!v52) {
      return 0;
    }
    if (*v49 != *v51 || v50 != v52)
    {
      char v53 = sub_257B45BA0();
      BOOL result = 0;
      if ((v53 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v52)
  {
    return 0;
  }
  uint64_t v54 = v33[8];
  v55 = (void *)(v36 + v54);
  uint64_t v56 = *(void *)(v36 + v54 + 8);
  uint64_t v57 = (void *)(v35 + v54);
  uint64_t v58 = v57[1];
  if (v56)
  {
    if (!v58) {
      return 0;
    }
    if (*v55 != *v57 || v56 != v58)
    {
      char v59 = sub_257B45BA0();
      BOOL result = 0;
      if ((v59 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v58)
  {
    return 0;
  }
  uint64_t v60 = v33[9];
  v61 = (void *)(v36 + v60);
  uint64_t v62 = *(void *)(v36 + v60 + 8);
  v63 = (void *)(v35 + v60);
  uint64_t v64 = v63[1];
  if (!v62)
  {
    if (v64) {
      return 0;
    }
LABEL_46:
    v66 = v78;
    sub_2577263B4(v36 + v33[10], (uint64_t)v78, &qword_26A032BE8);
    v67 = v77;
    sub_2577263B4(v35 + v33[10], (uint64_t)v77, &qword_26A032BE8);
    v68 = v79;
    uint64_t v69 = (uint64_t)&v79[*(int *)(v76 + 48)];
    sub_2577263B4((uint64_t)v66, (uint64_t)v79, &qword_26A032BE8);
    sub_2577263B4((uint64_t)v67, v69, &qword_26A032BE8);
    if (v28((uint64_t)v68, 1, v4) == 1)
    {
      sub_2577270D4((uint64_t)v67, &qword_26A032BE8);
      sub_2577270D4((uint64_t)v66, &qword_26A032BE8);
      if (v28(v69, 1, v4) == 1)
      {
        sub_2577270D4((uint64_t)v79, &qword_26A032BE8);
        return 1;
      }
    }
    else
    {
      v70 = v75;
      sub_2577263B4((uint64_t)v79, (uint64_t)v75, &qword_26A032BE8);
      if (v28(v69, 1, v4) != 1)
      {
        v71 = v80;
        sub_257912DD4(v69, (uint64_t)v80);
        char v72 = _s22NewsLiveActivitiesCore22ActivityFlexibleUpdateV7GraphicV2eeoiySbAE_AEtFZ_0((uint64_t)v70, (uint64_t)v71);
        sub_257B2F584((uint64_t)v71, type metadata accessor for ActivityFlexibleUpdate.Graphic);
        sub_2577270D4((uint64_t)v67, &qword_26A032BE8);
        sub_2577270D4((uint64_t)v66, &qword_26A032BE8);
        sub_257B2F584((uint64_t)v70, type metadata accessor for ActivityFlexibleUpdate.Graphic);
        sub_2577270D4((uint64_t)v79, &qword_26A032BE8);
        return (v72 & 1) != 0;
      }
      sub_2577270D4((uint64_t)v67, &qword_26A032BE8);
      sub_2577270D4((uint64_t)v66, &qword_26A032BE8);
      sub_257B2F584((uint64_t)v70, type metadata accessor for ActivityFlexibleUpdate.Graphic);
    }
    uint64_t v29 = v79;
    goto LABEL_7;
  }
  if (!v64) {
    return 0;
  }
  if (*v61 == *v63 && v62 == v64) {
    goto LABEL_46;
  }
  char v65 = sub_257B45BA0();
  BOOL result = 0;
  if (v65) {
    goto LABEL_46;
  }
  return result;
}

#error "257B2BCD8: call analysis failed (funcsize=88)"

uint64_t sub_257B2BD00(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  long long v9 = *(_OWORD *)(a1 + 304);
  long long v10 = *(_OWORD *)(a1 + 320);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v8 = *(_OWORD *)(a1 + 288);
  long long v5 = *(_OWORD *)(a1 + 240);
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v4 = *(_OWORD *)(a1 + 208);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v4,
    *((void *)&v4 + 1),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    v8,
    *((void *)&v8 + 1),
    v9,
    *((void *)&v9 + 1),
    v10,
    *((void *)&v10 + 1),
    *(void *)(a1 + 336),
    *(void *)(a1 + 344));
  return a1;
}

uint64_t _s22NewsLiveActivitiesCore22ActivityFlexibleUpdateV7GraphicV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = &v45[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032838);
  MEMORY[0x270FA5388](v8);
  long long v10 = &v45[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = &v45[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = &v45[-v16];
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v45[-v18];
  if ((static ActivityAsset.== infix(_:_:)(a1, a2) & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v48 = v14;
  uint64_t v49 = v5;
  char v47 = v7;
  uint64_t v50 = v10;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  uint64_t v21 = *(int *)(v20 + 28);
  uint64_t v22 = *(void *)(a1 + v21);
  uint64_t v23 = *(void *)(a2 + v21);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v24 = sub_2577EA368(v22, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0
    || (sub_2577688B0(*(void *)(a1 + *(int *)(v20 + 32)), *(void *)(a2 + *(int *)(v20 + 32))) & 1) == 0)
  {
LABEL_10:
    char v32 = 0;
    return v32 & 1;
  }
  uint64_t v25 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v26 = *(int *)(v25 + 20);
  int v27 = *(unsigned __int8 *)(a1 + v26);
  int v28 = *(unsigned __int8 *)(a2 + v26);
  if (!v27)
  {
    unint64_t v29 = 0xE500000000000000;
    uint64_t v30 = 0x6C6C616D73;
    if (!v28) {
      goto LABEL_15;
    }
LABEL_7:
    if (v28 == 1)
    {
      unint64_t v31 = 0xE600000000000000;
      if (v30 != 0x6D756964656DLL) {
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v31 = 0xE500000000000000;
      if (v30 != 0x656772616CLL) {
        goto LABEL_20;
      }
    }
    goto LABEL_18;
  }
  if (v27 != 1)
  {
    unint64_t v29 = 0xE500000000000000;
    uint64_t v30 = 0x656772616CLL;
    if (!v28) {
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  unint64_t v29 = 0xE600000000000000;
  uint64_t v30 = 0x6D756964656DLL;
  if (v28) {
    goto LABEL_7;
  }
LABEL_15:
  unint64_t v31 = 0xE500000000000000;
  if (v30 != 0x6C6C616D73)
  {
LABEL_20:
    int v46 = sub_257B45BA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v32 = 0;
    if ((v46 & 1) == 0) {
      return v32 & 1;
    }
    goto LABEL_21;
  }
LABEL_18:
  if (v29 != v31) {
    goto LABEL_20;
  }
  swift_bridgeObjectRelease_n();
LABEL_21:
  sub_2577263B4(a1 + *(int *)(v25 + 24), (uint64_t)v19, &qword_26A031028);
  sub_2577263B4(a2 + *(int *)(v25 + 24), (uint64_t)v17, &qword_26A031028);
  uint64_t v34 = (uint64_t)v50;
  uint64_t v35 = (uint64_t)&v50[*(int *)(v8 + 48)];
  sub_2577263B4((uint64_t)v19, (uint64_t)v50, &qword_26A031028);
  sub_2577263B4((uint64_t)v17, v35, &qword_26A031028);
  uint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48);
  if (v36(v34, 1, v4) == 1)
  {
    sub_2577270D4((uint64_t)v17, &qword_26A031028);
    sub_2577270D4((uint64_t)v19, &qword_26A031028);
    int v37 = v36(v35, 1, v4);
    if (v37 == 1) {
      uint64_t v38 = &qword_26A031028;
    }
    else {
      uint64_t v38 = &qword_26A032838;
    }
    if (v37 == 1) {
      char v32 = -1;
    }
    else {
      char v32 = 0;
    }
  }
  else
  {
    uint64_t v39 = (uint64_t)v48;
    sub_2577263B4(v34, (uint64_t)v48, &qword_26A031028);
    if (v36(v35, 1, v4) == 1)
    {
      char v32 = 0;
      uint64_t v38 = &qword_26A032838;
    }
    else
    {
      uint64_t v40 = (uint64_t)v47;
      sub_257727130(v35, (uint64_t)v47, (uint64_t *)&unk_26B2DD028);
      if ((static ActivityAsset.== infix(_:_:)(v39, v40) & 1) == 0) {
        goto LABEL_34;
      }
      uint64_t v41 = *(int *)(v20 + 28);
      uint64_t v42 = *(void *)(v39 + v41);
      uint64_t v43 = *(void *)&v47[v41];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v44 = sub_2577EA368(v42, v43);
      swift_bridgeObjectRelease();
      uint64_t v40 = (uint64_t)v47;
      swift_bridgeObjectRelease();
      if ((v44 & 1) == 0) {
        goto LABEL_34;
      }
      if (sub_2577688B0(*(void *)(v39 + *(int *)(v20 + 32)), *(void *)(v40 + *(int *)(v20 + 32)))) {
        char v32 = 1;
      }
      else {
LABEL_34:
      }
        char v32 = 0;
      sub_2577270D4(v40, (uint64_t *)&unk_26B2DD028);
      uint64_t v38 = &qword_26A031028;
      uint64_t v39 = (uint64_t)v48;
    }
    sub_2577270D4((uint64_t)v17, &qword_26A031028);
    sub_2577270D4((uint64_t)v19, &qword_26A031028);
    sub_2577270D4(v39, (uint64_t *)&unk_26B2DD028);
  }
  sub_2577270D4((uint64_t)v50, v38);
  return v32 & 1;
}

unint64_t sub_257B2C2E8()
{
  unint64_t result = qword_26A035F30;
  if (!qword_26A035F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F30);
  }
  return result;
}

uint64_t sub_257B2C33C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_257B2C384()
{
  unint64_t result = qword_26A035F38;
  if (!qword_26A035F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F38);
  }
  return result;
}

uint64_t sub_257B2C3D8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B2DD028);
    sub_257B2C33C(&qword_26A0327B8, (void (*)(uint64_t))type metadata accessor for ActivityAsset);
    sub_257B2C33C(&qword_26A0327C0, (void (*)(uint64_t))type metadata accessor for ActivityAsset);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_257B2C4A4()
{
  unint64_t result = qword_26A035F48;
  if (!qword_26A035F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F48);
  }
  return result;
}

uint64_t sub_257B2C4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_257B2C55C()
{
  unint64_t result = qword_26A035F58;
  if (!qword_26A035F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F58);
  }
  return result;
}

unint64_t sub_257B2C5B0()
{
  unint64_t result = qword_26A035F60;
  if (!qword_26A035F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F60);
  }
  return result;
}

unint64_t sub_257B2C604()
{
  unint64_t result = qword_26A035F70;
  if (!qword_26A035F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F70);
  }
  return result;
}

uint64_t sub_257B2C658()
{
  return sub_257B2C33C(&qword_26A035F78, (void (*)(uint64_t))type metadata accessor for ActivityFlexibleUpdate);
}

unint64_t sub_257B2C6A4()
{
  unint64_t result = qword_26A035F80;
  if (!qword_26A035F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F80);
  }
  return result;
}

uint64_t sub_257B2C6F8()
{
  return sub_257B2C33C(&qword_26A035F88, (void (*)(uint64_t))type metadata accessor for ActivityFlexibleUpdate.Graphic);
}

unint64_t sub_257B2C744()
{
  unint64_t result = qword_26A035F90;
  if (!qword_26A035F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F90);
  }
  return result;
}

unint64_t sub_257B2C79C()
{
  unint64_t result = qword_26A035F98;
  if (!qword_26A035F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035F98);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ActivityFlexibleUpdate(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(void, void, void))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      type metadata accessor for ActivityAsset();
      v80 = v9;
      uint64_t v82 = v8;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        uint64_t v13 = sub_257B43740();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(uint64_t *)((char *)a1 + *(int *)(v14 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v14 + 28));
          *(uint64_t *)((char *)a1 + *(int *)(v14 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v14 + 32));
          uint64_t v15 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(uint64_t *)((char *)a1 + *(int *)(v15 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v15 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v16 = *a2;
        uint64_t v17 = a2[1];
        char v18 = *((unsigned char *)a2 + 16);
        sub_25772F9EC();
        *a1 = v16;
        a1[1] = v17;
        *((unsigned char *)a1 + 16) = v18;
        *(_WORD *)((char *)a1 + 17) = *(_WORD *)((char *)a2 + 17);
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
      *(uint64_t *)((char *)a1 + *(int *)(v19 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v19 + 28));
      *(uint64_t *)((char *)a1 + *(int *)(v19 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v19 + 32));
      *((unsigned char *)a1 + *(int *)(v7 + 20)) = *((unsigned char *)a2 + *(int *)(v7 + 20));
      uint64_t v20 = *(int *)(v7 + 24);
      uint64_t v21 = (uint64_t *)((char *)a1 + v20);
      uint64_t v22 = (uint64_t *)((char *)a2 + v20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
      uint64_t v24 = *(void *)(v23 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
        memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          type metadata accessor for URLAssetConfiguration.Format(0);
          int v26 = swift_getEnumCaseMultiPayload();
          uint64_t v27 = sub_257B43740();
          (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v27 - 8) + 16))(v21, v22, v27);
          if (v26 == 1)
          {
            uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
            *(void *)((char *)v21 + *(int *)(v28 + 28)) = *(uint64_t *)((char *)v22 + *(int *)(v28 + 28));
            *(void *)((char *)v21 + *(int *)(v28 + 32)) = *(uint64_t *)((char *)v22 + *(int *)(v28 + 32));
            uint64_t v29 = type metadata accessor for URLAssetConfiguration.Recipe(0);
            *(void *)((char *)v21 + *(int *)(v29 + 20)) = *(uint64_t *)((char *)v22 + *(int *)(v29 + 20));
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          uint64_t v30 = v22[1];
          uint64_t v79 = *v22;
          char v78 = *((unsigned char *)v22 + 16);
          sub_25772F9EC();
          *uint64_t v21 = v79;
          v21[1] = v30;
          *((unsigned char *)v21 + 16) = v78;
          *(_WORD *)((char *)v21 + 17) = *(_WORD *)((char *)v22 + 17);
        }
        swift_storeEnumTagMultiPayload();
        *(void *)((char *)v21 + *(int *)(v19 + 28)) = *(uint64_t *)((char *)v22 + *(int *)(v19 + 28));
        *(void *)((char *)v21 + *(int *)(v19 + 32)) = *(uint64_t *)((char *)v22 + *(int *)(v19 + 32));
        unint64_t v31 = *(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v31(v21, 0, 1, v23);
      }
      uint64_t v9 = v80;
      uint64_t v8 = v82;
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v82 + 56))(a1, 0, 1, v7);
    }
    uint64_t v32 = a3[5];
    uint64_t v33 = a3[6];
    uint64_t v34 = (uint64_t *)((char *)a1 + v32);
    uint64_t v35 = (uint64_t *)((char *)a2 + v32);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    int v37 = (uint64_t *)((char *)a1 + v33);
    uint64_t v38 = (uint64_t *)((char *)a2 + v33);
    uint64_t v39 = v38[1];
    void *v37 = *v38;
    v37[1] = v39;
    uint64_t v40 = a3[7];
    uint64_t v41 = a3[8];
    uint64_t v42 = (uint64_t *)((char *)a1 + v40);
    uint64_t v43 = (uint64_t *)((char *)a2 + v40);
    uint64_t v44 = v43[1];
    *uint64_t v42 = *v43;
    v42[1] = v44;
    long long v45 = (uint64_t *)((char *)a1 + v41);
    int v46 = (uint64_t *)((char *)a2 + v41);
    uint64_t v47 = v46[1];
    *long long v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = a3[9];
    uint64_t v49 = a3[10];
    uint64_t v50 = (uint64_t *)((char *)a1 + v48);
    uint64_t v51 = (uint64_t *)((char *)a2 + v48);
    uint64_t v52 = v51[1];
    char v53 = (uint64_t *)((char *)a2 + v49);
    uint64_t v54 = (uint64_t *)((char *)a1 + v49);
    *uint64_t v50 = *v51;
    v50[1] = v52;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9(v53, 1, v7))
    {
      uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
      memcpy(v54, v53, *(void *)(*(void *)(v55 - 8) + 64));
    }
    else
    {
      type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v56 = swift_getEnumCaseMultiPayload();
        uint64_t v57 = sub_257B43740();
        (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v57 - 8) + 16))(v54, v53, v57);
        if (v56 == 1)
        {
          uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)((char *)v54 + *(int *)(v58 + 28)) = *(uint64_t *)((char *)v53 + *(int *)(v58 + 28));
          *(void *)((char *)v54 + *(int *)(v58 + 32)) = *(uint64_t *)((char *)v53 + *(int *)(v58 + 32));
          uint64_t v59 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)((char *)v54 + *(int *)(v59 + 20)) = *(uint64_t *)((char *)v53 + *(int *)(v59 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v60 = *v53;
        uint64_t v61 = v53[1];
        char v62 = *((unsigned char *)v53 + 16);
        sub_25772F9EC();
        *uint64_t v54 = v60;
        v54[1] = v61;
        *((unsigned char *)v54 + 16) = v62;
        *(_WORD *)((char *)v54 + 17) = *(_WORD *)((char *)v53 + 17);
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
      *(void *)((char *)v54 + *(int *)(v63 + 28)) = *(uint64_t *)((char *)v53 + *(int *)(v63 + 28));
      *(void *)((char *)v54 + *(int *)(v63 + 32)) = *(uint64_t *)((char *)v53 + *(int *)(v63 + 32));
      *((unsigned char *)v54 + *(int *)(v7 + 20)) = *((unsigned char *)v53 + *(int *)(v7 + 20));
      uint64_t v64 = *(int *)(v7 + 24);
      char v65 = (void *)((char *)v54 + v64);
      v66 = (uint64_t *)((char *)v53 + v64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
      uint64_t v68 = *(void *)(v67 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v68 + 48))(v66, 1, v67))
      {
        uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
        memcpy(v65, v66, *(void *)(*(void *)(v69 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          type metadata accessor for URLAssetConfiguration.Format(0);
          int v70 = swift_getEnumCaseMultiPayload();
          uint64_t v71 = sub_257B43740();
          (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v71 - 8) + 16))(v65, v66, v71);
          if (v70 == 1)
          {
            uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
            *(void *)((char *)v65 + *(int *)(v72 + 28)) = *(uint64_t *)((char *)v66 + *(int *)(v72 + 28));
            *(void *)((char *)v65 + *(int *)(v72 + 32)) = *(uint64_t *)((char *)v66 + *(int *)(v72 + 32));
            uint64_t v73 = type metadata accessor for URLAssetConfiguration.Recipe(0);
            *(void *)((char *)v65 + *(int *)(v73 + 20)) = *(uint64_t *)((char *)v66 + *(int *)(v73 + 20));
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          uint64_t v81 = *v66;
          uint64_t v83 = v8;
          uint64_t v74 = v66[1];
          char v75 = *((unsigned char *)v66 + 16);
          sub_25772F9EC();
          *char v65 = v81;
          v65[1] = v74;
          uint64_t v8 = v83;
          *((unsigned char *)v65 + 16) = v75;
          *(_WORD *)((char *)v65 + 17) = *(_WORD *)((char *)v66 + 17);
        }
        swift_storeEnumTagMultiPayload();
        *(void *)((char *)v65 + *(int *)(v63 + 28)) = *(uint64_t *)((char *)v66 + *(int *)(v63 + 28));
        *(void *)((char *)v65 + *(int *)(v63 + 32)) = *(uint64_t *)((char *)v66 + *(int *)(v63 + 32));
        uint64_t v76 = *(void (**)(void *, void, uint64_t, uint64_t))(v68 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v76(v65, 0, 1, v67);
      }
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v54, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ActivityFlexibleUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  int v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  if (!v5(a1, 1, v4))
  {
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v7 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
      if (EnumCaseMultiPayload == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for URLAssetConfiguration.Recipe(0);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_25773042C();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = a1 + *(int *)(v4 + 24);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v10 = swift_getEnumCaseMultiPayload();
        uint64_t v11 = sub_257B43740();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v8, v11);
        if (v10 == 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for URLAssetConfiguration.Recipe(0);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        sub_25773042C();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = a1 + *(int *)(a2 + 40);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v5)(v12, 1, v4);
  if (!result)
  {
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v14 = swift_getEnumCaseMultiPayload();
      uint64_t v15 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v12, v15);
      if (v14 == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for URLAssetConfiguration.Recipe(0);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_25773042C();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = v12 + *(int *)(v4 + 24);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v16, 1, v17);
    if (!result)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v18 = swift_getEnumCaseMultiPayload();
        uint64_t v19 = sub_257B43740();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v16, v19);
        if (v18 == 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for URLAssetConfiguration.Recipe(0);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        sub_25773042C();
      }
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void *initializeWithCopy for ActivityFlexibleUpdate(void *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(void, void, void))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    type metadata accessor for ActivityAsset();
    char v78 = v8;
    uint64_t v80 = v7;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v11 = sub_257B43740();
      (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)((char *)a1 + *(int *)(v12 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v12 + 28));
        *(void *)((char *)a1 + *(int *)(v12 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v12 + 32));
        uint64_t v13 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)((char *)a1 + *(int *)(v13 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v14 = *a2;
      uint64_t v15 = a2[1];
      char v16 = *((unsigned char *)a2 + 16);
      sub_25772F9EC();
      *a1 = v14;
      a1[1] = v15;
      *((unsigned char *)a1 + 16) = v16;
      *(_WORD *)((char *)a1 + 17) = *(_WORD *)((char *)a2 + 17);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
    *(void *)((char *)a1 + *(int *)(v17 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v17 + 28));
    *(void *)((char *)a1 + *(int *)(v17 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v17 + 32));
    *((unsigned char *)a1 + *(int *)(v6 + 20)) = *((unsigned char *)a2 + *(int *)(v6 + 20));
    uint64_t v18 = *(int *)(v6 + 24);
    uint64_t v19 = (void *)((char *)a1 + v18);
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v24 = swift_getEnumCaseMultiPayload();
        uint64_t v25 = sub_257B43740();
        (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v25 - 8) + 16))(v19, v20, v25);
        if (v24 == 1)
        {
          uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)((char *)v19 + *(int *)(v26 + 28)) = *(uint64_t *)((char *)v20 + *(int *)(v26 + 28));
          *(void *)((char *)v19 + *(int *)(v26 + 32)) = *(uint64_t *)((char *)v20 + *(int *)(v26 + 32));
          uint64_t v27 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)((char *)v19 + *(int *)(v27 + 20)) = *(uint64_t *)((char *)v20 + *(int *)(v27 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v28 = v20[1];
        uint64_t v77 = *v20;
        char v76 = *((unsigned char *)v20 + 16);
        sub_25772F9EC();
        void *v19 = v77;
        v19[1] = v28;
        *((unsigned char *)v19 + 16) = v76;
        *(_WORD *)((char *)v19 + 17) = *(_WORD *)((char *)v20 + 17);
      }
      swift_storeEnumTagMultiPayload();
      *(void *)((char *)v19 + *(int *)(v17 + 28)) = *(uint64_t *)((char *)v20 + *(int *)(v17 + 28));
      *(void *)((char *)v19 + *(int *)(v17 + 32)) = *(uint64_t *)((char *)v20 + *(int *)(v17 + 32));
      uint64_t v29 = *(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29(v19, 0, 1, v21);
    }
    uint64_t v8 = v78;
    uint64_t v7 = v80;
    (*(void (**)(void *, void, uint64_t, uint64_t))(v80 + 56))(a1, 0, 1, v6);
  }
  uint64_t v30 = a3[5];
  uint64_t v31 = a3[6];
  uint64_t v32 = (void *)((char *)a1 + v30);
  uint64_t v33 = (uint64_t *)((char *)a2 + v30);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = (void *)((char *)a1 + v31);
  uint64_t v36 = (uint64_t *)((char *)a2 + v31);
  uint64_t v37 = v36[1];
  *uint64_t v35 = *v36;
  v35[1] = v37;
  uint64_t v38 = a3[7];
  uint64_t v39 = a3[8];
  uint64_t v40 = (void *)((char *)a1 + v38);
  uint64_t v41 = (uint64_t *)((char *)a2 + v38);
  uint64_t v42 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v42;
  uint64_t v43 = (void *)((char *)a1 + v39);
  uint64_t v44 = (uint64_t *)((char *)a2 + v39);
  uint64_t v45 = v44[1];
  *uint64_t v43 = *v44;
  v43[1] = v45;
  uint64_t v46 = a3[9];
  uint64_t v47 = a3[10];
  uint64_t v48 = (void *)((char *)a1 + v46);
  uint64_t v49 = (uint64_t *)((char *)a2 + v46);
  uint64_t v50 = v49[1];
  uint64_t v51 = (uint64_t *)((char *)a2 + v47);
  uint64_t v52 = (void *)((char *)a1 + v47);
  *uint64_t v48 = *v49;
  v48[1] = v50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v8(v51, 1, v6))
  {
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
    memcpy(v52, v51, *(void *)(*(void *)(v53 - 8) + 64));
  }
  else
  {
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v54 = swift_getEnumCaseMultiPayload();
      uint64_t v55 = sub_257B43740();
      (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v55 - 8) + 16))(v52, v51, v55);
      if (v54 == 1)
      {
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)((char *)v52 + *(int *)(v56 + 28)) = *(uint64_t *)((char *)v51 + *(int *)(v56 + 28));
        *(void *)((char *)v52 + *(int *)(v56 + 32)) = *(uint64_t *)((char *)v51 + *(int *)(v56 + 32));
        uint64_t v57 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)((char *)v52 + *(int *)(v57 + 20)) = *(uint64_t *)((char *)v51 + *(int *)(v57 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v58 = *v51;
      uint64_t v59 = v51[1];
      char v60 = *((unsigned char *)v51 + 16);
      sub_25772F9EC();
      *uint64_t v52 = v58;
      v52[1] = v59;
      *((unsigned char *)v52 + 16) = v60;
      *(_WORD *)((char *)v52 + 17) = *(_WORD *)((char *)v51 + 17);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
    *(void *)((char *)v52 + *(int *)(v61 + 28)) = *(uint64_t *)((char *)v51 + *(int *)(v61 + 28));
    *(void *)((char *)v52 + *(int *)(v61 + 32)) = *(uint64_t *)((char *)v51 + *(int *)(v61 + 32));
    *((unsigned char *)v52 + *(int *)(v6 + 20)) = *((unsigned char *)v51 + *(int *)(v6 + 20));
    uint64_t v62 = *(int *)(v6 + 24);
    uint64_t v63 = (void *)((char *)v52 + v62);
    uint64_t v64 = (uint64_t *)((char *)v51 + v62);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
    uint64_t v66 = *(void *)(v65 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v66 + 48))(v64, 1, v65))
    {
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(v63, v64, *(void *)(*(void *)(v67 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v68 = swift_getEnumCaseMultiPayload();
        uint64_t v69 = sub_257B43740();
        (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v69 - 8) + 16))(v63, v64, v69);
        if (v68 == 1)
        {
          uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)((char *)v63 + *(int *)(v70 + 28)) = *(uint64_t *)((char *)v64 + *(int *)(v70 + 28));
          *(void *)((char *)v63 + *(int *)(v70 + 32)) = *(uint64_t *)((char *)v64 + *(int *)(v70 + 32));
          uint64_t v71 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)((char *)v63 + *(int *)(v71 + 20)) = *(uint64_t *)((char *)v64 + *(int *)(v71 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v79 = *v64;
        uint64_t v81 = v7;
        uint64_t v72 = v64[1];
        char v73 = *((unsigned char *)v64 + 16);
        sub_25772F9EC();
        void *v63 = v79;
        v63[1] = v72;
        uint64_t v7 = v81;
        *((unsigned char *)v63 + 16) = v73;
        *(_WORD *)((char *)v63 + 17) = *(_WORD *)((char *)v64 + 17);
      }
      swift_storeEnumTagMultiPayload();
      *(void *)((char *)v63 + *(int *)(v61 + 28)) = *(uint64_t *)((char *)v64 + *(int *)(v61 + 28));
      *(void *)((char *)v63 + *(int *)(v61 + 32)) = *(uint64_t *)((char *)v64 + *(int *)(v61 + 32));
      uint64_t v74 = *(void (**)(void *, void, uint64_t, uint64_t))(v66 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v74(v63, 0, 1, v65);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v52, 0, 1, v6);
  }
  return a1;
}

uint64_t assignWithCopy for ActivityFlexibleUpdate(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8((uint64_t)a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v150 = v7;
      type metadata accessor for ActivityAsset();
      v148 = v8;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        uint64_t v12 = sub_257B43740();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)(a1 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 28));
          *(void *)(a1 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 32));
          uint64_t v14 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)(a1 + *(int *)(v14 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v14 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v20 = *a2;
        uint64_t v21 = a2[1];
        char v22 = *((unsigned char *)a2 + 16);
        sub_25772F9EC();
        *(void *)a1 = v20;
        *(void *)(a1 + 8) = v21;
        *(unsigned char *)(a1 + 16) = v22;
        *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
        *(unsigned char *)(a1 + 18) = *((unsigned char *)a2 + 18);
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
      *(void *)(a1 + *(int *)(v23 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v23 + 28));
      *(void *)(a1 + *(int *)(v23 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v23 + 32));
      *(unsigned char *)(a1 + *(int *)(v6 + 20)) = *((unsigned char *)a2 + *(int *)(v6 + 20));
      uint64_t v24 = *(int *)(v6 + 24);
      uint64_t v25 = (void *)(a1 + v24);
      uint64_t v26 = (uint64_t *)((char *)a2 + v24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
      uint64_t v28 = *(void *)(v27 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
        memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        uint64_t v145 = v28;
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          type metadata accessor for URLAssetConfiguration.Format(0);
          int v30 = swift_getEnumCaseMultiPayload();
          uint64_t v31 = sub_257B43740();
          (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v31 - 8) + 16))(v25, v26, v31);
          if (v30 == 1)
          {
            uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
            *(void *)((char *)v25 + *(int *)(v32 + 28)) = *(uint64_t *)((char *)v26 + *(int *)(v32 + 28));
            *(void *)((char *)v25 + *(int *)(v32 + 32)) = *(uint64_t *)((char *)v26 + *(int *)(v32 + 32));
            uint64_t v33 = type metadata accessor for URLAssetConfiguration.Recipe(0);
            *(void *)((char *)v25 + *(int *)(v33 + 20)) = *(uint64_t *)((char *)v26 + *(int *)(v33 + 20));
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          uint64_t v37 = v26[1];
          uint64_t v143 = *v26;
          char v141 = *((unsigned char *)v26 + 16);
          sub_25772F9EC();
          *uint64_t v25 = v143;
          v25[1] = v37;
          *((unsigned char *)v25 + 16) = v141;
          *((unsigned char *)v25 + 17) = *((unsigned char *)v26 + 17);
          *((unsigned char *)v25 + 18) = *((unsigned char *)v26 + 18);
        }
        swift_storeEnumTagMultiPayload();
        *(void *)((char *)v25 + *(int *)(v23 + 28)) = *(uint64_t *)((char *)v26 + *(int *)(v23 + 28));
        *(void *)((char *)v25 + *(int *)(v23 + 32)) = *(uint64_t *)((char *)v26 + *(int *)(v23 + 32));
        uint64_t v51 = *(void (**)(void *, void, uint64_t, uint64_t))(v145 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v51(v25, 0, 1, v27);
      }
      uint64_t v7 = v150;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v150 + 56))(a1, 0, 1, v6);
      uint64_t v8 = v148;
      goto LABEL_43;
    }
LABEL_8:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
    memcpy((void *)a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_43;
  }
  if (v10)
  {
    sub_257B2F584(a1, type metadata accessor for ActivityFlexibleUpdate.Graphic);
    goto LABEL_8;
  }
  v149 = v8;
  uint64_t v151 = v7;
  if ((uint64_t *)a1 != a2)
  {
    sub_257B2F584(a1, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v16 = swift_getEnumCaseMultiPayload();
      uint64_t v17 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
      if (v16 == 1)
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)(a1 + *(int *)(v18 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v18 + 28));
        *(void *)(a1 + *(int *)(v18 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v18 + 32));
        uint64_t v19 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)(a1 + *(int *)(v19 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v19 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v34 = *a2;
      uint64_t v35 = a2[1];
      char v36 = *((unsigned char *)a2 + 16);
      sub_25772F9EC();
      *(void *)a1 = v34;
      *(void *)(a1 + 8) = v35;
      *(unsigned char *)(a1 + 16) = v36;
      *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
      *(unsigned char *)(a1 + 18) = *((unsigned char *)a2 + 18);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)(a1 + *(int *)(v38 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v38 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v144 = v38;
  *(void *)(a1 + *(int *)(v38 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v38 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(v6 + 20)) = *((unsigned char *)a2 + *(int *)(v6 + 20));
  uint64_t v39 = *(int *)(v6 + 24);
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (uint64_t *)((char *)a2 + v39);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v142 = *(void *)(v42 - 8);
  uint64_t v43 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v142 + 48);
  v146 = v40;
  LODWORD(v40) = v43(v40, 1, v42);
  int v44 = v43(v41, 1, v42);
  if (v40)
  {
    if (v44)
    {
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(v146, v41, *(void *)(*(void *)(v45 - 8) + 64));
    }
    else
    {
      type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v47 = swift_getEnumCaseMultiPayload();
        uint64_t v48 = sub_257B43740();
        (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v48 - 8) + 16))(v146, v41, v48);
        if (v47 == 1)
        {
          uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)((char *)v146 + *(int *)(v49 + 28)) = *(uint64_t *)((char *)v41 + *(int *)(v49 + 28));
          *(void *)((char *)v146 + *(int *)(v49 + 32)) = *(uint64_t *)((char *)v41 + *(int *)(v49 + 32));
          uint64_t v50 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)((char *)v146 + *(int *)(v50 + 20)) = *(uint64_t *)((char *)v41 + *(int *)(v50 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        uint64_t v59 = v142;
        uint64_t v58 = v144;
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v56 = *v41;
        uint64_t v57 = v41[1];
        char v140 = *((unsigned char *)v41 + 16);
        sub_25772F9EC();
        void *v146 = v56;
        v146[1] = v57;
        *((unsigned char *)v146 + 16) = v140;
        *((unsigned char *)v146 + 17) = *((unsigned char *)v41 + 17);
        *((unsigned char *)v146 + 18) = *((unsigned char *)v41 + 18);
        uint64_t v59 = v142;
        uint64_t v58 = v144;
      }
      swift_storeEnumTagMultiPayload();
      *(void *)((char *)v146 + *(int *)(v58 + 28)) = *(uint64_t *)((char *)v41 + *(int *)(v58 + 28));
      *(void *)((char *)v146 + *(int *)(v58 + 32)) = *(uint64_t *)((char *)v41 + *(int *)(v58 + 32));
      char v60 = *(void (**)(void *, void, uint64_t, uint64_t))(v59 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v60(v146, 0, 1, v42);
    }
    uint64_t v8 = v149;
    uint64_t v7 = v151;
  }
  else
  {
    uint64_t v8 = v149;
    if (v44)
    {
      sub_2577270D4((uint64_t)v146, (uint64_t *)&unk_26B2DD028);
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(v146, v41, *(void *)(*(void *)(v46 - 8) + 64));
      uint64_t v7 = v151;
    }
    else
    {
      uint64_t v7 = v151;
      if ((uint64_t *)a1 != a2)
      {
        sub_257B2F584((uint64_t)v146, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
        type metadata accessor for ActivityAsset();
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          type metadata accessor for URLAssetConfiguration.Format(0);
          int v52 = swift_getEnumCaseMultiPayload();
          uint64_t v53 = sub_257B43740();
          (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v53 - 8) + 16))(v146, v41, v53);
          if (v52 == 1)
          {
            uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
            *(void *)((char *)v146 + *(int *)(v54 + 28)) = *(uint64_t *)((char *)v41 + *(int *)(v54 + 28));
            *(void *)((char *)v146 + *(int *)(v54 + 32)) = *(uint64_t *)((char *)v41 + *(int *)(v54 + 32));
            uint64_t v55 = type metadata accessor for URLAssetConfiguration.Recipe(0);
            *(void *)((char *)v146 + *(int *)(v55 + 20)) = *(uint64_t *)((char *)v41 + *(int *)(v55 + 20));
            swift_bridgeObjectRetain();
            uint64_t v7 = v151;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          uint64_t v135 = *v41;
          uint64_t v134 = v41[1];
          char v136 = *((unsigned char *)v41 + 16);
          sub_25772F9EC();
          void *v146 = v135;
          v146[1] = v134;
          uint64_t v7 = v151;
          *((unsigned char *)v146 + 16) = v136;
          *((unsigned char *)v146 + 17) = *((unsigned char *)v41 + 17);
          *((unsigned char *)v146 + 18) = *((unsigned char *)v41 + 18);
        }
        swift_storeEnumTagMultiPayload();
      }
      *(void *)((char *)v146 + *(int *)(v144 + 28)) = *(uint64_t *)((char *)v41 + *(int *)(v144 + 28));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)((char *)v146 + *(int *)(v144 + 32)) = *(uint64_t *)((char *)v41 + *(int *)(v144 + 32));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v8 = v149;
    }
  }
LABEL_43:
  uint64_t v61 = a3[5];
  uint64_t v62 = (void *)(a1 + v61);
  uint64_t v63 = (uint64_t *)((char *)a2 + v61);
  *uint64_t v62 = *v63;
  v62[1] = v63[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = a3[6];
  uint64_t v65 = (void *)(a1 + v64);
  uint64_t v66 = (uint64_t *)((char *)a2 + v64);
  *uint64_t v65 = *v66;
  v65[1] = v66[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v67 = a3[7];
  int v68 = (void *)(a1 + v67);
  uint64_t v69 = (uint64_t *)((char *)a2 + v67);
  void *v68 = *v69;
  v68[1] = v69[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v70 = a3[8];
  uint64_t v71 = (void *)(a1 + v70);
  uint64_t v72 = (uint64_t *)((char *)a2 + v70);
  void *v71 = *v72;
  v71[1] = v72[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v73 = a3[9];
  uint64_t v74 = (void *)(a1 + v73);
  char v75 = (uint64_t *)((char *)a2 + v73);
  *uint64_t v74 = *v75;
  v74[1] = v75[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v76 = a3[10];
  uint64_t v77 = a1 + v76;
  char v78 = (uint64_t *)((char *)a2 + v76);
  int v79 = v8(a1 + v76, 1, v6);
  int v80 = v8((uint64_t)v78, 1, v6);
  if (v79)
  {
    if (!v80)
    {
      uint64_t v152 = v7;
      type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v81 = swift_getEnumCaseMultiPayload();
        uint64_t v82 = sub_257B43740();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v82 - 8) + 16))(v77, v78, v82);
        if (v81 == 1)
        {
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)(v77 + *(int *)(v83 + 28)) = *(uint64_t *)((char *)v78 + *(int *)(v83 + 28));
          *(void *)(v77 + *(int *)(v83 + 32)) = *(uint64_t *)((char *)v78 + *(int *)(v83 + 32));
          uint64_t v84 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)(v77 + *(int *)(v84 + 20)) = *(uint64_t *)((char *)v78 + *(int *)(v84 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v92 = *v78;
        uint64_t v93 = v78[1];
        char v94 = *((unsigned char *)v78 + 16);
        sub_25772F9EC();
        *(void *)uint64_t v77 = v92;
        *(void *)(v77 + 8) = v93;
        *(unsigned char *)(v77 + 16) = v94;
        *(unsigned char *)(v77 + 17) = *((unsigned char *)v78 + 17);
        *(unsigned char *)(v77 + 18) = *((unsigned char *)v78 + 18);
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
      *(void *)(v77 + *(int *)(v95 + 28)) = *(uint64_t *)((char *)v78 + *(int *)(v95 + 28));
      *(void *)(v77 + *(int *)(v95 + 32)) = *(uint64_t *)((char *)v78 + *(int *)(v95 + 32));
      *(unsigned char *)(v77 + *(int *)(v6 + 20)) = *((unsigned char *)v78 + *(int *)(v6 + 20));
      uint64_t v96 = *(int *)(v6 + 24);
      v97 = (void *)(v77 + v96);
      v98 = (void **)((char *)v78 + v96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
      uint64_t v100 = *(void *)(v99 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v100 + 48))(v98, 1, v99))
      {
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
        memcpy(v97, v98, *(void *)(*(void *)(v101 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          type metadata accessor for URLAssetConfiguration.Format(0);
          int v102 = swift_getEnumCaseMultiPayload();
          uint64_t v103 = sub_257B43740();
          (*(void (**)(void *, void **, uint64_t))(*(void *)(v103 - 8) + 16))(v97, v98, v103);
          if (v102 == 1)
          {
            uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
            *(void *)((char *)v97 + *(int *)(v104 + 28)) = *(void **)((char *)v98 + *(int *)(v104 + 28));
            *(void *)((char *)v97 + *(int *)(v104 + 32)) = *(void **)((char *)v98 + *(int *)(v104 + 32));
            uint64_t v105 = type metadata accessor for URLAssetConfiguration.Recipe(0);
            *(void *)((char *)v97 + *(int *)(v105 + 20)) = *(void **)((char *)v98 + *(int *)(v105 + 20));
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          __src = *v98;
          v109 = v98[1];
          char v110 = *((unsigned char *)v98 + 16);
          sub_25772F9EC();
          void *v97 = __src;
          v97[1] = v109;
          *((unsigned char *)v97 + 16) = v110;
          *((unsigned char *)v97 + 17) = *((unsigned char *)v98 + 17);
          *((unsigned char *)v97 + 18) = *((unsigned char *)v98 + 18);
        }
        swift_storeEnumTagMultiPayload();
        *(void *)((char *)v97 + *(int *)(v95 + 28)) = *(void **)((char *)v98 + *(int *)(v95 + 28));
        *(void *)((char *)v97 + *(int *)(v95 + 32)) = *(void **)((char *)v98 + *(int *)(v95 + 32));
        v124 = *(void (**)(void *, void, uint64_t, uint64_t))(v100 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v124(v97, 0, 1, v99);
      }
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v152 + 56))(v77, 0, 1, v6);
      return a1;
    }
    goto LABEL_50;
  }
  if (v80)
  {
    sub_257B2F584(v77, type metadata accessor for ActivityFlexibleUpdate.Graphic);
LABEL_50:
    size_t v85 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8) - 8) + 64);
    v86 = (void *)v77;
    v87 = v78;
LABEL_51:
    memcpy(v86, v87, v85);
    return a1;
  }
  if ((uint64_t *)a1 != a2)
  {
    sub_257B2F584(v77, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v88 = swift_getEnumCaseMultiPayload();
      uint64_t v89 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v89 - 8) + 16))(v77, v78, v89);
      if (v88 == 1)
      {
        uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)(v77 + *(int *)(v90 + 28)) = *(uint64_t *)((char *)v78 + *(int *)(v90 + 28));
        *(void *)(v77 + *(int *)(v90 + 32)) = *(uint64_t *)((char *)v78 + *(int *)(v90 + 32));
        uint64_t v91 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)(v77 + *(int *)(v91 + 20)) = *(uint64_t *)((char *)v78 + *(int *)(v91 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v106 = *v78;
      uint64_t v107 = v78[1];
      char v108 = *((unsigned char *)v78 + 16);
      sub_25772F9EC();
      *(void *)uint64_t v77 = v106;
      *(void *)(v77 + 8) = v107;
      *(unsigned char *)(v77 + 16) = v108;
      *(unsigned char *)(v77 + 17) = *((unsigned char *)v78 + 17);
      *(unsigned char *)(v77 + 18) = *((unsigned char *)v78 + 18);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)(v77 + *(int *)(v111 + 28)) = *(uint64_t *)((char *)v78 + *(int *)(v111 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v77 + *(int *)(v111 + 32)) = *(uint64_t *)((char *)v78 + *(int *)(v111 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v77 + *(int *)(v6 + 20)) = *((unsigned char *)v78 + *(int *)(v6 + 20));
  uint64_t v112 = *(int *)(v6 + 24);
  uint64_t v113 = v77 + v112;
  v114 = (uint64_t *)((char *)v78 + v112);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v116 = *(void *)(v115 - 8);
  v117 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v116 + 48);
  int v118 = v117(v113, 1, v115);
  int v119 = v117((uint64_t)v114, 1, v115);
  if (v118)
  {
    if (!v119)
    {
      type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v120 = swift_getEnumCaseMultiPayload();
        uint64_t v121 = sub_257B43740();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v121 - 8) + 16))(v113, v114, v121);
        if (v120 == 1)
        {
          uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)(v113 + *(int *)(v122 + 28)) = *(uint64_t *)((char *)v114 + *(int *)(v122 + 28));
          *(void *)(v113 + *(int *)(v122 + 32)) = *(uint64_t *)((char *)v114 + *(int *)(v122 + 32));
          uint64_t v123 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)(v113 + *(int *)(v123 + 20)) = *(uint64_t *)((char *)v114 + *(int *)(v123 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v130 = *v114;
        uint64_t v131 = v114[1];
        char v132 = *((unsigned char *)v114 + 16);
        sub_25772F9EC();
        *(void *)uint64_t v113 = v130;
        *(void *)(v113 + 8) = v131;
        *(unsigned char *)(v113 + 16) = v132;
        *(unsigned char *)(v113 + 17) = *((unsigned char *)v114 + 17);
        *(unsigned char *)(v113 + 18) = *((unsigned char *)v114 + 18);
      }
      swift_storeEnumTagMultiPayload();
      *(void *)(v113 + *(int *)(v111 + 28)) = *(uint64_t *)((char *)v114 + *(int *)(v111 + 28));
      *(void *)(v113 + *(int *)(v111 + 32)) = *(uint64_t *)((char *)v114 + *(int *)(v111 + 32));
      v133 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v116 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v133(v113, 0, 1, v115);
      return a1;
    }
LABEL_74:
    size_t v85 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A031028) - 8) + 64);
    v86 = (void *)v113;
    v87 = v114;
    goto LABEL_51;
  }
  if (v119)
  {
    sub_2577270D4(v113, (uint64_t *)&unk_26B2DD028);
    goto LABEL_74;
  }
  if ((uint64_t *)a1 != a2)
  {
    sub_257B2F584(v113, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v126 = swift_getEnumCaseMultiPayload();
      uint64_t v127 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v127 - 8) + 16))(v113, v114, v127);
      if (v126 == 1)
      {
        uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)(v113 + *(int *)(v128 + 28)) = *(uint64_t *)((char *)v114 + *(int *)(v128 + 28));
        *(void *)(v113 + *(int *)(v128 + 32)) = *(uint64_t *)((char *)v114 + *(int *)(v128 + 32));
        uint64_t v129 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)(v113 + *(int *)(v129 + 20)) = *(uint64_t *)((char *)v114 + *(int *)(v129 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v137 = *v114;
      uint64_t v138 = v114[1];
      char v139 = *((unsigned char *)v114 + 16);
      sub_25772F9EC();
      *(void *)uint64_t v113 = v137;
      *(void *)(v113 + 8) = v138;
      *(unsigned char *)(v113 + 16) = v139;
      *(unsigned char *)(v113 + 17) = *((unsigned char *)v114 + 17);
      *(unsigned char *)(v113 + 18) = *((unsigned char *)v114 + 18);
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)(v113 + *(int *)(v111 + 28)) = *(uint64_t *)((char *)v114 + *(int *)(v111 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v113 + *(int *)(v111 + 32)) = *(uint64_t *)((char *)v114 + *(int *)(v111 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_257B2F584(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for ActivityFlexibleUpdate(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(void, void, void))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    uint64_t v10 = type metadata accessor for ActivityAsset();
    int v52 = v8;
    uint64_t v53 = v7;
    uint64_t v51 = v10;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v12 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&a1[*(int *)(v13 + 28)] = *(void *)&a2[*(int *)(v13 + 28)];
        *(void *)&a1[*(int *)(v13 + 32)] = *(void *)&a2[*(int *)(v13 + 32)];
        uint64_t v14 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&a1[*(int *)(v14 + 20)] = *(void *)&a2[*(int *)(v14 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
    *(void *)&a1[*(int *)(v15 + 28)] = *(void *)&a2[*(int *)(v15 + 28)];
    *(void *)&a1[*(int *)(v15 + 32)] = *(void *)&a2[*(int *)(v15 + 32)];
    a1[*(int *)(v6 + 20)] = a2[*(int *)(v6 + 20)];
    uint64_t v16 = *(int *)(v6 + 24);
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
      uint64_t v8 = v52;
      uint64_t v7 = v53;
    }
    else
    {
      uint64_t v50 = v20;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v22 = swift_getEnumCaseMultiPayload();
        uint64_t v23 = sub_257B43740();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v17, v18, v23);
        BOOL v24 = v22 == 1;
        uint64_t v8 = v52;
        if (v24)
        {
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)&v17[*(int *)(v25 + 28)] = *(void *)&v18[*(int *)(v25 + 28)];
          *(void *)&v17[*(int *)(v25 + 32)] = *(void *)&v18[*(int *)(v25 + 32)];
          uint64_t v26 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)&v17[*(int *)(v26 + 20)] = *(void *)&v18[*(int *)(v26 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v17, v18, *(void *)(*(void *)(v51 - 8) + 64));
        uint64_t v8 = v52;
      }
      *(void *)&v17[*(int *)(v15 + 28)] = *(void *)&v18[*(int *)(v15 + 28)];
      *(void *)&v17[*(int *)(v15 + 32)] = *(void *)&v18[*(int *)(v15 + 32)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v17, 0, 1, v19);
      uint64_t v7 = v53;
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v27 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v27] = *(_OWORD *)&a2[v27];
  uint64_t v28 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v28] = *(_OWORD *)&a2[v28];
  uint64_t v29 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  int v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  if (v8(&a2[v29], 1, v6))
  {
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
    memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    uint64_t v33 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v34 = swift_getEnumCaseMultiPayload();
      uint64_t v35 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v30, v31, v35);
      if (v34 == 1)
      {
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&v30[*(int *)(v36 + 28)] = *(void *)&v31[*(int *)(v36 + 28)];
        *(void *)&v30[*(int *)(v36 + 32)] = *(void *)&v31[*(int *)(v36 + 32)];
        uint64_t v37 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&v30[*(int *)(v37 + 20)] = *(void *)&v31[*(int *)(v37 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
    }
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
    *(void *)&v30[*(int *)(v38 + 28)] = *(void *)&v31[*(int *)(v38 + 28)];
    *(void *)&v30[*(int *)(v38 + 32)] = *(void *)&v31[*(int *)(v38 + 32)];
    v30[*(int *)(v6 + 20)] = v31[*(int *)(v6 + 20)];
    uint64_t v39 = *(int *)(v6 + 24);
    uint64_t v40 = &v30[v39];
    uint64_t v41 = &v31[v39];
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
    uint64_t v43 = *(void *)(v42 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42))
    {
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        uint64_t v54 = v7;
        int v45 = swift_getEnumCaseMultiPayload();
        uint64_t v46 = sub_257B43740();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v40, v41, v46);
        BOOL v24 = v45 == 1;
        uint64_t v7 = v54;
        if (v24)
        {
          uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)&v40[*(int *)(v47 + 28)] = *(void *)&v41[*(int *)(v47 + 28)];
          *(void *)&v40[*(int *)(v47 + 32)] = *(void *)&v41[*(int *)(v47 + 32)];
          uint64_t v48 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)&v40[*(int *)(v48 + 20)] = *(void *)&v41[*(int *)(v48 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v40, v41, *(void *)(*(void *)(v33 - 8) + 64));
      }
      *(void *)&v40[*(int *)(v38 + 28)] = *(void *)&v41[*(int *)(v38 + 28)];
      *(void *)&v40[*(int *)(v38 + 32)] = *(void *)&v41[*(int *)(v38 + 32)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v30, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for ActivityFlexibleUpdate(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActivityFlexibleUpdate.Graphic(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = type metadata accessor for ActivityAsset();
      uint64_t v134 = v8;
      uint64_t v135 = v7;
      __src = (void *)v11;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        uint64_t v13 = sub_257B43740();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)&a1[*(int *)(v14 + 28)] = *(void *)&a2[*(int *)(v14 + 28)];
          *(void *)&a1[*(int *)(v14 + 32)] = *(void *)&a2[*(int *)(v14 + 32)];
          uint64_t v15 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)&a1[*(int *)(v15 + 20)] = *(void *)&a2[*(int *)(v15 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
      }
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
      *(void *)&a1[*(int *)(v22 + 28)] = *(void *)&a2[*(int *)(v22 + 28)];
      *(void *)&a1[*(int *)(v22 + 32)] = *(void *)&a2[*(int *)(v22 + 32)];
      a1[*(int *)(v6 + 20)] = a2[*(int *)(v6 + 20)];
      uint64_t v23 = *(int *)(v6 + 24);
      BOOL v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
      uint64_t v27 = *(void **)(v26 - 8);
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v27 + 6))(v25, 1, v26))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
        memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        __dst = v27;
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          type metadata accessor for URLAssetConfiguration.Format(0);
          int v29 = swift_getEnumCaseMultiPayload();
          uint64_t v30 = sub_257B43740();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v24, v25, v30);
          if (v29 == 1)
          {
            uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
            *(void *)&v24[*(int *)(v31 + 28)] = *(void *)&v25[*(int *)(v31 + 28)];
            *(void *)&v24[*(int *)(v31 + 32)] = *(void *)&v25[*(int *)(v31 + 32)];
            uint64_t v32 = type metadata accessor for URLAssetConfiguration.Recipe(0);
            *(void *)&v24[*(int *)(v32 + 20)] = *(void *)&v25[*(int *)(v32 + 20)];
          }
          uint64_t v27 = __dst;
          swift_storeEnumTagMultiPayload();
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v24, v25, *(void *)(*(__src - 1) + 64));
        }
        *(void *)&v24[*(int *)(v22 + 28)] = *(void *)&v25[*(int *)(v22 + 28)];
        *(void *)&v24[*(int *)(v22 + 32)] = *(void *)&v25[*(int *)(v22 + 32)];
        (*((void (**)(char *, void, uint64_t, uint64_t))v27 + 7))(v24, 0, 1, v26);
      }
      uint64_t v7 = v135;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v135 + 56))(a1, 0, 1, v6);
LABEL_34:
      uint64_t v8 = v134;
      goto LABEL_35;
    }
LABEL_8:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
    memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_35;
  }
  if (v10)
  {
    sub_257B2F584((uint64_t)a1, type metadata accessor for ActivityFlexibleUpdate.Graphic);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_257B2F584((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    uint64_t v17 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v18 = swift_getEnumCaseMultiPayload();
      uint64_t v19 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(a1, a2, v19);
      if (v18 == 1)
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&a1[*(int *)(v20 + 28)] = *(void *)&a2[*(int *)(v20 + 28)];
        *(void *)&a1[*(int *)(v20 + 32)] = *(void *)&a2[*(int *)(v20 + 32)];
        uint64_t v21 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&a1[*(int *)(v21 + 20)] = *(void *)&a2[*(int *)(v21 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  uint64_t v134 = v8;
  uint64_t v136 = v7;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)&a1[*(int *)(v33 + 28)] = *(void *)&a2[*(int *)(v33 + 28)];
  swift_bridgeObjectRelease();
  uint64_t v129 = v33;
  *(void *)&a1[*(int *)(v33 + 32)] = *(void *)&a2[*(int *)(v33 + 32)];
  swift_bridgeObjectRelease();
  a1[*(int *)(v6 + 20)] = a2[*(int *)(v6 + 20)];
  uint64_t v34 = *(int *)(v6 + 24);
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v128 = *(void *)(v37 - 8);
  uint64_t v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v128 + 48);
  __dsta = v35;
  LODWORD(v35) = v38(v35, 1, v37);
  __srca = v36;
  int v39 = v38(v36, 1, v37);
  if (v35)
  {
    if (v39)
    {
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(__dsta, v36, *(void *)(*(void *)(v40 - 8) + 64));
      uint64_t v8 = v134;
      uint64_t v7 = v136;
      goto LABEL_35;
    }
    uint64_t v42 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v43 = swift_getEnumCaseMultiPayload();
      uint64_t v44 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(__dsta, __srca, v44);
      if (v43 == 1)
      {
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&__dsta[*(int *)(v45 + 28)] = *(void *)&__srca[*(int *)(v45 + 28)];
        *(void *)&__dsta[*(int *)(v45 + 32)] = *(void *)&__srca[*(int *)(v45 + 32)];
        uint64_t v46 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&__dsta[*(int *)(v46 + 20)] = *(void *)&__srca[*(int *)(v46 + 20)];
      }
      uint64_t v127 = v129;
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
      uint64_t v7 = v136;
    }
    else
    {
      memcpy(__dsta, v36, *(void *)(*(void *)(v42 - 8) + 64));
      uint64_t v7 = v136;
      uint64_t v127 = v129;
    }
    *(void *)&__dsta[*(int *)(v127 + 28)] = *(void *)&__srca[*(int *)(v127 + 28)];
    *(void *)&__dsta[*(int *)(v127 + 32)] = *(void *)&__srca[*(int *)(v127 + 32)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v128 + 56))(__dsta, 0, 1, v37);
    goto LABEL_34;
  }
  uint64_t v8 = v134;
  if (v39)
  {
    sub_2577270D4((uint64_t)__dsta, (uint64_t *)&unk_26B2DD028);
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
    memcpy(__dsta, v36, *(void *)(*(void *)(v41 - 8) + 64));
    uint64_t v7 = v136;
  }
  else
  {
    uint64_t v7 = v136;
    if (a1 != a2)
    {
      sub_257B2F584((uint64_t)__dsta, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
      uint64_t v116 = type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v117 = swift_getEnumCaseMultiPayload();
        uint64_t v118 = sub_257B43740();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v118 - 8) + 32))(__dsta, v36, v118);
        BOOL v119 = v117 == 1;
        uint64_t v7 = v136;
        if (v119)
        {
          uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)&__dsta[*(int *)(v120 + 28)] = *(void *)&v36[*(int *)(v120 + 28)];
          *(void *)&__dsta[*(int *)(v120 + 32)] = *(void *)&v36[*(int *)(v120 + 32)];
          uint64_t v121 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)&__dsta[*(int *)(v121 + 20)] = *(void *)&v36[*(int *)(v121 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(__dsta, v36, *(void *)(*(void *)(v116 - 8) + 64));
      }
      uint64_t v8 = v134;
    }
    *(void *)&__dsta[*(int *)(v129 + 28)] = *(void *)&v36[*(int *)(v129 + 28)];
    swift_bridgeObjectRelease();
    *(void *)&__dsta[*(int *)(v129 + 32)] = *(void *)&v36[*(int *)(v129 + 32)];
    swift_bridgeObjectRelease();
  }
LABEL_35:
  uint64_t v47 = a3[5];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = &a2[v47];
  uint64_t v51 = *(void *)v49;
  uint64_t v50 = *((void *)v49 + 1);
  *(void *)uint64_t v48 = v51;
  *((void *)v48 + 1) = v50;
  swift_bridgeObjectRelease();
  uint64_t v52 = a3[6];
  uint64_t v53 = &a1[v52];
  uint64_t v54 = &a2[v52];
  uint64_t v56 = *(void *)v54;
  uint64_t v55 = *((void *)v54 + 1);
  *(void *)uint64_t v53 = v56;
  *((void *)v53 + 1) = v55;
  swift_bridgeObjectRelease();
  uint64_t v57 = a3[7];
  uint64_t v58 = &a1[v57];
  uint64_t v59 = &a2[v57];
  uint64_t v61 = *(void *)v59;
  uint64_t v60 = *((void *)v59 + 1);
  *(void *)uint64_t v58 = v61;
  *((void *)v58 + 1) = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = a3[8];
  uint64_t v63 = &a1[v62];
  uint64_t v64 = &a2[v62];
  uint64_t v66 = *(void *)v64;
  uint64_t v65 = *((void *)v64 + 1);
  *(void *)uint64_t v63 = v66;
  *((void *)v63 + 1) = v65;
  swift_bridgeObjectRelease();
  uint64_t v67 = a3[9];
  int v68 = &a1[v67];
  uint64_t v69 = &a2[v67];
  uint64_t v71 = *(void *)v69;
  uint64_t v70 = *((void *)v69 + 1);
  *(void *)int v68 = v71;
  *((void *)v68 + 1) = v70;
  swift_bridgeObjectRelease();
  uint64_t v72 = a3[10];
  uint64_t v73 = &a1[v72];
  uint64_t v74 = &a2[v72];
  int v75 = v8(&a1[v72], 1, v6);
  int v76 = v8(v74, 1, v6);
  if (v75)
  {
    if (!v76)
    {
      uint64_t v77 = type metadata accessor for ActivityAsset();
      uint64_t v137 = v7;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v78 = swift_getEnumCaseMultiPayload();
        uint64_t v79 = sub_257B43740();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 32))(v73, v74, v79);
        if (v78 == 1)
        {
          uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)&v73[*(int *)(v80 + 28)] = *(void *)&v74[*(int *)(v80 + 28)];
          *(void *)&v73[*(int *)(v80 + 32)] = *(void *)&v74[*(int *)(v80 + 32)];
          uint64_t v81 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)&v73[*(int *)(v81 + 20)] = *(void *)&v74[*(int *)(v81 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v73, v74, *(void *)(*(void *)(v77 - 8) + 64));
      }
      uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
      *(void *)&v73[*(int *)(v90 + 28)] = *(void *)&v74[*(int *)(v90 + 28)];
      *(void *)&v73[*(int *)(v90 + 32)] = *(void *)&v74[*(int *)(v90 + 32)];
      v73[*(int *)(v6 + 20)] = v74[*(int *)(v6 + 20)];
      uint64_t v91 = *(int *)(v6 + 24);
      uint64_t v92 = &v73[v91];
      uint64_t v93 = &v74[v91];
      uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
      uint64_t v95 = *(void *)(v94 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48))(v93, 1, v94))
      {
        uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
        memcpy(v92, v93, *(void *)(*(void *)(v96 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          type metadata accessor for URLAssetConfiguration.Format(0);
          int v97 = swift_getEnumCaseMultiPayload();
          uint64_t v98 = sub_257B43740();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 32))(v92, v93, v98);
          if (v97 == 1)
          {
            uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
            *(void *)&v92[*(int *)(v99 + 28)] = *(void *)&v93[*(int *)(v99 + 28)];
            *(void *)&v92[*(int *)(v99 + 32)] = *(void *)&v93[*(int *)(v99 + 32)];
            uint64_t v100 = type metadata accessor for URLAssetConfiguration.Recipe(0);
            *(void *)&v92[*(int *)(v100 + 20)] = *(void *)&v93[*(int *)(v100 + 20)];
          }
          swift_storeEnumTagMultiPayload();
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v92, v93, *(void *)(*(void *)(v77 - 8) + 64));
        }
        *(void *)&v92[*(int *)(v90 + 28)] = *(void *)&v93[*(int *)(v90 + 28)];
        *(void *)&v92[*(int *)(v90 + 32)] = *(void *)&v93[*(int *)(v90 + 32)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v95 + 56))(v92, 0, 1, v94);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v137 + 56))(v73, 0, 1, v6);
      return a1;
    }
    goto LABEL_42;
  }
  if (v76)
  {
    sub_257B2F584((uint64_t)v73, type metadata accessor for ActivityFlexibleUpdate.Graphic);
LABEL_42:
    size_t v82 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8) - 8) + 64);
    uint64_t v83 = v73;
    uint64_t v84 = v74;
LABEL_43:
    memcpy(v83, v84, v82);
    return a1;
  }
  if (a1 != a2)
  {
    sub_257B2F584((uint64_t)v73, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    uint64_t v85 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v86 = swift_getEnumCaseMultiPayload();
      uint64_t v87 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 32))(v73, v74, v87);
      if (v86 == 1)
      {
        uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&v73[*(int *)(v88 + 28)] = *(void *)&v74[*(int *)(v88 + 28)];
        *(void *)&v73[*(int *)(v88 + 32)] = *(void *)&v74[*(int *)(v88 + 32)];
        uint64_t v89 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&v73[*(int *)(v89 + 20)] = *(void *)&v74[*(int *)(v89 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v73, v74, *(void *)(*(void *)(v85 - 8) + 64));
    }
  }
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)&v73[*(int *)(v101 + 28)] = *(void *)&v74[*(int *)(v101 + 28)];
  swift_bridgeObjectRelease();
  *(void *)&v73[*(int *)(v101 + 32)] = *(void *)&v74[*(int *)(v101 + 32)];
  swift_bridgeObjectRelease();
  v73[*(int *)(v6 + 20)] = v74[*(int *)(v6 + 20)];
  uint64_t v102 = *(int *)(v6 + 24);
  uint64_t v103 = &v73[v102];
  uint64_t v104 = &v74[v102];
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v106 = *(void *)(v105 - 8);
  uint64_t v107 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v106 + 48);
  int v108 = v107(v103, 1, v105);
  int v109 = v107(v104, 1, v105);
  if (v108)
  {
    if (!v109)
    {
      uint64_t v110 = type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v111 = swift_getEnumCaseMultiPayload();
        uint64_t v112 = sub_257B43740();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v112 - 8) + 32))(v103, v104, v112);
        if (v111 == 1)
        {
          uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)&v103[*(int *)(v113 + 28)] = *(void *)&v104[*(int *)(v113 + 28)];
          *(void *)&v103[*(int *)(v113 + 32)] = *(void *)&v104[*(int *)(v113 + 32)];
          uint64_t v114 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)&v103[*(int *)(v114 + 20)] = *(void *)&v104[*(int *)(v114 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v103, v104, *(void *)(*(void *)(v110 - 8) + 64));
      }
      *(void *)&v103[*(int *)(v101 + 28)] = *(void *)&v104[*(int *)(v101 + 28)];
      *(void *)&v103[*(int *)(v101 + 32)] = *(void *)&v104[*(int *)(v101 + 32)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v106 + 56))(v103, 0, 1, v105);
      return a1;
    }
LABEL_65:
    size_t v82 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A031028) - 8) + 64);
    uint64_t v83 = v103;
    uint64_t v84 = v104;
    goto LABEL_43;
  }
  if (v109)
  {
    sub_2577270D4((uint64_t)v103, (uint64_t *)&unk_26B2DD028);
    goto LABEL_65;
  }
  if (a1 != a2)
  {
    sub_257B2F584((uint64_t)v103, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    uint64_t v122 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v123 = swift_getEnumCaseMultiPayload();
      uint64_t v124 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v124 - 8) + 32))(v103, v104, v124);
      if (v123 == 1)
      {
        uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&v103[*(int *)(v125 + 28)] = *(void *)&v104[*(int *)(v125 + 28)];
        *(void *)&v103[*(int *)(v125 + 32)] = *(void *)&v104[*(int *)(v125 + 32)];
        uint64_t v126 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&v103[*(int *)(v126 + 20)] = *(void *)&v104[*(int *)(v126 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v103, v104, *(void *)(*(void *)(v122 - 8) + 64));
    }
  }
  *(void *)&v103[*(int *)(v101 + 28)] = *(void *)&v104[*(int *)(v101 + 28)];
  swift_bridgeObjectRelease();
  *(void *)&v103[*(int *)(v101 + 32)] = *(void *)&v104[*(int *)(v101 + 32)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityFlexibleUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_257B310D4);
}

uint64_t sub_257B310D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_257B311BC);
}

uint64_t sub_257B311BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26A032BE8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

void sub_257B31280()
{
  sub_257B3DA7C(319, &qword_26B2DC1D0, type metadata accessor for ActivityFlexibleUpdate.Graphic, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t destroy for ActivityFlexibleUpdateTheme(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = (unsigned int *)(result + 328);
  switch(*(void *)(result + 72))
  {
    case 0:
      if (!*(void *)(result + 160)) {
        goto LABEL_4;
      }
      goto LABEL_3;
    case 1:
      goto LABEL_4;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_20;
    default:
      sub_25771D110(*(void *)result, *(void *)(result + 8), *(void *)(result + 16), *(void *)(result + 24), *(void *)(result + 32), *(void *)(result + 40), *(void *)(result + 48), *(void *)(result + 56), *(unsigned int *)(result + 64) | ((unint64_t)*(unsigned __int8 *)(result + 68) << 32));
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (*(void *)(v1 + 160))
      {
LABEL_3:
        sub_25771D110(*(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120), *(void *)(v1 + 128), *(void *)(v1 + 136), *(void *)(v1 + 144), *(unsigned int *)(v1 + 152) | ((unint64_t)*(unsigned __int8 *)(v1 + 156) << 32));
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
LABEL_4:
      uint64_t v3 = *(void *)(v1 + 248);
      if (!v3) {
        goto LABEL_7;
      }
      if (v3 != 1)
      {
        sub_25771D110(*(void *)(v1 + 176), *(void *)(v1 + 184), *(void *)(v1 + 192), *(void *)(v1 + 200), *(void *)(v1 + 208), *(void *)(v1 + 216), *(void *)(v1 + 224), *(void *)(v1 + 232), *(unsigned int *)(v1 + 240) | ((unint64_t)*(unsigned __int8 *)(v1 + 244) << 32));
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
LABEL_7:
        if (*(void *)(v1 + 336))
        {
          sub_25771D110(*(void *)(v1 + 264), *(void *)(v1 + 272), *(void *)(v1 + 280), *(void *)(v1 + 288), *(void *)(v1 + 296), *(void *)(v1 + 304), *(void *)(v1 + 312), *(void *)(v1 + 320), *v2 | ((unint64_t)*((unsigned __int8 *)v2 + 4) << 32));
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
        }
      }
LABEL_9:
      uint64_t v4 = *(void *)(v1 + 424);
      switch(v4)
      {
        case 0:
          goto LABEL_13;
        case 1:
          goto LABEL_15;
        case 2:
          goto LABEL_20;
      }
      sub_25771D110(*(void *)(v1 + 352), *(void *)(v1 + 360), *(void *)(v1 + 368), *(void *)(v1 + 376), *(void *)(v1 + 384), *(void *)(v1 + 392), *(void *)(v1 + 400), *(void *)(v1 + 408), v2[22] | ((unint64_t)*((unsigned __int8 *)v2 + 92) << 32));
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
LABEL_13:
      if (*(void *)(v1 + 512))
      {
        sub_25771D110(*(void *)(v1 + 440), *(void *)(v1 + 448), *(void *)(v1 + 456), *(void *)(v1 + 464), *(void *)(v1 + 472), *(void *)(v1 + 480), *(void *)(v1 + 488), *(void *)(v1 + 496), v2[44] | ((unint64_t)*((unsigned __int8 *)v2 + 180) << 32));
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
LABEL_15:
      uint64_t v5 = *(void *)(v1 + 600);
      if (!v5) {
        goto LABEL_18;
      }
      if (v5 != 1)
      {
        sub_25771D110(*(void *)(v1 + 528), *(void *)(v1 + 536), *(void *)(v1 + 544), *(void *)(v1 + 552), *(void *)(v1 + 560), *(void *)(v1 + 568), *(void *)(v1 + 576), *(void *)(v1 + 584), v2[66] | ((unint64_t)*((unsigned __int8 *)v2 + 268) << 32));
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
LABEL_18:
        if (*(void *)(v1 + 688))
        {
          sub_25771D110(*(void *)(v1 + 616), *(void *)(v1 + 624), *(void *)(v1 + 632), *(void *)(v1 + 640), *(void *)(v1 + 648), *(void *)(v1 + 656), *(void *)(v1 + 664), *(void *)(v1 + 672), v2[88] | ((unint64_t)*((unsigned __int8 *)v2 + 356) << 32));
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
        }
      }
LABEL_20:
      if (*(void *)(v1 + 888))
      {
        if (*(void *)(v1 + 776))
        {
          sub_25771D110(*(void *)(v1 + 704), *(void *)(v1 + 712), *(void *)(v1 + 720), *(void *)(v1 + 728), *(void *)(v1 + 736), *(void *)(v1 + 744), *(void *)(v1 + 752), *(void *)(v1 + 760), v2[110] | ((unint64_t)*((unsigned __int8 *)v2 + 444) << 32));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 800))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 824))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 848))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 872))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      if (*(void *)(v1 + 1088))
      {
        if (*(void *)(v1 + 976))
        {
          sub_25771D110(*(void *)(v1 + 904), *(void *)(v1 + 912), *(void *)(v1 + 920), *(void *)(v1 + 928), *(void *)(v1 + 936), *(void *)(v1 + 944), *(void *)(v1 + 952), *(void *)(v1 + 960), v2[160] | ((unint64_t)*((unsigned __int8 *)v2 + 644) << 32));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1000))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1024))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1048))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1072))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      if (*(void *)(v1 + 1288))
      {
        if (*(void *)(v1 + 1176))
        {
          sub_25771D110(*(void *)(v1 + 1104), *(void *)(v1 + 1112), *(void *)(v1 + 1120), *(void *)(v1 + 1128), *(void *)(v1 + 1136), *(void *)(v1 + 1144), *(void *)(v1 + 1152), *(void *)(v1 + 1160), v2[210] | ((unint64_t)*((unsigned __int8 *)v2 + 844) << 32));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1200))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1224))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1248))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1272))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      if (*(void *)(v1 + 1488))
      {
        if (*(void *)(v1 + 1376))
        {
          sub_25771D110(*(void *)(v1 + 1304), *(void *)(v1 + 1312), *(void *)(v1 + 1320), *(void *)(v1 + 1328), *(void *)(v1 + 1336), *(void *)(v1 + 1344), *(void *)(v1 + 1352), *(void *)(v1 + 1360), v2[260] | ((unint64_t)*((unsigned __int8 *)v2 + 1044) << 32));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1400))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1424))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1448))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1472))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      if (*(void *)(v1 + 1688))
      {
        if (*(void *)(v1 + 1576))
        {
          sub_25771D110(*(void *)(v1 + 1504), *(void *)(v1 + 1512), *(void *)(v1 + 1520), *(void *)(v1 + 1528), *(void *)(v1 + 1536), *(void *)(v1 + 1544), *(void *)(v1 + 1552), *(void *)(v1 + 1560), v2[310] | ((unint64_t)*((unsigned __int8 *)v2 + 1244) << 32));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1600))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1624))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1648))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v1 + 1672))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
      }
      switch(*(void *)(v1 + 1776))
      {
        case 0:
          if (!*(void *)(v1 + 1864)) {
            goto LABEL_83;
          }
          goto LABEL_82;
        case 1:
          goto LABEL_83;
        case 2:
          goto LABEL_88;
        case 3:
          return result;
        default:
          sub_25771D110(*(void *)(v1 + 1704), *(void *)(v1 + 1712), *(void *)(v1 + 1720), *(void *)(v1 + 1728), *(void *)(v1 + 1736), *(void *)(v1 + 1744), *(void *)(v1 + 1752), *(void *)(v1 + 1760), v2[360] | ((unint64_t)*((unsigned __int8 *)v2 + 1444) << 32));
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (*(void *)(v1 + 1864))
          {
LABEL_82:
            sub_25771D110(*(void *)(v1 + 1792), *(void *)(v1 + 1800), *(void *)(v1 + 1808), *(void *)(v1 + 1816), *(void *)(v1 + 1824), *(void *)(v1 + 1832), *(void *)(v1 + 1840), *(void *)(v1 + 1848), v2[382] | ((unint64_t)*((unsigned __int8 *)v2 + 1532) << 32));
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
          }
LABEL_83:
          uint64_t v6 = *(void *)(v1 + 1952);
          if (!v6) {
            goto LABEL_86;
          }
          if (v6 != 1)
          {
            sub_25771D110(*(void *)(v1 + 1880), *(void *)(v1 + 1888), *(void *)(v1 + 1896), *(void *)(v1 + 1904), *(void *)(v1 + 1912), *(void *)(v1 + 1920), *(void *)(v1 + 1928), *(void *)(v1 + 1936), v2[404] | ((unint64_t)*((unsigned __int8 *)v2 + 1620) << 32));
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
LABEL_86:
            if (*(void *)(v1 + 2040))
            {
              sub_25771D110(*(void *)(v1 + 1968), *(void *)(v1 + 1976), *(void *)(v1 + 1984), *(void *)(v1 + 1992), *(void *)(v1 + 2000), *(void *)(v1 + 2008), *(void *)(v1 + 2016), *(void *)(v1 + 2024), v2[426] | ((unint64_t)*((unsigned __int8 *)v2 + 1708) << 32));
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
            }
          }
LABEL_88:
          uint64_t v7 = *(void *)(v1 + 2128);
          switch(v7)
          {
            case 0:
              goto LABEL_92;
            case 1:
              goto LABEL_94;
            case 2:
              return result;
          }
          sub_25771D110(*(void *)(v1 + 2056), *(void *)(v1 + 2064), *(void *)(v1 + 2072), *(void *)(v1 + 2080), *(void *)(v1 + 2088), *(void *)(v1 + 2096), *(void *)(v1 + 2104), *(void *)(v1 + 2112), v2[448] | ((unint64_t)*((unsigned __int8 *)v2 + 1796) << 32));
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
LABEL_92:
          if (*(void *)(v1 + 2216))
          {
            sub_25771D110(*(void *)(v1 + 2144), *(void *)(v1 + 2152), *(void *)(v1 + 2160), *(void *)(v1 + 2168), *(void *)(v1 + 2176), *(void *)(v1 + 2184), *(void *)(v1 + 2192), *(void *)(v1 + 2200), v2[470] | ((unint64_t)*((unsigned __int8 *)v2 + 1884) << 32));
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
          }
LABEL_94:
          uint64_t v8 = *(void *)(v1 + 2304);
          if (!v8) {
            goto LABEL_97;
          }
          if (v8 != 1)
          {
            sub_25771D110(*(void *)(v1 + 2232), *(void *)(v1 + 2240), *(void *)(v1 + 2248), *(void *)(v1 + 2256), *(void *)(v1 + 2264), *(void *)(v1 + 2272), *(void *)(v1 + 2280), *(void *)(v1 + 2288), v2[492] | ((unint64_t)*((unsigned __int8 *)v2 + 1972) << 32));
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
LABEL_97:
            if (*(void *)(v1 + 2392))
            {
              sub_25771D110(*(void *)(v1 + 2320), *(void *)(v1 + 2328), *(void *)(v1 + 2336), *(void *)(v1 + 2344), *(void *)(v1 + 2352), *(void *)(v1 + 2360), *(void *)(v1 + 2368), *(void *)(v1 + 2376), v2[514] | ((unint64_t)*((unsigned __int8 *)v2 + 2060) << 32));
              swift_bridgeObjectRelease();
              return swift_bridgeObjectRelease();
            }
          }
          return result;
      }
  }
}

_OWORD *initializeWithCopy for ActivityFlexibleUpdateTheme(_OWORD *__dst, _OWORD *__src)
{
  uint64_t v2 = __src;
  uint64_t v3 = __dst;
  v379 = (unsigned int *)__src + 82;
  v381 = (char *)__dst + 328;
  switch(*((void *)__src + 9))
  {
    case 0:
      long long v4 = __src[3];
      __dst[2] = __src[2];
      __dst[3] = v4;
      __dst[4] = __src[4];
      *((void *)__dst + 10) = *((void *)__src + 10);
      long long v5 = __src[1];
      void *__dst = *__src;
      __dst[1] = v5;
      if (!*((void *)__src + 20)) {
        goto LABEL_5;
      }
      goto LABEL_3;
    case 1:
      long long v26 = __src[9];
      __dst[8] = __src[8];
      __dst[9] = v26;
      __dst[10] = __src[10];
      long long v27 = __src[5];
      __dst[4] = __src[4];
      __dst[5] = v27;
      long long v28 = __src[7];
      __dst[6] = __src[6];
      __dst[7] = v28;
      long long v29 = __src[1];
      void *__dst = *__src;
      __dst[1] = v29;
      long long v30 = __src[3];
      __dst[2] = __src[2];
      __dst[3] = v30;
      goto LABEL_7;
    case 2:
      memcpy(__dst, __src, 0x160uLL);
      goto LABEL_16;
    case 3:
      size_t v39 = 704;
      goto LABEL_20;
    default:
      uint64_t v15 = *(void *)__src;
      uint64_t v16 = *((void *)__src + 1);
      uint64_t v17 = *((void *)__src + 2);
      uint64_t v18 = *((void *)__src + 3);
      uint64_t v19 = *((void *)__src + 4);
      uint64_t v20 = *((void *)__src + 5);
      uint64_t v21 = *((void *)__src + 6);
      uint64_t v22 = *((void *)__src + 7);
      uint64_t v339 = *((unsigned __int8 *)__src + 68);
      uint64_t v359 = *((unsigned int *)__src + 16);
      sub_25771CCF8(*(void *)__src, v16, v17, v18, v19, v20, v21, v22, v359 | (v339 << 32));
      *(void *)uint64_t v3 = v15;
      *((void *)v3 + 1) = v16;
      *((void *)v3 + 2) = v17;
      *((void *)v3 + 3) = v18;
      *((void *)v3 + 4) = v19;
      *((void *)v3 + 5) = v20;
      *((void *)v3 + 6) = v21;
      *((void *)v3 + 7) = v22;
      *((unsigned char *)v3 + 68) = v339;
      *((_DWORD *)v3 + 16) = v359;
      uint64_t v23 = *((void *)v2 + 10);
      *((void *)v3 + 9) = *((void *)v2 + 9);
      *((void *)v3 + 10) = v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)v2 + 20))
      {
LABEL_3:
        uint64_t v6 = *((void *)v2 + 11);
        uint64_t v7 = *((void *)v2 + 12);
        uint64_t v8 = *((void *)v2 + 13);
        uint64_t v9 = *((void *)v2 + 14);
        uint64_t v10 = *((void *)v2 + 15);
        uint64_t v11 = *((void *)v2 + 16);
        uint64_t v12 = *((void *)v2 + 17);
        uint64_t v13 = *((void *)v2 + 18);
        uint64_t v338 = *((unsigned __int8 *)v2 + 156);
        uint64_t v358 = *((unsigned int *)v2 + 38);
        sub_25771CCF8(v6, v7, v8, v9, v10, v11, v12, v13, v358 | (v338 << 32));
        *((void *)v3 + 11) = v6;
        *((void *)v3 + 12) = v7;
        *((void *)v3 + 13) = v8;
        *((void *)v3 + 14) = v9;
        *((void *)v3 + 15) = v10;
        *((void *)v3 + 16) = v11;
        *((void *)v3 + 17) = v12;
        *((void *)v3 + 18) = v13;
        *((unsigned char *)v3 + 156) = v338;
        *((_DWORD *)v3 + 38) = v358;
        uint64_t v14 = *((void *)v2 + 21);
        *((void *)v3 + 20) = *((void *)v2 + 20);
        *((void *)v3 + 21) = v14;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
LABEL_5:
        long long v24 = *(_OWORD *)((char *)v2 + 136);
        *(_OWORD *)((char *)v3 + 120) = *(_OWORD *)((char *)v2 + 120);
        *(_OWORD *)((char *)v3 + 136) = v24;
        *(_OWORD *)((char *)v3 + 152) = *(_OWORD *)((char *)v2 + 152);
        *((void *)v3 + 21) = *((void *)v2 + 21);
        long long v25 = *(_OWORD *)((char *)v2 + 104);
        *(_OWORD *)((char *)v3 + 88) = *(_OWORD *)((char *)v2 + 88);
        *(_OWORD *)((char *)v3 + 104) = v25;
      }
LABEL_7:
      uint64_t v31 = v3 + 11;
      uint64_t v32 = v2 + 11;
      uint64_t v33 = *((void *)v2 + 31);
      if (v33)
      {
        if (v33 == 1)
        {
          long long v34 = v2[20];
          v3[19] = v2[19];
          v3[20] = v34;
          v3[21] = v2[21];
          long long v35 = v2[16];
          v3[15] = v2[15];
          v3[16] = v35;
          long long v36 = v2[18];
          v3[17] = v2[17];
          v3[18] = v36;
          long long v37 = v2[12];
          *uint64_t v31 = *v32;
          v3[12] = v37;
          long long v38 = v2[14];
          v3[13] = v2[13];
          v3[14] = v38;
          goto LABEL_16;
        }
        uint64_t v51 = *((void *)v2 + 22);
        uint64_t v52 = *((void *)v2 + 23);
        uint64_t v53 = *((void *)v2 + 24);
        uint64_t v54 = *((void *)v2 + 25);
        uint64_t v55 = *((void *)v2 + 26);
        uint64_t v56 = *((void *)v2 + 27);
        uint64_t v57 = *((void *)v2 + 28);
        uint64_t v58 = *((void *)v2 + 29);
        uint64_t v341 = *((unsigned __int8 *)v2 + 244);
        uint64_t v361 = *((unsigned int *)v2 + 60);
        sub_25771CCF8(v51, v52, v53, v54, v55, v56, v57, v58, v361 | (v341 << 32));
        *((void *)v3 + 22) = v51;
        *((void *)v3 + 23) = v52;
        *((void *)v3 + 24) = v53;
        *((void *)v3 + 25) = v54;
        *((void *)v3 + 26) = v55;
        *((void *)v3 + 27) = v56;
        *((void *)v3 + 28) = v57;
        *((void *)v3 + 29) = v58;
        *((unsigned char *)v3 + 244) = v341;
        *((_DWORD *)v3 + 60) = v361;
        uint64_t v59 = *((void *)v2 + 32);
        *((void *)v3 + 31) = *((void *)v2 + 31);
        *((void *)v3 + 32) = v59;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((void *)v2 + 42)) {
          goto LABEL_15;
        }
LABEL_13:
        uint64_t v42 = *((void *)v2 + 33);
        uint64_t v43 = *((void *)v2 + 34);
        uint64_t v44 = *((void *)v2 + 35);
        uint64_t v45 = *((void *)v2 + 36);
        uint64_t v46 = *((void *)v2 + 37);
        uint64_t v47 = *((void *)v2 + 38);
        uint64_t v48 = *((void *)v2 + 39);
        uint64_t v49 = *((void *)v2 + 40);
        uint64_t v340 = *((unsigned __int8 *)v379 + 4);
        uint64_t v360 = *v379;
        sub_25771CCF8(v42, v43, v44, v45, v46, v47, v48, v49, v360 | (v340 << 32));
        *((void *)v3 + 33) = v42;
        *((void *)v3 + 34) = v43;
        *((void *)v3 + 35) = v44;
        *((void *)v3 + 36) = v45;
        *((void *)v3 + 37) = v46;
        *((void *)v3 + 38) = v47;
        *((void *)v3 + 39) = v48;
        *((void *)v3 + 40) = v49;
        v381[4] = v340;
        *(_DWORD *)v381 = v360;
        uint64_t v50 = *((void *)v2 + 43);
        *((void *)v3 + 42) = *((void *)v2 + 42);
        *((void *)v3 + 43) = v50;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_16;
      }
      long long v40 = v2[14];
      v3[13] = v2[13];
      v3[14] = v40;
      v3[15] = v2[15];
      *((void *)v3 + 32) = *((void *)v2 + 32);
      long long v41 = v2[12];
      *uint64_t v31 = *v32;
      v3[12] = v41;
      if (*((void *)v2 + 42)) {
        goto LABEL_13;
      }
LABEL_15:
      long long v60 = *(_OWORD *)((char *)v2 + 312);
      *(_OWORD *)((char *)v3 + 296) = *(_OWORD *)((char *)v2 + 296);
      *(_OWORD *)((char *)v3 + 312) = v60;
      *(_OWORD *)((char *)v3 + 328) = *(_OWORD *)((char *)v2 + 328);
      *((void *)v3 + 43) = *((void *)v2 + 43);
      long long v61 = *(_OWORD *)((char *)v2 + 280);
      *(_OWORD *)((char *)v3 + 264) = *(_OWORD *)((char *)v2 + 264);
      *(_OWORD *)((char *)v3 + 280) = v61;
LABEL_16:
      __dst = v3 + 22;
      __src = v2 + 22;
      uint64_t v62 = *((void *)v2 + 53);
      if (!v62)
      {
        long long v63 = v2[25];
        v3[24] = v2[24];
        v3[25] = v63;
        v3[26] = v2[26];
        *((void *)v3 + 54) = *((void *)v2 + 54);
        long long v64 = v2[23];
        void *__dst = *__src;
        v3[23] = v64;
        if (!*((void *)v2 + 64))
        {
LABEL_25:
          long long v87 = *(_OWORD *)((char *)v2 + 488);
          *(_OWORD *)((char *)v3 + 472) = *(_OWORD *)((char *)v2 + 472);
          *(_OWORD *)((char *)v3 + 488) = v87;
          *(_OWORD *)((char *)v3 + 504) = *(_OWORD *)((char *)v2 + 504);
          *((void *)v3 + 65) = *((void *)v2 + 65);
          long long v88 = *(_OWORD *)((char *)v2 + 456);
          *(_OWORD *)((char *)v3 + 440) = *(_OWORD *)((char *)v2 + 440);
          *(_OWORD *)((char *)v3 + 456) = v88;
LABEL_26:
          uint64_t v89 = v3 + 33;
          uint64_t v90 = v2 + 33;
          uint64_t v91 = *((void *)v2 + 75);
          if (v91)
          {
            if (v91 == 1)
            {
              long long v92 = v2[42];
              v3[41] = v2[41];
              v3[42] = v92;
              v3[43] = v2[43];
              long long v93 = v2[38];
              v3[37] = v2[37];
              v3[38] = v93;
              long long v94 = v2[40];
              v3[39] = v2[39];
              v3[40] = v94;
              long long v95 = v2[34];
              *uint64_t v89 = *v90;
              v3[34] = v95;
              long long v96 = v2[36];
              v3[35] = v2[35];
              v3[36] = v96;
              goto LABEL_33;
            }
            uint64_t v107 = *((void *)v2 + 66);
            uint64_t v108 = *((void *)v2 + 67);
            uint64_t v109 = *((void *)v2 + 68);
            uint64_t v110 = *((void *)v2 + 69);
            uint64_t v111 = *((void *)v2 + 70);
            uint64_t v112 = *((void *)v2 + 71);
            uint64_t v113 = *((void *)v2 + 72);
            uint64_t v114 = *((void *)v2 + 73);
            uint64_t v345 = *((unsigned __int8 *)v379 + 268);
            uint64_t v365 = v379[66];
            sub_25771CCF8(v107, v108, v109, v110, v111, v112, v113, v114, v365 | (v345 << 32));
            *((void *)v3 + 66) = v107;
            *((void *)v3 + 67) = v108;
            *((void *)v3 + 68) = v109;
            *((void *)v3 + 69) = v110;
            *((void *)v3 + 70) = v111;
            *((void *)v3 + 71) = v112;
            *((void *)v3 + 72) = v113;
            *((void *)v3 + 73) = v114;
            v381[268] = v345;
            *((_DWORD *)v381 + 66) = v365;
            *((void *)v3 + 75) = *((void *)v2 + 75);
            *((void *)v3 + 76) = *((void *)v2 + 76);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (!*((void *)v2 + 86)) {
              goto LABEL_32;
            }
          }
          else
          {
            long long v97 = v2[36];
            v3[35] = v2[35];
            v3[36] = v97;
            v3[37] = v2[37];
            *((void *)v3 + 76) = *((void *)v2 + 76);
            long long v98 = v2[34];
            *uint64_t v89 = *v90;
            v3[34] = v98;
            if (!*((void *)v2 + 86))
            {
LABEL_32:
              long long v115 = *(_OWORD *)((char *)v2 + 664);
              *(_OWORD *)((char *)v3 + 648) = *(_OWORD *)((char *)v2 + 648);
              *(_OWORD *)((char *)v3 + 664) = v115;
              *(_OWORD *)((char *)v3 + 680) = *(_OWORD *)((char *)v2 + 680);
              *((void *)v3 + 87) = *((void *)v2 + 87);
              long long v116 = *(_OWORD *)((char *)v2 + 632);
              *(_OWORD *)((char *)v3 + 616) = *(_OWORD *)((char *)v2 + 616);
              *(_OWORD *)((char *)v3 + 632) = v116;
              goto LABEL_33;
            }
          }
          uint64_t v99 = *((void *)v2 + 77);
          uint64_t v100 = *((void *)v2 + 78);
          uint64_t v101 = *((void *)v2 + 79);
          uint64_t v102 = *((void *)v2 + 80);
          uint64_t v103 = *((void *)v2 + 81);
          uint64_t v104 = *((void *)v2 + 82);
          uint64_t v105 = *((void *)v2 + 83);
          uint64_t v106 = *((void *)v2 + 84);
          uint64_t v344 = *((unsigned __int8 *)v379 + 356);
          uint64_t v364 = v379[88];
          sub_25771CCF8(v99, v100, v101, v102, v103, v104, v105, v106, v364 | (v344 << 32));
          *((void *)v3 + 77) = v99;
          *((void *)v3 + 78) = v100;
          *((void *)v3 + 79) = v101;
          *((void *)v3 + 80) = v102;
          *((void *)v3 + 81) = v103;
          *((void *)v3 + 82) = v104;
          *((void *)v3 + 83) = v105;
          *((void *)v3 + 84) = v106;
          v381[356] = v344;
          *((_DWORD *)v381 + 88) = v364;
          *((void *)v3 + 86) = *((void *)v2 + 86);
          *((void *)v3 + 87) = *((void *)v2 + 87);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          goto LABEL_33;
        }
LABEL_22:
        uint64_t v65 = *((void *)v2 + 55);
        uint64_t v66 = *((void *)v2 + 56);
        uint64_t v67 = *((void *)v2 + 57);
        uint64_t v68 = *((void *)v2 + 58);
        uint64_t v69 = *((void *)v2 + 59);
        uint64_t v70 = *((void *)v2 + 60);
        uint64_t v71 = *((void *)v2 + 61);
        uint64_t v72 = *((void *)v2 + 62);
        uint64_t v342 = *((unsigned __int8 *)v379 + 180);
        uint64_t v362 = v379[44];
        sub_25771CCF8(v65, v66, v67, v68, v69, v70, v71, v72, v362 | (v342 << 32));
        *((void *)v3 + 55) = v65;
        *((void *)v3 + 56) = v66;
        *((void *)v3 + 57) = v67;
        *((void *)v3 + 58) = v68;
        *((void *)v3 + 59) = v69;
        *((void *)v3 + 60) = v70;
        *((void *)v3 + 61) = v71;
        *((void *)v3 + 62) = v72;
        v381[180] = v342;
        *((_DWORD *)v381 + 44) = v362;
        *((void *)v3 + 64) = *((void *)v2 + 64);
        *((void *)v3 + 65) = *((void *)v2 + 65);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_26;
      }
      if (v62 == 1)
      {
        long long v73 = v2[31];
        v3[30] = v2[30];
        v3[31] = v73;
        v3[32] = v2[32];
        long long v74 = v2[27];
        v3[26] = v2[26];
        v3[27] = v74;
        long long v75 = v2[29];
        v3[28] = v2[28];
        v3[29] = v75;
        long long v76 = v2[23];
        void *__dst = *__src;
        v3[23] = v76;
        long long v77 = v2[25];
        v3[24] = v2[24];
        v3[25] = v77;
        goto LABEL_26;
      }
      if (v62 != 2)
      {
        uint64_t v78 = *((void *)v2 + 44);
        uint64_t v79 = *((void *)v2 + 45);
        uint64_t v80 = *((void *)v2 + 46);
        uint64_t v81 = *((void *)v2 + 47);
        uint64_t v82 = *((void *)v2 + 48);
        uint64_t v83 = *((void *)v2 + 49);
        uint64_t v84 = *((void *)v2 + 50);
        uint64_t v85 = *((void *)v2 + 51);
        uint64_t v343 = *((unsigned __int8 *)v379 + 92);
        uint64_t v363 = v379[22];
        sub_25771CCF8(v78, v79, v80, v81, v82, v83, v84, v85, v363 | (v343 << 32));
        *((void *)v3 + 44) = v78;
        *((void *)v3 + 45) = v79;
        *((void *)v3 + 46) = v80;
        *((void *)v3 + 47) = v81;
        *((void *)v3 + 48) = v82;
        *((void *)v3 + 49) = v83;
        *((void *)v3 + 50) = v84;
        *((void *)v3 + 51) = v85;
        v381[92] = v343;
        *((_DWORD *)v381 + 22) = v363;
        uint64_t v86 = *((void *)v2 + 54);
        *((void *)v3 + 53) = *((void *)v2 + 53);
        *((void *)v3 + 54) = v86;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((void *)v2 + 64)) {
          goto LABEL_25;
        }
        goto LABEL_22;
      }
      size_t v39 = 352;
LABEL_20:
      memcpy(__dst, __src, v39);
LABEL_33:
      int v117 = v3 + 44;
      uint64_t v118 = v2 + 44;
      if (!*((void *)v2 + 111))
      {
        long long v131 = v2[55];
        v3[54] = v2[54];
        v3[55] = v131;
        *((void *)v3 + 112) = *((void *)v2 + 112);
        long long v132 = v2[51];
        v3[50] = v2[50];
        v3[51] = v132;
        long long v133 = v2[53];
        v3[52] = v2[52];
        v3[53] = v133;
        long long v134 = v2[47];
        v3[46] = v2[46];
        v3[47] = v134;
        long long v135 = v2[49];
        v3[48] = v2[48];
        v3[49] = v135;
        long long v136 = v2[45];
        *int v117 = *v118;
        v3[45] = v136;
        goto LABEL_47;
      }
      if (*((void *)v2 + 97))
      {
        uint64_t v119 = *((void *)v2 + 88);
        uint64_t v120 = *((void *)v2 + 89);
        uint64_t v121 = *((void *)v2 + 90);
        uint64_t v122 = *((void *)v2 + 91);
        uint64_t v123 = *((void *)v2 + 92);
        uint64_t v124 = *((void *)v2 + 93);
        uint64_t v125 = *((void *)v2 + 94);
        uint64_t v126 = *((void *)v2 + 95);
        uint64_t v346 = *((unsigned __int8 *)v379 + 444);
        uint64_t v366 = v379[110];
        sub_25771CCF8(v119, v120, v121, v122, v123, v124, v125, v126, v366 | (v346 << 32));
        *((void *)v3 + 88) = v119;
        *((void *)v3 + 89) = v120;
        *((void *)v3 + 90) = v121;
        *((void *)v3 + 91) = v122;
        *((void *)v3 + 92) = v123;
        *((void *)v3 + 93) = v124;
        *((void *)v3 + 94) = v125;
        *((void *)v3 + 95) = v126;
        v381[444] = v346;
        *((_DWORD *)v381 + 110) = v366;
        *((void *)v3 + 97) = *((void *)v2 + 97);
        *((void *)v3 + 98) = *((void *)v2 + 98);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v127 = *((void *)v2 + 100);
        if (v127) {
          goto LABEL_36;
        }
      }
      else
      {
        long long v137 = v2[47];
        v3[46] = v2[46];
        v3[47] = v137;
        v3[48] = v2[48];
        *((void *)v3 + 98) = *((void *)v2 + 98);
        long long v138 = v2[45];
        *int v117 = *v118;
        v3[45] = v138;
        uint64_t v127 = *((void *)v2 + 100);
        if (v127)
        {
LABEL_36:
          *((void *)v3 + 99) = *((void *)v2 + 99);
          *((void *)v3 + 100) = v127;
          *((void *)v3 + 101) = *((void *)v2 + 101);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v128 = *((void *)v2 + 103);
          if (v128) {
            goto LABEL_37;
          }
          goto LABEL_43;
        }
      }
      *(_OWORD *)((char *)v3 + 792) = *(_OWORD *)((char *)v2 + 792);
      *((void *)v3 + 101) = *((void *)v2 + 101);
      uint64_t v128 = *((void *)v2 + 103);
      if (v128)
      {
LABEL_37:
        *((unsigned char *)v3 + 816) = *((unsigned char *)v2 + 816);
        *((void *)v3 + 103) = v128;
        *((void *)v3 + 104) = *((void *)v2 + 104);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v129 = *((void *)v2 + 106);
        if (v129) {
          goto LABEL_38;
        }
LABEL_44:
        *(_OWORD *)((char *)v3 + 840) = *(_OWORD *)((char *)v2 + 840);
        *((void *)v3 + 107) = *((void *)v2 + 107);
        uint64_t v130 = *((void *)v2 + 109);
        if (v130) {
          goto LABEL_39;
        }
LABEL_45:
        v3[54] = v2[54];
        *((void *)v3 + 110) = *((void *)v2 + 110);
        goto LABEL_46;
      }
LABEL_43:
      v3[51] = v2[51];
      *((void *)v3 + 104) = *((void *)v2 + 104);
      uint64_t v129 = *((void *)v2 + 106);
      if (!v129) {
        goto LABEL_44;
      }
LABEL_38:
      *((unsigned char *)v3 + 840) = *((unsigned char *)v2 + 840);
      *((void *)v3 + 106) = v129;
      *((void *)v3 + 107) = *((void *)v2 + 107);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v130 = *((void *)v2 + 109);
      if (!v130) {
        goto LABEL_45;
      }
LABEL_39:
      *((unsigned char *)v3 + 864) = *((unsigned char *)v2 + 864);
      *((void *)v3 + 109) = v130;
      *((void *)v3 + 110) = *((void *)v2 + 110);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_46:
      *((void *)v3 + 111) = *((void *)v2 + 111);
      *((void *)v3 + 112) = *((void *)v2 + 112);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_47:
      char v139 = (_OWORD *)((char *)v3 + 904);
      char v140 = (_OWORD *)((char *)v2 + 904);
      if (!*((void *)v2 + 136))
      {
        long long v153 = *(_OWORD *)((char *)v2 + 1080);
        *(_OWORD *)((char *)v3 + 1064) = *(_OWORD *)((char *)v2 + 1064);
        *(_OWORD *)((char *)v3 + 1080) = v153;
        *((void *)v3 + 137) = *((void *)v2 + 137);
        long long v154 = *(_OWORD *)((char *)v2 + 1016);
        *(_OWORD *)((char *)v3 + 1000) = *(_OWORD *)((char *)v2 + 1000);
        *(_OWORD *)((char *)v3 + 1016) = v154;
        long long v155 = *(_OWORD *)((char *)v2 + 1048);
        *(_OWORD *)((char *)v3 + 1032) = *(_OWORD *)((char *)v2 + 1032);
        *(_OWORD *)((char *)v3 + 1048) = v155;
        long long v156 = *(_OWORD *)((char *)v2 + 952);
        *(_OWORD *)((char *)v3 + 936) = *(_OWORD *)((char *)v2 + 936);
        *(_OWORD *)((char *)v3 + 952) = v156;
        long long v157 = *(_OWORD *)((char *)v2 + 984);
        *(_OWORD *)((char *)v3 + 968) = *(_OWORD *)((char *)v2 + 968);
        *(_OWORD *)((char *)v3 + 984) = v157;
        long long v158 = *(_OWORD *)((char *)v2 + 920);
        *char v139 = *v140;
        *(_OWORD *)((char *)v3 + 920) = v158;
        goto LABEL_61;
      }
      if (*((void *)v2 + 122))
      {
        uint64_t v141 = *((void *)v2 + 113);
        uint64_t v142 = *((void *)v2 + 114);
        uint64_t v143 = *((void *)v2 + 115);
        uint64_t v144 = *((void *)v2 + 116);
        uint64_t v145 = *((void *)v2 + 117);
        uint64_t v146 = *((void *)v2 + 118);
        uint64_t v147 = *((void *)v2 + 119);
        uint64_t v148 = *((void *)v2 + 120);
        uint64_t v347 = *((unsigned __int8 *)v379 + 644);
        uint64_t v367 = v379[160];
        sub_25771CCF8(v141, v142, v143, v144, v145, v146, v147, v148, v367 | (v347 << 32));
        *((void *)v3 + 113) = v141;
        *((void *)v3 + 114) = v142;
        *((void *)v3 + 115) = v143;
        *((void *)v3 + 116) = v144;
        *((void *)v3 + 117) = v145;
        *((void *)v3 + 118) = v146;
        *((void *)v3 + 119) = v147;
        *((void *)v3 + 120) = v148;
        v381[644] = v347;
        *((_DWORD *)v381 + 160) = v367;
        *((void *)v3 + 122) = *((void *)v2 + 122);
        *((void *)v3 + 123) = *((void *)v2 + 123);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v149 = *((void *)v2 + 125);
        if (v149) {
          goto LABEL_50;
        }
      }
      else
      {
        long long v159 = *(_OWORD *)((char *)v2 + 952);
        *(_OWORD *)((char *)v3 + 936) = *(_OWORD *)((char *)v2 + 936);
        *(_OWORD *)((char *)v3 + 952) = v159;
        *(_OWORD *)((char *)v3 + 968) = *(_OWORD *)((char *)v2 + 968);
        *((void *)v3 + 123) = *((void *)v2 + 123);
        long long v160 = *(_OWORD *)((char *)v2 + 920);
        *char v139 = *v140;
        *(_OWORD *)((char *)v3 + 920) = v160;
        uint64_t v149 = *((void *)v2 + 125);
        if (v149)
        {
LABEL_50:
          *((void *)v3 + 124) = *((void *)v2 + 124);
          *((void *)v3 + 125) = v149;
          *((void *)v3 + 126) = *((void *)v2 + 126);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v150 = *((void *)v2 + 128);
          if (v150) {
            goto LABEL_51;
          }
          goto LABEL_57;
        }
      }
      v3[62] = v2[62];
      *((void *)v3 + 126) = *((void *)v2 + 126);
      uint64_t v150 = *((void *)v2 + 128);
      if (v150)
      {
LABEL_51:
        *((unsigned char *)v3 + 1016) = *((unsigned char *)v2 + 1016);
        *((void *)v3 + 128) = v150;
        *((void *)v3 + 129) = *((void *)v2 + 129);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v151 = *((void *)v2 + 131);
        if (v151) {
          goto LABEL_52;
        }
LABEL_58:
        v3[65] = v2[65];
        *((void *)v3 + 132) = *((void *)v2 + 132);
        uint64_t v152 = *((void *)v2 + 134);
        if (v152) {
          goto LABEL_53;
        }
LABEL_59:
        *(_OWORD *)((char *)v3 + 1064) = *(_OWORD *)((char *)v2 + 1064);
        *((void *)v3 + 135) = *((void *)v2 + 135);
        goto LABEL_60;
      }
LABEL_57:
      *(_OWORD *)((char *)v3 + 1016) = *(_OWORD *)((char *)v2 + 1016);
      *((void *)v3 + 129) = *((void *)v2 + 129);
      uint64_t v151 = *((void *)v2 + 131);
      if (!v151) {
        goto LABEL_58;
      }
LABEL_52:
      *((unsigned char *)v3 + 1040) = *((unsigned char *)v2 + 1040);
      *((void *)v3 + 131) = v151;
      *((void *)v3 + 132) = *((void *)v2 + 132);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v152 = *((void *)v2 + 134);
      if (!v152) {
        goto LABEL_59;
      }
LABEL_53:
      *((unsigned char *)v3 + 1064) = *((unsigned char *)v2 + 1064);
      *((void *)v3 + 134) = v152;
      *((void *)v3 + 135) = *((void *)v2 + 135);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_60:
      *((void *)v3 + 136) = *((void *)v2 + 136);
      *((void *)v3 + 137) = *((void *)v2 + 137);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_61:
      v161 = v3 + 69;
      v162 = v2 + 69;
      if (!*((void *)v2 + 161))
      {
        long long v175 = v2[80];
        v3[79] = v2[79];
        v3[80] = v175;
        *((void *)v3 + 162) = *((void *)v2 + 162);
        long long v176 = v2[76];
        v3[75] = v2[75];
        v3[76] = v176;
        long long v177 = v2[78];
        v3[77] = v2[77];
        v3[78] = v177;
        long long v178 = v2[72];
        v3[71] = v2[71];
        v3[72] = v178;
        long long v179 = v2[74];
        v3[73] = v2[73];
        v3[74] = v179;
        long long v180 = v2[70];
        _OWORD *v161 = *v162;
        v3[70] = v180;
        goto LABEL_75;
      }
      if (*((void *)v2 + 147))
      {
        uint64_t v163 = *((void *)v2 + 138);
        uint64_t v164 = *((void *)v2 + 139);
        uint64_t v165 = *((void *)v2 + 140);
        uint64_t v166 = *((void *)v2 + 141);
        uint64_t v167 = *((void *)v2 + 142);
        uint64_t v168 = *((void *)v2 + 143);
        uint64_t v169 = *((void *)v2 + 144);
        uint64_t v170 = *((void *)v2 + 145);
        uint64_t v348 = *((unsigned __int8 *)v379 + 844);
        uint64_t v368 = v379[210];
        sub_25771CCF8(v163, v164, v165, v166, v167, v168, v169, v170, v368 | (v348 << 32));
        *((void *)v3 + 138) = v163;
        *((void *)v3 + 139) = v164;
        *((void *)v3 + 140) = v165;
        *((void *)v3 + 141) = v166;
        *((void *)v3 + 142) = v167;
        *((void *)v3 + 143) = v168;
        *((void *)v3 + 144) = v169;
        *((void *)v3 + 145) = v170;
        v381[844] = v348;
        *((_DWORD *)v381 + 210) = v368;
        *((void *)v3 + 147) = *((void *)v2 + 147);
        *((void *)v3 + 148) = *((void *)v2 + 148);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v171 = *((void *)v2 + 150);
        if (v171) {
          goto LABEL_64;
        }
      }
      else
      {
        long long v181 = v2[72];
        v3[71] = v2[71];
        v3[72] = v181;
        v3[73] = v2[73];
        *((void *)v3 + 148) = *((void *)v2 + 148);
        long long v182 = v2[70];
        _OWORD *v161 = *v162;
        v3[70] = v182;
        uint64_t v171 = *((void *)v2 + 150);
        if (v171)
        {
LABEL_64:
          *((void *)v3 + 149) = *((void *)v2 + 149);
          *((void *)v3 + 150) = v171;
          *((void *)v3 + 151) = *((void *)v2 + 151);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v172 = *((void *)v2 + 153);
          if (v172) {
            goto LABEL_65;
          }
          goto LABEL_71;
        }
      }
      *(_OWORD *)((char *)v3 + 1192) = *(_OWORD *)((char *)v2 + 1192);
      *((void *)v3 + 151) = *((void *)v2 + 151);
      uint64_t v172 = *((void *)v2 + 153);
      if (v172)
      {
LABEL_65:
        *((unsigned char *)v3 + 1216) = *((unsigned char *)v2 + 1216);
        *((void *)v3 + 153) = v172;
        *((void *)v3 + 154) = *((void *)v2 + 154);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v173 = *((void *)v2 + 156);
        if (v173) {
          goto LABEL_66;
        }
LABEL_72:
        *(_OWORD *)((char *)v3 + 1240) = *(_OWORD *)((char *)v2 + 1240);
        *((void *)v3 + 157) = *((void *)v2 + 157);
        uint64_t v174 = *((void *)v2 + 159);
        if (v174) {
          goto LABEL_67;
        }
LABEL_73:
        v3[79] = v2[79];
        *((void *)v3 + 160) = *((void *)v2 + 160);
        goto LABEL_74;
      }
LABEL_71:
      v3[76] = v2[76];
      *((void *)v3 + 154) = *((void *)v2 + 154);
      uint64_t v173 = *((void *)v2 + 156);
      if (!v173) {
        goto LABEL_72;
      }
LABEL_66:
      *((unsigned char *)v3 + 1240) = *((unsigned char *)v2 + 1240);
      *((void *)v3 + 156) = v173;
      *((void *)v3 + 157) = *((void *)v2 + 157);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v174 = *((void *)v2 + 159);
      if (!v174) {
        goto LABEL_73;
      }
LABEL_67:
      *((unsigned char *)v3 + 1264) = *((unsigned char *)v2 + 1264);
      *((void *)v3 + 159) = v174;
      *((void *)v3 + 160) = *((void *)v2 + 160);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_74:
      *((void *)v3 + 161) = *((void *)v2 + 161);
      *((void *)v3 + 162) = *((void *)v2 + 162);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_75:
      v183 = (_OWORD *)((char *)v3 + 1304);
      v184 = (_OWORD *)((char *)v2 + 1304);
      if (!*((void *)v2 + 186))
      {
        long long v197 = *(_OWORD *)((char *)v2 + 1480);
        *(_OWORD *)((char *)v3 + 1464) = *(_OWORD *)((char *)v2 + 1464);
        *(_OWORD *)((char *)v3 + 1480) = v197;
        *((void *)v3 + 187) = *((void *)v2 + 187);
        long long v198 = *(_OWORD *)((char *)v2 + 1416);
        *(_OWORD *)((char *)v3 + 1400) = *(_OWORD *)((char *)v2 + 1400);
        *(_OWORD *)((char *)v3 + 1416) = v198;
        long long v199 = *(_OWORD *)((char *)v2 + 1448);
        *(_OWORD *)((char *)v3 + 1432) = *(_OWORD *)((char *)v2 + 1432);
        *(_OWORD *)((char *)v3 + 1448) = v199;
        long long v200 = *(_OWORD *)((char *)v2 + 1352);
        *(_OWORD *)((char *)v3 + 1336) = *(_OWORD *)((char *)v2 + 1336);
        *(_OWORD *)((char *)v3 + 1352) = v200;
        long long v201 = *(_OWORD *)((char *)v2 + 1384);
        *(_OWORD *)((char *)v3 + 1368) = *(_OWORD *)((char *)v2 + 1368);
        *(_OWORD *)((char *)v3 + 1384) = v201;
        long long v202 = *(_OWORD *)((char *)v2 + 1320);
        _OWORD *v183 = *v184;
        *(_OWORD *)((char *)v3 + 1320) = v202;
        goto LABEL_89;
      }
      if (*((void *)v2 + 172))
      {
        uint64_t v185 = *((void *)v2 + 163);
        uint64_t v186 = *((void *)v2 + 164);
        uint64_t v187 = *((void *)v2 + 165);
        uint64_t v188 = *((void *)v2 + 166);
        uint64_t v189 = *((void *)v2 + 167);
        uint64_t v190 = *((void *)v2 + 168);
        uint64_t v191 = *((void *)v2 + 169);
        uint64_t v192 = *((void *)v2 + 170);
        uint64_t v349 = *((unsigned __int8 *)v379 + 1044);
        uint64_t v369 = v379[260];
        sub_25771CCF8(v185, v186, v187, v188, v189, v190, v191, v192, v369 | (v349 << 32));
        *((void *)v3 + 163) = v185;
        *((void *)v3 + 164) = v186;
        *((void *)v3 + 165) = v187;
        *((void *)v3 + 166) = v188;
        *((void *)v3 + 167) = v189;
        *((void *)v3 + 168) = v190;
        *((void *)v3 + 169) = v191;
        *((void *)v3 + 170) = v192;
        v381[1044] = v349;
        *((_DWORD *)v381 + 260) = v369;
        *((void *)v3 + 172) = *((void *)v2 + 172);
        *((void *)v3 + 173) = *((void *)v2 + 173);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v193 = *((void *)v2 + 175);
        if (v193) {
          goto LABEL_78;
        }
      }
      else
      {
        long long v203 = *(_OWORD *)((char *)v2 + 1352);
        *(_OWORD *)((char *)v3 + 1336) = *(_OWORD *)((char *)v2 + 1336);
        *(_OWORD *)((char *)v3 + 1352) = v203;
        *(_OWORD *)((char *)v3 + 1368) = *(_OWORD *)((char *)v2 + 1368);
        *((void *)v3 + 173) = *((void *)v2 + 173);
        long long v204 = *(_OWORD *)((char *)v2 + 1320);
        _OWORD *v183 = *v184;
        *(_OWORD *)((char *)v3 + 1320) = v204;
        uint64_t v193 = *((void *)v2 + 175);
        if (v193)
        {
LABEL_78:
          *((void *)v3 + 174) = *((void *)v2 + 174);
          *((void *)v3 + 175) = v193;
          *((void *)v3 + 176) = *((void *)v2 + 176);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v194 = *((void *)v2 + 178);
          if (v194) {
            goto LABEL_79;
          }
          goto LABEL_85;
        }
      }
      v3[87] = v2[87];
      *((void *)v3 + 176) = *((void *)v2 + 176);
      uint64_t v194 = *((void *)v2 + 178);
      if (v194)
      {
LABEL_79:
        *((unsigned char *)v3 + 1416) = *((unsigned char *)v2 + 1416);
        *((void *)v3 + 178) = v194;
        *((void *)v3 + 179) = *((void *)v2 + 179);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v195 = *((void *)v2 + 181);
        if (v195) {
          goto LABEL_80;
        }
LABEL_86:
        v3[90] = v2[90];
        *((void *)v3 + 182) = *((void *)v2 + 182);
        uint64_t v196 = *((void *)v2 + 184);
        if (v196) {
          goto LABEL_81;
        }
LABEL_87:
        *(_OWORD *)((char *)v3 + 1464) = *(_OWORD *)((char *)v2 + 1464);
        *((void *)v3 + 185) = *((void *)v2 + 185);
        goto LABEL_88;
      }
LABEL_85:
      *(_OWORD *)((char *)v3 + 1416) = *(_OWORD *)((char *)v2 + 1416);
      *((void *)v3 + 179) = *((void *)v2 + 179);
      uint64_t v195 = *((void *)v2 + 181);
      if (!v195) {
        goto LABEL_86;
      }
LABEL_80:
      *((unsigned char *)v3 + 1440) = *((unsigned char *)v2 + 1440);
      *((void *)v3 + 181) = v195;
      *((void *)v3 + 182) = *((void *)v2 + 182);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v196 = *((void *)v2 + 184);
      if (!v196) {
        goto LABEL_87;
      }
LABEL_81:
      *((unsigned char *)v3 + 1464) = *((unsigned char *)v2 + 1464);
      *((void *)v3 + 184) = v196;
      *((void *)v3 + 185) = *((void *)v2 + 185);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_88:
      *((void *)v3 + 186) = *((void *)v2 + 186);
      *((void *)v3 + 187) = *((void *)v2 + 187);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_89:
      v205 = v3 + 94;
      v206 = v2 + 94;
      if (*((void *)v2 + 211))
      {
        if (*((void *)v2 + 197))
        {
          uint64_t v207 = *((void *)v2 + 188);
          uint64_t v208 = *((void *)v2 + 189);
          uint64_t v209 = *((void *)v2 + 190);
          uint64_t v210 = *((void *)v2 + 191);
          uint64_t v211 = *((void *)v2 + 192);
          uint64_t v212 = *((void *)v2 + 193);
          uint64_t v213 = *((void *)v2 + 194);
          uint64_t v214 = *((void *)v2 + 195);
          uint64_t v350 = *((unsigned __int8 *)v379 + 1244);
          uint64_t v370 = v379[310];
          sub_25771CCF8(v207, v208, v209, v210, v211, v212, v213, v214, v370 | (v350 << 32));
          *((void *)v3 + 188) = v207;
          *((void *)v3 + 189) = v208;
          *((void *)v3 + 190) = v209;
          *((void *)v3 + 191) = v210;
          *((void *)v3 + 192) = v211;
          *((void *)v3 + 193) = v212;
          *((void *)v3 + 194) = v213;
          *((void *)v3 + 195) = v214;
          v381[1244] = v350;
          *((_DWORD *)v381 + 310) = v370;
          *((void *)v3 + 197) = *((void *)v2 + 197);
          *((void *)v3 + 198) = *((void *)v2 + 198);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v215 = *((void *)v2 + 200);
          if (v215) {
            goto LABEL_92;
          }
        }
        else
        {
          long long v225 = v2[97];
          v3[96] = v2[96];
          v3[97] = v225;
          v3[98] = v2[98];
          *((void *)v3 + 198) = *((void *)v2 + 198);
          long long v226 = v2[95];
          _OWORD *v205 = *v206;
          v3[95] = v226;
          uint64_t v215 = *((void *)v2 + 200);
          if (v215)
          {
LABEL_92:
            *((void *)v3 + 199) = *((void *)v2 + 199);
            *((void *)v3 + 200) = v215;
            *((void *)v3 + 201) = *((void *)v2 + 201);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v216 = *((void *)v2 + 203);
            if (v216) {
              goto LABEL_93;
            }
            goto LABEL_99;
          }
        }
        *(_OWORD *)((char *)v3 + 1592) = *(_OWORD *)((char *)v2 + 1592);
        *((void *)v3 + 201) = *((void *)v2 + 201);
        uint64_t v216 = *((void *)v2 + 203);
        if (v216)
        {
LABEL_93:
          *((unsigned char *)v3 + 1616) = *((unsigned char *)v2 + 1616);
          *((void *)v3 + 203) = v216;
          *((void *)v3 + 204) = *((void *)v2 + 204);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v217 = *((void *)v2 + 206);
          if (v217) {
            goto LABEL_94;
          }
          goto LABEL_100;
        }
LABEL_99:
        v3[101] = v2[101];
        *((void *)v3 + 204) = *((void *)v2 + 204);
        uint64_t v217 = *((void *)v2 + 206);
        if (v217)
        {
LABEL_94:
          *((unsigned char *)v3 + 1640) = *((unsigned char *)v2 + 1640);
          *((void *)v3 + 206) = v217;
          *((void *)v3 + 207) = *((void *)v2 + 207);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v218 = *((void *)v2 + 209);
          if (v218)
          {
LABEL_95:
            *((unsigned char *)v3 + 1664) = *((unsigned char *)v2 + 1664);
            *((void *)v3 + 209) = v218;
            *((void *)v3 + 210) = *((void *)v2 + 210);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_102:
            *((void *)v3 + 211) = *((void *)v2 + 211);
            *((void *)v3 + 212) = *((void *)v2 + 212);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_103;
          }
LABEL_101:
          v3[104] = v2[104];
          *((void *)v3 + 210) = *((void *)v2 + 210);
          goto LABEL_102;
        }
LABEL_100:
        *(_OWORD *)((char *)v3 + 1640) = *(_OWORD *)((char *)v2 + 1640);
        *((void *)v3 + 207) = *((void *)v2 + 207);
        uint64_t v218 = *((void *)v2 + 209);
        if (v218) {
          goto LABEL_95;
        }
        goto LABEL_101;
      }
      long long v219 = v2[105];
      v3[104] = v2[104];
      v3[105] = v219;
      *((void *)v3 + 212) = *((void *)v2 + 212);
      long long v220 = v2[101];
      v3[100] = v2[100];
      v3[101] = v220;
      long long v221 = v2[103];
      v3[102] = v2[102];
      v3[103] = v221;
      long long v222 = v2[97];
      v3[96] = v2[96];
      v3[97] = v222;
      long long v223 = v2[99];
      v3[98] = v2[98];
      v3[99] = v223;
      long long v224 = v2[95];
      _OWORD *v205 = *v206;
      v3[95] = v224;
LABEL_103:
      v227 = (_OWORD *)((char *)v3 + 1704);
      v228 = (_OWORD *)((char *)v2 + 1704);
      switch(*((void *)v2 + 222))
      {
        case 0:
          long long v229 = *(_OWORD *)((char *)v2 + 1752);
          *(_OWORD *)((char *)v3 + 1736) = *(_OWORD *)((char *)v2 + 1736);
          *(_OWORD *)((char *)v3 + 1752) = v229;
          *(_OWORD *)((char *)v3 + 1768) = *(_OWORD *)((char *)v2 + 1768);
          *((void *)v3 + 223) = *((void *)v2 + 223);
          long long v230 = *(_OWORD *)((char *)v2 + 1720);
          _OWORD *v227 = *v228;
          *(_OWORD *)((char *)v3 + 1720) = v230;
          if (!*((void *)v2 + 233)) {
            goto LABEL_107;
          }
          goto LABEL_105;
        case 1:
          long long v249 = *(_OWORD *)((char *)v2 + 1848);
          *(_OWORD *)((char *)v3 + 1832) = *(_OWORD *)((char *)v2 + 1832);
          *(_OWORD *)((char *)v3 + 1848) = v249;
          *(_OWORD *)((char *)v3 + 1864) = *(_OWORD *)((char *)v2 + 1864);
          long long v250 = *(_OWORD *)((char *)v2 + 1784);
          *(_OWORD *)((char *)v3 + 1768) = *(_OWORD *)((char *)v2 + 1768);
          *(_OWORD *)((char *)v3 + 1784) = v250;
          long long v251 = *(_OWORD *)((char *)v2 + 1816);
          *(_OWORD *)((char *)v3 + 1800) = *(_OWORD *)((char *)v2 + 1800);
          *(_OWORD *)((char *)v3 + 1816) = v251;
          long long v252 = *(_OWORD *)((char *)v2 + 1720);
          _OWORD *v227 = *v228;
          *(_OWORD *)((char *)v3 + 1720) = v252;
          long long v253 = *(_OWORD *)((char *)v2 + 1752);
          *(_OWORD *)((char *)v3 + 1736) = *(_OWORD *)((char *)v2 + 1736);
          *(_OWORD *)((char *)v3 + 1752) = v253;
          goto LABEL_109;
        case 2:
          memcpy(v227, v228, 0x160uLL);
          goto LABEL_118;
        case 3:
          size_t v262 = 704;
          goto LABEL_122;
        default:
          uint64_t v239 = *((void *)v2 + 213);
          uint64_t v240 = *((void *)v2 + 214);
          uint64_t v241 = *((void *)v2 + 215);
          uint64_t v242 = *((void *)v2 + 216);
          uint64_t v243 = *((void *)v2 + 217);
          uint64_t v244 = *((void *)v2 + 218);
          uint64_t v245 = *((void *)v2 + 219);
          uint64_t v246 = *((void *)v2 + 220);
          uint64_t v352 = *((unsigned __int8 *)v379 + 1444);
          uint64_t v372 = v379[360];
          sub_25771CCF8(v239, v240, v241, v242, v243, v244, v245, v246, v372 | (v352 << 32));
          *((void *)v3 + 213) = v239;
          *((void *)v3 + 214) = v240;
          *((void *)v3 + 215) = v241;
          *((void *)v3 + 216) = v242;
          *((void *)v3 + 217) = v243;
          *((void *)v3 + 218) = v244;
          *((void *)v3 + 219) = v245;
          *((void *)v3 + 220) = v246;
          v381[1444] = v352;
          *((_DWORD *)v381 + 360) = v372;
          *((void *)v3 + 222) = *((void *)v2 + 222);
          *((void *)v3 + 223) = *((void *)v2 + 223);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (*((void *)v2 + 233))
          {
LABEL_105:
            uint64_t v231 = *((void *)v2 + 224);
            uint64_t v232 = *((void *)v2 + 225);
            uint64_t v233 = *((void *)v2 + 226);
            uint64_t v234 = *((void *)v2 + 227);
            uint64_t v235 = *((void *)v2 + 228);
            uint64_t v236 = *((void *)v2 + 229);
            uint64_t v237 = *((void *)v2 + 230);
            uint64_t v238 = *((void *)v2 + 231);
            uint64_t v351 = *((unsigned __int8 *)v379 + 1532);
            uint64_t v371 = v379[382];
            sub_25771CCF8(v231, v232, v233, v234, v235, v236, v237, v238, v371 | (v351 << 32));
            *((void *)v3 + 224) = v231;
            *((void *)v3 + 225) = v232;
            *((void *)v3 + 226) = v233;
            *((void *)v3 + 227) = v234;
            *((void *)v3 + 228) = v235;
            *((void *)v3 + 229) = v236;
            *((void *)v3 + 230) = v237;
            *((void *)v3 + 231) = v238;
            v381[1532] = v351;
            *((_DWORD *)v381 + 382) = v371;
            *((void *)v3 + 233) = *((void *)v2 + 233);
            *((void *)v3 + 234) = *((void *)v2 + 234);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          else
          {
LABEL_107:
            long long v247 = v2[115];
            v3[114] = v2[114];
            v3[115] = v247;
            v3[116] = v2[116];
            *((void *)v3 + 234) = *((void *)v2 + 234);
            long long v248 = v2[113];
            v3[112] = v2[112];
            v3[113] = v248;
          }
LABEL_109:
          v254 = (_OWORD *)((char *)v3 + 1880);
          v255 = (_OWORD *)((char *)v2 + 1880);
          uint64_t v256 = *((void *)v2 + 244);
          if (v256)
          {
            if (v256 == 1)
            {
              long long v257 = *(_OWORD *)((char *)v2 + 2024);
              *(_OWORD *)((char *)v3 + 2008) = *(_OWORD *)((char *)v2 + 2008);
              *(_OWORD *)((char *)v3 + 2024) = v257;
              *(_OWORD *)((char *)v3 + 2040) = *(_OWORD *)((char *)v2 + 2040);
              long long v258 = *(_OWORD *)((char *)v2 + 1960);
              *(_OWORD *)((char *)v3 + 1944) = *(_OWORD *)((char *)v2 + 1944);
              *(_OWORD *)((char *)v3 + 1960) = v258;
              long long v259 = *(_OWORD *)((char *)v2 + 1992);
              *(_OWORD *)((char *)v3 + 1976) = *(_OWORD *)((char *)v2 + 1976);
              *(_OWORD *)((char *)v3 + 1992) = v259;
              long long v260 = *(_OWORD *)((char *)v2 + 1896);
              _OWORD *v254 = *v255;
              *(_OWORD *)((char *)v3 + 1896) = v260;
              long long v261 = *(_OWORD *)((char *)v2 + 1928);
              *(_OWORD *)((char *)v3 + 1912) = *(_OWORD *)((char *)v2 + 1912);
              *(_OWORD *)((char *)v3 + 1928) = v261;
              goto LABEL_118;
            }
            uint64_t v273 = *((void *)v2 + 235);
            uint64_t v274 = *((void *)v2 + 236);
            uint64_t v275 = *((void *)v2 + 237);
            uint64_t v276 = *((void *)v2 + 238);
            uint64_t v277 = *((void *)v2 + 239);
            uint64_t v278 = *((void *)v2 + 240);
            uint64_t v279 = *((void *)v2 + 241);
            uint64_t v280 = *((void *)v2 + 242);
            uint64_t v354 = *((unsigned __int8 *)v379 + 1620);
            uint64_t v374 = v379[404];
            sub_25771CCF8(v273, v274, v275, v276, v277, v278, v279, v280, v374 | (v354 << 32));
            *((void *)v3 + 235) = v273;
            *((void *)v3 + 236) = v274;
            *((void *)v3 + 237) = v275;
            *((void *)v3 + 238) = v276;
            *((void *)v3 + 239) = v277;
            *((void *)v3 + 240) = v278;
            *((void *)v3 + 241) = v279;
            *((void *)v3 + 242) = v280;
            v381[1620] = v354;
            *((_DWORD *)v381 + 404) = v374;
            *((void *)v3 + 244) = *((void *)v2 + 244);
            *((void *)v3 + 245) = *((void *)v2 + 245);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (!*((void *)v2 + 255)) {
              goto LABEL_117;
            }
LABEL_115:
            uint64_t v265 = *((void *)v2 + 246);
            uint64_t v266 = *((void *)v2 + 247);
            uint64_t v267 = *((void *)v2 + 248);
            uint64_t v268 = *((void *)v2 + 249);
            uint64_t v269 = *((void *)v2 + 250);
            uint64_t v270 = *((void *)v2 + 251);
            uint64_t v271 = *((void *)v2 + 252);
            uint64_t v272 = *((void *)v2 + 253);
            uint64_t v353 = *((unsigned __int8 *)v379 + 1708);
            uint64_t v373 = v379[426];
            sub_25771CCF8(v265, v266, v267, v268, v269, v270, v271, v272, v373 | (v353 << 32));
            *((void *)v3 + 246) = v265;
            *((void *)v3 + 247) = v266;
            *((void *)v3 + 248) = v267;
            *((void *)v3 + 249) = v268;
            *((void *)v3 + 250) = v269;
            *((void *)v3 + 251) = v270;
            *((void *)v3 + 252) = v271;
            *((void *)v3 + 253) = v272;
            v381[1708] = v353;
            *((_DWORD *)v381 + 426) = v373;
            *((void *)v3 + 255) = *((void *)v2 + 255);
            *((void *)v3 + 256) = *((void *)v2 + 256);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_118;
          }
          long long v263 = *(_OWORD *)((char *)v2 + 1928);
          *(_OWORD *)((char *)v3 + 1912) = *(_OWORD *)((char *)v2 + 1912);
          *(_OWORD *)((char *)v3 + 1928) = v263;
          *(_OWORD *)((char *)v3 + 1944) = *(_OWORD *)((char *)v2 + 1944);
          *((void *)v3 + 245) = *((void *)v2 + 245);
          long long v264 = *(_OWORD *)((char *)v2 + 1896);
          _OWORD *v254 = *v255;
          *(_OWORD *)((char *)v3 + 1896) = v264;
          if (*((void *)v2 + 255)) {
            goto LABEL_115;
          }
LABEL_117:
          long long v281 = v2[126];
          v3[125] = v2[125];
          v3[126] = v281;
          v3[127] = v2[127];
          *((void *)v3 + 256) = *((void *)v2 + 256);
          long long v282 = v2[124];
          v3[123] = v2[123];
          v3[124] = v282;
LABEL_118:
          v227 = (_OWORD *)((char *)v3 + 2056);
          v228 = (_OWORD *)((char *)v2 + 2056);
          uint64_t v283 = *((void *)v2 + 266);
          if (!v283)
          {
            long long v284 = *(_OWORD *)((char *)v2 + 2104);
            *(_OWORD *)((char *)v3 + 2088) = *(_OWORD *)((char *)v2 + 2088);
            *(_OWORD *)((char *)v3 + 2104) = v284;
            *(_OWORD *)((char *)v3 + 2120) = *(_OWORD *)((char *)v2 + 2120);
            *((void *)v3 + 267) = *((void *)v2 + 267);
            long long v285 = *(_OWORD *)((char *)v2 + 2072);
            _OWORD *v227 = *v228;
            *(_OWORD *)((char *)v3 + 2072) = v285;
            if (!*((void *)v2 + 277))
            {
LABEL_127:
              long long v307 = v2[137];
              v3[136] = v2[136];
              v3[137] = v307;
              v3[138] = v2[138];
              *((void *)v3 + 278) = *((void *)v2 + 278);
              long long v308 = v2[135];
              v3[134] = v2[134];
              v3[135] = v308;
LABEL_128:
              v309 = (_OWORD *)((char *)v3 + 2232);
              v310 = (_OWORD *)((char *)v2 + 2232);
              uint64_t v311 = *((void *)v2 + 288);
              if (v311)
              {
                if (v311 == 1)
                {
                  long long v312 = *(_OWORD *)((char *)v2 + 2376);
                  *(_OWORD *)((char *)v3 + 2360) = *(_OWORD *)((char *)v2 + 2360);
                  *(_OWORD *)((char *)v3 + 2376) = v312;
                  *(_OWORD *)((char *)v3 + 2392) = *(_OWORD *)((char *)v2 + 2392);
                  long long v313 = *(_OWORD *)((char *)v2 + 2312);
                  *(_OWORD *)((char *)v3 + 2296) = *(_OWORD *)((char *)v2 + 2296);
                  *(_OWORD *)((char *)v3 + 2312) = v313;
                  long long v314 = *(_OWORD *)((char *)v2 + 2344);
                  *(_OWORD *)((char *)v3 + 2328) = *(_OWORD *)((char *)v2 + 2328);
                  *(_OWORD *)((char *)v3 + 2344) = v314;
                  long long v315 = *(_OWORD *)((char *)v2 + 2248);
                  _OWORD *v309 = *v310;
                  *(_OWORD *)((char *)v3 + 2248) = v315;
                  long long v316 = *(_OWORD *)((char *)v2 + 2280);
                  *(_OWORD *)((char *)v3 + 2264) = *(_OWORD *)((char *)v2 + 2264);
                  *(_OWORD *)((char *)v3 + 2280) = v316;
                  return v3;
                }
                uint64_t v327 = *((void *)v2 + 279);
                uint64_t v328 = *((void *)v2 + 280);
                uint64_t v329 = *((void *)v2 + 281);
                uint64_t v330 = *((void *)v2 + 282);
                uint64_t v331 = *((void *)v2 + 283);
                uint64_t v332 = *((void *)v2 + 284);
                uint64_t v333 = *((void *)v2 + 285);
                uint64_t v334 = *((void *)v2 + 286);
                uint64_t v357 = *((unsigned __int8 *)v379 + 1972);
                uint64_t v378 = v379[492];
                sub_25771CCF8(v327, v328, v329, v330, v331, v332, v333, v334, v378 | (v357 << 32));
                *((void *)v3 + 279) = v327;
                *((void *)v3 + 280) = v328;
                *((void *)v3 + 281) = v329;
                *((void *)v3 + 282) = v330;
                *((void *)v3 + 283) = v331;
                *((void *)v3 + 284) = v332;
                *((void *)v3 + 285) = v333;
                *((void *)v3 + 286) = v334;
                v381[1972] = v357;
                *((_DWORD *)v381 + 492) = v378;
                *((void *)v3 + 288) = *((void *)v2 + 288);
                *((void *)v3 + 289) = *((void *)v2 + 289);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                if (!*((void *)v2 + 299))
                {
LABEL_134:
                  long long v335 = v2[148];
                  v3[147] = v2[147];
                  v3[148] = v335;
                  v3[149] = v2[149];
                  *((void *)v3 + 300) = *((void *)v2 + 300);
                  long long v336 = v2[146];
                  v3[145] = v2[145];
                  v3[146] = v336;
                  return v3;
                }
              }
              else
              {
                long long v317 = *(_OWORD *)((char *)v2 + 2280);
                *(_OWORD *)((char *)v3 + 2264) = *(_OWORD *)((char *)v2 + 2264);
                *(_OWORD *)((char *)v3 + 2280) = v317;
                *(_OWORD *)((char *)v3 + 2296) = *(_OWORD *)((char *)v2 + 2296);
                *((void *)v3 + 289) = *((void *)v2 + 289);
                long long v318 = *(_OWORD *)((char *)v2 + 2248);
                _OWORD *v309 = *v310;
                *(_OWORD *)((char *)v3 + 2248) = v318;
                if (!*((void *)v2 + 299)) {
                  goto LABEL_134;
                }
              }
              uint64_t v319 = *((void *)v2 + 290);
              uint64_t v320 = *((void *)v2 + 291);
              uint64_t v321 = *((void *)v2 + 292);
              uint64_t v322 = *((void *)v2 + 293);
              uint64_t v323 = *((void *)v2 + 294);
              uint64_t v324 = *((void *)v2 + 295);
              uint64_t v325 = *((void *)v2 + 296);
              uint64_t v326 = *((void *)v2 + 297);
              uint64_t v377 = *((unsigned __int8 *)v379 + 2060);
              uint64_t v380 = v379[514];
              sub_25771CCF8(v319, v320, v321, v322, v323, v324, v325, v326, v380 | (v377 << 32));
              *((void *)v3 + 290) = v319;
              *((void *)v3 + 291) = v320;
              *((void *)v3 + 292) = v321;
              *((void *)v3 + 293) = v322;
              *((void *)v3 + 294) = v323;
              *((void *)v3 + 295) = v324;
              *((void *)v3 + 296) = v325;
              *((void *)v3 + 297) = v326;
              v381[2060] = v377;
              *((_DWORD *)v381 + 514) = v380;
              *((void *)v3 + 299) = *((void *)v2 + 299);
              *((void *)v3 + 300) = *((void *)v2 + 300);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              return v3;
            }
LABEL_124:
            uint64_t v286 = *((void *)v2 + 268);
            uint64_t v287 = *((void *)v2 + 269);
            uint64_t v288 = *((void *)v2 + 270);
            uint64_t v289 = *((void *)v2 + 271);
            uint64_t v290 = *((void *)v2 + 272);
            uint64_t v291 = *((void *)v2 + 273);
            uint64_t v292 = *((void *)v2 + 274);
            uint64_t v293 = *((void *)v2 + 275);
            uint64_t v355 = *((unsigned __int8 *)v379 + 1884);
            uint64_t v375 = v379[470];
            sub_25771CCF8(v286, v287, v288, v289, v290, v291, v292, v293, v375 | (v355 << 32));
            *((void *)v3 + 268) = v286;
            *((void *)v3 + 269) = v287;
            *((void *)v3 + 270) = v288;
            *((void *)v3 + 271) = v289;
            *((void *)v3 + 272) = v290;
            *((void *)v3 + 273) = v291;
            *((void *)v3 + 274) = v292;
            *((void *)v3 + 275) = v293;
            v381[1884] = v355;
            *((_DWORD *)v381 + 470) = v375;
            *((void *)v3 + 277) = *((void *)v2 + 277);
            *((void *)v3 + 278) = *((void *)v2 + 278);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            goto LABEL_128;
          }
          if (v283 == 1)
          {
            long long v294 = *(_OWORD *)((char *)v2 + 2200);
            *(_OWORD *)((char *)v3 + 2184) = *(_OWORD *)((char *)v2 + 2184);
            *(_OWORD *)((char *)v3 + 2200) = v294;
            *(_OWORD *)((char *)v3 + 2216) = *(_OWORD *)((char *)v2 + 2216);
            long long v295 = *(_OWORD *)((char *)v2 + 2136);
            *(_OWORD *)((char *)v3 + 2120) = *(_OWORD *)((char *)v2 + 2120);
            *(_OWORD *)((char *)v3 + 2136) = v295;
            long long v296 = *(_OWORD *)((char *)v2 + 2168);
            *(_OWORD *)((char *)v3 + 2152) = *(_OWORD *)((char *)v2 + 2152);
            *(_OWORD *)((char *)v3 + 2168) = v296;
            long long v297 = *(_OWORD *)((char *)v2 + 2072);
            _OWORD *v227 = *v228;
            *(_OWORD *)((char *)v3 + 2072) = v297;
            long long v298 = *(_OWORD *)((char *)v2 + 2104);
            *(_OWORD *)((char *)v3 + 2088) = *(_OWORD *)((char *)v2 + 2088);
            *(_OWORD *)((char *)v3 + 2104) = v298;
            goto LABEL_128;
          }
          if (v283 != 2)
          {
            uint64_t v299 = *((void *)v2 + 257);
            uint64_t v300 = *((void *)v2 + 258);
            uint64_t v301 = *((void *)v2 + 259);
            uint64_t v302 = *((void *)v2 + 260);
            uint64_t v303 = *((void *)v2 + 261);
            uint64_t v304 = *((void *)v2 + 262);
            uint64_t v305 = *((void *)v2 + 263);
            uint64_t v306 = *((void *)v2 + 264);
            uint64_t v356 = *((unsigned __int8 *)v379 + 1796);
            uint64_t v376 = v379[448];
            sub_25771CCF8(v299, v300, v301, v302, v303, v304, v305, v306, v376 | (v356 << 32));
            *((void *)v3 + 257) = v299;
            *((void *)v3 + 258) = v300;
            *((void *)v3 + 259) = v301;
            *((void *)v3 + 260) = v302;
            *((void *)v3 + 261) = v303;
            *((void *)v3 + 262) = v304;
            *((void *)v3 + 263) = v305;
            *((void *)v3 + 264) = v306;
            v381[1796] = v356;
            *((_DWORD *)v381 + 448) = v376;
            *((void *)v3 + 266) = *((void *)v2 + 266);
            *((void *)v3 + 267) = *((void *)v2 + 267);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (!*((void *)v2 + 277)) {
              goto LABEL_127;
            }
            goto LABEL_124;
          }
          size_t v262 = 352;
LABEL_122:
          memcpy(v227, v228, v262);
          return v3;
      }
  }
}

char *assignWithCopy for ActivityFlexibleUpdateTheme(char *__dst, char *__src)
{
  v1793 = (unsigned int *)(__src + 328);
  v1795 = (unsigned int *)(__dst + 328);
  uint64_t v4 = *((void *)__dst + 9);
  uint64_t v5 = *((void *)__src + 9);
  if (v4 == 3)
  {
    if (v5 != 3)
    {
      if (v5)
      {
        if (v5 == 1)
        {
          long long v29 = *(_OWORD *)__src;
          long long v30 = *((_OWORD *)__src + 2);
          *((_OWORD *)__dst + 1) = *((_OWORD *)__src + 1);
          *((_OWORD *)__dst + 2) = v30;
          *(_OWORD *)__dst = v29;
          long long v31 = *((_OWORD *)__src + 3);
          long long v32 = *((_OWORD *)__src + 4);
          long long v33 = *((_OWORD *)__src + 6);
          *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
          *((_OWORD *)__dst + 6) = v33;
          *((_OWORD *)__dst + 3) = v31;
          *((_OWORD *)__dst + 4) = v32;
          long long v34 = *((_OWORD *)__src + 7);
          long long v35 = *((_OWORD *)__src + 8);
          long long v36 = *((_OWORD *)__src + 10);
          *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
          *((_OWORD *)__dst + 10) = v36;
          *((_OWORD *)__dst + 7) = v34;
          *((_OWORD *)__dst + 8) = v35;
          goto LABEL_23;
        }
        if (v5 == 2)
        {
          memcpy(__dst, __src, 0x160uLL);
LABEL_33:
          uint64_t v6 = __dst + 352;
          uint64_t v7 = __src + 352;
          uint64_t v92 = *((void *)__src + 53);
          switch(v92)
          {
            case 0:
              long long v93 = *((_OWORD *)__src + 23);
              *uint64_t v6 = *(_OWORD *)v7;
              *((_OWORD *)__dst + 23) = v93;
              long long v94 = *((_OWORD *)__src + 24);
              long long v95 = *((_OWORD *)__src + 25);
              long long v96 = *((_OWORD *)__src + 26);
              *((void *)__dst + 54) = *((void *)__src + 54);
              *((_OWORD *)__dst + 25) = v95;
              *((_OWORD *)__dst + 26) = v96;
              *((_OWORD *)__dst + 24) = v94;
              if (*((void *)__src + 64))
              {
LABEL_98:
                uint64_t v344 = *((void *)__src + 55);
                uint64_t v345 = *((void *)__src + 56);
                uint64_t v346 = *((void *)__src + 57);
                uint64_t v347 = *((void *)__src + 58);
                uint64_t v348 = *((void *)__src + 59);
                uint64_t v349 = *((void *)__src + 60);
                uint64_t v350 = *((void *)__src + 61);
                uint64_t v351 = *((void *)__src + 62);
                uint64_t v1669 = *((unsigned __int8 *)v1793 + 180);
                uint64_t v1739 = v1793[44];
                sub_25771CCF8(v344, v345, v346, v347, v348, v349, v350, v351, v1739 | (v1669 << 32));
                *((void *)__dst + 55) = v344;
                *((void *)__dst + 56) = v345;
                *((void *)__dst + 57) = v346;
                *((void *)__dst + 58) = v347;
                *((void *)__dst + 59) = v348;
                *((void *)__dst + 60) = v349;
                *((void *)__dst + 61) = v350;
                *((void *)__dst + 62) = v351;
                *((unsigned char *)v1795 + 180) = v1669;
                v1795[44] = v1739;
                *((void *)__dst + 64) = *((void *)__src + 64);
                *((void *)__dst + 65) = *((void *)__src + 65);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                goto LABEL_414;
              }
LABEL_412:
              long long v930 = *(_OWORD *)(__src + 456);
              *(_OWORD *)(__dst + 440) = *(_OWORD *)(__src + 440);
              *(_OWORD *)(__dst + 456) = v930;
              long long v931 = *(_OWORD *)(__src + 472);
              long long v932 = *(_OWORD *)(__src + 488);
              long long v933 = *(_OWORD *)(__src + 504);
              *((void *)__dst + 65) = *((void *)__src + 65);
              *(_OWORD *)(__dst + 488) = v932;
              *(_OWORD *)(__dst + 504) = v933;
              *(_OWORD *)(__dst + 472) = v931;
              goto LABEL_414;
            case 1:
              long long v97 = *(_OWORD *)v7;
              long long v98 = *((_OWORD *)__src + 24);
              *((_OWORD *)__dst + 23) = *((_OWORD *)__src + 23);
              *((_OWORD *)__dst + 24) = v98;
              *uint64_t v6 = v97;
              long long v99 = *((_OWORD *)__src + 25);
              long long v100 = *((_OWORD *)__src + 26);
              long long v101 = *((_OWORD *)__src + 28);
              *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
              *((_OWORD *)__dst + 28) = v101;
              *((_OWORD *)__dst + 25) = v99;
              *((_OWORD *)__dst + 26) = v100;
              long long v102 = *((_OWORD *)__src + 29);
              long long v103 = *((_OWORD *)__src + 30);
              long long v104 = *((_OWORD *)__src + 32);
              *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
              *((_OWORD *)__dst + 32) = v104;
              *((_OWORD *)__dst + 29) = v102;
              *((_OWORD *)__dst + 30) = v103;
LABEL_414:
              v942 = __dst + 528;
              v943 = __src + 528;
              uint64_t v944 = *((void *)__src + 75);
              if (!v944)
              {
                long long v953 = *((_OWORD *)__src + 34);
                _OWORD *v942 = *v943;
                *((_OWORD *)__dst + 34) = v953;
                long long v954 = *((_OWORD *)__src + 35);
                long long v955 = *((_OWORD *)__src + 36);
                long long v956 = *((_OWORD *)__src + 37);
                *((void *)__dst + 76) = *((void *)__src + 76);
                *((_OWORD *)__dst + 36) = v955;
                *((_OWORD *)__dst + 37) = v956;
                *((_OWORD *)__dst + 35) = v954;
                if (*((void *)__src + 86))
                {
LABEL_464:
                  uint64_t v1154 = *((void *)__src + 77);
                  uint64_t v1155 = *((void *)__src + 78);
                  uint64_t v1156 = *((void *)__src + 79);
                  uint64_t v1157 = *((void *)__src + 80);
                  uint64_t v1158 = *((void *)__src + 81);
                  uint64_t v1159 = *((void *)__src + 82);
                  uint64_t v1160 = *((void *)__src + 83);
                  uint64_t v1161 = *((void *)__src + 84);
                  uint64_t v1700 = *((unsigned __int8 *)v1793 + 356);
                  uint64_t v1770 = v1793[88];
                  sub_25771CCF8(v1154, v1155, v1156, v1157, v1158, v1159, v1160, v1161, v1770 | (v1700 << 32));
                  *((void *)__dst + 77) = v1154;
                  *((void *)__dst + 78) = v1155;
                  *((void *)__dst + 79) = v1156;
                  *((void *)__dst + 80) = v1157;
                  *((void *)__dst + 81) = v1158;
                  *((void *)__dst + 82) = v1159;
                  *((void *)__dst + 83) = v1160;
                  *((void *)__dst + 84) = v1161;
                  *((unsigned char *)v1795 + 356) = v1700;
                  v1795[88] = v1770;
                  *((void *)__dst + 86) = *((void *)__src + 86);
                  *((void *)__dst + 87) = *((void *)__src + 87);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  goto LABEL_104;
                }
                goto LABEL_471;
              }
              if (v944 == 1)
              {
                long long v945 = *v943;
                long long v946 = *((_OWORD *)__src + 35);
                *((_OWORD *)__dst + 34) = *((_OWORD *)__src + 34);
                *((_OWORD *)__dst + 35) = v946;
                _OWORD *v942 = v945;
                long long v947 = *((_OWORD *)__src + 36);
                long long v948 = *((_OWORD *)__src + 37);
                long long v949 = *((_OWORD *)__src + 39);
                *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
                *((_OWORD *)__dst + 39) = v949;
                *((_OWORD *)__dst + 36) = v947;
                *((_OWORD *)__dst + 37) = v948;
                long long v950 = *((_OWORD *)__src + 40);
                long long v951 = *((_OWORD *)__src + 41);
                long long v952 = *((_OWORD *)__src + 43);
                *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
                *((_OWORD *)__dst + 43) = v952;
                *((_OWORD *)__dst + 40) = v950;
                *((_OWORD *)__dst + 41) = v951;
                goto LABEL_104;
              }
              goto LABEL_463;
            case 2:
              goto LABEL_102;
          }
LABEL_97:
          uint64_t v336 = *((void *)__src + 44);
          uint64_t v337 = *((void *)__src + 45);
          uint64_t v338 = *((void *)__src + 46);
          uint64_t v339 = *((void *)__src + 47);
          uint64_t v340 = *((void *)__src + 48);
          uint64_t v341 = *((void *)__src + 49);
          uint64_t v342 = *((void *)__src + 50);
          uint64_t v343 = *((void *)__src + 51);
          uint64_t v1668 = *((unsigned __int8 *)v1793 + 92);
          uint64_t v1738 = v1793[22];
          sub_25771CCF8(v336, v337, v338, v339, v340, v341, v342, v343, v1738 | (v1668 << 32));
          *((void *)__dst + 44) = v336;
          *((void *)__dst + 45) = v337;
          *((void *)__dst + 46) = v338;
          *((void *)__dst + 47) = v339;
          *((void *)__dst + 48) = v340;
          *((void *)__dst + 49) = v341;
          *((void *)__dst + 50) = v342;
          *((void *)__dst + 51) = v343;
          *((unsigned char *)v1795 + 92) = v1668;
          v1795[22] = v1738;
          *((void *)__dst + 53) = *((void *)__src + 53);
          *((void *)__dst + 54) = *((void *)__src + 54);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (*((void *)__src + 64)) {
            goto LABEL_98;
          }
          goto LABEL_412;
        }
        uint64_t v37 = *(void *)__src;
        uint64_t v38 = *((void *)__src + 1);
        uint64_t v39 = *((void *)__src + 2);
        uint64_t v40 = *((void *)__src + 3);
        uint64_t v41 = *((void *)__src + 4);
        uint64_t v42 = *((void *)__src + 5);
        uint64_t v43 = *((void *)__src + 6);
        uint64_t v44 = *((void *)__src + 7);
        uint64_t v1653 = __src[68];
        uint64_t v1723 = *((unsigned int *)__src + 16);
        sub_25771CCF8(*(void *)__src, v38, v39, v40, v41, v42, v43, v44, v1723 | (v1653 << 32));
        *(void *)__dst = v37;
        *((void *)__dst + 1) = v38;
        *((void *)__dst + 2) = v39;
        *((void *)__dst + 3) = v40;
        *((void *)__dst + 4) = v41;
        *((void *)__dst + 5) = v42;
        *((void *)__dst + 6) = v43;
        *((void *)__dst + 7) = v44;
        __dst[68] = v1653;
        *((_DWORD *)__dst + 16) = v1723;
        *((void *)__dst + 9) = *((void *)__src + 9);
        *((void *)__dst + 10) = *((void *)__src + 10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((void *)__src + 20))
        {
LABEL_22:
          long long v45 = *(_OWORD *)(__src + 104);
          *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
          *(_OWORD *)(__dst + 104) = v45;
          long long v46 = *(_OWORD *)(__src + 120);
          long long v47 = *(_OWORD *)(__src + 136);
          long long v48 = *(_OWORD *)(__src + 152);
          *((void *)__dst + 21) = *((void *)__src + 21);
          *(_OWORD *)(__dst + 136) = v47;
          *(_OWORD *)(__dst + 152) = v48;
          *(_OWORD *)(__dst + 120) = v46;
LABEL_23:
          uint64_t v49 = (long long *)(__dst + 176);
          uint64_t v50 = (long long *)(__src + 176);
          uint64_t v51 = *((void *)__src + 31);
          if (v51)
          {
            if (v51 == 1)
            {
              long long v52 = *v50;
              long long v53 = *((_OWORD *)__src + 13);
              *((_OWORD *)__dst + 12) = *((_OWORD *)__src + 12);
              *((_OWORD *)__dst + 13) = v53;
              *uint64_t v49 = v52;
              long long v54 = *((_OWORD *)__src + 14);
              long long v55 = *((_OWORD *)__src + 15);
              long long v56 = *((_OWORD *)__src + 17);
              *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
              *((_OWORD *)__dst + 17) = v56;
              *((_OWORD *)__dst + 14) = v54;
              *((_OWORD *)__dst + 15) = v55;
              long long v57 = *((_OWORD *)__src + 18);
              long long v58 = *((_OWORD *)__src + 19);
              long long v59 = *((_OWORD *)__src + 21);
              *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
              *((_OWORD *)__dst + 21) = v59;
              *((_OWORD *)__dst + 18) = v57;
              *((_OWORD *)__dst + 19) = v58;
              goto LABEL_33;
            }
            uint64_t v80 = *((void *)__src + 22);
            uint64_t v81 = *((void *)__src + 23);
            uint64_t v82 = *((void *)__src + 24);
            uint64_t v83 = *((void *)__src + 25);
            uint64_t v84 = *((void *)__src + 26);
            uint64_t v85 = *((void *)__src + 27);
            uint64_t v86 = *((void *)__src + 28);
            uint64_t v87 = *((void *)__src + 29);
            uint64_t v1655 = __src[244];
            uint64_t v1725 = *((unsigned int *)__src + 60);
            sub_25771CCF8(v80, v81, v82, v83, v84, v85, v86, v87, v1725 | (v1655 << 32));
            *((void *)__dst + 22) = v80;
            *((void *)__dst + 23) = v81;
            *((void *)__dst + 24) = v82;
            *((void *)__dst + 25) = v83;
            *((void *)__dst + 26) = v84;
            *((void *)__dst + 27) = v85;
            *((void *)__dst + 28) = v86;
            *((void *)__dst + 29) = v87;
            __dst[244] = v1655;
            *((_DWORD *)__dst + 60) = v1725;
            *((void *)__dst + 31) = *((void *)__src + 31);
            *((void *)__dst + 32) = *((void *)__src + 32);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (!*((void *)__src + 42))
            {
LABEL_32:
              long long v88 = *(_OWORD *)(__src + 280);
              *(_OWORD *)(__dst + 264) = *(_OWORD *)(__src + 264);
              *(_OWORD *)(__dst + 280) = v88;
              long long v89 = *(_OWORD *)(__src + 296);
              long long v90 = *(_OWORD *)(__src + 312);
              long long v91 = *(_OWORD *)(__src + 328);
              *((void *)__dst + 43) = *((void *)__src + 43);
              *(_OWORD *)(__dst + 312) = v90;
              *(_OWORD *)(__dst + 328) = v91;
              *(_OWORD *)(__dst + 296) = v89;
              goto LABEL_33;
            }
          }
          else
          {
            long long v68 = *((_OWORD *)__src + 12);
            *uint64_t v49 = *v50;
            *((_OWORD *)__dst + 12) = v68;
            long long v69 = *((_OWORD *)__src + 13);
            long long v70 = *((_OWORD *)__src + 14);
            long long v71 = *((_OWORD *)__src + 15);
            *((void *)__dst + 32) = *((void *)__src + 32);
            *((_OWORD *)__dst + 14) = v70;
            *((_OWORD *)__dst + 15) = v71;
            *((_OWORD *)__dst + 13) = v69;
            if (!*((void *)__src + 42)) {
              goto LABEL_32;
            }
          }
          uint64_t v72 = *((void *)__src + 33);
          uint64_t v73 = *((void *)__src + 34);
          uint64_t v74 = *((void *)__src + 35);
          uint64_t v75 = *((void *)__src + 36);
          uint64_t v76 = *((void *)__src + 37);
          uint64_t v77 = *((void *)__src + 38);
          uint64_t v78 = *((void *)__src + 39);
          uint64_t v79 = *((void *)__src + 40);
          uint64_t v1654 = *((unsigned __int8 *)v1793 + 4);
          uint64_t v1724 = *v1793;
          sub_25771CCF8(v72, v73, v74, v75, v76, v77, v78, v79, v1724 | (v1654 << 32));
          *((void *)__dst + 33) = v72;
          *((void *)__dst + 34) = v73;
          *((void *)__dst + 35) = v74;
          *((void *)__dst + 36) = v75;
          *((void *)__dst + 37) = v76;
          *((void *)__dst + 38) = v77;
          *((void *)__dst + 39) = v78;
          *((void *)__dst + 40) = v79;
          *((unsigned char *)v1795 + 4) = v1654;
          unsigned int *v1795 = v1724;
          *((void *)__dst + 42) = *((void *)__src + 42);
          *((void *)__dst + 43) = *((void *)__src + 43);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          goto LABEL_33;
        }
      }
      else
      {
        long long v17 = *((_OWORD *)__src + 1);
        *(_OWORD *)__dst = *(_OWORD *)__src;
        *((_OWORD *)__dst + 1) = v17;
        long long v18 = *((_OWORD *)__src + 2);
        long long v19 = *((_OWORD *)__src + 3);
        long long v20 = *((_OWORD *)__src + 4);
        *((void *)__dst + 10) = *((void *)__src + 10);
        *((_OWORD *)__dst + 3) = v19;
        *((_OWORD *)__dst + 4) = v20;
        *((_OWORD *)__dst + 2) = v18;
        if (!*((void *)__src + 20)) {
          goto LABEL_22;
        }
      }
      uint64_t v21 = *((void *)__src + 11);
      uint64_t v22 = *((void *)__src + 12);
      uint64_t v23 = *((void *)__src + 13);
      uint64_t v24 = *((void *)__src + 14);
      uint64_t v25 = *((void *)__src + 15);
      uint64_t v26 = *((void *)__src + 16);
      uint64_t v27 = *((void *)__src + 17);
      uint64_t v28 = *((void *)__src + 18);
      uint64_t v1652 = __src[156];
      uint64_t v1722 = *((unsigned int *)__src + 38);
      sub_25771CCF8(v21, v22, v23, v24, v25, v26, v27, v28, v1722 | (v1652 << 32));
      *((void *)__dst + 11) = v21;
      *((void *)__dst + 12) = v22;
      *((void *)__dst + 13) = v23;
      *((void *)__dst + 14) = v24;
      *((void *)__dst + 15) = v25;
      *((void *)__dst + 16) = v26;
      *((void *)__dst + 17) = v27;
      *((void *)__dst + 18) = v28;
      __dst[156] = v1652;
      *((_DWORD *)__dst + 38) = v1722;
      *((void *)__dst + 20) = *((void *)__src + 20);
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
LABEL_9:
    uint64_t v6 = __dst;
    uint64_t v7 = __src;
    size_t v8 = 704;
LABEL_103:
    memcpy(v6, v7, v8);
    goto LABEL_104;
  }
  if (v5 == 3)
  {
    sub_2577FDDB4((uint64_t)__dst);
    goto LABEL_9;
  }
  if (v4 == 2)
  {
    if (v5 != 2)
    {
      if (v5)
      {
        if (v5 == 1)
        {
          long long v9 = *(_OWORD *)__src;
          long long v10 = *((_OWORD *)__src + 2);
          *((_OWORD *)__dst + 1) = *((_OWORD *)__src + 1);
          *((_OWORD *)__dst + 2) = v10;
          *(_OWORD *)__dst = v9;
          long long v11 = *((_OWORD *)__src + 3);
          long long v12 = *((_OWORD *)__src + 4);
          long long v13 = *((_OWORD *)__src + 6);
          *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
          *((_OWORD *)__dst + 6) = v13;
          *((_OWORD *)__dst + 3) = v11;
          *((_OWORD *)__dst + 4) = v12;
          long long v14 = *((_OWORD *)__src + 7);
          long long v15 = *((_OWORD *)__src + 8);
          long long v16 = *((_OWORD *)__src + 10);
          *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
          *((_OWORD *)__dst + 10) = v16;
          *((_OWORD *)__dst + 7) = v14;
          *((_OWORD *)__dst + 8) = v15;
          goto LABEL_52;
        }
        uint64_t v117 = *(void *)__src;
        uint64_t v118 = *((void *)__src + 1);
        uint64_t v119 = *((void *)__src + 2);
        uint64_t v120 = *((void *)__src + 3);
        uint64_t v121 = *((void *)__src + 4);
        uint64_t v122 = *((void *)__src + 5);
        uint64_t v123 = *((void *)__src + 6);
        uint64_t v124 = *((void *)__src + 7);
        uint64_t v1656 = __src[68];
        uint64_t v1726 = *((unsigned int *)__src + 16);
        sub_25771CCF8(*(void *)__src, v118, v119, v120, v121, v122, v123, v124, v1726 | (v1656 << 32));
        *(void *)__dst = v117;
        *((void *)__dst + 1) = v118;
        *((void *)__dst + 2) = v119;
        *((void *)__dst + 3) = v120;
        *((void *)__dst + 4) = v121;
        *((void *)__dst + 5) = v122;
        *((void *)__dst + 6) = v123;
        *((void *)__dst + 7) = v124;
        __dst[68] = v1656;
        *((_DWORD *)__dst + 16) = v1726;
        *((void *)__dst + 9) = *((void *)__src + 9);
        *((void *)__dst + 10) = *((void *)__src + 10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v113 = *((_OWORD *)__src + 1);
        *(_OWORD *)__dst = *(_OWORD *)__src;
        *((_OWORD *)__dst + 1) = v113;
        long long v114 = *((_OWORD *)__src + 2);
        long long v115 = *((_OWORD *)__src + 3);
        long long v116 = *((_OWORD *)__src + 4);
        *((void *)__dst + 10) = *((void *)__src + 10);
        *((_OWORD *)__dst + 3) = v115;
        *((_OWORD *)__dst + 4) = v116;
        *((_OWORD *)__dst + 2) = v114;
      }
      if (*((void *)__src + 20))
      {
        uint64_t v125 = *((void *)__src + 11);
        uint64_t v126 = *((void *)__src + 12);
        uint64_t v127 = *((void *)__src + 13);
        uint64_t v128 = *((void *)__src + 14);
        uint64_t v129 = *((void *)__src + 15);
        uint64_t v130 = *((void *)__src + 16);
        uint64_t v131 = *((void *)__src + 17);
        uint64_t v132 = *((void *)__src + 18);
        uint64_t v1657 = __src[156];
        uint64_t v1727 = *((unsigned int *)__src + 38);
        sub_25771CCF8(v125, v126, v127, v128, v129, v130, v131, v132, v1727 | (v1657 << 32));
        *((void *)__dst + 11) = v125;
        *((void *)__dst + 12) = v126;
        *((void *)__dst + 13) = v127;
        *((void *)__dst + 14) = v128;
        *((void *)__dst + 15) = v129;
        *((void *)__dst + 16) = v130;
        *((void *)__dst + 17) = v131;
        *((void *)__dst + 18) = v132;
        __dst[156] = v1657;
        *((_DWORD *)__dst + 38) = v1727;
        *((void *)__dst + 20) = *((void *)__src + 20);
        *((void *)__dst + 21) = *((void *)__src + 21);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v158 = *(_OWORD *)(__src + 104);
        *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
        *(_OWORD *)(__dst + 104) = v158;
        long long v159 = *(_OWORD *)(__src + 120);
        long long v160 = *(_OWORD *)(__src + 136);
        long long v161 = *(_OWORD *)(__src + 152);
        *((void *)__dst + 21) = *((void *)__src + 21);
        *(_OWORD *)(__dst + 136) = v160;
        *(_OWORD *)(__dst + 152) = v161;
        *(_OWORD *)(__dst + 120) = v159;
      }
LABEL_52:
      v162 = (long long *)(__dst + 176);
      uint64_t v163 = (long long *)(__src + 176);
      uint64_t v164 = *((void *)__src + 31);
      if (v164)
      {
        if (v164 == 1)
        {
          long long v165 = *v163;
          long long v166 = *((_OWORD *)__src + 13);
          *((_OWORD *)__dst + 12) = *((_OWORD *)__src + 12);
          *((_OWORD *)__dst + 13) = v166;
          long long *v162 = v165;
          long long v167 = *((_OWORD *)__src + 14);
          long long v168 = *((_OWORD *)__src + 15);
          long long v169 = *((_OWORD *)__src + 17);
          *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
          *((_OWORD *)__dst + 17) = v169;
          *((_OWORD *)__dst + 14) = v167;
          *((_OWORD *)__dst + 15) = v168;
          long long v170 = *((_OWORD *)__src + 18);
          long long v171 = *((_OWORD *)__src + 19);
          long long v172 = *((_OWORD *)__src + 21);
          *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
          *((_OWORD *)__dst + 21) = v172;
          *((_OWORD *)__dst + 18) = v170;
          *((_OWORD *)__dst + 19) = v171;
          goto LABEL_93;
        }
        goto LABEL_77;
      }
      long long v173 = *((_OWORD *)__src + 12);
      long long *v162 = *v163;
      *((_OWORD *)__dst + 12) = v173;
      long long v174 = *((_OWORD *)__src + 13);
      long long v175 = *((_OWORD *)__src + 14);
      long long v176 = *((_OWORD *)__src + 15);
      *((void *)__dst + 32) = *((void *)__src + 32);
      *((_OWORD *)__dst + 14) = v175;
      *((_OWORD *)__dst + 15) = v176;
      *((_OWORD *)__dst + 13) = v174;
      if (!*((void *)__src + 42)) {
        goto LABEL_83;
      }
      goto LABEL_92;
    }
LABEL_17:
    memcpy(__dst, __src, 0x160uLL);
    goto LABEL_93;
  }
  if (v5 == 2)
  {
    sub_2577FDD60((uint64_t)__dst);
    goto LABEL_17;
  }
  if (v4 == 1)
  {
    if (v5 == 1)
    {
      long long v60 = *(_OWORD *)__src;
      long long v61 = *((_OWORD *)__src + 2);
      *((_OWORD *)__dst + 1) = *((_OWORD *)__src + 1);
      *((_OWORD *)__dst + 2) = v61;
      *(_OWORD *)__dst = v60;
      long long v62 = *((_OWORD *)__src + 3);
      long long v63 = *((_OWORD *)__src + 4);
      long long v64 = *((_OWORD *)__src + 6);
      *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
      *((_OWORD *)__dst + 6) = v64;
      *((_OWORD *)__dst + 3) = v62;
      *((_OWORD *)__dst + 4) = v63;
      long long v65 = *((_OWORD *)__src + 7);
      long long v66 = *((_OWORD *)__src + 8);
      long long v67 = *((_OWORD *)__src + 10);
      *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
      *((_OWORD *)__dst + 10) = v67;
      *((_OWORD *)__dst + 7) = v65;
      *((_OWORD *)__dst + 8) = v66;
      goto LABEL_71;
    }
    if (v5)
    {
      uint64_t v133 = *(void *)__src;
      uint64_t v134 = *((void *)__src + 1);
      uint64_t v135 = *((void *)__src + 2);
      uint64_t v136 = *((void *)__src + 3);
      uint64_t v137 = *((void *)__src + 4);
      uint64_t v138 = *((void *)__src + 5);
      uint64_t v139 = *((void *)__src + 6);
      uint64_t v140 = *((void *)__src + 7);
      uint64_t v1658 = __src[68];
      uint64_t v1728 = *((unsigned int *)__src + 16);
      sub_25771CCF8(*(void *)__src, v134, v135, v136, v137, v138, v139, v140, v1728 | (v1658 << 32));
      *(void *)__dst = v133;
      *((void *)__dst + 1) = v134;
      *((void *)__dst + 2) = v135;
      *((void *)__dst + 3) = v136;
      *((void *)__dst + 4) = v137;
      *((void *)__dst + 5) = v138;
      *((void *)__dst + 6) = v139;
      *((void *)__dst + 7) = v140;
      __dst[68] = v1658;
      *((_DWORD *)__dst + 16) = v1728;
      *((void *)__dst + 9) = *((void *)__src + 9);
      *((void *)__dst + 10) = *((void *)__src + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v177 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v177;
      long long v178 = *((_OWORD *)__src + 2);
      long long v179 = *((_OWORD *)__src + 3);
      long long v180 = *((_OWORD *)__src + 4);
      *((void *)__dst + 10) = *((void *)__src + 10);
      *((_OWORD *)__dst + 3) = v179;
      *((_OWORD *)__dst + 4) = v180;
      *((_OWORD *)__dst + 2) = v178;
    }
    if (!*((void *)__src + 20))
    {
      long long v181 = *(_OWORD *)(__src + 104);
      *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
      *(_OWORD *)(__dst + 104) = v181;
      long long v182 = *(_OWORD *)(__src + 120);
      long long v183 = *(_OWORD *)(__src + 136);
      long long v184 = *(_OWORD *)(__src + 152);
      *((void *)__dst + 21) = *((void *)__src + 21);
      *(_OWORD *)(__dst + 136) = v183;
      *(_OWORD *)(__dst + 152) = v184;
      *(_OWORD *)(__dst + 120) = v182;
      goto LABEL_71;
    }
    goto LABEL_68;
  }
  if (v5 == 1)
  {
    sub_257735730((uint64_t)__dst);
    long long v106 = *((_OWORD *)__src + 1);
    long long v105 = *((_OWORD *)__src + 2);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v106;
    *((_OWORD *)__dst + 2) = v105;
    long long v107 = *((_OWORD *)__src + 6);
    long long v109 = *((_OWORD *)__src + 3);
    long long v108 = *((_OWORD *)__src + 4);
    *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
    *((_OWORD *)__dst + 6) = v107;
    *((_OWORD *)__dst + 3) = v109;
    *((_OWORD *)__dst + 4) = v108;
    long long v110 = *((_OWORD *)__src + 10);
    long long v112 = *((_OWORD *)__src + 7);
    long long v111 = *((_OWORD *)__src + 8);
    *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
    *((_OWORD *)__dst + 10) = v110;
    *((_OWORD *)__dst + 7) = v112;
    *((_OWORD *)__dst + 8) = v111;
    goto LABEL_71;
  }
  if (v4)
  {
    if (v5)
    {
      uint64_t v141 = *((void *)__src + 1);
      uint64_t v142 = *((void *)__src + 2);
      uint64_t v143 = *((void *)__src + 3);
      uint64_t v144 = *((void *)__src + 4);
      uint64_t v145 = *((void *)__src + 5);
      uint64_t v146 = *((void *)__src + 6);
      uint64_t v147 = *((void *)__src + 7);
      uint64_t v1659 = *(void *)__src;
      uint64_t v1729 = __src[68];
      uint64_t v148 = *((unsigned int *)__src + 16);
      sub_25771CCF8(*(void *)__src, v141, v142, v143, v144, v145, v146, v147, v148 | (v1729 << 32));
      uint64_t v149 = *(void *)__dst;
      uint64_t v150 = *((void *)__dst + 1);
      uint64_t v151 = *((void *)__dst + 2);
      uint64_t v152 = *((void *)__dst + 3);
      uint64_t v153 = *((void *)__dst + 4);
      uint64_t v154 = *((void *)__dst + 5);
      uint64_t v155 = *((void *)__dst + 6);
      uint64_t v156 = *((void *)__dst + 7);
      unint64_t v157 = *((unsigned int *)__dst + 16) | ((unint64_t)__dst[68] << 32);
      *(void *)__dst = v1659;
      *((void *)__dst + 1) = v141;
      *((void *)__dst + 2) = v142;
      *((void *)__dst + 3) = v143;
      *((void *)__dst + 4) = v144;
      *((void *)__dst + 5) = v145;
      *((void *)__dst + 6) = v146;
      *((void *)__dst + 7) = v147;
      *((_DWORD *)__dst + 16) = v148;
      __dst[68] = v1729;
      sub_25771D110(v149, v150, v151, v152, v153, v154, v155, v156, v157);
      *((void *)__dst + 9) = *((void *)__src + 9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 10) = *((void *)__src + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)__dst, &qword_26A030F50);
      long long v193 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v193;
      long long v195 = *((_OWORD *)__src + 3);
      long long v194 = *((_OWORD *)__src + 4);
      long long v196 = *((_OWORD *)__src + 2);
      *((void *)__dst + 10) = *((void *)__src + 10);
      *((_OWORD *)__dst + 3) = v195;
      *((_OWORD *)__dst + 4) = v194;
      *((_OWORD *)__dst + 2) = v196;
    }
  }
  else if (v5)
  {
    uint64_t v185 = *(void *)__src;
    uint64_t v186 = *((void *)__src + 1);
    uint64_t v187 = *((void *)__src + 2);
    uint64_t v188 = *((void *)__src + 3);
    uint64_t v189 = *((void *)__src + 4);
    uint64_t v190 = *((void *)__src + 5);
    uint64_t v191 = *((void *)__src + 6);
    uint64_t v192 = *((void *)__src + 7);
    uint64_t v1660 = __src[68];
    uint64_t v1730 = *((unsigned int *)__src + 16);
    sub_25771CCF8(*(void *)__src, v186, v187, v188, v189, v190, v191, v192, v1730 | (v1660 << 32));
    *(void *)__dst = v185;
    *((void *)__dst + 1) = v186;
    *((void *)__dst + 2) = v187;
    *((void *)__dst + 3) = v188;
    *((void *)__dst + 4) = v189;
    *((void *)__dst + 5) = v190;
    *((void *)__dst + 6) = v191;
    *((void *)__dst + 7) = v192;
    __dst[68] = v1660;
    *((_DWORD *)__dst + 16) = v1730;
    *((void *)__dst + 9) = *((void *)__src + 9);
    *((void *)__dst + 10) = *((void *)__src + 10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v197 = *((_OWORD *)__src + 1);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v197;
    long long v198 = *((_OWORD *)__src + 2);
    long long v199 = *((_OWORD *)__src + 3);
    long long v200 = *((_OWORD *)__src + 4);
    *((void *)__dst + 10) = *((void *)__src + 10);
    *((_OWORD *)__dst + 3) = v199;
    *((_OWORD *)__dst + 4) = v200;
    *((_OWORD *)__dst + 2) = v198;
  }
  long long v201 = __dst + 88;
  long long v202 = __src + 88;
  uint64_t v203 = *((void *)__src + 20);
  if (*((void *)__dst + 20))
  {
    if (v203)
    {
      uint64_t v1650 = *((void *)__src + 12);
      uint64_t v1661 = *((void *)__src + 11);
      uint64_t v204 = *((void *)__src + 13);
      uint64_t v205 = *((void *)__src + 14);
      uint64_t v206 = *((void *)__src + 15);
      uint64_t v207 = *((void *)__src + 16);
      uint64_t v208 = *((void *)__src + 17);
      uint64_t v209 = *((void *)__src + 18);
      uint64_t v1731 = __src[156];
      uint64_t v210 = *((unsigned int *)__src + 38);
      sub_25771CCF8(v1661, v1650, v204, v205, v206, v207, v208, v209, v210 | (v1731 << 32));
      uint64_t v211 = *((void *)__dst + 11);
      uint64_t v212 = *((void *)__dst + 12);
      uint64_t v213 = *((void *)__dst + 13);
      uint64_t v214 = *((void *)__dst + 14);
      uint64_t v215 = *((void *)__dst + 15);
      uint64_t v216 = *((void *)__dst + 16);
      uint64_t v217 = *((void *)__dst + 17);
      uint64_t v218 = *((void *)__dst + 18);
      unint64_t v219 = *((unsigned int *)__dst + 38) | ((unint64_t)__dst[156] << 32);
      *((void *)__dst + 11) = v1661;
      *((void *)__dst + 12) = v1650;
      *((void *)__dst + 13) = v204;
      *((void *)__dst + 14) = v205;
      *((void *)__dst + 15) = v206;
      *((void *)__dst + 16) = v207;
      *((void *)__dst + 17) = v208;
      *((void *)__dst + 18) = v209;
      *((_DWORD *)__dst + 38) = v210;
      __dst[156] = v1731;
      sub_25771D110(v211, v212, v213, v214, v215, v216, v217, v218, v219);
      *((void *)__dst + 20) = *((void *)__src + 20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 88), &qword_26A030F50);
      long long v228 = *(_OWORD *)(__src + 104);
      *long long v201 = *v202;
      *(_OWORD *)(__dst + 104) = v228;
      long long v230 = *(_OWORD *)(__src + 136);
      long long v229 = *(_OWORD *)(__src + 152);
      long long v231 = *(_OWORD *)(__src + 120);
      *((void *)__dst + 21) = *((void *)__src + 21);
      *(_OWORD *)(__dst + 136) = v230;
      *(_OWORD *)(__dst + 152) = v229;
      *(_OWORD *)(__dst + 120) = v231;
    }
  }
  else
  {
    if (v203)
    {
LABEL_68:
      uint64_t v220 = *((void *)__src + 11);
      uint64_t v221 = *((void *)__src + 12);
      uint64_t v222 = *((void *)__src + 13);
      uint64_t v223 = *((void *)__src + 14);
      uint64_t v224 = *((void *)__src + 15);
      uint64_t v225 = *((void *)__src + 16);
      uint64_t v226 = *((void *)__src + 17);
      uint64_t v227 = *((void *)__src + 18);
      uint64_t v1662 = __src[156];
      uint64_t v1732 = *((unsigned int *)__src + 38);
      sub_25771CCF8(v220, v221, v222, v223, v224, v225, v226, v227, v1732 | (v1662 << 32));
      *((void *)__dst + 11) = v220;
      *((void *)__dst + 12) = v221;
      *((void *)__dst + 13) = v222;
      *((void *)__dst + 14) = v223;
      *((void *)__dst + 15) = v224;
      *((void *)__dst + 16) = v225;
      *((void *)__dst + 17) = v226;
      *((void *)__dst + 18) = v227;
      __dst[156] = v1662;
      *((_DWORD *)__dst + 38) = v1732;
      *((void *)__dst + 20) = *((void *)__src + 20);
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_71;
    }
    long long v232 = *(_OWORD *)(__src + 104);
    *long long v201 = *v202;
    *(_OWORD *)(__dst + 104) = v232;
    long long v233 = *(_OWORD *)(__src + 120);
    long long v234 = *(_OWORD *)(__src + 136);
    long long v235 = *(_OWORD *)(__src + 152);
    *((void *)__dst + 21) = *((void *)__src + 21);
    *(_OWORD *)(__dst + 136) = v234;
    *(_OWORD *)(__dst + 152) = v235;
    *(_OWORD *)(__dst + 120) = v233;
  }
LABEL_71:
  uint64_t v236 = (long long *)(__dst + 176);
  uint64_t v237 = (long long *)(__src + 176);
  uint64_t v238 = *((void *)__dst + 31);
  uint64_t v239 = *((void *)__src + 31);
  if (v238 == 1)
  {
    if (v239)
    {
      if (v239 == 1)
      {
        long long v240 = *v237;
        long long v241 = *((_OWORD *)__src + 13);
        *((_OWORD *)__dst + 12) = *((_OWORD *)__src + 12);
        *((_OWORD *)__dst + 13) = v241;
        *uint64_t v236 = v240;
        long long v242 = *((_OWORD *)__src + 14);
        long long v243 = *((_OWORD *)__src + 15);
        long long v244 = *((_OWORD *)__src + 17);
        *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
        *((_OWORD *)__dst + 17) = v244;
        *((_OWORD *)__dst + 14) = v242;
        *((_OWORD *)__dst + 15) = v243;
        long long v245 = *((_OWORD *)__src + 18);
        long long v246 = *((_OWORD *)__src + 19);
        long long v247 = *((_OWORD *)__src + 21);
        *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
        *((_OWORD *)__dst + 21) = v247;
        *((_OWORD *)__dst + 18) = v245;
        *((_OWORD *)__dst + 19) = v246;
        goto LABEL_93;
      }
LABEL_77:
      uint64_t v256 = *((void *)__src + 22);
      uint64_t v257 = *((void *)__src + 23);
      uint64_t v258 = *((void *)__src + 24);
      uint64_t v259 = *((void *)__src + 25);
      uint64_t v260 = *((void *)__src + 26);
      uint64_t v261 = *((void *)__src + 27);
      uint64_t v262 = *((void *)__src + 28);
      uint64_t v263 = *((void *)__src + 29);
      uint64_t v1663 = __src[244];
      uint64_t v1733 = *((unsigned int *)__src + 60);
      sub_25771CCF8(v256, v257, v258, v259, v260, v261, v262, v263, v1733 | (v1663 << 32));
      *((void *)__dst + 22) = v256;
      *((void *)__dst + 23) = v257;
      *((void *)__dst + 24) = v258;
      *((void *)__dst + 25) = v259;
      *((void *)__dst + 26) = v260;
      *((void *)__dst + 27) = v261;
      *((void *)__dst + 28) = v262;
      *((void *)__dst + 29) = v263;
      __dst[244] = v1663;
      *((_DWORD *)__dst + 60) = v1733;
      *((void *)__dst + 31) = *((void *)__src + 31);
      *((void *)__dst + 32) = *((void *)__src + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!*((void *)__src + 42)) {
        goto LABEL_83;
      }
      goto LABEL_92;
    }
    long long v280 = *((_OWORD *)__src + 12);
    *uint64_t v236 = *v237;
    *((_OWORD *)__dst + 12) = v280;
    long long v281 = *((_OWORD *)__src + 13);
    long long v282 = *((_OWORD *)__src + 14);
    long long v283 = *((_OWORD *)__src + 15);
    *((void *)__dst + 32) = *((void *)__src + 32);
    *((_OWORD *)__dst + 14) = v282;
    *((_OWORD *)__dst + 15) = v283;
    *((_OWORD *)__dst + 13) = v281;
    if (!*((void *)__src + 42))
    {
LABEL_83:
      long long v284 = *(_OWORD *)(__src + 280);
      *(_OWORD *)(__dst + 264) = *(_OWORD *)(__src + 264);
      *(_OWORD *)(__dst + 280) = v284;
      long long v285 = *(_OWORD *)(__src + 296);
      long long v286 = *(_OWORD *)(__src + 312);
      long long v287 = *(_OWORD *)(__src + 328);
      *((void *)__dst + 43) = *((void *)__src + 43);
      *(_OWORD *)(__dst + 312) = v286;
      *(_OWORD *)(__dst + 328) = v287;
      *(_OWORD *)(__dst + 296) = v285;
      goto LABEL_93;
    }
LABEL_92:
    uint64_t v324 = *((void *)__src + 33);
    uint64_t v325 = *((void *)__src + 34);
    uint64_t v326 = *((void *)__src + 35);
    uint64_t v327 = *((void *)__src + 36);
    uint64_t v328 = *((void *)__src + 37);
    uint64_t v329 = *((void *)__src + 38);
    uint64_t v330 = *((void *)__src + 39);
    uint64_t v331 = *((void *)__src + 40);
    uint64_t v1667 = *((unsigned __int8 *)v1793 + 4);
    uint64_t v1737 = *v1793;
    sub_25771CCF8(v324, v325, v326, v327, v328, v329, v330, v331, v1737 | (v1667 << 32));
    *((void *)__dst + 33) = v324;
    *((void *)__dst + 34) = v325;
    *((void *)__dst + 35) = v326;
    *((void *)__dst + 36) = v327;
    *((void *)__dst + 37) = v328;
    *((void *)__dst + 38) = v329;
    *((void *)__dst + 39) = v330;
    *((void *)__dst + 40) = v331;
    *((unsigned char *)v1795 + 4) = v1667;
    unsigned int *v1795 = v1737;
    *((void *)__dst + 42) = *((void *)__src + 42);
    *((void *)__dst + 43) = *((void *)__src + 43);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_93;
  }
  if (v239 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 176));
    long long v249 = *((_OWORD *)__src + 12);
    long long v248 = *((_OWORD *)__src + 13);
    *uint64_t v236 = *v237;
    *((_OWORD *)__dst + 12) = v249;
    *((_OWORD *)__dst + 13) = v248;
    long long v250 = *((_OWORD *)__src + 17);
    long long v252 = *((_OWORD *)__src + 14);
    long long v251 = *((_OWORD *)__src + 15);
    *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
    *((_OWORD *)__dst + 17) = v250;
    *((_OWORD *)__dst + 14) = v252;
    *((_OWORD *)__dst + 15) = v251;
    long long v253 = *((_OWORD *)__src + 21);
    long long v255 = *((_OWORD *)__src + 18);
    long long v254 = *((_OWORD *)__src + 19);
    *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
    *((_OWORD *)__dst + 21) = v253;
    *((_OWORD *)__dst + 18) = v255;
    *((_OWORD *)__dst + 19) = v254;
    goto LABEL_93;
  }
  if (v238)
  {
    if (v239)
    {
      uint64_t v1651 = *((void *)__src + 23);
      uint64_t v1664 = *((void *)__src + 22);
      uint64_t v264 = *((void *)__src + 24);
      uint64_t v265 = *((void *)__src + 25);
      uint64_t v266 = *((void *)__src + 26);
      uint64_t v267 = *((void *)__src + 27);
      uint64_t v268 = *((void *)__src + 28);
      uint64_t v269 = *((void *)__src + 29);
      uint64_t v1734 = __src[244];
      uint64_t v270 = *((unsigned int *)__src + 60);
      sub_25771CCF8(v1664, v1651, v264, v265, v266, v267, v268, v269, v270 | (v1734 << 32));
      uint64_t v271 = *((void *)__dst + 22);
      uint64_t v272 = *((void *)__dst + 23);
      uint64_t v273 = *((void *)__dst + 24);
      uint64_t v274 = *((void *)__dst + 25);
      uint64_t v275 = *((void *)__dst + 26);
      uint64_t v276 = *((void *)__dst + 27);
      uint64_t v277 = *((void *)__dst + 28);
      uint64_t v278 = *((void *)__dst + 29);
      unint64_t v279 = *((unsigned int *)__dst + 60) | ((unint64_t)__dst[244] << 32);
      *((void *)__dst + 22) = v1664;
      *((void *)__dst + 23) = v1651;
      *((void *)__dst + 24) = v264;
      *((void *)__dst + 25) = v265;
      *((void *)__dst + 26) = v266;
      *((void *)__dst + 27) = v267;
      *((void *)__dst + 28) = v268;
      *((void *)__dst + 29) = v269;
      *((_DWORD *)__dst + 60) = v270;
      __dst[244] = v1734;
      sub_25771D110(v271, v272, v273, v274, v275, v276, v277, v278, v279);
      *((void *)__dst + 31) = *((void *)__src + 31);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 32) = *((void *)__src + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 176), &qword_26A030F50);
      long long v296 = *((_OWORD *)__src + 12);
      *uint64_t v236 = *v237;
      *((_OWORD *)__dst + 12) = v296;
      long long v298 = *((_OWORD *)__src + 14);
      long long v297 = *((_OWORD *)__src + 15);
      long long v299 = *((_OWORD *)__src + 13);
      *((void *)__dst + 32) = *((void *)__src + 32);
      *((_OWORD *)__dst + 14) = v298;
      *((_OWORD *)__dst + 15) = v297;
      *((_OWORD *)__dst + 13) = v299;
    }
  }
  else if (v239)
  {
    uint64_t v288 = *((void *)__src + 22);
    uint64_t v289 = *((void *)__src + 23);
    uint64_t v290 = *((void *)__src + 24);
    uint64_t v291 = *((void *)__src + 25);
    uint64_t v292 = *((void *)__src + 26);
    uint64_t v293 = *((void *)__src + 27);
    uint64_t v294 = *((void *)__src + 28);
    uint64_t v295 = *((void *)__src + 29);
    uint64_t v1665 = __src[244];
    uint64_t v1735 = *((unsigned int *)__src + 60);
    sub_25771CCF8(v288, v289, v290, v291, v292, v293, v294, v295, v1735 | (v1665 << 32));
    *((void *)__dst + 22) = v288;
    *((void *)__dst + 23) = v289;
    *((void *)__dst + 24) = v290;
    *((void *)__dst + 25) = v291;
    *((void *)__dst + 26) = v292;
    *((void *)__dst + 27) = v293;
    *((void *)__dst + 28) = v294;
    *((void *)__dst + 29) = v295;
    __dst[244] = v1665;
    *((_DWORD *)__dst + 60) = v1735;
    *((void *)__dst + 31) = *((void *)__src + 31);
    *((void *)__dst + 32) = *((void *)__src + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v300 = *((_OWORD *)__src + 12);
    *uint64_t v236 = *v237;
    *((_OWORD *)__dst + 12) = v300;
    long long v301 = *((_OWORD *)__src + 13);
    long long v302 = *((_OWORD *)__src + 14);
    long long v303 = *((_OWORD *)__src + 15);
    *((void *)__dst + 32) = *((void *)__src + 32);
    *((_OWORD *)__dst + 14) = v302;
    *((_OWORD *)__dst + 15) = v303;
    *((_OWORD *)__dst + 13) = v301;
  }
  uint64_t v304 = __dst + 264;
  uint64_t v305 = __src + 264;
  uint64_t v306 = *((void *)__src + 42);
  if (*((void *)__dst + 42))
  {
    if (v306)
    {
      uint64_t v307 = *((void *)__src + 34);
      uint64_t v308 = *((void *)__src + 35);
      uint64_t v309 = *((void *)__src + 36);
      uint64_t v310 = *((void *)__src + 37);
      uint64_t v311 = *((void *)__src + 38);
      uint64_t v312 = *((void *)__src + 39);
      uint64_t v313 = *((void *)__src + 40);
      uint64_t v1666 = *((void *)__src + 33);
      uint64_t v1736 = *((unsigned __int8 *)v1793 + 4);
      uint64_t v314 = *v1793;
      sub_25771CCF8(v1666, v307, v308, v309, v310, v311, v312, v313, v314 | (v1736 << 32));
      uint64_t v315 = *((void *)__dst + 33);
      uint64_t v316 = *((void *)__dst + 34);
      uint64_t v317 = *((void *)__dst + 35);
      uint64_t v318 = *((void *)__dst + 36);
      uint64_t v319 = *((void *)__dst + 37);
      uint64_t v320 = *((void *)__dst + 38);
      uint64_t v321 = *((void *)__dst + 39);
      uint64_t v322 = *((void *)__dst + 40);
      unint64_t v323 = *v1795 | ((unint64_t)*((unsigned __int8 *)v1795 + 4) << 32);
      *((void *)__dst + 33) = v1666;
      *((void *)__dst + 34) = v307;
      *((void *)__dst + 35) = v308;
      *((void *)__dst + 36) = v309;
      *((void *)__dst + 37) = v310;
      *((void *)__dst + 38) = v311;
      *((void *)__dst + 39) = v312;
      *((void *)__dst + 40) = v313;
      unsigned int *v1795 = v314;
      *((unsigned char *)v1795 + 4) = v1736;
      sub_25771D110(v315, v316, v317, v318, v319, v320, v321, v322, v323);
      *((void *)__dst + 42) = *((void *)__src + 42);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 43) = *((void *)__src + 43);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 264), &qword_26A030F50);
      long long v1086 = *(_OWORD *)(__src + 280);
      *uint64_t v304 = *v305;
      *(_OWORD *)(__dst + 280) = v1086;
      long long v1088 = *(_OWORD *)(__src + 312);
      long long v1087 = *(_OWORD *)(__src + 328);
      long long v1089 = *(_OWORD *)(__src + 296);
      *((void *)__dst + 43) = *((void *)__src + 43);
      *(_OWORD *)(__dst + 312) = v1088;
      *(_OWORD *)(__dst + 328) = v1087;
      *(_OWORD *)(__dst + 296) = v1089;
    }
  }
  else
  {
    if (v306) {
      goto LABEL_92;
    }
    long long v1098 = *(_OWORD *)(__src + 280);
    *uint64_t v304 = *v305;
    *(_OWORD *)(__dst + 280) = v1098;
    long long v1099 = *(_OWORD *)(__src + 296);
    long long v1100 = *(_OWORD *)(__src + 312);
    long long v1101 = *(_OWORD *)(__src + 328);
    *((void *)__dst + 43) = *((void *)__src + 43);
    *(_OWORD *)(__dst + 312) = v1100;
    *(_OWORD *)(__dst + 328) = v1101;
    *(_OWORD *)(__dst + 296) = v1099;
  }
LABEL_93:
  uint64_t v332 = __dst + 352;
  uint64_t v333 = __src + 352;
  uint64_t v334 = *((void *)__dst + 53);
  uint64_t v335 = *((void *)__src + 53);
  if (v334 == 2)
  {
    if (!v335)
    {
      long long v926 = *((_OWORD *)__src + 23);
      *uint64_t v332 = *v333;
      *((_OWORD *)__dst + 23) = v926;
      long long v927 = *((_OWORD *)__src + 24);
      long long v928 = *((_OWORD *)__src + 25);
      long long v929 = *((_OWORD *)__src + 26);
      *((void *)__dst + 54) = *((void *)__src + 54);
      *((_OWORD *)__dst + 25) = v928;
      *((_OWORD *)__dst + 26) = v929;
      *((_OWORD *)__dst + 24) = v927;
      if (*((void *)__src + 64)) {
        goto LABEL_98;
      }
      goto LABEL_412;
    }
    if (v335 == 1)
    {
      long long v934 = *v333;
      long long v935 = *((_OWORD *)__src + 24);
      *((_OWORD *)__dst + 23) = *((_OWORD *)__src + 23);
      *((_OWORD *)__dst + 24) = v935;
      *uint64_t v332 = v934;
      long long v936 = *((_OWORD *)__src + 25);
      long long v937 = *((_OWORD *)__src + 26);
      long long v938 = *((_OWORD *)__src + 28);
      *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
      *((_OWORD *)__dst + 28) = v938;
      *((_OWORD *)__dst + 25) = v936;
      *((_OWORD *)__dst + 26) = v937;
      long long v939 = *((_OWORD *)__src + 29);
      long long v940 = *((_OWORD *)__src + 30);
      long long v941 = *((_OWORD *)__src + 32);
      *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
      *((_OWORD *)__dst + 32) = v941;
      *((_OWORD *)__dst + 29) = v939;
      *((_OWORD *)__dst + 30) = v940;
      goto LABEL_414;
    }
    if (v335 != 2) {
      goto LABEL_97;
    }
LABEL_101:
    uint64_t v6 = __dst + 352;
    uint64_t v7 = __src + 352;
LABEL_102:
    size_t v8 = 352;
    goto LABEL_103;
  }
  if (v335 == 2)
  {
    sub_2577FDD60((uint64_t)(__dst + 352));
    goto LABEL_101;
  }
  if (v334 == 1)
  {
    if (v335)
    {
      if (v335 == 1)
      {
        long long v419 = *v333;
        long long v420 = *((_OWORD *)__src + 24);
        *((_OWORD *)__dst + 23) = *((_OWORD *)__src + 23);
        *((_OWORD *)__dst + 24) = v420;
        *uint64_t v332 = v419;
        long long v421 = *((_OWORD *)__src + 25);
        long long v422 = *((_OWORD *)__src + 26);
        long long v423 = *((_OWORD *)__src + 28);
        *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
        *((_OWORD *)__dst + 28) = v423;
        *((_OWORD *)__dst + 25) = v421;
        *((_OWORD *)__dst + 26) = v422;
        long long v424 = *((_OWORD *)__src + 29);
        long long v425 = *((_OWORD *)__src + 30);
        long long v426 = *((_OWORD *)__src + 32);
        *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
        *((_OWORD *)__dst + 32) = v426;
        *((_OWORD *)__dst + 29) = v424;
        *((_OWORD *)__dst + 30) = v425;
        goto LABEL_459;
      }
      uint64_t v1042 = *((void *)__src + 44);
      uint64_t v1043 = *((void *)__src + 45);
      uint64_t v1044 = *((void *)__src + 46);
      uint64_t v1045 = *((void *)__src + 47);
      uint64_t v1046 = *((void *)__src + 48);
      uint64_t v1047 = *((void *)__src + 49);
      uint64_t v1048 = *((void *)__src + 50);
      uint64_t v1049 = *((void *)__src + 51);
      uint64_t v1693 = *((unsigned __int8 *)v1793 + 92);
      uint64_t v1763 = v1793[22];
      sub_25771CCF8(v1042, v1043, v1044, v1045, v1046, v1047, v1048, v1049, v1763 | (v1693 << 32));
      *((void *)__dst + 44) = v1042;
      *((void *)__dst + 45) = v1043;
      *((void *)__dst + 46) = v1044;
      *((void *)__dst + 47) = v1045;
      *((void *)__dst + 48) = v1046;
      *((void *)__dst + 49) = v1047;
      *((void *)__dst + 50) = v1048;
      *((void *)__dst + 51) = v1049;
      *((unsigned char *)v1795 + 92) = v1693;
      v1795[22] = v1763;
      *((void *)__dst + 53) = *((void *)__src + 53);
      *((void *)__dst + 54) = *((void *)__src + 54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v1038 = *((_OWORD *)__src + 23);
      *uint64_t v332 = *v333;
      *((_OWORD *)__dst + 23) = v1038;
      long long v1039 = *((_OWORD *)__src + 24);
      long long v1040 = *((_OWORD *)__src + 25);
      long long v1041 = *((_OWORD *)__src + 26);
      *((void *)__dst + 54) = *((void *)__src + 54);
      *((_OWORD *)__dst + 25) = v1040;
      *((_OWORD *)__dst + 26) = v1041;
      *((_OWORD *)__dst + 24) = v1039;
    }
    if (!*((void *)__src + 64))
    {
      long long v1050 = *(_OWORD *)(__src + 456);
      *(_OWORD *)(__dst + 440) = *(_OWORD *)(__src + 440);
      *(_OWORD *)(__dst + 456) = v1050;
      long long v1051 = *(_OWORD *)(__src + 472);
      long long v1052 = *(_OWORD *)(__src + 488);
      long long v1053 = *(_OWORD *)(__src + 504);
      *((void *)__dst + 65) = *((void *)__src + 65);
      *(_OWORD *)(__dst + 488) = v1052;
      *(_OWORD *)(__dst + 504) = v1053;
      *(_OWORD *)(__dst + 472) = v1051;
      goto LABEL_459;
    }
    goto LABEL_458;
  }
  if (v335 == 1)
  {
    sub_257735730((uint64_t)(__dst + 352));
    long long v958 = *((_OWORD *)__src + 23);
    long long v957 = *((_OWORD *)__src + 24);
    *uint64_t v332 = *v333;
    *((_OWORD *)__dst + 23) = v958;
    *((_OWORD *)__dst + 24) = v957;
    long long v959 = *((_OWORD *)__src + 28);
    long long v961 = *((_OWORD *)__src + 25);
    long long v960 = *((_OWORD *)__src + 26);
    *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
    *((_OWORD *)__dst + 28) = v959;
    *((_OWORD *)__dst + 25) = v961;
    *((_OWORD *)__dst + 26) = v960;
    long long v962 = *((_OWORD *)__src + 32);
    long long v964 = *((_OWORD *)__src + 29);
    long long v963 = *((_OWORD *)__src + 30);
    *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
    *((_OWORD *)__dst + 32) = v962;
    *((_OWORD *)__dst + 29) = v964;
    *((_OWORD *)__dst + 30) = v963;
    goto LABEL_459;
  }
  if (v334)
  {
    if (v335)
    {
      uint64_t v1004 = *((void *)__src + 45);
      uint64_t v1005 = *((void *)__src + 46);
      uint64_t v1006 = *((void *)__src + 47);
      uint64_t v1007 = *((void *)__src + 48);
      uint64_t v1008 = *((void *)__src + 49);
      uint64_t v1009 = *((void *)__src + 50);
      uint64_t v1010 = *((void *)__src + 51);
      uint64_t v1691 = *((void *)__src + 44);
      uint64_t v1761 = *((unsigned __int8 *)v1793 + 92);
      uint64_t v1011 = v1793[22];
      sub_25771CCF8(v1691, v1004, v1005, v1006, v1007, v1008, v1009, v1010, v1011 | (v1761 << 32));
      uint64_t v1012 = *((void *)__dst + 44);
      uint64_t v1013 = *((void *)__dst + 45);
      uint64_t v1014 = *((void *)__dst + 46);
      uint64_t v1015 = *((void *)__dst + 47);
      uint64_t v1016 = *((void *)__dst + 48);
      uint64_t v1017 = *((void *)__dst + 49);
      uint64_t v1018 = *((void *)__dst + 50);
      uint64_t v1019 = *((void *)__dst + 51);
      unint64_t v1020 = v1795[22] | ((unint64_t)*((unsigned __int8 *)v1795 + 92) << 32);
      *((void *)__dst + 44) = v1691;
      *((void *)__dst + 45) = v1004;
      *((void *)__dst + 46) = v1005;
      *((void *)__dst + 47) = v1006;
      *((void *)__dst + 48) = v1007;
      *((void *)__dst + 49) = v1008;
      *((void *)__dst + 50) = v1009;
      *((void *)__dst + 51) = v1010;
      v1795[22] = v1011;
      *((unsigned char *)v1795 + 92) = v1761;
      sub_25771D110(v1012, v1013, v1014, v1015, v1016, v1017, v1018, v1019, v1020);
      *((void *)__dst + 53) = *((void *)__src + 53);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 54) = *((void *)__src + 54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 352), &qword_26A030F50);
      long long v1090 = *((_OWORD *)__src + 23);
      *uint64_t v332 = *v333;
      *((_OWORD *)__dst + 23) = v1090;
      long long v1092 = *((_OWORD *)__src + 25);
      long long v1091 = *((_OWORD *)__src + 26);
      long long v1093 = *((_OWORD *)__src + 24);
      *((void *)__dst + 54) = *((void *)__src + 54);
      *((_OWORD *)__dst + 25) = v1092;
      *((_OWORD *)__dst + 26) = v1091;
      *((_OWORD *)__dst + 24) = v1093;
    }
  }
  else if (v335)
  {
    uint64_t v1070 = *((void *)__src + 44);
    uint64_t v1071 = *((void *)__src + 45);
    uint64_t v1072 = *((void *)__src + 46);
    uint64_t v1073 = *((void *)__src + 47);
    uint64_t v1074 = *((void *)__src + 48);
    uint64_t v1075 = *((void *)__src + 49);
    uint64_t v1076 = *((void *)__src + 50);
    uint64_t v1077 = *((void *)__src + 51);
    uint64_t v1695 = *((unsigned __int8 *)v1793 + 92);
    uint64_t v1765 = v1793[22];
    sub_25771CCF8(v1070, v1071, v1072, v1073, v1074, v1075, v1076, v1077, v1765 | (v1695 << 32));
    *((void *)__dst + 44) = v1070;
    *((void *)__dst + 45) = v1071;
    *((void *)__dst + 46) = v1072;
    *((void *)__dst + 47) = v1073;
    *((void *)__dst + 48) = v1074;
    *((void *)__dst + 49) = v1075;
    *((void *)__dst + 50) = v1076;
    *((void *)__dst + 51) = v1077;
    *((unsigned char *)v1795 + 92) = v1695;
    v1795[22] = v1765;
    *((void *)__dst + 53) = *((void *)__src + 53);
    *((void *)__dst + 54) = *((void *)__src + 54);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v1102 = *((_OWORD *)__src + 23);
    *uint64_t v332 = *v333;
    *((_OWORD *)__dst + 23) = v1102;
    long long v1103 = *((_OWORD *)__src + 24);
    long long v1104 = *((_OWORD *)__src + 25);
    long long v1105 = *((_OWORD *)__src + 26);
    *((void *)__dst + 54) = *((void *)__src + 54);
    *((_OWORD *)__dst + 25) = v1104;
    *((_OWORD *)__dst + 26) = v1105;
    *((_OWORD *)__dst + 24) = v1103;
  }
  v1106 = __dst + 440;
  v1107 = __src + 440;
  uint64_t v1108 = *((void *)__src + 64);
  if (*((void *)__dst + 64))
  {
    if (v1108)
    {
      uint64_t v1109 = *((void *)__src + 56);
      uint64_t v1110 = *((void *)__src + 57);
      uint64_t v1111 = *((void *)__src + 58);
      uint64_t v1112 = *((void *)__src + 59);
      uint64_t v1113 = *((void *)__src + 60);
      uint64_t v1114 = *((void *)__src + 61);
      uint64_t v1115 = *((void *)__src + 62);
      uint64_t v1697 = *((void *)__src + 55);
      uint64_t v1767 = *((unsigned __int8 *)v1793 + 180);
      uint64_t v1116 = v1793[44];
      sub_25771CCF8(v1697, v1109, v1110, v1111, v1112, v1113, v1114, v1115, v1116 | (v1767 << 32));
      uint64_t v1117 = *((void *)__dst + 55);
      uint64_t v1118 = *((void *)__dst + 56);
      uint64_t v1119 = *((void *)__dst + 57);
      uint64_t v1120 = *((void *)__dst + 58);
      uint64_t v1121 = *((void *)__dst + 59);
      uint64_t v1122 = *((void *)__dst + 60);
      uint64_t v1123 = *((void *)__dst + 61);
      uint64_t v1124 = *((void *)__dst + 62);
      unint64_t v1125 = v1795[44] | ((unint64_t)*((unsigned __int8 *)v1795 + 180) << 32);
      *((void *)__dst + 55) = v1697;
      *((void *)__dst + 56) = v1109;
      *((void *)__dst + 57) = v1110;
      *((void *)__dst + 58) = v1111;
      *((void *)__dst + 59) = v1112;
      *((void *)__dst + 60) = v1113;
      *((void *)__dst + 61) = v1114;
      *((void *)__dst + 62) = v1115;
      v1795[44] = v1116;
      *((unsigned char *)v1795 + 180) = v1767;
      sub_25771D110(v1117, v1118, v1119, v1120, v1121, v1122, v1123, v1124, v1125);
      *((void *)__dst + 64) = *((void *)__src + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 65) = *((void *)__src + 65);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 440), &qword_26A030F50);
      long long v1203 = *(_OWORD *)(__src + 456);
      _OWORD *v1106 = *v1107;
      *(_OWORD *)(__dst + 456) = v1203;
      long long v1205 = *(_OWORD *)(__src + 488);
      long long v1204 = *(_OWORD *)(__src + 504);
      long long v1206 = *(_OWORD *)(__src + 472);
      *((void *)__dst + 65) = *((void *)__src + 65);
      *(_OWORD *)(__dst + 488) = v1205;
      *(_OWORD *)(__dst + 504) = v1204;
      *(_OWORD *)(__dst + 472) = v1206;
    }
  }
  else
  {
    if (v1108)
    {
LABEL_458:
      uint64_t v1126 = *((void *)__src + 55);
      uint64_t v1127 = *((void *)__src + 56);
      uint64_t v1128 = *((void *)__src + 57);
      uint64_t v1129 = *((void *)__src + 58);
      uint64_t v1130 = *((void *)__src + 59);
      uint64_t v1131 = *((void *)__src + 60);
      uint64_t v1132 = *((void *)__src + 61);
      uint64_t v1133 = *((void *)__src + 62);
      uint64_t v1698 = *((unsigned __int8 *)v1793 + 180);
      uint64_t v1768 = v1793[44];
      sub_25771CCF8(v1126, v1127, v1128, v1129, v1130, v1131, v1132, v1133, v1768 | (v1698 << 32));
      *((void *)__dst + 55) = v1126;
      *((void *)__dst + 56) = v1127;
      *((void *)__dst + 57) = v1128;
      *((void *)__dst + 58) = v1129;
      *((void *)__dst + 59) = v1130;
      *((void *)__dst + 60) = v1131;
      *((void *)__dst + 61) = v1132;
      *((void *)__dst + 62) = v1133;
      *((unsigned char *)v1795 + 180) = v1698;
      v1795[44] = v1768;
      *((void *)__dst + 64) = *((void *)__src + 64);
      *((void *)__dst + 65) = *((void *)__src + 65);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_459;
    }
    long long v1312 = *(_OWORD *)(__src + 456);
    _OWORD *v1106 = *v1107;
    *(_OWORD *)(__dst + 456) = v1312;
    long long v1313 = *(_OWORD *)(__src + 472);
    long long v1314 = *(_OWORD *)(__src + 488);
    long long v1315 = *(_OWORD *)(__src + 504);
    *((void *)__dst + 65) = *((void *)__src + 65);
    *(_OWORD *)(__dst + 488) = v1314;
    *(_OWORD *)(__dst + 504) = v1315;
    *(_OWORD *)(__dst + 472) = v1313;
  }
LABEL_459:
  v1134 = __dst + 528;
  v1135 = __src + 528;
  uint64_t v1136 = *((void *)__dst + 75);
  uint64_t v1137 = *((void *)__src + 75);
  if (v1136 == 1)
  {
    if (!v1137)
    {
      long long v1187 = *((_OWORD *)__src + 34);
      _OWORD *v1134 = *v1135;
      *((_OWORD *)__dst + 34) = v1187;
      long long v1188 = *((_OWORD *)__src + 35);
      long long v1189 = *((_OWORD *)__src + 36);
      long long v1190 = *((_OWORD *)__src + 37);
      *((void *)__dst + 76) = *((void *)__src + 76);
      *((_OWORD *)__dst + 36) = v1189;
      *((_OWORD *)__dst + 37) = v1190;
      *((_OWORD *)__dst + 35) = v1188;
      if (*((void *)__src + 86)) {
        goto LABEL_464;
      }
LABEL_471:
      long long v1191 = *(_OWORD *)(__src + 632);
      *(_OWORD *)(__dst + 616) = *(_OWORD *)(__src + 616);
      *(_OWORD *)(__dst + 632) = v1191;
      long long v1192 = *(_OWORD *)(__src + 648);
      long long v1193 = *(_OWORD *)(__src + 664);
      long long v1194 = *(_OWORD *)(__src + 680);
      *((void *)__dst + 87) = *((void *)__src + 87);
      *(_OWORD *)(__dst + 664) = v1193;
      *(_OWORD *)(__dst + 680) = v1194;
      *(_OWORD *)(__dst + 648) = v1192;
      goto LABEL_104;
    }
    if (v1137 == 1)
    {
      long long v1138 = *v1135;
      long long v1139 = *((_OWORD *)__src + 35);
      *((_OWORD *)__dst + 34) = *((_OWORD *)__src + 34);
      *((_OWORD *)__dst + 35) = v1139;
      _OWORD *v1134 = v1138;
      long long v1140 = *((_OWORD *)__src + 36);
      long long v1141 = *((_OWORD *)__src + 37);
      long long v1142 = *((_OWORD *)__src + 39);
      *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
      *((_OWORD *)__dst + 39) = v1142;
      *((_OWORD *)__dst + 36) = v1140;
      *((_OWORD *)__dst + 37) = v1141;
      long long v1143 = *((_OWORD *)__src + 40);
      long long v1144 = *((_OWORD *)__src + 41);
      long long v1145 = *((_OWORD *)__src + 43);
      *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
      *((_OWORD *)__dst + 43) = v1145;
      *((_OWORD *)__dst + 40) = v1143;
      *((_OWORD *)__dst + 41) = v1144;
      goto LABEL_104;
    }
LABEL_463:
    uint64_t v1146 = *((void *)__src + 66);
    uint64_t v1147 = *((void *)__src + 67);
    uint64_t v1148 = *((void *)__src + 68);
    uint64_t v1149 = *((void *)__src + 69);
    uint64_t v1150 = *((void *)__src + 70);
    uint64_t v1151 = *((void *)__src + 71);
    uint64_t v1152 = *((void *)__src + 72);
    uint64_t v1153 = *((void *)__src + 73);
    uint64_t v1699 = *((unsigned __int8 *)v1793 + 268);
    uint64_t v1769 = v1793[66];
    sub_25771CCF8(v1146, v1147, v1148, v1149, v1150, v1151, v1152, v1153, v1769 | (v1699 << 32));
    *((void *)__dst + 66) = v1146;
    *((void *)__dst + 67) = v1147;
    *((void *)__dst + 68) = v1148;
    *((void *)__dst + 69) = v1149;
    *((void *)__dst + 70) = v1150;
    *((void *)__dst + 71) = v1151;
    *((void *)__dst + 72) = v1152;
    *((void *)__dst + 73) = v1153;
    *((unsigned char *)v1795 + 268) = v1699;
    v1795[66] = v1769;
    *((void *)__dst + 75) = *((void *)__src + 75);
    *((void *)__dst + 76) = *((void *)__src + 76);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (*((void *)__src + 86)) {
      goto LABEL_464;
    }
    goto LABEL_471;
  }
  if (v1137 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 528));
    long long v1163 = *((_OWORD *)__src + 34);
    long long v1162 = *((_OWORD *)__src + 35);
    _OWORD *v1134 = *v1135;
    *((_OWORD *)__dst + 34) = v1163;
    *((_OWORD *)__dst + 35) = v1162;
    long long v1164 = *((_OWORD *)__src + 39);
    long long v1166 = *((_OWORD *)__src + 36);
    long long v1165 = *((_OWORD *)__src + 37);
    *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
    *((_OWORD *)__dst + 39) = v1164;
    *((_OWORD *)__dst + 36) = v1166;
    *((_OWORD *)__dst + 37) = v1165;
    long long v1167 = *((_OWORD *)__src + 43);
    long long v1169 = *((_OWORD *)__src + 40);
    long long v1168 = *((_OWORD *)__src + 41);
    *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
    *((_OWORD *)__dst + 43) = v1167;
    *((_OWORD *)__dst + 40) = v1169;
    *((_OWORD *)__dst + 41) = v1168;
  }
  else
  {
    if (v1136)
    {
      if (v1137)
      {
        uint64_t v1170 = *((void *)__src + 67);
        uint64_t v1171 = *((void *)__src + 68);
        uint64_t v1172 = *((void *)__src + 69);
        uint64_t v1173 = *((void *)__src + 70);
        uint64_t v1174 = *((void *)__src + 71);
        uint64_t v1175 = *((void *)__src + 72);
        uint64_t v1176 = *((void *)__src + 73);
        uint64_t v1701 = *((void *)__src + 66);
        uint64_t v1771 = *((unsigned __int8 *)v1793 + 268);
        uint64_t v1177 = v1793[66];
        sub_25771CCF8(v1701, v1170, v1171, v1172, v1173, v1174, v1175, v1176, v1177 | (v1771 << 32));
        uint64_t v1178 = *((void *)__dst + 66);
        uint64_t v1179 = *((void *)__dst + 67);
        uint64_t v1180 = *((void *)__dst + 68);
        uint64_t v1181 = *((void *)__dst + 69);
        uint64_t v1182 = *((void *)__dst + 70);
        uint64_t v1183 = *((void *)__dst + 71);
        uint64_t v1184 = *((void *)__dst + 72);
        uint64_t v1185 = *((void *)__dst + 73);
        unint64_t v1186 = v1795[66] | ((unint64_t)*((unsigned __int8 *)v1795 + 268) << 32);
        *((void *)__dst + 66) = v1701;
        *((void *)__dst + 67) = v1170;
        *((void *)__dst + 68) = v1171;
        *((void *)__dst + 69) = v1172;
        *((void *)__dst + 70) = v1173;
        *((void *)__dst + 71) = v1174;
        *((void *)__dst + 72) = v1175;
        *((void *)__dst + 73) = v1176;
        v1795[66] = v1177;
        *((unsigned char *)v1795 + 268) = v1771;
        sub_25771D110(v1178, v1179, v1180, v1181, v1182, v1183, v1184, v1185, v1186);
        *((void *)__dst + 75) = *((void *)__src + 75);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 76) = *((void *)__src + 76);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 528), &qword_26A030F50);
        long long v1207 = *((_OWORD *)__src + 34);
        _OWORD *v1134 = *v1135;
        *((_OWORD *)__dst + 34) = v1207;
        long long v1209 = *((_OWORD *)__src + 36);
        long long v1208 = *((_OWORD *)__src + 37);
        long long v1210 = *((_OWORD *)__src + 35);
        *((void *)__dst + 76) = *((void *)__src + 76);
        *((_OWORD *)__dst + 36) = v1209;
        *((_OWORD *)__dst + 37) = v1208;
        *((_OWORD *)__dst + 35) = v1210;
      }
    }
    else if (v1137)
    {
      uint64_t v1195 = *((void *)__src + 66);
      uint64_t v1196 = *((void *)__src + 67);
      uint64_t v1197 = *((void *)__src + 68);
      uint64_t v1198 = *((void *)__src + 69);
      uint64_t v1199 = *((void *)__src + 70);
      uint64_t v1200 = *((void *)__src + 71);
      uint64_t v1201 = *((void *)__src + 72);
      uint64_t v1202 = *((void *)__src + 73);
      uint64_t v1702 = *((unsigned __int8 *)v1793 + 268);
      uint64_t v1772 = v1793[66];
      sub_25771CCF8(v1195, v1196, v1197, v1198, v1199, v1200, v1201, v1202, v1772 | (v1702 << 32));
      *((void *)__dst + 66) = v1195;
      *((void *)__dst + 67) = v1196;
      *((void *)__dst + 68) = v1197;
      *((void *)__dst + 69) = v1198;
      *((void *)__dst + 70) = v1199;
      *((void *)__dst + 71) = v1200;
      *((void *)__dst + 72) = v1201;
      *((void *)__dst + 73) = v1202;
      *((unsigned char *)v1795 + 268) = v1702;
      v1795[66] = v1772;
      *((void *)__dst + 75) = *((void *)__src + 75);
      *((void *)__dst + 76) = *((void *)__src + 76);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v1316 = *((_OWORD *)__src + 34);
      _OWORD *v1134 = *v1135;
      *((_OWORD *)__dst + 34) = v1316;
      long long v1317 = *((_OWORD *)__src + 35);
      long long v1318 = *((_OWORD *)__src + 36);
      long long v1319 = *((_OWORD *)__src + 37);
      *((void *)__dst + 76) = *((void *)__src + 76);
      *((_OWORD *)__dst + 36) = v1318;
      *((_OWORD *)__dst + 37) = v1319;
      *((_OWORD *)__dst + 35) = v1317;
    }
    v1320 = __dst + 616;
    v1321 = __src + 616;
    uint64_t v1322 = *((void *)__src + 86);
    if (*((void *)__dst + 86))
    {
      if (v1322)
      {
        uint64_t v1323 = *((void *)__src + 78);
        uint64_t v1324 = *((void *)__src + 79);
        uint64_t v1325 = *((void *)__src + 80);
        uint64_t v1326 = *((void *)__src + 81);
        uint64_t v1327 = *((void *)__src + 82);
        uint64_t v1328 = *((void *)__src + 83);
        uint64_t v1329 = *((void *)__src + 84);
        uint64_t v1708 = *((void *)__src + 77);
        uint64_t v1778 = *((unsigned __int8 *)v1793 + 356);
        uint64_t v1330 = v1793[88];
        sub_25771CCF8(v1708, v1323, v1324, v1325, v1326, v1327, v1328, v1329, v1330 | (v1778 << 32));
        uint64_t v1331 = *((void *)__dst + 77);
        uint64_t v1332 = *((void *)__dst + 78);
        uint64_t v1333 = *((void *)__dst + 79);
        uint64_t v1334 = *((void *)__dst + 80);
        uint64_t v1335 = *((void *)__dst + 81);
        uint64_t v1336 = *((void *)__dst + 82);
        uint64_t v1337 = *((void *)__dst + 83);
        uint64_t v1338 = *((void *)__dst + 84);
        unint64_t v1339 = v1795[88] | ((unint64_t)*((unsigned __int8 *)v1795 + 356) << 32);
        *((void *)__dst + 77) = v1708;
        *((void *)__dst + 78) = v1323;
        *((void *)__dst + 79) = v1324;
        *((void *)__dst + 80) = v1325;
        *((void *)__dst + 81) = v1326;
        *((void *)__dst + 82) = v1327;
        *((void *)__dst + 83) = v1328;
        *((void *)__dst + 84) = v1329;
        v1795[88] = v1330;
        *((unsigned char *)v1795 + 356) = v1778;
        sub_25771D110(v1331, v1332, v1333, v1334, v1335, v1336, v1337, v1338, v1339);
        *((void *)__dst + 86) = *((void *)__src + 86);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 87) = *((void *)__src + 87);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 616), &qword_26A030F50);
        long long v1344 = *(_OWORD *)(__src + 632);
        _OWORD *v1320 = *v1321;
        *(_OWORD *)(__dst + 632) = v1344;
        long long v1346 = *(_OWORD *)(__src + 664);
        long long v1345 = *(_OWORD *)(__src + 680);
        long long v1347 = *(_OWORD *)(__src + 648);
        *((void *)__dst + 87) = *((void *)__src + 87);
        *(_OWORD *)(__dst + 664) = v1346;
        *(_OWORD *)(__dst + 680) = v1345;
        *(_OWORD *)(__dst + 648) = v1347;
      }
    }
    else
    {
      if (v1322) {
        goto LABEL_464;
      }
      long long v1340 = *(_OWORD *)(__src + 632);
      _OWORD *v1320 = *v1321;
      *(_OWORD *)(__dst + 632) = v1340;
      long long v1341 = *(_OWORD *)(__src + 648);
      long long v1342 = *(_OWORD *)(__src + 664);
      long long v1343 = *(_OWORD *)(__src + 680);
      *((void *)__dst + 87) = *((void *)__src + 87);
      *(_OWORD *)(__dst + 664) = v1342;
      *(_OWORD *)(__dst + 680) = v1343;
      *(_OWORD *)(__dst + 648) = v1341;
    }
  }
LABEL_104:
  uint64_t v352 = __dst + 704;
  uint64_t v353 = __src + 704;
  uint64_t v354 = *((void *)__src + 111);
  if (!*((void *)__dst + 111))
  {
    if (!v354)
    {
      *uint64_t v352 = *v353;
      long long v398 = *((_OWORD *)__src + 45);
      long long v399 = *((_OWORD *)__src + 46);
      long long v400 = *((_OWORD *)__src + 48);
      *((_OWORD *)__dst + 47) = *((_OWORD *)__src + 47);
      *((_OWORD *)__dst + 48) = v400;
      *((_OWORD *)__dst + 45) = v398;
      *((_OWORD *)__dst + 46) = v399;
      long long v401 = *((_OWORD *)__src + 49);
      long long v402 = *((_OWORD *)__src + 50);
      long long v403 = *((_OWORD *)__src + 52);
      *((_OWORD *)__dst + 51) = *((_OWORD *)__src + 51);
      *((_OWORD *)__dst + 52) = v403;
      *((_OWORD *)__dst + 49) = v401;
      *((_OWORD *)__dst + 50) = v402;
      long long v404 = *((_OWORD *)__src + 53);
      long long v405 = *((_OWORD *)__src + 54);
      long long v406 = *((_OWORD *)__src + 55);
      *((void *)__dst + 112) = *((void *)__src + 112);
      *((_OWORD *)__dst + 54) = v405;
      *((_OWORD *)__dst + 55) = v406;
      *((_OWORD *)__dst + 53) = v404;
      goto LABEL_161;
    }
    if (*((void *)__src + 97))
    {
      uint64_t v373 = *((void *)__src + 88);
      uint64_t v374 = *((void *)__src + 89);
      uint64_t v375 = *((void *)__src + 90);
      uint64_t v376 = *((void *)__src + 91);
      uint64_t v377 = *((void *)__src + 92);
      uint64_t v378 = *((void *)__src + 93);
      uint64_t v379 = *((void *)__src + 94);
      uint64_t v380 = *((void *)__src + 95);
      uint64_t v1671 = *((unsigned __int8 *)v1793 + 444);
      uint64_t v1741 = v1793[110];
      sub_25771CCF8(v373, v374, v375, v376, v377, v378, v379, v380, v1741 | (v1671 << 32));
      *((void *)__dst + 88) = v373;
      *((void *)__dst + 89) = v374;
      *((void *)__dst + 90) = v375;
      *((void *)__dst + 91) = v376;
      *((void *)__dst + 92) = v377;
      *((void *)__dst + 93) = v378;
      *((void *)__dst + 94) = v379;
      *((void *)__dst + 95) = v380;
      *((unsigned char *)v1795 + 444) = v1671;
      v1795[110] = v1741;
      *((void *)__dst + 97) = *((void *)__src + 97);
      *((void *)__dst + 98) = *((void *)__src + 98);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 100)) {
        goto LABEL_112;
      }
    }
    else
    {
      long long v411 = *((_OWORD *)__src + 45);
      *uint64_t v352 = *v353;
      *((_OWORD *)__dst + 45) = v411;
      long long v412 = *((_OWORD *)__src + 46);
      long long v413 = *((_OWORD *)__src + 47);
      long long v414 = *((_OWORD *)__src + 48);
      *((void *)__dst + 98) = *((void *)__src + 98);
      *((_OWORD *)__dst + 47) = v413;
      *((_OWORD *)__dst + 48) = v414;
      *((_OWORD *)__dst + 46) = v412;
      if (*((void *)__src + 100))
      {
LABEL_112:
        *((void *)__dst + 99) = *((void *)__src + 99);
        *((void *)__dst + 100) = *((void *)__src + 100);
        *((void *)__dst + 101) = *((void *)__src + 101);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (*((void *)__src + 103)) {
          goto LABEL_113;
        }
        goto LABEL_123;
      }
    }
    long long v415 = *(_OWORD *)(__src + 792);
    *((void *)__dst + 101) = *((void *)__src + 101);
    *(_OWORD *)(__dst + 792) = v415;
    if (*((void *)__src + 103))
    {
LABEL_113:
      __dst[816] = __src[816];
      *((void *)__dst + 103) = *((void *)__src + 103);
      *((void *)__dst + 104) = *((void *)__src + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 106)) {
        goto LABEL_114;
      }
      goto LABEL_124;
    }
LABEL_123:
    long long v416 = *((_OWORD *)__src + 51);
    *((void *)__dst + 104) = *((void *)__src + 104);
    *((_OWORD *)__dst + 51) = v416;
    if (*((void *)__src + 106))
    {
LABEL_114:
      __dst[840] = __src[840];
      *((void *)__dst + 106) = *((void *)__src + 106);
      *((void *)__dst + 107) = *((void *)__src + 107);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 109))
      {
LABEL_115:
        __dst[864] = __src[864];
        *((void *)__dst + 109) = *((void *)__src + 109);
        *((void *)__dst + 110) = *((void *)__src + 110);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_126:
        *((void *)__dst + 111) = *((void *)__src + 111);
        *((void *)__dst + 112) = *((void *)__src + 112);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_161;
      }
LABEL_125:
      long long v418 = *((_OWORD *)__src + 54);
      *((void *)__dst + 110) = *((void *)__src + 110);
      *((_OWORD *)__dst + 54) = v418;
      goto LABEL_126;
    }
LABEL_124:
    long long v417 = *(_OWORD *)(__src + 840);
    *((void *)__dst + 107) = *((void *)__src + 107);
    *(_OWORD *)(__dst + 840) = v417;
    if (*((void *)__src + 109)) {
      goto LABEL_115;
    }
    goto LABEL_125;
  }
  if (v354)
  {
    uint64_t v355 = *((void *)__src + 97);
    if (*((void *)__dst + 97))
    {
      if (v355)
      {
        uint64_t v356 = *((void *)__src + 89);
        uint64_t v357 = *((void *)__src + 90);
        uint64_t v358 = *((void *)__src + 91);
        uint64_t v359 = *((void *)__src + 92);
        uint64_t v360 = *((void *)__src + 93);
        uint64_t v361 = *((void *)__src + 94);
        uint64_t v362 = *((void *)__src + 95);
        uint64_t v1670 = *((void *)__src + 88);
        uint64_t v1740 = *((unsigned __int8 *)v1793 + 444);
        uint64_t v363 = v1793[110];
        sub_25771CCF8(v1670, v356, v357, v358, v359, v360, v361, v362, v363 | (v1740 << 32));
        uint64_t v364 = *((void *)__dst + 88);
        uint64_t v365 = *((void *)__dst + 89);
        uint64_t v366 = *((void *)__dst + 90);
        uint64_t v367 = *((void *)__dst + 91);
        uint64_t v368 = *((void *)__dst + 92);
        uint64_t v369 = *((void *)__dst + 93);
        uint64_t v370 = *((void *)__dst + 94);
        uint64_t v371 = *((void *)__dst + 95);
        unint64_t v372 = v1795[110] | ((unint64_t)*((unsigned __int8 *)v1795 + 444) << 32);
        *((void *)__dst + 88) = v1670;
        *((void *)__dst + 89) = v356;
        *((void *)__dst + 90) = v357;
        *((void *)__dst + 91) = v358;
        *((void *)__dst + 92) = v359;
        *((void *)__dst + 93) = v360;
        *((void *)__dst + 94) = v361;
        *((void *)__dst + 95) = v362;
        v1795[110] = v363;
        *((unsigned char *)v1795 + 444) = v1740;
        sub_25771D110(v364, v365, v366, v367, v368, v369, v370, v371, v372);
        *((void *)__dst + 97) = *((void *)__src + 97);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 98) = *((void *)__src + 98);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 704), &qword_26A030F50);
        long long v407 = *((_OWORD *)__src + 45);
        *uint64_t v352 = *v353;
        *((_OWORD *)__dst + 45) = v407;
        long long v409 = *((_OWORD *)__src + 47);
        long long v408 = *((_OWORD *)__src + 48);
        long long v410 = *((_OWORD *)__src + 46);
        *((void *)__dst + 98) = *((void *)__src + 98);
        *((_OWORD *)__dst + 47) = v409;
        *((_OWORD *)__dst + 48) = v408;
        *((_OWORD *)__dst + 46) = v410;
      }
    }
    else if (v355)
    {
      uint64_t v390 = *((void *)__src + 88);
      uint64_t v391 = *((void *)__src + 89);
      uint64_t v392 = *((void *)__src + 90);
      uint64_t v393 = *((void *)__src + 91);
      uint64_t v394 = *((void *)__src + 92);
      uint64_t v395 = *((void *)__src + 93);
      uint64_t v396 = *((void *)__src + 94);
      uint64_t v397 = *((void *)__src + 95);
      uint64_t v1672 = *((unsigned __int8 *)v1793 + 444);
      uint64_t v1742 = v1793[110];
      sub_25771CCF8(v390, v391, v392, v393, v394, v395, v396, v397, v1742 | (v1672 << 32));
      *((void *)__dst + 88) = v390;
      *((void *)__dst + 89) = v391;
      *((void *)__dst + 90) = v392;
      *((void *)__dst + 91) = v393;
      *((void *)__dst + 92) = v394;
      *((void *)__dst + 93) = v395;
      *((void *)__dst + 94) = v396;
      *((void *)__dst + 95) = v397;
      *((unsigned char *)v1795 + 444) = v1672;
      v1795[110] = v1742;
      *((void *)__dst + 97) = *((void *)__src + 97);
      *((void *)__dst + 98) = *((void *)__src + 98);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v427 = *((_OWORD *)__src + 45);
      *uint64_t v352 = *v353;
      *((_OWORD *)__dst + 45) = v427;
      long long v428 = *((_OWORD *)__src + 46);
      long long v429 = *((_OWORD *)__src + 47);
      long long v430 = *((_OWORD *)__src + 48);
      *((void *)__dst + 98) = *((void *)__src + 98);
      *((_OWORD *)__dst + 47) = v429;
      *((_OWORD *)__dst + 48) = v430;
      *((_OWORD *)__dst + 46) = v428;
    }
    v431 = __dst + 792;
    v432 = __src + 792;
    uint64_t v433 = *((void *)__src + 100);
    if (*((void *)__dst + 100))
    {
      if (v433)
      {
        *((void *)__dst + 99) = *((void *)__src + 99);
        *((void *)__dst + 100) = *((void *)__src + 100);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 101) = *((void *)__src + 101);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 792), &qword_26A030F58);
        uint64_t v434 = *((void *)__src + 101);
        _OWORD *v431 = *v432;
        *((void *)__dst + 101) = v434;
      }
    }
    else if (v433)
    {
      *((void *)__dst + 99) = *((void *)__src + 99);
      *((void *)__dst + 100) = *((void *)__src + 100);
      *((void *)__dst + 101) = *((void *)__src + 101);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v435 = *v432;
      *((void *)__dst + 101) = *((void *)__src + 101);
      _OWORD *v431 = v435;
    }
    v436 = __dst + 816;
    v437 = __src + 816;
    uint64_t v438 = *((void *)__src + 103);
    if (*((void *)__dst + 103))
    {
      if (v438)
      {
        __dst[816] = __src[816];
        *((void *)__dst + 103) = *((void *)__src + 103);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 104) = *((void *)__src + 104);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 816), &qword_26A030F60);
        uint64_t v439 = *((void *)__src + 104);
        _OWORD *v436 = *v437;
        *((void *)__dst + 104) = v439;
      }
    }
    else if (v438)
    {
      __dst[816] = __src[816];
      *((void *)__dst + 103) = *((void *)__src + 103);
      *((void *)__dst + 104) = *((void *)__src + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v440 = *v437;
      *((void *)__dst + 104) = *((void *)__src + 104);
      _OWORD *v436 = v440;
    }
    v441 = __dst + 840;
    v442 = __src + 840;
    uint64_t v443 = *((void *)__src + 106);
    if (*((void *)__dst + 106))
    {
      if (v443)
      {
        __dst[840] = __src[840];
        *((void *)__dst + 106) = *((void *)__src + 106);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 107) = *((void *)__src + 107);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 840), &qword_26A030F68);
        uint64_t v444 = *((void *)__src + 107);
        _OWORD *v441 = *v442;
        *((void *)__dst + 107) = v444;
      }
    }
    else if (v443)
    {
      __dst[840] = __src[840];
      *((void *)__dst + 106) = *((void *)__src + 106);
      *((void *)__dst + 107) = *((void *)__src + 107);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v445 = *v442;
      *((void *)__dst + 107) = *((void *)__src + 107);
      _OWORD *v441 = v445;
    }
    v446 = __dst + 864;
    v447 = __src + 864;
    uint64_t v448 = *((void *)__src + 109);
    if (*((void *)__dst + 109))
    {
      if (v448)
      {
        __dst[864] = __src[864];
        *((void *)__dst + 109) = *((void *)__src + 109);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 110) = *((void *)__src + 110);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 864), &qword_26A030F70);
        uint64_t v449 = *((void *)__src + 110);
        _OWORD *v446 = *v447;
        *((void *)__dst + 110) = v449;
      }
    }
    else if (v448)
    {
      __dst[864] = __src[864];
      *((void *)__dst + 109) = *((void *)__src + 109);
      *((void *)__dst + 110) = *((void *)__src + 110);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v450 = *v447;
      *((void *)__dst + 110) = *((void *)__src + 110);
      _OWORD *v446 = v450;
    }
    *((void *)__dst + 111) = *((void *)__src + 111);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)__dst + 112) = *((void *)__src + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2577270D4((uint64_t)(__dst + 704), &qword_26A030F78);
    *uint64_t v352 = *v353;
    long long v381 = *((_OWORD *)__src + 48);
    long long v383 = *((_OWORD *)__src + 45);
    long long v382 = *((_OWORD *)__src + 46);
    *((_OWORD *)__dst + 47) = *((_OWORD *)__src + 47);
    *((_OWORD *)__dst + 48) = v381;
    *((_OWORD *)__dst + 45) = v383;
    *((_OWORD *)__dst + 46) = v382;
    long long v384 = *((_OWORD *)__src + 52);
    long long v386 = *((_OWORD *)__src + 49);
    long long v385 = *((_OWORD *)__src + 50);
    *((_OWORD *)__dst + 51) = *((_OWORD *)__src + 51);
    *((_OWORD *)__dst + 52) = v384;
    *((_OWORD *)__dst + 49) = v386;
    *((_OWORD *)__dst + 50) = v385;
    long long v388 = *((_OWORD *)__src + 54);
    long long v387 = *((_OWORD *)__src + 55);
    long long v389 = *((_OWORD *)__src + 53);
    *((void *)__dst + 112) = *((void *)__src + 112);
    *((_OWORD *)__dst + 54) = v388;
    *((_OWORD *)__dst + 55) = v387;
    *((_OWORD *)__dst + 53) = v389;
  }
LABEL_161:
  v451 = __dst + 904;
  v452 = __src + 904;
  uint64_t v453 = *((void *)__src + 136);
  if (!*((void *)__dst + 136))
  {
    if (!v453)
    {
      _OWORD *v451 = *v452;
      long long v497 = *(_OWORD *)(__src + 920);
      long long v498 = *(_OWORD *)(__src + 936);
      long long v499 = *(_OWORD *)(__src + 968);
      *(_OWORD *)(__dst + 952) = *(_OWORD *)(__src + 952);
      *(_OWORD *)(__dst + 968) = v499;
      *(_OWORD *)(__dst + 920) = v497;
      *(_OWORD *)(__dst + 936) = v498;
      long long v500 = *(_OWORD *)(__src + 984);
      long long v501 = *(_OWORD *)(__src + 1000);
      long long v502 = *(_OWORD *)(__src + 1032);
      *(_OWORD *)(__dst + 1016) = *(_OWORD *)(__src + 1016);
      *(_OWORD *)(__dst + 1032) = v502;
      *(_OWORD *)(__dst + 984) = v500;
      *(_OWORD *)(__dst + 1000) = v501;
      long long v503 = *(_OWORD *)(__src + 1048);
      long long v504 = *(_OWORD *)(__src + 1064);
      long long v505 = *(_OWORD *)(__src + 1080);
      *((void *)__dst + 137) = *((void *)__src + 137);
      *(_OWORD *)(__dst + 1064) = v504;
      *(_OWORD *)(__dst + 1080) = v505;
      *(_OWORD *)(__dst + 1048) = v503;
      goto LABEL_214;
    }
    if (*((void *)__src + 122))
    {
      uint64_t v472 = *((void *)__src + 113);
      uint64_t v473 = *((void *)__src + 114);
      uint64_t v474 = *((void *)__src + 115);
      uint64_t v475 = *((void *)__src + 116);
      uint64_t v476 = *((void *)__src + 117);
      uint64_t v477 = *((void *)__src + 118);
      uint64_t v478 = *((void *)__src + 119);
      uint64_t v479 = *((void *)__src + 120);
      uint64_t v1674 = *((unsigned __int8 *)v1793 + 644);
      uint64_t v1744 = v1793[160];
      sub_25771CCF8(v472, v473, v474, v475, v476, v477, v478, v479, v1744 | (v1674 << 32));
      *((void *)__dst + 113) = v472;
      *((void *)__dst + 114) = v473;
      *((void *)__dst + 115) = v474;
      *((void *)__dst + 116) = v475;
      *((void *)__dst + 117) = v476;
      *((void *)__dst + 118) = v477;
      *((void *)__dst + 119) = v478;
      *((void *)__dst + 120) = v479;
      *((unsigned char *)v1795 + 644) = v1674;
      v1795[160] = v1744;
      *((void *)__dst + 122) = *((void *)__src + 122);
      *((void *)__dst + 123) = *((void *)__src + 123);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 125)) {
        goto LABEL_169;
      }
    }
    else
    {
      long long v510 = *(_OWORD *)(__src + 920);
      _OWORD *v451 = *v452;
      *(_OWORD *)(__dst + 920) = v510;
      long long v511 = *(_OWORD *)(__src + 936);
      long long v512 = *(_OWORD *)(__src + 952);
      long long v513 = *(_OWORD *)(__src + 968);
      *((void *)__dst + 123) = *((void *)__src + 123);
      *(_OWORD *)(__dst + 952) = v512;
      *(_OWORD *)(__dst + 968) = v513;
      *(_OWORD *)(__dst + 936) = v511;
      if (*((void *)__src + 125))
      {
LABEL_169:
        *((void *)__dst + 124) = *((void *)__src + 124);
        *((void *)__dst + 125) = *((void *)__src + 125);
        *((void *)__dst + 126) = *((void *)__src + 126);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (*((void *)__src + 128)) {
          goto LABEL_170;
        }
        goto LABEL_180;
      }
    }
    long long v514 = *((_OWORD *)__src + 62);
    *((void *)__dst + 126) = *((void *)__src + 126);
    *((_OWORD *)__dst + 62) = v514;
    if (*((void *)__src + 128))
    {
LABEL_170:
      __dst[1016] = __src[1016];
      *((void *)__dst + 128) = *((void *)__src + 128);
      *((void *)__dst + 129) = *((void *)__src + 129);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 131)) {
        goto LABEL_171;
      }
      goto LABEL_181;
    }
LABEL_180:
    long long v515 = *(_OWORD *)(__src + 1016);
    *((void *)__dst + 129) = *((void *)__src + 129);
    *(_OWORD *)(__dst + 1016) = v515;
    if (*((void *)__src + 131))
    {
LABEL_171:
      __dst[1040] = __src[1040];
      *((void *)__dst + 131) = *((void *)__src + 131);
      *((void *)__dst + 132) = *((void *)__src + 132);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 134))
      {
LABEL_172:
        __dst[1064] = __src[1064];
        *((void *)__dst + 134) = *((void *)__src + 134);
        *((void *)__dst + 135) = *((void *)__src + 135);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_183:
        *((void *)__dst + 136) = *((void *)__src + 136);
        *((void *)__dst + 137) = *((void *)__src + 137);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_214;
      }
LABEL_182:
      long long v517 = *(_OWORD *)(__src + 1064);
      *((void *)__dst + 135) = *((void *)__src + 135);
      *(_OWORD *)(__dst + 1064) = v517;
      goto LABEL_183;
    }
LABEL_181:
    long long v516 = *((_OWORD *)__src + 65);
    *((void *)__dst + 132) = *((void *)__src + 132);
    *((_OWORD *)__dst + 65) = v516;
    if (*((void *)__src + 134)) {
      goto LABEL_172;
    }
    goto LABEL_182;
  }
  if (v453)
  {
    uint64_t v454 = *((void *)__src + 122);
    if (*((void *)__dst + 122))
    {
      if (v454)
      {
        uint64_t v455 = *((void *)__src + 114);
        uint64_t v456 = *((void *)__src + 115);
        uint64_t v457 = *((void *)__src + 116);
        uint64_t v458 = *((void *)__src + 117);
        uint64_t v459 = *((void *)__src + 118);
        uint64_t v460 = *((void *)__src + 119);
        uint64_t v461 = *((void *)__src + 120);
        uint64_t v1673 = *((void *)__src + 113);
        uint64_t v1743 = *((unsigned __int8 *)v1793 + 644);
        uint64_t v462 = v1793[160];
        sub_25771CCF8(v1673, v455, v456, v457, v458, v459, v460, v461, v462 | (v1743 << 32));
        uint64_t v463 = *((void *)__dst + 113);
        uint64_t v464 = *((void *)__dst + 114);
        uint64_t v465 = *((void *)__dst + 115);
        uint64_t v466 = *((void *)__dst + 116);
        uint64_t v467 = *((void *)__dst + 117);
        uint64_t v468 = *((void *)__dst + 118);
        uint64_t v469 = *((void *)__dst + 119);
        uint64_t v470 = *((void *)__dst + 120);
        unint64_t v471 = v1795[160] | ((unint64_t)*((unsigned __int8 *)v1795 + 644) << 32);
        *((void *)__dst + 113) = v1673;
        *((void *)__dst + 114) = v455;
        *((void *)__dst + 115) = v456;
        *((void *)__dst + 116) = v457;
        *((void *)__dst + 117) = v458;
        *((void *)__dst + 118) = v459;
        *((void *)__dst + 119) = v460;
        *((void *)__dst + 120) = v461;
        v1795[160] = v462;
        *((unsigned char *)v1795 + 644) = v1743;
        sub_25771D110(v463, v464, v465, v466, v467, v468, v469, v470, v471);
        *((void *)__dst + 122) = *((void *)__src + 122);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 123) = *((void *)__src + 123);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 904), &qword_26A030F50);
        long long v506 = *(_OWORD *)(__src + 920);
        _OWORD *v451 = *v452;
        *(_OWORD *)(__dst + 920) = v506;
        long long v508 = *(_OWORD *)(__src + 952);
        long long v507 = *(_OWORD *)(__src + 968);
        long long v509 = *(_OWORD *)(__src + 936);
        *((void *)__dst + 123) = *((void *)__src + 123);
        *(_OWORD *)(__dst + 952) = v508;
        *(_OWORD *)(__dst + 968) = v507;
        *(_OWORD *)(__dst + 936) = v509;
      }
    }
    else if (v454)
    {
      uint64_t v489 = *((void *)__src + 113);
      uint64_t v490 = *((void *)__src + 114);
      uint64_t v491 = *((void *)__src + 115);
      uint64_t v492 = *((void *)__src + 116);
      uint64_t v493 = *((void *)__src + 117);
      uint64_t v494 = *((void *)__src + 118);
      uint64_t v495 = *((void *)__src + 119);
      uint64_t v496 = *((void *)__src + 120);
      uint64_t v1675 = *((unsigned __int8 *)v1793 + 644);
      uint64_t v1745 = v1793[160];
      sub_25771CCF8(v489, v490, v491, v492, v493, v494, v495, v496, v1745 | (v1675 << 32));
      *((void *)__dst + 113) = v489;
      *((void *)__dst + 114) = v490;
      *((void *)__dst + 115) = v491;
      *((void *)__dst + 116) = v492;
      *((void *)__dst + 117) = v493;
      *((void *)__dst + 118) = v494;
      *((void *)__dst + 119) = v495;
      *((void *)__dst + 120) = v496;
      *((unsigned char *)v1795 + 644) = v1675;
      v1795[160] = v1745;
      *((void *)__dst + 122) = *((void *)__src + 122);
      *((void *)__dst + 123) = *((void *)__src + 123);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v518 = *(_OWORD *)(__src + 920);
      _OWORD *v451 = *v452;
      *(_OWORD *)(__dst + 920) = v518;
      long long v519 = *(_OWORD *)(__src + 936);
      long long v520 = *(_OWORD *)(__src + 952);
      long long v521 = *(_OWORD *)(__src + 968);
      *((void *)__dst + 123) = *((void *)__src + 123);
      *(_OWORD *)(__dst + 952) = v520;
      *(_OWORD *)(__dst + 968) = v521;
      *(_OWORD *)(__dst + 936) = v519;
    }
    v522 = __dst + 992;
    v523 = __src + 992;
    uint64_t v524 = *((void *)__src + 125);
    if (*((void *)__dst + 125))
    {
      if (v524)
      {
        *((void *)__dst + 124) = *((void *)__src + 124);
        *((void *)__dst + 125) = *((void *)__src + 125);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 126) = *((void *)__src + 126);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 992), &qword_26A030F58);
        uint64_t v525 = *((void *)__src + 126);
        _OWORD *v522 = *v523;
        *((void *)__dst + 126) = v525;
      }
    }
    else if (v524)
    {
      *((void *)__dst + 124) = *((void *)__src + 124);
      *((void *)__dst + 125) = *((void *)__src + 125);
      *((void *)__dst + 126) = *((void *)__src + 126);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v526 = *v523;
      *((void *)__dst + 126) = *((void *)__src + 126);
      _OWORD *v522 = v526;
    }
    v527 = __dst + 1016;
    v528 = __src + 1016;
    uint64_t v529 = *((void *)__src + 128);
    if (*((void *)__dst + 128))
    {
      if (v529)
      {
        __dst[1016] = __src[1016];
        *((void *)__dst + 128) = *((void *)__src + 128);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 129) = *((void *)__src + 129);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1016), &qword_26A030F60);
        uint64_t v530 = *((void *)__src + 129);
        _OWORD *v527 = *v528;
        *((void *)__dst + 129) = v530;
      }
    }
    else if (v529)
    {
      __dst[1016] = __src[1016];
      *((void *)__dst + 128) = *((void *)__src + 128);
      *((void *)__dst + 129) = *((void *)__src + 129);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v531 = *v528;
      *((void *)__dst + 129) = *((void *)__src + 129);
      _OWORD *v527 = v531;
    }
    v532 = __dst + 1040;
    v533 = __src + 1040;
    uint64_t v534 = *((void *)__src + 131);
    if (*((void *)__dst + 131))
    {
      if (v534)
      {
        __dst[1040] = __src[1040];
        *((void *)__dst + 131) = *((void *)__src + 131);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 132) = *((void *)__src + 132);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1040), &qword_26A030F68);
        uint64_t v535 = *((void *)__src + 132);
        _OWORD *v532 = *v533;
        *((void *)__dst + 132) = v535;
      }
    }
    else if (v534)
    {
      __dst[1040] = __src[1040];
      *((void *)__dst + 131) = *((void *)__src + 131);
      *((void *)__dst + 132) = *((void *)__src + 132);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v536 = *v533;
      *((void *)__dst + 132) = *((void *)__src + 132);
      _OWORD *v532 = v536;
    }
    v537 = __dst + 1064;
    v538 = __src + 1064;
    uint64_t v539 = *((void *)__src + 134);
    if (*((void *)__dst + 134))
    {
      if (v539)
      {
        __dst[1064] = __src[1064];
        *((void *)__dst + 134) = *((void *)__src + 134);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 135) = *((void *)__src + 135);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1064), &qword_26A030F70);
        uint64_t v540 = *((void *)__src + 135);
        _OWORD *v537 = *v538;
        *((void *)__dst + 135) = v540;
      }
    }
    else if (v539)
    {
      __dst[1064] = __src[1064];
      *((void *)__dst + 134) = *((void *)__src + 134);
      *((void *)__dst + 135) = *((void *)__src + 135);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v541 = *v538;
      *((void *)__dst + 135) = *((void *)__src + 135);
      _OWORD *v537 = v541;
    }
    *((void *)__dst + 136) = *((void *)__src + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)__dst + 137) = *((void *)__src + 137);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2577270D4((uint64_t)(__dst + 904), &qword_26A030F78);
    _OWORD *v451 = *v452;
    long long v480 = *(_OWORD *)(__src + 968);
    long long v482 = *(_OWORD *)(__src + 920);
    long long v481 = *(_OWORD *)(__src + 936);
    *(_OWORD *)(__dst + 952) = *(_OWORD *)(__src + 952);
    *(_OWORD *)(__dst + 968) = v480;
    *(_OWORD *)(__dst + 920) = v482;
    *(_OWORD *)(__dst + 936) = v481;
    long long v483 = *(_OWORD *)(__src + 1032);
    long long v485 = *(_OWORD *)(__src + 984);
    long long v484 = *(_OWORD *)(__src + 1000);
    *(_OWORD *)(__dst + 1016) = *(_OWORD *)(__src + 1016);
    *(_OWORD *)(__dst + 1032) = v483;
    *(_OWORD *)(__dst + 984) = v485;
    *(_OWORD *)(__dst + 1000) = v484;
    long long v487 = *(_OWORD *)(__src + 1064);
    long long v486 = *(_OWORD *)(__src + 1080);
    long long v488 = *(_OWORD *)(__src + 1048);
    *((void *)__dst + 137) = *((void *)__src + 137);
    *(_OWORD *)(__dst + 1064) = v487;
    *(_OWORD *)(__dst + 1080) = v486;
    *(_OWORD *)(__dst + 1048) = v488;
  }
LABEL_214:
  v542 = __dst + 1104;
  v543 = __src + 1104;
  uint64_t v544 = *((void *)__src + 161);
  if (!*((void *)__dst + 161))
  {
    if (!v544)
    {
      _OWORD *v542 = *v543;
      long long v588 = *((_OWORD *)__src + 70);
      long long v589 = *((_OWORD *)__src + 71);
      long long v590 = *((_OWORD *)__src + 73);
      *((_OWORD *)__dst + 72) = *((_OWORD *)__src + 72);
      *((_OWORD *)__dst + 73) = v590;
      *((_OWORD *)__dst + 70) = v588;
      *((_OWORD *)__dst + 71) = v589;
      long long v591 = *((_OWORD *)__src + 74);
      long long v592 = *((_OWORD *)__src + 75);
      long long v593 = *((_OWORD *)__src + 77);
      *((_OWORD *)__dst + 76) = *((_OWORD *)__src + 76);
      *((_OWORD *)__dst + 77) = v593;
      *((_OWORD *)__dst + 74) = v591;
      *((_OWORD *)__dst + 75) = v592;
      long long v594 = *((_OWORD *)__src + 78);
      long long v595 = *((_OWORD *)__src + 79);
      long long v596 = *((_OWORD *)__src + 80);
      *((void *)__dst + 162) = *((void *)__src + 162);
      *((_OWORD *)__dst + 79) = v595;
      *((_OWORD *)__dst + 80) = v596;
      *((_OWORD *)__dst + 78) = v594;
      goto LABEL_267;
    }
    if (*((void *)__src + 147))
    {
      uint64_t v563 = *((void *)__src + 138);
      uint64_t v564 = *((void *)__src + 139);
      uint64_t v565 = *((void *)__src + 140);
      uint64_t v566 = *((void *)__src + 141);
      uint64_t v567 = *((void *)__src + 142);
      uint64_t v568 = *((void *)__src + 143);
      uint64_t v569 = *((void *)__src + 144);
      uint64_t v570 = *((void *)__src + 145);
      uint64_t v1677 = *((unsigned __int8 *)v1793 + 844);
      uint64_t v1747 = v1793[210];
      sub_25771CCF8(v563, v564, v565, v566, v567, v568, v569, v570, v1747 | (v1677 << 32));
      *((void *)__dst + 138) = v563;
      *((void *)__dst + 139) = v564;
      *((void *)__dst + 140) = v565;
      *((void *)__dst + 141) = v566;
      *((void *)__dst + 142) = v567;
      *((void *)__dst + 143) = v568;
      *((void *)__dst + 144) = v569;
      *((void *)__dst + 145) = v570;
      *((unsigned char *)v1795 + 844) = v1677;
      v1795[210] = v1747;
      *((void *)__dst + 147) = *((void *)__src + 147);
      *((void *)__dst + 148) = *((void *)__src + 148);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 150)) {
        goto LABEL_222;
      }
    }
    else
    {
      long long v601 = *((_OWORD *)__src + 70);
      _OWORD *v542 = *v543;
      *((_OWORD *)__dst + 70) = v601;
      long long v602 = *((_OWORD *)__src + 71);
      long long v603 = *((_OWORD *)__src + 72);
      long long v604 = *((_OWORD *)__src + 73);
      *((void *)__dst + 148) = *((void *)__src + 148);
      *((_OWORD *)__dst + 72) = v603;
      *((_OWORD *)__dst + 73) = v604;
      *((_OWORD *)__dst + 71) = v602;
      if (*((void *)__src + 150))
      {
LABEL_222:
        *((void *)__dst + 149) = *((void *)__src + 149);
        *((void *)__dst + 150) = *((void *)__src + 150);
        *((void *)__dst + 151) = *((void *)__src + 151);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (*((void *)__src + 153)) {
          goto LABEL_223;
        }
        goto LABEL_233;
      }
    }
    long long v605 = *(_OWORD *)(__src + 1192);
    *((void *)__dst + 151) = *((void *)__src + 151);
    *(_OWORD *)(__dst + 1192) = v605;
    if (*((void *)__src + 153))
    {
LABEL_223:
      __dst[1216] = __src[1216];
      *((void *)__dst + 153) = *((void *)__src + 153);
      *((void *)__dst + 154) = *((void *)__src + 154);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 156)) {
        goto LABEL_224;
      }
      goto LABEL_234;
    }
LABEL_233:
    long long v606 = *((_OWORD *)__src + 76);
    *((void *)__dst + 154) = *((void *)__src + 154);
    *((_OWORD *)__dst + 76) = v606;
    if (*((void *)__src + 156))
    {
LABEL_224:
      __dst[1240] = __src[1240];
      *((void *)__dst + 156) = *((void *)__src + 156);
      *((void *)__dst + 157) = *((void *)__src + 157);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 159))
      {
LABEL_225:
        __dst[1264] = __src[1264];
        *((void *)__dst + 159) = *((void *)__src + 159);
        *((void *)__dst + 160) = *((void *)__src + 160);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_236:
        *((void *)__dst + 161) = *((void *)__src + 161);
        *((void *)__dst + 162) = *((void *)__src + 162);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_267;
      }
LABEL_235:
      long long v608 = *((_OWORD *)__src + 79);
      *((void *)__dst + 160) = *((void *)__src + 160);
      *((_OWORD *)__dst + 79) = v608;
      goto LABEL_236;
    }
LABEL_234:
    long long v607 = *(_OWORD *)(__src + 1240);
    *((void *)__dst + 157) = *((void *)__src + 157);
    *(_OWORD *)(__dst + 1240) = v607;
    if (*((void *)__src + 159)) {
      goto LABEL_225;
    }
    goto LABEL_235;
  }
  if (v544)
  {
    uint64_t v545 = *((void *)__src + 147);
    if (*((void *)__dst + 147))
    {
      if (v545)
      {
        uint64_t v546 = *((void *)__src + 139);
        uint64_t v547 = *((void *)__src + 140);
        uint64_t v548 = *((void *)__src + 141);
        uint64_t v549 = *((void *)__src + 142);
        uint64_t v550 = *((void *)__src + 143);
        uint64_t v551 = *((void *)__src + 144);
        uint64_t v552 = *((void *)__src + 145);
        uint64_t v1676 = *((void *)__src + 138);
        uint64_t v1746 = *((unsigned __int8 *)v1793 + 844);
        uint64_t v553 = v1793[210];
        sub_25771CCF8(v1676, v546, v547, v548, v549, v550, v551, v552, v553 | (v1746 << 32));
        uint64_t v554 = *((void *)__dst + 138);
        uint64_t v555 = *((void *)__dst + 139);
        uint64_t v556 = *((void *)__dst + 140);
        uint64_t v557 = *((void *)__dst + 141);
        uint64_t v558 = *((void *)__dst + 142);
        uint64_t v559 = *((void *)__dst + 143);
        uint64_t v560 = *((void *)__dst + 144);
        uint64_t v561 = *((void *)__dst + 145);
        unint64_t v562 = v1795[210] | ((unint64_t)*((unsigned __int8 *)v1795 + 844) << 32);
        *((void *)__dst + 138) = v1676;
        *((void *)__dst + 139) = v546;
        *((void *)__dst + 140) = v547;
        *((void *)__dst + 141) = v548;
        *((void *)__dst + 142) = v549;
        *((void *)__dst + 143) = v550;
        *((void *)__dst + 144) = v551;
        *((void *)__dst + 145) = v552;
        v1795[210] = v553;
        *((unsigned char *)v1795 + 844) = v1746;
        sub_25771D110(v554, v555, v556, v557, v558, v559, v560, v561, v562);
        *((void *)__dst + 147) = *((void *)__src + 147);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 148) = *((void *)__src + 148);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1104), &qword_26A030F50);
        long long v597 = *((_OWORD *)__src + 70);
        _OWORD *v542 = *v543;
        *((_OWORD *)__dst + 70) = v597;
        long long v599 = *((_OWORD *)__src + 72);
        long long v598 = *((_OWORD *)__src + 73);
        long long v600 = *((_OWORD *)__src + 71);
        *((void *)__dst + 148) = *((void *)__src + 148);
        *((_OWORD *)__dst + 72) = v599;
        *((_OWORD *)__dst + 73) = v598;
        *((_OWORD *)__dst + 71) = v600;
      }
    }
    else if (v545)
    {
      uint64_t v580 = *((void *)__src + 138);
      uint64_t v581 = *((void *)__src + 139);
      uint64_t v582 = *((void *)__src + 140);
      uint64_t v583 = *((void *)__src + 141);
      uint64_t v584 = *((void *)__src + 142);
      uint64_t v585 = *((void *)__src + 143);
      uint64_t v586 = *((void *)__src + 144);
      uint64_t v587 = *((void *)__src + 145);
      uint64_t v1678 = *((unsigned __int8 *)v1793 + 844);
      uint64_t v1748 = v1793[210];
      sub_25771CCF8(v580, v581, v582, v583, v584, v585, v586, v587, v1748 | (v1678 << 32));
      *((void *)__dst + 138) = v580;
      *((void *)__dst + 139) = v581;
      *((void *)__dst + 140) = v582;
      *((void *)__dst + 141) = v583;
      *((void *)__dst + 142) = v584;
      *((void *)__dst + 143) = v585;
      *((void *)__dst + 144) = v586;
      *((void *)__dst + 145) = v587;
      *((unsigned char *)v1795 + 844) = v1678;
      v1795[210] = v1748;
      *((void *)__dst + 147) = *((void *)__src + 147);
      *((void *)__dst + 148) = *((void *)__src + 148);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v609 = *((_OWORD *)__src + 70);
      _OWORD *v542 = *v543;
      *((_OWORD *)__dst + 70) = v609;
      long long v610 = *((_OWORD *)__src + 71);
      long long v611 = *((_OWORD *)__src + 72);
      long long v612 = *((_OWORD *)__src + 73);
      *((void *)__dst + 148) = *((void *)__src + 148);
      *((_OWORD *)__dst + 72) = v611;
      *((_OWORD *)__dst + 73) = v612;
      *((_OWORD *)__dst + 71) = v610;
    }
    v613 = __dst + 1192;
    v614 = __src + 1192;
    uint64_t v615 = *((void *)__src + 150);
    if (*((void *)__dst + 150))
    {
      if (v615)
      {
        *((void *)__dst + 149) = *((void *)__src + 149);
        *((void *)__dst + 150) = *((void *)__src + 150);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 151) = *((void *)__src + 151);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1192), &qword_26A030F58);
        uint64_t v616 = *((void *)__src + 151);
        _OWORD *v613 = *v614;
        *((void *)__dst + 151) = v616;
      }
    }
    else if (v615)
    {
      *((void *)__dst + 149) = *((void *)__src + 149);
      *((void *)__dst + 150) = *((void *)__src + 150);
      *((void *)__dst + 151) = *((void *)__src + 151);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v617 = *v614;
      *((void *)__dst + 151) = *((void *)__src + 151);
      _OWORD *v613 = v617;
    }
    v618 = __dst + 1216;
    v619 = __src + 1216;
    uint64_t v620 = *((void *)__src + 153);
    if (*((void *)__dst + 153))
    {
      if (v620)
      {
        __dst[1216] = __src[1216];
        *((void *)__dst + 153) = *((void *)__src + 153);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 154) = *((void *)__src + 154);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1216), &qword_26A030F60);
        uint64_t v621 = *((void *)__src + 154);
        _OWORD *v618 = *v619;
        *((void *)__dst + 154) = v621;
      }
    }
    else if (v620)
    {
      __dst[1216] = __src[1216];
      *((void *)__dst + 153) = *((void *)__src + 153);
      *((void *)__dst + 154) = *((void *)__src + 154);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v622 = *v619;
      *((void *)__dst + 154) = *((void *)__src + 154);
      _OWORD *v618 = v622;
    }
    v623 = __dst + 1240;
    v624 = __src + 1240;
    uint64_t v625 = *((void *)__src + 156);
    if (*((void *)__dst + 156))
    {
      if (v625)
      {
        __dst[1240] = __src[1240];
        *((void *)__dst + 156) = *((void *)__src + 156);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 157) = *((void *)__src + 157);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1240), &qword_26A030F68);
        uint64_t v626 = *((void *)__src + 157);
        _OWORD *v623 = *v624;
        *((void *)__dst + 157) = v626;
      }
    }
    else if (v625)
    {
      __dst[1240] = __src[1240];
      *((void *)__dst + 156) = *((void *)__src + 156);
      *((void *)__dst + 157) = *((void *)__src + 157);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v627 = *v624;
      *((void *)__dst + 157) = *((void *)__src + 157);
      _OWORD *v623 = v627;
    }
    v628 = __dst + 1264;
    v629 = __src + 1264;
    uint64_t v630 = *((void *)__src + 159);
    if (*((void *)__dst + 159))
    {
      if (v630)
      {
        __dst[1264] = __src[1264];
        *((void *)__dst + 159) = *((void *)__src + 159);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 160) = *((void *)__src + 160);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1264), &qword_26A030F70);
        uint64_t v631 = *((void *)__src + 160);
        _OWORD *v628 = *v629;
        *((void *)__dst + 160) = v631;
      }
    }
    else if (v630)
    {
      __dst[1264] = __src[1264];
      *((void *)__dst + 159) = *((void *)__src + 159);
      *((void *)__dst + 160) = *((void *)__src + 160);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v632 = *v629;
      *((void *)__dst + 160) = *((void *)__src + 160);
      _OWORD *v628 = v632;
    }
    *((void *)__dst + 161) = *((void *)__src + 161);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)__dst + 162) = *((void *)__src + 162);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2577270D4((uint64_t)(__dst + 1104), &qword_26A030F78);
    _OWORD *v542 = *v543;
    long long v571 = *((_OWORD *)__src + 73);
    long long v573 = *((_OWORD *)__src + 70);
    long long v572 = *((_OWORD *)__src + 71);
    *((_OWORD *)__dst + 72) = *((_OWORD *)__src + 72);
    *((_OWORD *)__dst + 73) = v571;
    *((_OWORD *)__dst + 70) = v573;
    *((_OWORD *)__dst + 71) = v572;
    long long v574 = *((_OWORD *)__src + 77);
    long long v576 = *((_OWORD *)__src + 74);
    long long v575 = *((_OWORD *)__src + 75);
    *((_OWORD *)__dst + 76) = *((_OWORD *)__src + 76);
    *((_OWORD *)__dst + 77) = v574;
    *((_OWORD *)__dst + 74) = v576;
    *((_OWORD *)__dst + 75) = v575;
    long long v578 = *((_OWORD *)__src + 79);
    long long v577 = *((_OWORD *)__src + 80);
    long long v579 = *((_OWORD *)__src + 78);
    *((void *)__dst + 162) = *((void *)__src + 162);
    *((_OWORD *)__dst + 79) = v578;
    *((_OWORD *)__dst + 80) = v577;
    *((_OWORD *)__dst + 78) = v579;
  }
LABEL_267:
  v633 = __dst + 1304;
  v634 = __src + 1304;
  uint64_t v635 = *((void *)__src + 186);
  if (!*((void *)__dst + 186))
  {
    if (!v635)
    {
      _OWORD *v633 = *v634;
      long long v679 = *(_OWORD *)(__src + 1320);
      long long v680 = *(_OWORD *)(__src + 1336);
      long long v681 = *(_OWORD *)(__src + 1368);
      *(_OWORD *)(__dst + 1352) = *(_OWORD *)(__src + 1352);
      *(_OWORD *)(__dst + 1368) = v681;
      *(_OWORD *)(__dst + 1320) = v679;
      *(_OWORD *)(__dst + 1336) = v680;
      long long v682 = *(_OWORD *)(__src + 1384);
      long long v683 = *(_OWORD *)(__src + 1400);
      long long v684 = *(_OWORD *)(__src + 1432);
      *(_OWORD *)(__dst + 1416) = *(_OWORD *)(__src + 1416);
      *(_OWORD *)(__dst + 1432) = v684;
      *(_OWORD *)(__dst + 1384) = v682;
      *(_OWORD *)(__dst + 1400) = v683;
      long long v685 = *(_OWORD *)(__src + 1448);
      long long v686 = *(_OWORD *)(__src + 1464);
      long long v687 = *(_OWORD *)(__src + 1480);
      *((void *)__dst + 187) = *((void *)__src + 187);
      *(_OWORD *)(__dst + 1464) = v686;
      *(_OWORD *)(__dst + 1480) = v687;
      *(_OWORD *)(__dst + 1448) = v685;
      goto LABEL_320;
    }
    if (*((void *)__src + 172))
    {
      uint64_t v654 = *((void *)__src + 163);
      uint64_t v655 = *((void *)__src + 164);
      uint64_t v656 = *((void *)__src + 165);
      uint64_t v657 = *((void *)__src + 166);
      uint64_t v658 = *((void *)__src + 167);
      uint64_t v659 = *((void *)__src + 168);
      uint64_t v660 = *((void *)__src + 169);
      uint64_t v661 = *((void *)__src + 170);
      uint64_t v1680 = *((unsigned __int8 *)v1793 + 1044);
      uint64_t v1750 = v1793[260];
      sub_25771CCF8(v654, v655, v656, v657, v658, v659, v660, v661, v1750 | (v1680 << 32));
      *((void *)__dst + 163) = v654;
      *((void *)__dst + 164) = v655;
      *((void *)__dst + 165) = v656;
      *((void *)__dst + 166) = v657;
      *((void *)__dst + 167) = v658;
      *((void *)__dst + 168) = v659;
      *((void *)__dst + 169) = v660;
      *((void *)__dst + 170) = v661;
      *((unsigned char *)v1795 + 1044) = v1680;
      v1795[260] = v1750;
      *((void *)__dst + 172) = *((void *)__src + 172);
      *((void *)__dst + 173) = *((void *)__src + 173);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 175)) {
        goto LABEL_275;
      }
    }
    else
    {
      long long v692 = *(_OWORD *)(__src + 1320);
      _OWORD *v633 = *v634;
      *(_OWORD *)(__dst + 1320) = v692;
      long long v693 = *(_OWORD *)(__src + 1336);
      long long v694 = *(_OWORD *)(__src + 1352);
      long long v695 = *(_OWORD *)(__src + 1368);
      *((void *)__dst + 173) = *((void *)__src + 173);
      *(_OWORD *)(__dst + 1352) = v694;
      *(_OWORD *)(__dst + 1368) = v695;
      *(_OWORD *)(__dst + 1336) = v693;
      if (*((void *)__src + 175))
      {
LABEL_275:
        *((void *)__dst + 174) = *((void *)__src + 174);
        *((void *)__dst + 175) = *((void *)__src + 175);
        *((void *)__dst + 176) = *((void *)__src + 176);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (*((void *)__src + 178)) {
          goto LABEL_276;
        }
        goto LABEL_286;
      }
    }
    long long v696 = *((_OWORD *)__src + 87);
    *((void *)__dst + 176) = *((void *)__src + 176);
    *((_OWORD *)__dst + 87) = v696;
    if (*((void *)__src + 178))
    {
LABEL_276:
      __dst[1416] = __src[1416];
      *((void *)__dst + 178) = *((void *)__src + 178);
      *((void *)__dst + 179) = *((void *)__src + 179);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 181)) {
        goto LABEL_277;
      }
      goto LABEL_287;
    }
LABEL_286:
    long long v697 = *(_OWORD *)(__src + 1416);
    *((void *)__dst + 179) = *((void *)__src + 179);
    *(_OWORD *)(__dst + 1416) = v697;
    if (*((void *)__src + 181))
    {
LABEL_277:
      __dst[1440] = __src[1440];
      *((void *)__dst + 181) = *((void *)__src + 181);
      *((void *)__dst + 182) = *((void *)__src + 182);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 184))
      {
LABEL_278:
        __dst[1464] = __src[1464];
        *((void *)__dst + 184) = *((void *)__src + 184);
        *((void *)__dst + 185) = *((void *)__src + 185);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_289:
        *((void *)__dst + 186) = *((void *)__src + 186);
        *((void *)__dst + 187) = *((void *)__src + 187);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_320;
      }
LABEL_288:
      long long v699 = *(_OWORD *)(__src + 1464);
      *((void *)__dst + 185) = *((void *)__src + 185);
      *(_OWORD *)(__dst + 1464) = v699;
      goto LABEL_289;
    }
LABEL_287:
    long long v698 = *((_OWORD *)__src + 90);
    *((void *)__dst + 182) = *((void *)__src + 182);
    *((_OWORD *)__dst + 90) = v698;
    if (*((void *)__src + 184)) {
      goto LABEL_278;
    }
    goto LABEL_288;
  }
  if (v635)
  {
    uint64_t v636 = *((void *)__src + 172);
    if (*((void *)__dst + 172))
    {
      if (v636)
      {
        uint64_t v637 = *((void *)__src + 164);
        uint64_t v638 = *((void *)__src + 165);
        uint64_t v639 = *((void *)__src + 166);
        uint64_t v640 = *((void *)__src + 167);
        uint64_t v641 = *((void *)__src + 168);
        uint64_t v642 = *((void *)__src + 169);
        uint64_t v643 = *((void *)__src + 170);
        uint64_t v1679 = *((void *)__src + 163);
        uint64_t v1749 = *((unsigned __int8 *)v1793 + 1044);
        uint64_t v644 = v1793[260];
        sub_25771CCF8(v1679, v637, v638, v639, v640, v641, v642, v643, v644 | (v1749 << 32));
        uint64_t v645 = *((void *)__dst + 163);
        uint64_t v646 = *((void *)__dst + 164);
        uint64_t v647 = *((void *)__dst + 165);
        uint64_t v648 = *((void *)__dst + 166);
        uint64_t v649 = *((void *)__dst + 167);
        uint64_t v650 = *((void *)__dst + 168);
        uint64_t v651 = *((void *)__dst + 169);
        uint64_t v652 = *((void *)__dst + 170);
        unint64_t v653 = v1795[260] | ((unint64_t)*((unsigned __int8 *)v1795 + 1044) << 32);
        *((void *)__dst + 163) = v1679;
        *((void *)__dst + 164) = v637;
        *((void *)__dst + 165) = v638;
        *((void *)__dst + 166) = v639;
        *((void *)__dst + 167) = v640;
        *((void *)__dst + 168) = v641;
        *((void *)__dst + 169) = v642;
        *((void *)__dst + 170) = v643;
        v1795[260] = v644;
        *((unsigned char *)v1795 + 1044) = v1749;
        sub_25771D110(v645, v646, v647, v648, v649, v650, v651, v652, v653);
        *((void *)__dst + 172) = *((void *)__src + 172);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 173) = *((void *)__src + 173);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1304), &qword_26A030F50);
        long long v688 = *(_OWORD *)(__src + 1320);
        _OWORD *v633 = *v634;
        *(_OWORD *)(__dst + 1320) = v688;
        long long v690 = *(_OWORD *)(__src + 1352);
        long long v689 = *(_OWORD *)(__src + 1368);
        long long v691 = *(_OWORD *)(__src + 1336);
        *((void *)__dst + 173) = *((void *)__src + 173);
        *(_OWORD *)(__dst + 1352) = v690;
        *(_OWORD *)(__dst + 1368) = v689;
        *(_OWORD *)(__dst + 1336) = v691;
      }
    }
    else if (v636)
    {
      uint64_t v671 = *((void *)__src + 163);
      uint64_t v672 = *((void *)__src + 164);
      uint64_t v673 = *((void *)__src + 165);
      uint64_t v674 = *((void *)__src + 166);
      uint64_t v675 = *((void *)__src + 167);
      uint64_t v676 = *((void *)__src + 168);
      uint64_t v677 = *((void *)__src + 169);
      uint64_t v678 = *((void *)__src + 170);
      uint64_t v1681 = *((unsigned __int8 *)v1793 + 1044);
      uint64_t v1751 = v1793[260];
      sub_25771CCF8(v671, v672, v673, v674, v675, v676, v677, v678, v1751 | (v1681 << 32));
      *((void *)__dst + 163) = v671;
      *((void *)__dst + 164) = v672;
      *((void *)__dst + 165) = v673;
      *((void *)__dst + 166) = v674;
      *((void *)__dst + 167) = v675;
      *((void *)__dst + 168) = v676;
      *((void *)__dst + 169) = v677;
      *((void *)__dst + 170) = v678;
      *((unsigned char *)v1795 + 1044) = v1681;
      v1795[260] = v1751;
      *((void *)__dst + 172) = *((void *)__src + 172);
      *((void *)__dst + 173) = *((void *)__src + 173);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v700 = *(_OWORD *)(__src + 1320);
      _OWORD *v633 = *v634;
      *(_OWORD *)(__dst + 1320) = v700;
      long long v701 = *(_OWORD *)(__src + 1336);
      long long v702 = *(_OWORD *)(__src + 1352);
      long long v703 = *(_OWORD *)(__src + 1368);
      *((void *)__dst + 173) = *((void *)__src + 173);
      *(_OWORD *)(__dst + 1352) = v702;
      *(_OWORD *)(__dst + 1368) = v703;
      *(_OWORD *)(__dst + 1336) = v701;
    }
    v704 = __dst + 1392;
    v705 = __src + 1392;
    uint64_t v706 = *((void *)__src + 175);
    if (*((void *)__dst + 175))
    {
      if (v706)
      {
        *((void *)__dst + 174) = *((void *)__src + 174);
        *((void *)__dst + 175) = *((void *)__src + 175);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 176) = *((void *)__src + 176);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1392), &qword_26A030F58);
        uint64_t v707 = *((void *)__src + 176);
        _OWORD *v704 = *v705;
        *((void *)__dst + 176) = v707;
      }
    }
    else if (v706)
    {
      *((void *)__dst + 174) = *((void *)__src + 174);
      *((void *)__dst + 175) = *((void *)__src + 175);
      *((void *)__dst + 176) = *((void *)__src + 176);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v708 = *v705;
      *((void *)__dst + 176) = *((void *)__src + 176);
      _OWORD *v704 = v708;
    }
    v709 = __dst + 1416;
    v710 = __src + 1416;
    uint64_t v711 = *((void *)__src + 178);
    if (*((void *)__dst + 178))
    {
      if (v711)
      {
        __dst[1416] = __src[1416];
        *((void *)__dst + 178) = *((void *)__src + 178);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 179) = *((void *)__src + 179);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1416), &qword_26A030F60);
        uint64_t v712 = *((void *)__src + 179);
        _OWORD *v709 = *v710;
        *((void *)__dst + 179) = v712;
      }
    }
    else if (v711)
    {
      __dst[1416] = __src[1416];
      *((void *)__dst + 178) = *((void *)__src + 178);
      *((void *)__dst + 179) = *((void *)__src + 179);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v713 = *v710;
      *((void *)__dst + 179) = *((void *)__src + 179);
      _OWORD *v709 = v713;
    }
    v714 = __dst + 1440;
    v715 = __src + 1440;
    uint64_t v716 = *((void *)__src + 181);
    if (*((void *)__dst + 181))
    {
      if (v716)
      {
        __dst[1440] = __src[1440];
        *((void *)__dst + 181) = *((void *)__src + 181);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 182) = *((void *)__src + 182);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1440), &qword_26A030F68);
        uint64_t v717 = *((void *)__src + 182);
        _OWORD *v714 = *v715;
        *((void *)__dst + 182) = v717;
      }
    }
    else if (v716)
    {
      __dst[1440] = __src[1440];
      *((void *)__dst + 181) = *((void *)__src + 181);
      *((void *)__dst + 182) = *((void *)__src + 182);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v718 = *v715;
      *((void *)__dst + 182) = *((void *)__src + 182);
      _OWORD *v714 = v718;
    }
    v719 = __dst + 1464;
    v720 = __src + 1464;
    uint64_t v721 = *((void *)__src + 184);
    if (*((void *)__dst + 184))
    {
      if (v721)
      {
        __dst[1464] = __src[1464];
        *((void *)__dst + 184) = *((void *)__src + 184);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 185) = *((void *)__src + 185);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1464), &qword_26A030F70);
        uint64_t v722 = *((void *)__src + 185);
        _OWORD *v719 = *v720;
        *((void *)__dst + 185) = v722;
      }
    }
    else if (v721)
    {
      __dst[1464] = __src[1464];
      *((void *)__dst + 184) = *((void *)__src + 184);
      *((void *)__dst + 185) = *((void *)__src + 185);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v723 = *v720;
      *((void *)__dst + 185) = *((void *)__src + 185);
      _OWORD *v719 = v723;
    }
    *((void *)__dst + 186) = *((void *)__src + 186);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)__dst + 187) = *((void *)__src + 187);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2577270D4((uint64_t)(__dst + 1304), &qword_26A030F78);
    _OWORD *v633 = *v634;
    long long v662 = *(_OWORD *)(__src + 1368);
    long long v664 = *(_OWORD *)(__src + 1320);
    long long v663 = *(_OWORD *)(__src + 1336);
    *(_OWORD *)(__dst + 1352) = *(_OWORD *)(__src + 1352);
    *(_OWORD *)(__dst + 1368) = v662;
    *(_OWORD *)(__dst + 1320) = v664;
    *(_OWORD *)(__dst + 1336) = v663;
    long long v665 = *(_OWORD *)(__src + 1432);
    long long v667 = *(_OWORD *)(__src + 1384);
    long long v666 = *(_OWORD *)(__src + 1400);
    *(_OWORD *)(__dst + 1416) = *(_OWORD *)(__src + 1416);
    *(_OWORD *)(__dst + 1432) = v665;
    *(_OWORD *)(__dst + 1384) = v667;
    *(_OWORD *)(__dst + 1400) = v666;
    long long v669 = *(_OWORD *)(__src + 1464);
    long long v668 = *(_OWORD *)(__src + 1480);
    long long v670 = *(_OWORD *)(__src + 1448);
    *((void *)__dst + 187) = *((void *)__src + 187);
    *(_OWORD *)(__dst + 1464) = v669;
    *(_OWORD *)(__dst + 1480) = v668;
    *(_OWORD *)(__dst + 1448) = v670;
  }
LABEL_320:
  v724 = __dst + 1504;
  v725 = __src + 1504;
  uint64_t v726 = *((void *)__src + 211);
  if (!*((void *)__dst + 211))
  {
    if (!v726)
    {
      _OWORD *v724 = *v725;
      long long v770 = *((_OWORD *)__src + 95);
      long long v771 = *((_OWORD *)__src + 96);
      long long v772 = *((_OWORD *)__src + 98);
      *((_OWORD *)__dst + 97) = *((_OWORD *)__src + 97);
      *((_OWORD *)__dst + 98) = v772;
      *((_OWORD *)__dst + 95) = v770;
      *((_OWORD *)__dst + 96) = v771;
      long long v773 = *((_OWORD *)__src + 99);
      long long v774 = *((_OWORD *)__src + 100);
      long long v775 = *((_OWORD *)__src + 102);
      *((_OWORD *)__dst + 101) = *((_OWORD *)__src + 101);
      *((_OWORD *)__dst + 102) = v775;
      *((_OWORD *)__dst + 99) = v773;
      *((_OWORD *)__dst + 100) = v774;
      long long v776 = *((_OWORD *)__src + 103);
      long long v777 = *((_OWORD *)__src + 104);
      long long v778 = *((_OWORD *)__src + 105);
      *((void *)__dst + 212) = *((void *)__src + 212);
      *((_OWORD *)__dst + 104) = v777;
      *((_OWORD *)__dst + 105) = v778;
      *((_OWORD *)__dst + 103) = v776;
      goto LABEL_373;
    }
    if (*((void *)__src + 197))
    {
      uint64_t v745 = *((void *)__src + 188);
      uint64_t v746 = *((void *)__src + 189);
      uint64_t v747 = *((void *)__src + 190);
      uint64_t v748 = *((void *)__src + 191);
      uint64_t v749 = *((void *)__src + 192);
      uint64_t v750 = *((void *)__src + 193);
      uint64_t v751 = *((void *)__src + 194);
      uint64_t v752 = *((void *)__src + 195);
      uint64_t v1683 = *((unsigned __int8 *)v1793 + 1244);
      uint64_t v1753 = v1793[310];
      sub_25771CCF8(v745, v746, v747, v748, v749, v750, v751, v752, v1753 | (v1683 << 32));
      *((void *)__dst + 188) = v745;
      *((void *)__dst + 189) = v746;
      *((void *)__dst + 190) = v747;
      *((void *)__dst + 191) = v748;
      *((void *)__dst + 192) = v749;
      *((void *)__dst + 193) = v750;
      *((void *)__dst + 194) = v751;
      *((void *)__dst + 195) = v752;
      *((unsigned char *)v1795 + 1244) = v1683;
      v1795[310] = v1753;
      *((void *)__dst + 197) = *((void *)__src + 197);
      *((void *)__dst + 198) = *((void *)__src + 198);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 200)) {
        goto LABEL_328;
      }
    }
    else
    {
      long long v783 = *((_OWORD *)__src + 95);
      _OWORD *v724 = *v725;
      *((_OWORD *)__dst + 95) = v783;
      long long v784 = *((_OWORD *)__src + 96);
      long long v785 = *((_OWORD *)__src + 97);
      long long v786 = *((_OWORD *)__src + 98);
      *((void *)__dst + 198) = *((void *)__src + 198);
      *((_OWORD *)__dst + 97) = v785;
      *((_OWORD *)__dst + 98) = v786;
      *((_OWORD *)__dst + 96) = v784;
      if (*((void *)__src + 200))
      {
LABEL_328:
        *((void *)__dst + 199) = *((void *)__src + 199);
        *((void *)__dst + 200) = *((void *)__src + 200);
        *((void *)__dst + 201) = *((void *)__src + 201);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (*((void *)__src + 203)) {
          goto LABEL_329;
        }
        goto LABEL_339;
      }
    }
    long long v787 = *(_OWORD *)(__src + 1592);
    *((void *)__dst + 201) = *((void *)__src + 201);
    *(_OWORD *)(__dst + 1592) = v787;
    if (*((void *)__src + 203))
    {
LABEL_329:
      __dst[1616] = __src[1616];
      *((void *)__dst + 203) = *((void *)__src + 203);
      *((void *)__dst + 204) = *((void *)__src + 204);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 206)) {
        goto LABEL_330;
      }
      goto LABEL_340;
    }
LABEL_339:
    long long v788 = *((_OWORD *)__src + 101);
    *((void *)__dst + 204) = *((void *)__src + 204);
    *((_OWORD *)__dst + 101) = v788;
    if (*((void *)__src + 206))
    {
LABEL_330:
      __dst[1640] = __src[1640];
      *((void *)__dst + 206) = *((void *)__src + 206);
      *((void *)__dst + 207) = *((void *)__src + 207);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 209))
      {
LABEL_331:
        __dst[1664] = __src[1664];
        *((void *)__dst + 209) = *((void *)__src + 209);
        *((void *)__dst + 210) = *((void *)__src + 210);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_342:
        *((void *)__dst + 211) = *((void *)__src + 211);
        *((void *)__dst + 212) = *((void *)__src + 212);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_373;
      }
LABEL_341:
      long long v790 = *((_OWORD *)__src + 104);
      *((void *)__dst + 210) = *((void *)__src + 210);
      *((_OWORD *)__dst + 104) = v790;
      goto LABEL_342;
    }
LABEL_340:
    long long v789 = *(_OWORD *)(__src + 1640);
    *((void *)__dst + 207) = *((void *)__src + 207);
    *(_OWORD *)(__dst + 1640) = v789;
    if (*((void *)__src + 209)) {
      goto LABEL_331;
    }
    goto LABEL_341;
  }
  if (v726)
  {
    uint64_t v727 = *((void *)__src + 197);
    if (*((void *)__dst + 197))
    {
      if (v727)
      {
        uint64_t v728 = *((void *)__src + 189);
        uint64_t v729 = *((void *)__src + 190);
        uint64_t v730 = *((void *)__src + 191);
        uint64_t v731 = *((void *)__src + 192);
        uint64_t v732 = *((void *)__src + 193);
        uint64_t v733 = *((void *)__src + 194);
        uint64_t v734 = *((void *)__src + 195);
        uint64_t v1682 = *((void *)__src + 188);
        uint64_t v1752 = *((unsigned __int8 *)v1793 + 1244);
        uint64_t v735 = v1793[310];
        sub_25771CCF8(v1682, v728, v729, v730, v731, v732, v733, v734, v735 | (v1752 << 32));
        uint64_t v736 = *((void *)__dst + 188);
        uint64_t v737 = *((void *)__dst + 189);
        uint64_t v738 = *((void *)__dst + 190);
        uint64_t v739 = *((void *)__dst + 191);
        uint64_t v740 = *((void *)__dst + 192);
        uint64_t v741 = *((void *)__dst + 193);
        uint64_t v742 = *((void *)__dst + 194);
        uint64_t v743 = *((void *)__dst + 195);
        unint64_t v744 = v1795[310] | ((unint64_t)*((unsigned __int8 *)v1795 + 1244) << 32);
        *((void *)__dst + 188) = v1682;
        *((void *)__dst + 189) = v728;
        *((void *)__dst + 190) = v729;
        *((void *)__dst + 191) = v730;
        *((void *)__dst + 192) = v731;
        *((void *)__dst + 193) = v732;
        *((void *)__dst + 194) = v733;
        *((void *)__dst + 195) = v734;
        v1795[310] = v735;
        *((unsigned char *)v1795 + 1244) = v1752;
        sub_25771D110(v736, v737, v738, v739, v740, v741, v742, v743, v744);
        *((void *)__dst + 197) = *((void *)__src + 197);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 198) = *((void *)__src + 198);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1504), &qword_26A030F50);
        long long v779 = *((_OWORD *)__src + 95);
        _OWORD *v724 = *v725;
        *((_OWORD *)__dst + 95) = v779;
        long long v781 = *((_OWORD *)__src + 97);
        long long v780 = *((_OWORD *)__src + 98);
        long long v782 = *((_OWORD *)__src + 96);
        *((void *)__dst + 198) = *((void *)__src + 198);
        *((_OWORD *)__dst + 97) = v781;
        *((_OWORD *)__dst + 98) = v780;
        *((_OWORD *)__dst + 96) = v782;
      }
    }
    else if (v727)
    {
      uint64_t v762 = *((void *)__src + 188);
      uint64_t v763 = *((void *)__src + 189);
      uint64_t v764 = *((void *)__src + 190);
      uint64_t v765 = *((void *)__src + 191);
      uint64_t v766 = *((void *)__src + 192);
      uint64_t v767 = *((void *)__src + 193);
      uint64_t v768 = *((void *)__src + 194);
      uint64_t v769 = *((void *)__src + 195);
      uint64_t v1684 = *((unsigned __int8 *)v1793 + 1244);
      uint64_t v1754 = v1793[310];
      sub_25771CCF8(v762, v763, v764, v765, v766, v767, v768, v769, v1754 | (v1684 << 32));
      *((void *)__dst + 188) = v762;
      *((void *)__dst + 189) = v763;
      *((void *)__dst + 190) = v764;
      *((void *)__dst + 191) = v765;
      *((void *)__dst + 192) = v766;
      *((void *)__dst + 193) = v767;
      *((void *)__dst + 194) = v768;
      *((void *)__dst + 195) = v769;
      *((unsigned char *)v1795 + 1244) = v1684;
      v1795[310] = v1754;
      *((void *)__dst + 197) = *((void *)__src + 197);
      *((void *)__dst + 198) = *((void *)__src + 198);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v791 = *((_OWORD *)__src + 95);
      _OWORD *v724 = *v725;
      *((_OWORD *)__dst + 95) = v791;
      long long v792 = *((_OWORD *)__src + 96);
      long long v793 = *((_OWORD *)__src + 97);
      long long v794 = *((_OWORD *)__src + 98);
      *((void *)__dst + 198) = *((void *)__src + 198);
      *((_OWORD *)__dst + 97) = v793;
      *((_OWORD *)__dst + 98) = v794;
      *((_OWORD *)__dst + 96) = v792;
    }
    v795 = __dst + 1592;
    v796 = __src + 1592;
    uint64_t v797 = *((void *)__src + 200);
    if (*((void *)__dst + 200))
    {
      if (v797)
      {
        *((void *)__dst + 199) = *((void *)__src + 199);
        *((void *)__dst + 200) = *((void *)__src + 200);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 201) = *((void *)__src + 201);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1592), &qword_26A030F58);
        uint64_t v798 = *((void *)__src + 201);
        _OWORD *v795 = *v796;
        *((void *)__dst + 201) = v798;
      }
    }
    else if (v797)
    {
      *((void *)__dst + 199) = *((void *)__src + 199);
      *((void *)__dst + 200) = *((void *)__src + 200);
      *((void *)__dst + 201) = *((void *)__src + 201);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v799 = *v796;
      *((void *)__dst + 201) = *((void *)__src + 201);
      _OWORD *v795 = v799;
    }
    v800 = __dst + 1616;
    v801 = __src + 1616;
    uint64_t v802 = *((void *)__src + 203);
    if (*((void *)__dst + 203))
    {
      if (v802)
      {
        __dst[1616] = __src[1616];
        *((void *)__dst + 203) = *((void *)__src + 203);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 204) = *((void *)__src + 204);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1616), &qword_26A030F60);
        uint64_t v803 = *((void *)__src + 204);
        _OWORD *v800 = *v801;
        *((void *)__dst + 204) = v803;
      }
    }
    else if (v802)
    {
      __dst[1616] = __src[1616];
      *((void *)__dst + 203) = *((void *)__src + 203);
      *((void *)__dst + 204) = *((void *)__src + 204);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v804 = *v801;
      *((void *)__dst + 204) = *((void *)__src + 204);
      _OWORD *v800 = v804;
    }
    v805 = __dst + 1640;
    v806 = __src + 1640;
    uint64_t v807 = *((void *)__src + 206);
    if (*((void *)__dst + 206))
    {
      if (v807)
      {
        __dst[1640] = __src[1640];
        *((void *)__dst + 206) = *((void *)__src + 206);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 207) = *((void *)__src + 207);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1640), &qword_26A030F68);
        uint64_t v808 = *((void *)__src + 207);
        _OWORD *v805 = *v806;
        *((void *)__dst + 207) = v808;
      }
    }
    else if (v807)
    {
      __dst[1640] = __src[1640];
      *((void *)__dst + 206) = *((void *)__src + 206);
      *((void *)__dst + 207) = *((void *)__src + 207);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v809 = *v806;
      *((void *)__dst + 207) = *((void *)__src + 207);
      _OWORD *v805 = v809;
    }
    v810 = __dst + 1664;
    v811 = __src + 1664;
    uint64_t v812 = *((void *)__src + 209);
    if (*((void *)__dst + 209))
    {
      if (v812)
      {
        __dst[1664] = __src[1664];
        *((void *)__dst + 209) = *((void *)__src + 209);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 210) = *((void *)__src + 210);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 1664), &qword_26A030F70);
        uint64_t v813 = *((void *)__src + 210);
        _OWORD *v810 = *v811;
        *((void *)__dst + 210) = v813;
      }
    }
    else if (v812)
    {
      __dst[1664] = __src[1664];
      *((void *)__dst + 209) = *((void *)__src + 209);
      *((void *)__dst + 210) = *((void *)__src + 210);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v814 = *v811;
      *((void *)__dst + 210) = *((void *)__src + 210);
      _OWORD *v810 = v814;
    }
    *((void *)__dst + 211) = *((void *)__src + 211);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)__dst + 212) = *((void *)__src + 212);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2577270D4((uint64_t)(__dst + 1504), &qword_26A030F78);
    _OWORD *v724 = *v725;
    long long v753 = *((_OWORD *)__src + 98);
    long long v755 = *((_OWORD *)__src + 95);
    long long v754 = *((_OWORD *)__src + 96);
    *((_OWORD *)__dst + 97) = *((_OWORD *)__src + 97);
    *((_OWORD *)__dst + 98) = v753;
    *((_OWORD *)__dst + 95) = v755;
    *((_OWORD *)__dst + 96) = v754;
    long long v756 = *((_OWORD *)__src + 102);
    long long v758 = *((_OWORD *)__src + 99);
    long long v757 = *((_OWORD *)__src + 100);
    *((_OWORD *)__dst + 101) = *((_OWORD *)__src + 101);
    *((_OWORD *)__dst + 102) = v756;
    *((_OWORD *)__dst + 99) = v758;
    *((_OWORD *)__dst + 100) = v757;
    long long v760 = *((_OWORD *)__src + 104);
    long long v759 = *((_OWORD *)__src + 105);
    long long v761 = *((_OWORD *)__src + 103);
    *((void *)__dst + 212) = *((void *)__src + 212);
    *((_OWORD *)__dst + 104) = v760;
    *((_OWORD *)__dst + 105) = v759;
    *((_OWORD *)__dst + 103) = v761;
  }
LABEL_373:
  v815 = __dst + 1704;
  v816 = __src + 1704;
  uint64_t v817 = *((void *)__dst + 222);
  uint64_t v818 = *((void *)__src + 222);
  if (v817 == 3)
  {
    switch(v818)
    {
      case 0:
        long long v819 = *(_OWORD *)(__src + 1720);
        _OWORD *v815 = *v816;
        *(_OWORD *)(__dst + 1720) = v819;
        long long v820 = *(_OWORD *)(__src + 1736);
        long long v821 = *(_OWORD *)(__src + 1752);
        long long v822 = *(_OWORD *)(__src + 1768);
        *((void *)__dst + 223) = *((void *)__src + 223);
        *(_OWORD *)(__dst + 1752) = v821;
        *(_OWORD *)(__dst + 1768) = v822;
        *(_OWORD *)(__dst + 1736) = v820;
        if (*((void *)__src + 233)) {
          goto LABEL_376;
        }
        goto LABEL_390;
      case 1:
        long long v862 = *v816;
        long long v863 = *(_OWORD *)(__src + 1736);
        *(_OWORD *)(__dst + 1720) = *(_OWORD *)(__src + 1720);
        *(_OWORD *)(__dst + 1736) = v863;
        _OWORD *v815 = v862;
        long long v864 = *(_OWORD *)(__src + 1752);
        long long v865 = *(_OWORD *)(__src + 1768);
        long long v866 = *(_OWORD *)(__src + 1800);
        *(_OWORD *)(__dst + 1784) = *(_OWORD *)(__src + 1784);
        *(_OWORD *)(__dst + 1800) = v866;
        *(_OWORD *)(__dst + 1752) = v864;
        *(_OWORD *)(__dst + 1768) = v865;
        long long v867 = *(_OWORD *)(__src + 1816);
        long long v868 = *(_OWORD *)(__src + 1832);
        long long v869 = *(_OWORD *)(__src + 1864);
        *(_OWORD *)(__dst + 1848) = *(_OWORD *)(__src + 1848);
        *(_OWORD *)(__dst + 1864) = v869;
        *(_OWORD *)(__dst + 1816) = v867;
        *(_OWORD *)(__dst + 1832) = v868;
        goto LABEL_392;
      case 2:
        memcpy(__dst + 1704, __src + 1704, 0x160uLL);
        goto LABEL_400;
      case 3:
        goto LABEL_379;
      default:
        uint64_t v850 = *((void *)__src + 213);
        uint64_t v851 = *((void *)__src + 214);
        uint64_t v852 = *((void *)__src + 215);
        uint64_t v853 = *((void *)__src + 216);
        uint64_t v854 = *((void *)__src + 217);
        uint64_t v855 = *((void *)__src + 218);
        uint64_t v856 = *((void *)__src + 219);
        uint64_t v857 = *((void *)__src + 220);
        uint64_t v1688 = *((unsigned __int8 *)v1793 + 1444);
        uint64_t v1758 = v1793[360];
        sub_25771CCF8(v850, v851, v852, v853, v854, v855, v856, v857, v1758 | (v1688 << 32));
        *((void *)__dst + 213) = v850;
        *((void *)__dst + 214) = v851;
        *((void *)__dst + 215) = v852;
        *((void *)__dst + 216) = v853;
        *((void *)__dst + 217) = v854;
        *((void *)__dst + 218) = v855;
        *((void *)__dst + 219) = v856;
        *((void *)__dst + 220) = v857;
        *((unsigned char *)v1795 + 1444) = v1688;
        v1795[360] = v1758;
        *((void *)__dst + 222) = *((void *)__src + 222);
        *((void *)__dst + 223) = *((void *)__src + 223);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (*((void *)__src + 233))
        {
LABEL_376:
          uint64_t v823 = *((void *)__src + 224);
          uint64_t v824 = *((void *)__src + 225);
          uint64_t v825 = *((void *)__src + 226);
          uint64_t v826 = *((void *)__src + 227);
          uint64_t v827 = *((void *)__src + 228);
          uint64_t v828 = *((void *)__src + 229);
          uint64_t v829 = *((void *)__src + 230);
          uint64_t v830 = *((void *)__src + 231);
          uint64_t v1685 = *((unsigned __int8 *)v1793 + 1532);
          uint64_t v1755 = v1793[382];
          sub_25771CCF8(v823, v824, v825, v826, v827, v828, v829, v830, v1755 | (v1685 << 32));
          *((void *)__dst + 224) = v823;
          *((void *)__dst + 225) = v824;
          *((void *)__dst + 226) = v825;
          *((void *)__dst + 227) = v826;
          *((void *)__dst + 228) = v827;
          *((void *)__dst + 229) = v828;
          *((void *)__dst + 230) = v829;
          *((void *)__dst + 231) = v830;
          *((unsigned char *)v1795 + 1532) = v1685;
          v1795[382] = v1755;
          *((void *)__dst + 233) = *((void *)__src + 233);
          *((void *)__dst + 234) = *((void *)__src + 234);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
LABEL_390:
          long long v858 = *((_OWORD *)__src + 113);
          *((_OWORD *)__dst + 112) = *((_OWORD *)__src + 112);
          *((_OWORD *)__dst + 113) = v858;
          long long v859 = *((_OWORD *)__src + 114);
          long long v860 = *((_OWORD *)__src + 115);
          long long v861 = *((_OWORD *)__src + 116);
          *((void *)__dst + 234) = *((void *)__src + 234);
          *((_OWORD *)__dst + 115) = v860;
          *((_OWORD *)__dst + 116) = v861;
          *((_OWORD *)__dst + 114) = v859;
        }
LABEL_392:
        v870 = (long long *)(__dst + 1880);
        v871 = (long long *)(__src + 1880);
        uint64_t v872 = *((void *)__src + 244);
        if (v872)
        {
          if (v872 == 1)
          {
            long long v873 = *v871;
            long long v874 = *(_OWORD *)(__src + 1912);
            *(_OWORD *)(__dst + 1896) = *(_OWORD *)(__src + 1896);
            *(_OWORD *)(__dst + 1912) = v874;
            long long *v870 = v873;
            long long v875 = *(_OWORD *)(__src + 1928);
            long long v876 = *(_OWORD *)(__src + 1944);
            long long v877 = *(_OWORD *)(__src + 1976);
            *(_OWORD *)(__dst + 1960) = *(_OWORD *)(__src + 1960);
            *(_OWORD *)(__dst + 1976) = v877;
            *(_OWORD *)(__dst + 1928) = v875;
            *(_OWORD *)(__dst + 1944) = v876;
            long long v878 = *(_OWORD *)(__src + 1992);
            long long v879 = *(_OWORD *)(__src + 2008);
            long long v880 = *(_OWORD *)(__src + 2040);
            *(_OWORD *)(__dst + 2024) = *(_OWORD *)(__src + 2024);
            *(_OWORD *)(__dst + 2040) = v880;
            *(_OWORD *)(__dst + 1992) = v878;
            *(_OWORD *)(__dst + 2008) = v879;
            goto LABEL_400;
          }
          uint64_t v893 = *((void *)__src + 235);
          uint64_t v894 = *((void *)__src + 236);
          uint64_t v895 = *((void *)__src + 237);
          uint64_t v896 = *((void *)__src + 238);
          uint64_t v897 = *((void *)__src + 239);
          uint64_t v898 = *((void *)__src + 240);
          uint64_t v899 = *((void *)__src + 241);
          uint64_t v900 = *((void *)__src + 242);
          uint64_t v1690 = *((unsigned __int8 *)v1793 + 1620);
          uint64_t v1760 = v1793[404];
          sub_25771CCF8(v893, v894, v895, v896, v897, v898, v899, v900, v1760 | (v1690 << 32));
          *((void *)__dst + 235) = v893;
          *((void *)__dst + 236) = v894;
          *((void *)__dst + 237) = v895;
          *((void *)__dst + 238) = v896;
          *((void *)__dst + 239) = v897;
          *((void *)__dst + 240) = v898;
          *((void *)__dst + 241) = v899;
          *((void *)__dst + 242) = v900;
          *((unsigned char *)v1795 + 1620) = v1690;
          v1795[404] = v1760;
          *((void *)__dst + 244) = *((void *)__src + 244);
          *((void *)__dst + 245) = *((void *)__src + 245);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (!*((void *)__src + 255))
          {
LABEL_399:
            long long v901 = *((_OWORD *)__src + 124);
            *((_OWORD *)__dst + 123) = *((_OWORD *)__src + 123);
            *((_OWORD *)__dst + 124) = v901;
            long long v902 = *((_OWORD *)__src + 125);
            long long v903 = *((_OWORD *)__src + 126);
            long long v904 = *((_OWORD *)__src + 127);
            *((void *)__dst + 256) = *((void *)__src + 256);
            *((_OWORD *)__dst + 126) = v903;
            *((_OWORD *)__dst + 127) = v904;
            *((_OWORD *)__dst + 125) = v902;
LABEL_400:
            v831 = __dst + 2056;
            v832 = __src + 2056;
            uint64_t v905 = *((void *)__src + 266);
            switch(v905)
            {
              case 0:
                long long v906 = *(_OWORD *)(__src + 2072);
                *(_OWORD *)v831 = *(_OWORD *)v832;
                *(_OWORD *)(__dst + 2072) = v906;
                long long v907 = *(_OWORD *)(__src + 2088);
                long long v908 = *(_OWORD *)(__src + 2104);
                long long v909 = *(_OWORD *)(__src + 2120);
                *((void *)__dst + 267) = *((void *)__src + 267);
                *(_OWORD *)(__dst + 2104) = v908;
                *(_OWORD *)(__dst + 2120) = v909;
                *(_OWORD *)(__dst + 2088) = v907;
                if (*((void *)__src + 277))
                {
LABEL_519:
                  uint64_t v1396 = *((void *)__src + 268);
                  uint64_t v1397 = *((void *)__src + 269);
                  uint64_t v1398 = *((void *)__src + 270);
                  uint64_t v1399 = *((void *)__src + 271);
                  uint64_t v1400 = *((void *)__src + 272);
                  uint64_t v1401 = *((void *)__src + 273);
                  uint64_t v1402 = *((void *)__src + 274);
                  uint64_t v1403 = *((void *)__src + 275);
                  uint64_t v1712 = *((unsigned __int8 *)v1793 + 1884);
                  uint64_t v1782 = v1793[470];
                  sub_25771CCF8(v1396, v1397, v1398, v1399, v1400, v1401, v1402, v1403, v1782 | (v1712 << 32));
                  *((void *)__dst + 268) = v1396;
                  *((void *)__dst + 269) = v1397;
                  *((void *)__dst + 270) = v1398;
                  *((void *)__dst + 271) = v1399;
                  *((void *)__dst + 272) = v1400;
                  *((void *)__dst + 273) = v1401;
                  *((void *)__dst + 274) = v1402;
                  *((void *)__dst + 275) = v1403;
                  *((unsigned char *)v1795 + 1884) = v1712;
                  v1795[470] = v1782;
                  *((void *)__dst + 277) = *((void *)__src + 277);
                  *((void *)__dst + 278) = *((void *)__src + 278);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  goto LABEL_532;
                }
LABEL_530:
                long long v1416 = *((_OWORD *)__src + 135);
                *((_OWORD *)__dst + 134) = *((_OWORD *)__src + 134);
                *((_OWORD *)__dst + 135) = v1416;
                long long v1417 = *((_OWORD *)__src + 136);
                long long v1418 = *((_OWORD *)__src + 137);
                long long v1419 = *((_OWORD *)__src + 138);
                *((void *)__dst + 278) = *((void *)__src + 278);
                *((_OWORD *)__dst + 137) = v1418;
                *((_OWORD *)__dst + 138) = v1419;
                *((_OWORD *)__dst + 136) = v1417;
                goto LABEL_532;
              case 1:
                long long v910 = *(_OWORD *)v832;
                long long v911 = *(_OWORD *)(__src + 2088);
                *(_OWORD *)(__dst + 2072) = *(_OWORD *)(__src + 2072);
                *(_OWORD *)(__dst + 2088) = v911;
                *(_OWORD *)v831 = v910;
                long long v912 = *(_OWORD *)(__src + 2104);
                long long v913 = *(_OWORD *)(__src + 2120);
                long long v914 = *(_OWORD *)(__src + 2152);
                *(_OWORD *)(__dst + 2136) = *(_OWORD *)(__src + 2136);
                *(_OWORD *)(__dst + 2152) = v914;
                *(_OWORD *)(__dst + 2104) = v912;
                *(_OWORD *)(__dst + 2120) = v913;
                long long v915 = *(_OWORD *)(__src + 2168);
                long long v916 = *(_OWORD *)(__src + 2184);
                long long v917 = *(_OWORD *)(__src + 2216);
                *(_OWORD *)(__dst + 2200) = *(_OWORD *)(__src + 2200);
                *(_OWORD *)(__dst + 2216) = v917;
                *(_OWORD *)(__dst + 2168) = v915;
                *(_OWORD *)(__dst + 2184) = v916;
LABEL_532:
                v1428 = __dst + 2232;
                v1429 = __src + 2232;
                uint64_t v1430 = *((void *)__src + 288);
                if (!v1430)
                {
                  long long v1439 = *(_OWORD *)(__src + 2248);
                  _OWORD *v1428 = *v1429;
                  *(_OWORD *)(__dst + 2248) = v1439;
                  long long v1440 = *(_OWORD *)(__src + 2264);
                  long long v1441 = *(_OWORD *)(__src + 2280);
                  long long v1442 = *(_OWORD *)(__src + 2296);
                  *((void *)__dst + 289) = *((void *)__src + 289);
                  *(_OWORD *)(__dst + 2280) = v1441;
                  *(_OWORD *)(__dst + 2296) = v1442;
                  *(_OWORD *)(__dst + 2264) = v1440;
                  if (*((void *)__src + 299))
                  {
LABEL_562:
                    uint64_t v1556 = *((void *)__src + 290);
                    uint64_t v1557 = *((void *)__src + 291);
                    uint64_t v1558 = *((void *)__src + 292);
                    uint64_t v1559 = *((void *)__src + 293);
                    uint64_t v1560 = *((void *)__src + 294);
                    uint64_t v1561 = *((void *)__src + 295);
                    uint64_t v1562 = *((void *)__src + 296);
                    uint64_t v1563 = *((void *)__src + 297);
                    uint64_t v1789 = *((unsigned __int8 *)v1793 + 2060);
                    uint64_t v1794 = v1793[514];
                    sub_25771CCF8(v1556, v1557, v1558, v1559, v1560, v1561, v1562, v1563, v1794 | (v1789 << 32));
                    *((void *)__dst + 290) = v1556;
                    *((void *)__dst + 291) = v1557;
                    *((void *)__dst + 292) = v1558;
                    *((void *)__dst + 293) = v1559;
                    *((void *)__dst + 294) = v1560;
                    *((void *)__dst + 295) = v1561;
                    *((void *)__dst + 296) = v1562;
                    *((void *)__dst + 297) = v1563;
                    *((unsigned char *)v1795 + 2060) = v1789;
                    v1795[514] = v1794;
                    *((void *)__dst + 299) = *((void *)__src + 299);
                    *((void *)__dst + 300) = *((void *)__src + 300);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    return __dst;
                  }
LABEL_569:
                  long long v1593 = *((_OWORD *)__src + 146);
                  *((_OWORD *)__dst + 145) = *((_OWORD *)__src + 145);
                  *((_OWORD *)__dst + 146) = v1593;
                  long long v1594 = *((_OWORD *)__src + 147);
                  long long v1595 = *((_OWORD *)__src + 148);
                  long long v1596 = *((_OWORD *)__src + 149);
                  *((void *)__dst + 300) = *((void *)__src + 300);
                  *((_OWORD *)__dst + 148) = v1595;
                  *((_OWORD *)__dst + 149) = v1596;
                  *((_OWORD *)__dst + 147) = v1594;
                  return __dst;
                }
                if (v1430 == 1)
                {
                  long long v1431 = *v1429;
                  long long v1432 = *(_OWORD *)(__src + 2264);
                  *(_OWORD *)(__dst + 2248) = *(_OWORD *)(__src + 2248);
                  *(_OWORD *)(__dst + 2264) = v1432;
                  _OWORD *v1428 = v1431;
                  long long v1433 = *(_OWORD *)(__src + 2280);
                  long long v1434 = *(_OWORD *)(__src + 2296);
                  long long v1435 = *(_OWORD *)(__src + 2328);
                  *(_OWORD *)(__dst + 2312) = *(_OWORD *)(__src + 2312);
                  *(_OWORD *)(__dst + 2328) = v1435;
                  *(_OWORD *)(__dst + 2280) = v1433;
                  *(_OWORD *)(__dst + 2296) = v1434;
                  long long v1436 = *(_OWORD *)(__src + 2344);
                  long long v1437 = *(_OWORD *)(__src + 2360);
                  long long v1438 = *(_OWORD *)(__src + 2392);
                  *(_OWORD *)(__dst + 2376) = *(_OWORD *)(__src + 2376);
                  *(_OWORD *)(__dst + 2392) = v1438;
                  *(_OWORD *)(__dst + 2344) = v1436;
                  *(_OWORD *)(__dst + 2360) = v1437;
                  return __dst;
                }
LABEL_561:
                uint64_t v1548 = *((void *)__src + 279);
                uint64_t v1549 = *((void *)__src + 280);
                uint64_t v1550 = *((void *)__src + 281);
                uint64_t v1551 = *((void *)__src + 282);
                uint64_t v1552 = *((void *)__src + 283);
                uint64_t v1553 = *((void *)__src + 284);
                uint64_t v1554 = *((void *)__src + 285);
                uint64_t v1555 = *((void *)__src + 286);
                uint64_t v1718 = *((unsigned __int8 *)v1793 + 1972);
                uint64_t v1788 = v1793[492];
                sub_25771CCF8(v1548, v1549, v1550, v1551, v1552, v1553, v1554, v1555, v1788 | (v1718 << 32));
                *((void *)__dst + 279) = v1548;
                *((void *)__dst + 280) = v1549;
                *((void *)__dst + 281) = v1550;
                *((void *)__dst + 282) = v1551;
                *((void *)__dst + 283) = v1552;
                *((void *)__dst + 284) = v1553;
                *((void *)__dst + 285) = v1554;
                *((void *)__dst + 286) = v1555;
                *((unsigned char *)v1795 + 1972) = v1718;
                v1795[492] = v1788;
                *((void *)__dst + 288) = *((void *)__src + 288);
                *((void *)__dst + 289) = *((void *)__src + 289);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                if (*((void *)__src + 299)) {
                  goto LABEL_562;
                }
                goto LABEL_569;
              case 2:
                goto LABEL_523;
            }
LABEL_518:
            uint64_t v1388 = *((void *)__src + 257);
            uint64_t v1389 = *((void *)__src + 258);
            uint64_t v1390 = *((void *)__src + 259);
            uint64_t v1391 = *((void *)__src + 260);
            uint64_t v1392 = *((void *)__src + 261);
            uint64_t v1393 = *((void *)__src + 262);
            uint64_t v1394 = *((void *)__src + 263);
            uint64_t v1395 = *((void *)__src + 264);
            uint64_t v1711 = *((unsigned __int8 *)v1793 + 1796);
            uint64_t v1781 = v1793[448];
            sub_25771CCF8(v1388, v1389, v1390, v1391, v1392, v1393, v1394, v1395, v1781 | (v1711 << 32));
            *((void *)__dst + 257) = v1388;
            *((void *)__dst + 258) = v1389;
            *((void *)__dst + 259) = v1390;
            *((void *)__dst + 260) = v1391;
            *((void *)__dst + 261) = v1392;
            *((void *)__dst + 262) = v1393;
            *((void *)__dst + 263) = v1394;
            *((void *)__dst + 264) = v1395;
            *((unsigned char *)v1795 + 1796) = v1711;
            v1795[448] = v1781;
            *((void *)__dst + 266) = *((void *)__src + 266);
            *((void *)__dst + 267) = *((void *)__src + 267);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (*((void *)__src + 277)) {
              goto LABEL_519;
            }
            goto LABEL_530;
          }
        }
        else
        {
          long long v881 = *(_OWORD *)(__src + 1896);
          long long *v870 = *v871;
          *(_OWORD *)(__dst + 1896) = v881;
          long long v882 = *(_OWORD *)(__src + 1912);
          long long v883 = *(_OWORD *)(__src + 1928);
          long long v884 = *(_OWORD *)(__src + 1944);
          *((void *)__dst + 245) = *((void *)__src + 245);
          *(_OWORD *)(__dst + 1928) = v883;
          *(_OWORD *)(__dst + 1944) = v884;
          *(_OWORD *)(__dst + 1912) = v882;
          if (!*((void *)__src + 255)) {
            goto LABEL_399;
          }
        }
        uint64_t v885 = *((void *)__src + 246);
        uint64_t v886 = *((void *)__src + 247);
        uint64_t v887 = *((void *)__src + 248);
        uint64_t v888 = *((void *)__src + 249);
        uint64_t v889 = *((void *)__src + 250);
        uint64_t v890 = *((void *)__src + 251);
        uint64_t v891 = *((void *)__src + 252);
        uint64_t v892 = *((void *)__src + 253);
        uint64_t v1689 = *((unsigned __int8 *)v1793 + 1708);
        uint64_t v1759 = v1793[426];
        sub_25771CCF8(v885, v886, v887, v888, v889, v890, v891, v892, v1759 | (v1689 << 32));
        *((void *)__dst + 246) = v885;
        *((void *)__dst + 247) = v886;
        *((void *)__dst + 248) = v887;
        *((void *)__dst + 249) = v888;
        *((void *)__dst + 250) = v889;
        *((void *)__dst + 251) = v890;
        *((void *)__dst + 252) = v891;
        *((void *)__dst + 253) = v892;
        *((unsigned char *)v1795 + 1708) = v1689;
        v1795[426] = v1759;
        *((void *)__dst + 255) = *((void *)__src + 255);
        *((void *)__dst + 256) = *((void *)__src + 256);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_400;
    }
  }
  if (v818 == 3)
  {
    sub_2577FDDB4((uint64_t)(__dst + 1704));
LABEL_379:
    v831 = __dst + 1704;
    v832 = __src + 1704;
    size_t v833 = 704;
    goto LABEL_524;
  }
  if (v817 == 2)
  {
    if (!v818)
    {
      long long v965 = *(_OWORD *)(__src + 1720);
      _OWORD *v815 = *v816;
      *(_OWORD *)(__dst + 1720) = v965;
      long long v966 = *(_OWORD *)(__src + 1736);
      long long v967 = *(_OWORD *)(__src + 1752);
      long long v968 = *(_OWORD *)(__src + 1768);
      *((void *)__dst + 223) = *((void *)__src + 223);
      *(_OWORD *)(__dst + 1752) = v967;
      *(_OWORD *)(__dst + 1768) = v968;
      *(_OWORD *)(__dst + 1736) = v966;
      if (*((void *)__src + 233)) {
        goto LABEL_385;
      }
      goto LABEL_422;
    }
    if (v818 == 1)
    {
      long long v973 = *v816;
      long long v974 = *(_OWORD *)(__src + 1736);
      *(_OWORD *)(__dst + 1720) = *(_OWORD *)(__src + 1720);
      *(_OWORD *)(__dst + 1736) = v974;
      _OWORD *v815 = v973;
      long long v975 = *(_OWORD *)(__src + 1752);
      long long v976 = *(_OWORD *)(__src + 1768);
      long long v977 = *(_OWORD *)(__src + 1800);
      *(_OWORD *)(__dst + 1784) = *(_OWORD *)(__src + 1784);
      *(_OWORD *)(__dst + 1800) = v977;
      *(_OWORD *)(__dst + 1752) = v975;
      *(_OWORD *)(__dst + 1768) = v976;
      long long v978 = *(_OWORD *)(__src + 1816);
      long long v979 = *(_OWORD *)(__src + 1832);
      long long v980 = *(_OWORD *)(__src + 1864);
      *(_OWORD *)(__dst + 1848) = *(_OWORD *)(__src + 1848);
      *(_OWORD *)(__dst + 1864) = v980;
      *(_OWORD *)(__dst + 1816) = v978;
      *(_OWORD *)(__dst + 1832) = v979;
      goto LABEL_424;
    }
    if (v818 != 2)
    {
      uint64_t v834 = *((void *)__src + 213);
      uint64_t v835 = *((void *)__src + 214);
      uint64_t v836 = *((void *)__src + 215);
      uint64_t v837 = *((void *)__src + 216);
      uint64_t v838 = *((void *)__src + 217);
      uint64_t v839 = *((void *)__src + 218);
      uint64_t v840 = *((void *)__src + 219);
      uint64_t v841 = *((void *)__src + 220);
      uint64_t v1686 = *((unsigned __int8 *)v1793 + 1444);
      uint64_t v1756 = v1793[360];
      sub_25771CCF8(v834, v835, v836, v837, v838, v839, v840, v841, v1756 | (v1686 << 32));
      *((void *)__dst + 213) = v834;
      *((void *)__dst + 214) = v835;
      *((void *)__dst + 215) = v836;
      *((void *)__dst + 216) = v837;
      *((void *)__dst + 217) = v838;
      *((void *)__dst + 218) = v839;
      *((void *)__dst + 219) = v840;
      *((void *)__dst + 220) = v841;
      *((unsigned char *)v1795 + 1444) = v1686;
      v1795[360] = v1756;
      *((void *)__dst + 222) = *((void *)__src + 222);
      *((void *)__dst + 223) = *((void *)__src + 223);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 233))
      {
LABEL_385:
        uint64_t v842 = *((void *)__src + 224);
        uint64_t v843 = *((void *)__src + 225);
        uint64_t v844 = *((void *)__src + 226);
        uint64_t v845 = *((void *)__src + 227);
        uint64_t v846 = *((void *)__src + 228);
        uint64_t v847 = *((void *)__src + 229);
        uint64_t v848 = *((void *)__src + 230);
        uint64_t v849 = *((void *)__src + 231);
        uint64_t v1687 = *((unsigned __int8 *)v1793 + 1532);
        uint64_t v1757 = v1793[382];
        sub_25771CCF8(v842, v843, v844, v845, v846, v847, v848, v849, v1757 | (v1687 << 32));
        *((void *)__dst + 224) = v842;
        *((void *)__dst + 225) = v843;
        *((void *)__dst + 226) = v844;
        *((void *)__dst + 227) = v845;
        *((void *)__dst + 228) = v846;
        *((void *)__dst + 229) = v847;
        *((void *)__dst + 230) = v848;
        *((void *)__dst + 231) = v849;
        *((unsigned char *)v1795 + 1532) = v1687;
        v1795[382] = v1757;
        *((void *)__dst + 233) = *((void *)__src + 233);
        *((void *)__dst + 234) = *((void *)__src + 234);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_424:
        v981 = (long long *)(__dst + 1880);
        v982 = (long long *)(__src + 1880);
        uint64_t v983 = *((void *)__src + 244);
        if (v983)
        {
          if (v983 == 1)
          {
            long long v984 = *v982;
            long long v985 = *(_OWORD *)(__src + 1912);
            *(_OWORD *)(__dst + 1896) = *(_OWORD *)(__src + 1896);
            *(_OWORD *)(__dst + 1912) = v985;
            long long *v981 = v984;
            long long v986 = *(_OWORD *)(__src + 1928);
            long long v987 = *(_OWORD *)(__src + 1944);
            long long v988 = *(_OWORD *)(__src + 1976);
            *(_OWORD *)(__dst + 1960) = *(_OWORD *)(__src + 1960);
            *(_OWORD *)(__dst + 1976) = v988;
            *(_OWORD *)(__dst + 1928) = v986;
            *(_OWORD *)(__dst + 1944) = v987;
            long long v989 = *(_OWORD *)(__src + 1992);
            long long v990 = *(_OWORD *)(__src + 2008);
            long long v991 = *(_OWORD *)(__src + 2040);
            *(_OWORD *)(__dst + 2024) = *(_OWORD *)(__src + 2024);
            *(_OWORD *)(__dst + 2040) = v991;
            *(_OWORD *)(__dst + 1992) = v989;
            *(_OWORD *)(__dst + 2008) = v990;
            goto LABEL_514;
          }
          goto LABEL_486;
        }
        long long v1000 = *(_OWORD *)(__src + 1896);
        long long *v981 = *v982;
        *(_OWORD *)(__dst + 1896) = v1000;
        long long v1001 = *(_OWORD *)(__src + 1912);
        long long v1002 = *(_OWORD *)(__src + 1928);
        long long v1003 = *(_OWORD *)(__src + 1944);
        *((void *)__dst + 245) = *((void *)__src + 245);
        *(_OWORD *)(__dst + 1928) = v1002;
        *(_OWORD *)(__dst + 1944) = v1003;
        *(_OWORD *)(__dst + 1912) = v1001;
        if (!*((void *)__src + 255)) {
          goto LABEL_487;
        }
        goto LABEL_513;
      }
LABEL_422:
      long long v969 = *((_OWORD *)__src + 113);
      *((_OWORD *)__dst + 112) = *((_OWORD *)__src + 112);
      *((_OWORD *)__dst + 113) = v969;
      long long v970 = *((_OWORD *)__src + 114);
      long long v971 = *((_OWORD *)__src + 115);
      long long v972 = *((_OWORD *)__src + 116);
      *((void *)__dst + 234) = *((void *)__src + 234);
      *((_OWORD *)__dst + 115) = v971;
      *((_OWORD *)__dst + 116) = v972;
      *((_OWORD *)__dst + 114) = v970;
      goto LABEL_424;
    }
LABEL_388:
    memcpy(__dst + 1704, __src + 1704, 0x160uLL);
    goto LABEL_514;
  }
  if (v818 == 2)
  {
    sub_2577FDD60((uint64_t)(__dst + 1704));
    goto LABEL_388;
  }
  if (v817 == 1)
  {
    if (v818)
    {
      if (v818 == 1)
      {
        long long v918 = *v816;
        long long v919 = *(_OWORD *)(__src + 1736);
        *(_OWORD *)(__dst + 1720) = *(_OWORD *)(__src + 1720);
        *(_OWORD *)(__dst + 1736) = v919;
        _OWORD *v815 = v918;
        long long v920 = *(_OWORD *)(__src + 1752);
        long long v921 = *(_OWORD *)(__src + 1768);
        long long v922 = *(_OWORD *)(__src + 1800);
        *(_OWORD *)(__dst + 1784) = *(_OWORD *)(__src + 1784);
        *(_OWORD *)(__dst + 1800) = v922;
        *(_OWORD *)(__dst + 1752) = v920;
        *(_OWORD *)(__dst + 1768) = v921;
        long long v923 = *(_OWORD *)(__src + 1816);
        long long v924 = *(_OWORD *)(__src + 1832);
        long long v925 = *(_OWORD *)(__src + 1864);
        *(_OWORD *)(__dst + 1848) = *(_OWORD *)(__src + 1848);
        *(_OWORD *)(__dst + 1864) = v925;
        *(_OWORD *)(__dst + 1816) = v923;
        *(_OWORD *)(__dst + 1832) = v924;
        goto LABEL_482;
      }
      uint64_t v1058 = *((void *)__src + 213);
      uint64_t v1059 = *((void *)__src + 214);
      uint64_t v1060 = *((void *)__src + 215);
      uint64_t v1061 = *((void *)__src + 216);
      uint64_t v1062 = *((void *)__src + 217);
      uint64_t v1063 = *((void *)__src + 218);
      uint64_t v1064 = *((void *)__src + 219);
      uint64_t v1065 = *((void *)__src + 220);
      uint64_t v1694 = *((unsigned __int8 *)v1793 + 1444);
      uint64_t v1764 = v1793[360];
      sub_25771CCF8(v1058, v1059, v1060, v1061, v1062, v1063, v1064, v1065, v1764 | (v1694 << 32));
      *((void *)__dst + 213) = v1058;
      *((void *)__dst + 214) = v1059;
      *((void *)__dst + 215) = v1060;
      *((void *)__dst + 216) = v1061;
      *((void *)__dst + 217) = v1062;
      *((void *)__dst + 218) = v1063;
      *((void *)__dst + 219) = v1064;
      *((void *)__dst + 220) = v1065;
      *((unsigned char *)v1795 + 1444) = v1694;
      v1795[360] = v1764;
      *((void *)__dst + 222) = *((void *)__src + 222);
      *((void *)__dst + 223) = *((void *)__src + 223);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v1054 = *(_OWORD *)(__src + 1720);
      _OWORD *v815 = *v816;
      *(_OWORD *)(__dst + 1720) = v1054;
      long long v1055 = *(_OWORD *)(__src + 1736);
      long long v1056 = *(_OWORD *)(__src + 1752);
      long long v1057 = *(_OWORD *)(__src + 1768);
      *((void *)__dst + 223) = *((void *)__src + 223);
      *(_OWORD *)(__dst + 1752) = v1056;
      *(_OWORD *)(__dst + 1768) = v1057;
      *(_OWORD *)(__dst + 1736) = v1055;
    }
    if (!*((void *)__src + 233))
    {
      long long v1066 = *((_OWORD *)__src + 113);
      *((_OWORD *)__dst + 112) = *((_OWORD *)__src + 112);
      *((_OWORD *)__dst + 113) = v1066;
      long long v1067 = *((_OWORD *)__src + 114);
      long long v1068 = *((_OWORD *)__src + 115);
      long long v1069 = *((_OWORD *)__src + 116);
      *((void *)__dst + 234) = *((void *)__src + 234);
      *((_OWORD *)__dst + 115) = v1068;
      *((_OWORD *)__dst + 116) = v1069;
      *((_OWORD *)__dst + 114) = v1067;
      goto LABEL_482;
    }
    goto LABEL_481;
  }
  if (v818 == 1)
  {
    sub_257735730((uint64_t)(__dst + 1704));
    long long v993 = *(_OWORD *)(__src + 1720);
    long long v992 = *(_OWORD *)(__src + 1736);
    _OWORD *v815 = *v816;
    *(_OWORD *)(__dst + 1720) = v993;
    *(_OWORD *)(__dst + 1736) = v992;
    long long v994 = *(_OWORD *)(__src + 1800);
    long long v996 = *(_OWORD *)(__src + 1752);
    long long v995 = *(_OWORD *)(__src + 1768);
    *(_OWORD *)(__dst + 1784) = *(_OWORD *)(__src + 1784);
    *(_OWORD *)(__dst + 1800) = v994;
    *(_OWORD *)(__dst + 1752) = v996;
    *(_OWORD *)(__dst + 1768) = v995;
    long long v997 = *(_OWORD *)(__src + 1864);
    long long v999 = *(_OWORD *)(__src + 1816);
    long long v998 = *(_OWORD *)(__src + 1832);
    *(_OWORD *)(__dst + 1848) = *(_OWORD *)(__src + 1848);
    *(_OWORD *)(__dst + 1864) = v997;
    *(_OWORD *)(__dst + 1816) = v999;
    *(_OWORD *)(__dst + 1832) = v998;
    goto LABEL_482;
  }
  if (v817)
  {
    if (v818)
    {
      uint64_t v1021 = *((void *)__src + 214);
      uint64_t v1022 = *((void *)__src + 215);
      uint64_t v1023 = *((void *)__src + 216);
      uint64_t v1024 = *((void *)__src + 217);
      uint64_t v1025 = *((void *)__src + 218);
      uint64_t v1026 = *((void *)__src + 219);
      uint64_t v1027 = *((void *)__src + 220);
      uint64_t v1692 = *((void *)__src + 213);
      uint64_t v1762 = *((unsigned __int8 *)v1793 + 1444);
      uint64_t v1028 = v1793[360];
      sub_25771CCF8(v1692, v1021, v1022, v1023, v1024, v1025, v1026, v1027, v1028 | (v1762 << 32));
      uint64_t v1029 = *((void *)__dst + 213);
      uint64_t v1030 = *((void *)__dst + 214);
      uint64_t v1031 = *((void *)__dst + 215);
      uint64_t v1032 = *((void *)__dst + 216);
      uint64_t v1033 = *((void *)__dst + 217);
      uint64_t v1034 = *((void *)__dst + 218);
      uint64_t v1035 = *((void *)__dst + 219);
      uint64_t v1036 = *((void *)__dst + 220);
      unint64_t v1037 = v1795[360] | ((unint64_t)*((unsigned __int8 *)v1795 + 1444) << 32);
      *((void *)__dst + 213) = v1692;
      *((void *)__dst + 214) = v1021;
      *((void *)__dst + 215) = v1022;
      *((void *)__dst + 216) = v1023;
      *((void *)__dst + 217) = v1024;
      *((void *)__dst + 218) = v1025;
      *((void *)__dst + 219) = v1026;
      *((void *)__dst + 220) = v1027;
      v1795[360] = v1028;
      *((unsigned char *)v1795 + 1444) = v1762;
      sub_25771D110(v1029, v1030, v1031, v1032, v1033, v1034, v1035, v1036, v1037);
      *((void *)__dst + 222) = *((void *)__src + 222);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 223) = *((void *)__src + 223);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 1704), &qword_26A030F50);
      long long v1094 = *(_OWORD *)(__src + 1720);
      _OWORD *v815 = *v816;
      *(_OWORD *)(__dst + 1720) = v1094;
      long long v1096 = *(_OWORD *)(__src + 1752);
      long long v1095 = *(_OWORD *)(__src + 1768);
      long long v1097 = *(_OWORD *)(__src + 1736);
      *((void *)__dst + 223) = *((void *)__src + 223);
      *(_OWORD *)(__dst + 1752) = v1096;
      *(_OWORD *)(__dst + 1768) = v1095;
      *(_OWORD *)(__dst + 1736) = v1097;
    }
  }
  else if (v818)
  {
    uint64_t v1078 = *((void *)__src + 213);
    uint64_t v1079 = *((void *)__src + 214);
    uint64_t v1080 = *((void *)__src + 215);
    uint64_t v1081 = *((void *)__src + 216);
    uint64_t v1082 = *((void *)__src + 217);
    uint64_t v1083 = *((void *)__src + 218);
    uint64_t v1084 = *((void *)__src + 219);
    uint64_t v1085 = *((void *)__src + 220);
    uint64_t v1696 = *((unsigned __int8 *)v1793 + 1444);
    uint64_t v1766 = v1793[360];
    sub_25771CCF8(v1078, v1079, v1080, v1081, v1082, v1083, v1084, v1085, v1766 | (v1696 << 32));
    *((void *)__dst + 213) = v1078;
    *((void *)__dst + 214) = v1079;
    *((void *)__dst + 215) = v1080;
    *((void *)__dst + 216) = v1081;
    *((void *)__dst + 217) = v1082;
    *((void *)__dst + 218) = v1083;
    *((void *)__dst + 219) = v1084;
    *((void *)__dst + 220) = v1085;
    *((unsigned char *)v1795 + 1444) = v1696;
    v1795[360] = v1766;
    *((void *)__dst + 222) = *((void *)__src + 222);
    *((void *)__dst + 223) = *((void *)__src + 223);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v1211 = *(_OWORD *)(__src + 1720);
    _OWORD *v815 = *v816;
    *(_OWORD *)(__dst + 1720) = v1211;
    long long v1212 = *(_OWORD *)(__src + 1736);
    long long v1213 = *(_OWORD *)(__src + 1752);
    long long v1214 = *(_OWORD *)(__src + 1768);
    *((void *)__dst + 223) = *((void *)__src + 223);
    *(_OWORD *)(__dst + 1752) = v1213;
    *(_OWORD *)(__dst + 1768) = v1214;
    *(_OWORD *)(__dst + 1736) = v1212;
  }
  v1215 = __dst + 1792;
  v1216 = __src + 1792;
  uint64_t v1217 = *((void *)__src + 233);
  if (*((void *)__dst + 233))
  {
    if (v1217)
    {
      uint64_t v1218 = *((void *)__src + 225);
      uint64_t v1219 = *((void *)__src + 226);
      uint64_t v1220 = *((void *)__src + 227);
      uint64_t v1221 = *((void *)__src + 228);
      uint64_t v1222 = *((void *)__src + 229);
      uint64_t v1223 = *((void *)__src + 230);
      uint64_t v1224 = *((void *)__src + 231);
      uint64_t v1703 = *((void *)__src + 224);
      uint64_t v1773 = *((unsigned __int8 *)v1793 + 1532);
      uint64_t v1225 = v1793[382];
      sub_25771CCF8(v1703, v1218, v1219, v1220, v1221, v1222, v1223, v1224, v1225 | (v1773 << 32));
      uint64_t v1226 = *((void *)__dst + 224);
      uint64_t v1227 = *((void *)__dst + 225);
      uint64_t v1228 = *((void *)__dst + 226);
      uint64_t v1229 = *((void *)__dst + 227);
      uint64_t v1230 = *((void *)__dst + 228);
      uint64_t v1231 = *((void *)__dst + 229);
      uint64_t v1232 = *((void *)__dst + 230);
      uint64_t v1233 = *((void *)__dst + 231);
      unint64_t v1234 = v1795[382] | ((unint64_t)*((unsigned __int8 *)v1795 + 1532) << 32);
      *((void *)__dst + 224) = v1703;
      *((void *)__dst + 225) = v1218;
      *((void *)__dst + 226) = v1219;
      *((void *)__dst + 227) = v1220;
      *((void *)__dst + 228) = v1221;
      *((void *)__dst + 229) = v1222;
      *((void *)__dst + 230) = v1223;
      *((void *)__dst + 231) = v1224;
      v1795[382] = v1225;
      *((unsigned char *)v1795 + 1532) = v1773;
      sub_25771D110(v1226, v1227, v1228, v1229, v1230, v1231, v1232, v1233, v1234);
      *((void *)__dst + 233) = *((void *)__src + 233);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 234) = *((void *)__src + 234);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 1792), &qword_26A030F50);
      long long v1304 = *((_OWORD *)__src + 113);
      _OWORD *v1215 = *v1216;
      *((_OWORD *)__dst + 113) = v1304;
      long long v1306 = *((_OWORD *)__src + 115);
      long long v1305 = *((_OWORD *)__src + 116);
      long long v1307 = *((_OWORD *)__src + 114);
      *((void *)__dst + 234) = *((void *)__src + 234);
      *((_OWORD *)__dst + 115) = v1306;
      *((_OWORD *)__dst + 116) = v1305;
      *((_OWORD *)__dst + 114) = v1307;
    }
  }
  else
  {
    if (v1217)
    {
LABEL_481:
      uint64_t v1235 = *((void *)__src + 224);
      uint64_t v1236 = *((void *)__src + 225);
      uint64_t v1237 = *((void *)__src + 226);
      uint64_t v1238 = *((void *)__src + 227);
      uint64_t v1239 = *((void *)__src + 228);
      uint64_t v1240 = *((void *)__src + 229);
      uint64_t v1241 = *((void *)__src + 230);
      uint64_t v1242 = *((void *)__src + 231);
      uint64_t v1704 = *((unsigned __int8 *)v1793 + 1532);
      uint64_t v1774 = v1793[382];
      sub_25771CCF8(v1235, v1236, v1237, v1238, v1239, v1240, v1241, v1242, v1774 | (v1704 << 32));
      *((void *)__dst + 224) = v1235;
      *((void *)__dst + 225) = v1236;
      *((void *)__dst + 226) = v1237;
      *((void *)__dst + 227) = v1238;
      *((void *)__dst + 228) = v1239;
      *((void *)__dst + 229) = v1240;
      *((void *)__dst + 230) = v1241;
      *((void *)__dst + 231) = v1242;
      *((unsigned char *)v1795 + 1532) = v1704;
      v1795[382] = v1774;
      *((void *)__dst + 233) = *((void *)__src + 233);
      *((void *)__dst + 234) = *((void *)__src + 234);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_482;
    }
    long long v1348 = *((_OWORD *)__src + 113);
    _OWORD *v1215 = *v1216;
    *((_OWORD *)__dst + 113) = v1348;
    long long v1349 = *((_OWORD *)__src + 114);
    long long v1350 = *((_OWORD *)__src + 115);
    long long v1351 = *((_OWORD *)__src + 116);
    *((void *)__dst + 234) = *((void *)__src + 234);
    *((_OWORD *)__dst + 115) = v1350;
    *((_OWORD *)__dst + 116) = v1351;
    *((_OWORD *)__dst + 114) = v1349;
  }
LABEL_482:
  v1243 = (long long *)(__dst + 1880);
  v1244 = (long long *)(__src + 1880);
  uint64_t v1245 = *((void *)__dst + 244);
  uint64_t v1246 = *((void *)__src + 244);
  if (v1245 == 1)
  {
    if (v1246)
    {
      if (v1246 == 1)
      {
        long long v1247 = *v1244;
        long long v1248 = *(_OWORD *)(__src + 1912);
        *(_OWORD *)(__dst + 1896) = *(_OWORD *)(__src + 1896);
        *(_OWORD *)(__dst + 1912) = v1248;
        long long *v1243 = v1247;
        long long v1249 = *(_OWORD *)(__src + 1928);
        long long v1250 = *(_OWORD *)(__src + 1944);
        long long v1251 = *(_OWORD *)(__src + 1976);
        *(_OWORD *)(__dst + 1960) = *(_OWORD *)(__src + 1960);
        *(_OWORD *)(__dst + 1976) = v1251;
        *(_OWORD *)(__dst + 1928) = v1249;
        *(_OWORD *)(__dst + 1944) = v1250;
        long long v1252 = *(_OWORD *)(__src + 1992);
        long long v1253 = *(_OWORD *)(__src + 2008);
        long long v1254 = *(_OWORD *)(__src + 2040);
        *(_OWORD *)(__dst + 2024) = *(_OWORD *)(__src + 2024);
        *(_OWORD *)(__dst + 2040) = v1254;
        *(_OWORD *)(__dst + 1992) = v1252;
        *(_OWORD *)(__dst + 2008) = v1253;
        goto LABEL_514;
      }
LABEL_486:
      uint64_t v1255 = *((void *)__src + 235);
      uint64_t v1256 = *((void *)__src + 236);
      uint64_t v1257 = *((void *)__src + 237);
      uint64_t v1258 = *((void *)__src + 238);
      uint64_t v1259 = *((void *)__src + 239);
      uint64_t v1260 = *((void *)__src + 240);
      uint64_t v1261 = *((void *)__src + 241);
      uint64_t v1262 = *((void *)__src + 242);
      uint64_t v1705 = *((unsigned __int8 *)v1793 + 1620);
      uint64_t v1775 = v1793[404];
      sub_25771CCF8(v1255, v1256, v1257, v1258, v1259, v1260, v1261, v1262, v1775 | (v1705 << 32));
      *((void *)__dst + 235) = v1255;
      *((void *)__dst + 236) = v1256;
      *((void *)__dst + 237) = v1257;
      *((void *)__dst + 238) = v1258;
      *((void *)__dst + 239) = v1259;
      *((void *)__dst + 240) = v1260;
      *((void *)__dst + 241) = v1261;
      *((void *)__dst + 242) = v1262;
      *((unsigned char *)v1795 + 1620) = v1705;
      v1795[404] = v1775;
      *((void *)__dst + 244) = *((void *)__src + 244);
      *((void *)__dst + 245) = *((void *)__src + 245);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!*((void *)__src + 255))
      {
LABEL_487:
        long long v1263 = *((_OWORD *)__src + 124);
        *((_OWORD *)__dst + 123) = *((_OWORD *)__src + 123);
        *((_OWORD *)__dst + 124) = v1263;
        long long v1264 = *((_OWORD *)__src + 125);
        long long v1265 = *((_OWORD *)__src + 126);
        long long v1266 = *((_OWORD *)__src + 127);
        *((void *)__dst + 256) = *((void *)__src + 256);
        *((_OWORD *)__dst + 126) = v1265;
        *((_OWORD *)__dst + 127) = v1266;
        *((_OWORD *)__dst + 125) = v1264;
        goto LABEL_514;
      }
      goto LABEL_513;
    }
    long long v1292 = *(_OWORD *)(__src + 1896);
    long long *v1243 = *v1244;
    *(_OWORD *)(__dst + 1896) = v1292;
    long long v1293 = *(_OWORD *)(__src + 1912);
    long long v1294 = *(_OWORD *)(__src + 1928);
    long long v1295 = *(_OWORD *)(__src + 1944);
    *((void *)__dst + 245) = *((void *)__src + 245);
    *(_OWORD *)(__dst + 1928) = v1294;
    *(_OWORD *)(__dst + 1944) = v1295;
    *(_OWORD *)(__dst + 1912) = v1293;
    if (!*((void *)__src + 255)) {
      goto LABEL_487;
    }
LABEL_513:
    uint64_t v1376 = *((void *)__src + 246);
    uint64_t v1377 = *((void *)__src + 247);
    uint64_t v1378 = *((void *)__src + 248);
    uint64_t v1379 = *((void *)__src + 249);
    uint64_t v1380 = *((void *)__src + 250);
    uint64_t v1381 = *((void *)__src + 251);
    uint64_t v1382 = *((void *)__src + 252);
    uint64_t v1383 = *((void *)__src + 253);
    uint64_t v1710 = *((unsigned __int8 *)v1793 + 1708);
    uint64_t v1780 = v1793[426];
    sub_25771CCF8(v1376, v1377, v1378, v1379, v1380, v1381, v1382, v1383, v1780 | (v1710 << 32));
    *((void *)__dst + 246) = v1376;
    *((void *)__dst + 247) = v1377;
    *((void *)__dst + 248) = v1378;
    *((void *)__dst + 249) = v1379;
    *((void *)__dst + 250) = v1380;
    *((void *)__dst + 251) = v1381;
    *((void *)__dst + 252) = v1382;
    *((void *)__dst + 253) = v1383;
    *((unsigned char *)v1795 + 1708) = v1710;
    v1795[426] = v1780;
    *((void *)__dst + 255) = *((void *)__src + 255);
    *((void *)__dst + 256) = *((void *)__src + 256);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_514;
  }
  if (v1246 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 1880));
    long long v1268 = *(_OWORD *)(__src + 1896);
    long long v1267 = *(_OWORD *)(__src + 1912);
    long long *v1243 = *v1244;
    *(_OWORD *)(__dst + 1896) = v1268;
    *(_OWORD *)(__dst + 1912) = v1267;
    long long v1269 = *(_OWORD *)(__src + 1976);
    long long v1271 = *(_OWORD *)(__src + 1928);
    long long v1270 = *(_OWORD *)(__src + 1944);
    *(_OWORD *)(__dst + 1960) = *(_OWORD *)(__src + 1960);
    *(_OWORD *)(__dst + 1976) = v1269;
    *(_OWORD *)(__dst + 1928) = v1271;
    *(_OWORD *)(__dst + 1944) = v1270;
    long long v1272 = *(_OWORD *)(__src + 2040);
    long long v1274 = *(_OWORD *)(__src + 1992);
    long long v1273 = *(_OWORD *)(__src + 2008);
    *(_OWORD *)(__dst + 2024) = *(_OWORD *)(__src + 2024);
    *(_OWORD *)(__dst + 2040) = v1272;
    *(_OWORD *)(__dst + 1992) = v1274;
    *(_OWORD *)(__dst + 2008) = v1273;
    goto LABEL_514;
  }
  if (v1245)
  {
    if (v1246)
    {
      uint64_t v1275 = *((void *)__src + 236);
      uint64_t v1276 = *((void *)__src + 237);
      uint64_t v1277 = *((void *)__src + 238);
      uint64_t v1278 = *((void *)__src + 239);
      uint64_t v1279 = *((void *)__src + 240);
      uint64_t v1280 = *((void *)__src + 241);
      uint64_t v1281 = *((void *)__src + 242);
      uint64_t v1706 = *((void *)__src + 235);
      uint64_t v1776 = *((unsigned __int8 *)v1793 + 1620);
      uint64_t v1282 = v1793[404];
      sub_25771CCF8(v1706, v1275, v1276, v1277, v1278, v1279, v1280, v1281, v1282 | (v1776 << 32));
      uint64_t v1283 = *((void *)__dst + 235);
      uint64_t v1284 = *((void *)__dst + 236);
      uint64_t v1285 = *((void *)__dst + 237);
      uint64_t v1286 = *((void *)__dst + 238);
      uint64_t v1287 = *((void *)__dst + 239);
      uint64_t v1288 = *((void *)__dst + 240);
      uint64_t v1289 = *((void *)__dst + 241);
      uint64_t v1290 = *((void *)__dst + 242);
      unint64_t v1291 = v1795[404] | ((unint64_t)*((unsigned __int8 *)v1795 + 1620) << 32);
      *((void *)__dst + 235) = v1706;
      *((void *)__dst + 236) = v1275;
      *((void *)__dst + 237) = v1276;
      *((void *)__dst + 238) = v1277;
      *((void *)__dst + 239) = v1278;
      *((void *)__dst + 240) = v1279;
      *((void *)__dst + 241) = v1280;
      *((void *)__dst + 242) = v1281;
      v1795[404] = v1282;
      *((unsigned char *)v1795 + 1620) = v1776;
      sub_25771D110(v1283, v1284, v1285, v1286, v1287, v1288, v1289, v1290, v1291);
      *((void *)__dst + 244) = *((void *)__src + 244);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 245) = *((void *)__src + 245);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 1880), &qword_26A030F50);
      long long v1308 = *(_OWORD *)(__src + 1896);
      long long *v1243 = *v1244;
      *(_OWORD *)(__dst + 1896) = v1308;
      long long v1310 = *(_OWORD *)(__src + 1928);
      long long v1309 = *(_OWORD *)(__src + 1944);
      long long v1311 = *(_OWORD *)(__src + 1912);
      *((void *)__dst + 245) = *((void *)__src + 245);
      *(_OWORD *)(__dst + 1928) = v1310;
      *(_OWORD *)(__dst + 1944) = v1309;
      *(_OWORD *)(__dst + 1912) = v1311;
    }
  }
  else if (v1246)
  {
    uint64_t v1296 = *((void *)__src + 235);
    uint64_t v1297 = *((void *)__src + 236);
    uint64_t v1298 = *((void *)__src + 237);
    uint64_t v1299 = *((void *)__src + 238);
    uint64_t v1300 = *((void *)__src + 239);
    uint64_t v1301 = *((void *)__src + 240);
    uint64_t v1302 = *((void *)__src + 241);
    uint64_t v1303 = *((void *)__src + 242);
    uint64_t v1707 = *((unsigned __int8 *)v1793 + 1620);
    uint64_t v1777 = v1793[404];
    sub_25771CCF8(v1296, v1297, v1298, v1299, v1300, v1301, v1302, v1303, v1777 | (v1707 << 32));
    *((void *)__dst + 235) = v1296;
    *((void *)__dst + 236) = v1297;
    *((void *)__dst + 237) = v1298;
    *((void *)__dst + 238) = v1299;
    *((void *)__dst + 239) = v1300;
    *((void *)__dst + 240) = v1301;
    *((void *)__dst + 241) = v1302;
    *((void *)__dst + 242) = v1303;
    *((unsigned char *)v1795 + 1620) = v1707;
    v1795[404] = v1777;
    *((void *)__dst + 244) = *((void *)__src + 244);
    *((void *)__dst + 245) = *((void *)__src + 245);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v1352 = *(_OWORD *)(__src + 1896);
    long long *v1243 = *v1244;
    *(_OWORD *)(__dst + 1896) = v1352;
    long long v1353 = *(_OWORD *)(__src + 1912);
    long long v1354 = *(_OWORD *)(__src + 1928);
    long long v1355 = *(_OWORD *)(__src + 1944);
    *((void *)__dst + 245) = *((void *)__src + 245);
    *(_OWORD *)(__dst + 1928) = v1354;
    *(_OWORD *)(__dst + 1944) = v1355;
    *(_OWORD *)(__dst + 1912) = v1353;
  }
  v1356 = __dst + 1968;
  v1357 = __src + 1968;
  uint64_t v1358 = *((void *)__src + 255);
  if (*((void *)__dst + 255))
  {
    if (v1358)
    {
      uint64_t v1359 = *((void *)__src + 247);
      uint64_t v1360 = *((void *)__src + 248);
      uint64_t v1361 = *((void *)__src + 249);
      uint64_t v1362 = *((void *)__src + 250);
      uint64_t v1363 = *((void *)__src + 251);
      uint64_t v1364 = *((void *)__src + 252);
      uint64_t v1365 = *((void *)__src + 253);
      uint64_t v1709 = *((void *)__src + 246);
      uint64_t v1779 = *((unsigned __int8 *)v1793 + 1708);
      uint64_t v1366 = v1793[426];
      sub_25771CCF8(v1709, v1359, v1360, v1361, v1362, v1363, v1364, v1365, v1366 | (v1779 << 32));
      uint64_t v1367 = *((void *)__dst + 246);
      uint64_t v1368 = *((void *)__dst + 247);
      uint64_t v1369 = *((void *)__dst + 248);
      uint64_t v1370 = *((void *)__dst + 249);
      uint64_t v1371 = *((void *)__dst + 250);
      uint64_t v1372 = *((void *)__dst + 251);
      uint64_t v1373 = *((void *)__dst + 252);
      uint64_t v1374 = *((void *)__dst + 253);
      unint64_t v1375 = v1795[426] | ((unint64_t)*((unsigned __int8 *)v1795 + 1708) << 32);
      *((void *)__dst + 246) = v1709;
      *((void *)__dst + 247) = v1359;
      *((void *)__dst + 248) = v1360;
      *((void *)__dst + 249) = v1361;
      *((void *)__dst + 250) = v1362;
      *((void *)__dst + 251) = v1363;
      *((void *)__dst + 252) = v1364;
      *((void *)__dst + 253) = v1365;
      v1795[426] = v1366;
      *((unsigned char *)v1795 + 1708) = v1779;
      sub_25771D110(v1367, v1368, v1369, v1370, v1371, v1372, v1373, v1374, v1375);
      *((void *)__dst + 255) = *((void *)__src + 255);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 256) = *((void *)__src + 256);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 1968), &qword_26A030F50);
      long long v1492 = *((_OWORD *)__src + 124);
      _OWORD *v1356 = *v1357;
      *((_OWORD *)__dst + 124) = v1492;
      long long v1494 = *((_OWORD *)__src + 126);
      long long v1493 = *((_OWORD *)__src + 127);
      long long v1495 = *((_OWORD *)__src + 125);
      *((void *)__dst + 256) = *((void *)__src + 256);
      *((_OWORD *)__dst + 126) = v1494;
      *((_OWORD *)__dst + 127) = v1493;
      *((_OWORD *)__dst + 125) = v1495;
    }
  }
  else
  {
    if (v1358) {
      goto LABEL_513;
    }
    long long v1500 = *((_OWORD *)__src + 124);
    _OWORD *v1356 = *v1357;
    *((_OWORD *)__dst + 124) = v1500;
    long long v1501 = *((_OWORD *)__src + 125);
    long long v1502 = *((_OWORD *)__src + 126);
    long long v1503 = *((_OWORD *)__src + 127);
    *((void *)__dst + 256) = *((void *)__src + 256);
    *((_OWORD *)__dst + 126) = v1502;
    *((_OWORD *)__dst + 127) = v1503;
    *((_OWORD *)__dst + 125) = v1501;
  }
LABEL_514:
  v1384 = __dst + 2056;
  v1385 = __src + 2056;
  uint64_t v1386 = *((void *)__dst + 266);
  uint64_t v1387 = *((void *)__src + 266);
  if (v1386 == 2)
  {
    if (!v1387)
    {
      long long v1412 = *(_OWORD *)(__src + 2072);
      _OWORD *v1384 = *v1385;
      *(_OWORD *)(__dst + 2072) = v1412;
      long long v1413 = *(_OWORD *)(__src + 2088);
      long long v1414 = *(_OWORD *)(__src + 2104);
      long long v1415 = *(_OWORD *)(__src + 2120);
      *((void *)__dst + 267) = *((void *)__src + 267);
      *(_OWORD *)(__dst + 2104) = v1414;
      *(_OWORD *)(__dst + 2120) = v1415;
      *(_OWORD *)(__dst + 2088) = v1413;
      if (*((void *)__src + 277)) {
        goto LABEL_519;
      }
      goto LABEL_530;
    }
    if (v1387 == 1)
    {
      long long v1420 = *v1385;
      long long v1421 = *(_OWORD *)(__src + 2088);
      *(_OWORD *)(__dst + 2072) = *(_OWORD *)(__src + 2072);
      *(_OWORD *)(__dst + 2088) = v1421;
      _OWORD *v1384 = v1420;
      long long v1422 = *(_OWORD *)(__src + 2104);
      long long v1423 = *(_OWORD *)(__src + 2120);
      long long v1424 = *(_OWORD *)(__src + 2152);
      *(_OWORD *)(__dst + 2136) = *(_OWORD *)(__src + 2136);
      *(_OWORD *)(__dst + 2152) = v1424;
      *(_OWORD *)(__dst + 2104) = v1422;
      *(_OWORD *)(__dst + 2120) = v1423;
      long long v1425 = *(_OWORD *)(__src + 2168);
      long long v1426 = *(_OWORD *)(__src + 2184);
      long long v1427 = *(_OWORD *)(__src + 2216);
      *(_OWORD *)(__dst + 2200) = *(_OWORD *)(__src + 2200);
      *(_OWORD *)(__dst + 2216) = v1427;
      *(_OWORD *)(__dst + 2168) = v1425;
      *(_OWORD *)(__dst + 2184) = v1426;
      goto LABEL_532;
    }
    if (v1387 != 2) {
      goto LABEL_518;
    }
LABEL_522:
    v831 = __dst + 2056;
    v832 = __src + 2056;
LABEL_523:
    size_t v833 = 352;
LABEL_524:
    memcpy(v831, v832, v833);
    return __dst;
  }
  if (v1387 == 2)
  {
    sub_2577FDD60((uint64_t)(__dst + 2056));
    goto LABEL_522;
  }
  if (v1386 == 1)
  {
    if (v1387)
    {
      if (v1387 == 1)
      {
        long long v1404 = *v1385;
        long long v1405 = *(_OWORD *)(__src + 2088);
        *(_OWORD *)(__dst + 2072) = *(_OWORD *)(__src + 2072);
        *(_OWORD *)(__dst + 2088) = v1405;
        _OWORD *v1384 = v1404;
        long long v1406 = *(_OWORD *)(__src + 2104);
        long long v1407 = *(_OWORD *)(__src + 2120);
        long long v1408 = *(_OWORD *)(__src + 2152);
        *(_OWORD *)(__dst + 2136) = *(_OWORD *)(__src + 2136);
        *(_OWORD *)(__dst + 2152) = v1408;
        *(_OWORD *)(__dst + 2104) = v1406;
        *(_OWORD *)(__dst + 2120) = v1407;
        long long v1409 = *(_OWORD *)(__src + 2168);
        long long v1410 = *(_OWORD *)(__src + 2184);
        long long v1411 = *(_OWORD *)(__src + 2216);
        *(_OWORD *)(__dst + 2200) = *(_OWORD *)(__src + 2200);
        *(_OWORD *)(__dst + 2216) = v1411;
        *(_OWORD *)(__dst + 2168) = v1409;
        *(_OWORD *)(__dst + 2184) = v1410;
        goto LABEL_557;
      }
      uint64_t v1472 = *((void *)__src + 257);
      uint64_t v1473 = *((void *)__src + 258);
      uint64_t v1474 = *((void *)__src + 259);
      uint64_t v1475 = *((void *)__src + 260);
      uint64_t v1476 = *((void *)__src + 261);
      uint64_t v1477 = *((void *)__src + 262);
      uint64_t v1478 = *((void *)__src + 263);
      uint64_t v1479 = *((void *)__src + 264);
      uint64_t v1714 = *((unsigned __int8 *)v1793 + 1796);
      uint64_t v1784 = v1793[448];
      sub_25771CCF8(v1472, v1473, v1474, v1475, v1476, v1477, v1478, v1479, v1784 | (v1714 << 32));
      *((void *)__dst + 257) = v1472;
      *((void *)__dst + 258) = v1473;
      *((void *)__dst + 259) = v1474;
      *((void *)__dst + 260) = v1475;
      *((void *)__dst + 261) = v1476;
      *((void *)__dst + 262) = v1477;
      *((void *)__dst + 263) = v1478;
      *((void *)__dst + 264) = v1479;
      *((unsigned char *)v1795 + 1796) = v1714;
      v1795[448] = v1784;
      *((void *)__dst + 266) = *((void *)__src + 266);
      *((void *)__dst + 267) = *((void *)__src + 267);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v1468 = *(_OWORD *)(__src + 2072);
      _OWORD *v1384 = *v1385;
      *(_OWORD *)(__dst + 2072) = v1468;
      long long v1469 = *(_OWORD *)(__src + 2088);
      long long v1470 = *(_OWORD *)(__src + 2104);
      long long v1471 = *(_OWORD *)(__src + 2120);
      *((void *)__dst + 267) = *((void *)__src + 267);
      *(_OWORD *)(__dst + 2104) = v1470;
      *(_OWORD *)(__dst + 2120) = v1471;
      *(_OWORD *)(__dst + 2088) = v1469;
    }
    if (!*((void *)__src + 277))
    {
      long long v1480 = *((_OWORD *)__src + 135);
      *((_OWORD *)__dst + 134) = *((_OWORD *)__src + 134);
      *((_OWORD *)__dst + 135) = v1480;
      long long v1481 = *((_OWORD *)__src + 136);
      long long v1482 = *((_OWORD *)__src + 137);
      long long v1483 = *((_OWORD *)__src + 138);
      *((void *)__dst + 278) = *((void *)__src + 278);
      *((_OWORD *)__dst + 137) = v1482;
      *((_OWORD *)__dst + 138) = v1483;
      *((_OWORD *)__dst + 136) = v1481;
      goto LABEL_557;
    }
    goto LABEL_556;
  }
  if (v1387 == 1)
  {
    sub_257735730((uint64_t)(__dst + 2056));
    long long v1444 = *(_OWORD *)(__src + 2072);
    long long v1443 = *(_OWORD *)(__src + 2088);
    _OWORD *v1384 = *v1385;
    *(_OWORD *)(__dst + 2072) = v1444;
    *(_OWORD *)(__dst + 2088) = v1443;
    long long v1445 = *(_OWORD *)(__src + 2152);
    long long v1447 = *(_OWORD *)(__src + 2104);
    long long v1446 = *(_OWORD *)(__src + 2120);
    *(_OWORD *)(__dst + 2136) = *(_OWORD *)(__src + 2136);
    *(_OWORD *)(__dst + 2152) = v1445;
    *(_OWORD *)(__dst + 2104) = v1447;
    *(_OWORD *)(__dst + 2120) = v1446;
    long long v1448 = *(_OWORD *)(__src + 2216);
    long long v1450 = *(_OWORD *)(__src + 2168);
    long long v1449 = *(_OWORD *)(__src + 2184);
    *(_OWORD *)(__dst + 2200) = *(_OWORD *)(__src + 2200);
    *(_OWORD *)(__dst + 2216) = v1448;
    *(_OWORD *)(__dst + 2168) = v1450;
    *(_OWORD *)(__dst + 2184) = v1449;
    goto LABEL_557;
  }
  if (v1386)
  {
    if (v1387)
    {
      uint64_t v1451 = *((void *)__src + 258);
      uint64_t v1452 = *((void *)__src + 259);
      uint64_t v1453 = *((void *)__src + 260);
      uint64_t v1454 = *((void *)__src + 261);
      uint64_t v1455 = *((void *)__src + 262);
      uint64_t v1456 = *((void *)__src + 263);
      uint64_t v1457 = *((void *)__src + 264);
      uint64_t v1713 = *((void *)__src + 257);
      uint64_t v1783 = *((unsigned __int8 *)v1793 + 1796);
      uint64_t v1458 = v1793[448];
      sub_25771CCF8(v1713, v1451, v1452, v1453, v1454, v1455, v1456, v1457, v1458 | (v1783 << 32));
      uint64_t v1459 = *((void *)__dst + 257);
      uint64_t v1460 = *((void *)__dst + 258);
      uint64_t v1461 = *((void *)__dst + 259);
      uint64_t v1462 = *((void *)__dst + 260);
      uint64_t v1463 = *((void *)__dst + 261);
      uint64_t v1464 = *((void *)__dst + 262);
      uint64_t v1465 = *((void *)__dst + 263);
      uint64_t v1466 = *((void *)__dst + 264);
      unint64_t v1467 = v1795[448] | ((unint64_t)*((unsigned __int8 *)v1795 + 1796) << 32);
      *((void *)__dst + 257) = v1713;
      *((void *)__dst + 258) = v1451;
      *((void *)__dst + 259) = v1452;
      *((void *)__dst + 260) = v1453;
      *((void *)__dst + 261) = v1454;
      *((void *)__dst + 262) = v1455;
      *((void *)__dst + 263) = v1456;
      *((void *)__dst + 264) = v1457;
      v1795[448] = v1458;
      *((unsigned char *)v1795 + 1796) = v1783;
      sub_25771D110(v1459, v1460, v1461, v1462, v1463, v1464, v1465, v1466, v1467);
      *((void *)__dst + 266) = *((void *)__src + 266);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 267) = *((void *)__src + 267);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 2056), &qword_26A030F50);
      long long v1496 = *(_OWORD *)(__src + 2072);
      _OWORD *v1384 = *v1385;
      *(_OWORD *)(__dst + 2072) = v1496;
      long long v1498 = *(_OWORD *)(__src + 2104);
      long long v1497 = *(_OWORD *)(__src + 2120);
      long long v1499 = *(_OWORD *)(__src + 2088);
      *((void *)__dst + 267) = *((void *)__src + 267);
      *(_OWORD *)(__dst + 2104) = v1498;
      *(_OWORD *)(__dst + 2120) = v1497;
      *(_OWORD *)(__dst + 2088) = v1499;
    }
  }
  else if (v1387)
  {
    uint64_t v1484 = *((void *)__src + 257);
    uint64_t v1485 = *((void *)__src + 258);
    uint64_t v1486 = *((void *)__src + 259);
    uint64_t v1487 = *((void *)__src + 260);
    uint64_t v1488 = *((void *)__src + 261);
    uint64_t v1489 = *((void *)__src + 262);
    uint64_t v1490 = *((void *)__src + 263);
    uint64_t v1491 = *((void *)__src + 264);
    uint64_t v1715 = *((unsigned __int8 *)v1793 + 1796);
    uint64_t v1785 = v1793[448];
    sub_25771CCF8(v1484, v1485, v1486, v1487, v1488, v1489, v1490, v1491, v1785 | (v1715 << 32));
    *((void *)__dst + 257) = v1484;
    *((void *)__dst + 258) = v1485;
    *((void *)__dst + 259) = v1486;
    *((void *)__dst + 260) = v1487;
    *((void *)__dst + 261) = v1488;
    *((void *)__dst + 262) = v1489;
    *((void *)__dst + 263) = v1490;
    *((void *)__dst + 264) = v1491;
    *((unsigned char *)v1795 + 1796) = v1715;
    v1795[448] = v1785;
    *((void *)__dst + 266) = *((void *)__src + 266);
    *((void *)__dst + 267) = *((void *)__src + 267);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v1504 = *(_OWORD *)(__src + 2072);
    _OWORD *v1384 = *v1385;
    *(_OWORD *)(__dst + 2072) = v1504;
    long long v1505 = *(_OWORD *)(__src + 2088);
    long long v1506 = *(_OWORD *)(__src + 2104);
    long long v1507 = *(_OWORD *)(__src + 2120);
    *((void *)__dst + 267) = *((void *)__src + 267);
    *(_OWORD *)(__dst + 2104) = v1506;
    *(_OWORD *)(__dst + 2120) = v1507;
    *(_OWORD *)(__dst + 2088) = v1505;
  }
  v1508 = __dst + 2144;
  v1509 = __src + 2144;
  uint64_t v1510 = *((void *)__src + 277);
  if (*((void *)__dst + 277))
  {
    if (v1510)
    {
      uint64_t v1511 = *((void *)__src + 269);
      uint64_t v1512 = *((void *)__src + 270);
      uint64_t v1513 = *((void *)__src + 271);
      uint64_t v1514 = *((void *)__src + 272);
      uint64_t v1515 = *((void *)__src + 273);
      uint64_t v1516 = *((void *)__src + 274);
      uint64_t v1517 = *((void *)__src + 275);
      uint64_t v1716 = *((void *)__src + 268);
      uint64_t v1786 = *((unsigned __int8 *)v1793 + 1884);
      uint64_t v1518 = v1793[470];
      sub_25771CCF8(v1716, v1511, v1512, v1513, v1514, v1515, v1516, v1517, v1518 | (v1786 << 32));
      uint64_t v1519 = *((void *)__dst + 268);
      uint64_t v1520 = *((void *)__dst + 269);
      uint64_t v1521 = *((void *)__dst + 270);
      uint64_t v1522 = *((void *)__dst + 271);
      uint64_t v1523 = *((void *)__dst + 272);
      uint64_t v1524 = *((void *)__dst + 273);
      uint64_t v1525 = *((void *)__dst + 274);
      uint64_t v1526 = *((void *)__dst + 275);
      unint64_t v1527 = v1795[470] | ((unint64_t)*((unsigned __int8 *)v1795 + 1884) << 32);
      *((void *)__dst + 268) = v1716;
      *((void *)__dst + 269) = v1511;
      *((void *)__dst + 270) = v1512;
      *((void *)__dst + 271) = v1513;
      *((void *)__dst + 272) = v1514;
      *((void *)__dst + 273) = v1515;
      *((void *)__dst + 274) = v1516;
      *((void *)__dst + 275) = v1517;
      v1795[470] = v1518;
      *((unsigned char *)v1795 + 1884) = v1786;
      sub_25771D110(v1519, v1520, v1521, v1522, v1523, v1524, v1525, v1526, v1527);
      *((void *)__dst + 277) = *((void *)__src + 277);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 278) = *((void *)__src + 278);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 2144), &qword_26A030F50);
      long long v1606 = *((_OWORD *)__src + 135);
      _OWORD *v1508 = *v1509;
      *((_OWORD *)__dst + 135) = v1606;
      long long v1608 = *((_OWORD *)__src + 137);
      long long v1607 = *((_OWORD *)__src + 138);
      long long v1609 = *((_OWORD *)__src + 136);
      *((void *)__dst + 278) = *((void *)__src + 278);
      *((_OWORD *)__dst + 137) = v1608;
      *((_OWORD *)__dst + 138) = v1607;
      *((_OWORD *)__dst + 136) = v1609;
    }
  }
  else
  {
    if (v1510)
    {
LABEL_556:
      uint64_t v1528 = *((void *)__src + 268);
      uint64_t v1529 = *((void *)__src + 269);
      uint64_t v1530 = *((void *)__src + 270);
      uint64_t v1531 = *((void *)__src + 271);
      uint64_t v1532 = *((void *)__src + 272);
      uint64_t v1533 = *((void *)__src + 273);
      uint64_t v1534 = *((void *)__src + 274);
      uint64_t v1535 = *((void *)__src + 275);
      uint64_t v1717 = *((unsigned __int8 *)v1793 + 1884);
      uint64_t v1787 = v1793[470];
      sub_25771CCF8(v1528, v1529, v1530, v1531, v1532, v1533, v1534, v1535, v1787 | (v1717 << 32));
      *((void *)__dst + 268) = v1528;
      *((void *)__dst + 269) = v1529;
      *((void *)__dst + 270) = v1530;
      *((void *)__dst + 271) = v1531;
      *((void *)__dst + 272) = v1532;
      *((void *)__dst + 273) = v1533;
      *((void *)__dst + 274) = v1534;
      *((void *)__dst + 275) = v1535;
      *((unsigned char *)v1795 + 1884) = v1717;
      v1795[470] = v1787;
      *((void *)__dst + 277) = *((void *)__src + 277);
      *((void *)__dst + 278) = *((void *)__src + 278);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_557;
    }
    long long v1614 = *((_OWORD *)__src + 135);
    _OWORD *v1508 = *v1509;
    *((_OWORD *)__dst + 135) = v1614;
    long long v1615 = *((_OWORD *)__src + 136);
    long long v1616 = *((_OWORD *)__src + 137);
    long long v1617 = *((_OWORD *)__src + 138);
    *((void *)__dst + 278) = *((void *)__src + 278);
    *((_OWORD *)__dst + 137) = v1616;
    *((_OWORD *)__dst + 138) = v1617;
    *((_OWORD *)__dst + 136) = v1615;
  }
LABEL_557:
  v1536 = __dst + 2232;
  v1537 = __src + 2232;
  uint64_t v1538 = *((void *)__dst + 288);
  uint64_t v1539 = *((void *)__src + 288);
  if (v1538 == 1)
  {
    if (!v1539)
    {
      long long v1589 = *(_OWORD *)(__src + 2248);
      _OWORD *v1536 = *v1537;
      *(_OWORD *)(__dst + 2248) = v1589;
      long long v1590 = *(_OWORD *)(__src + 2264);
      long long v1591 = *(_OWORD *)(__src + 2280);
      long long v1592 = *(_OWORD *)(__src + 2296);
      *((void *)__dst + 289) = *((void *)__src + 289);
      *(_OWORD *)(__dst + 2280) = v1591;
      *(_OWORD *)(__dst + 2296) = v1592;
      *(_OWORD *)(__dst + 2264) = v1590;
      if (*((void *)__src + 299)) {
        goto LABEL_562;
      }
      goto LABEL_569;
    }
    if (v1539 == 1)
    {
      long long v1540 = *v1537;
      long long v1541 = *(_OWORD *)(__src + 2264);
      *(_OWORD *)(__dst + 2248) = *(_OWORD *)(__src + 2248);
      *(_OWORD *)(__dst + 2264) = v1541;
      _OWORD *v1536 = v1540;
      long long v1542 = *(_OWORD *)(__src + 2280);
      long long v1543 = *(_OWORD *)(__src + 2296);
      long long v1544 = *(_OWORD *)(__src + 2328);
      *(_OWORD *)(__dst + 2312) = *(_OWORD *)(__src + 2312);
      *(_OWORD *)(__dst + 2328) = v1544;
      *(_OWORD *)(__dst + 2280) = v1542;
      *(_OWORD *)(__dst + 2296) = v1543;
      long long v1545 = *(_OWORD *)(__src + 2344);
      long long v1546 = *(_OWORD *)(__src + 2360);
      long long v1547 = *(_OWORD *)(__src + 2392);
      *(_OWORD *)(__dst + 2376) = *(_OWORD *)(__src + 2376);
      *(_OWORD *)(__dst + 2392) = v1547;
      *(_OWORD *)(__dst + 2344) = v1545;
      *(_OWORD *)(__dst + 2360) = v1546;
      return __dst;
    }
    goto LABEL_561;
  }
  if (v1539 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 2232));
    long long v1565 = *(_OWORD *)(__src + 2248);
    long long v1564 = *(_OWORD *)(__src + 2264);
    _OWORD *v1536 = *v1537;
    *(_OWORD *)(__dst + 2248) = v1565;
    *(_OWORD *)(__dst + 2264) = v1564;
    long long v1566 = *(_OWORD *)(__src + 2328);
    long long v1568 = *(_OWORD *)(__src + 2280);
    long long v1567 = *(_OWORD *)(__src + 2296);
    *(_OWORD *)(__dst + 2312) = *(_OWORD *)(__src + 2312);
    *(_OWORD *)(__dst + 2328) = v1566;
    *(_OWORD *)(__dst + 2280) = v1568;
    *(_OWORD *)(__dst + 2296) = v1567;
    long long v1569 = *(_OWORD *)(__src + 2392);
    long long v1571 = *(_OWORD *)(__src + 2344);
    long long v1570 = *(_OWORD *)(__src + 2360);
    *(_OWORD *)(__dst + 2376) = *(_OWORD *)(__src + 2376);
    *(_OWORD *)(__dst + 2392) = v1569;
    *(_OWORD *)(__dst + 2344) = v1571;
    *(_OWORD *)(__dst + 2360) = v1570;
    return __dst;
  }
  if (v1538)
  {
    if (v1539)
    {
      uint64_t v1572 = *((void *)__src + 280);
      uint64_t v1573 = *((void *)__src + 281);
      uint64_t v1574 = *((void *)__src + 282);
      uint64_t v1575 = *((void *)__src + 283);
      uint64_t v1576 = *((void *)__src + 284);
      uint64_t v1577 = *((void *)__src + 285);
      uint64_t v1578 = *((void *)__src + 286);
      uint64_t v1719 = *((void *)__src + 279);
      uint64_t v1790 = *((unsigned __int8 *)v1793 + 1972);
      uint64_t v1579 = v1793[492];
      sub_25771CCF8(v1719, v1572, v1573, v1574, v1575, v1576, v1577, v1578, v1579 | (v1790 << 32));
      uint64_t v1580 = *((void *)__dst + 279);
      uint64_t v1581 = *((void *)__dst + 280);
      uint64_t v1582 = *((void *)__dst + 281);
      uint64_t v1583 = *((void *)__dst + 282);
      uint64_t v1584 = *((void *)__dst + 283);
      uint64_t v1585 = *((void *)__dst + 284);
      uint64_t v1586 = *((void *)__dst + 285);
      uint64_t v1587 = *((void *)__dst + 286);
      unint64_t v1588 = v1795[492] | ((unint64_t)*((unsigned __int8 *)v1795 + 1972) << 32);
      *((void *)__dst + 279) = v1719;
      *((void *)__dst + 280) = v1572;
      *((void *)__dst + 281) = v1573;
      *((void *)__dst + 282) = v1574;
      *((void *)__dst + 283) = v1575;
      *((void *)__dst + 284) = v1576;
      *((void *)__dst + 285) = v1577;
      *((void *)__dst + 286) = v1578;
      v1795[492] = v1579;
      *((unsigned char *)v1795 + 1972) = v1790;
      sub_25771D110(v1580, v1581, v1582, v1583, v1584, v1585, v1586, v1587, v1588);
      *((void *)__dst + 288) = *((void *)__src + 288);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 289) = *((void *)__src + 289);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 2232), &qword_26A030F50);
      long long v1610 = *(_OWORD *)(__src + 2248);
      _OWORD *v1536 = *v1537;
      *(_OWORD *)(__dst + 2248) = v1610;
      long long v1612 = *(_OWORD *)(__src + 2280);
      long long v1611 = *(_OWORD *)(__src + 2296);
      long long v1613 = *(_OWORD *)(__src + 2264);
      *((void *)__dst + 289) = *((void *)__src + 289);
      *(_OWORD *)(__dst + 2280) = v1612;
      *(_OWORD *)(__dst + 2296) = v1611;
      *(_OWORD *)(__dst + 2264) = v1613;
    }
  }
  else if (v1539)
  {
    uint64_t v1598 = *((void *)__src + 279);
    uint64_t v1599 = *((void *)__src + 280);
    uint64_t v1600 = *((void *)__src + 281);
    uint64_t v1601 = *((void *)__src + 282);
    uint64_t v1602 = *((void *)__src + 283);
    uint64_t v1603 = *((void *)__src + 284);
    uint64_t v1604 = *((void *)__src + 285);
    uint64_t v1605 = *((void *)__src + 286);
    uint64_t v1720 = *((unsigned __int8 *)v1793 + 1972);
    uint64_t v1791 = v1793[492];
    sub_25771CCF8(v1598, v1599, v1600, v1601, v1602, v1603, v1604, v1605, v1791 | (v1720 << 32));
    *((void *)__dst + 279) = v1598;
    *((void *)__dst + 280) = v1599;
    *((void *)__dst + 281) = v1600;
    *((void *)__dst + 282) = v1601;
    *((void *)__dst + 283) = v1602;
    *((void *)__dst + 284) = v1603;
    *((void *)__dst + 285) = v1604;
    *((void *)__dst + 286) = v1605;
    *((unsigned char *)v1795 + 1972) = v1720;
    v1795[492] = v1791;
    *((void *)__dst + 288) = *((void *)__src + 288);
    *((void *)__dst + 289) = *((void *)__src + 289);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v1618 = *(_OWORD *)(__src + 2248);
    _OWORD *v1536 = *v1537;
    *(_OWORD *)(__dst + 2248) = v1618;
    long long v1619 = *(_OWORD *)(__src + 2264);
    long long v1620 = *(_OWORD *)(__src + 2280);
    long long v1621 = *(_OWORD *)(__src + 2296);
    *((void *)__dst + 289) = *((void *)__src + 289);
    *(_OWORD *)(__dst + 2280) = v1620;
    *(_OWORD *)(__dst + 2296) = v1621;
    *(_OWORD *)(__dst + 2264) = v1619;
  }
  v1622 = __dst + 2320;
  v1623 = __src + 2320;
  uint64_t v1624 = *((void *)__src + 299);
  if (!*((void *)__dst + 299))
  {
    if (!v1624)
    {
      long long v1642 = *((_OWORD *)__src + 146);
      _OWORD *v1622 = *v1623;
      *((_OWORD *)__dst + 146) = v1642;
      long long v1643 = *((_OWORD *)__src + 147);
      long long v1644 = *((_OWORD *)__src + 148);
      long long v1645 = *((_OWORD *)__src + 149);
      *((void *)__dst + 300) = *((void *)__src + 300);
      *((_OWORD *)__dst + 148) = v1644;
      *((_OWORD *)__dst + 149) = v1645;
      *((_OWORD *)__dst + 147) = v1643;
      return __dst;
    }
    goto LABEL_562;
  }
  if (v1624)
  {
    uint64_t v1625 = *((void *)__src + 291);
    uint64_t v1626 = *((void *)__src + 292);
    uint64_t v1627 = *((void *)__src + 293);
    uint64_t v1628 = *((void *)__src + 294);
    uint64_t v1629 = *((void *)__src + 295);
    uint64_t v1630 = *((void *)__src + 296);
    uint64_t v1631 = *((void *)__src + 297);
    uint64_t v1721 = *((void *)__src + 290);
    uint64_t v1792 = *((unsigned __int8 *)v1793 + 2060);
    uint64_t v1632 = v1793[514];
    sub_25771CCF8(v1721, v1625, v1626, v1627, v1628, v1629, v1630, v1631, v1632 | (v1792 << 32));
    uint64_t v1633 = *((void *)__dst + 290);
    uint64_t v1634 = *((void *)__dst + 291);
    uint64_t v1635 = *((void *)__dst + 292);
    uint64_t v1636 = *((void *)__dst + 293);
    uint64_t v1637 = *((void *)__dst + 294);
    uint64_t v1638 = *((void *)__dst + 295);
    uint64_t v1639 = *((void *)__dst + 296);
    uint64_t v1640 = *((void *)__dst + 297);
    unint64_t v1641 = v1795[514] | ((unint64_t)*((unsigned __int8 *)v1795 + 2060) << 32);
    *((void *)__dst + 290) = v1721;
    *((void *)__dst + 291) = v1625;
    *((void *)__dst + 292) = v1626;
    *((void *)__dst + 293) = v1627;
    *((void *)__dst + 294) = v1628;
    *((void *)__dst + 295) = v1629;
    *((void *)__dst + 296) = v1630;
    *((void *)__dst + 297) = v1631;
    v1795[514] = v1632;
    *((unsigned char *)v1795 + 2060) = v1792;
    sub_25771D110(v1633, v1634, v1635, v1636, v1637, v1638, v1639, v1640, v1641);
    *((void *)__dst + 299) = *((void *)__src + 299);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)__dst + 300) = *((void *)__src + 300);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2577270D4((uint64_t)(__dst + 2320), &qword_26A030F50);
    long long v1646 = *((_OWORD *)__src + 146);
    _OWORD *v1622 = *v1623;
    *((_OWORD *)__dst + 146) = v1646;
    long long v1648 = *((_OWORD *)__src + 148);
    long long v1647 = *((_OWORD *)__src + 149);
    long long v1649 = *((_OWORD *)__src + 147);
    *((void *)__dst + 300) = *((void *)__src + 300);
    *((_OWORD *)__dst + 148) = v1648;
    *((_OWORD *)__dst + 149) = v1647;
    *((_OWORD *)__dst + 147) = v1649;
  }
  return __dst;
}

void *__swift_memcpy2408_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x968uLL);
}

char *assignWithTake for ActivityFlexibleUpdateTheme(char *__dst, char *__src)
{
  uint64_t v4 = __dst + 264;
  uint64_t v5 = __src + 264;
  uint64_t v6 = *((void *)__dst + 9);
  if (v6 == 3) {
    goto LABEL_4;
  }
  uint64_t v7 = *((void *)__src + 9);
  if (v7 == 3)
  {
    sub_2577FDDB4((uint64_t)__dst);
LABEL_4:
    size_t v8 = __dst;
    long long v9 = __src;
    size_t v10 = 704;
LABEL_21:
    memcpy(v8, v9, v10);
    goto LABEL_22;
  }
  if (v6 == 2) {
    goto LABEL_8;
  }
  if (v7 == 2)
  {
    sub_2577FDD60((uint64_t)__dst);
LABEL_8:
    memcpy(__dst, __src, 0x160uLL);
    goto LABEL_17;
  }
  if (v6 == 1) {
    goto LABEL_12;
  }
  if (v7 == 1)
  {
    sub_257735730((uint64_t)__dst);
LABEL_12:
    long long v11 = *((_OWORD *)__src + 9);
    *((_OWORD *)__dst + 8) = *((_OWORD *)__src + 8);
    *((_OWORD *)__dst + 9) = v11;
    *((_OWORD *)__dst + 10) = *((_OWORD *)__src + 10);
    long long v12 = *((_OWORD *)__src + 5);
    *((_OWORD *)__dst + 4) = *((_OWORD *)__src + 4);
    *((_OWORD *)__dst + 5) = v12;
    long long v13 = *((_OWORD *)__src + 7);
    *((_OWORD *)__dst + 6) = *((_OWORD *)__src + 6);
    *((_OWORD *)__dst + 7) = v13;
    long long v14 = *((_OWORD *)__src + 1);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v14;
    long long v15 = *((_OWORD *)__src + 3);
    *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
    *((_OWORD *)__dst + 3) = v15;
    goto LABEL_13;
  }
  if (v6)
  {
    if (v7)
    {
      char v214 = __src[68];
      int v215 = *((_DWORD *)__src + 16);
      uint64_t v216 = *(void *)__dst;
      uint64_t v217 = *((void *)__dst + 1);
      uint64_t v218 = *((void *)__dst + 2);
      uint64_t v219 = *((void *)__dst + 3);
      uint64_t v220 = *((void *)__dst + 4);
      uint64_t v221 = *((void *)__dst + 5);
      uint64_t v222 = *((void *)__dst + 6);
      uint64_t v223 = *((void *)__dst + 7);
      unint64_t v224 = *((unsigned int *)__dst + 16) | ((unint64_t)__dst[68] << 32);
      long long v225 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v225;
      long long v226 = *((_OWORD *)__src + 3);
      *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
      *((_OWORD *)__dst + 3) = v226;
      *((_DWORD *)__dst + 16) = v215;
      __dst[68] = v214;
      sub_25771D110(v216, v217, v218, v219, v220, v221, v222, v223, v224);
      *((void *)__dst + 9) = *((void *)__src + 9);
      swift_bridgeObjectRelease();
      *((void *)__dst + 10) = *((void *)__src + 10);
      swift_bridgeObjectRelease();
      goto LABEL_236;
    }
    sub_2577270D4((uint64_t)__dst, &qword_26A030F50);
  }
  long long v318 = *((_OWORD *)__src + 3);
  *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
  *((_OWORD *)__dst + 3) = v318;
  *((_OWORD *)__dst + 4) = *((_OWORD *)__src + 4);
  *((void *)__dst + 10) = *((void *)__src + 10);
  long long v319 = *((_OWORD *)__src + 1);
  *(_OWORD *)__dst = *(_OWORD *)__src;
  *((_OWORD *)__dst + 1) = v319;
LABEL_236:
  if (*((void *)__dst + 20))
  {
    if (*((void *)__src + 20))
    {
      char v320 = __src[156];
      int v321 = *((_DWORD *)__src + 38);
      uint64_t v322 = *((void *)__dst + 11);
      uint64_t v323 = *((void *)__dst + 12);
      uint64_t v324 = *((void *)__dst + 13);
      uint64_t v325 = *((void *)__dst + 14);
      uint64_t v326 = *((void *)__dst + 15);
      uint64_t v327 = *((void *)__dst + 16);
      uint64_t v328 = *((void *)__dst + 17);
      uint64_t v329 = *((void *)__dst + 18);
      unint64_t v330 = *((unsigned int *)__dst + 38) | ((unint64_t)__dst[156] << 32);
      long long v331 = *(_OWORD *)(__src + 104);
      *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
      *(_OWORD *)(__dst + 104) = v331;
      long long v332 = *(_OWORD *)(__src + 136);
      *(_OWORD *)(__dst + 120) = *(_OWORD *)(__src + 120);
      *(_OWORD *)(__dst + 136) = v332;
      *((_DWORD *)__dst + 38) = v321;
      __dst[156] = v320;
      sub_25771D110(v322, v323, v324, v325, v326, v327, v328, v329, v330);
      *((void *)__dst + 20) = *((void *)__src + 20);
      swift_bridgeObjectRelease();
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    sub_2577270D4((uint64_t)(__dst + 88), &qword_26A030F50);
  }
  long long v430 = *(_OWORD *)(__src + 136);
  *(_OWORD *)(__dst + 120) = *(_OWORD *)(__src + 120);
  *(_OWORD *)(__dst + 136) = v430;
  *(_OWORD *)(__dst + 152) = *(_OWORD *)(__src + 152);
  *((void *)__dst + 21) = *((void *)__src + 21);
  long long v431 = *(_OWORD *)(__src + 104);
  *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
  *(_OWORD *)(__dst + 104) = v431;
LABEL_13:
  long long v16 = __dst + 176;
  long long v17 = __src + 176;
  uint64_t v18 = *((void *)__dst + 31);
  if (v18 == 1)
  {
LABEL_16:
    long long v20 = *((_OWORD *)__src + 20);
    *((_OWORD *)__dst + 19) = *((_OWORD *)__src + 19);
    *((_OWORD *)__dst + 20) = v20;
    *((_OWORD *)__dst + 21) = *((_OWORD *)__src + 21);
    long long v21 = *((_OWORD *)__src + 16);
    *((_OWORD *)__dst + 15) = *((_OWORD *)__src + 15);
    *((_OWORD *)__dst + 16) = v21;
    long long v22 = *((_OWORD *)__src + 18);
    *((_OWORD *)__dst + 17) = *((_OWORD *)__src + 17);
    *((_OWORD *)__dst + 18) = v22;
    long long v23 = *((_OWORD *)__src + 12);
    *long long v16 = *v17;
    *((_OWORD *)__dst + 12) = v23;
    long long v24 = *((_OWORD *)__src + 14);
    *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
    *((_OWORD *)__dst + 14) = v24;
    goto LABEL_17;
  }
  uint64_t v19 = *((void *)__src + 31);
  if (v19 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 176));
    goto LABEL_16;
  }
  if (v18)
  {
    if (v19)
    {
      char v227 = __src[244];
      int v228 = *((_DWORD *)__src + 60);
      uint64_t v229 = *((void *)__dst + 22);
      uint64_t v230 = *((void *)__dst + 23);
      uint64_t v231 = *((void *)__dst + 24);
      uint64_t v232 = *((void *)__dst + 25);
      uint64_t v233 = *((void *)__dst + 26);
      uint64_t v234 = *((void *)__dst + 27);
      uint64_t v235 = *((void *)__dst + 28);
      uint64_t v236 = *((void *)__dst + 29);
      unint64_t v237 = *((unsigned int *)__dst + 60) | ((unint64_t)__dst[244] << 32);
      long long v238 = *((_OWORD *)__src + 12);
      *((_OWORD *)__dst + 11) = *((_OWORD *)__src + 11);
      *((_OWORD *)__dst + 12) = v238;
      long long v239 = *((_OWORD *)__src + 14);
      *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
      *((_OWORD *)__dst + 14) = v239;
      *((_DWORD *)__dst + 60) = v228;
      __dst[244] = v227;
      sub_25771D110(v229, v230, v231, v232, v233, v234, v235, v236, v237);
      *((void *)__dst + 31) = *((void *)__src + 31);
      swift_bridgeObjectRelease();
      *((void *)__dst + 32) = *((void *)__src + 32);
      swift_bridgeObjectRelease();
      goto LABEL_241;
    }
    sub_2577270D4((uint64_t)(__dst + 176), &qword_26A030F50);
  }
  long long v333 = *((_OWORD *)__src + 14);
  *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
  *((_OWORD *)__dst + 14) = v333;
  *((_OWORD *)__dst + 15) = *((_OWORD *)__src + 15);
  *((void *)__dst + 32) = *((void *)__src + 32);
  long long v334 = *((_OWORD *)__src + 12);
  *long long v16 = *v17;
  *((_OWORD *)__dst + 12) = v334;
LABEL_241:
  if (*((void *)__dst + 42))
  {
    if (*((void *)__src + 42))
    {
      char v335 = v5[68];
      int v336 = *((_DWORD *)v5 + 16);
      uint64_t v337 = *((void *)__dst + 33);
      uint64_t v338 = *((void *)__dst + 34);
      uint64_t v339 = *((void *)__dst + 35);
      uint64_t v340 = *((void *)__dst + 36);
      uint64_t v341 = *((void *)__dst + 37);
      uint64_t v342 = *((void *)__dst + 38);
      uint64_t v343 = *((void *)__dst + 39);
      uint64_t v344 = *((void *)__dst + 40);
      unint64_t v345 = *((unsigned int *)v4 + 16) | ((unint64_t)v4[68] << 32);
      long long v346 = *((_OWORD *)v5 + 1);
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
      *((_OWORD *)v4 + 1) = v346;
      long long v347 = *((_OWORD *)v5 + 3);
      *((_OWORD *)v4 + 2) = *((_OWORD *)v5 + 2);
      *((_OWORD *)v4 + 3) = v347;
      *((_DWORD *)v4 + 16) = v336;
      v4[68] = v335;
      sub_25771D110(v337, v338, v339, v340, v341, v342, v343, v344, v345);
      *((void *)__dst + 42) = *((void *)__src + 42);
      swift_bridgeObjectRelease();
      *((void *)__dst + 43) = *((void *)__src + 43);
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    sub_2577270D4((uint64_t)v4, &qword_26A030F50);
  }
  long long v432 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v4 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v4 + 3) = v432;
  *((_OWORD *)v4 + 4) = *((_OWORD *)v5 + 4);
  *((void *)v4 + 10) = *((void *)v5 + 10);
  long long v433 = *((_OWORD *)v5 + 1);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
  *((_OWORD *)v4 + 1) = v433;
LABEL_17:
  uint64_t v25 = __dst + 352;
  uint64_t v26 = __src + 352;
  uint64_t v27 = *((void *)__dst + 53);
  if (v27 == 2)
  {
LABEL_20:
    size_t v8 = __dst + 352;
    long long v9 = __src + 352;
    size_t v10 = 352;
    goto LABEL_21;
  }
  uint64_t v28 = *((void *)__src + 53);
  if (v28 == 2)
  {
    sub_2577FDD60((uint64_t)(__dst + 352));
    goto LABEL_20;
  }
  if (v27 == 1) {
    goto LABEL_183;
  }
  if (v28 == 1)
  {
    sub_257735730((uint64_t)(__dst + 352));
LABEL_183:
    long long v167 = *((_OWORD *)__src + 31);
    *((_OWORD *)__dst + 30) = *((_OWORD *)__src + 30);
    *((_OWORD *)__dst + 31) = v167;
    *((_OWORD *)__dst + 32) = *((_OWORD *)__src + 32);
    long long v168 = *((_OWORD *)__src + 27);
    *((_OWORD *)__dst + 26) = *((_OWORD *)__src + 26);
    *((_OWORD *)__dst + 27) = v168;
    long long v169 = *((_OWORD *)__src + 29);
    *((_OWORD *)__dst + 28) = *((_OWORD *)__src + 28);
    *((_OWORD *)__dst + 29) = v169;
    long long v170 = *((_OWORD *)__src + 23);
    *uint64_t v25 = *v26;
    *((_OWORD *)__dst + 23) = v170;
    long long v171 = *((_OWORD *)__src + 25);
    *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
    *((_OWORD *)__dst + 25) = v171;
    goto LABEL_184;
  }
  if (v27)
  {
    if (v28)
    {
      char v240 = v5[156];
      int v241 = *((_DWORD *)v5 + 38);
      uint64_t v242 = *((void *)__dst + 44);
      uint64_t v243 = *((void *)__dst + 45);
      uint64_t v244 = *((void *)__dst + 46);
      uint64_t v245 = *((void *)__dst + 47);
      uint64_t v246 = *((void *)__dst + 48);
      uint64_t v247 = *((void *)__dst + 49);
      uint64_t v248 = *((void *)__dst + 50);
      uint64_t v249 = *((void *)__dst + 51);
      unint64_t v250 = *((unsigned int *)v4 + 38) | ((unint64_t)v4[156] << 32);
      long long v251 = *((_OWORD *)__src + 23);
      *((_OWORD *)__dst + 22) = *((_OWORD *)__src + 22);
      *((_OWORD *)__dst + 23) = v251;
      long long v252 = *((_OWORD *)__src + 25);
      *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
      *((_OWORD *)__dst + 25) = v252;
      *((_DWORD *)v4 + 38) = v241;
      v4[156] = v240;
      sub_25771D110(v242, v243, v244, v245, v246, v247, v248, v249, v250);
      *((void *)__dst + 53) = *((void *)__src + 53);
      swift_bridgeObjectRelease();
      *((void *)__dst + 54) = *((void *)__src + 54);
      swift_bridgeObjectRelease();
      goto LABEL_246;
    }
    sub_2577270D4((uint64_t)(__dst + 352), &qword_26A030F50);
  }
  long long v348 = *((_OWORD *)__src + 25);
  *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
  *((_OWORD *)__dst + 25) = v348;
  *((_OWORD *)__dst + 26) = *((_OWORD *)__src + 26);
  *((void *)__dst + 54) = *((void *)__src + 54);
  long long v349 = *((_OWORD *)__src + 23);
  *uint64_t v25 = *v26;
  *((_OWORD *)__dst + 23) = v349;
LABEL_246:
  if (*((void *)__dst + 64))
  {
    if (*((void *)__src + 64))
    {
      char v350 = v5[244];
      int v351 = *((_DWORD *)v5 + 60);
      uint64_t v352 = *((void *)__dst + 55);
      uint64_t v353 = *((void *)__dst + 56);
      uint64_t v354 = *((void *)__dst + 57);
      uint64_t v355 = *((void *)__dst + 58);
      uint64_t v356 = *((void *)__dst + 59);
      uint64_t v357 = *((void *)__dst + 60);
      uint64_t v358 = *((void *)__dst + 61);
      uint64_t v359 = *((void *)__dst + 62);
      unint64_t v360 = *((unsigned int *)v4 + 60) | ((unint64_t)v4[244] << 32);
      long long v361 = *((_OWORD *)v5 + 12);
      *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 11);
      *((_OWORD *)v4 + 12) = v361;
      long long v362 = *((_OWORD *)v5 + 14);
      *((_OWORD *)v4 + 13) = *((_OWORD *)v5 + 13);
      *((_OWORD *)v4 + 14) = v362;
      *((_DWORD *)v4 + 60) = v351;
      v4[244] = v350;
      sub_25771D110(v352, v353, v354, v355, v356, v357, v358, v359, v360);
      *((void *)__dst + 64) = *((void *)__src + 64);
      swift_bridgeObjectRelease();
      *((void *)__dst + 65) = *((void *)__src + 65);
      swift_bridgeObjectRelease();
      goto LABEL_184;
    }
    sub_2577270D4((uint64_t)(v4 + 176), &qword_26A030F50);
  }
  long long v434 = *((_OWORD *)v5 + 14);
  *((_OWORD *)v4 + 13) = *((_OWORD *)v5 + 13);
  *((_OWORD *)v4 + 14) = v434;
  *((_OWORD *)v4 + 15) = *((_OWORD *)v5 + 15);
  *((void *)v4 + 32) = *((void *)v5 + 32);
  long long v435 = *((_OWORD *)v5 + 12);
  *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 11);
  *((_OWORD *)v4 + 12) = v435;
LABEL_184:
  long long v172 = __dst + 528;
  long long v173 = __src + 528;
  uint64_t v174 = *((void *)__dst + 75);
  if (v174 == 1)
  {
LABEL_187:
    long long v176 = *((_OWORD *)__src + 42);
    *((_OWORD *)__dst + 41) = *((_OWORD *)__src + 41);
    *((_OWORD *)__dst + 42) = v176;
    *((_OWORD *)__dst + 43) = *((_OWORD *)__src + 43);
    long long v177 = *((_OWORD *)__src + 38);
    *((_OWORD *)__dst + 37) = *((_OWORD *)__src + 37);
    *((_OWORD *)__dst + 38) = v177;
    long long v178 = *((_OWORD *)__src + 40);
    *((_OWORD *)__dst + 39) = *((_OWORD *)__src + 39);
    *((_OWORD *)__dst + 40) = v178;
    long long v179 = *((_OWORD *)__src + 34);
    *long long v172 = *v173;
    *((_OWORD *)__dst + 34) = v179;
    long long v180 = *((_OWORD *)__src + 36);
    *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
    *((_OWORD *)__dst + 36) = v180;
    goto LABEL_22;
  }
  uint64_t v175 = *((void *)__src + 75);
  if (v175 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 528));
    goto LABEL_187;
  }
  if (v174)
  {
    if (v175)
    {
      char v253 = v5[332];
      int v254 = *((_DWORD *)v5 + 82);
      uint64_t v255 = *((void *)__dst + 66);
      uint64_t v256 = *((void *)__dst + 67);
      uint64_t v257 = *((void *)__dst + 68);
      uint64_t v258 = *((void *)__dst + 69);
      uint64_t v259 = *((void *)__dst + 70);
      uint64_t v260 = *((void *)__dst + 71);
      uint64_t v261 = *((void *)__dst + 72);
      uint64_t v262 = *((void *)__dst + 73);
      unint64_t v263 = *((unsigned int *)v4 + 82) | ((unint64_t)v4[332] << 32);
      long long v264 = *((_OWORD *)__src + 34);
      *((_OWORD *)__dst + 33) = *((_OWORD *)__src + 33);
      *((_OWORD *)__dst + 34) = v264;
      long long v265 = *((_OWORD *)__src + 36);
      *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
      *((_OWORD *)__dst + 36) = v265;
      *((_DWORD *)v4 + 82) = v254;
      v4[332] = v253;
      sub_25771D110(v255, v256, v257, v258, v259, v260, v261, v262, v263);
      *((void *)__dst + 75) = *((void *)__src + 75);
      swift_bridgeObjectRelease();
      *((void *)__dst + 76) = *((void *)__src + 76);
      swift_bridgeObjectRelease();
      goto LABEL_251;
    }
    sub_2577270D4((uint64_t)(__dst + 528), &qword_26A030F50);
  }
  long long v363 = *((_OWORD *)__src + 36);
  *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
  *((_OWORD *)__dst + 36) = v363;
  *((_OWORD *)__dst + 37) = *((_OWORD *)__src + 37);
  *((void *)__dst + 76) = *((void *)__src + 76);
  long long v364 = *((_OWORD *)__src + 34);
  *long long v172 = *v173;
  *((_OWORD *)__dst + 34) = v364;
LABEL_251:
  if (*((void *)__dst + 86))
  {
    if (*((void *)__src + 86))
    {
      char v365 = v5[420];
      int v366 = *((_DWORD *)v5 + 104);
      uint64_t v367 = *((void *)__dst + 77);
      uint64_t v368 = *((void *)__dst + 78);
      uint64_t v369 = *((void *)__dst + 79);
      uint64_t v370 = *((void *)__dst + 80);
      uint64_t v371 = *((void *)__dst + 81);
      uint64_t v372 = *((void *)__dst + 82);
      uint64_t v373 = *((void *)__dst + 83);
      uint64_t v374 = *((void *)__dst + 84);
      unint64_t v375 = *((unsigned int *)v4 + 104) | ((unint64_t)v4[420] << 32);
      long long v376 = *((_OWORD *)v5 + 23);
      *((_OWORD *)v4 + 22) = *((_OWORD *)v5 + 22);
      *((_OWORD *)v4 + 23) = v376;
      long long v377 = *((_OWORD *)v5 + 25);
      *((_OWORD *)v4 + 24) = *((_OWORD *)v5 + 24);
      *((_OWORD *)v4 + 25) = v377;
      *((_DWORD *)v4 + 104) = v366;
      v4[420] = v365;
      sub_25771D110(v367, v368, v369, v370, v371, v372, v373, v374, v375);
      *((void *)__dst + 86) = *((void *)__src + 86);
      swift_bridgeObjectRelease();
      *((void *)__dst + 87) = *((void *)__src + 87);
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    sub_2577270D4((uint64_t)(v4 + 352), &qword_26A030F50);
  }
  long long v436 = *((_OWORD *)v5 + 25);
  *((_OWORD *)v4 + 24) = *((_OWORD *)v5 + 24);
  *((_OWORD *)v4 + 25) = v436;
  *((_OWORD *)v4 + 26) = *((_OWORD *)v5 + 26);
  *((void *)v4 + 54) = *((void *)v5 + 54);
  long long v437 = *((_OWORD *)v5 + 23);
  *((_OWORD *)v4 + 22) = *((_OWORD *)v5 + 22);
  *((_OWORD *)v4 + 23) = v437;
LABEL_22:
  long long v29 = __dst + 704;
  long long v30 = __src + 704;
  if (!*((void *)__dst + 111))
  {
LABEL_28:
    long long v44 = *((_OWORD *)__src + 55);
    *((_OWORD *)__dst + 54) = *((_OWORD *)__src + 54);
    *((_OWORD *)__dst + 55) = v44;
    *((void *)__dst + 112) = *((void *)__src + 112);
    long long v45 = *((_OWORD *)__src + 51);
    *((_OWORD *)__dst + 50) = *((_OWORD *)__src + 50);
    *((_OWORD *)__dst + 51) = v45;
    long long v46 = *((_OWORD *)__src + 53);
    *((_OWORD *)__dst + 52) = *((_OWORD *)__src + 52);
    *((_OWORD *)__dst + 53) = v46;
    long long v47 = *((_OWORD *)__src + 47);
    *((_OWORD *)__dst + 46) = *((_OWORD *)__src + 46);
    *((_OWORD *)__dst + 47) = v47;
    long long v48 = *((_OWORD *)__src + 49);
    *((_OWORD *)__dst + 48) = *((_OWORD *)__src + 48);
    *((_OWORD *)__dst + 49) = v48;
    long long v49 = *((_OWORD *)__src + 45);
    *long long v29 = *v30;
    *((_OWORD *)__dst + 45) = v49;
    goto LABEL_52;
  }
  if (!*((void *)__src + 111))
  {
    sub_2577270D4((uint64_t)(__dst + 704), &qword_26A030F78);
    goto LABEL_28;
  }
  if (*((void *)__dst + 97))
  {
    if (*((void *)__src + 97))
    {
      char v31 = v5[508];
      int v32 = *((_DWORD *)v5 + 126);
      uint64_t v33 = *((void *)__dst + 88);
      uint64_t v34 = *((void *)__dst + 89);
      uint64_t v35 = *((void *)__dst + 90);
      uint64_t v36 = *((void *)__dst + 91);
      uint64_t v37 = *((void *)__dst + 92);
      uint64_t v38 = *((void *)__dst + 93);
      uint64_t v39 = *((void *)__dst + 94);
      uint64_t v40 = *((void *)__dst + 95);
      unint64_t v41 = *((unsigned int *)v4 + 126) | ((unint64_t)v4[508] << 32);
      long long v42 = *((_OWORD *)__src + 45);
      *((_OWORD *)__dst + 44) = *((_OWORD *)__src + 44);
      *((_OWORD *)__dst + 45) = v42;
      long long v43 = *((_OWORD *)__src + 47);
      *((_OWORD *)__dst + 46) = *((_OWORD *)__src + 46);
      *((_OWORD *)__dst + 47) = v43;
      *((_DWORD *)v4 + 126) = v32;
      v4[508] = v31;
      sub_25771D110(v33, v34, v35, v36, v37, v38, v39, v40, v41);
      *((void *)__dst + 97) = *((void *)__src + 97);
      swift_bridgeObjectRelease();
      *((void *)__dst + 98) = *((void *)__src + 98);
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    sub_2577270D4((uint64_t)(__dst + 704), &qword_26A030F50);
  }
  long long v50 = *((_OWORD *)__src + 47);
  *((_OWORD *)__dst + 46) = *((_OWORD *)__src + 46);
  *((_OWORD *)__dst + 47) = v50;
  *((_OWORD *)__dst + 48) = *((_OWORD *)__src + 48);
  *((void *)__dst + 98) = *((void *)__src + 98);
  long long v51 = *((_OWORD *)__src + 45);
  *long long v29 = *v30;
  *((_OWORD *)__dst + 45) = v51;
LABEL_31:
  if (*((void *)__dst + 100))
  {
    uint64_t v52 = *((void *)__src + 100);
    if (v52)
    {
      *((void *)__dst + 99) = *((void *)__src + 99);
      *((void *)__dst + 100) = v52;
      swift_bridgeObjectRelease();
      *((void *)__dst + 101) = *((void *)__src + 101);
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    sub_2577270D4((uint64_t)(__dst + 792), &qword_26A030F58);
  }
  *(_OWORD *)(__dst + 792) = *(_OWORD *)(__src + 792);
  *((void *)__dst + 101) = *((void *)__src + 101);
LABEL_36:
  if (*((void *)__dst + 103))
  {
    uint64_t v53 = *((void *)__src + 103);
    if (v53)
    {
      __dst[816] = __src[816];
      *((void *)__dst + 103) = v53;
      swift_bridgeObjectRelease();
      *((void *)__dst + 104) = *((void *)__src + 104);
      swift_bridgeObjectRelease();
      goto LABEL_41;
    }
    sub_2577270D4((uint64_t)(__dst + 816), &qword_26A030F60);
  }
  *((_OWORD *)__dst + 51) = *((_OWORD *)__src + 51);
  *((void *)__dst + 104) = *((void *)__src + 104);
LABEL_41:
  if (*((void *)__dst + 106))
  {
    uint64_t v54 = *((void *)__src + 106);
    if (v54)
    {
      __dst[840] = __src[840];
      *((void *)__dst + 106) = v54;
      swift_bridgeObjectRelease();
      *((void *)__dst + 107) = *((void *)__src + 107);
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    sub_2577270D4((uint64_t)(__dst + 840), &qword_26A030F68);
  }
  *(_OWORD *)(__dst + 840) = *(_OWORD *)(__src + 840);
  *((void *)__dst + 107) = *((void *)__src + 107);
LABEL_46:
  if (!*((void *)__dst + 109))
  {
LABEL_50:
    *((_OWORD *)__dst + 54) = *((_OWORD *)__src + 54);
    *((void *)__dst + 110) = *((void *)__src + 110);
    goto LABEL_51;
  }
  uint64_t v55 = *((void *)__src + 109);
  if (!v55)
  {
    sub_2577270D4((uint64_t)(__dst + 864), &qword_26A030F70);
    goto LABEL_50;
  }
  __dst[864] = __src[864];
  *((void *)__dst + 109) = v55;
  swift_bridgeObjectRelease();
  *((void *)__dst + 110) = *((void *)__src + 110);
  swift_bridgeObjectRelease();
LABEL_51:
  *((void *)__dst + 111) = *((void *)__src + 111);
  swift_bridgeObjectRelease();
  *((void *)__dst + 112) = *((void *)__src + 112);
  swift_bridgeObjectRelease();
LABEL_52:
  long long v56 = __dst + 904;
  long long v57 = __src + 904;
  if (!*((void *)__dst + 136))
  {
LABEL_58:
    long long v71 = *(_OWORD *)(__src + 1080);
    *(_OWORD *)(__dst + 1064) = *(_OWORD *)(__src + 1064);
    *(_OWORD *)(__dst + 1080) = v71;
    *((void *)__dst + 137) = *((void *)__src + 137);
    long long v72 = *(_OWORD *)(__src + 1016);
    *(_OWORD *)(__dst + 1000) = *(_OWORD *)(__src + 1000);
    *(_OWORD *)(__dst + 1016) = v72;
    long long v73 = *(_OWORD *)(__src + 1048);
    *(_OWORD *)(__dst + 1032) = *(_OWORD *)(__src + 1032);
    *(_OWORD *)(__dst + 1048) = v73;
    long long v74 = *(_OWORD *)(__src + 952);
    *(_OWORD *)(__dst + 936) = *(_OWORD *)(__src + 936);
    *(_OWORD *)(__dst + 952) = v74;
    long long v75 = *(_OWORD *)(__src + 984);
    *(_OWORD *)(__dst + 968) = *(_OWORD *)(__src + 968);
    *(_OWORD *)(__dst + 984) = v75;
    long long v76 = *(_OWORD *)(__src + 920);
    *long long v56 = *v57;
    *(_OWORD *)(__dst + 920) = v76;
    goto LABEL_82;
  }
  if (!*((void *)__src + 136))
  {
    sub_2577270D4((uint64_t)(__dst + 904), &qword_26A030F78);
    goto LABEL_58;
  }
  if (*((void *)__dst + 122))
  {
    if (*((void *)__src + 122))
    {
      char v58 = __src[972];
      int v59 = *((_DWORD *)__src + 242);
      uint64_t v60 = *((void *)__dst + 113);
      uint64_t v61 = *((void *)__dst + 114);
      uint64_t v62 = *((void *)__dst + 115);
      uint64_t v63 = *((void *)__dst + 116);
      uint64_t v64 = *((void *)__dst + 117);
      uint64_t v65 = *((void *)__dst + 118);
      uint64_t v66 = *((void *)__dst + 119);
      uint64_t v67 = *((void *)__dst + 120);
      unint64_t v68 = *((unsigned int *)__dst + 242) | ((unint64_t)__dst[972] << 32);
      long long v69 = *(_OWORD *)(__src + 920);
      *long long v56 = *v57;
      *(_OWORD *)(__dst + 920) = v69;
      long long v70 = *(_OWORD *)(__src + 952);
      *(_OWORD *)(__dst + 936) = *(_OWORD *)(__src + 936);
      *(_OWORD *)(__dst + 952) = v70;
      *((_DWORD *)__dst + 242) = v59;
      __dst[972] = v58;
      sub_25771D110(v60, v61, v62, v63, v64, v65, v66, v67, v68);
      *((void *)__dst + 122) = *((void *)__src + 122);
      swift_bridgeObjectRelease();
      *((void *)__dst + 123) = *((void *)__src + 123);
      swift_bridgeObjectRelease();
      goto LABEL_61;
    }
    sub_2577270D4((uint64_t)(__dst + 904), &qword_26A030F50);
  }
  long long v77 = *(_OWORD *)(__src + 952);
  *(_OWORD *)(__dst + 936) = *(_OWORD *)(__src + 936);
  *(_OWORD *)(__dst + 952) = v77;
  *(_OWORD *)(__dst + 968) = *(_OWORD *)(__src + 968);
  *((void *)__dst + 123) = *((void *)__src + 123);
  long long v78 = *(_OWORD *)(__src + 920);
  *long long v56 = *v57;
  *(_OWORD *)(__dst + 920) = v78;
LABEL_61:
  if (*((void *)__dst + 125))
  {
    uint64_t v79 = *((void *)__src + 125);
    if (v79)
    {
      *((void *)__dst + 124) = *((void *)__src + 124);
      *((void *)__dst + 125) = v79;
      swift_bridgeObjectRelease();
      *((void *)__dst + 126) = *((void *)__src + 126);
      swift_bridgeObjectRelease();
      goto LABEL_66;
    }
    sub_2577270D4((uint64_t)(__dst + 992), &qword_26A030F58);
  }
  *((_OWORD *)__dst + 62) = *((_OWORD *)__src + 62);
  *((void *)__dst + 126) = *((void *)__src + 126);
LABEL_66:
  if (*((void *)__dst + 128))
  {
    uint64_t v80 = *((void *)__src + 128);
    if (v80)
    {
      __dst[1016] = __src[1016];
      *((void *)__dst + 128) = v80;
      swift_bridgeObjectRelease();
      *((void *)__dst + 129) = *((void *)__src + 129);
      swift_bridgeObjectRelease();
      goto LABEL_71;
    }
    sub_2577270D4((uint64_t)(__dst + 1016), &qword_26A030F60);
  }
  *(_OWORD *)(__dst + 1016) = *(_OWORD *)(__src + 1016);
  *((void *)__dst + 129) = *((void *)__src + 129);
LABEL_71:
  if (*((void *)__dst + 131))
  {
    uint64_t v81 = *((void *)__src + 131);
    if (v81)
    {
      __dst[1040] = __src[1040];
      *((void *)__dst + 131) = v81;
      swift_bridgeObjectRelease();
      *((void *)__dst + 132) = *((void *)__src + 132);
      swift_bridgeObjectRelease();
      goto LABEL_76;
    }
    sub_2577270D4((uint64_t)(__dst + 1040), &qword_26A030F68);
  }
  *((_OWORD *)__dst + 65) = *((_OWORD *)__src + 65);
  *((void *)__dst + 132) = *((void *)__src + 132);
LABEL_76:
  if (!*((void *)__dst + 134))
  {
LABEL_80:
    *(_OWORD *)(__dst + 1064) = *(_OWORD *)(__src + 1064);
    *((void *)__dst + 135) = *((void *)__src + 135);
    goto LABEL_81;
  }
  uint64_t v82 = *((void *)__src + 134);
  if (!v82)
  {
    sub_2577270D4((uint64_t)(__dst + 1064), &qword_26A030F70);
    goto LABEL_80;
  }
  __dst[1064] = __src[1064];
  *((void *)__dst + 134) = v82;
  swift_bridgeObjectRelease();
  *((void *)__dst + 135) = *((void *)__src + 135);
  swift_bridgeObjectRelease();
LABEL_81:
  *((void *)__dst + 136) = *((void *)__src + 136);
  swift_bridgeObjectRelease();
  *((void *)__dst + 137) = *((void *)__src + 137);
  swift_bridgeObjectRelease();
LABEL_82:
  uint64_t v83 = __dst + 1104;
  uint64_t v84 = __src + 1104;
  if (!*((void *)__dst + 161))
  {
LABEL_88:
    long long v96 = *((_OWORD *)__src + 80);
    *((_OWORD *)__dst + 79) = *((_OWORD *)__src + 79);
    *((_OWORD *)__dst + 80) = v96;
    *((void *)__dst + 162) = *((void *)__src + 162);
    long long v97 = *((_OWORD *)__src + 76);
    *((_OWORD *)__dst + 75) = *((_OWORD *)__src + 75);
    *((_OWORD *)__dst + 76) = v97;
    long long v98 = *((_OWORD *)__src + 78);
    *((_OWORD *)__dst + 77) = *((_OWORD *)__src + 77);
    *((_OWORD *)__dst + 78) = v98;
    long long v99 = *((_OWORD *)__src + 72);
    *((_OWORD *)__dst + 71) = *((_OWORD *)__src + 71);
    *((_OWORD *)__dst + 72) = v99;
    long long v100 = *((_OWORD *)__src + 74);
    *((_OWORD *)__dst + 73) = *((_OWORD *)__src + 73);
    *((_OWORD *)__dst + 74) = v100;
    long long v101 = *((_OWORD *)__src + 70);
    *uint64_t v83 = *v84;
    *((_OWORD *)__dst + 70) = v101;
    goto LABEL_112;
  }
  if (!*((void *)__src + 161))
  {
    sub_2577270D4((uint64_t)(__dst + 1104), &qword_26A030F78);
    goto LABEL_88;
  }
  if (*((void *)__dst + 147))
  {
    if (*((void *)__src + 147))
    {
      char v85 = __src[1172];
      int v86 = *((_DWORD *)__src + 292);
      uint64_t v87 = *((void *)__dst + 138);
      uint64_t v88 = *((void *)__dst + 139);
      uint64_t v89 = *((void *)__dst + 140);
      uint64_t v90 = *((void *)__dst + 141);
      uint64_t v91 = *((void *)__dst + 142);
      uint64_t v92 = *((void *)__dst + 143);
      uint64_t v93 = *((void *)__dst + 144);
      uint64_t v94 = *((void *)__dst + 145);
      unint64_t v95 = *((unsigned int *)__dst + 292) | ((unint64_t)__dst[1172] << 32);
      *((_OWORD *)__dst + 69) = *((_OWORD *)__src + 69);
      *((_OWORD *)__dst + 70) = *((_OWORD *)__src + 70);
      *((_OWORD *)__dst + 71) = *((_OWORD *)__src + 71);
      *((_OWORD *)__dst + 72) = *((_OWORD *)__src + 72);
      *((_DWORD *)__dst + 292) = v86;
      __dst[1172] = v85;
      sub_25771D110(v87, v88, v89, v90, v91, v92, v93, v94, v95);
      *((void *)__dst + 147) = *((void *)__src + 147);
      swift_bridgeObjectRelease();
      *((void *)__dst + 148) = *((void *)__src + 148);
      swift_bridgeObjectRelease();
      goto LABEL_91;
    }
    sub_2577270D4((uint64_t)(__dst + 1104), &qword_26A030F50);
  }
  long long v102 = *((_OWORD *)__src + 72);
  *((_OWORD *)__dst + 71) = *((_OWORD *)__src + 71);
  *((_OWORD *)__dst + 72) = v102;
  *((_OWORD *)__dst + 73) = *((_OWORD *)__src + 73);
  *((void *)__dst + 148) = *((void *)__src + 148);
  long long v103 = *((_OWORD *)__src + 70);
  *uint64_t v83 = *v84;
  *((_OWORD *)__dst + 70) = v103;
LABEL_91:
  if (*((void *)__dst + 150))
  {
    uint64_t v104 = *((void *)__src + 150);
    if (v104)
    {
      *((void *)__dst + 149) = *((void *)__src + 149);
      *((void *)__dst + 150) = v104;
      swift_bridgeObjectRelease();
      *((void *)__dst + 151) = *((void *)__src + 151);
      swift_bridgeObjectRelease();
      goto LABEL_96;
    }
    sub_2577270D4((uint64_t)(__dst + 1192), &qword_26A030F58);
  }
  *(_OWORD *)(__dst + 1192) = *(_OWORD *)(__src + 1192);
  *((void *)__dst + 151) = *((void *)__src + 151);
LABEL_96:
  if (*((void *)__dst + 153))
  {
    uint64_t v105 = *((void *)__src + 153);
    if (v105)
    {
      __dst[1216] = __src[1216];
      *((void *)__dst + 153) = v105;
      swift_bridgeObjectRelease();
      *((void *)__dst + 154) = *((void *)__src + 154);
      swift_bridgeObjectRelease();
      goto LABEL_101;
    }
    sub_2577270D4((uint64_t)(__dst + 1216), &qword_26A030F60);
  }
  *((_OWORD *)__dst + 76) = *((_OWORD *)__src + 76);
  *((void *)__dst + 154) = *((void *)__src + 154);
LABEL_101:
  if (*((void *)__dst + 156))
  {
    uint64_t v106 = *((void *)__src + 156);
    if (v106)
    {
      __dst[1240] = __src[1240];
      *((void *)__dst + 156) = v106;
      swift_bridgeObjectRelease();
      *((void *)__dst + 157) = *((void *)__src + 157);
      swift_bridgeObjectRelease();
      goto LABEL_106;
    }
    sub_2577270D4((uint64_t)(__dst + 1240), &qword_26A030F68);
  }
  *(_OWORD *)(__dst + 1240) = *(_OWORD *)(__src + 1240);
  *((void *)__dst + 157) = *((void *)__src + 157);
LABEL_106:
  if (!*((void *)__dst + 159))
  {
LABEL_110:
    *((_OWORD *)__dst + 79) = *((_OWORD *)__src + 79);
    *((void *)__dst + 160) = *((void *)__src + 160);
    goto LABEL_111;
  }
  uint64_t v107 = *((void *)__src + 159);
  if (!v107)
  {
    sub_2577270D4((uint64_t)(__dst + 1264), &qword_26A030F70);
    goto LABEL_110;
  }
  __dst[1264] = __src[1264];
  *((void *)__dst + 159) = v107;
  swift_bridgeObjectRelease();
  *((void *)__dst + 160) = *((void *)__src + 160);
  swift_bridgeObjectRelease();
LABEL_111:
  *((void *)__dst + 161) = *((void *)__src + 161);
  swift_bridgeObjectRelease();
  *((void *)__dst + 162) = *((void *)__src + 162);
  swift_bridgeObjectRelease();
LABEL_112:
  long long v108 = __dst + 1304;
  long long v109 = __src + 1304;
  if (!*((void *)__dst + 186))
  {
LABEL_118:
    long long v123 = *(_OWORD *)(__src + 1480);
    *(_OWORD *)(__dst + 1464) = *(_OWORD *)(__src + 1464);
    *(_OWORD *)(__dst + 1480) = v123;
    *((void *)__dst + 187) = *((void *)__src + 187);
    long long v124 = *(_OWORD *)(__src + 1416);
    *(_OWORD *)(__dst + 1400) = *(_OWORD *)(__src + 1400);
    *(_OWORD *)(__dst + 1416) = v124;
    long long v125 = *(_OWORD *)(__src + 1448);
    *(_OWORD *)(__dst + 1432) = *(_OWORD *)(__src + 1432);
    *(_OWORD *)(__dst + 1448) = v125;
    long long v126 = *(_OWORD *)(__src + 1352);
    *(_OWORD *)(__dst + 1336) = *(_OWORD *)(__src + 1336);
    *(_OWORD *)(__dst + 1352) = v126;
    long long v127 = *(_OWORD *)(__src + 1384);
    *(_OWORD *)(__dst + 1368) = *(_OWORD *)(__src + 1368);
    *(_OWORD *)(__dst + 1384) = v127;
    long long v128 = *(_OWORD *)(__src + 1320);
    *long long v108 = *v109;
    *(_OWORD *)(__dst + 1320) = v128;
    goto LABEL_142;
  }
  if (!*((void *)__src + 186))
  {
    sub_2577270D4((uint64_t)(__dst + 1304), &qword_26A030F78);
    goto LABEL_118;
  }
  if (*((void *)__dst + 172))
  {
    if (*((void *)__src + 172))
    {
      char v110 = __src[1372];
      int v111 = *((_DWORD *)__src + 342);
      uint64_t v112 = *((void *)__dst + 163);
      uint64_t v113 = *((void *)__dst + 164);
      uint64_t v114 = *((void *)__dst + 165);
      uint64_t v115 = *((void *)__dst + 166);
      uint64_t v116 = *((void *)__dst + 167);
      uint64_t v117 = *((void *)__dst + 168);
      uint64_t v118 = *((void *)__dst + 169);
      uint64_t v119 = *((void *)__dst + 170);
      unint64_t v120 = *((unsigned int *)__dst + 342) | ((unint64_t)__dst[1372] << 32);
      long long v121 = *(_OWORD *)(__src + 1320);
      *long long v108 = *v109;
      *(_OWORD *)(__dst + 1320) = v121;
      long long v122 = *(_OWORD *)(__src + 1352);
      *(_OWORD *)(__dst + 1336) = *(_OWORD *)(__src + 1336);
      *(_OWORD *)(__dst + 1352) = v122;
      *((_DWORD *)__dst + 342) = v111;
      __dst[1372] = v110;
      sub_25771D110(v112, v113, v114, v115, v116, v117, v118, v119, v120);
      *((void *)__dst + 172) = *((void *)__src + 172);
      swift_bridgeObjectRelease();
      *((void *)__dst + 173) = *((void *)__src + 173);
      swift_bridgeObjectRelease();
      goto LABEL_121;
    }
    sub_2577270D4((uint64_t)(__dst + 1304), &qword_26A030F50);
  }
  long long v129 = *(_OWORD *)(__src + 1352);
  *(_OWORD *)(__dst + 1336) = *(_OWORD *)(__src + 1336);
  *(_OWORD *)(__dst + 1352) = v129;
  *(_OWORD *)(__dst + 1368) = *(_OWORD *)(__src + 1368);
  *((void *)__dst + 173) = *((void *)__src + 173);
  long long v130 = *(_OWORD *)(__src + 1320);
  *long long v108 = *v109;
  *(_OWORD *)(__dst + 1320) = v130;
LABEL_121:
  if (*((void *)__dst + 175))
  {
    uint64_t v131 = *((void *)__src + 175);
    if (v131)
    {
      *((void *)__dst + 174) = *((void *)__src + 174);
      *((void *)__dst + 175) = v131;
      swift_bridgeObjectRelease();
      *((void *)__dst + 176) = *((void *)__src + 176);
      swift_bridgeObjectRelease();
      goto LABEL_126;
    }
    sub_2577270D4((uint64_t)(__dst + 1392), &qword_26A030F58);
  }
  *((_OWORD *)__dst + 87) = *((_OWORD *)__src + 87);
  *((void *)__dst + 176) = *((void *)__src + 176);
LABEL_126:
  if (*((void *)__dst + 178))
  {
    uint64_t v132 = *((void *)__src + 178);
    if (v132)
    {
      __dst[1416] = __src[1416];
      *((void *)__dst + 178) = v132;
      swift_bridgeObjectRelease();
      *((void *)__dst + 179) = *((void *)__src + 179);
      swift_bridgeObjectRelease();
      goto LABEL_131;
    }
    sub_2577270D4((uint64_t)(__dst + 1416), &qword_26A030F60);
  }
  *(_OWORD *)(__dst + 1416) = *(_OWORD *)(__src + 1416);
  *((void *)__dst + 179) = *((void *)__src + 179);
LABEL_131:
  if (*((void *)__dst + 181))
  {
    uint64_t v133 = *((void *)__src + 181);
    if (v133)
    {
      __dst[1440] = __src[1440];
      *((void *)__dst + 181) = v133;
      swift_bridgeObjectRelease();
      *((void *)__dst + 182) = *((void *)__src + 182);
      swift_bridgeObjectRelease();
      goto LABEL_136;
    }
    sub_2577270D4((uint64_t)(__dst + 1440), &qword_26A030F68);
  }
  *((_OWORD *)__dst + 90) = *((_OWORD *)__src + 90);
  *((void *)__dst + 182) = *((void *)__src + 182);
LABEL_136:
  if (!*((void *)__dst + 184))
  {
LABEL_140:
    *(_OWORD *)(__dst + 1464) = *(_OWORD *)(__src + 1464);
    *((void *)__dst + 185) = *((void *)__src + 185);
    goto LABEL_141;
  }
  uint64_t v134 = *((void *)__src + 184);
  if (!v134)
  {
    sub_2577270D4((uint64_t)(__dst + 1464), &qword_26A030F70);
    goto LABEL_140;
  }
  __dst[1464] = __src[1464];
  *((void *)__dst + 184) = v134;
  swift_bridgeObjectRelease();
  *((void *)__dst + 185) = *((void *)__src + 185);
  swift_bridgeObjectRelease();
LABEL_141:
  *((void *)__dst + 186) = *((void *)__src + 186);
  swift_bridgeObjectRelease();
  *((void *)__dst + 187) = *((void *)__src + 187);
  swift_bridgeObjectRelease();
LABEL_142:
  uint64_t v135 = __dst + 1704;
  uint64_t v136 = __src + 1704;
  uint64_t v137 = __dst + 1504;
  uint64_t v138 = __src + 1504;
  if (!*((void *)__dst + 211))
  {
LABEL_148:
    long long v150 = *((_OWORD *)__src + 105);
    *((_OWORD *)__dst + 104) = *((_OWORD *)__src + 104);
    *((_OWORD *)__dst + 105) = v150;
    *((void *)__dst + 212) = *((void *)__src + 212);
    long long v151 = *((_OWORD *)__src + 101);
    *((_OWORD *)__dst + 100) = *((_OWORD *)__src + 100);
    *((_OWORD *)__dst + 101) = v151;
    long long v152 = *((_OWORD *)__src + 103);
    *((_OWORD *)__dst + 102) = *((_OWORD *)__src + 102);
    *((_OWORD *)__dst + 103) = v152;
    long long v153 = *((_OWORD *)__src + 97);
    *((_OWORD *)__dst + 96) = *((_OWORD *)__src + 96);
    *((_OWORD *)__dst + 97) = v153;
    long long v154 = *((_OWORD *)__src + 99);
    *((_OWORD *)__dst + 98) = *((_OWORD *)__src + 98);
    *((_OWORD *)__dst + 99) = v154;
    long long v155 = *((_OWORD *)__src + 95);
    *uint64_t v137 = *v138;
    *((_OWORD *)__dst + 95) = v155;
    goto LABEL_172;
  }
  if (!*((void *)__src + 211))
  {
    sub_2577270D4((uint64_t)(__dst + 1504), &qword_26A030F78);
    goto LABEL_148;
  }
  if (*((void *)__dst + 197))
  {
    if (*((void *)__src + 197))
    {
      char v139 = __src[1572];
      int v140 = *((_DWORD *)__src + 392);
      uint64_t v141 = *((void *)__dst + 188);
      uint64_t v142 = *((void *)__dst + 189);
      uint64_t v143 = *((void *)__dst + 190);
      uint64_t v144 = *((void *)__dst + 191);
      uint64_t v145 = *((void *)__dst + 192);
      uint64_t v146 = *((void *)__dst + 193);
      uint64_t v147 = *((void *)__dst + 194);
      uint64_t v148 = *((void *)__dst + 195);
      unint64_t v149 = *((unsigned int *)__dst + 392) | ((unint64_t)__dst[1572] << 32);
      *((_OWORD *)__dst + 94) = *((_OWORD *)__src + 94);
      *((_OWORD *)__dst + 95) = *((_OWORD *)__src + 95);
      *((_OWORD *)__dst + 96) = *((_OWORD *)__src + 96);
      *((_OWORD *)__dst + 97) = *((_OWORD *)__src + 97);
      *((_DWORD *)__dst + 392) = v140;
      __dst[1572] = v139;
      sub_25771D110(v141, v142, v143, v144, v145, v146, v147, v148, v149);
      *((void *)__dst + 197) = *((void *)__src + 197);
      swift_bridgeObjectRelease();
      *((void *)__dst + 198) = *((void *)__src + 198);
      swift_bridgeObjectRelease();
      goto LABEL_151;
    }
    sub_2577270D4((uint64_t)(__dst + 1504), &qword_26A030F50);
  }
  long long v156 = *((_OWORD *)__src + 97);
  *((_OWORD *)__dst + 96) = *((_OWORD *)__src + 96);
  *((_OWORD *)__dst + 97) = v156;
  *((_OWORD *)__dst + 98) = *((_OWORD *)__src + 98);
  *((void *)__dst + 198) = *((void *)__src + 198);
  long long v157 = *((_OWORD *)__src + 95);
  *uint64_t v137 = *v138;
  *((_OWORD *)__dst + 95) = v157;
LABEL_151:
  if (*((void *)__dst + 200))
  {
    uint64_t v158 = *((void *)__src + 200);
    if (v158)
    {
      *((void *)__dst + 199) = *((void *)__src + 199);
      *((void *)__dst + 200) = v158;
      swift_bridgeObjectRelease();
      *((void *)__dst + 201) = *((void *)__src + 201);
      swift_bridgeObjectRelease();
      goto LABEL_156;
    }
    sub_2577270D4((uint64_t)(__dst + 1592), &qword_26A030F58);
  }
  *(_OWORD *)(__dst + 1592) = *(_OWORD *)(__src + 1592);
  *((void *)__dst + 201) = *((void *)__src + 201);
LABEL_156:
  if (*((void *)__dst + 203))
  {
    uint64_t v159 = *((void *)__src + 203);
    if (v159)
    {
      __dst[1616] = __src[1616];
      *((void *)__dst + 203) = v159;
      swift_bridgeObjectRelease();
      *((void *)__dst + 204) = *((void *)__src + 204);
      swift_bridgeObjectRelease();
      goto LABEL_161;
    }
    sub_2577270D4((uint64_t)(__dst + 1616), &qword_26A030F60);
  }
  *((_OWORD *)__dst + 101) = *((_OWORD *)__src + 101);
  *((void *)__dst + 204) = *((void *)__src + 204);
LABEL_161:
  if (*((void *)__dst + 206))
  {
    uint64_t v160 = *((void *)__src + 206);
    if (v160)
    {
      __dst[1640] = __src[1640];
      *((void *)__dst + 206) = v160;
      swift_bridgeObjectRelease();
      *((void *)__dst + 207) = *((void *)__src + 207);
      swift_bridgeObjectRelease();
      goto LABEL_166;
    }
    sub_2577270D4((uint64_t)(__dst + 1640), &qword_26A030F68);
  }
  *(_OWORD *)(__dst + 1640) = *(_OWORD *)(__src + 1640);
  *((void *)__dst + 207) = *((void *)__src + 207);
LABEL_166:
  if (!*((void *)__dst + 209))
  {
LABEL_170:
    *((_OWORD *)__dst + 104) = *((_OWORD *)__src + 104);
    *((void *)__dst + 210) = *((void *)__src + 210);
    goto LABEL_171;
  }
  uint64_t v161 = *((void *)__src + 209);
  if (!v161)
  {
    sub_2577270D4((uint64_t)(__dst + 1664), &qword_26A030F70);
    goto LABEL_170;
  }
  __dst[1664] = __src[1664];
  *((void *)__dst + 209) = v161;
  swift_bridgeObjectRelease();
  *((void *)__dst + 210) = *((void *)__src + 210);
  swift_bridgeObjectRelease();
LABEL_171:
  *((void *)__dst + 211) = *((void *)__src + 211);
  swift_bridgeObjectRelease();
  *((void *)__dst + 212) = *((void *)__src + 212);
  swift_bridgeObjectRelease();
LABEL_172:
  uint64_t v162 = *((void *)__dst + 222);
  if (v162 != 3)
  {
    uint64_t v163 = *((void *)__src + 222);
    if (v163 == 3)
    {
      sub_2577FDDB4((uint64_t)(__dst + 1704));
      goto LABEL_175;
    }
    if (v162 == 2) {
      goto LABEL_179;
    }
    if (v163 == 2)
    {
      sub_2577FDD60((uint64_t)(__dst + 1704));
LABEL_179:
      memcpy(__dst + 1704, __src + 1704, 0x160uLL);
      goto LABEL_196;
    }
    if (v162 == 1) {
      goto LABEL_191;
    }
    if (v163 == 1)
    {
      sub_257735730((uint64_t)(__dst + 1704));
LABEL_191:
      long long v181 = *(_OWORD *)(__src + 1848);
      *(_OWORD *)(__dst + 1832) = *(_OWORD *)(__src + 1832);
      *(_OWORD *)(__dst + 1848) = v181;
      *(_OWORD *)(__dst + 1864) = *(_OWORD *)(__src + 1864);
      long long v182 = *(_OWORD *)(__src + 1784);
      *(_OWORD *)(__dst + 1768) = *(_OWORD *)(__src + 1768);
      *(_OWORD *)(__dst + 1784) = v182;
      long long v183 = *(_OWORD *)(__src + 1816);
      *(_OWORD *)(__dst + 1800) = *(_OWORD *)(__src + 1800);
      *(_OWORD *)(__dst + 1816) = v183;
      long long v184 = *(_OWORD *)(__src + 1720);
      *uint64_t v135 = *v136;
      *(_OWORD *)(__dst + 1720) = v184;
      long long v185 = *(_OWORD *)(__src + 1752);
      *(_OWORD *)(__dst + 1736) = *(_OWORD *)(__src + 1736);
      *(_OWORD *)(__dst + 1752) = v185;
      goto LABEL_192;
    }
    if (v162)
    {
      if (v163)
      {
        char v266 = __src[1772];
        int v267 = *((_DWORD *)__src + 442);
        uint64_t v268 = *((void *)__dst + 213);
        uint64_t v269 = *((void *)__dst + 214);
        uint64_t v270 = *((void *)__dst + 215);
        uint64_t v271 = *((void *)__dst + 216);
        uint64_t v272 = *((void *)__dst + 217);
        uint64_t v273 = *((void *)__dst + 218);
        uint64_t v274 = *((void *)__dst + 219);
        uint64_t v275 = *((void *)__dst + 220);
        unint64_t v276 = *((unsigned int *)__dst + 442) | ((unint64_t)__dst[1772] << 32);
        long long v277 = *(_OWORD *)(__src + 1720);
        *uint64_t v135 = *v136;
        *(_OWORD *)(__dst + 1720) = v277;
        long long v278 = *(_OWORD *)(__src + 1752);
        *(_OWORD *)(__dst + 1736) = *(_OWORD *)(__src + 1736);
        *(_OWORD *)(__dst + 1752) = v278;
        *((_DWORD *)__dst + 442) = v267;
        __dst[1772] = v266;
        sub_25771D110(v268, v269, v270, v271, v272, v273, v274, v275, v276);
        *((void *)__dst + 222) = *((void *)__src + 222);
        swift_bridgeObjectRelease();
        *((void *)__dst + 223) = *((void *)__src + 223);
        swift_bridgeObjectRelease();
        goto LABEL_256;
      }
      sub_2577270D4((uint64_t)(__dst + 1704), &qword_26A030F50);
    }
    long long v378 = *(_OWORD *)(__src + 1752);
    *(_OWORD *)(__dst + 1736) = *(_OWORD *)(__src + 1736);
    *(_OWORD *)(__dst + 1752) = v378;
    *(_OWORD *)(__dst + 1768) = *(_OWORD *)(__src + 1768);
    *((void *)__dst + 223) = *((void *)__src + 223);
    long long v379 = *(_OWORD *)(__src + 1720);
    *uint64_t v135 = *v136;
    *(_OWORD *)(__dst + 1720) = v379;
LABEL_256:
    if (*((void *)__dst + 233))
    {
      if (*((void *)__src + 233))
      {
        char v380 = __src[1860];
        int v381 = *((_DWORD *)__src + 464);
        uint64_t v382 = *((void *)__dst + 224);
        uint64_t v383 = *((void *)__dst + 225);
        uint64_t v384 = *((void *)__dst + 226);
        uint64_t v385 = *((void *)__dst + 227);
        uint64_t v386 = *((void *)__dst + 228);
        uint64_t v387 = *((void *)__dst + 229);
        uint64_t v388 = *((void *)__dst + 230);
        uint64_t v389 = *((void *)__dst + 231);
        unint64_t v390 = *((unsigned int *)__dst + 464) | ((unint64_t)__dst[1860] << 32);
        *((_OWORD *)__dst + 112) = *((_OWORD *)__src + 112);
        *((_OWORD *)__dst + 113) = *((_OWORD *)__src + 113);
        *((_OWORD *)__dst + 114) = *((_OWORD *)__src + 114);
        *((_OWORD *)__dst + 115) = *((_OWORD *)__src + 115);
        *((_DWORD *)__dst + 464) = v381;
        __dst[1860] = v380;
        sub_25771D110(v382, v383, v384, v385, v386, v387, v388, v389, v390);
        *((void *)__dst + 233) = *((void *)__src + 233);
        swift_bridgeObjectRelease();
        *((void *)__dst + 234) = *((void *)__src + 234);
        swift_bridgeObjectRelease();
        goto LABEL_192;
      }
      sub_2577270D4((uint64_t)(__dst + 1792), &qword_26A030F50);
    }
    long long v438 = *((_OWORD *)__src + 115);
    *((_OWORD *)__dst + 114) = *((_OWORD *)__src + 114);
    *((_OWORD *)__dst + 115) = v438;
    *((_OWORD *)__dst + 116) = *((_OWORD *)__src + 116);
    *((void *)__dst + 234) = *((void *)__src + 234);
    long long v439 = *((_OWORD *)__src + 113);
    *((_OWORD *)__dst + 112) = *((_OWORD *)__src + 112);
    *((_OWORD *)__dst + 113) = v439;
LABEL_192:
    uint64_t v186 = __dst + 1880;
    uint64_t v187 = __src + 1880;
    uint64_t v188 = *((void *)__dst + 244);
    if (v188 == 1)
    {
LABEL_195:
      long long v190 = *(_OWORD *)(__src + 2024);
      *(_OWORD *)(__dst + 2008) = *(_OWORD *)(__src + 2008);
      *(_OWORD *)(__dst + 2024) = v190;
      *(_OWORD *)(__dst + 2040) = *(_OWORD *)(__src + 2040);
      long long v191 = *(_OWORD *)(__src + 1960);
      *(_OWORD *)(__dst + 1944) = *(_OWORD *)(__src + 1944);
      *(_OWORD *)(__dst + 1960) = v191;
      long long v192 = *(_OWORD *)(__src + 1992);
      *(_OWORD *)(__dst + 1976) = *(_OWORD *)(__src + 1976);
      *(_OWORD *)(__dst + 1992) = v192;
      long long v193 = *(_OWORD *)(__src + 1896);
      *uint64_t v186 = *v187;
      *(_OWORD *)(__dst + 1896) = v193;
      long long v194 = *(_OWORD *)(__src + 1928);
      *(_OWORD *)(__dst + 1912) = *(_OWORD *)(__src + 1912);
      *(_OWORD *)(__dst + 1928) = v194;
      goto LABEL_196;
    }
    uint64_t v189 = *((void *)__src + 244);
    if (v189 == 1)
    {
      sub_2577356DC((uint64_t)(__dst + 1880));
      goto LABEL_195;
    }
    if (v188)
    {
      if (v189)
      {
        char v279 = __src[1948];
        int v280 = *((_DWORD *)__src + 486);
        uint64_t v281 = *((void *)__dst + 235);
        uint64_t v282 = *((void *)__dst + 236);
        uint64_t v283 = *((void *)__dst + 237);
        uint64_t v284 = *((void *)__dst + 238);
        uint64_t v285 = *((void *)__dst + 239);
        uint64_t v286 = *((void *)__dst + 240);
        uint64_t v287 = *((void *)__dst + 241);
        uint64_t v288 = *((void *)__dst + 242);
        unint64_t v289 = *((unsigned int *)__dst + 486) | ((unint64_t)__dst[1948] << 32);
        long long v290 = *(_OWORD *)(__src + 1896);
        *(_OWORD *)(__dst + 1880) = *(_OWORD *)(__src + 1880);
        *(_OWORD *)(__dst + 1896) = v290;
        long long v291 = *(_OWORD *)(__src + 1928);
        *(_OWORD *)(__dst + 1912) = *(_OWORD *)(__src + 1912);
        *(_OWORD *)(__dst + 1928) = v291;
        *((_DWORD *)__dst + 486) = v280;
        __dst[1948] = v279;
        sub_25771D110(v281, v282, v283, v284, v285, v286, v287, v288, v289);
        *((void *)__dst + 244) = *((void *)__src + 244);
        swift_bridgeObjectRelease();
        *((void *)__dst + 245) = *((void *)__src + 245);
        swift_bridgeObjectRelease();
        goto LABEL_261;
      }
      sub_2577270D4((uint64_t)(__dst + 1880), &qword_26A030F50);
    }
    long long v391 = *(_OWORD *)(__src + 1928);
    *(_OWORD *)(__dst + 1912) = *(_OWORD *)(__src + 1912);
    *(_OWORD *)(__dst + 1928) = v391;
    *(_OWORD *)(__dst + 1944) = *(_OWORD *)(__src + 1944);
    *((void *)__dst + 245) = *((void *)__src + 245);
    long long v392 = *(_OWORD *)(__src + 1896);
    *uint64_t v186 = *v187;
    *(_OWORD *)(__dst + 1896) = v392;
LABEL_261:
    if (*((void *)__dst + 255))
    {
      if (*((void *)__src + 255))
      {
        char v393 = __src[2036];
        int v394 = *((_DWORD *)__src + 508);
        uint64_t v395 = *((void *)__dst + 246);
        uint64_t v396 = *((void *)__dst + 247);
        uint64_t v397 = *((void *)__dst + 248);
        uint64_t v398 = *((void *)__dst + 249);
        uint64_t v399 = *((void *)__dst + 250);
        uint64_t v400 = *((void *)__dst + 251);
        uint64_t v401 = *((void *)__dst + 252);
        uint64_t v402 = *((void *)__dst + 253);
        unint64_t v403 = *((unsigned int *)__dst + 508) | ((unint64_t)__dst[2036] << 32);
        *((_OWORD *)__dst + 123) = *((_OWORD *)__src + 123);
        *((_OWORD *)__dst + 124) = *((_OWORD *)__src + 124);
        *((_OWORD *)__dst + 125) = *((_OWORD *)__src + 125);
        *((_OWORD *)__dst + 126) = *((_OWORD *)__src + 126);
        *((_DWORD *)__dst + 508) = v394;
        __dst[2036] = v393;
        sub_25771D110(v395, v396, v397, v398, v399, v400, v401, v402, v403);
        *((void *)__dst + 255) = *((void *)__src + 255);
        swift_bridgeObjectRelease();
        *((void *)__dst + 256) = *((void *)__src + 256);
        swift_bridgeObjectRelease();
        goto LABEL_196;
      }
      sub_2577270D4((uint64_t)(__dst + 1968), &qword_26A030F50);
    }
    long long v440 = *((_OWORD *)__src + 126);
    *((_OWORD *)__dst + 125) = *((_OWORD *)__src + 125);
    *((_OWORD *)__dst + 126) = v440;
    *((_OWORD *)__dst + 127) = *((_OWORD *)__src + 127);
    *((void *)__dst + 256) = *((void *)__src + 256);
    long long v441 = *((_OWORD *)__src + 124);
    *((_OWORD *)__dst + 123) = *((_OWORD *)__src + 123);
    *((_OWORD *)__dst + 124) = v441;
LABEL_196:
    long long v195 = __dst + 2056;
    long long v196 = __src + 2056;
    uint64_t v197 = *((void *)__dst + 266);
    if (v197 == 2)
    {
LABEL_199:
      uint64_t v164 = __dst + 2056;
      long long v165 = __src + 2056;
      size_t v166 = 352;
      goto LABEL_200;
    }
    uint64_t v198 = *((void *)__src + 266);
    if (v198 == 2)
    {
      sub_2577FDD60((uint64_t)(__dst + 2056));
      goto LABEL_199;
    }
    if (v197 == 1) {
      goto LABEL_205;
    }
    if (v198 == 1)
    {
      sub_257735730((uint64_t)(__dst + 2056));
LABEL_205:
      long long v200 = *(_OWORD *)(__src + 2200);
      *(_OWORD *)(__dst + 2184) = *(_OWORD *)(__src + 2184);
      *(_OWORD *)(__dst + 2200) = v200;
      *(_OWORD *)(__dst + 2216) = *(_OWORD *)(__src + 2216);
      long long v201 = *(_OWORD *)(__src + 2136);
      *(_OWORD *)(__dst + 2120) = *(_OWORD *)(__src + 2120);
      *(_OWORD *)(__dst + 2136) = v201;
      long long v202 = *(_OWORD *)(__src + 2168);
      *(_OWORD *)(__dst + 2152) = *(_OWORD *)(__src + 2152);
      *(_OWORD *)(__dst + 2168) = v202;
      long long v203 = *(_OWORD *)(__src + 2072);
      *long long v195 = *v196;
      *(_OWORD *)(__dst + 2072) = v203;
      long long v204 = *(_OWORD *)(__src + 2104);
      *(_OWORD *)(__dst + 2088) = *(_OWORD *)(__src + 2088);
      *(_OWORD *)(__dst + 2104) = v204;
      goto LABEL_206;
    }
    if (v197)
    {
      if (v198)
      {
        char v292 = __src[2124];
        int v293 = *((_DWORD *)__src + 530);
        uint64_t v294 = *((void *)__dst + 257);
        uint64_t v295 = *((void *)__dst + 258);
        uint64_t v296 = *((void *)__dst + 259);
        uint64_t v297 = *((void *)__dst + 260);
        uint64_t v298 = *((void *)__dst + 261);
        uint64_t v299 = *((void *)__dst + 262);
        uint64_t v300 = *((void *)__dst + 263);
        uint64_t v301 = *((void *)__dst + 264);
        unint64_t v302 = *((unsigned int *)__dst + 530) | ((unint64_t)__dst[2124] << 32);
        long long v303 = *(_OWORD *)(__src + 2072);
        *(_OWORD *)(__dst + 2056) = *(_OWORD *)(__src + 2056);
        *(_OWORD *)(__dst + 2072) = v303;
        long long v304 = *(_OWORD *)(__src + 2104);
        *(_OWORD *)(__dst + 2088) = *(_OWORD *)(__src + 2088);
        *(_OWORD *)(__dst + 2104) = v304;
        *((_DWORD *)__dst + 530) = v293;
        __dst[2124] = v292;
        sub_25771D110(v294, v295, v296, v297, v298, v299, v300, v301, v302);
        *((void *)__dst + 266) = *((void *)__src + 266);
        swift_bridgeObjectRelease();
        *((void *)__dst + 267) = *((void *)__src + 267);
        swift_bridgeObjectRelease();
        goto LABEL_266;
      }
      sub_2577270D4((uint64_t)(__dst + 2056), &qword_26A030F50);
    }
    long long v404 = *(_OWORD *)(__src + 2104);
    *(_OWORD *)(__dst + 2088) = *(_OWORD *)(__src + 2088);
    *(_OWORD *)(__dst + 2104) = v404;
    *(_OWORD *)(__dst + 2120) = *(_OWORD *)(__src + 2120);
    *((void *)__dst + 267) = *((void *)__src + 267);
    long long v405 = *(_OWORD *)(__src + 2072);
    *long long v195 = *v196;
    *(_OWORD *)(__dst + 2072) = v405;
LABEL_266:
    if (*((void *)__dst + 277))
    {
      if (*((void *)__src + 277))
      {
        char v406 = __src[2212];
        int v407 = *((_DWORD *)__src + 552);
        uint64_t v408 = *((void *)__dst + 268);
        uint64_t v409 = *((void *)__dst + 269);
        uint64_t v410 = *((void *)__dst + 270);
        uint64_t v411 = *((void *)__dst + 271);
        uint64_t v412 = *((void *)__dst + 272);
        uint64_t v413 = *((void *)__dst + 273);
        uint64_t v414 = *((void *)__dst + 274);
        uint64_t v415 = *((void *)__dst + 275);
        unint64_t v416 = *((unsigned int *)__dst + 552) | ((unint64_t)__dst[2212] << 32);
        *((_OWORD *)__dst + 134) = *((_OWORD *)__src + 134);
        *((_OWORD *)__dst + 135) = *((_OWORD *)__src + 135);
        *((_OWORD *)__dst + 136) = *((_OWORD *)__src + 136);
        *((_OWORD *)__dst + 137) = *((_OWORD *)__src + 137);
        *((_DWORD *)__dst + 552) = v407;
        __dst[2212] = v406;
        sub_25771D110(v408, v409, v410, v411, v412, v413, v414, v415, v416);
        *((void *)__dst + 277) = *((void *)__src + 277);
        swift_bridgeObjectRelease();
        *((void *)__dst + 278) = *((void *)__src + 278);
        swift_bridgeObjectRelease();
        goto LABEL_206;
      }
      sub_2577270D4((uint64_t)(__dst + 2144), &qword_26A030F50);
    }
    long long v442 = *((_OWORD *)__src + 137);
    *((_OWORD *)__dst + 136) = *((_OWORD *)__src + 136);
    *((_OWORD *)__dst + 137) = v442;
    *((_OWORD *)__dst + 138) = *((_OWORD *)__src + 138);
    *((void *)__dst + 278) = *((void *)__src + 278);
    long long v443 = *((_OWORD *)__src + 135);
    *((_OWORD *)__dst + 134) = *((_OWORD *)__src + 134);
    *((_OWORD *)__dst + 135) = v443;
LABEL_206:
    uint64_t v205 = __dst + 2232;
    uint64_t v206 = __src + 2232;
    uint64_t v207 = *((void *)__dst + 288);
    if (v207 == 1)
    {
LABEL_209:
      long long v209 = *(_OWORD *)(__src + 2376);
      *(_OWORD *)(__dst + 2360) = *(_OWORD *)(__src + 2360);
      *(_OWORD *)(__dst + 2376) = v209;
      *(_OWORD *)(__dst + 2392) = *(_OWORD *)(__src + 2392);
      long long v210 = *(_OWORD *)(__src + 2312);
      *(_OWORD *)(__dst + 2296) = *(_OWORD *)(__src + 2296);
      *(_OWORD *)(__dst + 2312) = v210;
      long long v211 = *(_OWORD *)(__src + 2344);
      *(_OWORD *)(__dst + 2328) = *(_OWORD *)(__src + 2328);
      *(_OWORD *)(__dst + 2344) = v211;
      long long v212 = *(_OWORD *)(__src + 2248);
      _OWORD *v205 = *v206;
      *(_OWORD *)(__dst + 2248) = v212;
      long long v213 = *(_OWORD *)(__src + 2280);
      *(_OWORD *)(__dst + 2264) = *(_OWORD *)(__src + 2264);
      *(_OWORD *)(__dst + 2280) = v213;
      return __dst;
    }
    uint64_t v208 = *((void *)__src + 288);
    if (v208 == 1)
    {
      sub_2577356DC((uint64_t)(__dst + 2232));
      goto LABEL_209;
    }
    if (v207)
    {
      if (v208)
      {
        char v305 = __src[2300];
        int v306 = *((_DWORD *)__src + 574);
        uint64_t v307 = *((void *)__dst + 279);
        uint64_t v308 = *((void *)__dst + 280);
        uint64_t v309 = *((void *)__dst + 281);
        uint64_t v310 = *((void *)__dst + 282);
        uint64_t v311 = *((void *)__dst + 283);
        uint64_t v312 = *((void *)__dst + 284);
        uint64_t v313 = *((void *)__dst + 285);
        uint64_t v314 = *((void *)__dst + 286);
        unint64_t v315 = *((unsigned int *)__dst + 574) | ((unint64_t)__dst[2300] << 32);
        long long v316 = *(_OWORD *)(__src + 2248);
        *(_OWORD *)(__dst + 2232) = *(_OWORD *)(__src + 2232);
        *(_OWORD *)(__dst + 2248) = v316;
        long long v317 = *(_OWORD *)(__src + 2280);
        *(_OWORD *)(__dst + 2264) = *(_OWORD *)(__src + 2264);
        *(_OWORD *)(__dst + 2280) = v317;
        *((_DWORD *)__dst + 574) = v306;
        __dst[2300] = v305;
        sub_25771D110(v307, v308, v309, v310, v311, v312, v313, v314, v315);
        *((void *)__dst + 288) = *((void *)__src + 288);
        swift_bridgeObjectRelease();
        *((void *)__dst + 289) = *((void *)__src + 289);
        swift_bridgeObjectRelease();
        goto LABEL_271;
      }
      sub_2577270D4((uint64_t)(__dst + 2232), &qword_26A030F50);
    }
    long long v417 = *(_OWORD *)(__src + 2280);
    *(_OWORD *)(__dst + 2264) = *(_OWORD *)(__src + 2264);
    *(_OWORD *)(__dst + 2280) = v417;
    *(_OWORD *)(__dst + 2296) = *(_OWORD *)(__src + 2296);
    *((void *)__dst + 289) = *((void *)__src + 289);
    long long v418 = *(_OWORD *)(__src + 2248);
    _OWORD *v205 = *v206;
    *(_OWORD *)(__dst + 2248) = v418;
LABEL_271:
    if (*((void *)__dst + 299))
    {
      if (*((void *)__src + 299))
      {
        char v419 = __src[2388];
        int v420 = *((_DWORD *)__src + 596);
        uint64_t v421 = *((void *)__dst + 290);
        uint64_t v422 = *((void *)__dst + 291);
        uint64_t v423 = *((void *)__dst + 292);
        uint64_t v424 = *((void *)__dst + 293);
        uint64_t v425 = *((void *)__dst + 294);
        uint64_t v426 = *((void *)__dst + 295);
        uint64_t v427 = *((void *)__dst + 296);
        uint64_t v428 = *((void *)__dst + 297);
        unint64_t v429 = *((unsigned int *)__dst + 596) | ((unint64_t)__dst[2388] << 32);
        *((_OWORD *)__dst + 145) = *((_OWORD *)__src + 145);
        *((_OWORD *)__dst + 146) = *((_OWORD *)__src + 146);
        *((_OWORD *)__dst + 147) = *((_OWORD *)__src + 147);
        *((_OWORD *)__dst + 148) = *((_OWORD *)__src + 148);
        *((_DWORD *)__dst + 596) = v420;
        __dst[2388] = v419;
        sub_25771D110(v421, v422, v423, v424, v425, v426, v427, v428, v429);
        *((void *)__dst + 299) = *((void *)__src + 299);
        swift_bridgeObjectRelease();
        *((void *)__dst + 300) = *((void *)__src + 300);
        swift_bridgeObjectRelease();
        return __dst;
      }
      sub_2577270D4((uint64_t)(__dst + 2320), &qword_26A030F50);
    }
    long long v444 = *((_OWORD *)__src + 148);
    *((_OWORD *)__dst + 147) = *((_OWORD *)__src + 147);
    *((_OWORD *)__dst + 148) = v444;
    *((_OWORD *)__dst + 149) = *((_OWORD *)__src + 149);
    *((void *)__dst + 300) = *((void *)__src + 300);
    long long v445 = *((_OWORD *)__src + 146);
    *((_OWORD *)__dst + 145) = *((_OWORD *)__src + 145);
    *((_OWORD *)__dst + 146) = v445;
    return __dst;
  }
LABEL_175:
  uint64_t v164 = __dst + 1704;
  long long v165 = __src + 1704;
  size_t v166 = 704;
LABEL_200:
  memcpy(v164, v165, v166);
  return __dst;
}

uint64_t getEnumTagSinglePayload for ActivityFlexibleUpdateTheme(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 2408)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 888);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdateTheme(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 2376) = 0u;
    *(_OWORD *)(result + 2392) = 0u;
    *(_OWORD *)(result + 2360) = 0u;
    *(_OWORD *)(result + 2344) = 0u;
    *(_OWORD *)(result + 2328) = 0u;
    *(_OWORD *)(result + 2312) = 0u;
    *(_OWORD *)(result + 2296) = 0u;
    *(_OWORD *)(result + 2280) = 0u;
    *(_OWORD *)(result + 2264) = 0u;
    *(_OWORD *)(result + 2248) = 0u;
    *(_OWORD *)(result + 2232) = 0u;
    *(_OWORD *)(result + 2216) = 0u;
    *(_OWORD *)(result + 2200) = 0u;
    *(_OWORD *)(result + 2184) = 0u;
    *(_OWORD *)(result + 2168) = 0u;
    *(_OWORD *)(result + 2152) = 0u;
    *(_OWORD *)(result + 2136) = 0u;
    *(_OWORD *)(result + 2120) = 0u;
    *(_OWORD *)(result + 2104) = 0u;
    *(_OWORD *)(result + 2088) = 0u;
    *(_OWORD *)(result + 2072) = 0u;
    *(_OWORD *)(result + 2056) = 0u;
    *(_OWORD *)(result + 2040) = 0u;
    *(_OWORD *)(result + 2024) = 0u;
    *(_OWORD *)(result + 2008) = 0u;
    *(_OWORD *)(result + 1992) = 0u;
    *(_OWORD *)(result + 1976) = 0u;
    *(_OWORD *)(result + 1960) = 0u;
    *(_OWORD *)(result + 1944) = 0u;
    *(_OWORD *)(result + 1928) = 0u;
    *(_OWORD *)(result + 1912) = 0u;
    *(_OWORD *)(result + 1896) = 0u;
    *(_OWORD *)(result + 1880) = 0u;
    *(_OWORD *)(result + 1864) = 0u;
    *(_OWORD *)(result + 1848) = 0u;
    *(_OWORD *)(result + 1832) = 0u;
    *(_OWORD *)(result + 1816) = 0u;
    *(_OWORD *)(result + 1800) = 0u;
    *(_OWORD *)(result + 1784) = 0u;
    *(_OWORD *)(result + 1768) = 0u;
    *(_OWORD *)(result + 1752) = 0u;
    *(_OWORD *)(result + 1736) = 0u;
    *(_OWORD *)(result + 1720) = 0u;
    *(_OWORD *)(result + 1704) = 0u;
    *(_OWORD *)(result + 1688) = 0u;
    *(_OWORD *)(result + 1672) = 0u;
    *(_OWORD *)(result + 1656) = 0u;
    *(_OWORD *)(result + 1640) = 0u;
    *(_OWORD *)(result + 1624) = 0u;
    *(_OWORD *)(result + 1608) = 0u;
    *(_OWORD *)(result + 1592) = 0u;
    *(_OWORD *)(result + 1576) = 0u;
    *(_OWORD *)(result + 1560) = 0u;
    *(_OWORD *)(result + 1544) = 0u;
    *(_OWORD *)(result + 1528) = 0u;
    *(_OWORD *)(result + 1512) = 0u;
    *(_OWORD *)(result + 1496) = 0u;
    *(_OWORD *)(result + 1480) = 0u;
    *(_OWORD *)(result + 1464) = 0u;
    *(_OWORD *)(result + 1448) = 0u;
    *(_OWORD *)(result + 1432) = 0u;
    *(_OWORD *)(result + 1416) = 0u;
    *(_OWORD *)(result + 1400) = 0u;
    *(_OWORD *)(result + 1384) = 0u;
    *(_OWORD *)(result + 1368) = 0u;
    *(_OWORD *)(result + 1352) = 0u;
    *(_OWORD *)(result + 1336) = 0u;
    *(_OWORD *)(result + 1320) = 0u;
    *(_OWORD *)(result + 1304) = 0u;
    *(_OWORD *)(result + 1288) = 0u;
    *(_OWORD *)(result + 1272) = 0u;
    *(_OWORD *)(result + 1256) = 0u;
    *(_OWORD *)(result + 1240) = 0u;
    *(_OWORD *)(result + 1224) = 0u;
    *(_OWORD *)(result + 1208) = 0u;
    *(_OWORD *)(result + 1192) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 2408) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 2408) = 0;
    }
    if (a2) {
      *(void *)(result + 888) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdateTheme()
{
  return &type metadata for ActivityFlexibleUpdateTheme;
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v8 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)(a1 + *(int *)(v9 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 28));
        *(void *)(a1 + *(int *)(v9 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 32));
        uint64_t v10 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)(a1 + *(int *)(v10 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v10 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v12 = *a2;
      uint64_t v13 = a2[1];
      char v14 = *((unsigned char *)a2 + 16);
      sub_25772F9EC();
      *(void *)a1 = v12;
      *(void *)(a1 + 8) = v13;
      *(unsigned char *)(a1 + 16) = v14;
      *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
    *(void *)(a1 + *(int *)(v15 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v15 + 28));
    *(void *)(a1 + *(int *)(v15 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v15 + 32));
    uint64_t v16 = *(int *)(a3 + 24);
    *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    long long v17 = (void *)(a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v22 = swift_getEnumCaseMultiPayload();
        uint64_t v23 = sub_257B43740();
        (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v23 - 8) + 16))(v17, v18, v23);
        if (v22 == 1)
        {
          uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)((char *)v17 + *(int *)(v24 + 28)) = *(uint64_t *)((char *)v18 + *(int *)(v24 + 28));
          *(void *)((char *)v17 + *(int *)(v24 + 32)) = *(uint64_t *)((char *)v18 + *(int *)(v24 + 32));
          uint64_t v25 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)((char *)v17 + *(int *)(v25 + 20)) = *(uint64_t *)((char *)v18 + *(int *)(v25 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v26 = *v18;
        uint64_t v27 = v18[1];
        char v28 = *((unsigned char *)v18 + 16);
        sub_25772F9EC();
        *long long v17 = v26;
        v17[1] = v27;
        *((unsigned char *)v17 + 16) = v28;
        *(_WORD *)((char *)v17 + 17) = *(_WORD *)((char *)v18 + 17);
      }
      swift_storeEnumTagMultiPayload();
      *(void *)((char *)v17 + *(int *)(v15 + 28)) = *(uint64_t *)((char *)v18 + *(int *)(v15 + 28));
      *(void *)((char *)v17 + *(int *)(v15 + 32)) = *(uint64_t *)((char *)v18 + *(int *)(v15 + 32));
      long long v29 = *(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29(v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t destroy for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t a2)
{
  type metadata accessor for ActivityAsset();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for URLAssetConfiguration.Format(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_257B43740();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
    if (EnumCaseMultiPayload == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for URLAssetConfiguration.Recipe(0);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_25773042C();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v9 = swift_getEnumCaseMultiPayload();
      uint64_t v10 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v6, v10);
      if (v9 == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for URLAssetConfiguration.Recipe(0);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_25773042C();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  type metadata accessor for ActivityAsset();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for URLAssetConfiguration.Format(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = sub_257B43740();
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
      *(void *)(a1 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
      *(void *)(a1 + *(int *)(v8 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 32));
      uint64_t v9 = type metadata accessor for URLAssetConfiguration.Recipe(0);
      *(void *)(a1 + *(int *)(v9 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    uint64_t v10 = *a2;
    uint64_t v11 = a2[1];
    char v12 = *((unsigned char *)a2 + 16);
    sub_25772F9EC();
    *(void *)a1 = v10;
    *(void *)(a1 + 8) = v11;
    *(unsigned char *)(a1 + 16) = v12;
    *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)(a1 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 28));
  *(void *)(a1 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 32));
  uint64_t v14 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (uint64_t *)((char *)a2 + v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v20 = swift_getEnumCaseMultiPayload();
      uint64_t v21 = sub_257B43740();
      (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v21 - 8) + 16))(v15, v16, v21);
      if (v20 == 1)
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)((char *)v15 + *(int *)(v22 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v22 + 28));
        *(void *)((char *)v15 + *(int *)(v22 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v22 + 32));
        uint64_t v23 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)((char *)v15 + *(int *)(v23 + 20)) = *(uint64_t *)((char *)v16 + *(int *)(v23 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v24 = *v16;
      uint64_t v25 = v16[1];
      char v26 = *((unsigned char *)v16 + 16);
      sub_25772F9EC();
      *uint64_t v15 = v24;
      v15[1] = v25;
      *((unsigned char *)v15 + 16) = v26;
      *(_WORD *)((char *)v15 + 17) = *(_WORD *)((char *)v16 + 17);
    }
    swift_storeEnumTagMultiPayload();
    *(void *)((char *)v15 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 28));
    *(void *)((char *)v15 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 32));
    uint64_t v27 = *(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t assignWithCopy for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  if ((uint64_t *)a1 != a2)
  {
    sub_257B2F584(a1, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v7 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)(a1 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
        *(void *)(a1 + *(int *)(v8 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 32));
        uint64_t v9 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)(a1 + *(int *)(v9 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v10 = *a2;
      uint64_t v11 = a2[1];
      char v12 = *((unsigned char *)a2 + 16);
      sub_25772F9EC();
      *(void *)a1 = v10;
      *(void *)(a1 + 8) = v11;
      *(unsigned char *)(a1 + 16) = v12;
      *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
      *(unsigned char *)(a1 + 18) = *((unsigned char *)a2 + 18);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)(a1 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = (uint64_t *)((char *)a2 + v14);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19((uint64_t)v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v22 = swift_getEnumCaseMultiPayload();
        uint64_t v23 = sub_257B43740();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v23 - 8) + 16))(v15, v16, v23);
        if (v22 == 1)
        {
          uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)(v15 + *(int *)(v24 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v24 + 28));
          *(void *)(v15 + *(int *)(v24 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v24 + 32));
          uint64_t v25 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)(v15 + *(int *)(v25 + 20)) = *(uint64_t *)((char *)v16 + *(int *)(v25 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        uint64_t v31 = *v16;
        uint64_t v32 = v16[1];
        char v33 = *((unsigned char *)v16 + 16);
        sub_25772F9EC();
        *(void *)uint64_t v15 = v31;
        *(void *)(v15 + 8) = v32;
        *(unsigned char *)(v15 + 16) = v33;
        *(unsigned char *)(v15 + 17) = *((unsigned char *)v16 + 17);
        *(unsigned char *)(v15 + 18) = *((unsigned char *)v16 + 18);
      }
      swift_storeEnumTagMultiPayload();
      *(void *)(v15 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 28));
      *(void *)(v15 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 32));
      uint64_t v34 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v34(v15, 0, 1, v17);
      return a1;
    }
LABEL_15:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
    memcpy((void *)v15, v16, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  if (v21)
  {
    sub_2577270D4(v15, (uint64_t *)&unk_26B2DD028);
    goto LABEL_15;
  }
  if ((uint64_t *)a1 != a2)
  {
    sub_257B2F584(v15, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v27 = swift_getEnumCaseMultiPayload();
      uint64_t v28 = sub_257B43740();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 16))(v15, v16, v28);
      if (v27 == 1)
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)(v15 + *(int *)(v29 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v29 + 28));
        *(void *)(v15 + *(int *)(v29 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v29 + 32));
        uint64_t v30 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)(v15 + *(int *)(v30 + 20)) = *(uint64_t *)((char *)v16 + *(int *)(v30 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v35 = *v16;
      uint64_t v36 = v16[1];
      char v37 = *((unsigned char *)v16 + 16);
      sub_25772F9EC();
      *(void *)uint64_t v15 = v35;
      *(void *)(v15 + 8) = v36;
      *(unsigned char *)(v15 + 16) = v37;
      *(unsigned char *)(v15 + 17) = *((unsigned char *)v16 + 17);
      *(unsigned char *)(v15 + 18) = *((unsigned char *)v16 + 18);
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)(v15 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v15 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for ActivityFlexibleUpdate.Graphic(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActivityAsset();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for URLAssetConfiguration.Format(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v8 = sub_257B43740();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
      *(void *)&a1[*(int *)(v9 + 28)] = *(void *)&a2[*(int *)(v9 + 28)];
      *(void *)&a1[*(int *)(v9 + 32)] = *(void *)&a2[*(int *)(v9 + 32)];
      uint64_t v10 = type metadata accessor for URLAssetConfiguration.Recipe(0);
      *(void *)&a1[*(int *)(v10 + 20)] = *(void *)&a2[*(int *)(v10 + 20)];
    }
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)&a1[*(int *)(v11 + 28)] = *(void *)&a2[*(int *)(v11 + 28)];
  *(void *)&a1[*(int *)(v11 + 32)] = *(void *)&a2[*(int *)(v11 + 32)];
  uint64_t v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v18 = swift_getEnumCaseMultiPayload();
      uint64_t v19 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v13, v14, v19);
      if (v18 == 1)
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&v13[*(int *)(v20 + 28)] = *(void *)&v14[*(int *)(v20 + 28)];
        *(void *)&v13[*(int *)(v20 + 32)] = *(void *)&v14[*(int *)(v20 + 32)];
        uint64_t v21 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&v13[*(int *)(v21 + 20)] = *(void *)&v14[*(int *)(v21 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v6 - 8) + 64));
    }
    *(void *)&v13[*(int *)(v11 + 28)] = *(void *)&v14[*(int *)(v11 + 28)];
    *(void *)&v13[*(int *)(v11 + 32)] = *(void *)&v14[*(int *)(v11 + 32)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

char *assignWithTake for ActivityFlexibleUpdate.Graphic(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_257B2F584((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    uint64_t v6 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v8 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&a1[*(int *)(v9 + 28)] = *(void *)&a2[*(int *)(v9 + 28)];
        *(void *)&a1[*(int *)(v9 + 32)] = *(void *)&a2[*(int *)(v9 + 32)];
        uint64_t v10 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&a1[*(int *)(v10 + 20)] = *(void *)&a2[*(int *)(v10 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031020);
  *(void *)&a1[*(int *)(v11 + 28)] = *(void *)&a2[*(int *)(v11 + 28)];
  swift_bridgeObjectRelease();
  *(void *)&a1[*(int *)(v11 + 32)] = *(void *)&a2[*(int *)(v11 + 32)];
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      uint64_t v20 = type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        int v21 = swift_getEnumCaseMultiPayload();
        uint64_t v22 = sub_257B43740();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v13, v14, v22);
        if (v21 == 1)
        {
          uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
          *(void *)&v13[*(int *)(v23 + 28)] = *(void *)&v14[*(int *)(v23 + 28)];
          *(void *)&v13[*(int *)(v23 + 32)] = *(void *)&v14[*(int *)(v23 + 32)];
          uint64_t v24 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(void *)&v13[*(int *)(v24 + 20)] = *(void *)&v14[*(int *)(v24 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
      }
      *(void *)&v13[*(int *)(v11 + 28)] = *(void *)&v14[*(int *)(v11 + 28)];
      *(void *)&v13[*(int *)(v11 + 32)] = *(void *)&v14[*(int *)(v11 + 32)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      return a1;
    }
LABEL_14:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
    memcpy(v13, v14, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  if (v19)
  {
    sub_2577270D4((uint64_t)v13, (uint64_t *)&unk_26B2DD028);
    goto LABEL_14;
  }
  if (a1 != a2)
  {
    sub_257B2F584((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ActivityAsset);
    uint64_t v26 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      int v27 = swift_getEnumCaseMultiPayload();
      uint64_t v28 = sub_257B43740();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v13, v14, v28);
      if (v27 == 1)
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031018);
        *(void *)&v13[*(int *)(v29 + 28)] = *(void *)&v14[*(int *)(v29 + 28)];
        *(void *)&v13[*(int *)(v29 + 32)] = *(void *)&v14[*(int *)(v29 + 32)];
        uint64_t v30 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(void *)&v13[*(int *)(v30 + 20)] = *(void *)&v14[*(int *)(v30 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v26 - 8) + 64));
    }
  }
  *(void *)&v13[*(int *)(v11 + 28)] = *(void *)&v14[*(int *)(v11 + 28)];
  swift_bridgeObjectRelease();
  *(void *)&v13[*(int *)(v11 + 32)] = *(void *)&v14[*(int *)(v11 + 32)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_257B3D70C);
}

uint64_t sub_257B3D70C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 253)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 3) {
      return v10 - 2;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_257B3D84C);
}

uint64_t sub_257B3D84C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2DD028);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 253)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A031028);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_257B3D97C()
{
  sub_257B3DA7C(319, qword_26B2DD2E0, (uint64_t (*)(uint64_t))type metadata accessor for ActivityAsset, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Dynamic.Variant);
  if (v0 <= 0x3F)
  {
    sub_2578219B4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_257B3DA7C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdate.GraphicSize()
{
  return &type metadata for ActivityFlexibleUpdate.GraphicSize;
}

uint64_t destroy for ActivityFlexibleUpdateTheme.Graphic(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = (unsigned int *)(result + 328);
  uint64_t v3 = *(void *)(result + 72);
  if (v3)
  {
    if (v3 == 1) {
      goto LABEL_7;
    }
    if (v3 == 2) {
      goto LABEL_12;
    }
    sub_25771D110(*(void *)result, *(void *)(result + 8), *(void *)(result + 16), *(void *)(result + 24), *(void *)(result + 32), *(void *)(result + 40), *(void *)(result + 48), *(void *)(result + 56), *(unsigned int *)(result + 64) | ((unint64_t)*(unsigned __int8 *)(result + 68) << 32));
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + 160))
  {
    sub_25771D110(*(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120), *(void *)(v1 + 128), *(void *)(v1 + 136), *(void *)(v1 + 144), *(unsigned int *)(v1 + 152) | ((unint64_t)*(unsigned __int8 *)(v1 + 156) << 32));
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
LABEL_7:
  uint64_t v4 = *(void *)(v1 + 248);
  if (v4)
  {
    if (v4 == 1) {
      goto LABEL_12;
    }
    sub_25771D110(*(void *)(v1 + 176), *(void *)(v1 + 184), *(void *)(v1 + 192), *(void *)(v1 + 200), *(void *)(v1 + 208), *(void *)(v1 + 216), *(void *)(v1 + 224), *(void *)(v1 + 232), *(unsigned int *)(v1 + 240) | ((unint64_t)*(unsigned __int8 *)(v1 + 244) << 32));
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + 336))
  {
    sub_25771D110(*(void *)(v1 + 264), *(void *)(v1 + 272), *(void *)(v1 + 280), *(void *)(v1 + 288), *(void *)(v1 + 296), *(void *)(v1 + 304), *(void *)(v1 + 312), *(void *)(v1 + 320), *v2 | ((unint64_t)*((unsigned __int8 *)v2 + 4) << 32));
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
LABEL_12:
  uint64_t v5 = *(void *)(v1 + 424);
  if (v5)
  {
    if (v5 == 1) {
      goto LABEL_18;
    }
    if (v5 == 2) {
      return result;
    }
    sub_25771D110(*(void *)(v1 + 352), *(void *)(v1 + 360), *(void *)(v1 + 368), *(void *)(v1 + 376), *(void *)(v1 + 384), *(void *)(v1 + 392), *(void *)(v1 + 400), *(void *)(v1 + 408), v2[22] | ((unint64_t)*((unsigned __int8 *)v2 + 92) << 32));
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + 512))
  {
    sub_25771D110(*(void *)(v1 + 440), *(void *)(v1 + 448), *(void *)(v1 + 456), *(void *)(v1 + 464), *(void *)(v1 + 472), *(void *)(v1 + 480), *(void *)(v1 + 488), *(void *)(v1 + 496), v2[44] | ((unint64_t)*((unsigned __int8 *)v2 + 180) << 32));
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
LABEL_18:
  uint64_t v6 = *(void *)(v1 + 600);
  if (v6)
  {
    if (v6 == 1) {
      return result;
    }
    sub_25771D110(*(void *)(v1 + 528), *(void *)(v1 + 536), *(void *)(v1 + 544), *(void *)(v1 + 552), *(void *)(v1 + 560), *(void *)(v1 + 568), *(void *)(v1 + 576), *(void *)(v1 + 584), v2[66] | ((unint64_t)*((unsigned __int8 *)v2 + 268) << 32));
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (*(void *)(v1 + 688))
  {
    sub_25771D110(*(void *)(v1 + 616), *(void *)(v1 + 624), *(void *)(v1 + 632), *(void *)(v1 + 640), *(void *)(v1 + 648), *(void *)(v1 + 656), *(void *)(v1 + 664), *(void *)(v1 + 672), v2[88] | ((unint64_t)*((unsigned __int8 *)v2 + 356) << 32));
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_OWORD *initializeWithCopy for ActivityFlexibleUpdateTheme.Graphic(_OWORD *__dst, char *__src)
{
  uint64_t v135 = (unsigned int *)(__src + 328);
  uint64_t v137 = (char *)__dst + 328;
  uint64_t v4 = *((void *)__src + 9);
  switch(v4)
  {
    case 0:
      long long v5 = *((_OWORD *)__src + 3);
      __dst[2] = *((_OWORD *)__src + 2);
      __dst[3] = v5;
      __dst[4] = *((_OWORD *)__src + 4);
      *((void *)__dst + 10) = *((void *)__src + 10);
      long long v6 = *((_OWORD *)__src + 1);
      void *__dst = *(_OWORD *)__src;
      __dst[1] = v6;
      if (!*((void *)__src + 20)) {
        goto LABEL_9;
      }
LABEL_6:
      uint64_t v7 = *((void *)__src + 11);
      uint64_t v8 = *((void *)__src + 12);
      uint64_t v9 = *((void *)__src + 13);
      uint64_t v10 = *((void *)__src + 14);
      uint64_t v11 = *((void *)__src + 15);
      uint64_t v12 = *((void *)__src + 16);
      uint64_t v13 = *((void *)__src + 17);
      uint64_t v14 = *((void *)__src + 18);
      uint64_t v120 = __src[156];
      uint64_t v127 = *((unsigned int *)__src + 38);
      sub_25771CCF8(v7, v8, v9, v10, v11, v12, v13, v14, v127 | (v120 << 32));
      *((void *)__dst + 11) = v7;
      *((void *)__dst + 12) = v8;
      *((void *)__dst + 13) = v9;
      *((void *)__dst + 14) = v10;
      *((void *)__dst + 15) = v11;
      *((void *)__dst + 16) = v12;
      *((void *)__dst + 17) = v13;
      *((void *)__dst + 18) = v14;
      *((unsigned char *)__dst + 156) = v120;
      *((_DWORD *)__dst + 38) = v127;
      uint64_t v15 = *((void *)__src + 21);
      *((void *)__dst + 20) = *((void *)__src + 20);
      *((void *)__dst + 21) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_10;
    case 1:
      long long v16 = *((_OWORD *)__src + 9);
      __dst[8] = *((_OWORD *)__src + 8);
      __dst[9] = v16;
      __dst[10] = *((_OWORD *)__src + 10);
      long long v17 = *((_OWORD *)__src + 5);
      __dst[4] = *((_OWORD *)__src + 4);
      __dst[5] = v17;
      long long v18 = *((_OWORD *)__src + 7);
      __dst[6] = *((_OWORD *)__src + 6);
      __dst[7] = v18;
      long long v19 = *((_OWORD *)__src + 1);
      void *__dst = *(_OWORD *)__src;
      __dst[1] = v19;
      long long v20 = *((_OWORD *)__src + 3);
      __dst[2] = *((_OWORD *)__src + 2);
      __dst[3] = v20;
      goto LABEL_10;
    case 2:
      memcpy(__dst, __src, 0x160uLL);
      goto LABEL_17;
  }
  uint64_t v21 = *(void *)__src;
  uint64_t v22 = *((void *)__src + 1);
  uint64_t v23 = *((void *)__src + 2);
  uint64_t v24 = *((void *)__src + 3);
  uint64_t v25 = *((void *)__src + 4);
  uint64_t v26 = *((void *)__src + 5);
  uint64_t v27 = *((void *)__src + 6);
  uint64_t v28 = *((void *)__src + 7);
  uint64_t v121 = __src[68];
  uint64_t v128 = *((unsigned int *)__src + 16);
  sub_25771CCF8(*(void *)__src, v22, v23, v24, v25, v26, v27, v28, v128 | (v121 << 32));
  *(void *)__dst = v21;
  *((void *)__dst + 1) = v22;
  *((void *)__dst + 2) = v23;
  *((void *)__dst + 3) = v24;
  *((void *)__dst + 4) = v25;
  *((void *)__dst + 5) = v26;
  *((void *)__dst + 6) = v27;
  *((void *)__dst + 7) = v28;
  *((unsigned char *)__dst + 68) = v121;
  *((_DWORD *)__dst + 16) = v128;
  uint64_t v29 = *((void *)__src + 10);
  *((void *)__dst + 9) = *((void *)__src + 9);
  *((void *)__dst + 10) = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (*((void *)__src + 20)) {
    goto LABEL_6;
  }
LABEL_9:
  long long v30 = *(_OWORD *)(__src + 136);
  *(_OWORD *)((char *)__dst + 120) = *(_OWORD *)(__src + 120);
  *(_OWORD *)((char *)__dst + 136) = v30;
  *(_OWORD *)((char *)__dst + 152) = *(_OWORD *)(__src + 152);
  *((void *)__dst + 21) = *((void *)__src + 21);
  long long v31 = *(_OWORD *)(__src + 104);
  *(_OWORD *)((char *)__dst + 88) = *(_OWORD *)(__src + 88);
  *(_OWORD *)((char *)__dst + 104) = v31;
LABEL_10:
  uint64_t v32 = __dst + 11;
  char v33 = __src + 176;
  uint64_t v34 = *((void *)__src + 31);
  if (v34)
  {
    if (v34 == 1)
    {
      long long v35 = *((_OWORD *)__src + 20);
      __dst[19] = *((_OWORD *)__src + 19);
      __dst[20] = v35;
      __dst[21] = *((_OWORD *)__src + 21);
      long long v36 = *((_OWORD *)__src + 16);
      __dst[15] = *((_OWORD *)__src + 15);
      __dst[16] = v36;
      long long v37 = *((_OWORD *)__src + 18);
      __dst[17] = *((_OWORD *)__src + 17);
      __dst[18] = v37;
      long long v38 = *((_OWORD *)__src + 12);
      *uint64_t v32 = *v33;
      __dst[12] = v38;
      long long v39 = *((_OWORD *)__src + 14);
      __dst[13] = *((_OWORD *)__src + 13);
      __dst[14] = v39;
      goto LABEL_17;
    }
    uint64_t v51 = *((void *)__src + 22);
    uint64_t v52 = *((void *)__src + 23);
    uint64_t v53 = *((void *)__src + 24);
    uint64_t v54 = *((void *)__src + 25);
    uint64_t v55 = *((void *)__src + 26);
    uint64_t v56 = *((void *)__src + 27);
    uint64_t v57 = *((void *)__src + 28);
    uint64_t v58 = *((void *)__src + 29);
    uint64_t v123 = __src[244];
    uint64_t v130 = *((unsigned int *)__src + 60);
    sub_25771CCF8(v51, v52, v53, v54, v55, v56, v57, v58, v130 | (v123 << 32));
    *((void *)__dst + 22) = v51;
    *((void *)__dst + 23) = v52;
    *((void *)__dst + 24) = v53;
    *((void *)__dst + 25) = v54;
    *((void *)__dst + 26) = v55;
    *((void *)__dst + 27) = v56;
    *((void *)__dst + 28) = v57;
    *((void *)__dst + 29) = v58;
    *((unsigned char *)__dst + 244) = v123;
    *((_DWORD *)__dst + 60) = v130;
    uint64_t v59 = *((void *)__src + 32);
    *((void *)__dst + 31) = *((void *)__src + 31);
    *((void *)__dst + 32) = v59;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!*((void *)__src + 42)) {
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v42 = *((void *)__src + 33);
    uint64_t v43 = *((void *)__src + 34);
    uint64_t v44 = *((void *)__src + 35);
    uint64_t v45 = *((void *)__src + 36);
    uint64_t v46 = *((void *)__src + 37);
    uint64_t v47 = *((void *)__src + 38);
    uint64_t v48 = *((void *)__src + 39);
    uint64_t v49 = *((void *)__src + 40);
    uint64_t v122 = *((unsigned __int8 *)v135 + 4);
    uint64_t v129 = *v135;
    sub_25771CCF8(v42, v43, v44, v45, v46, v47, v48, v49, v129 | (v122 << 32));
    *((void *)__dst + 33) = v42;
    *((void *)__dst + 34) = v43;
    *((void *)__dst + 35) = v44;
    *((void *)__dst + 36) = v45;
    *((void *)__dst + 37) = v46;
    *((void *)__dst + 38) = v47;
    *((void *)__dst + 39) = v48;
    *((void *)__dst + 40) = v49;
    v137[4] = v122;
    *(_DWORD *)uint64_t v137 = v129;
    uint64_t v50 = *((void *)__src + 43);
    *((void *)__dst + 42) = *((void *)__src + 42);
    *((void *)__dst + 43) = v50;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  long long v40 = *((_OWORD *)__src + 14);
  __dst[13] = *((_OWORD *)__src + 13);
  __dst[14] = v40;
  __dst[15] = *((_OWORD *)__src + 15);
  *((void *)__dst + 32) = *((void *)__src + 32);
  long long v41 = *((_OWORD *)__src + 12);
  *uint64_t v32 = *v33;
  __dst[12] = v41;
  if (*((void *)__src + 42)) {
    goto LABEL_14;
  }
LABEL_16:
  long long v60 = *(_OWORD *)(__src + 312);
  *(_OWORD *)((char *)__dst + 296) = *(_OWORD *)(__src + 296);
  *(_OWORD *)((char *)__dst + 312) = v60;
  *(_OWORD *)((char *)__dst + 328) = *(_OWORD *)(__src + 328);
  *((void *)__dst + 43) = *((void *)__src + 43);
  long long v61 = *(_OWORD *)(__src + 280);
  *(_OWORD *)((char *)__dst + 264) = *(_OWORD *)(__src + 264);
  *(_OWORD *)((char *)__dst + 280) = v61;
LABEL_17:
  uint64_t v62 = __dst + 22;
  uint64_t v63 = __src + 352;
  uint64_t v64 = *((void *)__src + 53);
  if (!v64)
  {
    long long v65 = *((_OWORD *)__src + 25);
    __dst[24] = *((_OWORD *)__src + 24);
    __dst[25] = v65;
    __dst[26] = *((_OWORD *)__src + 26);
    *((void *)__dst + 54) = *((void *)__src + 54);
    long long v66 = *((_OWORD *)__src + 23);
    *uint64_t v62 = *v63;
    __dst[23] = v66;
    if (!*((void *)__src + 64))
    {
LABEL_25:
      long long v89 = *(_OWORD *)(__src + 488);
      *(_OWORD *)((char *)__dst + 472) = *(_OWORD *)(__src + 472);
      *(_OWORD *)((char *)__dst + 488) = v89;
      *(_OWORD *)((char *)__dst + 504) = *(_OWORD *)(__src + 504);
      *((void *)__dst + 65) = *((void *)__src + 65);
      long long v90 = *(_OWORD *)(__src + 456);
      *(_OWORD *)((char *)__dst + 440) = *(_OWORD *)(__src + 440);
      *(_OWORD *)((char *)__dst + 456) = v90;
LABEL_26:
      uint64_t v91 = __dst + 33;
      uint64_t v92 = __src + 528;
      uint64_t v93 = *((void *)__src + 75);
      if (v93)
      {
        if (v93 == 1)
        {
          long long v94 = *((_OWORD *)__src + 42);
          __dst[41] = *((_OWORD *)__src + 41);
          __dst[42] = v94;
          __dst[43] = *((_OWORD *)__src + 43);
          long long v95 = *((_OWORD *)__src + 38);
          __dst[37] = *((_OWORD *)__src + 37);
          __dst[38] = v95;
          long long v96 = *((_OWORD *)__src + 40);
          __dst[39] = *((_OWORD *)__src + 39);
          __dst[40] = v96;
          long long v97 = *((_OWORD *)__src + 34);
          *uint64_t v91 = *v92;
          __dst[34] = v97;
          long long v98 = *((_OWORD *)__src + 36);
          __dst[35] = *((_OWORD *)__src + 35);
          __dst[36] = v98;
          return __dst;
        }
        uint64_t v109 = *((void *)__src + 66);
        uint64_t v110 = *((void *)__src + 67);
        uint64_t v111 = *((void *)__src + 68);
        uint64_t v112 = *((void *)__src + 69);
        uint64_t v113 = *((void *)__src + 70);
        uint64_t v114 = *((void *)__src + 71);
        uint64_t v115 = *((void *)__src + 72);
        uint64_t v116 = *((void *)__src + 73);
        uint64_t v126 = *((unsigned __int8 *)v135 + 268);
        uint64_t v134 = v135[66];
        sub_25771CCF8(v109, v110, v111, v112, v113, v114, v115, v116, v134 | (v126 << 32));
        *((void *)__dst + 66) = v109;
        *((void *)__dst + 67) = v110;
        *((void *)__dst + 68) = v111;
        *((void *)__dst + 69) = v112;
        *((void *)__dst + 70) = v113;
        *((void *)__dst + 71) = v114;
        *((void *)__dst + 72) = v115;
        *((void *)__dst + 73) = v116;
        v137[268] = v126;
        *((_DWORD *)v137 + 66) = v134;
        *((void *)__dst + 75) = *((void *)__src + 75);
        *((void *)__dst + 76) = *((void *)__src + 76);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((void *)__src + 86))
        {
LABEL_32:
          long long v117 = *(_OWORD *)(__src + 664);
          *(_OWORD *)((char *)__dst + 648) = *(_OWORD *)(__src + 648);
          *(_OWORD *)((char *)__dst + 664) = v117;
          *(_OWORD *)((char *)__dst + 680) = *(_OWORD *)(__src + 680);
          *((void *)__dst + 87) = *((void *)__src + 87);
          long long v118 = *(_OWORD *)(__src + 632);
          *(_OWORD *)((char *)__dst + 616) = *(_OWORD *)(__src + 616);
          *(_OWORD *)((char *)__dst + 632) = v118;
          return __dst;
        }
      }
      else
      {
        long long v99 = *((_OWORD *)__src + 36);
        __dst[35] = *((_OWORD *)__src + 35);
        __dst[36] = v99;
        __dst[37] = *((_OWORD *)__src + 37);
        *((void *)__dst + 76) = *((void *)__src + 76);
        long long v100 = *((_OWORD *)__src + 34);
        *uint64_t v91 = *v92;
        __dst[34] = v100;
        if (!*((void *)__src + 86)) {
          goto LABEL_32;
        }
      }
      uint64_t v101 = *((void *)__src + 77);
      uint64_t v102 = *((void *)__src + 78);
      uint64_t v103 = *((void *)__src + 79);
      uint64_t v104 = *((void *)__src + 80);
      uint64_t v105 = *((void *)__src + 81);
      uint64_t v106 = *((void *)__src + 82);
      uint64_t v107 = *((void *)__src + 83);
      uint64_t v108 = *((void *)__src + 84);
      uint64_t v133 = *((unsigned __int8 *)v135 + 356);
      uint64_t v136 = v135[88];
      sub_25771CCF8(v101, v102, v103, v104, v105, v106, v107, v108, v136 | (v133 << 32));
      *((void *)__dst + 77) = v101;
      *((void *)__dst + 78) = v102;
      *((void *)__dst + 79) = v103;
      *((void *)__dst + 80) = v104;
      *((void *)__dst + 81) = v105;
      *((void *)__dst + 82) = v106;
      *((void *)__dst + 83) = v107;
      *((void *)__dst + 84) = v108;
      v137[356] = v133;
      *((_DWORD *)v137 + 88) = v136;
      *((void *)__dst + 86) = *((void *)__src + 86);
      *((void *)__dst + 87) = *((void *)__src + 87);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return __dst;
    }
LABEL_22:
    uint64_t v67 = *((void *)__src + 55);
    uint64_t v68 = *((void *)__src + 56);
    uint64_t v69 = *((void *)__src + 57);
    uint64_t v70 = *((void *)__src + 58);
    uint64_t v71 = *((void *)__src + 59);
    uint64_t v72 = *((void *)__src + 60);
    uint64_t v73 = *((void *)__src + 61);
    uint64_t v74 = *((void *)__src + 62);
    uint64_t v124 = *((unsigned __int8 *)v135 + 180);
    uint64_t v131 = v135[44];
    sub_25771CCF8(v67, v68, v69, v70, v71, v72, v73, v74, v131 | (v124 << 32));
    *((void *)__dst + 55) = v67;
    *((void *)__dst + 56) = v68;
    *((void *)__dst + 57) = v69;
    *((void *)__dst + 58) = v70;
    *((void *)__dst + 59) = v71;
    *((void *)__dst + 60) = v72;
    *((void *)__dst + 61) = v73;
    *((void *)__dst + 62) = v74;
    v137[180] = v124;
    *((_DWORD *)v137 + 44) = v131;
    *((void *)__dst + 64) = *((void *)__src + 64);
    *((void *)__dst + 65) = *((void *)__src + 65);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_26;
  }
  if (v64 == 1)
  {
    long long v75 = *((_OWORD *)__src + 31);
    __dst[30] = *((_OWORD *)__src + 30);
    __dst[31] = v75;
    __dst[32] = *((_OWORD *)__src + 32);
    long long v76 = *((_OWORD *)__src + 27);
    __dst[26] = *((_OWORD *)__src + 26);
    __dst[27] = v76;
    long long v77 = *((_OWORD *)__src + 29);
    __dst[28] = *((_OWORD *)__src + 28);
    __dst[29] = v77;
    long long v78 = *((_OWORD *)__src + 23);
    *uint64_t v62 = *v63;
    __dst[23] = v78;
    long long v79 = *((_OWORD *)__src + 25);
    __dst[24] = *((_OWORD *)__src + 24);
    __dst[25] = v79;
    goto LABEL_26;
  }
  if (v64 != 2)
  {
    uint64_t v80 = *((void *)__src + 44);
    uint64_t v81 = *((void *)__src + 45);
    uint64_t v82 = *((void *)__src + 46);
    uint64_t v83 = *((void *)__src + 47);
    uint64_t v84 = *((void *)__src + 48);
    uint64_t v85 = *((void *)__src + 49);
    uint64_t v86 = *((void *)__src + 50);
    uint64_t v87 = *((void *)__src + 51);
    uint64_t v125 = *((unsigned __int8 *)v135 + 92);
    uint64_t v132 = v135[22];
    sub_25771CCF8(v80, v81, v82, v83, v84, v85, v86, v87, v132 | (v125 << 32));
    *((void *)__dst + 44) = v80;
    *((void *)__dst + 45) = v81;
    *((void *)__dst + 46) = v82;
    *((void *)__dst + 47) = v83;
    *((void *)__dst + 48) = v84;
    *((void *)__dst + 49) = v85;
    *((void *)__dst + 50) = v86;
    *((void *)__dst + 51) = v87;
    v137[92] = v125;
    *((_DWORD *)v137 + 22) = v132;
    uint64_t v88 = *((void *)__src + 54);
    *((void *)__dst + 53) = *((void *)__src + 53);
    *((void *)__dst + 54) = v88;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!*((void *)__src + 64)) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  memcpy(v62, v63, 0x160uLL);
  return __dst;
}

char *assignWithCopy for ActivityFlexibleUpdateTheme.Graphic(char *__dst, char *__src)
{
  uint64_t v564 = (unsigned int *)(__src + 328);
  uint64_t v566 = (unsigned int *)(__dst + 328);
  uint64_t v4 = *((void *)__dst + 9);
  uint64_t v5 = *((void *)__src + 9);
  if (v4 == 2)
  {
    if (v5 != 2)
    {
      if (v5)
      {
        if (v5 == 1)
        {
          long long v6 = *(_OWORD *)__src;
          long long v7 = *((_OWORD *)__src + 2);
          *((_OWORD *)__dst + 1) = *((_OWORD *)__src + 1);
          *((_OWORD *)__dst + 2) = v7;
          *(_OWORD *)__dst = v6;
          long long v8 = *((_OWORD *)__src + 3);
          long long v9 = *((_OWORD *)__src + 4);
          long long v10 = *((_OWORD *)__src + 6);
          *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
          *((_OWORD *)__dst + 6) = v10;
          *((_OWORD *)__dst + 3) = v8;
          *((_OWORD *)__dst + 4) = v9;
          long long v11 = *((_OWORD *)__src + 7);
          long long v12 = *((_OWORD *)__src + 8);
          long long v13 = *((_OWORD *)__src + 10);
          *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
          *((_OWORD *)__dst + 10) = v13;
          *((_OWORD *)__dst + 7) = v11;
          *((_OWORD *)__dst + 8) = v12;
          goto LABEL_18;
        }
        uint64_t v42 = *(void *)__src;
        uint64_t v43 = *((void *)__src + 1);
        uint64_t v44 = *((void *)__src + 2);
        uint64_t v45 = *((void *)__src + 3);
        uint64_t v46 = *((void *)__src + 4);
        uint64_t v47 = *((void *)__src + 5);
        uint64_t v48 = *((void *)__src + 6);
        uint64_t v49 = *((void *)__src + 7);
        uint64_t v518 = __src[68];
        uint64_t v541 = *((unsigned int *)__src + 16);
        sub_25771CCF8(*(void *)__src, v43, v44, v45, v46, v47, v48, v49, v541 | (v518 << 32));
        *(void *)__dst = v42;
        *((void *)__dst + 1) = v43;
        *((void *)__dst + 2) = v44;
        *((void *)__dst + 3) = v45;
        *((void *)__dst + 4) = v46;
        *((void *)__dst + 5) = v47;
        *((void *)__dst + 6) = v48;
        *((void *)__dst + 7) = v49;
        __dst[68] = v518;
        *((_DWORD *)__dst + 16) = v541;
        *((void *)__dst + 9) = *((void *)__src + 9);
        *((void *)__dst + 10) = *((void *)__src + 10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((void *)__src + 20)) {
          goto LABEL_17;
        }
      }
      else
      {
        long long v30 = *((_OWORD *)__src + 1);
        *(_OWORD *)__dst = *(_OWORD *)__src;
        *((_OWORD *)__dst + 1) = v30;
        long long v31 = *((_OWORD *)__src + 2);
        long long v32 = *((_OWORD *)__src + 3);
        long long v33 = *((_OWORD *)__src + 4);
        *((void *)__dst + 10) = *((void *)__src + 10);
        *((_OWORD *)__dst + 3) = v32;
        *((_OWORD *)__dst + 4) = v33;
        *((_OWORD *)__dst + 2) = v31;
        if (!*((void *)__src + 20))
        {
LABEL_17:
          long long v50 = *(_OWORD *)(__src + 104);
          *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
          *(_OWORD *)(__dst + 104) = v50;
          long long v51 = *(_OWORD *)(__src + 120);
          long long v52 = *(_OWORD *)(__src + 136);
          long long v53 = *(_OWORD *)(__src + 152);
          *((void *)__dst + 21) = *((void *)__src + 21);
          *(_OWORD *)(__dst + 136) = v52;
          *(_OWORD *)(__dst + 152) = v53;
          *(_OWORD *)(__dst + 120) = v51;
LABEL_18:
          uint64_t v54 = (long long *)(__dst + 176);
          uint64_t v55 = (long long *)(__src + 176);
          uint64_t v56 = *((void *)__src + 31);
          if (v56)
          {
            if (v56 == 1)
            {
              long long v57 = *v55;
              long long v58 = *((_OWORD *)__src + 13);
              *((_OWORD *)__dst + 12) = *((_OWORD *)__src + 12);
              *((_OWORD *)__dst + 13) = v58;
              *uint64_t v54 = v57;
              long long v59 = *((_OWORD *)__src + 14);
              long long v60 = *((_OWORD *)__src + 15);
              long long v61 = *((_OWORD *)__src + 17);
              *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
              *((_OWORD *)__dst + 17) = v61;
              *((_OWORD *)__dst + 14) = v59;
              *((_OWORD *)__dst + 15) = v60;
              long long v62 = *((_OWORD *)__src + 18);
              long long v63 = *((_OWORD *)__src + 19);
              long long v64 = *((_OWORD *)__src + 21);
              *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
              *((_OWORD *)__dst + 21) = v64;
              *((_OWORD *)__dst + 18) = v62;
              *((_OWORD *)__dst + 19) = v63;
              goto LABEL_64;
            }
            goto LABEL_48;
          }
          long long v65 = *((_OWORD *)__src + 12);
          *uint64_t v54 = *v55;
          *((_OWORD *)__dst + 12) = v65;
          long long v66 = *((_OWORD *)__src + 13);
          long long v67 = *((_OWORD *)__src + 14);
          long long v68 = *((_OWORD *)__src + 15);
          *((void *)__dst + 32) = *((void *)__src + 32);
          *((_OWORD *)__dst + 14) = v67;
          *((_OWORD *)__dst + 15) = v68;
          *((_OWORD *)__dst + 13) = v66;
          if (!*((void *)__src + 42)) {
            goto LABEL_54;
          }
          goto LABEL_63;
        }
      }
      uint64_t v34 = *((void *)__src + 11);
      uint64_t v35 = *((void *)__src + 12);
      uint64_t v36 = *((void *)__src + 13);
      uint64_t v37 = *((void *)__src + 14);
      uint64_t v38 = *((void *)__src + 15);
      uint64_t v39 = *((void *)__src + 16);
      uint64_t v40 = *((void *)__src + 17);
      uint64_t v41 = *((void *)__src + 18);
      uint64_t v517 = __src[156];
      uint64_t v540 = *((unsigned int *)__src + 38);
      sub_25771CCF8(v34, v35, v36, v37, v38, v39, v40, v41, v540 | (v517 << 32));
      *((void *)__dst + 11) = v34;
      *((void *)__dst + 12) = v35;
      *((void *)__dst + 13) = v36;
      *((void *)__dst + 14) = v37;
      *((void *)__dst + 15) = v38;
      *((void *)__dst + 16) = v39;
      *((void *)__dst + 17) = v40;
      *((void *)__dst + 18) = v41;
      __dst[156] = v517;
      *((_DWORD *)__dst + 38) = v540;
      *((void *)__dst + 20) = *((void *)__src + 20);
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_18;
    }
LABEL_8:
    memcpy(__dst, __src, 0x160uLL);
    goto LABEL_64;
  }
  if (v5 == 2)
  {
    sub_2577FDD60((uint64_t)__dst);
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    if (v5 == 1)
    {
      long long v14 = *(_OWORD *)__src;
      long long v15 = *((_OWORD *)__src + 2);
      *((_OWORD *)__dst + 1) = *((_OWORD *)__src + 1);
      *((_OWORD *)__dst + 2) = v15;
      *(_OWORD *)__dst = v14;
      long long v16 = *((_OWORD *)__src + 3);
      long long v17 = *((_OWORD *)__src + 4);
      long long v18 = *((_OWORD *)__src + 6);
      *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
      *((_OWORD *)__dst + 6) = v18;
      *((_OWORD *)__dst + 3) = v16;
      *((_OWORD *)__dst + 4) = v17;
      long long v19 = *((_OWORD *)__src + 7);
      long long v20 = *((_OWORD *)__src + 8);
      long long v21 = *((_OWORD *)__src + 10);
      *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
      *((_OWORD *)__dst + 10) = v21;
      *((_OWORD *)__dst + 7) = v19;
      *((_OWORD *)__dst + 8) = v20;
      goto LABEL_42;
    }
    if (v5)
    {
      uint64_t v69 = *(void *)__src;
      uint64_t v70 = *((void *)__src + 1);
      uint64_t v71 = *((void *)__src + 2);
      uint64_t v72 = *((void *)__src + 3);
      uint64_t v73 = *((void *)__src + 4);
      uint64_t v74 = *((void *)__src + 5);
      uint64_t v75 = *((void *)__src + 6);
      uint64_t v76 = *((void *)__src + 7);
      uint64_t v519 = __src[68];
      uint64_t v542 = *((unsigned int *)__src + 16);
      sub_25771CCF8(*(void *)__src, v70, v71, v72, v73, v74, v75, v76, v542 | (v519 << 32));
      *(void *)__dst = v69;
      *((void *)__dst + 1) = v70;
      *((void *)__dst + 2) = v71;
      *((void *)__dst + 3) = v72;
      *((void *)__dst + 4) = v73;
      *((void *)__dst + 5) = v74;
      *((void *)__dst + 6) = v75;
      *((void *)__dst + 7) = v76;
      __dst[68] = v519;
      *((_DWORD *)__dst + 16) = v542;
      *((void *)__dst + 9) = *((void *)__src + 9);
      *((void *)__dst + 10) = *((void *)__src + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!*((void *)__src + 20)) {
        goto LABEL_30;
      }
    }
    else
    {
      long long v94 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v94;
      long long v95 = *((_OWORD *)__src + 2);
      long long v96 = *((_OWORD *)__src + 3);
      long long v97 = *((_OWORD *)__src + 4);
      *((void *)__dst + 10) = *((void *)__src + 10);
      *((_OWORD *)__dst + 3) = v96;
      *((_OWORD *)__dst + 4) = v97;
      *((_OWORD *)__dst + 2) = v95;
      if (!*((void *)__src + 20))
      {
LABEL_30:
        long long v98 = *(_OWORD *)(__src + 104);
        *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
        *(_OWORD *)(__dst + 104) = v98;
        long long v99 = *(_OWORD *)(__src + 120);
        long long v100 = *(_OWORD *)(__src + 136);
        long long v101 = *(_OWORD *)(__src + 152);
        *((void *)__dst + 21) = *((void *)__src + 21);
        *(_OWORD *)(__dst + 136) = v100;
        *(_OWORD *)(__dst + 152) = v101;
        *(_OWORD *)(__dst + 120) = v99;
        goto LABEL_42;
      }
    }
    goto LABEL_39;
  }
  if (v5 == 1)
  {
    sub_257735730((uint64_t)__dst);
    long long v23 = *((_OWORD *)__src + 1);
    long long v22 = *((_OWORD *)__src + 2);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v23;
    *((_OWORD *)__dst + 2) = v22;
    long long v24 = *((_OWORD *)__src + 6);
    long long v26 = *((_OWORD *)__src + 3);
    long long v25 = *((_OWORD *)__src + 4);
    *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
    *((_OWORD *)__dst + 6) = v24;
    *((_OWORD *)__dst + 3) = v26;
    *((_OWORD *)__dst + 4) = v25;
    long long v27 = *((_OWORD *)__src + 10);
    long long v29 = *((_OWORD *)__src + 7);
    long long v28 = *((_OWORD *)__src + 8);
    *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
    *((_OWORD *)__dst + 10) = v27;
    *((_OWORD *)__dst + 7) = v29;
    *((_OWORD *)__dst + 8) = v28;
    goto LABEL_42;
  }
  if (v4)
  {
    if (v5)
    {
      uint64_t v77 = *((void *)__src + 1);
      uint64_t v78 = *((void *)__src + 2);
      uint64_t v79 = *((void *)__src + 3);
      uint64_t v80 = *((void *)__src + 4);
      uint64_t v81 = *((void *)__src + 5);
      uint64_t v82 = *((void *)__src + 6);
      uint64_t v83 = *((void *)__src + 7);
      uint64_t v520 = *(void *)__src;
      uint64_t v543 = __src[68];
      uint64_t v84 = *((unsigned int *)__src + 16);
      sub_25771CCF8(*(void *)__src, v77, v78, v79, v80, v81, v82, v83, v84 | (v543 << 32));
      uint64_t v85 = *(void *)__dst;
      uint64_t v86 = *((void *)__dst + 1);
      uint64_t v87 = *((void *)__dst + 2);
      uint64_t v88 = *((void *)__dst + 3);
      uint64_t v89 = *((void *)__dst + 4);
      uint64_t v90 = *((void *)__dst + 5);
      uint64_t v91 = *((void *)__dst + 6);
      uint64_t v92 = *((void *)__dst + 7);
      unint64_t v93 = *((unsigned int *)__dst + 16) | ((unint64_t)__dst[68] << 32);
      *(void *)__dst = v520;
      *((void *)__dst + 1) = v77;
      *((void *)__dst + 2) = v78;
      *((void *)__dst + 3) = v79;
      *((void *)__dst + 4) = v80;
      *((void *)__dst + 5) = v81;
      *((void *)__dst + 6) = v82;
      *((void *)__dst + 7) = v83;
      *((_DWORD *)__dst + 16) = v84;
      __dst[68] = v543;
      sub_25771D110(v85, v86, v87, v88, v89, v90, v91, v92, v93);
      *((void *)__dst + 9) = *((void *)__src + 9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 10) = *((void *)__src + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)__dst, &qword_26A030F50);
      long long v110 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v110;
      long long v112 = *((_OWORD *)__src + 3);
      long long v111 = *((_OWORD *)__src + 4);
      long long v113 = *((_OWORD *)__src + 2);
      *((void *)__dst + 10) = *((void *)__src + 10);
      *((_OWORD *)__dst + 3) = v112;
      *((_OWORD *)__dst + 4) = v111;
      *((_OWORD *)__dst + 2) = v113;
    }
  }
  else if (v5)
  {
    uint64_t v102 = *(void *)__src;
    uint64_t v103 = *((void *)__src + 1);
    uint64_t v104 = *((void *)__src + 2);
    uint64_t v105 = *((void *)__src + 3);
    uint64_t v106 = *((void *)__src + 4);
    uint64_t v107 = *((void *)__src + 5);
    uint64_t v108 = *((void *)__src + 6);
    uint64_t v109 = *((void *)__src + 7);
    uint64_t v521 = __src[68];
    uint64_t v544 = *((unsigned int *)__src + 16);
    sub_25771CCF8(*(void *)__src, v103, v104, v105, v106, v107, v108, v109, v544 | (v521 << 32));
    *(void *)__dst = v102;
    *((void *)__dst + 1) = v103;
    *((void *)__dst + 2) = v104;
    *((void *)__dst + 3) = v105;
    *((void *)__dst + 4) = v106;
    *((void *)__dst + 5) = v107;
    *((void *)__dst + 6) = v108;
    *((void *)__dst + 7) = v109;
    __dst[68] = v521;
    *((_DWORD *)__dst + 16) = v544;
    *((void *)__dst + 9) = *((void *)__src + 9);
    *((void *)__dst + 10) = *((void *)__src + 10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v114 = *((_OWORD *)__src + 1);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v114;
    long long v115 = *((_OWORD *)__src + 2);
    long long v116 = *((_OWORD *)__src + 3);
    long long v117 = *((_OWORD *)__src + 4);
    *((void *)__dst + 10) = *((void *)__src + 10);
    *((_OWORD *)__dst + 3) = v116;
    *((_OWORD *)__dst + 4) = v117;
    *((_OWORD *)__dst + 2) = v115;
  }
  long long v118 = __dst + 88;
  uint64_t v119 = __src + 88;
  uint64_t v120 = *((void *)__src + 20);
  if (*((void *)__dst + 20))
  {
    if (v120)
    {
      uint64_t v515 = *((void *)__src + 12);
      uint64_t v522 = *((void *)__src + 11);
      uint64_t v121 = *((void *)__src + 13);
      uint64_t v122 = *((void *)__src + 14);
      uint64_t v123 = *((void *)__src + 15);
      uint64_t v124 = *((void *)__src + 16);
      uint64_t v125 = *((void *)__src + 17);
      uint64_t v126 = *((void *)__src + 18);
      uint64_t v545 = __src[156];
      uint64_t v127 = *((unsigned int *)__src + 38);
      sub_25771CCF8(v522, v515, v121, v122, v123, v124, v125, v126, v127 | (v545 << 32));
      uint64_t v128 = *((void *)__dst + 11);
      uint64_t v129 = *((void *)__dst + 12);
      uint64_t v130 = *((void *)__dst + 13);
      uint64_t v131 = *((void *)__dst + 14);
      uint64_t v132 = *((void *)__dst + 15);
      uint64_t v133 = *((void *)__dst + 16);
      uint64_t v134 = *((void *)__dst + 17);
      uint64_t v135 = *((void *)__dst + 18);
      unint64_t v136 = *((unsigned int *)__dst + 38) | ((unint64_t)__dst[156] << 32);
      *((void *)__dst + 11) = v522;
      *((void *)__dst + 12) = v515;
      *((void *)__dst + 13) = v121;
      *((void *)__dst + 14) = v122;
      *((void *)__dst + 15) = v123;
      *((void *)__dst + 16) = v124;
      *((void *)__dst + 17) = v125;
      *((void *)__dst + 18) = v126;
      *((_DWORD *)__dst + 38) = v127;
      __dst[156] = v545;
      sub_25771D110(v128, v129, v130, v131, v132, v133, v134, v135, v136);
      *((void *)__dst + 20) = *((void *)__src + 20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 88), &qword_26A030F50);
      long long v145 = *(_OWORD *)(__src + 104);
      *long long v118 = *v119;
      *(_OWORD *)(__dst + 104) = v145;
      long long v147 = *(_OWORD *)(__src + 136);
      long long v146 = *(_OWORD *)(__src + 152);
      long long v148 = *(_OWORD *)(__src + 120);
      *((void *)__dst + 21) = *((void *)__src + 21);
      *(_OWORD *)(__dst + 136) = v147;
      *(_OWORD *)(__dst + 152) = v146;
      *(_OWORD *)(__dst + 120) = v148;
    }
  }
  else
  {
    if (v120)
    {
LABEL_39:
      uint64_t v137 = *((void *)__src + 11);
      uint64_t v138 = *((void *)__src + 12);
      uint64_t v139 = *((void *)__src + 13);
      uint64_t v140 = *((void *)__src + 14);
      uint64_t v141 = *((void *)__src + 15);
      uint64_t v142 = *((void *)__src + 16);
      uint64_t v143 = *((void *)__src + 17);
      uint64_t v144 = *((void *)__src + 18);
      uint64_t v523 = __src[156];
      uint64_t v546 = *((unsigned int *)__src + 38);
      sub_25771CCF8(v137, v138, v139, v140, v141, v142, v143, v144, v546 | (v523 << 32));
      *((void *)__dst + 11) = v137;
      *((void *)__dst + 12) = v138;
      *((void *)__dst + 13) = v139;
      *((void *)__dst + 14) = v140;
      *((void *)__dst + 15) = v141;
      *((void *)__dst + 16) = v142;
      *((void *)__dst + 17) = v143;
      *((void *)__dst + 18) = v144;
      __dst[156] = v523;
      *((_DWORD *)__dst + 38) = v546;
      *((void *)__dst + 20) = *((void *)__src + 20);
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_42;
    }
    long long v149 = *(_OWORD *)(__src + 104);
    *long long v118 = *v119;
    *(_OWORD *)(__dst + 104) = v149;
    long long v150 = *(_OWORD *)(__src + 120);
    long long v151 = *(_OWORD *)(__src + 136);
    long long v152 = *(_OWORD *)(__src + 152);
    *((void *)__dst + 21) = *((void *)__src + 21);
    *(_OWORD *)(__dst + 136) = v151;
    *(_OWORD *)(__dst + 152) = v152;
    *(_OWORD *)(__dst + 120) = v150;
  }
LABEL_42:
  long long v153 = (long long *)(__dst + 176);
  long long v154 = (long long *)(__src + 176);
  uint64_t v155 = *((void *)__dst + 31);
  uint64_t v156 = *((void *)__src + 31);
  if (v155 == 1)
  {
    if (v156)
    {
      if (v156 == 1)
      {
        long long v157 = *v154;
        long long v158 = *((_OWORD *)__src + 13);
        *((_OWORD *)__dst + 12) = *((_OWORD *)__src + 12);
        *((_OWORD *)__dst + 13) = v158;
        *long long v153 = v157;
        long long v159 = *((_OWORD *)__src + 14);
        long long v160 = *((_OWORD *)__src + 15);
        long long v161 = *((_OWORD *)__src + 17);
        *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
        *((_OWORD *)__dst + 17) = v161;
        *((_OWORD *)__dst + 14) = v159;
        *((_OWORD *)__dst + 15) = v160;
        long long v162 = *((_OWORD *)__src + 18);
        long long v163 = *((_OWORD *)__src + 19);
        long long v164 = *((_OWORD *)__src + 21);
        *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
        *((_OWORD *)__dst + 21) = v164;
        *((_OWORD *)__dst + 18) = v162;
        *((_OWORD *)__dst + 19) = v163;
        goto LABEL_64;
      }
LABEL_48:
      uint64_t v173 = *((void *)__src + 22);
      uint64_t v174 = *((void *)__src + 23);
      uint64_t v175 = *((void *)__src + 24);
      uint64_t v176 = *((void *)__src + 25);
      uint64_t v177 = *((void *)__src + 26);
      uint64_t v178 = *((void *)__src + 27);
      uint64_t v179 = *((void *)__src + 28);
      uint64_t v180 = *((void *)__src + 29);
      uint64_t v524 = __src[244];
      uint64_t v547 = *((unsigned int *)__src + 60);
      sub_25771CCF8(v173, v174, v175, v176, v177, v178, v179, v180, v547 | (v524 << 32));
      *((void *)__dst + 22) = v173;
      *((void *)__dst + 23) = v174;
      *((void *)__dst + 24) = v175;
      *((void *)__dst + 25) = v176;
      *((void *)__dst + 26) = v177;
      *((void *)__dst + 27) = v178;
      *((void *)__dst + 28) = v179;
      *((void *)__dst + 29) = v180;
      __dst[244] = v524;
      *((_DWORD *)__dst + 60) = v547;
      *((void *)__dst + 31) = *((void *)__src + 31);
      *((void *)__dst + 32) = *((void *)__src + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!*((void *)__src + 42)) {
        goto LABEL_54;
      }
      goto LABEL_63;
    }
    long long v197 = *((_OWORD *)__src + 12);
    *long long v153 = *v154;
    *((_OWORD *)__dst + 12) = v197;
    long long v198 = *((_OWORD *)__src + 13);
    long long v199 = *((_OWORD *)__src + 14);
    long long v200 = *((_OWORD *)__src + 15);
    *((void *)__dst + 32) = *((void *)__src + 32);
    *((_OWORD *)__dst + 14) = v199;
    *((_OWORD *)__dst + 15) = v200;
    *((_OWORD *)__dst + 13) = v198;
    if (!*((void *)__src + 42))
    {
LABEL_54:
      long long v201 = *(_OWORD *)(__src + 280);
      *(_OWORD *)(__dst + 264) = *(_OWORD *)(__src + 264);
      *(_OWORD *)(__dst + 280) = v201;
      long long v202 = *(_OWORD *)(__src + 296);
      long long v203 = *(_OWORD *)(__src + 312);
      long long v204 = *(_OWORD *)(__src + 328);
      *((void *)__dst + 43) = *((void *)__src + 43);
      *(_OWORD *)(__dst + 312) = v203;
      *(_OWORD *)(__dst + 328) = v204;
      *(_OWORD *)(__dst + 296) = v202;
      goto LABEL_64;
    }
LABEL_63:
    uint64_t v241 = *((void *)__src + 33);
    uint64_t v242 = *((void *)__src + 34);
    uint64_t v243 = *((void *)__src + 35);
    uint64_t v244 = *((void *)__src + 36);
    uint64_t v245 = *((void *)__src + 37);
    uint64_t v246 = *((void *)__src + 38);
    uint64_t v247 = *((void *)__src + 39);
    uint64_t v248 = *((void *)__src + 40);
    uint64_t v528 = *((unsigned __int8 *)v564 + 4);
    uint64_t v551 = *v564;
    sub_25771CCF8(v241, v242, v243, v244, v245, v246, v247, v248, v551 | (v528 << 32));
    *((void *)__dst + 33) = v241;
    *((void *)__dst + 34) = v242;
    *((void *)__dst + 35) = v243;
    *((void *)__dst + 36) = v244;
    *((void *)__dst + 37) = v245;
    *((void *)__dst + 38) = v246;
    *((void *)__dst + 39) = v247;
    *((void *)__dst + 40) = v248;
    *((unsigned char *)v566 + 4) = v528;
    *uint64_t v566 = v551;
    *((void *)__dst + 42) = *((void *)__src + 42);
    *((void *)__dst + 43) = *((void *)__src + 43);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_64;
  }
  if (v156 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 176));
    long long v166 = *((_OWORD *)__src + 12);
    long long v165 = *((_OWORD *)__src + 13);
    *long long v153 = *v154;
    *((_OWORD *)__dst + 12) = v166;
    *((_OWORD *)__dst + 13) = v165;
    long long v167 = *((_OWORD *)__src + 17);
    long long v169 = *((_OWORD *)__src + 14);
    long long v168 = *((_OWORD *)__src + 15);
    *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
    *((_OWORD *)__dst + 17) = v167;
    *((_OWORD *)__dst + 14) = v169;
    *((_OWORD *)__dst + 15) = v168;
    long long v170 = *((_OWORD *)__src + 21);
    long long v172 = *((_OWORD *)__src + 18);
    long long v171 = *((_OWORD *)__src + 19);
    *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
    *((_OWORD *)__dst + 21) = v170;
    *((_OWORD *)__dst + 18) = v172;
    *((_OWORD *)__dst + 19) = v171;
    goto LABEL_64;
  }
  if (v155)
  {
    if (v156)
    {
      uint64_t v516 = *((void *)__src + 23);
      uint64_t v525 = *((void *)__src + 22);
      uint64_t v181 = *((void *)__src + 24);
      uint64_t v182 = *((void *)__src + 25);
      uint64_t v183 = *((void *)__src + 26);
      uint64_t v184 = *((void *)__src + 27);
      uint64_t v185 = *((void *)__src + 28);
      uint64_t v186 = *((void *)__src + 29);
      uint64_t v548 = __src[244];
      uint64_t v187 = *((unsigned int *)__src + 60);
      sub_25771CCF8(v525, v516, v181, v182, v183, v184, v185, v186, v187 | (v548 << 32));
      uint64_t v188 = *((void *)__dst + 22);
      uint64_t v189 = *((void *)__dst + 23);
      uint64_t v190 = *((void *)__dst + 24);
      uint64_t v191 = *((void *)__dst + 25);
      uint64_t v192 = *((void *)__dst + 26);
      uint64_t v193 = *((void *)__dst + 27);
      uint64_t v194 = *((void *)__dst + 28);
      uint64_t v195 = *((void *)__dst + 29);
      unint64_t v196 = *((unsigned int *)__dst + 60) | ((unint64_t)__dst[244] << 32);
      *((void *)__dst + 22) = v525;
      *((void *)__dst + 23) = v516;
      *((void *)__dst + 24) = v181;
      *((void *)__dst + 25) = v182;
      *((void *)__dst + 26) = v183;
      *((void *)__dst + 27) = v184;
      *((void *)__dst + 28) = v185;
      *((void *)__dst + 29) = v186;
      *((_DWORD *)__dst + 60) = v187;
      __dst[244] = v548;
      sub_25771D110(v188, v189, v190, v191, v192, v193, v194, v195, v196);
      *((void *)__dst + 31) = *((void *)__src + 31);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 32) = *((void *)__src + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 176), &qword_26A030F50);
      long long v213 = *((_OWORD *)__src + 12);
      *long long v153 = *v154;
      *((_OWORD *)__dst + 12) = v213;
      long long v215 = *((_OWORD *)__src + 14);
      long long v214 = *((_OWORD *)__src + 15);
      long long v216 = *((_OWORD *)__src + 13);
      *((void *)__dst + 32) = *((void *)__src + 32);
      *((_OWORD *)__dst + 14) = v215;
      *((_OWORD *)__dst + 15) = v214;
      *((_OWORD *)__dst + 13) = v216;
    }
  }
  else if (v156)
  {
    uint64_t v205 = *((void *)__src + 22);
    uint64_t v206 = *((void *)__src + 23);
    uint64_t v207 = *((void *)__src + 24);
    uint64_t v208 = *((void *)__src + 25);
    uint64_t v209 = *((void *)__src + 26);
    uint64_t v210 = *((void *)__src + 27);
    uint64_t v211 = *((void *)__src + 28);
    uint64_t v212 = *((void *)__src + 29);
    uint64_t v526 = __src[244];
    uint64_t v549 = *((unsigned int *)__src + 60);
    sub_25771CCF8(v205, v206, v207, v208, v209, v210, v211, v212, v549 | (v526 << 32));
    *((void *)__dst + 22) = v205;
    *((void *)__dst + 23) = v206;
    *((void *)__dst + 24) = v207;
    *((void *)__dst + 25) = v208;
    *((void *)__dst + 26) = v209;
    *((void *)__dst + 27) = v210;
    *((void *)__dst + 28) = v211;
    *((void *)__dst + 29) = v212;
    __dst[244] = v526;
    *((_DWORD *)__dst + 60) = v549;
    *((void *)__dst + 31) = *((void *)__src + 31);
    *((void *)__dst + 32) = *((void *)__src + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v217 = *((_OWORD *)__src + 12);
    *long long v153 = *v154;
    *((_OWORD *)__dst + 12) = v217;
    long long v218 = *((_OWORD *)__src + 13);
    long long v219 = *((_OWORD *)__src + 14);
    long long v220 = *((_OWORD *)__src + 15);
    *((void *)__dst + 32) = *((void *)__src + 32);
    *((_OWORD *)__dst + 14) = v219;
    *((_OWORD *)__dst + 15) = v220;
    *((_OWORD *)__dst + 13) = v218;
  }
  uint64_t v221 = __dst + 264;
  uint64_t v222 = __src + 264;
  uint64_t v223 = *((void *)__src + 42);
  if (*((void *)__dst + 42))
  {
    if (v223)
    {
      uint64_t v224 = *((void *)__src + 34);
      uint64_t v225 = *((void *)__src + 35);
      uint64_t v226 = *((void *)__src + 36);
      uint64_t v227 = *((void *)__src + 37);
      uint64_t v228 = *((void *)__src + 38);
      uint64_t v229 = *((void *)__src + 39);
      uint64_t v230 = *((void *)__src + 40);
      uint64_t v527 = *((void *)__src + 33);
      uint64_t v550 = *((unsigned __int8 *)v564 + 4);
      uint64_t v231 = *v564;
      sub_25771CCF8(v527, v224, v225, v226, v227, v228, v229, v230, v231 | (v550 << 32));
      uint64_t v232 = *((void *)__dst + 33);
      uint64_t v233 = *((void *)__dst + 34);
      uint64_t v234 = *((void *)__dst + 35);
      uint64_t v235 = *((void *)__dst + 36);
      uint64_t v236 = *((void *)__dst + 37);
      uint64_t v237 = *((void *)__dst + 38);
      uint64_t v238 = *((void *)__dst + 39);
      uint64_t v239 = *((void *)__dst + 40);
      unint64_t v240 = *v566 | ((unint64_t)*((unsigned __int8 *)v566 + 4) << 32);
      *((void *)__dst + 33) = v527;
      *((void *)__dst + 34) = v224;
      *((void *)__dst + 35) = v225;
      *((void *)__dst + 36) = v226;
      *((void *)__dst + 37) = v227;
      *((void *)__dst + 38) = v228;
      *((void *)__dst + 39) = v229;
      *((void *)__dst + 40) = v230;
      *uint64_t v566 = v231;
      *((unsigned char *)v566 + 4) = v550;
      sub_25771D110(v232, v233, v234, v235, v236, v237, v238, v239, v240);
      *((void *)__dst + 42) = *((void *)__src + 42);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 43) = *((void *)__src + 43);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 264), &qword_26A030F50);
      long long v357 = *(_OWORD *)(__src + 280);
      *uint64_t v221 = *v222;
      *(_OWORD *)(__dst + 280) = v357;
      long long v359 = *(_OWORD *)(__src + 312);
      long long v358 = *(_OWORD *)(__src + 328);
      long long v360 = *(_OWORD *)(__src + 296);
      *((void *)__dst + 43) = *((void *)__src + 43);
      *(_OWORD *)(__dst + 312) = v359;
      *(_OWORD *)(__dst + 328) = v358;
      *(_OWORD *)(__dst + 296) = v360;
    }
  }
  else
  {
    if (v223) {
      goto LABEL_63;
    }
    long long v365 = *(_OWORD *)(__src + 280);
    *uint64_t v221 = *v222;
    *(_OWORD *)(__dst + 280) = v365;
    long long v366 = *(_OWORD *)(__src + 296);
    long long v367 = *(_OWORD *)(__src + 312);
    long long v368 = *(_OWORD *)(__src + 328);
    *((void *)__dst + 43) = *((void *)__src + 43);
    *(_OWORD *)(__dst + 312) = v367;
    *(_OWORD *)(__dst + 328) = v368;
    *(_OWORD *)(__dst + 296) = v366;
  }
LABEL_64:
  uint64_t v249 = __dst + 352;
  unint64_t v250 = __src + 352;
  uint64_t v251 = *((void *)__dst + 53);
  uint64_t v252 = *((void *)__src + 53);
  if (v251 == 2)
  {
    if (!v252)
    {
      long long v277 = *((_OWORD *)__src + 23);
      *uint64_t v249 = *v250;
      *((_OWORD *)__dst + 23) = v277;
      long long v278 = *((_OWORD *)__src + 24);
      long long v279 = *((_OWORD *)__src + 25);
      long long v280 = *((_OWORD *)__src + 26);
      *((void *)__dst + 54) = *((void *)__src + 54);
      *((_OWORD *)__dst + 25) = v279;
      *((_OWORD *)__dst + 26) = v280;
      *((_OWORD *)__dst + 24) = v278;
      if (*((void *)__src + 64)) {
        goto LABEL_69;
      }
      goto LABEL_78;
    }
    if (v252 == 1)
    {
      long long v285 = *v250;
      long long v286 = *((_OWORD *)__src + 24);
      *((_OWORD *)__dst + 23) = *((_OWORD *)__src + 23);
      *((_OWORD *)__dst + 24) = v286;
      *uint64_t v249 = v285;
      long long v287 = *((_OWORD *)__src + 25);
      long long v288 = *((_OWORD *)__src + 26);
      long long v289 = *((_OWORD *)__src + 28);
      *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
      *((_OWORD *)__dst + 28) = v289;
      *((_OWORD *)__dst + 25) = v287;
      *((_OWORD *)__dst + 26) = v288;
      long long v290 = *((_OWORD *)__src + 29);
      long long v291 = *((_OWORD *)__src + 30);
      long long v292 = *((_OWORD *)__src + 32);
      *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
      *((_OWORD *)__dst + 32) = v292;
      *((_OWORD *)__dst + 29) = v290;
      *((_OWORD *)__dst + 30) = v291;
      goto LABEL_80;
    }
    if (v252 != 2)
    {
      uint64_t v253 = *((void *)__src + 44);
      uint64_t v254 = *((void *)__src + 45);
      uint64_t v255 = *((void *)__src + 46);
      uint64_t v256 = *((void *)__src + 47);
      uint64_t v257 = *((void *)__src + 48);
      uint64_t v258 = *((void *)__src + 49);
      uint64_t v259 = *((void *)__src + 50);
      uint64_t v260 = *((void *)__src + 51);
      uint64_t v529 = *((unsigned __int8 *)v564 + 92);
      uint64_t v552 = v564[22];
      sub_25771CCF8(v253, v254, v255, v256, v257, v258, v259, v260, v552 | (v529 << 32));
      *((void *)__dst + 44) = v253;
      *((void *)__dst + 45) = v254;
      *((void *)__dst + 46) = v255;
      *((void *)__dst + 47) = v256;
      *((void *)__dst + 48) = v257;
      *((void *)__dst + 49) = v258;
      *((void *)__dst + 50) = v259;
      *((void *)__dst + 51) = v260;
      *((unsigned char *)v566 + 92) = v529;
      v566[22] = v552;
      *((void *)__dst + 53) = *((void *)__src + 53);
      *((void *)__dst + 54) = *((void *)__src + 54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((void *)__src + 64))
      {
LABEL_69:
        uint64_t v261 = *((void *)__src + 55);
        uint64_t v262 = *((void *)__src + 56);
        uint64_t v263 = *((void *)__src + 57);
        uint64_t v264 = *((void *)__src + 58);
        uint64_t v265 = *((void *)__src + 59);
        uint64_t v266 = *((void *)__src + 60);
        uint64_t v267 = *((void *)__src + 61);
        uint64_t v268 = *((void *)__src + 62);
        uint64_t v530 = *((unsigned __int8 *)v564 + 180);
        uint64_t v553 = v564[44];
        sub_25771CCF8(v261, v262, v263, v264, v265, v266, v267, v268, v553 | (v530 << 32));
        *((void *)__dst + 55) = v261;
        *((void *)__dst + 56) = v262;
        *((void *)__dst + 57) = v263;
        *((void *)__dst + 58) = v264;
        *((void *)__dst + 59) = v265;
        *((void *)__dst + 60) = v266;
        *((void *)__dst + 61) = v267;
        *((void *)__dst + 62) = v268;
        *((unsigned char *)v566 + 180) = v530;
        v566[44] = v553;
        *((void *)__dst + 64) = *((void *)__src + 64);
        *((void *)__dst + 65) = *((void *)__src + 65);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_80:
        int v293 = __dst + 528;
        uint64_t v294 = __src + 528;
        uint64_t v295 = *((void *)__src + 75);
        if (!v295)
        {
          long long v312 = *((_OWORD *)__src + 34);
          *int v293 = *v294;
          *((_OWORD *)__dst + 34) = v312;
          long long v313 = *((_OWORD *)__src + 35);
          long long v314 = *((_OWORD *)__src + 36);
          long long v315 = *((_OWORD *)__src + 37);
          *((void *)__dst + 76) = *((void *)__src + 76);
          *((_OWORD *)__dst + 36) = v314;
          *((_OWORD *)__dst + 37) = v315;
          *((_OWORD *)__dst + 35) = v313;
          if (!*((void *)__src + 86)) {
            goto LABEL_110;
          }
          goto LABEL_128;
        }
        if (v295 == 1)
        {
          long long v296 = *v294;
          long long v297 = *((_OWORD *)__src + 35);
          *((_OWORD *)__dst + 34) = *((_OWORD *)__src + 34);
          *((_OWORD *)__dst + 35) = v297;
          *int v293 = v296;
          long long v298 = *((_OWORD *)__src + 36);
          long long v299 = *((_OWORD *)__src + 37);
          long long v300 = *((_OWORD *)__src + 39);
          *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
          *((_OWORD *)__dst + 39) = v300;
          *((_OWORD *)__dst + 36) = v298;
          *((_OWORD *)__dst + 37) = v299;
          long long v301 = *((_OWORD *)__src + 40);
          long long v302 = *((_OWORD *)__src + 41);
          long long v303 = *((_OWORD *)__src + 43);
          *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
          *((_OWORD *)__dst + 43) = v303;
          *((_OWORD *)__dst + 40) = v301;
          *((_OWORD *)__dst + 41) = v302;
          return __dst;
        }
LABEL_109:
        uint64_t v413 = *((void *)__src + 66);
        uint64_t v414 = *((void *)__src + 67);
        uint64_t v415 = *((void *)__src + 68);
        uint64_t v416 = *((void *)__src + 69);
        uint64_t v417 = *((void *)__src + 70);
        uint64_t v418 = *((void *)__src + 71);
        uint64_t v419 = *((void *)__src + 72);
        uint64_t v420 = *((void *)__src + 73);
        uint64_t v536 = *((unsigned __int8 *)v564 + 268);
        uint64_t v559 = v564[66];
        sub_25771CCF8(v413, v414, v415, v416, v417, v418, v419, v420, v559 | (v536 << 32));
        *((void *)__dst + 66) = v413;
        *((void *)__dst + 67) = v414;
        *((void *)__dst + 68) = v415;
        *((void *)__dst + 69) = v416;
        *((void *)__dst + 70) = v417;
        *((void *)__dst + 71) = v418;
        *((void *)__dst + 72) = v419;
        *((void *)__dst + 73) = v420;
        *((unsigned char *)v566 + 268) = v536;
        v566[66] = v559;
        *((void *)__dst + 75) = *((void *)__src + 75);
        *((void *)__dst + 76) = *((void *)__src + 76);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((void *)__src + 86))
        {
LABEL_110:
          long long v421 = *(_OWORD *)(__src + 632);
          *(_OWORD *)(__dst + 616) = *(_OWORD *)(__src + 616);
          *(_OWORD *)(__dst + 632) = v421;
          long long v422 = *(_OWORD *)(__src + 648);
          long long v423 = *(_OWORD *)(__src + 664);
          long long v424 = *(_OWORD *)(__src + 680);
          *((void *)__dst + 87) = *((void *)__src + 87);
          *(_OWORD *)(__dst + 664) = v423;
          *(_OWORD *)(__dst + 680) = v424;
          *(_OWORD *)(__dst + 648) = v422;
          return __dst;
        }
LABEL_128:
        uint64_t v498 = *((void *)__src + 77);
        uint64_t v499 = *((void *)__src + 78);
        uint64_t v500 = *((void *)__src + 79);
        uint64_t v501 = *((void *)__src + 80);
        uint64_t v502 = *((void *)__src + 81);
        uint64_t v503 = *((void *)__src + 82);
        uint64_t v504 = *((void *)__src + 83);
        uint64_t v505 = *((void *)__src + 84);
        uint64_t v563 = *((unsigned __int8 *)v564 + 356);
        uint64_t v565 = v564[88];
        sub_25771CCF8(v498, v499, v500, v501, v502, v503, v504, v505, v565 | (v563 << 32));
        *((void *)__dst + 77) = v498;
        *((void *)__dst + 78) = v499;
        *((void *)__dst + 79) = v500;
        *((void *)__dst + 80) = v501;
        *((void *)__dst + 81) = v502;
        *((void *)__dst + 82) = v503;
        *((void *)__dst + 83) = v504;
        *((void *)__dst + 84) = v505;
        *((unsigned char *)v566 + 356) = v563;
        v566[88] = v565;
        *((void *)__dst + 86) = *((void *)__src + 86);
        *((void *)__dst + 87) = *((void *)__src + 87);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return __dst;
      }
LABEL_78:
      long long v281 = *(_OWORD *)(__src + 456);
      *(_OWORD *)(__dst + 440) = *(_OWORD *)(__src + 440);
      *(_OWORD *)(__dst + 456) = v281;
      long long v282 = *(_OWORD *)(__src + 472);
      long long v283 = *(_OWORD *)(__src + 488);
      long long v284 = *(_OWORD *)(__src + 504);
      *((void *)__dst + 65) = *((void *)__src + 65);
      *(_OWORD *)(__dst + 488) = v283;
      *(_OWORD *)(__dst + 504) = v284;
      *(_OWORD *)(__dst + 472) = v282;
      goto LABEL_80;
    }
    goto LABEL_72;
  }
  if (v252 == 2)
  {
    sub_2577FDD60((uint64_t)(__dst + 352));
LABEL_72:
    memcpy(__dst + 352, __src + 352, 0x160uLL);
    return __dst;
  }
  if (v251 != 1)
  {
    if (v252 == 1)
    {
      sub_257735730((uint64_t)(__dst + 352));
      long long v305 = *((_OWORD *)__src + 23);
      long long v304 = *((_OWORD *)__src + 24);
      *uint64_t v249 = *v250;
      *((_OWORD *)__dst + 23) = v305;
      *((_OWORD *)__dst + 24) = v304;
      long long v306 = *((_OWORD *)__src + 28);
      long long v308 = *((_OWORD *)__src + 25);
      long long v307 = *((_OWORD *)__src + 26);
      *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
      *((_OWORD *)__dst + 28) = v306;
      *((_OWORD *)__dst + 25) = v308;
      *((_OWORD *)__dst + 26) = v307;
      long long v309 = *((_OWORD *)__src + 32);
      long long v311 = *((_OWORD *)__src + 29);
      long long v310 = *((_OWORD *)__src + 30);
      *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
      *((_OWORD *)__dst + 32) = v309;
      *((_OWORD *)__dst + 29) = v311;
      *((_OWORD *)__dst + 30) = v310;
      goto LABEL_105;
    }
    if (v251)
    {
      if (v252)
      {
        uint64_t v316 = *((void *)__src + 45);
        uint64_t v317 = *((void *)__src + 46);
        uint64_t v318 = *((void *)__src + 47);
        uint64_t v319 = *((void *)__src + 48);
        uint64_t v320 = *((void *)__src + 49);
        uint64_t v321 = *((void *)__src + 50);
        uint64_t v322 = *((void *)__src + 51);
        uint64_t v531 = *((void *)__src + 44);
        uint64_t v554 = *((unsigned __int8 *)v564 + 92);
        uint64_t v323 = v564[22];
        sub_25771CCF8(v531, v316, v317, v318, v319, v320, v321, v322, v323 | (v554 << 32));
        uint64_t v324 = *((void *)__dst + 44);
        uint64_t v325 = *((void *)__dst + 45);
        uint64_t v326 = *((void *)__dst + 46);
        uint64_t v327 = *((void *)__dst + 47);
        uint64_t v328 = *((void *)__dst + 48);
        uint64_t v329 = *((void *)__dst + 49);
        uint64_t v330 = *((void *)__dst + 50);
        uint64_t v331 = *((void *)__dst + 51);
        unint64_t v332 = v566[22] | ((unint64_t)*((unsigned __int8 *)v566 + 92) << 32);
        *((void *)__dst + 44) = v531;
        *((void *)__dst + 45) = v316;
        *((void *)__dst + 46) = v317;
        *((void *)__dst + 47) = v318;
        *((void *)__dst + 48) = v319;
        *((void *)__dst + 49) = v320;
        *((void *)__dst + 50) = v321;
        *((void *)__dst + 51) = v322;
        v566[22] = v323;
        *((unsigned char *)v566 + 92) = v554;
        sub_25771D110(v324, v325, v326, v327, v328, v329, v330, v331, v332);
        *((void *)__dst + 53) = *((void *)__src + 53);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 54) = *((void *)__src + 54);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 352), &qword_26A030F50);
        long long v361 = *((_OWORD *)__src + 23);
        *uint64_t v249 = *v250;
        *((_OWORD *)__dst + 23) = v361;
        long long v363 = *((_OWORD *)__src + 25);
        long long v362 = *((_OWORD *)__src + 26);
        long long v364 = *((_OWORD *)__src + 24);
        *((void *)__dst + 54) = *((void *)__src + 54);
        *((_OWORD *)__dst + 25) = v363;
        *((_OWORD *)__dst + 26) = v362;
        *((_OWORD *)__dst + 24) = v364;
      }
    }
    else if (v252)
    {
      uint64_t v349 = *((void *)__src + 44);
      uint64_t v350 = *((void *)__src + 45);
      uint64_t v351 = *((void *)__src + 46);
      uint64_t v352 = *((void *)__src + 47);
      uint64_t v353 = *((void *)__src + 48);
      uint64_t v354 = *((void *)__src + 49);
      uint64_t v355 = *((void *)__src + 50);
      uint64_t v356 = *((void *)__src + 51);
      uint64_t v533 = *((unsigned __int8 *)v564 + 92);
      uint64_t v556 = v564[22];
      sub_25771CCF8(v349, v350, v351, v352, v353, v354, v355, v356, v556 | (v533 << 32));
      *((void *)__dst + 44) = v349;
      *((void *)__dst + 45) = v350;
      *((void *)__dst + 46) = v351;
      *((void *)__dst + 47) = v352;
      *((void *)__dst + 48) = v353;
      *((void *)__dst + 49) = v354;
      *((void *)__dst + 50) = v355;
      *((void *)__dst + 51) = v356;
      *((unsigned char *)v566 + 92) = v533;
      v566[22] = v556;
      *((void *)__dst + 53) = *((void *)__src + 53);
      *((void *)__dst + 54) = *((void *)__src + 54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v369 = *((_OWORD *)__src + 23);
      *uint64_t v249 = *v250;
      *((_OWORD *)__dst + 23) = v369;
      long long v370 = *((_OWORD *)__src + 24);
      long long v371 = *((_OWORD *)__src + 25);
      long long v372 = *((_OWORD *)__src + 26);
      *((void *)__dst + 54) = *((void *)__src + 54);
      *((_OWORD *)__dst + 25) = v371;
      *((_OWORD *)__dst + 26) = v372;
      *((_OWORD *)__dst + 24) = v370;
    }
    uint64_t v373 = __dst + 440;
    uint64_t v374 = __src + 440;
    uint64_t v375 = *((void *)__src + 64);
    if (*((void *)__dst + 64))
    {
      if (v375)
      {
        uint64_t v376 = *((void *)__src + 56);
        uint64_t v377 = *((void *)__src + 57);
        uint64_t v378 = *((void *)__src + 58);
        uint64_t v379 = *((void *)__src + 59);
        uint64_t v380 = *((void *)__src + 60);
        uint64_t v381 = *((void *)__src + 61);
        uint64_t v382 = *((void *)__src + 62);
        uint64_t v534 = *((void *)__src + 55);
        uint64_t v557 = *((unsigned __int8 *)v564 + 180);
        uint64_t v383 = v564[44];
        sub_25771CCF8(v534, v376, v377, v378, v379, v380, v381, v382, v383 | (v557 << 32));
        uint64_t v384 = *((void *)__dst + 55);
        uint64_t v385 = *((void *)__dst + 56);
        uint64_t v386 = *((void *)__dst + 57);
        uint64_t v387 = *((void *)__dst + 58);
        uint64_t v388 = *((void *)__dst + 59);
        uint64_t v389 = *((void *)__dst + 60);
        uint64_t v390 = *((void *)__dst + 61);
        uint64_t v391 = *((void *)__dst + 62);
        unint64_t v392 = v566[44] | ((unint64_t)*((unsigned __int8 *)v566 + 180) << 32);
        *((void *)__dst + 55) = v534;
        *((void *)__dst + 56) = v376;
        *((void *)__dst + 57) = v377;
        *((void *)__dst + 58) = v378;
        *((void *)__dst + 59) = v379;
        *((void *)__dst + 60) = v380;
        *((void *)__dst + 61) = v381;
        *((void *)__dst + 62) = v382;
        v566[44] = v383;
        *((unsigned char *)v566 + 180) = v557;
        sub_25771D110(v384, v385, v386, v387, v388, v389, v390, v391, v392);
        *((void *)__dst + 64) = *((void *)__src + 64);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((void *)__dst + 65) = *((void *)__src + 65);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2577270D4((uint64_t)(__dst + 440), &qword_26A030F50);
        long long v462 = *(_OWORD *)(__src + 456);
        *uint64_t v373 = *v374;
        *(_OWORD *)(__dst + 456) = v462;
        long long v464 = *(_OWORD *)(__src + 488);
        long long v463 = *(_OWORD *)(__src + 504);
        long long v465 = *(_OWORD *)(__src + 472);
        *((void *)__dst + 65) = *((void *)__src + 65);
        *(_OWORD *)(__dst + 488) = v464;
        *(_OWORD *)(__dst + 504) = v463;
        *(_OWORD *)(__dst + 472) = v465;
      }
      goto LABEL_105;
    }
    if (!v375)
    {
      long long v470 = *(_OWORD *)(__src + 456);
      *uint64_t v373 = *v374;
      *(_OWORD *)(__dst + 456) = v470;
      long long v471 = *(_OWORD *)(__src + 472);
      long long v472 = *(_OWORD *)(__src + 488);
      long long v473 = *(_OWORD *)(__src + 504);
      *((void *)__dst + 65) = *((void *)__src + 65);
      *(_OWORD *)(__dst + 488) = v472;
      *(_OWORD *)(__dst + 504) = v473;
      *(_OWORD *)(__dst + 472) = v471;
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  if (!v252)
  {
    long long v333 = *((_OWORD *)__src + 23);
    *uint64_t v249 = *v250;
    *((_OWORD *)__dst + 23) = v333;
    long long v334 = *((_OWORD *)__src + 24);
    long long v335 = *((_OWORD *)__src + 25);
    long long v336 = *((_OWORD *)__src + 26);
    *((void *)__dst + 54) = *((void *)__src + 54);
    *((_OWORD *)__dst + 25) = v335;
    *((_OWORD *)__dst + 26) = v336;
    *((_OWORD *)__dst + 24) = v334;
    if (!*((void *)__src + 64)) {
      goto LABEL_93;
    }
    goto LABEL_104;
  }
  if (v252 != 1)
  {
    uint64_t v337 = *((void *)__src + 44);
    uint64_t v338 = *((void *)__src + 45);
    uint64_t v339 = *((void *)__src + 46);
    uint64_t v340 = *((void *)__src + 47);
    uint64_t v341 = *((void *)__src + 48);
    uint64_t v342 = *((void *)__src + 49);
    uint64_t v343 = *((void *)__src + 50);
    uint64_t v344 = *((void *)__src + 51);
    uint64_t v532 = *((unsigned __int8 *)v564 + 92);
    uint64_t v555 = v564[22];
    sub_25771CCF8(v337, v338, v339, v340, v341, v342, v343, v344, v555 | (v532 << 32));
    *((void *)__dst + 44) = v337;
    *((void *)__dst + 45) = v338;
    *((void *)__dst + 46) = v339;
    *((void *)__dst + 47) = v340;
    *((void *)__dst + 48) = v341;
    *((void *)__dst + 49) = v342;
    *((void *)__dst + 50) = v343;
    *((void *)__dst + 51) = v344;
    *((unsigned char *)v566 + 92) = v532;
    v566[22] = v555;
    *((void *)__dst + 53) = *((void *)__src + 53);
    *((void *)__dst + 54) = *((void *)__src + 54);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!*((void *)__src + 64))
    {
LABEL_93:
      long long v345 = *(_OWORD *)(__src + 456);
      *(_OWORD *)(__dst + 440) = *(_OWORD *)(__src + 440);
      *(_OWORD *)(__dst + 456) = v345;
      long long v346 = *(_OWORD *)(__src + 472);
      long long v347 = *(_OWORD *)(__src + 488);
      long long v348 = *(_OWORD *)(__src + 504);
      *((void *)__dst + 65) = *((void *)__src + 65);
      *(_OWORD *)(__dst + 488) = v347;
      *(_OWORD *)(__dst + 504) = v348;
      *(_OWORD *)(__dst + 472) = v346;
      goto LABEL_105;
    }
LABEL_104:
    uint64_t v393 = *((void *)__src + 55);
    uint64_t v394 = *((void *)__src + 56);
    uint64_t v395 = *((void *)__src + 57);
    uint64_t v396 = *((void *)__src + 58);
    uint64_t v397 = *((void *)__src + 59);
    uint64_t v398 = *((void *)__src + 60);
    uint64_t v399 = *((void *)__src + 61);
    uint64_t v400 = *((void *)__src + 62);
    uint64_t v535 = *((unsigned __int8 *)v564 + 180);
    uint64_t v558 = v564[44];
    sub_25771CCF8(v393, v394, v395, v396, v397, v398, v399, v400, v558 | (v535 << 32));
    *((void *)__dst + 55) = v393;
    *((void *)__dst + 56) = v394;
    *((void *)__dst + 57) = v395;
    *((void *)__dst + 58) = v396;
    *((void *)__dst + 59) = v397;
    *((void *)__dst + 60) = v398;
    *((void *)__dst + 61) = v399;
    *((void *)__dst + 62) = v400;
    *((unsigned char *)v566 + 180) = v535;
    v566[44] = v558;
    *((void *)__dst + 64) = *((void *)__src + 64);
    *((void *)__dst + 65) = *((void *)__src + 65);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_105;
  }
  long long v269 = *v250;
  long long v270 = *((_OWORD *)__src + 24);
  *((_OWORD *)__dst + 23) = *((_OWORD *)__src + 23);
  *((_OWORD *)__dst + 24) = v270;
  *uint64_t v249 = v269;
  long long v271 = *((_OWORD *)__src + 25);
  long long v272 = *((_OWORD *)__src + 26);
  long long v273 = *((_OWORD *)__src + 28);
  *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
  *((_OWORD *)__dst + 28) = v273;
  *((_OWORD *)__dst + 25) = v271;
  *((_OWORD *)__dst + 26) = v272;
  long long v274 = *((_OWORD *)__src + 29);
  long long v275 = *((_OWORD *)__src + 30);
  long long v276 = *((_OWORD *)__src + 32);
  *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
  *((_OWORD *)__dst + 32) = v276;
  *((_OWORD *)__dst + 29) = v274;
  *((_OWORD *)__dst + 30) = v275;
LABEL_105:
  uint64_t v401 = __dst + 528;
  uint64_t v402 = __src + 528;
  uint64_t v403 = *((void *)__dst + 75);
  uint64_t v404 = *((void *)__src + 75);
  if (v403 == 1)
  {
    if (!v404)
    {
      long long v450 = *((_OWORD *)__src + 34);
      *uint64_t v401 = *v402;
      *((_OWORD *)__dst + 34) = v450;
      long long v451 = *((_OWORD *)__src + 35);
      long long v452 = *((_OWORD *)__src + 36);
      long long v453 = *((_OWORD *)__src + 37);
      *((void *)__dst + 76) = *((void *)__src + 76);
      *((_OWORD *)__dst + 36) = v452;
      *((_OWORD *)__dst + 37) = v453;
      *((_OWORD *)__dst + 35) = v451;
      if (!*((void *)__src + 86)) {
        goto LABEL_110;
      }
      goto LABEL_128;
    }
    if (v404 == 1)
    {
      long long v405 = *v402;
      long long v406 = *((_OWORD *)__src + 35);
      *((_OWORD *)__dst + 34) = *((_OWORD *)__src + 34);
      *((_OWORD *)__dst + 35) = v406;
      *uint64_t v401 = v405;
      long long v407 = *((_OWORD *)__src + 36);
      long long v408 = *((_OWORD *)__src + 37);
      long long v409 = *((_OWORD *)__src + 39);
      *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
      *((_OWORD *)__dst + 39) = v409;
      *((_OWORD *)__dst + 36) = v407;
      *((_OWORD *)__dst + 37) = v408;
      long long v410 = *((_OWORD *)__src + 40);
      long long v411 = *((_OWORD *)__src + 41);
      long long v412 = *((_OWORD *)__src + 43);
      *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
      *((_OWORD *)__dst + 43) = v412;
      *((_OWORD *)__dst + 40) = v410;
      *((_OWORD *)__dst + 41) = v411;
      return __dst;
    }
    goto LABEL_109;
  }
  if (v404 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 528));
    long long v426 = *((_OWORD *)__src + 34);
    long long v425 = *((_OWORD *)__src + 35);
    *uint64_t v401 = *v402;
    *((_OWORD *)__dst + 34) = v426;
    *((_OWORD *)__dst + 35) = v425;
    long long v427 = *((_OWORD *)__src + 39);
    long long v429 = *((_OWORD *)__src + 36);
    long long v428 = *((_OWORD *)__src + 37);
    *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
    *((_OWORD *)__dst + 39) = v427;
    *((_OWORD *)__dst + 36) = v429;
    *((_OWORD *)__dst + 37) = v428;
    long long v430 = *((_OWORD *)__src + 43);
    long long v432 = *((_OWORD *)__src + 40);
    long long v431 = *((_OWORD *)__src + 41);
    *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
    *((_OWORD *)__dst + 43) = v430;
    *((_OWORD *)__dst + 40) = v432;
    *((_OWORD *)__dst + 41) = v431;
    return __dst;
  }
  if (v403)
  {
    if (v404)
    {
      uint64_t v433 = *((void *)__src + 67);
      uint64_t v434 = *((void *)__src + 68);
      uint64_t v435 = *((void *)__src + 69);
      uint64_t v436 = *((void *)__src + 70);
      uint64_t v437 = *((void *)__src + 71);
      uint64_t v438 = *((void *)__src + 72);
      uint64_t v439 = *((void *)__src + 73);
      uint64_t v537 = *((void *)__src + 66);
      uint64_t v560 = *((unsigned __int8 *)v564 + 268);
      uint64_t v440 = v564[66];
      sub_25771CCF8(v537, v433, v434, v435, v436, v437, v438, v439, v440 | (v560 << 32));
      uint64_t v441 = *((void *)__dst + 66);
      uint64_t v442 = *((void *)__dst + 67);
      uint64_t v443 = *((void *)__dst + 68);
      uint64_t v444 = *((void *)__dst + 69);
      uint64_t v445 = *((void *)__dst + 70);
      uint64_t v446 = *((void *)__dst + 71);
      uint64_t v447 = *((void *)__dst + 72);
      uint64_t v448 = *((void *)__dst + 73);
      unint64_t v449 = v566[66] | ((unint64_t)*((unsigned __int8 *)v566 + 268) << 32);
      *((void *)__dst + 66) = v537;
      *((void *)__dst + 67) = v433;
      *((void *)__dst + 68) = v434;
      *((void *)__dst + 69) = v435;
      *((void *)__dst + 70) = v436;
      *((void *)__dst + 71) = v437;
      *((void *)__dst + 72) = v438;
      *((void *)__dst + 73) = v439;
      v566[66] = v440;
      *((unsigned char *)v566 + 268) = v560;
      sub_25771D110(v441, v442, v443, v444, v445, v446, v447, v448, v449);
      *((void *)__dst + 75) = *((void *)__src + 75);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)__dst + 76) = *((void *)__src + 76);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2577270D4((uint64_t)(__dst + 528), &qword_26A030F50);
      long long v466 = *((_OWORD *)__src + 34);
      *uint64_t v401 = *v402;
      *((_OWORD *)__dst + 34) = v466;
      long long v468 = *((_OWORD *)__src + 36);
      long long v467 = *((_OWORD *)__src + 37);
      long long v469 = *((_OWORD *)__src + 35);
      *((void *)__dst + 76) = *((void *)__src + 76);
      *((_OWORD *)__dst + 36) = v468;
      *((_OWORD *)__dst + 37) = v467;
      *((_OWORD *)__dst + 35) = v469;
    }
  }
  else if (v404)
  {
    uint64_t v454 = *((void *)__src + 66);
    uint64_t v455 = *((void *)__src + 67);
    uint64_t v456 = *((void *)__src + 68);
    uint64_t v457 = *((void *)__src + 69);
    uint64_t v458 = *((void *)__src + 70);
    uint64_t v459 = *((void *)__src + 71);
    uint64_t v460 = *((void *)__src + 72);
    uint64_t v461 = *((void *)__src + 73);
    uint64_t v538 = *((unsigned __int8 *)v564 + 268);
    uint64_t v561 = v564[66];
    sub_25771CCF8(v454, v455, v456, v457, v458, v459, v460, v461, v561 | (v538 << 32));
    *((void *)__dst + 66) = v454;
    *((void *)__dst + 67) = v455;
    *((void *)__dst + 68) = v456;
    *((void *)__dst + 69) = v457;
    *((void *)__dst + 70) = v458;
    *((void *)__dst + 71) = v459;
    *((void *)__dst + 72) = v460;
    *((void *)__dst + 73) = v461;
    *((unsigned char *)v566 + 268) = v538;
    v566[66] = v561;
    *((void *)__dst + 75) = *((void *)__src + 75);
    *((void *)__dst + 76) = *((void *)__src + 76);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v474 = *((_OWORD *)__src + 34);
    *uint64_t v401 = *v402;
    *((_OWORD *)__dst + 34) = v474;
    long long v475 = *((_OWORD *)__src + 35);
    long long v476 = *((_OWORD *)__src + 36);
    long long v477 = *((_OWORD *)__src + 37);
    *((void *)__dst + 76) = *((void *)__src + 76);
    *((_OWORD *)__dst + 36) = v476;
    *((_OWORD *)__dst + 37) = v477;
    *((_OWORD *)__dst + 35) = v475;
  }
  uint64_t v478 = __dst + 616;
  uint64_t v479 = __src + 616;
  uint64_t v480 = *((void *)__src + 86);
  if (!*((void *)__dst + 86))
  {
    if (!v480)
    {
      long long v511 = *(_OWORD *)(__src + 632);
      *uint64_t v478 = *v479;
      *(_OWORD *)(__dst + 632) = v511;
      long long v512 = *(_OWORD *)(__src + 648);
      long long v513 = *(_OWORD *)(__src + 664);
      long long v514 = *(_OWORD *)(__src + 680);
      *((void *)__dst + 87) = *((void *)__src + 87);
      *(_OWORD *)(__dst + 664) = v513;
      *(_OWORD *)(__dst + 680) = v514;
      *(_OWORD *)(__dst + 648) = v512;
      return __dst;
    }
    goto LABEL_128;
  }
  if (v480)
  {
    uint64_t v481 = *((void *)__src + 78);
    uint64_t v482 = *((void *)__src + 79);
    uint64_t v483 = *((void *)__src + 80);
    uint64_t v484 = *((void *)__src + 81);
    uint64_t v485 = *((void *)__src + 82);
    uint64_t v486 = *((void *)__src + 83);
    uint64_t v487 = *((void *)__src + 84);
    uint64_t v539 = *((void *)__src + 77);
    uint64_t v562 = *((unsigned __int8 *)v564 + 356);
    uint64_t v488 = v564[88];
    sub_25771CCF8(v539, v481, v482, v483, v484, v485, v486, v487, v488 | (v562 << 32));
    uint64_t v489 = *((void *)__dst + 77);
    uint64_t v490 = *((void *)__dst + 78);
    uint64_t v491 = *((void *)__dst + 79);
    uint64_t v492 = *((void *)__dst + 80);
    uint64_t v493 = *((void *)__dst + 81);
    uint64_t v494 = *((void *)__dst + 82);
    uint64_t v495 = *((void *)__dst + 83);
    uint64_t v496 = *((void *)__dst + 84);
    unint64_t v497 = v566[88] | ((unint64_t)*((unsigned __int8 *)v566 + 356) << 32);
    *((void *)__dst + 77) = v539;
    *((void *)__dst + 78) = v481;
    *((void *)__dst + 79) = v482;
    *((void *)__dst + 80) = v483;
    *((void *)__dst + 81) = v484;
    *((void *)__dst + 82) = v485;
    *((void *)__dst + 83) = v486;
    *((void *)__dst + 84) = v487;
    v566[88] = v488;
    *((unsigned char *)v566 + 356) = v562;
    sub_25771D110(v489, v490, v491, v492, v493, v494, v495, v496, v497);
    *((void *)__dst + 86) = *((void *)__src + 86);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((void *)__dst + 87) = *((void *)__src + 87);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2577270D4((uint64_t)(__dst + 616), &qword_26A030F50);
    long long v507 = *(_OWORD *)(__src + 632);
    *uint64_t v478 = *v479;
    *(_OWORD *)(__dst + 632) = v507;
    long long v509 = *(_OWORD *)(__src + 664);
    long long v508 = *(_OWORD *)(__src + 680);
    long long v510 = *(_OWORD *)(__src + 648);
    *((void *)__dst + 87) = *((void *)__src + 87);
    *(_OWORD *)(__dst + 664) = v509;
    *(_OWORD *)(__dst + 680) = v508;
    *(_OWORD *)(__dst + 648) = v510;
  }
  return __dst;
}

void *__swift_memcpy704_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x2C0uLL);
}

char *assignWithTake for ActivityFlexibleUpdateTheme.Graphic(char *__dst, char *__src)
{
  uint64_t v4 = __dst + 264;
  uint64_t v5 = __src + 264;
  uint64_t v6 = *((void *)__dst + 9);
  if (v6 == 2) {
    goto LABEL_4;
  }
  uint64_t v7 = *((void *)__src + 9);
  if (v7 == 2)
  {
    sub_2577FDD60((uint64_t)__dst);
LABEL_4:
    memcpy(__dst, __src, 0x160uLL);
    goto LABEL_13;
  }
  if (v6 == 1) {
    goto LABEL_8;
  }
  if (v7 == 1)
  {
    sub_257735730((uint64_t)__dst);
LABEL_8:
    long long v8 = *((_OWORD *)__src + 9);
    *((_OWORD *)__dst + 8) = *((_OWORD *)__src + 8);
    *((_OWORD *)__dst + 9) = v8;
    *((_OWORD *)__dst + 10) = *((_OWORD *)__src + 10);
    long long v9 = *((_OWORD *)__src + 5);
    *((_OWORD *)__dst + 4) = *((_OWORD *)__src + 4);
    *((_OWORD *)__dst + 5) = v9;
    long long v10 = *((_OWORD *)__src + 7);
    *((_OWORD *)__dst + 6) = *((_OWORD *)__src + 6);
    *((_OWORD *)__dst + 7) = v10;
    long long v11 = *((_OWORD *)__src + 1);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v11;
    long long v12 = *((_OWORD *)__src + 3);
    *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
    *((_OWORD *)__dst + 3) = v12;
    goto LABEL_9;
  }
  if (v6)
  {
    if (v7)
    {
      char v41 = __src[68];
      int v42 = *((_DWORD *)__src + 16);
      uint64_t v43 = *(void *)__dst;
      uint64_t v44 = *((void *)__dst + 1);
      uint64_t v45 = *((void *)__dst + 2);
      uint64_t v46 = *((void *)__dst + 3);
      uint64_t v47 = *((void *)__dst + 4);
      uint64_t v48 = *((void *)__dst + 5);
      uint64_t v49 = *((void *)__dst + 6);
      uint64_t v50 = *((void *)__dst + 7);
      unint64_t v51 = *((unsigned int *)__dst + 16) | ((unint64_t)__dst[68] << 32);
      long long v52 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v52;
      long long v53 = *((_OWORD *)__src + 3);
      *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
      *((_OWORD *)__dst + 3) = v53;
      *((_DWORD *)__dst + 16) = v42;
      __dst[68] = v41;
      sub_25771D110(v43, v44, v45, v46, v47, v48, v49, v50, v51);
      *((void *)__dst + 9) = *((void *)__src + 9);
      swift_bridgeObjectRelease();
      *((void *)__dst + 10) = *((void *)__src + 10);
      swift_bridgeObjectRelease();
      goto LABEL_40;
    }
    sub_2577270D4((uint64_t)__dst, &qword_26A030F50);
  }
  long long v93 = *((_OWORD *)__src + 3);
  *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
  *((_OWORD *)__dst + 3) = v93;
  *((_OWORD *)__dst + 4) = *((_OWORD *)__src + 4);
  *((void *)__dst + 10) = *((void *)__src + 10);
  long long v94 = *((_OWORD *)__src + 1);
  *(_OWORD *)__dst = *(_OWORD *)__src;
  *((_OWORD *)__dst + 1) = v94;
LABEL_40:
  if (*((void *)__dst + 20))
  {
    if (*((void *)__src + 20))
    {
      char v95 = __src[156];
      int v96 = *((_DWORD *)__src + 38);
      uint64_t v97 = *((void *)__dst + 11);
      uint64_t v98 = *((void *)__dst + 12);
      uint64_t v99 = *((void *)__dst + 13);
      uint64_t v100 = *((void *)__dst + 14);
      uint64_t v101 = *((void *)__dst + 15);
      uint64_t v102 = *((void *)__dst + 16);
      uint64_t v103 = *((void *)__dst + 17);
      uint64_t v104 = *((void *)__dst + 18);
      unint64_t v105 = *((unsigned int *)__dst + 38) | ((unint64_t)__dst[156] << 32);
      long long v106 = *(_OWORD *)(__src + 104);
      *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
      *(_OWORD *)(__dst + 104) = v106;
      long long v107 = *(_OWORD *)(__src + 136);
      *(_OWORD *)(__dst + 120) = *(_OWORD *)(__src + 120);
      *(_OWORD *)(__dst + 136) = v107;
      *((_DWORD *)__dst + 38) = v96;
      __dst[156] = v95;
      sub_25771D110(v97, v98, v99, v100, v101, v102, v103, v104, v105);
      *((void *)__dst + 20) = *((void *)__src + 20);
      swift_bridgeObjectRelease();
      *((void *)__dst + 21) = *((void *)__src + 21);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    sub_2577270D4((uint64_t)(__dst + 88), &qword_26A030F50);
  }
  long long v153 = *(_OWORD *)(__src + 136);
  *(_OWORD *)(__dst + 120) = *(_OWORD *)(__src + 120);
  *(_OWORD *)(__dst + 136) = v153;
  *(_OWORD *)(__dst + 152) = *(_OWORD *)(__src + 152);
  *((void *)__dst + 21) = *((void *)__src + 21);
  long long v154 = *(_OWORD *)(__src + 104);
  *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
  *(_OWORD *)(__dst + 104) = v154;
LABEL_9:
  long long v13 = __dst + 176;
  long long v14 = __src + 176;
  uint64_t v15 = *((void *)__dst + 31);
  if (v15 == 1)
  {
LABEL_12:
    long long v17 = *((_OWORD *)__src + 20);
    *((_OWORD *)__dst + 19) = *((_OWORD *)__src + 19);
    *((_OWORD *)__dst + 20) = v17;
    *((_OWORD *)__dst + 21) = *((_OWORD *)__src + 21);
    long long v18 = *((_OWORD *)__src + 16);
    *((_OWORD *)__dst + 15) = *((_OWORD *)__src + 15);
    *((_OWORD *)__dst + 16) = v18;
    long long v19 = *((_OWORD *)__src + 18);
    *((_OWORD *)__dst + 17) = *((_OWORD *)__src + 17);
    *((_OWORD *)__dst + 18) = v19;
    long long v20 = *((_OWORD *)__src + 12);
    *long long v13 = *v14;
    *((_OWORD *)__dst + 12) = v20;
    long long v21 = *((_OWORD *)__src + 14);
    *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
    *((_OWORD *)__dst + 14) = v21;
    goto LABEL_13;
  }
  uint64_t v16 = *((void *)__src + 31);
  if (v16 == 1)
  {
    sub_2577356DC((uint64_t)(__dst + 176));
    goto LABEL_12;
  }
  if (v15)
  {
    if (v16)
    {
      char v54 = __src[244];
      int v55 = *((_DWORD *)__src + 60);
      uint64_t v56 = *((void *)__dst + 22);
      uint64_t v57 = *((void *)__dst + 23);
      uint64_t v58 = *((void *)__dst + 24);
      uint64_t v59 = *((void *)__dst + 25);
      uint64_t v60 = *((void *)__dst + 26);
      uint64_t v61 = *((void *)__dst + 27);
      uint64_t v62 = *((void *)__dst + 28);
      uint64_t v63 = *((void *)__dst + 29);
      unint64_t v64 = *((unsigned int *)__dst + 60) | ((unint64_t)__dst[244] << 32);
      long long v65 = *((_OWORD *)__src + 12);
      *((_OWORD *)__dst + 11) = *((_OWORD *)__src + 11);
      *((_OWORD *)__dst + 12) = v65;
      long long v66 = *((_OWORD *)__src + 14);
      *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
      *((_OWORD *)__dst + 14) = v66;
      *((_DWORD *)__dst + 60) = v55;
      __dst[244] = v54;
      sub_25771D110(v56, v57, v58, v59, v60, v61, v62, v63, v64);
      *((void *)__dst + 31) = *((void *)__src + 31);
      swift_bridgeObjectRelease();
      *((void *)__dst + 32) = *((void *)__src + 32);
      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    sub_2577270D4((uint64_t)(__dst + 176), &qword_26A030F50);
  }
  long long v108 = *((_OWORD *)__src + 14);
  *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
  *((_OWORD *)__dst + 14) = v108;
  *((_OWORD *)__dst + 15) = *((_OWORD *)__src + 15);
  *((void *)__dst + 32) = *((void *)__src + 32);
  long long v109 = *((_OWORD *)__src + 12);
  *long long v13 = *v14;
  *((_OWORD *)__dst + 12) = v109;
LABEL_45:
  if (*((void *)__dst + 42))
  {
    if (*((void *)__src + 42))
    {
      char v110 = v5[68];
      int v111 = *((_DWORD *)v5 + 16);
      uint64_t v112 = *((void *)__dst + 33);
      uint64_t v113 = *((void *)__dst + 34);
      uint64_t v114 = *((void *)__dst + 35);
      uint64_t v115 = *((void *)__dst + 36);
      uint64_t v116 = *((void *)__dst + 37);
      uint64_t v117 = *((void *)__dst + 38);
      uint64_t v118 = *((void *)__dst + 39);
      uint64_t v119 = *((void *)__dst + 40);
      unint64_t v120 = *((unsigned int *)v4 + 16) | ((unint64_t)v4[68] << 32);
      long long v121 = *((_OWORD *)v5 + 1);
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
      *((_OWORD *)v4 + 1) = v121;
      long long v122 = *((_OWORD *)v5 + 3);
      *((_OWORD *)v4 + 2) = *((_OWORD *)v5 + 2);
      *((_OWORD *)v4 + 3) = v122;
      *((_DWORD *)v4 + 16) = v111;
      v4[68] = v110;
      sub_25771D110(v112, v113, v114, v115, v116, v117, v118, v119, v120);
      *((void *)__dst + 42) = *((void *)__src + 42);
      swift_bridgeObjectRelease();
      *((void *)__dst + 43) = *((void *)__src + 43);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    sub_2577270D4((uint64_t)v4, &qword_26A030F50);
  }
  long long v155 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v4 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v4 + 3) = v155;
  *((_OWORD *)v4 + 4) = *((_OWORD *)v5 + 4);
  *((void *)v4 + 10) = *((void *)v5 + 10);
  long long v156 = *((_OWORD *)v5 + 1);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
  *((_OWORD *)v4 + 1) = v156;
LABEL_13:
  long long v22 = __dst + 352;
  long long v23 = __src + 352;
  uint64_t v24 = *((void *)__dst + 53);
  if (v24 != 2)
  {
    uint64_t v25 = *((void *)__src + 53);
    if (v25 == 2)
    {
      sub_2577FDD60((uint64_t)(__dst + 352));
      goto LABEL_16;
    }
    if (v24 == 1) {
      goto LABEL_20;
    }
    if (v25 == 1)
    {
      sub_257735730((uint64_t)(__dst + 352));
LABEL_20:
      long long v26 = *((_OWORD *)__src + 31);
      *((_OWORD *)__dst + 30) = *((_OWORD *)__src + 30);
      *((_OWORD *)__dst + 31) = v26;
      *((_OWORD *)__dst + 32) = *((_OWORD *)__src + 32);
      long long v27 = *((_OWORD *)__src + 27);
      *((_OWORD *)__dst + 26) = *((_OWORD *)__src + 26);
      *((_OWORD *)__dst + 27) = v27;
      long long v28 = *((_OWORD *)__src + 29);
      *((_OWORD *)__dst + 28) = *((_OWORD *)__src + 28);
      *((_OWORD *)__dst + 29) = v28;
      long long v29 = *((_OWORD *)__src + 23);
      *long long v22 = *v23;
      *((_OWORD *)__dst + 23) = v29;
      long long v30 = *((_OWORD *)__src + 25);
      *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
      *((_OWORD *)__dst + 25) = v30;
      goto LABEL_21;
    }
    if (v24)
    {
      if (v25)
      {
        char v67 = v5[156];
        int v68 = *((_DWORD *)v5 + 38);
        uint64_t v69 = *((void *)__dst + 44);
        uint64_t v70 = *((void *)__dst + 45);
        uint64_t v71 = *((void *)__dst + 46);
        uint64_t v72 = *((void *)__dst + 47);
        uint64_t v73 = *((void *)__dst + 48);
        uint64_t v74 = *((void *)__dst + 49);
        uint64_t v75 = *((void *)__dst + 50);
        uint64_t v76 = *((void *)__dst + 51);
        unint64_t v77 = *((unsigned int *)v4 + 38) | ((unint64_t)v4[156] << 32);
        long long v78 = *((_OWORD *)__src + 23);
        *((_OWORD *)__dst + 22) = *((_OWORD *)__src + 22);
        *((_OWORD *)__dst + 23) = v78;
        long long v79 = *((_OWORD *)__src + 25);
        *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
        *((_OWORD *)__dst + 25) = v79;
        *((_DWORD *)v4 + 38) = v68;
        v4[156] = v67;
        sub_25771D110(v69, v70, v71, v72, v73, v74, v75, v76, v77);
        *((void *)__dst + 53) = *((void *)__src + 53);
        swift_bridgeObjectRelease();
        *((void *)__dst + 54) = *((void *)__src + 54);
        swift_bridgeObjectRelease();
        goto LABEL_50;
      }
      sub_2577270D4((uint64_t)(__dst + 352), &qword_26A030F50);
    }
    long long v123 = *((_OWORD *)__src + 25);
    *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
    *((_OWORD *)__dst + 25) = v123;
    *((_OWORD *)__dst + 26) = *((_OWORD *)__src + 26);
    *((void *)__dst + 54) = *((void *)__src + 54);
    long long v124 = *((_OWORD *)__src + 23);
    *long long v22 = *v23;
    *((_OWORD *)__dst + 23) = v124;
LABEL_50:
    if (*((void *)__dst + 64))
    {
      if (*((void *)__src + 64))
      {
        char v125 = v5[244];
        int v126 = *((_DWORD *)v5 + 60);
        uint64_t v127 = *((void *)__dst + 55);
        uint64_t v128 = *((void *)__dst + 56);
        uint64_t v129 = *((void *)__dst + 57);
        uint64_t v130 = *((void *)__dst + 58);
        uint64_t v131 = *((void *)__dst + 59);
        uint64_t v132 = *((void *)__dst + 60);
        uint64_t v133 = *((void *)__dst + 61);
        uint64_t v134 = *((void *)__dst + 62);
        unint64_t v135 = *((unsigned int *)v4 + 60) | ((unint64_t)v4[244] << 32);
        long long v136 = *((_OWORD *)v5 + 12);
        *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 11);
        *((_OWORD *)v4 + 12) = v136;
        long long v137 = *((_OWORD *)v5 + 14);
        *((_OWORD *)v4 + 13) = *((_OWORD *)v5 + 13);
        *((_OWORD *)v4 + 14) = v137;
        *((_DWORD *)v4 + 60) = v126;
        v4[244] = v125;
        sub_25771D110(v127, v128, v129, v130, v131, v132, v133, v134, v135);
        *((void *)__dst + 64) = *((void *)__src + 64);
        swift_bridgeObjectRelease();
        *((void *)__dst + 65) = *((void *)__src + 65);
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
      sub_2577270D4((uint64_t)(v4 + 176), &qword_26A030F50);
    }
    long long v157 = *((_OWORD *)v5 + 14);
    *((_OWORD *)v4 + 13) = *((_OWORD *)v5 + 13);
    *((_OWORD *)v4 + 14) = v157;
    *((_OWORD *)v4 + 15) = *((_OWORD *)v5 + 15);
    *((void *)v4 + 32) = *((void *)v5 + 32);
    long long v158 = *((_OWORD *)v5 + 12);
    *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 11);
    *((_OWORD *)v4 + 12) = v158;
LABEL_21:
    long long v31 = __dst + 528;
    long long v32 = __src + 528;
    uint64_t v33 = *((void *)__dst + 75);
    if (v33 == 1)
    {
LABEL_24:
      long long v35 = *((_OWORD *)__src + 42);
      *((_OWORD *)__dst + 41) = *((_OWORD *)__src + 41);
      *((_OWORD *)__dst + 42) = v35;
      *((_OWORD *)__dst + 43) = *((_OWORD *)__src + 43);
      long long v36 = *((_OWORD *)__src + 38);
      *((_OWORD *)__dst + 37) = *((_OWORD *)__src + 37);
      *((_OWORD *)__dst + 38) = v36;
      long long v37 = *((_OWORD *)__src + 40);
      *((_OWORD *)__dst + 39) = *((_OWORD *)__src + 39);
      *((_OWORD *)__dst + 40) = v37;
      long long v38 = *((_OWORD *)__src + 34);
      *long long v31 = *v32;
      *((_OWORD *)__dst + 34) = v38;
      long long v39 = *((_OWORD *)__src + 36);
      *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
      *((_OWORD *)__dst + 36) = v39;
      return __dst;
    }
    uint64_t v34 = *((void *)__src + 75);
    if (v34 == 1)
    {
      sub_2577356DC((uint64_t)(__dst + 528));
      goto LABEL_24;
    }
    if (v33)
    {
      if (v34)
      {
        char v80 = v5[332];
        int v81 = *((_DWORD *)v5 + 82);
        uint64_t v82 = *((void *)__dst + 66);
        uint64_t v83 = *((void *)__dst + 67);
        uint64_t v84 = *((void *)__dst + 68);
        uint64_t v85 = *((void *)__dst + 69);
        uint64_t v86 = *((void *)__dst + 70);
        uint64_t v87 = *((void *)__dst + 71);
        uint64_t v88 = *((void *)__dst + 72);
        uint64_t v89 = *((void *)__dst + 73);
        unint64_t v90 = *((unsigned int *)v4 + 82) | ((unint64_t)v4[332] << 32);
        long long v91 = *((_OWORD *)__src + 34);
        *((_OWORD *)__dst + 33) = *((_OWORD *)__src + 33);
        *((_OWORD *)__dst + 34) = v91;
        long long v92 = *((_OWORD *)__src + 36);
        *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
        *((_OWORD *)__dst + 36) = v92;
        *((_DWORD *)v4 + 82) = v81;
        v4[332] = v80;
        sub_25771D110(v82, v83, v84, v85, v86, v87, v88, v89, v90);
        *((void *)__dst + 75) = *((void *)__src + 75);
        swift_bridgeObjectRelease();
        *((void *)__dst + 76) = *((void *)__src + 76);
        swift_bridgeObjectRelease();
        goto LABEL_55;
      }
      sub_2577270D4((uint64_t)(__dst + 528), &qword_26A030F50);
    }
    long long v138 = *((_OWORD *)__src + 36);
    *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
    *((_OWORD *)__dst + 36) = v138;
    *((_OWORD *)__dst + 37) = *((_OWORD *)__src + 37);
    *((void *)__dst + 76) = *((void *)__src + 76);
    long long v139 = *((_OWORD *)__src + 34);
    *long long v31 = *v32;
    *((_OWORD *)__dst + 34) = v139;
LABEL_55:
    if (*((void *)__dst + 86))
    {
      if (*((void *)__src + 86))
      {
        char v140 = v5[420];
        int v141 = *((_DWORD *)v5 + 104);
        uint64_t v142 = *((void *)__dst + 77);
        uint64_t v143 = *((void *)__dst + 78);
        uint64_t v144 = *((void *)__dst + 79);
        uint64_t v145 = *((void *)__dst + 80);
        uint64_t v146 = *((void *)__dst + 81);
        uint64_t v147 = *((void *)__dst + 82);
        uint64_t v148 = *((void *)__dst + 83);
        uint64_t v149 = *((void *)__dst + 84);
        unint64_t v150 = *((unsigned int *)v4 + 104) | ((unint64_t)v4[420] << 32);
        long long v151 = *((_OWORD *)v5 + 23);
        *((_OWORD *)v4 + 22) = *((_OWORD *)v5 + 22);
        *((_OWORD *)v4 + 23) = v151;
        long long v152 = *((_OWORD *)v5 + 25);
        *((_OWORD *)v4 + 24) = *((_OWORD *)v5 + 24);
        *((_OWORD *)v4 + 25) = v152;
        *((_DWORD *)v4 + 104) = v141;
        v4[420] = v140;
        sub_25771D110(v142, v143, v144, v145, v146, v147, v148, v149, v150);
        *((void *)__dst + 86) = *((void *)__src + 86);
        swift_bridgeObjectRelease();
        *((void *)__dst + 87) = *((void *)__src + 87);
        swift_bridgeObjectRelease();
        return __dst;
      }
      sub_2577270D4((uint64_t)(v4 + 352), &qword_26A030F50);
    }
    long long v159 = *((_OWORD *)v5 + 25);
    *((_OWORD *)v4 + 24) = *((_OWORD *)v5 + 24);
    *((_OWORD *)v4 + 25) = v159;
    *((_OWORD *)v4 + 26) = *((_OWORD *)v5 + 26);
    *((void *)v4 + 54) = *((void *)v5 + 54);
    long long v160 = *((_OWORD *)v5 + 23);
    *((_OWORD *)v4 + 22) = *((_OWORD *)v5 + 22);
    *((_OWORD *)v4 + 23) = v160;
    return __dst;
  }
LABEL_16:
  memcpy(__dst + 352, __src + 352, 0x160uLL);
  return __dst;
}

uint64_t getEnumTagSinglePayload for ActivityFlexibleUpdateTheme.Graphic(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 704)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 72);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v5 = -1;
  }
  else {
    int v5 = v4;
  }
  if (v4 <= 1) {
    int v4 = 1;
  }
  int v6 = v4 - 2;
  if (v5 < 1) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdateTheme.Graphic(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFC)
  {
    *(void *)(result + 696) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 704) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 704) = 0;
    }
    if (a2) {
      *(void *)(result + 72) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdateTheme.Graphic()
{
  return &type metadata for ActivityFlexibleUpdateTheme.Graphic;
}

unsigned char *storeEnumTagSinglePayload for ActivityFlexibleUpdateTheme.Graphic.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x257B40874);
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

ValueMetadata *type metadata accessor for ActivityFlexibleUpdateTheme.Graphic.CodingKeys()
{
  return &type metadata for ActivityFlexibleUpdateTheme.Graphic.CodingKeys;
}

unsigned char *_s22NewsLiveActivitiesCore22ActivityFlexibleUpdateV11GraphicSizeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x257B40978);
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

ValueMetadata *type metadata accessor for ActivityFlexibleUpdate.Graphic.CodingKeys()
{
  return &type metadata for ActivityFlexibleUpdate.Graphic.CodingKeys;
}

unint64_t sub_257B409B4()
{
  unint64_t result = qword_26A035FA0;
  if (!qword_26A035FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FA0);
  }
  return result;
}

unint64_t sub_257B40A0C()
{
  unint64_t result = qword_26A035FA8;
  if (!qword_26A035FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FA8);
  }
  return result;
}

unint64_t sub_257B40A64()
{
  unint64_t result = qword_26A035FB0;
  if (!qword_26A035FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FB0);
  }
  return result;
}

unint64_t sub_257B40ABC()
{
  unint64_t result = qword_26A035FB8;
  if (!qword_26A035FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FB8);
  }
  return result;
}

unint64_t sub_257B40B14()
{
  unint64_t result = qword_26A035FC0;
  if (!qword_26A035FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FC0);
  }
  return result;
}

unint64_t sub_257B40B6C()
{
  unint64_t result = qword_26A035FC8;
  if (!qword_26A035FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FC8);
  }
  return result;
}

uint64_t sub_257B40BC0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7465737361 && a2 == 0xE500000000000000;
  if (v2 || (sub_257B45BA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702521203 && a2 == 0xE400000000000000 || (sub_257B45BA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567646162 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_257B45BA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_257B40CF8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7465737361 && a2 == 0xE500000000000000;
  if (v2 || (sub_257B45BA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6567646162 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_257B45BA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_257B40DDC()
{
  unint64_t result = qword_26A035FD0;
  if (!qword_26A035FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FD0);
  }
  return result;
}

uint64_t sub_257B40E30(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(a1 + 368);
  uint64_t v37 = *(void *)(a1 + 360);
  uint64_t v38 = *(void *)(a1 + 352);
  uint64_t v5 = *(void *)(a1 + 376);
  uint64_t v6 = *(void *)(a1 + 384);
  uint64_t v7 = *(void *)(a1 + 392);
  uint64_t v8 = *(void *)(a1 + 400);
  uint64_t v9 = *(void *)(a1 + 408);
  long long v35 = *(_OWORD *)(a1 + 432);
  long long v36 = *(_OWORD *)(a1 + 416);
  long long v33 = *(_OWORD *)(a1 + 464);
  long long v34 = *(_OWORD *)(a1 + 448);
  long long v31 = *(_OWORD *)(a1 + 496);
  long long v32 = *(_OWORD *)(a1 + 480);
  long long v29 = *(_OWORD *)(a1 + 528);
  long long v30 = *(_OWORD *)(a1 + 512);
  long long v28 = *(_OWORD *)(a1 + 544);
  long long v26 = *(_OWORD *)(a1 + 576);
  long long v27 = *(_OWORD *)(a1 + 560);
  long long v24 = *(_OWORD *)(a1 + 608);
  long long v25 = *(_OWORD *)(a1 + 592);
  uint64_t v10 = *(void *)(a1 + 688);
  uint64_t v11 = *(void *)(a1 + 696);
  long long v22 = *(_OWORD *)(a1 + 640);
  long long v23 = *(_OWORD *)(a1 + 624);
  long long v20 = *(_OWORD *)(a1 + 672);
  long long v21 = *(_OWORD *)(a1 + 656);
  long long v18 = *(_OWORD *)(a1 + 304);
  long long v19 = *(_OWORD *)(a1 + 320);
  long long v16 = *(_OWORD *)(a1 + 272);
  long long v17 = *(_OWORD *)(a1 + 288);
  long long v14 = *(_OWORD *)(a1 + 240);
  long long v15 = *(_OWORD *)(a1 + 256);
  long long v13 = *(_OWORD *)(a1 + 208);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v13,
    *((void *)&v13 + 1),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v14,
    *((void *)&v14 + 1),
    v15,
    *((void *)&v15 + 1),
    v16,
    *((void *)&v16 + 1),
    v17,
    *((void *)&v17 + 1),
    v18,
    *((void *)&v18 + 1),
    v19,
    *((void *)&v19 + 1),
    *(void *)(a1 + 336),
    *(void *)(a1 + 344));
  a2(v38, v37, v4, v5, v6, v7, v8, v9, v36, *((void *)&v36 + 1), v35, *((void *)&v35 + 1), v34, *((void *)&v34 + 1), v33, *((void *)&v33 + 1), v32, *((void *)&v32 + 1), v31,
    *((void *)&v31 + 1),
    v30,
    *((void *)&v30 + 1),
    v29,
    *((void *)&v29 + 1),
    v28,
    *((void *)&v28 + 1),
    v27,
    *((void *)&v27 + 1),
    v26,
    *((void *)&v26 + 1),
    v25,
    *((void *)&v25 + 1),
    v24,
    *((void *)&v24 + 1),
    v23,
    *((void *)&v23 + 1),
    v22,
    *((void *)&v22 + 1),
    v21,
    *((void *)&v21 + 1),
    v20,
    *((void *)&v20 + 1),
    v10,
    v11);
  return a1;
}

uint64_t sub_257B41024(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(a1 + 184);
  uint64_t v20 = *(void *)(a1 + 176);
  uint64_t v5 = *(void *)(a1 + 192);
  uint64_t v6 = *(void *)(a1 + 200);
  uint64_t v7 = *(void *)(a1 + 208);
  uint64_t v8 = *(void *)(a1 + 216);
  uint64_t v9 = *(void *)(a1 + 224);
  uint64_t v10 = *(void *)(a1 + 232);
  long long v18 = *(_OWORD *)(a1 + 256);
  long long v19 = *(_OWORD *)(a1 + 240);
  long long v16 = *(_OWORD *)(a1 + 288);
  long long v17 = *(_OWORD *)(a1 + 272);
  long long v14 = *(_OWORD *)(a1 + 320);
  long long v15 = *(_OWORD *)(a1 + 304);
  uint64_t v11 = *(void *)(a1 + 336);
  uint64_t v12 = *(void *)(a1 + 344);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168));
  a3(v20, v4, v5, v6, v7, v8, v9, v10, v19, *((void *)&v19 + 1), v18, *((void *)&v18 + 1), v17, *((void *)&v17 + 1), v16, *((void *)&v16 + 1), v15, *((void *)&v15 + 1), v14,
    *((void *)&v14 + 1),
    v11,
    v12);
  return a1;
}

uint64_t sub_257B41144(uint64_t a1)
{
  uint64_t v54 = *(void *)(a1 + 704);
  uint64_t v2 = *(void *)(a1 + 712);
  uint64_t v3 = *(void *)(a1 + 720);
  uint64_t v4 = *(void *)(a1 + 728);
  uint64_t v5 = *(void *)(a1 + 736);
  uint64_t v6 = *(void *)(a1 + 744);
  uint64_t v7 = *(void *)(a1 + 752);
  uint64_t v8 = *(void *)(a1 + 760);
  long long v53 = *(_OWORD *)(a1 + 768);
  long long v52 = *(_OWORD *)(a1 + 784);
  long long v51 = *(_OWORD *)(a1 + 800);
  long long v50 = *(_OWORD *)(a1 + 816);
  long long v49 = *(_OWORD *)(a1 + 832);
  long long v48 = *(_OWORD *)(a1 + 848);
  long long v47 = *(_OWORD *)(a1 + 864);
  long long v46 = *(_OWORD *)(a1 + 880);
  long long v45 = *(_OWORD *)(a1 + 896);
  long long v44 = *(_OWORD *)(a1 + 912);
  long long v43 = *(_OWORD *)(a1 + 928);
  long long v42 = *(_OWORD *)(a1 + 944);
  long long v41 = *(_OWORD *)(a1 + 960);
  long long v40 = *(_OWORD *)(a1 + 976);
  long long v39 = *(_OWORD *)(a1 + 992);
  long long v38 = *(_OWORD *)(a1 + 1008);
  long long v37 = *(_OWORD *)(a1 + 1024);
  long long v36 = *(_OWORD *)(a1 + 1040);
  long long v35 = *(_OWORD *)(a1 + 1056);
  long long v34 = *(_OWORD *)(a1 + 1072);
  long long v33 = *(_OWORD *)(a1 + 1088);
  long long v32 = *(_OWORD *)(a1 + 1104);
  long long v31 = *(_OWORD *)(a1 + 1120);
  long long v30 = *(_OWORD *)(a1 + 1136);
  long long v29 = *(_OWORD *)(a1 + 1152);
  long long v28 = *(_OWORD *)(a1 + 1168);
  long long v27 = *(_OWORD *)(a1 + 1184);
  long long v26 = *(_OWORD *)(a1 + 1200);
  long long v24 = *(_OWORD *)(a1 + 464);
  long long v25 = *(_OWORD *)(a1 + 480);
  long long v22 = *(_OWORD *)(a1 + 432);
  long long v23 = *(_OWORD *)(a1 + 448);
  long long v20 = *(_OWORD *)(a1 + 400);
  long long v21 = *(_OWORD *)(a1 + 416);
  long long v18 = *(_OWORD *)(a1 + 368);
  long long v19 = *(_OWORD *)(a1 + 384);
  long long v16 = *(_OWORD *)(a1 + 336);
  long long v17 = *(_OWORD *)(a1 + 352);
  long long v14 = *(_OWORD *)(a1 + 304);
  long long v15 = *(_OWORD *)(a1 + 320);
  long long v12 = *(_OWORD *)(a1 + 272);
  long long v13 = *(_OWORD *)(a1 + 288);
  long long v10 = *(_OWORD *)(a1 + 240);
  long long v11 = *(_OWORD *)(a1 + 256);
  sub_2578D6E98(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v10,
    *((uint64_t *)&v10 + 1),
    v11,
    *((uint64_t *)&v11 + 1),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((unint64_t *)&v15 + 1),
    v16,
    *((uint64_t *)&v16 + 1),
    v17,
    *((uint64_t *)&v17 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    *(void *)(a1 + 496));
  sub_2578D6E98(v54, v2, v3, v4, v5, v6, v7, v8, v53, *((uint64_t *)&v53 + 1), v52, *((uint64_t *)&v52 + 1), v51, *((uint64_t *)&v51 + 1), v50, *((uint64_t *)&v50 + 1), v49, *((uint64_t *)&v49 + 1), v48,
    *((unint64_t *)&v48 + 1),
    v47,
    *((uint64_t *)&v47 + 1),
    v46,
    *((uint64_t *)&v46 + 1),
    v45,
    *((uint64_t *)&v45 + 1),
    v44,
    *((uint64_t *)&v44 + 1),
    v43,
    *((uint64_t *)&v43 + 1),
    v42,
    *((uint64_t *)&v42 + 1),
    v41,
    *((uint64_t *)&v41 + 1),
    v40,
    *((uint64_t *)&v40 + 1),
    v39,
    *((uint64_t *)&v39 + 1),
    v38,
    *((uint64_t *)&v38 + 1),
    v37,
    *((unint64_t *)&v37 + 1),
    v36,
    *((uint64_t *)&v36 + 1),
    v35,
    *((uint64_t *)&v35 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v30,
    *((uint64_t *)&v30 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v26);
  return a1;
}

uint64_t Optional<A>.merging(with:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  uint64_t v5 = *(void *)(result + 16);
  char v6 = *(unsigned char *)(result + 24);
  char v7 = *(unsigned char *)(result + 25);
  if ((*((unsigned char *)v2 + 25) & 1) == 0)
  {
    unint64_t result = (v2[3] & 1) != 0;
    if (v4) {
      uint64_t v3 = *v2;
    }
    uint64_t v4 = v4 & ((v2[1] & 1) != 0);
    int v8 = v6 & 1;
    if (v8) {
      uint64_t v5 = v2[2];
    }
    char v6 = v8 & result;
    if (v7)
    {
      uint64_t v3 = *v2;
      uint64_t v4 = v2[1] & 1;
      uint64_t v5 = v2[2];
      char v6 = v2[3] & 1;
    }
    char v7 = 0;
  }
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(unsigned char *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 25) = v7;
  return result;
}

NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Count __swiftcall PrimaryElectionHeaderTemplateProperties.Count.init(count:)(NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Count count)
{
  v1->count = count.count;
  return count;
}

NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Percentage __swiftcall PrimaryElectionHeaderTemplateProperties.Percentage.init(percentage:)(NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Percentage percentage)
{
  v1->percentage = percentage.percentage;
  return percentage;
}

void PrimaryElectionHeaderTemplateProperties.reporting.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t PrimaryElectionHeaderTemplateProperties.reporting.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = v2;
  return result;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.reporting.modify())(void, void)
{
  return nullsub_1;
}

double PrimaryElectionHeaderTemplateProperties.Percentage.percentage.getter()
{
  return *(double *)v0;
}

void PrimaryElectionHeaderTemplateProperties.Percentage.percentage.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.Percentage.percentage.modify())(void, void)
{
  return nullsub_1;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.hash(into:)()
{
  return sub_257B45D30();
}

BOOL static PrimaryElectionHeaderTemplateProperties.Percentage.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_257B41694()
{
  return 0x61746E6563726570;
}

uint64_t sub_257B416B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x61746E6563726570 && a2 == 0xEA00000000006567)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_257B45BA0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_257B41754(uint64_t a1)
{
  unint64_t v2 = sub_257B42304();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_257B41790(uint64_t a1)
{
  unint64_t v2 = sub_257B42304();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035FE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42304();
  sub_257B45DF0();
  sub_257B45AE0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.hashValue.getter()
{
  return sub_257B45D40();
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035FF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42304();
  sub_257B45DC0();
  if (!v2)
  {
    sub_257B45A00();
    uint64_t v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_257B41AA4()
{
  return sub_257B45D40();
}

uint64_t sub_257B41AF0()
{
  return sub_257B45D30();
}

uint64_t sub_257B41B24()
{
  return sub_257B45D40();
}

uint64_t sub_257B41B6C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return PrimaryElectionHeaderTemplateProperties.Percentage.init(from:)(a1, a2);
}

uint64_t sub_257B41B84(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035FE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42304();
  sub_257B45DF0();
  sub_257B45AE0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL sub_257B41CB8(double *a1, double *a2)
{
  return *a1 == *a2;
}

void PrimaryElectionHeaderTemplateProperties.delegates.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 24);
  *(void *)a1 = *(void *)(v1 + 16);
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t PrimaryElectionHeaderTemplateProperties.delegates.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)(v1 + 16) = *(void *)result;
  *(unsigned char *)(v1 + 24) = v2;
  return result;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.delegates.modify())(void, void)
{
  return nullsub_1;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.count.getter()
{
  return *(void *)v0;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.count.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.Count.count.modify())(void, void)
{
  return nullsub_1;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.hash(into:)()
{
  return sub_257B45D00();
}

BOOL static PrimaryElectionHeaderTemplateProperties.Count.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_257B41D84()
{
  return 0x746E756F63;
}

uint64_t sub_257B41D98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_257B45BA0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_257B41E28(uint64_t a1)
{
  unint64_t v2 = sub_257B42358();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_257B41E64(uint64_t a1)
{
  unint64_t v2 = sub_257B42358();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035FF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42358();
  sub_257B45DF0();
  sub_257B45AF0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.hashValue.getter()
{
  return sub_257B45D40();
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A036008);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42358();
  sub_257B45DC0();
  if (!v2)
  {
    uint64_t v9 = sub_257B45A10();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_257B4216C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return PrimaryElectionHeaderTemplateProperties.Count.init(from:)(a1, a2);
}

uint64_t sub_257B42184(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A035FF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42358();
  sub_257B45DF0();
  sub_257B45AF0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties __swiftcall PrimaryElectionHeaderTemplateProperties.merging(with:)(NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties with)
{
  uint64_t v3 = (uint64_t *)(*(void *)&with.reporting.is_nil + 16);
  char v4 = *(unsigned char *)(*(void *)&with.reporting.is_nil + 24);
  char v5 = *(unsigned char *)(v2 + 24);
  if (*(unsigned char *)(*(void *)&with.reporting.is_nil + 8)) {
    uint64_t v6 = (uint64_t *)v2;
  }
  else {
    uint64_t v6 = *(uint64_t **)&with.reporting.is_nil;
  }
  uint64_t v7 = *v6;
  char v8 = *(unsigned char *)(*(void *)&with.reporting.is_nil + 8) & *(unsigned char *)(v2 + 8);
  if (*(unsigned char *)(*(void *)&with.reporting.is_nil + 24)) {
    uint64_t v3 = (uint64_t *)(v2 + 16);
  }
  uint64_t v9 = *v3;
  *(void *)uint64_t v1 = v7;
  *(unsigned char *)(v1 + 8) = v8;
  *(void *)(v1 + 16) = v9;
  *(unsigned char *)(v1 + 24) = v4 & v5;
  return with;
}

unint64_t sub_257B42304()
{
  unint64_t result = qword_26A035FE8;
  if (!qword_26A035FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A035FE8);
  }
  return result;
}

unint64_t sub_257B42358()
{
  unint64_t result = qword_26A036000;
  if (!qword_26A036000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036000);
  }
  return result;
}

uint64_t PrimaryElectionHeaderTemplateProperties.hash(into:)()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  if (*(unsigned char *)(v0 + 8) == 1)
  {
    sub_257B45D10();
    if (!v1)
    {
LABEL_3:
      sub_257B45D10();
      return sub_257B45D00();
    }
  }
  else
  {
    sub_257B45D10();
    sub_257B45D30();
    if (!v1) {
      goto LABEL_3;
    }
  }
  return sub_257B45D10();
}

uint64_t sub_257B42434()
{
  if (*v0) {
    return 0x65746167656C6564;
  }
  else {
    return 0x6E6974726F706572;
  }
}

uint64_t sub_257B42474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_257B43298(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_257B4249C(uint64_t a1)
{
  unint64_t v2 = sub_257B42A68();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_257B424D8(uint64_t a1)
{
  unint64_t v2 = sub_257B42A68();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PrimaryElectionHeaderTemplateProperties.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A036010);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  char v8 = *((unsigned char *)v1 + 8);
  v11[0] = v1[2];
  int v14 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42A68();
  sub_257B45DF0();
  uint64_t v12 = v7;
  char v13 = v8;
  char v15 = 0;
  sub_257B42ABC();
  uint64_t v9 = v11[1];
  sub_257B45AB0();
  if (!v9)
  {
    uint64_t v12 = v11[0];
    char v13 = v14;
    char v15 = 1;
    sub_257B42B10();
    sub_257B45AB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PrimaryElectionHeaderTemplateProperties.hashValue.getter()
{
  return sub_257B45D40();
}

uint64_t PrimaryElectionHeaderTemplateProperties.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A036030);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_257B42A68();
  sub_257B45DC0();
  if (!v2)
  {
    char v16 = 0;
    sub_257B42B64();
    sub_257B459D0();
    uint64_t v9 = v14;
    char v10 = v15;
    char v16 = 1;
    sub_257B42BB8();
    sub_257B459D0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v11 = v14;
    char v12 = v15;
    *(void *)a2 = v9;
    *(unsigned char *)(a2 + 8) = v10;
    *(void *)(a2 + 16) = v11;
    *(unsigned char *)(a2 + 24) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_257B42910()
{
  return sub_257B45D40();
}

uint64_t sub_257B42978()
{
  return sub_257B45D40();
}

uint64_t sub_257B429D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PrimaryElectionHeaderTemplateProperties.init(from:)(a1, a2);
}

uint64_t sub_257B429F0(void *a1)
{
  return PrimaryElectionHeaderTemplateProperties.encode(to:)(a1);
}

BOOL _s22NewsLiveActivitiesCore39PrimaryElectionHeaderTemplatePropertiesV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)a1 != *(double *)a2) {
      char v2 = 1;
    }
    if (v2) {
      return 0;
    }
  }
  if ((*(unsigned char *)(a1 + 24) & 1) == 0)
  {
    if (*(void *)(a1 + 16) == *(void *)(a2 + 16)) {
      char v4 = *(unsigned char *)(a2 + 24);
    }
    else {
      char v4 = 1;
    }
    return (v4 & 1) == 0;
  }
  return (*(unsigned char *)(a2 + 24) & 1) != 0;
}

unint64_t sub_257B42A68()
{
  unint64_t result = qword_26A036018;
  if (!qword_26A036018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036018);
  }
  return result;
}

unint64_t sub_257B42ABC()
{
  unint64_t result = qword_26A036020;
  if (!qword_26A036020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036020);
  }
  return result;
}

unint64_t sub_257B42B10()
{
  unint64_t result = qword_26A036028;
  if (!qword_26A036028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036028);
  }
  return result;
}

unint64_t sub_257B42B64()
{
  unint64_t result = qword_26A036038;
  if (!qword_26A036038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036038);
  }
  return result;
}

unint64_t sub_257B42BB8()
{
  unint64_t result = qword_26A036040;
  if (!qword_26A036040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036040);
  }
  return result;
}

unint64_t sub_257B42C10()
{
  unint64_t result = qword_26A036048;
  if (!qword_26A036048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036048);
  }
  return result;
}

unint64_t sub_257B42C68()
{
  unint64_t result = qword_26A036050;
  if (!qword_26A036050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036050);
  }
  return result;
}

unint64_t sub_257B42CC0()
{
  unint64_t result = qword_26A036058;
  if (!qword_26A036058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036058);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PrimaryElectionHeaderTemplateProperties(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PrimaryElectionHeaderTemplateProperties(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Percentage()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Count()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Count;
}

unsigned char *storeEnumTagSinglePayload for PrimaryElectionHeaderTemplateProperties.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x257B42E60);
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

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.CodingKeys()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.CodingKeys;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys;
}

unsigned char *_s22NewsLiveActivitiesCore39PrimaryElectionHeaderTemplatePropertiesV5CountV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x257B42F48);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys;
}

unint64_t sub_257B42F84()
{
  unint64_t result = qword_26A036060;
  if (!qword_26A036060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036060);
  }
  return result;
}

unint64_t sub_257B42FDC()
{
  unint64_t result = qword_26A036068;
  if (!qword_26A036068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036068);
  }
  return result;
}

unint64_t sub_257B43034()
{
  unint64_t result = qword_26A036070;
  if (!qword_26A036070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036070);
  }
  return result;
}

unint64_t sub_257B4308C()
{
  unint64_t result = qword_26A036078;
  if (!qword_26A036078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036078);
  }
  return result;
}

unint64_t sub_257B430E4()
{
  unint64_t result = qword_26A036080;
  if (!qword_26A036080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036080);
  }
  return result;
}

unint64_t sub_257B4313C()
{
  unint64_t result = qword_26A036088;
  if (!qword_26A036088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036088);
  }
  return result;
}

unint64_t sub_257B43194()
{
  unint64_t result = qword_26A036090;
  if (!qword_26A036090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036090);
  }
  return result;
}

unint64_t sub_257B431EC()
{
  unint64_t result = qword_26A036098;
  if (!qword_26A036098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A036098);
  }
  return result;
}

unint64_t sub_257B43244()
{
  unint64_t result = qword_26A0360A0;
  if (!qword_26A0360A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0360A0);
  }
  return result;
}

uint64_t sub_257B43298(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6974726F706572 && a2 == 0xE900000000000067;
  if (v2 || (sub_257B45BA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746167656C6564 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_257B45BA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_257B433A0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_257B433B0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_257B433C0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_257B433D0()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_257B433E0()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_257B433F0()
{
  return MEMORY[0x270EEDE48]();
}

uint64_t sub_257B43400()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_257B43410()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_257B43420()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_257B43430()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_257B43440()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_257B43450()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_257B43460()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_257B43470()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_257B43480()
{
  return MEMORY[0x270EEE468]();
}

uint64_t sub_257B43490()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_257B434A0()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_257B434B0()
{
  return MEMORY[0x270EEE4F8]();
}

uint64_t sub_257B434C0()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_257B434D0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_257B434E0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_257B434F0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_257B43500()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_257B43510()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_257B43520()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_257B43530()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_257B43540()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_257B43550()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_257B43560()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_257B43570()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_257B43580()
{
  return MEMORY[0x270EEF978]();
}

uint64_t sub_257B43590()
{
  return MEMORY[0x270EEF998]();
}

uint64_t sub_257B435A0()
{
  return MEMORY[0x270EEFB10]();
}

uint64_t sub_257B435B0()
{
  return MEMORY[0x270EEFB28]();
}

uint64_t sub_257B435C0()
{
  return MEMORY[0x270EEFBB0]();
}

uint64_t sub_257B435D0()
{
  return MEMORY[0x270F79E48]();
}

uint64_t sub_257B435E0()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_257B435F0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_257B43600()
{
  return MEMORY[0x270EEFC20]();
}

uint64_t sub_257B43610()
{
  return MEMORY[0x270EEFC28]();
}

uint64_t sub_257B43620()
{
  return MEMORY[0x270EEFC30]();
}

uint64_t sub_257B43630()
{
  return MEMORY[0x270EEFC38]();
}

uint64_t sub_257B43640()
{
  return MEMORY[0x270EEFC40]();
}

uint64_t sub_257B43650()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_257B43660()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_257B43670()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_257B43680()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_257B43690()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_257B436A0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_257B436B0()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_257B436C0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_257B436D0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_257B436E0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_257B436F0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_257B43700()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_257B43710()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_257B43720()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_257B43730()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_257B43740()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_257B43750()
{
  return MEMORY[0x270EEFF78]();
}

uint64_t sub_257B43760()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_257B43770()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_257B43780()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_257B43790()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_257B437A0()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_257B437B0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_257B437C0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_257B437D0()
{
  return MEMORY[0x270EF0300]();
}

uint64_t sub_257B437E0()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_257B437F0()
{
  return MEMORY[0x270EF0330]();
}

uint64_t sub_257B43800()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_257B43810()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_257B43820()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_257B43830()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_257B43840()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_257B43850()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_257B43860()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_257B43870()
{
  return MEMORY[0x270EF0C00]();
}

uint64_t sub_257B43880()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_257B43890()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_257B438A0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_257B438B0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_257B438C0()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_257B438D0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_257B438E0()
{
  return MEMORY[0x270F4F0C0]();
}

uint64_t sub_257B438F0()
{
  return MEMORY[0x270F4F0C8]();
}

uint64_t sub_257B43900()
{
  return MEMORY[0x270F4F0D0]();
}

uint64_t sub_257B43910()
{
  return MEMORY[0x270F4F0D8]();
}

uint64_t sub_257B43920()
{
  return MEMORY[0x270F4F0E0]();
}

uint64_t sub_257B43930()
{
  return MEMORY[0x270F4F0E8]();
}

uint64_t sub_257B43940()
{
  return MEMORY[0x270F4F0F0]();
}

uint64_t sub_257B43950()
{
  return MEMORY[0x270F4F0F8]();
}

uint64_t sub_257B43960()
{
  return MEMORY[0x270F4F100]();
}

uint64_t sub_257B43970()
{
  return MEMORY[0x270F4F108]();
}

uint64_t sub_257B43980()
{
  return MEMORY[0x270F4F110]();
}

uint64_t sub_257B43990()
{
  return MEMORY[0x270F4F118]();
}

uint64_t sub_257B439A0()
{
  return MEMORY[0x270F4F120]();
}

uint64_t sub_257B439B0()
{
  return MEMORY[0x270F4F128]();
}

uint64_t sub_257B439C0()
{
  return MEMORY[0x270F4F130]();
}

uint64_t sub_257B439D0()
{
  return MEMORY[0x270F4F138]();
}

uint64_t sub_257B439E0()
{
  return MEMORY[0x270F4F140]();
}

uint64_t sub_257B439F0()
{
  return MEMORY[0x270F4F148]();
}

uint64_t sub_257B43A00()
{
  return MEMORY[0x270F4F150]();
}

uint64_t sub_257B43A10()
{
  return MEMORY[0x270F4F158]();
}

uint64_t sub_257B43A20()
{
  return MEMORY[0x270EE0698]();
}

uint64_t sub_257B43A30()
{
  return MEMORY[0x270EE06A0]();
}

uint64_t sub_257B43A40()
{
  return MEMORY[0x270EE06A8]();
}

uint64_t sub_257B43A50()
{
  return MEMORY[0x270EE06B0]();
}

uint64_t sub_257B43A60()
{
  return MEMORY[0x270EE06B8]();
}

uint64_t sub_257B43A70()
{
  return MEMORY[0x270EE06C0]();
}

uint64_t sub_257B43A80()
{
  return MEMORY[0x270EE06C8]();
}

uint64_t sub_257B43A90()
{
  return MEMORY[0x270EE06D0]();
}

uint64_t sub_257B43AA0()
{
  return MEMORY[0x270EE06D8]();
}

uint64_t sub_257B43AB0()
{
  return MEMORY[0x270EE06E0]();
}

uint64_t sub_257B43AC0()
{
  return MEMORY[0x270EE06E8]();
}

uint64_t sub_257B43AD0()
{
  return MEMORY[0x270EE06F0]();
}

uint64_t sub_257B43AE0()
{
  return MEMORY[0x270EE0700]();
}

uint64_t sub_257B43AF0()
{
  return MEMORY[0x270EE0740]();
}

uint64_t sub_257B43B00()
{
  return MEMORY[0x270EE0768]();
}

uint64_t sub_257B43B10()
{
  return MEMORY[0x270EE0770]();
}

uint64_t sub_257B43B20()
{
  return MEMORY[0x270EE0778]();
}

uint64_t sub_257B43B30()
{
  return MEMORY[0x270EE0780]();
}

uint64_t sub_257B43B40()
{
  return MEMORY[0x270EE0788]();
}

uint64_t sub_257B43B50()
{
  return MEMORY[0x270EE0790]();
}

uint64_t sub_257B43B60()
{
  return MEMORY[0x270EE0798]();
}

uint64_t sub_257B43B70()
{
  return MEMORY[0x270EE07A0]();
}

uint64_t sub_257B43B80()
{
  return MEMORY[0x270EE07B0]();
}

uint64_t sub_257B43B90()
{
  return MEMORY[0x270EE07C8]();
}

uint64_t sub_257B43BA0()
{
  return MEMORY[0x270EE07D0]();
}

uint64_t sub_257B43BB0()
{
  return MEMORY[0x270EE07D8]();
}

uint64_t sub_257B43BC0()
{
  return MEMORY[0x270EE0800]();
}

uint64_t sub_257B43BD0()
{
  return MEMORY[0x270EE0818]();
}

uint64_t sub_257B43BE0()
{
  return MEMORY[0x270EE0820]();
}

uint64_t sub_257B43BF0()
{
  return MEMORY[0x270EE0828]();
}

uint64_t sub_257B43C00()
{
  return MEMORY[0x270EE0830]();
}

uint64_t sub_257B43C10()
{
  return MEMORY[0x270EE0838]();
}

uint64_t sub_257B43C20()
{
  return MEMORY[0x270EE0840]();
}

uint64_t sub_257B43C30()
{
  return MEMORY[0x270EE08F0]();
}

uint64_t sub_257B43C60()
{
  return MEMORY[0x270F7A890]();
}

uint64_t sub_257B43C80()
{
  return MEMORY[0x270F7A920]();
}

uint64_t sub_257B43C90()
{
  return MEMORY[0x270F7A928]();
}

uint64_t sub_257B43CA0()
{
  return MEMORY[0x270F7A970]();
}

uint64_t sub_257B43CB0()
{
  return MEMORY[0x270F7A978]();
}

uint64_t sub_257B43CC0()
{
  return MEMORY[0x270F7A988]();
}

uint64_t sub_257B43CD0()
{
  return MEMORY[0x270F7A990]();
}

uint64_t sub_257B43CE0()
{
  return MEMORY[0x270F7A998]();
}

uint64_t sub_257B43CF0()
{
  return MEMORY[0x270F7A9A0]();
}

uint64_t sub_257B43D00()
{
  return MEMORY[0x270F79ED8]();
}

uint64_t sub_257B43D10()
{
  return MEMORY[0x270F79F88]();
}

uint64_t sub_257B43D20()
{
  return MEMORY[0x270F79F98]();
}

uint64_t sub_257B43D30()
{
  return MEMORY[0x270F79FA0]();
}

uint64_t sub_257B43D40()
{
  return MEMORY[0x270F79FD0]();
}

uint64_t sub_257B43D50()
{
  return MEMORY[0x270F79FE0]();
}

uint64_t sub_257B43D60()
{
  return MEMORY[0x270F79FE8]();
}

uint64_t sub_257B43D70()
{
  return MEMORY[0x270F7A000]();
}

uint64_t sub_257B43D80()
{
  return MEMORY[0x270F7A008]();
}

uint64_t sub_257B43D90()
{
  return MEMORY[0x270F7A040]();
}

uint64_t sub_257B43DA0()
{
  return MEMORY[0x270F7A0C0]();
}

uint64_t sub_257B43DB0()
{
  return MEMORY[0x270F7A0C8]();
}

uint64_t sub_257B43DC0()
{
  return MEMORY[0x270F7A0D0]();
}

uint64_t sub_257B43DD0()
{
  return MEMORY[0x270F7A198]();
}

uint64_t sub_257B43DE0()
{
  return MEMORY[0x270F7A1A0]();
}

uint64_t sub_257B43DF0()
{
  return MEMORY[0x270F7A1A8]();
}

uint64_t sub_257B43E00()
{
  return MEMORY[0x270F7A1B0]();
}

uint64_t sub_257B43E10()
{
  return MEMORY[0x270F7A1F0]();
}

uint64_t sub_257B43E20()
{
  return MEMORY[0x270F7A1F8]();
}

uint64_t sub_257B43E30()
{
  return MEMORY[0x270F7A200]();
}

uint64_t sub_257B43E40()
{
  return MEMORY[0x270F7A338]();
}

uint64_t sub_257B43E50()
{
  return MEMORY[0x270F7A340]();
}

uint64_t sub_257B43E60()
{
  return MEMORY[0x270F7A348]();
}

uint64_t sub_257B43E70()
{
  return MEMORY[0x270F7A390]();
}

uint64_t sub_257B43E80()
{
  return MEMORY[0x270F7A3A0]();
}

uint64_t sub_257B43E90()
{
  return MEMORY[0x270F7A3C0]();
}

uint64_t sub_257B43EA0()
{
  return MEMORY[0x270F7A420]();
}

uint64_t sub_257B43EB0()
{
  return MEMORY[0x270F7A428]();
}

uint64_t sub_257B43EC0()
{
  return MEMORY[0x270F7A480]();
}

uint64_t sub_257B43ED0()
{
  return MEMORY[0x270F7A488]();
}

uint64_t sub_257B43EE0()
{
  return MEMORY[0x270F7A498]();
}

uint64_t sub_257B43EF0()
{
  return MEMORY[0x270F7A4E8]();
}

uint64_t sub_257B43F00()
{
  return MEMORY[0x270F7A4F8]();
}

uint64_t sub_257B43F10()
{
  return MEMORY[0x270F7A520]();
}

uint64_t sub_257B43F20()
{
  return MEMORY[0x270F7A530]();
}

uint64_t sub_257B43F30()
{
  return MEMORY[0x270F7A538]();
}

uint64_t sub_257B43F40()
{
  return MEMORY[0x270F7A550]();
}

uint64_t sub_257B43F50()
{
  return MEMORY[0x270F7A558]();
}

uint64_t sub_257B43F60()
{
  return MEMORY[0x270F7A560]();
}

uint64_t sub_257B43F70()
{
  return MEMORY[0x270F7A580]();
}

uint64_t sub_257B43F90()
{
  return MEMORY[0x270F7A600]();
}

uint64_t sub_257B43FA0()
{
  return MEMORY[0x270F7A610]();
}

uint64_t sub_257B43FB0()
{
  return MEMORY[0x270F7A650]();
}

uint64_t sub_257B43FC0()
{
  return MEMORY[0x270F7A6E0]();
}

uint64_t sub_257B43FD0()
{
  return MEMORY[0x270F7A6E8]();
}

uint64_t sub_257B43FE0()
{
  return MEMORY[0x270F7A6F0]();
}

uint64_t sub_257B43FF0()
{
  return MEMORY[0x270F7A728]();
}

uint64_t sub_257B44000()
{
  return MEMORY[0x270F7A730]();
}

uint64_t sub_257B44010()
{
  return MEMORY[0x270F7A738]();
}

uint64_t sub_257B44020()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_257B44030()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_257B44040()
{
  return MEMORY[0x270FA2AB8]();
}

uint64_t sub_257B44050()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_257B44060()
{
  return MEMORY[0x270F4F160]();
}

uint64_t sub_257B44070()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_257B44080()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_257B44090()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_257B440A0()
{
  return MEMORY[0x270F79E20]();
}

uint64_t sub_257B440B0()
{
  return MEMORY[0x270F79E28]();
}

uint64_t sub_257B440C0()
{
  return MEMORY[0x270F79E30]();
}

uint64_t sub_257B440D0()
{
  return MEMORY[0x270F79E38]();
}

uint64_t sub_257B440E0()
{
  return MEMORY[0x270F79E40]();
}

uint64_t sub_257B440F0()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_257B44100()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_257B44110()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_257B44120()
{
  return MEMORY[0x270EFEE28]();
}

uint64_t sub_257B44130()
{
  return MEMORY[0x270EFEE40]();
}

uint64_t sub_257B44150()
{
  return MEMORY[0x270EFEEA0]();
}

uint64_t sub_257B44160()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_257B44170()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_257B44180()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_257B44190()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_257B441A0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_257B441B0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_257B441C0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_257B441D0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_257B441E0()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_257B441F0()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_257B44200()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_257B44210()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_257B44220()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_257B44240()
{
  return MEMORY[0x270EFFA18]();
}

uint64_t sub_257B44250()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_257B44260()
{
  return MEMORY[0x270EFFAA0]();
}

uint64_t sub_257B44270()
{
  return MEMORY[0x270EFFAA8]();
}

uint64_t sub_257B44280()
{
  return MEMORY[0x270EFFBE8]();
}

uint64_t sub_257B44290()
{
  return MEMORY[0x270EFFBF0]();
}

uint64_t sub_257B442A0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_257B442B0()
{
  return MEMORY[0x270F000C8]();
}

uint64_t sub_257B442C0()
{
  return MEMORY[0x270F000E8]();
}

uint64_t sub_257B442D0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_257B442E0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_257B442F0()
{
  return MEMORY[0x270F00770]();
}

uint64_t sub_257B44300()
{
  return MEMORY[0x270F00778]();
}

uint64_t sub_257B44310()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_257B44320()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_257B44330()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_257B44340()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_257B44350()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_257B44360()
{
  return MEMORY[0x270F00908]();
}

uint64_t sub_257B44370()
{
  return MEMORY[0x270F00910]();
}

uint64_t sub_257B44380()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_257B44390()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_257B443A0()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_257B443B0()
{
  return MEMORY[0x270F00B50]();
}

uint64_t sub_257B443C0()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_257B443D0()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_257B443E0()
{
  return MEMORY[0x270F00BA8]();
}

uint64_t sub_257B443F0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_257B44400()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_257B44410()
{
  return MEMORY[0x270F073A0]();
}

uint64_t sub_257B44420()
{
  return MEMORY[0x270F073A8]();
}

uint64_t sub_257B44430()
{
  return MEMORY[0x270F073E8]();
}

uint64_t sub_257B44440()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_257B44450()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_257B44460()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_257B44470()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_257B44480()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_257B44490()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_257B444A0()
{
  return MEMORY[0x270F00FA0]();
}

uint64_t sub_257B444B0()
{
  return MEMORY[0x270F00FA8]();
}

uint64_t sub_257B444C0()
{
  return MEMORY[0x270F01028]();
}

uint64_t sub_257B444D0()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_257B444E0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_257B444F0()
{
  return MEMORY[0x270F01210]();
}

uint64_t sub_257B44500()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_257B44510()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_257B44520()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_257B44530()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_257B44540()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_257B44550()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_257B44560()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_257B44570()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_257B44580()
{
  return MEMORY[0x270F01490]();
}

uint64_t sub_257B44590()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_257B445A0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_257B445B0()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_257B445D0()
{
  return MEMORY[0x270F07418]();
}

uint64_t sub_257B445E0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_257B445F0()
{
  return MEMORY[0x270F01D10]();
}

uint64_t sub_257B44600()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_257B44610()
{
  return MEMORY[0x270F01D28]();
}

uint64_t sub_257B44620()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_257B44630()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_257B44640()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_257B44650()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_257B44660()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_257B44670()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_257B44680()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_257B44690()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_257B446A0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_257B446B0()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_257B446C0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_257B446D0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_257B446E0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_257B446F0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_257B44700()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_257B44710()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_257B44720()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_257B44730()
{
  return MEMORY[0x270F02BB0]();
}

uint64_t sub_257B44740()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_257B44750()
{
  return MEMORY[0x270F02BC8]();
}

uint64_t sub_257B44760()
{
  return MEMORY[0x270F02BD0]();
}

uint64_t sub_257B44770()
{
  return MEMORY[0x270F02BE0]();
}

uint64_t sub_257B44780()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_257B44790()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_257B447A0()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_257B447B0()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_257B447C0()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_257B447D0()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_257B447E0()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_257B447F0()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_257B44800()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_257B44810()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_257B44820()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_257B44830()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_257B44840()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_257B44850()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_257B44860()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_257B44870()
{
  return MEMORY[0x270F02D38]();
}

uint64_t sub_257B44880()
{
  return MEMORY[0x270F02F18]();
}

uint64_t sub_257B44890()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_257B448A0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_257B448B0()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_257B448C0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_257B448D0()
{
  return MEMORY[0x270F03140]();
}

uint64_t sub_257B448E0()
{
  return MEMORY[0x270F03200]();
}

uint64_t sub_257B448F0()
{
  return MEMORY[0x270F03220]();
}

uint64_t sub_257B44900()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_257B44910()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_257B44920()
{
  return MEMORY[0x270F07440]();
}

uint64_t sub_257B44930()
{
  return MEMORY[0x270F07450]();
}

uint64_t sub_257B44940()
{
  return MEMORY[0x270F07458]();
}

uint64_t sub_257B44950()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_257B44960()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_257B44970()
{
  return MEMORY[0x270F03358]();
}

uint64_t sub_257B44980()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_257B44990()
{
  return MEMORY[0x270F03400]();
}

uint64_t sub_257B449A0()
{
  return MEMORY[0x270F03408]();
}

uint64_t sub_257B449B0()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_257B449C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_257B449D0()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_257B449E0()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_257B449F0()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_257B44A00()
{
  return MEMORY[0x270F039C0]();
}

uint64_t sub_257B44A10()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_257B44A20()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_257B44A30()
{
  return MEMORY[0x270F04258]();
}

uint64_t sub_257B44A50()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_257B44A60()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_257B44A70()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_257B44AB0()
{
  return MEMORY[0x270F04428]();
}

uint64_t sub_257B44AD0()
{
  return MEMORY[0x270F04440]();
}

uint64_t sub_257B44B10()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_257B44B30()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_257B44B80()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_257B44B90()
{
  return MEMORY[0x270F04508]();
}

uint64_t sub_257B44BA0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_257B44BB0()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_257B44BC0()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_257B44BD0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_257B44BE0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_257B44BF0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_257B44C00()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_257B44C10()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_257B44C20()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_257B44C30()
{
  return MEMORY[0x270F047B0]();
}

uint64_t sub_257B44C60()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_257B44C80()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_257B44CA0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_257B44CB0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_257B44CC0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_257B44CD0()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_257B44CE0()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_257B44CF0()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_257B44D00()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_257B44D10()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_257B44D20()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_257B44D30()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_257B44D40()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_257B44D50()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_257B44D60()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_257B44D70()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_257B44D80()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_257B44D90()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_257B44DA0()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_257B44DB0()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_257B44DC0()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_257B44DD0()
{
  return MEMORY[0x270F05370]();
}

uint64_t sub_257B44DE0()
{
  return MEMORY[0x270F05378]();
}

uint64_t sub_257B44DF0()
{
  return MEMORY[0x270F05380]();
}

uint64_t sub_257B44E00()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_257B44E10()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_257B44E20()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_257B44E30()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_257B44E40()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_257B44E50()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_257B44E60()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_257B44E70()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_257B44E80()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_257B44E90()
{
  return MEMORY[0x270F4EFA8]();
}

uint64_t sub_257B44EB0()
{
  return MEMORY[0x270F4EFB8]();
}

uint64_t sub_257B44EC0()
{
  return MEMORY[0x270F076B8]();
}

uint64_t sub_257B44ED0()
{
  return MEMORY[0x270F076C0]();
}

uint64_t sub_257B44EE0()
{
  return MEMORY[0x270F076C8]();
}

uint64_t sub_257B44EF0()
{
  return MEMORY[0x270F076D0]();
}

uint64_t sub_257B44F00()
{
  return MEMORY[0x270F076D8]();
}

uint64_t sub_257B44F10()
{
  return MEMORY[0x270F076F0]();
}

uint64_t sub_257B44F20()
{
  return MEMORY[0x270F07730]();
}

uint64_t sub_257B44F30()
{
  return MEMORY[0x270F07738]();
}

uint64_t sub_257B44F40()
{
  return MEMORY[0x270F07748]();
}

uint64_t sub_257B44F50()
{
  return MEMORY[0x270F07750]();
}

uint64_t sub_257B44F60()
{
  return MEMORY[0x270F07758]();
}

uint64_t sub_257B44F70()
{
  return MEMORY[0x270F077C0]();
}

uint64_t sub_257B44F80()
{
  return MEMORY[0x270F07948]();
}

uint64_t sub_257B44F90()
{
  return MEMORY[0x270F07950]();
}

uint64_t sub_257B44FA0()
{
  return MEMORY[0x270F07958]();
}

uint64_t sub_257B44FB0()
{
  return MEMORY[0x270F07960]();
}

uint64_t sub_257B44FC0()
{
  return MEMORY[0x270F07968]();
}

uint64_t sub_257B44FD0()
{
  return MEMORY[0x270F07970]();
}

uint64_t sub_257B44FE0()
{
  return MEMORY[0x270F079C8]();
}

uint64_t sub_257B44FF0()
{
  return MEMORY[0x270F079D0]();
}

uint64_t sub_257B45000()
{
  return MEMORY[0x270F079D8]();
}

uint64_t sub_257B45010()
{
  return MEMORY[0x270F079E0]();
}

uint64_t sub_257B45020()
{
  return MEMORY[0x270EF1808]();
}

uint64_t sub_257B45030()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_257B45040()
{
  return MEMORY[0x270F7A790]();
}

uint64_t sub_257B45050()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_257B45060()
{
  return MEMORY[0x270F9D138]();
}

uint64_t sub_257B45070()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_257B45080()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_257B45090()
{
  return MEMORY[0x270FA2B78]();
}

uint64_t sub_257B450A0()
{
  return MEMORY[0x270F9D468]();
}

uint64_t sub_257B450B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_257B450C0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_257B450D0()
{
  return MEMORY[0x270EF1860]();
}

uint64_t sub_257B450E0()
{
  return MEMORY[0x270EF1868]();
}

uint64_t sub_257B450F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_257B45100()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_257B45110()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_257B45120()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_257B45130()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_257B45140()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_257B45150()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_257B45160()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_257B45170()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_257B45180()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_257B45190()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_257B451A0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_257B451B0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_257B451C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_257B451D0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_257B451E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_257B451F0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_257B45200()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_257B45210()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_257B45220()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_257B45230()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_257B45270()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_257B45280()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_257B45290()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_257B452A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_257B452B0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_257B452C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_257B452D0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_257B452E0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_257B452F0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_257B45300()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_257B45310()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_257B45320()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_257B45330()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_257B45340()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_257B45350()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_257B45360()
{
  return MEMORY[0x270F9DCE0]();
}

uint64_t sub_257B45370()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_257B45380()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_257B45390()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_257B453A0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_257B453B0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_257B453C0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_257B453D0()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_257B45400()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_257B45410()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_257B45420()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_257B45430()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_257B45440()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_257B45450()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_257B45460()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_257B45470()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_257B454A0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_257B454B0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_257B454C0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_257B454E0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_257B454F0()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_257B45500()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_257B45510()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_257B45530()
{
  return MEMORY[0x270EF1CF0]();
}

uint64_t sub_257B45540()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_257B45550()
{
  return MEMORY[0x270EF1D08]();
}

uint64_t sub_257B45570()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_257B45580()
{
  return MEMORY[0x270FA2BC0]();
}

uint64_t sub_257B45590()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_257B455A0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_257B455B0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_257B455C0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_257B455D0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_257B455E0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_257B455F0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_257B45600()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_257B45610()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_257B45620()
{
  return MEMORY[0x270EF2390]();
}

uint64_t sub_257B45630()
{
  return MEMORY[0x270EF23A0]();
}

uint64_t sub_257B45640()
{
  return MEMORY[0x270EF23A8]();
}

uint64_t sub_257B45650()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_257B45660()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_257B45670()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_257B45680()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_257B45690()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_257B456A0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_257B456B0()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_257B456C0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_257B456E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_257B456F0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_257B45700()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_257B45710()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_257B45720()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_257B45730()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_257B45740()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_257B45750()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_257B45760()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_257B45770()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_257B45780()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_257B45790()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_257B457A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_257B457B0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_257B457C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_257B457D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_257B457E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_257B45800()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_257B45810()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_257B45820()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_257B45830()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_257B45840()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_257B45850()
{
  return MEMORY[0x270FA2188]();
}

uint64_t sub_257B45860()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_257B45870()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_257B45880()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_257B45890()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_257B458A0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_257B458B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_257B458C0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_257B458D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_257B458E0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_257B458F0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_257B45900()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_257B45910()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_257B45920()
{
  return MEMORY[0x270F9F0F8]();
}

uint64_t sub_257B45930()
{
  return MEMORY[0x270F9F110]();
}

uint64_t sub_257B45940()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_257B45950()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_257B45960()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_257B45970()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_257B45980()
{
  return MEMORY[0x270F7A850]();
}

uint64_t sub_257B45990()
{
  return MEMORY[0x270F7A860]();
}

uint64_t sub_257B459A0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_257B459B0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_257B459C0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_257B459D0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_257B459E0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_257B459F0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_257B45A00()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_257B45A10()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_257B45A20()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_257B45A30()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_257B45A40()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_257B45A50()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_257B45A60()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_257B45A70()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_257B45A80()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_257B45A90()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_257B45AA0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_257B45AB0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_257B45AC0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_257B45AD0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_257B45AE0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_257B45AF0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_257B45B00()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_257B45B10()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_257B45B20()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_257B45B30()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_257B45B40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_257B45B60()
{
  return MEMORY[0x270F9F558]();
}

uint64_t sub_257B45B70()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_257B45B80()
{
  return MEMORY[0x270F9F628]();
}

uint64_t sub_257B45B90()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_257B45BA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_257B45BB0()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_257B45BC0()
{
  return MEMORY[0x270F9F808]();
}

uint64_t sub_257B45BD0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_257B45BE0()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_257B45BF0()
{
  return MEMORY[0x270F9F898]();
}

uint64_t sub_257B45C00()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_257B45C10()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_257B45C30()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_257B45C50()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_257B45C60()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_257B45C70()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_257B45C80()
{
  return MEMORY[0x270F9FB20]();
}

uint64_t sub_257B45C90()
{
  return MEMORY[0x270F9FB28]();
}

uint64_t sub_257B45CA0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_257B45CB0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_257B45CC0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_257B45CD0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_257B45CF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_257B45D00()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_257B45D10()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_257B45D20()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_257B45D30()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_257B45D40()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_257B45D50()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_257B45D60()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t sub_257B45D70()
{
  return MEMORY[0x270F9FCC8]();
}

uint64_t sub_257B45D80()
{
  return MEMORY[0x270F9FCE8]();
}

uint64_t sub_257B45D90()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_257B45DA0()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_257B45DB0()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_257B45DC0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_257B45DD0()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_257B45DE0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_257B45DF0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_257B45E00()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t sub_257B45E10()
{
  return MEMORY[0x270F9FFA8]();
}

uint64_t sub_257B45E20()
{
  return MEMORY[0x270F9FFC8]();
}

uint64_t sub_257B45E30()
{
  return MEMORY[0x270F9FFE0]();
}

uint64_t sub_257B45E40()
{
  return MEMORY[0x270FA0090]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceSupportsAlwaysOnTime()
{
  return MEMORY[0x270F96108]();
}

uint64_t MobileGestalt_get_mainScreenScale()
{
  return MEMORY[0x270F96168]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x270EDA110](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}